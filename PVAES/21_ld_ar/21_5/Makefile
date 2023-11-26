#Created on 22 Oct 2023 by Lubomir Bogdanov
#This is an example and a simple Makefile

LD_DIRS = /home/lbogdanov/programs/xilinx/Vitis/2022.2/gnu/microblaze/lin/bin/../microblazeeb-xilinx-elf/usr/lib/le/bs/p/m/fpd
CRT_FILES = ${LD_DIRS}/crt0.o ${LD_DIRS}/crti.o ${LD_DIRS}/crtn.o ${LD_DIRS}/crtbegin.o ${LD_DIRS}/crtinit.o ${LD_DIRS}/crtend.o

all: out_dir ./debug/main.elf ./debug/main.bin ./debug/main.lst size

./debug/main.lst: ./debug/main.o
	mb-objdump -S -D ./debug/main.o > ./debug/main.lst	

./debug/main.bin: ./debug/main.elf
	mb-objcopy -O binary ./debug/main.elf ./debug/main.bin

./debug/main.elf: ./debug/led.o ./debug/uart.o ./debug/print.o ./debug/main.o ./debug/sbrk.o
	mb-ld -EL -Tlscript.ld --no-relax --gc-sections -L./ -L${LD_DIRS} ${CRT_FILES} ./debug/main.o ./debug/led.o ./debug/uart.o ./debug/print.o ./debug/sbrk.o -o ./debug/main.elf -lgloss -lm -lc -lgcc -lxil 

./debug/sbrk.o: ./sbrk.c
	mb-gcc -mhard-float -mxl-float-convert -mxl-float-sqrt -g -O0 -I../include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul -c sbrk.c -o ./debug/sbrk.o

	
./debug/main.s: main.c
	mb-gcc -mhard-float -mxl-float-convert -mxl-float-sqrt -g -O0 -S -I./led -I./uart -I./print -I./include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul main.c -o ./debug/main.s
	
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



