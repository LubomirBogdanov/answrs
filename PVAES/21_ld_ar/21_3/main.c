#include "led.h"
#include "uart.h"
#include "print.h"
#include "sleep.h"
#include "autoconf.h"
#include "standard_rms.h"

int main(void){
	float val3 = 4.002503;
	float val2 = 4.233456;
	float val1 = 4.789317;
	float val0 = 4.220734;
	float my_result;
	volatile int i;
	
        led_init();
        uart_init();  

	my_result = standard_rms(val0, val1, val2, val3);

	//Expected output: 4.321294158
	printf("The result is --> %12.6f\n", my_result);

	while (1){
        	led_set();
       	usleep(1000000);
        	led_clear();
        	usleep(1000000);
	}
}

