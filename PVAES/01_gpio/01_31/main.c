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
	XGpio input;
	uint32_t button_state;

	XGpio_Initialize(&input, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_Initialize(&output, XPAR_AXI_GPIO_1_DEVICE_ID);

	XGpio_SetDataDirection(&input, 1, 0xF);
	XGpio_SetDataDirection(&output, 1, 0x0);

	while(1){
		button_state = XGpio_DiscreteRead(&input, 1);
		XGpio_DiscreteWrite(&output, 1, button_state);
	}

	return 0;
}

