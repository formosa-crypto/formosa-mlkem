	.att_syntax
	.text
	.p2align	5
	.global	_shake256x4_A128__A32_A1_avx2x4
	.global	shake256x4_A128__A32_A1_avx2x4
	.global	_shake128x4_absorb_squeeze3blocks_avx2x4
	.global	shake128x4_absorb_squeeze3blocks_avx2x4
	.global	_shake128x4_absorb_avx2x4
	.global	shake128x4_absorb_avx2x4
	.global	_shake256_A32__A1600_avx2
	.global	shake256_A32__A1600_avx2
	.global	_shake256_A32__A1120_avx2
	.global	shake256_A32__A1120_avx2
	.global	_sha3_256A_A1568_avx2
	.global	sha3_256A_A1568_avx2
	.global	_sha3_256A_A1184_avx2
	.global	sha3_256A_A1184_avx2
	.global	_shake128_next_state_avx2
	.global	shake128_next_state_avx2
	.global	_shake128_absorb_squeeze3blocks_avx2
	.global	shake128_absorb_squeeze3blocks_avx2
	.global	_shake256x4_A128__A32_A1_avx2
	.global	shake256x4_A128__A32_A1_avx2
	.global	_shake256_A128__A32_A1_avx2
	.global	shake256_A128__A32_A1_avx2
	.global	_sha3_512A_A64_avx2
	.global	sha3_512A_A64_avx2
	.global	_sha3_512A_A33_avx2
	.global	sha3_512A_A33_avx2
_shake256x4_A128__A32_A1_avx2x4:
shake256x4_A128__A32_A1_avx2x4:
	movq	%rsp, %rax
	leaq	-840(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 800(%rsp)
	movq	%rbp, 808(%rsp)
	movq	%r12, 816(%rsp)
	movq	%r13, 824(%rsp)
	movq	%rax, 832(%rsp)
	movq	%rsp, %rax
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %r10
	jmp 	Lshake256x4_A128__A32_A1_avx2x4$8
Lshake256x4_A128__A32_A1_avx2x4$9:
	vmovdqu	%ymm0, (%rax,%r10)
	addq	$32, %r10
Lshake256x4_A128__A32_A1_avx2x4$8:
	cmpq	$800, %r10
	jb  	Lshake256x4_A128__A32_A1_avx2x4$9
	movq	$0, %r10
	movq	$0, %r11
	jmp 	Lshake256x4_A128__A32_A1_avx2x4$6
Lshake256x4_A128__A32_A1_avx2x4$7:
	vpbroadcastq	(%r8,%r10), %ymm0
	addq	$8, %r10
	vpxor	(%rax,%r11), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax,%r11)
	addq	$32, %r11
Lshake256x4_A128__A32_A1_avx2x4$6:
	cmpq	$128, %r11
	jb  	Lshake256x4_A128__A32_A1_avx2x4$7
	movq	$0, %rbx
	movq	%r9, %r12
	leaq	1(%r9), %r8
	leaq	2(%r9), %r10
	leaq	3(%r9), %r9
	movq	$16, %r11
	movq	$0, %rbp
	movq	$0, %r13
	movzbq	(%r12,%rbx), %r12
	orq 	$7936, %r12
	shlq	$0, %r12
	orq 	%r12, %r13
	shlq	$0, %r13
	orq 	%r13, %rbp
	movq	$0, %r12
	movq	$0, %r13
	movzbq	(%r8,%rbx), %r8
	orq 	$7936, %r8
	shlq	$0, %r8
	orq 	%r8, %r13
	shlq	$0, %r13
	orq 	%r13, %r12
	movq	$0, %r8
	movq	$0, %r13
	movzbq	(%r10,%rbx), %r10
	orq 	$7936, %r10
	shlq	$0, %r10
	orq 	%r10, %r13
	shlq	$0, %r13
	orq 	%r13, %r8
	movq	$0, %r10
	movq	$0, %r13
	movzbq	(%r9,%rbx), %r9
	orq 	$7936, %r9
	shlq	$0, %r9
	orq 	%r9, %r13
	shlq	$0, %r13
	orq 	%r13, %r10
	xorq	(%rax,%r11,8), %rbp
	movq	%rbp, (%rax,%r11,8)
	xorq	8(%rax,%r11,8), %r12
	movq	%r12, 8(%rax,%r11,8)
	xorq	16(%rax,%r11,8), %r8
	movq	%r8, 16(%rax,%r11,8)
	xorq	24(%rax,%r11,8), %r10
	movq	%r10, 24(%rax,%r11,8)
	movq	$1, %r8
	shlq	$63, %r8
	movq	%r8, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpxor	512(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 512(%rax)
	movq	$0, %r11
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
Lshake256x4_A128__A32_A1_avx2x4$5:
	leaq	824(%rsp), %rsp
	movq	$0, %r8
	jmp 	Lshake256x4_A128__A32_A1_avx2x4$3
Lshake256x4_A128__A32_A1_avx2x4$4:
	vmovdqu	(%rax,%r8,4), %ymm0
	vmovdqu	32(%rax,%r8,4), %ymm1
	vmovdqu	64(%rax,%r8,4), %ymm2
	vmovdqu	96(%rax,%r8,4), %ymm3
	addq	$32, %r8
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%rdi,%r11)
	vmovdqu	%ymm3, (%rsi,%r11)
	vmovdqu	%ymm4, (%rdx,%r11)
	vmovdqu	%ymm0, (%rcx,%r11)
	addq	$32, %r11
Lshake256x4_A128__A32_A1_avx2x4$3:
	cmpq	$128, %r8
	jl  	Lshake256x4_A128__A32_A1_avx2x4$4
	jmp 	Lshake256x4_A128__A32_A1_avx2x4$1
Lshake256x4_A128__A32_A1_avx2x4$2:
	movq	(%rax,%r8,4), %r9
	movq	%r9, (%rdi,%r11)
	movq	8(%rax,%r8,4), %r9
	movq	%r9, (%rsi,%r11)
	movq	16(%rax,%r8,4), %r9
	movq	%r9, (%rdx,%r11)
	movq	24(%rax,%r8,4), %r9
	movq	%r9, (%rcx,%r11)
	addq	$8, %r8
	addq	$8, %r11
Lshake256x4_A128__A32_A1_avx2x4$1:
	cmpq	$128, %r8
	jl  	Lshake256x4_A128__A32_A1_avx2x4$2
	movq	800(%rsp), %rbx
	movq	808(%rsp), %rbp
	movq	816(%rsp), %r12
	movq	824(%rsp), %r13
	movq	832(%rsp), %rsp
	ret
_shake128x4_absorb_squeeze3blocks_avx2x4:
shake128x4_absorb_squeeze3blocks_avx2x4:
	movq	%rsp, %rax
	leaq	-816(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 800(%rsp)
	movq	%rax, 808(%rsp)
	movq	%rsp, %rax
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %rcx
	jmp 	Lshake128x4_absorb_squeeze3blocks_avx2x4$18
Lshake128x4_absorb_squeeze3blocks_avx2x4$19:
	vmovdqu	%ymm0, (%rax,%rcx)
	addq	$32, %rcx
Lshake128x4_absorb_squeeze3blocks_avx2x4$18:
	cmpq	$800, %rcx
	jb  	Lshake128x4_absorb_squeeze3blocks_avx2x4$19
	movq	$0, %rax
	movq	%rsp, %rcx
	movq	$0, %r8
	jmp 	Lshake128x4_absorb_squeeze3blocks_avx2x4$16
Lshake128x4_absorb_squeeze3blocks_avx2x4$17:
	vpbroadcastq	(%rsi,%rax), %ymm0
	addq	$8, %rax
	vpxor	(%rcx,%r8), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rcx,%r8)
	addq	$32, %r8
