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
	.section	.text.start_of_heap_get,"ax",%progbits
	.align	1
	.global	start_of_heap_get
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	start_of_heap_get, %function
start_of_heap_get:
.LFB0:
	.file 1 "main.c"
	.loc 1 16 38
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 18 9
	ldr	r3, .L3
	.loc 1 19 1
	mov	r0, r3
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L4:
	.align	2
.L3:
	.word	_sheap
	.cfi_endproc
.LFE0:
	.size	start_of_heap_get, .-start_of_heap_get
	.section	.rodata
	.align	2
.LC3:
	.ascii	"The start of the HEAP segment: 0x%08X\012\000"
	.align	2
.LC4:
	.ascii	"\012 dynamic_arr_1[ ] = {\012\000"
	.align	2
.LC5:
	.ascii	"0x%08X\012\000"
	.align	2
.LC6:
	.ascii	"}\012\000"
	.align	2
.LC7:
	.ascii	"\012 dynamic_arr_2[ ] = {\012\000"
	.align	2
.LC8:
	.ascii	"0x%04X\012\000"
	.align	2
.LC9:
	.ascii	"\012 dynamic_arr_3[ ] = {\012\000"
	.align	2
.LC10:
	.ascii	"0x%02X\012\000"
	.align	2
.LC0:
	.word	286331153
	.word	572662306
	.word	858993459
	.word	1145324612
	.word	1431655765
	.word	1717986918
	.word	2004318071
	.word	-2004318072
	.word	-1717986919
	.word	-1431655766
	.align	2
.LC1:
	.short	-17734
	.short	-8482
	.short	-12594
	.short	-258
	.align	2
.LC2:
	.byte	-34
	.byte	-83
	.byte	-66
	.byte	-17
	.section	.text.main,"ax",%progbits
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-d16
	.type	main, %function
