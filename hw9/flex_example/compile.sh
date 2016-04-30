#!/bin/bash

flex phone_number.l
gcc -o scanner lex.yy.c -lfl
