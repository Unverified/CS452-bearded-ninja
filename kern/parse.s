	.file	"parse.c"
	.text
	.align	2
	.global	consume_integer
	.type	consume_integer, %function
consume_integer:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L3:
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r1, r3
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	add	r3, r1, r3
	sub	r3, r3, #48
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
.L2:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	isnum(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L3
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	consume_integer, .-consume_integer
	.align	2
	.global	consume_whitespace
	.type	consume_whitespace, %function
consume_whitespace:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	isspace(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L10
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L9
.L11:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
.L10:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	isspace(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L11
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L13
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L9
.L13:
	mov	r3, #0
	str	r3, [fp, #-24]
.L9:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	consume_whitespace, .-consume_whitespace
	.section	.rodata
	.align	2
.LC0:
	.ascii	"died at position %d(%d)\012\000"
	.text
	.align	2
	.global	parse_argument
	.type	parse_argument, %function
parse_argument:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	ldr	sl, .L27
.L26:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r2, [fp, #-28]
	str	r3, [fp, #-32]
	mov	r3, r1
	strb	r3, [fp, #-24]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-28]
	bl	consume_whitespace(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L17
	ldr	r3, [fp, #-28]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L27+4
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-40]
	b	.L19
.L17:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #99
	beq	.L21
	ldr	r3, [fp, #-36]
	cmp	r3, #105
	beq	.L22
	b	.L20
.L22:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-28]
	bl	consume_integer(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-32]
	str	r2, [r3, #0]
	b	.L20
.L21:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L23
	ldr	r3, [fp, #-28]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L27+4
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-40]
	b	.L19
.L23:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
.L20:
	mov	r3, #0
	str	r3, [fp, #-40]
.L19:
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L28:
	.align	2
.L27:
	.word	_GLOBAL_OFFSET_TABLE_-(.L26+8)
	.word	.LC0(GOTOFF)
	.size	parse_argument, .-parse_argument
	.align	2
	.global	parse_gate
	.type	parse_gate, %function
parse_gate:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-16]
	mov	r3, r1
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #119
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	add	r3, r1, #1
	str	r3, [fp, #-16]
	cmp	r2, #0
	beq	.L30
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L32
.L30:
	sub	r3, fp, #16
	ldr	r0, [fp, #-20]
	mov	r1, #105
	mov	r2, r3
	ldr	r3, [fp, #-24]
	bl	parse_argument(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L33
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L32
.L33:
	ldr	r3, [fp, #-24]
	add	ip, r3, #4
	sub	r3, fp, #16
	ldr	r0, [fp, #-20]
	mov	r1, #99
	mov	r2, r3
	mov	r3, ip
	bl	parse_argument(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L35
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L32
.L35:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	isspace(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L37
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L32
.L37:
	mov	r3, #0
	str	r3, [fp, #-28]
.L32:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	parse_gate, .-parse_gate
	.align	2
	.global	parse_train
	.type	parse_train, %function
parse_train:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-16]
	mov	r3, r1
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #114
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	add	r3, r1, #1
	str	r3, [fp, #-16]
	cmp	r2, #0
	beq	.L41
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L43
.L41:
	sub	r3, fp, #16
	ldr	r0, [fp, #-20]
	mov	r1, #105
	mov	r2, r3
	ldr	r3, [fp, #-24]
	bl	parse_argument(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L44
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L43
.L44:
	ldr	r3, [fp, #-24]
	add	ip, r3, #4
	sub	r3, fp, #16
	ldr	r0, [fp, #-20]
	mov	r1, #105
	mov	r2, r3
	mov	r3, ip
	bl	parse_argument(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L46
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L43
.L46:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	isspace(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L48
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L43
.L48:
	mov	r3, #0
	str	r3, [fp, #-28]
.L43:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	parse_train, .-parse_train
	.align	2
	.global	parse_stop
	.type	parse_stop, %function
parse_stop:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	isspace(PLT)
	mov	r3, r0
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	parse_stop, .-parse_stop
	.align	2
	.global	parse_reverse
	.type	parse_reverse, %function
parse_reverse:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-16]
	mov	r3, r1
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #118
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	add	r3, r1, #1
	str	r3, [fp, #-16]
	cmp	r2, #0
	beq	.L54
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L56
.L54:
	sub	r3, fp, #16
	ldr	r0, [fp, #-20]
	mov	r1, #105
	mov	r2, r3
	ldr	r3, [fp, #-24]
	bl	parse_argument(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L57
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L56
.L57:
	mov	r3, #0
	str	r3, [fp, #-28]
.L56:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	parse_reverse, .-parse_reverse
	.align	2
	.global	parse_command
	.type	parse_command, %function
parse_command:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #114
	beq	.L64
	ldr	r3, [fp, #-28]
	cmp	r3, #114
	bgt	.L67
	ldr	r3, [fp, #-28]
	cmp	r3, #13
	beq	.L62
	ldr	r3, [fp, #-28]
	cmp	r3, #113
	beq	.L63
	b	.L61
.L67:
	ldr	r3, [fp, #-28]
	cmp	r3, #115
	beq	.L65
	ldr	r3, [fp, #-28]
	cmp	r3, #116
	beq	.L66
	b	.L61
.L62:
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L68
.L63:
	ldr	r0, [fp, #-16]
	bl	parse_stop(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L69
	mov	r3, #5
	str	r3, [fp, #-24]
	b	.L68
.L69:
	mov	r3, #4
	str	r3, [fp, #-24]
	b	.L68
.L66:
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	bl	parse_train(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L71
	mov	r3, #5
	str	r3, [fp, #-24]
	b	.L68
.L71:
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L68
.L64:
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	bl	parse_reverse(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L73
	mov	r3, #5
	str	r3, [fp, #-24]
	b	.L68
.L73:
	mov	r3, #3
	str	r3, [fp, #-24]
	b	.L68
.L65:
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	bl	parse_gate(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L75
	mov	r3, #5
	str	r3, [fp, #-24]
	b	.L68
.L75:
	mov	r3, #2
	str	r3, [fp, #-24]
	b	.L68
.L61:
	mov	r3, #5
	str	r3, [fp, #-24]
.L68:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	parse_command, .-parse_command
	.ident	"GCC: (GNU) 4.0.2"
