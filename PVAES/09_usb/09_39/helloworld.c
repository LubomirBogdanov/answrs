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
#include "xusbps.h"
#include "xscugic.h"
#include "xusbps_cdc.h"
#include "xuartps_hw.h"

XScuGic INTC;
XUsbPs USB0;

static void reset_usb(void) {
	// Ensure that the PHY is out of reset
	volatile u32 *gpio_base;
	volatile u32 *gpio_oen;
	volatile u32 *gpio_dir;

	/* Ensure that the USB PHY is not in reset */
	gpio_base = (u32 *)0xE000A000;
	gpio_oen = (u32 *)0xE000A208;
	gpio_dir = (u32 *)0xE000A204;

	*(gpio_oen) |= 0x00000080;
	*(gpio_dir) |= 0x00000080;
	*gpio_base = 0xff7f0080;
}

u8 XUartPs_RecvByte_NonBlocking(u32 BaseAddress){
	u32 byte;

	if(XUartPs_IsReceiveData(BaseAddress)) {
		byte = XUartPs_ReadReg(BaseAddress, XUARTPS_FIFO_OFFSET);
	}
	else{
		byte = 0x00000000;
	}

	return (u8)byte;
}

int main(){
	u8 read_buffer[256];
	u32 read_size;
	u32 uart_char;
	XScuGic_Config *intc_config;

    init_platform();

    print("Starting the USB example ...\n\r");

    reset_usb();

    intc_config = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
    XScuGic_CfgInitialize(&INTC, intc_config, intc_config->CpuBaseAddress);
    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, &INTC);
    XScuGic_Connect(&INTC, XPAR_PS7_USB_0_INTR, (Xil_ExceptionHandler)XUsbPs_IntrHandler, (void *)&USB0);
    XScuGic_Enable(&INTC, XPAR_PS7_USB_0_INTR);
    Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);

    xusb_cdc_init(&USB0, XPAR_PS7_USB_0_DEVICE_ID, XPAR_PS7_USB_0_INTR, 64 * 1024);

    while(1){
    	read_size = xusb_cdc_rx_bytes_available();
		if (read_size != 0) {
			xusb_cdc_receive_data(read_buffer, read_size);
			read_buffer[read_size] = '\0';
			read_size = 0;
			xil_printf("%s\n", read_buffer);
		}

		read_size = XUartPs_IsReceiveData(STDOUT_BASEADDRESS);
		if(read_size != 0){
			uart_char = XUartPs_ReadReg(STDOUT_BASEADDRESS, XUARTPS_FIFO_OFFSET);
			xusb_cdc_send_data(&USB0, (u8 *)&uart_char, 1);
		}
    }

    cleanup_platform();

    return 0;
}