Lshake128x4_absorb_squeeze3blocks_avx2x4$16:
	cmpq	$128, %r8
	jb  	Lshake128x4_absorb_squeeze3blocks_avx2x4$17
	movq	$0, %r8
	movq	%rsp, %rax
	movq	%rdx, %r10
	leaq	2(%rdx), %r11
	leaq	4(%rdx), %rcx
	leaq	6(%rdx), %rdx
	movq	$16, %rsi
	movq	$0, %r9
	movzwq	(%r10,%r8), %r10
	movq	$31, %rbx
	shlq	$16, %rbx
	orq 	%rbx, %r10
	shlq	$0, %r10
	orq 	%r10, %r9
	movq	$0, %r10
	movzwq	(%r11,%r8), %r11
	movq	$31, %rbx
	shlq	$16, %rbx
	orq 	%rbx, %r11
	shlq	$0, %r11
	orq 	%r11, %r10
	movq	$0, %r11
	movzwq	(%rcx,%r8), %rcx
	movq	$31, %rbx
	shlq	$16, %rbx
	orq 	%rbx, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %r11
	movq	$0, %rcx
	movzwq	(%rdx,%r8), %rdx
	movq	$31, %r8
	shlq	$16, %r8
	orq 	%r8, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
	xorq	(%rax,%rsi,8), %r9
	movq	%r9, (%rax,%rsi,8)
	xorq	8(%rax,%rsi,8), %r10
	movq	%r10, 8(%rax,%rsi,8)
	xorq	16(%rax,%rsi,8), %r11
	movq	%r11, 16(%rax,%rsi,8)
	xorq	24(%rax,%rsi,8), %rcx
	movq	%rcx, 24(%rax,%rsi,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpxor	640(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 640(%rax)
	movq	%rdi, %rcx
	leaq	536(%rdi), %rdx
	leaq	1072(%rdi), %rsi
	leaq	1608(%rdi), %rdi
	movq	$0, %r11
	movq	%rsp, %rax
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
Lshake128x4_absorb_squeeze3blocks_avx2x4$15:
	leaq	824(%rsp), %rsp
	movq	%rsp, %rax
	movq	$0, %r8
	jmp 	Lshake128x4_absorb_squeeze3blocks_avx2x4$13
Lshake128x4_absorb_squeeze3blocks_avx2x4$14:
	vmovdqu	(%rax,%r8,4), %ymm0
	vmovdqu	32(%rax,%r8,4), %ymm1
	vmovdqu	64(%rax,%r8,4), %ymm2
	vmovdqu	96(%rax,%r8,4), %ymm3
	addq	$32, %r8
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%rcx,%r11)
	vmovdqu	%ymm3, (%rdx,%r11)
	vmovdqu	%ymm4, (%rsi,%r11)
	vmovdqu	%ymm0, (%rdi,%r11)
	addq	$32, %r11
Lshake128x4_absorb_squeeze3blocks_avx2x4$13:
	cmpq	$160, %r8
	jl  	Lshake128x4_absorb_squeeze3blocks_avx2x4$14
	jmp 	Lshake128x4_absorb_squeeze3blocks_avx2x4$11
Lshake128x4_absorb_squeeze3blocks_avx2x4$12:
	movq	(%rax,%r8,4), %r9
	movq	%r9, (%rcx,%r11)
	movq	8(%rax,%r8,4), %r9
	movq	%r9, (%rdx,%r11)
	movq	16(%rax,%r8,4), %r9
	movq	%r9, (%rsi,%r11)
	movq	24(%rax,%r8,4), %r9
	movq	%r9, (%rdi,%r11)
	addq	$8, %r8
	addq	$8, %r11
Lshake128x4_absorb_squeeze3blocks_avx2x4$11:
	cmpq	$168, %r8
	jl  	Lshake128x4_absorb_squeeze3blocks_avx2x4$12
	movq	%rsp, %rax
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
Lshake128x4_absorb_squeeze3blocks_avx2x4$10:
	leaq	824(%rsp), %rsp
	movq	%rsp, %rax
	movq	$0, %r8
	jmp 	Lshake128x4_absorb_squeeze3blocks_avx2x4$8
Lshake128x4_absorb_squeeze3blocks_avx2x4$9:
	vmovdqu	(%rax,%r8,4), %ymm0
	vmovdqu	32(%rax,%r8,4), %ymm1
	vmovdqu	64(%rax,%r8,4), %ymm2
	vmovdqu	96(%rax,%r8,4), %ymm3
	addq	$32, %r8
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%rcx,%r11)
	vmovdqu	%ymm3, (%rdx,%r11)
	vmovdqu	%ymm4, (%rsi,%r11)
	vmovdqu	%ymm0, (%rdi,%r11)
	addq	$32, %r11
Lshake128x4_absorb_squeeze3blocks_avx2x4$8:
	cmpq	$160, %r8
	jl  	Lshake128x4_absorb_squeeze3blocks_avx2x4$9
	jmp 	Lshake128x4_absorb_squeeze3blocks_avx2x4$6
Lshake128x4_absorb_squeeze3blocks_avx2x4$7:
	movq	(%rax,%r8,4), %r9
	movq	%r9, (%rcx,%r11)
	movq	8(%rax,%r8,4), %r9
	movq	%r9, (%rdx,%r11)
	movq	16(%rax,%r8,4), %r9
	movq	%r9, (%rsi,%r11)
	movq	24(%rax,%r8,4), %r9
	movq	%r9, (%rdi,%r11)
	addq	$8, %r8
	addq	$8, %r11
Lshake128x4_absorb_squeeze3blocks_avx2x4$6:
	cmpq	$168, %r8
	jl  	Lshake128x4_absorb_squeeze3blocks_avx2x4$7
	movq	%rsp, %rax
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
Lshake128x4_absorb_squeeze3blocks_avx2x4$5:
	leaq	824(%rsp), %rsp
	movq	%rsp, %rax
	movq	$0, %r8
	jmp 	Lshake128x4_absorb_squeeze3blocks_avx2x4$3
Lshake128x4_absorb_squeeze3blocks_avx2x4$4:
	vmovdqu	(%rax,%r8,4), %ymm0
	vmovdqu	32(%rax,%r8,4), %ymm1
	vmovdqu	64(%rax,%r8,4), %ymm2
	vmovdqu	96(%rax,%r8,4), %ymm3
	addq	$32, %r8
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%rcx,%r11)
	vmovdqu	%ymm3, (%rdx,%r11)
	vmovdqu	%ymm4, (%rsi,%r11)
	vmovdqu	%ymm0, (%rdi,%r11)
	addq	$32, %r11
Lshake128x4_absorb_squeeze3blocks_avx2x4$3:
	cmpq	$192, %r8
	jl  	Lshake128x4_absorb_squeeze3blocks_avx2x4$4
	jmp 	Lshake128x4_absorb_squeeze3blocks_avx2x4$1
Lshake128x4_absorb_squeeze3blocks_avx2x4$2:
	movq	(%rax,%r8,4), %r9
	movq	%r9, (%rcx,%r11)
	movq	8(%rax,%r8,4), %r9
	movq	%r9, (%rdx,%r11)
	movq	16(%rax,%r8,4), %r9
	movq	%r9, (%rsi,%r11)
	movq	24(%rax,%r8,4), %r9
	movq	%r9, (%rdi,%r11)
	addq	$8, %r8
	addq	$8, %r11
Lshake128x4_absorb_squeeze3blocks_avx2x4$1:
	cmpq	$200, %r8
	jl  	Lshake128x4_absorb_squeeze3blocks_avx2x4$2
	movq	800(%rsp), %rbx
	movq	808(%rsp), %rsp
	ret
