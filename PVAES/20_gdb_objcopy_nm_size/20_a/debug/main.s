	.text
$Ltext0:
	.align	2
	.globl	my_func_3
$LFB16:
$LM1:
	.ent	my_func_3
	.type	my_func_3, @function
my_func_3:
	.frame	r19,20,r15		# vars= 12, regs= 1, args= 0
	.mask	0x00080000
	addik	r1,r1,-20
$LCFI0:
	swi	r19,r1,16
$LCFI1:
	addk	r19,r1,r0
$LCFI2:
$LM2:
	addik	r3,r0,3	# 0x3
	swi	r3,r19,4
$LM3:
	addik	r3,r0,30	# 0x1e
	swi	r3,r19,8
$LM4:
	lwi	r4,r19,4
	lwi	r3,r19,8
	addk	r3,r4,r3
$LM5:
	swi	r3,r19,12
$LM6:
	nop
	addk	r1,r19,r0
	lwi	r19,r1,16
	addik	r1,r1,20
	rtsd	r15,8 
	nop		# Unfilled delay slot

	.end	my_func_3
$LFE16:
$Lfe1:
	.size	my_func_3,$Lfe1-my_func_3
	.align	2
	.globl	my_func_2
$LFB17:
$LM7:
	.ent	my_func_2
	.type	my_func_2, @function
my_func_2:
	.frame	r19,20,r15		# vars= 12, regs= 1, args= 0
	.mask	0x00088000
	addik	r1,r1,-20
$LCFI3:
	swi	r15,r1,0
	swi	r19,r1,16
$LCFI4:
	addk	r19,r1,r0
$LCFI5:
$LM8:
	addik	r3,r0,2	# 0x2
	swi	r3,r19,4
$LM9:
	addik	r3,r0,20	# 0x14
	swi	r3,r19,8
$LM10:
	lwi	r4,r19,4
	lwi	r3,r19,8
	addk	r3,r4,r3
$LM11:
	swi	r3,r19,12
$LM12:
	brlid	r15,my_func_3
	nop		# Unfilled delay slot

$LM13:
	nop
	lwi	r15,r1,0
	addk	r1,r19,r0
	lwi	r19,r1,16
	addik	r1,r1,20
	rtsd	r15,8 
	nop		# Unfilled delay slot

	.end	my_func_2
$LFE17:
$Lfe2:
	.size	my_func_2,$Lfe2-my_func_2
	.align	2
	.globl	my_func_1
$LFB18:
$LM14:
	.ent	my_func_1
	.type	my_func_1, @function
my_func_1:
	.frame	r19,20,r15		# vars= 12, regs= 1, args= 0
	.mask	0x00088000
	addik	r1,r1,-20
$LCFI6:
	swi	r15,r1,0
	swi	r19,r1,16
$LCFI7:
	addk	r19,r1,r0
$LCFI8:
$LM15:
	addik	r3,r0,1	# 0x1
	swi	r3,r19,4
$LM16:
	addik	r3,r0,10	# 0xa
	swi	r3,r19,8
$LM17:
	lwi	r4,r19,4
	lwi	r3,r19,8
	addk	r3,r4,r3
$LM18:
	swi	r3,r19,12
$LM19:
	brlid	r15,my_func_2
	nop		# Unfilled delay slot

$LM20:
	nop
	lwi	r15,r1,0
	addk	r1,r19,r0
	lwi	r19,r1,16
	addik	r1,r1,20
	rtsd	r15,8 
	nop		# Unfilled delay slot

	.end	my_func_1
$LFE18:
$Lfe3:
	.size	my_func_1,$Lfe3-my_func_1
	.rodata
	.align	2
$LC0:
	.ascii "The result is --> %12.6f\12\0"
	.text
	.align	2
	.globl	main
$LFB19:
$LM21:
	.ent	main
	.type	main, @function
main:
	.frame	r19,56,r15		# vars= 24, regs= 1, args= 24
	.mask	0x00088000
	addik	r1,r1,-56
$LCFI9:
	swi	r15,r1,0
	swi	r19,r1,52
$LCFI10:
	addk	r19,r1,r0
