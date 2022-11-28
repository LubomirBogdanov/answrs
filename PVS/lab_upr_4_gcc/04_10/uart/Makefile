#
#Submodule uart.c
#

all: uart.o

uart.o:
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -nostartfiles --specs=nosys.specs -mfloat-abi=hard -mfpu=fpv5-d16 -O0 -g -c -fpic uart.c -o ../debug/uart.o