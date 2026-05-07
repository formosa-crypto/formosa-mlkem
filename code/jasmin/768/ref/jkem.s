	.att_syntax
	.text
	.p2align	5
	.global	jade_kem_mlkem_mlkem768_amd64_ref_dec
	.global	jade_kem_mlkem_mlkem768_amd64_ref_enc
	.global	jade_kem_mlkem_mlkem768_amd64_ref_enc_derand
	.global	jade_kem_mlkem_mlkem768_amd64_ref_keypair
	.global	jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand
	.type	jade_kem_mlkem_mlkem768_amd64_ref_dec, %function
jade_kem_mlkem_mlkem768_amd64_ref_dec:
	movq	%rsp, %rax
	leaq	-14512(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 14456(%rsp)
	movq	%rbp, 14464(%rsp)
	movq	%r12, 14472(%rsp)
	movq	%r13, 14480(%rsp)
	movq	%r14, 14488(%rsp)
	movq	%r15, 14496(%rsp)
	movq	%rax, 14504(%rsp)
	movq	%rdx, %rax
	lfence
	movq	$0, %rcx
	movq	%rdi, %mm0
	movq	%rsi, %mm1
	movq	%rax, %mm2
	leaq	72(%rsp), %r10
	movq	%rax, %rbx
	leaq	2616(%rsp), %rcx
	movq	%rsi, %rdx
	movq	$0, %rdi
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$249
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$250:
	movzbl	(%rdx,%r8), %r9d
	incq	%r8
	movzbl	(%rdx,%r8), %r11d
	incq	%r8
	movzbl	(%rdx,%r8), %ebp
	incq	%r8
	movzbl	(%rdx,%r8), %r12d
	incq	%r8
	movzbl	(%rdx,%r8), %r13d
	incq	%r8
	movl	%r11d, %r14d
	shrl	$2, %r11d
	andl	$3, %r14d
	shll	$8, %r14d
	orl 	%r14d, %r9d
	movl	%ebp, %r14d
	shrl	$4, %ebp
	andl	$15, %r14d
	shll	$6, %r14d
	orl 	%r14d, %r11d
	movl	%r12d, %r14d
	shrl	$6, %r12d
	andl	$63, %r14d
	shll	$4, %r14d
	orl 	%r14d, %ebp
	shll	$2, %r13d
	orl 	%r13d, %r12d
	imull	$3329, %r9d, %r9d
	addl	$512, %r9d
	shrl	$10, %r9d
	movw	%r9w, (%rcx,%rdi,2)
	imull	$3329, %r11d, %r11d
	addl	$512, %r11d
	shrl	$10, %r11d
	movw	%r11w, 2(%rcx,%rdi,2)
	imull	$3329, %ebp, %ebp
	addl	$512, %ebp
	shrl	$10, %ebp
	movw	%bp, 4(%rcx,%rdi,2)
	imull	$3329, %r12d, %r12d
	addl	$512, %r12d
	shrl	$10, %r12d
	movw	%r12w, 6(%rcx,%rdi,2)
	addq	$4, %rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$249:
	cmpq	$765, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$250
	leaq	568(%rsp), %rcx
	leaq	960(%rsi), %rdx
	call	L_i_poly_decompress$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$248:
	leaq	4152(%rsp), %rcx
	movq	%rbx, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$247:
	leaq	4664(%rsp), %rcx
	leaq	384(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$246:
	leaq	5176(%rsp), %rcx
	leaq	768(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$245:
	leaq	2616(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$244:
	leaq	3128(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$243:
	leaq	3640(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$242:
	leaq	1080(%rsp), %rsi
	leaq	4152(%rsp), %rdx
	leaq	2616(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$241:
	leaq	16(%rsp), %rsp
	leaq	1592(%rsp), %rsi
	leaq	4664(%rsp), %rdx
	leaq	3128(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$240:
	leaq	16(%rsp), %rsp
	leaq	1080(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$239:
	leaq	1592(%rsp), %rsi
	leaq	5176(%rsp), %rdx
	leaq	3640(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$238:
	leaq	16(%rsp), %rsp
	leaq	1080(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$237:
	leaq	1080(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$235
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$236:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$235:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$236
	leaq	1080(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$234:
	leaq	1592(%rsp), %rcx
	leaq	568(%rsp), %rdx
	leaq	1080(%rsp), %rsi
	call	L_poly_sub$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$233:
	leaq	1592(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$231
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$232:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$231:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$232
	leaq	1592(%rsp), %rcx
	call	L_i_poly_tomsg$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$230:
	movq	2336(%rax), %rcx
	movq	%rcx, 104(%rsp)
	movq	2344(%rax), %rcx
	movq	%rcx, 112(%rsp)
	movq	2352(%rax), %rcx
	movq	%rcx, 120(%rsp)
	movq	2360(%rax), %rcx
	movq	%rcx, 128(%rsp)
	leaq	136(%rsp), %rsi
	leaq	72(%rsp), %rbx
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$229:
	leaq	224(%rsp), %rsp
	movq	%mm2, %rbp
	leaq	13368(%rsp), %rsi
	leaq	72(%rsp), %rax
	leaq	1152(%rbp), %r10
	leaq	168(%rsp), %r11
	movq	%rsi, %mm3
	movq	%r10, %rbx
	leaq	2616(%rsp), %rcx
	movq	%rbx, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$228:
	leaq	3128(%rsp), %rcx
	leaq	384(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$227:
	leaq	3640(%rsp), %rcx
	leaq	768(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$226:
	movq	1152(%r10), %rcx
	movq	%rcx, (%rsp)
	movq	1160(%r10), %rcx
	movq	%rcx, 8(%rsp)
	movq	1168(%r10), %rcx
	movq	%rcx, 16(%rsp)
	movq	1176(%r10), %rcx
	movq	%rcx, 24(%rsp)
	leaq	1592(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$225:
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
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$223
	movb	$0, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$224
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$223:
	movb	$0, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$224:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$222:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$209
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$210:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$221:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$211
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$212:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$213
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$211
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$213:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$219
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$220
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$219:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$220:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$215
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$211
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$215:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$217
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$211
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$217:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$218:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$216:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$214:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$211:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$212
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$209:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$210
	movq	$0, %rax
	leaq	8760(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$207
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$208:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$207:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$208
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$205
	movb	$0, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$206
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$205:
	movb	$1, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$206:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$204:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$191
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$192:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$203:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$193
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$194:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$195
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$193
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$195:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$201
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$202
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$201:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$202:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$197
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$193
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$197:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$199
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$193
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$199:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$200:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$198:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$196:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$193:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$194
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$191:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$192
	movq	$0, %rax
	leaq	9272(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$189
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$190:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$189:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$190
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$187
	movb	$0, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$188
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$187:
	movb	$2, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$188:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$186:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$173
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$174:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$185:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$175
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$176:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$177
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$175
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$177:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$183
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$184
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$183:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$184:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$179
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$175
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$179:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$181
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$175
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$181:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$182:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$180:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$178:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$175:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$176
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$173:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$174
	movq	$0, %rax
	leaq	9784(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$171
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$172:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$171:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$172
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$169
	movb	$1, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$170
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$169:
	movb	$0, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$170:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$168:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$155
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$156:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$167:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$157
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$158:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$159
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$157
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$159:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$165
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$166
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$165:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$166:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$161
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$157
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$161:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$163
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$157
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$163:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$164:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$162:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$160:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$157:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$158
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$155:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$156
	movq	$0, %rax
	leaq	10296(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$153
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$154:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$153:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$154
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$151
	movb	$1, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$152
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$151:
	movb	$1, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$152:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$150:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$137
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$138:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$149:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$139
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$140:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$141
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$139
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$141:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$147
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$148
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$147:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$148:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$143
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$139
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$143:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$145
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$139
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$145:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$146:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$144:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$142:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$139:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$140
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$137:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$138
	movq	$0, %rax
	leaq	10808(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$135
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$136:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$135:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$136
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$133
	movb	$1, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$134
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$133:
	movb	$2, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$134:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$132:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$119
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$120:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$131:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$121
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$122:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$123
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$121
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$123:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$129
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$130
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$129:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$130:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$125
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$121
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$125:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$127
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$121
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$127:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$128:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$126:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$124:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$121:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$122
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$119:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$120
	movq	$0, %rax
	leaq	11320(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$117
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$118:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$117:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$118
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$115
	movb	$2, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$116
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$115:
	movb	$0, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$116:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$114:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$101
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$102:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$113:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$103
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$104:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$105
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$103
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$105:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$111
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$112
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$111:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$112:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$107
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$103
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$107:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$109
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$103
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$109:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$110:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$108:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$106:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$103:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$104
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$101:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$102
	movq	$0, %rax
	leaq	11832(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$99
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$100:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$99:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$100
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$97
	movb	$2, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$98
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$97:
	movb	$1, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$98:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$96:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$83
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$84:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$95:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$85
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$86:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$87
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$85
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$87:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$93
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$94
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$93:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$94:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$89
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$85
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$89:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$91
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$85
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$91:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$92:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$90:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$88:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$85:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$86
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$83:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$84
	movq	$0, %rax
	leaq	12344(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$81
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$82:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$81:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$82
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$79
	movb	$2, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$80
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$79:
	movb	$2, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$80:
	leaq	368(%rsp), %rdx
	leaq	32(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$78:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$65
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$66:
	movq	%rcx, %mm6
	leaq	368(%rsp), %rdx
	leaq	200(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$77:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$67
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$68:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$69
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$67
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$69:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$75
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$76
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$75:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$76:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$71
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$67
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$71:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$73
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$67
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$73:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$74:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$72:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$70:
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$67:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$68
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$65:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$66
	movq	$0, %rax
	leaq	12856(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$63
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$64:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$63:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$64
	movq	%mm4, %rax
	movb	$0, %cl
	leaq	4152(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$62:
	leaq	176(%rsp), %rsp
	movb	$1, %cl
	leaq	4664(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$61:
	leaq	176(%rsp), %rsp
	movb	$2, %cl
	leaq	5176(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$60:
	leaq	176(%rsp), %rsp
	movq	%mm4, %rax
	movb	$3, %cl
	leaq	5688(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$59:
	leaq	176(%rsp), %rsp
	movb	$4, %cl
	leaq	6200(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$58:
	leaq	176(%rsp), %rsp
	movb	$5, %cl
	leaq	6712(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$57:
	leaq	176(%rsp), %rsp
	movb	$6, %cl
	leaq	1080(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$56:
	leaq	176(%rsp), %rsp
	leaq	4152(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$55:
	leaq	4664(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$54:
	leaq	5176(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$53:
	leaq	7224(%rsp), %rsi
	leaq	8760(%rsp), %rdx
	leaq	4152(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$52:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rsi
	leaq	9272(%rsp), %rdx
	leaq	4664(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$51:
	leaq	16(%rsp), %rsp
	leaq	7224(%rsp), %rcx
	leaq	568(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$50:
	leaq	568(%rsp), %rsi
	leaq	9784(%rsp), %rdx
	leaq	5176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$49:
	leaq	16(%rsp), %rsp
	leaq	7224(%rsp), %rcx
	leaq	568(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$48:
	leaq	7224(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$46
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$47:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$46:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$47
	leaq	7736(%rsp), %rsi
	leaq	10296(%rsp), %rdx
	leaq	4152(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$45:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rsi
	leaq	10808(%rsp), %rdx
	leaq	4664(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$44:
	leaq	16(%rsp), %rsp
	leaq	7736(%rsp), %rcx
	leaq	568(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$43:
	leaq	568(%rsp), %rsi
	leaq	11320(%rsp), %rdx
	leaq	5176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$42:
	leaq	16(%rsp), %rsp
	leaq	7736(%rsp), %rcx
	leaq	568(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$41:
	leaq	7736(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$39
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$40:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$39:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$40
	leaq	8248(%rsp), %rsi
	leaq	11832(%rsp), %rdx
	leaq	4152(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$38:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rsi
	leaq	12344(%rsp), %rdx
	leaq	4664(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$37:
	leaq	16(%rsp), %rsp
	leaq	8248(%rsp), %rcx
	leaq	568(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$36:
	leaq	568(%rsp), %rsi
	leaq	12856(%rsp), %rdx
	leaq	5176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$35:
	leaq	16(%rsp), %rsp
	leaq	8248(%rsp), %rcx
	leaq	568(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$34:
	leaq	8248(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$32
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$33:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$32:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$33
	leaq	568(%rsp), %rsi
	leaq	2616(%rsp), %rdx
	leaq	4152(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$31:
	leaq	16(%rsp), %rsp
	leaq	2104(%rsp), %rsi
	leaq	3128(%rsp), %rdx
	leaq	4664(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$30:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rcx
	leaq	2104(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$29:
	leaq	2104(%rsp), %rsi
	leaq	3640(%rsp), %rdx
	leaq	5176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$28:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rcx
	leaq	2104(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$27:
	leaq	568(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$25
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$26:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$25:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$26
	leaq	7224(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$24:
	leaq	7736(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$23:
	leaq	8248(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$22:
	leaq	568(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$21:
	leaq	7224(%rsp), %rcx
	leaq	5688(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$20:
	leaq	7736(%rsp), %rcx
	leaq	6200(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$19:
	leaq	8248(%rsp), %rcx
	leaq	6712(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$18:
	leaq	568(%rsp), %rcx
	leaq	1080(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$17:
	leaq	568(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$16:
	leaq	7224(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$14
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$15:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$14:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$15
	leaq	7736(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$12
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$13:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$12:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$13
	leaq	8248(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$10
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$11:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$10:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$11
	leaq	568(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$8
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$9:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$8:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$9
	movq	%mm3, %r12
	movq	%r12, %r10
	movq	$0, %rdi
	movq	$0, %r8
	leaq	7224(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$7:
	leaq	7736(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$6:
	leaq	8248(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$5:
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$3
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$4:
	movzwq	7224(%rsp,%rdi,2), %r9
	shlq	$10, %r9
	addq	$1665, %r9
	imulq	$1290167, %r9, %r9
	shrq	$32, %r9
	andq	$1023, %r9
	movzwq	7226(%rsp,%rdi,2), %r11
	shlq	$10, %r11
	addq	$1665, %r11
	imulq	$1290167, %r11, %r11
	shrq	$32, %r11
	andq	$1023, %r11
	movzwq	7228(%rsp,%rdi,2), %rbp
	shlq	$10, %rbp
	addq	$1665, %rbp
	imulq	$1290167, %rbp, %rbp
	shrq	$32, %rbp
	andq	$1023, %rbp
	movzwq	7230(%rsp,%rdi,2), %rax
	shlq	$10, %rax
	addq	$1665, %rax
	imulq	$1290167, %rax, %rax
	shrq	$32, %rax
	andq	$1023, %rax
	movw	%r9w, %si
	andw	$255, %si
	movb	%sil, (%r10,%r8)
	incq	%r8
	shrw	$8, %r9w
	movw	%r11w, %si
	shlw	$2, %si
	orw 	%r9w, %si
	movb	%sil, (%r10,%r8)
	incq	%r8
	shrw	$6, %r11w
	movw	%bp, %si
	shlw	$4, %si
	orw 	%r11w, %si
	movb	%sil, (%r10,%r8)
	incq	%r8
	shrw	$4, %bp
	movw	%ax, %si
	shlw	$6, %si
	orw 	%bp, %si
	movb	%sil, (%r10,%r8)
	incq	%r8
	shrq	$2, %rax
	movb	%al, (%r10,%r8)
	incq	%r8
	addq	$4, %rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$3:
	cmpq	$765, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$4
	leaq	960(%r12), %r10
	leaq	568(%rsp), %rcx
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$2:
	movq	%mm1, %rcx
	leaq	13368(%rsp), %rdx
	movq	$0, %rax
	movb	(%rdx), %sil
	movb	(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1(%rdx), %sil
	movb	1(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	2(%rdx), %sil
	movb	2(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	3(%rdx), %sil
	movb	3(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	4(%rdx), %sil
	movb	4(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	5(%rdx), %sil
	movb	5(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	6(%rdx), %sil
	movb	6(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	7(%rdx), %sil
	movb	7(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	8(%rdx), %sil
	movb	8(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	9(%rdx), %sil
	movb	9(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	10(%rdx), %sil
	movb	10(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	11(%rdx), %sil
	movb	11(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	12(%rdx), %sil
	movb	12(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	13(%rdx), %sil
	movb	13(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	14(%rdx), %sil
	movb	14(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	15(%rdx), %sil
	movb	15(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	16(%rdx), %sil
	movb	16(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	17(%rdx), %sil
	movb	17(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	18(%rdx), %sil
	movb	18(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	19(%rdx), %sil
	movb	19(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	20(%rdx), %sil
	movb	20(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	21(%rdx), %sil
	movb	21(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	22(%rdx), %sil
	movb	22(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	23(%rdx), %sil
	movb	23(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	24(%rdx), %sil
	movb	24(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	25(%rdx), %sil
	movb	25(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	26(%rdx), %sil
	movb	26(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	27(%rdx), %sil
	movb	27(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	28(%rdx), %sil
	movb	28(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	29(%rdx), %sil
	movb	29(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	30(%rdx), %sil
	movb	30(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	31(%rdx), %sil
	movb	31(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	32(%rdx), %sil
	movb	32(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	33(%rdx), %sil
	movb	33(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	34(%rdx), %sil
	movb	34(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	35(%rdx), %sil
	movb	35(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	36(%rdx), %sil
	movb	36(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	37(%rdx), %sil
	movb	37(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	38(%rdx), %sil
	movb	38(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	39(%rdx), %sil
	movb	39(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	40(%rdx), %sil
	movb	40(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	41(%rdx), %sil
	movb	41(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	42(%rdx), %sil
	movb	42(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	43(%rdx), %sil
	movb	43(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	44(%rdx), %sil
	movb	44(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	45(%rdx), %sil
	movb	45(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	46(%rdx), %sil
	movb	46(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	47(%rdx), %sil
	movb	47(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	48(%rdx), %sil
	movb	48(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	49(%rdx), %sil
	movb	49(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	50(%rdx), %sil
	movb	50(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	51(%rdx), %sil
	movb	51(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	52(%rdx), %sil
	movb	52(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	53(%rdx), %sil
	movb	53(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	54(%rdx), %sil
	movb	54(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	55(%rdx), %sil
	movb	55(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	56(%rdx), %sil
	movb	56(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	57(%rdx), %sil
	movb	57(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	58(%rdx), %sil
	movb	58(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	59(%rdx), %sil
	movb	59(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	60(%rdx), %sil
	movb	60(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	61(%rdx), %sil
	movb	61(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	62(%rdx), %sil
	movb	62(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	63(%rdx), %sil
	movb	63(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	64(%rdx), %sil
	movb	64(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	65(%rdx), %sil
	movb	65(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	66(%rdx), %sil
	movb	66(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	67(%rdx), %sil
	movb	67(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	68(%rdx), %sil
	movb	68(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	69(%rdx), %sil
	movb	69(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	70(%rdx), %sil
	movb	70(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	71(%rdx), %sil
	movb	71(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	72(%rdx), %sil
	movb	72(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	73(%rdx), %sil
	movb	73(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	74(%rdx), %sil
	movb	74(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	75(%rdx), %sil
	movb	75(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	76(%rdx), %sil
	movb	76(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	77(%rdx), %sil
	movb	77(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	78(%rdx), %sil
	movb	78(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	79(%rdx), %sil
	movb	79(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	80(%rdx), %sil
	movb	80(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	81(%rdx), %sil
	movb	81(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	82(%rdx), %sil
	movb	82(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	83(%rdx), %sil
	movb	83(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	84(%rdx), %sil
	movb	84(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	85(%rdx), %sil
	movb	85(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	86(%rdx), %sil
	movb	86(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	87(%rdx), %sil
	movb	87(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	88(%rdx), %sil
	movb	88(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	89(%rdx), %sil
	movb	89(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	90(%rdx), %sil
	movb	90(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	91(%rdx), %sil
	movb	91(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	92(%rdx), %sil
	movb	92(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	93(%rdx), %sil
	movb	93(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	94(%rdx), %sil
	movb	94(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	95(%rdx), %sil
	movb	95(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	96(%rdx), %sil
	movb	96(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	97(%rdx), %sil
	movb	97(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	98(%rdx), %sil
	movb	98(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	99(%rdx), %sil
	movb	99(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	100(%rdx), %sil
	movb	100(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	101(%rdx), %sil
	movb	101(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	102(%rdx), %sil
	movb	102(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	103(%rdx), %sil
	movb	103(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	104(%rdx), %sil
	movb	104(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	105(%rdx), %sil
	movb	105(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	106(%rdx), %sil
	movb	106(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	107(%rdx), %sil
	movb	107(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	108(%rdx), %sil
	movb	108(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	109(%rdx), %sil
	movb	109(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	110(%rdx), %sil
	movb	110(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	111(%rdx), %sil
	movb	111(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	112(%rdx), %sil
	movb	112(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	113(%rdx), %sil
	movb	113(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	114(%rdx), %sil
	movb	114(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	115(%rdx), %sil
	movb	115(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	116(%rdx), %sil
	movb	116(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	117(%rdx), %sil
	movb	117(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	118(%rdx), %sil
	movb	118(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	119(%rdx), %sil
	movb	119(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	120(%rdx), %sil
	movb	120(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	121(%rdx), %sil
	movb	121(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	122(%rdx), %sil
	movb	122(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	123(%rdx), %sil
	movb	123(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	124(%rdx), %sil
	movb	124(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	125(%rdx), %sil
	movb	125(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	126(%rdx), %sil
	movb	126(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	127(%rdx), %sil
	movb	127(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	128(%rdx), %sil
	movb	128(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	129(%rdx), %sil
	movb	129(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	130(%rdx), %sil
	movb	130(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	131(%rdx), %sil
	movb	131(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	132(%rdx), %sil
	movb	132(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	133(%rdx), %sil
	movb	133(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	134(%rdx), %sil
	movb	134(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	135(%rdx), %sil
	movb	135(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	136(%rdx), %sil
	movb	136(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	137(%rdx), %sil
	movb	137(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	138(%rdx), %sil
	movb	138(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	139(%rdx), %sil
	movb	139(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	140(%rdx), %sil
	movb	140(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	141(%rdx), %sil
	movb	141(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	142(%rdx), %sil
	movb	142(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	143(%rdx), %sil
	movb	143(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	144(%rdx), %sil
	movb	144(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	145(%rdx), %sil
	movb	145(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	146(%rdx), %sil
	movb	146(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	147(%rdx), %sil
	movb	147(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	148(%rdx), %sil
	movb	148(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	149(%rdx), %sil
	movb	149(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	150(%rdx), %sil
	movb	150(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	151(%rdx), %sil
	movb	151(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	152(%rdx), %sil
	movb	152(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	153(%rdx), %sil
	movb	153(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	154(%rdx), %sil
	movb	154(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	155(%rdx), %sil
	movb	155(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	156(%rdx), %sil
	movb	156(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	157(%rdx), %sil
	movb	157(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	158(%rdx), %sil
	movb	158(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	159(%rdx), %sil
	movb	159(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	160(%rdx), %sil
	movb	160(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	161(%rdx), %sil
	movb	161(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	162(%rdx), %sil
	movb	162(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	163(%rdx), %sil
	movb	163(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	164(%rdx), %sil
	movb	164(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	165(%rdx), %sil
	movb	165(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	166(%rdx), %sil
	movb	166(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	167(%rdx), %sil
	movb	167(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	168(%rdx), %sil
	movb	168(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	169(%rdx), %sil
	movb	169(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	170(%rdx), %sil
	movb	170(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	171(%rdx), %sil
	movb	171(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	172(%rdx), %sil
	movb	172(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	173(%rdx), %sil
	movb	173(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	174(%rdx), %sil
	movb	174(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	175(%rdx), %sil
	movb	175(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	176(%rdx), %sil
	movb	176(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	177(%rdx), %sil
	movb	177(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	178(%rdx), %sil
	movb	178(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	179(%rdx), %sil
	movb	179(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	180(%rdx), %sil
	movb	180(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	181(%rdx), %sil
	movb	181(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	182(%rdx), %sil
	movb	182(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	183(%rdx), %sil
	movb	183(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	184(%rdx), %sil
	movb	184(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	185(%rdx), %sil
	movb	185(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	186(%rdx), %sil
	movb	186(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	187(%rdx), %sil
	movb	187(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	188(%rdx), %sil
	movb	188(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	189(%rdx), %sil
	movb	189(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	190(%rdx), %sil
	movb	190(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	191(%rdx), %sil
	movb	191(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	192(%rdx), %sil
	movb	192(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	193(%rdx), %sil
	movb	193(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	194(%rdx), %sil
	movb	194(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	195(%rdx), %sil
	movb	195(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	196(%rdx), %sil
	movb	196(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	197(%rdx), %sil
	movb	197(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	198(%rdx), %sil
	movb	198(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	199(%rdx), %sil
	movb	199(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	200(%rdx), %sil
	movb	200(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	201(%rdx), %sil
	movb	201(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	202(%rdx), %sil
	movb	202(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	203(%rdx), %sil
	movb	203(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	204(%rdx), %sil
	movb	204(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	205(%rdx), %sil
	movb	205(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	206(%rdx), %sil
	movb	206(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	207(%rdx), %sil
	movb	207(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	208(%rdx), %sil
	movb	208(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	209(%rdx), %sil
	movb	209(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	210(%rdx), %sil
	movb	210(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	211(%rdx), %sil
	movb	211(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	212(%rdx), %sil
	movb	212(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	213(%rdx), %sil
	movb	213(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	214(%rdx), %sil
	movb	214(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	215(%rdx), %sil
	movb	215(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	216(%rdx), %sil
	movb	216(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	217(%rdx), %sil
	movb	217(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	218(%rdx), %sil
	movb	218(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	219(%rdx), %sil
	movb	219(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	220(%rdx), %sil
	movb	220(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	221(%rdx), %sil
	movb	221(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	222(%rdx), %sil
	movb	222(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	223(%rdx), %sil
	movb	223(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	224(%rdx), %sil
	movb	224(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	225(%rdx), %sil
	movb	225(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	226(%rdx), %sil
	movb	226(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	227(%rdx), %sil
	movb	227(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	228(%rdx), %sil
	movb	228(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	229(%rdx), %sil
	movb	229(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	230(%rdx), %sil
	movb	230(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	231(%rdx), %sil
	movb	231(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	232(%rdx), %sil
	movb	232(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	233(%rdx), %sil
	movb	233(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	234(%rdx), %sil
	movb	234(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	235(%rdx), %sil
	movb	235(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	236(%rdx), %sil
	movb	236(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	237(%rdx), %sil
	movb	237(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	238(%rdx), %sil
	movb	238(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	239(%rdx), %sil
	movb	239(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	240(%rdx), %sil
	movb	240(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	241(%rdx), %sil
	movb	241(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	242(%rdx), %sil
	movb	242(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	243(%rdx), %sil
	movb	243(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	244(%rdx), %sil
	movb	244(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	245(%rdx), %sil
	movb	245(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	246(%rdx), %sil
	movb	246(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	247(%rdx), %sil
	movb	247(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	248(%rdx), %sil
	movb	248(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	249(%rdx), %sil
	movb	249(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	250(%rdx), %sil
	movb	250(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	251(%rdx), %sil
	movb	251(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	252(%rdx), %sil
	movb	252(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	253(%rdx), %sil
	movb	253(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	254(%rdx), %sil
	movb	254(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	255(%rdx), %sil
	movb	255(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	256(%rdx), %sil
	movb	256(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	257(%rdx), %sil
	movb	257(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	258(%rdx), %sil
	movb	258(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	259(%rdx), %sil
	movb	259(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	260(%rdx), %sil
	movb	260(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	261(%rdx), %sil
	movb	261(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	262(%rdx), %sil
	movb	262(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	263(%rdx), %sil
	movb	263(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	264(%rdx), %sil
	movb	264(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	265(%rdx), %sil
	movb	265(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	266(%rdx), %sil
	movb	266(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	267(%rdx), %sil
	movb	267(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	268(%rdx), %sil
	movb	268(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	269(%rdx), %sil
	movb	269(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	270(%rdx), %sil
	movb	270(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	271(%rdx), %sil
	movb	271(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	272(%rdx), %sil
	movb	272(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	273(%rdx), %sil
	movb	273(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	274(%rdx), %sil
	movb	274(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	275(%rdx), %sil
	movb	275(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	276(%rdx), %sil
	movb	276(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	277(%rdx), %sil
	movb	277(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	278(%rdx), %sil
	movb	278(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	279(%rdx), %sil
	movb	279(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	280(%rdx), %sil
	movb	280(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	281(%rdx), %sil
	movb	281(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	282(%rdx), %sil
	movb	282(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	283(%rdx), %sil
	movb	283(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	284(%rdx), %sil
	movb	284(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	285(%rdx), %sil
	movb	285(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	286(%rdx), %sil
	movb	286(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	287(%rdx), %sil
	movb	287(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	288(%rdx), %sil
	movb	288(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	289(%rdx), %sil
	movb	289(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	290(%rdx), %sil
	movb	290(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	291(%rdx), %sil
	movb	291(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	292(%rdx), %sil
	movb	292(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	293(%rdx), %sil
	movb	293(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	294(%rdx), %sil
	movb	294(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	295(%rdx), %sil
	movb	295(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	296(%rdx), %sil
	movb	296(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	297(%rdx), %sil
	movb	297(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	298(%rdx), %sil
	movb	298(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	299(%rdx), %sil
	movb	299(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	300(%rdx), %sil
	movb	300(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	301(%rdx), %sil
	movb	301(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	302(%rdx), %sil
	movb	302(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	303(%rdx), %sil
	movb	303(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	304(%rdx), %sil
	movb	304(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	305(%rdx), %sil
	movb	305(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	306(%rdx), %sil
	movb	306(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	307(%rdx), %sil
	movb	307(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	308(%rdx), %sil
	movb	308(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	309(%rdx), %sil
	movb	309(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	310(%rdx), %sil
	movb	310(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	311(%rdx), %sil
	movb	311(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	312(%rdx), %sil
	movb	312(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	313(%rdx), %sil
	movb	313(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	314(%rdx), %sil
	movb	314(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	315(%rdx), %sil
	movb	315(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	316(%rdx), %sil
	movb	316(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	317(%rdx), %sil
	movb	317(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	318(%rdx), %sil
	movb	318(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	319(%rdx), %sil
	movb	319(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	320(%rdx), %sil
	movb	320(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	321(%rdx), %sil
	movb	321(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	322(%rdx), %sil
	movb	322(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	323(%rdx), %sil
	movb	323(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	324(%rdx), %sil
	movb	324(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	325(%rdx), %sil
	movb	325(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	326(%rdx), %sil
	movb	326(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	327(%rdx), %sil
	movb	327(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	328(%rdx), %sil
	movb	328(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	329(%rdx), %sil
	movb	329(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	330(%rdx), %sil
	movb	330(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	331(%rdx), %sil
	movb	331(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	332(%rdx), %sil
	movb	332(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	333(%rdx), %sil
	movb	333(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	334(%rdx), %sil
	movb	334(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	335(%rdx), %sil
	movb	335(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	336(%rdx), %sil
	movb	336(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	337(%rdx), %sil
	movb	337(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	338(%rdx), %sil
	movb	338(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	339(%rdx), %sil
	movb	339(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	340(%rdx), %sil
	movb	340(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	341(%rdx), %sil
	movb	341(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	342(%rdx), %sil
	movb	342(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	343(%rdx), %sil
	movb	343(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	344(%rdx), %sil
	movb	344(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	345(%rdx), %sil
	movb	345(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	346(%rdx), %sil
	movb	346(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	347(%rdx), %sil
	movb	347(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	348(%rdx), %sil
	movb	348(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	349(%rdx), %sil
	movb	349(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	350(%rdx), %sil
	movb	350(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	351(%rdx), %sil
	movb	351(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	352(%rdx), %sil
	movb	352(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	353(%rdx), %sil
	movb	353(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	354(%rdx), %sil
	movb	354(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	355(%rdx), %sil
	movb	355(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	356(%rdx), %sil
	movb	356(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	357(%rdx), %sil
	movb	357(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	358(%rdx), %sil
	movb	358(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	359(%rdx), %sil
	movb	359(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	360(%rdx), %sil
	movb	360(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	361(%rdx), %sil
	movb	361(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	362(%rdx), %sil
	movb	362(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	363(%rdx), %sil
	movb	363(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	364(%rdx), %sil
	movb	364(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	365(%rdx), %sil
	movb	365(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	366(%rdx), %sil
	movb	366(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	367(%rdx), %sil
	movb	367(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	368(%rdx), %sil
	movb	368(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	369(%rdx), %sil
	movb	369(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	370(%rdx), %sil
	movb	370(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	371(%rdx), %sil
	movb	371(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	372(%rdx), %sil
	movb	372(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	373(%rdx), %sil
	movb	373(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	374(%rdx), %sil
	movb	374(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	375(%rdx), %sil
	movb	375(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	376(%rdx), %sil
	movb	376(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	377(%rdx), %sil
	movb	377(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	378(%rdx), %sil
	movb	378(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	379(%rdx), %sil
	movb	379(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	380(%rdx), %sil
	movb	380(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	381(%rdx), %sil
	movb	381(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	382(%rdx), %sil
	movb	382(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	383(%rdx), %sil
	movb	383(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	384(%rdx), %sil
	movb	384(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	385(%rdx), %sil
	movb	385(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	386(%rdx), %sil
	movb	386(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	387(%rdx), %sil
	movb	387(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	388(%rdx), %sil
	movb	388(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	389(%rdx), %sil
	movb	389(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	390(%rdx), %sil
	movb	390(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	391(%rdx), %sil
	movb	391(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	392(%rdx), %sil
	movb	392(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	393(%rdx), %sil
	movb	393(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	394(%rdx), %sil
	movb	394(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	395(%rdx), %sil
	movb	395(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	396(%rdx), %sil
	movb	396(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	397(%rdx), %sil
	movb	397(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	398(%rdx), %sil
	movb	398(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	399(%rdx), %sil
	movb	399(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	400(%rdx), %sil
	movb	400(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	401(%rdx), %sil
	movb	401(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	402(%rdx), %sil
	movb	402(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	403(%rdx), %sil
	movb	403(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	404(%rdx), %sil
	movb	404(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	405(%rdx), %sil
	movb	405(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	406(%rdx), %sil
	movb	406(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	407(%rdx), %sil
	movb	407(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	408(%rdx), %sil
	movb	408(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	409(%rdx), %sil
	movb	409(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	410(%rdx), %sil
	movb	410(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	411(%rdx), %sil
	movb	411(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	412(%rdx), %sil
	movb	412(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	413(%rdx), %sil
	movb	413(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	414(%rdx), %sil
	movb	414(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	415(%rdx), %sil
	movb	415(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	416(%rdx), %sil
	movb	416(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	417(%rdx), %sil
	movb	417(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	418(%rdx), %sil
	movb	418(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	419(%rdx), %sil
	movb	419(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	420(%rdx), %sil
	movb	420(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	421(%rdx), %sil
	movb	421(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	422(%rdx), %sil
	movb	422(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	423(%rdx), %sil
	movb	423(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	424(%rdx), %sil
	movb	424(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	425(%rdx), %sil
	movb	425(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	426(%rdx), %sil
	movb	426(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	427(%rdx), %sil
	movb	427(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	428(%rdx), %sil
	movb	428(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	429(%rdx), %sil
	movb	429(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	430(%rdx), %sil
	movb	430(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	431(%rdx), %sil
	movb	431(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	432(%rdx), %sil
	movb	432(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	433(%rdx), %sil
	movb	433(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	434(%rdx), %sil
	movb	434(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	435(%rdx), %sil
	movb	435(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	436(%rdx), %sil
	movb	436(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	437(%rdx), %sil
	movb	437(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	438(%rdx), %sil
	movb	438(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	439(%rdx), %sil
	movb	439(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	440(%rdx), %sil
	movb	440(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	441(%rdx), %sil
	movb	441(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	442(%rdx), %sil
	movb	442(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	443(%rdx), %sil
	movb	443(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	444(%rdx), %sil
	movb	444(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	445(%rdx), %sil
	movb	445(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	446(%rdx), %sil
	movb	446(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	447(%rdx), %sil
	movb	447(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	448(%rdx), %sil
	movb	448(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	449(%rdx), %sil
	movb	449(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	450(%rdx), %sil
	movb	450(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	451(%rdx), %sil
	movb	451(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	452(%rdx), %sil
	movb	452(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	453(%rdx), %sil
	movb	453(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	454(%rdx), %sil
	movb	454(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	455(%rdx), %sil
	movb	455(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	456(%rdx), %sil
	movb	456(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	457(%rdx), %sil
	movb	457(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	458(%rdx), %sil
	movb	458(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	459(%rdx), %sil
	movb	459(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	460(%rdx), %sil
	movb	460(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	461(%rdx), %sil
	movb	461(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	462(%rdx), %sil
	movb	462(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	463(%rdx), %sil
	movb	463(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	464(%rdx), %sil
	movb	464(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	465(%rdx), %sil
	movb	465(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	466(%rdx), %sil
	movb	466(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	467(%rdx), %sil
	movb	467(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	468(%rdx), %sil
	movb	468(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	469(%rdx), %sil
	movb	469(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	470(%rdx), %sil
	movb	470(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	471(%rdx), %sil
	movb	471(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	472(%rdx), %sil
	movb	472(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	473(%rdx), %sil
	movb	473(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	474(%rdx), %sil
	movb	474(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	475(%rdx), %sil
	movb	475(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	476(%rdx), %sil
	movb	476(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	477(%rdx), %sil
	movb	477(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	478(%rdx), %sil
	movb	478(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	479(%rdx), %sil
	movb	479(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	480(%rdx), %sil
	movb	480(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	481(%rdx), %sil
	movb	481(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	482(%rdx), %sil
	movb	482(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	483(%rdx), %sil
	movb	483(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	484(%rdx), %sil
	movb	484(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	485(%rdx), %sil
	movb	485(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	486(%rdx), %sil
	movb	486(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	487(%rdx), %sil
	movb	487(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	488(%rdx), %sil
	movb	488(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	489(%rdx), %sil
	movb	489(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	490(%rdx), %sil
	movb	490(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	491(%rdx), %sil
	movb	491(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	492(%rdx), %sil
	movb	492(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	493(%rdx), %sil
	movb	493(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	494(%rdx), %sil
	movb	494(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	495(%rdx), %sil
	movb	495(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	496(%rdx), %sil
	movb	496(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	497(%rdx), %sil
	movb	497(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	498(%rdx), %sil
	movb	498(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	499(%rdx), %sil
	movb	499(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	500(%rdx), %sil
	movb	500(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	501(%rdx), %sil
	movb	501(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	502(%rdx), %sil
	movb	502(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	503(%rdx), %sil
	movb	503(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	504(%rdx), %sil
	movb	504(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	505(%rdx), %sil
	movb	505(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	506(%rdx), %sil
	movb	506(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	507(%rdx), %sil
	movb	507(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	508(%rdx), %sil
	movb	508(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	509(%rdx), %sil
	movb	509(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	510(%rdx), %sil
	movb	510(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	511(%rdx), %sil
	movb	511(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	512(%rdx), %sil
	movb	512(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	513(%rdx), %sil
	movb	513(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	514(%rdx), %sil
	movb	514(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	515(%rdx), %sil
	movb	515(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	516(%rdx), %sil
	movb	516(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	517(%rdx), %sil
	movb	517(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	518(%rdx), %sil
	movb	518(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	519(%rdx), %sil
	movb	519(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	520(%rdx), %sil
	movb	520(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	521(%rdx), %sil
	movb	521(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	522(%rdx), %sil
	movb	522(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	523(%rdx), %sil
	movb	523(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	524(%rdx), %sil
	movb	524(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	525(%rdx), %sil
	movb	525(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	526(%rdx), %sil
	movb	526(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	527(%rdx), %sil
	movb	527(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	528(%rdx), %sil
	movb	528(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	529(%rdx), %sil
	movb	529(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	530(%rdx), %sil
	movb	530(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	531(%rdx), %sil
	movb	531(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	532(%rdx), %sil
	movb	532(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	533(%rdx), %sil
	movb	533(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	534(%rdx), %sil
	movb	534(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	535(%rdx), %sil
	movb	535(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	536(%rdx), %sil
	movb	536(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	537(%rdx), %sil
	movb	537(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	538(%rdx), %sil
	movb	538(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	539(%rdx), %sil
	movb	539(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	540(%rdx), %sil
	movb	540(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	541(%rdx), %sil
	movb	541(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	542(%rdx), %sil
	movb	542(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	543(%rdx), %sil
	movb	543(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	544(%rdx), %sil
	movb	544(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	545(%rdx), %sil
	movb	545(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	546(%rdx), %sil
	movb	546(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	547(%rdx), %sil
	movb	547(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	548(%rdx), %sil
	movb	548(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	549(%rdx), %sil
	movb	549(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	550(%rdx), %sil
	movb	550(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	551(%rdx), %sil
	movb	551(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	552(%rdx), %sil
	movb	552(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	553(%rdx), %sil
	movb	553(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	554(%rdx), %sil
	movb	554(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	555(%rdx), %sil
	movb	555(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	556(%rdx), %sil
	movb	556(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	557(%rdx), %sil
	movb	557(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	558(%rdx), %sil
	movb	558(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	559(%rdx), %sil
	movb	559(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	560(%rdx), %sil
	movb	560(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	561(%rdx), %sil
	movb	561(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	562(%rdx), %sil
	movb	562(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	563(%rdx), %sil
	movb	563(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	564(%rdx), %sil
	movb	564(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	565(%rdx), %sil
	movb	565(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	566(%rdx), %sil
	movb	566(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	567(%rdx), %sil
	movb	567(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	568(%rdx), %sil
	movb	568(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	569(%rdx), %sil
	movb	569(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	570(%rdx), %sil
	movb	570(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	571(%rdx), %sil
	movb	571(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	572(%rdx), %sil
	movb	572(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	573(%rdx), %sil
	movb	573(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	574(%rdx), %sil
	movb	574(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	575(%rdx), %sil
	movb	575(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	576(%rdx), %sil
	movb	576(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	577(%rdx), %sil
	movb	577(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	578(%rdx), %sil
	movb	578(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	579(%rdx), %sil
	movb	579(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	580(%rdx), %sil
	movb	580(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	581(%rdx), %sil
	movb	581(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	582(%rdx), %sil
	movb	582(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	583(%rdx), %sil
	movb	583(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	584(%rdx), %sil
	movb	584(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	585(%rdx), %sil
	movb	585(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	586(%rdx), %sil
	movb	586(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	587(%rdx), %sil
	movb	587(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	588(%rdx), %sil
	movb	588(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	589(%rdx), %sil
	movb	589(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	590(%rdx), %sil
	movb	590(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	591(%rdx), %sil
	movb	591(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	592(%rdx), %sil
	movb	592(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	593(%rdx), %sil
	movb	593(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	594(%rdx), %sil
	movb	594(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	595(%rdx), %sil
	movb	595(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	596(%rdx), %sil
	movb	596(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	597(%rdx), %sil
	movb	597(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	598(%rdx), %sil
	movb	598(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	599(%rdx), %sil
	movb	599(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	600(%rdx), %sil
	movb	600(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	601(%rdx), %sil
	movb	601(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	602(%rdx), %sil
	movb	602(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	603(%rdx), %sil
	movb	603(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	604(%rdx), %sil
	movb	604(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	605(%rdx), %sil
	movb	605(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	606(%rdx), %sil
	movb	606(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	607(%rdx), %sil
	movb	607(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	608(%rdx), %sil
	movb	608(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	609(%rdx), %sil
	movb	609(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	610(%rdx), %sil
	movb	610(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	611(%rdx), %sil
	movb	611(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	612(%rdx), %sil
	movb	612(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	613(%rdx), %sil
	movb	613(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	614(%rdx), %sil
	movb	614(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	615(%rdx), %sil
	movb	615(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	616(%rdx), %sil
	movb	616(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	617(%rdx), %sil
	movb	617(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	618(%rdx), %sil
	movb	618(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	619(%rdx), %sil
	movb	619(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	620(%rdx), %sil
	movb	620(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	621(%rdx), %sil
	movb	621(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	622(%rdx), %sil
	movb	622(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	623(%rdx), %sil
	movb	623(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	624(%rdx), %sil
	movb	624(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	625(%rdx), %sil
	movb	625(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	626(%rdx), %sil
	movb	626(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	627(%rdx), %sil
	movb	627(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	628(%rdx), %sil
	movb	628(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	629(%rdx), %sil
	movb	629(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	630(%rdx), %sil
	movb	630(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	631(%rdx), %sil
	movb	631(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	632(%rdx), %sil
	movb	632(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	633(%rdx), %sil
	movb	633(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	634(%rdx), %sil
	movb	634(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	635(%rdx), %sil
	movb	635(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	636(%rdx), %sil
	movb	636(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	637(%rdx), %sil
	movb	637(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	638(%rdx), %sil
	movb	638(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	639(%rdx), %sil
	movb	639(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	640(%rdx), %sil
	movb	640(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	641(%rdx), %sil
	movb	641(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	642(%rdx), %sil
	movb	642(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	643(%rdx), %sil
	movb	643(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	644(%rdx), %sil
	movb	644(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	645(%rdx), %sil
	movb	645(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	646(%rdx), %sil
	movb	646(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	647(%rdx), %sil
	movb	647(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	648(%rdx), %sil
	movb	648(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	649(%rdx), %sil
	movb	649(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	650(%rdx), %sil
	movb	650(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	651(%rdx), %sil
	movb	651(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	652(%rdx), %sil
	movb	652(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	653(%rdx), %sil
	movb	653(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	654(%rdx), %sil
	movb	654(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	655(%rdx), %sil
	movb	655(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	656(%rdx), %sil
	movb	656(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	657(%rdx), %sil
	movb	657(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	658(%rdx), %sil
	movb	658(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	659(%rdx), %sil
	movb	659(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	660(%rdx), %sil
	movb	660(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	661(%rdx), %sil
	movb	661(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	662(%rdx), %sil
	movb	662(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	663(%rdx), %sil
	movb	663(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	664(%rdx), %sil
	movb	664(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	665(%rdx), %sil
	movb	665(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	666(%rdx), %sil
	movb	666(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	667(%rdx), %sil
	movb	667(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	668(%rdx), %sil
	movb	668(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	669(%rdx), %sil
	movb	669(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	670(%rdx), %sil
	movb	670(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	671(%rdx), %sil
	movb	671(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	672(%rdx), %sil
	movb	672(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	673(%rdx), %sil
	movb	673(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	674(%rdx), %sil
	movb	674(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	675(%rdx), %sil
	movb	675(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	676(%rdx), %sil
	movb	676(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	677(%rdx), %sil
	movb	677(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	678(%rdx), %sil
	movb	678(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	679(%rdx), %sil
	movb	679(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	680(%rdx), %sil
	movb	680(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	681(%rdx), %sil
	movb	681(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	682(%rdx), %sil
	movb	682(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	683(%rdx), %sil
	movb	683(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	684(%rdx), %sil
	movb	684(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	685(%rdx), %sil
	movb	685(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	686(%rdx), %sil
	movb	686(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	687(%rdx), %sil
	movb	687(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	688(%rdx), %sil
	movb	688(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	689(%rdx), %sil
	movb	689(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	690(%rdx), %sil
	movb	690(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	691(%rdx), %sil
	movb	691(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	692(%rdx), %sil
	movb	692(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	693(%rdx), %sil
	movb	693(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	694(%rdx), %sil
	movb	694(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	695(%rdx), %sil
	movb	695(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	696(%rdx), %sil
	movb	696(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	697(%rdx), %sil
	movb	697(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	698(%rdx), %sil
	movb	698(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	699(%rdx), %sil
	movb	699(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	700(%rdx), %sil
	movb	700(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	701(%rdx), %sil
	movb	701(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	702(%rdx), %sil
	movb	702(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	703(%rdx), %sil
	movb	703(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	704(%rdx), %sil
	movb	704(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	705(%rdx), %sil
	movb	705(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	706(%rdx), %sil
	movb	706(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	707(%rdx), %sil
	movb	707(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	708(%rdx), %sil
	movb	708(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	709(%rdx), %sil
	movb	709(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	710(%rdx), %sil
	movb	710(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	711(%rdx), %sil
	movb	711(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	712(%rdx), %sil
	movb	712(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	713(%rdx), %sil
	movb	713(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	714(%rdx), %sil
	movb	714(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	715(%rdx), %sil
	movb	715(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	716(%rdx), %sil
	movb	716(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	717(%rdx), %sil
	movb	717(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	718(%rdx), %sil
	movb	718(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	719(%rdx), %sil
	movb	719(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	720(%rdx), %sil
	movb	720(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	721(%rdx), %sil
	movb	721(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	722(%rdx), %sil
	movb	722(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	723(%rdx), %sil
	movb	723(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	724(%rdx), %sil
	movb	724(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	725(%rdx), %sil
	movb	725(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	726(%rdx), %sil
	movb	726(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	727(%rdx), %sil
	movb	727(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	728(%rdx), %sil
	movb	728(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	729(%rdx), %sil
	movb	729(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	730(%rdx), %sil
	movb	730(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	731(%rdx), %sil
	movb	731(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	732(%rdx), %sil
	movb	732(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	733(%rdx), %sil
	movb	733(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	734(%rdx), %sil
	movb	734(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	735(%rdx), %sil
	movb	735(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	736(%rdx), %sil
	movb	736(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	737(%rdx), %sil
	movb	737(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	738(%rdx), %sil
	movb	738(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	739(%rdx), %sil
	movb	739(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	740(%rdx), %sil
	movb	740(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	741(%rdx), %sil
	movb	741(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	742(%rdx), %sil
	movb	742(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	743(%rdx), %sil
	movb	743(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	744(%rdx), %sil
	movb	744(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	745(%rdx), %sil
	movb	745(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	746(%rdx), %sil
	movb	746(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	747(%rdx), %sil
	movb	747(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	748(%rdx), %sil
	movb	748(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	749(%rdx), %sil
	movb	749(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	750(%rdx), %sil
	movb	750(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	751(%rdx), %sil
	movb	751(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	752(%rdx), %sil
	movb	752(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	753(%rdx), %sil
	movb	753(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	754(%rdx), %sil
	movb	754(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	755(%rdx), %sil
	movb	755(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	756(%rdx), %sil
	movb	756(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	757(%rdx), %sil
	movb	757(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	758(%rdx), %sil
	movb	758(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	759(%rdx), %sil
	movb	759(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	760(%rdx), %sil
	movb	760(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	761(%rdx), %sil
	movb	761(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	762(%rdx), %sil
	movb	762(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	763(%rdx), %sil
	movb	763(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	764(%rdx), %sil
	movb	764(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	765(%rdx), %sil
	movb	765(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	766(%rdx), %sil
	movb	766(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	767(%rdx), %sil
	movb	767(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	768(%rdx), %sil
	movb	768(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	769(%rdx), %sil
	movb	769(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	770(%rdx), %sil
	movb	770(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	771(%rdx), %sil
	movb	771(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	772(%rdx), %sil
	movb	772(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	773(%rdx), %sil
	movb	773(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	774(%rdx), %sil
	movb	774(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	775(%rdx), %sil
	movb	775(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	776(%rdx), %sil
	movb	776(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	777(%rdx), %sil
	movb	777(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	778(%rdx), %sil
	movb	778(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	779(%rdx), %sil
	movb	779(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	780(%rdx), %sil
	movb	780(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	781(%rdx), %sil
	movb	781(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	782(%rdx), %sil
	movb	782(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	783(%rdx), %sil
	movb	783(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	784(%rdx), %sil
	movb	784(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	785(%rdx), %sil
	movb	785(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	786(%rdx), %sil
	movb	786(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	787(%rdx), %sil
	movb	787(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	788(%rdx), %sil
	movb	788(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	789(%rdx), %sil
	movb	789(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	790(%rdx), %sil
	movb	790(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	791(%rdx), %sil
	movb	791(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	792(%rdx), %sil
	movb	792(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	793(%rdx), %sil
	movb	793(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	794(%rdx), %sil
	movb	794(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	795(%rdx), %sil
	movb	795(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	796(%rdx), %sil
	movb	796(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	797(%rdx), %sil
	movb	797(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	798(%rdx), %sil
	movb	798(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	799(%rdx), %sil
	movb	799(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	800(%rdx), %sil
	movb	800(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	801(%rdx), %sil
	movb	801(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	802(%rdx), %sil
	movb	802(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	803(%rdx), %sil
	movb	803(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	804(%rdx), %sil
	movb	804(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	805(%rdx), %sil
	movb	805(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	806(%rdx), %sil
	movb	806(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	807(%rdx), %sil
	movb	807(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	808(%rdx), %sil
	movb	808(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	809(%rdx), %sil
	movb	809(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	810(%rdx), %sil
	movb	810(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	811(%rdx), %sil
	movb	811(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	812(%rdx), %sil
	movb	812(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	813(%rdx), %sil
	movb	813(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	814(%rdx), %sil
	movb	814(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	815(%rdx), %sil
	movb	815(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	816(%rdx), %sil
	movb	816(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	817(%rdx), %sil
	movb	817(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	818(%rdx), %sil
	movb	818(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	819(%rdx), %sil
	movb	819(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	820(%rdx), %sil
	movb	820(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	821(%rdx), %sil
	movb	821(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	822(%rdx), %sil
	movb	822(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	823(%rdx), %sil
	movb	823(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	824(%rdx), %sil
	movb	824(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	825(%rdx), %sil
	movb	825(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	826(%rdx), %sil
	movb	826(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	827(%rdx), %sil
	movb	827(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	828(%rdx), %sil
	movb	828(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	829(%rdx), %sil
	movb	829(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	830(%rdx), %sil
	movb	830(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	831(%rdx), %sil
	movb	831(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	832(%rdx), %sil
	movb	832(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	833(%rdx), %sil
	movb	833(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	834(%rdx), %sil
	movb	834(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	835(%rdx), %sil
	movb	835(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	836(%rdx), %sil
	movb	836(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	837(%rdx), %sil
	movb	837(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	838(%rdx), %sil
	movb	838(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	839(%rdx), %sil
	movb	839(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	840(%rdx), %sil
	movb	840(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	841(%rdx), %sil
	movb	841(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	842(%rdx), %sil
	movb	842(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	843(%rdx), %sil
	movb	843(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	844(%rdx), %sil
	movb	844(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	845(%rdx), %sil
	movb	845(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	846(%rdx), %sil
	movb	846(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	847(%rdx), %sil
	movb	847(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	848(%rdx), %sil
	movb	848(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	849(%rdx), %sil
	movb	849(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	850(%rdx), %sil
	movb	850(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	851(%rdx), %sil
	movb	851(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	852(%rdx), %sil
	movb	852(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	853(%rdx), %sil
	movb	853(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	854(%rdx), %sil
	movb	854(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	855(%rdx), %sil
	movb	855(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	856(%rdx), %sil
	movb	856(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	857(%rdx), %sil
	movb	857(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	858(%rdx), %sil
	movb	858(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	859(%rdx), %sil
	movb	859(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	860(%rdx), %sil
	movb	860(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	861(%rdx), %sil
	movb	861(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	862(%rdx), %sil
	movb	862(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	863(%rdx), %sil
	movb	863(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	864(%rdx), %sil
	movb	864(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	865(%rdx), %sil
	movb	865(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	866(%rdx), %sil
	movb	866(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	867(%rdx), %sil
	movb	867(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	868(%rdx), %sil
	movb	868(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	869(%rdx), %sil
	movb	869(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	870(%rdx), %sil
	movb	870(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	871(%rdx), %sil
	movb	871(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	872(%rdx), %sil
	movb	872(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	873(%rdx), %sil
	movb	873(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	874(%rdx), %sil
	movb	874(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	875(%rdx), %sil
	movb	875(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	876(%rdx), %sil
	movb	876(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	877(%rdx), %sil
	movb	877(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	878(%rdx), %sil
	movb	878(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	879(%rdx), %sil
	movb	879(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	880(%rdx), %sil
	movb	880(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	881(%rdx), %sil
	movb	881(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	882(%rdx), %sil
	movb	882(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	883(%rdx), %sil
	movb	883(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	884(%rdx), %sil
	movb	884(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	885(%rdx), %sil
	movb	885(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	886(%rdx), %sil
	movb	886(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	887(%rdx), %sil
	movb	887(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	888(%rdx), %sil
	movb	888(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	889(%rdx), %sil
	movb	889(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	890(%rdx), %sil
	movb	890(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	891(%rdx), %sil
	movb	891(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	892(%rdx), %sil
	movb	892(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	893(%rdx), %sil
	movb	893(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	894(%rdx), %sil
	movb	894(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	895(%rdx), %sil
	movb	895(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	896(%rdx), %sil
	movb	896(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	897(%rdx), %sil
	movb	897(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	898(%rdx), %sil
	movb	898(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	899(%rdx), %sil
	movb	899(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	900(%rdx), %sil
	movb	900(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	901(%rdx), %sil
	movb	901(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	902(%rdx), %sil
	movb	902(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	903(%rdx), %sil
	movb	903(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	904(%rdx), %sil
	movb	904(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	905(%rdx), %sil
	movb	905(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	906(%rdx), %sil
	movb	906(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	907(%rdx), %sil
	movb	907(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	908(%rdx), %sil
	movb	908(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	909(%rdx), %sil
	movb	909(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	910(%rdx), %sil
	movb	910(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	911(%rdx), %sil
	movb	911(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	912(%rdx), %sil
	movb	912(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	913(%rdx), %sil
	movb	913(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	914(%rdx), %sil
	movb	914(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	915(%rdx), %sil
	movb	915(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	916(%rdx), %sil
	movb	916(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	917(%rdx), %sil
	movb	917(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	918(%rdx), %sil
	movb	918(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	919(%rdx), %sil
	movb	919(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	920(%rdx), %sil
	movb	920(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	921(%rdx), %sil
	movb	921(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	922(%rdx), %sil
	movb	922(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	923(%rdx), %sil
	movb	923(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	924(%rdx), %sil
	movb	924(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	925(%rdx), %sil
	movb	925(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	926(%rdx), %sil
	movb	926(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	927(%rdx), %sil
	movb	927(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	928(%rdx), %sil
	movb	928(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	929(%rdx), %sil
	movb	929(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	930(%rdx), %sil
	movb	930(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	931(%rdx), %sil
	movb	931(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	932(%rdx), %sil
	movb	932(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	933(%rdx), %sil
	movb	933(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	934(%rdx), %sil
	movb	934(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	935(%rdx), %sil
	movb	935(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	936(%rdx), %sil
	movb	936(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	937(%rdx), %sil
	movb	937(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	938(%rdx), %sil
	movb	938(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	939(%rdx), %sil
	movb	939(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	940(%rdx), %sil
	movb	940(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	941(%rdx), %sil
	movb	941(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	942(%rdx), %sil
	movb	942(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	943(%rdx), %sil
	movb	943(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	944(%rdx), %sil
	movb	944(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	945(%rdx), %sil
	movb	945(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	946(%rdx), %sil
	movb	946(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	947(%rdx), %sil
	movb	947(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	948(%rdx), %sil
	movb	948(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	949(%rdx), %sil
	movb	949(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	950(%rdx), %sil
	movb	950(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	951(%rdx), %sil
	movb	951(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	952(%rdx), %sil
	movb	952(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	953(%rdx), %sil
	movb	953(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	954(%rdx), %sil
	movb	954(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	955(%rdx), %sil
	movb	955(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	956(%rdx), %sil
	movb	956(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	957(%rdx), %sil
	movb	957(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	958(%rdx), %sil
	movb	958(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	959(%rdx), %sil
	movb	959(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	960(%rdx), %sil
	movb	960(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	961(%rdx), %sil
	movb	961(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	962(%rdx), %sil
	movb	962(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	963(%rdx), %sil
	movb	963(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	964(%rdx), %sil
	movb	964(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	965(%rdx), %sil
	movb	965(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	966(%rdx), %sil
	movb	966(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	967(%rdx), %sil
	movb	967(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	968(%rdx), %sil
	movb	968(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	969(%rdx), %sil
	movb	969(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	970(%rdx), %sil
	movb	970(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	971(%rdx), %sil
	movb	971(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	972(%rdx), %sil
	movb	972(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	973(%rdx), %sil
	movb	973(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	974(%rdx), %sil
	movb	974(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	975(%rdx), %sil
	movb	975(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	976(%rdx), %sil
	movb	976(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	977(%rdx), %sil
	movb	977(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	978(%rdx), %sil
	movb	978(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	979(%rdx), %sil
	movb	979(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	980(%rdx), %sil
	movb	980(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	981(%rdx), %sil
	movb	981(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	982(%rdx), %sil
	movb	982(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	983(%rdx), %sil
	movb	983(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	984(%rdx), %sil
	movb	984(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	985(%rdx), %sil
	movb	985(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	986(%rdx), %sil
	movb	986(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	987(%rdx), %sil
	movb	987(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	988(%rdx), %sil
	movb	988(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	989(%rdx), %sil
	movb	989(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	990(%rdx), %sil
	movb	990(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	991(%rdx), %sil
	movb	991(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	992(%rdx), %sil
	movb	992(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	993(%rdx), %sil
	movb	993(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	994(%rdx), %sil
	movb	994(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	995(%rdx), %sil
	movb	995(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	996(%rdx), %sil
	movb	996(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	997(%rdx), %sil
	movb	997(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	998(%rdx), %sil
	movb	998(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	999(%rdx), %sil
	movb	999(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1000(%rdx), %sil
	movb	1000(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1001(%rdx), %sil
	movb	1001(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1002(%rdx), %sil
	movb	1002(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1003(%rdx), %sil
	movb	1003(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1004(%rdx), %sil
	movb	1004(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1005(%rdx), %sil
	movb	1005(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1006(%rdx), %sil
	movb	1006(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1007(%rdx), %sil
	movb	1007(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1008(%rdx), %sil
	movb	1008(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1009(%rdx), %sil
	movb	1009(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1010(%rdx), %sil
	movb	1010(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1011(%rdx), %sil
	movb	1011(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1012(%rdx), %sil
	movb	1012(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1013(%rdx), %sil
	movb	1013(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1014(%rdx), %sil
	movb	1014(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1015(%rdx), %sil
	movb	1015(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1016(%rdx), %sil
	movb	1016(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1017(%rdx), %sil
	movb	1017(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1018(%rdx), %sil
	movb	1018(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1019(%rdx), %sil
	movb	1019(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1020(%rdx), %sil
	movb	1020(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1021(%rdx), %sil
	movb	1021(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1022(%rdx), %sil
	movb	1022(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1023(%rdx), %sil
	movb	1023(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1024(%rdx), %sil
	movb	1024(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1025(%rdx), %sil
	movb	1025(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1026(%rdx), %sil
	movb	1026(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1027(%rdx), %sil
	movb	1027(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1028(%rdx), %sil
	movb	1028(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1029(%rdx), %sil
	movb	1029(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1030(%rdx), %sil
	movb	1030(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1031(%rdx), %sil
	movb	1031(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1032(%rdx), %sil
	movb	1032(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1033(%rdx), %sil
	movb	1033(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1034(%rdx), %sil
	movb	1034(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1035(%rdx), %sil
	movb	1035(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1036(%rdx), %sil
	movb	1036(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1037(%rdx), %sil
	movb	1037(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1038(%rdx), %sil
	movb	1038(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1039(%rdx), %sil
	movb	1039(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1040(%rdx), %sil
	movb	1040(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1041(%rdx), %sil
	movb	1041(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1042(%rdx), %sil
	movb	1042(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1043(%rdx), %sil
	movb	1043(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1044(%rdx), %sil
	movb	1044(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1045(%rdx), %sil
	movb	1045(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1046(%rdx), %sil
	movb	1046(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1047(%rdx), %sil
	movb	1047(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1048(%rdx), %sil
	movb	1048(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1049(%rdx), %sil
	movb	1049(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1050(%rdx), %sil
	movb	1050(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1051(%rdx), %sil
	movb	1051(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1052(%rdx), %sil
	movb	1052(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1053(%rdx), %sil
	movb	1053(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1054(%rdx), %sil
	movb	1054(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1055(%rdx), %sil
	movb	1055(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1056(%rdx), %sil
	movb	1056(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1057(%rdx), %sil
	movb	1057(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1058(%rdx), %sil
	movb	1058(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1059(%rdx), %sil
	movb	1059(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1060(%rdx), %sil
	movb	1060(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1061(%rdx), %sil
	movb	1061(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1062(%rdx), %sil
	movb	1062(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1063(%rdx), %sil
	movb	1063(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1064(%rdx), %sil
	movb	1064(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1065(%rdx), %sil
	movb	1065(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1066(%rdx), %sil
	movb	1066(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1067(%rdx), %sil
	movb	1067(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1068(%rdx), %sil
	movb	1068(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1069(%rdx), %sil
	movb	1069(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1070(%rdx), %sil
	movb	1070(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1071(%rdx), %sil
	movb	1071(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1072(%rdx), %sil
	movb	1072(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1073(%rdx), %sil
	movb	1073(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1074(%rdx), %sil
	movb	1074(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1075(%rdx), %sil
	movb	1075(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1076(%rdx), %sil
	movb	1076(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1077(%rdx), %sil
	movb	1077(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1078(%rdx), %sil
	movb	1078(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1079(%rdx), %sil
	movb	1079(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1080(%rdx), %sil
	movb	1080(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1081(%rdx), %sil
	movb	1081(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1082(%rdx), %sil
	movb	1082(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1083(%rdx), %sil
	movb	1083(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1084(%rdx), %sil
	movb	1084(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1085(%rdx), %sil
	movb	1085(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1086(%rdx), %sil
	movb	1086(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	movb	1087(%rdx), %sil
	movb	1087(%rcx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rax
	negq	%rax
	shrq	$63, %rax
	movq	%mm0, %rsi
	movq	%mm2, %rbp
	leaq	2368(%rbp), %rdi
	leaq	-232(%rsp), %rsp
	call	L_shake256_A32__A1120$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$1:
	leaq	232(%rsp), %rsp
	leaq	136(%rsp), %rcx
	negq	%rax
	movb	(%rsi), %dil
	movb	(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, (%rsi)
	movb	1(%rsi), %dil
	movb	1(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 1(%rsi)
	movb	2(%rsi), %dil
	movb	2(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 2(%rsi)
	movb	3(%rsi), %dil
	movb	3(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 3(%rsi)
	movb	4(%rsi), %dil
	movb	4(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 4(%rsi)
	movb	5(%rsi), %dil
	movb	5(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 5(%rsi)
	movb	6(%rsi), %dil
	movb	6(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 6(%rsi)
	movb	7(%rsi), %dil
	movb	7(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 7(%rsi)
	movb	8(%rsi), %dil
	movb	8(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 8(%rsi)
	movb	9(%rsi), %dil
	movb	9(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 9(%rsi)
	movb	10(%rsi), %dil
	movb	10(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 10(%rsi)
	movb	11(%rsi), %dil
	movb	11(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 11(%rsi)
	movb	12(%rsi), %dil
	movb	12(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 12(%rsi)
	movb	13(%rsi), %dil
	movb	13(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 13(%rsi)
	movb	14(%rsi), %dil
	movb	14(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 14(%rsi)
	movb	15(%rsi), %dil
	movb	15(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 15(%rsi)
	movb	16(%rsi), %dil
	movb	16(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 16(%rsi)
	movb	17(%rsi), %dil
	movb	17(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 17(%rsi)
	movb	18(%rsi), %dil
	movb	18(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 18(%rsi)
	movb	19(%rsi), %dil
	movb	19(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 19(%rsi)
	movb	20(%rsi), %dil
	movb	20(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 20(%rsi)
	movb	21(%rsi), %dil
	movb	21(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 21(%rsi)
	movb	22(%rsi), %dil
	movb	22(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 22(%rsi)
	movb	23(%rsi), %dil
	movb	23(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 23(%rsi)
	movb	24(%rsi), %dil
	movb	24(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 24(%rsi)
	movb	25(%rsi), %dil
	movb	25(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 25(%rsi)
	movb	26(%rsi), %dil
	movb	26(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 26(%rsi)
	movb	27(%rsi), %dil
	movb	27(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 27(%rsi)
	movb	28(%rsi), %dil
	movb	28(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 28(%rsi)
	movb	29(%rsi), %dil
	movb	29(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 29(%rsi)
	movb	30(%rsi), %dil
	movb	30(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 30(%rsi)
	movb	31(%rsi), %dil
	movb	31(%rcx), %dl
	xorb	%dl, %dil
	andb	%al, %dil
	xorb	%dil, %dl
	movb	%dl, 31(%rsi)
	xorl	%eax, %eax
	movq	14456(%rsp), %rbx
	movq	14464(%rsp), %rbp
	movq	14472(%rsp), %r12
	movq	14480(%rsp), %r13
	movq	14488(%rsp), %r14
	movq	14496(%rsp), %r15
	movq	14504(%rsp), %rsp
	ret
	.type	jade_kem_mlkem_mlkem768_amd64_ref_enc, %function
jade_kem_mlkem_mlkem768_amd64_ref_enc:
	movq	%rsp, %rax
	leaq	-13448(%rsp), %rsp
	andq	$-16, %rsp
	movq	%rbx, 13392(%rsp)
	movq	%rbp, 13400(%rsp)
	movq	%r12, 13408(%rsp)
	movq	%r13, 13416(%rsp)
	movq	%r14, 13424(%rsp)
	movq	%r15, 13432(%rsp)
	movq	%rax, 13440(%rsp)
	movq	%rdi, %r12
	movq	%rsi, %rbp
	movq	%rdx, %rbx
	leaq	24(%rsp), %rdi
	movq	$32, %rsi
	call	__jasmin_syscall_randombytes__
	movq	%rbx, (%rsp)
	movq	%rbp, 8(%rsp)
	movq	%r12, 16(%rsp)
	movq	(%rax), %rcx
	movq	%rcx, 96(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 104(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 112(%rsp)
	movq	24(%rax), %rcx
	movq	%rcx, 120(%rsp)
	leaq	128(%rsp), %rsi
	leaq	-232(%rsp), %rsp
	call	L_sha3_256A_A1184$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$229:
	leaq	232(%rsp), %rsp
	leaq	160(%rsp), %rsi
	leaq	96(%rsp), %rbx
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$228:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %r10
	movq	16(%rsp), %rsi
	leaq	96(%rsp), %rax
	leaq	192(%rsp), %r11
	movq	%rsi, %mm3
	movq	%r10, %rbx
	leaq	2640(%rsp), %rcx
	movq	%rbx, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$227:
	leaq	3152(%rsp), %rcx
	leaq	384(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$226:
	leaq	3664(%rsp), %rcx
	leaq	768(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$225:
	movq	1152(%r10), %rcx
	movq	%rcx, 24(%rsp)
	movq	1160(%r10), %rcx
	movq	%rcx, 32(%rsp)
	movq	1168(%r10), %rcx
	movq	%rcx, 40(%rsp)
	movq	1176(%r10), %rcx
	movq	%rcx, 48(%rsp)
	leaq	592(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$224:
	movq	%r11, %mm4
	movq	$1, %rax
	movq	%rax, %mm5
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
	movb	48(%rsp), %sil
	movb	%sil, 80(%rsp)
	movb	49(%rsp), %sil
	movb	%sil, 81(%rsp)
	movb	50(%rsp), %sil
	movb	%sil, 82(%rsp)
	movb	51(%rsp), %sil
	movb	%sil, 83(%rsp)
	movb	52(%rsp), %sil
	movb	%sil, 84(%rsp)
	movb	53(%rsp), %sil
	movb	%sil, 85(%rsp)
	movb	54(%rsp), %sil
	movb	%sil, 86(%rsp)
	movb	55(%rsp), %sil
	movb	%sil, 87(%rsp)
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$222
	movb	$0, 88(%rsp)
	movb	$0, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$223
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$222:
	movb	$0, 88(%rsp)
	movb	$0, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$223:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$221:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$208
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$209:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$220:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$210
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$211:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$212
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$210
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$212:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$218
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$219
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$218:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$219:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$214
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$210
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$214:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$216
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$210
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$216:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$217:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$215:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$213:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$210:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$211
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$208:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$209
	movq	$0, %rax
	leaq	8784(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$206
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$207:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$206:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$207
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$204
	movb	$0, 88(%rsp)
	movb	$1, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$205
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$204:
	movb	$1, 88(%rsp)
	movb	$0, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$205:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$203:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$190
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$191:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$202:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$192
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$193:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$194
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$192
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$194:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$200
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$201
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$200:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$201:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$196
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$192
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$196:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$198
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$192
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$198:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$199:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$197:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$195:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$192:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$193
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$190:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$191
	movq	$0, %rax
	leaq	9296(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$188
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$189:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$188:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$189
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$186
	movb	$0, 88(%rsp)
	movb	$2, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$187
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$186:
	movb	$2, 88(%rsp)
	movb	$0, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$187:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$185:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$172
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$173:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$184:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$174
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$175:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$176
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$174
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$176:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$182
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$183
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$182:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$183:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$178
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$174
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$178:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$180
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$174
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$180:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$181:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$179:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$177:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$174:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$175
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$172:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$173
	movq	$0, %rax
	leaq	9808(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$170
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$171:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$170:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$171
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$168
	movb	$1, 88(%rsp)
	movb	$0, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$169
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$168:
	movb	$0, 88(%rsp)
	movb	$1, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$169:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$167:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$154
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$155:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$166:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$156
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$157:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$158
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$156
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$158:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$164
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$165
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$164:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$165:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$160
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$156
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$160:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$162
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$156
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$162:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$163:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$161:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$159:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$156:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$157
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$154:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$155
	movq	$0, %rax
	leaq	10320(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$152
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$153:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$152:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$153
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$150
	movb	$1, 88(%rsp)
	movb	$1, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$151
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$150:
	movb	$1, 88(%rsp)
	movb	$1, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$151:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$149:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$136
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$137:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$148:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$138
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$139:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$140
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$138
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$140:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$146
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$147
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$146:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$147:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$142
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$138
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$142:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$144
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$138
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$144:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$145:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$143:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$141:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$138:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$139
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$136:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$137
	movq	$0, %rax
	leaq	10832(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$134
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$135:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$134:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$135
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$132
	movb	$1, 88(%rsp)
	movb	$2, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$133
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$132:
	movb	$2, 88(%rsp)
	movb	$1, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$133:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$131:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$118
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$119:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$130:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$120
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$121:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$122
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$120
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$122:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$128
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$129
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$128:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$129:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$124
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$120
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$124:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$126
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$120
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$126:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$127:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$125:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$123:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$120:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$121
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$118:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$119
	movq	$0, %rax
	leaq	11344(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$116
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$117:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$116:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$117
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$114
	movb	$2, 88(%rsp)
	movb	$0, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$115
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$114:
	movb	$0, 88(%rsp)
	movb	$2, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$115:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$113:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$100
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$101:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$112:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$102
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$103:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$104
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$102
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$104:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$110
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$111
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$110:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$111:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$106
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$102
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$106:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$108
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$102
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$108:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$109:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$107:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$105:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$102:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$103
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$100:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$101
	movq	$0, %rax
	leaq	11856(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$98
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$99:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$98:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$99
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$96
	movb	$2, 88(%rsp)
	movb	$1, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$97
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$96:
	movb	$1, 88(%rsp)
	movb	$2, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$97:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$95:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$82
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$83:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$94:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$84
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$85:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$86
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$84
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$86:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$92
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$93
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$92:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$93:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$88
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$84
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$88:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$90
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$84
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$90:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$91:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$89:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$87:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$84:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$85
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$82:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$83
	movq	$0, %rax
	leaq	12368(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$80
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$81:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$80:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$81
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$78
	movb	$2, 88(%rsp)
	movb	$2, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$79
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$78:
	movb	$2, 88(%rsp)
	movb	$2, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$79:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$77:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$64
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$65:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$76:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$66
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$67:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$68
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$66
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$68:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$74
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$75
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$74:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$75:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$70
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$66
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$70:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$72
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$66
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$72:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$73:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$71:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$69:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$66:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$67
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$64:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$65
	movq	$0, %rax
	leaq	12880(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$62
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$63:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$62:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$63
	movq	%mm4, %rax
	movb	$0, %cl
	leaq	4176(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$61:
	leaq	176(%rsp), %rsp
	movb	$1, %cl
	leaq	4688(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$60:
	leaq	176(%rsp), %rsp
	movb	$2, %cl
	leaq	5200(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$59:
	leaq	176(%rsp), %rsp
	movq	%mm4, %rax
	movb	$3, %cl
	leaq	5712(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$58:
	leaq	176(%rsp), %rsp
	movb	$4, %cl
	leaq	6224(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$57:
	leaq	176(%rsp), %rsp
	movb	$5, %cl
	leaq	6736(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$56:
	leaq	176(%rsp), %rsp
	movb	$6, %cl
	leaq	1104(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$55:
	leaq	176(%rsp), %rsp
	leaq	4176(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$54:
	leaq	4688(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$53:
	leaq	5200(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$52:
	leaq	7248(%rsp), %rsi
	leaq	8784(%rsp), %rdx
	leaq	4176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$51:
	leaq	16(%rsp), %rsp
	leaq	1616(%rsp), %rsi
	leaq	9296(%rsp), %rdx
	leaq	4688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$50:
	leaq	16(%rsp), %rsp
	leaq	7248(%rsp), %rcx
	leaq	1616(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$49:
	leaq	1616(%rsp), %rsi
	leaq	9808(%rsp), %rdx
	leaq	5200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$48:
	leaq	16(%rsp), %rsp
	leaq	7248(%rsp), %rcx
	leaq	1616(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$47:
	leaq	7248(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$45
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$46:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$45:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$46
	leaq	7760(%rsp), %rsi
	leaq	10320(%rsp), %rdx
	leaq	4176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$44:
	leaq	16(%rsp), %rsp
	leaq	1616(%rsp), %rsi
	leaq	10832(%rsp), %rdx
	leaq	4688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$43:
	leaq	16(%rsp), %rsp
	leaq	7760(%rsp), %rcx
	leaq	1616(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$42:
	leaq	1616(%rsp), %rsi
	leaq	11344(%rsp), %rdx
	leaq	5200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$41:
	leaq	16(%rsp), %rsp
	leaq	7760(%rsp), %rcx
	leaq	1616(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$40:
	leaq	7760(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$38
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$39:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$38:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$39
	leaq	8272(%rsp), %rsi
	leaq	11856(%rsp), %rdx
	leaq	4176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$37:
	leaq	16(%rsp), %rsp
	leaq	1616(%rsp), %rsi
	leaq	12368(%rsp), %rdx
	leaq	4688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$36:
	leaq	16(%rsp), %rsp
	leaq	8272(%rsp), %rcx
	leaq	1616(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$35:
	leaq	1616(%rsp), %rsi
	leaq	12880(%rsp), %rdx
	leaq	5200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$34:
	leaq	16(%rsp), %rsp
	leaq	8272(%rsp), %rcx
	leaq	1616(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$33:
	leaq	8272(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$31
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$32:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$31:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$32
	leaq	1616(%rsp), %rsi
	leaq	2640(%rsp), %rdx
	leaq	4176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$30:
	leaq	16(%rsp), %rsp
	leaq	2128(%rsp), %rsi
	leaq	3152(%rsp), %rdx
	leaq	4688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$29:
	leaq	16(%rsp), %rsp
	leaq	1616(%rsp), %rcx
	leaq	2128(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$28:
	leaq	2128(%rsp), %rsi
	leaq	3664(%rsp), %rdx
	leaq	5200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$27:
	leaq	16(%rsp), %rsp
	leaq	1616(%rsp), %rcx
	leaq	2128(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$26:
	leaq	1616(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$24
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$25:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$24:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$25
	leaq	7248(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$23:
	leaq	7760(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$22:
	leaq	8272(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$21:
	leaq	1616(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$20:
	leaq	7248(%rsp), %rcx
	leaq	5712(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$19:
	leaq	7760(%rsp), %rcx
	leaq	6224(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$18:
	leaq	8272(%rsp), %rcx
	leaq	6736(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$17:
	leaq	1616(%rsp), %rcx
	leaq	1104(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$16:
	leaq	1616(%rsp), %rcx
	leaq	592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$15:
	leaq	7248(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$13
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$14:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$13:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$14
	leaq	7760(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$11
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$12:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$11:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$12
	leaq	8272(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$9
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$10:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$9:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$10
	leaq	1616(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$7
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$8:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$7:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$8
	movq	%mm3, %rdi
	movq	%rdi, %r10
	movq	$0, %rax
	movq	$0, %r8
	leaq	7248(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$6:
	leaq	7760(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$5:
	leaq	8272(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$4:
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$2
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$3:
	movzwq	7248(%rsp,%rax,2), %r9
	shlq	$10, %r9
	addq	$1665, %r9
	imulq	$1290167, %r9, %r9
	shrq	$32, %r9
	andq	$1023, %r9
	movzwq	7250(%rsp,%rax,2), %r11
	shlq	$10, %r11
	addq	$1665, %r11
	imulq	$1290167, %r11, %r11
	shrq	$32, %r11
	andq	$1023, %r11
	movzwq	7252(%rsp,%rax,2), %rbp
	shlq	$10, %rbp
	addq	$1665, %rbp
	imulq	$1290167, %rbp, %rbp
	shrq	$32, %rbp
	andq	$1023, %rbp
	movzwq	7254(%rsp,%rax,2), %r12
	shlq	$10, %r12
	addq	$1665, %r12
	imulq	$1290167, %r12, %r12
	shrq	$32, %r12
	andq	$1023, %r12
	movw	%r9w, %si
	andw	$255, %si
	movb	%sil, (%r10,%r8)
	incq	%r8
	shrw	$8, %r9w
	movw	%r11w, %si
	shlw	$2, %si
	orw 	%r9w, %si
	movb	%sil, (%r10,%r8)
	incq	%r8
	shrw	$6, %r11w
	movw	%bp, %si
	shlw	$4, %si
	orw 	%r11w, %si
	movb	%sil, (%r10,%r8)
	incq	%r8
	shrw	$4, %bp
	movw	%r12w, %si
	shlw	$6, %si
	orw 	%bp, %si
	movb	%sil, (%r10,%r8)
	incq	%r8
	shrq	$2, %r12
	movb	%r12b, (%r10,%r8)
	incq	%r8
	addq	$4, %rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$2:
	cmpq	$765, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$3
	leaq	960(%rdi), %r10
	leaq	1616(%rsp), %rcx
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$1:
	movq	8(%rsp), %rsi
	movq	160(%rsp), %rcx
	movq	%rcx, (%rsi)
	movq	168(%rsp), %rcx
	movq	%rcx, 8(%rsi)
	movq	176(%rsp), %rcx
	movq	%rcx, 16(%rsi)
	movq	184(%rsp), %rcx
	movq	%rcx, 24(%rsi)
	xorl	%eax, %eax
	movq	13392(%rsp), %rbx
	movq	13400(%rsp), %rbp
	movq	13408(%rsp), %r12
	movq	13416(%rsp), %r13
	movq	13424(%rsp), %r14
	movq	13432(%rsp), %r15
	movq	13440(%rsp), %rsp
	ret
	.type	jade_kem_mlkem_mlkem768_amd64_ref_enc_derand, %function
jade_kem_mlkem_mlkem768_amd64_ref_enc_derand:
	movq	%rsp, %rax
	leaq	-13448(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 13392(%rsp)
	movq	%rbp, 13400(%rsp)
	movq	%r12, 13408(%rsp)
	movq	%r13, 13416(%rsp)
	movq	%r14, 13424(%rsp)
	movq	%r15, 13432(%rsp)
	movq	%rax, 13440(%rsp)
	movq	%rdx, %rbx
	lfence
	movq	$0, %rax
	movq	%rbx, (%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rdi, 16(%rsp)
	movq	(%rcx), %rsi
	movq	%rsi, 96(%rsp)
	movq	8(%rcx), %rsi
	movq	%rsi, 104(%rsp)
	movq	16(%rcx), %rsi
	movq	%rsi, 112(%rsp)
	movq	24(%rcx), %rcx
	movq	%rcx, 120(%rsp)
	leaq	128(%rsp), %rsi
	leaq	-232(%rsp), %rsp
	call	L_sha3_256A_A1184$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$229:
	leaq	232(%rsp), %rsp
	leaq	160(%rsp), %rsi
	leaq	96(%rsp), %rbx
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$228:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %r10
	movq	16(%rsp), %rsi
	leaq	96(%rsp), %rax
	leaq	192(%rsp), %r11
	movq	%rsi, %mm3
	movq	%r10, %rbx
	leaq	2640(%rsp), %rcx
	movq	%rbx, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$227:
	leaq	3152(%rsp), %rcx
	leaq	384(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$226:
	leaq	3664(%rsp), %rcx
	leaq	768(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$225:
	movq	1152(%r10), %rcx
	movq	%rcx, 24(%rsp)
	movq	1160(%r10), %rcx
	movq	%rcx, 32(%rsp)
	movq	1168(%r10), %rcx
	movq	%rcx, 40(%rsp)
	movq	1176(%r10), %rcx
	movq	%rcx, 48(%rsp)
	leaq	592(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$224:
	movq	%r11, %mm4
	movq	$1, %rax
	movq	%rax, %mm5
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
	movb	48(%rsp), %sil
	movb	%sil, 80(%rsp)
	movb	49(%rsp), %sil
	movb	%sil, 81(%rsp)
	movb	50(%rsp), %sil
	movb	%sil, 82(%rsp)
	movb	51(%rsp), %sil
	movb	%sil, 83(%rsp)
	movb	52(%rsp), %sil
	movb	%sil, 84(%rsp)
	movb	53(%rsp), %sil
	movb	%sil, 85(%rsp)
	movb	54(%rsp), %sil
	movb	%sil, 86(%rsp)
	movb	55(%rsp), %sil
	movb	%sil, 87(%rsp)
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$222
	movb	$0, 88(%rsp)
	movb	$0, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$223
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$222:
	movb	$0, 88(%rsp)
	movb	$0, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$223:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$221:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$208
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$209:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$220:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$210
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$211:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$212
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$210
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$212:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$218
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$219
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$218:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$219:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$214
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$210
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$214:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$216
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$210
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$216:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$217:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$215:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$213:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$210:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$211
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$208:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$209
	movq	$0, %rax
	leaq	8784(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$206
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$207:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$206:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$207
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$204
	movb	$0, 88(%rsp)
	movb	$1, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$205
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$204:
	movb	$1, 88(%rsp)
	movb	$0, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$205:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$203:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$190
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$191:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$202:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$192
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$193:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$194
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$192
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$194:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$200
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$201
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$200:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$201:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$196
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$192
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$196:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$198
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$192
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$198:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$199:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$197:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$195:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$192:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$193
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$190:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$191
	movq	$0, %rax
	leaq	9296(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$188
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$189:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$188:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$189
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$186
	movb	$0, 88(%rsp)
	movb	$2, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$187
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$186:
	movb	$2, 88(%rsp)
	movb	$0, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$187:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$185:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$172
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$173:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$184:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$174
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$175:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$176
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$174
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$176:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$182
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$183
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$182:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$183:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$178
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$174
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$178:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$180
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$174
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$180:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$181:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$179:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$177:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$174:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$175
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$172:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$173
	movq	$0, %rax
	leaq	9808(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$170
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$171:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$170:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$171
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$168
	movb	$1, 88(%rsp)
	movb	$0, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$169
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$168:
	movb	$0, 88(%rsp)
	movb	$1, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$169:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$167:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$154
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$155:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$166:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$156
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$157:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$158
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$156
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$158:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$164
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$165
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$164:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$165:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$160
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$156
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$160:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$162
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$156
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$162:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$163:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$161:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$159:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$156:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$157
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$154:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$155
	movq	$0, %rax
	leaq	10320(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$152
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$153:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$152:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$153
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$150
	movb	$1, 88(%rsp)
	movb	$1, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$151
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$150:
	movb	$1, 88(%rsp)
	movb	$1, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$151:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$149:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$136
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$137:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$148:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$138
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$139:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$140
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$138
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$140:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$146
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$147
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$146:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$147:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$142
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$138
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$142:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$144
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$138
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$144:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$145:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$143:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$141:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$138:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$139
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$136:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$137
	movq	$0, %rax
	leaq	10832(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$134
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$135:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$134:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$135
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$132
	movb	$1, 88(%rsp)
	movb	$2, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$133
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$132:
	movb	$2, 88(%rsp)
	movb	$1, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$133:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$131:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$118
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$119:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$130:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$120
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$121:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$122
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$120
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$122:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$128
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$129
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$128:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$129:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$124
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$120
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$124:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$126
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$120
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$126:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$127:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$125:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$123:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$120:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$121
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$118:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$119
	movq	$0, %rax
	leaq	11344(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$116
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$117:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$116:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$117
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$114
	movb	$2, 88(%rsp)
	movb	$0, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$115
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$114:
	movb	$0, 88(%rsp)
	movb	$2, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$115:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$113:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$100
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$101:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$112:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$102
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$103:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$104
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$102
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$104:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$110
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$111
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$110:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$111:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$106
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$102
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$106:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$108
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$102
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$108:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$109:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$107:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$105:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$102:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$103
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$100:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$101
	movq	$0, %rax
	leaq	11856(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$98
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$99:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$98:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$99
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$96
	movb	$2, 88(%rsp)
	movb	$1, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$97
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$96:
	movb	$1, 88(%rsp)
	movb	$2, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$97:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$95:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$82
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$83:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$94:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$84
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$85:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$86
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$84
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$86:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$92
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$93
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$92:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$93:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$88
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$84
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$88:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$90
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$84
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$90:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$91:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$89:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$87:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$84:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$85
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$82:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$83
	movq	$0, %rax
	leaq	12368(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$80
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$81:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$80:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$81
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$78
	movb	$2, 88(%rsp)
	movb	$2, 89(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$79
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$78:
	movb	$2, 88(%rsp)
	movb	$2, 89(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$79:
	leaq	392(%rsp), %rdx
	leaq	56(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$77:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$64
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$65:
	movq	%rcx, %mm6
	leaq	392(%rsp), %rdx
	leaq	224(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$76:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$66
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$67:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$68
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$66
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$68:
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$74
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$75
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$74:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$75:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$70
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$66
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$70:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$72
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$66
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$72:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 1104(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$73:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$71:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$69:
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$66:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$67
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$64:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$65
	movq	$0, %rax
	leaq	12880(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$62
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$63:
	movw	1104(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$62:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$63
	movq	%mm4, %rax
	movb	$0, %cl
	leaq	4176(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$61:
	leaq	176(%rsp), %rsp
	movb	$1, %cl
	leaq	4688(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$60:
	leaq	176(%rsp), %rsp
	movb	$2, %cl
	leaq	5200(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$59:
	leaq	176(%rsp), %rsp
	movq	%mm4, %rax
	movb	$3, %cl
	leaq	5712(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$58:
	leaq	176(%rsp), %rsp
	movb	$4, %cl
	leaq	6224(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$57:
	leaq	176(%rsp), %rsp
	movb	$5, %cl
	leaq	6736(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$56:
	leaq	176(%rsp), %rsp
	movb	$6, %cl
	leaq	1104(%rsp), %r10
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$55:
	leaq	176(%rsp), %rsp
	leaq	4176(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$54:
	leaq	4688(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$53:
	leaq	5200(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$52:
	leaq	7248(%rsp), %rsi
	leaq	8784(%rsp), %rdx
	leaq	4176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$51:
	leaq	16(%rsp), %rsp
	leaq	1616(%rsp), %rsi
	leaq	9296(%rsp), %rdx
	leaq	4688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$50:
	leaq	16(%rsp), %rsp
	leaq	7248(%rsp), %rcx
	leaq	1616(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$49:
	leaq	1616(%rsp), %rsi
	leaq	9808(%rsp), %rdx
	leaq	5200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$48:
	leaq	16(%rsp), %rsp
	leaq	7248(%rsp), %rcx
	leaq	1616(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$47:
	leaq	7248(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$45
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$46:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$45:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$46
	leaq	7760(%rsp), %rsi
	leaq	10320(%rsp), %rdx
	leaq	4176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$44:
	leaq	16(%rsp), %rsp
	leaq	1616(%rsp), %rsi
	leaq	10832(%rsp), %rdx
	leaq	4688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$43:
	leaq	16(%rsp), %rsp
	leaq	7760(%rsp), %rcx
	leaq	1616(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$42:
	leaq	1616(%rsp), %rsi
	leaq	11344(%rsp), %rdx
	leaq	5200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$41:
	leaq	16(%rsp), %rsp
	leaq	7760(%rsp), %rcx
	leaq	1616(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$40:
	leaq	7760(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$38
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$39:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$38:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$39
	leaq	8272(%rsp), %rsi
	leaq	11856(%rsp), %rdx
	leaq	4176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$37:
	leaq	16(%rsp), %rsp
	leaq	1616(%rsp), %rsi
	leaq	12368(%rsp), %rdx
	leaq	4688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$36:
	leaq	16(%rsp), %rsp
	leaq	8272(%rsp), %rcx
	leaq	1616(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$35:
	leaq	1616(%rsp), %rsi
	leaq	12880(%rsp), %rdx
	leaq	5200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$34:
	leaq	16(%rsp), %rsp
	leaq	8272(%rsp), %rcx
	leaq	1616(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$33:
	leaq	8272(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$31
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$32:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$31:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$32
	leaq	1616(%rsp), %rsi
	leaq	2640(%rsp), %rdx
	leaq	4176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$30:
	leaq	16(%rsp), %rsp
	leaq	2128(%rsp), %rsi
	leaq	3152(%rsp), %rdx
	leaq	4688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$29:
	leaq	16(%rsp), %rsp
	leaq	1616(%rsp), %rcx
	leaq	2128(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$28:
	leaq	2128(%rsp), %rsi
	leaq	3664(%rsp), %rdx
	leaq	5200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$27:
	leaq	16(%rsp), %rsp
	leaq	1616(%rsp), %rcx
	leaq	2128(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$26:
	leaq	1616(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$24
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$25:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$24:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$25
	leaq	7248(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$23:
	leaq	7760(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$22:
	leaq	8272(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$21:
	leaq	1616(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$20:
	leaq	7248(%rsp), %rcx
	leaq	5712(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$19:
	leaq	7760(%rsp), %rcx
	leaq	6224(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$18:
	leaq	8272(%rsp), %rcx
	leaq	6736(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$17:
	leaq	1616(%rsp), %rcx
	leaq	1104(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$16:
	leaq	1616(%rsp), %rcx
	leaq	592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$15:
	leaq	7248(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$13
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$14:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$13:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$14
	leaq	7760(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$11
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$12:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$11:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$12
	leaq	8272(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$9
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$10:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$9:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$10
	leaq	1616(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$7
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$8:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$7:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$8
	movq	%mm3, %rdi
	movq	%rdi, %r10
	movq	$0, %rax
	movq	$0, %r8
	leaq	7248(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$6:
	leaq	7760(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$5:
	leaq	8272(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$4:
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$2
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$3:
	movzwq	7248(%rsp,%rax,2), %r9
	shlq	$10, %r9
	addq	$1665, %r9
	imulq	$1290167, %r9, %r9
	shrq	$32, %r9
	andq	$1023, %r9
	movzwq	7250(%rsp,%rax,2), %r11
	shlq	$10, %r11
	addq	$1665, %r11
	imulq	$1290167, %r11, %r11
	shrq	$32, %r11
	andq	$1023, %r11
	movzwq	7252(%rsp,%rax,2), %rbp
	shlq	$10, %rbp
	addq	$1665, %rbp
	imulq	$1290167, %rbp, %rbp
	shrq	$32, %rbp
	andq	$1023, %rbp
	movzwq	7254(%rsp,%rax,2), %r12
	shlq	$10, %r12
	addq	$1665, %r12
	imulq	$1290167, %r12, %r12
	shrq	$32, %r12
	andq	$1023, %r12
	movw	%r9w, %si
	andw	$255, %si
	movb	%sil, (%r10,%r8)
	incq	%r8
	shrw	$8, %r9w
	movw	%r11w, %si
	shlw	$2, %si
	orw 	%r9w, %si
	movb	%sil, (%r10,%r8)
	incq	%r8
	shrw	$6, %r11w
	movw	%bp, %si
	shlw	$4, %si
	orw 	%r11w, %si
	movb	%sil, (%r10,%r8)
	incq	%r8
	shrw	$4, %bp
	movw	%r12w, %si
	shlw	$6, %si
	orw 	%bp, %si
	movb	%sil, (%r10,%r8)
	incq	%r8
	shrq	$2, %r12
	movb	%r12b, (%r10,%r8)
	incq	%r8
	addq	$4, %rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$2:
	cmpq	$765, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$3
	leaq	960(%rdi), %r10
	leaq	1616(%rsp), %rcx
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$1:
	movq	8(%rsp), %rsi
	movq	160(%rsp), %rcx
	movq	%rcx, (%rsi)
	movq	168(%rsp), %rcx
	movq	%rcx, 8(%rsi)
	movq	176(%rsp), %rcx
	movq	%rcx, 16(%rsi)
	movq	184(%rsp), %rcx
	movq	%rcx, 24(%rsi)
	xorl	%eax, %eax
	movq	13392(%rsp), %rbx
	movq	13400(%rsp), %rbp
	movq	13408(%rsp), %r12
	movq	13416(%rsp), %r13
	movq	13424(%rsp), %r14
	movq	13432(%rsp), %r15
	movq	13440(%rsp), %rsp
	ret
	.type	jade_kem_mlkem_mlkem768_amd64_ref_keypair, %function
jade_kem_mlkem_mlkem768_amd64_ref_keypair:
	movq	%rsp, %rax
	leaq	-10448(%rsp), %rsp
	andq	$-16, %rsp
	movq	%rbx, 10392(%rsp)
	movq	%rbp, 10400(%rsp)
	movq	%r12, 10408(%rsp)
	movq	%r13, 10416(%rsp)
	movq	%r14, 10424(%rsp)
	movq	%r15, 10432(%rsp)
	movq	%rax, 10440(%rsp)
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	lfence
	movq	$0, %rax
	leaq	168(%rsp), %rdi
	movq	$64, %rsi
	call	__jasmin_syscall_randombytes__
	movq	%rax, %mm0
	movq	%rbp, %rcx
	movq	%rbp, (%rsp)
	movq	%rbx, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	(%rax), %rcx
	movq	%rcx, 88(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 96(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 104(%rsp)
	movq	24(%rax), %rcx
	movq	%rcx, 112(%rsp)
	movb	$3, 120(%rsp)
	leaq	232(%rsp), %rsi
	leaq	88(%rsp), %rbx
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$215:
	leaq	224(%rsp), %rsp
	movq	232(%rsp), %rcx
	movq	%rcx, 56(%rsp)
	movq	264(%rsp), %rcx
	movq	%rcx, 24(%rsp)
	movq	240(%rsp), %rcx
	movq	%rcx, 64(%rsp)
	movq	272(%rsp), %rcx
	movq	%rcx, 32(%rsp)
	movq	248(%rsp), %rcx
	movq	%rcx, 72(%rsp)
	movq	280(%rsp), %rcx
	movq	%rcx, 40(%rsp)
	movq	256(%rsp), %rcx
	movq	%rcx, 80(%rsp)
	movq	288(%rsp), %rcx
	movq	%rcx, 48(%rsp)
	movq	$0, %rax
	movq	%rax, %mm5
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
	movb	80(%rsp), %sil
	movb	%sil, 152(%rsp)
	movb	81(%rsp), %sil
	movb	%sil, 153(%rsp)
	movb	82(%rsp), %sil
	movb	%sil, 154(%rsp)
	movb	83(%rsp), %sil
	movb	%sil, 155(%rsp)
	movb	84(%rsp), %sil
	movb	%sil, 156(%rsp)
	movb	85(%rsp), %sil
	movb	%sil, 157(%rsp)
	movb	86(%rsp), %sil
	movb	%sil, 158(%rsp)
	movb	87(%rsp), %sil
	movb	%sil, 159(%rsp)
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$213
	movb	$0, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$214
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$213:
	movb	$0, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$214:
	leaq	464(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$212:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$199
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$200:
	movq	%rcx, %mm6
	leaq	464(%rsp), %rdx
	leaq	296(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$211:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$201
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$202:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$203
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$201
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$203:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	296(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	297(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	298(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$209
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$210
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$209:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$210:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$205
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$201
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$205:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$207
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$201
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$207:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$208:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$206:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$204:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$201:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$202
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$199:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$200
	movq	$0, %rax
	leaq	5784(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$197
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$198:
	movw	664(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$197:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$198
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$195
	movb	$0, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$196
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$195:
	movb	$1, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$196:
	leaq	464(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$194:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$181
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$182:
	movq	%rcx, %mm6
	leaq	464(%rsp), %rdx
	leaq	296(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$193:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$183
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$184:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$185
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$183
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$185:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	296(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	297(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	298(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$191
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$192
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$191:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$192:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$187
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$183
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$187:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$189
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$183
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$189:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$190:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$188:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$186:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$183:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$184
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$181:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$182
	movq	$0, %rax
	leaq	6296(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$179
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$180:
	movw	664(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$179:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$180
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$177
	movb	$0, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$178
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$177:
	movb	$2, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$178:
	leaq	464(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$176:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$163
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$164:
	movq	%rcx, %mm6
	leaq	464(%rsp), %rdx
	leaq	296(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$175:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$165
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$166:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$167
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$165
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$167:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	296(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	297(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	298(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$173
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$174
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$173:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$174:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$169
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$165
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$169:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$171
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$165
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$171:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$172:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$170:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$168:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$165:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$166
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$163:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$164
	movq	$0, %rax
	leaq	6808(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$161
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$162:
	movw	664(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$161:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$162
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$159
	movb	$1, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$160
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$159:
	movb	$0, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$160:
	leaq	464(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$158:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$145
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$146:
	movq	%rcx, %mm6
	leaq	464(%rsp), %rdx
	leaq	296(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$157:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$147
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$148:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$149
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$147
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$149:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	296(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	297(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	298(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$155
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$156
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$155:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$156:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$151
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$147
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$151:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$153
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$147
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$153:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$154:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$152:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$150:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$147:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$148
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$145:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$146
	movq	$0, %rax
	leaq	7320(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$143
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$144:
	movw	664(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$143:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$144
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$141
	movb	$1, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$142
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$141:
	movb	$1, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$142:
	leaq	464(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$140:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$127
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$128:
	movq	%rcx, %mm6
	leaq	464(%rsp), %rdx
	leaq	296(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$139:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$129
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$130:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$131
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$129
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$131:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	296(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	297(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	298(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$137
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$138
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$137:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$138:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$133
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$129
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$133:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$135
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$129
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$135:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$136:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$134:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$132:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$129:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$130
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$127:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$128
	movq	$0, %rax
	leaq	7832(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$125
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$126:
	movw	664(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$125:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$126
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$123
	movb	$1, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$124
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$123:
	movb	$2, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$124:
	leaq	464(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$122:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$109
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$110:
	movq	%rcx, %mm6
	leaq	464(%rsp), %rdx
	leaq	296(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$121:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$111
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$112:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$113
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$111
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$113:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	296(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	297(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	298(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$119
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$120
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$119:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$120:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$115
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$111
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$115:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$117
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$111
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$117:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$118:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$116:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$114:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$111:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$112
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$109:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$110
	movq	$0, %rax
	leaq	8344(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$107
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$108:
	movw	664(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$107:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$108
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$105
	movb	$2, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$106
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$105:
	movb	$0, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$106:
	leaq	464(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$104:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$91
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$92:
	movq	%rcx, %mm6
	leaq	464(%rsp), %rdx
	leaq	296(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$103:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$93
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$94:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$95
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$93
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$95:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	296(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	297(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	298(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$101
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$102
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$101:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$102:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$97
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$93
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$97:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$99
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$93
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$99:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$100:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$98:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$96:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$93:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$94
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$91:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$92
	movq	$0, %rax
	leaq	8856(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$89
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$90:
	movw	664(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$89:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$90
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$87
	movb	$2, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$88
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$87:
	movb	$1, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$88:
	leaq	464(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$86:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$73
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$74:
	movq	%rcx, %mm6
	leaq	464(%rsp), %rdx
	leaq	296(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$85:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$75
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$76:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$77
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$75
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$77:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	296(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	297(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	298(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$83
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$84
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$83:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$84:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$79
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$75
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$79:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$81
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$75
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$81:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$82:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$80:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$78:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$75:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$76
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$73:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$74
	movq	$0, %rax
	leaq	9368(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$71
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$72:
	movw	664(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$71:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$72
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$69
	movb	$2, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$70
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$69:
	movb	$2, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$70:
	leaq	464(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$68:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$55
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$56:
	movq	%rcx, %mm6
	leaq	464(%rsp), %rdx
	leaq	296(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$67:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$57
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$58:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$59
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$57
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$59:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	296(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	297(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	298(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$65
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$66
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$65:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$66:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$61
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$57
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$61:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$63
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$57
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$63:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 664(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$64:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$62:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$60:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$57:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$58
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$55:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$56
	movq	$0, %rax
	leaq	9880(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$53
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$54:
	movw	664(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$53:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$54
	movb	$0, %cl
	leaq	1176(%rsp), %r10
	leaq	24(%rsp), %rax
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$52:
	leaq	176(%rsp), %rsp
	movb	$1, %cl
	leaq	1688(%rsp), %r10
	leaq	24(%rsp), %rax
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$51:
	leaq	176(%rsp), %rsp
	movb	$2, %cl
	leaq	2200(%rsp), %r10
	leaq	24(%rsp), %rax
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$50:
	leaq	176(%rsp), %rsp
	movb	$3, %cl
	leaq	2712(%rsp), %r10
	leaq	24(%rsp), %rax
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$49:
	leaq	176(%rsp), %rsp
	movb	$4, %cl
	leaq	3224(%rsp), %r10
	leaq	24(%rsp), %rax
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$48:
	leaq	176(%rsp), %rsp
	movb	$5, %cl
	leaq	3736(%rsp), %r10
	leaq	24(%rsp), %rax
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$47:
	leaq	176(%rsp), %rsp
	leaq	1176(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$46:
	leaq	1688(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$45:
	leaq	2200(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$44:
	leaq	2712(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$43:
	leaq	3224(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$42:
	leaq	3736(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$41:
	leaq	4248(%rsp), %rsi
	leaq	5784(%rsp), %rdx
	leaq	1176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$40:
	leaq	16(%rsp), %rsp
	leaq	664(%rsp), %rsi
	leaq	6296(%rsp), %rdx
	leaq	1688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$39:
	leaq	16(%rsp), %rsp
	leaq	4248(%rsp), %rcx
	leaq	664(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$38:
	leaq	664(%rsp), %rsi
	leaq	6808(%rsp), %rdx
	leaq	2200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$37:
	leaq	16(%rsp), %rsp
	leaq	4248(%rsp), %rcx
	leaq	664(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$36:
	leaq	4248(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$34
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$35:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$34:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$35
	leaq	4248(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$33:
	leaq	4760(%rsp), %rsi
	leaq	7320(%rsp), %rdx
	leaq	1176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$32:
	leaq	16(%rsp), %rsp
	leaq	664(%rsp), %rsi
	leaq	7832(%rsp), %rdx
	leaq	1688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$31:
	leaq	16(%rsp), %rsp
	leaq	4760(%rsp), %rcx
	leaq	664(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$30:
	leaq	664(%rsp), %rsi
	leaq	8344(%rsp), %rdx
	leaq	2200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$29:
	leaq	16(%rsp), %rsp
	leaq	4760(%rsp), %rcx
	leaq	664(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$28:
	leaq	4760(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$26
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$27:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$26:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$27
	leaq	4760(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$25:
	leaq	5272(%rsp), %rsi
	leaq	8856(%rsp), %rdx
	leaq	1176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$24:
	leaq	16(%rsp), %rsp
	leaq	664(%rsp), %rsi
	leaq	9368(%rsp), %rdx
	leaq	1688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$23:
	leaq	16(%rsp), %rsp
	leaq	5272(%rsp), %rcx
	leaq	664(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$22:
	leaq	664(%rsp), %rsi
	leaq	9880(%rsp), %rdx
	leaq	2200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$21:
	leaq	16(%rsp), %rsp
	leaq	5272(%rsp), %rcx
	leaq	664(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$20:
	leaq	5272(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$18
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$19:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$18:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$19
	leaq	5272(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$17:
	leaq	4248(%rsp), %rcx
	leaq	2712(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$16:
	leaq	4760(%rsp), %rcx
	leaq	3224(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$15:
	leaq	5272(%rsp), %rcx
	leaq	3736(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$14:
	leaq	4248(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$12
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$13:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$12:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$13
	leaq	4760(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$10
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$11:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$10:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$11
	leaq	5272(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$9:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$8:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$9
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rax
	movq	%rax, %r10
	leaq	1176(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$7:
	leaq	384(%rax), %r10
	leaq	1688(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$6:
	leaq	768(%rax), %r10
	leaq	2200(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$5:
	movq	%rbx, %rax
	movq	%rax, %r10
	leaq	4248(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$4:
	leaq	384(%rax), %r10
	leaq	4760(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$3:
	leaq	768(%rax), %r10
	leaq	5272(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$2:
	movq	56(%rsp), %rcx
	movq	%rcx, 1152(%rbx)
	movq	64(%rsp), %rcx
	movq	%rcx, 1160(%rbx)
	movq	72(%rsp), %rcx
	movq	%rcx, 1168(%rbx)
	movq	80(%rsp), %rcx
	movq	%rcx, 1176(%rbx)
	movq	(%rsp), %rax
	movq	(%rbx), %rcx
	movq	%rcx, 1152(%rax)
	movq	8(%rbx), %rcx
	movq	%rcx, 1160(%rax)
	movq	16(%rbx), %rcx
	movq	%rcx, 1168(%rax)
	movq	24(%rbx), %rcx
	movq	%rcx, 1176(%rax)
	movq	32(%rbx), %rcx
	movq	%rcx, 1184(%rax)
	movq	40(%rbx), %rcx
	movq	%rcx, 1192(%rax)
	movq	48(%rbx), %rcx
	movq	%rcx, 1200(%rax)
	movq	56(%rbx), %rcx
	movq	%rcx, 1208(%rax)
	movq	64(%rbx), %rcx
	movq	%rcx, 1216(%rax)
	movq	72(%rbx), %rcx
	movq	%rcx, 1224(%rax)
	movq	80(%rbx), %rcx
	movq	%rcx, 1232(%rax)
	movq	88(%rbx), %rcx
	movq	%rcx, 1240(%rax)
	movq	96(%rbx), %rcx
	movq	%rcx, 1248(%rax)
	movq	104(%rbx), %rcx
	movq	%rcx, 1256(%rax)
	movq	112(%rbx), %rcx
	movq	%rcx, 1264(%rax)
	movq	120(%rbx), %rcx
	movq	%rcx, 1272(%rax)
	movq	128(%rbx), %rcx
	movq	%rcx, 1280(%rax)
	movq	136(%rbx), %rcx
	movq	%rcx, 1288(%rax)
	movq	144(%rbx), %rcx
	movq	%rcx, 1296(%rax)
	movq	152(%rbx), %rcx
	movq	%rcx, 1304(%rax)
	movq	160(%rbx), %rcx
	movq	%rcx, 1312(%rax)
	movq	168(%rbx), %rcx
	movq	%rcx, 1320(%rax)
	movq	176(%rbx), %rcx
	movq	%rcx, 1328(%rax)
	movq	184(%rbx), %rcx
	movq	%rcx, 1336(%rax)
	movq	192(%rbx), %rcx
	movq	%rcx, 1344(%rax)
	movq	200(%rbx), %rcx
	movq	%rcx, 1352(%rax)
	movq	208(%rbx), %rcx
	movq	%rcx, 1360(%rax)
	movq	216(%rbx), %rcx
	movq	%rcx, 1368(%rax)
	movq	224(%rbx), %rcx
	movq	%rcx, 1376(%rax)
	movq	232(%rbx), %rcx
	movq	%rcx, 1384(%rax)
	movq	240(%rbx), %rcx
	movq	%rcx, 1392(%rax)
	movq	248(%rbx), %rcx
	movq	%rcx, 1400(%rax)
	movq	256(%rbx), %rcx
	movq	%rcx, 1408(%rax)
	movq	264(%rbx), %rcx
	movq	%rcx, 1416(%rax)
	movq	272(%rbx), %rcx
	movq	%rcx, 1424(%rax)
	movq	280(%rbx), %rcx
	movq	%rcx, 1432(%rax)
	movq	288(%rbx), %rcx
	movq	%rcx, 1440(%rax)
	movq	296(%rbx), %rcx
	movq	%rcx, 1448(%rax)
	movq	304(%rbx), %rcx
	movq	%rcx, 1456(%rax)
	movq	312(%rbx), %rcx
	movq	%rcx, 1464(%rax)
	movq	320(%rbx), %rcx
	movq	%rcx, 1472(%rax)
	movq	328(%rbx), %rcx
	movq	%rcx, 1480(%rax)
	movq	336(%rbx), %rcx
	movq	%rcx, 1488(%rax)
	movq	344(%rbx), %rcx
	movq	%rcx, 1496(%rax)
	movq	352(%rbx), %rcx
	movq	%rcx, 1504(%rax)
	movq	360(%rbx), %rcx
	movq	%rcx, 1512(%rax)
	movq	368(%rbx), %rcx
	movq	%rcx, 1520(%rax)
	movq	376(%rbx), %rcx
	movq	%rcx, 1528(%rax)
	movq	384(%rbx), %rcx
	movq	%rcx, 1536(%rax)
	movq	392(%rbx), %rcx
	movq	%rcx, 1544(%rax)
	movq	400(%rbx), %rcx
	movq	%rcx, 1552(%rax)
	movq	408(%rbx), %rcx
	movq	%rcx, 1560(%rax)
	movq	416(%rbx), %rcx
	movq	%rcx, 1568(%rax)
	movq	424(%rbx), %rcx
	movq	%rcx, 1576(%rax)
	movq	432(%rbx), %rcx
	movq	%rcx, 1584(%rax)
	movq	440(%rbx), %rcx
	movq	%rcx, 1592(%rax)
	movq	448(%rbx), %rcx
	movq	%rcx, 1600(%rax)
	movq	456(%rbx), %rcx
	movq	%rcx, 1608(%rax)
	movq	464(%rbx), %rcx
	movq	%rcx, 1616(%rax)
	movq	472(%rbx), %rcx
	movq	%rcx, 1624(%rax)
	movq	480(%rbx), %rcx
	movq	%rcx, 1632(%rax)
	movq	488(%rbx), %rcx
	movq	%rcx, 1640(%rax)
	movq	496(%rbx), %rcx
	movq	%rcx, 1648(%rax)
	movq	504(%rbx), %rcx
	movq	%rcx, 1656(%rax)
	movq	512(%rbx), %rcx
	movq	%rcx, 1664(%rax)
	movq	520(%rbx), %rcx
	movq	%rcx, 1672(%rax)
	movq	528(%rbx), %rcx
	movq	%rcx, 1680(%rax)
	movq	536(%rbx), %rcx
	movq	%rcx, 1688(%rax)
	movq	544(%rbx), %rcx
	movq	%rcx, 1696(%rax)
	movq	552(%rbx), %rcx
	movq	%rcx, 1704(%rax)
	movq	560(%rbx), %rcx
	movq	%rcx, 1712(%rax)
	movq	568(%rbx), %rcx
	movq	%rcx, 1720(%rax)
	movq	576(%rbx), %rcx
	movq	%rcx, 1728(%rax)
	movq	584(%rbx), %rcx
	movq	%rcx, 1736(%rax)
	movq	592(%rbx), %rcx
	movq	%rcx, 1744(%rax)
	movq	600(%rbx), %rcx
	movq	%rcx, 1752(%rax)
	movq	608(%rbx), %rcx
	movq	%rcx, 1760(%rax)
	movq	616(%rbx), %rcx
	movq	%rcx, 1768(%rax)
	movq	624(%rbx), %rcx
	movq	%rcx, 1776(%rax)
	movq	632(%rbx), %rcx
	movq	%rcx, 1784(%rax)
	movq	640(%rbx), %rcx
	movq	%rcx, 1792(%rax)
	movq	648(%rbx), %rcx
	movq	%rcx, 1800(%rax)
	movq	656(%rbx), %rcx
	movq	%rcx, 1808(%rax)
	movq	664(%rbx), %rcx
	movq	%rcx, 1816(%rax)
	movq	672(%rbx), %rcx
	movq	%rcx, 1824(%rax)
	movq	680(%rbx), %rcx
	movq	%rcx, 1832(%rax)
	movq	688(%rbx), %rcx
	movq	%rcx, 1840(%rax)
	movq	696(%rbx), %rcx
	movq	%rcx, 1848(%rax)
	movq	704(%rbx), %rcx
	movq	%rcx, 1856(%rax)
	movq	712(%rbx), %rcx
	movq	%rcx, 1864(%rax)
	movq	720(%rbx), %rcx
	movq	%rcx, 1872(%rax)
	movq	728(%rbx), %rcx
	movq	%rcx, 1880(%rax)
	movq	736(%rbx), %rcx
	movq	%rcx, 1888(%rax)
	movq	744(%rbx), %rcx
	movq	%rcx, 1896(%rax)
	movq	752(%rbx), %rcx
	movq	%rcx, 1904(%rax)
	movq	760(%rbx), %rcx
	movq	%rcx, 1912(%rax)
	movq	768(%rbx), %rcx
	movq	%rcx, 1920(%rax)
	movq	776(%rbx), %rcx
	movq	%rcx, 1928(%rax)
	movq	784(%rbx), %rcx
	movq	%rcx, 1936(%rax)
	movq	792(%rbx), %rcx
	movq	%rcx, 1944(%rax)
	movq	800(%rbx), %rcx
	movq	%rcx, 1952(%rax)
	movq	808(%rbx), %rcx
	movq	%rcx, 1960(%rax)
	movq	816(%rbx), %rcx
	movq	%rcx, 1968(%rax)
	movq	824(%rbx), %rcx
	movq	%rcx, 1976(%rax)
	movq	832(%rbx), %rcx
	movq	%rcx, 1984(%rax)
	movq	840(%rbx), %rcx
	movq	%rcx, 1992(%rax)
	movq	848(%rbx), %rcx
	movq	%rcx, 2000(%rax)
	movq	856(%rbx), %rcx
	movq	%rcx, 2008(%rax)
	movq	864(%rbx), %rcx
	movq	%rcx, 2016(%rax)
	movq	872(%rbx), %rcx
	movq	%rcx, 2024(%rax)
	movq	880(%rbx), %rcx
	movq	%rcx, 2032(%rax)
	movq	888(%rbx), %rcx
	movq	%rcx, 2040(%rax)
	movq	896(%rbx), %rcx
	movq	%rcx, 2048(%rax)
	movq	904(%rbx), %rcx
	movq	%rcx, 2056(%rax)
	movq	912(%rbx), %rcx
	movq	%rcx, 2064(%rax)
	movq	920(%rbx), %rcx
	movq	%rcx, 2072(%rax)
	movq	928(%rbx), %rcx
	movq	%rcx, 2080(%rax)
	movq	936(%rbx), %rcx
	movq	%rcx, 2088(%rax)
	movq	944(%rbx), %rcx
	movq	%rcx, 2096(%rax)
	movq	952(%rbx), %rcx
	movq	%rcx, 2104(%rax)
	movq	960(%rbx), %rcx
	movq	%rcx, 2112(%rax)
	movq	968(%rbx), %rcx
	movq	%rcx, 2120(%rax)
	movq	976(%rbx), %rcx
	movq	%rcx, 2128(%rax)
	movq	984(%rbx), %rcx
	movq	%rcx, 2136(%rax)
	movq	992(%rbx), %rcx
	movq	%rcx, 2144(%rax)
	movq	1000(%rbx), %rcx
	movq	%rcx, 2152(%rax)
	movq	1008(%rbx), %rcx
	movq	%rcx, 2160(%rax)
	movq	1016(%rbx), %rcx
	movq	%rcx, 2168(%rax)
	movq	1024(%rbx), %rcx
	movq	%rcx, 2176(%rax)
	movq	1032(%rbx), %rcx
	movq	%rcx, 2184(%rax)
	movq	1040(%rbx), %rcx
	movq	%rcx, 2192(%rax)
	movq	1048(%rbx), %rcx
	movq	%rcx, 2200(%rax)
	movq	1056(%rbx), %rcx
	movq	%rcx, 2208(%rax)
	movq	1064(%rbx), %rcx
	movq	%rcx, 2216(%rax)
	movq	1072(%rbx), %rcx
	movq	%rcx, 2224(%rax)
	movq	1080(%rbx), %rcx
	movq	%rcx, 2232(%rax)
	movq	1088(%rbx), %rcx
	movq	%rcx, 2240(%rax)
	movq	1096(%rbx), %rcx
	movq	%rcx, 2248(%rax)
	movq	1104(%rbx), %rcx
	movq	%rcx, 2256(%rax)
	movq	1112(%rbx), %rcx
	movq	%rcx, 2264(%rax)
	movq	1120(%rbx), %rcx
	movq	%rcx, 2272(%rax)
	movq	1128(%rbx), %rcx
	movq	%rcx, 2280(%rax)
	movq	1136(%rbx), %rcx
	movq	%rcx, 2288(%rax)
	movq	1144(%rbx), %rcx
	movq	%rcx, 2296(%rax)
	movq	1152(%rbx), %rcx
	movq	%rcx, 2304(%rax)
	movq	1160(%rbx), %rcx
	movq	%rcx, 2312(%rax)
	movq	1168(%rbx), %rcx
	movq	%rcx, 2320(%rax)
	movq	1176(%rbx), %rcx
	movq	%rcx, 2328(%rax)
	movq	%rax, (%rsp)
	leaq	56(%rsp), %rsi
	leaq	-232(%rsp), %rsp
	call	L_sha3_256A_A1184$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$1:
	leaq	232(%rsp), %rsp
	movq	(%rsp), %rdx
	movq	56(%rsp), %rcx
	movq	%rcx, 2336(%rdx)
	movq	64(%rsp), %rcx
	movq	%rcx, 2344(%rdx)
	movq	72(%rsp), %rcx
	movq	%rcx, 2352(%rdx)
	movq	80(%rsp), %rcx
	movq	%rcx, 2360(%rdx)
	movq	%mm0, %rax
	leaq	32(%rax), %rax
	movq	(%rax), %rcx
	movq	%rcx, 2368(%rdx)
	movq	8(%rax), %rcx
	movq	%rcx, 2376(%rdx)
	movq	16(%rax), %rcx
	movq	%rcx, 2384(%rdx)
	movq	24(%rax), %rcx
	movq	%rcx, 2392(%rdx)
	xorl	%eax, %eax
	movq	10392(%rsp), %rbx
	movq	10400(%rsp), %rbp
	movq	10408(%rsp), %r12
	movq	10416(%rsp), %r13
	movq	10424(%rsp), %r14
	movq	10432(%rsp), %r15
	movq	10440(%rsp), %rsp
	ret
	.type	jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand, %function
jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand:
	movq	%rsp, %rax
	leaq	-10384(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 10328(%rsp)
	movq	%rbp, 10336(%rsp)
	movq	%r12, 10344(%rsp)
	movq	%r13, 10352(%rsp)
	movq	%r14, 10360(%rsp)
	movq	%r15, 10368(%rsp)
	movq	%rax, 10376(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdx, %mm0
	movq	%rsi, %rax
	movq	%rsi, (%rsp)
	movq	%rdi, 8(%rsp)
	movq	%rax, 16(%rsp)
	movq	(%rdx), %rcx
	movq	%rcx, 88(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 96(%rsp)
	movq	16(%rdx), %rcx
	movq	%rcx, 104(%rsp)
	movq	24(%rdx), %rcx
	movq	%rcx, 112(%rsp)
	movb	$3, 120(%rsp)
	leaq	168(%rsp), %rsi
	leaq	88(%rsp), %rbx
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$215:
	leaq	224(%rsp), %rsp
	movq	168(%rsp), %rcx
	movq	%rcx, 56(%rsp)
	movq	200(%rsp), %rcx
	movq	%rcx, 24(%rsp)
	movq	176(%rsp), %rcx
	movq	%rcx, 64(%rsp)
	movq	208(%rsp), %rcx
	movq	%rcx, 32(%rsp)
	movq	184(%rsp), %rcx
	movq	%rcx, 72(%rsp)
	movq	216(%rsp), %rcx
	movq	%rcx, 40(%rsp)
	movq	192(%rsp), %rcx
	movq	%rcx, 80(%rsp)
	movq	224(%rsp), %rcx
	movq	%rcx, 48(%rsp)
	movq	$0, %rax
	movq	%rax, %mm5
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
	movb	80(%rsp), %sil
	movb	%sil, 152(%rsp)
	movb	81(%rsp), %sil
	movb	%sil, 153(%rsp)
	movb	82(%rsp), %sil
	movb	%sil, 154(%rsp)
	movb	83(%rsp), %sil
	movb	%sil, 155(%rsp)
	movb	84(%rsp), %sil
	movb	%sil, 156(%rsp)
	movb	85(%rsp), %sil
	movb	%sil, 157(%rsp)
	movb	86(%rsp), %sil
	movb	%sil, 158(%rsp)
	movb	87(%rsp), %sil
	movb	%sil, 159(%rsp)
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$213
	movb	$0, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$214
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$213:
	movb	$0, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$214:
	leaq	400(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$212:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$199
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$200:
	movq	%rcx, %mm6
	leaq	400(%rsp), %rdx
	leaq	232(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$211:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$201
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$202:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$203
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$201
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$203:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	232(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	233(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	234(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$209
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$210
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$209:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$210:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$205
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$201
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$205:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$207
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$201
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$207:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$208:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$206:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$204:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$201:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$202
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$199:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$200
	movq	$0, %rax
	leaq	5720(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$197
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$198:
	movw	600(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$197:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$198
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$195
	movb	$0, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$196
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$195:
	movb	$1, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$196:
	leaq	400(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$194:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$181
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$182:
	movq	%rcx, %mm6
	leaq	400(%rsp), %rdx
	leaq	232(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$193:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$183
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$184:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$185
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$183
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$185:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	232(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	233(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	234(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$191
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$192
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$191:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$192:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$187
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$183
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$187:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$189
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$183
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$189:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$190:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$188:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$186:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$183:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$184
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$181:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$182
	movq	$0, %rax
	leaq	6232(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$179
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$180:
	movw	600(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$179:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$180
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$177
	movb	$0, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$178
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$177:
	movb	$2, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$178:
	leaq	400(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$176:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$163
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$164:
	movq	%rcx, %mm6
	leaq	400(%rsp), %rdx
	leaq	232(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$175:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$165
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$166:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$167
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$165
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$167:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	232(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	233(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	234(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$173
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$174
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$173:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$174:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$169
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$165
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$169:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$171
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$165
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$171:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$172:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$170:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$168:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$165:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$166
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$163:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$164
	movq	$0, %rax
	leaq	6744(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$161
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$162:
	movw	600(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$161:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$162
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$159
	movb	$1, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$160
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$159:
	movb	$0, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$160:
	leaq	400(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$158:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$145
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$146:
	movq	%rcx, %mm6
	leaq	400(%rsp), %rdx
	leaq	232(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$157:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$147
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$148:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$149
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$147
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$149:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	232(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	233(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	234(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$155
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$156
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$155:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$156:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$151
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$147
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$151:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$153
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$147
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$153:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$154:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$152:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$150:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$147:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$148
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$145:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$146
	movq	$0, %rax
	leaq	7256(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$143
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$144:
	movw	600(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$143:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$144
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$141
	movb	$1, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$142
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$141:
	movb	$1, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$142:
	leaq	400(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$140:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$127
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$128:
	movq	%rcx, %mm6
	leaq	400(%rsp), %rdx
	leaq	232(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$139:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$129
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$130:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$131
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$129
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$131:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	232(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	233(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	234(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$137
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$138
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$137:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$138:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$133
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$129
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$133:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$135
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$129
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$135:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$136:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$134:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$132:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$129:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$130
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$127:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$128
	movq	$0, %rax
	leaq	7768(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$125
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$126:
	movw	600(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$125:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$126
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$123
	movb	$1, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$124
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$123:
	movb	$2, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$124:
	leaq	400(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$122:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$109
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$110:
	movq	%rcx, %mm6
	leaq	400(%rsp), %rdx
	leaq	232(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$121:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$111
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$112:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$113
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$111
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$113:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	232(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	233(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	234(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$119
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$120
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$119:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$120:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$115
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$111
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$115:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$117
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$111
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$117:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$118:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$116:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$114:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$111:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$112
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$109:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$110
	movq	$0, %rax
	leaq	8280(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$107
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$108:
	movw	600(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$107:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$108
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$105
	movb	$2, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$106
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$105:
	movb	$0, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$106:
	leaq	400(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$104:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$91
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$92:
	movq	%rcx, %mm6
	leaq	400(%rsp), %rdx
	leaq	232(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$103:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$93
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$94:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$95
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$93
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$95:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	232(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	233(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	234(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$101
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$102
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$101:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$102:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$97
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$93
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$97:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$99
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$93
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$99:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$100:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$98:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$96:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$93:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$94
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$91:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$92
	movq	$0, %rax
	leaq	8792(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$89
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$90:
	movw	600(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$89:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$90
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$87
	movb	$2, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$88
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$87:
	movb	$1, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$88:
	leaq	400(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$86:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$73
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$74:
	movq	%rcx, %mm6
	leaq	400(%rsp), %rdx
	leaq	232(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$85:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$75
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$76:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$77
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$75
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$77:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	232(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	233(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	234(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$83
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$84
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$83:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$84:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$79
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$75
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$79:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$81
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$75
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$81:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$82:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$80:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$78:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$75:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$76
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$73:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$74
	movq	$0, %rax
	leaq	9304(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$71
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$72:
	movw	600(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$71:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$72
	movq	%mm5, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$69
	movb	$2, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$70
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$69:
	movb	$2, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$70:
	leaq	400(%rsp), %rdx
	leaq	128(%rsp), %rbx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$68:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$55
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$56:
	movq	%rcx, %mm6
	leaq	400(%rsp), %rdx
	leaq	232(%rsp), %rsi
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$67:
	leaq	8(%rsp), %rsp
	movq	%mm6, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$57
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$58:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$59
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$57
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$59:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	232(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	233(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	234(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$65
	movq	$-1, %r8
	cmovb	%r8, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$66
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$65:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$66:
	cmpw	$3329, %di
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$61
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$57
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$61:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$63
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$57
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$63:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movw	%di, 600(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$64:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$62:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$60:
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$57:
	cmpq	$166, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$58
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$55:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$56
	movq	$0, %rax
	leaq	9816(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$53
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$54:
	movw	600(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$53:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$54
	movb	$0, %cl
	leaq	1112(%rsp), %r10
	leaq	24(%rsp), %rax
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$52:
	leaq	176(%rsp), %rsp
	movb	$1, %cl
	leaq	1624(%rsp), %r10
	leaq	24(%rsp), %rax
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$51:
	leaq	176(%rsp), %rsp
	movb	$2, %cl
	leaq	2136(%rsp), %r10
	leaq	24(%rsp), %rax
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$50:
	leaq	176(%rsp), %rsp
	movb	$3, %cl
	leaq	2648(%rsp), %r10
	leaq	24(%rsp), %rax
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$49:
	leaq	176(%rsp), %rsp
	movb	$4, %cl
	leaq	3160(%rsp), %r10
	leaq	24(%rsp), %rax
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$48:
	leaq	176(%rsp), %rsp
	movb	$5, %cl
	leaq	3672(%rsp), %r10
	leaq	24(%rsp), %rax
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$47:
	leaq	176(%rsp), %rsp
	leaq	1112(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$46:
	leaq	1624(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$45:
	leaq	2136(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$44:
	leaq	2648(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$43:
	leaq	3160(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$42:
	leaq	3672(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$41:
	leaq	4184(%rsp), %rsi
	leaq	5720(%rsp), %rdx
	leaq	1112(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$40:
	leaq	16(%rsp), %rsp
	leaq	600(%rsp), %rsi
	leaq	6232(%rsp), %rdx
	leaq	1624(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$39:
	leaq	16(%rsp), %rsp
	leaq	4184(%rsp), %rcx
	leaq	600(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$38:
	leaq	600(%rsp), %rsi
	leaq	6744(%rsp), %rdx
	leaq	2136(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$37:
	leaq	16(%rsp), %rsp
	leaq	4184(%rsp), %rcx
	leaq	600(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$36:
	leaq	4184(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$34
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$35:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %edx
	imull	$20159, %edx, %edx
	sarl	$26, %edx
	imull	$3329, %edx, %edx
	subw	%dx, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$34:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$35
	leaq	4184(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$33:
	leaq	4696(%rsp), %rsi
	leaq	7256(%rsp), %rdx
	leaq	1112(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$32:
	leaq	16(%rsp), %rsp
	leaq	600(%rsp), %rsi
	leaq	7768(%rsp), %rdx
	leaq	1624(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$31:
	leaq	16(%rsp), %rsp
	leaq	4696(%rsp), %rcx
	leaq	600(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$30:
	leaq	600(%rsp), %rsi
	leaq	8280(%rsp), %rdx
	leaq	2136(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$29:
	leaq	16(%rsp), %rsp
	leaq	4696(%rsp), %rcx
	leaq	600(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$28:
	leaq	4696(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$26
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$27:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %edx
	imull	$20159, %edx, %edx
	sarl	$26, %edx
	imull	$3329, %edx, %edx
	subw	%dx, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$26:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$27
	leaq	4696(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$25:
	leaq	5208(%rsp), %rsi
	leaq	8792(%rsp), %rdx
	leaq	1112(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$24:
	leaq	16(%rsp), %rsp
	leaq	600(%rsp), %rsi
	leaq	9304(%rsp), %rdx
	leaq	1624(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$23:
	leaq	16(%rsp), %rsp
	leaq	5208(%rsp), %rcx
	leaq	600(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$22:
	leaq	600(%rsp), %rsi
	leaq	9816(%rsp), %rdx
	leaq	2136(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$21:
	leaq	16(%rsp), %rsp
	leaq	5208(%rsp), %rcx
	leaq	600(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$20:
	leaq	5208(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$18
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$19:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %edx
	imull	$20159, %edx, %edx
	sarl	$26, %edx
	imull	$3329, %edx, %edx
	subw	%dx, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$18:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$19
	leaq	5208(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$17:
	leaq	4184(%rsp), %rcx
	leaq	2648(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$16:
	leaq	4696(%rsp), %rcx
	leaq	3160(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$15:
	leaq	5208(%rsp), %rcx
	leaq	3672(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$14:
	leaq	4184(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$12
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$13:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %edx
	imull	$20159, %edx, %edx
	sarl	$26, %edx
	imull	$3329, %edx, %edx
	subw	%dx, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$12:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$13
	leaq	4696(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$10
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$11:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %edx
	imull	$20159, %edx, %edx
	sarl	$26, %edx
	imull	$3329, %edx, %edx
	subw	%dx, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$10:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$11
	leaq	5208(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$9:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %edx
	imull	$20159, %edx, %edx
	sarl	$26, %edx
	imull	$3329, %edx, %edx
	subw	%dx, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$8:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$9
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rax
	movq	%rax, %r10
	leaq	1112(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$7:
	leaq	384(%rax), %r10
	leaq	1624(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$6:
	leaq	768(%rax), %r10
	leaq	2136(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$5:
	movq	%rbx, %rax
	movq	%rax, %r10
	leaq	4184(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$4:
	leaq	384(%rax), %r10
	leaq	4696(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$3:
	leaq	768(%rax), %r10
	leaq	5208(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$2:
	movq	56(%rsp), %rcx
	movq	%rcx, 1152(%rbx)
	movq	64(%rsp), %rcx
	movq	%rcx, 1160(%rbx)
	movq	72(%rsp), %rcx
	movq	%rcx, 1168(%rbx)
	movq	80(%rsp), %rcx
	movq	%rcx, 1176(%rbx)
	movq	(%rsp), %rax
	movq	(%rbx), %rcx
	movq	%rcx, 1152(%rax)
	movq	8(%rbx), %rcx
	movq	%rcx, 1160(%rax)
	movq	16(%rbx), %rcx
	movq	%rcx, 1168(%rax)
	movq	24(%rbx), %rcx
	movq	%rcx, 1176(%rax)
	movq	32(%rbx), %rcx
	movq	%rcx, 1184(%rax)
	movq	40(%rbx), %rcx
	movq	%rcx, 1192(%rax)
	movq	48(%rbx), %rcx
	movq	%rcx, 1200(%rax)
	movq	56(%rbx), %rcx
	movq	%rcx, 1208(%rax)
	movq	64(%rbx), %rcx
	movq	%rcx, 1216(%rax)
	movq	72(%rbx), %rcx
	movq	%rcx, 1224(%rax)
	movq	80(%rbx), %rcx
	movq	%rcx, 1232(%rax)
	movq	88(%rbx), %rcx
	movq	%rcx, 1240(%rax)
	movq	96(%rbx), %rcx
	movq	%rcx, 1248(%rax)
	movq	104(%rbx), %rcx
	movq	%rcx, 1256(%rax)
	movq	112(%rbx), %rcx
	movq	%rcx, 1264(%rax)
	movq	120(%rbx), %rcx
	movq	%rcx, 1272(%rax)
	movq	128(%rbx), %rcx
	movq	%rcx, 1280(%rax)
	movq	136(%rbx), %rcx
	movq	%rcx, 1288(%rax)
	movq	144(%rbx), %rcx
	movq	%rcx, 1296(%rax)
	movq	152(%rbx), %rcx
	movq	%rcx, 1304(%rax)
	movq	160(%rbx), %rcx
	movq	%rcx, 1312(%rax)
	movq	168(%rbx), %rcx
	movq	%rcx, 1320(%rax)
	movq	176(%rbx), %rcx
	movq	%rcx, 1328(%rax)
	movq	184(%rbx), %rcx
	movq	%rcx, 1336(%rax)
	movq	192(%rbx), %rcx
	movq	%rcx, 1344(%rax)
	movq	200(%rbx), %rcx
	movq	%rcx, 1352(%rax)
	movq	208(%rbx), %rcx
	movq	%rcx, 1360(%rax)
	movq	216(%rbx), %rcx
	movq	%rcx, 1368(%rax)
	movq	224(%rbx), %rcx
	movq	%rcx, 1376(%rax)
	movq	232(%rbx), %rcx
	movq	%rcx, 1384(%rax)
	movq	240(%rbx), %rcx
	movq	%rcx, 1392(%rax)
	movq	248(%rbx), %rcx
	movq	%rcx, 1400(%rax)
	movq	256(%rbx), %rcx
	movq	%rcx, 1408(%rax)
	movq	264(%rbx), %rcx
	movq	%rcx, 1416(%rax)
	movq	272(%rbx), %rcx
	movq	%rcx, 1424(%rax)
	movq	280(%rbx), %rcx
	movq	%rcx, 1432(%rax)
	movq	288(%rbx), %rcx
	movq	%rcx, 1440(%rax)
	movq	296(%rbx), %rcx
	movq	%rcx, 1448(%rax)
	movq	304(%rbx), %rcx
	movq	%rcx, 1456(%rax)
	movq	312(%rbx), %rcx
	movq	%rcx, 1464(%rax)
	movq	320(%rbx), %rcx
	movq	%rcx, 1472(%rax)
	movq	328(%rbx), %rcx
	movq	%rcx, 1480(%rax)
	movq	336(%rbx), %rcx
	movq	%rcx, 1488(%rax)
	movq	344(%rbx), %rcx
	movq	%rcx, 1496(%rax)
	movq	352(%rbx), %rcx
	movq	%rcx, 1504(%rax)
	movq	360(%rbx), %rcx
	movq	%rcx, 1512(%rax)
	movq	368(%rbx), %rcx
	movq	%rcx, 1520(%rax)
	movq	376(%rbx), %rcx
	movq	%rcx, 1528(%rax)
	movq	384(%rbx), %rcx
	movq	%rcx, 1536(%rax)
	movq	392(%rbx), %rcx
	movq	%rcx, 1544(%rax)
	movq	400(%rbx), %rcx
	movq	%rcx, 1552(%rax)
	movq	408(%rbx), %rcx
	movq	%rcx, 1560(%rax)
	movq	416(%rbx), %rcx
	movq	%rcx, 1568(%rax)
	movq	424(%rbx), %rcx
	movq	%rcx, 1576(%rax)
	movq	432(%rbx), %rcx
	movq	%rcx, 1584(%rax)
	movq	440(%rbx), %rcx
	movq	%rcx, 1592(%rax)
	movq	448(%rbx), %rcx
	movq	%rcx, 1600(%rax)
	movq	456(%rbx), %rcx
	movq	%rcx, 1608(%rax)
	movq	464(%rbx), %rcx
	movq	%rcx, 1616(%rax)
	movq	472(%rbx), %rcx
	movq	%rcx, 1624(%rax)
	movq	480(%rbx), %rcx
	movq	%rcx, 1632(%rax)
	movq	488(%rbx), %rcx
	movq	%rcx, 1640(%rax)
	movq	496(%rbx), %rcx
	movq	%rcx, 1648(%rax)
	movq	504(%rbx), %rcx
	movq	%rcx, 1656(%rax)
	movq	512(%rbx), %rcx
	movq	%rcx, 1664(%rax)
	movq	520(%rbx), %rcx
	movq	%rcx, 1672(%rax)
	movq	528(%rbx), %rcx
	movq	%rcx, 1680(%rax)
	movq	536(%rbx), %rcx
	movq	%rcx, 1688(%rax)
	movq	544(%rbx), %rcx
	movq	%rcx, 1696(%rax)
	movq	552(%rbx), %rcx
	movq	%rcx, 1704(%rax)
	movq	560(%rbx), %rcx
	movq	%rcx, 1712(%rax)
	movq	568(%rbx), %rcx
	movq	%rcx, 1720(%rax)
	movq	576(%rbx), %rcx
	movq	%rcx, 1728(%rax)
	movq	584(%rbx), %rcx
	movq	%rcx, 1736(%rax)
	movq	592(%rbx), %rcx
	movq	%rcx, 1744(%rax)
	movq	600(%rbx), %rcx
	movq	%rcx, 1752(%rax)
	movq	608(%rbx), %rcx
	movq	%rcx, 1760(%rax)
	movq	616(%rbx), %rcx
	movq	%rcx, 1768(%rax)
	movq	624(%rbx), %rcx
	movq	%rcx, 1776(%rax)
	movq	632(%rbx), %rcx
	movq	%rcx, 1784(%rax)
	movq	640(%rbx), %rcx
	movq	%rcx, 1792(%rax)
	movq	648(%rbx), %rcx
	movq	%rcx, 1800(%rax)
	movq	656(%rbx), %rcx
	movq	%rcx, 1808(%rax)
	movq	664(%rbx), %rcx
	movq	%rcx, 1816(%rax)
	movq	672(%rbx), %rcx
	movq	%rcx, 1824(%rax)
	movq	680(%rbx), %rcx
	movq	%rcx, 1832(%rax)
	movq	688(%rbx), %rcx
	movq	%rcx, 1840(%rax)
	movq	696(%rbx), %rcx
	movq	%rcx, 1848(%rax)
	movq	704(%rbx), %rcx
	movq	%rcx, 1856(%rax)
	movq	712(%rbx), %rcx
	movq	%rcx, 1864(%rax)
	movq	720(%rbx), %rcx
	movq	%rcx, 1872(%rax)
	movq	728(%rbx), %rcx
	movq	%rcx, 1880(%rax)
	movq	736(%rbx), %rcx
	movq	%rcx, 1888(%rax)
	movq	744(%rbx), %rcx
	movq	%rcx, 1896(%rax)
	movq	752(%rbx), %rcx
	movq	%rcx, 1904(%rax)
	movq	760(%rbx), %rcx
	movq	%rcx, 1912(%rax)
	movq	768(%rbx), %rcx
	movq	%rcx, 1920(%rax)
	movq	776(%rbx), %rcx
	movq	%rcx, 1928(%rax)
	movq	784(%rbx), %rcx
	movq	%rcx, 1936(%rax)
	movq	792(%rbx), %rcx
	movq	%rcx, 1944(%rax)
	movq	800(%rbx), %rcx
	movq	%rcx, 1952(%rax)
	movq	808(%rbx), %rcx
	movq	%rcx, 1960(%rax)
	movq	816(%rbx), %rcx
	movq	%rcx, 1968(%rax)
	movq	824(%rbx), %rcx
	movq	%rcx, 1976(%rax)
	movq	832(%rbx), %rcx
	movq	%rcx, 1984(%rax)
	movq	840(%rbx), %rcx
	movq	%rcx, 1992(%rax)
	movq	848(%rbx), %rcx
	movq	%rcx, 2000(%rax)
	movq	856(%rbx), %rcx
	movq	%rcx, 2008(%rax)
	movq	864(%rbx), %rcx
	movq	%rcx, 2016(%rax)
	movq	872(%rbx), %rcx
	movq	%rcx, 2024(%rax)
	movq	880(%rbx), %rcx
	movq	%rcx, 2032(%rax)
	movq	888(%rbx), %rcx
	movq	%rcx, 2040(%rax)
	movq	896(%rbx), %rcx
	movq	%rcx, 2048(%rax)
	movq	904(%rbx), %rcx
	movq	%rcx, 2056(%rax)
	movq	912(%rbx), %rcx
	movq	%rcx, 2064(%rax)
	movq	920(%rbx), %rcx
	movq	%rcx, 2072(%rax)
	movq	928(%rbx), %rcx
	movq	%rcx, 2080(%rax)
	movq	936(%rbx), %rcx
	movq	%rcx, 2088(%rax)
	movq	944(%rbx), %rcx
	movq	%rcx, 2096(%rax)
	movq	952(%rbx), %rcx
	movq	%rcx, 2104(%rax)
	movq	960(%rbx), %rcx
	movq	%rcx, 2112(%rax)
	movq	968(%rbx), %rcx
	movq	%rcx, 2120(%rax)
	movq	976(%rbx), %rcx
	movq	%rcx, 2128(%rax)
	movq	984(%rbx), %rcx
	movq	%rcx, 2136(%rax)
	movq	992(%rbx), %rcx
	movq	%rcx, 2144(%rax)
	movq	1000(%rbx), %rcx
	movq	%rcx, 2152(%rax)
	movq	1008(%rbx), %rcx
	movq	%rcx, 2160(%rax)
	movq	1016(%rbx), %rcx
	movq	%rcx, 2168(%rax)
	movq	1024(%rbx), %rcx
	movq	%rcx, 2176(%rax)
	movq	1032(%rbx), %rcx
	movq	%rcx, 2184(%rax)
	movq	1040(%rbx), %rcx
	movq	%rcx, 2192(%rax)
	movq	1048(%rbx), %rcx
	movq	%rcx, 2200(%rax)
	movq	1056(%rbx), %rcx
	movq	%rcx, 2208(%rax)
	movq	1064(%rbx), %rcx
	movq	%rcx, 2216(%rax)
	movq	1072(%rbx), %rcx
	movq	%rcx, 2224(%rax)
	movq	1080(%rbx), %rcx
	movq	%rcx, 2232(%rax)
	movq	1088(%rbx), %rcx
	movq	%rcx, 2240(%rax)
	movq	1096(%rbx), %rcx
	movq	%rcx, 2248(%rax)
	movq	1104(%rbx), %rcx
	movq	%rcx, 2256(%rax)
	movq	1112(%rbx), %rcx
	movq	%rcx, 2264(%rax)
	movq	1120(%rbx), %rcx
	movq	%rcx, 2272(%rax)
	movq	1128(%rbx), %rcx
	movq	%rcx, 2280(%rax)
	movq	1136(%rbx), %rcx
	movq	%rcx, 2288(%rax)
	movq	1144(%rbx), %rcx
	movq	%rcx, 2296(%rax)
	movq	1152(%rbx), %rcx
	movq	%rcx, 2304(%rax)
	movq	1160(%rbx), %rcx
	movq	%rcx, 2312(%rax)
	movq	1168(%rbx), %rcx
	movq	%rcx, 2320(%rax)
	movq	1176(%rbx), %rcx
	movq	%rcx, 2328(%rax)
	movq	%rax, (%rsp)
	leaq	56(%rsp), %rsi
	leaq	-232(%rsp), %rsp
	call	L_sha3_256A_A1184$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$1:
	leaq	232(%rsp), %rsp
	movq	(%rsp), %rdx
	movq	56(%rsp), %rcx
	movq	%rcx, 2336(%rdx)
	movq	64(%rsp), %rcx
	movq	%rcx, 2344(%rdx)
	movq	72(%rsp), %rcx
	movq	%rcx, 2352(%rdx)
	movq	80(%rsp), %rcx
	movq	%rcx, 2360(%rdx)
	movq	%mm0, %rax
	leaq	32(%rax), %rax
	movq	(%rax), %rcx
	movq	%rcx, 2368(%rdx)
	movq	8(%rax), %rcx
	movq	%rcx, 2376(%rdx)
	movq	16(%rax), %rcx
	movq	%rcx, 2384(%rdx)
	movq	24(%rax), %rcx
	movq	%rcx, 2392(%rdx)
	xorl	%eax, %eax
	movq	10328(%rsp), %rbx
	movq	10336(%rsp), %rbp
	movq	10344(%rsp), %r12
	movq	10352(%rsp), %r13
	movq	10360(%rsp), %r14
	movq	10368(%rsp), %r15
	movq	10376(%rsp), %rsp
	ret
L_i_poly_decompress$1:
	movq	$0, %rsi
	jmp 	L_i_poly_decompress$2
L_i_poly_decompress$3:
	movb	(%rdx,%rsi), %r9b
	movzbw	%r9b, %r8w
	movzbw	%r9b, %di
	andw	$15, %r8w
	shrw	$4, %di
	imulw	$3329, %r8w, %r8w
	imulw	$3329, %di, %di
	addw	$8, %r8w
	addw	$8, %di
	shrw	$4, %r8w
	shrw	$4, %di
	movw	%r8w, (%rcx,%rsi,4)
	movw	%di, 2(%rcx,%rsi,4)
	incq	%rsi
L_i_poly_decompress$2:
	cmpq	$128, %rsi
	jb  	L_i_poly_decompress$3
	ret
L_i_poly_compress$1:
	call	L_poly_csubq$1
L_i_poly_compress$4:
	movq	$0, %rax
	jmp 	L_i_poly_compress$2
L_i_poly_compress$3:
	movzwl	(%rcx,%rax,4), %r8d
	movzwl	2(%rcx,%rax,4), %edi
	shll	$4, %r8d
	addl	$1665, %r8d
	imull	$80635, %r8d, %r8d
	shrl	$28, %r8d
	andl	$15, %r8d
	shll	$4, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$15, %edi
	shll	$4, %edi
	orl 	%edi, %r8d
	movb	%r8b, (%r10,%rax)
	incq	%rax
L_i_poly_compress$2:
	cmpq	$128, %rax
	jb  	L_i_poly_compress$3
	ret
L_i_poly_tomsg$1:
	call	L_poly_csubq$1
L_i_poly_tomsg$2:
	movb	$0, %dl
	movw	(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	2(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	4(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	6(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	8(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	10(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	12(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	14(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, (%r10)
	movb	$0, %dl
	movw	16(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	18(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	20(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	22(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	24(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	26(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	28(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	30(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 1(%r10)
	movb	$0, %dl
	movw	32(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	34(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	36(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	38(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	40(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	42(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	44(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	46(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 2(%r10)
	movb	$0, %dl
	movw	48(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	50(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	52(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	54(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	56(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	58(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	60(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	62(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 3(%r10)
	movb	$0, %dl
	movw	64(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	66(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	68(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	70(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	72(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	74(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	76(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	78(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 4(%r10)
	movb	$0, %dl
	movw	80(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	82(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	84(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	86(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	88(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	90(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	92(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	94(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 5(%r10)
	movb	$0, %dl
	movw	96(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	98(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	100(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	102(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	104(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	106(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	108(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	110(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 6(%r10)
	movb	$0, %dl
	movw	112(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	114(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	116(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	118(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	120(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	122(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	124(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	126(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 7(%r10)
	movb	$0, %dl
	movw	128(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	130(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	132(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	134(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	136(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	138(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	140(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	142(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 8(%r10)
	movb	$0, %dl
	movw	144(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	146(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	148(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	150(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	152(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	154(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	156(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	158(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 9(%r10)
	movb	$0, %dl
	movw	160(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	162(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	164(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	166(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	168(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	170(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	172(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	174(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 10(%r10)
	movb	$0, %dl
	movw	176(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	178(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	180(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	182(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	184(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	186(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	188(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	190(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 11(%r10)
	movb	$0, %dl
	movw	192(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	194(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	196(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	198(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	200(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	202(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	204(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	206(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 12(%r10)
	movb	$0, %dl
	movw	208(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	210(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	212(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	214(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	216(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	218(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	220(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	222(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 13(%r10)
	movb	$0, %dl
	movw	224(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	226(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	228(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	230(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	232(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	234(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	236(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	238(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 14(%r10)
	movb	$0, %dl
	movw	240(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	242(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	244(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	246(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	248(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	250(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	252(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	254(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 15(%r10)
	movb	$0, %dl
	movw	256(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	258(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	260(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	262(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	264(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	266(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	268(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	270(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 16(%r10)
	movb	$0, %dl
	movw	272(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	274(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	276(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	278(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	280(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	282(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	284(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	286(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 17(%r10)
	movb	$0, %dl
	movw	288(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	290(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	292(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	294(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	296(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	298(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	300(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	302(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 18(%r10)
	movb	$0, %dl
	movw	304(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	306(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	308(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	310(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	312(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	314(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	316(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	318(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 19(%r10)
	movb	$0, %dl
	movw	320(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	322(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	324(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	326(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	328(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	330(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	332(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	334(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 20(%r10)
	movb	$0, %dl
	movw	336(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	338(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	340(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	342(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	344(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	346(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	348(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	350(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 21(%r10)
	movb	$0, %dl
	movw	352(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	354(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	356(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	358(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	360(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	362(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	364(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	366(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 22(%r10)
	movb	$0, %dl
	movw	368(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	370(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	372(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	374(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	376(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	378(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	380(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	382(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 23(%r10)
	movb	$0, %dl
	movw	384(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	386(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	388(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	390(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	392(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	394(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	396(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	398(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 24(%r10)
	movb	$0, %dl
	movw	400(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	402(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	404(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	406(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	408(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	410(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	412(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	414(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 25(%r10)
	movb	$0, %dl
	movw	416(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	418(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	420(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	422(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	424(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	426(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	428(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	430(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 26(%r10)
	movb	$0, %dl
	movw	432(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	434(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	436(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	438(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	440(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	442(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	444(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	446(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 27(%r10)
	movb	$0, %dl
	movw	448(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	450(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	452(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	454(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	456(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	458(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	460(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	462(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 28(%r10)
	movb	$0, %dl
	movw	464(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	466(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	468(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	470(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	472(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	474(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	476(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	478(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 29(%r10)
	movb	$0, %dl
	movw	480(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	482(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	484(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	486(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	488(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	490(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	492(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	494(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 30(%r10)
	movb	$0, %dl
	movw	496(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$0, %r13d
	orb 	%r13b, %dl
	movw	498(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$1, %r13d
	orb 	%r13b, %dl
	movw	500(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$2, %r13d
	orb 	%r13b, %dl
	movw	502(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$3, %r13d
	orb 	%r13b, %dl
	movw	504(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$4, %r13d
	orb 	%r13b, %dl
	movw	506(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$5, %r13d
	orb 	%r13b, %dl
	movw	508(%rcx), %r9w
	movzwl	%r9w, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$6, %r13d
	orb 	%r13b, %dl
	movw	510(%rcx), %cx
	movzwl	%cx, %r13d
	shll	$1, %r13d
	addl	$1665, %r13d
	imull	$80635, %r13d, %r13d
	shrl	$28, %r13d
	andl	$1, %r13d
	shll	$7, %r13d
	orb 	%r13b, %dl
	movb	%dl, 31(%r10)
	ret
L_poly_tobytes$1:
	call	L_poly_csubq$1
L_poly_tobytes$4:
	movq	$0, %r8
	movq	$0, %rsi
	jmp 	L_poly_tobytes$2
L_poly_tobytes$3:
	movw	(%rcx,%rsi,2), %dx
	movw	2(%rcx,%rsi,2), %di
	movw	%dx, %r13w
	andw	$255, %r13w
	movb	%r13b, (%r10,%r8)
	incq	%r8
	shrw	$8, %dx
	andw	$15, %dx
	movw	%di, %r13w
	andw	$15, %r13w
	shlw	$4, %r13w
	orw 	%dx, %r13w
	movb	%r13b, (%r10,%r8)
	incq	%r8
	shrw	$4, %di
	movb	%dil, (%r10,%r8)
	incq	%r8
	addq	$2, %rsi
L_poly_tobytes$2:
	cmpq	$256, %rsi
	jb  	L_poly_tobytes$3
	ret
L_poly_sub$1:
	movq	$0, %rdi
	jmp 	L_poly_sub$2
L_poly_sub$3:
	movw	(%rdx,%rdi,2), %bx
	movw	(%rsi,%rdi,2), %r8w
	subw	%r8w, %bx
	movw	%bx, (%rcx,%rdi,2)
	incq	%rdi
L_poly_sub$2:
	cmpq	$256, %rdi
	jb  	L_poly_sub$3
	ret
L_poly_ntt$1:
	leaq	glob_data + 448(%rip), %rdx
	movq	$0, %rsi
	movq	$128, %rdi
	jmp 	L_poly_ntt$4
L_poly_ntt$5:
	movq	$0, %r9
	jmp 	L_poly_ntt$6
L_poly_ntt$7:
	incq	%rsi
	movw	(%rdx,%rsi,2), %bp
	movq	%r9, %r8
	addq	%rdi, %r9
	jmp 	L_poly_ntt$8
L_poly_ntt$9:
	movw	(%rcx,%r8,2), %r11w
	movw	%r11w, %bx
	movq	%r8, %r12
	addq	%rdi, %r12
	movw	(%rcx,%r12,2), %r13w
	movswl	%r13w, %r13d
	movswl	%bp, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %r15d
	addl	%r13d, %r15d
	sarl	$16, %r15d
	subw	%r15w, %bx
	addw	%r11w, %r15w
	movw	%bx, (%rcx,%r12,2)
	movw	%r15w, (%rcx,%r8,2)
	incq	%r8
L_poly_ntt$8:
	cmpq	%r9, %r8
	jb  	L_poly_ntt$9
	movq	%r8, %r9
	addq	%rdi, %r9
L_poly_ntt$6:
	cmpq	$256, %r9
	jb  	L_poly_ntt$7
	shrq	$1, %rdi
L_poly_ntt$4:
	cmpq	$2, %rdi
	jnb 	L_poly_ntt$5
	movq	$0, %r8
	jmp 	L_poly_ntt$2
L_poly_ntt$3:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %dx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
L_poly_ntt$2:
	cmpq	$256, %r8
	jb  	L_poly_ntt$3
	ret
L_poly_invntt$1:
	leaq	glob_data + 192(%rip), %rdx
	movq	$0, %rsi
	movq	$2, %rdi
	jmp 	L_poly_invntt$4
L_poly_invntt$5:
	movq	$0, %r11
	jmp 	L_poly_invntt$6
L_poly_invntt$7:
	movw	(%rdx,%rsi,2), %r8w
	incq	%rsi
	movq	%r11, %r9
	addq	%rdi, %r11
	jmp 	L_poly_invntt$8
L_poly_invntt$9:
	movw	(%rcx,%r9,2), %bx
	movq	%r9, %r12
	addq	%rdi, %r12
	movw	(%rcx,%r12,2), %bp
	movw	%bp, %r13w
	addw	%bx, %r13w
	movswl	%r13w, %r15d
	imull	$20159, %r15d, %r15d
	sarl	$26, %r15d
	imull	$3329, %r15d, %r15d
	subw	%r15w, %r13w
	movw	%r13w, (%rcx,%r9,2)
	subw	%bp, %bx
	movswl	%bx, %r13d
	movswl	%r8w, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %ebx
	addl	%r13d, %ebx
	sarl	$16, %ebx
	movw	%bx, (%rcx,%r12,2)
	incq	%r9
L_poly_invntt$8:
	cmpq	%r11, %r9
	jb  	L_poly_invntt$9
	movq	%r9, %r11
	addq	%rdi, %r11
L_poly_invntt$6:
	cmpq	$256, %r11
	jb  	L_poly_invntt$7
	shlq	$1, %rdi
L_poly_invntt$4:
	cmpq	$128, %rdi
	jbe 	L_poly_invntt$5
	movw	254(%rdx), %di
	movq	$0, %r8
	jmp 	L_poly_invntt$2
L_poly_invntt$3:
	movw	(%rcx,%r8,2), %dx
	movswl	%dx, %r13d
	movswl	%di, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %edx
	addl	%r13d, %edx
	sarl	$16, %edx
	movw	%dx, (%rcx,%r8,2)
	incq	%r8
L_poly_invntt$2:
	cmpq	$256, %r8
	jb  	L_poly_invntt$3
	ret
L_poly_getnoise$1:
	movq	%r10, 8(%rsp)
	movq	%rax, %rdx
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
	movb	%cl, 48(%rsp)
	leaq	56(%rsp), %rsi
	leaq	16(%rsp), %rbx
	leaq	-224(%rsp), %rsp
	call	L_shake256_128_33$1
L_poly_getnoise$4:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	$0, %rsi
	jmp 	L_poly_getnoise$2
L_poly_getnoise$3:
	movb	56(%rsp,%rsi), %dil
	movb	%dil, %dl
	andb	$85, %dl
	shrb	$1, %dil
	andb	$85, %dil
	addb	%dl, %dil
	movb	%dil, %dl
	andb	$3, %dl
	movb	%dil, %r8b
	shrb	$2, %r8b
	andb	$3, %r8b
	subb	%r8b, %dl
	movsbw	%dl, %dx
	movw	%dx, (%rcx,%rsi,4)
	movb	%dil, %dl
	shrb	$4, %dl
	andb	$3, %dl
	shrb	$6, %dil
	andb	$3, %dil
	subb	%dil, %dl
	movsbw	%dl, %dx
	movw	%dx, 2(%rcx,%rsi,4)
	incq	%rsi
L_poly_getnoise$2:
	cmpq	$128, %rsi
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
	movw	$1353, %di
	movq	$0, %rsi
	jmp 	L_poly_frommont$2
L_poly_frommont$3:
	movw	(%rax,%rsi,2), %cx
	movswl	%cx, %r13d
	movswl	%di, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %ecx
	addl	%r13d, %ecx
	sarl	$16, %ecx
	movw	%cx, (%rax,%rsi,2)
	incq	%rsi
L_poly_frommont$2:
	cmpq	$256, %rsi
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
	movq	%rsi, 8(%rsp)
	movq	$0, %rsi
	jmp 	L_poly_basemul$2
L_poly_basemul$3:
	leaq	glob_data + 576(%rip), %rdi
	movq	%rsi, %r8
	shrq	$2, %r8
	movw	(%rdi,%r8,2), %bp
	movw	(%rdx,%rsi,2), %bx
	movw	(%rcx,%rsi,2), %di
	incq	%rsi
	movw	(%rdx,%rsi,2), %r12w
	movw	(%rcx,%rsi,2), %r8w
	decq	%rsi
	movswl	%r12w, %r13d
	movswl	%r8w, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %r9d
	addl	%r13d, %r9d
	sarl	$16, %r9d
	movswl	%r9w, %r13d
	movswl	%bp, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %r9d
	addl	%r13d, %r9d
	sarl	$16, %r9d
	movswl	%bx, %r13d
	movswl	%di, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %r15d
	addl	%r13d, %r15d
	sarl	$16, %r15d
	addw	%r15w, %r9w
	movswl	%bx, %r13d
	movswl	%r8w, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %ebx
	addl	%r13d, %ebx
	sarl	$16, %ebx
	movw	%bx, %r8w
	movswl	%r12w, %r13d
	movswl	%di, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %ebx
	addl	%r13d, %ebx
	sarl	$16, %ebx
	addw	%bx, %r8w
	movq	8(%rsp), %rdi
	movw	%r9w, (%rdi,%rsi,2)
	incq	%rsi
	movw	%r8w, (%rdi,%rsi,2)
	movq	%rdi, 16(%rsp)
	negw	%bp
	incq	%rsi
	movw	(%rdx,%rsi,2), %bx
	movw	(%rcx,%rsi,2), %di
	incq	%rsi
	movw	(%rdx,%rsi,2), %r12w
	movw	(%rcx,%rsi,2), %r8w
	decq	%rsi
	movswl	%r12w, %r13d
	movswl	%r8w, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %r9d
	addl	%r13d, %r9d
	sarl	$16, %r9d
	movswl	%r9w, %r13d
	movswl	%bp, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %r9d
	addl	%r13d, %r9d
	sarl	$16, %r9d
	movswl	%bx, %r13d
	movswl	%di, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %r15d
	addl	%r13d, %r15d
	sarl	$16, %r15d
	addw	%r15w, %r9w
	movswl	%bx, %r13d
	movswl	%r8w, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %ebx
	addl	%r13d, %ebx
	sarl	$16, %ebx
	movswl	%r12w, %r13d
	movswl	%di, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %r15d
	addl	%r13d, %r15d
	sarl	$16, %r15d
	addw	%r15w, %bx
	movq	16(%rsp), %rdi
	movw	%r9w, (%rdi,%rsi,2)
	incq	%rsi
	movw	%bx, (%rdi,%rsi,2)
	incq	%rsi
L_poly_basemul$2:
	cmpq	$253, %rsi
	jb  	L_poly_basemul$3
	ret
L_poly_csubq$1:
	movq	$0, %rsi
	jmp 	L_poly_csubq$2
L_poly_csubq$3:
	movw	(%rcx,%rsi,2), %r9w
	addw	$-3329, %r9w
	movw	%r9w, %bp
	sarw	$15, %bp
	andw	$3329, %bp
	addw	%bp, %r9w
	movw	%r9w, (%rcx,%rsi,2)
	incq	%rsi
L_poly_csubq$2:
	cmpq	$256, %rsi
	jb  	L_poly_csubq$3
	ret
L_poly_add2$1:
	movq	$0, %rdi
	jmp 	L_poly_add2$2
L_poly_add2$3:
	movw	(%rcx,%rdi,2), %dx
	movw	(%rsi,%rdi,2), %r8w
	addw	%r8w, %dx
	movw	%dx, (%rcx,%rdi,2)
	incq	%rdi
L_poly_add2$2:
	cmpq	$256, %rdi
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
	movq	$0, %rcx
	movq	$0, %rax
	jmp 	L_sha3_512A_A64$10
L_sha3_512A_A64$11:
	movq	(%rbx,%rcx), %rsi
	addq	$8, %rcx
	xorq	%rsi, (%rdx,%rax,8)
	incq	%rax
L_sha3_512A_A64$10:
	cmpq	$8, %rax
	jb  	L_sha3_512A_A64$11
	movq	$0, %rsi
	movq	$6, %rcx
	orq 	%rcx, %rsi
	xorq	%rsi, (%rdx,%rax,8)
	xorb	$128, 71(%rdx)
	movq	8(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rsi
	jmp 	L_sha3_512A_A64$5
L_sha3_512A_A64$6:
	movq	%rax, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%rsi, 24(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A64$9:
	leaq	208(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	$0, %rsi
	jmp 	L_sha3_512A_A64$7
L_sha3_512A_A64$8:
	movq	(%rdx,%rsi,8), %r9
	movq	%r9, (%rax,%rcx)
	addq	$8, %rcx
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
	movq	%rcx, 16(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A64$4:
	leaq	208(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	$0, %rsi
	jmp 	L_sha3_512A_A64$2
L_sha3_512A_A64$3:
	movq	(%rdx,%rsi,8), %r9
	movq	%r9, (%rax,%rcx)
	addq	$8, %rcx
	incq	%rsi
L_sha3_512A_A64$2:
	cmpq	$8, %rsi
	jb  	L_sha3_512A_A64$3
	ret
L_sha3_256A_A1184$1:
	movq	%rsi, 8(%rsp)
	leaq	40(%rsp), %rdx
	movq	$0, %rax
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1184$20
L_sha3_256A_A1184$21:
	movq	%rax, (%rdx,%rsi,8)
	incq	%rsi
L_sha3_256A_A1184$20:
	cmpq	$25, %rsi
	jb  	L_sha3_256A_A1184$21
	movq	$0, %rcx
	movq	$0, %rax
	jmp 	L_sha3_256A_A1184$18
L_sha3_256A_A1184$19:
	movq	(%rbx,%rcx), %rsi
	addq	$8, %rcx
	xorq	%rsi, (%rdx,%rax,8)
	incq	%rax
L_sha3_256A_A1184$18:
	cmpq	$17, %rax
	jb  	L_sha3_256A_A1184$19
	movq	%rbx, 16(%rsp)
	movq	%rcx, 24(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1184$17:
	leaq	208(%rsp), %rsp
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	movq	$0, %r8
	jmp 	L_sha3_256A_A1184$12
L_sha3_256A_A1184$13:
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1184$15
L_sha3_256A_A1184$16:
	movq	(%rax,%rcx), %rdi
	addq	$8, %rcx
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_sha3_256A_A1184$15:
	cmpq	$17, %rsi
	jb  	L_sha3_256A_A1184$16
	movq	%rax, 24(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%r8, 32(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1184$14:
	leaq	208(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	32(%rsp), %r8
	incq	%r8
L_sha3_256A_A1184$12:
	cmpq	$7, %r8
	jb  	L_sha3_256A_A1184$13
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1184$10
L_sha3_256A_A1184$11:
	movq	(%rax,%rcx), %rdi
	addq	$8, %rcx
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_sha3_256A_A1184$10:
	cmpq	$12, %rsi
	jb  	L_sha3_256A_A1184$11
	movq	$0, %rdi
	movq	$6, %rcx
	orq 	%rcx, %rdi
	xorq	%rdi, (%rdx,%rsi,8)
	xorb	$128, 135(%rdx)
	movq	8(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1184$5
L_sha3_256A_A1184$6:
	movq	%rax, 8(%rsp)
	movq	%rcx, 32(%rsp)
	movq	%rsi, 16(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1184$9:
	leaq	208(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	32(%rsp), %rcx
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1184$7
L_sha3_256A_A1184$8:
	movq	(%rdx,%rsi,8), %r9
	movq	%r9, (%rax,%rcx)
	addq	$8, %rcx
	incq	%rsi
L_sha3_256A_A1184$7:
	cmpq	$17, %rsi
	jb  	L_sha3_256A_A1184$8
	movq	16(%rsp), %rsi
	incq	%rsi
L_sha3_256A_A1184$5:
	cmpq	$0, %rsi
	jb  	L_sha3_256A_A1184$6
	movq	%rax, 16(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1184$4:
	leaq	208(%rsp), %rsp
	movq	16(%rsp), %rsi
	movq	32(%rsp), %rcx
	movq	$0, %rax
	jmp 	L_sha3_256A_A1184$2
L_sha3_256A_A1184$3:
	movq	(%rdx,%rax,8), %r9
	movq	%r9, (%rsi,%rcx)
	addq	$8, %rcx
	incq	%rax
L_sha3_256A_A1184$2:
	cmpq	$4, %rax
	jb  	L_sha3_256A_A1184$3
	ret
L_shake128_squeezeblock$1:
	movq	%rsi, 8(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake128_squeezeblock$4:
	leaq	208(%rsp), %rsp
	movq	8(%rsp), %rsi
	movq	$0, %rcx
	movq	$0, %rax
	jmp 	L_shake128_squeezeblock$2
L_shake128_squeezeblock$3:
	movq	(%rdx,%rax,8), %r9
	movq	%r9, (%rsi,%rcx)
	addq	$8, %rcx
	incq	%rax
L_shake128_squeezeblock$2:
	cmpq	$21, %rax
	jb  	L_shake128_squeezeblock$3
	ret
L_shake128_absorb34$1:
	movq	$0, %rax
	movq	$0, %rsi
	jmp 	L_shake128_absorb34$4
L_shake128_absorb34$5:
	movq	%rax, (%rdx,%rsi,8)
	incq	%rsi
L_shake128_absorb34$4:
	cmpq	$25, %rsi
	jb  	L_shake128_absorb34$5
	movq	$0, %rcx
	movq	$0, %rax
	jmp 	L_shake128_absorb34$2
L_shake128_absorb34$3:
	movq	(%rbx,%rcx), %rsi
	addq	$8, %rcx
	xorq	%rsi, (%rdx,%rax,8)
	incq	%rax
L_shake128_absorb34$2:
	cmpq	$4, %rax
	jb  	L_shake128_absorb34$3
	movq	$0, %rsi
	movzwq	(%rbx,%rcx), %rcx
	orq 	%rcx, %rsi
	movq	$31, %rcx
	shlq	$16, %rcx
	orq 	%rcx, %rsi
	xorq	%rsi, (%rdx,%rax,8)
	xorb	$128, 167(%rdx)
	ret
L_sha3_512A_A33$1:
	leaq	32(%rsp), %rdx
	movq	$0, %rax
	movq	$0, %rdi
	jmp 	L_sha3_512A_A33$12
L_sha3_512A_A33$13:
	movq	%rax, (%rdx,%rdi,8)
	incq	%rdi
L_sha3_512A_A33$12:
	cmpq	$25, %rdi
	jb  	L_sha3_512A_A33$13
	movq	%rsi, 8(%rsp)
	movq	$0, %rcx
	movq	$0, %rax
	jmp 	L_sha3_512A_A33$10
L_sha3_512A_A33$11:
	movq	(%rbx,%rcx), %rsi
	addq	$8, %rcx
	xorq	%rsi, (%rdx,%rax,8)
	incq	%rax
L_sha3_512A_A33$10:
	cmpq	$4, %rax
	jb  	L_sha3_512A_A33$11
	movq	$0, %rsi
	movzbq	(%rbx,%rcx), %rcx
	orq 	$1536, %rcx
	orq 	%rcx, %rsi
	xorq	%rsi, (%rdx,%rax,8)
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
	movq	16(%rsp), %rcx
	movq	$0, %rax
	jmp 	L_sha3_512A_A33$2
L_sha3_512A_A33$3:
	movq	(%rdx,%rax,8), %r9
	movq	%r9, (%rsi,%rcx)
	addq	$8, %rcx
	incq	%rax
L_sha3_512A_A33$2:
	cmpq	$8, %rax
	jb  	L_sha3_512A_A33$3
	ret
L_shake256_A32__A1120$1:
	leaq	40(%rsp), %rdx
	movq	$0, %r8
	movq	$0, %r9
	jmp 	L_shake256_A32__A1120$22
L_shake256_A32__A1120$23:
	movq	%r8, (%rdx,%r9,8)
	incq	%r9
L_shake256_A32__A1120$22:
	cmpq	$25, %r9
	jb  	L_shake256_A32__A1120$23
	movq	%rsi, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	$0, %rcx
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1120$20
L_shake256_A32__A1120$21:
	movq	(%rdi,%rcx), %r8
	addq	$8, %rcx
	xorq	%r8, (%rdx,%rsi,8)
	incq	%rsi
L_shake256_A32__A1120$20:
	cmpq	$4, %rsi
	jb  	L_shake256_A32__A1120$21
	movq	16(%rsp), %rcx
	movq	$0, %r12
	movq	(%rcx,%r12), %rsi
	xorq	%rsi, 32(%rdx)
	addq	$8, %r12
	movq	$5, %rsi
	jmp 	L_shake256_A32__A1120$18
L_shake256_A32__A1120$19:
	movq	(%rcx,%r12), %rdi
	addq	$8, %r12
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_shake256_A32__A1120$18:
	cmpq	$17, %rsi
	jb  	L_shake256_A32__A1120$19
	movq	%rcx, 16(%rsp)
	movq	%r12, 24(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1120$17:
	leaq	208(%rsp), %rsp
	movq	16(%rsp), %rcx
	movq	24(%rsp), %r12
	movq	$0, %r8
	jmp 	L_shake256_A32__A1120$12
L_shake256_A32__A1120$13:
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1120$15
L_shake256_A32__A1120$16:
	movq	(%rcx,%r12), %rdi
	addq	$8, %r12
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_shake256_A32__A1120$15:
	cmpq	$17, %rsi
	jb  	L_shake256_A32__A1120$16
	movq	%rcx, 24(%rsp)
	movq	%r12, 16(%rsp)
	movq	%r8, 32(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1120$14:
	leaq	208(%rsp), %rsp
	movq	24(%rsp), %rcx
	movq	16(%rsp), %r12
	movq	32(%rsp), %r8
	incq	%r8
L_shake256_A32__A1120$12:
	cmpq	$7, %r8
	jb  	L_shake256_A32__A1120$13
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1120$10
L_shake256_A32__A1120$11:
	movq	(%rcx,%r12), %rdi
	addq	$8, %r12
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_shake256_A32__A1120$10:
	cmpq	$4, %rsi
	jb  	L_shake256_A32__A1120$11
	movq	$0, %rdi
	movq	$31, %rcx
	orq 	%rcx, %rdi
	xorq	%rdi, (%rdx,%rsi,8)
	xorb	$128, 135(%rdx)
	movq	8(%rsp), %rcx
	movq	$0, %r12
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1120$5
L_shake256_A32__A1120$6:
	movq	%rcx, 8(%rsp)
	movq	%r12, 32(%rsp)
	movq	%rsi, 16(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1120$9:
	leaq	208(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	32(%rsp), %r12
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1120$7
L_shake256_A32__A1120$8:
	movq	(%rdx,%rsi,8), %r9
	movq	%r9, (%rcx,%r12)
	addq	$8, %r12
	incq	%rsi
L_shake256_A32__A1120$7:
	cmpq	$17, %rsi
	jb  	L_shake256_A32__A1120$8
	movq	16(%rsp), %rsi
	incq	%rsi
L_shake256_A32__A1120$5:
	cmpq	$0, %rsi
	jb  	L_shake256_A32__A1120$6
	movq	%rcx, 16(%rsp)
	movq	%r12, 32(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1120$4:
	leaq	208(%rsp), %rsp
	movq	16(%rsp), %rsi
	movq	32(%rsp), %rcx
	movq	$0, %rdi
	jmp 	L_shake256_A32__A1120$2
L_shake256_A32__A1120$3:
	movq	(%rdx,%rdi,8), %r9
	movq	%r9, (%rsi,%rcx)
	addq	$8, %rcx
	incq	%rdi
L_shake256_A32__A1120$2:
	cmpq	$4, %rdi
	jb  	L_shake256_A32__A1120$3
	ret
L_shake256_128_33$1:
	leaq	32(%rsp), %rdx
	movq	$0, %r8
	movq	$0, %rdi
	jmp 	L_shake256_128_33$12
L_shake256_128_33$13:
	movq	%r8, (%rdx,%rdi,8)
	incq	%rdi
L_shake256_128_33$12:
	cmpq	$25, %rdi
	jb  	L_shake256_128_33$13
	movq	%rsi, 8(%rsp)
	movq	$0, %rcx
	movq	$0, %rsi
	jmp 	L_shake256_128_33$10
L_shake256_128_33$11:
	movq	(%rbx,%rcx), %rdi
	addq	$8, %rcx
	xorq	%rdi, (%rdx,%rsi,8)
	incq	%rsi
L_shake256_128_33$10:
	cmpq	$4, %rsi
	jb  	L_shake256_128_33$11
	movq	$0, %rdi
	movzbq	(%rbx,%rcx), %rcx
	orq 	$7936, %rcx
	orq 	%rcx, %rdi
	xorq	%rdi, (%rdx,%rsi,8)
	xorb	$128, 135(%rdx)
	movq	8(%rsp), %rcx
	movq	$0, %r12
	movq	$0, %rsi
	jmp 	L_shake256_128_33$5
L_shake256_128_33$6:
	movq	%rcx, 8(%rsp)
	movq	%r12, 16(%rsp)
	movq	%rsi, 24(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_128_33$9:
	leaq	208(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	16(%rsp), %r12
	movq	$0, %rsi
	jmp 	L_shake256_128_33$7
L_shake256_128_33$8:
	movq	(%rdx,%rsi,8), %r9
	movq	%r9, (%rcx,%r12)
	addq	$8, %r12
	incq	%rsi
L_shake256_128_33$7:
	cmpq	$17, %rsi
	jb  	L_shake256_128_33$8
	movq	24(%rsp), %rsi
	incq	%rsi
L_shake256_128_33$5:
	cmpq	$0, %rsi
	jb  	L_shake256_128_33$6
	movq	%rcx, 24(%rsp)
	movq	%r12, 16(%rsp)
	leaq	-208(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_128_33$4:
	leaq	208(%rsp), %rsp
	movq	24(%rsp), %rsi
	movq	16(%rsp), %rcx
	movq	$0, %rdi
	jmp 	L_shake256_128_33$2
L_shake256_128_33$3:
	movq	(%rdx,%rdi,8), %r9
	movq	%r9, (%rsi,%rcx)
	addq	$8, %rcx
	incq	%rdi
L_shake256_128_33$2:
	cmpq	$16, %rdi
	jb  	L_shake256_128_33$3
	ret
L_keccakf1600_ref$1:
	leaq	16(%rsp), %rcx
	movq	$0, %rsi
L_keccakf1600_ref$2:
	movq	%rsi, 8(%rsp)
	call	L_pround_ref$1
L_keccakf1600_ref$4:
	xchg	%rdx, %rcx
	leaq	glob_data + 0(%rip), %rdi
	movq	(%rdi,%rsi,8), %rdi
	xorq	%rdi, (%rdx)
	call	L_pround_ref$1
L_keccakf1600_ref$3:
	xchg	%rcx, %rdx
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
	movq	16(%rdx), %rbx
	movq	24(%rdx), %rbp
	movq	32(%rdx), %r12
	xorq	40(%rdx), %r11
	xorq	48(%rdx), %r10
	xorq	56(%rdx), %rbx
	xorq	64(%rdx), %rbp
	xorq	72(%rdx), %r12
	xorq	80(%rdx), %r11
	xorq	88(%rdx), %r10
	xorq	96(%rdx), %rbx
	xorq	104(%rdx), %rbp
	xorq	112(%rdx), %r12
	xorq	120(%rdx), %r11
	xorq	128(%rdx), %r10
	xorq	136(%rdx), %rbx
	xorq	144(%rdx), %rbp
	xorq	152(%rdx), %r12
	xorq	160(%rdx), %r11
	xorq	168(%rdx), %r10
	xorq	176(%rdx), %rbx
	xorq	184(%rdx), %rbp
	xorq	192(%rdx), %r12
	movq	%r10, %rdi
	rolq	$1, %rdi
	xorq	%r12, %rdi
	movq	%rbx, %r8
	rolq	$1, %r8
	xorq	%r11, %r8
	movq	%rbp, %r9
	rolq	$1, %r9
	xorq	%r10, %r9
	movq	%r12, %r10
	rolq	$1, %r10
	xorq	%rbx, %r10
	rolq	$1, %r11
	xorq	%rbp, %r11
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
	movq	%r15, (%rcx)
	andnq	%r13, %r12, %r15
	xorq	%rbp, %r15
	movq	%r15, 8(%rcx)
	andnq	%r14, %r13, %r15
	xorq	%r12, %r15
	movq	%r15, 16(%rcx)
	andnq	%rbx, %r14, %r15
	xorq	%r13, %r15
	movq	%r15, 24(%rcx)
	andnq	%rbp, %rbx, %rbx
	xorq	%r14, %rbx
	movq	%rbx, 32(%rcx)
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
	movq	%r15, 40(%rcx)
	andnq	%r13, %r12, %r15
	xorq	%rbp, %r15
	movq	%r15, 48(%rcx)
	andnq	%r14, %r13, %r15
	xorq	%r12, %r15
	movq	%r15, 56(%rcx)
	andnq	%rbx, %r14, %r15
	xorq	%r13, %r15
	movq	%r15, 64(%rcx)
	andnq	%rbp, %rbx, %rbx
	xorq	%r14, %rbx
	movq	%rbx, 72(%rcx)
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
	movq	%r15, 80(%rcx)
	andnq	%r13, %r12, %r15
	xorq	%rbp, %r15
	movq	%r15, 88(%rcx)
	andnq	%r14, %r13, %r15
	xorq	%r12, %r15
	movq	%r15, 96(%rcx)
	andnq	%rbx, %r14, %r15
	xorq	%r13, %r15
	movq	%r15, 104(%rcx)
	andnq	%rbp, %rbx, %rbx
	xorq	%r14, %rbx
	movq	%rbx, 112(%rcx)
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
	movq	%r15, 120(%rcx)
	andnq	%r13, %r12, %r15
	xorq	%rbp, %r15
	movq	%r15, 128(%rcx)
	andnq	%r14, %r13, %r15
	xorq	%r12, %r15
	movq	%r15, 136(%rcx)
	andnq	%rbx, %r14, %r15
	xorq	%r13, %r15
	movq	%r15, 144(%rcx)
	andnq	%rbp, %rbx, %rbx
	xorq	%r14, %rbx
	movq	%rbx, 152(%rcx)
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
	movq	%r9, 160(%rcx)
	andnq	%r13, %r12, %r9
	xorq	%rbp, %r9
	movq	%r9, 168(%rcx)
	andnq	%r14, %r13, %r9
	xorq	%r12, %r9
	movq	%r9, 176(%rcx)
	andnq	%rbx, %r14, %r9
	xorq	%r13, %r9
	movq	%r9, 184(%rcx)
	andnq	%rbp, %rbx, %r9
	xorq	%r14, %r9
	movq	%r9, 192(%rcx)
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
