

def _genlen(val):
    if isinstance(val, (bytes, str)):
        return len(val)

    if isinstance(val, int):
        return len(str(val))

    raise NotImplementedError(type(val))


def _genrev(val):
    if isinstance(val, (bytes, str)):
        return '-'

    if isinstance(val, int):
        return ''

    raise NotImplementedError(type(val))


def generate_table(headers, rows) -> str:
    column_lens = [len(header) for header in headers]

    revs = [False for _ in headers]

    for row in rows:
        column_lens = [
            max(_genlen(val), count)
            for val, count in zip(row, column_lens)
        ]
        revs = [
            _genrev(val) for val in row
        ]

    fmt = ' '.join(('%' + ('-' if rev else '') + str(col_len) + 's'
                    for rev, col_len in zip(revs, column_lens)))

    lines = [
        fmt % tuple(headers),
        fmt % tuple(('-' * count for count in column_lens)),
    ]

    for row in rows:
        lines.append(fmt % row)

    return '\n'.join(lines)
