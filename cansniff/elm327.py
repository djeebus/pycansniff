import serial

MAX_PACKET_SIZE = 100


class InvalidCommandError(Exception):
    def __init__(self, command, response):
        self.command = command
        self.response = response


class Elm327:
    NEWLINE = b'\x0D'
    BUFFER_FULL = b'BUFFER FULL'

    def __init__(self, *args, **kwargs):
        self.echo_input = True

        self.s = serial.Serial(*args, **kwargs)

    def read_until(self, expected):
        while True:
            p = self.read()
            if p == expected:
                break
            if p == b'?':
                raise InvalidCommandError('', p)

    def reset(self):
        # self.write(b'')
        # try:
        #     self.read_until(b'>')
        # except InvalidCommandError:
        #     pass
        self.write(b'ATZ')   # reset
        self.read_until(b'>')

        self.write(b'ATE0')  # echo off
        self.read_until(b'>')
        self.send_command(b'ATL0')  # lines end in 0x0D
        self.send_command(b'ATH1')  # turn display of headers on (checksum, pci)
        self.send_command(b'ATS1')  # turn on print spaces
        self.send_command(b'ATAL')  # allow long (>7 byte) messages

    def read(self):
        packet = b''
        while len(packet) < MAX_PACKET_SIZE:
            c = self.s.read()
            if c == Elm327.NEWLINE:
                if not packet:
                    continue

                if self.echo_input:
                    print(f'<-- {packet}')
                return packet

            packet += c
            if packet == b'>':
                return packet

        raise Exception(f'packet too long! {packet}')

    def send_command(self, command: bytes):
        self.write(command)

        while True:
            response = self.read()
            if not response:
                continue

            if response == b'OK':
                continue

            if response == b'>':
                return

            raise Exception(f'invalid response: {response}')

        raise InvalidCommandError(command, response)

    def write(self, text: bytes):
        print(f'--> {text}')
        self.s.write(text)
        self.s.write(Elm327.NEWLINE)

    def close(self):
        self.s.close()
