	.text
$Ltext0:
	.section	.text.start_of_heap_get,"ax",@progbits
	.align	2
	.globl	start_of_heap_get
$LFB16:
$LM1:
	.ent	start_of_heap_get
	.type	start_of_heap_get, @function
start_of_heap_get:
	.frame	r19,8,r15		# vars= 0, regs= 1, args= 0
	.mask	0x00080000
	addik	r1,r1,-8
$LCFI0:
	swi	r19,r1,4
$LCFI1:
	addk	r19,r1,r0
$LCFI2:
$LM2:
	addik	r3,r0,_heap_start
$LM3:
	addk	r1,r19,r0
	lwi	r19,r1,4
	addik	r1,r1,8
	rtsd	r15,8 
	nop		# Unfilled delay slot

	.end	start_of_heap_get
$LFE16:
$Lfe1:
	.size	start_of_heap_get,$Lfe1-start_of_heap_get
	.rodata
	.align	2
$LC2:
	.ascii "The start of the HEAP segment: 0x%08X\12\15\0"
	.align	2
$LC3:
	.ascii "\12 dynamic_arr_1[ ] = {\12\15\0"
	.align	2
$LC4:
	.ascii "0x%08X\12\15\0"
	.align	2
$LC5:
	.ascii "}\12\15\0"
	.align	2
$LC6:
	.ascii "\12 dynamic_arr_2[ ] = {\12\15\0"
	.align	2
$LC7:
	.ascii "0x%04X\12\15\0"
	.align	2
$LC8:
	.ascii "\12 dynamic_arr_3[ ] = {\12\15\0"
	.align	2
$LC9:
	.ascii "0x%02X\12\15\0"
	.align	2
$LC0:
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
$LC1:
	.hword	-17734
	.hword	-8482
	.hword	-12594
	.hword	-258
	.section	.text.main,"ax",@progbits
	.align	2
	.globl	main
$LFB17:
$LM4:
	.ent	main
	.type	main, @function
main:
	.frame	r19,100,r15		# vars= 68, regs= 1, args= 24
	.mask	0x00088000
	addik	r1,r1,-100
$LCFI3:
	swi	r15,r1,0
	swi	r19,r1,96
$LCFI4:
	addk	r19,r1,r0
$LCFI5:
$LM5:
	lwi	r12,r0,$LC0
	lwi	r11,r0,$LC0+4
	lwi	r10,r0,$LC0+8
	lwi	r9,r0,$LC0+12
	lwi	r8,r0,$LC0+16
	lwi	r7,r0,$LC0+20
	lwi	r6,r0,$LC0+24
	lwi	r5,r0,$LC0+28
	lwi	r4,r0,$LC0+32
	lwi	r3,r0,$LC0+36
	swi	r12,r19,44
	swi	r11,r19,48
	swi	r10,r19,52
	swi	r9,r19,56
	swi	r8,r19,60
	swi	r7,r19,64
	swi	r6,r19,68
	swi	r5,r19,72
	swi	r4,r19,76
	swi	r3,r19,80
$LM6:
	lwi	r4,r0,$LC1
	lwi	r3,r0,$LC1+4
	swi	r4,r19,84
	swi	r3,r19,88
$LM7:
	addik	r3,r0,-272716322
	swi	r3,r19,92
$LM8:
	brlid	r15,led_init
	nop		# Unfilled delay slot

$LM9:
	brlid	r15,uart_init
	nop		# Unfilled delay slot

$LM10:
	brlid	r15,start_of_heap_get
	nop		# Unfilled delay slot

	addk	r6,r3,r0
	addik	r5,r0,$LC2
	brlid	r15,printf_
	nop		# Unfilled delay slot

$LM11:
	addik	r5,r0,40	# 0x28
	brlid	r15,malloc
	nop		# Unfilled delay slot

	swi	r3,r19,32
$LM12:
	swi	r0,r19,28
$LM13:
	bri	$L4
$L5:
$LM14:
	lwi	r3,r19,28
	bslli	r3,r3,2
	lwi	r4,r19,32
	addk	r3,r4,r3
$LM15:
	lwi	r4,r19,28
	bslli	r4,r4,2
	addik	r5,r19,28
	addk	r4,r5,r4
	addik	r4,r4,16
	lwi	r4,r4,0
$LM16:
	swi	r4,r3,0
