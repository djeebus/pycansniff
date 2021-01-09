cansniff /dev/rfcomm0 \
    -b 4D9 \-b 4C5 -b 4D1 -b 4C1 \
    -b 0C1 -b 0C5 -b 1C8 -b 1E5 -b 0F1 \
    -b 0F9 -b 191 -b 1ED -b 1EB -b 0BE -b 0C9 -b 1EF -b 185 \
    -b 1C7 -b 1E9 -b 232 -b 321 -b 1A1 -b 1C3 -b 1C4 -b 1F5 \
    -b 451 -b 1E1 -b 1F3 \
    -b 1FC \
    -b 214 -b 2F9 -b 2C3 -b 348 \
    -b 2C3 \
    -b 3F9 \
    -b 34A -b 230 -b 1F1 -b 3D1 -b 2D3 -b 160 \
    -b 17D -b 234 -b 2F1 -b 3C9 -b 182 -b 3C1 -b 3D3 -b 3E9 \
    -b 216 -b 260 -b 261 -b 262 -b 263 -b 264 -b 265 -b 139 \
    -b 32A -b 3F1 -b 3FB -b 3ED -b 3F1 -b 137 -b 22A -b 135 \
    -b 12A -b 4C9 -b 324


1FC, 2C3, 3F9  = super chatty maybes



4D9:
  4D9 00 00 00    (one per second)
4C5
  4C5 00 00 00 00 00  (one per 1/2 second)
4D1
    4D1 00 7C 35 02 38 EE 00  every 1/2 second
4C1
    4C1 01 C4   every 1/2 second
0C1
    every 10 ms or so
    00003.15: b'0C1 00 00 00 00 00 00 00 00 ' (x79)
    00003.15: b'0C1 10 00 00 00 10 00 00 00 <DATA ERROR' (x79)
    00003.16: b'0C1 20 00 00 00 20 00 00 00 ' (x79)
    00003.16: b'0C1 30 00 00 ' (x79)
0C5
    every 10 ms or so
    00001.81: b'0C5 00 00 00 00 00 00 00 00 ' (x45)
    00001.82: b'0C5 10 00 00 00 10 00 00 00 <DATA ERROR' (x46)
    00001.83: b'0C5 20 00 00 00 20 00 00 00 ' (x46)
    00001.84: b'0C5 30 00 00 ' (x46)
1C8
    00003.78: b'1C8 03 FF 00 00 ' (x95)
    00003.80: b'1C8 43 FF 00 00 FF FF 3C 00 <DATA ERROR' (x95)
    00003.80: b'1C8 83 FF 00 00 FF FE 3B FF <DATA ERROR' (x95)
    00003.81: b'1C8 C3 FF 00 00 FF FD 3B FE <DATA ERROR' (x95)
1E5:
    00000.02: b'1E5 44 FF F4 70 02 00 02 E5 <DATA ERROR' (x1)
    00000.03: b'1E5 44 FF F4 1F FD 00 03 8F <DATA ERROR' (x1)
    00000.04: b'1E5 44 FF F4 30 02 00 02 A5 <DATA ERROR' (x1)
    00000.05: b'1E5 44 FF F4 5F FD 00 03 CF <DATA ERROR' (x1)
    00000.06: b'1E5 44 FF F4 70 00 00 02 E3 <DATA ERROR' (x1)
    00000.07: b'1E5 44 FF F4 10 02 00 02 85 <DATA ERROR' (x1)
    00000.08: b'1E5 44 FF F4 30 00 00 02 A3 <DATA ERROR' (x1)
    00000.09: b'1E5 44 FF F4 50 00 00 02 C3 <DATA ERROR' (x1)
    00000.11: b'1E5 44 FF F4 7F FD 00 03 EF <DATA ERROR' (x1)
    00000.12: b'1E5 44 FF F4 10 02 00 02 85 <DATA ERROR' (x2)
    00000.13: b'1E5 44 FF F4 3F FD 00 03 AF <DATA ERROR' (x1)
    00000.13: b'1E5 44 FF F4 50 00 00 02 C3 <DATA ERROR' (x2)
    00000.14: b'1E5 44 FF F4 70 00 00 02 E3 <DATA ERROR' (x2)
    00000.15: b'1E5 44 FF F4 10 02 00 02 85 <DATA ERROR' (x3)
    00000.16: b'1E5 44 FF F4 30 00 00 02 A3 <DATA ERROR' (x2)
    00000.17: b'1E5 44 FF F4 50 00 00 02 C3 <DATA ERROR' (x3)
    00000.18: b'1E5 44 FF F4 7F FD 00 03 EF <DATA ERROR' (x2)
    000000.2: b'1E5 44 FF F4 10 00 00 02 83 <DATA ERROR' (x1)
    00000.21: b'1E5 44 FF F4 30 00 00 02 A3 <DATA ERROR' (x3)
    00000.21: b'1E5 44 FF F4 50 02 00 02 C5 <DATA ERROR' (x1)
    00000.22: b'1E5 44 FF F4 7F FD 00 03 EF <DATA ERROR' (x3)
    00000.23: b'1E5 44 FF F3 1F FD 00 03 8E <DATA ERROR' (x1)
    00000.24: b'1E5 44 FF F4 30 04 00 02 A7 <DATA ERROR' (x1)
    00000.25: b'1E5 44 FF F4 5F FD 00 03 CF <DATA ERROR' (x2)
    00000.26: b'1E5 44 FF F4 70 02 00 02 E5 <DATA ERROR' (x2)
    00000.27: b'1E5 44 FF F4 1F FD 00 03 8F <DATA ERROR' (x2)
    00000.28: b'1E5 44 FF F4 30 02 00 02 A5 <DATA ERROR' (x2)
    00000.29: b'1E5 44 FF F4 5F FD 00 03 CF <DATA ERROR' (x3)
    000000.3: b'1E5 44 FF F4 70 00 00 02 E3 <DATA ERROR' (x3)
    00000.31: b'1E5 44 FF F3 1F FD 00 03 8E <DATA ERROR' (x2)
    00000.32: b'1E5 44 FF F4 30 02 00 02 A5 <DATA ERROR' (x3)
    00000.34: b'1E5 44 FF F4 50 02 00 02 C5 <DATA ERROR' (x2)
    00000.35: b'1E5 44 FF F4 7F FD 00 03 EF <DATA ERROR' (x4)
    00000.35: b'1E5 44 FF F4 10 00 00 02 83 <DATA ERROR' (x2)
    00000.36: b'1E5 44 FF F4 30 00 00 02 A3 <DATA ERROR' (x4)
    00000.37: b'1E5 44 FF F3 5F FD 00 03 CE <DATA ERROR' (x1)
    00000.38: b'1E5 44 FF F4 70 02 00 02 E5 <DATA ERROR' (x3)
    00000.39: b'1E5 44 FF F4 10 02 00 02 85 <DATA ERROR' (x4)
    00000.41: b'1E5 44 FF F4 30 00 00 02 A3 <DATA ERROR' (x5)
    00000.42: b'1E5 44 FF F4 5F FD 00 03 CF <DATA ERROR' (x4)
    00000.42: b'1E5 44 FF F4 70 00 00 02 E3 <DATA ERROR' (x4)
    00000.43: b'1E5 44 FF F4 10 02 00 02 85 <DATA ERROR' (x5)
    00000.44: b'1E5 44 FF F4 3F FD 00 03 AF <DATA ERROR' (x2)
    00000.46: b'1E5 44 FF F4 50 00 00 02 C3 <DATA ERROR' (x4)
    00000.47: b'1E5 44 FF F4 70 00 00 02 E3 <DATA ERROR' (x5)
    00000.47: b'1E5 44 FF F4 10 00 00 02 83 <DATA ERROR' (x3)
    00000.48: b'1E5 44 FF F5 30 06 00 02 AA <DATA ERROR' (x1)
    00000.49: b'1E5 44 FF F4 5F FB 00 03 CD <DATA ERROR' (x1)
    000000.5: b'1E5 44 FF F4 7F FD 00 03 EF <DATA ERROR' (x5)
