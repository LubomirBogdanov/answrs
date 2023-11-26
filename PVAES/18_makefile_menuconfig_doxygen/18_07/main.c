#include "led.h"
#include "uart.h"
#include "print.h"
#include "sleep.h"

int main(void){   
	
   led_init();
   uart_init();
   
   printf("Starting blinky firmware on MicroBlaze ...\n\r");

    while(1){
        printf("led: 1\n\r");
        led_set();
        usleep(100000);
        printf("led: 0\n\r");
        led_clear();
        usleep(100000);
    }

    return 0;
}