$LM17:
	lwi	r3,r19,28
	addik	r3,r3,1
	swi	r3,r19,28
$L4:
$LM18:
	lwi	r4,r19,28
	addik	r3,r0,9	# 0x9
	cmp	r18,r4,r3
	bgei	r18,$L5
$LM19:
	addik	r5,r0,8	# 0x8
	brlid	r15,malloc
	nop		# Unfilled delay slot

	swi	r3,r19,36
$LM20:
	swi	r0,r19,28
$LM21:
	bri	$L6
$L7:
$LM22:
	lwi	r3,r19,28
	addk	r3,r3,r3
	lwi	r4,r19,36
	addk	r3,r4,r3
$LM23:
	lwi	r4,r19,28
	addk	r4,r4,r4
	addik	r5,r19,28
	addk	r4,r5,r4
	addik	r4,r4,56
	lhui	r4,r4,0
$LM24:
	shi	r4,r3,0
$LM25:
	lwi	r3,r19,28
	addik	r3,r3,1
	swi	r3,r19,28
$L6:
$LM26:
	lwi	r4,r19,28
	addik	r3,r0,3	# 0x3
	cmp	r18,r4,r3
	bgei	r18,$L7
$LM27:
	addik	r5,r0,$LC3
	brlid	r15,printf_
	nop		# Unfilled delay slot

$LM28:
	swi	r0,r19,28
$LM29:
	bri	$L8
$L9:
$LM30:
	lwi	r3,r19,28
	bslli	r3,r3,2
	lwi	r4,r19,32
	addk	r3,r4,r3
$LM31:
	lwi	r3,r3,0
	addk	r6,r3,r0
	addik	r5,r0,$LC4
	brlid	r15,printf_
	nop		# Unfilled delay slot

$LM32:
	lwi	r3,r19,28
	addik	r3,r3,1
	swi	r3,r19,28
$L8:
$LM33:
	lwi	r4,r19,28
	addik	r3,r0,9	# 0x9
	cmp	r18,r4,r3
	bgei	r18,$L9
$LM34:
	addik	r5,r0,$LC5
	brlid	r15,printf_
	nop		# Unfilled delay slot

$LM35:
	addik	r5,r0,$LC6
	brlid	r15,printf_
	nop		# Unfilled delay slot

$LM36:
	swi	r0,r19,28
$LM37:
	bri	$L10
$L11:
$LM38:
	lwi	r3,r19,28
	addk	r3,r3,r3
	lwi	r4,r19,36
	addk	r3,r4,r3
	lhui	r3,r3,0
$LM39:
	andi	r3,r3,0xffff
	addk	r6,r3,r0
	addik	r5,r0,$LC7
	brlid	r15,printf_
	nop		# Unfilled delay slot

$LM40:
	lwi	r3,r19,28
	addik	r3,r3,1
	swi	r3,r19,28
$L10:
$LM41:
	lwi	r4,r19,28
	addik	r3,r0,3	# 0x3
	cmp	r18,r4,r3
	bgei	r18,$L11
$LM42:
	addik	r5,r0,$LC5
	brlid	r15,printf_
	nop		# Unfilled delay slot

$LM43:
	lwi	r5,r19,32
	brlid	r15,free
	nop		# Unfilled delay slot

$LM44:
	addik	r5,r0,8	# 0x8
	brlid	r15,malloc
	nop		# Unfilled delay slot

	swi	r3,r19,40
$LM45:
	swi	r0,r19,28
$LM46:
	bri	$L12
$L13:
$LM47:
	lwi	r3,r19,28
	lwi	r4,r19,40
	addk	r3,r4,r3
$LM48:
	addik	r5,r19,92
	lwi	r4,r19,28
	addk	r4,r5,r4
	lbui	r4,r4,0
$LM49:
	sbi	r4,r3,0
$LM50:
	lwi	r3,r19,28
	addik	r3,r3,1
	swi	r3,r19,28
$L12:
$LM51:
	lwi	r4,r19,28
	addik	r3,r0,3	# 0x3
	cmp	r18,r4,r3
	bgei	r18,$L13
$LM52:
	addik	r5,r0,$LC8
	brlid	r15,printf_
	nop		# Unfilled delay slot

$LM53:
	swi	r0,r19,28
$LM54:
	bri	$L14
$L15:
$LM55:
	lwi	r3,r19,28
	lwi	r4,r19,40
	addk	r3,r4,r3
	lbui	r3,r3,0