_shake128x4_absorb_avx2x4:
shake128x4_absorb_avx2x4:
	movq	%rsp, %rax
	leaq	-840(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 800(%rsp)
	movq	%rbp, 808(%rsp)
	movq	%r12, 816(%rsp)
	movq	%r13, 824(%rsp)
	movq	%rax, 832(%rsp)
	movq	%rsp, %rax
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %r10
	jmp 	Lshake128x4_absorb_avx2x4$3
Lshake128x4_absorb_avx2x4$4:
	vmovdqu	%ymm0, (%rax,%r10)
	addq	$32, %r10
Lshake128x4_absorb_avx2x4$3:
	cmpq	$800, %r10
	jb  	Lshake128x4_absorb_avx2x4$4
	movq	$0, %rax
	movq	%rsp, %r10
	movq	$0, %r11
	jmp 	Lshake128x4_absorb_avx2x4$1
Lshake128x4_absorb_avx2x4$2:
	vpbroadcastq	(%r8,%rax), %ymm0
	addq	$8, %rax
	vpxor	(%r10,%r11), %ymm0, %ymm0
	vmovdqu	%ymm0, (%r10,%r11)
	addq	$32, %r11
Lshake128x4_absorb_avx2x4$1:
	cmpq	$128, %r11
	jb  	Lshake128x4_absorb_avx2x4$2
	movq	$0, %rbx
	movq	%rsp, %rax
	movq	%r9, %r12
	leaq	2(%r9), %r8
	leaq	4(%r9), %r10
	leaq	6(%r9), %r9
	movq	$16, %r11
	movq	$0, %rbp
	movzwq	(%r12,%rbx), %r12
	movq	$31, %r13
	shlq	$16, %r13
	orq 	%r13, %r12
	shlq	$0, %r12
	orq 	%r12, %rbp
	movq	$0, %r12
	movzwq	(%r8,%rbx), %r8
	movq	$31, %r13
	shlq	$16, %r13
	orq 	%r13, %r8
	shlq	$0, %r8
	orq 	%r8, %r12
	movq	$0, %r8
	movzwq	(%r10,%rbx), %r10
	movq	$31, %r13
	shlq	$16, %r13
	orq 	%r13, %r10
	shlq	$0, %r10
	orq 	%r10, %r8
	movq	$0, %r10
	movzwq	(%r9,%rbx), %r9
	movq	$31, %rbx
	shlq	$16, %rbx
	orq 	%rbx, %r9
	shlq	$0, %r9
	orq 	%r9, %r10
	xorq	(%rax,%r11,8), %rbp
	movq	%rbp, (%rax,%r11,8)
	xorq	8(%rax,%r11,8), %r12
	movq	%r12, 8(%rax,%r11,8)
	xorq	16(%rax,%r11,8), %r8
	movq	%r8, 16(%rax,%r11,8)
	xorq	24(%rax,%r11,8), %r10
	movq	%r10, 24(%rax,%r11,8)
	movq	$1, %r8
	shlq	$63, %r8
	movq	%r8, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpxor	640(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 640(%rax)
	movq	%rsp, %rax
	vmovdqu	(%rax), %ymm0
	vmovdqu	32(%rax), %ymm1
	vmovdqu	64(%rax), %ymm2
	vmovdqu	96(%rax), %ymm3
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%rdi)
	vmovdqu	%ymm3, (%rsi)
	vmovdqu	%ymm4, (%rdx)
	vmovdqu	%ymm0, (%rcx)
	vmovdqu	128(%rax), %ymm0
	vmovdqu	160(%rax), %ymm1
	vmovdqu	192(%rax), %ymm2
	vmovdqu	224(%rax), %ymm3
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, 32(%rdi)
	vmovdqu	%ymm3, 32(%rsi)
	vmovdqu	%ymm4, 32(%rdx)
	vmovdqu	%ymm0, 32(%rcx)
	vmovdqu	256(%rax), %ymm0
	vmovdqu	288(%rax), %ymm1
	vmovdqu	320(%rax), %ymm2
	vmovdqu	352(%rax), %ymm3
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, 64(%rdi)
	vmovdqu	%ymm3, 64(%rsi)
	vmovdqu	%ymm4, 64(%rdx)
	vmovdqu	%ymm0, 64(%rcx)
	vmovdqu	384(%rax), %ymm0
	vmovdqu	416(%rax), %ymm1
	vmovdqu	448(%rax), %ymm2
	vmovdqu	480(%rax), %ymm3
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, 96(%rdi)
	vmovdqu	%ymm3, 96(%rsi)
	vmovdqu	%ymm4, 96(%rdx)
	vmovdqu	%ymm0, 96(%rcx)
	vmovdqu	512(%rax), %ymm0
	vmovdqu	544(%rax), %ymm1
	vmovdqu	576(%rax), %ymm2
	vmovdqu	608(%rax), %ymm3
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, 128(%rdi)
	vmovdqu	%ymm3, 128(%rsi)
	vmovdqu	%ymm4, 128(%rdx)
	vmovdqu	%ymm0, 128(%rcx)
	vmovdqu	640(%rax), %ymm0
	vmovdqu	672(%rax), %ymm1
	vmovdqu	704(%rax), %ymm2
	vmovdqu	736(%rax), %ymm3
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, 160(%rdi)
	vmovdqu	%ymm3, 160(%rsi)
	vmovdqu	%ymm4, 160(%rdx)
	vmovdqu	%ymm0, 160(%rcx)
	movq	768(%rax), %r8
	movq	776(%rax), %r9
	movq	784(%rax), %r10
	movq	792(%rax), %rax
	movq	%r8, 192(%rdi)
	movq	%r9, 192(%rsi)
	movq	%r10, 192(%rdx)
	movq	%rax, 192(%rcx)
	movq	800(%rsp), %rbx
	movq	808(%rsp), %rbp
	movq	816(%rsp), %r12
	movq	824(%rsp), %r13
	movq	832(%rsp), %rsp
	ret
_shake256_A32__A1600_avx2:
shake256_A32__A1600_avx2:
	movq	%rsp, %r10
	andq	$-8, %rsp
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm4, %ymm4, %ymm4
	movq	$0, %rdx
	movq	$0, %r8
	jmp 	Lshake256_A32__A1600_avx2$2
Lshake256_A32__A1600_avx2$3:
	movq	(%rsi,%rdx), %rax
	movq	%rax, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	vmovdqu	8(%rsi,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rsi,%rdx), %rax
	movq	%rax, %xmm9
	vmovdqu	48(%rsi,%rdx), %ymm7
	movq	80(%rsi,%rdx), %rax
	movq	%rax, %xmm10
	vmovdqu	88(%rsi,%rdx), %ymm8
	movq	120(%rsi,%rdx), %rax
	vpinsrq	$1, %rax, %xmm9, %xmm11
	vpxor	%xmm9, %xmm9, %xmm9
	vmovq	128(%rsi,%rdx), %xmm12
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm12, %xmm12
	vinserti128	$1, %xmm9, %ymm12, %ymm9
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm0, %ymm0
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm8, %ymm4, %ymm4
	addq	$136, %rdx
	call	L_keccakf1600_avx2$1
Lshake256_A32__A1600_avx2$4:
	incq	%r8
Lshake256_A32__A1600_avx2$2:
	cmpq	$11, %r8
	jb  	Lshake256_A32__A1600_avx2$3
	movq	(%rsi,%rdx), %rax
	movq	%rax, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	vmovdqu	8(%rsi,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rsi,%rdx), %rax
	movq	%rax, %xmm9
	vmovdqu	48(%rsi,%rdx), %ymm7
	movq	80(%rsi,%rdx), %rax
	movq	%rax, %xmm10
	vmovdqu	88(%rsi,%rdx), %xmm8
	movq	$31, %rax
	movq	%rax, %xmm11
	vinserti128	$1, %xmm11, %ymm8, %ymm8
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm9, %xmm11
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm0, %ymm0
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm8, %ymm4, %ymm4
	movq	$1, %rax
	shlq	$63, %rax
	movq	%rax, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	movq	$0, %rdx
	call	L_keccakf1600_avx2$1
Lshake256_A32__A1600_avx2$1:
	movq	%xmm6, (%rdi,%rdx)
	vmovdqu	%xmm5, %xmm0
	vmovdqu	%xmm0, 8(%rdi,%rdx)
	vextracti128	$1, %ymm5, %xmm0
	movq	%xmm0, 24(%rdi,%rdx)
	movq	%r10, %rsp
	ret
_shake256_A32__A1120_avx2:
shake256_A32__A1120_avx2:
	movq	%rsp, %r10
	andq	$-8, %rsp
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm4, %ymm4, %ymm4
	movq	$0, %rdx
	movq	$0, %r8
	jmp 	Lshake256_A32__A1120_avx2$2
Lshake256_A32__A1120_avx2$3:
	movq	(%rsi,%rdx), %rax
	movq	%rax, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	vmovdqu	8(%rsi,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rsi,%rdx), %rax
	movq	%rax, %xmm9
	vmovdqu	48(%rsi,%rdx), %ymm7
	movq	80(%rsi,%rdx), %rax
	movq	%rax, %xmm10
	vmovdqu	88(%rsi,%rdx), %ymm8
	movq	120(%rsi,%rdx), %rax
	vpinsrq	$1, %rax, %xmm9, %xmm11
	vpxor	%xmm9, %xmm9, %xmm9
	vmovq	128(%rsi,%rdx), %xmm12
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm12, %xmm12
	vinserti128	$1, %xmm9, %ymm12, %ymm9
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm0, %ymm0
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm8, %ymm4, %ymm4
	addq	$136, %rdx
	call	L_keccakf1600_avx2$1
Lshake256_A32__A1120_avx2$4:
	incq	%r8
Lshake256_A32__A1120_avx2$2:
	cmpq	$8, %r8
	jb  	Lshake256_A32__A1120_avx2$3
	movq	(%rsi,%rdx), %rax
	movq	%rax, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	vmovdqu	8(%rsi,%rdx), %xmm7
	vmovq	24(%rsi,%rdx), %xmm8
	movq	$31, %rax
	vpinsrq	$1, %rax, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	$1, %rax
	shlq	$63, %rax
	movq	%rax, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	movq	$0, %rdx
	call	L_keccakf1600_avx2$1
Lshake256_A32__A1120_avx2$1:
	movq	%xmm6, (%rdi,%rdx)
	vmovdqu	%xmm5, %xmm0
	vmovdqu	%xmm0, 8(%rdi,%rdx)
	vextracti128	$1, %ymm5, %xmm0
	movq	%xmm0, 24(%rdi,%rdx)
	movq	%r10, %rsp
	ret
_sha3_256A_A1568_avx2:
sha3_256A_A1568_avx2:
	movq	%rsp, %r10
	andq	$-8, %rsp
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm4, %ymm4, %ymm4
	movq	$0, %rdx
	movq	$0, %r8
	jmp 	Lsha3_256A_A1568_avx2$2
Lsha3_256A_A1568_avx2$3:
	movq	(%rsi,%rdx), %rax
	movq	%rax, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	vmovdqu	8(%rsi,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rsi,%rdx), %rax
	movq	%rax, %xmm9
	vmovdqu	48(%rsi,%rdx), %ymm7
	movq	80(%rsi,%rdx), %rax
	movq	%rax, %xmm10
	vmovdqu	88(%rsi,%rdx), %ymm8
	movq	120(%rsi,%rdx), %rax
	vpinsrq	$1, %rax, %xmm9, %xmm11
	vpxor	%xmm9, %xmm9, %xmm9
	vmovq	128(%rsi,%rdx), %xmm12
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm12, %xmm12
	vinserti128	$1, %xmm9, %ymm12, %ymm9
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm0, %ymm0
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm8, %ymm4, %ymm4
	addq	$136, %rdx
	call	L_keccakf1600_avx2$1
Lsha3_256A_A1568_avx2$4:
	incq	%r8
Lsha3_256A_A1568_avx2$2:
	cmpq	$11, %r8
	jb  	Lsha3_256A_A1568_avx2$3
	movq	(%rsi,%rdx), %rax
	movq	%rax, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	vmovdqu	8(%rsi,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rsi,%rdx), %rax
	movq	%rax, %xmm9
	vmovdqu	48(%rsi,%rdx), %xmm7
	vmovq	64(%rsi,%rdx), %xmm8
	movq	$6, %rax
	vpinsrq	$1, %rax, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	movq	$0, %rax
	movq	%rax, %xmm10
	vpxor	%ymm8, %ymm8, %ymm8
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm9, %xmm11
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm0, %ymm0
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm8, %ymm4, %ymm4
	movq	$1, %rax
	shlq	$63, %rax
	movq	%rax, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	movq	$0, %rdx
	call	L_keccakf1600_avx2$1
Lsha3_256A_A1568_avx2$1:
	movq	%xmm6, (%rdi,%rdx)
	vmovdqu	%xmm5, %xmm0
	vmovdqu	%xmm0, 8(%rdi,%rdx)
	vextracti128	$1, %ymm5, %xmm0
	movq	%xmm0, 24(%rdi,%rdx)
	movq	%r10, %rsp
	ret
_sha3_256A_A1184_avx2:
sha3_256A_A1184_avx2:
	movq	%rsp, %r10
	andq	$-8, %rsp
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm4, %ymm4, %ymm4
	movq	$0, %rdx
	movq	$0, %r8
	jmp 	Lsha3_256A_A1184_avx2$2
Lsha3_256A_A1184_avx2$3:
	movq	(%rsi,%rdx), %rax
	movq	%rax, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	vmovdqu	8(%rsi,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rsi,%rdx), %rax
	movq	%rax, %xmm9
	vmovdqu	48(%rsi,%rdx), %ymm7
	movq	80(%rsi,%rdx), %rax
	movq	%rax, %xmm10
	vmovdqu	88(%rsi,%rdx), %ymm8
	movq	120(%rsi,%rdx), %rax
	vpinsrq	$1, %rax, %xmm9, %xmm11
	vpxor	%xmm9, %xmm9, %xmm9
	vmovq	128(%rsi,%rdx), %xmm12
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm12, %xmm12
	vinserti128	$1, %xmm9, %ymm12, %ymm9
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm0, %ymm0
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm8, %ymm4, %ymm4
	addq	$136, %rdx
	call	L_keccakf1600_avx2$1
Lsha3_256A_A1184_avx2$4:
	incq	%r8
Lsha3_256A_A1184_avx2$2:
	cmpq	$8, %r8
	jb  	Lsha3_256A_A1184_avx2$3
	movq	(%rsi,%rdx), %rax
	movq	%rax, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	vmovdqu	8(%rsi,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rsi,%rdx), %rax
	movq	%rax, %xmm9
	vmovdqu	48(%rsi,%rdx), %ymm7
	movq	80(%rsi,%rdx), %rax
	movq	%rax, %xmm10
	vpxor	%xmm8, %xmm8, %xmm8
	vmovq	88(%rsi,%rdx), %xmm11
	movq	$6, %rax
	vpinsrq	$1, %rax, %xmm11, %xmm11
	vinserti128	$1, %xmm8, %ymm11, %ymm8
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm9, %xmm11
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm0, %ymm0
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm8, %ymm4, %ymm4
	movq	$1, %rax
	shlq	$63, %rax
	movq	%rax, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	movq	$0, %rdx
	call	L_keccakf1600_avx2$1
Lsha3_256A_A1184_avx2$1:
	movq	%xmm6, (%rdi,%rdx)
	vmovdqu	%xmm5, %xmm0
	vmovdqu	%xmm0, 8(%rdi,%rdx)
	vextracti128	$1, %ymm5, %xmm0
	movq	%xmm0, 24(%rdi,%rdx)
	movq	%r10, %rsp
	ret
_shake128_next_state_avx2:
shake128_next_state_avx2:
	movq	%rsp, %rsi
	andq	$-8, %rsp
	leaq	336(%rdi), %rax
	vpbroadcastq	(%rax), %ymm6
	vmovdqu	8(%rax), %ymm5
	vmovq	40(%rax), %xmm0
	vmovdqu	48(%rax), %ymm1
	vmovq	80(%rax), %xmm2
	vmovdqu	88(%rax), %ymm3
	movq	120(%rax), %rcx
	vpinsrq	$1, %rcx, %xmm0, %xmm0
	vmovdqu	128(%rax), %ymm4
	movq	160(%rax), %rcx
	vpinsrq	$1, %rcx, %xmm2, %xmm2
	vinserti128	$1, %xmm0, %ymm2, %ymm0
	vmovdqu	168(%rax), %ymm2
	vpblendd	$195, %ymm4, %ymm1, %ymm7
	vpblendd	$195, %ymm3, %ymm2, %ymm8
	vpblendd	$195, %ymm1, %ymm3, %ymm9
	vpblendd	$240, %ymm8, %ymm7, %ymm1
	vpblendd	$240, %ymm7, %ymm8, %ymm3
	vpblendd	$195, %ymm2, %ymm4, %ymm4
	vpblendd	$240, %ymm9, %ymm4, %ymm2
	vpblendd	$240, %ymm4, %ymm9, %ymm4
	call	L_keccakf1600_avx2$1
Lshake128_next_state_avx2$1:
	movq	$336, %rax
	movq	%xmm6, (%rdi,%rax)
	vmovdqu	%ymm5, 8(%rdi,%rax)
	vmovdqu	%xmm0, %xmm5
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, %rcx
	movq	%rcx, 40(%rdi,%rax)
	vpunpckhqdq	%xmm0, %xmm0, %xmm0
	vpblendd	$240, %ymm3, %ymm1, %ymm6
	vpblendd	$240, %ymm1, %ymm3, %ymm1
	vpblendd	$240, %ymm4, %ymm2, %ymm3
	vpblendd	$240, %ymm2, %ymm4, %ymm2
	vpblendd	$195, %ymm2, %ymm6, %ymm4
	vmovdqu	%ymm4, 48(%rdi,%rax)
	movq	%xmm5, %rcx
	movq	%rcx, 80(%rdi,%rax)
	vpunpckhqdq	%xmm5, %xmm5, %xmm4
	vpblendd	$195, %ymm1, %ymm2, %ymm2
	vmovdqu	%ymm2, 88(%rdi,%rax)
	movq	%xmm0, %rcx
	movq	%rcx, 120(%rdi,%rax)
	vpblendd	$195, %ymm6, %ymm3, %ymm0
	vmovdqu	%ymm0, 128(%rdi,%rax)
	movq	%xmm4, %rcx
	movq	%rcx, 160(%rdi,%rax)
	vpblendd	$195, %ymm3, %ymm1, %ymm0
	vmovdqu	%ymm0, 168(%rdi,%rax)
	movq	%rsi, %rsp
	ret
_shake128_absorb_squeeze3blocks_avx2:
shake128_absorb_squeeze3blocks_avx2:
	movq	%rsp, %r10
	leaq	-200(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rsp, %rax
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	%ymm0, 96(%rax)
	vmovdqu	%ymm0, 128(%rax)
	vmovdqu	%ymm0, 160(%rax)
	movq	$0, %rcx
	movq	%rcx, 192(%rax)
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm4, %ymm4, %ymm4
	movq	$0, %rcx
	movq	$0, %r8
	jmp 	Lshake128_absorb_squeeze3blocks_avx2$6
Lshake128_absorb_squeeze3blocks_avx2$7:
	vmovdqu	(%rsi,%rcx), %ymm6
	addq	$32, %rcx
	vmovdqu	%ymm6, (%rax,%r8,8)
	addq	$4, %r8
Lshake128_absorb_squeeze3blocks_avx2$6:
	cmpq	$4, %r8
	jb  	Lshake128_absorb_squeeze3blocks_avx2$7
	movq	$0, %rcx
	movq	$0, %rsi
	movzwq	(%rdx,%rcx), %rcx
	movq	$31, %rdx
	shlq	$16, %rdx
	orq 	%rdx, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %rsi
	movq	%rsi, 32(%rax)
	movq	$5, %rcx
	jmp 	Lshake128_absorb_squeeze3blocks_avx2$4
Lshake128_absorb_squeeze3blocks_avx2$5:
	movq	$0, (%rax,%rcx,8)
	incq	%rcx
Lshake128_absorb_squeeze3blocks_avx2$4:
	cmpq	$5, %rcx
	jb  	Lshake128_absorb_squeeze3blocks_avx2$5
	vpbroadcastq	(%rax), %ymm6
	vpxor	%ymm6, %ymm0, %ymm6
	vmovdqu	8(%rax), %ymm0
	vpxor	%ymm0, %ymm5, %ymm5
	movq	$1, %rax
	shlq	$63, %rax
	vpxor	%xmm0, %xmm0, %xmm0
	vpinsrq	$1, %rax, %xmm0, %xmm0
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm0, %ymm8, %ymm0
	vpxor	%ymm0, %ymm7, %ymm0
	call	L_keccakf1600_avx2$1
Lshake128_absorb_squeeze3blocks_avx2$3:
	movq	$0, %rdx
	vmovdqu	%xmm6, %xmm7
	movq	%xmm7, (%rdi,%rdx)
	vmovdqu	%ymm5, 8(%rdi,%rdx)
	vmovdqu	%xmm0, %xmm7
	vextracti128	$1, %ymm0, %xmm8
	movq	%xmm8, %rax
	movq	%rax, 40(%rdi,%rdx)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm3, %ymm1, %ymm9
	vpblendd	$240, %ymm1, %ymm3, %ymm10
	vpblendd	$240, %ymm4, %ymm2, %ymm11
	vpblendd	$240, %ymm2, %ymm4, %ymm12
	vpblendd	$195, %ymm12, %ymm9, %ymm13
	vmovdqu	%ymm13, 48(%rdi,%rdx)
	movq	%xmm7, %rax
	movq	%rax, 80(%rdi,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$195, %ymm10, %ymm12, %ymm10
	vmovdqu	%ymm10, 88(%rdi,%rdx)
	movq	%xmm8, %rax
	movq	%rax, 120(%rdi,%rdx)
	vpblendd	$195, %ymm9, %ymm11, %ymm8
	vmovdqu	%ymm8, 128(%rdi,%rdx)
	movq	%xmm7, %rax
	movq	%rax, 160(%rdi,%rdx)
	addq	$168, %rdx
	call	L_keccakf1600_avx2$1
Lshake128_absorb_squeeze3blocks_avx2$2:
	vmovdqu	%xmm6, %xmm7
	movq	%xmm7, (%rdi,%rdx)
	vmovdqu	%ymm5, 8(%rdi,%rdx)
	vmovdqu	%xmm0, %xmm7
	vextracti128	$1, %ymm0, %xmm8
	movq	%xmm8, %rax
	movq	%rax, 40(%rdi,%rdx)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm3, %ymm1, %ymm9
	vpblendd	$240, %ymm1, %ymm3, %ymm10
	vpblendd	$240, %ymm4, %ymm2, %ymm11
	vpblendd	$240, %ymm2, %ymm4, %ymm12
	vpblendd	$195, %ymm12, %ymm9, %ymm13
	vmovdqu	%ymm13, 48(%rdi,%rdx)
	movq	%xmm7, %rax
	movq	%rax, 80(%rdi,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$195, %ymm10, %ymm12, %ymm10
	vmovdqu	%ymm10, 88(%rdi,%rdx)
	movq	%xmm8, %rax
	movq	%rax, 120(%rdi,%rdx)
	vpblendd	$195, %ymm9, %ymm11, %ymm8
	vmovdqu	%ymm8, 128(%rdi,%rdx)
	movq	%xmm7, %rax
	movq	%rax, 160(%rdi,%rdx)
	addq	$168, %rdx
	call	L_keccakf1600_avx2$1
Lshake128_absorb_squeeze3blocks_avx2$1:
	movq	%xmm6, (%rdi,%rdx)
	vmovdqu	%ymm5, 8(%rdi,%rdx)
	vmovdqu	%xmm0, %xmm5
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, %rax
	movq	%rax, 40(%rdi,%rdx)
	vpunpckhqdq	%xmm0, %xmm0, %xmm0
	vpblendd	$240, %ymm3, %ymm1, %ymm6
	vpblendd	$240, %ymm1, %ymm3, %ymm1
	vpblendd	$240, %ymm4, %ymm2, %ymm3
	vpblendd	$240, %ymm2, %ymm4, %ymm2
	vpblendd	$195, %ymm2, %ymm6, %ymm4
	vmovdqu	%ymm4, 48(%rdi,%rdx)
	movq	%xmm5, %rax
	movq	%rax, 80(%rdi,%rdx)
	vpunpckhqdq	%xmm5, %xmm5, %xmm4
	vpblendd	$195, %ymm1, %ymm2, %ymm2
	vmovdqu	%ymm2, 88(%rdi,%rdx)
	movq	%xmm0, %rax
	movq	%rax, 120(%rdi,%rdx)
	vpblendd	$195, %ymm6, %ymm3, %ymm0
	vmovdqu	%ymm0, 128(%rdi,%rdx)
	movq	%xmm4, %rax
	movq	%rax, 160(%rdi,%rdx)
	vpblendd	$195, %ymm3, %ymm1, %ymm0
	vmovdqu	%ymm0, 168(%rdi,%rdx)
	movq	%r10, %rsp
	ret
_shake256x4_A128__A32_A1_avx2:
shake256x4_A128__A32_A1_avx2:
	movq	%rsp, %rax
	leaq	-840(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 800(%rsp)
	movq	%rbp, 808(%rsp)
	movq	%r12, 816(%rsp)
	movq	%r13, 824(%rsp)
	movq	%rax, 832(%rsp)
	movq	%rsp, %rax
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %r10
	jmp 	Lshake256x4_A128__A32_A1_avx2$8
Lshake256x4_A128__A32_A1_avx2$9:
	vmovdqu	%ymm0, (%rax,%r10)
	addq	$32, %r10
Lshake256x4_A128__A32_A1_avx2$8:
	cmpq	$800, %r10
	jb  	Lshake256x4_A128__A32_A1_avx2$9
	movq	$0, %r10
	movq	$0, %r11
	jmp 	Lshake256x4_A128__A32_A1_avx2$6
Lshake256x4_A128__A32_A1_avx2$7:
	vpbroadcastq	(%r8,%r10), %ymm0
	addq	$8, %r10
	vpxor	(%rax,%r11), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax,%r11)
	addq	$32, %r11
Lshake256x4_A128__A32_A1_avx2$6:
	cmpq	$128, %r11
	jb  	Lshake256x4_A128__A32_A1_avx2$7
	movq	$0, %rbx
	movq	%r9, %r12
	leaq	1(%r9), %r8
	leaq	2(%r9), %r10
	leaq	3(%r9), %r9
	movq	$16, %r11
	movq	$0, %rbp
	movq	$0, %r13
	movzbq	(%r12,%rbx), %r12
	orq 	$7936, %r12
	shlq	$0, %r12
	orq 	%r12, %r13
	shlq	$0, %r13
	orq 	%r13, %rbp
	movq	$0, %r12
	movq	$0, %r13
	movzbq	(%r8,%rbx), %r8
	orq 	$7936, %r8
	shlq	$0, %r8
	orq 	%r8, %r13
	shlq	$0, %r13
	orq 	%r13, %r12
	movq	$0, %r8
	movq	$0, %r13
	movzbq	(%r10,%rbx), %r10
	orq 	$7936, %r10
	shlq	$0, %r10
	orq 	%r10, %r13
	shlq	$0, %r13
	orq 	%r13, %r8
	movq	$0, %r10
	movq	$0, %r13
	movzbq	(%r9,%rbx), %r9
	orq 	$7936, %r9
	shlq	$0, %r9
	orq 	%r9, %r13
	shlq	$0, %r13
	orq 	%r13, %r10
	xorq	(%rax,%r11,8), %rbp
	movq	%rbp, (%rax,%r11,8)
	xorq	8(%rax,%r11,8), %r12
	movq	%r12, 8(%rax,%r11,8)
	xorq	16(%rax,%r11,8), %r8
	movq	%r8, 16(%rax,%r11,8)
	xorq	24(%rax,%r11,8), %r10
	movq	%r10, 24(%rax,%r11,8)
	movq	$1, %r8
	shlq	$63, %r8
	movq	%r8, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpxor	512(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 512(%rax)
	movq	$0, %r11
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
Lshake256x4_A128__A32_A1_avx2$5:
	leaq	824(%rsp), %rsp
	movq	$0, %r8
	jmp 	Lshake256x4_A128__A32_A1_avx2$3
Lshake256x4_A128__A32_A1_avx2$4:
	vmovdqu	(%rax,%r8,4), %ymm0
	vmovdqu	32(%rax,%r8,4), %ymm1
	vmovdqu	64(%rax,%r8,4), %ymm2
	vmovdqu	96(%rax,%r8,4), %ymm3
	addq	$32, %r8
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%rdi,%r11)
	vmovdqu	%ymm3, (%rsi,%r11)
	vmovdqu	%ymm4, (%rdx,%r11)
	vmovdqu	%ymm0, (%rcx,%r11)
	addq	$32, %r11
Lshake256x4_A128__A32_A1_avx2$3:
	cmpq	$128, %r8
	jl  	Lshake256x4_A128__A32_A1_avx2$4
	jmp 	Lshake256x4_A128__A32_A1_avx2$1
Lshake256x4_A128__A32_A1_avx2$2:
	movq	(%rax,%r8,4), %r9
	movq	%r9, (%rdi,%r11)
	movq	8(%rax,%r8,4), %r9
	movq	%r9, (%rsi,%r11)
	movq	16(%rax,%r8,4), %r9
	movq	%r9, (%rdx,%r11)
	movq	24(%rax,%r8,4), %r9
	movq	%r9, (%rcx,%r11)
	addq	$8, %r8
	addq	$8, %r11
Lshake256x4_A128__A32_A1_avx2$1:
	cmpq	$128, %r8
	jl  	Lshake256x4_A128__A32_A1_avx2$2
	movq	800(%rsp), %rbx
	movq	808(%rsp), %rbp
	movq	816(%rsp), %r12
	movq	824(%rsp), %r13
	movq	832(%rsp), %rsp
	ret
_shake256_A128__A32_A1_avx2:
shake256_A128__A32_A1_avx2:
	movq	%rsp, %r10
	leaq	-200(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rsp, %rax
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	%ymm0, 96(%rax)
	vmovdqu	%ymm0, 128(%rax)
	vmovdqu	%ymm0, 160(%rax)
	movq	$0, %rcx
	movq	%rcx, 192(%rax)
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm4, %ymm4, %ymm4
	movq	$0, %rcx
	movq	$0, %r8
	jmp 	Lshake256_A128__A32_A1_avx2$4
Lshake256_A128__A32_A1_avx2$5:
	vmovdqu	(%rsi,%rcx), %ymm6
	addq	$32, %rcx
	vmovdqu	%ymm6, (%rax,%r8,8)
	addq	$4, %r8
Lshake256_A128__A32_A1_avx2$4:
	cmpq	$4, %r8
	jb  	Lshake256_A128__A32_A1_avx2$5
	movq	$0, %rcx
	movq	$0, %rsi
	movq	$0, %r8
	movzbq	(%rdx,%rcx), %rcx
	orq 	$7936, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %r8
	shlq	$0, %r8
	orq 	%r8, %rsi
	movq	%rsi, 32(%rax)
	movq	$5, %rcx
	jmp 	Lshake256_A128__A32_A1_avx2$2
Lshake256_A128__A32_A1_avx2$3:
	movq	$0, (%rax,%rcx,8)
	incq	%rcx
Lshake256_A128__A32_A1_avx2$2:
	cmpq	$5, %rcx
	jb  	Lshake256_A128__A32_A1_avx2$3
	vpbroadcastq	(%rax), %ymm6
	vpxor	%ymm6, %ymm1, %ymm6
	vmovdqu	8(%rax), %ymm1
	vpxor	%ymm1, %ymm5, %ymm5
	movq	$1, %rax
	shlq	$63, %rax
	movq	%rax, %xmm1
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm1, %ymm8, %ymm1
	vpxor	%ymm1, %ymm7, %ymm1
	movq	$0, %rdx
	call	L_keccakf1600_avx2$1
Lshake256_A128__A32_A1_avx2$1:
	movq	%xmm6, (%rdi,%rdx)
	vmovdqu	%ymm5, 8(%rdi,%rdx)
	vmovdqu	%xmm0, %xmm5
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, %rax
	movq	%rax, 40(%rdi,%rdx)
	vpunpckhqdq	%xmm0, %xmm0, %xmm0
	vpblendd	$240, %ymm3, %ymm1, %ymm6
	vpblendd	$240, %ymm1, %ymm3, %ymm1
	vpblendd	$240, %ymm2, %ymm4, %ymm2
	vpblendd	$195, %ymm2, %ymm6, %ymm3
	vmovdqu	%ymm3, 48(%rdi,%rdx)
	movq	%xmm5, %rax
	movq	%rax, 80(%rdi,%rdx)
	vpblendd	$195, %ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 88(%rdi,%rdx)
	movq	%xmm0, %rax
	movq	%rax, 120(%rdi,%rdx)
	movq	%r10, %rsp
	ret
_sha3_512A_A64_avx2:
sha3_512A_A64_avx2:
	movq	%rsp, %r10
	andq	$-8, %rsp
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	movq	$0, %rax
	movq	(%rsi,%rax), %rcx
	movq	%rcx, %xmm6
	vpbroadcastq	%xmm6, %ymm6
	vpxor	%ymm6, %ymm5, %ymm6
	vmovdqu	8(%rsi,%rax), %ymm5
	vpxor	%ymm5, %ymm7, %ymm5
	movq	40(%rsi,%rax), %rcx
	movq	%rcx, %xmm9
	vmovdqu	48(%rsi,%rax), %xmm7
	movq	$6, %rax
	movq	%rax, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	movq	$0, %rax
	movq	%rax, %xmm10
	vpxor	%ymm8, %ymm8, %ymm8
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm9, %xmm11
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm0, %ymm0
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm11, %ymm2, %ymm7
	vpxor	%ymm10, %ymm3, %ymm2
	vpxor	%ymm8, %ymm4, %ymm4
	movq	$1, %rax
	shlq	$63, %rax
	movq	%rax, %xmm3
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$1, %xmm3, %ymm8, %ymm3
	vpxor	%ymm3, %ymm7, %ymm3
	movq	$0, %rdx
	call	L_keccakf1600_avx2$1
Lsha3_512A_A64_avx2$1:
	movq	%xmm6, (%rdi,%rdx)
	vmovdqu	%ymm5, 8(%rdi,%rdx)
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, %rax
	movq	%rax, 40(%rdi,%rdx)
	vpblendd	$240, %ymm3, %ymm1, %ymm0
	vpblendd	$240, %ymm2, %ymm4, %ymm1
	vpblendd	$195, %ymm1, %ymm0, %ymm0
	vmovdqu	%xmm0, 48(%rdi,%rdx)
	movq	%r10, %rsp
	ret
_sha3_512A_A33_avx2:
sha3_512A_A33_avx2:
	movq	%rsp, %r10
	andq	$-8, %rsp
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm4, %ymm4, %ymm4
	movq	$0, %rax
	movq	(%rsi,%rax), %rcx
	movq	%rcx, %xmm6
	vpbroadcastq	%xmm6, %ymm6
	vpxor	%ymm6, %ymm5, %ymm6
	vmovdqu	8(%rsi,%rax), %xmm5
	vmovq	24(%rsi,%rax), %xmm8
	movq	$0, %rcx
	movq	$0, %rdx
	movzbq	32(%rsi,%rax), %rax
	orq 	$1536, %rax
	shlq	$0, %rax
	orq 	%rax, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
	vpinsrq	$1, %rcx, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm5, %ymm5
	vpxor	%ymm5, %ymm7, %ymm5
	movq	$1, %rax
	shlq	$63, %rax
	movq	%rax, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$1, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm3, %ymm3
	movq	$0, %rdx
	call	L_keccakf1600_avx2$1
Lsha3_512A_A33_avx2$1:
	movq	%xmm6, (%rdi,%rdx)
	vmovdqu	%ymm5, 8(%rdi,%rdx)
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, %rax
	movq	%rax, 40(%rdi,%rdx)
	vpblendd	$240, %ymm3, %ymm1, %ymm0
	vpblendd	$240, %ymm2, %ymm4, %ymm1
	vpblendd	$195, %ymm1, %ymm0, %ymm0
	vmovdqu	%xmm0, 48(%rdi,%rdx)
	movq	%r10, %rsp
	ret
L_keccakf1600_avx2x4$1:
	leaq	glob_data + 448(%rip), %r8
	leaq	32(%rsp), %r9
	vmovdqu	glob_data + 0(%rip), %ymm0
	vmovdqu	glob_data + 32(%rip), %ymm1
	movq	$0, %r10
	jmp 	L_keccakf1600_avx2x4$2
L_keccakf1600_avx2x4$3:
	vpbroadcastq	(%r8,%r10,8), %ymm2
	call	L_keccakf1600_4x_round$1
L_keccakf1600_avx2x4$5:
	xchg	%rax, %r9
	vpbroadcastq	8(%r8,%r10,8), %ymm2
	call	L_keccakf1600_4x_round$1
L_keccakf1600_avx2x4$4:
	xchg	%r9, %rax
	addq	$2, %r10
L_keccakf1600_avx2x4$2:
	cmpq	$24, %r10
	jb  	L_keccakf1600_avx2x4$3
	ret
L_keccakf1600_4x_round$1:
	vmovdqu	(%rax), %ymm3
	vmovdqu	32(%rax), %ymm4
	vmovdqu	64(%rax), %ymm5
	vmovdqu	96(%rax), %ymm6
	vmovdqu	128(%rax), %ymm7
	vpxor	160(%rax), %ymm3, %ymm3
	vpxor	192(%rax), %ymm4, %ymm4
	vpxor	224(%rax), %ymm5, %ymm5
	vpxor	256(%rax), %ymm6, %ymm6
	vpxor	288(%rax), %ymm7, %ymm7
	vpxor	320(%rax), %ymm3, %ymm3
	vpxor	352(%rax), %ymm4, %ymm4
	vpxor	384(%rax), %ymm5, %ymm5
	vpxor	416(%rax), %ymm6, %ymm6
	vpxor	448(%rax), %ymm7, %ymm7
	vpxor	480(%rax), %ymm3, %ymm3
	vpxor	512(%rax), %ymm4, %ymm4
	vpxor	544(%rax), %ymm5, %ymm8
	vpxor	576(%rax), %ymm6, %ymm9
	vpxor	608(%rax), %ymm7, %ymm10
	vpxor	640(%rax), %ymm3, %ymm7
	vpxor	672(%rax), %ymm4, %ymm5
	vpxor	704(%rax), %ymm8, %ymm6
	vpxor	736(%rax), %ymm9, %ymm8
	vpxor	768(%rax), %ymm10, %ymm9
	vmovdqu	%ymm5, %ymm3
	vpsllq	$1, %ymm3, %ymm4
	vpsrlq	$63, %ymm3, %ymm3
	vpor	%ymm4, %ymm3, %ymm3
	vpxor	%ymm9, %ymm3, %ymm3
	vmovdqu	%ymm6, %ymm4
	vpsllq	$1, %ymm4, %ymm10
	vpsrlq	$63, %ymm4, %ymm4
	vpor	%ymm10, %ymm4, %ymm4
	vpxor	%ymm7, %ymm4, %ymm4
	vmovdqu	%ymm8, %ymm10
	vpsllq	$1, %ymm10, %ymm11
	vpsrlq	$63, %ymm10, %ymm10
	vpor	%ymm11, %ymm10, %ymm10
	vpxor	%ymm5, %ymm10, %ymm5
	vpsllq	$1, %ymm9, %ymm10
	vpsrlq	$63, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vpxor	%ymm6, %ymm9, %ymm6
	vpsllq	$1, %ymm7, %ymm9
	vpsrlq	$63, %ymm7, %ymm7
	vpor	%ymm9, %ymm7, %ymm7
	vpxor	%ymm8, %ymm7, %ymm7
	vmovdqu	(%rax), %ymm8
	vpxor	%ymm3, %ymm8, %ymm8
	vmovdqu	192(%rax), %ymm9
	vpxor	%ymm4, %ymm9, %ymm9
	vpsllq	$44, %ymm9, %ymm10
	vpsrlq	$20, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	384(%rax), %ymm10
	vpxor	%ymm5, %ymm10, %ymm10
	vpsllq	$43, %ymm10, %ymm11
	vpsrlq	$21, %ymm10, %ymm10
	vpor	%ymm11, %ymm10, %ymm10
	vmovdqu	576(%rax), %ymm11
	vpxor	%ymm6, %ymm11, %ymm11
	vpsllq	$21, %ymm11, %ymm12
	vpsrlq	$43, %ymm11, %ymm11
	vpor	%ymm12, %ymm11, %ymm11
	vmovdqu	768(%rax), %ymm12
	vpxor	%ymm7, %ymm12, %ymm12
	vpsllq	$14, %ymm12, %ymm13
	vpsrlq	$50, %ymm12, %ymm12
	vpor	%ymm13, %ymm12, %ymm12
	vpandn	%ymm10, %ymm9, %ymm13
	vpxor	%ymm8, %ymm13, %ymm13
	vpxor	%ymm2, %ymm13, %ymm2
	vmovdqu	%ymm2, (%r9)
	vpandn	%ymm11, %ymm10, %ymm2
	vpxor	%ymm9, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%r9)
	vpandn	%ymm12, %ymm11, %ymm2
	vpxor	%ymm10, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%r9)
	vpandn	%ymm8, %ymm12, %ymm2
	vpxor	%ymm11, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%r9)
	vpandn	%ymm9, %ymm8, %ymm2
	vpxor	%ymm12, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%r9)
	vmovdqu	96(%rax), %ymm2
	vpxor	%ymm6, %ymm2, %ymm2
	vpsllq	$28, %ymm2, %ymm8
	vpsrlq	$36, %ymm2, %ymm2
	vpor	%ymm8, %ymm2, %ymm2
	vmovdqu	288(%rax), %ymm8
	vpxor	%ymm7, %ymm8, %ymm8
	vpsllq	$20, %ymm8, %ymm9
	vpsrlq	$44, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm8
	vmovdqu	320(%rax), %ymm9
	vpxor	%ymm3, %ymm9, %ymm9
	vpsllq	$3, %ymm9, %ymm10
	vpsrlq	$61, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	512(%rax), %ymm10
	vpxor	%ymm4, %ymm10, %ymm10
	vpsllq	$45, %ymm10, %ymm11
	vpsrlq	$19, %ymm10, %ymm10
	vpor	%ymm11, %ymm10, %ymm10
	vmovdqu	704(%rax), %ymm11
	vpxor	%ymm5, %ymm11, %ymm11
	vpsllq	$61, %ymm11, %ymm12
	vpsrlq	$3, %ymm11, %ymm11
	vpor	%ymm12, %ymm11, %ymm11
	vpandn	%ymm9, %ymm8, %ymm12
	vpxor	%ymm2, %ymm12, %ymm12
	vmovdqu	%ymm12, 160(%r9)
	vpandn	%ymm10, %ymm9, %ymm12
	vpxor	%ymm8, %ymm12, %ymm12
	vmovdqu	%ymm12, 192(%r9)
	vpandn	%ymm11, %ymm10, %ymm12
	vpxor	%ymm9, %ymm12, %ymm9
	vmovdqu	%ymm9, 224(%r9)
	vpandn	%ymm2, %ymm11, %ymm9
	vpxor	%ymm10, %ymm9, %ymm9
	vmovdqu	%ymm9, 256(%r9)
	vpandn	%ymm8, %ymm2, %ymm2
	vpxor	%ymm11, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%r9)
	vmovdqu	32(%rax), %ymm2
	vpxor	%ymm4, %ymm2, %ymm2
	vpsllq	$1, %ymm2, %ymm8
	vpsrlq	$63, %ymm2, %ymm2
	vpor	%ymm8, %ymm2, %ymm2
	vmovdqu	224(%rax), %ymm8
	vpxor	%ymm5, %ymm8, %ymm8
	vpsllq	$6, %ymm8, %ymm9
	vpsrlq	$58, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm8
	vmovdqu	416(%rax), %ymm9
	vpxor	%ymm6, %ymm9, %ymm9
	vpsllq	$25, %ymm9, %ymm10
	vpsrlq	$39, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	608(%rax), %ymm10
	vpxor	%ymm7, %ymm10, %ymm10
	vpshufb	%ymm0, %ymm10, %ymm10
	vmovdqu	640(%rax), %ymm11
	vpxor	%ymm3, %ymm11, %ymm11
	vpsllq	$18, %ymm11, %ymm12
	vpsrlq	$46, %ymm11, %ymm11
	vpor	%ymm12, %ymm11, %ymm11
	vpandn	%ymm9, %ymm8, %ymm12
	vpxor	%ymm2, %ymm12, %ymm12
	vmovdqu	%ymm12, 320(%r9)
	vpandn	%ymm10, %ymm9, %ymm12
	vpxor	%ymm8, %ymm12, %ymm12
	vmovdqu	%ymm12, 352(%r9)
	vpandn	%ymm11, %ymm10, %ymm12
	vpxor	%ymm9, %ymm12, %ymm9
	vmovdqu	%ymm9, 384(%r9)
	vpandn	%ymm2, %ymm11, %ymm9
	vpxor	%ymm10, %ymm9, %ymm9
	vmovdqu	%ymm9, 416(%r9)
	vpandn	%ymm8, %ymm2, %ymm2
	vpxor	%ymm11, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%r9)
	vmovdqu	128(%rax), %ymm2
	vpxor	%ymm7, %ymm2, %ymm2
	vpsllq	$27, %ymm2, %ymm8
	vpsrlq	$37, %ymm2, %ymm2
	vpor	%ymm8, %ymm2, %ymm2
	vmovdqu	160(%rax), %ymm8
	vpxor	%ymm3, %ymm8, %ymm8
	vpsllq	$36, %ymm8, %ymm9
	vpsrlq	$28, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm8
	vmovdqu	352(%rax), %ymm9
	vpxor	%ymm4, %ymm9, %ymm9
	vpsllq	$10, %ymm9, %ymm10
	vpsrlq	$54, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	544(%rax), %ymm10
	vpxor	%ymm5, %ymm10, %ymm10
	vpsllq	$15, %ymm10, %ymm11
	vpsrlq	$49, %ymm10, %ymm10
	vpor	%ymm11, %ymm10, %ymm10
	vmovdqu	736(%rax), %ymm11
	vpxor	%ymm6, %ymm11, %ymm11
	vpshufb	%ymm1, %ymm11, %ymm11
	vpandn	%ymm9, %ymm8, %ymm12
	vpxor	%ymm2, %ymm12, %ymm12
	vmovdqu	%ymm12, 480(%r9)
	vpandn	%ymm10, %ymm9, %ymm12
	vpxor	%ymm8, %ymm12, %ymm12
	vmovdqu	%ymm12, 512(%r9)
	vpandn	%ymm11, %ymm10, %ymm12
	vpxor	%ymm9, %ymm12, %ymm9
	vmovdqu	%ymm9, 544(%r9)
	vpandn	%ymm2, %ymm11, %ymm9
	vpxor	%ymm10, %ymm9, %ymm9
	vmovdqu	%ymm9, 576(%r9)
	vpandn	%ymm8, %ymm2, %ymm2
	vpxor	%ymm11, %ymm2, %ymm2
	vmovdqu	%ymm2, 608(%r9)
	vmovdqu	64(%rax), %ymm2
	vpxor	%ymm5, %ymm2, %ymm2
	vpsllq	$62, %ymm2, %ymm5
	vpsrlq	$2, %ymm2, %ymm2
	vpor	%ymm5, %ymm2, %ymm2
	vmovdqu	256(%rax), %ymm5
	vpxor	%ymm6, %ymm5, %ymm5
	vpsllq	$55, %ymm5, %ymm6
	vpsrlq	$9, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm5
	vmovdqu	448(%rax), %ymm6
	vpxor	%ymm7, %ymm6, %ymm6
	vpsllq	$39, %ymm6, %ymm7
	vpsrlq	$25, %ymm6, %ymm6
	vpor	%ymm7, %ymm6, %ymm6
	vmovdqu	480(%rax), %ymm7
	vpxor	%ymm3, %ymm7, %ymm3
	vpsllq	$41, %ymm3, %ymm7
	vpsrlq	$23, %ymm3, %ymm3
	vpor	%ymm7, %ymm3, %ymm3
	vmovdqu	672(%rax), %ymm7
	vpxor	%ymm4, %ymm7, %ymm4
	vpsllq	$2, %ymm4, %ymm7
	vpsrlq	$62, %ymm4, %ymm4
	vpor	%ymm7, %ymm4, %ymm4
	vpandn	%ymm6, %ymm5, %ymm7
	vpxor	%ymm2, %ymm7, %ymm7
	vmovdqu	%ymm7, 640(%r9)
	vpandn	%ymm3, %ymm6, %ymm7
	vpxor	%ymm5, %ymm7, %ymm7
	vmovdqu	%ymm7, 672(%r9)
	vpandn	%ymm4, %ymm3, %ymm7
	vpxor	%ymm6, %ymm7, %ymm6
	vmovdqu	%ymm6, 704(%r9)
	vpandn	%ymm2, %ymm4, %ymm6
	vpxor	%ymm3, %ymm6, %ymm3
	vmovdqu	%ymm3, 736(%r9)
	vpandn	%ymm5, %ymm2, %ymm2
	vpxor	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 768(%r9)
	ret
