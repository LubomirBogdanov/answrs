#
#Submodule uart.c
#

all: uart.o

uart.o:
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -nostartfiles --specs=nosys.specs -Os -c uart.c -o ../debug/uart.o