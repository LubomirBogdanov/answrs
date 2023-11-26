	.text
$Ltext0:
	.rodata
	.align	2
$LC1:
	.ascii "\12my_sqrt[] = {\0"
	.align	2
$LC2:
	.ascii "%12.6f, \0"
	.align	2
$LC3:
	.ascii "}\12\0"
	.align	2
$LC0:
	.word	1082130432
	.word	1098907648
	.word	1080050057
	.word	1135567438
	.word	1066527621
	.word	1151140905
	.word	1166016512
	.word	1113619484
	.word	1120155861
	.word	1134272709
	.text
	.align	2
	.globl	main
$LFB16:
$LM1:
	.ent	main
	.type	main, @function
main:
	.frame	r19,116,r15		# vars= 84, regs= 1, args= 24
	.mask	0x00088000
	addik	r1,r1,-116
$LCFI0:
	swi	r15,r1,0
	swi	r19,r1,112
$LCFI1:
	addk	r19,r1,r0
$LCFI2:
$LM2:
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
	swi	r12,r19,28
	swi	r11,r19,32
	swi	r10,r19,36
	swi	r9,r19,40
	swi	r8,r19,44
	swi	r7,r19,48
	swi	r6,r19,52
	swi	r5,r19,56
	swi	r4,r19,60
	swi	r3,r19,64
$LM3:
	brlid	r15,led_init
	nop		# Unfilled delay slot

$LM4:
	brlid	r15,uart_init
	nop		# Unfilled delay slot

$LM5:
	swi	r0,r19,108
$LM6:
	bri	$L2
$L3:
$LM7:
	lwi	r3,r19,108
$LM8:
	lwi	r4,r19,108
	bslli	r4,r4,2
	addik	r5,r19,28
	addk	r4,r5,r4
	lwi	r4,r4,0
$LM9:
 #APP
 # 17 "main.c" 1
	fsqrt r4,r4
 # 0 "" 2
 #NO_APP
	bslli	r3,r3,2
	addik	r5,r19,28
	addk	r3,r5,r3
	addik	r3,r3,40
	swi	r4,r3,0
$LM10:
	lwi	r3,r19,108
	addik	r3,r3,1
	swi	r3,r19,108
$L2:
$LM11:
	lwi	r4,r19,108
	addik	r3,r0,9	# 0x9
	cmp	r18,r4,r3
	bgei	r18,$L3
$LM12:
	addik	r5,r0,$LC1
	brlid	r15,printf_
	nop		# Unfilled delay slot

$LM13:
	swi	r0,r19,108
$LM14:
	bri	$L4
$L5:
$LM15:
	lwi	r3,r19,108
	bslli	r3,r3,2
	addik	r4,r19,28
	addk	r3,r4,r3
	addik	r3,r3,40
	lwi	r3,r3,0
$LM16:
	addk	r5,r3,r0
	brlid	r15,__extendsfdf2
	nop		# Unfilled delay slot

	addk	r5,r4,r0
	addk	r4,r3,r0
	addk	r6,r4,r0
	addk	r7,r5,r0
	addik	r5,r0,$LC2
	brlid	r15,printf_
	nop		# Unfilled delay slot

$LM17:
	lwi	r3,r19,108
	addik	r3,r3,1
	swi	r3,r19,108
$L4:
$LM18:
	lwi	r4,r19,108
	addik	r3,r0,9	# 0x9
	cmp	r18,r4,r3
	bgei	r18,$L5
$LM19:
	addik	r5,r0,$LC3
	brlid	r15,printf_
	nop		# Unfilled delay slot

$L6:
$LM20:
	brlid	r15,led_set
	nop		# Unfilled delay slot

$LM21:
	addik	r5,r0,1000000
	brlid	r15,usleep
	nop		# Unfilled delay slot

$LM22:
	brlid	r15,led_clear
	nop		# Unfilled delay slot

$LM23:
	addik	r5,r0,1000000
	brlid	r15,usleep
	nop		# Unfilled delay slot

$LM24:
	bri	$L6
	.end	main
$LFE16:
$Lfe1:
	.size	main,$Lfe1-main
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
	.uleb128 0x74
	.byte	0x4
	.4byte	$LCFI1-$LCFI0
	.byte	0x8f
	.uleb128 0x74
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI2-$LCFI1
	.byte	0xd
	.uleb128 0x13
	.align	2
$LEFDE0:
	.text
$Letext0:
	.section	.debug_info,"",@progbits
