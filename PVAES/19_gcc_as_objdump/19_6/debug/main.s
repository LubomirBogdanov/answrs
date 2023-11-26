	.text
	.rodata
	.align	2
$LC0:
	.ascii "Hello, World!\0"
	.align	2
$LC1:
	.ascii "%s\12\15\0"
	.align	2
$LC2:
	.ascii "led: 1\12\15\0"
	.align	2
$LC3:
	.ascii "led: 0\12\15\0"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.ent	main
	.type	main, @function
main:
	.frame	r1,40,r15		# vars= 0, regs= 3, args= 24
	.mask	0x00c88000
	addik	r1,r1,-40
	swi	r15,r1,0
	swi	r19,r1,28
	swi	r22,r1,32
	brlid	r15,led_init
	
	swi	r23,r1,36
	brlid	r15,uart_init
	nop		# Unfilled delay slot

	addik	r6,r0,$LC0
	addik	r5,r0,$LC1
	addik	r23,r0,$LC2
	addik	r19,r0,2000000
	addik	r22,r0,$LC3
	brlid	r15,printf_
	nop		# Unfilled delay slot

$L2:
	brlid	r15,printf_
	
	addk	r5,r23,r0
	brlid	r15,led_set
	nop		# Unfilled delay slot

	brlid	r15,usleep
	
	addk	r5,r19,r0
	brlid	r15,printf_
	
	addk	r5,r22,r0
	brlid	r15,led_clear
	nop		# Unfilled delay slot

	brlid	r15,usleep
	
	addk	r5,r19,r0
	bri	$L2
	.end	main
$Lfe1:
	.size	main,$Lfe1-main
