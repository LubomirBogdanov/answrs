/*
 * main.c
 *
 *  Created on: Sep 23, 2023
 *      Author: lbogdanov
 */

#include <stdio.h>
#include <xgpio.h>
#include "xparameters.h"
#include "sleep.h"
#include "xmbox.h"
#include "xil_exception.h"
#include "xintc.h"

XGpio output;
XIntc intc_0;
XMbox mailbox_0;

void mailbox_interrupt_handler(void *){
	u32 bytes_receved = 0;
	char receive_buffer[32];

	XMbox_ClearInterrupt(&mailbox_0, XMB_IX_RTA);
	//Clear the AXI interrupt controller's pending flag
	XIntc_Acknowledge(&intc_0, XPAR_AXI_INTC_0_MAILBOX_0_INTERRUPT_0_INTR);

	XMbox_Read(&mailbox_0, (u32 *)receive_buffer, 4, &bytes_receved);

	XMbox_Flush(&mailbox_0);

	if(bytes_receved > 0){
		if(!strcmp(receive_buffer, "ON  ")){ //multiple of 4 bytes
			XGpio_DiscreteWrite(&output, 1, 0x01);
		}

		if(!strcmp(receive_buffer, "OFF ")){ //multiple of 4 bytes
			XGpio_DiscreteWrite(&output, 1, 0x00);
		}
	}
}

int main(void){
	XMbox_Config *mailbox_config;

	XGpio_Initialize(&output, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&output, 1, 0x0);
	XGpio_DiscreteWrite(&output, 1, 0x00);

	XIntc_Initialize(&intc_0, XPAR_INTC_0_DEVICE_ID);
	XIntc_SelfTest(&intc_0);
	XIntc_Connect(&intc_0, XPAR_AXI_INTC_0_MAILBOX_0_INTERRUPT_0_INTR, (XInterruptHandler)mailbox_interrupt_handler, &mailbox_0);
	XIntc_Start(&intc_0, XIN_REAL_MODE);
	XIntc_Enable(&intc_0, XPAR_AXI_INTC_0_MAILBOX_0_INTERRUPT_0_INTR);

	Xil_ExceptionInit();
	Xil_ExceptionEnable();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XIntc_InterruptHandler, &intc_0);

    mailbox_config = XMbox_LookupConfig(XPAR_MBOX_0_DEVICE_ID);
    XMbox_CfgInitialize(&mailbox_0, mailbox_config, mailbox_config->BaseAddress);

    XMbox_SetReceiveThreshold(&mailbox_0, 0);
    XMbox_SetInterruptEnable(&mailbox_0, XMB_IX_RTA);

    microblaze_register_handler(mailbox_interrupt_handler, NULL);
    microblaze_enable_interrupts();

	while(1){
		usleep(50000);
	}

	return 0;
}