0F1
    00003.73: b'0F1 00 00 00 40 00 00 ' (x94)
    00003.74: b'0F1 1C 00 00 40 00 00 ' (x94)
    00003.75: b'0F1 28 00 00 40 00 00 ' (x94)
    00003.76: b'0F1 34 00 00 40 00 00 <DATA ERROR' (x94)
0F9
    00000.67: b'0F9 00 00 40 00 00 00 00 00 ' (x1)
191
    00015.97: b'191 06 A6 06 A6 06 9F 00 ' (x1)
    00015.97: b'191 06 A6 06 A6 06 A6 00 ' (x9)
    000016.0: b'191 06 A9 06 A9 06 A6 00 ' (x1)
    00016.01: b'191 06 A9 06 A9 06 A9 00 ' (x12)
    00016.01: b'191 06 A6 06 A6 06 A9 00 ' (x1)
    00016.02: b'191 06 B2 06 B2 06 A6 00 ' (x1)
    00016.04: b'191 06 B2 06 B2 06 A6 00 ' (x2)
    00016.05: b'191 06 A6 06 A6 06 B2 00 ' (x4)
    00016.09: b'191 06 A6 06 A6 06 B2 00 ' (x5)
    00016.09: b'191 06 A6 06 A6 06 A6 00 ' (x10)
    00016.09: b'191 06 A0 06 A0 06 A6 00 ' (x1)
    000016.1: b'191 06 97 06 A0 06 A0 00 ' (x1)
    00016.11: b'191 06 97 06 97 06 A0 00 ' (x6)
    00016.12: b'191 06 97 06 97 06 97 00 ' (x14)
    00016.14: b'191 06 A0 06 A0 06 97 00 ' (x2)
    00016.17: b'191 06 A0 06 A0 06 A0 00 ' (x39)
    00016.17: b'191 06 AF 06 AF 06 A0 00 ' (x7)
    00016.18: b'191 06 AF 06 AF 06 A0 00 ' (x8)
    00016.18: b'191 06 A4 06 A4 06 AF 00 ' (x4)
    000016.2: b'191 06 A4 06 A4 06 A4 00 ' (x14)
    00016.21: b'191 06 A1 06 A1 06 A4 00 ' (x6)
    00016.23: b'191 06 A1 06 A1 06 A1 00 ' (x18)
    00016.24: b'191 06 A3 06 A3 06 A1 00 ' (x1)
    00016.25: b'191 06 A3 06 A3 06 A3 00 ' (x18)
    00016.26: b'191 06 A1 06 A1 06 A3 00 ' (x1)
    00016.27: b'191 06 A1 06 A1 06 A1 00 ' (x19)
    00016.31: b'191 06 99 06 99 06 A1 00 ' (x3)
    00016.31: b'191 06 A0 06 A0 06 99 00 ' (x2)
    00016.32: b'191 06 A0 06 A0 06 99 00 ' (x3)
    00016.32: b'191 06 AE 06 AE 06 A0 00 ' (x6)
    00016.34: b'191 06 AE 06 AE 06 A0 00 ' (x7)
    00016.35: b'191 06 A5 06 A5 06 AE 00 ' (x3)
    00016.36: b'191 06 A5 06 A5 06 AE 00 ' (x4)
1ED
    00019.16: b'1ED 41 90 01 A5 01 B8 75 6D <DATA ERROR' (x61)
    00019.19: b'1ED 41 90 01 A5 01 B8 75 6D <DATA ERROR' (x62)
    000019.2: b'1ED 41 90 01 A5 01 B8 75 6D <DATA ERROR' (x63)
    000019.2: b'1ED 41 90 01 A5 01 B0 75 6D <DATA ERROR' (x75)
    00019.21: b'1ED 41 90 01 A6 01 B8 75 6D <DATA ERROR' (x46)
    00019.22: b'1ED 41 90 01 A6 01 B0 75 6D <DATA ERROR' (x62)
    00019.23: b'1ED 41 90 01 AB 01 B8 75 6D <DATA ERROR' (x36)
    00019.25: b'1ED 41 90 01 AB 01 B8 75 6D <DATA ERROR' (x37)
    00019.28: b'1ED 41 90 01 AC 01 B8 75 6D <DATA ERROR' (x36)
    00019.29: b'1ED 41 90 01 AA 01 B8 75 6D <DATA ERROR' (x41)
    00019.29: b'1ED 41 90 01 AA 01 B8 75 6D <DATA ERROR' (x42)
    000019.3: b'1ED 41 90 01 AA 01 B0 75 6D <DATA ERROR' (x36)
    00019.31: b'1ED 41 90 01 A9 01 B0 75 6D <DATA ERROR' (x33)
    00019.32: b'1ED 41 90 01 A9 01 B0 75 6D <DATA ERROR' (x34)
    00019.33: b'1ED 41 90 01 A9 01 B0 75 6D <DATA ERROR' (x35)
    00019.35: b'1ED 41 90 01 AB 01 B0 75 6D <DATA ERROR' (x14)
    00019.36: b'1ED 41 90 01 A8 01 B0 75 6D <DATA ERROR' (x43)
    00019.37: b'1ED 41 90 01 A5 01 B0 75 6D <DATA ERROR' (x76)
    00019.41: b'1ED 41 90 01 A5 01 B0 75 6D <DATA ERROR' (x77)
    00019.41: b'1ED 41 90 01 9F 01 A8 75 6D <DATA ERROR' (x11)
    00019.41: b'1ED 41 90 01 9F 01 A8 75 6D <DATA ERROR' (x12)
    00019.42: b'1ED 41 90 01 96 01 A0 75 6D <DATA ERROR' (x1)
    00019.44: b'1ED 41 90 01 98 01 A0 75 6D <DATA ERROR' (x1)
    00019.45: b'1ED 41 90 01 99 01 A8 75 6D <DATA ERROR' (x6)
    00019.46: b'1ED 41 90 01 99 01 B0 75 6D <DATA ERROR' (x7)
    00019.47: b'1ED 41 90 01 A2 01 B8 75 6D <DATA ERROR' (x16)
    00019.49: b'1ED 41 90 01 A4 01 C0 75 6D <DATA ERROR' (x2)
    000019.5: b'1ED 41 90 01 A4 01 C0 75 6D <DATA ERROR' (x3)
    00019.51: b'1ED 41 90 01 A2 01 C0 75 6D <DATA ERROR' (x1)
    00019.53: b'1ED 41 90 01 A2 01 B8 75 6D <DATA ERROR' (x17)
    00019.55: b'1ED 41 90 01 A0 01 B0 75 6D <DATA ERROR' (x38)
    00019.55: b'1ED 41 90 01 A0 01 B0 75 6D <DATA ERROR' (x39)
    00019.56: b'1ED 41 90 01 A0 01 B0 75 6D <DATA ERROR' (x40)
    00019.59: b'1ED 41 90 01 A0 01 B0 75 6D <DATA ERROR' (x41)
    000019.6: b'1ED 41 90 01 A4 01 B0 75 6D <DATA ERROR' (x57)
    000019.6: b'1ED 41 90 01 A4 01 B8 75 6D <DATA ERROR' (x34)
    00019.61: b'1ED 41 90 01 A7 01 B8 75 6D <DATA ERROR' (x56)
    00019.62: b'1ED 41 90 01 A7 01 C0 75 6D <DATA ERROR' (x2)
    00019.64: b'1ED 41 90 01 AC 01 C0 75 6D <DATA ERROR' (x5)
    00019.65: b'1ED 41 90 01 AA 01 B8 75 6D <DATA ERROR' (x43)
    00019.66: b'1ED 41 90 01 AA 01 B8 75 6D <DATA ERROR' (x44)
    00019.67: b'1ED 41 90 01 A7 01 B8 75 6D <DATA ERROR' (x57)
    00019.69: b'1ED 41 90 01 A7 01 B8 75 6D <DATA ERROR' (x58)
    000019.7: b'1ED 41 90 01 A7 01 B8 75 6D <DATA ERROR' (x59)
    00019.71: b'1ED 41 90 01 A7 01 B8 75 6D <DATA ERROR' (x60)
    00019.73: b'1ED 41 90 01 A7 01 B0 75 6D <DATA ERROR' (x46)
    00019.74: b'1ED 41 90 01 A7 01 B0 75 6D <DATA ERROR' (x47)
    00019.75: b'1ED 41 90 01 A5 01 B0 75 6D <DATA ERROR' (x78)
    00019.76: b'1ED 41 90 01 A4 01 B0 75 6D <DATA ERROR' (x58)
    00019.77: b'1ED 41 90 01 A4 01 B0 75 6D <DATA ERROR' (x59)
    00019.79: b'1ED 41 90 01 9D 01 A8 75 6D <DATA ERROR' (x9)
    000019.8: b'1ED 41 90 01 9D 01 B0 75 6D <DATA ERROR' (x35)
