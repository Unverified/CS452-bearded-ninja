	.file	"main.c"
	.text
	.align	2
	.global	train_dance
	.type	train_dance, %function
train_dance:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #5
	cmp	r3, #50
	addls	pc, pc, r3, asl #2
	b	.L11
	.p2align 2
.L10:
	b	.L3
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L4
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L5
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L6
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L7
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L8
	b	.L11
	b	.L11
	b	.L11
	b	.L11
	b	.L9
.L3:
	mov	r0, #47
	mov	r1, #5
	bl	train_setspeed(PLT)
	b	.L11
.L4:
	mov	r0, #47
	mov	r1, #10
	bl	train_setspeed(PLT)
	b	.L11
.L5:
	mov	r0, #47
	mov	r1, #16
	bl	train_setspeed(PLT)
	b	.L11
.L6:
	mov	r0, #47
	mov	r1, #30
	bl	train_setspeed(PLT)
	b	.L11
.L7:
	mov	r0, #47
	mov	r1, #14
	bl	train_setspeed(PLT)
	b	.L11
.L8:
	mov	r0, #47
	mov	r1, #5
	bl	train_setspeed(PLT)
	b	.L11
.L9:
	mov	r0, #47
	mov	r1, #15
	bl	train_setspeed(PLT)
.L11:
	ldmfd	sp, {r3, fp, sp, pc}
	.size	train_dance, .-train_dance
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c[2J\000"
	.text
	.align	2
	.global	bwcls
	.type	bwcls, %function
bwcls:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L15
.L14:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L15+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	bl	bwprintf(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L16:
	.align	2
.L15:
	.word	_GLOBAL_OFFSET_TABLE_-(.L14+8)
	.word	.LC0(GOTOFF)
	.size	bwcls, .-bwcls
	.section	.rodata
	.align	2
.LC1:
	.ascii	"%c[%d;%dH\000"
	.text
	.align	2
	.global	bwsetpos
	.type	bwsetpos, %function
bwsetpos:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L20
.L19:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L20+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L21:
	.align	2
.L20:
	.word	_GLOBAL_OFFSET_TABLE_-(.L19+8)
	.word	.LC1(GOTOFF)
	.size	bwsetpos, .-bwsetpos
	.section	.rodata
	.align	2
.LC2:
	.ascii	"\033[2J\000"
	.text
	.align	2
	.global	cls
	.type	cls, %function
cls:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L25
.L24:
	add	sl, pc, sl
	ldr	r3, .L25+4
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L26:
	.align	2
.L25:
	.word	_GLOBAL_OFFSET_TABLE_-(.L24+8)
	.word	.LC2(GOTOFF)
	.size	cls, .-cls
	.section	.rodata
	.align	2
.LC3:
	.ascii	"\033[%d;%dH\000"
	.text
	.align	2
	.global	setpos
	.type	setpos, %function
setpos:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L30
.L29:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, .L30+4
	add	r3, sl, r3
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	bl	printf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L31:
	.align	2
.L30:
	.word	_GLOBAL_OFFSET_TABLE_-(.L29+8)
	.word	.LC3(GOTOFF)
	.size	setpos, .-setpos
	.section	.rodata
	.align	2
.LC4:
	.ascii	"\033[s\000"
	.text
	.align	2
	.global	savecur
	.type	savecur, %function
savecur:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L35
.L34:
	add	sl, pc, sl
	ldr	r3, .L35+4
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L36:
	.align	2
.L35:
	.word	_GLOBAL_OFFSET_TABLE_-(.L34+8)
	.word	.LC4(GOTOFF)
	.size	savecur, .-savecur
	.section	.rodata
	.align	2
.LC5:
	.ascii	"\033[u\000"
	.text
	.align	2
	.global	loadcur
	.type	loadcur, %function
loadcur:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L40
.L39:
	add	sl, pc, sl
	ldr	r3, .L40+4
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L41:
	.align	2
.L40:
	.word	_GLOBAL_OFFSET_TABLE_-(.L39+8)
	.word	.LC5(GOTOFF)
	.size	loadcur, .-loadcur
	.section	.rodata
	.align	2
.LC6:
	.ascii	"Booting up NIK os\012\015\000"
	.align	2
.LC7:
	.ascii	"io setup success!!!!\012\015\000"
	.align	2
.LC8:
	.ascii	"clock setup success!!!!\012\015\000"
	.text
	.align	2
	.global	init
	.type	init, %function
init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L50
.L49:
	add	sl, pc, sl
	bl	bwcls(PLT)
	mov	r0, #0
	mov	r1, #0
	bl	bwsetpos(PLT)
	mov	r0, #1
	ldr	r3, .L50+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	io_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L43
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L45
.L43:
	mov	r0, #1
	ldr	r3, .L50+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	clock_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L46
	mov	r3, #2
	str	r3, [fp, #-24]
	b	.L45
.L46:
	mov	r0, #1
	ldr	r3, .L50+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
.L45:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L51:
	.align	2
.L50:
	.word	_GLOBAL_OFFSET_TABLE_-(.L49+8)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.size	init, .-init
	.section	.rodata
	.align	2
.LC9:
	.ascii	"\012Term> \000"
	.align	2
.LC10:
	.ascii	"%d %d %d\012\015\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 116
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #116
	ldr	sl, .L70
.L69:
	add	sl, pc, sl
	str	r0, [fp, #-124]
	str	r1, [fp, #-128]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #0
	strb	r3, [fp, #-21]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L53
.L54:
	ldr	r3, [fp, #-28]
	mvn	r2, #99
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L53:
	ldr	r3, [fp, #-28]
	cmp	r3, #75
	bls	.L54
	bl	init(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L56
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-132]
	b	.L52
.L56:
	bl	bwcls(PLT)
	b	.L68
.L58:
.L68:
	bl	io_poll(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L59
	sub	r3, fp, #117
	mov	r0, r3
	bl	getc(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L59
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	ldrb	r1, [fp, #-117]	@ zero_extendqisi2
	mvn	r2, #99
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, r1
	strb	r3, [r2, #0]
	ldrb	r3, [fp, #-21]
	add	r3, r3, #1
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-117]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
	ldrb	r3, [fp, #-117]	@ zero_extendqisi2
	cmp	r3, #13
	bne	.L62
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mvn	r2, #99
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	sub	r3, fp, #116
	mov	r0, r3
	bl	printf(PLT)
	ldr	r3, .L70+4
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	mov	r3, #0
	strb	r3, [fp, #-21]
.L62:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #75
	bne	.L59
	ldrb	r3, [fp, #-21]
	sub	r3, r3, #1
	strb	r3, [fp, #-21]
.L59:
	bl	clock_poll(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	ble	.L58
	sub	r3, fp, #40
	sub	r2, fp, #36
	sub	ip, fp, #32
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
	ldr	lr, [fp, #-32]
	ldr	r3, .L70+8
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	mov	r3, lr
	bl	printf(PLT)
	bl	loadcur(PLT)
	b	.L58
.L52:
	ldr	r0, [fp, #-132]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L71:
	.align	2
.L70:
	.word	_GLOBAL_OFFSET_TABLE_-(.L69+8)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
