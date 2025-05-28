	.att_syntax
	.text
	.p2align	5
	.global	_jade_kem_mlkem_mlkem768_amd64_avx2_dec
	.global	jade_kem_mlkem_mlkem768_amd64_avx2_dec
	.global	_jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand
	.global	jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand
	.global	_jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand
	.global	jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand
_jade_kem_mlkem_mlkem768_amd64_avx2_dec:
jade_kem_mlkem_mlkem768_amd64_avx2_dec:
	movq	%rsp, %rax
	leaq	-22312(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 22256(%rsp)
	movq	%rbp, 22264(%rsp)
	movq	%r12, 22272(%rsp)
	movq	%r13, 22280(%rsp)
	movq	%r14, 22288(%rsp)
	movq	%r15, 22296(%rsp)
	movq	%rax, 22304(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm1
	movq	(%rsi), %rax
	movq	%rax, 2240(%rsp)
	movq	8(%rsi), %rax
	movq	%rax, 2248(%rsp)
	movq	16(%rsi), %rax
	movq	%rax, 2256(%rsp)
	movq	24(%rsi), %rax
	movq	%rax, 2264(%rsp)
	movq	32(%rsi), %rax
	movq	%rax, 2272(%rsp)
	movq	40(%rsi), %rax
	movq	%rax, 2280(%rsp)
	movq	48(%rsi), %rax
	movq	%rax, 2288(%rsp)
	movq	56(%rsi), %rax
	movq	%rax, 2296(%rsp)
	movq	64(%rsi), %rax
	movq	%rax, 2304(%rsp)
	movq	72(%rsi), %rax
	movq	%rax, 2312(%rsp)
	movq	80(%rsi), %rax
	movq	%rax, 2320(%rsp)
	movq	88(%rsi), %rax
	movq	%rax, 2328(%rsp)
	movq	96(%rsi), %rax
	movq	%rax, 2336(%rsp)
	movq	104(%rsi), %rax
	movq	%rax, 2344(%rsp)
	movq	112(%rsi), %rax
	movq	%rax, 2352(%rsp)
	movq	120(%rsi), %rax
	movq	%rax, 2360(%rsp)
	movq	128(%rsi), %rax
	movq	%rax, 2368(%rsp)
	movq	136(%rsi), %rax
	movq	%rax, 2376(%rsp)
	movq	144(%rsi), %rax
	movq	%rax, 2384(%rsp)
	movq	152(%rsi), %rax
	movq	%rax, 2392(%rsp)
	movq	160(%rsi), %rax
	movq	%rax, 2400(%rsp)
	movq	168(%rsi), %rax
	movq	%rax, 2408(%rsp)
	movq	176(%rsi), %rax
	movq	%rax, 2416(%rsp)
	movq	184(%rsi), %rax
	movq	%rax, 2424(%rsp)
	movq	192(%rsi), %rax
	movq	%rax, 2432(%rsp)
	movq	200(%rsi), %rax
	movq	%rax, 2440(%rsp)
	movq	208(%rsi), %rax
	movq	%rax, 2448(%rsp)
	movq	216(%rsi), %rax
	movq	%rax, 2456(%rsp)
	movq	224(%rsi), %rax
	movq	%rax, 2464(%rsp)
	movq	232(%rsi), %rax
	movq	%rax, 2472(%rsp)
	movq	240(%rsi), %rax
	movq	%rax, 2480(%rsp)
	movq	248(%rsi), %rax
	movq	%rax, 2488(%rsp)
	movq	256(%rsi), %rax
	movq	%rax, 2496(%rsp)
	movq	264(%rsi), %rax
	movq	%rax, 2504(%rsp)
	movq	272(%rsi), %rax
	movq	%rax, 2512(%rsp)
	movq	280(%rsi), %rax
	movq	%rax, 2520(%rsp)
	movq	288(%rsi), %rax
	movq	%rax, 2528(%rsp)
	movq	296(%rsi), %rax
	movq	%rax, 2536(%rsp)
	movq	304(%rsi), %rax
	movq	%rax, 2544(%rsp)
	movq	312(%rsi), %rax
	movq	%rax, 2552(%rsp)
	movq	320(%rsi), %rax
	movq	%rax, 2560(%rsp)
	movq	328(%rsi), %rax
	movq	%rax, 2568(%rsp)
	movq	336(%rsi), %rax
	movq	%rax, 2576(%rsp)
	movq	344(%rsi), %rax
	movq	%rax, 2584(%rsp)
	movq	352(%rsi), %rax
	movq	%rax, 2592(%rsp)
	movq	360(%rsi), %rax
	movq	%rax, 2600(%rsp)
	movq	368(%rsi), %rax
	movq	%rax, 2608(%rsp)
	movq	376(%rsi), %rax
	movq	%rax, 2616(%rsp)
	movq	384(%rsi), %rax
	movq	%rax, 2624(%rsp)
	movq	392(%rsi), %rax
	movq	%rax, 2632(%rsp)
	movq	400(%rsi), %rax
	movq	%rax, 2640(%rsp)
	movq	408(%rsi), %rax
	movq	%rax, 2648(%rsp)
	movq	416(%rsi), %rax
	movq	%rax, 2656(%rsp)
	movq	424(%rsi), %rax
	movq	%rax, 2664(%rsp)
	movq	432(%rsi), %rax
	movq	%rax, 2672(%rsp)
	movq	440(%rsi), %rax
	movq	%rax, 2680(%rsp)
	movq	448(%rsi), %rax
	movq	%rax, 2688(%rsp)
	movq	456(%rsi), %rax
	movq	%rax, 2696(%rsp)
	movq	464(%rsi), %rax
	movq	%rax, 2704(%rsp)
	movq	472(%rsi), %rax
	movq	%rax, 2712(%rsp)
	movq	480(%rsi), %rax
	movq	%rax, 2720(%rsp)
	movq	488(%rsi), %rax
	movq	%rax, 2728(%rsp)
	movq	496(%rsi), %rax
	movq	%rax, 2736(%rsp)
	movq	504(%rsi), %rax
	movq	%rax, 2744(%rsp)
	movq	512(%rsi), %rax
	movq	%rax, 2752(%rsp)
	movq	520(%rsi), %rax
	movq	%rax, 2760(%rsp)
	movq	528(%rsi), %rax
	movq	%rax, 2768(%rsp)
	movq	536(%rsi), %rax
	movq	%rax, 2776(%rsp)
	movq	544(%rsi), %rax
	movq	%rax, 2784(%rsp)
	movq	552(%rsi), %rax
	movq	%rax, 2792(%rsp)
	movq	560(%rsi), %rax
	movq	%rax, 2800(%rsp)
	movq	568(%rsi), %rax
	movq	%rax, 2808(%rsp)
	movq	576(%rsi), %rax
	movq	%rax, 2816(%rsp)
	movq	584(%rsi), %rax
	movq	%rax, 2824(%rsp)
	movq	592(%rsi), %rax
	movq	%rax, 2832(%rsp)
	movq	600(%rsi), %rax
	movq	%rax, 2840(%rsp)
	movq	608(%rsi), %rax
	movq	%rax, 2848(%rsp)
	movq	616(%rsi), %rax
	movq	%rax, 2856(%rsp)
	movq	624(%rsi), %rax
	movq	%rax, 2864(%rsp)
	movq	632(%rsi), %rax
	movq	%rax, 2872(%rsp)
	movq	640(%rsi), %rax
	movq	%rax, 2880(%rsp)
	movq	648(%rsi), %rax
	movq	%rax, 2888(%rsp)
	movq	656(%rsi), %rax
	movq	%rax, 2896(%rsp)
	movq	664(%rsi), %rax
	movq	%rax, 2904(%rsp)
	movq	672(%rsi), %rax
	movq	%rax, 2912(%rsp)
	movq	680(%rsi), %rax
	movq	%rax, 2920(%rsp)
	movq	688(%rsi), %rax
	movq	%rax, 2928(%rsp)
	movq	696(%rsi), %rax
	movq	%rax, 2936(%rsp)
	movq	704(%rsi), %rax
	movq	%rax, 2944(%rsp)
	movq	712(%rsi), %rax
	movq	%rax, 2952(%rsp)
	movq	720(%rsi), %rax
	movq	%rax, 2960(%rsp)
	movq	728(%rsi), %rax
	movq	%rax, 2968(%rsp)
	movq	736(%rsi), %rax
	movq	%rax, 2976(%rsp)
	movq	744(%rsi), %rax
	movq	%rax, 2984(%rsp)
	movq	752(%rsi), %rax
	movq	%rax, 2992(%rsp)
	movq	760(%rsi), %rax
	movq	%rax, 3000(%rsp)
	movq	768(%rsi), %rax
	movq	%rax, 3008(%rsp)
	movq	776(%rsi), %rax
	movq	%rax, 3016(%rsp)
	movq	784(%rsi), %rax
	movq	%rax, 3024(%rsp)
	movq	792(%rsi), %rax
	movq	%rax, 3032(%rsp)
	movq	800(%rsi), %rax
	movq	%rax, 3040(%rsp)
	movq	808(%rsi), %rax
	movq	%rax, 3048(%rsp)
	movq	816(%rsi), %rax
	movq	%rax, 3056(%rsp)
	movq	824(%rsi), %rax
	movq	%rax, 3064(%rsp)
	movq	832(%rsi), %rax
	movq	%rax, 3072(%rsp)
	movq	840(%rsi), %rax
	movq	%rax, 3080(%rsp)
	movq	848(%rsi), %rax
	movq	%rax, 3088(%rsp)
	movq	856(%rsi), %rax
	movq	%rax, 3096(%rsp)
	movq	864(%rsi), %rax
	movq	%rax, 3104(%rsp)
	movq	872(%rsi), %rax
	movq	%rax, 3112(%rsp)
	movq	880(%rsi), %rax
	movq	%rax, 3120(%rsp)
	movq	888(%rsi), %rax
	movq	%rax, 3128(%rsp)
	movq	896(%rsi), %rax
	movq	%rax, 3136(%rsp)
	movq	904(%rsi), %rax
	movq	%rax, 3144(%rsp)
	movq	912(%rsi), %rax
	movq	%rax, 3152(%rsp)
	movq	920(%rsi), %rax
	movq	%rax, 3160(%rsp)
	movq	928(%rsi), %rax
	movq	%rax, 3168(%rsp)
	movq	936(%rsi), %rax
	movq	%rax, 3176(%rsp)
	movq	944(%rsi), %rax
	movq	%rax, 3184(%rsp)
	movq	952(%rsi), %rax
	movq	%rax, 3192(%rsp)
	movq	960(%rsi), %rax
	movq	%rax, 3200(%rsp)
	movq	968(%rsi), %rax
	movq	%rax, 3208(%rsp)
	movq	976(%rsi), %rax
	movq	%rax, 3216(%rsp)
	movq	984(%rsi), %rax
	movq	%rax, 3224(%rsp)
	movq	992(%rsi), %rax
	movq	%rax, 3232(%rsp)
	movq	1000(%rsi), %rax
	movq	%rax, 3240(%rsp)
	movq	1008(%rsi), %rax
	movq	%rax, 3248(%rsp)
	movq	1016(%rsi), %rax
	movq	%rax, 3256(%rsp)
	movq	1024(%rsi), %rax
	movq	%rax, 3264(%rsp)
	movq	1032(%rsi), %rax
	movq	%rax, 3272(%rsp)
	movq	1040(%rsi), %rax
	movq	%rax, 3280(%rsp)
	movq	1048(%rsi), %rax
	movq	%rax, 3288(%rsp)
	movq	1056(%rsi), %rax
	movq	%rax, 3296(%rsp)
	movq	1064(%rsi), %rax
	movq	%rax, 3304(%rsp)
	movq	1072(%rsi), %rax
	movq	%rax, 3312(%rsp)
	movq	1080(%rsi), %rax
	movq	%rax, 3320(%rsp)
	movq	(%rdx), %rax
	movq	%rax, 17456(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 17464(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 17472(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 17480(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 17488(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 17496(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 17504(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 17512(%rsp)
	movq	64(%rdx), %rax
	movq	%rax, 17520(%rsp)
	movq	72(%rdx), %rax
	movq	%rax, 17528(%rsp)
	movq	80(%rdx), %rax
	movq	%rax, 17536(%rsp)
	movq	88(%rdx), %rax
	movq	%rax, 17544(%rsp)
	movq	96(%rdx), %rax
	movq	%rax, 17552(%rsp)
	movq	104(%rdx), %rax
	movq	%rax, 17560(%rsp)
	movq	112(%rdx), %rax
	movq	%rax, 17568(%rsp)
	movq	120(%rdx), %rax
	movq	%rax, 17576(%rsp)
	movq	128(%rdx), %rax
	movq	%rax, 17584(%rsp)
	movq	136(%rdx), %rax
	movq	%rax, 17592(%rsp)
	movq	144(%rdx), %rax
	movq	%rax, 17600(%rsp)
	movq	152(%rdx), %rax
	movq	%rax, 17608(%rsp)
	movq	160(%rdx), %rax
	movq	%rax, 17616(%rsp)
	movq	168(%rdx), %rax
	movq	%rax, 17624(%rsp)
	movq	176(%rdx), %rax
	movq	%rax, 17632(%rsp)
	movq	184(%rdx), %rax
	movq	%rax, 17640(%rsp)
	movq	192(%rdx), %rax
	movq	%rax, 17648(%rsp)
	movq	200(%rdx), %rax
	movq	%rax, 17656(%rsp)
	movq	208(%rdx), %rax
	movq	%rax, 17664(%rsp)
	movq	216(%rdx), %rax
	movq	%rax, 17672(%rsp)
	movq	224(%rdx), %rax
	movq	%rax, 17680(%rsp)
	movq	232(%rdx), %rax
	movq	%rax, 17688(%rsp)
	movq	240(%rdx), %rax
	movq	%rax, 17696(%rsp)
	movq	248(%rdx), %rax
	movq	%rax, 17704(%rsp)
	movq	256(%rdx), %rax
	movq	%rax, 17712(%rsp)
	movq	264(%rdx), %rax
	movq	%rax, 17720(%rsp)
	movq	272(%rdx), %rax
	movq	%rax, 17728(%rsp)
	movq	280(%rdx), %rax
	movq	%rax, 17736(%rsp)
	movq	288(%rdx), %rax
	movq	%rax, 17744(%rsp)
	movq	296(%rdx), %rax
	movq	%rax, 17752(%rsp)
	movq	304(%rdx), %rax
	movq	%rax, 17760(%rsp)
	movq	312(%rdx), %rax
	movq	%rax, 17768(%rsp)
	movq	320(%rdx), %rax
	movq	%rax, 17776(%rsp)
	movq	328(%rdx), %rax
	movq	%rax, 17784(%rsp)
	movq	336(%rdx), %rax
	movq	%rax, 17792(%rsp)
	movq	344(%rdx), %rax
	movq	%rax, 17800(%rsp)
	movq	352(%rdx), %rax
	movq	%rax, 17808(%rsp)
	movq	360(%rdx), %rax
	movq	%rax, 17816(%rsp)
	movq	368(%rdx), %rax
	movq	%rax, 17824(%rsp)
	movq	376(%rdx), %rax
	movq	%rax, 17832(%rsp)
	movq	384(%rdx), %rax
	movq	%rax, 17840(%rsp)
	movq	392(%rdx), %rax
	movq	%rax, 17848(%rsp)
	movq	400(%rdx), %rax
	movq	%rax, 17856(%rsp)
	movq	408(%rdx), %rax
	movq	%rax, 17864(%rsp)
	movq	416(%rdx), %rax
	movq	%rax, 17872(%rsp)
	movq	424(%rdx), %rax
	movq	%rax, 17880(%rsp)
	movq	432(%rdx), %rax
	movq	%rax, 17888(%rsp)
	movq	440(%rdx), %rax
	movq	%rax, 17896(%rsp)
	movq	448(%rdx), %rax
	movq	%rax, 17904(%rsp)
	movq	456(%rdx), %rax
	movq	%rax, 17912(%rsp)
	movq	464(%rdx), %rax
	movq	%rax, 17920(%rsp)
	movq	472(%rdx), %rax
	movq	%rax, 17928(%rsp)
	movq	480(%rdx), %rax
	movq	%rax, 17936(%rsp)
	movq	488(%rdx), %rax
	movq	%rax, 17944(%rsp)
	movq	496(%rdx), %rax
	movq	%rax, 17952(%rsp)
	movq	504(%rdx), %rax
	movq	%rax, 17960(%rsp)
	movq	512(%rdx), %rax
	movq	%rax, 17968(%rsp)
	movq	520(%rdx), %rax
	movq	%rax, 17976(%rsp)
	movq	528(%rdx), %rax
	movq	%rax, 17984(%rsp)
	movq	536(%rdx), %rax
	movq	%rax, 17992(%rsp)
	movq	544(%rdx), %rax
	movq	%rax, 18000(%rsp)
	movq	552(%rdx), %rax
	movq	%rax, 18008(%rsp)
	movq	560(%rdx), %rax
	movq	%rax, 18016(%rsp)
	movq	568(%rdx), %rax
	movq	%rax, 18024(%rsp)
	movq	576(%rdx), %rax
	movq	%rax, 18032(%rsp)
	movq	584(%rdx), %rax
	movq	%rax, 18040(%rsp)
	movq	592(%rdx), %rax
	movq	%rax, 18048(%rsp)
	movq	600(%rdx), %rax
	movq	%rax, 18056(%rsp)
	movq	608(%rdx), %rax
	movq	%rax, 18064(%rsp)
	movq	616(%rdx), %rax
	movq	%rax, 18072(%rsp)
	movq	624(%rdx), %rax
	movq	%rax, 18080(%rsp)
	movq	632(%rdx), %rax
	movq	%rax, 18088(%rsp)
	movq	640(%rdx), %rax
	movq	%rax, 18096(%rsp)
	movq	648(%rdx), %rax
	movq	%rax, 18104(%rsp)
	movq	656(%rdx), %rax
	movq	%rax, 18112(%rsp)
	movq	664(%rdx), %rax
	movq	%rax, 18120(%rsp)
	movq	672(%rdx), %rax
	movq	%rax, 18128(%rsp)
	movq	680(%rdx), %rax
	movq	%rax, 18136(%rsp)
	movq	688(%rdx), %rax
	movq	%rax, 18144(%rsp)
	movq	696(%rdx), %rax
	movq	%rax, 18152(%rsp)
	movq	704(%rdx), %rax
	movq	%rax, 18160(%rsp)
	movq	712(%rdx), %rax
	movq	%rax, 18168(%rsp)
	movq	720(%rdx), %rax
	movq	%rax, 18176(%rsp)
	movq	728(%rdx), %rax
	movq	%rax, 18184(%rsp)
	movq	736(%rdx), %rax
	movq	%rax, 18192(%rsp)
	movq	744(%rdx), %rax
	movq	%rax, 18200(%rsp)
	movq	752(%rdx), %rax
	movq	%rax, 18208(%rsp)
	movq	760(%rdx), %rax
	movq	%rax, 18216(%rsp)
	movq	768(%rdx), %rax
	movq	%rax, 18224(%rsp)
	movq	776(%rdx), %rax
	movq	%rax, 18232(%rsp)
	movq	784(%rdx), %rax
	movq	%rax, 18240(%rsp)
	movq	792(%rdx), %rax
	movq	%rax, 18248(%rsp)
	movq	800(%rdx), %rax
	movq	%rax, 18256(%rsp)
	movq	808(%rdx), %rax
	movq	%rax, 18264(%rsp)
	movq	816(%rdx), %rax
	movq	%rax, 18272(%rsp)
	movq	824(%rdx), %rax
	movq	%rax, 18280(%rsp)
	movq	832(%rdx), %rax
	movq	%rax, 18288(%rsp)
	movq	840(%rdx), %rax
	movq	%rax, 18296(%rsp)
	movq	848(%rdx), %rax
	movq	%rax, 18304(%rsp)
	movq	856(%rdx), %rax
	movq	%rax, 18312(%rsp)
	movq	864(%rdx), %rax
	movq	%rax, 18320(%rsp)
	movq	872(%rdx), %rax
	movq	%rax, 18328(%rsp)
	movq	880(%rdx), %rax
	movq	%rax, 18336(%rsp)
	movq	888(%rdx), %rax
	movq	%rax, 18344(%rsp)
	movq	896(%rdx), %rax
	movq	%rax, 18352(%rsp)
	movq	904(%rdx), %rax
	movq	%rax, 18360(%rsp)
	movq	912(%rdx), %rax
	movq	%rax, 18368(%rsp)
	movq	920(%rdx), %rax
	movq	%rax, 18376(%rsp)
	movq	928(%rdx), %rax
	movq	%rax, 18384(%rsp)
	movq	936(%rdx), %rax
	movq	%rax, 18392(%rsp)
	movq	944(%rdx), %rax
	movq	%rax, 18400(%rsp)
	movq	952(%rdx), %rax
	movq	%rax, 18408(%rsp)
	movq	960(%rdx), %rax
	movq	%rax, 18416(%rsp)
	movq	968(%rdx), %rax
	movq	%rax, 18424(%rsp)
	movq	976(%rdx), %rax
	movq	%rax, 18432(%rsp)
	movq	984(%rdx), %rax
	movq	%rax, 18440(%rsp)
	movq	992(%rdx), %rax
	movq	%rax, 18448(%rsp)
	movq	1000(%rdx), %rax
	movq	%rax, 18456(%rsp)
	movq	1008(%rdx), %rax
	movq	%rax, 18464(%rsp)
	movq	1016(%rdx), %rax
	movq	%rax, 18472(%rsp)
	movq	1024(%rdx), %rax
	movq	%rax, 18480(%rsp)
	movq	1032(%rdx), %rax
	movq	%rax, 18488(%rsp)
	movq	1040(%rdx), %rax
	movq	%rax, 18496(%rsp)
	movq	1048(%rdx), %rax
	movq	%rax, 18504(%rsp)
	movq	1056(%rdx), %rax
	movq	%rax, 18512(%rsp)
	movq	1064(%rdx), %rax
	movq	%rax, 18520(%rsp)
	movq	1072(%rdx), %rax
	movq	%rax, 18528(%rsp)
	movq	1080(%rdx), %rax
	movq	%rax, 18536(%rsp)
	movq	1088(%rdx), %rax
	movq	%rax, 18544(%rsp)
	movq	1096(%rdx), %rax
	movq	%rax, 18552(%rsp)
	movq	1104(%rdx), %rax
	movq	%rax, 18560(%rsp)
	movq	1112(%rdx), %rax
	movq	%rax, 18568(%rsp)
	movq	1120(%rdx), %rax
	movq	%rax, 18576(%rsp)
	movq	1128(%rdx), %rax
	movq	%rax, 18584(%rsp)
	movq	1136(%rdx), %rax
	movq	%rax, 18592(%rsp)
	movq	1144(%rdx), %rax
	movq	%rax, 18600(%rsp)
	movq	1152(%rdx), %rax
	movq	%rax, 18608(%rsp)
	movq	1160(%rdx), %rax
	movq	%rax, 18616(%rsp)
	movq	1168(%rdx), %rax
	movq	%rax, 18624(%rsp)
	movq	1176(%rdx), %rax
	movq	%rax, 18632(%rsp)
	movq	1184(%rdx), %rax
	movq	%rax, 18640(%rsp)
	movq	1192(%rdx), %rax
	movq	%rax, 18648(%rsp)
	movq	1200(%rdx), %rax
	movq	%rax, 18656(%rsp)
	movq	1208(%rdx), %rax
	movq	%rax, 18664(%rsp)
	movq	1216(%rdx), %rax
	movq	%rax, 18672(%rsp)
	movq	1224(%rdx), %rax
	movq	%rax, 18680(%rsp)
	movq	1232(%rdx), %rax
	movq	%rax, 18688(%rsp)
	movq	1240(%rdx), %rax
	movq	%rax, 18696(%rsp)
	movq	1248(%rdx), %rax
	movq	%rax, 18704(%rsp)
	movq	1256(%rdx), %rax
	movq	%rax, 18712(%rsp)
	movq	1264(%rdx), %rax
	movq	%rax, 18720(%rsp)
	movq	1272(%rdx), %rax
	movq	%rax, 18728(%rsp)
	movq	1280(%rdx), %rax
	movq	%rax, 18736(%rsp)
	movq	1288(%rdx), %rax
	movq	%rax, 18744(%rsp)
	movq	1296(%rdx), %rax
	movq	%rax, 18752(%rsp)
	movq	1304(%rdx), %rax
	movq	%rax, 18760(%rsp)
	movq	1312(%rdx), %rax
	movq	%rax, 18768(%rsp)
	movq	1320(%rdx), %rax
	movq	%rax, 18776(%rsp)
	movq	1328(%rdx), %rax
	movq	%rax, 18784(%rsp)
	movq	1336(%rdx), %rax
	movq	%rax, 18792(%rsp)
	movq	1344(%rdx), %rax
	movq	%rax, 18800(%rsp)
	movq	1352(%rdx), %rax
	movq	%rax, 18808(%rsp)
	movq	1360(%rdx), %rax
	movq	%rax, 18816(%rsp)
	movq	1368(%rdx), %rax
	movq	%rax, 18824(%rsp)
	movq	1376(%rdx), %rax
	movq	%rax, 18832(%rsp)
	movq	1384(%rdx), %rax
	movq	%rax, 18840(%rsp)
	movq	1392(%rdx), %rax
	movq	%rax, 18848(%rsp)
	movq	1400(%rdx), %rax
	movq	%rax, 18856(%rsp)
	movq	1408(%rdx), %rax
	movq	%rax, 18864(%rsp)
	movq	1416(%rdx), %rax
	movq	%rax, 18872(%rsp)
	movq	1424(%rdx), %rax
	movq	%rax, 18880(%rsp)
	movq	1432(%rdx), %rax
	movq	%rax, 18888(%rsp)
	movq	1440(%rdx), %rax
	movq	%rax, 18896(%rsp)
	movq	1448(%rdx), %rax
	movq	%rax, 18904(%rsp)
	movq	1456(%rdx), %rax
	movq	%rax, 18912(%rsp)
	movq	1464(%rdx), %rax
	movq	%rax, 18920(%rsp)
	movq	1472(%rdx), %rax
	movq	%rax, 18928(%rsp)
	movq	1480(%rdx), %rax
	movq	%rax, 18936(%rsp)
	movq	1488(%rdx), %rax
	movq	%rax, 18944(%rsp)
	movq	1496(%rdx), %rax
	movq	%rax, 18952(%rsp)
	movq	1504(%rdx), %rax
	movq	%rax, 18960(%rsp)
	movq	1512(%rdx), %rax
	movq	%rax, 18968(%rsp)
	movq	1520(%rdx), %rax
	movq	%rax, 18976(%rsp)
	movq	1528(%rdx), %rax
	movq	%rax, 18984(%rsp)
	movq	1536(%rdx), %rax
	movq	%rax, 18992(%rsp)
	movq	1544(%rdx), %rax
	movq	%rax, 19000(%rsp)
	movq	1552(%rdx), %rax
	movq	%rax, 19008(%rsp)
	movq	1560(%rdx), %rax
	movq	%rax, 19016(%rsp)
	movq	1568(%rdx), %rax
	movq	%rax, 19024(%rsp)
	movq	1576(%rdx), %rax
	movq	%rax, 19032(%rsp)
	movq	1584(%rdx), %rax
	movq	%rax, 19040(%rsp)
	movq	1592(%rdx), %rax
	movq	%rax, 19048(%rsp)
	movq	1600(%rdx), %rax
	movq	%rax, 19056(%rsp)
	movq	1608(%rdx), %rax
	movq	%rax, 19064(%rsp)
	movq	1616(%rdx), %rax
	movq	%rax, 19072(%rsp)
	movq	1624(%rdx), %rax
	movq	%rax, 19080(%rsp)
	movq	1632(%rdx), %rax
	movq	%rax, 19088(%rsp)
	movq	1640(%rdx), %rax
	movq	%rax, 19096(%rsp)
	movq	1648(%rdx), %rax
	movq	%rax, 19104(%rsp)
	movq	1656(%rdx), %rax
	movq	%rax, 19112(%rsp)
	movq	1664(%rdx), %rax
	movq	%rax, 19120(%rsp)
	movq	1672(%rdx), %rax
	movq	%rax, 19128(%rsp)
	movq	1680(%rdx), %rax
	movq	%rax, 19136(%rsp)
	movq	1688(%rdx), %rax
	movq	%rax, 19144(%rsp)
	movq	1696(%rdx), %rax
	movq	%rax, 19152(%rsp)
	movq	1704(%rdx), %rax
	movq	%rax, 19160(%rsp)
	movq	1712(%rdx), %rax
	movq	%rax, 19168(%rsp)
	movq	1720(%rdx), %rax
	movq	%rax, 19176(%rsp)
	movq	1728(%rdx), %rax
	movq	%rax, 19184(%rsp)
	movq	1736(%rdx), %rax
	movq	%rax, 19192(%rsp)
	movq	1744(%rdx), %rax
	movq	%rax, 19200(%rsp)
	movq	1752(%rdx), %rax
	movq	%rax, 19208(%rsp)
	movq	1760(%rdx), %rax
	movq	%rax, 19216(%rsp)
	movq	1768(%rdx), %rax
	movq	%rax, 19224(%rsp)
	movq	1776(%rdx), %rax
	movq	%rax, 19232(%rsp)
	movq	1784(%rdx), %rax
	movq	%rax, 19240(%rsp)
	movq	1792(%rdx), %rax
	movq	%rax, 19248(%rsp)
	movq	1800(%rdx), %rax
	movq	%rax, 19256(%rsp)
	movq	1808(%rdx), %rax
	movq	%rax, 19264(%rsp)
	movq	1816(%rdx), %rax
	movq	%rax, 19272(%rsp)
	movq	1824(%rdx), %rax
	movq	%rax, 19280(%rsp)
	movq	1832(%rdx), %rax
	movq	%rax, 19288(%rsp)
	movq	1840(%rdx), %rax
	movq	%rax, 19296(%rsp)
	movq	1848(%rdx), %rax
	movq	%rax, 19304(%rsp)
	movq	1856(%rdx), %rax
	movq	%rax, 19312(%rsp)
	movq	1864(%rdx), %rax
	movq	%rax, 19320(%rsp)
	movq	1872(%rdx), %rax
	movq	%rax, 19328(%rsp)
	movq	1880(%rdx), %rax
	movq	%rax, 19336(%rsp)
	movq	1888(%rdx), %rax
	movq	%rax, 19344(%rsp)
	movq	1896(%rdx), %rax
	movq	%rax, 19352(%rsp)
	movq	1904(%rdx), %rax
	movq	%rax, 19360(%rsp)
	movq	1912(%rdx), %rax
	movq	%rax, 19368(%rsp)
	movq	1920(%rdx), %rax
	movq	%rax, 19376(%rsp)
	movq	1928(%rdx), %rax
	movq	%rax, 19384(%rsp)
	movq	1936(%rdx), %rax
	movq	%rax, 19392(%rsp)
	movq	1944(%rdx), %rax
	movq	%rax, 19400(%rsp)
	movq	1952(%rdx), %rax
	movq	%rax, 19408(%rsp)
	movq	1960(%rdx), %rax
	movq	%rax, 19416(%rsp)
	movq	1968(%rdx), %rax
	movq	%rax, 19424(%rsp)
	movq	1976(%rdx), %rax
	movq	%rax, 19432(%rsp)
	movq	1984(%rdx), %rax
	movq	%rax, 19440(%rsp)
	movq	1992(%rdx), %rax
	movq	%rax, 19448(%rsp)
	movq	2000(%rdx), %rax
	movq	%rax, 19456(%rsp)
	movq	2008(%rdx), %rax
	movq	%rax, 19464(%rsp)
	movq	2016(%rdx), %rax
	movq	%rax, 19472(%rsp)
	movq	2024(%rdx), %rax
	movq	%rax, 19480(%rsp)
	movq	2032(%rdx), %rax
	movq	%rax, 19488(%rsp)
	movq	2040(%rdx), %rax
	movq	%rax, 19496(%rsp)
	movq	2048(%rdx), %rax
	movq	%rax, 19504(%rsp)
	movq	2056(%rdx), %rax
	movq	%rax, 19512(%rsp)
	movq	2064(%rdx), %rax
	movq	%rax, 19520(%rsp)
	movq	2072(%rdx), %rax
	movq	%rax, 19528(%rsp)
	movq	2080(%rdx), %rax
	movq	%rax, 19536(%rsp)
	movq	2088(%rdx), %rax
	movq	%rax, 19544(%rsp)
	movq	2096(%rdx), %rax
	movq	%rax, 19552(%rsp)
	movq	2104(%rdx), %rax
	movq	%rax, 19560(%rsp)
	movq	2112(%rdx), %rax
	movq	%rax, 19568(%rsp)
	movq	2120(%rdx), %rax
	movq	%rax, 19576(%rsp)
	movq	2128(%rdx), %rax
	movq	%rax, 19584(%rsp)
	movq	2136(%rdx), %rax
	movq	%rax, 19592(%rsp)
	movq	2144(%rdx), %rax
	movq	%rax, 19600(%rsp)
	movq	2152(%rdx), %rax
	movq	%rax, 19608(%rsp)
	movq	2160(%rdx), %rax
	movq	%rax, 19616(%rsp)
	movq	2168(%rdx), %rax
	movq	%rax, 19624(%rsp)
	movq	2176(%rdx), %rax
	movq	%rax, 19632(%rsp)
	movq	2184(%rdx), %rax
	movq	%rax, 19640(%rsp)
	movq	2192(%rdx), %rax
	movq	%rax, 19648(%rsp)
	movq	2200(%rdx), %rax
	movq	%rax, 19656(%rsp)
	movq	2208(%rdx), %rax
	movq	%rax, 19664(%rsp)
	movq	2216(%rdx), %rax
	movq	%rax, 19672(%rsp)
	movq	2224(%rdx), %rax
	movq	%rax, 19680(%rsp)
	movq	2232(%rdx), %rax
	movq	%rax, 19688(%rsp)
	movq	2240(%rdx), %rax
	movq	%rax, 19696(%rsp)
	movq	2248(%rdx), %rax
	movq	%rax, 19704(%rsp)
	movq	2256(%rdx), %rax
	movq	%rax, 19712(%rsp)
	movq	2264(%rdx), %rax
	movq	%rax, 19720(%rsp)
	movq	2272(%rdx), %rax
	movq	%rax, 19728(%rsp)
	movq	2280(%rdx), %rax
	movq	%rax, 19736(%rsp)
	movq	2288(%rdx), %rax
	movq	%rax, 19744(%rsp)
	movq	2296(%rdx), %rax
	movq	%rax, 19752(%rsp)
	movq	2304(%rdx), %rax
	movq	%rax, 19760(%rsp)
	movq	2312(%rdx), %rax
	movq	%rax, 19768(%rsp)
	movq	2320(%rdx), %rax
	movq	%rax, 19776(%rsp)
	movq	2328(%rdx), %rax
	movq	%rax, 19784(%rsp)
	movq	2336(%rdx), %rax
	movq	%rax, 19792(%rsp)
	movq	2344(%rdx), %rax
	movq	%rax, 19800(%rsp)
	movq	2352(%rdx), %rax
	movq	%rax, 19808(%rsp)
	movq	2360(%rdx), %rax
	movq	%rax, 19816(%rsp)
	movq	2368(%rdx), %rax
	movq	%rax, 19824(%rsp)
	movq	2376(%rdx), %rax
	movq	%rax, 19832(%rsp)
	movq	2384(%rdx), %rax
	movq	%rax, 19840(%rsp)
	movq	2392(%rdx), %rax
	movq	%rax, 19848(%rsp)
	leaq	2240(%rsp), %rax
	movq	%rsp, %rdx
	leaq	17456(%rsp), %rcx
	movq	%rdx, 17440(%rsp)
	movq	%rax, 17448(%rsp)
	movq	(%rcx), %rdx
	movq	%rdx, 19856(%rsp)
	movq	8(%rcx), %rdx
	movq	%rdx, 19864(%rsp)
	movq	16(%rcx), %rdx
	movq	%rdx, 19872(%rsp)
	movq	24(%rcx), %rdx
	movq	%rdx, 19880(%rsp)
	movq	32(%rcx), %rdx
	movq	%rdx, 19888(%rsp)
	movq	40(%rcx), %rdx
	movq	%rdx, 19896(%rsp)
	movq	48(%rcx), %rdx
	movq	%rdx, 19904(%rsp)
	movq	56(%rcx), %rdx
	movq	%rdx, 19912(%rsp)
	movq	64(%rcx), %rdx
	movq	%rdx, 19920(%rsp)
	movq	72(%rcx), %rdx
	movq	%rdx, 19928(%rsp)
	movq	80(%rcx), %rdx
	movq	%rdx, 19936(%rsp)
	movq	88(%rcx), %rdx
	movq	%rdx, 19944(%rsp)
	movq	96(%rcx), %rdx
	movq	%rdx, 19952(%rsp)
	movq	104(%rcx), %rdx
	movq	%rdx, 19960(%rsp)
	movq	112(%rcx), %rdx
	movq	%rdx, 19968(%rsp)
	movq	120(%rcx), %rdx
	movq	%rdx, 19976(%rsp)
	movq	128(%rcx), %rdx
	movq	%rdx, 19984(%rsp)
	movq	136(%rcx), %rdx
	movq	%rdx, 19992(%rsp)
	movq	144(%rcx), %rdx
	movq	%rdx, 20000(%rsp)
	movq	152(%rcx), %rdx
	movq	%rdx, 20008(%rsp)
	movq	160(%rcx), %rdx
	movq	%rdx, 20016(%rsp)
	movq	168(%rcx), %rdx
	movq	%rdx, 20024(%rsp)
	movq	176(%rcx), %rdx
	movq	%rdx, 20032(%rsp)
	movq	184(%rcx), %rdx
	movq	%rdx, 20040(%rsp)
	movq	192(%rcx), %rdx
	movq	%rdx, 20048(%rsp)
	movq	200(%rcx), %rdx
	movq	%rdx, 20056(%rsp)
	movq	208(%rcx), %rdx
	movq	%rdx, 20064(%rsp)
	movq	216(%rcx), %rdx
	movq	%rdx, 20072(%rsp)
	movq	224(%rcx), %rdx
	movq	%rdx, 20080(%rsp)
	movq	232(%rcx), %rdx
	movq	%rdx, 20088(%rsp)
	movq	240(%rcx), %rdx
	movq	%rdx, 20096(%rsp)
	movq	248(%rcx), %rdx
	movq	%rdx, 20104(%rsp)
	movq	256(%rcx), %rdx
	movq	%rdx, 20112(%rsp)
	movq	264(%rcx), %rdx
	movq	%rdx, 20120(%rsp)
	movq	272(%rcx), %rdx
	movq	%rdx, 20128(%rsp)
	movq	280(%rcx), %rdx
	movq	%rdx, 20136(%rsp)
	movq	288(%rcx), %rdx
	movq	%rdx, 20144(%rsp)
	movq	296(%rcx), %rdx
	movq	%rdx, 20152(%rsp)
	movq	304(%rcx), %rdx
	movq	%rdx, 20160(%rsp)
	movq	312(%rcx), %rdx
	movq	%rdx, 20168(%rsp)
	movq	320(%rcx), %rdx
	movq	%rdx, 20176(%rsp)
	movq	328(%rcx), %rdx
	movq	%rdx, 20184(%rsp)
	movq	336(%rcx), %rdx
	movq	%rdx, 20192(%rsp)
	movq	344(%rcx), %rdx
	movq	%rdx, 20200(%rsp)
	movq	352(%rcx), %rdx
	movq	%rdx, 20208(%rsp)
	movq	360(%rcx), %rdx
	movq	%rdx, 20216(%rsp)
	movq	368(%rcx), %rdx
	movq	%rdx, 20224(%rsp)
	movq	376(%rcx), %rdx
	movq	%rdx, 20232(%rsp)
	movq	384(%rcx), %rdx
	movq	%rdx, 20240(%rsp)
	movq	392(%rcx), %rdx
	movq	%rdx, 20248(%rsp)
	movq	400(%rcx), %rdx
	movq	%rdx, 20256(%rsp)
	movq	408(%rcx), %rdx
	movq	%rdx, 20264(%rsp)
	movq	416(%rcx), %rdx
	movq	%rdx, 20272(%rsp)
	movq	424(%rcx), %rdx
	movq	%rdx, 20280(%rsp)
	movq	432(%rcx), %rdx
	movq	%rdx, 20288(%rsp)
	movq	440(%rcx), %rdx
	movq	%rdx, 20296(%rsp)
	movq	448(%rcx), %rdx
	movq	%rdx, 20304(%rsp)
	movq	456(%rcx), %rdx
	movq	%rdx, 20312(%rsp)
	movq	464(%rcx), %rdx
	movq	%rdx, 20320(%rsp)
	movq	472(%rcx), %rdx
	movq	%rdx, 20328(%rsp)
	movq	480(%rcx), %rdx
	movq	%rdx, 20336(%rsp)
	movq	488(%rcx), %rdx
	movq	%rdx, 20344(%rsp)
	movq	496(%rcx), %rdx
	movq	%rdx, 20352(%rsp)
	movq	504(%rcx), %rdx
	movq	%rdx, 20360(%rsp)
	movq	512(%rcx), %rdx
	movq	%rdx, 20368(%rsp)
	movq	520(%rcx), %rdx
	movq	%rdx, 20376(%rsp)
	movq	528(%rcx), %rdx
	movq	%rdx, 20384(%rsp)
	movq	536(%rcx), %rdx
	movq	%rdx, 20392(%rsp)
	movq	544(%rcx), %rdx
	movq	%rdx, 20400(%rsp)
	movq	552(%rcx), %rdx
	movq	%rdx, 20408(%rsp)
	movq	560(%rcx), %rdx
	movq	%rdx, 20416(%rsp)
	movq	568(%rcx), %rdx
	movq	%rdx, 20424(%rsp)
	movq	576(%rcx), %rdx
	movq	%rdx, 20432(%rsp)
	movq	584(%rcx), %rdx
	movq	%rdx, 20440(%rsp)
	movq	592(%rcx), %rdx
	movq	%rdx, 20448(%rsp)
	movq	600(%rcx), %rdx
	movq	%rdx, 20456(%rsp)
	movq	608(%rcx), %rdx
	movq	%rdx, 20464(%rsp)
	movq	616(%rcx), %rdx
	movq	%rdx, 20472(%rsp)
	movq	624(%rcx), %rdx
	movq	%rdx, 20480(%rsp)
	movq	632(%rcx), %rdx
	movq	%rdx, 20488(%rsp)
	movq	640(%rcx), %rdx
	movq	%rdx, 20496(%rsp)
	movq	648(%rcx), %rdx
	movq	%rdx, 20504(%rsp)
	movq	656(%rcx), %rdx
	movq	%rdx, 20512(%rsp)
	movq	664(%rcx), %rdx
	movq	%rdx, 20520(%rsp)
	movq	672(%rcx), %rdx
	movq	%rdx, 20528(%rsp)
	movq	680(%rcx), %rdx
	movq	%rdx, 20536(%rsp)
	movq	688(%rcx), %rdx
	movq	%rdx, 20544(%rsp)
	movq	696(%rcx), %rdx
	movq	%rdx, 20552(%rsp)
	movq	704(%rcx), %rdx
	movq	%rdx, 20560(%rsp)
	movq	712(%rcx), %rdx
	movq	%rdx, 20568(%rsp)
	movq	720(%rcx), %rdx
	movq	%rdx, 20576(%rsp)
	movq	728(%rcx), %rdx
	movq	%rdx, 20584(%rsp)
	movq	736(%rcx), %rdx
	movq	%rdx, 20592(%rsp)
	movq	744(%rcx), %rdx
	movq	%rdx, 20600(%rsp)
	movq	752(%rcx), %rdx
	movq	%rdx, 20608(%rsp)
	movq	760(%rcx), %rdx
	movq	%rdx, 20616(%rsp)
	movq	768(%rcx), %rdx
	movq	%rdx, 20624(%rsp)
	movq	776(%rcx), %rdx
	movq	%rdx, 20632(%rsp)
	movq	784(%rcx), %rdx
	movq	%rdx, 20640(%rsp)
	movq	792(%rcx), %rdx
	movq	%rdx, 20648(%rsp)
	movq	800(%rcx), %rdx
	movq	%rdx, 20656(%rsp)
	movq	808(%rcx), %rdx
	movq	%rdx, 20664(%rsp)
	movq	816(%rcx), %rdx
	movq	%rdx, 20672(%rsp)
	movq	824(%rcx), %rdx
	movq	%rdx, 20680(%rsp)
	movq	832(%rcx), %rdx
	movq	%rdx, 20688(%rsp)
	movq	840(%rcx), %rdx
	movq	%rdx, 20696(%rsp)
	movq	848(%rcx), %rdx
	movq	%rdx, 20704(%rsp)
	movq	856(%rcx), %rdx
	movq	%rdx, 20712(%rsp)
	movq	864(%rcx), %rdx
	movq	%rdx, 20720(%rsp)
	movq	872(%rcx), %rdx
	movq	%rdx, 20728(%rsp)
	movq	880(%rcx), %rdx
	movq	%rdx, 20736(%rsp)
	movq	888(%rcx), %rdx
	movq	%rdx, 20744(%rsp)
	movq	896(%rcx), %rdx
	movq	%rdx, 20752(%rsp)
	movq	904(%rcx), %rdx
	movq	%rdx, 20760(%rsp)
	movq	912(%rcx), %rdx
	movq	%rdx, 20768(%rsp)
	movq	920(%rcx), %rdx
	movq	%rdx, 20776(%rsp)
	movq	928(%rcx), %rdx
	movq	%rdx, 20784(%rsp)
	movq	936(%rcx), %rdx
	movq	%rdx, 20792(%rsp)
	movq	944(%rcx), %rdx
	movq	%rdx, 20800(%rsp)
	movq	952(%rcx), %rdx
	movq	%rdx, 20808(%rsp)
	movq	960(%rcx), %rdx
	movq	%rdx, 20816(%rsp)
	movq	968(%rcx), %rdx
	movq	%rdx, 20824(%rsp)
	movq	976(%rcx), %rdx
	movq	%rdx, 20832(%rsp)
	movq	984(%rcx), %rdx
	movq	%rdx, 20840(%rsp)
	movq	992(%rcx), %rdx
	movq	%rdx, 20848(%rsp)
	movq	1000(%rcx), %rdx
	movq	%rdx, 20856(%rsp)
	movq	1008(%rcx), %rdx
	movq	%rdx, 20864(%rsp)
	movq	1016(%rcx), %rdx
	movq	%rdx, 20872(%rsp)
	movq	1024(%rcx), %rdx
	movq	%rdx, 20880(%rsp)
	movq	1032(%rcx), %rdx
	movq	%rdx, 20888(%rsp)
	movq	1040(%rcx), %rdx
	movq	%rdx, 20896(%rsp)
	movq	1048(%rcx), %rdx
	movq	%rdx, 20904(%rsp)
	movq	1056(%rcx), %rdx
	movq	%rdx, 20912(%rsp)
	movq	1064(%rcx), %rdx
	movq	%rdx, 20920(%rsp)
	movq	1072(%rcx), %rdx
	movq	%rdx, 20928(%rsp)
	movq	1080(%rcx), %rdx
	movq	%rdx, 20936(%rsp)
	movq	1088(%rcx), %rdx
	movq	%rdx, 20944(%rsp)
	movq	1096(%rcx), %rdx
	movq	%rdx, 20952(%rsp)
	movq	1104(%rcx), %rdx
	movq	%rdx, 20960(%rsp)
	movq	1112(%rcx), %rdx
	movq	%rdx, 20968(%rsp)
	movq	1120(%rcx), %rdx
	movq	%rdx, 20976(%rsp)
	movq	1128(%rcx), %rdx
	movq	%rdx, 20984(%rsp)
	movq	1136(%rcx), %rdx
	movq	%rdx, 20992(%rsp)
	movq	1144(%rcx), %rdx
	movq	%rdx, 21000(%rsp)
	movq	1152(%rcx), %rdx
	movq	%rdx, 21008(%rsp)
	movq	1160(%rcx), %rdx
	movq	%rdx, 21016(%rsp)
	movq	1168(%rcx), %rdx
	movq	%rdx, 21024(%rsp)
	movq	1176(%rcx), %rdx
	movq	%rdx, 21032(%rsp)
	movq	1184(%rcx), %rdx
	movq	%rdx, 21040(%rsp)
	movq	1192(%rcx), %rdx
	movq	%rdx, 21048(%rsp)
	movq	1200(%rcx), %rdx
	movq	%rdx, 21056(%rsp)
	movq	1208(%rcx), %rdx
	movq	%rdx, 21064(%rsp)
	movq	1216(%rcx), %rdx
	movq	%rdx, 21072(%rsp)
	movq	1224(%rcx), %rdx
	movq	%rdx, 21080(%rsp)
	movq	1232(%rcx), %rdx
	movq	%rdx, 21088(%rsp)
	movq	1240(%rcx), %rdx
	movq	%rdx, 21096(%rsp)
	movq	1248(%rcx), %rdx
	movq	%rdx, 21104(%rsp)
	movq	1256(%rcx), %rdx
	movq	%rdx, 21112(%rsp)
	movq	1264(%rcx), %rdx
	movq	%rdx, 21120(%rsp)
	movq	1272(%rcx), %rdx
	movq	%rdx, 21128(%rsp)
	movq	1280(%rcx), %rdx
	movq	%rdx, 21136(%rsp)
	movq	1288(%rcx), %rdx
	movq	%rdx, 21144(%rsp)
	movq	1296(%rcx), %rdx
	movq	%rdx, 21152(%rsp)
	movq	1304(%rcx), %rdx
	movq	%rdx, 21160(%rsp)
	movq	1312(%rcx), %rdx
	movq	%rdx, 21168(%rsp)
	movq	1320(%rcx), %rdx
	movq	%rdx, 21176(%rsp)
	movq	1328(%rcx), %rdx
	movq	%rdx, 21184(%rsp)
	movq	1336(%rcx), %rdx
	movq	%rdx, 21192(%rsp)
	movq	1344(%rcx), %rdx
	movq	%rdx, 21200(%rsp)
	movq	1352(%rcx), %rdx
	movq	%rdx, 21208(%rsp)
	movq	1360(%rcx), %rdx
	movq	%rdx, 21216(%rsp)
	movq	1368(%rcx), %rdx
	movq	%rdx, 21224(%rsp)
	movq	1376(%rcx), %rdx
	movq	%rdx, 21232(%rsp)
	movq	1384(%rcx), %rdx
	movq	%rdx, 21240(%rsp)
	movq	1392(%rcx), %rdx
	movq	%rdx, 21248(%rsp)
	movq	1400(%rcx), %rdx
	movq	%rdx, 21256(%rsp)
	movq	1408(%rcx), %rdx
	movq	%rdx, 21264(%rsp)
	movq	1416(%rcx), %rdx
	movq	%rdx, 21272(%rsp)
	movq	1424(%rcx), %rdx
	movq	%rdx, 21280(%rsp)
	movq	1432(%rcx), %rdx
	movq	%rdx, 21288(%rsp)
	movq	1440(%rcx), %rdx
	movq	%rdx, 21296(%rsp)
	movq	1448(%rcx), %rdx
	movq	%rdx, 21304(%rsp)
	movq	1456(%rcx), %rdx
	movq	%rdx, 21312(%rsp)
	movq	1464(%rcx), %rdx
	movq	%rdx, 21320(%rsp)
	movq	1472(%rcx), %rdx
	movq	%rdx, 21328(%rsp)
	movq	1480(%rcx), %rdx
	movq	%rdx, 21336(%rsp)
	movq	1488(%rcx), %rdx
	movq	%rdx, 21344(%rsp)
	movq	1496(%rcx), %rdx
	movq	%rdx, 21352(%rsp)
	movq	1504(%rcx), %rdx
	movq	%rdx, 21360(%rsp)
	movq	1512(%rcx), %rdx
	movq	%rdx, 21368(%rsp)
	movq	1520(%rcx), %rdx
	movq	%rdx, 21376(%rsp)
	movq	1528(%rcx), %rdx
	movq	%rdx, 21384(%rsp)
	movq	1536(%rcx), %rdx
	movq	%rdx, 21392(%rsp)
	movq	1544(%rcx), %rdx
	movq	%rdx, 21400(%rsp)
	movq	1552(%rcx), %rdx
	movq	%rdx, 21408(%rsp)
	movq	1560(%rcx), %rdx
	movq	%rdx, 21416(%rsp)
	movq	1568(%rcx), %rdx
	movq	%rdx, 21424(%rsp)
	movq	1576(%rcx), %rdx
	movq	%rdx, 21432(%rsp)
	movq	1584(%rcx), %rdx
	movq	%rdx, 21440(%rsp)
	movq	1592(%rcx), %rdx
	movq	%rdx, 21448(%rsp)
	movq	1600(%rcx), %rdx
	movq	%rdx, 21456(%rsp)
	movq	1608(%rcx), %rdx
	movq	%rdx, 21464(%rsp)
	movq	1616(%rcx), %rdx
	movq	%rdx, 21472(%rsp)
	movq	1624(%rcx), %rdx
	movq	%rdx, 21480(%rsp)
	movq	1632(%rcx), %rdx
	movq	%rdx, 21488(%rsp)
	movq	1640(%rcx), %rdx
	movq	%rdx, 21496(%rsp)
	movq	1648(%rcx), %rdx
	movq	%rdx, 21504(%rsp)
	movq	1656(%rcx), %rdx
	movq	%rdx, 21512(%rsp)
	movq	1664(%rcx), %rdx
	movq	%rdx, 21520(%rsp)
	movq	1672(%rcx), %rdx
	movq	%rdx, 21528(%rsp)
	movq	1680(%rcx), %rdx
	movq	%rdx, 21536(%rsp)
	movq	1688(%rcx), %rdx
	movq	%rdx, 21544(%rsp)
	movq	1696(%rcx), %rdx
	movq	%rdx, 21552(%rsp)
	movq	1704(%rcx), %rdx
	movq	%rdx, 21560(%rsp)
	movq	1712(%rcx), %rdx
	movq	%rdx, 21568(%rsp)
	movq	1720(%rcx), %rdx
	movq	%rdx, 21576(%rsp)
	movq	1728(%rcx), %rdx
	movq	%rdx, 21584(%rsp)
	movq	1736(%rcx), %rdx
	movq	%rdx, 21592(%rsp)
	movq	1744(%rcx), %rdx
	movq	%rdx, 21600(%rsp)
	movq	1752(%rcx), %rdx
	movq	%rdx, 21608(%rsp)
	movq	1760(%rcx), %rdx
	movq	%rdx, 21616(%rsp)
	movq	1768(%rcx), %rdx
	movq	%rdx, 21624(%rsp)
	movq	1776(%rcx), %rdx
	movq	%rdx, 21632(%rsp)
	movq	1784(%rcx), %rdx
	movq	%rdx, 21640(%rsp)
	movq	1792(%rcx), %rdx
	movq	%rdx, 21648(%rsp)
	movq	1800(%rcx), %rdx
	movq	%rdx, 21656(%rsp)
	movq	1808(%rcx), %rdx
	movq	%rdx, 21664(%rsp)
	movq	1816(%rcx), %rdx
	movq	%rdx, 21672(%rsp)
	movq	1824(%rcx), %rdx
	movq	%rdx, 21680(%rsp)
	movq	1832(%rcx), %rdx
	movq	%rdx, 21688(%rsp)
	movq	1840(%rcx), %rdx
	movq	%rdx, 21696(%rsp)
	movq	1848(%rcx), %rdx
	movq	%rdx, 21704(%rsp)
	movq	1856(%rcx), %rdx
	movq	%rdx, 21712(%rsp)
	movq	1864(%rcx), %rdx
	movq	%rdx, 21720(%rsp)
	movq	1872(%rcx), %rdx
	movq	%rdx, 21728(%rsp)
	movq	1880(%rcx), %rdx
	movq	%rdx, 21736(%rsp)
	movq	1888(%rcx), %rdx
	movq	%rdx, 21744(%rsp)
	movq	1896(%rcx), %rdx
	movq	%rdx, 21752(%rsp)
	movq	1904(%rcx), %rdx
	movq	%rdx, 21760(%rsp)
	movq	1912(%rcx), %rdx
	movq	%rdx, 21768(%rsp)
	movq	1920(%rcx), %rdx
	movq	%rdx, 21776(%rsp)
	movq	1928(%rcx), %rdx
	movq	%rdx, 21784(%rsp)
	movq	1936(%rcx), %rdx
	movq	%rdx, 21792(%rsp)
	movq	1944(%rcx), %rdx
	movq	%rdx, 21800(%rsp)
	movq	1952(%rcx), %rdx
	movq	%rdx, 21808(%rsp)
	movq	1960(%rcx), %rdx
	movq	%rdx, 21816(%rsp)
	movq	1968(%rcx), %rdx
	movq	%rdx, 21824(%rsp)
	movq	1976(%rcx), %rdx
	movq	%rdx, 21832(%rsp)
	movq	1984(%rcx), %rdx
	movq	%rdx, 21840(%rsp)
	movq	1992(%rcx), %rdx
	movq	%rdx, 21848(%rsp)
	movq	2000(%rcx), %rdx
	movq	%rdx, 21856(%rsp)
	movq	2008(%rcx), %rdx
	movq	%rdx, 21864(%rsp)
	movq	2016(%rcx), %rdx
	movq	%rdx, 21872(%rsp)
	movq	2024(%rcx), %rdx
	movq	%rdx, 21880(%rsp)
	movq	2032(%rcx), %rdx
	movq	%rdx, 21888(%rsp)
	movq	2040(%rcx), %rdx
	movq	%rdx, 21896(%rsp)
	movq	2048(%rcx), %rdx
	movq	%rdx, 21904(%rsp)
	movq	2056(%rcx), %rdx
	movq	%rdx, 21912(%rsp)
	movq	2064(%rcx), %rdx
	movq	%rdx, 21920(%rsp)
	movq	2072(%rcx), %rdx
	movq	%rdx, 21928(%rsp)
	movq	2080(%rcx), %rdx
	movq	%rdx, 21936(%rsp)
	movq	2088(%rcx), %rdx
	movq	%rdx, 21944(%rsp)
	movq	2096(%rcx), %rdx
	movq	%rdx, 21952(%rsp)
	movq	2104(%rcx), %rdx
	movq	%rdx, 21960(%rsp)
	movq	2112(%rcx), %rdx
	movq	%rdx, 21968(%rsp)
	movq	2120(%rcx), %rdx
	movq	%rdx, 21976(%rsp)
	movq	2128(%rcx), %rdx
	movq	%rdx, 21984(%rsp)
	movq	2136(%rcx), %rdx
	movq	%rdx, 21992(%rsp)
	movq	2144(%rcx), %rdx
	movq	%rdx, 22000(%rsp)
	movq	2152(%rcx), %rdx
	movq	%rdx, 22008(%rsp)
	movq	2160(%rcx), %rdx
	movq	%rdx, 22016(%rsp)
	movq	2168(%rcx), %rdx
	movq	%rdx, 22024(%rsp)
	movq	2176(%rcx), %rdx
	movq	%rdx, 22032(%rsp)
	movq	2184(%rcx), %rdx
	movq	%rdx, 22040(%rsp)
	movq	2192(%rcx), %rdx
	movq	%rdx, 22048(%rsp)
	movq	2200(%rcx), %rdx
	movq	%rdx, 22056(%rsp)
	movq	2208(%rcx), %rdx
	movq	%rdx, 22064(%rsp)
	movq	2216(%rcx), %rdx
	movq	%rdx, 22072(%rsp)
	movq	2224(%rcx), %rdx
	movq	%rdx, 22080(%rsp)
	movq	2232(%rcx), %rdx
	movq	%rdx, 22088(%rsp)
	movq	2240(%rcx), %rdx
	movq	%rdx, 22096(%rsp)
	movq	2248(%rcx), %rdx
	movq	%rdx, 22104(%rsp)
	movq	2256(%rcx), %rdx
	movq	%rdx, 22112(%rsp)
	movq	2264(%rcx), %rdx
	movq	%rdx, 22120(%rsp)
	movq	2272(%rcx), %rdx
	movq	%rdx, 22128(%rsp)
	movq	2280(%rcx), %rdx
	movq	%rdx, 22136(%rsp)
	movq	2288(%rcx), %rdx
	movq	%rdx, 22144(%rsp)
	movq	2296(%rcx), %rdx
	movq	%rdx, 22152(%rsp)
	movq	2304(%rcx), %rdx
	movq	%rdx, 22160(%rsp)
	movq	2312(%rcx), %rdx
	movq	%rdx, 22168(%rsp)
	movq	2320(%rcx), %rdx
	movq	%rdx, 22176(%rsp)
	movq	2328(%rcx), %rdx
	movq	%rdx, 22184(%rsp)
	movq	2336(%rcx), %rdx
	movq	%rdx, 22192(%rsp)
	movq	2344(%rcx), %rdx
	movq	%rdx, 22200(%rsp)
	movq	2352(%rcx), %rdx
	movq	%rdx, 22208(%rsp)
	movq	2360(%rcx), %rdx
	movq	%rdx, 22216(%rsp)
	movq	2368(%rcx), %rdx
	movq	%rdx, 22224(%rsp)
	movq	2376(%rcx), %rdx
	movq	%rdx, 22232(%rsp)
	movq	2384(%rcx), %rdx
	movq	%rdx, 22240(%rsp)
	movq	2392(%rcx), %rcx
	movq	%rcx, 22248(%rsp)
	leaq	64(%rsp), %rcx
	leaq	19856(%rsp), %rdx
	vpbroadcastd	glob_data + 4980(%rip), %ymm0
	vmovdqu	glob_data + 160(%rip), %ymm1
	vpbroadcastq	glob_data + 4752(%rip), %ymm2
	vpbroadcastd	glob_data + 4976(%rip), %ymm3
	vmovdqu	(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 6688(%rsp)
	vmovdqu	20(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 6720(%rsp)
	vmovdqu	40(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 6752(%rsp)
	vmovdqu	60(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 6784(%rsp)
	vmovdqu	80(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 6816(%rsp)
	vmovdqu	100(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 6848(%rsp)
	vmovdqu	120(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 6880(%rsp)
	vmovdqu	140(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 6912(%rsp)
	vmovdqu	160(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 6944(%rsp)
	vmovdqu	180(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 6976(%rsp)
	vmovdqu	200(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7008(%rsp)
	vmovdqu	220(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7040(%rsp)
	vmovdqu	240(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7072(%rsp)
	vmovdqu	260(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7104(%rsp)
	vmovdqu	280(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7136(%rsp)
	vmovdqu	300(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7168(%rsp)
	vmovdqu	320(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7200(%rsp)
	vmovdqu	340(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7232(%rsp)
	vmovdqu	360(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7264(%rsp)
	vmovdqu	380(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7296(%rsp)
	vmovdqu	400(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7328(%rsp)
	vmovdqu	420(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7360(%rsp)
	vmovdqu	440(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7392(%rsp)
	vmovdqu	460(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7424(%rsp)
	vmovdqu	480(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7456(%rsp)
	vmovdqu	500(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7488(%rsp)
	vmovdqu	520(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7520(%rsp)
	vmovdqu	540(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7552(%rsp)
	vmovdqu	560(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7584(%rsp)
	vmovdqu	580(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7616(%rsp)
	vmovdqu	600(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7648(%rsp)
	vmovdqu	620(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7680(%rsp)
	vmovdqu	640(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7712(%rsp)
	vmovdqu	660(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7744(%rsp)
	vmovdqu	680(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7776(%rsp)
	vmovdqu	700(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7808(%rsp)
	vmovdqu	720(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7840(%rsp)
	vmovdqu	740(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7872(%rsp)
	vmovdqu	760(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7904(%rsp)
	vmovdqu	780(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7936(%rsp)
	vmovdqu	800(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 7968(%rsp)
	vmovdqu	820(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 8000(%rsp)
	vmovdqu	840(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 8032(%rsp)
	vmovdqu	860(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 8064(%rsp)
	vmovdqu	880(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 8096(%rsp)
	vmovdqu	900(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 8128(%rsp)
	vmovdqu	920(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpsllvd	%ymm2, %ymm4, %ymm4
	vpsrlw	$1, %ymm4, %ymm4
	vpand	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 8160(%rsp)
	vmovdqu	940(%rax), %ymm4
	vpermq	$148, %ymm4, %ymm4
	vpshufb	%ymm1, %ymm4, %ymm1
	vpsllvd	%ymm2, %ymm1, %ymm1
	vpsrlw	$1, %ymm1, %ymm1
	vpand	%ymm3, %ymm1, %ymm1
	vpmulhrsw	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, 8192(%rsp)
	leaq	192(%rsp), %rsi
	leaq	960(%rax), %rax
	leaq	-24(%rsp), %rsp
	call	L_i_poly_decompress$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$60:
	leaq	24(%rsp), %rsp
	movq	(%rdx), %rax
	movq	%rax, 5536(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 5544(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 5552(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 5560(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 5568(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 5576(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 5584(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 5592(%rsp)
	movq	64(%rdx), %rax
	movq	%rax, 5600(%rsp)
	movq	72(%rdx), %rax
	movq	%rax, 5608(%rsp)
	movq	80(%rdx), %rax
	movq	%rax, 5616(%rsp)
	movq	88(%rdx), %rax
	movq	%rax, 5624(%rsp)
	movq	96(%rdx), %rax
	movq	%rax, 5632(%rsp)
	movq	104(%rdx), %rax
	movq	%rax, 5640(%rsp)
	movq	112(%rdx), %rax
	movq	%rax, 5648(%rsp)
	movq	120(%rdx), %rax
	movq	%rax, 5656(%rsp)
	movq	128(%rdx), %rax
	movq	%rax, 5664(%rsp)
	movq	136(%rdx), %rax
	movq	%rax, 5672(%rsp)
	movq	144(%rdx), %rax
	movq	%rax, 5680(%rsp)
	movq	152(%rdx), %rax
	movq	%rax, 5688(%rsp)
	movq	160(%rdx), %rax
	movq	%rax, 5696(%rsp)
	movq	168(%rdx), %rax
	movq	%rax, 5704(%rsp)
	movq	176(%rdx), %rax
	movq	%rax, 5712(%rsp)
	movq	184(%rdx), %rax
	movq	%rax, 5720(%rsp)
	movq	192(%rdx), %rax
	movq	%rax, 5728(%rsp)
	movq	200(%rdx), %rax
	movq	%rax, 5736(%rsp)
	movq	208(%rdx), %rax
	movq	%rax, 5744(%rsp)
	movq	216(%rdx), %rax
	movq	%rax, 5752(%rsp)
	movq	224(%rdx), %rax
	movq	%rax, 5760(%rsp)
	movq	232(%rdx), %rax
	movq	%rax, 5768(%rsp)
	movq	240(%rdx), %rax
	movq	%rax, 5776(%rsp)
	movq	248(%rdx), %rax
	movq	%rax, 5784(%rsp)
	movq	256(%rdx), %rax
	movq	%rax, 5792(%rsp)
	movq	264(%rdx), %rax
	movq	%rax, 5800(%rsp)
	movq	272(%rdx), %rax
	movq	%rax, 5808(%rsp)
	movq	280(%rdx), %rax
	movq	%rax, 5816(%rsp)
	movq	288(%rdx), %rax
	movq	%rax, 5824(%rsp)
	movq	296(%rdx), %rax
	movq	%rax, 5832(%rsp)
	movq	304(%rdx), %rax
	movq	%rax, 5840(%rsp)
	movq	312(%rdx), %rax
	movq	%rax, 5848(%rsp)
	movq	320(%rdx), %rax
	movq	%rax, 5856(%rsp)
	movq	328(%rdx), %rax
	movq	%rax, 5864(%rsp)
	movq	336(%rdx), %rax
	movq	%rax, 5872(%rsp)
	movq	344(%rdx), %rax
	movq	%rax, 5880(%rsp)
	movq	352(%rdx), %rax
	movq	%rax, 5888(%rsp)
	movq	360(%rdx), %rax
	movq	%rax, 5896(%rsp)
	movq	368(%rdx), %rax
	movq	%rax, 5904(%rsp)
	movq	376(%rdx), %rax
	movq	%rax, 5912(%rsp)
	movq	384(%rdx), %rax
	movq	%rax, 5920(%rsp)
	movq	392(%rdx), %rax
	movq	%rax, 5928(%rsp)
	movq	400(%rdx), %rax
	movq	%rax, 5936(%rsp)
	movq	408(%rdx), %rax
	movq	%rax, 5944(%rsp)
	movq	416(%rdx), %rax
	movq	%rax, 5952(%rsp)
	movq	424(%rdx), %rax
	movq	%rax, 5960(%rsp)
	movq	432(%rdx), %rax
	movq	%rax, 5968(%rsp)
	movq	440(%rdx), %rax
	movq	%rax, 5976(%rsp)
	movq	448(%rdx), %rax
	movq	%rax, 5984(%rsp)
	movq	456(%rdx), %rax
	movq	%rax, 5992(%rsp)
	movq	464(%rdx), %rax
	movq	%rax, 6000(%rsp)
	movq	472(%rdx), %rax
	movq	%rax, 6008(%rsp)
	movq	480(%rdx), %rax
	movq	%rax, 6016(%rsp)
	movq	488(%rdx), %rax
	movq	%rax, 6024(%rsp)
	movq	496(%rdx), %rax
	movq	%rax, 6032(%rsp)
	movq	504(%rdx), %rax
	movq	%rax, 6040(%rsp)
	movq	512(%rdx), %rax
	movq	%rax, 6048(%rsp)
	movq	520(%rdx), %rax
	movq	%rax, 6056(%rsp)
	movq	528(%rdx), %rax
	movq	%rax, 6064(%rsp)
	movq	536(%rdx), %rax
	movq	%rax, 6072(%rsp)
	movq	544(%rdx), %rax
	movq	%rax, 6080(%rsp)
	movq	552(%rdx), %rax
	movq	%rax, 6088(%rsp)
	movq	560(%rdx), %rax
	movq	%rax, 6096(%rsp)
	movq	568(%rdx), %rax
	movq	%rax, 6104(%rsp)
	movq	576(%rdx), %rax
	movq	%rax, 6112(%rsp)
	movq	584(%rdx), %rax
	movq	%rax, 6120(%rsp)
	movq	592(%rdx), %rax
	movq	%rax, 6128(%rsp)
	movq	600(%rdx), %rax
	movq	%rax, 6136(%rsp)
	movq	608(%rdx), %rax
	movq	%rax, 6144(%rsp)
	movq	616(%rdx), %rax
	movq	%rax, 6152(%rsp)
	movq	624(%rdx), %rax
	movq	%rax, 6160(%rsp)
	movq	632(%rdx), %rax
	movq	%rax, 6168(%rsp)
	movq	640(%rdx), %rax
	movq	%rax, 6176(%rsp)
	movq	648(%rdx), %rax
	movq	%rax, 6184(%rsp)
	movq	656(%rdx), %rax
	movq	%rax, 6192(%rsp)
	movq	664(%rdx), %rax
	movq	%rax, 6200(%rsp)
	movq	672(%rdx), %rax
	movq	%rax, 6208(%rsp)
	movq	680(%rdx), %rax
	movq	%rax, 6216(%rsp)
	movq	688(%rdx), %rax
	movq	%rax, 6224(%rsp)
	movq	696(%rdx), %rax
	movq	%rax, 6232(%rsp)
	movq	704(%rdx), %rax
	movq	%rax, 6240(%rsp)
	movq	712(%rdx), %rax
	movq	%rax, 6248(%rsp)
	movq	720(%rdx), %rax
	movq	%rax, 6256(%rsp)
	movq	728(%rdx), %rax
	movq	%rax, 6264(%rsp)
	movq	736(%rdx), %rax
	movq	%rax, 6272(%rsp)
	movq	744(%rdx), %rax
	movq	%rax, 6280(%rsp)
	movq	752(%rdx), %rax
	movq	%rax, 6288(%rsp)
	movq	760(%rdx), %rax
	movq	%rax, 6296(%rsp)
	movq	768(%rdx), %rax
	movq	%rax, 6304(%rsp)
	movq	776(%rdx), %rax
	movq	%rax, 6312(%rsp)
	movq	784(%rdx), %rax
	movq	%rax, 6320(%rsp)
	movq	792(%rdx), %rax
	movq	%rax, 6328(%rsp)
	movq	800(%rdx), %rax
	movq	%rax, 6336(%rsp)
	movq	808(%rdx), %rax
	movq	%rax, 6344(%rsp)
	movq	816(%rdx), %rax
	movq	%rax, 6352(%rsp)
	movq	824(%rdx), %rax
	movq	%rax, 6360(%rsp)
	movq	832(%rdx), %rax
	movq	%rax, 6368(%rsp)
	movq	840(%rdx), %rax
	movq	%rax, 6376(%rsp)
	movq	848(%rdx), %rax
	movq	%rax, 6384(%rsp)
	movq	856(%rdx), %rax
	movq	%rax, 6392(%rsp)
	movq	864(%rdx), %rax
	movq	%rax, 6400(%rsp)
	movq	872(%rdx), %rax
	movq	%rax, 6408(%rsp)
	movq	880(%rdx), %rax
	movq	%rax, 6416(%rsp)
	movq	888(%rdx), %rax
	movq	%rax, 6424(%rsp)
	movq	896(%rdx), %rax
	movq	%rax, 6432(%rsp)
	movq	904(%rdx), %rax
	movq	%rax, 6440(%rsp)
	movq	912(%rdx), %rax
	movq	%rax, 6448(%rsp)
	movq	920(%rdx), %rax
	movq	%rax, 6456(%rsp)
	movq	928(%rdx), %rax
	movq	%rax, 6464(%rsp)
	movq	936(%rdx), %rax
	movq	%rax, 6472(%rsp)
	movq	944(%rdx), %rax
	movq	%rax, 6480(%rsp)
	movq	952(%rdx), %rax
	movq	%rax, 6488(%rsp)
	movq	960(%rdx), %rax
	movq	%rax, 6496(%rsp)
	movq	968(%rdx), %rax
	movq	%rax, 6504(%rsp)
	movq	976(%rdx), %rax
	movq	%rax, 6512(%rsp)
	movq	984(%rdx), %rax
	movq	%rax, 6520(%rsp)
	movq	992(%rdx), %rax
	movq	%rax, 6528(%rsp)
	movq	1000(%rdx), %rax
	movq	%rax, 6536(%rsp)
	movq	1008(%rdx), %rax
	movq	%rax, 6544(%rsp)
	movq	1016(%rdx), %rax
	movq	%rax, 6552(%rsp)
	movq	1024(%rdx), %rax
	movq	%rax, 6560(%rsp)
	movq	1032(%rdx), %rax
	movq	%rax, 6568(%rsp)
	movq	1040(%rdx), %rax
	movq	%rax, 6576(%rsp)
	movq	1048(%rdx), %rax
	movq	%rax, 6584(%rsp)
	movq	1056(%rdx), %rax
	movq	%rax, 6592(%rsp)
	movq	1064(%rdx), %rax
	movq	%rax, 6600(%rsp)
	movq	1072(%rdx), %rax
	movq	%rax, 6608(%rsp)
	movq	1080(%rdx), %rax
	movq	%rax, 6616(%rsp)
	movq	1088(%rdx), %rax
	movq	%rax, 6624(%rsp)
	movq	1096(%rdx), %rax
	movq	%rax, 6632(%rsp)
	movq	1104(%rdx), %rax
	movq	%rax, 6640(%rsp)
	movq	1112(%rdx), %rax
	movq	%rax, 6648(%rsp)
	movq	1120(%rdx), %rax
	movq	%rax, 6656(%rsp)
	movq	1128(%rdx), %rax
	movq	%rax, 6664(%rsp)
	movq	1136(%rdx), %rax
	movq	%rax, 6672(%rsp)
	movq	1144(%rdx), %rax
	movq	%rax, 6680(%rsp)
	leaq	8224(%rsp), %rsi
	leaq	5536(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$59:
	leaq	8736(%rsp), %rsi
	leaq	5920(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$58:
	leaq	9248(%rsp), %rsi
	leaq	6304(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$57:
	leaq	6688(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$56:
	leaq	7200(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$55:
	leaq	7712(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$54:
	leaq	704(%rsp), %rdx
	leaq	8224(%rsp), %rsi
	leaq	6688(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$53:
	leaq	1216(%rsp), %rdx
	leaq	8736(%rsp), %rsi
	leaq	7200(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$52:
	leaq	704(%rsp), %rdx
	leaq	1216(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$51:
	leaq	1216(%rsp), %rdx
	leaq	9248(%rsp), %rsi
	leaq	7712(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$50:
	leaq	704(%rsp), %rdx
	leaq	1216(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$49:
	leaq	704(%rsp), %rdx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$48:
	leaq	1216(%rsp), %rax
	leaq	192(%rsp), %rdx
	leaq	704(%rsp), %rsi
	call	L_poly_sub$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$47:
	leaq	1216(%rsp), %rax
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
	leaq	1216(%rsp), %rdx
	call	L_i_poly_tomsg$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$46:
	movq	22192(%rsp), %rax
	movq	%rax, 96(%rsp)
	movq	22200(%rsp), %rax
	movq	%rax, 104(%rsp)
	movq	22208(%rsp), %rax
	movq	%rax, 112(%rsp)
	movq	22216(%rsp), %rax
	movq	%rax, 120(%rsp)
	leaq	128(%rsp), %rcx
	leaq	64(%rsp), %rdx
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$45:
	leaq	3328(%rsp), %rax
	leaq	64(%rsp), %rdi
	leaq	21008(%rsp), %rcx
	leaq	160(%rsp), %rdx
	movq	%rcx, %rsi
	movq	(%rsi), %r8
	movq	%r8, 5536(%rsp)
	movq	8(%rsi), %r8
	movq	%r8, 5544(%rsp)
	movq	16(%rsi), %r8
	movq	%r8, 5552(%rsp)
	movq	24(%rsi), %r8
	movq	%r8, 5560(%rsp)
	movq	32(%rsi), %r8
	movq	%r8, 5568(%rsp)
	movq	40(%rsi), %r8
	movq	%r8, 5576(%rsp)
	movq	48(%rsi), %r8
	movq	%r8, 5584(%rsp)
	movq	56(%rsi), %r8
	movq	%r8, 5592(%rsp)
	movq	64(%rsi), %r8
	movq	%r8, 5600(%rsp)
	movq	72(%rsi), %r8
	movq	%r8, 5608(%rsp)
	movq	80(%rsi), %r8
	movq	%r8, 5616(%rsp)
	movq	88(%rsi), %r8
	movq	%r8, 5624(%rsp)
	movq	96(%rsi), %r8
	movq	%r8, 5632(%rsp)
	movq	104(%rsi), %r8
	movq	%r8, 5640(%rsp)
	movq	112(%rsi), %r8
	movq	%r8, 5648(%rsp)
	movq	120(%rsi), %r8
	movq	%r8, 5656(%rsp)
	movq	128(%rsi), %r8
	movq	%r8, 5664(%rsp)
	movq	136(%rsi), %r8
	movq	%r8, 5672(%rsp)
	movq	144(%rsi), %r8
	movq	%r8, 5680(%rsp)
	movq	152(%rsi), %r8
	movq	%r8, 5688(%rsp)
	movq	160(%rsi), %r8
	movq	%r8, 5696(%rsp)
	movq	168(%rsi), %r8
	movq	%r8, 5704(%rsp)
	movq	176(%rsi), %r8
	movq	%r8, 5712(%rsp)
	movq	184(%rsi), %r8
	movq	%r8, 5720(%rsp)
	movq	192(%rsi), %r8
	movq	%r8, 5728(%rsp)
	movq	200(%rsi), %r8
	movq	%r8, 5736(%rsp)
	movq	208(%rsi), %r8
	movq	%r8, 5744(%rsp)
	movq	216(%rsi), %r8
	movq	%r8, 5752(%rsp)
	movq	224(%rsi), %r8
	movq	%r8, 5760(%rsp)
	movq	232(%rsi), %r8
	movq	%r8, 5768(%rsp)
	movq	240(%rsi), %r8
	movq	%r8, 5776(%rsp)
	movq	248(%rsi), %r8
	movq	%r8, 5784(%rsp)
	movq	256(%rsi), %r8
	movq	%r8, 5792(%rsp)
	movq	264(%rsi), %r8
	movq	%r8, 5800(%rsp)
	movq	272(%rsi), %r8
	movq	%r8, 5808(%rsp)
	movq	280(%rsi), %r8
	movq	%r8, 5816(%rsp)
	movq	288(%rsi), %r8
	movq	%r8, 5824(%rsp)
	movq	296(%rsi), %r8
	movq	%r8, 5832(%rsp)
	movq	304(%rsi), %r8
	movq	%r8, 5840(%rsp)
	movq	312(%rsi), %r8
	movq	%r8, 5848(%rsp)
	movq	320(%rsi), %r8
	movq	%r8, 5856(%rsp)
	movq	328(%rsi), %r8
	movq	%r8, 5864(%rsp)
	movq	336(%rsi), %r8
	movq	%r8, 5872(%rsp)
	movq	344(%rsi), %r8
	movq	%r8, 5880(%rsp)
	movq	352(%rsi), %r8
	movq	%r8, 5888(%rsp)
	movq	360(%rsi), %r8
	movq	%r8, 5896(%rsp)
	movq	368(%rsi), %r8
	movq	%r8, 5904(%rsp)
	movq	376(%rsi), %r8
	movq	%r8, 5912(%rsp)
	movq	384(%rsi), %r8
	movq	%r8, 5920(%rsp)
	movq	392(%rsi), %r8
	movq	%r8, 5928(%rsp)
	movq	400(%rsi), %r8
	movq	%r8, 5936(%rsp)
	movq	408(%rsi), %r8
	movq	%r8, 5944(%rsp)
	movq	416(%rsi), %r8
	movq	%r8, 5952(%rsp)
	movq	424(%rsi), %r8
	movq	%r8, 5960(%rsp)
	movq	432(%rsi), %r8
	movq	%r8, 5968(%rsp)
	movq	440(%rsi), %r8
	movq	%r8, 5976(%rsp)
	movq	448(%rsi), %r8
	movq	%r8, 5984(%rsp)
	movq	456(%rsi), %r8
	movq	%r8, 5992(%rsp)
	movq	464(%rsi), %r8
	movq	%r8, 6000(%rsp)
	movq	472(%rsi), %r8
	movq	%r8, 6008(%rsp)
	movq	480(%rsi), %r8
	movq	%r8, 6016(%rsp)
	movq	488(%rsi), %r8
	movq	%r8, 6024(%rsp)
	movq	496(%rsi), %r8
	movq	%r8, 6032(%rsp)
	movq	504(%rsi), %r8
	movq	%r8, 6040(%rsp)
	movq	512(%rsi), %r8
	movq	%r8, 6048(%rsp)
	movq	520(%rsi), %r8
	movq	%r8, 6056(%rsp)
	movq	528(%rsi), %r8
	movq	%r8, 6064(%rsp)
	movq	536(%rsi), %r8
	movq	%r8, 6072(%rsp)
	movq	544(%rsi), %r8
	movq	%r8, 6080(%rsp)
	movq	552(%rsi), %r8
	movq	%r8, 6088(%rsp)
	movq	560(%rsi), %r8
	movq	%r8, 6096(%rsp)
	movq	568(%rsi), %r8
	movq	%r8, 6104(%rsp)
	movq	576(%rsi), %r8
	movq	%r8, 6112(%rsp)
	movq	584(%rsi), %r8
	movq	%r8, 6120(%rsp)
	movq	592(%rsi), %r8
	movq	%r8, 6128(%rsp)
	movq	600(%rsi), %r8
	movq	%r8, 6136(%rsp)
	movq	608(%rsi), %r8
	movq	%r8, 6144(%rsp)
	movq	616(%rsi), %r8
	movq	%r8, 6152(%rsp)
	movq	624(%rsi), %r8
	movq	%r8, 6160(%rsp)
	movq	632(%rsi), %r8
	movq	%r8, 6168(%rsp)
	movq	640(%rsi), %r8
	movq	%r8, 6176(%rsp)
	movq	648(%rsi), %r8
	movq	%r8, 6184(%rsp)
	movq	656(%rsi), %r8
	movq	%r8, 6192(%rsp)
	movq	664(%rsi), %r8
	movq	%r8, 6200(%rsp)
	movq	672(%rsi), %r8
	movq	%r8, 6208(%rsp)
	movq	680(%rsi), %r8
	movq	%r8, 6216(%rsp)
	movq	688(%rsi), %r8
	movq	%r8, 6224(%rsp)
	movq	696(%rsi), %r8
	movq	%r8, 6232(%rsp)
	movq	704(%rsi), %r8
	movq	%r8, 6240(%rsp)
	movq	712(%rsi), %r8
	movq	%r8, 6248(%rsp)
	movq	720(%rsi), %r8
	movq	%r8, 6256(%rsp)
	movq	728(%rsi), %r8
	movq	%r8, 6264(%rsp)
	movq	736(%rsi), %r8
	movq	%r8, 6272(%rsp)
	movq	744(%rsi), %r8
	movq	%r8, 6280(%rsp)
	movq	752(%rsi), %r8
	movq	%r8, 6288(%rsp)
	movq	760(%rsi), %r8
	movq	%r8, 6296(%rsp)
	movq	768(%rsi), %r8
	movq	%r8, 6304(%rsp)
	movq	776(%rsi), %r8
	movq	%r8, 6312(%rsp)
	movq	784(%rsi), %r8
	movq	%r8, 6320(%rsp)
	movq	792(%rsi), %r8
	movq	%r8, 6328(%rsp)
	movq	800(%rsi), %r8
	movq	%r8, 6336(%rsp)
	movq	808(%rsi), %r8
	movq	%r8, 6344(%rsp)
	movq	816(%rsi), %r8
	movq	%r8, 6352(%rsp)
	movq	824(%rsi), %r8
	movq	%r8, 6360(%rsp)
	movq	832(%rsi), %r8
	movq	%r8, 6368(%rsp)
	movq	840(%rsi), %r8
	movq	%r8, 6376(%rsp)
	movq	848(%rsi), %r8
	movq	%r8, 6384(%rsp)
	movq	856(%rsi), %r8
	movq	%r8, 6392(%rsp)
	movq	864(%rsi), %r8
	movq	%r8, 6400(%rsp)
	movq	872(%rsi), %r8
	movq	%r8, 6408(%rsp)
	movq	880(%rsi), %r8
	movq	%r8, 6416(%rsp)
	movq	888(%rsi), %r8
	movq	%r8, 6424(%rsp)
	movq	896(%rsi), %r8
	movq	%r8, 6432(%rsp)
	movq	904(%rsi), %r8
	movq	%r8, 6440(%rsp)
	movq	912(%rsi), %r8
	movq	%r8, 6448(%rsp)
	movq	920(%rsi), %r8
	movq	%r8, 6456(%rsp)
	movq	928(%rsi), %r8
	movq	%r8, 6464(%rsp)
	movq	936(%rsi), %r8
	movq	%r8, 6472(%rsp)
	movq	944(%rsi), %r8
	movq	%r8, 6480(%rsp)
	movq	952(%rsi), %r8
	movq	%r8, 6488(%rsp)
	movq	960(%rsi), %r8
	movq	%r8, 6496(%rsp)
	movq	968(%rsi), %r8
	movq	%r8, 6504(%rsp)
	movq	976(%rsi), %r8
	movq	%r8, 6512(%rsp)
	movq	984(%rsi), %r8
	movq	%r8, 6520(%rsp)
	movq	992(%rsi), %r8
	movq	%r8, 6528(%rsp)
	movq	1000(%rsi), %r8
	movq	%r8, 6536(%rsp)
	movq	1008(%rsi), %r8
	movq	%r8, 6544(%rsp)
	movq	1016(%rsi), %r8
	movq	%r8, 6552(%rsp)
	movq	1024(%rsi), %r8
	movq	%r8, 6560(%rsp)
	movq	1032(%rsi), %r8
	movq	%r8, 6568(%rsp)
	movq	1040(%rsi), %r8
	movq	%r8, 6576(%rsp)
	movq	1048(%rsi), %r8
	movq	%r8, 6584(%rsp)
	movq	1056(%rsi), %r8
	movq	%r8, 6592(%rsp)
	movq	1064(%rsi), %r8
	movq	%r8, 6600(%rsp)
	movq	1072(%rsi), %r8
	movq	%r8, 6608(%rsp)
	movq	1080(%rsi), %r8
	movq	%r8, 6616(%rsp)
	movq	1088(%rsi), %r8
	movq	%r8, 6624(%rsp)
	movq	1096(%rsi), %r8
	movq	%r8, 6632(%rsp)
	movq	1104(%rsi), %r8
	movq	%r8, 6640(%rsp)
	movq	1112(%rsi), %r8
	movq	%r8, 6648(%rsp)
	movq	1120(%rsi), %r8
	movq	%r8, 6656(%rsp)
	movq	1128(%rsi), %r8
	movq	%r8, 6664(%rsp)
	movq	1136(%rsi), %r8
	movq	%r8, 6672(%rsp)
	movq	1144(%rsi), %rsi
	movq	%rsi, 6680(%rsp)
	leaq	6688(%rsp), %rsi
	leaq	5536(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$44:
	leaq	7200(%rsp), %rsi
	leaq	5920(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$43:
	leaq	7712(%rsp), %rsi
	leaq	6304(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$42:
	movq	1152(%rcx), %rsi
	movq	%rsi, 32(%rsp)
	movq	1160(%rcx), %rsi
	movq	%rsi, 40(%rsp)
	movq	1168(%rcx), %rsi
	movq	%rsi, 48(%rsp)
	movq	1176(%rcx), %rcx
	movq	%rcx, 56(%rsp)
	leaq	1216(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$41:
	movq	%rdx, %mm2
	movq	$1, %rdx
	leaq	12832(%rsp), %rcx
	leaq	32(%rsp), %rdi
	leaq	-2200(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$40:
	leaq	2200(%rsp), %rsp
	movq	%mm2, %r9
	movb	$0, %bpl
	leaq	9760(%rsp), %rsi
	leaq	10272(%rsp), %r10
	leaq	10784(%rsp), %r11
	leaq	8224(%rsp), %rbx
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$39:
	leaq	600(%rsp), %rsp
	movq	%mm2, %r9
	movb	$4, %bpl
	leaq	8736(%rsp), %rsi
	leaq	9248(%rsp), %r10
	leaq	704(%rsp), %r11
	leaq	11296(%rsp), %rbx
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$38:
	leaq	600(%rsp), %rsp
	leaq	9760(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$37:
	leaq	10272(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$36:
	leaq	10784(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$35:
	leaq	11296(%rsp), %rdx
	leaq	12832(%rsp), %rsi
	leaq	9760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$34:
	leaq	192(%rsp), %rdx
	leaq	13344(%rsp), %rsi
	leaq	10272(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$33:
	leaq	11296(%rsp), %rdx
	leaq	192(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$32:
	leaq	192(%rsp), %rdx
	leaq	13856(%rsp), %rsi
	leaq	10784(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$31:
	leaq	11296(%rsp), %rdx
	leaq	192(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$30:
	leaq	11808(%rsp), %rdx
	leaq	14368(%rsp), %rsi
	leaq	9760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$29:
	leaq	192(%rsp), %rdx
	leaq	14880(%rsp), %rsi
	leaq	10272(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$28:
	leaq	11808(%rsp), %rdx
	leaq	192(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$27:
	leaq	192(%rsp), %rdx
	leaq	15392(%rsp), %rsi
	leaq	10784(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$26:
	leaq	11808(%rsp), %rdx
	leaq	192(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$25:
	leaq	12320(%rsp), %rdx
	leaq	15904(%rsp), %rsi
	leaq	9760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$24:
	leaq	192(%rsp), %rdx
	leaq	16416(%rsp), %rsi
	leaq	10272(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$23:
	leaq	12320(%rsp), %rdx
	leaq	192(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$22:
	leaq	192(%rsp), %rdx
	leaq	16928(%rsp), %rsi
	leaq	10784(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$21:
	leaq	12320(%rsp), %rdx
	leaq	192(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$20:
	leaq	192(%rsp), %rdx
	leaq	6688(%rsp), %rsi
	leaq	9760(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$19:
	leaq	1728(%rsp), %rdx
	leaq	7200(%rsp), %rsi
	leaq	10272(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$18:
	leaq	192(%rsp), %rdx
	leaq	1728(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$17:
	leaq	1728(%rsp), %rdx
	leaq	7712(%rsp), %rsi
	leaq	10784(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$16:
	leaq	192(%rsp), %rdx
	leaq	1728(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$15:
	leaq	11296(%rsp), %rdx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$14:
	leaq	11808(%rsp), %rdx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$13:
	leaq	12320(%rsp), %rdx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$12:
	leaq	192(%rsp), %rdx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$11:
	leaq	11296(%rsp), %rdx
	leaq	8224(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$10:
	leaq	11808(%rsp), %rdx
	leaq	8736(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$9:
	leaq	12320(%rsp), %rdx
	leaq	9248(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$8:
	leaq	192(%rsp), %rdx
	leaq	704(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$7:
	leaq	192(%rsp), %rdx
	leaq	1216(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$6:
	leaq	11296(%rsp), %rcx
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
	leaq	11808(%rsp), %rcx
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
	leaq	12320(%rsp), %rcx
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
	leaq	192(%rsp), %rcx
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
	movq	%rax, %rcx
	leaq	11296(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$5:
	leaq	11808(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$4:
	leaq	12320(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$3:
	leaq	glob_data + 928(%rip), %rdx
	vmovdqu	(%rdx), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 5004(%rip), %ymm2
	vpbroadcastw	glob_data + 5002(%rip), %ymm3
	vpbroadcastw	glob_data + 5000(%rip), %ymm4
	vpbroadcastq	glob_data + 4744(%rip), %ymm5
	vpbroadcastq	glob_data + 4736(%rip), %ymm6
	vmovdqu	glob_data + 128(%rip), %ymm7
	vmovdqu	11296(%rsp), %ymm8
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
	vmovdqu	%xmm9, (%rcx)
	vpextrd	$0, %xmm8, 16(%rcx)
	vmovdqu	11328(%rsp), %ymm8
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
	vmovdqu	%xmm9, 20(%rcx)
	vpextrd	$0, %xmm8, 36(%rcx)
	vmovdqu	11360(%rsp), %ymm8
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
	vmovdqu	%xmm9, 40(%rcx)
	vpextrd	$0, %xmm8, 56(%rcx)
	vmovdqu	11392(%rsp), %ymm8
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
	vmovdqu	%xmm9, 60(%rcx)
	vpextrd	$0, %xmm8, 76(%rcx)
	vmovdqu	11424(%rsp), %ymm8
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
	vmovdqu	%xmm9, 80(%rcx)
	vpextrd	$0, %xmm8, 96(%rcx)
	vmovdqu	11456(%rsp), %ymm8
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
	vmovdqu	%xmm9, 100(%rcx)
	vpextrd	$0, %xmm8, 116(%rcx)
	vmovdqu	11488(%rsp), %ymm8
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
	vmovdqu	%xmm9, 120(%rcx)
	vpextrd	$0, %xmm8, 136(%rcx)
	vmovdqu	11520(%rsp), %ymm8
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
	vmovdqu	%xmm9, 140(%rcx)
	vpextrd	$0, %xmm8, 156(%rcx)
	vmovdqu	11552(%rsp), %ymm8
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
	vmovdqu	%xmm9, 160(%rcx)
	vpextrd	$0, %xmm8, 176(%rcx)
	vmovdqu	11584(%rsp), %ymm8
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
	vmovdqu	%xmm9, 180(%rcx)
	vpextrd	$0, %xmm8, 196(%rcx)
	vmovdqu	11616(%rsp), %ymm8
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
	vmovdqu	%xmm9, 200(%rcx)
	vpextrd	$0, %xmm8, 216(%rcx)
	vmovdqu	11648(%rsp), %ymm8
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
	vmovdqu	%xmm9, 220(%rcx)
	vpextrd	$0, %xmm8, 236(%rcx)
	vmovdqu	11680(%rsp), %ymm8
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
	vmovdqu	%xmm9, 240(%rcx)
	vpextrd	$0, %xmm8, 256(%rcx)
	vmovdqu	11712(%rsp), %ymm8
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
	vmovdqu	%xmm9, 260(%rcx)
	vpextrd	$0, %xmm8, 276(%rcx)
	vmovdqu	11744(%rsp), %ymm8
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
	vmovdqu	%xmm9, 280(%rcx)
	vpextrd	$0, %xmm8, 296(%rcx)
	vmovdqu	11776(%rsp), %ymm8
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
	vmovdqu	%xmm9, 300(%rcx)
	vpextrd	$0, %xmm8, 316(%rcx)
	vmovdqu	11808(%rsp), %ymm8
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
	vmovdqu	%xmm9, 320(%rcx)
	vpextrd	$0, %xmm8, 336(%rcx)
	vmovdqu	11840(%rsp), %ymm8
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
	vmovdqu	%xmm9, 340(%rcx)
	vpextrd	$0, %xmm8, 356(%rcx)
	vmovdqu	11872(%rsp), %ymm8
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
	vmovdqu	%xmm9, 360(%rcx)
	vpextrd	$0, %xmm8, 376(%rcx)
	vmovdqu	11904(%rsp), %ymm8
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
	vmovdqu	%xmm9, 380(%rcx)
	vpextrd	$0, %xmm8, 396(%rcx)
	vmovdqu	11936(%rsp), %ymm8
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
	vmovdqu	%xmm9, 400(%rcx)
	vpextrd	$0, %xmm8, 416(%rcx)
	vmovdqu	11968(%rsp), %ymm8
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
	vmovdqu	%xmm9, 420(%rcx)
	vpextrd	$0, %xmm8, 436(%rcx)
	vmovdqu	12000(%rsp), %ymm8
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
	vmovdqu	%xmm9, 440(%rcx)
	vpextrd	$0, %xmm8, 456(%rcx)
	vmovdqu	12032(%rsp), %ymm8
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
	vmovdqu	%xmm9, 460(%rcx)
	vpextrd	$0, %xmm8, 476(%rcx)
	vmovdqu	12064(%rsp), %ymm8
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
	vmovdqu	%xmm9, 480(%rcx)
	vpextrd	$0, %xmm8, 496(%rcx)
	vmovdqu	12096(%rsp), %ymm8
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
	vmovdqu	%xmm9, 500(%rcx)
	vpextrd	$0, %xmm8, 516(%rcx)
	vmovdqu	12128(%rsp), %ymm8
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
	vmovdqu	%xmm9, 520(%rcx)
	vpextrd	$0, %xmm8, 536(%rcx)
	vmovdqu	12160(%rsp), %ymm8
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
	vmovdqu	%xmm9, 540(%rcx)
	vpextrd	$0, %xmm8, 556(%rcx)
	vmovdqu	12192(%rsp), %ymm8
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
	vmovdqu	%xmm9, 560(%rcx)
	vpextrd	$0, %xmm8, 576(%rcx)
	vmovdqu	12224(%rsp), %ymm8
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
	vmovdqu	%xmm9, 580(%rcx)
	vpextrd	$0, %xmm8, 596(%rcx)
	vmovdqu	12256(%rsp), %ymm8
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
	vmovdqu	%xmm9, 600(%rcx)
	vpextrd	$0, %xmm8, 616(%rcx)
	vmovdqu	12288(%rsp), %ymm8
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
	vmovdqu	%xmm9, 620(%rcx)
	vpextrd	$0, %xmm8, 636(%rcx)
	vmovdqu	12320(%rsp), %ymm8
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
	vmovdqu	%xmm9, 640(%rcx)
	vpextrd	$0, %xmm8, 656(%rcx)
	vmovdqu	12352(%rsp), %ymm8
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
	vmovdqu	%xmm9, 660(%rcx)
	vpextrd	$0, %xmm8, 676(%rcx)
	vmovdqu	12384(%rsp), %ymm8
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
	vmovdqu	%xmm9, 680(%rcx)
	vpextrd	$0, %xmm8, 696(%rcx)
	vmovdqu	12416(%rsp), %ymm8
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
	vmovdqu	%xmm9, 700(%rcx)
	vpextrd	$0, %xmm8, 716(%rcx)
	vmovdqu	12448(%rsp), %ymm8
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
	vmovdqu	%xmm9, 720(%rcx)
	vpextrd	$0, %xmm8, 736(%rcx)
	vmovdqu	12480(%rsp), %ymm8
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
	vmovdqu	%xmm9, 740(%rcx)
	vpextrd	$0, %xmm8, 756(%rcx)
	vmovdqu	12512(%rsp), %ymm8
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
	vmovdqu	%xmm9, 760(%rcx)
	vpextrd	$0, %xmm8, 776(%rcx)
	vmovdqu	12544(%rsp), %ymm8
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
	vmovdqu	%xmm9, 780(%rcx)
	vpextrd	$0, %xmm8, 796(%rcx)
	vmovdqu	12576(%rsp), %ymm8
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
	vmovdqu	%xmm9, 800(%rcx)
	vpextrd	$0, %xmm8, 816(%rcx)
	vmovdqu	12608(%rsp), %ymm8
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
	vmovdqu	%xmm9, 820(%rcx)
	vpextrd	$0, %xmm8, 836(%rcx)
	vmovdqu	12640(%rsp), %ymm8
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
	vmovdqu	%xmm9, 840(%rcx)
	vpextrd	$0, %xmm8, 856(%rcx)
	vmovdqu	12672(%rsp), %ymm8
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
	vmovdqu	%xmm9, 860(%rcx)
	vpextrd	$0, %xmm8, 876(%rcx)
	vmovdqu	12704(%rsp), %ymm8
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
	vmovdqu	%xmm9, 880(%rcx)
	vpextrd	$0, %xmm8, 896(%rcx)
	vmovdqu	12736(%rsp), %ymm8
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
	vmovdqu	%xmm9, 900(%rcx)
	vpextrd	$0, %xmm8, 916(%rcx)
	vmovdqu	12768(%rsp), %ymm8
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
	vmovdqu	%xmm9, 920(%rcx)
	vpextrd	$0, %xmm8, 936(%rcx)
	vmovdqu	12800(%rsp), %ymm8
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
	vmovdqu	%xmm1, 940(%rcx)
	vpextrd	$0, %xmm0, 956(%rcx)
	leaq	960(%rax), %rax
	leaq	192(%rsp), %rdx
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$2:
	movq	17448(%rsp), %rax
	leaq	3328(%rsp), %rcx
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
	movq	%rdx, %mm0
	movq	17448(%rsp), %rax
	movq	22224(%rsp), %rcx
	movq	%rcx, 4416(%rsp)
	movq	22232(%rsp), %rcx
	movq	%rcx, 4424(%rsp)
	movq	22240(%rsp), %rcx
	movq	%rcx, 4432(%rsp)
	movq	22248(%rsp), %rcx
	movq	%rcx, 4440(%rsp)
	movq	(%rax), %rcx
	movq	%rcx, 4448(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 4456(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 4464(%rsp)
	movq	24(%rax), %rcx
	movq	%rcx, 4472(%rsp)
	movq	32(%rax), %rcx
	movq	%rcx, 4480(%rsp)
	movq	40(%rax), %rcx
	movq	%rcx, 4488(%rsp)
	movq	48(%rax), %rcx
	movq	%rcx, 4496(%rsp)
	movq	56(%rax), %rcx
	movq	%rcx, 4504(%rsp)
	movq	64(%rax), %rcx
	movq	%rcx, 4512(%rsp)
	movq	72(%rax), %rcx
	movq	%rcx, 4520(%rsp)
	movq	80(%rax), %rcx
	movq	%rcx, 4528(%rsp)
	movq	88(%rax), %rcx
	movq	%rcx, 4536(%rsp)
	movq	96(%rax), %rcx
	movq	%rcx, 4544(%rsp)
	movq	104(%rax), %rcx
	movq	%rcx, 4552(%rsp)
	movq	112(%rax), %rcx
	movq	%rcx, 4560(%rsp)
	movq	120(%rax), %rcx
	movq	%rcx, 4568(%rsp)
	movq	128(%rax), %rcx
	movq	%rcx, 4576(%rsp)
	movq	136(%rax), %rcx
	movq	%rcx, 4584(%rsp)
	movq	144(%rax), %rcx
	movq	%rcx, 4592(%rsp)
	movq	152(%rax), %rcx
	movq	%rcx, 4600(%rsp)
	movq	160(%rax), %rcx
	movq	%rcx, 4608(%rsp)
	movq	168(%rax), %rcx
	movq	%rcx, 4616(%rsp)
	movq	176(%rax), %rcx
	movq	%rcx, 4624(%rsp)
	movq	184(%rax), %rcx
	movq	%rcx, 4632(%rsp)
	movq	192(%rax), %rcx
	movq	%rcx, 4640(%rsp)
	movq	200(%rax), %rcx
	movq	%rcx, 4648(%rsp)
	movq	208(%rax), %rcx
	movq	%rcx, 4656(%rsp)
	movq	216(%rax), %rcx
	movq	%rcx, 4664(%rsp)
	movq	224(%rax), %rcx
	movq	%rcx, 4672(%rsp)
	movq	232(%rax), %rcx
	movq	%rcx, 4680(%rsp)
	movq	240(%rax), %rcx
	movq	%rcx, 4688(%rsp)
	movq	248(%rax), %rcx
	movq	%rcx, 4696(%rsp)
	movq	256(%rax), %rcx
	movq	%rcx, 4704(%rsp)
	movq	264(%rax), %rcx
	movq	%rcx, 4712(%rsp)
	movq	272(%rax), %rcx
	movq	%rcx, 4720(%rsp)
	movq	280(%rax), %rcx
	movq	%rcx, 4728(%rsp)
	movq	288(%rax), %rcx
	movq	%rcx, 4736(%rsp)
	movq	296(%rax), %rcx
	movq	%rcx, 4744(%rsp)
	movq	304(%rax), %rcx
	movq	%rcx, 4752(%rsp)
	movq	312(%rax), %rcx
	movq	%rcx, 4760(%rsp)
	movq	320(%rax), %rcx
	movq	%rcx, 4768(%rsp)
	movq	328(%rax), %rcx
	movq	%rcx, 4776(%rsp)
	movq	336(%rax), %rcx
	movq	%rcx, 4784(%rsp)
	movq	344(%rax), %rcx
	movq	%rcx, 4792(%rsp)
	movq	352(%rax), %rcx
	movq	%rcx, 4800(%rsp)
	movq	360(%rax), %rcx
	movq	%rcx, 4808(%rsp)
	movq	368(%rax), %rcx
	movq	%rcx, 4816(%rsp)
	movq	376(%rax), %rcx
	movq	%rcx, 4824(%rsp)
	movq	384(%rax), %rcx
	movq	%rcx, 4832(%rsp)
	movq	392(%rax), %rcx
	movq	%rcx, 4840(%rsp)
	movq	400(%rax), %rcx
	movq	%rcx, 4848(%rsp)
	movq	408(%rax), %rcx
	movq	%rcx, 4856(%rsp)
	movq	416(%rax), %rcx
	movq	%rcx, 4864(%rsp)
	movq	424(%rax), %rcx
	movq	%rcx, 4872(%rsp)
	movq	432(%rax), %rcx
	movq	%rcx, 4880(%rsp)
	movq	440(%rax), %rcx
	movq	%rcx, 4888(%rsp)
	movq	448(%rax), %rcx
	movq	%rcx, 4896(%rsp)
	movq	456(%rax), %rcx
	movq	%rcx, 4904(%rsp)
	movq	464(%rax), %rcx
	movq	%rcx, 4912(%rsp)
	movq	472(%rax), %rcx
	movq	%rcx, 4920(%rsp)
	movq	480(%rax), %rcx
	movq	%rcx, 4928(%rsp)
	movq	488(%rax), %rcx
	movq	%rcx, 4936(%rsp)
	movq	496(%rax), %rcx
	movq	%rcx, 4944(%rsp)
	movq	504(%rax), %rcx
	movq	%rcx, 4952(%rsp)
	movq	512(%rax), %rcx
	movq	%rcx, 4960(%rsp)
	movq	520(%rax), %rcx
	movq	%rcx, 4968(%rsp)
	movq	528(%rax), %rcx
	movq	%rcx, 4976(%rsp)
	movq	536(%rax), %rcx
	movq	%rcx, 4984(%rsp)
	movq	544(%rax), %rcx
	movq	%rcx, 4992(%rsp)
	movq	552(%rax), %rcx
	movq	%rcx, 5000(%rsp)
	movq	560(%rax), %rcx
	movq	%rcx, 5008(%rsp)
	movq	568(%rax), %rcx
	movq	%rcx, 5016(%rsp)
	movq	576(%rax), %rcx
	movq	%rcx, 5024(%rsp)
	movq	584(%rax), %rcx
	movq	%rcx, 5032(%rsp)
	movq	592(%rax), %rcx
	movq	%rcx, 5040(%rsp)
	movq	600(%rax), %rcx
	movq	%rcx, 5048(%rsp)
	movq	608(%rax), %rcx
	movq	%rcx, 5056(%rsp)
	movq	616(%rax), %rcx
	movq	%rcx, 5064(%rsp)
	movq	624(%rax), %rcx
	movq	%rcx, 5072(%rsp)
	movq	632(%rax), %rcx
	movq	%rcx, 5080(%rsp)
	movq	640(%rax), %rcx
	movq	%rcx, 5088(%rsp)
	movq	648(%rax), %rcx
	movq	%rcx, 5096(%rsp)
	movq	656(%rax), %rcx
	movq	%rcx, 5104(%rsp)
	movq	664(%rax), %rcx
	movq	%rcx, 5112(%rsp)
	movq	672(%rax), %rcx
	movq	%rcx, 5120(%rsp)
	movq	680(%rax), %rcx
	movq	%rcx, 5128(%rsp)
	movq	688(%rax), %rcx
	movq	%rcx, 5136(%rsp)
	movq	696(%rax), %rcx
	movq	%rcx, 5144(%rsp)
	movq	704(%rax), %rcx
	movq	%rcx, 5152(%rsp)
	movq	712(%rax), %rcx
	movq	%rcx, 5160(%rsp)
	movq	720(%rax), %rcx
	movq	%rcx, 5168(%rsp)
	movq	728(%rax), %rcx
	movq	%rcx, 5176(%rsp)
	movq	736(%rax), %rcx
	movq	%rcx, 5184(%rsp)
	movq	744(%rax), %rcx
	movq	%rcx, 5192(%rsp)
	movq	752(%rax), %rcx
	movq	%rcx, 5200(%rsp)
	movq	760(%rax), %rcx
	movq	%rcx, 5208(%rsp)
	movq	768(%rax), %rcx
	movq	%rcx, 5216(%rsp)
	movq	776(%rax), %rcx
	movq	%rcx, 5224(%rsp)
	movq	784(%rax), %rcx
	movq	%rcx, 5232(%rsp)
	movq	792(%rax), %rcx
	movq	%rcx, 5240(%rsp)
	movq	800(%rax), %rcx
	movq	%rcx, 5248(%rsp)
	movq	808(%rax), %rcx
	movq	%rcx, 5256(%rsp)
	movq	816(%rax), %rcx
	movq	%rcx, 5264(%rsp)
	movq	824(%rax), %rcx
	movq	%rcx, 5272(%rsp)
	movq	832(%rax), %rcx
	movq	%rcx, 5280(%rsp)
	movq	840(%rax), %rcx
	movq	%rcx, 5288(%rsp)
	movq	848(%rax), %rcx
	movq	%rcx, 5296(%rsp)
	movq	856(%rax), %rcx
	movq	%rcx, 5304(%rsp)
	movq	864(%rax), %rcx
	movq	%rcx, 5312(%rsp)
	movq	872(%rax), %rcx
	movq	%rcx, 5320(%rsp)
	movq	880(%rax), %rcx
	movq	%rcx, 5328(%rsp)
	movq	888(%rax), %rcx
	movq	%rcx, 5336(%rsp)
	movq	896(%rax), %rcx
	movq	%rcx, 5344(%rsp)
	movq	904(%rax), %rcx
	movq	%rcx, 5352(%rsp)
	movq	912(%rax), %rcx
	movq	%rcx, 5360(%rsp)
	movq	920(%rax), %rcx
	movq	%rcx, 5368(%rsp)
	movq	928(%rax), %rcx
	movq	%rcx, 5376(%rsp)
	movq	936(%rax), %rcx
	movq	%rcx, 5384(%rsp)
	movq	944(%rax), %rcx
	movq	%rcx, 5392(%rsp)
	movq	952(%rax), %rcx
	movq	%rcx, 5400(%rsp)
	movq	960(%rax), %rcx
	movq	%rcx, 5408(%rsp)
	movq	968(%rax), %rcx
	movq	%rcx, 5416(%rsp)
	movq	976(%rax), %rcx
	movq	%rcx, 5424(%rsp)
	movq	984(%rax), %rcx
	movq	%rcx, 5432(%rsp)
	movq	992(%rax), %rcx
	movq	%rcx, 5440(%rsp)
	movq	1000(%rax), %rcx
	movq	%rcx, 5448(%rsp)
	movq	1008(%rax), %rcx
	movq	%rcx, 5456(%rsp)
	movq	1016(%rax), %rcx
	movq	%rcx, 5464(%rsp)
	movq	1024(%rax), %rcx
	movq	%rcx, 5472(%rsp)
	movq	1032(%rax), %rcx
	movq	%rcx, 5480(%rsp)
	movq	1040(%rax), %rcx
	movq	%rcx, 5488(%rsp)
	movq	1048(%rax), %rcx
	movq	%rcx, 5496(%rsp)
	movq	1056(%rax), %rcx
	movq	%rcx, 5504(%rsp)
	movq	1064(%rax), %rcx
	movq	%rcx, 5512(%rsp)
	movq	1072(%rax), %rcx
	movq	%rcx, 5520(%rsp)
	movq	1080(%rax), %rax
	movq	%rax, 5528(%rsp)
	movq	17440(%rsp), %rax
	leaq	4416(%rsp), %rcx
	call	L_shake256_A32__A1120$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$1:
	movq	%mm0, %rcx
	leaq	128(%rsp), %rdx
	negq	%rcx
	movq	%rcx, 17440(%rsp)
	vpbroadcastq	17440(%rsp), %ymm0
	vmovdqu	(%rdx), %ymm1
	vmovdqu	(%rax), %ymm2
	vpblendvb	%ymm0, %ymm2, %ymm1, %ymm0
	vmovdqu	%ymm0, (%rax)
	movq	%mm1, %rax
	movq	(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	8(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	16(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	24(%rsp), %rcx
	movq	%rcx, 24(%rax)
	xorq	%rax, %rax
	movq	22256(%rsp), %rbx
	movq	22264(%rsp), %rbp
	movq	22272(%rsp), %r12
	movq	22280(%rsp), %r13
	movq	22288(%rsp), %r14
	movq	22296(%rsp), %r15
	movq	22304(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand:
jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand:
	movq	%rsp, %rax
	leaq	-16488(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 16432(%rsp)
	movq	%rbp, 16440(%rsp)
	movq	%r12, 16448(%rsp)
	movq	%r13, 16456(%rsp)
	movq	%r14, 16464(%rsp)
	movq	%r15, 16472(%rsp)
	movq	%rax, 16480(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm1
	movq	%rsi, %mm2
	movq	(%rdx), %rax
	movq	%rax, 4448(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 4456(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 4464(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 4472(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 4480(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 4488(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 4496(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 4504(%rsp)
	movq	64(%rdx), %rax
	movq	%rax, 4512(%rsp)
	movq	72(%rdx), %rax
	movq	%rax, 4520(%rsp)
	movq	80(%rdx), %rax
	movq	%rax, 4528(%rsp)
	movq	88(%rdx), %rax
	movq	%rax, 4536(%rsp)
	movq	96(%rdx), %rax
	movq	%rax, 4544(%rsp)
	movq	104(%rdx), %rax
	movq	%rax, 4552(%rsp)
	movq	112(%rdx), %rax
	movq	%rax, 4560(%rsp)
	movq	120(%rdx), %rax
	movq	%rax, 4568(%rsp)
	movq	128(%rdx), %rax
	movq	%rax, 4576(%rsp)
	movq	136(%rdx), %rax
	movq	%rax, 4584(%rsp)
	movq	144(%rdx), %rax
	movq	%rax, 4592(%rsp)
	movq	152(%rdx), %rax
	movq	%rax, 4600(%rsp)
	movq	160(%rdx), %rax
	movq	%rax, 4608(%rsp)
	movq	168(%rdx), %rax
	movq	%rax, 4616(%rsp)
	movq	176(%rdx), %rax
	movq	%rax, 4624(%rsp)
	movq	184(%rdx), %rax
	movq	%rax, 4632(%rsp)
	movq	192(%rdx), %rax
	movq	%rax, 4640(%rsp)
	movq	200(%rdx), %rax
	movq	%rax, 4648(%rsp)
	movq	208(%rdx), %rax
	movq	%rax, 4656(%rsp)
	movq	216(%rdx), %rax
	movq	%rax, 4664(%rsp)
	movq	224(%rdx), %rax
	movq	%rax, 4672(%rsp)
	movq	232(%rdx), %rax
	movq	%rax, 4680(%rsp)
	movq	240(%rdx), %rax
	movq	%rax, 4688(%rsp)
	movq	248(%rdx), %rax
	movq	%rax, 4696(%rsp)
	movq	256(%rdx), %rax
	movq	%rax, 4704(%rsp)
	movq	264(%rdx), %rax
	movq	%rax, 4712(%rsp)
	movq	272(%rdx), %rax
	movq	%rax, 4720(%rsp)
	movq	280(%rdx), %rax
	movq	%rax, 4728(%rsp)
	movq	288(%rdx), %rax
	movq	%rax, 4736(%rsp)
	movq	296(%rdx), %rax
	movq	%rax, 4744(%rsp)
	movq	304(%rdx), %rax
	movq	%rax, 4752(%rsp)
	movq	312(%rdx), %rax
	movq	%rax, 4760(%rsp)
	movq	320(%rdx), %rax
	movq	%rax, 4768(%rsp)
	movq	328(%rdx), %rax
	movq	%rax, 4776(%rsp)
	movq	336(%rdx), %rax
	movq	%rax, 4784(%rsp)
	movq	344(%rdx), %rax
	movq	%rax, 4792(%rsp)
	movq	352(%rdx), %rax
	movq	%rax, 4800(%rsp)
	movq	360(%rdx), %rax
	movq	%rax, 4808(%rsp)
	movq	368(%rdx), %rax
	movq	%rax, 4816(%rsp)
	movq	376(%rdx), %rax
	movq	%rax, 4824(%rsp)
	movq	384(%rdx), %rax
	movq	%rax, 4832(%rsp)
	movq	392(%rdx), %rax
	movq	%rax, 4840(%rsp)
	movq	400(%rdx), %rax
	movq	%rax, 4848(%rsp)
	movq	408(%rdx), %rax
	movq	%rax, 4856(%rsp)
	movq	416(%rdx), %rax
	movq	%rax, 4864(%rsp)
	movq	424(%rdx), %rax
	movq	%rax, 4872(%rsp)
	movq	432(%rdx), %rax
	movq	%rax, 4880(%rsp)
	movq	440(%rdx), %rax
	movq	%rax, 4888(%rsp)
	movq	448(%rdx), %rax
	movq	%rax, 4896(%rsp)
	movq	456(%rdx), %rax
	movq	%rax, 4904(%rsp)
	movq	464(%rdx), %rax
	movq	%rax, 4912(%rsp)
	movq	472(%rdx), %rax
	movq	%rax, 4920(%rsp)
	movq	480(%rdx), %rax
	movq	%rax, 4928(%rsp)
	movq	488(%rdx), %rax
	movq	%rax, 4936(%rsp)
	movq	496(%rdx), %rax
	movq	%rax, 4944(%rsp)
	movq	504(%rdx), %rax
	movq	%rax, 4952(%rsp)
	movq	512(%rdx), %rax
	movq	%rax, 4960(%rsp)
	movq	520(%rdx), %rax
	movq	%rax, 4968(%rsp)
	movq	528(%rdx), %rax
	movq	%rax, 4976(%rsp)
	movq	536(%rdx), %rax
	movq	%rax, 4984(%rsp)
	movq	544(%rdx), %rax
	movq	%rax, 4992(%rsp)
	movq	552(%rdx), %rax
	movq	%rax, 5000(%rsp)
	movq	560(%rdx), %rax
	movq	%rax, 5008(%rsp)
	movq	568(%rdx), %rax
	movq	%rax, 5016(%rsp)
	movq	576(%rdx), %rax
	movq	%rax, 5024(%rsp)
	movq	584(%rdx), %rax
	movq	%rax, 5032(%rsp)
	movq	592(%rdx), %rax
	movq	%rax, 5040(%rsp)
	movq	600(%rdx), %rax
	movq	%rax, 5048(%rsp)
	movq	608(%rdx), %rax
	movq	%rax, 5056(%rsp)
	movq	616(%rdx), %rax
	movq	%rax, 5064(%rsp)
	movq	624(%rdx), %rax
	movq	%rax, 5072(%rsp)
	movq	632(%rdx), %rax
	movq	%rax, 5080(%rsp)
	movq	640(%rdx), %rax
	movq	%rax, 5088(%rsp)
	movq	648(%rdx), %rax
	movq	%rax, 5096(%rsp)
	movq	656(%rdx), %rax
	movq	%rax, 5104(%rsp)
	movq	664(%rdx), %rax
	movq	%rax, 5112(%rsp)
	movq	672(%rdx), %rax
	movq	%rax, 5120(%rsp)
	movq	680(%rdx), %rax
	movq	%rax, 5128(%rsp)
	movq	688(%rdx), %rax
	movq	%rax, 5136(%rsp)
	movq	696(%rdx), %rax
	movq	%rax, 5144(%rsp)
	movq	704(%rdx), %rax
	movq	%rax, 5152(%rsp)
	movq	712(%rdx), %rax
	movq	%rax, 5160(%rsp)
	movq	720(%rdx), %rax
	movq	%rax, 5168(%rsp)
	movq	728(%rdx), %rax
	movq	%rax, 5176(%rsp)
	movq	736(%rdx), %rax
	movq	%rax, 5184(%rsp)
	movq	744(%rdx), %rax
	movq	%rax, 5192(%rsp)
	movq	752(%rdx), %rax
	movq	%rax, 5200(%rsp)
	movq	760(%rdx), %rax
	movq	%rax, 5208(%rsp)
	movq	768(%rdx), %rax
	movq	%rax, 5216(%rsp)
	movq	776(%rdx), %rax
	movq	%rax, 5224(%rsp)
	movq	784(%rdx), %rax
	movq	%rax, 5232(%rsp)
	movq	792(%rdx), %rax
	movq	%rax, 5240(%rsp)
	movq	800(%rdx), %rax
	movq	%rax, 5248(%rsp)
	movq	808(%rdx), %rax
	movq	%rax, 5256(%rsp)
	movq	816(%rdx), %rax
	movq	%rax, 5264(%rsp)
	movq	824(%rdx), %rax
	movq	%rax, 5272(%rsp)
	movq	832(%rdx), %rax
	movq	%rax, 5280(%rsp)
	movq	840(%rdx), %rax
	movq	%rax, 5288(%rsp)
	movq	848(%rdx), %rax
	movq	%rax, 5296(%rsp)
	movq	856(%rdx), %rax
	movq	%rax, 5304(%rsp)
	movq	864(%rdx), %rax
	movq	%rax, 5312(%rsp)
	movq	872(%rdx), %rax
	movq	%rax, 5320(%rsp)
	movq	880(%rdx), %rax
	movq	%rax, 5328(%rsp)
	movq	888(%rdx), %rax
	movq	%rax, 5336(%rsp)
	movq	896(%rdx), %rax
	movq	%rax, 5344(%rsp)
	movq	904(%rdx), %rax
	movq	%rax, 5352(%rsp)
	movq	912(%rdx), %rax
	movq	%rax, 5360(%rsp)
	movq	920(%rdx), %rax
	movq	%rax, 5368(%rsp)
	movq	928(%rdx), %rax
	movq	%rax, 5376(%rsp)
	movq	936(%rdx), %rax
	movq	%rax, 5384(%rsp)
	movq	944(%rdx), %rax
	movq	%rax, 5392(%rsp)
	movq	952(%rdx), %rax
	movq	%rax, 5400(%rsp)
	movq	960(%rdx), %rax
	movq	%rax, 5408(%rsp)
	movq	968(%rdx), %rax
	movq	%rax, 5416(%rsp)
	movq	976(%rdx), %rax
	movq	%rax, 5424(%rsp)
	movq	984(%rdx), %rax
	movq	%rax, 5432(%rsp)
	movq	992(%rdx), %rax
	movq	%rax, 5440(%rsp)
	movq	1000(%rdx), %rax
	movq	%rax, 5448(%rsp)
	movq	1008(%rdx), %rax
	movq	%rax, 5456(%rsp)
	movq	1016(%rdx), %rax
	movq	%rax, 5464(%rsp)
	movq	1024(%rdx), %rax
	movq	%rax, 5472(%rsp)
	movq	1032(%rdx), %rax
	movq	%rax, 5480(%rsp)
	movq	1040(%rdx), %rax
	movq	%rax, 5488(%rsp)
	movq	1048(%rdx), %rax
	movq	%rax, 5496(%rsp)
	movq	1056(%rdx), %rax
	movq	%rax, 5504(%rsp)
	movq	1064(%rdx), %rax
	movq	%rax, 5512(%rsp)
	movq	1072(%rdx), %rax
	movq	%rax, 5520(%rsp)
	movq	1080(%rdx), %rax
	movq	%rax, 5528(%rsp)
	movq	1088(%rdx), %rax
	movq	%rax, 5536(%rsp)
	movq	1096(%rdx), %rax
	movq	%rax, 5544(%rsp)
	movq	1104(%rdx), %rax
	movq	%rax, 5552(%rsp)
	movq	1112(%rdx), %rax
	movq	%rax, 5560(%rsp)
	movq	1120(%rdx), %rax
	movq	%rax, 5568(%rsp)
	movq	1128(%rdx), %rax
	movq	%rax, 5576(%rsp)
	movq	1136(%rdx), %rax
	movq	%rax, 5584(%rsp)
	movq	1144(%rdx), %rax
	movq	%rax, 5592(%rsp)
	movq	1152(%rdx), %rax
	movq	%rax, 5600(%rsp)
	movq	1160(%rdx), %rax
	movq	%rax, 5608(%rsp)
	movq	1168(%rdx), %rax
	movq	%rax, 5616(%rsp)
	movq	1176(%rdx), %rax
	movq	%rax, 5624(%rsp)
	movq	(%rcx), %rax
	movq	%rax, (%rsp)
	movq	8(%rcx), %rax
	movq	%rax, 8(%rsp)
	movq	16(%rcx), %rax
	movq	%rax, 16(%rsp)
	movq	24(%rcx), %rax
	movq	%rax, 24(%rsp)
	leaq	2208(%rsp), %rax
	leaq	4448(%rsp), %rcx
	leaq	16400(%rsp), %rdx
	movq	%rsp, %rsi
	movq	%rcx, 16384(%rsp)
	movq	%rdx, 16392(%rsp)
	movq	(%rsi), %rdx
	movq	%rdx, 32(%rsp)
	movq	8(%rsi), %rdx
	movq	%rdx, 40(%rsp)
	movq	16(%rsi), %rdx
	movq	%rdx, 48(%rsp)
	movq	24(%rsi), %rdx
	movq	%rdx, 56(%rsp)
	leaq	64(%rsp), %rdx
	call	L_sha3_256A_A1184$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$45:
	leaq	96(%rsp), %rcx
	leaq	32(%rsp), %rdx
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$44:
	movq	16384(%rsp), %rcx
	leaq	32(%rsp), %rdi
	leaq	128(%rsp), %rdx
	movq	%rcx, %rsi
	movq	(%rsi), %r8
	movq	%r8, 3296(%rsp)
	movq	8(%rsi), %r8
	movq	%r8, 3304(%rsp)
	movq	16(%rsi), %r8
	movq	%r8, 3312(%rsp)
	movq	24(%rsi), %r8
	movq	%r8, 3320(%rsp)
	movq	32(%rsi), %r8
	movq	%r8, 3328(%rsp)
	movq	40(%rsi), %r8
	movq	%r8, 3336(%rsp)
	movq	48(%rsi), %r8
	movq	%r8, 3344(%rsp)
	movq	56(%rsi), %r8
	movq	%r8, 3352(%rsp)
	movq	64(%rsi), %r8
	movq	%r8, 3360(%rsp)
	movq	72(%rsi), %r8
	movq	%r8, 3368(%rsp)
	movq	80(%rsi), %r8
	movq	%r8, 3376(%rsp)
	movq	88(%rsi), %r8
	movq	%r8, 3384(%rsp)
	movq	96(%rsi), %r8
	movq	%r8, 3392(%rsp)
	movq	104(%rsi), %r8
	movq	%r8, 3400(%rsp)
	movq	112(%rsi), %r8
	movq	%r8, 3408(%rsp)
	movq	120(%rsi), %r8
	movq	%r8, 3416(%rsp)
	movq	128(%rsi), %r8
	movq	%r8, 3424(%rsp)
	movq	136(%rsi), %r8
	movq	%r8, 3432(%rsp)
	movq	144(%rsi), %r8
	movq	%r8, 3440(%rsp)
	movq	152(%rsi), %r8
	movq	%r8, 3448(%rsp)
	movq	160(%rsi), %r8
	movq	%r8, 3456(%rsp)
	movq	168(%rsi), %r8
	movq	%r8, 3464(%rsp)
	movq	176(%rsi), %r8
	movq	%r8, 3472(%rsp)
	movq	184(%rsi), %r8
	movq	%r8, 3480(%rsp)
	movq	192(%rsi), %r8
	movq	%r8, 3488(%rsp)
	movq	200(%rsi), %r8
	movq	%r8, 3496(%rsp)
	movq	208(%rsi), %r8
	movq	%r8, 3504(%rsp)
	movq	216(%rsi), %r8
	movq	%r8, 3512(%rsp)
	movq	224(%rsi), %r8
	movq	%r8, 3520(%rsp)
	movq	232(%rsi), %r8
	movq	%r8, 3528(%rsp)
	movq	240(%rsi), %r8
	movq	%r8, 3536(%rsp)
	movq	248(%rsi), %r8
	movq	%r8, 3544(%rsp)
	movq	256(%rsi), %r8
	movq	%r8, 3552(%rsp)
	movq	264(%rsi), %r8
	movq	%r8, 3560(%rsp)
	movq	272(%rsi), %r8
	movq	%r8, 3568(%rsp)
	movq	280(%rsi), %r8
	movq	%r8, 3576(%rsp)
	movq	288(%rsi), %r8
	movq	%r8, 3584(%rsp)
	movq	296(%rsi), %r8
	movq	%r8, 3592(%rsp)
	movq	304(%rsi), %r8
	movq	%r8, 3600(%rsp)
	movq	312(%rsi), %r8
	movq	%r8, 3608(%rsp)
	movq	320(%rsi), %r8
	movq	%r8, 3616(%rsp)
	movq	328(%rsi), %r8
	movq	%r8, 3624(%rsp)
	movq	336(%rsi), %r8
	movq	%r8, 3632(%rsp)
	movq	344(%rsi), %r8
	movq	%r8, 3640(%rsp)
	movq	352(%rsi), %r8
	movq	%r8, 3648(%rsp)
	movq	360(%rsi), %r8
	movq	%r8, 3656(%rsp)
	movq	368(%rsi), %r8
	movq	%r8, 3664(%rsp)
	movq	376(%rsi), %r8
	movq	%r8, 3672(%rsp)
	movq	384(%rsi), %r8
	movq	%r8, 3680(%rsp)
	movq	392(%rsi), %r8
	movq	%r8, 3688(%rsp)
	movq	400(%rsi), %r8
	movq	%r8, 3696(%rsp)
	movq	408(%rsi), %r8
	movq	%r8, 3704(%rsp)
	movq	416(%rsi), %r8
	movq	%r8, 3712(%rsp)
	movq	424(%rsi), %r8
	movq	%r8, 3720(%rsp)
	movq	432(%rsi), %r8
	movq	%r8, 3728(%rsp)
	movq	440(%rsi), %r8
	movq	%r8, 3736(%rsp)
	movq	448(%rsi), %r8
	movq	%r8, 3744(%rsp)
	movq	456(%rsi), %r8
	movq	%r8, 3752(%rsp)
	movq	464(%rsi), %r8
	movq	%r8, 3760(%rsp)
	movq	472(%rsi), %r8
	movq	%r8, 3768(%rsp)
	movq	480(%rsi), %r8
	movq	%r8, 3776(%rsp)
	movq	488(%rsi), %r8
	movq	%r8, 3784(%rsp)
	movq	496(%rsi), %r8
	movq	%r8, 3792(%rsp)
	movq	504(%rsi), %r8
	movq	%r8, 3800(%rsp)
	movq	512(%rsi), %r8
	movq	%r8, 3808(%rsp)
	movq	520(%rsi), %r8
	movq	%r8, 3816(%rsp)
	movq	528(%rsi), %r8
	movq	%r8, 3824(%rsp)
	movq	536(%rsi), %r8
	movq	%r8, 3832(%rsp)
	movq	544(%rsi), %r8
	movq	%r8, 3840(%rsp)
	movq	552(%rsi), %r8
	movq	%r8, 3848(%rsp)
	movq	560(%rsi), %r8
	movq	%r8, 3856(%rsp)
	movq	568(%rsi), %r8
	movq	%r8, 3864(%rsp)
	movq	576(%rsi), %r8
	movq	%r8, 3872(%rsp)
	movq	584(%rsi), %r8
	movq	%r8, 3880(%rsp)
	movq	592(%rsi), %r8
	movq	%r8, 3888(%rsp)
	movq	600(%rsi), %r8
	movq	%r8, 3896(%rsp)
	movq	608(%rsi), %r8
	movq	%r8, 3904(%rsp)
	movq	616(%rsi), %r8
	movq	%r8, 3912(%rsp)
	movq	624(%rsi), %r8
	movq	%r8, 3920(%rsp)
	movq	632(%rsi), %r8
	movq	%r8, 3928(%rsp)
	movq	640(%rsi), %r8
	movq	%r8, 3936(%rsp)
	movq	648(%rsi), %r8
	movq	%r8, 3944(%rsp)
	movq	656(%rsi), %r8
	movq	%r8, 3952(%rsp)
	movq	664(%rsi), %r8
	movq	%r8, 3960(%rsp)
	movq	672(%rsi), %r8
	movq	%r8, 3968(%rsp)
	movq	680(%rsi), %r8
	movq	%r8, 3976(%rsp)
	movq	688(%rsi), %r8
	movq	%r8, 3984(%rsp)
	movq	696(%rsi), %r8
	movq	%r8, 3992(%rsp)
	movq	704(%rsi), %r8
	movq	%r8, 4000(%rsp)
	movq	712(%rsi), %r8
	movq	%r8, 4008(%rsp)
	movq	720(%rsi), %r8
	movq	%r8, 4016(%rsp)
	movq	728(%rsi), %r8
	movq	%r8, 4024(%rsp)
	movq	736(%rsi), %r8
	movq	%r8, 4032(%rsp)
	movq	744(%rsi), %r8
	movq	%r8, 4040(%rsp)
	movq	752(%rsi), %r8
	movq	%r8, 4048(%rsp)
	movq	760(%rsi), %r8
	movq	%r8, 4056(%rsp)
	movq	768(%rsi), %r8
	movq	%r8, 4064(%rsp)
	movq	776(%rsi), %r8
	movq	%r8, 4072(%rsp)
	movq	784(%rsi), %r8
	movq	%r8, 4080(%rsp)
	movq	792(%rsi), %r8
	movq	%r8, 4088(%rsp)
	movq	800(%rsi), %r8
	movq	%r8, 4096(%rsp)
	movq	808(%rsi), %r8
	movq	%r8, 4104(%rsp)
	movq	816(%rsi), %r8
	movq	%r8, 4112(%rsp)
	movq	824(%rsi), %r8
	movq	%r8, 4120(%rsp)
	movq	832(%rsi), %r8
	movq	%r8, 4128(%rsp)
	movq	840(%rsi), %r8
	movq	%r8, 4136(%rsp)
	movq	848(%rsi), %r8
	movq	%r8, 4144(%rsp)
	movq	856(%rsi), %r8
	movq	%r8, 4152(%rsp)
	movq	864(%rsi), %r8
	movq	%r8, 4160(%rsp)
	movq	872(%rsi), %r8
	movq	%r8, 4168(%rsp)
	movq	880(%rsi), %r8
	movq	%r8, 4176(%rsp)
	movq	888(%rsi), %r8
	movq	%r8, 4184(%rsp)
	movq	896(%rsi), %r8
	movq	%r8, 4192(%rsp)
	movq	904(%rsi), %r8
	movq	%r8, 4200(%rsp)
	movq	912(%rsi), %r8
	movq	%r8, 4208(%rsp)
	movq	920(%rsi), %r8
	movq	%r8, 4216(%rsp)
	movq	928(%rsi), %r8
	movq	%r8, 4224(%rsp)
	movq	936(%rsi), %r8
	movq	%r8, 4232(%rsp)
	movq	944(%rsi), %r8
	movq	%r8, 4240(%rsp)
	movq	952(%rsi), %r8
	movq	%r8, 4248(%rsp)
	movq	960(%rsi), %r8
	movq	%r8, 4256(%rsp)
	movq	968(%rsi), %r8
	movq	%r8, 4264(%rsp)
	movq	976(%rsi), %r8
	movq	%r8, 4272(%rsp)
	movq	984(%rsi), %r8
	movq	%r8, 4280(%rsp)
	movq	992(%rsi), %r8
	movq	%r8, 4288(%rsp)
	movq	1000(%rsi), %r8
	movq	%r8, 4296(%rsp)
	movq	1008(%rsi), %r8
	movq	%r8, 4304(%rsp)
	movq	1016(%rsi), %r8
	movq	%r8, 4312(%rsp)
	movq	1024(%rsi), %r8
	movq	%r8, 4320(%rsp)
	movq	1032(%rsi), %r8
	movq	%r8, 4328(%rsp)
	movq	1040(%rsi), %r8
	movq	%r8, 4336(%rsp)
	movq	1048(%rsi), %r8
	movq	%r8, 4344(%rsp)
	movq	1056(%rsi), %r8
	movq	%r8, 4352(%rsp)
	movq	1064(%rsi), %r8
	movq	%r8, 4360(%rsp)
	movq	1072(%rsi), %r8
	movq	%r8, 4368(%rsp)
	movq	1080(%rsi), %r8
	movq	%r8, 4376(%rsp)
	movq	1088(%rsi), %r8
	movq	%r8, 4384(%rsp)
	movq	1096(%rsi), %r8
	movq	%r8, 4392(%rsp)
	movq	1104(%rsi), %r8
	movq	%r8, 4400(%rsp)
	movq	1112(%rsi), %r8
	movq	%r8, 4408(%rsp)
	movq	1120(%rsi), %r8
	movq	%r8, 4416(%rsp)
	movq	1128(%rsi), %r8
	movq	%r8, 4424(%rsp)
	movq	1136(%rsi), %r8
	movq	%r8, 4432(%rsp)
	movq	1144(%rsi), %rsi
	movq	%rsi, 4440(%rsp)
	leaq	5632(%rsp), %rsi
	leaq	3296(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$43:
	leaq	6144(%rsp), %rsi
	leaq	3680(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$42:
	leaq	6656(%rsp), %rsi
	leaq	4064(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$41:
	movq	1152(%rcx), %rsi
	movq	%rsi, (%rsp)
	movq	1160(%rcx), %rsi
	movq	%rsi, 8(%rsp)
	movq	1168(%rcx), %rsi
	movq	%rsi, 16(%rsp)
	movq	1176(%rcx), %rcx
	movq	%rcx, 24(%rsp)
	leaq	160(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$40:
	movq	%rdx, %mm3
	movq	$1, %rdx
	leaq	11776(%rsp), %rcx
	movq	%rsp, %rdi
	leaq	-2200(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$39:
	leaq	2200(%rsp), %rsp
	movq	%mm3, %r9
	movb	$0, %bpl
	leaq	8704(%rsp), %rsi
	leaq	9216(%rsp), %r10
	leaq	9728(%rsp), %r11
	leaq	7168(%rsp), %rbx
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$38:
	leaq	600(%rsp), %rsp
	movq	%mm3, %r9
	movb	$4, %bpl
	leaq	7680(%rsp), %rsi
	leaq	8192(%rsp), %r10
	leaq	672(%rsp), %r11
	leaq	10240(%rsp), %rbx
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$37:
	leaq	600(%rsp), %rsp
	leaq	8704(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$36:
	leaq	9216(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$35:
	leaq	9728(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$34:
	leaq	10240(%rsp), %rdx
	leaq	11776(%rsp), %rsi
	leaq	8704(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$33:
	leaq	1184(%rsp), %rdx
	leaq	12288(%rsp), %rsi
	leaq	9216(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$32:
	leaq	10240(%rsp), %rdx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$31:
	leaq	1184(%rsp), %rdx
	leaq	12800(%rsp), %rsi
	leaq	9728(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$30:
	leaq	10240(%rsp), %rdx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$29:
	leaq	10752(%rsp), %rdx
	leaq	13312(%rsp), %rsi
	leaq	8704(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$28:
	leaq	1184(%rsp), %rdx
	leaq	13824(%rsp), %rsi
	leaq	9216(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$27:
	leaq	10752(%rsp), %rdx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$26:
	leaq	1184(%rsp), %rdx
	leaq	14336(%rsp), %rsi
	leaq	9728(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$25:
	leaq	10752(%rsp), %rdx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$24:
	leaq	11264(%rsp), %rdx
	leaq	14848(%rsp), %rsi
	leaq	8704(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$23:
	leaq	1184(%rsp), %rdx
	leaq	15360(%rsp), %rsi
	leaq	9216(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$22:
	leaq	11264(%rsp), %rdx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$21:
	leaq	1184(%rsp), %rdx
	leaq	15872(%rsp), %rsi
	leaq	9728(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$20:
	leaq	11264(%rsp), %rdx
	leaq	1184(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$19:
	leaq	1184(%rsp), %rdx
	leaq	5632(%rsp), %rsi
	leaq	8704(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$18:
	leaq	1696(%rsp), %rdx
	leaq	6144(%rsp), %rsi
	leaq	9216(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$17:
	leaq	1184(%rsp), %rdx
	leaq	1696(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$16:
	leaq	1696(%rsp), %rdx
	leaq	6656(%rsp), %rsi
	leaq	9728(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$15:
	leaq	1184(%rsp), %rdx
	leaq	1696(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$14:
	leaq	10240(%rsp), %rdx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$13:
	leaq	10752(%rsp), %rdx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$12:
	leaq	11264(%rsp), %rdx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$11:
	leaq	1184(%rsp), %rdx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$10:
	leaq	10240(%rsp), %rdx
	leaq	7168(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$9:
	leaq	10752(%rsp), %rdx
	leaq	7680(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$8:
	leaq	11264(%rsp), %rdx
	leaq	8192(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$7:
	leaq	1184(%rsp), %rdx
	leaq	672(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$6:
	leaq	1184(%rsp), %rdx
	leaq	160(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$5:
	leaq	10240(%rsp), %rcx
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
	leaq	10752(%rsp), %rcx
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
	leaq	11264(%rsp), %rcx
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
	movq	%rax, %rcx
	leaq	10240(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$4:
	leaq	10752(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$3:
	leaq	11264(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$2:
	leaq	glob_data + 928(%rip), %rdx
	vmovdqu	(%rdx), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 5004(%rip), %ymm2
	vpbroadcastw	glob_data + 5002(%rip), %ymm3
	vpbroadcastw	glob_data + 5000(%rip), %ymm4
	vpbroadcastq	glob_data + 4744(%rip), %ymm5
	vpbroadcastq	glob_data + 4736(%rip), %ymm6
	vmovdqu	glob_data + 128(%rip), %ymm7
	vmovdqu	10240(%rsp), %ymm8
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
	vmovdqu	%xmm9, (%rcx)
	vpextrd	$0, %xmm8, 16(%rcx)
	vmovdqu	10272(%rsp), %ymm8
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
	vmovdqu	%xmm9, 20(%rcx)
	vpextrd	$0, %xmm8, 36(%rcx)
	vmovdqu	10304(%rsp), %ymm8
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
	vmovdqu	%xmm9, 40(%rcx)
	vpextrd	$0, %xmm8, 56(%rcx)
	vmovdqu	10336(%rsp), %ymm8
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
	vmovdqu	%xmm9, 60(%rcx)
	vpextrd	$0, %xmm8, 76(%rcx)
	vmovdqu	10368(%rsp), %ymm8
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
	vmovdqu	%xmm9, 80(%rcx)
	vpextrd	$0, %xmm8, 96(%rcx)
	vmovdqu	10400(%rsp), %ymm8
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
	vmovdqu	%xmm9, 100(%rcx)
	vpextrd	$0, %xmm8, 116(%rcx)
	vmovdqu	10432(%rsp), %ymm8
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
	vmovdqu	%xmm9, 120(%rcx)
	vpextrd	$0, %xmm8, 136(%rcx)
	vmovdqu	10464(%rsp), %ymm8
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
	vmovdqu	%xmm9, 140(%rcx)
	vpextrd	$0, %xmm8, 156(%rcx)
	vmovdqu	10496(%rsp), %ymm8
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
	vmovdqu	%xmm9, 160(%rcx)
	vpextrd	$0, %xmm8, 176(%rcx)
	vmovdqu	10528(%rsp), %ymm8
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
	vmovdqu	%xmm9, 180(%rcx)
	vpextrd	$0, %xmm8, 196(%rcx)
	vmovdqu	10560(%rsp), %ymm8
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
	vmovdqu	%xmm9, 200(%rcx)
	vpextrd	$0, %xmm8, 216(%rcx)
	vmovdqu	10592(%rsp), %ymm8
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
	vmovdqu	%xmm9, 220(%rcx)
	vpextrd	$0, %xmm8, 236(%rcx)
	vmovdqu	10624(%rsp), %ymm8
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
	vmovdqu	%xmm9, 240(%rcx)
	vpextrd	$0, %xmm8, 256(%rcx)
	vmovdqu	10656(%rsp), %ymm8
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
	vmovdqu	%xmm9, 260(%rcx)
	vpextrd	$0, %xmm8, 276(%rcx)
	vmovdqu	10688(%rsp), %ymm8
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
	vmovdqu	%xmm9, 280(%rcx)
	vpextrd	$0, %xmm8, 296(%rcx)
	vmovdqu	10720(%rsp), %ymm8
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
	vmovdqu	%xmm9, 300(%rcx)
	vpextrd	$0, %xmm8, 316(%rcx)
	vmovdqu	10752(%rsp), %ymm8
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
	vmovdqu	%xmm9, 320(%rcx)
	vpextrd	$0, %xmm8, 336(%rcx)
	vmovdqu	10784(%rsp), %ymm8
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
	vmovdqu	%xmm9, 340(%rcx)
	vpextrd	$0, %xmm8, 356(%rcx)
	vmovdqu	10816(%rsp), %ymm8
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
	vmovdqu	%xmm9, 360(%rcx)
	vpextrd	$0, %xmm8, 376(%rcx)
	vmovdqu	10848(%rsp), %ymm8
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
	vmovdqu	%xmm9, 380(%rcx)
	vpextrd	$0, %xmm8, 396(%rcx)
	vmovdqu	10880(%rsp), %ymm8
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
	vmovdqu	%xmm9, 400(%rcx)
	vpextrd	$0, %xmm8, 416(%rcx)
	vmovdqu	10912(%rsp), %ymm8
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
	vmovdqu	%xmm9, 420(%rcx)
	vpextrd	$0, %xmm8, 436(%rcx)
	vmovdqu	10944(%rsp), %ymm8
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
	vmovdqu	%xmm9, 440(%rcx)
	vpextrd	$0, %xmm8, 456(%rcx)
	vmovdqu	10976(%rsp), %ymm8
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
	vmovdqu	%xmm9, 460(%rcx)
	vpextrd	$0, %xmm8, 476(%rcx)
	vmovdqu	11008(%rsp), %ymm8
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
	vmovdqu	%xmm9, 480(%rcx)
	vpextrd	$0, %xmm8, 496(%rcx)
	vmovdqu	11040(%rsp), %ymm8
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
	vmovdqu	%xmm9, 500(%rcx)
	vpextrd	$0, %xmm8, 516(%rcx)
	vmovdqu	11072(%rsp), %ymm8
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
	vmovdqu	%xmm9, 520(%rcx)
	vpextrd	$0, %xmm8, 536(%rcx)
	vmovdqu	11104(%rsp), %ymm8
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
	vmovdqu	%xmm9, 540(%rcx)
	vpextrd	$0, %xmm8, 556(%rcx)
	vmovdqu	11136(%rsp), %ymm8
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
	vmovdqu	%xmm9, 560(%rcx)
	vpextrd	$0, %xmm8, 576(%rcx)
	vmovdqu	11168(%rsp), %ymm8
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
	vmovdqu	%xmm9, 580(%rcx)
	vpextrd	$0, %xmm8, 596(%rcx)
	vmovdqu	11200(%rsp), %ymm8
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
	vmovdqu	%xmm9, 600(%rcx)
	vpextrd	$0, %xmm8, 616(%rcx)
	vmovdqu	11232(%rsp), %ymm8
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
	vmovdqu	%xmm9, 620(%rcx)
	vpextrd	$0, %xmm8, 636(%rcx)
	vmovdqu	11264(%rsp), %ymm8
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
	vmovdqu	%xmm9, 640(%rcx)
	vpextrd	$0, %xmm8, 656(%rcx)
	vmovdqu	11296(%rsp), %ymm8
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
	vmovdqu	%xmm9, 660(%rcx)
	vpextrd	$0, %xmm8, 676(%rcx)
	vmovdqu	11328(%rsp), %ymm8
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
	vmovdqu	%xmm9, 680(%rcx)
	vpextrd	$0, %xmm8, 696(%rcx)
	vmovdqu	11360(%rsp), %ymm8
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
	vmovdqu	%xmm9, 700(%rcx)
	vpextrd	$0, %xmm8, 716(%rcx)
	vmovdqu	11392(%rsp), %ymm8
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
	vmovdqu	%xmm9, 720(%rcx)
	vpextrd	$0, %xmm8, 736(%rcx)
	vmovdqu	11424(%rsp), %ymm8
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
	vmovdqu	%xmm9, 740(%rcx)
	vpextrd	$0, %xmm8, 756(%rcx)
	vmovdqu	11456(%rsp), %ymm8
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
	vmovdqu	%xmm9, 760(%rcx)
	vpextrd	$0, %xmm8, 776(%rcx)
	vmovdqu	11488(%rsp), %ymm8
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
	vmovdqu	%xmm9, 780(%rcx)
	vpextrd	$0, %xmm8, 796(%rcx)
	vmovdqu	11520(%rsp), %ymm8
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
	vmovdqu	%xmm9, 800(%rcx)
	vpextrd	$0, %xmm8, 816(%rcx)
	vmovdqu	11552(%rsp), %ymm8
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
	vmovdqu	%xmm9, 820(%rcx)
	vpextrd	$0, %xmm8, 836(%rcx)
	vmovdqu	11584(%rsp), %ymm8
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
	vmovdqu	%xmm9, 840(%rcx)
	vpextrd	$0, %xmm8, 856(%rcx)
	vmovdqu	11616(%rsp), %ymm8
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
	vmovdqu	%xmm9, 860(%rcx)
	vpextrd	$0, %xmm8, 876(%rcx)
	vmovdqu	11648(%rsp), %ymm8
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
	vmovdqu	%xmm9, 880(%rcx)
	vpextrd	$0, %xmm8, 896(%rcx)
	vmovdqu	11680(%rsp), %ymm8
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
	vmovdqu	%xmm9, 900(%rcx)
	vpextrd	$0, %xmm8, 916(%rcx)
	vmovdqu	11712(%rsp), %ymm8
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
	vmovdqu	%xmm9, 920(%rcx)
	vpextrd	$0, %xmm8, 936(%rcx)
	vmovdqu	11744(%rsp), %ymm8
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
	vmovdqu	%xmm1, 940(%rcx)
	vpextrd	$0, %xmm0, 956(%rcx)
	leaq	960(%rax), %rax
	leaq	1184(%rsp), %rdx
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$1:
	movq	16392(%rsp), %rax
	movq	96(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	104(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	112(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	120(%rsp), %rcx
	movq	%rcx, 24(%rax)
	movq	%mm1, %rax
	movq	%mm2, %rcx
	movq	2208(%rsp), %rdx
	movq	%rdx, (%rax)
	movq	2216(%rsp), %rdx
	movq	%rdx, 8(%rax)
	movq	2224(%rsp), %rdx
	movq	%rdx, 16(%rax)
	movq	2232(%rsp), %rdx
	movq	%rdx, 24(%rax)
	movq	2240(%rsp), %rdx
	movq	%rdx, 32(%rax)
	movq	2248(%rsp), %rdx
	movq	%rdx, 40(%rax)
	movq	2256(%rsp), %rdx
	movq	%rdx, 48(%rax)
	movq	2264(%rsp), %rdx
	movq	%rdx, 56(%rax)
	movq	2272(%rsp), %rdx
	movq	%rdx, 64(%rax)
	movq	2280(%rsp), %rdx
	movq	%rdx, 72(%rax)
	movq	2288(%rsp), %rdx
	movq	%rdx, 80(%rax)
	movq	2296(%rsp), %rdx
	movq	%rdx, 88(%rax)
	movq	2304(%rsp), %rdx
	movq	%rdx, 96(%rax)
	movq	2312(%rsp), %rdx
	movq	%rdx, 104(%rax)
	movq	2320(%rsp), %rdx
	movq	%rdx, 112(%rax)
	movq	2328(%rsp), %rdx
	movq	%rdx, 120(%rax)
	movq	2336(%rsp), %rdx
	movq	%rdx, 128(%rax)
	movq	2344(%rsp), %rdx
	movq	%rdx, 136(%rax)
	movq	2352(%rsp), %rdx
	movq	%rdx, 144(%rax)
	movq	2360(%rsp), %rdx
	movq	%rdx, 152(%rax)
	movq	2368(%rsp), %rdx
	movq	%rdx, 160(%rax)
	movq	2376(%rsp), %rdx
	movq	%rdx, 168(%rax)
	movq	2384(%rsp), %rdx
	movq	%rdx, 176(%rax)
	movq	2392(%rsp), %rdx
	movq	%rdx, 184(%rax)
	movq	2400(%rsp), %rdx
	movq	%rdx, 192(%rax)
	movq	2408(%rsp), %rdx
	movq	%rdx, 200(%rax)
	movq	2416(%rsp), %rdx
	movq	%rdx, 208(%rax)
	movq	2424(%rsp), %rdx
	movq	%rdx, 216(%rax)
	movq	2432(%rsp), %rdx
	movq	%rdx, 224(%rax)
	movq	2440(%rsp), %rdx
	movq	%rdx, 232(%rax)
	movq	2448(%rsp), %rdx
	movq	%rdx, 240(%rax)
	movq	2456(%rsp), %rdx
	movq	%rdx, 248(%rax)
	movq	2464(%rsp), %rdx
	movq	%rdx, 256(%rax)
	movq	2472(%rsp), %rdx
	movq	%rdx, 264(%rax)
	movq	2480(%rsp), %rdx
	movq	%rdx, 272(%rax)
	movq	2488(%rsp), %rdx
	movq	%rdx, 280(%rax)
	movq	2496(%rsp), %rdx
	movq	%rdx, 288(%rax)
	movq	2504(%rsp), %rdx
	movq	%rdx, 296(%rax)
	movq	2512(%rsp), %rdx
	movq	%rdx, 304(%rax)
	movq	2520(%rsp), %rdx
	movq	%rdx, 312(%rax)
	movq	2528(%rsp), %rdx
	movq	%rdx, 320(%rax)
	movq	2536(%rsp), %rdx
	movq	%rdx, 328(%rax)
	movq	2544(%rsp), %rdx
	movq	%rdx, 336(%rax)
	movq	2552(%rsp), %rdx
	movq	%rdx, 344(%rax)
	movq	2560(%rsp), %rdx
	movq	%rdx, 352(%rax)
	movq	2568(%rsp), %rdx
	movq	%rdx, 360(%rax)
	movq	2576(%rsp), %rdx
	movq	%rdx, 368(%rax)
	movq	2584(%rsp), %rdx
	movq	%rdx, 376(%rax)
	movq	2592(%rsp), %rdx
	movq	%rdx, 384(%rax)
	movq	2600(%rsp), %rdx
	movq	%rdx, 392(%rax)
	movq	2608(%rsp), %rdx
	movq	%rdx, 400(%rax)
	movq	2616(%rsp), %rdx
	movq	%rdx, 408(%rax)
	movq	2624(%rsp), %rdx
	movq	%rdx, 416(%rax)
	movq	2632(%rsp), %rdx
	movq	%rdx, 424(%rax)
	movq	2640(%rsp), %rdx
	movq	%rdx, 432(%rax)
	movq	2648(%rsp), %rdx
	movq	%rdx, 440(%rax)
	movq	2656(%rsp), %rdx
	movq	%rdx, 448(%rax)
	movq	2664(%rsp), %rdx
	movq	%rdx, 456(%rax)
	movq	2672(%rsp), %rdx
	movq	%rdx, 464(%rax)
	movq	2680(%rsp), %rdx
	movq	%rdx, 472(%rax)
	movq	2688(%rsp), %rdx
	movq	%rdx, 480(%rax)
	movq	2696(%rsp), %rdx
	movq	%rdx, 488(%rax)
	movq	2704(%rsp), %rdx
	movq	%rdx, 496(%rax)
	movq	2712(%rsp), %rdx
	movq	%rdx, 504(%rax)
	movq	2720(%rsp), %rdx
	movq	%rdx, 512(%rax)
	movq	2728(%rsp), %rdx
	movq	%rdx, 520(%rax)
	movq	2736(%rsp), %rdx
	movq	%rdx, 528(%rax)
	movq	2744(%rsp), %rdx
	movq	%rdx, 536(%rax)
	movq	2752(%rsp), %rdx
	movq	%rdx, 544(%rax)
	movq	2760(%rsp), %rdx
	movq	%rdx, 552(%rax)
	movq	2768(%rsp), %rdx
	movq	%rdx, 560(%rax)
	movq	2776(%rsp), %rdx
	movq	%rdx, 568(%rax)
	movq	2784(%rsp), %rdx
	movq	%rdx, 576(%rax)
	movq	2792(%rsp), %rdx
	movq	%rdx, 584(%rax)
	movq	2800(%rsp), %rdx
	movq	%rdx, 592(%rax)
	movq	2808(%rsp), %rdx
	movq	%rdx, 600(%rax)
	movq	2816(%rsp), %rdx
	movq	%rdx, 608(%rax)
	movq	2824(%rsp), %rdx
	movq	%rdx, 616(%rax)
	movq	2832(%rsp), %rdx
	movq	%rdx, 624(%rax)
	movq	2840(%rsp), %rdx
	movq	%rdx, 632(%rax)
	movq	2848(%rsp), %rdx
	movq	%rdx, 640(%rax)
	movq	2856(%rsp), %rdx
	movq	%rdx, 648(%rax)
	movq	2864(%rsp), %rdx
	movq	%rdx, 656(%rax)
	movq	2872(%rsp), %rdx
	movq	%rdx, 664(%rax)
	movq	2880(%rsp), %rdx
	movq	%rdx, 672(%rax)
	movq	2888(%rsp), %rdx
	movq	%rdx, 680(%rax)
	movq	2896(%rsp), %rdx
	movq	%rdx, 688(%rax)
	movq	2904(%rsp), %rdx
	movq	%rdx, 696(%rax)
	movq	2912(%rsp), %rdx
	movq	%rdx, 704(%rax)
	movq	2920(%rsp), %rdx
	movq	%rdx, 712(%rax)
	movq	2928(%rsp), %rdx
	movq	%rdx, 720(%rax)
	movq	2936(%rsp), %rdx
	movq	%rdx, 728(%rax)
	movq	2944(%rsp), %rdx
	movq	%rdx, 736(%rax)
	movq	2952(%rsp), %rdx
	movq	%rdx, 744(%rax)
	movq	2960(%rsp), %rdx
	movq	%rdx, 752(%rax)
	movq	2968(%rsp), %rdx
	movq	%rdx, 760(%rax)
	movq	2976(%rsp), %rdx
	movq	%rdx, 768(%rax)
	movq	2984(%rsp), %rdx
	movq	%rdx, 776(%rax)
	movq	2992(%rsp), %rdx
	movq	%rdx, 784(%rax)
	movq	3000(%rsp), %rdx
	movq	%rdx, 792(%rax)
	movq	3008(%rsp), %rdx
	movq	%rdx, 800(%rax)
	movq	3016(%rsp), %rdx
	movq	%rdx, 808(%rax)
	movq	3024(%rsp), %rdx
	movq	%rdx, 816(%rax)
	movq	3032(%rsp), %rdx
	movq	%rdx, 824(%rax)
	movq	3040(%rsp), %rdx
	movq	%rdx, 832(%rax)
	movq	3048(%rsp), %rdx
	movq	%rdx, 840(%rax)
	movq	3056(%rsp), %rdx
	movq	%rdx, 848(%rax)
	movq	3064(%rsp), %rdx
	movq	%rdx, 856(%rax)
	movq	3072(%rsp), %rdx
	movq	%rdx, 864(%rax)
	movq	3080(%rsp), %rdx
	movq	%rdx, 872(%rax)
	movq	3088(%rsp), %rdx
	movq	%rdx, 880(%rax)
	movq	3096(%rsp), %rdx
	movq	%rdx, 888(%rax)
	movq	3104(%rsp), %rdx
	movq	%rdx, 896(%rax)
	movq	3112(%rsp), %rdx
	movq	%rdx, 904(%rax)
	movq	3120(%rsp), %rdx
	movq	%rdx, 912(%rax)
	movq	3128(%rsp), %rdx
	movq	%rdx, 920(%rax)
	movq	3136(%rsp), %rdx
	movq	%rdx, 928(%rax)
	movq	3144(%rsp), %rdx
	movq	%rdx, 936(%rax)
	movq	3152(%rsp), %rdx
	movq	%rdx, 944(%rax)
	movq	3160(%rsp), %rdx
	movq	%rdx, 952(%rax)
	movq	3168(%rsp), %rdx
	movq	%rdx, 960(%rax)
	movq	3176(%rsp), %rdx
	movq	%rdx, 968(%rax)
	movq	3184(%rsp), %rdx
	movq	%rdx, 976(%rax)
	movq	3192(%rsp), %rdx
	movq	%rdx, 984(%rax)
	movq	3200(%rsp), %rdx
	movq	%rdx, 992(%rax)
	movq	3208(%rsp), %rdx
	movq	%rdx, 1000(%rax)
	movq	3216(%rsp), %rdx
	movq	%rdx, 1008(%rax)
	movq	3224(%rsp), %rdx
	movq	%rdx, 1016(%rax)
	movq	3232(%rsp), %rdx
	movq	%rdx, 1024(%rax)
	movq	3240(%rsp), %rdx
	movq	%rdx, 1032(%rax)
	movq	3248(%rsp), %rdx
	movq	%rdx, 1040(%rax)
	movq	3256(%rsp), %rdx
	movq	%rdx, 1048(%rax)
	movq	3264(%rsp), %rdx
	movq	%rdx, 1056(%rax)
	movq	3272(%rsp), %rdx
	movq	%rdx, 1064(%rax)
	movq	3280(%rsp), %rdx
	movq	%rdx, 1072(%rax)
	movq	3288(%rsp), %rdx
	movq	%rdx, 1080(%rax)
	movq	16400(%rsp), %rax
	movq	%rax, (%rcx)
	movq	16408(%rsp), %rax
	movq	%rax, 8(%rcx)
	movq	16416(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	16424(%rsp), %rax
	movq	%rax, 24(%rcx)
	xorq	%rax, %rax
	movq	16432(%rsp), %rbx
	movq	16440(%rsp), %rbp
	movq	16448(%rsp), %r12
	movq	16456(%rsp), %r13
	movq	16464(%rsp), %r14
	movq	16472(%rsp), %r15
	movq	16480(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand:
jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand:
	movq	%rsp, %rax
	leaq	-13608(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 13552(%rsp)
	movq	%rbp, 13560(%rsp)
	movq	%r12, 13568(%rsp)
	movq	%r13, 13576(%rsp)
	movq	%r14, 13584(%rsp)
	movq	%r15, 13592(%rsp)
	movq	%rax, 13600(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm1
	movq	%rsi, %mm2
	movq	(%rdx), %rax
	movq	%rax, 13488(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 13496(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 13504(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 13512(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 13520(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 13528(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 13536(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 13544(%rsp)
	leaq	608(%rsp), %rax
	leaq	6400(%rsp), %rcx
	leaq	13488(%rsp), %rdx
	movq	%rdx, %mm3
	movq	%rax, %mm4
	movq	%rcx, %mm5
	movq	(%rdx), %rax
	movq	%rax, 13408(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 13416(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 13424(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 13432(%rsp)
	movb	$3, 13440(%rsp)
	leaq	32(%rsp), %rax
	leaq	13408(%rsp), %rcx
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$38:
	movq	32(%rsp), %rax
	movq	%rax, (%rsp)
	movq	64(%rsp), %rax
	movq	%rax, 13456(%rsp)
	movq	40(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	72(%rsp), %rax
	movq	%rax, 13464(%rsp)
	movq	48(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	80(%rsp), %rax
	movq	%rax, 13472(%rsp)
	movq	56(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	88(%rsp), %rax
	movq	%rax, 13480(%rsp)
	movq	$0, %rdx
	leaq	8800(%rsp), %rcx
	movq	%rsp, %rdi
	leaq	-2200(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$37:
	leaq	2200(%rsp), %rsp
	movb	$0, %bpl
	leaq	3328(%rsp), %rsi
	leaq	3840(%rsp), %r10
	leaq	4352(%rsp), %r11
	leaq	1792(%rsp), %rbx
	leaq	13456(%rsp), %r9
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$36:
	leaq	600(%rsp), %rsp
	movb	$4, %bpl
	leaq	2304(%rsp), %rsi
	leaq	2816(%rsp), %r10
	leaq	4864(%rsp), %r11
	leaq	5376(%rsp), %rbx
	leaq	13456(%rsp), %r9
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$35:
	leaq	600(%rsp), %rsp
	leaq	3328(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$34:
	leaq	3840(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$33:
	leaq	4352(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$32:
	leaq	1792(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$31:
	leaq	2304(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$30:
	leaq	2816(%rsp), %rdx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$29:
	leaq	4864(%rsp), %rdx
	leaq	8800(%rsp), %rsi
	leaq	3328(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$28:
	leaq	96(%rsp), %rdx
	leaq	9312(%rsp), %rsi
	leaq	3840(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$27:
	leaq	4864(%rsp), %rdx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$26:
	leaq	96(%rsp), %rdx
	leaq	9824(%rsp), %rsi
	leaq	4352(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$25:
	leaq	4864(%rsp), %rdx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$24:
	leaq	4864(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$23:
	leaq	5376(%rsp), %rdx
	leaq	10336(%rsp), %rsi
	leaq	3328(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$22:
	leaq	96(%rsp), %rdx
	leaq	10848(%rsp), %rsi
	leaq	3840(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$21:
	leaq	5376(%rsp), %rdx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$20:
	leaq	96(%rsp), %rdx
	leaq	11360(%rsp), %rsi
	leaq	4352(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$19:
	leaq	5376(%rsp), %rdx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$18:
	leaq	5376(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$17:
	leaq	5888(%rsp), %rdx
	leaq	11872(%rsp), %rsi
	leaq	3328(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$16:
	leaq	96(%rsp), %rdx
	leaq	12384(%rsp), %rsi
	leaq	3840(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$15:
	leaq	5888(%rsp), %rdx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$14:
	leaq	96(%rsp), %rdx
	leaq	12896(%rsp), %rsi
	leaq	4352(%rsp), %rdi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$13:
	leaq	5888(%rsp), %rdx
	leaq	96(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$12:
	leaq	5888(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$11:
	leaq	4864(%rsp), %rdx
	leaq	1792(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$10:
	leaq	5376(%rsp), %rdx
	leaq	2304(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$9:
	leaq	5888(%rsp), %rdx
	leaq	2816(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$8:
	leaq	4864(%rsp), %rax
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
	leaq	5376(%rsp), %rax
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
	leaq	5888(%rsp), %rax
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
	movq	%mm4, %rcx
	movq	%mm5, %rax
	movq	%rax, %rsi
	movq	%rsi, %rdi
	leaq	3328(%rsp), %rdx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$7:
	leaq	384(%rsi), %rdi
	leaq	3840(%rsp), %rdx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$6:
	leaq	768(%rsi), %rdi
	leaq	4352(%rsp), %rdx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$5:
	movq	%rcx, %rsi
	movq	%rsi, %rdi
	leaq	4864(%rsp), %rdx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$4:
	leaq	384(%rsi), %rdi
	leaq	5376(%rsp), %rdx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$3:
	leaq	768(%rsi), %rdi
	leaq	5888(%rsp), %rdx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$2:
	movq	(%rsp), %rdx
	movq	%rdx, 1152(%rcx)
	movq	8(%rsp), %rdx
	movq	%rdx, 1160(%rcx)
	movq	16(%rsp), %rdx
	movq	%rdx, 1168(%rcx)
	movq	24(%rsp), %rdx
	movq	%rdx, 1176(%rcx)
	movq	(%rcx), %rdx
	movq	%rdx, 1152(%rax)
	movq	8(%rcx), %rdx
	movq	%rdx, 1160(%rax)
	movq	16(%rcx), %rdx
	movq	%rdx, 1168(%rax)
	movq	24(%rcx), %rdx
	movq	%rdx, 1176(%rax)
	movq	32(%rcx), %rdx
	movq	%rdx, 1184(%rax)
	movq	40(%rcx), %rdx
	movq	%rdx, 1192(%rax)
	movq	48(%rcx), %rdx
	movq	%rdx, 1200(%rax)
	movq	56(%rcx), %rdx
	movq	%rdx, 1208(%rax)
	movq	64(%rcx), %rdx
	movq	%rdx, 1216(%rax)
	movq	72(%rcx), %rdx
	movq	%rdx, 1224(%rax)
	movq	80(%rcx), %rdx
	movq	%rdx, 1232(%rax)
	movq	88(%rcx), %rdx
	movq	%rdx, 1240(%rax)
	movq	96(%rcx), %rdx
	movq	%rdx, 1248(%rax)
	movq	104(%rcx), %rdx
	movq	%rdx, 1256(%rax)
	movq	112(%rcx), %rdx
	movq	%rdx, 1264(%rax)
	movq	120(%rcx), %rdx
	movq	%rdx, 1272(%rax)
	movq	128(%rcx), %rdx
	movq	%rdx, 1280(%rax)
	movq	136(%rcx), %rdx
	movq	%rdx, 1288(%rax)
	movq	144(%rcx), %rdx
	movq	%rdx, 1296(%rax)
	movq	152(%rcx), %rdx
	movq	%rdx, 1304(%rax)
	movq	160(%rcx), %rdx
	movq	%rdx, 1312(%rax)
	movq	168(%rcx), %rdx
	movq	%rdx, 1320(%rax)
	movq	176(%rcx), %rdx
	movq	%rdx, 1328(%rax)
	movq	184(%rcx), %rdx
	movq	%rdx, 1336(%rax)
	movq	192(%rcx), %rdx
	movq	%rdx, 1344(%rax)
	movq	200(%rcx), %rdx
	movq	%rdx, 1352(%rax)
	movq	208(%rcx), %rdx
	movq	%rdx, 1360(%rax)
	movq	216(%rcx), %rdx
	movq	%rdx, 1368(%rax)
	movq	224(%rcx), %rdx
	movq	%rdx, 1376(%rax)
	movq	232(%rcx), %rdx
	movq	%rdx, 1384(%rax)
	movq	240(%rcx), %rdx
	movq	%rdx, 1392(%rax)
	movq	248(%rcx), %rdx
	movq	%rdx, 1400(%rax)
	movq	256(%rcx), %rdx
	movq	%rdx, 1408(%rax)
	movq	264(%rcx), %rdx
	movq	%rdx, 1416(%rax)
	movq	272(%rcx), %rdx
	movq	%rdx, 1424(%rax)
	movq	280(%rcx), %rdx
	movq	%rdx, 1432(%rax)
	movq	288(%rcx), %rdx
	movq	%rdx, 1440(%rax)
	movq	296(%rcx), %rdx
	movq	%rdx, 1448(%rax)
	movq	304(%rcx), %rdx
	movq	%rdx, 1456(%rax)
	movq	312(%rcx), %rdx
	movq	%rdx, 1464(%rax)
	movq	320(%rcx), %rdx
	movq	%rdx, 1472(%rax)
	movq	328(%rcx), %rdx
	movq	%rdx, 1480(%rax)
	movq	336(%rcx), %rdx
	movq	%rdx, 1488(%rax)
	movq	344(%rcx), %rdx
	movq	%rdx, 1496(%rax)
	movq	352(%rcx), %rdx
	movq	%rdx, 1504(%rax)
	movq	360(%rcx), %rdx
	movq	%rdx, 1512(%rax)
	movq	368(%rcx), %rdx
	movq	%rdx, 1520(%rax)
	movq	376(%rcx), %rdx
	movq	%rdx, 1528(%rax)
	movq	384(%rcx), %rdx
	movq	%rdx, 1536(%rax)
	movq	392(%rcx), %rdx
	movq	%rdx, 1544(%rax)
	movq	400(%rcx), %rdx
	movq	%rdx, 1552(%rax)
	movq	408(%rcx), %rdx
	movq	%rdx, 1560(%rax)
	movq	416(%rcx), %rdx
	movq	%rdx, 1568(%rax)
	movq	424(%rcx), %rdx
	movq	%rdx, 1576(%rax)
	movq	432(%rcx), %rdx
	movq	%rdx, 1584(%rax)
	movq	440(%rcx), %rdx
	movq	%rdx, 1592(%rax)
	movq	448(%rcx), %rdx
	movq	%rdx, 1600(%rax)
	movq	456(%rcx), %rdx
	movq	%rdx, 1608(%rax)
	movq	464(%rcx), %rdx
	movq	%rdx, 1616(%rax)
	movq	472(%rcx), %rdx
	movq	%rdx, 1624(%rax)
	movq	480(%rcx), %rdx
	movq	%rdx, 1632(%rax)
	movq	488(%rcx), %rdx
	movq	%rdx, 1640(%rax)
	movq	496(%rcx), %rdx
	movq	%rdx, 1648(%rax)
	movq	504(%rcx), %rdx
	movq	%rdx, 1656(%rax)
	movq	512(%rcx), %rdx
	movq	%rdx, 1664(%rax)
	movq	520(%rcx), %rdx
	movq	%rdx, 1672(%rax)
	movq	528(%rcx), %rdx
	movq	%rdx, 1680(%rax)
	movq	536(%rcx), %rdx
	movq	%rdx, 1688(%rax)
	movq	544(%rcx), %rdx
	movq	%rdx, 1696(%rax)
	movq	552(%rcx), %rdx
	movq	%rdx, 1704(%rax)
	movq	560(%rcx), %rdx
	movq	%rdx, 1712(%rax)
	movq	568(%rcx), %rdx
	movq	%rdx, 1720(%rax)
	movq	576(%rcx), %rdx
	movq	%rdx, 1728(%rax)
	movq	584(%rcx), %rdx
	movq	%rdx, 1736(%rax)
	movq	592(%rcx), %rdx
	movq	%rdx, 1744(%rax)
	movq	600(%rcx), %rdx
	movq	%rdx, 1752(%rax)
	movq	608(%rcx), %rdx
	movq	%rdx, 1760(%rax)
	movq	616(%rcx), %rdx
	movq	%rdx, 1768(%rax)
	movq	624(%rcx), %rdx
	movq	%rdx, 1776(%rax)
	movq	632(%rcx), %rdx
	movq	%rdx, 1784(%rax)
	movq	640(%rcx), %rdx
	movq	%rdx, 1792(%rax)
	movq	648(%rcx), %rdx
	movq	%rdx, 1800(%rax)
	movq	656(%rcx), %rdx
	movq	%rdx, 1808(%rax)
	movq	664(%rcx), %rdx
	movq	%rdx, 1816(%rax)
	movq	672(%rcx), %rdx
	movq	%rdx, 1824(%rax)
	movq	680(%rcx), %rdx
	movq	%rdx, 1832(%rax)
	movq	688(%rcx), %rdx
	movq	%rdx, 1840(%rax)
	movq	696(%rcx), %rdx
	movq	%rdx, 1848(%rax)
	movq	704(%rcx), %rdx
	movq	%rdx, 1856(%rax)
	movq	712(%rcx), %rdx
	movq	%rdx, 1864(%rax)
	movq	720(%rcx), %rdx
	movq	%rdx, 1872(%rax)
	movq	728(%rcx), %rdx
	movq	%rdx, 1880(%rax)
	movq	736(%rcx), %rdx
	movq	%rdx, 1888(%rax)
	movq	744(%rcx), %rdx
	movq	%rdx, 1896(%rax)
	movq	752(%rcx), %rdx
	movq	%rdx, 1904(%rax)
	movq	760(%rcx), %rdx
	movq	%rdx, 1912(%rax)
	movq	768(%rcx), %rdx
	movq	%rdx, 1920(%rax)
	movq	776(%rcx), %rdx
	movq	%rdx, 1928(%rax)
	movq	784(%rcx), %rdx
	movq	%rdx, 1936(%rax)
	movq	792(%rcx), %rdx
	movq	%rdx, 1944(%rax)
	movq	800(%rcx), %rdx
	movq	%rdx, 1952(%rax)
	movq	808(%rcx), %rdx
	movq	%rdx, 1960(%rax)
	movq	816(%rcx), %rdx
	movq	%rdx, 1968(%rax)
	movq	824(%rcx), %rdx
	movq	%rdx, 1976(%rax)
	movq	832(%rcx), %rdx
	movq	%rdx, 1984(%rax)
	movq	840(%rcx), %rdx
	movq	%rdx, 1992(%rax)
	movq	848(%rcx), %rdx
	movq	%rdx, 2000(%rax)
	movq	856(%rcx), %rdx
	movq	%rdx, 2008(%rax)
	movq	864(%rcx), %rdx
	movq	%rdx, 2016(%rax)
	movq	872(%rcx), %rdx
	movq	%rdx, 2024(%rax)
	movq	880(%rcx), %rdx
	movq	%rdx, 2032(%rax)
	movq	888(%rcx), %rdx
	movq	%rdx, 2040(%rax)
	movq	896(%rcx), %rdx
	movq	%rdx, 2048(%rax)
	movq	904(%rcx), %rdx
	movq	%rdx, 2056(%rax)
	movq	912(%rcx), %rdx
	movq	%rdx, 2064(%rax)
	movq	920(%rcx), %rdx
	movq	%rdx, 2072(%rax)
	movq	928(%rcx), %rdx
	movq	%rdx, 2080(%rax)
	movq	936(%rcx), %rdx
	movq	%rdx, 2088(%rax)
	movq	944(%rcx), %rdx
	movq	%rdx, 2096(%rax)
	movq	952(%rcx), %rdx
	movq	%rdx, 2104(%rax)
	movq	960(%rcx), %rdx
	movq	%rdx, 2112(%rax)
	movq	968(%rcx), %rdx
	movq	%rdx, 2120(%rax)
	movq	976(%rcx), %rdx
	movq	%rdx, 2128(%rax)
	movq	984(%rcx), %rdx
	movq	%rdx, 2136(%rax)
	movq	992(%rcx), %rdx
	movq	%rdx, 2144(%rax)
	movq	1000(%rcx), %rdx
	movq	%rdx, 2152(%rax)
	movq	1008(%rcx), %rdx
	movq	%rdx, 2160(%rax)
	movq	1016(%rcx), %rdx
	movq	%rdx, 2168(%rax)
	movq	1024(%rcx), %rdx
	movq	%rdx, 2176(%rax)
	movq	1032(%rcx), %rdx
	movq	%rdx, 2184(%rax)
	movq	1040(%rcx), %rdx
	movq	%rdx, 2192(%rax)
	movq	1048(%rcx), %rdx
	movq	%rdx, 2200(%rax)
	movq	1056(%rcx), %rdx
	movq	%rdx, 2208(%rax)
	movq	1064(%rcx), %rdx
	movq	%rdx, 2216(%rax)
	movq	1072(%rcx), %rdx
	movq	%rdx, 2224(%rax)
	movq	1080(%rcx), %rdx
	movq	%rdx, 2232(%rax)
	movq	1088(%rcx), %rdx
	movq	%rdx, 2240(%rax)
	movq	1096(%rcx), %rdx
	movq	%rdx, 2248(%rax)
	movq	1104(%rcx), %rdx
	movq	%rdx, 2256(%rax)
	movq	1112(%rcx), %rdx
	movq	%rdx, 2264(%rax)
	movq	1120(%rcx), %rdx
	movq	%rdx, 2272(%rax)
	movq	1128(%rcx), %rdx
	movq	%rdx, 2280(%rax)
	movq	1136(%rcx), %rdx
	movq	%rdx, 2288(%rax)
	movq	1144(%rcx), %rdx
	movq	%rdx, 2296(%rax)
	movq	1152(%rcx), %rdx
	movq	%rdx, 2304(%rax)
	movq	1160(%rcx), %rdx
	movq	%rdx, 2312(%rax)
	movq	1168(%rcx), %rdx
	movq	%rdx, 2320(%rax)
	movq	1176(%rcx), %rdx
	movq	%rdx, 2328(%rax)
	movq	%rax, 13448(%rsp)
	movq	%rsp, %rdx
	call	L_sha3_256A_A1184$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$1:
	movq	13448(%rsp), %rax
	movq	(%rsp), %rcx
	movq	%rcx, 2336(%rax)
	movq	8(%rsp), %rcx
	movq	%rcx, 2344(%rax)
	movq	16(%rsp), %rcx
	movq	%rcx, 2352(%rax)
	movq	24(%rsp), %rcx
	movq	%rcx, 2360(%rax)
	movq	%mm3, %rcx
	leaq	32(%rcx), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, 2368(%rax)
	movq	8(%rcx), %rdx
	movq	%rdx, 2376(%rax)
	movq	16(%rcx), %rdx
	movq	%rdx, 2384(%rax)
	movq	24(%rcx), %rcx
	movq	%rcx, 2392(%rax)
	movq	%mm1, %rax
	movq	%mm2, %rcx
	movq	608(%rsp), %rdx
	movq	%rdx, (%rax)
	movq	616(%rsp), %rdx
	movq	%rdx, 8(%rax)
	movq	624(%rsp), %rdx
	movq	%rdx, 16(%rax)
	movq	632(%rsp), %rdx
	movq	%rdx, 24(%rax)
	movq	640(%rsp), %rdx
	movq	%rdx, 32(%rax)
	movq	648(%rsp), %rdx
	movq	%rdx, 40(%rax)
	movq	656(%rsp), %rdx
	movq	%rdx, 48(%rax)
	movq	664(%rsp), %rdx
	movq	%rdx, 56(%rax)
	movq	672(%rsp), %rdx
	movq	%rdx, 64(%rax)
	movq	680(%rsp), %rdx
	movq	%rdx, 72(%rax)
	movq	688(%rsp), %rdx
	movq	%rdx, 80(%rax)
	movq	696(%rsp), %rdx
	movq	%rdx, 88(%rax)
	movq	704(%rsp), %rdx
	movq	%rdx, 96(%rax)
	movq	712(%rsp), %rdx
	movq	%rdx, 104(%rax)
	movq	720(%rsp), %rdx
	movq	%rdx, 112(%rax)
	movq	728(%rsp), %rdx
	movq	%rdx, 120(%rax)
	movq	736(%rsp), %rdx
	movq	%rdx, 128(%rax)
	movq	744(%rsp), %rdx
	movq	%rdx, 136(%rax)
	movq	752(%rsp), %rdx
	movq	%rdx, 144(%rax)
	movq	760(%rsp), %rdx
	movq	%rdx, 152(%rax)
	movq	768(%rsp), %rdx
	movq	%rdx, 160(%rax)
	movq	776(%rsp), %rdx
	movq	%rdx, 168(%rax)
	movq	784(%rsp), %rdx
	movq	%rdx, 176(%rax)
	movq	792(%rsp), %rdx
	movq	%rdx, 184(%rax)
	movq	800(%rsp), %rdx
	movq	%rdx, 192(%rax)
	movq	808(%rsp), %rdx
	movq	%rdx, 200(%rax)
	movq	816(%rsp), %rdx
	movq	%rdx, 208(%rax)
	movq	824(%rsp), %rdx
	movq	%rdx, 216(%rax)
	movq	832(%rsp), %rdx
	movq	%rdx, 224(%rax)
	movq	840(%rsp), %rdx
	movq	%rdx, 232(%rax)
	movq	848(%rsp), %rdx
	movq	%rdx, 240(%rax)
	movq	856(%rsp), %rdx
	movq	%rdx, 248(%rax)
	movq	864(%rsp), %rdx
	movq	%rdx, 256(%rax)
	movq	872(%rsp), %rdx
	movq	%rdx, 264(%rax)
	movq	880(%rsp), %rdx
	movq	%rdx, 272(%rax)
	movq	888(%rsp), %rdx
	movq	%rdx, 280(%rax)
	movq	896(%rsp), %rdx
	movq	%rdx, 288(%rax)
	movq	904(%rsp), %rdx
	movq	%rdx, 296(%rax)
	movq	912(%rsp), %rdx
	movq	%rdx, 304(%rax)
	movq	920(%rsp), %rdx
	movq	%rdx, 312(%rax)
	movq	928(%rsp), %rdx
	movq	%rdx, 320(%rax)
	movq	936(%rsp), %rdx
	movq	%rdx, 328(%rax)
	movq	944(%rsp), %rdx
	movq	%rdx, 336(%rax)
	movq	952(%rsp), %rdx
	movq	%rdx, 344(%rax)
	movq	960(%rsp), %rdx
	movq	%rdx, 352(%rax)
	movq	968(%rsp), %rdx
	movq	%rdx, 360(%rax)
	movq	976(%rsp), %rdx
	movq	%rdx, 368(%rax)
	movq	984(%rsp), %rdx
	movq	%rdx, 376(%rax)
	movq	992(%rsp), %rdx
	movq	%rdx, 384(%rax)
	movq	1000(%rsp), %rdx
	movq	%rdx, 392(%rax)
	movq	1008(%rsp), %rdx
	movq	%rdx, 400(%rax)
	movq	1016(%rsp), %rdx
	movq	%rdx, 408(%rax)
	movq	1024(%rsp), %rdx
	movq	%rdx, 416(%rax)
	movq	1032(%rsp), %rdx
	movq	%rdx, 424(%rax)
	movq	1040(%rsp), %rdx
	movq	%rdx, 432(%rax)
	movq	1048(%rsp), %rdx
	movq	%rdx, 440(%rax)
	movq	1056(%rsp), %rdx
	movq	%rdx, 448(%rax)
	movq	1064(%rsp), %rdx
	movq	%rdx, 456(%rax)
	movq	1072(%rsp), %rdx
	movq	%rdx, 464(%rax)
	movq	1080(%rsp), %rdx
	movq	%rdx, 472(%rax)
	movq	1088(%rsp), %rdx
	movq	%rdx, 480(%rax)
	movq	1096(%rsp), %rdx
	movq	%rdx, 488(%rax)
	movq	1104(%rsp), %rdx
	movq	%rdx, 496(%rax)
	movq	1112(%rsp), %rdx
	movq	%rdx, 504(%rax)
	movq	1120(%rsp), %rdx
	movq	%rdx, 512(%rax)
	movq	1128(%rsp), %rdx
	movq	%rdx, 520(%rax)
	movq	1136(%rsp), %rdx
	movq	%rdx, 528(%rax)
	movq	1144(%rsp), %rdx
	movq	%rdx, 536(%rax)
	movq	1152(%rsp), %rdx
	movq	%rdx, 544(%rax)
	movq	1160(%rsp), %rdx
	movq	%rdx, 552(%rax)
	movq	1168(%rsp), %rdx
	movq	%rdx, 560(%rax)
	movq	1176(%rsp), %rdx
	movq	%rdx, 568(%rax)
	movq	1184(%rsp), %rdx
	movq	%rdx, 576(%rax)
	movq	1192(%rsp), %rdx
	movq	%rdx, 584(%rax)
	movq	1200(%rsp), %rdx
	movq	%rdx, 592(%rax)
	movq	1208(%rsp), %rdx
	movq	%rdx, 600(%rax)
	movq	1216(%rsp), %rdx
	movq	%rdx, 608(%rax)
	movq	1224(%rsp), %rdx
	movq	%rdx, 616(%rax)
	movq	1232(%rsp), %rdx
	movq	%rdx, 624(%rax)
	movq	1240(%rsp), %rdx
	movq	%rdx, 632(%rax)
	movq	1248(%rsp), %rdx
	movq	%rdx, 640(%rax)
	movq	1256(%rsp), %rdx
	movq	%rdx, 648(%rax)
	movq	1264(%rsp), %rdx
	movq	%rdx, 656(%rax)
	movq	1272(%rsp), %rdx
	movq	%rdx, 664(%rax)
	movq	1280(%rsp), %rdx
	movq	%rdx, 672(%rax)
	movq	1288(%rsp), %rdx
	movq	%rdx, 680(%rax)
	movq	1296(%rsp), %rdx
	movq	%rdx, 688(%rax)
	movq	1304(%rsp), %rdx
	movq	%rdx, 696(%rax)
	movq	1312(%rsp), %rdx
	movq	%rdx, 704(%rax)
	movq	1320(%rsp), %rdx
	movq	%rdx, 712(%rax)
	movq	1328(%rsp), %rdx
	movq	%rdx, 720(%rax)
	movq	1336(%rsp), %rdx
	movq	%rdx, 728(%rax)
	movq	1344(%rsp), %rdx
	movq	%rdx, 736(%rax)
	movq	1352(%rsp), %rdx
	movq	%rdx, 744(%rax)
	movq	1360(%rsp), %rdx
	movq	%rdx, 752(%rax)
	movq	1368(%rsp), %rdx
	movq	%rdx, 760(%rax)
	movq	1376(%rsp), %rdx
	movq	%rdx, 768(%rax)
	movq	1384(%rsp), %rdx
	movq	%rdx, 776(%rax)
	movq	1392(%rsp), %rdx
	movq	%rdx, 784(%rax)
	movq	1400(%rsp), %rdx
	movq	%rdx, 792(%rax)
	movq	1408(%rsp), %rdx
	movq	%rdx, 800(%rax)
	movq	1416(%rsp), %rdx
	movq	%rdx, 808(%rax)
	movq	1424(%rsp), %rdx
	movq	%rdx, 816(%rax)
	movq	1432(%rsp), %rdx
	movq	%rdx, 824(%rax)
	movq	1440(%rsp), %rdx
	movq	%rdx, 832(%rax)
	movq	1448(%rsp), %rdx
	movq	%rdx, 840(%rax)
	movq	1456(%rsp), %rdx
	movq	%rdx, 848(%rax)
	movq	1464(%rsp), %rdx
	movq	%rdx, 856(%rax)
	movq	1472(%rsp), %rdx
	movq	%rdx, 864(%rax)
	movq	1480(%rsp), %rdx
	movq	%rdx, 872(%rax)
	movq	1488(%rsp), %rdx
	movq	%rdx, 880(%rax)
	movq	1496(%rsp), %rdx
	movq	%rdx, 888(%rax)
	movq	1504(%rsp), %rdx
	movq	%rdx, 896(%rax)
	movq	1512(%rsp), %rdx
	movq	%rdx, 904(%rax)
	movq	1520(%rsp), %rdx
	movq	%rdx, 912(%rax)
	movq	1528(%rsp), %rdx
	movq	%rdx, 920(%rax)
	movq	1536(%rsp), %rdx
	movq	%rdx, 928(%rax)
	movq	1544(%rsp), %rdx
	movq	%rdx, 936(%rax)
	movq	1552(%rsp), %rdx
	movq	%rdx, 944(%rax)
	movq	1560(%rsp), %rdx
	movq	%rdx, 952(%rax)
	movq	1568(%rsp), %rdx
	movq	%rdx, 960(%rax)
	movq	1576(%rsp), %rdx
	movq	%rdx, 968(%rax)
	movq	1584(%rsp), %rdx
	movq	%rdx, 976(%rax)
	movq	1592(%rsp), %rdx
	movq	%rdx, 984(%rax)
	movq	1600(%rsp), %rdx
	movq	%rdx, 992(%rax)
	movq	1608(%rsp), %rdx
	movq	%rdx, 1000(%rax)
	movq	1616(%rsp), %rdx
	movq	%rdx, 1008(%rax)
	movq	1624(%rsp), %rdx
	movq	%rdx, 1016(%rax)
	movq	1632(%rsp), %rdx
	movq	%rdx, 1024(%rax)
	movq	1640(%rsp), %rdx
	movq	%rdx, 1032(%rax)
	movq	1648(%rsp), %rdx
	movq	%rdx, 1040(%rax)
	movq	1656(%rsp), %rdx
	movq	%rdx, 1048(%rax)
	movq	1664(%rsp), %rdx
	movq	%rdx, 1056(%rax)
	movq	1672(%rsp), %rdx
	movq	%rdx, 1064(%rax)
	movq	1680(%rsp), %rdx
	movq	%rdx, 1072(%rax)
	movq	1688(%rsp), %rdx
	movq	%rdx, 1080(%rax)
	movq	1696(%rsp), %rdx
	movq	%rdx, 1088(%rax)
	movq	1704(%rsp), %rdx
	movq	%rdx, 1096(%rax)
	movq	1712(%rsp), %rdx
	movq	%rdx, 1104(%rax)
	movq	1720(%rsp), %rdx
	movq	%rdx, 1112(%rax)
	movq	1728(%rsp), %rdx
	movq	%rdx, 1120(%rax)
	movq	1736(%rsp), %rdx
	movq	%rdx, 1128(%rax)
	movq	1744(%rsp), %rdx
	movq	%rdx, 1136(%rax)
	movq	1752(%rsp), %rdx
	movq	%rdx, 1144(%rax)
	movq	1760(%rsp), %rdx
	movq	%rdx, 1152(%rax)
	movq	1768(%rsp), %rdx
	movq	%rdx, 1160(%rax)
	movq	1776(%rsp), %rdx
	movq	%rdx, 1168(%rax)
	movq	1784(%rsp), %rdx
	movq	%rdx, 1176(%rax)
	movq	6400(%rsp), %rax
	movq	%rax, (%rcx)
	movq	6408(%rsp), %rax
	movq	%rax, 8(%rcx)
	movq	6416(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	6424(%rsp), %rax
	movq	%rax, 24(%rcx)
	movq	6432(%rsp), %rax
	movq	%rax, 32(%rcx)
	movq	6440(%rsp), %rax
	movq	%rax, 40(%rcx)
	movq	6448(%rsp), %rax
	movq	%rax, 48(%rcx)
	movq	6456(%rsp), %rax
	movq	%rax, 56(%rcx)
	movq	6464(%rsp), %rax
	movq	%rax, 64(%rcx)
	movq	6472(%rsp), %rax
	movq	%rax, 72(%rcx)
	movq	6480(%rsp), %rax
	movq	%rax, 80(%rcx)
	movq	6488(%rsp), %rax
	movq	%rax, 88(%rcx)
	movq	6496(%rsp), %rax
	movq	%rax, 96(%rcx)
	movq	6504(%rsp), %rax
	movq	%rax, 104(%rcx)
	movq	6512(%rsp), %rax
	movq	%rax, 112(%rcx)
	movq	6520(%rsp), %rax
	movq	%rax, 120(%rcx)
	movq	6528(%rsp), %rax
	movq	%rax, 128(%rcx)
	movq	6536(%rsp), %rax
	movq	%rax, 136(%rcx)
	movq	6544(%rsp), %rax
	movq	%rax, 144(%rcx)
	movq	6552(%rsp), %rax
	movq	%rax, 152(%rcx)
	movq	6560(%rsp), %rax
	movq	%rax, 160(%rcx)
	movq	6568(%rsp), %rax
	movq	%rax, 168(%rcx)
	movq	6576(%rsp), %rax
	movq	%rax, 176(%rcx)
	movq	6584(%rsp), %rax
	movq	%rax, 184(%rcx)
	movq	6592(%rsp), %rax
	movq	%rax, 192(%rcx)
	movq	6600(%rsp), %rax
	movq	%rax, 200(%rcx)
	movq	6608(%rsp), %rax
	movq	%rax, 208(%rcx)
	movq	6616(%rsp), %rax
	movq	%rax, 216(%rcx)
	movq	6624(%rsp), %rax
	movq	%rax, 224(%rcx)
	movq	6632(%rsp), %rax
	movq	%rax, 232(%rcx)
	movq	6640(%rsp), %rax
	movq	%rax, 240(%rcx)
	movq	6648(%rsp), %rax
	movq	%rax, 248(%rcx)
	movq	6656(%rsp), %rax
	movq	%rax, 256(%rcx)
	movq	6664(%rsp), %rax
	movq	%rax, 264(%rcx)
	movq	6672(%rsp), %rax
	movq	%rax, 272(%rcx)
	movq	6680(%rsp), %rax
	movq	%rax, 280(%rcx)
	movq	6688(%rsp), %rax
	movq	%rax, 288(%rcx)
	movq	6696(%rsp), %rax
	movq	%rax, 296(%rcx)
	movq	6704(%rsp), %rax
	movq	%rax, 304(%rcx)
	movq	6712(%rsp), %rax
	movq	%rax, 312(%rcx)
	movq	6720(%rsp), %rax
	movq	%rax, 320(%rcx)
	movq	6728(%rsp), %rax
	movq	%rax, 328(%rcx)
	movq	6736(%rsp), %rax
	movq	%rax, 336(%rcx)
	movq	6744(%rsp), %rax
	movq	%rax, 344(%rcx)
	movq	6752(%rsp), %rax
	movq	%rax, 352(%rcx)
	movq	6760(%rsp), %rax
	movq	%rax, 360(%rcx)
	movq	6768(%rsp), %rax
	movq	%rax, 368(%rcx)
	movq	6776(%rsp), %rax
	movq	%rax, 376(%rcx)
	movq	6784(%rsp), %rax
	movq	%rax, 384(%rcx)
	movq	6792(%rsp), %rax
	movq	%rax, 392(%rcx)
	movq	6800(%rsp), %rax
	movq	%rax, 400(%rcx)
	movq	6808(%rsp), %rax
	movq	%rax, 408(%rcx)
	movq	6816(%rsp), %rax
	movq	%rax, 416(%rcx)
	movq	6824(%rsp), %rax
	movq	%rax, 424(%rcx)
	movq	6832(%rsp), %rax
	movq	%rax, 432(%rcx)
	movq	6840(%rsp), %rax
	movq	%rax, 440(%rcx)
	movq	6848(%rsp), %rax
	movq	%rax, 448(%rcx)
	movq	6856(%rsp), %rax
	movq	%rax, 456(%rcx)
	movq	6864(%rsp), %rax
	movq	%rax, 464(%rcx)
	movq	6872(%rsp), %rax
	movq	%rax, 472(%rcx)
	movq	6880(%rsp), %rax
	movq	%rax, 480(%rcx)
	movq	6888(%rsp), %rax
	movq	%rax, 488(%rcx)
	movq	6896(%rsp), %rax
	movq	%rax, 496(%rcx)
	movq	6904(%rsp), %rax
	movq	%rax, 504(%rcx)
	movq	6912(%rsp), %rax
	movq	%rax, 512(%rcx)
	movq	6920(%rsp), %rax
	movq	%rax, 520(%rcx)
	movq	6928(%rsp), %rax
	movq	%rax, 528(%rcx)
	movq	6936(%rsp), %rax
	movq	%rax, 536(%rcx)
	movq	6944(%rsp), %rax
	movq	%rax, 544(%rcx)
	movq	6952(%rsp), %rax
	movq	%rax, 552(%rcx)
	movq	6960(%rsp), %rax
	movq	%rax, 560(%rcx)
	movq	6968(%rsp), %rax
	movq	%rax, 568(%rcx)
	movq	6976(%rsp), %rax
	movq	%rax, 576(%rcx)
	movq	6984(%rsp), %rax
	movq	%rax, 584(%rcx)
	movq	6992(%rsp), %rax
	movq	%rax, 592(%rcx)
	movq	7000(%rsp), %rax
	movq	%rax, 600(%rcx)
	movq	7008(%rsp), %rax
	movq	%rax, 608(%rcx)
	movq	7016(%rsp), %rax
	movq	%rax, 616(%rcx)
	movq	7024(%rsp), %rax
	movq	%rax, 624(%rcx)
	movq	7032(%rsp), %rax
	movq	%rax, 632(%rcx)
	movq	7040(%rsp), %rax
	movq	%rax, 640(%rcx)
	movq	7048(%rsp), %rax
	movq	%rax, 648(%rcx)
	movq	7056(%rsp), %rax
	movq	%rax, 656(%rcx)
	movq	7064(%rsp), %rax
	movq	%rax, 664(%rcx)
	movq	7072(%rsp), %rax
	movq	%rax, 672(%rcx)
	movq	7080(%rsp), %rax
	movq	%rax, 680(%rcx)
	movq	7088(%rsp), %rax
	movq	%rax, 688(%rcx)
	movq	7096(%rsp), %rax
	movq	%rax, 696(%rcx)
	movq	7104(%rsp), %rax
	movq	%rax, 704(%rcx)
	movq	7112(%rsp), %rax
	movq	%rax, 712(%rcx)
	movq	7120(%rsp), %rax
	movq	%rax, 720(%rcx)
	movq	7128(%rsp), %rax
	movq	%rax, 728(%rcx)
	movq	7136(%rsp), %rax
	movq	%rax, 736(%rcx)
	movq	7144(%rsp), %rax
	movq	%rax, 744(%rcx)
	movq	7152(%rsp), %rax
	movq	%rax, 752(%rcx)
	movq	7160(%rsp), %rax
	movq	%rax, 760(%rcx)
	movq	7168(%rsp), %rax
	movq	%rax, 768(%rcx)
	movq	7176(%rsp), %rax
	movq	%rax, 776(%rcx)
	movq	7184(%rsp), %rax
	movq	%rax, 784(%rcx)
	movq	7192(%rsp), %rax
	movq	%rax, 792(%rcx)
	movq	7200(%rsp), %rax
	movq	%rax, 800(%rcx)
	movq	7208(%rsp), %rax
	movq	%rax, 808(%rcx)
	movq	7216(%rsp), %rax
	movq	%rax, 816(%rcx)
	movq	7224(%rsp), %rax
	movq	%rax, 824(%rcx)
	movq	7232(%rsp), %rax
	movq	%rax, 832(%rcx)
	movq	7240(%rsp), %rax
	movq	%rax, 840(%rcx)
	movq	7248(%rsp), %rax
	movq	%rax, 848(%rcx)
	movq	7256(%rsp), %rax
	movq	%rax, 856(%rcx)
	movq	7264(%rsp), %rax
	movq	%rax, 864(%rcx)
	movq	7272(%rsp), %rax
	movq	%rax, 872(%rcx)
	movq	7280(%rsp), %rax
	movq	%rax, 880(%rcx)
	movq	7288(%rsp), %rax
	movq	%rax, 888(%rcx)
	movq	7296(%rsp), %rax
	movq	%rax, 896(%rcx)
	movq	7304(%rsp), %rax
	movq	%rax, 904(%rcx)
	movq	7312(%rsp), %rax
	movq	%rax, 912(%rcx)
	movq	7320(%rsp), %rax
	movq	%rax, 920(%rcx)
	movq	7328(%rsp), %rax
	movq	%rax, 928(%rcx)
	movq	7336(%rsp), %rax
	movq	%rax, 936(%rcx)
	movq	7344(%rsp), %rax
	movq	%rax, 944(%rcx)
	movq	7352(%rsp), %rax
	movq	%rax, 952(%rcx)
	movq	7360(%rsp), %rax
	movq	%rax, 960(%rcx)
	movq	7368(%rsp), %rax
	movq	%rax, 968(%rcx)
	movq	7376(%rsp), %rax
	movq	%rax, 976(%rcx)
	movq	7384(%rsp), %rax
	movq	%rax, 984(%rcx)
	movq	7392(%rsp), %rax
	movq	%rax, 992(%rcx)
	movq	7400(%rsp), %rax
	movq	%rax, 1000(%rcx)
	movq	7408(%rsp), %rax
	movq	%rax, 1008(%rcx)
	movq	7416(%rsp), %rax
	movq	%rax, 1016(%rcx)
	movq	7424(%rsp), %rax
	movq	%rax, 1024(%rcx)
	movq	7432(%rsp), %rax
	movq	%rax, 1032(%rcx)
	movq	7440(%rsp), %rax
	movq	%rax, 1040(%rcx)
	movq	7448(%rsp), %rax
	movq	%rax, 1048(%rcx)
	movq	7456(%rsp), %rax
	movq	%rax, 1056(%rcx)
	movq	7464(%rsp), %rax
	movq	%rax, 1064(%rcx)
	movq	7472(%rsp), %rax
	movq	%rax, 1072(%rcx)
	movq	7480(%rsp), %rax
	movq	%rax, 1080(%rcx)
	movq	7488(%rsp), %rax
	movq	%rax, 1088(%rcx)
	movq	7496(%rsp), %rax
	movq	%rax, 1096(%rcx)
	movq	7504(%rsp), %rax
	movq	%rax, 1104(%rcx)
	movq	7512(%rsp), %rax
	movq	%rax, 1112(%rcx)
	movq	7520(%rsp), %rax
	movq	%rax, 1120(%rcx)
	movq	7528(%rsp), %rax
	movq	%rax, 1128(%rcx)
	movq	7536(%rsp), %rax
	movq	%rax, 1136(%rcx)
	movq	7544(%rsp), %rax
	movq	%rax, 1144(%rcx)
	movq	7552(%rsp), %rax
	movq	%rax, 1152(%rcx)
	movq	7560(%rsp), %rax
	movq	%rax, 1160(%rcx)
	movq	7568(%rsp), %rax
	movq	%rax, 1168(%rcx)
	movq	7576(%rsp), %rax
	movq	%rax, 1176(%rcx)
	movq	7584(%rsp), %rax
	movq	%rax, 1184(%rcx)
	movq	7592(%rsp), %rax
	movq	%rax, 1192(%rcx)
	movq	7600(%rsp), %rax
	movq	%rax, 1200(%rcx)
	movq	7608(%rsp), %rax
	movq	%rax, 1208(%rcx)
	movq	7616(%rsp), %rax
	movq	%rax, 1216(%rcx)
	movq	7624(%rsp), %rax
	movq	%rax, 1224(%rcx)
	movq	7632(%rsp), %rax
	movq	%rax, 1232(%rcx)
	movq	7640(%rsp), %rax
	movq	%rax, 1240(%rcx)
	movq	7648(%rsp), %rax
	movq	%rax, 1248(%rcx)
	movq	7656(%rsp), %rax
	movq	%rax, 1256(%rcx)
	movq	7664(%rsp), %rax
	movq	%rax, 1264(%rcx)
	movq	7672(%rsp), %rax
	movq	%rax, 1272(%rcx)
	movq	7680(%rsp), %rax
	movq	%rax, 1280(%rcx)
	movq	7688(%rsp), %rax
	movq	%rax, 1288(%rcx)
	movq	7696(%rsp), %rax
	movq	%rax, 1296(%rcx)
	movq	7704(%rsp), %rax
	movq	%rax, 1304(%rcx)
	movq	7712(%rsp), %rax
	movq	%rax, 1312(%rcx)
	movq	7720(%rsp), %rax
	movq	%rax, 1320(%rcx)
	movq	7728(%rsp), %rax
	movq	%rax, 1328(%rcx)
	movq	7736(%rsp), %rax
	movq	%rax, 1336(%rcx)
	movq	7744(%rsp), %rax
	movq	%rax, 1344(%rcx)
	movq	7752(%rsp), %rax
	movq	%rax, 1352(%rcx)
	movq	7760(%rsp), %rax
	movq	%rax, 1360(%rcx)
	movq	7768(%rsp), %rax
	movq	%rax, 1368(%rcx)
	movq	7776(%rsp), %rax
	movq	%rax, 1376(%rcx)
	movq	7784(%rsp), %rax
	movq	%rax, 1384(%rcx)
	movq	7792(%rsp), %rax
	movq	%rax, 1392(%rcx)
	movq	7800(%rsp), %rax
	movq	%rax, 1400(%rcx)
	movq	7808(%rsp), %rax
	movq	%rax, 1408(%rcx)
	movq	7816(%rsp), %rax
	movq	%rax, 1416(%rcx)
	movq	7824(%rsp), %rax
	movq	%rax, 1424(%rcx)
	movq	7832(%rsp), %rax
	movq	%rax, 1432(%rcx)
	movq	7840(%rsp), %rax
	movq	%rax, 1440(%rcx)
	movq	7848(%rsp), %rax
	movq	%rax, 1448(%rcx)
	movq	7856(%rsp), %rax
	movq	%rax, 1456(%rcx)
	movq	7864(%rsp), %rax
	movq	%rax, 1464(%rcx)
	movq	7872(%rsp), %rax
	movq	%rax, 1472(%rcx)
	movq	7880(%rsp), %rax
	movq	%rax, 1480(%rcx)
	movq	7888(%rsp), %rax
	movq	%rax, 1488(%rcx)
	movq	7896(%rsp), %rax
	movq	%rax, 1496(%rcx)
	movq	7904(%rsp), %rax
	movq	%rax, 1504(%rcx)
	movq	7912(%rsp), %rax
	movq	%rax, 1512(%rcx)
	movq	7920(%rsp), %rax
	movq	%rax, 1520(%rcx)
	movq	7928(%rsp), %rax
	movq	%rax, 1528(%rcx)
	movq	7936(%rsp), %rax
	movq	%rax, 1536(%rcx)
	movq	7944(%rsp), %rax
	movq	%rax, 1544(%rcx)
	movq	7952(%rsp), %rax
	movq	%rax, 1552(%rcx)
	movq	7960(%rsp), %rax
	movq	%rax, 1560(%rcx)
	movq	7968(%rsp), %rax
	movq	%rax, 1568(%rcx)
	movq	7976(%rsp), %rax
	movq	%rax, 1576(%rcx)
	movq	7984(%rsp), %rax
	movq	%rax, 1584(%rcx)
	movq	7992(%rsp), %rax
	movq	%rax, 1592(%rcx)
	movq	8000(%rsp), %rax
	movq	%rax, 1600(%rcx)
	movq	8008(%rsp), %rax
	movq	%rax, 1608(%rcx)
	movq	8016(%rsp), %rax
	movq	%rax, 1616(%rcx)
	movq	8024(%rsp), %rax
	movq	%rax, 1624(%rcx)
	movq	8032(%rsp), %rax
	movq	%rax, 1632(%rcx)
	movq	8040(%rsp), %rax
	movq	%rax, 1640(%rcx)
	movq	8048(%rsp), %rax
	movq	%rax, 1648(%rcx)
	movq	8056(%rsp), %rax
	movq	%rax, 1656(%rcx)
	movq	8064(%rsp), %rax
	movq	%rax, 1664(%rcx)
	movq	8072(%rsp), %rax
	movq	%rax, 1672(%rcx)
	movq	8080(%rsp), %rax
	movq	%rax, 1680(%rcx)
	movq	8088(%rsp), %rax
	movq	%rax, 1688(%rcx)
	movq	8096(%rsp), %rax
	movq	%rax, 1696(%rcx)
	movq	8104(%rsp), %rax
	movq	%rax, 1704(%rcx)
	movq	8112(%rsp), %rax
	movq	%rax, 1712(%rcx)
	movq	8120(%rsp), %rax
	movq	%rax, 1720(%rcx)
	movq	8128(%rsp), %rax
	movq	%rax, 1728(%rcx)
	movq	8136(%rsp), %rax
	movq	%rax, 1736(%rcx)
	movq	8144(%rsp), %rax
	movq	%rax, 1744(%rcx)
	movq	8152(%rsp), %rax
	movq	%rax, 1752(%rcx)
	movq	8160(%rsp), %rax
	movq	%rax, 1760(%rcx)
	movq	8168(%rsp), %rax
	movq	%rax, 1768(%rcx)
	movq	8176(%rsp), %rax
	movq	%rax, 1776(%rcx)
	movq	8184(%rsp), %rax
	movq	%rax, 1784(%rcx)
	movq	8192(%rsp), %rax
	movq	%rax, 1792(%rcx)
	movq	8200(%rsp), %rax
	movq	%rax, 1800(%rcx)
	movq	8208(%rsp), %rax
	movq	%rax, 1808(%rcx)
	movq	8216(%rsp), %rax
	movq	%rax, 1816(%rcx)
	movq	8224(%rsp), %rax
	movq	%rax, 1824(%rcx)
	movq	8232(%rsp), %rax
	movq	%rax, 1832(%rcx)
	movq	8240(%rsp), %rax
	movq	%rax, 1840(%rcx)
	movq	8248(%rsp), %rax
	movq	%rax, 1848(%rcx)
	movq	8256(%rsp), %rax
	movq	%rax, 1856(%rcx)
	movq	8264(%rsp), %rax
	movq	%rax, 1864(%rcx)
	movq	8272(%rsp), %rax
	movq	%rax, 1872(%rcx)
	movq	8280(%rsp), %rax
	movq	%rax, 1880(%rcx)
	movq	8288(%rsp), %rax
	movq	%rax, 1888(%rcx)
	movq	8296(%rsp), %rax
	movq	%rax, 1896(%rcx)
	movq	8304(%rsp), %rax
	movq	%rax, 1904(%rcx)
	movq	8312(%rsp), %rax
	movq	%rax, 1912(%rcx)
	movq	8320(%rsp), %rax
	movq	%rax, 1920(%rcx)
	movq	8328(%rsp), %rax
	movq	%rax, 1928(%rcx)
	movq	8336(%rsp), %rax
	movq	%rax, 1936(%rcx)
	movq	8344(%rsp), %rax
	movq	%rax, 1944(%rcx)
	movq	8352(%rsp), %rax
	movq	%rax, 1952(%rcx)
	movq	8360(%rsp), %rax
	movq	%rax, 1960(%rcx)
	movq	8368(%rsp), %rax
	movq	%rax, 1968(%rcx)
	movq	8376(%rsp), %rax
	movq	%rax, 1976(%rcx)
	movq	8384(%rsp), %rax
	movq	%rax, 1984(%rcx)
	movq	8392(%rsp), %rax
	movq	%rax, 1992(%rcx)
	movq	8400(%rsp), %rax
	movq	%rax, 2000(%rcx)
	movq	8408(%rsp), %rax
	movq	%rax, 2008(%rcx)
	movq	8416(%rsp), %rax
	movq	%rax, 2016(%rcx)
	movq	8424(%rsp), %rax
	movq	%rax, 2024(%rcx)
	movq	8432(%rsp), %rax
	movq	%rax, 2032(%rcx)
	movq	8440(%rsp), %rax
	movq	%rax, 2040(%rcx)
	movq	8448(%rsp), %rax
	movq	%rax, 2048(%rcx)
	movq	8456(%rsp), %rax
	movq	%rax, 2056(%rcx)
	movq	8464(%rsp), %rax
	movq	%rax, 2064(%rcx)
	movq	8472(%rsp), %rax
	movq	%rax, 2072(%rcx)
	movq	8480(%rsp), %rax
	movq	%rax, 2080(%rcx)
	movq	8488(%rsp), %rax
	movq	%rax, 2088(%rcx)
	movq	8496(%rsp), %rax
	movq	%rax, 2096(%rcx)
	movq	8504(%rsp), %rax
	movq	%rax, 2104(%rcx)
	movq	8512(%rsp), %rax
	movq	%rax, 2112(%rcx)
	movq	8520(%rsp), %rax
	movq	%rax, 2120(%rcx)
	movq	8528(%rsp), %rax
	movq	%rax, 2128(%rcx)
	movq	8536(%rsp), %rax
	movq	%rax, 2136(%rcx)
	movq	8544(%rsp), %rax
	movq	%rax, 2144(%rcx)
	movq	8552(%rsp), %rax
	movq	%rax, 2152(%rcx)
	movq	8560(%rsp), %rax
	movq	%rax, 2160(%rcx)
	movq	8568(%rsp), %rax
	movq	%rax, 2168(%rcx)
	movq	8576(%rsp), %rax
	movq	%rax, 2176(%rcx)
	movq	8584(%rsp), %rax
	movq	%rax, 2184(%rcx)
	movq	8592(%rsp), %rax
	movq	%rax, 2192(%rcx)
	movq	8600(%rsp), %rax
	movq	%rax, 2200(%rcx)
	movq	8608(%rsp), %rax
	movq	%rax, 2208(%rcx)
	movq	8616(%rsp), %rax
	movq	%rax, 2216(%rcx)
	movq	8624(%rsp), %rax
	movq	%rax, 2224(%rcx)
	movq	8632(%rsp), %rax
	movq	%rax, 2232(%rcx)
	movq	8640(%rsp), %rax
	movq	%rax, 2240(%rcx)
	movq	8648(%rsp), %rax
	movq	%rax, 2248(%rcx)
	movq	8656(%rsp), %rax
	movq	%rax, 2256(%rcx)
	movq	8664(%rsp), %rax
	movq	%rax, 2264(%rcx)
	movq	8672(%rsp), %rax
	movq	%rax, 2272(%rcx)
	movq	8680(%rsp), %rax
	movq	%rax, 2280(%rcx)
	movq	8688(%rsp), %rax
	movq	%rax, 2288(%rcx)
	movq	8696(%rsp), %rax
	movq	%rax, 2296(%rcx)
	movq	8704(%rsp), %rax
	movq	%rax, 2304(%rcx)
	movq	8712(%rsp), %rax
	movq	%rax, 2312(%rcx)
	movq	8720(%rsp), %rax
	movq	%rax, 2320(%rcx)
	movq	8728(%rsp), %rax
	movq	%rax, 2328(%rcx)
	movq	8736(%rsp), %rax
	movq	%rax, 2336(%rcx)
	movq	8744(%rsp), %rax
	movq	%rax, 2344(%rcx)
	movq	8752(%rsp), %rax
	movq	%rax, 2352(%rcx)
	movq	8760(%rsp), %rax
	movq	%rax, 2360(%rcx)
	movq	8768(%rsp), %rax
	movq	%rax, 2368(%rcx)
	movq	8776(%rsp), %rax
	movq	%rax, 2376(%rcx)
	movq	8784(%rsp), %rax
	movq	%rax, 2384(%rcx)
	movq	8792(%rsp), %rax
	movq	%rax, 2392(%rcx)
	xorq	%rax, %rax
	movq	13552(%rsp), %rbx
	movq	13560(%rsp), %rbp
	movq	13568(%rsp), %r12
	movq	13576(%rsp), %r13
	movq	13584(%rsp), %r14
	movq	13592(%rsp), %r15
	movq	13600(%rsp), %rsp
	ret
L_gen_matrix_avx2$1:
	movq	%rdx, %mm0
	leaq	32(%rsp), %r8
	movq	$0, %r10
	movq	%rcx, %rdx
	movq	%mm0, %rsi
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$15:
	leaq	856(%rsp), %rsp
	movq	$8, %r10
	leaq	2048(%rcx), %rdx
	movq	%mm0, %rsi
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$14:
	leaq	856(%rsp), %rsp
	leaq	4096(%rcx), %r10
	movw	$514, %dx
	movq	%r8, %rsi
	movw	%dx, 2176(%rsp)
	leaq	2176(%rsp), %r8
	leaq	-248(%rsp), %rsp
	call	L_shake128_absorb_A32_A2$1
L_gen_matrix_avx2$13:
	leaq	248(%rsp), %rsp
	call	L_shake128_squeeze3blocks$1
L_gen_matrix_avx2$12:
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_avx2$11:
	movq	%rcx, %rdx
	call	L_nttunpack$1
L_gen_matrix_avx2$10:
	leaq	512(%rcx), %rdx
	call	L_nttunpack$1
L_gen_matrix_avx2$9:
	leaq	1024(%rcx), %rdx
	call	L_nttunpack$1
L_gen_matrix_avx2$8:
	leaq	1536(%rcx), %rdx
	call	L_nttunpack$1
L_gen_matrix_avx2$7:
	leaq	2048(%rcx), %rdx
	call	L_nttunpack$1
L_gen_matrix_avx2$6:
	leaq	2560(%rcx), %rdx
	call	L_nttunpack$1
L_gen_matrix_avx2$5:
	leaq	3072(%rcx), %rdx
	call	L_nttunpack$1
L_gen_matrix_avx2$4:
	leaq	3584(%rcx), %rdx
	call	L_nttunpack$1
L_gen_matrix_avx2$3:
	leaq	4096(%rcx), %rdx
	call	L_nttunpack$1
L_gen_matrix_avx2$2:
	ret
L_gen_matrix_sample_four_polynomials$1:
	leaq	glob_data + 2656(%rip), %r9
	shlq	$4, %rsi
	addq	%rsi, %r10
	movq	(%r9,%r10), %rsi
	movq	%rsi, 832(%rsp)
	leaq	32(%rsp), %rsi
	leaq	832(%rsp), %r10
	call	L_shake128x4_absorb_A32_A2$1
L_gen_matrix_sample_four_polynomials$7:
	leaq	-24(%rsp), %rsp
	call	L_shake128x4_squeeze3blocks$1
L_gen_matrix_sample_four_polynomials$6:
	leaq	24(%rsp), %rsp
	movq	%rdx, %r10
	movq	%r8, %rsi
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$5:
	leaq	512(%rdx), %r10
	leaq	536(%r8), %rsi
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$4:
	leaq	1024(%rdx), %r10
	leaq	1072(%r8), %rsi
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$3:
	leaq	1536(%rdx), %r10
	leaq	1608(%r8), %rsi
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$2:
	ret
L__gen_matrix_fill_polynomial$1:
	movq	$0, %r9
	movq	$0, %rbx
	leaq	-8(%rsp), %rsp
	call	L_gen_matrix_buf_rejection$1
L__gen_matrix_fill_polynomial$6:
	leaq	8(%rsp), %rsp
	movq	$336, %r9
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
	movq	$0, %r11
	vmovdqu	glob_data + 96(%rip), %ymm0
	vmovdqu	glob_data + 32(%rip), %ymm1
	vmovdqu	glob_data + 0(%rip), %ymm2
	vmovdqu	glob_data + 64(%rip), %ymm3
	leaq	glob_data + 2688(%rip), %r15
	movq	%r9, 8(%rsp)
	movq	%r9, %r12
	jmp 	L_gen_matrix_buf_rejection$22
L_gen_matrix_buf_rejection$23:
	movq	$-1, %rbp
	cmovnb	%rbp, %r11
	cmpq	$225, %rbx
	jb  	L_gen_matrix_buf_rejection$24
	movq	$-1, %rbp
	cmovb	%rbp, %r11
	movq	$504, %r12
	jmp 	L_gen_matrix_buf_rejection$22
L_gen_matrix_buf_rejection$24:
	movq	$-1, %rbp
	cmovnb	%rbp, %r11
	vpermq	$148, (%rsi,%r12), %ymm4
	vpermq	$148, 24(%rsi,%r12), %ymm5
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
	orq 	%r11, %rbp
	movq	%rbp, %r12
	andq	$255, %r12
	vmovq	(%r15,%r12,8), %xmm6
	popcnt	%r12, %r12
	addq	%rbx, %r12
	movq	%rbp, %r13
	shrq	$16, %r13
	andq	$255, %r13
	vmovq	(%r15,%r13,8), %xmm7
	popcnt	%r13, %r13
	addq	%r12, %r13
	movq	%rbp, %r14
	shrq	$8, %r14
	andq	$255, %r14
	vmovq	(%r15,%r14,8), %xmm8
	popcnt	%r14, %r14
	addq	%r13, %r14
	shrq	$24, %rbp
	andq	$255, %rbp
	vmovq	(%r15,%rbp,8), %xmm9
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
	vmovdqu	%xmm4, (%r10,%rbx,2)
	vextracti128	$1, %ymm4, (%r10,%r12,2)
	vmovdqu	%xmm5, (%r10,%r13,2)
	vextracti128	$1, %ymm5, (%r10,%r14,2)
	movq	%rbp, %rbx
	addq	$48, 8(%rsp)
	movq	8(%rsp), %r12
L_gen_matrix_buf_rejection$25:
L_gen_matrix_buf_rejection$22:
	cmpq	$457, %r12
	jb  	L_gen_matrix_buf_rejection$23
	movq	$-1, %rbp
	cmovb	%rbp, %r11
	movq	8(%rsp), %r12
	jmp 	L_gen_matrix_buf_rejection$2
L_gen_matrix_buf_rejection$3:
	movq	$-1, %rbp
	cmovnb	%rbp, %r11
	cmpq	$256, %rbx
	jb  	L_gen_matrix_buf_rejection$4
	movq	$-1, %rbp
	cmovb	%rbp, %r11
	movq	$504, %r12
	jmp 	L_gen_matrix_buf_rejection$2
L_gen_matrix_buf_rejection$4:
	movq	$-1, %rbp
	cmovnb	%rbp, %r11
	movq	%r12, 8(%rsp)
	vpermq	$148, (%rsi,%r12), %ymm4
	vpshufb	%ymm0, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpblendw	$170, %ymm5, %ymm4, %ymm4
	vpand	%ymm1, %ymm4, %ymm4
	vpcmpgtw	%ymm4, %ymm2, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	vpacksswb	%ymm6, %ymm5, %ymm5
	vpmovmskb	%ymm5, %r12
	orq 	%r11, %r12
	movq	%r12, %rbp
	andq	$255, %rbp
	vmovq	(%r15,%rbp,8), %xmm5
	popcnt	%rbp, %rbp
	addq	%rbx, %rbp
	shrq	$16, %r12
	andq	$255, %r12
	vmovq	(%r15,%r12,8), %xmm6
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
	cmovbe	%r13, %r11
	movq	%xmm5, %r13
	cmpq	$252, %rbx
	jbe 	L_gen_matrix_buf_rejection$20
	movq	$-1, %r14
	cmovbe	%r14, %r11
	jmp 	L_gen_matrix_buf_rejection$21
L_gen_matrix_buf_rejection$20:
	movq	$-1, %r14
	cmovnbe	%r14, %r11
	movq	%r13, (%r10,%rbx,2)
	vpextrq	$1, %xmm5, %r13
	addq	$4, %rbx
L_gen_matrix_buf_rejection$21:
	cmpq	$254, %rbx
	jbe 	L_gen_matrix_buf_rejection$18
	movq	$-1, %r14
	cmovbe	%r14, %r11
	jmp 	L_gen_matrix_buf_rejection$19
L_gen_matrix_buf_rejection$18:
	movq	$-1, %r14
	cmovnbe	%r14, %r11
	movl	%r13d, (%r10,%rbx,2)
	shrq	$32, %r13
	addq	$2, %rbx
L_gen_matrix_buf_rejection$19:
	cmpq	$255, %rbx
	jbe 	L_gen_matrix_buf_rejection$16
	movq	$-1, %rbx
	cmovbe	%rbx, %r11
	jmp 	L_gen_matrix_buf_rejection$15
L_gen_matrix_buf_rejection$16:
	movq	$-1, %r14
	cmovnbe	%r14, %r11
	movw	%r13w, (%r10,%rbx,2)
L_gen_matrix_buf_rejection$17:
	jmp 	L_gen_matrix_buf_rejection$15
L_gen_matrix_buf_rejection$14:
	movq	$-1, %r13
	cmovnbe	%r13, %r11
	vmovdqu	%xmm5, (%r10,%rbx,2)
L_gen_matrix_buf_rejection$15:
	vextracti128	$1, %ymm4, %xmm4
	cmpq	$248, %rbp
	jbe 	L_gen_matrix_buf_rejection$6
	movq	$-1, %rbx
	cmovbe	%rbx, %r11
	movq	%xmm4, %rbx
	cmpq	$252, %rbp
	jbe 	L_gen_matrix_buf_rejection$12
	movq	$-1, %r13
	cmovbe	%r13, %r11
	jmp 	L_gen_matrix_buf_rejection$13
L_gen_matrix_buf_rejection$12:
	movq	$-1, %r13
	cmovnbe	%r13, %r11
	movq	%rbx, (%r10,%rbp,2)
	vpextrq	$1, %xmm4, %rbx
	addq	$4, %rbp
L_gen_matrix_buf_rejection$13:
	cmpq	$254, %rbp
	jbe 	L_gen_matrix_buf_rejection$10
	movq	$-1, %r13
	cmovbe	%r13, %r11
	jmp 	L_gen_matrix_buf_rejection$11
L_gen_matrix_buf_rejection$10:
	movq	$-1, %r13
	cmovnbe	%r13, %r11
	movl	%ebx, (%r10,%rbp,2)
	shrq	$32, %rbx
	addq	$2, %rbp
L_gen_matrix_buf_rejection$11:
	cmpq	$255, %rbp
	jbe 	L_gen_matrix_buf_rejection$8
	movq	$-1, %rbx
	cmovbe	%rbx, %r11
	jmp 	L_gen_matrix_buf_rejection$7
L_gen_matrix_buf_rejection$8:
	movq	$-1, %r13
	cmovnbe	%r13, %r11
	movw	%bx, (%r10,%rbp,2)
L_gen_matrix_buf_rejection$9:
	jmp 	L_gen_matrix_buf_rejection$7
L_gen_matrix_buf_rejection$6:
	movq	$-1, %rbx
	cmovnbe	%rbx, %r11
	vmovdqu	%xmm4, (%r10,%rbp,2)
L_gen_matrix_buf_rejection$7:
	movq	%r12, %rbx
	movq	8(%rsp), %r12
	addq	$24, %r12
L_gen_matrix_buf_rejection$5:
L_gen_matrix_buf_rejection$2:
	cmpq	$481, %r12
	jb  	L_gen_matrix_buf_rejection$3
	ret
L_i_poly_decompress$1:
	leaq	glob_data + 992(%rip), %rdi
	vmovdqu	(%rdi), %ymm0
	leaq	glob_data + 192(%rip), %rdi
	vmovdqu	(%rdi), %ymm1
	vpbroadcastd	glob_data + 4996(%rip), %ymm2
	vpbroadcastd	glob_data + 4992(%rip), %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	movq	(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, (%rsi)
	movq	8(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 32(%rsi)
	movq	16(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 64(%rsi)
	movq	24(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 96(%rsi)
	movq	32(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 128(%rsi)
	movq	40(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 160(%rsi)
	movq	48(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 192(%rsi)
	movq	56(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 224(%rsi)
	movq	64(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 256(%rsi)
	movq	72(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 288(%rsi)
	movq	80(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 320(%rsi)
	movq	88(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 352(%rsi)
	movq	96(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 384(%rsi)
	movq	104(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 416(%rsi)
	movq	112(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 448(%rsi)
	movq	120(%rax), %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm1
	vpand	%ymm2, %ymm1, %ymm1
	vpmullw	%ymm3, %ymm1, %ymm1
	vpmulhrsw	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, 480(%rsi)
	ret
L_i_poly_compress$1:
	call	L_poly_csubq$1
L_i_poly_compress$2:
	leaq	glob_data + 928(%rip), %rcx
	vmovdqu	(%rcx), %ymm0
	vpbroadcastw	glob_data + 5016(%rip), %ymm1
	vpbroadcastw	glob_data + 5014(%rip), %ymm2
	vpbroadcastw	glob_data + 5012(%rip), %ymm3
	vmovdqu	glob_data + 224(%rip), %ymm4
	vmovdqu	(%rdx), %ymm5
	vmovdqu	32(%rdx), %ymm6
	vmovdqu	64(%rdx), %ymm7
	vmovdqu	96(%rdx), %ymm8
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
	vmovdqu	128(%rdx), %ymm5
	vmovdqu	160(%rdx), %ymm6
	vmovdqu	192(%rdx), %ymm7
	vmovdqu	224(%rdx), %ymm8
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
	vmovdqu	256(%rdx), %ymm5
	vmovdqu	288(%rdx), %ymm6
	vmovdqu	320(%rdx), %ymm7
	vmovdqu	352(%rdx), %ymm8
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
	vmovdqu	384(%rdx), %ymm5
	vmovdqu	416(%rdx), %ymm6
	vmovdqu	448(%rdx), %ymm7
	vmovdqu	480(%rdx), %ymm8
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
L_i_poly_tomsg$1:
	call	L_poly_csubq$1
L_i_poly_tomsg$2:
	leaq	glob_data + 768(%rip), %rax
	vmovdqu	(%rax), %ymm0
	leaq	glob_data + 736(%rip), %rax
	vmovdqu	(%rax), %ymm1
	vmovdqu	(%rdx), %ymm2
	vmovdqu	32(%rdx), %ymm3
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
	vpmovmskb	%ymm2, %eax
	movl	%eax, (%rcx)
	vmovdqu	64(%rdx), %ymm2
	vmovdqu	96(%rdx), %ymm3
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
	vpmovmskb	%ymm2, %eax
	movl	%eax, 4(%rcx)
	vmovdqu	128(%rdx), %ymm2
	vmovdqu	160(%rdx), %ymm3
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
	vpmovmskb	%ymm2, %eax
	movl	%eax, 8(%rcx)
	vmovdqu	192(%rdx), %ymm2
	vmovdqu	224(%rdx), %ymm3
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
	vpmovmskb	%ymm2, %eax
	movl	%eax, 12(%rcx)
	vmovdqu	256(%rdx), %ymm2
	vmovdqu	288(%rdx), %ymm3
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
	vpmovmskb	%ymm2, %eax
	movl	%eax, 16(%rcx)
	vmovdqu	320(%rdx), %ymm2
	vmovdqu	352(%rdx), %ymm3
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
	vpmovmskb	%ymm2, %eax
	movl	%eax, 20(%rcx)
	vmovdqu	384(%rdx), %ymm2
	vmovdqu	416(%rdx), %ymm3
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
	vpmovmskb	%ymm2, %eax
	movl	%eax, 24(%rcx)
	vmovdqu	448(%rdx), %ymm2
	vmovdqu	480(%rdx), %ymm3
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
	vpmovmskb	%ymm0, %eax
	movl	%eax, 28(%rcx)
	ret
L_i_poly_tobytes$1:
	call	L_poly_csubq$1
L_i_poly_tobytes$2:
	vmovdqu	(%rdx), %ymm4
	vmovdqu	32(%rdx), %ymm5
	vmovdqu	64(%rdx), %ymm6
	vmovdqu	96(%rdx), %ymm7
	vmovdqu	128(%rdx), %ymm0
	vmovdqu	160(%rdx), %ymm1
	vmovdqu	192(%rdx), %ymm2
	vmovdqu	224(%rdx), %ymm3
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
	vmovdqu	%ymm4, (%rdi)
	vmovdqu	%ymm5, 32(%rdi)
	vmovdqu	%ymm6, 64(%rdi)
	vmovdqu	%ymm1, 96(%rdi)
	vmovdqu	%ymm2, 128(%rdi)
	vmovdqu	%ymm0, 160(%rdi)
	vmovdqu	256(%rdx), %ymm4
	vmovdqu	288(%rdx), %ymm5
	vmovdqu	320(%rdx), %ymm6
	vmovdqu	352(%rdx), %ymm7
	vmovdqu	384(%rdx), %ymm0
	vmovdqu	416(%rdx), %ymm1
	vmovdqu	448(%rdx), %ymm2
	vmovdqu	480(%rdx), %ymm3
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
	vmovdqu	%ymm4, 192(%rdi)
	vmovdqu	%ymm5, 224(%rdi)
	vmovdqu	%ymm6, 256(%rdi)
	vmovdqu	%ymm1, 288(%rdi)
	vmovdqu	%ymm2, 320(%rdi)
	vmovdqu	%ymm0, 352(%rdi)
	ret
L_i_poly_frommsg$1:
	leaq	glob_data + 800(%rip), %rsi
	vmovdqu	(%rsi), %ymm0
	vbroadcasti128	glob_data + 2640(%rip), %ymm1
	vbroadcasti128	glob_data + 2624(%rip), %ymm2
	vmovdqu	(%rdi), %ymm3
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
L_i_poly_frombytes$1:
	leaq	glob_data + 832(%rip), %r9
	vmovdqu	(%r9), %ymm0
	vmovdqu	(%r8), %ymm1
	vmovdqu	32(%r8), %ymm2
	vmovdqu	64(%r8), %ymm3
	vmovdqu	96(%r8), %ymm4
	vmovdqu	128(%r8), %ymm5
	vmovdqu	160(%r8), %ymm6
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
	vmovdqu	%ymm3, (%rsi)
	vmovdqu	%ymm6, 32(%rsi)
	vmovdqu	%ymm4, 64(%rsi)
	vmovdqu	%ymm7, 96(%rsi)
	vmovdqu	%ymm1, 128(%rsi)
	vmovdqu	%ymm8, 160(%rsi)
	vmovdqu	%ymm5, 192(%rsi)
	vmovdqu	%ymm2, 224(%rsi)
	vmovdqu	192(%r8), %ymm1
	vmovdqu	224(%r8), %ymm2
	vmovdqu	256(%r8), %ymm3
	vmovdqu	288(%r8), %ymm4
	vmovdqu	320(%r8), %ymm5
	vmovdqu	352(%r8), %ymm6
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
	vmovdqu	%ymm3, 256(%rsi)
	vmovdqu	%ymm6, 288(%rsi)
	vmovdqu	%ymm4, 320(%rsi)
	vmovdqu	%ymm7, 352(%rsi)
	vmovdqu	%ymm1, 384(%rsi)
	vmovdqu	%ymm8, 416(%rsi)
	vmovdqu	%ymm5, 448(%rsi)
	vmovdqu	%ymm0, 480(%rsi)
	ret
L_shake256_A32__A1120$1:
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1120$3
L_shake256_A32__A1120$4:
	movq	(%rcx,%rdx), %rdi
	movq	%rdi, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	vmovdqu	8(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rcx,%rdx), %rdi
	movq	%rdi, %xmm9
	vmovdqu	48(%rcx,%rdx), %ymm7
	movq	80(%rcx,%rdx), %rdi
	movq	%rdi, %xmm10
	vmovdqu	88(%rcx,%rdx), %ymm8
	movq	120(%rcx,%rdx), %rdi
	vpinsrq	$1, %rdi, %xmm9, %xmm11
	vpxor	%xmm9, %xmm9, %xmm9
	vmovq	128(%rcx,%rdx), %xmm12
	movq	$0, %rdi
	vpinsrq	$1, %rdi, %xmm12, %xmm12
	vinserti128	$1, %xmm9, %ymm12, %ymm9
	movq	$0, %rdi
	vpinsrq	$1, %rdi, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm6, %ymm6
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm0, %ymm0
	vpxor	%ymm11, %ymm1, %ymm1
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm8, %ymm3, %ymm3
	addq	$136, %rdx
	call	L_keccakf1600_avx2$1
L_shake256_A32__A1120$5:
	incq	%rsi
L_shake256_A32__A1120$3:
	cmpq	$8, %rsi
	jb  	L_shake256_A32__A1120$4
	movq	(%rcx,%rdx), %rsi
	movq	%rsi, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	vmovdqu	8(%rcx,%rdx), %xmm7
	vmovq	24(%rcx,%rdx), %xmm8
	movq	$31, %rcx
	vpinsrq	$1, %rcx, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	$0, %rcx
	call	L_keccakf1600_avx2$1
L_shake256_A32__A1120$2:
	movq	%xmm4, (%rax,%rcx)
	vpunpckhqdq	%xmm4, %xmm4, %xmm0
	vmovdqu	%xmm5, %xmm0
	vmovdqu	%xmm0, 8(%rax,%rcx)
	vextracti128	$1, %ymm5, %xmm0
	movq	%xmm0, 24(%rax,%rcx)
	vpunpckhqdq	%xmm0, %xmm0, %xmm0
	ret
L_sha3_256A_A1184$1:
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rsi
	movq	$0, %rdi
	jmp 	L_sha3_256A_A1184$3
L_sha3_256A_A1184$4:
	movq	(%rcx,%rsi), %r8
	movq	%r8, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	vmovdqu	8(%rcx,%rsi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rcx,%rsi), %r8
	movq	%r8, %xmm9
	vmovdqu	48(%rcx,%rsi), %ymm7
	movq	80(%rcx,%rsi), %r8
	movq	%r8, %xmm10
	vmovdqu	88(%rcx,%rsi), %ymm8
	movq	120(%rcx,%rsi), %r8
	vpinsrq	$1, %r8, %xmm9, %xmm11
	vpxor	%xmm9, %xmm9, %xmm9
	vmovq	128(%rcx,%rsi), %xmm12
	movq	$0, %r8
	vpinsrq	$1, %r8, %xmm12, %xmm12
	vinserti128	$1, %xmm9, %ymm12, %ymm9
	movq	$0, %r8
	vpinsrq	$1, %r8, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm6, %ymm6
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm0, %ymm0
	vpxor	%ymm11, %ymm1, %ymm1
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm8, %ymm3, %ymm3
	addq	$136, %rsi
	call	L_keccakf1600_avx2$1
L_sha3_256A_A1184$5:
	incq	%rdi
L_sha3_256A_A1184$3:
	cmpq	$8, %rdi
	jb  	L_sha3_256A_A1184$4
	movq	(%rcx,%rsi), %rdi
	movq	%rdi, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	vmovdqu	8(%rcx,%rsi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rcx,%rsi), %rdi
	movq	%rdi, %xmm9
	vmovdqu	48(%rcx,%rsi), %ymm7
	movq	80(%rcx,%rsi), %rdi
	movq	%rdi, %xmm10
	vpxor	%xmm8, %xmm8, %xmm8
	vmovq	88(%rcx,%rsi), %xmm11
	movq	$6, %rcx
	vpinsrq	$1, %rcx, %xmm11, %xmm11
	vinserti128	$1, %xmm8, %ymm11, %ymm8
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm9, %xmm11
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm6, %ymm6
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm0, %ymm0
	vpxor	%ymm11, %ymm1, %ymm1
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm8, %ymm3, %ymm3
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	$0, %rcx
	call	L_keccakf1600_avx2$1
L_sha3_256A_A1184$2:
	movq	%xmm4, (%rdx,%rcx)
	vpunpckhqdq	%xmm4, %xmm4, %xmm0
	vmovdqu	%xmm5, %xmm0
	vmovdqu	%xmm0, 8(%rdx,%rcx)
	vextracti128	$1, %ymm5, %xmm0
	movq	%xmm0, 24(%rdx,%rcx)
	vpunpckhqdq	%xmm0, %xmm0, %xmm0
	ret
L_poly_sub$1:
	vmovdqu	(%rdx), %ymm0
	vmovdqu	(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	32(%rdx), %ymm0
	vmovdqu	32(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	64(%rdx), %ymm0
	vmovdqu	64(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	96(%rdx), %ymm0
	vmovdqu	96(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 96(%rax)
	vmovdqu	128(%rdx), %ymm0
	vmovdqu	128(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 128(%rax)
	vmovdqu	160(%rdx), %ymm0
	vmovdqu	160(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 160(%rax)
	vmovdqu	192(%rdx), %ymm0
	vmovdqu	192(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 192(%rax)
	vmovdqu	224(%rdx), %ymm0
	vmovdqu	224(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 224(%rax)
	vmovdqu	256(%rdx), %ymm0
	vmovdqu	256(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 256(%rax)
	vmovdqu	288(%rdx), %ymm0
	vmovdqu	288(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 288(%rax)
	vmovdqu	320(%rdx), %ymm0
	vmovdqu	320(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 320(%rax)
	vmovdqu	352(%rdx), %ymm0
	vmovdqu	352(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 352(%rax)
	vmovdqu	384(%rdx), %ymm0
	vmovdqu	384(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 384(%rax)
	vmovdqu	416(%rdx), %ymm0
	vmovdqu	416(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 416(%rax)
	vmovdqu	448(%rdx), %ymm0
	vmovdqu	448(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 448(%rax)
	vmovdqu	480(%rdx), %ymm0
	vmovdqu	480(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	ret
L_poly_ntt$1:
	leaq	glob_data + 1824(%rip), %rsi
	vmovdqu	glob_data + 992(%rip), %ymm0
	vpbroadcastd	(%rsi), %ymm1
	vpbroadcastd	4(%rsi), %ymm2
	vmovdqu	(%rdx), %ymm3
	vmovdqu	32(%rdx), %ymm14
	vmovdqu	64(%rdx), %ymm4
	vmovdqu	96(%rdx), %ymm5
	vmovdqu	256(%rdx), %ymm6
	vmovdqu	288(%rdx), %ymm7
	vmovdqu	320(%rdx), %ymm12
	vmovdqu	352(%rdx), %ymm8
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
	vmovdqu	%ymm3, (%rdx)
	vmovdqu	%ymm10, 32(%rdx)
	vmovdqu	%ymm4, 64(%rdx)
	vmovdqu	%ymm5, 96(%rdx)
	vmovdqu	%ymm7, 256(%rdx)
	vmovdqu	%ymm9, 288(%rdx)
	vmovdqu	%ymm8, 320(%rdx)
	vmovdqu	%ymm6, 352(%rdx)
	vmovdqu	128(%rdx), %ymm3
	vmovdqu	160(%rdx), %ymm12
	vmovdqu	192(%rdx), %ymm4
	vmovdqu	224(%rdx), %ymm5
	vmovdqu	384(%rdx), %ymm6
	vmovdqu	416(%rdx), %ymm7
	vmovdqu	448(%rdx), %ymm10
	vmovdqu	480(%rdx), %ymm11
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
	vmovdqu	%ymm7, 384(%rdx)
	vmovdqu	%ymm3, 416(%rdx)
	vmovdqu	%ymm5, 448(%rdx)
	vmovdqu	%ymm4, 480(%rdx)
	vpbroadcastd	8(%rsi), %ymm1
	vpbroadcastd	12(%rsi), %ymm4
	vmovdqu	%ymm8, %ymm10
	vmovdqu	%ymm9, %ymm3
	vmovdqu	(%rdx), %ymm6
	vmovdqu	32(%rdx), %ymm5
	vmovdqu	64(%rdx), %ymm9
	vmovdqu	96(%rdx), %ymm7
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
	vmovdqu	%ymm3, (%rdx)
	vmovdqu	%ymm4, 32(%rdx)
	vmovdqu	%ymm2, 64(%rdx)
	vmovdqu	%ymm6, 96(%rdx)
	vmovdqu	%ymm8, 128(%rdx)
	vmovdqu	%ymm5, 160(%rdx)
	vmovdqu	%ymm7, 192(%rdx)
	vmovdqu	%ymm1, 224(%rdx)
	vpbroadcastd	400(%rsi), %ymm5
	vpbroadcastd	404(%rsi), %ymm8
	vmovdqu	384(%rdx), %ymm1
	vmovdqu	416(%rdx), %ymm2
	vmovdqu	448(%rdx), %ymm10
	vmovdqu	480(%rdx), %ymm9
	vmovdqu	256(%rdx), %ymm3
	vmovdqu	288(%rdx), %ymm7
	vmovdqu	320(%rdx), %ymm6
	vmovdqu	352(%rdx), %ymm4
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
	vmovdqu	%ymm3, 256(%rdx)
	vmovdqu	%ymm4, 288(%rdx)
	vmovdqu	%ymm2, 320(%rdx)
	vmovdqu	%ymm6, 352(%rdx)
	vmovdqu	%ymm8, 384(%rdx)
	vmovdqu	%ymm5, 416(%rdx)
	vmovdqu	%ymm7, 448(%rdx)
	vmovdqu	%ymm0, 480(%rdx)
	ret
L_poly_invntt$1:
	leaq	glob_data + 1024(%rip), %rsi
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	(%rsi), %ymm12
	vmovdqu	64(%rsi), %ymm1
	vmovdqu	32(%rsi), %ymm2
	vmovdqu	96(%rsi), %ymm5
	vmovdqu	(%rdx), %ymm3
	vmovdqu	32(%rdx), %ymm4
	vmovdqu	64(%rdx), %ymm15
	vmovdqu	96(%rdx), %ymm11
	vmovdqu	128(%rdx), %ymm7
	vmovdqu	160(%rdx), %ymm8
	vmovdqu	192(%rdx), %ymm13
	vmovdqu	224(%rdx), %ymm14
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
	vmovdqu	%ymm1, (%rdx)
	vmovdqu	%ymm3, 32(%rdx)
	vmovdqu	%ymm6, 64(%rdx)
	vmovdqu	%ymm4, 96(%rdx)
	vmovdqu	%ymm5, 128(%rdx)
	vmovdqu	%ymm8, 160(%rdx)
	vmovdqu	%ymm9, 192(%rdx)
	vmovdqu	%ymm7, 224(%rdx)
	vmovdqu	392(%rsi), %ymm12
	vmovdqu	456(%rsi), %ymm1
	vmovdqu	424(%rsi), %ymm2
	vmovdqu	488(%rsi), %ymm5
	vmovdqu	256(%rdx), %ymm3
	vmovdqu	288(%rdx), %ymm4
	vmovdqu	320(%rdx), %ymm15
	vmovdqu	352(%rdx), %ymm11
	vmovdqu	384(%rdx), %ymm7
	vmovdqu	416(%rdx), %ymm8
	vmovdqu	448(%rdx), %ymm13
	vmovdqu	480(%rdx), %ymm14
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
	vmovdqu	%ymm5, 384(%rdx)
	vmovdqu	%ymm8, 416(%rdx)
	vmovdqu	%ymm9, 448(%rdx)
	vmovdqu	%ymm7, 480(%rdx)
	vpbroadcastd	784(%rsi), %ymm1
	vpbroadcastd	788(%rsi), %ymm2
	vmovdqu	%ymm4, %ymm7
	vmovdqu	%ymm3, %ymm4
	vmovdqu	%ymm10, %ymm3
	vmovdqu	(%rdx), %ymm9
	vmovdqu	32(%rdx), %ymm13
	vmovdqu	64(%rdx), %ymm5
	vmovdqu	96(%rdx), %ymm8
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
	vmovdqu	%ymm10, 256(%rdx)
	vmovdqu	%ymm6, 288(%rdx)
	vmovdqu	%ymm11, 320(%rdx)
	vmovdqu	%ymm12, 352(%rdx)
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
	vmovdqu	%ymm3, (%rdx)
	vmovdqu	%ymm4, 32(%rdx)
	vmovdqu	%ymm5, 64(%rdx)
	vmovdqu	%ymm6, 96(%rdx)
	vmovdqu	384(%rdx), %ymm4
	vmovdqu	416(%rdx), %ymm5
	vmovdqu	448(%rdx), %ymm7
	vmovdqu	480(%rdx), %ymm10
	vmovdqu	128(%rdx), %ymm6
	vmovdqu	160(%rdx), %ymm9
	vmovdqu	192(%rdx), %ymm8
	vmovdqu	224(%rdx), %ymm11
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
	vmovdqu	%ymm1, 384(%rdx)
	vmovdqu	%ymm6, 416(%rdx)
	vmovdqu	%ymm8, 448(%rdx)
	vmovdqu	%ymm9, 480(%rdx)
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
	vmovdqu	%ymm1, 128(%rdx)
	vmovdqu	%ymm4, 160(%rdx)
	vmovdqu	%ymm5, 192(%rdx)
	vmovdqu	%ymm0, 224(%rdx)
	ret
L_poly_getnoise_eta1_4x$1:
	leaq	32(%rsp), %rcx
	leaq	160(%rsp), %rdx
	leaq	288(%rsp), %rdi
	leaq	416(%rsp), %r8
	movq	%rsi, 544(%rsp)
	movq	%r10, 552(%rsp)
	movq	%r11, 560(%rsp)
	movq	%rbx, 568(%rsp)
	movb	%bpl, 576(%rsp)
	incb	%bpl
	movb	%bpl, 577(%rsp)
	incb	%bpl
	movb	%bpl, 578(%rsp)
	incb	%bpl
	movb	%bpl, 579(%rsp)
	leaq	576(%rsp), %r10
	leaq	-824(%rsp), %rsp
	call	L_shake256x4_A128__A32_A1$1
L_poly_getnoise_eta1_4x$2:
	leaq	824(%rsp), %rsp
	movq	544(%rsp), %rsi
	movq	552(%rsp), %r9
	movq	560(%rsp), %r10
	movq	568(%rsp), %r11
	movl	$1431655765, 576(%rsp)
	movl	$858993459, 580(%rsp)
	movl	$50529027, 584(%rsp)
	movl	$252645135, 588(%rsp)
	vpbroadcastd	576(%rsp), %ymm0
	vpbroadcastd	580(%rsp), %ymm1
	vpbroadcastd	584(%rsp), %ymm2
	vpbroadcastd	588(%rsp), %ymm3
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
	vmovdqu	%ymm5, (%rsi)
	vmovdqu	%ymm7, 32(%rsi)
	vmovdqu	%ymm6, 64(%rsi)
	vmovdqu	%ymm4, 96(%rsi)
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
	vmovdqu	%ymm5, 128(%rsi)
	vmovdqu	%ymm7, 160(%rsi)
	vmovdqu	%ymm6, 192(%rsi)
	vmovdqu	%ymm4, 224(%rsi)
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
	vmovdqu	%ymm5, 256(%rsi)
	vmovdqu	%ymm7, 288(%rsi)
	vmovdqu	%ymm6, 320(%rsi)
	vmovdqu	%ymm4, 352(%rsi)
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
	vmovdqu	%ymm1, 384(%rsi)
	vmovdqu	%ymm3, 416(%rsi)
	vmovdqu	%ymm2, 448(%rsi)
	vmovdqu	%ymm0, 480(%rsi)
	movl	$1431655765, 588(%rsp)
	movl	$858993459, 584(%rsp)
	movl	$50529027, 580(%rsp)
	movl	$252645135, 576(%rsp)
	vpbroadcastd	588(%rsp), %ymm0
	vpbroadcastd	584(%rsp), %ymm1
	vpbroadcastd	580(%rsp), %ymm2
	vpbroadcastd	576(%rsp), %ymm3
	vmovdqu	(%rdx), %ymm4
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
	vmovdqu	32(%rdx), %ymm4
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
	vmovdqu	64(%rdx), %ymm4
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
	vmovdqu	96(%rdx), %ymm4
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
	movl	$1431655765, 576(%rsp)
	movl	$858993459, 580(%rsp)
	movl	$50529027, 584(%rsp)
	movl	$252645135, 588(%rsp)
	vpbroadcastd	576(%rsp), %ymm0
	vpbroadcastd	580(%rsp), %ymm1
	vpbroadcastd	584(%rsp), %ymm2
	vpbroadcastd	588(%rsp), %ymm3
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
	movl	$1431655765, 588(%rsp)
	movl	$858993459, 584(%rsp)
	movl	$50529027, 580(%rsp)
	movl	$252645135, 576(%rsp)
	vpbroadcastd	588(%rsp), %ymm0
	vpbroadcastd	584(%rsp), %ymm1
	vpbroadcastd	580(%rsp), %ymm2
	vpbroadcastd	576(%rsp), %ymm3
	vmovdqu	(%r8), %ymm4
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
	vmovdqu	%ymm5, (%r11)
	vmovdqu	%ymm7, 32(%r11)
	vmovdqu	%ymm6, 64(%r11)
	vmovdqu	%ymm4, 96(%r11)
	vmovdqu	32(%r8), %ymm4
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
	vmovdqu	%ymm5, 128(%r11)
	vmovdqu	%ymm7, 160(%r11)
	vmovdqu	%ymm6, 192(%r11)
	vmovdqu	%ymm4, 224(%r11)
	vmovdqu	64(%r8), %ymm4
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
	vmovdqu	%ymm5, 256(%r11)
	vmovdqu	%ymm7, 288(%r11)
	vmovdqu	%ymm6, 320(%r11)
	vmovdqu	%ymm4, 352(%r11)
	vmovdqu	96(%r8), %ymm4
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
	vmovdqu	%ymm1, 384(%r11)
	vmovdqu	%ymm3, 416(%r11)
	vmovdqu	%ymm2, 448(%r11)
	vmovdqu	%ymm0, 480(%r11)
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
	vmovdqu	%ymm5, (%rdx)
	vmovdqu	%ymm4, 32(%rdx)
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
	vmovdqu	%ymm3, 64(%rdx)
	vmovdqu	%ymm2, 96(%rdx)
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
	vmovdqu	%ymm5, 128(%rdx)
	vmovdqu	%ymm4, 160(%rdx)
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
	vmovdqu	%ymm3, 192(%rdx)
	vmovdqu	%ymm2, 224(%rdx)
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
	vmovdqu	%ymm5, 256(%rdx)
	vmovdqu	%ymm4, 288(%rdx)
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
	vmovdqu	%ymm3, 320(%rdx)
	vmovdqu	%ymm2, 352(%rdx)
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
	vmovdqu	%ymm5, 384(%rdx)
	vmovdqu	%ymm4, 416(%rdx)
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
	vmovdqu	%ymm3, 448(%rdx)
	vmovdqu	%ymm0, 480(%rdx)
	ret
L_poly_csubq$1:
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, (%rdx)
	vmovdqu	32(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 32(%rdx)
	vmovdqu	64(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 64(%rdx)
	vmovdqu	96(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 96(%rdx)
	vmovdqu	128(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 128(%rdx)
	vmovdqu	160(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 160(%rdx)
	vmovdqu	192(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 192(%rdx)
	vmovdqu	224(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 224(%rdx)
	vmovdqu	256(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 256(%rdx)
	vmovdqu	288(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 288(%rdx)
	vmovdqu	320(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 320(%rdx)
	vmovdqu	352(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 352(%rdx)
	vmovdqu	384(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 384(%rdx)
	vmovdqu	416(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 416(%rdx)
	vmovdqu	448(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpaddw	%ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 448(%rdx)
	vmovdqu	480(%rdx), %ymm1
	vpsubw	%ymm0, %ymm1, %ymm1
	vpsraw	$15, %ymm1, %ymm2
	vpand	%ymm0, %ymm2, %ymm0
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 480(%rdx)
	ret
L_poly_add2$1:
	vmovdqu	(%rdx), %ymm0
	vmovdqu	(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rdx)
	vmovdqu	32(%rdx), %ymm0
	vmovdqu	32(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rdx)
	vmovdqu	64(%rdx), %ymm0
	vmovdqu	64(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 64(%rdx)
	vmovdqu	96(%rdx), %ymm0
	vmovdqu	96(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 96(%rdx)
	vmovdqu	128(%rdx), %ymm0
	vmovdqu	128(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 128(%rdx)
	vmovdqu	160(%rdx), %ymm0
	vmovdqu	160(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 160(%rdx)
	vmovdqu	192(%rdx), %ymm0
	vmovdqu	192(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 192(%rdx)
	vmovdqu	224(%rdx), %ymm0
	vmovdqu	224(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 224(%rdx)
	vmovdqu	256(%rdx), %ymm0
	vmovdqu	256(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 256(%rdx)
	vmovdqu	288(%rdx), %ymm0
	vmovdqu	288(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 288(%rdx)
	vmovdqu	320(%rdx), %ymm0
	vmovdqu	320(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 320(%rdx)
	vmovdqu	352(%rdx), %ymm0
	vmovdqu	352(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 352(%rdx)
	vmovdqu	384(%rdx), %ymm0
	vmovdqu	384(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 384(%rdx)
	vmovdqu	416(%rdx), %ymm0
	vmovdqu	416(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 416(%rdx)
	vmovdqu	448(%rdx), %ymm0
	vmovdqu	448(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 448(%rdx)
	vmovdqu	480(%rdx), %ymm0
	vmovdqu	480(%rsi), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 480(%rdx)
	ret
L_shake128x4_squeeze3blocks$1:
	movq	%r8, %rbx
	leaq	536(%r8), %rbp
	leaq	1072(%r8), %r12
	leaq	1608(%r8), %r13
	movq	$0, %r14
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake128x4_squeeze3blocks$16:
	leaq	824(%rsp), %rsp
	movq	$0, %r9
	jmp 	L_shake128x4_squeeze3blocks$14
L_shake128x4_squeeze3blocks$15:
	vmovdqu	(%rsi,%r9,4), %ymm0
	vmovdqu	32(%rsi,%r9,4), %ymm1
	vmovdqu	64(%rsi,%r9,4), %ymm2
	vmovdqu	96(%rsi,%r9,4), %ymm3
	addq	$32, %r9
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%rbx,%r14)
	vmovdqu	%ymm3, (%rbp,%r14)
	vmovdqu	%ymm4, (%r12,%r14)
	vmovdqu	%ymm0, (%r13,%r14)
	addq	$32, %r14
L_shake128x4_squeeze3blocks$14:
	cmpq	$160, %r9
	jl  	L_shake128x4_squeeze3blocks$15
	jmp 	L_shake128x4_squeeze3blocks$12
L_shake128x4_squeeze3blocks$13:
	movq	(%rsi,%r9,4), %r10
	movq	%r10, (%rbx,%r14)
	movq	8(%rsi,%r9,4), %r10
	movq	%r10, (%rbp,%r14)
	movq	16(%rsi,%r9,4), %r10
	movq	%r10, (%r12,%r14)
	movq	24(%rsi,%r9,4), %r10
	movq	%r10, (%r13,%r14)
	addq	$8, %r9
	addq	$8, %r14
L_shake128x4_squeeze3blocks$12:
	cmpq	$168, %r9
	jl  	L_shake128x4_squeeze3blocks$13
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake128x4_squeeze3blocks$11:
	leaq	824(%rsp), %rsp
	movq	$0, %r9
	jmp 	L_shake128x4_squeeze3blocks$9
L_shake128x4_squeeze3blocks$10:
	vmovdqu	(%rsi,%r9,4), %ymm0
	vmovdqu	32(%rsi,%r9,4), %ymm1
	vmovdqu	64(%rsi,%r9,4), %ymm2
	vmovdqu	96(%rsi,%r9,4), %ymm3
	addq	$32, %r9
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%rbx,%r14)
	vmovdqu	%ymm3, (%rbp,%r14)
	vmovdqu	%ymm4, (%r12,%r14)
	vmovdqu	%ymm0, (%r13,%r14)
	addq	$32, %r14
L_shake128x4_squeeze3blocks$9:
	cmpq	$160, %r9
	jl  	L_shake128x4_squeeze3blocks$10
	jmp 	L_shake128x4_squeeze3blocks$7
L_shake128x4_squeeze3blocks$8:
	movq	(%rsi,%r9,4), %r10
	movq	%r10, (%rbx,%r14)
	movq	8(%rsi,%r9,4), %r10
	movq	%r10, (%rbp,%r14)
	movq	16(%rsi,%r9,4), %r10
	movq	%r10, (%r12,%r14)
	movq	24(%rsi,%r9,4), %r10
	movq	%r10, (%r13,%r14)
	addq	$8, %r9
	addq	$8, %r14
L_shake128x4_squeeze3blocks$7:
	cmpq	$168, %r9
	jl  	L_shake128x4_squeeze3blocks$8
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake128x4_squeeze3blocks$6:
	leaq	824(%rsp), %rsp
	movq	$0, %r9
	jmp 	L_shake128x4_squeeze3blocks$4
L_shake128x4_squeeze3blocks$5:
	vmovdqu	(%rsi,%r9,4), %ymm0
	vmovdqu	32(%rsi,%r9,4), %ymm1
	vmovdqu	64(%rsi,%r9,4), %ymm2
	vmovdqu	96(%rsi,%r9,4), %ymm3
	addq	$32, %r9
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%rbx,%r14)
	vmovdqu	%ymm3, (%rbp,%r14)
	vmovdqu	%ymm4, (%r12,%r14)
	vmovdqu	%ymm0, (%r13,%r14)
	addq	$32, %r14
L_shake128x4_squeeze3blocks$4:
	cmpq	$192, %r9
	jl  	L_shake128x4_squeeze3blocks$5
	jmp 	L_shake128x4_squeeze3blocks$2
L_shake128x4_squeeze3blocks$3:
	movq	(%rsi,%r9,4), %r10
	movq	%r10, (%rbx,%r14)
	movq	8(%rsi,%r9,4), %r10
	movq	%r10, (%rbp,%r14)
	movq	16(%rsi,%r9,4), %r10
	movq	%r10, (%r12,%r14)
	movq	24(%rsi,%r9,4), %r10
	movq	%r10, (%r13,%r14)
	addq	$8, %r9
	addq	$8, %r14
L_shake128x4_squeeze3blocks$2:
	cmpq	$200, %r9
	jl  	L_shake128x4_squeeze3blocks$3
	ret
L_shake128_next_state$1:
	leaq	336(%rsi), %r11
	vpbroadcastq	(%r11), %ymm4
	vmovdqu	8(%r11), %ymm5
	vmovq	40(%r11), %xmm0
	vmovdqu	48(%r11), %ymm1
	vmovq	80(%r11), %xmm2
	vmovdqu	88(%r11), %ymm3
	movq	120(%r11), %rbp
	vpinsrq	$1, %rbp, %xmm0, %xmm0
	vmovdqu	128(%r11), %ymm7
	movq	160(%r11), %rbp
	vpinsrq	$1, %rbp, %xmm2, %xmm2
	vinserti128	$1, %xmm0, %ymm2, %ymm6
	vmovdqu	168(%r11), %ymm2
	vpblendd	$195, %ymm7, %ymm1, %ymm8
	vpblendd	$195, %ymm3, %ymm2, %ymm9
	vpblendd	$195, %ymm1, %ymm3, %ymm3
	vpblendd	$240, %ymm9, %ymm8, %ymm0
	vpblendd	$240, %ymm8, %ymm9, %ymm1
	vpblendd	$195, %ymm2, %ymm7, %ymm7
	vpblendd	$240, %ymm3, %ymm7, %ymm2
	vpblendd	$240, %ymm7, %ymm3, %ymm3
	call	L_keccakf1600_avx2$1
L_shake128_next_state$2:
	movq	$336, %r11
	movq	%xmm4, (%rsi,%r11)
	vpunpckhqdq	%xmm4, %xmm4, %xmm4
	vmovdqu	%ymm5, 8(%rsi,%r11)
	vmovdqu	%xmm6, %xmm4
	vextracti128	$1, %ymm6, %xmm5
	movq	%xmm5, %rbp
	movq	%rbp, 40(%rsi,%r11)
	vpunpckhqdq	%xmm5, %xmm5, %xmm5
	vpblendd	$240, %ymm1, %ymm0, %ymm6
	vpblendd	$240, %ymm0, %ymm1, %ymm0
	vpblendd	$240, %ymm3, %ymm2, %ymm1
	vpblendd	$240, %ymm2, %ymm3, %ymm2
	vpblendd	$195, %ymm2, %ymm6, %ymm3
	vmovdqu	%ymm3, 48(%rsi,%r11)
	movq	%xmm4, %rbp
	movq	%rbp, 80(%rsi,%r11)
	vpunpckhqdq	%xmm4, %xmm4, %xmm3
	vpblendd	$195, %ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 88(%rsi,%r11)
	movq	%xmm5, %rbp
	movq	%rbp, 120(%rsi,%r11)
	vpblendd	$195, %ymm6, %ymm1, %ymm2
	vmovdqu	%ymm2, 128(%rsi,%r11)
	movq	%xmm3, %rbp
	movq	%rbp, 160(%rsi,%r11)
	vpblendd	$195, %ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 168(%rsi,%r11)
	ret
L_shake128_squeeze3blocks$1:
	call	L_keccakf1600_avx2$1
L_shake128_squeeze3blocks$4:
	movq	$0, %rdx
	vmovdqu	%xmm4, %xmm7
	movq	%xmm7, (%rsi,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vmovdqu	%ymm5, 8(%rsi,%rdx)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rdi
	movq	%rdi, 40(%rsi,%rdx)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm1, %ymm0, %ymm9
	vpblendd	$240, %ymm0, %ymm1, %ymm10
	vpblendd	$240, %ymm3, %ymm2, %ymm11
	vpblendd	$240, %ymm2, %ymm3, %ymm12
	vpblendd	$195, %ymm12, %ymm9, %ymm13
	vmovdqu	%ymm13, 48(%rsi,%rdx)
	movq	%xmm7, %rdi
	movq	%rdi, 80(%rsi,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$195, %ymm10, %ymm12, %ymm10
	vmovdqu	%ymm10, 88(%rsi,%rdx)
	movq	%xmm8, %rdi
	movq	%rdi, 120(%rsi,%rdx)
	vpblendd	$195, %ymm9, %ymm11, %ymm8
	vmovdqu	%ymm8, 128(%rsi,%rdx)
	movq	%xmm7, %rdi
	movq	%rdi, 160(%rsi,%rdx)
	addq	$168, %rdx
	call	L_keccakf1600_avx2$1
L_shake128_squeeze3blocks$3:
	vmovdqu	%xmm4, %xmm7
	movq	%xmm7, (%rsi,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vmovdqu	%ymm5, 8(%rsi,%rdx)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rdi
	movq	%rdi, 40(%rsi,%rdx)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm1, %ymm0, %ymm9
	vpblendd	$240, %ymm0, %ymm1, %ymm10
	vpblendd	$240, %ymm3, %ymm2, %ymm11
	vpblendd	$240, %ymm2, %ymm3, %ymm12
	vpblendd	$195, %ymm12, %ymm9, %ymm13
	vmovdqu	%ymm13, 48(%rsi,%rdx)
	movq	%xmm7, %rdi
	movq	%rdi, 80(%rsi,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$195, %ymm10, %ymm12, %ymm10
	vmovdqu	%ymm10, 88(%rsi,%rdx)
	movq	%xmm8, %rdi
	movq	%rdi, 120(%rsi,%rdx)
	vpblendd	$195, %ymm9, %ymm11, %ymm8
	vmovdqu	%ymm8, 128(%rsi,%rdx)
	movq	%xmm7, %rdi
	movq	%rdi, 160(%rsi,%rdx)
	addq	$168, %rdx
	call	L_keccakf1600_avx2$1
L_shake128_squeeze3blocks$2:
	movq	%xmm4, (%rsi,%rdx)
	vpunpckhqdq	%xmm4, %xmm4, %xmm4
	vmovdqu	%ymm5, 8(%rsi,%rdx)
	vmovdqu	%xmm6, %xmm4
	vextracti128	$1, %ymm6, %xmm5
	movq	%xmm5, %rdi
	movq	%rdi, 40(%rsi,%rdx)
	vpunpckhqdq	%xmm5, %xmm5, %xmm5
	vpblendd	$240, %ymm1, %ymm0, %ymm6
	vpblendd	$240, %ymm0, %ymm1, %ymm0
	vpblendd	$240, %ymm3, %ymm2, %ymm1
	vpblendd	$240, %ymm2, %ymm3, %ymm2
	vpblendd	$195, %ymm2, %ymm6, %ymm3
	vmovdqu	%ymm3, 48(%rsi,%rdx)
	movq	%xmm4, %rdi
	movq	%rdi, 80(%rsi,%rdx)
	vpunpckhqdq	%xmm4, %xmm4, %xmm3
	vpblendd	$195, %ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 88(%rsi,%rdx)
	movq	%xmm5, %rdi
	movq	%rdi, 120(%rsi,%rdx)
	vpblendd	$195, %ymm6, %ymm1, %ymm2
	vmovdqu	%ymm2, 128(%rsi,%rdx)
	movq	%xmm3, %rdi
	movq	%rdi, 160(%rsi,%rdx)
	vpblendd	$195, %ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 168(%rsi,%rdx)
	ret
L_shake128x4_absorb_A32_A2$1:
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %r9
	jmp 	L_shake128x4_absorb_A32_A2$4
L_shake128x4_absorb_A32_A2$5:
	vmovdqu	%ymm0, (%rsi,%r9)
	addq	$32, %r9
L_shake128x4_absorb_A32_A2$4:
	cmpq	$800, %r9
	jb  	L_shake128x4_absorb_A32_A2$5
	movq	$0, %r9
	movq	$0, %r11
	jmp 	L_shake128x4_absorb_A32_A2$2
L_shake128x4_absorb_A32_A2$3:
	vpbroadcastq	(%rdi,%r9), %ymm0
	addq	$8, %r9
	vpxor	(%rsi,%r11), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rsi,%r11)
	addq	$32, %r11
L_shake128x4_absorb_A32_A2$2:
	cmpq	$128, %r11
	jb  	L_shake128x4_absorb_A32_A2$3
	movq	$0, %rbx
	movq	%r10, %r12
	leaq	2(%r10), %r13
	leaq	4(%r10), %r9
	leaq	6(%r10), %r10
	movq	$16, %r11
	movq	$0, %rbp
	movzwq	(%r12,%rbx), %r12
	movq	$31, %r14
	shlq	$16, %r14
	orq 	%r14, %r12
	shlq	$0, %r12
	orq 	%r12, %rbp
	movq	$0, %r12
	movzwq	(%r13,%rbx), %r13
	movq	$31, %r14
	shlq	$16, %r14
	orq 	%r14, %r13
	shlq	$0, %r13
	orq 	%r13, %r12
	movq	$0, %r13
	movzwq	(%r9,%rbx), %r9
	movq	$31, %r14
	shlq	$16, %r14
	orq 	%r14, %r9
	shlq	$0, %r9
	orq 	%r9, %r13
	movq	$0, %r9
	movzwq	(%r10,%rbx), %r10
	movq	$31, %rbx
	shlq	$16, %rbx
	orq 	%rbx, %r10
	shlq	$0, %r10
	orq 	%r10, %r9
	xorq	(%rsi,%r11,8), %rbp
	movq	%rbp, (%rsi,%r11,8)
	xorq	8(%rsi,%r11,8), %r12
	movq	%r12, 8(%rsi,%r11,8)
	xorq	16(%rsi,%r11,8), %r13
	movq	%r13, 16(%rsi,%r11,8)
	xorq	24(%rsi,%r11,8), %r9
	movq	%r9, 24(%rsi,%r11,8)
	movq	$1, %r9
	shlq	$63, %r9
	movq	%r9, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpxor	640(%rsi), %ymm0, %ymm0
	vmovdqu	%ymm0, 640(%rsi)
	ret
L_shake128_absorb_A32_A2$1:
	leaq	32(%rsp), %rdx
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rdx)
	vmovdqu	%ymm0, 32(%rdx)
	vmovdqu	%ymm0, 64(%rdx)
	vmovdqu	%ymm0, 96(%rdx)
	vmovdqu	%ymm0, 128(%rdx)
	vmovdqu	%ymm0, 160(%rdx)
	movq	$0, %r9
	movq	%r9, 192(%rdx)
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %r9
	movq	$0, %r11
	jmp 	L_shake128_absorb_A32_A2$4
L_shake128_absorb_A32_A2$5:
	vmovdqu	(%rdi,%r9), %ymm7
	addq	$32, %r9
	vmovdqu	%ymm7, (%rdx,%r11,8)
	addq	$4, %r11
L_shake128_absorb_A32_A2$4:
	cmpq	$4, %r11
	jb  	L_shake128_absorb_A32_A2$5
	movq	$0, %rdi
	movq	$0, %r9
	movzwq	(%r8,%rdi), %rdi
	movq	$31, %r8
	shlq	$16, %r8
	orq 	%r8, %rdi
	shlq	$0, %rdi
	orq 	%rdi, %r9
	movq	%r9, 32(%rdx)
	movq	$5, %rdi
	jmp 	L_shake128_absorb_A32_A2$2
L_shake128_absorb_A32_A2$3:
	movq	$0, (%rdx,%rdi,8)
	incq	%rdi
L_shake128_absorb_A32_A2$2:
	cmpq	$5, %rdi
	jb  	L_shake128_absorb_A32_A2$3
	vpbroadcastq	(%rdx), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	vmovdqu	8(%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	$1, %rdx
	shlq	$63, %rdx
	vpxor	%xmm7, %xmm7, %xmm7
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	ret
L_shake256x4_A128__A32_A1$1:
	leaq	32(%rsp), %rsi
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %r11
	jmp 	L_shake256x4_A128__A32_A1$9
L_shake256x4_A128__A32_A1$10:
	vmovdqu	%ymm0, (%rsi,%r11)
	addq	$32, %r11
L_shake256x4_A128__A32_A1$9:
	cmpq	$800, %r11
	jb  	L_shake256x4_A128__A32_A1$10
	movq	$0, %r11
	movq	$0, %rbx
	jmp 	L_shake256x4_A128__A32_A1$7
L_shake256x4_A128__A32_A1$8:
	vpbroadcastq	(%r9,%r11), %ymm0
	addq	$8, %r11
	vpxor	(%rsi,%rbx), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rsi,%rbx)
	addq	$32, %rbx
L_shake256x4_A128__A32_A1$7:
	cmpq	$128, %rbx
	jb  	L_shake256x4_A128__A32_A1$8
	movq	$0, %rbx
	movq	%r10, %r12
	leaq	1(%r10), %r13
	leaq	2(%r10), %r9
	leaq	3(%r10), %r10
	movq	$16, %r11
	movq	$0, %rbp
	movq	$0, %r14
	movzbq	(%r12,%rbx), %r12
	orq 	$7936, %r12
	shlq	$0, %r12
	orq 	%r12, %r14
	shlq	$0, %r14
	orq 	%r14, %rbp
	movq	$0, %r12
	movq	$0, %r14
	movzbq	(%r13,%rbx), %r13
	orq 	$7936, %r13
	shlq	$0, %r13
	orq 	%r13, %r14
	shlq	$0, %r14
	orq 	%r14, %r12
	movq	$0, %r13
	movq	$0, %r14
	movzbq	(%r9,%rbx), %r9
	orq 	$7936, %r9
	shlq	$0, %r9
	orq 	%r9, %r14
	shlq	$0, %r14
	orq 	%r14, %r13
	movq	$0, %r9
	movq	$0, %r14
	movzbq	(%r10,%rbx), %r10
	orq 	$7936, %r10
	shlq	$0, %r10
	orq 	%r10, %r14
	shlq	$0, %r14
	orq 	%r14, %r9
	xorq	(%rsi,%r11,8), %rbp
	movq	%rbp, (%rsi,%r11,8)
	xorq	8(%rsi,%r11,8), %r12
	movq	%r12, 8(%rsi,%r11,8)
	xorq	16(%rsi,%r11,8), %r13
	movq	%r13, 16(%rsi,%r11,8)
	xorq	24(%rsi,%r11,8), %r9
	movq	%r9, 24(%rsi,%r11,8)
	movq	$1, %r9
	shlq	$63, %r9
	movq	%r9, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpxor	512(%rsi), %ymm0, %ymm0
	vmovdqu	%ymm0, 512(%rsi)
	movq	$0, %rbx
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake256x4_A128__A32_A1$6:
	leaq	824(%rsp), %rsp
	movq	$0, %r9
	jmp 	L_shake256x4_A128__A32_A1$4
L_shake256x4_A128__A32_A1$5:
	vmovdqu	(%rsi,%r9,4), %ymm0
	vmovdqu	32(%rsi,%r9,4), %ymm1
	vmovdqu	64(%rsi,%r9,4), %ymm2
	vmovdqu	96(%rsi,%r9,4), %ymm3
	addq	$32, %r9
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%rcx,%rbx)
	vmovdqu	%ymm3, (%rdx,%rbx)
	vmovdqu	%ymm4, (%rdi,%rbx)
	vmovdqu	%ymm0, (%r8,%rbx)
	addq	$32, %rbx
L_shake256x4_A128__A32_A1$4:
	cmpq	$128, %r9
	jl  	L_shake256x4_A128__A32_A1$5
	jmp 	L_shake256x4_A128__A32_A1$2
L_shake256x4_A128__A32_A1$3:
	movq	(%rsi,%r9,4), %r10
	movq	%r10, (%rcx,%rbx)
	movq	8(%rsi,%r9,4), %r10
	movq	%r10, (%rdx,%rbx)
	movq	16(%rsi,%r9,4), %r10
	movq	%r10, (%rdi,%rbx)
	movq	24(%rsi,%r9,4), %r10
	movq	%r10, (%r8,%rbx)
	addq	$8, %r9
	addq	$8, %rbx
L_shake256x4_A128__A32_A1$2:
	cmpq	$128, %r9
	jl  	L_shake256x4_A128__A32_A1$3
	ret
L_sha3_512A_A64$1:
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm7, %ymm7, %ymm7
	movq	$0, %rsi
	movq	(%rdx,%rsi), %rdi
	movq	%rdi, %xmm6
	vpbroadcastq	%xmm6, %ymm6
	vpxor	%ymm6, %ymm4, %ymm4
	vmovdqu	8(%rdx,%rsi), %ymm6
	vpxor	%ymm6, %ymm5, %ymm5
	movq	40(%rdx,%rsi), %rdi
	movq	%rdi, %xmm6
	vmovdqu	48(%rdx,%rsi), %xmm8
	movq	$6, %rdx
	movq	%rdx, %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm8
	movq	$0, %rdx
	movq	%rdx, %xmm11
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm6, %xmm6
	vpxor	%ymm10, %ymm10, %ymm10
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm11, %xmm11
	vinserti128	$1, %xmm6, %ymm11, %ymm6
	vpxor	%ymm6, %ymm0, %ymm6
	vpxor	%ymm11, %ymm11, %ymm11
	vpblendd	$195, %ymm10, %ymm8, %ymm12
	vpblendd	$195, %ymm9, %ymm11, %ymm13
	vpblendd	$195, %ymm8, %ymm9, %ymm8
	vpblendd	$240, %ymm13, %ymm12, %ymm0
	vpblendd	$240, %ymm12, %ymm13, %ymm9
	vpblendd	$195, %ymm11, %ymm10, %ymm10
	vpblendd	$240, %ymm8, %ymm10, %ymm11
	vpblendd	$240, %ymm10, %ymm8, %ymm8
	vpxor	%ymm0, %ymm1, %ymm0
	vpxor	%ymm9, %ymm2, %ymm1
	vpxor	%ymm11, %ymm3, %ymm2
	vpxor	%ymm8, %ymm7, %ymm3
	movq	$1, %rdx
	shlq	$63, %rdx
	movq	%rdx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$1, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	movq	$0, %rdx
	call	L_keccakf1600_avx2$1
L_sha3_512A_A64$2:
	movq	%xmm4, (%rcx,%rdx)
	vpunpckhqdq	%xmm4, %xmm4, %xmm4
	vmovdqu	%ymm5, 8(%rcx,%rdx)
	vextracti128	$1, %ymm6, %xmm4
	movq	%xmm4, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpunpckhqdq	%xmm4, %xmm4, %xmm4
	vpblendd	$240, %ymm1, %ymm0, %ymm4
	vpblendd	$240, %ymm0, %ymm1, %ymm0
	vpblendd	$240, %ymm3, %ymm2, %ymm0
	vpblendd	$240, %ymm2, %ymm3, %ymm0
	vpblendd	$195, %ymm0, %ymm4, %ymm0
	vmovdqu	%xmm0, %xmm1
	vmovdqu	%xmm1, 48(%rcx,%rdx)
	vextracti128	$1, %ymm0, %xmm0
	ret
L_sha3_512A_A33$1:
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rdx
	movq	(%rcx,%rdx), %rsi
	movq	%rsi, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
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
	vpxor	%ymm7, %ymm5, %ymm5
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$1, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	movq	$0, %rcx
	call	L_keccakf1600_avx2$1
L_sha3_512A_A33$2:
	movq	%xmm4, (%rax,%rcx)
	vpunpckhqdq	%xmm4, %xmm4, %xmm4
	vmovdqu	%ymm5, 8(%rax,%rcx)
	vextracti128	$1, %ymm6, %xmm4
	movq	%xmm4, %rdx
	movq	%rdx, 40(%rax,%rcx)
	vpunpckhqdq	%xmm4, %xmm4, %xmm4
	vpblendd	$240, %ymm1, %ymm0, %ymm4
	vpblendd	$240, %ymm0, %ymm1, %ymm0
	vpblendd	$240, %ymm3, %ymm2, %ymm0
	vpblendd	$240, %ymm2, %ymm3, %ymm0
	vpblendd	$195, %ymm0, %ymm4, %ymm0
	vmovdqu	%xmm0, %xmm1
	vmovdqu	%xmm1, 48(%rax,%rcx)
	vextracti128	$1, %ymm0, %xmm0
	ret
L_keccakf1600_avx2x4$1:
	leaq	glob_data + 4784(%rip), %r9
	leaq	32(%rsp), %r10
	vmovdqu	glob_data + 256(%rip), %ymm0
	vmovdqu	glob_data + 288(%rip), %ymm1
	movq	$0, %r11
	jmp 	L_keccakf1600_avx2x4$2
L_keccakf1600_avx2x4$3:
	vpbroadcastq	(%r9,%r11,8), %ymm2
	call	L_keccakf1600_4x_round$1
L_keccakf1600_avx2x4$5:
	xchg	%rsi, %r10
	vpbroadcastq	8(%r9,%r11,8), %ymm2
	call	L_keccakf1600_4x_round$1
L_keccakf1600_avx2x4$4:
	xchg	%r10, %rsi
	addq	$2, %r11
L_keccakf1600_avx2x4$2:
	cmpq	$24, %r11
	jb  	L_keccakf1600_avx2x4$3
	ret
L_keccakf1600_4x_round$1:
	vmovdqu	(%rsi), %ymm3
	vmovdqu	32(%rsi), %ymm4
	vmovdqu	64(%rsi), %ymm5
	vmovdqu	96(%rsi), %ymm6
	vmovdqu	128(%rsi), %ymm7
	vpxor	160(%rsi), %ymm3, %ymm3
	vpxor	192(%rsi), %ymm4, %ymm4
	vpxor	224(%rsi), %ymm5, %ymm5
	vpxor	256(%rsi), %ymm6, %ymm6
	vpxor	288(%rsi), %ymm7, %ymm7
	vpxor	320(%rsi), %ymm3, %ymm3
	vpxor	352(%rsi), %ymm4, %ymm4
	vpxor	384(%rsi), %ymm5, %ymm5
	vpxor	416(%rsi), %ymm6, %ymm6
	vpxor	448(%rsi), %ymm7, %ymm7
	vpxor	480(%rsi), %ymm3, %ymm3
	vpxor	512(%rsi), %ymm4, %ymm4
	vpxor	544(%rsi), %ymm5, %ymm8
	vpxor	576(%rsi), %ymm6, %ymm9
	vpxor	608(%rsi), %ymm7, %ymm10
	vpxor	640(%rsi), %ymm3, %ymm7
	vpxor	672(%rsi), %ymm4, %ymm5
	vpxor	704(%rsi), %ymm8, %ymm6
	vpxor	736(%rsi), %ymm9, %ymm8
	vpxor	768(%rsi), %ymm10, %ymm9
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
	vmovdqu	(%rsi), %ymm8
	vpxor	%ymm3, %ymm8, %ymm8
	vmovdqu	192(%rsi), %ymm9
	vpxor	%ymm4, %ymm9, %ymm9
	vpsllq	$44, %ymm9, %ymm10
	vpsrlq	$20, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	384(%rsi), %ymm10
	vpxor	%ymm5, %ymm10, %ymm10
	vpsllq	$43, %ymm10, %ymm11
	vpsrlq	$21, %ymm10, %ymm10
	vpor	%ymm11, %ymm10, %ymm10
	vmovdqu	576(%rsi), %ymm11
	vpxor	%ymm6, %ymm11, %ymm11
	vpsllq	$21, %ymm11, %ymm12
	vpsrlq	$43, %ymm11, %ymm11
	vpor	%ymm12, %ymm11, %ymm11
	vmovdqu	768(%rsi), %ymm12
	vpxor	%ymm7, %ymm12, %ymm12
	vpsllq	$14, %ymm12, %ymm13
	vpsrlq	$50, %ymm12, %ymm12
	vpor	%ymm13, %ymm12, %ymm12
	vpandn	%ymm10, %ymm9, %ymm13
	vpxor	%ymm8, %ymm13, %ymm13
	vpxor	%ymm2, %ymm13, %ymm2
	vmovdqu	%ymm2, (%r10)
	vpandn	%ymm11, %ymm10, %ymm2
	vpxor	%ymm9, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%r10)
	vpandn	%ymm12, %ymm11, %ymm2
	vpxor	%ymm10, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%r10)
	vpandn	%ymm8, %ymm12, %ymm2
	vpxor	%ymm11, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%r10)
	vpandn	%ymm9, %ymm8, %ymm2
	vpxor	%ymm12, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%r10)
	vmovdqu	96(%rsi), %ymm2
	vpxor	%ymm6, %ymm2, %ymm2
	vpsllq	$28, %ymm2, %ymm8
	vpsrlq	$36, %ymm2, %ymm2
	vpor	%ymm8, %ymm2, %ymm2
	vmovdqu	288(%rsi), %ymm8
	vpxor	%ymm7, %ymm8, %ymm8
	vpsllq	$20, %ymm8, %ymm9
	vpsrlq	$44, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm8
	vmovdqu	320(%rsi), %ymm9
	vpxor	%ymm3, %ymm9, %ymm9
	vpsllq	$3, %ymm9, %ymm10
	vpsrlq	$61, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	512(%rsi), %ymm10
	vpxor	%ymm4, %ymm10, %ymm10
	vpsllq	$45, %ymm10, %ymm11
	vpsrlq	$19, %ymm10, %ymm10
	vpor	%ymm11, %ymm10, %ymm10
	vmovdqu	704(%rsi), %ymm11
	vpxor	%ymm5, %ymm11, %ymm11
	vpsllq	$61, %ymm11, %ymm12
	vpsrlq	$3, %ymm11, %ymm11
	vpor	%ymm12, %ymm11, %ymm11
	vpandn	%ymm9, %ymm8, %ymm12
	vpxor	%ymm2, %ymm12, %ymm12
	vmovdqu	%ymm12, 160(%r10)
	vpandn	%ymm10, %ymm9, %ymm12
	vpxor	%ymm8, %ymm12, %ymm12
	vmovdqu	%ymm12, 192(%r10)
	vpandn	%ymm11, %ymm10, %ymm12
	vpxor	%ymm9, %ymm12, %ymm9
	vmovdqu	%ymm9, 224(%r10)
	vpandn	%ymm2, %ymm11, %ymm9
	vpxor	%ymm10, %ymm9, %ymm9
	vmovdqu	%ymm9, 256(%r10)
	vpandn	%ymm8, %ymm2, %ymm2
	vpxor	%ymm11, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%r10)
	vmovdqu	32(%rsi), %ymm2
	vpxor	%ymm4, %ymm2, %ymm2
	vpsllq	$1, %ymm2, %ymm8
	vpsrlq	$63, %ymm2, %ymm2
	vpor	%ymm8, %ymm2, %ymm2
	vmovdqu	224(%rsi), %ymm8
	vpxor	%ymm5, %ymm8, %ymm8
	vpsllq	$6, %ymm8, %ymm9
	vpsrlq	$58, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm8
	vmovdqu	416(%rsi), %ymm9
	vpxor	%ymm6, %ymm9, %ymm9
	vpsllq	$25, %ymm9, %ymm10
	vpsrlq	$39, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	608(%rsi), %ymm10
	vpxor	%ymm7, %ymm10, %ymm10
	vpshufb	%ymm0, %ymm10, %ymm10
	vmovdqu	640(%rsi), %ymm11
	vpxor	%ymm3, %ymm11, %ymm11
	vpsllq	$18, %ymm11, %ymm12
	vpsrlq	$46, %ymm11, %ymm11
	vpor	%ymm12, %ymm11, %ymm11
	vpandn	%ymm9, %ymm8, %ymm12
	vpxor	%ymm2, %ymm12, %ymm12
	vmovdqu	%ymm12, 320(%r10)
	vpandn	%ymm10, %ymm9, %ymm12
	vpxor	%ymm8, %ymm12, %ymm12
	vmovdqu	%ymm12, 352(%r10)
	vpandn	%ymm11, %ymm10, %ymm12
	vpxor	%ymm9, %ymm12, %ymm9
	vmovdqu	%ymm9, 384(%r10)
	vpandn	%ymm2, %ymm11, %ymm9
	vpxor	%ymm10, %ymm9, %ymm9
	vmovdqu	%ymm9, 416(%r10)
	vpandn	%ymm8, %ymm2, %ymm2
	vpxor	%ymm11, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%r10)
	vmovdqu	128(%rsi), %ymm2
	vpxor	%ymm7, %ymm2, %ymm2
	vpsllq	$27, %ymm2, %ymm8
	vpsrlq	$37, %ymm2, %ymm2
	vpor	%ymm8, %ymm2, %ymm2
	vmovdqu	160(%rsi), %ymm8
	vpxor	%ymm3, %ymm8, %ymm8
	vpsllq	$36, %ymm8, %ymm9
	vpsrlq	$28, %ymm8, %ymm8
	vpor	%ymm9, %ymm8, %ymm8
	vmovdqu	352(%rsi), %ymm9
	vpxor	%ymm4, %ymm9, %ymm9
	vpsllq	$10, %ymm9, %ymm10
	vpsrlq	$54, %ymm9, %ymm9
	vpor	%ymm10, %ymm9, %ymm9
	vmovdqu	544(%rsi), %ymm10
	vpxor	%ymm5, %ymm10, %ymm10
	vpsllq	$15, %ymm10, %ymm11
	vpsrlq	$49, %ymm10, %ymm10
	vpor	%ymm11, %ymm10, %ymm10
	vmovdqu	736(%rsi), %ymm11
	vpxor	%ymm6, %ymm11, %ymm11
	vpshufb	%ymm1, %ymm11, %ymm11
	vpandn	%ymm9, %ymm8, %ymm12
	vpxor	%ymm2, %ymm12, %ymm12
	vmovdqu	%ymm12, 480(%r10)
	vpandn	%ymm10, %ymm9, %ymm12
	vpxor	%ymm8, %ymm12, %ymm12
	vmovdqu	%ymm12, 512(%r10)
	vpandn	%ymm11, %ymm10, %ymm12
	vpxor	%ymm9, %ymm12, %ymm9
	vmovdqu	%ymm9, 544(%r10)
	vpandn	%ymm2, %ymm11, %ymm9
	vpxor	%ymm10, %ymm9, %ymm9
	vmovdqu	%ymm9, 576(%r10)
	vpandn	%ymm8, %ymm2, %ymm2
	vpxor	%ymm11, %ymm2, %ymm2
	vmovdqu	%ymm2, 608(%r10)
	vmovdqu	64(%rsi), %ymm2
	vpxor	%ymm5, %ymm2, %ymm2
	vpsllq	$62, %ymm2, %ymm5
	vpsrlq	$2, %ymm2, %ymm2
	vpor	%ymm5, %ymm2, %ymm2
	vmovdqu	256(%rsi), %ymm5
	vpxor	%ymm6, %ymm5, %ymm5
	vpsllq	$55, %ymm5, %ymm6
	vpsrlq	$9, %ymm5, %ymm5
	vpor	%ymm6, %ymm5, %ymm5
	vmovdqu	448(%rsi), %ymm6
	vpxor	%ymm7, %ymm6, %ymm6
	vpsllq	$39, %ymm6, %ymm7
	vpsrlq	$25, %ymm6, %ymm6
	vpor	%ymm7, %ymm6, %ymm6
	vmovdqu	480(%rsi), %ymm7
	vpxor	%ymm3, %ymm7, %ymm3
	vpsllq	$41, %ymm3, %ymm7
	vpsrlq	$23, %ymm3, %ymm3
	vpor	%ymm7, %ymm3, %ymm3
	vmovdqu	672(%rsi), %ymm7
	vpxor	%ymm4, %ymm7, %ymm4
	vpsllq	$2, %ymm4, %ymm7
	vpsrlq	$62, %ymm4, %ymm4
	vpor	%ymm7, %ymm4, %ymm4
	vpandn	%ymm6, %ymm5, %ymm7
	vpxor	%ymm2, %ymm7, %ymm7
	vmovdqu	%ymm7, 640(%r10)
	vpandn	%ymm3, %ymm6, %ymm7
	vpxor	%ymm5, %ymm7, %ymm7
	vmovdqu	%ymm7, 672(%r10)
	vpandn	%ymm4, %ymm3, %ymm7
	vpxor	%ymm6, %ymm7, %ymm6
	vmovdqu	%ymm6, 704(%r10)
	vpandn	%ymm2, %ymm4, %ymm6
	vpxor	%ymm3, %ymm6, %ymm3
	vmovdqu	%ymm3, 736(%r10)
	vpandn	%ymm5, %ymm2, %ymm2
	vpxor	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 768(%r10)
	ret
L_keccakf1600_avx2$1:
	leaq	glob_data + 4784(%rip), %r11
	movq	$0, %rbp
L_keccakf1600_avx2$2:
	vpshufd	$78, %ymm6, %ymm8
	vpxor	%ymm0, %ymm2, %ymm7
	vpxor	%ymm3, %ymm1, %ymm9
	vpxor	%ymm5, %ymm7, %ymm7
	vpxor	%ymm9, %ymm7, %ymm10
	vpermq	$147, %ymm10, %ymm7
	vpxor	%ymm6, %ymm8, %ymm8
	vpermq	$78, %ymm8, %ymm9
	vpsrlq	$63, %ymm10, %ymm11
	vpaddq	%ymm10, %ymm10, %ymm10
	vpor	%ymm10, %ymm11, %ymm11
	vpermq	$57, %ymm11, %ymm10
	vpxor	%ymm7, %ymm11, %ymm11
	vpermq	$0, %ymm11, %ymm11
	vpxor	%ymm4, %ymm8, %ymm8
	vpxor	%ymm9, %ymm8, %ymm8
	vpsrlq	$63, %ymm8, %ymm9
	vpaddq	%ymm8, %ymm8, %ymm12
	vpor	%ymm9, %ymm12, %ymm9
	vpxor	%ymm11, %ymm6, %ymm6
	vpxor	%ymm11, %ymm4, %ymm4
	vpblendd	$192, %ymm9, %ymm10, %ymm9
	vpblendd	$3, %ymm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm9, %ymm9
	vpsllvq	glob_data + 512(%rip), %ymm6, %ymm7
	vpsrlvq	glob_data + 320(%rip), %ymm6, %ymm6
	vpor	%ymm7, %ymm6, %ymm6
	vpxor	%ymm9, %ymm0, %ymm0
	vpsllvq	glob_data + 576(%rip), %ymm0, %ymm7
	vpsrlvq	glob_data + 384(%rip), %ymm0, %ymm0
	vpor	%ymm7, %ymm0, %ymm0
	vpxor	%ymm9, %ymm1, %ymm1
	vpsllvq	glob_data + 608(%rip), %ymm1, %ymm7
	vpsrlvq	glob_data + 416(%rip), %ymm1, %ymm1
	vpor	%ymm7, %ymm1, %ymm10
	vpxor	%ymm9, %ymm2, %ymm1
	vpsllvq	glob_data + 640(%rip), %ymm1, %ymm2
	vpsrlvq	glob_data + 448(%rip), %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm2
	vpxor	%ymm9, %ymm3, %ymm3
	vpermq	$141, %ymm6, %ymm1
	vpermq	$141, %ymm0, %ymm7
	vpsllvq	glob_data + 672(%rip), %ymm3, %ymm0
	vpsrlvq	glob_data + 480(%rip), %ymm3, %ymm3
	vpor	%ymm0, %ymm3, %ymm8
	vpxor	%ymm9, %ymm5, %ymm0
	vpermq	$27, %ymm10, %ymm5
	vpermq	$114, %ymm2, %ymm9
	vpsllvq	glob_data + 544(%rip), %ymm0, %ymm2
	vpsrlvq	glob_data + 352(%rip), %ymm0, %ymm0
	vpor	%ymm2, %ymm0, %ymm10
	vpsrldq	$8, %ymm8, %ymm0
	vpandn	%ymm0, %ymm8, %ymm0
	vpblendd	$12, %ymm9, %ymm10, %ymm2
	vpblendd	$12, %ymm10, %ymm7, %ymm3
	vpblendd	$12, %ymm7, %ymm1, %ymm6
	vpblendd	$12, %ymm1, %ymm10, %ymm11
	vpblendd	$48, %ymm7, %ymm2, %ymm2
	vpblendd	$48, %ymm5, %ymm3, %ymm3
	vpblendd	$48, %ymm10, %ymm6, %ymm6
	vpblendd	$48, %ymm9, %ymm11, %ymm11
	vpblendd	$192, %ymm5, %ymm2, %ymm2
	vpblendd	$192, %ymm9, %ymm3, %ymm3
	vpblendd	$192, %ymm9, %ymm6, %ymm6
	vpblendd	$192, %ymm7, %ymm11, %ymm11
	vpandn	%ymm3, %ymm2, %ymm2
	vpandn	%ymm11, %ymm6, %ymm3
	vpblendd	$12, %ymm10, %ymm5, %ymm6
	vpblendd	$12, %ymm5, %ymm1, %ymm11
	vpxor	%ymm1, %ymm2, %ymm2
	vpblendd	$48, %ymm1, %ymm6, %ymm6
	vpblendd	$48, %ymm7, %ymm11, %ymm11
	vpxor	%ymm5, %ymm3, %ymm3
	vpblendd	$192, %ymm7, %ymm6, %ymm6
	vpblendd	$192, %ymm10, %ymm11, %ymm11
	vpandn	%ymm11, %ymm6, %ymm6
	vpxor	%ymm9, %ymm6, %ymm12
	vpermq	$30, %ymm8, %ymm6
	vpblendd	$48, %ymm4, %ymm6, %ymm6
	vpermq	$57, %ymm8, %ymm11
	vpblendd	$192, %ymm4, %ymm11, %ymm11
	vpandn	%ymm6, %ymm11, %ymm11
	vpblendd	$12, %ymm5, %ymm7, %ymm6
	vpblendd	$12, %ymm7, %ymm9, %ymm13
	vpblendd	$48, %ymm9, %ymm6, %ymm6
	vpblendd	$48, %ymm1, %ymm13, %ymm13
	vpblendd	$192, %ymm1, %ymm6, %ymm6
	vpblendd	$192, %ymm5, %ymm13, %ymm13
	vpandn	%ymm13, %ymm6, %ymm6
	vpxor	%ymm10, %ymm6, %ymm6
	vpermq	$0, %ymm0, %ymm13
	vpermq	$27, %ymm2, %ymm0
	vpermq	$141, %ymm3, %ymm2
	vpermq	$114, %ymm12, %ymm3
	vpblendd	$12, %ymm1, %ymm9, %ymm12
	vpblendd	$12, %ymm9, %ymm5, %ymm9
	vpblendd	$48, %ymm5, %ymm12, %ymm5
	vpblendd	$48, %ymm10, %ymm9, %ymm9
	vpblendd	$192, %ymm10, %ymm5, %ymm5
	vpblendd	$192, %ymm1, %ymm9, %ymm1
	vpandn	%ymm1, %ymm5, %ymm1
	vpxor	%ymm13, %ymm4, %ymm4
	vpxor	%ymm8, %ymm11, %ymm5
	vpxor	%ymm7, %ymm1, %ymm1
	vpbroadcastq	(%r11,%rbp,8), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	incq	%rbp
	cmpq	$24, %rbp
	jb  	L_keccakf1600_avx2$2
	ret
L_nttunpack$1:
	vmovdqu	(%rdx), %ymm1
	vmovdqu	32(%rdx), %ymm3
	vmovdqu	64(%rdx), %ymm4
	vmovdqu	96(%rdx), %ymm5
	vmovdqu	128(%rdx), %ymm2
	vmovdqu	160(%rdx), %ymm6
	vmovdqu	192(%rdx), %ymm7
	vmovdqu	224(%rdx), %ymm8
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
	vmovdqu	%ymm7, (%rdx)
	vmovdqu	%ymm4, 32(%rdx)
	vmovdqu	%ymm8, 64(%rdx)
	vmovdqu	%ymm0, 96(%rdx)
	vmovdqu	%ymm5, 128(%rdx)
	vmovdqu	%ymm1, 160(%rdx)
	vmovdqu	%ymm6, 192(%rdx)
	vmovdqu	%ymm2, 224(%rdx)
	vmovdqu	256(%rdx), %ymm1
	vmovdqu	288(%rdx), %ymm3
	vmovdqu	320(%rdx), %ymm4
	vmovdqu	352(%rdx), %ymm5
	vmovdqu	384(%rdx), %ymm2
	vmovdqu	416(%rdx), %ymm6
	vmovdqu	448(%rdx), %ymm7
	vmovdqu	480(%rdx), %ymm8
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
	vmovdqu	%ymm7, 256(%rdx)
	vmovdqu	%ymm4, 288(%rdx)
	vmovdqu	%ymm8, 320(%rdx)
	vmovdqu	%ymm0, 352(%rdx)
	vmovdqu	%ymm5, 384(%rdx)
	vmovdqu	%ymm1, 416(%rdx)
	vmovdqu	%ymm6, 448(%rdx)
	vmovdqu	%ymm2, 480(%rdx)
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
G$pvc_sllvdidx_s$1:
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
G$pvc_shift2_s$1:
	.byte	1
	.byte	0
	.byte	0
	.byte	4
	.byte	1
	.byte	0
	.byte	0
	.byte	4
G$pvd_sllvdidx_s$1:
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
G$pvd_mask_s$1:
	.byte	-8
	.byte	31
	.byte	-32
	.byte	127
G$pvd_q_s$1:
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
G$pvc_mask_s$1:
	.byte	-1
	.byte	3
G$pvc_shift1_s$1:
	.byte	0
	.byte	16
G$pvc_off_s$1:
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
G$pvc_shufbidx_s$1:
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
G$pvd_shufbdidx_s$1:
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
