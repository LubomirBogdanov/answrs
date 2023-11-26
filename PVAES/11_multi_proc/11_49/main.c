/*
 * main.c
 *
 *  Created on: Sep 22, 2023
 *      Author: lbogdanov
 */
#include <stdio.h>
#include <xgpio.h>
#include "xparameters.h"
#include "sleep.h"

int main(void){
	XGpio output;

	XGpio_Initialize(&output, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&output, 1, 0x0);

	while(1){
		XGpio_DiscreteWrite(&output, 1, 0x00);
		usleep(200000);
		XGpio_DiscreteWrite(&output, 1, 0x0f);
		usleep(200000);
	}

	return 0;
}
