#Created on 29 Oct 2020 by Lubomir Bogdanov
#This is an example and simple Makefile

LD_DIRS = -L/home/lbogdanov/programs/gcc-arm-none-eabi-10.3-2021.10/arm-none-eabi/lib/thumb/v7e-m+dp/hard -L/home/lbogdanov/programs/gcc-arm-none-eabi-10.3-2021.10/lib/gcc/arm-none-eabi/10.3.1/thumb/v7e-m+dp/hard

all: main.bin list size

.PHONY: menuconfig

menuconfig:
	./menuconfig/build/mconf Kconfig
	./menuconfig/build/conf Kconfig --silentoldconfig autoconf.h

main.bin: main.axf
	arm-none-eabi-objcopy -O binary ./debug/main.axf ./debug/main.bin

main.axf: debug main.o sbrk.o startup.o standard_rms.o led.o uart.o printf.o button.o
	arm-none-eabi-ld ${LD_DIRS} -Tscript.ld ./debug/main.o ./debug/sbrk.o ./debug/led.o ./debug/uart.o ./debug/startup.o ./debug/printf.o ./debug/standard_rms.o ./debug/button.o -o ./debug/main.axf -lm -lc -lgcc

debug:
	mkdir -p debug

main.o: main.s
	arm-none-eabi-as -mcpu=cortex-m7 -mthumb -I./uart -I./led -I./printf -I./button ./debug/main.s -o ./debug/main.o

main.s: 
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -nostartfiles --specs=nosys.specs -mfloat-abi=hard -mfpu=fpv5-d16 -O0 -g -S -I./ -I./uart -I./led -I./printf -I./button main.c -o ./debug/main.s
	
startup.o:
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -nostartfiles --specs=nosys.specs -mfloat-abi=hard -mfpu=fpv5-d16 -g -c startup.c -o ./debug/startup.o
	
standard_rms.o: 
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -nostartfiles --specs=nosys.specs -mfloat-abi=hard -mfpu=fpv5-d16 -g -c standard_rms.c -o ./debug/standard_rms.o 
	
sbrk.o:
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -nostartfiles --specs=nosys.specs -mfloat-abi=hard -mfpu=fpv5-d16 -g -c sbrk.c -o ./debug/sbrk.o


	
led.o:
	${MAKE} -C led
	
uart.o:
	${MAKE} -C uart

printf.o:
	${MAKE} -C printf
	
button.o:
	${MAKE} -C button
		
flash: main.bin
	openocd -f board/stm32f7discovery.cfg -c"init" -c"reset halt" -c"flash probe 0" -c"flash write_image erase ./debug/main.bin 0x08000000" -c"reset run" -c"exit"

clean:
	rm -r debug 
	
list: main.o
	arm-none-eabi-objdump -S -D ./debug/main.o > ./debug/main.lst
	
size: main.axf	
	arm-none-eabi-size ./debug/main.axf	
