#include <stdio.h>
#include <string.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"

#include "xparameters.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xiic.h"

#define EEPROM_ADDRESS 0x50 //7-bit address, 1010 000

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
	cmd_buffer[0] = 0xfa;
	
	XIic_Start(&I2C0);
	XIic_MasterSend(&I2C0, cmd_buffer, 1);
	while ((transmitting_data) || (XIic_IsIicBusy(&I2C0) == TRUE)) { }
	XIic_Stop(&I2C0);
	
	XIic_Start(&I2C0);
	XIic_MasterRecv(&I2C0, read_buffer, 2); //This API can't receive a single byte, so get 2
	while ((receiving_data) || (XIic_IsIicBusy(&I2C0) == TRUE)) { }
	XIic_Stop(&I2C0);
	
	xil_printf("Eeprom read data: %02X\n", read_buffer[0]);

	while(1){ }

	cleanup_platform();

return 0;
}
