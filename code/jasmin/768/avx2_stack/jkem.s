	.att_syntax
	.text
	.p2align	5
	.global	_jade_kem_mlkem_mlkem768_amd64_avx2_dec
	.global	jade_kem_mlkem_mlkem768_amd64_avx2_dec
	.global	_jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand
	.global	jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand
	.global	_jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand
	.global	jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand
	.global	__gen_matrix_avx2
	.global	_gen_matrix_avx2
_jade_kem_mlkem_mlkem768_amd64_avx2_dec:
jade_kem_mlkem_mlkem768_amd64_avx2_dec:
	movq	%rsp, %rax
	leaq	-24464(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 24408(%rsp)
	movq	%rbp, 24416(%rsp)
	movq	%r12, 24424(%rsp)
	movq	%r13, 24432(%rsp)
	movq	%r14, 24440(%rsp)
	movq	%r15, 24448(%rsp)
	movq	%rax, 24456(%rsp)
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
	movq	%rax, 19600(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 19608(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 19616(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 19624(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 19632(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 19640(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 19648(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 19656(%rsp)
	movq	64(%rdx), %rax
	movq	%rax, 19664(%rsp)
	movq	72(%rdx), %rax
	movq	%rax, 19672(%rsp)
	movq	80(%rdx), %rax
	movq	%rax, 19680(%rsp)
	movq	88(%rdx), %rax
	movq	%rax, 19688(%rsp)
	movq	96(%rdx), %rax
	movq	%rax, 19696(%rsp)
	movq	104(%rdx), %rax
	movq	%rax, 19704(%rsp)
	movq	112(%rdx), %rax
	movq	%rax, 19712(%rsp)
	movq	120(%rdx), %rax
	movq	%rax, 19720(%rsp)
	movq	128(%rdx), %rax
	movq	%rax, 19728(%rsp)
	movq	136(%rdx), %rax
	movq	%rax, 19736(%rsp)
	movq	144(%rdx), %rax
	movq	%rax, 19744(%rsp)
	movq	152(%rdx), %rax
	movq	%rax, 19752(%rsp)
	movq	160(%rdx), %rax
	movq	%rax, 19760(%rsp)
	movq	168(%rdx), %rax
	movq	%rax, 19768(%rsp)
	movq	176(%rdx), %rax
	movq	%rax, 19776(%rsp)
	movq	184(%rdx), %rax
	movq	%rax, 19784(%rsp)
	movq	192(%rdx), %rax
	movq	%rax, 19792(%rsp)
	movq	200(%rdx), %rax
	movq	%rax, 19800(%rsp)
	movq	208(%rdx), %rax
	movq	%rax, 19808(%rsp)
	movq	216(%rdx), %rax
	movq	%rax, 19816(%rsp)
	movq	224(%rdx), %rax
	movq	%rax, 19824(%rsp)
	movq	232(%rdx), %rax
	movq	%rax, 19832(%rsp)
	movq	240(%rdx), %rax
	movq	%rax, 19840(%rsp)
	movq	248(%rdx), %rax
	movq	%rax, 19848(%rsp)
	movq	256(%rdx), %rax
	movq	%rax, 19856(%rsp)
	movq	264(%rdx), %rax
	movq	%rax, 19864(%rsp)
	movq	272(%rdx), %rax
	movq	%rax, 19872(%rsp)
	movq	280(%rdx), %rax
	movq	%rax, 19880(%rsp)
	movq	288(%rdx), %rax
	movq	%rax, 19888(%rsp)
	movq	296(%rdx), %rax
	movq	%rax, 19896(%rsp)
	movq	304(%rdx), %rax
	movq	%rax, 19904(%rsp)
	movq	312(%rdx), %rax
	movq	%rax, 19912(%rsp)
	movq	320(%rdx), %rax
	movq	%rax, 19920(%rsp)
	movq	328(%rdx), %rax
	movq	%rax, 19928(%rsp)
	movq	336(%rdx), %rax
	movq	%rax, 19936(%rsp)
	movq	344(%rdx), %rax
	movq	%rax, 19944(%rsp)
	movq	352(%rdx), %rax
	movq	%rax, 19952(%rsp)
	movq	360(%rdx), %rax
	movq	%rax, 19960(%rsp)
	movq	368(%rdx), %rax
	movq	%rax, 19968(%rsp)
	movq	376(%rdx), %rax
	movq	%rax, 19976(%rsp)
	movq	384(%rdx), %rax
	movq	%rax, 19984(%rsp)
	movq	392(%rdx), %rax
	movq	%rax, 19992(%rsp)
	movq	400(%rdx), %rax
	movq	%rax, 20000(%rsp)
	movq	408(%rdx), %rax
	movq	%rax, 20008(%rsp)
	movq	416(%rdx), %rax
	movq	%rax, 20016(%rsp)
	movq	424(%rdx), %rax
	movq	%rax, 20024(%rsp)
	movq	432(%rdx), %rax
	movq	%rax, 20032(%rsp)
	movq	440(%rdx), %rax
	movq	%rax, 20040(%rsp)
	movq	448(%rdx), %rax
	movq	%rax, 20048(%rsp)
	movq	456(%rdx), %rax
	movq	%rax, 20056(%rsp)
	movq	464(%rdx), %rax
	movq	%rax, 20064(%rsp)
	movq	472(%rdx), %rax
	movq	%rax, 20072(%rsp)
	movq	480(%rdx), %rax
	movq	%rax, 20080(%rsp)
	movq	488(%rdx), %rax
	movq	%rax, 20088(%rsp)
	movq	496(%rdx), %rax
	movq	%rax, 20096(%rsp)
	movq	504(%rdx), %rax
	movq	%rax, 20104(%rsp)
	movq	512(%rdx), %rax
	movq	%rax, 20112(%rsp)
	movq	520(%rdx), %rax
	movq	%rax, 20120(%rsp)
	movq	528(%rdx), %rax
	movq	%rax, 20128(%rsp)
	movq	536(%rdx), %rax
	movq	%rax, 20136(%rsp)
	movq	544(%rdx), %rax
	movq	%rax, 20144(%rsp)
	movq	552(%rdx), %rax
	movq	%rax, 20152(%rsp)
	movq	560(%rdx), %rax
	movq	%rax, 20160(%rsp)
	movq	568(%rdx), %rax
	movq	%rax, 20168(%rsp)
	movq	576(%rdx), %rax
	movq	%rax, 20176(%rsp)
	movq	584(%rdx), %rax
	movq	%rax, 20184(%rsp)
	movq	592(%rdx), %rax
	movq	%rax, 20192(%rsp)
	movq	600(%rdx), %rax
	movq	%rax, 20200(%rsp)
	movq	608(%rdx), %rax
	movq	%rax, 20208(%rsp)
	movq	616(%rdx), %rax
	movq	%rax, 20216(%rsp)
	movq	624(%rdx), %rax
	movq	%rax, 20224(%rsp)
	movq	632(%rdx), %rax
	movq	%rax, 20232(%rsp)
	movq	640(%rdx), %rax
	movq	%rax, 20240(%rsp)
	movq	648(%rdx), %rax
	movq	%rax, 20248(%rsp)
	movq	656(%rdx), %rax
	movq	%rax, 20256(%rsp)
	movq	664(%rdx), %rax
	movq	%rax, 20264(%rsp)
	movq	672(%rdx), %rax
	movq	%rax, 20272(%rsp)
	movq	680(%rdx), %rax
	movq	%rax, 20280(%rsp)
	movq	688(%rdx), %rax
	movq	%rax, 20288(%rsp)
	movq	696(%rdx), %rax
	movq	%rax, 20296(%rsp)
	movq	704(%rdx), %rax
	movq	%rax, 20304(%rsp)
	movq	712(%rdx), %rax
	movq	%rax, 20312(%rsp)
	movq	720(%rdx), %rax
	movq	%rax, 20320(%rsp)
	movq	728(%rdx), %rax
	movq	%rax, 20328(%rsp)
	movq	736(%rdx), %rax
	movq	%rax, 20336(%rsp)
	movq	744(%rdx), %rax
	movq	%rax, 20344(%rsp)
	movq	752(%rdx), %rax
	movq	%rax, 20352(%rsp)
	movq	760(%rdx), %rax
	movq	%rax, 20360(%rsp)
	movq	768(%rdx), %rax
	movq	%rax, 20368(%rsp)
	movq	776(%rdx), %rax
	movq	%rax, 20376(%rsp)
	movq	784(%rdx), %rax
	movq	%rax, 20384(%rsp)
	movq	792(%rdx), %rax
	movq	%rax, 20392(%rsp)
	movq	800(%rdx), %rax
	movq	%rax, 20400(%rsp)
	movq	808(%rdx), %rax
	movq	%rax, 20408(%rsp)
	movq	816(%rdx), %rax
	movq	%rax, 20416(%rsp)
	movq	824(%rdx), %rax
	movq	%rax, 20424(%rsp)
	movq	832(%rdx), %rax
	movq	%rax, 20432(%rsp)
	movq	840(%rdx), %rax
	movq	%rax, 20440(%rsp)
	movq	848(%rdx), %rax
	movq	%rax, 20448(%rsp)
	movq	856(%rdx), %rax
	movq	%rax, 20456(%rsp)
	movq	864(%rdx), %rax
	movq	%rax, 20464(%rsp)
	movq	872(%rdx), %rax
	movq	%rax, 20472(%rsp)
	movq	880(%rdx), %rax
	movq	%rax, 20480(%rsp)
	movq	888(%rdx), %rax
	movq	%rax, 20488(%rsp)
	movq	896(%rdx), %rax
	movq	%rax, 20496(%rsp)
	movq	904(%rdx), %rax
	movq	%rax, 20504(%rsp)
	movq	912(%rdx), %rax
	movq	%rax, 20512(%rsp)
	movq	920(%rdx), %rax
	movq	%rax, 20520(%rsp)
	movq	928(%rdx), %rax
	movq	%rax, 20528(%rsp)
	movq	936(%rdx), %rax
	movq	%rax, 20536(%rsp)
	movq	944(%rdx), %rax
	movq	%rax, 20544(%rsp)
	movq	952(%rdx), %rax
	movq	%rax, 20552(%rsp)
	movq	960(%rdx), %rax
	movq	%rax, 20560(%rsp)
	movq	968(%rdx), %rax
	movq	%rax, 20568(%rsp)
	movq	976(%rdx), %rax
	movq	%rax, 20576(%rsp)
	movq	984(%rdx), %rax
	movq	%rax, 20584(%rsp)
	movq	992(%rdx), %rax
	movq	%rax, 20592(%rsp)
	movq	1000(%rdx), %rax
	movq	%rax, 20600(%rsp)
	movq	1008(%rdx), %rax
	movq	%rax, 20608(%rsp)
	movq	1016(%rdx), %rax
	movq	%rax, 20616(%rsp)
	movq	1024(%rdx), %rax
	movq	%rax, 20624(%rsp)
	movq	1032(%rdx), %rax
	movq	%rax, 20632(%rsp)
	movq	1040(%rdx), %rax
	movq	%rax, 20640(%rsp)
	movq	1048(%rdx), %rax
	movq	%rax, 20648(%rsp)
	movq	1056(%rdx), %rax
	movq	%rax, 20656(%rsp)
	movq	1064(%rdx), %rax
	movq	%rax, 20664(%rsp)
	movq	1072(%rdx), %rax
	movq	%rax, 20672(%rsp)
	movq	1080(%rdx), %rax
	movq	%rax, 20680(%rsp)
	movq	1088(%rdx), %rax
	movq	%rax, 20688(%rsp)
	movq	1096(%rdx), %rax
	movq	%rax, 20696(%rsp)
	movq	1104(%rdx), %rax
	movq	%rax, 20704(%rsp)
	movq	1112(%rdx), %rax
	movq	%rax, 20712(%rsp)
	movq	1120(%rdx), %rax
	movq	%rax, 20720(%rsp)
	movq	1128(%rdx), %rax
	movq	%rax, 20728(%rsp)
	movq	1136(%rdx), %rax
	movq	%rax, 20736(%rsp)
	movq	1144(%rdx), %rax
	movq	%rax, 20744(%rsp)
	movq	1152(%rdx), %rax
	movq	%rax, 20752(%rsp)
	movq	1160(%rdx), %rax
	movq	%rax, 20760(%rsp)
	movq	1168(%rdx), %rax
	movq	%rax, 20768(%rsp)
	movq	1176(%rdx), %rax
	movq	%rax, 20776(%rsp)
	movq	1184(%rdx), %rax
	movq	%rax, 20784(%rsp)
	movq	1192(%rdx), %rax
	movq	%rax, 20792(%rsp)
	movq	1200(%rdx), %rax
	movq	%rax, 20800(%rsp)
	movq	1208(%rdx), %rax
	movq	%rax, 20808(%rsp)
	movq	1216(%rdx), %rax
	movq	%rax, 20816(%rsp)
	movq	1224(%rdx), %rax
	movq	%rax, 20824(%rsp)
	movq	1232(%rdx), %rax
	movq	%rax, 20832(%rsp)
	movq	1240(%rdx), %rax
	movq	%rax, 20840(%rsp)
	movq	1248(%rdx), %rax
	movq	%rax, 20848(%rsp)
	movq	1256(%rdx), %rax
	movq	%rax, 20856(%rsp)
	movq	1264(%rdx), %rax
	movq	%rax, 20864(%rsp)
	movq	1272(%rdx), %rax
	movq	%rax, 20872(%rsp)
	movq	1280(%rdx), %rax
	movq	%rax, 20880(%rsp)
	movq	1288(%rdx), %rax
	movq	%rax, 20888(%rsp)
	movq	1296(%rdx), %rax
	movq	%rax, 20896(%rsp)
	movq	1304(%rdx), %rax
	movq	%rax, 20904(%rsp)
	movq	1312(%rdx), %rax
	movq	%rax, 20912(%rsp)
	movq	1320(%rdx), %rax
	movq	%rax, 20920(%rsp)
	movq	1328(%rdx), %rax
	movq	%rax, 20928(%rsp)
	movq	1336(%rdx), %rax
	movq	%rax, 20936(%rsp)
	movq	1344(%rdx), %rax
	movq	%rax, 20944(%rsp)
	movq	1352(%rdx), %rax
	movq	%rax, 20952(%rsp)
	movq	1360(%rdx), %rax
	movq	%rax, 20960(%rsp)
	movq	1368(%rdx), %rax
	movq	%rax, 20968(%rsp)
	movq	1376(%rdx), %rax
	movq	%rax, 20976(%rsp)
	movq	1384(%rdx), %rax
	movq	%rax, 20984(%rsp)
	movq	1392(%rdx), %rax
	movq	%rax, 20992(%rsp)
	movq	1400(%rdx), %rax
	movq	%rax, 21000(%rsp)
	movq	1408(%rdx), %rax
	movq	%rax, 21008(%rsp)
	movq	1416(%rdx), %rax
	movq	%rax, 21016(%rsp)
	movq	1424(%rdx), %rax
	movq	%rax, 21024(%rsp)
	movq	1432(%rdx), %rax
	movq	%rax, 21032(%rsp)
	movq	1440(%rdx), %rax
	movq	%rax, 21040(%rsp)
	movq	1448(%rdx), %rax
	movq	%rax, 21048(%rsp)
	movq	1456(%rdx), %rax
	movq	%rax, 21056(%rsp)
	movq	1464(%rdx), %rax
	movq	%rax, 21064(%rsp)
	movq	1472(%rdx), %rax
	movq	%rax, 21072(%rsp)
	movq	1480(%rdx), %rax
	movq	%rax, 21080(%rsp)
	movq	1488(%rdx), %rax
	movq	%rax, 21088(%rsp)
	movq	1496(%rdx), %rax
	movq	%rax, 21096(%rsp)
	movq	1504(%rdx), %rax
	movq	%rax, 21104(%rsp)
	movq	1512(%rdx), %rax
	movq	%rax, 21112(%rsp)
	movq	1520(%rdx), %rax
	movq	%rax, 21120(%rsp)
	movq	1528(%rdx), %rax
	movq	%rax, 21128(%rsp)
	movq	1536(%rdx), %rax
	movq	%rax, 21136(%rsp)
	movq	1544(%rdx), %rax
	movq	%rax, 21144(%rsp)
	movq	1552(%rdx), %rax
	movq	%rax, 21152(%rsp)
	movq	1560(%rdx), %rax
	movq	%rax, 21160(%rsp)
	movq	1568(%rdx), %rax
	movq	%rax, 21168(%rsp)
	movq	1576(%rdx), %rax
	movq	%rax, 21176(%rsp)
	movq	1584(%rdx), %rax
	movq	%rax, 21184(%rsp)
	movq	1592(%rdx), %rax
	movq	%rax, 21192(%rsp)
	movq	1600(%rdx), %rax
	movq	%rax, 21200(%rsp)
	movq	1608(%rdx), %rax
	movq	%rax, 21208(%rsp)
	movq	1616(%rdx), %rax
	movq	%rax, 21216(%rsp)
	movq	1624(%rdx), %rax
	movq	%rax, 21224(%rsp)
	movq	1632(%rdx), %rax
	movq	%rax, 21232(%rsp)
	movq	1640(%rdx), %rax
	movq	%rax, 21240(%rsp)
	movq	1648(%rdx), %rax
	movq	%rax, 21248(%rsp)
	movq	1656(%rdx), %rax
	movq	%rax, 21256(%rsp)
	movq	1664(%rdx), %rax
	movq	%rax, 21264(%rsp)
	movq	1672(%rdx), %rax
	movq	%rax, 21272(%rsp)
	movq	1680(%rdx), %rax
	movq	%rax, 21280(%rsp)
	movq	1688(%rdx), %rax
	movq	%rax, 21288(%rsp)
	movq	1696(%rdx), %rax
	movq	%rax, 21296(%rsp)
	movq	1704(%rdx), %rax
	movq	%rax, 21304(%rsp)
	movq	1712(%rdx), %rax
	movq	%rax, 21312(%rsp)
	movq	1720(%rdx), %rax
	movq	%rax, 21320(%rsp)
	movq	1728(%rdx), %rax
	movq	%rax, 21328(%rsp)
	movq	1736(%rdx), %rax
	movq	%rax, 21336(%rsp)
	movq	1744(%rdx), %rax
	movq	%rax, 21344(%rsp)
	movq	1752(%rdx), %rax
	movq	%rax, 21352(%rsp)
	movq	1760(%rdx), %rax
	movq	%rax, 21360(%rsp)
	movq	1768(%rdx), %rax
	movq	%rax, 21368(%rsp)
	movq	1776(%rdx), %rax
	movq	%rax, 21376(%rsp)
	movq	1784(%rdx), %rax
	movq	%rax, 21384(%rsp)
	movq	1792(%rdx), %rax
	movq	%rax, 21392(%rsp)
	movq	1800(%rdx), %rax
	movq	%rax, 21400(%rsp)
	movq	1808(%rdx), %rax
	movq	%rax, 21408(%rsp)
	movq	1816(%rdx), %rax
	movq	%rax, 21416(%rsp)
	movq	1824(%rdx), %rax
	movq	%rax, 21424(%rsp)
	movq	1832(%rdx), %rax
	movq	%rax, 21432(%rsp)
	movq	1840(%rdx), %rax
	movq	%rax, 21440(%rsp)
	movq	1848(%rdx), %rax
	movq	%rax, 21448(%rsp)
	movq	1856(%rdx), %rax
	movq	%rax, 21456(%rsp)
	movq	1864(%rdx), %rax
	movq	%rax, 21464(%rsp)
	movq	1872(%rdx), %rax
	movq	%rax, 21472(%rsp)
	movq	1880(%rdx), %rax
	movq	%rax, 21480(%rsp)
	movq	1888(%rdx), %rax
	movq	%rax, 21488(%rsp)
	movq	1896(%rdx), %rax
	movq	%rax, 21496(%rsp)
	movq	1904(%rdx), %rax
	movq	%rax, 21504(%rsp)
	movq	1912(%rdx), %rax
	movq	%rax, 21512(%rsp)
	movq	1920(%rdx), %rax
	movq	%rax, 21520(%rsp)
	movq	1928(%rdx), %rax
	movq	%rax, 21528(%rsp)
	movq	1936(%rdx), %rax
	movq	%rax, 21536(%rsp)
	movq	1944(%rdx), %rax
	movq	%rax, 21544(%rsp)
	movq	1952(%rdx), %rax
	movq	%rax, 21552(%rsp)
	movq	1960(%rdx), %rax
	movq	%rax, 21560(%rsp)
	movq	1968(%rdx), %rax
	movq	%rax, 21568(%rsp)
	movq	1976(%rdx), %rax
	movq	%rax, 21576(%rsp)
	movq	1984(%rdx), %rax
	movq	%rax, 21584(%rsp)
	movq	1992(%rdx), %rax
	movq	%rax, 21592(%rsp)
	movq	2000(%rdx), %rax
	movq	%rax, 21600(%rsp)
	movq	2008(%rdx), %rax
	movq	%rax, 21608(%rsp)
	movq	2016(%rdx), %rax
	movq	%rax, 21616(%rsp)
	movq	2024(%rdx), %rax
	movq	%rax, 21624(%rsp)
	movq	2032(%rdx), %rax
	movq	%rax, 21632(%rsp)
	movq	2040(%rdx), %rax
	movq	%rax, 21640(%rsp)
	movq	2048(%rdx), %rax
	movq	%rax, 21648(%rsp)
	movq	2056(%rdx), %rax
	movq	%rax, 21656(%rsp)
	movq	2064(%rdx), %rax
	movq	%rax, 21664(%rsp)
	movq	2072(%rdx), %rax
	movq	%rax, 21672(%rsp)
	movq	2080(%rdx), %rax
	movq	%rax, 21680(%rsp)
	movq	2088(%rdx), %rax
	movq	%rax, 21688(%rsp)
	movq	2096(%rdx), %rax
	movq	%rax, 21696(%rsp)
	movq	2104(%rdx), %rax
	movq	%rax, 21704(%rsp)
	movq	2112(%rdx), %rax
	movq	%rax, 21712(%rsp)
	movq	2120(%rdx), %rax
	movq	%rax, 21720(%rsp)
	movq	2128(%rdx), %rax
	movq	%rax, 21728(%rsp)
	movq	2136(%rdx), %rax
	movq	%rax, 21736(%rsp)
	movq	2144(%rdx), %rax
	movq	%rax, 21744(%rsp)
	movq	2152(%rdx), %rax
	movq	%rax, 21752(%rsp)
	movq	2160(%rdx), %rax
	movq	%rax, 21760(%rsp)
	movq	2168(%rdx), %rax
	movq	%rax, 21768(%rsp)
	movq	2176(%rdx), %rax
	movq	%rax, 21776(%rsp)
	movq	2184(%rdx), %rax
	movq	%rax, 21784(%rsp)
	movq	2192(%rdx), %rax
	movq	%rax, 21792(%rsp)
	movq	2200(%rdx), %rax
	movq	%rax, 21800(%rsp)
	movq	2208(%rdx), %rax
	movq	%rax, 21808(%rsp)
	movq	2216(%rdx), %rax
	movq	%rax, 21816(%rsp)
	movq	2224(%rdx), %rax
	movq	%rax, 21824(%rsp)
	movq	2232(%rdx), %rax
	movq	%rax, 21832(%rsp)
	movq	2240(%rdx), %rax
	movq	%rax, 21840(%rsp)
	movq	2248(%rdx), %rax
	movq	%rax, 21848(%rsp)
	movq	2256(%rdx), %rax
	movq	%rax, 21856(%rsp)
	movq	2264(%rdx), %rax
	movq	%rax, 21864(%rsp)
	movq	2272(%rdx), %rax
	movq	%rax, 21872(%rsp)
	movq	2280(%rdx), %rax
	movq	%rax, 21880(%rsp)
	movq	2288(%rdx), %rax
	movq	%rax, 21888(%rsp)
	movq	2296(%rdx), %rax
	movq	%rax, 21896(%rsp)
	movq	2304(%rdx), %rax
	movq	%rax, 21904(%rsp)
	movq	2312(%rdx), %rax
	movq	%rax, 21912(%rsp)
	movq	2320(%rdx), %rax
	movq	%rax, 21920(%rsp)
	movq	2328(%rdx), %rax
	movq	%rax, 21928(%rsp)
	movq	2336(%rdx), %rax
	movq	%rax, 21936(%rsp)
	movq	2344(%rdx), %rax
	movq	%rax, 21944(%rsp)
	movq	2352(%rdx), %rax
	movq	%rax, 21952(%rsp)
	movq	2360(%rdx), %rax
	movq	%rax, 21960(%rsp)
	movq	2368(%rdx), %rax
	movq	%rax, 21968(%rsp)
	movq	2376(%rdx), %rax
	movq	%rax, 21976(%rsp)
	movq	2384(%rdx), %rax
	movq	%rax, 21984(%rsp)
	movq	2392(%rdx), %rax
	movq	%rax, 21992(%rsp)
	leaq	2240(%rsp), %rax
	movq	%rsp, %rdx
	leaq	19600(%rsp), %rcx
	movq	%rdx, 19584(%rsp)
	movq	%rax, 19592(%rsp)
	movq	(%rcx), %rdx
	movq	%rdx, 22000(%rsp)
	movq	8(%rcx), %rdx
	movq	%rdx, 22008(%rsp)
	movq	16(%rcx), %rdx
	movq	%rdx, 22016(%rsp)
	movq	24(%rcx), %rdx
	movq	%rdx, 22024(%rsp)
	movq	32(%rcx), %rdx
	movq	%rdx, 22032(%rsp)
	movq	40(%rcx), %rdx
	movq	%rdx, 22040(%rsp)
	movq	48(%rcx), %rdx
	movq	%rdx, 22048(%rsp)
	movq	56(%rcx), %rdx
	movq	%rdx, 22056(%rsp)
	movq	64(%rcx), %rdx
	movq	%rdx, 22064(%rsp)
	movq	72(%rcx), %rdx
	movq	%rdx, 22072(%rsp)
	movq	80(%rcx), %rdx
	movq	%rdx, 22080(%rsp)
	movq	88(%rcx), %rdx
	movq	%rdx, 22088(%rsp)
	movq	96(%rcx), %rdx
	movq	%rdx, 22096(%rsp)
	movq	104(%rcx), %rdx
	movq	%rdx, 22104(%rsp)
	movq	112(%rcx), %rdx
	movq	%rdx, 22112(%rsp)
	movq	120(%rcx), %rdx
	movq	%rdx, 22120(%rsp)
	movq	128(%rcx), %rdx
	movq	%rdx, 22128(%rsp)
	movq	136(%rcx), %rdx
	movq	%rdx, 22136(%rsp)
	movq	144(%rcx), %rdx
	movq	%rdx, 22144(%rsp)
	movq	152(%rcx), %rdx
	movq	%rdx, 22152(%rsp)
	movq	160(%rcx), %rdx
	movq	%rdx, 22160(%rsp)
	movq	168(%rcx), %rdx
	movq	%rdx, 22168(%rsp)
	movq	176(%rcx), %rdx
	movq	%rdx, 22176(%rsp)
	movq	184(%rcx), %rdx
	movq	%rdx, 22184(%rsp)
	movq	192(%rcx), %rdx
	movq	%rdx, 22192(%rsp)
	movq	200(%rcx), %rdx
	movq	%rdx, 22200(%rsp)
	movq	208(%rcx), %rdx
	movq	%rdx, 22208(%rsp)
	movq	216(%rcx), %rdx
	movq	%rdx, 22216(%rsp)
	movq	224(%rcx), %rdx
	movq	%rdx, 22224(%rsp)
	movq	232(%rcx), %rdx
	movq	%rdx, 22232(%rsp)
	movq	240(%rcx), %rdx
	movq	%rdx, 22240(%rsp)
	movq	248(%rcx), %rdx
	movq	%rdx, 22248(%rsp)
	movq	256(%rcx), %rdx
	movq	%rdx, 22256(%rsp)
	movq	264(%rcx), %rdx
	movq	%rdx, 22264(%rsp)
	movq	272(%rcx), %rdx
	movq	%rdx, 22272(%rsp)
	movq	280(%rcx), %rdx
	movq	%rdx, 22280(%rsp)
	movq	288(%rcx), %rdx
	movq	%rdx, 22288(%rsp)
	movq	296(%rcx), %rdx
	movq	%rdx, 22296(%rsp)
	movq	304(%rcx), %rdx
	movq	%rdx, 22304(%rsp)
	movq	312(%rcx), %rdx
	movq	%rdx, 22312(%rsp)
	movq	320(%rcx), %rdx
	movq	%rdx, 22320(%rsp)
	movq	328(%rcx), %rdx
	movq	%rdx, 22328(%rsp)
	movq	336(%rcx), %rdx
	movq	%rdx, 22336(%rsp)
	movq	344(%rcx), %rdx
	movq	%rdx, 22344(%rsp)
	movq	352(%rcx), %rdx
	movq	%rdx, 22352(%rsp)
	movq	360(%rcx), %rdx
	movq	%rdx, 22360(%rsp)
	movq	368(%rcx), %rdx
	movq	%rdx, 22368(%rsp)
	movq	376(%rcx), %rdx
	movq	%rdx, 22376(%rsp)
	movq	384(%rcx), %rdx
	movq	%rdx, 22384(%rsp)
	movq	392(%rcx), %rdx
	movq	%rdx, 22392(%rsp)
	movq	400(%rcx), %rdx
	movq	%rdx, 22400(%rsp)
	movq	408(%rcx), %rdx
	movq	%rdx, 22408(%rsp)
	movq	416(%rcx), %rdx
	movq	%rdx, 22416(%rsp)
	movq	424(%rcx), %rdx
	movq	%rdx, 22424(%rsp)
	movq	432(%rcx), %rdx
	movq	%rdx, 22432(%rsp)
	movq	440(%rcx), %rdx
	movq	%rdx, 22440(%rsp)
	movq	448(%rcx), %rdx
	movq	%rdx, 22448(%rsp)
	movq	456(%rcx), %rdx
	movq	%rdx, 22456(%rsp)
	movq	464(%rcx), %rdx
	movq	%rdx, 22464(%rsp)
	movq	472(%rcx), %rdx
	movq	%rdx, 22472(%rsp)
	movq	480(%rcx), %rdx
	movq	%rdx, 22480(%rsp)
	movq	488(%rcx), %rdx
	movq	%rdx, 22488(%rsp)
	movq	496(%rcx), %rdx
	movq	%rdx, 22496(%rsp)
	movq	504(%rcx), %rdx
	movq	%rdx, 22504(%rsp)
	movq	512(%rcx), %rdx
	movq	%rdx, 22512(%rsp)
	movq	520(%rcx), %rdx
	movq	%rdx, 22520(%rsp)
	movq	528(%rcx), %rdx
	movq	%rdx, 22528(%rsp)
	movq	536(%rcx), %rdx
	movq	%rdx, 22536(%rsp)
	movq	544(%rcx), %rdx
	movq	%rdx, 22544(%rsp)
	movq	552(%rcx), %rdx
	movq	%rdx, 22552(%rsp)
	movq	560(%rcx), %rdx
	movq	%rdx, 22560(%rsp)
	movq	568(%rcx), %rdx
	movq	%rdx, 22568(%rsp)
	movq	576(%rcx), %rdx
	movq	%rdx, 22576(%rsp)
	movq	584(%rcx), %rdx
	movq	%rdx, 22584(%rsp)
	movq	592(%rcx), %rdx
	movq	%rdx, 22592(%rsp)
	movq	600(%rcx), %rdx
	movq	%rdx, 22600(%rsp)
	movq	608(%rcx), %rdx
	movq	%rdx, 22608(%rsp)
	movq	616(%rcx), %rdx
	movq	%rdx, 22616(%rsp)
	movq	624(%rcx), %rdx
	movq	%rdx, 22624(%rsp)
	movq	632(%rcx), %rdx
	movq	%rdx, 22632(%rsp)
	movq	640(%rcx), %rdx
	movq	%rdx, 22640(%rsp)
	movq	648(%rcx), %rdx
	movq	%rdx, 22648(%rsp)
	movq	656(%rcx), %rdx
	movq	%rdx, 22656(%rsp)
	movq	664(%rcx), %rdx
	movq	%rdx, 22664(%rsp)
	movq	672(%rcx), %rdx
	movq	%rdx, 22672(%rsp)
	movq	680(%rcx), %rdx
	movq	%rdx, 22680(%rsp)
	movq	688(%rcx), %rdx
	movq	%rdx, 22688(%rsp)
	movq	696(%rcx), %rdx
	movq	%rdx, 22696(%rsp)
	movq	704(%rcx), %rdx
	movq	%rdx, 22704(%rsp)
	movq	712(%rcx), %rdx
	movq	%rdx, 22712(%rsp)
	movq	720(%rcx), %rdx
	movq	%rdx, 22720(%rsp)
	movq	728(%rcx), %rdx
	movq	%rdx, 22728(%rsp)
	movq	736(%rcx), %rdx
	movq	%rdx, 22736(%rsp)
	movq	744(%rcx), %rdx
	movq	%rdx, 22744(%rsp)
	movq	752(%rcx), %rdx
	movq	%rdx, 22752(%rsp)
	movq	760(%rcx), %rdx
	movq	%rdx, 22760(%rsp)
	movq	768(%rcx), %rdx
	movq	%rdx, 22768(%rsp)
	movq	776(%rcx), %rdx
	movq	%rdx, 22776(%rsp)
	movq	784(%rcx), %rdx
	movq	%rdx, 22784(%rsp)
	movq	792(%rcx), %rdx
	movq	%rdx, 22792(%rsp)
	movq	800(%rcx), %rdx
	movq	%rdx, 22800(%rsp)
	movq	808(%rcx), %rdx
	movq	%rdx, 22808(%rsp)
	movq	816(%rcx), %rdx
	movq	%rdx, 22816(%rsp)
	movq	824(%rcx), %rdx
	movq	%rdx, 22824(%rsp)
	movq	832(%rcx), %rdx
	movq	%rdx, 22832(%rsp)
	movq	840(%rcx), %rdx
	movq	%rdx, 22840(%rsp)
	movq	848(%rcx), %rdx
	movq	%rdx, 22848(%rsp)
	movq	856(%rcx), %rdx
	movq	%rdx, 22856(%rsp)
	movq	864(%rcx), %rdx
	movq	%rdx, 22864(%rsp)
	movq	872(%rcx), %rdx
	movq	%rdx, 22872(%rsp)
	movq	880(%rcx), %rdx
	movq	%rdx, 22880(%rsp)
	movq	888(%rcx), %rdx
	movq	%rdx, 22888(%rsp)
	movq	896(%rcx), %rdx
	movq	%rdx, 22896(%rsp)
	movq	904(%rcx), %rdx
	movq	%rdx, 22904(%rsp)
	movq	912(%rcx), %rdx
	movq	%rdx, 22912(%rsp)
	movq	920(%rcx), %rdx
	movq	%rdx, 22920(%rsp)
	movq	928(%rcx), %rdx
	movq	%rdx, 22928(%rsp)
	movq	936(%rcx), %rdx
	movq	%rdx, 22936(%rsp)
	movq	944(%rcx), %rdx
	movq	%rdx, 22944(%rsp)
	movq	952(%rcx), %rdx
	movq	%rdx, 22952(%rsp)
	movq	960(%rcx), %rdx
	movq	%rdx, 22960(%rsp)
	movq	968(%rcx), %rdx
	movq	%rdx, 22968(%rsp)
	movq	976(%rcx), %rdx
	movq	%rdx, 22976(%rsp)
	movq	984(%rcx), %rdx
	movq	%rdx, 22984(%rsp)
	movq	992(%rcx), %rdx
	movq	%rdx, 22992(%rsp)
	movq	1000(%rcx), %rdx
	movq	%rdx, 23000(%rsp)
	movq	1008(%rcx), %rdx
	movq	%rdx, 23008(%rsp)
	movq	1016(%rcx), %rdx
	movq	%rdx, 23016(%rsp)
	movq	1024(%rcx), %rdx
	movq	%rdx, 23024(%rsp)
	movq	1032(%rcx), %rdx
	movq	%rdx, 23032(%rsp)
	movq	1040(%rcx), %rdx
	movq	%rdx, 23040(%rsp)
	movq	1048(%rcx), %rdx
	movq	%rdx, 23048(%rsp)
	movq	1056(%rcx), %rdx
	movq	%rdx, 23056(%rsp)
	movq	1064(%rcx), %rdx
	movq	%rdx, 23064(%rsp)
	movq	1072(%rcx), %rdx
	movq	%rdx, 23072(%rsp)
	movq	1080(%rcx), %rdx
	movq	%rdx, 23080(%rsp)
	movq	1088(%rcx), %rdx
	movq	%rdx, 23088(%rsp)
	movq	1096(%rcx), %rdx
	movq	%rdx, 23096(%rsp)
	movq	1104(%rcx), %rdx
	movq	%rdx, 23104(%rsp)
	movq	1112(%rcx), %rdx
	movq	%rdx, 23112(%rsp)
	movq	1120(%rcx), %rdx
	movq	%rdx, 23120(%rsp)
	movq	1128(%rcx), %rdx
	movq	%rdx, 23128(%rsp)
	movq	1136(%rcx), %rdx
	movq	%rdx, 23136(%rsp)
	movq	1144(%rcx), %rdx
	movq	%rdx, 23144(%rsp)
	movq	1152(%rcx), %rdx
	movq	%rdx, 23152(%rsp)
	movq	1160(%rcx), %rdx
	movq	%rdx, 23160(%rsp)
	movq	1168(%rcx), %rdx
	movq	%rdx, 23168(%rsp)
	movq	1176(%rcx), %rdx
	movq	%rdx, 23176(%rsp)
	movq	1184(%rcx), %rdx
	movq	%rdx, 23184(%rsp)
	movq	1192(%rcx), %rdx
	movq	%rdx, 23192(%rsp)
	movq	1200(%rcx), %rdx
	movq	%rdx, 23200(%rsp)
	movq	1208(%rcx), %rdx
	movq	%rdx, 23208(%rsp)
	movq	1216(%rcx), %rdx
	movq	%rdx, 23216(%rsp)
	movq	1224(%rcx), %rdx
	movq	%rdx, 23224(%rsp)
	movq	1232(%rcx), %rdx
	movq	%rdx, 23232(%rsp)
	movq	1240(%rcx), %rdx
	movq	%rdx, 23240(%rsp)
	movq	1248(%rcx), %rdx
	movq	%rdx, 23248(%rsp)
	movq	1256(%rcx), %rdx
	movq	%rdx, 23256(%rsp)
	movq	1264(%rcx), %rdx
	movq	%rdx, 23264(%rsp)
	movq	1272(%rcx), %rdx
	movq	%rdx, 23272(%rsp)
	movq	1280(%rcx), %rdx
	movq	%rdx, 23280(%rsp)
	movq	1288(%rcx), %rdx
	movq	%rdx, 23288(%rsp)
	movq	1296(%rcx), %rdx
	movq	%rdx, 23296(%rsp)
	movq	1304(%rcx), %rdx
	movq	%rdx, 23304(%rsp)
	movq	1312(%rcx), %rdx
	movq	%rdx, 23312(%rsp)
	movq	1320(%rcx), %rdx
	movq	%rdx, 23320(%rsp)
	movq	1328(%rcx), %rdx
	movq	%rdx, 23328(%rsp)
	movq	1336(%rcx), %rdx
	movq	%rdx, 23336(%rsp)
	movq	1344(%rcx), %rdx
	movq	%rdx, 23344(%rsp)
	movq	1352(%rcx), %rdx
	movq	%rdx, 23352(%rsp)
	movq	1360(%rcx), %rdx
	movq	%rdx, 23360(%rsp)
	movq	1368(%rcx), %rdx
	movq	%rdx, 23368(%rsp)
	movq	1376(%rcx), %rdx
	movq	%rdx, 23376(%rsp)
	movq	1384(%rcx), %rdx
	movq	%rdx, 23384(%rsp)
	movq	1392(%rcx), %rdx
	movq	%rdx, 23392(%rsp)
	movq	1400(%rcx), %rdx
	movq	%rdx, 23400(%rsp)
	movq	1408(%rcx), %rdx
	movq	%rdx, 23408(%rsp)
	movq	1416(%rcx), %rdx
	movq	%rdx, 23416(%rsp)
	movq	1424(%rcx), %rdx
	movq	%rdx, 23424(%rsp)
	movq	1432(%rcx), %rdx
	movq	%rdx, 23432(%rsp)
	movq	1440(%rcx), %rdx
	movq	%rdx, 23440(%rsp)
	movq	1448(%rcx), %rdx
	movq	%rdx, 23448(%rsp)
	movq	1456(%rcx), %rdx
	movq	%rdx, 23456(%rsp)
	movq	1464(%rcx), %rdx
	movq	%rdx, 23464(%rsp)
	movq	1472(%rcx), %rdx
	movq	%rdx, 23472(%rsp)
	movq	1480(%rcx), %rdx
	movq	%rdx, 23480(%rsp)
	movq	1488(%rcx), %rdx
	movq	%rdx, 23488(%rsp)
	movq	1496(%rcx), %rdx
	movq	%rdx, 23496(%rsp)
	movq	1504(%rcx), %rdx
	movq	%rdx, 23504(%rsp)
	movq	1512(%rcx), %rdx
	movq	%rdx, 23512(%rsp)
	movq	1520(%rcx), %rdx
	movq	%rdx, 23520(%rsp)
	movq	1528(%rcx), %rdx
	movq	%rdx, 23528(%rsp)
	movq	1536(%rcx), %rdx
	movq	%rdx, 23536(%rsp)
	movq	1544(%rcx), %rdx
	movq	%rdx, 23544(%rsp)
	movq	1552(%rcx), %rdx
	movq	%rdx, 23552(%rsp)
	movq	1560(%rcx), %rdx
	movq	%rdx, 23560(%rsp)
	movq	1568(%rcx), %rdx
	movq	%rdx, 23568(%rsp)
	movq	1576(%rcx), %rdx
	movq	%rdx, 23576(%rsp)
	movq	1584(%rcx), %rdx
	movq	%rdx, 23584(%rsp)
	movq	1592(%rcx), %rdx
	movq	%rdx, 23592(%rsp)
	movq	1600(%rcx), %rdx
	movq	%rdx, 23600(%rsp)
	movq	1608(%rcx), %rdx
	movq	%rdx, 23608(%rsp)
	movq	1616(%rcx), %rdx
	movq	%rdx, 23616(%rsp)
	movq	1624(%rcx), %rdx
	movq	%rdx, 23624(%rsp)
	movq	1632(%rcx), %rdx
	movq	%rdx, 23632(%rsp)
	movq	1640(%rcx), %rdx
	movq	%rdx, 23640(%rsp)
	movq	1648(%rcx), %rdx
	movq	%rdx, 23648(%rsp)
	movq	1656(%rcx), %rdx
	movq	%rdx, 23656(%rsp)
	movq	1664(%rcx), %rdx
	movq	%rdx, 23664(%rsp)
	movq	1672(%rcx), %rdx
	movq	%rdx, 23672(%rsp)
	movq	1680(%rcx), %rdx
	movq	%rdx, 23680(%rsp)
	movq	1688(%rcx), %rdx
	movq	%rdx, 23688(%rsp)
	movq	1696(%rcx), %rdx
	movq	%rdx, 23696(%rsp)
	movq	1704(%rcx), %rdx
	movq	%rdx, 23704(%rsp)
	movq	1712(%rcx), %rdx
	movq	%rdx, 23712(%rsp)
	movq	1720(%rcx), %rdx
	movq	%rdx, 23720(%rsp)
	movq	1728(%rcx), %rdx
	movq	%rdx, 23728(%rsp)
	movq	1736(%rcx), %rdx
	movq	%rdx, 23736(%rsp)
	movq	1744(%rcx), %rdx
	movq	%rdx, 23744(%rsp)
	movq	1752(%rcx), %rdx
	movq	%rdx, 23752(%rsp)
	movq	1760(%rcx), %rdx
	movq	%rdx, 23760(%rsp)
	movq	1768(%rcx), %rdx
	movq	%rdx, 23768(%rsp)
	movq	1776(%rcx), %rdx
	movq	%rdx, 23776(%rsp)
	movq	1784(%rcx), %rdx
	movq	%rdx, 23784(%rsp)
	movq	1792(%rcx), %rdx
	movq	%rdx, 23792(%rsp)
	movq	1800(%rcx), %rdx
	movq	%rdx, 23800(%rsp)
	movq	1808(%rcx), %rdx
	movq	%rdx, 23808(%rsp)
	movq	1816(%rcx), %rdx
	movq	%rdx, 23816(%rsp)
	movq	1824(%rcx), %rdx
	movq	%rdx, 23824(%rsp)
	movq	1832(%rcx), %rdx
	movq	%rdx, 23832(%rsp)
	movq	1840(%rcx), %rdx
	movq	%rdx, 23840(%rsp)
	movq	1848(%rcx), %rdx
	movq	%rdx, 23848(%rsp)
	movq	1856(%rcx), %rdx
	movq	%rdx, 23856(%rsp)
	movq	1864(%rcx), %rdx
	movq	%rdx, 23864(%rsp)
	movq	1872(%rcx), %rdx
	movq	%rdx, 23872(%rsp)
	movq	1880(%rcx), %rdx
	movq	%rdx, 23880(%rsp)
	movq	1888(%rcx), %rdx
	movq	%rdx, 23888(%rsp)
	movq	1896(%rcx), %rdx
	movq	%rdx, 23896(%rsp)
	movq	1904(%rcx), %rdx
	movq	%rdx, 23904(%rsp)
	movq	1912(%rcx), %rdx
	movq	%rdx, 23912(%rsp)
	movq	1920(%rcx), %rdx
	movq	%rdx, 23920(%rsp)
	movq	1928(%rcx), %rdx
	movq	%rdx, 23928(%rsp)
	movq	1936(%rcx), %rdx
	movq	%rdx, 23936(%rsp)
	movq	1944(%rcx), %rdx
	movq	%rdx, 23944(%rsp)
	movq	1952(%rcx), %rdx
	movq	%rdx, 23952(%rsp)
	movq	1960(%rcx), %rdx
	movq	%rdx, 23960(%rsp)
	movq	1968(%rcx), %rdx
	movq	%rdx, 23968(%rsp)
	movq	1976(%rcx), %rdx
	movq	%rdx, 23976(%rsp)
	movq	1984(%rcx), %rdx
	movq	%rdx, 23984(%rsp)
	movq	1992(%rcx), %rdx
	movq	%rdx, 23992(%rsp)
	movq	2000(%rcx), %rdx
	movq	%rdx, 24000(%rsp)
	movq	2008(%rcx), %rdx
	movq	%rdx, 24008(%rsp)
	movq	2016(%rcx), %rdx
	movq	%rdx, 24016(%rsp)
	movq	2024(%rcx), %rdx
	movq	%rdx, 24024(%rsp)
	movq	2032(%rcx), %rdx
	movq	%rdx, 24032(%rsp)
	movq	2040(%rcx), %rdx
	movq	%rdx, 24040(%rsp)
	movq	2048(%rcx), %rdx
	movq	%rdx, 24048(%rsp)
	movq	2056(%rcx), %rdx
	movq	%rdx, 24056(%rsp)
	movq	2064(%rcx), %rdx
	movq	%rdx, 24064(%rsp)
	movq	2072(%rcx), %rdx
	movq	%rdx, 24072(%rsp)
	movq	2080(%rcx), %rdx
	movq	%rdx, 24080(%rsp)
	movq	2088(%rcx), %rdx
	movq	%rdx, 24088(%rsp)
	movq	2096(%rcx), %rdx
	movq	%rdx, 24096(%rsp)
	movq	2104(%rcx), %rdx
	movq	%rdx, 24104(%rsp)
	movq	2112(%rcx), %rdx
	movq	%rdx, 24112(%rsp)
	movq	2120(%rcx), %rdx
	movq	%rdx, 24120(%rsp)
	movq	2128(%rcx), %rdx
	movq	%rdx, 24128(%rsp)
	movq	2136(%rcx), %rdx
	movq	%rdx, 24136(%rsp)
	movq	2144(%rcx), %rdx
	movq	%rdx, 24144(%rsp)
	movq	2152(%rcx), %rdx
	movq	%rdx, 24152(%rsp)
	movq	2160(%rcx), %rdx
	movq	%rdx, 24160(%rsp)
	movq	2168(%rcx), %rdx
	movq	%rdx, 24168(%rsp)
	movq	2176(%rcx), %rdx
	movq	%rdx, 24176(%rsp)
	movq	2184(%rcx), %rdx
	movq	%rdx, 24184(%rsp)
	movq	2192(%rcx), %rdx
	movq	%rdx, 24192(%rsp)
	movq	2200(%rcx), %rdx
	movq	%rdx, 24200(%rsp)
	movq	2208(%rcx), %rdx
	movq	%rdx, 24208(%rsp)
	movq	2216(%rcx), %rdx
	movq	%rdx, 24216(%rsp)
	movq	2224(%rcx), %rdx
	movq	%rdx, 24224(%rsp)
	movq	2232(%rcx), %rdx
	movq	%rdx, 24232(%rsp)
	movq	2240(%rcx), %rdx
	movq	%rdx, 24240(%rsp)
	movq	2248(%rcx), %rdx
	movq	%rdx, 24248(%rsp)
	movq	2256(%rcx), %rdx
	movq	%rdx, 24256(%rsp)
	movq	2264(%rcx), %rdx
	movq	%rdx, 24264(%rsp)
	movq	2272(%rcx), %rdx
	movq	%rdx, 24272(%rsp)
	movq	2280(%rcx), %rdx
	movq	%rdx, 24280(%rsp)
	movq	2288(%rcx), %rdx
	movq	%rdx, 24288(%rsp)
	movq	2296(%rcx), %rdx
	movq	%rdx, 24296(%rsp)
	movq	2304(%rcx), %rdx
	movq	%rdx, 24304(%rsp)
	movq	2312(%rcx), %rdx
	movq	%rdx, 24312(%rsp)
	movq	2320(%rcx), %rdx
	movq	%rdx, 24320(%rsp)
	movq	2328(%rcx), %rdx
	movq	%rdx, 24328(%rsp)
	movq	2336(%rcx), %rdx
	movq	%rdx, 24336(%rsp)
	movq	2344(%rcx), %rdx
	movq	%rdx, 24344(%rsp)
	movq	2352(%rcx), %rdx
	movq	%rdx, 24352(%rsp)
	movq	2360(%rcx), %rdx
	movq	%rdx, 24360(%rsp)
	movq	2368(%rcx), %rdx
	movq	%rdx, 24368(%rsp)
	movq	2376(%rcx), %rdx
	movq	%rdx, 24376(%rsp)
	movq	2384(%rcx), %rdx
	movq	%rdx, 24384(%rsp)
	movq	2392(%rcx), %rcx
	movq	%rcx, 24392(%rsp)
	leaq	64(%rsp), %rcx
	leaq	22000(%rsp), %rdx
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
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$73:
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
	leaq	8224(%rsp), %rdx
	leaq	5536(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$72:
	leaq	8736(%rsp), %rdx
	leaq	5920(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$71:
	leaq	9248(%rsp), %rdx
	leaq	6304(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$70:
	leaq	6688(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$69:
	leaq	7200(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$68:
	leaq	7712(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$67:
	leaq	704(%rsp), %rax
	leaq	8224(%rsp), %rdx
	leaq	6688(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$66:
	leaq	1216(%rsp), %rax
	leaq	8736(%rsp), %rdx
	leaq	7200(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$65:
	leaq	704(%rsp), %rax
	leaq	1216(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$64:
	leaq	1216(%rsp), %rax
	leaq	9248(%rsp), %rdx
	leaq	7712(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$63:
	leaq	704(%rsp), %rax
	leaq	1216(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$62:
	leaq	704(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$61:
	leaq	1216(%rsp), %rax
	leaq	192(%rsp), %rdx
	leaq	704(%rsp), %rsi
	call	L_poly_sub$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$60:
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
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$59:
	movq	24336(%rsp), %rax
	movq	%rax, 96(%rsp)
	movq	24344(%rsp), %rax
	movq	%rax, 104(%rsp)
	movq	24352(%rsp), %rax
	movq	%rax, 112(%rsp)
	movq	24360(%rsp), %rax
	movq	%rax, 120(%rsp)
	leaq	128(%rsp), %rax
	leaq	64(%rsp), %rcx
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$58:
	leaq	3328(%rsp), %rdi
	leaq	64(%rsp), %rsi
	leaq	23152(%rsp), %rax
	leaq	160(%rsp), %rcx
	movq	%rax, %rdx
	movq	(%rdx), %r8
	movq	%r8, 5536(%rsp)
	movq	8(%rdx), %r8
	movq	%r8, 5544(%rsp)
	movq	16(%rdx), %r8
	movq	%r8, 5552(%rsp)
	movq	24(%rdx), %r8
	movq	%r8, 5560(%rsp)
	movq	32(%rdx), %r8
	movq	%r8, 5568(%rsp)
	movq	40(%rdx), %r8
	movq	%r8, 5576(%rsp)
	movq	48(%rdx), %r8
	movq	%r8, 5584(%rsp)
	movq	56(%rdx), %r8
	movq	%r8, 5592(%rsp)
	movq	64(%rdx), %r8
	movq	%r8, 5600(%rsp)
	movq	72(%rdx), %r8
	movq	%r8, 5608(%rsp)
	movq	80(%rdx), %r8
	movq	%r8, 5616(%rsp)
	movq	88(%rdx), %r8
	movq	%r8, 5624(%rsp)
	movq	96(%rdx), %r8
	movq	%r8, 5632(%rsp)
	movq	104(%rdx), %r8
	movq	%r8, 5640(%rsp)
	movq	112(%rdx), %r8
	movq	%r8, 5648(%rsp)
	movq	120(%rdx), %r8
	movq	%r8, 5656(%rsp)
	movq	128(%rdx), %r8
	movq	%r8, 5664(%rsp)
	movq	136(%rdx), %r8
	movq	%r8, 5672(%rsp)
	movq	144(%rdx), %r8
	movq	%r8, 5680(%rsp)
	movq	152(%rdx), %r8
	movq	%r8, 5688(%rsp)
	movq	160(%rdx), %r8
	movq	%r8, 5696(%rsp)
	movq	168(%rdx), %r8
	movq	%r8, 5704(%rsp)
	movq	176(%rdx), %r8
	movq	%r8, 5712(%rsp)
	movq	184(%rdx), %r8
	movq	%r8, 5720(%rsp)
	movq	192(%rdx), %r8
	movq	%r8, 5728(%rsp)
	movq	200(%rdx), %r8
	movq	%r8, 5736(%rsp)
	movq	208(%rdx), %r8
	movq	%r8, 5744(%rsp)
	movq	216(%rdx), %r8
	movq	%r8, 5752(%rsp)
	movq	224(%rdx), %r8
	movq	%r8, 5760(%rsp)
	movq	232(%rdx), %r8
	movq	%r8, 5768(%rsp)
	movq	240(%rdx), %r8
	movq	%r8, 5776(%rsp)
	movq	248(%rdx), %r8
	movq	%r8, 5784(%rsp)
	movq	256(%rdx), %r8
	movq	%r8, 5792(%rsp)
	movq	264(%rdx), %r8
	movq	%r8, 5800(%rsp)
	movq	272(%rdx), %r8
	movq	%r8, 5808(%rsp)
	movq	280(%rdx), %r8
	movq	%r8, 5816(%rsp)
	movq	288(%rdx), %r8
	movq	%r8, 5824(%rsp)
	movq	296(%rdx), %r8
	movq	%r8, 5832(%rsp)
	movq	304(%rdx), %r8
	movq	%r8, 5840(%rsp)
	movq	312(%rdx), %r8
	movq	%r8, 5848(%rsp)
	movq	320(%rdx), %r8
	movq	%r8, 5856(%rsp)
	movq	328(%rdx), %r8
	movq	%r8, 5864(%rsp)
	movq	336(%rdx), %r8
	movq	%r8, 5872(%rsp)
	movq	344(%rdx), %r8
	movq	%r8, 5880(%rsp)
	movq	352(%rdx), %r8
	movq	%r8, 5888(%rsp)
	movq	360(%rdx), %r8
	movq	%r8, 5896(%rsp)
	movq	368(%rdx), %r8
	movq	%r8, 5904(%rsp)
	movq	376(%rdx), %r8
	movq	%r8, 5912(%rsp)
	movq	384(%rdx), %r8
	movq	%r8, 5920(%rsp)
	movq	392(%rdx), %r8
	movq	%r8, 5928(%rsp)
	movq	400(%rdx), %r8
	movq	%r8, 5936(%rsp)
	movq	408(%rdx), %r8
	movq	%r8, 5944(%rsp)
	movq	416(%rdx), %r8
	movq	%r8, 5952(%rsp)
	movq	424(%rdx), %r8
	movq	%r8, 5960(%rsp)
	movq	432(%rdx), %r8
	movq	%r8, 5968(%rsp)
	movq	440(%rdx), %r8
	movq	%r8, 5976(%rsp)
	movq	448(%rdx), %r8
	movq	%r8, 5984(%rsp)
	movq	456(%rdx), %r8
	movq	%r8, 5992(%rsp)
	movq	464(%rdx), %r8
	movq	%r8, 6000(%rsp)
	movq	472(%rdx), %r8
	movq	%r8, 6008(%rsp)
	movq	480(%rdx), %r8
	movq	%r8, 6016(%rsp)
	movq	488(%rdx), %r8
	movq	%r8, 6024(%rsp)
	movq	496(%rdx), %r8
	movq	%r8, 6032(%rsp)
	movq	504(%rdx), %r8
	movq	%r8, 6040(%rsp)
	movq	512(%rdx), %r8
	movq	%r8, 6048(%rsp)
	movq	520(%rdx), %r8
	movq	%r8, 6056(%rsp)
	movq	528(%rdx), %r8
	movq	%r8, 6064(%rsp)
	movq	536(%rdx), %r8
	movq	%r8, 6072(%rsp)
	movq	544(%rdx), %r8
	movq	%r8, 6080(%rsp)
	movq	552(%rdx), %r8
	movq	%r8, 6088(%rsp)
	movq	560(%rdx), %r8
	movq	%r8, 6096(%rsp)
	movq	568(%rdx), %r8
	movq	%r8, 6104(%rsp)
	movq	576(%rdx), %r8
	movq	%r8, 6112(%rsp)
	movq	584(%rdx), %r8
	movq	%r8, 6120(%rsp)
	movq	592(%rdx), %r8
	movq	%r8, 6128(%rsp)
	movq	600(%rdx), %r8
	movq	%r8, 6136(%rsp)
	movq	608(%rdx), %r8
	movq	%r8, 6144(%rsp)
	movq	616(%rdx), %r8
	movq	%r8, 6152(%rsp)
	movq	624(%rdx), %r8
	movq	%r8, 6160(%rsp)
	movq	632(%rdx), %r8
	movq	%r8, 6168(%rsp)
	movq	640(%rdx), %r8
	movq	%r8, 6176(%rsp)
	movq	648(%rdx), %r8
	movq	%r8, 6184(%rsp)
	movq	656(%rdx), %r8
	movq	%r8, 6192(%rsp)
	movq	664(%rdx), %r8
	movq	%r8, 6200(%rsp)
	movq	672(%rdx), %r8
	movq	%r8, 6208(%rsp)
	movq	680(%rdx), %r8
	movq	%r8, 6216(%rsp)
	movq	688(%rdx), %r8
	movq	%r8, 6224(%rsp)
	movq	696(%rdx), %r8
	movq	%r8, 6232(%rsp)
	movq	704(%rdx), %r8
	movq	%r8, 6240(%rsp)
	movq	712(%rdx), %r8
	movq	%r8, 6248(%rsp)
	movq	720(%rdx), %r8
	movq	%r8, 6256(%rsp)
	movq	728(%rdx), %r8
	movq	%r8, 6264(%rsp)
	movq	736(%rdx), %r8
	movq	%r8, 6272(%rsp)
	movq	744(%rdx), %r8
	movq	%r8, 6280(%rsp)
	movq	752(%rdx), %r8
	movq	%r8, 6288(%rsp)
	movq	760(%rdx), %r8
	movq	%r8, 6296(%rsp)
	movq	768(%rdx), %r8
	movq	%r8, 6304(%rsp)
	movq	776(%rdx), %r8
	movq	%r8, 6312(%rsp)
	movq	784(%rdx), %r8
	movq	%r8, 6320(%rsp)
	movq	792(%rdx), %r8
	movq	%r8, 6328(%rsp)
	movq	800(%rdx), %r8
	movq	%r8, 6336(%rsp)
	movq	808(%rdx), %r8
	movq	%r8, 6344(%rsp)
	movq	816(%rdx), %r8
	movq	%r8, 6352(%rsp)
	movq	824(%rdx), %r8
	movq	%r8, 6360(%rsp)
	movq	832(%rdx), %r8
	movq	%r8, 6368(%rsp)
	movq	840(%rdx), %r8
	movq	%r8, 6376(%rsp)
	movq	848(%rdx), %r8
	movq	%r8, 6384(%rsp)
	movq	856(%rdx), %r8
	movq	%r8, 6392(%rsp)
	movq	864(%rdx), %r8
	movq	%r8, 6400(%rsp)
	movq	872(%rdx), %r8
	movq	%r8, 6408(%rsp)
	movq	880(%rdx), %r8
	movq	%r8, 6416(%rsp)
	movq	888(%rdx), %r8
	movq	%r8, 6424(%rsp)
	movq	896(%rdx), %r8
	movq	%r8, 6432(%rsp)
	movq	904(%rdx), %r8
	movq	%r8, 6440(%rsp)
	movq	912(%rdx), %r8
	movq	%r8, 6448(%rsp)
	movq	920(%rdx), %r8
	movq	%r8, 6456(%rsp)
	movq	928(%rdx), %r8
	movq	%r8, 6464(%rsp)
	movq	936(%rdx), %r8
	movq	%r8, 6472(%rsp)
	movq	944(%rdx), %r8
	movq	%r8, 6480(%rsp)
	movq	952(%rdx), %r8
	movq	%r8, 6488(%rsp)
	movq	960(%rdx), %r8
	movq	%r8, 6496(%rsp)
	movq	968(%rdx), %r8
	movq	%r8, 6504(%rsp)
	movq	976(%rdx), %r8
	movq	%r8, 6512(%rsp)
	movq	984(%rdx), %r8
	movq	%r8, 6520(%rsp)
	movq	992(%rdx), %r8
	movq	%r8, 6528(%rsp)
	movq	1000(%rdx), %r8
	movq	%r8, 6536(%rsp)
	movq	1008(%rdx), %r8
	movq	%r8, 6544(%rsp)
	movq	1016(%rdx), %r8
	movq	%r8, 6552(%rsp)
	movq	1024(%rdx), %r8
	movq	%r8, 6560(%rsp)
	movq	1032(%rdx), %r8
	movq	%r8, 6568(%rsp)
	movq	1040(%rdx), %r8
	movq	%r8, 6576(%rsp)
	movq	1048(%rdx), %r8
	movq	%r8, 6584(%rsp)
	movq	1056(%rdx), %r8
	movq	%r8, 6592(%rsp)
	movq	1064(%rdx), %r8
	movq	%r8, 6600(%rsp)
	movq	1072(%rdx), %r8
	movq	%r8, 6608(%rsp)
	movq	1080(%rdx), %r8
	movq	%r8, 6616(%rsp)
	movq	1088(%rdx), %r8
	movq	%r8, 6624(%rsp)
	movq	1096(%rdx), %r8
	movq	%r8, 6632(%rsp)
	movq	1104(%rdx), %r8
	movq	%r8, 6640(%rsp)
	movq	1112(%rdx), %r8
	movq	%r8, 6648(%rsp)
	movq	1120(%rdx), %r8
	movq	%r8, 6656(%rsp)
	movq	1128(%rdx), %r8
	movq	%r8, 6664(%rsp)
	movq	1136(%rdx), %r8
	movq	%r8, 6672(%rsp)
	movq	1144(%rdx), %rdx
	movq	%rdx, 6680(%rsp)
	leaq	6688(%rsp), %rdx
	leaq	5536(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$57:
	leaq	7200(%rsp), %rdx
	leaq	5920(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$56:
	leaq	7712(%rsp), %rdx
	leaq	6304(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$55:
	movq	1152(%rax), %rdx
	movq	%rdx, 32(%rsp)
	movq	1160(%rax), %rdx
	movq	%rdx, 40(%rsp)
	movq	1168(%rax), %rdx
	movq	%rdx, 48(%rsp)
	movq	1176(%rax), %rax
	movq	%rax, 56(%rsp)
	leaq	1216(%rsp), %rax
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$54:
	movq	%rcx, %mm2
	movq	$1, %rax
	leaq	14976(%rsp), %r10
	leaq	32(%rsp), %rsi
	movq	%rax, %mm3
	leaq	12832(%rsp), %r15
	movq	$0, %rdx
	movq	%r10, %r14
	movq	%mm3, %rax
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$53:
	leaq	856(%rsp), %rsp
	movq	$8, %rdx
	leaq	2048(%r10), %r14
	movq	%mm3, %rax
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$52:
	leaq	856(%rsp), %rsp
	leaq	4096(%r10), %rcx
	movw	$514, %ax
	movq	%r15, %r13
	movw	%ax, 24400(%rsp)
	leaq	24400(%rsp), %rax
	leaq	-248(%rsp), %rsp
	call	L_shake128_absorb_A32_A2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$51:
	leaq	248(%rsp), %rsp
	call	L_shake128_squeeze3blocks$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$50:
	call	L__gen_matrix_fill_polynomial$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$49:
	movq	%r10, %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$48:
	leaq	512(%r10), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$47:
	leaq	1024(%r10), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$46:
	leaq	1536(%r10), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$45:
	leaq	2048(%r10), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$44:
	leaq	2560(%r10), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$43:
	leaq	3072(%r10), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$42:
	leaq	3584(%r10), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$41:
	leaq	4096(%r10), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$40:
	movq	%mm2, %r9
	movb	$0, %r12b
	leaq	9760(%rsp), %rax
	leaq	10272(%rsp), %r11
	leaq	10784(%rsp), %rbx
	leaq	8224(%rsp), %rbp
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$39:
	leaq	600(%rsp), %rsp
	movq	%mm2, %r9
	movb	$4, %r12b
	leaq	8736(%rsp), %rax
	leaq	9248(%rsp), %r11
	leaq	704(%rsp), %rbx
	leaq	11296(%rsp), %rbp
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$38:
	leaq	600(%rsp), %rsp
	leaq	9760(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$37:
	leaq	10272(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$36:
	leaq	10784(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$35:
	leaq	11296(%rsp), %rax
	leaq	14976(%rsp), %rdx
	leaq	9760(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$34:
	leaq	192(%rsp), %rax
	leaq	15488(%rsp), %rdx
	leaq	10272(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$33:
	leaq	11296(%rsp), %rax
	leaq	192(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$32:
	leaq	192(%rsp), %rax
	leaq	16000(%rsp), %rdx
	leaq	10784(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$31:
	leaq	11296(%rsp), %rax
	leaq	192(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$30:
	leaq	11808(%rsp), %rax
	leaq	16512(%rsp), %rdx
	leaq	9760(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$29:
	leaq	192(%rsp), %rax
	leaq	17024(%rsp), %rdx
	leaq	10272(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$28:
	leaq	11808(%rsp), %rax
	leaq	192(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$27:
	leaq	192(%rsp), %rax
	leaq	17536(%rsp), %rdx
	leaq	10784(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$26:
	leaq	11808(%rsp), %rax
	leaq	192(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$25:
	leaq	12320(%rsp), %rax
	leaq	18048(%rsp), %rdx
	leaq	9760(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$24:
	leaq	192(%rsp), %rax
	leaq	18560(%rsp), %rdx
	leaq	10272(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$23:
	leaq	12320(%rsp), %rax
	leaq	192(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$22:
	leaq	192(%rsp), %rax
	leaq	19072(%rsp), %rdx
	leaq	10784(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$21:
	leaq	12320(%rsp), %rax
	leaq	192(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$20:
	leaq	192(%rsp), %rax
	leaq	6688(%rsp), %rdx
	leaq	9760(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$19:
	leaq	1728(%rsp), %rax
	leaq	7200(%rsp), %rdx
	leaq	10272(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$18:
	leaq	192(%rsp), %rax
	leaq	1728(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$17:
	leaq	1728(%rsp), %rax
	leaq	7712(%rsp), %rdx
	leaq	10784(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$16:
	leaq	192(%rsp), %rax
	leaq	1728(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$15:
	leaq	11296(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$14:
	leaq	11808(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$13:
	leaq	12320(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$12:
	leaq	192(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$11:
	leaq	11296(%rsp), %rax
	leaq	8224(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$10:
	leaq	11808(%rsp), %rax
	leaq	8736(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$9:
	leaq	12320(%rsp), %rax
	leaq	9248(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$8:
	leaq	192(%rsp), %rax
	leaq	704(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$7:
	leaq	192(%rsp), %rax
	leaq	1216(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$6:
	leaq	11296(%rsp), %rax
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
	leaq	11808(%rsp), %rax
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
	leaq	12320(%rsp), %rax
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
	leaq	192(%rsp), %rax
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
	movq	%rdi, %rax
	leaq	11296(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$5:
	leaq	11808(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$4:
	leaq	12320(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$3:
	leaq	glob_data + 928(%rip), %rcx
	vmovdqu	(%rcx), %ymm0
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
	vmovdqu	%xmm9, (%rax)
	vpextrd	$0, %xmm8, 16(%rax)
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
	vmovdqu	%xmm9, 20(%rax)
	vpextrd	$0, %xmm8, 36(%rax)
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
	vmovdqu	%xmm9, 40(%rax)
	vpextrd	$0, %xmm8, 56(%rax)
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
	vmovdqu	%xmm9, 60(%rax)
	vpextrd	$0, %xmm8, 76(%rax)
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
	vmovdqu	%xmm9, 80(%rax)
	vpextrd	$0, %xmm8, 96(%rax)
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
	vmovdqu	%xmm9, 100(%rax)
	vpextrd	$0, %xmm8, 116(%rax)
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
	vmovdqu	%xmm9, 120(%rax)
	vpextrd	$0, %xmm8, 136(%rax)
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
	vmovdqu	%xmm9, 140(%rax)
	vpextrd	$0, %xmm8, 156(%rax)
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
	vmovdqu	%xmm9, 160(%rax)
	vpextrd	$0, %xmm8, 176(%rax)
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
	vmovdqu	%xmm9, 180(%rax)
	vpextrd	$0, %xmm8, 196(%rax)
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
	vmovdqu	%xmm9, 200(%rax)
	vpextrd	$0, %xmm8, 216(%rax)
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
	vmovdqu	%xmm9, 220(%rax)
	vpextrd	$0, %xmm8, 236(%rax)
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
	vmovdqu	%xmm9, 240(%rax)
	vpextrd	$0, %xmm8, 256(%rax)
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
	vmovdqu	%xmm9, 260(%rax)
	vpextrd	$0, %xmm8, 276(%rax)
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
	vmovdqu	%xmm9, 280(%rax)
	vpextrd	$0, %xmm8, 296(%rax)
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
	vmovdqu	%xmm9, 300(%rax)
	vpextrd	$0, %xmm8, 316(%rax)
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
	vmovdqu	%xmm9, 320(%rax)
	vpextrd	$0, %xmm8, 336(%rax)
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
	vmovdqu	%xmm9, 340(%rax)
	vpextrd	$0, %xmm8, 356(%rax)
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
	vmovdqu	%xmm9, 360(%rax)
	vpextrd	$0, %xmm8, 376(%rax)
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
	vmovdqu	%xmm9, 380(%rax)
	vpextrd	$0, %xmm8, 396(%rax)
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
	vmovdqu	%xmm9, 400(%rax)
	vpextrd	$0, %xmm8, 416(%rax)
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
	vmovdqu	%xmm9, 420(%rax)
	vpextrd	$0, %xmm8, 436(%rax)
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
	vmovdqu	%xmm9, 440(%rax)
	vpextrd	$0, %xmm8, 456(%rax)
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
	vmovdqu	%xmm9, 460(%rax)
	vpextrd	$0, %xmm8, 476(%rax)
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
	vmovdqu	%xmm9, 480(%rax)
	vpextrd	$0, %xmm8, 496(%rax)
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
	vmovdqu	%xmm9, 500(%rax)
	vpextrd	$0, %xmm8, 516(%rax)
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
	vmovdqu	%xmm9, 520(%rax)
	vpextrd	$0, %xmm8, 536(%rax)
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
	vmovdqu	%xmm9, 540(%rax)
	vpextrd	$0, %xmm8, 556(%rax)
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
	vmovdqu	%xmm9, 560(%rax)
	vpextrd	$0, %xmm8, 576(%rax)
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
	vmovdqu	%xmm9, 580(%rax)
	vpextrd	$0, %xmm8, 596(%rax)
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
	vmovdqu	%xmm9, 600(%rax)
	vpextrd	$0, %xmm8, 616(%rax)
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
	vmovdqu	%xmm9, 620(%rax)
	vpextrd	$0, %xmm8, 636(%rax)
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
	vmovdqu	%xmm9, 640(%rax)
	vpextrd	$0, %xmm8, 656(%rax)
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
	vmovdqu	%xmm9, 660(%rax)
	vpextrd	$0, %xmm8, 676(%rax)
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
	vmovdqu	%xmm9, 680(%rax)
	vpextrd	$0, %xmm8, 696(%rax)
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
	vmovdqu	%xmm9, 700(%rax)
	vpextrd	$0, %xmm8, 716(%rax)
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
	vmovdqu	%xmm9, 720(%rax)
	vpextrd	$0, %xmm8, 736(%rax)
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
	vmovdqu	%xmm9, 740(%rax)
	vpextrd	$0, %xmm8, 756(%rax)
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
	vmovdqu	%xmm9, 760(%rax)
	vpextrd	$0, %xmm8, 776(%rax)
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
	vmovdqu	%xmm9, 780(%rax)
	vpextrd	$0, %xmm8, 796(%rax)
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
	vmovdqu	%xmm9, 800(%rax)
	vpextrd	$0, %xmm8, 816(%rax)
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
	vmovdqu	%xmm9, 820(%rax)
	vpextrd	$0, %xmm8, 836(%rax)
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
	vmovdqu	%xmm9, 840(%rax)
	vpextrd	$0, %xmm8, 856(%rax)
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
	vmovdqu	%xmm9, 860(%rax)
	vpextrd	$0, %xmm8, 876(%rax)
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
	vmovdqu	%xmm9, 880(%rax)
	vpextrd	$0, %xmm8, 896(%rax)
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
	vmovdqu	%xmm9, 900(%rax)
	vpextrd	$0, %xmm8, 916(%rax)
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
	vmovdqu	%xmm9, 920(%rax)
	vpextrd	$0, %xmm8, 936(%rax)
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
	vmovdqu	%xmm1, 940(%rax)
	vpextrd	$0, %xmm0, 956(%rax)
	leaq	960(%rdi), %rax
	leaq	192(%rsp), %rdx
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$2:
	movq	19592(%rsp), %rax
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
	movq	19592(%rsp), %rax
	movq	24368(%rsp), %rcx
	movq	%rcx, 4416(%rsp)
	movq	24376(%rsp), %rcx
	movq	%rcx, 4424(%rsp)
	movq	24384(%rsp), %rcx
	movq	%rcx, 4432(%rsp)
	movq	24392(%rsp), %rcx
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
	movq	19584(%rsp), %rax
	leaq	4416(%rsp), %rcx
	call	L_shake256_A32__A1120$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_dec$1:
	movq	%mm0, %rcx
	leaq	128(%rsp), %rdx
	negq	%rcx
	movq	%rcx, 19584(%rsp)
	vpbroadcastq	19584(%rsp), %ymm0
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
	movq	24408(%rsp), %rbx
	movq	24416(%rsp), %rbp
	movq	24424(%rsp), %r12
	movq	24432(%rsp), %r13
	movq	24440(%rsp), %r14
	movq	24448(%rsp), %r15
	movq	24456(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand:
jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand:
	movq	%rsp, %rax
	leaq	-18640(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 18584(%rsp)
	movq	%rbp, 18592(%rsp)
	movq	%r12, 18600(%rsp)
	movq	%r13, 18608(%rsp)
	movq	%r14, 18616(%rsp)
	movq	%r15, 18624(%rsp)
	movq	%rax, 18632(%rsp)
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
	leaq	2208(%rsp), %r10
	leaq	4448(%rsp), %rax
	leaq	18544(%rsp), %rcx
	movq	%rsp, %rdx
	movq	%rax, 18528(%rsp)
	movq	%rcx, 18536(%rsp)
	movq	(%rdx), %rcx
	movq	%rcx, 32(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 40(%rsp)
	movq	16(%rdx), %rcx
	movq	%rcx, 48(%rsp)
	movq	24(%rdx), %rcx
	movq	%rcx, 56(%rsp)
	leaq	64(%rsp), %rcx
	call	L_sha3_256A_A1184$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$58:
	leaq	96(%rsp), %rax
	leaq	32(%rsp), %rcx
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$57:
	movq	18528(%rsp), %rax
	leaq	32(%rsp), %rsi
	leaq	128(%rsp), %rcx
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	%rdi, 3296(%rsp)
	movq	8(%rdx), %rdi
	movq	%rdi, 3304(%rsp)
	movq	16(%rdx), %rdi
	movq	%rdi, 3312(%rsp)
	movq	24(%rdx), %rdi
	movq	%rdi, 3320(%rsp)
	movq	32(%rdx), %rdi
	movq	%rdi, 3328(%rsp)
	movq	40(%rdx), %rdi
	movq	%rdi, 3336(%rsp)
	movq	48(%rdx), %rdi
	movq	%rdi, 3344(%rsp)
	movq	56(%rdx), %rdi
	movq	%rdi, 3352(%rsp)
	movq	64(%rdx), %rdi
	movq	%rdi, 3360(%rsp)
	movq	72(%rdx), %rdi
	movq	%rdi, 3368(%rsp)
	movq	80(%rdx), %rdi
	movq	%rdi, 3376(%rsp)
	movq	88(%rdx), %rdi
	movq	%rdi, 3384(%rsp)
	movq	96(%rdx), %rdi
	movq	%rdi, 3392(%rsp)
	movq	104(%rdx), %rdi
	movq	%rdi, 3400(%rsp)
	movq	112(%rdx), %rdi
	movq	%rdi, 3408(%rsp)
	movq	120(%rdx), %rdi
	movq	%rdi, 3416(%rsp)
	movq	128(%rdx), %rdi
	movq	%rdi, 3424(%rsp)
	movq	136(%rdx), %rdi
	movq	%rdi, 3432(%rsp)
	movq	144(%rdx), %rdi
	movq	%rdi, 3440(%rsp)
	movq	152(%rdx), %rdi
	movq	%rdi, 3448(%rsp)
	movq	160(%rdx), %rdi
	movq	%rdi, 3456(%rsp)
	movq	168(%rdx), %rdi
	movq	%rdi, 3464(%rsp)
	movq	176(%rdx), %rdi
	movq	%rdi, 3472(%rsp)
	movq	184(%rdx), %rdi
	movq	%rdi, 3480(%rsp)
	movq	192(%rdx), %rdi
	movq	%rdi, 3488(%rsp)
	movq	200(%rdx), %rdi
	movq	%rdi, 3496(%rsp)
	movq	208(%rdx), %rdi
	movq	%rdi, 3504(%rsp)
	movq	216(%rdx), %rdi
	movq	%rdi, 3512(%rsp)
	movq	224(%rdx), %rdi
	movq	%rdi, 3520(%rsp)
	movq	232(%rdx), %rdi
	movq	%rdi, 3528(%rsp)
	movq	240(%rdx), %rdi
	movq	%rdi, 3536(%rsp)
	movq	248(%rdx), %rdi
	movq	%rdi, 3544(%rsp)
	movq	256(%rdx), %rdi
	movq	%rdi, 3552(%rsp)
	movq	264(%rdx), %rdi
	movq	%rdi, 3560(%rsp)
	movq	272(%rdx), %rdi
	movq	%rdi, 3568(%rsp)
	movq	280(%rdx), %rdi
	movq	%rdi, 3576(%rsp)
	movq	288(%rdx), %rdi
	movq	%rdi, 3584(%rsp)
	movq	296(%rdx), %rdi
	movq	%rdi, 3592(%rsp)
	movq	304(%rdx), %rdi
	movq	%rdi, 3600(%rsp)
	movq	312(%rdx), %rdi
	movq	%rdi, 3608(%rsp)
	movq	320(%rdx), %rdi
	movq	%rdi, 3616(%rsp)
	movq	328(%rdx), %rdi
	movq	%rdi, 3624(%rsp)
	movq	336(%rdx), %rdi
	movq	%rdi, 3632(%rsp)
	movq	344(%rdx), %rdi
	movq	%rdi, 3640(%rsp)
	movq	352(%rdx), %rdi
	movq	%rdi, 3648(%rsp)
	movq	360(%rdx), %rdi
	movq	%rdi, 3656(%rsp)
	movq	368(%rdx), %rdi
	movq	%rdi, 3664(%rsp)
	movq	376(%rdx), %rdi
	movq	%rdi, 3672(%rsp)
	movq	384(%rdx), %rdi
	movq	%rdi, 3680(%rsp)
	movq	392(%rdx), %rdi
	movq	%rdi, 3688(%rsp)
	movq	400(%rdx), %rdi
	movq	%rdi, 3696(%rsp)
	movq	408(%rdx), %rdi
	movq	%rdi, 3704(%rsp)
	movq	416(%rdx), %rdi
	movq	%rdi, 3712(%rsp)
	movq	424(%rdx), %rdi
	movq	%rdi, 3720(%rsp)
	movq	432(%rdx), %rdi
	movq	%rdi, 3728(%rsp)
	movq	440(%rdx), %rdi
	movq	%rdi, 3736(%rsp)
	movq	448(%rdx), %rdi
	movq	%rdi, 3744(%rsp)
	movq	456(%rdx), %rdi
	movq	%rdi, 3752(%rsp)
	movq	464(%rdx), %rdi
	movq	%rdi, 3760(%rsp)
	movq	472(%rdx), %rdi
	movq	%rdi, 3768(%rsp)
	movq	480(%rdx), %rdi
	movq	%rdi, 3776(%rsp)
	movq	488(%rdx), %rdi
	movq	%rdi, 3784(%rsp)
	movq	496(%rdx), %rdi
	movq	%rdi, 3792(%rsp)
	movq	504(%rdx), %rdi
	movq	%rdi, 3800(%rsp)
	movq	512(%rdx), %rdi
	movq	%rdi, 3808(%rsp)
	movq	520(%rdx), %rdi
	movq	%rdi, 3816(%rsp)
	movq	528(%rdx), %rdi
	movq	%rdi, 3824(%rsp)
	movq	536(%rdx), %rdi
	movq	%rdi, 3832(%rsp)
	movq	544(%rdx), %rdi
	movq	%rdi, 3840(%rsp)
	movq	552(%rdx), %rdi
	movq	%rdi, 3848(%rsp)
	movq	560(%rdx), %rdi
	movq	%rdi, 3856(%rsp)
	movq	568(%rdx), %rdi
	movq	%rdi, 3864(%rsp)
	movq	576(%rdx), %rdi
	movq	%rdi, 3872(%rsp)
	movq	584(%rdx), %rdi
	movq	%rdi, 3880(%rsp)
	movq	592(%rdx), %rdi
	movq	%rdi, 3888(%rsp)
	movq	600(%rdx), %rdi
	movq	%rdi, 3896(%rsp)
	movq	608(%rdx), %rdi
	movq	%rdi, 3904(%rsp)
	movq	616(%rdx), %rdi
	movq	%rdi, 3912(%rsp)
	movq	624(%rdx), %rdi
	movq	%rdi, 3920(%rsp)
	movq	632(%rdx), %rdi
	movq	%rdi, 3928(%rsp)
	movq	640(%rdx), %rdi
	movq	%rdi, 3936(%rsp)
	movq	648(%rdx), %rdi
	movq	%rdi, 3944(%rsp)
	movq	656(%rdx), %rdi
	movq	%rdi, 3952(%rsp)
	movq	664(%rdx), %rdi
	movq	%rdi, 3960(%rsp)
	movq	672(%rdx), %rdi
	movq	%rdi, 3968(%rsp)
	movq	680(%rdx), %rdi
	movq	%rdi, 3976(%rsp)
	movq	688(%rdx), %rdi
	movq	%rdi, 3984(%rsp)
	movq	696(%rdx), %rdi
	movq	%rdi, 3992(%rsp)
	movq	704(%rdx), %rdi
	movq	%rdi, 4000(%rsp)
	movq	712(%rdx), %rdi
	movq	%rdi, 4008(%rsp)
	movq	720(%rdx), %rdi
	movq	%rdi, 4016(%rsp)
	movq	728(%rdx), %rdi
	movq	%rdi, 4024(%rsp)
	movq	736(%rdx), %rdi
	movq	%rdi, 4032(%rsp)
	movq	744(%rdx), %rdi
	movq	%rdi, 4040(%rsp)
	movq	752(%rdx), %rdi
	movq	%rdi, 4048(%rsp)
	movq	760(%rdx), %rdi
	movq	%rdi, 4056(%rsp)
	movq	768(%rdx), %rdi
	movq	%rdi, 4064(%rsp)
	movq	776(%rdx), %rdi
	movq	%rdi, 4072(%rsp)
	movq	784(%rdx), %rdi
	movq	%rdi, 4080(%rsp)
	movq	792(%rdx), %rdi
	movq	%rdi, 4088(%rsp)
	movq	800(%rdx), %rdi
	movq	%rdi, 4096(%rsp)
	movq	808(%rdx), %rdi
	movq	%rdi, 4104(%rsp)
	movq	816(%rdx), %rdi
	movq	%rdi, 4112(%rsp)
	movq	824(%rdx), %rdi
	movq	%rdi, 4120(%rsp)
	movq	832(%rdx), %rdi
	movq	%rdi, 4128(%rsp)
	movq	840(%rdx), %rdi
	movq	%rdi, 4136(%rsp)
	movq	848(%rdx), %rdi
	movq	%rdi, 4144(%rsp)
	movq	856(%rdx), %rdi
	movq	%rdi, 4152(%rsp)
	movq	864(%rdx), %rdi
	movq	%rdi, 4160(%rsp)
	movq	872(%rdx), %rdi
	movq	%rdi, 4168(%rsp)
	movq	880(%rdx), %rdi
	movq	%rdi, 4176(%rsp)
	movq	888(%rdx), %rdi
	movq	%rdi, 4184(%rsp)
	movq	896(%rdx), %rdi
	movq	%rdi, 4192(%rsp)
	movq	904(%rdx), %rdi
	movq	%rdi, 4200(%rsp)
	movq	912(%rdx), %rdi
	movq	%rdi, 4208(%rsp)
	movq	920(%rdx), %rdi
	movq	%rdi, 4216(%rsp)
	movq	928(%rdx), %rdi
	movq	%rdi, 4224(%rsp)
	movq	936(%rdx), %rdi
	movq	%rdi, 4232(%rsp)
	movq	944(%rdx), %rdi
	movq	%rdi, 4240(%rsp)
	movq	952(%rdx), %rdi
	movq	%rdi, 4248(%rsp)
	movq	960(%rdx), %rdi
	movq	%rdi, 4256(%rsp)
	movq	968(%rdx), %rdi
	movq	%rdi, 4264(%rsp)
	movq	976(%rdx), %rdi
	movq	%rdi, 4272(%rsp)
	movq	984(%rdx), %rdi
	movq	%rdi, 4280(%rsp)
	movq	992(%rdx), %rdi
	movq	%rdi, 4288(%rsp)
	movq	1000(%rdx), %rdi
	movq	%rdi, 4296(%rsp)
	movq	1008(%rdx), %rdi
	movq	%rdi, 4304(%rsp)
	movq	1016(%rdx), %rdi
	movq	%rdi, 4312(%rsp)
	movq	1024(%rdx), %rdi
	movq	%rdi, 4320(%rsp)
	movq	1032(%rdx), %rdi
	movq	%rdi, 4328(%rsp)
	movq	1040(%rdx), %rdi
	movq	%rdi, 4336(%rsp)
	movq	1048(%rdx), %rdi
	movq	%rdi, 4344(%rsp)
	movq	1056(%rdx), %rdi
	movq	%rdi, 4352(%rsp)
	movq	1064(%rdx), %rdi
	movq	%rdi, 4360(%rsp)
	movq	1072(%rdx), %rdi
	movq	%rdi, 4368(%rsp)
	movq	1080(%rdx), %rdi
	movq	%rdi, 4376(%rsp)
	movq	1088(%rdx), %rdi
	movq	%rdi, 4384(%rsp)
	movq	1096(%rdx), %rdi
	movq	%rdi, 4392(%rsp)
	movq	1104(%rdx), %rdi
	movq	%rdi, 4400(%rsp)
	movq	1112(%rdx), %rdi
	movq	%rdi, 4408(%rsp)
	movq	1120(%rdx), %rdi
	movq	%rdi, 4416(%rsp)
	movq	1128(%rdx), %rdi
	movq	%rdi, 4424(%rsp)
	movq	1136(%rdx), %rdi
	movq	%rdi, 4432(%rsp)
	movq	1144(%rdx), %rdx
	movq	%rdx, 4440(%rsp)
	leaq	5632(%rsp), %rdx
	leaq	3296(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$56:
	leaq	6144(%rsp), %rdx
	leaq	3680(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$55:
	leaq	6656(%rsp), %rdx
	leaq	4064(%rsp), %r8
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$54:
	movq	1152(%rax), %rdx
	movq	%rdx, (%rsp)
	movq	1160(%rax), %rdx
	movq	%rdx, 8(%rsp)
	movq	1168(%rax), %rdx
	movq	%rdx, 16(%rsp)
	movq	1176(%rax), %rax
	movq	%rax, 24(%rsp)
	leaq	160(%rsp), %rax
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$53:
	movq	%rcx, %mm3
	movq	$1, %rax
	leaq	13920(%rsp), %rdi
	movq	%rsp, %rsi
	movq	%rax, %mm4
	leaq	11776(%rsp), %r15
	movq	$0, %rdx
	movq	%rdi, %r14
	movq	%mm4, %rax
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$52:
	leaq	856(%rsp), %rsp
	movq	$8, %rdx
	leaq	2048(%rdi), %r14
	movq	%mm4, %rax
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$51:
	leaq	856(%rsp), %rsp
	leaq	4096(%rdi), %rcx
	movw	$514, %ax
	movq	%r15, %r13
	movw	%ax, 18576(%rsp)
	leaq	18576(%rsp), %rax
	leaq	-248(%rsp), %rsp
	call	L_shake128_absorb_A32_A2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$50:
	leaq	248(%rsp), %rsp
	call	L_shake128_squeeze3blocks$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$49:
	call	L__gen_matrix_fill_polynomial$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$48:
	movq	%rdi, %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$47:
	leaq	512(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$46:
	leaq	1024(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$45:
	leaq	1536(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$44:
	leaq	2048(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$43:
	leaq	2560(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$42:
	leaq	3072(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$41:
	leaq	3584(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$40:
	leaq	4096(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$39:
	movq	%mm3, %r9
	movb	$0, %r12b
	leaq	8704(%rsp), %rax
	leaq	9216(%rsp), %r11
	leaq	9728(%rsp), %rbx
	leaq	7168(%rsp), %rbp
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$38:
	leaq	600(%rsp), %rsp
	movq	%mm3, %r9
	movb	$4, %r12b
	leaq	7680(%rsp), %rax
	leaq	8192(%rsp), %r11
	leaq	672(%rsp), %rbx
	leaq	10240(%rsp), %rbp
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$37:
	leaq	600(%rsp), %rsp
	leaq	8704(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$36:
	leaq	9216(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$35:
	leaq	9728(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$34:
	leaq	10240(%rsp), %rax
	leaq	13920(%rsp), %rdx
	leaq	8704(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$33:
	leaq	1184(%rsp), %rax
	leaq	14432(%rsp), %rdx
	leaq	9216(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$32:
	leaq	10240(%rsp), %rax
	leaq	1184(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$31:
	leaq	1184(%rsp), %rax
	leaq	14944(%rsp), %rdx
	leaq	9728(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$30:
	leaq	10240(%rsp), %rax
	leaq	1184(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$29:
	leaq	10752(%rsp), %rax
	leaq	15456(%rsp), %rdx
	leaq	8704(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$28:
	leaq	1184(%rsp), %rax
	leaq	15968(%rsp), %rdx
	leaq	9216(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$27:
	leaq	10752(%rsp), %rax
	leaq	1184(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$26:
	leaq	1184(%rsp), %rax
	leaq	16480(%rsp), %rdx
	leaq	9728(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$25:
	leaq	10752(%rsp), %rax
	leaq	1184(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$24:
	leaq	11264(%rsp), %rax
	leaq	16992(%rsp), %rdx
	leaq	8704(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$23:
	leaq	1184(%rsp), %rax
	leaq	17504(%rsp), %rdx
	leaq	9216(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$22:
	leaq	11264(%rsp), %rax
	leaq	1184(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$21:
	leaq	1184(%rsp), %rax
	leaq	18016(%rsp), %rdx
	leaq	9728(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$20:
	leaq	11264(%rsp), %rax
	leaq	1184(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$19:
	leaq	1184(%rsp), %rax
	leaq	5632(%rsp), %rdx
	leaq	8704(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$18:
	leaq	1696(%rsp), %rax
	leaq	6144(%rsp), %rdx
	leaq	9216(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$17:
	leaq	1184(%rsp), %rax
	leaq	1696(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$16:
	leaq	1696(%rsp), %rax
	leaq	6656(%rsp), %rdx
	leaq	9728(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$15:
	leaq	1184(%rsp), %rax
	leaq	1696(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$14:
	leaq	10240(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$13:
	leaq	10752(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$12:
	leaq	11264(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$11:
	leaq	1184(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$10:
	leaq	10240(%rsp), %rax
	leaq	7168(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$9:
	leaq	10752(%rsp), %rax
	leaq	7680(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$8:
	leaq	11264(%rsp), %rax
	leaq	8192(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$7:
	leaq	1184(%rsp), %rax
	leaq	672(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$6:
	leaq	1184(%rsp), %rax
	leaq	160(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$5:
	leaq	10240(%rsp), %rax
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
	leaq	10752(%rsp), %rax
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
	leaq	11264(%rsp), %rax
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
	movq	%r10, %rax
	leaq	10240(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$4:
	leaq	10752(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$3:
	leaq	11264(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$2:
	leaq	glob_data + 928(%rip), %rcx
	vmovdqu	(%rcx), %ymm0
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
	vmovdqu	%xmm9, (%rax)
	vpextrd	$0, %xmm8, 16(%rax)
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
	vmovdqu	%xmm9, 20(%rax)
	vpextrd	$0, %xmm8, 36(%rax)
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
	vmovdqu	%xmm9, 40(%rax)
	vpextrd	$0, %xmm8, 56(%rax)
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
	vmovdqu	%xmm9, 60(%rax)
	vpextrd	$0, %xmm8, 76(%rax)
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
	vmovdqu	%xmm9, 80(%rax)
	vpextrd	$0, %xmm8, 96(%rax)
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
	vmovdqu	%xmm9, 100(%rax)
	vpextrd	$0, %xmm8, 116(%rax)
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
	vmovdqu	%xmm9, 120(%rax)
	vpextrd	$0, %xmm8, 136(%rax)
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
	vmovdqu	%xmm9, 140(%rax)
	vpextrd	$0, %xmm8, 156(%rax)
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
	vmovdqu	%xmm9, 160(%rax)
	vpextrd	$0, %xmm8, 176(%rax)
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
	vmovdqu	%xmm9, 180(%rax)
	vpextrd	$0, %xmm8, 196(%rax)
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
	vmovdqu	%xmm9, 200(%rax)
	vpextrd	$0, %xmm8, 216(%rax)
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
	vmovdqu	%xmm9, 220(%rax)
	vpextrd	$0, %xmm8, 236(%rax)
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
	vmovdqu	%xmm9, 240(%rax)
	vpextrd	$0, %xmm8, 256(%rax)
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
	vmovdqu	%xmm9, 260(%rax)
	vpextrd	$0, %xmm8, 276(%rax)
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
	vmovdqu	%xmm9, 280(%rax)
	vpextrd	$0, %xmm8, 296(%rax)
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
	vmovdqu	%xmm9, 300(%rax)
	vpextrd	$0, %xmm8, 316(%rax)
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
	vmovdqu	%xmm9, 320(%rax)
	vpextrd	$0, %xmm8, 336(%rax)
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
	vmovdqu	%xmm9, 340(%rax)
	vpextrd	$0, %xmm8, 356(%rax)
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
	vmovdqu	%xmm9, 360(%rax)
	vpextrd	$0, %xmm8, 376(%rax)
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
	vmovdqu	%xmm9, 380(%rax)
	vpextrd	$0, %xmm8, 396(%rax)
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
	vmovdqu	%xmm9, 400(%rax)
	vpextrd	$0, %xmm8, 416(%rax)
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
	vmovdqu	%xmm9, 420(%rax)
	vpextrd	$0, %xmm8, 436(%rax)
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
	vmovdqu	%xmm9, 440(%rax)
	vpextrd	$0, %xmm8, 456(%rax)
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
	vmovdqu	%xmm9, 460(%rax)
	vpextrd	$0, %xmm8, 476(%rax)
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
	vmovdqu	%xmm9, 480(%rax)
	vpextrd	$0, %xmm8, 496(%rax)
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
	vmovdqu	%xmm9, 500(%rax)
	vpextrd	$0, %xmm8, 516(%rax)
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
	vmovdqu	%xmm9, 520(%rax)
	vpextrd	$0, %xmm8, 536(%rax)
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
	vmovdqu	%xmm9, 540(%rax)
	vpextrd	$0, %xmm8, 556(%rax)
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
	vmovdqu	%xmm9, 560(%rax)
	vpextrd	$0, %xmm8, 576(%rax)
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
	vmovdqu	%xmm9, 580(%rax)
	vpextrd	$0, %xmm8, 596(%rax)
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
	vmovdqu	%xmm9, 600(%rax)
	vpextrd	$0, %xmm8, 616(%rax)
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
	vmovdqu	%xmm9, 620(%rax)
	vpextrd	$0, %xmm8, 636(%rax)
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
	vmovdqu	%xmm9, 640(%rax)
	vpextrd	$0, %xmm8, 656(%rax)
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
	vmovdqu	%xmm9, 660(%rax)
	vpextrd	$0, %xmm8, 676(%rax)
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
	vmovdqu	%xmm9, 680(%rax)
	vpextrd	$0, %xmm8, 696(%rax)
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
	vmovdqu	%xmm9, 700(%rax)
	vpextrd	$0, %xmm8, 716(%rax)
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
	vmovdqu	%xmm9, 720(%rax)
	vpextrd	$0, %xmm8, 736(%rax)
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
	vmovdqu	%xmm9, 740(%rax)
	vpextrd	$0, %xmm8, 756(%rax)
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
	vmovdqu	%xmm9, 760(%rax)
	vpextrd	$0, %xmm8, 776(%rax)
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
	vmovdqu	%xmm9, 780(%rax)
	vpextrd	$0, %xmm8, 796(%rax)
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
	vmovdqu	%xmm9, 800(%rax)
	vpextrd	$0, %xmm8, 816(%rax)
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
	vmovdqu	%xmm9, 820(%rax)
	vpextrd	$0, %xmm8, 836(%rax)
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
	vmovdqu	%xmm9, 840(%rax)
	vpextrd	$0, %xmm8, 856(%rax)
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
	vmovdqu	%xmm9, 860(%rax)
	vpextrd	$0, %xmm8, 876(%rax)
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
	vmovdqu	%xmm9, 880(%rax)
	vpextrd	$0, %xmm8, 896(%rax)
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
	vmovdqu	%xmm9, 900(%rax)
	vpextrd	$0, %xmm8, 916(%rax)
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
	vmovdqu	%xmm9, 920(%rax)
	vpextrd	$0, %xmm8, 936(%rax)
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
	vmovdqu	%xmm1, 940(%rax)
	vpextrd	$0, %xmm0, 956(%rax)
	leaq	960(%r10), %rax
	leaq	1184(%rsp), %rdx
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_enc_derand$1:
	movq	18536(%rsp), %rax
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
	movq	18544(%rsp), %rax
	movq	%rax, (%rcx)
	movq	18552(%rsp), %rax
	movq	%rax, 8(%rcx)
	movq	18560(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	18568(%rsp), %rax
	movq	%rax, 24(%rcx)
	xorq	%rax, %rax
	movq	18584(%rsp), %rbx
	movq	18592(%rsp), %rbp
	movq	18600(%rsp), %r12
	movq	18608(%rsp), %r13
	movq	18616(%rsp), %r14
	movq	18624(%rsp), %r15
	movq	18632(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand:
jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand:
	movq	%rsp, %rax
	leaq	-15760(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 15704(%rsp)
	movq	%rbp, 15712(%rsp)
	movq	%r12, 15720(%rsp)
	movq	%r13, 15728(%rsp)
	movq	%r14, 15736(%rsp)
	movq	%r15, 15744(%rsp)
	movq	%rax, 15752(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm1
	movq	%rsi, %mm2
	movq	(%rdx), %rax
	movq	%rax, 15632(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 15640(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 15648(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 15656(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 15664(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 15672(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 15680(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 15688(%rsp)
	leaq	608(%rsp), %rax
	leaq	8544(%rsp), %rcx
	leaq	15632(%rsp), %rdx
	movq	%rdx, %mm3
	movq	%rax, %mm4
	movq	%rcx, %mm5
	movq	(%rdx), %rax
	movq	%rax, 15552(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 15560(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 15568(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 15576(%rsp)
	movb	$3, 15584(%rsp)
	leaq	32(%rsp), %rax
	leaq	15552(%rsp), %rcx
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$51:
	movq	32(%rsp), %rax
	movq	%rax, (%rsp)
	movq	64(%rsp), %rax
	movq	%rax, 15600(%rsp)
	movq	40(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	72(%rsp), %rax
	movq	%rax, 15608(%rsp)
	movq	48(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	80(%rsp), %rax
	movq	%rax, 15616(%rsp)
	movq	56(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	88(%rsp), %rax
	movq	%rax, 15624(%rsp)
	movq	$0, %rax
	leaq	10944(%rsp), %rdi
	movq	%rsp, %rsi
	movq	%rax, %mm6
	leaq	6400(%rsp), %r15
	movq	$0, %rdx
	movq	%rdi, %r14
	movq	%mm6, %rax
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$50:
	leaq	856(%rsp), %rsp
	movq	$8, %rdx
	leaq	2048(%rdi), %r14
	movq	%mm6, %rax
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$49:
	leaq	856(%rsp), %rsp
	leaq	4096(%rdi), %rcx
	movw	$514, %ax
	movq	%r15, %r13
	movw	%ax, 15696(%rsp)
	leaq	15696(%rsp), %rax
	leaq	-248(%rsp), %rsp
	call	L_shake128_absorb_A32_A2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$48:
	leaq	248(%rsp), %rsp
	call	L_shake128_squeeze3blocks$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$47:
	call	L__gen_matrix_fill_polynomial$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$46:
	movq	%rdi, %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$45:
	leaq	512(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$44:
	leaq	1024(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$43:
	leaq	1536(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$42:
	leaq	2048(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$41:
	leaq	2560(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$40:
	leaq	3072(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$39:
	leaq	3584(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$38:
	leaq	4096(%rdi), %rax
	call	L_nttunpack$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$37:
	movb	$0, %r12b
	leaq	3328(%rsp), %rax
	leaq	3840(%rsp), %r11
	leaq	4352(%rsp), %rbx
	leaq	1792(%rsp), %rbp
	leaq	15600(%rsp), %r9
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$36:
	leaq	600(%rsp), %rsp
	movb	$4, %r12b
	leaq	2304(%rsp), %rax
	leaq	2816(%rsp), %r11
	leaq	4864(%rsp), %rbx
	leaq	5376(%rsp), %rbp
	leaq	15600(%rsp), %r9
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$35:
	leaq	600(%rsp), %rsp
	leaq	3328(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$34:
	leaq	3840(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$33:
	leaq	4352(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$32:
	leaq	1792(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$31:
	leaq	2304(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$30:
	leaq	2816(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$29:
	leaq	4864(%rsp), %rax
	leaq	10944(%rsp), %rdx
	leaq	3328(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$28:
	leaq	96(%rsp), %rax
	leaq	11456(%rsp), %rdx
	leaq	3840(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$27:
	leaq	4864(%rsp), %rax
	leaq	96(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$26:
	leaq	96(%rsp), %rax
	leaq	11968(%rsp), %rdx
	leaq	4352(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$25:
	leaq	4864(%rsp), %rax
	leaq	96(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$24:
	leaq	4864(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$23:
	leaq	5376(%rsp), %rax
	leaq	12480(%rsp), %rdx
	leaq	3328(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$22:
	leaq	96(%rsp), %rax
	leaq	12992(%rsp), %rdx
	leaq	3840(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$21:
	leaq	5376(%rsp), %rax
	leaq	96(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$20:
	leaq	96(%rsp), %rax
	leaq	13504(%rsp), %rdx
	leaq	4352(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$19:
	leaq	5376(%rsp), %rax
	leaq	96(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$18:
	leaq	5376(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$17:
	leaq	5888(%rsp), %rax
	leaq	14016(%rsp), %rdx
	leaq	3328(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$16:
	leaq	96(%rsp), %rax
	leaq	14528(%rsp), %rdx
	leaq	3840(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$15:
	leaq	5888(%rsp), %rax
	leaq	96(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$14:
	leaq	96(%rsp), %rax
	leaq	15040(%rsp), %rdx
	leaq	4352(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$13:
	leaq	5888(%rsp), %rax
	leaq	96(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$12:
	leaq	5888(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$11:
	leaq	4864(%rsp), %rax
	leaq	1792(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$10:
	leaq	5376(%rsp), %rax
	leaq	2304(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$9:
	leaq	5888(%rsp), %rax
	leaq	2816(%rsp), %rdx
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
	movq	%mm4, %rax
	movq	%mm5, %rcx
	movq	%rcx, %rsi
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
	movq	%rax, %rsi
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
	movq	%rdx, 1152(%rax)
	movq	8(%rsp), %rdx
	movq	%rdx, 1160(%rax)
	movq	16(%rsp), %rdx
	movq	%rdx, 1168(%rax)
	movq	24(%rsp), %rdx
	movq	%rdx, 1176(%rax)
	movq	(%rax), %rdx
	movq	%rdx, 1152(%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 1160(%rcx)
	movq	16(%rax), %rdx
	movq	%rdx, 1168(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 1176(%rcx)
	movq	32(%rax), %rdx
	movq	%rdx, 1184(%rcx)
	movq	40(%rax), %rdx
	movq	%rdx, 1192(%rcx)
	movq	48(%rax), %rdx
	movq	%rdx, 1200(%rcx)
	movq	56(%rax), %rdx
	movq	%rdx, 1208(%rcx)
	movq	64(%rax), %rdx
	movq	%rdx, 1216(%rcx)
	movq	72(%rax), %rdx
	movq	%rdx, 1224(%rcx)
	movq	80(%rax), %rdx
	movq	%rdx, 1232(%rcx)
	movq	88(%rax), %rdx
	movq	%rdx, 1240(%rcx)
	movq	96(%rax), %rdx
	movq	%rdx, 1248(%rcx)
	movq	104(%rax), %rdx
	movq	%rdx, 1256(%rcx)
	movq	112(%rax), %rdx
	movq	%rdx, 1264(%rcx)
	movq	120(%rax), %rdx
	movq	%rdx, 1272(%rcx)
	movq	128(%rax), %rdx
	movq	%rdx, 1280(%rcx)
	movq	136(%rax), %rdx
	movq	%rdx, 1288(%rcx)
	movq	144(%rax), %rdx
	movq	%rdx, 1296(%rcx)
	movq	152(%rax), %rdx
	movq	%rdx, 1304(%rcx)
	movq	160(%rax), %rdx
	movq	%rdx, 1312(%rcx)
	movq	168(%rax), %rdx
	movq	%rdx, 1320(%rcx)
	movq	176(%rax), %rdx
	movq	%rdx, 1328(%rcx)
	movq	184(%rax), %rdx
	movq	%rdx, 1336(%rcx)
	movq	192(%rax), %rdx
	movq	%rdx, 1344(%rcx)
	movq	200(%rax), %rdx
	movq	%rdx, 1352(%rcx)
	movq	208(%rax), %rdx
	movq	%rdx, 1360(%rcx)
	movq	216(%rax), %rdx
	movq	%rdx, 1368(%rcx)
	movq	224(%rax), %rdx
	movq	%rdx, 1376(%rcx)
	movq	232(%rax), %rdx
	movq	%rdx, 1384(%rcx)
	movq	240(%rax), %rdx
	movq	%rdx, 1392(%rcx)
	movq	248(%rax), %rdx
	movq	%rdx, 1400(%rcx)
	movq	256(%rax), %rdx
	movq	%rdx, 1408(%rcx)
	movq	264(%rax), %rdx
	movq	%rdx, 1416(%rcx)
	movq	272(%rax), %rdx
	movq	%rdx, 1424(%rcx)
	movq	280(%rax), %rdx
	movq	%rdx, 1432(%rcx)
	movq	288(%rax), %rdx
	movq	%rdx, 1440(%rcx)
	movq	296(%rax), %rdx
	movq	%rdx, 1448(%rcx)
	movq	304(%rax), %rdx
	movq	%rdx, 1456(%rcx)
	movq	312(%rax), %rdx
	movq	%rdx, 1464(%rcx)
	movq	320(%rax), %rdx
	movq	%rdx, 1472(%rcx)
	movq	328(%rax), %rdx
	movq	%rdx, 1480(%rcx)
	movq	336(%rax), %rdx
	movq	%rdx, 1488(%rcx)
	movq	344(%rax), %rdx
	movq	%rdx, 1496(%rcx)
	movq	352(%rax), %rdx
	movq	%rdx, 1504(%rcx)
	movq	360(%rax), %rdx
	movq	%rdx, 1512(%rcx)
	movq	368(%rax), %rdx
	movq	%rdx, 1520(%rcx)
	movq	376(%rax), %rdx
	movq	%rdx, 1528(%rcx)
	movq	384(%rax), %rdx
	movq	%rdx, 1536(%rcx)
	movq	392(%rax), %rdx
	movq	%rdx, 1544(%rcx)
	movq	400(%rax), %rdx
	movq	%rdx, 1552(%rcx)
	movq	408(%rax), %rdx
	movq	%rdx, 1560(%rcx)
	movq	416(%rax), %rdx
	movq	%rdx, 1568(%rcx)
	movq	424(%rax), %rdx
	movq	%rdx, 1576(%rcx)
	movq	432(%rax), %rdx
	movq	%rdx, 1584(%rcx)
	movq	440(%rax), %rdx
	movq	%rdx, 1592(%rcx)
	movq	448(%rax), %rdx
	movq	%rdx, 1600(%rcx)
	movq	456(%rax), %rdx
	movq	%rdx, 1608(%rcx)
	movq	464(%rax), %rdx
	movq	%rdx, 1616(%rcx)
	movq	472(%rax), %rdx
	movq	%rdx, 1624(%rcx)
	movq	480(%rax), %rdx
	movq	%rdx, 1632(%rcx)
	movq	488(%rax), %rdx
	movq	%rdx, 1640(%rcx)
	movq	496(%rax), %rdx
	movq	%rdx, 1648(%rcx)
	movq	504(%rax), %rdx
	movq	%rdx, 1656(%rcx)
	movq	512(%rax), %rdx
	movq	%rdx, 1664(%rcx)
	movq	520(%rax), %rdx
	movq	%rdx, 1672(%rcx)
	movq	528(%rax), %rdx
	movq	%rdx, 1680(%rcx)
	movq	536(%rax), %rdx
	movq	%rdx, 1688(%rcx)
	movq	544(%rax), %rdx
	movq	%rdx, 1696(%rcx)
	movq	552(%rax), %rdx
	movq	%rdx, 1704(%rcx)
	movq	560(%rax), %rdx
	movq	%rdx, 1712(%rcx)
	movq	568(%rax), %rdx
	movq	%rdx, 1720(%rcx)
	movq	576(%rax), %rdx
	movq	%rdx, 1728(%rcx)
	movq	584(%rax), %rdx
	movq	%rdx, 1736(%rcx)
	movq	592(%rax), %rdx
	movq	%rdx, 1744(%rcx)
	movq	600(%rax), %rdx
	movq	%rdx, 1752(%rcx)
	movq	608(%rax), %rdx
	movq	%rdx, 1760(%rcx)
	movq	616(%rax), %rdx
	movq	%rdx, 1768(%rcx)
	movq	624(%rax), %rdx
	movq	%rdx, 1776(%rcx)
	movq	632(%rax), %rdx
	movq	%rdx, 1784(%rcx)
	movq	640(%rax), %rdx
	movq	%rdx, 1792(%rcx)
	movq	648(%rax), %rdx
	movq	%rdx, 1800(%rcx)
	movq	656(%rax), %rdx
	movq	%rdx, 1808(%rcx)
	movq	664(%rax), %rdx
	movq	%rdx, 1816(%rcx)
	movq	672(%rax), %rdx
	movq	%rdx, 1824(%rcx)
	movq	680(%rax), %rdx
	movq	%rdx, 1832(%rcx)
	movq	688(%rax), %rdx
	movq	%rdx, 1840(%rcx)
	movq	696(%rax), %rdx
	movq	%rdx, 1848(%rcx)
	movq	704(%rax), %rdx
	movq	%rdx, 1856(%rcx)
	movq	712(%rax), %rdx
	movq	%rdx, 1864(%rcx)
	movq	720(%rax), %rdx
	movq	%rdx, 1872(%rcx)
	movq	728(%rax), %rdx
	movq	%rdx, 1880(%rcx)
	movq	736(%rax), %rdx
	movq	%rdx, 1888(%rcx)
	movq	744(%rax), %rdx
	movq	%rdx, 1896(%rcx)
	movq	752(%rax), %rdx
	movq	%rdx, 1904(%rcx)
	movq	760(%rax), %rdx
	movq	%rdx, 1912(%rcx)
	movq	768(%rax), %rdx
	movq	%rdx, 1920(%rcx)
	movq	776(%rax), %rdx
	movq	%rdx, 1928(%rcx)
	movq	784(%rax), %rdx
	movq	%rdx, 1936(%rcx)
	movq	792(%rax), %rdx
	movq	%rdx, 1944(%rcx)
	movq	800(%rax), %rdx
	movq	%rdx, 1952(%rcx)
	movq	808(%rax), %rdx
	movq	%rdx, 1960(%rcx)
	movq	816(%rax), %rdx
	movq	%rdx, 1968(%rcx)
	movq	824(%rax), %rdx
	movq	%rdx, 1976(%rcx)
	movq	832(%rax), %rdx
	movq	%rdx, 1984(%rcx)
	movq	840(%rax), %rdx
	movq	%rdx, 1992(%rcx)
	movq	848(%rax), %rdx
	movq	%rdx, 2000(%rcx)
	movq	856(%rax), %rdx
	movq	%rdx, 2008(%rcx)
	movq	864(%rax), %rdx
	movq	%rdx, 2016(%rcx)
	movq	872(%rax), %rdx
	movq	%rdx, 2024(%rcx)
	movq	880(%rax), %rdx
	movq	%rdx, 2032(%rcx)
	movq	888(%rax), %rdx
	movq	%rdx, 2040(%rcx)
	movq	896(%rax), %rdx
	movq	%rdx, 2048(%rcx)
	movq	904(%rax), %rdx
	movq	%rdx, 2056(%rcx)
	movq	912(%rax), %rdx
	movq	%rdx, 2064(%rcx)
	movq	920(%rax), %rdx
	movq	%rdx, 2072(%rcx)
	movq	928(%rax), %rdx
	movq	%rdx, 2080(%rcx)
	movq	936(%rax), %rdx
	movq	%rdx, 2088(%rcx)
	movq	944(%rax), %rdx
	movq	%rdx, 2096(%rcx)
	movq	952(%rax), %rdx
	movq	%rdx, 2104(%rcx)
	movq	960(%rax), %rdx
	movq	%rdx, 2112(%rcx)
	movq	968(%rax), %rdx
	movq	%rdx, 2120(%rcx)
	movq	976(%rax), %rdx
	movq	%rdx, 2128(%rcx)
	movq	984(%rax), %rdx
	movq	%rdx, 2136(%rcx)
	movq	992(%rax), %rdx
	movq	%rdx, 2144(%rcx)
	movq	1000(%rax), %rdx
	movq	%rdx, 2152(%rcx)
	movq	1008(%rax), %rdx
	movq	%rdx, 2160(%rcx)
	movq	1016(%rax), %rdx
	movq	%rdx, 2168(%rcx)
	movq	1024(%rax), %rdx
	movq	%rdx, 2176(%rcx)
	movq	1032(%rax), %rdx
	movq	%rdx, 2184(%rcx)
	movq	1040(%rax), %rdx
	movq	%rdx, 2192(%rcx)
	movq	1048(%rax), %rdx
	movq	%rdx, 2200(%rcx)
	movq	1056(%rax), %rdx
	movq	%rdx, 2208(%rcx)
	movq	1064(%rax), %rdx
	movq	%rdx, 2216(%rcx)
	movq	1072(%rax), %rdx
	movq	%rdx, 2224(%rcx)
	movq	1080(%rax), %rdx
	movq	%rdx, 2232(%rcx)
	movq	1088(%rax), %rdx
	movq	%rdx, 2240(%rcx)
	movq	1096(%rax), %rdx
	movq	%rdx, 2248(%rcx)
	movq	1104(%rax), %rdx
	movq	%rdx, 2256(%rcx)
	movq	1112(%rax), %rdx
	movq	%rdx, 2264(%rcx)
	movq	1120(%rax), %rdx
	movq	%rdx, 2272(%rcx)
	movq	1128(%rax), %rdx
	movq	%rdx, 2280(%rcx)
	movq	1136(%rax), %rdx
	movq	%rdx, 2288(%rcx)
	movq	1144(%rax), %rdx
	movq	%rdx, 2296(%rcx)
	movq	1152(%rax), %rdx
	movq	%rdx, 2304(%rcx)
	movq	1160(%rax), %rdx
	movq	%rdx, 2312(%rcx)
	movq	1168(%rax), %rdx
	movq	%rdx, 2320(%rcx)
	movq	1176(%rax), %rdx
	movq	%rdx, 2328(%rcx)
	movq	%rcx, 15592(%rsp)
	movq	%rsp, %rcx
	call	L_sha3_256A_A1184$1
Ljade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand$1:
	movq	15592(%rsp), %rax
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
	movq	8544(%rsp), %rax
	movq	%rax, (%rcx)
	movq	8552(%rsp), %rax
	movq	%rax, 8(%rcx)
	movq	8560(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	8568(%rsp), %rax
	movq	%rax, 24(%rcx)
	movq	8576(%rsp), %rax
	movq	%rax, 32(%rcx)
	movq	8584(%rsp), %rax
	movq	%rax, 40(%rcx)
	movq	8592(%rsp), %rax
	movq	%rax, 48(%rcx)
	movq	8600(%rsp), %rax
	movq	%rax, 56(%rcx)
	movq	8608(%rsp), %rax
	movq	%rax, 64(%rcx)
	movq	8616(%rsp), %rax
	movq	%rax, 72(%rcx)
	movq	8624(%rsp), %rax
	movq	%rax, 80(%rcx)
	movq	8632(%rsp), %rax
	movq	%rax, 88(%rcx)
	movq	8640(%rsp), %rax
	movq	%rax, 96(%rcx)
	movq	8648(%rsp), %rax
	movq	%rax, 104(%rcx)
	movq	8656(%rsp), %rax
	movq	%rax, 112(%rcx)
	movq	8664(%rsp), %rax
	movq	%rax, 120(%rcx)
	movq	8672(%rsp), %rax
	movq	%rax, 128(%rcx)
	movq	8680(%rsp), %rax
	movq	%rax, 136(%rcx)
	movq	8688(%rsp), %rax
	movq	%rax, 144(%rcx)
	movq	8696(%rsp), %rax
	movq	%rax, 152(%rcx)
	movq	8704(%rsp), %rax
	movq	%rax, 160(%rcx)
	movq	8712(%rsp), %rax
	movq	%rax, 168(%rcx)
	movq	8720(%rsp), %rax
	movq	%rax, 176(%rcx)
	movq	8728(%rsp), %rax
	movq	%rax, 184(%rcx)
	movq	8736(%rsp), %rax
	movq	%rax, 192(%rcx)
	movq	8744(%rsp), %rax
	movq	%rax, 200(%rcx)
	movq	8752(%rsp), %rax
	movq	%rax, 208(%rcx)
	movq	8760(%rsp), %rax
	movq	%rax, 216(%rcx)
	movq	8768(%rsp), %rax
	movq	%rax, 224(%rcx)
	movq	8776(%rsp), %rax
	movq	%rax, 232(%rcx)
	movq	8784(%rsp), %rax
	movq	%rax, 240(%rcx)
	movq	8792(%rsp), %rax
	movq	%rax, 248(%rcx)
	movq	8800(%rsp), %rax
	movq	%rax, 256(%rcx)
	movq	8808(%rsp), %rax
	movq	%rax, 264(%rcx)
	movq	8816(%rsp), %rax
	movq	%rax, 272(%rcx)
	movq	8824(%rsp), %rax
	movq	%rax, 280(%rcx)
	movq	8832(%rsp), %rax
	movq	%rax, 288(%rcx)
	movq	8840(%rsp), %rax
	movq	%rax, 296(%rcx)
	movq	8848(%rsp), %rax
	movq	%rax, 304(%rcx)
	movq	8856(%rsp), %rax
	movq	%rax, 312(%rcx)
	movq	8864(%rsp), %rax
	movq	%rax, 320(%rcx)
	movq	8872(%rsp), %rax
	movq	%rax, 328(%rcx)
	movq	8880(%rsp), %rax
	movq	%rax, 336(%rcx)
	movq	8888(%rsp), %rax
	movq	%rax, 344(%rcx)
	movq	8896(%rsp), %rax
	movq	%rax, 352(%rcx)
	movq	8904(%rsp), %rax
	movq	%rax, 360(%rcx)
	movq	8912(%rsp), %rax
	movq	%rax, 368(%rcx)
	movq	8920(%rsp), %rax
	movq	%rax, 376(%rcx)
	movq	8928(%rsp), %rax
	movq	%rax, 384(%rcx)
	movq	8936(%rsp), %rax
	movq	%rax, 392(%rcx)
	movq	8944(%rsp), %rax
	movq	%rax, 400(%rcx)
	movq	8952(%rsp), %rax
	movq	%rax, 408(%rcx)
	movq	8960(%rsp), %rax
	movq	%rax, 416(%rcx)
	movq	8968(%rsp), %rax
	movq	%rax, 424(%rcx)
	movq	8976(%rsp), %rax
	movq	%rax, 432(%rcx)
	movq	8984(%rsp), %rax
	movq	%rax, 440(%rcx)
	movq	8992(%rsp), %rax
	movq	%rax, 448(%rcx)
	movq	9000(%rsp), %rax
	movq	%rax, 456(%rcx)
	movq	9008(%rsp), %rax
	movq	%rax, 464(%rcx)
	movq	9016(%rsp), %rax
	movq	%rax, 472(%rcx)
	movq	9024(%rsp), %rax
	movq	%rax, 480(%rcx)
	movq	9032(%rsp), %rax
	movq	%rax, 488(%rcx)
	movq	9040(%rsp), %rax
	movq	%rax, 496(%rcx)
	movq	9048(%rsp), %rax
	movq	%rax, 504(%rcx)
	movq	9056(%rsp), %rax
	movq	%rax, 512(%rcx)
	movq	9064(%rsp), %rax
	movq	%rax, 520(%rcx)
	movq	9072(%rsp), %rax
	movq	%rax, 528(%rcx)
	movq	9080(%rsp), %rax
	movq	%rax, 536(%rcx)
	movq	9088(%rsp), %rax
	movq	%rax, 544(%rcx)
	movq	9096(%rsp), %rax
	movq	%rax, 552(%rcx)
	movq	9104(%rsp), %rax
	movq	%rax, 560(%rcx)
	movq	9112(%rsp), %rax
	movq	%rax, 568(%rcx)
	movq	9120(%rsp), %rax
	movq	%rax, 576(%rcx)
	movq	9128(%rsp), %rax
	movq	%rax, 584(%rcx)
	movq	9136(%rsp), %rax
	movq	%rax, 592(%rcx)
	movq	9144(%rsp), %rax
	movq	%rax, 600(%rcx)
	movq	9152(%rsp), %rax
	movq	%rax, 608(%rcx)
	movq	9160(%rsp), %rax
	movq	%rax, 616(%rcx)
	movq	9168(%rsp), %rax
	movq	%rax, 624(%rcx)
	movq	9176(%rsp), %rax
	movq	%rax, 632(%rcx)
	movq	9184(%rsp), %rax
	movq	%rax, 640(%rcx)
	movq	9192(%rsp), %rax
	movq	%rax, 648(%rcx)
	movq	9200(%rsp), %rax
	movq	%rax, 656(%rcx)
	movq	9208(%rsp), %rax
	movq	%rax, 664(%rcx)
	movq	9216(%rsp), %rax
	movq	%rax, 672(%rcx)
	movq	9224(%rsp), %rax
	movq	%rax, 680(%rcx)
	movq	9232(%rsp), %rax
	movq	%rax, 688(%rcx)
	movq	9240(%rsp), %rax
	movq	%rax, 696(%rcx)
	movq	9248(%rsp), %rax
	movq	%rax, 704(%rcx)
	movq	9256(%rsp), %rax
	movq	%rax, 712(%rcx)
	movq	9264(%rsp), %rax
	movq	%rax, 720(%rcx)
	movq	9272(%rsp), %rax
	movq	%rax, 728(%rcx)
	movq	9280(%rsp), %rax
	movq	%rax, 736(%rcx)
	movq	9288(%rsp), %rax
	movq	%rax, 744(%rcx)
	movq	9296(%rsp), %rax
	movq	%rax, 752(%rcx)
	movq	9304(%rsp), %rax
	movq	%rax, 760(%rcx)
	movq	9312(%rsp), %rax
	movq	%rax, 768(%rcx)
	movq	9320(%rsp), %rax
	movq	%rax, 776(%rcx)
	movq	9328(%rsp), %rax
	movq	%rax, 784(%rcx)
	movq	9336(%rsp), %rax
	movq	%rax, 792(%rcx)
	movq	9344(%rsp), %rax
	movq	%rax, 800(%rcx)
	movq	9352(%rsp), %rax
	movq	%rax, 808(%rcx)
	movq	9360(%rsp), %rax
	movq	%rax, 816(%rcx)
	movq	9368(%rsp), %rax
	movq	%rax, 824(%rcx)
	movq	9376(%rsp), %rax
	movq	%rax, 832(%rcx)
	movq	9384(%rsp), %rax
	movq	%rax, 840(%rcx)
	movq	9392(%rsp), %rax
	movq	%rax, 848(%rcx)
	movq	9400(%rsp), %rax
	movq	%rax, 856(%rcx)
	movq	9408(%rsp), %rax
	movq	%rax, 864(%rcx)
	movq	9416(%rsp), %rax
	movq	%rax, 872(%rcx)
	movq	9424(%rsp), %rax
	movq	%rax, 880(%rcx)
	movq	9432(%rsp), %rax
	movq	%rax, 888(%rcx)
	movq	9440(%rsp), %rax
	movq	%rax, 896(%rcx)
	movq	9448(%rsp), %rax
	movq	%rax, 904(%rcx)
	movq	9456(%rsp), %rax
	movq	%rax, 912(%rcx)
	movq	9464(%rsp), %rax
	movq	%rax, 920(%rcx)
	movq	9472(%rsp), %rax
	movq	%rax, 928(%rcx)
	movq	9480(%rsp), %rax
	movq	%rax, 936(%rcx)
	movq	9488(%rsp), %rax
	movq	%rax, 944(%rcx)
	movq	9496(%rsp), %rax
	movq	%rax, 952(%rcx)
	movq	9504(%rsp), %rax
	movq	%rax, 960(%rcx)
	movq	9512(%rsp), %rax
	movq	%rax, 968(%rcx)
	movq	9520(%rsp), %rax
	movq	%rax, 976(%rcx)
	movq	9528(%rsp), %rax
	movq	%rax, 984(%rcx)
	movq	9536(%rsp), %rax
	movq	%rax, 992(%rcx)
	movq	9544(%rsp), %rax
	movq	%rax, 1000(%rcx)
	movq	9552(%rsp), %rax
	movq	%rax, 1008(%rcx)
	movq	9560(%rsp), %rax
	movq	%rax, 1016(%rcx)
	movq	9568(%rsp), %rax
	movq	%rax, 1024(%rcx)
	movq	9576(%rsp), %rax
	movq	%rax, 1032(%rcx)
	movq	9584(%rsp), %rax
	movq	%rax, 1040(%rcx)
	movq	9592(%rsp), %rax
	movq	%rax, 1048(%rcx)
	movq	9600(%rsp), %rax
	movq	%rax, 1056(%rcx)
	movq	9608(%rsp), %rax
	movq	%rax, 1064(%rcx)
	movq	9616(%rsp), %rax
	movq	%rax, 1072(%rcx)
	movq	9624(%rsp), %rax
	movq	%rax, 1080(%rcx)
	movq	9632(%rsp), %rax
	movq	%rax, 1088(%rcx)
	movq	9640(%rsp), %rax
	movq	%rax, 1096(%rcx)
	movq	9648(%rsp), %rax
	movq	%rax, 1104(%rcx)
	movq	9656(%rsp), %rax
	movq	%rax, 1112(%rcx)
	movq	9664(%rsp), %rax
	movq	%rax, 1120(%rcx)
	movq	9672(%rsp), %rax
	movq	%rax, 1128(%rcx)
	movq	9680(%rsp), %rax
	movq	%rax, 1136(%rcx)
	movq	9688(%rsp), %rax
	movq	%rax, 1144(%rcx)
	movq	9696(%rsp), %rax
	movq	%rax, 1152(%rcx)
	movq	9704(%rsp), %rax
	movq	%rax, 1160(%rcx)
	movq	9712(%rsp), %rax
	movq	%rax, 1168(%rcx)
	movq	9720(%rsp), %rax
	movq	%rax, 1176(%rcx)
	movq	9728(%rsp), %rax
	movq	%rax, 1184(%rcx)
	movq	9736(%rsp), %rax
	movq	%rax, 1192(%rcx)
	movq	9744(%rsp), %rax
	movq	%rax, 1200(%rcx)
	movq	9752(%rsp), %rax
	movq	%rax, 1208(%rcx)
	movq	9760(%rsp), %rax
	movq	%rax, 1216(%rcx)
	movq	9768(%rsp), %rax
	movq	%rax, 1224(%rcx)
	movq	9776(%rsp), %rax
	movq	%rax, 1232(%rcx)
	movq	9784(%rsp), %rax
	movq	%rax, 1240(%rcx)
	movq	9792(%rsp), %rax
	movq	%rax, 1248(%rcx)
	movq	9800(%rsp), %rax
	movq	%rax, 1256(%rcx)
	movq	9808(%rsp), %rax
	movq	%rax, 1264(%rcx)
	movq	9816(%rsp), %rax
	movq	%rax, 1272(%rcx)
	movq	9824(%rsp), %rax
	movq	%rax, 1280(%rcx)
	movq	9832(%rsp), %rax
	movq	%rax, 1288(%rcx)
	movq	9840(%rsp), %rax
	movq	%rax, 1296(%rcx)
	movq	9848(%rsp), %rax
	movq	%rax, 1304(%rcx)
	movq	9856(%rsp), %rax
	movq	%rax, 1312(%rcx)
	movq	9864(%rsp), %rax
	movq	%rax, 1320(%rcx)
	movq	9872(%rsp), %rax
	movq	%rax, 1328(%rcx)
	movq	9880(%rsp), %rax
	movq	%rax, 1336(%rcx)
	movq	9888(%rsp), %rax
	movq	%rax, 1344(%rcx)
	movq	9896(%rsp), %rax
	movq	%rax, 1352(%rcx)
	movq	9904(%rsp), %rax
	movq	%rax, 1360(%rcx)
	movq	9912(%rsp), %rax
	movq	%rax, 1368(%rcx)
	movq	9920(%rsp), %rax
	movq	%rax, 1376(%rcx)
	movq	9928(%rsp), %rax
	movq	%rax, 1384(%rcx)
	movq	9936(%rsp), %rax
	movq	%rax, 1392(%rcx)
	movq	9944(%rsp), %rax
	movq	%rax, 1400(%rcx)
	movq	9952(%rsp), %rax
	movq	%rax, 1408(%rcx)
	movq	9960(%rsp), %rax
	movq	%rax, 1416(%rcx)
	movq	9968(%rsp), %rax
	movq	%rax, 1424(%rcx)
	movq	9976(%rsp), %rax
	movq	%rax, 1432(%rcx)
	movq	9984(%rsp), %rax
	movq	%rax, 1440(%rcx)
	movq	9992(%rsp), %rax
	movq	%rax, 1448(%rcx)
	movq	10000(%rsp), %rax
	movq	%rax, 1456(%rcx)
	movq	10008(%rsp), %rax
	movq	%rax, 1464(%rcx)
	movq	10016(%rsp), %rax
	movq	%rax, 1472(%rcx)
	movq	10024(%rsp), %rax
	movq	%rax, 1480(%rcx)
	movq	10032(%rsp), %rax
	movq	%rax, 1488(%rcx)
	movq	10040(%rsp), %rax
	movq	%rax, 1496(%rcx)
	movq	10048(%rsp), %rax
	movq	%rax, 1504(%rcx)
	movq	10056(%rsp), %rax
	movq	%rax, 1512(%rcx)
	movq	10064(%rsp), %rax
	movq	%rax, 1520(%rcx)
	movq	10072(%rsp), %rax
	movq	%rax, 1528(%rcx)
	movq	10080(%rsp), %rax
	movq	%rax, 1536(%rcx)
	movq	10088(%rsp), %rax
	movq	%rax, 1544(%rcx)
	movq	10096(%rsp), %rax
	movq	%rax, 1552(%rcx)
	movq	10104(%rsp), %rax
	movq	%rax, 1560(%rcx)
	movq	10112(%rsp), %rax
	movq	%rax, 1568(%rcx)
	movq	10120(%rsp), %rax
	movq	%rax, 1576(%rcx)
	movq	10128(%rsp), %rax
	movq	%rax, 1584(%rcx)
	movq	10136(%rsp), %rax
	movq	%rax, 1592(%rcx)
	movq	10144(%rsp), %rax
	movq	%rax, 1600(%rcx)
	movq	10152(%rsp), %rax
	movq	%rax, 1608(%rcx)
	movq	10160(%rsp), %rax
	movq	%rax, 1616(%rcx)
	movq	10168(%rsp), %rax
	movq	%rax, 1624(%rcx)
	movq	10176(%rsp), %rax
	movq	%rax, 1632(%rcx)
	movq	10184(%rsp), %rax
	movq	%rax, 1640(%rcx)
	movq	10192(%rsp), %rax
	movq	%rax, 1648(%rcx)
	movq	10200(%rsp), %rax
	movq	%rax, 1656(%rcx)
	movq	10208(%rsp), %rax
	movq	%rax, 1664(%rcx)
	movq	10216(%rsp), %rax
	movq	%rax, 1672(%rcx)
	movq	10224(%rsp), %rax
	movq	%rax, 1680(%rcx)
	movq	10232(%rsp), %rax
	movq	%rax, 1688(%rcx)
	movq	10240(%rsp), %rax
	movq	%rax, 1696(%rcx)
	movq	10248(%rsp), %rax
	movq	%rax, 1704(%rcx)
	movq	10256(%rsp), %rax
	movq	%rax, 1712(%rcx)
	movq	10264(%rsp), %rax
	movq	%rax, 1720(%rcx)
	movq	10272(%rsp), %rax
	movq	%rax, 1728(%rcx)
	movq	10280(%rsp), %rax
	movq	%rax, 1736(%rcx)
	movq	10288(%rsp), %rax
	movq	%rax, 1744(%rcx)
	movq	10296(%rsp), %rax
	movq	%rax, 1752(%rcx)
	movq	10304(%rsp), %rax
	movq	%rax, 1760(%rcx)
	movq	10312(%rsp), %rax
	movq	%rax, 1768(%rcx)
	movq	10320(%rsp), %rax
	movq	%rax, 1776(%rcx)
	movq	10328(%rsp), %rax
	movq	%rax, 1784(%rcx)
	movq	10336(%rsp), %rax
	movq	%rax, 1792(%rcx)
	movq	10344(%rsp), %rax
	movq	%rax, 1800(%rcx)
	movq	10352(%rsp), %rax
	movq	%rax, 1808(%rcx)
	movq	10360(%rsp), %rax
	movq	%rax, 1816(%rcx)
	movq	10368(%rsp), %rax
	movq	%rax, 1824(%rcx)
	movq	10376(%rsp), %rax
	movq	%rax, 1832(%rcx)
	movq	10384(%rsp), %rax
	movq	%rax, 1840(%rcx)
	movq	10392(%rsp), %rax
	movq	%rax, 1848(%rcx)
	movq	10400(%rsp), %rax
	movq	%rax, 1856(%rcx)
	movq	10408(%rsp), %rax
	movq	%rax, 1864(%rcx)
	movq	10416(%rsp), %rax
	movq	%rax, 1872(%rcx)
	movq	10424(%rsp), %rax
	movq	%rax, 1880(%rcx)
	movq	10432(%rsp), %rax
	movq	%rax, 1888(%rcx)
	movq	10440(%rsp), %rax
	movq	%rax, 1896(%rcx)
	movq	10448(%rsp), %rax
	movq	%rax, 1904(%rcx)
	movq	10456(%rsp), %rax
	movq	%rax, 1912(%rcx)
	movq	10464(%rsp), %rax
	movq	%rax, 1920(%rcx)
	movq	10472(%rsp), %rax
	movq	%rax, 1928(%rcx)
	movq	10480(%rsp), %rax
	movq	%rax, 1936(%rcx)
	movq	10488(%rsp), %rax
	movq	%rax, 1944(%rcx)
	movq	10496(%rsp), %rax
	movq	%rax, 1952(%rcx)
	movq	10504(%rsp), %rax
	movq	%rax, 1960(%rcx)
	movq	10512(%rsp), %rax
	movq	%rax, 1968(%rcx)
	movq	10520(%rsp), %rax
	movq	%rax, 1976(%rcx)
	movq	10528(%rsp), %rax
	movq	%rax, 1984(%rcx)
	movq	10536(%rsp), %rax
	movq	%rax, 1992(%rcx)
	movq	10544(%rsp), %rax
	movq	%rax, 2000(%rcx)
	movq	10552(%rsp), %rax
	movq	%rax, 2008(%rcx)
	movq	10560(%rsp), %rax
	movq	%rax, 2016(%rcx)
	movq	10568(%rsp), %rax
	movq	%rax, 2024(%rcx)
	movq	10576(%rsp), %rax
	movq	%rax, 2032(%rcx)
	movq	10584(%rsp), %rax
	movq	%rax, 2040(%rcx)
	movq	10592(%rsp), %rax
	movq	%rax, 2048(%rcx)
	movq	10600(%rsp), %rax
	movq	%rax, 2056(%rcx)
	movq	10608(%rsp), %rax
	movq	%rax, 2064(%rcx)
	movq	10616(%rsp), %rax
	movq	%rax, 2072(%rcx)
	movq	10624(%rsp), %rax
	movq	%rax, 2080(%rcx)
	movq	10632(%rsp), %rax
	movq	%rax, 2088(%rcx)
	movq	10640(%rsp), %rax
	movq	%rax, 2096(%rcx)
	movq	10648(%rsp), %rax
	movq	%rax, 2104(%rcx)
	movq	10656(%rsp), %rax
	movq	%rax, 2112(%rcx)
	movq	10664(%rsp), %rax
	movq	%rax, 2120(%rcx)
	movq	10672(%rsp), %rax
	movq	%rax, 2128(%rcx)
	movq	10680(%rsp), %rax
	movq	%rax, 2136(%rcx)
	movq	10688(%rsp), %rax
	movq	%rax, 2144(%rcx)
	movq	10696(%rsp), %rax
	movq	%rax, 2152(%rcx)
	movq	10704(%rsp), %rax
	movq	%rax, 2160(%rcx)
	movq	10712(%rsp), %rax
	movq	%rax, 2168(%rcx)
	movq	10720(%rsp), %rax
	movq	%rax, 2176(%rcx)
	movq	10728(%rsp), %rax
	movq	%rax, 2184(%rcx)
	movq	10736(%rsp), %rax
	movq	%rax, 2192(%rcx)
	movq	10744(%rsp), %rax
	movq	%rax, 2200(%rcx)
	movq	10752(%rsp), %rax
	movq	%rax, 2208(%rcx)
	movq	10760(%rsp), %rax
	movq	%rax, 2216(%rcx)
	movq	10768(%rsp), %rax
	movq	%rax, 2224(%rcx)
	movq	10776(%rsp), %rax
	movq	%rax, 2232(%rcx)
	movq	10784(%rsp), %rax
	movq	%rax, 2240(%rcx)
	movq	10792(%rsp), %rax
	movq	%rax, 2248(%rcx)
	movq	10800(%rsp), %rax
	movq	%rax, 2256(%rcx)
	movq	10808(%rsp), %rax
	movq	%rax, 2264(%rcx)
	movq	10816(%rsp), %rax
	movq	%rax, 2272(%rcx)
	movq	10824(%rsp), %rax
	movq	%rax, 2280(%rcx)
	movq	10832(%rsp), %rax
	movq	%rax, 2288(%rcx)
	movq	10840(%rsp), %rax
	movq	%rax, 2296(%rcx)
	movq	10848(%rsp), %rax
	movq	%rax, 2304(%rcx)
	movq	10856(%rsp), %rax
	movq	%rax, 2312(%rcx)
	movq	10864(%rsp), %rax
	movq	%rax, 2320(%rcx)
	movq	10872(%rsp), %rax
	movq	%rax, 2328(%rcx)
	movq	10880(%rsp), %rax
	movq	%rax, 2336(%rcx)
	movq	10888(%rsp), %rax
	movq	%rax, 2344(%rcx)
	movq	10896(%rsp), %rax
	movq	%rax, 2352(%rcx)
	movq	10904(%rsp), %rax
	movq	%rax, 2360(%rcx)
	movq	10912(%rsp), %rax
	movq	%rax, 2368(%rcx)
	movq	10920(%rsp), %rax
	movq	%rax, 2376(%rcx)
	movq	10928(%rsp), %rax
	movq	%rax, 2384(%rcx)
	movq	10936(%rsp), %rax
	movq	%rax, 2392(%rcx)
	xorq	%rax, %rax
	movq	15704(%rsp), %rbx
	movq	15712(%rsp), %rbp
	movq	15720(%rsp), %r12
	movq	15728(%rsp), %r13
	movq	15736(%rsp), %r14
	movq	15744(%rsp), %r15
	movq	15752(%rsp), %rsp
	ret
__gen_matrix_avx2:
_gen_matrix_avx2:
	movq	%rsp, %rax
	leaq	-2208(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 2152(%rsp)
	movq	%rbp, 2160(%rsp)
	movq	%r12, 2168(%rsp)
	movq	%r13, 2176(%rsp)
	movq	%r14, 2184(%rsp)
	movq	%r15, 2192(%rsp)
	movq	%rax, 2200(%rsp)
	movq	%rdx, %mm1
	movq	%rsp, %r15
	movq	$0, %rdx
	movq	%rdi, %r14
	movq	%mm1, %rax
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$14:
	leaq	856(%rsp), %rsp
	movq	$8, %rdx
	leaq	2048(%rdi), %r14
	movq	%mm1, %rax
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$13:
	leaq	856(%rsp), %rsp
	leaq	4096(%rdi), %rcx
	movw	$514, %ax
	movq	%r15, %r13
	movw	%ax, 2144(%rsp)
	leaq	2144(%rsp), %rax
	leaq	-248(%rsp), %rsp
	call	L_shake128_absorb_A32_A2$1
L_gen_matrix_avx2$12:
	leaq	248(%rsp), %rsp
	call	L_shake128_squeeze3blocks$1
L_gen_matrix_avx2$11:
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_avx2$10:
	movq	%rdi, %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$9:
	leaq	512(%rdi), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$8:
	leaq	1024(%rdi), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$7:
	leaq	1536(%rdi), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$6:
	leaq	2048(%rdi), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$5:
	leaq	2560(%rdi), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$4:
	leaq	3072(%rdi), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$3:
	leaq	3584(%rdi), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$2:
	leaq	4096(%rdi), %rax
	call	L_nttunpack$1
L_gen_matrix_avx2$1:
	movq	2152(%rsp), %rbx
	movq	2160(%rsp), %rbp
	movq	2168(%rsp), %r12
	movq	2176(%rsp), %r13
	movq	2184(%rsp), %r14
	movq	2192(%rsp), %r15
	movq	2200(%rsp), %rsp
	ret
L_gen_matrix_sample_four_polynomials$1:
	leaq	glob_data + 2656(%rip), %rcx
	shlq	$4, %rax
	addq	%rax, %rdx
	movq	(%rcx,%rdx), %rax
	movq	%rax, 832(%rsp)
	leaq	32(%rsp), %rax
	leaq	832(%rsp), %r8
	call	L_shake128x4_absorb_A32_A2$1
L_gen_matrix_sample_four_polynomials$7:
	leaq	-24(%rsp), %rsp
	call	L_shake128x4_squeeze3blocks$1
L_gen_matrix_sample_four_polynomials$6:
	leaq	24(%rsp), %rsp
	movq	%r14, %rcx
	movq	%r15, %r13
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$5:
	leaq	512(%r14), %rcx
	leaq	536(%r15), %r13
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$4:
	leaq	1024(%r14), %rcx
	leaq	1072(%r15), %r13
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$3:
	leaq	1536(%r14), %rcx
	leaq	1608(%r15), %r13
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$2:
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
	call	L_shake128_next_state$1
L__gen_matrix_fill_polynomial$5:
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
	vmovdqu	glob_data + 32(%rip), %ymm1
	vmovdqu	glob_data + 0(%rip), %ymm2
	vmovdqu	glob_data + 64(%rip), %ymm3
	leaq	glob_data + 2688(%rip), %r8
	movq	%rax, %r11
	jmp 	L_gen_matrix_buf_rejection$20
L_gen_matrix_buf_rejection$21:
	movq	$-1, %rbx
	cmove	%rbx, %rdx
	movq	%r11, 8(%rsp)
	vpermq	$148, (%r13,%r11), %ymm4
	vpermq	$148, 24(%r13,%r11), %ymm5
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
	vpmovmskb	%ymm6, %r11
	orq 	%rdx, %r11
	movq	%r11, %rbx
	andq	$255, %rbx
	vmovq	(%r8,%rbx,8), %xmm6
	popcnt	%rbx, %rbx
	addq	%r9, %rbx
	movq	%r11, %rbp
	shrq	$16, %rbp
	andq	$255, %rbp
	vmovq	(%r8,%rbp,8), %xmm7
	popcnt	%rbp, %rbp
	addq	%rbx, %rbp
	movq	%r11, %r12
	shrq	$8, %r12
	andq	$255, %r12
	vmovq	(%r8,%r12,8), %xmm8
	popcnt	%r12, %r12
	addq	%rbp, %r12
	shrq	$24, %r11
	andq	$255, %r11
	vmovq	(%r8,%r11,8), %xmm9
	popcnt	%r11, %r11
	addq	%r12, %r11
	vinserti128	$1, %xmm7, %ymm6, %ymm6
	vinserti128	$1, %xmm9, %ymm8, %ymm7
	vpaddb	%ymm3, %ymm6, %ymm8
	vpunpcklbw	%ymm8, %ymm6, %ymm6
	vpaddb	%ymm3, %ymm7, %ymm8
	vpunpcklbw	%ymm8, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm4, %ymm4
	vpshufb	%ymm7, %ymm5, %ymm5
	vmovdqu	%xmm4, (%rcx,%r9,2)
	vextracti128	$1, %ymm4, (%rcx,%rbx,2)
	vmovdqu	%xmm5, (%rcx,%rbp,2)
	vextracti128	$1, %ymm5, (%rcx,%r12,2)
	movq	%r11, %r9
	movq	8(%rsp), %r11
	addq	$48, %r11
L_gen_matrix_buf_rejection$20:
	cmpq	$457, %r11
	setb	%bl
	cmpq	$225, %r9
	setb	%bpl
	testb	%bpl, %bl
	jne 	L_gen_matrix_buf_rejection$21
	movq	$-1, %rbx
	cmovne	%rbx, %rdx
	jmp 	L_gen_matrix_buf_rejection$2
L_gen_matrix_buf_rejection$3:
	movq	$-1, %rbx
	cmove	%rbx, %rdx
	movq	%r11, 8(%rsp)
	vpermq	$148, (%r13,%r11), %ymm4
	vpshufb	%ymm0, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpblendw	$170, %ymm5, %ymm4, %ymm4
	vpand	%ymm1, %ymm4, %ymm4
	vpcmpgtw	%ymm4, %ymm2, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	vpacksswb	%ymm6, %ymm5, %ymm5
	vpmovmskb	%ymm5, %rbx
	orq 	%rdx, %rbx
	movq	%rbx, %r11
	andq	$255, %r11
	vmovq	(%r8,%r11,8), %xmm5
	popcnt	%r11, %r11
	addq	%r9, %r11
	shrq	$16, %rbx
	andq	$255, %rbx
	vmovq	(%r8,%rbx,8), %xmm6
	popcnt	%rbx, %rbx
	addq	%r11, %rbx
	vinserti128	$1, %xmm6, %ymm5, %ymm5
	vpaddb	%ymm3, %ymm5, %ymm6
	vpunpcklbw	%ymm6, %ymm5, %ymm5
	vpshufb	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm4, %xmm5
	cmpq	$248, %r9
	jbe 	L_gen_matrix_buf_rejection$12
	movq	$-1, %rbp
	cmovbe	%rbp, %rdx
	movq	%xmm5, %rbp
	cmpq	$252, %r9
	jbe 	L_gen_matrix_buf_rejection$18
	movq	$-1, %r12
	cmovbe	%r12, %rdx
	jmp 	L_gen_matrix_buf_rejection$19
L_gen_matrix_buf_rejection$18:
	movq	$-1, %r12
	cmovnbe	%r12, %rdx
	movq	%rbp, (%rcx,%r9,2)
	vpextrq	$1, %xmm5, %rbp
	addq	$4, %r9
L_gen_matrix_buf_rejection$19:
	cmpq	$254, %r9
	jbe 	L_gen_matrix_buf_rejection$16
	movq	$-1, %r12
	cmovbe	%r12, %rdx
	jmp 	L_gen_matrix_buf_rejection$17
L_gen_matrix_buf_rejection$16:
	movq	$-1, %r12
	cmovnbe	%r12, %rdx
	movl	%ebp, (%rcx,%r9,2)
	shrq	$32, %rbp
	addq	$2, %r9
L_gen_matrix_buf_rejection$17:
	cmpq	$255, %r9
	jbe 	L_gen_matrix_buf_rejection$14
	movq	$-1, %r9
	cmovbe	%r9, %rdx
	jmp 	L_gen_matrix_buf_rejection$13
L_gen_matrix_buf_rejection$14:
	movq	$-1, %r12
	cmovnbe	%r12, %rdx
	movw	%bp, (%rcx,%r9,2)
L_gen_matrix_buf_rejection$15:
	jmp 	L_gen_matrix_buf_rejection$13
L_gen_matrix_buf_rejection$12:
	movq	$-1, %rbp
	cmovnbe	%rbp, %rdx
	vmovdqu	%xmm5, (%rcx,%r9,2)
L_gen_matrix_buf_rejection$13:
	vextracti128	$1, %ymm4, %xmm4
	cmpq	$248, %r11
	jbe 	L_gen_matrix_buf_rejection$4
	movq	$-1, %r9
	cmovbe	%r9, %rdx
	movq	%xmm4, %r9
	cmpq	$252, %r11
	jbe 	L_gen_matrix_buf_rejection$10
	movq	$-1, %rbp
	cmovbe	%rbp, %rdx
	jmp 	L_gen_matrix_buf_rejection$11
L_gen_matrix_buf_rejection$10:
	movq	$-1, %rbp
	cmovnbe	%rbp, %rdx
	movq	%r9, (%rcx,%r11,2)
	vpextrq	$1, %xmm4, %r9
	addq	$4, %r11
L_gen_matrix_buf_rejection$11:
	cmpq	$254, %r11
	jbe 	L_gen_matrix_buf_rejection$8
	movq	$-1, %rbp
	cmovbe	%rbp, %rdx
	jmp 	L_gen_matrix_buf_rejection$9
L_gen_matrix_buf_rejection$8:
	movq	$-1, %rbp
	cmovnbe	%rbp, %rdx
	movl	%r9d, (%rcx,%r11,2)
	shrq	$32, %r9
	addq	$2, %r11
L_gen_matrix_buf_rejection$9:
	cmpq	$255, %r11
	jbe 	L_gen_matrix_buf_rejection$6
	movq	$-1, %r9
	cmovbe	%r9, %rdx
	jmp 	L_gen_matrix_buf_rejection$5
L_gen_matrix_buf_rejection$6:
	movq	$-1, %rbp
	cmovnbe	%rbp, %rdx
	movw	%r9w, (%rcx,%r11,2)
L_gen_matrix_buf_rejection$7:
	jmp 	L_gen_matrix_buf_rejection$5
L_gen_matrix_buf_rejection$4:
	movq	$-1, %r9
	cmovnbe	%r9, %rdx
	vmovdqu	%xmm4, (%rcx,%r11,2)
L_gen_matrix_buf_rejection$5:
	movq	%rbx, %r9
	movq	8(%rsp), %r11
	addq	$24, %r11
L_gen_matrix_buf_rejection$2:
	cmpq	$481, %r11
	setb	%bl
	cmpq	$256, %r9
	setb	%bpl
	testb	%bpl, %bl
	jne 	L_gen_matrix_buf_rejection$3
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
	leaq	glob_data + 800(%rip), %rdx
	vmovdqu	(%rdx), %ymm0
	vbroadcasti128	glob_data + 2640(%rip), %ymm1
	vbroadcasti128	glob_data + 2624(%rip), %ymm2
	vmovdqu	(%rsi), %ymm3
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
	vmovdqu	%ymm7, (%rax)
	vmovdqu	%ymm8, 32(%rax)
	vmovdqu	%ymm6, 256(%rax)
	vmovdqu	%ymm4, 288(%rax)
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
	vmovdqu	%ymm7, 64(%rax)
	vmovdqu	%ymm8, 96(%rax)
	vmovdqu	%ymm6, 320(%rax)
	vmovdqu	%ymm4, 352(%rax)
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
	vmovdqu	%ymm7, 128(%rax)
	vmovdqu	%ymm8, 160(%rax)
	vmovdqu	%ymm6, 384(%rax)
	vmovdqu	%ymm4, 416(%rax)
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
	vmovdqu	%ymm4, 192(%rax)
	vmovdqu	%ymm3, 224(%rax)
	vmovdqu	%ymm1, 448(%rax)
	vmovdqu	%ymm0, 480(%rax)
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
	vmovdqu	%ymm3, (%rdx)
	vmovdqu	%ymm6, 32(%rdx)
	vmovdqu	%ymm4, 64(%rdx)
	vmovdqu	%ymm7, 96(%rdx)
	vmovdqu	%ymm1, 128(%rdx)
	vmovdqu	%ymm8, 160(%rdx)
	vmovdqu	%ymm5, 192(%rdx)
	vmovdqu	%ymm2, 224(%rdx)
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
	vmovdqu	%ymm3, 256(%rdx)
	vmovdqu	%ymm6, 288(%rdx)
	vmovdqu	%ymm4, 320(%rdx)
	vmovdqu	%ymm7, 352(%rdx)
	vmovdqu	%ymm1, 384(%rdx)
	vmovdqu	%ymm8, 416(%rdx)
	vmovdqu	%ymm5, 448(%rdx)
	vmovdqu	%ymm0, 480(%rdx)
	ret
L_shake256_A32__A1120$1:
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rsi
	movq	$0, %rdi
	jmp 	L_shake256_A32__A1120$3
L_shake256_A32__A1120$4:
	movq	(%rcx,%rsi), %rdx
	movq	%rdx, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	vmovdqu	8(%rcx,%rsi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rcx,%rsi), %rdx
	movq	%rdx, %xmm9
	vmovdqu	48(%rcx,%rsi), %ymm7
	movq	80(%rcx,%rsi), %rdx
	movq	%rdx, %xmm10
	vmovdqu	88(%rcx,%rsi), %ymm8
	movq	120(%rcx,%rsi), %rdx
	vpinsrq	$1, %rdx, %xmm9, %xmm11
	vpxor	%xmm9, %xmm9, %xmm9
	vmovq	128(%rcx,%rsi), %xmm12
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm12, %xmm12
	vinserti128	$1, %xmm9, %ymm12, %ymm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm10, %xmm10
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
L_shake256_A32__A1120$5:
	incq	%rdi
L_shake256_A32__A1120$3:
	cmpq	$8, %rdi
	jb  	L_shake256_A32__A1120$4
	movq	(%rcx,%rsi), %rdx
	movq	%rdx, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	vmovdqu	8(%rcx,%rsi), %xmm7
	vmovq	24(%rcx,%rsi), %xmm8
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
	movq	(%rax,%rsi), %rdx
	movq	%rdx, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	vmovdqu	8(%rax,%rsi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rax,%rsi), %rdx
	movq	%rdx, %xmm9
	vmovdqu	48(%rax,%rsi), %ymm7
	movq	80(%rax,%rsi), %rdx
	movq	%rdx, %xmm10
	vmovdqu	88(%rax,%rsi), %ymm8
	movq	120(%rax,%rsi), %rdx
	vpinsrq	$1, %rdx, %xmm9, %xmm11
	vpxor	%xmm9, %xmm9, %xmm9
	vmovq	128(%rax,%rsi), %xmm12
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm12, %xmm12
	vinserti128	$1, %xmm9, %ymm12, %ymm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm10, %xmm10
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
	movq	(%rax,%rsi), %rdx
	movq	%rdx, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	vmovdqu	8(%rax,%rsi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rax,%rsi), %rdx
	movq	%rdx, %xmm9
	vmovdqu	48(%rax,%rsi), %ymm7
	movq	80(%rax,%rsi), %rdx
	movq	%rdx, %xmm10
	vpxor	%xmm8, %xmm8, %xmm8
	vmovq	88(%rax,%rsi), %xmm11
	movq	$6, %rax
	vpinsrq	$1, %rax, %xmm11, %xmm11
	vinserti128	$1, %xmm8, %ymm11, %ymm8
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm9, %xmm11
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rax
	vpinsrq	$1, %rax, %xmm10, %xmm10
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
	movq	$1, %rax
	shlq	$63, %rax
	movq	%rax, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	$0, %rax
	call	L_keccakf1600_avx2$1
L_sha3_256A_A1184$2:
	movq	%xmm4, (%rcx,%rax)
	vpunpckhqdq	%xmm4, %xmm4, %xmm0
	vmovdqu	%xmm5, %xmm0
	vmovdqu	%xmm0, 8(%rcx,%rax)
	vextracti128	$1, %ymm5, %xmm0
	movq	%xmm0, 24(%rcx,%rax)
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
	leaq	glob_data + 1824(%rip), %rdx
	vmovdqu	glob_data + 992(%rip), %ymm0
	vpbroadcastd	(%rdx), %ymm1
	vpbroadcastd	4(%rdx), %ymm2
	vmovdqu	(%rax), %ymm3
	vmovdqu	32(%rax), %ymm14
	vmovdqu	64(%rax), %ymm4
	vmovdqu	96(%rax), %ymm5
	vmovdqu	256(%rax), %ymm6
	vmovdqu	288(%rax), %ymm7
	vmovdqu	320(%rax), %ymm12
	vmovdqu	352(%rax), %ymm8
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
	vmovdqu	%ymm3, (%rax)
	vmovdqu	%ymm10, 32(%rax)
	vmovdqu	%ymm4, 64(%rax)
	vmovdqu	%ymm5, 96(%rax)
	vmovdqu	%ymm7, 256(%rax)
	vmovdqu	%ymm9, 288(%rax)
	vmovdqu	%ymm8, 320(%rax)
	vmovdqu	%ymm6, 352(%rax)
	vmovdqu	128(%rax), %ymm3
	vmovdqu	160(%rax), %ymm12
	vmovdqu	192(%rax), %ymm4
	vmovdqu	224(%rax), %ymm5
	vmovdqu	384(%rax), %ymm6
	vmovdqu	416(%rax), %ymm7
	vmovdqu	448(%rax), %ymm10
	vmovdqu	480(%rax), %ymm11
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
	vmovdqu	%ymm7, 384(%rax)
	vmovdqu	%ymm3, 416(%rax)
	vmovdqu	%ymm5, 448(%rax)
	vmovdqu	%ymm4, 480(%rax)
	vpbroadcastd	8(%rdx), %ymm1
	vpbroadcastd	12(%rdx), %ymm4
	vmovdqu	%ymm8, %ymm10
	vmovdqu	%ymm9, %ymm3
	vmovdqu	(%rax), %ymm6
	vmovdqu	32(%rax), %ymm5
	vmovdqu	64(%rax), %ymm9
	vmovdqu	96(%rax), %ymm7
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
	vmovdqu	16(%rdx), %ymm3
	vmovdqu	48(%rdx), %ymm6
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
	vmovdqu	80(%rdx), %ymm1
	vmovdqu	112(%rdx), %ymm10
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
	vmovdqu	144(%rdx), %ymm3
	vmovdqu	176(%rdx), %ymm5
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
	vmovdqu	208(%rdx), %ymm5
	vmovdqu	240(%rdx), %ymm6
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
	vmovdqu	272(%rdx), %ymm9
	vmovdqu	304(%rdx), %ymm13
	vmovdqu	336(%rdx), %ymm11
	vmovdqu	368(%rdx), %ymm6
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
	vmovdqu	%ymm3, (%rax)
	vmovdqu	%ymm4, 32(%rax)
	vmovdqu	%ymm2, 64(%rax)
	vmovdqu	%ymm6, 96(%rax)
	vmovdqu	%ymm8, 128(%rax)
	vmovdqu	%ymm5, 160(%rax)
	vmovdqu	%ymm7, 192(%rax)
	vmovdqu	%ymm1, 224(%rax)
	vpbroadcastd	400(%rdx), %ymm5
	vpbroadcastd	404(%rdx), %ymm8
	vmovdqu	384(%rax), %ymm1
	vmovdqu	416(%rax), %ymm2
	vmovdqu	448(%rax), %ymm10
	vmovdqu	480(%rax), %ymm9
	vmovdqu	256(%rax), %ymm3
	vmovdqu	288(%rax), %ymm7
	vmovdqu	320(%rax), %ymm6
	vmovdqu	352(%rax), %ymm4
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
	vmovdqu	408(%rdx), %ymm3
	vmovdqu	440(%rdx), %ymm4
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
	vmovdqu	472(%rdx), %ymm1
	vmovdqu	504(%rdx), %ymm10
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
	vmovdqu	536(%rdx), %ymm3
	vmovdqu	568(%rdx), %ymm5
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
	vmovdqu	600(%rdx), %ymm5
	vmovdqu	632(%rdx), %ymm6
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
	vmovdqu	664(%rdx), %ymm9
	vmovdqu	696(%rdx), %ymm13
	vmovdqu	728(%rdx), %ymm11
	vmovdqu	760(%rdx), %ymm6
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
	vmovdqu	%ymm3, 256(%rax)
	vmovdqu	%ymm4, 288(%rax)
	vmovdqu	%ymm2, 320(%rax)
	vmovdqu	%ymm6, 352(%rax)
	vmovdqu	%ymm8, 384(%rax)
	vmovdqu	%ymm5, 416(%rax)
	vmovdqu	%ymm7, 448(%rax)
	vmovdqu	%ymm0, 480(%rax)
	ret
L_poly_invntt$1:
	leaq	glob_data + 1024(%rip), %rdx
	vmovdqu	glob_data + 992(%rip), %ymm0
	vmovdqu	(%rdx), %ymm12
	vmovdqu	64(%rdx), %ymm1
	vmovdqu	32(%rdx), %ymm2
	vmovdqu	96(%rdx), %ymm5
	vmovdqu	(%rax), %ymm3
	vmovdqu	32(%rax), %ymm4
	vmovdqu	64(%rax), %ymm15
	vmovdqu	96(%rax), %ymm11
	vmovdqu	128(%rax), %ymm7
	vmovdqu	160(%rax), %ymm8
	vmovdqu	192(%rax), %ymm13
	vmovdqu	224(%rax), %ymm14
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
	vmovdqu	128(%rdx), %ymm2
	vmovdqu	160(%rdx), %ymm5
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
	vmovdqu	192(%rdx), %ymm2
	vmovdqu	224(%rdx), %ymm5
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
	vmovdqu	256(%rdx), %ymm4
	vmovdqu	288(%rdx), %ymm5
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
	vmovdqu	320(%rdx), %ymm4
	vmovdqu	352(%rdx), %ymm11
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
	vpbroadcastd	384(%rdx), %ymm7
	vpbroadcastd	388(%rdx), %ymm11
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
	vmovdqu	%ymm1, (%rax)
	vmovdqu	%ymm3, 32(%rax)
	vmovdqu	%ymm6, 64(%rax)
	vmovdqu	%ymm4, 96(%rax)
	vmovdqu	%ymm5, 128(%rax)
	vmovdqu	%ymm8, 160(%rax)
	vmovdqu	%ymm9, 192(%rax)
	vmovdqu	%ymm7, 224(%rax)
	vmovdqu	392(%rdx), %ymm12
	vmovdqu	456(%rdx), %ymm1
	vmovdqu	424(%rdx), %ymm2
	vmovdqu	488(%rdx), %ymm5
	vmovdqu	256(%rax), %ymm3
	vmovdqu	288(%rax), %ymm4
	vmovdqu	320(%rax), %ymm15
	vmovdqu	352(%rax), %ymm11
	vmovdqu	384(%rax), %ymm7
	vmovdqu	416(%rax), %ymm8
	vmovdqu	448(%rax), %ymm13
	vmovdqu	480(%rax), %ymm14
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
	vmovdqu	520(%rdx), %ymm2
	vmovdqu	552(%rdx), %ymm5
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
	vmovdqu	584(%rdx), %ymm2
	vmovdqu	616(%rdx), %ymm5
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
	vmovdqu	648(%rdx), %ymm4
	vmovdqu	680(%rdx), %ymm5
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
	vmovdqu	712(%rdx), %ymm4
	vmovdqu	744(%rdx), %ymm11
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
	vpbroadcastd	776(%rdx), %ymm7
	vpbroadcastd	780(%rdx), %ymm11
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
	vmovdqu	%ymm5, 384(%rax)
	vmovdqu	%ymm8, 416(%rax)
	vmovdqu	%ymm9, 448(%rax)
	vmovdqu	%ymm7, 480(%rax)
	vpbroadcastd	784(%rdx), %ymm1
	vpbroadcastd	788(%rdx), %ymm2
	vmovdqu	%ymm4, %ymm7
	vmovdqu	%ymm3, %ymm4
	vmovdqu	%ymm10, %ymm3
	vmovdqu	(%rax), %ymm9
	vmovdqu	32(%rax), %ymm13
	vmovdqu	64(%rax), %ymm5
	vmovdqu	96(%rax), %ymm8
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
	vmovdqu	%ymm10, 256(%rax)
	vmovdqu	%ymm6, 288(%rax)
	vmovdqu	%ymm11, 320(%rax)
	vmovdqu	%ymm12, 352(%rax)
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
	vmovdqu	%ymm3, (%rax)
	vmovdqu	%ymm4, 32(%rax)
	vmovdqu	%ymm5, 64(%rax)
	vmovdqu	%ymm6, 96(%rax)
	vmovdqu	384(%rax), %ymm4
	vmovdqu	416(%rax), %ymm5
	vmovdqu	448(%rax), %ymm7
	vmovdqu	480(%rax), %ymm10
	vmovdqu	128(%rax), %ymm6
	vmovdqu	160(%rax), %ymm9
	vmovdqu	192(%rax), %ymm8
	vmovdqu	224(%rax), %ymm11
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
	vmovdqu	%ymm1, 384(%rax)
	vmovdqu	%ymm6, 416(%rax)
	vmovdqu	%ymm8, 448(%rax)
	vmovdqu	%ymm9, 480(%rax)
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
	vmovdqu	%ymm1, 128(%rax)
	vmovdqu	%ymm4, 160(%rax)
	vmovdqu	%ymm5, 192(%rax)
	vmovdqu	%ymm0, 224(%rax)
	ret
L_poly_getnoise_eta1_4x$1:
	leaq	32(%rsp), %rcx
	leaq	160(%rsp), %rdx
	leaq	288(%rsp), %rsi
	leaq	416(%rsp), %r8
	movq	%rax, 544(%rsp)
	movq	%r11, 552(%rsp)
	movq	%rbx, 560(%rsp)
	movq	%rbp, 568(%rsp)
	movb	%r12b, 576(%rsp)
	incb	%r12b
	movb	%r12b, 577(%rsp)
	incb	%r12b
	movb	%r12b, 578(%rsp)
	incb	%r12b
	movb	%r12b, 579(%rsp)
	leaq	576(%rsp), %r11
	leaq	-824(%rsp), %rsp
	call	L_shake256x4_A128__A32_A1$1
L_poly_getnoise_eta1_4x$2:
	leaq	824(%rsp), %rsp
	movq	544(%rsp), %rax
	movq	552(%rsp), %r9
	movq	560(%rsp), %r11
	movq	568(%rsp), %rbx
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
	vmovdqu	%ymm5, (%rax)
	vmovdqu	%ymm7, 32(%rax)
	vmovdqu	%ymm6, 64(%rax)
	vmovdqu	%ymm4, 96(%rax)
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
	vmovdqu	%ymm5, 128(%rax)
	vmovdqu	%ymm7, 160(%rax)
	vmovdqu	%ymm6, 192(%rax)
	vmovdqu	%ymm4, 224(%rax)
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
	vmovdqu	%ymm5, 256(%rax)
	vmovdqu	%ymm7, 288(%rax)
	vmovdqu	%ymm6, 320(%rax)
	vmovdqu	%ymm4, 352(%rax)
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
	vmovdqu	%ymm1, 384(%rax)
	vmovdqu	%ymm3, 416(%rax)
	vmovdqu	%ymm2, 448(%rax)
	vmovdqu	%ymm0, 480(%rax)
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
	vmovdqu	%ymm5, (%r11)
	vmovdqu	%ymm7, 32(%r11)
	vmovdqu	%ymm6, 64(%r11)
	vmovdqu	%ymm4, 96(%r11)
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
	vmovdqu	%ymm5, 128(%r11)
	vmovdqu	%ymm7, 160(%r11)
	vmovdqu	%ymm6, 192(%r11)
	vmovdqu	%ymm4, 224(%r11)
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
	vmovdqu	%ymm5, 256(%r11)
	vmovdqu	%ymm7, 288(%r11)
	vmovdqu	%ymm6, 320(%r11)
	vmovdqu	%ymm4, 352(%r11)
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
	vmovdqu	%ymm1, 384(%r11)
	vmovdqu	%ymm3, 416(%r11)
	vmovdqu	%ymm2, 448(%r11)
	vmovdqu	%ymm0, 480(%r11)
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
	vmovdqu	%ymm5, (%rbx)
	vmovdqu	%ymm7, 32(%rbx)
	vmovdqu	%ymm6, 64(%rbx)
	vmovdqu	%ymm4, 96(%rbx)
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
	vmovdqu	%ymm5, 128(%rbx)
	vmovdqu	%ymm7, 160(%rbx)
	vmovdqu	%ymm6, 192(%rbx)
	vmovdqu	%ymm4, 224(%rbx)
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
	vmovdqu	%ymm5, 256(%rbx)
	vmovdqu	%ymm7, 288(%rbx)
	vmovdqu	%ymm6, 320(%rbx)
	vmovdqu	%ymm4, 352(%rbx)
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
	vmovdqu	%ymm1, 384(%rbx)
	vmovdqu	%ymm3, 416(%rbx)
	vmovdqu	%ymm2, 448(%rbx)
	vmovdqu	%ymm0, 480(%rbx)
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
	vmovdqu	(%rdx), %ymm4
	vmovdqu	32(%rdx), %ymm5
	vmovdqu	(%rsi), %ymm6
	vmovdqu	32(%rsi), %ymm7
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
	vmovdqu	%ymm5, (%rax)
	vmovdqu	%ymm4, 32(%rax)
	vmovdqu	64(%rdx), %ymm4
	vmovdqu	96(%rdx), %ymm5
	vmovdqu	64(%rsi), %ymm6
	vmovdqu	96(%rsi), %ymm7
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
	vmovdqu	%ymm3, 64(%rax)
	vmovdqu	%ymm2, 96(%rax)
	vmovdqu	glob_data + 2160(%rip), %ymm2
	vmovdqu	glob_data + 2192(%rip), %ymm3
	vmovdqu	128(%rdx), %ymm4
	vmovdqu	160(%rdx), %ymm5
	vmovdqu	128(%rsi), %ymm6
	vmovdqu	160(%rsi), %ymm7
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
	vmovdqu	%ymm5, 128(%rax)
	vmovdqu	%ymm4, 160(%rax)
	vmovdqu	192(%rdx), %ymm4
	vmovdqu	224(%rdx), %ymm5
	vmovdqu	192(%rsi), %ymm6
	vmovdqu	224(%rsi), %ymm7
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
	vmovdqu	%ymm3, 192(%rax)
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	glob_data + 2488(%rip), %ymm2
	vmovdqu	glob_data + 2520(%rip), %ymm3
	vmovdqu	256(%rdx), %ymm4
	vmovdqu	288(%rdx), %ymm5
	vmovdqu	256(%rsi), %ymm6
	vmovdqu	288(%rsi), %ymm7
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
	vmovdqu	%ymm5, 256(%rax)
	vmovdqu	%ymm4, 288(%rax)
	vmovdqu	320(%rdx), %ymm4
	vmovdqu	352(%rdx), %ymm5
	vmovdqu	320(%rsi), %ymm6
	vmovdqu	352(%rsi), %ymm7
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
	vmovdqu	%ymm3, 320(%rax)
	vmovdqu	%ymm2, 352(%rax)
	vmovdqu	glob_data + 2552(%rip), %ymm2
	vmovdqu	glob_data + 2584(%rip), %ymm3
	vmovdqu	384(%rdx), %ymm4
	vmovdqu	416(%rdx), %ymm5
	vmovdqu	384(%rsi), %ymm6
	vmovdqu	416(%rsi), %ymm7
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
	vmovdqu	%ymm5, 384(%rax)
	vmovdqu	%ymm4, 416(%rax)
	vmovdqu	448(%rdx), %ymm4
	vmovdqu	480(%rdx), %ymm5
	vmovdqu	448(%rsi), %ymm6
	vmovdqu	480(%rsi), %ymm7
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
	vmovdqu	%ymm3, 448(%rax)
	vmovdqu	%ymm0, 480(%rax)
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
	vmovdqu	(%rax), %ymm0
	vmovdqu	(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	32(%rax), %ymm0
	vmovdqu	32(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	64(%rax), %ymm0
	vmovdqu	64(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	96(%rax), %ymm0
	vmovdqu	96(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 96(%rax)
	vmovdqu	128(%rax), %ymm0
	vmovdqu	128(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 128(%rax)
	vmovdqu	160(%rax), %ymm0
	vmovdqu	160(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 160(%rax)
	vmovdqu	192(%rax), %ymm0
	vmovdqu	192(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 192(%rax)
	vmovdqu	224(%rax), %ymm0
	vmovdqu	224(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 224(%rax)
	vmovdqu	256(%rax), %ymm0
	vmovdqu	256(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 256(%rax)
	vmovdqu	288(%rax), %ymm0
	vmovdqu	288(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 288(%rax)
	vmovdqu	320(%rax), %ymm0
	vmovdqu	320(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 320(%rax)
	vmovdqu	352(%rax), %ymm0
	vmovdqu	352(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 352(%rax)
	vmovdqu	384(%rax), %ymm0
	vmovdqu	384(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 384(%rax)
	vmovdqu	416(%rax), %ymm0
	vmovdqu	416(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 416(%rax)
	vmovdqu	448(%rax), %ymm0
	vmovdqu	448(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 448(%rax)
	vmovdqu	480(%rax), %ymm0
	vmovdqu	480(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 480(%rax)
	ret
L_shake128x4_squeeze3blocks$1:
	movq	%r15, %rcx
	leaq	536(%r15), %rdx
	leaq	1072(%r15), %r8
	leaq	1608(%r15), %r9
	movq	$0, %r11
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake128x4_squeeze3blocks$16:
	leaq	824(%rsp), %rsp
	movq	$0, %rbx
	jmp 	L_shake128x4_squeeze3blocks$14
L_shake128x4_squeeze3blocks$15:
	vmovdqu	(%rax,%rbx,4), %ymm0
	vmovdqu	32(%rax,%rbx,4), %ymm1
	vmovdqu	64(%rax,%rbx,4), %ymm2
	vmovdqu	96(%rax,%rbx,4), %ymm3
	addq	$32, %rbx
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
	vmovdqu	%ymm4, (%r8,%r11)
	vmovdqu	%ymm0, (%r9,%r11)
	addq	$32, %r11
L_shake128x4_squeeze3blocks$14:
	cmpq	$160, %rbx
	jl  	L_shake128x4_squeeze3blocks$15
	jmp 	L_shake128x4_squeeze3blocks$12
L_shake128x4_squeeze3blocks$13:
	movq	(%rax,%rbx,4), %rbp
	movq	%rbp, (%rcx,%r11)
	movq	8(%rax,%rbx,4), %rbp
	movq	%rbp, (%rdx,%r11)
	movq	16(%rax,%rbx,4), %rbp
	movq	%rbp, (%r8,%r11)
	movq	24(%rax,%rbx,4), %rbp
	movq	%rbp, (%r9,%r11)
	addq	$8, %rbx
	addq	$8, %r11
L_shake128x4_squeeze3blocks$12:
	cmpq	$168, %rbx
	jl  	L_shake128x4_squeeze3blocks$13
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake128x4_squeeze3blocks$11:
	leaq	824(%rsp), %rsp
	movq	$0, %rbx
	jmp 	L_shake128x4_squeeze3blocks$9
L_shake128x4_squeeze3blocks$10:
	vmovdqu	(%rax,%rbx,4), %ymm0
	vmovdqu	32(%rax,%rbx,4), %ymm1
	vmovdqu	64(%rax,%rbx,4), %ymm2
	vmovdqu	96(%rax,%rbx,4), %ymm3
	addq	$32, %rbx
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
	vmovdqu	%ymm4, (%r8,%r11)
	vmovdqu	%ymm0, (%r9,%r11)
	addq	$32, %r11
L_shake128x4_squeeze3blocks$9:
	cmpq	$160, %rbx
	jl  	L_shake128x4_squeeze3blocks$10
	jmp 	L_shake128x4_squeeze3blocks$7
L_shake128x4_squeeze3blocks$8:
	movq	(%rax,%rbx,4), %rbp
	movq	%rbp, (%rcx,%r11)
	movq	8(%rax,%rbx,4), %rbp
	movq	%rbp, (%rdx,%r11)
	movq	16(%rax,%rbx,4), %rbp
	movq	%rbp, (%r8,%r11)
	movq	24(%rax,%rbx,4), %rbp
	movq	%rbp, (%r9,%r11)
	addq	$8, %rbx
	addq	$8, %r11
L_shake128x4_squeeze3blocks$7:
	cmpq	$168, %rbx
	jl  	L_shake128x4_squeeze3blocks$8
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake128x4_squeeze3blocks$6:
	leaq	824(%rsp), %rsp
	movq	$0, %rbx
	jmp 	L_shake128x4_squeeze3blocks$4
L_shake128x4_squeeze3blocks$5:
	vmovdqu	(%rax,%rbx,4), %ymm0
	vmovdqu	32(%rax,%rbx,4), %ymm1
	vmovdqu	64(%rax,%rbx,4), %ymm2
	vmovdqu	96(%rax,%rbx,4), %ymm3
	addq	$32, %rbx
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
	vmovdqu	%ymm4, (%r8,%r11)
	vmovdqu	%ymm0, (%r9,%r11)
	addq	$32, %r11
L_shake128x4_squeeze3blocks$4:
	cmpq	$192, %rbx
	jl  	L_shake128x4_squeeze3blocks$5
	jmp 	L_shake128x4_squeeze3blocks$2
L_shake128x4_squeeze3blocks$3:
	movq	(%rax,%rbx,4), %rbp
	movq	%rbp, (%rcx,%r11)
	movq	8(%rax,%rbx,4), %rbp
	movq	%rbp, (%rdx,%r11)
	movq	16(%rax,%rbx,4), %rbp
	movq	%rbp, (%r8,%r11)
	movq	24(%rax,%rbx,4), %rbp
	movq	%rbp, (%r9,%r11)
	addq	$8, %rbx
	addq	$8, %r11
L_shake128x4_squeeze3blocks$2:
	cmpq	$200, %rbx
	jl  	L_shake128x4_squeeze3blocks$3
	ret
L_shake128_next_state$1:
	leaq	336(%r13), %rdx
	vpbroadcastq	(%rdx), %ymm4
	vmovdqu	8(%rdx), %ymm5
	vmovq	40(%rdx), %xmm0
	vmovdqu	48(%rdx), %ymm1
	vmovq	80(%rdx), %xmm2
	vmovdqu	88(%rdx), %ymm3
	movq	120(%rdx), %r8
	vpinsrq	$1, %r8, %xmm0, %xmm0
	vmovdqu	128(%rdx), %ymm7
	movq	160(%rdx), %r8
	vpinsrq	$1, %r8, %xmm2, %xmm2
	vinserti128	$1, %xmm0, %ymm2, %ymm6
	vmovdqu	168(%rdx), %ymm2
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
	movq	$336, %rdx
	movq	%xmm4, (%r13,%rdx)
	vpunpckhqdq	%xmm4, %xmm4, %xmm4
	vmovdqu	%ymm5, 8(%r13,%rdx)
	vmovdqu	%xmm6, %xmm4
	vextracti128	$1, %ymm6, %xmm5
	movq	%xmm5, %r8
	movq	%r8, 40(%r13,%rdx)
	vpunpckhqdq	%xmm5, %xmm5, %xmm5
	vpblendd	$240, %ymm1, %ymm0, %ymm6
	vpblendd	$240, %ymm0, %ymm1, %ymm0
	vpblendd	$240, %ymm3, %ymm2, %ymm1
	vpblendd	$240, %ymm2, %ymm3, %ymm2
	vpblendd	$195, %ymm2, %ymm6, %ymm3
	vmovdqu	%ymm3, 48(%r13,%rdx)
	movq	%xmm4, %r8
	movq	%r8, 80(%r13,%rdx)
	vpunpckhqdq	%xmm4, %xmm4, %xmm3
	vpblendd	$195, %ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 88(%r13,%rdx)
	movq	%xmm5, %r8
	movq	%r8, 120(%r13,%rdx)
	vpblendd	$195, %ymm6, %ymm1, %ymm2
	vmovdqu	%ymm2, 128(%r13,%rdx)
	movq	%xmm3, %r8
	movq	%r8, 160(%r13,%rdx)
	vpblendd	$195, %ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 168(%r13,%rdx)
	ret
L_shake128_squeeze3blocks$1:
	call	L_keccakf1600_avx2$1
L_shake128_squeeze3blocks$4:
	movq	$0, %rax
	vmovdqu	%xmm4, %xmm7
	movq	%xmm7, (%r13,%rax)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vmovdqu	%ymm5, 8(%r13,%rax)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rdx
	movq	%rdx, 40(%r13,%rax)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm1, %ymm0, %ymm9
	vpblendd	$240, %ymm0, %ymm1, %ymm10
	vpblendd	$240, %ymm3, %ymm2, %ymm11
	vpblendd	$240, %ymm2, %ymm3, %ymm12
	vpblendd	$195, %ymm12, %ymm9, %ymm13
	vmovdqu	%ymm13, 48(%r13,%rax)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%r13,%rax)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$195, %ymm10, %ymm12, %ymm10
	vmovdqu	%ymm10, 88(%r13,%rax)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%r13,%rax)
	vpblendd	$195, %ymm9, %ymm11, %ymm8
	vmovdqu	%ymm8, 128(%r13,%rax)
	movq	%xmm7, %rdx
	movq	%rdx, 160(%r13,%rax)
	addq	$168, %rax
	call	L_keccakf1600_avx2$1
L_shake128_squeeze3blocks$3:
	vmovdqu	%xmm4, %xmm7
	movq	%xmm7, (%r13,%rax)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vmovdqu	%ymm5, 8(%r13,%rax)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rdx
	movq	%rdx, 40(%r13,%rax)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm1, %ymm0, %ymm9
	vpblendd	$240, %ymm0, %ymm1, %ymm10
	vpblendd	$240, %ymm3, %ymm2, %ymm11
	vpblendd	$240, %ymm2, %ymm3, %ymm12
	vpblendd	$195, %ymm12, %ymm9, %ymm13
	vmovdqu	%ymm13, 48(%r13,%rax)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%r13,%rax)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$195, %ymm10, %ymm12, %ymm10
	vmovdqu	%ymm10, 88(%r13,%rax)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%r13,%rax)
	vpblendd	$195, %ymm9, %ymm11, %ymm8
	vmovdqu	%ymm8, 128(%r13,%rax)
	movq	%xmm7, %rdx
	movq	%rdx, 160(%r13,%rax)
	addq	$168, %rax
	call	L_keccakf1600_avx2$1
L_shake128_squeeze3blocks$2:
	movq	%xmm4, (%r13,%rax)
	vpunpckhqdq	%xmm4, %xmm4, %xmm4
	vmovdqu	%ymm5, 8(%r13,%rax)
	vmovdqu	%xmm6, %xmm4
	vextracti128	$1, %ymm6, %xmm5
	movq	%xmm5, %rdx
	movq	%rdx, 40(%r13,%rax)
	vpunpckhqdq	%xmm5, %xmm5, %xmm5
	vpblendd	$240, %ymm1, %ymm0, %ymm6
	vpblendd	$240, %ymm0, %ymm1, %ymm0
	vpblendd	$240, %ymm3, %ymm2, %ymm1
	vpblendd	$240, %ymm2, %ymm3, %ymm2
	vpblendd	$195, %ymm2, %ymm6, %ymm3
	vmovdqu	%ymm3, 48(%r13,%rax)
	movq	%xmm4, %rdx
	movq	%rdx, 80(%r13,%rax)
	vpunpckhqdq	%xmm4, %xmm4, %xmm3
	vpblendd	$195, %ymm0, %ymm2, %ymm2
	vmovdqu	%ymm2, 88(%r13,%rax)
	movq	%xmm5, %rdx
	movq	%rdx, 120(%r13,%rax)
	vpblendd	$195, %ymm6, %ymm1, %ymm2
	vmovdqu	%ymm2, 128(%r13,%rax)
	movq	%xmm3, %rdx
	movq	%rdx, 160(%r13,%rax)
	vpblendd	$195, %ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 168(%r13,%rax)
	ret
L_shake128x4_absorb_A32_A2$1:
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %rcx
	jmp 	L_shake128x4_absorb_A32_A2$4
L_shake128x4_absorb_A32_A2$5:
	vmovdqu	%ymm0, (%rax,%rcx)
	addq	$32, %rcx
L_shake128x4_absorb_A32_A2$4:
	cmpq	$800, %rcx
	jb  	L_shake128x4_absorb_A32_A2$5
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	L_shake128x4_absorb_A32_A2$2
L_shake128x4_absorb_A32_A2$3:
	vpbroadcastq	(%rsi,%rcx), %ymm0
	addq	$8, %rcx
	vpxor	(%rax,%rdx), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax,%rdx)
	addq	$32, %rdx
L_shake128x4_absorb_A32_A2$2:
	cmpq	$128, %rdx
	jb  	L_shake128x4_absorb_A32_A2$3
	movq	$0, %r11
	movq	%r8, %rbp
	leaq	2(%r8), %rcx
	leaq	4(%r8), %rdx
	leaq	6(%r8), %r8
	movq	$16, %r9
	movq	$0, %rbx
	movzwq	(%rbp,%r11), %rbp
	movq	$31, %r12
	shlq	$16, %r12
	orq 	%r12, %rbp
	shlq	$0, %rbp
	orq 	%rbp, %rbx
	movq	$0, %rbp
	movzwq	(%rcx,%r11), %rcx
	movq	$31, %r12
	shlq	$16, %r12
	orq 	%r12, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %rbp
	movq	$0, %rcx
	movzwq	(%rdx,%r11), %rdx
	movq	$31, %r12
	shlq	$16, %r12
	orq 	%r12, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
	movq	$0, %rdx
	movzwq	(%r8,%r11), %r8
	movq	$31, %r11
	shlq	$16, %r11
	orq 	%r11, %r8
	shlq	$0, %r8
	orq 	%r8, %rdx
	xorq	(%rax,%r9,8), %rbx
	movq	%rbx, (%rax,%r9,8)
	xorq	8(%rax,%r9,8), %rbp
	movq	%rbp, 8(%rax,%r9,8)
	xorq	16(%rax,%r9,8), %rcx
	movq	%rcx, 16(%rax,%r9,8)
	xorq	24(%rax,%r9,8), %rdx
	movq	%rdx, 24(%rax,%r9,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpxor	640(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 640(%rax)
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
	movq	$0, %r8
	movq	%r8, 192(%rdx)
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %r8
	movq	$0, %r9
	jmp 	L_shake128_absorb_A32_A2$4
L_shake128_absorb_A32_A2$5:
	vmovdqu	(%rsi,%r8), %ymm7
	addq	$32, %r8
	vmovdqu	%ymm7, (%rdx,%r9,8)
	addq	$4, %r9
L_shake128_absorb_A32_A2$4:
	cmpq	$4, %r9
	jb  	L_shake128_absorb_A32_A2$5
	movq	$0, %rsi
	movq	$0, %r8
	movzwq	(%rax,%rsi), %rax
	movq	$31, %rsi
	shlq	$16, %rsi
	orq 	%rsi, %rax
	shlq	$0, %rax
	orq 	%rax, %r8
	movq	%r8, 32(%rdx)
	movq	$5, %rax
	jmp 	L_shake128_absorb_A32_A2$2
L_shake128_absorb_A32_A2$3:
	movq	$0, (%rdx,%rax,8)
	incq	%rax
L_shake128_absorb_A32_A2$2:
	cmpq	$5, %rax
	jb  	L_shake128_absorb_A32_A2$3
	vpbroadcastq	(%rdx), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	vmovdqu	8(%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	$1, %rax
	shlq	$63, %rax
	vpxor	%xmm7, %xmm7, %xmm7
	vpinsrq	$1, %rax, %xmm7, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	ret
L_shake256x4_A128__A32_A1$1:
	leaq	32(%rsp), %rax
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %rbx
	jmp 	L_shake256x4_A128__A32_A1$9
L_shake256x4_A128__A32_A1$10:
	vmovdqu	%ymm0, (%rax,%rbx)
	addq	$32, %rbx
L_shake256x4_A128__A32_A1$9:
	cmpq	$800, %rbx
	jb  	L_shake256x4_A128__A32_A1$10
	movq	$0, %rbx
	movq	$0, %rbp
	jmp 	L_shake256x4_A128__A32_A1$7
L_shake256x4_A128__A32_A1$8:
	vpbroadcastq	(%r9,%rbx), %ymm0
	addq	$8, %rbx
	vpxor	(%rax,%rbp), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax,%rbp)
	addq	$32, %rbp
L_shake256x4_A128__A32_A1$7:
	cmpq	$128, %rbp
	jb  	L_shake256x4_A128__A32_A1$8
	movq	$0, %rbp
	movq	%r11, %r13
	leaq	1(%r11), %r14
	leaq	2(%r11), %r9
	leaq	3(%r11), %r11
	movq	$16, %rbx
	movq	$0, %r12
	movq	$0, %r15
	movzbq	(%r13,%rbp), %r13
	orq 	$7936, %r13
	shlq	$0, %r13
	orq 	%r13, %r15
	shlq	$0, %r15
	orq 	%r15, %r12
	movq	$0, %r13
	movq	$0, %r15
	movzbq	(%r14,%rbp), %r14
	orq 	$7936, %r14
	shlq	$0, %r14
	orq 	%r14, %r15
	shlq	$0, %r15
	orq 	%r15, %r13
	movq	$0, %r14
	movq	$0, %r15
	movzbq	(%r9,%rbp), %r9
	orq 	$7936, %r9
	shlq	$0, %r9
	orq 	%r9, %r15
	shlq	$0, %r15
	orq 	%r15, %r14
	movq	$0, %r9
	movq	$0, %r15
	movzbq	(%r11,%rbp), %r11
	orq 	$7936, %r11
	shlq	$0, %r11
	orq 	%r11, %r15
	shlq	$0, %r15
	orq 	%r15, %r9
	xorq	(%rax,%rbx,8), %r12
	movq	%r12, (%rax,%rbx,8)
	xorq	8(%rax,%rbx,8), %r13
	movq	%r13, 8(%rax,%rbx,8)
	xorq	16(%rax,%rbx,8), %r14
	movq	%r14, 16(%rax,%rbx,8)
	xorq	24(%rax,%rbx,8), %r9
	movq	%r9, 24(%rax,%rbx,8)
	movq	$1, %r9
	shlq	$63, %r9
	movq	%r9, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpxor	512(%rax), %ymm0, %ymm0
	vmovdqu	%ymm0, 512(%rax)
	movq	$0, %r9
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake256x4_A128__A32_A1$6:
	leaq	824(%rsp), %rsp
	movq	$0, %r11
	jmp 	L_shake256x4_A128__A32_A1$4
L_shake256x4_A128__A32_A1$5:
	vmovdqu	(%rax,%r11,4), %ymm0
	vmovdqu	32(%rax,%r11,4), %ymm1
	vmovdqu	64(%rax,%r11,4), %ymm2
	vmovdqu	96(%rax,%r11,4), %ymm3
	addq	$32, %r11
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%rcx,%r9)
	vmovdqu	%ymm3, (%rdx,%r9)
	vmovdqu	%ymm4, (%rsi,%r9)
	vmovdqu	%ymm0, (%r8,%r9)
	addq	$32, %r9
L_shake256x4_A128__A32_A1$4:
	cmpq	$128, %r11
	jl  	L_shake256x4_A128__A32_A1$5
	jmp 	L_shake256x4_A128__A32_A1$2
L_shake256x4_A128__A32_A1$3:
	movq	(%rax,%r11,4), %rbx
	movq	%rbx, (%rcx,%r9)
	movq	8(%rax,%r11,4), %rbx
	movq	%rbx, (%rdx,%r9)
	movq	16(%rax,%r11,4), %rbx
	movq	%rbx, (%rsi,%r9)
	movq	24(%rax,%r11,4), %rbx
	movq	%rbx, (%r8,%r9)
	addq	$8, %r11
	addq	$8, %r9
L_shake256x4_A128__A32_A1$2:
	cmpq	$128, %r11
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
	movq	$0, %rdx
	movq	(%rcx,%rdx), %rsi
	movq	%rsi, %xmm6
	vpbroadcastq	%xmm6, %ymm6
	vpxor	%ymm6, %ymm4, %ymm4
	vmovdqu	8(%rcx,%rdx), %ymm6
	vpxor	%ymm6, %ymm5, %ymm5
	movq	40(%rcx,%rdx), %rsi
	movq	%rsi, %xmm6
	vmovdqu	48(%rcx,%rdx), %xmm8
	movq	$6, %rcx
	movq	%rcx, %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm8
	movq	$0, %rcx
	movq	%rcx, %xmm11
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm6
	vpxor	%ymm10, %ymm10, %ymm10
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm11, %xmm11
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
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$1, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	movq	$0, %rcx
	call	L_keccakf1600_avx2$1
L_sha3_512A_A64$2:
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
	leaq	glob_data + 4784(%rip), %rbx
	leaq	32(%rsp), %rbp
	vmovdqu	glob_data + 256(%rip), %ymm0
	vmovdqu	glob_data + 288(%rip), %ymm1
	movq	$0, %r12
	jmp 	L_keccakf1600_avx2x4$2
L_keccakf1600_avx2x4$3:
	vpbroadcastq	(%rbx,%r12,8), %ymm2
	call	L_keccakf1600_4x_round$1
L_keccakf1600_avx2x4$5:
	movq	%rax, %mm0
	movq	%mm0, %rbp
	leaq	32(%rsp), %rax
	vpbroadcastq	8(%rbx,%r12,8), %ymm2
	call	L_keccakf1600_4x_round$1
L_keccakf1600_avx2x4$4:
	movq	%rbp, %mm0
	movq	%mm0, %rax
	leaq	32(%rsp), %rbp
	addq	$2, %r12
L_keccakf1600_avx2x4$2:
	cmpq	$24, %r12
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
	vmovdqu	%ymm2, (%rbp)
	vpandn	%ymm11, %ymm10, %ymm2
	vpxor	%ymm9, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rbp)
	vpandn	%ymm12, %ymm11, %ymm2
	vpxor	%ymm10, %ymm2, %ymm2
	vmovdqu	%ymm2, 64(%rbp)
	vpandn	%ymm8, %ymm12, %ymm2
	vpxor	%ymm11, %ymm2, %ymm2
	vmovdqu	%ymm2, 96(%rbp)
	vpandn	%ymm9, %ymm8, %ymm2
	vpxor	%ymm12, %ymm2, %ymm2
	vmovdqu	%ymm2, 128(%rbp)
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
	vmovdqu	%ymm12, 160(%rbp)
	vpandn	%ymm10, %ymm9, %ymm12
	vpxor	%ymm8, %ymm12, %ymm12
	vmovdqu	%ymm12, 192(%rbp)
	vpandn	%ymm11, %ymm10, %ymm12
	vpxor	%ymm9, %ymm12, %ymm9
	vmovdqu	%ymm9, 224(%rbp)
	vpandn	%ymm2, %ymm11, %ymm9
	vpxor	%ymm10, %ymm9, %ymm9
	vmovdqu	%ymm9, 256(%rbp)
	vpandn	%ymm8, %ymm2, %ymm2
	vpxor	%ymm11, %ymm2, %ymm2
	vmovdqu	%ymm2, 288(%rbp)
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
	vmovdqu	%ymm12, 320(%rbp)
	vpandn	%ymm10, %ymm9, %ymm12
	vpxor	%ymm8, %ymm12, %ymm12
	vmovdqu	%ymm12, 352(%rbp)
	vpandn	%ymm11, %ymm10, %ymm12
	vpxor	%ymm9, %ymm12, %ymm9
	vmovdqu	%ymm9, 384(%rbp)
	vpandn	%ymm2, %ymm11, %ymm9
	vpxor	%ymm10, %ymm9, %ymm9
	vmovdqu	%ymm9, 416(%rbp)
	vpandn	%ymm8, %ymm2, %ymm2
	vpxor	%ymm11, %ymm2, %ymm2
	vmovdqu	%ymm2, 448(%rbp)
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
	vmovdqu	%ymm12, 480(%rbp)
	vpandn	%ymm10, %ymm9, %ymm12
	vpxor	%ymm8, %ymm12, %ymm12
	vmovdqu	%ymm12, 512(%rbp)
	vpandn	%ymm11, %ymm10, %ymm12
	vpxor	%ymm9, %ymm12, %ymm9
	vmovdqu	%ymm9, 544(%rbp)
	vpandn	%ymm2, %ymm11, %ymm9
	vpxor	%ymm10, %ymm9, %ymm9
	vmovdqu	%ymm9, 576(%rbp)
	vpandn	%ymm8, %ymm2, %ymm2
	vpxor	%ymm11, %ymm2, %ymm2
	vmovdqu	%ymm2, 608(%rbp)
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
	vmovdqu	%ymm7, 640(%rbp)
	vpandn	%ymm3, %ymm6, %ymm7
	vpxor	%ymm5, %ymm7, %ymm7
	vmovdqu	%ymm7, 672(%rbp)
	vpandn	%ymm4, %ymm3, %ymm7
	vpxor	%ymm6, %ymm7, %ymm6
	vmovdqu	%ymm6, 704(%rbp)
	vpandn	%ymm2, %ymm4, %ymm6
	vpxor	%ymm3, %ymm6, %ymm3
	vmovdqu	%ymm3, 736(%rbp)
	vpandn	%ymm5, %ymm2, %ymm2
	vpxor	%ymm4, %ymm2, %ymm2
	vmovdqu	%ymm2, 768(%rbp)
	ret
L_keccakf1600_avx2$1:
	leaq	glob_data + 4784(%rip), %rdx
	movq	$0, %r8
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
	vpbroadcastq	(%rdx,%r8,8), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	incq	%r8
	cmpq	$24, %r8
	jb  	L_keccakf1600_avx2$2
	ret
L_nttunpack$1:
	vmovdqu	(%rax), %ymm1
	vmovdqu	32(%rax), %ymm3
	vmovdqu	64(%rax), %ymm4
	vmovdqu	96(%rax), %ymm5
	vmovdqu	128(%rax), %ymm2
	vmovdqu	160(%rax), %ymm6
	vmovdqu	192(%rax), %ymm7
	vmovdqu	224(%rax), %ymm8
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
	vmovdqu	%ymm7, (%rax)
	vmovdqu	%ymm4, 32(%rax)
	vmovdqu	%ymm8, 64(%rax)
	vmovdqu	%ymm0, 96(%rax)
	vmovdqu	%ymm5, 128(%rax)
	vmovdqu	%ymm1, 160(%rax)
	vmovdqu	%ymm6, 192(%rax)
	vmovdqu	%ymm2, 224(%rax)
	vmovdqu	256(%rax), %ymm1
	vmovdqu	288(%rax), %ymm3
	vmovdqu	320(%rax), %ymm4
	vmovdqu	352(%rax), %ymm5
	vmovdqu	384(%rax), %ymm2
	vmovdqu	416(%rax), %ymm6
	vmovdqu	448(%rax), %ymm7
	vmovdqu	480(%rax), %ymm8
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
	vmovdqu	%ymm7, 256(%rax)
	vmovdqu	%ymm4, 288(%rax)
	vmovdqu	%ymm8, 320(%rax)
	vmovdqu	%ymm0, 352(%rax)
	vmovdqu	%ymm5, 384(%rax)
	vmovdqu	%ymm1, 416(%rax)
	vmovdqu	%ymm6, 448(%rax)
	vmovdqu	%ymm2, 480(%rax)
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
