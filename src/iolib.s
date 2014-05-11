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
	.word	otrain(GOT)
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
	.global	term_writepoll
	.type	term_writepoll, %function
term_writepoll:
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
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L13
.L11:
	ldr	r3, .L20+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and	r3, r3, #40
	cmp	r3, #0
	beq	.L14
	mov	r3, #2
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
	mov	r3, #3
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
	.size	term_writepoll, .-term_writepoll
	.align	2
	.global	train_writepoll
	.type	train_writepoll, %function
train_writepoll:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L33
.L32:
	add	sl, pc, sl
	ldr	r3, .L33+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	iobuf_empty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L23
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L25
.L23:
	ldr	r3, .L33+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and	r3, r3, #40
	cmp	r3, #0
	bne	.L26
	ldr	r3, .L33+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L28
.L26:
	mov	r3, #2
	str	r3, [fp, #-24]
	b	.L25
.L28:
	sub	r2, fp, #17
	ldr	r3, .L33+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	iobuf_get(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L29
	mov	r3, #3
	str	r3, [fp, #-24]
	b	.L25
.L29:
	ldr	r3, .L33+12
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-24]
.L25:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L34:
	.align	2
.L33:
	.word	_GLOBAL_OFFSET_TABLE_-(.L32+8)
	.word	otrain(GOT)
	.word	TRAIN_FLAG(GOT)
	.word	TRAIN_DATA(GOT)
	.size	train_writepoll, .-train_writepoll
	.align	2
	.global	io_poll
	.type	io_poll, %function
io_poll:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	bl	term_writepoll(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	str	r3, [fp, #-16]
	bl	train_writepoll(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-16]
	orr	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
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
	ldr	sl, .L40
.L39:
	add	sl, pc, sl
	mov	r3, r0
	strb	r3, [fp, #-20]
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	ldr	r3, .L40+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	iobuf_store(PLT)
	mov	r3, r0
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L41:
	.align	2
.L40:
	.word	_GLOBAL_OFFSET_TABLE_-(.L39+8)
	.word	oterm(GOT)
	.size	putc, .-putc
	.align	2
	.global	puttrain
	.type	puttrain, %function
puttrain:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L45
.L44:
	add	sl, pc, sl
	mov	r3, r0
	strb	r3, [fp, #-20]
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	ldr	r3, .L45+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	iobuf_store(PLT)
	mov	r3, r0
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L46:
	.align	2
.L45:
	.word	_GLOBAL_OFFSET_TABLE_-(.L44+8)
	.word	otrain(GOT)
	.size	puttrain, .-puttrain
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
	b	.L48
.L49:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L50
	mvn	r3, #0
	str	r3, [fp, #-20]
	b	.L52
.L50:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L48:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L49
	mov	r3, #0
	str	r3, [fp, #-20]
.L52:
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
	b	.L56
.L57:
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
.L56:
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
	bne	.L60
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bgt	.L57
	b	.L60
.L61:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
.L60:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	cmp	r2, #0
	bne	.L61
	b	.L63
.L64:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
.L63:
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
	bne	.L64
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
	b	.L86
.L69:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L70
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
	b	.L68
.L70:
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
	beq	.L73
	ldr	r3, [fp, #-48]
	cmp	r3, #48
	blt	.L72
	ldr	r3, [fp, #-48]
	cmp	r3, #57
	bgt	.L72
	b	.L74
.L73:
	mov	r3, #1
	strb	r3, [fp, #-13]
	ldr	r2, [fp, #-36]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-36]
	b	.L72
.L74:
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
.L72:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #115
	beq	.L79
	ldr	r3, [fp, #-44]
	cmp	r3, #115
	bgt	.L82
	ldr	r3, [fp, #-44]
	cmp	r3, #99
	beq	.L77
	ldr	r3, [fp, #-44]
	cmp	r3, #99
	bgt	.L83
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	beq	.L85
	ldr	r3, [fp, #-44]
	cmp	r3, #37
	beq	.L76
	b	.L68
.L83:
	ldr	r3, [fp, #-44]
	cmp	r3, #100
	beq	.L78
	b	.L68
.L82:
	ldr	r3, [fp, #-44]
	cmp	r3, #117
	beq	.L80
	ldr	r3, [fp, #-44]
	cmp	r3, #120
	beq	.L81
	b	.L68
.L77:
	ldr	r3, [fp, #-40]
	add	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	sub	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
	b	.L68
.L79:
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
	b	.L68
.L80:
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
	b	.L68
.L78:
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
	b	.L68
.L81:
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
	b	.L68
.L76:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
.L68:
.L86:
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
	bne	.L69
.L85:
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
	ldr	sl, .L95
.L94:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, .L95+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L90
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L92
.L90:
	ldr	r3, .L95+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	ldr	r2, [fp, #-20]
	strb	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-24]
.L92:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L96:
	.align	2
.L95:
	.word	_GLOBAL_OFFSET_TABLE_-(.L94+8)
	.word	TERM_FLAG(GOT)
	.word	TERM_DATA(GOT)
	.size	getc, .-getc
	.align	2
	.global	gettrain
	.type	gettrain, %function
gettrain:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L103
.L102:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, .L103+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L98
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L100
.L98:
	ldr	r3, .L103+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	ldr	r2, [fp, #-20]
	strb	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-24]
.L100:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L104:
	.align	2
.L103:
	.word	_GLOBAL_OFFSET_TABLE_-(.L102+8)
	.word	TRAIN_FLAG(GOT)
	.word	TRAIN_DATA(GOT)
	.size	gettrain, .-gettrain
	.bss
	.align	2
oterm:
	.space	524
	.align	2
otrain:
	.space	524
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
