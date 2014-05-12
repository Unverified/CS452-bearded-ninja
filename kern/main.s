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
	.global	switch_head
	.align	2
	.type	switch_head, %object
	.size	switch_head, 4
switch_head:
	.space	4
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
	.align	2
	.global	inc_switchstore
	.type	inc_switchstore, %function
inc_switchstore:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L15
.L14:
	add	sl, pc, sl
	ldr	r3, .L15+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #13
	bne	.L10
	ldr	r3, .L15+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L15+4
	ldr	r3, [sl, r3]
	ldr	r1, [r3, #0]
	ldr	r3, .L15+8
	ldr	r2, [sl, r3]
	mov	r3, #0
	strb	r3, [r2, r1, asl #3]
	mvn	r3, #0
	str	r3, [fp, #-20]
	b	.L12
.L10:
	ldr	r3, .L15+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L15+4
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L15+4
	ldr	r3, [sl, r3]
	ldr	r1, [r3, #0]
	ldr	r3, .L15+8
	ldr	r2, [sl, r3]
	mov	r3, #0
	strb	r3, [r2, r1, asl #3]
	mov	r3, #0
	str	r3, [fp, #-20]
.L12:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L16:
	.align	2
.L15:
	.word	_GLOBAL_OFFSET_TABLE_-(.L14+8)
	.word	switch_head(GOT)
	.word	trippedSwitches(GOT)
	.size	inc_switchstore, .-inc_switchstore
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L32
.L31:
	add	sl, pc, sl
	bl	io_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L18
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L20
.L18:
	bl	bwcls(PLT)
	mov	r0, #0
	mov	r1, #0
	bl	bwsetpos(PLT)
	mov	r0, #1
	ldr	r3, .L32+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L32+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	clock_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L21
	mov	r3, #2
	str	r3, [fp, #-36]
	b	.L20
.L21:
	mov	r0, #1
	ldr	r3, .L32+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L32+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	train_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L32+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	term_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L23
	mov	r3, #3
	str	r3, [fp, #-36]
	b	.L20
.L23:
	sub	r3, fp, #29
	mov	r0, r3
	bl	gettrain(PLT)
	ldr	r3, .L32+24
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L32+28
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r0, #0
	mov	r1, #133
	bl	bwputc(PLT)
.L25:
	ldr	r3, .L32+24
	ldr	r3, [sl, r3]
	ldr	r4, [r3, #0]
	mov	r0, #0
	bl	bwgetc(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L32+32
	ldr	r3, [sl, r3]
	str	r2, [r3, r4, asl #2]
	bl	inc_switchread(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L25
	ldr	r3, .L32+36
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, .L32+40
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L27
.L28:
	ldr	r1, [fp, #-28]
	ldr	r3, .L32+44
	ldr	r2, [sl, r3]
	mov	r3, #0
	strb	r3, [r2, r1, asl #3]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L27:
	ldr	r3, [fp, #-28]
	cmp	r3, #13
	ble	.L28
	mov	r3, #0
	str	r3, [fp, #-36]
.L20:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp, {r4, sl, fp, sp, pc}
.L33:
	.align	2
.L32:
	.word	_GLOBAL_OFFSET_TABLE_-(.L31+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	switch_index(GOT)
	.word	switch_head(GOT)
	.word	switches(GOT)
	.word	running(GOT)
	.word	print_label(GOT)
	.word	trippedSwitches(GOT)
	.size	init, .-init
	.section	.rodata
	.align	2
.LC5:
	.ascii	"SHUTTING DOWN\012\000"
	.align	2
.LC6:
	.ascii	"UNKNOWN COMMAND:\012\000"
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
	ldr	sl, .L46
.L45:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, .L46+4
	ldr	r3, [sl, r3]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	parse_command(PLT)
	mov	r3, r0
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L35
	.p2align 2
.L41:
	b	.L42
	b	.L37
	b	.L38
	b	.L39
	b	.L40
.L37:
	ldr	r3, .L46+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, .L46+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #4]
	mov	r0, r2
	mov	r1, r3
	bl	train_setspeed(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L43
.L38:
	ldr	r3, .L46+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, .L46+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #4]
	mov	r0, r2
	mov	r1, r3
	bl	train_setgate(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L43
.L39:
	ldr	r3, .L46+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	train_reverse(PLT)
	b	.L42
.L40:
	ldr	r3, .L46+8
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L46+12
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L46+16
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	b	.L42
.L35:
	ldr	r3, .L46+20
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	ldr	r0, [fp, #-20]
	bl	printf(PLT)
.L42:
	mov	r3, #0
	str	r3, [fp, #-24]
.L43:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L47:
	.align	2
.L46:
	.word	_GLOBAL_OFFSET_TABLE_-(.L45+8)
	.word	arg(GOT)
	.word	running(GOT)
	.word	print_label(GOT)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
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
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	blt	.L49
	ldr	r3, [fp, #-16]
	cmp	r3, #10
	ble	.L51
.L49:
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L52
.L51:
	ldr	r2, [fp, #-16]
	mov	r3, r2, lsr #31
	add	r3, r3, r2
	mov	r3, r3, asr #1
	and	r3, r3, #255
	add	r3, r3, #65
	and	r3, r3, #255
	and	r3, r3, #255
	ldr	r2, [fp, #-24]
	strb	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #31
	add	r3, r2, r1
	and	r3, r3, #1
	rsb	r3, r1, r3
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #4]
	mov	r3, #0
	str	r3, [fp, #-28]
.L52:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	getSwitchName, .-getSwitchName
	.section	.rodata
	.align	2
.LC7:
	.ascii	"%c0%d\000"
	.align	2
.LC8:
	.ascii	"%c%d\000"
	.text
	.align	2
	.global	printSwitchName
	.type	printSwitchName, %function
printSwitchName:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L60
.L59:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r3, #9
	bhi	.L55
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #4]
	ldr	r3, .L60+4
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	b	.L57
.L55:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #4]
	ldr	r3, .L60+8
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
.L57:
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L61:
	.align	2
.L60:
	.word	_GLOBAL_OFFSET_TABLE_-(.L59+8)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.size	printSwitchName, .-printSwitchName
	.align	2
	.global	printTrippedSwitchs
	.type	printTrippedSwitchs, %function
printTrippedSwitchs:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L70
.L69:
	add	sl, pc, sl
	ldr	r3, .L70+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L63:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L64
	mov	r3, #13
	str	r3, [fp, #-20]
.L64:
	ldr	r2, [fp, #-20]
	ldr	r3, .L70+8
	ldr	r3, [sl, r3]
	ldrb	r3, [r3, r2, asl #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L68
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, .L70+8
	ldr	r3, [sl, r3]
	add	r3, r2, r3
	mov	r0, r3
	bl	printSwitchName(PLT)
	mov	r0, #32
	bl	putc(PLT)
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L63
.L68:
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L71:
	.align	2
.L70:
	.word	_GLOBAL_OFFSET_TABLE_-(.L69+8)
	.word	switch_head(GOT)
	.word	trippedSwitches(GOT)
	.size	printTrippedSwitchs, .-printTrippedSwitchs
	.section	.rodata
	.align	2
.LC9:
	.ascii	"%d:%d.%d\000"
	.align	2
.LC10:
	.ascii	"TERM> \000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 132
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #132
	ldr	sl, .L114
.L113:
	add	sl, pc, sl
	str	r0, [fp, #-136]
	str	r1, [fp, #-140]
	mov	r3, #0
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #1
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L73
.L74:
	ldr	r3, [fp, #-40]
	mvn	r2, #115
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L73:
	ldr	r3, [fp, #-40]
	cmp	r3, #75
	bls	.L74
	bl	init(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L112
	ldr	r1, [fp, #-24]
	str	r1, [fp, #-148]
	b	.L78
.L80:
	bl	io_poll(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asr #2
	cmp	r3, #0
	beq	.L81
	sub	r3, fp, #41
	mov	r0, r3
	bl	getc(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L81
	ldrb	r3, [fp, #-41]	@ zero_extendqisi2
	cmp	r3, #27
	beq	.L81
	ldrb	r3, [fp, #-41]	@ zero_extendqisi2
	str	r3, [fp, #-144]
	ldr	r3, [fp, #-144]
	cmp	r3, #8
	beq	.L86
	ldr	r0, [fp, #-144]
	cmp	r0, #13
	beq	.L87
	b	.L85
.L86:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L81
	mov	r0, #8
	bl	putc(PLT)
	mov	r0, #32
	bl	putc(PLT)
	mov	r0, #8
	bl	putc(PLT)
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	mvn	r2, #115
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	b	.L81
.L87:
	ldrb	r3, [fp, #-41]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
	ldr	r3, [fp, #-36]
	ldrb	r1, [fp, #-41]	@ zero_extendqisi2
	mvn	r2, #115
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, r1
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, .L114+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	mvn	r2, #115
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	sub	r3, fp, #132
	mov	r0, r3
	bl	run_command(PLT)
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L81
.L85:
	ldr	r3, [fp, #-36]
	cmp	r3, #74
	bne	.L89
	mov	r0, #8
	bl	putc(PLT)
	b	.L91
.L89:
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L91:
	ldrb	r3, [fp, #-41]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	ldrb	r1, [fp, #-41]	@ zero_extendqisi2
	mvn	r2, #115
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, r1
	strb	r3, [r2, #0]
.L81:
	ldr	r3, [fp, #-24]
	and	r3, r3, #3
	cmp	r3, #0
	beq	.L92
	sub	r3, fp, #41
	mov	r0, r3
	bl	gettrain(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L92
	bl	savecur(PLT)
	ldr	r3, .L114+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L114+12
	ldr	r3, [sl, r3]
	ldr	r2, [r3, r2, asl #2]
	ldrb	r3, [fp, #-41]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L95
	mov	r3, #1
	str	r3, [fp, #-40]
	mov	r3, #128
	str	r3, [fp, #-20]
	b	.L97
.L98:
	ldrb	r3, [fp, #-41]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	and	r3, r2, r3
	mov	r1, r3
	ldr	r3, .L114+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L114+12
	ldr	r3, [sl, r3]
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-20]
	and	r3, r2, r3
	cmp	r1, r3
	bls	.L99
	ldr	r3, .L114+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r1, r3
	ldr	ip, [fp, #-40]
	ldr	r3, .L114+16
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, .L114+20
	ldr	r3, [sl, r3]
	add	r3, r2, r3
	mov	r0, r1
	mov	r1, ip
	mov	r2, r3
	bl	getSwitchName(PLT)
	bl	inc_switchstore(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
.L99:
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asr #1
	str	r3, [fp, #-20]
.L97:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L98
	ldr	r3, .L114+8
	ldr	r3, [sl, r3]
	ldr	r1, [r3, #0]
	ldrb	r3, [fp, #-41]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L114+12
	ldr	r3, [sl, r3]
	str	r2, [r3, r1, asl #2]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L95
	mov	r0, #9
	mov	r1, #6
	bl	setpos(PLT)
	bl	printTrippedSwitchs(PLT)
	mov	r3, #0
	str	r3, [fp, #-32]
.L95:
	bl	inc_switchread(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L103
	mov	r3, #1
	str	r3, [fp, #-28]
.L103:
	bl	loadcur(PLT)
.L92:
	bl	clock_poll(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	ble	.L105
	sub	r3, fp, #52
	sub	r2, fp, #48
	sub	ip, fp, #56
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	clock_get(PLT)
	bl	savecur(PLT)
	mov	r0, #0
	mov	r1, #7
	bl	setpos(PLT)
	ldr	r2, [fp, #-52]
	ldr	ip, [fp, #-48]
	ldr	lr, [fp, #-56]
	ldr	r3, .L114+24
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	mov	r3, lr
	bl	printf(PLT)
	bl	loadcur(PLT)
	bl	train_poll(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
.L105:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L107
	bl	train_askdump(PLT)
	mov	r3, #0
	str	r3, [fp, #-28]
.L107:
	ldr	r3, .L114+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L79
	ldr	r3, .L114+28
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	ldr	r3, .L114+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
.L79:
.L112:
	ldr	r3, .L114+32
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L80
	bl	term_destroy(PLT)
	mov	r1, #0
	str	r1, [fp, #-148]
.L78:
	ldr	r3, [fp, #-148]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L115:
	.align	2
.L114:
	.word	_GLOBAL_OFFSET_TABLE_-(.L113+8)
	.word	print_label(GOT)
	.word	switch_index(GOT)
	.word	switches(GOT)
	.word	switch_head(GOT)
	.word	trippedSwitches(GOT)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	running(GOT)
	.size	main, .-main
	.bss
	.align	2
trippedSwitches:
	.space	112
	.ident	"GCC: (GNU) 4.0.2"
