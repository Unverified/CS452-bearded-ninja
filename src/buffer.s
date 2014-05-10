	.file	"buffer.c"
	.text
	.align	2
	.type	inc_bufcount, %function
inc_bufcount:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L2
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	b	.L5
.L2:
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #0]
.L5:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	inc_bufcount, .-inc_bufcount
	.align	2
	.global	buffer_init
	.type	buffer_init, %function
buffer_init:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #12]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	buffer_init, .-buffer_init
	.align	2
	.global	buffer_empty
	.type	buffer_empty, %function
buffer_empty:
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
	.size	buffer_empty, .-buffer_empty
	.align	2
	.global	buffer_get
	.type	buffer_get, %function
buffer_get:
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
	bne	.L11
	mov	r3, #42
	str	r3, [fp, #-24]
	b	.L13
.L11:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	inc_bufcount(PLT)
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #8]
	mov	r3, #0
	str	r3, [fp, #-24]
.L13:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	buffer_get, .-buffer_get
	.align	2
	.global	buffer_store
	.type	buffer_store, %function
buffer_store:
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
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L16
	mov	r3, #43
	str	r3, [fp, #-24]
	b	.L18
.L16:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	add	r2, r2, r3
	ldrb	r3, [fp, #-20]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	inc_bufcount(PLT)
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #8]
	mov	r3, #0
	str	r3, [fp, #-24]
.L18:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	buffer_store, .-buffer_store
	.ident	"GCC: (GNU) 4.0.2"
