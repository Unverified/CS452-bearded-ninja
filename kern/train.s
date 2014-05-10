	.file	"train.c"
	.text
	.align	2
	.type	_storegate, %function
_storegate:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L2
	mvn	r3, #0
	str	r3, [fp, #-20]
	b	.L4
.L2:
	ldr	r3, [fp, #-16]
	cmp	r3, #17
	bgt	.L5
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L4
.L5:
	ldr	r3, [fp, #-16]
	cmp	r3, #21
	bgt	.L7
	ldr	r3, [fp, #-16]
	add	r3, r3, #135
	str	r3, [fp, #-20]
	b	.L4
.L7:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L4:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	_storegate, .-_storegate
	.align	2
	.type	_gatestore, %function
_gatestore:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bgt	.L11
	mvn	r3, #0
	str	r3, [fp, #-20]
	b	.L13
.L11:
	ldr	r3, [fp, #-16]
	cmp	r3, #18
	bgt	.L14
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L13
.L14:
	ldr	r3, [fp, #-16]
	cmp	r3, #156
	bgt	.L16
	ldr	r3, [fp, #-16]
	cmp	r3, #152
	ble	.L16
	ldr	r3, [fp, #-16]
	sub	r3, r3, #135
	str	r3, [fp, #-20]
	b	.L13
.L16:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L13:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	_gatestore, .-_gatestore
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Setting Train %d State: %d\012\000"
	.text
	.align	2
	.type	_bwsettrain, %function
_bwsettrain:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L23
.L22:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r0, #0
	mov	r1, r3
	bl	bwputc(PLT)
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r0, #0
	mov	r1, r3
	bl	bwputc(PLT)
	mov	r0, #1
	ldr	r3, .L23+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	sub	r0, r3, #1
	ldr	r3, [fp, #-24]
	and	r1, r3, #255
	ldr	r3, .L23+8
	ldr	r2, [sl, r3]
	mov	r3, r1
	strb	r3, [r2, r0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L24:
	.align	2
.L23:
	.word	_GLOBAL_OFFSET_TABLE_-(.L22+8)
	.word	.LC0(GOTOFF)
	.word	train_state(GOT)
	.size	_bwsettrain, .-_bwsettrain
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Setting Gate %d: %c\012\000"
	.text
	.align	2
	.type	_bwsetgate, %function
_bwsetgate:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L31
.L30:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #67
	beq	.L27
	ldr	r3, [fp, #-28]
	cmp	r3, #83
	beq	.L28
	b	.L26
.L27:
	mov	r0, #0
	mov	r1, #34
	bl	bwputc(PLT)
	b	.L26
.L28:
	mov	r0, #0
	mov	r1, #33
	bl	bwputc(PLT)
.L26:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r0, #0
	mov	r1, r3
	bl	bwputc(PLT)
	mov	r0, #0
	mov	r1, #32
	bl	bwputc(PLT)
	mov	r0, #1
	ldr	r3, .L31+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	ldr	r0, [fp, #-20]
	bl	_gatestore(PLT)
	mov	r1, r0
	ldr	r3, .L31+8
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-24]
	str	r3, [r2, r1, asl #2]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L32:
	.align	2
.L31:
	.word	_GLOBAL_OFFSET_TABLE_-(.L30+8)
	.word	.LC1(GOTOFF)
	.word	gate_states(GOT)
	.size	_bwsetgate, .-_bwsetgate
	.align	2
	.type	_settrain, %function
_settrain:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L36
.L35:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r0, r3
	bl	puttrain(PLT)
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r0, r3
	bl	puttrain(PLT)
	ldr	r3, [fp, #-20]
	sub	r0, r3, #1
	ldr	r3, [fp, #-24]
	and	r1, r3, #255
	ldr	r3, .L36+4
	ldr	r2, [sl, r3]
	mov	r3, r1
	strb	r3, [r2, r0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L37:
	.align	2
.L36:
	.word	_GLOBAL_OFFSET_TABLE_-(.L35+8)
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
	ldr	sl, .L44
.L43:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #67
	beq	.L40
	ldr	r3, [fp, #-28]
	cmp	r3, #83
	beq	.L41
	b	.L39
.L40:
	mov	r0, #34
	bl	puttrain(PLT)
	b	.L39
.L41:
	mov	r0, #33
	bl	puttrain(PLT)
.L39:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r0, r3
	bl	puttrain(PLT)
	mov	r0, #32
	bl	puttrain(PLT)
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	term_uswitchtable(PLT)
	ldr	r0, [fp, #-20]
	bl	_gatestore(PLT)
	mov	r1, r0
	ldr	r3, .L44+4
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-24]
	str	r3, [r2, r1, asl #2]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L45:
	.align	2
.L44:
	.word	_GLOBAL_OFFSET_TABLE_-(.L43+8)
	.word	gate_states(GOT)
	.size	_setgate, .-_setgate
	.section	.rodata
	.align	2
.LC2:
	.ascii	"RESETTING TRACK...\012\000"
	.align	2
.LC3:
	.ascii	"RESETTING TRAINS...\012\000"
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
	ldr	sl, .L55
.L54:
	add	sl, pc, sl
	mov	r0, #0
	mov	r1, #96
	bl	bwputc(PLT)
	mov	r0, #1
	ldr	r3, .L55+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L47
.L48:
	ldr	r0, [fp, #-20]
	bl	_storegate(PLT)
	mov	r3, r0
	mov	r0, r3
	mov	r1, #67
	bl	_bwsetgate(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L47:
	ldr	r3, [fp, #-20]
	cmp	r3, #17
	ble	.L48
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	mov	r0, r2
	bl	_storegate(PLT)
	mov	r3, r0
	mov	r0, r3
	mov	r1, #67
	bl	_bwsetgate(PLT)
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	mov	r0, r2
	bl	_storegate(PLT)
	mov	r3, r0
	mov	r0, r3
	mov	r1, #83
	bl	_bwsetgate(PLT)
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	mov	r0, r2
	bl	_storegate(PLT)
	mov	r3, r0
	mov	r0, r3
	mov	r1, #67
	bl	_bwsetgate(PLT)
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	mov	r0, r2
	bl	_storegate(PLT)
	mov	r3, r0
	mov	r0, r3
	mov	r1, #83
	bl	_bwsetgate(PLT)
	mov	r0, #1
	ldr	r3, .L55+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L50
.L51:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	mov	r0, r3
	mov	r1, #1
	bl	_bwsettrain(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L50:
	ldr	r3, [fp, #-20]
	cmp	r3, #79
	ble	.L51
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L56:
	.align	2
.L55:
	.word	_GLOBAL_OFFSET_TABLE_-(.L54+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.size	train_start, .-train_start
	.section	.rodata
	.align	2
.LC4:
	.ascii	"Invalid Train Number: %d\012\000"
	.align	2
.LC5:
	.ascii	"Invalid Speed For Train: %d\012\000"
	.align	2
.LC6:
	.ascii	"Setting Train %d Speed: %d\012\000"
	.text
	.align	2
	.global	train_setspeed
	.type	train_setspeed, %function
train_setspeed:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L67
.L66:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	ble	.L58
	ldr	r3, [fp, #-20]
	cmp	r3, #80
	ble	.L60
.L58:
	ldr	r3, .L67+4
	add	r3, sl, r3
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	printf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L61
.L60:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	blt	.L62
	ldr	r3, [fp, #-24]
	cmp	r3, #14
	ble	.L64
.L62:
	ldr	r3, .L67+8
	add	r3, sl, r3
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	printf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L61
.L64:
	ldr	r3, .L67+12
	add	r3, sl, r3
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	bl	printf(PLT)
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	bl	_settrain(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
.L61:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L68:
	.align	2
.L67:
	.word	_GLOBAL_OFFSET_TABLE_-(.L66+8)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.size	train_setspeed, .-train_setspeed
	.section	.rodata
	.align	2
.LC7:
	.ascii	"Invalid Gate State %c\000"
	.text
	.align	2
	.global	train_setgate
	.type	train_setgate, %function
train_setgate:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L77
.L76:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #67
	beq	.L71
	ldr	r3, [fp, #-36]
	cmp	r3, #83
	beq	.L72
	b	.L70
.L72:
	mov	r3, #83
	str	r3, [fp, #-20]
	b	.L73
.L71:
	mov	r3, #67
	str	r3, [fp, #-20]
	b	.L73
.L70:
	ldr	r3, .L77+4
	add	r3, sl, r3
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	printf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L74
.L73:
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L77+8
	add	r3, sl, r3
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	printf(PLT)
	ldr	r3, [fp, #-28]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	_setgate(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
.L74:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L78:
	.align	2
.L77:
	.word	_GLOBAL_OFFSET_TABLE_-(.L76+8)
	.word	.LC7(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	train_setgate, .-train_setgate
	.align	2
	.global	train_askdump
	.type	train_askdump, %function
train_askdump:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	mov	r0, #133
	bl	puttrain(PLT)
	mov	r3, r0
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
	.size	train_askdump, .-train_askdump
	.bss
	.align	2
gate_states:
	.space	88
train_state:
	.space	80
	.ident	"GCC: (GNU) 4.0.2"