$Ldebug_info0:
	.4byte	0x132
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	$Ldebug_abbrev0
	.uleb128 0x5
	.4byte	$LASF20
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
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x7
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
	.uleb128 0x8
	.4byte	0x78
	.uleb128 0x9
	.4byte	$LASF21
	.byte	0x4
	.byte	0x84
	.byte	0x17
	.4byte	0x49
	.uleb128 0xa
	.byte	0x4
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LASF13
	.byte	0x2
	.byte	0x9
	.uleb128 0xb
	.4byte	$LASF22
	.byte	0x5
	.byte	0x5a
	.byte	0x6
	.4byte	0xaf
	.uleb128 0x3
	.4byte	0x84
	.byte	0
	.uleb128 0x2
	.4byte	$LASF14
	.byte	0x2
	.byte	0x8
	.uleb128 0xc
	.4byte	$LASF23
	.byte	0x6
	.byte	0x3d
	.byte	0x5
	.4byte	0x5e
	.4byte	0xcd
	.uleb128 0x3
	.4byte	0x90
	.uleb128 0xd
	.byte	0
	.uleb128 0x2
	.4byte	$LASF15
	.byte	0x3
	.byte	0x3e
	.uleb128 0x2
	.4byte	$LASF16
	.byte	0x2
	.byte	0x7
	.uleb128 0xe
	.4byte	$LASF24
	.byte	0x1
	.byte	0x7
	.byte	0x5
	.4byte	0x5e
	.4byte	$LFB16
	.4byte	$LFE16-$LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11e
	.uleb128 0x4
	.4byte	$LASF17
	.byte	0x8
	.4byte	0x11e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x4
	.4byte	$LASF18
	.byte	0x9
	.4byte	0x11e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xf
	.ascii "i\0"
	.byte	0x1
	.byte	0xa
	.byte	0xf
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x10
	.4byte	0x12e
	.4byte	0x12e
	.uleb128 0x11
	.4byte	0x6a
	.byte	0x9
	.byte	0
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.4byte	$LASF19
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x18
	.byte	0
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.4byte	$LASF25
	.4byte	$LASF26
	.4byte	$LASF27
	.4byte	$LASF28
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
	.4byte	$LASF29
	.byte	0x2
	.4byte	$LASF30
	.byte	0x1
	.4byte	$LASF31
	.byte	0x3
	.4byte	$LASF32
	.byte	0x3
	.4byte	$LASF33
	.byte	0x4
$LELTP0:
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM1
	.byte	0x1d
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM2
	.byte	0x18
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM3
	.byte	0x1b
	.byte	0x5
	.uleb128 0x9
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM4
	.byte	0x18
	.byte	0x5
	.uleb128 0x9
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM5
	.byte	0x19
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM6
	.byte	0x1
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM7
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x19
	.byte	0x5
	.uleb128 0x2c
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM8
	.byte	0x1
	.byte	0x5
	.uleb128 0x46
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM9
	.byte	0x1
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM10
	.byte	0x15
	.byte	0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM11
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
	.4byte	$LM12
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x1e
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM13
	.byte	0x18
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM14
	.byte	0x1
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM15
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x18
	.byte	0x5
	.uleb128 0x1d
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM16
	.byte	0x1
	.byte	0x5
	.uleb128 0x3
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
	.byte	0x1a
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM20
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1b
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM21
	.byte	0x18
	.byte	0x5
	.uleb128 0x9
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM22
	.byte	0x18
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM23
	.byte	0x18
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM24
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
$LASF8:
	.ascii "long long int\0"
$LASF10:
	.ascii "unsigned int\0"
$LASF24:
	.ascii "main\0"
$LASF16:
	.ascii "led_init\0"
$LASF7:
	.ascii "long unsigned int\0"
$LASF9:
	.ascii "long long unsigned int\0"
$LASF19:
	.ascii "float\0"
$LASF17:
	.ascii "my_fpu_array_1\0"
$LASF20:
	.ascii "GNU C17 11.2.0 -mhard-float -mxl-float-convert -mxl-float-sqrt -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul -g -O0\0"
$LASF3:
	.ascii "unsigned char\0"
$LASF22:
	.ascii "usleep\0"
$LASF12:
	.ascii "char\0"
$LASF23:
	.ascii "printf_\0"
$LASF15:
	.ascii "uart_init\0"
$LASF6:
	.ascii "long int\0"
$LASF13:
	.ascii "led_clear\0"
$LASF5:
	.ascii "short unsigned int\0"
$LASF2:
	.ascii "signed char\0"
$LASF11:
	.ascii "long double\0"
$LASF18:
	.ascii "my_sqrt\0"
$LASF21:
	.ascii "ULONG\0"
$LASF4:
	.ascii "short int\0"
$LASF14:
	.ascii "led_set\0"
	.section	.debug_line_str,"MS",@progbits,1
$LASF28:
	.ascii "print\0"
$LASF1:
	.ascii "/home/lbogdanov/workspaces/xilinx_workspace/19_11\0"
$LASF29:
	.ascii "led.h\0"
$LASF31:
	.ascii "xil_types.h\0"
$LASF33:
	.ascii "print.h\0"
$LASF25:
	.ascii "uart\0"
$LASF0:
	.ascii "main.c\0"
$LASF27:
	.ascii "include\0"
$LASF32:
	.ascii "sleep.h\0"
$LASF26:
	.ascii "led\0"
$LASF30:
	.ascii "uart.h\0"
