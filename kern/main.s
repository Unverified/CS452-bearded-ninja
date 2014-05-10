	.file	"main.c"
	.global	running
	.bss
	.align	2
	.type	running, %object
	.size	running, 4
running:
	.space	4
	.global	print_label
	.align	2
	.type	print_label, %object
	.size	print_label, 4
print_label:
	.space	4
	.global	arg
	.align	2
	.type	arg, %object
	.size	arg, 20
arg:
	.space	20
	.global	switch_index
	.align	2
	.type	switch_index, %object
	.size	switch_index, 4
switch_index:
	.space	4
	.global	switches
	.align	2
	.type	switches, %object
	.size	switches, 40
switches:
	.space	40
	.text
	.align	2
	.global	inc_switchread
	.type	inc_switchread, %function
inc_switchread:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L7
.L6:
	add	sl, pc, sl
	ldr	r3, .L7+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #9
	bne	.L2
	ldr	r3, .L7+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	mvn	r3, #0
	str	r3, [fp, #-20]
	b	.L4
.L2:
	ldr	r3, .L7+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L7+4
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-20]
.L4:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L8:
	.align	2
.L7:
	.word	_GLOBAL_OFFSET_TABLE_-(.L6+8)
	.word	switch_index(GOT)
	.size	inc_switchread, .-inc_switchread
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Booting up NIK OS (R) V0.0.123b alpha beta\012\015\000"
	.align	2
.LC1:
	.ascii	"Setting up Clock\012\000"
	.align	2
.LC2:
	.ascii	"clock setup success!!!!\012\000"
	.align	2
.LC3:
	.ascii	"Setting up Trainset\012\000"
	.align	2
.LC4:
	.ascii	"Train Setup Success!!!!\012\000"
	.text
	.align	2
	.global	init
	.type	init, %function
