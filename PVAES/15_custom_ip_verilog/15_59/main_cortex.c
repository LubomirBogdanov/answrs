#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"

volatile int32_t *grad_0 = ((volatile uint32_t *)0x43C00000)+0;
volatile int32_t *grad_1 = ((volatile uint32_t *)0x43C00000)+1;
volatile int32_t *grad_2 = ((volatile uint32_t *)0x43C00000)+2;
volatile int32_t *grad_3 = ((volatile uint32_t *)0x43C00000)+3;
volatile int32_t *grad_4 = ((volatile uint32_t *)0x43C00000)+4;
volatile int32_t *grad_5 = ((volatile uint32_t *)0x43C00000)+5;
volatile int32_t *grad_out = ((volatile uint32_t *)0x43C00000)+6;

int main(){
    init_platform();

    print("Starting ...\n\r");

    *grad_0 = 2;
    *grad_1 = 5;
    *grad_2 = 2;
    *grad_3 = -5;
    *grad_4 = -5;
    *grad_5 = -5;

    xil_printf("Gradient: %d\n\r", *grad_out);

    cleanup_platform();

    return 0;
}
