#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"

volatile uint32_t *ddr_start_register = (volatile uint32_t *)0x10000000;

int main(){
    init_platform();

    while(1){
    	strcpy((char *)ddr_start_register, "Hello, this is MicroBlaze!\n\r");
    	usleep(1000000);
    	strcpy((char *)ddr_start_register, "The messages are in the shared DDR SDRAM.\n\r");
    	usleep(1000000);
    	strcpy((char *)ddr_start_register, "The example is not safe, we have no mutex.\n\r");
    	usleep(1000000);
    }

    cleanup_platform();

    return 0;
}

