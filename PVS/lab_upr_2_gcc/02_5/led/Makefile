#
#Submodule led.c
#

all: led.o

led.o:
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -nostartfiles --specs=nosys.specs -O0 -g -c led.c -o ../debug/led.o