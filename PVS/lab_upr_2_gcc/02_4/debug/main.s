	.cpu cortex-m7
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.text.startup,"ax",%progbits
	.align	1
	.global	main
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	main, %function
main:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	bl	led_init
	movs	r4, #0
	mov	r0, #9600
	ldr	r5, .L7
	bl	uart_init
	movs	r1, #1
	ldr	r0, .L7+4
	bl	printf_
.L6:
	bl	led_set
	str	r4, [sp, #4]
.L2:
	ldr	r3, [sp, #4]
	cmp	r3, r5
	ble	.L3
	bl	led_clear
	str	r4, [sp, #4]
.L4:
	ldr	r3, [sp, #4]
	cmp	r3, r5
	bgt	.L6
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	str	r3, [sp, #4]
	b	.L4
.L3:
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	str	r3, [sp, #4]
	b	.L2
.L8:
	.align	2
.L7:
	.word	399999
	.word	.LC0
	.size	main, .-main
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"This is an example usage of printf and USART%d\012\000"
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2018-q4-major) 8.2.1 20181213 (release) [gcc-8-branch revision 267074]"
