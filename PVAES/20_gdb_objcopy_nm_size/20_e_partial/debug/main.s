	.text
$Ltext0:
	.rodata
	.type	char_a,@object
	.size	char_a,1
char_a:
	.byte	97
	.text
	.align	2
$LFB19:
$LM1:
	.ent	encode
	.type	encode, @function
encode:
	.frame	r19,8,r15		# vars= 0, regs= 1, args= 0
	.mask	0x00080000
	addik	r1,r1,-8
$LCFI0:
	swi	r19,r1,4
$LCFI1:
	addk	r19,r1,r0
$LCFI2:
	sbi	r5,r19,12
	swi	r6,r19,16
	lwi	r4,r0,__gcov0.encode
	lwi	r5,r0,__gcov0.encode+4
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.encode
	swi	r5,r0,__gcov0.encode+4
$LM2:
	lbui	r3,r19,12
	andi	r3,r3,15 #and1
	addk	r4,r3,r0
$LM3:
	addik	r3,r0,97	# 0x61
	addk	r3,r4,r3
	addk	r4,r3,r0
$LM4:
	lwi	r3,r19,16
	sbi	r4,r3,0
$LM5:
	lbui	r3,r19,12
	bsrli	r3,r3,4
	andi	r3,r3,15 #and1
	addk	r5,r3,r0
$LM6:
	addik	r4,r0,97	# 0x61
$LM7:
	lwi	r3,r19,16
	addik	r3,r3,1
$LM8:
	addk	r4,r5,r4
$LM9:
	sbi	r4,r3,0
$LM10:
	lwi	r3,r19,16
$LM11:
	addk	r1,r19,r0
	lwi	r19,r1,4
	addik	r1,r1,8
	rtsd	r15,8 
	nop		# Unfilled delay slot

	.end	encode
$LFE19:
$Lfe1:
	.size	encode,$Lfe1-encode
	.align	2
$LFB20:
$LM12:
	.ent	dump
	.type	dump, @function
dump:
	.frame	r19,44,r15		# vars= 12, regs= 1, args= 24
	.mask	0x00088000
	addik	r1,r1,-44
$LCFI3:
	swi	r15,r1,0
	swi	r19,r1,40
$LCFI4:
	addk	r19,r1,r0
$LCFI5:
	swi	r5,r19,48
	swi	r6,r19,52
	swi	r7,r19,56
$LM13:
	swi	r0,r1,-4392
	lwi	r4,r0,__gcov0.dump
	lwi	r5,r0,__gcov0.dump+4
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.dump
	swi	r5,r0,__gcov0.dump+4
$LM14:
	lwi	r3,r19,48
	swi	r3,r19,32
$LBB2:
$LM15:
	swi	r0,r19,28
$LM16:
	bri	$L4
$L5:
	lwi	r4,r0,__gcov0.dump+16
	lwi	r5,r0,__gcov0.dump+20
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.dump+16
	swi	r5,r0,__gcov0.dump+20
$LM17:
	lwi	r4,r19,32
	lwi	r3,r19,28
	addk	r3,r4,r3
$LM18:
	lbui	r3,r3,0
	addik	r4,r19,36
	addk	r6,r4,r0
	addk	r5,r3,r0
	brlid	r15,encode
	nop		# Unfilled delay slot

	addk	r9,r3,r0
	lwi	r4,r0,__gcov0.dump+8
	lwi	r5,r0,__gcov0.dump+12
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.dump+8
	swi	r5,r0,__gcov0.dump+12
$LM19:
	lwi	r3,r0,_impure_ptr
	lwi	r3,r3,12
$LM20:
	addk	r8,r3,r0
	addik	r7,r0,1	# 0x1
	addik	r6,r0,2	# 0x2
	addk	r5,r9,r0
	brlid	r15,fwrite
	nop		# Unfilled delay slot

$LM21:
	lwi	r3,r19,28
	addik	r3,r3,1
	swi	r3,r19,28
$L4:
$LM22:
	lwi	r4,r19,28
	lwi	r3,r19,52
	cmpu	r18,r3,r4
	blti	r18,$L5
	lwi	r4,r0,__gcov0.dump+24
	lwi	r5,r0,__gcov0.dump+28
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.dump+24
	swi	r5,r0,__gcov0.dump+28
$LBE2:
$LM23:
	nop
	lwi	r15,r1,0
	addk	r1,r19,r0
	lwi	r19,r1,40
	addik	r1,r1,44
	rtsd	r15,8 
	nop		# Unfilled delay slot

	.end	dump
$LFE20:
$Lfe2:
	.size	dump,$Lfe2-dump
	.align	2
$LFB21:
$LM24:
	.ent	filename
	.type	filename, @function
filename:
	.frame	r19,32,r15		# vars= 0, regs= 1, args= 24
	.mask	0x00088000
	addik	r1,r1,-32
$LCFI6:
	swi	r15,r1,0
	swi	r19,r1,28
$LCFI7:
	addk	r19,r1,r0
$LCFI8:
	swi	r5,r19,36
	swi	r6,r19,40
$LM25:
	swi	r0,r1,-4392
	lwi	r4,r0,__gcov0.filename
	lwi	r5,r0,__gcov0.filename+4
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.filename
	swi	r5,r0,__gcov0.filename+4
$LM26:
	lwi	r7,r19,40
	addik	r6,r0,dump
	lwi	r5,r19,36
	brlid	r15,__gcov_filename_to_gcfn
	nop		# Unfilled delay slot

	lwi	r4,r0,__gcov0.filename+8
	lwi	r5,r0,__gcov0.filename+12
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.filename+8
	swi	r5,r0,__gcov0.filename+12
$LM27:
	nop
	lwi	r15,r1,0
	addk	r1,r19,r0
	lwi	r19,r1,28
	addik	r1,r1,32
	rtsd	r15,8 
	nop		# Unfilled delay slot

	.end	filename
$LFE21:
$Lfe3:
	.size	filename,$Lfe3-filename
	.align	2
$LFB22:
$LM28:
	.ent	allocate
	.type	allocate, @function
allocate:
	.frame	r19,8,r15		# vars= 0, regs= 1, args= 0
	.mask	0x00088000
	addik	r1,r1,-8
$LCFI9:
	swi	r15,r1,0
	swi	r19,r1,4
$LCFI10:
	addk	r19,r1,r0
$LCFI11:
	swi	r5,r19,12
	swi	r6,r19,16
$LM29:
	swi	r0,r1,-4392
	lwi	r4,r0,__gcov0.allocate
	lwi	r5,r0,__gcov0.allocate+4
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.allocate
	swi	r5,r0,__gcov0.allocate+4
$LM30:
	lwi	r5,r19,12
	brlid	r15,malloc
	nop		# Unfilled delay slot

$LM31:
	lwi	r15,r1,0
	addk	r1,r19,r0
	lwi	r19,r1,4
	addik	r1,r1,8
	rtsd	r15,8 
	nop		# Unfilled delay slot

	.end	allocate
$LFE22:
$Lfe4:
	.size	allocate,$Lfe4-allocate
	.align	2
$LFB23:
$LM32:
	.ent	dump_gcov_info
	.type	dump_gcov_info, @function
dump_gcov_info:
	.frame	r19,44,r15		# vars= 12, regs= 1, args= 24
	.mask	0x00088000
	addik	r1,r1,-44
$LCFI12:
	swi	r15,r1,0
	swi	r19,r1,40
$LCFI13:
	addk	r19,r1,r0
$LCFI14:
$LM33:
	swi	r0,r1,-4392
	lwi	r4,r0,__gcov0.dump_gcov_info
	lwi	r5,r0,__gcov0.dump_gcov_info+4
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.dump_gcov_info
	swi	r5,r0,__gcov0.dump_gcov_info+4
$LM34:
	addik	r3,r0,__gcov_info_start
	swi	r3,r19,28
$LM35:
	addik	r3,r0,__gcov_info_end
	swi	r3,r19,32
$LM36:
	lwi	r3,r19,28
	swi	r3,r19,28
$LM37:
	bri	$L10
$L11:
	lwi	r4,r0,__gcov0.dump_gcov_info+16
	lwi	r5,r0,__gcov0.dump_gcov_info+20
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.dump_gcov_info+16
	swi	r5,r0,__gcov0.dump_gcov_info+20
$LBB3:
$LM38:
	swi	r0,r19,36
$LM39:
	lwi	r3,r19,28
	lwi	r3,r3,0
	lwi	r9,r19,36
	addik	r8,r0,allocate
	addik	r7,r0,dump
	addik	r6,r0,filename
	addk	r5,r3,r0
	brlid	r15,__gcov_info_to_gcda
	nop		# Unfilled delay slot

	lwi	r4,r0,__gcov0.dump_gcov_info+8
	lwi	r5,r0,__gcov0.dump_gcov_info+12
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.dump_gcov_info+8
	swi	r5,r0,__gcov0.dump_gcov_info+12
$LM40:
	lwi	r3,r0,_impure_ptr
	lwi	r3,r3,12
$LM41:
	addk	r6,r3,r0
	addik	r5,r0,10	# 0xa
	brlid	r15,fputc
	nop		# Unfilled delay slot

$LM42:
	lwi	r3,r19,28
	addik	r3,r3,4
	swi	r3,r19,28
$L10:
$LBE3:
$LM43:
	lwi	r4,r19,28
	lwi	r3,r19,32
	xor	r3,r4,r3
	bnei	r3,$L11
	lwi	r4,r0,__gcov0.dump_gcov_info+24
	lwi	r5,r0,__gcov0.dump_gcov_info+28
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.dump_gcov_info+24
	swi	r5,r0,__gcov0.dump_gcov_info+28
$LM44:
	nop
	lwi	r15,r1,0
	addk	r1,r19,r0
	lwi	r19,r1,40
	addik	r1,r1,44
	rtsd	r15,8 
	nop		# Unfilled delay slot

	.end	dump_gcov_info
$LFE23:
$Lfe5:
	.size	dump_gcov_info,$Lfe5-dump_gcov_info
	.align	2
	.globl	my_func_3
