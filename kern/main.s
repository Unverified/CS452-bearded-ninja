	.file	"main.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c[2J\000"
	.align	2
.LC1:
	.ascii	"[%d;%dH\000"
	.align	2
.LC2:
	.ascii	"%d %d %d\012\015\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	ldr	sl, .L17
.L16:
	add	sl, pc, sl
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	bl	io_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L2
	mov	r3, #1
	str	r3, [fp, #-44]
	b	.L4
.L2:
	bl	clock_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L5
	mov	r3, #2
	str	r3, [fp, #-44]
	b	.L4
.L5:
	mov	r0, #1
	ldr	r3, .L17+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	bl	bwprintf(PLT)
	b	.L15
.L7:
.L15:
	bl	io_poll(PLT)
	bl	clock_poll(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L7
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-32]
	sub	r3, fp, #32
	sub	r2, fp, #28
	sub	ip, fp, #24
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	clock_get(PLT)
	ldr	r3, [fp, #-28]
	cmp	r3, #5
	bne	.L10
	mov	r0, #50
	mov	r1, #10
	bl	train_setspeed(PLT)
	b	.L12
.L10:
	ldr	r3, [fp, #-28]
	cmp	r3, #50
	bne	.L12
	mov	r0, #50
	mov	r1, #16
	bl	train_setspeed(PLT)
.L12:
	mov	r0, #27
	bl	putc(PLT)
	ldr	r3, .L17+8
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, #0
	mov	r2, #0
	bl	printf(PLT)
	ldr	r2, [fp, #-32]
	ldr	ip, [fp, #-28]
	ldr	lr, [fp, #-24]
	ldr	r3, .L17+12
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	mov	r3, lr
	bl	printf(PLT)
	b	.L7
.L4:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L18:
	.align	2
.L17:
	.word	_GLOBAL_OFFSET_TABLE_-(.L16+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
