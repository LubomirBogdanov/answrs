#Created on 16 Oct 2023 by Lubomir Bogdanov
#This is an example and a simple Makefile

all: out_dir ./debug/main.elf ./debug/main.bin ./debug/main.lst size

./debug/main.lst: ./debug/main.o
	mb-objdump -S -D ./debug/main.o > ./debug/main.lst

./debug/main.bin: ./debug/main.elf
	mb-objcopy -O binary ./debug/main.elf ./debug/main.bin

./debug/main.elf: ./debug/led.o ./debug/uart.o ./debug/print.o ./debug/main.o
	mb-gcc -Wl,-T -Wl,lscript.ld -Wl,--no-relax -Wl,--gc-sections -L./ -lxil -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul ./debug/main.o ./debug/led.o ./debug/uart.o ./debug/print.o -o ./debug/main.elf
	
./debug/main.s: main.c
	mb-gcc -S -I./led -I./uart -I./print -I./include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul main.c -o ./debug/main.s
	
./debug/main.o: ./debug/main.s
	mb-as -mlittle-endian ./debug/main.s -o ./debug/main.o
	
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