1EB
    000012.8: b'1EB 01 8E ' (x128)
    00012.81: b'1EB 01 8C ' (x71)
    00012.82: b'1EB 01 91 ' (x126)
    00012.84: b'1EB 01 8E ' (x129)
    00012.86: b'1EB 01 91 ' (x127)
    00012.86: b'1EB 01 8F ' (x135)
    00012.87: b'1EB 01 90 ' (x135)
    000012.9: b'1EB 01 92 ' (x115)
    00012.91: b'1EB 01 8C ' (x72)
    00012.91: b'1EB 01 91 ' (x128)
    00012.92: b'1EB 01 94 ' (x42)
    00012.93: b'1EB 01 8D ' (x97)
    00012.94: b'1EB 01 8C ' (x73)
    00012.96: b'1EB 01 8E ' (x130)
    00012.98: b'1EB 01 8D ' (x98)
    000013.0: b'1EB 01 8D ' (x99)
    000013.0: b'1EB 01 93 ' (x67)
0BE
    00012.92: b'0BE 00 00 00 00 00 00 ' every 10ms or faster
0C9
    0013.727: b'0C9 84 0A 4F 00 00 40 08 00 <DATA ERROR' (x3)
    0013.738: b'0C9 84 0A 3D 07 00 40 08 00 <DATA ERROR' (x4)
    0013.751: b'0C9 84 0A 3D 0A 00 40 08 00 <DATA ERROR' (x4)
    0013.764: b'0C9 84 0A 34 0D 00 40 08 00 <DATA ERROR' (x2)
    0013.776: b'0C9 84 0A 34 00 00 40 08 00 <DATA ERROR' (x1)
    0013.789: b'0C9 84 0A 33 07 00 40 08 00 <DATA ERROR' (x6)
    0013.816: b'0C9 84 0A 37 0A 00 40 08 00 <DATA ERROR' (x4)
    0013.832: b'0C9 84 0A 37 0D 00 40 08 00 <DATA ERROR' (x6)
    0013.834: b'0C9 84 0A 2B 00 00 40 08 00 <DATA ERROR' (x2)
    00013.84: b'0C9 84 0A 2B 07 00 40 08 00 <DATA ERROR' (x4)
    0013.851: b'0C9 84 0A 25 0A 00 40 08 00 <DATA ERROR' (x7)
    0013.864: b'0C9 84 0A 25 0D 00 40 08 00 <DATA ERROR' (x9)
    0013.876: b'0C9 84 0A 1B 00 00 40 08 00 <DATA ERROR' (x1)
    0013.909: b'0C9 84 0A 1B 07 00 40 08 00 <DATA ERROR' (x2)
    0013.916: b'0C9 84 0A 23 0A 00 40 08 00 <DATA ERROR' (x5)
    0013.923: b'0C9 84 0A 23 0D 00 40 08 00 <DATA ERROR' (x6)
    0013.928: b'0C9 84 0A 31 00 00 40 08 00 <DATA ERROR' (x7)
    0013.938: b'0C9 84 0A 31 07 00 40 08 00 <DATA ERROR' (x5)
    0013.951: b'0C9 84 0A 3A 0A 00 40 08 00 <DATA ERROR' (x5)
    0013.964: b'0C9 84 0A 3C 0D 00 40 08 00 <DATA ERROR' (x5)
    0013.996: b'0C9 84 0A 3C 00 00 40 08 00 <DATA ERROR' (x3)
    0014.004: b'0C9 84 0A 35 07 00 40 08 00 <DATA ERROR' (x4)
    0014.007: b'0C9 84 0A 35 0A 00 40 08 00 <DATA ERROR' (x5)
    0014.015: b'0C9 84 0A 34 0D 00 40 08 00 <DATA ERROR' (x3)
    0014.026: b'0C9 84 0A 34 00 00 40 08 00 <DATA ERROR' (x2)
    00014.04: b'0C9 84 0A 2A 07 00 40 08 00 <DATA ERROR' (x9)
    00014.05: b'0C9 84 0A 2A 0A 00 40 08 00 <DATA ERROR' (x5)
    0014.085: b'0C9 84 0A 2D 0D 00 40 08 00 <DATA ERROR' (x7)
    0014.094: b'0C9 84 0A 2D 00 00 40 08 00 <DATA ERROR' (x6)
    0014.095: b'0C9 84 0A 18 07 00 40 08 00 <DATA ERROR' (x5)
    0014.103: b'0C9 84 09 FA 0A 00 40 08 00 <DATA ERROR' (x2)
    0014.116: b'0C9 84 09 FA 0D 00 40 08 00 <DATA ERROR' (x1)
    0014.126: b'0C9 84 09 FA 00 00 40 08 00 <DATA ERROR' (x1)
    0014.139: b'0C9 84 09 FA 07 00 40 08 00 <DATA ERROR' (x2)
    0014.173: b'0C9 84 0A 06 0A 00 40 08 00 <DATA ERROR' (x3)
    0014.178: b'0C9 84 0A 06 0D 00 40 08 00 <DATA ERROR' (x4)
    00014.18: b'0C9 84 0A 13 00 00 40 08 00 <DATA ERROR' (x2)
    0014.189: b'0C9 84 0A 13 07 00 40 08 00 <DATA ERROR' (x2)
    0014.213: b'0C9 84 0A 1C 0A 00 40 08 00 <DATA ERROR' (x3)
    0014.215: b'0C9 84 0A 1C 0D 00 40 08 00 <DATA ERROR' (x1)
    0014.226: b'0C9 84 0A 23 00 00 40 08 00 <DATA ERROR' (x2)