$LM56:
	andi	r3,r3,0x00ff
	addk	r6,r3,r0
	addik	r5,r0,$LC9
	brlid	r15,printf_
	nop		# Unfilled delay slot

$LM57:
	lwi	r3,r19,28
	addik	r3,r3,1
	swi	r3,r19,28
$L14:
$LM58:
	lwi	r4,r19,28
	addik	r3,r0,3	# 0x3
	cmp	r18,r4,r3
	bgei	r18,$L15
$LM59:
	addik	r5,r0,$LC5
	brlid	r15,printf_
	nop		# Unfilled delay slot

$LM60:
	lwi	r5,r19,36
	brlid	r15,free
	nop		# Unfilled delay slot

$LM61:
	lwi	r5,r19,40
	brlid	r15,free
	nop		# Unfilled delay slot

$L16:
$LM62:
	brlid	r15,led_set
	nop		# Unfilled delay slot

$LM63:
	addik	r5,r0,1000000
	brlid	r15,usleep
	nop		# Unfilled delay slot

$LM64:
	brlid	r15,led_clear
	nop		# Unfilled delay slot

$LM65:
	addik	r5,r0,1000000
	brlid	r15,usleep
	nop		# Unfilled delay slot

$LM66:
	bri	$L16
	.end	main
$LFE17:
$Lfe2:
	.size	main,$Lfe2-main
	.section	.debug_frame,"",@progbits
$Lframe0:
	.4byte	$LECIE0-$LSCIE0
$LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii "\0"
	.uleb128 0x1
	.sleb128 -1
	.uleb128 0xf
	.byte	0xc
	.uleb128 0x1
	.uleb128 0
	.align	2
$LECIE0:
$LSFDE0:
	.4byte	$LEFDE0-$LASFDE0
$LASFDE0:
	.4byte	$Lframe0
	.4byte	$LFB16
	.4byte	$LFE16-$LFB16
	.byte	0x4
	.4byte	$LCFI0-$LFB16
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	$LCFI1-$LCFI0
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI2-$LCFI1
	.byte	0xd
	.uleb128 0x13
	.align	2
$LEFDE0:
$LSFDE2:
	.4byte	$LEFDE2-$LASFDE2
$LASFDE2:
	.4byte	$Lframe0
	.4byte	$LFB17
	.4byte	$LFE17-$LFB17
	.byte	0x4
	.4byte	$LCFI3-$LFB17
	.byte	0xe
	.uleb128 0x64
	.byte	0x4
	.4byte	$LCFI4-$LCFI3
	.byte	0x8f
	.uleb128 0x64
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI5-$LCFI4
	.byte	0xd
	.uleb128 0x13
	.align	2
$LEFDE2:
	.text
$Letext0:
	.section	.debug_info,"",@progbits
