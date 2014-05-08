	.file	"clock.c"
	.bss
	.align	2
tens:
	.space	4
	.align	2
secs:
	.space	4
	.align	2
mins:
	.space	4
	.align	2
last_tick:
	.space	4
	.text
	.align	2
	.global	clock_init
	.type	clock_init, %function
clock_init:
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
	ldr	r3, .L4+8
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
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
	ldr	r3, .L4+24
	str	r3, [r2, #0]
	ldr	r3, .L4+20
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, #200
	str	r3, [r2, #0]
	ldr	r3, .L4+20
	ldr	r2, [sl, r3]
	ldr	r3, .L4+28
	str	r3, [r2, #0]
	ldr	r3, .L4+20
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, #192
	str	r3, [r2, #0]
	ldr	r3, .L4+20
	ldr	r2, [sl, r3]
	ldr	r3, .L4+32
	str	r3, [r2, #0]
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	tens(GOT)
	.word	secs(GOT)
	.word	mins(GOT)
	.word	last_tick(GOT)
	.word	T3_VAL(GOT)
	.word	-2139029376
	.word	-2139029368
	.word	-2139029372
	.size	clock_init, .-clock_init
	.align	2
	.global	clock_get
	.type	clock_get, %function
clock_get:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L9
.L8:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, .L9+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r3, .L9+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r3, .L9+12
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L8+8)
	.word	tens(GOT)
	.word	secs(GOT)
	.word	mins(GOT)
	.size	clock_get, .-clock_get
	.align	2
	.global	clock_poll
	.type	clock_poll, %function
clock_poll:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L22
.L21:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, .L22+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, .L22+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	cmp	r3, r2
	ble	.L12
	ldr	r3, .L22+12
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #9
	bne	.L14
	ldr	r3, .L22+12
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L22+16
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #59
	bne	.L16
	ldr	r3, .L22+16
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L22+20
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L22+20
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	b	.L19
.L16:
	ldr	r3, .L22+16
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L22+16
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	b	.L19
.L14:
	ldr	r3, .L22+12
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L22+12
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
.L19:
	mov	r3, #1
	str	r3, [fp, #-24]
.L12:
	ldr	r3, .L22+8
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L23:
	.align	2
.L22:
	.word	_GLOBAL_OFFSET_TABLE_-(.L21+8)
	.word	T3_VAL(GOT)
	.word	last_tick(GOT)
	.word	tens(GOT)
	.word	secs(GOT)
	.word	mins(GOT)
	.size	clock_poll, .-clock_poll
	.bss
	.align	2
T3_VAL:
	.space	4
	.ident	"GCC: (GNU) 4.0.2"
