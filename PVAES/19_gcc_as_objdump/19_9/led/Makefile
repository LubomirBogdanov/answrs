#
#Submodule led.c
#

all: led.o

led.o: led.c
	mb-gcc -msoft-float -g -O0 -I../include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul -c led.c -o ../debug/led.o
