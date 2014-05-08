	.file	"main.c"
	.section	.rodata
	.align	2
.LC0:
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
	ldr	sl, .L12
.L11:
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
	beq	.L10
	mov	r3, #2
	str	r3, [fp, #-44]
	b	.L4
.L5:
.L10:
	bl	io_poll(PLT)
	bl	clock_poll(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L5
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
	ldr	r2, [fp, #-32]
	ldr	ip, [fp, #-28]
	ldr	lr, [fp, #-24]
	ldr	r3, .L12+4
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	mov	r3, lr
	bl	printf(PLT)
	b	.L5
.L4:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L13:
	.align	2
.L12:
	.word	_GLOBAL_OFFSET_TABLE_-(.L11+8)
	.word	.LC0(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
