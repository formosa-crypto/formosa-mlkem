	.att_syntax
	.text
	.p2align	5
	.global	_shake256_A32__A1600_ref
	.global	shake256_A32__A1600_ref
	.global	_shake256_A32__A1120_ref
	.global	shake256_A32__A1120_ref
	.global	_sha3_256A_A1568_ref
	.global	sha3_256A_A1568_ref
	.global	_sha3_256A_A1184_ref
	.global	sha3_256A_A1184_ref
	.global	_shake128_next_state_ref
	.global	shake128_next_state_ref
	.global	_shake128_absorb_squeeze3blocks_ref
	.global	shake128_absorb_squeeze3blocks_ref
	.global	_shake128_absorb_ref
	.global	shake128_absorb_ref
	.global	_shake256_A128__A32_A1_ref
	.global	shake256_A128__A32_A1_ref
	.global	_sha3_512A_A64_ref
	.global	sha3_512A_A64_ref
	.global	_sha3_512A_A33_ref
	.global	sha3_512A_A33_ref
_shake256_A32__A1600_ref:
shake256_A32__A1600_ref:
	movq	%rsp, %rax
	leaq	-280(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 232(%rsp)
	movq	%rbp, 240(%rsp)
	movq	%r12, 248(%rsp)
	movq	%r13, 256(%rsp)
	movq	%r14, 264(%rsp)
	movq	%rax, 272(%rsp)
	leaq	32(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	Lshake256_A32__A1600_ref$11
Lshake256_A32__A1600_ref$12:
	movq	%rcx, (%rax,%rdx,8)
	incq	%rdx
Lshake256_A32__A1600_ref$11:
	cmpq	$25, %rdx
	jb  	Lshake256_A32__A1600_ref$12
	movq	%rdi, (%rsp)
	leaq	32(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %r8
	jmp 	Lshake256_A32__A1600_ref$6
Lshake256_A32__A1600_ref$7:
	movq	$0, %rdx
	jmp 	Lshake256_A32__A1600_ref$9
Lshake256_A32__A1600_ref$10:
	movq	(%rsi,%rcx), %rdi
	addq	$8, %rcx
	xorq	(%rax,%rdx,8), %rdi
	movq	%rdi, (%rax,%rdx,8)
	incq	%rdx
Lshake256_A32__A1600_ref$9:
	cmpq	$17, %rdx
	jb  	Lshake256_A32__A1600_ref$10
	movq	%rsi, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%r8, 24(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lshake256_A32__A1600_ref$8:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rcx
	movq	24(%rsp), %r8
	incq	%r8
Lshake256_A32__A1600_ref$6:
	cmpq	$11, %r8
	jb  	Lshake256_A32__A1600_ref$7
	movq	$0, %rdx
	jmp 	Lshake256_A32__A1600_ref$4
Lshake256_A32__A1600_ref$5:
	movq	(%rsi,%rcx), %rdi
	addq	$8, %rcx
	xorq	(%rax,%rdx,8), %rdi
	movq	%rdi, (%rax,%rdx,8)
	incq	%rdx
Lshake256_A32__A1600_ref$4:
	cmpq	$13, %rdx
	jb  	Lshake256_A32__A1600_ref$5
	movq	$31, %rcx
	xorq	(%rax,%rdx,8), %rcx
	movq	%rcx, (%rax,%rdx,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	128(%rax), %rcx
	movq	%rcx, 128(%rax)
	movq	(%rsp), %rcx
	movq	$0, %rdx
	leaq	32(%rsp), %rax
	movq	%rcx, (%rsp)
	movq	%rdx, 24(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lshake256_A32__A1600_ref$3:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %rcx
	movq	24(%rsp), %rdx
	movq	$0, %rsi
	jmp 	Lshake256_A32__A1600_ref$1
Lshake256_A32__A1600_ref$2:
	movq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rdx)
	incq	%rsi
	addq	$8, %rdx
Lshake256_A32__A1600_ref$1:
	cmpq	$4, %rsi
	jl  	Lshake256_A32__A1600_ref$2
	movq	232(%rsp), %rbx
	movq	240(%rsp), %rbp
	movq	248(%rsp), %r12
	movq	256(%rsp), %r13
	movq	264(%rsp), %r14
	movq	272(%rsp), %rsp
	ret
_shake256_A32__A1120_ref:
shake256_A32__A1120_ref:
	movq	%rsp, %rax
	leaq	-280(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 232(%rsp)
	movq	%rbp, 240(%rsp)
	movq	%r12, 248(%rsp)
	movq	%r13, 256(%rsp)
	movq	%r14, 264(%rsp)
	movq	%rax, 272(%rsp)
	leaq	32(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	Lshake256_A32__A1120_ref$11
Lshake256_A32__A1120_ref$12:
	movq	%rcx, (%rax,%rdx,8)
	incq	%rdx
Lshake256_A32__A1120_ref$11:
	cmpq	$25, %rdx
	jb  	Lshake256_A32__A1120_ref$12
	movq	%rdi, (%rsp)
	leaq	32(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %r8
	jmp 	Lshake256_A32__A1120_ref$6
Lshake256_A32__A1120_ref$7:
	movq	$0, %rdx
	jmp 	Lshake256_A32__A1120_ref$9
Lshake256_A32__A1120_ref$10:
	movq	(%rsi,%rcx), %rdi
	addq	$8, %rcx
	xorq	(%rax,%rdx,8), %rdi
	movq	%rdi, (%rax,%rdx,8)
	incq	%rdx
Lshake256_A32__A1120_ref$9:
	cmpq	$17, %rdx
	jb  	Lshake256_A32__A1120_ref$10
	movq	%rsi, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%r8, 24(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lshake256_A32__A1120_ref$8:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rcx
	movq	24(%rsp), %r8
	incq	%r8
Lshake256_A32__A1120_ref$6:
	cmpq	$8, %r8
	jb  	Lshake256_A32__A1120_ref$7
	movq	$0, %rdx
	jmp 	Lshake256_A32__A1120_ref$4
Lshake256_A32__A1120_ref$5:
	movq	(%rsi,%rcx), %rdi
	addq	$8, %rcx
	xorq	(%rax,%rdx,8), %rdi
	movq	%rdi, (%rax,%rdx,8)
	incq	%rdx
Lshake256_A32__A1120_ref$4:
	cmpq	$4, %rdx
	jb  	Lshake256_A32__A1120_ref$5
	movq	$31, %rcx
	xorq	(%rax,%rdx,8), %rcx
	movq	%rcx, (%rax,%rdx,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	128(%rax), %rcx
	movq	%rcx, 128(%rax)
	movq	(%rsp), %rcx
	movq	$0, %rdx
	leaq	32(%rsp), %rax
	movq	%rcx, (%rsp)
	movq	%rdx, 24(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lshake256_A32__A1120_ref$3:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %rcx
	movq	24(%rsp), %rdx
	movq	$0, %rsi
	jmp 	Lshake256_A32__A1120_ref$1
Lshake256_A32__A1120_ref$2:
	movq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rdx)
	incq	%rsi
	addq	$8, %rdx
Lshake256_A32__A1120_ref$1:
	cmpq	$4, %rsi
	jl  	Lshake256_A32__A1120_ref$2
	movq	232(%rsp), %rbx
	movq	240(%rsp), %rbp
	movq	248(%rsp), %r12
	movq	256(%rsp), %r13
	movq	264(%rsp), %r14
	movq	272(%rsp), %rsp
	ret
_sha3_256A_A1568_ref:
sha3_256A_A1568_ref:
	movq	%rsp, %rax
	leaq	-272(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 224(%rsp)
	movq	%rbp, 232(%rsp)
	movq	%r12, 240(%rsp)
	movq	%r13, 248(%rsp)
	movq	%r14, 256(%rsp)
	movq	%rax, 264(%rsp)
	leaq	24(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	Lsha3_256A_A1568_ref$11
Lsha3_256A_A1568_ref$12:
	movq	%rcx, (%rax,%rdx,8)
	incq	%rdx
Lsha3_256A_A1568_ref$11:
	cmpq	$25, %rdx
	jb  	Lsha3_256A_A1568_ref$12
	movq	%rdi, %mm0
	leaq	24(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %r8
	jmp 	Lsha3_256A_A1568_ref$6
Lsha3_256A_A1568_ref$7:
	movq	$0, %rdx
	jmp 	Lsha3_256A_A1568_ref$9
Lsha3_256A_A1568_ref$10:
	movq	(%rsi,%rcx), %rdi
	addq	$8, %rcx
	xorq	(%rax,%rdx,8), %rdi
	movq	%rdi, (%rax,%rdx,8)
	incq	%rdx
Lsha3_256A_A1568_ref$9:
	cmpq	$17, %rdx
	jb  	Lsha3_256A_A1568_ref$10
	movq	%rsi, (%rsp)
	movq	%rcx, 8(%rsp)
	movq	%r8, 16(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lsha3_256A_A1568_ref$8:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %rsi
	movq	8(%rsp), %rcx
	movq	16(%rsp), %r8
	incq	%r8
Lsha3_256A_A1568_ref$6:
	cmpq	$11, %r8
	jb  	Lsha3_256A_A1568_ref$7
	movq	$0, %rdx
	jmp 	Lsha3_256A_A1568_ref$4
Lsha3_256A_A1568_ref$5:
	movq	(%rsi,%rcx), %rdi
	addq	$8, %rcx
	xorq	(%rax,%rdx,8), %rdi
	movq	%rdi, (%rax,%rdx,8)
	incq	%rdx
Lsha3_256A_A1568_ref$4:
	cmpq	$9, %rdx
	jb  	Lsha3_256A_A1568_ref$5
	movq	$6, %rcx
	xorq	(%rax,%rdx,8), %rcx
	movq	%rcx, (%rax,%rdx,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	128(%rax), %rcx
	movq	%rcx, 128(%rax)
	movq	%mm0, %rcx
	movq	$0, %rdx
	leaq	24(%rsp), %rax
	movq	%rcx, 16(%rsp)
	movq	%rdx, 8(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lsha3_256A_A1568_ref$3:
	leaq	224(%rsp), %rsp
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	$0, %rsi
	jmp 	Lsha3_256A_A1568_ref$1
Lsha3_256A_A1568_ref$2:
	movq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rdx)
	incq	%rsi
	addq	$8, %rdx
Lsha3_256A_A1568_ref$1:
	cmpq	$4, %rsi
	jl  	Lsha3_256A_A1568_ref$2
	movq	224(%rsp), %rbx
	movq	232(%rsp), %rbp
	movq	240(%rsp), %r12
	movq	248(%rsp), %r13
	movq	256(%rsp), %r14
	movq	264(%rsp), %rsp
	ret
_sha3_256A_A1184_ref:
sha3_256A_A1184_ref:
	movq	%rsp, %rax
	leaq	-272(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 224(%rsp)
	movq	%rbp, 232(%rsp)
	movq	%r12, 240(%rsp)
	movq	%r13, 248(%rsp)
	movq	%r14, 256(%rsp)
	movq	%rax, 264(%rsp)
	leaq	24(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	Lsha3_256A_A1184_ref$11
Lsha3_256A_A1184_ref$12:
	movq	%rcx, (%rax,%rdx,8)
	incq	%rdx
Lsha3_256A_A1184_ref$11:
	cmpq	$25, %rdx
	jb  	Lsha3_256A_A1184_ref$12
	movq	%rdi, %mm0
	leaq	24(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %r8
	jmp 	Lsha3_256A_A1184_ref$6
Lsha3_256A_A1184_ref$7:
	movq	$0, %rdx
	jmp 	Lsha3_256A_A1184_ref$9
Lsha3_256A_A1184_ref$10:
	movq	(%rsi,%rcx), %rdi
	addq	$8, %rcx
	xorq	(%rax,%rdx,8), %rdi
	movq	%rdi, (%rax,%rdx,8)
	incq	%rdx
Lsha3_256A_A1184_ref$9:
	cmpq	$17, %rdx
	jb  	Lsha3_256A_A1184_ref$10
	movq	%rsi, (%rsp)
	movq	%rcx, 8(%rsp)
	movq	%r8, 16(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lsha3_256A_A1184_ref$8:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %rsi
	movq	8(%rsp), %rcx
	movq	16(%rsp), %r8
	incq	%r8
Lsha3_256A_A1184_ref$6:
	cmpq	$8, %r8
	jb  	Lsha3_256A_A1184_ref$7
	movq	$0, %rdx
	jmp 	Lsha3_256A_A1184_ref$4
Lsha3_256A_A1184_ref$5:
	movq	(%rsi,%rcx), %rdi
	addq	$8, %rcx
	xorq	(%rax,%rdx,8), %rdi
	movq	%rdi, (%rax,%rdx,8)
	incq	%rdx
Lsha3_256A_A1184_ref$4:
	cmpq	$12, %rdx
	jb  	Lsha3_256A_A1184_ref$5
	movq	$6, %rcx
	xorq	(%rax,%rdx,8), %rcx
	movq	%rcx, (%rax,%rdx,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	128(%rax), %rcx
	movq	%rcx, 128(%rax)
	movq	%mm0, %rcx
	movq	$0, %rdx
	leaq	24(%rsp), %rax
	movq	%rcx, 16(%rsp)
	movq	%rdx, 8(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lsha3_256A_A1184_ref$3:
	leaq	224(%rsp), %rsp
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	$0, %rsi
	jmp 	Lsha3_256A_A1184_ref$1
Lsha3_256A_A1184_ref$2:
	movq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rdx)
	incq	%rsi
	addq	$8, %rdx
Lsha3_256A_A1184_ref$1:
	cmpq	$4, %rsi
	jl  	Lsha3_256A_A1184_ref$2
	movq	224(%rsp), %rbx
	movq	232(%rsp), %rbp
	movq	240(%rsp), %r12
	movq	248(%rsp), %r13
	movq	256(%rsp), %r14
	movq	264(%rsp), %rsp
	ret
_shake128_next_state_ref:
shake128_next_state_ref:
	movq	%rsp, %rax
	leaq	-56(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 8(%rsp)
	movq	%rbp, 16(%rsp)
	movq	%r12, 24(%rsp)
	movq	%r13, 32(%rsp)
	movq	%r14, 40(%rsp)
	movq	%rax, 48(%rsp)
	leaq	336(%rdi), %rax
	movq	%rdi, (%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lshake128_next_state_ref$1:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rbp
	movq	24(%rsp), %r12
	movq	32(%rsp), %r13
	movq	40(%rsp), %r14
	movq	48(%rsp), %rsp
	ret
_shake128_absorb_squeeze3blocks_ref:
shake128_absorb_squeeze3blocks_ref:
	movq	%rsp, %rax
	leaq	-264(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 216(%rsp)
	movq	%rbp, 224(%rsp)
	movq	%r12, 232(%rsp)
	movq	%r13, 240(%rsp)
	movq	%r14, 248(%rsp)
	movq	%rax, 256(%rsp)
	leaq	16(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %r8
	jmp 	Lshake128_absorb_squeeze3blocks_ref$12
Lshake128_absorb_squeeze3blocks_ref$13:
	movq	%rcx, (%rax,%r8,8)
	incq	%r8
Lshake128_absorb_squeeze3blocks_ref$12:
	cmpq	$25, %r8
	jb  	Lshake128_absorb_squeeze3blocks_ref$13
	movq	%rdi, (%rsp)
	movq	%rdx, 8(%rsp)
	leaq	16(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	Lshake128_absorb_squeeze3blocks_ref$10
Lshake128_absorb_squeeze3blocks_ref$11:
	movq	(%rsi,%rcx), %rdi
	addq	$8, %rcx
	xorq	(%rax,%rdx,8), %rdi
	movq	%rdi, (%rax,%rdx,8)
	incq	%rdx
Lshake128_absorb_squeeze3blocks_ref$10:
	cmpq	$4, %rdx
	jb  	Lshake128_absorb_squeeze3blocks_ref$11
	movq	8(%rsp), %rax
	leaq	16(%rsp), %rcx
	movq	$0, %rdx
	movq	$4, %rsi
	movq	$0, %rdi
	movzwq	(%rax,%rdx), %rax
	movq	$31, %rdx
	shlq	$16, %rdx
	orq 	%rdx, %rax
	shlq	$0, %rax
	orq 	%rax, %rdi
	xorq	(%rcx,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rsi,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	160(%rcx), %rax
	movq	%rax, 160(%rcx)
	leaq	16(%rsp), %rax
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lshake128_absorb_squeeze3blocks_ref$9:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %rax
	movq	$0, %rcx
	leaq	16(%rsp), %rdx
	movq	$0, %rsi
	jmp 	Lshake128_absorb_squeeze3blocks_ref$7
Lshake128_absorb_squeeze3blocks_ref$8:
	movq	(%rdx,%rsi,8), %rdi
	movq	%rdi, (%rax,%rcx)
	incq	%rsi
	addq	$8, %rcx
Lshake128_absorb_squeeze3blocks_ref$7:
	cmpq	$21, %rsi
	jl  	Lshake128_absorb_squeeze3blocks_ref$8
	movq	%rax, (%rsp)
	movq	%rcx, 8(%rsp)
	leaq	16(%rsp), %rax
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lshake128_absorb_squeeze3blocks_ref$6:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	leaq	16(%rsp), %rdx
	movq	$0, %rsi
	jmp 	Lshake128_absorb_squeeze3blocks_ref$4
Lshake128_absorb_squeeze3blocks_ref$5:
	movq	(%rdx,%rsi,8), %rdi
	movq	%rdi, (%rax,%rcx)
	incq	%rsi
	addq	$8, %rcx
Lshake128_absorb_squeeze3blocks_ref$4:
	cmpq	$21, %rsi
	jl  	Lshake128_absorb_squeeze3blocks_ref$5
	movq	%rax, 8(%rsp)
	movq	%rcx, (%rsp)
	leaq	16(%rsp), %rax
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lshake128_absorb_squeeze3blocks_ref$3:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	(%rsp), %rcx
	leaq	16(%rsp), %rdx
	movq	$0, %rsi
	jmp 	Lshake128_absorb_squeeze3blocks_ref$1
Lshake128_absorb_squeeze3blocks_ref$2:
	movq	(%rdx,%rsi,8), %rdi
	movq	%rdi, (%rax,%rcx)
	incq	%rsi
	addq	$8, %rcx
Lshake128_absorb_squeeze3blocks_ref$1:
	cmpq	$25, %rsi
	jl  	Lshake128_absorb_squeeze3blocks_ref$2
	movq	216(%rsp), %rbx
	movq	224(%rsp), %rbp
	movq	232(%rsp), %r12
	movq	240(%rsp), %r13
	movq	248(%rsp), %r14
	movq	256(%rsp), %rsp
	ret
_shake128_absorb_ref:
shake128_absorb_ref:
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lshake128_absorb_ref$3
Lshake128_absorb_ref$4:
	movq	%rax, (%rdi,%rcx,8)
	incq	%rcx
Lshake128_absorb_ref$3:
	cmpq	$25, %rcx
	jb  	Lshake128_absorb_ref$4
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lshake128_absorb_ref$1
Lshake128_absorb_ref$2:
	movq	(%rsi,%rax), %r8
	addq	$8, %rax
	xorq	(%rdi,%rcx,8), %r8
	movq	%r8, (%rdi,%rcx,8)
	incq	%rcx
Lshake128_absorb_ref$1:
	cmpq	$4, %rcx
	jb  	Lshake128_absorb_ref$2
	movq	$0, %rax
	movq	$4, %rcx
	movq	$0, %rsi
	movzwq	(%rdx,%rax), %rax
	movq	$31, %rdx
	shlq	$16, %rdx
	orq 	%rdx, %rax
	shlq	$0, %rax
	orq 	%rax, %rsi
	xorq	(%rdi,%rcx,8), %rsi
	movq	%rsi, (%rdi,%rcx,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	160(%rdi), %rax
	movq	%rax, 160(%rdi)
	ret
_shake256_A128__A32_A1_ref:
shake256_A128__A32_A1_ref:
	movq	%rsp, %rax
	leaq	-264(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 216(%rsp)
	movq	%rbp, 224(%rsp)
	movq	%r12, 232(%rsp)
	movq	%r13, 240(%rsp)
	movq	%r14, 248(%rsp)
	movq	%rax, 256(%rsp)
	leaq	16(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %r8
	jmp 	Lshake256_A128__A32_A1_ref$6
Lshake256_A128__A32_A1_ref$7:
	movq	%rcx, (%rax,%r8,8)
	incq	%r8
Lshake256_A128__A32_A1_ref$6:
	cmpq	$25, %r8
	jb  	Lshake256_A128__A32_A1_ref$7
	movq	%rdi, (%rsp)
	movq	%rdx, 8(%rsp)
	leaq	16(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	Lshake256_A128__A32_A1_ref$4
Lshake256_A128__A32_A1_ref$5:
	movq	(%rsi,%rcx), %rdi
	addq	$8, %rcx
	xorq	(%rax,%rdx,8), %rdi
	movq	%rdi, (%rax,%rdx,8)
	incq	%rdx
Lshake256_A128__A32_A1_ref$4:
	cmpq	$4, %rdx
	jb  	Lshake256_A128__A32_A1_ref$5
	movq	8(%rsp), %rax
	leaq	16(%rsp), %rcx
	movq	$0, %rdx
	movq	$4, %rsi
	movq	$0, %rdi
	movq	$0, %r8
	movzbq	(%rax,%rdx), %rax
	orq 	$7936, %rax
	shlq	$0, %rax
	orq 	%rax, %r8
	shlq	$0, %r8
	orq 	%r8, %rdi
	xorq	(%rcx,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rsi,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	128(%rcx), %rax
	movq	%rax, 128(%rcx)
	movq	(%rsp), %rcx
	movq	$0, %rdx
	leaq	16(%rsp), %rax
	movq	%rcx, (%rsp)
	movq	%rdx, 8(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lshake256_A128__A32_A1_ref$3:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	$0, %rsi
	jmp 	Lshake256_A128__A32_A1_ref$1
Lshake256_A128__A32_A1_ref$2:
	movq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rdx)
	incq	%rsi
	addq	$8, %rdx
Lshake256_A128__A32_A1_ref$1:
	cmpq	$16, %rsi
	jl  	Lshake256_A128__A32_A1_ref$2
	movq	216(%rsp), %rbx
	movq	224(%rsp), %rbp
	movq	232(%rsp), %r12
	movq	240(%rsp), %r13
	movq	248(%rsp), %r14
	movq	256(%rsp), %rsp
	ret
_sha3_512A_A64_ref:
sha3_512A_A64_ref:
	movq	%rsp, %rax
	leaq	-264(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 216(%rsp)
	movq	%rbp, 224(%rsp)
	movq	%r12, 232(%rsp)
	movq	%r13, 240(%rsp)
	movq	%r14, 248(%rsp)
	movq	%rax, 256(%rsp)
	leaq	16(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	Lsha3_512A_A64_ref$6
Lsha3_512A_A64_ref$7:
	movq	%rcx, (%rax,%rdx,8)
	incq	%rdx
Lsha3_512A_A64_ref$6:
	cmpq	$25, %rdx
	jb  	Lsha3_512A_A64_ref$7
	movq	%rdi, (%rsp)
	leaq	16(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	Lsha3_512A_A64_ref$4
Lsha3_512A_A64_ref$5:
	movq	(%rsi,%rcx), %rdi
	addq	$8, %rcx
	xorq	(%rax,%rdx,8), %rdi
	movq	%rdi, (%rax,%rdx,8)
	incq	%rdx
Lsha3_512A_A64_ref$4:
	cmpq	$8, %rdx
	jb  	Lsha3_512A_A64_ref$5
	movq	$6, %rcx
	xorq	(%rax,%rdx,8), %rcx
	movq	%rcx, (%rax,%rdx,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	64(%rax), %rcx
	movq	%rcx, 64(%rax)
	movq	(%rsp), %rcx
	movq	$0, %rdx
	leaq	16(%rsp), %rax
	movq	%rcx, (%rsp)
	movq	%rdx, 8(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lsha3_512A_A64_ref$3:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	$0, %rsi
	jmp 	Lsha3_512A_A64_ref$1
Lsha3_512A_A64_ref$2:
	movq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rdx)
	incq	%rsi
	addq	$8, %rdx
Lsha3_512A_A64_ref$1:
	cmpq	$8, %rsi
	jl  	Lsha3_512A_A64_ref$2
	movq	216(%rsp), %rbx
	movq	224(%rsp), %rbp
	movq	232(%rsp), %r12
	movq	240(%rsp), %r13
	movq	248(%rsp), %r14
	movq	256(%rsp), %rsp
	ret
_sha3_512A_A33_ref:
sha3_512A_A33_ref:
	movq	%rsp, %rax
	leaq	-264(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 216(%rsp)
	movq	%rbp, 224(%rsp)
	movq	%r12, 232(%rsp)
	movq	%r13, 240(%rsp)
	movq	%r14, 248(%rsp)
	movq	%rax, 256(%rsp)
	leaq	16(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	Lsha3_512A_A33_ref$6
Lsha3_512A_A33_ref$7:
	movq	%rcx, (%rax,%rdx,8)
	incq	%rdx
Lsha3_512A_A33_ref$6:
	cmpq	$25, %rdx
	jb  	Lsha3_512A_A33_ref$7
	movq	%rdi, (%rsp)
	leaq	16(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	Lsha3_512A_A33_ref$4
Lsha3_512A_A33_ref$5:
	movq	(%rsi,%rcx), %rdi
	addq	$8, %rcx
	xorq	(%rax,%rdx,8), %rdi
	movq	%rdi, (%rax,%rdx,8)
	incq	%rdx
Lsha3_512A_A33_ref$4:
	cmpq	$4, %rdx
	jb  	Lsha3_512A_A33_ref$5
	movq	$0, %rdi
	movq	$0, %r8
	movzbq	(%rsi,%rcx), %rcx
	orq 	$1536, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %r8
	shlq	$0, %r8
	orq 	%r8, %rdi
	xorq	(%rax,%rdx,8), %rdi
	movq	%rdi, (%rax,%rdx,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	64(%rax), %rcx
	movq	%rcx, 64(%rax)
	movq	(%rsp), %rcx
	movq	$0, %rdx
	leaq	16(%rsp), %rax
	movq	%rcx, (%rsp)
	movq	%rdx, 8(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
Lsha3_512A_A33_ref$3:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	$0, %rsi
	jmp 	Lsha3_512A_A33_ref$1
Lsha3_512A_A33_ref$2:
	movq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rdx)
	incq	%rsi
	addq	$8, %rdx
Lsha3_512A_A33_ref$1:
	cmpq	$8, %rsi
	jl  	Lsha3_512A_A33_ref$2
	movq	216(%rsp), %rbx
	movq	224(%rsp), %rbp
	movq	232(%rsp), %r12
	movq	240(%rsp), %r13
	movq	248(%rsp), %r14
	movq	256(%rsp), %rsp
	ret
L_keccakf1600_ref$1:
	leaq	glob_data + 0(%rip), %rcx
	movq	%rcx, 8(%rsp)
	leaq	32(%rsp), %rcx
	movq	$0, %r10
L_keccakf1600_ref$2:
	movq	%r10, 16(%rsp)
	movq	8(%rsp), %rdx
	movq	(%rdx,%r10,8), %rdx
	movq	%rdx, 24(%rsp)
	movq	(%rax), %r9
	movq	8(%rax), %r8
	movq	16(%rax), %r11
	movq	24(%rax), %rbx
	movq	32(%rax), %rbp
	xorq	40(%rax), %r9
	xorq	48(%rax), %r8
	xorq	56(%rax), %r11
	xorq	64(%rax), %rbx
	xorq	72(%rax), %rbp
	xorq	80(%rax), %r9
	xorq	88(%rax), %r8
	xorq	96(%rax), %r11
	xorq	104(%rax), %rbx
	xorq	112(%rax), %rbp
	xorq	120(%rax), %r9
	xorq	128(%rax), %r8
	xorq	136(%rax), %r11
	xorq	144(%rax), %rbx
	xorq	152(%rax), %rbp
	xorq	160(%rax), %r9
	xorq	168(%rax), %r8
	xorq	176(%rax), %r11
	xorq	184(%rax), %rbx
	xorq	192(%rax), %rbp
	movq	%r8, %rdx
	rolq	$1, %rdx
	xorq	%rbp, %rdx
	movq	%r11, %rsi
	rolq	$1, %rsi
	xorq	%r9, %rsi
	movq	%rbx, %rdi
	rolq	$1, %rdi
	xorq	%r8, %rdi
	movq	%rbp, %r8
	rolq	$1, %r8
	xorq	%r11, %r8
	rolq	$1, %r9
	xorq	%rbx, %r9
	movq	(%rax), %r11
	xorq	%rdx, %r11
	movq	48(%rax), %rbx
	xorq	%rsi, %rbx
	rolq	$44, %rbx
	movq	96(%rax), %rbp
	xorq	%rdi, %rbp
	rolq	$43, %rbp
	movq	144(%rax), %r12
	xorq	%r8, %r12
	rolq	$21, %r12
	movq	192(%rax), %r13
	xorq	%r9, %r13
	rolq	$14, %r13
	movq	%rbx, %r14
	notq	%r14
	andq	%rbp, %r14
	xorq	%r11, %r14
	xorq	24(%rsp), %r14
	movq	%r14, (%rcx)
	movq	%rbp, %r14
	notq	%r14
	andq	%r12, %r14
	xorq	%rbx, %r14
	movq	%r14, 8(%rcx)
	movq	%r12, %r14
	notq	%r14
	andq	%r13, %r14
	xorq	%rbp, %r14
	movq	%r14, 16(%rcx)
	movq	%r13, %rbp
	notq	%rbp
	andq	%r11, %rbp
	xorq	%r12, %rbp
	movq	%rbp, 24(%rcx)
	notq	%r11
	andq	%rbx, %r11
	xorq	%r13, %r11
	movq	%r11, 32(%rcx)
	movq	24(%rax), %r11
	xorq	%r8, %r11
	rolq	$28, %r11
	movq	72(%rax), %rbx
	xorq	%r9, %rbx
	rolq	$20, %rbx
	movq	80(%rax), %rbp
	xorq	%rdx, %rbp
	rolq	$3, %rbp
	movq	128(%rax), %r12
	xorq	%rsi, %r12
	rolq	$45, %r12
	movq	176(%rax), %r13
	xorq	%rdi, %r13
	rolq	$61, %r13
	movq	%rbx, %r14
	notq	%r14
	andq	%rbp, %r14
	xorq	%r11, %r14
	movq	%r14, 40(%rcx)
	movq	%rbp, %r14
	notq	%r14
	andq	%r12, %r14
	xorq	%rbx, %r14
	movq	%r14, 48(%rcx)
	movq	%r12, %r14
	notq	%r14
	andq	%r13, %r14
	xorq	%rbp, %r14
	movq	%r14, 56(%rcx)
	movq	%r13, %rbp
	notq	%rbp
	andq	%r11, %rbp
	xorq	%r12, %rbp
	movq	%rbp, 64(%rcx)
	notq	%r11
	andq	%rbx, %r11
	xorq	%r13, %r11
	movq	%r11, 72(%rcx)
	movq	8(%rax), %r11
	xorq	%rsi, %r11
	rolq	$1, %r11
	movq	56(%rax), %rbx
	xorq	%rdi, %rbx
	rolq	$6, %rbx
	movq	104(%rax), %rbp
	xorq	%r8, %rbp
	rolq	$25, %rbp
	movq	152(%rax), %r12
	xorq	%r9, %r12
	rolq	$8, %r12
	movq	160(%rax), %r13
	xorq	%rdx, %r13
	rolq	$18, %r13
	movq	%rbx, %r14
	notq	%r14
	andq	%rbp, %r14
	xorq	%r11, %r14
	movq	%r14, 80(%rcx)
	movq	%rbp, %r14
	notq	%r14
	andq	%r12, %r14
	xorq	%rbx, %r14
	movq	%r14, 88(%rcx)
	movq	%r12, %r14
	notq	%r14
	andq	%r13, %r14
	xorq	%rbp, %r14
	movq	%r14, 96(%rcx)
	movq	%r13, %rbp
	notq	%rbp
	andq	%r11, %rbp
	xorq	%r12, %rbp
	movq	%rbp, 104(%rcx)
	notq	%r11
	andq	%rbx, %r11
	xorq	%r13, %r11
	movq	%r11, 112(%rcx)
	movq	32(%rax), %r11
	xorq	%r9, %r11
	rolq	$27, %r11
	movq	40(%rax), %rbx
	xorq	%rdx, %rbx
	rolq	$36, %rbx
	movq	88(%rax), %rbp
	xorq	%rsi, %rbp
	rolq	$10, %rbp
	movq	136(%rax), %r12
	xorq	%rdi, %r12
	rolq	$15, %r12
	movq	184(%rax), %r13
	xorq	%r8, %r13
	rolq	$56, %r13
	movq	%rbx, %r14
	notq	%r14
	andq	%rbp, %r14
	xorq	%r11, %r14
	movq	%r14, 120(%rcx)
	movq	%rbp, %r14
	notq	%r14
	andq	%r12, %r14
	xorq	%rbx, %r14
	movq	%r14, 128(%rcx)
	movq	%r12, %r14
	notq	%r14
	andq	%r13, %r14
	xorq	%rbp, %r14
	movq	%r14, 136(%rcx)
	movq	%r13, %rbp
	notq	%rbp
	andq	%r11, %rbp
	xorq	%r12, %rbp
	movq	%rbp, 144(%rcx)
	notq	%r11
	andq	%rbx, %r11
	xorq	%r13, %r11
	movq	%r11, 152(%rcx)
	movq	16(%rax), %r11
	xorq	%rdi, %r11
	rolq	$62, %r11
	movq	64(%rax), %rdi
	xorq	%r8, %rdi
	rolq	$55, %rdi
	movq	112(%rax), %r8
	xorq	%r9, %r8
	rolq	$39, %r8
	movq	120(%rax), %r9
	xorq	%rdx, %r9
	rolq	$41, %r9
	movq	168(%rax), %rdx
	xorq	%rsi, %rdx
	rolq	$2, %rdx
	movq	%rdi, %rsi
	notq	%rsi
	andq	%r8, %rsi
	xorq	%r11, %rsi
	movq	%rsi, 160(%rcx)
	movq	%r8, %rsi
	notq	%rsi
	andq	%r9, %rsi
	xorq	%rdi, %rsi
	movq	%rsi, 168(%rcx)
	movq	%r9, %rsi
	notq	%rsi
	andq	%rdx, %rsi
	xorq	%r8, %rsi
	movq	%rsi, 176(%rcx)
	movq	%rdx, %rsi
	notq	%rsi
	andq	%r11, %rsi
	xorq	%r9, %rsi
	movq	%rsi, 184(%rcx)
	notq	%r11
	andq	%rdi, %r11
	xorq	%rdx, %r11
	movq	%r11, 192(%rcx)
	movq	8(%rsp), %rdx
	movq	8(%rdx,%r10,8), %rdx
	movq	%rdx, 24(%rsp)
	movq	(%rcx), %r9
	movq	8(%rcx), %r8
	movq	16(%rcx), %r10
	movq	24(%rcx), %r11
	movq	32(%rcx), %rbx
	xorq	40(%rcx), %r9
	xorq	48(%rcx), %r8
	xorq	56(%rcx), %r10
	xorq	64(%rcx), %r11
	xorq	72(%rcx), %rbx
	xorq	80(%rcx), %r9
	xorq	88(%rcx), %r8
	xorq	96(%rcx), %r10
	xorq	104(%rcx), %r11
	xorq	112(%rcx), %rbx
	xorq	120(%rcx), %r9
	xorq	128(%rcx), %r8
	xorq	136(%rcx), %r10
	xorq	144(%rcx), %r11
	xorq	152(%rcx), %rbx
	xorq	160(%rcx), %r9
	xorq	168(%rcx), %r8
	xorq	176(%rcx), %r10
	xorq	184(%rcx), %r11
	xorq	192(%rcx), %rbx
	movq	%r8, %rdx
	rolq	$1, %rdx
	xorq	%rbx, %rdx
	movq	%r10, %rsi
	rolq	$1, %rsi
	xorq	%r9, %rsi
	movq	%r11, %rdi
	rolq	$1, %rdi
	xorq	%r8, %rdi
	movq	%rbx, %r8
	rolq	$1, %r8
	xorq	%r10, %r8
	rolq	$1, %r9
	xorq	%r11, %r9
	movq	(%rcx), %r10
	xorq	%rdx, %r10
	movq	48(%rcx), %r11
	xorq	%rsi, %r11
	rolq	$44, %r11
	movq	96(%rcx), %r12
	xorq	%rdi, %r12
	rolq	$43, %r12
	movq	144(%rcx), %rbx
	xorq	%r8, %rbx
	rolq	$21, %rbx
	movq	192(%rcx), %rbp
	xorq	%r9, %rbp
	rolq	$14, %rbp
	movq	%r11, %r13
	notq	%r13
	andq	%r12, %r13
	xorq	%r10, %r13
	xorq	24(%rsp), %r13
	movq	%r13, (%rax)
	movq	%r12, %r13
	notq	%r13
	andq	%rbx, %r13
	xorq	%r11, %r13
	movq	%r13, 8(%rax)
	movq	%rbx, %r13
	notq	%r13
	andq	%rbp, %r13
	xorq	%r12, %r13
	movq	%r13, 16(%rax)
	movq	%rbp, %r12
	notq	%r12
	andq	%r10, %r12
	xorq	%rbx, %r12
	movq	%r12, 24(%rax)
	notq	%r10
	andq	%r11, %r10
	xorq	%rbp, %r10
	movq	%r10, 32(%rax)
	movq	24(%rcx), %r10
	xorq	%r8, %r10
	rolq	$28, %r10
	movq	72(%rcx), %r11
	xorq	%r9, %r11
	rolq	$20, %r11
	movq	80(%rcx), %r12
	xorq	%rdx, %r12
	rolq	$3, %r12
	movq	128(%rcx), %rbx
	xorq	%rsi, %rbx
	rolq	$45, %rbx
	movq	176(%rcx), %rbp
	xorq	%rdi, %rbp
	rolq	$61, %rbp
	movq	%r11, %r13
	notq	%r13
	andq	%r12, %r13
	xorq	%r10, %r13
	movq	%r13, 40(%rax)
	movq	%r12, %r13
	notq	%r13
	andq	%rbx, %r13
	xorq	%r11, %r13
	movq	%r13, 48(%rax)
	movq	%rbx, %r13
	notq	%r13
	andq	%rbp, %r13
	xorq	%r12, %r13
	movq	%r13, 56(%rax)
	movq	%rbp, %r12
	notq	%r12
	andq	%r10, %r12
	xorq	%rbx, %r12
	movq	%r12, 64(%rax)
	notq	%r10
	andq	%r11, %r10
	xorq	%rbp, %r10
	movq	%r10, 72(%rax)
	movq	8(%rcx), %r10
	xorq	%rsi, %r10
	rolq	$1, %r10
	movq	56(%rcx), %r11
	xorq	%rdi, %r11
	rolq	$6, %r11
	movq	104(%rcx), %r12
	xorq	%r8, %r12
	rolq	$25, %r12
	movq	152(%rcx), %rbx
	xorq	%r9, %rbx
	rolq	$8, %rbx
	movq	160(%rcx), %rbp
	xorq	%rdx, %rbp
	rolq	$18, %rbp
	movq	%r11, %r13
	notq	%r13
	andq	%r12, %r13
	xorq	%r10, %r13
	movq	%r13, 80(%rax)
	movq	%r12, %r13
	notq	%r13
	andq	%rbx, %r13
	xorq	%r11, %r13
	movq	%r13, 88(%rax)
	movq	%rbx, %r13
	notq	%r13
	andq	%rbp, %r13
	xorq	%r12, %r13
	movq	%r13, 96(%rax)
	movq	%rbp, %r12
	notq	%r12
	andq	%r10, %r12
	xorq	%rbx, %r12
	movq	%r12, 104(%rax)
	notq	%r10
	andq	%r11, %r10
	xorq	%rbp, %r10
	movq	%r10, 112(%rax)
	movq	32(%rcx), %r10
	xorq	%r9, %r10
	rolq	$27, %r10
	movq	40(%rcx), %r11
	xorq	%rdx, %r11
	rolq	$36, %r11
	movq	88(%rcx), %r12
	xorq	%rsi, %r12
	rolq	$10, %r12
	movq	136(%rcx), %rbx
	xorq	%rdi, %rbx
	rolq	$15, %rbx
	movq	184(%rcx), %rbp
	xorq	%r8, %rbp
	rolq	$56, %rbp
	movq	%r11, %r13
	notq	%r13
	andq	%r12, %r13
	xorq	%r10, %r13
	movq	%r13, 120(%rax)
	movq	%r12, %r13
	notq	%r13
	andq	%rbx, %r13
	xorq	%r11, %r13
	movq	%r13, 128(%rax)
	movq	%rbx, %r13
	notq	%r13
	andq	%rbp, %r13
	xorq	%r12, %r13
	movq	%r13, 136(%rax)
	movq	%rbp, %r12
	notq	%r12
	andq	%r10, %r12
	xorq	%rbx, %r12
	movq	%r12, 144(%rax)
	notq	%r10
	andq	%r11, %r10
	xorq	%rbp, %r10
	movq	%r10, 152(%rax)
	movq	16(%rcx), %r10
	xorq	%rdi, %r10
	rolq	$62, %r10
	movq	64(%rcx), %rdi
	xorq	%r8, %rdi
	rolq	$55, %rdi
	movq	112(%rcx), %r8
	xorq	%r9, %r8
	rolq	$39, %r8
	movq	120(%rcx), %r9
	xorq	%rdx, %r9
	rolq	$41, %r9
	movq	168(%rcx), %rdx
	xorq	%rsi, %rdx
	rolq	$2, %rdx
	movq	%rdi, %rsi
	notq	%rsi
	andq	%r8, %rsi
	xorq	%r10, %rsi
	movq	%rsi, 160(%rax)
	movq	%r8, %rsi
	notq	%rsi
	andq	%r9, %rsi
	xorq	%rdi, %rsi
	movq	%rsi, 168(%rax)
	movq	%r9, %rsi
	notq	%rsi
	andq	%rdx, %rsi
	xorq	%r8, %rsi
	movq	%rsi, 176(%rax)
	movq	%rdx, %rsi
	notq	%rsi
	andq	%r10, %rsi
	xorq	%r9, %rsi
	movq	%rsi, 184(%rax)
	notq	%r10
	andq	%rdi, %r10
	xorq	%rdx, %r10
	movq	%r10, 192(%rax)
	movq	16(%rsp), %r10
	addq	$2, %r10
	cmpq	$23, %r10
	jb  	L_keccakf1600_ref$2
	ret
	.data
	.p2align	5
_glob_data:
glob_data:
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
