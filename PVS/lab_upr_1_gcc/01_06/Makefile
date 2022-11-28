#Created on 02 Oct 2020 by Lubomir Bogdanov
#This is an example and simple Makefile

all: main.bin
	
main.bin: main.axf
	arm-none-eabi-objcopy -O binary ./debug/main.axf ./debug/main.bin

main.axf: debug
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -nostartfiles --specs=nosys.specs -Tscript.ld main.c led.c startup.c -o ./debug/main.axf

debug:
	mkdir -p debug

flash: main.bin
	openocd -f board/stm32f7discovery.cfg -c"init" -c"reset halt" -c"flash probe 0" -c"flash write_image erase ./debug/main.bin 0x08000000" -c"reset run" -c"exit"

clean:
	rm -r debug 
