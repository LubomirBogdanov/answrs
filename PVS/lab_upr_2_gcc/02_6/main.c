#include "autoconf.h"
#include "main.h"
#include "led.h"
#include "uart.h"
#include "printf.h"

#if defined CONFIG_LED_BLINK_ITERATOR_50000
#define LED_BLINK 50000
#elif defined CONFIG_LED_BLINK_ITERATOR_200000
#define LED_BLINK 200000
#elif defined CONFIG_LED_BLINK_ITERATOR_400000
#define LED_BLINK 400000
#endif

/*!
 * \brief The main entry of the application.
 * This function initializes a GPIO and a UART,
 * then outputs a message over the UART and
 * starts blinking the diode.
 *
 * \return None.
 */
int main(void){
	volatile int i;

	led_init();
	uart_init(CONFIG_UART_BAUD_RATE);

#if (PRINTF_MESSAGE == 1)
	printf("This is an example usage of printf and USART%d\n", 1);
#elif (PRINTF_MESSAGE == 2)
	printf("This is message number 2.\n");
#elif (PRINTF_MESSAGE == 3)
	printf("This is message number 3.\n");
#endif

	while (1){
		led_set();
		for(i = 0; i < LED_BLINK; i++){ }
		led_clear();
		for(i = 0; i < LED_BLINK; i++){ }
	}
}

