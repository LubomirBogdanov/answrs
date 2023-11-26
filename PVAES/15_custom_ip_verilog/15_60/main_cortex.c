#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"

#define ABS_GRADIENT_OUT_BASE	0x43c00000

typedef struct {
	int32_t grad_0;
	int32_t grad_1;
	int32_t grad_2;
	int32_t grad_3;
	int32_t grad_4;
	int32_t grad_5;
	int32_t grad_out;

	int32_t abs_in0;
	int32_t abs_in1;
	int32_t abs_div;
	uint32_t abs_out;

	uint32_t abs_interrupt;
	uint32_t gpio_out;
}abs_gradient_out_t;

#define ABSGRADOUT0	((volatile abs_gradient_out_t *) ABS_GRADIENT_OUT_BASE)

int main(){
	init_platform();

	print("Starting ...\n\r");

	ABSGRADOUT0->grad_0 = 2;
	ABSGRADOUT0->grad_1 = 5;
	ABSGRADOUT0->grad_2 = 2;
	ABSGRADOUT0->grad_3 = -5;
	ABSGRADOUT0->grad_4 = -5;
	ABSGRADOUT0->grad_5 = -5;

	xil_printf("Gradient: %d\n\r", ABSGRADOUT0->grad_out);

	ABSGRADOUT0->abs_div = 4;
	ABSGRADOUT0->abs_in0 = -50;
	ABSGRADOUT0->abs_in1 = -50;

	xil_printf("Absolute: (|%d| + |%d|)/%d = %d\n\r",
			ABSGRADOUT0->abs_in0, ABSGRADOUT0->abs_in1,
			ABSGRADOUT0->abs_div, ABSGRADOUT0->abs_out);

	while(1){
		ABSGRADOUT0->gpio_out = 0x3;
		ABSGRADOUT0->abs_interrupt = 0x01;
		ABSGRADOUT0->abs_interrupt = 0x00;
		usleep(1000000);

		ABSGRADOUT0->abs_interrupt = 0x02;
		ABSGRADOUT0->abs_interrupt = 0x00;
		ABSGRADOUT0->gpio_out = 0x0;
		usleep(1000000);
	}

	cleanup_platform();

	return 0;
}
