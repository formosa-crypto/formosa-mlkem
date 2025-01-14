	.att_syntax
	.text
	.p2align	5
	.globl	_jade_kem_mlkem_mlkem768_amd64_ref_dec
	.globl	jade_kem_mlkem_mlkem768_amd64_ref_dec
	.globl	_jade_kem_mlkem_mlkem768_amd64_ref_enc
	.globl	jade_kem_mlkem_mlkem768_amd64_ref_enc
	.globl	_jade_kem_mlkem_mlkem768_amd64_ref_keypair
	.globl	jade_kem_mlkem_mlkem768_amd64_ref_keypair
	.globl	_jade_kem_mlkem_mlkem768_amd64_ref_enc_derand
	.globl	jade_kem_mlkem_mlkem768_amd64_ref_enc_derand
	.globl	_jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand
	.globl	jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand
_jade_kem_mlkem_mlkem768_amd64_ref_dec:
jade_kem_mlkem_mlkem768_amd64_ref_dec:
	movq	%rsp, %rax
	leaq	-14504(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 14456(%rsp)
	movq	%rbp, 14464(%rsp)
	movq	%r12, 14472(%rsp)
	movq	%r13, 14480(%rsp)
	movq	%r14, 14488(%rsp)
	movq	%rax, 14496(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm3
	movq	%rsi, %mm4
	leaq	72(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$251
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$252:
	movzbl	(%rsi,%rdi), %r10d
	incq	%rdi
	movzbl	(%rsi,%rdi), %r11d
	incq	%rdi
	movzbl	(%rsi,%rdi), %r8d
	incq	%rdi
	movzbl	(%rsi,%rdi), %r9d
	incq	%rdi
	movzbl	(%rsi,%rdi), %ebx
	incq	%rdi
	movl	%r11d, %ebp
	shrl	$2, %r11d
	andl	$3, %ebp
	shll	$8, %ebp
	orl 	%ebp, %r10d
	movl	%r8d, %ebp
	shrl	$4, %r8d
	andl	$15, %ebp
	shll	$6, %ebp
	orl 	%ebp, %r11d
	movl	%r9d, %ebp
	shrl	$6, %r9d
	andl	$63, %ebp
	shll	$4, %ebp
	orl 	%ebp, %r8d
	shll	$2, %ebx
	orl 	%ebx, %r9d
	imull	$3329, %r10d, %r10d
	addl	$512, %r10d
	shrl	$10, %r10d
	movw	%r10w, 2616(%rsp,%rcx,2)
	incq	%rcx
	imull	$3329, %r11d, %r10d
	addl	$512, %r10d
	shrl	$10, %r10d
	movw	%r10w, 2616(%rsp,%rcx,2)
	incq	%rcx
	imull	$3329, %r8d, %r8d
	addl	$512, %r8d
	shrl	$10, %r8d
	movw	%r8w, 2616(%rsp,%rcx,2)
	incq	%rcx
	imull	$3329, %r9d, %r8d
	addl	$512, %r8d
	shrl	$10, %r8d
	movw	%r8w, 2616(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$251:
	cmpq	$765, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$252
	addq	$960, %rsi
	leaq	568(%rsp), %rcx
	call	L_poly_decompress$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$250:
	movq	%rdx, %rsi
	leaq	4152(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$249:
	addq	$384, %rsi
	leaq	4664(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$248:
	addq	$384, %rsi
	leaq	5176(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$247:
	leaq	2616(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$246:
	leaq	3128(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$245:
	leaq	3640(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$244:
	leaq	1080(%rsp), %rdi
	leaq	4152(%rsp), %rcx
	leaq	2616(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$243:
	leaq	16(%rsp), %rsp
	leaq	1592(%rsp), %rdi
	leaq	4664(%rsp), %rcx
	leaq	3128(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$242:
	leaq	16(%rsp), %rsp
	leaq	1080(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$241:
	leaq	1592(%rsp), %rdi
	leaq	5176(%rsp), %rcx
	leaq	3640(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$240:
	leaq	16(%rsp), %rsp
	leaq	1080(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$239:
	leaq	1080(%rsp), %rcx
	movq	$0, %rsi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$237
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$238:
	movw	(%rcx,%rsi,2), %di
	movswl	%di, %r8d
	imull	$20159, %r8d, %r8d
	sarl	$26, %r8d
	imull	$3329, %r8d, %r8d
	subw	%r8w, %di
	movw	%di, (%rcx,%rsi,2)
	incq	%rsi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$237:
	cmpq	$256, %rsi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$238
	leaq	1080(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$236:
	leaq	1592(%rsp), %rcx
	leaq	568(%rsp), %rsi
	leaq	1080(%rsp), %rdi
	call	L_poly_sub$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$235:
	leaq	1592(%rsp), %rcx
	movq	$0, %rsi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$233
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$234:
	movw	(%rcx,%rsi,2), %di
	movswl	%di, %r8d
	imull	$20159, %r8d, %r8d
	sarl	$26, %r8d
	imull	$3329, %r8d, %r8d
	subw	%r8w, %di
	movw	%di, (%rcx,%rsi,2)
	incq	%rsi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$233:
	cmpq	$256, %rsi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$234
	leaq	1592(%rsp), %rcx
	call	L_i_poly_tomsg$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$232:
	movq	%rdx, %rax
	addq	$2336, %rax
	movq	(%rax), %rcx
	movq	%rcx, 104(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 112(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 120(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 128(%rsp)
	movq	%rdx, %mm5
	leaq	136(%rsp), %rax
	leaq	72(%rsp), %rcx
	leaq	-216(%rsp), %rsp
	call	L_sha3_512_64$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$231:
	leaq	216(%rsp), %rsp
	movq	%mm5, %rcx
	addq	$1152, %rcx
	leaq	13368(%rsp), %rdx
	leaq	72(%rsp), %rax
	leaq	168(%rsp), %rsi
	movq	%rsi, %mm0
	movq	%rdx, %mm6
	movq	%rcx, %rsi
	leaq	2616(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$230:
	addq	$384, %rsi
	leaq	3128(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$229:
	addq	$384, %rsi
	leaq	3640(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$228:
	movq	$0, %rdx
	addq	$1152, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$226
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$227:
	movq	(%rcx), %rsi
	movq	%rsi, (%rsp,%rdx,8)
	addq	$8, %rcx
	incq	%rdx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$226:
	cmpq	$4, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$227
	leaq	1592(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$225:
	movq	$1, %rax
	movq	%rax, %mm2
	movb	(%rsp), %al
	movb	%al, 32(%rsp)
	movb	1(%rsp), %al
	movb	%al, 33(%rsp)
	movb	2(%rsp), %al
	movb	%al, 34(%rsp)
	movb	3(%rsp), %al
	movb	%al, 35(%rsp)
	movb	4(%rsp), %al
	movb	%al, 36(%rsp)
	movb	5(%rsp), %al
	movb	%al, 37(%rsp)
	movb	6(%rsp), %al
	movb	%al, 38(%rsp)
	movb	7(%rsp), %al
	movb	%al, 39(%rsp)
	movb	8(%rsp), %al
	movb	%al, 40(%rsp)
	movb	9(%rsp), %al
	movb	%al, 41(%rsp)
	movb	10(%rsp), %al
	movb	%al, 42(%rsp)
	movb	11(%rsp), %al
	movb	%al, 43(%rsp)
	movb	12(%rsp), %al
	movb	%al, 44(%rsp)
	movb	13(%rsp), %al
	movb	%al, 45(%rsp)
	movb	14(%rsp), %al
	movb	%al, 46(%rsp)
	movb	15(%rsp), %al
	movb	%al, 47(%rsp)
	movb	16(%rsp), %al
	movb	%al, 48(%rsp)
	movb	17(%rsp), %al
	movb	%al, 49(%rsp)
	movb	18(%rsp), %al
	movb	%al, 50(%rsp)
	movb	19(%rsp), %al
	movb	%al, 51(%rsp)
	movb	20(%rsp), %al
	movb	%al, 52(%rsp)
	movb	21(%rsp), %al
	movb	%al, 53(%rsp)
	movb	22(%rsp), %al
	movb	%al, 54(%rsp)
	movb	23(%rsp), %al
	movb	%al, 55(%rsp)
	movb	24(%rsp), %al
	movb	%al, 56(%rsp)
	movb	25(%rsp), %al
	movb	%al, 57(%rsp)
	movb	26(%rsp), %al
	movb	%al, 58(%rsp)
	movb	27(%rsp), %al
	movb	%al, 59(%rsp)
	movb	28(%rsp), %al
	movb	%al, 60(%rsp)
	movb	29(%rsp), %al
	movb	%al, 61(%rsp)
	movb	30(%rsp), %al
	movb	%al, 62(%rsp)
	movb	31(%rsp), %al
	movb	%al, 63(%rsp)
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$223
	movb	$0, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$224
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$223:
	movb	$0, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$224:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$222:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$209
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$210:
	movq	%rcx, %mm7
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$221:
	movq	%mm7, %rcx
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
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$219
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$220
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$219:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$220:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$205
	movb	$0, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$206
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$205:
	movb	$1, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$206:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$204:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$191
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$192:
	movq	%rcx, %mm7
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$203:
	movq	%mm7, %rcx
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
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$201
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$202
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$201:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$202:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$187
	movb	$0, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$188
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$187:
	movb	$2, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$188:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$186:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$173
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$174:
	movq	%rcx, %mm7
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$185:
	movq	%mm7, %rcx
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
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$183
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$184
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$183:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$184:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$169
	movb	$1, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$170
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$169:
	movb	$0, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$170:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$168:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$155
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$156:
	movq	%rcx, %mm7
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$167:
	movq	%mm7, %rcx
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
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$165
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$166
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$165:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$166:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$151
	movb	$1, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$152
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$151:
	movb	$1, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$152:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$150:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$137
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$138:
	movq	%rcx, %mm7
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$149:
	movq	%mm7, %rcx
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
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$147
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$148
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$147:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$148:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$133
	movb	$1, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$134
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$133:
	movb	$2, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$134:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$132:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$119
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$120:
	movq	%rcx, %mm7
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$131:
	movq	%mm7, %rcx
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
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$129
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$130
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$129:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$130:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$115
	movb	$2, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$116
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$115:
	movb	$0, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$116:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$114:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$101
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$102:
	movq	%rcx, %mm7
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$113:
	movq	%mm7, %rcx
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
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$111
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$112
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$111:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$112:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$97
	movb	$2, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$98
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$97:
	movb	$1, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$98:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$96:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$83
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$84:
	movq	%rcx, %mm7
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$95:
	movq	%mm7, %rcx
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
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$93
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$94
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$93:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$94:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$79
	movb	$2, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$80
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$79:
	movb	$2, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$80:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$78:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$65
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$66:
	movq	%rcx, %mm2
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$77:
	movq	%mm2, %rcx
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
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$75
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$76
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$75:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$76:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	movb	$0, %al
	leaq	4152(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$62:
	leaq	168(%rsp), %rsp
	movb	$1, %al
	leaq	4664(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$61:
	leaq	168(%rsp), %rsp
	movb	$2, %al
	leaq	5176(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$60:
	leaq	168(%rsp), %rsp
	movb	$3, %al
	leaq	5688(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$59:
	leaq	168(%rsp), %rsp
	movb	$4, %al
	leaq	6200(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$58:
	leaq	168(%rsp), %rsp
	movb	$5, %al
	leaq	6712(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$57:
	leaq	168(%rsp), %rsp
	movb	$6, %al
	leaq	1080(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$56:
	leaq	168(%rsp), %rsp
	leaq	4152(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$55:
	leaq	4664(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$54:
	leaq	5176(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$53:
	leaq	7224(%rsp), %rdi
	leaq	8760(%rsp), %rcx
	leaq	4152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$52:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rdi
	leaq	9272(%rsp), %rcx
	leaq	4664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$51:
	leaq	16(%rsp), %rsp
	leaq	7224(%rsp), %rcx
	leaq	568(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$50:
	leaq	568(%rsp), %rdi
	leaq	9784(%rsp), %rcx
	leaq	5176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$49:
	leaq	16(%rsp), %rsp
	leaq	7224(%rsp), %rcx
	leaq	568(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$48:
	leaq	7224(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$46
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$47:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$46:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$47
	leaq	7736(%rsp), %rdi
	leaq	10296(%rsp), %rcx
	leaq	4152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$45:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rdi
	leaq	10808(%rsp), %rcx
	leaq	4664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$44:
	leaq	16(%rsp), %rsp
	leaq	7736(%rsp), %rcx
	leaq	568(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$43:
	leaq	568(%rsp), %rdi
	leaq	11320(%rsp), %rcx
	leaq	5176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$42:
	leaq	16(%rsp), %rsp
	leaq	7736(%rsp), %rcx
	leaq	568(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$41:
	leaq	7736(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$39
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$40:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$39:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$40
	leaq	8248(%rsp), %rdi
	leaq	11832(%rsp), %rcx
	leaq	4152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$38:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rdi
	leaq	12344(%rsp), %rcx
	leaq	4664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$37:
	leaq	16(%rsp), %rsp
	leaq	8248(%rsp), %rcx
	leaq	568(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$36:
	leaq	568(%rsp), %rdi
	leaq	12856(%rsp), %rcx
	leaq	5176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$35:
	leaq	16(%rsp), %rsp
	leaq	8248(%rsp), %rcx
	leaq	568(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$34:
	leaq	8248(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$32
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$33:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$32:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$33
	leaq	568(%rsp), %rdi
	leaq	2616(%rsp), %rcx
	leaq	4152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$31:
	leaq	16(%rsp), %rsp
	leaq	2104(%rsp), %rdi
	leaq	3128(%rsp), %rcx
	leaq	4664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$30:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rcx
	leaq	2104(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$29:
	leaq	2104(%rsp), %rdi
	leaq	3640(%rsp), %rcx
	leaq	5176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$28:
	leaq	16(%rsp), %rsp
	leaq	568(%rsp), %rcx
	leaq	2104(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$27:
	leaq	568(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$25
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$26:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$25:
	cmpq	$256, %rcx
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
	leaq	7224(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$14
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$15:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$14:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$15
	leaq	7736(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$12
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$13:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$12:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$13
	leaq	8248(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$10
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$11:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$10:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$11
	leaq	568(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$8
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$9:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$8:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$9
	movq	%mm6, %rax
	movq	%rax, %rdx
	movq	$0, %r9
	movq	$0, %r10
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
	movzwq	7224(%rsp,%r9,2), %rcx
	incq	%r9
	shlq	$10, %rcx
	addq	$1665, %rcx
	imulq	$1290167, %rcx, %rcx
	shrq	$32, %rcx
	andq	$1023, %rcx
	movzwq	7224(%rsp,%r9,2), %rsi
	incq	%r9
	shlq	$10, %rsi
	addq	$1665, %rsi
	imulq	$1290167, %rsi, %rsi
	shrq	$32, %rsi
	andq	$1023, %rsi
	movzwq	7224(%rsp,%r9,2), %rdi
	incq	%r9
	shlq	$10, %rdi
	addq	$1665, %rdi
	imulq	$1290167, %rdi, %rdi
	shrq	$32, %rdi
	andq	$1023, %rdi
	movzwq	7224(%rsp,%r9,2), %r8
	incq	%r9
	shlq	$10, %r8
	addq	$1665, %r8
	imulq	$1290167, %r8, %r8
	shrq	$32, %r8
	andq	$1023, %r8
	movw	%cx, %r11w
	andw	$255, %r11w
	movb	%r11b, (%rdx,%r10)
	incq	%r10
	shrw	$8, %cx
	movw	%si, %r11w
	shlw	$2, %r11w
	orw 	%cx, %r11w
	movb	%r11b, (%rdx,%r10)
	incq	%r10
	shrw	$6, %si
	movw	%di, %cx
	shlw	$4, %cx
	orw 	%si, %cx
	movb	%cl, (%rdx,%r10)
	incq	%r10
	shrw	$4, %di
	movw	%r8w, %cx
	shlw	$6, %cx
	orw 	%di, %cx
	movb	%cl, (%rdx,%r10)
	incq	%r10
	shrq	$2, %r8
	movb	%r8b, (%rdx,%r10)
	incq	%r10
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$3:
	cmpq	$765, %r9
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$4
	leaq	960(%rax), %rax
	leaq	568(%rsp), %rcx
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$2:
	movq	%mm4, %rdx
	leaq	13368(%rsp), %rax
	movq	$0, %rcx
	movb	(%rax), %sil
	movb	(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1(%rax), %sil
	movb	1(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	2(%rax), %sil
	movb	2(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	3(%rax), %sil
	movb	3(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	4(%rax), %sil
	movb	4(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	5(%rax), %sil
	movb	5(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	6(%rax), %sil
	movb	6(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	7(%rax), %sil
	movb	7(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	8(%rax), %sil
	movb	8(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	9(%rax), %sil
	movb	9(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	10(%rax), %sil
	movb	10(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	11(%rax), %sil
	movb	11(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	12(%rax), %sil
	movb	12(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	13(%rax), %sil
	movb	13(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	14(%rax), %sil
	movb	14(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	15(%rax), %sil
	movb	15(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	16(%rax), %sil
	movb	16(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	17(%rax), %sil
	movb	17(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	18(%rax), %sil
	movb	18(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	19(%rax), %sil
	movb	19(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	20(%rax), %sil
	movb	20(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	21(%rax), %sil
	movb	21(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	22(%rax), %sil
	movb	22(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	23(%rax), %sil
	movb	23(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	24(%rax), %sil
	movb	24(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	25(%rax), %sil
	movb	25(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	26(%rax), %sil
	movb	26(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	27(%rax), %sil
	movb	27(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	28(%rax), %sil
	movb	28(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	29(%rax), %sil
	movb	29(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	30(%rax), %sil
	movb	30(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	31(%rax), %sil
	movb	31(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	32(%rax), %sil
	movb	32(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	33(%rax), %sil
	movb	33(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	34(%rax), %sil
	movb	34(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	35(%rax), %sil
	movb	35(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	36(%rax), %sil
	movb	36(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	37(%rax), %sil
	movb	37(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	38(%rax), %sil
	movb	38(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	39(%rax), %sil
	movb	39(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	40(%rax), %sil
	movb	40(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	41(%rax), %sil
	movb	41(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	42(%rax), %sil
	movb	42(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	43(%rax), %sil
	movb	43(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	44(%rax), %sil
	movb	44(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	45(%rax), %sil
	movb	45(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	46(%rax), %sil
	movb	46(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	47(%rax), %sil
	movb	47(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	48(%rax), %sil
	movb	48(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	49(%rax), %sil
	movb	49(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	50(%rax), %sil
	movb	50(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	51(%rax), %sil
	movb	51(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	52(%rax), %sil
	movb	52(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	53(%rax), %sil
	movb	53(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	54(%rax), %sil
	movb	54(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	55(%rax), %sil
	movb	55(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	56(%rax), %sil
	movb	56(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	57(%rax), %sil
	movb	57(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	58(%rax), %sil
	movb	58(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	59(%rax), %sil
	movb	59(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	60(%rax), %sil
	movb	60(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	61(%rax), %sil
	movb	61(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	62(%rax), %sil
	movb	62(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	63(%rax), %sil
	movb	63(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	64(%rax), %sil
	movb	64(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	65(%rax), %sil
	movb	65(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	66(%rax), %sil
	movb	66(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	67(%rax), %sil
	movb	67(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	68(%rax), %sil
	movb	68(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	69(%rax), %sil
	movb	69(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	70(%rax), %sil
	movb	70(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	71(%rax), %sil
	movb	71(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	72(%rax), %sil
	movb	72(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	73(%rax), %sil
	movb	73(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	74(%rax), %sil
	movb	74(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	75(%rax), %sil
	movb	75(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	76(%rax), %sil
	movb	76(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	77(%rax), %sil
	movb	77(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	78(%rax), %sil
	movb	78(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	79(%rax), %sil
	movb	79(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	80(%rax), %sil
	movb	80(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	81(%rax), %sil
	movb	81(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	82(%rax), %sil
	movb	82(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	83(%rax), %sil
	movb	83(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	84(%rax), %sil
	movb	84(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	85(%rax), %sil
	movb	85(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	86(%rax), %sil
	movb	86(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	87(%rax), %sil
	movb	87(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	88(%rax), %sil
	movb	88(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	89(%rax), %sil
	movb	89(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	90(%rax), %sil
	movb	90(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	91(%rax), %sil
	movb	91(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	92(%rax), %sil
	movb	92(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	93(%rax), %sil
	movb	93(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	94(%rax), %sil
	movb	94(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	95(%rax), %sil
	movb	95(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	96(%rax), %sil
	movb	96(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	97(%rax), %sil
	movb	97(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	98(%rax), %sil
	movb	98(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	99(%rax), %sil
	movb	99(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	100(%rax), %sil
	movb	100(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	101(%rax), %sil
	movb	101(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	102(%rax), %sil
	movb	102(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	103(%rax), %sil
	movb	103(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	104(%rax), %sil
	movb	104(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	105(%rax), %sil
	movb	105(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	106(%rax), %sil
	movb	106(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	107(%rax), %sil
	movb	107(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	108(%rax), %sil
	movb	108(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	109(%rax), %sil
	movb	109(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	110(%rax), %sil
	movb	110(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	111(%rax), %sil
	movb	111(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	112(%rax), %sil
	movb	112(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	113(%rax), %sil
	movb	113(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	114(%rax), %sil
	movb	114(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	115(%rax), %sil
	movb	115(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	116(%rax), %sil
	movb	116(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	117(%rax), %sil
	movb	117(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	118(%rax), %sil
	movb	118(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	119(%rax), %sil
	movb	119(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	120(%rax), %sil
	movb	120(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	121(%rax), %sil
	movb	121(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	122(%rax), %sil
	movb	122(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	123(%rax), %sil
	movb	123(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	124(%rax), %sil
	movb	124(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	125(%rax), %sil
	movb	125(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	126(%rax), %sil
	movb	126(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	127(%rax), %sil
	movb	127(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	128(%rax), %sil
	movb	128(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	129(%rax), %sil
	movb	129(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	130(%rax), %sil
	movb	130(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	131(%rax), %sil
	movb	131(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	132(%rax), %sil
	movb	132(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	133(%rax), %sil
	movb	133(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	134(%rax), %sil
	movb	134(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	135(%rax), %sil
	movb	135(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	136(%rax), %sil
	movb	136(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	137(%rax), %sil
	movb	137(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	138(%rax), %sil
	movb	138(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	139(%rax), %sil
	movb	139(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	140(%rax), %sil
	movb	140(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	141(%rax), %sil
	movb	141(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	142(%rax), %sil
	movb	142(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	143(%rax), %sil
	movb	143(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	144(%rax), %sil
	movb	144(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	145(%rax), %sil
	movb	145(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	146(%rax), %sil
	movb	146(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	147(%rax), %sil
	movb	147(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	148(%rax), %sil
	movb	148(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	149(%rax), %sil
	movb	149(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	150(%rax), %sil
	movb	150(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	151(%rax), %sil
	movb	151(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	152(%rax), %sil
	movb	152(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	153(%rax), %sil
	movb	153(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	154(%rax), %sil
	movb	154(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	155(%rax), %sil
	movb	155(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	156(%rax), %sil
	movb	156(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	157(%rax), %sil
	movb	157(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	158(%rax), %sil
	movb	158(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	159(%rax), %sil
	movb	159(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	160(%rax), %sil
	movb	160(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	161(%rax), %sil
	movb	161(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	162(%rax), %sil
	movb	162(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	163(%rax), %sil
	movb	163(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	164(%rax), %sil
	movb	164(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	165(%rax), %sil
	movb	165(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	166(%rax), %sil
	movb	166(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	167(%rax), %sil
	movb	167(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	168(%rax), %sil
	movb	168(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	169(%rax), %sil
	movb	169(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	170(%rax), %sil
	movb	170(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	171(%rax), %sil
	movb	171(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	172(%rax), %sil
	movb	172(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	173(%rax), %sil
	movb	173(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	174(%rax), %sil
	movb	174(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	175(%rax), %sil
	movb	175(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	176(%rax), %sil
	movb	176(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	177(%rax), %sil
	movb	177(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	178(%rax), %sil
	movb	178(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	179(%rax), %sil
	movb	179(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	180(%rax), %sil
	movb	180(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	181(%rax), %sil
	movb	181(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	182(%rax), %sil
	movb	182(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	183(%rax), %sil
	movb	183(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	184(%rax), %sil
	movb	184(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	185(%rax), %sil
	movb	185(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	186(%rax), %sil
	movb	186(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	187(%rax), %sil
	movb	187(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	188(%rax), %sil
	movb	188(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	189(%rax), %sil
	movb	189(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	190(%rax), %sil
	movb	190(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	191(%rax), %sil
	movb	191(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	192(%rax), %sil
	movb	192(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	193(%rax), %sil
	movb	193(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	194(%rax), %sil
	movb	194(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	195(%rax), %sil
	movb	195(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	196(%rax), %sil
	movb	196(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	197(%rax), %sil
	movb	197(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	198(%rax), %sil
	movb	198(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	199(%rax), %sil
	movb	199(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	200(%rax), %sil
	movb	200(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	201(%rax), %sil
	movb	201(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	202(%rax), %sil
	movb	202(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	203(%rax), %sil
	movb	203(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	204(%rax), %sil
	movb	204(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	205(%rax), %sil
	movb	205(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	206(%rax), %sil
	movb	206(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	207(%rax), %sil
	movb	207(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	208(%rax), %sil
	movb	208(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	209(%rax), %sil
	movb	209(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	210(%rax), %sil
	movb	210(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	211(%rax), %sil
	movb	211(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	212(%rax), %sil
	movb	212(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	213(%rax), %sil
	movb	213(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	214(%rax), %sil
	movb	214(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	215(%rax), %sil
	movb	215(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	216(%rax), %sil
	movb	216(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	217(%rax), %sil
	movb	217(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	218(%rax), %sil
	movb	218(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	219(%rax), %sil
	movb	219(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	220(%rax), %sil
	movb	220(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	221(%rax), %sil
	movb	221(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	222(%rax), %sil
	movb	222(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	223(%rax), %sil
	movb	223(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	224(%rax), %sil
	movb	224(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	225(%rax), %sil
	movb	225(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	226(%rax), %sil
	movb	226(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	227(%rax), %sil
	movb	227(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	228(%rax), %sil
	movb	228(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	229(%rax), %sil
	movb	229(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	230(%rax), %sil
	movb	230(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	231(%rax), %sil
	movb	231(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	232(%rax), %sil
	movb	232(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	233(%rax), %sil
	movb	233(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	234(%rax), %sil
	movb	234(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	235(%rax), %sil
	movb	235(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	236(%rax), %sil
	movb	236(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	237(%rax), %sil
	movb	237(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	238(%rax), %sil
	movb	238(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	239(%rax), %sil
	movb	239(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	240(%rax), %sil
	movb	240(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	241(%rax), %sil
	movb	241(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	242(%rax), %sil
	movb	242(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	243(%rax), %sil
	movb	243(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	244(%rax), %sil
	movb	244(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	245(%rax), %sil
	movb	245(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	246(%rax), %sil
	movb	246(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	247(%rax), %sil
	movb	247(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	248(%rax), %sil
	movb	248(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	249(%rax), %sil
	movb	249(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	250(%rax), %sil
	movb	250(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	251(%rax), %sil
	movb	251(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	252(%rax), %sil
	movb	252(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	253(%rax), %sil
	movb	253(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	254(%rax), %sil
	movb	254(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	255(%rax), %sil
	movb	255(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	256(%rax), %sil
	movb	256(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	257(%rax), %sil
	movb	257(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	258(%rax), %sil
	movb	258(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	259(%rax), %sil
	movb	259(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	260(%rax), %sil
	movb	260(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	261(%rax), %sil
	movb	261(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	262(%rax), %sil
	movb	262(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	263(%rax), %sil
	movb	263(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	264(%rax), %sil
	movb	264(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	265(%rax), %sil
	movb	265(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	266(%rax), %sil
	movb	266(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	267(%rax), %sil
	movb	267(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	268(%rax), %sil
	movb	268(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	269(%rax), %sil
	movb	269(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	270(%rax), %sil
	movb	270(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	271(%rax), %sil
	movb	271(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	272(%rax), %sil
	movb	272(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	273(%rax), %sil
	movb	273(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	274(%rax), %sil
	movb	274(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	275(%rax), %sil
	movb	275(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	276(%rax), %sil
	movb	276(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	277(%rax), %sil
	movb	277(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	278(%rax), %sil
	movb	278(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	279(%rax), %sil
	movb	279(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	280(%rax), %sil
	movb	280(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	281(%rax), %sil
	movb	281(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	282(%rax), %sil
	movb	282(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	283(%rax), %sil
	movb	283(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	284(%rax), %sil
	movb	284(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	285(%rax), %sil
	movb	285(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	286(%rax), %sil
	movb	286(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	287(%rax), %sil
	movb	287(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	288(%rax), %sil
	movb	288(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	289(%rax), %sil
	movb	289(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	290(%rax), %sil
	movb	290(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	291(%rax), %sil
	movb	291(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	292(%rax), %sil
	movb	292(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	293(%rax), %sil
	movb	293(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	294(%rax), %sil
	movb	294(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	295(%rax), %sil
	movb	295(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	296(%rax), %sil
	movb	296(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	297(%rax), %sil
	movb	297(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	298(%rax), %sil
	movb	298(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	299(%rax), %sil
	movb	299(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	300(%rax), %sil
	movb	300(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	301(%rax), %sil
	movb	301(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	302(%rax), %sil
	movb	302(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	303(%rax), %sil
	movb	303(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	304(%rax), %sil
	movb	304(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	305(%rax), %sil
	movb	305(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	306(%rax), %sil
	movb	306(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	307(%rax), %sil
	movb	307(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	308(%rax), %sil
	movb	308(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	309(%rax), %sil
	movb	309(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	310(%rax), %sil
	movb	310(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	311(%rax), %sil
	movb	311(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	312(%rax), %sil
	movb	312(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	313(%rax), %sil
	movb	313(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	314(%rax), %sil
	movb	314(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	315(%rax), %sil
	movb	315(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	316(%rax), %sil
	movb	316(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	317(%rax), %sil
	movb	317(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	318(%rax), %sil
	movb	318(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	319(%rax), %sil
	movb	319(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	320(%rax), %sil
	movb	320(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	321(%rax), %sil
	movb	321(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	322(%rax), %sil
	movb	322(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	323(%rax), %sil
	movb	323(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	324(%rax), %sil
	movb	324(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	325(%rax), %sil
	movb	325(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	326(%rax), %sil
	movb	326(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	327(%rax), %sil
	movb	327(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	328(%rax), %sil
	movb	328(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	329(%rax), %sil
	movb	329(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	330(%rax), %sil
	movb	330(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	331(%rax), %sil
	movb	331(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	332(%rax), %sil
	movb	332(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	333(%rax), %sil
	movb	333(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	334(%rax), %sil
	movb	334(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	335(%rax), %sil
	movb	335(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	336(%rax), %sil
	movb	336(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	337(%rax), %sil
	movb	337(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	338(%rax), %sil
	movb	338(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	339(%rax), %sil
	movb	339(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	340(%rax), %sil
	movb	340(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	341(%rax), %sil
	movb	341(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	342(%rax), %sil
	movb	342(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	343(%rax), %sil
	movb	343(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	344(%rax), %sil
	movb	344(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	345(%rax), %sil
	movb	345(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	346(%rax), %sil
	movb	346(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	347(%rax), %sil
	movb	347(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	348(%rax), %sil
	movb	348(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	349(%rax), %sil
	movb	349(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	350(%rax), %sil
	movb	350(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	351(%rax), %sil
	movb	351(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	352(%rax), %sil
	movb	352(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	353(%rax), %sil
	movb	353(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	354(%rax), %sil
	movb	354(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	355(%rax), %sil
	movb	355(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	356(%rax), %sil
	movb	356(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	357(%rax), %sil
	movb	357(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	358(%rax), %sil
	movb	358(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	359(%rax), %sil
	movb	359(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	360(%rax), %sil
	movb	360(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	361(%rax), %sil
	movb	361(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	362(%rax), %sil
	movb	362(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	363(%rax), %sil
	movb	363(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	364(%rax), %sil
	movb	364(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	365(%rax), %sil
	movb	365(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	366(%rax), %sil
	movb	366(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	367(%rax), %sil
	movb	367(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	368(%rax), %sil
	movb	368(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	369(%rax), %sil
	movb	369(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	370(%rax), %sil
	movb	370(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	371(%rax), %sil
	movb	371(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	372(%rax), %sil
	movb	372(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	373(%rax), %sil
	movb	373(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	374(%rax), %sil
	movb	374(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	375(%rax), %sil
	movb	375(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	376(%rax), %sil
	movb	376(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	377(%rax), %sil
	movb	377(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	378(%rax), %sil
	movb	378(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	379(%rax), %sil
	movb	379(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	380(%rax), %sil
	movb	380(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	381(%rax), %sil
	movb	381(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	382(%rax), %sil
	movb	382(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	383(%rax), %sil
	movb	383(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	384(%rax), %sil
	movb	384(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	385(%rax), %sil
	movb	385(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	386(%rax), %sil
	movb	386(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	387(%rax), %sil
	movb	387(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	388(%rax), %sil
	movb	388(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	389(%rax), %sil
	movb	389(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	390(%rax), %sil
	movb	390(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	391(%rax), %sil
	movb	391(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	392(%rax), %sil
	movb	392(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	393(%rax), %sil
	movb	393(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	394(%rax), %sil
	movb	394(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	395(%rax), %sil
	movb	395(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	396(%rax), %sil
	movb	396(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	397(%rax), %sil
	movb	397(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	398(%rax), %sil
	movb	398(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	399(%rax), %sil
	movb	399(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	400(%rax), %sil
	movb	400(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	401(%rax), %sil
	movb	401(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	402(%rax), %sil
	movb	402(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	403(%rax), %sil
	movb	403(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	404(%rax), %sil
	movb	404(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	405(%rax), %sil
	movb	405(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	406(%rax), %sil
	movb	406(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	407(%rax), %sil
	movb	407(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	408(%rax), %sil
	movb	408(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	409(%rax), %sil
	movb	409(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	410(%rax), %sil
	movb	410(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	411(%rax), %sil
	movb	411(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	412(%rax), %sil
	movb	412(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	413(%rax), %sil
	movb	413(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	414(%rax), %sil
	movb	414(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	415(%rax), %sil
	movb	415(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	416(%rax), %sil
	movb	416(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	417(%rax), %sil
	movb	417(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	418(%rax), %sil
	movb	418(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	419(%rax), %sil
	movb	419(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	420(%rax), %sil
	movb	420(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	421(%rax), %sil
	movb	421(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	422(%rax), %sil
	movb	422(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	423(%rax), %sil
	movb	423(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	424(%rax), %sil
	movb	424(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	425(%rax), %sil
	movb	425(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	426(%rax), %sil
	movb	426(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	427(%rax), %sil
	movb	427(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	428(%rax), %sil
	movb	428(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	429(%rax), %sil
	movb	429(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	430(%rax), %sil
	movb	430(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	431(%rax), %sil
	movb	431(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	432(%rax), %sil
	movb	432(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	433(%rax), %sil
	movb	433(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	434(%rax), %sil
	movb	434(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	435(%rax), %sil
	movb	435(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	436(%rax), %sil
	movb	436(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	437(%rax), %sil
	movb	437(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	438(%rax), %sil
	movb	438(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	439(%rax), %sil
	movb	439(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	440(%rax), %sil
	movb	440(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	441(%rax), %sil
	movb	441(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	442(%rax), %sil
	movb	442(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	443(%rax), %sil
	movb	443(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	444(%rax), %sil
	movb	444(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	445(%rax), %sil
	movb	445(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	446(%rax), %sil
	movb	446(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	447(%rax), %sil
	movb	447(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	448(%rax), %sil
	movb	448(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	449(%rax), %sil
	movb	449(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	450(%rax), %sil
	movb	450(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	451(%rax), %sil
	movb	451(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	452(%rax), %sil
	movb	452(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	453(%rax), %sil
	movb	453(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	454(%rax), %sil
	movb	454(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	455(%rax), %sil
	movb	455(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	456(%rax), %sil
	movb	456(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	457(%rax), %sil
	movb	457(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	458(%rax), %sil
	movb	458(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	459(%rax), %sil
	movb	459(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	460(%rax), %sil
	movb	460(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	461(%rax), %sil
	movb	461(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	462(%rax), %sil
	movb	462(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	463(%rax), %sil
	movb	463(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	464(%rax), %sil
	movb	464(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	465(%rax), %sil
	movb	465(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	466(%rax), %sil
	movb	466(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	467(%rax), %sil
	movb	467(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	468(%rax), %sil
	movb	468(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	469(%rax), %sil
	movb	469(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	470(%rax), %sil
	movb	470(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	471(%rax), %sil
	movb	471(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	472(%rax), %sil
	movb	472(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	473(%rax), %sil
	movb	473(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	474(%rax), %sil
	movb	474(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	475(%rax), %sil
	movb	475(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	476(%rax), %sil
	movb	476(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	477(%rax), %sil
	movb	477(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	478(%rax), %sil
	movb	478(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	479(%rax), %sil
	movb	479(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	480(%rax), %sil
	movb	480(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	481(%rax), %sil
	movb	481(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	482(%rax), %sil
	movb	482(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	483(%rax), %sil
	movb	483(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	484(%rax), %sil
	movb	484(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	485(%rax), %sil
	movb	485(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	486(%rax), %sil
	movb	486(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	487(%rax), %sil
	movb	487(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	488(%rax), %sil
	movb	488(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	489(%rax), %sil
	movb	489(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	490(%rax), %sil
	movb	490(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	491(%rax), %sil
	movb	491(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	492(%rax), %sil
	movb	492(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	493(%rax), %sil
	movb	493(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	494(%rax), %sil
	movb	494(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	495(%rax), %sil
	movb	495(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	496(%rax), %sil
	movb	496(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	497(%rax), %sil
	movb	497(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	498(%rax), %sil
	movb	498(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	499(%rax), %sil
	movb	499(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	500(%rax), %sil
	movb	500(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	501(%rax), %sil
	movb	501(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	502(%rax), %sil
	movb	502(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	503(%rax), %sil
	movb	503(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	504(%rax), %sil
	movb	504(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	505(%rax), %sil
	movb	505(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	506(%rax), %sil
	movb	506(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	507(%rax), %sil
	movb	507(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	508(%rax), %sil
	movb	508(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	509(%rax), %sil
	movb	509(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	510(%rax), %sil
	movb	510(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	511(%rax), %sil
	movb	511(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	512(%rax), %sil
	movb	512(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	513(%rax), %sil
	movb	513(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	514(%rax), %sil
	movb	514(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	515(%rax), %sil
	movb	515(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	516(%rax), %sil
	movb	516(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	517(%rax), %sil
	movb	517(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	518(%rax), %sil
	movb	518(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	519(%rax), %sil
	movb	519(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	520(%rax), %sil
	movb	520(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	521(%rax), %sil
	movb	521(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	522(%rax), %sil
	movb	522(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	523(%rax), %sil
	movb	523(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	524(%rax), %sil
	movb	524(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	525(%rax), %sil
	movb	525(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	526(%rax), %sil
	movb	526(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	527(%rax), %sil
	movb	527(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	528(%rax), %sil
	movb	528(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	529(%rax), %sil
	movb	529(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	530(%rax), %sil
	movb	530(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	531(%rax), %sil
	movb	531(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	532(%rax), %sil
	movb	532(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	533(%rax), %sil
	movb	533(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	534(%rax), %sil
	movb	534(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	535(%rax), %sil
	movb	535(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	536(%rax), %sil
	movb	536(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	537(%rax), %sil
	movb	537(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	538(%rax), %sil
	movb	538(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	539(%rax), %sil
	movb	539(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	540(%rax), %sil
	movb	540(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	541(%rax), %sil
	movb	541(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	542(%rax), %sil
	movb	542(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	543(%rax), %sil
	movb	543(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	544(%rax), %sil
	movb	544(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	545(%rax), %sil
	movb	545(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	546(%rax), %sil
	movb	546(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	547(%rax), %sil
	movb	547(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	548(%rax), %sil
	movb	548(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	549(%rax), %sil
	movb	549(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	550(%rax), %sil
	movb	550(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	551(%rax), %sil
	movb	551(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	552(%rax), %sil
	movb	552(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	553(%rax), %sil
	movb	553(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	554(%rax), %sil
	movb	554(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	555(%rax), %sil
	movb	555(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	556(%rax), %sil
	movb	556(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	557(%rax), %sil
	movb	557(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	558(%rax), %sil
	movb	558(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	559(%rax), %sil
	movb	559(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	560(%rax), %sil
	movb	560(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	561(%rax), %sil
	movb	561(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	562(%rax), %sil
	movb	562(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	563(%rax), %sil
	movb	563(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	564(%rax), %sil
	movb	564(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	565(%rax), %sil
	movb	565(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	566(%rax), %sil
	movb	566(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	567(%rax), %sil
	movb	567(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	568(%rax), %sil
	movb	568(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	569(%rax), %sil
	movb	569(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	570(%rax), %sil
	movb	570(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	571(%rax), %sil
	movb	571(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	572(%rax), %sil
	movb	572(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	573(%rax), %sil
	movb	573(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	574(%rax), %sil
	movb	574(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	575(%rax), %sil
	movb	575(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	576(%rax), %sil
	movb	576(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	577(%rax), %sil
	movb	577(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	578(%rax), %sil
	movb	578(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	579(%rax), %sil
	movb	579(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	580(%rax), %sil
	movb	580(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	581(%rax), %sil
	movb	581(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	582(%rax), %sil
	movb	582(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	583(%rax), %sil
	movb	583(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	584(%rax), %sil
	movb	584(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	585(%rax), %sil
	movb	585(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	586(%rax), %sil
	movb	586(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	587(%rax), %sil
	movb	587(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	588(%rax), %sil
	movb	588(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	589(%rax), %sil
	movb	589(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	590(%rax), %sil
	movb	590(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	591(%rax), %sil
	movb	591(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	592(%rax), %sil
	movb	592(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	593(%rax), %sil
	movb	593(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	594(%rax), %sil
	movb	594(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	595(%rax), %sil
	movb	595(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	596(%rax), %sil
	movb	596(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	597(%rax), %sil
	movb	597(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	598(%rax), %sil
	movb	598(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	599(%rax), %sil
	movb	599(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	600(%rax), %sil
	movb	600(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	601(%rax), %sil
	movb	601(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	602(%rax), %sil
	movb	602(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	603(%rax), %sil
	movb	603(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	604(%rax), %sil
	movb	604(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	605(%rax), %sil
	movb	605(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	606(%rax), %sil
	movb	606(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	607(%rax), %sil
	movb	607(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	608(%rax), %sil
	movb	608(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	609(%rax), %sil
	movb	609(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	610(%rax), %sil
	movb	610(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	611(%rax), %sil
	movb	611(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	612(%rax), %sil
	movb	612(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	613(%rax), %sil
	movb	613(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	614(%rax), %sil
	movb	614(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	615(%rax), %sil
	movb	615(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	616(%rax), %sil
	movb	616(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	617(%rax), %sil
	movb	617(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	618(%rax), %sil
	movb	618(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	619(%rax), %sil
	movb	619(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	620(%rax), %sil
	movb	620(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	621(%rax), %sil
	movb	621(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	622(%rax), %sil
	movb	622(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	623(%rax), %sil
	movb	623(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	624(%rax), %sil
	movb	624(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	625(%rax), %sil
	movb	625(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	626(%rax), %sil
	movb	626(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	627(%rax), %sil
	movb	627(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	628(%rax), %sil
	movb	628(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	629(%rax), %sil
	movb	629(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	630(%rax), %sil
	movb	630(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	631(%rax), %sil
	movb	631(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	632(%rax), %sil
	movb	632(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	633(%rax), %sil
	movb	633(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	634(%rax), %sil
	movb	634(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	635(%rax), %sil
	movb	635(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	636(%rax), %sil
	movb	636(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	637(%rax), %sil
	movb	637(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	638(%rax), %sil
	movb	638(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	639(%rax), %sil
	movb	639(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	640(%rax), %sil
	movb	640(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	641(%rax), %sil
	movb	641(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	642(%rax), %sil
	movb	642(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	643(%rax), %sil
	movb	643(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	644(%rax), %sil
	movb	644(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	645(%rax), %sil
	movb	645(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	646(%rax), %sil
	movb	646(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	647(%rax), %sil
	movb	647(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	648(%rax), %sil
	movb	648(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	649(%rax), %sil
	movb	649(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	650(%rax), %sil
	movb	650(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	651(%rax), %sil
	movb	651(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	652(%rax), %sil
	movb	652(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	653(%rax), %sil
	movb	653(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	654(%rax), %sil
	movb	654(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	655(%rax), %sil
	movb	655(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	656(%rax), %sil
	movb	656(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	657(%rax), %sil
	movb	657(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	658(%rax), %sil
	movb	658(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	659(%rax), %sil
	movb	659(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	660(%rax), %sil
	movb	660(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	661(%rax), %sil
	movb	661(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	662(%rax), %sil
	movb	662(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	663(%rax), %sil
	movb	663(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	664(%rax), %sil
	movb	664(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	665(%rax), %sil
	movb	665(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	666(%rax), %sil
	movb	666(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	667(%rax), %sil
	movb	667(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	668(%rax), %sil
	movb	668(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	669(%rax), %sil
	movb	669(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	670(%rax), %sil
	movb	670(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	671(%rax), %sil
	movb	671(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	672(%rax), %sil
	movb	672(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	673(%rax), %sil
	movb	673(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	674(%rax), %sil
	movb	674(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	675(%rax), %sil
	movb	675(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	676(%rax), %sil
	movb	676(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	677(%rax), %sil
	movb	677(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	678(%rax), %sil
	movb	678(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	679(%rax), %sil
	movb	679(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	680(%rax), %sil
	movb	680(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	681(%rax), %sil
	movb	681(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	682(%rax), %sil
	movb	682(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	683(%rax), %sil
	movb	683(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	684(%rax), %sil
	movb	684(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	685(%rax), %sil
	movb	685(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	686(%rax), %sil
	movb	686(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	687(%rax), %sil
	movb	687(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	688(%rax), %sil
	movb	688(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	689(%rax), %sil
	movb	689(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	690(%rax), %sil
	movb	690(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	691(%rax), %sil
	movb	691(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	692(%rax), %sil
	movb	692(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	693(%rax), %sil
	movb	693(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	694(%rax), %sil
	movb	694(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	695(%rax), %sil
	movb	695(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	696(%rax), %sil
	movb	696(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	697(%rax), %sil
	movb	697(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	698(%rax), %sil
	movb	698(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	699(%rax), %sil
	movb	699(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	700(%rax), %sil
	movb	700(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	701(%rax), %sil
	movb	701(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	702(%rax), %sil
	movb	702(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	703(%rax), %sil
	movb	703(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	704(%rax), %sil
	movb	704(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	705(%rax), %sil
	movb	705(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	706(%rax), %sil
	movb	706(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	707(%rax), %sil
	movb	707(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	708(%rax), %sil
	movb	708(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	709(%rax), %sil
	movb	709(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	710(%rax), %sil
	movb	710(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	711(%rax), %sil
	movb	711(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	712(%rax), %sil
	movb	712(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	713(%rax), %sil
	movb	713(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	714(%rax), %sil
	movb	714(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	715(%rax), %sil
	movb	715(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	716(%rax), %sil
	movb	716(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	717(%rax), %sil
	movb	717(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	718(%rax), %sil
	movb	718(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	719(%rax), %sil
	movb	719(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	720(%rax), %sil
	movb	720(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	721(%rax), %sil
	movb	721(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	722(%rax), %sil
	movb	722(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	723(%rax), %sil
	movb	723(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	724(%rax), %sil
	movb	724(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	725(%rax), %sil
	movb	725(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	726(%rax), %sil
	movb	726(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	727(%rax), %sil
	movb	727(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	728(%rax), %sil
	movb	728(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	729(%rax), %sil
	movb	729(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	730(%rax), %sil
	movb	730(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	731(%rax), %sil
	movb	731(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	732(%rax), %sil
	movb	732(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	733(%rax), %sil
	movb	733(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	734(%rax), %sil
	movb	734(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	735(%rax), %sil
	movb	735(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	736(%rax), %sil
	movb	736(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	737(%rax), %sil
	movb	737(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	738(%rax), %sil
	movb	738(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	739(%rax), %sil
	movb	739(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	740(%rax), %sil
	movb	740(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	741(%rax), %sil
	movb	741(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	742(%rax), %sil
	movb	742(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	743(%rax), %sil
	movb	743(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	744(%rax), %sil
	movb	744(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	745(%rax), %sil
	movb	745(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	746(%rax), %sil
	movb	746(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	747(%rax), %sil
	movb	747(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	748(%rax), %sil
	movb	748(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	749(%rax), %sil
	movb	749(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	750(%rax), %sil
	movb	750(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	751(%rax), %sil
	movb	751(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	752(%rax), %sil
	movb	752(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	753(%rax), %sil
	movb	753(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	754(%rax), %sil
	movb	754(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	755(%rax), %sil
	movb	755(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	756(%rax), %sil
	movb	756(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	757(%rax), %sil
	movb	757(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	758(%rax), %sil
	movb	758(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	759(%rax), %sil
	movb	759(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	760(%rax), %sil
	movb	760(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	761(%rax), %sil
	movb	761(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	762(%rax), %sil
	movb	762(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	763(%rax), %sil
	movb	763(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	764(%rax), %sil
	movb	764(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	765(%rax), %sil
	movb	765(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	766(%rax), %sil
	movb	766(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	767(%rax), %sil
	movb	767(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	768(%rax), %sil
	movb	768(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	769(%rax), %sil
	movb	769(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	770(%rax), %sil
	movb	770(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	771(%rax), %sil
	movb	771(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	772(%rax), %sil
	movb	772(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	773(%rax), %sil
	movb	773(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	774(%rax), %sil
	movb	774(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	775(%rax), %sil
	movb	775(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	776(%rax), %sil
	movb	776(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	777(%rax), %sil
	movb	777(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	778(%rax), %sil
	movb	778(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	779(%rax), %sil
	movb	779(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	780(%rax), %sil
	movb	780(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	781(%rax), %sil
	movb	781(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	782(%rax), %sil
	movb	782(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	783(%rax), %sil
	movb	783(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	784(%rax), %sil
	movb	784(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	785(%rax), %sil
	movb	785(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	786(%rax), %sil
	movb	786(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	787(%rax), %sil
	movb	787(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	788(%rax), %sil
	movb	788(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	789(%rax), %sil
	movb	789(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	790(%rax), %sil
	movb	790(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	791(%rax), %sil
	movb	791(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	792(%rax), %sil
	movb	792(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	793(%rax), %sil
	movb	793(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	794(%rax), %sil
	movb	794(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	795(%rax), %sil
	movb	795(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	796(%rax), %sil
	movb	796(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	797(%rax), %sil
	movb	797(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	798(%rax), %sil
	movb	798(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	799(%rax), %sil
	movb	799(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	800(%rax), %sil
	movb	800(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	801(%rax), %sil
	movb	801(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	802(%rax), %sil
	movb	802(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	803(%rax), %sil
	movb	803(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	804(%rax), %sil
	movb	804(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	805(%rax), %sil
	movb	805(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	806(%rax), %sil
	movb	806(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	807(%rax), %sil
	movb	807(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	808(%rax), %sil
	movb	808(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	809(%rax), %sil
	movb	809(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	810(%rax), %sil
	movb	810(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	811(%rax), %sil
	movb	811(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	812(%rax), %sil
	movb	812(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	813(%rax), %sil
	movb	813(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	814(%rax), %sil
	movb	814(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	815(%rax), %sil
	movb	815(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	816(%rax), %sil
	movb	816(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	817(%rax), %sil
	movb	817(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	818(%rax), %sil
	movb	818(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	819(%rax), %sil
	movb	819(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	820(%rax), %sil
	movb	820(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	821(%rax), %sil
	movb	821(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	822(%rax), %sil
	movb	822(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	823(%rax), %sil
	movb	823(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	824(%rax), %sil
	movb	824(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	825(%rax), %sil
	movb	825(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	826(%rax), %sil
	movb	826(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	827(%rax), %sil
	movb	827(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	828(%rax), %sil
	movb	828(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	829(%rax), %sil
	movb	829(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	830(%rax), %sil
	movb	830(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	831(%rax), %sil
	movb	831(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	832(%rax), %sil
	movb	832(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	833(%rax), %sil
	movb	833(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	834(%rax), %sil
	movb	834(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	835(%rax), %sil
	movb	835(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	836(%rax), %sil
	movb	836(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	837(%rax), %sil
	movb	837(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	838(%rax), %sil
	movb	838(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	839(%rax), %sil
	movb	839(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	840(%rax), %sil
	movb	840(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	841(%rax), %sil
	movb	841(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	842(%rax), %sil
	movb	842(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	843(%rax), %sil
	movb	843(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	844(%rax), %sil
	movb	844(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	845(%rax), %sil
	movb	845(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	846(%rax), %sil
	movb	846(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	847(%rax), %sil
	movb	847(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	848(%rax), %sil
	movb	848(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	849(%rax), %sil
	movb	849(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	850(%rax), %sil
	movb	850(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	851(%rax), %sil
	movb	851(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	852(%rax), %sil
	movb	852(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	853(%rax), %sil
	movb	853(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	854(%rax), %sil
	movb	854(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	855(%rax), %sil
	movb	855(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	856(%rax), %sil
	movb	856(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	857(%rax), %sil
	movb	857(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	858(%rax), %sil
	movb	858(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	859(%rax), %sil
	movb	859(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	860(%rax), %sil
	movb	860(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	861(%rax), %sil
	movb	861(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	862(%rax), %sil
	movb	862(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	863(%rax), %sil
	movb	863(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	864(%rax), %sil
	movb	864(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	865(%rax), %sil
	movb	865(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	866(%rax), %sil
	movb	866(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	867(%rax), %sil
	movb	867(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	868(%rax), %sil
	movb	868(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	869(%rax), %sil
	movb	869(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	870(%rax), %sil
	movb	870(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	871(%rax), %sil
	movb	871(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	872(%rax), %sil
	movb	872(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	873(%rax), %sil
	movb	873(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	874(%rax), %sil
	movb	874(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	875(%rax), %sil
	movb	875(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	876(%rax), %sil
	movb	876(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	877(%rax), %sil
	movb	877(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	878(%rax), %sil
	movb	878(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	879(%rax), %sil
	movb	879(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	880(%rax), %sil
	movb	880(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	881(%rax), %sil
	movb	881(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	882(%rax), %sil
	movb	882(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	883(%rax), %sil
	movb	883(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	884(%rax), %sil
	movb	884(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	885(%rax), %sil
	movb	885(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	886(%rax), %sil
	movb	886(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	887(%rax), %sil
	movb	887(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	888(%rax), %sil
	movb	888(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	889(%rax), %sil
	movb	889(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	890(%rax), %sil
	movb	890(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	891(%rax), %sil
	movb	891(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	892(%rax), %sil
	movb	892(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	893(%rax), %sil
	movb	893(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	894(%rax), %sil
	movb	894(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	895(%rax), %sil
	movb	895(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	896(%rax), %sil
	movb	896(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	897(%rax), %sil
	movb	897(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	898(%rax), %sil
	movb	898(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	899(%rax), %sil
	movb	899(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	900(%rax), %sil
	movb	900(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	901(%rax), %sil
	movb	901(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	902(%rax), %sil
	movb	902(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	903(%rax), %sil
	movb	903(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	904(%rax), %sil
	movb	904(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	905(%rax), %sil
	movb	905(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	906(%rax), %sil
	movb	906(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	907(%rax), %sil
	movb	907(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	908(%rax), %sil
	movb	908(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	909(%rax), %sil
	movb	909(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	910(%rax), %sil
	movb	910(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	911(%rax), %sil
	movb	911(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	912(%rax), %sil
	movb	912(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	913(%rax), %sil
	movb	913(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	914(%rax), %sil
	movb	914(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	915(%rax), %sil
	movb	915(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	916(%rax), %sil
	movb	916(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	917(%rax), %sil
	movb	917(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	918(%rax), %sil
	movb	918(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	919(%rax), %sil
	movb	919(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	920(%rax), %sil
	movb	920(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	921(%rax), %sil
	movb	921(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	922(%rax), %sil
	movb	922(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	923(%rax), %sil
	movb	923(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	924(%rax), %sil
	movb	924(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	925(%rax), %sil
	movb	925(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	926(%rax), %sil
	movb	926(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	927(%rax), %sil
	movb	927(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	928(%rax), %sil
	movb	928(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	929(%rax), %sil
	movb	929(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	930(%rax), %sil
	movb	930(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	931(%rax), %sil
	movb	931(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	932(%rax), %sil
	movb	932(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	933(%rax), %sil
	movb	933(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	934(%rax), %sil
	movb	934(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	935(%rax), %sil
	movb	935(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	936(%rax), %sil
	movb	936(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	937(%rax), %sil
	movb	937(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	938(%rax), %sil
	movb	938(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	939(%rax), %sil
	movb	939(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	940(%rax), %sil
	movb	940(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	941(%rax), %sil
	movb	941(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	942(%rax), %sil
	movb	942(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	943(%rax), %sil
	movb	943(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	944(%rax), %sil
	movb	944(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	945(%rax), %sil
	movb	945(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	946(%rax), %sil
	movb	946(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	947(%rax), %sil
	movb	947(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	948(%rax), %sil
	movb	948(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	949(%rax), %sil
	movb	949(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	950(%rax), %sil
	movb	950(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	951(%rax), %sil
	movb	951(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	952(%rax), %sil
	movb	952(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	953(%rax), %sil
	movb	953(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	954(%rax), %sil
	movb	954(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	955(%rax), %sil
	movb	955(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	956(%rax), %sil
	movb	956(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	957(%rax), %sil
	movb	957(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	958(%rax), %sil
	movb	958(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	959(%rax), %sil
	movb	959(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	960(%rax), %sil
	movb	960(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	961(%rax), %sil
	movb	961(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	962(%rax), %sil
	movb	962(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	963(%rax), %sil
	movb	963(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	964(%rax), %sil
	movb	964(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	965(%rax), %sil
	movb	965(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	966(%rax), %sil
	movb	966(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	967(%rax), %sil
	movb	967(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	968(%rax), %sil
	movb	968(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	969(%rax), %sil
	movb	969(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	970(%rax), %sil
	movb	970(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	971(%rax), %sil
	movb	971(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	972(%rax), %sil
	movb	972(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	973(%rax), %sil
	movb	973(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	974(%rax), %sil
	movb	974(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	975(%rax), %sil
	movb	975(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	976(%rax), %sil
	movb	976(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	977(%rax), %sil
	movb	977(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	978(%rax), %sil
	movb	978(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	979(%rax), %sil
	movb	979(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	980(%rax), %sil
	movb	980(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	981(%rax), %sil
	movb	981(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	982(%rax), %sil
	movb	982(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	983(%rax), %sil
	movb	983(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	984(%rax), %sil
	movb	984(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	985(%rax), %sil
	movb	985(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	986(%rax), %sil
	movb	986(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	987(%rax), %sil
	movb	987(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	988(%rax), %sil
	movb	988(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	989(%rax), %sil
	movb	989(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	990(%rax), %sil
	movb	990(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	991(%rax), %sil
	movb	991(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	992(%rax), %sil
	movb	992(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	993(%rax), %sil
	movb	993(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	994(%rax), %sil
	movb	994(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	995(%rax), %sil
	movb	995(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	996(%rax), %sil
	movb	996(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	997(%rax), %sil
	movb	997(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	998(%rax), %sil
	movb	998(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	999(%rax), %sil
	movb	999(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1000(%rax), %sil
	movb	1000(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1001(%rax), %sil
	movb	1001(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1002(%rax), %sil
	movb	1002(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1003(%rax), %sil
	movb	1003(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1004(%rax), %sil
	movb	1004(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1005(%rax), %sil
	movb	1005(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1006(%rax), %sil
	movb	1006(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1007(%rax), %sil
	movb	1007(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1008(%rax), %sil
	movb	1008(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1009(%rax), %sil
	movb	1009(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1010(%rax), %sil
	movb	1010(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1011(%rax), %sil
	movb	1011(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1012(%rax), %sil
	movb	1012(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1013(%rax), %sil
	movb	1013(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1014(%rax), %sil
	movb	1014(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1015(%rax), %sil
	movb	1015(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1016(%rax), %sil
	movb	1016(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1017(%rax), %sil
	movb	1017(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1018(%rax), %sil
	movb	1018(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1019(%rax), %sil
	movb	1019(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1020(%rax), %sil
	movb	1020(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1021(%rax), %sil
	movb	1021(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1022(%rax), %sil
	movb	1022(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1023(%rax), %sil
	movb	1023(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1024(%rax), %sil
	movb	1024(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1025(%rax), %sil
	movb	1025(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1026(%rax), %sil
	movb	1026(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1027(%rax), %sil
	movb	1027(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1028(%rax), %sil
	movb	1028(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1029(%rax), %sil
	movb	1029(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1030(%rax), %sil
	movb	1030(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1031(%rax), %sil
	movb	1031(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1032(%rax), %sil
	movb	1032(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1033(%rax), %sil
	movb	1033(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1034(%rax), %sil
	movb	1034(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1035(%rax), %sil
	movb	1035(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1036(%rax), %sil
	movb	1036(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1037(%rax), %sil
	movb	1037(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1038(%rax), %sil
	movb	1038(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1039(%rax), %sil
	movb	1039(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1040(%rax), %sil
	movb	1040(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1041(%rax), %sil
	movb	1041(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1042(%rax), %sil
	movb	1042(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1043(%rax), %sil
	movb	1043(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1044(%rax), %sil
	movb	1044(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1045(%rax), %sil
	movb	1045(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1046(%rax), %sil
	movb	1046(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1047(%rax), %sil
	movb	1047(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1048(%rax), %sil
	movb	1048(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1049(%rax), %sil
	movb	1049(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1050(%rax), %sil
	movb	1050(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1051(%rax), %sil
	movb	1051(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1052(%rax), %sil
	movb	1052(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1053(%rax), %sil
	movb	1053(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1054(%rax), %sil
	movb	1054(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1055(%rax), %sil
	movb	1055(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1056(%rax), %sil
	movb	1056(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1057(%rax), %sil
	movb	1057(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1058(%rax), %sil
	movb	1058(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1059(%rax), %sil
	movb	1059(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1060(%rax), %sil
	movb	1060(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1061(%rax), %sil
	movb	1061(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1062(%rax), %sil
	movb	1062(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1063(%rax), %sil
	movb	1063(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1064(%rax), %sil
	movb	1064(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1065(%rax), %sil
	movb	1065(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1066(%rax), %sil
	movb	1066(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1067(%rax), %sil
	movb	1067(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1068(%rax), %sil
	movb	1068(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1069(%rax), %sil
	movb	1069(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1070(%rax), %sil
	movb	1070(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1071(%rax), %sil
	movb	1071(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1072(%rax), %sil
	movb	1072(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1073(%rax), %sil
	movb	1073(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1074(%rax), %sil
	movb	1074(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1075(%rax), %sil
	movb	1075(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1076(%rax), %sil
	movb	1076(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1077(%rax), %sil
	movb	1077(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1078(%rax), %sil
	movb	1078(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1079(%rax), %sil
	movb	1079(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1080(%rax), %sil
	movb	1080(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1081(%rax), %sil
	movb	1081(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1082(%rax), %sil
	movb	1082(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1083(%rax), %sil
	movb	1083(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1084(%rax), %sil
	movb	1084(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1085(%rax), %sil
	movb	1085(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1086(%rax), %sil
	movb	1086(%rdx), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rcx
	movb	1087(%rax), %al
	movb	1087(%rdx), %sil
	xorb	%sil, %al
	movzbq	%al, %rax
	orq 	%rax, %rcx
	negq	%rcx
	shrq	$63, %rcx
	movq	%rcx, %mm0
	movq	%mm5, %rcx
	addq	$64, %rcx
	addq	$2304, %rcx
	movq	%mm3, %rax
	leaq	-216(%rsp), %rsp
	call	L_shake256_1120_32$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$1:
	leaq	216(%rsp), %rsp
	movq	%mm3, %rax
	movq	%mm0, %rcx
	leaq	136(%rsp), %rdx
	negq	%rcx
	movb	(%rax), %sil
	movb	(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, (%rax)
	movb	1(%rax), %sil
	movb	1(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 1(%rax)
	movb	2(%rax), %sil
	movb	2(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 2(%rax)
	movb	3(%rax), %sil
	movb	3(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 3(%rax)
	movb	4(%rax), %sil
	movb	4(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 4(%rax)
	movb	5(%rax), %sil
	movb	5(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 5(%rax)
	movb	6(%rax), %sil
	movb	6(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 6(%rax)
	movb	7(%rax), %sil
	movb	7(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 7(%rax)
	movb	8(%rax), %sil
	movb	8(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 8(%rax)
	movb	9(%rax), %sil
	movb	9(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 9(%rax)
	movb	10(%rax), %sil
	movb	10(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 10(%rax)
	movb	11(%rax), %sil
	movb	11(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 11(%rax)
	movb	12(%rax), %sil
	movb	12(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 12(%rax)
	movb	13(%rax), %sil
	movb	13(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 13(%rax)
	movb	14(%rax), %sil
	movb	14(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 14(%rax)
	movb	15(%rax), %sil
	movb	15(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 15(%rax)
	movb	16(%rax), %sil
	movb	16(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 16(%rax)
	movb	17(%rax), %sil
	movb	17(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 17(%rax)
	movb	18(%rax), %sil
	movb	18(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 18(%rax)
	movb	19(%rax), %sil
	movb	19(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 19(%rax)
	movb	20(%rax), %sil
	movb	20(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 20(%rax)
	movb	21(%rax), %sil
	movb	21(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 21(%rax)
	movb	22(%rax), %sil
	movb	22(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 22(%rax)
	movb	23(%rax), %sil
	movb	23(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 23(%rax)
	movb	24(%rax), %sil
	movb	24(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 24(%rax)
	movb	25(%rax), %sil
	movb	25(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 25(%rax)
	movb	26(%rax), %sil
	movb	26(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 26(%rax)
	movb	27(%rax), %sil
	movb	27(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 27(%rax)
	movb	28(%rax), %sil
	movb	28(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 28(%rax)
	movb	29(%rax), %sil
	movb	29(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 29(%rax)
	movb	30(%rax), %sil
	movb	30(%rdx), %dil
	xorb	%dil, %sil
	andb	%cl, %sil
	xorb	%sil, %dil
	movb	%dil, 30(%rax)
	movb	31(%rax), %sil
	movb	31(%rdx), %dl
	xorb	%dl, %sil
	andb	%cl, %sil
	xorb	%sil, %dl
	movb	%dl, 31(%rax)
	xorq	%rax, %rax
	movq	14456(%rsp), %rbx
	movq	14464(%rsp), %rbp
	movq	14472(%rsp), %r12
	movq	14480(%rsp), %r13
	movq	14488(%rsp), %r14
	movq	14496(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem768_amd64_ref_enc:
jade_kem_mlkem_mlkem768_amd64_ref_enc:
	movq	%rsp, %rax
	leaq	-13416(%rsp), %rsp
	andq	$-16, %rsp
	movq	%rbx, 13368(%rsp)
	movq	%rbp, 13376(%rsp)
	movq	%r12, 13384(%rsp)
	movq	%r13, 13392(%rsp)
	movq	%r14, 13400(%rsp)
	movq	%rax, 13408(%rsp)
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%rdx, %r12
	movq	%rsp, %rdi
	movq	$32, %rsi
	call	__jasmin_syscall_randombytes__
	lfence
	movq	$0, %rcx
	movq	%r12, %mm1
	movq	%rbx, %mm3
	movq	%rbp, %mm4
	movq	(%rax), %rcx
	movq	%rcx, 72(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 80(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 88(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 96(%rsp)
	movq	%mm1, %rsi
	leaq	104(%rsp), %rax
	leaq	-216(%rsp), %rsp
	call	L_isha3_256_M1184$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$231:
	leaq	216(%rsp), %rsp
	leaq	136(%rsp), %rax
	leaq	72(%rsp), %rcx
	leaq	-216(%rsp), %rsp
	call	L_sha3_512_64$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$230:
	leaq	216(%rsp), %rsp
	movq	%mm1, %rcx
	leaq	72(%rsp), %rax
	leaq	168(%rsp), %rdx
	movq	%rdx, %mm0
	movq	%rcx, %rsi
	leaq	2616(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$229:
	addq	$384, %rsi
	leaq	3128(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$228:
	addq	$384, %rsi
	leaq	3640(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$227:
	movq	$0, %rdx
	addq	$1152, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$225
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$226:
	movq	(%rcx), %rsi
	movq	%rsi, (%rsp,%rdx,8)
	addq	$8, %rcx
	incq	%rdx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$225:
	cmpq	$4, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$226
	leaq	568(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$224:
	movq	$1, %rax
	movq	%rax, %mm2
	movb	(%rsp), %al
	movb	%al, 32(%rsp)
	movb	1(%rsp), %al
	movb	%al, 33(%rsp)
	movb	2(%rsp), %al
	movb	%al, 34(%rsp)
	movb	3(%rsp), %al
	movb	%al, 35(%rsp)
	movb	4(%rsp), %al
	movb	%al, 36(%rsp)
	movb	5(%rsp), %al
	movb	%al, 37(%rsp)
	movb	6(%rsp), %al
	movb	%al, 38(%rsp)
	movb	7(%rsp), %al
	movb	%al, 39(%rsp)
	movb	8(%rsp), %al
	movb	%al, 40(%rsp)
	movb	9(%rsp), %al
	movb	%al, 41(%rsp)
	movb	10(%rsp), %al
	movb	%al, 42(%rsp)
	movb	11(%rsp), %al
	movb	%al, 43(%rsp)
	movb	12(%rsp), %al
	movb	%al, 44(%rsp)
	movb	13(%rsp), %al
	movb	%al, 45(%rsp)
	movb	14(%rsp), %al
	movb	%al, 46(%rsp)
	movb	15(%rsp), %al
	movb	%al, 47(%rsp)
	movb	16(%rsp), %al
	movb	%al, 48(%rsp)
	movb	17(%rsp), %al
	movb	%al, 49(%rsp)
	movb	18(%rsp), %al
	movb	%al, 50(%rsp)
	movb	19(%rsp), %al
	movb	%al, 51(%rsp)
	movb	20(%rsp), %al
	movb	%al, 52(%rsp)
	movb	21(%rsp), %al
	movb	%al, 53(%rsp)
	movb	22(%rsp), %al
	movb	%al, 54(%rsp)
	movb	23(%rsp), %al
	movb	%al, 55(%rsp)
	movb	24(%rsp), %al
	movb	%al, 56(%rsp)
	movb	25(%rsp), %al
	movb	%al, 57(%rsp)
	movb	26(%rsp), %al
	movb	%al, 58(%rsp)
	movb	27(%rsp), %al
	movb	%al, 59(%rsp)
	movb	28(%rsp), %al
	movb	%al, 60(%rsp)
	movb	29(%rsp), %al
	movb	%al, 61(%rsp)
	movb	30(%rsp), %al
	movb	%al, 62(%rsp)
	movb	31(%rsp), %al
	movb	%al, 63(%rsp)
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$222
	movb	$0, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$223
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$222:
	movb	$0, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$223:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$221:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$208
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$209:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$220:
	movq	%mm5, %rcx
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
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$218
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$219
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$218:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$219:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	8760(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$206
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$207:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$206:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$207
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$204
	movb	$0, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$205
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$204:
	movb	$1, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$205:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$203:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$190
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$191:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$202:
	movq	%mm5, %rcx
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
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$200
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$201
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$200:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$201:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	9272(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$188
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$189:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$188:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$189
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$186
	movb	$0, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$187
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$186:
	movb	$2, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$187:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$185:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$172
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$173:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$184:
	movq	%mm5, %rcx
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
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$182
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$183
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$182:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$183:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	9784(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$170
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$171:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$170:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$171
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$168
	movb	$1, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$169
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$168:
	movb	$0, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$169:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$167:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$154
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$155:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$166:
	movq	%mm5, %rcx
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
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$164
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$165
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$164:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$165:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	10296(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$152
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$153:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$152:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$153
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$150
	movb	$1, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$151
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$150:
	movb	$1, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$151:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$149:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$136
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$137:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$148:
	movq	%mm5, %rcx
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
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$146
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$147
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$146:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$147:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	10808(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$134
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$135:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$134:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$135
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$132
	movb	$1, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$133
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$132:
	movb	$2, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$133:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$131:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$118
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$119:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$130:
	movq	%mm5, %rcx
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
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$128
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$129
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$128:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$129:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	11320(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$116
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$117:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$116:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$117
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$114
	movb	$2, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$115
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$114:
	movb	$0, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$115:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$113:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$100
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$101:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$112:
	movq	%mm5, %rcx
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
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$110
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$111
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$110:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$111:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	11832(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$98
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$99:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$98:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$99
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$96
	movb	$2, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$97
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$96:
	movb	$1, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$97:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$95:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$82
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$83:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$94:
	movq	%mm5, %rcx
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
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$92
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$93
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$92:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$93:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	12344(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$80
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$81:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$80:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$81
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$78
	movb	$2, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$79
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$78:
	movb	$2, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$79:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$77:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$64
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$65:
	movq	%rcx, %mm2
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$76:
	movq	%mm2, %rcx
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
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$74
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$75
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$74:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$75:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	12856(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$62
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$63:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$62:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$63
	movb	$0, %al
	leaq	4152(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$61:
	leaq	168(%rsp), %rsp
	movb	$1, %al
	leaq	4664(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$60:
	leaq	168(%rsp), %rsp
	movb	$2, %al
	leaq	5176(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$59:
	leaq	168(%rsp), %rsp
	movb	$3, %al
	leaq	5688(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$58:
	leaq	168(%rsp), %rsp
	movb	$4, %al
	leaq	6200(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$57:
	leaq	168(%rsp), %rsp
	movb	$5, %al
	leaq	6712(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$56:
	leaq	168(%rsp), %rsp
	movb	$6, %al
	leaq	1080(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$55:
	leaq	168(%rsp), %rsp
	leaq	4152(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$54:
	leaq	4664(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$53:
	leaq	5176(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$52:
	leaq	7224(%rsp), %rdi
	leaq	8760(%rsp), %rcx
	leaq	4152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$51:
	leaq	16(%rsp), %rsp
	leaq	1592(%rsp), %rdi
	leaq	9272(%rsp), %rcx
	leaq	4664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$50:
	leaq	16(%rsp), %rsp
	leaq	7224(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$49:
	leaq	1592(%rsp), %rdi
	leaq	9784(%rsp), %rcx
	leaq	5176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$48:
	leaq	16(%rsp), %rsp
	leaq	7224(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$47:
	leaq	7224(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$45
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$46:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$45:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$46
	leaq	7736(%rsp), %rdi
	leaq	10296(%rsp), %rcx
	leaq	4152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$44:
	leaq	16(%rsp), %rsp
	leaq	1592(%rsp), %rdi
	leaq	10808(%rsp), %rcx
	leaq	4664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$43:
	leaq	16(%rsp), %rsp
	leaq	7736(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$42:
	leaq	1592(%rsp), %rdi
	leaq	11320(%rsp), %rcx
	leaq	5176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$41:
	leaq	16(%rsp), %rsp
	leaq	7736(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$40:
	leaq	7736(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$38
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$39:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$38:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$39
	leaq	8248(%rsp), %rdi
	leaq	11832(%rsp), %rcx
	leaq	4152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$37:
	leaq	16(%rsp), %rsp
	leaq	1592(%rsp), %rdi
	leaq	12344(%rsp), %rcx
	leaq	4664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$36:
	leaq	16(%rsp), %rsp
	leaq	8248(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$35:
	leaq	1592(%rsp), %rdi
	leaq	12856(%rsp), %rcx
	leaq	5176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$34:
	leaq	16(%rsp), %rsp
	leaq	8248(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$33:
	leaq	8248(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$31
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$32:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$31:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$32
	leaq	1592(%rsp), %rdi
	leaq	2616(%rsp), %rcx
	leaq	4152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$30:
	leaq	16(%rsp), %rsp
	leaq	2104(%rsp), %rdi
	leaq	3128(%rsp), %rcx
	leaq	4664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$29:
	leaq	16(%rsp), %rsp
	leaq	1592(%rsp), %rcx
	leaq	2104(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$28:
	leaq	2104(%rsp), %rdi
	leaq	3640(%rsp), %rcx
	leaq	5176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$27:
	leaq	16(%rsp), %rsp
	leaq	1592(%rsp), %rcx
	leaq	2104(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$26:
	leaq	1592(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$24
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$25:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$24:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$25
	leaq	7224(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$23:
	leaq	7736(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$22:
	leaq	8248(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$21:
	leaq	1592(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$20:
	leaq	7224(%rsp), %rcx
	leaq	5688(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$19:
	leaq	7736(%rsp), %rcx
	leaq	6200(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$18:
	leaq	8248(%rsp), %rcx
	leaq	6712(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$17:
	leaq	1592(%rsp), %rcx
	leaq	1080(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$16:
	leaq	1592(%rsp), %rcx
	leaq	568(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$15:
	leaq	7224(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$13
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$14:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$13:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$14
	leaq	7736(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$11
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$12:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$11:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$12
	leaq	8248(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$9
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$10:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$9:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$10
	leaq	1592(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$7
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$8:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$7:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$8
	movq	%mm3, %rax
	movq	$0, %rdx
	movq	$0, %r9
	leaq	7224(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$6:
	leaq	7736(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$5:
	leaq	8248(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$4:
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$2
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$3:
	movzwq	7224(%rsp,%rdx,2), %rcx
	incq	%rdx
	shlq	$10, %rcx
	addq	$1665, %rcx
	imulq	$1290167, %rcx, %rcx
	shrq	$32, %rcx
	andq	$1023, %rcx
	movzwq	7224(%rsp,%rdx,2), %rsi
	incq	%rdx
	shlq	$10, %rsi
	addq	$1665, %rsi
	imulq	$1290167, %rsi, %rsi
	shrq	$32, %rsi
	andq	$1023, %rsi
	movzwq	7224(%rsp,%rdx,2), %rdi
	incq	%rdx
	shlq	$10, %rdi
	addq	$1665, %rdi
	imulq	$1290167, %rdi, %rdi
	shrq	$32, %rdi
	andq	$1023, %rdi
	movzwq	7224(%rsp,%rdx,2), %r8
	incq	%rdx
	shlq	$10, %r8
	addq	$1665, %r8
	imulq	$1290167, %r8, %r8
	shrq	$32, %r8
	andq	$1023, %r8
	movw	%cx, %r10w
	andw	$255, %r10w
	movb	%r10b, (%rax,%r9)
	incq	%r9
	shrw	$8, %cx
	movw	%si, %r10w
	shlw	$2, %r10w
	orw 	%cx, %r10w
	movb	%r10b, (%rax,%r9)
	incq	%r9
	shrw	$6, %si
	movw	%di, %cx
	shlw	$4, %cx
	orw 	%si, %cx
	movb	%cl, (%rax,%r9)
	incq	%r9
	shrw	$4, %di
	movw	%r8w, %cx
	shlw	$6, %cx
	orw 	%di, %cx
	movb	%cl, (%rax,%r9)
	incq	%r9
	shrq	$2, %r8
	movb	%r8b, (%rax,%r9)
	incq	%r9
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$2:
	cmpq	$765, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$3
	addq	$960, %rax
	leaq	1592(%rsp), %rcx
	call	L_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$1:
	movq	%mm4, %rax
	movq	136(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	144(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	152(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	160(%rsp), %rcx
	movq	%rcx, 24(%rax)
	xorq	%rax, %rax
	movq	13368(%rsp), %rbx
	movq	13376(%rsp), %rbp
	movq	13384(%rsp), %r12
	movq	13392(%rsp), %r13
	movq	13400(%rsp), %r14
	movq	13408(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem768_amd64_ref_keypair:
jade_kem_mlkem_mlkem768_amd64_ref_keypair:
	movq	%rsp, %rax
	leaq	-10416(%rsp), %rsp
	andq	$-16, %rsp
	movq	%rbx, 10368(%rsp)
	movq	%rbp, 10376(%rsp)
	movq	%r12, 10384(%rsp)
	movq	%r13, 10392(%rsp)
	movq	%r14, 10400(%rsp)
	movq	%rax, 10408(%rsp)
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	leaq	144(%rsp), %rdi
	movq	$64, %rsi
	call	__jasmin_syscall_randombytes__
	lfence
	movq	$0, %rcx
	movq	%rax, %mm3
	movq	%rbx, %mm4
	movq	%rbp, %mm5
	movq	(%rax), %rcx
	movq	%rcx, 64(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 72(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 80(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 88(%rsp)
	movb	$3, 96(%rsp)
	leaq	208(%rsp), %rax
	leaq	64(%rsp), %rcx
	leaq	-216(%rsp), %rsp
	call	L_sha3512_33$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$215:
	leaq	216(%rsp), %rsp
	movq	208(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	240(%rsp), %rax
	movq	%rax, (%rsp)
	movq	216(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	248(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	224(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	256(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	232(%rsp), %rax
	movq	%rax, 56(%rsp)
	movq	264(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	%rsp, %rax
	movq	%rax, %mm0
	movq	$0, %rax
	movq	%rax, %mm2
	movb	32(%rsp), %al
	movb	%al, 104(%rsp)
	movb	33(%rsp), %al
	movb	%al, 105(%rsp)
	movb	34(%rsp), %al
	movb	%al, 106(%rsp)
	movb	35(%rsp), %al
	movb	%al, 107(%rsp)
	movb	36(%rsp), %al
	movb	%al, 108(%rsp)
	movb	37(%rsp), %al
	movb	%al, 109(%rsp)
	movb	38(%rsp), %al
	movb	%al, 110(%rsp)
	movb	39(%rsp), %al
	movb	%al, 111(%rsp)
	movb	40(%rsp), %al
	movb	%al, 112(%rsp)
	movb	41(%rsp), %al
	movb	%al, 113(%rsp)
	movb	42(%rsp), %al
	movb	%al, 114(%rsp)
	movb	43(%rsp), %al
	movb	%al, 115(%rsp)
	movb	44(%rsp), %al
	movb	%al, 116(%rsp)
	movb	45(%rsp), %al
	movb	%al, 117(%rsp)
	movb	46(%rsp), %al
	movb	%al, 118(%rsp)
	movb	47(%rsp), %al
	movb	%al, 119(%rsp)
	movb	48(%rsp), %al
	movb	%al, 120(%rsp)
	movb	49(%rsp), %al
	movb	%al, 121(%rsp)
	movb	50(%rsp), %al
	movb	%al, 122(%rsp)
	movb	51(%rsp), %al
	movb	%al, 123(%rsp)
	movb	52(%rsp), %al
	movb	%al, 124(%rsp)
	movb	53(%rsp), %al
	movb	%al, 125(%rsp)
	movb	54(%rsp), %al
	movb	%al, 126(%rsp)
	movb	55(%rsp), %al
	movb	%al, 127(%rsp)
	movb	56(%rsp), %al
	movb	%al, 128(%rsp)
	movb	57(%rsp), %al
	movb	%al, 129(%rsp)
	movb	58(%rsp), %al
	movb	%al, 130(%rsp)
	movb	59(%rsp), %al
	movb	%al, 131(%rsp)
	movb	60(%rsp), %al
	movb	%al, 132(%rsp)
	movb	61(%rsp), %al
	movb	%al, 133(%rsp)
	movb	62(%rsp), %al
	movb	%al, 134(%rsp)
	movb	63(%rsp), %al
	movb	%al, 135(%rsp)
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$213
	movb	$0, 136(%rsp)
	movb	$0, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$214
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$213:
	movb	$0, 136(%rsp)
	movb	$0, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$214:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$212:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$199
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$200:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$211:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$201
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$203:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$209
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$210
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$209:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$210:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	5760(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$197
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$198:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$197:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$198
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$195
	movb	$0, 136(%rsp)
	movb	$1, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$196
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$195:
	movb	$1, 136(%rsp)
	movb	$0, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$196:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$194:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$181
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$182:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$193:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$183
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$185:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$191
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$192
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$191:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$192:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	6272(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$179
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$180:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$179:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$180
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$177
	movb	$0, 136(%rsp)
	movb	$2, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$178
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$177:
	movb	$2, 136(%rsp)
	movb	$0, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$178:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$176:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$163
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$164:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$175:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$165
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$167:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$173
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$174
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$173:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$174:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	6784(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$161
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$162:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$161:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$162
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$159
	movb	$1, 136(%rsp)
	movb	$0, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$160
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$159:
	movb	$0, 136(%rsp)
	movb	$1, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$160:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$158:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$145
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$146:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$157:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$147
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$149:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$155
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$156
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$155:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$156:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	7296(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$143
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$144:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$143:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$144
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$141
	movb	$1, 136(%rsp)
	movb	$1, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$142
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$141:
	movb	$1, 136(%rsp)
	movb	$1, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$142:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$140:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$127
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$128:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$139:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$129
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$131:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$137
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$138
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$137:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$138:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	7808(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$125
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$126:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$125:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$126
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$123
	movb	$1, 136(%rsp)
	movb	$2, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$124
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$123:
	movb	$2, 136(%rsp)
	movb	$1, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$124:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$122:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$109
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$110:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$121:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$111
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$113:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$119
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$120
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$119:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$120:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	8320(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$107
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$108:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$107:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$108
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$105
	movb	$2, 136(%rsp)
	movb	$0, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$106
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$105:
	movb	$0, 136(%rsp)
	movb	$2, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$106:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$104:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$91
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$92:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$103:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$93
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$95:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$101
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$102
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$101:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$102:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	8832(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$89
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$90:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$89:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$90
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$87
	movb	$2, 136(%rsp)
	movb	$1, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$88
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$87:
	movb	$1, 136(%rsp)
	movb	$2, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$88:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$86:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$73
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$74:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$85:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$75
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$77:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$83
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$84
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$83:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$84:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	9344(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$71
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$72:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$71:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$72
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$69
	movb	$2, 136(%rsp)
	movb	$2, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$70
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$69:
	movb	$2, 136(%rsp)
	movb	$2, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$70:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$68:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$55
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$56:
	movq	%rcx, %mm2
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$67:
	movq	%mm2, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$57
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$58:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$59
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$57
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$59:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$65
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$66
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$65:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$66:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	9856(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$53
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$54:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$53:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$54
	movb	$0, %al
	leaq	1152(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$52:
	leaq	168(%rsp), %rsp
	movb	$1, %al
	leaq	1664(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$51:
	leaq	168(%rsp), %rsp
	movb	$2, %al
	leaq	2176(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$50:
	leaq	168(%rsp), %rsp
	movb	$3, %al
	leaq	2688(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$49:
	leaq	168(%rsp), %rsp
	movb	$4, %al
	leaq	3200(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$48:
	leaq	168(%rsp), %rsp
	movb	$5, %al
	leaq	3712(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$47:
	leaq	168(%rsp), %rsp
	leaq	1152(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$46:
	leaq	1664(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$45:
	leaq	2176(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$44:
	leaq	2688(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$43:
	leaq	3200(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$42:
	leaq	3712(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$41:
	leaq	4224(%rsp), %rdi
	leaq	5760(%rsp), %rcx
	leaq	1152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$40:
	leaq	16(%rsp), %rsp
	leaq	640(%rsp), %rdi
	leaq	6272(%rsp), %rcx
	leaq	1664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$39:
	leaq	16(%rsp), %rsp
	leaq	4224(%rsp), %rcx
	leaq	640(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$38:
	leaq	640(%rsp), %rdi
	leaq	6784(%rsp), %rcx
	leaq	2176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$37:
	leaq	16(%rsp), %rsp
	leaq	4224(%rsp), %rcx
	leaq	640(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$36:
	leaq	4224(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$34
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$35:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$34:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$35
	leaq	4224(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$33:
	leaq	4736(%rsp), %rdi
	leaq	7296(%rsp), %rcx
	leaq	1152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$32:
	leaq	16(%rsp), %rsp
	leaq	640(%rsp), %rdi
	leaq	7808(%rsp), %rcx
	leaq	1664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$31:
	leaq	16(%rsp), %rsp
	leaq	4736(%rsp), %rcx
	leaq	640(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$30:
	leaq	640(%rsp), %rdi
	leaq	8320(%rsp), %rcx
	leaq	2176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$29:
	leaq	16(%rsp), %rsp
	leaq	4736(%rsp), %rcx
	leaq	640(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$28:
	leaq	4736(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$26
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$27:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$26:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$27
	leaq	4736(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$25:
	leaq	5248(%rsp), %rdi
	leaq	8832(%rsp), %rcx
	leaq	1152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$24:
	leaq	16(%rsp), %rsp
	leaq	640(%rsp), %rdi
	leaq	9344(%rsp), %rcx
	leaq	1664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$23:
	leaq	16(%rsp), %rsp
	leaq	5248(%rsp), %rcx
	leaq	640(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$22:
	leaq	640(%rsp), %rdi
	leaq	9856(%rsp), %rcx
	leaq	2176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$21:
	leaq	16(%rsp), %rsp
	leaq	5248(%rsp), %rcx
	leaq	640(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$20:
	leaq	5248(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$18
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$19:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$18:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$19
	leaq	5248(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$17:
	leaq	4224(%rsp), %rcx
	leaq	2688(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$16:
	leaq	4736(%rsp), %rcx
	leaq	3200(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$15:
	leaq	5248(%rsp), %rcx
	leaq	3712(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$14:
	leaq	4224(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$12
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$13:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$12:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$13
	leaq	4736(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$10
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$11:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$10:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$11
	leaq	5248(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$9:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$8:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$9
	movq	%mm4, %rax
	movq	%mm5, %rcx
	movq	%rcx, %rdx
	leaq	1152(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$7:
	addq	$384, %rdx
	leaq	1664(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$6:
	addq	$384, %rdx
	leaq	2176(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$5:
	movq	%rax, %rdx
	leaq	4224(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$4:
	addq	$384, %rdx
	leaq	4736(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$3:
	addq	$384, %rdx
	leaq	5248(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$2:
	addq	$1152, %rax
	movq	32(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	40(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	48(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	56(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	%mm5, %rax
	addq	$1152, %rax
	movq	%mm4, %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	8(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	16(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	24(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	32(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	40(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	48(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	56(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	64(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	72(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	80(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	88(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	96(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	104(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	112(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	120(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	128(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	136(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	144(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	152(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	160(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	168(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	176(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	184(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	192(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	200(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	208(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	216(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	224(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	232(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	240(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	248(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	256(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	264(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	272(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	280(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	288(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	296(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	304(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	312(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	320(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	328(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	336(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	344(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	352(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	360(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	368(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	376(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	384(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	392(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	400(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	408(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	416(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	424(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	432(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	440(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	448(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	456(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	464(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	472(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	480(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	488(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	496(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	504(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	512(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	520(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	528(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	536(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	544(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	552(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	560(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	568(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	576(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	584(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	592(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	600(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	608(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	616(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	624(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	632(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	640(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	648(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	656(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	664(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	672(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	680(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	688(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	696(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	704(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	712(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	720(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	728(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	736(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	744(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	752(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	760(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	768(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	776(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	784(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	792(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	800(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	808(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	816(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	824(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	832(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	840(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	848(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	856(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	864(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	872(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	880(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	888(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	896(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	904(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	912(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	920(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	928(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	936(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	944(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	952(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	960(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	968(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	976(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	984(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	992(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1000(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1008(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1016(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1024(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1032(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1040(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1048(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1056(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1064(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1072(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1080(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1088(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1096(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1104(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1112(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1120(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1128(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1136(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1144(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1152(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1160(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1168(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1176(%rcx), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	%rax, %mm1
	movq	%mm4, %rsi
	leaq	32(%rsp), %rax
	leaq	-216(%rsp), %rsp
	call	L_isha3_256_M1184$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$1:
	leaq	216(%rsp), %rsp
	movq	%mm1, %rax
	movq	32(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	40(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	48(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	56(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	%mm3, %rcx
	leaq	32(%rcx), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	8(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	16(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	24(%rcx), %rcx
	movq	%rcx, (%rax)
	xorq	%rax, %rax
	movq	10368(%rsp), %rbx
	movq	10376(%rsp), %rbp
	movq	10384(%rsp), %r12
	movq	10392(%rsp), %r13
	movq	10400(%rsp), %r14
	movq	10408(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem768_amd64_ref_enc_derand:
jade_kem_mlkem_mlkem768_amd64_ref_enc_derand:
	movq	%rsp, %rax
	leaq	-13416(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 13368(%rsp)
	movq	%rbp, 13376(%rsp)
	movq	%r12, 13384(%rsp)
	movq	%r13, 13392(%rsp)
	movq	%r14, 13400(%rsp)
	movq	%rax, 13408(%rsp)
	lfence
	movq	$0, %rax
	movb	(%rcx), %al
	movb	%al, (%rsp)
	movb	1(%rcx), %al
	movb	%al, 1(%rsp)
	movb	2(%rcx), %al
	movb	%al, 2(%rsp)
	movb	3(%rcx), %al
	movb	%al, 3(%rsp)
	movb	4(%rcx), %al
	movb	%al, 4(%rsp)
	movb	5(%rcx), %al
	movb	%al, 5(%rsp)
	movb	6(%rcx), %al
	movb	%al, 6(%rsp)
	movb	7(%rcx), %al
	movb	%al, 7(%rsp)
	movb	8(%rcx), %al
	movb	%al, 8(%rsp)
	movb	9(%rcx), %al
	movb	%al, 9(%rsp)
	movb	10(%rcx), %al
	movb	%al, 10(%rsp)
	movb	11(%rcx), %al
	movb	%al, 11(%rsp)
	movb	12(%rcx), %al
	movb	%al, 12(%rsp)
	movb	13(%rcx), %al
	movb	%al, 13(%rsp)
	movb	14(%rcx), %al
	movb	%al, 14(%rsp)
	movb	15(%rcx), %al
	movb	%al, 15(%rsp)
	movb	16(%rcx), %al
	movb	%al, 16(%rsp)
	movb	17(%rcx), %al
	movb	%al, 17(%rsp)
	movb	18(%rcx), %al
	movb	%al, 18(%rsp)
	movb	19(%rcx), %al
	movb	%al, 19(%rsp)
	movb	20(%rcx), %al
	movb	%al, 20(%rsp)
	movb	21(%rcx), %al
	movb	%al, 21(%rsp)
	movb	22(%rcx), %al
	movb	%al, 22(%rsp)
	movb	23(%rcx), %al
	movb	%al, 23(%rsp)
	movb	24(%rcx), %al
	movb	%al, 24(%rsp)
	movb	25(%rcx), %al
	movb	%al, 25(%rsp)
	movb	26(%rcx), %al
	movb	%al, 26(%rsp)
	movb	27(%rcx), %al
	movb	%al, 27(%rsp)
	movb	28(%rcx), %al
	movb	%al, 28(%rsp)
	movb	29(%rcx), %al
	movb	%al, 29(%rsp)
	movb	30(%rcx), %al
	movb	%al, 30(%rsp)
	movb	31(%rcx), %al
	movb	%al, 31(%rsp)
	movq	%rsp, %rax
	movq	%rdx, %mm1
	movq	%rdi, %mm3
	movq	%rsi, %mm4
	movq	(%rax), %rcx
	movq	%rcx, 72(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 80(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 88(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 96(%rsp)
	movq	%mm1, %rsi
	leaq	104(%rsp), %rax
	leaq	-216(%rsp), %rsp
	call	L_isha3_256_M1184$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$231:
	leaq	216(%rsp), %rsp
	leaq	136(%rsp), %rax
	leaq	72(%rsp), %rcx
	leaq	-216(%rsp), %rsp
	call	L_sha3_512_64$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$230:
	leaq	216(%rsp), %rsp
	movq	%mm1, %rcx
	leaq	72(%rsp), %rax
	leaq	168(%rsp), %rdx
	movq	%rdx, %mm0
	movq	%rcx, %rsi
	leaq	2616(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$229:
	addq	$384, %rsi
	leaq	3128(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$228:
	addq	$384, %rsi
	leaq	3640(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$227:
	movq	$0, %rdx
	addq	$1152, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$225
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$226:
	movq	(%rcx), %rsi
	movq	%rsi, (%rsp,%rdx,8)
	addq	$8, %rcx
	incq	%rdx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$225:
	cmpq	$4, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$226
	leaq	568(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$224:
	movq	$1, %rax
	movq	%rax, %mm2
	movb	(%rsp), %al
	movb	%al, 32(%rsp)
	movb	1(%rsp), %al
	movb	%al, 33(%rsp)
	movb	2(%rsp), %al
	movb	%al, 34(%rsp)
	movb	3(%rsp), %al
	movb	%al, 35(%rsp)
	movb	4(%rsp), %al
	movb	%al, 36(%rsp)
	movb	5(%rsp), %al
	movb	%al, 37(%rsp)
	movb	6(%rsp), %al
	movb	%al, 38(%rsp)
	movb	7(%rsp), %al
	movb	%al, 39(%rsp)
	movb	8(%rsp), %al
	movb	%al, 40(%rsp)
	movb	9(%rsp), %al
	movb	%al, 41(%rsp)
	movb	10(%rsp), %al
	movb	%al, 42(%rsp)
	movb	11(%rsp), %al
	movb	%al, 43(%rsp)
	movb	12(%rsp), %al
	movb	%al, 44(%rsp)
	movb	13(%rsp), %al
	movb	%al, 45(%rsp)
	movb	14(%rsp), %al
	movb	%al, 46(%rsp)
	movb	15(%rsp), %al
	movb	%al, 47(%rsp)
	movb	16(%rsp), %al
	movb	%al, 48(%rsp)
	movb	17(%rsp), %al
	movb	%al, 49(%rsp)
	movb	18(%rsp), %al
	movb	%al, 50(%rsp)
	movb	19(%rsp), %al
	movb	%al, 51(%rsp)
	movb	20(%rsp), %al
	movb	%al, 52(%rsp)
	movb	21(%rsp), %al
	movb	%al, 53(%rsp)
	movb	22(%rsp), %al
	movb	%al, 54(%rsp)
	movb	23(%rsp), %al
	movb	%al, 55(%rsp)
	movb	24(%rsp), %al
	movb	%al, 56(%rsp)
	movb	25(%rsp), %al
	movb	%al, 57(%rsp)
	movb	26(%rsp), %al
	movb	%al, 58(%rsp)
	movb	27(%rsp), %al
	movb	%al, 59(%rsp)
	movb	28(%rsp), %al
	movb	%al, 60(%rsp)
	movb	29(%rsp), %al
	movb	%al, 61(%rsp)
	movb	30(%rsp), %al
	movb	%al, 62(%rsp)
	movb	31(%rsp), %al
	movb	%al, 63(%rsp)
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$222
	movb	$0, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$223
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$222:
	movb	$0, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$223:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$221:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$208
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$209:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$220:
	movq	%mm5, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$210
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$211:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$212
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$210
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$212:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$218
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$219
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$218:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$219:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	8760(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$206
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$207:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$206:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$207
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$204
	movb	$0, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$205
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$204:
	movb	$1, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$205:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$203:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$190
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$191:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$202:
	movq	%mm5, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$192
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$193:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$194
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$192
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$194:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$200
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$201
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$200:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$201:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	9272(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$188
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$189:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$188:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$189
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$186
	movb	$0, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$187
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$186:
	movb	$2, 64(%rsp)
	movb	$0, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$187:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$185:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$172
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$173:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$184:
	movq	%mm5, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$174
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$175:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$176
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$174
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$176:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$182
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$183
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$182:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$183:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	9784(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$170
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$171:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$170:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$171
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$168
	movb	$1, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$169
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$168:
	movb	$0, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$169:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$167:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$154
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$155:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$166:
	movq	%mm5, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$156
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$157:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$158
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$156
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$158:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$164
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$165
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$164:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$165:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	10296(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$152
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$153:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$152:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$153
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$150
	movb	$1, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$151
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$150:
	movb	$1, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$151:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$149:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$136
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$137:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$148:
	movq	%mm5, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$138
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$139:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$140
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$138
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$140:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$146
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$147
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$146:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$147:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	10808(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$134
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$135:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$134:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$135
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$132
	movb	$1, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$133
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$132:
	movb	$2, 64(%rsp)
	movb	$1, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$133:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$131:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$118
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$119:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$130:
	movq	%mm5, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$120
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$121:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$122
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$120
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$122:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$128
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$129
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$128:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$129:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	11320(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$116
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$117:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$116:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$117
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$114
	movb	$2, 64(%rsp)
	movb	$0, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$115
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$114:
	movb	$0, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$115:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$113:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$100
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$101:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$112:
	movq	%mm5, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$102
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$103:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$104
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$102
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$104:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$110
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$111
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$110:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$111:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	11832(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$98
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$99:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$98:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$99
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$96
	movb	$2, 64(%rsp)
	movb	$1, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$97
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$96:
	movb	$1, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$97:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$95:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$82
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$83:
	movq	%rcx, %mm5
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$94:
	movq	%mm5, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$84
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$85:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$86
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$84
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$86:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$92
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$93
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$92:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$93:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	12344(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$80
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$81:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$80:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$81
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$78
	movb	$2, 64(%rsp)
	movb	$2, 65(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$79
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$78:
	movb	$2, 64(%rsp)
	movb	$2, 65(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$79:
	leaq	368(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$77:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$64
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$65:
	movq	%rcx, %mm2
	leaq	368(%rsp), %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$76:
	movq	%mm2, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$66
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$67:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$68
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$66
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$68:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	200(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	201(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	202(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$74
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$75
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$74:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 1080(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$75:
	cmpw	$3329, %r8w
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
	movw	%r8w, 1080(%rsp,%rcx,2)
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
	leaq	12856(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$62
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$63:
	movw	1080(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$62:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$63
	movb	$0, %al
	leaq	4152(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$61:
	leaq	168(%rsp), %rsp
	movb	$1, %al
	leaq	4664(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$60:
	leaq	168(%rsp), %rsp
	movb	$2, %al
	leaq	5176(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$59:
	leaq	168(%rsp), %rsp
	movb	$3, %al
	leaq	5688(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$58:
	leaq	168(%rsp), %rsp
	movb	$4, %al
	leaq	6200(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$57:
	leaq	168(%rsp), %rsp
	movb	$5, %al
	leaq	6712(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$56:
	leaq	168(%rsp), %rsp
	movb	$6, %al
	leaq	1080(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$55:
	leaq	168(%rsp), %rsp
	leaq	4152(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$54:
	leaq	4664(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$53:
	leaq	5176(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$52:
	leaq	7224(%rsp), %rdi
	leaq	8760(%rsp), %rcx
	leaq	4152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$51:
	leaq	16(%rsp), %rsp
	leaq	1592(%rsp), %rdi
	leaq	9272(%rsp), %rcx
	leaq	4664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$50:
	leaq	16(%rsp), %rsp
	leaq	7224(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$49:
	leaq	1592(%rsp), %rdi
	leaq	9784(%rsp), %rcx
	leaq	5176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$48:
	leaq	16(%rsp), %rsp
	leaq	7224(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$47:
	leaq	7224(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$45
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$46:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$45:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$46
	leaq	7736(%rsp), %rdi
	leaq	10296(%rsp), %rcx
	leaq	4152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$44:
	leaq	16(%rsp), %rsp
	leaq	1592(%rsp), %rdi
	leaq	10808(%rsp), %rcx
	leaq	4664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$43:
	leaq	16(%rsp), %rsp
	leaq	7736(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$42:
	leaq	1592(%rsp), %rdi
	leaq	11320(%rsp), %rcx
	leaq	5176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$41:
	leaq	16(%rsp), %rsp
	leaq	7736(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$40:
	leaq	7736(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$38
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$39:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$38:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$39
	leaq	8248(%rsp), %rdi
	leaq	11832(%rsp), %rcx
	leaq	4152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$37:
	leaq	16(%rsp), %rsp
	leaq	1592(%rsp), %rdi
	leaq	12344(%rsp), %rcx
	leaq	4664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$36:
	leaq	16(%rsp), %rsp
	leaq	8248(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$35:
	leaq	1592(%rsp), %rdi
	leaq	12856(%rsp), %rcx
	leaq	5176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$34:
	leaq	16(%rsp), %rsp
	leaq	8248(%rsp), %rcx
	leaq	1592(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$33:
	leaq	8248(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$31
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$32:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$31:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$32
	leaq	1592(%rsp), %rdi
	leaq	2616(%rsp), %rcx
	leaq	4152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$30:
	leaq	16(%rsp), %rsp
	leaq	2104(%rsp), %rdi
	leaq	3128(%rsp), %rcx
	leaq	4664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$29:
	leaq	16(%rsp), %rsp
	leaq	1592(%rsp), %rcx
	leaq	2104(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$28:
	leaq	2104(%rsp), %rdi
	leaq	3640(%rsp), %rcx
	leaq	5176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$27:
	leaq	16(%rsp), %rsp
	leaq	1592(%rsp), %rcx
	leaq	2104(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$26:
	leaq	1592(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$24
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$25:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$24:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$25
	leaq	7224(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$23:
	leaq	7736(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$22:
	leaq	8248(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$21:
	leaq	1592(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$20:
	leaq	7224(%rsp), %rcx
	leaq	5688(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$19:
	leaq	7736(%rsp), %rcx
	leaq	6200(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$18:
	leaq	8248(%rsp), %rcx
	leaq	6712(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$17:
	leaq	1592(%rsp), %rcx
	leaq	1080(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$16:
	leaq	1592(%rsp), %rcx
	leaq	568(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$15:
	leaq	7224(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$13
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$14:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$13:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$14
	leaq	7736(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$11
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$12:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$11:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$12
	leaq	8248(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$9
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$10:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$9:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$10
	leaq	1592(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$7
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$8:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$7:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$8
	movq	%mm3, %rax
	movq	$0, %rdx
	movq	$0, %r9
	leaq	7224(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$6:
	leaq	7736(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$5:
	leaq	8248(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$4:
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$2
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$3:
	movzwq	7224(%rsp,%rdx,2), %rcx
	incq	%rdx
	shlq	$10, %rcx
	addq	$1665, %rcx
	imulq	$1290167, %rcx, %rcx
	shrq	$32, %rcx
	andq	$1023, %rcx
	movzwq	7224(%rsp,%rdx,2), %rsi
	incq	%rdx
	shlq	$10, %rsi
	addq	$1665, %rsi
	imulq	$1290167, %rsi, %rsi
	shrq	$32, %rsi
	andq	$1023, %rsi
	movzwq	7224(%rsp,%rdx,2), %rdi
	incq	%rdx
	shlq	$10, %rdi
	addq	$1665, %rdi
	imulq	$1290167, %rdi, %rdi
	shrq	$32, %rdi
	andq	$1023, %rdi
	movzwq	7224(%rsp,%rdx,2), %r8
	incq	%rdx
	shlq	$10, %r8
	addq	$1665, %r8
	imulq	$1290167, %r8, %r8
	shrq	$32, %r8
	andq	$1023, %r8
	movw	%cx, %r10w
	andw	$255, %r10w
	movb	%r10b, (%rax,%r9)
	incq	%r9
	shrw	$8, %cx
	movw	%si, %r10w
	shlw	$2, %r10w
	orw 	%cx, %r10w
	movb	%r10b, (%rax,%r9)
	incq	%r9
	shrw	$6, %si
	movw	%di, %cx
	shlw	$4, %cx
	orw 	%si, %cx
	movb	%cl, (%rax,%r9)
	incq	%r9
	shrw	$4, %di
	movw	%r8w, %cx
	shlw	$6, %cx
	orw 	%di, %cx
	movb	%cl, (%rax,%r9)
	incq	%r9
	shrq	$2, %r8
	movb	%r8b, (%rax,%r9)
	incq	%r9
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$2:
	cmpq	$765, %rdx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$3
	addq	$960, %rax
	leaq	1592(%rsp), %rcx
	call	L_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$1:
	movq	%mm4, %rax
	movq	136(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	144(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	152(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	160(%rsp), %rcx
	movq	%rcx, 24(%rax)
	xorq	%rax, %rax
	movq	13368(%rsp), %rbx
	movq	13376(%rsp), %rbp
	movq	13384(%rsp), %r12
	movq	13392(%rsp), %r13
	movq	13400(%rsp), %r14
	movq	13408(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand:
jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand:
	movq	%rsp, %rax
	leaq	-10416(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 10368(%rsp)
	movq	%rbp, 10376(%rsp)
	movq	%r12, 10384(%rsp)
	movq	%r13, 10392(%rsp)
	movq	%r14, 10400(%rsp)
	movq	%rax, 10408(%rsp)
	lfence
	movq	$0, %rax
	movb	(%rdx), %al
	movb	%al, 144(%rsp)
	movb	1(%rdx), %al
	movb	%al, 145(%rsp)
	movb	2(%rdx), %al
	movb	%al, 146(%rsp)
	movb	3(%rdx), %al
	movb	%al, 147(%rsp)
	movb	4(%rdx), %al
	movb	%al, 148(%rsp)
	movb	5(%rdx), %al
	movb	%al, 149(%rsp)
	movb	6(%rdx), %al
	movb	%al, 150(%rsp)
	movb	7(%rdx), %al
	movb	%al, 151(%rsp)
	movb	8(%rdx), %al
	movb	%al, 152(%rsp)
	movb	9(%rdx), %al
	movb	%al, 153(%rsp)
	movb	10(%rdx), %al
	movb	%al, 154(%rsp)
	movb	11(%rdx), %al
	movb	%al, 155(%rsp)
	movb	12(%rdx), %al
	movb	%al, 156(%rsp)
	movb	13(%rdx), %al
	movb	%al, 157(%rsp)
	movb	14(%rdx), %al
	movb	%al, 158(%rsp)
	movb	15(%rdx), %al
	movb	%al, 159(%rsp)
	movb	16(%rdx), %al
	movb	%al, 160(%rsp)
	movb	17(%rdx), %al
	movb	%al, 161(%rsp)
	movb	18(%rdx), %al
	movb	%al, 162(%rsp)
	movb	19(%rdx), %al
	movb	%al, 163(%rsp)
	movb	20(%rdx), %al
	movb	%al, 164(%rsp)
	movb	21(%rdx), %al
	movb	%al, 165(%rsp)
	movb	22(%rdx), %al
	movb	%al, 166(%rsp)
	movb	23(%rdx), %al
	movb	%al, 167(%rsp)
	movb	24(%rdx), %al
	movb	%al, 168(%rsp)
	movb	25(%rdx), %al
	movb	%al, 169(%rsp)
	movb	26(%rdx), %al
	movb	%al, 170(%rsp)
	movb	27(%rdx), %al
	movb	%al, 171(%rsp)
	movb	28(%rdx), %al
	movb	%al, 172(%rsp)
	movb	29(%rdx), %al
	movb	%al, 173(%rsp)
	movb	30(%rdx), %al
	movb	%al, 174(%rsp)
	movb	31(%rdx), %al
	movb	%al, 175(%rsp)
	movb	32(%rdx), %al
	movb	%al, 176(%rsp)
	movb	33(%rdx), %al
	movb	%al, 177(%rsp)
	movb	34(%rdx), %al
	movb	%al, 178(%rsp)
	movb	35(%rdx), %al
	movb	%al, 179(%rsp)
	movb	36(%rdx), %al
	movb	%al, 180(%rsp)
	movb	37(%rdx), %al
	movb	%al, 181(%rsp)
	movb	38(%rdx), %al
	movb	%al, 182(%rsp)
	movb	39(%rdx), %al
	movb	%al, 183(%rsp)
	movb	40(%rdx), %al
	movb	%al, 184(%rsp)
	movb	41(%rdx), %al
	movb	%al, 185(%rsp)
	movb	42(%rdx), %al
	movb	%al, 186(%rsp)
	movb	43(%rdx), %al
	movb	%al, 187(%rsp)
	movb	44(%rdx), %al
	movb	%al, 188(%rsp)
	movb	45(%rdx), %al
	movb	%al, 189(%rsp)
	movb	46(%rdx), %al
	movb	%al, 190(%rsp)
	movb	47(%rdx), %al
	movb	%al, 191(%rsp)
	movb	48(%rdx), %al
	movb	%al, 192(%rsp)
	movb	49(%rdx), %al
	movb	%al, 193(%rsp)
	movb	50(%rdx), %al
	movb	%al, 194(%rsp)
	movb	51(%rdx), %al
	movb	%al, 195(%rsp)
	movb	52(%rdx), %al
	movb	%al, 196(%rsp)
	movb	53(%rdx), %al
	movb	%al, 197(%rsp)
	movb	54(%rdx), %al
	movb	%al, 198(%rsp)
	movb	55(%rdx), %al
	movb	%al, 199(%rsp)
	movb	56(%rdx), %al
	movb	%al, 200(%rsp)
	movb	57(%rdx), %al
	movb	%al, 201(%rsp)
	movb	58(%rdx), %al
	movb	%al, 202(%rsp)
	movb	59(%rdx), %al
	movb	%al, 203(%rsp)
	movb	60(%rdx), %al
	movb	%al, 204(%rsp)
	movb	61(%rdx), %al
	movb	%al, 205(%rsp)
	movb	62(%rdx), %al
	movb	%al, 206(%rsp)
	movb	63(%rdx), %al
	movb	%al, 207(%rsp)
	leaq	144(%rsp), %rax
	movq	%rax, %mm3
	movq	%rdi, %mm4
	movq	%rsi, %mm5
	movq	(%rax), %rcx
	movq	%rcx, 64(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 72(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 80(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 88(%rsp)
	movb	$3, 96(%rsp)
	leaq	208(%rsp), %rax
	leaq	64(%rsp), %rcx
	leaq	-216(%rsp), %rsp
	call	L_sha3512_33$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$215:
	leaq	216(%rsp), %rsp
	movq	208(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	240(%rsp), %rax
	movq	%rax, (%rsp)
	movq	216(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	248(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	224(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	256(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	232(%rsp), %rax
	movq	%rax, 56(%rsp)
	movq	264(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	%rsp, %rax
	movq	%rax, %mm0
	movq	$0, %rax
	movq	%rax, %mm2
	movb	32(%rsp), %al
	movb	%al, 104(%rsp)
	movb	33(%rsp), %al
	movb	%al, 105(%rsp)
	movb	34(%rsp), %al
	movb	%al, 106(%rsp)
	movb	35(%rsp), %al
	movb	%al, 107(%rsp)
	movb	36(%rsp), %al
	movb	%al, 108(%rsp)
	movb	37(%rsp), %al
	movb	%al, 109(%rsp)
	movb	38(%rsp), %al
	movb	%al, 110(%rsp)
	movb	39(%rsp), %al
	movb	%al, 111(%rsp)
	movb	40(%rsp), %al
	movb	%al, 112(%rsp)
	movb	41(%rsp), %al
	movb	%al, 113(%rsp)
	movb	42(%rsp), %al
	movb	%al, 114(%rsp)
	movb	43(%rsp), %al
	movb	%al, 115(%rsp)
	movb	44(%rsp), %al
	movb	%al, 116(%rsp)
	movb	45(%rsp), %al
	movb	%al, 117(%rsp)
	movb	46(%rsp), %al
	movb	%al, 118(%rsp)
	movb	47(%rsp), %al
	movb	%al, 119(%rsp)
	movb	48(%rsp), %al
	movb	%al, 120(%rsp)
	movb	49(%rsp), %al
	movb	%al, 121(%rsp)
	movb	50(%rsp), %al
	movb	%al, 122(%rsp)
	movb	51(%rsp), %al
	movb	%al, 123(%rsp)
	movb	52(%rsp), %al
	movb	%al, 124(%rsp)
	movb	53(%rsp), %al
	movb	%al, 125(%rsp)
	movb	54(%rsp), %al
	movb	%al, 126(%rsp)
	movb	55(%rsp), %al
	movb	%al, 127(%rsp)
	movb	56(%rsp), %al
	movb	%al, 128(%rsp)
	movb	57(%rsp), %al
	movb	%al, 129(%rsp)
	movb	58(%rsp), %al
	movb	%al, 130(%rsp)
	movb	59(%rsp), %al
	movb	%al, 131(%rsp)
	movb	60(%rsp), %al
	movb	%al, 132(%rsp)
	movb	61(%rsp), %al
	movb	%al, 133(%rsp)
	movb	62(%rsp), %al
	movb	%al, 134(%rsp)
	movb	63(%rsp), %al
	movb	%al, 135(%rsp)
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$213
	movb	$0, 136(%rsp)
	movb	$0, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$214
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$213:
	movb	$0, 136(%rsp)
	movb	$0, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$214:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$212:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$199
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$200:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$211:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$201
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$203:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$209
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$210
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$209:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$210:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	5760(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$197
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$198:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$197:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$198
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$195
	movb	$0, 136(%rsp)
	movb	$1, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$196
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$195:
	movb	$1, 136(%rsp)
	movb	$0, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$196:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$194:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$181
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$182:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$193:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$183
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$185:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$191
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$192
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$191:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$192:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	6272(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$179
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$180:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$179:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$180
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$177
	movb	$0, 136(%rsp)
	movb	$2, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$178
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$177:
	movb	$2, 136(%rsp)
	movb	$0, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$178:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$176:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$163
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$164:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$175:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$165
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$167:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$173
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$174
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$173:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$174:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	6784(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$161
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$162:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$161:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$162
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$159
	movb	$1, 136(%rsp)
	movb	$0, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$160
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$159:
	movb	$0, 136(%rsp)
	movb	$1, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$160:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$158:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$145
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$146:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$157:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$147
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$149:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$155
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$156
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$155:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$156:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	7296(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$143
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$144:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$143:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$144
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$141
	movb	$1, 136(%rsp)
	movb	$1, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$142
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$141:
	movb	$1, 136(%rsp)
	movb	$1, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$142:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$140:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$127
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$128:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$139:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$129
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$131:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$137
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$138
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$137:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$138:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	7808(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$125
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$126:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$125:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$126
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$123
	movb	$1, 136(%rsp)
	movb	$2, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$124
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$123:
	movb	$2, 136(%rsp)
	movb	$1, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$124:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$122:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$109
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$110:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$121:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$111
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$113:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$119
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$120
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$119:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$120:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	8320(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$107
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$108:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$107:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$108
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$105
	movb	$2, 136(%rsp)
	movb	$0, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$106
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$105:
	movb	$0, 136(%rsp)
	movb	$2, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$106:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$104:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$91
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$92:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$103:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$93
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$95:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$101
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$102
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$101:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$102:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	8832(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$89
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$90:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$89:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$90
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$87
	movb	$2, 136(%rsp)
	movb	$1, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$88
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$87:
	movb	$1, 136(%rsp)
	movb	$2, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$88:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$86:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$73
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$74:
	movq	%rcx, %mm6
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$85:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$75
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$77:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$83
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$84
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$83:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$84:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	9344(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$71
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$72:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$71:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$72
	movq	%mm2, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$69
	movb	$2, 136(%rsp)
	movb	$2, 137(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$70
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$69:
	movb	$2, 136(%rsp)
	movb	$2, 137(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$70:
	leaq	440(%rsp), %rax
	leaq	104(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$68:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$55
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$56:
	movq	%rcx, %mm2
	leaq	440(%rsp), %rax
	leaq	272(%rsp), %rcx
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$67:
	movq	%mm2, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$57
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$58:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$59
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$57
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$59:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	272(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	273(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	274(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$65
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$66
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$65:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 640(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$66:
	cmpw	$3329, %r8w
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
	movw	%r8w, 640(%rsp,%rcx,2)
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
	leaq	9856(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$53
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$54:
	movw	640(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$53:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$54
	movb	$0, %al
	leaq	1152(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$52:
	leaq	168(%rsp), %rsp
	movb	$1, %al
	leaq	1664(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$51:
	leaq	168(%rsp), %rsp
	movb	$2, %al
	leaq	2176(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$50:
	leaq	168(%rsp), %rsp
	movb	$3, %al
	leaq	2688(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$49:
	leaq	168(%rsp), %rsp
	movb	$4, %al
	leaq	3200(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$48:
	leaq	168(%rsp), %rsp
	movb	$5, %al
	leaq	3712(%rsp), %rcx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$47:
	leaq	168(%rsp), %rsp
	leaq	1152(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$46:
	leaq	1664(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$45:
	leaq	2176(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$44:
	leaq	2688(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$43:
	leaq	3200(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$42:
	leaq	3712(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$41:
	leaq	4224(%rsp), %rdi
	leaq	5760(%rsp), %rcx
	leaq	1152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$40:
	leaq	16(%rsp), %rsp
	leaq	640(%rsp), %rdi
	leaq	6272(%rsp), %rcx
	leaq	1664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$39:
	leaq	16(%rsp), %rsp
	leaq	4224(%rsp), %rcx
	leaq	640(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$38:
	leaq	640(%rsp), %rdi
	leaq	6784(%rsp), %rcx
	leaq	2176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$37:
	leaq	16(%rsp), %rsp
	leaq	4224(%rsp), %rcx
	leaq	640(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$36:
	leaq	4224(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$34
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$35:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$34:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$35
	leaq	4224(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$33:
	leaq	4736(%rsp), %rdi
	leaq	7296(%rsp), %rcx
	leaq	1152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$32:
	leaq	16(%rsp), %rsp
	leaq	640(%rsp), %rdi
	leaq	7808(%rsp), %rcx
	leaq	1664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$31:
	leaq	16(%rsp), %rsp
	leaq	4736(%rsp), %rcx
	leaq	640(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$30:
	leaq	640(%rsp), %rdi
	leaq	8320(%rsp), %rcx
	leaq	2176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$29:
	leaq	16(%rsp), %rsp
	leaq	4736(%rsp), %rcx
	leaq	640(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$28:
	leaq	4736(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$26
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$27:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$26:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$27
	leaq	4736(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$25:
	leaq	5248(%rsp), %rdi
	leaq	8832(%rsp), %rcx
	leaq	1152(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$24:
	leaq	16(%rsp), %rsp
	leaq	640(%rsp), %rdi
	leaq	9344(%rsp), %rcx
	leaq	1664(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$23:
	leaq	16(%rsp), %rsp
	leaq	5248(%rsp), %rcx
	leaq	640(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$22:
	leaq	640(%rsp), %rdi
	leaq	9856(%rsp), %rcx
	leaq	2176(%rsp), %rsi
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$21:
	leaq	16(%rsp), %rsp
	leaq	5248(%rsp), %rcx
	leaq	640(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$20:
	leaq	5248(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$18
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$19:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$18:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$19
	leaq	5248(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$17:
	leaq	4224(%rsp), %rcx
	leaq	2688(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$16:
	leaq	4736(%rsp), %rcx
	leaq	3200(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$15:
	leaq	5248(%rsp), %rcx
	leaq	3712(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$14:
	leaq	4224(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$12
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$13:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$12:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$13
	leaq	4736(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$10
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$11:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$10:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$11
	leaq	5248(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$9:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$8:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$9
	movq	%mm4, %rax
	movq	%mm5, %rcx
	movq	%rcx, %rdx
	leaq	1152(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$7:
	addq	$384, %rdx
	leaq	1664(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$6:
	addq	$384, %rdx
	leaq	2176(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$5:
	movq	%rax, %rdx
	leaq	4224(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$4:
	addq	$384, %rdx
	leaq	4736(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$3:
	addq	$384, %rdx
	leaq	5248(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$2:
	addq	$1152, %rax
	movq	32(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	40(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	48(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	56(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	%mm5, %rax
	addq	$1152, %rax
	movq	%mm4, %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	8(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	16(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	24(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	32(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	40(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	48(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	56(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	64(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	72(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	80(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	88(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	96(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	104(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	112(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	120(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	128(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	136(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	144(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	152(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	160(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	168(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	176(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	184(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	192(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	200(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	208(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	216(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	224(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	232(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	240(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	248(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	256(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	264(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	272(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	280(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	288(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	296(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	304(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	312(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	320(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	328(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	336(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	344(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	352(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	360(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	368(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	376(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	384(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	392(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	400(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	408(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	416(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	424(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	432(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	440(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	448(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	456(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	464(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	472(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	480(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	488(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	496(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	504(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	512(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	520(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	528(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	536(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	544(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	552(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	560(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	568(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	576(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	584(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	592(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	600(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	608(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	616(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	624(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	632(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	640(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	648(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	656(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	664(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	672(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	680(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	688(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	696(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	704(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	712(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	720(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	728(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	736(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	744(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	752(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	760(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	768(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	776(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	784(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	792(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	800(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	808(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	816(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	824(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	832(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	840(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	848(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	856(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	864(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	872(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	880(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	888(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	896(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	904(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	912(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	920(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	928(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	936(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	944(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	952(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	960(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	968(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	976(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	984(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	992(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1000(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1008(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1016(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1024(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1032(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1040(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1048(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1056(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1064(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1072(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1080(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1088(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1096(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1104(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1112(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1120(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1128(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1136(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1144(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1152(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1160(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1168(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	1176(%rcx), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	%rax, %mm1
	movq	%mm4, %rsi
	leaq	32(%rsp), %rax
	leaq	-216(%rsp), %rsp
	call	L_isha3_256_M1184$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$1:
	leaq	216(%rsp), %rsp
	movq	%mm1, %rax
	movq	32(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	40(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	48(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	56(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	%mm3, %rcx
	leaq	32(%rcx), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	8(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	16(%rcx), %rdx
	movq	%rdx, (%rax)
	addq	$8, %rax
	movq	24(%rcx), %rcx
	movq	%rcx, (%rax)
	xorq	%rax, %rax
	movq	10368(%rsp), %rbx
	movq	10376(%rsp), %rbp
	movq	10384(%rsp), %r12
	movq	10392(%rsp), %r13
	movq	10400(%rsp), %r14
	movq	10408(%rsp), %rsp
	ret
L_i_poly_tomsg$1:
	call	L_poly_csubq$1
L_i_poly_tomsg$2:
	movb	$0, %sil
	movw	(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	2(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	4(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	6(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	8(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	10(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	12(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	14(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, (%rax)
	movb	$0, %sil
	movw	16(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	18(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	20(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	22(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	24(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	26(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	28(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	30(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 1(%rax)
	movb	$0, %sil
	movw	32(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	34(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	36(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	38(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	40(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	42(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	44(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	46(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 2(%rax)
	movb	$0, %sil
	movw	48(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	50(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	52(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	54(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	56(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	58(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	60(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	62(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 3(%rax)
	movb	$0, %sil
	movw	64(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	66(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	68(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	70(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	72(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	74(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	76(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	78(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 4(%rax)
	movb	$0, %sil
	movw	80(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	82(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	84(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	86(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	88(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	90(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	92(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	94(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 5(%rax)
	movb	$0, %sil
	movw	96(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	98(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	100(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	102(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	104(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	106(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	108(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	110(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 6(%rax)
	movb	$0, %sil
	movw	112(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	114(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	116(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	118(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	120(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	122(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	124(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	126(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 7(%rax)
	movb	$0, %sil
	movw	128(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	130(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	132(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	134(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	136(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	138(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	140(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	142(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 8(%rax)
	movb	$0, %sil
	movw	144(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	146(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	148(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	150(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	152(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	154(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	156(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	158(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 9(%rax)
	movb	$0, %sil
	movw	160(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	162(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	164(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	166(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	168(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	170(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	172(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	174(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 10(%rax)
	movb	$0, %sil
	movw	176(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	178(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	180(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	182(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	184(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	186(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	188(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	190(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 11(%rax)
	movb	$0, %sil
	movw	192(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	194(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	196(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	198(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	200(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	202(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	204(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	206(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 12(%rax)
	movb	$0, %sil
	movw	208(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	210(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	212(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	214(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	216(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	218(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	220(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	222(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 13(%rax)
	movb	$0, %sil
	movw	224(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	226(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	228(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	230(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	232(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	234(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	236(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	238(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 14(%rax)
	movb	$0, %sil
	movw	240(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	242(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	244(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	246(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	248(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	250(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	252(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	254(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 15(%rax)
	movb	$0, %sil
	movw	256(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	258(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	260(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	262(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	264(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	266(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	268(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	270(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 16(%rax)
	movb	$0, %sil
	movw	272(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	274(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	276(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	278(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	280(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	282(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	284(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	286(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 17(%rax)
	movb	$0, %sil
	movw	288(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	290(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	292(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	294(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	296(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	298(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	300(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	302(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 18(%rax)
	movb	$0, %sil
	movw	304(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	306(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	308(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	310(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	312(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	314(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	316(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	318(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 19(%rax)
	movb	$0, %sil
	movw	320(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	322(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	324(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	326(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	328(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	330(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	332(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	334(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 20(%rax)
	movb	$0, %sil
	movw	336(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	338(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	340(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	342(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	344(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	346(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	348(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	350(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 21(%rax)
	movb	$0, %sil
	movw	352(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	354(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	356(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	358(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	360(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	362(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	364(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	366(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 22(%rax)
	movb	$0, %sil
	movw	368(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	370(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	372(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	374(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	376(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	378(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	380(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	382(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 23(%rax)
	movb	$0, %sil
	movw	384(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	386(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	388(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	390(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	392(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	394(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	396(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	398(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 24(%rax)
	movb	$0, %sil
	movw	400(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	402(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	404(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	406(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	408(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	410(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	412(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	414(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 25(%rax)
	movb	$0, %sil
	movw	416(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	418(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	420(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	422(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	424(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	426(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	428(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	430(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 26(%rax)
	movb	$0, %sil
	movw	432(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	434(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	436(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	438(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	440(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	442(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	444(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	446(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 27(%rax)
	movb	$0, %sil
	movw	448(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	450(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	452(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	454(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	456(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	458(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	460(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	462(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 28(%rax)
	movb	$0, %sil
	movw	464(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	466(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	468(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	470(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	472(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	474(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	476(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	478(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 29(%rax)
	movb	$0, %sil
	movw	480(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	482(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	484(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	486(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	488(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	490(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	492(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	494(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$7, %edi
	orb 	%dil, %sil
	movb	%sil, 30(%rax)
	movb	$0, %sil
	movw	496(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$0, %edi
	orb 	%dil, %sil
	movw	498(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$1, %edi
	orb 	%dil, %sil
	movw	500(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$2, %edi
	orb 	%dil, %sil
	movw	502(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$3, %edi
	orb 	%dil, %sil
	movw	504(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$4, %edi
	orb 	%dil, %sil
	movw	506(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$5, %edi
	orb 	%dil, %sil
	movw	508(%rcx), %di
	movzwl	%di, %edi
	shll	$1, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$1, %edi
	shll	$6, %edi
	orb 	%dil, %sil
	movw	510(%rcx), %cx
	movzwl	%cx, %ecx
	shll	$1, %ecx
	addl	$1665, %ecx
	imull	$80635, %ecx, %ecx
	shrl	$28, %ecx
	andl	$1, %ecx
	shll	$7, %ecx
	orb 	%cl, %sil
	movb	%sil, 31(%rax)
	ret
L_poly_tobytes$1:
	call	L_poly_csubq$1
L_poly_tobytes$4:
	movq	$0, %rsi
	movq	$0, %rdi
	jmp 	L_poly_tobytes$2
L_poly_tobytes$3:
	movw	(%rcx,%rsi,2), %r8w
	incq	%rsi
	movw	(%rcx,%rsi,2), %r9w
	incq	%rsi
	movw	%r8w, %r10w
	andw	$255, %r10w
	movb	%r10b, (%rdx,%rdi)
	incq	%rdi
	shrw	$8, %r8w
	movw	%r9w, %r10w
	andw	$15, %r10w
	shlw	$4, %r10w
	orw 	%r8w, %r10w
	movb	%r10b, (%rdx,%rdi)
	incq	%rdi
	shrw	$4, %r9w
	movb	%r9b, (%rdx,%rdi)
	incq	%rdi
L_poly_tobytes$2:
	cmpq	$256, %rsi
	jb  	L_poly_tobytes$3
	ret
L_poly_sub$1:
	movq	$0, %r8
	jmp 	L_poly_sub$2
L_poly_sub$3:
	movw	(%rsi,%r8,2), %r9w
	movw	(%rdi,%r8,2), %r10w
	subw	%r10w, %r9w
	movw	%r9w, (%rcx,%r8,2)
	incq	%r8
L_poly_sub$2:
	cmpq	$256, %r8
	jb  	L_poly_sub$3
	ret
L_poly_ntt$1:
	leaq	glob_data + 448(%rip), %rsi
	movq	$0, %rdi
	movq	$128, %r8
	jmp 	L_poly_ntt$4
L_poly_ntt$5:
	movq	$0, %r11
	jmp 	L_poly_ntt$6
L_poly_ntt$7:
	incq	%rdi
	movw	(%rsi,%rdi,2), %r9w
	movq	%r11, %r10
	addq	%r8, %r11
	jmp 	L_poly_ntt$8
L_poly_ntt$9:
	movw	(%rcx,%r10,2), %bx
	movw	%bx, %bp
	movq	%r10, %r12
	addq	%r8, %r12
	movw	(%rcx,%r12,2), %r13w
	movswl	%r13w, %r13d
	movswl	%r9w, %r14d
	imull	%r14d, %r13d
	imull	$-218038272, %r13d, %r14d
	sarl	$16, %r14d
	imull	$-3329, %r14d, %r14d
	addl	%r13d, %r14d
	sarl	$16, %r14d
	subw	%r14w, %bp
	addw	%bx, %r14w
	movw	%bp, (%rcx,%r12,2)
	movw	%r14w, (%rcx,%r10,2)
	incq	%r10
L_poly_ntt$8:
	cmpq	%r11, %r10
	jb  	L_poly_ntt$9
	movq	%r10, %r11
	addq	%r8, %r11
L_poly_ntt$6:
	cmpq	$256, %r11
	jb  	L_poly_ntt$7
	shrq	$1, %r8
L_poly_ntt$4:
	cmpq	$2, %r8
	jnb 	L_poly_ntt$5
	movq	$0, %rsi
	jmp 	L_poly_ntt$2
L_poly_ntt$3:
	movw	(%rcx,%rsi,2), %di
	movswl	%di, %r8d
	imull	$20159, %r8d, %r8d
	sarl	$26, %r8d
	imull	$3329, %r8d, %r8d
	subw	%r8w, %di
	movw	%di, (%rcx,%rsi,2)
	incq	%rsi
L_poly_ntt$2:
	cmpq	$256, %rsi
	jb  	L_poly_ntt$3
	ret
L_poly_invntt$1:
	leaq	glob_data + 192(%rip), %rsi
	movq	$0, %rdi
	movq	$2, %r8
	jmp 	L_poly_invntt$4
L_poly_invntt$5:
	movq	$0, %r11
	jmp 	L_poly_invntt$6
L_poly_invntt$7:
	movw	(%rsi,%rdi,2), %r9w
	incq	%rdi
	movq	%r11, %r10
	addq	%r8, %r11
	jmp 	L_poly_invntt$8
L_poly_invntt$9:
	movw	(%rcx,%r10,2), %bx
	movq	%r10, %rbp
	addq	%r8, %rbp
	movw	(%rcx,%rbp,2), %r12w
	movw	%r12w, %r13w
	addw	%bx, %r13w
	movswl	%r13w, %r14d
	imull	$20159, %r14d, %r14d
	sarl	$26, %r14d
	imull	$3329, %r14d, %r14d
	subw	%r14w, %r13w
	movw	%r13w, (%rcx,%r10,2)
	subw	%r12w, %bx
	movswl	%bx, %ebx
	movswl	%r9w, %r12d
	imull	%r12d, %ebx
	imull	$-218038272, %ebx, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r12d
	addl	%ebx, %r12d
	sarl	$16, %r12d
	movw	%r12w, (%rcx,%rbp,2)
	incq	%r10
L_poly_invntt$8:
	cmpq	%r11, %r10
	jb  	L_poly_invntt$9
	movq	%r10, %r11
	addq	%r8, %r11
L_poly_invntt$6:
	cmpq	$256, %r11
	jb  	L_poly_invntt$7
	shlq	$1, %r8
L_poly_invntt$4:
	cmpq	$128, %r8
	jbe 	L_poly_invntt$5
	movw	254(%rsi), %si
	movq	$0, %rdi
	jmp 	L_poly_invntt$2
L_poly_invntt$3:
	movw	(%rcx,%rdi,2), %r8w
	movswl	%r8w, %r8d
	movswl	%si, %r9d
	imull	%r9d, %r8d
	imull	$-218038272, %r8d, %r9d
	sarl	$16, %r9d
	imull	$-3329, %r9d, %r9d
	addl	%r8d, %r9d
	sarl	$16, %r9d
	movw	%r9w, (%rcx,%rdi,2)
	incq	%rdi
L_poly_invntt$2:
	cmpq	$256, %rdi
	jb  	L_poly_invntt$3
	ret
L_poly_getnoise$1:
	movq	%rcx, %mm1
	movq	%mm0, %rcx
	movb	(%rcx), %dl
	movb	%dl, 8(%rsp)
	movb	1(%rcx), %dl
	movb	%dl, 9(%rsp)
	movb	2(%rcx), %dl
	movb	%dl, 10(%rsp)
	movb	3(%rcx), %dl
	movb	%dl, 11(%rsp)
	movb	4(%rcx), %dl
	movb	%dl, 12(%rsp)
	movb	5(%rcx), %dl
	movb	%dl, 13(%rsp)
	movb	6(%rcx), %dl
	movb	%dl, 14(%rsp)
	movb	7(%rcx), %dl
	movb	%dl, 15(%rsp)
	movb	8(%rcx), %dl
	movb	%dl, 16(%rsp)
	movb	9(%rcx), %dl
	movb	%dl, 17(%rsp)
	movb	10(%rcx), %dl
	movb	%dl, 18(%rsp)
	movb	11(%rcx), %dl
	movb	%dl, 19(%rsp)
	movb	12(%rcx), %dl
	movb	%dl, 20(%rsp)
	movb	13(%rcx), %dl
	movb	%dl, 21(%rsp)
	movb	14(%rcx), %dl
	movb	%dl, 22(%rsp)
	movb	15(%rcx), %dl
	movb	%dl, 23(%rsp)
	movb	16(%rcx), %dl
	movb	%dl, 24(%rsp)
	movb	17(%rcx), %dl
	movb	%dl, 25(%rsp)
	movb	18(%rcx), %dl
	movb	%dl, 26(%rsp)
	movb	19(%rcx), %dl
	movb	%dl, 27(%rsp)
	movb	20(%rcx), %dl
	movb	%dl, 28(%rsp)
	movb	21(%rcx), %dl
	movb	%dl, 29(%rsp)
	movb	22(%rcx), %dl
	movb	%dl, 30(%rsp)
	movb	23(%rcx), %dl
	movb	%dl, 31(%rsp)
	movb	24(%rcx), %dl
	movb	%dl, 32(%rsp)
	movb	25(%rcx), %dl
	movb	%dl, 33(%rsp)
	movb	26(%rcx), %dl
	movb	%dl, 34(%rsp)
	movb	27(%rcx), %dl
	movb	%dl, 35(%rsp)
	movb	28(%rcx), %dl
	movb	%dl, 36(%rsp)
	movb	29(%rcx), %dl
	movb	%dl, 37(%rsp)
	movb	30(%rcx), %dl
	movb	%dl, 38(%rsp)
	movb	31(%rcx), %cl
	movb	%cl, 39(%rsp)
	movb	%al, 40(%rsp)
	leaq	48(%rsp), %rax
	leaq	8(%rsp), %rcx
	leaq	-216(%rsp), %rsp
	call	L_shake256_128_33$1
L_poly_getnoise$4:
	leaq	216(%rsp), %rsp
	movq	%mm1, %rax
	movq	$0, %rcx
	jmp 	L_poly_getnoise$2
L_poly_getnoise$3:
	movb	48(%rsp,%rcx), %dl
	movb	%dl, %sil
	andb	$85, %sil
	shrb	$1, %dl
	andb	$85, %dl
	addb	%sil, %dl
	movb	%dl, %sil
	andb	$3, %sil
	movb	%dl, %dil
	shrb	$2, %dil
	andb	$3, %dil
	subb	%dil, %sil
	movsbw	%sil, %si
	movw	%si, (%rax,%rcx,4)
	movb	%dl, %sil
	shrb	$4, %sil
	andb	$3, %sil
	shrb	$6, %dl
	andb	$3, %dl
	subb	%dl, %sil
	movsbw	%sil, %dx
	movw	%dx, 2(%rax,%rcx,4)
	incq	%rcx
L_poly_getnoise$2:
	cmpq	$128, %rcx
	jb  	L_poly_getnoise$3
	ret
L_i_poly_frommsg$1:
	movb	(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, (%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 2(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 4(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 6(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 8(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 10(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 12(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 14(%rcx)
	movb	1(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 16(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 18(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 20(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 22(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 24(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 26(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 28(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 30(%rcx)
	movb	2(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 32(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 34(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 36(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 38(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 40(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 42(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 44(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 46(%rcx)
	movb	3(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 48(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 50(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 52(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 54(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 56(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 58(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 60(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 62(%rcx)
	movb	4(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 64(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 66(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 68(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 70(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 72(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 74(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 76(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 78(%rcx)
	movb	5(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 80(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 82(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 84(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 86(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 88(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 90(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 92(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 94(%rcx)
	movb	6(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 96(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 98(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 100(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 102(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 104(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 106(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 108(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 110(%rcx)
	movb	7(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 112(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 114(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 116(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 118(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 120(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 122(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 124(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 126(%rcx)
	movb	8(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 128(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 130(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 132(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 134(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 136(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 138(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 140(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 142(%rcx)
	movb	9(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 144(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 146(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 148(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 150(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 152(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 154(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 156(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 158(%rcx)
	movb	10(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 160(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 162(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 164(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 166(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 168(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 170(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 172(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 174(%rcx)
	movb	11(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 176(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 178(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 180(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 182(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 184(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 186(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 188(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 190(%rcx)
	movb	12(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 192(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 194(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 196(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 198(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 200(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 202(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 204(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 206(%rcx)
	movb	13(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 208(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 210(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 212(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 214(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 216(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 218(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 220(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 222(%rcx)
	movb	14(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 224(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 226(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 228(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 230(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 232(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 234(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 236(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 238(%rcx)
	movb	15(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 240(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 242(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 244(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 246(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 248(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 250(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 252(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 254(%rcx)
	movb	16(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 256(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 258(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 260(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 262(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 264(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 266(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 268(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 270(%rcx)
	movb	17(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 272(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 274(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 276(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 278(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 280(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 282(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 284(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 286(%rcx)
	movb	18(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 288(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 290(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 292(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 294(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 296(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 298(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 300(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 302(%rcx)
	movb	19(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 304(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 306(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 308(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 310(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 312(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 314(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 316(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 318(%rcx)
	movb	20(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 320(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 322(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 324(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 326(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 328(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 330(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 332(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 334(%rcx)
	movb	21(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 336(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 338(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 340(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 342(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 344(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 346(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 348(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 350(%rcx)
	movb	22(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 352(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 354(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 356(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 358(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 360(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 362(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 364(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 366(%rcx)
	movb	23(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 368(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 370(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 372(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 374(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 376(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 378(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 380(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 382(%rcx)
	movb	24(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 384(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 386(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 388(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 390(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 392(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 394(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 396(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 398(%rcx)
	movb	25(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 400(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 402(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 404(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 406(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 408(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 410(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 412(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 414(%rcx)
	movb	26(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 416(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 418(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 420(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 422(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 424(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 426(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 428(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 430(%rcx)
	movb	27(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 432(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 434(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 436(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 438(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 440(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 442(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 444(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 446(%rcx)
	movb	28(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 448(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 450(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 452(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 454(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 456(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 458(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 460(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 462(%rcx)
	movb	29(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 464(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 466(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 468(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 470(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 472(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 474(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 476(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 478(%rcx)
	movb	30(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 480(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 482(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 484(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 486(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 488(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 490(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 492(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 494(%rcx)
	movb	31(%rax), %al
	movzbw	%al, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 496(%rcx)
	shrb	$1, %al
	movzbw	%al, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 498(%rcx)
	shrb	$1, %al
	movzbw	%al, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 500(%rcx)
	shrb	$1, %al
	movzbw	%al, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 502(%rcx)
	shrb	$1, %al
	movzbw	%al, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 504(%rcx)
	shrb	$1, %al
	movzbw	%al, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 506(%rcx)
	shrb	$1, %al
	movzbw	%al, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 508(%rcx)
	shrb	$1, %al
	movzbw	%al, %ax
	andw	$1, %ax
	imulw	$1665, %ax, %ax
	movw	%ax, 510(%rcx)
	ret
L_poly_frommont$1:
	movw	$1353, %cx
	movq	$0, %rdx
	jmp 	L_poly_frommont$2
L_poly_frommont$3:
	movw	(%rax,%rdx,2), %si
	movswl	%si, %esi
	movswl	%cx, %edi
	imull	%edi, %esi
	imull	$-218038272, %esi, %edi
	sarl	$16, %edi
	imull	$-3329, %edi, %edi
	addl	%esi, %edi
	sarl	$16, %edi
	movw	%di, (%rax,%rdx,2)
	incq	%rdx
L_poly_frommont$2:
	cmpq	$256, %rdx
	jb  	L_poly_frommont$3
	ret
L_poly_frombytes$1:
	movb	(%rsi), %r8b
	movb	1(%rsi), %r9b
	movb	2(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, (%rdi)
	movw	%r10w, 2(%rdi)
	movb	3(%rsi), %r8b
	movb	4(%rsi), %r9b
	movb	5(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 4(%rdi)
	movw	%r10w, 6(%rdi)
	movb	6(%rsi), %r8b
	movb	7(%rsi), %r9b
	movb	8(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 8(%rdi)
	movw	%r10w, 10(%rdi)
	movb	9(%rsi), %r8b
	movb	10(%rsi), %r9b
	movb	11(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 12(%rdi)
	movw	%r10w, 14(%rdi)
	movb	12(%rsi), %r8b
	movb	13(%rsi), %r9b
	movb	14(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 16(%rdi)
	movw	%r10w, 18(%rdi)
	movb	15(%rsi), %r8b
	movb	16(%rsi), %r9b
	movb	17(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 20(%rdi)
	movw	%r10w, 22(%rdi)
	movb	18(%rsi), %r8b
	movb	19(%rsi), %r9b
	movb	20(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 24(%rdi)
	movw	%r10w, 26(%rdi)
	movb	21(%rsi), %r8b
	movb	22(%rsi), %r9b
	movb	23(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 28(%rdi)
	movw	%r10w, 30(%rdi)
	movb	24(%rsi), %r8b
	movb	25(%rsi), %r9b
	movb	26(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 32(%rdi)
	movw	%r10w, 34(%rdi)
	movb	27(%rsi), %r8b
	movb	28(%rsi), %r9b
	movb	29(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 36(%rdi)
	movw	%r10w, 38(%rdi)
	movb	30(%rsi), %r8b
	movb	31(%rsi), %r9b
	movb	32(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 40(%rdi)
	movw	%r10w, 42(%rdi)
	movb	33(%rsi), %r8b
	movb	34(%rsi), %r9b
	movb	35(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 44(%rdi)
	movw	%r10w, 46(%rdi)
	movb	36(%rsi), %r8b
	movb	37(%rsi), %r9b
	movb	38(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 48(%rdi)
	movw	%r10w, 50(%rdi)
	movb	39(%rsi), %r8b
	movb	40(%rsi), %r9b
	movb	41(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 52(%rdi)
	movw	%r10w, 54(%rdi)
	movb	42(%rsi), %r8b
	movb	43(%rsi), %r9b
	movb	44(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 56(%rdi)
	movw	%r10w, 58(%rdi)
	movb	45(%rsi), %r8b
	movb	46(%rsi), %r9b
	movb	47(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 60(%rdi)
	movw	%r10w, 62(%rdi)
	movb	48(%rsi), %r8b
	movb	49(%rsi), %r9b
	movb	50(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 64(%rdi)
	movw	%r10w, 66(%rdi)
	movb	51(%rsi), %r8b
	movb	52(%rsi), %r9b
	movb	53(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 68(%rdi)
	movw	%r10w, 70(%rdi)
	movb	54(%rsi), %r8b
	movb	55(%rsi), %r9b
	movb	56(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 72(%rdi)
	movw	%r10w, 74(%rdi)
	movb	57(%rsi), %r8b
	movb	58(%rsi), %r9b
	movb	59(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 76(%rdi)
	movw	%r10w, 78(%rdi)
	movb	60(%rsi), %r8b
	movb	61(%rsi), %r9b
	movb	62(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 80(%rdi)
	movw	%r10w, 82(%rdi)
	movb	63(%rsi), %r8b
	movb	64(%rsi), %r9b
	movb	65(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 84(%rdi)
	movw	%r10w, 86(%rdi)
	movb	66(%rsi), %r8b
	movb	67(%rsi), %r9b
	movb	68(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 88(%rdi)
	movw	%r10w, 90(%rdi)
	movb	69(%rsi), %r8b
	movb	70(%rsi), %r9b
	movb	71(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 92(%rdi)
	movw	%r10w, 94(%rdi)
	movb	72(%rsi), %r8b
	movb	73(%rsi), %r9b
	movb	74(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 96(%rdi)
	movw	%r10w, 98(%rdi)
	movb	75(%rsi), %r8b
	movb	76(%rsi), %r9b
	movb	77(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 100(%rdi)
	movw	%r10w, 102(%rdi)
	movb	78(%rsi), %r8b
	movb	79(%rsi), %r9b
	movb	80(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 104(%rdi)
	movw	%r10w, 106(%rdi)
	movb	81(%rsi), %r8b
	movb	82(%rsi), %r9b
	movb	83(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 108(%rdi)
	movw	%r10w, 110(%rdi)
	movb	84(%rsi), %r8b
	movb	85(%rsi), %r9b
	movb	86(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 112(%rdi)
	movw	%r10w, 114(%rdi)
	movb	87(%rsi), %r8b
	movb	88(%rsi), %r9b
	movb	89(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 116(%rdi)
	movw	%r10w, 118(%rdi)
	movb	90(%rsi), %r8b
	movb	91(%rsi), %r9b
	movb	92(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 120(%rdi)
	movw	%r10w, 122(%rdi)
	movb	93(%rsi), %r8b
	movb	94(%rsi), %r9b
	movb	95(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 124(%rdi)
	movw	%r10w, 126(%rdi)
	movb	96(%rsi), %r8b
	movb	97(%rsi), %r9b
	movb	98(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 128(%rdi)
	movw	%r10w, 130(%rdi)
	movb	99(%rsi), %r8b
	movb	100(%rsi), %r9b
	movb	101(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 132(%rdi)
	movw	%r10w, 134(%rdi)
	movb	102(%rsi), %r8b
	movb	103(%rsi), %r9b
	movb	104(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 136(%rdi)
	movw	%r10w, 138(%rdi)
	movb	105(%rsi), %r8b
	movb	106(%rsi), %r9b
	movb	107(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 140(%rdi)
	movw	%r10w, 142(%rdi)
	movb	108(%rsi), %r8b
	movb	109(%rsi), %r9b
	movb	110(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 144(%rdi)
	movw	%r10w, 146(%rdi)
	movb	111(%rsi), %r8b
	movb	112(%rsi), %r9b
	movb	113(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 148(%rdi)
	movw	%r10w, 150(%rdi)
	movb	114(%rsi), %r8b
	movb	115(%rsi), %r9b
	movb	116(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 152(%rdi)
	movw	%r10w, 154(%rdi)
	movb	117(%rsi), %r8b
	movb	118(%rsi), %r9b
	movb	119(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 156(%rdi)
	movw	%r10w, 158(%rdi)
	movb	120(%rsi), %r8b
	movb	121(%rsi), %r9b
	movb	122(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 160(%rdi)
	movw	%r10w, 162(%rdi)
	movb	123(%rsi), %r8b
	movb	124(%rsi), %r9b
	movb	125(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 164(%rdi)
	movw	%r10w, 166(%rdi)
	movb	126(%rsi), %r8b
	movb	127(%rsi), %r9b
	movb	128(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 168(%rdi)
	movw	%r10w, 170(%rdi)
	movb	129(%rsi), %r8b
	movb	130(%rsi), %r9b
	movb	131(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 172(%rdi)
	movw	%r10w, 174(%rdi)
	movb	132(%rsi), %r8b
	movb	133(%rsi), %r9b
	movb	134(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 176(%rdi)
	movw	%r10w, 178(%rdi)
	movb	135(%rsi), %r8b
	movb	136(%rsi), %r9b
	movb	137(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 180(%rdi)
	movw	%r10w, 182(%rdi)
	movb	138(%rsi), %r8b
	movb	139(%rsi), %r9b
	movb	140(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 184(%rdi)
	movw	%r10w, 186(%rdi)
	movb	141(%rsi), %r8b
	movb	142(%rsi), %r9b
	movb	143(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 188(%rdi)
	movw	%r10w, 190(%rdi)
	movb	144(%rsi), %r8b
	movb	145(%rsi), %r9b
	movb	146(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 192(%rdi)
	movw	%r10w, 194(%rdi)
	movb	147(%rsi), %r8b
	movb	148(%rsi), %r9b
	movb	149(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 196(%rdi)
	movw	%r10w, 198(%rdi)
	movb	150(%rsi), %r8b
	movb	151(%rsi), %r9b
	movb	152(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 200(%rdi)
	movw	%r10w, 202(%rdi)
	movb	153(%rsi), %r8b
	movb	154(%rsi), %r9b
	movb	155(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 204(%rdi)
	movw	%r10w, 206(%rdi)
	movb	156(%rsi), %r8b
	movb	157(%rsi), %r9b
	movb	158(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 208(%rdi)
	movw	%r10w, 210(%rdi)
	movb	159(%rsi), %r8b
	movb	160(%rsi), %r9b
	movb	161(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 212(%rdi)
	movw	%r10w, 214(%rdi)
	movb	162(%rsi), %r8b
	movb	163(%rsi), %r9b
	movb	164(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 216(%rdi)
	movw	%r10w, 218(%rdi)
	movb	165(%rsi), %r8b
	movb	166(%rsi), %r9b
	movb	167(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 220(%rdi)
	movw	%r10w, 222(%rdi)
	movb	168(%rsi), %r8b
	movb	169(%rsi), %r9b
	movb	170(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 224(%rdi)
	movw	%r10w, 226(%rdi)
	movb	171(%rsi), %r8b
	movb	172(%rsi), %r9b
	movb	173(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 228(%rdi)
	movw	%r10w, 230(%rdi)
	movb	174(%rsi), %r8b
	movb	175(%rsi), %r9b
	movb	176(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 232(%rdi)
	movw	%r10w, 234(%rdi)
	movb	177(%rsi), %r8b
	movb	178(%rsi), %r9b
	movb	179(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 236(%rdi)
	movw	%r10w, 238(%rdi)
	movb	180(%rsi), %r8b
	movb	181(%rsi), %r9b
	movb	182(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 240(%rdi)
	movw	%r10w, 242(%rdi)
	movb	183(%rsi), %r8b
	movb	184(%rsi), %r9b
	movb	185(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 244(%rdi)
	movw	%r10w, 246(%rdi)
	movb	186(%rsi), %r8b
	movb	187(%rsi), %r9b
	movb	188(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 248(%rdi)
	movw	%r10w, 250(%rdi)
	movb	189(%rsi), %r8b
	movb	190(%rsi), %r9b
	movb	191(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 252(%rdi)
	movw	%r10w, 254(%rdi)
	movb	192(%rsi), %r8b
	movb	193(%rsi), %r9b
	movb	194(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 256(%rdi)
	movw	%r10w, 258(%rdi)
	movb	195(%rsi), %r8b
	movb	196(%rsi), %r9b
	movb	197(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 260(%rdi)
	movw	%r10w, 262(%rdi)
	movb	198(%rsi), %r8b
	movb	199(%rsi), %r9b
	movb	200(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 264(%rdi)
	movw	%r10w, 266(%rdi)
	movb	201(%rsi), %r8b
	movb	202(%rsi), %r9b
	movb	203(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 268(%rdi)
	movw	%r10w, 270(%rdi)
	movb	204(%rsi), %r8b
	movb	205(%rsi), %r9b
	movb	206(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 272(%rdi)
	movw	%r10w, 274(%rdi)
	movb	207(%rsi), %r8b
	movb	208(%rsi), %r9b
	movb	209(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 276(%rdi)
	movw	%r10w, 278(%rdi)
	movb	210(%rsi), %r8b
	movb	211(%rsi), %r9b
	movb	212(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 280(%rdi)
	movw	%r10w, 282(%rdi)
	movb	213(%rsi), %r8b
	movb	214(%rsi), %r9b
	movb	215(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 284(%rdi)
	movw	%r10w, 286(%rdi)
	movb	216(%rsi), %r8b
	movb	217(%rsi), %r9b
	movb	218(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 288(%rdi)
	movw	%r10w, 290(%rdi)
	movb	219(%rsi), %r8b
	movb	220(%rsi), %r9b
	movb	221(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 292(%rdi)
	movw	%r10w, 294(%rdi)
	movb	222(%rsi), %r8b
	movb	223(%rsi), %r9b
	movb	224(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 296(%rdi)
	movw	%r10w, 298(%rdi)
	movb	225(%rsi), %r8b
	movb	226(%rsi), %r9b
	movb	227(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 300(%rdi)
	movw	%r10w, 302(%rdi)
	movb	228(%rsi), %r8b
	movb	229(%rsi), %r9b
	movb	230(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 304(%rdi)
	movw	%r10w, 306(%rdi)
	movb	231(%rsi), %r8b
	movb	232(%rsi), %r9b
	movb	233(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 308(%rdi)
	movw	%r10w, 310(%rdi)
	movb	234(%rsi), %r8b
	movb	235(%rsi), %r9b
	movb	236(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 312(%rdi)
	movw	%r10w, 314(%rdi)
	movb	237(%rsi), %r8b
	movb	238(%rsi), %r9b
	movb	239(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 316(%rdi)
	movw	%r10w, 318(%rdi)
	movb	240(%rsi), %r8b
	movb	241(%rsi), %r9b
	movb	242(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 320(%rdi)
	movw	%r10w, 322(%rdi)
	movb	243(%rsi), %r8b
	movb	244(%rsi), %r9b
	movb	245(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 324(%rdi)
	movw	%r10w, 326(%rdi)
	movb	246(%rsi), %r8b
	movb	247(%rsi), %r9b
	movb	248(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 328(%rdi)
	movw	%r10w, 330(%rdi)
	movb	249(%rsi), %r8b
	movb	250(%rsi), %r9b
	movb	251(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 332(%rdi)
	movw	%r10w, 334(%rdi)
	movb	252(%rsi), %r8b
	movb	253(%rsi), %r9b
	movb	254(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 336(%rdi)
	movw	%r10w, 338(%rdi)
	movb	255(%rsi), %r8b
	movb	256(%rsi), %r9b
	movb	257(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 340(%rdi)
	movw	%r10w, 342(%rdi)
	movb	258(%rsi), %r8b
	movb	259(%rsi), %r9b
	movb	260(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 344(%rdi)
	movw	%r10w, 346(%rdi)
	movb	261(%rsi), %r8b
	movb	262(%rsi), %r9b
	movb	263(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 348(%rdi)
	movw	%r10w, 350(%rdi)
	movb	264(%rsi), %r8b
	movb	265(%rsi), %r9b
	movb	266(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 352(%rdi)
	movw	%r10w, 354(%rdi)
	movb	267(%rsi), %r8b
	movb	268(%rsi), %r9b
	movb	269(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 356(%rdi)
	movw	%r10w, 358(%rdi)
	movb	270(%rsi), %r8b
	movb	271(%rsi), %r9b
	movb	272(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 360(%rdi)
	movw	%r10w, 362(%rdi)
	movb	273(%rsi), %r8b
	movb	274(%rsi), %r9b
	movb	275(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 364(%rdi)
	movw	%r10w, 366(%rdi)
	movb	276(%rsi), %r8b
	movb	277(%rsi), %r9b
	movb	278(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 368(%rdi)
	movw	%r10w, 370(%rdi)
	movb	279(%rsi), %r8b
	movb	280(%rsi), %r9b
	movb	281(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 372(%rdi)
	movw	%r10w, 374(%rdi)
	movb	282(%rsi), %r8b
	movb	283(%rsi), %r9b
	movb	284(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 376(%rdi)
	movw	%r10w, 378(%rdi)
	movb	285(%rsi), %r8b
	movb	286(%rsi), %r9b
	movb	287(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 380(%rdi)
	movw	%r10w, 382(%rdi)
	movb	288(%rsi), %r8b
	movb	289(%rsi), %r9b
	movb	290(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 384(%rdi)
	movw	%r10w, 386(%rdi)
	movb	291(%rsi), %r8b
	movb	292(%rsi), %r9b
	movb	293(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 388(%rdi)
	movw	%r10w, 390(%rdi)
	movb	294(%rsi), %r8b
	movb	295(%rsi), %r9b
	movb	296(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 392(%rdi)
	movw	%r10w, 394(%rdi)
	movb	297(%rsi), %r8b
	movb	298(%rsi), %r9b
	movb	299(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 396(%rdi)
	movw	%r10w, 398(%rdi)
	movb	300(%rsi), %r8b
	movb	301(%rsi), %r9b
	movb	302(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 400(%rdi)
	movw	%r10w, 402(%rdi)
	movb	303(%rsi), %r8b
	movb	304(%rsi), %r9b
	movb	305(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 404(%rdi)
	movw	%r10w, 406(%rdi)
	movb	306(%rsi), %r8b
	movb	307(%rsi), %r9b
	movb	308(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 408(%rdi)
	movw	%r10w, 410(%rdi)
	movb	309(%rsi), %r8b
	movb	310(%rsi), %r9b
	movb	311(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 412(%rdi)
	movw	%r10w, 414(%rdi)
	movb	312(%rsi), %r8b
	movb	313(%rsi), %r9b
	movb	314(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 416(%rdi)
	movw	%r10w, 418(%rdi)
	movb	315(%rsi), %r8b
	movb	316(%rsi), %r9b
	movb	317(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 420(%rdi)
	movw	%r10w, 422(%rdi)
	movb	318(%rsi), %r8b
	movb	319(%rsi), %r9b
	movb	320(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 424(%rdi)
	movw	%r10w, 426(%rdi)
	movb	321(%rsi), %r8b
	movb	322(%rsi), %r9b
	movb	323(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 428(%rdi)
	movw	%r10w, 430(%rdi)
	movb	324(%rsi), %r8b
	movb	325(%rsi), %r9b
	movb	326(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 432(%rdi)
	movw	%r10w, 434(%rdi)
	movb	327(%rsi), %r8b
	movb	328(%rsi), %r9b
	movb	329(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 436(%rdi)
	movw	%r10w, 438(%rdi)
	movb	330(%rsi), %r8b
	movb	331(%rsi), %r9b
	movb	332(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 440(%rdi)
	movw	%r10w, 442(%rdi)
	movb	333(%rsi), %r8b
	movb	334(%rsi), %r9b
	movb	335(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 444(%rdi)
	movw	%r10w, 446(%rdi)
	movb	336(%rsi), %r8b
	movb	337(%rsi), %r9b
	movb	338(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 448(%rdi)
	movw	%r10w, 450(%rdi)
	movb	339(%rsi), %r8b
	movb	340(%rsi), %r9b
	movb	341(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 452(%rdi)
	movw	%r10w, 454(%rdi)
	movb	342(%rsi), %r8b
	movb	343(%rsi), %r9b
	movb	344(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 456(%rdi)
	movw	%r10w, 458(%rdi)
	movb	345(%rsi), %r8b
	movb	346(%rsi), %r9b
	movb	347(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 460(%rdi)
	movw	%r10w, 462(%rdi)
	movb	348(%rsi), %r8b
	movb	349(%rsi), %r9b
	movb	350(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 464(%rdi)
	movw	%r10w, 466(%rdi)
	movb	351(%rsi), %r8b
	movb	352(%rsi), %r9b
	movb	353(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 468(%rdi)
	movw	%r10w, 470(%rdi)
	movb	354(%rsi), %r8b
	movb	355(%rsi), %r9b
	movb	356(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 472(%rdi)
	movw	%r10w, 474(%rdi)
	movb	357(%rsi), %r8b
	movb	358(%rsi), %r9b
	movb	359(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 476(%rdi)
	movw	%r10w, 478(%rdi)
	movb	360(%rsi), %r8b
	movb	361(%rsi), %r9b
	movb	362(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 480(%rdi)
	movw	%r10w, 482(%rdi)
	movb	363(%rsi), %r8b
	movb	364(%rsi), %r9b
	movb	365(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 484(%rdi)
	movw	%r10w, 486(%rdi)
	movb	366(%rsi), %r8b
	movb	367(%rsi), %r9b
	movb	368(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 488(%rdi)
	movw	%r10w, 490(%rdi)
	movb	369(%rsi), %r8b
	movb	370(%rsi), %r9b
	movb	371(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 492(%rdi)
	movw	%r10w, 494(%rdi)
	movb	372(%rsi), %r8b
	movb	373(%rsi), %r9b
	movb	374(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 496(%rdi)
	movw	%r10w, 498(%rdi)
	movb	375(%rsi), %r8b
	movb	376(%rsi), %r9b
	movb	377(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 500(%rdi)
	movw	%r10w, 502(%rdi)
	movb	378(%rsi), %r8b
	movb	379(%rsi), %r9b
	movb	380(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 504(%rdi)
	movw	%r10w, 506(%rdi)
	movb	381(%rsi), %r8b
	movb	382(%rsi), %r9b
	movb	383(%rsi), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 508(%rdi)
	movw	%r10w, 510(%rdi)
	ret
L_poly_decompress$1:
	movq	$0, %rdi
	jmp 	L_poly_decompress$2
L_poly_decompress$3:
	movb	(%rsi,%rdi), %r8b
	movzbw	%r8b, %r9w
	movzbw	%r8b, %r8w
	andw	$15, %r9w
	shrw	$4, %r8w
	imulw	$3329, %r9w, %r9w
	imulw	$3329, %r8w, %r8w
	addw	$8, %r9w
	addw	$8, %r8w
	shrw	$4, %r9w
	shrw	$4, %r8w
	movw	%r9w, (%rcx,%rdi,4)
	movw	%r8w, 2(%rcx,%rdi,4)
	incq	%rdi
L_poly_decompress$2:
	cmpq	$128, %rdi
	jb  	L_poly_decompress$3
	ret
L_i_poly_compress$1:
	call	L_poly_csubq$1
L_i_poly_compress$4:
	movq	$0, %rdx
	jmp 	L_i_poly_compress$2
L_i_poly_compress$3:
	movzwl	(%rcx,%rdx,4), %esi
	movzwl	2(%rcx,%rdx,4), %edi
	shll	$4, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$15, %esi
	shll	$4, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$15, %edi
	shll	$4, %edi
	orl 	%edi, %esi
	movb	%sil, (%rax,%rdx)
	incq	%rdx
L_i_poly_compress$2:
	cmpq	$128, %rdx
	jb  	L_i_poly_compress$3
	ret
L_poly_compress$1:
	call	L_poly_csubq$1
L_poly_compress$4:
	movq	$0, %rdx
	jmp 	L_poly_compress$2
L_poly_compress$3:
	movzwl	(%rcx,%rdx,4), %esi
	movzwl	2(%rcx,%rdx,4), %edi
	shll	$4, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$15, %esi
	shll	$4, %edi
	addl	$1665, %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$15, %edi
	shll	$4, %edi
	orl 	%edi, %esi
	movb	%sil, (%rax,%rdx)
	incq	%rdx
L_poly_compress$2:
	cmpq	$128, %rdx
	jb  	L_poly_compress$3
	ret
L_poly_basemul$1:
	movq	%rdi, 8(%rsp)
	movq	$0, %rdi
	jmp 	L_poly_basemul$2
L_poly_basemul$3:
	leaq	glob_data + 576(%rip), %r8
	movq	%rdi, %r9
	shrq	$2, %r9
	movw	(%r8,%r9,2), %r8w
	movw	(%rcx,%rdi,2), %r9w
	movw	(%rsi,%rdi,2), %r10w
	incq	%rdi
	movw	(%rcx,%rdi,2), %r11w
	movw	(%rsi,%rdi,2), %bx
	addq	$-1, %rdi
	movswl	%r11w, %ebp
	movswl	%bx, %r12d
	imull	%r12d, %ebp
	imull	$-218038272, %ebp, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r12d
	addl	%ebp, %r12d
	sarl	$16, %r12d
	movswl	%r12w, %ebp
	movswl	%r8w, %r12d
	imull	%r12d, %ebp
	imull	$-218038272, %ebp, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r12d
	addl	%ebp, %r12d
	sarl	$16, %r12d
	movw	%r12w, %bp
	movswl	%r9w, %r12d
	movswl	%r10w, %r13d
	imull	%r13d, %r12d
	imull	$-218038272, %r12d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %r13d
	addl	%r12d, %r13d
	sarl	$16, %r13d
	addw	%r13w, %bp
	movswl	%r9w, %r9d
	movswl	%bx, %ebx
	imull	%ebx, %r9d
	imull	$-218038272, %r9d, %ebx
	sarl	$16, %ebx
	imull	$-3329, %ebx, %ebx
	addl	%r9d, %ebx
	sarl	$16, %ebx
	movw	%bx, %r9w
	movswl	%r11w, %r11d
	movswl	%r10w, %r10d
	imull	%r10d, %r11d
	imull	$-218038272, %r11d, %r10d
	sarl	$16, %r10d
	imull	$-3329, %r10d, %r10d
	addl	%r11d, %r10d
	sarl	$16, %r10d
	addw	%r10w, %r9w
	movq	8(%rsp), %r10
	movw	%bp, (%r10,%rdi,2)
	incq	%rdi
	movw	%r9w, (%r10,%rdi,2)
	movq	%r10, 16(%rsp)
	negw	%r8w
	incq	%rdi
	movw	(%rcx,%rdi,2), %r9w
	movw	(%rsi,%rdi,2), %r10w
	incq	%rdi
	movw	(%rcx,%rdi,2), %r11w
	movw	(%rsi,%rdi,2), %bx
	addq	$-1, %rdi
	movswl	%r11w, %ebp
	movswl	%bx, %r12d
	imull	%r12d, %ebp
	imull	$-218038272, %ebp, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r12d
	addl	%ebp, %r12d
	sarl	$16, %r12d
	movswl	%r12w, %ebp
	movswl	%r8w, %r8d
	imull	%r8d, %ebp
	imull	$-218038272, %ebp, %r8d
	sarl	$16, %r8d
	imull	$-3329, %r8d, %r8d
	addl	%ebp, %r8d
	sarl	$16, %r8d
	movswl	%r9w, %ebp
	movswl	%r10w, %r12d
	imull	%r12d, %ebp
	imull	$-218038272, %ebp, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r12d
	addl	%ebp, %r12d
	sarl	$16, %r12d
	addw	%r12w, %r8w
	movswl	%r9w, %r9d
	movswl	%bx, %ebx
	imull	%ebx, %r9d
	imull	$-218038272, %r9d, %ebx
	sarl	$16, %ebx
	imull	$-3329, %ebx, %ebx
	addl	%r9d, %ebx
	sarl	$16, %ebx
	movswl	%r11w, %r9d
	movswl	%r10w, %r10d
	imull	%r10d, %r9d
	imull	$-218038272, %r9d, %r10d
	sarl	$16, %r10d
	imull	$-3329, %r10d, %r10d
	addl	%r9d, %r10d
	sarl	$16, %r10d
	addw	%r10w, %bx
	movq	16(%rsp), %r9
	movw	%r8w, (%r9,%rdi,2)
	incq	%rdi
	movw	%bx, (%r9,%rdi,2)
	incq	%rdi
L_poly_basemul$2:
	cmpq	$253, %rdi
	jb  	L_poly_basemul$3
	ret
L_poly_csubq$1:
	movq	$0, %rsi
	jmp 	L_poly_csubq$2
L_poly_csubq$3:
	movw	(%rcx,%rsi,2), %di
	addw	$-3329, %di
	movw	%di, %r8w
	sarw	$15, %r8w
	andw	$3329, %r8w
	addw	%r8w, %di
	movw	%di, (%rcx,%rsi,2)
	incq	%rsi
L_poly_csubq$2:
	cmpq	$256, %rsi
	jb  	L_poly_csubq$3
	ret
L_poly_add2$1:
	movq	$0, %rdi
	jmp 	L_poly_add2$2
L_poly_add2$3:
	movw	(%rcx,%rdi,2), %r8w
	movw	(%rsi,%rdi,2), %r9w
	addw	%r9w, %r8w
	movw	%r8w, (%rcx,%rdi,2)
	incq	%rdi
L_poly_add2$2:
	cmpq	$256, %rdi
	jb  	L_poly_add2$3
	ret
L_sha3_512_64$1:
	movq	%rax, %mm0
	leaq	24(%rsp), %rax
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_sha3_512_64$7
L_sha3_512_64$8:
	movq	%rdx, (%rax,%rsi,8)
	incq	%rsi
L_sha3_512_64$7:
	cmpq	$25, %rsi
	jb  	L_sha3_512_64$8
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_sha3_512_64$5
L_sha3_512_64$6:
	movq	(%rcx,%rdx), %rdi
	addq	$8, %rdx
	xorq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rax,%rsi,8)
	incq	%rsi
L_sha3_512_64$5:
	cmpq	$8, %rsi
	jb  	L_sha3_512_64$6
	movq	$6, %rcx
	xorq	(%rax,%rsi,8), %rcx
	movq	%rcx, (%rax,%rsi,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	64(%rax), %rcx
	movq	%rcx, 64(%rax)
	movq	$0, %rcx
	movq	%mm0, %rdx
	movq	%rdx, 8(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512_64$4:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	$0, %rsi
	jmp 	L_sha3_512_64$2
L_sha3_512_64$3:
	movq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rdx)
	incq	%rsi
	addq	$8, %rdx
L_sha3_512_64$2:
	cmpq	$8, %rsi
	jl  	L_sha3_512_64$3
	ret
L_isha3_256_M1184$1:
	movq	%rax, %mm0
	leaq	24(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	L_isha3_256_M1184$12
L_isha3_256_M1184$13:
	movq	%rcx, (%rax,%rdx,8)
	incq	%rdx
L_isha3_256_M1184$12:
	cmpq	$25, %rdx
	jb  	L_isha3_256_M1184$13
	movq	$0, %rdi
	jmp 	L_isha3_256_M1184$7
L_isha3_256_M1184$8:
	movq	$0, %rcx
	jmp 	L_isha3_256_M1184$10
L_isha3_256_M1184$11:
	movq	(%rsi), %rdx
	addq	$8, %rsi
	xorq	(%rax,%rcx,8), %rdx
	movq	%rdx, (%rax,%rcx,8)
	incq	%rcx
L_isha3_256_M1184$10:
	cmpq	$17, %rcx
	jb  	L_isha3_256_M1184$11
	movq	%rsi, 8(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_isha3_256_M1184$9:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rdi
	incq	%rdi
L_isha3_256_M1184$7:
	cmpq	$8, %rdi
	jb  	L_isha3_256_M1184$8
	movq	$0, %rcx
	jmp 	L_isha3_256_M1184$5
L_isha3_256_M1184$6:
	movq	(%rsi), %rdx
	addq	$8, %rsi
	xorq	(%rax,%rcx,8), %rdx
	movq	%rdx, (%rax,%rcx,8)
	incq	%rcx
L_isha3_256_M1184$5:
	cmpq	$12, %rcx
	jb  	L_isha3_256_M1184$6
	movq	$6, %rdx
	xorq	(%rax,%rcx,8), %rdx
	movq	%rdx, (%rax,%rcx,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	128(%rax), %rcx
	movq	%rcx, 128(%rax)
	movq	$0, %rcx
	movq	%mm0, %rdx
	movq	%rdx, 16(%rsp)
	movq	%rcx, 8(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_isha3_256_M1184$4:
	leaq	224(%rsp), %rsp
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	$0, %rsi
	jmp 	L_isha3_256_M1184$2
L_isha3_256_M1184$3:
	movq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rdx)
	incq	%rsi
	addq	$8, %rdx
L_isha3_256_M1184$2:
	cmpq	$4, %rsi
	jl  	L_isha3_256_M1184$3
	ret
L_shake128_squeezeblock$1:
	movq	%rcx, %mm1
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake128_squeezeblock$4:
	leaq	224(%rsp), %rsp
	movq	%mm1, %rcx
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_shake128_squeezeblock$2
L_shake128_squeezeblock$3:
	movq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rdx)
	incq	%rsi
	addq	$8, %rdx
L_shake128_squeezeblock$2:
	cmpq	$21, %rsi
	jl  	L_shake128_squeezeblock$3
	ret
L_shake128_absorb34$1:
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_shake128_absorb34$4
L_shake128_absorb34$5:
	movq	%rdx, (%rax,%rsi,8)
	incq	%rsi
L_shake128_absorb34$4:
	cmpq	$25, %rsi
	jb  	L_shake128_absorb34$5
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_shake128_absorb34$2
L_shake128_absorb34$3:
	movq	(%rcx,%rdx), %rdi
	addq	$8, %rdx
	xorq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rax,%rsi,8)
	incq	%rsi
L_shake128_absorb34$2:
	cmpq	$4, %rsi
	jb  	L_shake128_absorb34$3
	movq	$0, %rdi
	movzwq	(%rcx,%rdx), %rcx
	movq	$31, %rdx
	shlq	$16, %rdx
	orq 	%rdx, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %rdi
	xorq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rax,%rsi,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	160(%rax), %rcx
	movq	%rcx, 160(%rax)
	ret
L_sha3512_33$1:
	movq	%rax, %mm0
	leaq	24(%rsp), %rax
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_sha3512_33$7
L_sha3512_33$8:
	movq	%rdx, (%rax,%rsi,8)
	incq	%rsi
L_sha3512_33$7:
	cmpq	$25, %rsi
	jb  	L_sha3512_33$8
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_sha3512_33$5
L_sha3512_33$6:
	movq	(%rcx,%rdx), %rdi
	addq	$8, %rdx
	xorq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rax,%rsi,8)
	incq	%rsi
L_sha3512_33$5:
	cmpq	$4, %rsi
	jb  	L_sha3512_33$6
	movq	$0, %rdi
	movq	$0, %r8
	movzbq	(%rcx,%rdx), %rcx
	orq 	$1536, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %r8
	shlq	$0, %r8
	orq 	%r8, %rdi
	xorq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rax,%rsi,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	64(%rax), %rcx
	movq	%rcx, 64(%rax)
	movq	$0, %rcx
	movq	%mm0, %rdx
	movq	%rdx, 8(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3512_33$4:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	$0, %rsi
	jmp 	L_sha3512_33$2
L_sha3512_33$3:
	movq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rdx)
	incq	%rsi
	addq	$8, %rdx
L_sha3512_33$2:
	cmpq	$8, %rsi
	jl  	L_sha3512_33$3
	ret
L_shake256_1120_32$1:
	movq	%rax, %mm1
	leaq	24(%rsp), %rax
	movq	$0, %rsi
	movq	$0, %rdi
	jmp 	L_shake256_1120_32$17
L_shake256_1120_32$18:
	movq	%rsi, (%rax,%rdi,8)
	incq	%rdi
L_shake256_1120_32$17:
	cmpq	$25, %rdi
	jb  	L_shake256_1120_32$18
	movq	$0, %rsi
	jmp 	L_shake256_1120_32$15
L_shake256_1120_32$16:
	movq	(%rcx), %rdi
	addq	$8, %rcx
	xorq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rax,%rsi,8)
	incq	%rsi
L_shake256_1120_32$15:
	cmpq	$4, %rsi
	jb  	L_shake256_1120_32$16
	movq	$4, %rcx
	jmp 	L_shake256_1120_32$13
L_shake256_1120_32$14:
	movq	(%rdx), %rsi
	addq	$8, %rdx
	xorq	(%rax,%rcx,8), %rsi
	movq	%rsi, (%rax,%rcx,8)
	incq	%rcx
L_shake256_1120_32$13:
	cmpq	$17, %rcx
	jb  	L_shake256_1120_32$14
	movq	%rdx, 8(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_1120_32$12:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	$0, %rdi
	jmp 	L_shake256_1120_32$7
L_shake256_1120_32$8:
	movq	$0, %rdx
	jmp 	L_shake256_1120_32$10
L_shake256_1120_32$11:
	movq	(%rcx), %rsi
	addq	$8, %rcx
	xorq	(%rax,%rdx,8), %rsi
	movq	%rsi, (%rax,%rdx,8)
	incq	%rdx
L_shake256_1120_32$10:
	cmpq	$17, %rdx
	jb  	L_shake256_1120_32$11
	movq	%rcx, 8(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_1120_32$9:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdi
	incq	%rdi
L_shake256_1120_32$7:
	cmpq	$7, %rdi
	jb  	L_shake256_1120_32$8
	movq	$0, %rdx
	jmp 	L_shake256_1120_32$5
L_shake256_1120_32$6:
	movq	(%rcx), %rsi
	addq	$8, %rcx
	xorq	(%rax,%rdx,8), %rsi
	movq	%rsi, (%rax,%rdx,8)
	incq	%rdx
L_shake256_1120_32$5:
	cmpq	$4, %rdx
	jb  	L_shake256_1120_32$6
	movq	$31, %rcx
	xorq	(%rax,%rdx,8), %rcx
	movq	%rcx, (%rax,%rdx,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	128(%rax), %rcx
	movq	%rcx, 128(%rax)
	movq	%mm1, %rcx
	movq	%rcx, 16(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_1120_32$4:
	leaq	224(%rsp), %rsp
	movq	16(%rsp), %rcx
	movq	$0, %rdx
	jmp 	L_shake256_1120_32$2
L_shake256_1120_32$3:
	movq	(%rax,%rdx,8), %rsi
	incq	%rdx
	movq	%rsi, (%rcx)
	addq	$8, %rcx
L_shake256_1120_32$2:
	cmpq	$4, %rdx
	jb  	L_shake256_1120_32$3
	ret
L_shake256_128_33$1:
	movq	%rax, %mm2
	leaq	24(%rsp), %rax
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_shake256_128_33$7
L_shake256_128_33$8:
	movq	%rdx, (%rax,%rsi,8)
	incq	%rsi
L_shake256_128_33$7:
	cmpq	$25, %rsi
	jb  	L_shake256_128_33$8
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_shake256_128_33$5
L_shake256_128_33$6:
	movq	(%rcx,%rdx), %rdi
	addq	$8, %rdx
	xorq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rax,%rsi,8)
	incq	%rsi
L_shake256_128_33$5:
	cmpq	$4, %rsi
	jb  	L_shake256_128_33$6
	movq	$0, %rdi
	movq	$0, %r8
	movzbq	(%rcx,%rdx), %rcx
	orq 	$7936, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %r8
	shlq	$0, %r8
	orq 	%r8, %rdi
	xorq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rax,%rsi,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	128(%rax), %rcx
	movq	%rcx, 128(%rax)
	movq	$0, %rcx
	movq	%mm2, %rdx
	movq	%rdx, 8(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_128_33$4:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	$0, %rsi
	jmp 	L_shake256_128_33$2
L_shake256_128_33$3:
	movq	(%rax,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rdx)
	incq	%rsi
	addq	$8, %rdx
L_shake256_128_33$2:
	cmpq	$16, %rsi
	jl  	L_shake256_128_33$3
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
G$jzetas_inv:
	.byte	-91
	.byte	6
	.byte	15
	.byte	7
	.byte	-76
	.byte	5
	.byte	67
	.byte	9
	.byte	34
	.byte	9
	.byte	29
	.byte	9
	.byte	52
	.byte	1
	.byte	108
	.byte	0
	.byte	35
	.byte	11
	.byte	102
	.byte	3
	.byte	86
	.byte	3
	.byte	-26
	.byte	5
	.byte	-25
	.byte	9
	.byte	-2
	.byte	4
	.byte	-6
	.byte	5
	.byte	-95
	.byte	4
	.byte	123
	.byte	6
	.byte	-93
	.byte	4
	.byte	37
	.byte	12
	.byte	106
	.byte	3
	.byte	55
	.byte	5
	.byte	63
	.byte	8
	.byte	-120
	.byte	0
	.byte	-65
	.byte	4
	.byte	-127
	.byte	11
	.byte	-71
	.byte	5
	.byte	5
	.byte	5
	.byte	-41
	.byte	7
	.byte	-97
	.byte	10
	.byte	-90
	.byte	10
	.byte	-72
	.byte	8
	.byte	-48
	.byte	9
	.byte	75
	.byte	0
	.byte	-100
	.byte	0
	.byte	-72
	.byte	11
	.byte	95
	.byte	11
	.byte	-92
	.byte	11
	.byte	104
	.byte	3
	.byte	125
	.byte	10
	.byte	54
	.byte	6
	.byte	-94
	.byte	8
	.byte	90
	.byte	2
	.byte	54
	.byte	7
	.byte	9
	.byte	3
	.byte	-109
	.byte	0
	.byte	122
	.byte	8
	.byte	-9
	.byte	9
	.byte	-10
	.byte	0
	.byte	-116
	.byte	6
	.byte	-37
	.byte	6
	.byte	-52
	.byte	1
	.byte	35
	.byte	1
	.byte	-21
	.byte	0
	.byte	80
	.byte	12
	.byte	-74
	.byte	10
	.byte	91
	.byte	11
	.byte	-104
	.byte	12
	.byte	-13
	.byte	6
	.byte	-102
	.byte	9
	.byte	-29
	.byte	4
	.byte	-74
	.byte	9
	.byte	-42
	.byte	10
	.byte	83
	.byte	11
	.byte	79
	.byte	4
	.byte	-5
	.byte	4
	.byte	92
	.byte	10
	.byte	41
	.byte	4
	.byte	65
	.byte	11
	.byte	-43
	.byte	2
	.byte	-28
	.byte	5
	.byte	64
	.byte	9
	.byte	-114
	.byte	1
	.byte	-73
	.byte	3
	.byte	-9
	.byte	0
	.byte	-115
	.byte	5
	.byte	-106
	.byte	12
	.byte	-61
	.byte	9
	.byte	15
	.byte	1
	.byte	90
	.byte	0
	.byte	85
	.byte	3
	.byte	68
	.byte	7
	.byte	-125
	.byte	12
	.byte	-118
	.byte	4
	.byte	82
	.byte	6
	.byte	-102
	.byte	2
	.byte	64
	.byte	1
	.byte	8
	.byte	0
	.byte	-3
	.byte	10
	.byte	8
	.byte	6
	.byte	26
	.byte	1
	.byte	46
	.byte	7
	.byte	13
	.byte	5
	.byte	10
	.byte	9
	.byte	40
	.byte	2
	.byte	117
	.byte	10
	.byte	58
	.byte	8
	.byte	35
	.byte	6
	.byte	-51
	.byte	0
	.byte	102
	.byte	11
	.byte	6
	.byte	6
	.byte	-95
	.byte	10
	.byte	37
	.byte	10
	.byte	8
	.byte	9
	.byte	-87
	.byte	2
	.byte	-126
	.byte	0
	.byte	66
	.byte	6
	.byte	79
	.byte	7
	.byte	61
	.byte	3
	.byte	-126
	.byte	11
	.byte	-7
	.byte	11
	.byte	45
	.byte	5
	.byte	-60
	.byte	10
	.byte	69
	.byte	7
	.byte	-62
	.byte	5
	.byte	-78
	.byte	4
	.byte	63
	.byte	9
	.byte	75
	.byte	12
	.byte	-40
	.byte	6
	.byte	-109
	.byte	10
	.byte	-85
	.byte	0
	.byte	55
	.byte	12
	.byte	-30
	.byte	11
	.byte	115
	.byte	7
	.byte	44
	.byte	7
	.byte	-19
	.byte	5
	.byte	103
	.byte	1
	.byte	-10
	.byte	2
	.byte	-95
	.byte	5
G$jzetas:
	.byte	-19
	.byte	8
	.byte	11
	.byte	10
	.byte	-102
	.byte	11
	.byte	20
	.byte	7
	.byte	-43
	.byte	5
	.byte	-114
	.byte	5
	.byte	31
	.byte	1
	.byte	-54
	.byte	0
	.byte	86
	.byte	12
	.byte	110
	.byte	2
	.byte	41
	.byte	6
	.byte	-74
	.byte	0
	.byte	-62
	.byte	3
	.byte	79
	.byte	8
	.byte	63
	.byte	7
	.byte	-68
	.byte	5
	.byte	61
	.byte	2
	.byte	-44
	.byte	7
	.byte	8
	.byte	1
	.byte	127
	.byte	1
	.byte	-60
	.byte	9
	.byte	-78
	.byte	5
	.byte	-65
	.byte	6
	.byte	127
	.byte	12
	.byte	88
	.byte	10
	.byte	-7
	.byte	3
	.byte	-36
	.byte	2
	.byte	96
	.byte	2
	.byte	-5
	.byte	6
	.byte	-101
	.byte	1
	.byte	52
	.byte	12
	.byte	-34
	.byte	6
	.byte	-57
	.byte	4
	.byte	-116
	.byte	2
	.byte	-39
	.byte	10
	.byte	-9
	.byte	3
	.byte	-12
	.byte	7
	.byte	-45
	.byte	5
	.byte	-25
	.byte	11
	.byte	-7
	.byte	6
	.byte	4
	.byte	2
	.byte	-7
	.byte	12
	.byte	-63
	.byte	11
	.byte	103
	.byte	10
	.byte	-81
	.byte	6
	.byte	119
	.byte	8
	.byte	126
	.byte	0
	.byte	-67
	.byte	5
	.byte	-84
	.byte	9
	.byte	-89
	.byte	12
	.byte	-14
	.byte	11
	.byte	62
	.byte	3
	.byte	107
	.byte	0
	.byte	116
	.byte	7
	.byte	10
	.byte	12
	.byte	74
	.byte	9
	.byte	115
	.byte	11
	.byte	-63
	.byte	3
	.byte	29
	.byte	7
	.byte	44
	.byte	10
	.byte	-64
	.byte	1
	.byte	-40
	.byte	8
	.byte	-91
	.byte	2
	.byte	6
	.byte	8
	.byte	-78
	.byte	8
	.byte	-82
	.byte	1
	.byte	43
	.byte	2
	.byte	75
	.byte	3
	.byte	30
	.byte	8
	.byte	103
	.byte	3
	.byte	14
	.byte	6
	.byte	105
	.byte	0
	.byte	-90
	.byte	1
	.byte	75
	.byte	2
	.byte	-79
	.byte	0
	.byte	22
	.byte	12
	.byte	-34
	.byte	11
	.byte	53
	.byte	11
	.byte	38
	.byte	6
	.byte	117
	.byte	6
	.byte	11
	.byte	12
	.byte	10
	.byte	3
	.byte	-121
	.byte	4
	.byte	110
	.byte	12
	.byte	-8
	.byte	9
	.byte	-53
	.byte	5
	.byte	-89
	.byte	10
	.byte	95
	.byte	4
	.byte	-53
	.byte	6
	.byte	-124
	.byte	2
	.byte	-103
	.byte	9
	.byte	93
	.byte	1
	.byte	-94
	.byte	1
	.byte	73
	.byte	1
	.byte	101
	.byte	12
	.byte	-74
	.byte	12
	.byte	49
	.byte	3
	.byte	73
	.byte	4
	.byte	91
	.byte	2
	.byte	98
	.byte	2
	.byte	42
	.byte	5
	.byte	-4
	.byte	7
	.byte	72
	.byte	7
	.byte	-128
	.byte	1
	.byte	66
	.byte	8
	.byte	121
	.byte	12
	.byte	-62
	.byte	4
	.byte	-54
	.byte	7
	.byte	-105
	.byte	9
	.byte	-36
	.byte	0
	.byte	94
	.byte	8
	.byte	-122
	.byte	6
	.byte	96
	.byte	8
	.byte	7
	.byte	7
	.byte	3
	.byte	8
	.byte	26
	.byte	3
	.byte	27
	.byte	7
	.byte	-85
	.byte	9
	.byte	-101
	.byte	9
	.byte	-34
	.byte	1
	.byte	-107
	.byte	12
	.byte	-51
	.byte	11
	.byte	-28
	.byte	3
	.byte	-33
	.byte	3
	.byte	-66
	.byte	3
	.byte	77
	.byte	7
	.byte	-14
	.byte	5
	.byte	92
	.byte	6
