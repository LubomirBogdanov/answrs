#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"

volatile uint32_t *ddr_start_register = (volatile uint32_t *)0x10000000;

int main(){
    init_platform();

    *ddr_start_register = 0;

    usleep(10000000);

    *ddr_start_register = 1;

    while(1){

    }

    cleanup_platform();

    return 0;
}

