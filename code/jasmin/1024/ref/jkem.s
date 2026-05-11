	.att_syntax
	.text
	.p2align	5
	.global	jade_kem_mlkem_mlkem1024_amd64_ref_dec
	.global	jade_kem_mlkem_mlkem1024_amd64_ref_enc
	.global	jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand
	.global	jade_kem_mlkem_mlkem1024_amd64_ref_keypair
	.global	jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand
	.type	jade_kem_mlkem_mlkem1024_amd64_ref_dec, %function
jade_kem_mlkem_mlkem1024_amd64_ref_dec:
	movq	%rsp, %rax
	leaq	-20624(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 20568(%rsp)
	movq	%rbp, 20576(%rsp)
	movq	%r12, 20584(%rsp)
	movq	%r13, 20592(%rsp)
	movq	%r14, 20600(%rsp)
	movq	%r15, 20608(%rsp)
	movq	%rax, 20616(%rsp)
	movq	%rdx, %rax
	lfence
	movq	$0, %rcx
	movq	%rdi, %mm0
	movq	%rsi, %mm1
	movq	%rax, %mm2
	leaq	72(%rsp), %r10
	leaq	2616(%rsp), %rcx
	movq	%rsi, %rdx
	movq	$0, %rdi
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$405
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$406:
	movzbl	(%rdx,%r8), %r9d
	incq	%r8
	movzbl	(%rdx,%r8), %r11d
	incq	%r8
	movl	%r11d, %ebx
	shll	$8, %ebx
	orl 	%ebx, %r9d
	andl	$2047, %r9d
	imull	$3329, %r9d, %r9d
	addl	$1024, %r9d
	shrl	$11, %r9d
	movw	%r9w, (%rcx,%rdi,2)
	movzbl	(%rdx,%r8), %r9d
	incq	%r8
	shrl	$3, %r11d
	movl	%r9d, %ebx
	shll	$5, %ebx
	orl 	%ebx, %r11d
	andl	$2047, %r11d
	imull	$3329, %r11d, %r11d
	addl	$1024, %r11d
	shrl	$11, %r11d
	movw	%r11w, 2(%rcx,%rdi,2)
	movzbl	(%rdx,%r8), %r11d
	incq	%r8
	movzbl	(%rdx,%r8), %ebx
	incq	%r8
	shrl	$6, %r9d
	shll	$2, %r11d
	movl	%ebx, %ebp
	shll	$10, %ebp
	orl 	%ebp, %r11d
	orl 	%r9d, %r11d
	andl	$2047, %r11d
	imull	$3329, %r11d, %r11d
	addl	$1024, %r11d
	shrl	$11, %r11d
	movw	%r11w, 4(%rcx,%rdi,2)
	movzbl	(%rdx,%r8), %r11d
	incq	%r8
	shrl	$1, %ebx
	movl	%r11d, %ebp
	shll	$7, %ebp
	orl 	%ebp, %ebx
	andl	$2047, %ebx
	imull	$3329, %ebx, %ebx
	addl	$1024, %ebx
	shrl	$11, %ebx
	movw	%bx, 6(%rcx,%rdi,2)
	movzbl	(%rdx,%r8), %r9d
	incq	%r8
	shrl	$4, %r11d
	movl	%r9d, %ebx
	shll	$4, %ebx
	orl 	%ebx, %r11d
	andl	$2047, %r11d
	imull	$3329, %r11d, %r11d
	addl	$1024, %r11d
	shrl	$11, %r11d
	movw	%r11w, 8(%rcx,%rdi,2)
	movzbl	(%rdx,%r8), %ebx
	incq	%r8
	movzbl	(%rdx,%r8), %r11d
	incq	%r8
	shrl	$7, %r9d
	shll	$1, %ebx
	movl	%r11d, %ebp
	shll	$9, %ebp
	orl 	%ebp, %ebx
	orl 	%r9d, %ebx
	andl	$2047, %ebx
	imull	$3329, %ebx, %ebx
	addl	$1024, %ebx
	shrl	$11, %ebx
	movw	%bx, 10(%rcx,%rdi,2)
	movzbl	(%rdx,%r8), %r9d
	incq	%r8
	shrl	$2, %r11d
	movl	%r9d, %ebx
	shll	$6, %ebx
	orl 	%ebx, %r11d
	andl	$2047, %r11d
	imull	$3329, %r11d, %r11d
	addl	$1024, %r11d
	shrl	$11, %r11d
	movw	%r11w, 12(%rcx,%rdi,2)
	movzbl	(%rdx,%r8), %r11d
	incq	%r8
	shrl	$5, %r9d
	shll	$3, %r11d
	orl 	%r11d, %r9d
	andl	$2047, %r9d
	imull	$3329, %r9d, %r9d
	addl	$1024, %r9d
	shrl	$11, %r9d
	movw	%r9w, 14(%rcx,%rdi,2)
	addq	$8, %rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$405:
	cmpq	$1024, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$406
	leaq	568(%rsp), %rcx
	leaq	1408(%rsi), %rdx
	call	L_i_poly_decompress$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$404:
	leaq	4664(%rsp), %rcx
	movq	%rax, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$403:
	leaq	5176(%rsp), %rcx
	leaq	384(%rax), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$402:
	leaq	5688(%rsp), %rcx
	leaq	768(%rax), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$401:
	leaq	6200(%rsp), %rcx
	leaq	1152(%rax), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$400:
	leaq	2616(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$399:
	leaq	3128(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$398:
	leaq	3640(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$397:
	leaq	4152(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$396:
	leaq	1080(%rsp), %rdx
	leaq	4664(%rsp), %rax
	leaq	2616(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$395:
	leaq	16(%rsp), %rsp
	leaq	1592(%rsp), %rdx
	leaq	5176(%rsp), %rax
	leaq	3128(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$394:
	leaq	16(%rsp), %rsp
	leaq	1080(%rsp), %rax
	leaq	1592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$393:
	leaq	1592(%rsp), %rdx
	leaq	5688(%rsp), %rax
	leaq	3640(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$392:
	leaq	16(%rsp), %rsp
	leaq	1080(%rsp), %rax
	leaq	1592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$391:
	leaq	1592(%rsp), %rdx
	leaq	6200(%rsp), %rax
	leaq	4152(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$390:
	leaq	16(%rsp), %rsp
	leaq	1080(%rsp), %rax
	leaq	1592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$389:
	leaq	1080(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$387
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$388:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$387:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$388
	leaq	1080(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$386:
	leaq	1592(%rsp), %rax
	leaq	568(%rsp), %rdx
	leaq	1080(%rsp), %rcx
	call	L_poly_sub$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$385:
	leaq	1592(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$383
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$384:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$383:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$384
	leaq	1592(%rsp), %rax
	call	L_i_poly_tomsg$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$382:
	movq	%mm2, %rcx
	movq	3104(%rcx), %rax
	movq	%rax, 104(%rsp)
	movq	3112(%rcx), %rax
	movq	%rax, 112(%rsp)
	movq	3120(%rcx), %rax
	movq	%rax, 120(%rsp)
	movq	3128(%rcx), %rax
	movq	%rax, 128(%rsp)
	leaq	136(%rsp), %rsi
	leaq	72(%rsp), %rbx
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$381:
	leaq	224(%rsp), %rsp
	leaq	19000(%rsp), %rdx
	leaq	72(%rsp), %rax
	leaq	1536(%rcx), %r10
	leaq	168(%rsp), %r11
	movq	%rdx, %mm3
	movq	%r10, %rbx
	leaq	2616(%rsp), %rcx
	movq	%rbx, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$380:
	leaq	3128(%rsp), %rcx
	leaq	384(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$379:
	leaq	3640(%rsp), %rcx
	leaq	768(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$378:
	leaq	4152(%rsp), %rcx
	leaq	1152(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$377:
	movq	1536(%r10), %rcx
	movq	%rcx, (%rsp)
	movq	1544(%r10), %rcx
	movq	%rcx, 8(%rsp)
	movq	1552(%r10), %rcx
	movq	%rcx, 16(%rsp)
	movq	1560(%r10), %rcx
	movq	%rcx, 24(%rsp)
	leaq	1592(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$376:
	movq	%r11, %mm4
	movq	$1, %rax
	movq	%rax, %mm5
	movb	(%rsp), %sil
	movb	%sil, 32(%rsp)
	movb	1(%rsp), %sil
	movb	%sil, 33(%rsp)
	movb	2(%rsp), %sil
	movb	%sil, 34(%rsp)
	movb	3(%rsp), %sil
	movb	%sil, 35(%rsp)
	movb	4(%rsp), %sil
	movb	%sil, 36(%rsp)
	movb	5(%rsp), %sil
	movb	%sil, 37(%rsp)
	movb	6(%rsp), %sil
	movb	%sil, 38(%rsp)
	movb	7(%rsp), %sil
	movb	%sil, 39(%rsp)
	movb	8(%rsp), %sil
	movb	%sil, 40(%rsp)
	movb	9(%rsp), %sil
	movb	%sil, 41(%rsp)
	movb	10(%rsp), %sil
	movb	%sil, 42(%rsp)
	movb	11(%rsp), %sil
	movb	%sil, 43(%rsp)
	movb	12(%rsp), %sil
	movb	%sil, 44(%rsp)
	movb	13(%rsp), %sil
	movb	%sil, 45(%rsp)
	movb	14(%rsp), %sil
	movb	%sil, 46(%rsp)
	movb	15(%rsp), %sil
	movb	%sil, 47(%rsp)
	movb	16(%rsp), %sil
	movb	%sil, 48(%rsp)
	movb	17(%rsp), %sil
	movb	%sil, 49(%rsp)
	movb	18(%rsp), %sil
	movb	%sil, 50(%rsp)
	movb	19(%rsp), %sil
	movb	%sil, 51(%rsp)
	movb	20(%rsp), %sil
	movb	%sil, 52(%rsp)
	movb	21(%rsp), %sil
	movb	%sil, 53(%rsp)
	movb	22(%rsp), %sil
	movb	%sil, 54(%rsp)
	movb	23(%rsp), %sil
	movb	%sil, 55(%rsp)
	movb	24(%rsp), %sil
	movb	%sil, 56(%rsp)
	movb	25(%rsp), %sil
	movb	%sil, 57(%rsp)
	movb	26(%rsp), %sil
	movb	%sil, 58(%rsp)
	movb	27(%rsp), %sil
	movb	%sil, 59(%rsp)
	movb	28(%rsp), %sil
	movb	%sil, 60(%rsp)
	movb	29(%rsp), %sil
	movb	%sil, 61(%rsp)
	movb	30(%rsp), %sil
	movb	%sil, 62(%rsp)
	movb	31(%rsp), %sil
	movb	%sil, 63(%rsp)
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$374
	movb	$0, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$375
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$374:
	movb	$0, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$375:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$373:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$360
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$361:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$372:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$362
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$363:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$364
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$362
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$364:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$370
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$371
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$370:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$371:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$366
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$362
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$366:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$368
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$362
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$368:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$369:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$367:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$365:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$362:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$363
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$360:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$361
	movq	$0, %rcx
	leaq	10808(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$358
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$359:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$358:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$359
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$356
	movb	$0, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$357
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$356:
	movb	$1, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$357:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$355:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$342
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$343:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$354:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$344
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$345:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$346
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$344
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$346:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$352
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$353
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$352:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$353:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$348
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$344
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$348:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$350
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$344
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$350:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$351:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$349:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$347:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$344:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$345
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$342:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$343
	movq	$0, %rcx
	leaq	11320(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$340
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$341:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$340:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$341
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$338
	movb	$0, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$339
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$338:
	movb	$2, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$339:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$337:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$324
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$325:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$336:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$326
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$327:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$328
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$326
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$328:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$334
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$335
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$334:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$335:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$330
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$326
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$330:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$332
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$326
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$332:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$333:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$331:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$329:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$326:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$327
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$324:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$325
	movq	$0, %rcx
	leaq	11832(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$322
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$323:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$322:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$323
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$320
	movb	$0, 64(%rsp)
	movb	$3, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$321
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$320:
	movb	$3, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$321:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$319:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$306
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$307:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$318:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$308
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$309:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$310
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$308
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$310:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$316
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$317
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$316:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$317:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$312
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$308
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$312:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$314
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$308
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$314:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$315:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$313:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$311:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$308:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$309
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$306:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$307
	movq	$0, %rcx
	leaq	12344(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$304
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$305:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$304:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$305
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$302
	movb	$1, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$303
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$302:
	movb	$0, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$303:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$301:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$288
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$289:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$300:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$290
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$291:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$292
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$290
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$292:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$298
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$299
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$298:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$299:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$294
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$290
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$294:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$296
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$290
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$296:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$297:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$295:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$293:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$290:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$291
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$288:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$289
	movq	$0, %rcx
	leaq	12856(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$286
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$287:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$286:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$287
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$284
	movb	$1, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$285
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$284:
	movb	$1, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$285:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$283:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$270
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$271:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$282:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$272
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$273:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$274
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$272
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$274:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$280
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$281
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$280:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$281:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$276
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$272
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$276:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$278
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$272
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$278:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$279:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$277:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$275:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$272:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$273
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$270:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$271
	movq	$0, %rcx
	leaq	13368(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$268
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$269:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$268:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$269
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$266
	movb	$1, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$267
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$266:
	movb	$2, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$267:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$265:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$252
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$253:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$264:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$254
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$255:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$256
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$254
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$256:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$262
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$263
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$262:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$263:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$258
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$254
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$258:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$260
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$254
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$260:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$261:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$259:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$257:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$254:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$255
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$252:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$253
	movq	$0, %rcx
	leaq	13880(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$250
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$251:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$250:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$251
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$248
	movb	$1, 64(%rsp)
	movb	$3, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$249
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$248:
	movb	$3, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$249:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$247:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$234
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$235:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$246:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$236
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$237:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$238
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$236
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$238:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$244
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$245
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$244:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$245:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$240
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$236
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$240:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$242
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$236
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$242:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$243:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$241:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$239:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$236:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$237
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$234:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$235
	movq	$0, %rcx
	leaq	14392(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$232
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$233:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$232:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$233
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$230
	movb	$2, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$231
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$230:
	movb	$0, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$231:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$229:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$216
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$217:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$228:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$218
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$219:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$220
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$218
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$220:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$226
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$227
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$226:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$227:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$222
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$218
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$222:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$224
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$218
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$224:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$225:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$223:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$221:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$218:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$219
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$216:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$217
	movq	$0, %rcx
	leaq	14904(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$214
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$215:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$214:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$215
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$212
	movb	$2, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$213
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$212:
	movb	$1, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$213:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$211:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$198
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$199:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$210:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$200
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$201:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$202
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$200
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$202:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$208
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$209
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$208:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$209:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$204
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$200
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$204:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$206
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$200
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$206:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$207:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$205:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$203:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$200:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$201
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$198:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$199
	movq	$0, %rcx
	leaq	15416(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$196
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$197:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$196:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$197
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$194
	movb	$2, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$195
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$194:
	movb	$2, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$195:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$193:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$180
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$181:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$192:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$182
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$183:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$184
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$182
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$184:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$190
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$191
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$190:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$191:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$186
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$182
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$186:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$188
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$182
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$188:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$189:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$187:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$185:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$182:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$183
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$180:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$181
	movq	$0, %rcx
	leaq	15928(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$178
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$179:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$178:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$179
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$176
	movb	$2, 64(%rsp)
	movb	$3, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$177
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$176:
	movb	$3, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$177:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$175:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$162
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$163:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$174:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$164
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$165:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$166
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$164
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$166:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$172
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$173
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$172:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$173:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$168
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$164
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$168:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$170
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$164
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$170:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$171:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$169:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$167:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$164:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$165
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$162:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$163
	movq	$0, %rcx
	leaq	16440(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$160
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$161:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$160:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$161
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$158
	movb	$3, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$159
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$158:
	movb	$0, 64(%rsp)
	movb	$3, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$159:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$157:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$144
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$145:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$156:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$146
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$147:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$148
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$146
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$148:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$154
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$155
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$154:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$155:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$150
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$146
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$150:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$152
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$146
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$152:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$153:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$151:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$149:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$146:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$147
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$144:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$145
	movq	$0, %rcx
	leaq	16952(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$142
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$143:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$142:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$143
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$140
	movb	$3, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$141
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$140:
	movb	$1, 64(%rsp)
	movb	$3, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$141:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$139:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$126
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$127:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$138:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$128
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$129:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$130
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$128
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$130:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$136
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$137
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$136:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$137:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$132
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$128
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$132:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$134
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$128
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$134:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$135:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$133:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$131:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$128:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$129
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$126:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$127
	movq	$0, %rcx
	leaq	17464(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$124
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$125:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$124:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$125
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$122
	movb	$3, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$123
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$122:
	movb	$2, 64(%rsp)
	movb	$3, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$123:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$121:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$108
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$109:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$120:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$110
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$111:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$112
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$110
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$112:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$118
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$119
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$118:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$119:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$114
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$110
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$114:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$116
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$110
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$116:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$117:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$115:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$113:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$110:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$111
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$108:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$109
	movq	$0, %rcx
	leaq	17976(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$106
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$107:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$106:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$107
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$104
	movb	$3, 64(%rsp)
	movb	$3, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$105
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$104:
	movb	$3, 64(%rsp)
	movb	$3, 65(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$105:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$103:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$90
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$91:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$102:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$92
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$93:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$94
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$92
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$94:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	202(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$100
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$101
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$100:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$101:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$96
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$92
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$96:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$98
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$92
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$98:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$99:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$97:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$95:
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$92:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$93
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$90:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$91
	movq	$0, %rcx
	leaq	18488(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$88
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$89:
	movw	1080(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$88:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$89
	movq	%mm4, %rcx
	movb	$0, %al
	leaq	4664(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$87:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	5176(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$86:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	5688(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$85:
	leaq	176(%rsp), %rsp
	movb	$3, %al
	leaq	6200(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$84:
	leaq	176(%rsp), %rsp
	movq	%mm4, %rcx
	movb	$4, %al
	leaq	6712(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$83:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	7224(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$82:
	leaq	176(%rsp), %rsp
	movb	$6, %al
	leaq	7736(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$81:
	leaq	176(%rsp), %rsp
	movb	$7, %al
	leaq	8248(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$80:
	leaq	176(%rsp), %rsp
	movb	$8, %al
	leaq	1080(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$79:
	leaq	176(%rsp), %rsp
	leaq	4664(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$78:
	leaq	5176(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$77:
	leaq	5688(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$76:
	leaq	6200(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$75:
	leaq	8760(%rsp), %rdx
	leaq	10808(%rsp), %rax
	leaq	4664(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$74:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rdx
	leaq	11320(%rsp), %rax
	leaq	5176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$73:
	leaq	16(%rsp), %rsp
	leaq	8760(%rsp), %rax
	leaq	568(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$72:
	leaq	568(%rsp), %rdx
	leaq	11832(%rsp), %rax
	leaq	5688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$71:
	leaq	16(%rsp), %rsp
	leaq	8760(%rsp), %rax
	leaq	568(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$70:
	leaq	568(%rsp), %rdx
	leaq	12344(%rsp), %rax
	leaq	6200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$69:
	leaq	16(%rsp), %rsp
	leaq	8760(%rsp), %rax
	leaq	568(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$68:
	leaq	8760(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$66
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$67:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$66:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$67
	leaq	9272(%rsp), %rdx
	leaq	12856(%rsp), %rax
	leaq	4664(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$65:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rdx
	leaq	13368(%rsp), %rax
	leaq	5176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$64:
	leaq	16(%rsp), %rsp
	leaq	9272(%rsp), %rax
	leaq	568(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$63:
	leaq	568(%rsp), %rdx
	leaq	13880(%rsp), %rax
	leaq	5688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$62:
	leaq	16(%rsp), %rsp
	leaq	9272(%rsp), %rax
	leaq	568(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$61:
	leaq	568(%rsp), %rdx
	leaq	14392(%rsp), %rax
	leaq	6200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$60:
	leaq	16(%rsp), %rsp
	leaq	9272(%rsp), %rax
	leaq	568(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$59:
	leaq	9272(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$57
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$58:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$57:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$58
	leaq	9784(%rsp), %rdx
	leaq	14904(%rsp), %rax
	leaq	4664(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$56:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rdx
	leaq	15416(%rsp), %rax
	leaq	5176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$55:
	leaq	16(%rsp), %rsp
	leaq	9784(%rsp), %rax
	leaq	568(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$54:
	leaq	568(%rsp), %rdx
	leaq	15928(%rsp), %rax
	leaq	5688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$53:
	leaq	16(%rsp), %rsp
	leaq	9784(%rsp), %rax
	leaq	568(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$52:
	leaq	568(%rsp), %rdx
	leaq	16440(%rsp), %rax
	leaq	6200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$51:
	leaq	16(%rsp), %rsp
	leaq	9784(%rsp), %rax
	leaq	568(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$50:
	leaq	9784(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$48
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$49:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$48:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$49
	leaq	10296(%rsp), %rdx
	leaq	16952(%rsp), %rax
	leaq	4664(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$47:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rdx
	leaq	17464(%rsp), %rax
	leaq	5176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$46:
	leaq	16(%rsp), %rsp
	leaq	10296(%rsp), %rax
	leaq	568(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$45:
	leaq	568(%rsp), %rdx
	leaq	17976(%rsp), %rax
	leaq	5688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$44:
	leaq	16(%rsp), %rsp
	leaq	10296(%rsp), %rax
	leaq	568(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$43:
	leaq	568(%rsp), %rdx
	leaq	18488(%rsp), %rax
	leaq	6200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$42:
	leaq	16(%rsp), %rsp
	leaq	10296(%rsp), %rax
	leaq	568(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$41:
	leaq	10296(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$39
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$40:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$39:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$40
	leaq	568(%rsp), %rdx
	leaq	2616(%rsp), %rax
	leaq	4664(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$38:
	leaq	16(%rsp), %rsp
	leaq	2104(%rsp), %rdx
	leaq	3128(%rsp), %rax
	leaq	5176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$37:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rax
	leaq	2104(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$36:
	leaq	2104(%rsp), %rdx
	leaq	3640(%rsp), %rax
	leaq	5688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$35:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rax
	leaq	2104(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$34:
	leaq	2104(%rsp), %rdx
	leaq	4152(%rsp), %rax
	leaq	6200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$33:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rax
	leaq	2104(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$32:
	leaq	568(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$30
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$31:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$30:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$31
	leaq	8760(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$29:
	leaq	9272(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$28:
	leaq	9784(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$27:
	leaq	10296(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$26:
	leaq	568(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$25:
	leaq	8760(%rsp), %rax
	leaq	6712(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$24:
	leaq	9272(%rsp), %rax
	leaq	7224(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$23:
	leaq	9784(%rsp), %rax
	leaq	7736(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$22:
	leaq	10296(%rsp), %rax
	leaq	8248(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$21:
	leaq	568(%rsp), %rax
	leaq	1080(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$20:
	leaq	568(%rsp), %rax
	leaq	1592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$19:
	leaq	8760(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$17
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$18:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$17:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$18
	leaq	9272(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$15
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$16:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$15:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$16
	leaq	9784(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$13
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$14:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$13:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$14
	leaq	10296(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$11
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$12:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$11:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$12
	leaq	568(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$9
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$10:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$9:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$10
	movq	%mm3, %rdx
	movq	%rdx, %r10
	movq	$0, %rsi
	movq	$0, %rdi
	leaq	8760(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$8:
	leaq	9272(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$7:
	leaq	9784(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$6:
	leaq	10296(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$5:
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$3
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$4:
	movzwq	8760(%rsp,%rsi,2), %r8
	shlq	$11, %r8
	addq	$1664, %r8
	imulq	$645084, %r8, %r8
	shrq	$31, %r8
	andq	$2047, %r8
	movw	%r8w, %ax
	movzwq	8762(%rsp,%rsi,2), %r8
	shlq	$11, %r8
	addq	$1664, %r8
	imulq	$645084, %r8, %r8
	shrq	$31, %r8
	andq	$2047, %r8
	movw	%r8w, %cx
	movzwq	8764(%rsp,%rsi,2), %r8
	shlq	$11, %r8
	addq	$1664, %r8
	imulq	$645084, %r8, %r8
	shrq	$31, %r8
	andq	$2047, %r8
	movzwq	8766(%rsp,%rsi,2), %r9
	shlq	$11, %r9
	addq	$1664, %r9
	imulq	$645084, %r9, %r9
	shrq	$31, %r9
	andq	$2047, %r9
	movzwq	8768(%rsp,%rsi,2), %r11
	shlq	$11, %r11
	addq	$1664, %r11
	imulq	$645084, %r11, %r11
	shrq	$31, %r11
	andq	$2047, %r11
	movzwq	8770(%rsp,%rsi,2), %rbx
	shlq	$11, %rbx
	addq	$1664, %rbx
	imulq	$645084, %rbx, %rbx
	shrq	$31, %rbx
	andq	$2047, %rbx
	movzwq	8772(%rsp,%rsi,2), %rbp
	shlq	$11, %rbp
	addq	$1664, %rbp
	imulq	$645084, %rbp, %rbp
	shrq	$31, %rbp
	andq	$2047, %rbp
	movzwq	8774(%rsp,%rsi,2), %r12
	shlq	$11, %r12
	addq	$1664, %r12
	imulq	$645084, %r12, %r12
	shrq	$31, %r12
	andq	$2047, %r12
	movw	%ax, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$8, %ax
	movw	%cx, %r13w
	shlw	$3, %r13w
	orw 	%ax, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$5, %cx
	movw	%r8w, %r13w
	shlw	$6, %r13w
	orw 	%cx, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	movw	%r8w, %ax
	shrw	$2, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$10, %r8w
	movw	%r9w, %r13w
	shlw	$1, %r13w
	orw 	%r8w, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$7, %r9w
	movw	%r11w, %r13w
	shlw	$4, %r13w
	orw 	%r9w, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$4, %r11w
	movw	%bx, %r13w
	shlw	$7, %r13w
	orw 	%r11w, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	movw	%bx, %ax
	shrw	$1, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$9, %bx
	movw	%bp, %r13w
	shlw	$2, %r13w
	orw 	%bx, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$6, %bp
	movw	%r12w, %r13w
	shlw	$5, %r13w
	orw 	%bp, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$3, %r12w
	movb	%r12b, (%r10,%rdi)
	incq	%rdi
	addq	$8, %rsi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$3:
	cmpq	$1024, %rsi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$4
	leaq	1408(%rdx), %r10
	leaq	568(%rsp), %rax
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$2:
	movq	%mm1, %rax
	leaq	19000(%rsp), %rdx
	movq	$0, %rcx
	movb	(%rdx), %r9b
	movb	(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1(%rdx), %r9b
	movb	1(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	2(%rdx), %r9b
	movb	2(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	3(%rdx), %r9b
	movb	3(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	4(%rdx), %r9b
	movb	4(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	5(%rdx), %r9b
	movb	5(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	6(%rdx), %r9b
	movb	6(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	7(%rdx), %r9b
	movb	7(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	8(%rdx), %r9b
	movb	8(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	9(%rdx), %r9b
	movb	9(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	10(%rdx), %r9b
	movb	10(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	11(%rdx), %r9b
	movb	11(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	12(%rdx), %r9b
	movb	12(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	13(%rdx), %r9b
	movb	13(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	14(%rdx), %r9b
	movb	14(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	15(%rdx), %r9b
	movb	15(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	16(%rdx), %r9b
	movb	16(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	17(%rdx), %r9b
	movb	17(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	18(%rdx), %r9b
	movb	18(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	19(%rdx), %r9b
	movb	19(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	20(%rdx), %r9b
	movb	20(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	21(%rdx), %r9b
	movb	21(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	22(%rdx), %r9b
	movb	22(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	23(%rdx), %r9b
	movb	23(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	24(%rdx), %r9b
	movb	24(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	25(%rdx), %r9b
	movb	25(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	26(%rdx), %r9b
	movb	26(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	27(%rdx), %r9b
	movb	27(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	28(%rdx), %r9b
	movb	28(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	29(%rdx), %r9b
	movb	29(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	30(%rdx), %r9b
	movb	30(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	31(%rdx), %r9b
	movb	31(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	32(%rdx), %r9b
	movb	32(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	33(%rdx), %r9b
	movb	33(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	34(%rdx), %r9b
	movb	34(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	35(%rdx), %r9b
	movb	35(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	36(%rdx), %r9b
	movb	36(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	37(%rdx), %r9b
	movb	37(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	38(%rdx), %r9b
	movb	38(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	39(%rdx), %r9b
	movb	39(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	40(%rdx), %r9b
	movb	40(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	41(%rdx), %r9b
	movb	41(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	42(%rdx), %r9b
	movb	42(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	43(%rdx), %r9b
	movb	43(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	44(%rdx), %r9b
	movb	44(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	45(%rdx), %r9b
	movb	45(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	46(%rdx), %r9b
	movb	46(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	47(%rdx), %r9b
	movb	47(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	48(%rdx), %r9b
	movb	48(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	49(%rdx), %r9b
	movb	49(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	50(%rdx), %r9b
	movb	50(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	51(%rdx), %r9b
	movb	51(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	52(%rdx), %r9b
	movb	52(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	53(%rdx), %r9b
	movb	53(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	54(%rdx), %r9b
	movb	54(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	55(%rdx), %r9b
	movb	55(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	56(%rdx), %r9b
	movb	56(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	57(%rdx), %r9b
	movb	57(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	58(%rdx), %r9b
	movb	58(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	59(%rdx), %r9b
	movb	59(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	60(%rdx), %r9b
	movb	60(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	61(%rdx), %r9b
	movb	61(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	62(%rdx), %r9b
	movb	62(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	63(%rdx), %r9b
	movb	63(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	64(%rdx), %r9b
	movb	64(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	65(%rdx), %r9b
	movb	65(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	66(%rdx), %r9b
	movb	66(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	67(%rdx), %r9b
	movb	67(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	68(%rdx), %r9b
	movb	68(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	69(%rdx), %r9b
	movb	69(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	70(%rdx), %r9b
	movb	70(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	71(%rdx), %r9b
	movb	71(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	72(%rdx), %r9b
	movb	72(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	73(%rdx), %r9b
	movb	73(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	74(%rdx), %r9b
	movb	74(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	75(%rdx), %r9b
	movb	75(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	76(%rdx), %r9b
	movb	76(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	77(%rdx), %r9b
	movb	77(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	78(%rdx), %r9b
	movb	78(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	79(%rdx), %r9b
	movb	79(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	80(%rdx), %r9b
	movb	80(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	81(%rdx), %r9b
	movb	81(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	82(%rdx), %r9b
	movb	82(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	83(%rdx), %r9b
	movb	83(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	84(%rdx), %r9b
	movb	84(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	85(%rdx), %r9b
	movb	85(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	86(%rdx), %r9b
	movb	86(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	87(%rdx), %r9b
	movb	87(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	88(%rdx), %r9b
	movb	88(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	89(%rdx), %r9b
	movb	89(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	90(%rdx), %r9b
	movb	90(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	91(%rdx), %r9b
	movb	91(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	92(%rdx), %r9b
	movb	92(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	93(%rdx), %r9b
	movb	93(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	94(%rdx), %r9b
	movb	94(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	95(%rdx), %r9b
	movb	95(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	96(%rdx), %r9b
	movb	96(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	97(%rdx), %r9b
	movb	97(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	98(%rdx), %r9b
	movb	98(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	99(%rdx), %r9b
	movb	99(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	100(%rdx), %r9b
	movb	100(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	101(%rdx), %r9b
	movb	101(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	102(%rdx), %r9b
	movb	102(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	103(%rdx), %r9b
	movb	103(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	104(%rdx), %r9b
	movb	104(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	105(%rdx), %r9b
	movb	105(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	106(%rdx), %r9b
	movb	106(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	107(%rdx), %r9b
	movb	107(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	108(%rdx), %r9b
	movb	108(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	109(%rdx), %r9b
	movb	109(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	110(%rdx), %r9b
	movb	110(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	111(%rdx), %r9b
	movb	111(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	112(%rdx), %r9b
	movb	112(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	113(%rdx), %r9b
	movb	113(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	114(%rdx), %r9b
	movb	114(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	115(%rdx), %r9b
	movb	115(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	116(%rdx), %r9b
	movb	116(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	117(%rdx), %r9b
	movb	117(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	118(%rdx), %r9b
	movb	118(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	119(%rdx), %r9b
	movb	119(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	120(%rdx), %r9b
	movb	120(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	121(%rdx), %r9b
	movb	121(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	122(%rdx), %r9b
	movb	122(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	123(%rdx), %r9b
	movb	123(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	124(%rdx), %r9b
	movb	124(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	125(%rdx), %r9b
	movb	125(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	126(%rdx), %r9b
	movb	126(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	127(%rdx), %r9b
	movb	127(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	128(%rdx), %r9b
	movb	128(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	129(%rdx), %r9b
	movb	129(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	130(%rdx), %r9b
	movb	130(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	131(%rdx), %r9b
	movb	131(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	132(%rdx), %r9b
	movb	132(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	133(%rdx), %r9b
	movb	133(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	134(%rdx), %r9b
	movb	134(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	135(%rdx), %r9b
	movb	135(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	136(%rdx), %r9b
	movb	136(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	137(%rdx), %r9b
	movb	137(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	138(%rdx), %r9b
	movb	138(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	139(%rdx), %r9b
	movb	139(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	140(%rdx), %r9b
	movb	140(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	141(%rdx), %r9b
	movb	141(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	142(%rdx), %r9b
	movb	142(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	143(%rdx), %r9b
	movb	143(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	144(%rdx), %r9b
	movb	144(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	145(%rdx), %r9b
	movb	145(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	146(%rdx), %r9b
	movb	146(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	147(%rdx), %r9b
	movb	147(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	148(%rdx), %r9b
	movb	148(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	149(%rdx), %r9b
	movb	149(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	150(%rdx), %r9b
	movb	150(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	151(%rdx), %r9b
	movb	151(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	152(%rdx), %r9b
	movb	152(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	153(%rdx), %r9b
	movb	153(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	154(%rdx), %r9b
	movb	154(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	155(%rdx), %r9b
	movb	155(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	156(%rdx), %r9b
	movb	156(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	157(%rdx), %r9b
	movb	157(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	158(%rdx), %r9b
	movb	158(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	159(%rdx), %r9b
	movb	159(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	160(%rdx), %r9b
	movb	160(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	161(%rdx), %r9b
	movb	161(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	162(%rdx), %r9b
	movb	162(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	163(%rdx), %r9b
	movb	163(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	164(%rdx), %r9b
	movb	164(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	165(%rdx), %r9b
	movb	165(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	166(%rdx), %r9b
	movb	166(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	167(%rdx), %r9b
	movb	167(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	168(%rdx), %r9b
	movb	168(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	169(%rdx), %r9b
	movb	169(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	170(%rdx), %r9b
	movb	170(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	171(%rdx), %r9b
	movb	171(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	172(%rdx), %r9b
	movb	172(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	173(%rdx), %r9b
	movb	173(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	174(%rdx), %r9b
	movb	174(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	175(%rdx), %r9b
	movb	175(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	176(%rdx), %r9b
	movb	176(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	177(%rdx), %r9b
	movb	177(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	178(%rdx), %r9b
	movb	178(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	179(%rdx), %r9b
	movb	179(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	180(%rdx), %r9b
	movb	180(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	181(%rdx), %r9b
	movb	181(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	182(%rdx), %r9b
	movb	182(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	183(%rdx), %r9b
	movb	183(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	184(%rdx), %r9b
	movb	184(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	185(%rdx), %r9b
	movb	185(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	186(%rdx), %r9b
	movb	186(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	187(%rdx), %r9b
	movb	187(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	188(%rdx), %r9b
	movb	188(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	189(%rdx), %r9b
	movb	189(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	190(%rdx), %r9b
	movb	190(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	191(%rdx), %r9b
	movb	191(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	192(%rdx), %r9b
	movb	192(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	193(%rdx), %r9b
	movb	193(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	194(%rdx), %r9b
	movb	194(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	195(%rdx), %r9b
	movb	195(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	196(%rdx), %r9b
	movb	196(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	197(%rdx), %r9b
	movb	197(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	198(%rdx), %r9b
	movb	198(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	199(%rdx), %r9b
	movb	199(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	200(%rdx), %r9b
	movb	200(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	201(%rdx), %r9b
	movb	201(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	202(%rdx), %r9b
	movb	202(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	203(%rdx), %r9b
	movb	203(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	204(%rdx), %r9b
	movb	204(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	205(%rdx), %r9b
	movb	205(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	206(%rdx), %r9b
	movb	206(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	207(%rdx), %r9b
	movb	207(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	208(%rdx), %r9b
	movb	208(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	209(%rdx), %r9b
	movb	209(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	210(%rdx), %r9b
	movb	210(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	211(%rdx), %r9b
	movb	211(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	212(%rdx), %r9b
	movb	212(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	213(%rdx), %r9b
	movb	213(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	214(%rdx), %r9b
	movb	214(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	215(%rdx), %r9b
	movb	215(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	216(%rdx), %r9b
	movb	216(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	217(%rdx), %r9b
	movb	217(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	218(%rdx), %r9b
	movb	218(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	219(%rdx), %r9b
	movb	219(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	220(%rdx), %r9b
	movb	220(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	221(%rdx), %r9b
	movb	221(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	222(%rdx), %r9b
	movb	222(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	223(%rdx), %r9b
	movb	223(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	224(%rdx), %r9b
	movb	224(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	225(%rdx), %r9b
	movb	225(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	226(%rdx), %r9b
	movb	226(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	227(%rdx), %r9b
	movb	227(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	228(%rdx), %r9b
	movb	228(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	229(%rdx), %r9b
	movb	229(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	230(%rdx), %r9b
	movb	230(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	231(%rdx), %r9b
	movb	231(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	232(%rdx), %r9b
	movb	232(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	233(%rdx), %r9b
	movb	233(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	234(%rdx), %r9b
	movb	234(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	235(%rdx), %r9b
	movb	235(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	236(%rdx), %r9b
	movb	236(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	237(%rdx), %r9b
	movb	237(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	238(%rdx), %r9b
	movb	238(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	239(%rdx), %r9b
	movb	239(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	240(%rdx), %r9b
	movb	240(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	241(%rdx), %r9b
	movb	241(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	242(%rdx), %r9b
	movb	242(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	243(%rdx), %r9b
	movb	243(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	244(%rdx), %r9b
	movb	244(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	245(%rdx), %r9b
	movb	245(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	246(%rdx), %r9b
	movb	246(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	247(%rdx), %r9b
	movb	247(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	248(%rdx), %r9b
	movb	248(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	249(%rdx), %r9b
	movb	249(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	250(%rdx), %r9b
	movb	250(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	251(%rdx), %r9b
	movb	251(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	252(%rdx), %r9b
	movb	252(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	253(%rdx), %r9b
	movb	253(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	254(%rdx), %r9b
	movb	254(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	255(%rdx), %r9b
	movb	255(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	256(%rdx), %r9b
	movb	256(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	257(%rdx), %r9b
	movb	257(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	258(%rdx), %r9b
	movb	258(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	259(%rdx), %r9b
	movb	259(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	260(%rdx), %r9b
	movb	260(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	261(%rdx), %r9b
	movb	261(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	262(%rdx), %r9b
	movb	262(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	263(%rdx), %r9b
	movb	263(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	264(%rdx), %r9b
	movb	264(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	265(%rdx), %r9b
	movb	265(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	266(%rdx), %r9b
	movb	266(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	267(%rdx), %r9b
	movb	267(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	268(%rdx), %r9b
	movb	268(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	269(%rdx), %r9b
	movb	269(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	270(%rdx), %r9b
	movb	270(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	271(%rdx), %r9b
	movb	271(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	272(%rdx), %r9b
	movb	272(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	273(%rdx), %r9b
	movb	273(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	274(%rdx), %r9b
	movb	274(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	275(%rdx), %r9b
	movb	275(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	276(%rdx), %r9b
	movb	276(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	277(%rdx), %r9b
	movb	277(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	278(%rdx), %r9b
	movb	278(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	279(%rdx), %r9b
	movb	279(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	280(%rdx), %r9b
	movb	280(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	281(%rdx), %r9b
	movb	281(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	282(%rdx), %r9b
	movb	282(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	283(%rdx), %r9b
	movb	283(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	284(%rdx), %r9b
	movb	284(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	285(%rdx), %r9b
	movb	285(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	286(%rdx), %r9b
	movb	286(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	287(%rdx), %r9b
	movb	287(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	288(%rdx), %r9b
	movb	288(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	289(%rdx), %r9b
	movb	289(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	290(%rdx), %r9b
	movb	290(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	291(%rdx), %r9b
	movb	291(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	292(%rdx), %r9b
	movb	292(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	293(%rdx), %r9b
	movb	293(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	294(%rdx), %r9b
	movb	294(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	295(%rdx), %r9b
	movb	295(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	296(%rdx), %r9b
	movb	296(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	297(%rdx), %r9b
	movb	297(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	298(%rdx), %r9b
	movb	298(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	299(%rdx), %r9b
	movb	299(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	300(%rdx), %r9b
	movb	300(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	301(%rdx), %r9b
	movb	301(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	302(%rdx), %r9b
	movb	302(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	303(%rdx), %r9b
	movb	303(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	304(%rdx), %r9b
	movb	304(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	305(%rdx), %r9b
	movb	305(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	306(%rdx), %r9b
	movb	306(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	307(%rdx), %r9b
	movb	307(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	308(%rdx), %r9b
	movb	308(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	309(%rdx), %r9b
	movb	309(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	310(%rdx), %r9b
	movb	310(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	311(%rdx), %r9b
	movb	311(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	312(%rdx), %r9b
	movb	312(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	313(%rdx), %r9b
	movb	313(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	314(%rdx), %r9b
	movb	314(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	315(%rdx), %r9b
	movb	315(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	316(%rdx), %r9b
	movb	316(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	317(%rdx), %r9b
	movb	317(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	318(%rdx), %r9b
	movb	318(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	319(%rdx), %r9b
	movb	319(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	320(%rdx), %r9b
	movb	320(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	321(%rdx), %r9b
	movb	321(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	322(%rdx), %r9b
	movb	322(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	323(%rdx), %r9b
	movb	323(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	324(%rdx), %r9b
	movb	324(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	325(%rdx), %r9b
	movb	325(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	326(%rdx), %r9b
	movb	326(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	327(%rdx), %r9b
	movb	327(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	328(%rdx), %r9b
	movb	328(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	329(%rdx), %r9b
	movb	329(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	330(%rdx), %r9b
	movb	330(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	331(%rdx), %r9b
	movb	331(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	332(%rdx), %r9b
	movb	332(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	333(%rdx), %r9b
	movb	333(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	334(%rdx), %r9b
	movb	334(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	335(%rdx), %r9b
	movb	335(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	336(%rdx), %r9b
	movb	336(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	337(%rdx), %r9b
	movb	337(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	338(%rdx), %r9b
	movb	338(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	339(%rdx), %r9b
	movb	339(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	340(%rdx), %r9b
	movb	340(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	341(%rdx), %r9b
	movb	341(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	342(%rdx), %r9b
	movb	342(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	343(%rdx), %r9b
	movb	343(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	344(%rdx), %r9b
	movb	344(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	345(%rdx), %r9b
	movb	345(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	346(%rdx), %r9b
	movb	346(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	347(%rdx), %r9b
	movb	347(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	348(%rdx), %r9b
	movb	348(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	349(%rdx), %r9b
	movb	349(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	350(%rdx), %r9b
	movb	350(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	351(%rdx), %r9b
	movb	351(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	352(%rdx), %r9b
	movb	352(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	353(%rdx), %r9b
	movb	353(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	354(%rdx), %r9b
	movb	354(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	355(%rdx), %r9b
	movb	355(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	356(%rdx), %r9b
	movb	356(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	357(%rdx), %r9b
	movb	357(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	358(%rdx), %r9b
	movb	358(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	359(%rdx), %r9b
	movb	359(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	360(%rdx), %r9b
	movb	360(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	361(%rdx), %r9b
	movb	361(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	362(%rdx), %r9b
	movb	362(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	363(%rdx), %r9b
	movb	363(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	364(%rdx), %r9b
	movb	364(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	365(%rdx), %r9b
	movb	365(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	366(%rdx), %r9b
	movb	366(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	367(%rdx), %r9b
	movb	367(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	368(%rdx), %r9b
	movb	368(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	369(%rdx), %r9b
	movb	369(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	370(%rdx), %r9b
	movb	370(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	371(%rdx), %r9b
	movb	371(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	372(%rdx), %r9b
	movb	372(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	373(%rdx), %r9b
	movb	373(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	374(%rdx), %r9b
	movb	374(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	375(%rdx), %r9b
	movb	375(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	376(%rdx), %r9b
	movb	376(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	377(%rdx), %r9b
	movb	377(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	378(%rdx), %r9b
	movb	378(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	379(%rdx), %r9b
	movb	379(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	380(%rdx), %r9b
	movb	380(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	381(%rdx), %r9b
	movb	381(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	382(%rdx), %r9b
	movb	382(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	383(%rdx), %r9b
	movb	383(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	384(%rdx), %r9b
	movb	384(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	385(%rdx), %r9b
	movb	385(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	386(%rdx), %r9b
	movb	386(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	387(%rdx), %r9b
	movb	387(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	388(%rdx), %r9b
	movb	388(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	389(%rdx), %r9b
	movb	389(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	390(%rdx), %r9b
	movb	390(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	391(%rdx), %r9b
	movb	391(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	392(%rdx), %r9b
	movb	392(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	393(%rdx), %r9b
	movb	393(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	394(%rdx), %r9b
	movb	394(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	395(%rdx), %r9b
	movb	395(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	396(%rdx), %r9b
	movb	396(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	397(%rdx), %r9b
	movb	397(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	398(%rdx), %r9b
	movb	398(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	399(%rdx), %r9b
	movb	399(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	400(%rdx), %r9b
	movb	400(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	401(%rdx), %r9b
	movb	401(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	402(%rdx), %r9b
	movb	402(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	403(%rdx), %r9b
	movb	403(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	404(%rdx), %r9b
	movb	404(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	405(%rdx), %r9b
	movb	405(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	406(%rdx), %r9b
	movb	406(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	407(%rdx), %r9b
	movb	407(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	408(%rdx), %r9b
	movb	408(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	409(%rdx), %r9b
	movb	409(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	410(%rdx), %r9b
	movb	410(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	411(%rdx), %r9b
	movb	411(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	412(%rdx), %r9b
	movb	412(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	413(%rdx), %r9b
	movb	413(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	414(%rdx), %r9b
	movb	414(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	415(%rdx), %r9b
	movb	415(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	416(%rdx), %r9b
	movb	416(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	417(%rdx), %r9b
	movb	417(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	418(%rdx), %r9b
	movb	418(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	419(%rdx), %r9b
	movb	419(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	420(%rdx), %r9b
	movb	420(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	421(%rdx), %r9b
	movb	421(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	422(%rdx), %r9b
	movb	422(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	423(%rdx), %r9b
	movb	423(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	424(%rdx), %r9b
	movb	424(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	425(%rdx), %r9b
	movb	425(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	426(%rdx), %r9b
	movb	426(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	427(%rdx), %r9b
	movb	427(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	428(%rdx), %r9b
	movb	428(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	429(%rdx), %r9b
	movb	429(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	430(%rdx), %r9b
	movb	430(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	431(%rdx), %r9b
	movb	431(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	432(%rdx), %r9b
	movb	432(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	433(%rdx), %r9b
	movb	433(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	434(%rdx), %r9b
	movb	434(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	435(%rdx), %r9b
	movb	435(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	436(%rdx), %r9b
	movb	436(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	437(%rdx), %r9b
	movb	437(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	438(%rdx), %r9b
	movb	438(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	439(%rdx), %r9b
	movb	439(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	440(%rdx), %r9b
	movb	440(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	441(%rdx), %r9b
	movb	441(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	442(%rdx), %r9b
	movb	442(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	443(%rdx), %r9b
	movb	443(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	444(%rdx), %r9b
	movb	444(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	445(%rdx), %r9b
	movb	445(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	446(%rdx), %r9b
	movb	446(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	447(%rdx), %r9b
	movb	447(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	448(%rdx), %r9b
	movb	448(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	449(%rdx), %r9b
	movb	449(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	450(%rdx), %r9b
	movb	450(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	451(%rdx), %r9b
	movb	451(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	452(%rdx), %r9b
	movb	452(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	453(%rdx), %r9b
	movb	453(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	454(%rdx), %r9b
	movb	454(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	455(%rdx), %r9b
	movb	455(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	456(%rdx), %r9b
	movb	456(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	457(%rdx), %r9b
	movb	457(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	458(%rdx), %r9b
	movb	458(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	459(%rdx), %r9b
	movb	459(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	460(%rdx), %r9b
	movb	460(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	461(%rdx), %r9b
	movb	461(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	462(%rdx), %r9b
	movb	462(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	463(%rdx), %r9b
	movb	463(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	464(%rdx), %r9b
	movb	464(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	465(%rdx), %r9b
	movb	465(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	466(%rdx), %r9b
	movb	466(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	467(%rdx), %r9b
	movb	467(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	468(%rdx), %r9b
	movb	468(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	469(%rdx), %r9b
	movb	469(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	470(%rdx), %r9b
	movb	470(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	471(%rdx), %r9b
	movb	471(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	472(%rdx), %r9b
	movb	472(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	473(%rdx), %r9b
	movb	473(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	474(%rdx), %r9b
	movb	474(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	475(%rdx), %r9b
	movb	475(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	476(%rdx), %r9b
	movb	476(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	477(%rdx), %r9b
	movb	477(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	478(%rdx), %r9b
	movb	478(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	479(%rdx), %r9b
	movb	479(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	480(%rdx), %r9b
	movb	480(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	481(%rdx), %r9b
	movb	481(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	482(%rdx), %r9b
	movb	482(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	483(%rdx), %r9b
	movb	483(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	484(%rdx), %r9b
	movb	484(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	485(%rdx), %r9b
	movb	485(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	486(%rdx), %r9b
	movb	486(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	487(%rdx), %r9b
	movb	487(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	488(%rdx), %r9b
	movb	488(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	489(%rdx), %r9b
	movb	489(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	490(%rdx), %r9b
	movb	490(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	491(%rdx), %r9b
	movb	491(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	492(%rdx), %r9b
	movb	492(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	493(%rdx), %r9b
	movb	493(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	494(%rdx), %r9b
	movb	494(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	495(%rdx), %r9b
	movb	495(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	496(%rdx), %r9b
	movb	496(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	497(%rdx), %r9b
	movb	497(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	498(%rdx), %r9b
	movb	498(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	499(%rdx), %r9b
	movb	499(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	500(%rdx), %r9b
	movb	500(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	501(%rdx), %r9b
	movb	501(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	502(%rdx), %r9b
	movb	502(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	503(%rdx), %r9b
	movb	503(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	504(%rdx), %r9b
	movb	504(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	505(%rdx), %r9b
	movb	505(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	506(%rdx), %r9b
	movb	506(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	507(%rdx), %r9b
	movb	507(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	508(%rdx), %r9b
	movb	508(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	509(%rdx), %r9b
	movb	509(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	510(%rdx), %r9b
	movb	510(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	511(%rdx), %r9b
	movb	511(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	512(%rdx), %r9b
	movb	512(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	513(%rdx), %r9b
	movb	513(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	514(%rdx), %r9b
	movb	514(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	515(%rdx), %r9b
	movb	515(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	516(%rdx), %r9b
	movb	516(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	517(%rdx), %r9b
	movb	517(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	518(%rdx), %r9b
	movb	518(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	519(%rdx), %r9b
	movb	519(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	520(%rdx), %r9b
	movb	520(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	521(%rdx), %r9b
	movb	521(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	522(%rdx), %r9b
	movb	522(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	523(%rdx), %r9b
	movb	523(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	524(%rdx), %r9b
	movb	524(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	525(%rdx), %r9b
	movb	525(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	526(%rdx), %r9b
	movb	526(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	527(%rdx), %r9b
	movb	527(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	528(%rdx), %r9b
	movb	528(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	529(%rdx), %r9b
	movb	529(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	530(%rdx), %r9b
	movb	530(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	531(%rdx), %r9b
	movb	531(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	532(%rdx), %r9b
	movb	532(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	533(%rdx), %r9b
	movb	533(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	534(%rdx), %r9b
	movb	534(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	535(%rdx), %r9b
	movb	535(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	536(%rdx), %r9b
	movb	536(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	537(%rdx), %r9b
	movb	537(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	538(%rdx), %r9b
	movb	538(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	539(%rdx), %r9b
	movb	539(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	540(%rdx), %r9b
	movb	540(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	541(%rdx), %r9b
	movb	541(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	542(%rdx), %r9b
	movb	542(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	543(%rdx), %r9b
	movb	543(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	544(%rdx), %r9b
	movb	544(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	545(%rdx), %r9b
	movb	545(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	546(%rdx), %r9b
	movb	546(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	547(%rdx), %r9b
	movb	547(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	548(%rdx), %r9b
	movb	548(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	549(%rdx), %r9b
	movb	549(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	550(%rdx), %r9b
	movb	550(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	551(%rdx), %r9b
	movb	551(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	552(%rdx), %r9b
	movb	552(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	553(%rdx), %r9b
	movb	553(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	554(%rdx), %r9b
	movb	554(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	555(%rdx), %r9b
	movb	555(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	556(%rdx), %r9b
	movb	556(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	557(%rdx), %r9b
	movb	557(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	558(%rdx), %r9b
	movb	558(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	559(%rdx), %r9b
	movb	559(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	560(%rdx), %r9b
	movb	560(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	561(%rdx), %r9b
	movb	561(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	562(%rdx), %r9b
	movb	562(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	563(%rdx), %r9b
	movb	563(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	564(%rdx), %r9b
	movb	564(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	565(%rdx), %r9b
	movb	565(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	566(%rdx), %r9b
	movb	566(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	567(%rdx), %r9b
	movb	567(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	568(%rdx), %r9b
	movb	568(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	569(%rdx), %r9b
	movb	569(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	570(%rdx), %r9b
	movb	570(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	571(%rdx), %r9b
	movb	571(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	572(%rdx), %r9b
	movb	572(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	573(%rdx), %r9b
	movb	573(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	574(%rdx), %r9b
	movb	574(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	575(%rdx), %r9b
	movb	575(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	576(%rdx), %r9b
	movb	576(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	577(%rdx), %r9b
	movb	577(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	578(%rdx), %r9b
	movb	578(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	579(%rdx), %r9b
	movb	579(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	580(%rdx), %r9b
	movb	580(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	581(%rdx), %r9b
	movb	581(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	582(%rdx), %r9b
	movb	582(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	583(%rdx), %r9b
	movb	583(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	584(%rdx), %r9b
	movb	584(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	585(%rdx), %r9b
	movb	585(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	586(%rdx), %r9b
	movb	586(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	587(%rdx), %r9b
	movb	587(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	588(%rdx), %r9b
	movb	588(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	589(%rdx), %r9b
	movb	589(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	590(%rdx), %r9b
	movb	590(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	591(%rdx), %r9b
	movb	591(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	592(%rdx), %r9b
	movb	592(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	593(%rdx), %r9b
	movb	593(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	594(%rdx), %r9b
	movb	594(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	595(%rdx), %r9b
	movb	595(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	596(%rdx), %r9b
	movb	596(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	597(%rdx), %r9b
	movb	597(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	598(%rdx), %r9b
	movb	598(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	599(%rdx), %r9b
	movb	599(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	600(%rdx), %r9b
	movb	600(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	601(%rdx), %r9b
	movb	601(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	602(%rdx), %r9b
	movb	602(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	603(%rdx), %r9b
	movb	603(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	604(%rdx), %r9b
	movb	604(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	605(%rdx), %r9b
	movb	605(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	606(%rdx), %r9b
	movb	606(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	607(%rdx), %r9b
	movb	607(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	608(%rdx), %r9b
	movb	608(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	609(%rdx), %r9b
	movb	609(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	610(%rdx), %r9b
	movb	610(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	611(%rdx), %r9b
	movb	611(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	612(%rdx), %r9b
	movb	612(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	613(%rdx), %r9b
	movb	613(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	614(%rdx), %r9b
	movb	614(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	615(%rdx), %r9b
	movb	615(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	616(%rdx), %r9b
	movb	616(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	617(%rdx), %r9b
	movb	617(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	618(%rdx), %r9b
	movb	618(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	619(%rdx), %r9b
	movb	619(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	620(%rdx), %r9b
	movb	620(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	621(%rdx), %r9b
	movb	621(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	622(%rdx), %r9b
	movb	622(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	623(%rdx), %r9b
	movb	623(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	624(%rdx), %r9b
	movb	624(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	625(%rdx), %r9b
	movb	625(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	626(%rdx), %r9b
	movb	626(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	627(%rdx), %r9b
	movb	627(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	628(%rdx), %r9b
	movb	628(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	629(%rdx), %r9b
	movb	629(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	630(%rdx), %r9b
	movb	630(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	631(%rdx), %r9b
	movb	631(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	632(%rdx), %r9b
	movb	632(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	633(%rdx), %r9b
	movb	633(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	634(%rdx), %r9b
	movb	634(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	635(%rdx), %r9b
	movb	635(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	636(%rdx), %r9b
	movb	636(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	637(%rdx), %r9b
	movb	637(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	638(%rdx), %r9b
	movb	638(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	639(%rdx), %r9b
	movb	639(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	640(%rdx), %r9b
	movb	640(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	641(%rdx), %r9b
	movb	641(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	642(%rdx), %r9b
	movb	642(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	643(%rdx), %r9b
	movb	643(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	644(%rdx), %r9b
	movb	644(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	645(%rdx), %r9b
	movb	645(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	646(%rdx), %r9b
	movb	646(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	647(%rdx), %r9b
	movb	647(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	648(%rdx), %r9b
	movb	648(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	649(%rdx), %r9b
	movb	649(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	650(%rdx), %r9b
	movb	650(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	651(%rdx), %r9b
	movb	651(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	652(%rdx), %r9b
	movb	652(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	653(%rdx), %r9b
	movb	653(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	654(%rdx), %r9b
	movb	654(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	655(%rdx), %r9b
	movb	655(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	656(%rdx), %r9b
	movb	656(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	657(%rdx), %r9b
	movb	657(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	658(%rdx), %r9b
	movb	658(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	659(%rdx), %r9b
	movb	659(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	660(%rdx), %r9b
	movb	660(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	661(%rdx), %r9b
	movb	661(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	662(%rdx), %r9b
	movb	662(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	663(%rdx), %r9b
	movb	663(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	664(%rdx), %r9b
	movb	664(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	665(%rdx), %r9b
	movb	665(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	666(%rdx), %r9b
	movb	666(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	667(%rdx), %r9b
	movb	667(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	668(%rdx), %r9b
	movb	668(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	669(%rdx), %r9b
	movb	669(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	670(%rdx), %r9b
	movb	670(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	671(%rdx), %r9b
	movb	671(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	672(%rdx), %r9b
	movb	672(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	673(%rdx), %r9b
	movb	673(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	674(%rdx), %r9b
	movb	674(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	675(%rdx), %r9b
	movb	675(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	676(%rdx), %r9b
	movb	676(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	677(%rdx), %r9b
	movb	677(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	678(%rdx), %r9b
	movb	678(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	679(%rdx), %r9b
	movb	679(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	680(%rdx), %r9b
	movb	680(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	681(%rdx), %r9b
	movb	681(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	682(%rdx), %r9b
	movb	682(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	683(%rdx), %r9b
	movb	683(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	684(%rdx), %r9b
	movb	684(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	685(%rdx), %r9b
	movb	685(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	686(%rdx), %r9b
	movb	686(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	687(%rdx), %r9b
	movb	687(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	688(%rdx), %r9b
	movb	688(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	689(%rdx), %r9b
	movb	689(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	690(%rdx), %r9b
	movb	690(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	691(%rdx), %r9b
	movb	691(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	692(%rdx), %r9b
	movb	692(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	693(%rdx), %r9b
	movb	693(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	694(%rdx), %r9b
	movb	694(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	695(%rdx), %r9b
	movb	695(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	696(%rdx), %r9b
	movb	696(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	697(%rdx), %r9b
	movb	697(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	698(%rdx), %r9b
	movb	698(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	699(%rdx), %r9b
	movb	699(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	700(%rdx), %r9b
	movb	700(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	701(%rdx), %r9b
	movb	701(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	702(%rdx), %r9b
	movb	702(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	703(%rdx), %r9b
	movb	703(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	704(%rdx), %r9b
	movb	704(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	705(%rdx), %r9b
	movb	705(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	706(%rdx), %r9b
	movb	706(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	707(%rdx), %r9b
	movb	707(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	708(%rdx), %r9b
	movb	708(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	709(%rdx), %r9b
	movb	709(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	710(%rdx), %r9b
	movb	710(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	711(%rdx), %r9b
	movb	711(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	712(%rdx), %r9b
	movb	712(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	713(%rdx), %r9b
	movb	713(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	714(%rdx), %r9b
	movb	714(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	715(%rdx), %r9b
	movb	715(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	716(%rdx), %r9b
	movb	716(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	717(%rdx), %r9b
	movb	717(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	718(%rdx), %r9b
	movb	718(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	719(%rdx), %r9b
	movb	719(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	720(%rdx), %r9b
	movb	720(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	721(%rdx), %r9b
	movb	721(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	722(%rdx), %r9b
	movb	722(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	723(%rdx), %r9b
	movb	723(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	724(%rdx), %r9b
	movb	724(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	725(%rdx), %r9b
	movb	725(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	726(%rdx), %r9b
	movb	726(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	727(%rdx), %r9b
	movb	727(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	728(%rdx), %r9b
	movb	728(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	729(%rdx), %r9b
	movb	729(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	730(%rdx), %r9b
	movb	730(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	731(%rdx), %r9b
	movb	731(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	732(%rdx), %r9b
	movb	732(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	733(%rdx), %r9b
	movb	733(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	734(%rdx), %r9b
	movb	734(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	735(%rdx), %r9b
	movb	735(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	736(%rdx), %r9b
	movb	736(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	737(%rdx), %r9b
	movb	737(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	738(%rdx), %r9b
	movb	738(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	739(%rdx), %r9b
	movb	739(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	740(%rdx), %r9b
	movb	740(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	741(%rdx), %r9b
	movb	741(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	742(%rdx), %r9b
	movb	742(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	743(%rdx), %r9b
	movb	743(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	744(%rdx), %r9b
	movb	744(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	745(%rdx), %r9b
	movb	745(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	746(%rdx), %r9b
	movb	746(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	747(%rdx), %r9b
	movb	747(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	748(%rdx), %r9b
	movb	748(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	749(%rdx), %r9b
	movb	749(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	750(%rdx), %r9b
	movb	750(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	751(%rdx), %r9b
	movb	751(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	752(%rdx), %r9b
	movb	752(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	753(%rdx), %r9b
	movb	753(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	754(%rdx), %r9b
	movb	754(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	755(%rdx), %r9b
	movb	755(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	756(%rdx), %r9b
	movb	756(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	757(%rdx), %r9b
	movb	757(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	758(%rdx), %r9b
	movb	758(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	759(%rdx), %r9b
	movb	759(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	760(%rdx), %r9b
	movb	760(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	761(%rdx), %r9b
	movb	761(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	762(%rdx), %r9b
	movb	762(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	763(%rdx), %r9b
	movb	763(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	764(%rdx), %r9b
	movb	764(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	765(%rdx), %r9b
	movb	765(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	766(%rdx), %r9b
	movb	766(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	767(%rdx), %r9b
	movb	767(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	768(%rdx), %r9b
	movb	768(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	769(%rdx), %r9b
	movb	769(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	770(%rdx), %r9b
	movb	770(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	771(%rdx), %r9b
	movb	771(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	772(%rdx), %r9b
	movb	772(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	773(%rdx), %r9b
	movb	773(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	774(%rdx), %r9b
	movb	774(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	775(%rdx), %r9b
	movb	775(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	776(%rdx), %r9b
	movb	776(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	777(%rdx), %r9b
	movb	777(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	778(%rdx), %r9b
	movb	778(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	779(%rdx), %r9b
	movb	779(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	780(%rdx), %r9b
	movb	780(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	781(%rdx), %r9b
	movb	781(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	782(%rdx), %r9b
	movb	782(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	783(%rdx), %r9b
	movb	783(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	784(%rdx), %r9b
	movb	784(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	785(%rdx), %r9b
	movb	785(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	786(%rdx), %r9b
	movb	786(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	787(%rdx), %r9b
	movb	787(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	788(%rdx), %r9b
	movb	788(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	789(%rdx), %r9b
	movb	789(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	790(%rdx), %r9b
	movb	790(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	791(%rdx), %r9b
	movb	791(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	792(%rdx), %r9b
	movb	792(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	793(%rdx), %r9b
	movb	793(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	794(%rdx), %r9b
	movb	794(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	795(%rdx), %r9b
	movb	795(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	796(%rdx), %r9b
	movb	796(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	797(%rdx), %r9b
	movb	797(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	798(%rdx), %r9b
	movb	798(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	799(%rdx), %r9b
	movb	799(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	800(%rdx), %r9b
	movb	800(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	801(%rdx), %r9b
	movb	801(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	802(%rdx), %r9b
	movb	802(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	803(%rdx), %r9b
	movb	803(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	804(%rdx), %r9b
	movb	804(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	805(%rdx), %r9b
	movb	805(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	806(%rdx), %r9b
	movb	806(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	807(%rdx), %r9b
	movb	807(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	808(%rdx), %r9b
	movb	808(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	809(%rdx), %r9b
	movb	809(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	810(%rdx), %r9b
	movb	810(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	811(%rdx), %r9b
	movb	811(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	812(%rdx), %r9b
	movb	812(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	813(%rdx), %r9b
	movb	813(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	814(%rdx), %r9b
	movb	814(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	815(%rdx), %r9b
	movb	815(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	816(%rdx), %r9b
	movb	816(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	817(%rdx), %r9b
	movb	817(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	818(%rdx), %r9b
	movb	818(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	819(%rdx), %r9b
	movb	819(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	820(%rdx), %r9b
	movb	820(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	821(%rdx), %r9b
	movb	821(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	822(%rdx), %r9b
	movb	822(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	823(%rdx), %r9b
	movb	823(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	824(%rdx), %r9b
	movb	824(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	825(%rdx), %r9b
	movb	825(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	826(%rdx), %r9b
	movb	826(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	827(%rdx), %r9b
	movb	827(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	828(%rdx), %r9b
	movb	828(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	829(%rdx), %r9b
	movb	829(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	830(%rdx), %r9b
	movb	830(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	831(%rdx), %r9b
	movb	831(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	832(%rdx), %r9b
	movb	832(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	833(%rdx), %r9b
	movb	833(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	834(%rdx), %r9b
	movb	834(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	835(%rdx), %r9b
	movb	835(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	836(%rdx), %r9b
	movb	836(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	837(%rdx), %r9b
	movb	837(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	838(%rdx), %r9b
	movb	838(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	839(%rdx), %r9b
	movb	839(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	840(%rdx), %r9b
	movb	840(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	841(%rdx), %r9b
	movb	841(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	842(%rdx), %r9b
	movb	842(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	843(%rdx), %r9b
	movb	843(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	844(%rdx), %r9b
	movb	844(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	845(%rdx), %r9b
	movb	845(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	846(%rdx), %r9b
	movb	846(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	847(%rdx), %r9b
	movb	847(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	848(%rdx), %r9b
	movb	848(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	849(%rdx), %r9b
	movb	849(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	850(%rdx), %r9b
	movb	850(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	851(%rdx), %r9b
	movb	851(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	852(%rdx), %r9b
	movb	852(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	853(%rdx), %r9b
	movb	853(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	854(%rdx), %r9b
	movb	854(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	855(%rdx), %r9b
	movb	855(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	856(%rdx), %r9b
	movb	856(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	857(%rdx), %r9b
	movb	857(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	858(%rdx), %r9b
	movb	858(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	859(%rdx), %r9b
	movb	859(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	860(%rdx), %r9b
	movb	860(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	861(%rdx), %r9b
	movb	861(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	862(%rdx), %r9b
	movb	862(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	863(%rdx), %r9b
	movb	863(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	864(%rdx), %r9b
	movb	864(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	865(%rdx), %r9b
	movb	865(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	866(%rdx), %r9b
	movb	866(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	867(%rdx), %r9b
	movb	867(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	868(%rdx), %r9b
	movb	868(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	869(%rdx), %r9b
	movb	869(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	870(%rdx), %r9b
	movb	870(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	871(%rdx), %r9b
	movb	871(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	872(%rdx), %r9b
	movb	872(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	873(%rdx), %r9b
	movb	873(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	874(%rdx), %r9b
	movb	874(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	875(%rdx), %r9b
	movb	875(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	876(%rdx), %r9b
	movb	876(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	877(%rdx), %r9b
	movb	877(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	878(%rdx), %r9b
	movb	878(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	879(%rdx), %r9b
	movb	879(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	880(%rdx), %r9b
	movb	880(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	881(%rdx), %r9b
	movb	881(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	882(%rdx), %r9b
	movb	882(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	883(%rdx), %r9b
	movb	883(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	884(%rdx), %r9b
	movb	884(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	885(%rdx), %r9b
	movb	885(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	886(%rdx), %r9b
	movb	886(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	887(%rdx), %r9b
	movb	887(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	888(%rdx), %r9b
	movb	888(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	889(%rdx), %r9b
	movb	889(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	890(%rdx), %r9b
	movb	890(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	891(%rdx), %r9b
	movb	891(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	892(%rdx), %r9b
	movb	892(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	893(%rdx), %r9b
	movb	893(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	894(%rdx), %r9b
	movb	894(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	895(%rdx), %r9b
	movb	895(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	896(%rdx), %r9b
	movb	896(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	897(%rdx), %r9b
	movb	897(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	898(%rdx), %r9b
	movb	898(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	899(%rdx), %r9b
	movb	899(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	900(%rdx), %r9b
	movb	900(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	901(%rdx), %r9b
	movb	901(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	902(%rdx), %r9b
	movb	902(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	903(%rdx), %r9b
	movb	903(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	904(%rdx), %r9b
	movb	904(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	905(%rdx), %r9b
	movb	905(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	906(%rdx), %r9b
	movb	906(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	907(%rdx), %r9b
	movb	907(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	908(%rdx), %r9b
	movb	908(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	909(%rdx), %r9b
	movb	909(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	910(%rdx), %r9b
	movb	910(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	911(%rdx), %r9b
	movb	911(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	912(%rdx), %r9b
	movb	912(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	913(%rdx), %r9b
	movb	913(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	914(%rdx), %r9b
	movb	914(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	915(%rdx), %r9b
	movb	915(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	916(%rdx), %r9b
	movb	916(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	917(%rdx), %r9b
	movb	917(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	918(%rdx), %r9b
	movb	918(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	919(%rdx), %r9b
	movb	919(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	920(%rdx), %r9b
	movb	920(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	921(%rdx), %r9b
	movb	921(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	922(%rdx), %r9b
	movb	922(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	923(%rdx), %r9b
	movb	923(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	924(%rdx), %r9b
	movb	924(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	925(%rdx), %r9b
	movb	925(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	926(%rdx), %r9b
	movb	926(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	927(%rdx), %r9b
	movb	927(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	928(%rdx), %r9b
	movb	928(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	929(%rdx), %r9b
	movb	929(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	930(%rdx), %r9b
	movb	930(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	931(%rdx), %r9b
	movb	931(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	932(%rdx), %r9b
	movb	932(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	933(%rdx), %r9b
	movb	933(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	934(%rdx), %r9b
	movb	934(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	935(%rdx), %r9b
	movb	935(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	936(%rdx), %r9b
	movb	936(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	937(%rdx), %r9b
	movb	937(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	938(%rdx), %r9b
	movb	938(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	939(%rdx), %r9b
	movb	939(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	940(%rdx), %r9b
	movb	940(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	941(%rdx), %r9b
	movb	941(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	942(%rdx), %r9b
	movb	942(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	943(%rdx), %r9b
	movb	943(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	944(%rdx), %r9b
	movb	944(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	945(%rdx), %r9b
	movb	945(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	946(%rdx), %r9b
	movb	946(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	947(%rdx), %r9b
	movb	947(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	948(%rdx), %r9b
	movb	948(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	949(%rdx), %r9b
	movb	949(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	950(%rdx), %r9b
	movb	950(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	951(%rdx), %r9b
	movb	951(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	952(%rdx), %r9b
	movb	952(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	953(%rdx), %r9b
	movb	953(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	954(%rdx), %r9b
	movb	954(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	955(%rdx), %r9b
	movb	955(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	956(%rdx), %r9b
	movb	956(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	957(%rdx), %r9b
	movb	957(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	958(%rdx), %r9b
	movb	958(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	959(%rdx), %r9b
	movb	959(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	960(%rdx), %r9b
	movb	960(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	961(%rdx), %r9b
	movb	961(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	962(%rdx), %r9b
	movb	962(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	963(%rdx), %r9b
	movb	963(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	964(%rdx), %r9b
	movb	964(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	965(%rdx), %r9b
	movb	965(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	966(%rdx), %r9b
	movb	966(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	967(%rdx), %r9b
	movb	967(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	968(%rdx), %r9b
	movb	968(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	969(%rdx), %r9b
	movb	969(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	970(%rdx), %r9b
	movb	970(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	971(%rdx), %r9b
	movb	971(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	972(%rdx), %r9b
	movb	972(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	973(%rdx), %r9b
	movb	973(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	974(%rdx), %r9b
	movb	974(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	975(%rdx), %r9b
	movb	975(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	976(%rdx), %r9b
	movb	976(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	977(%rdx), %r9b
	movb	977(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	978(%rdx), %r9b
	movb	978(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	979(%rdx), %r9b
	movb	979(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	980(%rdx), %r9b
	movb	980(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	981(%rdx), %r9b
	movb	981(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	982(%rdx), %r9b
	movb	982(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	983(%rdx), %r9b
	movb	983(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	984(%rdx), %r9b
	movb	984(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	985(%rdx), %r9b
	movb	985(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	986(%rdx), %r9b
	movb	986(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	987(%rdx), %r9b
	movb	987(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	988(%rdx), %r9b
	movb	988(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	989(%rdx), %r9b
	movb	989(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	990(%rdx), %r9b
	movb	990(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	991(%rdx), %r9b
	movb	991(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	992(%rdx), %r9b
	movb	992(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	993(%rdx), %r9b
	movb	993(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	994(%rdx), %r9b
	movb	994(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	995(%rdx), %r9b
	movb	995(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	996(%rdx), %r9b
	movb	996(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	997(%rdx), %r9b
	movb	997(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	998(%rdx), %r9b
	movb	998(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	999(%rdx), %r9b
	movb	999(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1000(%rdx), %r9b
	movb	1000(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1001(%rdx), %r9b
	movb	1001(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1002(%rdx), %r9b
	movb	1002(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1003(%rdx), %r9b
	movb	1003(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1004(%rdx), %r9b
	movb	1004(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1005(%rdx), %r9b
	movb	1005(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1006(%rdx), %r9b
	movb	1006(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1007(%rdx), %r9b
	movb	1007(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1008(%rdx), %r9b
	movb	1008(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1009(%rdx), %r9b
	movb	1009(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1010(%rdx), %r9b
	movb	1010(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1011(%rdx), %r9b
	movb	1011(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1012(%rdx), %r9b
	movb	1012(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1013(%rdx), %r9b
	movb	1013(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1014(%rdx), %r9b
	movb	1014(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1015(%rdx), %r9b
	movb	1015(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1016(%rdx), %r9b
	movb	1016(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1017(%rdx), %r9b
	movb	1017(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1018(%rdx), %r9b
	movb	1018(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1019(%rdx), %r9b
	movb	1019(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1020(%rdx), %r9b
	movb	1020(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1021(%rdx), %r9b
	movb	1021(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1022(%rdx), %r9b
	movb	1022(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1023(%rdx), %r9b
	movb	1023(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1024(%rdx), %r9b
	movb	1024(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1025(%rdx), %r9b
	movb	1025(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1026(%rdx), %r9b
	movb	1026(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1027(%rdx), %r9b
	movb	1027(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1028(%rdx), %r9b
	movb	1028(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1029(%rdx), %r9b
	movb	1029(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1030(%rdx), %r9b
	movb	1030(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1031(%rdx), %r9b
	movb	1031(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1032(%rdx), %r9b
	movb	1032(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1033(%rdx), %r9b
	movb	1033(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1034(%rdx), %r9b
	movb	1034(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1035(%rdx), %r9b
	movb	1035(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1036(%rdx), %r9b
	movb	1036(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1037(%rdx), %r9b
	movb	1037(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1038(%rdx), %r9b
	movb	1038(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1039(%rdx), %r9b
	movb	1039(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1040(%rdx), %r9b
	movb	1040(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1041(%rdx), %r9b
	movb	1041(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1042(%rdx), %r9b
	movb	1042(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1043(%rdx), %r9b
	movb	1043(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1044(%rdx), %r9b
	movb	1044(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1045(%rdx), %r9b
	movb	1045(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1046(%rdx), %r9b
	movb	1046(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1047(%rdx), %r9b
	movb	1047(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1048(%rdx), %r9b
	movb	1048(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1049(%rdx), %r9b
	movb	1049(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1050(%rdx), %r9b
	movb	1050(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1051(%rdx), %r9b
	movb	1051(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1052(%rdx), %r9b
	movb	1052(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1053(%rdx), %r9b
	movb	1053(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1054(%rdx), %r9b
	movb	1054(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1055(%rdx), %r9b
	movb	1055(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1056(%rdx), %r9b
	movb	1056(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1057(%rdx), %r9b
	movb	1057(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1058(%rdx), %r9b
	movb	1058(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1059(%rdx), %r9b
	movb	1059(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1060(%rdx), %r9b
	movb	1060(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1061(%rdx), %r9b
	movb	1061(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1062(%rdx), %r9b
	movb	1062(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1063(%rdx), %r9b
	movb	1063(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1064(%rdx), %r9b
	movb	1064(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1065(%rdx), %r9b
	movb	1065(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1066(%rdx), %r9b
	movb	1066(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1067(%rdx), %r9b
	movb	1067(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1068(%rdx), %r9b
	movb	1068(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1069(%rdx), %r9b
	movb	1069(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1070(%rdx), %r9b
	movb	1070(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1071(%rdx), %r9b
	movb	1071(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1072(%rdx), %r9b
	movb	1072(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1073(%rdx), %r9b
	movb	1073(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1074(%rdx), %r9b
	movb	1074(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1075(%rdx), %r9b
	movb	1075(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1076(%rdx), %r9b
	movb	1076(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1077(%rdx), %r9b
	movb	1077(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1078(%rdx), %r9b
	movb	1078(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1079(%rdx), %r9b
	movb	1079(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1080(%rdx), %r9b
	movb	1080(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1081(%rdx), %r9b
	movb	1081(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1082(%rdx), %r9b
	movb	1082(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1083(%rdx), %r9b
	movb	1083(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1084(%rdx), %r9b
	movb	1084(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1085(%rdx), %r9b
	movb	1085(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1086(%rdx), %r9b
	movb	1086(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1087(%rdx), %r9b
	movb	1087(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1088(%rdx), %r9b
	movb	1088(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1089(%rdx), %r9b
	movb	1089(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1090(%rdx), %r9b
	movb	1090(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1091(%rdx), %r9b
	movb	1091(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1092(%rdx), %r9b
	movb	1092(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1093(%rdx), %r9b
	movb	1093(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1094(%rdx), %r9b
	movb	1094(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1095(%rdx), %r9b
	movb	1095(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1096(%rdx), %r9b
	movb	1096(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1097(%rdx), %r9b
	movb	1097(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1098(%rdx), %r9b
	movb	1098(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1099(%rdx), %r9b
	movb	1099(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1100(%rdx), %r9b
	movb	1100(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1101(%rdx), %r9b
	movb	1101(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1102(%rdx), %r9b
	movb	1102(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1103(%rdx), %r9b
	movb	1103(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1104(%rdx), %r9b
	movb	1104(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1105(%rdx), %r9b
	movb	1105(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1106(%rdx), %r9b
	movb	1106(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1107(%rdx), %r9b
	movb	1107(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1108(%rdx), %r9b
	movb	1108(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1109(%rdx), %r9b
	movb	1109(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1110(%rdx), %r9b
	movb	1110(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1111(%rdx), %r9b
	movb	1111(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1112(%rdx), %r9b
	movb	1112(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1113(%rdx), %r9b
	movb	1113(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1114(%rdx), %r9b
	movb	1114(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1115(%rdx), %r9b
	movb	1115(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1116(%rdx), %r9b
	movb	1116(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1117(%rdx), %r9b
	movb	1117(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1118(%rdx), %r9b
	movb	1118(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1119(%rdx), %r9b
	movb	1119(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1120(%rdx), %r9b
	movb	1120(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1121(%rdx), %r9b
	movb	1121(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1122(%rdx), %r9b
	movb	1122(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1123(%rdx), %r9b
	movb	1123(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1124(%rdx), %r9b
	movb	1124(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1125(%rdx), %r9b
	movb	1125(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1126(%rdx), %r9b
	movb	1126(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1127(%rdx), %r9b
	movb	1127(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1128(%rdx), %r9b
	movb	1128(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1129(%rdx), %r9b
	movb	1129(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1130(%rdx), %r9b
	movb	1130(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1131(%rdx), %r9b
	movb	1131(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1132(%rdx), %r9b
	movb	1132(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1133(%rdx), %r9b
	movb	1133(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1134(%rdx), %r9b
	movb	1134(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1135(%rdx), %r9b
	movb	1135(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1136(%rdx), %r9b
	movb	1136(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1137(%rdx), %r9b
	movb	1137(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1138(%rdx), %r9b
	movb	1138(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1139(%rdx), %r9b
	movb	1139(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1140(%rdx), %r9b
	movb	1140(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1141(%rdx), %r9b
	movb	1141(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1142(%rdx), %r9b
	movb	1142(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1143(%rdx), %r9b
	movb	1143(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1144(%rdx), %r9b
	movb	1144(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1145(%rdx), %r9b
	movb	1145(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1146(%rdx), %r9b
	movb	1146(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1147(%rdx), %r9b
	movb	1147(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1148(%rdx), %r9b
	movb	1148(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1149(%rdx), %r9b
	movb	1149(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1150(%rdx), %r9b
	movb	1150(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1151(%rdx), %r9b
	movb	1151(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1152(%rdx), %r9b
	movb	1152(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1153(%rdx), %r9b
	movb	1153(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1154(%rdx), %r9b
	movb	1154(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1155(%rdx), %r9b
	movb	1155(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1156(%rdx), %r9b
	movb	1156(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1157(%rdx), %r9b
	movb	1157(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1158(%rdx), %r9b
	movb	1158(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1159(%rdx), %r9b
	movb	1159(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1160(%rdx), %r9b
	movb	1160(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1161(%rdx), %r9b
	movb	1161(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1162(%rdx), %r9b
	movb	1162(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1163(%rdx), %r9b
	movb	1163(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1164(%rdx), %r9b
	movb	1164(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1165(%rdx), %r9b
	movb	1165(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1166(%rdx), %r9b
	movb	1166(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1167(%rdx), %r9b
	movb	1167(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1168(%rdx), %r9b
	movb	1168(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1169(%rdx), %r9b
	movb	1169(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1170(%rdx), %r9b
	movb	1170(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1171(%rdx), %r9b
	movb	1171(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1172(%rdx), %r9b
	movb	1172(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1173(%rdx), %r9b
	movb	1173(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1174(%rdx), %r9b
	movb	1174(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1175(%rdx), %r9b
	movb	1175(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1176(%rdx), %r9b
	movb	1176(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1177(%rdx), %r9b
	movb	1177(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1178(%rdx), %r9b
	movb	1178(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1179(%rdx), %r9b
	movb	1179(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1180(%rdx), %r9b
	movb	1180(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1181(%rdx), %r9b
	movb	1181(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1182(%rdx), %r9b
	movb	1182(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1183(%rdx), %r9b
	movb	1183(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1184(%rdx), %r9b
	movb	1184(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1185(%rdx), %r9b
	movb	1185(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1186(%rdx), %r9b
	movb	1186(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1187(%rdx), %r9b
	movb	1187(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1188(%rdx), %r9b
	movb	1188(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1189(%rdx), %r9b
	movb	1189(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1190(%rdx), %r9b
	movb	1190(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1191(%rdx), %r9b
	movb	1191(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1192(%rdx), %r9b
	movb	1192(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1193(%rdx), %r9b
	movb	1193(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1194(%rdx), %r9b
	movb	1194(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1195(%rdx), %r9b
	movb	1195(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1196(%rdx), %r9b
	movb	1196(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1197(%rdx), %r9b
	movb	1197(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1198(%rdx), %r9b
	movb	1198(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1199(%rdx), %r9b
	movb	1199(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1200(%rdx), %r9b
	movb	1200(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1201(%rdx), %r9b
	movb	1201(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1202(%rdx), %r9b
	movb	1202(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1203(%rdx), %r9b
	movb	1203(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1204(%rdx), %r9b
	movb	1204(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1205(%rdx), %r9b
	movb	1205(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1206(%rdx), %r9b
	movb	1206(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1207(%rdx), %r9b
	movb	1207(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1208(%rdx), %r9b
	movb	1208(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1209(%rdx), %r9b
	movb	1209(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1210(%rdx), %r9b
	movb	1210(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1211(%rdx), %r9b
	movb	1211(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1212(%rdx), %r9b
	movb	1212(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1213(%rdx), %r9b
	movb	1213(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1214(%rdx), %r9b
	movb	1214(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1215(%rdx), %r9b
	movb	1215(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1216(%rdx), %r9b
	movb	1216(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1217(%rdx), %r9b
	movb	1217(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1218(%rdx), %r9b
	movb	1218(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1219(%rdx), %r9b
	movb	1219(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1220(%rdx), %r9b
	movb	1220(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1221(%rdx), %r9b
	movb	1221(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1222(%rdx), %r9b
	movb	1222(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1223(%rdx), %r9b
	movb	1223(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1224(%rdx), %r9b
	movb	1224(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1225(%rdx), %r9b
	movb	1225(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1226(%rdx), %r9b
	movb	1226(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1227(%rdx), %r9b
	movb	1227(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1228(%rdx), %r9b
	movb	1228(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1229(%rdx), %r9b
	movb	1229(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1230(%rdx), %r9b
	movb	1230(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1231(%rdx), %r9b
	movb	1231(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1232(%rdx), %r9b
	movb	1232(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1233(%rdx), %r9b
	movb	1233(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1234(%rdx), %r9b
	movb	1234(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1235(%rdx), %r9b
	movb	1235(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1236(%rdx), %r9b
	movb	1236(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1237(%rdx), %r9b
	movb	1237(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1238(%rdx), %r9b
	movb	1238(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1239(%rdx), %r9b
	movb	1239(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1240(%rdx), %r9b
	movb	1240(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1241(%rdx), %r9b
	movb	1241(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1242(%rdx), %r9b
	movb	1242(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1243(%rdx), %r9b
	movb	1243(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1244(%rdx), %r9b
	movb	1244(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1245(%rdx), %r9b
	movb	1245(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1246(%rdx), %r9b
	movb	1246(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1247(%rdx), %r9b
	movb	1247(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1248(%rdx), %r9b
	movb	1248(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1249(%rdx), %r9b
	movb	1249(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1250(%rdx), %r9b
	movb	1250(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1251(%rdx), %r9b
	movb	1251(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1252(%rdx), %r9b
	movb	1252(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1253(%rdx), %r9b
	movb	1253(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1254(%rdx), %r9b
	movb	1254(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1255(%rdx), %r9b
	movb	1255(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1256(%rdx), %r9b
	movb	1256(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1257(%rdx), %r9b
	movb	1257(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1258(%rdx), %r9b
	movb	1258(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1259(%rdx), %r9b
	movb	1259(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1260(%rdx), %r9b
	movb	1260(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1261(%rdx), %r9b
	movb	1261(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1262(%rdx), %r9b
	movb	1262(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1263(%rdx), %r9b
	movb	1263(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1264(%rdx), %r9b
	movb	1264(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1265(%rdx), %r9b
	movb	1265(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1266(%rdx), %r9b
	movb	1266(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1267(%rdx), %r9b
	movb	1267(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1268(%rdx), %r9b
	movb	1268(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1269(%rdx), %r9b
	movb	1269(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1270(%rdx), %r9b
	movb	1270(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1271(%rdx), %r9b
	movb	1271(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1272(%rdx), %r9b
	movb	1272(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1273(%rdx), %r9b
	movb	1273(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1274(%rdx), %r9b
	movb	1274(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1275(%rdx), %r9b
	movb	1275(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1276(%rdx), %r9b
	movb	1276(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1277(%rdx), %r9b
	movb	1277(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1278(%rdx), %r9b
	movb	1278(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1279(%rdx), %r9b
	movb	1279(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1280(%rdx), %r9b
	movb	1280(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1281(%rdx), %r9b
	movb	1281(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1282(%rdx), %r9b
	movb	1282(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1283(%rdx), %r9b
	movb	1283(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1284(%rdx), %r9b
	movb	1284(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1285(%rdx), %r9b
	movb	1285(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1286(%rdx), %r9b
	movb	1286(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1287(%rdx), %r9b
	movb	1287(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1288(%rdx), %r9b
	movb	1288(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1289(%rdx), %r9b
	movb	1289(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1290(%rdx), %r9b
	movb	1290(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1291(%rdx), %r9b
	movb	1291(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1292(%rdx), %r9b
	movb	1292(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1293(%rdx), %r9b
	movb	1293(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1294(%rdx), %r9b
	movb	1294(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1295(%rdx), %r9b
	movb	1295(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1296(%rdx), %r9b
	movb	1296(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1297(%rdx), %r9b
	movb	1297(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1298(%rdx), %r9b
	movb	1298(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1299(%rdx), %r9b
	movb	1299(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1300(%rdx), %r9b
	movb	1300(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1301(%rdx), %r9b
	movb	1301(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1302(%rdx), %r9b
	movb	1302(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1303(%rdx), %r9b
	movb	1303(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1304(%rdx), %r9b
	movb	1304(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1305(%rdx), %r9b
	movb	1305(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1306(%rdx), %r9b
	movb	1306(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1307(%rdx), %r9b
	movb	1307(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1308(%rdx), %r9b
	movb	1308(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1309(%rdx), %r9b
	movb	1309(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1310(%rdx), %r9b
	movb	1310(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1311(%rdx), %r9b
	movb	1311(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1312(%rdx), %r9b
	movb	1312(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1313(%rdx), %r9b
	movb	1313(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1314(%rdx), %r9b
	movb	1314(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1315(%rdx), %r9b
	movb	1315(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1316(%rdx), %r9b
	movb	1316(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1317(%rdx), %r9b
	movb	1317(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1318(%rdx), %r9b
	movb	1318(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1319(%rdx), %r9b
	movb	1319(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1320(%rdx), %r9b
	movb	1320(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1321(%rdx), %r9b
	movb	1321(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1322(%rdx), %r9b
	movb	1322(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1323(%rdx), %r9b
	movb	1323(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1324(%rdx), %r9b
	movb	1324(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1325(%rdx), %r9b
	movb	1325(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1326(%rdx), %r9b
	movb	1326(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1327(%rdx), %r9b
	movb	1327(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1328(%rdx), %r9b
	movb	1328(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1329(%rdx), %r9b
	movb	1329(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1330(%rdx), %r9b
	movb	1330(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1331(%rdx), %r9b
	movb	1331(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1332(%rdx), %r9b
	movb	1332(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1333(%rdx), %r9b
	movb	1333(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1334(%rdx), %r9b
	movb	1334(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1335(%rdx), %r9b
	movb	1335(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1336(%rdx), %r9b
	movb	1336(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1337(%rdx), %r9b
	movb	1337(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1338(%rdx), %r9b
	movb	1338(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1339(%rdx), %r9b
	movb	1339(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1340(%rdx), %r9b
	movb	1340(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1341(%rdx), %r9b
	movb	1341(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1342(%rdx), %r9b
	movb	1342(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1343(%rdx), %r9b
	movb	1343(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1344(%rdx), %r9b
	movb	1344(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1345(%rdx), %r9b
	movb	1345(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1346(%rdx), %r9b
	movb	1346(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1347(%rdx), %r9b
	movb	1347(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1348(%rdx), %r9b
	movb	1348(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1349(%rdx), %r9b
	movb	1349(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1350(%rdx), %r9b
	movb	1350(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1351(%rdx), %r9b
	movb	1351(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1352(%rdx), %r9b
	movb	1352(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1353(%rdx), %r9b
	movb	1353(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1354(%rdx), %r9b
	movb	1354(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1355(%rdx), %r9b
	movb	1355(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1356(%rdx), %r9b
	movb	1356(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1357(%rdx), %r9b
	movb	1357(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1358(%rdx), %r9b
	movb	1358(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1359(%rdx), %r9b
	movb	1359(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1360(%rdx), %r9b
	movb	1360(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1361(%rdx), %r9b
	movb	1361(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1362(%rdx), %r9b
	movb	1362(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1363(%rdx), %r9b
	movb	1363(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1364(%rdx), %r9b
	movb	1364(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1365(%rdx), %r9b
	movb	1365(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1366(%rdx), %r9b
	movb	1366(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1367(%rdx), %r9b
	movb	1367(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1368(%rdx), %r9b
	movb	1368(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1369(%rdx), %r9b
	movb	1369(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1370(%rdx), %r9b
	movb	1370(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1371(%rdx), %r9b
	movb	1371(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1372(%rdx), %r9b
	movb	1372(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1373(%rdx), %r9b
	movb	1373(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1374(%rdx), %r9b
	movb	1374(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1375(%rdx), %r9b
	movb	1375(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1376(%rdx), %r9b
	movb	1376(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1377(%rdx), %r9b
	movb	1377(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1378(%rdx), %r9b
	movb	1378(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1379(%rdx), %r9b
	movb	1379(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1380(%rdx), %r9b
	movb	1380(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1381(%rdx), %r9b
	movb	1381(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1382(%rdx), %r9b
	movb	1382(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1383(%rdx), %r9b
	movb	1383(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1384(%rdx), %r9b
	movb	1384(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1385(%rdx), %r9b
	movb	1385(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1386(%rdx), %r9b
	movb	1386(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1387(%rdx), %r9b
	movb	1387(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1388(%rdx), %r9b
	movb	1388(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1389(%rdx), %r9b
	movb	1389(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1390(%rdx), %r9b
	movb	1390(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1391(%rdx), %r9b
	movb	1391(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1392(%rdx), %r9b
	movb	1392(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1393(%rdx), %r9b
	movb	1393(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1394(%rdx), %r9b
	movb	1394(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1395(%rdx), %r9b
	movb	1395(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1396(%rdx), %r9b
	movb	1396(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1397(%rdx), %r9b
	movb	1397(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1398(%rdx), %r9b
	movb	1398(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1399(%rdx), %r9b
	movb	1399(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1400(%rdx), %r9b
	movb	1400(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1401(%rdx), %r9b
	movb	1401(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1402(%rdx), %r9b
	movb	1402(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1403(%rdx), %r9b
	movb	1403(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1404(%rdx), %r9b
	movb	1404(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1405(%rdx), %r9b
	movb	1405(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1406(%rdx), %r9b
	movb	1406(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1407(%rdx), %r9b
	movb	1407(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1408(%rdx), %r9b
	movb	1408(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1409(%rdx), %r9b
	movb	1409(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1410(%rdx), %r9b
	movb	1410(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1411(%rdx), %r9b
	movb	1411(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1412(%rdx), %r9b
	movb	1412(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1413(%rdx), %r9b
	movb	1413(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1414(%rdx), %r9b
	movb	1414(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1415(%rdx), %r9b
	movb	1415(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1416(%rdx), %r9b
	movb	1416(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1417(%rdx), %r9b
	movb	1417(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1418(%rdx), %r9b
	movb	1418(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1419(%rdx), %r9b
	movb	1419(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1420(%rdx), %r9b
	movb	1420(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1421(%rdx), %r9b
	movb	1421(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1422(%rdx), %r9b
	movb	1422(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1423(%rdx), %r9b
	movb	1423(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1424(%rdx), %r9b
	movb	1424(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1425(%rdx), %r9b
	movb	1425(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1426(%rdx), %r9b
	movb	1426(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1427(%rdx), %r9b
	movb	1427(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1428(%rdx), %r9b
	movb	1428(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1429(%rdx), %r9b
	movb	1429(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1430(%rdx), %r9b
	movb	1430(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1431(%rdx), %r9b
	movb	1431(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1432(%rdx), %r9b
	movb	1432(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1433(%rdx), %r9b
	movb	1433(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1434(%rdx), %r9b
	movb	1434(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1435(%rdx), %r9b
	movb	1435(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1436(%rdx), %r9b
	movb	1436(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1437(%rdx), %r9b
	movb	1437(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1438(%rdx), %r9b
	movb	1438(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1439(%rdx), %r9b
	movb	1439(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1440(%rdx), %r9b
	movb	1440(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1441(%rdx), %r9b
	movb	1441(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1442(%rdx), %r9b
	movb	1442(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1443(%rdx), %r9b
	movb	1443(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1444(%rdx), %r9b
	movb	1444(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1445(%rdx), %r9b
	movb	1445(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1446(%rdx), %r9b
	movb	1446(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1447(%rdx), %r9b
	movb	1447(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1448(%rdx), %r9b
	movb	1448(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1449(%rdx), %r9b
	movb	1449(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1450(%rdx), %r9b
	movb	1450(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1451(%rdx), %r9b
	movb	1451(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1452(%rdx), %r9b
	movb	1452(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1453(%rdx), %r9b
	movb	1453(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1454(%rdx), %r9b
	movb	1454(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1455(%rdx), %r9b
	movb	1455(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1456(%rdx), %r9b
	movb	1456(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1457(%rdx), %r9b
	movb	1457(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1458(%rdx), %r9b
	movb	1458(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1459(%rdx), %r9b
	movb	1459(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1460(%rdx), %r9b
	movb	1460(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1461(%rdx), %r9b
	movb	1461(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1462(%rdx), %r9b
	movb	1462(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1463(%rdx), %r9b
	movb	1463(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1464(%rdx), %r9b
	movb	1464(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1465(%rdx), %r9b
	movb	1465(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1466(%rdx), %r9b
	movb	1466(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1467(%rdx), %r9b
	movb	1467(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1468(%rdx), %r9b
	movb	1468(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1469(%rdx), %r9b
	movb	1469(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1470(%rdx), %r9b
	movb	1470(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1471(%rdx), %r9b
	movb	1471(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1472(%rdx), %r9b
	movb	1472(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1473(%rdx), %r9b
	movb	1473(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1474(%rdx), %r9b
	movb	1474(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1475(%rdx), %r9b
	movb	1475(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1476(%rdx), %r9b
	movb	1476(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1477(%rdx), %r9b
	movb	1477(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1478(%rdx), %r9b
	movb	1478(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1479(%rdx), %r9b
	movb	1479(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1480(%rdx), %r9b
	movb	1480(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1481(%rdx), %r9b
	movb	1481(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1482(%rdx), %r9b
	movb	1482(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1483(%rdx), %r9b
	movb	1483(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1484(%rdx), %r9b
	movb	1484(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1485(%rdx), %r9b
	movb	1485(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1486(%rdx), %r9b
	movb	1486(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1487(%rdx), %r9b
	movb	1487(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1488(%rdx), %r9b
	movb	1488(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1489(%rdx), %r9b
	movb	1489(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1490(%rdx), %r9b
	movb	1490(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1491(%rdx), %r9b
	movb	1491(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1492(%rdx), %r9b
	movb	1492(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1493(%rdx), %r9b
	movb	1493(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1494(%rdx), %r9b
	movb	1494(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1495(%rdx), %r9b
	movb	1495(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1496(%rdx), %r9b
	movb	1496(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1497(%rdx), %r9b
	movb	1497(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1498(%rdx), %r9b
	movb	1498(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1499(%rdx), %r9b
	movb	1499(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1500(%rdx), %r9b
	movb	1500(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1501(%rdx), %r9b
	movb	1501(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1502(%rdx), %r9b
	movb	1502(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1503(%rdx), %r9b
	movb	1503(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1504(%rdx), %r9b
	movb	1504(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1505(%rdx), %r9b
	movb	1505(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1506(%rdx), %r9b
	movb	1506(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1507(%rdx), %r9b
	movb	1507(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1508(%rdx), %r9b
	movb	1508(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1509(%rdx), %r9b
	movb	1509(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1510(%rdx), %r9b
	movb	1510(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1511(%rdx), %r9b
	movb	1511(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1512(%rdx), %r9b
	movb	1512(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1513(%rdx), %r9b
	movb	1513(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1514(%rdx), %r9b
	movb	1514(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1515(%rdx), %r9b
	movb	1515(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1516(%rdx), %r9b
	movb	1516(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1517(%rdx), %r9b
	movb	1517(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1518(%rdx), %r9b
	movb	1518(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1519(%rdx), %r9b
	movb	1519(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1520(%rdx), %r9b
	movb	1520(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1521(%rdx), %r9b
	movb	1521(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1522(%rdx), %r9b
	movb	1522(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1523(%rdx), %r9b
	movb	1523(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1524(%rdx), %r9b
	movb	1524(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1525(%rdx), %r9b
	movb	1525(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1526(%rdx), %r9b
	movb	1526(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1527(%rdx), %r9b
	movb	1527(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1528(%rdx), %r9b
	movb	1528(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1529(%rdx), %r9b
	movb	1529(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1530(%rdx), %r9b
	movb	1530(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1531(%rdx), %r9b
	movb	1531(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1532(%rdx), %r9b
	movb	1532(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1533(%rdx), %r9b
	movb	1533(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1534(%rdx), %r9b
	movb	1534(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1535(%rdx), %r9b
	movb	1535(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1536(%rdx), %r9b
	movb	1536(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1537(%rdx), %r9b
	movb	1537(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1538(%rdx), %r9b
	movb	1538(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1539(%rdx), %r9b
	movb	1539(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1540(%rdx), %r9b
	movb	1540(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1541(%rdx), %r9b
	movb	1541(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1542(%rdx), %r9b
	movb	1542(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1543(%rdx), %r9b
	movb	1543(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1544(%rdx), %r9b
	movb	1544(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1545(%rdx), %r9b
	movb	1545(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1546(%rdx), %r9b
	movb	1546(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1547(%rdx), %r9b
	movb	1547(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1548(%rdx), %r9b
	movb	1548(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1549(%rdx), %r9b
	movb	1549(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1550(%rdx), %r9b
	movb	1550(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1551(%rdx), %r9b
	movb	1551(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1552(%rdx), %r9b
	movb	1552(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1553(%rdx), %r9b
	movb	1553(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1554(%rdx), %r9b
	movb	1554(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1555(%rdx), %r9b
	movb	1555(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1556(%rdx), %r9b
	movb	1556(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1557(%rdx), %r9b
	movb	1557(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1558(%rdx), %r9b
	movb	1558(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1559(%rdx), %r9b
	movb	1559(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1560(%rdx), %r9b
	movb	1560(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1561(%rdx), %r9b
	movb	1561(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1562(%rdx), %r9b
	movb	1562(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1563(%rdx), %r9b
	movb	1563(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1564(%rdx), %r9b
	movb	1564(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1565(%rdx), %r9b
	movb	1565(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1566(%rdx), %r9b
	movb	1566(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	movb	1567(%rdx), %r9b
	movb	1567(%rax), %bl
	xorb	%bl, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rcx
	negq	%rcx
	shrq	$63, %rcx
	movq	%mm0, %rsi
	movq	%mm2, %rbp
	leaq	3136(%rbp), %rdi
	leaq	-224(%rsp), %rsp
	call	L_shake256_A32__A1600$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$1:
	leaq	224(%rsp), %rsp
	leaq	136(%rsp), %rax
	negq	%rcx
	movb	(%rsi), %bl
	movb	(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, (%rsi)
	movb	1(%rsi), %bl
	movb	1(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 1(%rsi)
	movb	2(%rsi), %bl
	movb	2(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 2(%rsi)
	movb	3(%rsi), %bl
	movb	3(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 3(%rsi)
	movb	4(%rsi), %bl
	movb	4(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 4(%rsi)
	movb	5(%rsi), %bl
	movb	5(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 5(%rsi)
	movb	6(%rsi), %bl
	movb	6(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 6(%rsi)
	movb	7(%rsi), %bl
	movb	7(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 7(%rsi)
	movb	8(%rsi), %bl
	movb	8(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 8(%rsi)
	movb	9(%rsi), %bl
	movb	9(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 9(%rsi)
	movb	10(%rsi), %bl
	movb	10(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 10(%rsi)
	movb	11(%rsi), %bl
	movb	11(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 11(%rsi)
	movb	12(%rsi), %bl
	movb	12(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 12(%rsi)
	movb	13(%rsi), %bl
	movb	13(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 13(%rsi)
	movb	14(%rsi), %bl
	movb	14(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 14(%rsi)
	movb	15(%rsi), %bl
	movb	15(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 15(%rsi)
	movb	16(%rsi), %bl
	movb	16(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 16(%rsi)
	movb	17(%rsi), %bl
	movb	17(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 17(%rsi)
	movb	18(%rsi), %bl
	movb	18(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 18(%rsi)
	movb	19(%rsi), %bl
	movb	19(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 19(%rsi)
	movb	20(%rsi), %bl
	movb	20(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 20(%rsi)
	movb	21(%rsi), %bl
	movb	21(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 21(%rsi)
	movb	22(%rsi), %bl
	movb	22(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 22(%rsi)
	movb	23(%rsi), %bl
	movb	23(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 23(%rsi)
	movb	24(%rsi), %bl
	movb	24(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 24(%rsi)
	movb	25(%rsi), %bl
	movb	25(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 25(%rsi)
	movb	26(%rsi), %bl
	movb	26(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 26(%rsi)
	movb	27(%rsi), %bl
	movb	27(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 27(%rsi)
	movb	28(%rsi), %bl
	movb	28(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 28(%rsi)
	movb	29(%rsi), %bl
	movb	29(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 29(%rsi)
	movb	30(%rsi), %bl
	movb	30(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 30(%rsi)
	movb	31(%rsi), %bl
	movb	31(%rax), %r9b
	xorb	%r9b, %bl
	andb	%cl, %bl
	xorb	%bl, %r9b
	movb	%r9b, 31(%rsi)
	xorl	%eax, %eax
	movq	20568(%rsp), %rbx
	movq	20576(%rsp), %rbp
	movq	20584(%rsp), %r12
	movq	20592(%rsp), %r13
	movq	20600(%rsp), %r14
	movq	20608(%rsp), %r15
	movq	20616(%rsp), %rsp
	ret
	.type	jade_kem_mlkem_mlkem1024_amd64_ref_enc, %function
jade_kem_mlkem_mlkem1024_amd64_ref_enc:
	movq	%rsp, %rax
	leaq	-19072(%rsp), %rsp
	andq	$-16, %rsp
	movq	%rbx, 19016(%rsp)
	movq	%rbp, 19024(%rsp)
	movq	%r12, 19032(%rsp)
	movq	%r13, 19040(%rsp)
	movq	%r14, 19048(%rsp)
	movq	%r15, 19056(%rsp)
	movq	%rax, 19064(%rsp)
	movq	%rdi, %rbp
	movq	%rsi, %r12
	movq	%rdx, %rbx
	leaq	16(%rsp), %rdi
	movq	$32, %rsi
	call	__jasmin_syscall_randombytes__
	movq	%rbx, (%rsp)
	movq	%r12, 8(%rsp)
	movq	%rbp, %mm1
	movq	(%rax), %rcx
	movq	%rcx, 88(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 96(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 104(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 112(%rsp)
	leaq	120(%rsp), %rsi
	leaq	-224(%rsp), %rsp
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$381:
	leaq	224(%rsp), %rsp
	leaq	152(%rsp), %rsi
	leaq	88(%rsp), %rbx
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$380:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %r10
	movq	%mm1, %rdx
	leaq	88(%rsp), %rax
	leaq	184(%rsp), %r11
	movq	%rdx, %mm3
	movq	%r10, %rbx
	leaq	2632(%rsp), %rcx
	movq	%rbx, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$379:
	leaq	3144(%rsp), %rcx
	leaq	384(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$378:
	leaq	3656(%rsp), %rcx
	leaq	768(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$377:
	leaq	4168(%rsp), %rcx
	leaq	1152(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$376:
	movq	1536(%r10), %rcx
	movq	%rcx, 16(%rsp)
	movq	1544(%r10), %rcx
	movq	%rcx, 24(%rsp)
	movq	1552(%r10), %rcx
	movq	%rcx, 32(%rsp)
	movq	1560(%r10), %rcx
	movq	%rcx, 40(%rsp)
	leaq	584(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$375:
	movq	%r11, %mm4
	movq	$1, %rax
	movq	%rax, %mm5
	movb	16(%rsp), %sil
	movb	%sil, 48(%rsp)
	movb	17(%rsp), %sil
	movb	%sil, 49(%rsp)
	movb	18(%rsp), %sil
	movb	%sil, 50(%rsp)
	movb	19(%rsp), %sil
	movb	%sil, 51(%rsp)
	movb	20(%rsp), %sil
	movb	%sil, 52(%rsp)
	movb	21(%rsp), %sil
	movb	%sil, 53(%rsp)
	movb	22(%rsp), %sil
	movb	%sil, 54(%rsp)
	movb	23(%rsp), %sil
	movb	%sil, 55(%rsp)
	movb	24(%rsp), %sil
	movb	%sil, 56(%rsp)
	movb	25(%rsp), %sil
	movb	%sil, 57(%rsp)
	movb	26(%rsp), %sil
	movb	%sil, 58(%rsp)
	movb	27(%rsp), %sil
	movb	%sil, 59(%rsp)
	movb	28(%rsp), %sil
	movb	%sil, 60(%rsp)
	movb	29(%rsp), %sil
	movb	%sil, 61(%rsp)
	movb	30(%rsp), %sil
	movb	%sil, 62(%rsp)
	movb	31(%rsp), %sil
	movb	%sil, 63(%rsp)
	movb	32(%rsp), %sil
	movb	%sil, 64(%rsp)
	movb	33(%rsp), %sil
	movb	%sil, 65(%rsp)
	movb	34(%rsp), %sil
	movb	%sil, 66(%rsp)
	movb	35(%rsp), %sil
	movb	%sil, 67(%rsp)
	movb	36(%rsp), %sil
	movb	%sil, 68(%rsp)
	movb	37(%rsp), %sil
	movb	%sil, 69(%rsp)
	movb	38(%rsp), %sil
	movb	%sil, 70(%rsp)
	movb	39(%rsp), %sil
	movb	%sil, 71(%rsp)
	movb	40(%rsp), %sil
	movb	%sil, 72(%rsp)
	movb	41(%rsp), %sil
	movb	%sil, 73(%rsp)
	movb	42(%rsp), %sil
	movb	%sil, 74(%rsp)
	movb	43(%rsp), %sil
	movb	%sil, 75(%rsp)
	movb	44(%rsp), %sil
	movb	%sil, 76(%rsp)
	movb	45(%rsp), %sil
	movb	%sil, 77(%rsp)
	movb	46(%rsp), %sil
	movb	%sil, 78(%rsp)
	movb	47(%rsp), %sil
	movb	%sil, 79(%rsp)
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$373
	movb	$0, 80(%rsp)
	movb	$0, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$374
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$373:
	movb	$0, 80(%rsp)
	movb	$0, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$374:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$372:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$359
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$360:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$371:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$361
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$362:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$363
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$361
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$363:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$369
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$370
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$369:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$370:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$365
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$361
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$365:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$367
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$361
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$367:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$368:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$366:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$364:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$361:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$362
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$359:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$360
	movq	$0, %rcx
	leaq	10824(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$357
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$358:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$357:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$358
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$355
	movb	$0, 80(%rsp)
	movb	$1, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$356
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$355:
	movb	$1, 80(%rsp)
	movb	$0, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$356:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$354:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$341
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$342:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$353:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$343
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$344:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$345
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$343
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$345:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$351
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$351:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$352:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$347
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$343
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$347:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$349
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$343
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$349:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$350:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$348:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$346:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$343:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$344
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$341:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$342
	movq	$0, %rcx
	leaq	11336(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$339
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$340:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$339:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$340
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$337
	movb	$0, 80(%rsp)
	movb	$2, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$338
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$337:
	movb	$2, 80(%rsp)
	movb	$0, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$338:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$336:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$323
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$324:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$335:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$325
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$326:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$327
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$325
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$327:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$333
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$333:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$334:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$329
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$325
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$329:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$331
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$325
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$331:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$332:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$330:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$328:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$325:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$326
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$323:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$324
	movq	$0, %rcx
	leaq	11848(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$321
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$322:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$321:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$322
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$319
	movb	$0, 80(%rsp)
	movb	$3, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$320
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$319:
	movb	$3, 80(%rsp)
	movb	$0, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$320:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$318:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$305
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$306:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$317:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$307
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$308:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$309
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$307
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$309:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$315
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$315:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$316:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$311
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$307
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$311:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$313
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$307
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$313:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$314:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$312:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$310:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$307:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$308
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$305:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$306
	movq	$0, %rcx
	leaq	12360(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$303
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$304:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$303:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$304
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$301
	movb	$1, 80(%rsp)
	movb	$0, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$302
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$301:
	movb	$0, 80(%rsp)
	movb	$1, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$302:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$300:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$287
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$288:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$299:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$289
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$290:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$291
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$289
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$291:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$297
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$297:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$298:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$293
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$289
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$293:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$295
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$289
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$295:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$296:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$294:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$292:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$289:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$290
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$287:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$288
	movq	$0, %rcx
	leaq	12872(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$285
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$286:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$285:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$286
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$283
	movb	$1, 80(%rsp)
	movb	$1, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$284
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$283:
	movb	$1, 80(%rsp)
	movb	$1, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$284:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$282:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$269
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$270:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$281:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$271
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$272:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$273
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$271
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$273:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$279
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$279:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$280:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$275
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$271
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$275:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$277
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$271
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$277:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$278:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$276:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$274:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$271:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$272
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$269:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$270
	movq	$0, %rcx
	leaq	13384(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$267
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$268:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$267:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$268
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$265
	movb	$1, 80(%rsp)
	movb	$2, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$266
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$265:
	movb	$2, 80(%rsp)
	movb	$1, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$266:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$264:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$251
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$252:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$263:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$253
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$254:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$255
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$253
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$255:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$261
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$262
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$261:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$262:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$257
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$253
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$257:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$259
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$253
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$259:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$260:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$258:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$256:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$253:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$254
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$251:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$252
	movq	$0, %rcx
	leaq	13896(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$249
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$250:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$249:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$250
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$247
	movb	$1, 80(%rsp)
	movb	$3, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$248
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$247:
	movb	$3, 80(%rsp)
	movb	$1, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$248:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$246:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$233
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$234:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$245:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$235
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$236:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$237
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$235
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$237:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$243
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$244
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$243:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$244:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$239
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$235
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$239:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$241
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$235
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$241:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$242:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$240:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$238:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$235:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$236
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$233:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$234
	movq	$0, %rcx
	leaq	14408(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$231
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$232:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$231:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$232
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$229
	movb	$2, 80(%rsp)
	movb	$0, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$230
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$229:
	movb	$0, 80(%rsp)
	movb	$2, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$230:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$228:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$215
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$216:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$227:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$217
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$218:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$219
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$217
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$219:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$225
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$226
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$225:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$226:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$221
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$217
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$221:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$223
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$217
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$223:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$224:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$222:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$220:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$217:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$218
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$215:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$216
	movq	$0, %rcx
	leaq	14920(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$213
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$214:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$213:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$214
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$211
	movb	$2, 80(%rsp)
	movb	$1, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$212
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$211:
	movb	$1, 80(%rsp)
	movb	$2, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$212:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$210:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$197
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$198:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$209:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$199
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$200:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$201
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$199
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$201:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$207
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$208
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$207:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$208:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$203
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$199
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$203:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$205
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$199
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$205:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$206:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$204:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$202:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$199:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$200
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$197:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$198
	movq	$0, %rcx
	leaq	15432(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$195
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$196:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$195:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$196
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$193
	movb	$2, 80(%rsp)
	movb	$2, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$194
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$193:
	movb	$2, 80(%rsp)
	movb	$2, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$194:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$192:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$179
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$180:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$191:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$181
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$182:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$183
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$181
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$183:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$189
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$190
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$189:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$190:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$185
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$181
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$185:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$187
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$181
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$187:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$188:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$186:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$184:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$181:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$182
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$179:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$180
	movq	$0, %rcx
	leaq	15944(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$177
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$178:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$177:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$178
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$175
	movb	$2, 80(%rsp)
	movb	$3, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$176
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$175:
	movb	$3, 80(%rsp)
	movb	$2, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$176:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$174:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$161
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$162:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$173:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$163
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$164:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$165
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$163
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$165:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$171
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$172
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$171:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$172:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$167
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$163
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$167:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$169
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$163
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$169:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$170:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$168:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$166:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$163:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$164
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$161:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$162
	movq	$0, %rcx
	leaq	16456(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$159
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$160:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$159:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$160
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$157
	movb	$3, 80(%rsp)
	movb	$0, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$158
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$157:
	movb	$0, 80(%rsp)
	movb	$3, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$158:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$156:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$143
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$144:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$155:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$145
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$146:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$147
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$145
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$147:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$153
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$154
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$153:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$154:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$149
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$145
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$149:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$151
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$145
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$151:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$152:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$150:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$148:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$145:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$146
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$143:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$144
	movq	$0, %rcx
	leaq	16968(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$141
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$142:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$141:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$142
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$139
	movb	$3, 80(%rsp)
	movb	$1, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$140
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$139:
	movb	$1, 80(%rsp)
	movb	$3, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$140:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$138:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$125
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$126:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$137:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$127
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$128:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$129
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$127
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$129:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$135
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$136
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$135:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$136:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$131
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$127
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$131:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$133
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$127
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$133:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$134:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$132:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$130:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$127:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$128
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$125:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$126
	movq	$0, %rcx
	leaq	17480(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$123
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$124:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$123:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$124
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$121
	movb	$3, 80(%rsp)
	movb	$2, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$122
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$121:
	movb	$2, 80(%rsp)
	movb	$3, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$122:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$120:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$107
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$108:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$119:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$109
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$110:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$111
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$109
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$111:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$117
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$118
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$117:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$118:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$113
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$109
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$113:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$115
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$109
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$115:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$116:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$114:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$112:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$109:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$110
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$107:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$108
	movq	$0, %rcx
	leaq	17992(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$105
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$106:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$105:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$106
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$103
	movb	$3, 80(%rsp)
	movb	$3, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$104
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$103:
	movb	$3, 80(%rsp)
	movb	$3, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$104:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$102:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$89
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$90:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$101:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$91
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$92:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$93
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$91
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$93:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$99
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$100
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$99:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$100:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$95
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$91
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$95:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$97
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$91
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$97:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$98:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$96:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$94:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$91:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$92
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$89:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$90
	movq	$0, %rcx
	leaq	18504(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$87
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$88:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$87:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$88
	movq	%mm4, %rcx
	movb	$0, %al
	leaq	4680(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$86:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	5192(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$85:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	5704(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$84:
	leaq	176(%rsp), %rsp
	movb	$3, %al
	leaq	6216(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$83:
	leaq	176(%rsp), %rsp
	movq	%mm4, %rcx
	movb	$4, %al
	leaq	6728(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$82:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	7240(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$81:
	leaq	176(%rsp), %rsp
	movb	$6, %al
	leaq	7752(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$80:
	leaq	176(%rsp), %rsp
	movb	$7, %al
	leaq	8264(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$79:
	leaq	176(%rsp), %rsp
	movb	$8, %al
	leaq	1096(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$78:
	leaq	176(%rsp), %rsp
	leaq	4680(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$77:
	leaq	5192(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$76:
	leaq	5704(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$75:
	leaq	6216(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$74:
	leaq	8776(%rsp), %rdx
	leaq	10824(%rsp), %rax
	leaq	4680(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$73:
	leaq	16(%rsp), %rsp
	leaq	1608(%rsp), %rdx
	leaq	11336(%rsp), %rax
	leaq	5192(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$72:
	leaq	16(%rsp), %rsp
	leaq	8776(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$71:
	leaq	1608(%rsp), %rdx
	leaq	11848(%rsp), %rax
	leaq	5704(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$70:
	leaq	16(%rsp), %rsp
	leaq	8776(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$69:
	leaq	1608(%rsp), %rdx
	leaq	12360(%rsp), %rax
	leaq	6216(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$68:
	leaq	16(%rsp), %rsp
	leaq	8776(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$67:
	leaq	8776(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$65
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$66:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$65:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$66
	leaq	9288(%rsp), %rdx
	leaq	12872(%rsp), %rax
	leaq	4680(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$64:
	leaq	16(%rsp), %rsp
	leaq	1608(%rsp), %rdx
	leaq	13384(%rsp), %rax
	leaq	5192(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$63:
	leaq	16(%rsp), %rsp
	leaq	9288(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$62:
	leaq	1608(%rsp), %rdx
	leaq	13896(%rsp), %rax
	leaq	5704(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$61:
	leaq	16(%rsp), %rsp
	leaq	9288(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$60:
	leaq	1608(%rsp), %rdx
	leaq	14408(%rsp), %rax
	leaq	6216(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$59:
	leaq	16(%rsp), %rsp
	leaq	9288(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$58:
	leaq	9288(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$56
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$57:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$56:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$57
	leaq	9800(%rsp), %rdx
	leaq	14920(%rsp), %rax
	leaq	4680(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$55:
	leaq	16(%rsp), %rsp
	leaq	1608(%rsp), %rdx
	leaq	15432(%rsp), %rax
	leaq	5192(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$54:
	leaq	16(%rsp), %rsp
	leaq	9800(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$53:
	leaq	1608(%rsp), %rdx
	leaq	15944(%rsp), %rax
	leaq	5704(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$52:
	leaq	16(%rsp), %rsp
	leaq	9800(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$51:
	leaq	1608(%rsp), %rdx
	leaq	16456(%rsp), %rax
	leaq	6216(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$50:
	leaq	16(%rsp), %rsp
	leaq	9800(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$49:
	leaq	9800(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$47
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$48:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$47:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$48
	leaq	10312(%rsp), %rdx
	leaq	16968(%rsp), %rax
	leaq	4680(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$46:
	leaq	16(%rsp), %rsp
	leaq	1608(%rsp), %rdx
	leaq	17480(%rsp), %rax
	leaq	5192(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$45:
	leaq	16(%rsp), %rsp
	leaq	10312(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$44:
	leaq	1608(%rsp), %rdx
	leaq	17992(%rsp), %rax
	leaq	5704(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$43:
	leaq	16(%rsp), %rsp
	leaq	10312(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$42:
	leaq	1608(%rsp), %rdx
	leaq	18504(%rsp), %rax
	leaq	6216(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$41:
	leaq	16(%rsp), %rsp
	leaq	10312(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$40:
	leaq	10312(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$38
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$39:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$38:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$39
	leaq	1608(%rsp), %rdx
	leaq	2632(%rsp), %rax
	leaq	4680(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$37:
	leaq	16(%rsp), %rsp
	leaq	2120(%rsp), %rdx
	leaq	3144(%rsp), %rax
	leaq	5192(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$36:
	leaq	16(%rsp), %rsp
	leaq	1608(%rsp), %rax
	leaq	2120(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$35:
	leaq	2120(%rsp), %rdx
	leaq	3656(%rsp), %rax
	leaq	5704(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$34:
	leaq	16(%rsp), %rsp
	leaq	1608(%rsp), %rax
	leaq	2120(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$33:
	leaq	2120(%rsp), %rdx
	leaq	4168(%rsp), %rax
	leaq	6216(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$32:
	leaq	16(%rsp), %rsp
	leaq	1608(%rsp), %rax
	leaq	2120(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$31:
	leaq	1608(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$29
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$30:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$29:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$30
	leaq	8776(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$28:
	leaq	9288(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$27:
	leaq	9800(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$26:
	leaq	10312(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$25:
	leaq	1608(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$24:
	leaq	8776(%rsp), %rax
	leaq	6728(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$23:
	leaq	9288(%rsp), %rax
	leaq	7240(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$22:
	leaq	9800(%rsp), %rax
	leaq	7752(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$21:
	leaq	10312(%rsp), %rax
	leaq	8264(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$20:
	leaq	1608(%rsp), %rax
	leaq	1096(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$19:
	leaq	1608(%rsp), %rax
	leaq	584(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$18:
	leaq	8776(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$16
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$17:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$16:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$17
	leaq	9288(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$14
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$15:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$14:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$15
	leaq	9800(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$12
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$13:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$12:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$13
	leaq	10312(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$10
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$11:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$10:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$11
	leaq	1608(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$9:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$8:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$9
	movq	%mm3, %rsi
	movq	%rsi, %r10
	movq	$0, %rdx
	movq	$0, %rdi
	leaq	8776(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$7:
	leaq	9288(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$6:
	leaq	9800(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$5:
	leaq	10312(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$4:
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$2
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$3:
	movzwq	8776(%rsp,%rdx,2), %r8
	shlq	$11, %r8
	addq	$1664, %r8
	imulq	$645084, %r8, %r8
	shrq	$31, %r8
	andq	$2047, %r8
	movw	%r8w, %ax
	movzwq	8778(%rsp,%rdx,2), %r8
	shlq	$11, %r8
	addq	$1664, %r8
	imulq	$645084, %r8, %r8
	shrq	$31, %r8
	andq	$2047, %r8
	movw	%r8w, %cx
	movzwq	8780(%rsp,%rdx,2), %r8
	shlq	$11, %r8
	addq	$1664, %r8
	imulq	$645084, %r8, %r8
	shrq	$31, %r8
	andq	$2047, %r8
	movzwq	8782(%rsp,%rdx,2), %r9
	shlq	$11, %r9
	addq	$1664, %r9
	imulq	$645084, %r9, %r9
	shrq	$31, %r9
	andq	$2047, %r9
	movzwq	8784(%rsp,%rdx,2), %r11
	shlq	$11, %r11
	addq	$1664, %r11
	imulq	$645084, %r11, %r11
	shrq	$31, %r11
	andq	$2047, %r11
	movzwq	8786(%rsp,%rdx,2), %rbx
	shlq	$11, %rbx
	addq	$1664, %rbx
	imulq	$645084, %rbx, %rbx
	shrq	$31, %rbx
	andq	$2047, %rbx
	movzwq	8788(%rsp,%rdx,2), %rbp
	shlq	$11, %rbp
	addq	$1664, %rbp
	imulq	$645084, %rbp, %rbp
	shrq	$31, %rbp
	andq	$2047, %rbp
	movzwq	8790(%rsp,%rdx,2), %r12
	shlq	$11, %r12
	addq	$1664, %r12
	imulq	$645084, %r12, %r12
	shrq	$31, %r12
	andq	$2047, %r12
	movw	%ax, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$8, %ax
	movw	%cx, %r13w
	shlw	$3, %r13w
	orw 	%ax, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$5, %cx
	movw	%r8w, %r13w
	shlw	$6, %r13w
	orw 	%cx, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	movw	%r8w, %ax
	shrw	$2, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$10, %r8w
	movw	%r9w, %r13w
	shlw	$1, %r13w
	orw 	%r8w, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$7, %r9w
	movw	%r11w, %r13w
	shlw	$4, %r13w
	orw 	%r9w, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$4, %r11w
	movw	%bx, %r13w
	shlw	$7, %r13w
	orw 	%r11w, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	movw	%bx, %ax
	shrw	$1, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$9, %bx
	movw	%bp, %r13w
	shlw	$2, %r13w
	orw 	%bx, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$6, %bp
	movw	%r12w, %r13w
	shlw	$5, %r13w
	orw 	%bp, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$3, %r12w
	movb	%r12b, (%r10,%rdi)
	incq	%rdi
	addq	$8, %rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$2:
	cmpq	$1024, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$3
	leaq	1408(%rsi), %r10
	leaq	1608(%rsp), %rax
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$1:
	movq	8(%rsp), %rsi
	movq	152(%rsp), %rax
	movq	%rax, (%rsi)
	movq	160(%rsp), %rax
	movq	%rax, 8(%rsi)
	movq	168(%rsp), %rax
	movq	%rax, 16(%rsi)
	movq	176(%rsp), %rax
	movq	%rax, 24(%rsi)
	xorl	%eax, %eax
	movq	19016(%rsp), %rbx
	movq	19024(%rsp), %rbp
	movq	19032(%rsp), %r12
	movq	19040(%rsp), %r13
	movq	19048(%rsp), %r14
	movq	19056(%rsp), %r15
	movq	19064(%rsp), %rsp
	ret
	.type	jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand, %function
jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand:
	movq	%rsp, %rax
	leaq	-19072(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 19016(%rsp)
	movq	%rbp, 19024(%rsp)
	movq	%r12, 19032(%rsp)
	movq	%r13, 19040(%rsp)
	movq	%r14, 19048(%rsp)
	movq	%r15, 19056(%rsp)
	movq	%rax, 19064(%rsp)
	movq	%rdx, %rbx
	lfence
	movq	$0, %rax
	movq	%rbx, (%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rdi, %mm1
	movq	(%rcx), %rax
	movq	%rax, 88(%rsp)
	movq	8(%rcx), %rax
	movq	%rax, 96(%rsp)
	movq	16(%rcx), %rax
	movq	%rax, 104(%rsp)
	movq	24(%rcx), %rax
	movq	%rax, 112(%rsp)
	leaq	120(%rsp), %rsi
	leaq	-224(%rsp), %rsp
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$381:
	leaq	224(%rsp), %rsp
	leaq	152(%rsp), %rsi
	leaq	88(%rsp), %rbx
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$380:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %r10
	movq	%mm1, %rdx
	leaq	88(%rsp), %rax
	leaq	184(%rsp), %r11
	movq	%rdx, %mm3
	movq	%r10, %rbx
	leaq	2632(%rsp), %rcx
	movq	%rbx, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$379:
	leaq	3144(%rsp), %rcx
	leaq	384(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$378:
	leaq	3656(%rsp), %rcx
	leaq	768(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$377:
	leaq	4168(%rsp), %rcx
	leaq	1152(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$376:
	movq	1536(%r10), %rcx
	movq	%rcx, 16(%rsp)
	movq	1544(%r10), %rcx
	movq	%rcx, 24(%rsp)
	movq	1552(%r10), %rcx
	movq	%rcx, 32(%rsp)
	movq	1560(%r10), %rcx
	movq	%rcx, 40(%rsp)
	leaq	584(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$375:
	movq	%r11, %mm4
	movq	$1, %rax
	movq	%rax, %mm5
	movb	16(%rsp), %sil
	movb	%sil, 48(%rsp)
	movb	17(%rsp), %sil
	movb	%sil, 49(%rsp)
	movb	18(%rsp), %sil
	movb	%sil, 50(%rsp)
	movb	19(%rsp), %sil
	movb	%sil, 51(%rsp)
	movb	20(%rsp), %sil
	movb	%sil, 52(%rsp)
	movb	21(%rsp), %sil
	movb	%sil, 53(%rsp)
	movb	22(%rsp), %sil
	movb	%sil, 54(%rsp)
	movb	23(%rsp), %sil
	movb	%sil, 55(%rsp)
	movb	24(%rsp), %sil
	movb	%sil, 56(%rsp)
	movb	25(%rsp), %sil
	movb	%sil, 57(%rsp)
	movb	26(%rsp), %sil
	movb	%sil, 58(%rsp)
	movb	27(%rsp), %sil
	movb	%sil, 59(%rsp)
	movb	28(%rsp), %sil
	movb	%sil, 60(%rsp)
	movb	29(%rsp), %sil
	movb	%sil, 61(%rsp)
	movb	30(%rsp), %sil
	movb	%sil, 62(%rsp)
	movb	31(%rsp), %sil
	movb	%sil, 63(%rsp)
	movb	32(%rsp), %sil
	movb	%sil, 64(%rsp)
	movb	33(%rsp), %sil
	movb	%sil, 65(%rsp)
	movb	34(%rsp), %sil
	movb	%sil, 66(%rsp)
	movb	35(%rsp), %sil
	movb	%sil, 67(%rsp)
	movb	36(%rsp), %sil
	movb	%sil, 68(%rsp)
	movb	37(%rsp), %sil
	movb	%sil, 69(%rsp)
	movb	38(%rsp), %sil
	movb	%sil, 70(%rsp)
	movb	39(%rsp), %sil
	movb	%sil, 71(%rsp)
	movb	40(%rsp), %sil
	movb	%sil, 72(%rsp)
	movb	41(%rsp), %sil
	movb	%sil, 73(%rsp)
	movb	42(%rsp), %sil
	movb	%sil, 74(%rsp)
	movb	43(%rsp), %sil
	movb	%sil, 75(%rsp)
	movb	44(%rsp), %sil
	movb	%sil, 76(%rsp)
	movb	45(%rsp), %sil
	movb	%sil, 77(%rsp)
	movb	46(%rsp), %sil
	movb	%sil, 78(%rsp)
	movb	47(%rsp), %sil
	movb	%sil, 79(%rsp)
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$373
	movb	$0, 80(%rsp)
	movb	$0, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$374
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$373:
	movb	$0, 80(%rsp)
	movb	$0, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$374:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$372:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$359
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$360:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$371:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$361
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$362:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$363
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$361
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$363:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$369
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$370
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$369:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$370:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$365
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$361
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$365:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$367
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$361
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$367:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$368:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$366:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$364:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$361:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$362
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$359:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$360
	movq	$0, %rcx
	leaq	10824(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$357
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$358:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$357:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$358
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$355
	movb	$0, 80(%rsp)
	movb	$1, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$356
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$355:
	movb	$1, 80(%rsp)
	movb	$0, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$356:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$354:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$341
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$342:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$353:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$343
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$344:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$345
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$343
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$345:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$351
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$351:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$352:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$347
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$343
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$347:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$349
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$343
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$349:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$350:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$348:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$346:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$343:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$344
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$341:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$342
	movq	$0, %rcx
	leaq	11336(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$339
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$340:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$339:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$340
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$337
	movb	$0, 80(%rsp)
	movb	$2, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$338
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$337:
	movb	$2, 80(%rsp)
	movb	$0, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$338:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$336:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$323
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$324:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$335:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$325
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$326:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$327
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$325
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$327:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$333
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$333:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$334:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$329
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$325
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$329:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$331
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$325
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$331:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$332:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$330:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$328:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$325:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$326
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$323:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$324
	movq	$0, %rcx
	leaq	11848(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$321
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$322:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$321:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$322
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$319
	movb	$0, 80(%rsp)
	movb	$3, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$320
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$319:
	movb	$3, 80(%rsp)
	movb	$0, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$320:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$318:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$305
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$306:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$317:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$307
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$308:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$309
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$307
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$309:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$315
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$315:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$316:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$311
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$307
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$311:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$313
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$307
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$313:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$314:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$312:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$310:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$307:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$308
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$305:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$306
	movq	$0, %rcx
	leaq	12360(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$303
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$304:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$303:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$304
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$301
	movb	$1, 80(%rsp)
	movb	$0, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$302
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$301:
	movb	$0, 80(%rsp)
	movb	$1, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$302:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$300:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$287
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$288:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$299:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$289
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$290:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$291
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$289
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$291:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$297
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$297:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$298:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$293
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$289
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$293:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$295
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$289
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$295:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$296:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$294:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$292:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$289:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$290
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$287:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$288
	movq	$0, %rcx
	leaq	12872(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$285
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$286:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$285:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$286
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$283
	movb	$1, 80(%rsp)
	movb	$1, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$284
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$283:
	movb	$1, 80(%rsp)
	movb	$1, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$284:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$282:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$269
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$270:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$281:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$271
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$272:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$273
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$271
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$273:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$279
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$279:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$280:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$275
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$271
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$275:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$277
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$271
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$277:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$278:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$276:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$274:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$271:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$272
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$269:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$270
	movq	$0, %rcx
	leaq	13384(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$267
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$268:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$267:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$268
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$265
	movb	$1, 80(%rsp)
	movb	$2, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$266
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$265:
	movb	$2, 80(%rsp)
	movb	$1, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$266:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$264:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$251
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$252:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$263:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$253
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$254:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$255
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$253
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$255:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$261
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$262
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$261:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$262:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$257
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$253
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$257:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$259
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$253
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$259:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$260:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$258:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$256:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$253:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$254
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$251:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$252
	movq	$0, %rcx
	leaq	13896(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$249
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$250:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$249:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$250
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$247
	movb	$1, 80(%rsp)
	movb	$3, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$248
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$247:
	movb	$3, 80(%rsp)
	movb	$1, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$248:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$246:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$233
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$234:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$245:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$235
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$236:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$237
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$235
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$237:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$243
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$244
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$243:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$244:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$239
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$235
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$239:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$241
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$235
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$241:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$242:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$240:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$238:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$235:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$236
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$233:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$234
	movq	$0, %rcx
	leaq	14408(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$231
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$232:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$231:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$232
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$229
	movb	$2, 80(%rsp)
	movb	$0, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$230
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$229:
	movb	$0, 80(%rsp)
	movb	$2, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$230:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$228:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$215
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$216:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$227:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$217
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$218:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$219
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$217
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$219:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$225
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$226
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$225:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$226:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$221
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$217
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$221:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$223
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$217
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$223:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$224:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$222:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$220:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$217:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$218
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$215:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$216
	movq	$0, %rcx
	leaq	14920(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$213
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$214:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$213:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$214
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$211
	movb	$2, 80(%rsp)
	movb	$1, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$212
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$211:
	movb	$1, 80(%rsp)
	movb	$2, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$212:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$210:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$197
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$198:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$209:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$199
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$200:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$201
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$199
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$201:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$207
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$208
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$207:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$208:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$203
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$199
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$203:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$205
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$199
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$205:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$206:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$204:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$202:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$199:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$200
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$197:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$198
	movq	$0, %rcx
	leaq	15432(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$195
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$196:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$195:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$196
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$193
	movb	$2, 80(%rsp)
	movb	$2, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$194
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$193:
	movb	$2, 80(%rsp)
	movb	$2, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$194:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$192:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$179
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$180:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$191:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$181
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$182:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$183
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$181
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$183:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$189
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$190
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$189:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$190:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$185
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$181
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$185:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$187
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$181
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$187:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$188:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$186:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$184:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$181:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$182
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$179:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$180
	movq	$0, %rcx
	leaq	15944(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$177
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$178:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$177:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$178
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$175
	movb	$2, 80(%rsp)
	movb	$3, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$176
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$175:
	movb	$3, 80(%rsp)
	movb	$2, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$176:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$174:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$161
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$162:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$173:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$163
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$164:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$165
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$163
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$165:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$171
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$172
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$171:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$172:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$167
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$163
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$167:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$169
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$163
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$169:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$170:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$168:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$166:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$163:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$164
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$161:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$162
	movq	$0, %rcx
	leaq	16456(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$159
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$160:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$159:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$160
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$157
	movb	$3, 80(%rsp)
	movb	$0, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$158
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$157:
	movb	$0, 80(%rsp)
	movb	$3, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$158:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$156:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$143
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$144:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$155:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$145
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$146:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$147
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$145
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$147:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$153
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$154
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$153:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$154:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$149
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$145
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$149:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$151
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$145
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$151:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$152:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$150:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$148:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$145:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$146
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$143:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$144
	movq	$0, %rcx
	leaq	16968(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$141
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$142:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$141:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$142
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$139
	movb	$3, 80(%rsp)
	movb	$1, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$140
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$139:
	movb	$1, 80(%rsp)
	movb	$3, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$140:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$138:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$125
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$126:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$137:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$127
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$128:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$129
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$127
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$129:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$135
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$136
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$135:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$136:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$131
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$127
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$131:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$133
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$127
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$133:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$134:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$132:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$130:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$127:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$128
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$125:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$126
	movq	$0, %rcx
	leaq	17480(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$123
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$124:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$123:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$124
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$121
	movb	$3, 80(%rsp)
	movb	$2, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$122
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$121:
	movb	$2, 80(%rsp)
	movb	$3, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$122:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$120:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$107
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$108:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$119:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$109
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$110:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$111
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$109
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$111:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$117
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$118
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$117:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$118:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$113
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$109
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$113:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$115
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$109
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$115:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$116:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$114:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$112:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$109:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$110
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$107:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$108
	movq	$0, %rcx
	leaq	17992(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$105
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$106:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$105:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$106
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$103
	movb	$3, 80(%rsp)
	movb	$3, 81(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$104
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$103:
	movb	$3, 80(%rsp)
	movb	$3, 81(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$104:
	leaq	384(%rsp), %rdx
	leaq	48(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$102:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$89
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$90:
	movq	%rcx, %mm6
	leaq	384(%rsp), %rdx
	leaq	216(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$101:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$91
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$92:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$93
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$91
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$93:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	216(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	217(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	218(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$99
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$100
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$99:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$100:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$95
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$91
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$95:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$97
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$91
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$97:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1096(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$98:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$96:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$94:
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$91:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$92
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$89:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$90
	movq	$0, %rcx
	leaq	18504(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$87
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$88:
	movw	1096(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$87:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$88
	movq	%mm4, %rcx
	movb	$0, %al
	leaq	4680(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$86:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	5192(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$85:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	5704(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$84:
	leaq	176(%rsp), %rsp
	movb	$3, %al
	leaq	6216(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$83:
	leaq	176(%rsp), %rsp
	movq	%mm4, %rcx
	movb	$4, %al
	leaq	6728(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$82:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	7240(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$81:
	leaq	176(%rsp), %rsp
	movb	$6, %al
	leaq	7752(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$80:
	leaq	176(%rsp), %rsp
	movb	$7, %al
	leaq	8264(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$79:
	leaq	176(%rsp), %rsp
	movb	$8, %al
	leaq	1096(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$78:
	leaq	176(%rsp), %rsp
	leaq	4680(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$77:
	leaq	5192(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$76:
	leaq	5704(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$75:
	leaq	6216(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$74:
	leaq	8776(%rsp), %rdx
	leaq	10824(%rsp), %rax
	leaq	4680(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$73:
	leaq	16(%rsp), %rsp
	leaq	1608(%rsp), %rdx
	leaq	11336(%rsp), %rax
	leaq	5192(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$72:
	leaq	16(%rsp), %rsp
	leaq	8776(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$71:
	leaq	1608(%rsp), %rdx
	leaq	11848(%rsp), %rax
	leaq	5704(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$70:
	leaq	16(%rsp), %rsp
	leaq	8776(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$69:
	leaq	1608(%rsp), %rdx
	leaq	12360(%rsp), %rax
	leaq	6216(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$68:
	leaq	16(%rsp), %rsp
	leaq	8776(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$67:
	leaq	8776(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$65
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$66:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$65:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$66
	leaq	9288(%rsp), %rdx
	leaq	12872(%rsp), %rax
	leaq	4680(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$64:
	leaq	16(%rsp), %rsp
	leaq	1608(%rsp), %rdx
	leaq	13384(%rsp), %rax
	leaq	5192(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$63:
	leaq	16(%rsp), %rsp
	leaq	9288(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$62:
	leaq	1608(%rsp), %rdx
	leaq	13896(%rsp), %rax
	leaq	5704(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$61:
	leaq	16(%rsp), %rsp
	leaq	9288(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$60:
	leaq	1608(%rsp), %rdx
	leaq	14408(%rsp), %rax
	leaq	6216(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$59:
	leaq	16(%rsp), %rsp
	leaq	9288(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$58:
	leaq	9288(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$56
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$57:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$56:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$57
	leaq	9800(%rsp), %rdx
	leaq	14920(%rsp), %rax
	leaq	4680(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$55:
	leaq	16(%rsp), %rsp
	leaq	1608(%rsp), %rdx
	leaq	15432(%rsp), %rax
	leaq	5192(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$54:
	leaq	16(%rsp), %rsp
	leaq	9800(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$53:
	leaq	1608(%rsp), %rdx
	leaq	15944(%rsp), %rax
	leaq	5704(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$52:
	leaq	16(%rsp), %rsp
	leaq	9800(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$51:
	leaq	1608(%rsp), %rdx
	leaq	16456(%rsp), %rax
	leaq	6216(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$50:
	leaq	16(%rsp), %rsp
	leaq	9800(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$49:
	leaq	9800(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$47
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$48:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$47:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$48
	leaq	10312(%rsp), %rdx
	leaq	16968(%rsp), %rax
	leaq	4680(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$46:
	leaq	16(%rsp), %rsp
	leaq	1608(%rsp), %rdx
	leaq	17480(%rsp), %rax
	leaq	5192(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$45:
	leaq	16(%rsp), %rsp
	leaq	10312(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$44:
	leaq	1608(%rsp), %rdx
	leaq	17992(%rsp), %rax
	leaq	5704(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$43:
	leaq	16(%rsp), %rsp
	leaq	10312(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$42:
	leaq	1608(%rsp), %rdx
	leaq	18504(%rsp), %rax
	leaq	6216(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$41:
	leaq	16(%rsp), %rsp
	leaq	10312(%rsp), %rax
	leaq	1608(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$40:
	leaq	10312(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$38
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$39:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$38:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$39
	leaq	1608(%rsp), %rdx
	leaq	2632(%rsp), %rax
	leaq	4680(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$37:
	leaq	16(%rsp), %rsp
	leaq	2120(%rsp), %rdx
	leaq	3144(%rsp), %rax
	leaq	5192(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$36:
	leaq	16(%rsp), %rsp
	leaq	1608(%rsp), %rax
	leaq	2120(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$35:
	leaq	2120(%rsp), %rdx
	leaq	3656(%rsp), %rax
	leaq	5704(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$34:
	leaq	16(%rsp), %rsp
	leaq	1608(%rsp), %rax
	leaq	2120(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$33:
	leaq	2120(%rsp), %rdx
	leaq	4168(%rsp), %rax
	leaq	6216(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$32:
	leaq	16(%rsp), %rsp
	leaq	1608(%rsp), %rax
	leaq	2120(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$31:
	leaq	1608(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$29
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$30:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$29:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$30
	leaq	8776(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$28:
	leaq	9288(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$27:
	leaq	9800(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$26:
	leaq	10312(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$25:
	leaq	1608(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$24:
	leaq	8776(%rsp), %rax
	leaq	6728(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$23:
	leaq	9288(%rsp), %rax
	leaq	7240(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$22:
	leaq	9800(%rsp), %rax
	leaq	7752(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$21:
	leaq	10312(%rsp), %rax
	leaq	8264(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$20:
	leaq	1608(%rsp), %rax
	leaq	1096(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$19:
	leaq	1608(%rsp), %rax
	leaq	584(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$18:
	leaq	8776(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$16
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$17:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$16:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$17
	leaq	9288(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$14
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$15:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$14:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$15
	leaq	9800(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$12
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$13:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$12:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$13
	leaq	10312(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$10
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$11:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$10:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$11
	leaq	1608(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$9:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$8:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$9
	movq	%mm3, %rsi
	movq	%rsi, %r10
	movq	$0, %rdx
	movq	$0, %rdi
	leaq	8776(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$7:
	leaq	9288(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$6:
	leaq	9800(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$5:
	leaq	10312(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$4:
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$2
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$3:
	movzwq	8776(%rsp,%rdx,2), %r8
	shlq	$11, %r8
	addq	$1664, %r8
	imulq	$645084, %r8, %r8
	shrq	$31, %r8
	andq	$2047, %r8
	movw	%r8w, %ax
	movzwq	8778(%rsp,%rdx,2), %r8
	shlq	$11, %r8
	addq	$1664, %r8
	imulq	$645084, %r8, %r8
	shrq	$31, %r8
	andq	$2047, %r8
	movw	%r8w, %cx
	movzwq	8780(%rsp,%rdx,2), %r8
	shlq	$11, %r8
	addq	$1664, %r8
	imulq	$645084, %r8, %r8
	shrq	$31, %r8
	andq	$2047, %r8
	movzwq	8782(%rsp,%rdx,2), %r9
	shlq	$11, %r9
	addq	$1664, %r9
	imulq	$645084, %r9, %r9
	shrq	$31, %r9
	andq	$2047, %r9
	movzwq	8784(%rsp,%rdx,2), %r11
	shlq	$11, %r11
	addq	$1664, %r11
	imulq	$645084, %r11, %r11
	shrq	$31, %r11
	andq	$2047, %r11
	movzwq	8786(%rsp,%rdx,2), %rbx
	shlq	$11, %rbx
	addq	$1664, %rbx
	imulq	$645084, %rbx, %rbx
	shrq	$31, %rbx
	andq	$2047, %rbx
	movzwq	8788(%rsp,%rdx,2), %rbp
	shlq	$11, %rbp
	addq	$1664, %rbp
	imulq	$645084, %rbp, %rbp
	shrq	$31, %rbp
	andq	$2047, %rbp
	movzwq	8790(%rsp,%rdx,2), %r12
	shlq	$11, %r12
	addq	$1664, %r12
	imulq	$645084, %r12, %r12
	shrq	$31, %r12
	andq	$2047, %r12
	movw	%ax, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$8, %ax
	movw	%cx, %r13w
	shlw	$3, %r13w
	orw 	%ax, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$5, %cx
	movw	%r8w, %r13w
	shlw	$6, %r13w
	orw 	%cx, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	movw	%r8w, %ax
	shrw	$2, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$10, %r8w
	movw	%r9w, %r13w
	shlw	$1, %r13w
	orw 	%r8w, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$7, %r9w
	movw	%r11w, %r13w
	shlw	$4, %r13w
	orw 	%r9w, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$4, %r11w
	movw	%bx, %r13w
	shlw	$7, %r13w
	orw 	%r11w, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	movw	%bx, %ax
	shrw	$1, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$9, %bx
	movw	%bp, %r13w
	shlw	$2, %r13w
	orw 	%bx, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$6, %bp
	movw	%r12w, %r13w
	shlw	$5, %r13w
	orw 	%bp, %r13w
	movb	%r13b, (%r10,%rdi)
	incq	%rdi
	shrw	$3, %r12w
	movb	%r12b, (%r10,%rdi)
	incq	%rdi
	addq	$8, %rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$2:
	cmpq	$1024, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$3
	leaq	1408(%rsi), %r10
	leaq	1608(%rsp), %rax
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$1:
	movq	8(%rsp), %rsi
	movq	152(%rsp), %rax
	movq	%rax, (%rsi)
	movq	160(%rsp), %rax
	movq	%rax, 8(%rsi)
	movq	168(%rsp), %rax
	movq	%rax, 16(%rsi)
	movq	176(%rsp), %rax
	movq	%rax, 24(%rsi)
	xorl	%eax, %eax
	movq	19016(%rsp), %rbx
	movq	19024(%rsp), %rbp
	movq	19032(%rsp), %r12
	movq	19040(%rsp), %r13
	movq	19048(%rsp), %r14
	movq	19056(%rsp), %r15
	movq	19064(%rsp), %rsp
	ret
	.type	jade_kem_mlkem_mlkem1024_amd64_ref_keypair, %function
jade_kem_mlkem_mlkem1024_amd64_ref_keypair:
	movq	%rsp, %rax
	leaq	-15560(%rsp), %rsp
	andq	$-16, %rsp
	movq	%rbx, 15504(%rsp)
	movq	%rbp, 15512(%rsp)
	movq	%r12, 15520(%rsp)
	movq	%r13, 15528(%rsp)
	movq	%r14, 15536(%rsp)
	movq	%r15, 15544(%rsp)
	movq	%rax, 15552(%rsp)
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	lfence
	movq	$0, %rax
	leaq	160(%rsp), %rdi
	movq	$64, %rsi
	call	__jasmin_syscall_randombytes__
	movq	%rax, %mm0
	movq	%rbp, %rcx
	movq	%rbp, %mm2
	movq	%rbx, (%rsp)
	movq	%rcx, 8(%rsp)
	movq	(%rax), %rcx
	movq	%rcx, 80(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 88(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 96(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 104(%rsp)
	movb	$4, 112(%rsp)
	leaq	224(%rsp), %rsi
	leaq	80(%rsp), %rbx
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$366:
	leaq	224(%rsp), %rsp
	movq	224(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	256(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	232(%rsp), %rax
	movq	%rax, 56(%rsp)
	movq	264(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	240(%rsp), %rax
	movq	%rax, 64(%rsp)
	movq	272(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	248(%rsp), %rax
	movq	%rax, 72(%rsp)
	movq	280(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	$0, %rax
	movq	%rax, %mm5
	movb	48(%rsp), %sil
	movb	%sil, 120(%rsp)
	movb	49(%rsp), %sil
	movb	%sil, 121(%rsp)
	movb	50(%rsp), %sil
	movb	%sil, 122(%rsp)
	movb	51(%rsp), %sil
	movb	%sil, 123(%rsp)
	movb	52(%rsp), %sil
	movb	%sil, 124(%rsp)
	movb	53(%rsp), %sil
	movb	%sil, 125(%rsp)
	movb	54(%rsp), %sil
	movb	%sil, 126(%rsp)
	movb	55(%rsp), %sil
	movb	%sil, 127(%rsp)
	movb	56(%rsp), %sil
	movb	%sil, 128(%rsp)
	movb	57(%rsp), %sil
	movb	%sil, 129(%rsp)
	movb	58(%rsp), %sil
	movb	%sil, 130(%rsp)
	movb	59(%rsp), %sil
	movb	%sil, 131(%rsp)
	movb	60(%rsp), %sil
	movb	%sil, 132(%rsp)
	movb	61(%rsp), %sil
	movb	%sil, 133(%rsp)
	movb	62(%rsp), %sil
	movb	%sil, 134(%rsp)
	movb	63(%rsp), %sil
	movb	%sil, 135(%rsp)
	movb	64(%rsp), %sil
	movb	%sil, 136(%rsp)
	movb	65(%rsp), %sil
	movb	%sil, 137(%rsp)
	movb	66(%rsp), %sil
	movb	%sil, 138(%rsp)
	movb	67(%rsp), %sil
	movb	%sil, 139(%rsp)
	movb	68(%rsp), %sil
	movb	%sil, 140(%rsp)
	movb	69(%rsp), %sil
	movb	%sil, 141(%rsp)
	movb	70(%rsp), %sil
	movb	%sil, 142(%rsp)
	movb	71(%rsp), %sil
	movb	%sil, 143(%rsp)
	movb	72(%rsp), %sil
	movb	%sil, 144(%rsp)
	movb	73(%rsp), %sil
	movb	%sil, 145(%rsp)
	movb	74(%rsp), %sil
	movb	%sil, 146(%rsp)
	movb	75(%rsp), %sil
	movb	%sil, 147(%rsp)
	movb	76(%rsp), %sil
	movb	%sil, 148(%rsp)
	movb	77(%rsp), %sil
	movb	%sil, 149(%rsp)
	movb	78(%rsp), %sil
	movb	%sil, 150(%rsp)
	movb	79(%rsp), %sil
	movb	%sil, 151(%rsp)
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$364
	movb	$0, 152(%rsp)
	movb	$0, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$365
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$364:
	movb	$0, 152(%rsp)
	movb	$0, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$365:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$363:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$350
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$351:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$362:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$353:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$354
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$354:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$360
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$361
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$360:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$361:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$356
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$356:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$358
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$358:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$359:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$357:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$355:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$352:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$353
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$350:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$351
	movq	$0, %rcx
	leaq	7312(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$348
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$349:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$348:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$349
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$346
	movb	$0, 152(%rsp)
	movb	$1, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$347
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$346:
	movb	$1, 152(%rsp)
	movb	$0, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$347:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$345:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$332
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$333:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$344:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$335:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$336
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$336:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$342
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$343
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$342:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$343:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$338
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$338:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$340
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$340:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$341:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$339:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$337:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$334:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$335
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$332:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$333
	movq	$0, %rcx
	leaq	7824(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$330
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$331:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$330:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$331
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$328
	movb	$0, 152(%rsp)
	movb	$2, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$329
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$328:
	movb	$2, 152(%rsp)
	movb	$0, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$329:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$327:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$314
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$315:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$326:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$317:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$318
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$318:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$324
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$325
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$324:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$325:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$320
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$320:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$322
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$322:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$323:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$321:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$319:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$316:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$317
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$314:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$315
	movq	$0, %rcx
	leaq	8336(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$312
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$313:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$312:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$313
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$310
	movb	$0, 152(%rsp)
	movb	$3, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$311
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$310:
	movb	$3, 152(%rsp)
	movb	$0, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$311:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$309:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$296
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$297:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$308:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$299:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$300
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$300:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$306
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$307
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$306:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$307:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$302
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$302:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$304
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$304:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$305:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$303:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$301:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$298:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$299
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$296:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$297
	movq	$0, %rcx
	leaq	8848(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$294
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$295:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$294:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$295
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$292
	movb	$1, 152(%rsp)
	movb	$0, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$293
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$292:
	movb	$0, 152(%rsp)
	movb	$1, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$293:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$291:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$278
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$279:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$290:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$281:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$282
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$282:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$288
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$289
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$288:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$289:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$284
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$284:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$286
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$286:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$287:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$285:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$283:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$280:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$281
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$278:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$279
	movq	$0, %rcx
	leaq	9360(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$276
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$277:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$276:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$277
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$274
	movb	$1, 152(%rsp)
	movb	$1, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$275
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$274:
	movb	$1, 152(%rsp)
	movb	$1, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$275:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$273:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$260
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$261:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$272:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$262
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$263:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$264
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$262
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$264:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$270
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$271
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$270:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$271:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$266
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$262
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$266:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$268
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$262
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$268:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$269:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$267:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$265:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$262:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$263
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$260:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$261
	movq	$0, %rcx
	leaq	9872(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$258
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$259:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$258:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$259
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$256
	movb	$1, 152(%rsp)
	movb	$2, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$257
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$256:
	movb	$2, 152(%rsp)
	movb	$1, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$257:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$255:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$242
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$243:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$254:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$244
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$245:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$246
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$244
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$246:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$252
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$253
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$252:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$253:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$248
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$244
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$248:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$250
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$244
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$250:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$251:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$249:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$247:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$244:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$245
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$242:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$243
	movq	$0, %rcx
	leaq	10384(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$240
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$241:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$240:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$241
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$238
	movb	$1, 152(%rsp)
	movb	$3, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$239
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$238:
	movb	$3, 152(%rsp)
	movb	$1, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$239:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$237:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$224
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$225:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$236:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$226
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$227:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$228
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$226
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$228:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$234
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$235
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$234:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$235:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$230
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$226
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$230:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$232
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$226
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$232:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$233:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$231:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$229:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$226:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$227
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$224:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$225
	movq	$0, %rcx
	leaq	10896(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$222
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$223:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$222:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$223
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$220
	movb	$2, 152(%rsp)
	movb	$0, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$221
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$220:
	movb	$0, 152(%rsp)
	movb	$2, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$221:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$219:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$206
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$207:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$218:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$208
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$209:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$210
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$208
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$210:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$216
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$217
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$216:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$217:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$212
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$208
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$212:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$214
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$208
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$214:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$215:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$213:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$211:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$208:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$209
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$206:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$207
	movq	$0, %rcx
	leaq	11408(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$204
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$205:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$204:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$205
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$202
	movb	$2, 152(%rsp)
	movb	$1, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$203
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$202:
	movb	$1, 152(%rsp)
	movb	$2, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$203:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$201:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$188
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$189:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$200:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$190
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$191:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$192
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$190
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$192:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$198
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$199
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$198:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$199:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$194
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$190
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$194:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$196
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$190
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$196:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$197:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$195:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$193:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$190:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$191
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$188:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$189
	movq	$0, %rcx
	leaq	11920(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$186
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$187:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$186:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$187
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$184
	movb	$2, 152(%rsp)
	movb	$2, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$185
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$184:
	movb	$2, 152(%rsp)
	movb	$2, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$185:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$183:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$170
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$171:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$182:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$172
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$173:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$174
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$172
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$174:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$180
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$181
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$180:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$181:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$176
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$172
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$176:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$178
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$172
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$178:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$179:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$177:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$175:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$172:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$173
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$170:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$171
	movq	$0, %rcx
	leaq	12432(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$168
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$169:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$168:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$169
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$166
	movb	$2, 152(%rsp)
	movb	$3, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$167
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$166:
	movb	$3, 152(%rsp)
	movb	$2, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$167:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$165:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$152
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$153:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$164:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$154
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$155:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$156
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$154
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$156:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$162
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$163
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$162:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$163:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$158
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$154
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$158:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$160
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$154
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$160:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$161:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$159:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$157:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$154:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$155
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$152:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$153
	movq	$0, %rcx
	leaq	12944(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$150
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$151:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$150:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$151
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$148
	movb	$3, 152(%rsp)
	movb	$0, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$149
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$148:
	movb	$0, 152(%rsp)
	movb	$3, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$149:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$147:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$134
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$135:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$146:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$136
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$137:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$138
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$136
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$138:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$144
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$145
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$144:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$145:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$140
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$136
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$140:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$142
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$136
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$142:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$143:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$141:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$139:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$136:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$137
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$134:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$135
	movq	$0, %rcx
	leaq	13456(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$132
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$133:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$132:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$133
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$130
	movb	$3, 152(%rsp)
	movb	$1, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$131
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$130:
	movb	$1, 152(%rsp)
	movb	$3, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$131:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$129:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$116
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$117:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$128:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$118
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$119:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$120
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$118
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$120:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$126
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$127
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$126:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$127:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$122
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$118
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$122:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$124
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$118
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$124:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$125:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$123:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$121:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$118:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$119
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$116:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$117
	movq	$0, %rcx
	leaq	13968(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$114
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$115:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$114:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$115
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$112
	movb	$3, 152(%rsp)
	movb	$2, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$113
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$112:
	movb	$2, 152(%rsp)
	movb	$3, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$113:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$111:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$98
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$99:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$110:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$100
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$101:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$102
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$100
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$102:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$108
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$109
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$108:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$109:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$104
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$100
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$104:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$106
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$100
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$106:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$107:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$105:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$103:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$100:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$101
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$98:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$99
	movq	$0, %rcx
	leaq	14480(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$96
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$97:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$96:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$97
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$94
	movb	$3, 152(%rsp)
	movb	$3, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$95
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$94:
	movb	$3, 152(%rsp)
	movb	$3, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$95:
	leaq	456(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$93:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$80
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$81:
	movq	%rcx, %mm6
	leaq	456(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$92:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$82
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$83:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$84
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$82
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$84:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	288(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	289(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	290(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$90
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$91
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$90:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$91:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$86
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$82
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$86:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$88
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$82
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$88:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 656(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$89:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$87:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$85:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$82:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$83
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$80:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$81
	movq	$0, %rcx
	leaq	14992(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$78
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$79:
	movw	656(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$78:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$79
	movb	$0, %al
	leaq	1168(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$77:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	1680(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$76:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	2192(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$75:
	leaq	176(%rsp), %rsp
	movb	$3, %al
	leaq	2704(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$74:
	leaq	176(%rsp), %rsp
	movb	$4, %al
	leaq	3216(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$73:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	3728(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$72:
	leaq	176(%rsp), %rsp
	movb	$6, %al
	leaq	4240(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$71:
	leaq	176(%rsp), %rsp
	movb	$7, %al
	leaq	4752(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$70:
	leaq	176(%rsp), %rsp
	leaq	1168(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$69:
	leaq	1680(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$68:
	leaq	2192(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$67:
	leaq	2704(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$66:
	leaq	3216(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$65:
	leaq	3728(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$64:
	leaq	4240(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$63:
	leaq	4752(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$62:
	leaq	5264(%rsp), %rdx
	leaq	7312(%rsp), %rax
	leaq	1168(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$61:
	leaq	16(%rsp), %rsp
	leaq	656(%rsp), %rdx
	leaq	7824(%rsp), %rax
	leaq	1680(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$60:
	leaq	16(%rsp), %rsp
	leaq	5264(%rsp), %rax
	leaq	656(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$59:
	leaq	656(%rsp), %rdx
	leaq	8336(%rsp), %rax
	leaq	2192(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$58:
	leaq	16(%rsp), %rsp
	leaq	5264(%rsp), %rax
	leaq	656(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$57:
	leaq	656(%rsp), %rdx
	leaq	8848(%rsp), %rax
	leaq	2704(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$56:
	leaq	16(%rsp), %rsp
	leaq	5264(%rsp), %rax
	leaq	656(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$55:
	leaq	5264(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$53
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$54:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$53:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$54
	leaq	5264(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$52:
	leaq	5776(%rsp), %rdx
	leaq	9360(%rsp), %rax
	leaq	1168(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$51:
	leaq	16(%rsp), %rsp
	leaq	656(%rsp), %rdx
	leaq	9872(%rsp), %rax
	leaq	1680(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$50:
	leaq	16(%rsp), %rsp
	leaq	5776(%rsp), %rax
	leaq	656(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$49:
	leaq	656(%rsp), %rdx
	leaq	10384(%rsp), %rax
	leaq	2192(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$48:
	leaq	16(%rsp), %rsp
	leaq	5776(%rsp), %rax
	leaq	656(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$47:
	leaq	656(%rsp), %rdx
	leaq	10896(%rsp), %rax
	leaq	2704(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$46:
	leaq	16(%rsp), %rsp
	leaq	5776(%rsp), %rax
	leaq	656(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$45:
	leaq	5776(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$43
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$44:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$43:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$44
	leaq	5776(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$42:
	leaq	6288(%rsp), %rdx
	leaq	11408(%rsp), %rax
	leaq	1168(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$41:
	leaq	16(%rsp), %rsp
	leaq	656(%rsp), %rdx
	leaq	11920(%rsp), %rax
	leaq	1680(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$40:
	leaq	16(%rsp), %rsp
	leaq	6288(%rsp), %rax
	leaq	656(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$39:
	leaq	656(%rsp), %rdx
	leaq	12432(%rsp), %rax
	leaq	2192(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$38:
	leaq	16(%rsp), %rsp
	leaq	6288(%rsp), %rax
	leaq	656(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$37:
	leaq	656(%rsp), %rdx
	leaq	12944(%rsp), %rax
	leaq	2704(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$36:
	leaq	16(%rsp), %rsp
	leaq	6288(%rsp), %rax
	leaq	656(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$35:
	leaq	6288(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$33
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$34:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$33:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$34
	leaq	6288(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$32:
	leaq	6800(%rsp), %rdx
	leaq	13456(%rsp), %rax
	leaq	1168(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$31:
	leaq	16(%rsp), %rsp
	leaq	656(%rsp), %rdx
	leaq	13968(%rsp), %rax
	leaq	1680(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$30:
	leaq	16(%rsp), %rsp
	leaq	6800(%rsp), %rax
	leaq	656(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$29:
	leaq	656(%rsp), %rdx
	leaq	14480(%rsp), %rax
	leaq	2192(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$28:
	leaq	16(%rsp), %rsp
	leaq	6800(%rsp), %rax
	leaq	656(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$27:
	leaq	656(%rsp), %rdx
	leaq	14992(%rsp), %rax
	leaq	2704(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$26:
	leaq	16(%rsp), %rsp
	leaq	6800(%rsp), %rax
	leaq	656(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$25:
	leaq	6800(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$23
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$24:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$23:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$24
	leaq	6800(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$22:
	leaq	5264(%rsp), %rax
	leaq	3216(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$21:
	leaq	5776(%rsp), %rax
	leaq	3728(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$20:
	leaq	6288(%rsp), %rax
	leaq	4240(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$19:
	leaq	6800(%rsp), %rax
	leaq	4752(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$18:
	leaq	5264(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$16
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$17:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$16:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$17
	leaq	5776(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$14
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$15:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$14:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$15
	leaq	6288(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$12
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$13:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$12:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$13
	leaq	6800(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$10
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$11:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$10:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$11
	movq	(%rsp), %rbx
	movq	8(%rsp), %rdx
	movq	%rdx, %r10
	leaq	1168(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$9:
	leaq	384(%rdx), %r10
	leaq	1680(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$8:
	leaq	768(%rdx), %r10
	leaq	2192(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$7:
	leaq	1152(%rdx), %r10
	leaq	2704(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$6:
	movq	%rbx, %rdx
	movq	%rdx, %r10
	leaq	5264(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$5:
	leaq	384(%rdx), %r10
	leaq	5776(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$4:
	leaq	768(%rdx), %r10
	leaq	6288(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$3:
	leaq	1152(%rdx), %r10
	leaq	6800(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$2:
	movq	48(%rsp), %rax
	movq	%rax, 1536(%rbx)
	movq	56(%rsp), %rax
	movq	%rax, 1544(%rbx)
	movq	64(%rsp), %rax
	movq	%rax, 1552(%rbx)
	movq	72(%rsp), %rax
	movq	%rax, 1560(%rbx)
	movq	%mm2, %rcx
	movq	(%rbx), %rax
	movq	%rax, 1536(%rcx)
	movq	8(%rbx), %rax
	movq	%rax, 1544(%rcx)
	movq	16(%rbx), %rax
	movq	%rax, 1552(%rcx)
	movq	24(%rbx), %rax
	movq	%rax, 1560(%rcx)
	movq	32(%rbx), %rax
	movq	%rax, 1568(%rcx)
	movq	40(%rbx), %rax
	movq	%rax, 1576(%rcx)
	movq	48(%rbx), %rax
	movq	%rax, 1584(%rcx)
	movq	56(%rbx), %rax
	movq	%rax, 1592(%rcx)
	movq	64(%rbx), %rax
	movq	%rax, 1600(%rcx)
	movq	72(%rbx), %rax
	movq	%rax, 1608(%rcx)
	movq	80(%rbx), %rax
	movq	%rax, 1616(%rcx)
	movq	88(%rbx), %rax
	movq	%rax, 1624(%rcx)
	movq	96(%rbx), %rax
	movq	%rax, 1632(%rcx)
	movq	104(%rbx), %rax
	movq	%rax, 1640(%rcx)
	movq	112(%rbx), %rax
	movq	%rax, 1648(%rcx)
	movq	120(%rbx), %rax
	movq	%rax, 1656(%rcx)
	movq	128(%rbx), %rax
	movq	%rax, 1664(%rcx)
	movq	136(%rbx), %rax
	movq	%rax, 1672(%rcx)
	movq	144(%rbx), %rax
	movq	%rax, 1680(%rcx)
	movq	152(%rbx), %rax
	movq	%rax, 1688(%rcx)
	movq	160(%rbx), %rax
	movq	%rax, 1696(%rcx)
	movq	168(%rbx), %rax
	movq	%rax, 1704(%rcx)
	movq	176(%rbx), %rax
	movq	%rax, 1712(%rcx)
	movq	184(%rbx), %rax
	movq	%rax, 1720(%rcx)
	movq	192(%rbx), %rax
	movq	%rax, 1728(%rcx)
	movq	200(%rbx), %rax
	movq	%rax, 1736(%rcx)
	movq	208(%rbx), %rax
	movq	%rax, 1744(%rcx)
	movq	216(%rbx), %rax
	movq	%rax, 1752(%rcx)
	movq	224(%rbx), %rax
	movq	%rax, 1760(%rcx)
	movq	232(%rbx), %rax
	movq	%rax, 1768(%rcx)
	movq	240(%rbx), %rax
	movq	%rax, 1776(%rcx)
	movq	248(%rbx), %rax
	movq	%rax, 1784(%rcx)
	movq	256(%rbx), %rax
	movq	%rax, 1792(%rcx)
	movq	264(%rbx), %rax
	movq	%rax, 1800(%rcx)
	movq	272(%rbx), %rax
	movq	%rax, 1808(%rcx)
	movq	280(%rbx), %rax
	movq	%rax, 1816(%rcx)
	movq	288(%rbx), %rax
	movq	%rax, 1824(%rcx)
	movq	296(%rbx), %rax
	movq	%rax, 1832(%rcx)
	movq	304(%rbx), %rax
	movq	%rax, 1840(%rcx)
	movq	312(%rbx), %rax
	movq	%rax, 1848(%rcx)
	movq	320(%rbx), %rax
	movq	%rax, 1856(%rcx)
	movq	328(%rbx), %rax
	movq	%rax, 1864(%rcx)
	movq	336(%rbx), %rax
	movq	%rax, 1872(%rcx)
	movq	344(%rbx), %rax
	movq	%rax, 1880(%rcx)
	movq	352(%rbx), %rax
	movq	%rax, 1888(%rcx)
	movq	360(%rbx), %rax
	movq	%rax, 1896(%rcx)
	movq	368(%rbx), %rax
	movq	%rax, 1904(%rcx)
	movq	376(%rbx), %rax
	movq	%rax, 1912(%rcx)
	movq	384(%rbx), %rax
	movq	%rax, 1920(%rcx)
	movq	392(%rbx), %rax
	movq	%rax, 1928(%rcx)
	movq	400(%rbx), %rax
	movq	%rax, 1936(%rcx)
	movq	408(%rbx), %rax
	movq	%rax, 1944(%rcx)
	movq	416(%rbx), %rax
	movq	%rax, 1952(%rcx)
	movq	424(%rbx), %rax
	movq	%rax, 1960(%rcx)
	movq	432(%rbx), %rax
	movq	%rax, 1968(%rcx)
	movq	440(%rbx), %rax
	movq	%rax, 1976(%rcx)
	movq	448(%rbx), %rax
	movq	%rax, 1984(%rcx)
	movq	456(%rbx), %rax
	movq	%rax, 1992(%rcx)
	movq	464(%rbx), %rax
	movq	%rax, 2000(%rcx)
	movq	472(%rbx), %rax
	movq	%rax, 2008(%rcx)
	movq	480(%rbx), %rax
	movq	%rax, 2016(%rcx)
	movq	488(%rbx), %rax
	movq	%rax, 2024(%rcx)
	movq	496(%rbx), %rax
	movq	%rax, 2032(%rcx)
	movq	504(%rbx), %rax
	movq	%rax, 2040(%rcx)
	movq	512(%rbx), %rax
	movq	%rax, 2048(%rcx)
	movq	520(%rbx), %rax
	movq	%rax, 2056(%rcx)
	movq	528(%rbx), %rax
	movq	%rax, 2064(%rcx)
	movq	536(%rbx), %rax
	movq	%rax, 2072(%rcx)
	movq	544(%rbx), %rax
	movq	%rax, 2080(%rcx)
	movq	552(%rbx), %rax
	movq	%rax, 2088(%rcx)
	movq	560(%rbx), %rax
	movq	%rax, 2096(%rcx)
	movq	568(%rbx), %rax
	movq	%rax, 2104(%rcx)
	movq	576(%rbx), %rax
	movq	%rax, 2112(%rcx)
	movq	584(%rbx), %rax
	movq	%rax, 2120(%rcx)
	movq	592(%rbx), %rax
	movq	%rax, 2128(%rcx)
	movq	600(%rbx), %rax
	movq	%rax, 2136(%rcx)
	movq	608(%rbx), %rax
	movq	%rax, 2144(%rcx)
	movq	616(%rbx), %rax
	movq	%rax, 2152(%rcx)
	movq	624(%rbx), %rax
	movq	%rax, 2160(%rcx)
	movq	632(%rbx), %rax
	movq	%rax, 2168(%rcx)
	movq	640(%rbx), %rax
	movq	%rax, 2176(%rcx)
	movq	648(%rbx), %rax
	movq	%rax, 2184(%rcx)
	movq	656(%rbx), %rax
	movq	%rax, 2192(%rcx)
	movq	664(%rbx), %rax
	movq	%rax, 2200(%rcx)
	movq	672(%rbx), %rax
	movq	%rax, 2208(%rcx)
	movq	680(%rbx), %rax
	movq	%rax, 2216(%rcx)
	movq	688(%rbx), %rax
	movq	%rax, 2224(%rcx)
	movq	696(%rbx), %rax
	movq	%rax, 2232(%rcx)
	movq	704(%rbx), %rax
	movq	%rax, 2240(%rcx)
	movq	712(%rbx), %rax
	movq	%rax, 2248(%rcx)
	movq	720(%rbx), %rax
	movq	%rax, 2256(%rcx)
	movq	728(%rbx), %rax
	movq	%rax, 2264(%rcx)
	movq	736(%rbx), %rax
	movq	%rax, 2272(%rcx)
	movq	744(%rbx), %rax
	movq	%rax, 2280(%rcx)
	movq	752(%rbx), %rax
	movq	%rax, 2288(%rcx)
	movq	760(%rbx), %rax
	movq	%rax, 2296(%rcx)
	movq	768(%rbx), %rax
	movq	%rax, 2304(%rcx)
	movq	776(%rbx), %rax
	movq	%rax, 2312(%rcx)
	movq	784(%rbx), %rax
	movq	%rax, 2320(%rcx)
	movq	792(%rbx), %rax
	movq	%rax, 2328(%rcx)
	movq	800(%rbx), %rax
	movq	%rax, 2336(%rcx)
	movq	808(%rbx), %rax
	movq	%rax, 2344(%rcx)
	movq	816(%rbx), %rax
	movq	%rax, 2352(%rcx)
	movq	824(%rbx), %rax
	movq	%rax, 2360(%rcx)
	movq	832(%rbx), %rax
	movq	%rax, 2368(%rcx)
	movq	840(%rbx), %rax
	movq	%rax, 2376(%rcx)
	movq	848(%rbx), %rax
	movq	%rax, 2384(%rcx)
	movq	856(%rbx), %rax
	movq	%rax, 2392(%rcx)
	movq	864(%rbx), %rax
	movq	%rax, 2400(%rcx)
	movq	872(%rbx), %rax
	movq	%rax, 2408(%rcx)
	movq	880(%rbx), %rax
	movq	%rax, 2416(%rcx)
	movq	888(%rbx), %rax
	movq	%rax, 2424(%rcx)
	movq	896(%rbx), %rax
	movq	%rax, 2432(%rcx)
	movq	904(%rbx), %rax
	movq	%rax, 2440(%rcx)
	movq	912(%rbx), %rax
	movq	%rax, 2448(%rcx)
	movq	920(%rbx), %rax
	movq	%rax, 2456(%rcx)
	movq	928(%rbx), %rax
	movq	%rax, 2464(%rcx)
	movq	936(%rbx), %rax
	movq	%rax, 2472(%rcx)
	movq	944(%rbx), %rax
	movq	%rax, 2480(%rcx)
	movq	952(%rbx), %rax
	movq	%rax, 2488(%rcx)
	movq	960(%rbx), %rax
	movq	%rax, 2496(%rcx)
	movq	968(%rbx), %rax
	movq	%rax, 2504(%rcx)
	movq	976(%rbx), %rax
	movq	%rax, 2512(%rcx)
	movq	984(%rbx), %rax
	movq	%rax, 2520(%rcx)
	movq	992(%rbx), %rax
	movq	%rax, 2528(%rcx)
	movq	1000(%rbx), %rax
	movq	%rax, 2536(%rcx)
	movq	1008(%rbx), %rax
	movq	%rax, 2544(%rcx)
	movq	1016(%rbx), %rax
	movq	%rax, 2552(%rcx)
	movq	1024(%rbx), %rax
	movq	%rax, 2560(%rcx)
	movq	1032(%rbx), %rax
	movq	%rax, 2568(%rcx)
	movq	1040(%rbx), %rax
	movq	%rax, 2576(%rcx)
	movq	1048(%rbx), %rax
	movq	%rax, 2584(%rcx)
	movq	1056(%rbx), %rax
	movq	%rax, 2592(%rcx)
	movq	1064(%rbx), %rax
	movq	%rax, 2600(%rcx)
	movq	1072(%rbx), %rax
	movq	%rax, 2608(%rcx)
	movq	1080(%rbx), %rax
	movq	%rax, 2616(%rcx)
	movq	1088(%rbx), %rax
	movq	%rax, 2624(%rcx)
	movq	1096(%rbx), %rax
	movq	%rax, 2632(%rcx)
	movq	1104(%rbx), %rax
	movq	%rax, 2640(%rcx)
	movq	1112(%rbx), %rax
	movq	%rax, 2648(%rcx)
	movq	1120(%rbx), %rax
	movq	%rax, 2656(%rcx)
	movq	1128(%rbx), %rax
	movq	%rax, 2664(%rcx)
	movq	1136(%rbx), %rax
	movq	%rax, 2672(%rcx)
	movq	1144(%rbx), %rax
	movq	%rax, 2680(%rcx)
	movq	1152(%rbx), %rax
	movq	%rax, 2688(%rcx)
	movq	1160(%rbx), %rax
	movq	%rax, 2696(%rcx)
	movq	1168(%rbx), %rax
	movq	%rax, 2704(%rcx)
	movq	1176(%rbx), %rax
	movq	%rax, 2712(%rcx)
	movq	1184(%rbx), %rax
	movq	%rax, 2720(%rcx)
	movq	1192(%rbx), %rax
	movq	%rax, 2728(%rcx)
	movq	1200(%rbx), %rax
	movq	%rax, 2736(%rcx)
	movq	1208(%rbx), %rax
	movq	%rax, 2744(%rcx)
	movq	1216(%rbx), %rax
	movq	%rax, 2752(%rcx)
	movq	1224(%rbx), %rax
	movq	%rax, 2760(%rcx)
	movq	1232(%rbx), %rax
	movq	%rax, 2768(%rcx)
	movq	1240(%rbx), %rax
	movq	%rax, 2776(%rcx)
	movq	1248(%rbx), %rax
	movq	%rax, 2784(%rcx)
	movq	1256(%rbx), %rax
	movq	%rax, 2792(%rcx)
	movq	1264(%rbx), %rax
	movq	%rax, 2800(%rcx)
	movq	1272(%rbx), %rax
	movq	%rax, 2808(%rcx)
	movq	1280(%rbx), %rax
	movq	%rax, 2816(%rcx)
	movq	1288(%rbx), %rax
	movq	%rax, 2824(%rcx)
	movq	1296(%rbx), %rax
	movq	%rax, 2832(%rcx)
	movq	1304(%rbx), %rax
	movq	%rax, 2840(%rcx)
	movq	1312(%rbx), %rax
	movq	%rax, 2848(%rcx)
	movq	1320(%rbx), %rax
	movq	%rax, 2856(%rcx)
	movq	1328(%rbx), %rax
	movq	%rax, 2864(%rcx)
	movq	1336(%rbx), %rax
	movq	%rax, 2872(%rcx)
	movq	1344(%rbx), %rax
	movq	%rax, 2880(%rcx)
	movq	1352(%rbx), %rax
	movq	%rax, 2888(%rcx)
	movq	1360(%rbx), %rax
	movq	%rax, 2896(%rcx)
	movq	1368(%rbx), %rax
	movq	%rax, 2904(%rcx)
	movq	1376(%rbx), %rax
	movq	%rax, 2912(%rcx)
	movq	1384(%rbx), %rax
	movq	%rax, 2920(%rcx)
	movq	1392(%rbx), %rax
	movq	%rax, 2928(%rcx)
	movq	1400(%rbx), %rax
	movq	%rax, 2936(%rcx)
	movq	1408(%rbx), %rax
	movq	%rax, 2944(%rcx)
	movq	1416(%rbx), %rax
	movq	%rax, 2952(%rcx)
	movq	1424(%rbx), %rax
	movq	%rax, 2960(%rcx)
	movq	1432(%rbx), %rax
	movq	%rax, 2968(%rcx)
	movq	1440(%rbx), %rax
	movq	%rax, 2976(%rcx)
	movq	1448(%rbx), %rax
	movq	%rax, 2984(%rcx)
	movq	1456(%rbx), %rax
	movq	%rax, 2992(%rcx)
	movq	1464(%rbx), %rax
	movq	%rax, 3000(%rcx)
	movq	1472(%rbx), %rax
	movq	%rax, 3008(%rcx)
	movq	1480(%rbx), %rax
	movq	%rax, 3016(%rcx)
	movq	1488(%rbx), %rax
	movq	%rax, 3024(%rcx)
	movq	1496(%rbx), %rax
	movq	%rax, 3032(%rcx)
	movq	1504(%rbx), %rax
	movq	%rax, 3040(%rcx)
	movq	1512(%rbx), %rax
	movq	%rax, 3048(%rcx)
	movq	1520(%rbx), %rax
	movq	%rax, 3056(%rcx)
	movq	1528(%rbx), %rax
	movq	%rax, 3064(%rcx)
	movq	1536(%rbx), %rax
	movq	%rax, 3072(%rcx)
	movq	1544(%rbx), %rax
	movq	%rax, 3080(%rcx)
	movq	1552(%rbx), %rax
	movq	%rax, 3088(%rcx)
	movq	1560(%rbx), %rax
	movq	%rax, 3096(%rcx)
	movq	%rcx, %mm2
	leaq	48(%rsp), %rsi
	leaq	-224(%rsp), %rsp
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$1:
	leaq	224(%rsp), %rsp
	movq	%mm2, %rdx
	movq	48(%rsp), %rax
	movq	%rax, 3104(%rdx)
	movq	56(%rsp), %rax
	movq	%rax, 3112(%rdx)
	movq	64(%rsp), %rax
	movq	%rax, 3120(%rdx)
	movq	72(%rsp), %rax
	movq	%rax, 3128(%rdx)
	movq	%mm0, %rax
	leaq	32(%rax), %rax
	movq	(%rax), %rcx
	movq	%rcx, 3136(%rdx)
	movq	8(%rax), %rcx
	movq	%rcx, 3144(%rdx)
	movq	16(%rax), %rcx
	movq	%rcx, 3152(%rdx)
	movq	24(%rax), %rax
	movq	%rax, 3160(%rdx)
	xorl	%eax, %eax
	movq	15504(%rsp), %rbx
	movq	15512(%rsp), %rbp
	movq	15520(%rsp), %r12
	movq	15528(%rsp), %r13
	movq	15536(%rsp), %r14
	movq	15544(%rsp), %r15
	movq	15552(%rsp), %rsp
	ret
	.type	jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand, %function
jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand:
	movq	%rsp, %rax
	leaq	-15496(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 15440(%rsp)
	movq	%rbp, 15448(%rsp)
	movq	%r12, 15456(%rsp)
	movq	%r13, 15464(%rsp)
	movq	%r14, 15472(%rsp)
	movq	%r15, 15480(%rsp)
	movq	%rax, 15488(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdx, %mm0
	movq	%rsi, %rax
	movq	%rsi, %mm2
	movq	%rdi, (%rsp)
	movq	%rax, 8(%rsp)
	movq	(%rdx), %rax
	movq	%rax, 80(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 88(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 96(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 104(%rsp)
	movb	$4, 112(%rsp)
	leaq	160(%rsp), %rsi
	leaq	80(%rsp), %rbx
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$366:
	leaq	224(%rsp), %rsp
	movq	160(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	192(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	168(%rsp), %rax
	movq	%rax, 56(%rsp)
	movq	200(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	176(%rsp), %rax
	movq	%rax, 64(%rsp)
	movq	208(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	184(%rsp), %rax
	movq	%rax, 72(%rsp)
	movq	216(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	$0, %rax
	movq	%rax, %mm5
	movb	48(%rsp), %sil
	movb	%sil, 120(%rsp)
	movb	49(%rsp), %sil
	movb	%sil, 121(%rsp)
	movb	50(%rsp), %sil
	movb	%sil, 122(%rsp)
	movb	51(%rsp), %sil
	movb	%sil, 123(%rsp)
	movb	52(%rsp), %sil
	movb	%sil, 124(%rsp)
	movb	53(%rsp), %sil
	movb	%sil, 125(%rsp)
	movb	54(%rsp), %sil
	movb	%sil, 126(%rsp)
	movb	55(%rsp), %sil
	movb	%sil, 127(%rsp)
	movb	56(%rsp), %sil
	movb	%sil, 128(%rsp)
	movb	57(%rsp), %sil
	movb	%sil, 129(%rsp)
	movb	58(%rsp), %sil
	movb	%sil, 130(%rsp)
	movb	59(%rsp), %sil
	movb	%sil, 131(%rsp)
	movb	60(%rsp), %sil
	movb	%sil, 132(%rsp)
	movb	61(%rsp), %sil
	movb	%sil, 133(%rsp)
	movb	62(%rsp), %sil
	movb	%sil, 134(%rsp)
	movb	63(%rsp), %sil
	movb	%sil, 135(%rsp)
	movb	64(%rsp), %sil
	movb	%sil, 136(%rsp)
	movb	65(%rsp), %sil
	movb	%sil, 137(%rsp)
	movb	66(%rsp), %sil
	movb	%sil, 138(%rsp)
	movb	67(%rsp), %sil
	movb	%sil, 139(%rsp)
	movb	68(%rsp), %sil
	movb	%sil, 140(%rsp)
	movb	69(%rsp), %sil
	movb	%sil, 141(%rsp)
	movb	70(%rsp), %sil
	movb	%sil, 142(%rsp)
	movb	71(%rsp), %sil
	movb	%sil, 143(%rsp)
	movb	72(%rsp), %sil
	movb	%sil, 144(%rsp)
	movb	73(%rsp), %sil
	movb	%sil, 145(%rsp)
	movb	74(%rsp), %sil
	movb	%sil, 146(%rsp)
	movb	75(%rsp), %sil
	movb	%sil, 147(%rsp)
	movb	76(%rsp), %sil
	movb	%sil, 148(%rsp)
	movb	77(%rsp), %sil
	movb	%sil, 149(%rsp)
	movb	78(%rsp), %sil
	movb	%sil, 150(%rsp)
	movb	79(%rsp), %sil
	movb	%sil, 151(%rsp)
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$364
	movb	$0, 152(%rsp)
	movb	$0, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$365
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$364:
	movb	$0, 152(%rsp)
	movb	$0, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$365:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$363:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$350
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$351:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$362:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$353:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$354
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$354:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$360
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$361
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$360:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$361:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$356
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$356:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$358
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$358:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$359:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$357:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$355:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$352:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$353
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$350:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$351
	movq	$0, %rcx
	leaq	7248(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$348
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$349:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$348:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$349
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$346
	movb	$0, 152(%rsp)
	movb	$1, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$347
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$346:
	movb	$1, 152(%rsp)
	movb	$0, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$347:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$345:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$332
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$333:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$344:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$335:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$336
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$336:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$342
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$343
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$342:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$343:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$338
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$338:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$340
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$340:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$341:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$339:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$337:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$334:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$335
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$332:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$333
	movq	$0, %rcx
	leaq	7760(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$330
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$331:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$330:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$331
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$328
	movb	$0, 152(%rsp)
	movb	$2, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$329
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$328:
	movb	$2, 152(%rsp)
	movb	$0, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$329:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$327:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$314
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$315:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$326:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$317:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$318
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$318:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$324
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$325
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$324:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$325:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$320
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$320:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$322
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$322:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$323:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$321:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$319:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$316:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$317
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$314:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$315
	movq	$0, %rcx
	leaq	8272(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$312
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$313:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$312:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$313
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$310
	movb	$0, 152(%rsp)
	movb	$3, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$311
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$310:
	movb	$3, 152(%rsp)
	movb	$0, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$311:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$309:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$296
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$297:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$308:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$299:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$300
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$300:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$306
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$307
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$306:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$307:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$302
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$302:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$304
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$304:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$305:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$303:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$301:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$298:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$299
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$296:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$297
	movq	$0, %rcx
	leaq	8784(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$294
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$295:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$294:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$295
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$292
	movb	$1, 152(%rsp)
	movb	$0, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$293
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$292:
	movb	$0, 152(%rsp)
	movb	$1, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$293:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$291:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$278
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$279:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$290:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$281:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$282
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$282:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$288
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$289
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$288:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$289:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$284
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$284:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$286
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$286:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$287:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$285:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$283:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$280:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$281
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$278:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$279
	movq	$0, %rcx
	leaq	9296(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$276
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$277:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$276:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$277
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$274
	movb	$1, 152(%rsp)
	movb	$1, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$275
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$274:
	movb	$1, 152(%rsp)
	movb	$1, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$275:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$273:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$260
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$261:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$272:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$262
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$263:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$264
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$262
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$264:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$270
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$271
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$270:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$271:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$266
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$262
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$266:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$268
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$262
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$268:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$269:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$267:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$265:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$262:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$263
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$260:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$261
	movq	$0, %rcx
	leaq	9808(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$258
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$259:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$258:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$259
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$256
	movb	$1, 152(%rsp)
	movb	$2, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$257
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$256:
	movb	$2, 152(%rsp)
	movb	$1, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$257:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$255:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$242
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$243:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$254:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$244
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$245:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$246
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$244
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$246:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$252
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$253
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$252:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$253:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$248
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$244
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$248:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$250
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$244
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$250:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$251:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$249:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$247:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$244:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$245
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$242:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$243
	movq	$0, %rcx
	leaq	10320(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$240
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$241:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$240:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$241
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$238
	movb	$1, 152(%rsp)
	movb	$3, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$239
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$238:
	movb	$3, 152(%rsp)
	movb	$1, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$239:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$237:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$224
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$225:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$236:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$226
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$227:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$228
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$226
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$228:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$234
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$235
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$234:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$235:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$230
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$226
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$230:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$232
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$226
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$232:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$233:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$231:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$229:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$226:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$227
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$224:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$225
	movq	$0, %rcx
	leaq	10832(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$222
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$223:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$222:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$223
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$220
	movb	$2, 152(%rsp)
	movb	$0, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$221
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$220:
	movb	$0, 152(%rsp)
	movb	$2, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$221:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$219:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$206
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$207:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$218:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$208
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$209:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$210
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$208
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$210:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$216
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$217
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$216:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$217:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$212
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$208
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$212:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$214
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$208
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$214:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$215:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$213:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$211:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$208:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$209
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$206:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$207
	movq	$0, %rcx
	leaq	11344(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$204
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$205:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$204:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$205
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$202
	movb	$2, 152(%rsp)
	movb	$1, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$203
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$202:
	movb	$1, 152(%rsp)
	movb	$2, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$203:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$201:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$188
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$189:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$200:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$190
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$191:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$192
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$190
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$192:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$198
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$199
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$198:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$199:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$194
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$190
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$194:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$196
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$190
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$196:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$197:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$195:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$193:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$190:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$191
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$188:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$189
	movq	$0, %rcx
	leaq	11856(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$186
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$187:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$186:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$187
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$184
	movb	$2, 152(%rsp)
	movb	$2, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$185
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$184:
	movb	$2, 152(%rsp)
	movb	$2, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$185:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$183:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$170
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$171:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$182:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$172
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$173:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$174
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$172
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$174:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$180
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$181
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$180:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$181:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$176
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$172
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$176:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$178
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$172
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$178:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$179:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$177:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$175:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$172:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$173
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$170:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$171
	movq	$0, %rcx
	leaq	12368(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$168
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$169:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$168:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$169
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$166
	movb	$2, 152(%rsp)
	movb	$3, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$167
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$166:
	movb	$3, 152(%rsp)
	movb	$2, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$167:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$165:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$152
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$153:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$164:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$154
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$155:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$156
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$154
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$156:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$162
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$163
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$162:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$163:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$158
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$154
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$158:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$160
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$154
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$160:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$161:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$159:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$157:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$154:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$155
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$152:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$153
	movq	$0, %rcx
	leaq	12880(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$150
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$151:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$150:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$151
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$148
	movb	$3, 152(%rsp)
	movb	$0, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$149
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$148:
	movb	$0, 152(%rsp)
	movb	$3, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$149:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$147:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$134
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$135:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$146:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$136
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$137:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$138
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$136
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$138:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$144
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$145
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$144:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$145:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$140
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$136
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$140:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$142
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$136
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$142:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$143:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$141:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$139:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$136:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$137
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$134:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$135
	movq	$0, %rcx
	leaq	13392(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$132
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$133:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$132:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$133
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$130
	movb	$3, 152(%rsp)
	movb	$1, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$131
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$130:
	movb	$1, 152(%rsp)
	movb	$3, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$131:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$129:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$116
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$117:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$128:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$118
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$119:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$120
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$118
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$120:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$126
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$127
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$126:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$127:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$122
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$118
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$122:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$124
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$118
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$124:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$125:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$123:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$121:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$118:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$119
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$116:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$117
	movq	$0, %rcx
	leaq	13904(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$114
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$115:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$114:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$115
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$112
	movb	$3, 152(%rsp)
	movb	$2, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$113
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$112:
	movb	$2, 152(%rsp)
	movb	$3, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$113:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$111:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$98
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$99:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$110:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$100
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$101:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$102
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$100
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$102:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$108
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$109
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$108:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$109:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$104
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$100
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$104:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$106
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$100
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$106:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$107:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$105:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$103:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$100:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$101
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$98:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$99
	movq	$0, %rcx
	leaq	14416(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$96
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$97:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$96:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$97
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$94
	movb	$3, 152(%rsp)
	movb	$3, 153(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$95
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$94:
	movb	$3, 152(%rsp)
	movb	$3, 153(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$95:
	leaq	392(%rsp), %rdx
	leaq	120(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$93:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$80
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$81:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$92:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$82
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$83:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$84
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$82
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$84:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	224(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	225(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	226(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$90
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$91
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$90:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$91:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$86
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$82
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$86:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$88
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$82
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$88:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 592(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$89:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$87:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$85:
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$82:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$83
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$80:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$81
	movq	$0, %rcx
	leaq	14928(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$78
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$79:
	movw	592(%rsp,%rcx,2), %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$78:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$79
	movb	$0, %al
	leaq	1104(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$77:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	1616(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$76:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	2128(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$75:
	leaq	176(%rsp), %rsp
	movb	$3, %al
	leaq	2640(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$74:
	leaq	176(%rsp), %rsp
	movb	$4, %al
	leaq	3152(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$73:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	3664(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$72:
	leaq	176(%rsp), %rsp
	movb	$6, %al
	leaq	4176(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$71:
	leaq	176(%rsp), %rsp
	movb	$7, %al
	leaq	4688(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$70:
	leaq	176(%rsp), %rsp
	leaq	1104(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$69:
	leaq	1616(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$68:
	leaq	2128(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$67:
	leaq	2640(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$66:
	leaq	3152(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$65:
	leaq	3664(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$64:
	leaq	4176(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$63:
	leaq	4688(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$62:
	leaq	5200(%rsp), %rdx
	leaq	7248(%rsp), %rax
	leaq	1104(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$61:
	leaq	16(%rsp), %rsp
	leaq	592(%rsp), %rdx
	leaq	7760(%rsp), %rax
	leaq	1616(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$60:
	leaq	16(%rsp), %rsp
	leaq	5200(%rsp), %rax
	leaq	592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$59:
	leaq	592(%rsp), %rdx
	leaq	8272(%rsp), %rax
	leaq	2128(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$58:
	leaq	16(%rsp), %rsp
	leaq	5200(%rsp), %rax
	leaq	592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$57:
	leaq	592(%rsp), %rdx
	leaq	8784(%rsp), %rax
	leaq	2640(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$56:
	leaq	16(%rsp), %rsp
	leaq	5200(%rsp), %rax
	leaq	592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$55:
	leaq	5200(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$53
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$54:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$53:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$54
	leaq	5200(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$52:
	leaq	5712(%rsp), %rdx
	leaq	9296(%rsp), %rax
	leaq	1104(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$51:
	leaq	16(%rsp), %rsp
	leaq	592(%rsp), %rdx
	leaq	9808(%rsp), %rax
	leaq	1616(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$50:
	leaq	16(%rsp), %rsp
	leaq	5712(%rsp), %rax
	leaq	592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$49:
	leaq	592(%rsp), %rdx
	leaq	10320(%rsp), %rax
	leaq	2128(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$48:
	leaq	16(%rsp), %rsp
	leaq	5712(%rsp), %rax
	leaq	592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$47:
	leaq	592(%rsp), %rdx
	leaq	10832(%rsp), %rax
	leaq	2640(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$46:
	leaq	16(%rsp), %rsp
	leaq	5712(%rsp), %rax
	leaq	592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$45:
	leaq	5712(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$43
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$44:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$43:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$44
	leaq	5712(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$42:
	leaq	6224(%rsp), %rdx
	leaq	11344(%rsp), %rax
	leaq	1104(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$41:
	leaq	16(%rsp), %rsp
	leaq	592(%rsp), %rdx
	leaq	11856(%rsp), %rax
	leaq	1616(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$40:
	leaq	16(%rsp), %rsp
	leaq	6224(%rsp), %rax
	leaq	592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$39:
	leaq	592(%rsp), %rdx
	leaq	12368(%rsp), %rax
	leaq	2128(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$38:
	leaq	16(%rsp), %rsp
	leaq	6224(%rsp), %rax
	leaq	592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$37:
	leaq	592(%rsp), %rdx
	leaq	12880(%rsp), %rax
	leaq	2640(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$36:
	leaq	16(%rsp), %rsp
	leaq	6224(%rsp), %rax
	leaq	592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$35:
	leaq	6224(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$33
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$34:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$33:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$34
	leaq	6224(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$32:
	leaq	6736(%rsp), %rdx
	leaq	13392(%rsp), %rax
	leaq	1104(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$31:
	leaq	16(%rsp), %rsp
	leaq	592(%rsp), %rdx
	leaq	13904(%rsp), %rax
	leaq	1616(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$30:
	leaq	16(%rsp), %rsp
	leaq	6736(%rsp), %rax
	leaq	592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$29:
	leaq	592(%rsp), %rdx
	leaq	14416(%rsp), %rax
	leaq	2128(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$28:
	leaq	16(%rsp), %rsp
	leaq	6736(%rsp), %rax
	leaq	592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$27:
	leaq	592(%rsp), %rdx
	leaq	14928(%rsp), %rax
	leaq	2640(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$26:
	leaq	16(%rsp), %rsp
	leaq	6736(%rsp), %rax
	leaq	592(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$25:
	leaq	6736(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$23
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$24:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$23:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$24
	leaq	6736(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$22:
	leaq	5200(%rsp), %rax
	leaq	3152(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$21:
	leaq	5712(%rsp), %rax
	leaq	3664(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$20:
	leaq	6224(%rsp), %rax
	leaq	4176(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$19:
	leaq	6736(%rsp), %rax
	leaq	4688(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$18:
	leaq	5200(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$16
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$17:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$16:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$17
	leaq	5712(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$14
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$15:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$14:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$15
	leaq	6224(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$12
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$13:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$12:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$13
	leaq	6736(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$10
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$11:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$10:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$11
	movq	(%rsp), %rbx
	movq	8(%rsp), %rdx
	movq	%rdx, %r10
	leaq	1104(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$9:
	leaq	384(%rdx), %r10
	leaq	1616(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$8:
	leaq	768(%rdx), %r10
	leaq	2128(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$7:
	leaq	1152(%rdx), %r10
	leaq	2640(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$6:
	movq	%rbx, %rdx
	movq	%rdx, %r10
	leaq	5200(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$5:
	leaq	384(%rdx), %r10
	leaq	5712(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$4:
	leaq	768(%rdx), %r10
	leaq	6224(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$3:
	leaq	1152(%rdx), %r10
	leaq	6736(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$2:
	movq	48(%rsp), %rax
	movq	%rax, 1536(%rbx)
	movq	56(%rsp), %rax
	movq	%rax, 1544(%rbx)
	movq	64(%rsp), %rax
	movq	%rax, 1552(%rbx)
	movq	72(%rsp), %rax
	movq	%rax, 1560(%rbx)
	movq	%mm2, %rcx
	movq	(%rbx), %rax
	movq	%rax, 1536(%rcx)
	movq	8(%rbx), %rax
	movq	%rax, 1544(%rcx)
	movq	16(%rbx), %rax
	movq	%rax, 1552(%rcx)
	movq	24(%rbx), %rax
	movq	%rax, 1560(%rcx)
	movq	32(%rbx), %rax
	movq	%rax, 1568(%rcx)
	movq	40(%rbx), %rax
	movq	%rax, 1576(%rcx)
	movq	48(%rbx), %rax
	movq	%rax, 1584(%rcx)
	movq	56(%rbx), %rax
	movq	%rax, 1592(%rcx)
	movq	64(%rbx), %rax
	movq	%rax, 1600(%rcx)
	movq	72(%rbx), %rax
	movq	%rax, 1608(%rcx)
	movq	80(%rbx), %rax
	movq	%rax, 1616(%rcx)
	movq	88(%rbx), %rax
	movq	%rax, 1624(%rcx)
	movq	96(%rbx), %rax
	movq	%rax, 1632(%rcx)
	movq	104(%rbx), %rax
	movq	%rax, 1640(%rcx)
	movq	112(%rbx), %rax
	movq	%rax, 1648(%rcx)
	movq	120(%rbx), %rax
	movq	%rax, 1656(%rcx)
	movq	128(%rbx), %rax
	movq	%rax, 1664(%rcx)
	movq	136(%rbx), %rax
	movq	%rax, 1672(%rcx)
	movq	144(%rbx), %rax
	movq	%rax, 1680(%rcx)
	movq	152(%rbx), %rax
	movq	%rax, 1688(%rcx)
	movq	160(%rbx), %rax
	movq	%rax, 1696(%rcx)
	movq	168(%rbx), %rax
	movq	%rax, 1704(%rcx)
	movq	176(%rbx), %rax
	movq	%rax, 1712(%rcx)
	movq	184(%rbx), %rax
	movq	%rax, 1720(%rcx)
	movq	192(%rbx), %rax
	movq	%rax, 1728(%rcx)
	movq	200(%rbx), %rax
	movq	%rax, 1736(%rcx)
	movq	208(%rbx), %rax
	movq	%rax, 1744(%rcx)
	movq	216(%rbx), %rax
	movq	%rax, 1752(%rcx)
	movq	224(%rbx), %rax
	movq	%rax, 1760(%rcx)
	movq	232(%rbx), %rax
	movq	%rax, 1768(%rcx)
	movq	240(%rbx), %rax
	movq	%rax, 1776(%rcx)
	movq	248(%rbx), %rax
	movq	%rax, 1784(%rcx)
	movq	256(%rbx), %rax
	movq	%rax, 1792(%rcx)
	movq	264(%rbx), %rax
	movq	%rax, 1800(%rcx)
	movq	272(%rbx), %rax
	movq	%rax, 1808(%rcx)
	movq	280(%rbx), %rax
	movq	%rax, 1816(%rcx)
	movq	288(%rbx), %rax
	movq	%rax, 1824(%rcx)
	movq	296(%rbx), %rax
	movq	%rax, 1832(%rcx)
	movq	304(%rbx), %rax
	movq	%rax, 1840(%rcx)
	movq	312(%rbx), %rax
	movq	%rax, 1848(%rcx)
	movq	320(%rbx), %rax
	movq	%rax, 1856(%rcx)
	movq	328(%rbx), %rax
	movq	%rax, 1864(%rcx)
	movq	336(%rbx), %rax
	movq	%rax, 1872(%rcx)
	movq	344(%rbx), %rax
	movq	%rax, 1880(%rcx)
	movq	352(%rbx), %rax
	movq	%rax, 1888(%rcx)
	movq	360(%rbx), %rax
	movq	%rax, 1896(%rcx)
	movq	368(%rbx), %rax
	movq	%rax, 1904(%rcx)
	movq	376(%rbx), %rax
	movq	%rax, 1912(%rcx)
	movq	384(%rbx), %rax
	movq	%rax, 1920(%rcx)
	movq	392(%rbx), %rax
	movq	%rax, 1928(%rcx)
	movq	400(%rbx), %rax
	movq	%rax, 1936(%rcx)
	movq	408(%rbx), %rax
	movq	%rax, 1944(%rcx)
	movq	416(%rbx), %rax
	movq	%rax, 1952(%rcx)
	movq	424(%rbx), %rax
	movq	%rax, 1960(%rcx)
	movq	432(%rbx), %rax
	movq	%rax, 1968(%rcx)
	movq	440(%rbx), %rax
	movq	%rax, 1976(%rcx)
	movq	448(%rbx), %rax
	movq	%rax, 1984(%rcx)
	movq	456(%rbx), %rax
	movq	%rax, 1992(%rcx)
	movq	464(%rbx), %rax
	movq	%rax, 2000(%rcx)
	movq	472(%rbx), %rax
	movq	%rax, 2008(%rcx)
	movq	480(%rbx), %rax
	movq	%rax, 2016(%rcx)
	movq	488(%rbx), %rax
	movq	%rax, 2024(%rcx)
	movq	496(%rbx), %rax
	movq	%rax, 2032(%rcx)
	movq	504(%rbx), %rax
	movq	%rax, 2040(%rcx)
	movq	512(%rbx), %rax
	movq	%rax, 2048(%rcx)
	movq	520(%rbx), %rax
	movq	%rax, 2056(%rcx)
	movq	528(%rbx), %rax
	movq	%rax, 2064(%rcx)
	movq	536(%rbx), %rax
	movq	%rax, 2072(%rcx)
	movq	544(%rbx), %rax
	movq	%rax, 2080(%rcx)
	movq	552(%rbx), %rax
	movq	%rax, 2088(%rcx)
	movq	560(%rbx), %rax
	movq	%rax, 2096(%rcx)
	movq	568(%rbx), %rax
	movq	%rax, 2104(%rcx)
	movq	576(%rbx), %rax
	movq	%rax, 2112(%rcx)
	movq	584(%rbx), %rax
	movq	%rax, 2120(%rcx)
	movq	592(%rbx), %rax
	movq	%rax, 2128(%rcx)
	movq	600(%rbx), %rax
	movq	%rax, 2136(%rcx)
	movq	608(%rbx), %rax
	movq	%rax, 2144(%rcx)
	movq	616(%rbx), %rax
	movq	%rax, 2152(%rcx)
	movq	624(%rbx), %rax
	movq	%rax, 2160(%rcx)
	movq	632(%rbx), %rax
	movq	%rax, 2168(%rcx)
	movq	640(%rbx), %rax
	movq	%rax, 2176(%rcx)
	movq	648(%rbx), %rax
	movq	%rax, 2184(%rcx)
	movq	656(%rbx), %rax
	movq	%rax, 2192(%rcx)
	movq	664(%rbx), %rax
	movq	%rax, 2200(%rcx)
	movq	672(%rbx), %rax
	movq	%rax, 2208(%rcx)
	movq	680(%rbx), %rax
	movq	%rax, 2216(%rcx)
	movq	688(%rbx), %rax
	movq	%rax, 2224(%rcx)
	movq	696(%rbx), %rax
	movq	%rax, 2232(%rcx)
	movq	704(%rbx), %rax
	movq	%rax, 2240(%rcx)
	movq	712(%rbx), %rax
	movq	%rax, 2248(%rcx)
	movq	720(%rbx), %rax
	movq	%rax, 2256(%rcx)
	movq	728(%rbx), %rax
	movq	%rax, 2264(%rcx)
	movq	736(%rbx), %rax
	movq	%rax, 2272(%rcx)
	movq	744(%rbx), %rax
	movq	%rax, 2280(%rcx)
	movq	752(%rbx), %rax
	movq	%rax, 2288(%rcx)
	movq	760(%rbx), %rax
	movq	%rax, 2296(%rcx)
	movq	768(%rbx), %rax
	movq	%rax, 2304(%rcx)
	movq	776(%rbx), %rax
	movq	%rax, 2312(%rcx)
	movq	784(%rbx), %rax
	movq	%rax, 2320(%rcx)
	movq	792(%rbx), %rax
	movq	%rax, 2328(%rcx)
	movq	800(%rbx), %rax
	movq	%rax, 2336(%rcx)
	movq	808(%rbx), %rax
	movq	%rax, 2344(%rcx)
	movq	816(%rbx), %rax
	movq	%rax, 2352(%rcx)
	movq	824(%rbx), %rax
	movq	%rax, 2360(%rcx)
	movq	832(%rbx), %rax
	movq	%rax, 2368(%rcx)
	movq	840(%rbx), %rax
	movq	%rax, 2376(%rcx)
	movq	848(%rbx), %rax
	movq	%rax, 2384(%rcx)
	movq	856(%rbx), %rax
	movq	%rax, 2392(%rcx)
	movq	864(%rbx), %rax
	movq	%rax, 2400(%rcx)
	movq	872(%rbx), %rax
	movq	%rax, 2408(%rcx)
	movq	880(%rbx), %rax
	movq	%rax, 2416(%rcx)
	movq	888(%rbx), %rax
	movq	%rax, 2424(%rcx)
	movq	896(%rbx), %rax
	movq	%rax, 2432(%rcx)
	movq	904(%rbx), %rax
	movq	%rax, 2440(%rcx)
	movq	912(%rbx), %rax
	movq	%rax, 2448(%rcx)
	movq	920(%rbx), %rax
	movq	%rax, 2456(%rcx)
	movq	928(%rbx), %rax
	movq	%rax, 2464(%rcx)
	movq	936(%rbx), %rax
	movq	%rax, 2472(%rcx)
	movq	944(%rbx), %rax
	movq	%rax, 2480(%rcx)
	movq	952(%rbx), %rax
	movq	%rax, 2488(%rcx)
	movq	960(%rbx), %rax
	movq	%rax, 2496(%rcx)
	movq	968(%rbx), %rax
	movq	%rax, 2504(%rcx)
	movq	976(%rbx), %rax
	movq	%rax, 2512(%rcx)
	movq	984(%rbx), %rax
	movq	%rax, 2520(%rcx)
	movq	992(%rbx), %rax
	movq	%rax, 2528(%rcx)
	movq	1000(%rbx), %rax
	movq	%rax, 2536(%rcx)
	movq	1008(%rbx), %rax
	movq	%rax, 2544(%rcx)
	movq	1016(%rbx), %rax
	movq	%rax, 2552(%rcx)
	movq	1024(%rbx), %rax
	movq	%rax, 2560(%rcx)
	movq	1032(%rbx), %rax
	movq	%rax, 2568(%rcx)
	movq	1040(%rbx), %rax
	movq	%rax, 2576(%rcx)
	movq	1048(%rbx), %rax
	movq	%rax, 2584(%rcx)
	movq	1056(%rbx), %rax
	movq	%rax, 2592(%rcx)
	movq	1064(%rbx), %rax
	movq	%rax, 2600(%rcx)
	movq	1072(%rbx), %rax
	movq	%rax, 2608(%rcx)
	movq	1080(%rbx), %rax
	movq	%rax, 2616(%rcx)
	movq	1088(%rbx), %rax
	movq	%rax, 2624(%rcx)
	movq	1096(%rbx), %rax
	movq	%rax, 2632(%rcx)
	movq	1104(%rbx), %rax
	movq	%rax, 2640(%rcx)
	movq	1112(%rbx), %rax
	movq	%rax, 2648(%rcx)
	movq	1120(%rbx), %rax
	movq	%rax, 2656(%rcx)
	movq	1128(%rbx), %rax
	movq	%rax, 2664(%rcx)
	movq	1136(%rbx), %rax
	movq	%rax, 2672(%rcx)
	movq	1144(%rbx), %rax
	movq	%rax, 2680(%rcx)
	movq	1152(%rbx), %rax
	movq	%rax, 2688(%rcx)
	movq	1160(%rbx), %rax
	movq	%rax, 2696(%rcx)
	movq	1168(%rbx), %rax
	movq	%rax, 2704(%rcx)
	movq	1176(%rbx), %rax
	movq	%rax, 2712(%rcx)
	movq	1184(%rbx), %rax
	movq	%rax, 2720(%rcx)
	movq	1192(%rbx), %rax
	movq	%rax, 2728(%rcx)
	movq	1200(%rbx), %rax
	movq	%rax, 2736(%rcx)
	movq	1208(%rbx), %rax
	movq	%rax, 2744(%rcx)
	movq	1216(%rbx), %rax
	movq	%rax, 2752(%rcx)
	movq	1224(%rbx), %rax
	movq	%rax, 2760(%rcx)
	movq	1232(%rbx), %rax
	movq	%rax, 2768(%rcx)
	movq	1240(%rbx), %rax
	movq	%rax, 2776(%rcx)
	movq	1248(%rbx), %rax
	movq	%rax, 2784(%rcx)
	movq	1256(%rbx), %rax
	movq	%rax, 2792(%rcx)
	movq	1264(%rbx), %rax
	movq	%rax, 2800(%rcx)
	movq	1272(%rbx), %rax
	movq	%rax, 2808(%rcx)
	movq	1280(%rbx), %rax
	movq	%rax, 2816(%rcx)
	movq	1288(%rbx), %rax
	movq	%rax, 2824(%rcx)
	movq	1296(%rbx), %rax
	movq	%rax, 2832(%rcx)
	movq	1304(%rbx), %rax
	movq	%rax, 2840(%rcx)
	movq	1312(%rbx), %rax
	movq	%rax, 2848(%rcx)
	movq	1320(%rbx), %rax
	movq	%rax, 2856(%rcx)
	movq	1328(%rbx), %rax
	movq	%rax, 2864(%rcx)
	movq	1336(%rbx), %rax
	movq	%rax, 2872(%rcx)
	movq	1344(%rbx), %rax
	movq	%rax, 2880(%rcx)
	movq	1352(%rbx), %rax
	movq	%rax, 2888(%rcx)
	movq	1360(%rbx), %rax
	movq	%rax, 2896(%rcx)
	movq	1368(%rbx), %rax
	movq	%rax, 2904(%rcx)
	movq	1376(%rbx), %rax
	movq	%rax, 2912(%rcx)
	movq	1384(%rbx), %rax
	movq	%rax, 2920(%rcx)
	movq	1392(%rbx), %rax
	movq	%rax, 2928(%rcx)
	movq	1400(%rbx), %rax
	movq	%rax, 2936(%rcx)
	movq	1408(%rbx), %rax
	movq	%rax, 2944(%rcx)
	movq	1416(%rbx), %rax
	movq	%rax, 2952(%rcx)
	movq	1424(%rbx), %rax
	movq	%rax, 2960(%rcx)
	movq	1432(%rbx), %rax
	movq	%rax, 2968(%rcx)
	movq	1440(%rbx), %rax
	movq	%rax, 2976(%rcx)
	movq	1448(%rbx), %rax
	movq	%rax, 2984(%rcx)
	movq	1456(%rbx), %rax
	movq	%rax, 2992(%rcx)
	movq	1464(%rbx), %rax
	movq	%rax, 3000(%rcx)
	movq	1472(%rbx), %rax
	movq	%rax, 3008(%rcx)
	movq	1480(%rbx), %rax
	movq	%rax, 3016(%rcx)
	movq	1488(%rbx), %rax
	movq	%rax, 3024(%rcx)
	movq	1496(%rbx), %rax
	movq	%rax, 3032(%rcx)
	movq	1504(%rbx), %rax
	movq	%rax, 3040(%rcx)
	movq	1512(%rbx), %rax
	movq	%rax, 3048(%rcx)
	movq	1520(%rbx), %rax
	movq	%rax, 3056(%rcx)
	movq	1528(%rbx), %rax
	movq	%rax, 3064(%rcx)
	movq	1536(%rbx), %rax
	movq	%rax, 3072(%rcx)
	movq	1544(%rbx), %rax
	movq	%rax, 3080(%rcx)
	movq	1552(%rbx), %rax
	movq	%rax, 3088(%rcx)
	movq	1560(%rbx), %rax
	movq	%rax, 3096(%rcx)
	movq	%rcx, %mm2
	leaq	48(%rsp), %rsi
	leaq	-224(%rsp), %rsp
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$1:
	leaq	224(%rsp), %rsp
	movq	%mm2, %rdx
	movq	48(%rsp), %rax
	movq	%rax, 3104(%rdx)
	movq	56(%rsp), %rax
	movq	%rax, 3112(%rdx)
	movq	64(%rsp), %rax
	movq	%rax, 3120(%rdx)
	movq	72(%rsp), %rax
	movq	%rax, 3128(%rdx)
	movq	%mm0, %rax
	leaq	32(%rax), %rax
	movq	(%rax), %rcx
	movq	%rcx, 3136(%rdx)
	movq	8(%rax), %rcx
	movq	%rcx, 3144(%rdx)
	movq	16(%rax), %rcx
	movq	%rcx, 3152(%rdx)
	movq	24(%rax), %rax
	movq	%rax, 3160(%rdx)
	xorl	%eax, %eax
	movq	15440(%rsp), %rbx
	movq	15448(%rsp), %rbp
	movq	15456(%rsp), %r12
	movq	15464(%rsp), %r13
	movq	15472(%rsp), %r14
	movq	15480(%rsp), %r15
	movq	15488(%rsp), %rsp
	ret
L_i_poly_decompress$1:
	movq	$0, %rdi
	movq	$0, %rsi
	jmp 	L_i_poly_decompress$2
L_i_poly_decompress$3:
	movb	(%rdx,%rdi), %r9b
	movb	%r9b, %r8b
	incq	%rdi
	shrb	$5, %r9b
	movb	(%rdx,%rdi), %r11b
	movb	%r11b, %r13b
	shlb	$3, %r11b
	orb 	%r11b, %r9b
	incq	%rdi
	shrb	$2, %r13b
	movb	%r13b, %r11b
	shrb	$5, %r13b
	movb	(%rdx,%rdi), %bl
	movb	%bl, %bpl
	shlb	$1, %bl
	orb 	%r13b, %bl
	incq	%rdi
	shrb	$4, %bpl
	movb	(%rdx,%rdi), %r12b
	movb	%r12b, %r13b
	shlb	$4, %r12b
	orb 	%bpl, %r12b
	movb	%r12b, %bpl
	incq	%rdi
	movb	%r13b, %r14b
	shrb	$1, %r14b
	movb	%r14b, %r12b
	shrb	$5, %r14b
	movb	(%rdx,%rdi), %r15b
	movb	%r15b, %r13b
	shlb	$2, %r15b
	orb 	%r14b, %r15b
	movb	%r15b, %r14b
	incq	%rdi
	shrb	$3, %r13b
	movzbl	%r8b, %r8d
	andl	$31, %r8d
	imull	$3329, %r8d, %r8d
	addl	$16, %r8d
	shrl	$5, %r8d
	movw	%r8w, (%rcx,%rsi,2)
	movzbl	%r9b, %r8d
	andl	$31, %r8d
	imull	$3329, %r8d, %r8d
	addl	$16, %r8d
	shrl	$5, %r8d
	movw	%r8w, 2(%rcx,%rsi,2)
	movzbl	%r11b, %r8d
	andl	$31, %r8d
	imull	$3329, %r8d, %r8d
	addl	$16, %r8d
	shrl	$5, %r8d
	movw	%r8w, 4(%rcx,%rsi,2)
	movzbl	%bl, %r8d
	andl	$31, %r8d
	imull	$3329, %r8d, %r8d
	addl	$16, %r8d
	shrl	$5, %r8d
	movw	%r8w, 6(%rcx,%rsi,2)
	movzbl	%bpl, %r8d
	andl	$31, %r8d
	imull	$3329, %r8d, %r8d
	addl	$16, %r8d
	shrl	$5, %r8d
	movw	%r8w, 8(%rcx,%rsi,2)
	movzbl	%r12b, %r8d
	andl	$31, %r8d
	imull	$3329, %r8d, %r8d
	addl	$16, %r8d
	shrl	$5, %r8d
	movw	%r8w, 10(%rcx,%rsi,2)
	movzbl	%r14b, %r8d
	andl	$31, %r8d
	imull	$3329, %r8d, %r8d
	addl	$16, %r8d
	shrl	$5, %r8d
	movw	%r8w, 12(%rcx,%rsi,2)
	movzbl	%r13b, %r8d
	andl	$31, %r8d
	imull	$3329, %r8d, %r8d
	addl	$16, %r8d
	shrl	$5, %r8d
	movw	%r8w, 14(%rcx,%rsi,2)
	addq	$8, %rsi
L_i_poly_decompress$2:
	cmpq	$256, %rsi
	jb  	L_i_poly_decompress$3
	ret
L_i_poly_compress$1:
	call	L_poly_csubq$1
L_i_poly_compress$4:
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	L_i_poly_compress$2
L_i_poly_compress$3:
	movw	(%rax,%rdx,2), %si
	movzwl	%si, %r8d
	shll	$5, %r8d
	addl	$1664, %r8d
	imull	$40318, %r8d, %r8d
	shrl	$27, %r8d
	andl	$31, %r8d
	movw	2(%rax,%rdx,2), %si
	movzwl	%si, %r9d
	shll	$5, %r9d
	addl	$1664, %r9d
	imull	$40318, %r9d, %r9d
	shrl	$27, %r9d
	andl	$31, %r9d
	movw	4(%rax,%rdx,2), %si
	movzwl	%si, %r11d
	shll	$5, %r11d
	addl	$1664, %r11d
	imull	$40318, %r11d, %r11d
	shrl	$27, %r11d
	andl	$31, %r11d
	movw	6(%rax,%rdx,2), %si
	movzwl	%si, %ebx
	shll	$5, %ebx
	addl	$1664, %ebx
	imull	$40318, %ebx, %ebx
	shrl	$27, %ebx
	andl	$31, %ebx
	movw	8(%rax,%rdx,2), %si
	movzwl	%si, %ebp
	shll	$5, %ebp
	addl	$1664, %ebp
	imull	$40318, %ebp, %ebp
	shrl	$27, %ebp
	andl	$31, %ebp
	movw	10(%rax,%rdx,2), %si
	movzwl	%si, %r12d
	shll	$5, %r12d
	addl	$1664, %r12d
	imull	$40318, %r12d, %r12d
	shrl	$27, %r12d
	andl	$31, %r12d
	movw	12(%rax,%rdx,2), %si
	movzwl	%si, %esi
	shll	$5, %esi
	addl	$1664, %esi
	imull	$40318, %esi, %esi
	shrl	$27, %esi
	andl	$31, %esi
	movb	%sil, %r14b
	movw	14(%rax,%rdx,2), %si
	movzwl	%si, %esi
	shll	$5, %esi
	addl	$1664, %esi
	imull	$40318, %esi, %esi
	shrl	$27, %esi
	andl	$31, %esi
	movb	%sil, %r13b
	movb	%r9b, %sil
	shlb	$5, %sil
	orb 	%sil, %r8b
	movb	%r8b, (%r10,%rcx)
	shrb	$3, %r9b
	shlb	$2, %r11b
	movb	%bl, %dil
	shlb	$7, %dil
	orb 	%r11b, %r9b
	orb 	%dil, %r9b
	movb	%r9b, 1(%r10,%rcx)
	shrb	$1, %bl
	movb	%bpl, %sil
	shlb	$4, %sil
	orb 	%sil, %bl
	movb	%bl, 2(%r10,%rcx)
	shrb	$4, %bpl
	shlb	$1, %r12b
	movb	%r14b, %dil
	shlb	$6, %dil
	orb 	%r12b, %bpl
	orb 	%dil, %bpl
	movb	%bpl, 3(%r10,%rcx)
	shrb	$2, %r14b
	shlb	$3, %r13b
	orb 	%r13b, %r14b
	movb	%r14b, 4(%r10,%rcx)
	addq	$5, %rcx
	addq	$8, %rdx
L_i_poly_compress$2:
	cmpq	$256, %rdx
	jb  	L_i_poly_compress$3
	ret
L_i_poly_tomsg$1:
	call	L_poly_csubq$1
L_i_poly_tomsg$2:
	movb	$0, %cl
	movw	(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	2(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	4(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	6(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	8(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	10(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	12(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	14(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, (%r10)
	movb	$0, %cl
	movw	16(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	18(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	20(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	22(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	24(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	26(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	28(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	30(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 1(%r10)
	movb	$0, %cl
	movw	32(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	34(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	36(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	38(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	40(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	42(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	44(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	46(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 2(%r10)
	movb	$0, %cl
	movw	48(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	50(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	52(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	54(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	56(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	58(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	60(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	62(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 3(%r10)
	movb	$0, %cl
	movw	64(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	66(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	68(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	70(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	72(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	74(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	76(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	78(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 4(%r10)
	movb	$0, %cl
	movw	80(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	82(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	84(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	86(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	88(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	90(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	92(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	94(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 5(%r10)
	movb	$0, %cl
	movw	96(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	98(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	100(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	102(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	104(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	106(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	108(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	110(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 6(%r10)
	movb	$0, %cl
	movw	112(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	114(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	116(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	118(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	120(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	122(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	124(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	126(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 7(%r10)
	movb	$0, %cl
	movw	128(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	130(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	132(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	134(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	136(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	138(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	140(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	142(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 8(%r10)
	movb	$0, %cl
	movw	144(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	146(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	148(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	150(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	152(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	154(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	156(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	158(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 9(%r10)
	movb	$0, %cl
	movw	160(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	162(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	164(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	166(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	168(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	170(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	172(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	174(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 10(%r10)
	movb	$0, %cl
	movw	176(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	178(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	180(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	182(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	184(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	186(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	188(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	190(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 11(%r10)
	movb	$0, %cl
	movw	192(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	194(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	196(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	198(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	200(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	202(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	204(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	206(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 12(%r10)
	movb	$0, %cl
	movw	208(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	210(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	212(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	214(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	216(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	218(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	220(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	222(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 13(%r10)
	movb	$0, %cl
	movw	224(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	226(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	228(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	230(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	232(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	234(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	236(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	238(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 14(%r10)
	movb	$0, %cl
	movw	240(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	242(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	244(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	246(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	248(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	250(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	252(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	254(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 15(%r10)
	movb	$0, %cl
	movw	256(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	258(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	260(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	262(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	264(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	266(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	268(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	270(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 16(%r10)
	movb	$0, %cl
	movw	272(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	274(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	276(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	278(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	280(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	282(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	284(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	286(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 17(%r10)
	movb	$0, %cl
	movw	288(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	290(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	292(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	294(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	296(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	298(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	300(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	302(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 18(%r10)
	movb	$0, %cl
	movw	304(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	306(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	308(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	310(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	312(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	314(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	316(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	318(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 19(%r10)
	movb	$0, %cl
	movw	320(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	322(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	324(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	326(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	328(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	330(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	332(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	334(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 20(%r10)
	movb	$0, %cl
	movw	336(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	338(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	340(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	342(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	344(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	346(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	348(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	350(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 21(%r10)
	movb	$0, %cl
	movw	352(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	354(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	356(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	358(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	360(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	362(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	364(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	366(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 22(%r10)
	movb	$0, %cl
	movw	368(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	370(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	372(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	374(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	376(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	378(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	380(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	382(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 23(%r10)
	movb	$0, %cl
	movw	384(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	386(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	388(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	390(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	392(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	394(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	396(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	398(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 24(%r10)
	movb	$0, %cl
	movw	400(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	402(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	404(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	406(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	408(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	410(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	412(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	414(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 25(%r10)
	movb	$0, %cl
	movw	416(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	418(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	420(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	422(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	424(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	426(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	428(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	430(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 26(%r10)
	movb	$0, %cl
	movw	432(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	434(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	436(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	438(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	440(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	442(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	444(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	446(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 27(%r10)
	movb	$0, %cl
	movw	448(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	450(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	452(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	454(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	456(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	458(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	460(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	462(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 28(%r10)
	movb	$0, %cl
	movw	464(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	466(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	468(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	470(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	472(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	474(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	476(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	478(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 29(%r10)
	movb	$0, %cl
	movw	480(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	482(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	484(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	486(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	488(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	490(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	492(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	494(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 30(%r10)
	movb	$0, %cl
	movw	496(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	498(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	500(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	502(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	504(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	506(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	508(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	510(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 31(%r10)
	ret
L_poly_tobytes$1:
	call	L_poly_csubq$1
L_poly_tobytes$4:
	movq	$0, %rdi
	movq	$0, %rcx
	jmp 	L_poly_tobytes$2
L_poly_tobytes$3:
	movw	(%rax,%rcx,2), %r9w
	movw	2(%rax,%rcx,2), %r11w
	movw	%r9w, %si
	andw	$255, %si
	movb	%sil, (%r10,%rdi)
	incq	%rdi
	shrw	$8, %r9w
	andw	$15, %r9w
	movw	%r11w, %si
	andw	$15, %si
	shlw	$4, %si
	orw 	%r9w, %si
	movb	%sil, (%r10,%rdi)
	incq	%rdi
	shrw	$4, %r11w
	movb	%r11b, (%r10,%rdi)
	incq	%rdi
	addq	$2, %rcx
L_poly_tobytes$2:
	cmpq	$256, %rcx
	jb  	L_poly_tobytes$3
	ret
L_poly_sub$1:
	movq	$0, %rsi
	jmp 	L_poly_sub$2
L_poly_sub$3:
	movw	(%rdx,%rsi,2), %r9w
	movw	(%rcx,%rsi,2), %di
	subw	%di, %r9w
	movw	%r9w, (%rax,%rsi,2)
	incq	%rsi
L_poly_sub$2:
	cmpq	$256, %rsi
	jb  	L_poly_sub$3
	ret
L_poly_ntt$1:
	leaq	glob_data + 448(%rip), %rcx
	movq	$0, %rdx
	movq	$128, %rsi
	jmp 	L_poly_ntt$4
L_poly_ntt$5:
	movq	$0, %r8
	jmp 	L_poly_ntt$6
L_poly_ntt$7:
	incq	%rdx
	movw	(%rcx,%rdx,2), %bp
	movq	%r8, %rdi
	addq	%rsi, %r8
	jmp 	L_poly_ntt$8
L_poly_ntt$9:
	movw	(%rax,%rdi,2), %r9w
	movw	%r9w, %r11w
	movq	%rdi, %rbx
	addq	%rsi, %rbx
	movw	(%rax,%rbx,2), %r12w
	movswl	%r12w, %r13d
	movswl	%bp, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r15d
	addl	%r13d, %r15d
	sarl	$16, %r15d
	subw	%r15w, %r11w
	addw	%r9w, %r15w
	movw	%r11w, (%rax,%rbx,2)
	movw	%r15w, (%rax,%rdi,2)
	incq	%rdi
L_poly_ntt$8:
	cmpq	%r8, %rdi
	jb  	L_poly_ntt$9
	movq	%rdi, %r8
	addq	%rsi, %r8
L_poly_ntt$6:
	cmpq	$256, %r8
	jb  	L_poly_ntt$7
	shrq	$1, %rsi
L_poly_ntt$4:
	cmpq	$2, %rsi
	jnb 	L_poly_ntt$5
	movq	$0, %rdi
	jmp 	L_poly_ntt$2
L_poly_ntt$3:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
L_poly_ntt$2:
	cmpq	$256, %rdi
	jb  	L_poly_ntt$3
	ret
L_poly_invntt$1:
	leaq	glob_data + 192(%rip), %rcx
	movq	$0, %rdx
	movq	$2, %rsi
	jmp 	L_poly_invntt$4
L_poly_invntt$5:
	movq	$0, %r8
	jmp 	L_poly_invntt$6
L_poly_invntt$7:
	movw	(%rcx,%rdx,2), %bp
	incq	%rdx
	movq	%r8, %rdi
	addq	%rsi, %r8
	jmp 	L_poly_invntt$8
L_poly_invntt$9:
	movw	(%rax,%rdi,2), %r9w
	movq	%rdi, %rbx
	addq	%rsi, %rbx
	movw	(%rax,%rbx,2), %r11w
	movw	%r11w, %r12w
	addw	%r9w, %r12w
	movswl	%r12w, %r15d
	imull	$20159, %r15d, %r15d
	sarl	$26, %r15d
	imull	$3329, %r15d, %r15d
	subw	%r15w, %r12w
	movw	%r12w, (%rax,%rdi,2)
	subw	%r11w, %r9w
	movswl	%r9w, %r13d
	movswl	%bp, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r9d
	addl	%r13d, %r9d
	sarl	$16, %r9d
	movw	%r9w, (%rax,%rbx,2)
	incq	%rdi
L_poly_invntt$8:
	cmpq	%r8, %rdi
	jb  	L_poly_invntt$9
	movq	%rdi, %r8
	addq	%rsi, %r8
L_poly_invntt$6:
	cmpq	$256, %r8
	jb  	L_poly_invntt$7
	shlq	$1, %rsi
L_poly_invntt$4:
	cmpq	$128, %rsi
	jbe 	L_poly_invntt$5
	movw	254(%rcx), %cx
	movq	$0, %rdi
	jmp 	L_poly_invntt$2
L_poly_invntt$3:
	movw	(%rax,%rdi,2), %dx
	movswl	%dx, %r13d
	movswl	%cx, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %esi
	sarl	$16, %esi
	imull	$-3329, %esi, %edx
	addl	%r13d, %edx
	sarl	$16, %edx
	movw	%dx, (%rax,%rdi,2)
	incq	%rdi
L_poly_invntt$2:
	cmpq	$256, %rdi
	jb  	L_poly_invntt$3
	ret
L_poly_getnoise$1:
	movq	%rdx, 8(%rsp)
	movq	%rcx, %rdx
	movb	(%rdx), %sil
	movb	%sil, 16(%rsp)
	movb	1(%rdx), %sil
	movb	%sil, 17(%rsp)
	movb	2(%rdx), %sil
	movb	%sil, 18(%rsp)
	movb	3(%rdx), %sil
	movb	%sil, 19(%rsp)
	movb	4(%rdx), %sil
	movb	%sil, 20(%rsp)
	movb	5(%rdx), %sil
	movb	%sil, 21(%rsp)
	movb	6(%rdx), %sil
	movb	%sil, 22(%rsp)
	movb	7(%rdx), %sil
	movb	%sil, 23(%rsp)
	movb	8(%rdx), %sil
	movb	%sil, 24(%rsp)
	movb	9(%rdx), %sil
	movb	%sil, 25(%rsp)
	movb	10(%rdx), %sil
	movb	%sil, 26(%rsp)
	movb	11(%rdx), %sil
	movb	%sil, 27(%rsp)
	movb	12(%rdx), %sil
	movb	%sil, 28(%rsp)
	movb	13(%rdx), %sil
	movb	%sil, 29(%rsp)
	movb	14(%rdx), %sil
	movb	%sil, 30(%rsp)
	movb	15(%rdx), %sil
	movb	%sil, 31(%rsp)
	movb	16(%rdx), %sil
	movb	%sil, 32(%rsp)
	movb	17(%rdx), %sil
	movb	%sil, 33(%rsp)
	movb	18(%rdx), %sil
	movb	%sil, 34(%rsp)
	movb	19(%rdx), %sil
	movb	%sil, 35(%rsp)
	movb	20(%rdx), %sil
	movb	%sil, 36(%rsp)
	movb	21(%rdx), %sil
	movb	%sil, 37(%rsp)
	movb	22(%rdx), %sil
	movb	%sil, 38(%rsp)
	movb	23(%rdx), %sil
	movb	%sil, 39(%rsp)
	movb	24(%rdx), %sil
	movb	%sil, 40(%rsp)
	movb	25(%rdx), %sil
	movb	%sil, 41(%rsp)
	movb	26(%rdx), %sil
	movb	%sil, 42(%rsp)
	movb	27(%rdx), %sil
	movb	%sil, 43(%rsp)
	movb	28(%rdx), %sil
	movb	%sil, 44(%rsp)
	movb	29(%rdx), %sil
	movb	%sil, 45(%rsp)
	movb	30(%rdx), %sil
	movb	%sil, 46(%rsp)
	movb	31(%rdx), %sil
	movb	%sil, 47(%rsp)
	movb	%al, 48(%rsp)
	leaq	56(%rsp), %rsi
	leaq	16(%rsp), %rbx
	leaq	-224(%rsp), %rsp
	call	L_shake256_128_33$1
L_poly_getnoise$4:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	$0, %rdx
	jmp 	L_poly_getnoise$2
L_poly_getnoise$3:
	movb	56(%rsp,%rdx), %sil
	movb	%sil, %r9b
	andb	$85, %r9b
	shrb	$1, %sil
	andb	$85, %sil
	addb	%r9b, %sil
	movb	%sil, %r9b
	andb	$3, %r9b
	movb	%sil, %dil
	shrb	$2, %dil
	andb	$3, %dil
	subb	%dil, %r9b
	movsbw	%r9b, %r9w
	movw	%r9w, (%rax,%rdx,4)
	movb	%sil, %r9b
	shrb	$4, %r9b
	andb	$3, %r9b
	shrb	$6, %sil
	andb	$3, %sil
	subb	%sil, %r9b
	movsbw	%r9b, %r9w
	movw	%r9w, 2(%rax,%rdx,4)
	incq	%rdx
L_poly_getnoise$2:
	cmpq	$128, %rdx
	jb  	L_poly_getnoise$3
	ret
L_i_poly_frommsg$1:
	movb	(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, (%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 2(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 4(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 6(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 8(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 10(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 12(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 14(%rcx)
	movb	1(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 16(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 18(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 20(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 22(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 24(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 26(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 28(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 30(%rcx)
	movb	2(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 32(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 34(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 36(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 38(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 40(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 42(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 44(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 46(%rcx)
	movb	3(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 48(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 50(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 52(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 54(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 56(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 58(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 60(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 62(%rcx)
	movb	4(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 64(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 66(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 68(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 70(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 72(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 74(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 76(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 78(%rcx)
	movb	5(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 80(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 82(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 84(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 86(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 88(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 90(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 92(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 94(%rcx)
	movb	6(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 96(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 98(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 100(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 102(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 104(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 106(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 108(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 110(%rcx)
	movb	7(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 112(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 114(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 116(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 118(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 120(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 122(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 124(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 126(%rcx)
	movb	8(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 128(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 130(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 132(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 134(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 136(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 138(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 140(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 142(%rcx)
	movb	9(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 144(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 146(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 148(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 150(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 152(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 154(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 156(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 158(%rcx)
	movb	10(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 160(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 162(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 164(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 166(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 168(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 170(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 172(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 174(%rcx)
	movb	11(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 176(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 178(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 180(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 182(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 184(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 186(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 188(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 190(%rcx)
	movb	12(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 192(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 194(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 196(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 198(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 200(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 202(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 204(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 206(%rcx)
	movb	13(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 208(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 210(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 212(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 214(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 216(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 218(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 220(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 222(%rcx)
	movb	14(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 224(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 226(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 228(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 230(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 232(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 234(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 236(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 238(%rcx)
	movb	15(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 240(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 242(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 244(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 246(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 248(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 250(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 252(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 254(%rcx)
	movb	16(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 256(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 258(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 260(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 262(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 264(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 266(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 268(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 270(%rcx)
	movb	17(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 272(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 274(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 276(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 278(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 280(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 282(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 284(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 286(%rcx)
	movb	18(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 288(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 290(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 292(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 294(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 296(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 298(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 300(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 302(%rcx)
	movb	19(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 304(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 306(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 308(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 310(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 312(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 314(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 316(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 318(%rcx)
	movb	20(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 320(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 322(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 324(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 326(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 328(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 330(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 332(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 334(%rcx)
	movb	21(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 336(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 338(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 340(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 342(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 344(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 346(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 348(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 350(%rcx)
	movb	22(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 352(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 354(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 356(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 358(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 360(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 362(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 364(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 366(%rcx)
	movb	23(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 368(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 370(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 372(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 374(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 376(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 378(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 380(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 382(%rcx)
	movb	24(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 384(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 386(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 388(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 390(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 392(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 394(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 396(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 398(%rcx)
	movb	25(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 400(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 402(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 404(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 406(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 408(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 410(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 412(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 414(%rcx)
	movb	26(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 416(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 418(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 420(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 422(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 424(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 426(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 428(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 430(%rcx)
	movb	27(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 432(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 434(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 436(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 438(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 440(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 442(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 444(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 446(%rcx)
	movb	28(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 448(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 450(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 452(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 454(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 456(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 458(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 460(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 462(%rcx)
	movb	29(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 464(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 466(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 468(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 470(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 472(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 474(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 476(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 478(%rcx)
	movb	30(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 480(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 482(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 484(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 486(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 488(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 490(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 492(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 494(%rcx)
	movb	31(%rax), %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 496(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 498(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 500(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 502(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 504(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 506(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 508(%rcx)
	shrb	$1, %sil
	movzbw	%sil, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 510(%rcx)
	ret
L_poly_frommont$1:
	movw	$1353, %cx
	movq	$0, %rdx
	jmp 	L_poly_frommont$2
L_poly_frommont$3:
	movw	(%rax,%rdx,2), %r9w
	movswl	%r9w, %r13d
	movswl	%cx, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %esi
	sarl	$16, %esi
	imull	$-3329, %esi, %r9d
	addl	%r13d, %r9d
	sarl	$16, %r9d
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
L_poly_frommont$2:
	cmpq	$256, %rdx
	jb  	L_poly_frommont$3
	ret
L_poly_frombytes$1:
	movb	(%rdx), %r8b
	movb	1(%rdx), %sil
	movb	2(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, (%rcx)
	movw	%di, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	4(%rdx), %sil
	movb	5(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 4(%rcx)
	movw	%di, 6(%rcx)
	movb	6(%rdx), %r8b
	movb	7(%rdx), %sil
	movb	8(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 8(%rcx)
	movw	%di, 10(%rcx)
	movb	9(%rdx), %r8b
	movb	10(%rdx), %sil
	movb	11(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 12(%rcx)
	movw	%di, 14(%rcx)
	movb	12(%rdx), %r8b
	movb	13(%rdx), %sil
	movb	14(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 16(%rcx)
	movw	%di, 18(%rcx)
	movb	15(%rdx), %r8b
	movb	16(%rdx), %sil
	movb	17(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 20(%rcx)
	movw	%di, 22(%rcx)
	movb	18(%rdx), %r8b
	movb	19(%rdx), %sil
	movb	20(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 24(%rcx)
	movw	%di, 26(%rcx)
	movb	21(%rdx), %r8b
	movb	22(%rdx), %sil
	movb	23(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 28(%rcx)
	movw	%di, 30(%rcx)
	movb	24(%rdx), %r8b
	movb	25(%rdx), %sil
	movb	26(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 32(%rcx)
	movw	%di, 34(%rcx)
	movb	27(%rdx), %r8b
	movb	28(%rdx), %sil
	movb	29(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 36(%rcx)
	movw	%di, 38(%rcx)
	movb	30(%rdx), %r8b
	movb	31(%rdx), %sil
	movb	32(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 40(%rcx)
	movw	%di, 42(%rcx)
	movb	33(%rdx), %r8b
	movb	34(%rdx), %sil
	movb	35(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 44(%rcx)
	movw	%di, 46(%rcx)
	movb	36(%rdx), %r8b
	movb	37(%rdx), %sil
	movb	38(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 48(%rcx)
	movw	%di, 50(%rcx)
	movb	39(%rdx), %r8b
	movb	40(%rdx), %sil
	movb	41(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 52(%rcx)
	movw	%di, 54(%rcx)
	movb	42(%rdx), %r8b
	movb	43(%rdx), %sil
	movb	44(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 56(%rcx)
	movw	%di, 58(%rcx)
	movb	45(%rdx), %r8b
	movb	46(%rdx), %sil
	movb	47(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 60(%rcx)
	movw	%di, 62(%rcx)
	movb	48(%rdx), %r8b
	movb	49(%rdx), %sil
	movb	50(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 64(%rcx)
	movw	%di, 66(%rcx)
	movb	51(%rdx), %r8b
	movb	52(%rdx), %sil
	movb	53(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 68(%rcx)
	movw	%di, 70(%rcx)
	movb	54(%rdx), %r8b
	movb	55(%rdx), %sil
	movb	56(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 72(%rcx)
	movw	%di, 74(%rcx)
	movb	57(%rdx), %r8b
	movb	58(%rdx), %sil
	movb	59(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 76(%rcx)
	movw	%di, 78(%rcx)
	movb	60(%rdx), %r8b
	movb	61(%rdx), %sil
	movb	62(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 80(%rcx)
	movw	%di, 82(%rcx)
	movb	63(%rdx), %r8b
	movb	64(%rdx), %sil
	movb	65(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 84(%rcx)
	movw	%di, 86(%rcx)
	movb	66(%rdx), %r8b
	movb	67(%rdx), %sil
	movb	68(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 88(%rcx)
	movw	%di, 90(%rcx)
	movb	69(%rdx), %r8b
	movb	70(%rdx), %sil
	movb	71(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 92(%rcx)
	movw	%di, 94(%rcx)
	movb	72(%rdx), %r8b
	movb	73(%rdx), %sil
	movb	74(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 96(%rcx)
	movw	%di, 98(%rcx)
	movb	75(%rdx), %r8b
	movb	76(%rdx), %sil
	movb	77(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 100(%rcx)
	movw	%di, 102(%rcx)
	movb	78(%rdx), %r8b
	movb	79(%rdx), %sil
	movb	80(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 104(%rcx)
	movw	%di, 106(%rcx)
	movb	81(%rdx), %r8b
	movb	82(%rdx), %sil
	movb	83(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 108(%rcx)
	movw	%di, 110(%rcx)
	movb	84(%rdx), %r8b
	movb	85(%rdx), %sil
	movb	86(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 112(%rcx)
	movw	%di, 114(%rcx)
	movb	87(%rdx), %r8b
	movb	88(%rdx), %sil
	movb	89(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 116(%rcx)
	movw	%di, 118(%rcx)
	movb	90(%rdx), %r8b
	movb	91(%rdx), %sil
	movb	92(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 120(%rcx)
	movw	%di, 122(%rcx)
	movb	93(%rdx), %r8b
	movb	94(%rdx), %sil
	movb	95(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 124(%rcx)
	movw	%di, 126(%rcx)
	movb	96(%rdx), %r8b
	movb	97(%rdx), %sil
	movb	98(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 128(%rcx)
	movw	%di, 130(%rcx)
	movb	99(%rdx), %r8b
	movb	100(%rdx), %sil
	movb	101(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 132(%rcx)
	movw	%di, 134(%rcx)
	movb	102(%rdx), %r8b
	movb	103(%rdx), %sil
	movb	104(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 136(%rcx)
	movw	%di, 138(%rcx)
	movb	105(%rdx), %r8b
	movb	106(%rdx), %sil
	movb	107(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 140(%rcx)
	movw	%di, 142(%rcx)
	movb	108(%rdx), %r8b
	movb	109(%rdx), %sil
	movb	110(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 144(%rcx)
	movw	%di, 146(%rcx)
	movb	111(%rdx), %r8b
	movb	112(%rdx), %sil
	movb	113(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 148(%rcx)
	movw	%di, 150(%rcx)
	movb	114(%rdx), %r8b
	movb	115(%rdx), %sil
	movb	116(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 152(%rcx)
	movw	%di, 154(%rcx)
	movb	117(%rdx), %r8b
	movb	118(%rdx), %sil
	movb	119(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 156(%rcx)
	movw	%di, 158(%rcx)
	movb	120(%rdx), %r8b
	movb	121(%rdx), %sil
	movb	122(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 160(%rcx)
	movw	%di, 162(%rcx)
	movb	123(%rdx), %r8b
	movb	124(%rdx), %sil
	movb	125(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 164(%rcx)
	movw	%di, 166(%rcx)
	movb	126(%rdx), %r8b
	movb	127(%rdx), %sil
	movb	128(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 168(%rcx)
	movw	%di, 170(%rcx)
	movb	129(%rdx), %r8b
	movb	130(%rdx), %sil
	movb	131(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 172(%rcx)
	movw	%di, 174(%rcx)
	movb	132(%rdx), %r8b
	movb	133(%rdx), %sil
	movb	134(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 176(%rcx)
	movw	%di, 178(%rcx)
	movb	135(%rdx), %r8b
	movb	136(%rdx), %sil
	movb	137(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 180(%rcx)
	movw	%di, 182(%rcx)
	movb	138(%rdx), %r8b
	movb	139(%rdx), %sil
	movb	140(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 184(%rcx)
	movw	%di, 186(%rcx)
	movb	141(%rdx), %r8b
	movb	142(%rdx), %sil
	movb	143(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 188(%rcx)
	movw	%di, 190(%rcx)
	movb	144(%rdx), %r8b
	movb	145(%rdx), %sil
	movb	146(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 192(%rcx)
	movw	%di, 194(%rcx)
	movb	147(%rdx), %r8b
	movb	148(%rdx), %sil
	movb	149(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 196(%rcx)
	movw	%di, 198(%rcx)
	movb	150(%rdx), %r8b
	movb	151(%rdx), %sil
	movb	152(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 200(%rcx)
	movw	%di, 202(%rcx)
	movb	153(%rdx), %r8b
	movb	154(%rdx), %sil
	movb	155(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 204(%rcx)
	movw	%di, 206(%rcx)
	movb	156(%rdx), %r8b
	movb	157(%rdx), %sil
	movb	158(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 208(%rcx)
	movw	%di, 210(%rcx)
	movb	159(%rdx), %r8b
	movb	160(%rdx), %sil
	movb	161(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 212(%rcx)
	movw	%di, 214(%rcx)
	movb	162(%rdx), %r8b
	movb	163(%rdx), %sil
	movb	164(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 216(%rcx)
	movw	%di, 218(%rcx)
	movb	165(%rdx), %r8b
	movb	166(%rdx), %sil
	movb	167(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 220(%rcx)
	movw	%di, 222(%rcx)
	movb	168(%rdx), %r8b
	movb	169(%rdx), %sil
	movb	170(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 224(%rcx)
	movw	%di, 226(%rcx)
	movb	171(%rdx), %r8b
	movb	172(%rdx), %sil
	movb	173(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 228(%rcx)
	movw	%di, 230(%rcx)
	movb	174(%rdx), %r8b
	movb	175(%rdx), %sil
	movb	176(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 232(%rcx)
	movw	%di, 234(%rcx)
	movb	177(%rdx), %r8b
	movb	178(%rdx), %sil
	movb	179(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 236(%rcx)
	movw	%di, 238(%rcx)
	movb	180(%rdx), %r8b
	movb	181(%rdx), %sil
	movb	182(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 240(%rcx)
	movw	%di, 242(%rcx)
	movb	183(%rdx), %r8b
	movb	184(%rdx), %sil
	movb	185(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 244(%rcx)
	movw	%di, 246(%rcx)
	movb	186(%rdx), %r8b
	movb	187(%rdx), %sil
	movb	188(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 248(%rcx)
	movw	%di, 250(%rcx)
	movb	189(%rdx), %r8b
	movb	190(%rdx), %sil
	movb	191(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 252(%rcx)
	movw	%di, 254(%rcx)
	movb	192(%rdx), %r8b
	movb	193(%rdx), %sil
	movb	194(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 256(%rcx)
	movw	%di, 258(%rcx)
	movb	195(%rdx), %r8b
	movb	196(%rdx), %sil
	movb	197(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 260(%rcx)
	movw	%di, 262(%rcx)
	movb	198(%rdx), %r8b
	movb	199(%rdx), %sil
	movb	200(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 264(%rcx)
	movw	%di, 266(%rcx)
	movb	201(%rdx), %r8b
	movb	202(%rdx), %sil
	movb	203(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 268(%rcx)
	movw	%di, 270(%rcx)
	movb	204(%rdx), %r8b
	movb	205(%rdx), %sil
	movb	206(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 272(%rcx)
	movw	%di, 274(%rcx)
	movb	207(%rdx), %r8b
	movb	208(%rdx), %sil
	movb	209(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 276(%rcx)
	movw	%di, 278(%rcx)
	movb	210(%rdx), %r8b
	movb	211(%rdx), %sil
	movb	212(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 280(%rcx)
	movw	%di, 282(%rcx)
	movb	213(%rdx), %r8b
	movb	214(%rdx), %sil
	movb	215(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 284(%rcx)
	movw	%di, 286(%rcx)
	movb	216(%rdx), %r8b
	movb	217(%rdx), %sil
	movb	218(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 288(%rcx)
	movw	%di, 290(%rcx)
	movb	219(%rdx), %r8b
	movb	220(%rdx), %sil
	movb	221(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 292(%rcx)
	movw	%di, 294(%rcx)
	movb	222(%rdx), %r8b
	movb	223(%rdx), %sil
	movb	224(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 296(%rcx)
	movw	%di, 298(%rcx)
	movb	225(%rdx), %r8b
	movb	226(%rdx), %sil
	movb	227(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 300(%rcx)
	movw	%di, 302(%rcx)
	movb	228(%rdx), %r8b
	movb	229(%rdx), %sil
	movb	230(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 304(%rcx)
	movw	%di, 306(%rcx)
	movb	231(%rdx), %r8b
	movb	232(%rdx), %sil
	movb	233(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 308(%rcx)
	movw	%di, 310(%rcx)
	movb	234(%rdx), %r8b
	movb	235(%rdx), %sil
	movb	236(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 312(%rcx)
	movw	%di, 314(%rcx)
	movb	237(%rdx), %r8b
	movb	238(%rdx), %sil
	movb	239(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 316(%rcx)
	movw	%di, 318(%rcx)
	movb	240(%rdx), %r8b
	movb	241(%rdx), %sil
	movb	242(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 320(%rcx)
	movw	%di, 322(%rcx)
	movb	243(%rdx), %r8b
	movb	244(%rdx), %sil
	movb	245(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 324(%rcx)
	movw	%di, 326(%rcx)
	movb	246(%rdx), %r8b
	movb	247(%rdx), %sil
	movb	248(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 328(%rcx)
	movw	%di, 330(%rcx)
	movb	249(%rdx), %r8b
	movb	250(%rdx), %sil
	movb	251(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 332(%rcx)
	movw	%di, 334(%rcx)
	movb	252(%rdx), %r8b
	movb	253(%rdx), %sil
	movb	254(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 336(%rcx)
	movw	%di, 338(%rcx)
	movb	255(%rdx), %r8b
	movb	256(%rdx), %sil
	movb	257(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 340(%rcx)
	movw	%di, 342(%rcx)
	movb	258(%rdx), %r8b
	movb	259(%rdx), %sil
	movb	260(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 344(%rcx)
	movw	%di, 346(%rcx)
	movb	261(%rdx), %r8b
	movb	262(%rdx), %sil
	movb	263(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 348(%rcx)
	movw	%di, 350(%rcx)
	movb	264(%rdx), %r8b
	movb	265(%rdx), %sil
	movb	266(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 352(%rcx)
	movw	%di, 354(%rcx)
	movb	267(%rdx), %r8b
	movb	268(%rdx), %sil
	movb	269(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 356(%rcx)
	movw	%di, 358(%rcx)
	movb	270(%rdx), %r8b
	movb	271(%rdx), %sil
	movb	272(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 360(%rcx)
	movw	%di, 362(%rcx)
	movb	273(%rdx), %r8b
	movb	274(%rdx), %sil
	movb	275(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 364(%rcx)
	movw	%di, 366(%rcx)
	movb	276(%rdx), %r8b
	movb	277(%rdx), %sil
	movb	278(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 368(%rcx)
	movw	%di, 370(%rcx)
	movb	279(%rdx), %r8b
	movb	280(%rdx), %sil
	movb	281(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 372(%rcx)
	movw	%di, 374(%rcx)
	movb	282(%rdx), %r8b
	movb	283(%rdx), %sil
	movb	284(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 376(%rcx)
	movw	%di, 378(%rcx)
	movb	285(%rdx), %r8b
	movb	286(%rdx), %sil
	movb	287(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 380(%rcx)
	movw	%di, 382(%rcx)
	movb	288(%rdx), %r8b
	movb	289(%rdx), %sil
	movb	290(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 384(%rcx)
	movw	%di, 386(%rcx)
	movb	291(%rdx), %r8b
	movb	292(%rdx), %sil
	movb	293(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 388(%rcx)
	movw	%di, 390(%rcx)
	movb	294(%rdx), %r8b
	movb	295(%rdx), %sil
	movb	296(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 392(%rcx)
	movw	%di, 394(%rcx)
	movb	297(%rdx), %r8b
	movb	298(%rdx), %sil
	movb	299(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 396(%rcx)
	movw	%di, 398(%rcx)
	movb	300(%rdx), %r8b
	movb	301(%rdx), %sil
	movb	302(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 400(%rcx)
	movw	%di, 402(%rcx)
	movb	303(%rdx), %r8b
	movb	304(%rdx), %sil
	movb	305(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 404(%rcx)
	movw	%di, 406(%rcx)
	movb	306(%rdx), %r8b
	movb	307(%rdx), %sil
	movb	308(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 408(%rcx)
	movw	%di, 410(%rcx)
	movb	309(%rdx), %r8b
	movb	310(%rdx), %sil
	movb	311(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 412(%rcx)
	movw	%di, 414(%rcx)
	movb	312(%rdx), %r8b
	movb	313(%rdx), %sil
	movb	314(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 416(%rcx)
	movw	%di, 418(%rcx)
	movb	315(%rdx), %r8b
	movb	316(%rdx), %sil
	movb	317(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 420(%rcx)
	movw	%di, 422(%rcx)
	movb	318(%rdx), %r8b
	movb	319(%rdx), %sil
	movb	320(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 424(%rcx)
	movw	%di, 426(%rcx)
	movb	321(%rdx), %r8b
	movb	322(%rdx), %sil
	movb	323(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 428(%rcx)
	movw	%di, 430(%rcx)
	movb	324(%rdx), %r8b
	movb	325(%rdx), %sil
	movb	326(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 432(%rcx)
	movw	%di, 434(%rcx)
	movb	327(%rdx), %r8b
	movb	328(%rdx), %sil
	movb	329(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 436(%rcx)
	movw	%di, 438(%rcx)
	movb	330(%rdx), %r8b
	movb	331(%rdx), %sil
	movb	332(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 440(%rcx)
	movw	%di, 442(%rcx)
	movb	333(%rdx), %r8b
	movb	334(%rdx), %sil
	movb	335(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 444(%rcx)
	movw	%di, 446(%rcx)
	movb	336(%rdx), %r8b
	movb	337(%rdx), %sil
	movb	338(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 448(%rcx)
	movw	%di, 450(%rcx)
	movb	339(%rdx), %r8b
	movb	340(%rdx), %sil
	movb	341(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 452(%rcx)
	movw	%di, 454(%rcx)
	movb	342(%rdx), %r8b
	movb	343(%rdx), %sil
	movb	344(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 456(%rcx)
	movw	%di, 458(%rcx)
	movb	345(%rdx), %r8b
	movb	346(%rdx), %sil
	movb	347(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 460(%rcx)
	movw	%di, 462(%rcx)
	movb	348(%rdx), %r8b
	movb	349(%rdx), %sil
	movb	350(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 464(%rcx)
	movw	%di, 466(%rcx)
	movb	351(%rdx), %r8b
	movb	352(%rdx), %sil
	movb	353(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 468(%rcx)
	movw	%di, 470(%rcx)
	movb	354(%rdx), %r8b
	movb	355(%rdx), %sil
	movb	356(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 472(%rcx)
	movw	%di, 474(%rcx)
	movb	357(%rdx), %r8b
	movb	358(%rdx), %sil
	movb	359(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 476(%rcx)
	movw	%di, 478(%rcx)
	movb	360(%rdx), %r8b
	movb	361(%rdx), %sil
	movb	362(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 480(%rcx)
	movw	%di, 482(%rcx)
	movb	363(%rdx), %r8b
	movb	364(%rdx), %sil
	movb	365(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 484(%rcx)
	movw	%di, 486(%rcx)
	movb	366(%rdx), %r8b
	movb	367(%rdx), %sil
	movb	368(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 488(%rcx)
	movw	%di, 490(%rcx)
	movb	369(%rdx), %r8b
	movb	370(%rdx), %sil
	movb	371(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 492(%rcx)
	movw	%di, 494(%rcx)
	movb	372(%rdx), %r8b
	movb	373(%rdx), %sil
	movb	374(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 496(%rcx)
	movw	%di, 498(%rcx)
	movb	375(%rdx), %r8b
	movb	376(%rdx), %sil
	movb	377(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 500(%rcx)
	movw	%di, 502(%rcx)
	movb	378(%rdx), %r8b
	movb	379(%rdx), %sil
	movb	380(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 504(%rcx)
	movw	%di, 506(%rcx)
	movb	381(%rdx), %r8b
	movb	382(%rdx), %sil
	movb	383(%rdx), %dil
	movzbw	%r8b, %r8w
	movzbw	%sil, %r9w
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %r8w
	movzbw	%dil, %di
	shlw	$4, %di
	movzbw	%sil, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %di
	movw	%r8w, 508(%rcx)
	movw	%di, 510(%rcx)
	ret
L_poly_basemul$1:
	movq	%rdx, 8(%rsp)
	movq	$0, %rdx
	jmp 	L_poly_basemul$2
L_poly_basemul$3:
	leaq	glob_data + 576(%rip), %rsi
	movq	%rdx, %rdi
	shrq	$2, %rdi
	movw	(%rsi,%rdi,2), %bp
	movw	(%rax,%rdx,2), %r9w
	movw	(%rcx,%rdx,2), %si
	incq	%rdx
	movw	(%rax,%rdx,2), %bx
	movw	(%rcx,%rdx,2), %di
	decq	%rdx
	movswl	%bx, %r13d
	movswl	%di, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r15d
	addl	%r13d, %r15d
	sarl	$16, %r15d
	movswl	%r15w, %r13d
	movswl	%bp, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r15d
	addl	%r13d, %r15d
	sarl	$16, %r15d
	movw	%r15w, %r8w
	movswl	%r9w, %r13d
	movswl	%si, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r15d
	addl	%r13d, %r15d
	sarl	$16, %r15d
	addw	%r15w, %r8w
	movswl	%r9w, %r13d
	movswl	%di, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r9d
	addl	%r13d, %r9d
	sarl	$16, %r9d
	movswl	%bx, %r13d
	movswl	%si, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %esi
	sarl	$16, %esi
	imull	$-3329, %esi, %r15d
	addl	%r13d, %r15d
	sarl	$16, %r15d
	addw	%r15w, %r9w
	movq	8(%rsp), %rsi
	movw	%r8w, (%rsi,%rdx,2)
	incq	%rdx
	movw	%r9w, (%rsi,%rdx,2)
	movq	%rsi, 16(%rsp)
	negw	%bp
	incq	%rdx
	movw	(%rax,%rdx,2), %r9w
	movw	(%rcx,%rdx,2), %si
	incq	%rdx
	movw	(%rax,%rdx,2), %bx
	movw	(%rcx,%rdx,2), %di
	decq	%rdx
	movswl	%bx, %r13d
	movswl	%di, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r15d
	addl	%r13d, %r15d
	sarl	$16, %r15d
	movswl	%r15w, %r13d
	movswl	%bp, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r15d
	addl	%r13d, %r15d
	sarl	$16, %r15d
	movw	%r15w, %r8w
	movswl	%r9w, %r13d
	movswl	%si, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r15d
	addl	%r13d, %r15d
	sarl	$16, %r15d
	addw	%r15w, %r8w
	movswl	%r9w, %r13d
	movswl	%di, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r9d
	addl	%r13d, %r9d
	sarl	$16, %r9d
	movswl	%bx, %r13d
	movswl	%si, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %esi
	sarl	$16, %esi
	imull	$-3329, %esi, %r15d
	addl	%r13d, %r15d
	sarl	$16, %r15d
	addw	%r15w, %r9w
	movq	16(%rsp), %rsi
	movw	%r8w, (%rsi,%rdx,2)
	incq	%rdx
	movw	%r9w, (%rsi,%rdx,2)
	incq	%rdx
L_poly_basemul$2:
	cmpq	$253, %rdx
	jb  	L_poly_basemul$3
	ret
L_poly_csubq$1:
	movq	$0, %rcx
	jmp 	L_poly_csubq$2
L_poly_csubq$3:
	movw	(%rax,%rcx,2), %r9w
	addw	$-3329, %r9w
	movw	%r9w, %bp
	sarw	$15, %bp
	andw	$3329, %bp
	addw	%bp, %r9w
	movw	%r9w, (%rax,%rcx,2)
	incq	%rcx
L_poly_csubq$2:
	cmpq	$256, %rcx
	jb  	L_poly_csubq$3
	ret
L_poly_add2$1:
	movq	$0, %rdx
	jmp 	L_poly_add2$2
L_poly_add2$3:
	movw	(%rax,%rdx,2), %r9w
	movw	(%rcx,%rdx,2), %si
	addw	%si, %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
L_poly_add2$2:
	cmpq	$256, %rdx
	jb  	L_poly_add2$3
	ret
L_sha3_512A_A64$1:
	leaq	32(%rsp), %rdx
	movq	$0, %rax
	movq	$0, %rdi
	jmp 	L_sha3_512A_A64$12
L_sha3_512A_A64$13:
	movq	%rax, (%rdx,%rdi,8)
	incq	%rdi
L_sha3_512A_A64$12:
	cmpq	$25, %rdi
	jb  	L_sha3_512A_A64$13
	movq	%rsi, 8(%rsp)
	movq	$0, %rax
	movq	$0, %rsi
	jmp 	L_sha3_512A_A64$10
L_sha3_512A_A64$11:
	movq	(%rbx,%rax), %rdi
	addq	$8, %rax
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_sha3_512A_A64$10:
	cmpq	$8, %rsi
	jb  	L_sha3_512A_A64$11
	movq	$0, %rdi
	movq	$6, %rax
	orq 	%rax, %rdi
	xorq	%rdi, (%rdx,%rsi,8)
	xorb	$128, 71(%rdx)
	movq	8(%rsp), %rax
	movq	$0, %rbx
	movq	$0, %rsi
	jmp 	L_sha3_512A_A64$5
L_sha3_512A_A64$6:
	movq	%rax, 8(%rsp)
	movq	%rbx, 16(%rsp)
	movq	%rsi, 24(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A64$9:
	leaq	208(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %rbx
	movq	$0, %rsi
	jmp 	L_sha3_512A_A64$7
L_sha3_512A_A64$8:
	movq	(%rdx,%rsi,8), %r9
	movq	%r9, (%rax,%rbx)
	addq	$8, %rbx
	incq	%rsi
L_sha3_512A_A64$7:
	cmpq	$9, %rsi
	jb  	L_sha3_512A_A64$8
	movq	24(%rsp), %rsi
	incq	%rsi
L_sha3_512A_A64$5:
	cmpq	$0, %rsi
	jb  	L_sha3_512A_A64$6
	movq	%rax, 24(%rsp)
	movq	%rbx, 16(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A64$4:
	leaq	208(%rsp), %rsp
	movq	24(%rsp), %rsi
	movq	16(%rsp), %rax
	movq	$0, %rdi
	jmp 	L_sha3_512A_A64$2
L_sha3_512A_A64$3:
	movq	(%rdx,%rdi,8), %r9
	movq	%r9, (%rsi,%rax)
	addq	$8, %rax
	incq	%rdi
L_sha3_512A_A64$2:
	cmpq	$8, %rdi
	jb  	L_sha3_512A_A64$3
	ret
L_sha3_256A_A1568$1:
	movq	%rsi, %mm3
	leaq	32(%rsp), %rdx
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	L_sha3_256A_A1568$20
L_sha3_256A_A1568$21:
	movq	%rax, (%rdx,%rcx,8)
	incq	%rcx
L_sha3_256A_A1568$20:
	cmpq	$25, %rcx
	jb  	L_sha3_256A_A1568$21
	movq	$0, %rax
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1568$18
L_sha3_256A_A1568$19:
	movq	(%rbx,%rax), %rdi
	addq	$8, %rax
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_sha3_256A_A1568$18:
	cmpq	$17, %rsi
	jb  	L_sha3_256A_A1568$19
	movq	%rbx, 8(%rsp)
	movq	%rax, 16(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1568$17:
	leaq	208(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	$0, %r8
	jmp 	L_sha3_256A_A1568$12
L_sha3_256A_A1568$13:
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1568$15
L_sha3_256A_A1568$16:
	movq	(%rax,%rcx), %rdi
	addq	$8, %rcx
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_sha3_256A_A1568$15:
	cmpq	$17, %rsi
	jb  	L_sha3_256A_A1568$16
	movq	%rax, 16(%rsp)
	movq	%rcx, 8(%rsp)
	movq	%r8, 24(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1568$14:
	leaq	208(%rsp), %rsp
	movq	16(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	24(%rsp), %r8
	incq	%r8
L_sha3_256A_A1568$12:
	cmpq	$10, %r8
	jb  	L_sha3_256A_A1568$13
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1568$10
L_sha3_256A_A1568$11:
	movq	(%rax,%rcx), %rdi
	addq	$8, %rcx
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_sha3_256A_A1568$10:
	cmpq	$9, %rsi
	jb  	L_sha3_256A_A1568$11
	movq	$0, %rdi
	movq	$6, %rax
	orq 	%rax, %rdi
	xorq	%rdi, (%rdx,%rsi,8)
	xorb	$128, 135(%rdx)
	movq	%mm3, %rax
	movq	$0, %rcx
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1568$5
L_sha3_256A_A1568$6:
	movq	%rax, 24(%rsp)
	movq	%rcx, 8(%rsp)
	movq	%rsi, 16(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1568$9:
	leaq	208(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1568$7
L_sha3_256A_A1568$8:
	movq	(%rdx,%rsi,8), %r9
	movq	%r9, (%rax,%rcx)
	addq	$8, %rcx
	incq	%rsi
L_sha3_256A_A1568$7:
	cmpq	$17, %rsi
	jb  	L_sha3_256A_A1568$8
	movq	16(%rsp), %rsi
	incq	%rsi
L_sha3_256A_A1568$5:
	cmpq	$0, %rsi
	jb  	L_sha3_256A_A1568$6
	movq	%rax, 16(%rsp)
	movq	%rcx, 8(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1568$4:
	leaq	208(%rsp), %rsp
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rax
	movq	$0, %rcx
	jmp 	L_sha3_256A_A1568$2
L_sha3_256A_A1568$3:
	movq	(%rdx,%rcx,8), %r9
	movq	%r9, (%rsi,%rax)
	addq	$8, %rax
	incq	%rcx
L_sha3_256A_A1568$2:
	cmpq	$4, %rcx
	jb  	L_sha3_256A_A1568$3
	ret
L_shake128_squeezeblock$1:
	movq	%rsi, 8(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake128_squeezeblock$4:
	leaq	208(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rsi
	jmp 	L_shake128_squeezeblock$2
L_shake128_squeezeblock$3:
	movq	(%rdx,%rsi,8), %r9
	movq	%r9, (%rax,%rcx)
	addq	$8, %rcx
	incq	%rsi
L_shake128_squeezeblock$2:
	cmpq	$21, %rsi
	jb  	L_shake128_squeezeblock$3
	ret
L_shake128_absorb34$1:
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	L_shake128_absorb34$4
L_shake128_absorb34$5:
	movq	%rax, (%rdx,%rcx,8)
	incq	%rcx
L_shake128_absorb34$4:
	cmpq	$25, %rcx
	jb  	L_shake128_absorb34$5
	movq	$0, %rax
	movq	$0, %rsi
	jmp 	L_shake128_absorb34$2
L_shake128_absorb34$3:
	movq	(%rbx,%rax), %rdi
	addq	$8, %rax
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_shake128_absorb34$2:
	cmpq	$4, %rsi
	jb  	L_shake128_absorb34$3
	movq	$0, %rdi
	movzwq	(%rbx,%rax), %rax
	orq 	%rax, %rdi
	movq	$31, %rax
	shlq	$16, %rax
	orq 	%rax, %rdi
	xorq	%rdi, (%rdx,%rsi,8)
	xorb	$128, 167(%rdx)
	ret
L_sha3_512A_A33$1:
	leaq	32(%rsp), %rdx
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	L_sha3_512A_A33$12
L_sha3_512A_A33$13:
	movq	%rax, (%rdx,%rcx,8)
	incq	%rcx
L_sha3_512A_A33$12:
	cmpq	$25, %rcx
	jb  	L_sha3_512A_A33$13
	movq	%rsi, 8(%rsp)
	movq	$0, %rax
	movq	$0, %rsi
	jmp 	L_sha3_512A_A33$10
L_sha3_512A_A33$11:
	movq	(%rbx,%rax), %rdi
	addq	$8, %rax
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_sha3_512A_A33$10:
	cmpq	$4, %rsi
	jb  	L_sha3_512A_A33$11
	movq	$0, %rdi
	movzbq	(%rbx,%rax), %rax
	orq 	$1536, %rax
	orq 	%rax, %rdi
	xorq	%rdi, (%rdx,%rsi,8)
	xorb	$128, 71(%rdx)
	movq	8(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rsi
	jmp 	L_sha3_512A_A33$5
L_sha3_512A_A33$6:
	movq	%rax, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%rsi, 24(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A33$9:
	leaq	208(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	$0, %rsi
	jmp 	L_sha3_512A_A33$7
L_sha3_512A_A33$8:
	movq	(%rdx,%rsi,8), %r9
	movq	%r9, (%rax,%rcx)
	addq	$8, %rcx
	incq	%rsi
L_sha3_512A_A33$7:
	cmpq	$9, %rsi
	jb  	L_sha3_512A_A33$8
	movq	24(%rsp), %rsi
	incq	%rsi
L_sha3_512A_A33$5:
	cmpq	$0, %rsi
	jb  	L_sha3_512A_A33$6
	movq	%rax, 24(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A33$4:
	leaq	208(%rsp), %rsp
	movq	24(%rsp), %rsi
	movq	16(%rsp), %rax
	movq	$0, %rcx
	jmp 	L_sha3_512A_A33$2
L_sha3_512A_A33$3:
	movq	(%rdx,%rcx,8), %r9
	movq	%r9, (%rsi,%rax)
	addq	$8, %rax
	incq	%rcx
L_sha3_512A_A33$2:
	cmpq	$8, %rcx
	jb  	L_sha3_512A_A33$3
	ret
L_shake256_A32__A1600$1:
	movq	%rsi, %mm3
	movq	%rax, 8(%rsp)
	leaq	32(%rsp), %rdx
	movq	$0, %rax
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1600$22
L_shake256_A32__A1600$23:
	movq	%rax, (%rdx,%rsi,8)
	incq	%rsi
L_shake256_A32__A1600$22:
	cmpq	$25, %rsi
	jb  	L_shake256_A32__A1600$23
	movq	$0, %rax
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1600$20
L_shake256_A32__A1600$21:
	movq	(%rdi,%rax), %r8
	addq	$8, %rax
	xorq	%r8, (%rdx,%rsi,8)
	incq	%rsi
L_shake256_A32__A1600$20:
	cmpq	$4, %rsi
	jb  	L_shake256_A32__A1600$21
	movq	8(%rsp), %rax
	movq	$0, %rbx
	movq	(%rax,%rbx), %rdi
	xorq	%rdi, 32(%rdx)
	addq	$8, %rbx
	movq	$5, %rsi
	jmp 	L_shake256_A32__A1600$18
L_shake256_A32__A1600$19:
	movq	(%rax,%rbx), %rdi
	addq	$8, %rbx
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_shake256_A32__A1600$18:
	cmpq	$17, %rsi
	jb  	L_shake256_A32__A1600$19
	movq	%rax, 8(%rsp)
	movq	%rbx, 16(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1600$17:
	leaq	208(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %rbx
	movq	$0, %r8
	jmp 	L_shake256_A32__A1600$12
L_shake256_A32__A1600$13:
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1600$15
L_shake256_A32__A1600$16:
	movq	(%rax,%rbx), %rdi
	addq	$8, %rbx
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_shake256_A32__A1600$15:
	cmpq	$17, %rsi
	jb  	L_shake256_A32__A1600$16
	movq	%rax, 16(%rsp)
	movq	%rbx, 8(%rsp)
	movq	%r8, 24(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1600$14:
	leaq	208(%rsp), %rsp
	movq	16(%rsp), %rax
	movq	8(%rsp), %rbx
	movq	24(%rsp), %r8
	incq	%r8
L_shake256_A32__A1600$12:
	cmpq	$10, %r8
	jb  	L_shake256_A32__A1600$13
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1600$10
L_shake256_A32__A1600$11:
	movq	(%rax,%rbx), %rdi
	addq	$8, %rbx
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_shake256_A32__A1600$10:
	cmpq	$13, %rsi
	jb  	L_shake256_A32__A1600$11
	movq	$0, %rdi
	movq	$31, %rax
	orq 	%rax, %rdi
	xorq	%rdi, (%rdx,%rsi,8)
	xorb	$128, 135(%rdx)
	movq	%mm3, %rax
	movq	$0, %rbx
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1600$5
L_shake256_A32__A1600$6:
	movq	%rax, 24(%rsp)
	movq	%rbx, 8(%rsp)
	movq	%rsi, 16(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1600$9:
	leaq	208(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	8(%rsp), %rbx
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1600$7
L_shake256_A32__A1600$8:
	movq	(%rdx,%rsi,8), %r9
	movq	%r9, (%rax,%rbx)
	addq	$8, %rbx
	incq	%rsi
L_shake256_A32__A1600$7:
	cmpq	$17, %rsi
	jb  	L_shake256_A32__A1600$8
	movq	16(%rsp), %rsi
	incq	%rsi
L_shake256_A32__A1600$5:
	cmpq	$0, %rsi
	jb  	L_shake256_A32__A1600$6
	movq	%rax, 16(%rsp)
	movq	%rbx, 8(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1600$4:
	leaq	208(%rsp), %rsp
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rax
	movq	$0, %rdi
	jmp 	L_shake256_A32__A1600$2
L_shake256_A32__A1600$3:
	movq	(%rdx,%rdi,8), %r9
	movq	%r9, (%rsi,%rax)
	addq	$8, %rax
	incq	%rdi
L_shake256_A32__A1600$2:
	cmpq	$4, %rdi
	jb  	L_shake256_A32__A1600$3
	ret
L_shake256_128_33$1:
	leaq	32(%rsp), %rdx
	movq	$0, %rax
	movq	$0, %rdi
	jmp 	L_shake256_128_33$12
L_shake256_128_33$13:
	movq	%rax, (%rdx,%rdi,8)
	incq	%rdi
L_shake256_128_33$12:
	cmpq	$25, %rdi
	jb  	L_shake256_128_33$13
	movq	%rsi, 8(%rsp)
	movq	$0, %rax
	movq	$0, %rsi
	jmp 	L_shake256_128_33$10
L_shake256_128_33$11:
	movq	(%rbx,%rax), %rdi
	addq	$8, %rax
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_shake256_128_33$10:
	cmpq	$4, %rsi
	jb  	L_shake256_128_33$11
	movq	$0, %rdi
	movzbq	(%rbx,%rax), %rax
	orq 	$7936, %rax
	orq 	%rax, %rdi
	xorq	%rdi, (%rdx,%rsi,8)
	xorb	$128, 135(%rdx)
	movq	8(%rsp), %rax
	movq	$0, %rbx
	movq	$0, %rsi
	jmp 	L_shake256_128_33$5
L_shake256_128_33$6:
	movq	%rax, 8(%rsp)
	movq	%rbx, 16(%rsp)
	movq	%rsi, 24(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_128_33$9:
	leaq	208(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %rbx
	movq	$0, %rsi
	jmp 	L_shake256_128_33$7
L_shake256_128_33$8:
	movq	(%rdx,%rsi,8), %r9
	movq	%r9, (%rax,%rbx)
	addq	$8, %rbx
	incq	%rsi
L_shake256_128_33$7:
	cmpq	$17, %rsi
	jb  	L_shake256_128_33$8
	movq	24(%rsp), %rsi
	incq	%rsi
L_shake256_128_33$5:
	cmpq	$0, %rsi
	jb  	L_shake256_128_33$6
	movq	%rax, 24(%rsp)
	movq	%rbx, 16(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_128_33$4:
	leaq	208(%rsp), %rsp
	movq	24(%rsp), %rsi
	movq	16(%rsp), %rax
	movq	$0, %rdi
	jmp 	L_shake256_128_33$2
L_shake256_128_33$3:
	movq	(%rdx,%rdi,8), %r9
	movq	%r9, (%rsi,%rax)
	addq	$8, %rax
	incq	%rdi
L_shake256_128_33$2:
	cmpq	$16, %rdi
	jb  	L_shake256_128_33$3
	ret
L_keccakf1600_ref$1:
	leaq	16(%rsp), %rax
	movq	$0, %rsi
L_keccakf1600_ref$2:
	movq	%rsi, 8(%rsp)
	call	L_pround_ref$1
L_keccakf1600_ref$4:
	xchg	%rdx, %rax
	leaq	glob_data + 0(%rip), %rdi
	movq	(%rdi,%rsi,8), %rdi
	xorq	%rdi, (%rdx)
	call	L_pround_ref$1
L_keccakf1600_ref$3:
	xchg	%rax, %rdx
	leaq	glob_data + 0(%rip), %rdi
	movq	8(%rdi,%rsi,8), %rdi
	xorq	%rdi, (%rdx)
	movq	8(%rsp), %rsi
	addq	$2, %rsi
	cmpq	$23, %rsi
	jb  	L_keccakf1600_ref$2
	ret
L_pround_ref$1:
	movq	(%rdx), %r11
	movq	8(%rdx), %r10
	movq	16(%rdx), %rbp
	movq	24(%rdx), %rbx
	movq	32(%rdx), %r12
	xorq	40(%rdx), %r11
	xorq	48(%rdx), %r10
	xorq	56(%rdx), %rbp
	xorq	64(%rdx), %rbx
	xorq	72(%rdx), %r12
	xorq	80(%rdx), %r11
	xorq	88(%rdx), %r10
	xorq	96(%rdx), %rbp
	xorq	104(%rdx), %rbx
	xorq	112(%rdx), %r12
	xorq	120(%rdx), %r11
	xorq	128(%rdx), %r10
	xorq	136(%rdx), %rbp
	xorq	144(%rdx), %rbx
	xorq	152(%rdx), %r12
	xorq	160(%rdx), %r11
	xorq	168(%rdx), %r10
	xorq	176(%rdx), %rbp
	xorq	184(%rdx), %rbx
	xorq	192(%rdx), %r12
	movq	%r10, %rdi
	rolq	$1, %rdi
	xorq	%r12, %rdi
	movq	%rbp, %r8
	rolq	$1, %r8
	xorq	%r11, %r8
	movq	%rbx, %r9
	rolq	$1, %r9
	xorq	%r10, %r9
	movq	%r12, %r10
	rolq	$1, %r10
	xorq	%rbp, %r10
	rolq	$1, %r11
	xorq	%rbx, %r11
	movq	(%rdx), %rbx
	xorq	%rdi, %rbx
	movq	48(%rdx), %rbp
	xorq	%r8, %rbp
	rolq	$44, %rbp
	movq	96(%rdx), %r12
	xorq	%r9, %r12
	rolq	$43, %r12
	movq	144(%rdx), %r13
	xorq	%r10, %r13
	rolq	$21, %r13
	movq	192(%rdx), %r14
	xorq	%r11, %r14
	rolq	$14, %r14
	andnq	%r12, %rbp, %r15
	xorq	%rbx, %r15
	movq	%r15, (%rax)
	andnq	%r13, %r12, %r15
	xorq	%rbp, %r15
	movq	%r15, 8(%rax)
	andnq	%r14, %r13, %r15
	xorq	%r12, %r15
	movq	%r15, 16(%rax)
	andnq	%rbx, %r14, %r15
	xorq	%r13, %r15
	movq	%r15, 24(%rax)
	andnq	%rbp, %rbx, %r15
	xorq	%r14, %r15
	movq	%r15, 32(%rax)
	movq	24(%rdx), %rbx
	xorq	%r10, %rbx
	rolq	$28, %rbx
	movq	72(%rdx), %rbp
	xorq	%r11, %rbp
	rolq	$20, %rbp
	movq	80(%rdx), %r12
	xorq	%rdi, %r12
	rolq	$3, %r12
	movq	128(%rdx), %r13
	xorq	%r8, %r13
	rolq	$45, %r13
	movq	176(%rdx), %r14
	xorq	%r9, %r14
	rolq	$61, %r14
	andnq	%r12, %rbp, %r15
	xorq	%rbx, %r15
	movq	%r15, 40(%rax)
	andnq	%r13, %r12, %r15
	xorq	%rbp, %r15
	movq	%r15, 48(%rax)
	andnq	%r14, %r13, %r15
	xorq	%r12, %r15
	movq	%r15, 56(%rax)
	andnq	%rbx, %r14, %r15
	xorq	%r13, %r15
	movq	%r15, 64(%rax)
	andnq	%rbp, %rbx, %r15
	xorq	%r14, %r15
	movq	%r15, 72(%rax)
	movq	8(%rdx), %rbx
	xorq	%r8, %rbx
	rolq	$1, %rbx
	movq	56(%rdx), %rbp
	xorq	%r9, %rbp
	rolq	$6, %rbp
	movq	104(%rdx), %r12
	xorq	%r10, %r12
	rolq	$25, %r12
	movq	152(%rdx), %r13
	xorq	%r11, %r13
	rolq	$8, %r13
	movq	160(%rdx), %r14
	xorq	%rdi, %r14
	rolq	$18, %r14
	andnq	%r12, %rbp, %r15
	xorq	%rbx, %r15
	movq	%r15, 80(%rax)
	andnq	%r13, %r12, %r15
	xorq	%rbp, %r15
	movq	%r15, 88(%rax)
	andnq	%r14, %r13, %r15
	xorq	%r12, %r15
	movq	%r15, 96(%rax)
	andnq	%rbx, %r14, %r15
	xorq	%r13, %r15
	movq	%r15, 104(%rax)
	andnq	%rbp, %rbx, %r15
	xorq	%r14, %r15
	movq	%r15, 112(%rax)
	movq	32(%rdx), %rbx
	xorq	%r11, %rbx
	rolq	$27, %rbx
	movq	40(%rdx), %rbp
	xorq	%rdi, %rbp
	rolq	$36, %rbp
	movq	88(%rdx), %r12
	xorq	%r8, %r12
	rolq	$10, %r12
	movq	136(%rdx), %r13
	xorq	%r9, %r13
	rolq	$15, %r13
	movq	184(%rdx), %r14
	xorq	%r10, %r14
	rolq	$56, %r14
	andnq	%r12, %rbp, %r15
	xorq	%rbx, %r15
	movq	%r15, 120(%rax)
	andnq	%r13, %r12, %r15
	xorq	%rbp, %r15
	movq	%r15, 128(%rax)
	andnq	%r14, %r13, %r15
	xorq	%r12, %r15
	movq	%r15, 136(%rax)
	andnq	%rbx, %r14, %r15
	xorq	%r13, %r15
	movq	%r15, 144(%rax)
	andnq	%rbp, %rbx, %r15
	xorq	%r14, %r15
	movq	%r15, 152(%rax)
	movq	16(%rdx), %rbx
	xorq	%r9, %rbx
	rolq	$62, %rbx
	movq	64(%rdx), %rbp
	xorq	%r10, %rbp
	rolq	$55, %rbp
	movq	112(%rdx), %r12
	xorq	%r11, %r12
	rolq	$39, %r12
	movq	120(%rdx), %r13
	xorq	%rdi, %r13
	rolq	$41, %r13
	movq	168(%rdx), %r14
	xorq	%r8, %r14
	rolq	$2, %r14
	andnq	%r12, %rbp, %r9
	xorq	%rbx, %r9
	movq	%r9, 160(%rax)
	andnq	%r13, %r12, %r9
	xorq	%rbp, %r9
	movq	%r9, 168(%rax)
	andnq	%r14, %r13, %r9
	xorq	%r12, %r9
	movq	%r9, 176(%rax)
	andnq	%rbx, %r14, %r9
	xorq	%r13, %r9
	movq	%r9, 184(%rax)
	andnq	%rbp, %rbx, %r9
	xorq	%r14, %r9
	movq	%r9, 192(%rax)
	ret
	.data
	.p2align	5
glob_data:
G$KECCAK1600_RC:
	.byte	  1,   0,   0,   0,   0,   0,   0,   0, 130, 128,   0,   0,   0,   0,   0,   0
	.byte	138, 128,   0,   0,   0,   0,   0, 128,   0, 128,   0, 128,   0,   0,   0, 128
	.byte	139, 128,   0,   0,   0,   0,   0,   0,   1,   0,   0, 128,   0,   0,   0,   0
	.byte	129, 128,   0, 128,   0,   0,   0, 128,   9, 128,   0,   0,   0,   0,   0, 128
	.byte	138,   0,   0,   0,   0,   0,   0,   0, 136,   0,   0,   0,   0,   0,   0,   0
	.byte	  9, 128,   0, 128,   0,   0,   0,   0,  10,   0,   0, 128,   0,   0,   0,   0
	.byte	139, 128,   0, 128,   0,   0,   0,   0, 139,   0,   0,   0,   0,   0,   0, 128
	.byte	137, 128,   0,   0,   0,   0,   0, 128,   3, 128,   0,   0,   0,   0,   0, 128
	.byte	  2, 128,   0,   0,   0,   0,   0, 128, 128,   0,   0,   0,   0,   0,   0, 128
	.byte	 10, 128,   0,   0,   0,   0,   0,   0,  10,   0,   0, 128,   0,   0,   0, 128
	.byte	129, 128,   0, 128,   0,   0,   0, 128, 128, 128,   0,   0,   0,   0,   0, 128
	.byte	  1,   0,   0, 128,   0,   0,   0,   0,   8, 128,   0, 128,   0,   0,   0, 128
G$jzetas_inv:
	.byte	165,   6,  15,   7, 180,   5,  67,   9,  34,   9,  29,   9,  52,   1, 108,   0
	.byte	 35,  11, 102,   3,  86,   3, 230,   5, 231,   9, 254,   4, 250,   5, 161,   4
	.byte	123,   6, 163,   4,  37,  12, 106,   3,  55,   5,  63,   8, 136,   0, 191,   4
	.byte	129,  11, 185,   5,   5,   5, 215,   7, 159,  10, 166,  10, 184,   8, 208,   9
	.byte	 75,   0, 156,   0, 184,  11,  95,  11, 164,  11, 104,   3, 125,  10,  54,   6
	.byte	162,   8,  90,   2,  54,   7,   9,   3, 147,   0, 122,   8, 247,   9, 246,   0
	.byte	140,   6, 219,   6, 204,   1,  35,   1, 235,   0,  80,  12, 182,  10,  91,  11
	.byte	152,  12, 243,   6, 154,   9, 227,   4, 182,   9, 214,  10,  83,  11,  79,   4
	.byte	251,   4,  92,  10,  41,   4,  65,  11, 213,   2, 228,   5,  64,   9, 142,   1
	.byte	183,   3, 247,   0, 141,   5, 150,  12, 195,   9,  15,   1,  90,   0,  85,   3
	.byte	 68,   7, 131,  12, 138,   4,  82,   6, 154,   2,  64,   1,   8,   0, 253,  10
	.byte	  8,   6,  26,   1,  46,   7,  13,   5,  10,   9,  40,   2, 117,  10,  58,   8
	.byte	 35,   6, 205,   0, 102,  11,   6,   6, 161,  10,  37,  10,   8,   9, 169,   2
	.byte	130,   0,  66,   6,  79,   7,  61,   3, 130,  11, 249,  11,  45,   5, 196,  10
	.byte	 69,   7, 194,   5, 178,   4,  63,   9,  75,  12, 216,   6, 147,  10, 171,   0
	.byte	 55,  12, 226,  11, 115,   7,  44,   7, 237,   5, 103,   1, 246,   2, 161,   5
G$jzetas:
	.byte	237,   8,  11,  10, 154,  11,  20,   7, 213,   5, 142,   5,  31,   1, 202,   0
	.byte	 86,  12, 110,   2,  41,   6, 182,   0, 194,   3,  79,   8,  63,   7, 188,   5
	.byte	 61,   2, 212,   7,   8,   1, 127,   1, 196,   9, 178,   5, 191,   6, 127,  12
	.byte	 88,  10, 249,   3, 220,   2,  96,   2, 251,   6, 155,   1,  52,  12, 222,   6
	.byte	199,   4, 140,   2, 217,  10, 247,   3, 244,   7, 211,   5, 231,  11, 249,   6
	.byte	  4,   2, 249,  12, 193,  11, 103,  10, 175,   6, 119,   8, 126,   0, 189,   5
	.byte	172,   9, 167,  12, 242,  11,  62,   3, 107,   0, 116,   7,  10,  12,  74,   9
	.byte	115,  11, 193,   3,  29,   7,  44,  10, 192,   1, 216,   8, 165,   2,   6,   8
	.byte	178,   8, 174,   1,  43,   2,  75,   3,  30,   8, 103,   3,  14,   6, 105,   0
	.byte	166,   1,  75,   2, 177,   0,  22,  12, 222,  11,  53,  11,  38,   6, 117,   6
	.byte	 11,  12,  10,   3, 135,   4, 110,  12, 248,   9, 203,   5, 167,  10,  95,   4
	.byte	203,   6, 132,   2, 153,   9,  93,   1, 162,   1,  73,   1, 101,  12, 182,  12
	.byte	 49,   3,  73,   4,  91,   2,  98,   2,  42,   5, 252,   7,  72,   7, 128,   1
	.byte	 66,   8, 121,  12, 194,   4, 202,   7, 151,   9, 220,   0,  94,   8, 134,   6
	.byte	 96,   8,   7,   7,   3,   8,  26,   3,  27,   7, 171,   9, 155,   9, 222,   1
	.byte	149,  12, 205,  11, 228,   3, 223,   3, 190,   3,  77,   7, 242,   5,  92,   6
	.ident	"Jasmin Compiler 2026.03.1"
	.section	".note.GNU-stack", "", %progbits
