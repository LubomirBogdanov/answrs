	.cpu cortex-m7
	.eabi_attribute 28, 1
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
.Ltext0:
	.cfi_sections	.debug_frame
	.global	scb_cpacr
	.data
	.align	2
	.type	scb_cpacr, %object
	.size	scb_cpacr, 4
scb_cpacr:
	.word	-536810104
	.text
	.align	1
	.global	my_func_3
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	my_func_3, %function
my_func_3:
.LFB0:
	.file 1 "main.c"
	.loc 1 16 21
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 17 15
	movs	r3, #3
	str	r3, [r7, #12]
	.loc 1 17 22
	movs	r3, #30
	str	r3, [r7, #8]
	.loc 1 19 8
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	add	r3, r3, r2
	.loc 1 19 4
	str	r3, [r7, #4]
	.loc 1 20 1
	nop
	adds	r7, r7, #20
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE0:
	.size	my_func_3, .-my_func_3
	.align	1
	.global	my_func_2
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	my_func_2, %function
my_func_2:
.LFB1:
	.loc 1 22 21
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 23 15
	movs	r3, #2
	str	r3, [r7, #12]
	.loc 1 23 22
	movs	r3, #20
	str	r3, [r7, #8]
	.loc 1 25 8
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	add	r3, r3, r2
	.loc 1 25 4
	str	r3, [r7, #4]
	.loc 1 27 2
	bl	my_func_3
	.loc 1 28 1
	nop
	adds	r7, r7, #16
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE1:
	.size	my_func_2, .-my_func_2
	.align	1
	.global	my_func_1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	my_func_1, %function
my_func_1:
.LFB2:
	.loc 1 30 21
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 31 15
	movs	r3, #1
	str	r3, [r7, #12]
	.loc 1 31 22
	movs	r3, #10
	str	r3, [r7, #8]
	.loc 1 33 8
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	add	r3, r3, r2
	.loc 1 33 4
	str	r3, [r7, #4]
	.loc 1 35 2
	bl	my_func_2
	.loc 1 36 1
	nop
	adds	r7, r7, #16
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE2:
	.size	my_func_1, .-my_func_1
	.section	.rodata
	.align	2
.LC1:
	.ascii	"The result is --> %12.6f\012\000"
	.align	2
.LC0:
	.byte	65
	.byte	66
	.byte	67
	.byte	0
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	main, %function
main:
.LFB3:
	.loc 1 46 15
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #52
	.cfi_def_cfa_offset 64
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 47 9
	adr	r4, .L10+12
	ldrd	r3, [r4]
	strd	r3, [r7, #40]
	.loc 1 48 9
	adr	r4, .L10+20
	ldrd	r3, [r4]
	strd	r3, [r7, #32]
	.loc 1 49 9
	adr	r4, .L10+28
	ldrd	r3, [r4]
	strd	r3, [r7, #24]
	.loc 1 50 9
	adr	r4, .L10+36
	ldrd	r3, [r4]
	strd	r3, [r7, #16]
	.loc 1 53 7
	ldr	r3, .L10
	ldr	r3, [r3]
	str	r3, [r7]
	.loc 1 55 13
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	orr	r2, r2, #15728640
	str	r2, [r3]
	.loc 1 57 2
	bl	led_init
	.loc 1 58 2
	mov	r0, #9600
	bl	uart_init
	.loc 1 60 2
	bl	button_init
	.loc 1 63 14
	vldr.64	d3, [r7, #16]
	vldr.64	d2, [r7, #24]
	vldr.64	d1, [r7, #32]
	vldr.64	d0, [r7, #40]
	bl	intrinsic_rms
	vstr.64	d0, [r7, #8]
	.loc 1 66 2
	ldrd	r2, [r7, #8]
	ldr	r0, .L10+8
	bl	printf_
	.loc 1 68 2
	bl	my_func_1
.L9:
	.loc 1 71 3
	bl	led_set
	.loc 1 72 9
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 72 3
	b	.L5
.L6:
	.loc 1 72 26 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L5:
	.loc 1 72 16 discriminator 1
	ldr	r3, [r7, #4]
	.loc 1 72 3 discriminator 1
	movw	r2, #49999
	cmp	r3, r2
	ble	.L6
	.loc 1 73 3
	bl	led_clear
	.loc 1 74 9
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 74 3
	b	.L7
.L8:
	.loc 1 74 26 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L7:
	.loc 1 74 16 discriminator 1
	ldr	r3, [r7, #4]
	.loc 1 74 3 discriminator 1
	movw	r2, #49999
	cmp	r3, r2
	ble	.L8
	.loc 1 71 3
	b	.L9
.L11:
	.align	3
.L10:
	.word	.LC0
	.word	scb_cpacr
	.word	.LC1
	.word	628920651
	.word	1074791056
	.word	385103948
	.word	1074851599
	.word	3073684755
	.word	1074997314
	.word	402421256
	.word	1074848264
	.cfi_endproc
.LFE3:
	.size	main, .-main
.Letext0:
	.file 2 "/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/arm-none-eabi/include/sys/_stdint.h"
	.file 4 "/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/arm-none-eabi/include/sys/lock.h"
	.file 5 "/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/arm-none-eabi/include/sys/_types.h"
	.file 6 "/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h"
	.file 7 "/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/arm-none-eabi/include/sys/reent.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xa9a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF132
	.byte	0xc
	.4byte	.LASF133
	.4byte	.LASF134
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x54
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.4byte	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x48
	.uleb128 0x5
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF11
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x4
	.byte	0x22
	.byte	0x19
	.4byte	0xa0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xa6
	.uleb128 0x7
	.4byte	.LASF119
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x5
	.byte	0x2c
	.byte	0xe
	.4byte	0x41
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x5
	.byte	0x72
	.byte	0xe
	.4byte	0x41
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x6
	.2byte	0x165
	.byte	0x17
	.4byte	0x75
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.byte	0xa6
	.byte	0x3
	.4byte	0xf2
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x5
	.byte	0xa8
	.byte	0xc
	.4byte	0xc3
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x5
	.byte	0xa9
	.byte	0x13
	.4byte	0xf2
	.byte	0
	.uleb128 0xb
	.4byte	0x2c
	.4byte	0x102
	.uleb128 0xc
	.4byte	0x75
	.byte	0x3
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.byte	0x5
	.byte	0xa3
	.byte	0x9
	.4byte	0x126
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x5
	.byte	0xa5
	.byte	0x7
	.4byte	0x69
	.byte	0
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x5
	.byte	0xaa
	.byte	0x5
	.4byte	0xd0
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x5
	.byte	0xab
	.byte	0x3
	.4byte	0x102
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x5
	.byte	0xaf
	.byte	0x1b
	.4byte	0x94
	.uleb128 0xf
	.byte	0x4
	.uleb128 0x6
	.byte	0x4
	.4byte	0x146
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF22
	.uleb128 0x10
	.4byte	0x146
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x7
	.byte	0x16
	.byte	0x19
	.4byte	0x54
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x18
	.byte	0x7
	.byte	0x2f
	.byte	0x8
	.4byte	0x1b8
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x7
	.byte	0x31
	.byte	0x13
	.4byte	0x1b8
	.byte	0
	.uleb128 0x12
	.ascii	"_k\000"
	.byte	0x7
	.byte	0x32
	.byte	0x7
	.4byte	0x69
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF25
	.byte	0x7
	.byte	0x32
	.byte	0xb
	.4byte	0x69
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF26
	.byte	0x7
	.byte	0x32
	.byte	0x14
	.4byte	0x69
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x7
	.byte	0x32
	.byte	0x1b
	.4byte	0x69
	.byte	0x10
	.uleb128 0x12
	.ascii	"_x\000"
	.byte	0x7
	.byte	0x33
	.byte	0xb
	.4byte	0x1be
	.byte	0x14
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x15e
	.uleb128 0xb
	.4byte	0x152
	.4byte	0x1ce
	.uleb128 0xc
	.4byte	0x75
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF29
	.byte	0x24
	.byte	0x7
	.byte	0x37
	.byte	0x8
	.4byte	0x251
	.uleb128 0xe
	.4byte	.LASF30
	.byte	0x7
	.byte	0x39
	.byte	0x9
	.4byte	0x69
	.byte	0
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x7
	.byte	0x3a
	.byte	0x9
	.4byte	0x69
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF32
	.byte	0x7
	.byte	0x3b
	.byte	0x9
	.4byte	0x69
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF33
	.byte	0x7
	.byte	0x3c
	.byte	0x9
	.4byte	0x69
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF34
	.byte	0x7
	.byte	0x3d
	.byte	0x9
	.4byte	0x69
	.byte	0x10
	.uleb128 0xe
	.4byte	.LASF35
	.byte	0x7
	.byte	0x3e
	.byte	0x9
	.4byte	0x69
	.byte	0x14
	.uleb128 0xe
	.4byte	.LASF36
	.byte	0x7
	.byte	0x3f
	.byte	0x9
	.4byte	0x69
	.byte	0x18
	.uleb128 0xe
	.4byte	.LASF37
	.byte	0x7
	.byte	0x40
	.byte	0x9
	.4byte	0x69
	.byte	0x1c
	.uleb128 0xe
	.4byte	.LASF38
	.byte	0x7
	.byte	0x41
	.byte	0x9
	.4byte	0x69
	.byte	0x20
	.byte	0
	.uleb128 0x13
	.4byte	.LASF39
	.2byte	0x108
	.byte	0x7
	.byte	0x4a
	.byte	0x8
	.4byte	0x296
	.uleb128 0xe
	.4byte	.LASF40
	.byte	0x7
	.byte	0x4b
	.byte	0xa
	.4byte	0x296
	.byte	0
	.uleb128 0xe
	.4byte	.LASF41
	.byte	0x7
	.byte	0x4c
	.byte	0x9
	.4byte	0x296
	.byte	0x80
	.uleb128 0x14
	.4byte	.LASF42
	.byte	0x7
	.byte	0x4e
	.byte	0xa
	.4byte	0x152
	.2byte	0x100
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x7
	.byte	0x51
	.byte	0xa
	.4byte	0x152
	.2byte	0x104
	.byte	0
	.uleb128 0xb
	.4byte	0x13e
	.4byte	0x2a6
	.uleb128 0xc
	.4byte	0x75
	.byte	0x1f
	.byte	0
	.uleb128 0x13
	.4byte	.LASF44
	.2byte	0x190
	.byte	0x7
	.byte	0x5d
	.byte	0x8
	.4byte	0x2e9
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x7
	.byte	0x5e
	.byte	0x12
	.4byte	0x2e9
	.byte	0
	.uleb128 0xe
	.4byte	.LASF45
	.byte	0x7
	.byte	0x5f
	.byte	0x6
	.4byte	0x69
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF46
	.byte	0x7
	.byte	0x61
	.byte	0x9
	.4byte	0x2ef
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF39
	.byte	0x7
	.byte	0x62
	.byte	0x1e
	.4byte	0x251
	.byte	0x88
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2a6
	.uleb128 0xb
	.4byte	0x2ff
	.4byte	0x2ff
	.uleb128 0xc
	.4byte	0x75
	.byte	0x1f
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x305
	.uleb128 0x15
	.uleb128 0x11
	.4byte	.LASF47
	.byte	0x8
	.byte	0x7
	.byte	0x75
	.byte	0x8
	.4byte	0x32e
	.uleb128 0xe
	.4byte	.LASF48
	.byte	0x7
	.byte	0x76
	.byte	0x11
	.4byte	0x32e
	.byte	0
	.uleb128 0xe
	.4byte	.LASF49
	.byte	0x7
	.byte	0x77
	.byte	0x6
	.4byte	0x69
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2c
	.uleb128 0x11
	.4byte	.LASF50
	.byte	0x68
	.byte	0x7
	.byte	0xb5
	.byte	0x8
	.4byte	0x477
	.uleb128 0x12
	.ascii	"_p\000"
	.byte	0x7
	.byte	0xb6
	.byte	0x12
	.4byte	0x32e
	.byte	0
	.uleb128 0x12
	.ascii	"_r\000"
	.byte	0x7
	.byte	0xb7
	.byte	0x7
	.4byte	0x69
	.byte	0x4
	.uleb128 0x12
	.ascii	"_w\000"
	.byte	0x7
	.byte	0xb8
	.byte	0x7
	.4byte	0x69
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF51
	.byte	0x7
	.byte	0xb9
	.byte	0x9
	.4byte	0x33
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF52
	.byte	0x7
	.byte	0xba
	.byte	0x9
	.4byte	0x33
	.byte	0xe
	.uleb128 0x12
	.ascii	"_bf\000"
	.byte	0x7
	.byte	0xbb
	.byte	0x11
	.4byte	0x306
	.byte	0x10
	.uleb128 0xe
	.4byte	.LASF53
	.byte	0x7
	.byte	0xbc
	.byte	0x7
	.4byte	0x69
	.byte	0x18
	.uleb128 0xe
	.4byte	.LASF54
	.byte	0x7
	.byte	0xc3
	.byte	0xa
	.4byte	0x13e
	.byte	0x1c
	.uleb128 0xe
	.4byte	.LASF55
	.byte	0x7
	.byte	0xc5
	.byte	0x1d
	.4byte	0x5e9
	.byte	0x20
	.uleb128 0xe
	.4byte	.LASF56
	.byte	0x7
	.byte	0xc7
	.byte	0x1d
	.4byte	0x613
	.byte	0x24
	.uleb128 0xe
	.4byte	.LASF57
	.byte	0x7
	.byte	0xca
	.byte	0xd
	.4byte	0x637
	.byte	0x28
	.uleb128 0xe
	.4byte	.LASF58
	.byte	0x7
	.byte	0xcb
	.byte	0x9
	.4byte	0x651
	.byte	0x2c
	.uleb128 0x12
	.ascii	"_ub\000"
	.byte	0x7
	.byte	0xce
	.byte	0x11
	.4byte	0x306
	.byte	0x30
	.uleb128 0x12
	.ascii	"_up\000"
	.byte	0x7
	.byte	0xcf
	.byte	0x12
	.4byte	0x32e
	.byte	0x38
	.uleb128 0x12
	.ascii	"_ur\000"
	.byte	0x7
	.byte	0xd0
	.byte	0x7
	.4byte	0x69
	.byte	0x3c
	.uleb128 0xe
	.4byte	.LASF59
	.byte	0x7
	.byte	0xd3
	.byte	0x11
	.4byte	0x657
	.byte	0x40
	.uleb128 0xe
	.4byte	.LASF60
	.byte	0x7
	.byte	0xd4
	.byte	0x11
	.4byte	0x667
	.byte	0x43
	.uleb128 0x12
	.ascii	"_lb\000"
	.byte	0x7
	.byte	0xd7
	.byte	0x11
	.4byte	0x306
	.byte	0x44
	.uleb128 0xe
	.4byte	.LASF61
	.byte	0x7
	.byte	0xda
	.byte	0x7
	.4byte	0x69
	.byte	0x4c
	.uleb128 0xe
	.4byte	.LASF62
	.byte	0x7
	.byte	0xdb
	.byte	0xa
	.4byte	0xab
	.byte	0x50
	.uleb128 0xe
	.4byte	.LASF63
	.byte	0x7
	.byte	0xde
	.byte	0x12
	.4byte	0x495
	.byte	0x54
	.uleb128 0xe
	.4byte	.LASF64
	.byte	0x7
	.byte	0xe2
	.byte	0xc
	.4byte	0x132
	.byte	0x58
	.uleb128 0xe
	.4byte	.LASF65
	.byte	0x7
	.byte	0xe4
	.byte	0xe
	.4byte	0x126
	.byte	0x5c
	.uleb128 0xe
	.4byte	.LASF66
	.byte	0x7
	.byte	0xe5
	.byte	0x9
	.4byte	0x69
	.byte	0x64
	.byte	0
	.uleb128 0x16
	.4byte	0x69
	.4byte	0x495
	.uleb128 0x17
	.4byte	0x495
	.uleb128 0x17
	.4byte	0x13e
	.uleb128 0x17
	.4byte	0x140
	.uleb128 0x17
	.4byte	0x69
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x4a0
	.uleb128 0x10
	.4byte	0x495
	.uleb128 0x18
	.4byte	.LASF67
	.2byte	0x428
	.byte	0x7
	.2byte	0x260
	.byte	0x8
	.4byte	0x5e9
	.uleb128 0x19
	.4byte	.LASF68
	.byte	0x7
	.2byte	0x262
	.byte	0x7
	.4byte	0x69
	.byte	0
	.uleb128 0x19
	.4byte	.LASF69
	.byte	0x7
	.2byte	0x267
	.byte	0xb
	.4byte	0x6c3
	.byte	0x4
	.uleb128 0x19
	.4byte	.LASF70
	.byte	0x7
	.2byte	0x267
	.byte	0x14
	.4byte	0x6c3
	.byte	0x8
	.uleb128 0x19
	.4byte	.LASF71
	.byte	0x7
	.2byte	0x267
	.byte	0x1e
	.4byte	0x6c3
	.byte	0xc
	.uleb128 0x19
	.4byte	.LASF72
	.byte	0x7
	.2byte	0x269
	.byte	0x8
	.4byte	0x69
	.byte	0x10
	.uleb128 0x19
	.4byte	.LASF73
	.byte	0x7
	.2byte	0x26a
	.byte	0x8
	.4byte	0x8c3
	.byte	0x14
	.uleb128 0x19
	.4byte	.LASF74
	.byte	0x7
	.2byte	0x26d
	.byte	0x7
	.4byte	0x69
	.byte	0x30
	.uleb128 0x19
	.4byte	.LASF75
	.byte	0x7
	.2byte	0x26e
	.byte	0x16
	.4byte	0x8d8
	.byte	0x34
	.uleb128 0x19
	.4byte	.LASF76
	.byte	0x7
	.2byte	0x270
	.byte	0x7
	.4byte	0x69
	.byte	0x38
	.uleb128 0x19
	.4byte	.LASF77
	.byte	0x7
	.2byte	0x272
	.byte	0xa
	.4byte	0x8e9
	.byte	0x3c
	.uleb128 0x19
	.4byte	.LASF78
	.byte	0x7
	.2byte	0x275
	.byte	0x13
	.4byte	0x1b8
	.byte	0x40
	.uleb128 0x19
	.4byte	.LASF79
	.byte	0x7
	.2byte	0x276
	.byte	0x7
	.4byte	0x69
	.byte	0x44
	.uleb128 0x19
	.4byte	.LASF80
	.byte	0x7
	.2byte	0x277
	.byte	0x13
	.4byte	0x1b8
	.byte	0x48
	.uleb128 0x19
	.4byte	.LASF81
	.byte	0x7
	.2byte	0x278
	.byte	0x14
	.4byte	0x8ef
	.byte	0x4c
	.uleb128 0x19
	.4byte	.LASF82
	.byte	0x7
	.2byte	0x27b
	.byte	0x7
	.4byte	0x69
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF83
	.byte	0x7
	.2byte	0x27c
	.byte	0x9
	.4byte	0x140
	.byte	0x54
	.uleb128 0x19
	.4byte	.LASF84
	.byte	0x7
	.2byte	0x29f
	.byte	0x7
	.4byte	0x89e
	.byte	0x58
	.uleb128 0x1a
	.4byte	.LASF44
	.byte	0x7
	.2byte	0x2a3
	.byte	0x13
	.4byte	0x2e9
	.2byte	0x148
	.uleb128 0x1a
	.4byte	.LASF85
	.byte	0x7
	.2byte	0x2a4
	.byte	0x12
	.4byte	0x2a6
	.2byte	0x14c
	.uleb128 0x1a
	.4byte	.LASF86
	.byte	0x7
	.2byte	0x2a8
	.byte	0xc
	.4byte	0x900
	.2byte	0x2dc
	.uleb128 0x1a
	.4byte	.LASF87
	.byte	0x7
	.2byte	0x2ad
	.byte	0x10
	.4byte	0x684
	.2byte	0x2e0
	.uleb128 0x1a
	.4byte	.LASF88
	.byte	0x7
	.2byte	0x2af
	.byte	0xa
	.4byte	0x90c
	.2byte	0x2ec
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x477
	.uleb128 0x16
	.4byte	0x69
	.4byte	0x60d
	.uleb128 0x17
	.4byte	0x495
	.uleb128 0x17
	.4byte	0x13e
	.uleb128 0x17
	.4byte	0x60d
	.uleb128 0x17
	.4byte	0x69
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x14d
	.uleb128 0x6
	.byte	0x4
	.4byte	0x5ef
	.uleb128 0x16
	.4byte	0xb7
	.4byte	0x637
	.uleb128 0x17
	.4byte	0x495
	.uleb128 0x17
	.4byte	0x13e
	.uleb128 0x17
	.4byte	0xb7
	.uleb128 0x17
	.4byte	0x69
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x619
	.uleb128 0x16
	.4byte	0x69
	.4byte	0x651
	.uleb128 0x17
	.4byte	0x495
	.uleb128 0x17
	.4byte	0x13e
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x63d
	.uleb128 0xb
	.4byte	0x2c
	.4byte	0x667
	.uleb128 0xc
	.4byte	0x75
	.byte	0x2
	.byte	0
	.uleb128 0xb
	.4byte	0x2c
	.4byte	0x677
	.uleb128 0xc
	.4byte	0x75
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF89
	.byte	0x7
	.2byte	0x11f
	.byte	0x1a
	.4byte	0x334
	.uleb128 0x1b
	.4byte	.LASF90
	.byte	0xc
	.byte	0x7
	.2byte	0x123
	.byte	0x8
	.4byte	0x6bd
	.uleb128 0x19
	.4byte	.LASF24
	.byte	0x7
	.2byte	0x125
	.byte	0x11
	.4byte	0x6bd
	.byte	0
	.uleb128 0x19
	.4byte	.LASF91
	.byte	0x7
	.2byte	0x126
	.byte	0x7
	.4byte	0x69
	.byte	0x4
	.uleb128 0x19
	.4byte	.LASF92
	.byte	0x7
	.2byte	0x127
	.byte	0xb
	.4byte	0x6c3
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x684
	.uleb128 0x6
	.byte	0x4
	.4byte	0x677
	.uleb128 0x1b
	.4byte	.LASF93
	.byte	0xe
	.byte	0x7
	.2byte	0x13f
	.byte	0x8
	.4byte	0x702
	.uleb128 0x19
	.4byte	.LASF94
	.byte	0x7
	.2byte	0x140
	.byte	0x12
	.4byte	0x702
	.byte	0
	.uleb128 0x19
	.4byte	.LASF95
	.byte	0x7
	.2byte	0x141
	.byte	0x12
	.4byte	0x702
	.byte	0x6
	.uleb128 0x19
	.4byte	.LASF96
	.byte	0x7
	.2byte	0x142
	.byte	0x12
	.4byte	0x3a
	.byte	0xc
	.byte	0
	.uleb128 0xb
	.4byte	0x3a
	.4byte	0x712
	.uleb128 0xc
	.4byte	0x75
	.byte	0x2
	.byte	0
	.uleb128 0x1c
	.byte	0xd0
	.byte	0x7
	.2byte	0x280
	.byte	0x7
	.4byte	0x827
	.uleb128 0x19
	.4byte	.LASF97
	.byte	0x7
	.2byte	0x282
	.byte	0x18
	.4byte	0x75
	.byte	0
	.uleb128 0x19
	.4byte	.LASF98
	.byte	0x7
	.2byte	0x283
	.byte	0x12
	.4byte	0x140
	.byte	0x4
	.uleb128 0x19
	.4byte	.LASF99
	.byte	0x7
	.2byte	0x284
	.byte	0x10
	.4byte	0x827
	.byte	0x8
	.uleb128 0x19
	.4byte	.LASF100
	.byte	0x7
	.2byte	0x285
	.byte	0x17
	.4byte	0x1ce
	.byte	0x24
	.uleb128 0x19
	.4byte	.LASF101
	.byte	0x7
	.2byte	0x286
	.byte	0xf
	.4byte	0x69
	.byte	0x48
	.uleb128 0x19
	.4byte	.LASF102
	.byte	0x7
	.2byte	0x287
	.byte	0x2c
	.4byte	0x62
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF103
	.byte	0x7
	.2byte	0x288
	.byte	0x1a
	.4byte	0x6c9
	.byte	0x58
	.uleb128 0x19
	.4byte	.LASF104
	.byte	0x7
	.2byte	0x289
	.byte	0x16
	.4byte	0x126
	.byte	0x68
	.uleb128 0x19
	.4byte	.LASF105
	.byte	0x7
	.2byte	0x28a
	.byte	0x16
	.4byte	0x126
	.byte	0x70
	.uleb128 0x19
	.4byte	.LASF106
	.byte	0x7
	.2byte	0x28b
	.byte	0x16
	.4byte	0x126
	.byte	0x78
	.uleb128 0x19
	.4byte	.LASF107
	.byte	0x7
	.2byte	0x28c
	.byte	0x10
	.4byte	0x837
	.byte	0x80
	.uleb128 0x19
	.4byte	.LASF108
	.byte	0x7
	.2byte	0x28d
	.byte	0x10
	.4byte	0x847
	.byte	0x88
	.uleb128 0x19
	.4byte	.LASF109
	.byte	0x7
	.2byte	0x28e
	.byte	0xf
	.4byte	0x69
	.byte	0xa0
	.uleb128 0x19
	.4byte	.LASF110
	.byte	0x7
	.2byte	0x28f
	.byte	0x16
	.4byte	0x126
	.byte	0xa4
	.uleb128 0x19
	.4byte	.LASF111
	.byte	0x7
	.2byte	0x290
	.byte	0x16
	.4byte	0x126
	.byte	0xac
	.uleb128 0x19
	.4byte	.LASF112
	.byte	0x7
	.2byte	0x291
	.byte	0x16
	.4byte	0x126
	.byte	0xb4
	.uleb128 0x19
	.4byte	.LASF113
	.byte	0x7
	.2byte	0x292
	.byte	0x16
	.4byte	0x126
	.byte	0xbc
	.uleb128 0x19
	.4byte	.LASF114
	.byte	0x7
	.2byte	0x293
	.byte	0x16
	.4byte	0x126
	.byte	0xc4
	.uleb128 0x19
	.4byte	.LASF115
	.byte	0x7
	.2byte	0x294
	.byte	0x8
	.4byte	0x69
	.byte	0xcc
	.byte	0
	.uleb128 0xb
	.4byte	0x146
	.4byte	0x837
	.uleb128 0xc
	.4byte	0x75
	.byte	0x19
	.byte	0
	.uleb128 0xb
	.4byte	0x146
	.4byte	0x847
	.uleb128 0xc
	.4byte	0x75
	.byte	0x7
	.byte	0
	.uleb128 0xb
	.4byte	0x146
	.4byte	0x857
	.uleb128 0xc
	.4byte	0x75
	.byte	0x17
	.byte	0
	.uleb128 0x1c
	.byte	0xf0
	.byte	0x7
	.2byte	0x299
	.byte	0x7
	.4byte	0x87e
	.uleb128 0x19
	.4byte	.LASF116
	.byte	0x7
	.2byte	0x29c
	.byte	0x1b
	.4byte	0x87e
	.byte	0
	.uleb128 0x19
	.4byte	.LASF117
	.byte	0x7
	.2byte	0x29d
	.byte	0x18
	.4byte	0x88e
	.byte	0x78
	.byte	0
	.uleb128 0xb
	.4byte	0x32e
	.4byte	0x88e
	.uleb128 0xc
	.4byte	0x75
	.byte	0x1d
	.byte	0
	.uleb128 0xb
	.4byte	0x75
	.4byte	0x89e
	.uleb128 0xc
	.4byte	0x75
	.byte	0x1d
	.byte	0
	.uleb128 0x1d
	.byte	0xf0
	.byte	0x7
	.2byte	0x27e
	.byte	0x3
	.4byte	0x8c3
	.uleb128 0x1e
	.4byte	.LASF67
	.byte	0x7
	.2byte	0x295
	.byte	0xb
	.4byte	0x712
	.uleb128 0x1e
	.4byte	.LASF118
	.byte	0x7
	.2byte	0x29e
	.byte	0xb
	.4byte	0x857
	.byte	0
	.uleb128 0xb
	.4byte	0x146
	.4byte	0x8d3
	.uleb128 0xc
	.4byte	0x75
	.byte	0x18
	.byte	0
	.uleb128 0x7
	.4byte	.LASF120
	.uleb128 0x6
	.byte	0x4
	.4byte	0x8d3
	.uleb128 0x1f
	.4byte	0x8e9
	.uleb128 0x17
	.4byte	0x495
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x8de
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1b8
	.uleb128 0x1f
	.4byte	0x900
	.uleb128 0x17
	.4byte	0x69
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x906
	.uleb128 0x6
	.byte	0x4
	.4byte	0x8f5
	.uleb128 0xb
	.4byte	0x677
	.4byte	0x91c
	.uleb128 0xc
	.4byte	0x75
	.byte	0x2
	.byte	0
	.uleb128 0x20
	.4byte	.LASF121
	.byte	0x7
	.2byte	0x32e
	.byte	0x17
	.4byte	0x495
	.uleb128 0x20
	.4byte	.LASF122
	.byte	0x7
	.2byte	0x32f
	.byte	0x1d
	.4byte	0x49b
	.uleb128 0x21
	.4byte	.LASF123
	.byte	0x1
	.byte	0xe
	.byte	0x14
	.4byte	0x948
	.uleb128 0x5
	.byte	0x3
	.4byte	scb_cpacr
	.uleb128 0x6
	.byte	0x4
	.4byte	0x88
	.uleb128 0x22
	.4byte	.LASF135
	.byte	0x1
	.byte	0x2e
	.byte	0x5
	.4byte	0x69
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9d0
	.uleb128 0x23
	.4byte	.LASF124
	.byte	0x1
	.byte	0x2f
	.byte	0x9
	.4byte	0x9d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x23
	.4byte	.LASF125
	.byte	0x1
	.byte	0x30
	.byte	0x9
	.4byte	0x9d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x23
	.4byte	.LASF126
	.byte	0x1
	.byte	0x31
	.byte	0x9
	.4byte	0x9d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x23
	.4byte	.LASF127
	.byte	0x1
	.byte	0x32
	.byte	0x9
	.4byte	0x9d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x23
	.4byte	.LASF128
	.byte	0x1
	.byte	0x33
	.byte	0x9
	.4byte	0x9d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x24
	.ascii	"i\000"
	.byte	0x1
	.byte	0x34
	.byte	0xf
	.4byte	0x70
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x24
	.ascii	"str\000"
	.byte	0x1
	.byte	0x35
	.byte	0x7
	.4byte	0x9d7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF129
	.uleb128 0xb
	.4byte	0x146
	.4byte	0x9e7
	.uleb128 0xc
	.4byte	0x75
	.byte	0x3
	.byte	0
	.uleb128 0x25
	.4byte	.LASF130
	.byte	0x1
	.byte	0x1e
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa25
	.uleb128 0x24
	.ascii	"a\000"
	.byte	0x1
	.byte	0x1f
	.byte	0xf
	.4byte	0x70
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x24
	.ascii	"b\000"
	.byte	0x1
	.byte	0x1f
	.byte	0x16
	.4byte	0x70
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x24
	.ascii	"c\000"
	.byte	0x1
	.byte	0x1f
	.byte	0x1e
	.4byte	0x70
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x25
	.4byte	.LASF131
	.byte	0x1
	.byte	0x16
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa63
	.uleb128 0x24
	.ascii	"a\000"
	.byte	0x1
	.byte	0x17
	.byte	0xf
	.4byte	0x70
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x24
	.ascii	"b\000"
	.byte	0x1
	.byte	0x17
	.byte	0x16
	.4byte	0x70
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x24
	.ascii	"c\000"
	.byte	0x1
	.byte	0x17
	.byte	0x1e
	.4byte	0x70
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x26
	.4byte	.LASF136
	.byte	0x1
	.byte	0x10
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x24
	.ascii	"a\000"
	.byte	0x1
	.byte	0x11
	.byte	0xf
	.4byte	0x70
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x24
	.ascii	"b\000"
	.byte	0x1
	.byte	0x11
	.byte	0x16
	.4byte	0x70
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x24
	.ascii	"c\000"
	.byte	0x1
	.byte	0x11
	.byte	0x1e
	.4byte	0x70
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF41:
	.ascii	"_dso_handle\000"
.LASF49:
	.ascii	"_size\000"
.LASF93:
	.ascii	"_rand48\000"
.LASF73:
	.ascii	"_emergency\000"
.LASF130:
	.ascii	"my_func_1\000"
.LASF131:
	.ascii	"my_func_2\000"
.LASF136:
	.ascii	"my_func_3\000"
.LASF63:
	.ascii	"_data\000"
.LASF113:
	.ascii	"_wcrtomb_state\000"
.LASF114:
	.ascii	"_wcsrtombs_state\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF53:
	.ascii	"_lbfsize\000"
.LASF120:
	.ascii	"__locale_t\000"
.LASF111:
	.ascii	"_mbrtowc_state\000"
.LASF30:
	.ascii	"__tm_sec\000"
.LASF6:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF59:
	.ascii	"_ubuf\000"
.LASF48:
	.ascii	"_base\000"
.LASF32:
	.ascii	"__tm_hour\000"
.LASF88:
	.ascii	"__sf\000"
.LASF39:
	.ascii	"_on_exit_args\000"
.LASF54:
	.ascii	"_cookie\000"
.LASF87:
	.ascii	"__sglue\000"
.LASF4:
	.ascii	"long int\000"
.LASF51:
	.ascii	"_flags\000"
.LASF43:
	.ascii	"_is_cxa\000"
.LASF69:
	.ascii	"_stdin\000"
.LASF61:
	.ascii	"_blksize\000"
.LASF129:
	.ascii	"double\000"
.LASF83:
	.ascii	"_cvtbuf\000"
.LASF62:
	.ascii	"_offset\000"
.LASF112:
	.ascii	"_mbsrtowcs_state\000"
.LASF123:
	.ascii	"scb_cpacr\000"
.LASF110:
	.ascii	"_mbrlen_state\000"
.LASF40:
	.ascii	"_fnargs\000"
.LASF46:
	.ascii	"_fns\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF26:
	.ascii	"_sign\000"
.LASF21:
	.ascii	"_flock_t\000"
.LASF71:
	.ascii	"_stderr\000"
.LASF134:
	.ascii	"/home/lbogdanov/git_projects/lab_upr_src_code/lab_u"
	.ascii	"pr_4_gcc/04_2/\000"
.LASF101:
	.ascii	"_gamma_signgam\000"
.LASF55:
	.ascii	"_read\000"
.LASF79:
	.ascii	"_result_k\000"
.LASF29:
	.ascii	"__tm\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF17:
	.ascii	"__wchb\000"
.LASF70:
	.ascii	"_stdout\000"
.LASF82:
	.ascii	"_cvtlen\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF52:
	.ascii	"_file\000"
.LASF91:
	.ascii	"_niobs\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF85:
	.ascii	"_atexit0\000"
.LASF108:
	.ascii	"_signal_buf\000"
.LASF99:
	.ascii	"_asctime_buf\000"
.LASF78:
	.ascii	"_result\000"
.LASF16:
	.ascii	"__wch\000"
.LASF12:
	.ascii	"_LOCK_T\000"
.LASF133:
	.ascii	"main.c\000"
.LASF15:
	.ascii	"wint_t\000"
.LASF64:
	.ascii	"_lock\000"
.LASF66:
	.ascii	"_flags2\000"
.LASF56:
	.ascii	"_write\000"
.LASF35:
	.ascii	"__tm_year\000"
.LASF11:
	.ascii	"long double\000"
.LASF116:
	.ascii	"_nextf\000"
.LASF127:
	.ascii	"val0\000"
.LASF34:
	.ascii	"__tm_mon\000"
.LASF125:
	.ascii	"val2\000"
.LASF44:
	.ascii	"_atexit\000"
.LASF76:
	.ascii	"__sdidinit\000"
.LASF13:
	.ascii	"_off_t\000"
.LASF81:
	.ascii	"_freelist\000"
.LASF106:
	.ascii	"_wctomb_state\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF84:
	.ascii	"_new\000"
.LASF115:
	.ascii	"_h_errno\000"
.LASF2:
	.ascii	"short int\000"
.LASF37:
	.ascii	"__tm_yday\000"
.LASF47:
	.ascii	"__sbuf\000"
.LASF92:
	.ascii	"_iobs\000"
.LASF89:
	.ascii	"__FILE\000"
.LASF20:
	.ascii	"_mbstate_t\000"
.LASF50:
	.ascii	"__sFILE\000"
.LASF65:
	.ascii	"_mbstate\000"
.LASF102:
	.ascii	"_rand_next\000"
.LASF104:
	.ascii	"_mblen_state\000"
.LASF72:
	.ascii	"_inc\000"
.LASF45:
	.ascii	"_ind\000"
.LASF75:
	.ascii	"_locale\000"
.LASF77:
	.ascii	"__cleanup\000"
.LASF74:
	.ascii	"_unspecified_locale_info\000"
.LASF25:
	.ascii	"_maxwds\000"
.LASF67:
	.ascii	"_reent\000"
.LASF94:
	.ascii	"_seed\000"
.LASF18:
	.ascii	"__count\000"
.LASF119:
	.ascii	"__lock\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF57:
	.ascii	"_seek\000"
.LASF121:
	.ascii	"_impure_ptr\000"
.LASF14:
	.ascii	"_fpos_t\000"
.LASF68:
	.ascii	"_errno\000"
.LASF22:
	.ascii	"char\000"
.LASF31:
	.ascii	"__tm_min\000"
.LASF95:
	.ascii	"_mult\000"
.LASF24:
	.ascii	"_next\000"
.LASF98:
	.ascii	"_strtok_last\000"
.LASF19:
	.ascii	"__value\000"
.LASF42:
	.ascii	"_fntypes\000"
.LASF132:
	.ascii	"GNU C17 8.2.1 20181213 (release) [gcc-8-branch revi"
	.ascii	"sion 267074] -mcpu=cortex-m7 -mthumb -mfloat-abi=ha"
	.ascii	"rd -mfpu=fpv5-d16 -march=armv7e-m+fp.dp -g -O0\000"
.LASF96:
	.ascii	"_add\000"
.LASF23:
	.ascii	"__ULong\000"
.LASF109:
	.ascii	"_getdate_err\000"
.LASF122:
	.ascii	"_global_impure_ptr\000"
.LASF126:
	.ascii	"val1\000"
.LASF97:
	.ascii	"_unused_rand\000"
.LASF124:
	.ascii	"val3\000"
.LASF27:
	.ascii	"_wds\000"
.LASF36:
	.ascii	"__tm_wday\000"
.LASF90:
	.ascii	"_glue\000"
.LASF117:
	.ascii	"_nmalloc\000"
.LASF107:
	.ascii	"_l64a_buf\000"
.LASF28:
	.ascii	"_Bigint\000"
.LASF86:
	.ascii	"_sig_func\000"
.LASF128:
	.ascii	"my_result\000"
.LASF60:
	.ascii	"_nbuf\000"
.LASF118:
	.ascii	"_unused\000"
.LASF38:
	.ascii	"__tm_isdst\000"
.LASF100:
	.ascii	"_localtime_buf\000"
.LASF58:
	.ascii	"_close\000"
.LASF103:
	.ascii	"_r48\000"
.LASF105:
	.ascii	"_mbtowc_state\000"
.LASF80:
	.ascii	"_p5s\000"
.LASF135:
	.ascii	"main\000"
.LASF33:
	.ascii	"__tm_mday\000"
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2018-q4-major) 8.2.1 20181213 (release) [gcc-8-branch revision 267074]"
