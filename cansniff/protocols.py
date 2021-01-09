from cansniff.elm327 import Elm327
from cansniff.scanner import BufferFullError


class Protocol:
    def __init__(self, *, elm, blacklist, whitelist):
        self.elm = elm
        self.blacklist = blacklist
        self.whitelist = whitelist

    def setup(self):
        pass

    def monitor(self):
        while True:
            self.elm.write(b'STM')

            while True:
                packet = self.elm.read()
                if packet == Elm327.BUFFER_FULL:
                    self.elm.read_until(b'>')
                    raise BufferFullError()

                yield packet


# Example header packet for Steering Wheel Switches:
# Hexadecimal:    0x10     0x0D     0x00     0x60
# Binary:       00010000 00001101 00000000 01100000
# Priority:        ---                                 3-bit
# Arbitration:        -- -------- ---                  13-bit
# Sending ECU:                       ----- --------    13-bit


def parse_gmlan_packet(p: bytes):
    pri = (p[0] & 0b00011100) >> 2
    arb_1 = (p[0] & 0b11) << 11
    arb_2 = p[1] << 3
    arb_3 = (p[2] & 0b11100000) >> 5
    ecu_1 = p[2] & 0b11111 << 8
    ecu_2 = p[3]
    return pri, arb_1 + arb_2 + arb_3, ecu_1 + ecu_2, p[4:]


class GMLAN(Protocol):
    """Can only use STFPA and STFBA"""
    def setup(self):
        self.elm.send_command(b'STFAC')  # clear all filters

        if self.whitelist:
            for prefix in self.whitelist:
                self.elm.send_command(
                    f'STFPA {prefix}, FFFF'.encode('ascii'),
                )
        else:
            self.elm.send_command(b'STFPA 00, 00')  # add a global pass filter
            for prefix in self.blacklist:
                mask = 'F' * len(prefix)
                self.elm.send_command(
                    f'STFBA {prefix}, {mask}'.encode('ascii'),
                )

        self.elm.send_command(b'STPC')  # close current protocol
        self.elm.send_command(b'STP 61')  # ISO 11898, 11-bit Tx, 33.3kbps, var DLC
        # self.elm.send_command(b'STP 62')  # ISO 11898, 29-bit Tx, 33.3kbps, var DLC, dead
        # self.elm.send_command(b'STP 63')  # ISO 15765, 11-bit Tx, 33.3kbps, DLC=8, dead
        # self.elm.send_command(b'STP 64')  # ISO 15765, 29-bit Tx, 33.3kbps, DLC=8, dead
        self.elm.send_command(b'STPO')  # open current protocol

    def monitor(self):
        for p in super().monitor():
            yield p
            # try:
            #     pri, arb, ecu, data = parse_gmlan_packet(p)
            # except:
            #     print(f'- invalid packet: {p}')
            #     continue
            #
            # if self.whitelist and arb not in self.whitelist:
            #     continue
            # elif self.blacklist and arb in self.blacklist:
            #     continue
            #
            # yield f'{pri} {hex(arb)} {hex(ecu)} {data.hex()}'


class CAN(Protocol):
    def setup(self):
        self.elm.send_command(b'STFAC')  # clear all filters

        if self.whitelist:
            for prefix in self.whitelist:
                self.elm.send_command(
                    f'STFFCA {prefix}, FFF'.encode('ascii'),
                )
                self.elm.send_command(
                    f'STFPA {prefix}, FFF'.encode('ascii'),
                )

            self.elm.send_command(
                f'STFBA 7E8, 7F8'.encode('ascii'),
            )
        elif self.blacklist:
            for prefix in self.blacklist:
                self.elm.send_command(
                    f'STFBA {prefix}, FFF'.encode('ascii'),
                )
        else:
            # add a global pass filter
            self.elm.send_command(b'STFPA 000, 000')

    def monitor(self):
        for p in super().monitor():
            yield p.decode("ascii")
