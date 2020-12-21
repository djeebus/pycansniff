import click
import threading
import time
import traceback

from cansniff.cli import ScanMode
from cansniff.elm327 import Elm327
from cansniff.repo import PacketRepo
from cansniff.scanner import Scanner, BufferFullError
from cansniff.table import generate_table


class Sniffer:
    def __init__(self, elm: Elm327):
        self.elm = elm

        self.mode = ScanMode.BLACKLIST

        self._input_thread = threading.Thread(
            target=self._input,
            daemon=True,
        )
        self._monitor_thread = MonitorThread(self)
        self._reporting_thread = ReportingThread(self)

        self._all_packets = PacketRepo()
        self._bad_packets = PacketRepo()
        self._good_packets = PacketRepo()

        self._done = threading.Event()

    @property
    def is_running(self):
        return self._done.is_set() is False

    def run(self):
        self._monitor_thread.start()
        self._input_thread.start()
        self._reporting_thread.start()

        self._done.wait()

    def kill(self):
        self._done.set()

    def _input(self):
        while self.is_running:
            try:
                input()
                mode = ScanMode(not self.mode.value)
                print(f'switching to {mode.name} mode')
                self.mode = mode
            except KeyboardInterrupt:
                break

        self.kill()


class ReportingThread(threading.Thread):
    def __init__(self, sniffer: Sniffer):
        super().__init__(daemon=True)

        self.sniffer = sniffer

        self._reporters = {
            ScanMode.BLACKLIST: self._report_blacklist_summary,
            ScanMode.RECORD: self._report_good_packets,
        }

    def run(self) -> None:
        try:
            while self.sniffer.is_running:
                reporter = self._reporters[self.sniffer.mode]

                click.clear()
                reporter()

                time.sleep(1)
        except Exception:
            print_exception()
            self.sniffer.kill()

    def _report_blacklist_summary(self):
        summary = self.sniffer._bad_packets.get_source_summary()
        total_types = 0
        total_packets = 0
        for _, packet_count, packet_type_count in summary:
            total_packets += packet_count
            total_types += packet_type_count
        print(f'blocking a total of {total_types} unique packets \n'
              f' (from {total_packets} total packets)')

    def _report_good_packets(self):
        sorted_totals = sorted(
            self.sniffer._good_packets.packets.items(),
            key=lambda item: item[1],
            reverse=True,
        )

        headers = 'packet', 'total'
        rows = [(key, val) for key, val in sorted_totals]
        table = generate_table(headers, rows)

        click.echo(f'possible good packets ({len(rows)} total packets)')
        click.echo(table)


class MonitorThread(threading.Thread):
    def __init__(self, sniffer: Sniffer):
        super().__init__(daemon=True)

        self._scanner = Scanner(sniffer.elm)

        self.sniffer = sniffer

        self._middleware_by_mode = {
            ScanMode.BLACKLIST: [
                self.sniffer._all_packets,
                self.sniffer._bad_packets,
                self._remove_from_good_packets,
            ],
            ScanMode.RECORD: [
                self.sniffer._all_packets,
                self._add_good_packet_if_not_blacklisted,
            ],
        }

    @property
    def _middleware(self):
        middleware = self._middleware_by_mode[self.sniffer.mode]
        yield from middleware

    def _remove_from_good_packets(self, packet):
        self.sniffer._good_packets.remove(packet)

    def _add_good_packet_if_not_blacklisted(self, packet):
        if packet not in self.sniffer._bad_packets:
            self.sniffer._good_packets.record(packet)

    def _print_source_summary(self, *_):
        src_summary = self.sniffer._all_packets.get_source_summary()
        for hdr, sort_idx in [('total', 1), ('type', 2)]:
            click.echo(f'--- by {hdr} ---')
            rows = sorted(
                src_summary,
                key=lambda item: item[sort_idx],
                reverse=True,
            )

            headers = 'source', 'total', 'types'
            table = generate_table(headers, rows[:10])
            click.echo(table)

    def run(self) -> None:
        print('scanning ...')

        try:
            for p in self._scanner.scan():
                middleware = self._middleware_by_mode[self.sniffer.mode]
                for m in middleware:
                    m(p)
        except BufferFullError:
            print('--- buffer full! ---')
            self._print_source_summary()
        except Exception:
            print_exception()
        finally:
            self.sniffer.kill()


def print_exception():
    traceback.print_exc()
