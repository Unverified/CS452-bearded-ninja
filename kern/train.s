	.file	"train.c"
	.text
	.align	2
	.global	_nop
	.type	_nop, %function
_nop:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L2
.L3:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r2, [fp, #-16]
	ldr	r3, .L6
	cmp	r2, r3
	ble	.L3
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	499
	.size	_nop, .-_nop
	.align	2
	.type	_settrain, %function
_settrain:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L11
.L10:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r0, #0
	mov	r1, r3
	bl	bwputc(PLT)
	bl	_nop(PLT)
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r0, #0
	mov	r1, r3
	bl	bwputc(PLT)
	ldr	r3, [fp, #-20]
	sub	r0, r3, #1
	ldr	r3, [fp, #-24]
	and	r1, r3, #255
	ldr	r3, .L11+4
	ldr	r2, [sl, r3]
	mov	r3, r1
	strb	r3, [r2, r0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	train_state(GOT)
	.size	_settrain, .-_settrain
	.align	2
	.type	_setgate, %function
_setgate:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L19
.L18:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #67
	beq	.L15
	ldr	r3, [fp, #-28]
	cmp	r3, #83
	beq	.L16
	b	.L14
.L15:
	mov	r0, #0
	mov	r1, #34
	bl	bwputc(PLT)
	b	.L14
.L16:
	mov	r0, #0
	mov	r1, #33
	bl	bwputc(PLT)
.L14:
	bl	_nop(PLT)
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r0, #0
	mov	r1, r3
	bl	bwputc(PLT)
	bl	_nop(PLT)
	bl	_nop(PLT)
	bl	_nop(PLT)
	mov	r0, #0
	mov	r1, #32
	bl	bwputc(PLT)
	ldr	r3, [fp, #-20]
	sub	r1, r3, #1
	ldr	r3, .L19+4
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-24]
	str	r3, [r2, r1, asl #2]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L20:
	.align	2
.L19:
	.word	_GLOBAL_OFFSET_TABLE_-(.L18+8)
	.word	gate_states(GOT)
	.size	_setgate, .-_setgate
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\015RESETTING TRACK...\012\015\000"
	.align	2
.LC1:
	.ascii	"RESETTING TRAINS...\012\015\000"
	.text
	.align	2
	.global	train_start
	.type	train_start, %function
train_start:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L30
.L29:
	add	sl, pc, sl
	mov	r0, #0
	mov	r1, #96
	bl	bwputc(PLT)
	bl	_nop(PLT)
	mov	r0, #1
	ldr	r3, .L30+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L22
.L23:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	mov	r0, r3
	mov	r1, #67
	bl	_setgate(PLT)
	bl	_nop(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L22:
	ldr	r3, [fp, #-20]
	cmp	r3, #79
	ble	.L23
	mov	r0, #1
	ldr	r3, .L30+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L25
.L26:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	mov	r0, r3
	mov	r1, #1
	bl	_settrain(PLT)
	bl	_nop(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L25:
	ldr	r3, [fp, #-20]
	cmp	r3, #79
	ble	.L26
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L31:
	.align	2
.L30:
	.word	_GLOBAL_OFFSET_TABLE_-(.L29+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	train_start, .-train_start
	.section	.rodata
	.align	2
.LC2:
	.ascii	"\012\015TRAIN %d SPEED %d\000"
	.text
	.align	2
	.global	train_setspeed
	.type	train_setspeed, %function
train_setspeed:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L35
.L34:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, .L35+4
	add	r3, sl, r3
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	bl	printf(PLT)
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	bl	_settrain(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L36:
	.align	2
.L35:
	.word	_GLOBAL_OFFSET_TABLE_-(.L34+8)
	.word	.LC2(GOTOFF)
	.size	train_setspeed, .-train_setspeed
	.align	2
	.global	train_setgate
	.type	train_setgate, %function
train_setgate:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	bl	_setgate(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_setgate, .-train_setgate
	.bss
	.align	2
gate_states:
	.space	320
train_state:
	.space	80
	.ident	"GCC: (GNU) 4.0.2"
