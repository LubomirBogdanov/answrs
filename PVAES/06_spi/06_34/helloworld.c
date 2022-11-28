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
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"

#include "xparameters.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xqspips.h"

XScuGic INTC0;
XQspiPs QSPI0;

volatile u8 transmitting_data;

void qspi_status_handler(void *CallBackRef, u32 StatusEvent, unsigned int ByteCount){
	transmitting_data = 0;
}

int main(){
	u8 cmd_buffer[256];
	u8 read_buffer[256];
	XScuGic_Config *intc_config;
	XQspiPs_Config *qspi_config;

    init_platform();

    print("Starting the SPI Flash example ...\n\r");

    intc_config = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);
    XScuGic_CfgInitialize(&INTC0, intc_config, intc_config->CpuBaseAddress);
    XScuGic_Connect(&INTC0, XPAR_XQSPIPS_0_INTR, (Xil_ExceptionHandler) XQspiPs_InterruptHandler, &QSPI0);
    XScuGic_Enable(&INTC0, XPAR_XQSPIPS_0_INTR);
    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XScuGic_InterruptHandler, &INTC0);
    Xil_ExceptionEnable();

    qspi_config = XQspiPs_LookupConfig(XPAR_XQSPIPS_0_DEVICE_ID);
    XQspiPs_CfgInitialize(&QSPI0, qspi_config, qspi_config->BaseAddress);
    XQspiPs_SetStatusHandler(&QSPI0, &QSPI0, (XQspiPs_StatusHandler) qspi_status_handler);
    XQspiPs_SetOptions(&QSPI0, XQSPIPS_FORCE_SSELECT_OPTION | XQSPIPS_MANUAL_START_OPTION | XQSPIPS_HOLD_B_DRIVE_OPTION);
    XQspiPs_SetClkPrescaler(&QSPI0, XQSPIPS_CLK_PRESCALE_8);
    XQspiPs_SetSlaveSelect(&QSPI0);

    memset(read_buffer, 0x00, 256);

    cmd_buffer[0] = 0x03;//Read ID command
    cmd_buffer[1] = 0x00; //Dummy byte (Address, MSB)
    cmd_buffer[2] = 0x00; //Dummy byte (Address, LSB)
    cmd_buffer[3] = 0x00; //Dummy byte (Address, LSB)

    for(u8 i = 0; i < 128; i++){
    	cmd_buffer[4 + i] = 0x00; //Dummy byte
    }

    transmitting_data = 1;

    XQspiPs_Transfer(&QSPI0, cmd_buffer, read_buffer, 132);

    while (transmitting_data){ }

    xil_printf("Data block:\n\r");
    for(u8 i = 0; i < 128; i++){
    	if((i % 16) == 0){
    		xil_printf("\n\r");
    	}
    	xil_printf("0x%02X ", read_buffer[4 + i]);
    }
    xil_printf("\n\r");

    while(1){ }

    cleanup_platform();

    return 0;
}