$Ldebug_info0:
	.4byte	0x24c
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	$Ldebug_abbrev0
	.uleb128 0xc
	.4byte	$LASF35
	.byte	0x1d
	.4byte	$LASF0
	.4byte	$LASF1
	.4byte	$LLRL0
	.4byte	0
	.4byte	$Ldebug_line0
	.uleb128 0x2
	.4byte	$LASF6
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.4byte	0x32
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	$LASF2
	.uleb128 0xd
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	$LASF3
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	$LASF4
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	$LASF5
	.uleb128 0x2
	.4byte	$LASF7
	.byte	0x3
	.byte	0x2b
	.byte	0x18
	.4byte	0x61
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	$LASF8
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	$LASF9
	.uleb128 0x2
	.4byte	$LASF10
	.byte	0x3
	.byte	0x39
	.byte	0x19
	.4byte	0x7b
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	$LASF11
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.4byte	$LASF12
	.uleb128 0x2
	.4byte	$LASF13
	.byte	0x3
	.byte	0x4f
	.byte	0x19
	.4byte	0x95
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	$LASF14
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	$LASF15
	.uleb128 0xe
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	$LASF16
	.uleb128 0x3
	.4byte	0xa5
	.uleb128 0x5
	.4byte	0xac
	.uleb128 0x2
	.4byte	$LASF17
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.4byte	0x55
	.uleb128 0x3
	.4byte	0xb6
	.uleb128 0x2
	.4byte	$LASF18
	.byte	0x4
	.byte	0x24
	.byte	0x14
	.4byte	0x6f
	.uleb128 0x3
	.4byte	0xc7
	.uleb128 0x2
	.4byte	$LASF19
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x89
	.uleb128 0x3
	.4byte	0xd8
	.uleb128 0x2
	.4byte	$LASF20
	.byte	0x5
	.byte	0x84
	.byte	0x17
	.4byte	0x95
	.uleb128 0x6
	.4byte	$LASF21
	.byte	0x6
	.byte	0x9
	.uleb128 0xa
	.4byte	$LASF23
	.byte	0x7
	.byte	0x5a
	.4byte	0x10d
	.uleb128 0x7
	.4byte	0xe9
	.byte	0
	.uleb128 0x6
	.4byte	$LASF22
	.byte	0x6
	.byte	0x8
	.uleb128 0xa
	.4byte	$LASF24
	.byte	0x8
	.byte	0x5e
	.4byte	0x125
	.uleb128 0x7
	.4byte	0xa3
	.byte	0
	.uleb128 0xb
	.4byte	$LASF25
	.byte	0x8
	.byte	0x6c
	.byte	0x7
	.4byte	0xa3
	.4byte	0x13b
	.uleb128 0x7
	.4byte	0x26
	.byte	0
	.uleb128 0xb
	.4byte	$LASF26
	.byte	0x9
	.byte	0x3d
	.byte	0x5
	.4byte	0x39
	.4byte	0x152
	.uleb128 0x7
	.4byte	0xb1
	.uleb128 0xf
	.byte	0
	.uleb128 0x6
	.4byte	$LASF27
	.byte	0xa
	.byte	0x3e
	.uleb128 0x6
	.4byte	$LASF28
	.byte	0x6
	.byte	0x7
	.uleb128 0x10
	.4byte	$LASF36
	.byte	0x1
	.byte	0xd
	.byte	0x5
	.4byte	0x39
	.4byte	$LFB17
	.4byte	$LFE17-$LFB17
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1de
	.uleb128 0x4
	.4byte	$LASF29
	.byte	0xe
	.byte	0x11
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.4byte	$LASF30
	.byte	0xf
	.byte	0x11
	.4byte	0x203
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x4
	.4byte	$LASF31
	.byte	0x10
	.byte	0x10
	.4byte	0x218
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x4
	.4byte	$LASF32
	.byte	0x11
	.byte	0xc
	.4byte	0x21d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x4
	.4byte	$LASF33
	.byte	0x12
	.byte	0xc
	.4byte	0x222
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x4
	.4byte	$LASF34
	.byte	0x13
	.byte	0xb
	.4byte	0x227
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x11
	.ascii "i\0"
	.byte	0x1
	.byte	0x14
	.byte	0x6
	.4byte	0x39
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x8
	.4byte	0xe4
	.4byte	0x1ee
	.uleb128 0x9
	.4byte	0x32
	.byte	0x9
	.byte	0
	.uleb128 0x3
	.4byte	0x1de
	.uleb128 0x8
	.4byte	0xd3
	.4byte	0x203
	.uleb128 0x9
	.4byte	0x32
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	0x1f3
	.uleb128 0x8
	.4byte	0xc2
	.4byte	0x218
	.uleb128 0x9
	.4byte	0x32
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	0x208
	.uleb128 0x5
	.4byte	0xd8
	.uleb128 0x5
	.4byte	0xc7
	.uleb128 0x5
	.4byte	0xb6
	.uleb128 0x12
	.4byte	$LASF37
	.byte	0x1
	.byte	0x8
	.byte	0xf
	.4byte	0x95
	.4byte	$LFB16
	.4byte	$LFE16-$LFB16
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	$LASF38
	.byte	0x1
	.byte	0x9
	.byte	0x12
	.4byte	0xd8
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
$Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x2
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
	.uleb128 0x3
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	$Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	$LFB16
	.4byte	$LFE16-$LFB16
	.4byte	$LFB17
	.4byte	$LFE17-$LFB17
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
$Ldebug_ranges0:
	.4byte	$Ldebug_ranges3-$Ldebug_ranges2
$Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
$LLRL0:
	.byte	0x7
	.4byte	$LFB16
	.uleb128 $LFE16-$LFB16
	.byte	0x7
	.4byte	$LFB17
	.uleb128 $LFE17-$LFB17
	.byte	0
