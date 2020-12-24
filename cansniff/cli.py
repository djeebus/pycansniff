import click

from cansniff.elm327 import Elm327
from cansniff.scanner import Scanner
from cansniff.sniffer import Sniffer

is_alive = True


@click.command()
@click.argument('serial')
@click.option('-b', '--blacklist', multiple=True)
@click.option('-w', '--whitelist', multiple=True)
@click.option('--reset', is_flag=True)
@click.option('--monitor', is_flag=True)
def cli(serial, blacklist, whitelist, reset, monitor):
    elm = Elm327(serial, baudrate='115200')
    if reset:
        elm.reset()

    for _ in range(1):
        try:
            elm.send_command(b'')
        except:
            pass
    elm.send_command(b'STFAC')  # clear all filters

    if whitelist:
        for prefix in whitelist:
            elm.send_command(
                f'STFFCA {prefix}, FFF'.encode('ascii'),
            )
            elm.send_command(
                f'STFPA {prefix}, FFF'.encode('ascii'),
            )

        elm.send_command(
            f'STFBA 7E8, 7F8'.encode('ascii'),
        )
    elif blacklist:
        for prefix in blacklist:
            elm.send_command(
                f'STFBA {prefix}, FFF'.encode('ascii'),
            )
    else:
        elm.send_command(b'STFPA 000, 000')  # add a global pass filter

    if monitor:
        scanner = Scanner(elm)
        for p in scanner.scan():
            print(p)
    else:
        elm.echo_input = False

        sniffer = Sniffer(elm)
        sniffer.run()


if __name__ == '__main__':
    cli()
