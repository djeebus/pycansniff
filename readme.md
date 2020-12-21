# Usage
1. Run `./cansniff <device>`. 
2. If you receive a "buffer overflow" output, the program will dump out a list of packet sources. 
3. Pick out packets that represent a large portion of what you have received, these are likely garbage.
4. Run the program again, adding `-b <id>` for each source that can be skipped.
5. Repeat steps 2-4 until you stop receiving "buffer overflow".
6. Press <enter> until you see "recording", and trigger the packet that you're trying to capture
7. If you can't find your packet, press <enter> until you see "skipping" and wait a while. Packets are now being blacklisted
8. Repeat steps 6 and 7 until you are left with only your packets.
