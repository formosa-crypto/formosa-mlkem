	.att_syntax
	.text
	.p2align	5
	.global	_jade_kem_mlkem_mlkem768_amd64_avx2_dec
	.global	jade_kem_mlkem_mlkem768_amd64_avx2_dec
	.global	_jade_kem_mlkem_mlkem768_amd64_avx2_enc
	.global	jade_kem_mlkem_mlkem768_amd64_avx2_enc
	.global	_jade_kem_mlkem_mlkem768_amd64_avx2_keypair
	.global	jade_kem_mlkem_mlkem768_amd64_avx2_keypair
	.global	_jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand
	.global	jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand
	.global	_jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand
	.global	jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand
_jade_kem_mlkem_mlkem768_amd64_avx2_dec:
jade_kem_mlkem_mlkem768_amd64_avx2_dec:
	movq	%rsp, %rax
	leaq	-14104(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 14056(%rsp)
	movq	%rbp, 14064(%rsp)
	movq	%r12, 14072(%rsp)
	movq	%r13, 14080(%rsp)
	movq	%r14, 14088(%rsp)
	movq	%rax, 14096(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm1
	movq	%rsi, %mm2
	leaq	32(%rsp), %rax
	vpbroadcastd	glob_data + 4956(%rip), %ymm0
	vmovdqu	glob_data + 160(%rip), %ymm1
	vpbroadcastq	glob_data + 4752(%rip), %ymm2
	vpbroadcastd	glob_data + 4952(%rip), %ymm3
	vmovdqu	(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3296(%rsp)
	vmovdqu	20(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3328(%rsp)
	vmovdqu	40(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3360(%rsp)
	vmovdqu	60(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3392(%rsp)
	vmovdqu	80(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3424(%rsp)
	vmovdqu	100(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3456(%rsp)
	vmovdqu	120(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3488(%rsp)
	vmovdqu	140(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3520(%rsp)
	vmovdqu	160(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3552(%rsp)
	vmovdqu	180(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3584(%rsp)
	vmovdqu	200(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3616(%rsp)
	vmovdqu	220(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3648(%rsp)
	vmovdqu	240(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3680(%rsp)
	vmovdqu	260(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3712(%rsp)
	vmovdqu	280(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3744(%rsp)
	vmovdqu	300(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3776(%rsp)
	vmovdqu	320(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3808(%rsp)
	vmovdqu	340(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3840(%rsp)
	vmovdqu	360(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3872(%rsp)
	vmovdqu	380(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3904(%rsp)
	vmovdqu	400(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3936(%rsp)
	vmovdqu	420(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 3968(%rsp)
	vmovdqu	440(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4000(%rsp)
	vmovdqu	460(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4032(%rsp)
	vmovdqu	480(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4064(%rsp)
	vmovdqu	500(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4096(%rsp)
	vmovdqu	520(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4128(%rsp)
	vmovdqu	540(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4160(%rsp)
	vmovdqu	560(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4192(%rsp)
	vmovdqu	580(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4224(%rsp)
	vmovdqu	600(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4256(%rsp)
	vmovdqu	620(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4288(%rsp)
	vmovdqu	640(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4320(%rsp)
	vmovdqu	660(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4352(%rsp)
	vmovdqu	680(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4384(%rsp)
	vmovdqu	700(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4416(%rsp)
	vmovdqu	720(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4448(%rsp)
	vmovdqu	740(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4480(%rsp)
	vmovdqu	760(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4512(%rsp)
	vmovdqu	780(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4544(%rsp)
	vmovdqu	800(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4576(%rsp)
	vmovdqu	820(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4608(%rsp)
	vmovdqu	840(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4640(%rsp)
	vmovdqu	860(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4672(%rsp)
	vmovdqu	880(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4704(%rsp)
	vmovdqu	900(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4736(%rsp)
	vmovdqu	920(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 4768(%rsp)
	vmovdqu	940(%rsi), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm1
	vpsllvd	%ymm2, %ymm1, %ymm1
	vpsrlw	$1, %ymm1, %ymm1
	vpand	%ymm3, %ymm1, %ymm1
	vpmulhrsw	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, 4800(%rsp)
	addq	$960, %rsi
	leaq	160(%rsp), %rcx
	leaq	-24(%rsp), %rsp
	call	L_poly_decompress$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$62:
	leaq	24(%rsp), %rsp
	movq	%rdx, %rsi
	leaq	4832(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$61:
	addq	$384, %rsi
	leaq	5344(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$60:
	addq	$384, %rsi
	leaq	5856(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$59:
	leaq	3296(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$58:
	leaq	3808(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$57:
	leaq	4320(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$56:
	leaq	672(%rsp), %rcx
	leaq	4832(%rsp), %rsi
	leaq	3296(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$55:
	leaq	1184(%rsp), %rcx
	leaq	5344(%rsp), %rsi
	leaq	3808(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$54:
	leaq	672(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$53:
	leaq	1184(%rsp), %rcx
	leaq	5856(%rsp), %rsi
	leaq	4320(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$52:
	leaq	672(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$51:
	leaq	672(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$50:
	leaq	1184(%rsp), %rcx
	leaq	160(%rsp), %rsi
	leaq	672(%rsp), %rdi
	call	L_poly_sub$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$49:
	leaq	1184(%rsp), %rcx
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rcx)
	vmovdqu	32(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rcx)
	vmovdqu	64(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rcx)
	vmovdqu	96(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rcx)
	vmovdqu	128(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rcx)
	vmovdqu	160(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rcx)
	vmovdqu	192(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rcx)
	vmovdqu	224(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rcx)
	vmovdqu	256(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rcx)
	vmovdqu	288(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rcx)
	vmovdqu	320(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rcx)
	vmovdqu	352(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rcx)
	vmovdqu	384(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rcx)
	vmovdqu	416(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rcx)
	vmovdqu	448(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rcx)
	vmovdqu	480(%rcx), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rcx)
	leaq	1184(%rsp), %rcx
	call	L_poly_tomsg_1$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$48:
	movq	%rdx, %rax
	addq	$2336, %rax
	movq	(%rax), %rcx
	movq	%rcx, 64(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 72(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 80(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 88(%rsp)
	movq	%rdx, %mm3
	leaq	96(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$47:
	movq	%mm3, %rcx
	addq	$1152, %rcx
	leaq	32(%rsp), %rax
	leaq	128(%rsp), %rdx
	movq	%rcx, %rsi
	leaq	3296(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$46:
	addq	$384, %rsi
	leaq	3808(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$45:
	addq	$384, %rsi
	leaq	4320(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$44:
	movq	$0, %rsi
	addq	$1152, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$42
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$43:
	movq	(%rcx), %rdi
	movq	%rdi, (%rsp,%rsi,8)
	addq	$8, %rcx
	incq	%rsi
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$42:
	cmpq	$4, %rsi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$43
	leaq	1184(%rsp), %rcx
	call	L_poly_frommsg_1$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$41:
	movq	%rdx, %mm4
	movq	$1, %rcx
	leaq	9440(%rsp), %rax
	movq	%rsp, %rsi
	leaq	-2200(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$40:
	leaq	2200(%rsp), %rsp
	movq	%mm4, %rbx
	movb	$0, %r11b
	leaq	6368(%rsp), %rdx
	leaq	6880(%rsp), %r8
	leaq	7392(%rsp), %r9
	leaq	4832(%rsp), %r10
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$39:
	leaq	600(%rsp), %rsp
	movq	%mm4, %rbx
	movb	$4, %r11b
	leaq	5344(%rsp), %rdx
	leaq	5856(%rsp), %r8
	leaq	672(%rsp), %r9
	leaq	7904(%rsp), %r10
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$38:
	leaq	600(%rsp), %rsp
	leaq	6368(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$37:
	leaq	6880(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$36:
	leaq	7392(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$35:
	leaq	7904(%rsp), %rcx
	leaq	9440(%rsp), %rsi
	leaq	6368(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$34:
	leaq	160(%rsp), %rcx
	leaq	9952(%rsp), %rsi
	leaq	6880(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$33:
	leaq	7904(%rsp), %rcx
	leaq	160(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$32:
	leaq	160(%rsp), %rcx
	leaq	10464(%rsp), %rsi
	leaq	7392(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$31:
	leaq	7904(%rsp), %rcx
	leaq	160(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$30:
	leaq	8416(%rsp), %rcx
	leaq	10976(%rsp), %rsi
	leaq	6368(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$29:
	leaq	160(%rsp), %rcx
	leaq	11488(%rsp), %rsi
	leaq	6880(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$28:
	leaq	8416(%rsp), %rcx
	leaq	160(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$27:
	leaq	160(%rsp), %rcx
	leaq	12000(%rsp), %rsi
	leaq	7392(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$26:
	leaq	8416(%rsp), %rcx
	leaq	160(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$25:
	leaq	8928(%rsp), %rcx
	leaq	12512(%rsp), %rsi
	leaq	6368(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$24:
	leaq	160(%rsp), %rcx
	leaq	13024(%rsp), %rsi
	leaq	6880(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$23:
	leaq	8928(%rsp), %rcx
	leaq	160(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$22:
	leaq	160(%rsp), %rcx
	leaq	13536(%rsp), %rsi
	leaq	7392(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$21:
	leaq	8928(%rsp), %rcx
	leaq	160(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$20:
	leaq	160(%rsp), %rcx
	leaq	3296(%rsp), %rsi
	leaq	6368(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$19:
	leaq	1696(%rsp), %rcx
	leaq	3808(%rsp), %rsi
	leaq	6880(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$18:
	leaq	160(%rsp), %rcx
	leaq	1696(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$17:
	leaq	1696(%rsp), %rcx
	leaq	4320(%rsp), %rsi
	leaq	7392(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$16:
	leaq	160(%rsp), %rcx
	leaq	1696(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$15:
	leaq	7904(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$14:
	leaq	8416(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$13:
	leaq	8928(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$12:
	leaq	160(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$11:
	leaq	7904(%rsp), %rcx
	leaq	4832(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$10:
	leaq	8416(%rsp), %rcx
	leaq	5344(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$9:
	leaq	8928(%rsp), %rcx
	leaq	5856(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$8:
	leaq	160(%rsp), %rcx
	leaq	672(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$7:
	leaq	160(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$6:
	leaq	7904(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	leaq	8416(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	leaq	8928(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	leaq	160(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	leaq	2208(%rsp), %rax
	leaq	7904(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$5:
	leaq	8416(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$4:
	leaq	8928(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$3:
	leaq	glob_data + 928(%rip), %rcx
	vmovdqu	(%rcx), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 4972(%rip), %ymm2
	vpbroadcastw	glob_data + 4970(%rip), %ymm3
	vpbroadcastw	glob_data + 4968(%rip), %ymm4
	vpbroadcastq	glob_data + 4744(%rip), %ymm5
	vpbroadcastq	glob_data + 4736(%rip), %ymm6
	vmovdqu	glob_data + 128(%rip), %ymm7
	vmovdqu	7904(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, (%rax)
	vpextrd	$0, %xmm8, 16(%rax)
	vmovdqu	7936(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 20(%rax)
	vpextrd	$0, %xmm8, 36(%rax)
	vmovdqu	7968(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 40(%rax)
	vpextrd	$0, %xmm8, 56(%rax)
	vmovdqu	8000(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 60(%rax)
	vpextrd	$0, %xmm8, 76(%rax)
	vmovdqu	8032(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 80(%rax)
	vpextrd	$0, %xmm8, 96(%rax)
	vmovdqu	8064(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 100(%rax)
	vpextrd	$0, %xmm8, 116(%rax)
	vmovdqu	8096(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 120(%rax)
	vpextrd	$0, %xmm8, 136(%rax)
	vmovdqu	8128(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 140(%rax)
	vpextrd	$0, %xmm8, 156(%rax)
	vmovdqu	8160(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 160(%rax)
	vpextrd	$0, %xmm8, 176(%rax)
	vmovdqu	8192(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 180(%rax)
	vpextrd	$0, %xmm8, 196(%rax)
	vmovdqu	8224(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 200(%rax)
	vpextrd	$0, %xmm8, 216(%rax)
	vmovdqu	8256(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 220(%rax)
	vpextrd	$0, %xmm8, 236(%rax)
	vmovdqu	8288(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 240(%rax)
	vpextrd	$0, %xmm8, 256(%rax)
	vmovdqu	8320(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 260(%rax)
	vpextrd	$0, %xmm8, 276(%rax)
	vmovdqu	8352(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 280(%rax)
	vpextrd	$0, %xmm8, 296(%rax)
	vmovdqu	8384(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 300(%rax)
	vpextrd	$0, %xmm8, 316(%rax)
	vmovdqu	8416(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 320(%rax)
	vpextrd	$0, %xmm8, 336(%rax)
	vmovdqu	8448(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 340(%rax)
	vpextrd	$0, %xmm8, 356(%rax)
	vmovdqu	8480(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 360(%rax)
	vpextrd	$0, %xmm8, 376(%rax)
	vmovdqu	8512(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 380(%rax)
	vpextrd	$0, %xmm8, 396(%rax)
	vmovdqu	8544(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 400(%rax)
	vpextrd	$0, %xmm8, 416(%rax)
	vmovdqu	8576(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 420(%rax)
	vpextrd	$0, %xmm8, 436(%rax)
	vmovdqu	8608(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 440(%rax)
	vpextrd	$0, %xmm8, 456(%rax)
	vmovdqu	8640(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 460(%rax)
	vpextrd	$0, %xmm8, 476(%rax)
	vmovdqu	8672(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 480(%rax)
	vpextrd	$0, %xmm8, 496(%rax)
	vmovdqu	8704(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 500(%rax)
	vpextrd	$0, %xmm8, 516(%rax)
	vmovdqu	8736(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 520(%rax)
	vpextrd	$0, %xmm8, 536(%rax)
	vmovdqu	8768(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 540(%rax)
	vpextrd	$0, %xmm8, 556(%rax)
	vmovdqu	8800(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 560(%rax)
	vpextrd	$0, %xmm8, 576(%rax)
	vmovdqu	8832(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 580(%rax)
	vpextrd	$0, %xmm8, 596(%rax)
	vmovdqu	8864(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 600(%rax)
	vpextrd	$0, %xmm8, 616(%rax)
	vmovdqu	8896(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 620(%rax)
	vpextrd	$0, %xmm8, 636(%rax)
	vmovdqu	8928(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 640(%rax)
	vpextrd	$0, %xmm8, 656(%rax)
	vmovdqu	8960(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 660(%rax)
	vpextrd	$0, %xmm8, 676(%rax)
	vmovdqu	8992(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 680(%rax)
	vpextrd	$0, %xmm8, 696(%rax)
	vmovdqu	9024(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 700(%rax)
	vpextrd	$0, %xmm8, 716(%rax)
	vmovdqu	9056(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 720(%rax)
	vpextrd	$0, %xmm8, 736(%rax)
	vmovdqu	9088(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 740(%rax)
	vpextrd	$0, %xmm8, 756(%rax)
	vmovdqu	9120(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 760(%rax)
	vpextrd	$0, %xmm8, 776(%rax)
	vmovdqu	9152(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 780(%rax)
	vpextrd	$0, %xmm8, 796(%rax)
	vmovdqu	9184(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 800(%rax)
	vpextrd	$0, %xmm8, 816(%rax)
	vmovdqu	9216(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 820(%rax)
	vpextrd	$0, %xmm8, 836(%rax)
	vmovdqu	9248(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 840(%rax)
	vpextrd	$0, %xmm8, 856(%rax)
	vmovdqu	9280(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 860(%rax)
	vpextrd	$0, %xmm8, 876(%rax)
	vmovdqu	9312(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 880(%rax)
	vpextrd	$0, %xmm8, 896(%rax)
	vmovdqu	9344(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 900(%rax)
	vpextrd	$0, %xmm8, 916(%rax)
	vmovdqu	9376(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 920(%rax)
	vpextrd	$0, %xmm8, 936(%rax)
	vmovdqu	9408(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm1
	vpaddw	%ymm2, %ymm8, %ymm2
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm0
	vpsubw	%ymm2, %ymm1, %ymm2
	vpandn	%ymm2, %ymm1, %ymm1
	vpsrlw	$15, %ymm1, %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vpmulhrsw	%ymm3, %ymm0, %ymm0
	vpand	%ymm4, %ymm0, %ymm0
	vpmaddwd	%ymm5, %ymm0, %ymm0
	vpsllvd	%ymm6, %ymm0, %ymm0
	vpsrlq	$12, %ymm0, %ymm0
	vpshufb	%ymm7, %ymm0, %ymm0
	vmovdqu	%xmm0, %xmm1
	vextracti128	$1, %ymm0, %xmm0
	vpblendw	$224, %xmm0, %xmm1, %xmm1
	vmovdqu	%xmm1, 940(%rax)
	vpextrd	$0, %xmm0, 956(%rax)
	leaq	3168(%rsp), %rax
	leaq	160(%rsp), %rcx
	call	L_poly_compress_1$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$2:
	movq	%mm2, %rax
	leaq	2208(%rsp), %rcx
	movq	$0, %rdx
	movq	$1, %rsi
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	(%rcx), %ymm1
	vmovdqu	(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	32(%rcx), %ymm1
	vmovdqu	32(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	64(%rcx), %ymm1
	vmovdqu	64(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	96(%rcx), %ymm1
	vmovdqu	96(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	128(%rcx), %ymm1
	vmovdqu	128(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	160(%rcx), %ymm1
	vmovdqu	160(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	192(%rcx), %ymm1
	vmovdqu	192(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	224(%rcx), %ymm1
	vmovdqu	224(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	256(%rcx), %ymm1
	vmovdqu	256(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	288(%rcx), %ymm1
	vmovdqu	288(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	320(%rcx), %ymm1
	vmovdqu	320(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	352(%rcx), %ymm1
	vmovdqu	352(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	384(%rcx), %ymm1
	vmovdqu	384(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	416(%rcx), %ymm1
	vmovdqu	416(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	448(%rcx), %ymm1
	vmovdqu	448(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	480(%rcx), %ymm1
	vmovdqu	480(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	512(%rcx), %ymm1
	vmovdqu	512(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	544(%rcx), %ymm1
	vmovdqu	544(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	576(%rcx), %ymm1
	vmovdqu	576(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	608(%rcx), %ymm1
	vmovdqu	608(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	640(%rcx), %ymm1
	vmovdqu	640(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	672(%rcx), %ymm1
	vmovdqu	672(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	704(%rcx), %ymm1
	vmovdqu	704(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	736(%rcx), %ymm1
	vmovdqu	736(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	768(%rcx), %ymm1
	vmovdqu	768(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	800(%rcx), %ymm1
	vmovdqu	800(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	832(%rcx), %ymm1
	vmovdqu	832(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	864(%rcx), %ymm1
	vmovdqu	864(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	896(%rcx), %ymm1
	vmovdqu	896(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	928(%rcx), %ymm1
	vmovdqu	928(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	960(%rcx), %ymm1
	vmovdqu	960(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	992(%rcx), %ymm1
	vmovdqu	992(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1024(%rcx), %ymm1
	vmovdqu	1024(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1056(%rcx), %ymm1
	vmovdqu	1056(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vptest	%ymm0, %ymm0
	cmovne	%rsi, %rdx
	negq	%rdx
	shrq	$63, %rdx
	movq	%rdx, %mm0
	movq	%mm2, %rax
	movq	%mm3, %rdx
	addq	$64, %rdx
	addq	$2304, %rdx
	movq	%mm1, %rcx
	leaq	-248(%rsp), %rsp
	call	L_shake256_M32__M32_M1088$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$1:
	leaq	248(%rsp), %rsp
	movq	%mm1, %rax
	movq	%mm0, %rcx
	leaq	96(%rsp), %rdx
	negq	%rcx
	movq	%rcx, 14048(%rsp)
	vpbroadcastq	14048(%rsp), %ymm0
	vmovdqu	(%rdx), %ymm1
	vmovdqu	(%rax), %ymm2
	vpblendvb	%ymm0, %ymm2, %ymm1, %ymm0
	vmovdqu	%ymm0, (%rax)
	xorq	%rax, %rax
	movq	14056(%rsp), %rbx
	movq	14064(%rsp), %rbp
	movq	14072(%rsp), %r12
	movq	14080(%rsp), %r13
	movq	14088(%rsp), %r14
	movq	14096(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem768_amd64_avx2_enc:
jade_kem_mlkem_mlkem768_amd64_avx2_enc:
	movq	%rsp, %rax
	leaq	-13008(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 12960(%rsp)
	movq	%rbp, 12968(%rsp)
	movq	%r12, 12976(%rsp)
	movq	%r13, 12984(%rsp)
	movq	%r14, 12992(%rsp)
	movq	%rax, 13000(%rsp)
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%rdx, %r12
	movq	%rsp, %rdi
	movq	$32, %rsi
	call	__jasmin_syscall_randombytes__
	lfence
	movq	$0, %rcx
	movq	%r12, %mm0
	movq	%rbx, %mm1
	movq	%rbp, %mm2
	movq	(%rax), %rcx
	movq	%rcx, 32(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 40(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 48(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 56(%rsp)
	leaq	64(%rsp), %rax
	call	L_sha3_256A_M1184$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$47:
	leaq	96(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$46:
	movq	%mm0, %rcx
	leaq	32(%rsp), %rax
	leaq	128(%rsp), %rdx
	movq	%rcx, %rsi
	leaq	2208(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$45:
	addq	$384, %rsi
	leaq	2720(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$44:
	addq	$384, %rsi
	leaq	3232(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$43:
	movq	$0, %rsi
	addq	$1152, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$41
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$42:
	movq	(%rcx), %rdi
	movq	%rdi, (%rsp,%rsi,8)
	addq	$8, %rcx
	incq	%rsi
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$41:
	cmpq	$4, %rsi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$42
	leaq	160(%rsp), %rcx
	call	L_poly_frommsg_1$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$40:
	movq	%rdx, %mm3
	movq	$1, %rcx
	leaq	8352(%rsp), %rax
	movq	%rsp, %rsi
	leaq	-2200(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$39:
	leaq	2200(%rsp), %rsp
	movq	%mm3, %rbx
	movb	$0, %r11b
	leaq	5280(%rsp), %rdx
	leaq	5792(%rsp), %r8
	leaq	6304(%rsp), %r9
	leaq	3744(%rsp), %r10
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$38:
	leaq	600(%rsp), %rsp
	movq	%mm3, %rbx
	movb	$4, %r11b
	leaq	4256(%rsp), %rdx
	leaq	4768(%rsp), %r8
	leaq	672(%rsp), %r9
	leaq	6816(%rsp), %r10
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$37:
	leaq	600(%rsp), %rsp
	leaq	5280(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$36:
	leaq	5792(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$35:
	leaq	6304(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$34:
	leaq	6816(%rsp), %rcx
	leaq	8352(%rsp), %rsi
	leaq	5280(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$33:
	leaq	1184(%rsp), %rcx
	leaq	8864(%rsp), %rsi
	leaq	5792(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$32:
	leaq	6816(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$31:
	leaq	1184(%rsp), %rcx
	leaq	9376(%rsp), %rsi
	leaq	6304(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$30:
	leaq	6816(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$29:
	leaq	7328(%rsp), %rcx
	leaq	9888(%rsp), %rsi
	leaq	5280(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$28:
	leaq	1184(%rsp), %rcx
	leaq	10400(%rsp), %rsi
	leaq	5792(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$27:
	leaq	7328(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$26:
	leaq	1184(%rsp), %rcx
	leaq	10912(%rsp), %rsi
	leaq	6304(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$25:
	leaq	7328(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$24:
	leaq	7840(%rsp), %rcx
	leaq	11424(%rsp), %rsi
	leaq	5280(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$23:
	leaq	1184(%rsp), %rcx
	leaq	11936(%rsp), %rsi
	leaq	5792(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$22:
	leaq	7840(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$21:
	leaq	1184(%rsp), %rcx
	leaq	12448(%rsp), %rsi
	leaq	6304(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$20:
	leaq	7840(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$19:
	leaq	1184(%rsp), %rcx
	leaq	2208(%rsp), %rsi
	leaq	5280(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$18:
	leaq	1696(%rsp), %rcx
	leaq	2720(%rsp), %rsi
	leaq	5792(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$17:
	leaq	1184(%rsp), %rcx
	leaq	1696(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$16:
	leaq	1696(%rsp), %rcx
	leaq	3232(%rsp), %rsi
	leaq	6304(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$15:
	leaq	1184(%rsp), %rcx
	leaq	1696(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$14:
	leaq	6816(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$13:
	leaq	7328(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$12:
	leaq	7840(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$11:
	leaq	1184(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$10:
	leaq	6816(%rsp), %rcx
	leaq	3744(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$9:
	leaq	7328(%rsp), %rcx
	leaq	4256(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$8:
	leaq	7840(%rsp), %rcx
	leaq	4768(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$7:
	leaq	1184(%rsp), %rcx
	leaq	672(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$6:
	leaq	1184(%rsp), %rcx
	leaq	160(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$5:
	leaq	6816(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	leaq	7328(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	leaq	7840(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	leaq	1184(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	movq	%mm1, %rax
	leaq	6816(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$4:
	leaq	7328(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$3:
	leaq	7840(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$2:
	leaq	glob_data + 928(%rip), %rcx
	vmovdqu	(%rcx), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 4972(%rip), %ymm2
	vpbroadcastw	glob_data + 4970(%rip), %ymm3
	vpbroadcastw	glob_data + 4968(%rip), %ymm4
	vpbroadcastq	glob_data + 4744(%rip), %ymm5
	vpbroadcastq	glob_data + 4736(%rip), %ymm6
	vmovdqu	glob_data + 128(%rip), %ymm7
	vmovdqu	6816(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, (%rax)
	vpextrd	$0, %xmm8, 16(%rax)
	vmovdqu	6848(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 20(%rax)
	vpextrd	$0, %xmm8, 36(%rax)
	vmovdqu	6880(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 40(%rax)
	vpextrd	$0, %xmm8, 56(%rax)
	vmovdqu	6912(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 60(%rax)
	vpextrd	$0, %xmm8, 76(%rax)
	vmovdqu	6944(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 80(%rax)
	vpextrd	$0, %xmm8, 96(%rax)
	vmovdqu	6976(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 100(%rax)
	vpextrd	$0, %xmm8, 116(%rax)
	vmovdqu	7008(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 120(%rax)
	vpextrd	$0, %xmm8, 136(%rax)
	vmovdqu	7040(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 140(%rax)
	vpextrd	$0, %xmm8, 156(%rax)
	vmovdqu	7072(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 160(%rax)
	vpextrd	$0, %xmm8, 176(%rax)
	vmovdqu	7104(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 180(%rax)
	vpextrd	$0, %xmm8, 196(%rax)
	vmovdqu	7136(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 200(%rax)
	vpextrd	$0, %xmm8, 216(%rax)
	vmovdqu	7168(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 220(%rax)
	vpextrd	$0, %xmm8, 236(%rax)
	vmovdqu	7200(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 240(%rax)
	vpextrd	$0, %xmm8, 256(%rax)
	vmovdqu	7232(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 260(%rax)
	vpextrd	$0, %xmm8, 276(%rax)
	vmovdqu	7264(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 280(%rax)
	vpextrd	$0, %xmm8, 296(%rax)
	vmovdqu	7296(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 300(%rax)
	vpextrd	$0, %xmm8, 316(%rax)
	vmovdqu	7328(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 320(%rax)
	vpextrd	$0, %xmm8, 336(%rax)
	vmovdqu	7360(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 340(%rax)
	vpextrd	$0, %xmm8, 356(%rax)
	vmovdqu	7392(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 360(%rax)
	vpextrd	$0, %xmm8, 376(%rax)
	vmovdqu	7424(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 380(%rax)
	vpextrd	$0, %xmm8, 396(%rax)
	vmovdqu	7456(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 400(%rax)
	vpextrd	$0, %xmm8, 416(%rax)
	vmovdqu	7488(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 420(%rax)
	vpextrd	$0, %xmm8, 436(%rax)
	vmovdqu	7520(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 440(%rax)
	vpextrd	$0, %xmm8, 456(%rax)
	vmovdqu	7552(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 460(%rax)
	vpextrd	$0, %xmm8, 476(%rax)
	vmovdqu	7584(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 480(%rax)
	vpextrd	$0, %xmm8, 496(%rax)
	vmovdqu	7616(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 500(%rax)
	vpextrd	$0, %xmm8, 516(%rax)
	vmovdqu	7648(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 520(%rax)
	vpextrd	$0, %xmm8, 536(%rax)
	vmovdqu	7680(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 540(%rax)
	vpextrd	$0, %xmm8, 556(%rax)
	vmovdqu	7712(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 560(%rax)
	vpextrd	$0, %xmm8, 576(%rax)
	vmovdqu	7744(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 580(%rax)
	vpextrd	$0, %xmm8, 596(%rax)
	vmovdqu	7776(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 600(%rax)
	vpextrd	$0, %xmm8, 616(%rax)
	vmovdqu	7808(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 620(%rax)
	vpextrd	$0, %xmm8, 636(%rax)
	vmovdqu	7840(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 640(%rax)
	vpextrd	$0, %xmm8, 656(%rax)
	vmovdqu	7872(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 660(%rax)
	vpextrd	$0, %xmm8, 676(%rax)
	vmovdqu	7904(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 680(%rax)
	vpextrd	$0, %xmm8, 696(%rax)
	vmovdqu	7936(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 700(%rax)
	vpextrd	$0, %xmm8, 716(%rax)
	vmovdqu	7968(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 720(%rax)
	vpextrd	$0, %xmm8, 736(%rax)
	vmovdqu	8000(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 740(%rax)
	vpextrd	$0, %xmm8, 756(%rax)
	vmovdqu	8032(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 760(%rax)
	vpextrd	$0, %xmm8, 776(%rax)
	vmovdqu	8064(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 780(%rax)
	vpextrd	$0, %xmm8, 796(%rax)
	vmovdqu	8096(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 800(%rax)
	vpextrd	$0, %xmm8, 816(%rax)
	vmovdqu	8128(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 820(%rax)
	vpextrd	$0, %xmm8, 836(%rax)
	vmovdqu	8160(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 840(%rax)
	vpextrd	$0, %xmm8, 856(%rax)
	vmovdqu	8192(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 860(%rax)
	vpextrd	$0, %xmm8, 876(%rax)
	vmovdqu	8224(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 880(%rax)
	vpextrd	$0, %xmm8, 896(%rax)
	vmovdqu	8256(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 900(%rax)
	vpextrd	$0, %xmm8, 916(%rax)
	vmovdqu	8288(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 920(%rax)
	vpextrd	$0, %xmm8, 936(%rax)
	vmovdqu	8320(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm1
	vpaddw	%ymm2, %ymm8, %ymm2
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm0
	vpsubw	%ymm2, %ymm1, %ymm2
	vpandn	%ymm2, %ymm1, %ymm1
	vpsrlw	$15, %ymm1, %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vpmulhrsw	%ymm3, %ymm0, %ymm0
	vpand	%ymm4, %ymm0, %ymm0
	vpmaddwd	%ymm5, %ymm0, %ymm0
	vpsllvd	%ymm6, %ymm0, %ymm0
	vpsrlq	$12, %ymm0, %ymm0
	vpshufb	%ymm7, %ymm0, %ymm0
	vmovdqu	%xmm0, %xmm1
	vextracti128	$1, %ymm0, %xmm0
	vpblendw	$224, %xmm0, %xmm1, %xmm1
	vmovdqu	%xmm1, 940(%rax)
	vpextrd	$0, %xmm0, 956(%rax)
	addq	$960, %rax
	leaq	1184(%rsp), %rcx
	call	L_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc$1:
	movq	%mm2, %rax
	movq	96(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	104(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	112(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	120(%rsp), %rcx
	movq	%rcx, 24(%rax)
	xorq	%rax, %rax
	movq	12960(%rsp), %rbx
	movq	12968(%rsp), %rbp
	movq	12976(%rsp), %r12
	movq	12984(%rsp), %r13
	movq	12992(%rsp), %r14
	movq	13000(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem768_amd64_avx2_keypair:
jade_kem_mlkem_mlkem768_amd64_avx2_keypair:
	movq	%rsp, %rax
	leaq	-10008(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 9960(%rsp)
	movq	%rbp, 9968(%rsp)
	movq	%r12, 9976(%rsp)
	movq	%r13, 9984(%rsp)
	movq	%r14, 9992(%rsp)
	movq	%rax, 10000(%rsp)
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	leaq	9896(%rsp), %rdi
	movq	$64, %rsi
	call	__jasmin_syscall_randombytes__
	lfence
	movq	$0, %rcx
	movq	%rax, %mm1
	movq	%rbx, %mm2
	movq	%rbp, %mm3
	movq	%rbx, %mm4
	movq	%rbp, %mm5
	movq	(%rax), %rcx
	movq	%rcx, 9824(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 9832(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 9840(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 9848(%rsp)
	movb	$3, 9856(%rsp)
	leaq	32(%rsp), %rax
	leaq	9824(%rsp), %rcx
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$38:
	movq	32(%rsp), %rax
	movq	%rax, (%rsp)
	movq	64(%rsp), %rax
	movq	%rax, 9864(%rsp)
	movq	40(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	72(%rsp), %rax
	movq	%rax, 9872(%rsp)
	movq	48(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	80(%rsp), %rax
	movq	%rax, 9880(%rsp)
	movq	56(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	88(%rsp), %rax
	movq	%rax, 9888(%rsp)
	movq	$0, %rcx
	leaq	5216(%rsp), %rax
	movq	%rsp, %rsi
	leaq	-2200(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$37:
	leaq	2200(%rsp), %rsp
	movb	$0, %r11b
	leaq	2144(%rsp), %rdx
	leaq	2656(%rsp), %r8
	leaq	3168(%rsp), %r9
	leaq	608(%rsp), %r10
	leaq	9864(%rsp), %rbx
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$36:
	leaq	600(%rsp), %rsp
	movb	$4, %r11b
	leaq	1120(%rsp), %rdx
	leaq	1632(%rsp), %r8
	leaq	3680(%rsp), %r9
	leaq	4192(%rsp), %r10
	leaq	9864(%rsp), %rbx
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$35:
	leaq	600(%rsp), %rsp
	leaq	2144(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$34:
	leaq	2656(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$33:
	leaq	3168(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$32:
	leaq	608(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$31:
	leaq	1120(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$30:
	leaq	1632(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$29:
	leaq	3680(%rsp), %rcx
	leaq	5216(%rsp), %rsi
	leaq	2144(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$28:
	leaq	96(%rsp), %rcx
	leaq	5728(%rsp), %rsi
	leaq	2656(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$27:
	leaq	3680(%rsp), %rcx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$26:
	leaq	96(%rsp), %rcx
	leaq	6240(%rsp), %rsi
	leaq	3168(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$25:
	leaq	3680(%rsp), %rcx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$24:
	leaq	3680(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$23:
	leaq	4192(%rsp), %rcx
	leaq	6752(%rsp), %rsi
	leaq	2144(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$22:
	leaq	96(%rsp), %rcx
	leaq	7264(%rsp), %rsi
	leaq	2656(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$21:
	leaq	4192(%rsp), %rcx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$20:
	leaq	96(%rsp), %rcx
	leaq	7776(%rsp), %rsi
	leaq	3168(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$19:
	leaq	4192(%rsp), %rcx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$18:
	leaq	4192(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$17:
	leaq	4704(%rsp), %rcx
	leaq	8288(%rsp), %rsi
	leaq	2144(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$16:
	leaq	96(%rsp), %rcx
	leaq	8800(%rsp), %rsi
	leaq	2656(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$15:
	leaq	4704(%rsp), %rcx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$14:
	leaq	96(%rsp), %rcx
	leaq	9312(%rsp), %rsi
	leaq	3168(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$13:
	leaq	4704(%rsp), %rcx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$12:
	leaq	4704(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$11:
	leaq	3680(%rsp), %rcx
	leaq	608(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$10:
	leaq	4192(%rsp), %rcx
	leaq	1120(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$9:
	leaq	4704(%rsp), %rcx
	leaq	1632(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$8:
	leaq	3680(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	leaq	4192(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	leaq	4704(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	movq	%mm4, %rax
	movq	%mm5, %rcx
	movq	%rcx, %rdx
	leaq	2144(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$7:
	addq	$384, %rdx
	leaq	2656(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$6:
	addq	$384, %rdx
	leaq	3168(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$5:
	movq	%rax, %rdx
	leaq	3680(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$4:
	addq	$384, %rdx
	leaq	4192(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$3:
	addq	$384, %rdx
	leaq	4704(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$2:
	addq	$1152, %rax
	movq	(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	8(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	16(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	24(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	%mm3, %rax
	addq	$1152, %rax
	movq	%mm2, %rcx
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
	movq	%rax, %mm0
	movq	%mm2, %r12
	movq	%rsp, %rax
	call	L_sha3_256A_M1184$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair$1:
	movq	%mm0, %rax
	movq	(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	8(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	16(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	24(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	%mm1, %rcx
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
	movq	9960(%rsp), %rbx
	movq	9968(%rsp), %rbp
	movq	9976(%rsp), %r12
	movq	9984(%rsp), %r13
	movq	9992(%rsp), %r14
	movq	10000(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand:
jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand:
	movq	%rsp, %rax
	leaq	-13008(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 12960(%rsp)
	movq	%rbp, 12968(%rsp)
	movq	%r12, 12976(%rsp)
	movq	%r13, 12984(%rsp)
	movq	%r14, 12992(%rsp)
	movq	%rax, 13000(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdx, %r12
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
	movq	%r12, %mm0
	movq	%rdi, %mm1
	movq	%rsi, %mm2
	movq	(%rax), %rcx
	movq	%rcx, 32(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 40(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 48(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 56(%rsp)
	leaq	64(%rsp), %rax
	call	L_sha3_256A_M1184$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$47:
	leaq	96(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$46:
	movq	%mm0, %rcx
	leaq	32(%rsp), %rax
	leaq	128(%rsp), %rdx
	movq	%rcx, %rsi
	leaq	2208(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$45:
	addq	$384, %rsi
	leaq	2720(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$44:
	addq	$384, %rsi
	leaq	3232(%rsp), %rdi
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$43:
	movq	$0, %rsi
	addq	$1152, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$41
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$42:
	movq	(%rcx), %rdi
	movq	%rdi, (%rsp,%rsi,8)
	addq	$8, %rcx
	incq	%rsi
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$41:
	cmpq	$4, %rsi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$42
	leaq	160(%rsp), %rcx
	call	L_poly_frommsg_1$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$40:
	movq	%rdx, %mm3
	movq	$1, %rcx
	leaq	8352(%rsp), %rax
	movq	%rsp, %rsi
	leaq	-2200(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$39:
	leaq	2200(%rsp), %rsp
	movq	%mm3, %rbx
	movb	$0, %r11b
	leaq	5280(%rsp), %rdx
	leaq	5792(%rsp), %r8
	leaq	6304(%rsp), %r9
	leaq	3744(%rsp), %r10
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$38:
	leaq	600(%rsp), %rsp
	movq	%mm3, %rbx
	movb	$4, %r11b
	leaq	4256(%rsp), %rdx
	leaq	4768(%rsp), %r8
	leaq	672(%rsp), %r9
	leaq	6816(%rsp), %r10
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$37:
	leaq	600(%rsp), %rsp
	leaq	5280(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$36:
	leaq	5792(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$35:
	leaq	6304(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$34:
	leaq	6816(%rsp), %rcx
	leaq	8352(%rsp), %rsi
	leaq	5280(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$33:
	leaq	1184(%rsp), %rcx
	leaq	8864(%rsp), %rsi
	leaq	5792(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$32:
	leaq	6816(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$31:
	leaq	1184(%rsp), %rcx
	leaq	9376(%rsp), %rsi
	leaq	6304(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$30:
	leaq	6816(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$29:
	leaq	7328(%rsp), %rcx
	leaq	9888(%rsp), %rsi
	leaq	5280(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$28:
	leaq	1184(%rsp), %rcx
	leaq	10400(%rsp), %rsi
	leaq	5792(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$27:
	leaq	7328(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$26:
	leaq	1184(%rsp), %rcx
	leaq	10912(%rsp), %rsi
	leaq	6304(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$25:
	leaq	7328(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$24:
	leaq	7840(%rsp), %rcx
	leaq	11424(%rsp), %rsi
	leaq	5280(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$23:
	leaq	1184(%rsp), %rcx
	leaq	11936(%rsp), %rsi
	leaq	5792(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$22:
	leaq	7840(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$21:
	leaq	1184(%rsp), %rcx
	leaq	12448(%rsp), %rsi
	leaq	6304(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$20:
	leaq	7840(%rsp), %rcx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$19:
	leaq	1184(%rsp), %rcx
	leaq	2208(%rsp), %rsi
	leaq	5280(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$18:
	leaq	1696(%rsp), %rcx
	leaq	2720(%rsp), %rsi
	leaq	5792(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$17:
	leaq	1184(%rsp), %rcx
	leaq	1696(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$16:
	leaq	1696(%rsp), %rcx
	leaq	3232(%rsp), %rsi
	leaq	6304(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$15:
	leaq	1184(%rsp), %rcx
	leaq	1696(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$14:
	leaq	6816(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$13:
	leaq	7328(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$12:
	leaq	7840(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$11:
	leaq	1184(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$10:
	leaq	6816(%rsp), %rcx
	leaq	3744(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$9:
	leaq	7328(%rsp), %rcx
	leaq	4256(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$8:
	leaq	7840(%rsp), %rcx
	leaq	4768(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$7:
	leaq	1184(%rsp), %rcx
	leaq	672(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$6:
	leaq	1184(%rsp), %rcx
	leaq	160(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$5:
	leaq	6816(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	leaq	7328(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	leaq	7840(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	leaq	1184(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	movq	%mm1, %rax
	leaq	6816(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$4:
	leaq	7328(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$3:
	leaq	7840(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$2:
	leaq	glob_data + 928(%rip), %rcx
	vmovdqu	(%rcx), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 4972(%rip), %ymm2
	vpbroadcastw	glob_data + 4970(%rip), %ymm3
	vpbroadcastw	glob_data + 4968(%rip), %ymm4
	vpbroadcastq	glob_data + 4744(%rip), %ymm5
	vpbroadcastq	glob_data + 4736(%rip), %ymm6
	vmovdqu	glob_data + 128(%rip), %ymm7
	vmovdqu	6816(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, (%rax)
	vpextrd	$0, %xmm8, 16(%rax)
	vmovdqu	6848(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 20(%rax)
	vpextrd	$0, %xmm8, 36(%rax)
	vmovdqu	6880(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 40(%rax)
	vpextrd	$0, %xmm8, 56(%rax)
	vmovdqu	6912(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 60(%rax)
	vpextrd	$0, %xmm8, 76(%rax)
	vmovdqu	6944(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 80(%rax)
	vpextrd	$0, %xmm8, 96(%rax)
	vmovdqu	6976(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 100(%rax)
	vpextrd	$0, %xmm8, 116(%rax)
	vmovdqu	7008(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 120(%rax)
	vpextrd	$0, %xmm8, 136(%rax)
	vmovdqu	7040(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 140(%rax)
	vpextrd	$0, %xmm8, 156(%rax)
	vmovdqu	7072(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 160(%rax)
	vpextrd	$0, %xmm8, 176(%rax)
	vmovdqu	7104(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 180(%rax)
	vpextrd	$0, %xmm8, 196(%rax)
	vmovdqu	7136(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 200(%rax)
	vpextrd	$0, %xmm8, 216(%rax)
	vmovdqu	7168(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 220(%rax)
	vpextrd	$0, %xmm8, 236(%rax)
	vmovdqu	7200(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 240(%rax)
	vpextrd	$0, %xmm8, 256(%rax)
	vmovdqu	7232(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 260(%rax)
	vpextrd	$0, %xmm8, 276(%rax)
	vmovdqu	7264(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 280(%rax)
	vpextrd	$0, %xmm8, 296(%rax)
	vmovdqu	7296(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 300(%rax)
	vpextrd	$0, %xmm8, 316(%rax)
	vmovdqu	7328(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 320(%rax)
	vpextrd	$0, %xmm8, 336(%rax)
	vmovdqu	7360(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 340(%rax)
	vpextrd	$0, %xmm8, 356(%rax)
	vmovdqu	7392(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 360(%rax)
	vpextrd	$0, %xmm8, 376(%rax)
	vmovdqu	7424(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 380(%rax)
	vpextrd	$0, %xmm8, 396(%rax)
	vmovdqu	7456(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 400(%rax)
	vpextrd	$0, %xmm8, 416(%rax)
	vmovdqu	7488(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 420(%rax)
	vpextrd	$0, %xmm8, 436(%rax)
	vmovdqu	7520(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 440(%rax)
	vpextrd	$0, %xmm8, 456(%rax)
	vmovdqu	7552(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 460(%rax)
	vpextrd	$0, %xmm8, 476(%rax)
	vmovdqu	7584(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 480(%rax)
	vpextrd	$0, %xmm8, 496(%rax)
	vmovdqu	7616(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 500(%rax)
	vpextrd	$0, %xmm8, 516(%rax)
	vmovdqu	7648(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 520(%rax)
	vpextrd	$0, %xmm8, 536(%rax)
	vmovdqu	7680(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 540(%rax)
	vpextrd	$0, %xmm8, 556(%rax)
	vmovdqu	7712(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 560(%rax)
	vpextrd	$0, %xmm8, 576(%rax)
	vmovdqu	7744(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 580(%rax)
	vpextrd	$0, %xmm8, 596(%rax)
	vmovdqu	7776(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 600(%rax)
	vpextrd	$0, %xmm8, 616(%rax)
	vmovdqu	7808(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 620(%rax)
	vpextrd	$0, %xmm8, 636(%rax)
	vmovdqu	7840(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 640(%rax)
	vpextrd	$0, %xmm8, 656(%rax)
	vmovdqu	7872(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 660(%rax)
	vpextrd	$0, %xmm8, 676(%rax)
	vmovdqu	7904(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 680(%rax)
	vpextrd	$0, %xmm8, 696(%rax)
	vmovdqu	7936(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 700(%rax)
	vpextrd	$0, %xmm8, 716(%rax)
	vmovdqu	7968(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 720(%rax)
	vpextrd	$0, %xmm8, 736(%rax)
	vmovdqu	8000(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 740(%rax)
	vpextrd	$0, %xmm8, 756(%rax)
	vmovdqu	8032(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 760(%rax)
	vpextrd	$0, %xmm8, 776(%rax)
	vmovdqu	8064(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 780(%rax)
	vpextrd	$0, %xmm8, 796(%rax)
	vmovdqu	8096(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 800(%rax)
	vpextrd	$0, %xmm8, 816(%rax)
	vmovdqu	8128(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 820(%rax)
	vpextrd	$0, %xmm8, 836(%rax)
	vmovdqu	8160(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 840(%rax)
	vpextrd	$0, %xmm8, 856(%rax)
	vmovdqu	8192(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 860(%rax)
	vpextrd	$0, %xmm8, 876(%rax)
	vmovdqu	8224(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 880(%rax)
	vpextrd	$0, %xmm8, 896(%rax)
	vmovdqu	8256(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 900(%rax)
	vpextrd	$0, %xmm8, 916(%rax)
	vmovdqu	8288(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm9
	vpaddw	%ymm2, %ymm8, %ymm10
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm9, %ymm10
	vpandn	%ymm10, %ymm9, %ymm9
	vpsrlw	$15, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm8, %ymm8
	vpmulhrsw	%ymm3, %ymm8, %ymm8
	vpand	%ymm4, %ymm8, %ymm8
	vpmaddwd	%ymm5, %ymm8, %ymm8
	vpsllvd	%ymm6, %ymm8, %ymm8
	vpsrlq	$12, %ymm8, %ymm8
	vpshufb	%ymm7, %ymm8, %ymm8
	vmovdqu	%xmm8, %xmm9
	vextracti128	$1, %ymm8, %xmm8
	vpblendw	$224, %xmm8, %xmm9, %xmm9
	vmovdqu	%xmm9, 920(%rax)
	vpextrd	$0, %xmm8, 936(%rax)
	vmovdqu	8320(%rsp), %ymm8
	vpmullw	%ymm1, %ymm8, %ymm1
	vpaddw	%ymm2, %ymm8, %ymm2
	vpsllw	$3, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm8, %ymm0
	vpsubw	%ymm2, %ymm1, %ymm2
	vpandn	%ymm2, %ymm1, %ymm1
	vpsrlw	$15, %ymm1, %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vpmulhrsw	%ymm3, %ymm0, %ymm0
	vpand	%ymm4, %ymm0, %ymm0
	vpmaddwd	%ymm5, %ymm0, %ymm0
	vpsllvd	%ymm6, %ymm0, %ymm0
	vpsrlq	$12, %ymm0, %ymm0
	vpshufb	%ymm7, %ymm0, %ymm0
	vmovdqu	%xmm0, %xmm1
	vextracti128	$1, %ymm0, %xmm0
	vpblendw	$224, %xmm0, %xmm1, %xmm1
	vmovdqu	%xmm1, 940(%rax)
	vpextrd	$0, %xmm0, 956(%rax)
	addq	$960, %rax
	leaq	1184(%rsp), %rcx
	call	L_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$1:
	movq	%mm2, %rax
	movq	96(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	104(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	112(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	120(%rsp), %rcx
	movq	%rcx, 24(%rax)
	xorq	%rax, %rax
	movq	12960(%rsp), %rbx
	movq	12968(%rsp), %rbp
	movq	12976(%rsp), %r12
	movq	12984(%rsp), %r13
	movq	12992(%rsp), %r14
	movq	13000(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand:
jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand:
	movq	%rsp, %rax
	leaq	-10008(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 9960(%rsp)
	movq	%rbp, 9968(%rsp)
	movq	%r12, 9976(%rsp)
	movq	%r13, 9984(%rsp)
	movq	%r14, 9992(%rsp)
	movq	%rax, 10000(%rsp)
	lfence
	movq	$0, %rax
	movb	(%rdx), %al
	movb	%al, 9896(%rsp)
	movb	1(%rdx), %al
	movb	%al, 9897(%rsp)
	movb	2(%rdx), %al
	movb	%al, 9898(%rsp)
	movb	3(%rdx), %al
	movb	%al, 9899(%rsp)
	movb	4(%rdx), %al
	movb	%al, 9900(%rsp)
	movb	5(%rdx), %al
	movb	%al, 9901(%rsp)
	movb	6(%rdx), %al
	movb	%al, 9902(%rsp)
	movb	7(%rdx), %al
	movb	%al, 9903(%rsp)
	movb	8(%rdx), %al
	movb	%al, 9904(%rsp)
	movb	9(%rdx), %al
	movb	%al, 9905(%rsp)
	movb	10(%rdx), %al
	movb	%al, 9906(%rsp)
	movb	11(%rdx), %al
	movb	%al, 9907(%rsp)
	movb	12(%rdx), %al
	movb	%al, 9908(%rsp)
	movb	13(%rdx), %al
	movb	%al, 9909(%rsp)
	movb	14(%rdx), %al
	movb	%al, 9910(%rsp)
	movb	15(%rdx), %al
	movb	%al, 9911(%rsp)
	movb	16(%rdx), %al
	movb	%al, 9912(%rsp)
	movb	17(%rdx), %al
	movb	%al, 9913(%rsp)
	movb	18(%rdx), %al
	movb	%al, 9914(%rsp)
	movb	19(%rdx), %al
	movb	%al, 9915(%rsp)
	movb	20(%rdx), %al
	movb	%al, 9916(%rsp)
	movb	21(%rdx), %al
	movb	%al, 9917(%rsp)
	movb	22(%rdx), %al
	movb	%al, 9918(%rsp)
	movb	23(%rdx), %al
	movb	%al, 9919(%rsp)
	movb	24(%rdx), %al
	movb	%al, 9920(%rsp)
	movb	25(%rdx), %al
	movb	%al, 9921(%rsp)
	movb	26(%rdx), %al
	movb	%al, 9922(%rsp)
	movb	27(%rdx), %al
	movb	%al, 9923(%rsp)
	movb	28(%rdx), %al
	movb	%al, 9924(%rsp)
	movb	29(%rdx), %al
	movb	%al, 9925(%rsp)
	movb	30(%rdx), %al
	movb	%al, 9926(%rsp)
	movb	31(%rdx), %al
	movb	%al, 9927(%rsp)
	movb	32(%rdx), %al
	movb	%al, 9928(%rsp)
	movb	33(%rdx), %al
	movb	%al, 9929(%rsp)
	movb	34(%rdx), %al
	movb	%al, 9930(%rsp)
	movb	35(%rdx), %al
	movb	%al, 9931(%rsp)
	movb	36(%rdx), %al
	movb	%al, 9932(%rsp)
	movb	37(%rdx), %al
	movb	%al, 9933(%rsp)
	movb	38(%rdx), %al
	movb	%al, 9934(%rsp)
	movb	39(%rdx), %al
	movb	%al, 9935(%rsp)
	movb	40(%rdx), %al
	movb	%al, 9936(%rsp)
	movb	41(%rdx), %al
	movb	%al, 9937(%rsp)
	movb	42(%rdx), %al
	movb	%al, 9938(%rsp)
	movb	43(%rdx), %al
	movb	%al, 9939(%rsp)
	movb	44(%rdx), %al
	movb	%al, 9940(%rsp)
	movb	45(%rdx), %al
	movb	%al, 9941(%rsp)
	movb	46(%rdx), %al
	movb	%al, 9942(%rsp)
	movb	47(%rdx), %al
	movb	%al, 9943(%rsp)
	movb	48(%rdx), %al
	movb	%al, 9944(%rsp)
	movb	49(%rdx), %al
	movb	%al, 9945(%rsp)
	movb	50(%rdx), %al
	movb	%al, 9946(%rsp)
	movb	51(%rdx), %al
	movb	%al, 9947(%rsp)
	movb	52(%rdx), %al
	movb	%al, 9948(%rsp)
	movb	53(%rdx), %al
	movb	%al, 9949(%rsp)
	movb	54(%rdx), %al
	movb	%al, 9950(%rsp)
	movb	55(%rdx), %al
	movb	%al, 9951(%rsp)
	movb	56(%rdx), %al
	movb	%al, 9952(%rsp)
	movb	57(%rdx), %al
	movb	%al, 9953(%rsp)
	movb	58(%rdx), %al
	movb	%al, 9954(%rsp)
	movb	59(%rdx), %al
	movb	%al, 9955(%rsp)
	movb	60(%rdx), %al
	movb	%al, 9956(%rsp)
	movb	61(%rdx), %al
	movb	%al, 9957(%rsp)
	movb	62(%rdx), %al
	movb	%al, 9958(%rsp)
	movb	63(%rdx), %al
	movb	%al, 9959(%rsp)
	leaq	9896(%rsp), %rax
	movq	%rax, %mm1
	movq	%rdi, %mm2
	movq	%rsi, %mm3
	movq	%rdi, %mm4
	movq	%rsi, %mm5
	movq	(%rax), %rcx
	movq	%rcx, 9824(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 9832(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 9840(%rsp)
	movq	24(%rax), %rax
	movq	%rax, 9848(%rsp)
	movb	$3, 9856(%rsp)
	leaq	32(%rsp), %rax
	leaq	9824(%rsp), %rcx
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$38:
	movq	32(%rsp), %rax
	movq	%rax, (%rsp)
	movq	64(%rsp), %rax
	movq	%rax, 9864(%rsp)
	movq	40(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	72(%rsp), %rax
	movq	%rax, 9872(%rsp)
	movq	48(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	80(%rsp), %rax
	movq	%rax, 9880(%rsp)
	movq	56(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	88(%rsp), %rax
	movq	%rax, 9888(%rsp)
	movq	$0, %rcx
	leaq	5216(%rsp), %rax
	movq	%rsp, %rsi
	leaq	-2200(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$37:
	leaq	2200(%rsp), %rsp
	movb	$0, %r11b
	leaq	2144(%rsp), %rdx
	leaq	2656(%rsp), %r8
	leaq	3168(%rsp), %r9
	leaq	608(%rsp), %r10
	leaq	9864(%rsp), %rbx
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$36:
	leaq	600(%rsp), %rsp
	movb	$4, %r11b
	leaq	1120(%rsp), %rdx
	leaq	1632(%rsp), %r8
	leaq	3680(%rsp), %r9
	leaq	4192(%rsp), %r10
	leaq	9864(%rsp), %rbx
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$35:
	leaq	600(%rsp), %rsp
	leaq	2144(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$34:
	leaq	2656(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$33:
	leaq	3168(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$32:
	leaq	608(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$31:
	leaq	1120(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$30:
	leaq	1632(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$29:
	leaq	3680(%rsp), %rcx
	leaq	5216(%rsp), %rsi
	leaq	2144(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$28:
	leaq	96(%rsp), %rcx
	leaq	5728(%rsp), %rsi
	leaq	2656(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$27:
	leaq	3680(%rsp), %rcx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$26:
	leaq	96(%rsp), %rcx
	leaq	6240(%rsp), %rsi
	leaq	3168(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$25:
	leaq	3680(%rsp), %rcx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$24:
	leaq	3680(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$23:
	leaq	4192(%rsp), %rcx
	leaq	6752(%rsp), %rsi
	leaq	2144(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$22:
	leaq	96(%rsp), %rcx
	leaq	7264(%rsp), %rsi
	leaq	2656(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$21:
	leaq	4192(%rsp), %rcx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$20:
	leaq	96(%rsp), %rcx
	leaq	7776(%rsp), %rsi
	leaq	3168(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$19:
	leaq	4192(%rsp), %rcx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$18:
	leaq	4192(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$17:
	leaq	4704(%rsp), %rcx
	leaq	8288(%rsp), %rsi
	leaq	2144(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$16:
	leaq	96(%rsp), %rcx
	leaq	8800(%rsp), %rsi
	leaq	2656(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$15:
	leaq	4704(%rsp), %rcx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$14:
	leaq	96(%rsp), %rcx
	leaq	9312(%rsp), %rsi
	leaq	3168(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$13:
	leaq	4704(%rsp), %rcx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$12:
	leaq	4704(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$11:
	leaq	3680(%rsp), %rcx
	leaq	608(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$10:
	leaq	4192(%rsp), %rcx
	leaq	1120(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$9:
	leaq	4704(%rsp), %rcx
	leaq	1632(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$8:
	leaq	3680(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	leaq	4192(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	leaq	4704(%rsp), %rax
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rax)
	vmovdqu	32(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rax)
	vmovdqu	64(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	96(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	128(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rax)
	vmovdqu	160(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 160(%rax)
	vmovdqu	192(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 192(%rax)
	vmovdqu	224(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 256(%rax)
	vmovdqu	288(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rax)
	vmovdqu	320(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	352(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	384(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 384(%rax)
	vmovdqu	416(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 416(%rax)
	vmovdqu	448(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	480(%rax), %ymm2
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	movq	%mm4, %rax
	movq	%mm5, %rcx
	movq	%rcx, %rdx
	leaq	2144(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$7:
	addq	$384, %rdx
	leaq	2656(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$6:
	addq	$384, %rdx
	leaq	3168(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$5:
	movq	%rax, %rdx
	leaq	3680(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$4:
	addq	$384, %rdx
	leaq	4192(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$3:
	addq	$384, %rdx
	leaq	4704(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$2:
	addq	$1152, %rax
	movq	(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	8(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	16(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	24(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	%mm3, %rax
	addq	$1152, %rax
	movq	%mm2, %rcx
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
	movq	%rax, %mm0
	movq	%mm2, %r12
	movq	%rsp, %rax
	call	L_sha3_256A_M1184$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$1:
	movq	%mm0, %rax
	movq	(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	8(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	16(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	24(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$8, %rax
	movq	%mm1, %rcx
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
	movq	9960(%rsp), %rbx
	movq	9968(%rsp), %rbp
	movq	9976(%rsp), %r12
	movq	9984(%rsp), %r13
	movq	9992(%rsp), %r14
	movq	10000(%rsp), %rsp
	ret
L_gen_matrix_avx2$1:
	movq	%rcx, %mm0
	leaq	32(%rsp), %rdi
	movq	$0, %r9
	movq	%rax, %rcx
	movq	%mm0, %rdx
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$15:
	leaq	856(%rsp), %rsp
	movq	$8, %r9
	leaq	2048(%rax), %rcx
	movq	%mm0, %rdx
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$14:
	leaq	856(%rsp), %rsp
	leaq	4096(%rax), %r9
	movw	$514, %cx
	movq	%rdi, %rdx
	movw	%cx, 2176(%rsp)
	leaq	2176(%rsp), %rcx
	leaq	-248(%rsp), %rsp
	call	L_shake128_absorb_A32_A2$1
L_gen_matrix_avx2$13:
	leaq	248(%rsp), %rsp
	call	L_shake128_squeeze3blocks$1
L_gen_matrix_avx2$12:
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_avx2$11:
	movq	%rax, %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$10:
	leaq	512(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$9:
	leaq	1024(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$8:
	leaq	1536(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$7:
	leaq	2048(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$6:
	leaq	2560(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$5:
	leaq	3072(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$4:
	leaq	3584(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$3:
	leaq	4096(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$2:
	ret
L_gen_matrix_sample_four_polynomials$1:
	leaq	glob_data + 2656(%rip), %r8
	shlq	$4, %rdx
	addq	%rdx, %r9
	movq	(%r8,%r9), %rdx
	movq	%rdx, 832(%rsp)
	leaq	32(%rsp), %rdx
	leaq	832(%rsp), %r10
	call	L_shake128x4_absorb_A32_A2$1
L_gen_matrix_sample_four_polynomials$7:
	leaq	-24(%rsp), %rsp
	call	L_shake128x4_squeeze3blocks$1
L_gen_matrix_sample_four_polynomials$6:
	leaq	24(%rsp), %rsp
	movq	%rcx, %r9
	movq	%rdi, %rdx
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$5:
	leaq	512(%rcx), %r9
	leaq	536(%rdi), %rdx
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$4:
	leaq	1024(%rcx), %r9
	leaq	1072(%rdi), %rdx
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$3:
	leaq	1536(%rcx), %r9
	leaq	1608(%rdi), %rdx
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$2:
	ret
L__gen_matrix_fill_polynomial$1:
	movq	$0, %r8
	movq	$0, %rbx
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
	cmpq	$256, %rbx
	jb  	L__gen_matrix_fill_polynomial$3
	ret
L_gen_matrix_buf_rejection$1:
	lfence
	movq	$0, %r10
	vmovdqu	glob_data + 96(%rip), %ymm0
	vmovdqu	glob_data + 32(%rip), %ymm1
	vmovdqu	glob_data + 0(%rip), %ymm2
	vmovdqu	glob_data + 64(%rip), %ymm3
	leaq	glob_data + 2688(%rip), %r11
	movq	%r8, 8(%rsp)
	movq	%r8, %r12
	jmp 	L_gen_matrix_buf_rejection$22
L_gen_matrix_buf_rejection$23:
	movq	$-1, %rbp
	cmovnb	%rbp, %r10
	cmpq	$225, %rbx
	jb  	L_gen_matrix_buf_rejection$24
	movq	$-1, %rbp
	cmovb	%rbp, %r10
	movq	$504, %r12
	jmp 	L_gen_matrix_buf_rejection$22
L_gen_matrix_buf_rejection$24:
	movq	$-1, %rbp
	cmovnb	%rbp, %r10
	vpermq	$148, (%rdx,%r12), %ymm4
	vpermq	$148, 24(%rdx,%r12), %ymm5
	vpshufb	%ymm0, %ymm4, %ymm4
	vpshufb	%ymm0, %ymm5, %ymm5
	vpsrlw	$4, %ymm4, %ymm6
	vpsrlw	$4, %ymm5, %ymm7
	vpblendw	$170, %ymm6, %ymm4, %ymm4
	vpblendw	$170, %ymm7, %ymm5, %ymm5
	vpand	%ymm1, %ymm4, %ymm4
	vpand	%ymm1, %ymm5, %ymm5
	vpcmpgtw	%ymm4, %ymm2, %ymm6
	vpcmpgtw	%ymm5, %ymm2, %ymm7
	vpacksswb	%ymm7, %ymm6, %ymm6
	vpmovmskb	%ymm6, %rbp
	orq 	%r10, %rbp
	movq	%rbp, %r12
	andq	$255, %r12
	vmovq	(%r11,%r12,8), %xmm6
	popcnt	%r12, %r12
	addq	%rbx, %r12
	movq	%rbp, %r13
	shrq	$16, %r13
	andq	$255, %r13
	vmovq	(%r11,%r13,8), %xmm7
	popcnt	%r13, %r13
	addq	%r12, %r13
	movq	%rbp, %r14
	shrq	$8, %r14
	andq	$255, %r14
	vmovq	(%r11,%r14,8), %xmm8
	popcnt	%r14, %r14
	addq	%r13, %r14
	shrq	$24, %rbp
	andq	$255, %rbp
	vmovq	(%r11,%rbp,8), %xmm9
	popcnt	%rbp, %rbp
	addq	%r14, %rbp
	vinserti128	$1, %xmm7, %ymm6, %ymm6
	vinserti128	$1, %xmm9, %ymm8, %ymm7
	vpaddb	%ymm3, %ymm6, %ymm8
	vpunpcklbw	%ymm8, %ymm6, %ymm6
	vpaddb	%ymm3, %ymm7, %ymm8
	vpunpcklbw	%ymm8, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm4, %ymm4
	vpshufb	%ymm7, %ymm5, %ymm5
	vmovdqu	%xmm4, (%r9,%rbx,2)
	vextracti128	$1, %ymm4, (%r9,%r12,2)
	vmovdqu	%xmm5, (%r9,%r13,2)
	vextracti128	$1, %ymm5, (%r9,%r14,2)
	movq	%rbp, %rbx
	addq	$48, 8(%rsp)
	movq	8(%rsp), %r12
	orq 	%r10, %r12
L_gen_matrix_buf_rejection$25:
L_gen_matrix_buf_rejection$22:
	cmpq	$457, %r12
	jb  	L_gen_matrix_buf_rejection$23
	movq	$-1, %rbp
	cmovb	%rbp, %r10
	movq	8(%rsp), %rbp
	orq 	%r10, %rbp
	jmp 	L_gen_matrix_buf_rejection$2
L_gen_matrix_buf_rejection$3:
	movq	$-1, %r12
	cmovnb	%r12, %r10
	cmpq	$256, %rbx
	jb  	L_gen_matrix_buf_rejection$4
	movq	$-1, %rbp
	cmovb	%rbp, %r10
	movq	$504, %rbp
	jmp 	L_gen_matrix_buf_rejection$2
L_gen_matrix_buf_rejection$4:
	movq	$-1, %r12
	cmovnb	%r12, %r10
	movq	%rbp, 8(%rsp)
	vpermq	$148, (%rdx,%rbp), %ymm4
	vpshufb	%ymm0, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpblendw	$170, %ymm5, %ymm4, %ymm4
	vpand	%ymm1, %ymm4, %ymm4
	vpcmpgtw	%ymm4, %ymm2, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	vpacksswb	%ymm6, %ymm5, %ymm5
	vpmovmskb	%ymm5, %r12
	orq 	%r10, %r12
	movq	%r12, %rbp
	andq	$255, %rbp
	vmovq	(%r11,%rbp,8), %xmm5
	popcnt	%rbp, %rbp
	addq	%rbx, %rbp
	shrq	$16, %r12
	andq	$255, %r12
	vmovq	(%r11,%r12,8), %xmm6
	popcnt	%r12, %r12
	addq	%rbp, %r12
	vinserti128	$1, %xmm6, %ymm5, %ymm5
	vpaddb	%ymm3, %ymm5, %ymm6
	vpunpcklbw	%ymm6, %ymm5, %ymm5
	vpshufb	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm4, %xmm5
	cmpq	$248, %rbx
	jbe 	L_gen_matrix_buf_rejection$14
	movq	$-1, %r13
	cmovbe	%r13, %r10
	movq	%xmm5, %r13
	cmpq	$252, %rbx
	jbe 	L_gen_matrix_buf_rejection$20
	movq	$-1, %r14
	cmovbe	%r14, %r10
	jmp 	L_gen_matrix_buf_rejection$21
L_gen_matrix_buf_rejection$20:
	movq	$-1, %r14
	cmovnbe	%r14, %r10
	movq	%r13, (%r9,%rbx,2)
	vpextrq	$1, %xmm5, %r13
	addq	$4, %rbx
L_gen_matrix_buf_rejection$21:
	cmpq	$254, %rbx
	jbe 	L_gen_matrix_buf_rejection$18
	movq	$-1, %r14
	cmovbe	%r14, %r10
	jmp 	L_gen_matrix_buf_rejection$19
L_gen_matrix_buf_rejection$18:
	movq	$-1, %r14
	cmovnbe	%r14, %r10
	movl	%r13d, (%r9,%rbx,2)
	shrq	$32, %r13
	addq	$2, %rbx
L_gen_matrix_buf_rejection$19:
	cmpq	$255, %rbx
	jbe 	L_gen_matrix_buf_rejection$16
	movq	$-1, %rbx
	cmovbe	%rbx, %r10
	jmp 	L_gen_matrix_buf_rejection$15
L_gen_matrix_buf_rejection$16:
	movq	$-1, %r14
	cmovnbe	%r14, %r10
	movw	%r13w, (%r9,%rbx,2)
L_gen_matrix_buf_rejection$17:
	jmp 	L_gen_matrix_buf_rejection$15
L_gen_matrix_buf_rejection$14:
	movq	$-1, %r13
	cmovnbe	%r13, %r10
	vmovdqu	%xmm5, (%r9,%rbx,2)
L_gen_matrix_buf_rejection$15:
	vextracti128	$1, %ymm4, %xmm4
	cmpq	$248, %rbp
	jbe 	L_gen_matrix_buf_rejection$6
	movq	$-1, %rbx
	cmovbe	%rbx, %r10
	movq	%xmm4, %rbx
	cmpq	$252, %rbp
	jbe 	L_gen_matrix_buf_rejection$12
	movq	$-1, %r13
	cmovbe	%r13, %r10
	jmp 	L_gen_matrix_buf_rejection$13
L_gen_matrix_buf_rejection$12:
	movq	$-1, %r13
	cmovnbe	%r13, %r10
	movq	%rbx, (%r9,%rbp,2)
	vpextrq	$1, %xmm4, %rbx
	addq	$4, %rbp
L_gen_matrix_buf_rejection$13:
	cmpq	$254, %rbp
	jbe 	L_gen_matrix_buf_rejection$10
	movq	$-1, %r13
	cmovbe	%r13, %r10
	jmp 	L_gen_matrix_buf_rejection$11
L_gen_matrix_buf_rejection$10:
	movq	$-1, %r13
	cmovnbe	%r13, %r10
	movl	%ebx, (%r9,%rbp,2)
	shrq	$32, %rbx
	addq	$2, %rbp
L_gen_matrix_buf_rejection$11:
	cmpq	$255, %rbp
	jbe 	L_gen_matrix_buf_rejection$8
	movq	$-1, %rbx
	cmovbe	%rbx, %r10
	jmp 	L_gen_matrix_buf_rejection$7
L_gen_matrix_buf_rejection$8:
	movq	$-1, %r13
	cmovnbe	%r13, %r10
	movw	%bx, (%r9,%rbp,2)
L_gen_matrix_buf_rejection$9:
	jmp 	L_gen_matrix_buf_rejection$7
L_gen_matrix_buf_rejection$6:
	movq	$-1, %rbx
	cmovnbe	%rbx, %r10
	vmovdqu	%xmm4, (%r9,%rbp,2)
L_gen_matrix_buf_rejection$7:
	movq	%r12, %rbx
	movq	8(%rsp), %rbp
	orq 	%r10, %rbp
	addq	$24, %rbp
L_gen_matrix_buf_rejection$5:
L_gen_matrix_buf_rejection$2:
	cmpq	$481, %rbp
	jb  	L_gen_matrix_buf_rejection$3
	ret
L_poly_decompress$1:
	leaq	glob_data + 992(%rip), %rdi
	vmovdqu	(%rdi), %ymm0
	leaq	glob_data + 192(%rip), %rdi
	vmovdqu	(%rdi), %ymm1
	vpbroadcastd	glob_data + 4964(%rip), %ymm2
	vpbroadcastd	glob_data + 4960(%rip), %ymm3
	movq	(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, (%rcx)
	movq	8(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 32(%rcx)
	movq	16(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 64(%rcx)
	movq	24(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 96(%rcx)
	movq	32(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 128(%rcx)
	movq	40(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 160(%rcx)
	movq	48(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 192(%rcx)
	movq	56(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 224(%rcx)
	movq	64(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 256(%rcx)
	movq	72(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 288(%rcx)
	movq	80(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 320(%rcx)
	movq	88(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 352(%rcx)
	movq	96(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 384(%rcx)
	movq	104(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 416(%rcx)
	movq	112(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 448(%rcx)
	movq	120(%rsi), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm1
	vpand	%ymm2, %ymm1, %ymm1
	vpmullw	%ymm3, %ymm1, %ymm1
	vpmulhrsw	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, 480(%rcx)
	ret
L_poly_compress_1$1:
	call	L_poly_csubq$1
L_poly_compress_1$2:
	leaq	glob_data + 928(%rip), %rdx
	vmovdqu	(%rdx), %ymm0
	vpbroadcastw	glob_data + 4978(%rip), %ymm1
	vpbroadcastw	glob_data + 4976(%rip), %ymm2
	vpbroadcastw	glob_data + 4974(%rip), %ymm3
	vmovdqu	glob_data + 224(%rip), %ymm4
	vmovdqu	(%rcx), %ymm5
	vmovdqu	32(%rcx), %ymm6
	vmovdqu	64(%rcx), %ymm7
	vmovdqu	96(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm5, %ymm5
	vpmulhrsw	%ymm1, %ymm6, %ymm6
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm5, %ymm5
	vpand	%ymm2, %ymm6, %ymm6
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpackuswb	%ymm8, %ymm7, %ymm6
	vpmaddubsw	%ymm3, %ymm5, %ymm5
	vpmaddubsw	%ymm3, %ymm6, %ymm6
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpermd	%ymm5, %ymm4, %ymm5
	vmovdqu	%ymm5, (%rax)
	vmovdqu	128(%rcx), %ymm5
	vmovdqu	160(%rcx), %ymm6
	vmovdqu	192(%rcx), %ymm7
	vmovdqu	224(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm5, %ymm5
	vpmulhrsw	%ymm1, %ymm6, %ymm6
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm5, %ymm5
	vpand	%ymm2, %ymm6, %ymm6
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpackuswb	%ymm8, %ymm7, %ymm6
	vpmaddubsw	%ymm3, %ymm5, %ymm5
	vpmaddubsw	%ymm3, %ymm6, %ymm6
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpermd	%ymm5, %ymm4, %ymm5
	vmovdqu	%ymm5, 32(%rax)
	vmovdqu	256(%rcx), %ymm5
	vmovdqu	288(%rcx), %ymm6
	vmovdqu	320(%rcx), %ymm7
	vmovdqu	352(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm5, %ymm5
	vpmulhrsw	%ymm1, %ymm6, %ymm6
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm5, %ymm5
	vpand	%ymm2, %ymm6, %ymm6
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpackuswb	%ymm8, %ymm7, %ymm6
	vpmaddubsw	%ymm3, %ymm5, %ymm5
	vpmaddubsw	%ymm3, %ymm6, %ymm6
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpermd	%ymm5, %ymm4, %ymm5
	vmovdqu	%ymm5, 64(%rax)
	vmovdqu	384(%rcx), %ymm5
	vmovdqu	416(%rcx), %ymm6
	vmovdqu	448(%rcx), %ymm7
	vmovdqu	480(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm0
	vpmulhrsw	%ymm1, %ymm5, %ymm5
	vpmulhrsw	%ymm1, %ymm6, %ymm6
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm0, %ymm0
	vpand	%ymm2, %ymm5, %ymm1
	vpand	%ymm2, %ymm6, %ymm5
	vpand	%ymm2, %ymm7, %ymm6
	vpand	%ymm2, %ymm0, %ymm0
	vpackuswb	%ymm5, %ymm1, %ymm1
	vpackuswb	%ymm0, %ymm6, %ymm0
	vpmaddubsw	%ymm3, %ymm1, %ymm1
	vpmaddubsw	%ymm3, %ymm0, %ymm0
	vpackuswb	%ymm0, %ymm1, %ymm0
	vpermd	%ymm0, %ymm4, %ymm0
	vmovdqu	%ymm0, 96(%rax)
	ret
L_poly_compress$1:
	call	L_poly_csubq$1
L_poly_compress$2:
	leaq	glob_data + 928(%rip), %rdx
	vmovdqu	(%rdx), %ymm0
	vpbroadcastw	glob_data + 4978(%rip), %ymm1
	vpbroadcastw	glob_data + 4976(%rip), %ymm2
	vpbroadcastw	glob_data + 4974(%rip), %ymm3
	vmovdqu	glob_data + 224(%rip), %ymm4
	vmovdqu	(%rcx), %ymm5
	vmovdqu	32(%rcx), %ymm6
	vmovdqu	64(%rcx), %ymm7
	vmovdqu	96(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm5, %ymm5
	vpmulhrsw	%ymm1, %ymm6, %ymm6
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm5, %ymm5
	vpand	%ymm2, %ymm6, %ymm6
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpackuswb	%ymm8, %ymm7, %ymm6
	vpmaddubsw	%ymm3, %ymm5, %ymm5
	vpmaddubsw	%ymm3, %ymm6, %ymm6
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpermd	%ymm5, %ymm4, %ymm5
	vmovdqu	%ymm5, (%rax)
	vmovdqu	128(%rcx), %ymm5
	vmovdqu	160(%rcx), %ymm6
	vmovdqu	192(%rcx), %ymm7
	vmovdqu	224(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm5, %ymm5
	vpmulhrsw	%ymm1, %ymm6, %ymm6
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm5, %ymm5
	vpand	%ymm2, %ymm6, %ymm6
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpackuswb	%ymm8, %ymm7, %ymm6
	vpmaddubsw	%ymm3, %ymm5, %ymm5
	vpmaddubsw	%ymm3, %ymm6, %ymm6
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpermd	%ymm5, %ymm4, %ymm5
	vmovdqu	%ymm5, 32(%rax)
	vmovdqu	256(%rcx), %ymm5
	vmovdqu	288(%rcx), %ymm6
	vmovdqu	320(%rcx), %ymm7
	vmovdqu	352(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm5, %ymm5
	vpmulhrsw	%ymm1, %ymm6, %ymm6
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm5, %ymm5
	vpand	%ymm2, %ymm6, %ymm6
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpackuswb	%ymm8, %ymm7, %ymm6
	vpmaddubsw	%ymm3, %ymm5, %ymm5
	vpmaddubsw	%ymm3, %ymm6, %ymm6
	vpackuswb	%ymm6, %ymm5, %ymm5
	vpermd	%ymm5, %ymm4, %ymm5
	vmovdqu	%ymm5, 64(%rax)
	vmovdqu	384(%rcx), %ymm5
	vmovdqu	416(%rcx), %ymm6
	vmovdqu	448(%rcx), %ymm7
	vmovdqu	480(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm0
	vpmulhrsw	%ymm1, %ymm5, %ymm5
	vpmulhrsw	%ymm1, %ymm6, %ymm6
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm0, %ymm0
	vpand	%ymm2, %ymm5, %ymm1
	vpand	%ymm2, %ymm6, %ymm5
	vpand	%ymm2, %ymm7, %ymm6
	vpand	%ymm2, %ymm0, %ymm0
	vpackuswb	%ymm5, %ymm1, %ymm1
	vpackuswb	%ymm0, %ymm6, %ymm0
	vpmaddubsw	%ymm3, %ymm1, %ymm1
	vpmaddubsw	%ymm3, %ymm0, %ymm0
	vpackuswb	%ymm0, %ymm1, %ymm0
	vpermd	%ymm0, %ymm4, %ymm0
	vmovdqu	%ymm0, 96(%rax)
	ret
L_poly_tomsg_1$1:
	call	L_poly_csubq$1
L_poly_tomsg_1$2:
	leaq	glob_data + 768(%rip), %rsi
	vmovdqu	(%rsi), %ymm0
	leaq	glob_data + 736(%rip), %rsi
	vmovdqu	(%rsi), %ymm1
	vmovdqu	(%rcx), %ymm2
	vmovdqu	32(%rcx), %ymm3
	vpsubw	%ymm2, %ymm0, %ymm2
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsraw	$15, %ymm2, %ymm4
	vpsraw	$15, %ymm3, %ymm5
	vpxor	%ymm4, %ymm2, %ymm2
	vpxor	%ymm5, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm2, %ymm2
	vpsubw	%ymm1, %ymm3, %ymm3
	vpacksswb	%ymm3, %ymm2, %ymm2
	vpermq	$216, %ymm2, %ymm2
	vpmovmskb	%ymm2, %esi
	movl	%esi, (%rax)
	vmovdqu	64(%rcx), %ymm2
	vmovdqu	96(%rcx), %ymm3
	vpsubw	%ymm2, %ymm0, %ymm2
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsraw	$15, %ymm2, %ymm4
	vpsraw	$15, %ymm3, %ymm5
	vpxor	%ymm4, %ymm2, %ymm2
	vpxor	%ymm5, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm2, %ymm2
	vpsubw	%ymm1, %ymm3, %ymm3
	vpacksswb	%ymm3, %ymm2, %ymm2
	vpermq	$216, %ymm2, %ymm2
	vpmovmskb	%ymm2, %esi
	movl	%esi, 4(%rax)
	vmovdqu	128(%rcx), %ymm2
	vmovdqu	160(%rcx), %ymm3
	vpsubw	%ymm2, %ymm0, %ymm2
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsraw	$15, %ymm2, %ymm4
	vpsraw	$15, %ymm3, %ymm5
	vpxor	%ymm4, %ymm2, %ymm2
	vpxor	%ymm5, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm2, %ymm2
	vpsubw	%ymm1, %ymm3, %ymm3
	vpacksswb	%ymm3, %ymm2, %ymm2
	vpermq	$216, %ymm2, %ymm2
	vpmovmskb	%ymm2, %esi
	movl	%esi, 8(%rax)
	vmovdqu	192(%rcx), %ymm2
	vmovdqu	224(%rcx), %ymm3
	vpsubw	%ymm2, %ymm0, %ymm2
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsraw	$15, %ymm2, %ymm4
	vpsraw	$15, %ymm3, %ymm5
	vpxor	%ymm4, %ymm2, %ymm2
	vpxor	%ymm5, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm2, %ymm2
	vpsubw	%ymm1, %ymm3, %ymm3
	vpacksswb	%ymm3, %ymm2, %ymm2
	vpermq	$216, %ymm2, %ymm2
	vpmovmskb	%ymm2, %esi
	movl	%esi, 12(%rax)
	vmovdqu	256(%rcx), %ymm2
	vmovdqu	288(%rcx), %ymm3
	vpsubw	%ymm2, %ymm0, %ymm2
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsraw	$15, %ymm2, %ymm4
	vpsraw	$15, %ymm3, %ymm5
	vpxor	%ymm4, %ymm2, %ymm2
	vpxor	%ymm5, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm2, %ymm2
	vpsubw	%ymm1, %ymm3, %ymm3
	vpacksswb	%ymm3, %ymm2, %ymm2
	vpermq	$216, %ymm2, %ymm2
	vpmovmskb	%ymm2, %esi
	movl	%esi, 16(%rax)
	vmovdqu	320(%rcx), %ymm2
	vmovdqu	352(%rcx), %ymm3
	vpsubw	%ymm2, %ymm0, %ymm2
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsraw	$15, %ymm2, %ymm4
	vpsraw	$15, %ymm3, %ymm5
	vpxor	%ymm4, %ymm2, %ymm2
	vpxor	%ymm5, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm2, %ymm2
	vpsubw	%ymm1, %ymm3, %ymm3
	vpacksswb	%ymm3, %ymm2, %ymm2
	vpermq	$216, %ymm2, %ymm2
	vpmovmskb	%ymm2, %esi
	movl	%esi, 20(%rax)
	vmovdqu	384(%rcx), %ymm2
	vmovdqu	416(%rcx), %ymm3
	vpsubw	%ymm2, %ymm0, %ymm2
	vpsubw	%ymm3, %ymm0, %ymm3
	vpsraw	$15, %ymm2, %ymm4
	vpsraw	$15, %ymm3, %ymm5
	vpxor	%ymm4, %ymm2, %ymm2
	vpxor	%ymm5, %ymm3, %ymm3
	vpsubw	%ymm1, %ymm2, %ymm2
	vpsubw	%ymm1, %ymm3, %ymm3
	vpacksswb	%ymm3, %ymm2, %ymm2
	vpermq	$216, %ymm2, %ymm2
	vpmovmskb	%ymm2, %esi
	movl	%esi, 24(%rax)
	vmovdqu	448(%rcx), %ymm2
	vmovdqu	480(%rcx), %ymm3
	vpsubw	%ymm2, %ymm0, %ymm2
	vpsubw	%ymm3, %ymm0, %ymm0
	vpsraw	$15, %ymm2, %ymm3
	vpsraw	$15, %ymm0, %ymm4
	vpxor	%ymm3, %ymm2, %ymm2
	vpxor	%ymm4, %ymm0, %ymm0
	vpsubw	%ymm1, %ymm2, %ymm2
	vpsubw	%ymm1, %ymm0, %ymm0
	vpacksswb	%ymm0, %ymm2, %ymm0
	vpermq	$216, %ymm0, %ymm0
	vpmovmskb	%ymm0, %ecx
	movl	%ecx, 28(%rax)
	ret
L_poly_tobytes$1:
	call	L_poly_csubq$1
L_poly_tobytes$2:
	vmovdqu	(%rcx), %ymm4
	vmovdqu	32(%rcx), %ymm5
	vmovdqu	64(%rcx), %ymm6
	vmovdqu	96(%rcx), %ymm7
	vmovdqu	128(%rcx), %ymm0
	vmovdqu	160(%rcx), %ymm1
	vmovdqu	192(%rcx), %ymm2
	vmovdqu	224(%rcx), %ymm3
	vpsllw	$12, %ymm5, %ymm8
	vpor	%ymm4, %ymm8, %ymm4
	vpsrlw	$4, %ymm5, %ymm5
	vpsllw	$8, %ymm6, %ymm8
	vpor	%ymm8, %ymm5, %ymm5
	vpsrlw	$8, %ymm6, %ymm6
	vpsllw	$4, %ymm7, %ymm7
	vpor	%ymm7, %ymm6, %ymm6
	vpsllw	$12, %ymm1, %ymm7
	vpor	%ymm0, %ymm7, %ymm0
	vpsrlw	$4, %ymm1, %ymm1
	vpsllw	$8, %ymm2, %ymm7
	vpor	%ymm7, %ymm1, %ymm1
	vpsrlw	$8, %ymm2, %ymm2
	vpsllw	$4, %ymm3, %ymm3
	vpor	%ymm3, %ymm2, %ymm2
	vpslld	$16, %ymm5, %ymm3
	vpblendw	$170, %ymm3, %ymm4, %ymm3
	vpsrld	$16, %ymm4, %ymm4
	vpblendw	$170, %ymm5, %ymm4, %ymm4
	vpslld	$16, %ymm0, %ymm5
	vpblendw	$170, %ymm5, %ymm6, %ymm5
	vpsrld	$16, %ymm6, %ymm6
	vpblendw	$170, %ymm0, %ymm6, %ymm0
	vpslld	$16, %ymm2, %ymm6
	vpblendw	$170, %ymm6, %ymm1, %ymm6
	vpsrld	$16, %ymm1, %ymm1
	vpblendw	$170, %ymm2, %ymm1, %ymm1
	vmovsldup	%ymm5, %ymm2
	vpblendd	$170, %ymm2, %ymm3, %ymm2
	vpsrlq	$32, %ymm3, %ymm3
	vpblendd	$170, %ymm5, %ymm3, %ymm3
	vmovsldup	%ymm4, %ymm5
	vpblendd	$170, %ymm5, %ymm6, %ymm5
	vpsrlq	$32, %ymm6, %ymm6
	vpblendd	$170, %ymm4, %ymm6, %ymm4
	vmovsldup	%ymm1, %ymm6
	vpblendd	$170, %ymm6, %ymm0, %ymm6
	vpsrlq	$32, %ymm0, %ymm0
	vpblendd	$170, %ymm1, %ymm0, %ymm0
	vpunpcklqdq	%ymm5, %ymm2, %ymm1
	vpunpckhqdq	%ymm5, %ymm2, %ymm2
	vpunpcklqdq	%ymm3, %ymm6, %ymm5
	vpunpckhqdq	%ymm3, %ymm6, %ymm3
	vpunpcklqdq	%ymm0, %ymm4, %ymm6
	vpunpckhqdq	%ymm0, %ymm4, %ymm0
	vperm2i128	$32, %ymm5, %ymm1, %ymm4
	vperm2i128	$49, %ymm5, %ymm1, %ymm1
	vperm2i128	$32, %ymm2, %ymm6, %ymm5
	vperm2i128	$49, %ymm2, %ymm6, %ymm2
	vperm2i128	$32, %ymm0, %ymm3, %ymm6
	vperm2i128	$49, %ymm0, %ymm3, %ymm0
	vmovdqu	%ymm4, (%rdx)
	vmovdqu	%ymm5, 32(%rdx)
	vmovdqu	%ymm6, 64(%rdx)
	vmovdqu	%ymm1, 96(%rdx)
	vmovdqu	%ymm2, 128(%rdx)
	vmovdqu	%ymm0, 160(%rdx)
	vmovdqu	256(%rcx), %ymm4
	vmovdqu	288(%rcx), %ymm5
	vmovdqu	320(%rcx), %ymm6
	vmovdqu	352(%rcx), %ymm7
	vmovdqu	384(%rcx), %ymm0
	vmovdqu	416(%rcx), %ymm1
	vmovdqu	448(%rcx), %ymm2
	vmovdqu	480(%rcx), %ymm3
	vpsllw	$12, %ymm5, %ymm8
	vpor	%ymm4, %ymm8, %ymm4
	vpsrlw	$4, %ymm5, %ymm5
	vpsllw	$8, %ymm6, %ymm8
	vpor	%ymm8, %ymm5, %ymm5
	vpsrlw	$8, %ymm6, %ymm6
	vpsllw	$4, %ymm7, %ymm7
	vpor	%ymm7, %ymm6, %ymm6
	vpsllw	$12, %ymm1, %ymm7
	vpor	%ymm0, %ymm7, %ymm0
	vpsrlw	$4, %ymm1, %ymm1
	vpsllw	$8, %ymm2, %ymm7
	vpor	%ymm7, %ymm1, %ymm1
	vpsrlw	$8, %ymm2, %ymm2
	vpsllw	$4, %ymm3, %ymm3
	vpor	%ymm3, %ymm2, %ymm2
	vpslld	$16, %ymm5, %ymm3
	vpblendw	$170, %ymm3, %ymm4, %ymm3
	vpsrld	$16, %ymm4, %ymm4
	vpblendw	$170, %ymm5, %ymm4, %ymm4
	vpslld	$16, %ymm0, %ymm5
	vpblendw	$170, %ymm5, %ymm6, %ymm5
	vpsrld	$16, %ymm6, %ymm6
	vpblendw	$170, %ymm0, %ymm6, %ymm0
	vpslld	$16, %ymm2, %ymm6
	vpblendw	$170, %ymm6, %ymm1, %ymm6
	vpsrld	$16, %ymm1, %ymm1
	vpblendw	$170, %ymm2, %ymm1, %ymm1
	vmovsldup	%ymm5, %ymm2
	vpblendd	$170, %ymm2, %ymm3, %ymm2
	vpsrlq	$32, %ymm3, %ymm3
	vpblendd	$170, %ymm5, %ymm3, %ymm3
	vmovsldup	%ymm4, %ymm5
	vpblendd	$170, %ymm5, %ymm6, %ymm5
	vpsrlq	$32, %ymm6, %ymm6
	vpblendd	$170, %ymm4, %ymm6, %ymm4
	vmovsldup	%ymm1, %ymm6
	vpblendd	$170, %ymm6, %ymm0, %ymm6
	vpsrlq	$32, %ymm0, %ymm0
	vpblendd	$170, %ymm1, %ymm0, %ymm0
	vpunpcklqdq	%ymm5, %ymm2, %ymm1
	vpunpckhqdq	%ymm5, %ymm2, %ymm2
	vpunpcklqdq	%ymm3, %ymm6, %ymm5
	vpunpckhqdq	%ymm3, %ymm6, %ymm3
	vpunpcklqdq	%ymm0, %ymm4, %ymm6
	vpunpckhqdq	%ymm0, %ymm4, %ymm0
	vperm2i128	$32, %ymm5, %ymm1, %ymm4
	vperm2i128	$49, %ymm5, %ymm1, %ymm1
	vperm2i128	$32, %ymm2, %ymm6, %ymm5
	vperm2i128	$49, %ymm2, %ymm6, %ymm2
	vperm2i128	$32, %ymm0, %ymm3, %ymm6
	vperm2i128	$49, %ymm0, %ymm3, %ymm0
	vmovdqu	%ymm4, 192(%rdx)
	vmovdqu	%ymm5, 224(%rdx)
	vmovdqu	%ymm6, 256(%rdx)
	vmovdqu	%ymm1, 288(%rdx)
	vmovdqu	%ymm2, 320(%rdx)
	vmovdqu	%ymm0, 352(%rdx)
	ret
L_poly_sub$1:
	vmovdqu	(%rsi), %ymm0
	vmovdqu	(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rcx)
	vmovdqu	32(%rsi), %ymm0
	vmovdqu	32(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rcx)
	vmovdqu	64(%rsi), %ymm0
	vmovdqu	64(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 64(%rcx)
	vmovdqu	96(%rsi), %ymm0
	vmovdqu	96(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 96(%rcx)
	vmovdqu	128(%rsi), %ymm0
	vmovdqu	128(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 128(%rcx)
	vmovdqu	160(%rsi), %ymm0
	vmovdqu	160(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 160(%rcx)
	vmovdqu	192(%rsi), %ymm0
	vmovdqu	192(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 192(%rcx)
	vmovdqu	224(%rsi), %ymm0
	vmovdqu	224(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 224(%rcx)
	vmovdqu	256(%rsi), %ymm0
	vmovdqu	256(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 256(%rcx)
	vmovdqu	288(%rsi), %ymm0
	vmovdqu	288(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 288(%rcx)
	vmovdqu	320(%rsi), %ymm0
	vmovdqu	320(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 320(%rcx)
	vmovdqu	352(%rsi), %ymm0
	vmovdqu	352(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 352(%rcx)
	vmovdqu	384(%rsi), %ymm0
	vmovdqu	384(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 384(%rcx)
	vmovdqu	416(%rsi), %ymm0
	vmovdqu	416(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 416(%rcx)
	vmovdqu	448(%rsi), %ymm0
	vmovdqu	448(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 448(%rcx)
	vmovdqu	480(%rsi), %ymm0
	vmovdqu	480(%rdi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 480(%rcx)
	ret
L_poly_ntt$1:
	leaq	glob_data + 1824(%rip), %rsi
	vmovdqu	glob_data + 992(%rip), %ymm0
	vpbroadcastd	(%rsi), %ymm1
	vpbroadcastd	4(%rsi), %ymm2
	vmovdqu	(%rcx), %ymm3
	vmovdqu	32(%rcx), %ymm14
	vmovdqu	64(%rcx), %ymm4
	vmovdqu	96(%rcx), %ymm5
	vmovdqu	256(%rcx), %ymm6
	vmovdqu	288(%rcx), %ymm7
	vmovdqu	320(%rcx), %ymm12
	vmovdqu	352(%rcx), %ymm8
	vpmullw	%ymm6, %ymm1, %ymm9
	vpmulhw	%ymm6, %ymm2, %ymm6
	vpmullw	%ymm7, %ymm1, %ymm10
	vpmulhw	%ymm7, %ymm2, %ymm15
	vpmullw	%ymm12, %ymm1, %ymm11
	vpmulhw	%ymm12, %ymm2, %ymm7
	vpmullw	%ymm8, %ymm1, %ymm12
	vpmulhw	%ymm8, %ymm2, %ymm8
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpmulhw	%ymm0, %ymm11, %ymm11
	vpmulhw	%ymm0, %ymm12, %ymm12
	vpsubw	%ymm15, %ymm14, %ymm13
	vpaddw	%ymm14, %ymm15, %ymm14
	vpsubw	%ymm6, %ymm3, %ymm15
	vpaddw	%ymm3, %ymm6, %ymm3
	vpsubw	%ymm8, %ymm5, %ymm6
	vpaddw	%ymm5, %ymm8, %ymm5
	vpsubw	%ymm7, %ymm4, %ymm8
	vpaddw	%ymm4, %ymm7, %ymm4
	vpaddw	%ymm15, %ymm9, %ymm7
	vpsubw	%ymm9, %ymm3, %ymm3
	vpaddw	%ymm13, %ymm10, %ymm9
	vpsubw	%ymm10, %ymm14, %ymm10
	vpaddw	%ymm8, %ymm11, %ymm8
	vpsubw	%ymm11, %ymm4, %ymm4
	vpaddw	%ymm6, %ymm12, %ymm6
	vpsubw	%ymm12, %ymm5, %ymm5
	vmovdqu	%ymm3, (%rcx)
	vmovdqu	%ymm10, 32(%rcx)
	vmovdqu	%ymm4, 64(%rcx)
	vmovdqu	%ymm5, 96(%rcx)
	vmovdqu	%ymm7, 256(%rcx)
	vmovdqu	%ymm9, 288(%rcx)
	vmovdqu	%ymm8, 320(%rcx)
	vmovdqu	%ymm6, 352(%rcx)
	vmovdqu	128(%rcx), %ymm3
	vmovdqu	160(%rcx), %ymm12
	vmovdqu	192(%rcx), %ymm4
	vmovdqu	224(%rcx), %ymm5
	vmovdqu	384(%rcx), %ymm6
	vmovdqu	416(%rcx), %ymm7
	vmovdqu	448(%rcx), %ymm10
	vmovdqu	480(%rcx), %ymm11
	vpmullw	%ymm6, %ymm1, %ymm14
	vpmulhw	%ymm6, %ymm2, %ymm6
	vpmullw	%ymm7, %ymm1, %ymm8
	vpmulhw	%ymm7, %ymm2, %ymm13
	vpmullw	%ymm10, %ymm1, %ymm9
	vpmulhw	%ymm10, %ymm2, %ymm7
	vpmullw	%ymm11, %ymm1, %ymm10
	vpmulhw	%ymm11, %ymm2, %ymm1
	vpmulhw	%ymm0, %ymm14, %ymm2
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm13, %ymm12, %ymm11
	vpaddw	%ymm12, %ymm13, %ymm12
	vpsubw	%ymm6, %ymm3, %ymm13
	vpaddw	%ymm3, %ymm6, %ymm3
	vpsubw	%ymm1, %ymm5, %ymm6
	vpaddw	%ymm5, %ymm1, %ymm1
	vpsubw	%ymm7, %ymm4, %ymm5
	vpaddw	%ymm4, %ymm7, %ymm4
	vpaddw	%ymm13, %ymm2, %ymm7
	vpsubw	%ymm2, %ymm3, %ymm2
	vpaddw	%ymm11, %ymm8, %ymm3
	vpsubw	%ymm8, %ymm12, %ymm8
	vpaddw	%ymm5, %ymm9, %ymm5
	vpsubw	%ymm9, %ymm4, %ymm9
	vpaddw	%ymm6, %ymm10, %ymm4
	vpsubw	%ymm10, %ymm1, %ymm14
	vmovdqu	%ymm7, 384(%rcx)
	vmovdqu	%ymm3, 416(%rcx)
	vmovdqu	%ymm5, 448(%rcx)
	vmovdqu	%ymm4, 480(%rcx)
	vpbroadcastd	8(%rsi), %ymm1
	vpbroadcastd	12(%rsi), %ymm4
	vmovdqu	%ymm8, %ymm10
	vmovdqu	%ymm9, %ymm3
	vmovdqu	(%rcx), %ymm6
	vmovdqu	32(%rcx), %ymm5
	vmovdqu	64(%rcx), %ymm9
	vmovdqu	96(%rcx), %ymm7
	vpmullw	%ymm2, %ymm1, %ymm11
	vpmulhw	%ymm2, %ymm4, %ymm8
	vpmullw	%ymm10, %ymm1, %ymm13
	vpmulhw	%ymm10, %ymm4, %ymm12
	vpmullw	%ymm3, %ymm1, %ymm2
	vpmulhw	%ymm3, %ymm4, %ymm10
	vpmullw	%ymm14, %ymm1, %ymm3
	vpmulhw	%ymm14, %ymm4, %ymm14
	vpmulhw	%ymm0, %ymm11, %ymm11
	vpmulhw	%ymm0, %ymm13, %ymm1
	vpmulhw	%ymm0, %ymm2, %ymm2
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm12, %ymm5, %ymm4
	vpaddw	%ymm5, %ymm12, %ymm5
	vpsubw	%ymm8, %ymm6, %ymm12
	vpaddw	%ymm6, %ymm8, %ymm13
	vpsubw	%ymm14, %ymm7, %ymm6
	vpaddw	%ymm7, %ymm14, %ymm7
	vpsubw	%ymm10, %ymm9, %ymm8
	vpaddw	%ymm9, %ymm10, %ymm9
	vpaddw	%ymm12, %ymm11, %ymm10
	vpsubw	%ymm11, %ymm13, %ymm12
	vpaddw	%ymm4, %ymm1, %ymm4
	vpsubw	%ymm1, %ymm5, %ymm5
	vpaddw	%ymm8, %ymm2, %ymm8
	vpsubw	%ymm2, %ymm9, %ymm2
	vpaddw	%ymm6, %ymm3, %ymm13
	vpsubw	%ymm3, %ymm7, %ymm7
	vmovdqu	16(%rsi), %ymm3
	vmovdqu	48(%rsi), %ymm6
	vperm2i128	$32, %ymm10, %ymm12, %ymm11
	vperm2i128	$49, %ymm10, %ymm12, %ymm9
	vperm2i128	$32, %ymm4, %ymm5, %ymm1
	vperm2i128	$49, %ymm4, %ymm5, %ymm12
	vperm2i128	$32, %ymm8, %ymm2, %ymm5
	vperm2i128	$49, %ymm8, %ymm2, %ymm8
	vperm2i128	$32, %ymm13, %ymm7, %ymm2
	vperm2i128	$49, %ymm13, %ymm7, %ymm13
	vpmullw	%ymm5, %ymm3, %ymm4
	vpmulhw	%ymm5, %ymm6, %ymm10
	vpmullw	%ymm8, %ymm3, %ymm14
	vpmulhw	%ymm8, %ymm6, %ymm8
	vpmullw	%ymm2, %ymm3, %ymm5
	vpmulhw	%ymm2, %ymm6, %ymm2
	vpmullw	%ymm13, %ymm3, %ymm7
	vpmulhw	%ymm13, %ymm6, %ymm13
	vpmulhw	%ymm0, %ymm4, %ymm3
	vpmulhw	%ymm0, %ymm14, %ymm4
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpmulhw	%ymm0, %ymm7, %ymm6
	vpsubw	%ymm8, %ymm9, %ymm7
	vpaddw	%ymm9, %ymm8, %ymm8
	vpsubw	%ymm10, %ymm11, %ymm9
	vpaddw	%ymm11, %ymm10, %ymm10
	vpsubw	%ymm13, %ymm12, %ymm11
	vpaddw	%ymm12, %ymm13, %ymm12
	vpsubw	%ymm2, %ymm1, %ymm13
	vpaddw	%ymm1, %ymm2, %ymm1
	vpaddw	%ymm9, %ymm3, %ymm2
	vpsubw	%ymm3, %ymm10, %ymm9
	vpaddw	%ymm7, %ymm4, %ymm3
	vpsubw	%ymm4, %ymm8, %ymm4
	vpaddw	%ymm13, %ymm5, %ymm7
	vpsubw	%ymm5, %ymm1, %ymm13
	vpaddw	%ymm11, %ymm6, %ymm11
	vpsubw	%ymm6, %ymm12, %ymm14
	vmovdqu	80(%rsi), %ymm1
	vmovdqu	112(%rsi), %ymm10
	vpunpcklqdq	%ymm2, %ymm9, %ymm5
	vpunpckhqdq	%ymm2, %ymm9, %ymm12
	vpunpcklqdq	%ymm3, %ymm4, %ymm8
	vpunpckhqdq	%ymm3, %ymm4, %ymm6
	vpunpcklqdq	%ymm7, %ymm13, %ymm2
	vpunpckhqdq	%ymm7, %ymm13, %ymm4
	vpunpcklqdq	%ymm11, %ymm14, %ymm3
	vpunpckhqdq	%ymm11, %ymm14, %ymm7
	vpmullw	%ymm2, %ymm1, %ymm11
	vpmulhw	%ymm2, %ymm10, %ymm13
	vpmullw	%ymm4, %ymm1, %ymm14
	vpmulhw	%ymm4, %ymm10, %ymm4
	vpmullw	%ymm3, %ymm1, %ymm2
	vpmulhw	%ymm3, %ymm10, %ymm9
	vpmullw	%ymm7, %ymm1, %ymm3
	vpmulhw	%ymm7, %ymm10, %ymm7
	vpmulhw	%ymm0, %ymm11, %ymm10
	vpmulhw	%ymm0, %ymm14, %ymm1
	vpmulhw	%ymm0, %ymm2, %ymm2
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm4, %ymm12, %ymm11
	vpaddw	%ymm12, %ymm4, %ymm4
	vpsubw	%ymm13, %ymm5, %ymm12
	vpaddw	%ymm5, %ymm13, %ymm13
	vpsubw	%ymm7, %ymm6, %ymm5
	vpaddw	%ymm6, %ymm7, %ymm6
	vpsubw	%ymm9, %ymm8, %ymm7
	vpaddw	%ymm8, %ymm9, %ymm8
	vpaddw	%ymm12, %ymm10, %ymm9
	vpsubw	%ymm10, %ymm13, %ymm12
	vpaddw	%ymm11, %ymm1, %ymm10
	vpsubw	%ymm1, %ymm4, %ymm4
	vpaddw	%ymm7, %ymm2, %ymm7
	vpsubw	%ymm2, %ymm8, %ymm2
	vpaddw	%ymm5, %ymm3, %ymm13
	vpsubw	%ymm3, %ymm6, %ymm6
	vmovdqu	144(%rsi), %ymm3
	vmovdqu	176(%rsi), %ymm5
	vmovsldup	%ymm9, %ymm1
	vpblendd	$170, %ymm1, %ymm12, %ymm11
	vpsrlq	$32, %ymm12, %ymm1
	vpblendd	$170, %ymm9, %ymm1, %ymm8
	vmovsldup	%ymm10, %ymm1
	vpblendd	$170, %ymm1, %ymm4, %ymm1
	vpsrlq	$32, %ymm4, %ymm4
	vpblendd	$170, %ymm10, %ymm4, %ymm12
	vmovsldup	%ymm7, %ymm4
	vpblendd	$170, %ymm4, %ymm2, %ymm9
	vpsrlq	$32, %ymm2, %ymm2
	vpblendd	$170, %ymm7, %ymm2, %ymm7
	vmovsldup	%ymm13, %ymm2
	vpblendd	$170, %ymm2, %ymm6, %ymm2
	vpsrlq	$32, %ymm6, %ymm4
	vpblendd	$170, %ymm13, %ymm4, %ymm13
	vpmullw	%ymm9, %ymm3, %ymm4
	vpmulhw	%ymm9, %ymm5, %ymm10
	vpmullw	%ymm7, %ymm3, %ymm14
	vpmulhw	%ymm7, %ymm5, %ymm9
	vpmullw	%ymm2, %ymm3, %ymm6
	vpmulhw	%ymm2, %ymm5, %ymm2
	vpmullw	%ymm13, %ymm3, %ymm7
	vpmulhw	%ymm13, %ymm5, %ymm13
	vpmulhw	%ymm0, %ymm4, %ymm3
	vpmulhw	%ymm0, %ymm14, %ymm4
	vpmulhw	%ymm0, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm7, %ymm6
	vpsubw	%ymm9, %ymm8, %ymm7
	vpaddw	%ymm8, %ymm9, %ymm8
	vpsubw	%ymm10, %ymm11, %ymm9
	vpaddw	%ymm11, %ymm10, %ymm10
	vpsubw	%ymm13, %ymm12, %ymm11
	vpaddw	%ymm12, %ymm13, %ymm12
	vpsubw	%ymm2, %ymm1, %ymm13
	vpaddw	%ymm1, %ymm2, %ymm1
	vpaddw	%ymm9, %ymm3, %ymm2
	vpsubw	%ymm3, %ymm10, %ymm9
	vpaddw	%ymm7, %ymm4, %ymm3
	vpsubw	%ymm4, %ymm8, %ymm4
	vpaddw	%ymm13, %ymm5, %ymm7
	vpsubw	%ymm5, %ymm1, %ymm13
	vpaddw	%ymm11, %ymm6, %ymm11
	vpsubw	%ymm6, %ymm12, %ymm14
	vmovdqu	208(%rsi), %ymm5
	vmovdqu	240(%rsi), %ymm6
	vpslld	$16, %ymm2, %ymm1
	vpblendw	$170, %ymm1, %ymm9, %ymm10
	vpsrld	$16, %ymm9, %ymm1
	vpblendw	$170, %ymm2, %ymm1, %ymm8
	vpslld	$16, %ymm3, %ymm1
	vpblendw	$170, %ymm1, %ymm4, %ymm1
	vpsrld	$16, %ymm4, %ymm2
	vpblendw	$170, %ymm3, %ymm2, %ymm12
	vpslld	$16, %ymm7, %ymm2
	vpblendw	$170, %ymm2, %ymm13, %ymm4
	vpsrld	$16, %ymm13, %ymm2
	vpblendw	$170, %ymm7, %ymm2, %ymm7
	vpslld	$16, %ymm11, %ymm2
	vpblendw	$170, %ymm2, %ymm14, %ymm2
	vpsrld	$16, %ymm14, %ymm3
	vpblendw	$170, %ymm11, %ymm3, %ymm13
	vpmullw	%ymm4, %ymm5, %ymm3
	vpmulhw	%ymm4, %ymm6, %ymm11
	vpmullw	%ymm7, %ymm5, %ymm4
	vpmulhw	%ymm7, %ymm6, %ymm9
	vpmullw	%ymm2, %ymm5, %ymm7
	vpmulhw	%ymm2, %ymm6, %ymm2
	vpmullw	%ymm13, %ymm5, %ymm14
	vpmulhw	%ymm13, %ymm6, %ymm13
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpmulhw	%ymm0, %ymm7, %ymm5
	vpmulhw	%ymm0, %ymm14, %ymm6
	vpsubw	%ymm9, %ymm8, %ymm7
	vpaddw	%ymm8, %ymm9, %ymm8
	vpsubw	%ymm11, %ymm10, %ymm9
	vpaddw	%ymm10, %ymm11, %ymm10
	vpsubw	%ymm13, %ymm12, %ymm11
	vpaddw	%ymm12, %ymm13, %ymm12
	vpsubw	%ymm2, %ymm1, %ymm13
	vpaddw	%ymm1, %ymm2, %ymm1
	vpaddw	%ymm9, %ymm3, %ymm2
	vpsubw	%ymm3, %ymm10, %ymm3
	vpaddw	%ymm7, %ymm4, %ymm7
	vpsubw	%ymm4, %ymm8, %ymm4
	vpaddw	%ymm13, %ymm5, %ymm8
	vpsubw	%ymm5, %ymm1, %ymm1
	vpaddw	%ymm11, %ymm6, %ymm5
	vpsubw	%ymm6, %ymm12, %ymm10
	vmovdqu	272(%rsi), %ymm9
	vmovdqu	304(%rsi), %ymm13
	vmovdqu	336(%rsi), %ymm11
	vmovdqu	368(%rsi), %ymm6
	vpmullw	%ymm1, %ymm9, %ymm14
	vpmulhw	%ymm1, %ymm13, %ymm12
	vpmullw	%ymm10, %ymm9, %ymm9
	vpmulhw	%ymm10, %ymm13, %ymm13
	vpmullw	%ymm8, %ymm11, %ymm10
	vpmulhw	%ymm8, %ymm6, %ymm1
	vpmullw	%ymm5, %ymm11, %ymm11
	vpmulhw	%ymm5, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm14, %ymm6
	vpmulhw	%ymm0, %ymm9, %ymm8
	vpmulhw	%ymm0, %ymm10, %ymm9
	vpmulhw	%ymm0, %ymm11, %ymm10
	vpsubw	%ymm13, %ymm4, %ymm11
	vpaddw	%ymm4, %ymm13, %ymm4
	vpsubw	%ymm12, %ymm3, %ymm13
	vpaddw	%ymm3, %ymm12, %ymm3
	vpsubw	%ymm5, %ymm7, %ymm12
	vpaddw	%ymm7, %ymm5, %ymm5
	vpsubw	%ymm1, %ymm2, %ymm7
	vpaddw	%ymm2, %ymm1, %ymm1
	vpaddw	%ymm13, %ymm6, %ymm2
	vpsubw	%ymm6, %ymm3, %ymm3
	vpaddw	%ymm11, %ymm8, %ymm6
	vpsubw	%ymm8, %ymm4, %ymm4
	vpaddw	%ymm7, %ymm9, %ymm7
	vpsubw	%ymm9, %ymm1, %ymm8
	vpaddw	%ymm12, %ymm10, %ymm1
	vpsubw	%ymm10, %ymm5, %ymm5
	vmovdqu	glob_data + 928(%rip), %ymm9
	vpmulhw	%ymm9, %ymm3, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm3, %ymm3
	vpmulhw	%ymm9, %ymm4, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm4, %ymm4
	vpmulhw	%ymm9, %ymm8, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm8, %ymm8
	vpmulhw	%ymm9, %ymm5, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm5, %ymm5
	vpmulhw	%ymm9, %ymm2, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm2, %ymm2
	vpmulhw	%ymm9, %ymm6, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm6, %ymm6
	vpmulhw	%ymm9, %ymm7, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm7, %ymm7
	vpmulhw	%ymm9, %ymm1, %ymm9
	vpsraw	$10, %ymm9, %ymm9
	vpmullw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm1, %ymm1
	vmovdqu	%ymm3, (%rcx)
	vmovdqu	%ymm4, 32(%rcx)
	vmovdqu	%ymm2, 64(%rcx)
	vmovdqu	%ymm6, 96(%rcx)
	vmovdqu	%ymm8, 128(%rcx)
	vmovdqu	%ymm5, 160(%rcx)
	vmovdqu	%ymm7, 192(%rcx)
	vmovdqu	%ymm1, 224(%rcx)
	vpbroadcastd	400(%rsi), %ymm5
	vpbroadcastd	404(%rsi), %ymm8
	vmovdqu	384(%rcx), %ymm1
	vmovdqu	416(%rcx), %ymm2
	vmovdqu	448(%rcx), %ymm10
	vmovdqu	480(%rcx), %ymm9
	vmovdqu	256(%rcx), %ymm3
	vmovdqu	288(%rcx), %ymm7
	vmovdqu	320(%rcx), %ymm6
	vmovdqu	352(%rcx), %ymm4
	vpmullw	%ymm1, %ymm5, %ymm14
	vpmulhw	%ymm1, %ymm8, %ymm12
	vpmullw	%ymm2, %ymm5, %ymm1
	vpmulhw	%ymm2, %ymm8, %ymm11
	vpmullw	%ymm10, %ymm5, %ymm2
	vpmulhw	%ymm10, %ymm8, %ymm13
	vpmullw	%ymm9, %ymm5, %ymm10
	vpmulhw	%ymm9, %ymm8, %ymm5
	vpmulhw	%ymm0, %ymm14, %ymm8
	vpmulhw	%ymm0, %ymm1, %ymm9
	vpmulhw	%ymm0, %ymm2, %ymm1
	vpmulhw	%ymm0, %ymm10, %ymm2
	vpsubw	%ymm11, %ymm7, %ymm10
	vpaddw	%ymm7, %ymm11, %ymm11
	vpsubw	%ymm12, %ymm3, %ymm7
	vpaddw	%ymm3, %ymm12, %ymm12
	vpsubw	%ymm5, %ymm4, %ymm3
	vpaddw	%ymm4, %ymm5, %ymm4
	vpsubw	%ymm13, %ymm6, %ymm5
	vpaddw	%ymm6, %ymm13, %ymm6
	vpaddw	%ymm7, %ymm8, %ymm7
	vpsubw	%ymm8, %ymm12, %ymm12
	vpaddw	%ymm10, %ymm9, %ymm8
	vpsubw	%ymm9, %ymm11, %ymm9
	vpaddw	%ymm5, %ymm1, %ymm5
	vpsubw	%ymm1, %ymm6, %ymm6
	vpaddw	%ymm3, %ymm2, %ymm13
	vpsubw	%ymm2, %ymm4, %ymm2
	vmovdqu	408(%rsi), %ymm3
	vmovdqu	440(%rsi), %ymm4
	vperm2i128	$32, %ymm7, %ymm12, %ymm10
	vperm2i128	$49, %ymm7, %ymm12, %ymm11
	vperm2i128	$32, %ymm8, %ymm9, %ymm1
	vperm2i128	$49, %ymm8, %ymm9, %ymm12
	vperm2i128	$32, %ymm5, %ymm6, %ymm8
	vperm2i128	$49, %ymm5, %ymm6, %ymm5
	vperm2i128	$32, %ymm13, %ymm2, %ymm6
	vperm2i128	$49, %ymm13, %ymm2, %ymm13
	vpmullw	%ymm8, %ymm3, %ymm7
	vpmulhw	%ymm8, %ymm4, %ymm14
	vpmullw	%ymm5, %ymm3, %ymm9
	vpmulhw	%ymm5, %ymm4, %ymm8
	vpmullw	%ymm6, %ymm3, %ymm5
	vpmulhw	%ymm6, %ymm4, %ymm2
	vpmullw	%ymm13, %ymm3, %ymm6
	vpmulhw	%ymm13, %ymm4, %ymm13
	vpmulhw	%ymm0, %ymm7, %ymm3
	vpmulhw	%ymm0, %ymm9, %ymm4
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm8, %ymm11, %ymm7
	vpaddw	%ymm11, %ymm8, %ymm8
	vpsubw	%ymm14, %ymm10, %ymm9
	vpaddw	%ymm10, %ymm14, %ymm10
	vpsubw	%ymm13, %ymm12, %ymm11
	vpaddw	%ymm12, %ymm13, %ymm12
	vpsubw	%ymm2, %ymm1, %ymm13
	vpaddw	%ymm1, %ymm2, %ymm1
	vpaddw	%ymm9, %ymm3, %ymm2
	vpsubw	%ymm3, %ymm10, %ymm9
	vpaddw	%ymm7, %ymm4, %ymm3
	vpsubw	%ymm4, %ymm8, %ymm4
	vpaddw	%ymm13, %ymm5, %ymm7
	vpsubw	%ymm5, %ymm1, %ymm13
	vpaddw	%ymm11, %ymm6, %ymm11
	vpsubw	%ymm6, %ymm12, %ymm14
	vmovdqu	472(%rsi), %ymm1
	vmovdqu	504(%rsi), %ymm10
	vpunpcklqdq	%ymm2, %ymm9, %ymm5
	vpunpckhqdq	%ymm2, %ymm9, %ymm12
	vpunpcklqdq	%ymm3, %ymm4, %ymm8
	vpunpckhqdq	%ymm3, %ymm4, %ymm6
	vpunpcklqdq	%ymm7, %ymm13, %ymm2
	vpunpckhqdq	%ymm7, %ymm13, %ymm4
	vpunpcklqdq	%ymm11, %ymm14, %ymm3
	vpunpckhqdq	%ymm11, %ymm14, %ymm7
	vpmullw	%ymm2, %ymm1, %ymm11
	vpmulhw	%ymm2, %ymm10, %ymm13
	vpmullw	%ymm4, %ymm1, %ymm14
	vpmulhw	%ymm4, %ymm10, %ymm4
	vpmullw	%ymm3, %ymm1, %ymm2
	vpmulhw	%ymm3, %ymm10, %ymm9
	vpmullw	%ymm7, %ymm1, %ymm3
	vpmulhw	%ymm7, %ymm10, %ymm7
	vpmulhw	%ymm0, %ymm11, %ymm10
	vpmulhw	%ymm0, %ymm14, %ymm1
	vpmulhw	%ymm0, %ymm2, %ymm2
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm4, %ymm12, %ymm11
	vpaddw	%ymm12, %ymm4, %ymm4
	vpsubw	%ymm13, %ymm5, %ymm12
	vpaddw	%ymm5, %ymm13, %ymm13
	vpsubw	%ymm7, %ymm6, %ymm5
	vpaddw	%ymm6, %ymm7, %ymm6
	vpsubw	%ymm9, %ymm8, %ymm7
	vpaddw	%ymm8, %ymm9, %ymm8
	vpaddw	%ymm12, %ymm10, %ymm9
	vpsubw	%ymm10, %ymm13, %ymm12
	vpaddw	%ymm11, %ymm1, %ymm10
	vpsubw	%ymm1, %ymm4, %ymm4
	vpaddw	%ymm7, %ymm2, %ymm7
	vpsubw	%ymm2, %ymm8, %ymm2
	vpaddw	%ymm5, %ymm3, %ymm13
	vpsubw	%ymm3, %ymm6, %ymm6
	vmovdqu	536(%rsi), %ymm3
	vmovdqu	568(%rsi), %ymm5
	vmovsldup	%ymm9, %ymm1
	vpblendd	$170, %ymm1, %ymm12, %ymm11
	vpsrlq	$32, %ymm12, %ymm1
	vpblendd	$170, %ymm9, %ymm1, %ymm8
	vmovsldup	%ymm10, %ymm1
	vpblendd	$170, %ymm1, %ymm4, %ymm1
	vpsrlq	$32, %ymm4, %ymm4
	vpblendd	$170, %ymm10, %ymm4, %ymm12
	vmovsldup	%ymm7, %ymm4
	vpblendd	$170, %ymm4, %ymm2, %ymm9
	vpsrlq	$32, %ymm2, %ymm2
	vpblendd	$170, %ymm7, %ymm2, %ymm7
	vmovsldup	%ymm13, %ymm2
	vpblendd	$170, %ymm2, %ymm6, %ymm2
	vpsrlq	$32, %ymm6, %ymm4
	vpblendd	$170, %ymm13, %ymm4, %ymm13
	vpmullw	%ymm9, %ymm3, %ymm4
	vpmulhw	%ymm9, %ymm5, %ymm10
	vpmullw	%ymm7, %ymm3, %ymm14
	vpmulhw	%ymm7, %ymm5, %ymm9
	vpmullw	%ymm2, %ymm3, %ymm6
	vpmulhw	%ymm2, %ymm5, %ymm2
	vpmullw	%ymm13, %ymm3, %ymm7
	vpmulhw	%ymm13, %ymm5, %ymm13
	vpmulhw	%ymm0, %ymm4, %ymm3
	vpmulhw	%ymm0, %ymm14, %ymm4
	vpmulhw	%ymm0, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm7, %ymm6
	vpsubw	%ymm9, %ymm8, %ymm7
	vpaddw	%ymm8, %ymm9, %ymm8
	vpsubw	%ymm10, %ymm11, %ymm9
	vpaddw	%ymm11, %ymm10, %ymm10
	vpsubw	%ymm13, %ymm12, %ymm11
	vpaddw	%ymm12, %ymm13, %ymm12
	vpsubw	%ymm2, %ymm1, %ymm13
	vpaddw	%ymm1, %ymm2, %ymm1
	vpaddw	%ymm9, %ymm3, %ymm2
	vpsubw	%ymm3, %ymm10, %ymm9
	vpaddw	%ymm7, %ymm4, %ymm3
	vpsubw	%ymm4, %ymm8, %ymm4
	vpaddw	%ymm13, %ymm5, %ymm7
	vpsubw	%ymm5, %ymm1, %ymm13
	vpaddw	%ymm11, %ymm6, %ymm11
	vpsubw	%ymm6, %ymm12, %ymm14
	vmovdqu	600(%rsi), %ymm5
	vmovdqu	632(%rsi), %ymm6
	vpslld	$16, %ymm2, %ymm1
	vpblendw	$170, %ymm1, %ymm9, %ymm10
	vpsrld	$16, %ymm9, %ymm1
	vpblendw	$170, %ymm2, %ymm1, %ymm8
	vpslld	$16, %ymm3, %ymm1
	vpblendw	$170, %ymm1, %ymm4, %ymm1
	vpsrld	$16, %ymm4, %ymm2
	vpblendw	$170, %ymm3, %ymm2, %ymm12
	vpslld	$16, %ymm7, %ymm2
	vpblendw	$170, %ymm2, %ymm13, %ymm4
	vpsrld	$16, %ymm13, %ymm2
	vpblendw	$170, %ymm7, %ymm2, %ymm7
	vpslld	$16, %ymm11, %ymm2
	vpblendw	$170, %ymm2, %ymm14, %ymm2
	vpsrld	$16, %ymm14, %ymm3
	vpblendw	$170, %ymm11, %ymm3, %ymm13
	vpmullw	%ymm4, %ymm5, %ymm3
	vpmulhw	%ymm4, %ymm6, %ymm11
	vpmullw	%ymm7, %ymm5, %ymm4
	vpmulhw	%ymm7, %ymm6, %ymm9
	vpmullw	%ymm2, %ymm5, %ymm7
	vpmulhw	%ymm2, %ymm6, %ymm2
	vpmullw	%ymm13, %ymm5, %ymm14
	vpmulhw	%ymm13, %ymm6, %ymm13
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpmulhw	%ymm0, %ymm7, %ymm5
	vpmulhw	%ymm0, %ymm14, %ymm6
	vpsubw	%ymm9, %ymm8, %ymm7
	vpaddw	%ymm8, %ymm9, %ymm8
	vpsubw	%ymm11, %ymm10, %ymm9
	vpaddw	%ymm10, %ymm11, %ymm10
	vpsubw	%ymm13, %ymm12, %ymm11
	vpaddw	%ymm12, %ymm13, %ymm12
	vpsubw	%ymm2, %ymm1, %ymm13
	vpaddw	%ymm1, %ymm2, %ymm1
	vpaddw	%ymm9, %ymm3, %ymm2
	vpsubw	%ymm3, %ymm10, %ymm3
	vpaddw	%ymm7, %ymm4, %ymm7
	vpsubw	%ymm4, %ymm8, %ymm4
	vpaddw	%ymm13, %ymm5, %ymm8
	vpsubw	%ymm5, %ymm1, %ymm1
	vpaddw	%ymm11, %ymm6, %ymm5
	vpsubw	%ymm6, %ymm12, %ymm10
	vmovdqu	664(%rsi), %ymm9
	vmovdqu	696(%rsi), %ymm13
	vmovdqu	728(%rsi), %ymm11
	vmovdqu	760(%rsi), %ymm6
	vpmullw	%ymm1, %ymm9, %ymm14
	vpmulhw	%ymm1, %ymm13, %ymm12
	vpmullw	%ymm10, %ymm9, %ymm9
	vpmulhw	%ymm10, %ymm13, %ymm13
	vpmullw	%ymm8, %ymm11, %ymm10
	vpmulhw	%ymm8, %ymm6, %ymm1
	vpmullw	%ymm5, %ymm11, %ymm11
	vpmulhw	%ymm5, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm14, %ymm6
	vpmulhw	%ymm0, %ymm9, %ymm8
	vpmulhw	%ymm0, %ymm10, %ymm9
	vpmulhw	%ymm0, %ymm11, %ymm10
	vpsubw	%ymm13, %ymm4, %ymm11
	vpaddw	%ymm4, %ymm13, %ymm4
	vpsubw	%ymm12, %ymm3, %ymm13
	vpaddw	%ymm3, %ymm12, %ymm3
	vpsubw	%ymm5, %ymm7, %ymm12
	vpaddw	%ymm7, %ymm5, %ymm5
	vpsubw	%ymm1, %ymm2, %ymm7
	vpaddw	%ymm2, %ymm1, %ymm1
	vpaddw	%ymm13, %ymm6, %ymm2
	vpsubw	%ymm6, %ymm3, %ymm3
	vpaddw	%ymm11, %ymm8, %ymm6
	vpsubw	%ymm8, %ymm4, %ymm4
	vpaddw	%ymm7, %ymm9, %ymm7
	vpsubw	%ymm9, %ymm1, %ymm8
	vpaddw	%ymm12, %ymm10, %ymm1
	vpsubw	%ymm10, %ymm5, %ymm5
	vmovdqu	glob_data + 928(%rip), %ymm9
	vpmulhw	%ymm9, %ymm3, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm3, %ymm3
	vpmulhw	%ymm9, %ymm4, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm4, %ymm4
	vpmulhw	%ymm9, %ymm8, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm8, %ymm8
	vpmulhw	%ymm9, %ymm5, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm5, %ymm5
	vpmulhw	%ymm9, %ymm2, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm2, %ymm2
	vpmulhw	%ymm9, %ymm6, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm6, %ymm6
	vpmulhw	%ymm9, %ymm7, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm7, %ymm7
	vpmulhw	%ymm9, %ymm1, %ymm9
	vpsraw	$10, %ymm9, %ymm9
	vpmullw	%ymm0, %ymm9, %ymm0
	vpsubw	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm3, 256(%rcx)
	vmovdqu	%ymm4, 288(%rcx)
	vmovdqu	%ymm2, 320(%rcx)
	vmovdqu	%ymm6, 352(%rcx)
	vmovdqu	%ymm8, 384(%rcx)
	vmovdqu	%ymm5, 416(%rcx)
	vmovdqu	%ymm7, 448(%rcx)
	vmovdqu	%ymm0, 480(%rcx)
	ret
L_poly_invntt$1:
	leaq	glob_data + 1024(%rip), %rsi
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	(%rsi), %ymm12
	vmovdqu	64(%rsi), %ymm1
	vmovdqu	32(%rsi), %ymm2
	vmovdqu	96(%rsi), %ymm5
	vmovdqu	(%rcx), %ymm3
	vmovdqu	32(%rcx), %ymm4
	vmovdqu	64(%rcx), %ymm15
	vmovdqu	96(%rcx), %ymm11
	vmovdqu	128(%rcx), %ymm7
	vmovdqu	160(%rcx), %ymm8
	vmovdqu	192(%rcx), %ymm13
	vmovdqu	224(%rcx), %ymm14
	vpsubw	%ymm15, %ymm3, %ymm6
	vpsubw	%ymm11, %ymm4, %ymm9
	vpsubw	%ymm13, %ymm7, %ymm10
	vpaddw	%ymm3, %ymm15, %ymm3
	vpaddw	%ymm4, %ymm11, %ymm4
	vpmullw	%ymm6, %ymm12, %ymm11
	vpaddw	%ymm7, %ymm13, %ymm7
	vpmullw	%ymm9, %ymm12, %ymm12
	vpsubw	%ymm14, %ymm8, %ymm13
	vpaddw	%ymm8, %ymm14, %ymm8
	vpmullw	%ymm10, %ymm1, %ymm14
	vpmullw	%ymm13, %ymm1, %ymm1
	vpmulhw	%ymm6, %ymm2, %ymm6
	vpmulhw	%ymm9, %ymm2, %ymm2
	vpmulhw	%ymm10, %ymm5, %ymm9
	vpmulhw	%ymm13, %ymm5, %ymm5
	vpmulhw	%ymm11, %ymm0, %ymm10
	vpmulhw	%ymm12, %ymm0, %ymm11
	vpmulhw	%ymm14, %ymm0, %ymm12
	vpmulhw	%ymm1, %ymm0, %ymm1
	vpsubw	%ymm10, %ymm6, %ymm6
	vpsubw	%ymm11, %ymm2, %ymm11
	vpsubw	%ymm12, %ymm9, %ymm9
	vpsubw	%ymm1, %ymm5, %ymm13
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	128(%rsi), %ymm2
	vmovdqu	160(%rsi), %ymm5
	vpmulhw	%ymm1, %ymm3, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm3, %ymm10
	vpmulhw	%ymm1, %ymm4, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm12
	vpmulhw	%ymm1, %ymm7, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm7, %ymm7
	vpmulhw	%ymm1, %ymm8, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm8, %ymm8
	vpsubw	%ymm7, %ymm10, %ymm15
	vpsubw	%ymm8, %ymm12, %ymm3
	vpsubw	%ymm9, %ymm6, %ymm4
	vpaddw	%ymm10, %ymm7, %ymm7
	vpaddw	%ymm12, %ymm8, %ymm8
	vpmullw	%ymm15, %ymm2, %ymm10
	vpaddw	%ymm6, %ymm9, %ymm9
	vpmullw	%ymm3, %ymm2, %ymm6
	vpsubw	%ymm13, %ymm11, %ymm12
	vpaddw	%ymm11, %ymm13, %ymm11
	vpmullw	%ymm4, %ymm2, %ymm13
	vpmullw	%ymm12, %ymm2, %ymm14
	vpmulhw	%ymm15, %ymm5, %ymm2
	vpmulhw	%ymm3, %ymm5, %ymm3
	vpmulhw	%ymm4, %ymm5, %ymm4
	vpmulhw	%ymm12, %ymm5, %ymm5
	vpmulhw	%ymm10, %ymm0, %ymm10
	vpmulhw	%ymm6, %ymm0, %ymm12
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm14, %ymm0, %ymm6
	vpsubw	%ymm10, %ymm2, %ymm2
	vpsubw	%ymm12, %ymm3, %ymm3
	vpsubw	%ymm13, %ymm4, %ymm4
	vpsubw	%ymm6, %ymm5, %ymm5
	vpslld	$16, %ymm8, %ymm6
	vpblendw	$170, %ymm6, %ymm7, %ymm6
	vpsrld	$16, %ymm7, %ymm7
	vpblendw	$170, %ymm8, %ymm7, %ymm7
	vpslld	$16, %ymm11, %ymm8
	vpblendw	$170, %ymm8, %ymm9, %ymm10
	vpsrld	$16, %ymm9, %ymm8
	vpblendw	$170, %ymm11, %ymm8, %ymm11
	vpslld	$16, %ymm3, %ymm8
	vpblendw	$170, %ymm8, %ymm2, %ymm8
	vpsrld	$16, %ymm2, %ymm2
	vpblendw	$170, %ymm3, %ymm2, %ymm9
	vpslld	$16, %ymm5, %ymm2
	vpblendw	$170, %ymm2, %ymm4, %ymm12
	vpsrld	$16, %ymm4, %ymm2
	vpblendw	$170, %ymm5, %ymm2, %ymm13
	vmovdqu	192(%rsi), %ymm2
	vmovdqu	224(%rsi), %ymm5
	vpsubw	%ymm7, %ymm6, %ymm15
	vpsubw	%ymm11, %ymm10, %ymm3
	vpsubw	%ymm9, %ymm8, %ymm4
	vpaddw	%ymm6, %ymm7, %ymm6
	vpaddw	%ymm10, %ymm11, %ymm7
	vpmullw	%ymm15, %ymm2, %ymm10
	vpaddw	%ymm8, %ymm9, %ymm8
	vpmullw	%ymm3, %ymm2, %ymm9
	vpsubw	%ymm13, %ymm12, %ymm11
	vpaddw	%ymm12, %ymm13, %ymm12
	vpmullw	%ymm4, %ymm2, %ymm13
	vpmullw	%ymm11, %ymm2, %ymm14
	vpmulhw	%ymm15, %ymm5, %ymm2
	vpmulhw	%ymm3, %ymm5, %ymm3
	vpmulhw	%ymm4, %ymm5, %ymm4
	vpmulhw	%ymm11, %ymm5, %ymm5
	vpmulhw	%ymm10, %ymm0, %ymm10
	vpmulhw	%ymm9, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm14, %ymm0, %ymm9
	vpsubw	%ymm10, %ymm2, %ymm2
	vpsubw	%ymm11, %ymm3, %ymm3
	vpsubw	%ymm13, %ymm4, %ymm4
	vpsubw	%ymm9, %ymm5, %ymm5
	vpmulhw	%ymm1, %ymm6, %ymm9
	vpsraw	$10, %ymm9, %ymm9
	vpmullw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm6, %ymm6
	vmovsldup	%ymm7, %ymm9
	vpblendd	$170, %ymm9, %ymm6, %ymm9
	vpsrlq	$32, %ymm6, %ymm6
	vpblendd	$170, %ymm7, %ymm6, %ymm10
	vmovsldup	%ymm12, %ymm6
	vpblendd	$170, %ymm6, %ymm8, %ymm11
	vpsrlq	$32, %ymm8, %ymm6
	vpblendd	$170, %ymm12, %ymm6, %ymm14
	vmovsldup	%ymm3, %ymm6
	vpblendd	$170, %ymm6, %ymm2, %ymm12
	vpsrlq	$32, %ymm2, %ymm2
	vpblendd	$170, %ymm3, %ymm2, %ymm13
	vmovsldup	%ymm5, %ymm2
	vpblendd	$170, %ymm2, %ymm4, %ymm2
	vpsrlq	$32, %ymm4, %ymm3
	vpblendd	$170, %ymm5, %ymm3, %ymm3
	vmovdqu	256(%rsi), %ymm4
	vmovdqu	288(%rsi), %ymm5
	vpsubw	%ymm10, %ymm9, %ymm6
	vpsubw	%ymm14, %ymm11, %ymm7
	vpsubw	%ymm13, %ymm12, %ymm8
	vpaddw	%ymm9, %ymm10, %ymm9
	vpaddw	%ymm11, %ymm14, %ymm10
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
	vpmulhw	%ymm14, %ymm5, %ymm5
	vpmulhw	%ymm11, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm3, %ymm0, %ymm3
	vpmulhw	%ymm4, %ymm0, %ymm4
	vpsubw	%ymm11, %ymm6, %ymm6
	vpsubw	%ymm13, %ymm7, %ymm7
	vpsubw	%ymm3, %ymm8, %ymm3
	vpsubw	%ymm4, %ymm5, %ymm4
	vpmulhw	%ymm1, %ymm9, %ymm5
	vpsraw	$10, %ymm5, %ymm5
	vpmullw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm9, %ymm8
	vpunpcklqdq	%ymm10, %ymm8, %ymm5
	vpunpckhqdq	%ymm10, %ymm8, %ymm8
	vpunpcklqdq	%ymm2, %ymm12, %ymm9
	vpunpckhqdq	%ymm2, %ymm12, %ymm2
	vpunpcklqdq	%ymm7, %ymm6, %ymm10
	vpunpckhqdq	%ymm7, %ymm6, %ymm6
	vpunpcklqdq	%ymm4, %ymm3, %ymm7
	vpunpckhqdq	%ymm4, %ymm3, %ymm3
	vmovdqu	320(%rsi), %ymm4
	vmovdqu	352(%rsi), %ymm11
	vpsubw	%ymm8, %ymm5, %ymm12
	vpsubw	%ymm2, %ymm9, %ymm13
	vpsubw	%ymm6, %ymm10, %ymm14
	vpaddw	%ymm5, %ymm8, %ymm5
	vpaddw	%ymm9, %ymm2, %ymm2
	vpmullw	%ymm12, %ymm4, %ymm8
	vpaddw	%ymm10, %ymm6, %ymm6
	vpmullw	%ymm13, %ymm4, %ymm9
	vpsubw	%ymm3, %ymm7, %ymm10
	vpaddw	%ymm7, %ymm3, %ymm3
	vpmullw	%ymm14, %ymm4, %ymm7
	vpmullw	%ymm10, %ymm4, %ymm4
	vpmulhw	%ymm12, %ymm11, %ymm12
	vpmulhw	%ymm13, %ymm11, %ymm13
	vpmulhw	%ymm14, %ymm11, %ymm14
	vpmulhw	%ymm10, %ymm11, %ymm10
	vpmulhw	%ymm8, %ymm0, %ymm8
	vpmulhw	%ymm9, %ymm0, %ymm9
	vpmulhw	%ymm7, %ymm0, %ymm7
	vpmulhw	%ymm4, %ymm0, %ymm4
	vpsubw	%ymm8, %ymm12, %ymm8
	vpsubw	%ymm9, %ymm13, %ymm9
	vpsubw	%ymm7, %ymm14, %ymm7
	vpsubw	%ymm4, %ymm10, %ymm4
	vpmulhw	%ymm1, %ymm5, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm5, %ymm10
	vperm2i128	$32, %ymm2, %ymm10, %ymm5
	vperm2i128	$49, %ymm2, %ymm10, %ymm2
	vperm2i128	$32, %ymm3, %ymm6, %ymm10
	vperm2i128	$49, %ymm3, %ymm6, %ymm3
	vperm2i128	$32, %ymm9, %ymm8, %ymm6
	vperm2i128	$49, %ymm9, %ymm8, %ymm8
	vperm2i128	$32, %ymm4, %ymm7, %ymm9
	vperm2i128	$49, %ymm4, %ymm7, %ymm4
	vpbroadcastd	384(%rsi), %ymm7
	vpbroadcastd	388(%rsi), %ymm11
	vpsubw	%ymm2, %ymm5, %ymm12
	vpsubw	%ymm3, %ymm10, %ymm13
	vpsubw	%ymm8, %ymm6, %ymm14
	vpaddw	%ymm5, %ymm2, %ymm2
	vpaddw	%ymm10, %ymm3, %ymm3
	vpmullw	%ymm12, %ymm7, %ymm5
	vpaddw	%ymm6, %ymm8, %ymm6
	vpmullw	%ymm13, %ymm7, %ymm8
	vpsubw	%ymm4, %ymm9, %ymm10
	vpaddw	%ymm9, %ymm4, %ymm4
	vpmullw	%ymm14, %ymm7, %ymm9
	vpmullw	%ymm10, %ymm7, %ymm7
	vpmulhw	%ymm12, %ymm11, %ymm12
	vpmulhw	%ymm13, %ymm11, %ymm13
	vpmulhw	%ymm14, %ymm11, %ymm14
	vpmulhw	%ymm10, %ymm11, %ymm10
	vpmulhw	%ymm5, %ymm0, %ymm5
	vpmulhw	%ymm8, %ymm0, %ymm8
	vpmulhw	%ymm9, %ymm0, %ymm9
	vpmulhw	%ymm7, %ymm0, %ymm7
	vpsubw	%ymm5, %ymm12, %ymm5
	vpsubw	%ymm8, %ymm13, %ymm8
	vpsubw	%ymm9, %ymm14, %ymm9
	vpsubw	%ymm7, %ymm10, %ymm7
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm1
	vpsubw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, (%rcx)
	vmovdqu	%ymm3, 32(%rcx)
	vmovdqu	%ymm6, 64(%rcx)
	vmovdqu	%ymm4, 96(%rcx)
	vmovdqu	%ymm5, 128(%rcx)
	vmovdqu	%ymm8, 160(%rcx)
	vmovdqu	%ymm9, 192(%rcx)
	vmovdqu	%ymm7, 224(%rcx)
	vmovdqu	392(%rsi), %ymm12
	vmovdqu	456(%rsi), %ymm1
	vmovdqu	424(%rsi), %ymm2
	vmovdqu	488(%rsi), %ymm5
	vmovdqu	256(%rcx), %ymm3
	vmovdqu	288(%rcx), %ymm4
	vmovdqu	320(%rcx), %ymm15
	vmovdqu	352(%rcx), %ymm11
	vmovdqu	384(%rcx), %ymm7
	vmovdqu	416(%rcx), %ymm8
	vmovdqu	448(%rcx), %ymm13
	vmovdqu	480(%rcx), %ymm14
	vpsubw	%ymm15, %ymm3, %ymm6
	vpsubw	%ymm11, %ymm4, %ymm9
	vpsubw	%ymm13, %ymm7, %ymm10
	vpaddw	%ymm3, %ymm15, %ymm3
	vpaddw	%ymm4, %ymm11, %ymm4
	vpmullw	%ymm6, %ymm12, %ymm11
	vpaddw	%ymm7, %ymm13, %ymm7
	vpmullw	%ymm9, %ymm12, %ymm12
	vpsubw	%ymm14, %ymm8, %ymm13
	vpaddw	%ymm8, %ymm14, %ymm8
	vpmullw	%ymm10, %ymm1, %ymm14
	vpmullw	%ymm13, %ymm1, %ymm1
	vpmulhw	%ymm6, %ymm2, %ymm6
	vpmulhw	%ymm9, %ymm2, %ymm2
	vpmulhw	%ymm10, %ymm5, %ymm9
	vpmulhw	%ymm13, %ymm5, %ymm5
	vpmulhw	%ymm11, %ymm0, %ymm10
	vpmulhw	%ymm12, %ymm0, %ymm11
	vpmulhw	%ymm14, %ymm0, %ymm12
	vpmulhw	%ymm1, %ymm0, %ymm1
	vpsubw	%ymm10, %ymm6, %ymm6
	vpsubw	%ymm11, %ymm2, %ymm11
	vpsubw	%ymm12, %ymm9, %ymm9
	vpsubw	%ymm1, %ymm5, %ymm13
	vmovdqu	glob_data + 928(%rip), %ymm1
	vmovdqu	520(%rsi), %ymm2
	vmovdqu	552(%rsi), %ymm5
	vpmulhw	%ymm1, %ymm3, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm3, %ymm10
	vpmulhw	%ymm1, %ymm4, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm12
	vpmulhw	%ymm1, %ymm7, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm7, %ymm7
	vpmulhw	%ymm1, %ymm8, %ymm3
	vpsraw	$10, %ymm3, %ymm3
	vpmullw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm8, %ymm8
	vpsubw	%ymm7, %ymm10, %ymm15
	vpsubw	%ymm8, %ymm12, %ymm3
	vpsubw	%ymm9, %ymm6, %ymm4
	vpaddw	%ymm10, %ymm7, %ymm7
	vpaddw	%ymm12, %ymm8, %ymm8
	vpmullw	%ymm15, %ymm2, %ymm10
	vpaddw	%ymm6, %ymm9, %ymm9
	vpmullw	%ymm3, %ymm2, %ymm6
	vpsubw	%ymm13, %ymm11, %ymm12
	vpaddw	%ymm11, %ymm13, %ymm11
	vpmullw	%ymm4, %ymm2, %ymm13
	vpmullw	%ymm12, %ymm2, %ymm14
	vpmulhw	%ymm15, %ymm5, %ymm2
	vpmulhw	%ymm3, %ymm5, %ymm3
	vpmulhw	%ymm4, %ymm5, %ymm4
	vpmulhw	%ymm12, %ymm5, %ymm5
	vpmulhw	%ymm10, %ymm0, %ymm10
	vpmulhw	%ymm6, %ymm0, %ymm12
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm14, %ymm0, %ymm6
	vpsubw	%ymm10, %ymm2, %ymm2
	vpsubw	%ymm12, %ymm3, %ymm3
	vpsubw	%ymm13, %ymm4, %ymm4
	vpsubw	%ymm6, %ymm5, %ymm5
	vpslld	$16, %ymm8, %ymm6
	vpblendw	$170, %ymm6, %ymm7, %ymm6
	vpsrld	$16, %ymm7, %ymm7
	vpblendw	$170, %ymm8, %ymm7, %ymm7
	vpslld	$16, %ymm11, %ymm8
	vpblendw	$170, %ymm8, %ymm9, %ymm10
	vpsrld	$16, %ymm9, %ymm8
	vpblendw	$170, %ymm11, %ymm8, %ymm11
	vpslld	$16, %ymm3, %ymm8
	vpblendw	$170, %ymm8, %ymm2, %ymm8
	vpsrld	$16, %ymm2, %ymm2
	vpblendw	$170, %ymm3, %ymm2, %ymm9
	vpslld	$16, %ymm5, %ymm2
	vpblendw	$170, %ymm2, %ymm4, %ymm12
	vpsrld	$16, %ymm4, %ymm2
	vpblendw	$170, %ymm5, %ymm2, %ymm13
	vmovdqu	584(%rsi), %ymm2
	vmovdqu	616(%rsi), %ymm5
	vpsubw	%ymm7, %ymm6, %ymm15
	vpsubw	%ymm11, %ymm10, %ymm3
	vpsubw	%ymm9, %ymm8, %ymm4
	vpaddw	%ymm6, %ymm7, %ymm6
	vpaddw	%ymm10, %ymm11, %ymm7
	vpmullw	%ymm15, %ymm2, %ymm10
	vpaddw	%ymm8, %ymm9, %ymm8
	vpmullw	%ymm3, %ymm2, %ymm9
	vpsubw	%ymm13, %ymm12, %ymm11
	vpaddw	%ymm12, %ymm13, %ymm12
	vpmullw	%ymm4, %ymm2, %ymm13
	vpmullw	%ymm11, %ymm2, %ymm14
	vpmulhw	%ymm15, %ymm5, %ymm2
	vpmulhw	%ymm3, %ymm5, %ymm3
	vpmulhw	%ymm4, %ymm5, %ymm4
	vpmulhw	%ymm11, %ymm5, %ymm5
	vpmulhw	%ymm10, %ymm0, %ymm10
	vpmulhw	%ymm9, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm14, %ymm0, %ymm9
	vpsubw	%ymm10, %ymm2, %ymm2
	vpsubw	%ymm11, %ymm3, %ymm3
	vpsubw	%ymm13, %ymm4, %ymm4
	vpsubw	%ymm9, %ymm5, %ymm5
	vpmulhw	%ymm1, %ymm6, %ymm9
	vpsraw	$10, %ymm9, %ymm9
	vpmullw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm9, %ymm6, %ymm6
	vmovsldup	%ymm7, %ymm9
	vpblendd	$170, %ymm9, %ymm6, %ymm9
	vpsrlq	$32, %ymm6, %ymm6
	vpblendd	$170, %ymm7, %ymm6, %ymm10
	vmovsldup	%ymm12, %ymm6
	vpblendd	$170, %ymm6, %ymm8, %ymm11
	vpsrlq	$32, %ymm8, %ymm6
	vpblendd	$170, %ymm12, %ymm6, %ymm14
	vmovsldup	%ymm3, %ymm6
	vpblendd	$170, %ymm6, %ymm2, %ymm12
	vpsrlq	$32, %ymm2, %ymm2
	vpblendd	$170, %ymm3, %ymm2, %ymm13
	vmovsldup	%ymm5, %ymm2
	vpblendd	$170, %ymm2, %ymm4, %ymm2
	vpsrlq	$32, %ymm4, %ymm3
	vpblendd	$170, %ymm5, %ymm3, %ymm3
	vmovdqu	648(%rsi), %ymm4
	vmovdqu	680(%rsi), %ymm5
	vpsubw	%ymm10, %ymm9, %ymm6
	vpsubw	%ymm14, %ymm11, %ymm7
	vpsubw	%ymm13, %ymm12, %ymm8
	vpaddw	%ymm9, %ymm10, %ymm9
	vpaddw	%ymm11, %ymm14, %ymm10
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
	vpmulhw	%ymm14, %ymm5, %ymm5
	vpmulhw	%ymm11, %ymm0, %ymm11
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm3, %ymm0, %ymm3
	vpmulhw	%ymm4, %ymm0, %ymm4
	vpsubw	%ymm11, %ymm6, %ymm6
	vpsubw	%ymm13, %ymm7, %ymm7
	vpsubw	%ymm3, %ymm8, %ymm3
	vpsubw	%ymm4, %ymm5, %ymm4
	vpmulhw	%ymm1, %ymm9, %ymm5
	vpsraw	$10, %ymm5, %ymm5
	vpmullw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm9, %ymm8
	vpunpcklqdq	%ymm10, %ymm8, %ymm5
	vpunpckhqdq	%ymm10, %ymm8, %ymm8
	vpunpcklqdq	%ymm2, %ymm12, %ymm9
	vpunpckhqdq	%ymm2, %ymm12, %ymm2
	vpunpcklqdq	%ymm7, %ymm6, %ymm10
	vpunpckhqdq	%ymm7, %ymm6, %ymm6
	vpunpcklqdq	%ymm4, %ymm3, %ymm7
	vpunpckhqdq	%ymm4, %ymm3, %ymm3
	vmovdqu	712(%rsi), %ymm4
	vmovdqu	744(%rsi), %ymm11
	vpsubw	%ymm8, %ymm5, %ymm12
	vpsubw	%ymm2, %ymm9, %ymm13
	vpsubw	%ymm6, %ymm10, %ymm14
	vpaddw	%ymm5, %ymm8, %ymm5
	vpaddw	%ymm9, %ymm2, %ymm2
	vpmullw	%ymm12, %ymm4, %ymm8
	vpaddw	%ymm10, %ymm6, %ymm6
	vpmullw	%ymm13, %ymm4, %ymm9
	vpsubw	%ymm3, %ymm7, %ymm10
	vpaddw	%ymm7, %ymm3, %ymm3
	vpmullw	%ymm14, %ymm4, %ymm7
	vpmullw	%ymm10, %ymm4, %ymm4
	vpmulhw	%ymm12, %ymm11, %ymm12
	vpmulhw	%ymm13, %ymm11, %ymm13
	vpmulhw	%ymm14, %ymm11, %ymm14
	vpmulhw	%ymm10, %ymm11, %ymm10
	vpmulhw	%ymm8, %ymm0, %ymm8
	vpmulhw	%ymm9, %ymm0, %ymm9
	vpmulhw	%ymm7, %ymm0, %ymm7
	vpmulhw	%ymm4, %ymm0, %ymm4
	vpsubw	%ymm8, %ymm12, %ymm8
	vpsubw	%ymm9, %ymm13, %ymm9
	vpsubw	%ymm7, %ymm14, %ymm7
	vpsubw	%ymm4, %ymm10, %ymm4
	vpmulhw	%ymm1, %ymm5, %ymm10
	vpsraw	$10, %ymm10, %ymm10
	vpmullw	%ymm0, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm5, %ymm10
	vperm2i128	$32, %ymm2, %ymm10, %ymm5
	vperm2i128	$49, %ymm2, %ymm10, %ymm2
	vperm2i128	$32, %ymm3, %ymm6, %ymm10
	vperm2i128	$49, %ymm3, %ymm6, %ymm3
	vperm2i128	$32, %ymm9, %ymm8, %ymm6
	vperm2i128	$49, %ymm9, %ymm8, %ymm8
	vperm2i128	$32, %ymm4, %ymm7, %ymm9
	vperm2i128	$49, %ymm4, %ymm7, %ymm4
	vpbroadcastd	776(%rsi), %ymm7
	vpbroadcastd	780(%rsi), %ymm11
	vpsubw	%ymm2, %ymm5, %ymm12
	vpsubw	%ymm3, %ymm10, %ymm13
	vpsubw	%ymm8, %ymm6, %ymm14
	vpaddw	%ymm5, %ymm2, %ymm2
	vpaddw	%ymm10, %ymm3, %ymm3
	vpmullw	%ymm12, %ymm7, %ymm5
	vpaddw	%ymm6, %ymm8, %ymm6
	vpmullw	%ymm13, %ymm7, %ymm8
	vpsubw	%ymm4, %ymm9, %ymm10
	vpaddw	%ymm9, %ymm4, %ymm4
	vpmullw	%ymm14, %ymm7, %ymm9
	vpmullw	%ymm10, %ymm7, %ymm7
	vpmulhw	%ymm12, %ymm11, %ymm12
	vpmulhw	%ymm13, %ymm11, %ymm13
	vpmulhw	%ymm14, %ymm11, %ymm14
	vpmulhw	%ymm10, %ymm11, %ymm10
	vpmulhw	%ymm5, %ymm0, %ymm5
	vpmulhw	%ymm8, %ymm0, %ymm8
	vpmulhw	%ymm9, %ymm0, %ymm9
	vpmulhw	%ymm7, %ymm0, %ymm7
	vpsubw	%ymm5, %ymm12, %ymm5
	vpsubw	%ymm8, %ymm13, %ymm8
	vpsubw	%ymm9, %ymm14, %ymm9
	vpsubw	%ymm7, %ymm10, %ymm7
	vpmulhw	%ymm1, %ymm2, %ymm1
	vpsraw	$10, %ymm1, %ymm1
	vpmullw	%ymm0, %ymm1, %ymm1
	vpsubw	%ymm1, %ymm2, %ymm10
	vmovdqu	%ymm5, 384(%rcx)
	vmovdqu	%ymm8, 416(%rcx)
	vmovdqu	%ymm9, 448(%rcx)
	vmovdqu	%ymm7, 480(%rcx)
	vpbroadcastd	784(%rsi), %ymm1
	vpbroadcastd	788(%rsi), %ymm2
	vmovdqu	%ymm4, %ymm7
	vmovdqu	%ymm3, %ymm4
	vmovdqu	%ymm10, %ymm3
	vmovdqu	(%rcx), %ymm9
	vmovdqu	32(%rcx), %ymm13
	vmovdqu	64(%rcx), %ymm5
	vmovdqu	96(%rcx), %ymm8
	vpsubw	%ymm3, %ymm9, %ymm10
	vpsubw	%ymm4, %ymm13, %ymm11
	vpsubw	%ymm6, %ymm5, %ymm12
	vpaddw	%ymm9, %ymm3, %ymm3
	vpaddw	%ymm13, %ymm4, %ymm4
	vpmullw	%ymm10, %ymm1, %ymm13
	vpaddw	%ymm5, %ymm6, %ymm5
	vpmullw	%ymm11, %ymm1, %ymm6
	vpsubw	%ymm7, %ymm8, %ymm14
	vpaddw	%ymm8, %ymm7, %ymm7
	vpmullw	%ymm12, %ymm1, %ymm8
	vpmullw	%ymm14, %ymm1, %ymm9
	vpmulhw	%ymm10, %ymm2, %ymm10
	vpmulhw	%ymm11, %ymm2, %ymm11
	vpmulhw	%ymm12, %ymm2, %ymm12
	vpmulhw	%ymm14, %ymm2, %ymm14
	vpmulhw	%ymm13, %ymm0, %ymm13
	vpmulhw	%ymm6, %ymm0, %ymm6
	vpmulhw	%ymm8, %ymm0, %ymm8
	vpmulhw	%ymm9, %ymm0, %ymm9
	vpsubw	%ymm13, %ymm10, %ymm10
	vpsubw	%ymm6, %ymm11, %ymm6
	vpsubw	%ymm8, %ymm12, %ymm11
	vpsubw	%ymm9, %ymm14, %ymm12
	vmovdqu	glob_data + 864(%rip), %ymm8
	vmovdqu	glob_data + 896(%rip), %ymm9
	vmovdqu	%ymm10, 256(%rcx)
	vmovdqu	%ymm6, 288(%rcx)
	vmovdqu	%ymm11, 320(%rcx)
	vmovdqu	%ymm12, 352(%rcx)
	vpmullw	%ymm3, %ymm8, %ymm6
	vpmulhw	%ymm3, %ymm9, %ymm3
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm3, %ymm3
	vpmullw	%ymm4, %ymm8, %ymm6
	vpmulhw	%ymm4, %ymm9, %ymm4
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm4, %ymm4
	vpmullw	%ymm5, %ymm8, %ymm6
	vpmulhw	%ymm5, %ymm9, %ymm5
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm5, %ymm5
	vpmullw	%ymm7, %ymm8, %ymm6
	vpmulhw	%ymm7, %ymm9, %ymm7
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm7, %ymm6
	vmovdqu	%ymm3, (%rcx)
	vmovdqu	%ymm4, 32(%rcx)
	vmovdqu	%ymm5, 64(%rcx)
	vmovdqu	%ymm6, 96(%rcx)
	vmovdqu	384(%rcx), %ymm4
	vmovdqu	416(%rcx), %ymm5
	vmovdqu	448(%rcx), %ymm7
	vmovdqu	480(%rcx), %ymm10
	vmovdqu	128(%rcx), %ymm6
	vmovdqu	160(%rcx), %ymm9
	vmovdqu	192(%rcx), %ymm8
	vmovdqu	224(%rcx), %ymm11
	vpsubw	%ymm4, %ymm6, %ymm12
	vpsubw	%ymm5, %ymm9, %ymm13
	vpsubw	%ymm7, %ymm8, %ymm3
	vpaddw	%ymm6, %ymm4, %ymm4
	vpaddw	%ymm9, %ymm5, %ymm5
	vpmullw	%ymm12, %ymm1, %ymm6
	vpaddw	%ymm8, %ymm7, %ymm7
	vpmullw	%ymm13, %ymm1, %ymm8
	vpsubw	%ymm10, %ymm11, %ymm9
	vpaddw	%ymm11, %ymm10, %ymm10
	vpmullw	%ymm3, %ymm1, %ymm11
	vpmullw	%ymm9, %ymm1, %ymm1
	vpmulhw	%ymm12, %ymm2, %ymm12
	vpmulhw	%ymm13, %ymm2, %ymm13
	vpmulhw	%ymm3, %ymm2, %ymm3
	vpmulhw	%ymm9, %ymm2, %ymm2
	vpmulhw	%ymm6, %ymm0, %ymm6
	vpmulhw	%ymm8, %ymm0, %ymm8
	vpmulhw	%ymm11, %ymm0, %ymm9
	vpmulhw	%ymm1, %ymm0, %ymm11
	vpsubw	%ymm6, %ymm12, %ymm1
	vpsubw	%ymm8, %ymm13, %ymm6
	vpsubw	%ymm9, %ymm3, %ymm8
	vpsubw	%ymm11, %ymm2, %ymm9
	vmovdqu	glob_data + 864(%rip), %ymm2
	vmovdqu	glob_data + 896(%rip), %ymm3
	vmovdqu	%ymm1, 384(%rcx)
	vmovdqu	%ymm6, 416(%rcx)
	vmovdqu	%ymm8, 448(%rcx)
	vmovdqu	%ymm9, 480(%rcx)
	vpmullw	%ymm4, %ymm2, %ymm1
	vpmulhw	%ymm4, %ymm3, %ymm4
	vpmulhw	%ymm0, %ymm1, %ymm1
	vpsubw	%ymm1, %ymm4, %ymm1
	vpmullw	%ymm5, %ymm2, %ymm4
	vpmulhw	%ymm5, %ymm3, %ymm5
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm5, %ymm4
	vpmullw	%ymm7, %ymm2, %ymm5
	vpmulhw	%ymm7, %ymm3, %ymm6
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm6, %ymm5
	vpmullw	%ymm10, %ymm2, %ymm2
	vpmulhw	%ymm10, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm2, %ymm0
	vpsubw	%ymm0, %ymm3, %ymm0
	vmovdqu	%ymm1, 128(%rcx)
	vmovdqu	%ymm4, 160(%rcx)
	vmovdqu	%ymm5, 192(%rcx)
	vmovdqu	%ymm0, 224(%rcx)
	ret
L_poly_getnoise_eta1_4x$1:
	leaq	32(%rsp), %rax
	leaq	160(%rsp), %rcx
	leaq	288(%rsp), %rsi
	leaq	416(%rsp), %rdi
	movq	%rdx, 544(%rsp)
	movq	%r8, 552(%rsp)
	movq	%r9, 560(%rsp)
	movq	%r10, 568(%rsp)
	movb	%r11b, 576(%rsp)
	incb	%r11b
	movb	%r11b, 577(%rsp)
	incb	%r11b
	movb	%r11b, 578(%rsp)
	incb	%r11b
	movb	%r11b, 579(%rsp)
	leaq	576(%rsp), %r10
	leaq	-824(%rsp), %rsp
	call	L_shake256x4_A128__A32_A1$1
L_poly_getnoise_eta1_4x$2:
	leaq	824(%rsp), %rsp
	movq	544(%rsp), %rdx
	movq	552(%rsp), %r8
	movq	560(%rsp), %r9
	movq	568(%rsp), %r10
	movl	$1431655765, 576(%rsp)
	movl	$858993459, 580(%rsp)
	movl	$50529027, 584(%rsp)
	movl	$252645135, 588(%rsp)
	vpbroadcastd	576(%rsp), %ymm0
	vpbroadcastd	580(%rsp), %ymm1
	vpbroadcastd	584(%rsp), %ymm2
	vpbroadcastd	588(%rsp), %ymm3
	vmovdqu	(%rax), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm5
	vpaddb	%ymm5, %ymm4, %ymm4
	vpsrlw	$2, %ymm4, %ymm5
	vpand	%ymm4, %ymm1, %ymm4
	vpand	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm1, %ymm4, %ymm4
	vpsubb	%ymm5, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpand	%ymm4, %ymm3, %ymm4
	vpand	%ymm5, %ymm3, %ymm5
	vpsubb	%ymm2, %ymm4, %ymm4
	vpsubb	%ymm2, %ymm5, %ymm5
	vpunpcklbw	%ymm5, %ymm4, %ymm6
	vpunpckhbw	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm6, %xmm5
	vpmovsxbw	%xmm5, %ymm5
	vextracti128	$1, %ymm6, %xmm6
	vpmovsxbw	%xmm6, %ymm6
	vmovdqu	%xmm4, %xmm7
	vpmovsxbw	%xmm7, %ymm7
	vextracti128	$1, %ymm4, %xmm4
	vpmovsxbw	%xmm4, %ymm4
	vmovdqu	%ymm5, (%rdx)
	vmovdqu	%ymm7, 32(%rdx)
	vmovdqu	%ymm6, 64(%rdx)
	vmovdqu	%ymm4, 96(%rdx)
	vmovdqu	32(%rax), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm5
	vpaddb	%ymm5, %ymm4, %ymm4
	vpsrlw	$2, %ymm4, %ymm5
	vpand	%ymm4, %ymm1, %ymm4
	vpand	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm1, %ymm4, %ymm4
	vpsubb	%ymm5, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpand	%ymm4, %ymm3, %ymm4
	vpand	%ymm5, %ymm3, %ymm5
	vpsubb	%ymm2, %ymm4, %ymm4
	vpsubb	%ymm2, %ymm5, %ymm5
	vpunpcklbw	%ymm5, %ymm4, %ymm6
	vpunpckhbw	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm6, %xmm5
	vpmovsxbw	%xmm5, %ymm5
	vextracti128	$1, %ymm6, %xmm6
	vpmovsxbw	%xmm6, %ymm6
	vmovdqu	%xmm4, %xmm7
	vpmovsxbw	%xmm7, %ymm7
	vextracti128	$1, %ymm4, %xmm4
	vpmovsxbw	%xmm4, %ymm4
	vmovdqu	%ymm5, 128(%rdx)
	vmovdqu	%ymm7, 160(%rdx)
	vmovdqu	%ymm6, 192(%rdx)
	vmovdqu	%ymm4, 224(%rdx)
	vmovdqu	64(%rax), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm5
	vpaddb	%ymm5, %ymm4, %ymm4
	vpsrlw	$2, %ymm4, %ymm5
	vpand	%ymm4, %ymm1, %ymm4
	vpand	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm1, %ymm4, %ymm4
	vpsubb	%ymm5, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpand	%ymm4, %ymm3, %ymm4
	vpand	%ymm5, %ymm3, %ymm5
	vpsubb	%ymm2, %ymm4, %ymm4
	vpsubb	%ymm2, %ymm5, %ymm5
	vpunpcklbw	%ymm5, %ymm4, %ymm6
	vpunpckhbw	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm6, %xmm5
	vpmovsxbw	%xmm5, %ymm5
	vextracti128	$1, %ymm6, %xmm6
	vpmovsxbw	%xmm6, %ymm6
	vmovdqu	%xmm4, %xmm7
	vpmovsxbw	%xmm7, %ymm7
	vextracti128	$1, %ymm4, %xmm4
	vpmovsxbw	%xmm4, %ymm4
	vmovdqu	%ymm5, 256(%rdx)
	vmovdqu	%ymm7, 288(%rdx)
	vmovdqu	%ymm6, 320(%rdx)
	vmovdqu	%ymm4, 352(%rdx)
	vmovdqu	96(%rax), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm0
	vpaddb	%ymm0, %ymm4, %ymm0
	vpsrlw	$2, %ymm0, %ymm4
	vpand	%ymm0, %ymm1, %ymm0
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm0, %ymm0
	vpsubb	%ymm4, %ymm0, %ymm0
	vpsrlw	$4, %ymm0, %ymm1
	vpand	%ymm0, %ymm3, %ymm0
	vpand	%ymm1, %ymm3, %ymm1
	vpsubb	%ymm2, %ymm0, %ymm0
	vpsubb	%ymm2, %ymm1, %ymm1
	vpunpcklbw	%ymm1, %ymm0, %ymm2
	vpunpckhbw	%ymm1, %ymm0, %ymm0
	vmovdqu	%xmm2, %xmm1
	vpmovsxbw	%xmm1, %ymm1
	vextracti128	$1, %ymm2, %xmm2
	vpmovsxbw	%xmm2, %ymm2
	vmovdqu	%xmm0, %xmm3
	vpmovsxbw	%xmm3, %ymm3
	vextracti128	$1, %ymm0, %xmm0
	vpmovsxbw	%xmm0, %ymm0
	vmovdqu	%ymm1, 384(%rdx)
	vmovdqu	%ymm3, 416(%rdx)
	vmovdqu	%ymm2, 448(%rdx)
	vmovdqu	%ymm0, 480(%rdx)
	movl	$1431655765, 588(%rsp)
	movl	$858993459, 584(%rsp)
	movl	$50529027, 580(%rsp)
	movl	$252645135, 576(%rsp)
	vpbroadcastd	588(%rsp), %ymm0
	vpbroadcastd	584(%rsp), %ymm1
	vpbroadcastd	580(%rsp), %ymm2
	vpbroadcastd	576(%rsp), %ymm3
	vmovdqu	(%rcx), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm5
	vpaddb	%ymm5, %ymm4, %ymm4
	vpsrlw	$2, %ymm4, %ymm5
	vpand	%ymm4, %ymm1, %ymm4
	vpand	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm1, %ymm4, %ymm4
	vpsubb	%ymm5, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpand	%ymm4, %ymm3, %ymm4
	vpand	%ymm5, %ymm3, %ymm5
	vpsubb	%ymm2, %ymm4, %ymm4
	vpsubb	%ymm2, %ymm5, %ymm5
	vpunpcklbw	%ymm5, %ymm4, %ymm6
	vpunpckhbw	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm6, %xmm5
	vpmovsxbw	%xmm5, %ymm5
	vextracti128	$1, %ymm6, %xmm6
	vpmovsxbw	%xmm6, %ymm6
	vmovdqu	%xmm4, %xmm7
	vpmovsxbw	%xmm7, %ymm7
	vextracti128	$1, %ymm4, %xmm4
	vpmovsxbw	%xmm4, %ymm4
	vmovdqu	%ymm5, (%r8)
	vmovdqu	%ymm7, 32(%r8)
	vmovdqu	%ymm6, 64(%r8)
	vmovdqu	%ymm4, 96(%r8)
	vmovdqu	32(%rcx), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm5
	vpaddb	%ymm5, %ymm4, %ymm4
	vpsrlw	$2, %ymm4, %ymm5
	vpand	%ymm4, %ymm1, %ymm4
	vpand	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm1, %ymm4, %ymm4
	vpsubb	%ymm5, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpand	%ymm4, %ymm3, %ymm4
	vpand	%ymm5, %ymm3, %ymm5
	vpsubb	%ymm2, %ymm4, %ymm4
	vpsubb	%ymm2, %ymm5, %ymm5
	vpunpcklbw	%ymm5, %ymm4, %ymm6
	vpunpckhbw	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm6, %xmm5
	vpmovsxbw	%xmm5, %ymm5
	vextracti128	$1, %ymm6, %xmm6
	vpmovsxbw	%xmm6, %ymm6
	vmovdqu	%xmm4, %xmm7
	vpmovsxbw	%xmm7, %ymm7
	vextracti128	$1, %ymm4, %xmm4
	vpmovsxbw	%xmm4, %ymm4
	vmovdqu	%ymm5, 128(%r8)
	vmovdqu	%ymm7, 160(%r8)
	vmovdqu	%ymm6, 192(%r8)
	vmovdqu	%ymm4, 224(%r8)
	vmovdqu	64(%rcx), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm5
	vpaddb	%ymm5, %ymm4, %ymm4
	vpsrlw	$2, %ymm4, %ymm5
	vpand	%ymm4, %ymm1, %ymm4
	vpand	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm1, %ymm4, %ymm4
	vpsubb	%ymm5, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpand	%ymm4, %ymm3, %ymm4
	vpand	%ymm5, %ymm3, %ymm5
	vpsubb	%ymm2, %ymm4, %ymm4
	vpsubb	%ymm2, %ymm5, %ymm5
	vpunpcklbw	%ymm5, %ymm4, %ymm6
	vpunpckhbw	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm6, %xmm5
	vpmovsxbw	%xmm5, %ymm5
	vextracti128	$1, %ymm6, %xmm6
	vpmovsxbw	%xmm6, %ymm6
	vmovdqu	%xmm4, %xmm7
	vpmovsxbw	%xmm7, %ymm7
	vextracti128	$1, %ymm4, %xmm4
	vpmovsxbw	%xmm4, %ymm4
	vmovdqu	%ymm5, 256(%r8)
	vmovdqu	%ymm7, 288(%r8)
	vmovdqu	%ymm6, 320(%r8)
	vmovdqu	%ymm4, 352(%r8)
	vmovdqu	96(%rcx), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm0
	vpaddb	%ymm0, %ymm4, %ymm0
	vpsrlw	$2, %ymm0, %ymm4
	vpand	%ymm0, %ymm1, %ymm0
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm0, %ymm0
	vpsubb	%ymm4, %ymm0, %ymm0
	vpsrlw	$4, %ymm0, %ymm1
	vpand	%ymm0, %ymm3, %ymm0
	vpand	%ymm1, %ymm3, %ymm1
	vpsubb	%ymm2, %ymm0, %ymm0
	vpsubb	%ymm2, %ymm1, %ymm1
	vpunpcklbw	%ymm1, %ymm0, %ymm2
	vpunpckhbw	%ymm1, %ymm0, %ymm0
	vmovdqu	%xmm2, %xmm1
	vpmovsxbw	%xmm1, %ymm1
	vextracti128	$1, %ymm2, %xmm2
	vpmovsxbw	%xmm2, %ymm2
	vmovdqu	%xmm0, %xmm3
	vpmovsxbw	%xmm3, %ymm3
	vextracti128	$1, %ymm0, %xmm0
	vpmovsxbw	%xmm0, %ymm0
	vmovdqu	%ymm1, 384(%r8)
	vmovdqu	%ymm3, 416(%r8)
	vmovdqu	%ymm2, 448(%r8)
	vmovdqu	%ymm0, 480(%r8)
	movl	$1431655765, 576(%rsp)
	movl	$858993459, 580(%rsp)
	movl	$50529027, 584(%rsp)
	movl	$252645135, 588(%rsp)
	vpbroadcastd	576(%rsp), %ymm0
	vpbroadcastd	580(%rsp), %ymm1
	vpbroadcastd	584(%rsp), %ymm2
	vpbroadcastd	588(%rsp), %ymm3
	vmovdqu	(%rsi), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm5
	vpaddb	%ymm5, %ymm4, %ymm4
	vpsrlw	$2, %ymm4, %ymm5
	vpand	%ymm4, %ymm1, %ymm4
	vpand	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm1, %ymm4, %ymm4
	vpsubb	%ymm5, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpand	%ymm4, %ymm3, %ymm4
	vpand	%ymm5, %ymm3, %ymm5
	vpsubb	%ymm2, %ymm4, %ymm4
	vpsubb	%ymm2, %ymm5, %ymm5
	vpunpcklbw	%ymm5, %ymm4, %ymm6
	vpunpckhbw	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm6, %xmm5
	vpmovsxbw	%xmm5, %ymm5
	vextracti128	$1, %ymm6, %xmm6
	vpmovsxbw	%xmm6, %ymm6
	vmovdqu	%xmm4, %xmm7
	vpmovsxbw	%xmm7, %ymm7
	vextracti128	$1, %ymm4, %xmm4
	vpmovsxbw	%xmm4, %ymm4
	vmovdqu	%ymm5, (%r9)
	vmovdqu	%ymm7, 32(%r9)
	vmovdqu	%ymm6, 64(%r9)
	vmovdqu	%ymm4, 96(%r9)
	vmovdqu	32(%rsi), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm5
	vpaddb	%ymm5, %ymm4, %ymm4
	vpsrlw	$2, %ymm4, %ymm5
	vpand	%ymm4, %ymm1, %ymm4
	vpand	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm1, %ymm4, %ymm4
	vpsubb	%ymm5, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpand	%ymm4, %ymm3, %ymm4
	vpand	%ymm5, %ymm3, %ymm5
	vpsubb	%ymm2, %ymm4, %ymm4
	vpsubb	%ymm2, %ymm5, %ymm5
	vpunpcklbw	%ymm5, %ymm4, %ymm6
	vpunpckhbw	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm6, %xmm5
	vpmovsxbw	%xmm5, %ymm5
	vextracti128	$1, %ymm6, %xmm6
	vpmovsxbw	%xmm6, %ymm6
	vmovdqu	%xmm4, %xmm7
	vpmovsxbw	%xmm7, %ymm7
	vextracti128	$1, %ymm4, %xmm4
	vpmovsxbw	%xmm4, %ymm4
	vmovdqu	%ymm5, 128(%r9)
	vmovdqu	%ymm7, 160(%r9)
	vmovdqu	%ymm6, 192(%r9)
	vmovdqu	%ymm4, 224(%r9)
	vmovdqu	64(%rsi), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm5
	vpaddb	%ymm5, %ymm4, %ymm4
	vpsrlw	$2, %ymm4, %ymm5
	vpand	%ymm4, %ymm1, %ymm4
	vpand	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm1, %ymm4, %ymm4
	vpsubb	%ymm5, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpand	%ymm4, %ymm3, %ymm4
	vpand	%ymm5, %ymm3, %ymm5
	vpsubb	%ymm2, %ymm4, %ymm4
	vpsubb	%ymm2, %ymm5, %ymm5
	vpunpcklbw	%ymm5, %ymm4, %ymm6
	vpunpckhbw	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm6, %xmm5
	vpmovsxbw	%xmm5, %ymm5
	vextracti128	$1, %ymm6, %xmm6
	vpmovsxbw	%xmm6, %ymm6
	vmovdqu	%xmm4, %xmm7
	vpmovsxbw	%xmm7, %ymm7
	vextracti128	$1, %ymm4, %xmm4
	vpmovsxbw	%xmm4, %ymm4
	vmovdqu	%ymm5, 256(%r9)
	vmovdqu	%ymm7, 288(%r9)
	vmovdqu	%ymm6, 320(%r9)
	vmovdqu	%ymm4, 352(%r9)
	vmovdqu	96(%rsi), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm0
	vpaddb	%ymm0, %ymm4, %ymm0
	vpsrlw	$2, %ymm0, %ymm4
	vpand	%ymm0, %ymm1, %ymm0
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm0, %ymm0
	vpsubb	%ymm4, %ymm0, %ymm0
	vpsrlw	$4, %ymm0, %ymm1
	vpand	%ymm0, %ymm3, %ymm0
	vpand	%ymm1, %ymm3, %ymm1
	vpsubb	%ymm2, %ymm0, %ymm0
	vpsubb	%ymm2, %ymm1, %ymm1
	vpunpcklbw	%ymm1, %ymm0, %ymm2
	vpunpckhbw	%ymm1, %ymm0, %ymm0
	vmovdqu	%xmm2, %xmm1
	vpmovsxbw	%xmm1, %ymm1
	vextracti128	$1, %ymm2, %xmm2
	vpmovsxbw	%xmm2, %ymm2
	vmovdqu	%xmm0, %xmm3
	vpmovsxbw	%xmm3, %ymm3
	vextracti128	$1, %ymm0, %xmm0
	vpmovsxbw	%xmm0, %ymm0
	vmovdqu	%ymm1, 384(%r9)
	vmovdqu	%ymm3, 416(%r9)
	vmovdqu	%ymm2, 448(%r9)
	vmovdqu	%ymm0, 480(%r9)
	movl	$1431655765, 588(%rsp)
	movl	$858993459, 584(%rsp)
	movl	$50529027, 580(%rsp)
	movl	$252645135, 576(%rsp)
	vpbroadcastd	588(%rsp), %ymm0
	vpbroadcastd	584(%rsp), %ymm1
	vpbroadcastd	580(%rsp), %ymm2
	vpbroadcastd	576(%rsp), %ymm3
	vmovdqu	(%rdi), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm5
	vpaddb	%ymm5, %ymm4, %ymm4
	vpsrlw	$2, %ymm4, %ymm5
	vpand	%ymm4, %ymm1, %ymm4
	vpand	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm1, %ymm4, %ymm4
	vpsubb	%ymm5, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpand	%ymm4, %ymm3, %ymm4
	vpand	%ymm5, %ymm3, %ymm5
	vpsubb	%ymm2, %ymm4, %ymm4
	vpsubb	%ymm2, %ymm5, %ymm5
	vpunpcklbw	%ymm5, %ymm4, %ymm6
	vpunpckhbw	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm6, %xmm5
	vpmovsxbw	%xmm5, %ymm5
	vextracti128	$1, %ymm6, %xmm6
	vpmovsxbw	%xmm6, %ymm6
	vmovdqu	%xmm4, %xmm7
	vpmovsxbw	%xmm7, %ymm7
	vextracti128	$1, %ymm4, %xmm4
	vpmovsxbw	%xmm4, %ymm4
	vmovdqu	%ymm5, (%r10)
	vmovdqu	%ymm7, 32(%r10)
	vmovdqu	%ymm6, 64(%r10)
	vmovdqu	%ymm4, 96(%r10)
	vmovdqu	32(%rdi), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm5
	vpaddb	%ymm5, %ymm4, %ymm4
	vpsrlw	$2, %ymm4, %ymm5
	vpand	%ymm4, %ymm1, %ymm4
	vpand	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm1, %ymm4, %ymm4
	vpsubb	%ymm5, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpand	%ymm4, %ymm3, %ymm4
	vpand	%ymm5, %ymm3, %ymm5
	vpsubb	%ymm2, %ymm4, %ymm4
	vpsubb	%ymm2, %ymm5, %ymm5
	vpunpcklbw	%ymm5, %ymm4, %ymm6
	vpunpckhbw	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm6, %xmm5
	vpmovsxbw	%xmm5, %ymm5
	vextracti128	$1, %ymm6, %xmm6
	vpmovsxbw	%xmm6, %ymm6
	vmovdqu	%xmm4, %xmm7
	vpmovsxbw	%xmm7, %ymm7
	vextracti128	$1, %ymm4, %xmm4
	vpmovsxbw	%xmm4, %ymm4
	vmovdqu	%ymm5, 128(%r10)
	vmovdqu	%ymm7, 160(%r10)
	vmovdqu	%ymm6, 192(%r10)
	vmovdqu	%ymm4, 224(%r10)
	vmovdqu	64(%rdi), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm5
	vpaddb	%ymm5, %ymm4, %ymm4
	vpsrlw	$2, %ymm4, %ymm5
	vpand	%ymm4, %ymm1, %ymm4
	vpand	%ymm5, %ymm1, %ymm5
	vpaddb	%ymm1, %ymm4, %ymm4
	vpsubb	%ymm5, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpand	%ymm4, %ymm3, %ymm4
	vpand	%ymm5, %ymm3, %ymm5
	vpsubb	%ymm2, %ymm4, %ymm4
	vpsubb	%ymm2, %ymm5, %ymm5
	vpunpcklbw	%ymm5, %ymm4, %ymm6
	vpunpckhbw	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm6, %xmm5
	vpmovsxbw	%xmm5, %ymm5
	vextracti128	$1, %ymm6, %xmm6
	vpmovsxbw	%xmm6, %ymm6
	vmovdqu	%xmm4, %xmm7
	vpmovsxbw	%xmm7, %ymm7
	vextracti128	$1, %ymm4, %xmm4
	vpmovsxbw	%xmm4, %ymm4
	vmovdqu	%ymm5, 256(%r10)
	vmovdqu	%ymm7, 288(%r10)
	vmovdqu	%ymm6, 320(%r10)
	vmovdqu	%ymm4, 352(%r10)
	vmovdqu	96(%rdi), %ymm4
	vpsrlw	$1, %ymm4, %ymm5
	vpand	%ymm4, %ymm0, %ymm4
	vpand	%ymm5, %ymm0, %ymm0
	vpaddb	%ymm0, %ymm4, %ymm0
	vpsrlw	$2, %ymm0, %ymm4
	vpand	%ymm0, %ymm1, %ymm0
	vpand	%ymm4, %ymm1, %ymm4
	vpaddb	%ymm1, %ymm0, %ymm0
	vpsubb	%ymm4, %ymm0, %ymm0
	vpsrlw	$4, %ymm0, %ymm1
	vpand	%ymm0, %ymm3, %ymm0
	vpand	%ymm1, %ymm3, %ymm1
	vpsubb	%ymm2, %ymm0, %ymm0
	vpsubb	%ymm2, %ymm1, %ymm1
	vpunpcklbw	%ymm1, %ymm0, %ymm2
	vpunpckhbw	%ymm1, %ymm0, %ymm0
	vmovdqu	%xmm2, %xmm1
	vpmovsxbw	%xmm1, %ymm1
	vextracti128	$1, %ymm2, %xmm2
	vpmovsxbw	%xmm2, %ymm2
	vmovdqu	%xmm0, %xmm3
	vpmovsxbw	%xmm3, %ymm3
	vextracti128	$1, %ymm0, %xmm0
	vpmovsxbw	%xmm0, %ymm0
	vmovdqu	%ymm1, 384(%r10)
	vmovdqu	%ymm3, 416(%r10)
	vmovdqu	%ymm2, 448(%r10)
	vmovdqu	%ymm0, 480(%r10)
	ret
L_poly_frommsg_1$1:
	leaq	glob_data + 800(%rip), %rsi
	vmovdqu	(%rsi), %ymm0
	vbroadcasti128	glob_data + 2640(%rip), %ymm1
	vbroadcasti128	glob_data + 2624(%rip), %ymm2
	vmovdqu	(%rax), %ymm3
	vpshufd	$0, %ymm3, %ymm4
	vpsllvd	%ymm1, %ymm4, %ymm4
	vpshufb	%ymm2, %ymm4, %ymm4
	vpsllw	$12, %ymm4, %ymm5
	vpsllw	$8, %ymm4, %ymm6
	vpsllw	$4, %ymm4, %ymm7
	vpsraw	$15, %ymm5, %ymm5
	vpsraw	$15, %ymm6, %ymm6
	vpsraw	$15, %ymm7, %ymm7
	vpsraw	$15, %ymm4, %ymm4
	vpand	%ymm0, %ymm5, %ymm5
	vpand	%ymm0, %ymm6, %ymm6
	vpand	%ymm0, %ymm7, %ymm7
	vpand	%ymm0, %ymm4, %ymm4
	vpunpcklqdq	%ymm6, %ymm5, %ymm8
	vpunpckhqdq	%ymm6, %ymm5, %ymm5
	vpunpcklqdq	%ymm4, %ymm7, %ymm6
	vpunpckhqdq	%ymm4, %ymm7, %ymm4
	vperm2i128	$32, %ymm6, %ymm8, %ymm7
	vperm2i128	$49, %ymm6, %ymm8, %ymm6
	vperm2i128	$32, %ymm4, %ymm5, %ymm8
	vperm2i128	$49, %ymm4, %ymm5, %ymm4
	vmovdqu	%ymm7, (%rcx)
	vmovdqu	%ymm8, 32(%rcx)
	vmovdqu	%ymm6, 256(%rcx)
	vmovdqu	%ymm4, 288(%rcx)
	vpshufd	$85, %ymm3, %ymm4
	vpsllvd	%ymm1, %ymm4, %ymm4
	vpshufb	%ymm2, %ymm4, %ymm4
	vpsllw	$12, %ymm4, %ymm5
	vpsllw	$8, %ymm4, %ymm6
	vpsllw	$4, %ymm4, %ymm7
	vpsraw	$15, %ymm5, %ymm5
	vpsraw	$15, %ymm6, %ymm6
	vpsraw	$15, %ymm7, %ymm7
	vpsraw	$15, %ymm4, %ymm4
	vpand	%ymm0, %ymm5, %ymm5
	vpand	%ymm0, %ymm6, %ymm6
	vpand	%ymm0, %ymm7, %ymm7
	vpand	%ymm0, %ymm4, %ymm4
	vpunpcklqdq	%ymm6, %ymm5, %ymm8
	vpunpckhqdq	%ymm6, %ymm5, %ymm5
	vpunpcklqdq	%ymm4, %ymm7, %ymm6
	vpunpckhqdq	%ymm4, %ymm7, %ymm4
	vperm2i128	$32, %ymm6, %ymm8, %ymm7
	vperm2i128	$49, %ymm6, %ymm8, %ymm6
	vperm2i128	$32, %ymm4, %ymm5, %ymm8
	vperm2i128	$49, %ymm4, %ymm5, %ymm4
	vmovdqu	%ymm7, 64(%rcx)
	vmovdqu	%ymm8, 96(%rcx)
	vmovdqu	%ymm6, 320(%rcx)
	vmovdqu	%ymm4, 352(%rcx)
	vpshufd	$170, %ymm3, %ymm4
	vpsllvd	%ymm1, %ymm4, %ymm4
	vpshufb	%ymm2, %ymm4, %ymm4
	vpsllw	$12, %ymm4, %ymm5
	vpsllw	$8, %ymm4, %ymm6
	vpsllw	$4, %ymm4, %ymm7
	vpsraw	$15, %ymm5, %ymm5
	vpsraw	$15, %ymm6, %ymm6
	vpsraw	$15, %ymm7, %ymm7
	vpsraw	$15, %ymm4, %ymm4
	vpand	%ymm0, %ymm5, %ymm5
	vpand	%ymm0, %ymm6, %ymm6
	vpand	%ymm0, %ymm7, %ymm7
	vpand	%ymm0, %ymm4, %ymm4
	vpunpcklqdq	%ymm6, %ymm5, %ymm8
	vpunpckhqdq	%ymm6, %ymm5, %ymm5
	vpunpcklqdq	%ymm4, %ymm7, %ymm6
	vpunpckhqdq	%ymm4, %ymm7, %ymm4
	vperm2i128	$32, %ymm6, %ymm8, %ymm7
	vperm2i128	$49, %ymm6, %ymm8, %ymm6
	vperm2i128	$32, %ymm4, %ymm5, %ymm8
	vperm2i128	$49, %ymm4, %ymm5, %ymm4
	vmovdqu	%ymm7, 128(%rcx)
	vmovdqu	%ymm8, 160(%rcx)
	vmovdqu	%ymm6, 384(%rcx)
	vmovdqu	%ymm4, 416(%rcx)
	vpshufd	$255, %ymm3, %ymm3
	vpsllvd	%ymm1, %ymm3, %ymm1
	vpshufb	%ymm2, %ymm1, %ymm1
	vpsllw	$12, %ymm1, %ymm2
	vpsllw	$8, %ymm1, %ymm3
	vpsllw	$4, %ymm1, %ymm4
	vpsraw	$15, %ymm2, %ymm2
	vpsraw	$15, %ymm3, %ymm3
	vpsraw	$15, %ymm4, %ymm4
	vpsraw	$15, %ymm1, %ymm1
	vpand	%ymm0, %ymm2, %ymm2
	vpand	%ymm0, %ymm3, %ymm3
	vpand	%ymm0, %ymm4, %ymm4
	vpand	%ymm0, %ymm1, %ymm0
	vpunpcklqdq	%ymm3, %ymm2, %ymm1
	vpunpckhqdq	%ymm3, %ymm2, %ymm2
	vpunpcklqdq	%ymm0, %ymm4, %ymm3
	vpunpckhqdq	%ymm0, %ymm4, %ymm0
	vperm2i128	$32, %ymm3, %ymm1, %ymm4
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vperm2i128	$32, %ymm0, %ymm2, %ymm3
	vperm2i128	$49, %ymm0, %ymm2, %ymm0
	vmovdqu	%ymm4, 192(%rcx)
	vmovdqu	%ymm3, 224(%rcx)
	vmovdqu	%ymm1, 448(%rcx)
	vmovdqu	%ymm0, 480(%rcx)
	ret
L_poly_frommont$1:
	leaq	glob_data + 992(%rip), %rcx
	vmovdqu	(%rcx), %ymm0
	leaq	glob_data + 960(%rip), %rcx
	vmovdqu	(%rcx), %ymm1
	leaq	glob_data + 704(%rip), %rcx
	vmovdqu	(%rcx), %ymm2
	vmovdqu	(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, (%rax)
	vmovdqu	32(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, 32(%rax)
	vmovdqu	64(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, 64(%rax)
	vmovdqu	96(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, 96(%rax)
	vmovdqu	128(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, 128(%rax)
	vmovdqu	160(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, 160(%rax)
	vmovdqu	192(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, 192(%rax)
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
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, 256(%rax)
	vmovdqu	288(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, 288(%rax)
	vmovdqu	320(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, 320(%rax)
	vmovdqu	352(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, 352(%rax)
	vmovdqu	384(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, 384(%rax)
	vmovdqu	416(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, 416(%rax)
	vmovdqu	448(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm3
	vpmullw	%ymm1, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm4, %ymm3
	vmovdqu	%ymm3, 448(%rax)
	vmovdqu	480(%rax), %ymm3
	vpmulhw	%ymm2, %ymm3, %ymm4
	vpmullw	%ymm2, %ymm3, %ymm2
	vpmullw	%ymm1, %ymm2, %ymm1
	vpmulhw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm4, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	ret
L_poly_frombytes$1:
	leaq	glob_data + 832(%rip), %r8
	vmovdqu	(%r8), %ymm0
	vmovdqu	(%rsi), %ymm1
	vmovdqu	32(%rsi), %ymm2
	vmovdqu	64(%rsi), %ymm3
	vmovdqu	96(%rsi), %ymm4
	vmovdqu	128(%rsi), %ymm5
	vmovdqu	160(%rsi), %ymm6
	vperm2i128	$32, %ymm4, %ymm1, %ymm7
	vperm2i128	$49, %ymm4, %ymm1, %ymm4
	vperm2i128	$32, %ymm5, %ymm2, %ymm8
	vperm2i128	$49, %ymm5, %ymm2, %ymm1
	vperm2i128	$32, %ymm6, %ymm3, %ymm5
	vperm2i128	$49, %ymm6, %ymm3, %ymm3
	vpunpcklqdq	%ymm1, %ymm7, %ymm6
	vpunpckhqdq	%ymm1, %ymm7, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm5
	vpunpcklqdq	%ymm3, %ymm8, %ymm7
	vpunpckhqdq	%ymm3, %ymm8, %ymm3
	vmovsldup	%ymm5, %ymm4
	vpblendd	$170, %ymm4, %ymm6, %ymm4
	vpsrlq	$32, %ymm6, %ymm6
	vpblendd	$170, %ymm5, %ymm6, %ymm5
	vmovsldup	%ymm7, %ymm6
	vpblendd	$170, %ymm6, %ymm1, %ymm6
	vpsrlq	$32, %ymm1, %ymm1
	vpblendd	$170, %ymm7, %ymm1, %ymm7
	vmovsldup	%ymm3, %ymm1
	vpblendd	$170, %ymm1, %ymm2, %ymm1
	vpsrlq	$32, %ymm2, %ymm2
	vpblendd	$170, %ymm3, %ymm2, %ymm2
	vpslld	$16, %ymm7, %ymm3
	vpblendw	$170, %ymm3, %ymm4, %ymm3
	vpsrld	$16, %ymm4, %ymm4
	vpblendw	$170, %ymm7, %ymm4, %ymm4
	vpslld	$16, %ymm1, %ymm7
	vpblendw	$170, %ymm7, %ymm5, %ymm7
	vpsrld	$16, %ymm5, %ymm5
	vpblendw	$170, %ymm1, %ymm5, %ymm1
	vpslld	$16, %ymm2, %ymm5
	vpblendw	$170, %ymm5, %ymm6, %ymm5
	vpsrld	$16, %ymm6, %ymm6
	vpblendw	$170, %ymm2, %ymm6, %ymm2
	vpsrlw	$12, %ymm3, %ymm6
	vpsllw	$4, %ymm4, %ymm8
	vpor	%ymm8, %ymm6, %ymm6
	vpand	%ymm3, %ymm0, %ymm3
	vpand	%ymm6, %ymm0, %ymm6
	vpsrlw	$8, %ymm4, %ymm4
	vpsllw	$8, %ymm7, %ymm8
	vpor	%ymm8, %ymm4, %ymm4
	vpand	%ymm4, %ymm0, %ymm4
	vpsrlw	$4, %ymm7, %ymm7
	vpand	%ymm7, %ymm0, %ymm7
	vpsrlw	$12, %ymm1, %ymm8
	vpsllw	$4, %ymm5, %ymm9
	vpor	%ymm9, %ymm8, %ymm8
	vpand	%ymm1, %ymm0, %ymm1
	vpand	%ymm8, %ymm0, %ymm8
	vpsrlw	$8, %ymm5, %ymm5
	vpsllw	$8, %ymm2, %ymm9
	vpor	%ymm9, %ymm5, %ymm5
	vpand	%ymm5, %ymm0, %ymm5
	vpsrlw	$4, %ymm2, %ymm2
	vpand	%ymm2, %ymm0, %ymm2
	vmovdqu	%ymm3, (%rdi)
	vmovdqu	%ymm6, 32(%rdi)
	vmovdqu	%ymm4, 64(%rdi)
	vmovdqu	%ymm7, 96(%rdi)
	vmovdqu	%ymm1, 128(%rdi)
	vmovdqu	%ymm8, 160(%rdi)
	vmovdqu	%ymm5, 192(%rdi)
	vmovdqu	%ymm2, 224(%rdi)
	vmovdqu	192(%rsi), %ymm1
	vmovdqu	224(%rsi), %ymm2
	vmovdqu	256(%rsi), %ymm3
	vmovdqu	288(%rsi), %ymm4
	vmovdqu	320(%rsi), %ymm5
	vmovdqu	352(%rsi), %ymm6
	vperm2i128	$32, %ymm4, %ymm1, %ymm7
	vperm2i128	$49, %ymm4, %ymm1, %ymm4
	vperm2i128	$32, %ymm5, %ymm2, %ymm8
	vperm2i128	$49, %ymm5, %ymm2, %ymm1
	vperm2i128	$32, %ymm6, %ymm3, %ymm5
	vperm2i128	$49, %ymm6, %ymm3, %ymm3
	vpunpcklqdq	%ymm1, %ymm7, %ymm6
	vpunpckhqdq	%ymm1, %ymm7, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm5
	vpunpcklqdq	%ymm3, %ymm8, %ymm7
	vpunpckhqdq	%ymm3, %ymm8, %ymm3
	vmovsldup	%ymm5, %ymm4
	vpblendd	$170, %ymm4, %ymm6, %ymm4
	vpsrlq	$32, %ymm6, %ymm6
	vpblendd	$170, %ymm5, %ymm6, %ymm5
	vmovsldup	%ymm7, %ymm6
	vpblendd	$170, %ymm6, %ymm1, %ymm6
	vpsrlq	$32, %ymm1, %ymm1
	vpblendd	$170, %ymm7, %ymm1, %ymm7
	vmovsldup	%ymm3, %ymm1
	vpblendd	$170, %ymm1, %ymm2, %ymm1
	vpsrlq	$32, %ymm2, %ymm2
	vpblendd	$170, %ymm3, %ymm2, %ymm2
	vpslld	$16, %ymm7, %ymm3
	vpblendw	$170, %ymm3, %ymm4, %ymm3
	vpsrld	$16, %ymm4, %ymm4
	vpblendw	$170, %ymm7, %ymm4, %ymm4
	vpslld	$16, %ymm1, %ymm7
	vpblendw	$170, %ymm7, %ymm5, %ymm7
	vpsrld	$16, %ymm5, %ymm5
	vpblendw	$170, %ymm1, %ymm5, %ymm1
	vpslld	$16, %ymm2, %ymm5
	vpblendw	$170, %ymm5, %ymm6, %ymm5
	vpsrld	$16, %ymm6, %ymm6
	vpblendw	$170, %ymm2, %ymm6, %ymm2
	vpsrlw	$12, %ymm3, %ymm6
	vpsllw	$4, %ymm4, %ymm8
	vpor	%ymm8, %ymm6, %ymm6
	vpand	%ymm3, %ymm0, %ymm3
	vpand	%ymm6, %ymm0, %ymm6
	vpsrlw	$8, %ymm4, %ymm4
	vpsllw	$8, %ymm7, %ymm8
	vpor	%ymm8, %ymm4, %ymm4
	vpand	%ymm4, %ymm0, %ymm4
	vpsrlw	$4, %ymm7, %ymm7
	vpand	%ymm7, %ymm0, %ymm7
	vpsrlw	$12, %ymm1, %ymm8
	vpsllw	$4, %ymm5, %ymm9
	vpor	%ymm9, %ymm8, %ymm8
	vpand	%ymm1, %ymm0, %ymm1
	vpand	%ymm8, %ymm0, %ymm8
	vpsrlw	$8, %ymm5, %ymm5
	vpsllw	$8, %ymm2, %ymm9
	vpor	%ymm9, %ymm5, %ymm5
	vpand	%ymm5, %ymm0, %ymm5
	vpsrlw	$4, %ymm2, %ymm2
	vpand	%ymm2, %ymm0, %ymm0
	vmovdqu	%ymm3, 256(%rdi)
	vmovdqu	%ymm6, 288(%rdi)
	vmovdqu	%ymm4, 320(%rdi)
	vmovdqu	%ymm7, 352(%rdi)
	vmovdqu	%ymm1, 384(%rdi)
	vmovdqu	%ymm8, 416(%rdi)
	vmovdqu	%ymm5, 448(%rdi)
	vmovdqu	%ymm0, 480(%rdi)
	ret
L_poly_basemul$1:
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	glob_data + 960(%rip), %ymm1
	vmovdqu	glob_data + 2096(%rip), %ymm2
	vmovdqu	glob_data + 2128(%rip), %ymm3
	vmovdqu	(%rsi), %ymm4
	vmovdqu	32(%rsi), %ymm5
	vmovdqu	(%rdi), %ymm6
	vmovdqu	32(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm8
	vpmulhw	%ymm5, %ymm3, %ymm9
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm8, %ymm9, %ymm8
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
	vpblendw	$170, %ymm9, %ymm7, %ymm6
	vpblendw	$170, %ymm9, %ymm8, %ymm10
	vpackusdw	%ymm10, %ymm6, %ymm6
	vpsrld	$16, %ymm7, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpackusdw	%ymm8, %ymm7, %ymm7
	vpblendw	$170, %ymm9, %ymm5, %ymm8
	vpblendw	$170, %ymm9, %ymm4, %ymm9
	vpackusdw	%ymm9, %ymm8, %ymm8
	vpsrld	$16, %ymm5, %ymm5
	vpsrld	$16, %ymm4, %ymm4
	vpackusdw	%ymm4, %ymm5, %ymm4
	vpmullw	%ymm1, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm7, %ymm5
	vpmullw	%ymm1, %ymm8, %ymm6
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm4, %ymm4
	vmovdqu	%ymm5, (%rcx)
	vmovdqu	%ymm4, 32(%rcx)
	vmovdqu	64(%rsi), %ymm4
	vmovdqu	96(%rsi), %ymm5
	vmovdqu	64(%rdi), %ymm6
	vmovdqu	96(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm2
	vpmulhw	%ymm5, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm2, %ymm2
	vpsubw	%ymm2, %ymm3, %ymm2
	vpmullw	%ymm6, %ymm4, %ymm8
	vpmulhw	%ymm6, %ymm4, %ymm9
	vpunpcklwd	%ymm9, %ymm8, %ymm3
	vpunpckhwd	%ymm9, %ymm8, %ymm8
	vpmullw	%ymm7, %ymm4, %ymm9
	vpmulhw	%ymm7, %ymm4, %ymm10
	vpunpcklwd	%ymm10, %ymm9, %ymm4
	vpunpckhwd	%ymm10, %ymm9, %ymm9
	vpmullw	%ymm6, %ymm5, %ymm10
	vpmulhw	%ymm6, %ymm5, %ymm6
	vpunpcklwd	%ymm6, %ymm10, %ymm5
	vpunpckhwd	%ymm6, %ymm10, %ymm6
	vpmullw	%ymm7, %ymm2, %ymm10
	vpmulhw	%ymm7, %ymm2, %ymm2
	vpunpcklwd	%ymm2, %ymm10, %ymm7
	vpunpckhwd	%ymm2, %ymm10, %ymm2
	vpsubd	%ymm7, %ymm3, %ymm7
	vpsubd	%ymm2, %ymm8, %ymm8
	vpaddd	%ymm4, %ymm5, %ymm2
	vpaddd	%ymm9, %ymm6, %ymm3
	vpxor	%ymm5, %ymm5, %ymm5
	vpblendw	$170, %ymm5, %ymm7, %ymm4
	vpblendw	$170, %ymm5, %ymm8, %ymm6
	vpackusdw	%ymm6, %ymm4, %ymm4
	vpsrld	$16, %ymm7, %ymm6
	vpsrld	$16, %ymm8, %ymm7
	vpackusdw	%ymm7, %ymm6, %ymm6
	vpblendw	$170, %ymm5, %ymm2, %ymm7
	vpblendw	$170, %ymm5, %ymm3, %ymm5
	vpackusdw	%ymm5, %ymm7, %ymm5
	vpsrld	$16, %ymm2, %ymm2
	vpsrld	$16, %ymm3, %ymm3
	vpackusdw	%ymm3, %ymm2, %ymm2
	vpmullw	%ymm1, %ymm4, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm6, %ymm3
	vpmullw	%ymm1, %ymm5, %ymm4
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm3, 64(%rcx)
	vmovdqu	%ymm2, 96(%rcx)
	vmovdqu	glob_data + 2160(%rip), %ymm2
	vmovdqu	glob_data + 2192(%rip), %ymm3
	vmovdqu	128(%rsi), %ymm4
	vmovdqu	160(%rsi), %ymm5
	vmovdqu	128(%rdi), %ymm6
	vmovdqu	160(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm8
	vpmulhw	%ymm5, %ymm3, %ymm9
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm8, %ymm9, %ymm8
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
	vpblendw	$170, %ymm9, %ymm7, %ymm6
	vpblendw	$170, %ymm9, %ymm8, %ymm10
	vpackusdw	%ymm10, %ymm6, %ymm6
	vpsrld	$16, %ymm7, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpackusdw	%ymm8, %ymm7, %ymm7
	vpblendw	$170, %ymm9, %ymm5, %ymm8
	vpblendw	$170, %ymm9, %ymm4, %ymm9
	vpackusdw	%ymm9, %ymm8, %ymm8
	vpsrld	$16, %ymm5, %ymm5
	vpsrld	$16, %ymm4, %ymm4
	vpackusdw	%ymm4, %ymm5, %ymm4
	vpmullw	%ymm1, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm7, %ymm5
	vpmullw	%ymm1, %ymm8, %ymm6
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm4, %ymm4
	vmovdqu	%ymm5, 128(%rcx)
	vmovdqu	%ymm4, 160(%rcx)
	vmovdqu	192(%rsi), %ymm4
	vmovdqu	224(%rsi), %ymm5
	vmovdqu	192(%rdi), %ymm6
	vmovdqu	224(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm2
	vpmulhw	%ymm5, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm2, %ymm2
	vpsubw	%ymm2, %ymm3, %ymm2
	vpmullw	%ymm6, %ymm4, %ymm8
	vpmulhw	%ymm6, %ymm4, %ymm9
	vpunpcklwd	%ymm9, %ymm8, %ymm3
	vpunpckhwd	%ymm9, %ymm8, %ymm8
	vpmullw	%ymm7, %ymm4, %ymm9
	vpmulhw	%ymm7, %ymm4, %ymm10
	vpunpcklwd	%ymm10, %ymm9, %ymm4
	vpunpckhwd	%ymm10, %ymm9, %ymm9
	vpmullw	%ymm6, %ymm5, %ymm10
	vpmulhw	%ymm6, %ymm5, %ymm6
	vpunpcklwd	%ymm6, %ymm10, %ymm5
	vpunpckhwd	%ymm6, %ymm10, %ymm6
	vpmullw	%ymm7, %ymm2, %ymm10
	vpmulhw	%ymm7, %ymm2, %ymm2
	vpunpcklwd	%ymm2, %ymm10, %ymm7
	vpunpckhwd	%ymm2, %ymm10, %ymm2
	vpsubd	%ymm7, %ymm3, %ymm7
	vpsubd	%ymm2, %ymm8, %ymm8
	vpaddd	%ymm4, %ymm5, %ymm2
	vpaddd	%ymm9, %ymm6, %ymm3
	vpxor	%ymm5, %ymm5, %ymm5
	vpblendw	$170, %ymm5, %ymm7, %ymm4
	vpblendw	$170, %ymm5, %ymm8, %ymm6
	vpackusdw	%ymm6, %ymm4, %ymm4
	vpsrld	$16, %ymm7, %ymm6
	vpsrld	$16, %ymm8, %ymm7
	vpackusdw	%ymm7, %ymm6, %ymm6
	vpblendw	$170, %ymm5, %ymm2, %ymm7
	vpblendw	$170, %ymm5, %ymm3, %ymm5
	vpackusdw	%ymm5, %ymm7, %ymm5
	vpsrld	$16, %ymm2, %ymm2
	vpsrld	$16, %ymm3, %ymm3
	vpackusdw	%ymm3, %ymm2, %ymm2
	vpmullw	%ymm1, %ymm4, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm6, %ymm3
	vpmullw	%ymm1, %ymm5, %ymm4
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm3, 192(%rcx)
	vmovdqu	%ymm2, 224(%rcx)
	vmovdqu	glob_data + 2488(%rip), %ymm2
	vmovdqu	glob_data + 2520(%rip), %ymm3
	vmovdqu	256(%rsi), %ymm4
	vmovdqu	288(%rsi), %ymm5
	vmovdqu	256(%rdi), %ymm6
	vmovdqu	288(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm8
	vpmulhw	%ymm5, %ymm3, %ymm9
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm8, %ymm9, %ymm8
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
	vpblendw	$170, %ymm9, %ymm7, %ymm6
	vpblendw	$170, %ymm9, %ymm8, %ymm10
	vpackusdw	%ymm10, %ymm6, %ymm6
	vpsrld	$16, %ymm7, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpackusdw	%ymm8, %ymm7, %ymm7
	vpblendw	$170, %ymm9, %ymm5, %ymm8
	vpblendw	$170, %ymm9, %ymm4, %ymm9
	vpackusdw	%ymm9, %ymm8, %ymm8
	vpsrld	$16, %ymm5, %ymm5
	vpsrld	$16, %ymm4, %ymm4
	vpackusdw	%ymm4, %ymm5, %ymm4
	vpmullw	%ymm1, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm7, %ymm5
	vpmullw	%ymm1, %ymm8, %ymm6
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm4, %ymm4
	vmovdqu	%ymm5, 256(%rcx)
	vmovdqu	%ymm4, 288(%rcx)
	vmovdqu	320(%rsi), %ymm4
	vmovdqu	352(%rsi), %ymm5
	vmovdqu	320(%rdi), %ymm6
	vmovdqu	352(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm2
	vpmulhw	%ymm5, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm2, %ymm2
	vpsubw	%ymm2, %ymm3, %ymm2
	vpmullw	%ymm6, %ymm4, %ymm8
	vpmulhw	%ymm6, %ymm4, %ymm9
	vpunpcklwd	%ymm9, %ymm8, %ymm3
	vpunpckhwd	%ymm9, %ymm8, %ymm8
	vpmullw	%ymm7, %ymm4, %ymm9
	vpmulhw	%ymm7, %ymm4, %ymm10
	vpunpcklwd	%ymm10, %ymm9, %ymm4
	vpunpckhwd	%ymm10, %ymm9, %ymm9
	vpmullw	%ymm6, %ymm5, %ymm10
	vpmulhw	%ymm6, %ymm5, %ymm6
	vpunpcklwd	%ymm6, %ymm10, %ymm5
	vpunpckhwd	%ymm6, %ymm10, %ymm6
	vpmullw	%ymm7, %ymm2, %ymm10
	vpmulhw	%ymm7, %ymm2, %ymm2
	vpunpcklwd	%ymm2, %ymm10, %ymm7
	vpunpckhwd	%ymm2, %ymm10, %ymm2
	vpsubd	%ymm7, %ymm3, %ymm7
	vpsubd	%ymm2, %ymm8, %ymm8
	vpaddd	%ymm4, %ymm5, %ymm2
	vpaddd	%ymm9, %ymm6, %ymm3
	vpxor	%ymm5, %ymm5, %ymm5
	vpblendw	$170, %ymm5, %ymm7, %ymm4
	vpblendw	$170, %ymm5, %ymm8, %ymm6
	vpackusdw	%ymm6, %ymm4, %ymm4
	vpsrld	$16, %ymm7, %ymm6
	vpsrld	$16, %ymm8, %ymm7
	vpackusdw	%ymm7, %ymm6, %ymm6
	vpblendw	$170, %ymm5, %ymm2, %ymm7
	vpblendw	$170, %ymm5, %ymm3, %ymm5
	vpackusdw	%ymm5, %ymm7, %ymm5
	vpsrld	$16, %ymm2, %ymm2
	vpsrld	$16, %ymm3, %ymm3
	vpackusdw	%ymm3, %ymm2, %ymm2
	vpmullw	%ymm1, %ymm4, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm6, %ymm3
	vpmullw	%ymm1, %ymm5, %ymm4
	vpmulhw	%ymm0, %ymm4, %ymm4
	vpsubw	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm3, 320(%rcx)
	vmovdqu	%ymm2, 352(%rcx)
	vmovdqu	glob_data + 2552(%rip), %ymm2
	vmovdqu	glob_data + 2584(%rip), %ymm3
	vmovdqu	384(%rsi), %ymm4
	vmovdqu	416(%rsi), %ymm5
	vmovdqu	384(%rdi), %ymm6
	vmovdqu	416(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm8
	vpmulhw	%ymm5, %ymm3, %ymm9
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpsubw	%ymm8, %ymm9, %ymm8
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
	vpblendw	$170, %ymm9, %ymm7, %ymm6
	vpblendw	$170, %ymm9, %ymm8, %ymm10
	vpackusdw	%ymm10, %ymm6, %ymm6
	vpsrld	$16, %ymm7, %ymm7
	vpsrld	$16, %ymm8, %ymm8
	vpackusdw	%ymm8, %ymm7, %ymm7
	vpblendw	$170, %ymm9, %ymm5, %ymm8
	vpblendw	$170, %ymm9, %ymm4, %ymm9
	vpackusdw	%ymm9, %ymm8, %ymm8
	vpsrld	$16, %ymm5, %ymm5
	vpsrld	$16, %ymm4, %ymm4
	vpackusdw	%ymm4, %ymm5, %ymm4
	vpmullw	%ymm1, %ymm6, %ymm5
	vpmulhw	%ymm0, %ymm5, %ymm5
	vpsubw	%ymm5, %ymm7, %ymm5
	vpmullw	%ymm1, %ymm8, %ymm6
	vpmulhw	%ymm0, %ymm6, %ymm6
	vpsubw	%ymm6, %ymm4, %ymm4
	vmovdqu	%ymm5, 384(%rcx)
	vmovdqu	%ymm4, 416(%rcx)
	vmovdqu	448(%rsi), %ymm4
	vmovdqu	480(%rsi), %ymm5
	vmovdqu	448(%rdi), %ymm6
	vmovdqu	480(%rdi), %ymm7
	vpmullw	%ymm5, %ymm2, %ymm2
	vpmulhw	%ymm5, %ymm3, %ymm3
	vpmulhw	%ymm0, %ymm2, %ymm2
	vpsubw	%ymm2, %ymm3, %ymm2
	vpmullw	%ymm6, %ymm4, %ymm8
	vpmulhw	%ymm6, %ymm4, %ymm9
	vpunpcklwd	%ymm9, %ymm8, %ymm3
	vpunpckhwd	%ymm9, %ymm8, %ymm8
	vpmullw	%ymm7, %ymm4, %ymm9
	vpmulhw	%ymm7, %ymm4, %ymm10
	vpunpcklwd	%ymm10, %ymm9, %ymm4
	vpunpckhwd	%ymm10, %ymm9, %ymm9
	vpmullw	%ymm6, %ymm5, %ymm10
	vpmulhw	%ymm6, %ymm5, %ymm6
	vpunpcklwd	%ymm6, %ymm10, %ymm5
	vpunpckhwd	%ymm6, %ymm10, %ymm6
	vpmullw	%ymm7, %ymm2, %ymm10
	vpmulhw	%ymm7, %ymm2, %ymm2
	vpunpcklwd	%ymm2, %ymm10, %ymm7
	vpunpckhwd	%ymm2, %ymm10, %ymm2
	vpsubd	%ymm7, %ymm3, %ymm7
	vpsubd	%ymm2, %ymm8, %ymm8
	vpaddd	%ymm4, %ymm5, %ymm2
	vpaddd	%ymm9, %ymm6, %ymm3
	vpxor	%ymm5, %ymm5, %ymm5
	vpblendw	$170, %ymm5, %ymm7, %ymm4
	vpblendw	$170, %ymm5, %ymm8, %ymm6
	vpackusdw	%ymm6, %ymm4, %ymm4
	vpsrld	$16, %ymm7, %ymm6
	vpsrld	$16, %ymm8, %ymm7
	vpackusdw	%ymm7, %ymm6, %ymm6
	vpblendw	$170, %ymm5, %ymm2, %ymm7
	vpblendw	$170, %ymm5, %ymm3, %ymm5
	vpackusdw	%ymm5, %ymm7, %ymm5
	vpsrld	$16, %ymm2, %ymm2
	vpsrld	$16, %ymm3, %ymm3
	vpackusdw	%ymm3, %ymm2, %ymm2
	vpmullw	%ymm1, %ymm4, %ymm3
	vpmulhw	%ymm0, %ymm3, %ymm3
	vpsubw	%ymm3, %ymm6, %ymm3
	vpmullw	%ymm1, %ymm5, %ymm1
	vpmulhw	%ymm0, %ymm1, %ymm0
	vpsubw	%ymm0, %ymm2, %ymm0
	vmovdqu	%ymm3, 448(%rcx)
	vmovdqu	%ymm0, 480(%rcx)
	ret
L_poly_csubq$1:
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, (%rcx)
	vmovdqu	32(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 32(%rcx)
	vmovdqu	64(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 64(%rcx)
	vmovdqu	96(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 96(%rcx)
	vmovdqu	128(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 128(%rcx)
	vmovdqu	160(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 160(%rcx)
	vmovdqu	192(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 192(%rcx)
	vmovdqu	224(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 224(%rcx)
	vmovdqu	256(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 256(%rcx)
	vmovdqu	288(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 288(%rcx)
	vmovdqu	320(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 320(%rcx)
	vmovdqu	352(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 352(%rcx)
	vmovdqu	384(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 384(%rcx)
	vmovdqu	416(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 416(%rcx)
	vmovdqu	448(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 448(%rcx)
	vmovdqu	480(%rcx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm0
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 480(%rcx)
	ret
L_poly_add2$1:
	vmovdqu	(%rcx), %ymm0
	vmovdqu	(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rcx)
	vmovdqu	32(%rcx), %ymm0
	vmovdqu	32(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rcx)
	vmovdqu	64(%rcx), %ymm0
	vmovdqu	64(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 64(%rcx)
	vmovdqu	96(%rcx), %ymm0
	vmovdqu	96(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 96(%rcx)
	vmovdqu	128(%rcx), %ymm0
	vmovdqu	128(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 128(%rcx)
	vmovdqu	160(%rcx), %ymm0
	vmovdqu	160(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 160(%rcx)
	vmovdqu	192(%rcx), %ymm0
	vmovdqu	192(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 192(%rcx)
	vmovdqu	224(%rcx), %ymm0
	vmovdqu	224(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 224(%rcx)
	vmovdqu	256(%rcx), %ymm0
	vmovdqu	256(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 256(%rcx)
	vmovdqu	288(%rcx), %ymm0
	vmovdqu	288(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 288(%rcx)
	vmovdqu	320(%rcx), %ymm0
	vmovdqu	320(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 320(%rcx)
	vmovdqu	352(%rcx), %ymm0
	vmovdqu	352(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 352(%rcx)
	vmovdqu	384(%rcx), %ymm0
	vmovdqu	384(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 384(%rcx)
	vmovdqu	416(%rcx), %ymm0
	vmovdqu	416(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 416(%rcx)
	vmovdqu	448(%rcx), %ymm0
	vmovdqu	448(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 448(%rcx)
	vmovdqu	480(%rcx), %ymm0
	vmovdqu	480(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 480(%rcx)
	ret
L_shake128x4_squeeze3blocks$1:
	movq	%rdi, %r11
	leaq	536(%rdi), %rbx
	leaq	1072(%rdi), %rbp
	leaq	1608(%rdi), %r12
	movq	$0, %r13
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake128x4_squeeze3blocks$16:
	leaq	824(%rsp), %rsp
	movq	$0, %r8
	jmp 	L_shake128x4_squeeze3blocks$14
L_shake128x4_squeeze3blocks$15:
	vmovdqu	(%rdx,%r8,4), %ymm0
	vmovdqu	32(%rdx,%r8,4), %ymm1
	vmovdqu	64(%rdx,%r8,4), %ymm2
	vmovdqu	96(%rdx,%r8,4), %ymm3
	addq	$32, %r8
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%r11,%r13)
	vmovdqu	%ymm3, (%rbx,%r13)
	vmovdqu	%ymm4, (%rbp,%r13)
	vmovdqu	%ymm0, (%r12,%r13)
	addq	$32, %r13
L_shake128x4_squeeze3blocks$14:
	cmpq	$160, %r8
	jl  	L_shake128x4_squeeze3blocks$15
	jmp 	L_shake128x4_squeeze3blocks$12
L_shake128x4_squeeze3blocks$13:
	movq	(%rdx,%r8,4), %r9
	movq	%r9, (%r11,%r13)
	movq	8(%rdx,%r8,4), %r9
	movq	%r9, (%rbx,%r13)
	movq	16(%rdx,%r8,4), %r9
	movq	%r9, (%rbp,%r13)
	movq	24(%rdx,%r8,4), %r9
	movq	%r9, (%r12,%r13)
	addq	$8, %r8
	addq	$8, %r13
L_shake128x4_squeeze3blocks$12:
	cmpq	$168, %r8
	jl  	L_shake128x4_squeeze3blocks$13
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake128x4_squeeze3blocks$11:
	leaq	824(%rsp), %rsp
	movq	$0, %r8
	jmp 	L_shake128x4_squeeze3blocks$9
L_shake128x4_squeeze3blocks$10:
	vmovdqu	(%rdx,%r8,4), %ymm0
	vmovdqu	32(%rdx,%r8,4), %ymm1
	vmovdqu	64(%rdx,%r8,4), %ymm2
	vmovdqu	96(%rdx,%r8,4), %ymm3
	addq	$32, %r8
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%r11,%r13)
	vmovdqu	%ymm3, (%rbx,%r13)
	vmovdqu	%ymm4, (%rbp,%r13)
	vmovdqu	%ymm0, (%r12,%r13)
	addq	$32, %r13
L_shake128x4_squeeze3blocks$9:
	cmpq	$160, %r8
	jl  	L_shake128x4_squeeze3blocks$10
	jmp 	L_shake128x4_squeeze3blocks$7
L_shake128x4_squeeze3blocks$8:
	movq	(%rdx,%r8,4), %r9
	movq	%r9, (%r11,%r13)
	movq	8(%rdx,%r8,4), %r9
	movq	%r9, (%rbx,%r13)
	movq	16(%rdx,%r8,4), %r9
	movq	%r9, (%rbp,%r13)
	movq	24(%rdx,%r8,4), %r9
	movq	%r9, (%r12,%r13)
	addq	$8, %r8
	addq	$8, %r13
L_shake128x4_squeeze3blocks$7:
	cmpq	$168, %r8
	jl  	L_shake128x4_squeeze3blocks$8
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake128x4_squeeze3blocks$6:
	leaq	824(%rsp), %rsp
	movq	$0, %r8
	jmp 	L_shake128x4_squeeze3blocks$4
L_shake128x4_squeeze3blocks$5:
	vmovdqu	(%rdx,%r8,4), %ymm0
	vmovdqu	32(%rdx,%r8,4), %ymm1
	vmovdqu	64(%rdx,%r8,4), %ymm2
	vmovdqu	96(%rdx,%r8,4), %ymm3
	addq	$32, %r8
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%r11,%r13)
	vmovdqu	%ymm3, (%rbx,%r13)
	vmovdqu	%ymm4, (%rbp,%r13)
	vmovdqu	%ymm0, (%r12,%r13)
	addq	$32, %r13
L_shake128x4_squeeze3blocks$4:
	cmpq	$192, %r8
	jl  	L_shake128x4_squeeze3blocks$5
	jmp 	L_shake128x4_squeeze3blocks$2
L_shake128x4_squeeze3blocks$3:
	movq	(%rdx,%r8,4), %r9
	movq	%r9, (%r11,%r13)
	movq	8(%rdx,%r8,4), %r9
	movq	%r9, (%rbx,%r13)
	movq	16(%rdx,%r8,4), %r9
	movq	%r9, (%rbp,%r13)
	movq	24(%rdx,%r8,4), %r9
	movq	%r9, (%r12,%r13)
	addq	$8, %r8
	addq	$8, %r13
L_shake128x4_squeeze3blocks$2:
	cmpq	$200, %r8
	jl  	L_shake128x4_squeeze3blocks$3
	ret
L_shake128_next_state$1:
	leaq	336(%rdx), %r10
	vpbroadcastq	(%r10), %ymm0
	vmovdqu	8(%r10), %ymm1
	vmovq	40(%r10), %xmm2
	vmovdqu	48(%r10), %ymm3
	vmovq	80(%r10), %xmm4
	vmovdqu	88(%r10), %ymm5
	movq	120(%r10), %r11
	vpinsrq	$1, %r11, %xmm2, %xmm2
	vmovdqu	128(%r10), %ymm6
	movq	160(%r10), %r11
	vpinsrq	$1, %r11, %xmm4, %xmm4
	vinserti128	$1, %xmm2, %ymm4, %ymm2
	vmovdqu	168(%r10), %ymm7
	vpblendd	$195, %ymm6, %ymm3, %ymm4
	vpblendd	$195, %ymm5, %ymm7, %ymm8
	vpblendd	$195, %ymm3, %ymm5, %ymm9
	vpblendd	$240, %ymm8, %ymm4, %ymm3
	vpblendd	$240, %ymm4, %ymm8, %ymm4
	vpblendd	$195, %ymm7, %ymm6, %ymm6
	vpblendd	$240, %ymm9, %ymm6, %ymm5
	vpblendd	$240, %ymm6, %ymm9, %ymm6
	call	L_keccakf1600_avx2$1
L_shake128_next_state$2:
	movq	$336, %r10
	movq	%xmm0, (%rdx,%r10)
	vmovdqu	%ymm1, 8(%rdx,%r10)
	vmovdqu	%xmm2, %xmm0
	vextracti128	$1, %ymm2, %xmm1
	movq	%xmm1, %r11
	movq	%r11, 40(%rdx,%r10)
	vpunpckhqdq	%xmm1, %xmm1, %xmm1
	vpblendd	$240, %ymm4, %ymm3, %ymm2
	vpblendd	$240, %ymm3, %ymm4, %ymm3
	vpblendd	$240, %ymm6, %ymm5, %ymm4
	vpblendd	$240, %ymm5, %ymm6, %ymm5
	vpblendd	$195, %ymm5, %ymm2, %ymm6
	vmovdqu	%ymm6, 48(%rdx,%r10)
	movq	%xmm0, %r11
	movq	%r11, 80(%rdx,%r10)
	vpunpckhqdq	%xmm0, %xmm0, %xmm0
	vpblendd	$195, %ymm3, %ymm5, %ymm5
	vmovdqu	%ymm5, 88(%rdx,%r10)
	movq	%xmm1, %r11
	movq	%r11, 120(%rdx,%r10)
	vpblendd	$195, %ymm2, %ymm4, %ymm1
	vmovdqu	%ymm1, 128(%rdx,%r10)
	movq	%xmm0, %r11
	movq	%r11, 160(%rdx,%r10)
	vpblendd	$195, %ymm4, %ymm3, %ymm0
	vmovdqu	%ymm0, 168(%rdx,%r10)
	ret
L_shake128_squeeze3blocks$1:
	call	L_keccakf1600_avx2$1
L_shake128_squeeze3blocks$4:
	movq	$0, %rcx
	vmovdqu	%xmm0, %xmm7
	movq	%xmm7, (%rdx,%rcx)
	vmovdqu	%ymm1, 8(%rdx,%rcx)
	vmovdqu	%xmm2, %xmm7
	vextracti128	$1, %ymm2, %xmm8
	movq	%xmm8, %rsi
	movq	%rsi, 40(%rdx,%rcx)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm4, %ymm3, %ymm9
	vpblendd	$240, %ymm3, %ymm4, %ymm10
	vpblendd	$240, %ymm6, %ymm5, %ymm11
	vpblendd	$240, %ymm5, %ymm6, %ymm12
	vpblendd	$195, %ymm12, %ymm9, %ymm13
	vmovdqu	%ymm13, 48(%rdx,%rcx)
	movq	%xmm7, %rsi
	movq	%rsi, 80(%rdx,%rcx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$195, %ymm10, %ymm12, %ymm10
	vmovdqu	%ymm10, 88(%rdx,%rcx)
	movq	%xmm8, %rsi
	movq	%rsi, 120(%rdx,%rcx)
	vpblendd	$195, %ymm9, %ymm11, %ymm8
	vmovdqu	%ymm8, 128(%rdx,%rcx)
	movq	%xmm7, %rsi
	movq	%rsi, 160(%rdx,%rcx)
	addq	$168, %rcx
	call	L_keccakf1600_avx2$1
L_shake128_squeeze3blocks$3:
	vmovdqu	%xmm0, %xmm7
	movq	%xmm7, (%rdx,%rcx)
	vmovdqu	%ymm1, 8(%rdx,%rcx)
	vmovdqu	%xmm2, %xmm7
	vextracti128	$1, %ymm2, %xmm8
	movq	%xmm8, %rsi
	movq	%rsi, 40(%rdx,%rcx)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm4, %ymm3, %ymm9
	vpblendd	$240, %ymm3, %ymm4, %ymm10
	vpblendd	$240, %ymm6, %ymm5, %ymm11
	vpblendd	$240, %ymm5, %ymm6, %ymm12
	vpblendd	$195, %ymm12, %ymm9, %ymm13
	vmovdqu	%ymm13, 48(%rdx,%rcx)
	movq	%xmm7, %rsi
	movq	%rsi, 80(%rdx,%rcx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$195, %ymm10, %ymm12, %ymm10
	vmovdqu	%ymm10, 88(%rdx,%rcx)
	movq	%xmm8, %rsi
	movq	%rsi, 120(%rdx,%rcx)
	vpblendd	$195, %ymm9, %ymm11, %ymm8
	vmovdqu	%ymm8, 128(%rdx,%rcx)
	movq	%xmm7, %rsi
	movq	%rsi, 160(%rdx,%rcx)
	addq	$168, %rcx
	call	L_keccakf1600_avx2$1
L_shake128_squeeze3blocks$2:
	movq	%xmm0, (%rdx,%rcx)
	vmovdqu	%ymm1, 8(%rdx,%rcx)
	vmovdqu	%xmm2, %xmm0
	vextracti128	$1, %ymm2, %xmm1
	movq	%xmm1, %rsi
	movq	%rsi, 40(%rdx,%rcx)
	vpunpckhqdq	%xmm1, %xmm1, %xmm1
	vpblendd	$240, %ymm4, %ymm3, %ymm2
	vpblendd	$240, %ymm3, %ymm4, %ymm3
	vpblendd	$240, %ymm6, %ymm5, %ymm4
	vpblendd	$240, %ymm5, %ymm6, %ymm5
	vpblendd	$195, %ymm5, %ymm2, %ymm6
	vmovdqu	%ymm6, 48(%rdx,%rcx)
	movq	%xmm0, %rsi
	movq	%rsi, 80(%rdx,%rcx)
	vpunpckhqdq	%xmm0, %xmm0, %xmm0
	vpblendd	$195, %ymm3, %ymm5, %ymm5
	vmovdqu	%ymm5, 88(%rdx,%rcx)
	movq	%xmm1, %rsi
	movq	%rsi, 120(%rdx,%rcx)
	vpblendd	$195, %ymm2, %ymm4, %ymm1
	vmovdqu	%ymm1, 128(%rdx,%rcx)
	movq	%xmm0, %rsi
	movq	%rsi, 160(%rdx,%rcx)
	vpblendd	$195, %ymm4, %ymm3, %ymm0
	vmovdqu	%ymm0, 168(%rdx,%rcx)
	ret
L_shake128x4_absorb_A32_A2$1:
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %r8
	jmp 	L_shake128x4_absorb_A32_A2$4
L_shake128x4_absorb_A32_A2$5:
	vmovdqu	%ymm0, (%rdx,%r8)
	addq	$32, %r8
L_shake128x4_absorb_A32_A2$4:
	cmpq	$800, %r8
	jb  	L_shake128x4_absorb_A32_A2$5
	movq	$0, %r8
	movq	$0, %r9
	jmp 	L_shake128x4_absorb_A32_A2$2
L_shake128x4_absorb_A32_A2$3:
	vpbroadcastq	(%rsi,%r8), %ymm0
	addq	$8, %r8
	vpxor	(%rdx,%r9), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rdx,%r9)
	addq	$32, %r9
L_shake128x4_absorb_A32_A2$2:
	cmpq	$128, %r9
	jb  	L_shake128x4_absorb_A32_A2$3
	movq	$0, %rbx
	movq	%r10, %r12
	leaq	2(%r10), %r8
	leaq	4(%r10), %r9
	leaq	6(%r10), %r10
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
	movzwq	(%r9,%rbx), %r9
	movq	$31, %r13
	shlq	$16, %r13
	orq 	%r13, %r9
	shlq	$0, %r9
	orq 	%r9, %r8
	movq	$0, %r9
	movzwq	(%r10,%rbx), %r10
	movq	$31, %rbx
	shlq	$16, %rbx
	orq 	%rbx, %r10
	shlq	$0, %r10
	orq 	%r10, %r9
	xorq	(%rdx,%r11,8), %rbp
	movq	%rbp, (%rdx,%r11,8)
	xorq	8(%rdx,%r11,8), %r12
	movq	%r12, 8(%rdx,%r11,8)
	xorq	16(%rdx,%r11,8), %r8
	movq	%r8, 16(%rdx,%r11,8)
	xorq	24(%rdx,%r11,8), %r9
	movq	%r9, 24(%rdx,%r11,8)
	movq	$1, %r8
	shlq	$63, %r8
	movq	%r8, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpxor	640(%rdx), %ymm0, %ymm0
	vmovdqu	%ymm0, 640(%rdx)
	ret
L_shake128_absorb_A32_A2$1:
	leaq	32(%rsp), %rdi
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rdi)
	vmovdqu	%ymm0, 32(%rdi)
	vmovdqu	%ymm0, 64(%rdi)
	vmovdqu	%ymm0, 96(%rdi)
	vmovdqu	%ymm0, 128(%rdi)
	vmovdqu	%ymm0, 160(%rdi)
	movq	$0, %r8
	movq	%r8, 192(%rdi)
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	movq	$0, %r8
	movq	$0, %r10
	jmp 	L_shake128_absorb_A32_A2$4
L_shake128_absorb_A32_A2$5:
	vmovdqu	(%rsi,%r8), %ymm7
	addq	$32, %r8
	vmovdqu	%ymm7, (%rdi,%r10,8)
	addq	$4, %r10
L_shake128_absorb_A32_A2$4:
	cmpq	$4, %r10
	jb  	L_shake128_absorb_A32_A2$5
	movq	$0, %rsi
	movq	$0, %r8
	movzwq	(%rcx,%rsi), %rcx
	movq	$31, %rsi
	shlq	$16, %rsi
	orq 	%rsi, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %r8
	movq	%r8, 32(%rdi)
	movq	$5, %rcx
	jmp 	L_shake128_absorb_A32_A2$2
L_shake128_absorb_A32_A2$3:
	movq	$0, (%rdi,%rcx,8)
	incq	%rcx
L_shake128_absorb_A32_A2$2:
	cmpq	$5, %rcx
	jb  	L_shake128_absorb_A32_A2$3
	vpbroadcastq	(%rdi), %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	vmovdqu	8(%rdi), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	movq	$1, %rcx
	shlq	$63, %rcx
	vpxor	%xmm7, %xmm7, %xmm7
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm2, %ymm2
	ret
L_shake256x4_A128__A32_A1$1:
	leaq	32(%rsp), %rdx
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %r8
	jmp 	L_shake256x4_A128__A32_A1$9
L_shake256x4_A128__A32_A1$10:
	vmovdqu	%ymm0, (%rdx,%r8)
	addq	$32, %r8
L_shake256x4_A128__A32_A1$9:
	cmpq	$800, %r8
	jb  	L_shake256x4_A128__A32_A1$10
	movq	$0, %r8
	movq	$0, %r9
	jmp 	L_shake256x4_A128__A32_A1$7
L_shake256x4_A128__A32_A1$8:
	vpbroadcastq	(%rbx,%r8), %ymm0
	addq	$8, %r8
	vpxor	(%rdx,%r9), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rdx,%r9)
	addq	$32, %r9
L_shake256x4_A128__A32_A1$7:
	cmpq	$128, %r9
	jb  	L_shake256x4_A128__A32_A1$8
	movq	$0, %rbx
	movq	%r10, %r12
	leaq	1(%r10), %r8
	leaq	2(%r10), %r9
	leaq	3(%r10), %r10
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
	movzbq	(%r9,%rbx), %r9
	orq 	$7936, %r9
	shlq	$0, %r9
	orq 	%r9, %r13
	shlq	$0, %r13
	orq 	%r13, %r8
	movq	$0, %r9
	movq	$0, %r13
	movzbq	(%r10,%rbx), %r10
	orq 	$7936, %r10
	shlq	$0, %r10
	orq 	%r10, %r13
	shlq	$0, %r13
	orq 	%r13, %r9
	xorq	(%rdx,%r11,8), %rbp
	movq	%rbp, (%rdx,%r11,8)
	xorq	8(%rdx,%r11,8), %r12
	movq	%r12, 8(%rdx,%r11,8)
	xorq	16(%rdx,%r11,8), %r8
	movq	%r8, 16(%rdx,%r11,8)
	xorq	24(%rdx,%r11,8), %r9
	movq	%r9, 24(%rdx,%r11,8)
	movq	$1, %r8
	shlq	$63, %r8
	movq	%r8, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpxor	512(%rdx), %ymm0, %ymm0
	vmovdqu	%ymm0, 512(%rdx)
	movq	$0, %r11
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake256x4_A128__A32_A1$6:
	leaq	824(%rsp), %rsp
	movq	$0, %r8
	jmp 	L_shake256x4_A128__A32_A1$4
L_shake256x4_A128__A32_A1$5:
	vmovdqu	(%rdx,%r8,4), %ymm0
	vmovdqu	32(%rdx,%r8,4), %ymm1
	vmovdqu	64(%rdx,%r8,4), %ymm2
	vmovdqu	96(%rdx,%r8,4), %ymm3
	addq	$32, %r8
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%rax,%r11)
	vmovdqu	%ymm3, (%rcx,%r11)
	vmovdqu	%ymm4, (%rsi,%r11)
	vmovdqu	%ymm0, (%rdi,%r11)
	addq	$32, %r11
L_shake256x4_A128__A32_A1$4:
	cmpq	$128, %r8
	jl  	L_shake256x4_A128__A32_A1$5
	jmp 	L_shake256x4_A128__A32_A1$2
L_shake256x4_A128__A32_A1$3:
	movq	(%rdx,%r8,4), %r9
	movq	%r9, (%rax,%r11)
	movq	8(%rdx,%r8,4), %r9
	movq	%r9, (%rcx,%r11)
	movq	16(%rdx,%r8,4), %r9
	movq	%r9, (%rsi,%r11)
	movq	24(%rdx,%r8,4), %r9
	movq	%r9, (%rdi,%r11)
	addq	$8, %r8
	addq	$8, %r11
L_shake256x4_A128__A32_A1$2:
	cmpq	$128, %r8
	jl  	L_shake256x4_A128__A32_A1$3
	ret
L_shake256_M32__M32_M1088$1:
	leaq	32(%rsp), %rsi
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rsi)
	vmovdqu	%ymm0, 32(%rsi)
	vmovdqu	%ymm0, 64(%rsi)
	vmovdqu	%ymm0, 96(%rsi)
	vmovdqu	%ymm0, 128(%rsi)
	vmovdqu	%ymm0, 160(%rsi)
	movq	$0, %rdi
	movq	%rdi, 192(%rsi)
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	movq	$0, %rdi
	jmp 	L_shake256_M32__M32_M1088$10
L_shake256_M32__M32_M1088$11:
	vmovdqu	(%rdx), %ymm7
	addq	$32, %rdx
	vmovdqu	%ymm7, (%rsi,%rdi,8)
	addq	$4, %rdi
L_shake256_M32__M32_M1088$10:
	cmpq	$4, %rdi
	jb  	L_shake256_M32__M32_M1088$11
	movq	$4, %rdx
	jmp 	L_shake256_M32__M32_M1088$8
L_shake256_M32__M32_M1088$9:
	vmovdqu	(%rax), %ymm7
	addq	$32, %rax
	vmovdqu	%ymm7, (%rsi,%rdx,8)
	addq	$4, %rdx
L_shake256_M32__M32_M1088$8:
	cmpq	$16, %rdx
	jb  	L_shake256_M32__M32_M1088$9
	movq	(%rax), %rdi
	addq	$8, %rax
	movq	%rdi, (%rsi,%rdx,8)
	call	L_addpstate_avx2$1
L_shake256_M32__M32_M1088$7:
	call	L_keccakf1600_avx2$1
L_shake256_M32__M32_M1088$6:
	movq	$0, %rdx
	jmp 	L_shake256_M32__M32_M1088$3
L_shake256_M32__M32_M1088$4:
	vpbroadcastq	(%rax), %ymm7
	addq	$8, %rax
	vpxor	%ymm7, %ymm0, %ymm0
	vmovdqu	(%rax), %ymm7
	addq	$32, %rax
	vpxor	%ymm7, %ymm1, %ymm1
	movq	(%rax), %rsi
	addq	$8, %rax
	movq	%rsi, %xmm9
	vmovdqu	(%rax), %ymm7
	addq	$32, %rax
	movq	(%rax), %rsi
	addq	$8, %rax
	movq	%rsi, %xmm10
	vmovdqu	(%rax), %ymm8
	addq	$32, %rax
	movq	(%rax), %rsi
	addq	$8, %rax
	vpinsrq	$1, %rsi, %xmm9, %xmm11
	vpxor	%xmm9, %xmm9, %xmm9
	vmovq	(%rax), %xmm12
	addq	$8, %rax
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm12, %xmm12
	vinserti128	$1, %xmm9, %ymm12, %ymm9
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm3, %ymm3
	vpxor	%ymm11, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vpxor	%ymm8, %ymm6, %ymm6
	call	L_keccakf1600_avx2$1
L_shake256_M32__M32_M1088$5:
	incq	%rdx
L_shake256_M32__M32_M1088$3:
	cmpq	$7, %rdx
	jb  	L_shake256_M32__M32_M1088$4
	vpbroadcastq	(%rax), %ymm7
	addq	$8, %rax
	vpxor	%ymm7, %ymm0, %ymm0
	vmovdqu	(%rax), %xmm7
	addq	$16, %rax
	vmovq	(%rax), %xmm8
	movq	$31, %rax
	vpinsrq	$1, %rax, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	movq	$1, %rax
	shlq	$63, %rax
	movq	%rax, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm3, %ymm3
	call	L_keccakf1600_avx2$1
L_shake256_M32__M32_M1088$2:
	movq	%xmm0, (%rcx)
	addq	$8, %rcx
	vmovdqu	%xmm1, %xmm0
	vmovdqu	%xmm0, (%rcx)
	addq	$16, %rcx
	vextracti128	$1, %ymm1, %xmm0
	movq	%xmm0, (%rcx)
	ret
L_sha3_512A_A64$1:
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	movq	$0, %rdx
	movq	(%rcx,%rdx), %rsi
	movq	%rsi, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	vmovdqu	8(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	movq	40(%rcx,%rdx), %rsi
	movq	%rsi, %xmm9
	vmovdqu	48(%rcx,%rdx), %xmm7
	movq	$6, %rcx
	movq	%rcx, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	movq	$0, %rcx
	movq	%rcx, %xmm10
	vpxor	%ymm8, %ymm8, %ymm8
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm9, %xmm11
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm3, %ymm3
	vpxor	%ymm11, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$1, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	$0, %rcx
	call	L_keccakf1600_avx2$1
L_sha3_512A_A64$2:
	movq	%xmm0, (%rax,%rcx)
	vmovdqu	%ymm1, 8(%rax,%rcx)
	vextracti128	$1, %ymm2, %xmm0
	movq	%xmm0, %rdx
	movq	%rdx, 40(%rax,%rcx)
	vpblendd	$240, %ymm4, %ymm3, %ymm0
	vpblendd	$240, %ymm5, %ymm6, %ymm1
	vpblendd	$195, %ymm1, %ymm0, %ymm0
	vmovdqu	%xmm0, 48(%rax,%rcx)
	ret
L_sha3_512A_A33$1:
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	movq	$0, %rdx
	movq	(%rcx,%rdx), %rsi
	movq	%rsi, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	vmovdqu	8(%rcx,%rdx), %xmm7
	vmovq	24(%rcx,%rdx), %xmm8
	movq	$0, %rsi
	movq	$0, %rdi
	movzbq	32(%rcx,%rdx), %rcx
	orq 	$1536, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %rdi
	shlq	$0, %rdi
	orq 	%rdi, %rsi
	vpinsrq	$1, %rsi, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$1, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	$0, %rcx
	call	L_keccakf1600_avx2$1
L_sha3_512A_A33$2:
	movq	%xmm0, (%rax,%rcx)
	vmovdqu	%ymm1, 8(%rax,%rcx)
	vextracti128	$1, %ymm2, %xmm0
	movq	%xmm0, %rdx
	movq	%rdx, 40(%rax,%rcx)
	vpblendd	$240, %ymm4, %ymm3, %ymm0
	vpblendd	$240, %ymm5, %ymm6, %ymm1
	vpblendd	$195, %ymm1, %ymm0, %ymm0
	vmovdqu	%xmm0, 48(%rax,%rcx)
	ret
L_sha3_256A_M1184$1:
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	movq	$0, %rcx
	jmp 	L_sha3_256A_M1184$3
L_sha3_256A_M1184$4:
	vpbroadcastq	(%r12), %ymm7
	addq	$8, %r12
	vpxor	%ymm7, %ymm0, %ymm0
	vmovdqu	(%r12), %ymm7
	addq	$32, %r12
	vpxor	%ymm7, %ymm1, %ymm1
	movq	(%r12), %rdx
	addq	$8, %r12
	movq	%rdx, %xmm9
	vmovdqu	(%r12), %ymm7
	addq	$32, %r12
	movq	(%r12), %rdx
	addq	$8, %r12
	movq	%rdx, %xmm10
	vmovdqu	(%r12), %ymm8
	addq	$32, %r12
	movq	(%r12), %rdx
	addq	$8, %r12
	vpinsrq	$1, %rdx, %xmm9, %xmm11
	vpxor	%xmm9, %xmm9, %xmm9
	vmovq	(%r12), %xmm12
	addq	$8, %r12
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm12, %xmm12
	vinserti128	$1, %xmm9, %ymm12, %ymm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm3, %ymm3
	vpxor	%ymm11, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vpxor	%ymm8, %ymm6, %ymm6
	call	L_keccakf1600_avx2$1
L_sha3_256A_M1184$5:
	incq	%rcx
L_sha3_256A_M1184$3:
	cmpq	$8, %rcx
	jb  	L_sha3_256A_M1184$4
	vpbroadcastq	(%r12), %ymm7
	addq	$8, %r12
	vpxor	%ymm7, %ymm0, %ymm0
	vmovdqu	(%r12), %ymm7
	addq	$32, %r12
	vpxor	%ymm7, %ymm1, %ymm1
	movq	(%r12), %rcx
	addq	$8, %r12
	movq	%rcx, %xmm9
	vmovdqu	(%r12), %ymm7
	addq	$32, %r12
	movq	(%r12), %rcx
	addq	$8, %r12
	movq	%rcx, %xmm10
	vpxor	%xmm8, %xmm8, %xmm8
	vmovq	(%r12), %xmm11
	movq	$6, %rcx
	vpinsrq	$1, %rcx, %xmm11, %xmm11
	vinserti128	$1, %xmm8, %ymm11, %ymm8
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm9, %xmm11
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm3, %ymm3
	vpxor	%ymm11, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm3, %ymm3
	movq	$0, %rcx
	call	L_keccakf1600_avx2$1
L_sha3_256A_M1184$2:
	movq	%xmm0, (%rax,%rcx)
	vmovdqu	%xmm1, %xmm0
	vmovdqu	%xmm0, 8(%rax,%rcx)
	vextracti128	$1, %ymm1, %xmm0
	movq	%xmm0, 24(%rax,%rcx)
	ret
L_keccakf1600_avx2x4$1:
	leaq	glob_data + 4760(%rip), %r8
	leaq	32(%rsp), %r9
	vmovdqu	glob_data + 256(%rip), %ymm0
	vmovdqu	glob_data + 288(%rip), %ymm1
	movq	$0, %r10
	jmp 	L_keccakf1600_avx2x4$2
L_keccakf1600_avx2x4$3:
	vpbroadcastq	(%r8,%r10,8), %ymm2
	call	L_keccakf1600_4x_round$1
L_keccakf1600_avx2x4$5:
	xchg	%rdx, %r9
	vpbroadcastq	8(%r8,%r10,8), %ymm2
	call	L_keccakf1600_4x_round$1
L_keccakf1600_avx2x4$4:
	xchg	%r9, %rdx
	addq	$2, %r10
L_keccakf1600_avx2x4$2:
	cmpq	$24, %r10
	jb  	L_keccakf1600_avx2x4$3
	ret
L_keccakf1600_4x_round$1:
	vmovdqu	(%rdx), %ymm3
	vmovdqu	32(%rdx), %ymm4
	vmovdqu	64(%rdx), %ymm5
	vmovdqu	96(%rdx), %ymm6
	vmovdqu	128(%rdx), %ymm7
	vpxor	160(%rdx), %ymm3, %ymm3
	vpxor	192(%rdx), %ymm4, %ymm4
	vpxor	224(%rdx), %ymm5, %ymm5
	vpxor	256(%rdx), %ymm6, %ymm6
	vpxor	288(%rdx), %ymm7, %ymm7
	vpxor	320(%rdx), %ymm3, %ymm3
	vpxor	352(%rdx), %ymm4, %ymm4
	vpxor	384(%rdx), %ymm5, %ymm5
	vpxor	416(%rdx), %ymm6, %ymm6
	vpxor	448(%rdx), %ymm7, %ymm7
	vpxor	480(%rdx), %ymm3, %ymm3
	vpxor	512(%rdx), %ymm4, %ymm4
	vpxor	544(%rdx), %ymm5, %ymm8
	vpxor	576(%rdx), %ymm6, %ymm9
	vpxor	608(%rdx), %ymm7, %ymm10
	vpxor	640(%rdx), %ymm3, %ymm7
	vpxor	672(%rdx), %ymm4, %ymm5
	vpxor	704(%rdx), %ymm8, %ymm6
	vpxor	736(%rdx), %ymm9, %ymm8
	vpxor	768(%rdx), %ymm10, %ymm9
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
	vmovdqu	(%rdx), %ymm8
	vpxor	%ymm3, %ymm8, %ymm8
	vmovdqu	192(%rdx), %ymm9
	vpxor	%ymm4, %ymm9, %ymm9
	vpsllq	$44, %ymm9, %ymm10
	vpsrlq	$20, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	384(%rdx), %ymm10
	vpxor	%ymm5, %ymm10, %ymm10
	vpsllq	$43, %ymm10, %ymm11
	vpsrlq	$21, %ymm10, %ymm10
	vpor	%ymm11, %ymm10, %ymm10
	vmovdqu	576(%rdx), %ymm11
	vpxor	%ymm6, %ymm11, %ymm11
	vpsllq	$21, %ymm11, %ymm12
	vpsrlq	$43, %ymm11, %ymm11
	vpor	%ymm12, %ymm11, %ymm11
	vmovdqu	768(%rdx), %ymm12
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
	vmovdqu	96(%rdx), %ymm2
	vpxor	%ymm6, %ymm2, %ymm2
	vpsllq	$28, %ymm2, %ymm8
	vpsrlq	$36, %ymm2, %ymm2
	vpor	%ymm8, %ymm2, %ymm2
	vmovdqu	288(%rdx), %ymm8
	vpxor	%ymm7, %ymm8, %ymm8
	vpsllq	$20, %ymm8, %ymm9
	vpsrlq	$44, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm8
	vmovdqu	320(%rdx), %ymm9
	vpxor	%ymm3, %ymm9, %ymm9
	vpsllq	$3, %ymm9, %ymm10
	vpsrlq	$61, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	512(%rdx), %ymm10
	vpxor	%ymm4, %ymm10, %ymm10
	vpsllq	$45, %ymm10, %ymm11
	vpsrlq	$19, %ymm10, %ymm10
	vpor	%ymm11, %ymm10, %ymm10
	vmovdqu	704(%rdx), %ymm11
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
	vmovdqu	32(%rdx), %ymm2
	vpxor	%ymm4, %ymm2, %ymm2
	vpsllq	$1, %ymm2, %ymm8
	vpsrlq	$63, %ymm2, %ymm2
	vpor	%ymm8, %ymm2, %ymm2
	vmovdqu	224(%rdx), %ymm8
	vpxor	%ymm5, %ymm8, %ymm8
	vpsllq	$6, %ymm8, %ymm9
	vpsrlq	$58, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm8
	vmovdqu	416(%rdx), %ymm9
	vpxor	%ymm6, %ymm9, %ymm9
	vpsllq	$25, %ymm9, %ymm10
	vpsrlq	$39, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	608(%rdx), %ymm10
	vpxor	%ymm7, %ymm10, %ymm10
	vpshufb	%ymm0, %ymm10, %ymm10
	vmovdqu	640(%rdx), %ymm11
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
	vmovdqu	128(%rdx), %ymm2
	vpxor	%ymm7, %ymm2, %ymm2
	vpsllq	$27, %ymm2, %ymm8
	vpsrlq	$37, %ymm2, %ymm2
	vpor	%ymm8, %ymm2, %ymm2
	vmovdqu	160(%rdx), %ymm8
	vpxor	%ymm3, %ymm8, %ymm8
	vpsllq	$36, %ymm8, %ymm9
	vpsrlq	$28, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm8
	vmovdqu	352(%rdx), %ymm9
	vpxor	%ymm4, %ymm9, %ymm9
	vpsllq	$10, %ymm9, %ymm10
	vpsrlq	$54, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	544(%rdx), %ymm10
	vpxor	%ymm5, %ymm10, %ymm10
	vpsllq	$15, %ymm10, %ymm11
	vpsrlq	$49, %ymm10, %ymm10
	vpor	%ymm11, %ymm10, %ymm10
	vmovdqu	736(%rdx), %ymm11
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
	vmovdqu	64(%rdx), %ymm2
	vpxor	%ymm5, %ymm2, %ymm2
	vpsllq	$62, %ymm2, %ymm5
	vpsrlq	$2, %ymm2, %ymm2
	vpor	%ymm5, %ymm2, %ymm2
	vmovdqu	256(%rdx), %ymm5
	vpxor	%ymm6, %ymm5, %ymm5
	vpsllq	$55, %ymm5, %ymm6
	vpsrlq	$9, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm5
	vmovdqu	448(%rdx), %ymm6
	vpxor	%ymm7, %ymm6, %ymm6
	vpsllq	$39, %ymm6, %ymm7
	vpsrlq	$25, %ymm6, %ymm6
	vpor	%ymm7, %ymm6, %ymm6
	vmovdqu	480(%rdx), %ymm7
	vpxor	%ymm3, %ymm7, %ymm3
	vpsllq	$41, %ymm3, %ymm7
	vpsrlq	$23, %ymm3, %ymm3
	vpor	%ymm7, %ymm3, %ymm3
	vmovdqu	672(%rdx), %ymm7
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
L_addpstate_avx2$1:
	vpbroadcastq	(%rsi), %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	vmovdqu	8(%rsi), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovq	40(%rsi), %xmm9
	vmovdqu	48(%rsi), %ymm7
	vmovq	80(%rsi), %xmm10
	vmovdqu	88(%rsi), %ymm8
	movq	120(%rsi), %rdx
	vpinsrq	$1, %rdx, %xmm9, %xmm11
	vmovdqu	128(%rsi), %ymm9
	movq	160(%rsi), %rdx
	vpinsrq	$1, %rdx, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm2, %ymm2
	vmovdqu	168(%rsi), %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm3, %ymm3
	vpxor	%ymm11, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vpxor	%ymm8, %ymm6, %ymm6
	ret
L_keccakf1600_avx2$1:
	leaq	glob_data + 4760(%rip), %r10
	movq	$0, %r11
L_keccakf1600_avx2$2:
	vpshufd	$78, %ymm2, %ymm8
	vpxor	%ymm3, %ymm5, %ymm7
	vpxor	%ymm6, %ymm4, %ymm9
	vpxor	%ymm1, %ymm7, %ymm7
	vpxor	%ymm9, %ymm7, %ymm10
	vpermq	$147, %ymm10, %ymm7
	vpxor	%ymm2, %ymm8, %ymm8
	vpermq	$78, %ymm8, %ymm9
	vpsrlq	$63, %ymm10, %ymm11
	vpaddq	%ymm10, %ymm10, %ymm10
	vpor	%ymm10, %ymm11, %ymm11
	vpermq	$57, %ymm11, %ymm10
	vpxor	%ymm7, %ymm11, %ymm11
	vpermq	$0, %ymm11, %ymm11
	vpxor	%ymm0, %ymm8, %ymm8
	vpxor	%ymm9, %ymm8, %ymm8
	vpsrlq	$63, %ymm8, %ymm9
	vpaddq	%ymm8, %ymm8, %ymm12
	vpor	%ymm9, %ymm12, %ymm9
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm11, %ymm0, %ymm0
	vpblendd	$192, %ymm9, %ymm10, %ymm9
	vpblendd	$3, %ymm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm9, %ymm9
	vpsllvq	glob_data + 512(%rip), %ymm2, %ymm7
	vpsrlvq	glob_data + 320(%rip), %ymm2, %ymm2
	vpor	%ymm7, %ymm2, %ymm2
	vpxor	%ymm9, %ymm3, %ymm3
	vpsllvq	glob_data + 576(%rip), %ymm3, %ymm7
	vpsrlvq	glob_data + 384(%rip), %ymm3, %ymm3
	vpor	%ymm7, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpsllvq	glob_data + 608(%rip), %ymm4, %ymm7
	vpsrlvq	glob_data + 416(%rip), %ymm4, %ymm4
	vpor	%ymm7, %ymm4, %ymm10
	vpxor	%ymm9, %ymm5, %ymm4
	vpsllvq	glob_data + 640(%rip), %ymm4, %ymm5
	vpsrlvq	glob_data + 448(%rip), %ymm4, %ymm4
	vpor	%ymm5, %ymm4, %ymm5
	vpxor	%ymm9, %ymm6, %ymm6
	vpermq	$141, %ymm2, %ymm4
	vpermq	$141, %ymm3, %ymm7
	vpsllvq	glob_data + 672(%rip), %ymm6, %ymm2
	vpsrlvq	glob_data + 480(%rip), %ymm6, %ymm3
	vpor	%ymm2, %ymm3, %ymm8
	vpxor	%ymm9, %ymm1, %ymm2
	vpermq	$27, %ymm10, %ymm1
	vpermq	$114, %ymm5, %ymm9
	vpsllvq	glob_data + 544(%rip), %ymm2, %ymm3
	vpsrlvq	glob_data + 352(%rip), %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm10
	vpsrldq	$8, %ymm8, %ymm2
	vpandn	%ymm2, %ymm8, %ymm3
	vpblendd	$12, %ymm9, %ymm10, %ymm2
	vpblendd	$12, %ymm10, %ymm7, %ymm5
	vpblendd	$12, %ymm7, %ymm4, %ymm6
	vpblendd	$12, %ymm4, %ymm10, %ymm11
	vpblendd	$48, %ymm7, %ymm2, %ymm2
	vpblendd	$48, %ymm1, %ymm5, %ymm5
	vpblendd	$48, %ymm10, %ymm6, %ymm6
	vpblendd	$48, %ymm9, %ymm11, %ymm11
	vpblendd	$192, %ymm1, %ymm2, %ymm2
	vpblendd	$192, %ymm9, %ymm5, %ymm5
	vpblendd	$192, %ymm9, %ymm6, %ymm6
	vpblendd	$192, %ymm7, %ymm11, %ymm11
	vpandn	%ymm5, %ymm2, %ymm2
	vpandn	%ymm11, %ymm6, %ymm6
	vpblendd	$12, %ymm10, %ymm1, %ymm11
	vpblendd	$12, %ymm1, %ymm4, %ymm12
	vpxor	%ymm4, %ymm2, %ymm5
	vpblendd	$48, %ymm4, %ymm11, %ymm2
	vpblendd	$48, %ymm7, %ymm12, %ymm11
	vpxor	%ymm1, %ymm6, %ymm6
	vpblendd	$192, %ymm7, %ymm2, %ymm2
	vpblendd	$192, %ymm10, %ymm11, %ymm11
	vpandn	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm2, %ymm12
	vpermq	$30, %ymm8, %ymm2
	vpblendd	$48, %ymm0, %ymm2, %ymm2
	vpermq	$57, %ymm8, %ymm11
	vpblendd	$192, %ymm0, %ymm11, %ymm11
	vpandn	%ymm2, %ymm11, %ymm11
	vpblendd	$12, %ymm1, %ymm7, %ymm2
	vpblendd	$12, %ymm7, %ymm9, %ymm13
	vpblendd	$48, %ymm9, %ymm2, %ymm2
	vpblendd	$48, %ymm4, %ymm13, %ymm13
	vpblendd	$192, %ymm4, %ymm2, %ymm2
	vpblendd	$192, %ymm1, %ymm13, %ymm13
	vpandn	%ymm13, %ymm2, %ymm2
	vpxor	%ymm10, %ymm2, %ymm2
	vpermq	$0, %ymm3, %ymm13
	vpermq	$27, %ymm5, %ymm3
	vpermq	$141, %ymm6, %ymm5
	vpermq	$114, %ymm12, %ymm6
	vpblendd	$12, %ymm4, %ymm9, %ymm12
	vpblendd	$12, %ymm9, %ymm1, %ymm9
	vpblendd	$48, %ymm1, %ymm12, %ymm1
	vpblendd	$48, %ymm10, %ymm9, %ymm9
	vpblendd	$192, %ymm10, %ymm1, %ymm1
	vpblendd	$192, %ymm4, %ymm9, %ymm4
	vpandn	%ymm4, %ymm1, %ymm4
	vpxor	%ymm13, %ymm0, %ymm0
	vpxor	%ymm8, %ymm11, %ymm1
	vpxor	%ymm7, %ymm4, %ymm4
	vpbroadcastq	(%r10,%r11,8), %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	incq	%r11
	cmpq	$24, %r11
	jb  	L_keccakf1600_avx2$2
	ret
L_nttunpack$1:
	vmovdqu	(%rcx), %ymm1
	vmovdqu	32(%rcx), %ymm3
	vmovdqu	64(%rcx), %ymm4
	vmovdqu	96(%rcx), %ymm5
	vmovdqu	128(%rcx), %ymm2
	vmovdqu	160(%rcx), %ymm6
	vmovdqu	192(%rcx), %ymm7
	vmovdqu	224(%rcx), %ymm8
	vperm2i128	$32, %ymm2, %ymm1, %ymm0
	vperm2i128	$49, %ymm2, %ymm1, %ymm1
	vperm2i128	$32, %ymm6, %ymm3, %ymm2
	vperm2i128	$49, %ymm6, %ymm3, %ymm3
	vperm2i128	$32, %ymm7, %ymm4, %ymm6
	vperm2i128	$49, %ymm7, %ymm4, %ymm7
	vperm2i128	$32, %ymm8, %ymm5, %ymm9
	vperm2i128	$49, %ymm8, %ymm5, %ymm10
	vpunpcklqdq	%ymm6, %ymm0, %ymm4
	vpunpckhqdq	%ymm6, %ymm0, %ymm5
	vpunpcklqdq	%ymm7, %ymm1, %ymm6
	vpunpckhqdq	%ymm7, %ymm1, %ymm7
	vpunpcklqdq	%ymm9, %ymm2, %ymm0
	vpunpckhqdq	%ymm9, %ymm2, %ymm2
	vpunpcklqdq	%ymm10, %ymm3, %ymm8
	vpunpckhqdq	%ymm10, %ymm3, %ymm3
	vmovsldup	%ymm0, %ymm1
	vpblendd	$170, %ymm1, %ymm4, %ymm9
	vpsrlq	$32, %ymm4, %ymm1
	vpblendd	$170, %ymm0, %ymm1, %ymm0
	vmovsldup	%ymm2, %ymm1
	vpblendd	$170, %ymm1, %ymm5, %ymm1
	vpsrlq	$32, %ymm5, %ymm4
	vpblendd	$170, %ymm2, %ymm4, %ymm2
	vmovsldup	%ymm8, %ymm4
	vpblendd	$170, %ymm4, %ymm6, %ymm4
	vpsrlq	$32, %ymm6, %ymm5
	vpblendd	$170, %ymm8, %ymm5, %ymm5
	vmovsldup	%ymm3, %ymm6
	vpblendd	$170, %ymm6, %ymm7, %ymm6
	vpsrlq	$32, %ymm7, %ymm7
	vpblendd	$170, %ymm3, %ymm7, %ymm3
	vpslld	$16, %ymm4, %ymm7
	vpblendw	$170, %ymm7, %ymm9, %ymm7
	vpsrld	$16, %ymm9, %ymm8
	vpblendw	$170, %ymm4, %ymm8, %ymm4
	vpslld	$16, %ymm5, %ymm8
	vpblendw	$170, %ymm8, %ymm0, %ymm8
	vpsrld	$16, %ymm0, %ymm0
	vpblendw	$170, %ymm5, %ymm0, %ymm0
	vpslld	$16, %ymm6, %ymm5
	vpblendw	$170, %ymm5, %ymm1, %ymm5
	vpsrld	$16, %ymm1, %ymm1
	vpblendw	$170, %ymm6, %ymm1, %ymm1
	vpslld	$16, %ymm3, %ymm6
	vpblendw	$170, %ymm6, %ymm2, %ymm6
	vpsrld	$16, %ymm2, %ymm2
	vpblendw	$170, %ymm3, %ymm2, %ymm2
	vmovdqu	%ymm7, (%rcx)
	vmovdqu	%ymm4, 32(%rcx)
	vmovdqu	%ymm8, 64(%rcx)
	vmovdqu	%ymm0, 96(%rcx)
	vmovdqu	%ymm5, 128(%rcx)
	vmovdqu	%ymm1, 160(%rcx)
	vmovdqu	%ymm6, 192(%rcx)
	vmovdqu	%ymm2, 224(%rcx)
	vmovdqu	256(%rcx), %ymm1
	vmovdqu	288(%rcx), %ymm3
	vmovdqu	320(%rcx), %ymm4
	vmovdqu	352(%rcx), %ymm5
	vmovdqu	384(%rcx), %ymm2
	vmovdqu	416(%rcx), %ymm6
	vmovdqu	448(%rcx), %ymm7
	vmovdqu	480(%rcx), %ymm8
	vperm2i128	$32, %ymm2, %ymm1, %ymm0
	vperm2i128	$49, %ymm2, %ymm1, %ymm1
	vperm2i128	$32, %ymm6, %ymm3, %ymm2
	vperm2i128	$49, %ymm6, %ymm3, %ymm3
	vperm2i128	$32, %ymm7, %ymm4, %ymm6
	vperm2i128	$49, %ymm7, %ymm4, %ymm7
	vperm2i128	$32, %ymm8, %ymm5, %ymm9
	vperm2i128	$49, %ymm8, %ymm5, %ymm10
	vpunpcklqdq	%ymm6, %ymm0, %ymm4
	vpunpckhqdq	%ymm6, %ymm0, %ymm5
	vpunpcklqdq	%ymm7, %ymm1, %ymm6
	vpunpckhqdq	%ymm7, %ymm1, %ymm7
	vpunpcklqdq	%ymm9, %ymm2, %ymm0
	vpunpckhqdq	%ymm9, %ymm2, %ymm2
	vpunpcklqdq	%ymm10, %ymm3, %ymm8
	vpunpckhqdq	%ymm10, %ymm3, %ymm3
	vmovsldup	%ymm0, %ymm1
	vpblendd	$170, %ymm1, %ymm4, %ymm9
	vpsrlq	$32, %ymm4, %ymm1
	vpblendd	$170, %ymm0, %ymm1, %ymm0
	vmovsldup	%ymm2, %ymm1
	vpblendd	$170, %ymm1, %ymm5, %ymm1
	vpsrlq	$32, %ymm5, %ymm4
	vpblendd	$170, %ymm2, %ymm4, %ymm2
	vmovsldup	%ymm8, %ymm4
	vpblendd	$170, %ymm4, %ymm6, %ymm4
	vpsrlq	$32, %ymm6, %ymm5
	vpblendd	$170, %ymm8, %ymm5, %ymm5
	vmovsldup	%ymm3, %ymm6
	vpblendd	$170, %ymm6, %ymm7, %ymm6
	vpsrlq	$32, %ymm7, %ymm7
	vpblendd	$170, %ymm3, %ymm7, %ymm3
	vpslld	$16, %ymm4, %ymm7
	vpblendw	$170, %ymm7, %ymm9, %ymm7
	vpsrld	$16, %ymm9, %ymm8
	vpblendw	$170, %ymm4, %ymm8, %ymm4
	vpslld	$16, %ymm5, %ymm8
	vpblendw	$170, %ymm8, %ymm0, %ymm8
	vpsrld	$16, %ymm0, %ymm0
	vpblendw	$170, %ymm5, %ymm0, %ymm0
	vpslld	$16, %ymm6, %ymm5
	vpblendw	$170, %ymm5, %ymm1, %ymm5
	vpsrld	$16, %ymm1, %ymm1
	vpblendw	$170, %ymm6, %ymm1, %ymm1
	vpslld	$16, %ymm3, %ymm6
	vpblendw	$170, %ymm6, %ymm2, %ymm6
	vpsrld	$16, %ymm2, %ymm2
	vpblendw	$170, %ymm3, %ymm2, %ymm2
	vmovdqu	%ymm7, 256(%rcx)
	vmovdqu	%ymm4, 288(%rcx)
	vmovdqu	%ymm8, 320(%rcx)
	vmovdqu	%ymm0, 352(%rcx)
	vmovdqu	%ymm5, 384(%rcx)
	vmovdqu	%ymm1, 416(%rcx)
	vmovdqu	%ymm6, 448(%rcx)
	vmovdqu	%ymm2, 480(%rcx)
	ret
	.data
	.p2align	5
_glob_data:
glob_data:
G$sample_q:
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
G$sample_mask:
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
G$sample_ones:
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
G$sample_load_shuffle:
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	10
	.byte	11
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	14
	.byte	15
G$pvc_shufbidx_s:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	8
G$pvd_shufbdidx_s:
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	9
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	8
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	11
G$pd_jshufbidx:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	7
	.byte	7
G$pc_permidx_s:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	5
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	7
	.byte	0
	.byte	0
	.byte	0
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
G$jdmontx16:
	.byte	73
	.byte	5
	.byte	73
	.byte	5
	.byte	73
	.byte	5
	.byte	73
	.byte	5
	.byte	73
	.byte	5
	.byte	73
	.byte	5
	.byte	73
	.byte	5
	.byte	73
	.byte	5
	.byte	73
	.byte	5
	.byte	73
	.byte	5
	.byte	73
	.byte	5
	.byte	73
	.byte	5
	.byte	73
	.byte	5
	.byte	73
	.byte	5
	.byte	73
	.byte	5
	.byte	73
	.byte	5
G$hhqx16:
	.byte	64
	.byte	3
	.byte	64
	.byte	3
	.byte	64
	.byte	3
	.byte	64
	.byte	3
	.byte	64
	.byte	3
	.byte	64
	.byte	3
	.byte	64
	.byte	3
	.byte	64
	.byte	3
	.byte	64
	.byte	3
	.byte	64
	.byte	3
	.byte	64
	.byte	3
	.byte	64
	.byte	3
	.byte	64
	.byte	3
	.byte	64
	.byte	3
	.byte	64
	.byte	3
	.byte	64
	.byte	3
G$hqx16_m1:
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
	.byte	-128
	.byte	6
G$hqx16_p1:
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
	.byte	-127
	.byte	6
G$maskx16:
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
	.byte	-1
	.byte	15
G$jflox16:
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
	.byte	-95
	.byte	-40
G$jfhix16:
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
	.byte	-95
	.byte	5
G$jvx16:
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
	.byte	-65
	.byte	78
G$jqinvx16:
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
	.byte	1
	.byte	-13
G$jqx16:
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
	.byte	1
	.byte	13
G$jzetas_inv_exp:
	.byte	-91
	.byte	-91
	.byte	-76
	.byte	-31
	.byte	34
	.byte	79
	.byte	52
	.byte	93
	.byte	35
	.byte	68
	.byte	86
	.byte	-91
	.byte	-25
	.byte	78
	.byte	-6
	.byte	83
	.byte	123
	.byte	-57
	.byte	37
	.byte	43
	.byte	55
	.byte	58
	.byte	-120
	.byte	24
	.byte	-127
	.byte	126
	.byte	5
	.byte	-60
	.byte	-97
	.byte	-9
	.byte	-72
	.byte	-80
	.byte	-91
	.byte	6
	.byte	-76
	.byte	5
	.byte	34
	.byte	9
	.byte	52
	.byte	1
	.byte	35
	.byte	11
	.byte	86
	.byte	3
	.byte	-25
	.byte	9
	.byte	-6
	.byte	5
	.byte	123
	.byte	6
	.byte	37
	.byte	12
	.byte	55
	.byte	5
	.byte	-120
	.byte	0
	.byte	-127
	.byte	11
	.byte	5
	.byte	5
	.byte	-97
	.byte	10
	.byte	-72
	.byte	8
	.byte	15
	.byte	68
	.byte	67
	.byte	-94
	.byte	29
	.byte	-112
	.byte	108
	.byte	-124
	.byte	102
	.byte	-43
	.byte	-26
	.byte	87
	.byte	-2
	.byte	30
	.byte	-95
	.byte	-41
	.byte	-93
	.byte	-67
	.byte	106
	.byte	-95
	.byte	63
	.byte	-43
	.byte	-65
	.byte	81
	.byte	-71
	.byte	-96
	.byte	-41
	.byte	28
	.byte	-90
	.byte	-100
	.byte	-48
	.byte	121
	.byte	15
	.byte	7
	.byte	67
	.byte	9
	.byte	29
	.byte	9
	.byte	108
	.byte	0
	.byte	102
	.byte	3
	.byte	-26
	.byte	5
	.byte	-2
	.byte	4
	.byte	-95
	.byte	4
	.byte	-93
	.byte	4
	.byte	106
	.byte	3
	.byte	63
	.byte	8
	.byte	-65
	.byte	4
	.byte	-71
	.byte	5
	.byte	-41
	.byte	7
	.byte	-90
	.byte	10
	.byte	-48
	.byte	9
	.byte	-5
	.byte	69
	.byte	92
	.byte	94
	.byte	41
	.byte	-17
	.byte	65
	.byte	-66
	.byte	-43
	.byte	49
	.byte	-28
	.byte	113
	.byte	64
	.byte	-55
	.byte	-114
	.byte	-53
	.byte	-73
	.byte	-72
	.byte	-9
	.byte	117
	.byte	-115
	.byte	-36
	.byte	-106
	.byte	110
	.byte	-61
	.byte	34
	.byte	15
	.byte	62
	.byte	90
	.byte	110
	.byte	85
	.byte	-78
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
	.byte	35
	.byte	63
	.byte	35
	.byte	63
	.byte	-51
	.byte	-105
	.byte	-51
	.byte	-105
	.byte	102
	.byte	-35
	.byte	102
	.byte	-35
	.byte	6
	.byte	-72
	.byte	6
	.byte	-72
	.byte	-95
	.byte	-35
	.byte	-95
	.byte	-35
	.byte	37
	.byte	41
	.byte	37
	.byte	41
	.byte	8
	.byte	-95
	.byte	8
	.byte	-95
	.byte	-87
	.byte	109
	.byte	-87
	.byte	109
	.byte	35
	.byte	6
	.byte	35
	.byte	6
	.byte	-51
	.byte	0
	.byte	-51
	.byte	0
	.byte	102
	.byte	11
	.byte	102
	.byte	11
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	-95
	.byte	10
	.byte	-95
	.byte	10
	.byte	37
	.byte	10
	.byte	37
	.byte	10
	.byte	8
	.byte	9
	.byte	8
	.byte	9
	.byte	-87
	.byte	2
	.byte	-87
	.byte	2
	.byte	69
	.byte	-122
	.byte	69
	.byte	-122
	.byte	69
	.byte	-122
	.byte	69
	.byte	-122
	.byte	-62
	.byte	43
	.byte	-62
	.byte	43
	.byte	-62
	.byte	43
	.byte	-62
	.byte	43
	.byte	-78
	.byte	-6
	.byte	-78
	.byte	-6
	.byte	-78
	.byte	-6
	.byte	-78
	.byte	-6
	.byte	63
	.byte	-42
	.byte	63
	.byte	-42
	.byte	63
	.byte	-42
	.byte	63
	.byte	-42
	.byte	69
	.byte	7
	.byte	69
	.byte	7
	.byte	69
	.byte	7
	.byte	69
	.byte	7
	.byte	-62
	.byte	5
	.byte	-62
	.byte	5
	.byte	-62
	.byte	5
	.byte	-62
	.byte	5
	.byte	-78
	.byte	4
	.byte	-78
	.byte	4
	.byte	-78
	.byte	4
	.byte	-78
	.byte	4
	.byte	63
	.byte	9
	.byte	63
	.byte	9
	.byte	63
	.byte	9
	.byte	63
	.byte	9
	.byte	55
	.byte	65
	.byte	55
	.byte	65
	.byte	55
	.byte	65
	.byte	55
	.byte	65
	.byte	55
	.byte	65
	.byte	55
	.byte	65
	.byte	55
	.byte	65
	.byte	55
	.byte	65
	.byte	-30
	.byte	-111
	.byte	-30
	.byte	-111
	.byte	-30
	.byte	-111
	.byte	-30
	.byte	-111
	.byte	-30
	.byte	-111
	.byte	-30
	.byte	-111
	.byte	-30
	.byte	-111
	.byte	-30
	.byte	-111
	.byte	55
	.byte	12
	.byte	55
	.byte	12
	.byte	55
	.byte	12
	.byte	55
	.byte	12
	.byte	55
	.byte	12
	.byte	55
	.byte	12
	.byte	55
	.byte	12
	.byte	55
	.byte	12
	.byte	-30
	.byte	11
	.byte	-30
	.byte	11
	.byte	-30
	.byte	11
	.byte	-30
	.byte	11
	.byte	-30
	.byte	11
	.byte	-30
	.byte	11
	.byte	-30
	.byte	11
	.byte	-30
	.byte	11
	.byte	-19
	.byte	-4
	.byte	-19
	.byte	-4
	.byte	-19
	.byte	5
	.byte	-19
	.byte	5
	.byte	75
	.byte	49
	.byte	-72
	.byte	-77
	.byte	-92
	.byte	-73
	.byte	125
	.byte	-79
	.byte	-94
	.byte	-50
	.byte	54
	.byte	73
	.byte	-109
	.byte	-119
	.byte	-9
	.byte	126
	.byte	-116
	.byte	-22
	.byte	-52
	.byte	-91
	.byte	-21
	.byte	17
	.byte	-74
	.byte	-52
	.byte	-104
	.byte	84
	.byte	-102
	.byte	55
	.byte	-74
	.byte	-53
	.byte	83
	.byte	-44
	.byte	75
	.byte	0
	.byte	-72
	.byte	11
	.byte	-92
	.byte	11
	.byte	125
	.byte	10
	.byte	-94
	.byte	8
	.byte	54
	.byte	7
	.byte	-109
	.byte	0
	.byte	-9
	.byte	9
	.byte	-116
	.byte	6
	.byte	-52
	.byte	1
	.byte	-21
	.byte	0
	.byte	-74
	.byte	10
	.byte	-104
	.byte	12
	.byte	-102
	.byte	9
	.byte	-74
	.byte	9
	.byte	83
	.byte	11
	.byte	-100
	.byte	20
	.byte	95
	.byte	56
	.byte	104
	.byte	-69
	.byte	54
	.byte	72
	.byte	90
	.byte	112
	.byte	9
	.byte	-114
	.byte	122
	.byte	-42
	.byte	-10
	.byte	-126
	.byte	-37
	.byte	-25
	.byte	35
	.byte	58
	.byte	80
	.byte	-4
	.byte	91
	.byte	108
	.byte	-13
	.byte	-81
	.byte	-29
	.byte	125
	.byte	-42
	.byte	44
	.byte	79
	.byte	1
	.byte	-100
	.byte	0
	.byte	95
	.byte	11
	.byte	104
	.byte	3
	.byte	54
	.byte	6
	.byte	90
	.byte	2
	.byte	9
	.byte	3
	.byte	122
	.byte	8
	.byte	-10
	.byte	0
	.byte	-37
	.byte	6
	.byte	35
	.byte	1
	.byte	80
	.byte	12
	.byte	91
	.byte	11
	.byte	-13
	.byte	6
	.byte	-29
	.byte	4
	.byte	-42
	.byte	10
	.byte	79
	.byte	4
	.byte	68
	.byte	-109
	.byte	-125
	.byte	101
	.byte	-118
	.byte	2
	.byte	82
	.byte	-36
	.byte	-102
	.byte	48
	.byte	64
	.byte	-63
	.byte	8
	.byte	-104
	.byte	-3
	.byte	49
	.byte	8
	.byte	-98
	.byte	26
	.byte	-81
	.byte	46
	.byte	-79
	.byte	13
	.byte	92
	.byte	10
	.byte	-121
	.byte	40
	.byte	-6
	.byte	117
	.byte	25
	.byte	58
	.byte	22
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
	.byte	-126
	.byte	102
	.byte	-126
	.byte	102
	.byte	66
	.byte	-84
	.byte	66
	.byte	-84
	.byte	79
	.byte	4
	.byte	79
	.byte	4
	.byte	61
	.byte	-22
	.byte	61
	.byte	-22
	.byte	-126
	.byte	113
	.byte	-126
	.byte	113
	.byte	-7
	.byte	102
	.byte	-7
	.byte	102
	.byte	45
	.byte	-68
	.byte	45
	.byte	-68
	.byte	-60
	.byte	22
	.byte	-60
	.byte	22
	.byte	-126
	.byte	0
	.byte	-126
	.byte	0
	.byte	66
	.byte	6
	.byte	66
	.byte	6
	.byte	79
	.byte	7
	.byte	79
	.byte	7
	.byte	61
	.byte	3
	.byte	61
	.byte	3
	.byte	-126
	.byte	11
	.byte	-126
	.byte	11
	.byte	-7
	.byte	11
	.byte	-7
	.byte	11
	.byte	45
	.byte	5
	.byte	45
	.byte	5
	.byte	-60
	.byte	10
	.byte	-60
	.byte	10
	.byte	75
	.byte	61
	.byte	75
	.byte	61
	.byte	75
	.byte	61
	.byte	75
	.byte	61
	.byte	-40
	.byte	14
	.byte	-40
	.byte	14
	.byte	-40
	.byte	14
	.byte	-40
	.byte	14
	.byte	-109
	.byte	-109
	.byte	-109
	.byte	-109
	.byte	-109
	.byte	-109
	.byte	-109
	.byte	-109
	.byte	-85
	.byte	81
	.byte	-85
	.byte	81
	.byte	-85
	.byte	81
	.byte	-85
	.byte	81
	.byte	75
	.byte	12
	.byte	75
	.byte	12
	.byte	75
	.byte	12
	.byte	75
	.byte	12
	.byte	-40
	.byte	6
	.byte	-40
	.byte	6
	.byte	-40
	.byte	6
	.byte	-40
	.byte	6
	.byte	-109
	.byte	10
	.byte	-109
	.byte	10
	.byte	-109
	.byte	10
	.byte	-109
	.byte	10
	.byte	-85
	.byte	0
	.byte	-85
	.byte	0
	.byte	-85
	.byte	0
	.byte	-85
	.byte	0
	.byte	115
	.byte	48
	.byte	115
	.byte	48
	.byte	115
	.byte	48
	.byte	115
	.byte	48
	.byte	115
	.byte	48
	.byte	115
	.byte	48
	.byte	115
	.byte	48
	.byte	115
	.byte	48
	.byte	44
	.byte	-53
	.byte	44
	.byte	-53
	.byte	44
	.byte	-53
	.byte	44
	.byte	-53
	.byte	44
	.byte	-53
	.byte	44
	.byte	-53
	.byte	44
	.byte	-53
	.byte	44
	.byte	-53
	.byte	115
	.byte	7
	.byte	115
	.byte	7
	.byte	115
	.byte	7
	.byte	115
	.byte	7
	.byte	115
	.byte	7
	.byte	115
	.byte	7
	.byte	115
	.byte	7
	.byte	115
	.byte	7
	.byte	44
	.byte	7
	.byte	44
	.byte	7
	.byte	44
	.byte	7
	.byte	44
	.byte	7
	.byte	44
	.byte	7
	.byte	44
	.byte	7
	.byte	44
	.byte	7
	.byte	44
	.byte	7
	.byte	103
	.byte	-58
	.byte	103
	.byte	-58
	.byte	103
	.byte	1
	.byte	103
	.byte	1
	.byte	-116
	.byte	-21
	.byte	-116
	.byte	-21
	.byte	-116
	.byte	7
	.byte	-116
	.byte	7
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
G$jzetas_exp:
	.byte	11
	.byte	123
	.byte	11
	.byte	123
	.byte	11
	.byte	10
	.byte	11
	.byte	10
	.byte	-102
	.byte	57
	.byte	-102
	.byte	57
	.byte	-102
	.byte	11
	.byte	-102
	.byte	11
	.byte	-43
	.byte	52
	.byte	-43
	.byte	52
	.byte	-43
	.byte	52
	.byte	-43
	.byte	52
	.byte	-43
	.byte	52
	.byte	-43
	.byte	52
	.byte	-43
	.byte	52
	.byte	-43
	.byte	52
	.byte	-114
	.byte	-49
	.byte	-114
	.byte	-49
	.byte	-114
	.byte	-49
	.byte	-114
	.byte	-49
	.byte	-114
	.byte	-49
	.byte	-114
	.byte	-49
	.byte	-114
	.byte	-49
	.byte	-114
	.byte	-49
	.byte	-43
	.byte	5
	.byte	-43
	.byte	5
	.byte	-43
	.byte	5
	.byte	-43
	.byte	5
	.byte	-43
	.byte	5
	.byte	-43
	.byte	5
	.byte	-43
	.byte	5
	.byte	-43
	.byte	5
	.byte	-114
	.byte	5
	.byte	-114
	.byte	5
	.byte	-114
	.byte	5
	.byte	-114
	.byte	5
	.byte	-114
	.byte	5
	.byte	-114
	.byte	5
	.byte	-114
	.byte	5
	.byte	-114
	.byte	5
	.byte	86
	.byte	-82
	.byte	86
	.byte	-82
	.byte	86
	.byte	-82
	.byte	86
	.byte	-82
	.byte	110
	.byte	108
	.byte	110
	.byte	108
	.byte	110
	.byte	108
	.byte	110
	.byte	108
	.byte	41
	.byte	-15
	.byte	41
	.byte	-15
	.byte	41
	.byte	-15
	.byte	41
	.byte	-15
	.byte	-74
	.byte	-62
	.byte	-74
	.byte	-62
	.byte	-74
	.byte	-62
	.byte	-74
	.byte	-62
	.byte	86
	.byte	12
	.byte	86
	.byte	12
	.byte	86
	.byte	12
	.byte	86
	.byte	12
	.byte	110
	.byte	2
	.byte	110
	.byte	2
	.byte	110
	.byte	2
	.byte	110
	.byte	2
	.byte	41
	.byte	6
	.byte	41
	.byte	6
	.byte	41
	.byte	6
	.byte	41
	.byte	6
	.byte	-74
	.byte	0
	.byte	-74
	.byte	0
	.byte	-74
	.byte	0
	.byte	-74
	.byte	0
	.byte	61
	.byte	-23
	.byte	61
	.byte	-23
	.byte	-44
	.byte	67
	.byte	-44
	.byte	67
	.byte	8
	.byte	-103
	.byte	8
	.byte	-103
	.byte	127
	.byte	-114
	.byte	127
	.byte	-114
	.byte	-60
	.byte	21
	.byte	-60
	.byte	21
	.byte	-78
	.byte	-5
	.byte	-78
	.byte	-5
	.byte	-65
	.byte	83
	.byte	-65
	.byte	83
	.byte	127
	.byte	-103
	.byte	127
	.byte	-103
	.byte	61
	.byte	2
	.byte	61
	.byte	2
	.byte	-44
	.byte	7
	.byte	-44
	.byte	7
	.byte	8
	.byte	1
	.byte	8
	.byte	1
	.byte	127
	.byte	1
	.byte	127
	.byte	1
	.byte	-60
	.byte	9
	.byte	-60
	.byte	9
	.byte	-78
	.byte	5
	.byte	-78
	.byte	5
	.byte	-65
	.byte	6
	.byte	-65
	.byte	6
	.byte	127
	.byte	12
	.byte	127
	.byte	12
	.byte	-57
	.byte	-23
	.byte	-116
	.byte	-26
	.byte	-39
	.byte	5
	.byte	-9
	.byte	120
	.byte	-12
	.byte	-93
	.byte	-45
	.byte	78
	.byte	-25
	.byte	80
	.byte	-7
	.byte	97
	.byte	4
	.byte	-50
	.byte	-7
	.byte	103
	.byte	-63
	.byte	62
	.byte	103
	.byte	-49
	.byte	-81
	.byte	35
	.byte	119
	.byte	-3
	.byte	126
	.byte	-102
	.byte	-67
	.byte	108
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
	.byte	-78
	.byte	-2
	.byte	43
	.byte	-45
	.byte	30
	.byte	-126
	.byte	14
	.byte	80
	.byte	-90
	.byte	-109
	.byte	-79
	.byte	3
	.byte	-34
	.byte	-59
	.byte	38
	.byte	24
	.byte	11
	.byte	125
	.byte	-121
	.byte	41
	.byte	-8
	.byte	113
	.byte	-89
	.byte	-113
	.byte	-53
	.byte	-73
	.byte	-103
	.byte	68
	.byte	-94
	.byte	-57
	.byte	101
	.byte	-21
	.byte	-78
	.byte	8
	.byte	43
	.byte	2
	.byte	30
	.byte	8
	.byte	14
	.byte	6
	.byte	-90
	.byte	1
	.byte	-79
	.byte	0
	.byte	-34
	.byte	11
	.byte	38
	.byte	6
	.byte	11
	.byte	12
	.byte	-121
	.byte	4
	.byte	-8
	.byte	9
	.byte	-89
	.byte	10
	.byte	-53
	.byte	6
	.byte	-103
	.byte	9
	.byte	-94
	.byte	1
	.byte	101
	.byte	12
	.byte	-82
	.byte	43
	.byte	75
	.byte	52
	.byte	103
	.byte	-56
	.byte	105
	.byte	-85
	.byte	75
	.byte	51
	.byte	22
	.byte	-18
	.byte	53
	.byte	90
	.byte	117
	.byte	21
	.byte	10
	.byte	-127
	.byte	110
	.byte	118
	.byte	-53
	.byte	-74
	.byte	95
	.byte	49
	.byte	-124
	.byte	78
	.byte	93
	.byte	72
	.byte	73
	.byte	76
	.byte	-74
	.byte	-50
	.byte	-82
	.byte	1
	.byte	75
	.byte	3
	.byte	103
	.byte	3
	.byte	105
	.byte	0
	.byte	75
	.byte	2
	.byte	22
	.byte	12
	.byte	53
	.byte	11
	.byte	117
	.byte	6
	.byte	10
	.byte	3
	.byte	110
	.byte	12
	.byte	-53
	.byte	5
	.byte	95
	.byte	4
	.byte	-124
	.byte	2
	.byte	93
	.byte	1
	.byte	73
	.byte	1
	.byte	-74
	.byte	12
	.byte	20
	.byte	3
	.byte	20
	.byte	3
	.byte	20
	.byte	7
	.byte	20
	.byte	7
	.byte	31
	.byte	110
	.byte	31
	.byte	110
	.byte	31
	.byte	110
	.byte	31
	.byte	110
	.byte	31
	.byte	110
	.byte	31
	.byte	110
	.byte	31
	.byte	110
	.byte	31
	.byte	110
	.byte	-54
	.byte	-66
	.byte	-54
	.byte	-66
	.byte	-54
	.byte	-66
	.byte	-54
	.byte	-66
	.byte	-54
	.byte	-66
	.byte	-54
	.byte	-66
	.byte	-54
	.byte	-66
	.byte	-54
	.byte	-66
	.byte	31
	.byte	1
	.byte	31
	.byte	1
	.byte	31
	.byte	1
	.byte	31
	.byte	1
	.byte	31
	.byte	1
	.byte	31
	.byte	1
	.byte	31
	.byte	1
	.byte	31
	.byte	1
	.byte	-54
	.byte	0
	.byte	-54
	.byte	0
	.byte	-54
	.byte	0
	.byte	-54
	.byte	0
	.byte	-54
	.byte	0
	.byte	-54
	.byte	0
	.byte	-54
	.byte	0
	.byte	-54
	.byte	0
	.byte	-62
	.byte	41
	.byte	-62
	.byte	41
	.byte	-62
	.byte	41
	.byte	-62
	.byte	41
	.byte	79
	.byte	5
	.byte	79
	.byte	5
	.byte	79
	.byte	5
	.byte	79
	.byte	5
	.byte	63
	.byte	-44
	.byte	63
	.byte	-44
	.byte	63
	.byte	-44
	.byte	63
	.byte	-44
	.byte	-68
	.byte	121
	.byte	-68
	.byte	121
	.byte	-68
	.byte	121
	.byte	-68
	.byte	121
	.byte	-62
	.byte	3
	.byte	-62
	.byte	3
	.byte	-62
	.byte	3
	.byte	-62
	.byte	3
	.byte	79
	.byte	8
	.byte	79
	.byte	8
	.byte	79
	.byte	8
	.byte	79
	.byte	8
	.byte	63
	.byte	7
	.byte	63
	.byte	7
	.byte	63
	.byte	7
	.byte	63
	.byte	7
	.byte	-68
	.byte	5
	.byte	-68
	.byte	5
	.byte	-68
	.byte	5
	.byte	-68
	.byte	5
	.byte	88
	.byte	-110
	.byte	88
	.byte	-110
	.byte	-7
	.byte	94
	.byte	-7
	.byte	94
	.byte	-36
	.byte	-42
	.byte	-36
	.byte	-42
	.byte	96
	.byte	34
	.byte	96
	.byte	34
	.byte	-5
	.byte	71
	.byte	-5
	.byte	71
	.byte	-101
	.byte	34
	.byte	-101
	.byte	34
	.byte	52
	.byte	104
	.byte	52
	.byte	104
	.byte	-34
	.byte	-64
	.byte	-34
	.byte	-64
	.byte	88
	.byte	10
	.byte	88
	.byte	10
	.byte	-7
	.byte	3
	.byte	-7
	.byte	3
	.byte	-36
	.byte	2
	.byte	-36
	.byte	2
	.byte	96
	.byte	2
	.byte	96
	.byte	2
	.byte	-5
	.byte	6
	.byte	-5
	.byte	6
	.byte	-101
	.byte	1
	.byte	-101
	.byte	1
	.byte	52
	.byte	12
	.byte	52
	.byte	12
	.byte	-34
	.byte	6
	.byte	-34
	.byte	6
	.byte	-84
	.byte	77
	.byte	-89
	.byte	-111
	.byte	-14
	.byte	-63
	.byte	62
	.byte	-35
	.byte	107
	.byte	-111
	.byte	116
	.byte	35
	.byte	10
	.byte	-118
	.byte	74
	.byte	71
	.byte	115
	.byte	52
	.byte	-63
	.byte	54
	.byte	29
	.byte	-114
	.byte	44
	.byte	-50
	.byte	-64
	.byte	65
	.byte	-40
	.byte	16
	.byte	-91
	.byte	-95
	.byte	6
	.byte	-70
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
	.byte	49
	.byte	-122
	.byte	91
	.byte	99
	.byte	42
	.byte	-29
	.byte	72
	.byte	95
	.byte	66
	.byte	-82
	.byte	-62
	.byte	42
	.byte	-105
	.byte	94
	.byte	94
	.byte	66
	.byte	96
	.byte	40
	.byte	3
	.byte	-31
	.byte	27
	.byte	-88
	.byte	-101
	.byte	42
	.byte	-107
	.byte	123
	.byte	-28
	.byte	111
	.byte	-66
	.byte	93
	.byte	-14
	.byte	-69
	.byte	49
	.byte	3
	.byte	91
	.byte	2
	.byte	42
	.byte	5
	.byte	72
	.byte	7
	.byte	66
	.byte	8
	.byte	-62
	.byte	4
	.byte	-105
	.byte	9
	.byte	94
	.byte	8
	.byte	96
	.byte	8
	.byte	3
	.byte	8
	.byte	27
	.byte	7
	.byte	-101
	.byte	9
	.byte	-107
	.byte	12
	.byte	-28
	.byte	3
	.byte	-66
	.byte	3
	.byte	-14
	.byte	5
	.byte	73
	.byte	79
	.byte	98
	.byte	8
	.byte	-4
	.byte	59
	.byte	-128
	.byte	-127
	.byte	121
	.byte	-25
	.byte	-54
	.byte	-59
	.byte	-36
	.byte	-44
	.byte	-122
	.byte	56
	.byte	7
	.byte	-84
	.byte	26
	.byte	-79
	.byte	-85
	.byte	90
	.byte	-34
	.byte	-69
	.byte	-51
	.byte	-94
	.byte	-33
	.byte	-80
	.byte	77
	.byte	30
	.byte	92
	.byte	90
	.byte	73
	.byte	4
	.byte	98
	.byte	2
	.byte	-4
	.byte	7
	.byte	-128
	.byte	1
	.byte	121
	.byte	12
	.byte	-54
	.byte	7
	.byte	-36
	.byte	0
	.byte	-122
	.byte	6
	.byte	7
	.byte	7
	.byte	26
	.byte	3
	.byte	-85
	.byte	9
	.byte	-34
	.byte	1
	.byte	-51
	.byte	11
	.byte	-33
	.byte	3
	.byte	77
	.byte	7
	.byte	92
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
G$pfm_idx_s:
	.byte	0
	.byte	1
	.byte	4
	.byte	5
	.byte	8
	.byte	9
	.byte	12
	.byte	13
	.byte	2
	.byte	3
	.byte	6
	.byte	7
	.byte	10
	.byte	11
	.byte	14
	.byte	15
G$pfm_shift_s:
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	2
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
G$gen_matrix_indexes:
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	1
	.byte	0
	.byte	2
	.byte	1
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	0
	.byte	2
	.byte	1
G$sample_shuffle_table:
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	6
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	6
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	6
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	-1
	.byte	-1
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	6
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	6
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	12
	.byte	-1
	.byte	-1
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	6
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	-1
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	6
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	6
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	14
	.byte	-1
	.byte	-1
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	6
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	6
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	14
	.byte	-1
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	6
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	6
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	12
	.byte	14
	.byte	-1
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	4
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	6
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	4
	.byte	6
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	4
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	2
	.byte	4
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	2
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	-1
	.byte	0
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	14
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	8
	.byte	10
	.byte	12
	.byte	14
G$pvc_sllvdidx_s:
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
G$pvc_shift2_s:
	.byte	1
	.byte	0
	.byte	0
	.byte	4
	.byte	1
	.byte	0
	.byte	0
	.byte	4
G$pvd_sllvdidx_s:
	.byte	4
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
G$pvd_mask_s:
	.byte	-8
	.byte	31
	.byte	-32
	.byte	127
G$pvd_q_s:
	.byte	4
	.byte	52
	.byte	1
	.byte	13
G$pd_shift_s:
	.byte	0
	.byte	8
	.byte	-128
	.byte	0
G$pd_mask_s:
	.byte	15
	.byte	0
	.byte	-16
	.byte	0
G$pvc_mask_s:
	.byte	-1
	.byte	3
G$pvc_shift1_s:
	.byte	0
	.byte	16
G$pvc_off_s:
	.byte	15
	.byte	0
G$pc_shift2_s:
	.byte	1
	.byte	16
G$pc_mask_s:
	.byte	15
	.byte	0
G$pc_shift1_s:
	.byte	0
	.byte	2
G$mqinvx16:
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
	.byte	-5
	.byte	58
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
