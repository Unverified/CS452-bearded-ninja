	.file	"debug.c"
	.global	worst_loop
	.bss
	.align	2
	.type	worst_loop, %object
	.size	worst_loop, 4
worst_loop:
	.space	4
	.global	current_loop
	.align	2
	.type	current_loop, %object
	.size	current_loop, 4
current_loop:
	.space	4
	.global	previous_loop
	.align	2
	.type	previous_loop, %object
	.size	previous_loop, 4
previous_loop:
	.space	4
	.global	avg_pollrespond
	.align	2
	.type	avg_pollrespond, %object
	.size	avg_pollrespond, 4
avg_pollrespond:
	.space	4
	.global	avg_pollrespondall
	.align	2
	.type	avg_pollrespondall, %object
	.size	avg_pollrespondall, 4
avg_pollrespondall:
	.space	4
	.global	profile1
	.align	2
	.type	profile1, %object
	.size	profile1, 4
profile1:
	.space	4
	.global	poll_start
	.align	2
	.type	poll_start, %object
	.size	poll_start, 4
poll_start:
	.space	4
	.text
	.align	2
	.global	debug_init
	.type	debug_init, %function
debug_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	ldr	r3, .L4+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	bl	clock_t4enable(PLT)
	bl	clock_t4tick(PLT)
	mov	r2, r0
	ldr	r3, .L4+8
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L4+12
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L4+16
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L4+20
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L4+24
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldmfd	sp, {sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	worst_loop(GOT)
	.word	previous_loop(GOT)
	.word	poll_start(GOT)
	.word	profile1(GOT)
	.word	avg_pollrespond(GOT)
	.word	avg_pollrespondall(GOT)
	.size	debug_init, .-debug_init
	.align	2
	.global	debug_loop
	.type	debug_loop, %function
debug_loop:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L11
.L10:
	add	sl, pc, sl
	bl	clock_t4tick(PLT)
	mov	r2, r0
	ldr	r3, .L11+4
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L11+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L11+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	rsb	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, .L11+12
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bls	.L7
	ldr	r3, [fp, #-20]
	ldr	r2, .L11+12
	ldr	r2, [sl, r2]
	str	r3, [r2, #0]
.L7:
	ldr	r3, .L11+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L11+8
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	current_loop(GOT)
	.word	previous_loop(GOT)
	.word	worst_loop(GOT)
	.size	debug_loop, .-debug_loop
	.align	2
	.global	debug_pollsent
	.type	debug_pollsent, %function
debug_pollsent:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L16
.L15:
	add	sl, pc, sl
	ldr	r3, .L16+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	bl	clock_t4tick(PLT)
	mov	r2, r0
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldmfd	sp, {sl, fp, sp, pc}
.L17:
	.align	2
.L16:
	.word	_GLOBAL_OFFSET_TABLE_-(.L15+8)
	.word	profile1(GOT)
	.word	poll_start(GOT)
	.size	debug_pollsent, .-debug_pollsent
	.align	2
	.global	debug_responce
	.type	debug_responce, %function
debug_responce:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L26
.L25:
	add	sl, pc, sl
	ldr	r3, .L26+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L24
	bl	clock_t4tick(PLT)
	mov	r2, r0
	ldr	r3, .L26+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	rsb	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, .L26+12
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L21
	ldr	r3, [fp, #-20]
	ldr	r2, .L26+12
	ldr	r2, [sl, r2]
	str	r3, [r2, #0]
	b	.L23
.L21:
	ldr	r3, .L26+12
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, lsr #1
	ldr	r3, .L26+12
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
.L23:
	ldr	r3, .L26+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
.L24:
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L27:
	.align	2
.L26:
	.word	_GLOBAL_OFFSET_TABLE_-(.L25+8)
	.word	profile1(GOT)
	.word	poll_start(GOT)
	.word	avg_pollrespond(GOT)
	.size	debug_responce, .-debug_responce
	.align	2
	.global	debug_allresponces
	.type	debug_allresponces, %function
debug_allresponces:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L34
.L33:
	add	sl, pc, sl
	bl	clock_t4tick(PLT)
	mov	r2, r0
	ldr	r3, .L34+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	rsb	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, .L34+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L29
	ldr	r3, [fp, #-20]
	ldr	r2, .L34+12
	ldr	r2, [sl, r2]
	str	r3, [r2, #0]
	b	.L32
.L29:
	ldr	r3, .L34+12
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, lsr #1
	ldr	r3, .L34+12
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
.L32:
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L35:
	.align	2
.L34:
	.word	_GLOBAL_OFFSET_TABLE_-(.L33+8)
	.word	poll_start(GOT)
	.word	avg_pollrespond(GOT)
	.word	avg_pollrespondall(GOT)
	.size	debug_allresponces, .-debug_allresponces
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\000"
	.text
	.align	2
	.global	debug_print
	.type	debug_print, %function
debug_print:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L39
.L38:
	add	sl, pc, sl
	mov	r0, #6
	mov	r1, #70
	bl	setpos(PLT)
	ldr	r3, .L39+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L39+8
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	bl	printf(PLT)
	mov	r0, #8
	mov	r1, #70
	bl	setpos(PLT)
	ldr	r3, .L39+12
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L39+8
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	bl	printf(PLT)
	mov	r0, #9
	mov	r1, #70
	bl	setpos(PLT)
	ldr	r3, .L39+16
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L39+8
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	bl	printf(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L40:
	.align	2
.L39:
	.word	_GLOBAL_OFFSET_TABLE_-(.L38+8)
	.word	worst_loop(GOT)
	.word	.LC0(GOTOFF)
	.word	avg_pollrespond(GOT)
	.word	avg_pollrespondall(GOT)
	.size	debug_print, .-debug_print
	.ident	"GCC: (GNU) 4.0.2"