$Ldebug_ranges3:
	.section	.debug_line,"",@progbits
$Ldebug_line0:
	.4byte	$LELT0-$LSLT0
$LSLT0:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	$LELTP0-$LASLTP0
$LASLTP0:
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0xf6
	.byte	0xf2
	.byte	0xd
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x1f
	.uleb128 0x9
	.4byte	$LASF1
	.4byte	$LASF39
	.4byte	$LASF40
	.4byte	$LASF41
	.4byte	$LASF42
	.4byte	$LASF43
	.4byte	$LASF44
	.4byte	$LASF45
	.4byte	$LASF46
	.byte	0x2
	.uleb128 0x1
	.uleb128 0x1f
	.uleb128 0x2
	.uleb128 0xb
	.uleb128 0xb
	.4byte	$LASF0
	.byte	0
	.4byte	$LASF0
	.byte	0
	.4byte	$LASF47
	.byte	0x6
	.4byte	$LASF48
	.byte	0x3
	.4byte	$LASF49
	.byte	0x4
	.4byte	$LASF50
	.byte	0x7
	.4byte	$LASF51
	.byte	0x2
	.4byte	$LASF52
	.byte	0x7
	.4byte	$LASF53
	.byte	0x5
	.4byte	$LASF54
	.byte	0x8
	.4byte	$LASF55
	.byte	0x1
$LELTP0:
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM1
	.byte	0x1e
	.byte	0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM2
	.byte	0x19
	.byte	0x5
	.uleb128 0x9
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM3
	.byte	0x18
	.byte	0x5
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LFE16
	.byte	0
	.uleb128 0x1
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM4
	.byte	0x23
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM5
	.byte	0x18
	.byte	0x5
	.uleb128 0x11
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM6
	.byte	0x18
	.byte	0x5
	.uleb128 0x11
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM7
	.byte	0x18
	.byte	0x5
	.uleb128 0x10
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM8
	.byte	0x1d
	.byte	0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM9
	.byte	0x18
	.byte	0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM10
	.byte	0x19
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM11
	.byte	0x19
	.byte	0x5
	.uleb128 0x1e
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM12
	.byte	0x19
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM13
	.byte	0x1
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM14
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x18
	.byte	0x5
	.uleb128 0x10
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM15
	.byte	0x1
	.byte	0x5
	.uleb128 0x22
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM16
	.byte	0x1
	.byte	0x5
	.uleb128 0x14
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM17
	.byte	0x16
	.byte	0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM18
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM19
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x1b
	.byte	0x5
	.uleb128 0x1e
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM20
	.byte	0x19
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM21
	.byte	0x1
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM22
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x18
	.byte	0x5
	.uleb128 0x10
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM23
	.byte	0x1
	.byte	0x5
	.uleb128 0x22
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM24
	.byte	0x1
	.byte	0x5
	.uleb128 0x14
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM25
	.byte	0x16
	.byte	0x5
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM26
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM27
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x1b
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM28
	.byte	0x18
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM29
	.byte	0x1
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM30
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x18
	.byte	0x5
	.uleb128 0x25
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM31
	.byte	0x1
	.byte	0x5
	.uleb128 0x3
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM32
	.byte	0x16
	.byte	0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM33
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM34
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x1a
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM35
	.byte	0x19
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM36
	.byte	0x18
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM37
	.byte	0x1
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM38
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x18
	.byte	0x5
	.uleb128 0x25
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM39
	.byte	0x1
	.byte	0x5
	.uleb128 0x3
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM40
	.byte	0x16
	.byte	0x5
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM41
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM42
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x1a
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM43
	.byte	0x19
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM44
	.byte	0x19
	.byte	0x5
	.uleb128 0x1d
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM45
	.byte	0x19
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM46
	.byte	0x1
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM47
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x18
	.byte	0x5
	.uleb128 0x10
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM48
	.byte	0x1
	.byte	0x5
	.uleb128 0x22
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM49
	.byte	0x1
	.byte	0x5
	.uleb128 0x14
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM50
	.byte	0x16
	.byte	0x5
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM51
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM52
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x1b
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM53
	.byte	0x18
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM54
	.byte	0x1
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM55
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x18
	.byte	0x5
	.uleb128 0x25
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM56
	.byte	0x1
	.byte	0x5
	.uleb128 0x3
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM57
	.byte	0x16
	.byte	0x5
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM58
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM59
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x1a
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM60
	.byte	0x19
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM61
	.byte	0x18
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM62
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1a
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM63
	.byte	0x18
	.byte	0x5
	.uleb128 0x9
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM64
	.byte	0x18
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM65
	.byte	0x18
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM66
	.byte	0x14
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LFE17
	.byte	0
	.uleb128 0x1
	.byte	0x1
