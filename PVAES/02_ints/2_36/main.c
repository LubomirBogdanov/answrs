/*
 * main.c
 *
 *  Created on: Oct 17, 2021
 *      Author: lbogdanov
 */
#include <stdio.h>
#include <xgpio.h>
#include "xparameters.h"
#include "sleep.h"
#include "xscugic.h"
#include "xil_exception.h"

XScuGic INTC0;
XGpio GPIO1;
XGpio GPIO0;

void xgpio_int_handler(void *InstancePtr){
	u32 int_status;
	u32 buttons_status;
	static u32 led_status = 0x00;

	int_status = XGpio_InterruptGetStatus(&GPIO0);

	if(int_status == XGPIO_IR_CH1_MASK){
		buttons_status = XGpio_DiscreteRead(&GPIO0, 1);
		switch(buttons_status){
		case 0x01:
			led_status ^= 0x01;
			XGpio_DiscreteWrite(&GPIO1, 1, led_status);
			break;
		case 0x02:
			led_status ^= 0x02;
			XGpio_DiscreteWrite(&GPIO1, 1, led_status);
			break;
		case 0x04:
			led_status ^= 0x04;
			XGpio_DiscreteWrite(&GPIO1, 1, led_status);
			break;
		case 0x08:
			led_status ^= 0x08;
			XGpio_DiscreteWrite(&GPIO1, 1, led_status);
			break;
		}
	}

	usleep(200000);

	XGpio_InterruptClear(&GPIO0, int_status);
}


int main(void){
	XScuGic_Config *intc_config;

	intc_config = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);
	XScuGic_CfgInitialize(&INTC0, intc_config, intc_config->CpuBaseAddress);
	XScuGic_SetPriorityTriggerType(&INTC0, XIL_EXCEPTION_ID_INT, 0xA0, 0x3);
	XScuGic_Connect(&INTC0, XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR, (Xil_ExceptionHandler) xgpio_int_handler,	&GPIO0);
	XScuGic_Enable(&INTC0, XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR);
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XScuGic_InterruptHandler, &INTC0);
	Xil_ExceptionEnable();

	XGpio_Initialize(&GPIO1, XPAR_AXI_GPIO_1_DEVICE_ID);
	XGpio_SetDataDirection(&GPIO1, 1, 0x0);
	XGpio_Initialize(&GPIO0, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&GPIO0, 1, 0xF);
	XGpio_SetDataDirection(&GPIO0, 2, 0xF);

	XGpio_InterruptEnable(&GPIO0, 0xFF);
	XGpio_InterruptGlobalEnable(&GPIO0);

	while(1){

	}

	return 0;
}

