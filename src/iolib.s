	.file	"iolib.c"
	.text
	.align	2
	.global	io_init
	.type	io_init, %function
io_init:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L8
.L7:
	add	sl, pc, sl
	ldr	r3, .L8+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	iobuf_init(PLT)
	ldr	r3, .L8+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	iobuf_init(PLT)
	mov	r0, #0
	mov	r1, #2400
	bl	bwsetspeed(PLT)
	mov	r0, #0
	mov	r1, #0
	bl	bwsetfifo(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L2
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L4
.L2:
	mvn	r3, #0
	str	r3, [fp, #-20]
	b	.L5
.L4:
	ldr	r3, .L8+12
	ldr	r2, [sl, r3]
	ldr	r3, .L8+16
	str	r3, [r2, #0]
	ldr	r3, .L8+20
	ldr	r2, [sl, r3]
	ldr	r3, .L8+24
	str	r3, [r2, #0]
	ldr	r3, .L8+28
	ldr	r2, [sl, r3]
	ldr	r3, .L8+32
	str	r3, [r2, #0]
	ldr	r3, .L8+36
	ldr	r2, [sl, r3]
	ldr	r3, .L8+40
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-20]
.L5:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L9:
	.align	2
.L8:
	.word	_GLOBAL_OFFSET_TABLE_-(.L7+8)
	.word	iterm(GOT)
	.word	oterm(GOT)
	.word	TERM_FLAG(GOT)
	.word	-2138243048
	.word	TERM_DATA(GOT)
	.word	-2138243072
	.word	TRAIN_FLAG(GOT)
	.word	-2138308584
	.word	TRAIN_DATA(GOT)
	.word	-2138308608
	.size	io_init, .-io_init
	.align	2
	.global	io_poll
	.type	io_poll, %function
io_poll:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L20
.L19:
	add	sl, pc, sl
	ldr	r3, .L20+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	iobuf_empty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L11
	mov	r3, #2
	str	r3, [fp, #-24]
	b	.L13
.L11:
	ldr	r3, .L20+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L14
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L13
.L14:
	sub	r2, fp, #17
	ldr	r3, .L20+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	iobuf_get(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L16
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L13
.L16:
	ldr	r3, .L20+12
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-24]
.L13:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L21:
	.align	2
.L20:
	.word	_GLOBAL_OFFSET_TABLE_-(.L19+8)
	.word	oterm(GOT)
	.word	TERM_FLAG(GOT)
	.word	TERM_DATA(GOT)
	.size	io_poll, .-io_poll
	.align	2
	.global	putc
	.type	putc, %function
putc:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L25
.L24:
	add	sl, pc, sl
	mov	r3, r0
	strb	r3, [fp, #-20]
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	ldr	r3, .L25+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	iobuf_store(PLT)
	mov	r3, r0
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L26:
	.align	2
.L25:
	.word	_GLOBAL_OFFSET_TABLE_-(.L24+8)
	.word	oterm(GOT)
	.size	putc, .-putc
	.align	2
	.global	putstr
	.type	putstr, %function
putstr:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	b	.L28
.L29:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L30
	mvn	r3, #0
	str	r3, [fp, #-20]
	b	.L32
.L30:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L28:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L29
	mov	r3, #0
	str	r3, [fp, #-20]
.L32:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	putstr, .-putstr
	.align	2
	.global	putw
	.type	putw, %function
putw:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	mov	r3, r1
	str	r2, [fp, #-32]
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	b	.L36
.L37:
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
.L36:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	eor	r3, r2, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L40
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bgt	.L37
	b	.L40
.L41:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
.L40:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	cmp	r2, #0
	bne	.L41
	b	.L43
.L44:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
.L43:
	ldr	r3, [fp, #-32]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	cmp	r2, #0
	bne	.L44
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	putw, .-putw
	.align	2
	.global	formatString
	.type	formatString, %function
formatString:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	b	.L66
.L49:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L50
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
	b	.L48
.L50:
	mov	r3, #0
	strb	r3, [fp, #-13]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-36]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-36]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #48
	beq	.L53
	ldr	r3, [fp, #-48]
	cmp	r3, #48
	blt	.L52
	ldr	r3, [fp, #-48]
	cmp	r3, #57
	bgt	.L52
	b	.L54
.L53:
	mov	r3, #1
	strb	r3, [fp, #-13]
	ldr	r2, [fp, #-36]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-36]
	b	.L52
.L54:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	sub	r2, fp, #36
	sub	ip, fp, #32
	mov	r0, r3
	mov	r1, r2
	mov	r2, #10
	mov	r3, ip
	bl	bwa2i(PLT)
	mov	r3, r0
	strb	r3, [fp, #-14]
.L52:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #115
	beq	.L59
	ldr	r3, [fp, #-44]
	cmp	r3, #115
	bgt	.L62
	ldr	r3, [fp, #-44]
	cmp	r3, #99
	beq	.L57
	ldr	r3, [fp, #-44]
	cmp	r3, #99
	bgt	.L63
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	beq	.L65
	ldr	r3, [fp, #-44]
	cmp	r3, #37
	beq	.L56
	b	.L48
.L63:
	ldr	r3, [fp, #-44]
	cmp	r3, #100
	beq	.L58
	b	.L48
.L62:
	ldr	r3, [fp, #-44]
	cmp	r3, #117
	beq	.L60
	ldr	r3, [fp, #-44]
	cmp	r3, #120
	beq	.L61
	b	.L48
.L57:
	ldr	r3, [fp, #-40]
	add	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	sub	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
	b	.L48
.L59:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-40]
	add	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	putw(PLT)
	b	.L48
.L60:
	ldr	r3, [fp, #-40]
	add	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #10
	bl	bwui2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	putw(PLT)
	b	.L48
.L58:
	ldr	r3, [fp, #-40]
	add	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, r2
	bl	bwi2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	putw(PLT)
	b	.L48
.L61:
	ldr	r3, [fp, #-40]
	add	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #16
	bl	bwui2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	putw(PLT)
	b	.L48
.L56:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
.L48:
.L66:
	ldr	r1, [fp, #-36]
	ldrb	r3, [r1, #0]
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	add	r3, r1, #1
	str	r3, [fp, #-36]
	cmp	r2, #0
	bne	.L49
.L65:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	formatString, .-formatString
	.align	2
	.global	printf
	.type	printf, %function
printf:
	@ args = 4, pretend = 16, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 1
	mov	ip, sp
	stmfd	sp!, {r0, r1, r2, r3}
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #20
	sub	sp, sp, #4
	add	r3, fp, #8
	str	r3, [fp, #-16]
	ldr	r0, [fp, #4]
	ldr	r1, [fp, #-16]
	bl	formatString(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	printf, .-printf
	.align	2
	.global	getc
	.type	getc, %function
getc:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L75
.L74:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, .L75+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L70
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L72
.L70:
	ldr	r3, .L75+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	ldr	r2, [fp, #-20]
	strb	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-24]
.L72:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L76:
	.align	2
.L75:
	.word	_GLOBAL_OFFSET_TABLE_-(.L74+8)
	.word	TERM_FLAG(GOT)
	.word	TERM_DATA(GOT)
	.size	getc, .-getc
	.bss
	.align	2
oterm:
	.space	112
	.align	2
iterm:
	.space	112
	.align	2
TERM_FLAG:
	.space	4
	.align	2
TERM_DATA:
	.space	4
	.align	2
TRAIN_FLAG:
	.space	4
	.align	2
TRAIN_DATA:
	.space	4
	.ident	"GCC: (GNU) 4.0.2"