$LFB24:
$LM45:
	.ent	my_func_3
	.type	my_func_3, @function
my_func_3:
	.frame	r19,52,r15		# vars= 20, regs= 1, args= 0
	.mask	0x00080000
	addik	r1,r1,-52
$LCFI15:
	swi	r19,r1,48
$LCFI16:
	addk	r19,r1,r0
$LCFI17:
	lwi	r4,r0,__gcov0.my_func_3
	lwi	r5,r0,__gcov0.my_func_3+4
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.my_func_3
	swi	r5,r0,__gcov0.my_func_3+4
$LM46:
	addk	r3,r1,r0
	addk	r6,r3,r0
$LM47:
	addik	r3,r0,3	# 0x3
	swi	r3,r19,12
$LM48:
	addik	r3,r0,30	# 0x1e
	swi	r3,r19,16
$LM49:
	swi	r0,r1,-4472
	addik	r3,r0,80	# 0x50
	lwi	r4,r1,0
	rsubk	r3,r3,r0
	addk	r1,r1,r3
	swi	r4,r1,0
	addik	r3,r1,4
	addik	r3,r3,3
	bsrli	r3,r3,2
	bslli	r3,r3,2
	swi	r3,r19,8
	lwi	r4,r0,__gcov0.my_func_3+8
	lwi	r5,r0,__gcov0.my_func_3+12
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.my_func_3+8
	swi	r5,r0,__gcov0.my_func_3+12
$LM50:
	lwi	r4,r19,12
	lwi	r3,r19,16
	addk	r3,r4,r3
$LM51:
	swi	r3,r19,20
$LBB4:
$LM52:
	swi	r0,r19,4
$LM53:
	bri	$L13
$L16:
$LM54:
	lwi	r3,r19,4
	andi	r3,r3,1 #and1
$LM55:
	bnei	r3,$L14
	lwi	r4,r0,__gcov0.my_func_3+16
	lwi	r5,r0,__gcov0.my_func_3+20
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.my_func_3+16
	swi	r5,r0,__gcov0.my_func_3+20
$LM56:
	lwi	r4,r19,8
	lwi	r3,r19,4
	bslli	r3,r3,2
	addk	r3,r4,r3
	addik	r4,r0,51	# 0x33
	swi	r4,r3,0
	bri	$L15
$L14:
	lwi	r4,r0,__gcov0.my_func_3+24
	lwi	r5,r0,__gcov0.my_func_3+28
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.my_func_3+24
	swi	r5,r0,__gcov0.my_func_3+28
$LM57:
	lwi	r4,r19,8
	lwi	r3,r19,4
	bslli	r3,r3,2
	addk	r3,r4,r3
	addik	r4,r0,85	# 0x55
	swi	r4,r3,0
$L15:
$LM58:
	lwi	r3,r19,4
	addik	r3,r3,1
	swi	r3,r19,4
$L13:
$LM59:
	lwi	r4,r19,4
	addik	r3,r0,19	# 0x13
	cmp	r18,r4,r3
	bgei	r18,$L16
$LBE4:
	lwi	r18,r1,0
	addk	r1,r6,r0
	swi	r18,r1,0
$LM60:
	nop
	addk	r1,r19,r0
	lwi	r19,r1,48
	addik	r1,r1,52
	rtsd	r15,8 
	nop		# Unfilled delay slot

	.end	my_func_3
$LFE24:
$Lfe6:
	.size	my_func_3,$Lfe6-my_func_3
	.align	2
	.globl	my_func_2
$LFB25:
$LM61:
	.ent	my_func_2
	.type	my_func_2, @function
my_func_2:
	.frame	r19,20,r15		# vars= 12, regs= 1, args= 0
	.mask	0x00088000
	addik	r1,r1,-20
$LCFI18:
	swi	r15,r1,0
	swi	r19,r1,16
$LCFI19:
	addk	r19,r1,r0
$LCFI20:
$LM62:
	swi	r0,r1,-4392
	lwi	r4,r0,__gcov0.my_func_2
	lwi	r5,r0,__gcov0.my_func_2+4
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.my_func_2
	swi	r5,r0,__gcov0.my_func_2+4
$LM63:
	addik	r3,r0,2	# 0x2
	swi	r3,r19,4
$LM64:
	addik	r3,r0,20	# 0x14
	swi	r3,r19,8
$LM65:
	lwi	r4,r19,4
	lwi	r3,r19,8
	addk	r3,r4,r3
$LM66:
	swi	r3,r19,12
$LM67:
	brlid	r15,my_func_3
	nop		# Unfilled delay slot

	lwi	r4,r0,__gcov0.my_func_2+8
	lwi	r5,r0,__gcov0.my_func_2+12
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.my_func_2+8
	swi	r5,r0,__gcov0.my_func_2+12
$LM68:
	nop
	lwi	r15,r1,0
	addk	r1,r19,r0
	lwi	r19,r1,16
	addik	r1,r1,20
	rtsd	r15,8 
	nop		# Unfilled delay slot

	.end	my_func_2
$LFE25:
$Lfe7:
	.size	my_func_2,$Lfe7-my_func_2
	.align	2
	.globl	my_func_1
$LFB26:
$LM69:
	.ent	my_func_1
	.type	my_func_1, @function
my_func_1:
	.frame	r19,20,r15		# vars= 12, regs= 1, args= 0
	.mask	0x00088000
	addik	r1,r1,-20
$LCFI21:
	swi	r15,r1,0
	swi	r19,r1,16
$LCFI22:
	addk	r19,r1,r0
$LCFI23:
$LM70:
	swi	r0,r1,-4392
	lwi	r4,r0,__gcov0.my_func_1
	lwi	r5,r0,__gcov0.my_func_1+4
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.my_func_1
	swi	r5,r0,__gcov0.my_func_1+4
$LM71:
	addik	r3,r0,1	# 0x1
	swi	r3,r19,4
$LM72:
	addik	r3,r0,10	# 0xa
	swi	r3,r19,8
$LM73:
	lwi	r4,r19,4
	lwi	r3,r19,8
	addk	r3,r4,r3
$LM74:
	swi	r3,r19,12
$LM75:
	brlid	r15,my_func_2
	nop		# Unfilled delay slot

	lwi	r4,r0,__gcov0.my_func_1+8
	lwi	r5,r0,__gcov0.my_func_1+12
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.my_func_1+8
	swi	r5,r0,__gcov0.my_func_1+12
$LM76:
	nop
	lwi	r15,r1,0
	addk	r1,r19,r0
	lwi	r19,r1,16
	addik	r1,r1,20
	rtsd	r15,8 
	nop		# Unfilled delay slot

	.end	my_func_1
$LFE26:
$Lfe8:
	.size	my_func_1,$Lfe8-my_func_1
	.rodata
	.align	2
$LC0:
	.ascii "The result is --> %12.6f\12\0"
	.text
	.align	2
	.globl	main
$LFB27:
$LM77:
	.ent	main
	.type	main, @function
main:
	.frame	r19,60,r15		# vars= 28, regs= 1, args= 24
	.mask	0x00088000
	addik	r1,r1,-60
$LCFI24:
	swi	r15,r1,0
	swi	r19,r1,56
$LCFI25:
	addk	r19,r1,r0
$LCFI26:
$LM78:
	swi	r0,r1,-4392
	lwi	r4,r0,__gcov0.main
	lwi	r5,r0,__gcov0.main+4
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.main
	swi	r5,r0,__gcov0.main+4
$LM79:
	addik	r3,r0,0x40801481
	swi	r3,r19,28
$LM80:
	addik	r3,r0,0x40877879
	swi	r3,r19,32
$LM81:
	addik	r3,r0,0x40994216
	swi	r3,r19,36
$LM82:
	addik	r3,r0,0x40871041
	swi	r3,r19,40
$LM83:
	brlid	r15,led_init
	nop		# Unfilled delay slot

	lwi	r4,r0,__gcov0.main+8
	lwi	r5,r0,__gcov0.main+12
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.main+8
	swi	r5,r0,__gcov0.main+12
$LM84:
	brlid	r15,uart_init
	nop		# Unfilled delay slot

	lwi	r4,r0,__gcov0.main+16
	lwi	r5,r0,__gcov0.main+20
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.main+16
	swi	r5,r0,__gcov0.main+20
$LM85:
	lwi	r8,r19,40
	lwi	r7,r19,36
	lwi	r6,r19,32
	lwi	r5,r19,28
	brlid	r15,asm_rms
	nop		# Unfilled delay slot

	swi	r3,r19,44
	lwi	r4,r0,__gcov0.main+24
	lwi	r5,r0,__gcov0.main+28
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.main+24
	swi	r5,r0,__gcov0.main+28
$LM86:
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

	lwi	r4,r0,__gcov0.main+32
	lwi	r5,r0,__gcov0.main+36
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.main+32
	swi	r5,r0,__gcov0.main+36
$LM87:
	brlid	r15,my_func_1
	nop		# Unfilled delay slot

	lwi	r4,r0,__gcov0.main+40
	lwi	r5,r0,__gcov0.main+44
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.main+40
	swi	r5,r0,__gcov0.main+44
$LM88:
	brlid	r15,dump_gcov_info
	nop		# Unfilled delay slot

	lwi	r4,r0,__gcov0.main+48
	lwi	r5,r0,__gcov0.main+52
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.main+48
	swi	r5,r0,__gcov0.main+52
$L24:
$LM89:
	brlid	r15,led_set
	nop		# Unfilled delay slot

	lwi	r4,r0,__gcov0.main+56
	lwi	r5,r0,__gcov0.main+60
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.main+56
	swi	r5,r0,__gcov0.main+60
$LBB5:
$LM90:
	swi	r0,r19,48
$LM91:
	bri	$L20
$L21:
$LM92:
	lwi	r3,r19,48
	addik	r3,r3,1
	swi	r3,r19,48
	lwi	r4,r0,__gcov0.main+64
	lwi	r5,r0,__gcov0.main+68
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.main+64
	swi	r5,r0,__gcov0.main+68
