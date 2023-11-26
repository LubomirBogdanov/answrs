#include "led.h"
#include "uart.h"
#include "print.h"
#include "sleep.h"
#include "autoconf.h"

#if defined CONFIG_LED_DELAY_50000_US
	#define LED_DELAY_US	50000
#elif defined CONFIG_LED_DELAY_500000_US
	#define LED_DELAY_US	500000
#elif defined CONFIG_LED_DELAY_2000000_US
	#define LED_DELAY_US	2000000
#else
	#error "Unsupported LED delay!"
#endif

/*!
 * \brief This is the main entry point of the
 * MicroBlaze firmware.
 *
 * The MicroBlaze firmware blinks a LED with
 * predefined periods and also displays a 
 * predefined start-up message
 *
 * \return None.
*/
int main(void){   
	
   led_init();
   uart_init();
   
   printf("%s\n\r", CONFIG_PRINT_MESSAGE);

    while(1){
        printf("led: 1\n\r");
        led_set();
        usleep(LED_DELAY_US);
        printf("led: 0\n\r");
        led_clear();
        usleep(LED_DELAY_US);
    }

    return 0;
}
