	.att_syntax
	.text
	.p2align	5
	.global	_jade_kem_mlkem_mlkem1024_amd64_avx2_dec
	.global	jade_kem_mlkem_mlkem1024_amd64_avx2_dec
	.global	_jade_kem_mlkem_mlkem1024_amd64_avx2_enc
	.global	jade_kem_mlkem_mlkem1024_amd64_avx2_enc
	.global	_jade_kem_mlkem_mlkem1024_amd64_avx2_keypair
	.global	jade_kem_mlkem_mlkem1024_amd64_avx2_keypair
	.global	_jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand
	.global	jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand
	.global	_jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand
	.global	jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand
	.type	_jade_kem_mlkem_mlkem1024_amd64_avx2_dec, %function
	.type	jade_kem_mlkem_mlkem1024_amd64_avx2_dec, %function
_jade_kem_mlkem_mlkem1024_amd64_avx2_dec:
jade_kem_mlkem_mlkem1024_amd64_avx2_dec:
	movq	%rsp, %rax
	leaq	-21824(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 21768(%rsp)
	movq	%rbp, 21776(%rsp)
	movq	%r12, 21784(%rsp)
	movq	%r13, 21792(%rsp)
	movq	%r14, 21800(%rsp)
	movq	%r15, 21808(%rsp)
	movq	%rax, 21816(%rsp)
	movq	%rsi, %r8
	lfence
	movq	$0, %rax
	movq	%rdi, %mm1
	movq	%r8, %mm2
	leaq	3136(%rdx), %rax
	movq	(%rax), %rcx
	movq	%rcx, 3744(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 3752(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 3760(%rsp)
	movq	24(%rax), %rcx
	movq	%rcx, 3768(%rsp)
	movq	%rsp, %rax
	movq	%rdx, %rcx
	leaq	5344(%rsp), %r12
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 288(%rip), %ymm1
	vmovdqu	glob_data + 256(%rip), %ymm2
	vmovdqu	glob_data + 224(%rip), %ymm3
	vmovdqu	glob_data + 192(%rip), %ymm4
	vpbroadcastw	glob_data + 5186(%rip), %ymm5
	vmovdqu	(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, (%r12)
	vmovdqu	22(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 32(%r12)
	vmovdqu	44(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 64(%r12)
	vmovdqu	66(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 96(%r12)
	vmovdqu	88(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 128(%r12)
	vmovdqu	110(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 160(%r12)
	vmovdqu	132(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 192(%r12)
	vmovdqu	154(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 224(%r12)
	vmovdqu	176(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 256(%r12)
	vmovdqu	198(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 288(%r12)
	vmovdqu	220(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 320(%r12)
	vmovdqu	242(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 352(%r12)
	vmovdqu	264(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 384(%r12)
	vmovdqu	286(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 416(%r12)
	vmovdqu	308(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 448(%r12)
	vmovdqu	330(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 480(%r12)
	vmovdqu	352(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 512(%r12)
	vmovdqu	374(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 544(%r12)
	vmovdqu	396(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 576(%r12)
	vmovdqu	418(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 608(%r12)
	vmovdqu	440(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 640(%r12)
	vmovdqu	462(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 672(%r12)
	vmovdqu	484(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 704(%r12)
	vmovdqu	506(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 736(%r12)
	vmovdqu	528(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 768(%r12)
	vmovdqu	550(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 800(%r12)
	vmovdqu	572(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 832(%r12)
	vmovdqu	594(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 864(%r12)
	vmovdqu	616(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 896(%r12)
	vmovdqu	638(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 928(%r12)
	vmovdqu	660(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 960(%r12)
	vmovdqu	682(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 992(%r12)
	vmovdqu	704(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1024(%r12)
	vmovdqu	726(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1056(%r12)
	vmovdqu	748(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1088(%r12)
	vmovdqu	770(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1120(%r12)
	vmovdqu	792(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1152(%r12)
	vmovdqu	814(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1184(%r12)
	vmovdqu	836(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1216(%r12)
	vmovdqu	858(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1248(%r12)
	vmovdqu	880(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1280(%r12)
	vmovdqu	902(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1312(%r12)
	vmovdqu	924(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1344(%r12)
	vmovdqu	946(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1376(%r12)
	vmovdqu	968(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1408(%r12)
	vmovdqu	990(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1440(%r12)
	vmovdqu	1012(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1472(%r12)
	vmovdqu	1034(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1504(%r12)
	vmovdqu	1056(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1536(%r12)
	vmovdqu	1078(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1568(%r12)
	vmovdqu	1100(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1600(%r12)
	vmovdqu	1122(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1632(%r12)
	vmovdqu	1144(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1664(%r12)
	vmovdqu	1166(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1696(%r12)
	vmovdqu	1188(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1728(%r12)
	vmovdqu	1210(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1760(%r12)
	vmovdqu	1232(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1792(%r12)
	vmovdqu	1254(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1824(%r12)
	vmovdqu	1276(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1856(%r12)
	vmovdqu	1298(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1888(%r12)
	vmovdqu	1320(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1920(%r12)
	vmovdqu	1342(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1952(%r12)
	vmovdqu	1364(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1984(%r12)
	vmovdqu	1386(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm2
	vpsrlvq	%ymm3, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpsrlw	$1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 2016(%r12)
	leaq	128(%rsp), %rsi
	leaq	1408(%r8), %r8
	leaq	-24(%rsp), %rsp
	call	L_i_poly_decompress$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$85:
	leaq	24(%rsp), %rsp
	leaq	7392(%rsp), %r8
	movq	%rcx, %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$84:
	leaq	7904(%rsp), %r8
	leaq	384(%rcx), %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$83:
	leaq	8416(%rsp), %r8
	leaq	768(%rcx), %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$82:
	leaq	8928(%rsp), %r8
	leaq	1152(%rcx), %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$81:
	leaq	5344(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$80:
	leaq	5856(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$79:
	leaq	6368(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$78:
	leaq	6880(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$77:
	leaq	640(%rsp), %rsi
	leaq	7392(%rsp), %rcx
	leaq	5344(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$76:
	leaq	1152(%rsp), %rsi
	leaq	7904(%rsp), %rcx
	leaq	5856(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$75:
	leaq	640(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$74:
	leaq	1152(%rsp), %rsi
	leaq	8416(%rsp), %rcx
	leaq	6368(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$73:
	leaq	640(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$72:
	leaq	1152(%rsp), %rsi
	leaq	8928(%rsp), %rcx
	leaq	6880(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$71:
	leaq	640(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$70:
	leaq	640(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$69:
	leaq	1152(%rsp), %rsi
	leaq	128(%rsp), %rcx
	leaq	640(%rsp), %rdi
	call	L_poly_sub$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$68:
	leaq	1152(%rsp), %rsi
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rsi)
	vmovdqu	32(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rsi)
	vmovdqu	64(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rsi)
	vmovdqu	96(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rsi)
	vmovdqu	128(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rsi)
	vmovdqu	160(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rsi)
	vmovdqu	192(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rsi)
	vmovdqu	224(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rsi)
	vmovdqu	256(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rsi)
	vmovdqu	288(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rsi)
	vmovdqu	320(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rsi)
	vmovdqu	352(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rsi)
	vmovdqu	384(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rsi)
	vmovdqu	416(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rsi)
	vmovdqu	448(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rsi)
	vmovdqu	480(%rsi), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rsi)
	leaq	1152(%rsp), %rsi
	call	L_i_poly_tomsg$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$67:
	leaq	3104(%rdx), %rax
	movq	(%rax), %rcx
	movq	%rcx, 32(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 40(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 48(%rsp)
	movq	24(%rax), %rcx
	movq	%rcx, 56(%rsp)
	leaq	64(%rsp), %rsi
	movq	%rsp, %rbp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$66:
	leaq	2176(%rsp), %rbx
	movq	%rsp, %rax
	leaq	1536(%rdx), %rbp
	leaq	96(%rsp), %rdi
	movq	%rbx, %mm3
	movq	%rbp, %rsi
	leaq	5344(%rsp), %r8
	movq	%rsi, %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$65:
	leaq	5856(%rsp), %r8
	leaq	384(%rsi), %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$64:
	leaq	6368(%rsp), %r8
	leaq	768(%rsi), %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$63:
	leaq	6880(%rsp), %r8
	leaq	1152(%rsi), %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$62:
	movq	1536(%rbp), %rcx
	movq	%rcx, 21736(%rsp)
	movq	1544(%rbp), %rcx
	movq	%rcx, 21744(%rsp)
	movq	1552(%rbp), %rcx
	movq	%rcx, 21752(%rsp)
	movq	1560(%rbp), %rcx
	movq	%rcx, 21760(%rsp)
	leaq	1152(%rsp), %rsi
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$61:
	movq	$1, %rcx
	leaq	13536(%rsp), %rax
	leaq	21736(%rsp), %rdx
	leaq	-2168(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$60:
	leaq	2168(%rsp), %rsp
	movb	$0, %r9b
	leaq	7392(%rsp), %rax
	leaq	7904(%rsp), %rcx
	leaq	8416(%rsp), %rdx
	leaq	8928(%rsp), %r8
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$59:
	leaq	600(%rsp), %rsp
	movb	$4, %r9b
	leaq	9440(%rsp), %rax
	leaq	9952(%rsp), %rcx
	leaq	10464(%rsp), %rdx
	leaq	10976(%rsp), %r8
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$58:
	leaq	600(%rsp), %rsp
	movb	$8, %al
	leaq	640(%rsp), %rsi
	leaq	-184(%rsp), %rsp
	call	L_poly_getnoise_eta2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$57:
	leaq	184(%rsp), %rsp
	leaq	7392(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$56:
	leaq	7904(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$55:
	leaq	8416(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$54:
	leaq	8928(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$53:
	leaq	11488(%rsp), %rsi
	leaq	13536(%rsp), %rcx
	leaq	7392(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$52:
	leaq	128(%rsp), %rsi
	leaq	14048(%rsp), %rcx
	leaq	7904(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$51:
	leaq	11488(%rsp), %rsi
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$50:
	leaq	128(%rsp), %rsi
	leaq	14560(%rsp), %rcx
	leaq	8416(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$49:
	leaq	11488(%rsp), %rsi
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$48:
	leaq	128(%rsp), %rsi
	leaq	15072(%rsp), %rcx
	leaq	8928(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$47:
	leaq	11488(%rsp), %rsi
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$46:
	leaq	12000(%rsp), %rsi
	leaq	15584(%rsp), %rcx
	leaq	7392(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$45:
	leaq	128(%rsp), %rsi
	leaq	16096(%rsp), %rcx
	leaq	7904(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$44:
	leaq	12000(%rsp), %rsi
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$43:
	leaq	128(%rsp), %rsi
	leaq	16608(%rsp), %rcx
	leaq	8416(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$42:
	leaq	12000(%rsp), %rsi
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$41:
	leaq	128(%rsp), %rsi
	leaq	17120(%rsp), %rcx
	leaq	8928(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$40:
	leaq	12000(%rsp), %rsi
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$39:
	leaq	12512(%rsp), %rsi
	leaq	17632(%rsp), %rcx
	leaq	7392(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$38:
	leaq	128(%rsp), %rsi
	leaq	18144(%rsp), %rcx
	leaq	7904(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$37:
	leaq	12512(%rsp), %rsi
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$36:
	leaq	128(%rsp), %rsi
	leaq	18656(%rsp), %rcx
	leaq	8416(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$35:
	leaq	12512(%rsp), %rsi
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$34:
	leaq	128(%rsp), %rsi
	leaq	19168(%rsp), %rcx
	leaq	8928(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$33:
	leaq	12512(%rsp), %rsi
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$32:
	leaq	13024(%rsp), %rsi
	leaq	19680(%rsp), %rcx
	leaq	7392(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$31:
	leaq	128(%rsp), %rsi
	leaq	20192(%rsp), %rcx
	leaq	7904(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$30:
	leaq	13024(%rsp), %rsi
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$29:
	leaq	128(%rsp), %rsi
	leaq	20704(%rsp), %rcx
	leaq	8416(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$28:
	leaq	13024(%rsp), %rsi
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$27:
	leaq	128(%rsp), %rsi
	leaq	21216(%rsp), %rcx
	leaq	8928(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$26:
	leaq	13024(%rsp), %rsi
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$25:
	leaq	128(%rsp), %rsi
	leaq	5344(%rsp), %rcx
	leaq	7392(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$24:
	leaq	1664(%rsp), %rsi
	leaq	5856(%rsp), %rcx
	leaq	7904(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$23:
	leaq	128(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$22:
	leaq	1664(%rsp), %rsi
	leaq	6368(%rsp), %rcx
	leaq	8416(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$21:
	leaq	128(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$20:
	leaq	1664(%rsp), %rsi
	leaq	6880(%rsp), %rcx
	leaq	8928(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$19:
	leaq	128(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$18:
	leaq	11488(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$17:
	leaq	12000(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$16:
	leaq	12512(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$15:
	leaq	13024(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$14:
	leaq	128(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$13:
	leaq	11488(%rsp), %rsi
	leaq	9440(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$12:
	leaq	12000(%rsp), %rsi
	leaq	9952(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$11:
	leaq	12512(%rsp), %rsi
	leaq	10464(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$10:
	leaq	13024(%rsp), %rsi
	leaq	10976(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$9:
	leaq	128(%rsp), %rsi
	leaq	640(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$8:
	leaq	128(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$7:
	leaq	11488(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	12000(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	12512(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	13024(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	128(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	movq	%mm3, %rbx
	movq	%rbx, %rax
	leaq	11488(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$6:
	leaq	12000(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$5:
	leaq	12512(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$4:
	leaq	13024(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$3:
	vmovdqu	glob_data + 1120(%rip), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 5184(%rip), %ymm2
	vpbroadcastw	glob_data + 5182(%rip), %ymm3
	vpbroadcastw	glob_data + 5180(%rip), %ymm5
	vpbroadcastq	glob_data + 4968(%rip), %ymm4
	vpbroadcastq	glob_data + 4960(%rip), %ymm6
	vmovdqu	glob_data + 160(%rip), %ymm7
	vmovdqu	glob_data + 128(%rip), %ymm8
	vmovdqu	11488(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, (%rax)
	movq	%xmm9, 16(%rax)
	vmovdqu	11520(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 22(%rax)
	movq	%xmm9, 38(%rax)
	vmovdqu	11552(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 44(%rax)
	movq	%xmm9, 60(%rax)
	vmovdqu	11584(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 66(%rax)
	movq	%xmm9, 82(%rax)
	vmovdqu	11616(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 88(%rax)
	movq	%xmm9, 104(%rax)
	vmovdqu	11648(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 110(%rax)
	movq	%xmm9, 126(%rax)
	vmovdqu	11680(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 132(%rax)
	movq	%xmm9, 148(%rax)
	vmovdqu	11712(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 154(%rax)
	movq	%xmm9, 170(%rax)
	vmovdqu	11744(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 176(%rax)
	movq	%xmm9, 192(%rax)
	vmovdqu	11776(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 198(%rax)
	movq	%xmm9, 214(%rax)
	vmovdqu	11808(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 220(%rax)
	movq	%xmm9, 236(%rax)
	vmovdqu	11840(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 242(%rax)
	movq	%xmm9, 258(%rax)
	vmovdqu	11872(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 264(%rax)
	movq	%xmm9, 280(%rax)
	vmovdqu	11904(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 286(%rax)
	movq	%xmm9, 302(%rax)
	vmovdqu	11936(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 308(%rax)
	movq	%xmm9, 324(%rax)
	vmovdqu	11968(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 330(%rax)
	movq	%xmm9, 346(%rax)
	vmovdqu	12000(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 352(%rax)
	movq	%xmm9, 368(%rax)
	vmovdqu	12032(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 374(%rax)
	movq	%xmm9, 390(%rax)
	vmovdqu	12064(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 396(%rax)
	movq	%xmm9, 412(%rax)
	vmovdqu	12096(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 418(%rax)
	movq	%xmm9, 434(%rax)
	vmovdqu	12128(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 440(%rax)
	movq	%xmm9, 456(%rax)
	vmovdqu	12160(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 462(%rax)
	movq	%xmm9, 478(%rax)
	vmovdqu	12192(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 484(%rax)
	movq	%xmm9, 500(%rax)
	vmovdqu	12224(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 506(%rax)
	movq	%xmm9, 522(%rax)
	vmovdqu	12256(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 528(%rax)
	movq	%xmm9, 544(%rax)
	vmovdqu	12288(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 550(%rax)
	movq	%xmm9, 566(%rax)
	vmovdqu	12320(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 572(%rax)
	movq	%xmm9, 588(%rax)
	vmovdqu	12352(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 594(%rax)
	movq	%xmm9, 610(%rax)
	vmovdqu	12384(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 616(%rax)
	movq	%xmm9, 632(%rax)
	vmovdqu	12416(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 638(%rax)
	movq	%xmm9, 654(%rax)
	vmovdqu	12448(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 660(%rax)
	movq	%xmm9, 676(%rax)
	vmovdqu	12480(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 682(%rax)
	movq	%xmm9, 698(%rax)
	vmovdqu	12512(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 704(%rax)
	movq	%xmm9, 720(%rax)
	vmovdqu	12544(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 726(%rax)
	movq	%xmm9, 742(%rax)
	vmovdqu	12576(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 748(%rax)
	movq	%xmm9, 764(%rax)
	vmovdqu	12608(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 770(%rax)
	movq	%xmm9, 786(%rax)
	vmovdqu	12640(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 792(%rax)
	movq	%xmm9, 808(%rax)
	vmovdqu	12672(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 814(%rax)
	movq	%xmm9, 830(%rax)
	vmovdqu	12704(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 836(%rax)
	movq	%xmm9, 852(%rax)
	vmovdqu	12736(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 858(%rax)
	movq	%xmm9, 874(%rax)
	vmovdqu	12768(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 880(%rax)
	movq	%xmm9, 896(%rax)
	vmovdqu	12800(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 902(%rax)
	movq	%xmm9, 918(%rax)
	vmovdqu	12832(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 924(%rax)
	movq	%xmm9, 940(%rax)
	vmovdqu	12864(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 946(%rax)
	movq	%xmm9, 962(%rax)
	vmovdqu	12896(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 968(%rax)
	movq	%xmm9, 984(%rax)
	vmovdqu	12928(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 990(%rax)
	movq	%xmm9, 1006(%rax)
	vmovdqu	12960(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1012(%rax)
	movq	%xmm9, 1028(%rax)
	vmovdqu	12992(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1034(%rax)
	movq	%xmm9, 1050(%rax)
	vmovdqu	13024(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1056(%rax)
	movq	%xmm9, 1072(%rax)
	vmovdqu	13056(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1078(%rax)
	movq	%xmm9, 1094(%rax)
	vmovdqu	13088(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1100(%rax)
	movq	%xmm9, 1116(%rax)
	vmovdqu	13120(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1122(%rax)
	movq	%xmm9, 1138(%rax)
	vmovdqu	13152(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1144(%rax)
	movq	%xmm9, 1160(%rax)
	vmovdqu	13184(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1166(%rax)
	movq	%xmm9, 1182(%rax)
	vmovdqu	13216(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1188(%rax)
	movq	%xmm9, 1204(%rax)
	vmovdqu	13248(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1210(%rax)
	movq	%xmm9, 1226(%rax)
	vmovdqu	13280(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1232(%rax)
	movq	%xmm9, 1248(%rax)
	vmovdqu	13312(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1254(%rax)
	movq	%xmm9, 1270(%rax)
	vmovdqu	13344(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1276(%rax)
	movq	%xmm9, 1292(%rax)
	vmovdqu	13376(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1298(%rax)
	movq	%xmm9, 1314(%rax)
	vmovdqu	13408(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1320(%rax)
	movq	%xmm9, 1336(%rax)
	vmovdqu	13440(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1342(%rax)
	movq	%xmm9, 1358(%rax)
	vmovdqu	13472(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1364(%rax)
	movq	%xmm9, 1380(%rax)
	vmovdqu	13504(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm3
	vpand	%ymm5, %ymm3, %ymm3
	vpmaddwd	%ymm4, %ymm3, %ymm3
	vpsllvd	%ymm6, %ymm3, %ymm3
	vpsrldq	$8, %ymm3, %ymm4
	vpsrlvq	%ymm7, %ymm3, %ymm3
	vpsllq	$34, %ymm4, %ymm4
	vpor	%ymm4, %ymm3, %ymm3
	vpshufb	%ymm8, %ymm3, %ymm3
	vmovdqu	%xmm3, %xmm2
	vextracti128	$1, %ymm3, %xmm3
	vpblendvb	%xmm8, %xmm3, %xmm2, %xmm2
	vmovdqu	%xmm2, 1386(%rax)
	movq	%xmm3, 1402(%rax)
	leaq	1408(%rbx), %rax
	leaq	128(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$2:
	vmovdqu	glob_data + 1120(%rip), %ymm0
	vpbroadcastw	glob_data + 5190(%rip), %ymm3
	vpbroadcastw	glob_data + 5192(%rip), %ymm5
	vpbroadcastw	glob_data + 5188(%rip), %ymm4
	vpbroadcastd	glob_data + 5176(%rip), %ymm1
	vpbroadcastq	glob_data + 4976(%rip), %ymm6
	vmovdqu	glob_data + 416(%rip), %ymm8
	vmovdqu	(%rsi), %ymm9
	vmovdqu	32(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, (%rax)
	movd	%xmm7, 16(%rax)
	vmovdqu	64(%rsi), %ymm9
	vmovdqu	96(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 20(%rax)
	movd	%xmm7, 36(%rax)
	vmovdqu	128(%rsi), %ymm9
	vmovdqu	160(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 40(%rax)
	movd	%xmm7, 56(%rax)
	vmovdqu	192(%rsi), %ymm9
	vmovdqu	224(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 60(%rax)
	movd	%xmm7, 76(%rax)
	vmovdqu	256(%rsi), %ymm9
	vmovdqu	288(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 80(%rax)
	movd	%xmm7, 96(%rax)
	vmovdqu	320(%rsi), %ymm9
	vmovdqu	352(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 100(%rax)
	movd	%xmm7, 116(%rax)
	vmovdqu	384(%rsi), %ymm9
	vmovdqu	416(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 120(%rax)
	movd	%xmm7, 136(%rax)
	vmovdqu	448(%rsi), %ymm9
	vmovdqu	480(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm3
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm3, %ymm3
	vpmaddubsw	%ymm4, %ymm3, %ymm3
	vpmaddwd	%ymm1, %ymm3, %ymm3
	vpsllvd	%ymm6, %ymm3, %ymm3
	vpsrlvq	%ymm6, %ymm3, %ymm3
	vpshufb	%ymm8, %ymm3, %ymm3
	vmovdqu	%xmm3, %xmm2
	vextracti128	$1, %ymm3, %xmm3
	vpblendvb	%xmm8, %xmm3, %xmm2, %xmm2
	vmovdqu	%xmm2, 140(%rax)
	movd	%xmm3, 156(%rax)
	movq	%mm2, %rbx
	leaq	2176(%rsp), %rcx
	movq	$0, %rax
	movq	$1, %rdx
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	(%rcx), %ymm2
	vmovdqu	(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	32(%rcx), %ymm2
	vmovdqu	32(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	64(%rcx), %ymm2
	vmovdqu	64(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	96(%rcx), %ymm2
	vmovdqu	96(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	128(%rcx), %ymm2
	vmovdqu	128(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	160(%rcx), %ymm2
	vmovdqu	160(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	192(%rcx), %ymm2
	vmovdqu	192(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	224(%rcx), %ymm2
	vmovdqu	224(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	256(%rcx), %ymm2
	vmovdqu	256(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	288(%rcx), %ymm2
	vmovdqu	288(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	320(%rcx), %ymm2
	vmovdqu	320(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	352(%rcx), %ymm2
	vmovdqu	352(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	384(%rcx), %ymm2
	vmovdqu	384(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	416(%rcx), %ymm2
	vmovdqu	416(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	448(%rcx), %ymm2
	vmovdqu	448(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	480(%rcx), %ymm2
	vmovdqu	480(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	512(%rcx), %ymm2
	vmovdqu	512(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	544(%rcx), %ymm2
	vmovdqu	544(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	576(%rcx), %ymm2
	vmovdqu	576(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	608(%rcx), %ymm2
	vmovdqu	608(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	640(%rcx), %ymm2
	vmovdqu	640(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	672(%rcx), %ymm2
	vmovdqu	672(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	704(%rcx), %ymm2
	vmovdqu	704(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	736(%rcx), %ymm2
	vmovdqu	736(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	768(%rcx), %ymm2
	vmovdqu	768(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	800(%rcx), %ymm2
	vmovdqu	800(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	832(%rcx), %ymm2
	vmovdqu	832(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	864(%rcx), %ymm2
	vmovdqu	864(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	896(%rcx), %ymm2
	vmovdqu	896(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	928(%rcx), %ymm2
	vmovdqu	928(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	960(%rcx), %ymm2
	vmovdqu	960(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	992(%rcx), %ymm2
	vmovdqu	992(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1024(%rcx), %ymm2
	vmovdqu	1024(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1056(%rcx), %ymm2
	vmovdqu	1056(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1088(%rcx), %ymm2
	vmovdqu	1088(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1120(%rcx), %ymm2
	vmovdqu	1120(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1152(%rcx), %ymm2
	vmovdqu	1152(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1184(%rcx), %ymm2
	vmovdqu	1184(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1216(%rcx), %ymm2
	vmovdqu	1216(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1248(%rcx), %ymm2
	vmovdqu	1248(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1280(%rcx), %ymm2
	vmovdqu	1280(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1312(%rcx), %ymm2
	vmovdqu	1312(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1344(%rcx), %ymm2
	vmovdqu	1344(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1376(%rcx), %ymm2
	vmovdqu	1376(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1408(%rcx), %ymm2
	vmovdqu	1408(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1440(%rcx), %ymm2
	vmovdqu	1440(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1472(%rcx), %ymm2
	vmovdqu	1472(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1504(%rcx), %ymm2
	vmovdqu	1504(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1536(%rcx), %ymm2
	vmovdqu	1536(%rbx), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vptest	%ymm0, %ymm0
	cmovne	%rdx, %rax
	movq	(%rbx), %rcx
	movq	%rcx, 3776(%rsp)
	movq	8(%rbx), %rcx
	movq	%rcx, 3784(%rsp)
	movq	16(%rbx), %rcx
	movq	%rcx, 3792(%rsp)
	movq	24(%rbx), %rcx
	movq	%rcx, 3800(%rsp)
	movq	32(%rbx), %rcx
	movq	%rcx, 3808(%rsp)
	movq	40(%rbx), %rcx
	movq	%rcx, 3816(%rsp)
	movq	48(%rbx), %rcx
	movq	%rcx, 3824(%rsp)
	movq	56(%rbx), %rcx
	movq	%rcx, 3832(%rsp)
	movq	64(%rbx), %rcx
	movq	%rcx, 3840(%rsp)
	movq	72(%rbx), %rcx
	movq	%rcx, 3848(%rsp)
	movq	80(%rbx), %rcx
	movq	%rcx, 3856(%rsp)
	movq	88(%rbx), %rcx
	movq	%rcx, 3864(%rsp)
	movq	96(%rbx), %rcx
	movq	%rcx, 3872(%rsp)
	movq	104(%rbx), %rcx
	movq	%rcx, 3880(%rsp)
	movq	112(%rbx), %rcx
	movq	%rcx, 3888(%rsp)
	movq	120(%rbx), %rcx
	movq	%rcx, 3896(%rsp)
	movq	128(%rbx), %rcx
	movq	%rcx, 3904(%rsp)
	movq	136(%rbx), %rcx
	movq	%rcx, 3912(%rsp)
	movq	144(%rbx), %rcx
	movq	%rcx, 3920(%rsp)
	movq	152(%rbx), %rcx
	movq	%rcx, 3928(%rsp)
	movq	160(%rbx), %rcx
	movq	%rcx, 3936(%rsp)
	movq	168(%rbx), %rcx
	movq	%rcx, 3944(%rsp)
	movq	176(%rbx), %rcx
	movq	%rcx, 3952(%rsp)
	movq	184(%rbx), %rcx
	movq	%rcx, 3960(%rsp)
	movq	192(%rbx), %rcx
	movq	%rcx, 3968(%rsp)
	movq	200(%rbx), %rcx
	movq	%rcx, 3976(%rsp)
	movq	208(%rbx), %rcx
	movq	%rcx, 3984(%rsp)
	movq	216(%rbx), %rcx
	movq	%rcx, 3992(%rsp)
	movq	224(%rbx), %rcx
	movq	%rcx, 4000(%rsp)
	movq	232(%rbx), %rcx
	movq	%rcx, 4008(%rsp)
	movq	240(%rbx), %rcx
	movq	%rcx, 4016(%rsp)
	movq	248(%rbx), %rcx
	movq	%rcx, 4024(%rsp)
	movq	256(%rbx), %rcx
	movq	%rcx, 4032(%rsp)
	movq	264(%rbx), %rcx
	movq	%rcx, 4040(%rsp)
	movq	272(%rbx), %rcx
	movq	%rcx, 4048(%rsp)
	movq	280(%rbx), %rcx
	movq	%rcx, 4056(%rsp)
	movq	288(%rbx), %rcx
	movq	%rcx, 4064(%rsp)
	movq	296(%rbx), %rcx
	movq	%rcx, 4072(%rsp)
	movq	304(%rbx), %rcx
	movq	%rcx, 4080(%rsp)
	movq	312(%rbx), %rcx
	movq	%rcx, 4088(%rsp)
	movq	320(%rbx), %rcx
	movq	%rcx, 4096(%rsp)
	movq	328(%rbx), %rcx
	movq	%rcx, 4104(%rsp)
	movq	336(%rbx), %rcx
	movq	%rcx, 4112(%rsp)
	movq	344(%rbx), %rcx
	movq	%rcx, 4120(%rsp)
	movq	352(%rbx), %rcx
	movq	%rcx, 4128(%rsp)
	movq	360(%rbx), %rcx
	movq	%rcx, 4136(%rsp)
	movq	368(%rbx), %rcx
	movq	%rcx, 4144(%rsp)
	movq	376(%rbx), %rcx
	movq	%rcx, 4152(%rsp)
	movq	384(%rbx), %rcx
	movq	%rcx, 4160(%rsp)
	movq	392(%rbx), %rcx
	movq	%rcx, 4168(%rsp)
	movq	400(%rbx), %rcx
	movq	%rcx, 4176(%rsp)
	movq	408(%rbx), %rcx
	movq	%rcx, 4184(%rsp)
	movq	416(%rbx), %rcx
	movq	%rcx, 4192(%rsp)
	movq	424(%rbx), %rcx
	movq	%rcx, 4200(%rsp)
	movq	432(%rbx), %rcx
	movq	%rcx, 4208(%rsp)
	movq	440(%rbx), %rcx
	movq	%rcx, 4216(%rsp)
	movq	448(%rbx), %rcx
	movq	%rcx, 4224(%rsp)
	movq	456(%rbx), %rcx
	movq	%rcx, 4232(%rsp)
	movq	464(%rbx), %rcx
	movq	%rcx, 4240(%rsp)
	movq	472(%rbx), %rcx
	movq	%rcx, 4248(%rsp)
	movq	480(%rbx), %rcx
	movq	%rcx, 4256(%rsp)
	movq	488(%rbx), %rcx
	movq	%rcx, 4264(%rsp)
	movq	496(%rbx), %rcx
	movq	%rcx, 4272(%rsp)
	movq	504(%rbx), %rcx
	movq	%rcx, 4280(%rsp)
	movq	512(%rbx), %rcx
	movq	%rcx, 4288(%rsp)
	movq	520(%rbx), %rcx
	movq	%rcx, 4296(%rsp)
	movq	528(%rbx), %rcx
	movq	%rcx, 4304(%rsp)
	movq	536(%rbx), %rcx
	movq	%rcx, 4312(%rsp)
	movq	544(%rbx), %rcx
	movq	%rcx, 4320(%rsp)
	movq	552(%rbx), %rcx
	movq	%rcx, 4328(%rsp)
	movq	560(%rbx), %rcx
	movq	%rcx, 4336(%rsp)
	movq	568(%rbx), %rcx
	movq	%rcx, 4344(%rsp)
	movq	576(%rbx), %rcx
	movq	%rcx, 4352(%rsp)
	movq	584(%rbx), %rcx
	movq	%rcx, 4360(%rsp)
	movq	592(%rbx), %rcx
	movq	%rcx, 4368(%rsp)
	movq	600(%rbx), %rcx
	movq	%rcx, 4376(%rsp)
	movq	608(%rbx), %rcx
	movq	%rcx, 4384(%rsp)
	movq	616(%rbx), %rcx
	movq	%rcx, 4392(%rsp)
	movq	624(%rbx), %rcx
	movq	%rcx, 4400(%rsp)
	movq	632(%rbx), %rcx
	movq	%rcx, 4408(%rsp)
	movq	640(%rbx), %rcx
	movq	%rcx, 4416(%rsp)
	movq	648(%rbx), %rcx
	movq	%rcx, 4424(%rsp)
	movq	656(%rbx), %rcx
	movq	%rcx, 4432(%rsp)
	movq	664(%rbx), %rcx
	movq	%rcx, 4440(%rsp)
	movq	672(%rbx), %rcx
	movq	%rcx, 4448(%rsp)
	movq	680(%rbx), %rcx
	movq	%rcx, 4456(%rsp)
	movq	688(%rbx), %rcx
	movq	%rcx, 4464(%rsp)
	movq	696(%rbx), %rcx
	movq	%rcx, 4472(%rsp)
	movq	704(%rbx), %rcx
	movq	%rcx, 4480(%rsp)
	movq	712(%rbx), %rcx
	movq	%rcx, 4488(%rsp)
	movq	720(%rbx), %rcx
	movq	%rcx, 4496(%rsp)
	movq	728(%rbx), %rcx
	movq	%rcx, 4504(%rsp)
	movq	736(%rbx), %rcx
	movq	%rcx, 4512(%rsp)
	movq	744(%rbx), %rcx
	movq	%rcx, 4520(%rsp)
	movq	752(%rbx), %rcx
	movq	%rcx, 4528(%rsp)
	movq	760(%rbx), %rcx
	movq	%rcx, 4536(%rsp)
	movq	768(%rbx), %rcx
	movq	%rcx, 4544(%rsp)
	movq	776(%rbx), %rcx
	movq	%rcx, 4552(%rsp)
	movq	784(%rbx), %rcx
	movq	%rcx, 4560(%rsp)
	movq	792(%rbx), %rcx
	movq	%rcx, 4568(%rsp)
	movq	800(%rbx), %rcx
	movq	%rcx, 4576(%rsp)
	movq	808(%rbx), %rcx
	movq	%rcx, 4584(%rsp)
	movq	816(%rbx), %rcx
	movq	%rcx, 4592(%rsp)
	movq	824(%rbx), %rcx
	movq	%rcx, 4600(%rsp)
	movq	832(%rbx), %rcx
	movq	%rcx, 4608(%rsp)
	movq	840(%rbx), %rcx
	movq	%rcx, 4616(%rsp)
	movq	848(%rbx), %rcx
	movq	%rcx, 4624(%rsp)
	movq	856(%rbx), %rcx
	movq	%rcx, 4632(%rsp)
	movq	864(%rbx), %rcx
	movq	%rcx, 4640(%rsp)
	movq	872(%rbx), %rcx
	movq	%rcx, 4648(%rsp)
	movq	880(%rbx), %rcx
	movq	%rcx, 4656(%rsp)
	movq	888(%rbx), %rcx
	movq	%rcx, 4664(%rsp)
	movq	896(%rbx), %rcx
	movq	%rcx, 4672(%rsp)
	movq	904(%rbx), %rcx
	movq	%rcx, 4680(%rsp)
	movq	912(%rbx), %rcx
	movq	%rcx, 4688(%rsp)
	movq	920(%rbx), %rcx
	movq	%rcx, 4696(%rsp)
	movq	928(%rbx), %rcx
	movq	%rcx, 4704(%rsp)
	movq	936(%rbx), %rcx
	movq	%rcx, 4712(%rsp)
	movq	944(%rbx), %rcx
	movq	%rcx, 4720(%rsp)
	movq	952(%rbx), %rcx
	movq	%rcx, 4728(%rsp)
	movq	960(%rbx), %rcx
	movq	%rcx, 4736(%rsp)
	movq	968(%rbx), %rcx
	movq	%rcx, 4744(%rsp)
	movq	976(%rbx), %rcx
	movq	%rcx, 4752(%rsp)
	movq	984(%rbx), %rcx
	movq	%rcx, 4760(%rsp)
	movq	992(%rbx), %rcx
	movq	%rcx, 4768(%rsp)
	movq	1000(%rbx), %rcx
	movq	%rcx, 4776(%rsp)
	movq	1008(%rbx), %rcx
	movq	%rcx, 4784(%rsp)
	movq	1016(%rbx), %rcx
	movq	%rcx, 4792(%rsp)
	movq	1024(%rbx), %rcx
	movq	%rcx, 4800(%rsp)
	movq	1032(%rbx), %rcx
	movq	%rcx, 4808(%rsp)
	movq	1040(%rbx), %rcx
	movq	%rcx, 4816(%rsp)
	movq	1048(%rbx), %rcx
	movq	%rcx, 4824(%rsp)
	movq	1056(%rbx), %rcx
	movq	%rcx, 4832(%rsp)
	movq	1064(%rbx), %rcx
	movq	%rcx, 4840(%rsp)
	movq	1072(%rbx), %rcx
	movq	%rcx, 4848(%rsp)
	movq	1080(%rbx), %rcx
	movq	%rcx, 4856(%rsp)
	movq	1088(%rbx), %rcx
	movq	%rcx, 4864(%rsp)
	movq	1096(%rbx), %rcx
	movq	%rcx, 4872(%rsp)
	movq	1104(%rbx), %rcx
	movq	%rcx, 4880(%rsp)
	movq	1112(%rbx), %rcx
	movq	%rcx, 4888(%rsp)
	movq	1120(%rbx), %rcx
	movq	%rcx, 4896(%rsp)
	movq	1128(%rbx), %rcx
	movq	%rcx, 4904(%rsp)
	movq	1136(%rbx), %rcx
	movq	%rcx, 4912(%rsp)
	movq	1144(%rbx), %rcx
	movq	%rcx, 4920(%rsp)
	movq	1152(%rbx), %rcx
	movq	%rcx, 4928(%rsp)
	movq	1160(%rbx), %rcx
	movq	%rcx, 4936(%rsp)
	movq	1168(%rbx), %rcx
	movq	%rcx, 4944(%rsp)
	movq	1176(%rbx), %rcx
	movq	%rcx, 4952(%rsp)
	movq	1184(%rbx), %rcx
	movq	%rcx, 4960(%rsp)
	movq	1192(%rbx), %rcx
	movq	%rcx, 4968(%rsp)
	movq	1200(%rbx), %rcx
	movq	%rcx, 4976(%rsp)
	movq	1208(%rbx), %rcx
	movq	%rcx, 4984(%rsp)
	movq	1216(%rbx), %rcx
	movq	%rcx, 4992(%rsp)
	movq	1224(%rbx), %rcx
	movq	%rcx, 5000(%rsp)
	movq	1232(%rbx), %rcx
	movq	%rcx, 5008(%rsp)
	movq	1240(%rbx), %rcx
	movq	%rcx, 5016(%rsp)
	movq	1248(%rbx), %rcx
	movq	%rcx, 5024(%rsp)
	movq	1256(%rbx), %rcx
	movq	%rcx, 5032(%rsp)
	movq	1264(%rbx), %rcx
	movq	%rcx, 5040(%rsp)
	movq	1272(%rbx), %rcx
	movq	%rcx, 5048(%rsp)
	movq	1280(%rbx), %rcx
	movq	%rcx, 5056(%rsp)
	movq	1288(%rbx), %rcx
	movq	%rcx, 5064(%rsp)
	movq	1296(%rbx), %rcx
	movq	%rcx, 5072(%rsp)
	movq	1304(%rbx), %rcx
	movq	%rcx, 5080(%rsp)
	movq	1312(%rbx), %rcx
	movq	%rcx, 5088(%rsp)
	movq	1320(%rbx), %rcx
	movq	%rcx, 5096(%rsp)
	movq	1328(%rbx), %rcx
	movq	%rcx, 5104(%rsp)
	movq	1336(%rbx), %rcx
	movq	%rcx, 5112(%rsp)
	movq	1344(%rbx), %rcx
	movq	%rcx, 5120(%rsp)
	movq	1352(%rbx), %rcx
	movq	%rcx, 5128(%rsp)
	movq	1360(%rbx), %rcx
	movq	%rcx, 5136(%rsp)
	movq	1368(%rbx), %rcx
	movq	%rcx, 5144(%rsp)
	movq	1376(%rbx), %rcx
	movq	%rcx, 5152(%rsp)
	movq	1384(%rbx), %rcx
	movq	%rcx, 5160(%rsp)
	movq	1392(%rbx), %rcx
	movq	%rcx, 5168(%rsp)
	movq	1400(%rbx), %rcx
	movq	%rcx, 5176(%rsp)
	movq	1408(%rbx), %rcx
	movq	%rcx, 5184(%rsp)
	movq	1416(%rbx), %rcx
	movq	%rcx, 5192(%rsp)
	movq	1424(%rbx), %rcx
	movq	%rcx, 5200(%rsp)
	movq	1432(%rbx), %rcx
	movq	%rcx, 5208(%rsp)
	movq	1440(%rbx), %rcx
	movq	%rcx, 5216(%rsp)
	movq	1448(%rbx), %rcx
	movq	%rcx, 5224(%rsp)
	movq	1456(%rbx), %rcx
	movq	%rcx, 5232(%rsp)
	movq	1464(%rbx), %rcx
	movq	%rcx, 5240(%rsp)
	movq	1472(%rbx), %rcx
	movq	%rcx, 5248(%rsp)
	movq	1480(%rbx), %rcx
	movq	%rcx, 5256(%rsp)
	movq	1488(%rbx), %rcx
	movq	%rcx, 5264(%rsp)
	movq	1496(%rbx), %rcx
	movq	%rcx, 5272(%rsp)
	movq	1504(%rbx), %rcx
	movq	%rcx, 5280(%rsp)
	movq	1512(%rbx), %rcx
	movq	%rcx, 5288(%rsp)
	movq	1520(%rbx), %rcx
	movq	%rcx, 5296(%rsp)
	movq	1528(%rbx), %rcx
	movq	%rcx, 5304(%rsp)
	movq	1536(%rbx), %rcx
	movq	%rcx, 5312(%rsp)
	movq	1544(%rbx), %rcx
	movq	%rcx, 5320(%rsp)
	movq	1552(%rbx), %rcx
	movq	%rcx, 5328(%rsp)
	movq	1560(%rbx), %rcx
	movq	%rcx, 5336(%rsp)
	movq	%mm1, %rsi
	leaq	3744(%rsp), %rbp
	call	L_shake256_A32__A1600$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$1:
	leaq	64(%rsp), %rcx
	negq	%rax
	movq	%rax, 21728(%rsp)
	vpbroadcastq	21728(%rsp), %ymm0
	vmovdqu	(%rcx), %ymm2
	vmovdqu	(%rsi), %ymm1
	vpblendvb	%ymm0, %ymm1, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rsi)
	xorl	%eax, %eax
	movq	21768(%rsp), %rbx
	movq	21776(%rsp), %rbp
	movq	21784(%rsp), %r12
	movq	21792(%rsp), %r13
	movq	21800(%rsp), %r14
	movq	21808(%rsp), %r15
	movq	21816(%rsp), %rsp
	ret
	.type	_jade_kem_mlkem_mlkem1024_amd64_avx2_enc, %function
	.type	jade_kem_mlkem_mlkem1024_amd64_avx2_enc, %function
_jade_kem_mlkem_mlkem1024_amd64_avx2_enc:
jade_kem_mlkem_mlkem1024_amd64_avx2_enc:
	movq	%rsp, %rax
	leaq	-18648(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 18592(%rsp)
	movq	%rbp, 18600(%rsp)
	movq	%r12, 18608(%rsp)
	movq	%r13, 18616(%rsp)
	movq	%r14, 18624(%rsp)
	movq	%r15, 18632(%rsp)
	movq	%rax, 18640(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %rbp
	leaq	18560(%rsp), %rdi
	movq	$32, %rsi
	call	__jasmin_syscall_randombytes__
	movq	%rbp, %mm0
	movq	%r12, %mm1
	movq	(%rax), %rcx
	movq	%rcx, (%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 8(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 16(%rsp)
	movq	24(%rax), %rcx
	movq	%rcx, 24(%rsp)
	leaq	32(%rsp), %rsi
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$66:
	leaq	64(%rsp), %rsi
	movq	%rsp, %rbp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$65:
	movq	%mm0, %rbp
	movq	%rsp, %rax
	leaq	96(%rsp), %rdi
	movq	%rbx, %mm2
	movq	%rbp, %rsi
	leaq	2176(%rsp), %r8
	movq	%rsi, %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$64:
	leaq	2688(%rsp), %r8
	leaq	384(%rsi), %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$63:
	leaq	3200(%rsp), %r8
	leaq	768(%rsi), %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$62:
	leaq	3712(%rsp), %r8
	leaq	1152(%rsi), %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$61:
	movq	1536(%rbp), %rcx
	movq	%rcx, 18560(%rsp)
	movq	1544(%rbp), %rcx
	movq	%rcx, 18568(%rsp)
	movq	1552(%rbp), %rcx
	movq	%rcx, 18576(%rsp)
	movq	1560(%rbp), %rcx
	movq	%rcx, 18584(%rsp)
	leaq	128(%rsp), %rsi
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$60:
	movq	$1, %rcx
	leaq	10368(%rsp), %rax
	leaq	18560(%rsp), %rdx
	leaq	-2168(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$59:
	leaq	2168(%rsp), %rsp
	movb	$0, %r9b
	leaq	4224(%rsp), %rax
	leaq	4736(%rsp), %rcx
	leaq	5248(%rsp), %rdx
	leaq	5760(%rsp), %r8
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$58:
	leaq	600(%rsp), %rsp
	movb	$4, %r9b
	leaq	6272(%rsp), %rax
	leaq	6784(%rsp), %rcx
	leaq	7296(%rsp), %rdx
	leaq	7808(%rsp), %r8
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$57:
	leaq	600(%rsp), %rsp
	movb	$8, %al
	leaq	640(%rsp), %rsi
	leaq	-184(%rsp), %rsp
	call	L_poly_getnoise_eta2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$56:
	leaq	184(%rsp), %rsp
	leaq	4224(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$55:
	leaq	4736(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$54:
	leaq	5248(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$53:
	leaq	5760(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$52:
	leaq	8320(%rsp), %rsi
	leaq	10368(%rsp), %rcx
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$51:
	leaq	1152(%rsp), %rsi
	leaq	10880(%rsp), %rcx
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$50:
	leaq	8320(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$49:
	leaq	1152(%rsp), %rsi
	leaq	11392(%rsp), %rcx
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$48:
	leaq	8320(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$47:
	leaq	1152(%rsp), %rsi
	leaq	11904(%rsp), %rcx
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$46:
	leaq	8320(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$45:
	leaq	8832(%rsp), %rsi
	leaq	12416(%rsp), %rcx
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$44:
	leaq	1152(%rsp), %rsi
	leaq	12928(%rsp), %rcx
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$43:
	leaq	8832(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$42:
	leaq	1152(%rsp), %rsi
	leaq	13440(%rsp), %rcx
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$41:
	leaq	8832(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$40:
	leaq	1152(%rsp), %rsi
	leaq	13952(%rsp), %rcx
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$39:
	leaq	8832(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$38:
	leaq	9344(%rsp), %rsi
	leaq	14464(%rsp), %rcx
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$37:
	leaq	1152(%rsp), %rsi
	leaq	14976(%rsp), %rcx
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$36:
	leaq	9344(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$35:
	leaq	1152(%rsp), %rsi
	leaq	15488(%rsp), %rcx
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$34:
	leaq	9344(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$33:
	leaq	1152(%rsp), %rsi
	leaq	16000(%rsp), %rcx
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$32:
	leaq	9344(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$31:
	leaq	9856(%rsp), %rsi
	leaq	16512(%rsp), %rcx
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$30:
	leaq	1152(%rsp), %rsi
	leaq	17024(%rsp), %rcx
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$29:
	leaq	9856(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$28:
	leaq	1152(%rsp), %rsi
	leaq	17536(%rsp), %rcx
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$27:
	leaq	9856(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$26:
	leaq	1152(%rsp), %rsi
	leaq	18048(%rsp), %rcx
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$25:
	leaq	9856(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$24:
	leaq	1152(%rsp), %rsi
	leaq	2176(%rsp), %rcx
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$23:
	leaq	1664(%rsp), %rsi
	leaq	2688(%rsp), %rcx
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$22:
	leaq	1152(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$21:
	leaq	1664(%rsp), %rsi
	leaq	3200(%rsp), %rcx
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$20:
	leaq	1152(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$19:
	leaq	1664(%rsp), %rsi
	leaq	3712(%rsp), %rcx
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$18:
	leaq	1152(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$17:
	leaq	8320(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$16:
	leaq	8832(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$15:
	leaq	9344(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$14:
	leaq	9856(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$13:
	leaq	1152(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$12:
	leaq	8320(%rsp), %rsi
	leaq	6272(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$11:
	leaq	8832(%rsp), %rsi
	leaq	6784(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$10:
	leaq	9344(%rsp), %rsi
	leaq	7296(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$9:
	leaq	9856(%rsp), %rsi
	leaq	7808(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$8:
	leaq	1152(%rsp), %rsi
	leaq	640(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$7:
	leaq	1152(%rsp), %rsi
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$6:
	leaq	8320(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	8832(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	9344(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	9856(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	1152(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	movq	%mm2, %rdi
	movq	%rdi, %rax
	leaq	8320(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$5:
	leaq	8832(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$4:
	leaq	9344(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$3:
	leaq	9856(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$2:
	vmovdqu	glob_data + 1120(%rip), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 5184(%rip), %ymm2
	vpbroadcastw	glob_data + 5182(%rip), %ymm3
	vpbroadcastw	glob_data + 5180(%rip), %ymm5
	vpbroadcastq	glob_data + 4968(%rip), %ymm4
	vpbroadcastq	glob_data + 4960(%rip), %ymm6
	vmovdqu	glob_data + 160(%rip), %ymm7
	vmovdqu	glob_data + 128(%rip), %ymm8
	vmovdqu	8320(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, (%rax)
	movq	%xmm9, 16(%rax)
	vmovdqu	8352(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 22(%rax)
	movq	%xmm9, 38(%rax)
	vmovdqu	8384(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 44(%rax)
	movq	%xmm9, 60(%rax)
	vmovdqu	8416(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 66(%rax)
	movq	%xmm9, 82(%rax)
	vmovdqu	8448(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 88(%rax)
	movq	%xmm9, 104(%rax)
	vmovdqu	8480(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 110(%rax)
	movq	%xmm9, 126(%rax)
	vmovdqu	8512(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 132(%rax)
	movq	%xmm9, 148(%rax)
	vmovdqu	8544(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 154(%rax)
	movq	%xmm9, 170(%rax)
	vmovdqu	8576(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 176(%rax)
	movq	%xmm9, 192(%rax)
	vmovdqu	8608(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 198(%rax)
	movq	%xmm9, 214(%rax)
	vmovdqu	8640(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 220(%rax)
	movq	%xmm9, 236(%rax)
	vmovdqu	8672(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 242(%rax)
	movq	%xmm9, 258(%rax)
	vmovdqu	8704(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 264(%rax)
	movq	%xmm9, 280(%rax)
	vmovdqu	8736(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 286(%rax)
	movq	%xmm9, 302(%rax)
	vmovdqu	8768(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 308(%rax)
	movq	%xmm9, 324(%rax)
	vmovdqu	8800(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 330(%rax)
	movq	%xmm9, 346(%rax)
	vmovdqu	8832(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 352(%rax)
	movq	%xmm9, 368(%rax)
	vmovdqu	8864(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 374(%rax)
	movq	%xmm9, 390(%rax)
	vmovdqu	8896(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 396(%rax)
	movq	%xmm9, 412(%rax)
	vmovdqu	8928(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 418(%rax)
	movq	%xmm9, 434(%rax)
	vmovdqu	8960(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 440(%rax)
	movq	%xmm9, 456(%rax)
	vmovdqu	8992(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 462(%rax)
	movq	%xmm9, 478(%rax)
	vmovdqu	9024(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 484(%rax)
	movq	%xmm9, 500(%rax)
	vmovdqu	9056(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 506(%rax)
	movq	%xmm9, 522(%rax)
	vmovdqu	9088(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 528(%rax)
	movq	%xmm9, 544(%rax)
	vmovdqu	9120(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 550(%rax)
	movq	%xmm9, 566(%rax)
	vmovdqu	9152(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 572(%rax)
	movq	%xmm9, 588(%rax)
	vmovdqu	9184(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 594(%rax)
	movq	%xmm9, 610(%rax)
	vmovdqu	9216(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 616(%rax)
	movq	%xmm9, 632(%rax)
	vmovdqu	9248(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 638(%rax)
	movq	%xmm9, 654(%rax)
	vmovdqu	9280(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 660(%rax)
	movq	%xmm9, 676(%rax)
	vmovdqu	9312(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 682(%rax)
	movq	%xmm9, 698(%rax)
	vmovdqu	9344(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 704(%rax)
	movq	%xmm9, 720(%rax)
	vmovdqu	9376(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 726(%rax)
	movq	%xmm9, 742(%rax)
	vmovdqu	9408(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 748(%rax)
	movq	%xmm9, 764(%rax)
	vmovdqu	9440(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 770(%rax)
	movq	%xmm9, 786(%rax)
	vmovdqu	9472(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 792(%rax)
	movq	%xmm9, 808(%rax)
	vmovdqu	9504(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 814(%rax)
	movq	%xmm9, 830(%rax)
	vmovdqu	9536(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 836(%rax)
	movq	%xmm9, 852(%rax)
	vmovdqu	9568(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 858(%rax)
	movq	%xmm9, 874(%rax)
	vmovdqu	9600(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 880(%rax)
	movq	%xmm9, 896(%rax)
	vmovdqu	9632(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 902(%rax)
	movq	%xmm9, 918(%rax)
	vmovdqu	9664(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 924(%rax)
	movq	%xmm9, 940(%rax)
	vmovdqu	9696(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 946(%rax)
	movq	%xmm9, 962(%rax)
	vmovdqu	9728(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 968(%rax)
	movq	%xmm9, 984(%rax)
	vmovdqu	9760(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 990(%rax)
	movq	%xmm9, 1006(%rax)
	vmovdqu	9792(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1012(%rax)
	movq	%xmm9, 1028(%rax)
	vmovdqu	9824(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1034(%rax)
	movq	%xmm9, 1050(%rax)
	vmovdqu	9856(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1056(%rax)
	movq	%xmm9, 1072(%rax)
	vmovdqu	9888(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1078(%rax)
	movq	%xmm9, 1094(%rax)
	vmovdqu	9920(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1100(%rax)
	movq	%xmm9, 1116(%rax)
	vmovdqu	9952(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1122(%rax)
	movq	%xmm9, 1138(%rax)
	vmovdqu	9984(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1144(%rax)
	movq	%xmm9, 1160(%rax)
	vmovdqu	10016(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1166(%rax)
	movq	%xmm9, 1182(%rax)
	vmovdqu	10048(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1188(%rax)
	movq	%xmm9, 1204(%rax)
	vmovdqu	10080(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1210(%rax)
	movq	%xmm9, 1226(%rax)
	vmovdqu	10112(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1232(%rax)
	movq	%xmm9, 1248(%rax)
	vmovdqu	10144(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1254(%rax)
	movq	%xmm9, 1270(%rax)
	vmovdqu	10176(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1276(%rax)
	movq	%xmm9, 1292(%rax)
	vmovdqu	10208(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1298(%rax)
	movq	%xmm9, 1314(%rax)
	vmovdqu	10240(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1320(%rax)
	movq	%xmm9, 1336(%rax)
	vmovdqu	10272(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1342(%rax)
	movq	%xmm9, 1358(%rax)
	vmovdqu	10304(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1364(%rax)
	movq	%xmm9, 1380(%rax)
	vmovdqu	10336(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm3
	vpand	%ymm5, %ymm3, %ymm3
	vpmaddwd	%ymm4, %ymm3, %ymm3
	vpsllvd	%ymm6, %ymm3, %ymm3
	vpsrldq	$8, %ymm3, %ymm4
	vpsrlvq	%ymm7, %ymm3, %ymm3
	vpsllq	$34, %ymm4, %ymm4
	vpor	%ymm4, %ymm3, %ymm3
	vpshufb	%ymm8, %ymm3, %ymm3
	vmovdqu	%xmm3, %xmm2
	vextracti128	$1, %ymm3, %xmm3
	vpblendvb	%xmm8, %xmm3, %xmm2, %xmm2
	vmovdqu	%xmm2, 1386(%rax)
	movq	%xmm3, 1402(%rax)
	leaq	1408(%rdi), %rax
	leaq	1152(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$1:
	vmovdqu	glob_data + 1120(%rip), %ymm0
	vpbroadcastw	glob_data + 5190(%rip), %ymm3
	vpbroadcastw	glob_data + 5192(%rip), %ymm5
	vpbroadcastw	glob_data + 5188(%rip), %ymm4
	vpbroadcastd	glob_data + 5176(%rip), %ymm1
	vpbroadcastq	glob_data + 4976(%rip), %ymm6
	vmovdqu	glob_data + 416(%rip), %ymm8
	vmovdqu	(%rsi), %ymm9
	vmovdqu	32(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, (%rax)
	movd	%xmm7, 16(%rax)
	vmovdqu	64(%rsi), %ymm9
	vmovdqu	96(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 20(%rax)
	movd	%xmm7, 36(%rax)
	vmovdqu	128(%rsi), %ymm9
	vmovdqu	160(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 40(%rax)
	movd	%xmm7, 56(%rax)
	vmovdqu	192(%rsi), %ymm9
	vmovdqu	224(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 60(%rax)
	movd	%xmm7, 76(%rax)
	vmovdqu	256(%rsi), %ymm9
	vmovdqu	288(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 80(%rax)
	movd	%xmm7, 96(%rax)
	vmovdqu	320(%rsi), %ymm9
	vmovdqu	352(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 100(%rax)
	movd	%xmm7, 116(%rax)
	vmovdqu	384(%rsi), %ymm9
	vmovdqu	416(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 120(%rax)
	movd	%xmm7, 136(%rax)
	vmovdqu	448(%rsi), %ymm9
	vmovdqu	480(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm3
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm3, %ymm3
	vpmaddubsw	%ymm4, %ymm3, %ymm3
	vpmaddwd	%ymm1, %ymm3, %ymm3
	vpsllvd	%ymm6, %ymm3, %ymm3
	vpsrlvq	%ymm6, %ymm3, %ymm3
	vpshufb	%ymm8, %ymm3, %ymm3
	vmovdqu	%xmm3, %xmm2
	vextracti128	$1, %ymm3, %xmm3
	vpblendvb	%xmm8, %xmm3, %xmm2, %xmm2
	vmovdqu	%xmm2, 140(%rax)
	movd	%xmm3, 156(%rax)
	movq	%mm1, %rsi
	movq	64(%rsp), %rcx
	movq	%rcx, (%rsi)
	movq	72(%rsp), %rcx
	movq	%rcx, 8(%rsi)
	movq	80(%rsp), %rcx
	movq	%rcx, 16(%rsi)
	movq	88(%rsp), %rcx
	movq	%rcx, 24(%rsi)
	xorl	%eax, %eax
	movq	18592(%rsp), %rbx
	movq	18600(%rsp), %rbp
	movq	18608(%rsp), %r12
	movq	18616(%rsp), %r13
	movq	18624(%rsp), %r14
	movq	18632(%rsp), %r15
	movq	18640(%rsp), %rsp
	ret
	.type	_jade_kem_mlkem_mlkem1024_amd64_avx2_keypair, %function
	.type	jade_kem_mlkem_mlkem1024_amd64_avx2_keypair, %function
_jade_kem_mlkem_mlkem1024_amd64_avx2_keypair:
jade_kem_mlkem_mlkem1024_amd64_avx2_keypair:
	movq	%rsp, %rax
	leaq	-15136(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 15080(%rsp)
	movq	%rbp, 15088(%rsp)
	movq	%r12, 15096(%rsp)
	movq	%r13, 15104(%rsp)
	movq	%r14, 15112(%rsp)
	movq	%r15, 15120(%rsp)
	movq	%rax, 15128(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	leaq	15016(%rsp), %rdi
	movq	$64, %rsi
	call	__jasmin_syscall_randombytes__
	movq	%rax, %mm1
	movq	%rbx, %rcx
	movq	%rbx, %mm2
	movq	%rbp, %mm3
	movq	%rcx, %mm4
	movq	(%rax), %rcx
	movq	%rcx, 14912(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 14920(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 14928(%rsp)
	movq	24(%rax), %rcx
	movq	%rcx, 14936(%rsp)
	movb	$4, 14944(%rsp)
	movq	%rsp, %rsi
	leaq	14912(%rsp), %rbp
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$57:
	movq	(%rsp), %rcx
	movq	%rcx, 14984(%rsp)
	movq	32(%rsp), %rcx
	movq	%rcx, 14952(%rsp)
	movq	8(%rsp), %rcx
	movq	%rcx, 14992(%rsp)
	movq	40(%rsp), %rcx
	movq	%rcx, 14960(%rsp)
	movq	16(%rsp), %rcx
	movq	%rcx, 15000(%rsp)
	movq	48(%rsp), %rcx
	movq	%rcx, 14968(%rsp)
	movq	24(%rsp), %rcx
	movq	%rcx, 15008(%rsp)
	movq	56(%rsp), %rcx
	movq	%rcx, 14976(%rsp)
	movq	$0, %rcx
	leaq	6720(%rsp), %rax
	leaq	14984(%rsp), %rdx
	leaq	-2168(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$56:
	leaq	2168(%rsp), %rsp
	movb	$0, %r9b
	leaq	576(%rsp), %rax
	leaq	1088(%rsp), %rcx
	leaq	1600(%rsp), %rdx
	leaq	2112(%rsp), %r8
	leaq	14952(%rsp), %rdi
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$55:
	leaq	600(%rsp), %rsp
	movb	$4, %r9b
	leaq	2624(%rsp), %rax
	leaq	3136(%rsp), %rcx
	leaq	3648(%rsp), %rdx
	leaq	4160(%rsp), %r8
	leaq	14952(%rsp), %rdi
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$54:
	leaq	600(%rsp), %rsp
	leaq	576(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$53:
	leaq	1088(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$52:
	leaq	1600(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$51:
	leaq	2112(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$50:
	leaq	2624(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$49:
	leaq	3136(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$48:
	leaq	3648(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$47:
	leaq	4160(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$46:
	leaq	4672(%rsp), %rsi
	leaq	6720(%rsp), %rcx
	leaq	576(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$45:
	leaq	64(%rsp), %rsi
	leaq	7232(%rsp), %rcx
	leaq	1088(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$44:
	leaq	4672(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$43:
	leaq	64(%rsp), %rsi
	leaq	7744(%rsp), %rcx
	leaq	1600(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$42:
	leaq	4672(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$41:
	leaq	64(%rsp), %rsi
	leaq	8256(%rsp), %rcx
	leaq	2112(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$40:
	leaq	4672(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$39:
	leaq	4672(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$38:
	leaq	5184(%rsp), %rsi
	leaq	8768(%rsp), %rcx
	leaq	576(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$37:
	leaq	64(%rsp), %rsi
	leaq	9280(%rsp), %rcx
	leaq	1088(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$36:
	leaq	5184(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$35:
	leaq	64(%rsp), %rsi
	leaq	9792(%rsp), %rcx
	leaq	1600(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$34:
	leaq	5184(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$33:
	leaq	64(%rsp), %rsi
	leaq	10304(%rsp), %rcx
	leaq	2112(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$32:
	leaq	5184(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$31:
	leaq	5184(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$30:
	leaq	5696(%rsp), %rsi
	leaq	10816(%rsp), %rcx
	leaq	576(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$29:
	leaq	64(%rsp), %rsi
	leaq	11328(%rsp), %rcx
	leaq	1088(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$28:
	leaq	5696(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$27:
	leaq	64(%rsp), %rsi
	leaq	11840(%rsp), %rcx
	leaq	1600(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$26:
	leaq	5696(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$25:
	leaq	64(%rsp), %rsi
	leaq	12352(%rsp), %rcx
	leaq	2112(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$24:
	leaq	5696(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$23:
	leaq	5696(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$22:
	leaq	6208(%rsp), %rsi
	leaq	12864(%rsp), %rcx
	leaq	576(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$21:
	leaq	64(%rsp), %rsi
	leaq	13376(%rsp), %rcx
	leaq	1088(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$20:
	leaq	6208(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$19:
	leaq	64(%rsp), %rsi
	leaq	13888(%rsp), %rcx
	leaq	1600(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$18:
	leaq	6208(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$17:
	leaq	64(%rsp), %rsi
	leaq	14400(%rsp), %rcx
	leaq	2112(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$16:
	leaq	6208(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$15:
	leaq	6208(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$14:
	leaq	4672(%rsp), %rsi
	leaq	2624(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$13:
	leaq	5184(%rsp), %rsi
	leaq	3136(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$12:
	leaq	5696(%rsp), %rsi
	leaq	3648(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$11:
	leaq	6208(%rsp), %rsi
	leaq	4160(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$10:
	leaq	4672(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	5184(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	5696(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	6208(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	movq	%mm3, %rbp
	movq	%mm4, %rax
	movq	%rax, %r8
	leaq	576(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$9:
	leaq	384(%rax), %r8
	leaq	1088(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$8:
	leaq	768(%rax), %r8
	leaq	1600(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$7:
	leaq	1152(%rax), %r8
	leaq	2112(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$6:
	movq	%rbp, %rax
	movq	%rax, %r8
	leaq	4672(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$5:
	leaq	384(%rax), %r8
	leaq	5184(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$4:
	leaq	768(%rax), %r8
	leaq	5696(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$3:
	leaq	1152(%rax), %r8
	leaq	6208(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$2:
	movq	14984(%rsp), %rcx
	movq	%rcx, 1536(%rbp)
	movq	14992(%rsp), %rcx
	movq	%rcx, 1544(%rbp)
	movq	15000(%rsp), %rcx
	movq	%rcx, 1552(%rbp)
	movq	15008(%rsp), %rcx
	movq	%rcx, 1560(%rbp)
	movq	%mm2, %rdx
	movq	(%rbp), %rcx
	movq	%rcx, 1536(%rdx)
	movq	8(%rbp), %rcx
	movq	%rcx, 1544(%rdx)
	movq	16(%rbp), %rcx
	movq	%rcx, 1552(%rdx)
	movq	24(%rbp), %rcx
	movq	%rcx, 1560(%rdx)
	movq	32(%rbp), %rcx
	movq	%rcx, 1568(%rdx)
	movq	40(%rbp), %rcx
	movq	%rcx, 1576(%rdx)
	movq	48(%rbp), %rcx
	movq	%rcx, 1584(%rdx)
	movq	56(%rbp), %rcx
	movq	%rcx, 1592(%rdx)
	movq	64(%rbp), %rcx
	movq	%rcx, 1600(%rdx)
	movq	72(%rbp), %rcx
	movq	%rcx, 1608(%rdx)
	movq	80(%rbp), %rcx
	movq	%rcx, 1616(%rdx)
	movq	88(%rbp), %rcx
	movq	%rcx, 1624(%rdx)
	movq	96(%rbp), %rcx
	movq	%rcx, 1632(%rdx)
	movq	104(%rbp), %rcx
	movq	%rcx, 1640(%rdx)
	movq	112(%rbp), %rcx
	movq	%rcx, 1648(%rdx)
	movq	120(%rbp), %rcx
	movq	%rcx, 1656(%rdx)
	movq	128(%rbp), %rcx
	movq	%rcx, 1664(%rdx)
	movq	136(%rbp), %rcx
	movq	%rcx, 1672(%rdx)
	movq	144(%rbp), %rcx
	movq	%rcx, 1680(%rdx)
	movq	152(%rbp), %rcx
	movq	%rcx, 1688(%rdx)
	movq	160(%rbp), %rcx
	movq	%rcx, 1696(%rdx)
	movq	168(%rbp), %rcx
	movq	%rcx, 1704(%rdx)
	movq	176(%rbp), %rcx
	movq	%rcx, 1712(%rdx)
	movq	184(%rbp), %rcx
	movq	%rcx, 1720(%rdx)
	movq	192(%rbp), %rcx
	movq	%rcx, 1728(%rdx)
	movq	200(%rbp), %rcx
	movq	%rcx, 1736(%rdx)
	movq	208(%rbp), %rcx
	movq	%rcx, 1744(%rdx)
	movq	216(%rbp), %rcx
	movq	%rcx, 1752(%rdx)
	movq	224(%rbp), %rcx
	movq	%rcx, 1760(%rdx)
	movq	232(%rbp), %rcx
	movq	%rcx, 1768(%rdx)
	movq	240(%rbp), %rcx
	movq	%rcx, 1776(%rdx)
	movq	248(%rbp), %rcx
	movq	%rcx, 1784(%rdx)
	movq	256(%rbp), %rcx
	movq	%rcx, 1792(%rdx)
	movq	264(%rbp), %rcx
	movq	%rcx, 1800(%rdx)
	movq	272(%rbp), %rcx
	movq	%rcx, 1808(%rdx)
	movq	280(%rbp), %rcx
	movq	%rcx, 1816(%rdx)
	movq	288(%rbp), %rcx
	movq	%rcx, 1824(%rdx)
	movq	296(%rbp), %rcx
	movq	%rcx, 1832(%rdx)
	movq	304(%rbp), %rcx
	movq	%rcx, 1840(%rdx)
	movq	312(%rbp), %rcx
	movq	%rcx, 1848(%rdx)
	movq	320(%rbp), %rcx
	movq	%rcx, 1856(%rdx)
	movq	328(%rbp), %rcx
	movq	%rcx, 1864(%rdx)
	movq	336(%rbp), %rcx
	movq	%rcx, 1872(%rdx)
	movq	344(%rbp), %rcx
	movq	%rcx, 1880(%rdx)
	movq	352(%rbp), %rcx
	movq	%rcx, 1888(%rdx)
	movq	360(%rbp), %rcx
	movq	%rcx, 1896(%rdx)
	movq	368(%rbp), %rcx
	movq	%rcx, 1904(%rdx)
	movq	376(%rbp), %rcx
	movq	%rcx, 1912(%rdx)
	movq	384(%rbp), %rcx
	movq	%rcx, 1920(%rdx)
	movq	392(%rbp), %rcx
	movq	%rcx, 1928(%rdx)
	movq	400(%rbp), %rcx
	movq	%rcx, 1936(%rdx)
	movq	408(%rbp), %rcx
	movq	%rcx, 1944(%rdx)
	movq	416(%rbp), %rcx
	movq	%rcx, 1952(%rdx)
	movq	424(%rbp), %rcx
	movq	%rcx, 1960(%rdx)
	movq	432(%rbp), %rcx
	movq	%rcx, 1968(%rdx)
	movq	440(%rbp), %rcx
	movq	%rcx, 1976(%rdx)
	movq	448(%rbp), %rcx
	movq	%rcx, 1984(%rdx)
	movq	456(%rbp), %rcx
	movq	%rcx, 1992(%rdx)
	movq	464(%rbp), %rcx
	movq	%rcx, 2000(%rdx)
	movq	472(%rbp), %rcx
	movq	%rcx, 2008(%rdx)
	movq	480(%rbp), %rcx
	movq	%rcx, 2016(%rdx)
	movq	488(%rbp), %rcx
	movq	%rcx, 2024(%rdx)
	movq	496(%rbp), %rcx
	movq	%rcx, 2032(%rdx)
	movq	504(%rbp), %rcx
	movq	%rcx, 2040(%rdx)
	movq	512(%rbp), %rcx
	movq	%rcx, 2048(%rdx)
	movq	520(%rbp), %rcx
	movq	%rcx, 2056(%rdx)
	movq	528(%rbp), %rcx
	movq	%rcx, 2064(%rdx)
	movq	536(%rbp), %rcx
	movq	%rcx, 2072(%rdx)
	movq	544(%rbp), %rcx
	movq	%rcx, 2080(%rdx)
	movq	552(%rbp), %rcx
	movq	%rcx, 2088(%rdx)
	movq	560(%rbp), %rcx
	movq	%rcx, 2096(%rdx)
	movq	568(%rbp), %rcx
	movq	%rcx, 2104(%rdx)
	movq	576(%rbp), %rcx
	movq	%rcx, 2112(%rdx)
	movq	584(%rbp), %rcx
	movq	%rcx, 2120(%rdx)
	movq	592(%rbp), %rcx
	movq	%rcx, 2128(%rdx)
	movq	600(%rbp), %rcx
	movq	%rcx, 2136(%rdx)
	movq	608(%rbp), %rcx
	movq	%rcx, 2144(%rdx)
	movq	616(%rbp), %rcx
	movq	%rcx, 2152(%rdx)
	movq	624(%rbp), %rcx
	movq	%rcx, 2160(%rdx)
	movq	632(%rbp), %rcx
	movq	%rcx, 2168(%rdx)
	movq	640(%rbp), %rcx
	movq	%rcx, 2176(%rdx)
	movq	648(%rbp), %rcx
	movq	%rcx, 2184(%rdx)
	movq	656(%rbp), %rcx
	movq	%rcx, 2192(%rdx)
	movq	664(%rbp), %rcx
	movq	%rcx, 2200(%rdx)
	movq	672(%rbp), %rcx
	movq	%rcx, 2208(%rdx)
	movq	680(%rbp), %rcx
	movq	%rcx, 2216(%rdx)
	movq	688(%rbp), %rcx
	movq	%rcx, 2224(%rdx)
	movq	696(%rbp), %rcx
	movq	%rcx, 2232(%rdx)
	movq	704(%rbp), %rcx
	movq	%rcx, 2240(%rdx)
	movq	712(%rbp), %rcx
	movq	%rcx, 2248(%rdx)
	movq	720(%rbp), %rcx
	movq	%rcx, 2256(%rdx)
	movq	728(%rbp), %rcx
	movq	%rcx, 2264(%rdx)
	movq	736(%rbp), %rcx
	movq	%rcx, 2272(%rdx)
	movq	744(%rbp), %rcx
	movq	%rcx, 2280(%rdx)
	movq	752(%rbp), %rcx
	movq	%rcx, 2288(%rdx)
	movq	760(%rbp), %rcx
	movq	%rcx, 2296(%rdx)
	movq	768(%rbp), %rcx
	movq	%rcx, 2304(%rdx)
	movq	776(%rbp), %rcx
	movq	%rcx, 2312(%rdx)
	movq	784(%rbp), %rcx
	movq	%rcx, 2320(%rdx)
	movq	792(%rbp), %rcx
	movq	%rcx, 2328(%rdx)
	movq	800(%rbp), %rcx
	movq	%rcx, 2336(%rdx)
	movq	808(%rbp), %rcx
	movq	%rcx, 2344(%rdx)
	movq	816(%rbp), %rcx
	movq	%rcx, 2352(%rdx)
	movq	824(%rbp), %rcx
	movq	%rcx, 2360(%rdx)
	movq	832(%rbp), %rcx
	movq	%rcx, 2368(%rdx)
	movq	840(%rbp), %rcx
	movq	%rcx, 2376(%rdx)
	movq	848(%rbp), %rcx
	movq	%rcx, 2384(%rdx)
	movq	856(%rbp), %rcx
	movq	%rcx, 2392(%rdx)
	movq	864(%rbp), %rcx
	movq	%rcx, 2400(%rdx)
	movq	872(%rbp), %rcx
	movq	%rcx, 2408(%rdx)
	movq	880(%rbp), %rcx
	movq	%rcx, 2416(%rdx)
	movq	888(%rbp), %rcx
	movq	%rcx, 2424(%rdx)
	movq	896(%rbp), %rcx
	movq	%rcx, 2432(%rdx)
	movq	904(%rbp), %rcx
	movq	%rcx, 2440(%rdx)
	movq	912(%rbp), %rcx
	movq	%rcx, 2448(%rdx)
	movq	920(%rbp), %rcx
	movq	%rcx, 2456(%rdx)
	movq	928(%rbp), %rcx
	movq	%rcx, 2464(%rdx)
	movq	936(%rbp), %rcx
	movq	%rcx, 2472(%rdx)
	movq	944(%rbp), %rcx
	movq	%rcx, 2480(%rdx)
	movq	952(%rbp), %rcx
	movq	%rcx, 2488(%rdx)
	movq	960(%rbp), %rcx
	movq	%rcx, 2496(%rdx)
	movq	968(%rbp), %rcx
	movq	%rcx, 2504(%rdx)
	movq	976(%rbp), %rcx
	movq	%rcx, 2512(%rdx)
	movq	984(%rbp), %rcx
	movq	%rcx, 2520(%rdx)
	movq	992(%rbp), %rcx
	movq	%rcx, 2528(%rdx)
	movq	1000(%rbp), %rcx
	movq	%rcx, 2536(%rdx)
	movq	1008(%rbp), %rcx
	movq	%rcx, 2544(%rdx)
	movq	1016(%rbp), %rcx
	movq	%rcx, 2552(%rdx)
	movq	1024(%rbp), %rcx
	movq	%rcx, 2560(%rdx)
	movq	1032(%rbp), %rcx
	movq	%rcx, 2568(%rdx)
	movq	1040(%rbp), %rcx
	movq	%rcx, 2576(%rdx)
	movq	1048(%rbp), %rcx
	movq	%rcx, 2584(%rdx)
	movq	1056(%rbp), %rcx
	movq	%rcx, 2592(%rdx)
	movq	1064(%rbp), %rcx
	movq	%rcx, 2600(%rdx)
	movq	1072(%rbp), %rcx
	movq	%rcx, 2608(%rdx)
	movq	1080(%rbp), %rcx
	movq	%rcx, 2616(%rdx)
	movq	1088(%rbp), %rcx
	movq	%rcx, 2624(%rdx)
	movq	1096(%rbp), %rcx
	movq	%rcx, 2632(%rdx)
	movq	1104(%rbp), %rcx
	movq	%rcx, 2640(%rdx)
	movq	1112(%rbp), %rcx
	movq	%rcx, 2648(%rdx)
	movq	1120(%rbp), %rcx
	movq	%rcx, 2656(%rdx)
	movq	1128(%rbp), %rcx
	movq	%rcx, 2664(%rdx)
	movq	1136(%rbp), %rcx
	movq	%rcx, 2672(%rdx)
	movq	1144(%rbp), %rcx
	movq	%rcx, 2680(%rdx)
	movq	1152(%rbp), %rcx
	movq	%rcx, 2688(%rdx)
	movq	1160(%rbp), %rcx
	movq	%rcx, 2696(%rdx)
	movq	1168(%rbp), %rcx
	movq	%rcx, 2704(%rdx)
	movq	1176(%rbp), %rcx
	movq	%rcx, 2712(%rdx)
	movq	1184(%rbp), %rcx
	movq	%rcx, 2720(%rdx)
	movq	1192(%rbp), %rcx
	movq	%rcx, 2728(%rdx)
	movq	1200(%rbp), %rcx
	movq	%rcx, 2736(%rdx)
	movq	1208(%rbp), %rcx
	movq	%rcx, 2744(%rdx)
	movq	1216(%rbp), %rcx
	movq	%rcx, 2752(%rdx)
	movq	1224(%rbp), %rcx
	movq	%rcx, 2760(%rdx)
	movq	1232(%rbp), %rcx
	movq	%rcx, 2768(%rdx)
	movq	1240(%rbp), %rcx
	movq	%rcx, 2776(%rdx)
	movq	1248(%rbp), %rcx
	movq	%rcx, 2784(%rdx)
	movq	1256(%rbp), %rcx
	movq	%rcx, 2792(%rdx)
	movq	1264(%rbp), %rcx
	movq	%rcx, 2800(%rdx)
	movq	1272(%rbp), %rcx
	movq	%rcx, 2808(%rdx)
	movq	1280(%rbp), %rcx
	movq	%rcx, 2816(%rdx)
	movq	1288(%rbp), %rcx
	movq	%rcx, 2824(%rdx)
	movq	1296(%rbp), %rcx
	movq	%rcx, 2832(%rdx)
	movq	1304(%rbp), %rcx
	movq	%rcx, 2840(%rdx)
	movq	1312(%rbp), %rcx
	movq	%rcx, 2848(%rdx)
	movq	1320(%rbp), %rcx
	movq	%rcx, 2856(%rdx)
	movq	1328(%rbp), %rcx
	movq	%rcx, 2864(%rdx)
	movq	1336(%rbp), %rcx
	movq	%rcx, 2872(%rdx)
	movq	1344(%rbp), %rcx
	movq	%rcx, 2880(%rdx)
	movq	1352(%rbp), %rcx
	movq	%rcx, 2888(%rdx)
	movq	1360(%rbp), %rcx
	movq	%rcx, 2896(%rdx)
	movq	1368(%rbp), %rcx
	movq	%rcx, 2904(%rdx)
	movq	1376(%rbp), %rcx
	movq	%rcx, 2912(%rdx)
	movq	1384(%rbp), %rcx
	movq	%rcx, 2920(%rdx)
	movq	1392(%rbp), %rcx
	movq	%rcx, 2928(%rdx)
	movq	1400(%rbp), %rcx
	movq	%rcx, 2936(%rdx)
	movq	1408(%rbp), %rcx
	movq	%rcx, 2944(%rdx)
	movq	1416(%rbp), %rcx
	movq	%rcx, 2952(%rdx)
	movq	1424(%rbp), %rcx
	movq	%rcx, 2960(%rdx)
	movq	1432(%rbp), %rcx
	movq	%rcx, 2968(%rdx)
	movq	1440(%rbp), %rcx
	movq	%rcx, 2976(%rdx)
	movq	1448(%rbp), %rcx
	movq	%rcx, 2984(%rdx)
	movq	1456(%rbp), %rcx
	movq	%rcx, 2992(%rdx)
	movq	1464(%rbp), %rcx
	movq	%rcx, 3000(%rdx)
	movq	1472(%rbp), %rcx
	movq	%rcx, 3008(%rdx)
	movq	1480(%rbp), %rcx
	movq	%rcx, 3016(%rdx)
	movq	1488(%rbp), %rcx
	movq	%rcx, 3024(%rdx)
	movq	1496(%rbp), %rcx
	movq	%rcx, 3032(%rdx)
	movq	1504(%rbp), %rcx
	movq	%rcx, 3040(%rdx)
	movq	1512(%rbp), %rcx
	movq	%rcx, 3048(%rdx)
	movq	1520(%rbp), %rcx
	movq	%rcx, 3056(%rdx)
	movq	1528(%rbp), %rcx
	movq	%rcx, 3064(%rdx)
	movq	1536(%rbp), %rcx
	movq	%rcx, 3072(%rdx)
	movq	1544(%rbp), %rcx
	movq	%rcx, 3080(%rdx)
	movq	1552(%rbp), %rcx
	movq	%rcx, 3088(%rdx)
	movq	1560(%rbp), %rcx
	movq	%rcx, 3096(%rdx)
	leaq	3104(%rdx), %rsi
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$1:
	movq	%mm1, %rax
	movq	32(%rax), %rcx
	movq	%rcx, 3136(%rdx)
	movq	40(%rax), %rcx
	movq	%rcx, 3144(%rdx)
	movq	48(%rax), %rcx
	movq	%rcx, 3152(%rdx)
	movq	56(%rax), %rcx
	movq	%rcx, 3160(%rdx)
	xorl	%eax, %eax
	movq	15080(%rsp), %rbx
	movq	15088(%rsp), %rbp
	movq	15096(%rsp), %r12
	movq	15104(%rsp), %r13
	movq	15112(%rsp), %r14
	movq	15120(%rsp), %r15
	movq	15128(%rsp), %rsp
	ret
	.type	_jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand, %function
	.type	jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand, %function
_jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand:
jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand:
	movq	%rsp, %rax
	leaq	-18648(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 18592(%rsp)
	movq	%rbp, 18600(%rsp)
	movq	%r12, 18608(%rsp)
	movq	%r13, 18616(%rsp)
	movq	%r14, 18624(%rsp)
	movq	%r15, 18632(%rsp)
	movq	%rax, 18640(%rsp)
	movq	%rdi, %rbx
	lfence
	movq	$0, %rax
	movq	%rdx, %rbp
	movq	%rbp, %mm0
	movq	%rsi, %mm1
	movq	(%rcx), %rax
	movq	%rax, (%rsp)
	movq	8(%rcx), %rax
	movq	%rax, 8(%rsp)
	movq	16(%rcx), %rax
	movq	%rax, 16(%rsp)
	movq	24(%rcx), %rax
	movq	%rax, 24(%rsp)
	leaq	32(%rsp), %rsi
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$66:
	leaq	64(%rsp), %rsi
	movq	%rsp, %rbp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$65:
	movq	%mm0, %rbp
	movq	%rsp, %rax
	leaq	96(%rsp), %rdi
	movq	%rbx, %mm2
	movq	%rbp, %rsi
	leaq	2176(%rsp), %r8
	movq	%rsi, %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$64:
	leaq	2688(%rsp), %r8
	leaq	384(%rsi), %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$63:
	leaq	3200(%rsp), %r8
	leaq	768(%rsi), %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$62:
	leaq	3712(%rsp), %r8
	leaq	1152(%rsi), %r9
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$61:
	movq	1536(%rbp), %rcx
	movq	%rcx, 18560(%rsp)
	movq	1544(%rbp), %rcx
	movq	%rcx, 18568(%rsp)
	movq	1552(%rbp), %rcx
	movq	%rcx, 18576(%rsp)
	movq	1560(%rbp), %rcx
	movq	%rcx, 18584(%rsp)
	leaq	128(%rsp), %rsi
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$60:
	movq	$1, %rcx
	leaq	10368(%rsp), %rax
	leaq	18560(%rsp), %rdx
	leaq	-2168(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$59:
	leaq	2168(%rsp), %rsp
	movb	$0, %r9b
	leaq	4224(%rsp), %rax
	leaq	4736(%rsp), %rcx
	leaq	5248(%rsp), %rdx
	leaq	5760(%rsp), %r8
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$58:
	leaq	600(%rsp), %rsp
	movb	$4, %r9b
	leaq	6272(%rsp), %rax
	leaq	6784(%rsp), %rcx
	leaq	7296(%rsp), %rdx
	leaq	7808(%rsp), %r8
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$57:
	leaq	600(%rsp), %rsp
	movb	$8, %al
	leaq	640(%rsp), %rsi
	leaq	-184(%rsp), %rsp
	call	L_poly_getnoise_eta2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$56:
	leaq	184(%rsp), %rsp
	leaq	4224(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$55:
	leaq	4736(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$54:
	leaq	5248(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$53:
	leaq	5760(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$52:
	leaq	8320(%rsp), %rsi
	leaq	10368(%rsp), %rcx
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$51:
	leaq	1152(%rsp), %rsi
	leaq	10880(%rsp), %rcx
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$50:
	leaq	8320(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$49:
	leaq	1152(%rsp), %rsi
	leaq	11392(%rsp), %rcx
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$48:
	leaq	8320(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$47:
	leaq	1152(%rsp), %rsi
	leaq	11904(%rsp), %rcx
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$46:
	leaq	8320(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$45:
	leaq	8832(%rsp), %rsi
	leaq	12416(%rsp), %rcx
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$44:
	leaq	1152(%rsp), %rsi
	leaq	12928(%rsp), %rcx
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$43:
	leaq	8832(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$42:
	leaq	1152(%rsp), %rsi
	leaq	13440(%rsp), %rcx
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$41:
	leaq	8832(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$40:
	leaq	1152(%rsp), %rsi
	leaq	13952(%rsp), %rcx
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$39:
	leaq	8832(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$38:
	leaq	9344(%rsp), %rsi
	leaq	14464(%rsp), %rcx
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$37:
	leaq	1152(%rsp), %rsi
	leaq	14976(%rsp), %rcx
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$36:
	leaq	9344(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$35:
	leaq	1152(%rsp), %rsi
	leaq	15488(%rsp), %rcx
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$34:
	leaq	9344(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$33:
	leaq	1152(%rsp), %rsi
	leaq	16000(%rsp), %rcx
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$32:
	leaq	9344(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$31:
	leaq	9856(%rsp), %rsi
	leaq	16512(%rsp), %rcx
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$30:
	leaq	1152(%rsp), %rsi
	leaq	17024(%rsp), %rcx
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$29:
	leaq	9856(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$28:
	leaq	1152(%rsp), %rsi
	leaq	17536(%rsp), %rcx
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$27:
	leaq	9856(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$26:
	leaq	1152(%rsp), %rsi
	leaq	18048(%rsp), %rcx
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$25:
	leaq	9856(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$24:
	leaq	1152(%rsp), %rsi
	leaq	2176(%rsp), %rcx
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$23:
	leaq	1664(%rsp), %rsi
	leaq	2688(%rsp), %rcx
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$22:
	leaq	1152(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$21:
	leaq	1664(%rsp), %rsi
	leaq	3200(%rsp), %rcx
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$20:
	leaq	1152(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$19:
	leaq	1664(%rsp), %rsi
	leaq	3712(%rsp), %rcx
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$18:
	leaq	1152(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$17:
	leaq	8320(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$16:
	leaq	8832(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$15:
	leaq	9344(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$14:
	leaq	9856(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$13:
	leaq	1152(%rsp), %rsi
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$12:
	leaq	8320(%rsp), %rsi
	leaq	6272(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$11:
	leaq	8832(%rsp), %rsi
	leaq	6784(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$10:
	leaq	9344(%rsp), %rsi
	leaq	7296(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$9:
	leaq	9856(%rsp), %rsi
	leaq	7808(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$8:
	leaq	1152(%rsp), %rsi
	leaq	640(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$7:
	leaq	1152(%rsp), %rsi
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$6:
	leaq	8320(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	8832(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	9344(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	9856(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	1152(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	movq	%mm2, %rbx
	movq	%rbx, %rax
	leaq	8320(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$5:
	leaq	8832(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$4:
	leaq	9344(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$3:
	leaq	9856(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$2:
	vmovdqu	glob_data + 1120(%rip), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 5184(%rip), %ymm2
	vpbroadcastw	glob_data + 5182(%rip), %ymm3
	vpbroadcastw	glob_data + 5180(%rip), %ymm5
	vpbroadcastq	glob_data + 4968(%rip), %ymm4
	vpbroadcastq	glob_data + 4960(%rip), %ymm6
	vmovdqu	glob_data + 160(%rip), %ymm7
	vmovdqu	glob_data + 128(%rip), %ymm8
	vmovdqu	8320(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, (%rax)
	movq	%xmm9, 16(%rax)
	vmovdqu	8352(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 22(%rax)
	movq	%xmm9, 38(%rax)
	vmovdqu	8384(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 44(%rax)
	movq	%xmm9, 60(%rax)
	vmovdqu	8416(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 66(%rax)
	movq	%xmm9, 82(%rax)
	vmovdqu	8448(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 88(%rax)
	movq	%xmm9, 104(%rax)
	vmovdqu	8480(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 110(%rax)
	movq	%xmm9, 126(%rax)
	vmovdqu	8512(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 132(%rax)
	movq	%xmm9, 148(%rax)
	vmovdqu	8544(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 154(%rax)
	movq	%xmm9, 170(%rax)
	vmovdqu	8576(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 176(%rax)
	movq	%xmm9, 192(%rax)
	vmovdqu	8608(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 198(%rax)
	movq	%xmm9, 214(%rax)
	vmovdqu	8640(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 220(%rax)
	movq	%xmm9, 236(%rax)
	vmovdqu	8672(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 242(%rax)
	movq	%xmm9, 258(%rax)
	vmovdqu	8704(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 264(%rax)
	movq	%xmm9, 280(%rax)
	vmovdqu	8736(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 286(%rax)
	movq	%xmm9, 302(%rax)
	vmovdqu	8768(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 308(%rax)
	movq	%xmm9, 324(%rax)
	vmovdqu	8800(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 330(%rax)
	movq	%xmm9, 346(%rax)
	vmovdqu	8832(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 352(%rax)
	movq	%xmm9, 368(%rax)
	vmovdqu	8864(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 374(%rax)
	movq	%xmm9, 390(%rax)
	vmovdqu	8896(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 396(%rax)
	movq	%xmm9, 412(%rax)
	vmovdqu	8928(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 418(%rax)
	movq	%xmm9, 434(%rax)
	vmovdqu	8960(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 440(%rax)
	movq	%xmm9, 456(%rax)
	vmovdqu	8992(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 462(%rax)
	movq	%xmm9, 478(%rax)
	vmovdqu	9024(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 484(%rax)
	movq	%xmm9, 500(%rax)
	vmovdqu	9056(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 506(%rax)
	movq	%xmm9, 522(%rax)
	vmovdqu	9088(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 528(%rax)
	movq	%xmm9, 544(%rax)
	vmovdqu	9120(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 550(%rax)
	movq	%xmm9, 566(%rax)
	vmovdqu	9152(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 572(%rax)
	movq	%xmm9, 588(%rax)
	vmovdqu	9184(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 594(%rax)
	movq	%xmm9, 610(%rax)
	vmovdqu	9216(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 616(%rax)
	movq	%xmm9, 632(%rax)
	vmovdqu	9248(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 638(%rax)
	movq	%xmm9, 654(%rax)
	vmovdqu	9280(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 660(%rax)
	movq	%xmm9, 676(%rax)
	vmovdqu	9312(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 682(%rax)
	movq	%xmm9, 698(%rax)
	vmovdqu	9344(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 704(%rax)
	movq	%xmm9, 720(%rax)
	vmovdqu	9376(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 726(%rax)
	movq	%xmm9, 742(%rax)
	vmovdqu	9408(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 748(%rax)
	movq	%xmm9, 764(%rax)
	vmovdqu	9440(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 770(%rax)
	movq	%xmm9, 786(%rax)
	vmovdqu	9472(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 792(%rax)
	movq	%xmm9, 808(%rax)
	vmovdqu	9504(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 814(%rax)
	movq	%xmm9, 830(%rax)
	vmovdqu	9536(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 836(%rax)
	movq	%xmm9, 852(%rax)
	vmovdqu	9568(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 858(%rax)
	movq	%xmm9, 874(%rax)
	vmovdqu	9600(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 880(%rax)
	movq	%xmm9, 896(%rax)
	vmovdqu	9632(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 902(%rax)
	movq	%xmm9, 918(%rax)
	vmovdqu	9664(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 924(%rax)
	movq	%xmm9, 940(%rax)
	vmovdqu	9696(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 946(%rax)
	movq	%xmm9, 962(%rax)
	vmovdqu	9728(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 968(%rax)
	movq	%xmm9, 984(%rax)
	vmovdqu	9760(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 990(%rax)
	movq	%xmm9, 1006(%rax)
	vmovdqu	9792(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1012(%rax)
	movq	%xmm9, 1028(%rax)
	vmovdqu	9824(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1034(%rax)
	movq	%xmm9, 1050(%rax)
	vmovdqu	9856(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1056(%rax)
	movq	%xmm9, 1072(%rax)
	vmovdqu	9888(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1078(%rax)
	movq	%xmm9, 1094(%rax)
	vmovdqu	9920(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1100(%rax)
	movq	%xmm9, 1116(%rax)
	vmovdqu	9952(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1122(%rax)
	movq	%xmm9, 1138(%rax)
	vmovdqu	9984(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1144(%rax)
	movq	%xmm9, 1160(%rax)
	vmovdqu	10016(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1166(%rax)
	movq	%xmm9, 1182(%rax)
	vmovdqu	10048(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1188(%rax)
	movq	%xmm9, 1204(%rax)
	vmovdqu	10080(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1210(%rax)
	movq	%xmm9, 1226(%rax)
	vmovdqu	10112(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1232(%rax)
	movq	%xmm9, 1248(%rax)
	vmovdqu	10144(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1254(%rax)
	movq	%xmm9, 1270(%rax)
	vmovdqu	10176(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1276(%rax)
	movq	%xmm9, 1292(%rax)
	vmovdqu	10208(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1298(%rax)
	movq	%xmm9, 1314(%rax)
	vmovdqu	10240(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1320(%rax)
	movq	%xmm9, 1336(%rax)
	vmovdqu	10272(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1342(%rax)
	movq	%xmm9, 1358(%rax)
	vmovdqu	10304(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm5, %ymm9, %ymm9
	vpmaddwd	%ymm4, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm11
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm11, %xmm11
	vmovdqu	%xmm11, 1364(%rax)
	movq	%xmm9, 1380(%rax)
	vmovdqu	10336(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm3
	vpand	%ymm5, %ymm3, %ymm3
	vpmaddwd	%ymm4, %ymm3, %ymm3
	vpsllvd	%ymm6, %ymm3, %ymm3
	vpsrldq	$8, %ymm3, %ymm4
	vpsrlvq	%ymm7, %ymm3, %ymm3
	vpsllq	$34, %ymm4, %ymm4
	vpor	%ymm4, %ymm3, %ymm3
	vpshufb	%ymm8, %ymm3, %ymm3
	vmovdqu	%xmm3, %xmm2
	vextracti128	$1, %ymm3, %xmm3
	vpblendvb	%xmm8, %xmm3, %xmm2, %xmm2
	vmovdqu	%xmm2, 1386(%rax)
	movq	%xmm3, 1402(%rax)
	leaq	1408(%rbx), %rax
	leaq	1152(%rsp), %rsi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$1:
	vmovdqu	glob_data + 1120(%rip), %ymm0
	vpbroadcastw	glob_data + 5190(%rip), %ymm3
	vpbroadcastw	glob_data + 5192(%rip), %ymm5
	vpbroadcastw	glob_data + 5188(%rip), %ymm4
	vpbroadcastd	glob_data + 5176(%rip), %ymm1
	vpbroadcastq	glob_data + 4976(%rip), %ymm6
	vmovdqu	glob_data + 416(%rip), %ymm8
	vmovdqu	(%rsi), %ymm9
	vmovdqu	32(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, (%rax)
	movd	%xmm7, 16(%rax)
	vmovdqu	64(%rsi), %ymm9
	vmovdqu	96(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 20(%rax)
	movd	%xmm7, 36(%rax)
	vmovdqu	128(%rsi), %ymm9
	vmovdqu	160(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 40(%rax)
	movd	%xmm7, 56(%rax)
	vmovdqu	192(%rsi), %ymm9
	vmovdqu	224(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 60(%rax)
	movd	%xmm7, 76(%rax)
	vmovdqu	256(%rsi), %ymm9
	vmovdqu	288(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 80(%rax)
	movd	%xmm7, 96(%rax)
	vmovdqu	320(%rsi), %ymm9
	vmovdqu	352(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 100(%rax)
	movd	%xmm7, 116(%rax)
	vmovdqu	384(%rsi), %ymm9
	vmovdqu	416(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm9
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm9, %ymm9
	vpmaddubsw	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm1, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrlvq	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm2
	vextracti128	$1, %ymm9, %xmm7
	vpblendvb	%xmm8, %xmm7, %xmm2, %xmm2
	vmovdqu	%xmm2, 120(%rax)
	movd	%xmm7, 136(%rax)
	vmovdqu	448(%rsi), %ymm9
	vmovdqu	480(%rsi), %ymm10
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm10, %ymm10
	vpand	%ymm5, %ymm9, %ymm3
	vpand	%ymm5, %ymm10, %ymm10
	vpackuswb	%ymm10, %ymm3, %ymm3
	vpmaddubsw	%ymm4, %ymm3, %ymm3
	vpmaddwd	%ymm1, %ymm3, %ymm3
	vpsllvd	%ymm6, %ymm3, %ymm3
	vpsrlvq	%ymm6, %ymm3, %ymm3
	vpshufb	%ymm8, %ymm3, %ymm3
	vmovdqu	%xmm3, %xmm2
	vextracti128	$1, %ymm3, %xmm3
	vpblendvb	%xmm8, %xmm3, %xmm2, %xmm2
	vmovdqu	%xmm2, 140(%rax)
	movd	%xmm3, 156(%rax)
	movq	%mm1, %rsi
	movq	64(%rsp), %rax
	movq	%rax, (%rsi)
	movq	72(%rsp), %rax
	movq	%rax, 8(%rsi)
	movq	80(%rsp), %rax
	movq	%rax, 16(%rsi)
	movq	88(%rsp), %rax
	movq	%rax, 24(%rsi)
	xorl	%eax, %eax
	movq	18592(%rsp), %rbx
	movq	18600(%rsp), %rbp
	movq	18608(%rsp), %r12
	movq	18616(%rsp), %r13
	movq	18624(%rsp), %r14
	movq	18632(%rsp), %r15
	movq	18640(%rsp), %rsp
	ret
	.type	_jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand, %function
	.type	jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand, %function
_jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand:
jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand:
	movq	%rsp, %rax
	leaq	-15072(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 15016(%rsp)
	movq	%rbp, 15024(%rsp)
	movq	%r12, 15032(%rsp)
	movq	%r13, 15040(%rsp)
	movq	%r14, 15048(%rsp)
	movq	%r15, 15056(%rsp)
	movq	%rax, 15064(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdx, %mm1
	movq	%rsi, %rcx
	movq	%rsi, %mm2
	movq	%rdi, %mm3
	movq	%rcx, %mm4
	movq	(%rdx), %rcx
	movq	%rcx, 14912(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 14920(%rsp)
	movq	16(%rdx), %rcx
	movq	%rcx, 14928(%rsp)
	movq	24(%rdx), %rcx
	movq	%rcx, 14936(%rsp)
	movb	$4, 14944(%rsp)
	movq	%rsp, %rsi
	leaq	14912(%rsp), %rbp
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$57:
	movq	(%rsp), %rcx
	movq	%rcx, 14984(%rsp)
	movq	32(%rsp), %rcx
	movq	%rcx, 14952(%rsp)
	movq	8(%rsp), %rcx
	movq	%rcx, 14992(%rsp)
	movq	40(%rsp), %rcx
	movq	%rcx, 14960(%rsp)
	movq	16(%rsp), %rcx
	movq	%rcx, 15000(%rsp)
	movq	48(%rsp), %rcx
	movq	%rcx, 14968(%rsp)
	movq	24(%rsp), %rcx
	movq	%rcx, 15008(%rsp)
	movq	56(%rsp), %rcx
	movq	%rcx, 14976(%rsp)
	movq	$0, %rcx
	leaq	6720(%rsp), %rax
	leaq	14984(%rsp), %rdx
	leaq	-2168(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$56:
	leaq	2168(%rsp), %rsp
	movb	$0, %r9b
	leaq	576(%rsp), %rax
	leaq	1088(%rsp), %rcx
	leaq	1600(%rsp), %rdx
	leaq	2112(%rsp), %r8
	leaq	14952(%rsp), %rdi
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$55:
	leaq	600(%rsp), %rsp
	movb	$4, %r9b
	leaq	2624(%rsp), %rax
	leaq	3136(%rsp), %rcx
	leaq	3648(%rsp), %rdx
	leaq	4160(%rsp), %r8
	leaq	14952(%rsp), %rdi
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$54:
	leaq	600(%rsp), %rsp
	leaq	576(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$53:
	leaq	1088(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$52:
	leaq	1600(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$51:
	leaq	2112(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$50:
	leaq	2624(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$49:
	leaq	3136(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$48:
	leaq	3648(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$47:
	leaq	4160(%rsp), %rsi
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$46:
	leaq	4672(%rsp), %rsi
	leaq	6720(%rsp), %rcx
	leaq	576(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$45:
	leaq	64(%rsp), %rsi
	leaq	7232(%rsp), %rcx
	leaq	1088(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$44:
	leaq	4672(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$43:
	leaq	64(%rsp), %rsi
	leaq	7744(%rsp), %rcx
	leaq	1600(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$42:
	leaq	4672(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$41:
	leaq	64(%rsp), %rsi
	leaq	8256(%rsp), %rcx
	leaq	2112(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$40:
	leaq	4672(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$39:
	leaq	4672(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$38:
	leaq	5184(%rsp), %rsi
	leaq	8768(%rsp), %rcx
	leaq	576(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$37:
	leaq	64(%rsp), %rsi
	leaq	9280(%rsp), %rcx
	leaq	1088(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$36:
	leaq	5184(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$35:
	leaq	64(%rsp), %rsi
	leaq	9792(%rsp), %rcx
	leaq	1600(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$34:
	leaq	5184(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$33:
	leaq	64(%rsp), %rsi
	leaq	10304(%rsp), %rcx
	leaq	2112(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$32:
	leaq	5184(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$31:
	leaq	5184(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$30:
	leaq	5696(%rsp), %rsi
	leaq	10816(%rsp), %rcx
	leaq	576(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$29:
	leaq	64(%rsp), %rsi
	leaq	11328(%rsp), %rcx
	leaq	1088(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$28:
	leaq	5696(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$27:
	leaq	64(%rsp), %rsi
	leaq	11840(%rsp), %rcx
	leaq	1600(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$26:
	leaq	5696(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$25:
	leaq	64(%rsp), %rsi
	leaq	12352(%rsp), %rcx
	leaq	2112(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$24:
	leaq	5696(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$23:
	leaq	5696(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$22:
	leaq	6208(%rsp), %rsi
	leaq	12864(%rsp), %rcx
	leaq	576(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$21:
	leaq	64(%rsp), %rsi
	leaq	13376(%rsp), %rcx
	leaq	1088(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$20:
	leaq	6208(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$19:
	leaq	64(%rsp), %rsi
	leaq	13888(%rsp), %rcx
	leaq	1600(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$18:
	leaq	6208(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$17:
	leaq	64(%rsp), %rsi
	leaq	14400(%rsp), %rcx
	leaq	2112(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$16:
	leaq	6208(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$15:
	leaq	6208(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$14:
	leaq	4672(%rsp), %rsi
	leaq	2624(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$13:
	leaq	5184(%rsp), %rsi
	leaq	3136(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$12:
	leaq	5696(%rsp), %rsi
	leaq	3648(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$11:
	leaq	6208(%rsp), %rsi
	leaq	4160(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$10:
	leaq	4672(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	5184(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	5696(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	leaq	6208(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	movq	%mm3, %rbp
	movq	%mm4, %rax
	movq	%rax, %r8
	leaq	576(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$9:
	leaq	384(%rax), %r8
	leaq	1088(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$8:
	leaq	768(%rax), %r8
	leaq	1600(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$7:
	leaq	1152(%rax), %r8
	leaq	2112(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$6:
	movq	%rbp, %rax
	movq	%rax, %r8
	leaq	4672(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$5:
	leaq	384(%rax), %r8
	leaq	5184(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$4:
	leaq	768(%rax), %r8
	leaq	5696(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$3:
	leaq	1152(%rax), %r8
	leaq	6208(%rsp), %rsi
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$2:
	movq	14984(%rsp), %rcx
	movq	%rcx, 1536(%rbp)
	movq	14992(%rsp), %rcx
	movq	%rcx, 1544(%rbp)
	movq	15000(%rsp), %rcx
	movq	%rcx, 1552(%rbp)
	movq	15008(%rsp), %rcx
	movq	%rcx, 1560(%rbp)
	movq	%mm2, %rcx
	movq	(%rbp), %rdx
	movq	%rdx, 1536(%rcx)
	movq	8(%rbp), %rdx
	movq	%rdx, 1544(%rcx)
	movq	16(%rbp), %rdx
	movq	%rdx, 1552(%rcx)
	movq	24(%rbp), %rdx
	movq	%rdx, 1560(%rcx)
	movq	32(%rbp), %rdx
	movq	%rdx, 1568(%rcx)
	movq	40(%rbp), %rdx
	movq	%rdx, 1576(%rcx)
	movq	48(%rbp), %rdx
	movq	%rdx, 1584(%rcx)
	movq	56(%rbp), %rdx
	movq	%rdx, 1592(%rcx)
	movq	64(%rbp), %rdx
	movq	%rdx, 1600(%rcx)
	movq	72(%rbp), %rdx
	movq	%rdx, 1608(%rcx)
	movq	80(%rbp), %rdx
	movq	%rdx, 1616(%rcx)
	movq	88(%rbp), %rdx
	movq	%rdx, 1624(%rcx)
	movq	96(%rbp), %rdx
	movq	%rdx, 1632(%rcx)
	movq	104(%rbp), %rdx
	movq	%rdx, 1640(%rcx)
	movq	112(%rbp), %rdx
	movq	%rdx, 1648(%rcx)
	movq	120(%rbp), %rdx
	movq	%rdx, 1656(%rcx)
	movq	128(%rbp), %rdx
	movq	%rdx, 1664(%rcx)
	movq	136(%rbp), %rdx
	movq	%rdx, 1672(%rcx)
	movq	144(%rbp), %rdx
	movq	%rdx, 1680(%rcx)
	movq	152(%rbp), %rdx
	movq	%rdx, 1688(%rcx)
	movq	160(%rbp), %rdx
	movq	%rdx, 1696(%rcx)
	movq	168(%rbp), %rdx
	movq	%rdx, 1704(%rcx)
	movq	176(%rbp), %rdx
	movq	%rdx, 1712(%rcx)
	movq	184(%rbp), %rdx
	movq	%rdx, 1720(%rcx)
	movq	192(%rbp), %rdx
	movq	%rdx, 1728(%rcx)
	movq	200(%rbp), %rdx
	movq	%rdx, 1736(%rcx)
	movq	208(%rbp), %rdx
	movq	%rdx, 1744(%rcx)
	movq	216(%rbp), %rdx
	movq	%rdx, 1752(%rcx)
	movq	224(%rbp), %rdx
	movq	%rdx, 1760(%rcx)
	movq	232(%rbp), %rdx
	movq	%rdx, 1768(%rcx)
	movq	240(%rbp), %rdx
	movq	%rdx, 1776(%rcx)
	movq	248(%rbp), %rdx
	movq	%rdx, 1784(%rcx)
	movq	256(%rbp), %rdx
	movq	%rdx, 1792(%rcx)
	movq	264(%rbp), %rdx
	movq	%rdx, 1800(%rcx)
	movq	272(%rbp), %rdx
	movq	%rdx, 1808(%rcx)
	movq	280(%rbp), %rdx
	movq	%rdx, 1816(%rcx)
	movq	288(%rbp), %rdx
	movq	%rdx, 1824(%rcx)
	movq	296(%rbp), %rdx
	movq	%rdx, 1832(%rcx)
	movq	304(%rbp), %rdx
	movq	%rdx, 1840(%rcx)
	movq	312(%rbp), %rdx
	movq	%rdx, 1848(%rcx)
	movq	320(%rbp), %rdx
	movq	%rdx, 1856(%rcx)
	movq	328(%rbp), %rdx
	movq	%rdx, 1864(%rcx)
	movq	336(%rbp), %rdx
	movq	%rdx, 1872(%rcx)
	movq	344(%rbp), %rdx
	movq	%rdx, 1880(%rcx)
	movq	352(%rbp), %rdx
	movq	%rdx, 1888(%rcx)
	movq	360(%rbp), %rdx
	movq	%rdx, 1896(%rcx)
	movq	368(%rbp), %rdx
	movq	%rdx, 1904(%rcx)
	movq	376(%rbp), %rdx
	movq	%rdx, 1912(%rcx)
	movq	384(%rbp), %rdx
	movq	%rdx, 1920(%rcx)
	movq	392(%rbp), %rdx
	movq	%rdx, 1928(%rcx)
	movq	400(%rbp), %rdx
	movq	%rdx, 1936(%rcx)
	movq	408(%rbp), %rdx
	movq	%rdx, 1944(%rcx)
	movq	416(%rbp), %rdx
	movq	%rdx, 1952(%rcx)
	movq	424(%rbp), %rdx
	movq	%rdx, 1960(%rcx)
	movq	432(%rbp), %rdx
	movq	%rdx, 1968(%rcx)
	movq	440(%rbp), %rdx
	movq	%rdx, 1976(%rcx)
	movq	448(%rbp), %rdx
	movq	%rdx, 1984(%rcx)
	movq	456(%rbp), %rdx
	movq	%rdx, 1992(%rcx)
	movq	464(%rbp), %rdx
	movq	%rdx, 2000(%rcx)
	movq	472(%rbp), %rdx
	movq	%rdx, 2008(%rcx)
	movq	480(%rbp), %rdx
	movq	%rdx, 2016(%rcx)
	movq	488(%rbp), %rdx
	movq	%rdx, 2024(%rcx)
	movq	496(%rbp), %rdx
	movq	%rdx, 2032(%rcx)
	movq	504(%rbp), %rdx
	movq	%rdx, 2040(%rcx)
	movq	512(%rbp), %rdx
	movq	%rdx, 2048(%rcx)
	movq	520(%rbp), %rdx
	movq	%rdx, 2056(%rcx)
	movq	528(%rbp), %rdx
	movq	%rdx, 2064(%rcx)
	movq	536(%rbp), %rdx
	movq	%rdx, 2072(%rcx)
	movq	544(%rbp), %rdx
	movq	%rdx, 2080(%rcx)
	movq	552(%rbp), %rdx
	movq	%rdx, 2088(%rcx)
	movq	560(%rbp), %rdx
	movq	%rdx, 2096(%rcx)
	movq	568(%rbp), %rdx
	movq	%rdx, 2104(%rcx)
	movq	576(%rbp), %rdx
	movq	%rdx, 2112(%rcx)
	movq	584(%rbp), %rdx
	movq	%rdx, 2120(%rcx)
	movq	592(%rbp), %rdx
	movq	%rdx, 2128(%rcx)
	movq	600(%rbp), %rdx
	movq	%rdx, 2136(%rcx)
	movq	608(%rbp), %rdx
	movq	%rdx, 2144(%rcx)
	movq	616(%rbp), %rdx
	movq	%rdx, 2152(%rcx)
	movq	624(%rbp), %rdx
	movq	%rdx, 2160(%rcx)
	movq	632(%rbp), %rdx
	movq	%rdx, 2168(%rcx)
	movq	640(%rbp), %rdx
	movq	%rdx, 2176(%rcx)
	movq	648(%rbp), %rdx
	movq	%rdx, 2184(%rcx)
	movq	656(%rbp), %rdx
	movq	%rdx, 2192(%rcx)
	movq	664(%rbp), %rdx
	movq	%rdx, 2200(%rcx)
	movq	672(%rbp), %rdx
	movq	%rdx, 2208(%rcx)
	movq	680(%rbp), %rdx
	movq	%rdx, 2216(%rcx)
	movq	688(%rbp), %rdx
	movq	%rdx, 2224(%rcx)
	movq	696(%rbp), %rdx
	movq	%rdx, 2232(%rcx)
	movq	704(%rbp), %rdx
	movq	%rdx, 2240(%rcx)
	movq	712(%rbp), %rdx
	movq	%rdx, 2248(%rcx)
	movq	720(%rbp), %rdx
	movq	%rdx, 2256(%rcx)
	movq	728(%rbp), %rdx
	movq	%rdx, 2264(%rcx)
	movq	736(%rbp), %rdx
	movq	%rdx, 2272(%rcx)
	movq	744(%rbp), %rdx
	movq	%rdx, 2280(%rcx)
	movq	752(%rbp), %rdx
	movq	%rdx, 2288(%rcx)
	movq	760(%rbp), %rdx
	movq	%rdx, 2296(%rcx)
	movq	768(%rbp), %rdx
	movq	%rdx, 2304(%rcx)
	movq	776(%rbp), %rdx
	movq	%rdx, 2312(%rcx)
	movq	784(%rbp), %rdx
	movq	%rdx, 2320(%rcx)
	movq	792(%rbp), %rdx
	movq	%rdx, 2328(%rcx)
	movq	800(%rbp), %rdx
	movq	%rdx, 2336(%rcx)
	movq	808(%rbp), %rdx
	movq	%rdx, 2344(%rcx)
	movq	816(%rbp), %rdx
	movq	%rdx, 2352(%rcx)
	movq	824(%rbp), %rdx
	movq	%rdx, 2360(%rcx)
	movq	832(%rbp), %rdx
	movq	%rdx, 2368(%rcx)
	movq	840(%rbp), %rdx
	movq	%rdx, 2376(%rcx)
	movq	848(%rbp), %rdx
	movq	%rdx, 2384(%rcx)
	movq	856(%rbp), %rdx
	movq	%rdx, 2392(%rcx)
	movq	864(%rbp), %rdx
	movq	%rdx, 2400(%rcx)
	movq	872(%rbp), %rdx
	movq	%rdx, 2408(%rcx)
	movq	880(%rbp), %rdx
	movq	%rdx, 2416(%rcx)
	movq	888(%rbp), %rdx
	movq	%rdx, 2424(%rcx)
	movq	896(%rbp), %rdx
	movq	%rdx, 2432(%rcx)
	movq	904(%rbp), %rdx
	movq	%rdx, 2440(%rcx)
	movq	912(%rbp), %rdx
	movq	%rdx, 2448(%rcx)
	movq	920(%rbp), %rdx
	movq	%rdx, 2456(%rcx)
	movq	928(%rbp), %rdx
	movq	%rdx, 2464(%rcx)
	movq	936(%rbp), %rdx
	movq	%rdx, 2472(%rcx)
	movq	944(%rbp), %rdx
	movq	%rdx, 2480(%rcx)
	movq	952(%rbp), %rdx
	movq	%rdx, 2488(%rcx)
	movq	960(%rbp), %rdx
	movq	%rdx, 2496(%rcx)
	movq	968(%rbp), %rdx
	movq	%rdx, 2504(%rcx)
	movq	976(%rbp), %rdx
	movq	%rdx, 2512(%rcx)
	movq	984(%rbp), %rdx
	movq	%rdx, 2520(%rcx)
	movq	992(%rbp), %rdx
	movq	%rdx, 2528(%rcx)
	movq	1000(%rbp), %rdx
	movq	%rdx, 2536(%rcx)
	movq	1008(%rbp), %rdx
	movq	%rdx, 2544(%rcx)
	movq	1016(%rbp), %rdx
	movq	%rdx, 2552(%rcx)
	movq	1024(%rbp), %rdx
	movq	%rdx, 2560(%rcx)
	movq	1032(%rbp), %rdx
	movq	%rdx, 2568(%rcx)
	movq	1040(%rbp), %rdx
	movq	%rdx, 2576(%rcx)
	movq	1048(%rbp), %rdx
	movq	%rdx, 2584(%rcx)
	movq	1056(%rbp), %rdx
	movq	%rdx, 2592(%rcx)
	movq	1064(%rbp), %rdx
	movq	%rdx, 2600(%rcx)
	movq	1072(%rbp), %rdx
	movq	%rdx, 2608(%rcx)
	movq	1080(%rbp), %rdx
	movq	%rdx, 2616(%rcx)
	movq	1088(%rbp), %rdx
	movq	%rdx, 2624(%rcx)
	movq	1096(%rbp), %rdx
	movq	%rdx, 2632(%rcx)
	movq	1104(%rbp), %rdx
	movq	%rdx, 2640(%rcx)
	movq	1112(%rbp), %rdx
	movq	%rdx, 2648(%rcx)
	movq	1120(%rbp), %rdx
	movq	%rdx, 2656(%rcx)
	movq	1128(%rbp), %rdx
	movq	%rdx, 2664(%rcx)
	movq	1136(%rbp), %rdx
	movq	%rdx, 2672(%rcx)
	movq	1144(%rbp), %rdx
	movq	%rdx, 2680(%rcx)
	movq	1152(%rbp), %rdx
	movq	%rdx, 2688(%rcx)
	movq	1160(%rbp), %rdx
	movq	%rdx, 2696(%rcx)
	movq	1168(%rbp), %rdx
	movq	%rdx, 2704(%rcx)
	movq	1176(%rbp), %rdx
	movq	%rdx, 2712(%rcx)
	movq	1184(%rbp), %rdx
	movq	%rdx, 2720(%rcx)
	movq	1192(%rbp), %rdx
	movq	%rdx, 2728(%rcx)
	movq	1200(%rbp), %rdx
	movq	%rdx, 2736(%rcx)
	movq	1208(%rbp), %rdx
	movq	%rdx, 2744(%rcx)
	movq	1216(%rbp), %rdx
	movq	%rdx, 2752(%rcx)
	movq	1224(%rbp), %rdx
	movq	%rdx, 2760(%rcx)
	movq	1232(%rbp), %rdx
	movq	%rdx, 2768(%rcx)
	movq	1240(%rbp), %rdx
	movq	%rdx, 2776(%rcx)
	movq	1248(%rbp), %rdx
	movq	%rdx, 2784(%rcx)
	movq	1256(%rbp), %rdx
	movq	%rdx, 2792(%rcx)
	movq	1264(%rbp), %rdx
	movq	%rdx, 2800(%rcx)
	movq	1272(%rbp), %rdx
	movq	%rdx, 2808(%rcx)
	movq	1280(%rbp), %rdx
	movq	%rdx, 2816(%rcx)
	movq	1288(%rbp), %rdx
	movq	%rdx, 2824(%rcx)
	movq	1296(%rbp), %rdx
	movq	%rdx, 2832(%rcx)
	movq	1304(%rbp), %rdx
	movq	%rdx, 2840(%rcx)
	movq	1312(%rbp), %rdx
	movq	%rdx, 2848(%rcx)
	movq	1320(%rbp), %rdx
	movq	%rdx, 2856(%rcx)
	movq	1328(%rbp), %rdx
	movq	%rdx, 2864(%rcx)
	movq	1336(%rbp), %rdx
	movq	%rdx, 2872(%rcx)
	movq	1344(%rbp), %rdx
	movq	%rdx, 2880(%rcx)
	movq	1352(%rbp), %rdx
	movq	%rdx, 2888(%rcx)
	movq	1360(%rbp), %rdx
	movq	%rdx, 2896(%rcx)
	movq	1368(%rbp), %rdx
	movq	%rdx, 2904(%rcx)
	movq	1376(%rbp), %rdx
	movq	%rdx, 2912(%rcx)
	movq	1384(%rbp), %rdx
	movq	%rdx, 2920(%rcx)
	movq	1392(%rbp), %rdx
	movq	%rdx, 2928(%rcx)
	movq	1400(%rbp), %rdx
	movq	%rdx, 2936(%rcx)
	movq	1408(%rbp), %rdx
	movq	%rdx, 2944(%rcx)
	movq	1416(%rbp), %rdx
	movq	%rdx, 2952(%rcx)
	movq	1424(%rbp), %rdx
	movq	%rdx, 2960(%rcx)
	movq	1432(%rbp), %rdx
	movq	%rdx, 2968(%rcx)
	movq	1440(%rbp), %rdx
	movq	%rdx, 2976(%rcx)
	movq	1448(%rbp), %rdx
	movq	%rdx, 2984(%rcx)
	movq	1456(%rbp), %rdx
	movq	%rdx, 2992(%rcx)
	movq	1464(%rbp), %rdx
	movq	%rdx, 3000(%rcx)
	movq	1472(%rbp), %rdx
	movq	%rdx, 3008(%rcx)
	movq	1480(%rbp), %rdx
	movq	%rdx, 3016(%rcx)
	movq	1488(%rbp), %rdx
	movq	%rdx, 3024(%rcx)
	movq	1496(%rbp), %rdx
	movq	%rdx, 3032(%rcx)
	movq	1504(%rbp), %rdx
	movq	%rdx, 3040(%rcx)
	movq	1512(%rbp), %rdx
	movq	%rdx, 3048(%rcx)
	movq	1520(%rbp), %rdx
	movq	%rdx, 3056(%rcx)
	movq	1528(%rbp), %rdx
	movq	%rdx, 3064(%rcx)
	movq	1536(%rbp), %rdx
	movq	%rdx, 3072(%rcx)
	movq	1544(%rbp), %rdx
	movq	%rdx, 3080(%rcx)
	movq	1552(%rbp), %rdx
	movq	%rdx, 3088(%rcx)
	movq	1560(%rbp), %rdx
	movq	%rdx, 3096(%rcx)
	leaq	3104(%rcx), %rsi
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$1:
	movq	%mm1, %rax
	movq	32(%rax), %rdx
	movq	%rdx, 3136(%rcx)
	movq	40(%rax), %rdx
	movq	%rdx, 3144(%rcx)
	movq	48(%rax), %rdx
	movq	%rdx, 3152(%rcx)
	movq	56(%rax), %rdx
	movq	%rdx, 3160(%rcx)
	xorl	%eax, %eax
	movq	15016(%rsp), %rbx
	movq	15024(%rsp), %rbp
	movq	15032(%rsp), %r12
	movq	15040(%rsp), %r13
	movq	15048(%rsp), %r14
	movq	15056(%rsp), %r15
	movq	15064(%rsp), %rsp
	ret
L_gen_matrix_avx2$1:
	movq	%rcx, %mm0
	leaq	32(%rsp), %rsi
	movq	$0, %r10
	movq	%rax, %rcx
	movq	%mm0, %r8
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$21:
	leaq	856(%rsp), %rsp
	movq	$8, %r10
	leaq	2048(%rax), %rcx
	movq	%mm0, %r8
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$20:
	leaq	856(%rsp), %rsp
	movq	$16, %r10
	leaq	4096(%rax), %rcx
	movq	%mm0, %r8
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$19:
	leaq	856(%rsp), %rsp
	movq	$24, %r10
	leaq	6144(%rax), %rcx
	movq	%mm0, %r8
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$18:
	leaq	856(%rsp), %rsp
	movq	%rax, %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$17:
	leaq	512(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$16:
	leaq	1024(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$15:
	leaq	1536(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$14:
	leaq	2048(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$13:
	leaq	2560(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$12:
	leaq	3072(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$11:
	leaq	3584(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$10:
	leaq	4096(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$9:
	leaq	4608(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$8:
	leaq	5120(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$7:
	leaq	5632(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$6:
	leaq	6144(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$5:
	leaq	6656(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$4:
	leaq	7168(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$3:
	leaq	7680(%rax), %rsi
	call	L_nttunpack$1
L_gen_matrix_avx2$2:
	ret
L_gen_matrix_sample_four_polynomials$1:
	leaq	glob_data + 2848(%rip), %r9
	shlq	$5, %r8
	addq	%r8, %r10
	movq	(%r9,%r10), %r8
	movq	%r8, 832(%rsp)
	leaq	32(%rsp), %r8
	leaq	832(%rsp), %r11
	call	L_shake128x4_absorb_A32_A2$1
L_gen_matrix_sample_four_polynomials$7:
	leaq	-24(%rsp), %rsp
	call	L_shake128x4_squeeze3blocks$1
L_gen_matrix_sample_four_polynomials$6:
	leaq	24(%rsp), %rsp
	movq	%rcx, %r9
	movq	%rsi, %r10
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$5:
	leaq	512(%rcx), %r9
	leaq	536(%rsi), %r10
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$4:
	leaq	1024(%rcx), %r9
	leaq	1072(%rsi), %r10
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$3:
	leaq	1536(%rcx), %r9
	leaq	1608(%rsi), %r10
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$2:
	ret
L__gen_matrix_fill_polynomial$1:
	movq	$0, %r8
	movq	$0, %rbp
	leaq	-8(%rsp), %rsp
	call	L_gen_matrix_buf_rejection$1
L__gen_matrix_fill_polynomial$6:
	leaq	8(%rsp), %rsp
	movq	$336, %r8
	jmp 	L__gen_matrix_fill_polynomial$2
L__gen_matrix_fill_polynomial$3:
	call	L_shake128_next_state$1
L__gen_matrix_fill_polynomial$5:
	leaq	-8(%rsp), %rsp
	call	L_gen_matrix_buf_rejection$1
L__gen_matrix_fill_polynomial$4:
	leaq	8(%rsp), %rsp
L__gen_matrix_fill_polynomial$2:
	cmpq	$256, %rbp
	jb  	L__gen_matrix_fill_polynomial$3
	ret
L_gen_matrix_buf_rejection$1:
	lfence
	movq	$0, %r11
	vmovdqu	glob_data + 96(%rip), %ymm0
	vmovdqu	glob_data + 32(%rip), %ymm5
	vmovdqu	glob_data + 0(%rip), %ymm1
	vmovdqu	glob_data + 64(%rip), %ymm2
	leaq	glob_data + 2912(%rip), %rbx
	movq	%r8, 8(%rsp)
	movq	%r8, %r13
	jmp 	L_gen_matrix_buf_rejection$22
L_gen_matrix_buf_rejection$23:
	movq	$-1, %r12
	cmovnb	%r12, %r11
	cmpq	$225, %rbp
	jb  	L_gen_matrix_buf_rejection$24
	movq	$-1, %r12
	cmovb	%r12, %r11
	movq	$504, %r13
	jmp 	L_gen_matrix_buf_rejection$22
L_gen_matrix_buf_rejection$24:
	movq	$-1, %r12
	cmovnb	%r12, %r11
	vpermq	$148, (%r10,%r13), %ymm3
	vpermq	$148, 24(%r10,%r13), %ymm4
	vpshufb	%ymm0, %ymm3, %ymm3
	vpshufb	%ymm0, %ymm4, %ymm4
	vpsrlw	$4, %ymm3, %ymm6
	vpsrlw	$4, %ymm4, %ymm7
	vpblendw	$170, %ymm6, %ymm3, %ymm3
	vpblendw	$170, %ymm7, %ymm4, %ymm4
	vpand	%ymm5, %ymm3, %ymm3
	vpand	%ymm5, %ymm4, %ymm4
	vpcmpgtw	%ymm3, %ymm1, %ymm6
	vpcmpgtw	%ymm4, %ymm1, %ymm7
	vpacksswb	%ymm7, %ymm6, %ymm6
	vpmovmskb	%ymm6, %r12
	orq 	%r11, %r12
	movq	%r12, %r13
	andq	$255, %r13
	vmovq	(%rbx,%r13,8), %xmm6
	popcnt	%r13, %r13
	addq	%rbp, %r13
	movq	%r12, %r14
	shrq	$16, %r14
	andq	$255, %r14
	vmovq	(%rbx,%r14,8), %xmm7
	popcnt	%r14, %r14
	addq	%r13, %r14
	movq	%r12, %r15
	shrq	$8, %r15
	andq	$255, %r15
	vmovq	(%rbx,%r15,8), %xmm8
	popcnt	%r15, %r15
	addq	%r14, %r15
	shrq	$24, %r12
	andq	$255, %r12
	vmovq	(%rbx,%r12,8), %xmm9
	popcnt	%r12, %r12
	addq	%r15, %r12
	vinserti128	$1, %xmm7, %ymm6, %ymm6
	vinserti128	$1, %xmm9, %ymm8, %ymm8
	vpaddb	%ymm2, %ymm6, %ymm7
	vpunpcklbw	%ymm7, %ymm6, %ymm6
	vpaddb	%ymm2, %ymm8, %ymm7
	vpunpcklbw	%ymm7, %ymm8, %ymm8
	vpshufb	%ymm6, %ymm3, %ymm3
	vpshufb	%ymm8, %ymm4, %ymm4
	vmovdqu	%xmm3, (%r9,%rbp,2)
	vextracti128	$1, %ymm3, (%r9,%r13,2)
	vmovdqu	%xmm4, (%r9,%r14,2)
	vextracti128	$1, %ymm4, (%r9,%r15,2)
	movq	%r12, %rbp
	addq	$48, 8(%rsp)
	movq	8(%rsp), %r13
	orq 	%r11, %r13
L_gen_matrix_buf_rejection$25:
L_gen_matrix_buf_rejection$22:
	cmpq	$457, %r13
	jb  	L_gen_matrix_buf_rejection$23
	movq	$-1, %r12
	cmovb	%r12, %r11
	movq	8(%rsp), %r13
	orq 	%r11, %r13
	jmp 	L_gen_matrix_buf_rejection$2
L_gen_matrix_buf_rejection$3:
	movq	$-1, %r12
	cmovnb	%r12, %r11
	cmpq	$256, %rbp
	jb  	L_gen_matrix_buf_rejection$4
	movq	$-1, %r12
	cmovb	%r12, %r11
	movq	$504, %r13
	jmp 	L_gen_matrix_buf_rejection$2
L_gen_matrix_buf_rejection$4:
	movq	$-1, %r12
	cmovnb	%r12, %r11
	movq	%r13, 8(%rsp)
	vpermq	$148, (%r10,%r13), %ymm3
	vpshufb	%ymm0, %ymm3, %ymm3
	vpsrlw	$4, %ymm3, %ymm6
	vpblendw	$170, %ymm6, %ymm3, %ymm3
	vpand	%ymm5, %ymm3, %ymm3
	vpcmpgtw	%ymm3, %ymm1, %ymm6
	vpxor	%ymm7, %ymm7, %ymm7
	vpacksswb	%ymm7, %ymm6, %ymm6
	vpmovmskb	%ymm6, %r12
	orq 	%r11, %r12
	movq	%r12, %r13
	andq	$255, %r13
	vmovq	(%rbx,%r13,8), %xmm6
	popcnt	%r13, %r13
	addq	%rbp, %r13
	shrq	$16, %r12
	andq	$255, %r12
	vmovq	(%rbx,%r12,8), %xmm7
	popcnt	%r12, %r14
	addq	%r13, %r14
	vinserti128	$1, %xmm7, %ymm6, %ymm6
	vpaddb	%ymm2, %ymm6, %ymm7
	vpunpcklbw	%ymm7, %ymm6, %ymm6
	vpshufb	%ymm6, %ymm3, %ymm3
	vmovdqu	%xmm3, %xmm4
	cmpq	$248, %rbp
	jbe 	L_gen_matrix_buf_rejection$14
	movq	$-1, %r12
	cmovbe	%r12, %r11
	movq	%xmm4, %r12
	cmpq	$252, %rbp
	jbe 	L_gen_matrix_buf_rejection$20
	movq	$-1, %r15
	cmovbe	%r15, %r11
	jmp 	L_gen_matrix_buf_rejection$21
L_gen_matrix_buf_rejection$20:
	movq	$-1, %r15
	cmovnbe	%r15, %r11
	movq	%r12, (%r9,%rbp,2)
	vpextrq	$1, %xmm4, %r12
	addq	$4, %rbp
L_gen_matrix_buf_rejection$21:
	cmpq	$254, %rbp
	jbe 	L_gen_matrix_buf_rejection$18
	movq	$-1, %r15
	cmovbe	%r15, %r11
	jmp 	L_gen_matrix_buf_rejection$19
L_gen_matrix_buf_rejection$18:
	movq	$-1, %r15
	cmovnbe	%r15, %r11
	movl	%r12d, (%r9,%rbp,2)
	shrq	$32, %r12
	addq	$2, %rbp
L_gen_matrix_buf_rejection$19:
	cmpq	$255, %rbp
	jbe 	L_gen_matrix_buf_rejection$16
	movq	$-1, %rbp
	cmovbe	%rbp, %r11
	jmp 	L_gen_matrix_buf_rejection$15
L_gen_matrix_buf_rejection$16:
	movq	$-1, %r15
	cmovnbe	%r15, %r11
	movw	%r12w, (%r9,%rbp,2)
L_gen_matrix_buf_rejection$17:
	jmp 	L_gen_matrix_buf_rejection$15
L_gen_matrix_buf_rejection$14:
	movq	$-1, %r12
	cmovnbe	%r12, %r11
	vmovdqu	%xmm4, (%r9,%rbp,2)
L_gen_matrix_buf_rejection$15:
	vextracti128	$1, %ymm3, %xmm4
	cmpq	$248, %r13
	jbe 	L_gen_matrix_buf_rejection$6
	movq	$-1, %rbp
	cmovbe	%rbp, %r11
	movq	%xmm4, %r12
	cmpq	$252, %r13
	jbe 	L_gen_matrix_buf_rejection$12
	movq	$-1, %rbp
	cmovbe	%rbp, %r11
	jmp 	L_gen_matrix_buf_rejection$13
L_gen_matrix_buf_rejection$12:
	movq	$-1, %rbp
	cmovnbe	%rbp, %r11
	movq	%r12, (%r9,%r13,2)
	vpextrq	$1, %xmm4, %r12
	addq	$4, %r13
L_gen_matrix_buf_rejection$13:
	cmpq	$254, %r13
	jbe 	L_gen_matrix_buf_rejection$10
	movq	$-1, %rbp
	cmovbe	%rbp, %r11
	jmp 	L_gen_matrix_buf_rejection$11
L_gen_matrix_buf_rejection$10:
	movq	$-1, %rbp
	cmovnbe	%rbp, %r11
	movl	%r12d, (%r9,%r13,2)
	shrq	$32, %r12
	addq	$2, %r13
L_gen_matrix_buf_rejection$11:
	cmpq	$255, %r13
	jbe 	L_gen_matrix_buf_rejection$8
	movq	$-1, %rbp
	cmovbe	%rbp, %r11
	jmp 	L_gen_matrix_buf_rejection$7
L_gen_matrix_buf_rejection$8:
	movq	$-1, %rbp
	cmovnbe	%rbp, %r11
	movw	%r12w, (%r9,%r13,2)
L_gen_matrix_buf_rejection$9:
	jmp 	L_gen_matrix_buf_rejection$7
L_gen_matrix_buf_rejection$6:
	movq	$-1, %rbp
	cmovnbe	%rbp, %r11
	vmovdqu	%xmm4, (%r9,%r13,2)
L_gen_matrix_buf_rejection$7:
	movq	%r14, %rbp
	movq	8(%rsp), %r13
	orq 	%r11, %r13
	addq	$24, %r13
L_gen_matrix_buf_rejection$5:
L_gen_matrix_buf_rejection$2:
	cmpq	$481, %r13
	jb  	L_gen_matrix_buf_rejection$3
	ret
L_i_poly_decompress$1:
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 384(%rip), %ymm1
	vmovdqu	glob_data + 352(%rip), %ymm5
	vmovdqu	glob_data + 320(%rip), %ymm4
	movq	(%r8), %xmm2
	movw	8(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rsi)
	movq	10(%r8), %xmm2
	movw	18(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rsi)
	movq	20(%r8), %xmm2
	movw	28(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rsi)
	movq	30(%r8), %xmm2
	movw	38(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rsi)
	movq	40(%r8), %xmm2
	movw	48(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rsi)
	movq	50(%r8), %xmm2
	movw	58(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rsi)
	movq	60(%r8), %xmm2
	movw	68(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rsi)
	movq	70(%r8), %xmm2
	movw	78(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rsi)
	movq	80(%r8), %xmm2
	movw	88(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rsi)
	movq	90(%r8), %xmm2
	movw	98(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rsi)
	movq	100(%r8), %xmm2
	movw	108(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rsi)
	movq	110(%r8), %xmm2
	movw	118(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rsi)
	movq	120(%r8), %xmm2
	movw	128(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rsi)
	movq	130(%r8), %xmm2
	movw	138(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rsi)
	movq	140(%r8), %xmm2
	movw	148(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rsi)
	movq	150(%r8), %xmm2
	movw	158(%r8), %di
	vpinsrw	$4, %edi, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 480(%rsi)
	ret
L_i_poly_tomsg$1:
	call	L_poly_csubq$1
L_i_poly_tomsg$2:
	leaq	glob_data + 960(%rip), %rcx
	vmovdqu	(%rcx), %ymm0
	leaq	glob_data + 928(%rip), %rcx
	vmovdqu	(%rcx), %ymm1
	vmovdqu	(%rsi), %ymm3
	vmovdqu	32(%rsi), %ymm4
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsubw	%ymm4, %ymm0, %ymm4
	vpsraw	$15, %ymm3, %ymm6
	vpsraw	$15, %ymm4, %ymm7
	vpxor	%ymm6, %ymm3, %ymm3
	vpxor	%ymm7, %ymm4, %ymm4
	vpsubw	%ymm1, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm4, %ymm4
	vpacksswb	%ymm4, %ymm3, %ymm3
	vpermq	$216, %ymm3, %ymm3
	vpmovmskb	%ymm3, %r14
	movl	%r14d, (%rax)
	vmovdqu	64(%rsi), %ymm3
	vmovdqu	96(%rsi), %ymm4
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsubw	%ymm4, %ymm0, %ymm4
	vpsraw	$15, %ymm3, %ymm6
	vpsraw	$15, %ymm4, %ymm7
	vpxor	%ymm6, %ymm3, %ymm3
	vpxor	%ymm7, %ymm4, %ymm4
	vpsubw	%ymm1, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm4, %ymm4
	vpacksswb	%ymm4, %ymm3, %ymm3
	vpermq	$216, %ymm3, %ymm3
	vpmovmskb	%ymm3, %r14
	movl	%r14d, 4(%rax)
	vmovdqu	128(%rsi), %ymm3
	vmovdqu	160(%rsi), %ymm4
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsubw	%ymm4, %ymm0, %ymm4
	vpsraw	$15, %ymm3, %ymm6
	vpsraw	$15, %ymm4, %ymm7
	vpxor	%ymm6, %ymm3, %ymm3
	vpxor	%ymm7, %ymm4, %ymm4
	vpsubw	%ymm1, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm4, %ymm4
	vpacksswb	%ymm4, %ymm3, %ymm3
	vpermq	$216, %ymm3, %ymm3
	vpmovmskb	%ymm3, %r14
	movl	%r14d, 8(%rax)
	vmovdqu	192(%rsi), %ymm3
	vmovdqu	224(%rsi), %ymm4
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsubw	%ymm4, %ymm0, %ymm4
	vpsraw	$15, %ymm3, %ymm6
	vpsraw	$15, %ymm4, %ymm7
	vpxor	%ymm6, %ymm3, %ymm3
	vpxor	%ymm7, %ymm4, %ymm4
	vpsubw	%ymm1, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm4, %ymm4
	vpacksswb	%ymm4, %ymm3, %ymm3
	vpermq	$216, %ymm3, %ymm3
	vpmovmskb	%ymm3, %r14
	movl	%r14d, 12(%rax)
	vmovdqu	256(%rsi), %ymm3
	vmovdqu	288(%rsi), %ymm4
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsubw	%ymm4, %ymm0, %ymm4
	vpsraw	$15, %ymm3, %ymm6
	vpsraw	$15, %ymm4, %ymm7
	vpxor	%ymm6, %ymm3, %ymm3
	vpxor	%ymm7, %ymm4, %ymm4
	vpsubw	%ymm1, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm4, %ymm4
	vpacksswb	%ymm4, %ymm3, %ymm3
	vpermq	$216, %ymm3, %ymm3
	vpmovmskb	%ymm3, %r14
	movl	%r14d, 16(%rax)
	vmovdqu	320(%rsi), %ymm3
	vmovdqu	352(%rsi), %ymm4
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsubw	%ymm4, %ymm0, %ymm4
	vpsraw	$15, %ymm3, %ymm6
	vpsraw	$15, %ymm4, %ymm7
	vpxor	%ymm6, %ymm3, %ymm3
	vpxor	%ymm7, %ymm4, %ymm4
	vpsubw	%ymm1, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm4, %ymm4
	vpacksswb	%ymm4, %ymm3, %ymm3
	vpermq	$216, %ymm3, %ymm3
	vpmovmskb	%ymm3, %r14
	movl	%r14d, 20(%rax)
	vmovdqu	384(%rsi), %ymm3
	vmovdqu	416(%rsi), %ymm4
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsubw	%ymm4, %ymm0, %ymm4
	vpsraw	$15, %ymm3, %ymm6
	vpsraw	$15, %ymm4, %ymm7
	vpxor	%ymm6, %ymm3, %ymm3
	vpxor	%ymm7, %ymm4, %ymm4
	vpsubw	%ymm1, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm4, %ymm4
	vpacksswb	%ymm4, %ymm3, %ymm3
	vpermq	$216, %ymm3, %ymm3
	vpmovmskb	%ymm3, %r14
	movl	%r14d, 24(%rax)
	vmovdqu	448(%rsi), %ymm3
	vmovdqu	480(%rsi), %ymm4
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsubw	%ymm4, %ymm0, %ymm4
	vpsraw	$15, %ymm3, %ymm6
	vpsraw	$15, %ymm4, %ymm7
	vpxor	%ymm6, %ymm3, %ymm3
	vpxor	%ymm7, %ymm4, %ymm4
	vpsubw	%ymm1, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm4, %ymm4
	vpacksswb	%ymm4, %ymm3, %ymm3
	vpermq	$216, %ymm3, %ymm3
	vpmovmskb	%ymm3, %r14
	movl	%r14d, 28(%rax)
	ret
L_i_poly_tobytes$1:
	call	L_poly_csubq$1
L_i_poly_tobytes$2:
	vmovdqu	(%rsi), %ymm6
	vmovdqu	32(%rsi), %ymm3
	vmovdqu	64(%rsi), %ymm4
	vmovdqu	96(%rsi), %ymm10
	vmovdqu	128(%rsi), %ymm1
	vmovdqu	160(%rsi), %ymm5
	vmovdqu	192(%rsi), %ymm2
	vmovdqu	224(%rsi), %ymm12
	vpsllw	$12, %ymm3, %ymm0
	vpor	%ymm6, %ymm0, %ymm0
	vpsrlw	$4, %ymm3, %ymm6
	vpsllw	$8, %ymm4, %ymm3
	vpor	%ymm3, %ymm6, %ymm6
	vpsrlw	$8, %ymm4, %ymm3
	vpsllw	$4, %ymm10, %ymm4
	vpor	%ymm4, %ymm3, %ymm3
	vpsllw	$12, %ymm5, %ymm4
	vpor	%ymm1, %ymm4, %ymm4
	vpsrlw	$4, %ymm5, %ymm10
	vpsllw	$8, %ymm2, %ymm1
	vpor	%ymm1, %ymm10, %ymm5
	vpsrlw	$8, %ymm2, %ymm1
	vpsllw	$4, %ymm12, %ymm7
	vpor	%ymm7, %ymm1, %ymm1
	vpslld	$16, %ymm6, %ymm2
	vpblendw	$170, %ymm2, %ymm0, %ymm2
	vpsrld	$16, %ymm0, %ymm7
	vpblendw	$170, %ymm6, %ymm7, %ymm6
	vpslld	$16, %ymm4, %ymm11
	vpblendw	$170, %ymm11, %ymm3, %ymm7
	vpsrld	$16, %ymm3, %ymm3
	vpblendw	$170, %ymm4, %ymm3, %ymm3
	vpslld	$16, %ymm1, %ymm11
	vpblendw	$170, %ymm11, %ymm5, %ymm9
	vpsrld	$16, %ymm5, %ymm8
	vpblendw	$170, %ymm1, %ymm8, %ymm1
	vmovsldup	%ymm7, %ymm11
	vpblendd	$170, %ymm11, %ymm2, %ymm4
	vpsrlq	$32, %ymm2, %ymm2
	vpblendd	$170, %ymm7, %ymm2, %ymm2
	vmovsldup	%ymm6, %ymm11
	vpblendd	$170, %ymm11, %ymm9, %ymm5
	vpsrlq	$32, %ymm9, %ymm7
	vpblendd	$170, %ymm6, %ymm7, %ymm7
	vmovsldup	%ymm1, %ymm6
	vpblendd	$170, %ymm6, %ymm3, %ymm9
	vpsrlq	$32, %ymm3, %ymm3
	vpblendd	$170, %ymm1, %ymm3, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm3
	vpunpckhqdq	%ymm5, %ymm4, %ymm5
	vpunpcklqdq	%ymm2, %ymm9, %ymm6
	vpunpckhqdq	%ymm2, %ymm9, %ymm2
	vpunpcklqdq	%ymm1, %ymm7, %ymm4
	vpunpckhqdq	%ymm1, %ymm7, %ymm1
	vperm2i128	$32, %ymm6, %ymm3, %ymm11
	vperm2i128	$49, %ymm6, %ymm3, %ymm10
	vperm2i128	$32, %ymm5, %ymm4, %ymm8
	vperm2i128	$49, %ymm5, %ymm4, %ymm0
	vperm2i128	$32, %ymm1, %ymm2, %ymm3
	vperm2i128	$49, %ymm1, %ymm2, %ymm1
	vmovdqu	%ymm11, (%r8)
	vmovdqu	%ymm8, 32(%r8)
	vmovdqu	%ymm3, 64(%r8)
	vmovdqu	%ymm10, 96(%r8)
	vmovdqu	%ymm0, 128(%r8)
	vmovdqu	%ymm1, 160(%r8)
	vmovdqu	256(%rsi), %ymm6
	vmovdqu	288(%rsi), %ymm7
	vmovdqu	320(%rsi), %ymm4
	vmovdqu	352(%rsi), %ymm10
	vmovdqu	384(%rsi), %ymm1
	vmovdqu	416(%rsi), %ymm5
	vmovdqu	448(%rsi), %ymm2
	vmovdqu	480(%rsi), %ymm12
	vpsllw	$12, %ymm7, %ymm0
	vpor	%ymm6, %ymm0, %ymm3
	vpsrlw	$4, %ymm7, %ymm6
	vpsllw	$8, %ymm4, %ymm7
	vpor	%ymm7, %ymm6, %ymm6
	vpsrlw	$8, %ymm4, %ymm7
	vpsllw	$4, %ymm10, %ymm4
	vpor	%ymm4, %ymm7, %ymm4
	vpsllw	$12, %ymm5, %ymm8
	vpor	%ymm1, %ymm8, %ymm1
	vpsrlw	$4, %ymm5, %ymm10
	vpsllw	$8, %ymm2, %ymm11
	vpor	%ymm11, %ymm10, %ymm10
	vpsrlw	$8, %ymm2, %ymm11
	vpsllw	$4, %ymm12, %ymm5
	vpor	%ymm5, %ymm11, %ymm11
	vpslld	$16, %ymm6, %ymm2
	vpblendw	$170, %ymm2, %ymm3, %ymm0
	vpsrld	$16, %ymm3, %ymm3
	vpblendw	$170, %ymm6, %ymm3, %ymm2
	vpslld	$16, %ymm1, %ymm6
	vpblendw	$170, %ymm6, %ymm4, %ymm5
	vpsrld	$16, %ymm4, %ymm3
	vpblendw	$170, %ymm1, %ymm3, %ymm4
	vpslld	$16, %ymm11, %ymm6
	vpblendw	$170, %ymm6, %ymm10, %ymm7
	vpsrld	$16, %ymm10, %ymm3
	vpblendw	$170, %ymm11, %ymm3, %ymm1
	vmovsldup	%ymm5, %ymm6
	vpblendd	$170, %ymm6, %ymm0, %ymm3
	vpsrlq	$32, %ymm0, %ymm9
	vpblendd	$170, %ymm5, %ymm9, %ymm5
	vmovsldup	%ymm2, %ymm6
	vpblendd	$170, %ymm6, %ymm7, %ymm6
	vpsrlq	$32, %ymm7, %ymm7
	vpblendd	$170, %ymm2, %ymm7, %ymm2
	vmovsldup	%ymm1, %ymm11
	vpblendd	$170, %ymm11, %ymm4, %ymm7
	vpsrlq	$32, %ymm4, %ymm4
	vpblendd	$170, %ymm1, %ymm4, %ymm1
	vpunpcklqdq	%ymm6, %ymm3, %ymm4
	vpunpckhqdq	%ymm6, %ymm3, %ymm3
	vpunpcklqdq	%ymm5, %ymm7, %ymm6
	vpunpckhqdq	%ymm5, %ymm7, %ymm5
	vpunpcklqdq	%ymm1, %ymm2, %ymm7
	vpunpckhqdq	%ymm1, %ymm2, %ymm1
	vperm2i128	$32, %ymm6, %ymm4, %ymm2
	vperm2i128	$49, %ymm6, %ymm4, %ymm10
	vperm2i128	$32, %ymm3, %ymm7, %ymm4
	vperm2i128	$49, %ymm3, %ymm7, %ymm0
	vperm2i128	$32, %ymm1, %ymm5, %ymm3
	vperm2i128	$49, %ymm1, %ymm5, %ymm1
	vmovdqu	%ymm2, 192(%r8)
	vmovdqu	%ymm4, 224(%r8)
	vmovdqu	%ymm3, 256(%r8)
	vmovdqu	%ymm10, 288(%r8)
	vmovdqu	%ymm0, 320(%r8)
	vmovdqu	%ymm1, 352(%r8)
	ret
L_poly_sub$1:
	vmovdqu	(%rcx), %ymm2
	vmovdqu	(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, (%rsi)
	vmovdqu	32(%rcx), %ymm2
	vmovdqu	32(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 32(%rsi)
	vmovdqu	64(%rcx), %ymm2
	vmovdqu	64(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 64(%rsi)
	vmovdqu	96(%rcx), %ymm2
	vmovdqu	96(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 96(%rsi)
	vmovdqu	128(%rcx), %ymm2
	vmovdqu	128(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 128(%rsi)
	vmovdqu	160(%rcx), %ymm2
	vmovdqu	160(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 160(%rsi)
	vmovdqu	192(%rcx), %ymm2
	vmovdqu	192(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 192(%rsi)
	vmovdqu	224(%rcx), %ymm2
	vmovdqu	224(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 224(%rsi)
	vmovdqu	256(%rcx), %ymm2
	vmovdqu	256(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 256(%rsi)
	vmovdqu	288(%rcx), %ymm2
	vmovdqu	288(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 288(%rsi)
	vmovdqu	320(%rcx), %ymm2
	vmovdqu	320(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 320(%rsi)
	vmovdqu	352(%rcx), %ymm2
	vmovdqu	352(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 352(%rsi)
	vmovdqu	384(%rcx), %ymm2
	vmovdqu	384(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 384(%rsi)
	vmovdqu	416(%rcx), %ymm2
	vmovdqu	416(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 416(%rsi)
	vmovdqu	448(%rcx), %ymm2
	vmovdqu	448(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 448(%rsi)
	vmovdqu	480(%rcx), %ymm2
	vmovdqu	480(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rsi)
	ret
L_poly_ntt$1:
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vpbroadcastd	glob_data + 2016(%rip), %ymm2
	vpbroadcastd	glob_data + 2020(%rip), %ymm4
	vmovdqu	(%rsi), %ymm8
	vmovdqu	32(%rsi), %ymm14
	vmovdqu	64(%rsi), %ymm1
	vmovdqu	96(%rsi), %ymm3
	vmovdqu	256(%rsi), %ymm9
	vmovdqu	288(%rsi), %ymm10
	vmovdqu	320(%rsi), %ymm13
	vmovdqu	352(%rsi), %ymm12
	vpmullw	%ymm9, %ymm2, %ymm6
	vpmulhw	%ymm9, %ymm4, %ymm7
	vpmullw	%ymm10, %ymm2, %ymm9
	vpmulhw	%ymm10, %ymm4, %ymm15
	vpmullw	%ymm13, %ymm2, %ymm10
	vpmulhw	%ymm13, %ymm4, %ymm5
	vpmullw	%ymm12, %ymm2, %ymm11
	vpmulhw	%ymm12, %ymm4, %ymm12
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhw	%ymm0, %ymm11, %ymm11
	vpsubw	%ymm15, %ymm14, %ymm13
	vpaddw	%ymm14, %ymm15, %ymm14
	vpsubw	%ymm7, %ymm8, %ymm15
	vpaddw	%ymm8, %ymm7, %ymm8
	vpsubw	%ymm12, %ymm3, %ymm7
	vpaddw	%ymm3, %ymm12, %ymm3
	vpsubw	%ymm5, %ymm1, %ymm12
	vpaddw	%ymm1, %ymm5, %ymm1
	vpaddw	%ymm15, %ymm6, %ymm5
	vpsubw	%ymm6, %ymm8, %ymm6
	vpaddw	%ymm13, %ymm9, %ymm8
	vpsubw	%ymm9, %ymm14, %ymm9
	vpaddw	%ymm12, %ymm10, %ymm12
	vpsubw	%ymm10, %ymm1, %ymm10
	vpaddw	%ymm7, %ymm11, %ymm1
	vpsubw	%ymm11, %ymm3, %ymm7
	vmovdqu	%ymm6, (%rsi)
	vmovdqu	%ymm9, 32(%rsi)
	vmovdqu	%ymm10, 64(%rsi)
	vmovdqu	%ymm7, 96(%rsi)
	vmovdqu	%ymm5, 256(%rsi)
	vmovdqu	%ymm8, 288(%rsi)
	vmovdqu	%ymm12, 320(%rsi)
	vmovdqu	%ymm1, 352(%rsi)
	vmovdqu	128(%rsi), %ymm8
	vmovdqu	160(%rsi), %ymm6
	vmovdqu	192(%rsi), %ymm1
	vmovdqu	224(%rsi), %ymm3
	vmovdqu	384(%rsi), %ymm9
	vmovdqu	416(%rsi), %ymm10
	vmovdqu	448(%rsi), %ymm13
	vmovdqu	480(%rsi), %ymm12
	vpmullw	%ymm9, %ymm2, %ymm15
	vpmulhw	%ymm9, %ymm4, %ymm7
	vpmullw	%ymm10, %ymm2, %ymm9
	vpmulhw	%ymm10, %ymm4, %ymm14
	vpmullw	%ymm13, %ymm2, %ymm10
	vpmulhw	%ymm13, %ymm4, %ymm5
	vpmullw	%ymm12, %ymm2, %ymm11
	vpmulhw	%ymm12, %ymm4, %ymm12
	vpmulhw	%ymm0, %ymm15, %ymm2
	vpmulhw	%ymm0, %ymm9, %ymm4
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhw	%ymm0, %ymm11, %ymm11
	vpsubw	%ymm14, %ymm6, %ymm13
	vpaddw	%ymm6, %ymm14, %ymm6
	vpsubw	%ymm7, %ymm8, %ymm9
	vpaddw	%ymm8, %ymm7, %ymm8
	vpsubw	%ymm12, %ymm3, %ymm7
	vpaddw	%ymm3, %ymm12, %ymm3
	vpsubw	%ymm5, %ymm1, %ymm12
	vpaddw	%ymm1, %ymm5, %ymm1
	vpaddw	%ymm9, %ymm2, %ymm5
	vpsubw	%ymm2, %ymm8, %ymm8
	vpaddw	%ymm13, %ymm4, %ymm9
	vpsubw	%ymm4, %ymm6, %ymm6
	vpaddw	%ymm12, %ymm10, %ymm12
	vpsubw	%ymm10, %ymm1, %ymm10
	vpaddw	%ymm7, %ymm11, %ymm1
	vpsubw	%ymm11, %ymm3, %ymm13
	vmovdqu	%ymm5, 384(%rsi)
	vmovdqu	%ymm9, 416(%rsi)
	vmovdqu	%ymm12, 448(%rsi)
	vmovdqu	%ymm1, 480(%rsi)
	vpbroadcastd	glob_data + 2024(%rip), %ymm2
	vpbroadcastd	glob_data + 2028(%rip), %ymm4
	vmovdqu	%ymm6, %ymm14
	vmovdqu	%ymm10, %ymm12
	vmovdqu	(%rsi), %ymm9
	vmovdqu	32(%rsi), %ymm6
	vmovdqu	64(%rsi), %ymm7
	vmovdqu	96(%rsi), %ymm5
	vpmullw	%ymm8, %ymm2, %ymm15
	vpmulhw	%ymm8, %ymm4, %ymm3
	vpmullw	%ymm14, %ymm2, %ymm11
	vpmulhw	%ymm14, %ymm4, %ymm10
	vpmullw	%ymm12, %ymm2, %ymm1
	vpmulhw	%ymm12, %ymm4, %ymm8
	vpmullw	%ymm13, %ymm2, %ymm2
	vpmulhw	%ymm13, %ymm4, %ymm12
	vpmulhw	%ymm0, %ymm15, %ymm15
	vpmulhw	%ymm0, %ymm11, %ymm4
	vpmulhw	%ymm0, %ymm1, %ymm1
	vpmulhw	%ymm0, %ymm2, %ymm2
	vpsubw	%ymm10, %ymm6, %ymm13
	vpaddw	%ymm6, %ymm10, %ymm6
	vpsubw	%ymm3, %ymm9, %ymm11
	vpaddw	%ymm9, %ymm3, %ymm10
	vpsubw	%ymm12, %ymm5, %ymm3
	vpaddw	%ymm5, %ymm12, %ymm5
	vpsubw	%ymm8, %ymm7, %ymm9
	vpaddw	%ymm7, %ymm8, %ymm12
	vpaddw	%ymm11, %ymm15, %ymm7
	vpsubw	%ymm15, %ymm10, %ymm10
	vpaddw	%ymm13, %ymm4, %ymm8
	vpsubw	%ymm4, %ymm6, %ymm4
	vpaddw	%ymm9, %ymm1, %ymm6
	vpsubw	%ymm1, %ymm12, %ymm11
	vpaddw	%ymm3, %ymm2, %ymm1
	vpsubw	%ymm2, %ymm5, %ymm12
	vmovdqu	glob_data + 2032(%rip), %ymm5
	vmovdqu	glob_data + 2064(%rip), %ymm3
	vperm2i128	$32, %ymm7, %ymm10, %ymm9
	vperm2i128	$49, %ymm7, %ymm10, %ymm7
	vperm2i128	$32, %ymm8, %ymm4, %ymm2
	vperm2i128	$49, %ymm8, %ymm4, %ymm8
	vperm2i128	$32, %ymm6, %ymm11, %ymm15
	vperm2i128	$49, %ymm6, %ymm11, %ymm10
	vperm2i128	$32, %ymm1, %ymm12, %ymm13
	vperm2i128	$49, %ymm1, %ymm12, %ymm12
	vpmullw	%ymm15, %ymm5, %ymm6
	vpmulhw	%ymm15, %ymm3, %ymm14
	vpmullw	%ymm10, %ymm5, %ymm4
	vpmulhw	%ymm10, %ymm3, %ymm10
	vpmullw	%ymm13, %ymm5, %ymm11
	vpmulhw	%ymm13, %ymm3, %ymm1
	vpmullw	%ymm12, %ymm5, %ymm5
	vpmulhw	%ymm12, %ymm3, %ymm12
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpmulhw	%ymm0, %ymm11, %ymm3
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm10, %ymm7, %ymm13
	vpaddw	%ymm7, %ymm10, %ymm10
	vpsubw	%ymm14, %ymm9, %ymm11
	vpaddw	%ymm9, %ymm14, %ymm9
	vpsubw	%ymm12, %ymm8, %ymm7
	vpaddw	%ymm8, %ymm12, %ymm8
	vpsubw	%ymm1, %ymm2, %ymm12
	vpaddw	%ymm2, %ymm1, %ymm2
	vpaddw	%ymm11, %ymm6, %ymm1
	vpsubw	%ymm6, %ymm9, %ymm9
	vpaddw	%ymm13, %ymm4, %ymm6
	vpsubw	%ymm4, %ymm10, %ymm4
	vpaddw	%ymm12, %ymm3, %ymm10
	vpsubw	%ymm3, %ymm2, %ymm13
	vpaddw	%ymm7, %ymm5, %ymm7
	vpsubw	%ymm5, %ymm8, %ymm14
	vmovdqu	glob_data + 2096(%rip), %ymm2
	vmovdqu	glob_data + 2128(%rip), %ymm11
	vpunpcklqdq	%ymm1, %ymm9, %ymm8
	vpunpckhqdq	%ymm1, %ymm9, %ymm3
	vpunpcklqdq	%ymm6, %ymm4, %ymm12
	vpunpckhqdq	%ymm6, %ymm4, %ymm5
	vpunpcklqdq	%ymm10, %ymm13, %ymm9
	vpunpckhqdq	%ymm10, %ymm13, %ymm10
	vpunpcklqdq	%ymm7, %ymm14, %ymm13
	vpunpckhqdq	%ymm7, %ymm14, %ymm14
	vpmullw	%ymm9, %ymm2, %ymm6
	vpmulhw	%ymm9, %ymm11, %ymm9
	vpmullw	%ymm10, %ymm2, %ymm4
	vpmulhw	%ymm10, %ymm11, %ymm10
	vpmullw	%ymm13, %ymm2, %ymm1
	vpmulhw	%ymm13, %ymm11, %ymm7
	vpmullw	%ymm14, %ymm2, %ymm2
	vpmulhw	%ymm14, %ymm11, %ymm14
	vpmulhw	%ymm0, %ymm6, %ymm15
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpmulhw	%ymm0, %ymm1, %ymm1
	vpmulhw	%ymm0, %ymm2, %ymm2
	vpsubw	%ymm10, %ymm3, %ymm13
	vpaddw	%ymm3, %ymm10, %ymm6
	vpsubw	%ymm9, %ymm8, %ymm11
	vpaddw	%ymm8, %ymm9, %ymm8
	vpsubw	%ymm14, %ymm5, %ymm3
	vpaddw	%ymm5, %ymm14, %ymm5
	vpsubw	%ymm7, %ymm12, %ymm9
	vpaddw	%ymm12, %ymm7, %ymm12
	vpaddw	%ymm11, %ymm15, %ymm7
	vpsubw	%ymm15, %ymm8, %ymm10
	vpaddw	%ymm13, %ymm4, %ymm8
	vpsubw	%ymm4, %ymm6, %ymm4
	vpaddw	%ymm9, %ymm1, %ymm6
	vpsubw	%ymm1, %ymm12, %ymm11
	vpaddw	%ymm3, %ymm2, %ymm1
	vpsubw	%ymm2, %ymm5, %ymm12
	vmovdqu	glob_data + 2160(%rip), %ymm5
	vmovdqu	glob_data + 2192(%rip), %ymm3
	vmovsldup	%ymm7, %ymm2
	vpblendd	$170, %ymm2, %ymm10, %ymm9
	vpsrlq	$32, %ymm10, %ymm2
	vpblendd	$170, %ymm7, %ymm2, %ymm10
	vmovsldup	%ymm8, %ymm2
	vpblendd	$170, %ymm2, %ymm4, %ymm2
	vpsrlq	$32, %ymm4, %ymm4
	vpblendd	$170, %ymm8, %ymm4, %ymm8
	vmovsldup	%ymm6, %ymm15
	vpblendd	$170, %ymm15, %ymm11, %ymm15
	vpsrlq	$32, %ymm11, %ymm4
	vpblendd	$170, %ymm6, %ymm4, %ymm14
	vmovsldup	%ymm1, %ymm6
	vpblendd	$170, %ymm6, %ymm12, %ymm13
	vpsrlq	$32, %ymm12, %ymm4
	vpblendd	$170, %ymm1, %ymm4, %ymm12
	vpmullw	%ymm15, %ymm5, %ymm6
	vpmulhw	%ymm15, %ymm3, %ymm7
	vpmullw	%ymm14, %ymm5, %ymm4
	vpmulhw	%ymm14, %ymm3, %ymm14
	vpmullw	%ymm13, %ymm5, %ymm11
	vpmulhw	%ymm13, %ymm3, %ymm1
	vpmullw	%ymm12, %ymm5, %ymm5
	vpmulhw	%ymm12, %ymm3, %ymm12
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpmulhw	%ymm0, %ymm11, %ymm3
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm14, %ymm10, %ymm13
	vpaddw	%ymm10, %ymm14, %ymm10
	vpsubw	%ymm7, %ymm9, %ymm11
	vpaddw	%ymm9, %ymm7, %ymm9
	vpsubw	%ymm12, %ymm8, %ymm7
	vpaddw	%ymm8, %ymm12, %ymm8
	vpsubw	%ymm1, %ymm2, %ymm12
	vpaddw	%ymm2, %ymm1, %ymm2
	vpaddw	%ymm11, %ymm6, %ymm1
	vpsubw	%ymm6, %ymm9, %ymm9
	vpaddw	%ymm13, %ymm4, %ymm6
	vpsubw	%ymm4, %ymm10, %ymm4
	vpaddw	%ymm12, %ymm3, %ymm10
	vpsubw	%ymm3, %ymm2, %ymm11
	vpaddw	%ymm7, %ymm5, %ymm13
	vpsubw	%ymm5, %ymm8, %ymm14
	vmovdqu	glob_data + 2224(%rip), %ymm5
	vmovdqu	glob_data + 2256(%rip), %ymm3
	vpslld	$16, %ymm1, %ymm2
	vpblendw	$170, %ymm2, %ymm9, %ymm8
	vpsrld	$16, %ymm9, %ymm7
	vpblendw	$170, %ymm1, %ymm7, %ymm7
	vpslld	$16, %ymm6, %ymm2
	vpblendw	$170, %ymm2, %ymm4, %ymm2
	vpsrld	$16, %ymm4, %ymm9
	vpblendw	$170, %ymm6, %ymm9, %ymm12
	vpslld	$16, %ymm10, %ymm6
	vpblendw	$170, %ymm6, %ymm11, %ymm9
	vpsrld	$16, %ymm11, %ymm1
	vpblendw	$170, %ymm10, %ymm1, %ymm10
	vpslld	$16, %ymm13, %ymm6
	vpblendw	$170, %ymm6, %ymm14, %ymm1
	vpsrld	$16, %ymm14, %ymm14
	vpblendw	$170, %ymm13, %ymm14, %ymm13
	vpmullw	%ymm9, %ymm5, %ymm6
	vpmulhw	%ymm9, %ymm3, %ymm9
	vpmullw	%ymm10, %ymm5, %ymm4
	vpmulhw	%ymm10, %ymm3, %ymm10
	vpmullw	%ymm1, %ymm5, %ymm11
	vpmulhw	%ymm1, %ymm3, %ymm1
	vpmullw	%ymm13, %ymm5, %ymm5
	vpmulhw	%ymm13, %ymm3, %ymm14
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpmulhw	%ymm0, %ymm11, %ymm3
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm10, %ymm7, %ymm13
	vpaddw	%ymm7, %ymm10, %ymm10
	vpsubw	%ymm9, %ymm8, %ymm11
	vpaddw	%ymm8, %ymm9, %ymm9
	vpsubw	%ymm14, %ymm12, %ymm7
	vpaddw	%ymm12, %ymm14, %ymm8
	vpsubw	%ymm1, %ymm2, %ymm12
	vpaddw	%ymm2, %ymm1, %ymm2
	vpaddw	%ymm11, %ymm6, %ymm1
	vpsubw	%ymm6, %ymm9, %ymm9
	vpaddw	%ymm13, %ymm4, %ymm6
	vpsubw	%ymm4, %ymm10, %ymm10
	vpaddw	%ymm12, %ymm3, %ymm4
	vpsubw	%ymm3, %ymm2, %ymm11
	vpaddw	%ymm7, %ymm5, %ymm3
	vpsubw	%ymm5, %ymm8, %ymm13
	vmovdqu	glob_data + 2288(%rip), %ymm5
	vmovdqu	glob_data + 2320(%rip), %ymm14
	vmovdqu	glob_data + 2352(%rip), %ymm12
	vmovdqu	glob_data + 2384(%rip), %ymm2
	vpmullw	%ymm11, %ymm5, %ymm15
	vpmulhw	%ymm11, %ymm14, %ymm7
	vpmullw	%ymm13, %ymm5, %ymm8
	vpmulhw	%ymm13, %ymm14, %ymm14
	vpmullw	%ymm4, %ymm12, %ymm11
	vpmulhw	%ymm4, %ymm2, %ymm5
	vpmullw	%ymm3, %ymm12, %ymm13
	vpmulhw	%ymm3, %ymm2, %ymm12
	vpmulhw	%ymm0, %ymm15, %ymm2
	vpmulhw	%ymm0, %ymm8, %ymm4
	vpmulhw	%ymm0, %ymm11, %ymm3
	vpmulhw	%ymm0, %ymm13, %ymm11
	vpsubw	%ymm14, %ymm10, %ymm13
	vpaddw	%ymm10, %ymm14, %ymm10
	vpsubw	%ymm7, %ymm9, %ymm15
	vpaddw	%ymm9, %ymm7, %ymm8
	vpsubw	%ymm12, %ymm6, %ymm7
	vpaddw	%ymm6, %ymm12, %ymm6
	vpsubw	%ymm5, %ymm1, %ymm9
	vpaddw	%ymm1, %ymm5, %ymm1
	vpaddw	%ymm15, %ymm2, %ymm5
	vpsubw	%ymm2, %ymm8, %ymm2
	vpaddw	%ymm13, %ymm4, %ymm8
	vpsubw	%ymm4, %ymm10, %ymm4
	vpaddw	%ymm9, %ymm3, %ymm9
	vpsubw	%ymm3, %ymm1, %ymm1
	vpaddw	%ymm7, %ymm11, %ymm3
	vpsubw	%ymm11, %ymm6, %ymm6
	vmovdqu	glob_data + 1120(%rip), %ymm7
	vpmulhw	%ymm7, %ymm2, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm2, %ymm2
	vpmulhw	%ymm7, %ymm4, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm4, %ymm11
	vpmulhw	%ymm7, %ymm1, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm1, %ymm10
	vpmulhw	%ymm7, %ymm6, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm6, %ymm1
	vpmulhw	%ymm7, %ymm5, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm5, %ymm6
	vpmulhw	%ymm7, %ymm8, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm8, %ymm8
	vpmulhw	%ymm7, %ymm9, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm9, %ymm13
	vpmulhw	%ymm7, %ymm3, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm3, %ymm3
	vmovdqu	%ymm2, (%rsi)
	vmovdqu	%ymm11, 32(%rsi)
	vmovdqu	%ymm6, 64(%rsi)
	vmovdqu	%ymm8, 96(%rsi)
	vmovdqu	%ymm10, 128(%rsi)
	vmovdqu	%ymm1, 160(%rsi)
	vmovdqu	%ymm13, 192(%rsi)
	vmovdqu	%ymm3, 224(%rsi)
	vpbroadcastd	glob_data + 2416(%rip), %ymm2
	vpbroadcastd	glob_data + 2420(%rip), %ymm6
	vmovdqu	384(%rsi), %ymm9
	vmovdqu	416(%rsi), %ymm10
	vmovdqu	448(%rsi), %ymm13
	vmovdqu	480(%rsi), %ymm7
	vmovdqu	256(%rsi), %ymm8
	vmovdqu	288(%rsi), %ymm3
	vmovdqu	320(%rsi), %ymm12
	vmovdqu	352(%rsi), %ymm4
	vpmullw	%ymm9, %ymm2, %ymm11
	vpmulhw	%ymm9, %ymm6, %ymm9
	vpmullw	%ymm10, %ymm2, %ymm5
	vpmulhw	%ymm10, %ymm6, %ymm15
	vpmullw	%ymm13, %ymm2, %ymm1
	vpmulhw	%ymm13, %ymm6, %ymm10
	vpmullw	%ymm7, %ymm2, %ymm2
	vpmulhw	%ymm7, %ymm6, %ymm14
	vpmulhw	%ymm0, %ymm11, %ymm6
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpmulhw	%ymm0, %ymm1, %ymm1
	vpmulhw	%ymm0, %ymm2, %ymm2
	vpsubw	%ymm15, %ymm3, %ymm13
	vpaddw	%ymm3, %ymm15, %ymm7
	vpsubw	%ymm9, %ymm8, %ymm11
	vpaddw	%ymm8, %ymm9, %ymm8
	vpsubw	%ymm14, %ymm4, %ymm3
	vpaddw	%ymm4, %ymm14, %ymm4
	vpsubw	%ymm10, %ymm12, %ymm9
	vpaddw	%ymm12, %ymm10, %ymm12
	vpaddw	%ymm11, %ymm6, %ymm11
	vpsubw	%ymm6, %ymm8, %ymm10
	vpaddw	%ymm13, %ymm5, %ymm13
	vpsubw	%ymm5, %ymm7, %ymm6
	vpaddw	%ymm9, %ymm1, %ymm9
	vpsubw	%ymm1, %ymm12, %ymm1
	vpaddw	%ymm3, %ymm2, %ymm5
	vpsubw	%ymm2, %ymm4, %ymm14
	vmovdqu	glob_data + 2424(%rip), %ymm4
	vmovdqu	glob_data + 2456(%rip), %ymm3
	vperm2i128	$32, %ymm11, %ymm10, %ymm8
	vperm2i128	$49, %ymm11, %ymm10, %ymm7
	vperm2i128	$32, %ymm13, %ymm6, %ymm2
	vperm2i128	$49, %ymm13, %ymm6, %ymm12
	vperm2i128	$32, %ymm9, %ymm1, %ymm11
	vperm2i128	$49, %ymm9, %ymm1, %ymm10
	vperm2i128	$32, %ymm5, %ymm14, %ymm1
	vperm2i128	$49, %ymm5, %ymm14, %ymm14
	vpmullw	%ymm11, %ymm4, %ymm6
	vpmulhw	%ymm11, %ymm3, %ymm9
	vpmullw	%ymm10, %ymm4, %ymm13
	vpmulhw	%ymm10, %ymm3, %ymm10
	vpmullw	%ymm1, %ymm4, %ymm11
	vpmulhw	%ymm1, %ymm3, %ymm1
	vpmullw	%ymm14, %ymm4, %ymm5
	vpmulhw	%ymm14, %ymm3, %ymm14
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm13, %ymm4
	vpmulhw	%ymm0, %ymm11, %ymm3
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm10, %ymm7, %ymm13
	vpaddw	%ymm7, %ymm10, %ymm10
	vpsubw	%ymm9, %ymm8, %ymm11
	vpaddw	%ymm8, %ymm9, %ymm8
	vpsubw	%ymm14, %ymm12, %ymm7
	vpaddw	%ymm12, %ymm14, %ymm12
	vpsubw	%ymm1, %ymm2, %ymm9
	vpaddw	%ymm2, %ymm1, %ymm1
	vpaddw	%ymm11, %ymm6, %ymm2
	vpsubw	%ymm6, %ymm8, %ymm11
	vpaddw	%ymm13, %ymm4, %ymm6
	vpsubw	%ymm4, %ymm10, %ymm4
	vpaddw	%ymm9, %ymm3, %ymm10
	vpsubw	%ymm3, %ymm1, %ymm9
	vpaddw	%ymm7, %ymm5, %ymm7
	vpsubw	%ymm5, %ymm12, %ymm14
	vmovdqu	glob_data + 2488(%rip), %ymm1
	vmovdqu	glob_data + 2520(%rip), %ymm13
	vpunpcklqdq	%ymm2, %ymm11, %ymm8
	vpunpckhqdq	%ymm2, %ymm11, %ymm3
	vpunpcklqdq	%ymm6, %ymm4, %ymm12
	vpunpckhqdq	%ymm6, %ymm4, %ymm5
	vpunpcklqdq	%ymm10, %ymm9, %ymm11
	vpunpckhqdq	%ymm10, %ymm9, %ymm10
	vpunpcklqdq	%ymm7, %ymm14, %ymm2
	vpunpckhqdq	%ymm7, %ymm14, %ymm14
	vpmullw	%ymm11, %ymm1, %ymm6
	vpmulhw	%ymm11, %ymm13, %ymm9
	vpmullw	%ymm10, %ymm1, %ymm4
	vpmulhw	%ymm10, %ymm13, %ymm10
	vpmullw	%ymm2, %ymm1, %ymm11
	vpmulhw	%ymm2, %ymm13, %ymm7
	vpmullw	%ymm14, %ymm1, %ymm2
	vpmulhw	%ymm14, %ymm13, %ymm14
	vpmulhw	%ymm0, %ymm6, %ymm15
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpmulhw	%ymm0, %ymm11, %ymm1
	vpmulhw	%ymm0, %ymm2, %ymm2
	vpsubw	%ymm10, %ymm3, %ymm13
	vpaddw	%ymm3, %ymm10, %ymm6
	vpsubw	%ymm9, %ymm8, %ymm11
	vpaddw	%ymm8, %ymm9, %ymm8
	vpsubw	%ymm14, %ymm5, %ymm3
	vpaddw	%ymm5, %ymm14, %ymm5
	vpsubw	%ymm7, %ymm12, %ymm9
	vpaddw	%ymm12, %ymm7, %ymm12
	vpaddw	%ymm11, %ymm15, %ymm7
	vpsubw	%ymm15, %ymm8, %ymm10
	vpaddw	%ymm13, %ymm4, %ymm8
	vpsubw	%ymm4, %ymm6, %ymm4
	vpaddw	%ymm9, %ymm1, %ymm6
	vpsubw	%ymm1, %ymm12, %ymm11
	vpaddw	%ymm3, %ymm2, %ymm1
	vpsubw	%ymm2, %ymm5, %ymm12
	vmovdqu	glob_data + 2552(%rip), %ymm5
	vmovdqu	glob_data + 2584(%rip), %ymm3
	vmovsldup	%ymm7, %ymm2
	vpblendd	$170, %ymm2, %ymm10, %ymm9
	vpsrlq	$32, %ymm10, %ymm2
	vpblendd	$170, %ymm7, %ymm2, %ymm7
	vmovsldup	%ymm8, %ymm2
	vpblendd	$170, %ymm2, %ymm4, %ymm2
	vpsrlq	$32, %ymm4, %ymm4
	vpblendd	$170, %ymm8, %ymm4, %ymm8
	vmovsldup	%ymm6, %ymm15
	vpblendd	$170, %ymm15, %ymm11, %ymm15
	vpsrlq	$32, %ymm11, %ymm4
	vpblendd	$170, %ymm6, %ymm4, %ymm10
	vmovsldup	%ymm1, %ymm6
	vpblendd	$170, %ymm6, %ymm12, %ymm13
	vpsrlq	$32, %ymm12, %ymm4
	vpblendd	$170, %ymm1, %ymm4, %ymm12
	vpmullw	%ymm15, %ymm5, %ymm6
	vpmulhw	%ymm15, %ymm3, %ymm14
	vpmullw	%ymm10, %ymm5, %ymm4
	vpmulhw	%ymm10, %ymm3, %ymm10
	vpmullw	%ymm13, %ymm5, %ymm11
	vpmulhw	%ymm13, %ymm3, %ymm1
	vpmullw	%ymm12, %ymm5, %ymm5
	vpmulhw	%ymm12, %ymm3, %ymm12
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpmulhw	%ymm0, %ymm11, %ymm3
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm10, %ymm7, %ymm13
	vpaddw	%ymm7, %ymm10, %ymm10
	vpsubw	%ymm14, %ymm9, %ymm11
	vpaddw	%ymm9, %ymm14, %ymm9
	vpsubw	%ymm12, %ymm8, %ymm7
	vpaddw	%ymm8, %ymm12, %ymm8
	vpsubw	%ymm1, %ymm2, %ymm12
	vpaddw	%ymm2, %ymm1, %ymm2
	vpaddw	%ymm11, %ymm6, %ymm1
	vpsubw	%ymm6, %ymm9, %ymm9
	vpaddw	%ymm13, %ymm4, %ymm6
	vpsubw	%ymm4, %ymm10, %ymm4
	vpaddw	%ymm12, %ymm3, %ymm10
	vpsubw	%ymm3, %ymm2, %ymm11
	vpaddw	%ymm7, %ymm5, %ymm13
	vpsubw	%ymm5, %ymm8, %ymm14
	vmovdqu	glob_data + 2616(%rip), %ymm5
	vmovdqu	glob_data + 2648(%rip), %ymm3
	vpslld	$16, %ymm1, %ymm2
	vpblendw	$170, %ymm2, %ymm9, %ymm8
	vpsrld	$16, %ymm9, %ymm7
	vpblendw	$170, %ymm1, %ymm7, %ymm7
	vpslld	$16, %ymm6, %ymm2
	vpblendw	$170, %ymm2, %ymm4, %ymm2
	vpsrld	$16, %ymm4, %ymm1
	vpblendw	$170, %ymm6, %ymm1, %ymm12
	vpslld	$16, %ymm10, %ymm6
	vpblendw	$170, %ymm6, %ymm11, %ymm9
	vpsrld	$16, %ymm11, %ymm1
	vpblendw	$170, %ymm10, %ymm1, %ymm10
	vpslld	$16, %ymm13, %ymm6
	vpblendw	$170, %ymm6, %ymm14, %ymm1
	vpsrld	$16, %ymm14, %ymm14
	vpblendw	$170, %ymm13, %ymm14, %ymm13
	vpmullw	%ymm9, %ymm5, %ymm6
	vpmulhw	%ymm9, %ymm3, %ymm9
	vpmullw	%ymm10, %ymm5, %ymm4
	vpmulhw	%ymm10, %ymm3, %ymm10
	vpmullw	%ymm1, %ymm5, %ymm11
	vpmulhw	%ymm1, %ymm3, %ymm1
	vpmullw	%ymm13, %ymm5, %ymm5
	vpmulhw	%ymm13, %ymm3, %ymm14
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpmulhw	%ymm0, %ymm11, %ymm3
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm10, %ymm7, %ymm13
	vpaddw	%ymm7, %ymm10, %ymm10
	vpsubw	%ymm9, %ymm8, %ymm11
	vpaddw	%ymm8, %ymm9, %ymm9
	vpsubw	%ymm14, %ymm12, %ymm7
	vpaddw	%ymm12, %ymm14, %ymm8
	vpsubw	%ymm1, %ymm2, %ymm12
	vpaddw	%ymm2, %ymm1, %ymm2
	vpaddw	%ymm11, %ymm6, %ymm1
	vpsubw	%ymm6, %ymm9, %ymm9
	vpaddw	%ymm13, %ymm4, %ymm6
	vpsubw	%ymm4, %ymm10, %ymm10
	vpaddw	%ymm12, %ymm3, %ymm4
	vpsubw	%ymm3, %ymm2, %ymm11
	vpaddw	%ymm7, %ymm5, %ymm3
	vpsubw	%ymm5, %ymm8, %ymm13
	vmovdqu	glob_data + 2680(%rip), %ymm5
	vmovdqu	glob_data + 2712(%rip), %ymm14
	vmovdqu	glob_data + 2744(%rip), %ymm12
	vmovdqu	glob_data + 2776(%rip), %ymm2
	vpmullw	%ymm11, %ymm5, %ymm15
	vpmulhw	%ymm11, %ymm14, %ymm7
	vpmullw	%ymm13, %ymm5, %ymm8
	vpmulhw	%ymm13, %ymm14, %ymm14
	vpmullw	%ymm4, %ymm12, %ymm11
	vpmulhw	%ymm4, %ymm2, %ymm5
	vpmullw	%ymm3, %ymm12, %ymm13
	vpmulhw	%ymm3, %ymm2, %ymm12
	vpmulhw	%ymm0, %ymm15, %ymm2
	vpmulhw	%ymm0, %ymm8, %ymm4
	vpmulhw	%ymm0, %ymm11, %ymm3
	vpmulhw	%ymm0, %ymm13, %ymm11
	vpsubw	%ymm14, %ymm10, %ymm13
	vpaddw	%ymm10, %ymm14, %ymm10
	vpsubw	%ymm7, %ymm9, %ymm15
	vpaddw	%ymm9, %ymm7, %ymm8
	vpsubw	%ymm12, %ymm6, %ymm7
	vpaddw	%ymm6, %ymm12, %ymm6
	vpsubw	%ymm5, %ymm1, %ymm9
	vpaddw	%ymm1, %ymm5, %ymm1
	vpaddw	%ymm15, %ymm2, %ymm5
	vpsubw	%ymm2, %ymm8, %ymm2
	vpaddw	%ymm13, %ymm4, %ymm8
	vpsubw	%ymm4, %ymm10, %ymm4
	vpaddw	%ymm9, %ymm3, %ymm9
	vpsubw	%ymm3, %ymm1, %ymm1
	vpaddw	%ymm7, %ymm11, %ymm3
	vpsubw	%ymm11, %ymm6, %ymm6
	vmovdqu	glob_data + 1120(%rip), %ymm7
	vpmulhw	%ymm7, %ymm2, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm2, %ymm2
	vpmulhw	%ymm7, %ymm4, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm4, %ymm11
	vpmulhw	%ymm7, %ymm1, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm1, %ymm10
	vpmulhw	%ymm7, %ymm6, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm6, %ymm1
	vpmulhw	%ymm7, %ymm5, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm5, %ymm6
	vpmulhw	%ymm7, %ymm8, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm8, %ymm8
	vpmulhw	%ymm7, %ymm9, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm9, %ymm13
	vpmulhw	%ymm7, %ymm3, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm3, %ymm3
	vmovdqu	%ymm2, 256(%rsi)
	vmovdqu	%ymm11, 288(%rsi)
	vmovdqu	%ymm6, 320(%rsi)
	vmovdqu	%ymm8, 352(%rsi)
	vmovdqu	%ymm10, 384(%rsi)
	vmovdqu	%ymm1, 416(%rsi)
	vmovdqu	%ymm13, 448(%rsi)
	vmovdqu	%ymm3, 480(%rsi)
	ret
L_poly_invntt$1:
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1216(%rip), %ymm10
	vmovdqu	glob_data + 1280(%rip), %ymm1
	vmovdqu	glob_data + 1248(%rip), %ymm2
	vmovdqu	glob_data + 1312(%rip), %ymm5
	vmovdqu	(%rsi), %ymm9
	vmovdqu	32(%rsi), %ymm14
	vmovdqu	64(%rsi), %ymm3
	vmovdqu	96(%rsi), %ymm4
	vmovdqu	128(%rsi), %ymm6
	vmovdqu	160(%rsi), %ymm12
	vmovdqu	192(%rsi), %ymm13
	vmovdqu	224(%rsi), %ymm11
	vpsubw	%ymm3, %ymm9, %ymm15
	vpsubw	%ymm4, %ymm14, %ymm7
	vpsubw	%ymm13, %ymm6, %ymm8
	vpaddw	%ymm9, %ymm3, %ymm3
	vpaddw	%ymm14, %ymm4, %ymm4
	vpmullw	%ymm15, %ymm10, %ymm9
	vpaddw	%ymm6, %ymm13, %ymm6
	vpmullw	%ymm7, %ymm10, %ymm13
	vpsubw	%ymm11, %ymm12, %ymm10
	vpaddw	%ymm12, %ymm11, %ymm11
	vpmullw	%ymm8, %ymm1, %ymm12
	vpmullw	%ymm10, %ymm1, %ymm1
	vpmulhw	%ymm15, %ymm2, %ymm15
	vpmulhw	%ymm7, %ymm2, %ymm14
	vpmulhw	%ymm8, %ymm5, %ymm8
	vpmulhw	%ymm10, %ymm5, %ymm10
	vpmulhw	%ymm9, %ymm0, %ymm9
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm12, %ymm0, %ymm2
	vpmulhw	%ymm1, %ymm0, %ymm1
	vpsubw	%ymm9, %ymm15, %ymm7
	vpsubw	%ymm13, %ymm14, %ymm5
	vpsubw	%ymm2, %ymm8, %ymm9
	vpsubw	%ymm1, %ymm10, %ymm8
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	glob_data + 1344(%rip), %ymm2
	vmovdqu	glob_data + 1376(%rip), %ymm10
	vpmulhw	%ymm1, %ymm3, %ymm12
	vpsraw	$10, %ymm12, %ymm12
	vpmullw	%ymm0, %ymm12, %ymm12
	vpsubw	%ymm12, %ymm3, %ymm12
	vpmulhw	%ymm1, %ymm4, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm14
	vpmulhw	%ymm1, %ymm6, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm6, %ymm6
	vpmulhw	%ymm1, %ymm11, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm11, %ymm13
	vpsubw	%ymm6, %ymm12, %ymm15
	vpsubw	%ymm13, %ymm14, %ymm3
	vpsubw	%ymm9, %ymm7, %ymm4
	vpaddw	%ymm12, %ymm6, %ymm12
	vpaddw	%ymm14, %ymm13, %ymm6
	vpmullw	%ymm15, %ymm2, %ymm11
	vpaddw	%ymm7, %ymm9, %ymm7
	vpmullw	%ymm3, %ymm2, %ymm13
	vpsubw	%ymm8, %ymm5, %ymm14
	vpaddw	%ymm5, %ymm8, %ymm8
	vpmullw	%ymm4, %ymm2, %ymm9
	vpmullw	%ymm14, %ymm2, %ymm5
	vpmulhw	%ymm15, %ymm10, %ymm2
	vpmulhw	%ymm3, %ymm10, %ymm3
	vpmulhw	%ymm4, %ymm10, %ymm4
	vpmulhw	%ymm14, %ymm10, %ymm14
	vpmulhw	%ymm11, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm9, %ymm0, %ymm9
	vpmulhw	%ymm5, %ymm0, %ymm5
	vpsubw	%ymm11, %ymm2, %ymm2
	vpsubw	%ymm13, %ymm3, %ymm3
	vpsubw	%ymm9, %ymm4, %ymm4
	vpsubw	%ymm5, %ymm14, %ymm5
	vpslld	$16, %ymm6, %ymm11
	vpblendw	$170, %ymm11, %ymm12, %ymm9
	vpsrld	$16, %ymm12, %ymm14
	vpblendw	$170, %ymm6, %ymm14, %ymm11
	vpslld	$16, %ymm8, %ymm6
	vpblendw	$170, %ymm6, %ymm7, %ymm10
	vpsrld	$16, %ymm7, %ymm7
	vpblendw	$170, %ymm8, %ymm7, %ymm14
	vpslld	$16, %ymm3, %ymm6
	vpblendw	$170, %ymm6, %ymm2, %ymm12
	vpsrld	$16, %ymm2, %ymm7
	vpblendw	$170, %ymm3, %ymm7, %ymm13
	vpslld	$16, %ymm5, %ymm2
	vpblendw	$170, %ymm2, %ymm4, %ymm3
	vpsrld	$16, %ymm4, %ymm7
	vpblendw	$170, %ymm5, %ymm7, %ymm5
	vmovdqu	glob_data + 1408(%rip), %ymm2
	vmovdqu	glob_data + 1440(%rip), %ymm4
	vpsubw	%ymm11, %ymm9, %ymm15
	vpsubw	%ymm14, %ymm10, %ymm7
	vpsubw	%ymm13, %ymm12, %ymm8
	vpaddw	%ymm9, %ymm11, %ymm9
	vpaddw	%ymm10, %ymm14, %ymm10
	vpmullw	%ymm15, %ymm2, %ymm11
	vpaddw	%ymm12, %ymm13, %ymm12
	vpmullw	%ymm7, %ymm2, %ymm13
	vpsubw	%ymm5, %ymm3, %ymm14
	vpaddw	%ymm3, %ymm5, %ymm6
	vpmullw	%ymm8, %ymm2, %ymm3
	vpmullw	%ymm14, %ymm2, %ymm5
	vpmulhw	%ymm15, %ymm4, %ymm2
	vpmulhw	%ymm7, %ymm4, %ymm7
	vpmulhw	%ymm8, %ymm4, %ymm8
	vpmulhw	%ymm14, %ymm4, %ymm14
	vpmulhw	%ymm11, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm3, %ymm0, %ymm4
	vpmulhw	%ymm5, %ymm0, %ymm5
	vpsubw	%ymm11, %ymm2, %ymm2
	vpsubw	%ymm13, %ymm7, %ymm3
	vpsubw	%ymm4, %ymm8, %ymm4
	vpsubw	%ymm5, %ymm14, %ymm5
	vpmulhw	%ymm1, %ymm9, %ymm8
	vpsraw	$10, %ymm8, %ymm8
	vpmullw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm8, %ymm9, %ymm7
	vmovsldup	%ymm10, %ymm11
	vpblendd	$170, %ymm11, %ymm7, %ymm9
	vpsrlq	$32, %ymm7, %ymm7
	vpblendd	$170, %ymm10, %ymm7, %ymm11
	vmovsldup	%ymm6, %ymm15
	vpblendd	$170, %ymm15, %ymm12, %ymm10
	vpsrlq	$32, %ymm12, %ymm7
	vpblendd	$170, %ymm6, %ymm7, %ymm14
	vmovsldup	%ymm3, %ymm6
	vpblendd	$170, %ymm6, %ymm2, %ymm12
	vpsrlq	$32, %ymm2, %ymm2
	vpblendd	$170, %ymm3, %ymm2, %ymm13
	vmovsldup	%ymm5, %ymm2
	vpblendd	$170, %ymm2, %ymm4, %ymm2
	vpsrlq	$32, %ymm4, %ymm3
	vpblendd	$170, %ymm5, %ymm3, %ymm3
	vmovdqu	glob_data + 1472(%rip), %ymm4
	vmovdqu	glob_data + 1504(%rip), %ymm5
	vpsubw	%ymm11, %ymm9, %ymm6
	vpsubw	%ymm14, %ymm10, %ymm7
	vpsubw	%ymm13, %ymm12, %ymm8
	vpaddw	%ymm9, %ymm11, %ymm9
	vpaddw	%ymm10, %ymm14, %ymm10
	vpmullw	%ymm6, %ymm4, %ymm11
	vpaddw	%ymm12, %ymm13, %ymm12
	vpmullw	%ymm7, %ymm4, %ymm13
	vpsubw	%ymm3, %ymm2, %ymm14
	vpaddw	%ymm2, %ymm3, %ymm2
	vpmullw	%ymm8, %ymm4, %ymm3
	vpmullw	%ymm14, %ymm4, %ymm4
	vpmulhw	%ymm6, %ymm5, %ymm6
	vpmulhw	%ymm7, %ymm5, %ymm7
	vpmulhw	%ymm8, %ymm5, %ymm8
	vpmulhw	%ymm14, %ymm5, %ymm14
	vpmulhw	%ymm11, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm3, %ymm0, %ymm3
	vpmulhw	%ymm4, %ymm0, %ymm4
	vpsubw	%ymm11, %ymm6, %ymm5
	vpsubw	%ymm13, %ymm7, %ymm6
	vpsubw	%ymm3, %ymm8, %ymm3
	vpsubw	%ymm4, %ymm14, %ymm7
	vpmulhw	%ymm1, %ymm9, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm9, %ymm4
	vpunpcklqdq	%ymm10, %ymm4, %ymm9
	vpunpckhqdq	%ymm10, %ymm4, %ymm11
	vpunpcklqdq	%ymm2, %ymm12, %ymm10
	vpunpckhqdq	%ymm2, %ymm12, %ymm13
	vpunpcklqdq	%ymm6, %ymm5, %ymm12
	vpunpckhqdq	%ymm6, %ymm5, %ymm4
	vpunpcklqdq	%ymm7, %ymm3, %ymm2
	vpunpckhqdq	%ymm7, %ymm3, %ymm3
	vmovdqu	glob_data + 1536(%rip), %ymm5
	vmovdqu	glob_data + 1568(%rip), %ymm6
	vpsubw	%ymm11, %ymm9, %ymm15
	vpsubw	%ymm13, %ymm10, %ymm7
	vpsubw	%ymm4, %ymm12, %ymm8
	vpaddw	%ymm9, %ymm11, %ymm9
	vpaddw	%ymm10, %ymm13, %ymm10
	vpmullw	%ymm15, %ymm5, %ymm11
	vpaddw	%ymm12, %ymm4, %ymm4
	vpmullw	%ymm7, %ymm5, %ymm13
	vpsubw	%ymm3, %ymm2, %ymm14
	vpaddw	%ymm2, %ymm3, %ymm2
	vpmullw	%ymm8, %ymm5, %ymm3
	vpmullw	%ymm14, %ymm5, %ymm5
	vpmulhw	%ymm15, %ymm6, %ymm15
	vpmulhw	%ymm7, %ymm6, %ymm7
	vpmulhw	%ymm8, %ymm6, %ymm8
	vpmulhw	%ymm14, %ymm6, %ymm14
	vpmulhw	%ymm11, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm3, %ymm0, %ymm3
	vpmulhw	%ymm5, %ymm0, %ymm5
	vpsubw	%ymm11, %ymm15, %ymm12
	vpsubw	%ymm13, %ymm7, %ymm6
	vpsubw	%ymm3, %ymm8, %ymm3
	vpsubw	%ymm5, %ymm14, %ymm5
	vpmulhw	%ymm1, %ymm9, %ymm8
	vpsraw	$10, %ymm8, %ymm8
	vpmullw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm8, %ymm9, %ymm7
	vperm2i128	$32, %ymm10, %ymm7, %ymm9
	vperm2i128	$49, %ymm10, %ymm7, %ymm11
	vperm2i128	$32, %ymm2, %ymm4, %ymm10
	vperm2i128	$49, %ymm2, %ymm4, %ymm13
	vperm2i128	$32, %ymm6, %ymm12, %ymm2
	vperm2i128	$49, %ymm6, %ymm12, %ymm4
	vperm2i128	$32, %ymm5, %ymm3, %ymm6
	vperm2i128	$49, %ymm5, %ymm3, %ymm3
	vpbroadcastd	glob_data + 1600(%rip), %ymm5
	vpbroadcastd	glob_data + 1604(%rip), %ymm7
	vpsubw	%ymm11, %ymm9, %ymm15
	vpsubw	%ymm13, %ymm10, %ymm8
	vpsubw	%ymm4, %ymm2, %ymm12
	vpaddw	%ymm9, %ymm11, %ymm9
	vpaddw	%ymm10, %ymm13, %ymm10
	vpmullw	%ymm15, %ymm5, %ymm11
	vpaddw	%ymm2, %ymm4, %ymm2
	vpmullw	%ymm8, %ymm5, %ymm13
	vpsubw	%ymm3, %ymm6, %ymm14
	vpaddw	%ymm6, %ymm3, %ymm3
	vpmullw	%ymm12, %ymm5, %ymm4
	vpmullw	%ymm14, %ymm5, %ymm5
	vpmulhw	%ymm15, %ymm7, %ymm6
	vpmulhw	%ymm8, %ymm7, %ymm8
	vpmulhw	%ymm12, %ymm7, %ymm12
	vpmulhw	%ymm14, %ymm7, %ymm14
	vpmulhw	%ymm11, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm4, %ymm0, %ymm4
	vpmulhw	%ymm5, %ymm0, %ymm5
	vpsubw	%ymm11, %ymm6, %ymm6
	vpsubw	%ymm13, %ymm8, %ymm7
	vpsubw	%ymm4, %ymm12, %ymm8
	vpsubw	%ymm5, %ymm14, %ymm4
	vpmulhw	%ymm1, %ymm9, %ymm5
	vpsraw	$10, %ymm5, %ymm5
	vpmullw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm9, %ymm1
	vmovdqu	%ymm1, (%rsi)
	vmovdqu	%ymm10, 32(%rsi)
	vmovdqu	%ymm2, 64(%rsi)
	vmovdqu	%ymm3, 96(%rsi)
	vmovdqu	%ymm6, 128(%rsi)
	vmovdqu	%ymm7, 160(%rsi)
	vmovdqu	%ymm8, 192(%rsi)
	vmovdqu	%ymm4, 224(%rsi)
	vmovdqu	glob_data + 1608(%rip), %ymm10
	vmovdqu	glob_data + 1672(%rip), %ymm1
	vmovdqu	glob_data + 1640(%rip), %ymm2
	vmovdqu	glob_data + 1704(%rip), %ymm5
	vmovdqu	256(%rsi), %ymm9
	vmovdqu	288(%rsi), %ymm14
	vmovdqu	320(%rsi), %ymm3
	vmovdqu	352(%rsi), %ymm4
	vmovdqu	384(%rsi), %ymm6
	vmovdqu	416(%rsi), %ymm12
	vmovdqu	448(%rsi), %ymm13
	vmovdqu	480(%rsi), %ymm11
	vpsubw	%ymm3, %ymm9, %ymm15
	vpsubw	%ymm4, %ymm14, %ymm7
	vpsubw	%ymm13, %ymm6, %ymm8
	vpaddw	%ymm9, %ymm3, %ymm3
	vpaddw	%ymm14, %ymm4, %ymm4
	vpmullw	%ymm15, %ymm10, %ymm9
	vpaddw	%ymm6, %ymm13, %ymm6
	vpmullw	%ymm7, %ymm10, %ymm13
	vpsubw	%ymm11, %ymm12, %ymm10
	vpaddw	%ymm12, %ymm11, %ymm11
	vpmullw	%ymm8, %ymm1, %ymm12
	vpmullw	%ymm10, %ymm1, %ymm1
	vpmulhw	%ymm15, %ymm2, %ymm15
	vpmulhw	%ymm7, %ymm2, %ymm7
	vpmulhw	%ymm8, %ymm5, %ymm2
	vpmulhw	%ymm10, %ymm5, %ymm10
	vpmulhw	%ymm9, %ymm0, %ymm8
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm12, %ymm0, %ymm9
	vpmulhw	%ymm1, %ymm0, %ymm1
	vpsubw	%ymm8, %ymm15, %ymm12
	vpsubw	%ymm13, %ymm7, %ymm8
	vpsubw	%ymm9, %ymm2, %ymm9
	vpsubw	%ymm1, %ymm10, %ymm7
	vmovdqu	glob_data + 1120(%rip), %ymm1
	vmovdqu	glob_data + 1736(%rip), %ymm2
	vmovdqu	glob_data + 1768(%rip), %ymm10
	vpmulhw	%ymm1, %ymm3, %ymm5
	vpsraw	$10, %ymm5, %ymm5
	vpmullw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm3, %ymm13
	vpmulhw	%ymm1, %ymm4, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm14
	vpmulhw	%ymm1, %ymm6, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm6, %ymm6
	vpmulhw	%ymm1, %ymm11, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm11, %ymm11
	vpsubw	%ymm6, %ymm13, %ymm15
	vpsubw	%ymm11, %ymm14, %ymm3
	vpsubw	%ymm9, %ymm12, %ymm5
	vpaddw	%ymm13, %ymm6, %ymm4
	vpaddw	%ymm14, %ymm11, %ymm6
	vpmullw	%ymm15, %ymm2, %ymm11
	vpaddw	%ymm12, %ymm9, %ymm12
	vpmullw	%ymm3, %ymm2, %ymm13
	vpsubw	%ymm7, %ymm8, %ymm14
	vpaddw	%ymm8, %ymm7, %ymm8
	vpmullw	%ymm5, %ymm2, %ymm9
	vpmullw	%ymm14, %ymm2, %ymm7
	vpmulhw	%ymm15, %ymm10, %ymm2
	vpmulhw	%ymm3, %ymm10, %ymm3
	vpmulhw	%ymm5, %ymm10, %ymm5
	vpmulhw	%ymm14, %ymm10, %ymm14
	vpmulhw	%ymm11, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm9, %ymm0, %ymm9
	vpmulhw	%ymm7, %ymm0, %ymm7
	vpsubw	%ymm11, %ymm2, %ymm2
	vpsubw	%ymm13, %ymm3, %ymm3
	vpsubw	%ymm9, %ymm5, %ymm5
	vpsubw	%ymm7, %ymm14, %ymm7
	vpslld	$16, %ymm6, %ymm11
	vpblendw	$170, %ymm11, %ymm4, %ymm9
	vpsrld	$16, %ymm4, %ymm14
	vpblendw	$170, %ymm6, %ymm14, %ymm11
	vpslld	$16, %ymm8, %ymm6
	vpblendw	$170, %ymm6, %ymm12, %ymm6
	vpsrld	$16, %ymm12, %ymm14
	vpblendw	$170, %ymm8, %ymm14, %ymm14
	vpslld	$16, %ymm3, %ymm15
	vpblendw	$170, %ymm15, %ymm2, %ymm12
	vpsrld	$16, %ymm2, %ymm8
	vpblendw	$170, %ymm3, %ymm8, %ymm13
	vpslld	$16, %ymm7, %ymm2
	vpblendw	$170, %ymm2, %ymm5, %ymm4
	vpsrld	$16, %ymm5, %ymm3
	vpblendw	$170, %ymm7, %ymm3, %ymm5
	vmovdqu	glob_data + 1800(%rip), %ymm2
	vmovdqu	glob_data + 1832(%rip), %ymm10
	vpsubw	%ymm11, %ymm9, %ymm15
	vpsubw	%ymm14, %ymm6, %ymm3
	vpsubw	%ymm13, %ymm12, %ymm8
	vpaddw	%ymm9, %ymm11, %ymm9
	vpaddw	%ymm6, %ymm14, %ymm6
	vpmullw	%ymm15, %ymm2, %ymm11
	vpaddw	%ymm12, %ymm13, %ymm12
	vpmullw	%ymm3, %ymm2, %ymm13
	vpsubw	%ymm5, %ymm4, %ymm14
	vpaddw	%ymm4, %ymm5, %ymm7
	vpmullw	%ymm8, %ymm2, %ymm4
	vpmullw	%ymm14, %ymm2, %ymm5
	vpmulhw	%ymm15, %ymm10, %ymm2
	vpmulhw	%ymm3, %ymm10, %ymm3
	vpmulhw	%ymm8, %ymm10, %ymm8
	vpmulhw	%ymm14, %ymm10, %ymm14
	vpmulhw	%ymm11, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm4, %ymm0, %ymm4
	vpmulhw	%ymm5, %ymm0, %ymm5
	vpsubw	%ymm11, %ymm2, %ymm2
	vpsubw	%ymm13, %ymm3, %ymm3
	vpsubw	%ymm4, %ymm8, %ymm4
	vpsubw	%ymm5, %ymm14, %ymm5
	vpmulhw	%ymm1, %ymm9, %ymm8
	vpsraw	$10, %ymm8, %ymm8
	vpmullw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm8, %ymm9, %ymm10
	vmovsldup	%ymm6, %ymm11
	vpblendd	$170, %ymm11, %ymm10, %ymm9
	vpsrlq	$32, %ymm10, %ymm10
	vpblendd	$170, %ymm6, %ymm10, %ymm11
	vmovsldup	%ymm7, %ymm6
	vpblendd	$170, %ymm6, %ymm12, %ymm10
	vpsrlq	$32, %ymm12, %ymm12
	vpblendd	$170, %ymm7, %ymm12, %ymm14
	vmovsldup	%ymm3, %ymm6
	vpblendd	$170, %ymm6, %ymm2, %ymm12
	vpsrlq	$32, %ymm2, %ymm2
	vpblendd	$170, %ymm3, %ymm2, %ymm13
	vmovsldup	%ymm5, %ymm2
	vpblendd	$170, %ymm2, %ymm4, %ymm2
	vpsrlq	$32, %ymm4, %ymm3
	vpblendd	$170, %ymm5, %ymm3, %ymm3
	vmovdqu	glob_data + 1864(%rip), %ymm4
	vmovdqu	glob_data + 1896(%rip), %ymm5
	vpsubw	%ymm11, %ymm9, %ymm6
	vpsubw	%ymm14, %ymm10, %ymm7
	vpsubw	%ymm13, %ymm12, %ymm8
	vpaddw	%ymm9, %ymm11, %ymm9
	vpaddw	%ymm10, %ymm14, %ymm10
	vpmullw	%ymm6, %ymm4, %ymm11
	vpaddw	%ymm12, %ymm13, %ymm12
	vpmullw	%ymm7, %ymm4, %ymm13
	vpsubw	%ymm3, %ymm2, %ymm14
	vpaddw	%ymm2, %ymm3, %ymm2
	vpmullw	%ymm8, %ymm4, %ymm3
	vpmullw	%ymm14, %ymm4, %ymm4
	vpmulhw	%ymm6, %ymm5, %ymm6
	vpmulhw	%ymm7, %ymm5, %ymm7
	vpmulhw	%ymm8, %ymm5, %ymm8
	vpmulhw	%ymm14, %ymm5, %ymm14
	vpmulhw	%ymm11, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm3, %ymm0, %ymm3
	vpmulhw	%ymm4, %ymm0, %ymm4
	vpsubw	%ymm11, %ymm6, %ymm5
	vpsubw	%ymm13, %ymm7, %ymm6
	vpsubw	%ymm3, %ymm8, %ymm3
	vpsubw	%ymm4, %ymm14, %ymm7
	vpmulhw	%ymm1, %ymm9, %ymm4
	vpsraw	$10, %ymm4, %ymm4
	vpmullw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm9, %ymm4
	vpunpcklqdq	%ymm10, %ymm4, %ymm9
	vpunpckhqdq	%ymm10, %ymm4, %ymm11
	vpunpcklqdq	%ymm2, %ymm12, %ymm10
	vpunpckhqdq	%ymm2, %ymm12, %ymm13
	vpunpcklqdq	%ymm6, %ymm5, %ymm12
	vpunpckhqdq	%ymm6, %ymm5, %ymm4
	vpunpcklqdq	%ymm7, %ymm3, %ymm2
	vpunpckhqdq	%ymm7, %ymm3, %ymm3
	vmovdqu	glob_data + 1928(%rip), %ymm5
	vmovdqu	glob_data + 1960(%rip), %ymm6
	vpsubw	%ymm11, %ymm9, %ymm15
	vpsubw	%ymm13, %ymm10, %ymm7
	vpsubw	%ymm4, %ymm12, %ymm8
	vpaddw	%ymm9, %ymm11, %ymm9
	vpaddw	%ymm10, %ymm13, %ymm10
	vpmullw	%ymm15, %ymm5, %ymm11
	vpaddw	%ymm12, %ymm4, %ymm4
	vpmullw	%ymm7, %ymm5, %ymm13
	vpsubw	%ymm3, %ymm2, %ymm14
	vpaddw	%ymm2, %ymm3, %ymm2
	vpmullw	%ymm8, %ymm5, %ymm3
	vpmullw	%ymm14, %ymm5, %ymm5
	vpmulhw	%ymm15, %ymm6, %ymm15
	vpmulhw	%ymm7, %ymm6, %ymm7
	vpmulhw	%ymm8, %ymm6, %ymm8
	vpmulhw	%ymm14, %ymm6, %ymm14
	vpmulhw	%ymm11, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm3, %ymm0, %ymm3
	vpmulhw	%ymm5, %ymm0, %ymm5
	vpsubw	%ymm11, %ymm15, %ymm12
	vpsubw	%ymm13, %ymm7, %ymm6
	vpsubw	%ymm3, %ymm8, %ymm3
	vpsubw	%ymm5, %ymm14, %ymm5
	vpmulhw	%ymm1, %ymm9, %ymm8
	vpsraw	$10, %ymm8, %ymm8
	vpmullw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm8, %ymm9, %ymm7
	vperm2i128	$32, %ymm10, %ymm7, %ymm9
	vperm2i128	$49, %ymm10, %ymm7, %ymm11
	vperm2i128	$32, %ymm2, %ymm4, %ymm10
	vperm2i128	$49, %ymm2, %ymm4, %ymm13
	vperm2i128	$32, %ymm6, %ymm12, %ymm2
	vperm2i128	$49, %ymm6, %ymm12, %ymm4
	vperm2i128	$32, %ymm5, %ymm3, %ymm6
	vperm2i128	$49, %ymm5, %ymm3, %ymm3
	vpbroadcastd	glob_data + 1992(%rip), %ymm5
	vpbroadcastd	glob_data + 1996(%rip), %ymm7
	vpsubw	%ymm11, %ymm9, %ymm15
	vpsubw	%ymm13, %ymm10, %ymm8
	vpsubw	%ymm4, %ymm2, %ymm12
	vpaddw	%ymm9, %ymm11, %ymm9
	vpaddw	%ymm10, %ymm13, %ymm10
	vpmullw	%ymm15, %ymm5, %ymm11
	vpaddw	%ymm2, %ymm4, %ymm2
	vpmullw	%ymm8, %ymm5, %ymm13
	vpsubw	%ymm3, %ymm6, %ymm14
	vpaddw	%ymm6, %ymm3, %ymm3
	vpmullw	%ymm12, %ymm5, %ymm4
	vpmullw	%ymm14, %ymm5, %ymm5
	vpmulhw	%ymm15, %ymm7, %ymm6
	vpmulhw	%ymm8, %ymm7, %ymm8
	vpmulhw	%ymm12, %ymm7, %ymm12
	vpmulhw	%ymm14, %ymm7, %ymm14
	vpmulhw	%ymm11, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm4, %ymm0, %ymm4
	vpmulhw	%ymm5, %ymm0, %ymm5
	vpsubw	%ymm11, %ymm6, %ymm6
	vpsubw	%ymm13, %ymm8, %ymm7
	vpsubw	%ymm4, %ymm12, %ymm8
	vpsubw	%ymm5, %ymm14, %ymm4
	vpmulhw	%ymm1, %ymm9, %ymm5
	vpsraw	$10, %ymm5, %ymm5
	vpmullw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm9, %ymm1
	vmovdqu	%ymm6, 384(%rsi)
	vmovdqu	%ymm7, 416(%rsi)
	vmovdqu	%ymm8, 448(%rsi)
	vmovdqu	%ymm4, 480(%rsi)
	vpbroadcastd	glob_data + 2000(%rip), %ymm4
	vpbroadcastd	glob_data + 2004(%rip), %ymm5
	vmovdqu	%ymm3, %ymm7
	vmovdqu	%ymm2, %ymm3
	vmovdqu	(%rsi), %ymm13
	vmovdqu	32(%rsi), %ymm14
	vmovdqu	64(%rsi), %ymm6
	vmovdqu	96(%rsi), %ymm9
	vpsubw	%ymm1, %ymm13, %ymm15
	vpsubw	%ymm10, %ymm14, %ymm8
	vpsubw	%ymm3, %ymm6, %ymm12
	vpaddw	%ymm13, %ymm1, %ymm1
	vpaddw	%ymm14, %ymm10, %ymm2
	vpmullw	%ymm15, %ymm4, %ymm11
	vpaddw	%ymm6, %ymm3, %ymm3
	vpmullw	%ymm8, %ymm4, %ymm13
	vpsubw	%ymm7, %ymm9, %ymm10
	vpaddw	%ymm9, %ymm7, %ymm6
	vpmullw	%ymm12, %ymm4, %ymm9
	vpmullw	%ymm10, %ymm4, %ymm7
	vpmulhw	%ymm15, %ymm5, %ymm15
	vpmulhw	%ymm8, %ymm5, %ymm8
	vpmulhw	%ymm12, %ymm5, %ymm12
	vpmulhw	%ymm10, %ymm5, %ymm10
	vpmulhw	%ymm11, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm9, %ymm0, %ymm9
	vpmulhw	%ymm7, %ymm0, %ymm7
	vpsubw	%ymm11, %ymm15, %ymm11
	vpsubw	%ymm13, %ymm8, %ymm8
	vpsubw	%ymm9, %ymm12, %ymm12
	vpsubw	%ymm7, %ymm10, %ymm10
	vmovdqu	glob_data + 1056(%rip), %ymm7
	vmovdqu	glob_data + 1088(%rip), %ymm9
	vmovdqu	%ymm11, 256(%rsi)
	vmovdqu	%ymm8, 288(%rsi)
	vmovdqu	%ymm12, 320(%rsi)
	vmovdqu	%ymm10, 352(%rsi)
	vpmullw	%ymm1, %ymm7, %ymm8
	vpmulhw	%ymm1, %ymm9, %ymm1
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm8, %ymm1, %ymm8
	vpmullw	%ymm2, %ymm7, %ymm10
	vpmulhw	%ymm2, %ymm9, %ymm1
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm1, %ymm1
	vpmullw	%ymm3, %ymm7, %ymm10
	vpmulhw	%ymm3, %ymm9, %ymm2
	vpmulhw	%ymm0, %ymm10, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm10
	vpmullw	%ymm6, %ymm7, %ymm3
	vpmulhw	%ymm6, %ymm9, %ymm2
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm7
	vmovdqu	%ymm8, (%rsi)
	vmovdqu	%ymm1, 32(%rsi)
	vmovdqu	%ymm10, 64(%rsi)
	vmovdqu	%ymm7, 96(%rsi)
	vmovdqu	384(%rsi), %ymm1
	vmovdqu	416(%rsi), %ymm10
	vmovdqu	448(%rsi), %ymm3
	vmovdqu	480(%rsi), %ymm11
	vmovdqu	128(%rsi), %ymm9
	vmovdqu	160(%rsi), %ymm14
	vmovdqu	192(%rsi), %ymm6
	vmovdqu	224(%rsi), %ymm12
	vpsubw	%ymm1, %ymm9, %ymm15
	vpsubw	%ymm10, %ymm14, %ymm7
	vpsubw	%ymm3, %ymm6, %ymm8
	vpaddw	%ymm9, %ymm1, %ymm1
	vpaddw	%ymm14, %ymm10, %ymm2
	vpmullw	%ymm15, %ymm4, %ymm9
	vpaddw	%ymm6, %ymm3, %ymm3
	vpmullw	%ymm7, %ymm4, %ymm13
	vpsubw	%ymm11, %ymm12, %ymm10
	vpaddw	%ymm12, %ymm11, %ymm6
	vpmullw	%ymm8, %ymm4, %ymm12
	vpmullw	%ymm10, %ymm4, %ymm4
	vpmulhw	%ymm15, %ymm5, %ymm15
	vpmulhw	%ymm7, %ymm5, %ymm7
	vpmulhw	%ymm8, %ymm5, %ymm8
	vpmulhw	%ymm10, %ymm5, %ymm10
	vpmulhw	%ymm9, %ymm0, %ymm9
	vpmulhw	%ymm13, %ymm0, %ymm11
	vpmulhw	%ymm12, %ymm0, %ymm12
	vpmulhw	%ymm4, %ymm0, %ymm4
	vpsubw	%ymm9, %ymm15, %ymm5
	vpsubw	%ymm11, %ymm7, %ymm11
	vpsubw	%ymm12, %ymm8, %ymm12
	vpsubw	%ymm4, %ymm10, %ymm4
	vmovdqu	glob_data + 1056(%rip), %ymm7
	vmovdqu	glob_data + 1088(%rip), %ymm9
	vmovdqu	%ymm5, 384(%rsi)
	vmovdqu	%ymm11, 416(%rsi)
	vmovdqu	%ymm12, 448(%rsi)
	vmovdqu	%ymm4, 480(%rsi)
	vpmullw	%ymm1, %ymm7, %ymm4
	vpmulhw	%ymm1, %ymm9, %ymm1
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm1, %ymm8
	vpmullw	%ymm2, %ymm7, %ymm4
	vpmulhw	%ymm2, %ymm9, %ymm1
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm1, %ymm1
	vpmullw	%ymm3, %ymm7, %ymm4
	vpmulhw	%ymm3, %ymm9, %ymm2
	vpmulhw	%ymm0, %ymm4, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm10
	vpmullw	%ymm6, %ymm7, %ymm3
	vpmulhw	%ymm6, %ymm9, %ymm2
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm7
	vmovdqu	%ymm8, 128(%rsi)
	vmovdqu	%ymm1, 160(%rsi)
	vmovdqu	%ymm10, 192(%rsi)
	vmovdqu	%ymm7, 224(%rsi)
	ret
L_poly_getnoise_eta1_4x$1:
	leaq	32(%rsp), %rsi
	leaq	160(%rsp), %r10
	leaq	288(%rsp), %r11
	leaq	416(%rsp), %rbx
	movq	%rax, 552(%rsp)
	movq	%rcx, 560(%rsp)
	movq	%rdx, 568(%rsp)
	movq	%r8, 576(%rsp)
	movb	%r9b, 544(%rsp)
	incb	%r9b
	movb	%r9b, 545(%rsp)
	incb	%r9b
	movb	%r9b, 546(%rsp)
	incb	%r9b
	movb	%r9b, 547(%rsp)
	leaq	544(%rsp), %rdx
	leaq	-824(%rsp), %rsp
	call	L_shake256x4_A128__A32_A1$1
L_poly_getnoise_eta1_4x$2:
	leaq	824(%rsp), %rsp
	lfence
	movq	$0, %rax
	movq	552(%rsp), %rax
	movq	560(%rsp), %r8
	movq	568(%rsp), %rdx
	movq	576(%rsp), %rcx
	movl	$1431655765, 544(%rsp)
	movl	$858993459, 584(%rsp)
	movl	$50529027, 588(%rsp)
	movl	$252645135, 592(%rsp)
	vpbroadcastd	544(%rsp), %ymm0
	vpbroadcastd	584(%rsp), %ymm1
	vpbroadcastd	588(%rsp), %ymm2
	vpbroadcastd	592(%rsp), %ymm3
	vmovdqu	(%rsi), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, (%rax)
	vmovdqu	%ymm11, 32(%rax)
	vmovdqu	%ymm10, 64(%rax)
	vmovdqu	%ymm4, 96(%rax)
	vmovdqu	32(%rsi), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, 128(%rax)
	vmovdqu	%ymm11, 160(%rax)
	vmovdqu	%ymm10, 192(%rax)
	vmovdqu	%ymm4, 224(%rax)
	vmovdqu	64(%rsi), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, 256(%rax)
	vmovdqu	%ymm11, 288(%rax)
	vmovdqu	%ymm10, 320(%rax)
	vmovdqu	%ymm4, 352(%rax)
	vmovdqu	96(%rsi), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm3
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm3, %ymm11
	vpunpckhbw	%ymm4, %ymm3, %ymm4
	vmovdqu	%xmm11, %xmm2
	vpmovsxbw	%xmm2, %ymm3
	vextracti128	$1, %ymm11, %xmm2
	vpmovsxbw	%xmm2, %ymm10
	vmovdqu	%xmm4, %xmm2
	vpmovsxbw	%xmm2, %ymm11
	vextracti128	$1, %ymm4, %xmm2
	vpmovsxbw	%xmm2, %ymm4
	vmovdqu	%ymm3, 384(%rax)
	vmovdqu	%ymm11, 416(%rax)
	vmovdqu	%ymm10, 448(%rax)
	vmovdqu	%ymm4, 480(%rax)
	movl	$1431655765, 592(%rsp)
	movl	$858993459, 588(%rsp)
	movl	$50529027, 584(%rsp)
	movl	$252645135, 544(%rsp)
	vpbroadcastd	592(%rsp), %ymm0
	vpbroadcastd	588(%rsp), %ymm1
	vpbroadcastd	584(%rsp), %ymm2
	vpbroadcastd	544(%rsp), %ymm3
	vmovdqu	(%r10), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, (%r8)
	vmovdqu	%ymm11, 32(%r8)
	vmovdqu	%ymm10, 64(%r8)
	vmovdqu	%ymm4, 96(%r8)
	vmovdqu	32(%r10), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, 128(%r8)
	vmovdqu	%ymm11, 160(%r8)
	vmovdqu	%ymm10, 192(%r8)
	vmovdqu	%ymm4, 224(%r8)
	vmovdqu	64(%r10), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, 256(%r8)
	vmovdqu	%ymm11, 288(%r8)
	vmovdqu	%ymm10, 320(%r8)
	vmovdqu	%ymm4, 352(%r8)
	vmovdqu	96(%r10), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm3
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm3, %ymm11
	vpunpckhbw	%ymm4, %ymm3, %ymm4
	vmovdqu	%xmm11, %xmm2
	vpmovsxbw	%xmm2, %ymm3
	vextracti128	$1, %ymm11, %xmm2
	vpmovsxbw	%xmm2, %ymm10
	vmovdqu	%xmm4, %xmm2
	vpmovsxbw	%xmm2, %ymm11
	vextracti128	$1, %ymm4, %xmm2
	vpmovsxbw	%xmm2, %ymm4
	vmovdqu	%ymm3, 384(%r8)
	vmovdqu	%ymm11, 416(%r8)
	vmovdqu	%ymm10, 448(%r8)
	vmovdqu	%ymm4, 480(%r8)
	movl	$1431655765, 544(%rsp)
	movl	$858993459, 584(%rsp)
	movl	$50529027, 588(%rsp)
	movl	$252645135, 592(%rsp)
	vpbroadcastd	544(%rsp), %ymm0
	vpbroadcastd	584(%rsp), %ymm1
	vpbroadcastd	588(%rsp), %ymm2
	vpbroadcastd	592(%rsp), %ymm3
	vmovdqu	(%r11), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, (%rdx)
	vmovdqu	%ymm11, 32(%rdx)
	vmovdqu	%ymm10, 64(%rdx)
	vmovdqu	%ymm4, 96(%rdx)
	vmovdqu	32(%r11), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, 128(%rdx)
	vmovdqu	%ymm11, 160(%rdx)
	vmovdqu	%ymm10, 192(%rdx)
	vmovdqu	%ymm4, 224(%rdx)
	vmovdqu	64(%r11), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, 256(%rdx)
	vmovdqu	%ymm11, 288(%rdx)
	vmovdqu	%ymm10, 320(%rdx)
	vmovdqu	%ymm4, 352(%rdx)
	vmovdqu	96(%r11), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm3
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm3, %ymm11
	vpunpckhbw	%ymm4, %ymm3, %ymm4
	vmovdqu	%xmm11, %xmm2
	vpmovsxbw	%xmm2, %ymm3
	vextracti128	$1, %ymm11, %xmm2
	vpmovsxbw	%xmm2, %ymm10
	vmovdqu	%xmm4, %xmm2
	vpmovsxbw	%xmm2, %ymm11
	vextracti128	$1, %ymm4, %xmm2
	vpmovsxbw	%xmm2, %ymm4
	vmovdqu	%ymm3, 384(%rdx)
	vmovdqu	%ymm11, 416(%rdx)
	vmovdqu	%ymm10, 448(%rdx)
	vmovdqu	%ymm4, 480(%rdx)
	movl	$1431655765, 592(%rsp)
	movl	$858993459, 588(%rsp)
	movl	$50529027, 584(%rsp)
	movl	$252645135, 544(%rsp)
	vpbroadcastd	592(%rsp), %ymm0
	vpbroadcastd	588(%rsp), %ymm1
	vpbroadcastd	584(%rsp), %ymm2
	vpbroadcastd	544(%rsp), %ymm3
	vmovdqu	(%rbx), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, (%rcx)
	vmovdqu	%ymm11, 32(%rcx)
	vmovdqu	%ymm10, 64(%rcx)
	vmovdqu	%ymm4, 96(%rcx)
	vmovdqu	32(%rbx), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, 128(%rcx)
	vmovdqu	%ymm11, 160(%rcx)
	vmovdqu	%ymm10, 192(%rcx)
	vmovdqu	%ymm4, 224(%rcx)
	vmovdqu	64(%rbx), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, 256(%rcx)
	vmovdqu	%ymm11, 288(%rcx)
	vmovdqu	%ymm10, 320(%rcx)
	vmovdqu	%ymm4, 352(%rcx)
	vmovdqu	96(%rbx), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm3
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm3, %ymm11
	vpunpckhbw	%ymm4, %ymm3, %ymm4
	vmovdqu	%xmm11, %xmm2
	vpmovsxbw	%xmm2, %ymm3
	vextracti128	$1, %ymm11, %xmm2
	vpmovsxbw	%xmm2, %ymm10
	vmovdqu	%xmm4, %xmm2
	vpmovsxbw	%xmm2, %ymm11
	vextracti128	$1, %ymm4, %xmm2
	vpmovsxbw	%xmm2, %ymm4
	vmovdqu	%ymm3, 384(%rcx)
	vmovdqu	%ymm11, 416(%rcx)
	vmovdqu	%ymm10, 448(%rcx)
	vmovdqu	%ymm4, 480(%rcx)
	ret
L_poly_getnoise_eta2$1:
	movq	%rsi, %mm0
	movb	%al, 176(%rsp)
	leaq	32(%rsp), %rsi
	leaq	176(%rsp), %rax
	call	L_shake256_A128__A32_A1$1
L_poly_getnoise_eta2$2:
	movq	%mm0, %rax
	leaq	32(%rsp), %rcx
	movl	$1431655765, 160(%rsp)
	movl	$858993459, 164(%rsp)
	movl	$50529027, 168(%rsp)
	movl	$252645135, 172(%rsp)
	vpbroadcastd	160(%rsp), %ymm0
	vpbroadcastd	164(%rsp), %ymm1
	vpbroadcastd	168(%rsp), %ymm2
	vpbroadcastd	172(%rsp), %ymm3
	vmovdqu	(%rcx), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, (%rax)
	vmovdqu	%ymm11, 32(%rax)
	vmovdqu	%ymm10, 64(%rax)
	vmovdqu	%ymm4, 96(%rax)
	vmovdqu	32(%rcx), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, 128(%rax)
	vmovdqu	%ymm11, 160(%rax)
	vmovdqu	%ymm10, 192(%rax)
	vmovdqu	%ymm4, 224(%rax)
	vmovdqu	64(%rcx), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm9
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm9, %ymm11
	vpunpckhbw	%ymm4, %ymm9, %ymm4
	vmovdqu	%xmm11, %xmm5
	vpmovsxbw	%xmm5, %ymm9
	vextracti128	$1, %ymm11, %xmm5
	vpmovsxbw	%xmm5, %ymm10
	vmovdqu	%xmm4, %xmm5
	vpmovsxbw	%xmm5, %ymm11
	vextracti128	$1, %ymm4, %xmm5
	vpmovsxbw	%xmm5, %ymm4
	vmovdqu	%ymm9, 256(%rax)
	vmovdqu	%ymm11, 288(%rax)
	vmovdqu	%ymm10, 320(%rax)
	vmovdqu	%ymm4, 352(%rax)
	vmovdqu	96(%rcx), %ymm9
	vpsrlw	$1, %ymm9, %ymm4
	vpand	%ymm9, %ymm0, %ymm9
	vpand	%ymm4, %ymm0, %ymm4
	vpaddb	%ymm4, %ymm9, %ymm9
	vpsrlw	$2, %ymm9, %ymm4
	vpand	%ymm9, %ymm1, %ymm9
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm9, %ymm9
	vpsubb	%ymm4, %ymm9, %ymm9
	vpsrlw	$4, %ymm9, %ymm4
	vpand	%ymm9, %ymm3, %ymm9
	vpand	%ymm4, %ymm3, %ymm4
	vpsubb	%ymm2, %ymm9, %ymm3
	vpsubb	%ymm2, %ymm4, %ymm4
	vpunpcklbw	%ymm4, %ymm3, %ymm11
	vpunpckhbw	%ymm4, %ymm3, %ymm4
	vmovdqu	%xmm11, %xmm2
	vpmovsxbw	%xmm2, %ymm3
	vextracti128	$1, %ymm11, %xmm2
	vpmovsxbw	%xmm2, %ymm10
	vmovdqu	%xmm4, %xmm2
	vpmovsxbw	%xmm2, %ymm11
	vextracti128	$1, %ymm4, %xmm2
	vpmovsxbw	%xmm2, %ymm4
	vmovdqu	%ymm3, 384(%rax)
	vmovdqu	%ymm11, 416(%rax)
	vmovdqu	%ymm10, 448(%rax)
	vmovdqu	%ymm4, 480(%rax)
	ret
L_i_poly_frommsg$1:
	vmovdqu	glob_data + 992(%rip), %ymm0
	vbroadcasti128	glob_data + 2832(%rip), %ymm4
	vbroadcasti128	glob_data + 2816(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpshufd	$0, %ymm2, %ymm3
	vpsllvd	%ymm4, %ymm3, %ymm3
	vpshufb	%ymm1, %ymm3, %ymm3
	vpsllw	$12, %ymm3, %ymm6
	vpsllw	$8, %ymm3, %ymm7
	vpsllw	$4, %ymm3, %ymm5
	vpsraw	$15, %ymm6, %ymm6
	vpsraw	$15, %ymm7, %ymm7
	vpsraw	$15, %ymm5, %ymm5
	vpsraw	$15, %ymm3, %ymm3
	vpand	%ymm0, %ymm6, %ymm6
	vpand	%ymm0, %ymm7, %ymm7
	vpand	%ymm0, %ymm5, %ymm5
	vpand	%ymm0, %ymm3, %ymm3
	vpunpcklqdq	%ymm7, %ymm6, %ymm8
	vpunpckhqdq	%ymm7, %ymm6, %ymm6
	vpunpcklqdq	%ymm3, %ymm5, %ymm7
	vpunpckhqdq	%ymm3, %ymm5, %ymm3
	vperm2i128	$32, %ymm7, %ymm8, %ymm5
	vperm2i128	$49, %ymm7, %ymm8, %ymm7
	vperm2i128	$32, %ymm3, %ymm6, %ymm8
	vperm2i128	$49, %ymm3, %ymm6, %ymm3
	vmovdqu	%ymm5, (%rsi)
	vmovdqu	%ymm8, 32(%rsi)
	vmovdqu	%ymm7, 256(%rsi)
	vmovdqu	%ymm3, 288(%rsi)
	vpshufd	$85, %ymm2, %ymm3
	vpsllvd	%ymm4, %ymm3, %ymm3
	vpshufb	%ymm1, %ymm3, %ymm3
	vpsllw	$12, %ymm3, %ymm5
	vpsllw	$8, %ymm3, %ymm7
	vpsllw	$4, %ymm3, %ymm6
	vpsraw	$15, %ymm5, %ymm5
	vpsraw	$15, %ymm7, %ymm7
	vpsraw	$15, %ymm6, %ymm6
	vpsraw	$15, %ymm3, %ymm3
	vpand	%ymm0, %ymm5, %ymm5
	vpand	%ymm0, %ymm7, %ymm7
	vpand	%ymm0, %ymm6, %ymm6
	vpand	%ymm0, %ymm3, %ymm3
	vpunpcklqdq	%ymm7, %ymm5, %ymm8
	vpunpckhqdq	%ymm7, %ymm5, %ymm5
	vpunpcklqdq	%ymm3, %ymm6, %ymm7
	vpunpckhqdq	%ymm3, %ymm6, %ymm3
	vperm2i128	$32, %ymm7, %ymm8, %ymm6
	vperm2i128	$49, %ymm7, %ymm8, %ymm7
	vperm2i128	$32, %ymm3, %ymm5, %ymm8
	vperm2i128	$49, %ymm3, %ymm5, %ymm3
	vmovdqu	%ymm6, 64(%rsi)
	vmovdqu	%ymm8, 96(%rsi)
	vmovdqu	%ymm7, 320(%rsi)
	vmovdqu	%ymm3, 352(%rsi)
	vpshufd	$170, %ymm2, %ymm3
	vpsllvd	%ymm4, %ymm3, %ymm3
	vpshufb	%ymm1, %ymm3, %ymm3
	vpsllw	$12, %ymm3, %ymm5
	vpsllw	$8, %ymm3, %ymm7
	vpsllw	$4, %ymm3, %ymm6
	vpsraw	$15, %ymm5, %ymm5
	vpsraw	$15, %ymm7, %ymm7
	vpsraw	$15, %ymm6, %ymm6
	vpsraw	$15, %ymm3, %ymm3
	vpand	%ymm0, %ymm5, %ymm5
	vpand	%ymm0, %ymm7, %ymm7
	vpand	%ymm0, %ymm6, %ymm6
	vpand	%ymm0, %ymm3, %ymm3
	vpunpcklqdq	%ymm7, %ymm5, %ymm8
	vpunpckhqdq	%ymm7, %ymm5, %ymm5
	vpunpcklqdq	%ymm3, %ymm6, %ymm7
	vpunpckhqdq	%ymm3, %ymm6, %ymm3
	vperm2i128	$32, %ymm7, %ymm8, %ymm6
	vperm2i128	$49, %ymm7, %ymm8, %ymm7
	vperm2i128	$32, %ymm3, %ymm5, %ymm8
	vperm2i128	$49, %ymm3, %ymm5, %ymm3
	vmovdqu	%ymm6, 128(%rsi)
	vmovdqu	%ymm8, 160(%rsi)
	vmovdqu	%ymm7, 384(%rsi)
	vmovdqu	%ymm3, 416(%rsi)
	vpshufd	$255, %ymm2, %ymm3
	vpsllvd	%ymm4, %ymm3, %ymm3
	vpshufb	%ymm1, %ymm3, %ymm3
	vpsllw	$12, %ymm3, %ymm5
	vpsllw	$8, %ymm3, %ymm7
	vpsllw	$4, %ymm3, %ymm6
	vpsraw	$15, %ymm5, %ymm5
	vpsraw	$15, %ymm7, %ymm7
	vpsraw	$15, %ymm6, %ymm6
	vpsraw	$15, %ymm3, %ymm3
	vpand	%ymm0, %ymm5, %ymm5
	vpand	%ymm0, %ymm7, %ymm7
	vpand	%ymm0, %ymm6, %ymm6
	vpand	%ymm0, %ymm3, %ymm3
	vpunpcklqdq	%ymm7, %ymm5, %ymm8
	vpunpckhqdq	%ymm7, %ymm5, %ymm5
	vpunpcklqdq	%ymm3, %ymm6, %ymm7
	vpunpckhqdq	%ymm3, %ymm6, %ymm3
	vperm2i128	$32, %ymm7, %ymm8, %ymm6
	vperm2i128	$49, %ymm7, %ymm8, %ymm7
	vperm2i128	$32, %ymm3, %ymm5, %ymm8
	vperm2i128	$49, %ymm3, %ymm5, %ymm3
	vmovdqu	%ymm6, 192(%rsi)
	vmovdqu	%ymm8, 224(%rsi)
	vmovdqu	%ymm7, 448(%rsi)
	vmovdqu	%ymm3, 480(%rsi)
	ret
L_poly_frommont$1:
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1152(%rip), %ymm1
	vmovdqu	glob_data + 896(%rip), %ymm2
	vmovdqu	(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, (%rax)
	vmovdqu	32(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, 32(%rax)
	vmovdqu	64(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, 64(%rax)
	vmovdqu	96(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, 96(%rax)
	vmovdqu	128(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, 128(%rax)
	vmovdqu	160(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, 160(%rax)
	vmovdqu	192(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, 192(%rax)
	vmovdqu	224(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, 224(%rax)
	vmovdqu	256(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, 256(%rax)
	vmovdqu	288(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, 288(%rax)
	vmovdqu	320(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, 320(%rax)
	vmovdqu	352(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, 352(%rax)
	vmovdqu	384(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, 384(%rax)
	vmovdqu	416(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, 416(%rax)
	vmovdqu	448(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm5
	vmovdqu	%ymm5, 448(%rax)
	vmovdqu	480(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm2
	vmovdqu	%ymm2, 480(%rax)
	ret
L_i_poly_frombytes$1:
	vmovdqu	glob_data + 1024(%rip), %ymm0
	vmovdqu	(%r9), %ymm2
	vmovdqu	32(%r9), %ymm3
	vmovdqu	64(%r9), %ymm4
	vmovdqu	96(%r9), %ymm1
	vmovdqu	128(%r9), %ymm5
	vmovdqu	160(%r9), %ymm6
	vperm2i128	$32, %ymm1, %ymm2, %ymm7
	vperm2i128	$49, %ymm1, %ymm2, %ymm9
	vperm2i128	$32, %ymm5, %ymm3, %ymm10
	vperm2i128	$49, %ymm5, %ymm3, %ymm1
	vperm2i128	$32, %ymm6, %ymm4, %ymm5
	vperm2i128	$49, %ymm6, %ymm4, %ymm6
	vpunpcklqdq	%ymm1, %ymm7, %ymm4
	vpunpckhqdq	%ymm1, %ymm7, %ymm2
	vpunpcklqdq	%ymm5, %ymm9, %ymm3
	vpunpckhqdq	%ymm5, %ymm9, %ymm5
	vpunpcklqdq	%ymm6, %ymm10, %ymm8
	vpunpckhqdq	%ymm6, %ymm10, %ymm1
	vmovsldup	%ymm5, %ymm6
	vpblendd	$170, %ymm6, %ymm4, %ymm6
	vpsrlq	$32, %ymm4, %ymm4
	vpblendd	$170, %ymm5, %ymm4, %ymm7
	vmovsldup	%ymm8, %ymm11
	vpblendd	$170, %ymm11, %ymm2, %ymm4
	vpsrlq	$32, %ymm2, %ymm2
	vpblendd	$170, %ymm8, %ymm2, %ymm10
	vmovsldup	%ymm1, %ymm2
	vpblendd	$170, %ymm2, %ymm3, %ymm2
	vpsrlq	$32, %ymm3, %ymm3
	vpblendd	$170, %ymm1, %ymm3, %ymm1
	vpslld	$16, %ymm10, %ymm11
	vpblendw	$170, %ymm11, %ymm6, %ymm5
	vpsrld	$16, %ymm6, %ymm3
	vpblendw	$170, %ymm10, %ymm3, %ymm10
	vpslld	$16, %ymm2, %ymm6
	vpblendw	$170, %ymm6, %ymm7, %ymm6
	vpsrld	$16, %ymm7, %ymm3
	vpblendw	$170, %ymm2, %ymm3, %ymm3
	vpslld	$16, %ymm1, %ymm2
	vpblendw	$170, %ymm2, %ymm4, %ymm7
	vpsrld	$16, %ymm4, %ymm8
	vpblendw	$170, %ymm1, %ymm8, %ymm1
	vpsrlw	$12, %ymm5, %ymm12
	vpsllw	$4, %ymm10, %ymm4
	vpor	%ymm4, %ymm12, %ymm12
	vpand	%ymm5, %ymm0, %ymm2
	vpand	%ymm12, %ymm0, %ymm12
	vpsrlw	$8, %ymm10, %ymm4
	vpsllw	$8, %ymm6, %ymm5
	vpor	%ymm5, %ymm4, %ymm4
	vpand	%ymm4, %ymm0, %ymm4
	vpsrlw	$4, %ymm6, %ymm5
	vpand	%ymm5, %ymm0, %ymm5
	vpsrlw	$12, %ymm3, %ymm6
	vpsllw	$4, %ymm7, %ymm8
	vpor	%ymm8, %ymm6, %ymm6
	vpand	%ymm3, %ymm0, %ymm3
	vpand	%ymm6, %ymm0, %ymm6
	vpsrlw	$8, %ymm7, %ymm8
	vpsllw	$8, %ymm1, %ymm7
	vpor	%ymm7, %ymm8, %ymm8
	vpand	%ymm8, %ymm0, %ymm8
	vpsrlw	$4, %ymm1, %ymm7
	vpand	%ymm7, %ymm0, %ymm7
	vmovdqu	%ymm2, (%r8)
	vmovdqu	%ymm12, 32(%r8)
	vmovdqu	%ymm4, 64(%r8)
	vmovdqu	%ymm5, 96(%r8)
	vmovdqu	%ymm3, 128(%r8)
	vmovdqu	%ymm6, 160(%r8)
	vmovdqu	%ymm8, 192(%r8)
	vmovdqu	%ymm7, 224(%r8)
	vmovdqu	192(%r9), %ymm2
	vmovdqu	224(%r9), %ymm3
	vmovdqu	256(%r9), %ymm4
	vmovdqu	288(%r9), %ymm1
	vmovdqu	320(%r9), %ymm5
	vmovdqu	352(%r9), %ymm6
	vperm2i128	$32, %ymm1, %ymm2, %ymm7
	vperm2i128	$49, %ymm1, %ymm2, %ymm9
	vperm2i128	$32, %ymm5, %ymm3, %ymm10
	vperm2i128	$49, %ymm5, %ymm3, %ymm1
	vperm2i128	$32, %ymm6, %ymm4, %ymm5
	vperm2i128	$49, %ymm6, %ymm4, %ymm6
	vpunpcklqdq	%ymm1, %ymm7, %ymm11
	vpunpckhqdq	%ymm1, %ymm7, %ymm2
	vpunpcklqdq	%ymm5, %ymm9, %ymm3
	vpunpckhqdq	%ymm5, %ymm9, %ymm5
	vpunpcklqdq	%ymm6, %ymm10, %ymm7
	vpunpckhqdq	%ymm6, %ymm10, %ymm1
	vmovsldup	%ymm5, %ymm6
	vpblendd	$170, %ymm6, %ymm11, %ymm4
	vpsrlq	$32, %ymm11, %ymm9
	vpblendd	$170, %ymm5, %ymm9, %ymm5
	vmovsldup	%ymm7, %ymm6
	vpblendd	$170, %ymm6, %ymm2, %ymm8
	vpsrlq	$32, %ymm2, %ymm2
	vpblendd	$170, %ymm7, %ymm2, %ymm6
	vmovsldup	%ymm1, %ymm2
	vpblendd	$170, %ymm2, %ymm3, %ymm2
	vpsrlq	$32, %ymm3, %ymm3
	vpblendd	$170, %ymm1, %ymm3, %ymm1
	vpslld	$16, %ymm6, %ymm11
	vpblendw	$170, %ymm11, %ymm4, %ymm11
	vpsrld	$16, %ymm4, %ymm3
	vpblendw	$170, %ymm6, %ymm3, %ymm10
	vpslld	$16, %ymm2, %ymm6
	vpblendw	$170, %ymm6, %ymm5, %ymm6
	vpsrld	$16, %ymm5, %ymm3
	vpblendw	$170, %ymm2, %ymm3, %ymm3
	vpslld	$16, %ymm1, %ymm2
	vpblendw	$170, %ymm2, %ymm8, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpblendw	$170, %ymm1, %ymm8, %ymm1
	vpsrlw	$12, %ymm11, %ymm12
	vpsllw	$4, %ymm10, %ymm4
	vpor	%ymm4, %ymm12, %ymm12
	vpand	%ymm11, %ymm0, %ymm2
	vpand	%ymm12, %ymm0, %ymm12
	vpsrlw	$8, %ymm10, %ymm4
	vpsllw	$8, %ymm6, %ymm5
	vpor	%ymm5, %ymm4, %ymm4
	vpand	%ymm4, %ymm0, %ymm4
	vpsrlw	$4, %ymm6, %ymm5
	vpand	%ymm5, %ymm0, %ymm5
	vpsrlw	$12, %ymm3, %ymm6
	vpsllw	$4, %ymm7, %ymm8
	vpor	%ymm8, %ymm6, %ymm6
	vpand	%ymm3, %ymm0, %ymm3
	vpand	%ymm6, %ymm0, %ymm6
	vpsrlw	$8, %ymm7, %ymm8
	vpsllw	$8, %ymm1, %ymm7
	vpor	%ymm7, %ymm8, %ymm8
	vpand	%ymm8, %ymm0, %ymm8
	vpsrlw	$4, %ymm1, %ymm7
	vpand	%ymm7, %ymm0, %ymm0
	vmovdqu	%ymm2, 256(%r8)
	vmovdqu	%ymm12, 288(%r8)
	vmovdqu	%ymm4, 320(%r8)
	vmovdqu	%ymm5, 352(%r8)
	vmovdqu	%ymm3, 384(%r8)
	vmovdqu	%ymm6, 416(%r8)
	vmovdqu	%ymm8, 448(%r8)
	vmovdqu	%ymm0, 480(%r8)
	ret
L_poly_basemul$1:
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1152(%rip), %ymm1
	vmovdqu	glob_data + 2288(%rip), %ymm2
	vmovdqu	glob_data + 2320(%rip), %ymm3
	vmovdqu	(%rcx), %ymm4
	vmovdqu	32(%rcx), %ymm5
	vmovdqu	(%rdi), %ymm6
	vmovdqu	32(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm8
	vpmulhw	%ymm5, %ymm3, %ymm10
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm8, %ymm10, %ymm8
	vpmullw	%ymm6, %ymm4, %ymm10
	vpmulhw	%ymm6, %ymm4, %ymm11
	vpunpcklwd	%ymm11, %ymm10, %ymm9
	vpunpckhwd	%ymm11, %ymm10, %ymm10
	vpmullw	%ymm7, %ymm4, %ymm12
	vpmulhw	%ymm7, %ymm4, %ymm4
	vpunpcklwd	%ymm4, %ymm12, %ymm11
	vpunpckhwd	%ymm4, %ymm12, %ymm4
	vpmullw	%ymm6, %ymm5, %ymm12
	vpmulhw	%ymm6, %ymm5, %ymm6
	vpunpcklwd	%ymm6, %ymm12, %ymm5
	vpunpckhwd	%ymm6, %ymm12, %ymm6
	vpmullw	%ymm7, %ymm8, %ymm12
	vpmulhw	%ymm7, %ymm8, %ymm7
	vpunpcklwd	%ymm7, %ymm12, %ymm8
	vpunpckhwd	%ymm7, %ymm12, %ymm12
	vpaddd	%ymm8, %ymm9, %ymm7
	vpaddd	%ymm12, %ymm10, %ymm8
	vpaddd	%ymm11, %ymm5, %ymm5
	vpaddd	%ymm4, %ymm6, %ymm4
	vpxor	%ymm9, %ymm9, %ymm9
	vpblendw	$170, %ymm9, %ymm7, %ymm10
	vpblendw	$170, %ymm9, %ymm8, %ymm6
	vpackusdw	%ymm6, %ymm10, %ymm6
	vpsrld	$16, %ymm7, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpackusdw	%ymm8, %ymm7, %ymm7
	vpblendw	$170, %ymm9, %ymm5, %ymm10
	vpblendw	$170, %ymm9, %ymm4, %ymm9
	vpackusdw	%ymm9, %ymm10, %ymm8
	vpsrld	$16, %ymm5, %ymm5
	vpsrld	$16, %ymm4, %ymm4
	vpackusdw	%ymm4, %ymm5, %ymm4
	vpmullw	%ymm1, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm7, %ymm5
	vpmullw	%ymm1, %ymm8, %ymm6
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm4, %ymm4
	vmovdqu	%ymm5, (%rsi)
	vmovdqu	%ymm4, 32(%rsi)
	vmovdqu	64(%rcx), %ymm4
	vmovdqu	96(%rcx), %ymm5
	vmovdqu	64(%rdi), %ymm6
	vmovdqu	96(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm8
	vpmulhw	%ymm5, %ymm3, %ymm2
	vpmulhw	%ymm0, %ymm8, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm8
	vpmullw	%ymm6, %ymm4, %ymm2
	vpmulhw	%ymm6, %ymm4, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm9
	vpunpckhwd	%ymm3, %ymm2, %ymm10
	vpmullw	%ymm7, %ymm4, %ymm2
	vpmulhw	%ymm7, %ymm4, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm11
	vpunpckhwd	%ymm3, %ymm2, %ymm4
	vpmullw	%ymm6, %ymm5, %ymm2
	vpmulhw	%ymm6, %ymm5, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm5
	vpunpckhwd	%ymm3, %ymm2, %ymm6
	vpmullw	%ymm7, %ymm8, %ymm2
	vpmulhw	%ymm7, %ymm8, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm8
	vpunpckhwd	%ymm3, %ymm2, %ymm12
	vpsubd	%ymm8, %ymm9, %ymm7
	vpsubd	%ymm12, %ymm10, %ymm8
	vpaddd	%ymm11, %ymm5, %ymm5
	vpaddd	%ymm4, %ymm6, %ymm4
	vpxor	%ymm9, %ymm9, %ymm9
	vpblendw	$170, %ymm9, %ymm7, %ymm2
	vpblendw	$170, %ymm9, %ymm8, %ymm3
	vpackusdw	%ymm3, %ymm2, %ymm6
	vpsrld	$16, %ymm7, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpackusdw	%ymm8, %ymm7, %ymm7
	vpblendw	$170, %ymm9, %ymm5, %ymm2
	vpblendw	$170, %ymm9, %ymm4, %ymm3
	vpackusdw	%ymm3, %ymm2, %ymm2
	vpsrld	$16, %ymm5, %ymm5
	vpsrld	$16, %ymm4, %ymm4
	vpackusdw	%ymm4, %ymm5, %ymm3
	vpmullw	%ymm1, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm7, %ymm5
	vpmullw	%ymm1, %ymm2, %ymm6
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm3, %ymm4
	vmovdqu	%ymm5, 64(%rsi)
	vmovdqu	%ymm4, 96(%rsi)
	vmovdqu	glob_data + 2352(%rip), %ymm2
	vmovdqu	glob_data + 2384(%rip), %ymm3
	vmovdqu	128(%rcx), %ymm4
	vmovdqu	160(%rcx), %ymm5
	vmovdqu	128(%rdi), %ymm6
	vmovdqu	160(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm8
	vpmulhw	%ymm5, %ymm3, %ymm10
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm8, %ymm10, %ymm8
	vpmullw	%ymm6, %ymm4, %ymm10
	vpmulhw	%ymm6, %ymm4, %ymm11
	vpunpcklwd	%ymm11, %ymm10, %ymm9
	vpunpckhwd	%ymm11, %ymm10, %ymm10
	vpmullw	%ymm7, %ymm4, %ymm12
	vpmulhw	%ymm7, %ymm4, %ymm4
	vpunpcklwd	%ymm4, %ymm12, %ymm11
	vpunpckhwd	%ymm4, %ymm12, %ymm4
	vpmullw	%ymm6, %ymm5, %ymm12
	vpmulhw	%ymm6, %ymm5, %ymm6
	vpunpcklwd	%ymm6, %ymm12, %ymm5
	vpunpckhwd	%ymm6, %ymm12, %ymm6
	vpmullw	%ymm7, %ymm8, %ymm12
	vpmulhw	%ymm7, %ymm8, %ymm7
	vpunpcklwd	%ymm7, %ymm12, %ymm8
	vpunpckhwd	%ymm7, %ymm12, %ymm12
	vpaddd	%ymm8, %ymm9, %ymm7
	vpaddd	%ymm12, %ymm10, %ymm8
	vpaddd	%ymm11, %ymm5, %ymm5
	vpaddd	%ymm4, %ymm6, %ymm4
	vpxor	%ymm9, %ymm9, %ymm9
	vpblendw	$170, %ymm9, %ymm7, %ymm10
	vpblendw	$170, %ymm9, %ymm8, %ymm6
	vpackusdw	%ymm6, %ymm10, %ymm6
	vpsrld	$16, %ymm7, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpackusdw	%ymm8, %ymm7, %ymm7
	vpblendw	$170, %ymm9, %ymm5, %ymm10
	vpblendw	$170, %ymm9, %ymm4, %ymm9
	vpackusdw	%ymm9, %ymm10, %ymm8
	vpsrld	$16, %ymm5, %ymm5
	vpsrld	$16, %ymm4, %ymm4
	vpackusdw	%ymm4, %ymm5, %ymm4
	vpmullw	%ymm1, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm7, %ymm5
	vpmullw	%ymm1, %ymm8, %ymm6
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm4, %ymm4
	vmovdqu	%ymm5, 128(%rsi)
	vmovdqu	%ymm4, 160(%rsi)
	vmovdqu	192(%rcx), %ymm4
	vmovdqu	224(%rcx), %ymm5
	vmovdqu	192(%rdi), %ymm6
	vmovdqu	224(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm8
	vpmulhw	%ymm5, %ymm3, %ymm2
	vpmulhw	%ymm0, %ymm8, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm8
	vpmullw	%ymm6, %ymm4, %ymm2
	vpmulhw	%ymm6, %ymm4, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm9
	vpunpckhwd	%ymm3, %ymm2, %ymm10
	vpmullw	%ymm7, %ymm4, %ymm2
	vpmulhw	%ymm7, %ymm4, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm11
	vpunpckhwd	%ymm3, %ymm2, %ymm4
	vpmullw	%ymm6, %ymm5, %ymm2
	vpmulhw	%ymm6, %ymm5, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm5
	vpunpckhwd	%ymm3, %ymm2, %ymm6
	vpmullw	%ymm7, %ymm8, %ymm2
	vpmulhw	%ymm7, %ymm8, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm8
	vpunpckhwd	%ymm3, %ymm2, %ymm12
	vpsubd	%ymm8, %ymm9, %ymm7
	vpsubd	%ymm12, %ymm10, %ymm8
	vpaddd	%ymm11, %ymm5, %ymm5
	vpaddd	%ymm4, %ymm6, %ymm4
	vpxor	%ymm9, %ymm9, %ymm9
	vpblendw	$170, %ymm9, %ymm7, %ymm2
	vpblendw	$170, %ymm9, %ymm8, %ymm3
	vpackusdw	%ymm3, %ymm2, %ymm6
	vpsrld	$16, %ymm7, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpackusdw	%ymm8, %ymm7, %ymm7
	vpblendw	$170, %ymm9, %ymm5, %ymm2
	vpblendw	$170, %ymm9, %ymm4, %ymm3
	vpackusdw	%ymm3, %ymm2, %ymm8
	vpsrld	$16, %ymm5, %ymm5
	vpsrld	$16, %ymm4, %ymm4
	vpackusdw	%ymm4, %ymm5, %ymm4
	vpmullw	%ymm1, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm7, %ymm5
	vpmullw	%ymm1, %ymm8, %ymm6
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm4, %ymm4
	vmovdqu	%ymm5, 192(%rsi)
	vmovdqu	%ymm4, 224(%rsi)
	vmovdqu	glob_data + 2680(%rip), %ymm2
	vmovdqu	glob_data + 2712(%rip), %ymm3
	vmovdqu	256(%rcx), %ymm4
	vmovdqu	288(%rcx), %ymm5
	vmovdqu	256(%rdi), %ymm6
	vmovdqu	288(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm8
	vpmulhw	%ymm5, %ymm3, %ymm10
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm8, %ymm10, %ymm8
	vpmullw	%ymm6, %ymm4, %ymm10
	vpmulhw	%ymm6, %ymm4, %ymm11
	vpunpcklwd	%ymm11, %ymm10, %ymm9
	vpunpckhwd	%ymm11, %ymm10, %ymm10
	vpmullw	%ymm7, %ymm4, %ymm12
	vpmulhw	%ymm7, %ymm4, %ymm4
	vpunpcklwd	%ymm4, %ymm12, %ymm11
	vpunpckhwd	%ymm4, %ymm12, %ymm4
	vpmullw	%ymm6, %ymm5, %ymm12
	vpmulhw	%ymm6, %ymm5, %ymm6
	vpunpcklwd	%ymm6, %ymm12, %ymm5
	vpunpckhwd	%ymm6, %ymm12, %ymm6
	vpmullw	%ymm7, %ymm8, %ymm12
	vpmulhw	%ymm7, %ymm8, %ymm7
	vpunpcklwd	%ymm7, %ymm12, %ymm8
	vpunpckhwd	%ymm7, %ymm12, %ymm12
	vpaddd	%ymm8, %ymm9, %ymm7
	vpaddd	%ymm12, %ymm10, %ymm8
	vpaddd	%ymm11, %ymm5, %ymm5
	vpaddd	%ymm4, %ymm6, %ymm4
	vpxor	%ymm9, %ymm9, %ymm9
	vpblendw	$170, %ymm9, %ymm7, %ymm10
	vpblendw	$170, %ymm9, %ymm8, %ymm6
	vpackusdw	%ymm6, %ymm10, %ymm6
	vpsrld	$16, %ymm7, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpackusdw	%ymm8, %ymm7, %ymm7
	vpblendw	$170, %ymm9, %ymm5, %ymm10
	vpblendw	$170, %ymm9, %ymm4, %ymm9
	vpackusdw	%ymm9, %ymm10, %ymm8
	vpsrld	$16, %ymm5, %ymm5
	vpsrld	$16, %ymm4, %ymm4
	vpackusdw	%ymm4, %ymm5, %ymm4
	vpmullw	%ymm1, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm7, %ymm5
	vpmullw	%ymm1, %ymm8, %ymm6
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm4, %ymm4
	vmovdqu	%ymm5, 256(%rsi)
	vmovdqu	%ymm4, 288(%rsi)
	vmovdqu	320(%rcx), %ymm4
	vmovdqu	352(%rcx), %ymm5
	vmovdqu	320(%rdi), %ymm6
	vmovdqu	352(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm8
	vpmulhw	%ymm5, %ymm3, %ymm2
	vpmulhw	%ymm0, %ymm8, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm8
	vpmullw	%ymm6, %ymm4, %ymm2
	vpmulhw	%ymm6, %ymm4, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm9
	vpunpckhwd	%ymm3, %ymm2, %ymm10
	vpmullw	%ymm7, %ymm4, %ymm2
	vpmulhw	%ymm7, %ymm4, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm11
	vpunpckhwd	%ymm3, %ymm2, %ymm4
	vpmullw	%ymm6, %ymm5, %ymm2
	vpmulhw	%ymm6, %ymm5, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm5
	vpunpckhwd	%ymm3, %ymm2, %ymm6
	vpmullw	%ymm7, %ymm8, %ymm2
	vpmulhw	%ymm7, %ymm8, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm8
	vpunpckhwd	%ymm3, %ymm2, %ymm12
	vpsubd	%ymm8, %ymm9, %ymm7
	vpsubd	%ymm12, %ymm10, %ymm8
	vpaddd	%ymm11, %ymm5, %ymm5
	vpaddd	%ymm4, %ymm6, %ymm4
	vpxor	%ymm9, %ymm9, %ymm9
	vpblendw	$170, %ymm9, %ymm7, %ymm2
	vpblendw	$170, %ymm9, %ymm8, %ymm3
	vpackusdw	%ymm3, %ymm2, %ymm6
	vpsrld	$16, %ymm7, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpackusdw	%ymm8, %ymm7, %ymm7
	vpblendw	$170, %ymm9, %ymm5, %ymm2
	vpblendw	$170, %ymm9, %ymm4, %ymm3
	vpackusdw	%ymm3, %ymm2, %ymm8
	vpsrld	$16, %ymm5, %ymm5
	vpsrld	$16, %ymm4, %ymm4
	vpackusdw	%ymm4, %ymm5, %ymm4
	vpmullw	%ymm1, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm7, %ymm5
	vpmullw	%ymm1, %ymm8, %ymm6
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm4, %ymm4
	vmovdqu	%ymm5, 320(%rsi)
	vmovdqu	%ymm4, 352(%rsi)
	vmovdqu	glob_data + 2744(%rip), %ymm2
	vmovdqu	glob_data + 2776(%rip), %ymm3
	vmovdqu	384(%rcx), %ymm4
	vmovdqu	416(%rcx), %ymm5
	vmovdqu	384(%rdi), %ymm6
	vmovdqu	416(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm8
	vpmulhw	%ymm5, %ymm3, %ymm10
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm8, %ymm10, %ymm8
	vpmullw	%ymm6, %ymm4, %ymm10
	vpmulhw	%ymm6, %ymm4, %ymm11
	vpunpcklwd	%ymm11, %ymm10, %ymm9
	vpunpckhwd	%ymm11, %ymm10, %ymm10
	vpmullw	%ymm7, %ymm4, %ymm12
	vpmulhw	%ymm7, %ymm4, %ymm4
	vpunpcklwd	%ymm4, %ymm12, %ymm11
	vpunpckhwd	%ymm4, %ymm12, %ymm4
	vpmullw	%ymm6, %ymm5, %ymm12
	vpmulhw	%ymm6, %ymm5, %ymm6
	vpunpcklwd	%ymm6, %ymm12, %ymm5
	vpunpckhwd	%ymm6, %ymm12, %ymm6
	vpmullw	%ymm7, %ymm8, %ymm12
	vpmulhw	%ymm7, %ymm8, %ymm7
	vpunpcklwd	%ymm7, %ymm12, %ymm8
	vpunpckhwd	%ymm7, %ymm12, %ymm12
	vpaddd	%ymm8, %ymm9, %ymm7
	vpaddd	%ymm12, %ymm10, %ymm8
	vpaddd	%ymm11, %ymm5, %ymm5
	vpaddd	%ymm4, %ymm6, %ymm4
	vpxor	%ymm9, %ymm9, %ymm9
	vpblendw	$170, %ymm9, %ymm7, %ymm10
	vpblendw	$170, %ymm9, %ymm8, %ymm6
	vpackusdw	%ymm6, %ymm10, %ymm6
	vpsrld	$16, %ymm7, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpackusdw	%ymm8, %ymm7, %ymm7
	vpblendw	$170, %ymm9, %ymm5, %ymm10
	vpblendw	$170, %ymm9, %ymm4, %ymm9
	vpackusdw	%ymm9, %ymm10, %ymm8
	vpsrld	$16, %ymm5, %ymm5
	vpsrld	$16, %ymm4, %ymm4
	vpackusdw	%ymm4, %ymm5, %ymm4
	vpmullw	%ymm1, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm7, %ymm5
	vpmullw	%ymm1, %ymm8, %ymm6
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm4, %ymm4
	vmovdqu	%ymm5, 384(%rsi)
	vmovdqu	%ymm4, 416(%rsi)
	vmovdqu	448(%rcx), %ymm4
	vmovdqu	480(%rcx), %ymm5
	vmovdqu	448(%rdi), %ymm6
	vmovdqu	480(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm8
	vpmulhw	%ymm5, %ymm3, %ymm2
	vpmulhw	%ymm0, %ymm8, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm8
	vpmullw	%ymm6, %ymm4, %ymm2
	vpmulhw	%ymm6, %ymm4, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm9
	vpunpckhwd	%ymm3, %ymm2, %ymm10
	vpmullw	%ymm7, %ymm4, %ymm2
	vpmulhw	%ymm7, %ymm4, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm11
	vpunpckhwd	%ymm3, %ymm2, %ymm4
	vpmullw	%ymm6, %ymm5, %ymm2
	vpmulhw	%ymm6, %ymm5, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm5
	vpunpckhwd	%ymm3, %ymm2, %ymm6
	vpmullw	%ymm7, %ymm8, %ymm2
	vpmulhw	%ymm7, %ymm8, %ymm3
	vpunpcklwd	%ymm3, %ymm2, %ymm8
	vpunpckhwd	%ymm3, %ymm2, %ymm12
	vpsubd	%ymm8, %ymm9, %ymm7
	vpsubd	%ymm12, %ymm10, %ymm8
	vpaddd	%ymm11, %ymm5, %ymm5
	vpaddd	%ymm4, %ymm6, %ymm4
	vpxor	%ymm9, %ymm9, %ymm9
	vpblendw	$170, %ymm9, %ymm7, %ymm2
	vpblendw	$170, %ymm9, %ymm8, %ymm3
	vpackusdw	%ymm3, %ymm2, %ymm6
	vpsrld	$16, %ymm7, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpackusdw	%ymm8, %ymm7, %ymm7
	vpblendw	$170, %ymm9, %ymm5, %ymm2
	vpblendw	$170, %ymm9, %ymm4, %ymm3
	vpackusdw	%ymm3, %ymm2, %ymm8
	vpsrld	$16, %ymm5, %ymm5
	vpsrld	$16, %ymm4, %ymm4
	vpackusdw	%ymm4, %ymm5, %ymm4
	vpmullw	%ymm1, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm7, %ymm5
	vpmullw	%ymm1, %ymm8, %ymm6
	vpmulhw	%ymm0, %ymm6, %ymm0
	vpsubw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm5, 448(%rsi)
	vmovdqu	%ymm4, 480(%rsi)
	ret
L_poly_csubq$1:
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, (%rsi)
	vmovdqu	32(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 32(%rsi)
	vmovdqu	64(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 64(%rsi)
	vmovdqu	96(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 96(%rsi)
	vmovdqu	128(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 128(%rsi)
	vmovdqu	160(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 160(%rsi)
	vmovdqu	192(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 192(%rsi)
	vmovdqu	224(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 224(%rsi)
	vmovdqu	256(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 256(%rsi)
	vmovdqu	288(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 288(%rsi)
	vmovdqu	320(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 320(%rsi)
	vmovdqu	352(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 352(%rsi)
	vmovdqu	384(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 384(%rsi)
	vmovdqu	416(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 416(%rsi)
	vmovdqu	448(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 448(%rsi)
	vmovdqu	480(%rsi), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rsi)
	ret
L_poly_add2$1:
	vmovdqu	(%rsi), %ymm2
	vmovdqu	(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, (%rsi)
	vmovdqu	32(%rsi), %ymm2
	vmovdqu	32(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 32(%rsi)
	vmovdqu	64(%rsi), %ymm2
	vmovdqu	64(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 64(%rsi)
	vmovdqu	96(%rsi), %ymm2
	vmovdqu	96(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 96(%rsi)
	vmovdqu	128(%rsi), %ymm2
	vmovdqu	128(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 128(%rsi)
	vmovdqu	160(%rsi), %ymm2
	vmovdqu	160(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 160(%rsi)
	vmovdqu	192(%rsi), %ymm2
	vmovdqu	192(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 192(%rsi)
	vmovdqu	224(%rsi), %ymm2
	vmovdqu	224(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 224(%rsi)
	vmovdqu	256(%rsi), %ymm2
	vmovdqu	256(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 256(%rsi)
	vmovdqu	288(%rsi), %ymm2
	vmovdqu	288(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 288(%rsi)
	vmovdqu	320(%rsi), %ymm2
	vmovdqu	320(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 320(%rsi)
	vmovdqu	352(%rsi), %ymm2
	vmovdqu	352(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 352(%rsi)
	vmovdqu	384(%rsi), %ymm2
	vmovdqu	384(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 384(%rsi)
	vmovdqu	416(%rsi), %ymm2
	vmovdqu	416(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 416(%rsi)
	vmovdqu	448(%rsi), %ymm2
	vmovdqu	448(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 448(%rsi)
	vmovdqu	480(%rsi), %ymm2
	vmovdqu	480(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rsi)
	ret
L_shake256_A32__A1600$1:
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm6, %ymm6, %ymm6
	movq	$0, %rcx
	vpbroadcastq	(%rbp,%rcx), %ymm8
	vpxor	%ymm8, %ymm4, %ymm4
	vmovdqu	8(%rbp,%rcx), %ymm9
	vpxor	%ymm9, %ymm3, %ymm3
	movq	40(%rbp,%rcx), %rdx
	movq	%rdx, %xmm7
	vmovdqu	48(%rbp,%rcx), %ymm14
	movq	80(%rbp,%rcx), %rdx
	movq	%rdx, %xmm8
	vmovdqu	88(%rbp,%rcx), %ymm13
	movq	120(%rbp,%rcx), %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	movq	128(%rbp,%rcx), %rdx
	movq	%rdx, %xmm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm6, %ymm6
	vinserti128	$1, %xmm7, %ymm8, %ymm10
	vpxor	%ymm10, %ymm5, %ymm5
	addq	$136, %rcx
	call	L_keccakf1600_avx2$1
L_shake256_A32__A1600$9:
	movq	$0, %rdi
	jmp 	L_shake256_A32__A1600$6
L_shake256_A32__A1600$7:
	vpbroadcastq	(%rbp,%rcx), %ymm8
	vpxor	%ymm8, %ymm4, %ymm4
	vmovdqu	8(%rbp,%rcx), %ymm9
	vpxor	%ymm9, %ymm3, %ymm3
	movq	40(%rbp,%rcx), %rdx
	movq	%rdx, %xmm7
	vmovdqu	48(%rbp,%rcx), %ymm14
	movq	80(%rbp,%rcx), %rdx
	movq	%rdx, %xmm8
	vmovdqu	88(%rbp,%rcx), %ymm13
	movq	120(%rbp,%rcx), %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	movq	128(%rbp,%rcx), %rdx
	movq	%rdx, %xmm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm6, %ymm6
	vinserti128	$1, %xmm7, %ymm8, %ymm10
	vpxor	%ymm10, %ymm5, %ymm5
	addq	$136, %rcx
	call	L_keccakf1600_avx2$1
L_shake256_A32__A1600$8:
	incq	%rdi
L_shake256_A32__A1600$6:
	cmpq	$10, %rdi
	jb  	L_shake256_A32__A1600$7
	vpbroadcastq	(%rbp,%rcx), %ymm8
	vpxor	%ymm8, %ymm4, %ymm4
	vmovdqu	8(%rbp,%rcx), %ymm9
	vpxor	%ymm9, %ymm3, %ymm3
	movq	40(%rbp,%rcx), %rdx
	movq	%rdx, %xmm7
	vmovdqu	48(%rbp,%rcx), %ymm14
	movq	80(%rbp,%rcx), %rdx
	movq	%rdx, %xmm8
	vmovdqu	88(%rbp,%rcx), %xmm9
	movq	$0, %rdx
	movq	$31, %rcx
	orq 	%rcx, %rdx
	movq	%rdx, %xmm10
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm13
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm6, %ymm6
	vinserti128	$1, %xmm7, %ymm8, %ymm10
	vpxor	%ymm10, %ymm5, %ymm5
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	$0, %rcx
	movq	$0, %rdi
	jmp 	L_shake256_A32__A1600$3
L_shake256_A32__A1600$4:
	call	L_keccakf1600_avx2$1
L_shake256_A32__A1600$5:
	vmovdqu	%xmm4, %xmm9
	movq	%xmm9, (%rsi,%rcx)
	vmovdqu	%ymm3, 8(%rsi,%rcx)
	vmovdqu	%xmm5, %xmm9
	vextracti128	$1, %ymm5, %xmm7
	movq	%xmm7, %rdx
	movq	%rdx, 40(%rsi,%rcx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm6, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm6, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rsi,%rcx)
	movq	%xmm9, %rdx
	movq	%rdx, 80(%rsi,%rcx)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rsi,%rcx)
	movq	%xmm7, %rdx
	movq	%rdx, 120(%rsi,%rcx)
	vpblendd	$195, %ymm10, %ymm13, %ymm9
	movq	%xmm9, 128(%rsi,%rcx)
	addq	$136, %rcx
	incq	%rdi
L_shake256_A32__A1600$3:
	cmpq	$0, %rdi
	jb  	L_shake256_A32__A1600$4
	call	L_keccakf1600_avx2$1
L_shake256_A32__A1600$2:
	movq	%xmm4, (%rsi,%rcx)
	vmovdqu	%xmm3, %xmm7
	vmovdqu	%xmm7, 8(%rsi,%rcx)
	vextracti128	$1, %ymm3, %xmm3
	movq	%xmm3, 24(%rsi,%rcx)
	ret
L_sha3_256A_A1568$1:
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm6, %ymm6, %ymm6
	movq	$0, %rax
	vpbroadcastq	(%rbp,%rax), %ymm8
	vpxor	%ymm8, %ymm4, %ymm4
	vmovdqu	8(%rbp,%rax), %ymm9
	vpxor	%ymm9, %ymm3, %ymm3
	movq	40(%rbp,%rax), %rdi
	movq	%rdi, %xmm7
	vmovdqu	48(%rbp,%rax), %ymm14
	movq	80(%rbp,%rax), %rdi
	movq	%rdi, %xmm8
	vmovdqu	88(%rbp,%rax), %ymm13
	movq	120(%rbp,%rax), %rdi
	vpinsrq	$1, %rdi, %xmm7, %xmm7
	movq	128(%rbp,%rax), %rdi
	movq	%rdi, %xmm9
	movq	$0, %rdi
	vpinsrq	$1, %rdi, %xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm9
	movq	$0, %rdi
	vpinsrq	$1, %rdi, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm6, %ymm6
	vinserti128	$1, %xmm7, %ymm8, %ymm10
	vpxor	%ymm10, %ymm5, %ymm5
	addq	$136, %rax
	call	L_keccakf1600_avx2$1
L_sha3_256A_A1568$9:
	movq	$0, %rdi
	jmp 	L_sha3_256A_A1568$6
L_sha3_256A_A1568$7:
	vpbroadcastq	(%rbp,%rax), %ymm8
	vpxor	%ymm8, %ymm4, %ymm4
	vmovdqu	8(%rbp,%rax), %ymm9
	vpxor	%ymm9, %ymm3, %ymm3
	movq	40(%rbp,%rax), %r8
	movq	%r8, %xmm7
	vmovdqu	48(%rbp,%rax), %ymm14
	movq	80(%rbp,%rax), %r8
	movq	%r8, %xmm8
	vmovdqu	88(%rbp,%rax), %ymm13
	movq	120(%rbp,%rax), %r8
	vpinsrq	$1, %r8, %xmm7, %xmm7
	movq	128(%rbp,%rax), %r8
	movq	%r8, %xmm9
	movq	$0, %r8
	vpinsrq	$1, %r8, %xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm9
	movq	$0, %r8
	vpinsrq	$1, %r8, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm6, %ymm6
	vinserti128	$1, %xmm7, %ymm8, %ymm10
	vpxor	%ymm10, %ymm5, %ymm5
	addq	$136, %rax
	call	L_keccakf1600_avx2$1
L_sha3_256A_A1568$8:
	incq	%rdi
L_sha3_256A_A1568$6:
	cmpq	$10, %rdi
	jb  	L_sha3_256A_A1568$7
	vpbroadcastq	(%rbp,%rax), %ymm8
	vpxor	%ymm8, %ymm4, %ymm4
	vmovdqu	8(%rbp,%rax), %ymm9
	vpxor	%ymm9, %ymm3, %ymm3
	movq	40(%rbp,%rax), %rdi
	movq	%rdi, %xmm7
	vmovdqu	48(%rbp,%rax), %xmm9
	movq	64(%rbp,%rax), %rdi
	movq	%rdi, %xmm10
	movq	$0, %rdi
	movq	$6, %rax
	orq 	%rax, %rdi
	vpinsrq	$1, %rdi, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm14
	movq	$0, %rdi
	movq	%rdi, %xmm8
	vpxor	%ymm13, %ymm13, %ymm13
	movq	$0, %rdi
	vpinsrq	$1, %rdi, %xmm7, %xmm7
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rdi
	vpinsrq	$1, %rdi, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm6, %ymm6
	vinserti128	$1, %xmm7, %ymm8, %ymm10
	vpxor	%ymm10, %ymm5, %ymm5
	movq	$1, %r8
	shlq	$63, %r8
	movq	%r8, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	$0, %rax
	movq	$0, %rdi
	jmp 	L_sha3_256A_A1568$3
L_sha3_256A_A1568$4:
	call	L_keccakf1600_avx2$1
L_sha3_256A_A1568$5:
	vmovdqu	%xmm4, %xmm9
	movq	%xmm9, (%rsi,%rax)
	vmovdqu	%ymm3, 8(%rsi,%rax)
	vmovdqu	%xmm5, %xmm9
	vextracti128	$1, %ymm5, %xmm7
	movq	%xmm7, %r8
	movq	%r8, 40(%rsi,%rax)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm6, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm6, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rsi,%rax)
	movq	%xmm9, %r8
	movq	%r8, 80(%rsi,%rax)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rsi,%rax)
	movq	%xmm7, %r8
	movq	%r8, 120(%rsi,%rax)
	vpblendd	$195, %ymm10, %ymm13, %ymm9
	movq	%xmm9, 128(%rsi,%rax)
	addq	$136, %rax
	incq	%rdi
L_sha3_256A_A1568$3:
	cmpq	$0, %rdi
	jb  	L_sha3_256A_A1568$4
	call	L_keccakf1600_avx2$1
L_sha3_256A_A1568$2:
	movq	%xmm4, (%rsi,%rax)
	vmovdqu	%xmm3, %xmm7
	vmovdqu	%xmm7, 8(%rsi,%rax)
	vextracti128	$1, %ymm3, %xmm3
	movq	%xmm3, 24(%rsi,%rax)
	ret
L_shake128x4_squeeze3blocks$1:
	movq	%rsi, %r9
	leaq	536(%rsi), %r10
	leaq	1072(%rsi), %r11
	leaq	1608(%rsi), %rbx
	movq	$0, %rbp
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake128x4_squeeze3blocks$16:
	leaq	824(%rsp), %rsp
	movq	$0, %r12
	jmp 	L_shake128x4_squeeze3blocks$14
L_shake128x4_squeeze3blocks$15:
	vmovdqu	(%r8,%r12,4), %ymm2
	vmovdqu	32(%r8,%r12,4), %ymm3
	vmovdqu	64(%r8,%r12,4), %ymm0
	vmovdqu	96(%r8,%r12,4), %ymm1
	addq	$32, %r12
	vperm2i128	$32, %ymm0, %ymm2, %ymm4
	vperm2i128	$32, %ymm1, %ymm3, %ymm5
	vperm2i128	$49, %ymm0, %ymm2, %ymm0
	vperm2i128	$49, %ymm1, %ymm3, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm5
	vpunpcklqdq	%ymm1, %ymm0, %ymm3
	vpunpckhqdq	%ymm1, %ymm0, %ymm1
	vmovdqu	%ymm2, (%r9,%rbp)
	vmovdqu	%ymm5, (%r10,%rbp)
	vmovdqu	%ymm3, (%r11,%rbp)
	vmovdqu	%ymm1, (%rbx,%rbp)
	addq	$32, %rbp
L_shake128x4_squeeze3blocks$14:
	cmpq	$160, %r12
	jb  	L_shake128x4_squeeze3blocks$15
	jmp 	L_shake128x4_squeeze3blocks$12
L_shake128x4_squeeze3blocks$13:
	movq	(%r8,%r12,4), %r13
	movq	%r13, (%r9,%rbp)
	movq	8(%r8,%r12,4), %r13
	movq	%r13, (%r10,%rbp)
	movq	16(%r8,%r12,4), %r13
	movq	%r13, (%r11,%rbp)
	movq	24(%r8,%r12,4), %r13
	movq	%r13, (%rbx,%rbp)
	addq	$8, %r12
	addq	$8, %rbp
L_shake128x4_squeeze3blocks$12:
	cmpq	$168, %r12
	jb  	L_shake128x4_squeeze3blocks$13
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake128x4_squeeze3blocks$11:
	leaq	824(%rsp), %rsp
	movq	$0, %r12
	jmp 	L_shake128x4_squeeze3blocks$9
L_shake128x4_squeeze3blocks$10:
	vmovdqu	(%r8,%r12,4), %ymm2
	vmovdqu	32(%r8,%r12,4), %ymm3
	vmovdqu	64(%r8,%r12,4), %ymm0
	vmovdqu	96(%r8,%r12,4), %ymm1
	addq	$32, %r12
	vperm2i128	$32, %ymm0, %ymm2, %ymm4
	vperm2i128	$32, %ymm1, %ymm3, %ymm5
	vperm2i128	$49, %ymm0, %ymm2, %ymm0
	vperm2i128	$49, %ymm1, %ymm3, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm5
	vpunpcklqdq	%ymm1, %ymm0, %ymm3
	vpunpckhqdq	%ymm1, %ymm0, %ymm1
	vmovdqu	%ymm2, (%r9,%rbp)
	vmovdqu	%ymm5, (%r10,%rbp)
	vmovdqu	%ymm3, (%r11,%rbp)
	vmovdqu	%ymm1, (%rbx,%rbp)
	addq	$32, %rbp
L_shake128x4_squeeze3blocks$9:
	cmpq	$160, %r12
	jb  	L_shake128x4_squeeze3blocks$10
	jmp 	L_shake128x4_squeeze3blocks$7
L_shake128x4_squeeze3blocks$8:
	movq	(%r8,%r12,4), %r13
	movq	%r13, (%r9,%rbp)
	movq	8(%r8,%r12,4), %r13
	movq	%r13, (%r10,%rbp)
	movq	16(%r8,%r12,4), %r13
	movq	%r13, (%r11,%rbp)
	movq	24(%r8,%r12,4), %r13
	movq	%r13, (%rbx,%rbp)
	addq	$8, %r12
	addq	$8, %rbp
L_shake128x4_squeeze3blocks$7:
	cmpq	$168, %r12
	jb  	L_shake128x4_squeeze3blocks$8
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake128x4_squeeze3blocks$6:
	leaq	824(%rsp), %rsp
	movq	$0, %r12
	jmp 	L_shake128x4_squeeze3blocks$4
L_shake128x4_squeeze3blocks$5:
	vmovdqu	(%r8,%r12,4), %ymm2
	vmovdqu	32(%r8,%r12,4), %ymm3
	vmovdqu	64(%r8,%r12,4), %ymm0
	vmovdqu	96(%r8,%r12,4), %ymm1
	addq	$32, %r12
	vperm2i128	$32, %ymm0, %ymm2, %ymm4
	vperm2i128	$32, %ymm1, %ymm3, %ymm5
	vperm2i128	$49, %ymm0, %ymm2, %ymm0
	vperm2i128	$49, %ymm1, %ymm3, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm5
	vpunpcklqdq	%ymm1, %ymm0, %ymm3
	vpunpckhqdq	%ymm1, %ymm0, %ymm1
	vmovdqu	%ymm2, (%r9,%rbp)
	vmovdqu	%ymm5, (%r10,%rbp)
	vmovdqu	%ymm3, (%r11,%rbp)
	vmovdqu	%ymm1, (%rbx,%rbp)
	addq	$32, %rbp
L_shake128x4_squeeze3blocks$4:
	cmpq	$192, %r12
	jb  	L_shake128x4_squeeze3blocks$5
	jmp 	L_shake128x4_squeeze3blocks$2
L_shake128x4_squeeze3blocks$3:
	movq	(%r8,%r12,4), %r13
	movq	%r13, (%r9,%rbp)
	movq	8(%r8,%r12,4), %r13
	movq	%r13, (%r10,%rbp)
	movq	16(%r8,%r12,4), %r13
	movq	%r13, (%r11,%rbp)
	movq	24(%r8,%r12,4), %r13
	movq	%r13, (%rbx,%rbp)
	addq	$8, %r12
	addq	$8, %rbp
L_shake128x4_squeeze3blocks$2:
	cmpq	$200, %r12
	jb  	L_shake128x4_squeeze3blocks$3
	ret
L_shake128_next_state$1:
	leaq	336(%r10), %rbx
	call	L_keccakf1600_st25_avx2$1
L_shake128_next_state$2:
	ret
L_shake128x4_absorb_A32_A2$1:
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %r12
	jmp 	L_shake128x4_absorb_A32_A2$6
L_shake128x4_absorb_A32_A2$7:
	vmovdqu	%ymm0, (%r8,%r12)
	addq	$32, %r12
L_shake128x4_absorb_A32_A2$6:
	cmpq	$800, %r12
	jb  	L_shake128x4_absorb_A32_A2$7
	movq	$0, %rbp
	movq	$0, %r12
	jmp 	L_shake128x4_absorb_A32_A2$4
L_shake128x4_absorb_A32_A2$5:
	vpbroadcastq	(%rdx,%rbp), %ymm3
	addq	$8, %rbp
	vpxor	(%r8,%r12), %ymm3, %ymm3
	vmovdqu	%ymm3, (%r8,%r12)
	addq	$32, %r12
L_shake128x4_absorb_A32_A2$4:
	cmpq	$128, %r12
	jb  	L_shake128x4_absorb_A32_A2$5
	movq	%r11, %r10
	leaq	2(%r11), %rbx
	leaq	4(%r11), %r9
	leaq	6(%r11), %r11
	movq	$0, %rbp
	movq	$16, %r12
	jmp 	L_shake128x4_absorb_A32_A2$2
L_shake128x4_absorb_A32_A2$3:
	movq	(%r10,%rbp), %r13
	xorq	%r13, (%r8,%r12,8)
	movq	(%rbx,%rbp), %r13
	xorq	%r13, 8(%r8,%r12,8)
	movq	(%r9,%rbp), %r13
	xorq	%r13, 16(%r8,%r12,8)
	movq	(%r11,%rbp), %r13
	addq	$8, %rbp
	xorq	%r13, 24(%r8,%r12,8)
	addq	$4, %r12
L_shake128x4_absorb_A32_A2$2:
	cmpq	$16, %r12
	jb  	L_shake128x4_absorb_A32_A2$3
	movq	$0, %r13
	movzwq	(%r10,%rbp), %r10
	orq 	%r10, %r13
	movq	$31, %r10
	shlq	$16, %r10
	orq 	%r10, %r13
	xorq	%r13, (%r8,%r12,8)
	movq	$0, %r13
	movzwq	(%rbx,%rbp), %r10
	orq 	%r10, %r13
	movq	$31, %r10
	shlq	$16, %r10
	orq 	%r10, %r13
	xorq	%r13, 8(%r8,%r12,8)
	movq	$0, %r13
	movzwq	(%r9,%rbp), %r10
	orq 	%r10, %r13
	movq	$31, %r10
	shlq	$16, %r10
	orq 	%r10, %r13
	xorq	%r13, 16(%r8,%r12,8)
	movq	$0, %r13
	movzwq	(%r11,%rbp), %r10
	orq 	%r10, %r13
	movq	$31, %r10
	shlq	$16, %r10
	orq 	%r10, %r13
	xorq	%r13, 24(%r8,%r12,8)
	movq	$1, %r9
	shlq	$63, %r9
	movq	%r9, %xmm7
	vpbroadcastq	%xmm7, %ymm8
	vpxor	640(%r8), %ymm8, %ymm8
	vmovdqu	%ymm8, 640(%r8)
	ret
L_shake256x4_A128__A32_A1$1:
	leaq	32(%rsp), %r8
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %r12
	jmp 	L_shake256x4_A128__A32_A1$11
L_shake256x4_A128__A32_A1$12:
	vmovdqu	%ymm0, (%r8,%r12)
	addq	$32, %r12
L_shake256x4_A128__A32_A1$11:
	cmpq	$800, %r12
	jb  	L_shake256x4_A128__A32_A1$12
	movq	$0, %rax
	movq	$0, %r12
	jmp 	L_shake256x4_A128__A32_A1$9
L_shake256x4_A128__A32_A1$10:
	vpbroadcastq	(%rdi,%rax), %ymm3
	addq	$8, %rax
	vpxor	(%r8,%r12), %ymm3, %ymm3
	vmovdqu	%ymm3, (%r8,%r12)
	addq	$32, %r12
L_shake256x4_A128__A32_A1$9:
	cmpq	$128, %r12
	jb  	L_shake256x4_A128__A32_A1$10
	movq	%rdx, %r9
	leaq	1(%rdx), %rax
	leaq	2(%rdx), %rcx
	leaq	3(%rdx), %rdx
	movq	$0, %rbp
	movq	$16, %r12
	jmp 	L_shake256x4_A128__A32_A1$7
L_shake256x4_A128__A32_A1$8:
	movq	(%r9,%rbp), %r13
	xorq	%r13, (%r8,%r12,8)
	movq	(%rax,%rbp), %r13
	xorq	%r13, 8(%r8,%r12,8)
	movq	(%rcx,%rbp), %r13
	xorq	%r13, 16(%r8,%r12,8)
	movq	(%rdx,%rbp), %r13
	addq	$8, %rbp
	xorq	%r13, 24(%r8,%r12,8)
	addq	$4, %r12
L_shake256x4_A128__A32_A1$7:
	cmpq	$16, %r12
	jb  	L_shake256x4_A128__A32_A1$8
	movq	$0, %r13
	movzbq	(%r9,%rbp), %r9
	orq 	$7936, %r9
	orq 	%r9, %r13
	xorq	%r13, (%r8,%r12,8)
	movq	$0, %r13
	movzbq	(%rax,%rbp), %rax
	orq 	$7936, %rax
	orq 	%rax, %r13
	xorq	%r13, 8(%r8,%r12,8)
	movq	$0, %r13
	movzbq	(%rcx,%rbp), %rax
	orq 	$7936, %rax
	orq 	%rax, %r13
	xorq	%r13, 16(%r8,%r12,8)
	movq	$0, %r13
	movzbq	(%rdx,%rbp), %rax
	orq 	$7936, %rax
	orq 	%rax, %r13
	xorq	%r13, 24(%r8,%r12,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpbroadcastq	%xmm7, %ymm8
	vpxor	512(%r8), %ymm8, %ymm8
	vmovdqu	%ymm8, 512(%r8)
	movq	$0, %rax
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake256x4_A128__A32_A1$6:
	leaq	824(%rsp), %rsp
	movq	$0, %r12
	jmp 	L_shake256x4_A128__A32_A1$4
L_shake256x4_A128__A32_A1$5:
	vmovdqu	(%r8,%r12,4), %ymm2
	vmovdqu	32(%r8,%r12,4), %ymm3
	vmovdqu	64(%r8,%r12,4), %ymm0
	vmovdqu	96(%r8,%r12,4), %ymm1
	addq	$32, %r12
	vperm2i128	$32, %ymm0, %ymm2, %ymm4
	vperm2i128	$32, %ymm1, %ymm3, %ymm5
	vperm2i128	$49, %ymm0, %ymm2, %ymm0
	vperm2i128	$49, %ymm1, %ymm3, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm5
	vpunpcklqdq	%ymm1, %ymm0, %ymm3
	vpunpckhqdq	%ymm1, %ymm0, %ymm1
	vmovdqu	%ymm2, (%rsi,%rax)
	vmovdqu	%ymm5, (%r10,%rax)
	vmovdqu	%ymm3, (%r11,%rax)
	vmovdqu	%ymm1, (%rbx,%rax)
	addq	$32, %rax
L_shake256x4_A128__A32_A1$4:
	cmpq	$128, %r12
	jb  	L_shake256x4_A128__A32_A1$5
	jmp 	L_shake256x4_A128__A32_A1$2
L_shake256x4_A128__A32_A1$3:
	movq	(%r8,%r12,4), %r13
	movq	%r13, (%rsi,%rax)
	movq	8(%r8,%r12,4), %r13
	movq	%r13, (%r10,%rax)
	movq	16(%r8,%r12,4), %r13
	movq	%r13, (%r11,%rax)
	movq	24(%r8,%r12,4), %r13
	movq	%r13, (%rbx,%rax)
	addq	$8, %r12
	addq	$8, %rax
L_shake256x4_A128__A32_A1$2:
	cmpq	$128, %r12
	jb  	L_shake256x4_A128__A32_A1$3
	ret
L_shake256_A128__A32_A1$1:
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm6, %ymm6, %ymm6
	movq	$0, %rcx
	vpbroadcastq	(%rdi,%rcx), %ymm8
	vpxor	%ymm8, %ymm4, %ymm4
	vmovdqu	8(%rdi,%rcx), %xmm9
	movq	24(%rdi,%rcx), %rdx
	movq	%rdx, %xmm10
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm10, %xmm7
	vinserti128	$1, %xmm7, %ymm9, %ymm9
	vpxor	%ymm9, %ymm3, %ymm3
	movq	$0, %rcx
	vpxor	%ymm9, %ymm9, %ymm9
	vpxor	%xmm10, %xmm10, %xmm10
	movq	$0, %rdx
	movzbq	(%rax,%rcx), %rax
	orq 	$7936, %rax
	orq 	%rax, %rdx
	vpinsrq	$1, %rdx, %xmm10, %xmm7
	vinserti128	$1, %xmm7, %ymm9, %ymm9
	vpxor	%ymm9, %ymm3, %ymm3
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	$0, %rax
	movq	$0, %rdi
	jmp 	L_shake256_A128__A32_A1$3
L_shake256_A128__A32_A1$4:
	call	L_keccakf1600_avx2$1
L_shake256_A128__A32_A1$5:
	vmovdqu	%xmm4, %xmm9
	movq	%xmm9, (%rsi,%rax)
	vmovdqu	%ymm3, 8(%rsi,%rax)
	vmovdqu	%xmm5, %xmm9
	vextracti128	$1, %ymm5, %xmm7
	movq	%xmm7, %rdx
	movq	%rdx, 40(%rsi,%rax)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm6, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm6, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rsi,%rax)
	movq	%xmm9, %rdx
	movq	%rdx, 80(%rsi,%rax)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rsi,%rax)
	movq	%xmm7, %rdx
	movq	%rdx, 120(%rsi,%rax)
	vpblendd	$195, %ymm10, %ymm13, %ymm9
	movq	%xmm9, 128(%rsi,%rax)
	addq	$136, %rax
	incq	%rdi
L_shake256_A128__A32_A1$3:
	cmpq	$0, %rdi
	jb  	L_shake256_A128__A32_A1$4
	call	L_keccakf1600_avx2$1
L_shake256_A128__A32_A1$2:
	movq	%xmm4, (%rsi,%rax)
	vmovdqu	%ymm3, 8(%rsi,%rax)
	vmovdqu	%xmm5, %xmm9
	vextracti128	$1, %ymm5, %xmm7
	movq	%xmm7, %r8
	movq	%r8, 40(%rsi,%rax)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm1, %ymm6, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm3
	vmovdqu	%ymm3, 48(%rsi,%rax)
	movq	%xmm9, %rdx
	movq	%rdx, 80(%rsi,%rax)
	vpblendd	$195, %ymm12, %ymm8, %ymm3
	vmovdqu	%ymm3, 88(%rsi,%rax)
	movq	%xmm7, %rdx
	movq	%rdx, 120(%rsi,%rax)
	ret
L_sha3_512A_A64$1:
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm6, %ymm6, %ymm6
	movq	$0, %rax
	vpbroadcastq	(%rbp,%rax), %ymm8
	vpxor	%ymm8, %ymm4, %ymm4
	vmovdqu	8(%rbp,%rax), %ymm9
	vpxor	%ymm9, %ymm3, %ymm3
	movq	40(%rbp,%rax), %rdi
	movq	%rdi, %xmm7
	vmovdqu	48(%rbp,%rax), %xmm9
	movq	$0, %rdi
	movq	$6, %rax
	orq 	%rax, %rdi
	movq	%rdi, %xmm10
	movq	$0, %rdi
	vpinsrq	$1, %rdi, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm14
	movq	$0, %rdi
	movq	%rdi, %xmm8
	vpxor	%ymm13, %ymm13, %ymm13
	movq	$0, %rdi
	vpinsrq	$1, %rdi, %xmm7, %xmm7
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rdi
	vpinsrq	$1, %rdi, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm6, %ymm6
	vinserti128	$1, %xmm7, %ymm8, %ymm10
	vpxor	%ymm10, %ymm5, %ymm5
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm2, %ymm2
	movq	$0, %rax
	movq	$0, %rdi
	jmp 	L_sha3_512A_A64$3
L_sha3_512A_A64$4:
	call	L_keccakf1600_avx2$1
L_sha3_512A_A64$5:
	vmovdqu	%xmm4, %xmm9
	movq	%xmm9, (%rsi,%rax)
	vmovdqu	%ymm3, 8(%rsi,%rax)
	vextracti128	$1, %ymm5, %xmm7
	movq	%xmm7, %r8
	movq	%r8, 40(%rsi,%rax)
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm1, %ymm6, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm9
	vmovdqu	%xmm9, %xmm7
	vmovdqu	%xmm7, 48(%rsi,%rax)
	vextracti128	$1, %ymm9, %xmm9
	movq	%xmm9, 64(%rsi,%rax)
	addq	$72, %rax
	incq	%rdi
L_sha3_512A_A64$3:
	cmpq	$0, %rdi
	jb  	L_sha3_512A_A64$4
	call	L_keccakf1600_avx2$1
L_sha3_512A_A64$2:
	movq	%xmm4, (%rsi,%rax)
	vmovdqu	%ymm3, 8(%rsi,%rax)
	vextracti128	$1, %ymm5, %xmm7
	movq	%xmm7, %rdi
	movq	%rdi, 40(%rsi,%rax)
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm1, %ymm6, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm3
	vmovdqu	%xmm3, 48(%rsi,%rax)
	ret
L_sha3_512A_A33$1:
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm6, %ymm6, %ymm6
	movq	$0, %rax
	vpbroadcastq	(%rbp,%rax), %ymm8
	vpxor	%ymm8, %ymm4, %ymm4
	vmovdqu	8(%rbp,%rax), %xmm9
	movq	24(%rbp,%rax), %rdx
	movq	%rdx, %xmm10
	movq	$0, %rdx
	movzbq	32(%rbp,%rax), %rax
	orq 	$1536, %rax
	orq 	%rax, %rdx
	vpinsrq	$1, %rdx, %xmm10, %xmm7
	vinserti128	$1, %xmm7, %ymm9, %ymm9
	vpxor	%ymm9, %ymm3, %ymm3
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm2, %ymm2
	movq	$0, %rax
	movq	$0, %rdi
	jmp 	L_sha3_512A_A33$3
L_sha3_512A_A33$4:
	call	L_keccakf1600_avx2$1
L_sha3_512A_A33$5:
	vmovdqu	%xmm4, %xmm9
	movq	%xmm9, (%rsi,%rax)
	vmovdqu	%ymm3, 8(%rsi,%rax)
	vextracti128	$1, %ymm5, %xmm7
	movq	%xmm7, %rdx
	movq	%rdx, 40(%rsi,%rax)
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm1, %ymm6, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm9
	vmovdqu	%xmm9, %xmm7
	vmovdqu	%xmm7, 48(%rsi,%rax)
	vextracti128	$1, %ymm9, %xmm7
	movq	%xmm7, 64(%rsi,%rax)
	addq	$72, %rax
	incq	%rdi
L_sha3_512A_A33$3:
	cmpq	$0, %rdi
	jb  	L_sha3_512A_A33$4
	call	L_keccakf1600_avx2$1
L_sha3_512A_A33$2:
	movq	%xmm4, (%rsi,%rax)
	vmovdqu	%ymm3, 8(%rsi,%rax)
	vextracti128	$1, %ymm5, %xmm7
	movq	%xmm7, %rdx
	movq	%rdx, 40(%rsi,%rax)
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm1, %ymm6, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm3
	vmovdqu	%xmm3, 48(%rsi,%rax)
	ret
L_keccakf1600_avx2x4$1:
	leaq	glob_data + 4984(%rip), %r12
	leaq	32(%rsp), %r13
	vmovdqu	glob_data + 448(%rip), %ymm0
	vmovdqu	glob_data + 480(%rip), %ymm1
	movq	$0, %r14
	jmp 	L_keccakf1600_avx2x4$2
L_keccakf1600_avx2x4$3:
	vpbroadcastq	(%r12,%r14,8), %ymm2
	call	L_keccakf1600_4x_pround$1
L_keccakf1600_avx2x4$5:
	vpxor	(%r13), %ymm2, %ymm2
	vmovdqu	%ymm2, (%r13)
	xchg	%r8, %r13
	vpbroadcastq	8(%r12,%r14,8), %ymm2
	call	L_keccakf1600_4x_pround$1
L_keccakf1600_avx2x4$4:
	vpxor	(%r13), %ymm2, %ymm2
	vmovdqu	%ymm2, (%r13)
	xchg	%r13, %r8
	addq	$2, %r14
L_keccakf1600_avx2x4$2:
	cmpq	$24, %r14
	jb  	L_keccakf1600_avx2x4$3
	ret
L_keccakf1600_4x_pround$1:
	vmovdqu	(%r8), %ymm7
	vmovdqu	32(%r8), %ymm5
	vmovdqu	64(%r8), %ymm6
	vmovdqu	96(%r8), %ymm8
	vmovdqu	128(%r8), %ymm9
	vpxor	160(%r8), %ymm7, %ymm7
	vpxor	192(%r8), %ymm5, %ymm5
	vpxor	224(%r8), %ymm6, %ymm6
	vpxor	256(%r8), %ymm8, %ymm8
	vpxor	288(%r8), %ymm9, %ymm9
	vpxor	320(%r8), %ymm7, %ymm7
	vpxor	352(%r8), %ymm5, %ymm5
	vpxor	384(%r8), %ymm6, %ymm6
	vpxor	416(%r8), %ymm8, %ymm8
	vpxor	448(%r8), %ymm9, %ymm9
	vpxor	480(%r8), %ymm7, %ymm7
	vpxor	512(%r8), %ymm5, %ymm5
	vpxor	544(%r8), %ymm6, %ymm6
	vpxor	576(%r8), %ymm8, %ymm8
	vpxor	608(%r8), %ymm9, %ymm9
	vpxor	640(%r8), %ymm7, %ymm7
	vpxor	672(%r8), %ymm5, %ymm5
	vpxor	704(%r8), %ymm6, %ymm6
	vpxor	736(%r8), %ymm8, %ymm8
	vpxor	768(%r8), %ymm9, %ymm9
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
	vmovdqu	(%r8), %ymm8
	vpxor	%ymm3, %ymm8, %ymm8
	vmovdqu	192(%r8), %ymm9
	vpxor	%ymm4, %ymm9, %ymm9
	vpsllq	$44, %ymm9, %ymm10
	vpsrlq	$20, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	384(%r8), %ymm10
	vpxor	%ymm5, %ymm10, %ymm10
	vpsllq	$43, %ymm10, %ymm11
	vpsrlq	$21, %ymm10, %ymm10
	vpor	%ymm11, %ymm10, %ymm10
	vmovdqu	576(%r8), %ymm11
	vpxor	%ymm6, %ymm11, %ymm11
	vpsllq	$21, %ymm11, %ymm12
	vpsrlq	$43, %ymm11, %ymm11
	vpor	%ymm12, %ymm11, %ymm11
	vmovdqu	768(%r8), %ymm12
	vpxor	%ymm7, %ymm12, %ymm12
	vpsllq	$14, %ymm12, %ymm13
	vpsrlq	$50, %ymm12, %ymm12
	vpor	%ymm13, %ymm12, %ymm12
	vpandn	%ymm10, %ymm9, %ymm13
	vpxor	%ymm8, %ymm13, %ymm13
	vmovdqu	%ymm13, (%r13)
	vpandn	%ymm11, %ymm10, %ymm13
	vpxor	%ymm9, %ymm13, %ymm13
	vmovdqu	%ymm13, 32(%r13)
	vpandn	%ymm12, %ymm11, %ymm13
	vpxor	%ymm10, %ymm13, %ymm10
	vmovdqu	%ymm10, 64(%r13)
	vpandn	%ymm8, %ymm12, %ymm10
	vpxor	%ymm11, %ymm10, %ymm10
	vmovdqu	%ymm10, 96(%r13)
	vpandn	%ymm9, %ymm8, %ymm8
	vpxor	%ymm12, %ymm8, %ymm8
	vmovdqu	%ymm8, 128(%r13)
	vmovdqu	96(%r8), %ymm8
	vpxor	%ymm6, %ymm8, %ymm8
	vpsllq	$28, %ymm8, %ymm9
	vpsrlq	$36, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm8
	vmovdqu	288(%r8), %ymm9
	vpxor	%ymm7, %ymm9, %ymm9
	vpsllq	$20, %ymm9, %ymm10
	vpsrlq	$44, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	320(%r8), %ymm10
	vpxor	%ymm3, %ymm10, %ymm10
	vpsllq	$3, %ymm10, %ymm11
	vpsrlq	$61, %ymm10, %ymm10
	vpor	%ymm11, %ymm10, %ymm10
	vmovdqu	512(%r8), %ymm11
	vpxor	%ymm4, %ymm11, %ymm11
	vpsllq	$45, %ymm11, %ymm12
	vpsrlq	$19, %ymm11, %ymm11
	vpor	%ymm12, %ymm11, %ymm11
	vmovdqu	704(%r8), %ymm12
	vpxor	%ymm5, %ymm12, %ymm12
	vpsllq	$61, %ymm12, %ymm13
	vpsrlq	$3, %ymm12, %ymm12
	vpor	%ymm13, %ymm12, %ymm12
	vpandn	%ymm10, %ymm9, %ymm13
	vpxor	%ymm8, %ymm13, %ymm13
	vmovdqu	%ymm13, 160(%r13)
	vpandn	%ymm11, %ymm10, %ymm13
	vpxor	%ymm9, %ymm13, %ymm13
	vmovdqu	%ymm13, 192(%r13)
	vpandn	%ymm12, %ymm11, %ymm13
	vpxor	%ymm10, %ymm13, %ymm10
	vmovdqu	%ymm10, 224(%r13)
	vpandn	%ymm8, %ymm12, %ymm10
	vpxor	%ymm11, %ymm10, %ymm10
	vmovdqu	%ymm10, 256(%r13)
	vpandn	%ymm9, %ymm8, %ymm8
	vpxor	%ymm12, %ymm8, %ymm8
	vmovdqu	%ymm8, 288(%r13)
	vmovdqu	32(%r8), %ymm8
	vpxor	%ymm4, %ymm8, %ymm8
	vpsllq	$1, %ymm8, %ymm9
	vpsrlq	$63, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm8
	vmovdqu	224(%r8), %ymm9
	vpxor	%ymm5, %ymm9, %ymm9
	vpsllq	$6, %ymm9, %ymm10
	vpsrlq	$58, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	416(%r8), %ymm10
	vpxor	%ymm6, %ymm10, %ymm10
	vpsllq	$25, %ymm10, %ymm11
	vpsrlq	$39, %ymm10, %ymm10
	vpor	%ymm11, %ymm10, %ymm10
	vmovdqu	608(%r8), %ymm11
	vpxor	%ymm7, %ymm11, %ymm11
	vpshufb	%ymm0, %ymm11, %ymm11
	vmovdqu	640(%r8), %ymm12
	vpxor	%ymm3, %ymm12, %ymm12
	vpsllq	$18, %ymm12, %ymm13
	vpsrlq	$46, %ymm12, %ymm12
	vpor	%ymm13, %ymm12, %ymm12
	vpandn	%ymm10, %ymm9, %ymm13
	vpxor	%ymm8, %ymm13, %ymm13
	vmovdqu	%ymm13, 320(%r13)
	vpandn	%ymm11, %ymm10, %ymm13
	vpxor	%ymm9, %ymm13, %ymm13
	vmovdqu	%ymm13, 352(%r13)
	vpandn	%ymm12, %ymm11, %ymm13
	vpxor	%ymm10, %ymm13, %ymm10
	vmovdqu	%ymm10, 384(%r13)
	vpandn	%ymm8, %ymm12, %ymm10
	vpxor	%ymm11, %ymm10, %ymm10
	vmovdqu	%ymm10, 416(%r13)
	vpandn	%ymm9, %ymm8, %ymm8
	vpxor	%ymm12, %ymm8, %ymm8
	vmovdqu	%ymm8, 448(%r13)
	vmovdqu	128(%r8), %ymm8
	vpxor	%ymm7, %ymm8, %ymm8
	vpsllq	$27, %ymm8, %ymm9
	vpsrlq	$37, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm8
	vmovdqu	160(%r8), %ymm9
	vpxor	%ymm3, %ymm9, %ymm9
	vpsllq	$36, %ymm9, %ymm10
	vpsrlq	$28, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	352(%r8), %ymm10
	vpxor	%ymm4, %ymm10, %ymm10
	vpsllq	$10, %ymm10, %ymm11
	vpsrlq	$54, %ymm10, %ymm10
	vpor	%ymm11, %ymm10, %ymm10
	vmovdqu	544(%r8), %ymm11
	vpxor	%ymm5, %ymm11, %ymm11
	vpsllq	$15, %ymm11, %ymm12
	vpsrlq	$49, %ymm11, %ymm11
	vpor	%ymm12, %ymm11, %ymm11
	vmovdqu	736(%r8), %ymm12
	vpxor	%ymm6, %ymm12, %ymm12
	vpshufb	%ymm1, %ymm12, %ymm12
	vpandn	%ymm10, %ymm9, %ymm13
	vpxor	%ymm8, %ymm13, %ymm13
	vmovdqu	%ymm13, 480(%r13)
	vpandn	%ymm11, %ymm10, %ymm13
	vpxor	%ymm9, %ymm13, %ymm13
	vmovdqu	%ymm13, 512(%r13)
	vpandn	%ymm12, %ymm11, %ymm13
	vpxor	%ymm10, %ymm13, %ymm10
	vmovdqu	%ymm10, 544(%r13)
	vpandn	%ymm8, %ymm12, %ymm10
	vpxor	%ymm11, %ymm10, %ymm10
	vmovdqu	%ymm10, 576(%r13)
	vpandn	%ymm9, %ymm8, %ymm8
	vpxor	%ymm12, %ymm8, %ymm8
	vmovdqu	%ymm8, 608(%r13)
	vmovdqu	64(%r8), %ymm8
	vpxor	%ymm5, %ymm8, %ymm5
	vpsllq	$62, %ymm5, %ymm8
	vpsrlq	$2, %ymm5, %ymm5
	vpor	%ymm8, %ymm5, %ymm5
	vmovdqu	256(%r8), %ymm8
	vpxor	%ymm6, %ymm8, %ymm6
	vpsllq	$55, %ymm6, %ymm8
	vpsrlq	$9, %ymm6, %ymm6
	vpor	%ymm8, %ymm6, %ymm6
	vmovdqu	448(%r8), %ymm8
	vpxor	%ymm7, %ymm8, %ymm7
	vpsllq	$39, %ymm7, %ymm8
	vpsrlq	$25, %ymm7, %ymm7
	vpor	%ymm8, %ymm7, %ymm7
	vmovdqu	480(%r8), %ymm8
	vpxor	%ymm3, %ymm8, %ymm3
	vpsllq	$41, %ymm3, %ymm8
	vpsrlq	$23, %ymm3, %ymm3
	vpor	%ymm8, %ymm3, %ymm3
	vmovdqu	672(%r8), %ymm8
	vpxor	%ymm4, %ymm8, %ymm4
	vpsllq	$2, %ymm4, %ymm8
	vpsrlq	$62, %ymm4, %ymm4
	vpor	%ymm8, %ymm4, %ymm4
	vpandn	%ymm7, %ymm6, %ymm8
	vpxor	%ymm5, %ymm8, %ymm8
	vmovdqu	%ymm8, 640(%r13)
	vpandn	%ymm3, %ymm7, %ymm8
	vpxor	%ymm6, %ymm8, %ymm8
	vmovdqu	%ymm8, 672(%r13)
	vpandn	%ymm4, %ymm3, %ymm8
	vpxor	%ymm7, %ymm8, %ymm7
	vmovdqu	%ymm7, 704(%r13)
	vpandn	%ymm5, %ymm4, %ymm7
	vpxor	%ymm3, %ymm7, %ymm3
	vmovdqu	%ymm3, 736(%r13)
	vpandn	%ymm6, %ymm5, %ymm3
	vpxor	%ymm4, %ymm3, %ymm3
	vmovdqu	%ymm3, 768(%r13)
	ret
L_keccakf1600_st25_avx2$1:
	vpbroadcastq	(%rbx), %ymm4
	vmovdqu	8(%rbx), %ymm3
	vmovq	40(%rbx), %xmm9
	vmovdqu	48(%rbx), %ymm0
	vmovq	80(%rbx), %xmm7
	vmovdqu	88(%rbx), %ymm2
	movq	120(%rbx), %r12
	vpinsrq	$1, %r12, %xmm9, %xmm9
	vmovdqu	128(%rbx), %ymm1
	movq	160(%rbx), %r12
	vpinsrq	$1, %r12, %xmm7, %xmm7
	vinserti128	$1, %xmm9, %ymm7, %ymm5
	vmovdqu	168(%rbx), %ymm6
	vpblendd	$195, %ymm1, %ymm0, %ymm10
	vpblendd	$195, %ymm2, %ymm6, %ymm12
	vpblendd	$195, %ymm0, %ymm2, %ymm13
	vpblendd	$240, %ymm12, %ymm10, %ymm0
	vpblendd	$240, %ymm10, %ymm12, %ymm2
	vpblendd	$195, %ymm6, %ymm1, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm1
	vpblendd	$240, %ymm10, %ymm13, %ymm6
	call	L__keccakf1600_avx2$1
L_keccakf1600_st25_avx2$2:
	vmovlpd	%xmm4, (%rbx)
	vmovdqu	%ymm3, 8(%rbx)
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm6, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm6, %ymm8
	vextracti128	$1, %ymm5, %xmm7
	vmovlpd	%xmm7, 40(%rbx)
	vpblendd	$195, %ymm8, %ymm10, %ymm0
	vmovdqu	%ymm0, 48(%rbx)
	vmovlpd	%xmm5, 80(%rbx)
	vpblendd	$195, %ymm12, %ymm8, %ymm0
	vmovdqu	%ymm0, 88(%rbx)
	vmovhpd	%xmm7, 120(%rbx)
	vpblendd	$195, %ymm10, %ymm13, %ymm0
	vmovdqu	%ymm0, 128(%rbx)
	vmovhpd	%xmm5, 160(%rbx)
	vpblendd	$195, %ymm13, %ymm12, %ymm0
	vmovdqu	%ymm0, 168(%rbx)
	ret
L_keccakf1600_avx2$1:
	call	L__keccakf1600_avx2$1
L_keccakf1600_avx2$2:
	ret
L__keccakf1600_avx2$1:
	leaq	glob_data + 4984(%rip), %r11
	movq	$0, %r12
L__keccakf1600_avx2$2:
	vpshufd	$78, %ymm5, %ymm7
	vpxor	%ymm0, %ymm1, %ymm8
	vpxor	%ymm6, %ymm2, %ymm9
	vpxor	%ymm3, %ymm8, %ymm8
	vpxor	%ymm9, %ymm8, %ymm8
	vpermq	$147, %ymm8, %ymm10
	vpxor	%ymm5, %ymm7, %ymm7
	vpermq	$78, %ymm7, %ymm11
	vpsrlq	$63, %ymm8, %ymm9
	vpaddq	%ymm8, %ymm8, %ymm8
	vpor	%ymm8, %ymm9, %ymm9
	vpermq	$57, %ymm9, %ymm8
	vpxor	%ymm10, %ymm9, %ymm9
	vpermq	$0, %ymm9, %ymm9
	vpxor	%ymm4, %ymm7, %ymm7
	vpxor	%ymm11, %ymm7, %ymm7
	vpsrlq	$63, %ymm7, %ymm11
	vpaddq	%ymm7, %ymm7, %ymm14
	vpor	%ymm11, %ymm14, %ymm14
	vpxor	%ymm9, %ymm5, %ymm5
	vpxor	%ymm9, %ymm4, %ymm4
	vpblendd	$192, %ymm14, %ymm8, %ymm8
	vpblendd	$3, %ymm7, %ymm10, %ymm10
	vpxor	%ymm10, %ymm8, %ymm8
	vpsllvq	glob_data + 704(%rip), %ymm5, %ymm10
	vpsrlvq	glob_data + 512(%rip), %ymm5, %ymm5
	vpor	%ymm10, %ymm5, %ymm5
	vpxor	%ymm8, %ymm0, %ymm0
	vpsllvq	glob_data + 768(%rip), %ymm0, %ymm10
	vpsrlvq	glob_data + 576(%rip), %ymm0, %ymm0
	vpor	%ymm10, %ymm0, %ymm0
	vpxor	%ymm8, %ymm2, %ymm2
	vpsllvq	glob_data + 800(%rip), %ymm2, %ymm7
	vpsrlvq	glob_data + 608(%rip), %ymm2, %ymm2
	vpor	%ymm7, %ymm2, %ymm2
	vpxor	%ymm8, %ymm1, %ymm1
	vpsllvq	glob_data + 832(%rip), %ymm1, %ymm11
	vpsrlvq	glob_data + 640(%rip), %ymm1, %ymm1
	vpor	%ymm11, %ymm1, %ymm1
	vpxor	%ymm8, %ymm6, %ymm6
	vpermq	$141, %ymm5, %ymm10
	vpermq	$141, %ymm0, %ymm11
	vpsllvq	glob_data + 864(%rip), %ymm6, %ymm12
	vpsrlvq	glob_data + 672(%rip), %ymm6, %ymm7
	vpor	%ymm12, %ymm7, %ymm7
	vpxor	%ymm8, %ymm3, %ymm3
	vpermq	$27, %ymm2, %ymm8
	vpermq	$114, %ymm1, %ymm2
	vpsllvq	glob_data + 736(%rip), %ymm3, %ymm0
	vpsrlvq	glob_data + 544(%rip), %ymm3, %ymm5
	vpor	%ymm0, %ymm5, %ymm9
	vpsrldq	$8, %ymm7, %ymm12
	vpandn	%ymm12, %ymm7, %ymm6
	vpblendd	$12, %ymm2, %ymm9, %ymm0
	vpblendd	$12, %ymm9, %ymm11, %ymm1
	vpblendd	$12, %ymm11, %ymm10, %ymm3
	vpblendd	$12, %ymm10, %ymm9, %ymm12
	vpblendd	$48, %ymm11, %ymm0, %ymm0
	vpblendd	$48, %ymm8, %ymm1, %ymm1
	vpblendd	$48, %ymm9, %ymm3, %ymm3
	vpblendd	$48, %ymm2, %ymm12, %ymm12
	vpblendd	$192, %ymm8, %ymm0, %ymm0
	vpblendd	$192, %ymm2, %ymm1, %ymm1
	vpblendd	$192, %ymm2, %ymm3, %ymm3
	vpblendd	$192, %ymm11, %ymm12, %ymm12
	vpandn	%ymm1, %ymm0, %ymm0
	vpandn	%ymm12, %ymm3, %ymm1
	vpblendd	$12, %ymm9, %ymm8, %ymm12
	vpblendd	$12, %ymm8, %ymm10, %ymm3
	vpxor	%ymm10, %ymm0, %ymm0
	vpblendd	$48, %ymm10, %ymm12, %ymm12
	vpblendd	$48, %ymm11, %ymm3, %ymm3
	vpxor	%ymm8, %ymm1, %ymm1
	vpblendd	$192, %ymm11, %ymm12, %ymm12
	vpblendd	$192, %ymm9, %ymm3, %ymm3
	vpandn	%ymm3, %ymm12, %ymm12
	vpxor	%ymm2, %ymm12, %ymm12
	vpermq	$30, %ymm7, %ymm3
	vpblendd	$48, %ymm4, %ymm3, %ymm3
	vpermq	$57, %ymm7, %ymm5
	vpblendd	$192, %ymm4, %ymm5, %ymm5
	vpandn	%ymm3, %ymm5, %ymm3
	vpblendd	$12, %ymm8, %ymm11, %ymm5
	vpblendd	$12, %ymm11, %ymm2, %ymm14
	vpblendd	$48, %ymm2, %ymm5, %ymm5
	vpblendd	$48, %ymm10, %ymm14, %ymm14
	vpblendd	$192, %ymm10, %ymm5, %ymm5
	vpblendd	$192, %ymm8, %ymm14, %ymm14
	vpandn	%ymm14, %ymm5, %ymm5
	vpxor	%ymm9, %ymm5, %ymm5
	vpermq	$0, %ymm6, %ymm15
	vpermq	$27, %ymm0, %ymm0
	vpermq	$141, %ymm1, %ymm1
	vpermq	$114, %ymm12, %ymm6
	vpblendd	$12, %ymm10, %ymm2, %ymm12
	vpblendd	$12, %ymm2, %ymm8, %ymm14
	vpblendd	$48, %ymm8, %ymm12, %ymm2
	vpblendd	$48, %ymm9, %ymm14, %ymm12
	vpblendd	$192, %ymm9, %ymm2, %ymm2
	vpblendd	$192, %ymm10, %ymm12, %ymm12
	vpandn	%ymm12, %ymm2, %ymm2
	vpxor	%ymm15, %ymm4, %ymm4
	vpxor	%ymm7, %ymm3, %ymm3
	vpxor	%ymm11, %ymm2, %ymm2
	vpbroadcastq	(%r11,%r12,8), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	incq	%r12
	cmpq	$24, %r12
	jb  	L__keccakf1600_avx2$2
	ret
L_nttunpack$1:
	vmovdqu	(%rsi), %ymm3
	vmovdqu	32(%rsi), %ymm5
	vmovdqu	64(%rsi), %ymm7
	vmovdqu	96(%rsi), %ymm9
	vmovdqu	128(%rsi), %ymm1
	vmovdqu	160(%rsi), %ymm6
	vmovdqu	192(%rsi), %ymm8
	vmovdqu	224(%rsi), %ymm10
	vperm2i128	$32, %ymm1, %ymm3, %ymm2
	vperm2i128	$49, %ymm1, %ymm3, %ymm3
	vperm2i128	$32, %ymm6, %ymm5, %ymm4
	vperm2i128	$49, %ymm6, %ymm5, %ymm5
	vperm2i128	$32, %ymm8, %ymm7, %ymm1
	vperm2i128	$49, %ymm8, %ymm7, %ymm6
	vperm2i128	$32, %ymm10, %ymm9, %ymm8
	vperm2i128	$49, %ymm10, %ymm9, %ymm13
	vpunpcklqdq	%ymm1, %ymm2, %ymm7
	vpunpckhqdq	%ymm1, %ymm2, %ymm9
	vpunpcklqdq	%ymm6, %ymm3, %ymm10
	vpunpckhqdq	%ymm6, %ymm3, %ymm11
	vpunpcklqdq	%ymm8, %ymm4, %ymm2
	vpunpckhqdq	%ymm8, %ymm4, %ymm1
	vpunpcklqdq	%ymm13, %ymm5, %ymm6
	vpunpckhqdq	%ymm13, %ymm5, %ymm5
	vmovsldup	%ymm2, %ymm15
	vpblendd	$170, %ymm15, %ymm7, %ymm4
	vpsrlq	$32, %ymm7, %ymm3
	vpblendd	$170, %ymm2, %ymm3, %ymm2
	vmovsldup	%ymm1, %ymm15
	vpblendd	$170, %ymm15, %ymm9, %ymm3
	vpsrlq	$32, %ymm9, %ymm7
	vpblendd	$170, %ymm1, %ymm7, %ymm7
	vmovsldup	%ymm6, %ymm15
	vpblendd	$170, %ymm15, %ymm10, %ymm1
	vpsrlq	$32, %ymm10, %ymm9
	vpblendd	$170, %ymm6, %ymm9, %ymm6
	vmovsldup	%ymm5, %ymm15
	vpblendd	$170, %ymm15, %ymm11, %ymm8
	vpsrlq	$32, %ymm11, %ymm9
	vpblendd	$170, %ymm5, %ymm9, %ymm5
	vpslld	$16, %ymm1, %ymm11
	vpblendw	$170, %ymm11, %ymm4, %ymm0
	vpsrld	$16, %ymm4, %ymm9
	vpblendw	$170, %ymm1, %ymm9, %ymm1
	vpslld	$16, %ymm6, %ymm11
	vpblendw	$170, %ymm11, %ymm2, %ymm10
	vpsrld	$16, %ymm2, %ymm9
	vpblendw	$170, %ymm6, %ymm9, %ymm13
	vpslld	$16, %ymm8, %ymm2
	vpblendw	$170, %ymm2, %ymm3, %ymm2
	vpsrld	$16, %ymm3, %ymm3
	vpblendw	$170, %ymm8, %ymm3, %ymm8
	vpslld	$16, %ymm5, %ymm6
	vpblendw	$170, %ymm6, %ymm7, %ymm3
	vpsrld	$16, %ymm7, %ymm7
	vpblendw	$170, %ymm5, %ymm7, %ymm4
	vmovdqu	%ymm0, (%rsi)
	vmovdqu	%ymm1, 32(%rsi)
	vmovdqu	%ymm10, 64(%rsi)
	vmovdqu	%ymm13, 96(%rsi)
	vmovdqu	%ymm2, 128(%rsi)
	vmovdqu	%ymm8, 160(%rsi)
	vmovdqu	%ymm3, 192(%rsi)
	vmovdqu	%ymm4, 224(%rsi)
	vmovdqu	256(%rsi), %ymm2
	vmovdqu	288(%rsi), %ymm3
	vmovdqu	320(%rsi), %ymm4
	vmovdqu	352(%rsi), %ymm7
	vmovdqu	384(%rsi), %ymm1
	vmovdqu	416(%rsi), %ymm5
	vmovdqu	448(%rsi), %ymm6
	vmovdqu	480(%rsi), %ymm10
	vperm2i128	$32, %ymm1, %ymm2, %ymm0
	vperm2i128	$49, %ymm1, %ymm2, %ymm2
	vperm2i128	$32, %ymm5, %ymm3, %ymm1
	vperm2i128	$49, %ymm5, %ymm3, %ymm8
	vperm2i128	$32, %ymm6, %ymm4, %ymm5
	vperm2i128	$49, %ymm6, %ymm4, %ymm12
	vperm2i128	$32, %ymm10, %ymm7, %ymm6
	vperm2i128	$49, %ymm10, %ymm7, %ymm10
	vpunpcklqdq	%ymm5, %ymm0, %ymm3
	vpunpckhqdq	%ymm5, %ymm0, %ymm4
	vpunpcklqdq	%ymm12, %ymm2, %ymm5
	vpunpckhqdq	%ymm12, %ymm2, %ymm7
	vpunpcklqdq	%ymm6, %ymm1, %ymm2
	vpunpckhqdq	%ymm6, %ymm1, %ymm1
	vpunpcklqdq	%ymm10, %ymm8, %ymm6
	vpunpckhqdq	%ymm10, %ymm8, %ymm8
	vmovsldup	%ymm2, %ymm11
	vpblendd	$170, %ymm11, %ymm3, %ymm9
	vpsrlq	$32, %ymm3, %ymm3
	vpblendd	$170, %ymm2, %ymm3, %ymm2
	vmovsldup	%ymm1, %ymm11
	vpblendd	$170, %ymm11, %ymm4, %ymm3
	vpsrlq	$32, %ymm4, %ymm4
	vpblendd	$170, %ymm1, %ymm4, %ymm4
	vmovsldup	%ymm6, %ymm11
	vpblendd	$170, %ymm11, %ymm5, %ymm1
	vpsrlq	$32, %ymm5, %ymm5
	vpblendd	$170, %ymm6, %ymm5, %ymm5
	vmovsldup	%ymm8, %ymm6
	vpblendd	$170, %ymm6, %ymm7, %ymm6
	vpsrlq	$32, %ymm7, %ymm7
	vpblendd	$170, %ymm8, %ymm7, %ymm7
	vpslld	$16, %ymm1, %ymm11
	vpblendw	$170, %ymm11, %ymm9, %ymm0
	vpsrld	$16, %ymm9, %ymm8
	vpblendw	$170, %ymm1, %ymm8, %ymm1
	vpslld	$16, %ymm5, %ymm11
	vpblendw	$170, %ymm11, %ymm2, %ymm10
	vpsrld	$16, %ymm2, %ymm8
	vpblendw	$170, %ymm5, %ymm8, %ymm13
	vpslld	$16, %ymm6, %ymm2
	vpblendw	$170, %ymm2, %ymm3, %ymm2
	vpsrld	$16, %ymm3, %ymm3
	vpblendw	$170, %ymm6, %ymm3, %ymm8
	vpslld	$16, %ymm7, %ymm6
	vpblendw	$170, %ymm6, %ymm4, %ymm3
	vpsrld	$16, %ymm4, %ymm9
	vpblendw	$170, %ymm7, %ymm9, %ymm4
	vmovdqu	%ymm0, 256(%rsi)
	vmovdqu	%ymm1, 288(%rsi)
	vmovdqu	%ymm10, 320(%rsi)
	vmovdqu	%ymm13, 352(%rsi)
	vmovdqu	%ymm2, 384(%rsi)
	vmovdqu	%ymm8, 416(%rsi)
	vmovdqu	%ymm3, 448(%rsi)
	vmovdqu	%ymm4, 480(%rsi)
	ret
	.data
	.p2align	5
_glob_data:
glob_data:
G$sample_q:
	.byte	  1,  13,   1,  13,   1,  13,   1,  13,   1,  13,   1,  13,   1,  13,   1,  13
	.byte	  1,  13,   1,  13,   1,  13,   1,  13,   1,  13,   1,  13,   1,  13,   1,  13
G$sample_mask:
	.byte	255,  15, 255,  15, 255,  15, 255,  15, 255,  15, 255,  15, 255,  15, 255,  15
	.byte	255,  15, 255,  15, 255,  15, 255,  15, 255,  15, 255,  15, 255,  15, 255,  15
G$sample_ones:
	.byte	  1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1
	.byte	  1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1
G$sample_load_shuffle:
	.byte	  0,   1,   1,   2,   3,   4,   4,   5,   6,   7,   7,   8,   9,  10,  10,  11
	.byte	  4,   5,   5,   6,   7,   8,   8,   9,  10,  11,  11,  12,  13,  14,  14,  15
G$pvc_shufbidx_s:
	.byte	  0,   1,   2,   3,   4,   5,   6,   7,   8,   9,  10, 255, 255, 255, 255, 255
	.byte	  5,   6,   7,   8,   9,  10, 255, 255, 255, 255,   0,   0,   1,   2,   3,   4
G$pvc_srlvqidx:
	.byte	 10,   0,   0,   0,   0,   0,   0,   0,  30,   0,   0,   0,   0,   0,   0,   0
	.byte	 10,   0,   0,   0,   0,   0,   0,   0,  30,   0,   0,   0,   0,   0,   0,   0
G$pvd_shift_s:
	.byte	 32,   0,   4,   0,   1,   0,  32,   0,   8,   0,   1,   0,  32,   0,   4,   0
	.byte	 32,   0,   4,   0,   1,   0,  32,   0,   8,   0,   1,   0,  32,   0,   4,   0
G$pvd_srlvqidx_s:
	.byte	  0,   0,   0,   0,   0,   0,   0,   0,   2,   0,   0,   0,   0,   0,   0,   0
	.byte	  0,   0,   0,   0,   0,   0,   0,   0,   2,   0,   0,   0,   0,   0,   0,   0
G$pvd_srlvdidx_s:
	.byte	  0,   0,   0,   0,   1,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0
	.byte	  0,   0,   0,   0,   1,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0
G$pvd_shufbidx_s:
	.byte	  0,   1,   1,   2,   2,   3,   4,   5,   5,   6,   6,   7,   8,   9,   9,  10
	.byte	  3,   4,   4,   5,   5,   6,   7,   8,   8,   9,   9,  10,  11,  12,  12,  13
G$pd_shift_s:
	.byte	  0,   4,  32,   0,   0,   1,   8,   0,  64,   0,   0,   2,  16,   0, 128,   0
	.byte	  0,   4,  32,   0,   0,   1,   8,   0,  64,   0,   0,   2,  16,   0, 128,   0
G$pd_mask_s:
	.byte	 31,   0, 224,   3, 124,   0, 128,  15, 240,   1,  62,   0, 192,   7, 248,   0
	.byte	 31,   0, 224,   3, 124,   0, 128,  15, 240,   1,  62,   0, 192,   7, 248,   0
G$pd_jshufbidx:
	.byte	  0,   0,   0,   1,   1,   1,   1,   2,   2,   3,   3,   3,   3,   4,   4,   4
	.byte	  5,   5,   5,   6,   6,   6,   6,   7,   7,   8,   8,   8,   8,   9,   9,   9
G$pc_shufbidx_s:
	.byte	  0,   1,   2,   3,   4, 255, 255, 255, 255, 255,   8,   9,  10,  11,  12, 255
	.byte	  9,  10,  11,  12, 255,   0,   1,   2,   3,   4, 255, 255, 255, 255, 255,   8
G$ROL8:
	.byte	  7,   0,   1,   2,   3,   4,   5,   6,  15,   8,   9,  10,  11,  12,  13,  14
	.byte	 23,  16,  17,  18,  19,  20,  21,  22,  31,  24,  25,  26,  27,  28,  29,  30
G$ROL56:
	.byte	  1,   2,   3,   4,   5,   6,   7,   0,   9,  10,  11,  12,  13,  14,  15,   8
	.byte	 17,  18,  19,  20,  21,  22,  23,  16,  25,  26,  27,  28,  29,  30,  31,  24
G$KECCAK_RHOTATES_RIGHT:
	.byte	 61,   0,   0,   0,   0,   0,   0,   0,  46,   0,   0,   0,   0,   0,   0,   0
	.byte	 28,   0,   0,   0,   0,   0,   0,   0,  23,   0,   0,   0,   0,   0,   0,   0
	.byte	 63,   0,   0,   0,   0,   0,   0,   0,   2,   0,   0,   0,   0,   0,   0,   0
	.byte	 36,   0,   0,   0,   0,   0,   0,   0,  37,   0,   0,   0,   0,   0,   0,   0
	.byte	 19,   0,   0,   0,   0,   0,   0,   0,  58,   0,   0,   0,   0,   0,   0,   0
	.byte	  8,   0,   0,   0,   0,   0,   0,   0,  25,   0,   0,   0,   0,   0,   0,   0
	.byte	 54,   0,   0,   0,   0,   0,   0,   0,   3,   0,   0,   0,   0,   0,   0,   0
	.byte	  9,   0,   0,   0,   0,   0,   0,   0,  56,   0,   0,   0,   0,   0,   0,   0
	.byte	 62,   0,   0,   0,   0,   0,   0,   0,  49,   0,   0,   0,   0,   0,   0,   0
	.byte	 39,   0,   0,   0,   0,   0,   0,   0,  44,   0,   0,   0,   0,   0,   0,   0
	.byte	 20,   0,   0,   0,   0,   0,   0,   0,  21,   0,   0,   0,   0,   0,   0,   0
	.byte	 43,   0,   0,   0,   0,   0,   0,   0,  50,   0,   0,   0,   0,   0,   0,   0
G$KECCAK_RHOTATES_LEFT:
	.byte	  3,   0,   0,   0,   0,   0,   0,   0,  18,   0,   0,   0,   0,   0,   0,   0
	.byte	 36,   0,   0,   0,   0,   0,   0,   0,  41,   0,   0,   0,   0,   0,   0,   0
	.byte	  1,   0,   0,   0,   0,   0,   0,   0,  62,   0,   0,   0,   0,   0,   0,   0
	.byte	 28,   0,   0,   0,   0,   0,   0,   0,  27,   0,   0,   0,   0,   0,   0,   0
	.byte	 45,   0,   0,   0,   0,   0,   0,   0,   6,   0,   0,   0,   0,   0,   0,   0
	.byte	 56,   0,   0,   0,   0,   0,   0,   0,  39,   0,   0,   0,   0,   0,   0,   0
	.byte	 10,   0,   0,   0,   0,   0,   0,   0,  61,   0,   0,   0,   0,   0,   0,   0
	.byte	 55,   0,   0,   0,   0,   0,   0,   0,   8,   0,   0,   0,   0,   0,   0,   0
	.byte	  2,   0,   0,   0,   0,   0,   0,   0,  15,   0,   0,   0,   0,   0,   0,   0
	.byte	 25,   0,   0,   0,   0,   0,   0,   0,  20,   0,   0,   0,   0,   0,   0,   0
	.byte	 44,   0,   0,   0,   0,   0,   0,   0,  43,   0,   0,   0,   0,   0,   0,   0
	.byte	 21,   0,   0,   0,   0,   0,   0,   0,  14,   0,   0,   0,   0,   0,   0,   0
G$jdmontx16:
	.byte	 73,   5,  73,   5,  73,   5,  73,   5,  73,   5,  73,   5,  73,   5,  73,   5
	.byte	 73,   5,  73,   5,  73,   5,  73,   5,  73,   5,  73,   5,  73,   5,  73,   5
G$hhqx16:
	.byte	 64,   3,  64,   3,  64,   3,  64,   3,  64,   3,  64,   3,  64,   3,  64,   3
	.byte	 64,   3,  64,   3,  64,   3,  64,   3,  64,   3,  64,   3,  64,   3,  64,   3
G$hqx16_m1:
	.byte	128,   6, 128,   6, 128,   6, 128,   6, 128,   6, 128,   6, 128,   6, 128,   6
	.byte	128,   6, 128,   6, 128,   6, 128,   6, 128,   6, 128,   6, 128,   6, 128,   6
G$hqx16_p1:
	.byte	129,   6, 129,   6, 129,   6, 129,   6, 129,   6, 129,   6, 129,   6, 129,   6
	.byte	129,   6, 129,   6, 129,   6, 129,   6, 129,   6, 129,   6, 129,   6, 129,   6
G$maskx16:
	.byte	255,  15, 255,  15, 255,  15, 255,  15, 255,  15, 255,  15, 255,  15, 255,  15
	.byte	255,  15, 255,  15, 255,  15, 255,  15, 255,  15, 255,  15, 255,  15, 255,  15
G$jflox16:
	.byte	161, 216, 161, 216, 161, 216, 161, 216, 161, 216, 161, 216, 161, 216, 161, 216
	.byte	161, 216, 161, 216, 161, 216, 161, 216, 161, 216, 161, 216, 161, 216, 161, 216
G$jfhix16:
	.byte	161,   5, 161,   5, 161,   5, 161,   5, 161,   5, 161,   5, 161,   5, 161,   5
	.byte	161,   5, 161,   5, 161,   5, 161,   5, 161,   5, 161,   5, 161,   5, 161,   5
G$jvx16:
	.byte	191,  78, 191,  78, 191,  78, 191,  78, 191,  78, 191,  78, 191,  78, 191,  78
	.byte	191,  78, 191,  78, 191,  78, 191,  78, 191,  78, 191,  78, 191,  78, 191,  78
G$jqinvx16:
	.byte	  1, 243,   1, 243,   1, 243,   1, 243,   1, 243,   1, 243,   1, 243,   1, 243
	.byte	  1, 243,   1, 243,   1, 243,   1, 243,   1, 243,   1, 243,   1, 243,   1, 243
G$jqx16:
	.byte	  1,  13,   1,  13,   1,  13,   1,  13,   1,  13,   1,  13,   1,  13,   1,  13
	.byte	  1,  13,   1,  13,   1,  13,   1,  13,   1,  13,   1,  13,   1,  13,   1,  13
G$jzetas_inv_exp:
	.byte	165, 165, 180, 225,  34,  79,  52,  93,  35,  68,  86, 165, 231,  78, 250,  83
	.byte	123, 199,  37,  43,  55,  58, 136,  24, 129, 126,   5, 196, 159, 247, 184, 176
	.byte	165,   6, 180,   5,  34,   9,  52,   1,  35,  11,  86,   3, 231,   9, 250,   5
	.byte	123,   6,  37,  12,  55,   5, 136,   0, 129,  11,   5,   5, 159,  10, 184,   8
	.byte	 15,  68,  67, 162,  29, 144, 108, 132, 102, 213, 230,  87, 254,  30, 161, 215
	.byte	163, 189, 106, 161,  63, 213, 191,  81, 185, 160, 215,  28, 166, 156, 208, 121
	.byte	 15,   7,  67,   9,  29,   9, 108,   0, 102,   3, 230,   5, 254,   4, 161,   4
	.byte	163,   4, 106,   3,  63,   8, 191,   4, 185,   5, 215,   7, 166,  10, 208,   9
	.byte	251,  69,  92,  94,  41, 239,  65, 190, 213,  49, 228, 113,  64, 201, 142, 203
	.byte	183, 184, 247, 117, 141, 220, 150, 110, 195,  34,  15,  62,  90, 110,  85, 178
	.byte	251,   4,  92,  10,  41,   4,  65,  11, 213,   2, 228,   5,  64,   9, 142,   1
	.byte	183,   3, 247,   0, 141,   5, 150,  12, 195,   9,  15,   1,  90,   0,  85,   3
	.byte	 35,  63,  35,  63, 205, 151, 205, 151, 102, 221, 102, 221,   6, 184,   6, 184
	.byte	161, 221, 161, 221,  37,  41,  37,  41,   8, 161,   8, 161, 169, 109, 169, 109
	.byte	 35,   6,  35,   6, 205,   0, 205,   0, 102,  11, 102,  11,   6,   6,   6,   6
	.byte	161,  10, 161,  10,  37,  10,  37,  10,   8,   9,   8,   9, 169,   2, 169,   2
	.byte	 69, 134,  69, 134,  69, 134,  69, 134, 194,  43, 194,  43, 194,  43, 194,  43
	.byte	178, 250, 178, 250, 178, 250, 178, 250,  63, 214,  63, 214,  63, 214,  63, 214
	.byte	 69,   7,  69,   7,  69,   7,  69,   7, 194,   5, 194,   5, 194,   5, 194,   5
	.byte	178,   4, 178,   4, 178,   4, 178,   4,  63,   9,  63,   9,  63,   9,  63,   9
	.byte	 55,  65,  55,  65,  55,  65,  55,  65,  55,  65,  55,  65,  55,  65,  55,  65
	.byte	226, 145, 226, 145, 226, 145, 226, 145, 226, 145, 226, 145, 226, 145, 226, 145
	.byte	 55,  12,  55,  12,  55,  12,  55,  12,  55,  12,  55,  12,  55,  12,  55,  12
	.byte	226,  11, 226,  11, 226,  11, 226,  11, 226,  11, 226,  11, 226,  11, 226,  11
	.byte	237, 252, 237, 252, 237,   5, 237,   5,  75,  49, 184, 179, 164, 183, 125, 177
	.byte	162, 206,  54,  73, 147, 137, 247, 126, 140, 234, 204, 165, 235,  17, 182, 204
	.byte	152,  84, 154,  55, 182, 203,  83, 212,  75,   0, 184,  11, 164,  11, 125,  10
	.byte	162,   8,  54,   7, 147,   0, 247,   9, 140,   6, 204,   1, 235,   0, 182,  10
	.byte	152,  12, 154,   9, 182,   9,  83,  11, 156,  20,  95,  56, 104, 187,  54,  72
	.byte	 90, 112,   9, 142, 122, 214, 246, 130, 219, 231,  35,  58,  80, 252,  91, 108
	.byte	243, 175, 227, 125, 214,  44,  79,   1, 156,   0,  95,  11, 104,   3,  54,   6
	.byte	 90,   2,   9,   3, 122,   8, 246,   0, 219,   6,  35,   1,  80,  12,  91,  11
	.byte	243,   6, 227,   4, 214,  10,  79,   4,  68, 147, 131, 101, 138,   2,  82, 220
	.byte	154,  48,  64, 193,   8, 152, 253,  49,   8, 158,  26, 175,  46, 177,  13,  92
	.byte	 10, 135,  40, 250, 117,  25,  58,  22,  68,   7, 131,  12, 138,   4,  82,   6
	.byte	154,   2,  64,   1,   8,   0, 253,  10,   8,   6,  26,   1,  46,   7,  13,   5
	.byte	 10,   9,  40,   2, 117,  10,  58,   8, 130, 102, 130, 102,  66, 172,  66, 172
	.byte	 79,   4,  79,   4,  61, 234,  61, 234, 130, 113, 130, 113, 249, 102, 249, 102
	.byte	 45, 188,  45, 188, 196,  22, 196,  22, 130,   0, 130,   0,  66,   6,  66,   6
	.byte	 79,   7,  79,   7,  61,   3,  61,   3, 130,  11, 130,  11, 249,  11, 249,  11
	.byte	 45,   5,  45,   5, 196,  10, 196,  10,  75,  61,  75,  61,  75,  61,  75,  61
	.byte	216,  14, 216,  14, 216,  14, 216,  14, 147, 147, 147, 147, 147, 147, 147, 147
	.byte	171,  81, 171,  81, 171,  81, 171,  81,  75,  12,  75,  12,  75,  12,  75,  12
	.byte	216,   6, 216,   6, 216,   6, 216,   6, 147,  10, 147,  10, 147,  10, 147,  10
	.byte	171,   0, 171,   0, 171,   0, 171,   0, 115,  48, 115,  48, 115,  48, 115,  48
	.byte	115,  48, 115,  48, 115,  48, 115,  48,  44, 203,  44, 203,  44, 203,  44, 203
	.byte	 44, 203,  44, 203,  44, 203,  44, 203, 115,   7, 115,   7, 115,   7, 115,   7
	.byte	115,   7, 115,   7, 115,   7, 115,   7,  44,   7,  44,   7,  44,   7,  44,   7
	.byte	 44,   7,  44,   7,  44,   7,  44,   7, 103, 198, 103, 198, 103,   1, 103,   1
	.byte	140, 235, 140, 235, 140,   7, 140,   7,   0,   0,   0,   0,   0,   0,   0,   0
G$jzetas_exp:
	.byte	 11, 123,  11, 123,  11,  10,  11,  10, 154,  57, 154,  57, 154,  11, 154,  11
	.byte	213,  52, 213,  52, 213,  52, 213,  52, 213,  52, 213,  52, 213,  52, 213,  52
	.byte	142, 207, 142, 207, 142, 207, 142, 207, 142, 207, 142, 207, 142, 207, 142, 207
	.byte	213,   5, 213,   5, 213,   5, 213,   5, 213,   5, 213,   5, 213,   5, 213,   5
	.byte	142,   5, 142,   5, 142,   5, 142,   5, 142,   5, 142,   5, 142,   5, 142,   5
	.byte	 86, 174,  86, 174,  86, 174,  86, 174, 110, 108, 110, 108, 110, 108, 110, 108
	.byte	 41, 241,  41, 241,  41, 241,  41, 241, 182, 194, 182, 194, 182, 194, 182, 194
	.byte	 86,  12,  86,  12,  86,  12,  86,  12, 110,   2, 110,   2, 110,   2, 110,   2
	.byte	 41,   6,  41,   6,  41,   6,  41,   6, 182,   0, 182,   0, 182,   0, 182,   0
	.byte	 61, 233,  61, 233, 212,  67, 212,  67,   8, 153,   8, 153, 127, 142, 127, 142
	.byte	196,  21, 196,  21, 178, 251, 178, 251, 191,  83, 191,  83, 127, 153, 127, 153
	.byte	 61,   2,  61,   2, 212,   7, 212,   7,   8,   1,   8,   1, 127,   1, 127,   1
	.byte	196,   9, 196,   9, 178,   5, 178,   5, 191,   6, 191,   6, 127,  12, 127,  12
	.byte	199, 233, 140, 230, 217,   5, 247, 120, 244, 163, 211,  78, 231,  80, 249,  97
	.byte	  4, 206, 249, 103, 193,  62, 103, 207, 175,  35, 119, 253, 126, 154, 189, 108
	.byte	199,   4, 140,   2, 217,  10, 247,   3, 244,   7, 211,   5, 231,  11, 249,   6
	.byte	  4,   2, 249,  12, 193,  11, 103,  10, 175,   6, 119,   8, 126,   0, 189,   5
	.byte	178, 254,  43, 211,  30, 130,  14,  80, 166, 147, 177,   3, 222, 197,  38,  24
	.byte	 11, 125, 135,  41, 248, 113, 167, 143, 203, 183, 153,  68, 162, 199, 101, 235
	.byte	178,   8,  43,   2,  30,   8,  14,   6, 166,   1, 177,   0, 222,  11,  38,   6
	.byte	 11,  12, 135,   4, 248,   9, 167,  10, 203,   6, 153,   9, 162,   1, 101,  12
	.byte	174,  43,  75,  52, 103, 200, 105, 171,  75,  51,  22, 238,  53,  90, 117,  21
	.byte	 10, 129, 110, 118, 203, 182,  95,  49, 132,  78,  93,  72,  73,  76, 182, 206
	.byte	174,   1,  75,   3, 103,   3, 105,   0,  75,   2,  22,  12,  53,  11, 117,   6
	.byte	 10,   3, 110,  12, 203,   5,  95,   4, 132,   2,  93,   1,  73,   1, 182,  12
	.byte	 20,   3,  20,   3,  20,   7,  20,   7,  31, 110,  31, 110,  31, 110,  31, 110
	.byte	 31, 110,  31, 110,  31, 110,  31, 110, 202, 190, 202, 190, 202, 190, 202, 190
	.byte	202, 190, 202, 190, 202, 190, 202, 190,  31,   1,  31,   1,  31,   1,  31,   1
	.byte	 31,   1,  31,   1,  31,   1,  31,   1, 202,   0, 202,   0, 202,   0, 202,   0
	.byte	202,   0, 202,   0, 202,   0, 202,   0, 194,  41, 194,  41, 194,  41, 194,  41
	.byte	 79,   5,  79,   5,  79,   5,  79,   5,  63, 212,  63, 212,  63, 212,  63, 212
	.byte	188, 121, 188, 121, 188, 121, 188, 121, 194,   3, 194,   3, 194,   3, 194,   3
	.byte	 79,   8,  79,   8,  79,   8,  79,   8,  63,   7,  63,   7,  63,   7,  63,   7
	.byte	188,   5, 188,   5, 188,   5, 188,   5,  88, 146,  88, 146, 249,  94, 249,  94
	.byte	220, 214, 220, 214,  96,  34,  96,  34, 251,  71, 251,  71, 155,  34, 155,  34
	.byte	 52, 104,  52, 104, 222, 192, 222, 192,  88,  10,  88,  10, 249,   3, 249,   3
	.byte	220,   2, 220,   2,  96,   2,  96,   2, 251,   6, 251,   6, 155,   1, 155,   1
	.byte	 52,  12,  52,  12, 222,   6, 222,   6, 172,  77, 167, 145, 242, 193,  62, 221
	.byte	107, 145, 116,  35,  10, 138,  74,  71, 115,  52, 193,  54,  29, 142,  44, 206
	.byte	192,  65, 216,  16, 165, 161,   6, 186, 172,   9, 167,  12, 242,  11,  62,   3
	.byte	107,   0, 116,   7,  10,  12,  74,   9, 115,  11, 193,   3,  29,   7,  44,  10
	.byte	192,   1, 216,   8, 165,   2,   6,   8,  49, 134,  91,  99,  42, 227,  72,  95
	.byte	 66, 174, 194,  42, 151,  94,  94,  66,  96,  40,   3, 225,  27, 168, 155,  42
	.byte	149, 123, 228, 111, 190,  93, 242, 187,  49,   3,  91,   2,  42,   5,  72,   7
	.byte	 66,   8, 194,   4, 151,   9,  94,   8,  96,   8,   3,   8,  27,   7, 155,   9
	.byte	149,  12, 228,   3, 190,   3, 242,   5,  73,  79,  98,   8, 252,  59, 128, 129
	.byte	121, 231, 202, 197, 220, 212, 134,  56,   7, 172,  26, 177, 171,  90, 222, 187
	.byte	205, 162, 223, 176,  77,  30,  92,  90,  73,   4,  98,   2, 252,   7, 128,   1
	.byte	121,  12, 202,   7, 220,   0, 134,   6,   7,   7,  26,   3, 171,   9, 222,   1
	.byte	205,  11, 223,   3,  77,   7,  92,   6,   0,   0,   0,   0,   0,   0,   0,   0
G$pfm_idx_s:
	.byte	  0,   1,   4,   5,   8,   9,  12,  13,   2,   3,   6,   7,  10,  11,  14,  15
G$pfm_shift_s:
	.byte	  3,   0,   0,   0,   2,   0,   0,   0,   1,   0,   0,   0,   0,   0,   0,   0
G$gen_matrix_indexes:
	.byte	  0,   0,   1,   0,   2,   0,   3,   0,   0,   1,   1,   1,   2,   1,   3,   1
	.byte	  0,   2,   1,   2,   2,   2,   3,   2,   0,   3,   1,   3,   2,   3,   3,   3
	.byte	  0,   0,   0,   1,   0,   2,   0,   3,   1,   0,   1,   1,   1,   2,   1,   3
	.byte	  2,   0,   2,   1,   2,   2,   2,   3,   3,   0,   3,   1,   3,   2,   3,   3
G$sample_shuffle_table:
	.byte	255, 255, 255, 255, 255, 255, 255, 255,   0, 255, 255, 255, 255, 255, 255, 255
	.byte	  2, 255, 255, 255, 255, 255, 255, 255,   0,   2, 255, 255, 255, 255, 255, 255
	.byte	  4, 255, 255, 255, 255, 255, 255, 255,   0,   4, 255, 255, 255, 255, 255, 255
	.byte	  2,   4, 255, 255, 255, 255, 255, 255,   0,   2,   4, 255, 255, 255, 255, 255
	.byte	  6, 255, 255, 255, 255, 255, 255, 255,   0,   6, 255, 255, 255, 255, 255, 255
	.byte	  2,   6, 255, 255, 255, 255, 255, 255,   0,   2,   6, 255, 255, 255, 255, 255
	.byte	  4,   6, 255, 255, 255, 255, 255, 255,   0,   4,   6, 255, 255, 255, 255, 255
	.byte	  2,   4,   6, 255, 255, 255, 255, 255,   0,   2,   4,   6, 255, 255, 255, 255
	.byte	  8, 255, 255, 255, 255, 255, 255, 255,   0,   8, 255, 255, 255, 255, 255, 255
	.byte	  2,   8, 255, 255, 255, 255, 255, 255,   0,   2,   8, 255, 255, 255, 255, 255
	.byte	  4,   8, 255, 255, 255, 255, 255, 255,   0,   4,   8, 255, 255, 255, 255, 255
	.byte	  2,   4,   8, 255, 255, 255, 255, 255,   0,   2,   4,   8, 255, 255, 255, 255
	.byte	  6,   8, 255, 255, 255, 255, 255, 255,   0,   6,   8, 255, 255, 255, 255, 255
	.byte	  2,   6,   8, 255, 255, 255, 255, 255,   0,   2,   6,   8, 255, 255, 255, 255
	.byte	  4,   6,   8, 255, 255, 255, 255, 255,   0,   4,   6,   8, 255, 255, 255, 255
	.byte	  2,   4,   6,   8, 255, 255, 255, 255,   0,   2,   4,   6,   8, 255, 255, 255
	.byte	 10, 255, 255, 255, 255, 255, 255, 255,   0,  10, 255, 255, 255, 255, 255, 255
	.byte	  2,  10, 255, 255, 255, 255, 255, 255,   0,   2,  10, 255, 255, 255, 255, 255
	.byte	  4,  10, 255, 255, 255, 255, 255, 255,   0,   4,  10, 255, 255, 255, 255, 255
	.byte	  2,   4,  10, 255, 255, 255, 255, 255,   0,   2,   4,  10, 255, 255, 255, 255
	.byte	  6,  10, 255, 255, 255, 255, 255, 255,   0,   6,  10, 255, 255, 255, 255, 255
	.byte	  2,   6,  10, 255, 255, 255, 255, 255,   0,   2,   6,  10, 255, 255, 255, 255
	.byte	  4,   6,  10, 255, 255, 255, 255, 255,   0,   4,   6,  10, 255, 255, 255, 255
	.byte	  2,   4,   6,  10, 255, 255, 255, 255,   0,   2,   4,   6,  10, 255, 255, 255
	.byte	  8,  10, 255, 255, 255, 255, 255, 255,   0,   8,  10, 255, 255, 255, 255, 255
	.byte	  2,   8,  10, 255, 255, 255, 255, 255,   0,   2,   8,  10, 255, 255, 255, 255
	.byte	  4,   8,  10, 255, 255, 255, 255, 255,   0,   4,   8,  10, 255, 255, 255, 255
	.byte	  2,   4,   8,  10, 255, 255, 255, 255,   0,   2,   4,   8,  10, 255, 255, 255
	.byte	  6,   8,  10, 255, 255, 255, 255, 255,   0,   6,   8,  10, 255, 255, 255, 255
	.byte	  2,   6,   8,  10, 255, 255, 255, 255,   0,   2,   6,   8,  10, 255, 255, 255
	.byte	  4,   6,   8,  10, 255, 255, 255, 255,   0,   4,   6,   8,  10, 255, 255, 255
	.byte	  2,   4,   6,   8,  10, 255, 255, 255,   0,   2,   4,   6,   8,  10, 255, 255
	.byte	 12, 255, 255, 255, 255, 255, 255, 255,   0,  12, 255, 255, 255, 255, 255, 255
	.byte	  2,  12, 255, 255, 255, 255, 255, 255,   0,   2,  12, 255, 255, 255, 255, 255
	.byte	  4,  12, 255, 255, 255, 255, 255, 255,   0,   4,  12, 255, 255, 255, 255, 255
	.byte	  2,   4,  12, 255, 255, 255, 255, 255,   0,   2,   4,  12, 255, 255, 255, 255
	.byte	  6,  12, 255, 255, 255, 255, 255, 255,   0,   6,  12, 255, 255, 255, 255, 255
	.byte	  2,   6,  12, 255, 255, 255, 255, 255,   0,   2,   6,  12, 255, 255, 255, 255
	.byte	  4,   6,  12, 255, 255, 255, 255, 255,   0,   4,   6,  12, 255, 255, 255, 255
	.byte	  2,   4,   6,  12, 255, 255, 255, 255,   0,   2,   4,   6,  12, 255, 255, 255
	.byte	  8,  12, 255, 255, 255, 255, 255, 255,   0,   8,  12, 255, 255, 255, 255, 255
	.byte	  2,   8,  12, 255, 255, 255, 255, 255,   0,   2,   8,  12, 255, 255, 255, 255
	.byte	  4,   8,  12, 255, 255, 255, 255, 255,   0,   4,   8,  12, 255, 255, 255, 255
	.byte	  2,   4,   8,  12, 255, 255, 255, 255,   0,   2,   4,   8,  12, 255, 255, 255
	.byte	  6,   8,  12, 255, 255, 255, 255, 255,   0,   6,   8,  12, 255, 255, 255, 255
	.byte	  2,   6,   8,  12, 255, 255, 255, 255,   0,   2,   6,   8,  12, 255, 255, 255
	.byte	  4,   6,   8,  12, 255, 255, 255, 255,   0,   4,   6,   8,  12, 255, 255, 255
	.byte	  2,   4,   6,   8,  12, 255, 255, 255,   0,   2,   4,   6,   8,  12, 255, 255
	.byte	 10,  12, 255, 255, 255, 255, 255, 255,   0,  10,  12, 255, 255, 255, 255, 255
	.byte	  2,  10,  12, 255, 255, 255, 255, 255,   0,   2,  10,  12, 255, 255, 255, 255
	.byte	  4,  10,  12, 255, 255, 255, 255, 255,   0,   4,  10,  12, 255, 255, 255, 255
	.byte	  2,   4,  10,  12, 255, 255, 255, 255,   0,   2,   4,  10,  12, 255, 255, 255
	.byte	  6,  10,  12, 255, 255, 255, 255, 255,   0,   6,  10,  12, 255, 255, 255, 255
	.byte	  2,   6,  10,  12, 255, 255, 255, 255,   0,   2,   6,  10,  12, 255, 255, 255
	.byte	  4,   6,  10,  12, 255, 255, 255, 255,   0,   4,   6,  10,  12, 255, 255, 255
	.byte	  2,   4,   6,  10,  12, 255, 255, 255,   0,   2,   4,   6,  10,  12, 255, 255
	.byte	  8,  10,  12, 255, 255, 255, 255, 255,   0,   8,  10,  12, 255, 255, 255, 255
	.byte	  2,   8,  10,  12, 255, 255, 255, 255,   0,   2,   8,  10,  12, 255, 255, 255
	.byte	  4,   8,  10,  12, 255, 255, 255, 255,   0,   4,   8,  10,  12, 255, 255, 255
	.byte	  2,   4,   8,  10,  12, 255, 255, 255,   0,   2,   4,   8,  10,  12, 255, 255
	.byte	  6,   8,  10,  12, 255, 255, 255, 255,   0,   6,   8,  10,  12, 255, 255, 255
	.byte	  2,   6,   8,  10,  12, 255, 255, 255,   0,   2,   6,   8,  10,  12, 255, 255
	.byte	  4,   6,   8,  10,  12, 255, 255, 255,   0,   4,   6,   8,  10,  12, 255, 255
	.byte	  2,   4,   6,   8,  10,  12, 255, 255,   0,   2,   4,   6,   8,  10,  12, 255
	.byte	 14, 255, 255, 255, 255, 255, 255, 255,   0,  14, 255, 255, 255, 255, 255, 255
	.byte	  2,  14, 255, 255, 255, 255, 255, 255,   0,   2,  14, 255, 255, 255, 255, 255
	.byte	  4,  14, 255, 255, 255, 255, 255, 255,   0,   4,  14, 255, 255, 255, 255, 255
	.byte	  2,   4,  14, 255, 255, 255, 255, 255,   0,   2,   4,  14, 255, 255, 255, 255
	.byte	  6,  14, 255, 255, 255, 255, 255, 255,   0,   6,  14, 255, 255, 255, 255, 255
	.byte	  2,   6,  14, 255, 255, 255, 255, 255,   0,   2,   6,  14, 255, 255, 255, 255
	.byte	  4,   6,  14, 255, 255, 255, 255, 255,   0,   4,   6,  14, 255, 255, 255, 255
	.byte	  2,   4,   6,  14, 255, 255, 255, 255,   0,   2,   4,   6,  14, 255, 255, 255
	.byte	  8,  14, 255, 255, 255, 255, 255, 255,   0,   8,  14, 255, 255, 255, 255, 255
	.byte	  2,   8,  14, 255, 255, 255, 255, 255,   0,   2,   8,  14, 255, 255, 255, 255
	.byte	  4,   8,  14, 255, 255, 255, 255, 255,   0,   4,   8,  14, 255, 255, 255, 255
	.byte	  2,   4,   8,  14, 255, 255, 255, 255,   0,   2,   4,   8,  14, 255, 255, 255
	.byte	  6,   8,  14, 255, 255, 255, 255, 255,   0,   6,   8,  14, 255, 255, 255, 255
	.byte	  2,   6,   8,  14, 255, 255, 255, 255,   0,   2,   6,   8,  14, 255, 255, 255
	.byte	  4,   6,   8,  14, 255, 255, 255, 255,   0,   4,   6,   8,  14, 255, 255, 255
	.byte	  2,   4,   6,   8,  14, 255, 255, 255,   0,   2,   4,   6,   8,  14, 255, 255
	.byte	 10,  14, 255, 255, 255, 255, 255, 255,   0,  10,  14, 255, 255, 255, 255, 255
	.byte	  2,  10,  14, 255, 255, 255, 255, 255,   0,   2,  10,  14, 255, 255, 255, 255
	.byte	  4,  10,  14, 255, 255, 255, 255, 255,   0,   4,  10,  14, 255, 255, 255, 255
	.byte	  2,   4,  10,  14, 255, 255, 255, 255,   0,   2,   4,  10,  14, 255, 255, 255
	.byte	  6,  10,  14, 255, 255, 255, 255, 255,   0,   6,  10,  14, 255, 255, 255, 255
	.byte	  2,   6,  10,  14, 255, 255, 255, 255,   0,   2,   6,  10,  14, 255, 255, 255
	.byte	  4,   6,  10,  14, 255, 255, 255, 255,   0,   4,   6,  10,  14, 255, 255, 255
	.byte	  2,   4,   6,  10,  14, 255, 255, 255,   0,   2,   4,   6,  10,  14, 255, 255
	.byte	  8,  10,  14, 255, 255, 255, 255, 255,   0,   8,  10,  14, 255, 255, 255, 255
	.byte	  2,   8,  10,  14, 255, 255, 255, 255,   0,   2,   8,  10,  14, 255, 255, 255
	.byte	  4,   8,  10,  14, 255, 255, 255, 255,   0,   4,   8,  10,  14, 255, 255, 255
	.byte	  2,   4,   8,  10,  14, 255, 255, 255,   0,   2,   4,   8,  10,  14, 255, 255
	.byte	  6,   8,  10,  14, 255, 255, 255, 255,   0,   6,   8,  10,  14, 255, 255, 255
	.byte	  2,   6,   8,  10,  14, 255, 255, 255,   0,   2,   6,   8,  10,  14, 255, 255
	.byte	  4,   6,   8,  10,  14, 255, 255, 255,   0,   4,   6,   8,  10,  14, 255, 255
	.byte	  2,   4,   6,   8,  10,  14, 255, 255,   0,   2,   4,   6,   8,  10,  14, 255
	.byte	 12,  14, 255, 255, 255, 255, 255, 255,   0,  12,  14, 255, 255, 255, 255, 255
	.byte	  2,  12,  14, 255, 255, 255, 255, 255,   0,   2,  12,  14, 255, 255, 255, 255
	.byte	  4,  12,  14, 255, 255, 255, 255, 255,   0,   4,  12,  14, 255, 255, 255, 255
	.byte	  2,   4,  12,  14, 255, 255, 255, 255,   0,   2,   4,  12,  14, 255, 255, 255
	.byte	  6,  12,  14, 255, 255, 255, 255, 255,   0,   6,  12,  14, 255, 255, 255, 255
	.byte	  2,   6,  12,  14, 255, 255, 255, 255,   0,   2,   6,  12,  14, 255, 255, 255
	.byte	  4,   6,  12,  14, 255, 255, 255, 255,   0,   4,   6,  12,  14, 255, 255, 255
	.byte	  2,   4,   6,  12,  14, 255, 255, 255,   0,   2,   4,   6,  12,  14, 255, 255
	.byte	  8,  12,  14, 255, 255, 255, 255, 255,   0,   8,  12,  14, 255, 255, 255, 255
	.byte	  2,   8,  12,  14, 255, 255, 255, 255,   0,   2,   8,  12,  14, 255, 255, 255
	.byte	  4,   8,  12,  14, 255, 255, 255, 255,   0,   4,   8,  12,  14, 255, 255, 255
	.byte	  2,   4,   8,  12,  14, 255, 255, 255,   0,   2,   4,   8,  12,  14, 255, 255
	.byte	  6,   8,  12,  14, 255, 255, 255, 255,   0,   6,   8,  12,  14, 255, 255, 255
	.byte	  2,   6,   8,  12,  14, 255, 255, 255,   0,   2,   6,   8,  12,  14, 255, 255
	.byte	  4,   6,   8,  12,  14, 255, 255, 255,   0,   4,   6,   8,  12,  14, 255, 255
	.byte	  2,   4,   6,   8,  12,  14, 255, 255,   0,   2,   4,   6,   8,  12,  14, 255
	.byte	 10,  12,  14, 255, 255, 255, 255, 255,   0,  10,  12,  14, 255, 255, 255, 255
	.byte	  2,  10,  12,  14, 255, 255, 255, 255,   0,   2,  10,  12,  14, 255, 255, 255
	.byte	  4,  10,  12,  14, 255, 255, 255, 255,   0,   4,  10,  12,  14, 255, 255, 255
	.byte	  2,   4,  10,  12,  14, 255, 255, 255,   0,   2,   4,  10,  12,  14, 255, 255
	.byte	  6,  10,  12,  14, 255, 255, 255, 255,   0,   6,  10,  12,  14, 255, 255, 255
	.byte	  2,   6,  10,  12,  14, 255, 255, 255,   0,   2,   6,  10,  12,  14, 255, 255
	.byte	  4,   6,  10,  12,  14, 255, 255, 255,   0,   4,   6,  10,  12,  14, 255, 255
	.byte	  2,   4,   6,  10,  12,  14, 255, 255,   0,   2,   4,   6,  10,  12,  14, 255
	.byte	  8,  10,  12,  14, 255, 255, 255, 255,   0,   8,  10,  12,  14, 255, 255, 255
	.byte	  2,   8,  10,  12,  14, 255, 255, 255,   0,   2,   8,  10,  12,  14, 255, 255
	.byte	  4,   8,  10,  12,  14, 255, 255, 255,   0,   4,   8,  10,  12,  14, 255, 255
	.byte	  2,   4,   8,  10,  12,  14, 255, 255,   0,   2,   4,   8,  10,  12,  14, 255
	.byte	  6,   8,  10,  12,  14, 255, 255, 255,   0,   6,   8,  10,  12,  14, 255, 255
	.byte	  2,   6,   8,  10,  12,  14, 255, 255,   0,   2,   6,   8,  10,  12,  14, 255
	.byte	  4,   6,   8,  10,  12,  14, 255, 255,   0,   4,   6,   8,  10,  12,  14, 255
	.byte	  2,   4,   6,   8,  10,  12,  14, 255,   0,   2,   4,   6,   8,  10,  12,  14
G$pvc_sllvdidx_s:
	.byte	 10,   0,   0,   0,   0,   0,   0,   0
G$pvc_shift2_s:
	.byte	  1,   0,   0,   8,   1,   0,   0,   8
G$pc_sllvdidx_s:
	.byte	 12,   0,   0,   0,   0,   0,   0,   0
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
G$pc_shift3_s:
	.byte	  1,   0,   0,   4
G$pvc_mask_s:
	.byte	255,   7
G$pvc_shift1_s:
	.byte	  0,  32
G$pvc_off_s:
	.byte	 36,   0
G$pvd_mask_s:
	.byte	240, 127
G$pc_shift2_s:
	.byte	  1,  32
G$pc_shift1_s:
	.byte	  0,   4
G$pc_mask_s:
	.byte	 31,   0
G$mqinvx16:
	.byte	251,  58, 251,  58, 251,  58, 251,  58, 251,  58, 251,  58, 251,  58, 251,  58
	.byte	251,  58, 251,  58, 251,  58, 251,  58, 251,  58, 251,  58, 251,  58, 251,  58
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