$L20:
$LM93:
	lwi	r4,r19,48
	addik	r3,r0,999999
	cmp	r18,r4,r3
	bgei	r18,$L21
$LBE5:
$LM94:
	brlid	r15,led_clear
	nop		# Unfilled delay slot

	lwi	r4,r0,__gcov0.main+72
	lwi	r5,r0,__gcov0.main+76
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.main+72
	swi	r5,r0,__gcov0.main+76
$LBB6:
$LM95:
	swi	r0,r19,52
$LM96:
	bri	$L22
$L23:
$LM97:
	lwi	r3,r19,52
	addik	r3,r3,1
	swi	r3,r19,52
	lwi	r4,r0,__gcov0.main+80
	lwi	r5,r0,__gcov0.main+84
	addi	r4,r4,0x00000001
	addic	r5,r5,0x00000000
	swi	r4,r0,__gcov0.main+80
	swi	r5,r0,__gcov0.main+84
$L22:
$LM98:
	lwi	r4,r19,52
	addik	r3,r0,999999
	cmp	r18,r4,r3
	bgei	r18,$L23
$LBE6:
$LM99:
	bri	$L24
	.end	main
$LFE27:
$Lfe9:
	.size	main,$Lfe9-main
	.bss
	.lcomm	__gcov0.main,88,4
	.type	__gcov0.main, @object
	.lcomm	__gcov0.my_func_1,16,4
	.type	__gcov0.my_func_1, @object
	.lcomm	__gcov0.my_func_2,16,4
	.type	__gcov0.my_func_2, @object
	.lcomm	__gcov0.my_func_3,32,4
	.type	__gcov0.my_func_3, @object
	.lcomm	__gcov0.dump_gcov_info,32,4
	.type	__gcov0.dump_gcov_info, @object
	.lcomm	__gcov0.allocate,8,4
	.type	__gcov0.allocate, @object
	.lcomm	__gcov0.filename,16,4
	.type	__gcov0.filename, @object
	.lcomm	__gcov0.dump,32,4
	.type	__gcov0.dump, @object
	.lcomm	__gcov0.encode,8,4
	.type	__gcov0.encode, @object
	.section	.gcov_info,"a"
	.align	2
	.type	$LPBX2,@object
	.size	$LPBX2,4
$LPBX2:
	.word	$LPBX0
	.rodata
	.align	2
$LC1:
	.ascii "/home/lbogdanov/workspaces/xilinx_workspace/20_e/./debug/main.gcda\0"
	.data
	.align	2
	.type	$LPBX0,@object
	.size	$LPBX0,56
$LPBX0:
	.word	1110520362
	.word	0
	.word	-1327774287
	.word	$LC1
	.word	__gcov_merge_add
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	9
	.word	$LPBX1
	.align	2
	.type	__gcov_.main,@object
	.size	__gcov_.main,24
__gcov_.main:
	.word	$LPBX0
	.word	108032747
	.word	-1979649269
	.word	14004848
	.word	11
	.word	__gcov0.main
	.align	2
	.type	__gcov_.my_func_1,@object
	.size	__gcov_.my_func_1,24
__gcov_.my_func_1:
	.word	$LPBX0
	.word	661106036
	.word	-2033820367
	.word	-1061440962
	.word	2
	.word	__gcov0.my_func_1
	.align	2
	.type	__gcov_.my_func_2,@object
	.size	__gcov_.my_func_2,24
__gcov_.my_func_2:
	.word	$LPBX0
	.word	1435300519
	.word	-1039052924
	.word	-1061440962
	.word	2
	.word	__gcov0.my_func_2
	.align	2
	.type	__gcov_.my_func_3,@object
	.size	__gcov_.my_func_3,24
__gcov_.my_func_3:
	.word	$LPBX0
	.word	127218555
	.word	2087720084
	.word	211638730
	.word	4
	.word	__gcov0.my_func_3
	.align	2
	.type	__gcov_.dump_gcov_info,@object
	.size	__gcov_.dump_gcov_info,24
__gcov_.dump_gcov_info:
	.word	$LPBX0
	.word	674373768
	.word	2058391707
	.word	1631974238
	.word	4
	.word	__gcov0.dump_gcov_info
	.align	2
	.type	__gcov_.allocate,@object
	.size	__gcov_.allocate,24
__gcov_.allocate:
	.word	$LPBX0
	.word	1776801596
	.word	152301408
	.word	-614602264
	.word	1
	.word	__gcov0.allocate
	.align	2
	.type	__gcov_.filename,@object
	.size	__gcov_.filename,24
__gcov_.filename:
	.word	$LPBX0
	.word	292324731
	.word	-1791959725
	.word	-1061440962
	.word	2
	.word	__gcov0.filename
	.align	2
	.type	__gcov_.dump,@object
	.size	__gcov_.dump,24
__gcov_.dump:
	.word	$LPBX0
	.word	1148789280
	.word	-2123349284
	.word	1631974238
	.word	4
	.word	__gcov0.dump
	.align	2
	.type	__gcov_.encode,@object
	.size	__gcov_.encode,24
__gcov_.encode:
	.word	$LPBX0
	.word	1702749787
	.word	-1102755655
	.word	-614602264
	.word	1
	.word	__gcov0.encode
	.align	2
	.type	$LPBX1,@object
	.size	$LPBX1,36
$LPBX1:
	.word	__gcov_.main
	.word	__gcov_.my_func_1
	.word	__gcov_.my_func_2
	.word	__gcov_.my_func_3
	.word	__gcov_.dump_gcov_info
	.word	__gcov_.allocate
	.word	__gcov_.filename
	.word	__gcov_.dump
	.word	__gcov_.encode
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
	.4byte	$LFB19
	.4byte	$LFE19-$LFB19
	.byte	0x4
	.4byte	$LCFI0-$LFB19
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
	.4byte	$LFB20
	.4byte	$LFE20-$LFB20
	.byte	0x4
	.4byte	$LCFI3-$LFB20
	.byte	0xe
	.uleb128 0x2c
	.byte	0x4
	.4byte	$LCFI4-$LCFI3
	.byte	0x8f
	.uleb128 0x2c
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
	.4byte	$LFB21
	.4byte	$LFE21-$LFB21
	.byte	0x4
	.4byte	$LCFI6-$LFB21
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	$LCFI7-$LCFI6
	.byte	0x8f
	.uleb128 0x20
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
	.4byte	$LFB22
	.4byte	$LFE22-$LFB22
	.byte	0x4
	.4byte	$LCFI9-$LFB22
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	$LCFI10-$LCFI9
	.byte	0x8f
	.uleb128 0x8
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI11-$LCFI10
	.byte	0xd
	.uleb128 0x13
	.align	2
$LEFDE6:
$LSFDE8:
	.4byte	$LEFDE8-$LASFDE8
$LASFDE8:
	.4byte	$Lframe0
	.4byte	$LFB23
	.4byte	$LFE23-$LFB23
	.byte	0x4
	.4byte	$LCFI12-$LFB23
	.byte	0xe
	.uleb128 0x2c
	.byte	0x4
	.4byte	$LCFI13-$LCFI12
	.byte	0x8f
	.uleb128 0x2c
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI14-$LCFI13
	.byte	0xd
	.uleb128 0x13
	.align	2
$LEFDE8:
$LSFDE10:
	.4byte	$LEFDE10-$LASFDE10
$LASFDE10:
	.4byte	$Lframe0
	.4byte	$LFB24
	.4byte	$LFE24-$LFB24
	.byte	0x4
	.4byte	$LCFI15-$LFB24
	.byte	0xe
	.uleb128 0x34
	.byte	0x4
	.4byte	$LCFI16-$LCFI15
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI17-$LCFI16
	.byte	0xd
	.uleb128 0x13
	.align	2
$LEFDE10:
$LSFDE12:
	.4byte	$LEFDE12-$LASFDE12
$LASFDE12:
	.4byte	$Lframe0
	.4byte	$LFB25
	.4byte	$LFE25-$LFB25
	.byte	0x4
	.4byte	$LCFI18-$LFB25
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.4byte	$LCFI19-$LCFI18
	.byte	0x8f
	.uleb128 0x14
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI20-$LCFI19
	.byte	0xd
	.uleb128 0x13
	.align	2
$LEFDE12:
$LSFDE14:
	.4byte	$LEFDE14-$LASFDE14
$LASFDE14:
	.4byte	$Lframe0
	.4byte	$LFB26
	.4byte	$LFE26-$LFB26
	.byte	0x4
	.4byte	$LCFI21-$LFB26
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.4byte	$LCFI22-$LCFI21
	.byte	0x8f
	.uleb128 0x14
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI23-$LCFI22
	.byte	0xd
	.uleb128 0x13
	.align	2
$LEFDE14:
$LSFDE16:
	.4byte	$LEFDE16-$LASFDE16
$LASFDE16:
	.4byte	$Lframe0
	.4byte	$LFB27
	.4byte	$LFE27-$LFB27
	.byte	0x4
	.4byte	$LCFI24-$LFB27
	.byte	0xe
	.uleb128 0x3c
	.byte	0x4
	.4byte	$LCFI25-$LCFI24
	.byte	0x8f
	.uleb128 0x3c
	.byte	0x93
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI26-$LCFI25
	.byte	0xd
	.uleb128 0x13
	.align	2
$LEFDE16:
	.text
$Letext0:
	.section	.debug_info,"",@progbits
