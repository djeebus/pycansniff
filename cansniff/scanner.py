from cansniff.elm327 import Elm327


class BufferFullError(Exception):
    pass


class Scanner:
    def __init__(self, elm327: Elm327):
        self.elm327 = elm327

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
        yield from self._monitor()
