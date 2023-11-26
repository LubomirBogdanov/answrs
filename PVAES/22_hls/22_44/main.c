#include "platform.h"
#include "xil_printf.h"
#include "xil_cache.h"
#include "xtft.h"
#include "xparameters.h"
#include "xuartps_hw.h"
#include "sleep.h"
#include "logo_en.h"
#include "xsobel.h"

#define TFT_FRAME_ADDR      XPAR_PS7_DDR_0_S_AXI_HIGHADDR - 0x001FFFFF
#define IN_IMAGE_LOW_ADDR	TFT_FRAME_ADDR - 0x19000
#define OUT_IMAGE_LOW_ADDR	IN_IMAGE_LOW_ADDR - 0x19000

XTft TFT0;
XSobel SOBEL0;

volatile uint8_t *sobel_base_in = (volatile uint8_t *)IN_IMAGE_LOW_ADDR;
volatile uint8_t *sobel_base_out = (volatile uint8_t *)OUT_IMAGE_LOW_ADDR;

int main(){
	int i = 0;
	XTft_Config *tft_config;
	XSobel_Config *sobel_init;

	init_platform();

	print("Starting Sobel demo ...\n\r");

	Xil_DCacheDisable();

	tft_config = XTft_LookupConfig(XPAR_TFT_0_DEVICE_ID);
	XTft_CfgInitialize(&TFT0, tft_config, tft_config->BaseAddress);

	while (XTft_GetVsyncStatus(&TFT0) != XTFT_IESR_VADDRLATCH_STATUS_MASK);

	XTft_SetFrameBaseAddr(&TFT0, TFT_FRAME_ADDR);
	XTft_ClearScreen(&TFT0);

	memset((uint32_t *)0x1fe00000, 0xff, 0x1fffff);

	XTft_EnableDisplay(&TFT0);

	sobel_init = XSobel_LookupConfig(XPAR_SOBEL_0_DEVICE_ID);
	XSobel_CfgInitialize(&SOBEL0, sobel_init);
	XSobel_Set_image_in(&SOBEL0, IN_IMAGE_LOW_ADDR);
	XSobel_Set_image_out(&SOBEL0, OUT_IMAGE_LOW_ADDR);

	memset((uint8_t *)IN_IMAGE_LOW_ADDR, 0xff, 320*240);
	memset((uint8_t *)OUT_IMAGE_LOW_ADDR, 0xff, 320*240);
	memcpy((uint8_t *)sobel_base_in, logo_en, 320*240);

	XSobel_Start(&SOBEL0);
	while(!XSobel_IsDone(&SOBEL0)){  }

	i = 0;
	for(u32 y_coord = 0; y_coord < 240; y_coord++){
		for(u32 x_coord = 0; x_coord < 320; x_coord++){
			XTft_SetPixel(&TFT0, x_coord, y_coord, sobel_base_out[i++]);
		}
	}

	usleep(20000000);

	XTft_DisableDisplay(&TFT0);

	while(1){ }

	cleanup_platform();

	return XST_SUCCESS;
}