$Ldebug_info0:
	.4byte	0xc9b
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	$Ldebug_abbrev0
	.uleb128 0x1d
	.4byte	$LASF151
	.byte	0x1d
	.4byte	$LASF0
	.4byte	$LASF1
	.4byte	$Ltext0
	.4byte	$Letext0-$Ltext0
	.4byte	$Ldebug_line0
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.4byte	$LASF2
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	$LASF3
	.uleb128 0xd
	.4byte	0x2d
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.4byte	$LASF4
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.4byte	$LASF5
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.4byte	$LASF6
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	$LASF7
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.4byte	$LASF8
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.4byte	$LASF9
	.uleb128 0x1e
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x1f
	.4byte	0x63
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	$LASF10
	.uleb128 0xa
	.4byte	$LASF12
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.4byte	0x6f
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.4byte	$LASF11
	.uleb128 0x17
	.4byte	$LASF13
	.byte	0x2
	.2byte	0x167
	.byte	0x17
	.4byte	0x6f
	.uleb128 0xa
	.4byte	$LASF14
	.byte	0x3
	.byte	0x2e
	.byte	0xe
	.4byte	0x47
	.uleb128 0xa
	.4byte	$LASF15
	.byte	0x3
	.byte	0x74
	.byte	0xe
	.4byte	0x47
	.uleb128 0x20
	.byte	0x4
	.byte	0x3
	.byte	0xa5
	.byte	0x3
	.4byte	0xce
	.uleb128 0x18
	.4byte	$LASF16
	.byte	0xa7
	.byte	0xc
	.4byte	0x89
	.uleb128 0x18
	.4byte	$LASF17
	.byte	0xa8
	.byte	0x13
	.4byte	0xce
	.byte	0
	.uleb128 0x7
	.4byte	0x2d
	.4byte	0xde
	.uleb128 0x8
	.4byte	0x6f
	.byte	0x3
	.byte	0
	.uleb128 0x21
	.byte	0x8
	.byte	0x3
	.byte	0xa2
	.byte	0x9
	.4byte	0x102
	.uleb128 0x3
	.4byte	$LASF18
	.byte	0x3
	.byte	0xa4
	.byte	0x7
	.4byte	0x63
	.byte	0
	.uleb128 0x3
	.4byte	$LASF19
	.byte	0x3
	.byte	0xa9
	.byte	0x5
	.4byte	0xae
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.4byte	$LASF20
	.byte	0x3
	.byte	0xaa
	.byte	0x3
	.4byte	0xde
	.uleb128 0x22
	.byte	0x4
	.uleb128 0xa
	.4byte	$LASF21
	.byte	0x4
	.byte	0x16
	.byte	0x19
	.4byte	0x4e
	.uleb128 0xa
	.4byte	$LASF22
	.byte	0x5
	.byte	0xc
	.byte	0xd
	.4byte	0x63
	.uleb128 0xa
	.4byte	$LASF23
	.byte	0x4
	.byte	0x23
	.byte	0x1b
	.4byte	0x11c
	.uleb128 0xe
	.4byte	$LASF28
	.byte	0x18
	.byte	0x34
	.4byte	0x18a
	.uleb128 0x3
	.4byte	$LASF24
	.byte	0x4
	.byte	0x36
	.byte	0x13
	.4byte	0x18a
	.byte	0
	.uleb128 0x9
	.ascii "_k\0"
	.byte	0x37
	.byte	0x7
	.4byte	0x63
	.byte	0x4
	.uleb128 0x3
	.4byte	$LASF25
	.byte	0x4
	.byte	0x37
	.byte	0xb
	.4byte	0x63
	.byte	0x8
	.uleb128 0x3
	.4byte	$LASF26
	.byte	0x4
	.byte	0x37
	.byte	0x14
	.4byte	0x63
	.byte	0xc
	.uleb128 0x3
	.4byte	$LASF27
	.byte	0x4
	.byte	0x37
	.byte	0x1b
	.4byte	0x63
	.byte	0x10
	.uleb128 0x9
	.ascii "_x\0"
	.byte	0x38
	.byte	0xb
	.4byte	0x18f
	.byte	0x14
	.byte	0
	.uleb128 0x4
	.4byte	0x134
	.uleb128 0x7
	.4byte	0x110
	.4byte	0x19f
	.uleb128 0x8
	.4byte	0x6f
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	$LASF29
	.byte	0x24
	.byte	0x3c
	.4byte	0x220
	.uleb128 0x3
	.4byte	$LASF30
	.byte	0x4
	.byte	0x3e
	.byte	0x9
	.4byte	0x63
	.byte	0
	.uleb128 0x3
	.4byte	$LASF31
	.byte	0x4
	.byte	0x3f
	.byte	0x9
	.4byte	0x63
	.byte	0x4
	.uleb128 0x3
	.4byte	$LASF32
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.4byte	0x63
	.byte	0x8
	.uleb128 0x3
	.4byte	$LASF33
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.4byte	0x63
	.byte	0xc
	.uleb128 0x3
	.4byte	$LASF34
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.4byte	0x63
	.byte	0x10
	.uleb128 0x3
	.4byte	$LASF35
	.byte	0x4
	.byte	0x43
	.byte	0x9
	.4byte	0x63
	.byte	0x14
	.uleb128 0x3
	.4byte	$LASF36
	.byte	0x4
	.byte	0x44
	.byte	0x9
	.4byte	0x63
	.byte	0x18
	.uleb128 0x3
	.4byte	$LASF37
	.byte	0x4
	.byte	0x45
	.byte	0x9
	.4byte	0x63
	.byte	0x1c
	.uleb128 0x3
	.4byte	$LASF38
	.byte	0x4
	.byte	0x46
	.byte	0x9
	.4byte	0x63
	.byte	0x20
	.byte	0
	.uleb128 0x23
	.4byte	$LASF39
	.2byte	0x108
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.4byte	0x261
	.uleb128 0x3
	.4byte	$LASF40
	.byte	0x4
	.byte	0x50
	.byte	0xa
	.4byte	0x261
	.byte	0
	.uleb128 0x3
	.4byte	$LASF41
	.byte	0x4
	.byte	0x51
	.byte	0x9
	.4byte	0x261
	.byte	0x80
	.uleb128 0x19
	.4byte	$LASF42
	.byte	0x53
	.4byte	0x110
	.2byte	0x100
	.uleb128 0x19
	.4byte	$LASF43
	.byte	0x56
	.4byte	0x110
	.2byte	0x104
	.byte	0
	.uleb128 0x7
	.4byte	0x10e
	.4byte	0x271
	.uleb128 0x8
	.4byte	0x6f
	.byte	0x1f
	.byte	0
	.uleb128 0xe
	.4byte	$LASF44
	.byte	0x8c
	.byte	0x5a
	.4byte	0x2b1
	.uleb128 0x3
	.4byte	$LASF24
	.byte	0x4
	.byte	0x5b
	.byte	0x12
	.4byte	0x2b1
	.byte	0
	.uleb128 0x3
	.4byte	$LASF45
	.byte	0x4
	.byte	0x5c
	.byte	0x6
	.4byte	0x63
	.byte	0x4
	.uleb128 0x3
	.4byte	$LASF46
	.byte	0x4
	.byte	0x5d
	.byte	0x9
	.4byte	0x2b6
	.byte	0x8
	.uleb128 0x3
	.4byte	$LASF47
	.byte	0x4
	.byte	0x5e
	.byte	0x20
	.4byte	0x2cc
	.byte	0x88
	.byte	0
	.uleb128 0x4
	.4byte	0x271
	.uleb128 0x7
	.4byte	0x2c6
	.4byte	0x2c6
	.uleb128 0x8
	.4byte	0x6f
	.byte	0x1f
	.byte	0
	.uleb128 0x4
	.4byte	0x2cb
	.uleb128 0x24
	.uleb128 0x4
	.4byte	0x220
	.uleb128 0xe
	.4byte	$LASF48
	.byte	0x8
	.byte	0x7a
	.4byte	0x2f7
	.uleb128 0x3
	.4byte	$LASF49
	.byte	0x4
	.byte	0x7b
	.byte	0x11
	.4byte	0x2f7
	.byte	0
	.uleb128 0x3
	.4byte	$LASF50
	.byte	0x4
	.byte	0x7c
	.byte	0x6
	.4byte	0x63
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	0x2d
	.uleb128 0xf
	.4byte	$LASF51
	.byte	0xf0
	.2byte	0x179
	.4byte	0x442
	.uleb128 0x1
	.4byte	$LASF52
	.2byte	0x17d
	.byte	0x7
	.4byte	0x63
	.byte	0
	.uleb128 0x1
	.4byte	$LASF53
	.2byte	0x182
	.byte	0xb
	.4byte	0x67e
	.byte	0x4
	.uleb128 0x1
	.4byte	$LASF54
	.2byte	0x182
	.byte	0x14
	.4byte	0x67e
	.byte	0x8
	.uleb128 0x1
	.4byte	$LASF55
	.2byte	0x182
	.byte	0x1e
	.4byte	0x67e
	.byte	0xc
	.uleb128 0x1
	.4byte	$LASF56
	.2byte	0x184
	.byte	0x8
	.4byte	0x63
	.byte	0x10
	.uleb128 0x1
	.4byte	$LASF57
	.2byte	0x186
	.byte	0x9
	.4byte	0x59e
	.byte	0x14
	.uleb128 0x1
	.4byte	$LASF58
	.2byte	0x188
	.byte	0x7
	.4byte	0x63
	.byte	0x18
	.uleb128 0x1
	.4byte	$LASF59
	.2byte	0x18a
	.byte	0x7
	.4byte	0x63
	.byte	0x1c
	.uleb128 0x1
	.4byte	$LASF60
	.2byte	0x18b
	.byte	0x16
	.4byte	0x7cb
	.byte	0x20
	.uleb128 0x25
	.ascii "_mp\0"
	.byte	0x4
	.2byte	0x18d
	.byte	0x12
	.4byte	0x7d0
	.byte	0x24
	.uleb128 0x1
	.4byte	$LASF61
	.2byte	0x18f
	.byte	0xa
	.4byte	0x7e0
	.byte	0x28
	.uleb128 0x1
	.4byte	$LASF62
	.2byte	0x191
	.byte	0x7
	.4byte	0x63
	.byte	0x2c
	.uleb128 0x1
	.4byte	$LASF63
	.2byte	0x194
	.byte	0x7
	.4byte	0x63
	.byte	0x30
	.uleb128 0x1
	.4byte	$LASF64
	.2byte	0x195
	.byte	0x9
	.4byte	0x59e
	.byte	0x34
	.uleb128 0x1
	.4byte	$LASF65
	.2byte	0x197
	.byte	0x13
	.4byte	0x7e5
	.byte	0x38
	.uleb128 0x1
	.4byte	$LASF66
	.2byte	0x198
	.byte	0x10
	.4byte	0x7ea
	.byte	0x3c
	.uleb128 0x1
	.4byte	$LASF67
	.2byte	0x199
	.byte	0x9
	.4byte	0x59e
	.byte	0x40
	.uleb128 0x1
	.4byte	$LASF68
	.2byte	0x19c
	.byte	0xc
	.4byte	0x7fa
	.byte	0x44
	.uleb128 0x1
	.4byte	$LASF44
	.2byte	0x1a0
	.byte	0x13
	.4byte	0x2b1
	.byte	0x48
	.uleb128 0x1
	.4byte	$LASF69
	.2byte	0x1a1
	.byte	0x12
	.4byte	0x271
	.byte	0x4c
	.uleb128 0x1
	.4byte	$LASF70
	.2byte	0x1a4
	.byte	0x10
	.4byte	0x645
	.byte	0xd8
	.uleb128 0x1
	.4byte	$LASF71
	.2byte	0x1a5
	.byte	0xb
	.4byte	0x67e
	.byte	0xe4
	.uleb128 0x1
	.4byte	$LASF72
	.2byte	0x1a6
	.byte	0x17
	.4byte	0x804
	.byte	0xe8
	.uleb128 0x1
	.4byte	$LASF73
	.2byte	0x1a7
	.byte	0x9
	.4byte	0x59e
	.byte	0xec
	.byte	0
	.uleb128 0x4
	.4byte	0x2fc
	.uleb128 0xe
	.4byte	$LASF74
	.byte	0x68
	.byte	0xba
	.4byte	0x580
	.uleb128 0x9
	.ascii "_p\0"
	.byte	0xbb
	.byte	0x12
	.4byte	0x2f7
	.byte	0
	.uleb128 0x9
	.ascii "_r\0"
	.byte	0xbc
	.byte	0x7
	.4byte	0x63
	.byte	0x4
	.uleb128 0x9
	.ascii "_w\0"
	.byte	0xbd
	.byte	0x7
	.4byte	0x63
	.byte	0x8
	.uleb128 0x3
	.4byte	$LASF75
	.byte	0x4
	.byte	0xbe
	.byte	0x9
	.4byte	0x39
	.byte	0xc
	.uleb128 0x3
	.4byte	$LASF76
	.byte	0x4
	.byte	0xbf
	.byte	0x9
	.4byte	0x39
	.byte	0xe
	.uleb128 0x9
	.ascii "_bf\0"
	.byte	0xc0
	.byte	0x11
	.4byte	0x2d1
	.byte	0x10
	.uleb128 0x3
	.4byte	$LASF77
	.byte	0x4
	.byte	0xc1
	.byte	0x7
	.4byte	0x63
	.byte	0x18
	.uleb128 0x3
	.4byte	$LASF78
	.byte	0x4
	.byte	0xc4
	.byte	0x12
	.4byte	0x442
	.byte	0x1c
	.uleb128 0x3
	.4byte	$LASF79
	.byte	0x4
	.byte	0xc8
	.byte	0xa
	.4byte	0x10e
	.byte	0x20
	.uleb128 0x3
	.4byte	$LASF80
	.byte	0x4
	.byte	0xca
	.byte	0x1d
	.4byte	0x5af
	.byte	0x24
	.uleb128 0x3
	.4byte	$LASF81
	.byte	0x4
	.byte	0xcc
	.byte	0x1d
	.4byte	0x5d7
	.byte	0x28
	.uleb128 0x3
	.4byte	$LASF82
	.byte	0x4
	.byte	0xcf
	.byte	0xd
	.4byte	0x5fa
	.byte	0x2c
	.uleb128 0x3
	.4byte	$LASF83
	.byte	0x4
	.byte	0xd0
	.byte	0x9
	.4byte	0x613
	.byte	0x30
	.uleb128 0x9
	.ascii "_ub\0"
	.byte	0xd3
	.byte	0x11
	.4byte	0x2d1
	.byte	0x34
	.uleb128 0x9
	.ascii "_up\0"
	.byte	0xd4
	.byte	0x12
	.4byte	0x2f7
	.byte	0x3c
	.uleb128 0x9
	.ascii "_ur\0"
	.byte	0xd5
	.byte	0x7
	.4byte	0x63
	.byte	0x40
	.uleb128 0x3
	.4byte	$LASF84
	.byte	0x4
	.byte	0xd8
	.byte	0x11
	.4byte	0x618
	.byte	0x44
	.uleb128 0x3
	.4byte	$LASF85
	.byte	0x4
	.byte	0xd9
	.byte	0x11
	.4byte	0x628
	.byte	0x47
	.uleb128 0x9
	.ascii "_lb\0"
	.byte	0xdc
	.byte	0x11
	.4byte	0x2d1
	.byte	0x48
	.uleb128 0x3
	.4byte	$LASF86
	.byte	0x4
	.byte	0xdf
	.byte	0x7
	.4byte	0x63
	.byte	0x50
	.uleb128 0x3
	.4byte	$LASF87
	.byte	0x4
	.byte	0xe0
	.byte	0xa
	.4byte	0x96
	.byte	0x54
	.uleb128 0x3
	.4byte	$LASF88
	.byte	0x4
	.byte	0xe7
	.byte	0xc
	.4byte	0x128
	.byte	0x58
	.uleb128 0x3
	.4byte	$LASF89
	.byte	0x4
	.byte	0xe9
	.byte	0xe
	.4byte	0x102
	.byte	0x5c
	.uleb128 0x3
	.4byte	$LASF90
	.byte	0x4
	.byte	0xea
	.byte	0x9
	.4byte	0x63
	.byte	0x64
	.byte	0
	.uleb128 0x10
	.4byte	0x63
	.4byte	0x59e
	.uleb128 0x2
	.4byte	0x442
	.uleb128 0x2
	.4byte	0x10e
	.uleb128 0x2
	.4byte	0x59e
	.uleb128 0x2
	.4byte	0x63
	.byte	0
	.uleb128 0x4
	.4byte	0x5a3
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.4byte	$LASF91
	.uleb128 0xd
	.4byte	0x5a3
	.uleb128 0x4
	.4byte	0x580
	.uleb128 0x10
	.4byte	0x63
	.4byte	0x5d2
	.uleb128 0x2
	.4byte	0x442
	.uleb128 0x2
	.4byte	0x10e
	.uleb128 0x2
	.4byte	0x5d2
	.uleb128 0x2
	.4byte	0x63
	.byte	0
	.uleb128 0x4
	.4byte	0x5aa
	.uleb128 0x4
	.4byte	0x5b4
	.uleb128 0x10
	.4byte	0xa2
	.4byte	0x5fa
	.uleb128 0x2
	.4byte	0x442
	.uleb128 0x2
	.4byte	0x10e
	.uleb128 0x2
	.4byte	0xa2
	.uleb128 0x2
	.4byte	0x63
	.byte	0
	.uleb128 0x4
	.4byte	0x5dc
	.uleb128 0x10
	.4byte	0x63
	.4byte	0x613
	.uleb128 0x2
	.4byte	0x442
	.uleb128 0x2
	.4byte	0x10e
	.byte	0
	.uleb128 0x4
	.4byte	0x5ff
	.uleb128 0x7
	.4byte	0x2d
	.4byte	0x628
	.uleb128 0x8
	.4byte	0x6f
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.4byte	0x2d
	.4byte	0x638
	.uleb128 0x8
	.4byte	0x6f
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	$LASF92
	.byte	0x4
	.2byte	0x124
	.byte	0x1a
	.4byte	0x447
	.uleb128 0xf
	.4byte	$LASF93
	.byte	0xc
	.2byte	0x128
	.4byte	0x679
	.uleb128 0x1
	.4byte	$LASF24
	.2byte	0x12a
	.byte	0x11
	.4byte	0x679
	.byte	0
	.uleb128 0x1
	.4byte	$LASF94
	.2byte	0x12b
	.byte	0x7
	.4byte	0x63
	.byte	0x4
	.uleb128 0x1
	.4byte	$LASF95
	.2byte	0x12c
	.byte	0xb
	.4byte	0x67e
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.4byte	0x645
	.uleb128 0x4
	.4byte	0x638
	.uleb128 0xf
	.4byte	$LASF96
	.byte	0x18
	.2byte	0x144
	.4byte	0x6c4
	.uleb128 0x1
	.4byte	$LASF97
	.2byte	0x145
	.byte	0x12
	.4byte	0x6c4
	.byte	0
	.uleb128 0x1
	.4byte	$LASF98
	.2byte	0x146
	.byte	0x12
	.4byte	0x6c4
	.byte	0x6
	.uleb128 0x1
	.4byte	$LASF99
	.2byte	0x147
	.byte	0x12
	.4byte	0x40
	.byte	0xc
	.uleb128 0x1
	.4byte	$LASF100
	.2byte	0x14a
	.byte	0x24
	.4byte	0x5c
	.byte	0x10
	.byte	0
	.uleb128 0x7
	.4byte	0x40
	.4byte	0x6d4
	.uleb128 0x8
	.4byte	0x6f
	.byte	0x2
	.byte	0
	.uleb128 0xf
	.4byte	$LASF101
	.byte	0x10
	.2byte	0x15d
	.4byte	0x715
	.uleb128 0x1
	.4byte	$LASF102
	.2byte	0x160
	.byte	0x13
	.4byte	0x18a
	.byte	0
	.uleb128 0x1
	.4byte	$LASF103
	.2byte	0x161
	.byte	0x7
	.4byte	0x63
	.byte	0x4
	.uleb128 0x1
	.4byte	$LASF104
	.2byte	0x162
	.byte	0x13
	.4byte	0x18a
	.byte	0x8
	.uleb128 0x1
	.4byte	$LASF105
	.2byte	0x163
	.byte	0x14
	.4byte	0x715
	.byte	0xc
	.byte	0
	.uleb128 0x4
	.4byte	0x18a
	.uleb128 0xf
	.4byte	$LASF106
	.byte	0x50
	.2byte	0x167
	.4byte	0x7b6
	.uleb128 0x1
	.4byte	$LASF107
	.2byte	0x16a
	.byte	0x9
	.4byte	0x59e
	.byte	0
	.uleb128 0x1
	.4byte	$LASF108
	.2byte	0x16b
	.byte	0xe
	.4byte	0x102
	.byte	0x4
	.uleb128 0x1
	.4byte	$LASF109
	.2byte	0x16c
	.byte	0xe
	.4byte	0x102
	.byte	0xc
	.uleb128 0x1
	.4byte	$LASF110
	.2byte	0x16d
	.byte	0xe
	.4byte	0x102
	.byte	0x14
	.uleb128 0x1
	.4byte	$LASF111
	.2byte	0x16e
	.byte	0x8
	.4byte	0x7b6
	.byte	0x1c
	.uleb128 0x1
	.4byte	$LASF112
	.2byte	0x16f
	.byte	0x7
	.4byte	0x63
	.byte	0x24
	.uleb128 0x1
	.4byte	$LASF113
	.2byte	0x170
	.byte	0xe
	.4byte	0x102
	.byte	0x28
	.uleb128 0x1
	.4byte	$LASF114
	.2byte	0x171
	.byte	0xe
	.4byte	0x102
	.byte	0x30
	.uleb128 0x1
	.4byte	$LASF115
	.2byte	0x172
	.byte	0xe
	.4byte	0x102
	.byte	0x38
	.uleb128 0x1
	.4byte	$LASF116
	.2byte	0x173
	.byte	0xe
	.4byte	0x102
	.byte	0x40
	.uleb128 0x1
	.4byte	$LASF117
	.2byte	0x174
	.byte	0xe
	.4byte	0x102
	.byte	0x48
	.byte	0
	.uleb128 0x7
	.4byte	0x5a3
	.4byte	0x7c6
	.uleb128 0x8
	.4byte	0x6f
	.byte	0x7
	.byte	0
	.uleb128 0x15
	.4byte	$LASF119
	.uleb128 0x4
	.4byte	0x7c6
	.uleb128 0x4
	.4byte	0x6d4
	.uleb128 0x12
	.4byte	0x7e0
	.uleb128 0x2
	.4byte	0x442
	.byte	0
	.uleb128 0x4
	.4byte	0x7d5
	.uleb128 0x4
	.4byte	0x683
	.uleb128 0x4
	.4byte	0x19f
	.uleb128 0x12
	.4byte	0x7fa
	.uleb128 0x2
	.4byte	0x63
	.byte	0
	.uleb128 0x4
	.4byte	0x7ff
	.uleb128 0x4
	.4byte	0x7ef
	.uleb128 0x4
	.4byte	0x71a
	.uleb128 0x26
	.4byte	$LASF121
	.byte	0x4
	.2byte	0x333
	.byte	0x17
	.4byte	0x442
	.uleb128 0xa
	.4byte	$LASF118
	.byte	0x6
	.byte	0x42
	.byte	0x10
	.4byte	0x638
	.uleb128 0x4
	.4byte	0x82c
	.uleb128 0x27
	.4byte	0x822
	.uleb128 0x28
	.uleb128 0x7
	.4byte	0x842
	.4byte	0x838
	.uleb128 0x29
	.byte	0
	.uleb128 0xd
	.4byte	0x82d
	.uleb128 0x4
	.4byte	0x84c
	.uleb128 0xd
	.4byte	0x83d
	.uleb128 0x15
	.4byte	$LASF120
	.uleb128 0xd
	.4byte	0x847
	.uleb128 0x1a
	.4byte	$LASF122
	.byte	0x13
	.4byte	0x838
	.uleb128 0x1a
	.4byte	$LASF123
	.byte	0x14
	.4byte	0x838
	.uleb128 0xc
	.4byte	$LASF136
	.byte	0x16
	.byte	0x1c
	.4byte	0x34
	.uleb128 0x5
	.byte	0x3
	.4byte	char_a
	.uleb128 0x13
	.4byte	$LASF124
	.byte	0x7
	.byte	0x9
	.uleb128 0x13
	.4byte	$LASF125
	.byte	0x7
	.byte	0x8
	.uleb128 0x11
	.4byte	$LASF126
	.byte	0x8
	.byte	0x3d
	.byte	0x5
	.4byte	0x63
	.4byte	0x89b
	.uleb128 0x2
	.4byte	0x5d2
	.uleb128 0x2a
	.byte	0
	.uleb128 0x11
	.4byte	$LASF127
	.byte	0x1
	.byte	0x41
	.byte	0xe
	.4byte	0x8c0
	.4byte	0x8c0
	.uleb128 0x2
	.4byte	0x8c0
	.uleb128 0x2
	.4byte	0x8c0
	.uleb128 0x2
	.4byte	0x8c0
	.uleb128 0x2
	.4byte	0x8c0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x4
	.4byte	$LASF128
	.uleb128 0x13
	.4byte	$LASF129
	.byte	0x9
	.byte	0x3e
	.uleb128 0x13
	.4byte	$LASF130
	.byte	0x7
	.byte	0x7
	.uleb128 0x11
	.4byte	$LASF131
	.byte	0x6
	.byte	0xd6
	.byte	0x5
	.4byte	0x63
	.4byte	0x8f0
	.uleb128 0x2
	.4byte	0x63
	.uleb128 0x2
	.4byte	0x8f0
	.byte	0
	.uleb128 0x4
	.4byte	0x816
	.uleb128 0x1b
	.4byte	$LASF133
	.byte	0x9
	.4byte	0x919
	.uleb128 0x2
	.4byte	0x919
	.uleb128 0x2
	.4byte	0x928
	.uleb128 0x2
	.4byte	0x93d
	.uleb128 0x2
	.4byte	0x957
	.uleb128 0x2
	.4byte	0x10e
	.byte	0
	.uleb128 0x4
	.4byte	0x923
	.uleb128 0x15
	.4byte	$LASF120
	.uleb128 0xd
	.4byte	0x91e
	.uleb128 0x4
	.4byte	0x92d
	.uleb128 0x12
	.4byte	0x93d
	.uleb128 0x2
	.4byte	0x5d2
	.uleb128 0x2
	.4byte	0x10e
	.byte	0
	.uleb128 0x4
	.4byte	0x942
	.uleb128 0x12
	.4byte	0x957
	.uleb128 0x2
	.4byte	0x822
	.uleb128 0x2
	.4byte	0x6f
	.uleb128 0x2
	.4byte	0x10e
	.byte	0
	.uleb128 0x4
	.4byte	0x95c
	.uleb128 0x10
	.4byte	0x10e
	.4byte	0x970
	.uleb128 0x2
	.4byte	0x6f
	.uleb128 0x2
	.4byte	0x10e
	.byte	0
	.uleb128 0x11
	.4byte	$LASF132
	.byte	0xa
	.byte	0x6c
	.byte	0x7
	.4byte	0x10e
	.4byte	0x986
	.uleb128 0x2
	.4byte	0x76
	.byte	0
	.uleb128 0x1b
	.4byte	$LASF134
	.byte	0xf
	.4byte	0x9a0
	.uleb128 0x2
	.4byte	0x5d2
	.uleb128 0x2
	.4byte	0x93d
	.uleb128 0x2
	.4byte	0x10e
	.byte	0
	.uleb128 0x11
	.4byte	$LASF135
	.byte	0x6
	.byte	0xe0
	.byte	0x8
	.4byte	0x76
	.4byte	0x9c5
	.uleb128 0x2
	.4byte	0x827
	.uleb128 0x2
	.4byte	0x76
	.uleb128 0x2
	.4byte	0x76
	.uleb128 0x2
	.4byte	0x8f0
	.byte	0
	.uleb128 0x2b
	.4byte	$LASF152
	.byte	0x1
	.byte	0x63
	.byte	0x5
	.4byte	0x63
	.4byte	$LFB27
	.4byte	$LFE27-$LFB27
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa56
	.uleb128 0xc
	.4byte	$LASF137
	.byte	0x64
	.byte	0x8
	.4byte	0x8c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.4byte	$LASF138
	.byte	0x65
	.byte	0x8
	.4byte	0x8c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xc
	.4byte	$LASF139
	.byte	0x66
	.byte	0x8
	.4byte	0x8c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.4byte	$LASF140
	.byte	0x67
	.byte	0x8
	.4byte	0x8c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.4byte	$LASF141
	.byte	0x68
	.byte	0x8
	.4byte	0x8c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x2c
	.4byte	$LBB5
	.4byte	$LBE5-$LBB5
	.4byte	0xa3f
	.uleb128 0x5
	.ascii "i\0"
	.byte	0x7a
	.byte	0x1b
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	$LBB6
	.4byte	$LBE6-$LBB6
	.uleb128 0x5
	.ascii "i\0"
	.byte	0x7d
	.byte	0x1b
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.byte	0
	.uleb128 0x1c
	.4byte	$LASF142
	.byte	0x5b
	.4byte	$LFB26
	.4byte	$LFE26-$LFB26
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa8f
	.uleb128 0x5
	.ascii "a\0"
	.byte	0x5c
	.byte	0xf
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x5
	.ascii "b\0"
	.byte	0x5c
	.byte	0x16
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x5
	.ascii "c\0"
	.byte	0x5c
	.byte	0x1e
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x1c
	.4byte	$LASF143
	.byte	0x53
	.4byte	$LFB25
	.4byte	$LFE25-$LFB25
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xac8
	.uleb128 0x5
	.ascii "a\0"
	.byte	0x54
	.byte	0xf
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x5
	.ascii "b\0"
	.byte	0x54
	.byte	0x16
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x5
	.ascii "c\0"
	.byte	0x54
	.byte	0x1e
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x2d
	.4byte	$LASF144
	.byte	0x1
	.byte	0x43
	.byte	0x6
	.4byte	$LFB24
	.4byte	$LFE24-$LFB24
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb28
	.uleb128 0x5
	.ascii "a\0"
	.byte	0x44
	.byte	0xf
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x5
	.ascii "b\0"
	.byte	0x44
	.byte	0x16
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x5
	.ascii "c\0"
	.byte	0x44
	.byte	0x1e
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x5
	.ascii "arr\0"
	.byte	0x45
	.byte	0x6
	.4byte	0xb28
	.uleb128 0x3
	.byte	0x91
	.sleb128 -44
	.byte	0x6
	.uleb128 0x14
	.4byte	$LBB4
	.4byte	$LBE4-$LBB4
	.uleb128 0x5
	.ascii "i\0"
	.byte	0x49
	.byte	0xa
	.4byte	0x63
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	0x63
	.4byte	0xb38
	.uleb128 0x8
	.4byte	0x6f
	.byte	0x13
	.byte	0
	.uleb128 0x16
	.4byte	$LASF147
	.byte	0x31
	.4byte	$LFB23
	.4byte	$LFE23-$LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb81
	.uleb128 0xc
	.4byte	$LASF145
	.byte	0x32
	.byte	0x22
	.4byte	0xb81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x5
	.ascii "end\0"
	.byte	0x33
	.byte	0x22
	.4byte	0xb81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	$LBB3
	.4byte	$LBE3-$LBB3
	.uleb128 0x5
	.ascii "arg\0"
	.byte	0x39
	.byte	0xb
	.4byte	0x10e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	0x842
	.uleb128 0x2e
	.4byte	$LASF153
	.byte	0x1
	.byte	0x2c
	.byte	0xe
	.4byte	0x10e
	.4byte	$LFB22
	.4byte	$LFE22-$LFB22
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbbe
	.uleb128 0x2f
	.4byte	$LASF146
	.byte	0x1
	.byte	0x2c
	.byte	0x20
	.4byte	0x6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xb
	.ascii "arg\0"
	.byte	0x2c
	.byte	0x2e
	.4byte	0x10e
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x16
	.4byte	$LASF148
	.byte	0x28
	.4byte	$LFB21
	.4byte	$LFE21-$LFB21
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbed
	.uleb128 0xb
	.ascii "f\0"
	.byte	0x28
	.byte	0x22
	.4byte	0x5d2
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xb
	.ascii "arg\0"
	.byte	0x28
	.byte	0x2b
	.4byte	0x10e
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x16
	.4byte	$LASF149
	.byte	0x1e
	.4byte	$LFB20
	.4byte	$LFE20-$LFB20
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc58
	.uleb128 0xb
	.ascii "d\0"
	.byte	0x1e
	.byte	0x1e
	.4byte	0x822
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xb
	.ascii "n\0"
	.byte	0x1e
	.byte	0x2a
	.4byte	0x6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xb
	.ascii "arg\0"
	.byte	0x1e
	.byte	0x33
	.4byte	0x10e
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x5
	.ascii "c\0"
	.byte	0x20
	.byte	0x18
	.4byte	0xc58
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x5
	.ascii "buf\0"
	.byte	0x21
	.byte	0x11
	.4byte	0xc5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x14
	.4byte	$LBB2
	.4byte	$LBE2-$LBB2
	.uleb128 0x5
	.ascii "i\0"
	.byte	0x23
	.byte	0x11
	.4byte	0x6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	0x34
	.uleb128 0x7
	.4byte	0x2d
	.4byte	0xc6d
	.uleb128 0x8
	.4byte	0x6f
	.byte	0x1
	.byte	0
	.uleb128 0x30
	.4byte	$LASF150
	.byte	0x1
	.byte	0x18
	.byte	0x1e
	.4byte	0x2f7
	.4byte	$LFB19
	.4byte	$LFE19-$LFB19
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.ascii "c\0"
	.byte	0x18
	.byte	0x33
	.4byte	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xb
	.ascii "buf\0"
	.byte	0x18
	.byte	0x44
	.4byte	0x2f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
$Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
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
	.uleb128 0x2
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 10
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.sleb128 38
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.sleb128 13
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x24
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x2c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x2f
	.uleb128 0x5
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
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x7
	.4byte	$LASF1
	.4byte	$LASF154
	.4byte	$LASF155
	.4byte	$LASF156
	.4byte	$LASF157
	.4byte	$LASF158
	.4byte	$LASF159
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
	.4byte	$LASF160
	.byte	0x5
	.4byte	$LASF161
	.byte	0x3
	.4byte	$LASF162
	.byte	0x3
	.4byte	$LASF163
	.byte	0x3
	.4byte	$LASF164
	.byte	0x4
	.4byte	$LASF165
	.byte	0x2
	.4byte	$LASF166
	.byte	0x6
	.4byte	$LASF167
	.byte	0x1
	.4byte	$LASF168
	.byte	0x4
$LELTP0:
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM1
	.byte	0x2e
	.byte	0x5
	.uleb128 0x4b
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM2
	.byte	0x18
	.byte	0x5
	.uleb128 0xe
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM3
	.byte	0x1
	.byte	0x5
	.uleb128 0x13
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM4
	.byte	0x1
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM5
	.byte	0x18
	.byte	0x5
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM6
	.byte	0x1
	.byte	0x5
	.uleb128 0x1a
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM7
	.byte	0x1
	.byte	0x5
	.uleb128 0x6
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM8
	.byte	0x1
	.byte	0x5
	.uleb128 0x1a
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM9
	.byte	0x1
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM10
	.byte	0x18
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM11
	.byte	0x18
	.byte	0x5
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM12
	.byte	0x19
	.byte	0x5
	.uleb128 0x37
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM13
	.byte	0x1
	.byte	0x5
	.uleb128 0x37
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM14
	.byte	0x19
	.byte	0x5
	.uleb128 0x18
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM15
	.byte	0x1a
	.byte	0x5
	.uleb128 0x11
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
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x18
	.byte	0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM18
	.byte	0x1
	.byte	0x5
	.uleb128 0xd
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM19
	.byte	0x1
	.byte	0x5
	.uleb128 0x32
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM20
	.byte	0x1
	.byte	0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM21
	.byte	0x16
	.byte	0x5
	.uleb128 0x1f
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM22
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0x1a
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM23
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x1a
	.byte	0x5
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM24
	.byte	0x19
	.byte	0x5
	.uleb128 0x2f
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM25
	.byte	0x1
	.byte	0x5
	.uleb128 0x2f
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM26
	.byte	0x18
	.byte	0x5
	.uleb128 0x3
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM27
	.byte	0x18
	.byte	0x5
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM28
	.byte	0x19
	.byte	0x5
	.uleb128 0x32
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM29
	.byte	0x1
	.byte	0x5
	.uleb128 0x32
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM30
	.byte	0x19
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM31
	.byte	0x18
	.byte	0x5
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM32
	.byte	0x19
	.byte	0x5
	.uleb128 0x21
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM33
	.byte	0x1
	.byte	0x5
	.uleb128 0x21
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM34
	.byte	0x18
	.byte	0x5
	.uleb128 0x22
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM35
	.byte	0x18
	.byte	0x5
	.uleb128 0x22
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM36
	.byte	0x1a
	.byte	0x5
	.uleb128 0x3
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM37
	.byte	0x19
	.byte	0x5
	.uleb128 0x9
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM38
	.byte	0x18
	.byte	0x5
	.uleb128 0xb
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM39
	.byte	0x18
	.byte	0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM40
	.byte	0x18
	.byte	0x5
	.uleb128 0x12
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM41
	.byte	0x1
	.byte	0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM42
	.byte	0x18
	.byte	0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM43
	.byte	0x13
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM44
	.byte	0x1d
	.byte	0x5
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM45
	.byte	0x1c
	.byte	0x5
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM46
	.byte	0x1
	.byte	0x5
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM47
	.byte	0x18
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM48
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM49
	.byte	0x18
	.byte	0x5
	.uleb128 0x6
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM50
	.byte	0x19
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM51
	.byte	0x1
	.byte	0x5
	.uleb128 0x4
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM52
	.byte	0x19
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM53
	.byte	0x1
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM54
	.byte	0x18
	.byte	0x5
	.uleb128 0xc
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM55
	.byte	0x1
	.byte	0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM56
	.byte	0x18
	.byte	0x5
	.uleb128 0xb
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM57
	.byte	0x1a
	.byte	0x5
	.uleb128 0xb
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM58
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x2
	.byte	0x12
	.byte	0x5
	.uleb128 0x1a
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM59
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0x13
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM60
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x1f
	.byte	0x5
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM61
	.byte	0x19
	.byte	0x5
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM62
	.byte	0x1
	.byte	0x5
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM63
	.byte	0x18
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM64
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM65
	.byte	0x19
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM66
	.byte	0x1
	.byte	0x5
	.uleb128 0x4
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM67
	.byte	0x19
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM68
	.byte	0x18
	.byte	0x5
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM69
	.byte	0x19
	.byte	0x5
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM70
	.byte	0x1
	.byte	0x5
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM71
	.byte	0x18
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM72
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM73
	.byte	0x19
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM74
	.byte	0x1
	.byte	0x5
	.uleb128 0x4
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM75
	.byte	0x19
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM76
	.byte	0x18
	.byte	0x5
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM77
	.byte	0x19
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM78
	.byte	0x1
	.byte	0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM79
	.byte	0x18
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM80
	.byte	0x18
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM81
	.byte	0x18
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM82
	.byte	0x18
	.byte	0x5
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM83
	.byte	0x1b
	.byte	0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM84
	.byte	0x18
	.byte	0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM85
	.byte	0x19
	.byte	0x5
	.uleb128 0xe
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM86
	.byte	0x1a
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM87
	.byte	0x19
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM88
	.byte	0x19
	.byte	0x5
	.uleb128 0x2
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM89
	.byte	0x1a
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM90
	.byte	0x19
	.byte	0x5
	.uleb128 0x1b
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM91
	.byte	0x1
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM92
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x1
	.byte	0x5
	.uleb128 0x30
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM93
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM94
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x18
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM95
	.byte	0x19
	.byte	0x5
	.uleb128 0x1b
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM96
	.byte	0x1
	.byte	0x5
	.uleb128 0xa
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM97
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x1
	.byte	0x5
	.uleb128 0x30
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM98
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	$LM99
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x12
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
$LASF72:
	.ascii "_misc\0"
