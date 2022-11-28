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

#include "ff.h"

int main(){
	FIL fil;
	FATFS fatfs;
	FRESULT res;
	TCHAR *root_path = "0:/";
	char *file_contents = "Hello, world!";
	UINT bytes_written;
	UINT bytes_read;
	char read_buff[256];
	//BYTE page[FF_MAX_SS];

    init_platform();

    printf("Starting SD card example ...\n\r");

    res = f_mount(&fatfs, root_path, 0);
    xil_printf("f_mount: %d\n", res);

    //f_mkfs(root_path, FM_FAT32, 0, page, sizeof(page)); //Format sd card with FAT32

    res = f_open(&fil, "test.txt", FA_CREATE_ALWAYS | FA_WRITE);
    xil_printf("f_open: %d\n", res);
    res = f_write(&fil, (const void*)file_contents, 13, &bytes_written);
    xil_printf("f_write: %d\n", res);
    res = f_close(&fil);
    xil_printf("f_close: %d\n", res);

    res = f_open(&fil, "test.txt", FA_OPEN_ALWAYS | FA_READ);
    xil_printf("f_open: %d\n", res);
    res = f_read(&fil, (void*)read_buff, 13, &bytes_read);
    read_buff[13] = '\0';
    xil_printf("f_open: %d (%d) %s\n", res, bytes_read, read_buff);
    res = f_close(&fil);
    xil_printf("f_close: %d\n", res);

    res = f_mount(NULL, root_path, 0); // = unmount
    xil_printf("f_unmount: %d\n", res);

    while(1){ }

    cleanup_platform();

    return 0;
}
