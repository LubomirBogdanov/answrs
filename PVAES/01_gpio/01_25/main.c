/*
 * main.c
 *
 *  Created on: Oct 5, 2021
 *      Author: lbogdanov
 */
#include <stdio.h>
#include <xgpio.h>
#include "xparameters.h"
#include "sleep.h"

int main(void){
	XGpio output;

	XGpio_Initialize(&output, XPAR_AXI_GPIO_1_DEVICE_ID);

	XGpio_SetDataDirection(&output, 1, 0x0);

	while(1){
		XGpio_DiscreteWrite(&output, 1, 0x00);
		usleep(200000);
		XGpio_DiscreteWrite(&output, 1, 0x01);
		usleep(200000);
	}

	return 0;
}

