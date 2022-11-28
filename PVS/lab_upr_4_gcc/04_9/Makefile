#Created on 1 Dec 2020 by Lubomir Bogdanov
#This is an example and simple Makefile

LD_DIRS = -L/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/arm-none-eabi/lib/thumb/v7e-m+dp/hard -L/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/lib/gcc/arm-none-eabi/8.2.1/thumb/v7e-m+dp/hard
CC_DIRS = -I./hal_lib/Inc -I./hal_lib/CMSIS/Device/ST/STM32F7xx/Include -I./hal_lib/BSP/STM32F769I-Discovery -I./hal_lib/CMSIS/Device/ST/STM32F7xx/Include -I./hal_lib/CMSIS/DSP/Include -I./hal_lib/CMSIS/Include -I./hal_lib/CMSIS/Device/ST/STM32F7xx/Include
CC_DEFS = -DSTM32 -DSTM32F7 -DUSE_HAL_DRIVER -DSTM32F769NIHx -DDEBUG -DSTM32F769I_DISCO -D__FPU_PRESENT -DARM_MATH_CM7 -DSTM32F769xx

all: main.bin list size

.PHONY: menuconfig

menuconfig:
	./menuconfig/build/mconf Kconfig
	./menuconfig/build/conf Kconfig --silentoldconfig autoconf.h

main.bin: main.axf
	arm-none-eabi-objcopy -O binary ./debug/main.axf ./debug/main.bin

main.axf: debug main.o sbrk.o startup.o standard_rms.o
	arm-none-eabi-ld -nostartfiles --gc-sections ${LD_DIRS} -L./hal_lib -L./debug -Tscript.ld ./debug/main.o ./debug/sbrk.o ./debug/startup.o ./debug/standard_rms.o -o ./debug/main.axf -lm -lc -lmy_stm32 -lgcc

debug:
	mkdir -p debug

main.o: main.s
	arm-none-eabi-as -mcpu=cortex-m7 -mthumb ${CC_DIRS} -I./uart -I./led -I./printf -I./button ./debug/main.s -o ./debug/main.o

main.s: 
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -nostartfiles -ffunction-sections --specs=nosys.specs -mfloat-abi=hard -mfpu=fpv5-d16 -O0 -g -S ${CC_DEFS} ${CC_DIRS} -I./ -I./uart -I./led -I./printf -I./button main.c -o ./debug/main.s
	
startup.o:
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -nostartfiles --specs=nosys.specs -mfloat-abi=hard -mfpu=fpv5-d16 -g -c startup.c -o ./debug/startup.o
	
standard_rms.o: 
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -nostartfiles --specs=nosys.specs -mfloat-abi=hard -mfpu=fpv5-d16 -g -c standard_rms.c -o ./debug/standard_rms.o 
	
sbrk.o:
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -nostartfiles --specs=nosys.specs -mfloat-abi=hard -mfpu=fpv5-d16 -g -c sbrk.c -o ./debug/sbrk.o

static_lib: debug led.o uart.o button.o printf.o
	arm-none-eabi-ar -r ./debug/libmy_stm32.a ./debug/led.o ./debug/uart.o ./debug/button.o ./debug/printf.o
	${MAKE} static_lib_size
	
static_lib_size:
	arm-none-eabi-size ./debug/libmy_stm32.a	

	
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
