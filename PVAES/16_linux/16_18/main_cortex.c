#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"

volatile uint32_t *abs_interrupt = ((volatile uint32_t *)0x43C00000)+11;
volatile uint32_t *gpio_out = ((volatile uint32_t *)0x43C00000)+12;

int main(){
    init_platform();

    print("Starting ...\n\r");

    *gpio_out = 0xffffffff;
    usleep(1000);
    *gpio_out = 0x00;
    usleep(2000000);

    while(1){
    	print("Send interrupt\n\r");
    	*abs_interrupt = 0x02;
    	*abs_interrupt = 0x00;
    	usleep(1000000);
    }

    cleanup_platform();

    return 0;
}
