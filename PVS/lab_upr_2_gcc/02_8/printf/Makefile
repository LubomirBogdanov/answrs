#
#Submodule printf.c
#

all: printf.o

printf.o:
		arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -nostartfiles --specs=nosys.specs -mfloat-abi=soft -O0 -g -c printf.c -o ../debug/printf.o