	.file	"main.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	bl	io_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L2
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-28]
	b	.L4
.L2:
	mov	r0, #102
	bl	putc(PLT)
	mov	r0, #102
	bl	putc(PLT)
	mov	r0, #102
	bl	putc(PLT)
	mov	r0, #102
	bl	putc(PLT)
.L5:
	bl	io_poll(PLT)
	mov	r3, r0
	cmp	r3, #2
	beq	.L6
	b	.L5
.L6:
	mov	r3, #0
	str	r3, [fp, #-28]
.L4:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
