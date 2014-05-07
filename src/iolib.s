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
	.size	io_init, .-io_init
	.section	.rodata
	.align	2
.LC0:
	.ascii	"storing %c inbuf at %d\012\015\000"
	.text
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
	ldr	sl, .L13
.L12:
	add	sl, pc, sl
	mov	r3, r0
	strb	r3, [fp, #-20]
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r3, .L13+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L13+8
	ldr	r3, [sl, r3]
	bl	bwprintf(PLT)
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	ldr	r3, .L13+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	iobuf_store(PLT)
	mov	r3, r0
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L14:
	.align	2
.L13:
	.word	_GLOBAL_OFFSET_TABLE_-(.L12+8)
	.word	.LC0(GOTOFF)
	.word	oterm(GOT)
	.size	putc, .-putc
	.align	2
	.global	io_poll
	.type	io_poll, %function
io_poll:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L25
.L24:
	add	sl, pc, sl
	ldr	r3, .L25+4
	str	r3, [fp, #-24]
	ldr	r3, .L25+8
	str	r3, [fp, #-20]
	ldr	r3, .L25+12
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	iobuf_empty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L16
	mov	r3, #2
	str	r3, [fp, #-32]
	b	.L18
.L16:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L19
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L18
.L19:
	sub	r2, fp, #25
	ldr	r3, .L25+12
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	iobuf_get(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L21
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L18
.L21:
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-32]
.L18:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L26:
	.align	2
.L25:
	.word	_GLOBAL_OFFSET_TABLE_-(.L24+8)
	.word	-2138243048
	.word	-2138243072
	.word	oterm(GOT)
	.size	io_poll, .-io_poll
	.bss
	.align	2
oterm:
	.space	112
	.align	2
iterm:
	.space	112
	.ident	"GCC: (GNU) 4.0.2"
