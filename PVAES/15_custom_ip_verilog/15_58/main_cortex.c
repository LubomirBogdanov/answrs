#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"

volatile int32_t *abs_in0 = ((volatile uint32_t *)0x43C00000)+7;
volatile int32_t *abs_in1 = ((volatile uint32_t *)0x43C00000)+8;
volatile int32_t *abs_div = ((volatile uint32_t *)0x43C00000)+9;
volatile uint32_t *abs_out = ((volatile uint32_t *)0x43C00000)+10;

int main(){
    init_platform();

    print("Starting ...\n\r");

    *abs_div = 4;
    *abs_in0 = -50;
    *abs_in1 = -50;

    xil_printf("Absolute: (|%d| + |%d|)/%d = %d\n\r", *abs_in0, *abs_in1, *abs_div, *abs_out);
    cleanup_platform();

    return 0;
}