1EF
    0012.389: b'1EF 00 00 02 75 ' (x54)
    0012.395: b'1EF 00 00 02 75 ' (x55)
    0012.396: b'1EF 00 00 02 76 ' (x33)
    0012.405: b'1EF 00 00 02 79 ' (x61)
    0012.419: b'1EF 00 00 02 79 ' (x62)
    00012.43: b'1EF 00 00 02 77 ' (x67)
    0012.446: b'1EF 00 00 02 77 ' (x68)
    0012.465: b'1EF 00 00 02 78 ' (x126)
    0012.468: b'1EF 00 00 02 78 ' (x127)
    0012.479: b'1EF 00 00 02 7A ' (x171)
    0012.504: b'1EF 00 00 02 7A ' (x172)
    0012.519: b'1EF 00 00 02 75 ' (x56)
    0012.519: b'1EF 00 00 02 75 ' (x57)
    00012.53: b'1EF 00 00 02 75 ' (x58)
    0012.558: b'1EF 00 00 02 75 ' (x59)
    00012.57: b'1EF 00 00 02 75 ' (x60)
    0012.571: b'1EF 00 00 02 7B ' (x99)
    00012.58: b'1EF 00 00 02 7B ' (x100)
    0012.593: b'1EF 00 00 02 79 ' (x63)
    0012.605: b'1EF 00 00 02 79 ' (x64)
    0012.617: b'1EF 00 00 02 78 ' (x128)
    0012.641: b'1EF 00 00 02 78 ' (x129)
    0012.645: b'1EF 00 00 02 78 ' (x130)
    0012.654: b'1EF 00 00 02 78 ' (x131)
    0012.668: b'1EF 00 00 02 74 ' (x45)
    0012.679: b'1EF 00 00 02 74 ' (x46)
    0012.693: b'1EF 00 00 02 75 ' (x61)
185
    0011.421: b'185 18 00 <DATA ERROR' (x353)
    0011.439: b'185 18 00 <DATA ERROR' (x354)
    00011.46: b'185 18 01 <DATA ERROR' (x217)
    0011.496: b'185 18 00 <DATA ERROR' (x355)
    0011.502: b'185 18 00 <DATA ERROR' (x356)
    00011.52: b'185 18 00 <DATA ERROR' (x357)
    0011.546: b'185 18 00 <DATA ERROR' (x358)
1C7 (cycle)
    0010.471: b'1C7 00 00 FF FD 00 00 3F ' (x131)
    00010.49: b'1C7 00 00 00 00 00 00 3F ' (x131)
    00010.51: b'1C7 00 00 7F FF 00 00 3F ' (x132)
    0010.531: b'1C7 00 00 BF FE 00 00 3F ' (x132)
1E9
    0030.064: b'1E9 0F F8 00 0E 0F FC 00 00 <DATA ERROR' (x572)
    0030.095: b'1E9 0F FC 00 0E 0F FC 00 00 <DATA ERROR' (x471)
    0030.107: b'1E9 0F FC 00 0E 0F FC 00 00 <DATA ERROR' (x472)
    0030.122: b'1E9 0F F8 00 0E 0F FC 00 00 <DATA ERROR' (x573)
    0030.145: b'1E9 0F FC 00 0E 0F FC 00 00 <DATA ERROR' (x473)
    0030.164: b'1E9 0F FC 00 0E 0F FC 00 00 <DATA ERROR' (x474)
    0030.183: b'1E9 0F F8 00 0E 0F FC 00 00 <DATA ERROR' (x574)
    0030.205: b'1E9 0F F8 00 0E 0F FC 00 00 <DATA ERROR' (x575)
    0030.235: b'1E9 0F FC 00 0E 0F FC 00 00 <DATA ERROR' (x475)
    0030.247: b'1E9 0F FC 00 0E 0F FC 00 00 <DATA ERROR' (x476)
    0030.262: b'1E9 0F FC 00 0E 0F FC 00 00 <DATA ERROR' (x477)
    0030.298: b'1E9 0F FC 00 0E 0F FC 00 00 <DATA ERROR' (x478)
    0030.304: b'1E9 0F F8 00 0E 0F FD 00 00 <DATA ERROR' (x137)
    0030.322: b'1E9 0F F8 00 0E 0F FD 00 00 <DATA ERROR' (x138)
    0030.344: b'1E9 0F FC 00 0E 0F FC 00 00 <DATA ERROR' (x479)
    0030.375: b'1E9 0F FC 00 0E 0F FC 00 00 <DATA ERROR' (x480)
    0030.388: b'1E9 0F F8 00 0E 0F FC 00 00 <DATA ERROR' (x576)
    0030.402: b'1E9 0F FC 00 0E 0F FB 00 00 <DATA ERROR' (x48)
    0030.429: b'1E9 0F FC 00 0E 0F FB 00 00 <DATA ERROR' (x49)
    0030.443: b'1E9 0F FC 00 0E 0F FC 00 00 <DATA ERROR' (x481)
    0030.462: b'1E9 0F F8 00 0E 0F FD 00 00 <DATA ERROR' (x139)
    0030.484: b'1E9 0F F8 00 0E 0F FC 00 00 <DATA ERROR' (x577)
    0030.514: b'1E9 0F FC 00 0E 0F FC 00 00 <DATA ERROR' (x482)
232
    0009.161: b'232 08 02 01 00 00 00 00 00 <DATA ERROR' (x458)
321
    0058.877: b'321 FD EF 61 F4 FC FA FE 81 <DATA ERROR' (x1)
    0058.919: b'321 FE 08 81 F4 FC FA FE 81 <DATA ERROR' (x1)
    00058.93: b'321 FE 21 A1 F4 FC FA FE 81 <DATA ERROR' (x1)
    0058.951: b'321 FE 3A C1 F4 FC FA FE 81 <DATA ERROR' (x1)
    00058.99: b'321 FE 53 E1 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.001: b'321 FE 6C 01 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.042: b'321 FE 85 21 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.052: b'321 FE 9E 41 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.085: b'321 FE B7 61 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.104: b'321 FE D0 81 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.126: b'321 FE E9 A1 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.167: b'321 FF 02 C1 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.177: b'321 FF 1B E1 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.201: b'321 FF 34 01 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.241: b'321 FF 4D 21 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.252: b'321 FF 66 41 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.287: b'321 FF 7F 61 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.302: b'321 FF 98 81 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.329: b'321 FF B1 A1 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.351: b'321 FF CA C1 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.379: b'321 FF E3 E1 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.402: b'321 FF FC 01 F4 FC FA FE 81 <DATA ERROR' (x1)
    0059.432: b'321 00 15 21 F4 FC FA FE 81 ' (x1)
    0059.451: b'321 00 2E 41 F4 FC FA FE 81 ' (x1)
    0059.477: b'321 00 47 61 F4 FC FA FE 81 ' (x1)
    0059.501: b'321 00 60 81 F4 FC FA FE 81 ' (x1)
    0059.526: b'321 00 79 A1 F4 FC FA FE 81 ' (x1)
    0059.555: b'321 00 92 C1 F4 FC FA FE 81 ' (x1)
    0059.577: b'321 00 AB E1 F4 FC FA FE 81 ' (x1)
    0059.609: b'321 00 C4 01 F4 FC FA FE 81 ' (x1)
    0059.626: b'321 00 DD 21 F4 FC FA FE 81 ' (x1)
    0059.651: b'321 00 F6 41 F4 FC FA FE 81 ' (x1)
    0059.682: b'321 01 0F ' (x1)
    0059.699: b'321 01 28 ' (x1)
    0059.732: b'321 01 41 ' (x1)
    00059.75: b'321 01 5A ' (x1)
    0059.782: b'321 01 73 ' (x1)
    0059.799: b'321 01 8C ' (x1)
    0059.825: b'321 01 A5 ' (x1)
    0059.857: b'321 01 BE ' (x1)
    0059.875: b'321 01 D7 ' (x1)
    0059.899: b'321 01 F0 ' (x1)
    00059.94: b'321 02 09 A1 ' (x1)
    0059.951: b'321 02 22 C1 ' (x1)
    0059.986: b'321 02 3B E1 ' (x1)
    000060.0: b'321 02 54 01 ' (x1)
    0060.027: b'321 02 6D 21 ' (x1)
1A1
    0010.359: b'1A1 00 00 41 40 00 00 00 00 ' (x414)

