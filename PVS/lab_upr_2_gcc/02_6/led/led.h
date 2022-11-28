#ifndef __LED_H__
#define __LED_H__

#include <stdint.h>

/*!
 * \def RCC_AHB1ENR_GPIOA_EN
 *
 * \brief A bitmask for the GPIO_EN bit.
 */
#define RCC_AHB1ENR_GPIOA_EN		0x01

/*!
 * \def GPIOA_MODER_PA12
 *
 * \brief A bitmask for the MODER_PA12 bit.
 */
#define GPIOA_MODER_PA12			0x1000000

/*!
 * \def GPIOA_OTYPER_PA12
 *
 * \brief A bitmask for the OTYPER_PA12 bit.
 */
#define GPIOA_OTYPER_PA12 			0x1000

/*!
 * \def GPIOA_ODR_PA12
 *
 * \brief A bitmask for the ODR_PA12 bit.
 */
#define GPIOA_ODR_PA12				0x1000

void led_init(void);
void led_set(void);
void led_clear(void);

#endif