$LASF122:
	.ascii "__gcov_info_start\0"
$LASF123:
	.ascii "__gcov_info_end\0"
$LASF39:
	.ascii "_on_exit_args\0"
$LASF81:
	.ascii "_write\0"
$LASF109:
	.ascii "_wctomb_state\0"
$LASF134:
	.ascii "__gcov_filename_to_gcfn\0"
$LASF65:
	.ascii "_r48\0"
$LASF150:
	.ascii "encode\0"
$LASF73:
	.ascii "_signal_buf\0"
$LASF10:
	.ascii "unsigned int\0"
$LASF77:
	.ascii "_lbfsize\0"
$LASF75:
	.ascii "_flags\0"
$LASF118:
	.ascii "FILE\0"
$LASF52:
	.ascii "_errno\0"
$LASF22:
	.ascii "_LOCK_RECURSIVE_T\0"
$LASF131:
	.ascii "fputc\0"
$LASF80:
	.ascii "_read\0"
$LASF113:
	.ascii "_mbrlen_state\0"
$LASF140:
	.ascii "val0\0"
$LASF139:
	.ascii "val1\0"
$LASF138:
	.ascii "val2\0"
$LASF137:
	.ascii "val3\0"
$LASF54:
	.ascii "_stdout\0"
$LASF15:
	.ascii "_fpos_t\0"