1C3
    0012.534: 1C3 06 9A 06 94 00 00 00  (x4)
    00012.56: 1C3 06 A0 06 9A 00 00 00  (x5)
    0012.583: 1C3 06 99 06 92 00 00 00  (x3)
    0012.613: 1C3 06 94 06 8F 00 00 00  (x2)
    0012.633: 1C3 06 A8 06 A5 00 00 00  (x2)
    0012.659: 1C3 06 9E 06 9C 00 00 00  (x4)
    0012.697: 1C3 06 99 06 95 00 00 00  (x4)
    0012.707: 1C3 06 9A 06 97 00 00 00  (x10)
    0012.736: 1C3 06 A1 06 9E 00 00 00  (x4)
    0012.758: 1C3 06 9A 06 96 00 00 00  (x3)
    00012.79: 1C3 06 98 06 96 00 00 00  (x3)
    0012.807: 1C3 06 AB 06 A8 00 00 00  (x2)
    0012.833: 1C3 06 A7 06 A3 00 00 00  (x3)
    0012.865: 1C3 06 9B 06 98 00 00 00  (x2)
    0012.885: 1C3 06 96 06 93 00 00 00  (x2)
    0012.915: 1C3 06 9B 06 97 00 00 00  (x3)
    0012.933: 1C3 06 A2 06 9D 00 00 00  (x2)
    0012.965: 1C3 06 96 06 92 00 00 00  (x5)
    0012.983: 1C3 06 AA 06 A6 00 00 00  (x2)
    0013.008: 1C3 06 A8 06 A3 00 00 00  (x5)
    0013.041: 1C3 06 9C 06 97 00 00 00  (x7)
1C4
    0010.721: 1C4 00 00 00 00 06 00 01 FD  (x108)
    0010.746: 1C4 00 00 00 00 00 00 00 00  (x108)
    0010.777: 1C4 00 00 00 00 02 00 01 FF  (x108)
    0010.795: 1C4 00 00 00 00 04 00 01 FE  (x108)
    0010.826: 1C4 00 00 00 00 06 00 01 FD  (x109)
    0010.849: 1C4 00 00 00 00 00 00 00 00  (x109)
    0010.877: 1C4 00 00 00 00 02 00 01 FF  (x109)
    0010.896: 1C4 00 00 00 00 04 00 01 FE  (x109)
1F5
    0015.715: 1F5 ED 00 00 0F 18 00 01 02 <DATA ERROR (x629)
451
    0008.136: 451 00 00 00 00 00 00  (x320)
1E1
    00003.85: 1E1 00 00 04 00 00 00 00  (x32)
    00003.88: 1E1 00 FF 05 00 00 00 00  (x33)
    0003.905: 1E1 00 FE 06 00 00 00 00  (x33)
    0003.946: 1E1 00 FD 07 00 00 00 00  (x33)
    0003.986: 1E1 00 00 04 00 00 00 00  (x33)
    0003.997: 1E1 00 FF 05 00 00 00 00  (x34)
    0004.037: 1E1 00 FE 06 00 00 00 00  (x34)
    0004.054: 1E1 00 FD 07 00 00 00 00  (x34)
    0004.085: 1E1 00 00 04 00 00 00 00  (x34)
    0004.115: 1E1 00 FF 05 00 00 00 00  (x35)
    0004.156: 1E1 00 FE 06 00 00 00 00  (x35)
    00004.19: 1E1 00 FD 07 00 00 00 00  (x35)
    0004.206: 1E1 00 00 04 00 00 00 00  (x35)
    0004.255: 1E1 00 FF 05 00 00 00 00  (x36)
    00004.28: 1E1 00 FE 06 00 00 00 00  (x36)
    0004.305: 1E1 00 FD 07 00 00 00 00  (x36)
1F3
    00005.81: 1F3 00 3C 00  (x49)
    0005.824: 1F3 40 7C 00 <DATA ERROR (x49)
    0005.839: 1F3 80 BC 00 <DATA ERROR (x49)
    0005.874: 1F3 C0 FC 00 <DATA ERROR (x49)
    0005.899: 1F3 00 3C 00  (x50)
    00005.95: 1F3 40 7C 00 <DATA ERROR (x50)
    0005.961: 1F3 80 BC 00 <DATA ERROR (x50)
    0006.017: 1F3 C0 FC 00 <DATA ERROR (x50)
    0006.019: 1F3 00 3C 00  (x51)
    0006.066: 1F3 40 7C 00 <DATA ERROR (x51)
    0006.117: 1F3 80 BC 00 <DATA ERROR (x51)
    0006.127: 1F3 C0 FC 00 <DATA ERROR (x51)
    0006.138: 1F3 00 3C 00  (x52)
1FC
    0008.423: 1FC FF BF FF 40 00 00 03 3C <DATA ERROR (x1)
    0008.473: 1FC FF D1 FF 38 00 00 43 4E <DATA ERROR (x1)
    0008.523: 1FC FF B8 FF 47 00 00 83 4C <DATA ERROR (x1)
    0008.577: 1FC FF CD FF 53 00 00 C3 75 <DATA ERROR (x1)
    00008.63: 1FC FF CC FF 69 00 00 03 72 <DATA ERROR (x1)
    0008.677: 1FC FF BD FF 36 00 00 43 38 <DATA ERROR (x1)
    0008.729: 1FC FF BA FF 33 00 00 83 3A <DATA ERROR (x1)
    0008.768: 1FC FF C7 FF 49 00 00 C3 65 <DATA ERROR (x3)
    0008.822: 1FC FF D5 FF 57 00 00 03 69 <DATA ERROR (x1)
    0008.875: 1FC FF BD FF 47 00 00 43 49 <DATA ERROR (x1)
    0008.925: 1FC FF BF FF 53 00 00 83 5F <DATA ERROR (x1)
    0008.979: 1FC FF B8 FF 53 00 00 C3 60 <DATA ERROR (x1)
    0009.014: 1FC FF D5 FF 31 00 00 03 43 <DATA ERROR (x1)
    0009.077: 1FC FF BF FF 47 00 00 43 4B <DATA ERROR (x1)
    0009.119: 1FC FF D1 FF 47 00 00 83 65 <DATA ERROR (x1)
    0009.173: 1FC FF CC FF 4E 00 00 C3 6F <DATA ERROR (x1)
    0009.223: 1FC FF CC FF 58 00 00 03 61 <DATA ERROR (x1)
    0009.277: 1FC FF C7 FF 41 00 00 43 4D <DATA ERROR (x1)
    00009.33: 1FC FF BC FF 33 00 00 83 3C <DATA ERROR (x1)
    0009.379: 1FC FF E2 FF 53 00 00 C3 8A <DATA ERROR (x1)
    0009.418: 1FC FF C9 FF 58 00 00 03 5E <DATA ERROR (x1)
    00009.48: 1FC FF BA FF 37 00 00 43 36 <DATA ERROR (x1)
    0009.514: 1FC FF CC FF 38 00 00 83 51 <DATA ERROR (x1)
    00009.57: 1FC FF C9 FF 50 00 00 C3 6E <DATA ERROR (x1)
    00009.62: 1FC FF C7 FF 42 00 00 03 46 <DATA ERROR (x1)
    00009.67: 1FC FF D3 FF 4C 00 00 43 64 <DATA ERROR (x1)
214
    0015.614: 214 02 00 03  (x78)
    0015.684: 214 04 00 03 FE 00  (x79)
    0015.722: 214 06 00 03 FD 00 34 <DATA ERROR (x79)
    0015.757: 214 00 00 02 00 00 00  (x79)
    0015.809: 214 02 00 03  (x79)
    0015.876: 214 04 00 03 FE 00  (x80)
    0015.917: 214 06 00 03 FD 00 34 <DATA ERROR (x80)