$LELT0:
	.section	.debug_str,"MS",@progbits,1
$LASF7:
	.ascii "__uint8_t\0"
$LASF6:
	.ascii "size_t\0"
$LASF17:
	.ascii "uint8_t\0"
$LASF28:
	.ascii "led_init\0"
$LASF23:
	.ascii "usleep\0"
$LASF27:
	.ascii "uart_init\0"
$LASF22:
	.ascii "led_set\0"
$LASF8:
	.ascii "unsigned char\0"
$LASF31:
	.ascii "static_arr_3\0"
$LASF14:
	.ascii "long unsigned int\0"
$LASF11:
	.ascii "short unsigned int\0"
$LASF10:
	.ascii "__uint16_t\0"
$LASF21:
	.ascii "led_clear\0"
$LASF13:
	.ascii "__uint32_t\0"
$LASF36:
	.ascii "main\0"
$LASF37:
	.ascii "start_of_heap_get\0"
$LASF2:
	.ascii "unsigned int\0"
$LASF15:
	.ascii "long long unsigned int\0"
$LASF38:
	.ascii "_heap_start\0"
$LASF32:
	.ascii "dynamic_arr_1\0"
$LASF33:
	.ascii "dynamic_arr_2\0"
$LASF34:
	.ascii "dynamic_arr_3\0"
$LASF24:
	.ascii "free\0"
$LASF3:
	.ascii "long long int\0"
$LASF35:
	.ascii "GNU C17 11.2.0 -mhard-float -mxl-float-convert -mxl-float-sqrt -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul -g -O0 -ffunction-sections\0"
$LASF16:
	.ascii "char\0"
$LASF26:
	.ascii "printf_\0"
$LASF9:
	.ascii "short int\0"
$LASF18:
	.ascii "uint16_t\0"
$LASF20:
	.ascii "ULONG\0"
$LASF19:
	.ascii "uint32_t\0"
$LASF12:
	.ascii "long int\0"
$LASF4:
	.ascii "long double\0"
$LASF29:
	.ascii "static_arr_1\0"
$LASF5:
	.ascii "signed char\0"
$LASF30:
	.ascii "static_arr_2\0"
$LASF25:
	.ascii "malloc\0"
	.section	.debug_line_str,"MS",@progbits,1
$LASF49:
	.ascii "_stdint.h\0"
$LASF43:
	.ascii "/home/lbogdanov/programs/xilinx/Vitis/2022.2/gnu/microblaze/lin/microblazeeb-xilinx-elf/usr/include\0"
$LASF39:
	.ascii "uart\0"
$LASF46:
	.ascii "print\0"
$LASF44:
	.ascii "/home/lbogdanov/programs/xilinx/Vitis/2022.2/gnu/microblaze/lin/x86_64-oesdk-linux/usr/lib/microblaze-xilinx-elf/gcc/microblaze-xilinx-elf/11.2.0/include\0"
$LASF51:
	.ascii "led.h\0"
$LASF50:
	.ascii "xil_types.h\0"
$LASF54:
	.ascii "print.h\0"
$LASF1:
	.ascii "/home/lbogdanov/workspaces/xilinx_workspace/21_6\0"
$LASF0:
	.ascii "main.c\0"
$LASF45:
	.ascii "include\0"
$LASF42:
	.ascii "/home/lbogdanov/programs/xilinx/Vitis/2022.2/gnu/microblaze/lin/microblazeeb-xilinx-elf/usr/include/sys\0"
$LASF52:
	.ascii "sleep.h\0"
$LASF40:
	.ascii "led\0"
$LASF41:
	.ascii "/home/lbogdanov/programs/xilinx/Vitis/2022.2/gnu/microblaze/lin/microblazeeb-xilinx-elf/usr/include/machine\0"
$LASF55:
	.ascii "uart.h\0"
$LASF48:
	.ascii "_default_types.h\0"
$LASF53:
	.ascii "stdlib.h\0"
$LASF47:
	.ascii "stddef.h\0"
