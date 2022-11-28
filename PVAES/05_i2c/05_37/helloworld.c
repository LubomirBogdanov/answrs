/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <string.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"

#include "xparameters.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xiic.h"

#define EEPROM_ADDRESS 		0x50 //7-bit address, 1010 000

XScuGic INTC0;
XIic I2C0;

u8 receiving_data;
u8 transmitting_data;

void i2c_send_handler(XIic *instance_ptr){
	transmitting_data = 0;
}

void i2c_receive_handler(XIic *instance_ptr){
	receiving_data = 0;
}

void i2c_status_handler(XIic *instance_ptr, int event){

}

int main(){
	u8 read_buffer[256];
	u8 cmd_buffer[16];
	XScuGic_Config *intc_config;
	XIic_Config *iic_config;

	init_platform();

	xil_printf("Starting the I2C EEPROM example ...\n\r");

	intc_config = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);
	XScuGic_CfgInitialize(&INTC0, intc_config, intc_config->CpuBaseAddress);
	XScuGic_SetPriorityTriggerType(&INTC0, XPAR_FABRIC_IIC_0_VEC_ID, 0xA0, 0x3);
	XScuGic_Connect(&INTC0, XPAR_FABRIC_AXI_IIC_0_IIC2INTC_IRPT_INTR, (Xil_ExceptionHandler) XIic_InterruptHandler, &I2C0);
	XScuGic_Enable(&INTC0, XPAR_FABRIC_AXI_IIC_0_IIC2INTC_IRPT_INTR);
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XScuGic_InterruptHandler, &INTC0);
	Xil_ExceptionEnable();

	iic_config = XIic_LookupConfig(XPAR_IIC_0_DEVICE_ID);
	XIic_CfgInitialize(&I2C0, iic_config, iic_config->BaseAddress);
	XIic_SetSendHandler(&I2C0, &I2C0, (XIic_Handler) i2c_send_handler);
	XIic_SetRecvHandler(&I2C0, &I2C0, (XIic_Handler) i2c_receive_handler);
	XIic_SetStatusHandler(&I2C0, &I2C0, (XIic_StatusHandler) i2c_status_handler);
	XIic_SetAddress(&I2C0, XII_ADDR_TO_SEND_TYPE, EEPROM_ADDRESS);

	memset(read_buffer, 0x00, 256);

	receiving_data = 1;
	transmitting_data = 1;

	cmd_buffer[0] = 0x00;
	XIic_Start(&I2C0);
	XIic_MasterSend(&I2C0, cmd_buffer, 1);
	while ((transmitting_data) || (XIic_IsIicBusy(&I2C0) == TRUE)) { }
    XIic_Stop(&I2C0);

	XIic_Start(&I2C0);
	XIic_MasterRecv(&I2C0, read_buffer, 256);
	while ((receiving_data) || (XIic_IsIicBusy(&I2C0) == TRUE)) { }
	XIic_Stop(&I2C0);

	xil_printf("Eeprom read data:\n");
	for(u16 i = 0; i < 256; i++){
		if((i % 16) == 0){
			xil_printf("\n0x%02X: ", i);
		}
		xil_printf("%02X ", read_buffer[i]);
	}
	xil_printf("\n");

	while(1){ }

    cleanup_platform();

    return 0;
}
