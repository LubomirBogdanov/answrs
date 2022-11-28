#
#Submodule button.c
#

all: button.o

button.o:
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -nostartfiles --specs=nosys.specs -mfloat-abi=hard -mfpu=fpv5-d16 -I../ -I../printf -O0 -g -c -fpic button.c -o ../debug/button.o
