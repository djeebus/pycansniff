import click
import enum

from cansniff.elm327 import Elm327
from cansniff.sniffer import Sniffer

is_alive = True


class ScanMode(enum.Enum):
    BLACKLIST = False
    RECORD = True


@click.command()
@click.argument('serial')
@click.option('-b', '--blacklist', multiple=True)
@click.option('-w', '--whitelist', multiple=True)
def cli(serial, blacklist, whitelist):
    elm = Elm327(serial, baudrate='115200')

    for prefix in blacklist:
        elm.send_command(
            f'STFBA {prefix}, FFF'.encode('ascii'),
        )

    for prefix in whitelist:
        elm.send_command(
            f'STFPA {prefix}, FFF'.encode('ascii'),
        )

    sniffer = Sniffer(elm)
    sniffer.run()


if __name__ == '__main__':
    cli()
