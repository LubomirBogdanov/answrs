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

	int_status = XGpio_InterruptGetStatus(&GPIO0);

	XGpio_InterruptClear(&GPIO0, int_status);
}


int main(void){
	XScuGic_Config *intc_config;

	intc_config = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);
	XScuGic_CfgInitialize(&INTC0, intc_config, intc_config->CpuBaseAddress);
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
		XGpio_DiscreteWrite(&GPIO1, 1, 0x00);
		usleep(200000);
		XGpio_DiscreteWrite(&GPIO1, 1, 0x01);
		usleep(200000);
	}

	return 0;
}