$LASF46:
	.ascii "_fns\0"
$LASF79:
	.ascii "_cookie\0"
$LASF142:
	.ascii "my_func_1\0"
$LASF143:
	.ascii "my_func_2\0"
$LASF144:
	.ascii "my_func_3\0"
$LASF28:
	.ascii "_Bigint\0"
$LASF36:
	.ascii "__tm_wday\0"
$LASF102:
	.ascii "_result\0"
$LASF32:
	.ascii "__tm_hour\0"
$LASF125:
	.ascii "led_set\0"
$LASF18:
	.ascii "__count\0"
$LASF133:
	.ascii "__gcov_info_to_gcda\0"
$LASF128:
	.ascii "float\0"
$LASF31:
	.ascii "__tm_min\0"
$LASF121:
	.ascii "_impure_ptr\0"
$LASF71:
	.ascii "__sf\0"
$LASF96:
	.ascii "_rand48\0"
$LASF103:
	.ascii "_result_k\0"
$LASF9:
	.ascii "long long unsigned int\0"
$LASF67:
	.ascii "_asctime_buf\0"
$LASF74:
	.ascii "__sFILE\0"
$LASF27:
	.ascii "_wds\0"
$LASF124:
	.ascii "led_clear\0"
$LASF92:
	.ascii "__FILE\0"