2F9
    0010.609: 2F9 32 00 00  (x7)
    0010.662: 2F9 3A 00 00 00 00 00 00 <DATA ERROR (x7)
    0010.712: 2F9 42 00 00 00 00 00 00 <DATA ERROR (x7)
    0010.752: 2F9 4A 00 00 00 00 00 00 <DATA ERROR (x7)
    0010.806: 2F9 52 00 00 00 00 00 00 <DATA ERROR (x7)
    0010.857: 2F9 5A 00 00 00 00 00 00 <DATA ERROR (x7)
    00010.91: 2F9 62 00 00 00 00 00 00 <DATA ERROR (x7)
    0010.973: 2F9 6A 00 00 00 00 00 00 <DATA ERROR (x7)
    0011.014: 2F9 72 00 00 00 00 00 00 <DATA ERROR (x7)
    0011.052: 2F9 7A 00 00 00 00 00 00 <DATA ERROR (x7)
    0011.103: 2F9 80 00 00 00 00 00 00 <DATA ERROR (x7)
    0011.157: 2F9 8B 00 00 00 00 00 00 <DATA ERROR (x7)
    0011.207: 2F9 93 00 00 00 00 00 00 <DATA ERROR (x7)
    00011.26: 2F9 98 00 00 00 00 00 00 <DATA ERROR (x8)
    0011.314: 2F9 A0 00 00 00 00 00 00 <DATA ERROR (x8)
    0011.363: 2F9 A8 00 00 00 00 00 00 <DATA ERROR (x8)
    0011.412: 2F9 B0 00 00 00 00 00 00 <DATA ERROR (x8)
    0011.452: 2F9 B8 00 00 00 00 00 00 <DATA ERROR (x8)
    0011.505: 2F9 C0 00 00 00 00 00 00 <DATA ERROR (x8)
    0011.558: 2F9 C8 00 00 00 00 00 00 <DATA ERROR (x8)
    0011.609: 2F9 D0 00 00 00 00 00 00 <DATA ERROR (x8)
    0011.663: 2F9 D8 00 00 00 00 00 00 <DATA ERROR (x8)
    0011.717: 2F9 E0 00 00 00 00 00 00 <DATA ERROR (x8)
    0011.763: 2F9 E8 00 00 00 00 00 00 <DATA ERROR (x8)
    0011.813: 2F9 F0 00 00 00 00 00 00 <DATA ERROR (x8)
    0011.853: 2F9 F8 00 00 00 00 00 00 <DATA ERROR (x8)
    0011.907: 2F9 02 00 00  (x8)
    0011.962: 2F9 0A 00 00 00 00 00 00 <DATA ERROR (x8)
    0012.011: 2F9 12 00 00 00 00 00 00  (x8)
    0012.064: 2F9 1A 00 00 00 00 00 00  (x8)
    0012.099: 2F9 22 00 00 00 00 00 00  (x8)
    0012.152: 2F9 2A 00 00 00 00 00 00  (x8)
    0012.203: 2F9 32 00 00  (x8)
    0012.258: 2F9 3A 00 00 00 00 00 00 <DATA ERROR (x8)
    0012.309: 2F9 42 00 00 00 00 00 00 <DATA ERROR (x8)
    0012.375: 2F9 4A 00 00 00 00 00 00 <DATA ERROR (x8)
    0012.403: 2F9 52 00 00 00 00 00 00 <DATA ERROR (x8)
    0012.457: 2F9 5A 00 00 00 00 00 00 <DATA ERROR (x8)
    0012.507: 2F9 62 00 00 00 00 00 00 <DATA ERROR (x8)
    0012.557: 2F9 6A 00 00 00 00 00 00 <DATA ERROR (x8)
    00012.62: 2F9 72 00 00 00 00 00 00 <DATA ERROR (x8)
    0012.659: 2F9 7A 00 00 00 00 00 00 <DATA ERROR (x8)
    0012.714: 2F9 80 00 00 00 00 00 00 <DATA ERROR (x8)
    0012.776: 2F9 8B 00 00 00 00 00 00 <DATA ERROR (x8)
    0012.799: 2F9 93 00 00 00 00 00 00 <DATA ERROR (x8)
    0012.865: 2F9 98 00 00 00 00 00 00 <DATA ERROR (x9)
    0012.905: 2F9 A0 00 00 00 00 00 00 <DATA ERROR (x9)
    0012.959: 2F9 A8 00 00 00 00 00 00 <DATA ERROR (x9)
    0013.009: 2F9 B0 00 00 00 00 00 00 <DATA ERROR (x9)
    0013.062: 2F9 B8 00 00 00 00 00 00 <DATA ERROR (x9)
2C3
    0010.251: 2C3 0A 03 06 64 07 AC 3E 00 <DATA ERROR (x1)
    0010.299: 2C3 0A 01 06 64 07 AC 3E 00 <DATA ERROR (x1)
    0010.338: 2C3 0A 00 06 64 07 AC 3E 00 <DATA ERROR (x5)
    0010.391: 2C3 09 FF 06 64 07 AB 3E 00 <DATA ERROR (x1)
    0010.445: 2C3 09 FD 06 64 07 B2 3E 00 <DATA ERROR (x2)
    0010.495: 2C3 09 FE 06 64 07 B0 3D 00 <DATA ERROR (x4)
    0010.549: 2C3 09 FD 06 64 07 AB 3E 00 <DATA ERROR (x3)
    0010.604: 2C3 09 FE 06 64 07 AC 3E 00 <DATA ERROR (x4)
    00010.65: 2C3 09 FF 06 64 07 AE 3E 00 <DATA ERROR (x3)
    0010.691: 2C3 09 FF 06 64 07 B2 3E 00 <DATA ERROR (x2)
    0010.754: 2C3 09 FF 06 64 07 AC 3D 00 <DATA ERROR (x2)
    0010.795: 2C3 09 FF 06 64 07 AF 3D 00 <DATA ERROR (x2)
    0010.849: 2C3 09 FF 06 64 07 B0 3D 00 <DATA ERROR (x1)
    00010.89: 2C3 09 FF 06 64 07 B4 3E 00 <DATA ERROR (x3)
    0010.949: 2C3 0A 00 06 64 07 AA 3E 00 <DATA ERROR (x2)
    0010.999: 2C3 09 FF 06 64 07 B1 3D 00 <DATA ERROR (x1)
    00011.04: 2C3 09 FF 06 64 07 AF 3D 00 <DATA ERROR (x3)
    0011.094: 2C3 0A 01 06 64 07 AC 3D 00 <DATA ERROR (x1)
    0011.157: 2C3 09 FF 06 64 07 A8 3E 00 <DATA ERROR (x1)
    0011.197: 2C3 09 FE 06 64 07 B1 3D 00 <DATA ERROR (x3)
    0011.251: 2C3 09 FE 06 64 07 AC 3D 00 <DATA ERROR (x1)
    0011.301: 2C3 09 FD 06 64 07 A9 3D 00 <DATA ERROR (x2)
    0011.337: 2C3 09 FC 06 64 07 A9 3D 00 <DATA ERROR (x1)
    0011.389: 2C3 09 FC 06 64 07 AA 3E 00 <DATA ERROR (x1)
    0011.442: 2C3 09 FC 06 64 07 B1 3D 00 <DATA ERROR (x2)
    0011.496: 2C3 09 FD 06 64 07 A4 3D 00 <DATA ERROR (x1)
