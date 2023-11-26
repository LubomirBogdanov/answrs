#include "led.h"
#include "uart.h"
#include "print.h"
#include "sleep.h"
#include "autoconf.h"

extern float asm_rms(float dig3, float dig2, float dig1, float dig0);

void my_func_3(void){
	volatile int a = 3, b = 30, c;
	int arr[20];

	c = a + b;
	
	for(int i = 0; i < 30; i++){
		arr[i] = 0x33;
	}
}

void my_func_2(void){
	volatile int a = 2, b = 20, c;

	c = a + b;

	my_func_3();
}

void my_func_1(void){
	volatile int a = 1, b = 10, c;

	c = a + b;

	my_func_2();
}

int main(void){
	float val3 = 4.002503;
	float val2 = 4.233456;
	float val1 = 4.789317;
	float val0 = 4.220734;
	float my_result;
	//volatile int i;
	
    led_init();
    uart_init();

	my_result = asm_rms(val3, val2, val1, val0);

	//Expected output: 4.321294158
	printf("The result is --> %12.6f\n", my_result);
	
	my_func_1();

	while (1){
        	led_set();
        	//usleep(1000000);
        	for(volatile int i = 0; i < 1000000; i++){ }
        	led_clear();        	
        	//usleep(1000000);
        	for(volatile int i = 0; i < 1000000; i++){ }
	}
}