L_keccakf1600_avx2$1:
	leaq	glob_data + 448(%rip), %rax
	movq	$0, %rcx
L_keccakf1600_avx2$2:
	vpshufd	$78, %ymm0, %ymm8
	vpxor	%ymm1, %ymm2, %ymm7
	vpxor	%ymm4, %ymm3, %ymm9
	vpxor	%ymm5, %ymm7, %ymm7
	vpxor	%ymm9, %ymm7, %ymm10
	vpermq	$147, %ymm10, %ymm7
	vpxor	%ymm0, %ymm8, %ymm8
	vpermq	$78, %ymm8, %ymm9
	vpsrlq	$63, %ymm10, %ymm11
	vpaddq	%ymm10, %ymm10, %ymm10
	vpor	%ymm10, %ymm11, %ymm11
	vpermq	$57, %ymm11, %ymm10
	vpxor	%ymm7, %ymm11, %ymm11
	vpermq	$0, %ymm11, %ymm11
	vpxor	%ymm6, %ymm8, %ymm8
	vpxor	%ymm9, %ymm8, %ymm8
	vpsrlq	$63, %ymm8, %ymm9
	vpaddq	%ymm8, %ymm8, %ymm12
	vpor	%ymm9, %ymm12, %ymm9
	vpxor	%ymm11, %ymm0, %ymm0
	vpxor	%ymm11, %ymm6, %ymm6
	vpblendd	$192, %ymm9, %ymm10, %ymm9
	vpblendd	$3, %ymm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm9, %ymm9
	vpsllvq	glob_data + 256(%rip), %ymm0, %ymm7
	vpsrlvq	glob_data + 64(%rip), %ymm0, %ymm0
	vpor	%ymm7, %ymm0, %ymm0
	vpxor	%ymm9, %ymm1, %ymm1
	vpsllvq	glob_data + 320(%rip), %ymm1, %ymm7
	vpsrlvq	glob_data + 128(%rip), %ymm1, %ymm1
	vpor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm9, %ymm3, %ymm3
	vpsllvq	glob_data + 352(%rip), %ymm3, %ymm7
	vpsrlvq	glob_data + 160(%rip), %ymm3, %ymm3
	vpor	%ymm7, %ymm3, %ymm10
	vpxor	%ymm9, %ymm2, %ymm2
	vpsllvq	glob_data + 384(%rip), %ymm2, %ymm3
	vpsrlvq	glob_data + 192(%rip), %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm2
	vpxor	%ymm9, %ymm4, %ymm4
	vpermq	$141, %ymm0, %ymm3
	vpermq	$141, %ymm1, %ymm7
	vpsllvq	glob_data + 416(%rip), %ymm4, %ymm0
	vpsrlvq	glob_data + 224(%rip), %ymm4, %ymm1
	vpor	%ymm0, %ymm1, %ymm8
	vpxor	%ymm9, %ymm5, %ymm0
	vpermq	$27, %ymm10, %ymm5
	vpermq	$114, %ymm2, %ymm9
	vpsllvq	glob_data + 288(%rip), %ymm0, %ymm1
	vpsrlvq	glob_data + 96(%rip), %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm10
	vpsrldq	$8, %ymm8, %ymm0
	vpandn	%ymm0, %ymm8, %ymm1
	vpblendd	$12, %ymm9, %ymm10, %ymm0
	vpblendd	$12, %ymm10, %ymm7, %ymm2
	vpblendd	$12, %ymm7, %ymm3, %ymm4
	vpblendd	$12, %ymm3, %ymm10, %ymm11
	vpblendd	$48, %ymm7, %ymm0, %ymm0
	vpblendd	$48, %ymm5, %ymm2, %ymm2
	vpblendd	$48, %ymm10, %ymm4, %ymm4
	vpblendd	$48, %ymm9, %ymm11, %ymm11
	vpblendd	$192, %ymm5, %ymm0, %ymm0
	vpblendd	$192, %ymm9, %ymm2, %ymm2
	vpblendd	$192, %ymm9, %ymm4, %ymm4
	vpblendd	$192, %ymm7, %ymm11, %ymm11
	vpandn	%ymm2, %ymm0, %ymm0
	vpandn	%ymm11, %ymm4, %ymm4
	vpblendd	$12, %ymm10, %ymm5, %ymm11
	vpblendd	$12, %ymm5, %ymm3, %ymm12
	vpxor	%ymm3, %ymm0, %ymm2
	vpblendd	$48, %ymm3, %ymm11, %ymm0
	vpblendd	$48, %ymm7, %ymm12, %ymm11
	vpxor	%ymm5, %ymm4, %ymm4
	vpblendd	$192, %ymm7, %ymm0, %ymm0
	vpblendd	$192, %ymm10, %ymm11, %ymm11
	vpandn	%ymm11, %ymm0, %ymm0
	vpxor	%ymm9, %ymm0, %ymm12
	vpermq	$30, %ymm8, %ymm0
	vpblendd	$48, %ymm6, %ymm0, %ymm0
	vpermq	$57, %ymm8, %ymm11
	vpblendd	$192, %ymm6, %ymm11, %ymm11
	vpandn	%ymm0, %ymm11, %ymm11
	vpblendd	$12, %ymm5, %ymm7, %ymm0
	vpblendd	$12, %ymm7, %ymm9, %ymm13
	vpblendd	$48, %ymm9, %ymm0, %ymm0
	vpblendd	$48, %ymm3, %ymm13, %ymm13
	vpblendd	$192, %ymm3, %ymm0, %ymm0
	vpblendd	$192, %ymm5, %ymm13, %ymm13
	vpandn	%ymm13, %ymm0, %ymm0
	vpxor	%ymm10, %ymm0, %ymm0
	vpermq	$0, %ymm1, %ymm13
	vpermq	$27, %ymm2, %ymm1
	vpermq	$141, %ymm4, %ymm2
	vpermq	$114, %ymm12, %ymm4
	vpblendd	$12, %ymm3, %ymm9, %ymm12
	vpblendd	$12, %ymm9, %ymm5, %ymm9
	vpblendd	$48, %ymm5, %ymm12, %ymm5
	vpblendd	$48, %ymm10, %ymm9, %ymm9
	vpblendd	$192, %ymm10, %ymm5, %ymm5
	vpblendd	$192, %ymm3, %ymm9, %ymm3
	vpandn	%ymm3, %ymm5, %ymm3
	vpxor	%ymm13, %ymm6, %ymm6
	vpxor	%ymm8, %ymm11, %ymm5
	vpxor	%ymm7, %ymm3, %ymm3
	vpbroadcastq	(%rax,%rcx,8), %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	incq	%rcx
	cmpq	$24, %rcx
	jb  	L_keccakf1600_avx2$2
	ret
	.data
	.p2align	5