3F9
    0017.134: 3F9 00 95 27 66 8C 00 89 3A  (x1)
    0017.384: 3F9 00 95 2A 66 8C 00 89 3A  (x1)
    0017.644: 3F9 00 95 30 66 8C 00 89 3A  (x1)
    0017.888: 3F9 00 95 33 66 8C 00 89 3A  (x1)
    0018.138: 3F9 00 95 39 67 8C 00 89 3A  (x1)
    0018.388: 3F9 00 95 3D 66 8C 00 89 3A  (x1)
    0018.638: 3F9 00 95 42 66 8C 00 89 3A  (x1)
    0018.888: 3F9 00 95 46 66 8C 00 89 3A  (x1)
    0019.138: 3F9 00 95 4C 66 8C 00 89 3A  (x1)
    00019.39: 3F9 00 95 4F 66 8C 00 89 3A  (x1)
    00019.64: 3F9 00 95 55 66 8C 00 89 3A  (x1)
    00019.89: 3F9 00 95 58 66 8C 00 89 3A  (x1)
    0020.144: 3F9 00 95 5E 66 8C 00 89 3A  (x1)
    0020.393: 3F9 00 95 61 66 8C 00 89 3B  (x1)
    0020.635: 3F9 00 95 67 66 8C 00 89 3B  (x1)
    0020.885: 3F9 00 95 6A 66 8C 00 89 3B  (x1)
    0021.135: 3F9 00 95 70 66 8C 00 89 3B  (x1)
    0021.385: 3F9 00 95 74 66 8C 00 89 3B  (x1)
    0021.635: 3F9 00 95 79 65 8C 00 89 3B  (x1)
    0021.899: 3F9 00 95 7D 66 8C 00 89 3B  (x1)
    0022.139: 3F9 00 95 82 66 8C 00 89 3B  (x1)
    0022.389: 3F9 00 95 86 66 8C 00 89 3B  (x1)
    0022.639: 3F9 00 95 8C 66 8C 00 89 3B  (x1)
34A
    0007.957: 34A 00 00 00 00 1B  (x159)
230
    0007.849: 230 00 10 11 00 00 00 1F FF  (x40)
    0007.901: 230 00 10 21 00 00 00 1F FE  (x40)
    0007.955: 230 00 10 31 00 00 00 1F FD  (x40)
    0008.005: 230 00 10 01 00 00 00 00 00  (x40)
    0008.059: 230 00 10 11 00 00 00 1F FF  (x41)
    0008.094: 230 00 10 21 00 00 00 1F FE  (x41)
    0008.158: 230 00 10 31 00 00 00 1F FD  (x41)
    0008.199: 230 00 10 01 00 00 00 00 00  (x41)
    0008.253: 230 00 10 11 00 00 00 1F FF  (x42)
    0008.303: 230 00 10 21 00 00 00 1F FE  (x42)
    0008.344: 230 00 10 31 00 00 00 1F FD  (x42)
    0008.406: 230 00 10 01 00 00 00 00 00  (x42)
    0008.455: 230 00 10 11 00 00 00 1F FF  (x43)
    0008.496: 230 00 10 21 00 00 00 1F FE  (x43)
    00008.55: 230 00 10 31 00 00 00 1F FD  (x43)
    000008.6: 230 00 10 01 00 00 00 00 00  (x43)
1F1
    0009.499: 1F1 A2 0A 00 00 18 00 00 7A <DATA ERROR (x95)
3D1
    0008.503: 3D1 01 10  (x84)
2D3
    0010.256: 2D3 00 00  (x205)
160
    0007.389: 160 72 65 9C 03 03 <DATA ERROR (x74)
17D
    0006.528: 17D 22 24 42 FF 00 00  (x66)
234
    0005.833: 234 00 00 00 00  (x59)
2F1
    0009.538: 2F1 98 98 98 98 98 <DATA ERROR (x3)
    0009.642: 2F1 A3 A0 A0 A0 A0 <DATA ERROR (x4)
    0009.742: 2F1 A8 A8 A8 A8 A8 <DATA ERROR (x4)
    0009.841: 2F1 B3 B0 B0 B0 B0 <DATA ERROR (x4)
    0009.941: 2F1 B8 B8 B8 B8 B8 <DATA ERROR (x4)
    0010.044: 2F1 C3 C2 C0 C0 C0 <DATA ERROR (x4)
    0010.132: 2F1 C8 CB C8 C8 C8 <DATA ERROR (x4)
    0010.232: 2F1 D0 D0 D0 D0 D0 <DATA ERROR (x4)
    0010.357: 2F1 DB D8 DB D8 D8 <DATA ERROR (x4)
    0010.444: 2F1 E0 E3 E3 E0 E0 <DATA ERROR (x4)
    0010.536: 2F1 E8 E8 E8 E8 E8 <DATA ERROR (x4)
    0010.638: 2F1 F3 F3 F0 F3 F0 <DATA ERROR (x4)
    0010.737: 2F1 F8 FA F8 FB F8 <DATA ERROR (x4)
    0010.837: 2F1 03 03 00 00  (x4)
    0010.937: 2F1 0A 0B 08 08 08 <DATA ERROR (x4)
    0011.042: 2F1 13 10 10 10 10  (x4)
    0011.142: 2F1 18 1B 1B 18 18  (x4)
    00011.24: 2F1 20 23 20 20 20  (x4)
    0011.341: 2F1 28 28 28 28 28  (x4)
    0011.443: 2F1 30 30 30  (x4)
    0011.531: 2F1 38 38 3B 38 38 <DATA ERROR (x4)
    00011.65: 2F1 40 40 42 40 40 <DATA ERROR (x4)
    0011.741: 2F1 48 48 4B 48 48 <DATA ERROR (x4)
    0011.841: 2F1 50 50 50 52 50 <DATA ERROR (x4)
    0011.941: 2F1 5B 58 5A 58 58 <DATA ERROR (x4)
    0012.041: 2F1 60 60 62 60 60 <DATA ERROR (x4)
    0012.144: 2F1 6B 68 68 68 68 <DATA ERROR (x4)
    0012.232: 2F1 70 70 70 70 70 <DATA ERROR (x4)
    0012.332: 2F1 78 78 78 78 78 <DATA ERROR (x4)
    0012.432: 2F1 80 83 80 80 80 <DATA ERROR (x4)
    0012.532: 2F1 8B 88 8A 88 88 <DATA ERROR (x4)
    0012.647: 2F1 90 90 90 90 90 <DATA ERROR (x4)
    0012.739: 2F1 98 98 98 98 98 <DATA ERROR (x4)
    0012.839: 2F1 A3 A0 A0 A0 A0 <DATA ERROR (x5)
    0012.938: 2F1 A8 A8 A8 A8 A8 <DATA ERROR (x5)
3C9
    0008.348: 3C9 07 66 00 00 00 00 00 00  (x84)
182
    0005.309: 182 9C 03 01 <DATA ERROR (x53)
3C1
    0003.756: 3C1 07 65 F7 00 00 00 00 00  (x38)
3D3
    0006.461: 3D3 00 86 00 00 00 00 00  (x65)
3E9
    0003.329: 3E9 00 00 00 00 00 00 00 00  (x34)
216
    0006.938: 216 00 FF  (x70)
260
    0007.351: 260 C8 00 00 00 00 00 00 00 <DATA ERROR (x74)
261
    0004.033: 261 80 00 00 00 00 00 <DATA ERROR (x41)
262
    0005.194: 262 80 00 00 00 00 00 <DATA ERROR (x52)
263
    0010.314: 263 00 00 00 00 80 00  (x104)
264
    0006.347: 264 07 00 00 00 00 00 00 00  (x64)
265
    0005.327: 265 F8 00 00 80 00 00 00 00 <DATA ERROR (x54)
139
    0008.104: 139 00 00 00 00 00 00 00 00  (x81)
32A
    0015.598: 32A 07 47 AE BF 6D EA 6F C0  (x21)
    0015.702: 32A 07 47 AE 50 6D EA 70 20  (x136)
    0015.802: 32A 07 47 AE 50 6D EA 70 20  (x137)
    0015.902: 32A 07 47 AE 50 6D EA 70 20  (x138)
    0016.015: 32A 07 47 AE 50 6D EA 70 20  (x139)
    0016.096: 32A 07 47 AE 50 6D EA 70 20  (x140)
    0016.205: 32A 07 47 AE 50 6D EA 70 20  (x141)
    0016.295: 32A 07 47 AE 50 6D EA 70 20  (x142)
    0016.417: 32A 07 47 AE 50 6D EA 70 20  (x143)
    00016.52: 32A 07 47 AE BF 6D EA 6F C0  (x22)
