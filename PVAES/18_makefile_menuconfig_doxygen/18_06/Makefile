all: out_dir main.elf

main.elf: main.c
	mb-gcc -Wl,-T -Wl,lscript.ld -Wl,--no-relax -Wl,--gc-sections -I./include -L./ -lxil -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul main.c -o debug/main.elf
	
out_dir:
	mkdir -p debug

clean:
	rm -rf debug

prog:
	xsct program_fpga.tcl			
