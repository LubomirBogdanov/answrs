#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"

volatile uint32_t *gpio_out = ((volatile uint32_t *)0x43C00000)+12;

int main(){
    init_platform();

    print("Starting ...\n\r");

    while(1){
    	*gpio_out = 0x1;
    	usleep(1000);
    	*gpio_out = 0x0;
    	usleep(1000);

    	*gpio_out = 0x2;
    	usleep(1000);
    	*gpio_out = 0x0;
    	usleep(1000);
    }

    cleanup_platform();

    return 0;
}
