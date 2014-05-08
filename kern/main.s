	.file	"main.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c[2J\000"
	.align	2
.LC1:
	.ascii	"%c[%d;%dH\000"
	.align	2
.LC2:
	.ascii	"Booting up NIK os\012\015\000"
	.align	2
.LC3:
	.ascii	"io setup success!!!!\012\015\000"
	.align	2
.LC4:
	.ascii	"clock setup success!!!!\012\015\000"
	.align	2
.LC5:
	.ascii	"%d %d %d\012\015\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	ldr	sl, .L23
.L22:
	add	sl, pc, sl
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	mov	r0, #1
	ldr	r3, .L23+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L23+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, #0
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	io_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L2
	mov	r3, #1
	str	r3, [fp, #-44]
	b	.L4
.L2:
	mov	r0, #1
	ldr	r3, .L23+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	clock_init(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L5
	mov	r3, #2
	str	r3, [fp, #-44]
	b	.L4
.L5:
	mov	r0, #1
	ldr	r3, .L23+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-32]
	bl	train_start(PLT)
	mov	r0, #1
	ldr	r3, .L23+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L23+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, #0
	bl	bwprintf(PLT)
	b	.L21
.L7:
.L21:
	bl	io_poll(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	bl	clock_poll(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	ble	.L8
	sub	r3, fp, #32
	sub	r2, fp, #28
	sub	ip, fp, #24
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	clock_get(PLT)
	ldr	r3, .L23+8
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, #27
	mov	r2, #0
	mov	r3, #0
	bl	printf(PLT)
	ldr	r2, [fp, #-32]
	ldr	ip, [fp, #-28]
	ldr	lr, [fp, #-24]
	ldr	r3, .L23+24
	add	r3, sl, r3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	mov	r3, lr
	bl	printf(PLT)
.L8:
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	ble	.L7
	ldr	r3, [fp, #-28]
	sub	r3, r3, #5
	cmp	r3, #50
	addls	pc, pc, r3, asl #2
	b	.L7
	.p2align 2
.L19:
	b	.L12
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L13
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L14
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L15
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L16
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L17
	b	.L7
	b	.L7
	b	.L7
	b	.L7
	b	.L18
.L12:
	mov	r0, #47
	mov	r1, #0
	bl	train_setspeed(PLT)
	b	.L7
.L13:
	mov	r0, #47
	mov	r1, #10
	bl	train_setspeed(PLT)
	b	.L7
.L14:
	mov	r0, #47
	mov	r1, #16
	bl	train_setspeed(PLT)
	b	.L7
.L15:
	mov	r0, #47
	mov	r1, #30
	bl	train_setspeed(PLT)
	b	.L7
.L16:
	mov	r0, #47
	mov	r1, #14
	bl	train_setspeed(PLT)
	b	.L7
.L17:
	mov	r0, #47
	mov	r1, #0
	bl	train_setspeed(PLT)
	b	.L7
.L18:
	mov	r0, #47
	mov	r1, #15
	bl	train_setspeed(PLT)
	b	.L7
.L4:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L24:
	.align	2
.L23:
	.word	_GLOBAL_OFFSET_TABLE_-(.L22+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
