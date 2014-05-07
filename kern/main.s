	.file	"main.c"
	.text
	.align	2
	.global	memcpy
	.type	memcpy, %function
memcpy:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	b	.L2
.L3:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-16]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L2:
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	bne	.L3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	memcpy, .-memcpy
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Hello world.\012\015\000"
	.align	2
.LC2:
	.ascii	"%s world%u.\012\015\000"
	.align	2
.LC3:
	.ascii	"Well, hello\000"
	.align	2
.LC4:
	.ascii	"%d worlds for %u person.\012\015\000"
	.align	2
.LC5:
	.ascii	"%x worlds for %d people.\012\015\000"
	.align	2
.LC6:
	.ascii	"%s\000"
	.align	2
.LC0:
	.ascii	"Hello World\012\015\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	ldr	sl, .L9
.L8:
	add	sl, pc, sl
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	mov	r3, #1
	strb	r3, [fp, #-17]
	ldr	r3, .L9+4
	add	r3, sl, r3
	sub	r2, fp, #31
	mov	ip, #14
	mov	r0, r2
	mov	r1, r3
	mov	r2, ip
	bl	memcpy(PLT)
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	sub	r3, fp, #31
	mov	r0, #1
	mov	r1, r3
	bl	bwputstr(PLT)
	sub	r3, fp, #31
	mov	r0, #1
	mov	r1, #10
	mov	r2, #42
	bl	bwputw(PLT)
	mov	r0, #1
	ldr	r3, .L9+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L9+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L9+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #23
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L9+20
	add	r3, sl, r3
	mov	r1, r3
	mvn	r2, #22
	mov	r3, #1
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L9+24
	add	r3, sl, r3
	mov	r1, r3
	mvn	r2, #22
	ldr	r3, .L9+28
	bl	bwprintf(PLT)
	mov	r0, #1
	bl	bwgetc(PLT)
	mov	r3, r0
	and	r3, r3, #255
	strb	r3, [fp, #-31]
	sub	r2, fp, #31
	mov	r0, #1
	ldr	r3, .L9+32
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L8+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	723
	.word	.LC6(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
