#include <stdint.h>

#define RCC_AHB1ENR_GPIOA_EN			0x01
#define GPIOA_MODER_PA12				0x1000000
#define GPIOA_OTYPER_PA12 				0x1000
#define GPIOA_ODR_PA12					0x1000

volatile uint32_t *ahb1enr = (volatile uint32_t *)0x40023830;
volatile uint32_t *gpio_a_moder = (volatile uint32_t *)0x40020000;
volatile uint32_t *gpio_a_otyper = (volatile uint32_t *)0x40020004;
volatile uint32_t *gpio_a_odr = (volatile uint32_t *)0x40020014;

extern uint32_t _estack;
extern uint32_t _sdata_lma;
extern uint32_t _sdata;
extern uint32_t _edata;
extern uint32_t _sbss;
extern uint32_t _ebss;

void reset_handler(void);
void nmi_handler(void);
void hard_fault_Handler(void);
void mem_manage_handler(void);
void bus_fault_handler(void);
void usage_fault_handler(void);
void svc_handler(void);
void debug_mon_handler(void);
void pend_sv_handler(void);
void systick_handler(void);
void default_handler(void);
int main(void);

__attribute__ ((section(".vector_table")))
void (* const vector_table[])(void) = {
	(void *) &_estack, //main stack pointer = _estack
	reset_handler,
	nmi_handler,
	hard_fault_Handler,
	mem_manage_handler,
	bus_fault_handler,
	usage_fault_handler,
	0,
	0,
	0,
	0,
	svc_handler,
	debug_mon_handler,
	0,
	pend_sv_handler,
	systick_handler,
	default_handler,              			/* Window Watchdog interrupt                                           */
	0,                            			/* Reserved                                                            */
	default_handler,        			/* Tamper and TimeStamp interrupts through the EXTI line               */
	default_handler,          			/* RTC Tamper or TimeStamp /CSS on LSE through EXTI line 19 interrupts */
	default_handler,             			/* Flash global interrupt                                              */
	default_handler,               			/* RCC global interrupt                                                */
	default_handler,             			/* EXTI Line0 interrupt                                                */
	default_handler,             			/* EXTI Line1 interrupt                                                */
	default_handler,             			/* EXTI Line2 interrupt                                                */
	default_handler,             			/* EXTI Line3 interrupt                                                */
	default_handler,             			/* EXTI Line4 interrupt                                                */
	default_handler,      			/* DMA1 Stream0 global interrupt                                       */
	default_handler,      			/* DMA1 Stream1 global interrupt                                       */
	default_handler,      			/* DMA1 Stream2 global interrupt                                       */
	default_handler,      			/* DMA1 Stream3 global interrupt                                       */
	default_handler,      			/* DMA1 Stream4 global interrupt                                       */
	default_handler,      			/* DMA1 Stream5 global interrupt                                       */
	default_handler,      			/* DMA1 Stream6 global interrupt                                       */
	default_handler,               			/* ADC1 global interrupt                                               */
	default_handler,           			/* CAN1 TX interrupts                                                  */
	default_handler,          			/* CAN1 RX0 interrupts                                                 */
	default_handler,          			/* CAN1 RX1 interrupts                                                 */
	default_handler,          			/* CAN1 SCE interrupt                                                  */
	default_handler,           			/* EXTI Line[9:5] interrupts                                           */
	default_handler,     			/* TIM1 Break interrupt and TIM9 global interrupt                      */
	0,                            			/* Reserved                                                            */
	default_handler,			/* TIM1 Trigger and Commutation interrupts and TIM11 global interrupt  */
	0,                            			/* Reserved                                                            */
	default_handler,              			/* TIM2 global interrupt                                               */
	default_handler,              			/* TIM3 global interrupt                                               */
	default_handler,              			/* TIM4 global interrupt                                               */
	default_handler,           			/* I2C1 event interrupt                                                */
	default_handler,           			/* I2C1 error interrupt                                                */
	0,                            			/* Reserved                                                            */
	0,                            			/* Reserved                                                            */
	default_handler,              			/* SPI1 global interrupt                                               */
	default_handler,              			/* SPI2 global interrupt                                               */
	default_handler,            			/* USART1 global interrupt                                             */
	default_handler,            			/* USART2 global interrupt                                             */
	default_handler,            			/* USART3 global interrupt                                             */
	default_handler,         			/* EXTI Line[15:10] interrupts                                         */
	default_handler,         			/* RTC alarms through EXTI line 18 interrupts                          */
	default_handler,       			/* USB On-The-Go FS Wakeup through EXTI line interrupt                 */
	default_handler,    			/* TIM8 Break interrupt and TIM12 global interrupt                     */
	default_handler,     			/* TIM8 Update interrupt and TIM13 global interrupt                    */
	default_handler,			/* TIM8 Trigger and Commutation interrupts and TIM14 global interrupt  */
	default_handler,           			/* TIM8 Capture Compare interrupt                                      */
	default_handler,      			/* DMA1 Stream7 global interrupt                                       */
	default_handler,               			/* FMC global interrupt                                                */
	default_handler,              			/* SDIO global interrupt                                               */
	default_handler,              			/* TIM5 global interrupt                                               */
	default_handler,              			/* SPI3 global interrupt                                               */
	0,                            			/* Reserved                                                            */
	default_handler,             			/* UART5 global interrupt                                              */
	default_handler,          			/* TIM6 global interrupt, DAC1 and DAC2 underrun error interrupt       */
	default_handler,              			/* TIM7 global interrupt                                               */
	default_handler,      			/* DMA2 Stream0 global interrupt                                       */
	default_handler,      			/* DMA2 Stream1 global interrupt                                       */
	default_handler,      			/* DMA2 Stream2 global interrupt                                       */
	default_handler,      			/* DMA2 Stream3 global interrupt                                       */
	default_handler,      			/* DMA2 Stream4 global interrupt                                       */
	0,                            			/* Reserved                                                            */
	0,                            			/* Reserved                                                            */
	default_handler,           			/* CAN2 TX interrupts                                                  */
	default_handler,          			/* CAN2 RX0 interrupts                                                 */
	default_handler,          			/* CAN2 RX1 interrupts                                                 */
	default_handler,          			/* CAN2 SCE interrupt                                                  */
	default_handler,            			/* USB On The Go FS global interrupt                                   */
	default_handler,      			/* DMA2 Stream5 global interrupt                                       */
	default_handler,      			/* DMA2 Stream6 global interrupt                                       */
	default_handler,      			/* DMA2 Stream7 global interrupt                                       */
	0,                            			/* Reserved                                                            */
	0,                            			/* Reserved                                                            */
	0,                            			/* Reserved                                                            */
	default_handler,    			/* USB On The Go HS End Point 1 Out global interrupt                   */
	default_handler,     			/* USB On The Go HS End Point 1 In global interrupt                    */
	default_handler,       			/* USB On The Go HS Wakeup through EXTI interrupt                      */
	default_handler,            			/* USB On The Go HS global interrupt                                   */
	default_handler,              			/* DCMI global interrupt                                               */
	0,                            			/* Reserved                                                            */
	default_handler,          			/* Hash and Rng global interrupt                                       */
	default_handler,               			/* Floating point unit interrupt                                       */
	0,                            			/* Reserved                                                            */
	default_handler,             			/* UART 8 global interrupt                                             */
	default_handler,              			/* SPI 4 global interrupt                                              */
	default_handler,              			/* SPI 5 global interrupt                                              */
	default_handler,              			/* SPI 6 global interrupt                                              */
	default_handler,              			/* SAI1 global interrupt                                               */
	default_handler,           			/* LTDC global interrupt                                               */
	0,                            			/* Reserved                                                            */
	default_handler,             			/* DMA2D global interrupt                                              */
	0,                            			/* Reserved                                                            */
	0,                            			/* Reserved                                                            */
	0,                            			/* Reserved                                                            */
	0,                            			/* Reserved                                                            */
	0,                            			/* Reserved                                                            */
	0,                            			/* Reserved                                                            */
	0,                            			/* Reserved                                                            */
	default_handler,           			/* DSI host global interrupt                                           */
	0,                            			/* Reserved                                                            */
	0,                            			/* Reserved                                                            */
	0,                            			/* Reserved                                                            */
	0,                            			/* Reserved                                                            */
	default_handler,            			/* SDMMC2 global interrupt                                             */
	default_handler,           			/* CAN3 TX interrupt                                                   */
	default_handler,          			/* CAN3 RX0 interrupt                                                  */
	default_handler,          			/* CAN3 RX1 interrupt                                                  */
	default_handler,          			/* CAN3 SCE interrupt                                                  */
	default_handler,              			/* JPEG global interrupt                                               */
	default_handler             			/* MDIO slave global interrupt                                         */
};

