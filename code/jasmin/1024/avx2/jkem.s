	.att_syntax
	.text
	.p2align	5
	.global	jade_kem_mlkem_mlkem1024_amd64_avx2_dec
	.global	jade_kem_mlkem_mlkem1024_amd64_avx2_enc
	.global	jade_kem_mlkem_mlkem1024_amd64_avx2_keypair
	.global	jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand
	.global	jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand
	.type	jade_kem_mlkem_mlkem1024_amd64_avx2_dec, %function
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
	movq	%rdx, %mm0
	vmovdqu	3136(%rdx), %ymm0
	vmovdqu	%ymm0, 3744(%rsp)
	movq	%rdx, %rax
	movq	%rsp, %rcx
	leaq	5344(%rsp), %rsi
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 288(%rip), %ymm1
	vmovdqu	glob_data + 256(%rip), %ymm2
	vmovdqu	glob_data + 224(%rip), %ymm3
	vmovdqu	glob_data + 192(%rip), %ymm4
	vpbroadcastw	glob_data + 4802(%rip), %ymm5
	vmovdqu	(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, (%rsi)
	vmovdqu	22(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 32(%rsi)
	vmovdqu	44(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 64(%rsi)
	vmovdqu	66(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 96(%rsi)
	vmovdqu	88(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 128(%rsi)
	vmovdqu	110(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 160(%rsi)
	vmovdqu	132(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 192(%rsi)
	vmovdqu	154(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 224(%rsi)
	vmovdqu	176(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 256(%rsi)
	vmovdqu	198(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 288(%rsi)
	vmovdqu	220(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 320(%rsi)
	vmovdqu	242(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 352(%rsi)
	vmovdqu	264(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 384(%rsi)
	vmovdqu	286(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 416(%rsi)
	vmovdqu	308(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 448(%rsi)
	vmovdqu	330(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 480(%rsi)
	vmovdqu	352(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 512(%rsi)
	vmovdqu	374(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 544(%rsi)
	vmovdqu	396(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 576(%rsi)
	vmovdqu	418(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 608(%rsi)
	vmovdqu	440(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 640(%rsi)
	vmovdqu	462(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 672(%rsi)
	vmovdqu	484(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 704(%rsi)
	vmovdqu	506(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 736(%rsi)
	vmovdqu	528(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 768(%rsi)
	vmovdqu	550(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 800(%rsi)
	vmovdqu	572(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 832(%rsi)
	vmovdqu	594(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 864(%rsi)
	vmovdqu	616(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 896(%rsi)
	vmovdqu	638(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 928(%rsi)
	vmovdqu	660(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 960(%rsi)
	vmovdqu	682(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 992(%rsi)
	vmovdqu	704(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1024(%rsi)
	vmovdqu	726(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1056(%rsi)
	vmovdqu	748(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1088(%rsi)
	vmovdqu	770(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1120(%rsi)
	vmovdqu	792(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1152(%rsi)
	vmovdqu	814(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1184(%rsi)
	vmovdqu	836(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1216(%rsi)
	vmovdqu	858(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1248(%rsi)
	vmovdqu	880(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1280(%rsi)
	vmovdqu	902(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1312(%rsi)
	vmovdqu	924(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1344(%rsi)
	vmovdqu	946(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1376(%rsi)
	vmovdqu	968(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1408(%rsi)
	vmovdqu	990(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1440(%rsi)
	vmovdqu	1012(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1472(%rsi)
	vmovdqu	1034(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1504(%rsi)
	vmovdqu	1056(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1536(%rsi)
	vmovdqu	1078(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1568(%rsi)
	vmovdqu	1100(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1600(%rsi)
	vmovdqu	1122(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1632(%rsi)
	vmovdqu	1144(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1664(%rsi)
	vmovdqu	1166(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1696(%rsi)
	vmovdqu	1188(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1728(%rsi)
	vmovdqu	1210(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1760(%rsi)
	vmovdqu	1232(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1792(%rsi)
	vmovdqu	1254(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1824(%rsi)
	vmovdqu	1276(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1856(%rsi)
	vmovdqu	1298(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1888(%rsi)
	vmovdqu	1320(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1920(%rsi)
	vmovdqu	1342(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1952(%rsi)
	vmovdqu	1364(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 1984(%rsi)
	vmovdqu	1386(%r8), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm2
	vpsrlvq	%ymm3, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpsrlw	$1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 2016(%rsi)
	leaq	128(%rsp), %rsi
	leaq	1408(%r8), %rdi
	leaq	-24(%rsp), %rsp
	call	L_i_poly_decompress$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$85:
	leaq	24(%rsp), %rsp
	leaq	7392(%rsp), %rsi
	movq	%rax, %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$84:
	leaq	7904(%rsp), %rsi
	leaq	384(%rax), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$83:
	leaq	8416(%rsp), %rsi
	leaq	768(%rax), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$82:
	leaq	8928(%rsp), %rsi
	leaq	1152(%rax), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$81:
	leaq	5344(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$80:
	leaq	5856(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$79:
	leaq	6368(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$78:
	leaq	6880(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$77:
	leaq	640(%rsp), %rax
	leaq	7392(%rsp), %rsi
	leaq	5344(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$76:
	leaq	1152(%rsp), %rax
	leaq	7904(%rsp), %rsi
	leaq	5856(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$75:
	leaq	640(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$74:
	leaq	1152(%rsp), %rax
	leaq	8416(%rsp), %rsi
	leaq	6368(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$73:
	leaq	640(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$72:
	leaq	1152(%rsp), %rax
	leaq	8928(%rsp), %rsi
	leaq	6880(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$71:
	leaq	640(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$70:
	leaq	640(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$69:
	leaq	1152(%rsp), %rax
	leaq	128(%rsp), %rsi
	leaq	640(%rsp), %rdi
	call	L_poly_sub$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$68:
	leaq	1152(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	call	L_i_poly_tomsg$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$67:
	vmovdqu	3104(%rdx), %ymm0
	vmovdqu	%ymm0, 32(%rsp)
	leaq	64(%rsp), %rdi
	movq	%rsp, %rbx
	leaq	-248(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$66:
	leaq	248(%rsp), %rsp
	movq	%mm0, %rdx
	leaq	2176(%rsp), %rbp
	movq	%rsp, %rcx
	leaq	1536(%rdx), %rbx
	leaq	96(%rsp), %r8
	movq	%rbp, %mm3
	movq	%r8, 21728(%rsp)
	movq	%rbx, %rax
	leaq	5344(%rsp), %rsi
	movq	%rax, %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$65:
	leaq	5856(%rsp), %rsi
	leaq	384(%rax), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$64:
	leaq	6368(%rsp), %rsi
	leaq	768(%rax), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$63:
	leaq	6880(%rsp), %rsi
	leaq	1152(%rax), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$62:
	movq	1536(%rbx), %rax
// declassify_val u64 %rax
	movq	%rax, 21736(%rsp)
	movq	1544(%rbx), %rax
// declassify_val u64 %rax
	movq	%rax, 21744(%rsp)
	movq	1552(%rbx), %rax
// declassify_val u64 %rax
	movq	%rax, 21752(%rsp)
	movq	1560(%rbx), %rax
// declassify_val u64 %rax
	movq	%rax, 21760(%rsp)
	leaq	1152(%rsp), %rax
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$61:
	movq	$1, %rax
	leaq	13536(%rsp), %rcx
	leaq	21736(%rsp), %r8
	leaq	-2200(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$60:
	leaq	2200(%rsp), %rsp
	movq	21728(%rsp), %r8
	movb	$0, %bl
	leaq	7392(%rsp), %rcx
	leaq	7904(%rsp), %r9
	leaq	8416(%rsp), %r10
	leaq	8928(%rsp), %r11
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$59:
	leaq	600(%rsp), %rsp
	movb	$4, %bl
	leaq	9440(%rsp), %rcx
	leaq	9952(%rsp), %r9
	leaq	10464(%rsp), %r10
	leaq	10976(%rsp), %r11
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$58:
	leaq	600(%rsp), %rsp
	movb	$8, %al
	leaq	640(%rsp), %rcx
	leaq	-184(%rsp), %rsp
	call	L_poly_getnoise_eta2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$57:
	leaq	184(%rsp), %rsp
	leaq	7392(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$56:
	leaq	7904(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$55:
	leaq	8416(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$54:
	leaq	8928(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$53:
	leaq	11488(%rsp), %rax
	leaq	13536(%rsp), %rsi
	leaq	7392(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$52:
	leaq	128(%rsp), %rax
	leaq	14048(%rsp), %rsi
	leaq	7904(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$51:
	leaq	11488(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$50:
	leaq	128(%rsp), %rax
	leaq	14560(%rsp), %rsi
	leaq	8416(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$49:
	leaq	11488(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$48:
	leaq	128(%rsp), %rax
	leaq	15072(%rsp), %rsi
	leaq	8928(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$47:
	leaq	11488(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$46:
	leaq	12000(%rsp), %rax
	leaq	15584(%rsp), %rsi
	leaq	7392(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$45:
	leaq	128(%rsp), %rax
	leaq	16096(%rsp), %rsi
	leaq	7904(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$44:
	leaq	12000(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$43:
	leaq	128(%rsp), %rax
	leaq	16608(%rsp), %rsi
	leaq	8416(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$42:
	leaq	12000(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$41:
	leaq	128(%rsp), %rax
	leaq	17120(%rsp), %rsi
	leaq	8928(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$40:
	leaq	12000(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$39:
	leaq	12512(%rsp), %rax
	leaq	17632(%rsp), %rsi
	leaq	7392(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$38:
	leaq	128(%rsp), %rax
	leaq	18144(%rsp), %rsi
	leaq	7904(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$37:
	leaq	12512(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$36:
	leaq	128(%rsp), %rax
	leaq	18656(%rsp), %rsi
	leaq	8416(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$35:
	leaq	12512(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$34:
	leaq	128(%rsp), %rax
	leaq	19168(%rsp), %rsi
	leaq	8928(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$33:
	leaq	12512(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$32:
	leaq	13024(%rsp), %rax
	leaq	19680(%rsp), %rsi
	leaq	7392(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$31:
	leaq	128(%rsp), %rax
	leaq	20192(%rsp), %rsi
	leaq	7904(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$30:
	leaq	13024(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$29:
	leaq	128(%rsp), %rax
	leaq	20704(%rsp), %rsi
	leaq	8416(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$28:
	leaq	13024(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$27:
	leaq	128(%rsp), %rax
	leaq	21216(%rsp), %rsi
	leaq	8928(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$26:
	leaq	13024(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$25:
	leaq	128(%rsp), %rax
	leaq	5344(%rsp), %rsi
	leaq	7392(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$24:
	leaq	1664(%rsp), %rax
	leaq	5856(%rsp), %rsi
	leaq	7904(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$23:
	leaq	128(%rsp), %rax
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$22:
	leaq	1664(%rsp), %rax
	leaq	6368(%rsp), %rsi
	leaq	8416(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$21:
	leaq	128(%rsp), %rax
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$20:
	leaq	1664(%rsp), %rax
	leaq	6880(%rsp), %rsi
	leaq	8928(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$19:
	leaq	128(%rsp), %rax
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$18:
	leaq	11488(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$17:
	leaq	12000(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$16:
	leaq	12512(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$15:
	leaq	13024(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$14:
	leaq	128(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$13:
	leaq	11488(%rsp), %rax
	leaq	9440(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$12:
	leaq	12000(%rsp), %rax
	leaq	9952(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$11:
	leaq	12512(%rsp), %rax
	leaq	10464(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$10:
	leaq	13024(%rsp), %rax
	leaq	10976(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$9:
	leaq	128(%rsp), %rax
	leaq	640(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$8:
	leaq	128(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$7:
	leaq	11488(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	movq	%rbp, %rcx
	leaq	11488(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$6:
	leaq	12000(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$5:
	leaq	12512(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$4:
	leaq	13024(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$3:
	vmovdqu	glob_data + 736(%rip), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 4800(%rip), %ymm2
	vpbroadcastw	glob_data + 4798(%rip), %ymm3
	vpbroadcastw	glob_data + 4796(%rip), %ymm5
	vpbroadcastq	glob_data + 4584(%rip), %ymm4
	vpbroadcastq	glob_data + 4576(%rip), %ymm6
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
	vmovdqu	%xmm11, (%rcx)
	movq	%xmm9, 16(%rcx)
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
	vmovdqu	%xmm11, 22(%rcx)
	movq	%xmm9, 38(%rcx)
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
	vmovdqu	%xmm11, 44(%rcx)
	movq	%xmm9, 60(%rcx)
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
	vmovdqu	%xmm11, 66(%rcx)
	movq	%xmm9, 82(%rcx)
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
	vmovdqu	%xmm11, 88(%rcx)
	movq	%xmm9, 104(%rcx)
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
	vmovdqu	%xmm11, 110(%rcx)
	movq	%xmm9, 126(%rcx)
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
	vmovdqu	%xmm11, 132(%rcx)
	movq	%xmm9, 148(%rcx)
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
	vmovdqu	%xmm11, 154(%rcx)
	movq	%xmm9, 170(%rcx)
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
	vmovdqu	%xmm11, 176(%rcx)
	movq	%xmm9, 192(%rcx)
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
	vmovdqu	%xmm11, 198(%rcx)
	movq	%xmm9, 214(%rcx)
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
	vmovdqu	%xmm11, 220(%rcx)
	movq	%xmm9, 236(%rcx)
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
	vmovdqu	%xmm11, 242(%rcx)
	movq	%xmm9, 258(%rcx)
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
	vmovdqu	%xmm11, 264(%rcx)
	movq	%xmm9, 280(%rcx)
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
	vmovdqu	%xmm11, 286(%rcx)
	movq	%xmm9, 302(%rcx)
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
	vmovdqu	%xmm11, 308(%rcx)
	movq	%xmm9, 324(%rcx)
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
	vmovdqu	%xmm11, 330(%rcx)
	movq	%xmm9, 346(%rcx)
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
	vmovdqu	%xmm11, 352(%rcx)
	movq	%xmm9, 368(%rcx)
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
	vmovdqu	%xmm11, 374(%rcx)
	movq	%xmm9, 390(%rcx)
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
	vmovdqu	%xmm11, 396(%rcx)
	movq	%xmm9, 412(%rcx)
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
	vmovdqu	%xmm11, 418(%rcx)
	movq	%xmm9, 434(%rcx)
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
	vmovdqu	%xmm11, 440(%rcx)
	movq	%xmm9, 456(%rcx)
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
	vmovdqu	%xmm11, 462(%rcx)
	movq	%xmm9, 478(%rcx)
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
	vmovdqu	%xmm11, 484(%rcx)
	movq	%xmm9, 500(%rcx)
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
	vmovdqu	%xmm11, 506(%rcx)
	movq	%xmm9, 522(%rcx)
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
	vmovdqu	%xmm11, 528(%rcx)
	movq	%xmm9, 544(%rcx)
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
	vmovdqu	%xmm11, 550(%rcx)
	movq	%xmm9, 566(%rcx)
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
	vmovdqu	%xmm11, 572(%rcx)
	movq	%xmm9, 588(%rcx)
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
	vmovdqu	%xmm11, 594(%rcx)
	movq	%xmm9, 610(%rcx)
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
	vmovdqu	%xmm11, 616(%rcx)
	movq	%xmm9, 632(%rcx)
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
	vmovdqu	%xmm11, 638(%rcx)
	movq	%xmm9, 654(%rcx)
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
	vmovdqu	%xmm11, 660(%rcx)
	movq	%xmm9, 676(%rcx)
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
	vmovdqu	%xmm11, 682(%rcx)
	movq	%xmm9, 698(%rcx)
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
	vmovdqu	%xmm11, 704(%rcx)
	movq	%xmm9, 720(%rcx)
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
	vmovdqu	%xmm11, 726(%rcx)
	movq	%xmm9, 742(%rcx)
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
	vmovdqu	%xmm11, 748(%rcx)
	movq	%xmm9, 764(%rcx)
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
	vmovdqu	%xmm11, 770(%rcx)
	movq	%xmm9, 786(%rcx)
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
	vmovdqu	%xmm11, 792(%rcx)
	movq	%xmm9, 808(%rcx)
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
	vmovdqu	%xmm11, 814(%rcx)
	movq	%xmm9, 830(%rcx)
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
	vmovdqu	%xmm11, 836(%rcx)
	movq	%xmm9, 852(%rcx)
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
	vmovdqu	%xmm11, 858(%rcx)
	movq	%xmm9, 874(%rcx)
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
	vmovdqu	%xmm11, 880(%rcx)
	movq	%xmm9, 896(%rcx)
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
	vmovdqu	%xmm11, 902(%rcx)
	movq	%xmm9, 918(%rcx)
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
	vmovdqu	%xmm11, 924(%rcx)
	movq	%xmm9, 940(%rcx)
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
	vmovdqu	%xmm11, 946(%rcx)
	movq	%xmm9, 962(%rcx)
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
	vmovdqu	%xmm11, 968(%rcx)
	movq	%xmm9, 984(%rcx)
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
	vmovdqu	%xmm11, 990(%rcx)
	movq	%xmm9, 1006(%rcx)
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
	vmovdqu	%xmm11, 1012(%rcx)
	movq	%xmm9, 1028(%rcx)
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
	vmovdqu	%xmm11, 1034(%rcx)
	movq	%xmm9, 1050(%rcx)
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
	vmovdqu	%xmm11, 1056(%rcx)
	movq	%xmm9, 1072(%rcx)
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
	vmovdqu	%xmm11, 1078(%rcx)
	movq	%xmm9, 1094(%rcx)
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
	vmovdqu	%xmm11, 1100(%rcx)
	movq	%xmm9, 1116(%rcx)
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
	vmovdqu	%xmm11, 1122(%rcx)
	movq	%xmm9, 1138(%rcx)
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
	vmovdqu	%xmm11, 1144(%rcx)
	movq	%xmm9, 1160(%rcx)
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
	vmovdqu	%xmm11, 1166(%rcx)
	movq	%xmm9, 1182(%rcx)
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
	vmovdqu	%xmm11, 1188(%rcx)
	movq	%xmm9, 1204(%rcx)
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
	vmovdqu	%xmm11, 1210(%rcx)
	movq	%xmm9, 1226(%rcx)
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
	vmovdqu	%xmm11, 1232(%rcx)
	movq	%xmm9, 1248(%rcx)
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
	vmovdqu	%xmm11, 1254(%rcx)
	movq	%xmm9, 1270(%rcx)
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
	vmovdqu	%xmm11, 1276(%rcx)
	movq	%xmm9, 1292(%rcx)
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
	vmovdqu	%xmm11, 1298(%rcx)
	movq	%xmm9, 1314(%rcx)
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
	vmovdqu	%xmm11, 1320(%rcx)
	movq	%xmm9, 1336(%rcx)
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
	vmovdqu	%xmm11, 1342(%rcx)
	movq	%xmm9, 1358(%rcx)
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
	vmovdqu	%xmm11, 1364(%rcx)
	movq	%xmm9, 1380(%rcx)
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
	vmovdqu	%xmm2, 1386(%rcx)
	movq	%xmm3, 1402(%rcx)
	leaq	1408(%rbp), %rcx
	leaq	128(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$2:
	vmovdqu	glob_data + 736(%rip), %ymm0
	vpbroadcastw	glob_data + 4806(%rip), %ymm3
	vpbroadcastw	glob_data + 4808(%rip), %ymm5
	vpbroadcastw	glob_data + 4804(%rip), %ymm4
	vpbroadcastd	glob_data + 4792(%rip), %ymm1
	vpbroadcastq	glob_data + 4592(%rip), %ymm6
	vmovdqu	glob_data + 416(%rip), %ymm8
	vmovdqu	(%rax), %ymm9
	vmovdqu	32(%rax), %ymm10
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
	vmovdqu	%xmm2, (%rcx)
	movd	%xmm7, 16(%rcx)
	vmovdqu	64(%rax), %ymm9
	vmovdqu	96(%rax), %ymm10
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
	vmovdqu	%xmm2, 20(%rcx)
	movd	%xmm7, 36(%rcx)
	vmovdqu	128(%rax), %ymm9
	vmovdqu	160(%rax), %ymm10
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
	vmovdqu	%xmm2, 40(%rcx)
	movd	%xmm7, 56(%rcx)
	vmovdqu	192(%rax), %ymm9
	vmovdqu	224(%rax), %ymm10
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
	vmovdqu	%xmm2, 60(%rcx)
	movd	%xmm7, 76(%rcx)
	vmovdqu	256(%rax), %ymm9
	vmovdqu	288(%rax), %ymm10
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
	vmovdqu	%xmm2, 80(%rcx)
	movd	%xmm7, 96(%rcx)
	vmovdqu	320(%rax), %ymm9
	vmovdqu	352(%rax), %ymm10
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
	vmovdqu	%xmm2, 100(%rcx)
	movd	%xmm7, 116(%rcx)
	vmovdqu	384(%rax), %ymm9
	vmovdqu	416(%rax), %ymm10
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
	vmovdqu	%xmm2, 120(%rcx)
	movd	%xmm7, 136(%rcx)
	vmovdqu	448(%rax), %ymm9
	vmovdqu	480(%rax), %ymm10
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
	vmovdqu	%xmm2, 140(%rcx)
	movd	%xmm3, 156(%rcx)
	movq	%mm2, %rbp
	leaq	2176(%rsp), %rax
	movq	$0, %rcx
	movq	$1, %rdx
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	(%rax), %ymm2
	vmovdqu	(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	32(%rax), %ymm2
	vmovdqu	32(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	64(%rax), %ymm2
	vmovdqu	64(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	96(%rax), %ymm2
	vmovdqu	96(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	128(%rax), %ymm2
	vmovdqu	128(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	160(%rax), %ymm2
	vmovdqu	160(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	192(%rax), %ymm2
	vmovdqu	192(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	224(%rax), %ymm2
	vmovdqu	224(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	256(%rax), %ymm2
	vmovdqu	256(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	288(%rax), %ymm2
	vmovdqu	288(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	320(%rax), %ymm2
	vmovdqu	320(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	352(%rax), %ymm2
	vmovdqu	352(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	384(%rax), %ymm2
	vmovdqu	384(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	416(%rax), %ymm2
	vmovdqu	416(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	448(%rax), %ymm2
	vmovdqu	448(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	480(%rax), %ymm2
	vmovdqu	480(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	512(%rax), %ymm2
	vmovdqu	512(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	544(%rax), %ymm2
	vmovdqu	544(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	576(%rax), %ymm2
	vmovdqu	576(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	608(%rax), %ymm2
	vmovdqu	608(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	640(%rax), %ymm2
	vmovdqu	640(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	672(%rax), %ymm2
	vmovdqu	672(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	704(%rax), %ymm2
	vmovdqu	704(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	736(%rax), %ymm2
	vmovdqu	736(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	768(%rax), %ymm2
	vmovdqu	768(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	800(%rax), %ymm2
	vmovdqu	800(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	832(%rax), %ymm2
	vmovdqu	832(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	864(%rax), %ymm2
	vmovdqu	864(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	896(%rax), %ymm2
	vmovdqu	896(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	928(%rax), %ymm2
	vmovdqu	928(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	960(%rax), %ymm2
	vmovdqu	960(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	992(%rax), %ymm2
	vmovdqu	992(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1024(%rax), %ymm2
	vmovdqu	1024(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1056(%rax), %ymm2
	vmovdqu	1056(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1088(%rax), %ymm2
	vmovdqu	1088(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1120(%rax), %ymm2
	vmovdqu	1120(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1152(%rax), %ymm2
	vmovdqu	1152(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1184(%rax), %ymm2
	vmovdqu	1184(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1216(%rax), %ymm2
	vmovdqu	1216(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1248(%rax), %ymm2
	vmovdqu	1248(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1280(%rax), %ymm2
	vmovdqu	1280(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1312(%rax), %ymm2
	vmovdqu	1312(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1344(%rax), %ymm2
	vmovdqu	1344(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1376(%rax), %ymm2
	vmovdqu	1376(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1408(%rax), %ymm2
	vmovdqu	1408(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1440(%rax), %ymm2
	vmovdqu	1440(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1472(%rax), %ymm2
	vmovdqu	1472(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1504(%rax), %ymm2
	vmovdqu	1504(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovdqu	1536(%rax), %ymm2
	vmovdqu	1536(%rbp), %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vptest	%ymm0, %ymm0
	cmovne	%rdx, %rcx
	movq	%rcx, 21728(%rsp)
	vmovdqu	(%rbp), %ymm0
	vmovdqu	%ymm0, 3776(%rsp)
	vmovdqu	32(%rbp), %ymm0
	vmovdqu	%ymm0, 3808(%rsp)
	vmovdqu	64(%rbp), %ymm0
	vmovdqu	%ymm0, 3840(%rsp)
	vmovdqu	96(%rbp), %ymm0
	vmovdqu	%ymm0, 3872(%rsp)
	vmovdqu	128(%rbp), %ymm0
	vmovdqu	%ymm0, 3904(%rsp)
	vmovdqu	160(%rbp), %ymm0
	vmovdqu	%ymm0, 3936(%rsp)
	vmovdqu	192(%rbp), %ymm0
	vmovdqu	%ymm0, 3968(%rsp)
	vmovdqu	224(%rbp), %ymm0
	vmovdqu	%ymm0, 4000(%rsp)
	vmovdqu	256(%rbp), %ymm0
	vmovdqu	%ymm0, 4032(%rsp)
	vmovdqu	288(%rbp), %ymm0
	vmovdqu	%ymm0, 4064(%rsp)
	vmovdqu	320(%rbp), %ymm0
	vmovdqu	%ymm0, 4096(%rsp)
	vmovdqu	352(%rbp), %ymm0
	vmovdqu	%ymm0, 4128(%rsp)
	vmovdqu	384(%rbp), %ymm0
	vmovdqu	%ymm0, 4160(%rsp)
	vmovdqu	416(%rbp), %ymm0
	vmovdqu	%ymm0, 4192(%rsp)
	vmovdqu	448(%rbp), %ymm0
	vmovdqu	%ymm0, 4224(%rsp)
	vmovdqu	480(%rbp), %ymm0
	vmovdqu	%ymm0, 4256(%rsp)
	vmovdqu	512(%rbp), %ymm0
	vmovdqu	%ymm0, 4288(%rsp)
	vmovdqu	544(%rbp), %ymm0
	vmovdqu	%ymm0, 4320(%rsp)
	vmovdqu	576(%rbp), %ymm0
	vmovdqu	%ymm0, 4352(%rsp)
	vmovdqu	608(%rbp), %ymm0
	vmovdqu	%ymm0, 4384(%rsp)
	vmovdqu	640(%rbp), %ymm0
	vmovdqu	%ymm0, 4416(%rsp)
	vmovdqu	672(%rbp), %ymm0
	vmovdqu	%ymm0, 4448(%rsp)
	vmovdqu	704(%rbp), %ymm0
	vmovdqu	%ymm0, 4480(%rsp)
	vmovdqu	736(%rbp), %ymm0
	vmovdqu	%ymm0, 4512(%rsp)
	vmovdqu	768(%rbp), %ymm0
	vmovdqu	%ymm0, 4544(%rsp)
	vmovdqu	800(%rbp), %ymm0
	vmovdqu	%ymm0, 4576(%rsp)
	vmovdqu	832(%rbp), %ymm0
	vmovdqu	%ymm0, 4608(%rsp)
	vmovdqu	864(%rbp), %ymm0
	vmovdqu	%ymm0, 4640(%rsp)
	vmovdqu	896(%rbp), %ymm0
	vmovdqu	%ymm0, 4672(%rsp)
	vmovdqu	928(%rbp), %ymm0
	vmovdqu	%ymm0, 4704(%rsp)
	vmovdqu	960(%rbp), %ymm0
	vmovdqu	%ymm0, 4736(%rsp)
	vmovdqu	992(%rbp), %ymm0
	vmovdqu	%ymm0, 4768(%rsp)
	vmovdqu	1024(%rbp), %ymm0
	vmovdqu	%ymm0, 4800(%rsp)
	vmovdqu	1056(%rbp), %ymm0
	vmovdqu	%ymm0, 4832(%rsp)
	vmovdqu	1088(%rbp), %ymm0
	vmovdqu	%ymm0, 4864(%rsp)
	vmovdqu	1120(%rbp), %ymm0
	vmovdqu	%ymm0, 4896(%rsp)
	vmovdqu	1152(%rbp), %ymm0
	vmovdqu	%ymm0, 4928(%rsp)
	vmovdqu	1184(%rbp), %ymm0
	vmovdqu	%ymm0, 4960(%rsp)
	vmovdqu	1216(%rbp), %ymm0
	vmovdqu	%ymm0, 4992(%rsp)
	vmovdqu	1248(%rbp), %ymm0
	vmovdqu	%ymm0, 5024(%rsp)
	vmovdqu	1280(%rbp), %ymm0
	vmovdqu	%ymm0, 5056(%rsp)
	vmovdqu	1312(%rbp), %ymm0
	vmovdqu	%ymm0, 5088(%rsp)
	vmovdqu	1344(%rbp), %ymm0
	vmovdqu	%ymm0, 5120(%rsp)
	vmovdqu	1376(%rbp), %ymm0
	vmovdqu	%ymm0, 5152(%rsp)
	vmovdqu	1408(%rbp), %ymm0
	vmovdqu	%ymm0, 5184(%rsp)
	vmovdqu	1440(%rbp), %ymm0
	vmovdqu	%ymm0, 5216(%rsp)
	vmovdqu	1472(%rbp), %ymm0
	vmovdqu	%ymm0, 5248(%rsp)
	vmovdqu	1504(%rbp), %ymm0
	vmovdqu	%ymm0, 5280(%rsp)
	vmovdqu	1536(%rbp), %ymm0
	vmovdqu	%ymm0, 5312(%rsp)
	movq	%mm1, %rdi
	leaq	3744(%rsp), %rbx
	leaq	-280(%rsp), %rsp
	call	L_shake256_A32__A1600$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$1:
	leaq	280(%rsp), %rsp
	movq	21728(%rsp), %rcx
	leaq	64(%rsp), %rax
	negq	%rcx
	movq	%rcx, 21728(%rsp)
	vpbroadcastq	21728(%rsp), %ymm0
	vmovdqu	(%rax), %ymm2
	vmovdqu	(%rdi), %ymm1
	vpblendvb	%ymm0, %ymm1, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rdi)
	xorl	%eax, %eax
	movq	21768(%rsp), %rbx
	movq	21776(%rsp), %rbp
	movq	21784(%rsp), %r12
	movq	21792(%rsp), %r13
	movq	21800(%rsp), %r14
	movq	21808(%rsp), %r15
	movq	21816(%rsp), %rsp
	ret
	.type	jade_kem_mlkem_mlkem1024_amd64_avx2_enc, %function
jade_kem_mlkem_mlkem1024_amd64_avx2_enc:
	movq	%rsp, %rax
	leaq	-18656(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 18600(%rsp)
	movq	%rbp, 18608(%rsp)
	movq	%r12, 18616(%rsp)
	movq	%r13, 18624(%rsp)
	movq	%r14, 18632(%rsp)
	movq	%r15, 18640(%rsp)
	movq	%rax, 18648(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %rbp
	movq	%rsi, %r12
	movq	%rdx, %rbx
	movq	%rsp, %rdi
	movq	$32, %rsi
	call	__jasmin_syscall_randombytes__
	movq	%rbp, 18592(%rsp)
	movq	%rbx, %mm0
	movq	%r12, %mm1
	vmovdqu	(%rax), %ymm1
	vmovdqu	%ymm1, 32(%rsp)
	leaq	64(%rsp), %rdi
	leaq	-248(%rsp), %rsp
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$66:
	leaq	248(%rsp), %rsp
	leaq	96(%rsp), %rdi
	leaq	32(%rsp), %rbx
	leaq	-248(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$65:
	leaq	248(%rsp), %rsp
	movq	18592(%rsp), %rbp
	movq	%mm0, %rbx
	leaq	32(%rsp), %rcx
	leaq	128(%rsp), %r8
	movq	%rbp, %mm2
	movq	%r8, 18592(%rsp)
	movq	%rbx, %rax
	leaq	2208(%rsp), %rsi
	movq	%rax, %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$64:
	leaq	2720(%rsp), %rsi
	leaq	384(%rax), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$63:
	leaq	3232(%rsp), %rsi
	leaq	768(%rax), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$62:
	leaq	3744(%rsp), %rsi
	leaq	1152(%rax), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$61:
	movq	1536(%rbx), %rax
// declassify_val u64 %rax
	movq	%rax, (%rsp)
	movq	1544(%rbx), %rax
// declassify_val u64 %rax
	movq	%rax, 8(%rsp)
	movq	1552(%rbx), %rax
// declassify_val u64 %rax
	movq	%rax, 16(%rsp)
	movq	1560(%rbx), %rax
// declassify_val u64 %rax
	movq	%rax, 24(%rsp)
	leaq	160(%rsp), %rax
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$60:
	movq	$1, %rax
	leaq	10400(%rsp), %rcx
	movq	%rsp, %r8
	leaq	-2200(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$59:
	leaq	2200(%rsp), %rsp
	movq	18592(%rsp), %r8
	movb	$0, %bl
	leaq	4256(%rsp), %rcx
	leaq	4768(%rsp), %r9
	leaq	5280(%rsp), %r10
	leaq	5792(%rsp), %r11
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$58:
	leaq	600(%rsp), %rsp
	movb	$4, %bl
	leaq	6304(%rsp), %rcx
	leaq	6816(%rsp), %r9
	leaq	7328(%rsp), %r10
	leaq	7840(%rsp), %r11
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$57:
	leaq	600(%rsp), %rsp
	movb	$8, %al
	leaq	672(%rsp), %rcx
	leaq	-184(%rsp), %rsp
	call	L_poly_getnoise_eta2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$56:
	leaq	184(%rsp), %rsp
	leaq	4256(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$55:
	leaq	4768(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$54:
	leaq	5280(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$53:
	leaq	5792(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$52:
	leaq	8352(%rsp), %rax
	leaq	10400(%rsp), %rsi
	leaq	4256(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$51:
	leaq	1184(%rsp), %rax
	leaq	10912(%rsp), %rsi
	leaq	4768(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$50:
	leaq	8352(%rsp), %rax
	leaq	1184(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$49:
	leaq	1184(%rsp), %rax
	leaq	11424(%rsp), %rsi
	leaq	5280(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$48:
	leaq	8352(%rsp), %rax
	leaq	1184(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$47:
	leaq	1184(%rsp), %rax
	leaq	11936(%rsp), %rsi
	leaq	5792(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$46:
	leaq	8352(%rsp), %rax
	leaq	1184(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$45:
	leaq	8864(%rsp), %rax
	leaq	12448(%rsp), %rsi
	leaq	4256(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$44:
	leaq	1184(%rsp), %rax
	leaq	12960(%rsp), %rsi
	leaq	4768(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$43:
	leaq	8864(%rsp), %rax
	leaq	1184(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$42:
	leaq	1184(%rsp), %rax
	leaq	13472(%rsp), %rsi
	leaq	5280(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$41:
	leaq	8864(%rsp), %rax
	leaq	1184(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$40:
	leaq	1184(%rsp), %rax
	leaq	13984(%rsp), %rsi
	leaq	5792(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$39:
	leaq	8864(%rsp), %rax
	leaq	1184(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$38:
	leaq	9376(%rsp), %rax
	leaq	14496(%rsp), %rsi
	leaq	4256(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$37:
	leaq	1184(%rsp), %rax
	leaq	15008(%rsp), %rsi
	leaq	4768(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$36:
	leaq	9376(%rsp), %rax
	leaq	1184(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$35:
	leaq	1184(%rsp), %rax
	leaq	15520(%rsp), %rsi
	leaq	5280(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$34:
	leaq	9376(%rsp), %rax
	leaq	1184(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$33:
	leaq	1184(%rsp), %rax
	leaq	16032(%rsp), %rsi
	leaq	5792(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$32:
	leaq	9376(%rsp), %rax
	leaq	1184(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$31:
	leaq	9888(%rsp), %rax
	leaq	16544(%rsp), %rsi
	leaq	4256(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$30:
	leaq	1184(%rsp), %rax
	leaq	17056(%rsp), %rsi
	leaq	4768(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$29:
	leaq	9888(%rsp), %rax
	leaq	1184(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$28:
	leaq	1184(%rsp), %rax
	leaq	17568(%rsp), %rsi
	leaq	5280(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$27:
	leaq	9888(%rsp), %rax
	leaq	1184(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$26:
	leaq	1184(%rsp), %rax
	leaq	18080(%rsp), %rsi
	leaq	5792(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$25:
	leaq	9888(%rsp), %rax
	leaq	1184(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$24:
	leaq	1184(%rsp), %rax
	leaq	2208(%rsp), %rsi
	leaq	4256(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$23:
	leaq	1696(%rsp), %rax
	leaq	2720(%rsp), %rsi
	leaq	4768(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$22:
	leaq	1184(%rsp), %rax
	leaq	1696(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$21:
	leaq	1696(%rsp), %rax
	leaq	3232(%rsp), %rsi
	leaq	5280(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$20:
	leaq	1184(%rsp), %rax
	leaq	1696(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$19:
	leaq	1696(%rsp), %rax
	leaq	3744(%rsp), %rsi
	leaq	5792(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$18:
	leaq	1184(%rsp), %rax
	leaq	1696(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$17:
	leaq	8352(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$16:
	leaq	8864(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$15:
	leaq	9376(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$14:
	leaq	9888(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$13:
	leaq	1184(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$12:
	leaq	8352(%rsp), %rax
	leaq	6304(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$11:
	leaq	8864(%rsp), %rax
	leaq	6816(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$10:
	leaq	9376(%rsp), %rax
	leaq	7328(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$9:
	leaq	9888(%rsp), %rax
	leaq	7840(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$8:
	leaq	1184(%rsp), %rax
	leaq	672(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$7:
	leaq	1184(%rsp), %rax
	leaq	160(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$6:
	leaq	8352(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	leaq	8864(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	leaq	9376(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	leaq	9888(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	leaq	1184(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	movq	%mm2, %rbp
	movq	%rbp, %rcx
	leaq	8352(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$5:
	leaq	8864(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$4:
	leaq	9376(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$3:
	leaq	9888(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$2:
	vmovdqu	glob_data + 736(%rip), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 4800(%rip), %ymm2
	vpbroadcastw	glob_data + 4798(%rip), %ymm3
	vpbroadcastw	glob_data + 4796(%rip), %ymm5
	vpbroadcastq	glob_data + 4584(%rip), %ymm4
	vpbroadcastq	glob_data + 4576(%rip), %ymm6
	vmovdqu	glob_data + 160(%rip), %ymm7
	vmovdqu	glob_data + 128(%rip), %ymm8
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
	vmovdqu	%xmm11, (%rcx)
	movq	%xmm9, 16(%rcx)
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
	vmovdqu	%xmm11, 22(%rcx)
	movq	%xmm9, 38(%rcx)
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
	vmovdqu	%xmm11, 44(%rcx)
	movq	%xmm9, 60(%rcx)
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
	vmovdqu	%xmm11, 66(%rcx)
	movq	%xmm9, 82(%rcx)
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
	vmovdqu	%xmm11, 88(%rcx)
	movq	%xmm9, 104(%rcx)
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
	vmovdqu	%xmm11, 110(%rcx)
	movq	%xmm9, 126(%rcx)
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
	vmovdqu	%xmm11, 132(%rcx)
	movq	%xmm9, 148(%rcx)
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
	vmovdqu	%xmm11, 154(%rcx)
	movq	%xmm9, 170(%rcx)
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
	vmovdqu	%xmm11, 176(%rcx)
	movq	%xmm9, 192(%rcx)
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
	vmovdqu	%xmm11, 198(%rcx)
	movq	%xmm9, 214(%rcx)
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
	vmovdqu	%xmm11, 220(%rcx)
	movq	%xmm9, 236(%rcx)
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
	vmovdqu	%xmm11, 242(%rcx)
	movq	%xmm9, 258(%rcx)
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
	vmovdqu	%xmm11, 264(%rcx)
	movq	%xmm9, 280(%rcx)
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
	vmovdqu	%xmm11, 286(%rcx)
	movq	%xmm9, 302(%rcx)
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
	vmovdqu	%xmm11, 308(%rcx)
	movq	%xmm9, 324(%rcx)
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
	vmovdqu	%xmm11, 330(%rcx)
	movq	%xmm9, 346(%rcx)
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
	vmovdqu	%xmm11, 352(%rcx)
	movq	%xmm9, 368(%rcx)
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
	vmovdqu	%xmm11, 374(%rcx)
	movq	%xmm9, 390(%rcx)
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
	vmovdqu	%xmm11, 396(%rcx)
	movq	%xmm9, 412(%rcx)
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
	vmovdqu	%xmm11, 418(%rcx)
	movq	%xmm9, 434(%rcx)
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
	vmovdqu	%xmm11, 440(%rcx)
	movq	%xmm9, 456(%rcx)
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
	vmovdqu	%xmm11, 462(%rcx)
	movq	%xmm9, 478(%rcx)
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
	vmovdqu	%xmm11, 484(%rcx)
	movq	%xmm9, 500(%rcx)
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
	vmovdqu	%xmm11, 506(%rcx)
	movq	%xmm9, 522(%rcx)
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
	vmovdqu	%xmm11, 528(%rcx)
	movq	%xmm9, 544(%rcx)
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
	vmovdqu	%xmm11, 550(%rcx)
	movq	%xmm9, 566(%rcx)
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
	vmovdqu	%xmm11, 572(%rcx)
	movq	%xmm9, 588(%rcx)
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
	vmovdqu	%xmm11, 594(%rcx)
	movq	%xmm9, 610(%rcx)
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
	vmovdqu	%xmm11, 616(%rcx)
	movq	%xmm9, 632(%rcx)
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
	vmovdqu	%xmm11, 638(%rcx)
	movq	%xmm9, 654(%rcx)
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
	vmovdqu	%xmm11, 660(%rcx)
	movq	%xmm9, 676(%rcx)
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
	vmovdqu	%xmm11, 682(%rcx)
	movq	%xmm9, 698(%rcx)
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
	vmovdqu	%xmm11, 704(%rcx)
	movq	%xmm9, 720(%rcx)
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
	vmovdqu	%xmm11, 726(%rcx)
	movq	%xmm9, 742(%rcx)
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
	vmovdqu	%xmm11, 748(%rcx)
	movq	%xmm9, 764(%rcx)
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
	vmovdqu	%xmm11, 770(%rcx)
	movq	%xmm9, 786(%rcx)
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
	vmovdqu	%xmm11, 792(%rcx)
	movq	%xmm9, 808(%rcx)
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
	vmovdqu	%xmm11, 814(%rcx)
	movq	%xmm9, 830(%rcx)
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
	vmovdqu	%xmm11, 836(%rcx)
	movq	%xmm9, 852(%rcx)
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
	vmovdqu	%xmm11, 858(%rcx)
	movq	%xmm9, 874(%rcx)
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
	vmovdqu	%xmm11, 880(%rcx)
	movq	%xmm9, 896(%rcx)
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
	vmovdqu	%xmm11, 902(%rcx)
	movq	%xmm9, 918(%rcx)
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
	vmovdqu	%xmm11, 924(%rcx)
	movq	%xmm9, 940(%rcx)
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
	vmovdqu	%xmm11, 946(%rcx)
	movq	%xmm9, 962(%rcx)
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
	vmovdqu	%xmm11, 968(%rcx)
	movq	%xmm9, 984(%rcx)
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
	vmovdqu	%xmm11, 990(%rcx)
	movq	%xmm9, 1006(%rcx)
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
	vmovdqu	%xmm11, 1012(%rcx)
	movq	%xmm9, 1028(%rcx)
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
	vmovdqu	%xmm11, 1034(%rcx)
	movq	%xmm9, 1050(%rcx)
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
	vmovdqu	%xmm11, 1056(%rcx)
	movq	%xmm9, 1072(%rcx)
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
	vmovdqu	%xmm11, 1078(%rcx)
	movq	%xmm9, 1094(%rcx)
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
	vmovdqu	%xmm11, 1100(%rcx)
	movq	%xmm9, 1116(%rcx)
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
	vmovdqu	%xmm11, 1122(%rcx)
	movq	%xmm9, 1138(%rcx)
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
	vmovdqu	%xmm11, 1144(%rcx)
	movq	%xmm9, 1160(%rcx)
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
	vmovdqu	%xmm11, 1166(%rcx)
	movq	%xmm9, 1182(%rcx)
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
	vmovdqu	%xmm11, 1188(%rcx)
	movq	%xmm9, 1204(%rcx)
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
	vmovdqu	%xmm11, 1210(%rcx)
	movq	%xmm9, 1226(%rcx)
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
	vmovdqu	%xmm11, 1232(%rcx)
	movq	%xmm9, 1248(%rcx)
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
	vmovdqu	%xmm11, 1254(%rcx)
	movq	%xmm9, 1270(%rcx)
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
	vmovdqu	%xmm11, 1276(%rcx)
	movq	%xmm9, 1292(%rcx)
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
	vmovdqu	%xmm11, 1298(%rcx)
	movq	%xmm9, 1314(%rcx)
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
	vmovdqu	%xmm11, 1320(%rcx)
	movq	%xmm9, 1336(%rcx)
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
	vmovdqu	%xmm11, 1342(%rcx)
	movq	%xmm9, 1358(%rcx)
	vmovdqu	10336(%rsp), %ymm9
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
	vmovdqu	%xmm11, 1364(%rcx)
	movq	%xmm9, 1380(%rcx)
	vmovdqu	10368(%rsp), %ymm9
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
	vmovdqu	%xmm2, 1386(%rcx)
	movq	%xmm3, 1402(%rcx)
	leaq	1408(%rbp), %rcx
	leaq	1184(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc$1:
	vmovdqu	glob_data + 736(%rip), %ymm0
	vpbroadcastw	glob_data + 4806(%rip), %ymm3
	vpbroadcastw	glob_data + 4808(%rip), %ymm5
	vpbroadcastw	glob_data + 4804(%rip), %ymm4
	vpbroadcastd	glob_data + 4792(%rip), %ymm1
	vpbroadcastq	glob_data + 4592(%rip), %ymm6
	vmovdqu	glob_data + 416(%rip), %ymm8
	vmovdqu	(%rax), %ymm9
	vmovdqu	32(%rax), %ymm10
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
	vmovdqu	%xmm2, (%rcx)
	movd	%xmm7, 16(%rcx)
	vmovdqu	64(%rax), %ymm9
	vmovdqu	96(%rax), %ymm10
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
	vmovdqu	%xmm2, 20(%rcx)
	movd	%xmm7, 36(%rcx)
	vmovdqu	128(%rax), %ymm9
	vmovdqu	160(%rax), %ymm10
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
	vmovdqu	%xmm2, 40(%rcx)
	movd	%xmm7, 56(%rcx)
	vmovdqu	192(%rax), %ymm9
	vmovdqu	224(%rax), %ymm10
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
	vmovdqu	%xmm2, 60(%rcx)
	movd	%xmm7, 76(%rcx)
	vmovdqu	256(%rax), %ymm9
	vmovdqu	288(%rax), %ymm10
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
	vmovdqu	%xmm2, 80(%rcx)
	movd	%xmm7, 96(%rcx)
	vmovdqu	320(%rax), %ymm9
	vmovdqu	352(%rax), %ymm10
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
	vmovdqu	%xmm2, 100(%rcx)
	movd	%xmm7, 116(%rcx)
	vmovdqu	384(%rax), %ymm9
	vmovdqu	416(%rax), %ymm10
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
	vmovdqu	%xmm2, 120(%rcx)
	movd	%xmm7, 136(%rcx)
	vmovdqu	448(%rax), %ymm9
	vmovdqu	480(%rax), %ymm10
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
	vmovdqu	%xmm2, 140(%rcx)
	movd	%xmm3, 156(%rcx)
	movq	%mm1, %rsi
	vmovdqu	96(%rsp), %ymm0
	vmovdqu	%ymm0, (%rsi)
	xorl	%eax, %eax
	movq	18600(%rsp), %rbx
	movq	18608(%rsp), %rbp
	movq	18616(%rsp), %r12
	movq	18624(%rsp), %r13
	movq	18632(%rsp), %r14
	movq	18640(%rsp), %r15
	movq	18648(%rsp), %rsp
	ret
	.type	jade_kem_mlkem_mlkem1024_amd64_avx2_keypair, %function
jade_kem_mlkem_mlkem1024_amd64_avx2_keypair:
	movq	%rsp, %rax
	leaq	-15168(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 15112(%rsp)
	movq	%rbp, 15120(%rsp)
	movq	%r12, 15128(%rsp)
	movq	%r13, 15136(%rsp)
	movq	%r14, 15144(%rsp)
	movq	%r15, 15152(%rsp)
	movq	%rax, 15160(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	leaq	15048(%rsp), %rdi
	movq	$64, %rsi
	call	__jasmin_syscall_randombytes__
	movq	%rax, %mm1
	movq	%rbp, %rdx
	movq	%rbp, %mm2
	movq	%rbx, %mm3
	movq	%rdx, %mm4
	movq	(%rax), %rdx
	movq	%rdx, (%rsp)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rsp)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 24(%rsp)
	movb	$4, 32(%rsp)
	leaq	64(%rsp), %rdi
	movq	%rsp, %rbx
	leaq	-248(%rsp), %rsp
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$57:
	leaq	248(%rsp), %rsp
	movq	64(%rsp), %rax
// declassify_val u64 %rax
	movq	%rax, 15016(%rsp)
	movq	96(%rsp), %rax
	movq	%rax, 14984(%rsp)
	movq	72(%rsp), %rax
// declassify_val u64 %rax
	movq	%rax, 15024(%rsp)
	movq	104(%rsp), %rax
	movq	%rax, 14992(%rsp)
	movq	80(%rsp), %rax
// declassify_val u64 %rax
	movq	%rax, 15032(%rsp)
	movq	112(%rsp), %rax
	movq	%rax, 15000(%rsp)
	movq	88(%rsp), %rax
// declassify_val u64 %rax
	movq	%rax, 15040(%rsp)
	movq	120(%rsp), %rax
	movq	%rax, 15008(%rsp)
	movq	$0, %rax
	leaq	6784(%rsp), %rcx
	leaq	15016(%rsp), %r8
	leaq	-2200(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$56:
	leaq	2200(%rsp), %rsp
	movb	$0, %bl
	leaq	640(%rsp), %rcx
	leaq	1152(%rsp), %r9
	leaq	1664(%rsp), %r10
	leaq	2176(%rsp), %r11
	leaq	14984(%rsp), %r8
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$55:
	leaq	600(%rsp), %rsp
	movb	$4, %bl
	leaq	2688(%rsp), %rcx
	leaq	3200(%rsp), %r9
	leaq	3712(%rsp), %r10
	leaq	4224(%rsp), %r11
	leaq	14984(%rsp), %r8
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$54:
	leaq	600(%rsp), %rsp
	leaq	640(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$53:
	leaq	1152(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$52:
	leaq	1664(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$51:
	leaq	2176(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$50:
	leaq	2688(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$49:
	leaq	3200(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$48:
	leaq	3712(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$47:
	leaq	4224(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$46:
	leaq	4736(%rsp), %rax
	leaq	6784(%rsp), %rsi
	leaq	640(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$45:
	leaq	128(%rsp), %rax
	leaq	7296(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$44:
	leaq	4736(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$43:
	leaq	128(%rsp), %rax
	leaq	7808(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$42:
	leaq	4736(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$41:
	leaq	128(%rsp), %rax
	leaq	8320(%rsp), %rsi
	leaq	2176(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$40:
	leaq	4736(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$39:
	leaq	4736(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$38:
	leaq	5248(%rsp), %rax
	leaq	8832(%rsp), %rsi
	leaq	640(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$37:
	leaq	128(%rsp), %rax
	leaq	9344(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$36:
	leaq	5248(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$35:
	leaq	128(%rsp), %rax
	leaq	9856(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$34:
	leaq	5248(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$33:
	leaq	128(%rsp), %rax
	leaq	10368(%rsp), %rsi
	leaq	2176(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$32:
	leaq	5248(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$31:
	leaq	5248(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$30:
	leaq	5760(%rsp), %rax
	leaq	10880(%rsp), %rsi
	leaq	640(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$29:
	leaq	128(%rsp), %rax
	leaq	11392(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$28:
	leaq	5760(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$27:
	leaq	128(%rsp), %rax
	leaq	11904(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$26:
	leaq	5760(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$25:
	leaq	128(%rsp), %rax
	leaq	12416(%rsp), %rsi
	leaq	2176(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$24:
	leaq	5760(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$23:
	leaq	5760(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$22:
	leaq	6272(%rsp), %rax
	leaq	12928(%rsp), %rsi
	leaq	640(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$21:
	leaq	128(%rsp), %rax
	leaq	13440(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$20:
	leaq	6272(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$19:
	leaq	128(%rsp), %rax
	leaq	13952(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$18:
	leaq	6272(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$17:
	leaq	128(%rsp), %rax
	leaq	14464(%rsp), %rsi
	leaq	2176(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$16:
	leaq	6272(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$15:
	leaq	6272(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$14:
	leaq	4736(%rsp), %rax
	leaq	2688(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$13:
	leaq	5248(%rsp), %rax
	leaq	3200(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$12:
	leaq	5760(%rsp), %rax
	leaq	3712(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$11:
	leaq	6272(%rsp), %rax
	leaq	4224(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$10:
	leaq	4736(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	leaq	5248(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	leaq	5760(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	leaq	6272(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	movq	%mm4, %rcx
	movq	%rcx, %r8
	leaq	640(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$9:
	leaq	384(%rcx), %r8
	leaq	1152(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$8:
	leaq	768(%rcx), %r8
	leaq	1664(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$7:
	leaq	1152(%rcx), %r8
	leaq	2176(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$6:
	movq	%rbx, %rsi
	movq	%rsi, %r8
	leaq	4736(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$5:
	leaq	384(%rsi), %r8
	leaq	5248(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$4:
	leaq	768(%rsi), %r8
	leaq	5760(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$3:
	leaq	1152(%rsi), %r8
	leaq	6272(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$2:
	movq	15016(%rsp), %rax
	movq	%rax, 1536(%rbx)
	movq	15024(%rsp), %rax
	movq	%rax, 1544(%rbx)
	movq	15032(%rsp), %rax
	movq	%rax, 1552(%rbx)
	movq	15040(%rsp), %rax
	movq	%rax, 1560(%rbx)
	movq	%mm2, %rdx
	movq	(%rbx), %rax
	movq	%rax, 1536(%rdx)
	movq	8(%rbx), %rax
	movq	%rax, 1544(%rdx)
	movq	16(%rbx), %rax
	movq	%rax, 1552(%rdx)
	movq	24(%rbx), %rax
	movq	%rax, 1560(%rdx)
	movq	32(%rbx), %rax
	movq	%rax, 1568(%rdx)
	movq	40(%rbx), %rax
	movq	%rax, 1576(%rdx)
	movq	48(%rbx), %rax
	movq	%rax, 1584(%rdx)
	movq	56(%rbx), %rax
	movq	%rax, 1592(%rdx)
	movq	64(%rbx), %rax
	movq	%rax, 1600(%rdx)
	movq	72(%rbx), %rax
	movq	%rax, 1608(%rdx)
	movq	80(%rbx), %rax
	movq	%rax, 1616(%rdx)
	movq	88(%rbx), %rax
	movq	%rax, 1624(%rdx)
	movq	96(%rbx), %rax
	movq	%rax, 1632(%rdx)
	movq	104(%rbx), %rax
	movq	%rax, 1640(%rdx)
	movq	112(%rbx), %rax
	movq	%rax, 1648(%rdx)
	movq	120(%rbx), %rax
	movq	%rax, 1656(%rdx)
	movq	128(%rbx), %rax
	movq	%rax, 1664(%rdx)
	movq	136(%rbx), %rax
	movq	%rax, 1672(%rdx)
	movq	144(%rbx), %rax
	movq	%rax, 1680(%rdx)
	movq	152(%rbx), %rax
	movq	%rax, 1688(%rdx)
	movq	160(%rbx), %rax
	movq	%rax, 1696(%rdx)
	movq	168(%rbx), %rax
	movq	%rax, 1704(%rdx)
	movq	176(%rbx), %rax
	movq	%rax, 1712(%rdx)
	movq	184(%rbx), %rax
	movq	%rax, 1720(%rdx)
	movq	192(%rbx), %rax
	movq	%rax, 1728(%rdx)
	movq	200(%rbx), %rax
	movq	%rax, 1736(%rdx)
	movq	208(%rbx), %rax
	movq	%rax, 1744(%rdx)
	movq	216(%rbx), %rax
	movq	%rax, 1752(%rdx)
	movq	224(%rbx), %rax
	movq	%rax, 1760(%rdx)
	movq	232(%rbx), %rax
	movq	%rax, 1768(%rdx)
	movq	240(%rbx), %rax
	movq	%rax, 1776(%rdx)
	movq	248(%rbx), %rax
	movq	%rax, 1784(%rdx)
	movq	256(%rbx), %rax
	movq	%rax, 1792(%rdx)
	movq	264(%rbx), %rax
	movq	%rax, 1800(%rdx)
	movq	272(%rbx), %rax
	movq	%rax, 1808(%rdx)
	movq	280(%rbx), %rax
	movq	%rax, 1816(%rdx)
	movq	288(%rbx), %rax
	movq	%rax, 1824(%rdx)
	movq	296(%rbx), %rax
	movq	%rax, 1832(%rdx)
	movq	304(%rbx), %rax
	movq	%rax, 1840(%rdx)
	movq	312(%rbx), %rax
	movq	%rax, 1848(%rdx)
	movq	320(%rbx), %rax
	movq	%rax, 1856(%rdx)
	movq	328(%rbx), %rax
	movq	%rax, 1864(%rdx)
	movq	336(%rbx), %rax
	movq	%rax, 1872(%rdx)
	movq	344(%rbx), %rax
	movq	%rax, 1880(%rdx)
	movq	352(%rbx), %rax
	movq	%rax, 1888(%rdx)
	movq	360(%rbx), %rax
	movq	%rax, 1896(%rdx)
	movq	368(%rbx), %rax
	movq	%rax, 1904(%rdx)
	movq	376(%rbx), %rax
	movq	%rax, 1912(%rdx)
	movq	384(%rbx), %rax
	movq	%rax, 1920(%rdx)
	movq	392(%rbx), %rax
	movq	%rax, 1928(%rdx)
	movq	400(%rbx), %rax
	movq	%rax, 1936(%rdx)
	movq	408(%rbx), %rax
	movq	%rax, 1944(%rdx)
	movq	416(%rbx), %rax
	movq	%rax, 1952(%rdx)
	movq	424(%rbx), %rax
	movq	%rax, 1960(%rdx)
	movq	432(%rbx), %rax
	movq	%rax, 1968(%rdx)
	movq	440(%rbx), %rax
	movq	%rax, 1976(%rdx)
	movq	448(%rbx), %rax
	movq	%rax, 1984(%rdx)
	movq	456(%rbx), %rax
	movq	%rax, 1992(%rdx)
	movq	464(%rbx), %rax
	movq	%rax, 2000(%rdx)
	movq	472(%rbx), %rax
	movq	%rax, 2008(%rdx)
	movq	480(%rbx), %rax
	movq	%rax, 2016(%rdx)
	movq	488(%rbx), %rax
	movq	%rax, 2024(%rdx)
	movq	496(%rbx), %rax
	movq	%rax, 2032(%rdx)
	movq	504(%rbx), %rax
	movq	%rax, 2040(%rdx)
	movq	512(%rbx), %rax
	movq	%rax, 2048(%rdx)
	movq	520(%rbx), %rax
	movq	%rax, 2056(%rdx)
	movq	528(%rbx), %rax
	movq	%rax, 2064(%rdx)
	movq	536(%rbx), %rax
	movq	%rax, 2072(%rdx)
	movq	544(%rbx), %rax
	movq	%rax, 2080(%rdx)
	movq	552(%rbx), %rax
	movq	%rax, 2088(%rdx)
	movq	560(%rbx), %rax
	movq	%rax, 2096(%rdx)
	movq	568(%rbx), %rax
	movq	%rax, 2104(%rdx)
	movq	576(%rbx), %rax
	movq	%rax, 2112(%rdx)
	movq	584(%rbx), %rax
	movq	%rax, 2120(%rdx)
	movq	592(%rbx), %rax
	movq	%rax, 2128(%rdx)
	movq	600(%rbx), %rax
	movq	%rax, 2136(%rdx)
	movq	608(%rbx), %rax
	movq	%rax, 2144(%rdx)
	movq	616(%rbx), %rax
	movq	%rax, 2152(%rdx)
	movq	624(%rbx), %rax
	movq	%rax, 2160(%rdx)
	movq	632(%rbx), %rax
	movq	%rax, 2168(%rdx)
	movq	640(%rbx), %rax
	movq	%rax, 2176(%rdx)
	movq	648(%rbx), %rax
	movq	%rax, 2184(%rdx)
	movq	656(%rbx), %rax
	movq	%rax, 2192(%rdx)
	movq	664(%rbx), %rax
	movq	%rax, 2200(%rdx)
	movq	672(%rbx), %rax
	movq	%rax, 2208(%rdx)
	movq	680(%rbx), %rax
	movq	%rax, 2216(%rdx)
	movq	688(%rbx), %rax
	movq	%rax, 2224(%rdx)
	movq	696(%rbx), %rax
	movq	%rax, 2232(%rdx)
	movq	704(%rbx), %rax
	movq	%rax, 2240(%rdx)
	movq	712(%rbx), %rax
	movq	%rax, 2248(%rdx)
	movq	720(%rbx), %rax
	movq	%rax, 2256(%rdx)
	movq	728(%rbx), %rax
	movq	%rax, 2264(%rdx)
	movq	736(%rbx), %rax
	movq	%rax, 2272(%rdx)
	movq	744(%rbx), %rax
	movq	%rax, 2280(%rdx)
	movq	752(%rbx), %rax
	movq	%rax, 2288(%rdx)
	movq	760(%rbx), %rax
	movq	%rax, 2296(%rdx)
	movq	768(%rbx), %rax
	movq	%rax, 2304(%rdx)
	movq	776(%rbx), %rax
	movq	%rax, 2312(%rdx)
	movq	784(%rbx), %rax
	movq	%rax, 2320(%rdx)
	movq	792(%rbx), %rax
	movq	%rax, 2328(%rdx)
	movq	800(%rbx), %rax
	movq	%rax, 2336(%rdx)
	movq	808(%rbx), %rax
	movq	%rax, 2344(%rdx)
	movq	816(%rbx), %rax
	movq	%rax, 2352(%rdx)
	movq	824(%rbx), %rax
	movq	%rax, 2360(%rdx)
	movq	832(%rbx), %rax
	movq	%rax, 2368(%rdx)
	movq	840(%rbx), %rax
	movq	%rax, 2376(%rdx)
	movq	848(%rbx), %rax
	movq	%rax, 2384(%rdx)
	movq	856(%rbx), %rax
	movq	%rax, 2392(%rdx)
	movq	864(%rbx), %rax
	movq	%rax, 2400(%rdx)
	movq	872(%rbx), %rax
	movq	%rax, 2408(%rdx)
	movq	880(%rbx), %rax
	movq	%rax, 2416(%rdx)
	movq	888(%rbx), %rax
	movq	%rax, 2424(%rdx)
	movq	896(%rbx), %rax
	movq	%rax, 2432(%rdx)
	movq	904(%rbx), %rax
	movq	%rax, 2440(%rdx)
	movq	912(%rbx), %rax
	movq	%rax, 2448(%rdx)
	movq	920(%rbx), %rax
	movq	%rax, 2456(%rdx)
	movq	928(%rbx), %rax
	movq	%rax, 2464(%rdx)
	movq	936(%rbx), %rax
	movq	%rax, 2472(%rdx)
	movq	944(%rbx), %rax
	movq	%rax, 2480(%rdx)
	movq	952(%rbx), %rax
	movq	%rax, 2488(%rdx)
	movq	960(%rbx), %rax
	movq	%rax, 2496(%rdx)
	movq	968(%rbx), %rax
	movq	%rax, 2504(%rdx)
	movq	976(%rbx), %rax
	movq	%rax, 2512(%rdx)
	movq	984(%rbx), %rax
	movq	%rax, 2520(%rdx)
	movq	992(%rbx), %rax
	movq	%rax, 2528(%rdx)
	movq	1000(%rbx), %rax
	movq	%rax, 2536(%rdx)
	movq	1008(%rbx), %rax
	movq	%rax, 2544(%rdx)
	movq	1016(%rbx), %rax
	movq	%rax, 2552(%rdx)
	movq	1024(%rbx), %rax
	movq	%rax, 2560(%rdx)
	movq	1032(%rbx), %rax
	movq	%rax, 2568(%rdx)
	movq	1040(%rbx), %rax
	movq	%rax, 2576(%rdx)
	movq	1048(%rbx), %rax
	movq	%rax, 2584(%rdx)
	movq	1056(%rbx), %rax
	movq	%rax, 2592(%rdx)
	movq	1064(%rbx), %rax
	movq	%rax, 2600(%rdx)
	movq	1072(%rbx), %rax
	movq	%rax, 2608(%rdx)
	movq	1080(%rbx), %rax
	movq	%rax, 2616(%rdx)
	movq	1088(%rbx), %rax
	movq	%rax, 2624(%rdx)
	movq	1096(%rbx), %rax
	movq	%rax, 2632(%rdx)
	movq	1104(%rbx), %rax
	movq	%rax, 2640(%rdx)
	movq	1112(%rbx), %rax
	movq	%rax, 2648(%rdx)
	movq	1120(%rbx), %rax
	movq	%rax, 2656(%rdx)
	movq	1128(%rbx), %rax
	movq	%rax, 2664(%rdx)
	movq	1136(%rbx), %rax
	movq	%rax, 2672(%rdx)
	movq	1144(%rbx), %rax
	movq	%rax, 2680(%rdx)
	movq	1152(%rbx), %rax
	movq	%rax, 2688(%rdx)
	movq	1160(%rbx), %rax
	movq	%rax, 2696(%rdx)
	movq	1168(%rbx), %rax
	movq	%rax, 2704(%rdx)
	movq	1176(%rbx), %rax
	movq	%rax, 2712(%rdx)
	movq	1184(%rbx), %rax
	movq	%rax, 2720(%rdx)
	movq	1192(%rbx), %rax
	movq	%rax, 2728(%rdx)
	movq	1200(%rbx), %rax
	movq	%rax, 2736(%rdx)
	movq	1208(%rbx), %rax
	movq	%rax, 2744(%rdx)
	movq	1216(%rbx), %rax
	movq	%rax, 2752(%rdx)
	movq	1224(%rbx), %rax
	movq	%rax, 2760(%rdx)
	movq	1232(%rbx), %rax
	movq	%rax, 2768(%rdx)
	movq	1240(%rbx), %rax
	movq	%rax, 2776(%rdx)
	movq	1248(%rbx), %rax
	movq	%rax, 2784(%rdx)
	movq	1256(%rbx), %rax
	movq	%rax, 2792(%rdx)
	movq	1264(%rbx), %rax
	movq	%rax, 2800(%rdx)
	movq	1272(%rbx), %rax
	movq	%rax, 2808(%rdx)
	movq	1280(%rbx), %rax
	movq	%rax, 2816(%rdx)
	movq	1288(%rbx), %rax
	movq	%rax, 2824(%rdx)
	movq	1296(%rbx), %rax
	movq	%rax, 2832(%rdx)
	movq	1304(%rbx), %rax
	movq	%rax, 2840(%rdx)
	movq	1312(%rbx), %rax
	movq	%rax, 2848(%rdx)
	movq	1320(%rbx), %rax
	movq	%rax, 2856(%rdx)
	movq	1328(%rbx), %rax
	movq	%rax, 2864(%rdx)
	movq	1336(%rbx), %rax
	movq	%rax, 2872(%rdx)
	movq	1344(%rbx), %rax
	movq	%rax, 2880(%rdx)
	movq	1352(%rbx), %rax
	movq	%rax, 2888(%rdx)
	movq	1360(%rbx), %rax
	movq	%rax, 2896(%rdx)
	movq	1368(%rbx), %rax
	movq	%rax, 2904(%rdx)
	movq	1376(%rbx), %rax
	movq	%rax, 2912(%rdx)
	movq	1384(%rbx), %rax
	movq	%rax, 2920(%rdx)
	movq	1392(%rbx), %rax
	movq	%rax, 2928(%rdx)
	movq	1400(%rbx), %rax
	movq	%rax, 2936(%rdx)
	movq	1408(%rbx), %rax
	movq	%rax, 2944(%rdx)
	movq	1416(%rbx), %rax
	movq	%rax, 2952(%rdx)
	movq	1424(%rbx), %rax
	movq	%rax, 2960(%rdx)
	movq	1432(%rbx), %rax
	movq	%rax, 2968(%rdx)
	movq	1440(%rbx), %rax
	movq	%rax, 2976(%rdx)
	movq	1448(%rbx), %rax
	movq	%rax, 2984(%rdx)
	movq	1456(%rbx), %rax
	movq	%rax, 2992(%rdx)
	movq	1464(%rbx), %rax
	movq	%rax, 3000(%rdx)
	movq	1472(%rbx), %rax
	movq	%rax, 3008(%rdx)
	movq	1480(%rbx), %rax
	movq	%rax, 3016(%rdx)
	movq	1488(%rbx), %rax
	movq	%rax, 3024(%rdx)
	movq	1496(%rbx), %rax
	movq	%rax, 3032(%rdx)
	movq	1504(%rbx), %rax
	movq	%rax, 3040(%rdx)
	movq	1512(%rbx), %rax
	movq	%rax, 3048(%rdx)
	movq	1520(%rbx), %rax
	movq	%rax, 3056(%rdx)
	movq	1528(%rbx), %rax
	movq	%rax, 3064(%rdx)
	movq	1536(%rbx), %rax
	movq	%rax, 3072(%rdx)
	movq	1544(%rbx), %rax
	movq	%rax, 3080(%rdx)
	movq	1552(%rbx), %rax
	movq	%rax, 3088(%rdx)
	movq	1560(%rbx), %rax
	movq	%rax, 3096(%rdx)
	movq	%rdx, 14976(%rsp)
	leaq	3104(%rdx), %rdi
	leaq	-248(%rsp), %rsp
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair$1:
	leaq	248(%rsp), %rsp
	movq	14976(%rsp), %rdx
	movq	%mm1, %rax
	movq	32(%rax), %rcx
	movq	%rcx, 3136(%rdx)
	movq	40(%rax), %rcx
	movq	%rcx, 3144(%rdx)
	movq	48(%rax), %rcx
	movq	%rcx, 3152(%rdx)
	movq	56(%rax), %rax
	movq	%rax, 3160(%rdx)
	xorl	%eax, %eax
	movq	15112(%rsp), %rbx
	movq	15120(%rsp), %rbp
	movq	15128(%rsp), %r12
	movq	15136(%rsp), %r13
	movq	15144(%rsp), %r14
	movq	15152(%rsp), %r15
	movq	15160(%rsp), %rsp
	ret
	.type	jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand, %function
jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand:
	movq	%rsp, %rax
	leaq	-18656(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 18600(%rsp)
	movq	%rbp, 18608(%rsp)
	movq	%r12, 18616(%rsp)
	movq	%r13, 18624(%rsp)
	movq	%r14, 18632(%rsp)
	movq	%r15, 18640(%rsp)
	movq	%rax, 18648(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdx, %rbx
	movq	%rdi, 18560(%rsp)
	movq	%rbx, %mm0
	movq	%rsi, %mm1
	vmovdqu	(%rcx), %ymm1
	vmovdqu	%ymm1, (%rsp)
	leaq	32(%rsp), %rdi
	leaq	-248(%rsp), %rsp
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$66:
	leaq	248(%rsp), %rsp
	leaq	64(%rsp), %rdi
	movq	%rsp, %rbx
	leaq	-248(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$65:
	leaq	248(%rsp), %rsp
	movq	18560(%rsp), %rdi
	movq	%mm0, %rbx
	movq	%rsp, %rcx
	leaq	96(%rsp), %r8
	movq	%rdi, %mm2
	movq	%r8, 18560(%rsp)
	movq	%rbx, %rax
	leaq	2176(%rsp), %rsi
	movq	%rax, %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$64:
	leaq	2688(%rsp), %rsi
	leaq	384(%rax), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$63:
	leaq	3200(%rsp), %rsi
	leaq	768(%rax), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$62:
	leaq	3712(%rsp), %rsi
	leaq	1152(%rax), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$61:
	movq	1536(%rbx), %rax
// declassify_val u64 %rax
	movq	%rax, 18568(%rsp)
	movq	1544(%rbx), %rax
// declassify_val u64 %rax
	movq	%rax, 18576(%rsp)
	movq	1552(%rbx), %rax
// declassify_val u64 %rax
	movq	%rax, 18584(%rsp)
	movq	1560(%rbx), %rax
// declassify_val u64 %rax
	movq	%rax, 18592(%rsp)
	leaq	128(%rsp), %rax
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$60:
	movq	$1, %rax
	leaq	10368(%rsp), %rcx
	leaq	18568(%rsp), %r8
	leaq	-2200(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$59:
	leaq	2200(%rsp), %rsp
	movq	18560(%rsp), %r8
	movb	$0, %bl
	leaq	4224(%rsp), %rcx
	leaq	4736(%rsp), %r9
	leaq	5248(%rsp), %r10
	leaq	5760(%rsp), %r11
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$58:
	leaq	600(%rsp), %rsp
	movb	$4, %bl
	leaq	6272(%rsp), %rcx
	leaq	6784(%rsp), %r9
	leaq	7296(%rsp), %r10
	leaq	7808(%rsp), %r11
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$57:
	leaq	600(%rsp), %rsp
	movb	$8, %al
	leaq	640(%rsp), %rcx
	leaq	-184(%rsp), %rsp
	call	L_poly_getnoise_eta2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$56:
	leaq	184(%rsp), %rsp
	leaq	4224(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$55:
	leaq	4736(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$54:
	leaq	5248(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$53:
	leaq	5760(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$52:
	leaq	8320(%rsp), %rax
	leaq	10368(%rsp), %rsi
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$51:
	leaq	1152(%rsp), %rax
	leaq	10880(%rsp), %rsi
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$50:
	leaq	8320(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$49:
	leaq	1152(%rsp), %rax
	leaq	11392(%rsp), %rsi
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$48:
	leaq	8320(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$47:
	leaq	1152(%rsp), %rax
	leaq	11904(%rsp), %rsi
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$46:
	leaq	8320(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$45:
	leaq	8832(%rsp), %rax
	leaq	12416(%rsp), %rsi
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$44:
	leaq	1152(%rsp), %rax
	leaq	12928(%rsp), %rsi
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$43:
	leaq	8832(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$42:
	leaq	1152(%rsp), %rax
	leaq	13440(%rsp), %rsi
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$41:
	leaq	8832(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$40:
	leaq	1152(%rsp), %rax
	leaq	13952(%rsp), %rsi
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$39:
	leaq	8832(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$38:
	leaq	9344(%rsp), %rax
	leaq	14464(%rsp), %rsi
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$37:
	leaq	1152(%rsp), %rax
	leaq	14976(%rsp), %rsi
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$36:
	leaq	9344(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$35:
	leaq	1152(%rsp), %rax
	leaq	15488(%rsp), %rsi
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$34:
	leaq	9344(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$33:
	leaq	1152(%rsp), %rax
	leaq	16000(%rsp), %rsi
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$32:
	leaq	9344(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$31:
	leaq	9856(%rsp), %rax
	leaq	16512(%rsp), %rsi
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$30:
	leaq	1152(%rsp), %rax
	leaq	17024(%rsp), %rsi
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$29:
	leaq	9856(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$28:
	leaq	1152(%rsp), %rax
	leaq	17536(%rsp), %rsi
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$27:
	leaq	9856(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$26:
	leaq	1152(%rsp), %rax
	leaq	18048(%rsp), %rsi
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$25:
	leaq	9856(%rsp), %rax
	leaq	1152(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$24:
	leaq	1152(%rsp), %rax
	leaq	2176(%rsp), %rsi
	leaq	4224(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$23:
	leaq	1664(%rsp), %rax
	leaq	2688(%rsp), %rsi
	leaq	4736(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$22:
	leaq	1152(%rsp), %rax
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$21:
	leaq	1664(%rsp), %rax
	leaq	3200(%rsp), %rsi
	leaq	5248(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$20:
	leaq	1152(%rsp), %rax
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$19:
	leaq	1664(%rsp), %rax
	leaq	3712(%rsp), %rsi
	leaq	5760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$18:
	leaq	1152(%rsp), %rax
	leaq	1664(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$17:
	leaq	8320(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$16:
	leaq	8832(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$15:
	leaq	9344(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$14:
	leaq	9856(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$13:
	leaq	1152(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$12:
	leaq	8320(%rsp), %rax
	leaq	6272(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$11:
	leaq	8832(%rsp), %rax
	leaq	6784(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$10:
	leaq	9344(%rsp), %rax
	leaq	7296(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$9:
	leaq	9856(%rsp), %rax
	leaq	7808(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$8:
	leaq	1152(%rsp), %rax
	leaq	640(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$7:
	leaq	1152(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$6:
	leaq	8320(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	movq	%rdi, %rcx
	leaq	8320(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$5:
	leaq	8832(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$4:
	leaq	9344(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$3:
	leaq	9856(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$2:
	vmovdqu	glob_data + 736(%rip), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 4800(%rip), %ymm2
	vpbroadcastw	glob_data + 4798(%rip), %ymm3
	vpbroadcastw	glob_data + 4796(%rip), %ymm5
	vpbroadcastq	glob_data + 4584(%rip), %ymm4
	vpbroadcastq	glob_data + 4576(%rip), %ymm6
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
	vmovdqu	%xmm11, (%rcx)
	movq	%xmm9, 16(%rcx)
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
	vmovdqu	%xmm11, 22(%rcx)
	movq	%xmm9, 38(%rcx)
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
	vmovdqu	%xmm11, 44(%rcx)
	movq	%xmm9, 60(%rcx)
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
	vmovdqu	%xmm11, 66(%rcx)
	movq	%xmm9, 82(%rcx)
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
	vmovdqu	%xmm11, 88(%rcx)
	movq	%xmm9, 104(%rcx)
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
	vmovdqu	%xmm11, 110(%rcx)
	movq	%xmm9, 126(%rcx)
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
	vmovdqu	%xmm11, 132(%rcx)
	movq	%xmm9, 148(%rcx)
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
	vmovdqu	%xmm11, 154(%rcx)
	movq	%xmm9, 170(%rcx)
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
	vmovdqu	%xmm11, 176(%rcx)
	movq	%xmm9, 192(%rcx)
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
	vmovdqu	%xmm11, 198(%rcx)
	movq	%xmm9, 214(%rcx)
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
	vmovdqu	%xmm11, 220(%rcx)
	movq	%xmm9, 236(%rcx)
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
	vmovdqu	%xmm11, 242(%rcx)
	movq	%xmm9, 258(%rcx)
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
	vmovdqu	%xmm11, 264(%rcx)
	movq	%xmm9, 280(%rcx)
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
	vmovdqu	%xmm11, 286(%rcx)
	movq	%xmm9, 302(%rcx)
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
	vmovdqu	%xmm11, 308(%rcx)
	movq	%xmm9, 324(%rcx)
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
	vmovdqu	%xmm11, 330(%rcx)
	movq	%xmm9, 346(%rcx)
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
	vmovdqu	%xmm11, 352(%rcx)
	movq	%xmm9, 368(%rcx)
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
	vmovdqu	%xmm11, 374(%rcx)
	movq	%xmm9, 390(%rcx)
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
	vmovdqu	%xmm11, 396(%rcx)
	movq	%xmm9, 412(%rcx)
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
	vmovdqu	%xmm11, 418(%rcx)
	movq	%xmm9, 434(%rcx)
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
	vmovdqu	%xmm11, 440(%rcx)
	movq	%xmm9, 456(%rcx)
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
	vmovdqu	%xmm11, 462(%rcx)
	movq	%xmm9, 478(%rcx)
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
	vmovdqu	%xmm11, 484(%rcx)
	movq	%xmm9, 500(%rcx)
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
	vmovdqu	%xmm11, 506(%rcx)
	movq	%xmm9, 522(%rcx)
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
	vmovdqu	%xmm11, 528(%rcx)
	movq	%xmm9, 544(%rcx)
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
	vmovdqu	%xmm11, 550(%rcx)
	movq	%xmm9, 566(%rcx)
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
	vmovdqu	%xmm11, 572(%rcx)
	movq	%xmm9, 588(%rcx)
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
	vmovdqu	%xmm11, 594(%rcx)
	movq	%xmm9, 610(%rcx)
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
	vmovdqu	%xmm11, 616(%rcx)
	movq	%xmm9, 632(%rcx)
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
	vmovdqu	%xmm11, 638(%rcx)
	movq	%xmm9, 654(%rcx)
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
	vmovdqu	%xmm11, 660(%rcx)
	movq	%xmm9, 676(%rcx)
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
	vmovdqu	%xmm11, 682(%rcx)
	movq	%xmm9, 698(%rcx)
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
	vmovdqu	%xmm11, 704(%rcx)
	movq	%xmm9, 720(%rcx)
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
	vmovdqu	%xmm11, 726(%rcx)
	movq	%xmm9, 742(%rcx)
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
	vmovdqu	%xmm11, 748(%rcx)
	movq	%xmm9, 764(%rcx)
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
	vmovdqu	%xmm11, 770(%rcx)
	movq	%xmm9, 786(%rcx)
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
	vmovdqu	%xmm11, 792(%rcx)
	movq	%xmm9, 808(%rcx)
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
	vmovdqu	%xmm11, 814(%rcx)
	movq	%xmm9, 830(%rcx)
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
	vmovdqu	%xmm11, 836(%rcx)
	movq	%xmm9, 852(%rcx)
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
	vmovdqu	%xmm11, 858(%rcx)
	movq	%xmm9, 874(%rcx)
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
	vmovdqu	%xmm11, 880(%rcx)
	movq	%xmm9, 896(%rcx)
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
	vmovdqu	%xmm11, 902(%rcx)
	movq	%xmm9, 918(%rcx)
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
	vmovdqu	%xmm11, 924(%rcx)
	movq	%xmm9, 940(%rcx)
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
	vmovdqu	%xmm11, 946(%rcx)
	movq	%xmm9, 962(%rcx)
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
	vmovdqu	%xmm11, 968(%rcx)
	movq	%xmm9, 984(%rcx)
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
	vmovdqu	%xmm11, 990(%rcx)
	movq	%xmm9, 1006(%rcx)
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
	vmovdqu	%xmm11, 1012(%rcx)
	movq	%xmm9, 1028(%rcx)
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
	vmovdqu	%xmm11, 1034(%rcx)
	movq	%xmm9, 1050(%rcx)
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
	vmovdqu	%xmm11, 1056(%rcx)
	movq	%xmm9, 1072(%rcx)
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
	vmovdqu	%xmm11, 1078(%rcx)
	movq	%xmm9, 1094(%rcx)
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
	vmovdqu	%xmm11, 1100(%rcx)
	movq	%xmm9, 1116(%rcx)
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
	vmovdqu	%xmm11, 1122(%rcx)
	movq	%xmm9, 1138(%rcx)
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
	vmovdqu	%xmm11, 1144(%rcx)
	movq	%xmm9, 1160(%rcx)
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
	vmovdqu	%xmm11, 1166(%rcx)
	movq	%xmm9, 1182(%rcx)
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
	vmovdqu	%xmm11, 1188(%rcx)
	movq	%xmm9, 1204(%rcx)
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
	vmovdqu	%xmm11, 1210(%rcx)
	movq	%xmm9, 1226(%rcx)
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
	vmovdqu	%xmm11, 1232(%rcx)
	movq	%xmm9, 1248(%rcx)
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
	vmovdqu	%xmm11, 1254(%rcx)
	movq	%xmm9, 1270(%rcx)
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
	vmovdqu	%xmm11, 1276(%rcx)
	movq	%xmm9, 1292(%rcx)
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
	vmovdqu	%xmm11, 1298(%rcx)
	movq	%xmm9, 1314(%rcx)
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
	vmovdqu	%xmm11, 1320(%rcx)
	movq	%xmm9, 1336(%rcx)
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
	vmovdqu	%xmm11, 1342(%rcx)
	movq	%xmm9, 1358(%rcx)
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
	vmovdqu	%xmm11, 1364(%rcx)
	movq	%xmm9, 1380(%rcx)
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
	vmovdqu	%xmm2, 1386(%rcx)
	movq	%xmm3, 1402(%rcx)
	leaq	1408(%rdi), %rcx
	leaq	1152(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$1:
	vmovdqu	glob_data + 736(%rip), %ymm0
	vpbroadcastw	glob_data + 4806(%rip), %ymm3
	vpbroadcastw	glob_data + 4808(%rip), %ymm5
	vpbroadcastw	glob_data + 4804(%rip), %ymm4
	vpbroadcastd	glob_data + 4792(%rip), %ymm1
	vpbroadcastq	glob_data + 4592(%rip), %ymm6
	vmovdqu	glob_data + 416(%rip), %ymm8
	vmovdqu	(%rax), %ymm9
	vmovdqu	32(%rax), %ymm10
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
	vmovdqu	%xmm2, (%rcx)
	movd	%xmm7, 16(%rcx)
	vmovdqu	64(%rax), %ymm9
	vmovdqu	96(%rax), %ymm10
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
	vmovdqu	%xmm2, 20(%rcx)
	movd	%xmm7, 36(%rcx)
	vmovdqu	128(%rax), %ymm9
	vmovdqu	160(%rax), %ymm10
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
	vmovdqu	%xmm2, 40(%rcx)
	movd	%xmm7, 56(%rcx)
	vmovdqu	192(%rax), %ymm9
	vmovdqu	224(%rax), %ymm10
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
	vmovdqu	%xmm2, 60(%rcx)
	movd	%xmm7, 76(%rcx)
	vmovdqu	256(%rax), %ymm9
	vmovdqu	288(%rax), %ymm10
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
	vmovdqu	%xmm2, 80(%rcx)
	movd	%xmm7, 96(%rcx)
	vmovdqu	320(%rax), %ymm9
	vmovdqu	352(%rax), %ymm10
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
	vmovdqu	%xmm2, 100(%rcx)
	movd	%xmm7, 116(%rcx)
	vmovdqu	384(%rax), %ymm9
	vmovdqu	416(%rax), %ymm10
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
	vmovdqu	%xmm2, 120(%rcx)
	movd	%xmm7, 136(%rcx)
	vmovdqu	448(%rax), %ymm9
	vmovdqu	480(%rax), %ymm10
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
	vmovdqu	%xmm2, 140(%rcx)
	movd	%xmm3, 156(%rcx)
	movq	%mm1, %rsi
	vmovdqu	64(%rsp), %ymm0
	vmovdqu	%ymm0, (%rsi)
	xorl	%eax, %eax
	movq	18600(%rsp), %rbx
	movq	18608(%rsp), %rbp
	movq	18616(%rsp), %r12
	movq	18624(%rsp), %r13
	movq	18632(%rsp), %r14
	movq	18640(%rsp), %r15
	movq	18648(%rsp), %rsp
	ret
	.type	jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand, %function
jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand:
	movq	%rsp, %rax
	leaq	-15104(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 15048(%rsp)
	movq	%rbp, 15056(%rsp)
	movq	%r12, 15064(%rsp)
	movq	%r13, 15072(%rsp)
	movq	%r14, 15080(%rsp)
	movq	%r15, 15088(%rsp)
	movq	%rax, 15096(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdx, %mm1
	movq	%rsi, %rbp
	movq	%rsi, %mm2
	movq	%rdi, %mm3
	movq	%rbp, %mm4
	movq	(%rdx), %rax
	movq	%rax, (%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 8(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 16(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 24(%rsp)
	movb	$4, 32(%rsp)
	leaq	64(%rsp), %rdi
	movq	%rsp, %rbx
	leaq	-248(%rsp), %rsp
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$57:
	leaq	248(%rsp), %rsp
	movq	64(%rsp), %rax
// declassify_val u64 %rax
	movq	%rax, 15016(%rsp)
	movq	96(%rsp), %rax
	movq	%rax, 14984(%rsp)
	movq	72(%rsp), %rax
// declassify_val u64 %rax
	movq	%rax, 15024(%rsp)
	movq	104(%rsp), %rax
	movq	%rax, 14992(%rsp)
	movq	80(%rsp), %rax
// declassify_val u64 %rax
	movq	%rax, 15032(%rsp)
	movq	112(%rsp), %rax
	movq	%rax, 15000(%rsp)
	movq	88(%rsp), %rax
// declassify_val u64 %rax
	movq	%rax, 15040(%rsp)
	movq	120(%rsp), %rax
	movq	%rax, 15008(%rsp)
	movq	$0, %rax
	leaq	6784(%rsp), %rcx
	leaq	15016(%rsp), %r8
	leaq	-2200(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$56:
	leaq	2200(%rsp), %rsp
	movb	$0, %bl
	leaq	640(%rsp), %rcx
	leaq	1152(%rsp), %r9
	leaq	1664(%rsp), %r10
	leaq	2176(%rsp), %r11
	leaq	14984(%rsp), %r8
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$55:
	leaq	600(%rsp), %rsp
	movb	$4, %bl
	leaq	2688(%rsp), %rcx
	leaq	3200(%rsp), %r9
	leaq	3712(%rsp), %r10
	leaq	4224(%rsp), %r11
	leaq	14984(%rsp), %r8
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$54:
	leaq	600(%rsp), %rsp
	leaq	640(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$53:
	leaq	1152(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$52:
	leaq	1664(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$51:
	leaq	2176(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$50:
	leaq	2688(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$49:
	leaq	3200(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$48:
	leaq	3712(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$47:
	leaq	4224(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$46:
	leaq	4736(%rsp), %rax
	leaq	6784(%rsp), %rsi
	leaq	640(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$45:
	leaq	128(%rsp), %rax
	leaq	7296(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$44:
	leaq	4736(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$43:
	leaq	128(%rsp), %rax
	leaq	7808(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$42:
	leaq	4736(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$41:
	leaq	128(%rsp), %rax
	leaq	8320(%rsp), %rsi
	leaq	2176(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$40:
	leaq	4736(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$39:
	leaq	4736(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$38:
	leaq	5248(%rsp), %rax
	leaq	8832(%rsp), %rsi
	leaq	640(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$37:
	leaq	128(%rsp), %rax
	leaq	9344(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$36:
	leaq	5248(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$35:
	leaq	128(%rsp), %rax
	leaq	9856(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$34:
	leaq	5248(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$33:
	leaq	128(%rsp), %rax
	leaq	10368(%rsp), %rsi
	leaq	2176(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$32:
	leaq	5248(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$31:
	leaq	5248(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$30:
	leaq	5760(%rsp), %rax
	leaq	10880(%rsp), %rsi
	leaq	640(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$29:
	leaq	128(%rsp), %rax
	leaq	11392(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$28:
	leaq	5760(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$27:
	leaq	128(%rsp), %rax
	leaq	11904(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$26:
	leaq	5760(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$25:
	leaq	128(%rsp), %rax
	leaq	12416(%rsp), %rsi
	leaq	2176(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$24:
	leaq	5760(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$23:
	leaq	5760(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$22:
	leaq	6272(%rsp), %rax
	leaq	12928(%rsp), %rsi
	leaq	640(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$21:
	leaq	128(%rsp), %rax
	leaq	13440(%rsp), %rsi
	leaq	1152(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$20:
	leaq	6272(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$19:
	leaq	128(%rsp), %rax
	leaq	13952(%rsp), %rsi
	leaq	1664(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$18:
	leaq	6272(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$17:
	leaq	128(%rsp), %rax
	leaq	14464(%rsp), %rsi
	leaq	2176(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$16:
	leaq	6272(%rsp), %rax
	leaq	128(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$15:
	leaq	6272(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$14:
	leaq	4736(%rsp), %rax
	leaq	2688(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$13:
	leaq	5248(%rsp), %rax
	leaq	3200(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$12:
	leaq	5760(%rsp), %rax
	leaq	3712(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$11:
	leaq	6272(%rsp), %rax
	leaq	4224(%rsp), %rdi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$10:
	leaq	4736(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	leaq	5248(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	leaq	5760(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	leaq	6272(%rsp), %rax
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 736(%rip), %ymm1
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
	movq	%mm4, %rcx
	movq	%rcx, %r8
	leaq	640(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$9:
	leaq	384(%rcx), %r8
	leaq	1152(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$8:
	leaq	768(%rcx), %r8
	leaq	1664(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$7:
	leaq	1152(%rcx), %r8
	leaq	2176(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$6:
	movq	%rbx, %rsi
	movq	%rsi, %r8
	leaq	4736(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$5:
	leaq	384(%rsi), %r8
	leaq	5248(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$4:
	leaq	768(%rsi), %r8
	leaq	5760(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$3:
	leaq	1152(%rsi), %r8
	leaq	6272(%rsp), %rax
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$2:
	movq	15016(%rsp), %rax
	movq	%rax, 1536(%rbx)
	movq	15024(%rsp), %rax
	movq	%rax, 1544(%rbx)
	movq	15032(%rsp), %rax
	movq	%rax, 1552(%rbx)
	movq	15040(%rsp), %rax
	movq	%rax, 1560(%rbx)
	movq	%mm2, %rdx
	movq	(%rbx), %rax
	movq	%rax, 1536(%rdx)
	movq	8(%rbx), %rax
	movq	%rax, 1544(%rdx)
	movq	16(%rbx), %rax
	movq	%rax, 1552(%rdx)
	movq	24(%rbx), %rax
	movq	%rax, 1560(%rdx)
	movq	32(%rbx), %rax
	movq	%rax, 1568(%rdx)
	movq	40(%rbx), %rax
	movq	%rax, 1576(%rdx)
	movq	48(%rbx), %rax
	movq	%rax, 1584(%rdx)
	movq	56(%rbx), %rax
	movq	%rax, 1592(%rdx)
	movq	64(%rbx), %rax
	movq	%rax, 1600(%rdx)
	movq	72(%rbx), %rax
	movq	%rax, 1608(%rdx)
	movq	80(%rbx), %rax
	movq	%rax, 1616(%rdx)
	movq	88(%rbx), %rax
	movq	%rax, 1624(%rdx)
	movq	96(%rbx), %rax
	movq	%rax, 1632(%rdx)
	movq	104(%rbx), %rax
	movq	%rax, 1640(%rdx)
	movq	112(%rbx), %rax
	movq	%rax, 1648(%rdx)
	movq	120(%rbx), %rax
	movq	%rax, 1656(%rdx)
	movq	128(%rbx), %rax
	movq	%rax, 1664(%rdx)
	movq	136(%rbx), %rax
	movq	%rax, 1672(%rdx)
	movq	144(%rbx), %rax
	movq	%rax, 1680(%rdx)
	movq	152(%rbx), %rax
	movq	%rax, 1688(%rdx)
	movq	160(%rbx), %rax
	movq	%rax, 1696(%rdx)
	movq	168(%rbx), %rax
	movq	%rax, 1704(%rdx)
	movq	176(%rbx), %rax
	movq	%rax, 1712(%rdx)
	movq	184(%rbx), %rax
	movq	%rax, 1720(%rdx)
	movq	192(%rbx), %rax
	movq	%rax, 1728(%rdx)
	movq	200(%rbx), %rax
	movq	%rax, 1736(%rdx)
	movq	208(%rbx), %rax
	movq	%rax, 1744(%rdx)
	movq	216(%rbx), %rax
	movq	%rax, 1752(%rdx)
	movq	224(%rbx), %rax
	movq	%rax, 1760(%rdx)
	movq	232(%rbx), %rax
	movq	%rax, 1768(%rdx)
	movq	240(%rbx), %rax
	movq	%rax, 1776(%rdx)
	movq	248(%rbx), %rax
	movq	%rax, 1784(%rdx)
	movq	256(%rbx), %rax
	movq	%rax, 1792(%rdx)
	movq	264(%rbx), %rax
	movq	%rax, 1800(%rdx)
	movq	272(%rbx), %rax
	movq	%rax, 1808(%rdx)
	movq	280(%rbx), %rax
	movq	%rax, 1816(%rdx)
	movq	288(%rbx), %rax
	movq	%rax, 1824(%rdx)
	movq	296(%rbx), %rax
	movq	%rax, 1832(%rdx)
	movq	304(%rbx), %rax
	movq	%rax, 1840(%rdx)
	movq	312(%rbx), %rax
	movq	%rax, 1848(%rdx)
	movq	320(%rbx), %rax
	movq	%rax, 1856(%rdx)
	movq	328(%rbx), %rax
	movq	%rax, 1864(%rdx)
	movq	336(%rbx), %rax
	movq	%rax, 1872(%rdx)
	movq	344(%rbx), %rax
	movq	%rax, 1880(%rdx)
	movq	352(%rbx), %rax
	movq	%rax, 1888(%rdx)
	movq	360(%rbx), %rax
	movq	%rax, 1896(%rdx)
	movq	368(%rbx), %rax
	movq	%rax, 1904(%rdx)
	movq	376(%rbx), %rax
	movq	%rax, 1912(%rdx)
	movq	384(%rbx), %rax
	movq	%rax, 1920(%rdx)
	movq	392(%rbx), %rax
	movq	%rax, 1928(%rdx)
	movq	400(%rbx), %rax
	movq	%rax, 1936(%rdx)
	movq	408(%rbx), %rax
	movq	%rax, 1944(%rdx)
	movq	416(%rbx), %rax
	movq	%rax, 1952(%rdx)
	movq	424(%rbx), %rax
	movq	%rax, 1960(%rdx)
	movq	432(%rbx), %rax
	movq	%rax, 1968(%rdx)
	movq	440(%rbx), %rax
	movq	%rax, 1976(%rdx)
	movq	448(%rbx), %rax
	movq	%rax, 1984(%rdx)
	movq	456(%rbx), %rax
	movq	%rax, 1992(%rdx)
	movq	464(%rbx), %rax
	movq	%rax, 2000(%rdx)
	movq	472(%rbx), %rax
	movq	%rax, 2008(%rdx)
	movq	480(%rbx), %rax
	movq	%rax, 2016(%rdx)
	movq	488(%rbx), %rax
	movq	%rax, 2024(%rdx)
	movq	496(%rbx), %rax
	movq	%rax, 2032(%rdx)
	movq	504(%rbx), %rax
	movq	%rax, 2040(%rdx)
	movq	512(%rbx), %rax
	movq	%rax, 2048(%rdx)
	movq	520(%rbx), %rax
	movq	%rax, 2056(%rdx)
	movq	528(%rbx), %rax
	movq	%rax, 2064(%rdx)
	movq	536(%rbx), %rax
	movq	%rax, 2072(%rdx)
	movq	544(%rbx), %rax
	movq	%rax, 2080(%rdx)
	movq	552(%rbx), %rax
	movq	%rax, 2088(%rdx)
	movq	560(%rbx), %rax
	movq	%rax, 2096(%rdx)
	movq	568(%rbx), %rax
	movq	%rax, 2104(%rdx)
	movq	576(%rbx), %rax
	movq	%rax, 2112(%rdx)
	movq	584(%rbx), %rax
	movq	%rax, 2120(%rdx)
	movq	592(%rbx), %rax
	movq	%rax, 2128(%rdx)
	movq	600(%rbx), %rax
	movq	%rax, 2136(%rdx)
	movq	608(%rbx), %rax
	movq	%rax, 2144(%rdx)
	movq	616(%rbx), %rax
	movq	%rax, 2152(%rdx)
	movq	624(%rbx), %rax
	movq	%rax, 2160(%rdx)
	movq	632(%rbx), %rax
	movq	%rax, 2168(%rdx)
	movq	640(%rbx), %rax
	movq	%rax, 2176(%rdx)
	movq	648(%rbx), %rax
	movq	%rax, 2184(%rdx)
	movq	656(%rbx), %rax
	movq	%rax, 2192(%rdx)
	movq	664(%rbx), %rax
	movq	%rax, 2200(%rdx)
	movq	672(%rbx), %rax
	movq	%rax, 2208(%rdx)
	movq	680(%rbx), %rax
	movq	%rax, 2216(%rdx)
	movq	688(%rbx), %rax
	movq	%rax, 2224(%rdx)
	movq	696(%rbx), %rax
	movq	%rax, 2232(%rdx)
	movq	704(%rbx), %rax
	movq	%rax, 2240(%rdx)
	movq	712(%rbx), %rax
	movq	%rax, 2248(%rdx)
	movq	720(%rbx), %rax
	movq	%rax, 2256(%rdx)
	movq	728(%rbx), %rax
	movq	%rax, 2264(%rdx)
	movq	736(%rbx), %rax
	movq	%rax, 2272(%rdx)
	movq	744(%rbx), %rax
	movq	%rax, 2280(%rdx)
	movq	752(%rbx), %rax
	movq	%rax, 2288(%rdx)
	movq	760(%rbx), %rax
	movq	%rax, 2296(%rdx)
	movq	768(%rbx), %rax
	movq	%rax, 2304(%rdx)
	movq	776(%rbx), %rax
	movq	%rax, 2312(%rdx)
	movq	784(%rbx), %rax
	movq	%rax, 2320(%rdx)
	movq	792(%rbx), %rax
	movq	%rax, 2328(%rdx)
	movq	800(%rbx), %rax
	movq	%rax, 2336(%rdx)
	movq	808(%rbx), %rax
	movq	%rax, 2344(%rdx)
	movq	816(%rbx), %rax
	movq	%rax, 2352(%rdx)
	movq	824(%rbx), %rax
	movq	%rax, 2360(%rdx)
	movq	832(%rbx), %rax
	movq	%rax, 2368(%rdx)
	movq	840(%rbx), %rax
	movq	%rax, 2376(%rdx)
	movq	848(%rbx), %rax
	movq	%rax, 2384(%rdx)
	movq	856(%rbx), %rax
	movq	%rax, 2392(%rdx)
	movq	864(%rbx), %rax
	movq	%rax, 2400(%rdx)
	movq	872(%rbx), %rax
	movq	%rax, 2408(%rdx)
	movq	880(%rbx), %rax
	movq	%rax, 2416(%rdx)
	movq	888(%rbx), %rax
	movq	%rax, 2424(%rdx)
	movq	896(%rbx), %rax
	movq	%rax, 2432(%rdx)
	movq	904(%rbx), %rax
	movq	%rax, 2440(%rdx)
	movq	912(%rbx), %rax
	movq	%rax, 2448(%rdx)
	movq	920(%rbx), %rax
	movq	%rax, 2456(%rdx)
	movq	928(%rbx), %rax
	movq	%rax, 2464(%rdx)
	movq	936(%rbx), %rax
	movq	%rax, 2472(%rdx)
	movq	944(%rbx), %rax
	movq	%rax, 2480(%rdx)
	movq	952(%rbx), %rax
	movq	%rax, 2488(%rdx)
	movq	960(%rbx), %rax
	movq	%rax, 2496(%rdx)
	movq	968(%rbx), %rax
	movq	%rax, 2504(%rdx)
	movq	976(%rbx), %rax
	movq	%rax, 2512(%rdx)
	movq	984(%rbx), %rax
	movq	%rax, 2520(%rdx)
	movq	992(%rbx), %rax
	movq	%rax, 2528(%rdx)
	movq	1000(%rbx), %rax
	movq	%rax, 2536(%rdx)
	movq	1008(%rbx), %rax
	movq	%rax, 2544(%rdx)
	movq	1016(%rbx), %rax
	movq	%rax, 2552(%rdx)
	movq	1024(%rbx), %rax
	movq	%rax, 2560(%rdx)
	movq	1032(%rbx), %rax
	movq	%rax, 2568(%rdx)
	movq	1040(%rbx), %rax
	movq	%rax, 2576(%rdx)
	movq	1048(%rbx), %rax
	movq	%rax, 2584(%rdx)
	movq	1056(%rbx), %rax
	movq	%rax, 2592(%rdx)
	movq	1064(%rbx), %rax
	movq	%rax, 2600(%rdx)
	movq	1072(%rbx), %rax
	movq	%rax, 2608(%rdx)
	movq	1080(%rbx), %rax
	movq	%rax, 2616(%rdx)
	movq	1088(%rbx), %rax
	movq	%rax, 2624(%rdx)
	movq	1096(%rbx), %rax
	movq	%rax, 2632(%rdx)
	movq	1104(%rbx), %rax
	movq	%rax, 2640(%rdx)
	movq	1112(%rbx), %rax
	movq	%rax, 2648(%rdx)
	movq	1120(%rbx), %rax
	movq	%rax, 2656(%rdx)
	movq	1128(%rbx), %rax
	movq	%rax, 2664(%rdx)
	movq	1136(%rbx), %rax
	movq	%rax, 2672(%rdx)
	movq	1144(%rbx), %rax
	movq	%rax, 2680(%rdx)
	movq	1152(%rbx), %rax
	movq	%rax, 2688(%rdx)
	movq	1160(%rbx), %rax
	movq	%rax, 2696(%rdx)
	movq	1168(%rbx), %rax
	movq	%rax, 2704(%rdx)
	movq	1176(%rbx), %rax
	movq	%rax, 2712(%rdx)
	movq	1184(%rbx), %rax
	movq	%rax, 2720(%rdx)
	movq	1192(%rbx), %rax
	movq	%rax, 2728(%rdx)
	movq	1200(%rbx), %rax
	movq	%rax, 2736(%rdx)
	movq	1208(%rbx), %rax
	movq	%rax, 2744(%rdx)
	movq	1216(%rbx), %rax
	movq	%rax, 2752(%rdx)
	movq	1224(%rbx), %rax
	movq	%rax, 2760(%rdx)
	movq	1232(%rbx), %rax
	movq	%rax, 2768(%rdx)
	movq	1240(%rbx), %rax
	movq	%rax, 2776(%rdx)
	movq	1248(%rbx), %rax
	movq	%rax, 2784(%rdx)
	movq	1256(%rbx), %rax
	movq	%rax, 2792(%rdx)
	movq	1264(%rbx), %rax
	movq	%rax, 2800(%rdx)
	movq	1272(%rbx), %rax
	movq	%rax, 2808(%rdx)
	movq	1280(%rbx), %rax
	movq	%rax, 2816(%rdx)
	movq	1288(%rbx), %rax
	movq	%rax, 2824(%rdx)
	movq	1296(%rbx), %rax
	movq	%rax, 2832(%rdx)
	movq	1304(%rbx), %rax
	movq	%rax, 2840(%rdx)
	movq	1312(%rbx), %rax
	movq	%rax, 2848(%rdx)
	movq	1320(%rbx), %rax
	movq	%rax, 2856(%rdx)
	movq	1328(%rbx), %rax
	movq	%rax, 2864(%rdx)
	movq	1336(%rbx), %rax
	movq	%rax, 2872(%rdx)
	movq	1344(%rbx), %rax
	movq	%rax, 2880(%rdx)
	movq	1352(%rbx), %rax
	movq	%rax, 2888(%rdx)
	movq	1360(%rbx), %rax
	movq	%rax, 2896(%rdx)
	movq	1368(%rbx), %rax
	movq	%rax, 2904(%rdx)
	movq	1376(%rbx), %rax
	movq	%rax, 2912(%rdx)
	movq	1384(%rbx), %rax
	movq	%rax, 2920(%rdx)
	movq	1392(%rbx), %rax
	movq	%rax, 2928(%rdx)
	movq	1400(%rbx), %rax
	movq	%rax, 2936(%rdx)
	movq	1408(%rbx), %rax
	movq	%rax, 2944(%rdx)
	movq	1416(%rbx), %rax
	movq	%rax, 2952(%rdx)
	movq	1424(%rbx), %rax
	movq	%rax, 2960(%rdx)
	movq	1432(%rbx), %rax
	movq	%rax, 2968(%rdx)
	movq	1440(%rbx), %rax
	movq	%rax, 2976(%rdx)
	movq	1448(%rbx), %rax
	movq	%rax, 2984(%rdx)
	movq	1456(%rbx), %rax
	movq	%rax, 2992(%rdx)
	movq	1464(%rbx), %rax
	movq	%rax, 3000(%rdx)
	movq	1472(%rbx), %rax
	movq	%rax, 3008(%rdx)
	movq	1480(%rbx), %rax
	movq	%rax, 3016(%rdx)
	movq	1488(%rbx), %rax
	movq	%rax, 3024(%rdx)
	movq	1496(%rbx), %rax
	movq	%rax, 3032(%rdx)
	movq	1504(%rbx), %rax
	movq	%rax, 3040(%rdx)
	movq	1512(%rbx), %rax
	movq	%rax, 3048(%rdx)
	movq	1520(%rbx), %rax
	movq	%rax, 3056(%rdx)
	movq	1528(%rbx), %rax
	movq	%rax, 3064(%rdx)
	movq	1536(%rbx), %rax
	movq	%rax, 3072(%rdx)
	movq	1544(%rbx), %rax
	movq	%rax, 3080(%rdx)
	movq	1552(%rbx), %rax
	movq	%rax, 3088(%rdx)
	movq	1560(%rbx), %rax
	movq	%rax, 3096(%rdx)
	movq	%rdx, 14976(%rsp)
	leaq	3104(%rdx), %rdi
	leaq	-248(%rsp), %rsp
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$1:
	leaq	248(%rsp), %rsp
	movq	14976(%rsp), %rdx
	movq	%mm1, %rax
	movq	32(%rax), %rcx
	movq	%rcx, 3136(%rdx)
	movq	40(%rax), %rcx
	movq	%rcx, 3144(%rdx)
	movq	48(%rax), %rcx
	movq	%rcx, 3152(%rdx)
	movq	56(%rax), %rax
	movq	%rax, 3160(%rdx)
	xorl	%eax, %eax
	movq	15048(%rsp), %rbx
	movq	15056(%rsp), %rbp
	movq	15064(%rsp), %r12
	movq	15072(%rsp), %r13
	movq	15080(%rsp), %r14
	movq	15088(%rsp), %r15
	movq	15096(%rsp), %rsp
	ret
L_gen_matrix_avx2$1:
	movq	%rax, %mm0
	leaq	32(%rsp), %rdx
	movq	$0, %rdi
	movq	%rcx, 2176(%rsp)
	movq	%r8, 2184(%rsp)
	movq	%rcx, %rax
	movq	%mm0, %rcx
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$21:
	leaq	856(%rsp), %rsp
	movq	2176(%rsp), %rcx
	movq	2184(%rsp), %r8
	movq	$8, %rdi
	movq	%rcx, 2184(%rsp)
	movq	%r8, 2176(%rsp)
	leaq	2048(%rcx), %rax
	movq	%mm0, %rcx
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$20:
	leaq	856(%rsp), %rsp
	movq	2184(%rsp), %rcx
	movq	2176(%rsp), %r8
	movq	$16, %rdi
	movq	%rcx, 2176(%rsp)
	movq	%r8, 2184(%rsp)
	leaq	4096(%rcx), %rax
	movq	%mm0, %rcx
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$19:
	leaq	856(%rsp), %rsp
	movq	2176(%rsp), %rcx
	movq	2184(%rsp), %r8
	movq	$24, %rdi
	movq	%rcx, 2184(%rsp)
	leaq	6144(%rcx), %rax
	movq	%mm0, %rcx
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$18:
	leaq	856(%rsp), %rsp
	movq	2184(%rsp), %rcx
	movq	%rcx, %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$17:
	leaq	512(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$16:
	leaq	1024(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$15:
	leaq	1536(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$14:
	leaq	2048(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$13:
	leaq	2560(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$12:
	leaq	3072(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$11:
	leaq	3584(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$10:
	leaq	4096(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$9:
	leaq	4608(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$8:
	leaq	5120(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$7:
	leaq	5632(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$6:
	leaq	6144(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$5:
	leaq	6656(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$4:
	leaq	7168(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$3:
	leaq	7680(%rcx), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$2:
	ret
L_gen_matrix_sample_four_polynomials$1:
	leaq	glob_data + 2464(%rip), %rsi
	shlq	$5, %rcx
	addq	%rcx, %rdi
	movq	(%rsi,%rdi), %rcx
	movq	%rcx, 832(%rsp)
	leaq	32(%rsp), %rcx
	leaq	832(%rsp), %r9
	leaq	-8(%rsp), %rsp
	call	L_shake128x4_absorb_A32_A2$1
L_gen_matrix_sample_four_polynomials$7:
	leaq	8(%rsp), %rsp
	call	L_shake128x4_squeeze3blocks$1
L_gen_matrix_sample_four_polynomials$6:
	movq	%rdx, 832(%rsp)
	movq	%rax, 840(%rsp)
	movq	%rdx, %r10
	movq	%rax, %rcx
	leaq	-24(%rsp), %rsp
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$5:
	leaq	24(%rsp), %rsp
	movq	832(%rsp), %rax
	movq	840(%rsp), %rcx
	movq	%rax, 840(%rsp)
	movq	%rcx, 832(%rsp)
	leaq	536(%rax), %r10
	leaq	512(%rcx), %rcx
	leaq	-24(%rsp), %rsp
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$4:
	leaq	24(%rsp), %rsp
	movq	840(%rsp), %rax
	movq	832(%rsp), %rcx
	movq	%rax, 832(%rsp)
	movq	%rcx, 840(%rsp)
	leaq	1072(%rax), %r10
	leaq	1024(%rcx), %rcx
	leaq	-24(%rsp), %rsp
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$3:
	leaq	24(%rsp), %rsp
	movq	832(%rsp), %rax
	movq	840(%rsp), %rcx
	movq	%rax, 840(%rsp)
	movq	%rcx, 832(%rsp)
	leaq	1608(%rax), %r10
	leaq	1536(%rcx), %rcx
	leaq	-24(%rsp), %rsp
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$2:
	leaq	24(%rsp), %rsp
	movq	840(%rsp), %rdx
	ret
L__gen_matrix_fill_polynomial$1:
	movq	$0, %rax
	movq	$0, %r9
	leaq	-8(%rsp), %rsp
	call	L_gen_matrix_buf_rejection$1
L__gen_matrix_fill_polynomial$6:
	leaq	8(%rsp), %rsp
	movq	$336, %rax
	jmp 	L__gen_matrix_fill_polynomial$2
L__gen_matrix_fill_polynomial$3:
	movq	%rcx, 8(%rsp)
	movq	%r9, 16(%rsp)
	movq	%rax, 24(%rsp)
	leaq	-8(%rsp), %rsp
	call	L_shake128_next_state$1
L__gen_matrix_fill_polynomial$5:
	leaq	8(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	16(%rsp), %r9
	movq	24(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_gen_matrix_buf_rejection$1
L__gen_matrix_fill_polynomial$4:
	leaq	8(%rsp), %rsp
L__gen_matrix_fill_polynomial$2:
	cmpq	$256, %r9
	jb  	L__gen_matrix_fill_polynomial$3
	ret
L_gen_matrix_buf_rejection$1:
	lfence
	movq	$0, %rdx
	vmovdqu	glob_data + 96(%rip), %ymm0
	vmovdqu	glob_data + 32(%rip), %ymm5
	vmovdqu	glob_data + 0(%rip), %ymm1
	vmovdqu	glob_data + 64(%rip), %ymm2
	leaq	glob_data + 2528(%rip), %rsi
	movq	%rax, 8(%rsp)
	movq	%rax, %r8
	jmp 	L_gen_matrix_buf_rejection$22
L_gen_matrix_buf_rejection$23:
	movq	$-1, %rdi
	cmovnb	%rdi, %rdx
	cmpq	$225, %r9
	jb  	L_gen_matrix_buf_rejection$24
	movq	$-1, %rdi
	cmovb	%rdi, %rdx
	movq	$504, %r8
	jmp 	L_gen_matrix_buf_rejection$22
L_gen_matrix_buf_rejection$24:
	movq	$-1, %rdi
	cmovnb	%rdi, %rdx
	vpermq	$148, (%r10,%r8), %ymm3
	vpermq	$148, 24(%r10,%r8), %ymm4
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
	vpmovmskb	%ymm6, %edi
// declassify_val u64 %rdi
	orq 	%rdx, %rdi
	movq	%rdi, %r8
	andq	$255, %r8
	vmovq	(%rsi,%r8,8), %xmm6
	popcnt	%r8, %r8
	addq	%r9, %r8
	movq	%rdi, %r11
	shrq	$16, %r11
	andq	$255, %r11
	vmovq	(%rsi,%r11,8), %xmm7
	popcnt	%r11, %r11
	addq	%r8, %r11
	movq	%rdi, %rbx
	shrq	$8, %rbx
	andq	$255, %rbx
	vmovq	(%rsi,%rbx,8), %xmm8
	popcnt	%rbx, %rbx
	addq	%r11, %rbx
	shrq	$24, %rdi
	andq	$255, %rdi
	vmovq	(%rsi,%rdi,8), %xmm9
	popcnt	%rdi, %rdi
	addq	%rbx, %rdi
	vinserti128	$1, %xmm7, %ymm6, %ymm6
	vinserti128	$1, %xmm9, %ymm8, %ymm8
	vpaddb	%ymm2, %ymm6, %ymm7
	vpunpcklbw	%ymm7, %ymm6, %ymm6
	vpaddb	%ymm2, %ymm8, %ymm7
	vpunpcklbw	%ymm7, %ymm8, %ymm8
	vpshufb	%ymm6, %ymm3, %ymm3
	vpshufb	%ymm8, %ymm4, %ymm4
	vmovdqu	%xmm3, (%rcx,%r9,2)
	vextracti128	$1, %ymm3, (%rcx,%r8,2)
	vmovdqu	%xmm4, (%rcx,%r11,2)
	vextracti128	$1, %ymm4, (%rcx,%rbx,2)
	movq	%rdi, %r9
	addq	$48, 8(%rsp)
	movq	8(%rsp), %r8
	orq 	%rdx, %r8
L_gen_matrix_buf_rejection$25:
L_gen_matrix_buf_rejection$22:
	cmpq	$457, %r8
	jb  	L_gen_matrix_buf_rejection$23
	movq	$-1, %rdi
	cmovb	%rdi, %rdx
	movq	8(%rsp), %r8
	orq 	%rdx, %r8
	jmp 	L_gen_matrix_buf_rejection$2
L_gen_matrix_buf_rejection$3:
	movq	$-1, %rdi
	cmovnb	%rdi, %rdx
	cmpq	$256, %r9
	jb  	L_gen_matrix_buf_rejection$4
	movq	$-1, %rdi
	cmovb	%rdi, %rdx
	movq	$504, %r8
	jmp 	L_gen_matrix_buf_rejection$2
L_gen_matrix_buf_rejection$4:
	movq	$-1, %rdi
	cmovnb	%rdi, %rdx
	movq	%r8, 8(%rsp)
	vpermq	$148, (%r10,%r8), %ymm3
	vpshufb	%ymm0, %ymm3, %ymm3
	vpsrlw	$4, %ymm3, %ymm6
	vpblendw	$170, %ymm6, %ymm3, %ymm3
	vpand	%ymm5, %ymm3, %ymm3
	vpcmpgtw	%ymm3, %ymm1, %ymm6
	vpxor	%ymm7, %ymm7, %ymm7
	vpacksswb	%ymm7, %ymm6, %ymm6
	vpmovmskb	%ymm6, %r8d
// declassify_val u64 %r8
	orq 	%rdx, %r8
	movq	%r8, %rdi
	andq	$255, %rdi
	vmovq	(%rsi,%rdi,8), %xmm6
	popcnt	%rdi, %rdi
	addq	%r9, %rdi
	shrq	$16, %r8
	andq	$255, %r8
	vmovq	(%rsi,%r8,8), %xmm7
	popcnt	%r8, %r8
	addq	%rdi, %r8
	vinserti128	$1, %xmm7, %ymm6, %ymm6
	vpaddb	%ymm2, %ymm6, %ymm7
	vpunpcklbw	%ymm7, %ymm6, %ymm6
	vpshufb	%ymm6, %ymm3, %ymm3
	vmovdqu	%xmm3, %xmm4
	cmpq	$248, %r9
	jbe 	L_gen_matrix_buf_rejection$14
	movq	$-1, %r11
	cmovbe	%r11, %rdx
	movq	%xmm4, %rbx
	cmpq	$252, %r9
	jbe 	L_gen_matrix_buf_rejection$20
	movq	$-1, %r11
	cmovbe	%r11, %rdx
	jmp 	L_gen_matrix_buf_rejection$21
L_gen_matrix_buf_rejection$20:
	movq	$-1, %r11
	cmovnbe	%r11, %rdx
	movq	%rbx, (%rcx,%r9,2)
	vpextrq	$1, %xmm4, %rbx
	addq	$4, %r9
L_gen_matrix_buf_rejection$21:
	cmpq	$254, %r9
	jbe 	L_gen_matrix_buf_rejection$18
	movq	$-1, %r11
	cmovbe	%r11, %rdx
	jmp 	L_gen_matrix_buf_rejection$19
L_gen_matrix_buf_rejection$18:
	movq	$-1, %r11
	cmovnbe	%r11, %rdx
	movl	%ebx, (%rcx,%r9,2)
	shrq	$32, %rbx
	addq	$2, %r9
L_gen_matrix_buf_rejection$19:
	cmpq	$255, %r9
	jbe 	L_gen_matrix_buf_rejection$16
	movq	$-1, %r9
	cmovbe	%r9, %rdx
	jmp 	L_gen_matrix_buf_rejection$15
L_gen_matrix_buf_rejection$16:
	movq	$-1, %r11
	cmovnbe	%r11, %rdx
	movw	%bx, (%rcx,%r9,2)
L_gen_matrix_buf_rejection$17:
	jmp 	L_gen_matrix_buf_rejection$15
L_gen_matrix_buf_rejection$14:
	movq	$-1, %r11
	cmovnbe	%r11, %rdx
	vmovdqu	%xmm4, (%rcx,%r9,2)
L_gen_matrix_buf_rejection$15:
	vextracti128	$1, %ymm3, %xmm4
	cmpq	$248, %rdi
	jbe 	L_gen_matrix_buf_rejection$6
	movq	$-1, %r9
	cmovbe	%r9, %rdx
	movq	%xmm4, %rbx
	cmpq	$252, %rdi
	jbe 	L_gen_matrix_buf_rejection$12
	movq	$-1, %r9
	cmovbe	%r9, %rdx
	jmp 	L_gen_matrix_buf_rejection$13
L_gen_matrix_buf_rejection$12:
	movq	$-1, %r9
	cmovnbe	%r9, %rdx
	movq	%rbx, (%rcx,%rdi,2)
	vpextrq	$1, %xmm4, %rbx
	addq	$4, %rdi
L_gen_matrix_buf_rejection$13:
	cmpq	$254, %rdi
	jbe 	L_gen_matrix_buf_rejection$10
	movq	$-1, %r9
	cmovbe	%r9, %rdx
	jmp 	L_gen_matrix_buf_rejection$11
L_gen_matrix_buf_rejection$10:
	movq	$-1, %r9
	cmovnbe	%r9, %rdx
	movl	%ebx, (%rcx,%rdi,2)
	shrq	$32, %rbx
	addq	$2, %rdi
L_gen_matrix_buf_rejection$11:
	cmpq	$255, %rdi
	jbe 	L_gen_matrix_buf_rejection$8
	movq	$-1, %rdi
	cmovbe	%rdi, %rdx
	jmp 	L_gen_matrix_buf_rejection$7
L_gen_matrix_buf_rejection$8:
	movq	$-1, %r9
	cmovnbe	%r9, %rdx
	movw	%bx, (%rcx,%rdi,2)
L_gen_matrix_buf_rejection$9:
	jmp 	L_gen_matrix_buf_rejection$7
L_gen_matrix_buf_rejection$6:
	movq	$-1, %r9
	cmovnbe	%r9, %rdx
	vmovdqu	%xmm4, (%rcx,%rdi,2)
L_gen_matrix_buf_rejection$7:
	movq	%r8, %r9
	movq	8(%rsp), %r8
	orq 	%rdx, %r8
	addq	$24, %r8
L_gen_matrix_buf_rejection$5:
L_gen_matrix_buf_rejection$2:
	cmpq	$481, %r8
	jb  	L_gen_matrix_buf_rejection$3
	ret
L_i_poly_decompress$1:
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 384(%rip), %ymm1
	vmovdqu	glob_data + 352(%rip), %ymm5
	vmovdqu	glob_data + 320(%rip), %ymm4
	vmovq	(%rdi), %xmm2
	movw	8(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rsi)
	vmovq	10(%rdi), %xmm2
	movw	18(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rsi)
	vmovq	20(%rdi), %xmm2
	movw	28(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rsi)
	vmovq	30(%rdi), %xmm2
	movw	38(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rsi)
	vmovq	40(%rdi), %xmm2
	movw	48(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rsi)
	vmovq	50(%rdi), %xmm2
	movw	58(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rsi)
	vmovq	60(%rdi), %xmm2
	movw	68(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rsi)
	vmovq	70(%rdi), %xmm2
	movw	78(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rsi)
	vmovq	80(%rdi), %xmm2
	movw	88(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rsi)
	vmovq	90(%rdi), %xmm2
	movw	98(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rsi)
	vmovq	100(%rdi), %xmm2
	movw	108(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rsi)
	vmovq	110(%rdi), %xmm2
	movw	118(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rsi)
	vmovq	120(%rdi), %xmm2
	movw	128(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rsi)
	vmovq	130(%rdi), %xmm2
	movw	138(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rsi)
	vmovq	140(%rdi), %xmm2
	movw	148(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
	vmovdqu	%xmm2, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm2
	vpshufb	%ymm1, %ymm2, %ymm2
	vpand	%ymm5, %ymm2, %ymm2
	vpmullw	%ymm4, %ymm2, %ymm2
	vpmulhrsw	%ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rsi)
	vmovq	150(%rdi), %xmm2
	movw	158(%rdi), %r8w
	vpinsrw	$4, %r8d, %xmm2, %xmm2
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
	leaq	glob_data + 576(%rip), %rsi
	vmovdqu	(%rsi), %ymm0
	leaq	glob_data + 544(%rip), %rsi
	vmovdqu	(%rsi), %ymm1
	vmovdqu	(%rax), %ymm3
	vmovdqu	32(%rax), %ymm4
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
	vpmovmskb	%ymm3, %esi
	movl	%esi, (%rcx)
	vmovdqu	64(%rax), %ymm3
	vmovdqu	96(%rax), %ymm4
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
	vpmovmskb	%ymm3, %esi
	movl	%esi, 4(%rcx)
	vmovdqu	128(%rax), %ymm3
	vmovdqu	160(%rax), %ymm4
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
	vpmovmskb	%ymm3, %esi
	movl	%esi, 8(%rcx)
	vmovdqu	192(%rax), %ymm3
	vmovdqu	224(%rax), %ymm4
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
	vpmovmskb	%ymm3, %esi
	movl	%esi, 12(%rcx)
	vmovdqu	256(%rax), %ymm3
	vmovdqu	288(%rax), %ymm4
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
	vpmovmskb	%ymm3, %esi
	movl	%esi, 16(%rcx)
	vmovdqu	320(%rax), %ymm3
	vmovdqu	352(%rax), %ymm4
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
	vpmovmskb	%ymm3, %esi
	movl	%esi, 20(%rcx)
	vmovdqu	384(%rax), %ymm3
	vmovdqu	416(%rax), %ymm4
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
	vpmovmskb	%ymm3, %esi
	movl	%esi, 24(%rcx)
	vmovdqu	448(%rax), %ymm3
	vmovdqu	480(%rax), %ymm4
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
	vpmovmskb	%ymm3, %esi
	movl	%esi, 28(%rcx)
	ret
L_i_poly_tobytes$1:
	call	L_poly_csubq$1
L_i_poly_tobytes$2:
	vmovdqu	(%rax), %ymm6
	vmovdqu	32(%rax), %ymm3
	vmovdqu	64(%rax), %ymm4
	vmovdqu	96(%rax), %ymm10
	vmovdqu	128(%rax), %ymm1
	vmovdqu	160(%rax), %ymm5
	vmovdqu	192(%rax), %ymm2
	vmovdqu	224(%rax), %ymm12
	vpsllw	$12, %ymm3, %ymm0
	vpor	%ymm6, %ymm0, %ymm0
	vpsrlw	$4, %ymm3, %ymm6
	vpsllw	$8, %ymm4, %ymm3
	vpor	%ymm3, %ymm6, %ymm6
	vpsrlw	$8, %ymm4, %ymm3
	vpsllw	$4, %ymm10, %ymm4
	vpor	%ymm4, %ymm3, %ymm3
	vpsllw	$12, %ymm5, %ymm4
	vpor	%ymm1, %ymm4, %ymm1
	vpsrlw	$4, %ymm5, %ymm10
	vpsllw	$8, %ymm2, %ymm11
	vpor	%ymm11, %ymm10, %ymm4
	vpsrlw	$8, %ymm2, %ymm10
	vpsllw	$4, %ymm12, %ymm5
	vpor	%ymm5, %ymm10, %ymm2
	vpslld	$16, %ymm6, %ymm11
	vpblendw	$170, %ymm11, %ymm0, %ymm5
	vpsrld	$16, %ymm0, %ymm7
	vpblendw	$170, %ymm6, %ymm7, %ymm6
	vpslld	$16, %ymm1, %ymm11
	vpblendw	$170, %ymm11, %ymm3, %ymm7
	vpsrld	$16, %ymm3, %ymm3
	vpblendw	$170, %ymm1, %ymm3, %ymm3
	vpslld	$16, %ymm2, %ymm11
	vpblendw	$170, %ymm11, %ymm4, %ymm9
	vpsrld	$16, %ymm4, %ymm8
	vpblendw	$170, %ymm2, %ymm8, %ymm1
	vmovsldup	%ymm7, %ymm2
	vpblendd	$170, %ymm2, %ymm5, %ymm2
	vpsrlq	$32, %ymm5, %ymm4
	vpblendd	$170, %ymm7, %ymm4, %ymm5
	vmovsldup	%ymm6, %ymm11
	vpblendd	$170, %ymm11, %ymm9, %ymm7
	vpsrlq	$32, %ymm9, %ymm4
	vpblendd	$170, %ymm6, %ymm4, %ymm4
	vmovsldup	%ymm1, %ymm6
	vpblendd	$170, %ymm6, %ymm3, %ymm9
	vpsrlq	$32, %ymm3, %ymm3
	vpblendd	$170, %ymm1, %ymm3, %ymm1
	vpunpcklqdq	%ymm7, %ymm2, %ymm3
	vpunpckhqdq	%ymm7, %ymm2, %ymm2
	vpunpcklqdq	%ymm5, %ymm9, %ymm6
	vpunpckhqdq	%ymm5, %ymm9, %ymm5
	vpunpcklqdq	%ymm1, %ymm4, %ymm7
	vpunpckhqdq	%ymm1, %ymm4, %ymm1
	vperm2i128	$32, %ymm6, %ymm3, %ymm11
	vperm2i128	$49, %ymm6, %ymm3, %ymm10
	vperm2i128	$32, %ymm2, %ymm7, %ymm4
	vperm2i128	$49, %ymm2, %ymm7, %ymm0
	vperm2i128	$32, %ymm1, %ymm5, %ymm3
	vperm2i128	$49, %ymm1, %ymm5, %ymm1
	vmovdqu	%ymm11, (%r8)
	vmovdqu	%ymm4, 32(%r8)
	vmovdqu	%ymm3, 64(%r8)
	vmovdqu	%ymm10, 96(%r8)
	vmovdqu	%ymm0, 128(%r8)
	vmovdqu	%ymm1, 160(%r8)
	vmovdqu	256(%rax), %ymm6
	vmovdqu	288(%rax), %ymm7
	vmovdqu	320(%rax), %ymm4
	vmovdqu	352(%rax), %ymm10
	vmovdqu	384(%rax), %ymm1
	vmovdqu	416(%rax), %ymm5
	vmovdqu	448(%rax), %ymm2
	vmovdqu	480(%rax), %ymm12
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
	vpblendw	$170, %ymm6, %ymm4, %ymm6
	vpsrld	$16, %ymm4, %ymm3
	vpblendw	$170, %ymm1, %ymm3, %ymm3
	vpslld	$16, %ymm11, %ymm15
	vpblendw	$170, %ymm15, %ymm10, %ymm7
	vpsrld	$16, %ymm10, %ymm8
	vpblendw	$170, %ymm11, %ymm8, %ymm1
	vmovsldup	%ymm6, %ymm11
	vpblendd	$170, %ymm11, %ymm0, %ymm4
	vpsrlq	$32, %ymm0, %ymm5
	vpblendd	$170, %ymm6, %ymm5, %ymm5
	vmovsldup	%ymm2, %ymm6
	vpblendd	$170, %ymm6, %ymm7, %ymm6
	vpsrlq	$32, %ymm7, %ymm7
	vpblendd	$170, %ymm2, %ymm7, %ymm2
	vmovsldup	%ymm1, %ymm11
	vpblendd	$170, %ymm11, %ymm3, %ymm7
	vpsrlq	$32, %ymm3, %ymm3
	vpblendd	$170, %ymm1, %ymm3, %ymm1
	vpunpcklqdq	%ymm6, %ymm4, %ymm3
	vpunpckhqdq	%ymm6, %ymm4, %ymm6
	vpunpcklqdq	%ymm5, %ymm7, %ymm8
	vpunpckhqdq	%ymm5, %ymm7, %ymm4
	vpunpcklqdq	%ymm1, %ymm2, %ymm5
	vpunpckhqdq	%ymm1, %ymm2, %ymm1
	vperm2i128	$32, %ymm8, %ymm3, %ymm2
	vperm2i128	$49, %ymm8, %ymm3, %ymm10
	vperm2i128	$32, %ymm6, %ymm5, %ymm8
	vperm2i128	$49, %ymm6, %ymm5, %ymm0
	vperm2i128	$32, %ymm1, %ymm4, %ymm3
	vperm2i128	$49, %ymm1, %ymm4, %ymm1
	vmovdqu	%ymm2, 192(%r8)
	vmovdqu	%ymm8, 224(%r8)
	vmovdqu	%ymm3, 256(%r8)
	vmovdqu	%ymm10, 288(%r8)
	vmovdqu	%ymm0, 320(%r8)
	vmovdqu	%ymm1, 352(%r8)
	ret
L_poly_sub$1:
	vmovdqu	(%rsi), %ymm2
	vmovdqu	(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, (%rax)
	vmovdqu	32(%rsi), %ymm2
	vmovdqu	32(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 32(%rax)
	vmovdqu	64(%rsi), %ymm2
	vmovdqu	64(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 64(%rax)
	vmovdqu	96(%rsi), %ymm2
	vmovdqu	96(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 96(%rax)
	vmovdqu	128(%rsi), %ymm2
	vmovdqu	128(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 128(%rax)
	vmovdqu	160(%rsi), %ymm2
	vmovdqu	160(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 160(%rax)
	vmovdqu	192(%rsi), %ymm2
	vmovdqu	192(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 192(%rax)
	vmovdqu	224(%rsi), %ymm2
	vmovdqu	224(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 224(%rax)
	vmovdqu	256(%rsi), %ymm2
	vmovdqu	256(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 256(%rax)
	vmovdqu	288(%rsi), %ymm2
	vmovdqu	288(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 288(%rax)
	vmovdqu	320(%rsi), %ymm2
	vmovdqu	320(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 320(%rax)
	vmovdqu	352(%rsi), %ymm2
	vmovdqu	352(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 352(%rax)
	vmovdqu	384(%rsi), %ymm2
	vmovdqu	384(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 384(%rax)
	vmovdqu	416(%rsi), %ymm2
	vmovdqu	416(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 416(%rax)
	vmovdqu	448(%rsi), %ymm2
	vmovdqu	448(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 448(%rax)
	vmovdqu	480(%rsi), %ymm2
	vmovdqu	480(%rdi), %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	ret
L_poly_ntt$1:
	vmovdqu	glob_data + 800(%rip), %ymm0
	vpbroadcastd	glob_data + 1632(%rip), %ymm2
	vpbroadcastd	glob_data + 1636(%rip), %ymm4
	vmovdqu	(%rax), %ymm8
	vmovdqu	32(%rax), %ymm14
	vmovdqu	64(%rax), %ymm1
	vmovdqu	96(%rax), %ymm3
	vmovdqu	256(%rax), %ymm9
	vmovdqu	288(%rax), %ymm10
	vmovdqu	320(%rax), %ymm5
	vmovdqu	352(%rax), %ymm12
	vpmullw	%ymm9, %ymm2, %ymm6
	vpmulhw	%ymm9, %ymm4, %ymm7
	vpmullw	%ymm10, %ymm2, %ymm9
	vpmulhw	%ymm10, %ymm4, %ymm15
	vpmullw	%ymm5, %ymm2, %ymm10
	vpmulhw	%ymm5, %ymm4, %ymm5
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
	vmovdqu	%ymm6, (%rax)
	vmovdqu	%ymm9, 32(%rax)
	vmovdqu	%ymm10, 64(%rax)
	vmovdqu	%ymm7, 96(%rax)
	vmovdqu	%ymm5, 256(%rax)
	vmovdqu	%ymm8, 288(%rax)
	vmovdqu	%ymm12, 320(%rax)
	vmovdqu	%ymm1, 352(%rax)
	vmovdqu	128(%rax), %ymm8
	vmovdqu	160(%rax), %ymm6
	vmovdqu	192(%rax), %ymm1
	vmovdqu	224(%rax), %ymm3
	vmovdqu	384(%rax), %ymm9
	vmovdqu	416(%rax), %ymm10
	vmovdqu	448(%rax), %ymm5
	vmovdqu	480(%rax), %ymm12
	vpmullw	%ymm9, %ymm2, %ymm15
	vpmulhw	%ymm9, %ymm4, %ymm7
	vpmullw	%ymm10, %ymm2, %ymm9
	vpmulhw	%ymm10, %ymm4, %ymm14
	vpmullw	%ymm5, %ymm2, %ymm10
	vpmulhw	%ymm5, %ymm4, %ymm5
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
	vpaddw	%ymm13, %ymm4, %ymm2
	vpsubw	%ymm4, %ymm6, %ymm9
	vpaddw	%ymm12, %ymm10, %ymm12
	vpsubw	%ymm10, %ymm1, %ymm10
	vpaddw	%ymm7, %ymm11, %ymm1
	vpsubw	%ymm11, %ymm3, %ymm13
	vmovdqu	%ymm5, 384(%rax)
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	%ymm12, 448(%rax)
	vmovdqu	%ymm1, 480(%rax)
	vpbroadcastd	glob_data + 1640(%rip), %ymm2
	vpbroadcastd	glob_data + 1644(%rip), %ymm4
	vmovdqu	%ymm9, %ymm14
	vmovdqu	%ymm10, %ymm12
	vmovdqu	(%rax), %ymm9
	vmovdqu	32(%rax), %ymm6
	vmovdqu	64(%rax), %ymm7
	vmovdqu	96(%rax), %ymm5
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
	vmovdqu	glob_data + 1648(%rip), %ymm5
	vmovdqu	glob_data + 1680(%rip), %ymm3
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
	vmovdqu	glob_data + 1712(%rip), %ymm2
	vmovdqu	glob_data + 1744(%rip), %ymm11
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
	vmovdqu	glob_data + 1776(%rip), %ymm5
	vmovdqu	glob_data + 1808(%rip), %ymm3
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
	vmovdqu	glob_data + 1840(%rip), %ymm5
	vmovdqu	glob_data + 1872(%rip), %ymm3
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
	vmovdqu	glob_data + 1904(%rip), %ymm5
	vmovdqu	glob_data + 1936(%rip), %ymm14
	vmovdqu	glob_data + 1968(%rip), %ymm12
	vmovdqu	glob_data + 2000(%rip), %ymm2
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
	vmovdqu	glob_data + 736(%rip), %ymm7
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
	vpsubw	%ymm4, %ymm5, %ymm4
	vpmulhw	%ymm7, %ymm8, %ymm5
	vpsraw	$10, %ymm5, %ymm5
	vpmullw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm8, %ymm8
	vpmulhw	%ymm7, %ymm9, %ymm5
	vpsraw	$10, %ymm5, %ymm5
	vpmullw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm9, %ymm13
	vpmulhw	%ymm7, %ymm3, %ymm5
	vpsraw	$10, %ymm5, %ymm5
	vpmullw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm3, %ymm3
	vmovdqu	%ymm2, (%rax)
	vmovdqu	%ymm11, 32(%rax)
	vmovdqu	%ymm4, 64(%rax)
	vmovdqu	%ymm8, 96(%rax)
	vmovdqu	%ymm10, 128(%rax)
	vmovdqu	%ymm1, 160(%rax)
	vmovdqu	%ymm13, 192(%rax)
	vmovdqu	%ymm3, 224(%rax)
	vpbroadcastd	glob_data + 2032(%rip), %ymm2
	vpbroadcastd	glob_data + 2036(%rip), %ymm6
	vmovdqu	384(%rax), %ymm9
	vmovdqu	416(%rax), %ymm10
	vmovdqu	448(%rax), %ymm13
	vmovdqu	480(%rax), %ymm7
	vmovdqu	256(%rax), %ymm8
	vmovdqu	288(%rax), %ymm3
	vmovdqu	320(%rax), %ymm12
	vmovdqu	352(%rax), %ymm4
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
	vpaddw	%ymm9, %ymm1, %ymm5
	vpsubw	%ymm1, %ymm12, %ymm9
	vpaddw	%ymm3, %ymm2, %ymm1
	vpsubw	%ymm2, %ymm4, %ymm14
	vmovdqu	glob_data + 2040(%rip), %ymm4
	vmovdqu	glob_data + 2072(%rip), %ymm3
	vperm2i128	$32, %ymm11, %ymm10, %ymm8
	vperm2i128	$49, %ymm11, %ymm10, %ymm7
	vperm2i128	$32, %ymm13, %ymm6, %ymm2
	vperm2i128	$49, %ymm13, %ymm6, %ymm12
	vperm2i128	$32, %ymm5, %ymm9, %ymm11
	vperm2i128	$49, %ymm5, %ymm9, %ymm10
	vperm2i128	$32, %ymm1, %ymm14, %ymm5
	vperm2i128	$49, %ymm1, %ymm14, %ymm14
	vpmullw	%ymm11, %ymm4, %ymm6
	vpmulhw	%ymm11, %ymm3, %ymm9
	vpmullw	%ymm10, %ymm4, %ymm13
	vpmulhw	%ymm10, %ymm3, %ymm10
	vpmullw	%ymm5, %ymm4, %ymm11
	vpmulhw	%ymm5, %ymm3, %ymm1
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
	vmovdqu	glob_data + 2104(%rip), %ymm1
	vmovdqu	glob_data + 2136(%rip), %ymm13
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
	vmovdqu	glob_data + 2168(%rip), %ymm5
	vmovdqu	glob_data + 2200(%rip), %ymm3
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
	vmovdqu	glob_data + 2232(%rip), %ymm5
	vmovdqu	glob_data + 2264(%rip), %ymm3
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
	vmovdqu	glob_data + 2296(%rip), %ymm5
	vmovdqu	glob_data + 2328(%rip), %ymm14
	vmovdqu	glob_data + 2360(%rip), %ymm12
	vmovdqu	glob_data + 2392(%rip), %ymm2
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
	vmovdqu	glob_data + 736(%rip), %ymm7
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
	vpsubw	%ymm4, %ymm5, %ymm4
	vpmulhw	%ymm7, %ymm8, %ymm5
	vpsraw	$10, %ymm5, %ymm5
	vpmullw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm8, %ymm8
	vpmulhw	%ymm7, %ymm9, %ymm5
	vpsraw	$10, %ymm5, %ymm5
	vpmullw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm9, %ymm13
	vpmulhw	%ymm7, %ymm3, %ymm5
	vpsraw	$10, %ymm5, %ymm5
	vpmullw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm3, %ymm3
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	%ymm11, 288(%rax)
	vmovdqu	%ymm4, 320(%rax)
	vmovdqu	%ymm8, 352(%rax)
	vmovdqu	%ymm10, 384(%rax)
	vmovdqu	%ymm1, 416(%rax)
	vmovdqu	%ymm13, 448(%rax)
	vmovdqu	%ymm3, 480(%rax)
	ret
L_poly_invntt$1:
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 832(%rip), %ymm10
	vmovdqu	glob_data + 896(%rip), %ymm1
	vmovdqu	glob_data + 864(%rip), %ymm2
	vmovdqu	glob_data + 928(%rip), %ymm5
	vmovdqu	(%rax), %ymm9
	vmovdqu	32(%rax), %ymm14
	vmovdqu	64(%rax), %ymm3
	vmovdqu	96(%rax), %ymm4
	vmovdqu	128(%rax), %ymm6
	vmovdqu	160(%rax), %ymm12
	vmovdqu	192(%rax), %ymm13
	vmovdqu	224(%rax), %ymm11
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
	vmovdqu	glob_data + 736(%rip), %ymm1
	vmovdqu	glob_data + 960(%rip), %ymm2
	vmovdqu	glob_data + 992(%rip), %ymm10
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
	vmovdqu	glob_data + 1024(%rip), %ymm2
	vmovdqu	glob_data + 1056(%rip), %ymm4
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
	vmovdqu	glob_data + 1088(%rip), %ymm4
	vmovdqu	glob_data + 1120(%rip), %ymm5
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
	vmovdqu	glob_data + 1152(%rip), %ymm5
	vmovdqu	glob_data + 1184(%rip), %ymm6
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
	vpbroadcastd	glob_data + 1216(%rip), %ymm5
	vpbroadcastd	glob_data + 1220(%rip), %ymm7
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
	vmovdqu	%ymm1, (%rax)
	vmovdqu	%ymm10, 32(%rax)
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	%ymm3, 96(%rax)
	vmovdqu	%ymm6, 128(%rax)
	vmovdqu	%ymm7, 160(%rax)
	vmovdqu	%ymm8, 192(%rax)
	vmovdqu	%ymm4, 224(%rax)
	vmovdqu	glob_data + 1224(%rip), %ymm10
	vmovdqu	glob_data + 1288(%rip), %ymm1
	vmovdqu	glob_data + 1256(%rip), %ymm2
	vmovdqu	glob_data + 1320(%rip), %ymm5
	vmovdqu	256(%rax), %ymm9
	vmovdqu	288(%rax), %ymm14
	vmovdqu	320(%rax), %ymm3
	vmovdqu	352(%rax), %ymm4
	vmovdqu	384(%rax), %ymm6
	vmovdqu	416(%rax), %ymm12
	vmovdqu	448(%rax), %ymm13
	vmovdqu	480(%rax), %ymm11
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
	vpmulhw	%ymm12, %ymm0, %ymm5
	vpmulhw	%ymm1, %ymm0, %ymm1
	vpsubw	%ymm8, %ymm15, %ymm12
	vpsubw	%ymm13, %ymm7, %ymm8
	vpsubw	%ymm5, %ymm2, %ymm9
	vpsubw	%ymm1, %ymm10, %ymm7
	vmovdqu	glob_data + 736(%rip), %ymm1
	vmovdqu	glob_data + 1352(%rip), %ymm2
	vmovdqu	glob_data + 1384(%rip), %ymm10
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
	vmovdqu	glob_data + 1416(%rip), %ymm2
	vmovdqu	glob_data + 1448(%rip), %ymm10
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
	vmovdqu	glob_data + 1480(%rip), %ymm4
	vmovdqu	glob_data + 1512(%rip), %ymm5
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
	vmovdqu	glob_data + 1544(%rip), %ymm5
	vmovdqu	glob_data + 1576(%rip), %ymm6
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
	vpbroadcastd	glob_data + 1608(%rip), %ymm5
	vpbroadcastd	glob_data + 1612(%rip), %ymm7
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
	vmovdqu	%ymm6, 384(%rax)
	vmovdqu	%ymm7, 416(%rax)
	vmovdqu	%ymm8, 448(%rax)
	vmovdqu	%ymm4, 480(%rax)
	vpbroadcastd	glob_data + 1616(%rip), %ymm4
	vpbroadcastd	glob_data + 1620(%rip), %ymm5
	vmovdqu	%ymm3, %ymm7
	vmovdqu	%ymm2, %ymm3
	vmovdqu	(%rax), %ymm13
	vmovdqu	32(%rax), %ymm14
	vmovdqu	64(%rax), %ymm6
	vmovdqu	96(%rax), %ymm9
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
	vmovdqu	glob_data + 672(%rip), %ymm7
	vmovdqu	glob_data + 704(%rip), %ymm9
	vmovdqu	%ymm11, 256(%rax)
	vmovdqu	%ymm8, 288(%rax)
	vmovdqu	%ymm12, 320(%rax)
	vmovdqu	%ymm10, 352(%rax)
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
	vmovdqu	%ymm8, (%rax)
	vmovdqu	%ymm1, 32(%rax)
	vmovdqu	%ymm10, 64(%rax)
	vmovdqu	%ymm7, 96(%rax)
	vmovdqu	384(%rax), %ymm1
	vmovdqu	416(%rax), %ymm10
	vmovdqu	448(%rax), %ymm3
	vmovdqu	480(%rax), %ymm11
	vmovdqu	128(%rax), %ymm9
	vmovdqu	160(%rax), %ymm14
	vmovdqu	192(%rax), %ymm6
	vmovdqu	224(%rax), %ymm12
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
	vmovdqu	glob_data + 672(%rip), %ymm7
	vmovdqu	glob_data + 704(%rip), %ymm9
	vmovdqu	%ymm5, 384(%rax)
	vmovdqu	%ymm11, 416(%rax)
	vmovdqu	%ymm12, 448(%rax)
	vmovdqu	%ymm4, 480(%rax)
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
	vmovdqu	%ymm8, 128(%rax)
	vmovdqu	%ymm1, 160(%rax)
	vmovdqu	%ymm10, 192(%rax)
	vmovdqu	%ymm7, 224(%rax)
	ret
L_poly_getnoise_eta1_4x$1:
	leaq	32(%rsp), %rdx
	leaq	160(%rsp), %rax
	leaq	288(%rsp), %rsi
	leaq	416(%rsp), %rdi
	movq	%rcx, 552(%rsp)
	movq	%r9, 560(%rsp)
	movq	%r10, 568(%rsp)
	movq	%r11, 576(%rsp)
	movb	%bl, 544(%rsp)
	incb	%bl
	movb	%bl, 545(%rsp)
	incb	%bl
	movb	%bl, 546(%rsp)
	incb	%bl
	movb	%bl, 547(%rsp)
	leaq	544(%rsp), %rbx
	leaq	-856(%rsp), %rsp
	call	L_shake256x4_A128__A32_A1$1
L_poly_getnoise_eta1_4x$2:
	leaq	856(%rsp), %rsp
	lfence
	movq	$0, %rcx
	movq	552(%rsp), %rcx
	movq	560(%rsp), %r9
	movq	568(%rsp), %r10
	movq	576(%rsp), %r11
	movl	$1431655765, 544(%rsp)
	movl	$858993459, 584(%rsp)
	movl	$50529027, 588(%rsp)
	movl	$252645135, 592(%rsp)
	vpbroadcastd	544(%rsp), %ymm0
	vpbroadcastd	584(%rsp), %ymm1
	vpbroadcastd	588(%rsp), %ymm2
	vpbroadcastd	592(%rsp), %ymm3
	vmovdqu	(%rdx), %ymm9
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
	vmovdqu	32(%rdx), %ymm9
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
	vmovdqu	64(%rdx), %ymm9
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
	vmovdqu	96(%rdx), %ymm9
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
	movl	$1431655765, 592(%rsp)
	movl	$858993459, 588(%rsp)
	movl	$50529027, 584(%rsp)
	movl	$252645135, 544(%rsp)
	vpbroadcastd	592(%rsp), %ymm0
	vpbroadcastd	588(%rsp), %ymm1
	vpbroadcastd	584(%rsp), %ymm2
	vpbroadcastd	544(%rsp), %ymm3
	vmovdqu	(%rax), %ymm9
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
	vmovdqu	%ymm9, (%r9)
	vmovdqu	%ymm11, 32(%r9)
	vmovdqu	%ymm10, 64(%r9)
	vmovdqu	%ymm4, 96(%r9)
	vmovdqu	32(%rax), %ymm9
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
	vmovdqu	%ymm9, 128(%r9)
	vmovdqu	%ymm11, 160(%r9)
	vmovdqu	%ymm10, 192(%r9)
	vmovdqu	%ymm4, 224(%r9)
	vmovdqu	64(%rax), %ymm9
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
	vmovdqu	%ymm9, 256(%r9)
	vmovdqu	%ymm11, 288(%r9)
	vmovdqu	%ymm10, 320(%r9)
	vmovdqu	%ymm4, 352(%r9)
	vmovdqu	96(%rax), %ymm9
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
	vmovdqu	%ymm3, 384(%r9)
	vmovdqu	%ymm11, 416(%r9)
	vmovdqu	%ymm10, 448(%r9)
	vmovdqu	%ymm4, 480(%r9)
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
	vmovdqu	%ymm9, (%r10)
	vmovdqu	%ymm11, 32(%r10)
	vmovdqu	%ymm10, 64(%r10)
	vmovdqu	%ymm4, 96(%r10)
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
	vmovdqu	%ymm9, 128(%r10)
	vmovdqu	%ymm11, 160(%r10)
	vmovdqu	%ymm10, 192(%r10)
	vmovdqu	%ymm4, 224(%r10)
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
	vmovdqu	%ymm9, 256(%r10)
	vmovdqu	%ymm11, 288(%r10)
	vmovdqu	%ymm10, 320(%r10)
	vmovdqu	%ymm4, 352(%r10)
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
	vmovdqu	%ymm3, 384(%r10)
	vmovdqu	%ymm11, 416(%r10)
	vmovdqu	%ymm10, 448(%r10)
	vmovdqu	%ymm4, 480(%r10)
	movl	$1431655765, 592(%rsp)
	movl	$858993459, 588(%rsp)
	movl	$50529027, 584(%rsp)
	movl	$252645135, 544(%rsp)
	vpbroadcastd	592(%rsp), %ymm0
	vpbroadcastd	588(%rsp), %ymm1
	vpbroadcastd	584(%rsp), %ymm2
	vpbroadcastd	544(%rsp), %ymm3
	vmovdqu	(%rdi), %ymm9
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
	vmovdqu	%ymm9, (%r11)
	vmovdqu	%ymm11, 32(%r11)
	vmovdqu	%ymm10, 64(%r11)
	vmovdqu	%ymm4, 96(%r11)
	vmovdqu	32(%rdi), %ymm9
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
	vmovdqu	%ymm9, 128(%r11)
	vmovdqu	%ymm11, 160(%r11)
	vmovdqu	%ymm10, 192(%r11)
	vmovdqu	%ymm4, 224(%r11)
	vmovdqu	64(%rdi), %ymm9
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
	vmovdqu	%ymm9, 256(%r11)
	vmovdqu	%ymm11, 288(%r11)
	vmovdqu	%ymm10, 320(%r11)
	vmovdqu	%ymm4, 352(%r11)
	vmovdqu	96(%rdi), %ymm9
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
	vmovdqu	%ymm3, 384(%r11)
	vmovdqu	%ymm11, 416(%r11)
	vmovdqu	%ymm10, 448(%r11)
	vmovdqu	%ymm4, 480(%r11)
	ret
L_poly_getnoise_eta2$1:
	movq	%rcx, %mm0
	movb	%al, 176(%rsp)
	leaq	32(%rsp), %rdi
	leaq	176(%rsp), %rax
	leaq	-248(%rsp), %rsp
	call	L_shake256_A128__A32_A1$1
L_poly_getnoise_eta2$2:
	leaq	248(%rsp), %rsp
	movq	%mm0, %rax
	leaq	32(%rsp), %rdx
	movl	$1431655765, 160(%rsp)
	movl	$858993459, 164(%rsp)
	movl	$50529027, 168(%rsp)
	movl	$252645135, 172(%rsp)
	vpbroadcastd	160(%rsp), %ymm0
	vpbroadcastd	164(%rsp), %ymm1
	vpbroadcastd	168(%rsp), %ymm2
	vpbroadcastd	172(%rsp), %ymm3
	vmovdqu	(%rdx), %ymm9
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
	vmovdqu	32(%rdx), %ymm9
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
	vmovdqu	64(%rdx), %ymm9
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
	vmovdqu	96(%rdx), %ymm9
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
	vmovdqu	glob_data + 608(%rip), %ymm0
	vbroadcasti128	glob_data + 2448(%rip), %ymm4
	vbroadcasti128	glob_data + 2432(%rip), %ymm1
	vmovdqu	(%rcx), %ymm2
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
	vmovdqu	%ymm5, (%rax)
	vmovdqu	%ymm8, 32(%rax)
	vmovdqu	%ymm7, 256(%rax)
	vmovdqu	%ymm3, 288(%rax)
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
	vmovdqu	%ymm6, 64(%rax)
	vmovdqu	%ymm8, 96(%rax)
	vmovdqu	%ymm7, 320(%rax)
	vmovdqu	%ymm3, 352(%rax)
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
	vmovdqu	%ymm6, 128(%rax)
	vmovdqu	%ymm8, 160(%rax)
	vmovdqu	%ymm7, 384(%rax)
	vmovdqu	%ymm3, 416(%rax)
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
	vmovdqu	%ymm6, 192(%rax)
	vmovdqu	%ymm8, 224(%rax)
	vmovdqu	%ymm7, 448(%rax)
	vmovdqu	%ymm3, 480(%rax)
	ret
L_poly_frommont$1:
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 768(%rip), %ymm1
	vmovdqu	glob_data + 512(%rip), %ymm2
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
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, 224(%rax)
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
	vmovdqu	glob_data + 640(%rip), %ymm0
	vmovdqu	(%rdi), %ymm2
	vmovdqu	32(%rdi), %ymm3
	vmovdqu	64(%rdi), %ymm4
	vmovdqu	96(%rdi), %ymm1
	vmovdqu	128(%rdi), %ymm5
	vmovdqu	160(%rdi), %ymm6
	vperm2i128	$32, %ymm1, %ymm2, %ymm7
	vperm2i128	$49, %ymm1, %ymm2, %ymm9
	vperm2i128	$32, %ymm5, %ymm3, %ymm10
	vperm2i128	$49, %ymm5, %ymm3, %ymm1
	vperm2i128	$32, %ymm6, %ymm4, %ymm3
	vperm2i128	$49, %ymm6, %ymm4, %ymm5
	vpunpcklqdq	%ymm1, %ymm7, %ymm4
	vpunpckhqdq	%ymm1, %ymm7, %ymm2
	vpunpcklqdq	%ymm3, %ymm9, %ymm1
	vpunpckhqdq	%ymm3, %ymm9, %ymm3
	vpunpcklqdq	%ymm5, %ymm10, %ymm7
	vpunpckhqdq	%ymm5, %ymm10, %ymm5
	vmovsldup	%ymm3, %ymm6
	vpblendd	$170, %ymm6, %ymm4, %ymm6
	vpsrlq	$32, %ymm4, %ymm4
	vpblendd	$170, %ymm3, %ymm4, %ymm3
	vmovsldup	%ymm7, %ymm11
	vpblendd	$170, %ymm11, %ymm2, %ymm4
	vpsrlq	$32, %ymm2, %ymm2
	vpblendd	$170, %ymm7, %ymm2, %ymm10
	vmovsldup	%ymm5, %ymm2
	vpblendd	$170, %ymm2, %ymm1, %ymm2
	vpsrlq	$32, %ymm1, %ymm7
	vpblendd	$170, %ymm5, %ymm7, %ymm1
	vpslld	$16, %ymm10, %ymm11
	vpblendw	$170, %ymm11, %ymm6, %ymm5
	vpsrld	$16, %ymm6, %ymm7
	vpblendw	$170, %ymm10, %ymm7, %ymm10
	vpslld	$16, %ymm2, %ymm6
	vpblendw	$170, %ymm6, %ymm3, %ymm6
	vpsrld	$16, %ymm3, %ymm3
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
	vpsrlw	$4, %ymm1, %ymm1
	vpand	%ymm1, %ymm0, %ymm1
	vmovdqu	%ymm2, (%rsi)
	vmovdqu	%ymm12, 32(%rsi)
	vmovdqu	%ymm4, 64(%rsi)
	vmovdqu	%ymm5, 96(%rsi)
	vmovdqu	%ymm3, 128(%rsi)
	vmovdqu	%ymm6, 160(%rsi)
	vmovdqu	%ymm8, 192(%rsi)
	vmovdqu	%ymm1, 224(%rsi)
	vmovdqu	192(%rdi), %ymm2
	vmovdqu	224(%rdi), %ymm3
	vmovdqu	256(%rdi), %ymm4
	vmovdqu	288(%rdi), %ymm1
	vmovdqu	320(%rdi), %ymm5
	vmovdqu	352(%rdi), %ymm6
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
	vpunpcklqdq	%ymm6, %ymm10, %ymm8
	vpunpckhqdq	%ymm6, %ymm10, %ymm1
	vmovsldup	%ymm5, %ymm6
	vpblendd	$170, %ymm6, %ymm11, %ymm4
	vpsrlq	$32, %ymm11, %ymm7
	vpblendd	$170, %ymm5, %ymm7, %ymm7
	vmovsldup	%ymm8, %ymm6
	vpblendd	$170, %ymm6, %ymm2, %ymm5
	vpsrlq	$32, %ymm2, %ymm2
	vpblendd	$170, %ymm8, %ymm2, %ymm6
	vmovsldup	%ymm1, %ymm2
	vpblendd	$170, %ymm2, %ymm3, %ymm10
	vpsrlq	$32, %ymm3, %ymm2
	vpblendd	$170, %ymm1, %ymm2, %ymm1
	vpslld	$16, %ymm6, %ymm2
	vpblendw	$170, %ymm2, %ymm4, %ymm2
	vpsrld	$16, %ymm4, %ymm3
	vpblendw	$170, %ymm6, %ymm3, %ymm14
	vpslld	$16, %ymm10, %ymm6
	vpblendw	$170, %ymm6, %ymm7, %ymm6
	vpsrld	$16, %ymm7, %ymm3
	vpblendw	$170, %ymm10, %ymm3, %ymm3
	vpslld	$16, %ymm1, %ymm11
	vpblendw	$170, %ymm11, %ymm5, %ymm7
	vpsrld	$16, %ymm5, %ymm8
	vpblendw	$170, %ymm1, %ymm8, %ymm1
	vpsrlw	$12, %ymm2, %ymm12
	vpsllw	$4, %ymm14, %ymm4
	vpor	%ymm4, %ymm12, %ymm12
	vpand	%ymm2, %ymm0, %ymm2
	vpand	%ymm12, %ymm0, %ymm12
	vpsrlw	$8, %ymm14, %ymm4
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
	vpsrlw	$4, %ymm1, %ymm1
	vpand	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, 256(%rsi)
	vmovdqu	%ymm12, 288(%rsi)
	vmovdqu	%ymm4, 320(%rsi)
	vmovdqu	%ymm5, 352(%rsi)
	vmovdqu	%ymm3, 384(%rsi)
	vmovdqu	%ymm6, 416(%rsi)
	vmovdqu	%ymm8, 448(%rsi)
	vmovdqu	%ymm0, 480(%rsi)
	ret
L_poly_basemul$1:
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	glob_data + 768(%rip), %ymm1
	vmovdqu	glob_data + 1904(%rip), %ymm2
	vmovdqu	glob_data + 1936(%rip), %ymm3
	vmovdqu	(%rsi), %ymm4
	vmovdqu	32(%rsi), %ymm5
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
	vmovdqu	%ymm5, (%rax)
	vmovdqu	%ymm4, 32(%rax)
	vmovdqu	64(%rsi), %ymm4
	vmovdqu	96(%rsi), %ymm5
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
	vpackusdw	%ymm3, %ymm2, %ymm2
	vpsrld	$16, %ymm7, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpackusdw	%ymm8, %ymm7, %ymm3
	vpblendw	$170, %ymm9, %ymm5, %ymm7
	vpblendw	$170, %ymm9, %ymm4, %ymm6
	vpackusdw	%ymm6, %ymm7, %ymm9
	vpsrld	$16, %ymm5, %ymm5
	vpsrld	$16, %ymm4, %ymm4
	vpackusdw	%ymm4, %ymm5, %ymm4
	vpmullw	%ymm1, %ymm2, %ymm5
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm3, %ymm5
	vpmullw	%ymm1, %ymm9, %ymm6
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm4, %ymm4
	vmovdqu	%ymm5, 64(%rax)
	vmovdqu	%ymm4, 96(%rax)
	vmovdqu	glob_data + 1968(%rip), %ymm2
	vmovdqu	glob_data + 2000(%rip), %ymm3
	vmovdqu	128(%rsi), %ymm4
	vmovdqu	160(%rsi), %ymm5
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
	vmovdqu	%ymm5, 128(%rax)
	vmovdqu	%ymm4, 160(%rax)
	vmovdqu	192(%rsi), %ymm4
	vmovdqu	224(%rsi), %ymm5
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
	vmovdqu	%ymm5, 192(%rax)
	vmovdqu	%ymm4, 224(%rax)
	vmovdqu	glob_data + 2296(%rip), %ymm2
	vmovdqu	glob_data + 2328(%rip), %ymm3
	vmovdqu	256(%rsi), %ymm4
	vmovdqu	288(%rsi), %ymm5
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
	vmovdqu	%ymm5, 256(%rax)
	vmovdqu	%ymm4, 288(%rax)
	vmovdqu	320(%rsi), %ymm4
	vmovdqu	352(%rsi), %ymm5
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
	vmovdqu	%ymm5, 320(%rax)
	vmovdqu	%ymm4, 352(%rax)
	vmovdqu	glob_data + 2360(%rip), %ymm2
	vmovdqu	glob_data + 2392(%rip), %ymm3
	vmovdqu	384(%rsi), %ymm4
	vmovdqu	416(%rsi), %ymm5
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
	vmovdqu	%ymm5, 384(%rax)
	vmovdqu	%ymm4, 416(%rax)
	vmovdqu	448(%rsi), %ymm4
	vmovdqu	480(%rsi), %ymm5
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
	vmovdqu	%ymm5, 448(%rax)
	vmovdqu	%ymm4, 480(%rax)
	ret
L_poly_csubq$1:
	vmovdqu	glob_data + 800(%rip), %ymm0
	vmovdqu	(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, (%rax)
	vmovdqu	32(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 32(%rax)
	vmovdqu	64(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 64(%rax)
	vmovdqu	96(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 96(%rax)
	vmovdqu	128(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 128(%rax)
	vmovdqu	160(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 160(%rax)
	vmovdqu	192(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 192(%rax)
	vmovdqu	224(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 224(%rax)
	vmovdqu	256(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 256(%rax)
	vmovdqu	288(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 288(%rax)
	vmovdqu	320(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 320(%rax)
	vmovdqu	352(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 352(%rax)
	vmovdqu	384(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 384(%rax)
	vmovdqu	416(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 416(%rax)
	vmovdqu	448(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 448(%rax)
	vmovdqu	480(%rax), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	ret
L_poly_add2$1:
	vmovdqu	(%rax), %ymm2
	vmovdqu	(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, (%rax)
	vmovdqu	32(%rax), %ymm2
	vmovdqu	32(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vmovdqu	64(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vmovdqu	96(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vmovdqu	128(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vmovdqu	160(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vmovdqu	192(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vmovdqu	224(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vmovdqu	256(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vmovdqu	288(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vmovdqu	320(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vmovdqu	352(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vmovdqu	384(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vmovdqu	416(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vmovdqu	448(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vmovdqu	480(%rdi), %ymm1
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 480(%rax)
	ret
L_shake256_A32__A1600$1:
	movq	%rdi, 232(%rsp)
	leaq	32(%rsp), %rax
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	%ymm0, 96(%rax)
	vmovdqu	%ymm0, 128(%rax)
	vmovdqu	%ymm0, 160(%rax)
	movq	$0, 192(%rax)
	leaq	32(%rsp), %rax
	movq	$0, %r12
	vmovdqu	(%rbx,%r12), %ymm0
	vpxor	(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	32(%rbx,%r12), %ymm0
	vpxor	32(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	64(%rbx,%r12), %ymm0
	vpxor	64(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	96(%rbx,%r12), %ymm0
	vpxor	96(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 96(%rax)
	movq	128(%rbx,%r12), %rcx
	xorq	%rcx, 128(%rax)
	addq	$136, %r12
	movq	%rbx, 240(%rsp)
	movq	%r12, 248(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_shake256_A32__A1600$9:
	leaq	200(%rsp), %rsp
	movq	240(%rsp), %rdx
	movq	248(%rsp), %r12
	movq	$0, %rbx
	jmp 	L_shake256_A32__A1600$6
L_shake256_A32__A1600$7:
	vmovdqu	(%rdx,%r12), %ymm0
	vpxor	(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	32(%rdx,%r12), %ymm0
	vpxor	32(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	64(%rdx,%r12), %ymm0
	vpxor	64(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	96(%rdx,%r12), %ymm0
	vpxor	96(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 96(%rax)
	movq	128(%rdx,%r12), %rcx
	xorq	%rcx, 128(%rax)
	addq	$136, %r12
	movq	%rdx, 248(%rsp)
	movq	%r12, 240(%rsp)
	movq	%rbx, 256(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_shake256_A32__A1600$8:
	leaq	200(%rsp), %rsp
	movq	248(%rsp), %rdx
	movq	240(%rsp), %r12
	movq	256(%rsp), %rbx
	incq	%rbx
L_shake256_A32__A1600$6:
	cmpq	$10, %rbx
	jb  	L_shake256_A32__A1600$7
	vmovdqu	(%rdx,%r12), %ymm0
	vpxor	(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	32(%rdx,%r12), %ymm0
	vpxor	32(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	64(%rdx,%r12), %ymm0
	vpxor	64(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 64(%rax)
	movq	96(%rdx,%r12), %rcx
	xorq	%rcx, 96(%rax)
	movq	$0, %rcx
	movq	$31, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
	xorq	%rcx, 104(%rax)
	xorb	$128, 135(%rax)
	movq	232(%rsp), %rdx
	leaq	32(%rsp), %rax
	movq	$0, %r12
	movq	$0, %rbx
	jmp 	L_shake256_A32__A1600$3
L_shake256_A32__A1600$4:
	incq	%rbx
	movq	%rdx, 232(%rsp)
	movq	%r12, 256(%rsp)
	movq	%rbx, 240(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_shake256_A32__A1600$5:
	leaq	200(%rsp), %rsp
	movq	232(%rsp), %rdx
	movq	256(%rsp), %r12
	movq	240(%rsp), %rbx
	vmovdqu	(%rax), %ymm0
	vmovdqu	%ymm0, (%rdx,%r12)
	vmovdqu	32(%rax), %ymm0
	vmovdqu	%ymm0, 32(%rdx,%r12)
	vmovdqu	64(%rax), %ymm0
	vmovdqu	%ymm0, 64(%rdx,%r12)
	vmovdqu	96(%rax), %ymm0
	vmovdqu	%ymm0, 96(%rdx,%r12)
	movq	128(%rax), %rcx
	movq	%rcx, 128(%rdx,%r12)
	addq	$136, %r12
L_shake256_A32__A1600$3:
	cmpq	$0, %rbx
	jb  	L_shake256_A32__A1600$4
	movq	%rdx, 240(%rsp)
	movq	%r12, 256(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_shake256_A32__A1600$2:
	leaq	200(%rsp), %rsp
	movq	240(%rsp), %rdi
	movq	256(%rsp), %r12
	vmovdqu	(%rax), %ymm0
	vmovdqu	%ymm0, (%rdi,%r12)
	ret
L_sha3_256A_A1568$1:
	movq	%rdi, %mm2
	leaq	32(%rsp), %rax
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	%ymm0, 96(%rax)
	vmovdqu	%ymm0, 128(%rax)
	vmovdqu	%ymm0, 160(%rax)
	movq	$0, 192(%rax)
	leaq	32(%rsp), %rax
	movq	$0, %r12
	vmovdqu	(%rbx,%r12), %ymm0
	vpxor	(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	32(%rbx,%r12), %ymm0
	vpxor	32(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	64(%rbx,%r12), %ymm0
	vpxor	64(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	96(%rbx,%r12), %ymm0
	vpxor	96(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 96(%rax)
	movq	128(%rbx,%r12), %rcx
	xorq	%rcx, 128(%rax)
	addq	$136, %r12
	movq	%rbx, 232(%rsp)
	movq	%r12, 240(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_sha3_256A_A1568$9:
	leaq	200(%rsp), %rsp
	movq	232(%rsp), %rdx
	movq	240(%rsp), %r12
	movq	$0, %rbx
	jmp 	L_sha3_256A_A1568$6
L_sha3_256A_A1568$7:
	vmovdqu	(%rdx,%r12), %ymm0
	vpxor	(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	32(%rdx,%r12), %ymm0
	vpxor	32(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	64(%rdx,%r12), %ymm0
	vpxor	64(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	96(%rdx,%r12), %ymm0
	vpxor	96(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 96(%rax)
	movq	128(%rdx,%r12), %rcx
	xorq	%rcx, 128(%rax)
	addq	$136, %r12
	movq	%rdx, 240(%rsp)
	movq	%r12, 232(%rsp)
	movq	%rbx, 248(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_sha3_256A_A1568$8:
	leaq	200(%rsp), %rsp
	movq	240(%rsp), %rdx
	movq	232(%rsp), %r12
	movq	248(%rsp), %rbx
	incq	%rbx
L_sha3_256A_A1568$6:
	cmpq	$10, %rbx
	jb  	L_sha3_256A_A1568$7
	vmovdqu	(%rdx,%r12), %ymm0
	vpxor	(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	32(%rdx,%r12), %ymm0
	vpxor	32(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rax)
	movq	64(%rdx,%r12), %rcx
	xorq	%rcx, 64(%rax)
	movq	$0, %rcx
	movq	$6, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
	xorq	%rcx, 72(%rax)
	xorb	$128, 135(%rax)
	movq	%mm2, %rdx
	leaq	32(%rsp), %rax
	movq	$0, %r12
	movq	$0, %rbx
	jmp 	L_sha3_256A_A1568$3
L_sha3_256A_A1568$4:
	incq	%rbx
	movq	%rdx, 248(%rsp)
	movq	%r12, 232(%rsp)
	movq	%rbx, 240(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_sha3_256A_A1568$5:
	leaq	200(%rsp), %rsp
	movq	248(%rsp), %rdx
	movq	232(%rsp), %r12
	movq	240(%rsp), %rbx
	vmovdqu	(%rax), %ymm0
	vmovdqu	%ymm0, (%rdx,%r12)
	vmovdqu	32(%rax), %ymm0
	vmovdqu	%ymm0, 32(%rdx,%r12)
	vmovdqu	64(%rax), %ymm0
	vmovdqu	%ymm0, 64(%rdx,%r12)
	vmovdqu	96(%rax), %ymm0
	vmovdqu	%ymm0, 96(%rdx,%r12)
	movq	128(%rax), %rcx
	movq	%rcx, 128(%rdx,%r12)
	addq	$136, %r12
L_sha3_256A_A1568$3:
	cmpq	$0, %rbx
	jb  	L_sha3_256A_A1568$4
	movq	%rdx, 240(%rsp)
	movq	%r12, 232(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_sha3_256A_A1568$2:
	leaq	200(%rsp), %rsp
	movq	240(%rsp), %rdi
	movq	232(%rsp), %r12
	vmovdqu	(%rax), %ymm0
	vmovdqu	%ymm0, (%rdi,%r12)
	ret
L_shake128x4_squeeze3blocks$1:
	movq	%rdx, %rsi
	leaq	536(%rdx), %rdi
	leaq	1072(%rdx), %r8
	leaq	1608(%rdx), %rbp
	movq	$0, %r12
	call	L_keccakf1600_avx2x4_nat$1
L_shake128x4_squeeze3blocks$16:
	movq	$0, %rbx
	jmp 	L_shake128x4_squeeze3blocks$14
L_shake128x4_squeeze3blocks$15:
	vmovdqu	(%rcx,%rbx,4), %ymm9
	vmovdqu	32(%rcx,%rbx,4), %ymm11
	vmovdqu	64(%rcx,%rbx,4), %ymm3
	vmovdqu	96(%rcx,%rbx,4), %ymm14
	addq	$32, %rbx
	vperm2i128	$32, %ymm3, %ymm9, %ymm2
	vperm2i128	$32, %ymm14, %ymm11, %ymm0
	vperm2i128	$49, %ymm3, %ymm9, %ymm1
	vperm2i128	$49, %ymm14, %ymm11, %ymm3
	vpunpcklqdq	%ymm0, %ymm2, %ymm4
	vpunpckhqdq	%ymm0, %ymm2, %ymm0
	vpunpcklqdq	%ymm3, %ymm1, %ymm2
	vpunpckhqdq	%ymm3, %ymm1, %ymm3
	vmovdqu	%ymm4, (%rsi,%r12)
	vmovdqu	%ymm0, (%rdi,%r12)
	vmovdqu	%ymm2, (%r8,%r12)
	vmovdqu	%ymm3, (%rbp,%r12)
	addq	$32, %r12
L_shake128x4_squeeze3blocks$14:
	cmpq	$160, %rbx
	jb  	L_shake128x4_squeeze3blocks$15
	jmp 	L_shake128x4_squeeze3blocks$12
L_shake128x4_squeeze3blocks$13:
	movq	(%rcx,%rbx,4), %r9
	movq	%r9, (%rsi,%r12)
	movq	8(%rcx,%rbx,4), %r9
	movq	%r9, (%rdi,%r12)
	movq	16(%rcx,%rbx,4), %r9
	movq	%r9, (%r8,%r12)
	movq	24(%rcx,%rbx,4), %r9
	movq	%r9, (%rbp,%r12)
	addq	$8, %rbx
	addq	$8, %r12
L_shake128x4_squeeze3blocks$12:
	cmpq	$168, %rbx
	jb  	L_shake128x4_squeeze3blocks$13
	call	L_keccakf1600_avx2x4_nat$1
L_shake128x4_squeeze3blocks$11:
	movq	$0, %rbx
	jmp 	L_shake128x4_squeeze3blocks$9
L_shake128x4_squeeze3blocks$10:
	vmovdqu	(%rcx,%rbx,4), %ymm9
	vmovdqu	32(%rcx,%rbx,4), %ymm11
	vmovdqu	64(%rcx,%rbx,4), %ymm3
	vmovdqu	96(%rcx,%rbx,4), %ymm14
	addq	$32, %rbx
	vperm2i128	$32, %ymm3, %ymm9, %ymm2
	vperm2i128	$32, %ymm14, %ymm11, %ymm0
	vperm2i128	$49, %ymm3, %ymm9, %ymm1
	vperm2i128	$49, %ymm14, %ymm11, %ymm3
	vpunpcklqdq	%ymm0, %ymm2, %ymm4
	vpunpckhqdq	%ymm0, %ymm2, %ymm0
	vpunpcklqdq	%ymm3, %ymm1, %ymm2
	vpunpckhqdq	%ymm3, %ymm1, %ymm3
	vmovdqu	%ymm4, (%rsi,%r12)
	vmovdqu	%ymm0, (%rdi,%r12)
	vmovdqu	%ymm2, (%r8,%r12)
	vmovdqu	%ymm3, (%rbp,%r12)
	addq	$32, %r12
L_shake128x4_squeeze3blocks$9:
	cmpq	$160, %rbx
	jb  	L_shake128x4_squeeze3blocks$10
	jmp 	L_shake128x4_squeeze3blocks$7
L_shake128x4_squeeze3blocks$8:
	movq	(%rcx,%rbx,4), %r9
	movq	%r9, (%rsi,%r12)
	movq	8(%rcx,%rbx,4), %r9
	movq	%r9, (%rdi,%r12)
	movq	16(%rcx,%rbx,4), %r9
	movq	%r9, (%r8,%r12)
	movq	24(%rcx,%rbx,4), %r9
	movq	%r9, (%rbp,%r12)
	addq	$8, %rbx
	addq	$8, %r12
L_shake128x4_squeeze3blocks$7:
	cmpq	$168, %rbx
	jb  	L_shake128x4_squeeze3blocks$8
	call	L_keccakf1600_avx2x4_nat$1
L_shake128x4_squeeze3blocks$6:
	movq	$0, %rbx
	jmp 	L_shake128x4_squeeze3blocks$4
L_shake128x4_squeeze3blocks$5:
	vmovdqu	(%rcx,%rbx,4), %ymm9
	vmovdqu	32(%rcx,%rbx,4), %ymm11
	vmovdqu	64(%rcx,%rbx,4), %ymm3
	vmovdqu	96(%rcx,%rbx,4), %ymm0
	addq	$32, %rbx
	vperm2i128	$32, %ymm3, %ymm9, %ymm2
	vperm2i128	$32, %ymm0, %ymm11, %ymm1
	vperm2i128	$49, %ymm3, %ymm9, %ymm3
	vperm2i128	$49, %ymm0, %ymm11, %ymm0
	vpunpcklqdq	%ymm1, %ymm2, %ymm4
	vpunpckhqdq	%ymm1, %ymm2, %ymm1
	vpunpcklqdq	%ymm0, %ymm3, %ymm2
	vpunpckhqdq	%ymm0, %ymm3, %ymm0
	vmovdqu	%ymm4, (%rsi,%r12)
	vmovdqu	%ymm1, (%rdi,%r12)
	vmovdqu	%ymm2, (%r8,%r12)
	vmovdqu	%ymm0, (%rbp,%r12)
	addq	$32, %r12
L_shake128x4_squeeze3blocks$4:
	cmpq	$192, %rbx
	jb  	L_shake128x4_squeeze3blocks$5
	jmp 	L_shake128x4_squeeze3blocks$2
L_shake128x4_squeeze3blocks$3:
	movq	(%rcx,%rbx,4), %r9
	movq	%r9, (%rsi,%r12)
	movq	8(%rcx,%rbx,4), %r9
	movq	%r9, (%rdi,%r12)
	movq	16(%rcx,%rbx,4), %r9
	movq	%r9, (%r8,%r12)
	movq	24(%rcx,%rbx,4), %r9
	movq	%r9, (%rbp,%r12)
	addq	$8, %rbx
	addq	$8, %r12
L_shake128x4_squeeze3blocks$2:
	cmpq	$200, %rbx
	jb  	L_shake128x4_squeeze3blocks$3
	ret
L_shake128_next_state$1:
	movq	%r10, 8(%rsp)
	leaq	336(%r10), %rax
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_shake128_next_state$2:
	leaq	200(%rsp), %rsp
	movq	8(%rsp), %r10
	ret
L_shake128x4_absorb_A32_A2$1:
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %rbx
	jmp 	L_shake128x4_absorb_A32_A2$6
L_shake128x4_absorb_A32_A2$7:
	vmovdqu	%ymm0, (%rcx,%rbx)
	addq	$32, %rbx
L_shake128x4_absorb_A32_A2$6:
	cmpq	$800, %rbx
	jb  	L_shake128x4_absorb_A32_A2$7
	movq	$0, %r12
	movq	$0, %rbp
	jmp 	L_shake128x4_absorb_A32_A2$4
L_shake128x4_absorb_A32_A2$5:
	vpbroadcastq	(%r8,%r12), %ymm0
	addq	$8, %r12
	vpxor	(%rcx,%rbp), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rcx,%rbp)
	addq	$32, %rbp
L_shake128x4_absorb_A32_A2$4:
	cmpq	$128, %rbp
	jb  	L_shake128x4_absorb_A32_A2$5
	movq	%r9, %rdi
	leaq	2(%r9), %r10
	leaq	4(%r9), %rsi
	leaq	6(%r9), %r8
	movq	$0, %r12
	movq	$16, %r9
	jmp 	L_shake128x4_absorb_A32_A2$2
L_shake128x4_absorb_A32_A2$3:
	movq	(%rdi,%r12), %r11
	xorq	%r11, (%rcx,%r9,8)
	movq	(%r10,%r12), %r11
	xorq	%r11, 8(%rcx,%r9,8)
	movq	(%rsi,%r12), %r11
	xorq	%r11, 16(%rcx,%r9,8)
	movq	(%r8,%r12), %r11
	addq	$8, %r12
	xorq	%r11, 24(%rcx,%r9,8)
	addq	$4, %r9
L_shake128x4_absorb_A32_A2$2:
	cmpq	$16, %r9
	jb  	L_shake128x4_absorb_A32_A2$3
	movq	$0, %r11
	movzwq	(%rdi,%r12), %rdi
	orq 	%rdi, %r11
	movq	$31, %rdi
	shlq	$16, %rdi
	orq 	%rdi, %r11
	xorq	%r11, (%rcx,%r9,8)
	movq	$0, %r11
	movzwq	(%r10,%r12), %rdi
	orq 	%rdi, %r11
	movq	$31, %rdi
	shlq	$16, %rdi
	orq 	%rdi, %r11
	xorq	%r11, 8(%rcx,%r9,8)
	movq	$0, %r11
	movzwq	(%rsi,%r12), %rdi
	orq 	%rdi, %r11
	movq	$31, %rdi
	shlq	$16, %rdi
	orq 	%rdi, %r11
	xorq	%r11, 16(%rcx,%r9,8)
	movq	$0, %r11
	movzwq	(%r8,%r12), %rsi
	orq 	%rsi, %r11
	movq	$31, %rdi
	shlq	$16, %rdi
	orq 	%rdi, %r11
	xorq	%r11, 24(%rcx,%r9,8)
	movq	$-9223372036854775808, %rsi
	movq	%rsi, 8(%rsp)
	vpbroadcastq	8(%rsp), %ymm0
	vpxor	640(%rcx), %ymm0, %ymm0
	vmovdqu	%ymm0, 640(%rcx)
	ret
L_shake256x4_A128__A32_A1$1:
	leaq	32(%rsp), %rcx
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %r9
	jmp 	L_shake256x4_A128__A32_A1$11
L_shake256x4_A128__A32_A1$12:
	vmovdqu	%ymm0, (%rcx,%r9)
	addq	$32, %r9
L_shake256x4_A128__A32_A1$11:
	cmpq	$800, %r9
	jb  	L_shake256x4_A128__A32_A1$12
	movq	$0, %r12
	movq	$0, %r9
	jmp 	L_shake256x4_A128__A32_A1$9
L_shake256x4_A128__A32_A1$10:
	vpbroadcastq	(%r8,%r12), %ymm0
	addq	$8, %r12
	vpxor	(%rcx,%r9), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rcx,%r9)
	addq	$32, %r9
L_shake256x4_A128__A32_A1$9:
	cmpq	$128, %r9
	jb  	L_shake256x4_A128__A32_A1$10
	movq	%rbx, %r10
	leaq	1(%rbx), %r9
	leaq	2(%rbx), %r11
	leaq	3(%rbx), %rbx
	movq	$0, %r12
	movq	$16, %rbp
	jmp 	L_shake256x4_A128__A32_A1$7
L_shake256x4_A128__A32_A1$8:
	movq	(%r10,%r12), %r13
	xorq	%r13, (%rcx,%rbp,8)
	movq	(%r9,%r12), %r13
	xorq	%r13, 8(%rcx,%rbp,8)
	movq	(%r11,%r12), %r13
	xorq	%r13, 16(%rcx,%rbp,8)
	movq	(%rbx,%r12), %r13
	addq	$8, %r12
	xorq	%r13, 24(%rcx,%rbp,8)
	addq	$4, %rbp
L_shake256x4_A128__A32_A1$7:
	cmpq	$16, %rbp
	jb  	L_shake256x4_A128__A32_A1$8
	movq	$0, %r13
	movzbq	(%r10,%r12), %r10
	orq 	%r10, %r13
	movq	$31, %r10
	shlq	$8, %r10
	orq 	%r10, %r13
	xorq	%r13, (%rcx,%rbp,8)
	movq	$0, %r13
	movzbq	(%r9,%r12), %r10
	orq 	%r10, %r13
	movq	$31, %r10
	shlq	$8, %r10
	orq 	%r10, %r13
	xorq	%r13, 8(%rcx,%rbp,8)
	movq	$0, %r13
	movzbq	(%r11,%r12), %r10
	orq 	%r10, %r13
	movq	$31, %r10
	shlq	$8, %r10
	orq 	%r10, %r13
	xorq	%r13, 16(%rcx,%rbp,8)
	movq	$0, %r11
	movzbq	(%rbx,%r12), %r10
	orq 	%r10, %r11
	movq	$31, %r10
	shlq	$8, %r10
	orq 	%r10, %r11
	xorq	%r11, 24(%rcx,%rbp,8)
	movq	$-9223372036854775808, %r9
	movq	%r9, 832(%rsp)
	vpbroadcastq	832(%rsp), %ymm0
	vpxor	512(%rcx), %ymm0, %ymm0
	vmovdqu	%ymm0, 512(%rcx)
	movq	$0, %r12
	call	L_keccakf1600_avx2x4_nat$1
L_shake256x4_A128__A32_A1$6:
	movq	$0, %r9
	jmp 	L_shake256x4_A128__A32_A1$4
L_shake256x4_A128__A32_A1$5:
	vmovdqu	(%rcx,%r9,4), %ymm9
	vmovdqu	32(%rcx,%r9,4), %ymm11
	vmovdqu	64(%rcx,%r9,4), %ymm3
	vmovdqu	96(%rcx,%r9,4), %ymm14
	addq	$32, %r9
	vperm2i128	$32, %ymm3, %ymm9, %ymm2
	vperm2i128	$32, %ymm14, %ymm11, %ymm0
	vperm2i128	$49, %ymm3, %ymm9, %ymm1
	vperm2i128	$49, %ymm14, %ymm11, %ymm3
	vpunpcklqdq	%ymm0, %ymm2, %ymm4
	vpunpckhqdq	%ymm0, %ymm2, %ymm0
	vpunpcklqdq	%ymm3, %ymm1, %ymm2
	vpunpckhqdq	%ymm3, %ymm1, %ymm3
	vmovdqu	%ymm4, (%rdx,%r12)
	vmovdqu	%ymm0, (%rax,%r12)
	vmovdqu	%ymm2, (%rsi,%r12)
	vmovdqu	%ymm3, (%rdi,%r12)
	addq	$32, %r12
L_shake256x4_A128__A32_A1$4:
	cmpq	$128, %r9
	jb  	L_shake256x4_A128__A32_A1$5
	jmp 	L_shake256x4_A128__A32_A1$2
L_shake256x4_A128__A32_A1$3:
	movq	(%rcx,%r9,4), %r11
	movq	%r11, (%rdx,%r12)
	movq	8(%rcx,%r9,4), %r11
	movq	%r11, (%rax,%r12)
	movq	16(%rcx,%r9,4), %r11
	movq	%r11, (%rsi,%r12)
	movq	24(%rcx,%r9,4), %r11
	movq	%r11, (%rdi,%r12)
	addq	$8, %r9
	addq	$8, %r12
L_shake256x4_A128__A32_A1$2:
	cmpq	$128, %r9
	jb  	L_shake256x4_A128__A32_A1$3
	ret
L_shake256_A128__A32_A1$1:
	leaq	32(%rsp), %rcx
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rcx)
	vmovdqu	%ymm0, 32(%rcx)
	vmovdqu	%ymm0, 64(%rcx)
	vmovdqu	%ymm0, 96(%rcx)
	vmovdqu	%ymm0, 128(%rcx)
	vmovdqu	%ymm0, 160(%rcx)
	movq	$0, 192(%rcx)
	leaq	32(%rsp), %rcx
	movq	$0, %r12
	vmovdqu	(%r8,%r12), %ymm0
	vpxor	(%rcx), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rcx)
	leaq	32(%rsp), %rcx
	movq	$0, %r12
	movq	$0, %r11
	movzbq	(%rax,%r12), %rdx
	orq 	%rdx, %r11
	movq	$31, %rdx
	shlq	$8, %rdx
	orq 	%rdx, %r11
	xorq	%r11, 32(%rcx)
	xorb	$128, 135(%rcx)
	leaq	32(%rsp), %rax
	movq	$0, %r12
	movq	$0, %r9
	jmp 	L_shake256_A128__A32_A1$3
L_shake256_A128__A32_A1$4:
	incq	%r9
	movq	%rdi, 232(%rsp)
	movq	%r12, 240(%rsp)
	movq	%r9, 248(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_shake256_A128__A32_A1$5:
	leaq	200(%rsp), %rsp
	movq	232(%rsp), %rdi
	movq	240(%rsp), %r12
	movq	248(%rsp), %r9
	vmovdqu	(%rax), %ymm0
	vmovdqu	%ymm0, (%rdi,%r12)
	vmovdqu	32(%rax), %ymm0
	vmovdqu	%ymm0, 32(%rdi,%r12)
	vmovdqu	64(%rax), %ymm0
	vmovdqu	%ymm0, 64(%rdi,%r12)
	vmovdqu	96(%rax), %ymm0
	vmovdqu	%ymm0, 96(%rdi,%r12)
	movq	128(%rax), %rcx
	movq	%rcx, 128(%rdi,%r12)
	addq	$136, %r12
L_shake256_A128__A32_A1$3:
	cmpq	$0, %r9
	jb  	L_shake256_A128__A32_A1$4
	movq	%rdi, 248(%rsp)
	movq	%r12, 240(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_shake256_A128__A32_A1$2:
	leaq	200(%rsp), %rsp
	movq	248(%rsp), %rdi
	movq	240(%rsp), %r12
	vmovdqu	(%rax), %ymm0
	vmovdqu	%ymm0, (%rdi,%r12)
	vmovdqu	32(%rax), %ymm0
	vmovdqu	%ymm0, 32(%rdi,%r12)
	vmovdqu	64(%rax), %ymm0
	vmovdqu	%ymm0, 64(%rdi,%r12)
	vmovdqu	96(%rax), %ymm0
	vmovdqu	%ymm0, 96(%rdi,%r12)
	ret
L_sha3_512A_A64$1:
	movq	%rdi, 232(%rsp)
	leaq	32(%rsp), %rax
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	%ymm0, 96(%rax)
	vmovdqu	%ymm0, 128(%rax)
	vmovdqu	%ymm0, 160(%rax)
	movq	$0, 192(%rax)
	leaq	32(%rsp), %rax
	movq	$0, %r12
	vmovdqu	(%rbx,%r12), %ymm0
	vpxor	(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	32(%rbx,%r12), %ymm0
	vpxor	32(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rax)
	movq	$0, %rcx
	movq	$6, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
	xorq	%rcx, 64(%rax)
	xorb	$128, 71(%rax)
	movq	232(%rsp), %rdx
	leaq	32(%rsp), %rax
	movq	$0, %r12
	movq	$0, %r9
	jmp 	L_sha3_512A_A64$3
L_sha3_512A_A64$4:
	incq	%r9
	movq	%rdx, 232(%rsp)
	movq	%r12, 240(%rsp)
	movq	%r9, 248(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_sha3_512A_A64$5:
	leaq	200(%rsp), %rsp
	movq	232(%rsp), %rdx
	movq	240(%rsp), %r12
	movq	248(%rsp), %r9
	vmovdqu	(%rax), %ymm0
	vmovdqu	%ymm0, (%rdx,%r12)
	vmovdqu	32(%rax), %ymm0
	vmovdqu	%ymm0, 32(%rdx,%r12)
	movq	64(%rax), %rcx
	movq	%rcx, 64(%rdx,%r12)
	addq	$72, %r12
L_sha3_512A_A64$3:
	cmpq	$0, %r9
	jb  	L_sha3_512A_A64$4
	movq	%rdx, 248(%rsp)
	movq	%r12, 240(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_sha3_512A_A64$2:
	leaq	200(%rsp), %rsp
	movq	248(%rsp), %rdi
	movq	240(%rsp), %r12
	vmovdqu	(%rax), %ymm0
	vmovdqu	%ymm0, (%rdi,%r12)
	vmovdqu	32(%rax), %ymm0
	vmovdqu	%ymm0, 32(%rdi,%r12)
	ret
L_sha3_512A_A33$1:
	leaq	32(%rsp), %rax
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	%ymm0, 96(%rax)
	vmovdqu	%ymm0, 128(%rax)
	vmovdqu	%ymm0, 160(%rax)
	movq	$0, 192(%rax)
	leaq	32(%rsp), %rax
	movq	$0, %r12
	vmovdqu	(%rbx,%r12), %ymm0
	vpxor	(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	movq	$0, %rcx
	movzbq	32(%rbx,%r12), %rdx
	orq 	%rdx, %rcx
	movq	$6, %rdx
	shlq	$8, %rdx
	orq 	%rdx, %rcx
	xorq	%rcx, 32(%rax)
	xorb	$128, 71(%rax)
	leaq	32(%rsp), %rax
	movq	$0, %r12
	movq	$0, %r9
	jmp 	L_sha3_512A_A33$3
L_sha3_512A_A33$4:
	incq	%r9
	movq	%rdi, 232(%rsp)
	movq	%r12, 240(%rsp)
	movq	%r9, 248(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_sha3_512A_A33$5:
	leaq	200(%rsp), %rsp
	movq	232(%rsp), %rdi
	movq	240(%rsp), %r12
	movq	248(%rsp), %r9
	vmovdqu	(%rax), %ymm0
	vmovdqu	%ymm0, (%rdi,%r12)
	vmovdqu	32(%rax), %ymm0
	vmovdqu	%ymm0, 32(%rdi,%r12)
	movq	64(%rax), %rcx
	movq	%rcx, 64(%rdi,%r12)
	addq	$72, %r12
L_sha3_512A_A33$3:
	cmpq	$0, %r9
	jb  	L_sha3_512A_A33$4
	movq	%rdi, 248(%rsp)
	movq	%r12, 240(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_opt$1
L_sha3_512A_A33$2:
	leaq	200(%rsp), %rsp
	movq	248(%rsp), %rdi
	movq	240(%rsp), %r12
	vmovdqu	(%rax), %ymm0
	vmovdqu	%ymm0, (%rdi,%r12)
	vmovdqu	32(%rax), %ymm0
	vmovdqu	%ymm0, 32(%rdi,%r12)
	ret
L_keccakf1600_avx2x4_nat$1:
	vmovdqu	224(%rcx), %ymm10
	vmovdqu	256(%rcx), %ymm13
	vmovdqu	352(%rcx), %ymm7
	vmovdqu	384(%rcx), %ymm0
	vmovdqu	480(%rcx), %ymm4
	vmovdqu	576(%rcx), %ymm1
	vmovdqu	672(%rcx), %ymm14
	vmovdqu	704(%rcx), %ymm2
	vmovdqu	768(%rcx), %ymm3
	leaq	glob_data + 448(%rip), %r9
	leaq	glob_data + 480(%rip), %r10
	leaq	glob_data + 4600(%rip), %r11
	movq	$0, %rbx
L_keccakf1600_avx2x4_nat$2:
	vmovdqu	160(%rcx), %ymm12
	vpxor	640(%rcx), %ymm4, %ymm9
	vmovdqu	%ymm4, 224(%rcx)
	vmovdqu	%ymm10, %ymm4
	vmovdqu	192(%rcx), %ymm8
	vmovdqu	512(%rcx), %ymm6
	vmovdqu	%ymm14, 352(%rcx)
	vpxor	320(%rcx), %ymm12, %ymm11
	vmovdqu	64(%rcx), %ymm10
	vmovdqu	%ymm12, 256(%rcx)
	vpxor	%ymm14, %ymm6, %ymm6
	vmovdqu	32(%rcx), %ymm5
	vmovdqu	448(%rcx), %ymm12
	vmovdqu	%ymm13, 576(%rcx)
	vpxor	%ymm11, %ymm9, %ymm9
	vpxor	%ymm7, %ymm8, %ymm11
	vpxor	544(%rcx), %ymm2, %ymm8
	vmovdqu	%ymm10, 480(%rcx)
	vpxor	%ymm11, %ymm6, %ymm6
	vpxor	%ymm0, %ymm4, %ymm11
	vmovdqu	288(%rcx), %ymm14
	vmovdqu	%ymm7, 384(%rcx)
	vpxor	%ymm11, %ymm8, %ymm8
	vpxor	416(%rcx), %ymm13, %ymm11
	vpxor	%ymm5, %ymm6, %ymm6
	vmovdqu	96(%rcx), %ymm7
	vpxor	%ymm10, %ymm8, %ymm8
	vpxor	736(%rcx), %ymm1, %ymm10
	vpxor	%ymm12, %ymm14, %ymm14
	vmovdqu	%ymm12, 672(%rcx)
	vpsrlq	$63, %ymm6, %ymm12
	vpsrlq	$63, %ymm8, %ymm15
	vpxor	(%rcx), %ymm9, %ymm9
	vpxor	%ymm11, %ymm10, %ymm10
	vmovdqu	128(%rcx), %ymm13
	vpxor	%ymm7, %ymm10, %ymm10
	vpxor	608(%rcx), %ymm3, %ymm11
	vmovdqu	%ymm13, 704(%rcx)
	vpxor	%ymm14, %ymm11, %ymm11
	vpsllq	$1, %ymm6, %ymm14
	vpor	%ymm12, %ymm14, %ymm14
	vpsllq	$1, %ymm8, %ymm12
	vpxor	%ymm13, %ymm11, %ymm11
	vpor	%ymm15, %ymm12, %ymm12
	vpsrlq	$63, %ymm10, %ymm13
	vpxor	%ymm11, %ymm14, %ymm14
	vpsllq	$1, %ymm10, %ymm15
	vpxor	%ymm9, %ymm12, %ymm12
	vpor	%ymm13, %ymm15, %ymm15
	vpxor	%ymm5, %ymm12, %ymm5
	vpxor	%ymm6, %ymm15, %ymm15
	vpsrlq	$63, %ymm11, %ymm6
	vpsllq	$1, %ymm11, %ymm11
	vpxor	%ymm2, %ymm15, %ymm2
	vpxor	%ymm4, %ymm15, %ymm4
	vpor	%ymm6, %ymm11, %ymm11
	vpxor	(%rcx), %ymm14, %ymm6
	vpxor	%ymm8, %ymm11, %ymm11
	vpsrlq	$63, %ymm9, %ymm8
	vpsllq	$1, %ymm9, %ymm9
	vpxor	%ymm1, %ymm11, %ymm1
	vpxor	%ymm7, %ymm11, %ymm7
	vpor	%ymm8, %ymm9, %ymm9
	vpxor	%ymm10, %ymm9, %ymm9
	vpxor	192(%rcx), %ymm12, %ymm10
	vpxor	%ymm3, %ymm9, %ymm3
	vpsrlq	$20, %ymm10, %ymm8
	vpsllq	$44, %ymm10, %ymm10
	vpor	%ymm8, %ymm10, %ymm10
	vpxor	%ymm0, %ymm15, %ymm8
	vpbroadcastq	(%r11,%rbx,8), %ymm0
	vpsrlq	$21, %ymm8, %ymm13
	vpsllq	$43, %ymm8, %ymm8
	vpor	%ymm13, %ymm8, %ymm8
	vpandn	%ymm8, %ymm10, %ymm13
	vpxor	%ymm0, %ymm13, %ymm13
	vpxor	%ymm6, %ymm13, %ymm0
	vpsrlq	$43, %ymm1, %ymm13
	vpsllq	$21, %ymm1, %ymm1
	vmovdqu	%ymm0, (%rcx)
	vpor	%ymm13, %ymm1, %ymm1
	vpandn	%ymm1, %ymm8, %ymm13
	vpxor	%ymm10, %ymm13, %ymm0
	vpsrlq	$50, %ymm3, %ymm13
	vpsllq	$14, %ymm3, %ymm3
	vmovdqu	%ymm0, 32(%rcx)
	vpor	%ymm13, %ymm3, %ymm3
	vpandn	%ymm3, %ymm1, %ymm13
	vpxor	%ymm8, %ymm13, %ymm8
	vmovdqu	%ymm8, 64(%rcx)
	vpandn	%ymm6, %ymm3, %ymm8
	vpandn	%ymm10, %ymm6, %ymm6
	vpxor	%ymm1, %ymm8, %ymm8
	vmovdqu	%ymm8, 96(%rcx)
	vpxor	%ymm3, %ymm6, %ymm8
	vpsrlq	$36, %ymm7, %ymm3
	vpsllq	$28, %ymm7, %ymm7
	vmovdqu	%ymm8, 128(%rcx)
	vpor	%ymm3, %ymm7, %ymm7
	vpxor	288(%rcx), %ymm9, %ymm3
	vpsrlq	$44, %ymm3, %ymm10
	vpsllq	$20, %ymm3, %ymm3
	vpor	%ymm10, %ymm3, %ymm3
	vpxor	320(%rcx), %ymm14, %ymm10
	vpsrlq	$61, %ymm10, %ymm8
	vpsllq	$3, %ymm10, %ymm10
	vpor	%ymm8, %ymm10, %ymm10
	vpandn	%ymm10, %ymm3, %ymm8
	vpxor	%ymm7, %ymm8, %ymm8
	vmovdqu	%ymm8, 160(%rcx)
	vpxor	512(%rcx), %ymm12, %ymm8
	vpsrlq	$19, %ymm8, %ymm6
	vpsllq	$45, %ymm8, %ymm8
	vpor	%ymm6, %ymm8, %ymm8
	vpandn	%ymm8, %ymm10, %ymm6
	vpxor	%ymm3, %ymm6, %ymm6
	vmovdqu	%ymm6, 192(%rcx)
	vpsrlq	$3, %ymm2, %ymm6
	vpsllq	$61, %ymm2, %ymm2
	vpor	%ymm6, %ymm2, %ymm2
	vpandn	%ymm2, %ymm8, %ymm6
	vpxor	%ymm10, %ymm6, %ymm10
	vpandn	%ymm7, %ymm2, %ymm6
	vpandn	%ymm3, %ymm7, %ymm7
	vpsrlq	$63, %ymm5, %ymm3
	vpsllq	$1, %ymm5, %ymm5
	vpxor	%ymm8, %ymm6, %ymm13
	vpor	%ymm3, %ymm5, %ymm5
	vpsrlq	$58, %ymm4, %ymm3
	vpxor	%ymm2, %ymm7, %ymm6
	vpsllq	$6, %ymm4, %ymm4
	vmovdqu	%ymm6, 288(%rcx)
	vpxor	608(%rcx), %ymm9, %ymm2
	vpor	%ymm3, %ymm4, %ymm4
	vpxor	416(%rcx), %ymm11, %ymm3
	vpshufb	(%r9), %ymm2, %ymm2
	vpsrlq	$39, %ymm3, %ymm8
	vpsllq	$25, %ymm3, %ymm3
	vpor	%ymm3, %ymm8, %ymm8
	vpandn	%ymm8, %ymm4, %ymm3
	vpandn	%ymm2, %ymm8, %ymm7
	vpxor	%ymm5, %ymm3, %ymm6
	vpxor	640(%rcx), %ymm14, %ymm3
	vpxor	%ymm4, %ymm7, %ymm7
	vmovdqu	%ymm6, 320(%rcx)
	vpsrlq	$46, %ymm3, %ymm6
	vpsllq	$18, %ymm3, %ymm3
	vpor	%ymm3, %ymm6, %ymm3
	vpandn	%ymm3, %ymm2, %ymm6
	vpxor	%ymm8, %ymm6, %ymm0
	vpandn	%ymm5, %ymm3, %ymm8
	vpandn	%ymm4, %ymm5, %ymm5
	vpxor	%ymm2, %ymm8, %ymm6
	vmovdqu	%ymm6, 416(%rcx)
	vpxor	%ymm3, %ymm5, %ymm6
	vpxor	704(%rcx), %ymm9, %ymm5
	vpxor	672(%rcx), %ymm9, %ymm9
	vmovdqu	%ymm6, 448(%rcx)
	vpsrlq	$37, %ymm5, %ymm3
	vpsllq	$27, %ymm5, %ymm5
	vpor	%ymm5, %ymm3, %ymm3
	vpxor	256(%rcx), %ymm14, %ymm5
	vpxor	224(%rcx), %ymm14, %ymm14
	vpsrlq	$28, %ymm5, %ymm2
	vpsllq	$36, %ymm5, %ymm5
	vpor	%ymm5, %ymm2, %ymm2
	vpxor	384(%rcx), %ymm12, %ymm5
	vpxor	352(%rcx), %ymm12, %ymm12
	vpsrlq	$54, %ymm5, %ymm6
	vpsllq	$10, %ymm5, %ymm5
	vpor	%ymm5, %ymm6, %ymm6
	vpxor	544(%rcx), %ymm15, %ymm5
	vpxor	480(%rcx), %ymm15, %ymm15
	vpandn	%ymm6, %ymm2, %ymm4
	vpsrlq	$49, %ymm5, %ymm8
	vpsllq	$15, %ymm5, %ymm5
	vpxor	%ymm3, %ymm4, %ymm4
	vpor	%ymm5, %ymm8, %ymm8
	vpandn	%ymm8, %ymm6, %ymm5
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	%ymm5, 512(%rcx)
	vpxor	736(%rcx), %ymm11, %ymm5
	vpxor	576(%rcx), %ymm11, %ymm11
	vpshufb	(%r10), %ymm5, %ymm5
	vpandn	%ymm5, %ymm8, %ymm1
	vpxor	%ymm6, %ymm1, %ymm1
	vmovdqu	%ymm1, 544(%rcx)
	vpandn	%ymm3, %ymm5, %ymm1
	vpandn	%ymm2, %ymm3, %ymm3
	vpxor	%ymm5, %ymm3, %ymm3
	vpsrlq	$62, %ymm12, %ymm5
	vpxor	%ymm8, %ymm1, %ymm1
	vmovdqu	%ymm3, 608(%rcx)
	vpsrlq	$2, %ymm15, %ymm3
	vpsllq	$62, %ymm15, %ymm15
	vpor	%ymm15, %ymm3, %ymm3
	vpsrlq	$9, %ymm11, %ymm15
	vpsllq	$55, %ymm11, %ymm11
	vpsllq	$2, %ymm12, %ymm12
	vpor	%ymm11, %ymm15, %ymm11
	vpsrlq	$25, %ymm9, %ymm15
	vpor	%ymm12, %ymm5, %ymm12
	vpsllq	$39, %ymm9, %ymm9
	vpor	%ymm9, %ymm15, %ymm15
	vpandn	%ymm15, %ymm11, %ymm9
	vpxor	%ymm3, %ymm9, %ymm9
	vmovdqu	%ymm9, 640(%rcx)
	vpsrlq	$23, %ymm14, %ymm9
	vpsllq	$41, %ymm14, %ymm14
	vpor	%ymm14, %ymm9, %ymm9
	vpandn	%ymm12, %ymm9, %ymm2
	vpandn	%ymm9, %ymm15, %ymm14
	vpxor	%ymm15, %ymm2, %ymm2
	vpandn	%ymm3, %ymm12, %ymm15
	vpandn	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm15, %ymm15
	vpxor	%ymm11, %ymm14, %ymm14
	vpxor	%ymm12, %ymm3, %ymm3
	vmovdqu	%ymm15, 736(%rcx)
	incq	%rbx
	cmpq	$24, %rbx
	jb  	L_keccakf1600_avx2x4_nat$2
	vmovdqu	%ymm10, 224(%rcx)
	vmovdqu	%ymm13, 256(%rcx)
	vmovdqu	%ymm7, 352(%rcx)
	vmovdqu	%ymm0, 384(%rcx)
	vmovdqu	%ymm4, 480(%rcx)
	vmovdqu	%ymm1, 576(%rcx)
	vmovdqu	%ymm14, 672(%rcx)
	vmovdqu	%ymm2, 704(%rcx)
	vmovdqu	%ymm3, 768(%rcx)
	ret
L_keccakf1600_opt$1:
	movq	$0, %rbx
	addq	$-2, %rbx
	movq	(%rax), %rcx
	movq	80(%rax), %r10
	movq	96(%rax), %rdx
	movq	144(%rax), %rsi
	movq	152(%rax), %r12
	movq	160(%rax), %rdi
	movq	168(%rax), %r11
	movq	176(%rax), %r8
	movq	192(%rax), %r9
L_keccakf1600_opt$2:
	movq	%r12, 8(%rsp)
	movq	%r10, 16(%rsp)
	movq	%rbx, 32(%rsp)
	movq	%r11, 24(%rsp)
	movq	120(%rax), %r14
	xorq	%rdi, %r14
	xorq	40(%rax), %r10
	xorq	%r14, %r10
	movq	128(%rax), %r13
	xorq	%r11, %r13
	movq	88(%rax), %r14
	movq	48(%rax), %r11
	xorq	%r11, %r14
	xorq	%r13, %r14
	movq	136(%rax), %r13
	xorq	%r8, %r13
	movq	%rdx, %rbx
	xorq	56(%rax), %rbx
	xorq	%r13, %rbx
	movq	%rsi, %r13
	xorq	184(%rax), %r13
	movq	104(%rax), %rbp
	xorq	64(%rax), %rbp
	xorq	%r13, %rbp
	xorq	%r9, %r12
	movq	112(%rax), %r15
	xorq	72(%rax), %r15
	xorq	%r12, %r15
	xorq	%rcx, %r10
	xorq	8(%rax), %r14
	xorq	16(%rax), %rbx
	movq	24(%rax), %r12
	xorq	%r12, %rbp
	xorq	32(%rax), %r15
	rorx	$63, %rbp, %r13
	xorq	%r14, %r13
	movq	%r13, 88(%rsp)
	rorx	$63, %r14, %r14
	xorq	%r15, %r14
	movq	%r14, 80(%rsp)
	rorx	$63, %r15, %r15
	xorq	%rbx, %r15
	rorx	$63, %rbx, %rbx
	xorq	%r10, %rbx
	rorx	$63, %r10, %r10
	xorq	%rbp, %r10
	xorq	%r14, %rcx
	xorq	%rbx, %r11
	rorx	$20, %r11, %r11
	xorq	%r13, %rdx
	rorx	$21, %rdx, %rdx
	xorq	%r15, %rsi
	rorx	$43, %rsi, %rbp
	xorq	%r10, %r9
	rorx	$50, %r9, %r9
	andnq	%rcx, %r9, %rsi
	xorq	%rbp, %rsi
	movq	%rsi, 48(%rax)
	andnq	%rbp, %rdx, %rsi
	andnq	%r9, %rbp, %rbp
	xorq	%rdx, %rbp
	movq	%rbp, 72(%rsp)
	andnq	%rdx, %r11, %rbp
	leaq	glob_data + 4600(%rip), %rdx
	movq	32(%rsp), %r13
	xorq	16(%rdx,%r13,8), %rbp
	xorq	%rcx, %rbp
	xorq	%r11, %rsi
	movq	%rsi, 56(%rsp)
	andnq	%r11, %rcx, %r11
	xorq	%r9, %r11
	movq	%r11, 64(%rsp)
	xorq	%r15, %r12
	rorx	$36, %r12, %r11
	movq	72(%rax), %rsi
	xorq	%r10, %rsi
	rorx	$44, %rsi, %rsi
	movq	16(%rsp), %r9
	movq	80(%rsp), %rdx
	xorq	%rdx, %r9
	rorx	$61, %r9, %r9
	movq	128(%rax), %rcx
	movq	%rbx, %r14
	xorq	%rbx, %rcx
	rorx	$19, %rcx, %r12
	movq	88(%rsp), %rcx
	xorq	%rcx, %r8
	rorx	$3, %r8, %r8
	andnq	%r11, %r8, %r13
	xorq	%r12, %r13
	movq	%r13, 16(%rsp)
	andnq	%r12, %r9, %r13
	andnq	%r8, %r12, %r12
	xorq	%r9, %r12
	movq	%r12, 48(%rsp)
	andnq	%r9, %rsi, %r9
	xorq	%r11, %r9
	movq	%r9, 128(%rax)
	xorq	%rsi, %r13
	movq	%r13, 24(%rax)
	andnq	%rsi, %r11, %rsi
	xorq	%r8, %rsi
	movq	%rsi, 72(%rax)
	movq	8(%rax), %rsi
	xorq	%rbx, %rsi
	rorx	$63, %rsi, %rsi
	movq	56(%rax), %r12
	xorq	%rcx, %r12
	rorx	$58, %r12, %r12
	movq	104(%rax), %r11
	xorq	%r15, %r11
	rorx	$39, %r11, %r11
	movq	8(%rsp), %r8
	xorq	%r10, %r8
	rorx	$56, %r8, %r8
	movq	%rdx, %r9
	xorq	%rdx, %rdi
	rorx	$46, %rdi, %rdi
	andnq	%rsi, %rdi, %rbx
	xorq	%r8, %rbx
	movq	%rbx, 104(%rax)
	andnq	%r8, %r11, %rbx
	andnq	%rdi, %r8, %rdx
	xorq	%r11, %rdx
	andnq	%r11, %r12, %r11
	xorq	%rsi, %r11
	movq	%r11, 56(%rax)
	xorq	%r12, %rbx
	movq	%rbx, 40(%rsp)
	andnq	%r12, %rsi, %rsi
	xorq	%rdi, %rsi
	movq	%rsi, 8(%rsp)
	movq	32(%rax), %rsi
	xorq	%r10, %rsi
	rorx	$37, %rsi, %r11
	movq	40(%rax), %r12
	xorq	%r9, %r12
	rorx	$28, %r12, %r12
	movq	88(%rax), %rdi
	xorq	%r14, %rdi
	rorx	$54, %rdi, %rdi
	movq	136(%rax), %rbx
	xorq	%rcx, %rbx
	rorx	$49, %rbx, %r13
	movq	184(%rax), %rbx
	xorq	%r15, %rbx
	rorx	$8, %rbx, %rbx
	andnq	%r11, %rbx, %rsi
	xorq	%r13, %rsi
	andnq	%r13, %rdi, %r8
	andnq	%rbx, %r13, %r13
	xorq	%rdi, %r13
	movq	%r13, 136(%rax)
	andnq	%rdi, %r12, %rdi
	xorq	%r11, %rdi
	movq	%rdi, 184(%rax)
	xorq	%r12, %r8
	movq	%r8, 40(%rax)
	andnq	%r12, %r11, %r11
	xorq	%rbx, %r11
	movq	%r11, 88(%rax)
	xorq	16(%rax), %rcx
	xorq	64(%rax), %r15
	xorq	112(%rax), %r10
	movq	%r9, %r12
	xorq	120(%rax), %r12
	xorq	24(%rsp), %r14
	rorx	$2, %rcx, %r9
	rorx	$9, %r15, %r13
	rorx	$25, %r10, %r10
	rorx	$23, %r12, %rcx
	rorx	$62, %r14, %r14
	andnq	%r9, %r14, %rbx
	xorq	%rcx, %rbx
	movq	%rbx, 120(%rax)
	andnq	%rcx, %r10, %r15
	andnq	%r14, %rcx, %r12
	xorq	%r10, %r12
	andnq	%r10, %r13, %rcx
	xorq	%r9, %rcx
	movq	%rcx, %r10
	movq	%rcx, 112(%rax)
	xorq	%r13, %r15
	movq	%r15, 24(%rsp)
	andnq	%r13, %r9, %rcx
	xorq	%r14, %rcx
	xorq	56(%rax), %rdi
	movq	128(%rax), %r11
	xorq	%r10, %r11
	xorq	%rdi, %r11
	movq	24(%rax), %r10
	movq	%r10, %rdi
	xorq	56(%rsp), %rdi
	movq	%r8, %r13
	xorq	40(%rsp), %r13
	xorq	%rdi, %r13
	movq	48(%rsp), %r8
	xorq	136(%rax), %r8
	movq	%r12, %rdi
	xorq	72(%rsp), %rdi
	xorq	%r8, %rdi
	movq	104(%rax), %r8
	xorq	16(%rsp), %r8
	movq	%rbx, %r14
	xorq	48(%rax), %r14
	xorq	%r8, %r14
	movq	64(%rsp), %r8
	xorq	%rcx, %r8
	movq	8(%rsp), %rbx
	xorq	72(%rax), %rbx
	xorq	%r8, %rbx
	xorq	%rbp, %r11
	xorq	%r15, %r13
	xorq	%rdx, %rdi
	xorq	%rsi, %r14
	movq	88(%rax), %r15
	xorq	%r15, %rbx
	rorx	$63, %r14, %r8
	xorq	%r13, %r8
	rorx	$63, %r13, %r9
	xorq	%rbx, %r9
	rorx	$63, %rbx, %rbx
	xorq	%rdi, %rbx
	rorx	$63, %rdi, %rdi
	xorq	%r11, %rdi
	rorx	$63, %r11, %r13
	xorq	%r14, %r13
	xorq	%r9, %rbp
	xorq	%rdi, %r10
	rorx	$20, %r10, %r10
	xorq	%r8, %rdx
	rorx	$21, %rdx, %r14
	xorq	%rbx, %rsi
	rorx	$43, %rsi, %rsi
	xorq	%r13, %rcx
	rorx	$50, %rcx, %rcx
	andnq	%rbp, %rcx, %rdx
	xorq	%rsi, %rdx
	movq	%rdx, 24(%rax)
	andnq	%rsi, %r14, %rdx
	andnq	%rcx, %rsi, %rsi
	xorq	%r14, %rsi
	movq	%rsi, 16(%rax)
	andnq	%r14, %r10, %rsi
	movq	32(%rsp), %r14
	leaq	glob_data + 4600(%rip), %r11
	xorq	24(%r11,%r14,8), %rsi
	xorq	%rbp, %rsi
	movq	%rsi, 80(%rsp)
	xorq	%r10, %rdx
	movq	%rdx, 8(%rax)
	andnq	%r10, %rbp, %r10
	xorq	%rcx, %r10
	movq	%r10, 32(%rax)
	movq	48(%rax), %rcx
	xorq	%rbx, %rcx
	rorx	$36, %rcx, %r10
	movq	72(%rax), %r14
	xorq	%r13, %r14
	rorx	$44, %r14, %r14
	movq	56(%rax), %rcx
	xorq	%r9, %rcx
	rorx	$61, %rcx, %rsi
	movq	40(%rax), %rcx
	xorq	%rdi, %rcx
	rorx	$19, %rcx, %rcx
	xorq	%r8, %r12
	rorx	$3, %r12, %rdx
	andnq	%r10, %rdx, %r12
	xorq	%rcx, %r12
	movq	%r12, 64(%rax)
	andnq	%rcx, %rsi, %r12
	andnq	%rdx, %rcx, %rcx
	xorq	%rsi, %rcx
	movq	%rcx, 56(%rax)
	andnq	%rsi, %r14, %rcx
	xorq	%r10, %rcx
	movq	%rcx, 40(%rax)
	xorq	%r14, %r12
	movq	%r12, 48(%rax)
	andnq	%r14, %r10, %rcx
	xorq	%rdx, %rcx
	movq	%rcx, 72(%rax)
	movq	56(%rsp), %rcx
	xorq	%rdi, %rcx
	rorx	$63, %rcx, %rcx
	movq	48(%rsp), %r14
	xorq	%r8, %r14
	rorx	$58, %r14, %r14
	movq	104(%rax), %rsi
	xorq	%rbx, %rsi
	rorx	$39, %rsi, %rsi
	xorq	%r13, %r15
	rorx	$56, %r15, %r10
	movq	112(%rax), %rdx
	xorq	%r9, %rdx
	rorx	$46, %rdx, %r11
	andnq	%rcx, %r11, %r12
	xorq	%r10, %r12
	movq	%r12, 104(%rax)
	andnq	%r10, %rsi, %r12
	andnq	%r11, %r10, %rdx
	xorq	%rsi, %rdx
	andnq	%rsi, %r14, %r10
	xorq	%rcx, %r10
	xorq	%r14, %r12
	movq	%r12, 88(%rax)
	andnq	%r14, %rcx, %rcx
	xorq	%r11, %rcx
	movq	%rcx, 112(%rax)
	movq	64(%rsp), %rcx
	xorq	%r13, %rcx
	rorx	$37, %rcx, %rcx
	movq	128(%rax), %r14
	xorq	%r9, %r14
	rorx	$28, %r14, %r14
	movq	40(%rsp), %rsi
	xorq	%rdi, %rsi
	rorx	$54, %rsi, %r12
	movq	136(%rax), %rsi
	xorq	%r8, %rsi
	rorx	$49, %rsi, %r15
	movq	120(%rax), %rsi
	xorq	%rbx, %rsi
	rorx	$8, %rsi, %rbp
	andnq	%rcx, %rbp, %rsi
	xorq	%r15, %rsi
	andnq	%r15, %r12, %r11
	andnq	%rbp, %r15, %r15
	xorq	%r12, %r15
	movq	%r15, 136(%rax)
	andnq	%r12, %r14, %r12
	xorq	%rcx, %r12
	movq	%r12, 120(%rax)
	xorq	%r14, %r11
	movq	%r11, 128(%rax)
	andnq	%r14, %rcx, %r12
	xorq	%rbp, %r12
	xorq	72(%rsp), %r8
	xorq	16(%rsp), %rbx
	xorq	8(%rsp), %r13
	xorq	184(%rax), %r9
	xorq	24(%rsp), %rdi
	rorx	$2, %r8, %rcx
	rorx	$9, %rbx, %r14
	rorx	$25, %r13, %r13
	rorx	$23, %r9, %rbx
	rorx	$62, %rdi, %r15
	andnq	%rcx, %r15, %rdi
	xorq	%rbx, %rdi
	movq	%rdi, 184(%rax)
	andnq	%rbx, %r13, %r11
	andnq	%r15, %rbx, %r8
	xorq	%r13, %r8
	andnq	%r13, %r14, %rdi
	xorq	%rcx, %rdi
	xorq	%r14, %r11
	andnq	%r14, %rcx, %r9
	xorq	%r15, %r9
	movq	32(%rsp), %r14
	addq	$2, %r14
	movq	%r14, %rbx
	movq	80(%rsp), %rcx
	cmpq	$22, %rbx
	jb  	L_keccakf1600_opt$2
	movq	%rcx, (%rax)
	movq	%r10, 80(%rax)
	movq	%rdx, 96(%rax)
	movq	%rsi, 144(%rax)
	movq	%r12, 152(%rax)
	movq	%rdi, 160(%rax)
	movq	%r11, 168(%rax)
	movq	%r8, 176(%rax)
	movq	%r9, 192(%rax)
	ret
L_nttunpack$1:
	vmovdqu	(%rax), %ymm3
	vmovdqu	32(%rax), %ymm4
	vmovdqu	64(%rax), %ymm7
	vmovdqu	96(%rax), %ymm9
	vmovdqu	128(%rax), %ymm1
	vmovdqu	160(%rax), %ymm6
	vmovdqu	192(%rax), %ymm10
	vmovdqu	224(%rax), %ymm13
	vperm2i128	$32, %ymm1, %ymm3, %ymm2
	vperm2i128	$49, %ymm1, %ymm3, %ymm5
	vperm2i128	$32, %ymm6, %ymm4, %ymm1
	vperm2i128	$49, %ymm6, %ymm4, %ymm8
	vperm2i128	$32, %ymm10, %ymm7, %ymm0
	vperm2i128	$49, %ymm10, %ymm7, %ymm12
	vperm2i128	$32, %ymm13, %ymm9, %ymm6
	vperm2i128	$49, %ymm13, %ymm9, %ymm10
	vpunpcklqdq	%ymm0, %ymm2, %ymm3
	vpunpckhqdq	%ymm0, %ymm2, %ymm4
	vpunpcklqdq	%ymm12, %ymm5, %ymm7
	vpunpckhqdq	%ymm12, %ymm5, %ymm5
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
	vpblendd	$170, %ymm11, %ymm7, %ymm1
	vpsrlq	$32, %ymm7, %ymm7
	vpblendd	$170, %ymm6, %ymm7, %ymm6
	vmovsldup	%ymm8, %ymm11
	vpblendd	$170, %ymm11, %ymm5, %ymm7
	vpsrlq	$32, %ymm5, %ymm5
	vpblendd	$170, %ymm8, %ymm5, %ymm5
	vpslld	$16, %ymm1, %ymm11
	vpblendw	$170, %ymm11, %ymm9, %ymm8
	vpsrld	$16, %ymm9, %ymm9
	vpblendw	$170, %ymm1, %ymm9, %ymm1
	vpslld	$16, %ymm6, %ymm11
	vpblendw	$170, %ymm11, %ymm2, %ymm10
	vpsrld	$16, %ymm2, %ymm9
	vpblendw	$170, %ymm6, %ymm9, %ymm13
	vpslld	$16, %ymm7, %ymm2
	vpblendw	$170, %ymm2, %ymm3, %ymm2
	vpsrld	$16, %ymm3, %ymm3
	vpblendw	$170, %ymm7, %ymm3, %ymm11
	vpslld	$16, %ymm5, %ymm6
	vpblendw	$170, %ymm6, %ymm4, %ymm3
	vpsrld	$16, %ymm4, %ymm7
	vpblendw	$170, %ymm5, %ymm7, %ymm4
	vmovdqu	%ymm8, (%rax)
	vmovdqu	%ymm1, 32(%rax)
	vmovdqu	%ymm10, 64(%rax)
	vmovdqu	%ymm13, 96(%rax)
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	%ymm11, 160(%rax)
	vmovdqu	%ymm3, 192(%rax)
	vmovdqu	%ymm4, 224(%rax)
	vmovdqu	256(%rax), %ymm3
	vmovdqu	288(%rax), %ymm5
	vmovdqu	320(%rax), %ymm7
	vmovdqu	352(%rax), %ymm9
	vmovdqu	384(%rax), %ymm1
	vmovdqu	416(%rax), %ymm6
	vmovdqu	448(%rax), %ymm8
	vmovdqu	480(%rax), %ymm10
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
	vmovdqu	%ymm0, 256(%rax)
	vmovdqu	%ymm1, 288(%rax)
	vmovdqu	%ymm10, 320(%rax)
	vmovdqu	%ymm13, 352(%rax)
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	%ymm8, 416(%rax)
	vmovdqu	%ymm3, 448(%rax)
	vmovdqu	%ymm4, 480(%rax)
	ret
	.data
	.p2align	5
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
	.ident	"Jasmin Compiler @VERSION@"
	.section	".note.GNU-stack", "", %progbits
