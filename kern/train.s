	.file	"train.c"
	.text
	.align	2
	.global	train_setspeed
	.type	train_setspeed, %function
train_setspeed:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	mov	r2, r1
	strb	r3, [fp, #-16]
	mov	r3, r2
	strb	r3, [fp, #-20]
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	mov	r0, #0
	mov	r1, r3
	bl	bwputc(PLT)
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	mov	r0, #0
	mov	r1, r3
	bl	bwputc(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_setspeed, .-train_setspeed
	.ident	"GCC: (GNU) 4.0.2"