main:
.LFB1:
	.loc 1 29 15
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #72
	.cfi_def_cfa_offset 88
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 30 17
	ldr	r3, .L23
	add	r4, r7, #20
	mov	r5, r3
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldm	r5, {r0, r1}
	stm	r4, {r0, r1}
	.loc 1 31 17
	ldr	r2, .L23+4
	add	r3, r7, #12
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	.loc 1 32 16
	ldr	r3, .L23+8
	ldr	r3, [r3]
	str	r3, [r7, #8]
	.loc 1 38 13
	ldr	r3, .L23+12
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, .L23+12
	ldr	r3, [r3]
	orr	r2, r2, #15728640
	str	r2, [r3]
	.loc 1 40 2
	bl	led_init
	.loc 1 41 2
	mov	r0, #9600
	bl	uart_init
	.loc 1 43 2
	bl	button_init
	.loc 1 46 2
	bl	start_of_heap_get
	mov	r3, r0
	mov	r1, r3
	ldr	r0, .L23+16
	bl	printf_
	.loc 1 48 30
	movs	r0, #40
	bl	malloc
	mov	r3, r0
	str	r3, [r7, #68]
	.loc 1 50 8
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 50 2
	b	.L6
.L7:
	.loc 1 51 34 discriminator 3
	ldr	r3, [r7, #4]
	.loc 1 51 16 discriminator 3
	ldr	r2, [r7, #4]
	lsls	r2, r2, #2
	ldr	r1, [r7, #68]
	add	r2, r2, r1
	.loc 1 51 34 discriminator 3
	lsls	r3, r3, #2
	add	r1, r7, #72
	add	r3, r3, r1
	ldr	r3, [r3, #-52]
	.loc 1 51 20 discriminator 3
	str	r3, [r2]
	.loc 1 50 22 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L6:
	.loc 1 50 15 discriminator 1
	ldr	r3, [r7, #4]
	.loc 1 50 2 discriminator 1
	cmp	r3, #9
	ble	.L7
	.loc 1 54 30
	movs	r0, #8
	bl	malloc
	mov	r3, r0
	str	r3, [r7, #64]
	.loc 1 56 8
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 56 2
	b	.L8
.L9:
	.loc 1 57 34 discriminator 3
	ldr	r3, [r7, #4]
	.loc 1 57 16 discriminator 3
	ldr	r2, [r7, #4]
	lsls	r2, r2, #1
	ldr	r1, [r7, #64]
	add	r2, r2, r1
	.loc 1 57 34 discriminator 3
	lsls	r3, r3, #1
	add	r1, r7, #72
	add	r3, r3, r1
	ldrh	r3, [r3, #-60]
	.loc 1 57 20 discriminator 3
	strh	r3, [r2]	@ movhi
	.loc 1 56 21 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L8:
	.loc 1 56 15 discriminator 1
	ldr	r3, [r7, #4]
	.loc 1 56 2 discriminator 1
	cmp	r3, #3
	ble	.L9
	.loc 1 60 2
	ldr	r0, .L23+20
	bl	printf_
	.loc 1 61 8
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 61 2
	b	.L10
.L11:
	.loc 1 62 35 discriminator 3
	ldr	r3, [r7, #4]
	lsls	r3, r3, #2
	ldr	r2, [r7, #68]
	add	r3, r3, r2
	.loc 1 62 3 discriminator 3
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, .L23+24
	bl	printf_
	.loc 1 61 22 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L10:
	.loc 1 61 15 discriminator 1
	ldr	r3, [r7, #4]
	.loc 1 61 2 discriminator 1
	cmp	r3, #9
	ble	.L11
	.loc 1 64 2
	ldr	r0, .L23+28
	bl	printf_
	.loc 1 66 2
	ldr	r0, .L23+32
	bl	printf_
	.loc 1 67 8
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 67 2
	b	.L12
.L13:
	.loc 1 68 35 discriminator 3
	ldr	r3, [r7, #4]
	lsls	r3, r3, #1
	ldr	r2, [r7, #64]
	add	r3, r3, r2
	ldrh	r3, [r3]
	.loc 1 68 3 discriminator 3
	mov	r1, r3
	ldr	r0, .L23+36
	bl	printf_
	.loc 1 67 21 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L12:
	.loc 1 67 15 discriminator 1
	ldr	r3, [r7, #4]
	.loc 1 67 2 discriminator 1
	cmp	r3, #3
	ble	.L13
	.loc 1 70 2
	ldr	r0, .L23+28
	bl	printf_
	.loc 1 72 2
	ldr	r0, [r7, #68]
	bl	free
	.loc 1 74 29
	movs	r0, #8
	bl	malloc
	mov	r3, r0
	str	r3, [r7, #60]
	.loc 1 76 8
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 76 2
	b	.L14
.L15:
	.loc 1 77 34 discriminator 3
	ldr	r2, [r7, #4]
	.loc 1 77 16 discriminator 3
	ldr	r3, [r7, #4]
	mov	r1, r3
	ldr	r3, [r7, #60]
	add	r3, r3, r1
	.loc 1 77 34 discriminator 3
	add	r1, r7, #72
	add	r2, r2, r1
	ldrb	r2, [r2, #-64]	@ zero_extendqisi2
	.loc 1 77 20 discriminator 3
	strb	r2, [r3]
	.loc 1 76 21 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L14:
	.loc 1 76 15 discriminator 1
	ldr	r3, [r7, #4]
	.loc 1 76 2 discriminator 1
	cmp	r3, #3
	ble	.L15
	.loc 1 80 2
	ldr	r0, .L23+40
	bl	printf_
	.loc 1 81 8
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 81 2
	b	.L16
.L17:
	.loc 1 82 35 discriminator 3
	ldr	r3, [r7, #4]
	mov	r2, r3
	ldr	r3, [r7, #60]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 82 3 discriminator 3
	mov	r1, r3
	ldr	r0, .L23+44
	bl	printf_
	.loc 1 81 21 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L16:
	.loc 1 81 15 discriminator 1
	ldr	r3, [r7, #4]
	.loc 1 81 2 discriminator 1
	cmp	r3, #3
	ble	.L17
	.loc 1 84 2
	ldr	r0, .L23+28
	bl	printf_
	.loc 1 86 2
	ldr	r0, [r7, #64]
	bl	free
	.loc 1 87 2
	ldr	r0, [r7, #60]
	bl	free
.L22:
	.loc 1 90 3
	bl	led_set
	.loc 1 91 9
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 91 3
	b	.L18
.L19:
	.loc 1 91 26 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L18:
	.loc 1 91 16 discriminator 1
	ldr	r3, [r7, #4]
	.loc 1 91 3 discriminator 1
	movw	r2, #49999
	cmp	r3, r2
	ble	.L19
	.loc 1 92 3
	bl	led_clear
	.loc 1 93 9
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 93 3
	b	.L20
.L21:
	.loc 1 93 26 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L20:
	.loc 1 93 16 discriminator 1
	ldr	r3, [r7, #4]
	.loc 1 93 3 discriminator 1
	movw	r2, #49999
	cmp	r3, r2
	ble	.L21
	.loc 1 90 3
	b	.L22
.L24:
	.align	2
.L23:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	scb_cpacr
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.text
.Letext0:
	.file 2 "/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/arm-none-eabi/include/sys/lock.h"
	.file 4 "/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/arm-none-eabi/include/sys/_types.h"
	.file 5 "/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/lib/gcc/arm-none-eabi/8.2.1/include/stddef.h"
	.file 6 "/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/arm-none-eabi/include/sys/reent.h"
	.file 7 "/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/arm-none-eabi/include/stdlib.h"
	.file 8 "/home/lbogdanov/programs/gcc-arm-none-eabi-8-2018-q4-major/arm-none-eabi/include/sys/_stdint.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xa90
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF136
	.byte	0xc
	.4byte	.LASF137
	.4byte	.LASF138
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x4
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x5
	.4byte	.LASF6
	.byte	0x2
	.byte	0x2b
	.byte	0x18
	.4byte	0x59
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x5
	.4byte	.LASF7
	.byte	0x2
	.byte	0x39
	.byte	0x19
	.4byte	0x73
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x5
	.4byte	.LASF13
	.byte	0x3
	.byte	0x22
	.byte	0x19
	.4byte	0xa7
	.uleb128 0x6
	.byte	0x4
	.4byte	0xad
	.uleb128 0x7
	.4byte	.LASF120
	.uleb128 0x5
	.4byte	.LASF14
	.byte	0x4
	.byte	0x2c
	.byte	0xe
	.4byte	0x7a
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x4
	.byte	0x72
	.byte	0xe
	.4byte	0x7a
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x5
	.2byte	0x165
	.byte	0x17
	.4byte	0x25
	.uleb128 0x9
	.byte	0x4
	.byte	0x4
	.byte	0xa6
	.byte	0x3
	.4byte	0xf9
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x4
	.byte	0xa8
	.byte	0xc
	.4byte	0xca
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x4
	.byte	0xa9
	.byte	0x13
	.4byte	0xf9
	.byte	0
	.uleb128 0xb
	.4byte	0x59
	.4byte	0x109
	.uleb128 0xc
	.4byte	0x25
	.byte	0x3
	.byte	0
	.uleb128 0xd
	.byte	0x8
	.byte	0x4
	.byte	0xa3
	.byte	0x9
	.4byte	0x12d
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x4
	.byte	0xa5
	.byte	0x7
	.4byte	0x2c
	.byte	0
	.uleb128 0xe
	.4byte	.LASF20
	.byte	0x4
	.byte	0xaa
	.byte	0x5
	.4byte	0xd7
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.4byte	.LASF21
	.byte	0x4
	.byte	0xab
	.byte	0x3
	.4byte	0x109
	.uleb128 0x5
	.4byte	.LASF22
	.byte	0x4
	.byte	0xaf
	.byte	0x1b
	.4byte	0x9b
	.uleb128 0xf
	.byte	0x4
	.uleb128 0x6
	.byte	0x4
	.4byte	0x14d
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF23
	.uleb128 0x10
	.4byte	0x14d
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0x6
	.byte	0x16
	.byte	0x19
	.4byte	0x8d
	.uleb128 0x11
	.4byte	.LASF29
	.byte	0x18
	.byte	0x6
	.byte	0x2f
	.byte	0x8
	.4byte	0x1bf
	.uleb128 0xe
	.4byte	.LASF25
	.byte	0x6
	.byte	0x31
	.byte	0x13
	.4byte	0x1bf
	.byte	0
	.uleb128 0x12
	.ascii	"_k\000"
	.byte	0x6
	.byte	0x32
	.byte	0x7
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF26
	.byte	0x6
	.byte	0x32
	.byte	0xb
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x6
	.byte	0x32
	.byte	0x14
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF28
	.byte	0x6
	.byte	0x32
	.byte	0x1b
	.4byte	0x2c
	.byte	0x10
	.uleb128 0x12
	.ascii	"_x\000"
	.byte	0x6
	.byte	0x33
	.byte	0xb
	.4byte	0x1c5
	.byte	0x14
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x165
	.uleb128 0xb
	.4byte	0x159
	.4byte	0x1d5
	.uleb128 0xc
	.4byte	0x25
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF30
	.byte	0x24
	.byte	0x6
	.byte	0x37
	.byte	0x8
	.4byte	0x258
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x6
	.byte	0x39
	.byte	0x9
	.4byte	0x2c
	.byte	0
	.uleb128 0xe
	.4byte	.LASF32
	.byte	0x6
	.byte	0x3a
	.byte	0x9
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF33
	.byte	0x6
	.byte	0x3b
	.byte	0x9
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF34
	.byte	0x6
	.byte	0x3c
	.byte	0x9
	.4byte	0x2c
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF35
	.byte	0x6
	.byte	0x3d
	.byte	0x9
	.4byte	0x2c
	.byte	0x10
	.uleb128 0xe
	.4byte	.LASF36
	.byte	0x6
	.byte	0x3e
	.byte	0x9
	.4byte	0x2c
	.byte	0x14
	.uleb128 0xe
	.4byte	.LASF37
	.byte	0x6
	.byte	0x3f
	.byte	0x9
	.4byte	0x2c
	.byte	0x18
	.uleb128 0xe
	.4byte	.LASF38
	.byte	0x6
	.byte	0x40
	.byte	0x9
	.4byte	0x2c
	.byte	0x1c
	.uleb128 0xe
	.4byte	.LASF39
	.byte	0x6
	.byte	0x41
	.byte	0x9
	.4byte	0x2c
	.byte	0x20
	.byte	0
	.uleb128 0x13
	.4byte	.LASF40
	.2byte	0x108
	.byte	0x6
	.byte	0x4a
	.byte	0x8
	.4byte	0x29d
	.uleb128 0xe
	.4byte	.LASF41
	.byte	0x6
	.byte	0x4b
	.byte	0xa
	.4byte	0x29d
	.byte	0
	.uleb128 0xe
	.4byte	.LASF42
	.byte	0x6
	.byte	0x4c
	.byte	0x9
	.4byte	0x29d
	.byte	0x80
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x6
	.byte	0x4e
	.byte	0xa
	.4byte	0x159
	.2byte	0x100
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x6
	.byte	0x51
	.byte	0xa
	.4byte	0x159
	.2byte	0x104
	.byte	0
	.uleb128 0xb
	.4byte	0x145
	.4byte	0x2ad
	.uleb128 0xc
	.4byte	0x25
	.byte	0x1f
	.byte	0
	.uleb128 0x13
	.4byte	.LASF45
	.2byte	0x190
	.byte	0x6
	.byte	0x5d
	.byte	0x8
	.4byte	0x2f0
	.uleb128 0xe
	.4byte	.LASF25
	.byte	0x6
	.byte	0x5e
	.byte	0x12
	.4byte	0x2f0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF46
	.byte	0x6
	.byte	0x5f
	.byte	0x6
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF47
	.byte	0x6
	.byte	0x61
	.byte	0x9
	.4byte	0x2f6
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF40
	.byte	0x6
	.byte	0x62
	.byte	0x1e
	.4byte	0x258
	.byte	0x88
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2ad
	.uleb128 0xb
	.4byte	0x306
	.4byte	0x306
	.uleb128 0xc
	.4byte	0x25
	.byte	0x1f
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x30c
	.uleb128 0x15
	.uleb128 0x11
	.4byte	.LASF48
	.byte	0x8
	.byte	0x6
	.byte	0x75
	.byte	0x8
	.4byte	0x335
	.uleb128 0xe
	.4byte	.LASF49
	.byte	0x6
	.byte	0x76
	.byte	0x11
	.4byte	0x335
	.byte	0
	.uleb128 0xe
	.4byte	.LASF50
	.byte	0x6
	.byte	0x77
	.byte	0x6
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x59
	.uleb128 0x11
	.4byte	.LASF51
	.byte	0x68
	.byte	0x6
	.byte	0xb5
	.byte	0x8
	.4byte	0x47e
	.uleb128 0x12
	.ascii	"_p\000"
	.byte	0x6
	.byte	0xb6
	.byte	0x12
	.4byte	0x335
	.byte	0
	.uleb128 0x12
	.ascii	"_r\000"
	.byte	0x6
	.byte	0xb7
	.byte	0x7
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x12
	.ascii	"_w\000"
	.byte	0x6
	.byte	0xb8
	.byte	0x7
	.4byte	0x2c
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF52
	.byte	0x6
	.byte	0xb9
	.byte	0x9
	.4byte	0x60
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF53
	.byte	0x6
	.byte	0xba
	.byte	0x9
	.4byte	0x60
	.byte	0xe
	.uleb128 0x12
	.ascii	"_bf\000"
	.byte	0x6
	.byte	0xbb
	.byte	0x11
	.4byte	0x30d
	.byte	0x10
	.uleb128 0xe
	.4byte	.LASF54
	.byte	0x6
	.byte	0xbc
	.byte	0x7
	.4byte	0x2c
	.byte	0x18
	.uleb128 0xe
	.4byte	.LASF55
	.byte	0x6
	.byte	0xc3
	.byte	0xa
	.4byte	0x145
	.byte	0x1c
	.uleb128 0xe
	.4byte	.LASF56
	.byte	0x6
	.byte	0xc5
	.byte	0x1d
	.4byte	0x5f0
	.byte	0x20
	.uleb128 0xe
	.4byte	.LASF57
	.byte	0x6
	.byte	0xc7
	.byte	0x1d
	.4byte	0x61a
	.byte	0x24
	.uleb128 0xe
	.4byte	.LASF58
	.byte	0x6
	.byte	0xca
	.byte	0xd
	.4byte	0x63e
	.byte	0x28
	.uleb128 0xe
	.4byte	.LASF59
	.byte	0x6
	.byte	0xcb
	.byte	0x9
	.4byte	0x658
	.byte	0x2c
	.uleb128 0x12
	.ascii	"_ub\000"
	.byte	0x6
	.byte	0xce
	.byte	0x11
	.4byte	0x30d
	.byte	0x30
	.uleb128 0x12
	.ascii	"_up\000"
	.byte	0x6
	.byte	0xcf
	.byte	0x12
	.4byte	0x335
	.byte	0x38
	.uleb128 0x12
	.ascii	"_ur\000"
	.byte	0x6
	.byte	0xd0
	.byte	0x7
	.4byte	0x2c
	.byte	0x3c
	.uleb128 0xe
	.4byte	.LASF60
	.byte	0x6
	.byte	0xd3
	.byte	0x11
	.4byte	0x65e
	.byte	0x40
	.uleb128 0xe
	.4byte	.LASF61
	.byte	0x6
	.byte	0xd4
	.byte	0x11
	.4byte	0x66e
	.byte	0x43
	.uleb128 0x12
	.ascii	"_lb\000"
	.byte	0x6
	.byte	0xd7
	.byte	0x11
	.4byte	0x30d
	.byte	0x44
	.uleb128 0xe
	.4byte	.LASF62
	.byte	0x6
	.byte	0xda
	.byte	0x7
	.4byte	0x2c
	.byte	0x4c
	.uleb128 0xe
	.4byte	.LASF63
	.byte	0x6
	.byte	0xdb
	.byte	0xa
	.4byte	0xb2
	.byte	0x50
	.uleb128 0xe
	.4byte	.LASF64
	.byte	0x6
	.byte	0xde
	.byte	0x12
	.4byte	0x49c
	.byte	0x54
	.uleb128 0xe
	.4byte	.LASF65
	.byte	0x6
	.byte	0xe2
	.byte	0xc
	.4byte	0x139
	.byte	0x58
	.uleb128 0xe
	.4byte	.LASF66
	.byte	0x6
	.byte	0xe4
	.byte	0xe
	.4byte	0x12d
	.byte	0x5c
	.uleb128 0xe
	.4byte	.LASF67
	.byte	0x6
	.byte	0xe5
	.byte	0x9
	.4byte	0x2c
	.byte	0x64
	.byte	0
	.uleb128 0x16
	.4byte	0x2c
	.4byte	0x49c
	.uleb128 0x17
	.4byte	0x49c
	.uleb128 0x17
	.4byte	0x145
	.uleb128 0x17
	.4byte	0x147
	.uleb128 0x17
	.4byte	0x2c
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x4a7
	.uleb128 0x10
	.4byte	0x49c
	.uleb128 0x18
	.4byte	.LASF68
	.2byte	0x428
	.byte	0x6
	.2byte	0x260
	.byte	0x8
	.4byte	0x5f0
	.uleb128 0x19
	.4byte	.LASF69
	.byte	0x6
	.2byte	0x262
	.byte	0x7
	.4byte	0x2c
	.byte	0
	.uleb128 0x19
	.4byte	.LASF70
	.byte	0x6
	.2byte	0x267
	.byte	0xb
	.4byte	0x6ca
	.byte	0x4
	.uleb128 0x19
	.4byte	.LASF71
	.byte	0x6
	.2byte	0x267
	.byte	0x14
	.4byte	0x6ca
	.byte	0x8
	.uleb128 0x19
	.4byte	.LASF72
	.byte	0x6
	.2byte	0x267
	.byte	0x1e
	.4byte	0x6ca
	.byte	0xc
	.uleb128 0x19
	.4byte	.LASF73
	.byte	0x6
	.2byte	0x269
	.byte	0x8
	.4byte	0x2c
	.byte	0x10
	.uleb128 0x19
	.4byte	.LASF74
	.byte	0x6
	.2byte	0x26a
	.byte	0x8
	.4byte	0x8ca
	.byte	0x14
	.uleb128 0x19
	.4byte	.LASF75
	.byte	0x6
	.2byte	0x26d
	.byte	0x7
	.4byte	0x2c
	.byte	0x30
	.uleb128 0x19
	.4byte	.LASF76
	.byte	0x6
	.2byte	0x26e
	.byte	0x16
	.4byte	0x8df
	.byte	0x34
	.uleb128 0x19
	.4byte	.LASF77
	.byte	0x6
	.2byte	0x270
	.byte	0x7
	.4byte	0x2c
	.byte	0x38
	.uleb128 0x19
	.4byte	.LASF78
	.byte	0x6
	.2byte	0x272
	.byte	0xa
	.4byte	0x8f0
	.byte	0x3c
	.uleb128 0x19
	.4byte	.LASF79
	.byte	0x6
	.2byte	0x275
	.byte	0x13
	.4byte	0x1bf
	.byte	0x40
	.uleb128 0x19
	.4byte	.LASF80
	.byte	0x6
	.2byte	0x276
	.byte	0x7
	.4byte	0x2c
	.byte	0x44
	.uleb128 0x19
	.4byte	.LASF81
	.byte	0x6
	.2byte	0x277
	.byte	0x13
	.4byte	0x1bf
	.byte	0x48
	.uleb128 0x19
	.4byte	.LASF82
	.byte	0x6
	.2byte	0x278
	.byte	0x14
	.4byte	0x8f6
	.byte	0x4c
	.uleb128 0x19
	.4byte	.LASF83
	.byte	0x6
	.2byte	0x27b
	.byte	0x7
	.4byte	0x2c
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF84
	.byte	0x6
	.2byte	0x27c
	.byte	0x9
	.4byte	0x147
	.byte	0x54
	.uleb128 0x19
	.4byte	.LASF85
	.byte	0x6
	.2byte	0x29f
	.byte	0x7
	.4byte	0x8a5
	.byte	0x58
	.uleb128 0x1a
	.4byte	.LASF45
	.byte	0x6
	.2byte	0x2a3
	.byte	0x13
	.4byte	0x2f0
	.2byte	0x148
	.uleb128 0x1a
	.4byte	.LASF86
	.byte	0x6
	.2byte	0x2a4
	.byte	0x12
	.4byte	0x2ad
	.2byte	0x14c
	.uleb128 0x1a
	.4byte	.LASF87
	.byte	0x6
	.2byte	0x2a8
	.byte	0xc
	.4byte	0x907
	.2byte	0x2dc
	.uleb128 0x1a
	.4byte	.LASF88
	.byte	0x6
	.2byte	0x2ad
	.byte	0x10
	.4byte	0x68b
	.2byte	0x2e0
	.uleb128 0x1a
	.4byte	.LASF89
	.byte	0x6
	.2byte	0x2af
	.byte	0xa
	.4byte	0x913
	.2byte	0x2ec
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x47e
	.uleb128 0x16
	.4byte	0x2c
	.4byte	0x614
	.uleb128 0x17
	.4byte	0x49c
	.uleb128 0x17
	.4byte	0x145
	.uleb128 0x17
	.4byte	0x614
	.uleb128 0x17
	.4byte	0x2c
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x154
	.uleb128 0x6
	.byte	0x4
	.4byte	0x5f6
	.uleb128 0x16
	.4byte	0xbe
	.4byte	0x63e
	.uleb128 0x17
	.4byte	0x49c
	.uleb128 0x17
	.4byte	0x145
	.uleb128 0x17
	.4byte	0xbe
	.uleb128 0x17
	.4byte	0x2c
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x620
	.uleb128 0x16
	.4byte	0x2c
	.4byte	0x658
	.uleb128 0x17
	.4byte	0x49c
	.uleb128 0x17
	.4byte	0x145
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x644
	.uleb128 0xb
	.4byte	0x59
	.4byte	0x66e
	.uleb128 0xc
	.4byte	0x25
	.byte	0x2
	.byte	0
	.uleb128 0xb
	.4byte	0x59
	.4byte	0x67e
	.uleb128 0xc
	.4byte	0x25
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF90
	.byte	0x6
	.2byte	0x11f
	.byte	0x1a
	.4byte	0x33b
	.uleb128 0x1b
	.4byte	.LASF91
	.byte	0xc
	.byte	0x6
	.2byte	0x123
	.byte	0x8
	.4byte	0x6c4
	.uleb128 0x19
	.4byte	.LASF25
	.byte	0x6
	.2byte	0x125
	.byte	0x11
	.4byte	0x6c4
	.byte	0
	.uleb128 0x19
	.4byte	.LASF92
	.byte	0x6
	.2byte	0x126
	.byte	0x7
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x19
	.4byte	.LASF93
	.byte	0x6
	.2byte	0x127
	.byte	0xb
	.4byte	0x6ca
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x68b
	.uleb128 0x6
	.byte	0x4
	.4byte	0x67e
	.uleb128 0x1b
	.4byte	.LASF94
	.byte	0xe
	.byte	0x6
	.2byte	0x13f
	.byte	0x8
	.4byte	0x709
	.uleb128 0x19
	.4byte	.LASF95
	.byte	0x6
	.2byte	0x140
	.byte	0x12
	.4byte	0x709
	.byte	0
	.uleb128 0x19
	.4byte	.LASF96
	.byte	0x6
	.2byte	0x141
	.byte	0x12
	.4byte	0x709
	.byte	0x6
	.uleb128 0x19
	.4byte	.LASF97
	.byte	0x6
	.2byte	0x142
	.byte	0x12
	.4byte	0x73
	.byte	0xc
	.byte	0
	.uleb128 0xb
	.4byte	0x73
	.4byte	0x719
	.uleb128 0xc
	.4byte	0x25
	.byte	0x2
	.byte	0
	.uleb128 0x1c
	.byte	0xd0
	.byte	0x6
	.2byte	0x280
	.byte	0x7
	.4byte	0x82e
	.uleb128 0x19
	.4byte	.LASF98
	.byte	0x6
	.2byte	0x282
	.byte	0x18
	.4byte	0x25
	.byte	0
	.uleb128 0x19
	.4byte	.LASF99
	.byte	0x6
	.2byte	0x283
	.byte	0x12
	.4byte	0x147
	.byte	0x4
	.uleb128 0x19
	.4byte	.LASF100
	.byte	0x6
	.2byte	0x284
	.byte	0x10
	.4byte	0x82e
	.byte	0x8
	.uleb128 0x19
	.4byte	.LASF101
	.byte	0x6
	.2byte	0x285
	.byte	0x17
	.4byte	0x1d5
	.byte	0x24
	.uleb128 0x19
	.4byte	.LASF102
	.byte	0x6
	.2byte	0x286
	.byte	0xf
	.4byte	0x2c
	.byte	0x48
	.uleb128 0x19
	.4byte	.LASF103
	.byte	0x6
	.2byte	0x287
	.byte	0x2c
	.4byte	0x94
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF104
	.byte	0x6
	.2byte	0x288
	.byte	0x1a
	.4byte	0x6d0
	.byte	0x58
	.uleb128 0x19
	.4byte	.LASF105
	.byte	0x6
	.2byte	0x289
	.byte	0x16
	.4byte	0x12d
	.byte	0x68
	.uleb128 0x19
	.4byte	.LASF106
	.byte	0x6
	.2byte	0x28a
	.byte	0x16
	.4byte	0x12d
	.byte	0x70
	.uleb128 0x19
	.4byte	.LASF107
	.byte	0x6
	.2byte	0x28b
	.byte	0x16
	.4byte	0x12d
	.byte	0x78
	.uleb128 0x19
	.4byte	.LASF108
	.byte	0x6
	.2byte	0x28c
	.byte	0x10
	.4byte	0x83e
	.byte	0x80
	.uleb128 0x19
	.4byte	.LASF109
	.byte	0x6
	.2byte	0x28d
	.byte	0x10
	.4byte	0x84e
	.byte	0x88
	.uleb128 0x19
	.4byte	.LASF110
	.byte	0x6
	.2byte	0x28e
	.byte	0xf
	.4byte	0x2c
	.byte	0xa0
	.uleb128 0x19
	.4byte	.LASF111
	.byte	0x6
	.2byte	0x28f
	.byte	0x16
	.4byte	0x12d
	.byte	0xa4
	.uleb128 0x19
	.4byte	.LASF112
	.byte	0x6
	.2byte	0x290
	.byte	0x16
	.4byte	0x12d
	.byte	0xac
	.uleb128 0x19
	.4byte	.LASF113
	.byte	0x6
	.2byte	0x291
	.byte	0x16
	.4byte	0x12d
	.byte	0xb4
	.uleb128 0x19
	.4byte	.LASF114
	.byte	0x6
	.2byte	0x292
	.byte	0x16
	.4byte	0x12d
	.byte	0xbc
	.uleb128 0x19
	.4byte	.LASF115
	.byte	0x6
	.2byte	0x293
	.byte	0x16
	.4byte	0x12d
	.byte	0xc4
	.uleb128 0x19
	.4byte	.LASF116
	.byte	0x6
	.2byte	0x294
	.byte	0x8
	.4byte	0x2c
	.byte	0xcc
	.byte	0
	.uleb128 0xb
	.4byte	0x14d
	.4byte	0x83e
	.uleb128 0xc
	.4byte	0x25
	.byte	0x19
	.byte	0
	.uleb128 0xb
	.4byte	0x14d
	.4byte	0x84e
	.uleb128 0xc
	.4byte	0x25
	.byte	0x7
	.byte	0
	.uleb128 0xb
	.4byte	0x14d
	.4byte	0x85e
	.uleb128 0xc
	.4byte	0x25
	.byte	0x17
	.byte	0
	.uleb128 0x1c
	.byte	0xf0
	.byte	0x6
	.2byte	0x299
	.byte	0x7
	.4byte	0x885
	.uleb128 0x19
	.4byte	.LASF117
	.byte	0x6
	.2byte	0x29c
	.byte	0x1b
	.4byte	0x885
	.byte	0
	.uleb128 0x19
	.4byte	.LASF118
	.byte	0x6
	.2byte	0x29d
	.byte	0x18
	.4byte	0x895
	.byte	0x78
	.byte	0
	.uleb128 0xb
	.4byte	0x335
	.4byte	0x895
	.uleb128 0xc
	.4byte	0x25
	.byte	0x1d
	.byte	0
	.uleb128 0xb
	.4byte	0x25
	.4byte	0x8a5
	.uleb128 0xc
	.4byte	0x25
	.byte	0x1d
	.byte	0
	.uleb128 0x1d
	.byte	0xf0
	.byte	0x6
	.2byte	0x27e
	.byte	0x3
	.4byte	0x8ca
	.uleb128 0x1e
	.4byte	.LASF68
	.byte	0x6
	.2byte	0x295
	.byte	0xb
	.4byte	0x719
	.uleb128 0x1e
	.4byte	.LASF119
	.byte	0x6
	.2byte	0x29e
	.byte	0xb
	.4byte	0x85e
	.byte	0
	.uleb128 0xb
	.4byte	0x14d
	.4byte	0x8da
	.uleb128 0xc
	.4byte	0x25
	.byte	0x18
	.byte	0
	.uleb128 0x7
	.4byte	.LASF121
	.uleb128 0x6
	.byte	0x4
	.4byte	0x8da
	.uleb128 0x1f
	.4byte	0x8f0
	.uleb128 0x17
	.4byte	0x49c
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x8e5
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1bf
	.uleb128 0x1f
	.4byte	0x907
	.uleb128 0x17
	.4byte	0x2c
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x90d
	.uleb128 0x6
	.byte	0x4
	.4byte	0x8fc
	.uleb128 0xb
	.4byte	0x67e
	.4byte	0x923
	.uleb128 0xc
	.4byte	0x25
	.byte	0x2
	.byte	0
	.uleb128 0x20
	.4byte	.LASF122
	.byte	0x6
	.2byte	0x32e
	.byte	0x17
	.4byte	0x49c
	.uleb128 0x20
	.4byte	.LASF123
	.byte	0x6
	.2byte	0x32f
	.byte	0x1d
	.4byte	0x4a2
	.uleb128 0x21
	.4byte	.LASF124
	.byte	0x7
	.byte	0x64
	.byte	0xe
	.4byte	0x147
	.uleb128 0x5
	.4byte	.LASF125
	.byte	0x8
	.byte	0x18
	.byte	0x13
	.4byte	0x4d
	.uleb128 0x10
	.4byte	0x949
	.uleb128 0x5
	.4byte	.LASF126
	.byte	0x8
	.byte	0x24
	.byte	0x14
	.4byte	0x67
	.uleb128 0x10
	.4byte	0x95a
	.uleb128 0x5
	.4byte	.LASF127
	.byte	0x8
	.byte	0x30
	.byte	0x14
	.4byte	0x81
	.uleb128 0x4
	.4byte	0x96b
	.uleb128 0x10
	.4byte	0x96b
	.uleb128 0x22
	.4byte	.LASF128
	.byte	0x1
	.byte	0xe
	.byte	0x14
	.4byte	0x993
	.uleb128 0x5
	.byte	0x3
	.4byte	scb_cpacr
	.uleb128 0x6
	.byte	0x4
	.4byte	0x977
	.uleb128 0x23
	.4byte	.LASF139
	.byte	0x1
	.byte	0x1d
	.byte	0x5
	.4byte	0x2c
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa1f
	.uleb128 0x24
	.4byte	.LASF129
	.byte	0x1
	.byte	0x1e
	.byte	0x11
	.4byte	0xa2f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x24
	.4byte	.LASF130
	.byte	0x1
	.byte	0x1f
	.byte	0x11
	.4byte	0xa44
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x24
	.4byte	.LASF131
	.byte	0x1
	.byte	0x20
	.byte	0x10
	.4byte	0xa59
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x24
	.4byte	.LASF132
	.byte	0x1
	.byte	0x21
	.byte	0xc
	.4byte	0xa5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x24
	.4byte	.LASF133
	.byte	0x1
	.byte	0x22
	.byte	0xc
	.4byte	0xa64
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x24
	.4byte	.LASF134
	.byte	0x1
	.byte	0x23
	.byte	0xb
	.4byte	0xa6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x25
	.ascii	"i\000"
	.byte	0x1
	.byte	0x24
	.byte	0xf
	.4byte	0x33
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.byte	0
	.uleb128 0xb
	.4byte	0x97c
	.4byte	0xa2f
	.uleb128 0xc
	.4byte	0x25
	.byte	0x9
	.byte	0
	.uleb128 0x10
	.4byte	0xa1f
	.uleb128 0xb
	.4byte	0x966
	.4byte	0xa44
	.uleb128 0xc
	.4byte	0x25
	.byte	0x3
	.byte	0
	.uleb128 0x10
	.4byte	0xa34
	.uleb128 0xb
	.4byte	0x955
	.4byte	0xa59
	.uleb128 0xc
	.4byte	0x25
	.byte	0x3
	.byte	0
	.uleb128 0x10
	.4byte	0xa49
	.uleb128 0x6
	.byte	0x4
	.4byte	0x96b
	.uleb128 0x6
	.byte	0x4
	.4byte	0x95a
	.uleb128 0x6
	.byte	0x4
	.4byte	0x949
	.uleb128 0x26
	.4byte	.LASF140
	.byte	0x1
	.byte	0x10
	.byte	0xf
	.4byte	0x8d
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x21
	.4byte	.LASF135
	.byte	0x1
	.byte	0x11
	.byte	0xe
	.4byte	0x14d
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
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
	.uleb128 0x4
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x49
	.uleb128 0x13
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
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF42:
	.ascii	"_dso_handle\000"
.LASF50:
	.ascii	"_size\000"
.LASF94:
	.ascii	"_rand48\000"
.LASF74:
	.ascii	"_emergency\000"
.LASF6:
	.ascii	"__uint8_t\000"
.LASF64:
	.ascii	"_data\000"
.LASF133:
	.ascii	"dynamic_arr_2\000"
.LASF114:
	.ascii	"_wcrtomb_state\000"
.LASF115:
	.ascii	"_wcsrtombs_state\000"
.LASF12:
	.ascii	"long long unsigned int\000"
.LASF54:
	.ascii	"_lbfsize\000"
.LASF136:
	.ascii	"GNU C17 8.2.1 20181213 (release) [gcc-8-branch revi"
	.ascii	"sion 267074] -mcpu=cortex-m7 -mthumb -mfloat-abi=ha"
	.ascii	"rd -mfpu=fpv5-d16 -march=armv7e-m+fp.dp -g -O0 -ffu"
	.ascii	"nction-sections\000"
.LASF112:
	.ascii	"_mbrtowc_state\000"
.LASF31:
	.ascii	"__tm_sec\000"
.LASF1:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF60:
	.ascii	"_ubuf\000"
.LASF49:
	.ascii	"_base\000"
.LASF33:
	.ascii	"__tm_hour\000"
.LASF89:
	.ascii	"__sf\000"
.LASF40:
	.ascii	"_on_exit_args\000"
.LASF55:
	.ascii	"_cookie\000"
.LASF88:
	.ascii	"__sglue\000"
.LASF9:
	.ascii	"long int\000"
.LASF52:
	.ascii	"_flags\000"
.LASF44:
	.ascii	"_is_cxa\000"
.LASF70:
	.ascii	"_stdin\000"
.LASF62:
	.ascii	"_blksize\000"
.LASF126:
	.ascii	"uint16_t\000"
.LASF84:
	.ascii	"_cvtbuf\000"
.LASF63:
	.ascii	"_offset\000"
.LASF113:
	.ascii	"_mbsrtowcs_state\000"
.LASF128:
	.ascii	"scb_cpacr\000"
.LASF111:
	.ascii	"_mbrlen_state\000"
.LASF41:
	.ascii	"_fnargs\000"
.LASF47:
	.ascii	"_fns\000"
.LASF10:
	.ascii	"__uint32_t\000"
.LASF27:
	.ascii	"_sign\000"
.LASF22:
	.ascii	"_flock_t\000"
.LASF72:
	.ascii	"_stderr\000"
.LASF29:
	.ascii	"_Bigint\000"
.LASF102:
	.ascii	"_gamma_signgam\000"
.LASF135:
	.ascii	"_sheap\000"
.LASF56:
	.ascii	"_read\000"
.LASF80:
	.ascii	"_result_k\000"
.LASF30:
	.ascii	"__tm\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF18:
	.ascii	"__wchb\000"
.LASF71:
	.ascii	"_stdout\000"
.LASF83:
	.ascii	"_cvtlen\000"
.LASF11:
	.ascii	"long unsigned int\000"
.LASF53:
	.ascii	"_file\000"
.LASF92:
	.ascii	"_niobs\000"
.LASF8:
	.ascii	"short unsigned int\000"
.LASF86:
	.ascii	"_atexit0\000"
.LASF109:
	.ascii	"_signal_buf\000"
.LASF100:
	.ascii	"_asctime_buf\000"
.LASF79:
	.ascii	"_result\000"
.LASF17:
	.ascii	"__wch\000"
.LASF13:
	.ascii	"_LOCK_T\000"
.LASF137:
	.ascii	"main.c\000"
.LASF16:
	.ascii	"wint_t\000"
.LASF65:
	.ascii	"_lock\000"
.LASF67:
	.ascii	"_flags2\000"
.LASF121:
	.ascii	"__locale_t\000"
.LASF57:
	.ascii	"_write\000"
.LASF36:
	.ascii	"__tm_year\000"
.LASF2:
	.ascii	"long double\000"
.LASF117:
	.ascii	"_nextf\000"
.LASF140:
	.ascii	"start_of_heap_get\000"
.LASF35:
	.ascii	"__tm_mon\000"
.LASF45:
	.ascii	"_atexit\000"
.LASF124:
	.ascii	"suboptarg\000"
.LASF77:
	.ascii	"__sdidinit\000"
.LASF14:
	.ascii	"_off_t\000"
.LASF82:
	.ascii	"_freelist\000"
.LASF107:
	.ascii	"_wctomb_state\000"
.LASF105:
	.ascii	"_mblen_state\000"
.LASF132:
	.ascii	"dynamic_arr_1\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF134:
	.ascii	"dynamic_arr_3\000"
.LASF85:
	.ascii	"_new\000"
.LASF116:
	.ascii	"_h_errno\000"
.LASF5:
	.ascii	"short int\000"
.LASF38:
	.ascii	"__tm_yday\000"
.LASF48:
	.ascii	"__sbuf\000"
.LASF93:
	.ascii	"_iobs\000"
.LASF90:
	.ascii	"__FILE\000"
.LASF21:
	.ascii	"_mbstate_t\000"
.LASF51:
	.ascii	"__sFILE\000"
.LASF66:
	.ascii	"_mbstate\000"
.LASF103:
	.ascii	"_rand_next\000"
.LASF138:
	.ascii	"/home/lbogdanov/git_projects/lab_upr_src_code/lab_u"
	.ascii	"pr_4_gcc/04_10/\000"
.LASF73:
	.ascii	"_inc\000"
.LASF46:
	.ascii	"_ind\000"
.LASF76:
	.ascii	"_locale\000"
.LASF78:
	.ascii	"__cleanup\000"
.LASF75:
	.ascii	"_unspecified_locale_info\000"
.LASF26:
	.ascii	"_maxwds\000"
.LASF68:
	.ascii	"_reent\000"
.LASF95:
	.ascii	"_seed\000"
.LASF19:
	.ascii	"__count\000"
.LASF120:
	.ascii	"__lock\000"
.LASF20:
	.ascii	"__value\000"
.LASF58:
	.ascii	"_seek\000"
.LASF122:
	.ascii	"_impure_ptr\000"
.LASF15:
	.ascii	"_fpos_t\000"
.LASF69:
	.ascii	"_errno\000"
.LASF23:
	.ascii	"char\000"
.LASF32:
	.ascii	"__tm_min\000"
.LASF7:
	.ascii	"__uint16_t\000"
.LASF125:
	.ascii	"uint8_t\000"
.LASF96:
	.ascii	"_mult\000"
.LASF25:
	.ascii	"_next\000"
.LASF99:
	.ascii	"_strtok_last\000"
.LASF43:
	.ascii	"_fntypes\000"
.LASF129:
	.ascii	"static_arr_1\000"
.LASF130:
	.ascii	"static_arr_2\000"
.LASF131:
	.ascii	"static_arr_3\000"
.LASF97:
	.ascii	"_add\000"
.LASF24:
	.ascii	"__ULong\000"
.LASF110:
	.ascii	"_getdate_err\000"
.LASF123:
	.ascii	"_global_impure_ptr\000"
.LASF127:
	.ascii	"uint32_t\000"
.LASF98:
	.ascii	"_unused_rand\000"
.LASF28:
	.ascii	"_wds\000"
.LASF37:
	.ascii	"__tm_wday\000"
.LASF91:
	.ascii	"_glue\000"
.LASF118:
	.ascii	"_nmalloc\000"
.LASF108:
	.ascii	"_l64a_buf\000"
.LASF87:
	.ascii	"_sig_func\000"
.LASF61:
	.ascii	"_nbuf\000"
.LASF119:
	.ascii	"_unused\000"
.LASF39:
	.ascii	"__tm_isdst\000"
.LASF101:
	.ascii	"_localtime_buf\000"
.LASF59:
	.ascii	"_close\000"
.LASF104:
	.ascii	"_r48\000"
.LASF106:
	.ascii	"_mbtowc_state\000"
.LASF81:
	.ascii	"_p5s\000"
.LASF139:
	.ascii	"main\000"
.LASF34:
	.ascii	"__tm_mday\000"
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2018-q4-major) 8.2.1 20181213 (release) [gcc-8-branch revision 267074]"
