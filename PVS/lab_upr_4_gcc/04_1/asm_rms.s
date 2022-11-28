
.text

.global asm_rms

	divider: .double 4.00

//d0 - first (leftmost) parameter
//d1 - second parameter
//d2 - third parameter
//d3 - fourth (rightmost) parameter
//d0 - return value
asm_rms:
	vmul.f64	d3,d3
	vmul.f64	d2,d2
	vmul.f64	d1,d1
	vmul.f64	d0,d0
	vadd.f64	d4,d0,d1
	vadd.f64	d4,d4,d2
	vadd.f64	d4,d4,d3
	vldr.f64	d5,divider
	vdiv.f64	d4,d4,d5
	vsqrt.f64	d4,d4
	vmov.f64	d0,d4
	mov pc,lr //Return to main
