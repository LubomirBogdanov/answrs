	.cpu cortex-m7
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"This is an example usage of printf and USART%d\012\000"
	.text
	.align	1
	.global	main
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	bl	led_init
	mov	r0, #9600
	bl	uart_init
	movs	r1, #1
	ldr	r0, .L7
	bl	printf_
.L6:
	bl	led_set
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L2
.L3:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L2:
	ldr	r3, [r7, #4]
	ldr	r2, .L7+4
	cmp	r3, r2
	ble	.L3
	bl	led_clear
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L4
.L5:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L4:
	ldr	r3, [r7, #4]
	ldr	r2, .L7+4
	cmp	r3, r2
	ble	.L5
	b	.L6
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	399999
	.size	main, .-main
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2018-q4-major) 8.2.1 20181213 (release) [gcc-8-branch revision 267074]"
