#
#Submodule uart.c
#

all: uart.o

uart.o: uart.c
	mb-gcc -g -O0 -I../include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul -c uart.c -o ../debug/uart.o
