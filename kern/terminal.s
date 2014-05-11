	.file	"terminal.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"=================     Gate States    =============="
	.ascii	"==\000"
	.align	2
.LC1:
	.ascii	"  1[ C ]   2[ C ]   3[ C ]   4[ C ]   5[ C ]   6[ C"
	.ascii	" ]\000"
	.align	2
.LC2:
	.ascii	"  7[ C ]   8[ C ]   9[ C ]  10[ C ]  11[ C ]  12[ C"
	.ascii	" ]\000"
	.align	2
.LC3:
	.ascii	" 13[ C ]  14[ C ]  15[ C ]  16[ C ]  17[ C ]  18[ C"
	.ascii	" ]\000"
	.align	2
.LC4:
	.ascii	"153[ C ] 154[ S ] 155[ C ] 156[ S ]\000"
	.align	2
.LC5:
	.ascii	"<<<<<<<<<<<<<<<<<  Recent Switches  <<<<<<<<<<<<<<<"
	.ascii	"<<\000"
	.text
	.align	2
	.global	term_switchtable
	.type	term_switchtable, %function
term_switchtable:
	@ args = 0, pretend = 0, frame = 308
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #308
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	ldr	r3, .L4+4
	add	r3, sl, r3
	sub	r2, fp, #70
	mov	ip, #54
	mov	r0, r2
	mov	r1, r3
	mov	r2, ip
	bl	memcpy(PLT)
	ldr	r3, .L4+8
	add	r3, sl, r3
	sub	lr, fp, #124
	mov	ip, r3
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1}
	str	r0, [lr, #0]
	add	lr, lr, #4
	strh	r1, [lr, #0]	@ movhi
	ldr	r3, .L4+12
	add	r3, sl, r3
	sub	r2, fp, #178
	mov	ip, #54
	mov	r0, r2
	mov	r1, r3
	mov	r2, ip
	bl	memcpy(PLT)
	ldr	r3, .L4+16
	add	r3, sl, r3
	sub	lr, fp, #232
	mov	ip, r3
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1}
	str	r0, [lr, #0]
	add	lr, lr, #4
	strh	r1, [lr, #0]	@ movhi
	ldr	r3, .L4+20
	add	r3, sl, r3
	sub	lr, fp, #268
	mov	ip, r3
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldr	r3, [ip, #0]
	str	r3, [lr, #0]
	ldr	r3, .L4+24
	add	r2, sl, r3
	sub	r3, fp, #320
	sub	r3, r3, #2
	mov	ip, #54
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	memcpy(PLT)
	mov	r0, #2
	mov	r1, #5
	bl	bwsetpos(PLT)
	sub	r3, fp, #70
	mov	r0, #1
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #3
	mov	r1, #5
	bl	bwsetpos(PLT)
	sub	r3, fp, #124
	mov	r0, #1
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #4
	mov	r1, #5
	bl	bwsetpos(PLT)
	sub	r3, fp, #178
	mov	r0, #1
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #5
	mov	r1, #5
	bl	bwsetpos(PLT)
	sub	r3, fp, #232
	mov	r0, #1
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #6
	mov	r1, #5
	bl	bwsetpos(PLT)
	sub	r3, fp, #268
	mov	r0, #1
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #8
	mov	r1, #5
	bl	bwsetpos(PLT)
	sub	r3, fp, #320
	sub	r3, r3, #2
	mov	r0, #1
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.size	term_switchtable, .-term_switchtable
	.section	.rodata
	.align	2
.LC6:
	.ascii	"INVALID GATE!\012\000"
	.text
	.align	2
	.global	term_uswitchtable
	.type	term_uswitchtable, %function
term_uswitchtable:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L17
.L16:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	mov	r3, r1
	strb	r3, [fp, #-32]
	ldr	r3, [fp, #-28]
	cmp	r3, #152
	ble	.L7
	ldr	r3, [fp, #-28]
	cmp	r3, #156
	bgt	.L7
	ldr	r3, [fp, #-28]
	sub	r3, r3, #135
	str	r3, [fp, #-28]
	b	.L10
.L7:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L10:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	blt	.L11
	ldr	r3, [fp, #-28]
	cmp	r3, #21
	ble	.L13
.L11:
	ldr	r3, .L17+4
	add	r3, sl, r3
	mov	r0, r3
	bl	printf(PLT)
	b	.L15
.L13:
	ldr	r2, [fp, #-28]
	ldr	r3, .L17+8
	smull	r0, r1, r3, r2
	mov	r3, r2, asr #31
	rsb	r3, r3, r1
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-28]
	ldr	r3, .L17+8
	smull	r0, r2, r3, r1
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r3, r3, r1
	str	r3, [fp, #-20]
	bl	savecur(PLT)
	ldr	r3, [fp, #-24]
	add	r1, r3, #3
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, #10
	mov	r0, r1
	mov	r1, r3
	bl	setpos(PLT)
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	mov	r0, r3
	bl	putc(PLT)
	bl	loadcur(PLT)
.L15:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L18:
	.align	2
.L17:
	.word	_GLOBAL_OFFSET_TABLE_-(.L16+8)
	.word	.LC6(GOTOFF)
	.word	715827883
	.size	term_uswitchtable, .-term_uswitchtable
	.section	.rodata
	.align	2
.LC7:
	.ascii	"\033[10;40r\000"
	.text
	.align	2
	.global	term_init
	.type	term_init, %function
term_init:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L25
.L24:
	add	sl, pc, sl
	bl	bwcls(PLT)
	mov	r0, #1
	ldr	r3, .L25+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L20
.L21:
	mov	r0, #1
	mov	r1, #10
	bl	bwputc(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L20:
	ldr	r3, [fp, #-20]
	cmp	r3, #99
	ble	.L21
	bl	bwsavecur(PLT)
	bl	term_switchtable(PLT)
	bl	bwloadcur(PLT)
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L26:
	.align	2
.L25:
	.word	_GLOBAL_OFFSET_TABLE_-(.L24+8)
	.word	.LC7(GOTOFF)
	.size	term_init, .-term_init
	.section	.rodata
	.align	2
.LC8:
	.ascii	"\033[r\000"
	.text
	.align	2
	.global	term_destroy
	.type	term_destroy, %function
term_destroy:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L30
.L29:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L30+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	bwcls(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L31:
	.align	2
.L30:
	.word	_GLOBAL_OFFSET_TABLE_-(.L29+8)
	.word	.LC8(GOTOFF)
	.size	term_destroy, .-term_destroy
	.ident	"GCC: (GNU) 4.0.2"