_glob_data:
glob_data:
G$ROL8:
	.byte	7
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	15
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	23
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	22
	.byte	31
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	30
G$ROL56:
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	0
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	8
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	16
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	24
G$KECCAK_RHOTATES_RIGHT:
	.byte	61
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	46
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	28
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	23
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	63
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	36
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	37
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	19
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	58
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	25
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	54
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	9
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	56
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	49
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	44
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	20
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	21
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	43
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	50
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
G$KECCAK_RHOTATES_LEFT:
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	18
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	36
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	28
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	27
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	45
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	56
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	39
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	61
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	25
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	20
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	44
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	43
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	21
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	14
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
G$KECCAK1600_RC:
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-126
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-118
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-128
	.byte	0
	.byte	-128
	.byte	0
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	-128
	.byte	-117
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-127
	.byte	-128
	.byte	0
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	-128
	.byte	9
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-128
	.byte	-118
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-120
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	9
	.byte	-128
	.byte	0
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	0
	.byte	0
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-117
	.byte	-128
	.byte	0
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-117
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-128
	.byte	-119
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-128
	.byte	3
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-128
	.byte	2
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-128
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-128
	.byte	10
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	0
	.byte	0
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	-128
	.byte	-127
	.byte	-128
	.byte	0
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-128
	.byte	1
	.byte	0
	.byte	0
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	-128
	.byte	0
	.byte	-128
	.byte	0
	.byte	0
	.byte	0
	.byte	-128