$LCFI11:
$LM22:
	addik	r3,r0,0x40801481
	swi	r3,r19,28
$LM23:
	addik	r3,r0,0x40877879
	swi	r3,r19,32
$LM24:
	addik	r3,r0,0x40994216
	swi	r3,r19,36
$LM25:
	addik	r3,r0,0x40871041
	swi	r3,r19,40
$LM26:
	brlid	r15,led_init
	nop		# Unfilled delay slot

$LM27:
	brlid	r15,uart_init
	nop		# Unfilled delay slot

$LM28:
	lwi	r8,r19,40
	lwi	r7,r19,36
	lwi	r6,r19,32
	lwi	r5,r19,28
	brlid	r15,asm_rms
	nop		# Unfilled delay slot

	swi	r3,r19,44
$LM29:
	lwi	r5,r19,44
	brlid	r15,__extendsfdf2
	nop		# Unfilled delay slot

	addk	r5,r4,r0
	addk	r4,r3,r0
	addk	r6,r4,r0
	addk	r7,r5,r0
	addik	r5,r0,$LC0
	brlid	r15,printf_
	nop		# Unfilled delay slot

$LM30:
	brlid	r15,my_func_1
	nop		# Unfilled delay slot

$L5:
$LM31:
	brlid	r15,led_set
	nop		# Unfilled delay slot

$LM32:
	addik	r5,r0,1000000
	brlid	r15,usleep
	nop		# Unfilled delay slot

$LM33:
	brlid	r15,led_clear
	nop		# Unfilled delay slot

$LM34:
	addik	r5,r0,1000000
	brlid	r15,usleep
	nop		# Unfilled delay slot

$LM35:
	bri	$L5
	.end	main
$LFE19:
$Lfe4:
	.size	main,$Lfe4-main
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
	.uleb128 0x14
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
	.uleb128 0x14
	.byte	0x4
	.4byte	$LCFI4-$LCFI3
	.byte	0x8f
	.uleb128 0x14
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI5-$LCFI4
	.byte	0xd
	.uleb128 0x13
	.align	2
$LEFDE2:
$LSFDE4:
	.4byte	$LEFDE4-$LASFDE4
$LASFDE4:
	.4byte	$Lframe0
	.4byte	$LFB18
	.4byte	$LFE18-$LFB18
	.byte	0x4
	.4byte	$LCFI6-$LFB18
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.4byte	$LCFI7-$LCFI6
	.byte	0x8f
	.uleb128 0x14
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI8-$LCFI7
	.byte	0xd
	.uleb128 0x13
	.align	2
$LEFDE4:
$LSFDE6:
	.4byte	$LEFDE6-$LASFDE6
$LASFDE6:
	.4byte	$Lframe0
	.4byte	$LFB19
	.4byte	$LFE19-$LFB19
	.byte	0x4
	.4byte	$LCFI9-$LFB19
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.4byte	$LCFI10-$LCFI9
	.byte	0x8f
	.uleb128 0x38
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI11-$LCFI10
	.byte	0xd
	.uleb128 0x13
	.align	2
$LEFDE6:
	.text
$Letext0:
	.section	.debug_info,"",@progbits