$LASF87:
	.ascii "_offset\0"
$LASF57:
	.ascii "_emergency\0"
$LASF12:
	.ascii "size_t\0"
$LASF30:
	.ascii "__tm_sec\0"
$LASF37:
	.ascii "__tm_yday\0"
$LASF56:
	.ascii "_inc\0"
$LASF45:
	.ascii "_ind\0"
$LASF24:
	.ascii "_next\0"
$LASF115:
	.ascii "_mbsrtowcs_state\0"
$LASF130:
	.ascii "led_init\0"
$LASF19:
	.ascii "__value\0"
$LASF104:
	.ascii "_p5s\0"
$LASF117:
	.ascii "_wcsrtombs_state\0"
$LASF108:
	.ascii "_mblen_state\0"
$LASF91:
	.ascii "char\0"
$LASF33:
	.ascii "__tm_mday\0"
$LASF68:
	.ascii "_sig_func\0"
$LASF114:
	.ascii "_mbrtowc_state\0"
$LASF148:
	.ascii "filename\0"
$LASF23:
	.ascii "_flock_t\0"
$LASF16:
	.ascii "__wch\0"
$LASF95:
	.ascii "_iobs\0"
$LASF47:
	.ascii "_on_exit_args_ptr\0"
$LASF83:
	.ascii "_close\0"
$LASF58:
	.ascii "__sdidinit\0"
$LASF53:
	.ascii "_stdin\0"
$LASF62:
	.ascii "_gamma_signgam\0"
$LASF8:
	.ascii "long long int\0"
$LASF147:
	.ascii "dump_gcov_info\0"
$LASF49:
	.ascii "_base\0"
$LASF127:
	.ascii "asm_rms\0"
$LASF105:
	.ascii "_freelist\0"
$LASF98:
	.ascii "_mult\0"
$LASF21:
	.ascii "__ULong\0"
$LASF116:
	.ascii "_wcrtomb_state\0"
$LASF76:
	.ascii "_file\0"
$LASF61:
	.ascii "__cleanup\0"
$LASF20:
	.ascii "_mbstate_t\0"
$LASF101:
	.ascii "_mprec\0"
$LASF38:
	.ascii "__tm_isdst\0"
$LASF141:
	.ascii "my_result\0"
$LASF145:
	.ascii "info\0"
$LASF126:
	.ascii "printf_\0"
$LASF34:
	.ascii "__tm_mon\0"
$LASF11:
	.ascii "long double\0"
$LASF152:
	.ascii "main\0"
$LASF69:
	.ascii "_atexit0\0"
$LASF44:
	.ascii "_atexit\0"
$LASF89:
	.ascii "_mbstate\0"
$LASF4:
	.ascii "short int\0"
$LASF129:
	.ascii "uart_init\0"
$LASF6:
	.ascii "long int\0"
$LASF146:
	.ascii "length\0"
$LASF136:
	.ascii "char_a\0"
$LASF26:
	.ascii "_sign\0"
$LASF78:
	.ascii "_data\0"
$LASF17:
	.ascii "__wchb\0"
$LASF35:
	.ascii "__tm_year\0"
$LASF106:
	.ascii "_misc_reent\0"
$LASF66:
	.ascii "_localtime_buf\0"
$LASF63:
	.ascii "_cvtlen\0"
$LASF25:
	.ascii "_maxwds\0"
$LASF111:
	.ascii "_l64a_buf\0"
$LASF86:
	.ascii "_blksize\0"
$LASF29:
	.ascii "__tm\0"
$LASF88:
	.ascii "_lock\0"
$LASF7:
	.ascii "long unsigned int\0"
$LASF94:
	.ascii "_niobs\0"
$LASF13:
	.ascii "wint_t\0"
$LASF41:
	.ascii "_dso_handle\0"
$LASF64:
	.ascii "_cvtbuf\0"
$LASF3:
	.ascii "unsigned char\0"
$LASF112:
	.ascii "_getdate_err\0"
$LASF99:
	.ascii "_add\0"
$LASF153:
	.ascii "allocate\0"
$LASF48:
	.ascii "__sbuf\0"
$LASF151:
	.ascii "GNU C17 11.2.0 -mhard-float -mxl-float-convert -mxl-float-sqrt -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v11.0 -mno-xl-soft-mul -g -O0 -fprofile-info-section -fprofile-arcs -ftest-coverage -fstack-usage -fcallgraph-info -fcallgraph-info=su -fcallgraph-info=da -fstack-check=specific\0"
$LASF93:
	.ascii "_glue\0"
$LASF132:
	.ascii "malloc\0"
$LASF70:
	.ascii "__sglue\0"
$LASF135:
	.ascii "fwrite\0"
$LASF107:
	.ascii "_strtok_last\0"
$LASF110:
	.ascii "_mbtowc_state\0"
$LASF120:
	.ascii "gcov_info\0"
$LASF60:
	.ascii "_locale\0"
$LASF40:
	.ascii "_fnargs\0"
$LASF2:
	.ascii "signed char\0"
$LASF51:
	.ascii "_reent\0"
$LASF5:
	.ascii "short unsigned int\0"
$LASF149:
	.ascii "dump\0"
$LASF42:
	.ascii "_fntypes\0"
$LASF50:
	.ascii "_size\0"
$LASF14:
	.ascii "_off_t\0"
$LASF85:
	.ascii "_nbuf\0"
$LASF59:
	.ascii "_unspecified_locale_info\0"
$LASF90:
	.ascii "_flags2\0"
$LASF43:
	.ascii "_is_cxa\0"
$LASF97:
	.ascii "_seed\0"
$LASF100:
	.ascii "_rand_next\0"
$LASF119:
	.ascii "__locale_t\0"
$LASF82:
	.ascii "_seek\0"
$LASF55:
	.ascii "_stderr\0"
$LASF84:
	.ascii "_ubuf\0"
	.section	.debug_line_str,"MS",@progbits,1
$LASF157:
	.ascii "/home/lbogdanov/programs/xilinx/Vitis/2022.2/gnu/microblaze/lin/microblazeeb-xilinx-elf/usr/include\0"
$LASF159:
	.ascii "print\0"
$LASF167:
	.ascii "uart.h\0"
$LASF158:
	.ascii "/home/lbogdanov/programs/xilinx/Vitis/2022.2/gnu/microblaze/lin/x86_64-oesdk-linux/usr/lib/microblaze-xilinx-elf/gcc/microblaze-xilinx-elf/11.2.0/include\0"
$LASF165:
	.ascii "led.h\0"
$LASF163:
	.ascii "lock.h\0"
$LASF166:
	.ascii "print.h\0"
$LASF1:
	.ascii "/home/lbogdanov/workspaces/xilinx_workspace/20_e\0"
$LASF154:
	.ascii "uart\0"
$LASF0:
	.ascii "main.c\0"
$LASF162:
	.ascii "reent.h\0"
$LASF155:
	.ascii "led\0"
$LASF156:
	.ascii "/home/lbogdanov/programs/xilinx/Vitis/2022.2/gnu/microblaze/lin/microblazeeb-xilinx-elf/usr/include/sys\0"
$LASF161:
	.ascii "_types.h\0"
$LASF160:
	.ascii "stddef.h\0"
$LASF164:
	.ascii "stdio.h\0"
$LASF168:
	.ascii "stdlib.h\0"
