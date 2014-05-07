	.file	"iolib.c"
	.text
	.align	2
	.global	print_init
	.type	print_init, %function
print_init:
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
	.word	buf(GOT)
	.size	print_init, .-print_init
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
	.word	buf(GOT)
	.size	putc, .-putc
	.section	.rodata
	.align	2
.LC1:
	.ascii	"failed to get thing from buffer\000"
	.text
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
	ldr	sl, .L21
.L20:
	add	sl, pc, sl
	sub	r2, fp, #17
	ldr	r3, .L21+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	iobuf_get(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L16
	mov	r0, #1
	ldr	r3, .L21+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L18
.L16:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #1
	mov	r1, r3
	bl	bwputc(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
.L18:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	_GLOBAL_OFFSET_TABLE_-(.L20+8)
	.word	buf(GOT)
	.word	.LC1(GOTOFF)
	.size	io_poll, .-io_poll
	.bss
	.align	2
buf:
	.space	112
	.ident	"GCC: (GNU) 4.0.2"
