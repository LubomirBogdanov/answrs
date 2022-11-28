#include "uart.h"

/*!
 * \var gpio_a_moder
 * \brief A variable that corresponds to the GPIOA_MODER register.
 */
static volatile uint32_t *gpio_a_moder = (volatile uint32_t *)0x40020000;

/*!
 * \var gpio_a_otyper
 * \brief A variable that corresponds to the GPIOA_TYPER register.
 */
static volatile uint32_t *gpio_a_otyper = (volatile uint32_t *)0x40020004;

/*!
 * \var gpio_afrh
 * \brief A variable that corresponds to the GPIOA_AFRH register.
 */
static volatile uint32_t *gpio_afrh = (volatile uint32_t *)0x40020024;

/*!
 * \var apb2enr
 * \brief A variable that corresponds to the RCC_APB2ENR register.
 */
static volatile uint32_t *apb2enr = (volatile uint32_t *)0x40023844;

/*!
 * \var ahb1enr
 * \brief A variable that corresponds to the RCC_AHB1ENR register.
 */
static volatile uint32_t *ahb1enr = (volatile uint32_t *)0x40023830;

/*!
 * \var usart_1_cr1
 * \brief A variable that corresponds to the USART_CR1 register.
 */
static volatile uint32_t *usart_1_cr1 = (volatile uint32_t *)0x40011000;

/*!
 * \var usart_1_brr
 * \brief A variable that corresponds to the USART1_BRR register.
 */
static volatile uint32_t *usart_1_brr = (volatile uint32_t *)0x4001100C;

/*!
 * \var usart_1_isr
 * \brief A variable that corresponds to the USART1_ISR register.
 */
static volatile uint32_t *usart_1_isr = (volatile uint32_t *)0x4001101C;

/*!
 * \var usart_1_tdr
 * \brief A variable that corresponds to the USART1_TDR register.
 */
static volatile uint32_t *usart_1_tdr = (volatile uint32_t *)0x40011028;


/*!
 * \brief This function initializes the UART module.
 * It can be used for redirecting the printf function.
 *
 * To initialize the UART, first the clock of the module
 * has to be enabled. Second, the GPIO pins have to be
 * multiplexed to the UART module. Third, the module
 * has to be enabled and last - the UART baudrate has to
 * be set according to the user settings.
 *
 * \param baud_rate - the speed of the data tranmission
 * over the interface, in bauds. Can be one of the
 * following integers: \b9600, \b19200, \b57600, \b115200.
 *
 * \return None.
 */
void uart_init(uint32_t baud_rate){
	*ahb1enr |= RCC_AHB1ENR_GPIOA_EN;
	*gpio_a_moder |= GPIOA_MODER_AF_PA9; //PA9 - alternate function
	*gpio_a_moder |= GPIOA_MODER_AF_PA10; //PA10 - alternate function
	*gpio_a_otyper &= GPIOA_OTYPER_PA9; //PA9 - push-pull
	*gpio_afrh |= GPIOA_AF7_PA9; //PA9 = USART1_TX
	*gpio_afrh |= GPIOA_AF7_PA10; //PA10 = USART1_RX

	*apb2enr |= RCC_APB2_ENR_USART1_EN; //Enable USART1 clock
	*usart_1_cr1 |= (USART1_UE | USART1_RE | USART1_TE);

	//Upon reset: f_ck = APB2PRESC(/1) = AHBPRESC(/1) = HSI(16 MHz) => BRR = 16MHz / f_ck
	switch(baud_rate){
	case 9600:
		*usart_1_brr = 0x682;
		break;
	case 19200://ne
		*usart_1_brr = 0x341;
		break;
	case 38400:
		*usart_1_brr = 0x1A0;
		break;
	case 57600:
		*usart_1_brr = 0x115;
		break;
	case 115200:
		*usart_1_brr = 0x8A;
		break;
	}

	while(!(*usart_1_isr & USART1_REACK)){ }
	while(!(*usart_1_isr & USART1_TEACK)){ }
}

/*!
 * \brief This function sends an array of chars
 * over the UART interface.
 *
 * \param buff - a pointer to an array of 8-bit characters.
 * \param buff_size - the number of elements in the array.
 *
 * \return None.
 */
void uart_send_buff(uint8_t *buff, uint8_t buff_size){
	while(buff_size--){
		*usart_1_tdr = *buff++;
		while(!(*usart_1_isr & USART1_TXE)){ }
	}
}


/*!
 * \brief This function is used by the printf( ) port. It
 * sends a single char over the UART interface. This function
 * is blocking.
 *
 * \param character - an 8-bit ASCII character.
 *
 * \return None.
 */
void _putchar(char character){
	*usart_1_tdr = character;
	while(!(*usart_1_isr & USART1_TXE)){ }
}
