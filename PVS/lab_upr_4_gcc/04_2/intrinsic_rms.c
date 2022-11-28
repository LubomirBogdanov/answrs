/*
 * intrinsic_rms.c
 *
 *  Created on: Nov 23, 2020
 *      Author: lbogdanov
 */
#include <stdio.h>
#include "printf.h"
#include <math.h>
#include "intrinsic_rms.h"

double intrinsic_rms(double dig3, double dig2, double dig1, double dig0){
	volatile double divisor = 4.00;
	volatile double dig3_squared;
	volatile double dig2_squared;
	volatile double dig1_squared;
	volatile double dig0_squared;
	volatile double sum;
	volatile double quotient;
	volatile double root;

	dig3_squared = __aeabi_dmul(dig3, dig3);
	printf("dig3^2 -> %12.6f\n", dig3_squared);
	dig2_squared = __aeabi_dmul(dig2, dig2);
	printf("dig2^2 -> %12.6f\n", dig2_squared);
	dig1_squared = __aeabi_dmul(dig1, dig1);
	printf("dig1^2 -> %12.6f\n", dig1_squared);
	dig0_squared = __aeabi_dmul(dig0, dig0);
	printf("dig0^2 -> %12.6f\n", dig0_squared);

	sum = __aeabi_dadd(dig3_squared, dig2_squared);
	printf("dig3 + dig2 -> %12.6f\n", sum);
	sum = __aeabi_dadd(sum, dig1_squared);
	printf("(dig3 + dig2) + dig1 -> %12.6f\n", sum);
	sum = __aeabi_dadd(sum, dig0_squared);
	printf("(dig3 + dig2 + dig1) + dig0 -> %12.6f\n", sum);

	quotient = __aeabi_ddiv(sum, divisor);
	printf("(dig3 + dig2 + dig1 + dig0)/4 -> %12.6f\n", quotient);

	root = __ieee754_sqrt(quotient);
	printf("sqrt[(dig3 + dig2 + dig1 + dig0)/4] -> %12.6f\n", root);

	return root;
}
