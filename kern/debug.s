	.file	"debug.c"
	.global	worst_try
	.bss
	.align	2
	.type	worst_try, %object
	.size	worst_try, 8
worst_try:
	.space	8
	.global	current_try
	.align	2
	.type	current_try, %object
	.size	current_try, 8
current_try:
	.space	8
	.global	last_try
	.align	2
	.type	last_try, %object
	.size	last_try, 8
last_try:
	.space	8
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
	ldr	r3, [sl, r3]
	mov	r1, #0
	mov	r2, #0
	stmia	r3, {r1-r2}
	bl	clock_t4enable(PLT)
	bl	clock_t4tick(PLT)
	mov	r3, r0
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L4+8
	ldr	r3, [sl, r3]
	stmia	r3, {r1-r2}
	ldmfd	sp, {sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	worst_try(GOT)
	.word	last_try(GOT)
	.size	debug_init, .-debug_init
	.align	2
	.global	debug_loop
	.type	debug_loop, %function
debug_loop:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L12
.L11:
	add	sl, pc, sl
	bl	clock_t4tick(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L12+4
	ldr	r3, [sl, r3]
	ldmia	r3, {r3-r4}
	mov	r5, r1
	mov	r6, r2
	subs	r5, r5, r3
	sbc	r6, r6, r4
	str	r5, [fp, #-48]
	str	r6, [fp, #-44]
	ldr	r3, .L12+8
	ldr	r3, [sl, r3]
	ldmia	r3, {r1-r2}
	str	r1, [fp, #-40]
	str	r2, [fp, #-36]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bgt	.L9
	ldr	r5, [fp, #-44]
	ldr	r6, [fp, #-36]
	cmp	r5, r6
	bne	.L7
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-40]
	cmp	r1, r2
	bhi	.L9
	b	.L7
.L9:
	ldr	r3, [fp, #-32]
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L12+4
	ldr	r3, [sl, r3]
	ldmia	r3, {r3-r4}
	subs	r1, r1, r3
	sbc	r2, r2, r4
	ldr	r3, .L12+8
	ldr	r3, [sl, r3]
	stmia	r3, {r1-r2}
.L7:
	ldr	r3, [fp, #-32]
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L12+4
	ldr	r3, [sl, r3]
	stmia	r3, {r1-r2}
	sub	sp, fp, #28
	ldmfd	sp, {r4, r5, r6, sl, fp, sp, pc}
.L13:
	.align	2
.L12:
	.word	_GLOBAL_OFFSET_TABLE_-(.L11+8)
	.word	last_try(GOT)
	.word	worst_try(GOT)
	.size	debug_loop, .-debug_loop
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
	ldr	sl, .L17
.L16:
	add	sl, pc, sl
	mov	r0, #6
	mov	r1, #70
	bl	setpos(PLT)
	ldr	r3, .L17+4
	ldr	r3, [sl, r3]
	ldmia	r3, {r1-r2}
	ldr	r3, .L17+8
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	mov	r0, #7
	mov	r1, #70
	bl	setpos(PLT)
	mov	r0, #8
	mov	r1, #70
	bl	setpos(PLT)
	ldr	r3, .L17+12
	ldr	r3, [sl, r3]
	ldmia	r3, {r1-r2}
	ldr	r3, .L17+8
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L18:
	.align	2
.L17:
	.word	_GLOBAL_OFFSET_TABLE_-(.L16+8)
	.word	worst_try(GOT)
	.word	.LC0(GOTOFF)
	.word	last_try(GOT)
	.size	debug_print, .-debug_print
	.ident	"GCC: (GNU) 4.0.2"
