	.file	"iobuffer.c"
	.text
	.align	2
	.type	inc_bufcount, %function
inc_bufcount:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, .L5
	cmp	r2, r3
	bls	.L2
	mov	r3, #0
	str	r3, [fp, #-16]
.L2:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L6:
	.align	2
.L5:
	.word	511
	.size	inc_bufcount, .-inc_bufcount
	.align	2
	.global	iobuf_init
	.type	iobuf_init, %function
iobuf_init:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #4]
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	iobuf_init, .-iobuf_init
	.align	2
	.global	iobuf_empty
	.type	iobuf_empty, %function
iobuf_empty:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	iobuf_empty, .-iobuf_empty
	.align	2
	.global	iobuf_get
	.type	iobuf_get, %function
iobuf_get:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L12
	mov	r3, #42
	str	r3, [fp, #-24]
	b	.L14
.L12:
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r2, #12
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	bl	inc_bufcount(PLT)
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #8]
	mov	r3, #0
	str	r3, [fp, #-24]
.L14:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	iobuf_get, .-iobuf_get
	.align	2
	.global	iobuf_store
	.type	iobuf_store, %function
iobuf_store:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	mov	r3, r1
	strb	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	cmp	r3, #512
	bne	.L17
	mov	r3, #43
	str	r3, [fp, #-24]
	b	.L19
.L17:
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #4]
	ldr	r3, [fp, #-16]
	mov	r2, #12
	add	r3, r1, r3
	add	r2, r3, r2
	ldrb	r3, [fp, #-20]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	mov	r0, r3
	bl	inc_bufcount(PLT)
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #8]
	mov	r3, #0
	str	r3, [fp, #-24]
.L19:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	iobuf_store, .-iobuf_store
	.ident	"GCC: (GNU) 4.0.2"
