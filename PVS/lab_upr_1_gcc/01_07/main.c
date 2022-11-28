#include "main.h"
#include "led.h"
#include "uart.h"
#include "printf.h"

int main(void){
	volatile int i;

	led_init();
	uart_init(9600);

	printf("This is an example usage of printf and USART%d\n", 1);

	while (1){
		led_set();
		for(i = 0; i < 200000; i++){ }
		led_clear();
		for(i = 0; i < 200000; i++){ }
	}
}

