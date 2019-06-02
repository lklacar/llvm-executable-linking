#!/bin/sh

as start.s -o start.o
clang -S -emit-llvm -O3 example.c
llc -filetype=obj example.ll
ld -o example example.o start.o
#ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o example example.o -lc

objdump -d example