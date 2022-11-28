/*
 * standard_rms.c
 *
 *  Created on: Nov 23, 2020
 *      Author: lbogdanov
 */
#include <math.h>
#include "standard_rms.h"

double standard_rms(double dig3, double dig2, double dig1, double dig0){
	volatile double result;

	result = (pow(dig3, 2) + pow(dig2, 2) + pow(dig1, 2) + pow(dig0, 2)) / 4;

	result = sqrt(result);

	return result;
}