$Ldebug_info0:
	.4byte	0x215
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	$Ldebug_abbrev0
	.uleb128 0x8
	.4byte	$LASF27
	.byte	0x1d
	.4byte	$LASF0
	.4byte	$LASF1
	.4byte	$Ltext0
	.4byte	$Letext0-$Ltext0
	.4byte	$Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	$LASF2
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	$LASF3
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	$LASF4
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	$LASF5
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.4byte	$LASF6
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	$LASF7
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	$LASF8
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	$LASF9
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0xa
	.4byte	0x5e
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	$LASF10
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	$LASF11
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	$LASF12
	.uleb128 0xb
	.4byte	0x78
	.uleb128 0xc
	.4byte	$LASF28
	.byte	0x5
	.byte	0x84
	.byte	0x17
	.4byte	0x49
	.uleb128 0xd
	.byte	0x4
	.4byte	0x7f
	.uleb128 0x5
	.4byte	$LASF13
	.byte	0x2
	.byte	0x9
	.uleb128 0xe
	.4byte	$LASF29
	.byte	0x6
	.byte	0x5a
	.byte	0x6
	.4byte	0xaf
	.uleb128 0x3
	.4byte	0x84
	.byte	0
	.uleb128 0x5
	.4byte	$LASF14
	.byte	0x2
	.byte	0x8
	.uleb128 0x6
	.4byte	$LASF15
	.byte	0x3
	.byte	0x3d
	.byte	0x5
	.4byte	0x5e
	.4byte	0xcd
	.uleb128 0x3
	.4byte	0x90
	.uleb128 0xf
	.byte	0
	.uleb128 0x6
	.4byte	$LASF16
	.byte	0x1
	.byte	0x7
	.byte	0xe
	.4byte	0xf2
	.4byte	0xf2
	.uleb128 0x3
	.4byte	0xf2
	.uleb128 0x3
	.4byte	0xf2
	.uleb128 0x3
	.4byte	0xf2
	.uleb128 0x3
	.4byte	0xf2
	.byte	0
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.4byte	$LASF17
	.uleb128 0x5
	.4byte	$LASF18
	.byte	0x4
	.byte	0x3e
	.uleb128 0x5
	.4byte	$LASF19
	.byte	0x2
	.byte	0x7
	.uleb128 0x10
	.4byte	$LASF30
	.byte	0x1
	.byte	0x1f
	.byte	0x5
	.4byte	0x5e
	.4byte	$LFB19
	.4byte	$LFE19-$LFB19
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x16f
	.uleb128 0x4
	.4byte	$LASF20
	.byte	0x20
	.4byte	0xf2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x4
	.4byte	$LASF21
	.byte	0x21
	.4byte	0xf2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.4byte	$LASF22
	.byte	0x22
	.4byte	0xf2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x4
	.4byte	$LASF23
	.byte	0x23
	.4byte	0xf2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x4
	.4byte	$LASF24
	.byte	0x24
	.4byte	0xf2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2
	.ascii "i\0"
	.byte	0x25
	.byte	0xf
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x7
	.4byte	$LASF25
	.byte	0x17
	.4byte	$LFB18
	.4byte	$LFE18-$LFB18
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a8
	.uleb128 0x2
	.ascii "a\0"
	.byte	0x18
	.byte	0xf
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x2
	.ascii "b\0"
	.byte	0x18
	.byte	0x16
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2
	.ascii "c\0"
	.byte	0x18
	.byte	0x1e
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x7
	.4byte	$LASF26
	.byte	0xf
	.4byte	$LFB17
	.4byte	$LFE17-$LFB17
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e1
	.uleb128 0x2
	.ascii "a\0"
	.byte	0x10
	.byte	0xf
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x2
	.ascii "b\0"
	.byte	0x10
	.byte	0x16
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2
	.ascii "c\0"
	.byte	0x10
	.byte	0x1e
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x11
	.4byte	$LASF31
	.byte	0x1
	.byte	0x9
	.byte	0x6
	.4byte	$LFB16
	.4byte	$LFE16-$LFB16
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.ascii "a\0"
	.byte	0xa
	.byte	0xf
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x2
	.ascii "b\0"
	.byte	0xa
	.byte	0x16
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2
	.ascii "c\0"
	.byte	0xa
	.byte	0x1e
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
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
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x3
	.uleb128 0x5
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
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0x8
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	$Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	$Ltext0
	.4byte	$Letext0-$Ltext0
	.4byte	0
	.4byte	0
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
	.uleb128 0x5
	.4byte	$LASF1
	.4byte	$LASF32
	.4byte	$LASF33
	.4byte	$LASF34
	.4byte	$LASF35
	.byte	0x2
	.uleb128 0x1
	.uleb128 0x1f
	.uleb128 0x2
	.uleb128 0xb
	.uleb128 0x7
	.4byte	$LASF0
	.byte	0
	.4byte	$LASF0
	.byte	0
	.4byte	$LASF36
	.byte	0x2
	.4byte	$LASF37
	.byte	0x4
	.4byte	$LASF38
	.byte	0x1
	.4byte	$LASF39
	.byte	0x3
	.4byte	$LASF40
	.byte	0x3
