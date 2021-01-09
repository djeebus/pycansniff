import click
import enum

# usage:
#  - seats --passenger=heat-3 3 --driver=off


class Mode(enum.Enum):
    off = 'off'
    heat_1 = 'heat-1'
    heat_2 = 'heat-2'
    heat_3 = 'heat-3'
    cool_1 = 'cool-1'
    cool_2 = 'cool-2'
    cool_3 = 'cool-3'


@click.command()
@click.argument('device')
@click.option('--passenger', type=click.Choice([e.value for e in Mode]), default=Mode.off.value)
@click.option('--driver', type=click.Choice([e.value for e in Mode]), default=Mode.off.value)
def cli(device, passenger, driver):
    driver = Mode(driver)
    passenger = Mode(passenger)
    print('passenger: ', passenger)
    print('driver: ', driver)

    cmd2 = build_mode_command(driver, passenger)
    print(cmd2)


def build_mode_command(driver, passenger):
    """
    1st byte == 09 for driver cooler, 0C for driver warmer, 00 == off
    2nd byte == 09 for passenger cooler, 0C for passenger warmer 00 == off
    3rd byte == 3=3C, 2=2C, 1=24, 0=00
    4th byte == 3=3C, 2=2C, 1=24, 0=00
    """

    data = {
        Mode.off: (0, 0),
        Mode.cool_1: (0x9, 0x24),
        Mode.cool_2: (0x9, 0x2C),
        Mode.cool_3: (0x9, 0x3C),
        Mode.heat_1: (0xC, 0x24),
        Mode.heat_2: (0xC, 0x2C),
        Mode.heat_3: (0xC, 0x3C),
    }

    b1, b3 = data[driver]
    b2, b4 = data[passenger]
    cmd = bytes((b1, b2, b3, b4))
    return cmd.hex(' ').upper()


if __name__ == '__main__':
    cli()