void nmi_handler(void){
	while(1){ }
}

void hard_fault_Handler(void){
	while(1){ }
}

void mem_manage_handler(void){
	while(1){ }
}

void bus_fault_handler(void){
	while(1){ }
}

void usage_fault_handler(void){
	while(1){ }
}

void svc_handler(void){
	while(1){ }
}

void debug_mon_handler(void){
	while(1){ }
}

void pend_sv_handler(void){
	while(1){ }
}

void systick_handler(void){
	while(1){ }
}

void default_handler(void){
	while(1){ }
}

void reset_handler(void){
	uint32_t *source;
	uint32_t *destination;

	source = &_sdata_lma;

	for (destination = &_sdata; destination < &_edata; ){
		*destination++ = *source++;
	}

	for (destination = &_sbss; destination < &_ebss; ){
		*(destination++) = 0x00000000;
	}

	main();

    while(1){ }
}

int main(void){
	volatile int i;
	*ahb1enr |= RCC_AHB1ENR_GPIOA_EN;
	*gpio_a_moder |= GPIOA_MODER_PA12; //PA12 - output
	*gpio_a_otyper &= GPIOA_OTYPER_PA12; //PA12 - push-pull
	*gpio_a_odr |= GPIOA_ODR_PA12;

	while (1){
		*gpio_a_odr |= GPIOA_ODR_PA12;
		for(i = 0; i < 200000; i++){ }
		*gpio_a_odr &= ~GPIOA_ODR_PA12;
		for(i = 0; i < 200000; i++){ }
	}
}

