#include "led.h"

volatile uint32_t *ahb1enr = (volatile uint32_t *)0x40023830;
volatile uint32_t *gpio_a_moder = (volatile uint32_t *)0x40020000;
volatile uint32_t *gpio_a_otyper = (volatile uint32_t *)0x40020004;
volatile uint32_t *gpio_a_odr = (volatile uint32_t *)0x40020014;

void led_init(void){
	*ahb1enr |= RCC_AHB1ENR_GPIOA_EN;
	*gpio_a_moder |= GPIOA_MODER_PA12; //PA12 - output
	*gpio_a_otyper &= GPIOA_OTYPER_PA12; //PA12 - push-pull
	*gpio_a_odr |= GPIOA_ODR_PA12;
}

void led_set(void){
	*gpio_a_odr |= GPIOA_ODR_PA12;
}

void led_clear(void){
	*gpio_a_odr &= ~GPIOA_ODR_PA12;
}
