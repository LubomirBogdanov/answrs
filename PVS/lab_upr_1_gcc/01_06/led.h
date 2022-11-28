#ifndef __LED_H__
#define __LED_H__

#include "main.h"

#define RCC_AHB1ENR_GPIOA_EN			0x01
#define GPIOA_MODER_PA12			0x1000000
#define GPIOA_OTYPER_PA12 			0x1000
#define GPIOA_ODR_PA12				0x1000

void led_init(void);
void led_set(void);
void led_clear(void);

#endif
