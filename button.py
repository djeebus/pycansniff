import click
import time

# usage:
#   ./button passenger heat
#   ./button driver cool
from cansniff.elm327 import Elm327


@click.command()
@click.argument('device')
@click.argument('seat', type=click.Choice(['driver', 'passenger']))
@click.argument('mode', type=click.Choice(['heat', 'cool']))
@click.option('--reset', is_flag=True)
def cli(device, seat, mode, reset):
    on_cmd = on_cmds[(seat, mode)]
    off_cmd = 0x0

    elm = Elm327(device)
    if reset:
        elm.reset()

    elm.send_command(b'ATR 0')    # turn off responses
    elm.send_command(b'ATAL')     # allow messages > 8 bytes
    elm.send_command(b'STP 61')   # set protocol to gmlan, 11-bit
    elm.send_command(b'STCSWM 2')  # sw-can mode 3 (wake up)

    # send magic wake up packet (?)
    elm.send_command(b'ATSH 621')  # set header, magic wake up source?
    elm.send_command(b'01 FF FF FF FF 00 00 00')  # magic wake up packet?

    # send actual command
    elm.send_command(b'STCSWM 3')   # set protocol to gmlan, 29-bit
    elm.send_command(b'STP 62')     # maybe not necessary? seems weird

    elm.send_command(b'ATCP 00')  # set priority
    elm.send_command(b'ATSH 72 40 66')  # set header
    for cmd in (on_cmd, off_cmd):
        cmd = hex(cmd).replace('0x', '').zfill(2)
        elm.send_command(f'{cmd}'.encode('ascii'))
        time.sleep(.5)
    elm.send_command(b'STCSWM 0')  # reset. for ... reasons?


on_cmds = {
    ('driver', 'heat'): 0x1,
    ('driver', 'cool'): 0x4,
    ('passenger', 'heat'): 0x8,
    ('passenger', 'cool'): 0x20,
}


def build_command(cmd):
    return '10724066', bytes((cmd,)).hex().upper()


if __name__ == '__main__':
    cli()
