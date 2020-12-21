from cansniff.elm327 import Elm327


class BufferFullError(Exception):
    pass


class Scanner:
    def __init__(self, elm327: Elm327):
        self.elm327 = elm327

        self._setup()

    def _setup(self):
        # self.elm327.send_command('STFA')   # enable automatic filtering
        self.elm327.send_command(b'STFAC')  # clear all filters
        self.elm327.send_command(b'STFPA 000, 000')  # add a global pass filter
        pass

    def _monitor(self):
        while True:
            self.elm327.write(b'STM')

            while True:
                packet = self.elm327.read()
                if packet == Elm327.BUFFER_FULL:
                    self.elm327.read_until(b'>')
                    raise BufferFullError()

                yield packet

    def scan(self):
        self.elm327.echo_input = False
        yield from self._monitor()
