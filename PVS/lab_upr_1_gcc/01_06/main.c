#include <stdint.h>
#include "led.h"

int main(void){
	volatile int i;

	led_init();

	while (1){
		led_set();
		for(i = 0; i < 200000; i++){ }
		led_clear();
		for(i = 0; i < 200000; i++){ }
	}
}

