import click
import collections
import time

from cansniff.elm327 import Elm327
from cansniff.protocols import GMLAN, CAN
from cansniff.sniffer import Sniffer

is_alive = True


@click.command()
@click.argument('serial')
@click.option('-b', '--blacklist', multiple=True)
@click.option('-w', '--whitelist', multiple=True)
@click.option('--reset', is_flag=True)
@click.option('--monitor', is_flag=True)
@click.option('--gmlan', is_flag=True)
def cli(serial, reset, monitor, gmlan, **kwargs):
    elm = Elm327(serial, baudrate='115200')
    if reset:
        elm.reset()

    # for _ in range(1):
    #     try:
    #         elm.send_command(b'')
    #     except:
    #         pass

    if gmlan:
        protocol_cls = GMLAN
    else:
        protocol_cls = CAN

    protocol = protocol_cls(elm=elm, **kwargs)
    protocol.setup()

    click.echo('monitoring ...')

    try:
        start = time.time()
        elm.echo_input = False
        if monitor:
            packets = collections.defaultdict(int)
            for p in protocol.monitor():
                packets[tuple(p.split(b' ')[:2])] += 1
                print(f'{str(round(time.time() - start, 3)).zfill(8)}: {p}')
        else:
            sniffer = Sniffer(elm)
            sniffer.run()
    except KeyboardInterrupt:
        for item, count in packets.items():
            print(f'{item}\tx{count}')


if __name__ == '__main__':
    cli()
