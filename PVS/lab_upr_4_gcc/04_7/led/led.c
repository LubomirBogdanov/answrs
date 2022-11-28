#include "led.h"

/*!
 * \var ahb1enr
 * \brief A variable that corresponds to the RCC_AHB1ENR register.
 */
 volatile uint32_t *ahb1enr = (volatile uint32_t *)0x40023830;

 /*!
  * \var gpio_a_moder
  * \brief A variable that corresponds to the GPIOA_MODER register.
  */
 volatile uint32_t *gpio_a_moder = (volatile uint32_t *)0x40020000;

 /*!
  * \var gpio_a_otyper
  * \brief A variable that corresponds to the GPIOA_TYPER register.
  */
 volatile uint32_t *gpio_a_otyper = (volatile uint32_t *)0x40020004;

 /*!
  * \var gpio_a_odr
  * \brief A variable that corresponds to the GPIOA_ODR register.
  */
 volatile uint32_t *gpio_a_odr = (volatile uint32_t *)0x40020014;

 /*!
  * \brief This function initializes a single pin
  * from a GPIO port where an LED is connected.
  *
  * To do an init, first the clock to the GPIO module
  * has to be enabled. Second, the respective GPIO has
  * to be configured as an OUTPUT. Third, the output
  * must be configured to be a push-pull. Finally,
  * the GPIO is turn ON upon initialization.
  *
  * \return None.
  */
void led_init(void){
	*ahb1enr |= RCC_AHB1ENR_GPIOA_EN;
	*gpio_a_moder |= GPIOA_MODER_PA12; //PA12 - output
	*gpio_a_otyper &= GPIOA_OTYPER_PA12; //PA12 - push-pull
	*gpio_a_odr |= GPIOA_ODR_PA12;
}

/*!
 * \brief This function sets a logic
 * high on the respective pin.
 *
 * \return None.
 */
void led_set(void){
	*gpio_a_odr |= GPIOA_ODR_PA12;
}

/*!
 * \brief This function clears the respective pin
 * a logic low.
 *
 * \return None.
 */
void led_clear(void){
	*gpio_a_odr &= ~GPIOA_ODR_PA12;
}