$LELTP0:
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM1
	.byte	0x1f
	.byte	0x5
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM2
	.byte	0x18
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM3
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM4
	.byte	0x19
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM5
	.byte	0x1
	.byte	0x5
	.uleb128 0x4
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM6
	.byte	0x18
	.byte	0x5
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM7
	.byte	0x19
	.byte	0x5
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM8
	.byte	0x18
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM9
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM10
	.byte	0x19
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM11
	.byte	0x1
	.byte	0x5
	.uleb128 0x4
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM12
	.byte	0x19
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM13
	.byte	0x18
	.byte	0x5
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM14
	.byte	0x19
	.byte	0x5
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM15
	.byte	0x18
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM16
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM17
	.byte	0x19
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM18
	.byte	0x1
	.byte	0x5
	.uleb128 0x4
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM19
	.byte	0x19
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM20
	.byte	0x18
	.byte	0x5
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM21
	.byte	0x19
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM22
	.byte	0x18
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM23
	.byte	0x18
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM24
	.byte	0x18
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM25
	.byte	0x18
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM26
	.byte	0x1b
	.byte	0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM27
	.byte	0x18
	.byte	0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM28
	.byte	0x19
	.byte	0x5
	.uleb128 0xe
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM29
	.byte	0x1a
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM30
	.byte	0x19
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM31
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
	.4byte	$LM32
	.byte	0x18
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM33
	.byte	0x18
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM34
	.byte	0x18
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM35
	.byte	0x14
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$Letext0
	.byte	0
	.uleb128 0x1
	.byte	0x1
$LELT0:
	.section	.debug_str,"MS",@progbits,1
$LASF27:
	.ascii "GNU C17 11.2.0 -mhard-float -mxl-float-convert -mxl-float-sqrt -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul -g -O0 -fstack-usage\0"
$LASF17:
	.ascii "float\0"
$LASF23:
	.ascii "val0\0"
$LASF29:
	.ascii "usleep\0"
$LASF18:
	.ascii "uart_init\0"
$LASF14:
	.ascii "led_set\0"
$LASF3:
	.ascii "unsigned char\0"
$LASF7:
	.ascii "long unsigned int\0"
$LASF5:
	.ascii "short unsigned int\0"
$LASF22:
	.ascii "val1\0"
$LASF21:
	.ascii "val2\0"
$LASF20:
	.ascii "val3\0"
$LASF13:
	.ascii "led_clear\0"
$LASF25:
	.ascii "my_func_1\0"
$LASF26:
	.ascii "my_func_2\0"
$LASF31:
	.ascii "my_func_3\0"
$LASF30:
	.ascii "main\0"
$LASF19:
	.ascii "led_init\0"
$LASF10:
	.ascii "unsigned int\0"
$LASF9:
	.ascii "long long unsigned int\0"
$LASF8:
	.ascii "long long int\0"
$LASF12:
	.ascii "char\0"
$LASF15:
	.ascii "printf_\0"
$LASF16:
	.ascii "asm_rms\0"
$LASF4:
	.ascii "short int\0"
$LASF28:
	.ascii "ULONG\0"
$LASF6:
	.ascii "long int\0"
$LASF11:
	.ascii "long double\0"
$LASF2:
	.ascii "signed char\0"
$LASF24:
	.ascii "my_result\0"
	.section	.debug_line_str,"MS",@progbits,1
$LASF35:
	.ascii "print\0"
$LASF1:
	.ascii "/home/lbogdanov/workspaces/xilinx_workspace/20_a\0"
$LASF36:
	.ascii "led.h\0"
$LASF39:
	.ascii "xil_types.h\0"
$LASF37:
	.ascii "print.h\0"
$LASF32:
	.ascii "uart\0"
$LASF0:
	.ascii "main.c\0"
$LASF34:
	.ascii "include\0"
$LASF40:
	.ascii "sleep.h\0"
$LASF33:
	.ascii "led\0"
$LASF38:
	.ascii "uart.h\0"