init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L21
.L20:
	add	sl, pc, sl
	bl	io_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L10
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L12
.L10:
	bl	bwcls(PLT)
	mov	r0, #0
	mov	r1, #0
	bl	bwsetpos(PLT)
	mov	r0, #1
	ldr	r3, .L21+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L21+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	clock_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L13
	mov	r3, #2
	str	r3, [fp, #-28]
	b	.L12
.L13:
	mov	r0, #1
	ldr	r3, .L21+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L21+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	train_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L21+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	term_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L15
	mov	r3, #3
	str	r3, [fp, #-28]
	b	.L12
.L15:
	ldr	r3, .L21+24
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r0, #0
	mov	r1, #133
	bl	bwputc(PLT)
.L17:
	ldr	r3, .L21+24
	ldr	r3, [sl, r3]
	ldr	r4, [r3, #0]
	mov	r0, #0
	bl	bwgetc(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L21+28
	ldr	r3, [sl, r3]
	str	r2, [r3, r4, asl #2]
	bl	inc_switchread(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L17
	ldr	r3, .L21+32
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, .L21+36
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-28]
.L12:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, sl, fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	_GLOBAL_OFFSET_TABLE_-(.L20+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	switch_index(GOT)
	.word	switches(GOT)
	.word	running(GOT)
	.word	print_label(GOT)
	.size	init, .-init
	.section	.rodata
	.align	2
.LC5:
	.ascii	"REVERSE %d\012\000"
	.align	2
.LC6:
	.ascii	"SHUTTING DOWN\012\000"
	.align	2
.LC7:
	.ascii	"UNKNOWN COMMAND\012\000"
	.text
	.align	2
	.global	run_command
	.type	run_command, %function
run_command:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L35
.L34:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, .L35+4
	ldr	r3, [sl, r3]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	parse_command(PLT)
	mov	r3, r0
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L24
	.p2align 2
.L30:
	b	.L31
	b	.L26
	b	.L27
	b	.L28
	b	.L29
.L26:
	ldr	r3, .L35+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, .L35+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #4]
	mov	r0, r2
	mov	r1, r3
	bl	train_setspeed(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L32
.L27:
	ldr	r3, .L35+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, .L35+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #4]
	mov	r0, r2
	mov	r1, r3
	bl	train_setgate(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L32
.L28:
	ldr	r3, .L35+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L35+8
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	bl	printf(PLT)
	b	.L31
.L29:
	ldr	r3, .L35+12
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L35+16
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L35+20
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	b	.L31
.L24:
	ldr	r3, .L35+24
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
.L31:
	mov	r3, #0
	str	r3, [fp, #-24]
.L32:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L36:
	.align	2
.L35:
	.word	_GLOBAL_OFFSET_TABLE_-(.L34+8)
	.word	arg(GOT)
	.word	.LC5(GOTOFF)
	.word	running(GOT)
	.word	print_label(GOT)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.size	run_command, .-run_command
	.align	2
	.global	getSwitchName
	.type	getSwitchName, %function
getSwitchName:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-20]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L38
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	str	r3, [fp, #-16]
	b	.L40
.L38:
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-16]
.L40:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #8
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L41
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L43
.L41:
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	bgt	.L44
	ldr	r3, [fp, #-16]
	orr	r3, r3, #65
	str	r3, [fp, #-16]
	b	.L46
.L44:
	ldr	r3, [fp, #-20]
	cmp	r3, #3
	bgt	.L47
	ldr	r3, [fp, #-16]
	orr	r3, r3, #66
	str	r3, [fp, #-16]
	b	.L46
.L47:
	ldr	r3, [fp, #-20]
	cmp	r3, #5
	bgt	.L49
	ldr	r3, [fp, #-16]
	orr	r3, r3, #67
	str	r3, [fp, #-16]
	b	.L46
.L49:
	ldr	r3, [fp, #-20]
	cmp	r3, #7
	bgt	.L51
	ldr	r3, [fp, #-16]
	orr	r3, r3, #68
	str	r3, [fp, #-16]
	b	.L46
.L51:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	bgt	.L46
	ldr	r3, [fp, #-16]
	orr	r3, r3, #69
	str	r3, [fp, #-16]
.L46:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-28]
.L43:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	getSwitchName, .-getSwitchName
	.section	.rodata
	.align	2
.LC8:
	.ascii	"%c %d \000"
	.align	2
.LC9:
	.ascii	"%d \000"
	.align	2
.LC10:
	.ascii	"%d %d %d\012\015\000"
	.align	2
.LC11:
	.ascii	"TERM> \000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 124
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #124
	ldr	sl, .L93
.L92:
	add	sl, pc, sl
	str	r0, [fp, #-128]
	str	r1, [fp, #-132]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L56
.L57:
	ldr	r3, [fp, #-32]
	mvn	r2, #103
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L56:
	ldr	r3, [fp, #-32]
	cmp	r3, #75
	bls	.L57
	bl	init(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L91
	ldr	r1, [fp, #-24]
	str	r1, [fp, #-140]
	b	.L61
.L63:
	bl	io_poll(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asr #2
	cmp	r3, #0
	beq	.L64
	sub	r3, fp, #121
	mov	r0, r3
	bl	getc(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L66
	ldrb	r3, [fp, #-121]	@ zero_extendqisi2
	cmp	r3, #27
	beq	.L66
	ldrb	r3, [fp, #-121]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
	ldr	r3, [fp, #-28]
	ldrb	r1, [fp, #-121]	@ zero_extendqisi2
	mvn	r2, #103
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, r1
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-121]	@ zero_extendqisi2
	str	r3, [fp, #-136]
	ldr	r1, [fp, #-136]
	cmp	r1, #8
	beq	.L69
	ldr	r3, [fp, #-136]
	cmp	r3, #13
	beq	.L70
	b	.L66
.L69:
	mov	r0, #32
	bl	putc(PLT)
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L66
	mov	r0, #8
	bl	putc(PLT)
	ldr	r3, [fp, #-28]
	sub	r3, r3, #2
	str	r3, [fp, #-28]
	b	.L66
.L70:
	ldr	r3, .L93+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	mvn	r2, #103
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	sub	r3, fp, #120
	mov	r0, r3
	bl	run_command(PLT)
	mov	r3, #0
	str	r3, [fp, #-28]
.L66:
	ldr	r3, [fp, #-28]
	cmp	r3, #75
	bne	.L64
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	mov	r0, #8
	bl	putc(PLT)
.L64:
	ldr	r3, [fp, #-24]
	and	r3, r3, #3
	cmp	r3, #0
	beq	.L73
	sub	r3, fp, #121
	mov	r0, r3
	bl	gettrain(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L73
	bl	savecur(PLT)
	ldr	r3, .L93+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L93+12
	ldr	r3, [sl, r3]
	ldr	r2, [r3, r2, asl #2]
	ldrb	r3, [fp, #-121]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L76
	mov	r3, #1
	str	r3, [fp, #-20]
	mov	r0, #7
	mov	r1, #4
	bl	setpos(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
	mov	r3, #128
	str	r3, [fp, #-20]
	b	.L78
.L79:
	ldrb	r3, [fp, #-121]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	and	r3, r2, r3
	mov	r1, r3
	ldr	r3, .L93+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L93+12
	ldr	r3, [sl, r3]
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-20]
	and	r3, r2, r3
	cmp	r1, r3
	bls	.L80
	ldr	r3, .L93+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #1
	add	r1, r3, #65
	ldr	r3, .L93+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	and	r3, r3, #1
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, .L93+16
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
.L80:
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asr #1
	str	r3, [fp, #-20]
.L78:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L79
	ldr	r3, .L93+8
	ldr	r3, [sl, r3]
	ldr	r1, [r3, #0]
	ldrb	r3, [fp, #-121]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L93+12
	ldr	r3, [sl, r3]
	str	r2, [r3, r1, asl #2]
.L76:
	bl	inc_switchread(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L83
	mov	r0, #8
	mov	r1, #4
	bl	setpos(PLT)
.L85:
	ldr	r3, .L93+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L93+12
	ldr	r3, [sl, r3]
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, .L93+20
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	bl	printf(PLT)
	bl	inc_switchread(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L85
.L83:
	bl	loadcur(PLT)
.L73:
	bl	clock_poll(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	ble	.L86
	sub	r3, fp, #40
	sub	r2, fp, #36
	sub	ip, fp, #44
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	clock_get(PLT)
	bl	savecur(PLT)
	mov	r0, #0
	mov	r1, #0
	bl	setpos(PLT)
	ldr	r2, [fp, #-40]
	ldr	ip, [fp, #-36]
	ldr	lr, [fp, #-44]
	ldr	r3, .L93+24
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	mov	r3, lr
	bl	printf(PLT)
	bl	loadcur(PLT)
	bl	train_askdump(PLT)
.L86:
	ldr	r3, .L93+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L62
	ldr	r3, .L93+28
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	ldr	r3, .L93+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
.L62:
.L91:
	ldr	r3, .L93+32
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L63
	bl	term_destroy(PLT)
	mov	r1, #0
	str	r1, [fp, #-140]
.L61:
	ldr	r3, [fp, #-140]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L94:
	.align	2
.L93:
	.word	_GLOBAL_OFFSET_TABLE_-(.L92+8)
	.word	print_label(GOT)
	.word	switch_index(GOT)
	.word	switches(GOT)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	running(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
