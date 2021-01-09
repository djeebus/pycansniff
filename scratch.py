import collections

# Example header packet for Steering Wheel Switches:
# Hexadecimal:    0x10     0x0D     0x00     0x60
# Binary:       00010000 00001101 00000000 01100000
# Priority:        ---                                 3-bit
# Arbitration:        -- -------- ---                  13-bit
# Sending ECU:                       ----- --------    13-bit


def parse(p: bytes):
    pri = (p[0] & 0b00011100) >> 2
    arb_1 = (p[0] & 0b11) << 11
    arb_2 = p[1] << 3
    arb_3 = (p[2] & 0b11100000) >> 5
    ecu_1 = p[2] & 0b11111 << 8
    ecu_2 = p[3]
    return pri, arb_1 + arb_2 + arb_3, ecu_1 + ecu_2, p[4:]


def cli():
    lines = [
        '10 72 40 66 04 ',
        '10 72 20 40 09 00 3C 00 ',
        '10 72 40 66 00 ',
    ]
    # with open('gmlan.txt') as fp:
    #     lines = fp.readlines()

    counts = collections.defaultdict(int)
    for line in lines:
        line = line.strip()
        line = line.replace(' ', '')
        #
        try:
            data = bytes.fromhex(line)
        except ValueError as e:
            print('- failed to parse %s' % line)
            continue
        pri, arb, ecu, data = parse(data)
        print(pri, hex(arb), hex(ecu), '|', data.hex(' '))

        counts[arb] += 1

    items = list(counts.items())
    items = sorted(items, key=lambda i: i[0])
    for p, count in items:
        print(p, count)
    print(f'{len(counts)} arbitration IDs')


if __name__ == '__main__':
    cli()




#        1    0    7    2    4    0    6    6    0    4
#     0001 0000 0111 0010 0100 0000 0110 0110 0000 0100
# SOF    -                                              = 1
# ID       ---- ---- ---                                =
# RTR                   -
# IDE                     -
# Reserved                 -
# DLC                       -- --
# Data Field                     -- ---- ---- ---- --
