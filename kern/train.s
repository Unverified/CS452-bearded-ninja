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
	.align	2
	.type	_trainstore, %function
_trainstore:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #43
	cmp	r3, #8
	addls	pc, pc, r3, asl #2
	b	.L21
	.p2align 2
.L29:
	b	.L22
	b	.L21
	b	.L23
	b	.L21
	b	.L24
	b	.L25
	b	.L26
	b	.L27
	b	.L28
.L22:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L30
.L23:
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L30
.L24:
	mov	r3, #2
	str	r3, [fp, #-20]
	b	.L30
.L25:
	mov	r3, #3
	str	r3, [fp, #-20]
	b	.L30
.L26:
	mov	r3, #4
	str	r3, [fp, #-20]
	b	.L30
.L27:
	mov	r3, #5
	str	r3, [fp, #-20]
	b	.L30
.L28:
	mov	r3, #6
	str	r3, [fp, #-20]
	b	.L30
.L21:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L30:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	_trainstore, .-_trainstore
	.align	2
	.type	_storetrain, %function
_storetrain:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #6
	addls	pc, pc, r3, asl #2
	b	.L33
	.p2align 2
.L41:
	b	.L34
	b	.L35
	b	.L36
	b	.L37
	b	.L38
	b	.L39
	b	.L40
.L34:
	mov	r3, #43
	str	r3, [fp, #-20]
	b	.L42
.L35:
	mov	r3, #45
	str	r3, [fp, #-20]
	b	.L42
.L36:
	mov	r3, #47
	str	r3, [fp, #-20]
	b	.L42
.L37:
	mov	r3, #48
	str	r3, [fp, #-20]
	b	.L42
.L38:
	mov	r3, #49
	str	r3, [fp, #-20]
	b	.L42
.L39:
	mov	r3, #50
	str	r3, [fp, #-20]
	b	.L42
.L40:
	mov	r3, #51
	str	r3, [fp, #-20]
	b	.L42
.L33:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L42:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	_storetrain, .-_storetrain
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Setting Train %d State: %d\012\000"
	.text
	.align	2
	.type	_bwsettrain, %function
_bwsettrain:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L47
.L46:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r0, #0
	mov	r1, r3
	bl	bwputc(PLT)
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r0, #0
	mov	r1, r3
	bl	bwputc(PLT)
	ldr	r0, [fp, #-24]
	bl	_trainstore(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L47+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-20]
	ldr	r3, .L47+8
	ldr	r1, [sl, r3]
	mov	r0, #4
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L47+8
	ldr	r2, [sl, r3]
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	str	r0, [r3, #0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L48:
	.align	2
.L47:
	.word	_GLOBAL_OFFSET_TABLE_-(.L46+8)
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
	ldr	sl, .L55
.L54:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #67
	beq	.L51
	ldr	r3, [fp, #-28]
	cmp	r3, #83
	beq	.L52
	b	.L50
.L51:
	mov	r0, #0
	mov	r1, #34
	bl	bwputc(PLT)
	b	.L50
.L52:
	mov	r0, #0
	mov	r1, #33
	bl	bwputc(PLT)
.L50:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r0, #0
	mov	r1, r3
	bl	bwputc(PLT)
	mov	r0, #0
	mov	r1, #32
	bl	bwputc(PLT)
	mov	r0, #1
	ldr	r3, .L55+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	ldr	r0, [fp, #-20]
	bl	_gatestore(PLT)
	mov	r1, r0
	ldr	r3, .L55+8
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-24]
	str	r3, [r2, r1, asl #2]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L56:
	.align	2
.L55:
	.word	_GLOBAL_OFFSET_TABLE_-(.L54+8)
	.word	.LC1(GOTOFF)
	.word	gate_states(GOT)
	.size	_bwsetgate, .-_bwsetgate
	.align	2
	.type	_settrain, %function
_settrain:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r0, r3
	bl	puttrain(PLT)
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	mov	r0, r3
	bl	puttrain(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
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
	ldr	sl, .L65
.L64:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #67
	beq	.L61
	ldr	r3, [fp, #-28]
	cmp	r3, #83
	beq	.L62
	b	.L60
.L61:
	mov	r0, #34
	bl	puttrain(PLT)
	b	.L60
.L62:
	mov	r0, #33
	bl	puttrain(PLT)
.L60:
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
	ldr	r3, .L65+4
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-24]
	str	r3, [r2, r1, asl #2]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L66:
	.align	2
.L65:
	.word	_GLOBAL_OFFSET_TABLE_-(.L64+8)
	.word	gate_states(GOT)
	.size	_setgate, .-_setgate
	.section	.rodata
	.align	2
.LC2:
	.ascii	"RESETTING TRACK...\012\000"
	.align	2
.LC3:
	.ascii	"RESETTING TRAINS...\012\000"
	.align	2
.LC4:
	.ascii	"Clearing Switch Data... \012\000"
	.text
	.align	2
	.global	train_init
	.type	train_init, %function
train_init:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L76
.L75:
	add	sl, pc, sl
	mov	r0, #0
	mov	r1, #96
	bl	bwputc(PLT)
	mov	r0, #1
	ldr	r3, .L76+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L68
.L69:
	ldr	r0, [fp, #-20]
	bl	_storegate(PLT)
	mov	r3, r0
	mov	r0, r3
	mov	r1, #67
	bl	_bwsetgate(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L68:
	ldr	r3, [fp, #-20]
	cmp	r3, #17
	ble	.L69
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
	ldr	r3, .L76+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L71
.L72:
	ldr	r0, [fp, #-20]
	bl	_storetrain(PLT)
	mov	r3, r0
	mov	r0, r3
	mov	r1, #0
	bl	_bwsettrain(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L71:
	ldr	r3, [fp, #-20]
	cmp	r3, #6
	ble	.L72
	mov	r0, #1
	ldr	r3, .L76+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #0
	mov	r1, #192
	bl	bwputc(PLT)
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L77:
	.align	2
.L76:
	.word	_GLOBAL_OFFSET_TABLE_-(.L75+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.size	train_init, .-train_init
	.section	.rodata
	.align	2
.LC5:
	.ascii	"Invalid Train Number: %d\012\000"
	.align	2
.LC6:
	.ascii	"Invalid Speed For Train: %d\012\000"
	.align	2
.LC7:
	.ascii	"Setting Train %d Speed: %d\012\000"
	.text
	.align	2
	.global	train_setspeed
	.type	train_setspeed, %function
train_setspeed:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L89
.L88:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r0, [fp, #-28]
	bl	_trainstore(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	bne	.L79
	ldr	r3, .L89+4
	add	r3, sl, r3
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	printf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L81
.L79:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	blt	.L82
	ldr	r3, [fp, #-32]
	cmp	r3, #14
	ble	.L84
.L82:
	ldr	r3, .L89+8
	add	r3, sl, r3
	mov	r0, r3
	ldr	r1, [fp, #-32]
	bl	printf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L81
.L84:
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, .L89+12
	ldr	r3, [sl, r3]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	bic	r2, r3, #15
	ldr	r3, [fp, #-32]
	orr	r2, r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, .L89+16
	add	r3, sl, r3
	mov	r0, r3
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-32]
	bl	printf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L85
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L81
.L85:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-32]
	bl	_settrain(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
.L81:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L90:
	.align	2
.L89:
	.word	_GLOBAL_OFFSET_TABLE_-(.L88+8)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	train_state(GOT)
	.word	.LC7(GOTOFF)
	.size	train_setspeed, .-train_setspeed
	.section	.rodata
	.align	2
.LC8:
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
	ldr	sl, .L100
.L99:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #83
	beq	.L94
	ldr	r3, [fp, #-36]
	cmp	r3, #83
	bgt	.L95
	ldr	r3, [fp, #-36]
	cmp	r3, #67
	beq	.L93
	b	.L92
.L95:
	ldr	r3, [fp, #-36]
	cmp	r3, #99
	beq	.L93
	ldr	r3, [fp, #-36]
	cmp	r3, #115
	beq	.L94
	b	.L92
.L94:
	mov	r3, #83
	str	r3, [fp, #-20]
	b	.L96
.L93:
	mov	r3, #67
	str	r3, [fp, #-20]
	b	.L96
.L92:
	ldr	r3, .L100+4
	add	r3, sl, r3
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	printf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L97
.L96:
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L100+8
	add	r3, sl, r3
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	printf(PLT)
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-20]
	bl	_setgate(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
.L97:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L101:
	.align	2
.L100:
	.word	_GLOBAL_OFFSET_TABLE_-(.L99+8)
	.word	.LC8(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	train_setgate, .-train_setgate
	.align	2
	.global	train_reverse
	.type	train_reverse, %function
train_reverse:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L110
.L109:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	ldr	r0, [fp, #-28]
	bl	_trainstore(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	bne	.L103
	ldr	r3, .L110+4
	add	r3, sl, r3
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	printf(PLT)
.L103:
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, .L110+8
	ldr	r3, [sl, r3]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L105
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	_settrain(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L107
.L105:
	ldr	r2, [fp, #-20]
	mov	r3, #1
	str	r3, [r2, #4]
	ldr	r3, .L110+12
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #50
	ldr	r3, [fp, #-20]
	str	r2, [r3, #8]
	mov	r0, #0
	bl	puttrain(PLT)
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r0, r3
	bl	puttrain(PLT)
	mov	r3, #0
	str	r3, [fp, #-32]
.L107:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L111:
	.align	2
.L110:
	.word	_GLOBAL_OFFSET_TABLE_-(.L109+8)
	.word	.LC5(GOTOFF)
	.word	train_state(GOT)
	.word	clock_ticks(GOT)
	.size	train_reverse, .-train_reverse
	.align	2
	.global	train_poll
	.type	train_poll, %function
train_poll:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L121
.L120:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L113
.L114:
	ldr	r0, [fp, #-24]
	bl	_storetrain(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, .L121+4
	ldr	r1, [sl, r3]
	mov	r0, #4
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #1
	bne	.L115
	ldr	r2, [fp, #-24]
	ldr	r3, .L121+4
	ldr	r1, [sl, r3]
	mov	r0, #8
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r2, [r3, #0]
	ldr	r3, .L121+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bcs	.L115
	ldr	r0, [fp, #-20]
	mov	r1, #15
	bl	_settrain(PLT)
	ldr	r2, [fp, #-24]
	ldr	r3, .L121+4
	ldr	r1, [sl, r3]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	_settrain(PLT)
	ldr	r2, [fp, #-24]
	ldr	r3, .L121+4
	ldr	r1, [sl, r3]
	mov	r0, #4
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #0
	str	r3, [r2, #0]
.L115:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L113:
	ldr	r3, [fp, #-24]
	cmp	r3, #6
	ble	.L114
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L122:
	.align	2
.L121:
	.word	_GLOBAL_OFFSET_TABLE_-(.L120+8)
	.word	train_state(GOT)
	.word	clock_ticks(GOT)
	.size	train_poll, .-train_poll
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
	.align	2
train_state:
	.space	84
	.ident	"GCC: (GNU) 4.0.2"
