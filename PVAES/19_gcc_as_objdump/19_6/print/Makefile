#
#Submodule printf.c
#

all: print.o

print.o: print.c
	mb-gcc -Os -I../include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul -c print.c -o ../debug/print.o
