	.file	"main.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d %d\012\015\000"
	.align	2
.LC1:
	.ascii	"%d %d %d\012\015\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	ldr	sl, .L12
.L11:
	add	sl, pc, sl
	str	r0, [fp, #-44]
	str	r1, [fp, #-48]
	bl	io_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L2
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-52]
	b	.L1
.L2:
	mov	r3, #0
	strb	r3, [fp, #-34]
	mov	r3, #0
	strb	r3, [fp, #-33]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r0, #102
	bl	putc(PLT)
	mov	r0, #102
	bl	putc(PLT)
	mov	r0, #102
	bl	putc(PLT)
	mov	r0, #102
	bl	putc(PLT)
	mov	r0, #103
	bl	putc(PLT)
	ldr	r3, .L12+4
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	mov	r3, #200
	str	r3, [r2, #0]
	ldr	r3, .L12+8
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	mov	r3, #192
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, .L12+12
	str	r3, [fp, #-28]
.L4:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	ble	.L5
	ldrb	r3, [fp, #-34]	@ zero_extendqisi2
	add	r3, r3, #1
	and	r3, r3, #255
	strb	r3, [fp, #-34]
	ldrb	r3, [fp, #-34]	@ zero_extendqisi2
	cmp	r3, #10
	bne	.L7
	ldrb	r3, [fp, #-33]	@ zero_extendqisi2
	add	r3, r3, #1
	and	r3, r3, #255
	strb	r3, [fp, #-33]
	mov	r3, #0
	strb	r3, [fp, #-34]
	ldrb	r3, [fp, #-33]	@ zero_extendqisi2
	cmp	r3, #60
	bne	.L7
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	mov	r3, #0
	strb	r3, [fp, #-33]
.L7:
	mov	r0, #1
	ldr	r3, .L12+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	ldrb	ip, [fp, #-33]	@ zero_extendqisi2
	ldrb	r3, [fp, #-34]	@ zero_extendqisi2
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L12+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	mov	r3, ip
	bl	bwprintf(PLT)
.L5:
	bl	io_poll(PLT)
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-24]
	b	.L4
.L1:
	ldr	r0, [fp, #-52]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L13:
	.align	2
.L12:
	.word	_GLOBAL_OFFSET_TABLE_-(.L11+8)
	.word	-2139029376
	.word	-2139029368
	.word	-2139029372
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
