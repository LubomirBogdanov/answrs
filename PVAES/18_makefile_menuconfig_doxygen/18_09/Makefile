#Created on 11 Oct 2023 by Lubomir Bogdanov
#This is an example and a simple Makefile

all: out_dir ./debug/main.elf size

./debug/main.elf: ./debug/led.o ./debug/uart.o ./debug/print.o main.c
	mb-gcc -Wl,-T -Wl,lscript.ld -Wl,--no-relax -Wl,--gc-sections -I./include -I./led -I./uart -I./print -L./ -lxil -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul main.c ./debug/led.o ./debug/uart.o ./debug/print.o -o ./debug/main.elf
	
./debug/led.o: ./led/led.c
	${MAKE} -C led
	
./debug/uart.o: ./uart/uart.c
	${MAKE} -C uart

./debug/print.o: ./print/print.c
	${MAKE} -C print
		
prog: ./debug/main.elf
	xsct program_fpga.tcl
	
out_dir:
	mkdir -p debug

clean:
	rm -rf debug
	
size:
	mb-size ./debug/main.elf
	
.PHONY: menuconfig
	
menuconfig:
	./menuconfig/build/mconf Kconfig
	./menuconfig/build/conf Kconfig --silentoldconfig autoconf.h	



