import collections


class PacketRepo:
    def __init__(self):
        self.packets = collections.defaultdict(int)

    def __iter__(self):
        yield from self.packets.items()

    def get_source_summary(self):
        totals = collections.defaultdict(int)
        types = collections.defaultdict(set)
        for packet, count in self.packets.items():
            source = packet.strip().split(b' ')[0]
            totals[source] += count
            types[source].add(packet)

        return [
            (source, totals[source], len(types[source]))
            for source in totals
        ]

    def remove(self, packet):
        if packet in self.packets:
            del self.packets[packet]

    def record(self, packet):
        self.packets[packet] += 1

    def __call__(self, packet):
        self.record(packet)
