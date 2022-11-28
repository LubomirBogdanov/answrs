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

#include "xparameters.h"
#include "xtmrctr.h"
#include "xscugic.h"
#include "xil_exception.h"

XScuGic INTC0;
XTmrCtr	TIM0;

void timer0_int_handler(void *data){
	print("Hello World\n\r");
	XTmrCtr_Reset(&TIM0, 0);
}

int main(){
	XScuGic_Config *intc_config;
    init_platform();

	intc_config = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);
	XScuGic_CfgInitialize(&INTC0, intc_config, intc_config->CpuBaseAddress);
	XScuGic_Connect(&INTC0, XPAR_FABRIC_AXI_TIMER_0_INTERRUPT_INTR, (Xil_ExceptionHandler) timer0_int_handler, &TIM0);
	XScuGic_Enable(&INTC0, XPAR_FABRIC_AXI_TIMER_0_INTERRUPT_INTR);
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XScuGic_InterruptHandler, &INTC0);
	Xil_ExceptionEnable();

	XTmrCtr_Initialize(&TIM0, XPAR_AXI_TIMER_0_DEVICE_ID);
	XTmrCtr_SetHandler(&TIM0, (XTmrCtr_Handler)timer0_int_handler, &TIM0);
	XTmrCtr_SetResetValue(&TIM0, 0, 100000000U);
	XTmrCtr_SetOptions(&TIM0, 0, XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION | XTC_DOWN_COUNT_OPTION);
	XTmrCtr_Start(&TIM0, 0);

    print("Starting timer with interrupts...\n\r");

    while(1){

    }

    cleanup_platform();

    return 0;
}
