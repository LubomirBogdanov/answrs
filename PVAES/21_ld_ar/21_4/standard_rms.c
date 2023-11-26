#include <math.h>
#include "standard_rms.h"

float standard_rms(float dig3, float dig2, float dig1, float dig0){
	volatile double result;

	result = (pow(dig3, 2) + pow(dig2, 2) + pow(dig1, 2) + pow(dig0, 2)) / 4;

	result = sqrt(result);

	return result;
}