3F1
    0004.612: 3F1 00 BF 8C 08 1B B6 0A 4E  (x19)
3FB
    0000.527: 3FB 02 00 <DATA ERROR (x3)
3ED
    0001.546: 3ED 00 00 00 00 00 FF  (x7)
3F1
    0005.047: 3F1 00 BF 8C 08 1B B6 0A 4E  (x21)
137
    0009.455: 137 19 01 FC FC 06 68 04 5A  (x31)
    0009.554: 137 19 01 FC FC 06 68 04 5A  (x32)
    0009.654: 137 19 01 FC FC 06 68 04 5A  (x33)
    0009.757: 137 19 01 FC FC 06 68 04 5A  (x34)
    0009.857: 137 19 01 FC FC 06 68 04 5A  (x35)
    0009.956: 137 19 01 FC FC 06 68 04 5A  (x36)
    0010.056: 137 19 01 F3 2F 06 4A 04 0A  (x4)
    00010.16: 137 19 01 FC FC 06 68 04 5A  (x37)
    0010.246: 137 19 01 FC FC 06 68 04 5A  (x38)
    0010.346: 137 19 01 FC FC 06 68 04 5A  (x39)
    0010.471: 137 19 01 FC FC 06 68 04 5A  (x40)
    0010.561: 137 19 01 FC FC 06 68 04 5A  (x41)
    0010.649: 137 19 01 FC FC 06 68 04 5A  (x42)
    0010.749: 137 19 01 FC FC 06 68 04 5A  (x43)
    0010.849: 137 19 01 FC FC 06 68 04 5A  (x44)
    0010.962: 137 19 01 FC FC 06 68 04 5A  (x45)
    0011.052: 137 19 01 F3 2F 06 4A 04 0A  (x5)
    0011.152: 137 19 01 FC FC 06 68 04 5A  (x46)
    00011.26: 137 19 01 FC FC 06 68 04 5A  (x47)
    0011.369: 137 19 01 FC FC 06 68 04 5A  (x48)
    00011.47: 137 19 01 FC FC 06 68 04 5A  (x49)
    0011.557: 137 19 01 FC FC 06 68 04 5A  (x50)
22A
    0006.687: 22A 47 64 03 <DATA ERROR (x17)
    0006.805: 22A 86 58 02 <DATA ERROR (x17)
    0006.896: 22A C5 4C 01 <DATA ERROR (x18)
    0006.981: 22A 00 70 00  (x18)
    0007.104: 22A 47 64 03 <DATA ERROR (x18)
    0007.209: 22A 86 58 02 <DATA ERROR (x18)
    0007.301: 22A C5 4C 01 <DATA ERROR (x19)
    0007.404: 22A 00 70 00  (x19)
    00007.51: 22A 47 64 03 <DATA ERROR (x19)
    0007.597: 22A 86 58 02 <DATA ERROR (x19)
    0007.699: 22A C5 4C 01 <DATA ERROR (x20)
    0007.789: 22A 00 70 00  (x20)
    0007.891: 22A 47 64 03 <DATA ERROR (x20)
    00007.99: 22A 86 58 02 <DATA ERROR (x20)
    0008.102: 22A C5 4C 01 <DATA ERROR (x21)
    0008.205: 22A 00 70 00  (x21)
    0008.294: 22A 47 64 03 <DATA ERROR (x21)
    0008.385: 22A 86 58 02 <DATA ERROR (x21)
135
    0012.301: 135 00 00 19 6A CC 14 14 27  (x6)
    0012.407: 135 00 00 19 6A CC 14 14 27  (x7)
    0012.501: 135 00 00 19 6A CC 14 14 27  (x8)
    0012.605: 135 00 00 19 6A CC 14 14 27  (x9)
    0012.709: 135 00 00 19 6A CC 14 14 27  (x10)
    0012.809: 135 00 00 19 6A CC 14 14 28  (x1)
    0012.907: 135 00 00 19 6A CC 14 14 28  (x2)
    0013.007: 135 00 00 19 6A CC 14 14 28  (x3)
    0013.111: 135 00 00 19 6A CC 14 14 28  (x4)
    0013.199: 135 00 00 19 6A CC 14 14 28  (x5)
    0013.299: 135 00 00 19 6A CC 14 14 28  (x6)
    0013.399: 135 00 00 19 6A CC 14 14 28  (x7)
    0013.511: 135 00 00 19 6A CC 14 14 28  (x8)
    0013.607: 135 00 00 19 6A CC 14 14 28  (x9)
    0013.706: 135 00 00 19 6A CC 14 14 28  (x10)
    0013.807: 135 00 00 19 6A CC 14 14 29  (x1)
    0013.906: 135 00 00 19 6A CC 14 14 29  (x2)
    0014.006: 135 00 00 19 6A CC 14 14 29  (x3)
    0014.109: 135 00 00 19 6A CC 14 14 29  (x4)
    0014.209: 135 00 00 19 6A CC 14 14 29  (x5)
    0014.307: 135 00 00 19 6A CC 14 14 29  (x6)
    0014.407: 135 00 00 19 6A CC 14 14 29  (x7)
    0014.511: 135 00 00 19 6A CC 14 14 29  (x8)
    0014.597: 135 00 00 19 6A CC 14 14 29  (x9)
    0014.718: 135 00 00 19 6A CC 14 14 29  (x10)
    00014.81: 135 00 00 19 6A CC 14 14 2A  (x1)
12A
    0010.146: 12A 40 E0 70 72 00 00 10 90 <DATA ERROR (x11)
    0010.262: 12A 40 E0 70 72 00 00 10 A0 <DATA ERROR (x12)
    0010.353: 12A 40 E0 70 72 00 00 10 B0 <DATA ERROR (x13)
    00010.44: 12A 40 E0 70 72 00 00 10 80 <DATA ERROR (x14)
    0010.556: 12A 40 E0 70 72 00 00 10 90 <DATA ERROR (x12)
    0010.648: 12A 40 E0 70 72 00 00 10 A0 <DATA ERROR (x13)
    0010.738: 12A 40 E0 70 72 00 00 10 B0 <DATA ERROR (x14)
    0010.838: 12A 40 E0 70 72 00 00 10 80 <DATA ERROR (x15)
    0010.938: 12A 40 E0 70 72 00 00 10 90 <DATA ERROR (x13)
    0011.051: 12A 40 E0 70 72 00 00 10 A0 <DATA ERROR (x14)
    0011.143: 12A 40 E0 70 72 00 00 10 B0 <DATA ERROR (x15)
    0011.246: 12A 40 E0 70 72 00 00 10 80 <DATA ERROR (x16)
    0011.346: 12A 40 E0 70 72 00 00 10 90 <DATA ERROR (x14)
    0011.445: 12A 40 E0 70 72 00 00 10 A0 <DATA ERROR (x15)
    0011.545: 12A 40 E0 70 72 00 00 10 B0 <DATA ERROR (x16)
    0011.648: 12A 40 E0 70 72 00 00 10 80 <DATA ERROR (x17)
    0011.749: 12A 40 E0 70 72 00 00 10 90 <DATA ERROR (x15)
    0011.856: 12A 40 E0 70 72 00 00 10 A0 <DATA ERROR (x16)
    0011.948: 12A 40 E0 70 72 00 00 10 B0 <DATA ERROR (x17)
4C9
    0001.206: 4C9 00 00 00 00 00 00 00  (x3)
324
    0004.142: 324 00 01 FF  (x9)
