	.att_syntax
	.text
	.p2align	5
	.global	_jade_kem_mlkem_mlkem768_amd64_ref_dec
	.global	jade_kem_mlkem_mlkem768_amd64_ref_dec
	.global	_jade_kem_mlkem_mlkem768_amd64_ref_enc
	.global	jade_kem_mlkem_mlkem768_amd64_ref_enc
	.global	_jade_kem_mlkem_mlkem768_amd64_ref_enc_derand
	.global	jade_kem_mlkem_mlkem768_amd64_ref_enc_derand
	.global	_jade_kem_mlkem_mlkem768_amd64_ref_keypair
	.global	jade_kem_mlkem_mlkem768_amd64_ref_keypair
	.global	_jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand
	.global	jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand
	.type	_jade_kem_mlkem_mlkem768_amd64_ref_dec, %function
	.type	jade_kem_mlkem_mlkem768_amd64_ref_dec, %function
_jade_kem_mlkem_mlkem768_amd64_ref_dec:
jade_kem_mlkem_mlkem768_amd64_ref_dec:
	movq	%rsp, %rax
	leaq	-18048(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 17992(%rsp)
	movq	%rbp, 18000(%rsp)
	movq	%r12, 18008(%rsp)
	movq	%r13, 18016(%rsp)
	movq	%r14, 18024(%rsp)
	movq	%r15, 18032(%rsp)
	movq	%rax, 18040(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm0
	movq	(%rsi), %rax
	movq	%rax, 616(%rsp)
	movq	8(%rsi), %rax
	movq	%rax, 624(%rsp)
	movq	16(%rsi), %rax
	movq	%rax, 632(%rsp)
	movq	24(%rsi), %rax
	movq	%rax, 640(%rsp)
	movq	32(%rsi), %rax
	movq	%rax, 648(%rsp)
	movq	40(%rsi), %rax
	movq	%rax, 656(%rsp)
	movq	48(%rsi), %rax
	movq	%rax, 664(%rsp)
	movq	56(%rsi), %rax
	movq	%rax, 672(%rsp)
	movq	64(%rsi), %rax
	movq	%rax, 680(%rsp)
	movq	72(%rsi), %rax
	movq	%rax, 688(%rsp)
	movq	80(%rsi), %rax
	movq	%rax, 696(%rsp)
	movq	88(%rsi), %rax
	movq	%rax, 704(%rsp)
	movq	96(%rsi), %rax
	movq	%rax, 712(%rsp)
	movq	104(%rsi), %rax
	movq	%rax, 720(%rsp)
	movq	112(%rsi), %rax
	movq	%rax, 728(%rsp)
	movq	120(%rsi), %rax
	movq	%rax, 736(%rsp)
	movq	128(%rsi), %rax
	movq	%rax, 744(%rsp)
	movq	136(%rsi), %rax
	movq	%rax, 752(%rsp)
	movq	144(%rsi), %rax
	movq	%rax, 760(%rsp)
	movq	152(%rsi), %rax
	movq	%rax, 768(%rsp)
	movq	160(%rsi), %rax
	movq	%rax, 776(%rsp)
	movq	168(%rsi), %rax
	movq	%rax, 784(%rsp)
	movq	176(%rsi), %rax
	movq	%rax, 792(%rsp)
	movq	184(%rsi), %rax
	movq	%rax, 800(%rsp)
	movq	192(%rsi), %rax
	movq	%rax, 808(%rsp)
	movq	200(%rsi), %rax
	movq	%rax, 816(%rsp)
	movq	208(%rsi), %rax
	movq	%rax, 824(%rsp)
	movq	216(%rsi), %rax
	movq	%rax, 832(%rsp)
	movq	224(%rsi), %rax
	movq	%rax, 840(%rsp)
	movq	232(%rsi), %rax
	movq	%rax, 848(%rsp)
	movq	240(%rsi), %rax
	movq	%rax, 856(%rsp)
	movq	248(%rsi), %rax
	movq	%rax, 864(%rsp)
	movq	256(%rsi), %rax
	movq	%rax, 872(%rsp)
	movq	264(%rsi), %rax
	movq	%rax, 880(%rsp)
	movq	272(%rsi), %rax
	movq	%rax, 888(%rsp)
	movq	280(%rsi), %rax
	movq	%rax, 896(%rsp)
	movq	288(%rsi), %rax
	movq	%rax, 904(%rsp)
	movq	296(%rsi), %rax
	movq	%rax, 912(%rsp)
	movq	304(%rsi), %rax
	movq	%rax, 920(%rsp)
	movq	312(%rsi), %rax
	movq	%rax, 928(%rsp)
	movq	320(%rsi), %rax
	movq	%rax, 936(%rsp)
	movq	328(%rsi), %rax
	movq	%rax, 944(%rsp)
	movq	336(%rsi), %rax
	movq	%rax, 952(%rsp)
	movq	344(%rsi), %rax
	movq	%rax, 960(%rsp)
	movq	352(%rsi), %rax
	movq	%rax, 968(%rsp)
	movq	360(%rsi), %rax
	movq	%rax, 976(%rsp)
	movq	368(%rsi), %rax
	movq	%rax, 984(%rsp)
	movq	376(%rsi), %rax
	movq	%rax, 992(%rsp)
	movq	384(%rsi), %rax
	movq	%rax, 1000(%rsp)
	movq	392(%rsi), %rax
	movq	%rax, 1008(%rsp)
	movq	400(%rsi), %rax
	movq	%rax, 1016(%rsp)
	movq	408(%rsi), %rax
	movq	%rax, 1024(%rsp)
	movq	416(%rsi), %rax
	movq	%rax, 1032(%rsp)
	movq	424(%rsi), %rax
	movq	%rax, 1040(%rsp)
	movq	432(%rsi), %rax
	movq	%rax, 1048(%rsp)
	movq	440(%rsi), %rax
	movq	%rax, 1056(%rsp)
	movq	448(%rsi), %rax
	movq	%rax, 1064(%rsp)
	movq	456(%rsi), %rax
	movq	%rax, 1072(%rsp)
	movq	464(%rsi), %rax
	movq	%rax, 1080(%rsp)
	movq	472(%rsi), %rax
	movq	%rax, 1088(%rsp)
	movq	480(%rsi), %rax
	movq	%rax, 1096(%rsp)
	movq	488(%rsi), %rax
	movq	%rax, 1104(%rsp)
	movq	496(%rsi), %rax
	movq	%rax, 1112(%rsp)
	movq	504(%rsi), %rax
	movq	%rax, 1120(%rsp)
	movq	512(%rsi), %rax
	movq	%rax, 1128(%rsp)
	movq	520(%rsi), %rax
	movq	%rax, 1136(%rsp)
	movq	528(%rsi), %rax
	movq	%rax, 1144(%rsp)
	movq	536(%rsi), %rax
	movq	%rax, 1152(%rsp)
	movq	544(%rsi), %rax
	movq	%rax, 1160(%rsp)
	movq	552(%rsi), %rax
	movq	%rax, 1168(%rsp)
	movq	560(%rsi), %rax
	movq	%rax, 1176(%rsp)
	movq	568(%rsi), %rax
	movq	%rax, 1184(%rsp)
	movq	576(%rsi), %rax
	movq	%rax, 1192(%rsp)
	movq	584(%rsi), %rax
	movq	%rax, 1200(%rsp)
	movq	592(%rsi), %rax
	movq	%rax, 1208(%rsp)
	movq	600(%rsi), %rax
	movq	%rax, 1216(%rsp)
	movq	608(%rsi), %rax
	movq	%rax, 1224(%rsp)
	movq	616(%rsi), %rax
	movq	%rax, 1232(%rsp)
	movq	624(%rsi), %rax
	movq	%rax, 1240(%rsp)
	movq	632(%rsi), %rax
	movq	%rax, 1248(%rsp)
	movq	640(%rsi), %rax
	movq	%rax, 1256(%rsp)
	movq	648(%rsi), %rax
	movq	%rax, 1264(%rsp)
	movq	656(%rsi), %rax
	movq	%rax, 1272(%rsp)
	movq	664(%rsi), %rax
	movq	%rax, 1280(%rsp)
	movq	672(%rsi), %rax
	movq	%rax, 1288(%rsp)
	movq	680(%rsi), %rax
	movq	%rax, 1296(%rsp)
	movq	688(%rsi), %rax
	movq	%rax, 1304(%rsp)
	movq	696(%rsi), %rax
	movq	%rax, 1312(%rsp)
	movq	704(%rsi), %rax
	movq	%rax, 1320(%rsp)
	movq	712(%rsi), %rax
	movq	%rax, 1328(%rsp)
	movq	720(%rsi), %rax
	movq	%rax, 1336(%rsp)
	movq	728(%rsi), %rax
	movq	%rax, 1344(%rsp)
	movq	736(%rsi), %rax
	movq	%rax, 1352(%rsp)
	movq	744(%rsi), %rax
	movq	%rax, 1360(%rsp)
	movq	752(%rsi), %rax
	movq	%rax, 1368(%rsp)
	movq	760(%rsi), %rax
	movq	%rax, 1376(%rsp)
	movq	768(%rsi), %rax
	movq	%rax, 1384(%rsp)
	movq	776(%rsi), %rax
	movq	%rax, 1392(%rsp)
	movq	784(%rsi), %rax
	movq	%rax, 1400(%rsp)
	movq	792(%rsi), %rax
	movq	%rax, 1408(%rsp)
	movq	800(%rsi), %rax
	movq	%rax, 1416(%rsp)
	movq	808(%rsi), %rax
	movq	%rax, 1424(%rsp)
	movq	816(%rsi), %rax
	movq	%rax, 1432(%rsp)
	movq	824(%rsi), %rax
	movq	%rax, 1440(%rsp)
	movq	832(%rsi), %rax
	movq	%rax, 1448(%rsp)
	movq	840(%rsi), %rax
	movq	%rax, 1456(%rsp)
	movq	848(%rsi), %rax
	movq	%rax, 1464(%rsp)
	movq	856(%rsi), %rax
	movq	%rax, 1472(%rsp)
	movq	864(%rsi), %rax
	movq	%rax, 1480(%rsp)
	movq	872(%rsi), %rax
	movq	%rax, 1488(%rsp)
	movq	880(%rsi), %rax
	movq	%rax, 1496(%rsp)
	movq	888(%rsi), %rax
	movq	%rax, 1504(%rsp)
	movq	896(%rsi), %rax
	movq	%rax, 1512(%rsp)
	movq	904(%rsi), %rax
	movq	%rax, 1520(%rsp)
	movq	912(%rsi), %rax
	movq	%rax, 1528(%rsp)
	movq	920(%rsi), %rax
	movq	%rax, 1536(%rsp)
	movq	928(%rsi), %rax
	movq	%rax, 1544(%rsp)
	movq	936(%rsi), %rax
	movq	%rax, 1552(%rsp)
	movq	944(%rsi), %rax
	movq	%rax, 1560(%rsp)
	movq	952(%rsi), %rax
	movq	%rax, 1568(%rsp)
	movq	960(%rsi), %rax
	movq	%rax, 1576(%rsp)
	movq	968(%rsi), %rax
	movq	%rax, 1584(%rsp)
	movq	976(%rsi), %rax
	movq	%rax, 1592(%rsp)
	movq	984(%rsi), %rax
	movq	%rax, 1600(%rsp)
	movq	992(%rsi), %rax
	movq	%rax, 1608(%rsp)
	movq	1000(%rsi), %rax
	movq	%rax, 1616(%rsp)
	movq	1008(%rsi), %rax
	movq	%rax, 1624(%rsp)
	movq	1016(%rsi), %rax
	movq	%rax, 1632(%rsp)
	movq	1024(%rsi), %rax
	movq	%rax, 1640(%rsp)
	movq	1032(%rsi), %rax
	movq	%rax, 1648(%rsp)
	movq	1040(%rsi), %rax
	movq	%rax, 1656(%rsp)
	movq	1048(%rsi), %rax
	movq	%rax, 1664(%rsp)
	movq	1056(%rsi), %rax
	movq	%rax, 1672(%rsp)
	movq	1064(%rsi), %rax
	movq	%rax, 1680(%rsp)
	movq	1072(%rsi), %rax
	movq	%rax, 1688(%rsp)
	movq	1080(%rsi), %rax
	movq	%rax, 1696(%rsp)
	movq	(%rdx), %rax
	movq	%rax, 1704(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 1712(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 1720(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 1728(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 1736(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 1744(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 1752(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 1760(%rsp)
	movq	64(%rdx), %rax
	movq	%rax, 1768(%rsp)
	movq	72(%rdx), %rax
	movq	%rax, 1776(%rsp)
	movq	80(%rdx), %rax
	movq	%rax, 1784(%rsp)
	movq	88(%rdx), %rax
	movq	%rax, 1792(%rsp)
	movq	96(%rdx), %rax
	movq	%rax, 1800(%rsp)
	movq	104(%rdx), %rax
	movq	%rax, 1808(%rsp)
	movq	112(%rdx), %rax
	movq	%rax, 1816(%rsp)
	movq	120(%rdx), %rax
	movq	%rax, 1824(%rsp)
	movq	128(%rdx), %rax
	movq	%rax, 1832(%rsp)
	movq	136(%rdx), %rax
	movq	%rax, 1840(%rsp)
	movq	144(%rdx), %rax
	movq	%rax, 1848(%rsp)
	movq	152(%rdx), %rax
	movq	%rax, 1856(%rsp)
	movq	160(%rdx), %rax
	movq	%rax, 1864(%rsp)
	movq	168(%rdx), %rax
	movq	%rax, 1872(%rsp)
	movq	176(%rdx), %rax
	movq	%rax, 1880(%rsp)
	movq	184(%rdx), %rax
	movq	%rax, 1888(%rsp)
	movq	192(%rdx), %rax
	movq	%rax, 1896(%rsp)
	movq	200(%rdx), %rax
	movq	%rax, 1904(%rsp)
	movq	208(%rdx), %rax
	movq	%rax, 1912(%rsp)
	movq	216(%rdx), %rax
	movq	%rax, 1920(%rsp)
	movq	224(%rdx), %rax
	movq	%rax, 1928(%rsp)
	movq	232(%rdx), %rax
	movq	%rax, 1936(%rsp)
	movq	240(%rdx), %rax
	movq	%rax, 1944(%rsp)
	movq	248(%rdx), %rax
	movq	%rax, 1952(%rsp)
	movq	256(%rdx), %rax
	movq	%rax, 1960(%rsp)
	movq	264(%rdx), %rax
	movq	%rax, 1968(%rsp)
	movq	272(%rdx), %rax
	movq	%rax, 1976(%rsp)
	movq	280(%rdx), %rax
	movq	%rax, 1984(%rsp)
	movq	288(%rdx), %rax
	movq	%rax, 1992(%rsp)
	movq	296(%rdx), %rax
	movq	%rax, 2000(%rsp)
	movq	304(%rdx), %rax
	movq	%rax, 2008(%rsp)
	movq	312(%rdx), %rax
	movq	%rax, 2016(%rsp)
	movq	320(%rdx), %rax
	movq	%rax, 2024(%rsp)
	movq	328(%rdx), %rax
	movq	%rax, 2032(%rsp)
	movq	336(%rdx), %rax
	movq	%rax, 2040(%rsp)
	movq	344(%rdx), %rax
	movq	%rax, 2048(%rsp)
	movq	352(%rdx), %rax
	movq	%rax, 2056(%rsp)
	movq	360(%rdx), %rax
	movq	%rax, 2064(%rsp)
	movq	368(%rdx), %rax
	movq	%rax, 2072(%rsp)
	movq	376(%rdx), %rax
	movq	%rax, 2080(%rsp)
	movq	384(%rdx), %rax
	movq	%rax, 2088(%rsp)
	movq	392(%rdx), %rax
	movq	%rax, 2096(%rsp)
	movq	400(%rdx), %rax
	movq	%rax, 2104(%rsp)
	movq	408(%rdx), %rax
	movq	%rax, 2112(%rsp)
	movq	416(%rdx), %rax
	movq	%rax, 2120(%rsp)
	movq	424(%rdx), %rax
	movq	%rax, 2128(%rsp)
	movq	432(%rdx), %rax
	movq	%rax, 2136(%rsp)
	movq	440(%rdx), %rax
	movq	%rax, 2144(%rsp)
	movq	448(%rdx), %rax
	movq	%rax, 2152(%rsp)
	movq	456(%rdx), %rax
	movq	%rax, 2160(%rsp)
	movq	464(%rdx), %rax
	movq	%rax, 2168(%rsp)
	movq	472(%rdx), %rax
	movq	%rax, 2176(%rsp)
	movq	480(%rdx), %rax
	movq	%rax, 2184(%rsp)
	movq	488(%rdx), %rax
	movq	%rax, 2192(%rsp)
	movq	496(%rdx), %rax
	movq	%rax, 2200(%rsp)
	movq	504(%rdx), %rax
	movq	%rax, 2208(%rsp)
	movq	512(%rdx), %rax
	movq	%rax, 2216(%rsp)
	movq	520(%rdx), %rax
	movq	%rax, 2224(%rsp)
	movq	528(%rdx), %rax
	movq	%rax, 2232(%rsp)
	movq	536(%rdx), %rax
	movq	%rax, 2240(%rsp)
	movq	544(%rdx), %rax
	movq	%rax, 2248(%rsp)
	movq	552(%rdx), %rax
	movq	%rax, 2256(%rsp)
	movq	560(%rdx), %rax
	movq	%rax, 2264(%rsp)
	movq	568(%rdx), %rax
	movq	%rax, 2272(%rsp)
	movq	576(%rdx), %rax
	movq	%rax, 2280(%rsp)
	movq	584(%rdx), %rax
	movq	%rax, 2288(%rsp)
	movq	592(%rdx), %rax
	movq	%rax, 2296(%rsp)
	movq	600(%rdx), %rax
	movq	%rax, 2304(%rsp)
	movq	608(%rdx), %rax
	movq	%rax, 2312(%rsp)
	movq	616(%rdx), %rax
	movq	%rax, 2320(%rsp)
	movq	624(%rdx), %rax
	movq	%rax, 2328(%rsp)
	movq	632(%rdx), %rax
	movq	%rax, 2336(%rsp)
	movq	640(%rdx), %rax
	movq	%rax, 2344(%rsp)
	movq	648(%rdx), %rax
	movq	%rax, 2352(%rsp)
	movq	656(%rdx), %rax
	movq	%rax, 2360(%rsp)
	movq	664(%rdx), %rax
	movq	%rax, 2368(%rsp)
	movq	672(%rdx), %rax
	movq	%rax, 2376(%rsp)
	movq	680(%rdx), %rax
	movq	%rax, 2384(%rsp)
	movq	688(%rdx), %rax
	movq	%rax, 2392(%rsp)
	movq	696(%rdx), %rax
	movq	%rax, 2400(%rsp)
	movq	704(%rdx), %rax
	movq	%rax, 2408(%rsp)
	movq	712(%rdx), %rax
	movq	%rax, 2416(%rsp)
	movq	720(%rdx), %rax
	movq	%rax, 2424(%rsp)
	movq	728(%rdx), %rax
	movq	%rax, 2432(%rsp)
	movq	736(%rdx), %rax
	movq	%rax, 2440(%rsp)
	movq	744(%rdx), %rax
	movq	%rax, 2448(%rsp)
	movq	752(%rdx), %rax
	movq	%rax, 2456(%rsp)
	movq	760(%rdx), %rax
	movq	%rax, 2464(%rsp)
	movq	768(%rdx), %rax
	movq	%rax, 2472(%rsp)
	movq	776(%rdx), %rax
	movq	%rax, 2480(%rsp)
	movq	784(%rdx), %rax
	movq	%rax, 2488(%rsp)
	movq	792(%rdx), %rax
	movq	%rax, 2496(%rsp)
	movq	800(%rdx), %rax
	movq	%rax, 2504(%rsp)
	movq	808(%rdx), %rax
	movq	%rax, 2512(%rsp)
	movq	816(%rdx), %rax
	movq	%rax, 2520(%rsp)
	movq	824(%rdx), %rax
	movq	%rax, 2528(%rsp)
	movq	832(%rdx), %rax
	movq	%rax, 2536(%rsp)
	movq	840(%rdx), %rax
	movq	%rax, 2544(%rsp)
	movq	848(%rdx), %rax
	movq	%rax, 2552(%rsp)
	movq	856(%rdx), %rax
	movq	%rax, 2560(%rsp)
	movq	864(%rdx), %rax
	movq	%rax, 2568(%rsp)
	movq	872(%rdx), %rax
	movq	%rax, 2576(%rsp)
	movq	880(%rdx), %rax
	movq	%rax, 2584(%rsp)
	movq	888(%rdx), %rax
	movq	%rax, 2592(%rsp)
	movq	896(%rdx), %rax
	movq	%rax, 2600(%rsp)
	movq	904(%rdx), %rax
	movq	%rax, 2608(%rsp)
	movq	912(%rdx), %rax
	movq	%rax, 2616(%rsp)
	movq	920(%rdx), %rax
	movq	%rax, 2624(%rsp)
	movq	928(%rdx), %rax
	movq	%rax, 2632(%rsp)
	movq	936(%rdx), %rax
	movq	%rax, 2640(%rsp)
	movq	944(%rdx), %rax
	movq	%rax, 2648(%rsp)
	movq	952(%rdx), %rax
	movq	%rax, 2656(%rsp)
	movq	960(%rdx), %rax
	movq	%rax, 2664(%rsp)
	movq	968(%rdx), %rax
	movq	%rax, 2672(%rsp)
	movq	976(%rdx), %rax
	movq	%rax, 2680(%rsp)
	movq	984(%rdx), %rax
	movq	%rax, 2688(%rsp)
	movq	992(%rdx), %rax
	movq	%rax, 2696(%rsp)
	movq	1000(%rdx), %rax
	movq	%rax, 2704(%rsp)
	movq	1008(%rdx), %rax
	movq	%rax, 2712(%rsp)
	movq	1016(%rdx), %rax
	movq	%rax, 2720(%rsp)
	movq	1024(%rdx), %rax
	movq	%rax, 2728(%rsp)
	movq	1032(%rdx), %rax
	movq	%rax, 2736(%rsp)
	movq	1040(%rdx), %rax
	movq	%rax, 2744(%rsp)
	movq	1048(%rdx), %rax
	movq	%rax, 2752(%rsp)
	movq	1056(%rdx), %rax
	movq	%rax, 2760(%rsp)
	movq	1064(%rdx), %rax
	movq	%rax, 2768(%rsp)
	movq	1072(%rdx), %rax
	movq	%rax, 2776(%rsp)
	movq	1080(%rdx), %rax
	movq	%rax, 2784(%rsp)
	movq	1088(%rdx), %rax
	movq	%rax, 2792(%rsp)
	movq	1096(%rdx), %rax
	movq	%rax, 2800(%rsp)
	movq	1104(%rdx), %rax
	movq	%rax, 2808(%rsp)
	movq	1112(%rdx), %rax
	movq	%rax, 2816(%rsp)
	movq	1120(%rdx), %rax
	movq	%rax, 2824(%rsp)
	movq	1128(%rdx), %rax
	movq	%rax, 2832(%rsp)
	movq	1136(%rdx), %rax
	movq	%rax, 2840(%rsp)
	movq	1144(%rdx), %rax
	movq	%rax, 2848(%rsp)
	movq	1152(%rdx), %rax
	movq	%rax, 2856(%rsp)
	movq	1160(%rdx), %rax
	movq	%rax, 2864(%rsp)
	movq	1168(%rdx), %rax
	movq	%rax, 2872(%rsp)
	movq	1176(%rdx), %rax
	movq	%rax, 2880(%rsp)
	movq	1184(%rdx), %rax
	movq	%rax, 2888(%rsp)
	movq	1192(%rdx), %rax
	movq	%rax, 2896(%rsp)
	movq	1200(%rdx), %rax
	movq	%rax, 2904(%rsp)
	movq	1208(%rdx), %rax
	movq	%rax, 2912(%rsp)
	movq	1216(%rdx), %rax
	movq	%rax, 2920(%rsp)
	movq	1224(%rdx), %rax
	movq	%rax, 2928(%rsp)
	movq	1232(%rdx), %rax
	movq	%rax, 2936(%rsp)
	movq	1240(%rdx), %rax
	movq	%rax, 2944(%rsp)
	movq	1248(%rdx), %rax
	movq	%rax, 2952(%rsp)
	movq	1256(%rdx), %rax
	movq	%rax, 2960(%rsp)
	movq	1264(%rdx), %rax
	movq	%rax, 2968(%rsp)
	movq	1272(%rdx), %rax
	movq	%rax, 2976(%rsp)
	movq	1280(%rdx), %rax
	movq	%rax, 2984(%rsp)
	movq	1288(%rdx), %rax
	movq	%rax, 2992(%rsp)
	movq	1296(%rdx), %rax
	movq	%rax, 3000(%rsp)
	movq	1304(%rdx), %rax
	movq	%rax, 3008(%rsp)
	movq	1312(%rdx), %rax
	movq	%rax, 3016(%rsp)
	movq	1320(%rdx), %rax
	movq	%rax, 3024(%rsp)
	movq	1328(%rdx), %rax
	movq	%rax, 3032(%rsp)
	movq	1336(%rdx), %rax
	movq	%rax, 3040(%rsp)
	movq	1344(%rdx), %rax
	movq	%rax, 3048(%rsp)
	movq	1352(%rdx), %rax
	movq	%rax, 3056(%rsp)
	movq	1360(%rdx), %rax
	movq	%rax, 3064(%rsp)
	movq	1368(%rdx), %rax
	movq	%rax, 3072(%rsp)
	movq	1376(%rdx), %rax
	movq	%rax, 3080(%rsp)
	movq	1384(%rdx), %rax
	movq	%rax, 3088(%rsp)
	movq	1392(%rdx), %rax
	movq	%rax, 3096(%rsp)
	movq	1400(%rdx), %rax
	movq	%rax, 3104(%rsp)
	movq	1408(%rdx), %rax
	movq	%rax, 3112(%rsp)
	movq	1416(%rdx), %rax
	movq	%rax, 3120(%rsp)
	movq	1424(%rdx), %rax
	movq	%rax, 3128(%rsp)
	movq	1432(%rdx), %rax
	movq	%rax, 3136(%rsp)
	movq	1440(%rdx), %rax
	movq	%rax, 3144(%rsp)
	movq	1448(%rdx), %rax
	movq	%rax, 3152(%rsp)
	movq	1456(%rdx), %rax
	movq	%rax, 3160(%rsp)
	movq	1464(%rdx), %rax
	movq	%rax, 3168(%rsp)
	movq	1472(%rdx), %rax
	movq	%rax, 3176(%rsp)
	movq	1480(%rdx), %rax
	movq	%rax, 3184(%rsp)
	movq	1488(%rdx), %rax
	movq	%rax, 3192(%rsp)
	movq	1496(%rdx), %rax
	movq	%rax, 3200(%rsp)
	movq	1504(%rdx), %rax
	movq	%rax, 3208(%rsp)
	movq	1512(%rdx), %rax
	movq	%rax, 3216(%rsp)
	movq	1520(%rdx), %rax
	movq	%rax, 3224(%rsp)
	movq	1528(%rdx), %rax
	movq	%rax, 3232(%rsp)
	movq	1536(%rdx), %rax
	movq	%rax, 3240(%rsp)
	movq	1544(%rdx), %rax
	movq	%rax, 3248(%rsp)
	movq	1552(%rdx), %rax
	movq	%rax, 3256(%rsp)
	movq	1560(%rdx), %rax
	movq	%rax, 3264(%rsp)
	movq	1568(%rdx), %rax
	movq	%rax, 3272(%rsp)
	movq	1576(%rdx), %rax
	movq	%rax, 3280(%rsp)
	movq	1584(%rdx), %rax
	movq	%rax, 3288(%rsp)
	movq	1592(%rdx), %rax
	movq	%rax, 3296(%rsp)
	movq	1600(%rdx), %rax
	movq	%rax, 3304(%rsp)
	movq	1608(%rdx), %rax
	movq	%rax, 3312(%rsp)
	movq	1616(%rdx), %rax
	movq	%rax, 3320(%rsp)
	movq	1624(%rdx), %rax
	movq	%rax, 3328(%rsp)
	movq	1632(%rdx), %rax
	movq	%rax, 3336(%rsp)
	movq	1640(%rdx), %rax
	movq	%rax, 3344(%rsp)
	movq	1648(%rdx), %rax
	movq	%rax, 3352(%rsp)
	movq	1656(%rdx), %rax
	movq	%rax, 3360(%rsp)
	movq	1664(%rdx), %rax
	movq	%rax, 3368(%rsp)
	movq	1672(%rdx), %rax
	movq	%rax, 3376(%rsp)
	movq	1680(%rdx), %rax
	movq	%rax, 3384(%rsp)
	movq	1688(%rdx), %rax
	movq	%rax, 3392(%rsp)
	movq	1696(%rdx), %rax
	movq	%rax, 3400(%rsp)
	movq	1704(%rdx), %rax
	movq	%rax, 3408(%rsp)
	movq	1712(%rdx), %rax
	movq	%rax, 3416(%rsp)
	movq	1720(%rdx), %rax
	movq	%rax, 3424(%rsp)
	movq	1728(%rdx), %rax
	movq	%rax, 3432(%rsp)
	movq	1736(%rdx), %rax
	movq	%rax, 3440(%rsp)
	movq	1744(%rdx), %rax
	movq	%rax, 3448(%rsp)
	movq	1752(%rdx), %rax
	movq	%rax, 3456(%rsp)
	movq	1760(%rdx), %rax
	movq	%rax, 3464(%rsp)
	movq	1768(%rdx), %rax
	movq	%rax, 3472(%rsp)
	movq	1776(%rdx), %rax
	movq	%rax, 3480(%rsp)
	movq	1784(%rdx), %rax
	movq	%rax, 3488(%rsp)
	movq	1792(%rdx), %rax
	movq	%rax, 3496(%rsp)
	movq	1800(%rdx), %rax
	movq	%rax, 3504(%rsp)
	movq	1808(%rdx), %rax
	movq	%rax, 3512(%rsp)
	movq	1816(%rdx), %rax
	movq	%rax, 3520(%rsp)
	movq	1824(%rdx), %rax
	movq	%rax, 3528(%rsp)
	movq	1832(%rdx), %rax
	movq	%rax, 3536(%rsp)
	movq	1840(%rdx), %rax
	movq	%rax, 3544(%rsp)
	movq	1848(%rdx), %rax
	movq	%rax, 3552(%rsp)
	movq	1856(%rdx), %rax
	movq	%rax, 3560(%rsp)
	movq	1864(%rdx), %rax
	movq	%rax, 3568(%rsp)
	movq	1872(%rdx), %rax
	movq	%rax, 3576(%rsp)
	movq	1880(%rdx), %rax
	movq	%rax, 3584(%rsp)
	movq	1888(%rdx), %rax
	movq	%rax, 3592(%rsp)
	movq	1896(%rdx), %rax
	movq	%rax, 3600(%rsp)
	movq	1904(%rdx), %rax
	movq	%rax, 3608(%rsp)
	movq	1912(%rdx), %rax
	movq	%rax, 3616(%rsp)
	movq	1920(%rdx), %rax
	movq	%rax, 3624(%rsp)
	movq	1928(%rdx), %rax
	movq	%rax, 3632(%rsp)
	movq	1936(%rdx), %rax
	movq	%rax, 3640(%rsp)
	movq	1944(%rdx), %rax
	movq	%rax, 3648(%rsp)
	movq	1952(%rdx), %rax
	movq	%rax, 3656(%rsp)
	movq	1960(%rdx), %rax
	movq	%rax, 3664(%rsp)
	movq	1968(%rdx), %rax
	movq	%rax, 3672(%rsp)
	movq	1976(%rdx), %rax
	movq	%rax, 3680(%rsp)
	movq	1984(%rdx), %rax
	movq	%rax, 3688(%rsp)
	movq	1992(%rdx), %rax
	movq	%rax, 3696(%rsp)
	movq	2000(%rdx), %rax
	movq	%rax, 3704(%rsp)
	movq	2008(%rdx), %rax
	movq	%rax, 3712(%rsp)
	movq	2016(%rdx), %rax
	movq	%rax, 3720(%rsp)
	movq	2024(%rdx), %rax
	movq	%rax, 3728(%rsp)
	movq	2032(%rdx), %rax
	movq	%rax, 3736(%rsp)
	movq	2040(%rdx), %rax
	movq	%rax, 3744(%rsp)
	movq	2048(%rdx), %rax
	movq	%rax, 3752(%rsp)
	movq	2056(%rdx), %rax
	movq	%rax, 3760(%rsp)
	movq	2064(%rdx), %rax
	movq	%rax, 3768(%rsp)
	movq	2072(%rdx), %rax
	movq	%rax, 3776(%rsp)
	movq	2080(%rdx), %rax
	movq	%rax, 3784(%rsp)
	movq	2088(%rdx), %rax
	movq	%rax, 3792(%rsp)
	movq	2096(%rdx), %rax
	movq	%rax, 3800(%rsp)
	movq	2104(%rdx), %rax
	movq	%rax, 3808(%rsp)
	movq	2112(%rdx), %rax
	movq	%rax, 3816(%rsp)
	movq	2120(%rdx), %rax
	movq	%rax, 3824(%rsp)
	movq	2128(%rdx), %rax
	movq	%rax, 3832(%rsp)
	movq	2136(%rdx), %rax
	movq	%rax, 3840(%rsp)
	movq	2144(%rdx), %rax
	movq	%rax, 3848(%rsp)
	movq	2152(%rdx), %rax
	movq	%rax, 3856(%rsp)
	movq	2160(%rdx), %rax
	movq	%rax, 3864(%rsp)
	movq	2168(%rdx), %rax
	movq	%rax, 3872(%rsp)
	movq	2176(%rdx), %rax
	movq	%rax, 3880(%rsp)
	movq	2184(%rdx), %rax
	movq	%rax, 3888(%rsp)
	movq	2192(%rdx), %rax
	movq	%rax, 3896(%rsp)
	movq	2200(%rdx), %rax
	movq	%rax, 3904(%rsp)
	movq	2208(%rdx), %rax
	movq	%rax, 3912(%rsp)
	movq	2216(%rdx), %rax
	movq	%rax, 3920(%rsp)
	movq	2224(%rdx), %rax
	movq	%rax, 3928(%rsp)
	movq	2232(%rdx), %rax
	movq	%rax, 3936(%rsp)
	movq	2240(%rdx), %rax
	movq	%rax, 3944(%rsp)
	movq	2248(%rdx), %rax
	movq	%rax, 3952(%rsp)
	movq	2256(%rdx), %rax
	movq	%rax, 3960(%rsp)
	movq	2264(%rdx), %rax
	movq	%rax, 3968(%rsp)
	movq	2272(%rdx), %rax
	movq	%rax, 3976(%rsp)
	movq	2280(%rdx), %rax
	movq	%rax, 3984(%rsp)
	movq	2288(%rdx), %rax
	movq	%rax, 3992(%rsp)
	movq	2296(%rdx), %rax
	movq	%rax, 4000(%rsp)
	movq	2304(%rdx), %rax
	movq	%rax, 4008(%rsp)
	movq	2312(%rdx), %rax
	movq	%rax, 4016(%rsp)
	movq	2320(%rdx), %rax
	movq	%rax, 4024(%rsp)
	movq	2328(%rdx), %rax
	movq	%rax, 4032(%rsp)
	movq	2336(%rdx), %rax
	movq	%rax, 4040(%rsp)
	movq	2344(%rdx), %rax
	movq	%rax, 4048(%rsp)
	movq	2352(%rdx), %rax
	movq	%rax, 4056(%rsp)
	movq	2360(%rdx), %rax
	movq	%rax, 4064(%rsp)
	movq	2368(%rdx), %rax
	movq	%rax, 4072(%rsp)
	movq	2376(%rdx), %rax
	movq	%rax, 4080(%rsp)
	movq	2384(%rdx), %rax
	movq	%rax, 4088(%rsp)
	movq	2392(%rdx), %rax
	movq	%rax, 4096(%rsp)
	leaq	616(%rsp), %rcx
	leaq	16(%rsp), %rax
	movq	%rax, (%rsp)
	movq	%rcx, 8(%rsp)
	leaq	120(%rsp), %r10
	leaq	1704(%rsp), %rax
	leaq	6152(%rsp), %rdx
	movq	%rcx, %rbx
	movq	$0, %rsi
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$249
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$250:
	movzbl	(%rbx,%rdi), %r8d
	incq	%rdi
	movzbl	(%rbx,%rdi), %r9d
	incq	%rdi
	movzbl	(%rbx,%rdi), %r11d
	incq	%rdi
	movzbl	(%rbx,%rdi), %ebp
	incq	%rdi
	movzbl	(%rbx,%rdi), %r12d
	incq	%rdi
	movl	%r9d, %r13d
	shrl	$2, %r9d
	andl	$3, %r13d
	shll	$8, %r13d
	orl 	%r13d, %r8d
	movl	%r11d, %r13d
	shrl	$4, %r11d
	andl	$15, %r13d
	shll	$6, %r13d
	orl 	%r13d, %r9d
	movl	%ebp, %r13d
	shrl	$6, %ebp
	andl	$63, %r13d
	shll	$4, %r13d
	orl 	%r13d, %r11d
	shll	$2, %r12d
	orl 	%r12d, %ebp
	imull	$3329, %r8d, %r8d
	addl	$512, %r8d
	shrl	$10, %r8d
	movw	%r8w, (%rdx,%rsi,2)
	imull	$3329, %r9d, %r9d
	addl	$512, %r9d
	shrl	$10, %r9d
	movw	%r9w, 2(%rdx,%rsi,2)
	imull	$3329, %r11d, %r11d
	addl	$512, %r11d
	shrl	$10, %r11d
	movw	%r11w, 4(%rdx,%rsi,2)
	imull	$3329, %ebp, %ebp
	addl	$512, %ebp
	shrl	$10, %ebp
	movw	%bp, 6(%rdx,%rsi,2)
	addq	$4, %rsi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$249:
	cmpq	$765, %rsi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$250
	leaq	4104(%rsp), %rdx
	leaq	960(%rcx), %rbx
	call	L_i_poly_decompress$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$248:
	leaq	7688(%rsp), %rcx
	movq	%rax, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$247:
	leaq	8200(%rsp), %rcx
	leaq	384(%rax), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$246:
	leaq	8712(%rsp), %rcx
	leaq	768(%rax), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$245:
	leaq	6152(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$244:
	leaq	6664(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$243:
	leaq	7176(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$242:
	leaq	4616(%rsp), %rdx
	leaq	7688(%rsp), %rax
	leaq	6152(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$241:
	leaq	16(%rsp), %rsp
	leaq	5128(%rsp), %rdx
	leaq	8200(%rsp), %rax
	leaq	6664(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$240:
	leaq	16(%rsp), %rsp
	leaq	4616(%rsp), %rax
	leaq	5128(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$239:
	leaq	5128(%rsp), %rdx
	leaq	8712(%rsp), %rax
	leaq	7176(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$238:
	leaq	16(%rsp), %rsp
	leaq	4616(%rsp), %rax
	leaq	5128(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$237:
	leaq	4616(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$235
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$236:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$235:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$236
	leaq	4616(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$234:
	leaq	5128(%rsp), %rax
	leaq	4104(%rsp), %rdx
	leaq	4616(%rsp), %rcx
	call	L_poly_sub$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$233:
	leaq	5128(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$231
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$232:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$231:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$232
	leaq	5128(%rsp), %rax
	call	L_i_poly_tomsg$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$230:
	movq	4040(%rsp), %rax
	movq	%rax, 152(%rsp)
	movq	4048(%rsp), %rax
	movq	%rax, 160(%rsp)
	movq	4056(%rsp), %rax
	movq	%rax, 168(%rsp)
	movq	4064(%rsp), %rax
	movq	%rax, 176(%rsp)
	leaq	184(%rsp), %rax
	leaq	120(%rsp), %r10
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$229:
	leaq	224(%rsp), %rsp
	leaq	16904(%rsp), %rcx
	leaq	120(%rsp), %rax
	leaq	2856(%rsp), %r10
	leaq	216(%rsp), %r11
	movq	%rcx, %mm1
	movq	%r10, %rbx
	leaq	6152(%rsp), %rcx
	movq	%rbx, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$228:
	leaq	6664(%rsp), %rcx
	leaq	384(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$227:
	leaq	7176(%rsp), %rcx
	leaq	768(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$226:
	movq	1152(%r10), %rcx
	movq	%rcx, 48(%rsp)
	movq	1160(%r10), %rcx
	movq	%rcx, 56(%rsp)
	movq	1168(%r10), %rcx
	movq	%rcx, 64(%rsp)
	movq	1176(%r10), %rcx
	movq	%rcx, 72(%rsp)
	leaq	5128(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$225:
	movq	%r11, %mm2
	movq	$1, %rax
	movq	%rax, %mm3
	movb	48(%rsp), %dl
	movb	%dl, 80(%rsp)
	movb	49(%rsp), %dl
	movb	%dl, 81(%rsp)
	movb	50(%rsp), %dl
	movb	%dl, 82(%rsp)
	movb	51(%rsp), %dl
	movb	%dl, 83(%rsp)
	movb	52(%rsp), %dl
	movb	%dl, 84(%rsp)
	movb	53(%rsp), %dl
	movb	%dl, 85(%rsp)
	movb	54(%rsp), %dl
	movb	%dl, 86(%rsp)
	movb	55(%rsp), %dl
	movb	%dl, 87(%rsp)
	movb	56(%rsp), %dl
	movb	%dl, 88(%rsp)
	movb	57(%rsp), %dl
	movb	%dl, 89(%rsp)
	movb	58(%rsp), %dl
	movb	%dl, 90(%rsp)
	movb	59(%rsp), %dl
	movb	%dl, 91(%rsp)
	movb	60(%rsp), %dl
	movb	%dl, 92(%rsp)
	movb	61(%rsp), %dl
	movb	%dl, 93(%rsp)
	movb	62(%rsp), %dl
	movb	%dl, 94(%rsp)
	movb	63(%rsp), %dl
	movb	%dl, 95(%rsp)
	movb	64(%rsp), %dl
	movb	%dl, 96(%rsp)
	movb	65(%rsp), %dl
	movb	%dl, 97(%rsp)
	movb	66(%rsp), %dl
	movb	%dl, 98(%rsp)
	movb	67(%rsp), %dl
	movb	%dl, 99(%rsp)
	movb	68(%rsp), %dl
	movb	%dl, 100(%rsp)
	movb	69(%rsp), %dl
	movb	%dl, 101(%rsp)
	movb	70(%rsp), %dl
	movb	%dl, 102(%rsp)
	movb	71(%rsp), %dl
	movb	%dl, 103(%rsp)
	movb	72(%rsp), %dl
	movb	%dl, 104(%rsp)
	movb	73(%rsp), %dl
	movb	%dl, 105(%rsp)
	movb	74(%rsp), %dl
	movb	%dl, 106(%rsp)
	movb	75(%rsp), %dl
	movb	%dl, 107(%rsp)
	movb	76(%rsp), %dl
	movb	%dl, 108(%rsp)
	movb	77(%rsp), %dl
	movb	%dl, 109(%rsp)
	movb	78(%rsp), %dl
	movb	%dl, 110(%rsp)
	movb	79(%rsp), %dl
	movb	%dl, 111(%rsp)
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$223
	movb	$0, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$224
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$223:
	movb	$0, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$224:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$222:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$209
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$210:
	movq	%rcx, %mm4
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$221:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 4616(%rsp,%rcx,2)
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
	movw	%di, 4616(%rsp,%rcx,2)
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
	leaq	12296(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$207
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$208:
	movw	4616(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$207:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$208
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$205
	movb	$0, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$206
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$205:
	movb	$1, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$206:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$204:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$191
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$192:
	movq	%rcx, %mm4
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$203:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 4616(%rsp,%rcx,2)
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
	movw	%di, 4616(%rsp,%rcx,2)
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
	leaq	12808(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$189
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$190:
	movw	4616(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$189:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$190
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$187
	movb	$0, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$188
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$187:
	movb	$2, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$188:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$186:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$173
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$174:
	movq	%rcx, %mm4
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$185:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 4616(%rsp,%rcx,2)
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
	movw	%di, 4616(%rsp,%rcx,2)
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
	leaq	13320(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$171
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$172:
	movw	4616(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$171:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$172
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$169
	movb	$1, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$170
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$169:
	movb	$0, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$170:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$168:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$155
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$156:
	movq	%rcx, %mm4
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$167:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 4616(%rsp,%rcx,2)
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
	movw	%di, 4616(%rsp,%rcx,2)
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
	leaq	13832(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$153
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$154:
	movw	4616(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$153:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$154
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$151
	movb	$1, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$152
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$151:
	movb	$1, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$152:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$150:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$137
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$138:
	movq	%rcx, %mm4
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$149:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 4616(%rsp,%rcx,2)
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
	movw	%di, 4616(%rsp,%rcx,2)
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
	leaq	14344(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$135
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$136:
	movw	4616(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$135:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$136
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$133
	movb	$1, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$134
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$133:
	movb	$2, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$134:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$132:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$119
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$120:
	movq	%rcx, %mm4
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$131:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 4616(%rsp,%rcx,2)
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
	movw	%di, 4616(%rsp,%rcx,2)
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
	leaq	14856(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$117
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$118:
	movw	4616(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$117:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$118
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$115
	movb	$2, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$116
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$115:
	movb	$0, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$116:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$114:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$101
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$102:
	movq	%rcx, %mm4
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$113:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 4616(%rsp,%rcx,2)
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
	movw	%di, 4616(%rsp,%rcx,2)
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
	leaq	15368(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$99
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$100:
	movw	4616(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$99:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$100
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$97
	movb	$2, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$98
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$97:
	movb	$1, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$98:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$96:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$83
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$84:
	movq	%rcx, %mm4
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$95:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 4616(%rsp,%rcx,2)
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
	movw	%di, 4616(%rsp,%rcx,2)
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
	leaq	15880(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$81
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$82:
	movw	4616(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$81:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$82
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$79
	movb	$2, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$80
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$79:
	movb	$2, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$80:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$78:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$65
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$66:
	movq	%rcx, %mm4
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$77:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 4616(%rsp,%rcx,2)
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
	movw	%di, 4616(%rsp,%rcx,2)
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
	leaq	16392(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$63
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$64:
	movw	4616(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$63:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$64
	movq	%mm2, %rcx
	movb	$0, %al
	leaq	7688(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$62:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	8200(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$61:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	8712(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$60:
	leaq	176(%rsp), %rsp
	movq	%mm2, %rcx
	movb	$3, %al
	leaq	9224(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$59:
	leaq	176(%rsp), %rsp
	movb	$4, %al
	leaq	9736(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$58:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	10248(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$57:
	leaq	176(%rsp), %rsp
	movb	$6, %al
	leaq	4616(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$56:
	leaq	176(%rsp), %rsp
	leaq	7688(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$55:
	leaq	8200(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$54:
	leaq	8712(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$53:
	leaq	10760(%rsp), %rdx
	leaq	12296(%rsp), %rax
	leaq	7688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$52:
	leaq	16(%rsp), %rsp
	leaq	4104(%rsp), %rdx
	leaq	12808(%rsp), %rax
	leaq	8200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$51:
	leaq	16(%rsp), %rsp
	leaq	10760(%rsp), %rax
	leaq	4104(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$50:
	leaq	4104(%rsp), %rdx
	leaq	13320(%rsp), %rax
	leaq	8712(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$49:
	leaq	16(%rsp), %rsp
	leaq	10760(%rsp), %rax
	leaq	4104(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$48:
	leaq	10760(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$46
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$47:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$46:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$47
	leaq	11272(%rsp), %rdx
	leaq	13832(%rsp), %rax
	leaq	7688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$45:
	leaq	16(%rsp), %rsp
	leaq	4104(%rsp), %rdx
	leaq	14344(%rsp), %rax
	leaq	8200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$44:
	leaq	16(%rsp), %rsp
	leaq	11272(%rsp), %rax
	leaq	4104(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$43:
	leaq	4104(%rsp), %rdx
	leaq	14856(%rsp), %rax
	leaq	8712(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$42:
	leaq	16(%rsp), %rsp
	leaq	11272(%rsp), %rax
	leaq	4104(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$41:
	leaq	11272(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$39
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$40:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$39:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$40
	leaq	11784(%rsp), %rdx
	leaq	15368(%rsp), %rax
	leaq	7688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$38:
	leaq	16(%rsp), %rsp
	leaq	4104(%rsp), %rdx
	leaq	15880(%rsp), %rax
	leaq	8200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$37:
	leaq	16(%rsp), %rsp
	leaq	11784(%rsp), %rax
	leaq	4104(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$36:
	leaq	4104(%rsp), %rdx
	leaq	16392(%rsp), %rax
	leaq	8712(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$35:
	leaq	16(%rsp), %rsp
	leaq	11784(%rsp), %rax
	leaq	4104(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$34:
	leaq	11784(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$32
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$33:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$32:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$33
	leaq	4104(%rsp), %rdx
	leaq	6152(%rsp), %rax
	leaq	7688(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$31:
	leaq	16(%rsp), %rsp
	leaq	5640(%rsp), %rdx
	leaq	6664(%rsp), %rax
	leaq	8200(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$30:
	leaq	16(%rsp), %rsp
	leaq	4104(%rsp), %rax
	leaq	5640(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$29:
	leaq	5640(%rsp), %rdx
	leaq	7176(%rsp), %rax
	leaq	8712(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$28:
	leaq	16(%rsp), %rsp
	leaq	4104(%rsp), %rax
	leaq	5640(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$27:
	leaq	4104(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$25
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$26:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$25:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$26
	leaq	10760(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$24:
	leaq	11272(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$23:
	leaq	11784(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$22:
	leaq	4104(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$21:
	leaq	10760(%rsp), %rax
	leaq	9224(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$20:
	leaq	11272(%rsp), %rax
	leaq	9736(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$19:
	leaq	11784(%rsp), %rax
	leaq	10248(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$18:
	leaq	4104(%rsp), %rax
	leaq	4616(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$17:
	leaq	4104(%rsp), %rax
	leaq	5128(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$16:
	leaq	10760(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$14
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$15:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$14:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$15
	leaq	11272(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$12
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$13:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$12:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$13
	leaq	11784(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$10
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$11:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$10:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$11
	leaq	4104(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$8
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$9:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$8:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$9
	movq	%mm1, %rdx
	movq	%rdx, %r10
	movq	$0, %rsi
	movq	$0, %rdi
	leaq	10760(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$7:
	leaq	11272(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$6:
	leaq	11784(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$5:
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$3
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$4:
	movzwq	10760(%rsp,%rsi,2), %r8
	shlq	$10, %r8
	addq	$1665, %r8
	imulq	$1290167, %r8, %r8
	shrq	$32, %r8
	andq	$1023, %r8
	movzwq	10762(%rsp,%rsi,2), %r9
	shlq	$10, %r9
	addq	$1665, %r9
	imulq	$1290167, %r9, %r9
	shrq	$32, %r9
	andq	$1023, %r9
	movzwq	10764(%rsp,%rsi,2), %r11
	shlq	$10, %r11
	addq	$1665, %r11
	imulq	$1290167, %r11, %r11
	shrq	$32, %r11
	andq	$1023, %r11
	movzwq	10766(%rsp,%rsi,2), %rbp
	shlq	$10, %rbp
	addq	$1665, %rbp
	imulq	$1290167, %rbp, %rbp
	shrq	$32, %rbp
	andq	$1023, %rbp
	movw	%r8w, %ax
	andw	$255, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$8, %r8w
	movw	%r9w, %ax
	shlw	$2, %ax
	orw 	%r8w, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$6, %r9w
	movw	%r11w, %ax
	shlw	$4, %ax
	orw 	%r9w, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$4, %r11w
	movw	%bp, %ax
	shlw	$6, %ax
	orw 	%r11w, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrq	$2, %rbp
	movb	%bpl, (%r10,%rdi)
	incq	%rdi
	addq	$4, %rsi
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$3:
	cmpq	$765, %rsi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_dec$4
	leaq	960(%rdx), %rdx
	leaq	4104(%rsp), %rax
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$2:
	movq	8(%rsp), %rax
	leaq	16904(%rsp), %rcx
	movq	$0, %rdx
	movb	(%rcx), %sil
	movb	(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1(%rcx), %sil
	movb	1(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	2(%rcx), %sil
	movb	2(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	3(%rcx), %sil
	movb	3(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	4(%rcx), %sil
	movb	4(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	5(%rcx), %sil
	movb	5(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	6(%rcx), %sil
	movb	6(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	7(%rcx), %sil
	movb	7(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	8(%rcx), %sil
	movb	8(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	9(%rcx), %sil
	movb	9(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	10(%rcx), %sil
	movb	10(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	11(%rcx), %sil
	movb	11(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	12(%rcx), %sil
	movb	12(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	13(%rcx), %sil
	movb	13(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	14(%rcx), %sil
	movb	14(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	15(%rcx), %sil
	movb	15(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	16(%rcx), %sil
	movb	16(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	17(%rcx), %sil
	movb	17(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	18(%rcx), %sil
	movb	18(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	19(%rcx), %sil
	movb	19(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	20(%rcx), %sil
	movb	20(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	21(%rcx), %sil
	movb	21(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	22(%rcx), %sil
	movb	22(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	23(%rcx), %sil
	movb	23(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	24(%rcx), %sil
	movb	24(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	25(%rcx), %sil
	movb	25(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	26(%rcx), %sil
	movb	26(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	27(%rcx), %sil
	movb	27(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	28(%rcx), %sil
	movb	28(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	29(%rcx), %sil
	movb	29(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	30(%rcx), %sil
	movb	30(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	31(%rcx), %sil
	movb	31(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	32(%rcx), %sil
	movb	32(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	33(%rcx), %sil
	movb	33(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	34(%rcx), %sil
	movb	34(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	35(%rcx), %sil
	movb	35(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	36(%rcx), %sil
	movb	36(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	37(%rcx), %sil
	movb	37(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	38(%rcx), %sil
	movb	38(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	39(%rcx), %sil
	movb	39(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	40(%rcx), %sil
	movb	40(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	41(%rcx), %sil
	movb	41(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	42(%rcx), %sil
	movb	42(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	43(%rcx), %sil
	movb	43(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	44(%rcx), %sil
	movb	44(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	45(%rcx), %sil
	movb	45(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	46(%rcx), %sil
	movb	46(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	47(%rcx), %sil
	movb	47(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	48(%rcx), %sil
	movb	48(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	49(%rcx), %sil
	movb	49(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	50(%rcx), %sil
	movb	50(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	51(%rcx), %sil
	movb	51(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	52(%rcx), %sil
	movb	52(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	53(%rcx), %sil
	movb	53(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	54(%rcx), %sil
	movb	54(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	55(%rcx), %sil
	movb	55(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	56(%rcx), %sil
	movb	56(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	57(%rcx), %sil
	movb	57(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	58(%rcx), %sil
	movb	58(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	59(%rcx), %sil
	movb	59(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	60(%rcx), %sil
	movb	60(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	61(%rcx), %sil
	movb	61(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	62(%rcx), %sil
	movb	62(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	63(%rcx), %sil
	movb	63(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	64(%rcx), %sil
	movb	64(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	65(%rcx), %sil
	movb	65(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	66(%rcx), %sil
	movb	66(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	67(%rcx), %sil
	movb	67(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	68(%rcx), %sil
	movb	68(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	69(%rcx), %sil
	movb	69(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	70(%rcx), %sil
	movb	70(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	71(%rcx), %sil
	movb	71(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	72(%rcx), %sil
	movb	72(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	73(%rcx), %sil
	movb	73(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	74(%rcx), %sil
	movb	74(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	75(%rcx), %sil
	movb	75(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	76(%rcx), %sil
	movb	76(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	77(%rcx), %sil
	movb	77(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	78(%rcx), %sil
	movb	78(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	79(%rcx), %sil
	movb	79(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	80(%rcx), %sil
	movb	80(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	81(%rcx), %sil
	movb	81(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	82(%rcx), %sil
	movb	82(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	83(%rcx), %sil
	movb	83(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	84(%rcx), %sil
	movb	84(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	85(%rcx), %sil
	movb	85(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	86(%rcx), %sil
	movb	86(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	87(%rcx), %sil
	movb	87(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	88(%rcx), %sil
	movb	88(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	89(%rcx), %sil
	movb	89(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	90(%rcx), %sil
	movb	90(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	91(%rcx), %sil
	movb	91(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	92(%rcx), %sil
	movb	92(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	93(%rcx), %sil
	movb	93(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	94(%rcx), %sil
	movb	94(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	95(%rcx), %sil
	movb	95(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	96(%rcx), %sil
	movb	96(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	97(%rcx), %sil
	movb	97(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	98(%rcx), %sil
	movb	98(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	99(%rcx), %sil
	movb	99(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	100(%rcx), %sil
	movb	100(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	101(%rcx), %sil
	movb	101(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	102(%rcx), %sil
	movb	102(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	103(%rcx), %sil
	movb	103(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	104(%rcx), %sil
	movb	104(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	105(%rcx), %sil
	movb	105(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	106(%rcx), %sil
	movb	106(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	107(%rcx), %sil
	movb	107(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	108(%rcx), %sil
	movb	108(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	109(%rcx), %sil
	movb	109(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	110(%rcx), %sil
	movb	110(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	111(%rcx), %sil
	movb	111(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	112(%rcx), %sil
	movb	112(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	113(%rcx), %sil
	movb	113(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	114(%rcx), %sil
	movb	114(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	115(%rcx), %sil
	movb	115(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	116(%rcx), %sil
	movb	116(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	117(%rcx), %sil
	movb	117(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	118(%rcx), %sil
	movb	118(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	119(%rcx), %sil
	movb	119(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	120(%rcx), %sil
	movb	120(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	121(%rcx), %sil
	movb	121(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	122(%rcx), %sil
	movb	122(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	123(%rcx), %sil
	movb	123(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	124(%rcx), %sil
	movb	124(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	125(%rcx), %sil
	movb	125(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	126(%rcx), %sil
	movb	126(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	127(%rcx), %sil
	movb	127(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	128(%rcx), %sil
	movb	128(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	129(%rcx), %sil
	movb	129(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	130(%rcx), %sil
	movb	130(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	131(%rcx), %sil
	movb	131(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	132(%rcx), %sil
	movb	132(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	133(%rcx), %sil
	movb	133(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	134(%rcx), %sil
	movb	134(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	135(%rcx), %sil
	movb	135(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	136(%rcx), %sil
	movb	136(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	137(%rcx), %sil
	movb	137(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	138(%rcx), %sil
	movb	138(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	139(%rcx), %sil
	movb	139(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	140(%rcx), %sil
	movb	140(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	141(%rcx), %sil
	movb	141(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	142(%rcx), %sil
	movb	142(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	143(%rcx), %sil
	movb	143(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	144(%rcx), %sil
	movb	144(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	145(%rcx), %sil
	movb	145(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	146(%rcx), %sil
	movb	146(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	147(%rcx), %sil
	movb	147(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	148(%rcx), %sil
	movb	148(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	149(%rcx), %sil
	movb	149(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	150(%rcx), %sil
	movb	150(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	151(%rcx), %sil
	movb	151(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	152(%rcx), %sil
	movb	152(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	153(%rcx), %sil
	movb	153(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	154(%rcx), %sil
	movb	154(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	155(%rcx), %sil
	movb	155(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	156(%rcx), %sil
	movb	156(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	157(%rcx), %sil
	movb	157(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	158(%rcx), %sil
	movb	158(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	159(%rcx), %sil
	movb	159(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	160(%rcx), %sil
	movb	160(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	161(%rcx), %sil
	movb	161(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	162(%rcx), %sil
	movb	162(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	163(%rcx), %sil
	movb	163(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	164(%rcx), %sil
	movb	164(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	165(%rcx), %sil
	movb	165(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	166(%rcx), %sil
	movb	166(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	167(%rcx), %sil
	movb	167(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	168(%rcx), %sil
	movb	168(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	169(%rcx), %sil
	movb	169(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	170(%rcx), %sil
	movb	170(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	171(%rcx), %sil
	movb	171(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	172(%rcx), %sil
	movb	172(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	173(%rcx), %sil
	movb	173(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	174(%rcx), %sil
	movb	174(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	175(%rcx), %sil
	movb	175(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	176(%rcx), %sil
	movb	176(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	177(%rcx), %sil
	movb	177(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	178(%rcx), %sil
	movb	178(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	179(%rcx), %sil
	movb	179(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	180(%rcx), %sil
	movb	180(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	181(%rcx), %sil
	movb	181(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	182(%rcx), %sil
	movb	182(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	183(%rcx), %sil
	movb	183(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	184(%rcx), %sil
	movb	184(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	185(%rcx), %sil
	movb	185(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	186(%rcx), %sil
	movb	186(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	187(%rcx), %sil
	movb	187(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	188(%rcx), %sil
	movb	188(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	189(%rcx), %sil
	movb	189(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	190(%rcx), %sil
	movb	190(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	191(%rcx), %sil
	movb	191(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	192(%rcx), %sil
	movb	192(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	193(%rcx), %sil
	movb	193(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	194(%rcx), %sil
	movb	194(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	195(%rcx), %sil
	movb	195(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	196(%rcx), %sil
	movb	196(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	197(%rcx), %sil
	movb	197(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	198(%rcx), %sil
	movb	198(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	199(%rcx), %sil
	movb	199(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	200(%rcx), %sil
	movb	200(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	201(%rcx), %sil
	movb	201(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	202(%rcx), %sil
	movb	202(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	203(%rcx), %sil
	movb	203(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	204(%rcx), %sil
	movb	204(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	205(%rcx), %sil
	movb	205(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	206(%rcx), %sil
	movb	206(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	207(%rcx), %sil
	movb	207(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	208(%rcx), %sil
	movb	208(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	209(%rcx), %sil
	movb	209(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	210(%rcx), %sil
	movb	210(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	211(%rcx), %sil
	movb	211(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	212(%rcx), %sil
	movb	212(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	213(%rcx), %sil
	movb	213(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	214(%rcx), %sil
	movb	214(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	215(%rcx), %sil
	movb	215(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	216(%rcx), %sil
	movb	216(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	217(%rcx), %sil
	movb	217(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	218(%rcx), %sil
	movb	218(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	219(%rcx), %sil
	movb	219(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	220(%rcx), %sil
	movb	220(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	221(%rcx), %sil
	movb	221(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	222(%rcx), %sil
	movb	222(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	223(%rcx), %sil
	movb	223(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	224(%rcx), %sil
	movb	224(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	225(%rcx), %sil
	movb	225(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	226(%rcx), %sil
	movb	226(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	227(%rcx), %sil
	movb	227(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	228(%rcx), %sil
	movb	228(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	229(%rcx), %sil
	movb	229(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	230(%rcx), %sil
	movb	230(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	231(%rcx), %sil
	movb	231(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	232(%rcx), %sil
	movb	232(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	233(%rcx), %sil
	movb	233(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	234(%rcx), %sil
	movb	234(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	235(%rcx), %sil
	movb	235(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	236(%rcx), %sil
	movb	236(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	237(%rcx), %sil
	movb	237(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	238(%rcx), %sil
	movb	238(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	239(%rcx), %sil
	movb	239(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	240(%rcx), %sil
	movb	240(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	241(%rcx), %sil
	movb	241(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	242(%rcx), %sil
	movb	242(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	243(%rcx), %sil
	movb	243(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	244(%rcx), %sil
	movb	244(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	245(%rcx), %sil
	movb	245(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	246(%rcx), %sil
	movb	246(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	247(%rcx), %sil
	movb	247(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	248(%rcx), %sil
	movb	248(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	249(%rcx), %sil
	movb	249(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	250(%rcx), %sil
	movb	250(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	251(%rcx), %sil
	movb	251(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	252(%rcx), %sil
	movb	252(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	253(%rcx), %sil
	movb	253(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	254(%rcx), %sil
	movb	254(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	255(%rcx), %sil
	movb	255(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	256(%rcx), %sil
	movb	256(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	257(%rcx), %sil
	movb	257(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	258(%rcx), %sil
	movb	258(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	259(%rcx), %sil
	movb	259(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	260(%rcx), %sil
	movb	260(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	261(%rcx), %sil
	movb	261(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	262(%rcx), %sil
	movb	262(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	263(%rcx), %sil
	movb	263(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	264(%rcx), %sil
	movb	264(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	265(%rcx), %sil
	movb	265(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	266(%rcx), %sil
	movb	266(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	267(%rcx), %sil
	movb	267(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	268(%rcx), %sil
	movb	268(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	269(%rcx), %sil
	movb	269(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	270(%rcx), %sil
	movb	270(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	271(%rcx), %sil
	movb	271(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	272(%rcx), %sil
	movb	272(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	273(%rcx), %sil
	movb	273(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	274(%rcx), %sil
	movb	274(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	275(%rcx), %sil
	movb	275(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	276(%rcx), %sil
	movb	276(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	277(%rcx), %sil
	movb	277(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	278(%rcx), %sil
	movb	278(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	279(%rcx), %sil
	movb	279(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	280(%rcx), %sil
	movb	280(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	281(%rcx), %sil
	movb	281(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	282(%rcx), %sil
	movb	282(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	283(%rcx), %sil
	movb	283(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	284(%rcx), %sil
	movb	284(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	285(%rcx), %sil
	movb	285(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	286(%rcx), %sil
	movb	286(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	287(%rcx), %sil
	movb	287(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	288(%rcx), %sil
	movb	288(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	289(%rcx), %sil
	movb	289(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	290(%rcx), %sil
	movb	290(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	291(%rcx), %sil
	movb	291(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	292(%rcx), %sil
	movb	292(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	293(%rcx), %sil
	movb	293(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	294(%rcx), %sil
	movb	294(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	295(%rcx), %sil
	movb	295(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	296(%rcx), %sil
	movb	296(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	297(%rcx), %sil
	movb	297(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	298(%rcx), %sil
	movb	298(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	299(%rcx), %sil
	movb	299(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	300(%rcx), %sil
	movb	300(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	301(%rcx), %sil
	movb	301(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	302(%rcx), %sil
	movb	302(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	303(%rcx), %sil
	movb	303(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	304(%rcx), %sil
	movb	304(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	305(%rcx), %sil
	movb	305(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	306(%rcx), %sil
	movb	306(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	307(%rcx), %sil
	movb	307(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	308(%rcx), %sil
	movb	308(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	309(%rcx), %sil
	movb	309(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	310(%rcx), %sil
	movb	310(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	311(%rcx), %sil
	movb	311(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	312(%rcx), %sil
	movb	312(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	313(%rcx), %sil
	movb	313(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	314(%rcx), %sil
	movb	314(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	315(%rcx), %sil
	movb	315(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	316(%rcx), %sil
	movb	316(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	317(%rcx), %sil
	movb	317(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	318(%rcx), %sil
	movb	318(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	319(%rcx), %sil
	movb	319(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	320(%rcx), %sil
	movb	320(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	321(%rcx), %sil
	movb	321(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	322(%rcx), %sil
	movb	322(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	323(%rcx), %sil
	movb	323(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	324(%rcx), %sil
	movb	324(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	325(%rcx), %sil
	movb	325(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	326(%rcx), %sil
	movb	326(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	327(%rcx), %sil
	movb	327(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	328(%rcx), %sil
	movb	328(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	329(%rcx), %sil
	movb	329(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	330(%rcx), %sil
	movb	330(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	331(%rcx), %sil
	movb	331(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	332(%rcx), %sil
	movb	332(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	333(%rcx), %sil
	movb	333(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	334(%rcx), %sil
	movb	334(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	335(%rcx), %sil
	movb	335(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	336(%rcx), %sil
	movb	336(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	337(%rcx), %sil
	movb	337(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	338(%rcx), %sil
	movb	338(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	339(%rcx), %sil
	movb	339(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	340(%rcx), %sil
	movb	340(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	341(%rcx), %sil
	movb	341(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	342(%rcx), %sil
	movb	342(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	343(%rcx), %sil
	movb	343(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	344(%rcx), %sil
	movb	344(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	345(%rcx), %sil
	movb	345(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	346(%rcx), %sil
	movb	346(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	347(%rcx), %sil
	movb	347(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	348(%rcx), %sil
	movb	348(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	349(%rcx), %sil
	movb	349(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	350(%rcx), %sil
	movb	350(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	351(%rcx), %sil
	movb	351(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	352(%rcx), %sil
	movb	352(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	353(%rcx), %sil
	movb	353(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	354(%rcx), %sil
	movb	354(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	355(%rcx), %sil
	movb	355(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	356(%rcx), %sil
	movb	356(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	357(%rcx), %sil
	movb	357(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	358(%rcx), %sil
	movb	358(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	359(%rcx), %sil
	movb	359(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	360(%rcx), %sil
	movb	360(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	361(%rcx), %sil
	movb	361(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	362(%rcx), %sil
	movb	362(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	363(%rcx), %sil
	movb	363(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	364(%rcx), %sil
	movb	364(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	365(%rcx), %sil
	movb	365(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	366(%rcx), %sil
	movb	366(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	367(%rcx), %sil
	movb	367(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	368(%rcx), %sil
	movb	368(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	369(%rcx), %sil
	movb	369(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	370(%rcx), %sil
	movb	370(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	371(%rcx), %sil
	movb	371(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	372(%rcx), %sil
	movb	372(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	373(%rcx), %sil
	movb	373(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	374(%rcx), %sil
	movb	374(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	375(%rcx), %sil
	movb	375(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	376(%rcx), %sil
	movb	376(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	377(%rcx), %sil
	movb	377(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	378(%rcx), %sil
	movb	378(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	379(%rcx), %sil
	movb	379(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	380(%rcx), %sil
	movb	380(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	381(%rcx), %sil
	movb	381(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	382(%rcx), %sil
	movb	382(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	383(%rcx), %sil
	movb	383(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	384(%rcx), %sil
	movb	384(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	385(%rcx), %sil
	movb	385(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	386(%rcx), %sil
	movb	386(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	387(%rcx), %sil
	movb	387(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	388(%rcx), %sil
	movb	388(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	389(%rcx), %sil
	movb	389(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	390(%rcx), %sil
	movb	390(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	391(%rcx), %sil
	movb	391(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	392(%rcx), %sil
	movb	392(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	393(%rcx), %sil
	movb	393(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	394(%rcx), %sil
	movb	394(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	395(%rcx), %sil
	movb	395(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	396(%rcx), %sil
	movb	396(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	397(%rcx), %sil
	movb	397(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	398(%rcx), %sil
	movb	398(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	399(%rcx), %sil
	movb	399(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	400(%rcx), %sil
	movb	400(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	401(%rcx), %sil
	movb	401(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	402(%rcx), %sil
	movb	402(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	403(%rcx), %sil
	movb	403(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	404(%rcx), %sil
	movb	404(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	405(%rcx), %sil
	movb	405(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	406(%rcx), %sil
	movb	406(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	407(%rcx), %sil
	movb	407(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	408(%rcx), %sil
	movb	408(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	409(%rcx), %sil
	movb	409(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	410(%rcx), %sil
	movb	410(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	411(%rcx), %sil
	movb	411(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	412(%rcx), %sil
	movb	412(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	413(%rcx), %sil
	movb	413(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	414(%rcx), %sil
	movb	414(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	415(%rcx), %sil
	movb	415(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	416(%rcx), %sil
	movb	416(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	417(%rcx), %sil
	movb	417(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	418(%rcx), %sil
	movb	418(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	419(%rcx), %sil
	movb	419(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	420(%rcx), %sil
	movb	420(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	421(%rcx), %sil
	movb	421(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	422(%rcx), %sil
	movb	422(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	423(%rcx), %sil
	movb	423(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	424(%rcx), %sil
	movb	424(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	425(%rcx), %sil
	movb	425(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	426(%rcx), %sil
	movb	426(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	427(%rcx), %sil
	movb	427(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	428(%rcx), %sil
	movb	428(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	429(%rcx), %sil
	movb	429(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	430(%rcx), %sil
	movb	430(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	431(%rcx), %sil
	movb	431(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	432(%rcx), %sil
	movb	432(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	433(%rcx), %sil
	movb	433(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	434(%rcx), %sil
	movb	434(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	435(%rcx), %sil
	movb	435(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	436(%rcx), %sil
	movb	436(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	437(%rcx), %sil
	movb	437(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	438(%rcx), %sil
	movb	438(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	439(%rcx), %sil
	movb	439(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	440(%rcx), %sil
	movb	440(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	441(%rcx), %sil
	movb	441(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	442(%rcx), %sil
	movb	442(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	443(%rcx), %sil
	movb	443(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	444(%rcx), %sil
	movb	444(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	445(%rcx), %sil
	movb	445(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	446(%rcx), %sil
	movb	446(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	447(%rcx), %sil
	movb	447(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	448(%rcx), %sil
	movb	448(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	449(%rcx), %sil
	movb	449(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	450(%rcx), %sil
	movb	450(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	451(%rcx), %sil
	movb	451(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	452(%rcx), %sil
	movb	452(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	453(%rcx), %sil
	movb	453(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	454(%rcx), %sil
	movb	454(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	455(%rcx), %sil
	movb	455(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	456(%rcx), %sil
	movb	456(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	457(%rcx), %sil
	movb	457(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	458(%rcx), %sil
	movb	458(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	459(%rcx), %sil
	movb	459(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	460(%rcx), %sil
	movb	460(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	461(%rcx), %sil
	movb	461(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	462(%rcx), %sil
	movb	462(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	463(%rcx), %sil
	movb	463(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	464(%rcx), %sil
	movb	464(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	465(%rcx), %sil
	movb	465(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	466(%rcx), %sil
	movb	466(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	467(%rcx), %sil
	movb	467(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	468(%rcx), %sil
	movb	468(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	469(%rcx), %sil
	movb	469(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	470(%rcx), %sil
	movb	470(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	471(%rcx), %sil
	movb	471(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	472(%rcx), %sil
	movb	472(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	473(%rcx), %sil
	movb	473(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	474(%rcx), %sil
	movb	474(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	475(%rcx), %sil
	movb	475(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	476(%rcx), %sil
	movb	476(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	477(%rcx), %sil
	movb	477(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	478(%rcx), %sil
	movb	478(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	479(%rcx), %sil
	movb	479(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	480(%rcx), %sil
	movb	480(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	481(%rcx), %sil
	movb	481(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	482(%rcx), %sil
	movb	482(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	483(%rcx), %sil
	movb	483(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	484(%rcx), %sil
	movb	484(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	485(%rcx), %sil
	movb	485(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	486(%rcx), %sil
	movb	486(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	487(%rcx), %sil
	movb	487(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	488(%rcx), %sil
	movb	488(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	489(%rcx), %sil
	movb	489(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	490(%rcx), %sil
	movb	490(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	491(%rcx), %sil
	movb	491(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	492(%rcx), %sil
	movb	492(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	493(%rcx), %sil
	movb	493(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	494(%rcx), %sil
	movb	494(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	495(%rcx), %sil
	movb	495(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	496(%rcx), %sil
	movb	496(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	497(%rcx), %sil
	movb	497(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	498(%rcx), %sil
	movb	498(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	499(%rcx), %sil
	movb	499(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	500(%rcx), %sil
	movb	500(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	501(%rcx), %sil
	movb	501(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	502(%rcx), %sil
	movb	502(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	503(%rcx), %sil
	movb	503(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	504(%rcx), %sil
	movb	504(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	505(%rcx), %sil
	movb	505(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	506(%rcx), %sil
	movb	506(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	507(%rcx), %sil
	movb	507(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	508(%rcx), %sil
	movb	508(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	509(%rcx), %sil
	movb	509(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	510(%rcx), %sil
	movb	510(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	511(%rcx), %sil
	movb	511(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	512(%rcx), %sil
	movb	512(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	513(%rcx), %sil
	movb	513(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	514(%rcx), %sil
	movb	514(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	515(%rcx), %sil
	movb	515(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	516(%rcx), %sil
	movb	516(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	517(%rcx), %sil
	movb	517(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	518(%rcx), %sil
	movb	518(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	519(%rcx), %sil
	movb	519(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	520(%rcx), %sil
	movb	520(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	521(%rcx), %sil
	movb	521(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	522(%rcx), %sil
	movb	522(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	523(%rcx), %sil
	movb	523(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	524(%rcx), %sil
	movb	524(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	525(%rcx), %sil
	movb	525(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	526(%rcx), %sil
	movb	526(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	527(%rcx), %sil
	movb	527(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	528(%rcx), %sil
	movb	528(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	529(%rcx), %sil
	movb	529(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	530(%rcx), %sil
	movb	530(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	531(%rcx), %sil
	movb	531(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	532(%rcx), %sil
	movb	532(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	533(%rcx), %sil
	movb	533(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	534(%rcx), %sil
	movb	534(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	535(%rcx), %sil
	movb	535(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	536(%rcx), %sil
	movb	536(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	537(%rcx), %sil
	movb	537(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	538(%rcx), %sil
	movb	538(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	539(%rcx), %sil
	movb	539(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	540(%rcx), %sil
	movb	540(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	541(%rcx), %sil
	movb	541(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	542(%rcx), %sil
	movb	542(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	543(%rcx), %sil
	movb	543(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	544(%rcx), %sil
	movb	544(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	545(%rcx), %sil
	movb	545(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	546(%rcx), %sil
	movb	546(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	547(%rcx), %sil
	movb	547(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	548(%rcx), %sil
	movb	548(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	549(%rcx), %sil
	movb	549(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	550(%rcx), %sil
	movb	550(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	551(%rcx), %sil
	movb	551(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	552(%rcx), %sil
	movb	552(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	553(%rcx), %sil
	movb	553(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	554(%rcx), %sil
	movb	554(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	555(%rcx), %sil
	movb	555(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	556(%rcx), %sil
	movb	556(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	557(%rcx), %sil
	movb	557(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	558(%rcx), %sil
	movb	558(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	559(%rcx), %sil
	movb	559(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	560(%rcx), %sil
	movb	560(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	561(%rcx), %sil
	movb	561(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	562(%rcx), %sil
	movb	562(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	563(%rcx), %sil
	movb	563(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	564(%rcx), %sil
	movb	564(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	565(%rcx), %sil
	movb	565(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	566(%rcx), %sil
	movb	566(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	567(%rcx), %sil
	movb	567(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	568(%rcx), %sil
	movb	568(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	569(%rcx), %sil
	movb	569(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	570(%rcx), %sil
	movb	570(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	571(%rcx), %sil
	movb	571(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	572(%rcx), %sil
	movb	572(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	573(%rcx), %sil
	movb	573(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	574(%rcx), %sil
	movb	574(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	575(%rcx), %sil
	movb	575(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	576(%rcx), %sil
	movb	576(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	577(%rcx), %sil
	movb	577(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	578(%rcx), %sil
	movb	578(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	579(%rcx), %sil
	movb	579(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	580(%rcx), %sil
	movb	580(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	581(%rcx), %sil
	movb	581(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	582(%rcx), %sil
	movb	582(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	583(%rcx), %sil
	movb	583(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	584(%rcx), %sil
	movb	584(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	585(%rcx), %sil
	movb	585(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	586(%rcx), %sil
	movb	586(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	587(%rcx), %sil
	movb	587(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	588(%rcx), %sil
	movb	588(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	589(%rcx), %sil
	movb	589(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	590(%rcx), %sil
	movb	590(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	591(%rcx), %sil
	movb	591(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	592(%rcx), %sil
	movb	592(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	593(%rcx), %sil
	movb	593(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	594(%rcx), %sil
	movb	594(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	595(%rcx), %sil
	movb	595(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	596(%rcx), %sil
	movb	596(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	597(%rcx), %sil
	movb	597(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	598(%rcx), %sil
	movb	598(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	599(%rcx), %sil
	movb	599(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	600(%rcx), %sil
	movb	600(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	601(%rcx), %sil
	movb	601(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	602(%rcx), %sil
	movb	602(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	603(%rcx), %sil
	movb	603(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	604(%rcx), %sil
	movb	604(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	605(%rcx), %sil
	movb	605(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	606(%rcx), %sil
	movb	606(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	607(%rcx), %sil
	movb	607(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	608(%rcx), %sil
	movb	608(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	609(%rcx), %sil
	movb	609(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	610(%rcx), %sil
	movb	610(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	611(%rcx), %sil
	movb	611(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	612(%rcx), %sil
	movb	612(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	613(%rcx), %sil
	movb	613(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	614(%rcx), %sil
	movb	614(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	615(%rcx), %sil
	movb	615(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	616(%rcx), %sil
	movb	616(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	617(%rcx), %sil
	movb	617(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	618(%rcx), %sil
	movb	618(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	619(%rcx), %sil
	movb	619(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	620(%rcx), %sil
	movb	620(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	621(%rcx), %sil
	movb	621(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	622(%rcx), %sil
	movb	622(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	623(%rcx), %sil
	movb	623(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	624(%rcx), %sil
	movb	624(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	625(%rcx), %sil
	movb	625(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	626(%rcx), %sil
	movb	626(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	627(%rcx), %sil
	movb	627(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	628(%rcx), %sil
	movb	628(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	629(%rcx), %sil
	movb	629(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	630(%rcx), %sil
	movb	630(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	631(%rcx), %sil
	movb	631(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	632(%rcx), %sil
	movb	632(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	633(%rcx), %sil
	movb	633(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	634(%rcx), %sil
	movb	634(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	635(%rcx), %sil
	movb	635(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	636(%rcx), %sil
	movb	636(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	637(%rcx), %sil
	movb	637(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	638(%rcx), %sil
	movb	638(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	639(%rcx), %sil
	movb	639(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	640(%rcx), %sil
	movb	640(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	641(%rcx), %sil
	movb	641(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	642(%rcx), %sil
	movb	642(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	643(%rcx), %sil
	movb	643(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	644(%rcx), %sil
	movb	644(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	645(%rcx), %sil
	movb	645(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	646(%rcx), %sil
	movb	646(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	647(%rcx), %sil
	movb	647(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	648(%rcx), %sil
	movb	648(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	649(%rcx), %sil
	movb	649(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	650(%rcx), %sil
	movb	650(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	651(%rcx), %sil
	movb	651(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	652(%rcx), %sil
	movb	652(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	653(%rcx), %sil
	movb	653(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	654(%rcx), %sil
	movb	654(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	655(%rcx), %sil
	movb	655(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	656(%rcx), %sil
	movb	656(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	657(%rcx), %sil
	movb	657(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	658(%rcx), %sil
	movb	658(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	659(%rcx), %sil
	movb	659(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	660(%rcx), %sil
	movb	660(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	661(%rcx), %sil
	movb	661(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	662(%rcx), %sil
	movb	662(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	663(%rcx), %sil
	movb	663(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	664(%rcx), %sil
	movb	664(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	665(%rcx), %sil
	movb	665(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	666(%rcx), %sil
	movb	666(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	667(%rcx), %sil
	movb	667(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	668(%rcx), %sil
	movb	668(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	669(%rcx), %sil
	movb	669(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	670(%rcx), %sil
	movb	670(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	671(%rcx), %sil
	movb	671(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	672(%rcx), %sil
	movb	672(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	673(%rcx), %sil
	movb	673(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	674(%rcx), %sil
	movb	674(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	675(%rcx), %sil
	movb	675(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	676(%rcx), %sil
	movb	676(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	677(%rcx), %sil
	movb	677(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	678(%rcx), %sil
	movb	678(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	679(%rcx), %sil
	movb	679(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	680(%rcx), %sil
	movb	680(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	681(%rcx), %sil
	movb	681(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	682(%rcx), %sil
	movb	682(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	683(%rcx), %sil
	movb	683(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	684(%rcx), %sil
	movb	684(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	685(%rcx), %sil
	movb	685(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	686(%rcx), %sil
	movb	686(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	687(%rcx), %sil
	movb	687(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	688(%rcx), %sil
	movb	688(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	689(%rcx), %sil
	movb	689(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	690(%rcx), %sil
	movb	690(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	691(%rcx), %sil
	movb	691(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	692(%rcx), %sil
	movb	692(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	693(%rcx), %sil
	movb	693(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	694(%rcx), %sil
	movb	694(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	695(%rcx), %sil
	movb	695(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	696(%rcx), %sil
	movb	696(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	697(%rcx), %sil
	movb	697(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	698(%rcx), %sil
	movb	698(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	699(%rcx), %sil
	movb	699(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	700(%rcx), %sil
	movb	700(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	701(%rcx), %sil
	movb	701(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	702(%rcx), %sil
	movb	702(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	703(%rcx), %sil
	movb	703(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	704(%rcx), %sil
	movb	704(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	705(%rcx), %sil
	movb	705(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	706(%rcx), %sil
	movb	706(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	707(%rcx), %sil
	movb	707(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	708(%rcx), %sil
	movb	708(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	709(%rcx), %sil
	movb	709(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	710(%rcx), %sil
	movb	710(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	711(%rcx), %sil
	movb	711(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	712(%rcx), %sil
	movb	712(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	713(%rcx), %sil
	movb	713(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	714(%rcx), %sil
	movb	714(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	715(%rcx), %sil
	movb	715(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	716(%rcx), %sil
	movb	716(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	717(%rcx), %sil
	movb	717(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	718(%rcx), %sil
	movb	718(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	719(%rcx), %sil
	movb	719(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	720(%rcx), %sil
	movb	720(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	721(%rcx), %sil
	movb	721(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	722(%rcx), %sil
	movb	722(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	723(%rcx), %sil
	movb	723(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	724(%rcx), %sil
	movb	724(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	725(%rcx), %sil
	movb	725(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	726(%rcx), %sil
	movb	726(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	727(%rcx), %sil
	movb	727(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	728(%rcx), %sil
	movb	728(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	729(%rcx), %sil
	movb	729(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	730(%rcx), %sil
	movb	730(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	731(%rcx), %sil
	movb	731(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	732(%rcx), %sil
	movb	732(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	733(%rcx), %sil
	movb	733(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	734(%rcx), %sil
	movb	734(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	735(%rcx), %sil
	movb	735(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	736(%rcx), %sil
	movb	736(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	737(%rcx), %sil
	movb	737(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	738(%rcx), %sil
	movb	738(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	739(%rcx), %sil
	movb	739(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	740(%rcx), %sil
	movb	740(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	741(%rcx), %sil
	movb	741(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	742(%rcx), %sil
	movb	742(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	743(%rcx), %sil
	movb	743(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	744(%rcx), %sil
	movb	744(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	745(%rcx), %sil
	movb	745(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	746(%rcx), %sil
	movb	746(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	747(%rcx), %sil
	movb	747(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	748(%rcx), %sil
	movb	748(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	749(%rcx), %sil
	movb	749(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	750(%rcx), %sil
	movb	750(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	751(%rcx), %sil
	movb	751(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	752(%rcx), %sil
	movb	752(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	753(%rcx), %sil
	movb	753(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	754(%rcx), %sil
	movb	754(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	755(%rcx), %sil
	movb	755(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	756(%rcx), %sil
	movb	756(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	757(%rcx), %sil
	movb	757(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	758(%rcx), %sil
	movb	758(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	759(%rcx), %sil
	movb	759(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	760(%rcx), %sil
	movb	760(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	761(%rcx), %sil
	movb	761(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	762(%rcx), %sil
	movb	762(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	763(%rcx), %sil
	movb	763(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	764(%rcx), %sil
	movb	764(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	765(%rcx), %sil
	movb	765(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	766(%rcx), %sil
	movb	766(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	767(%rcx), %sil
	movb	767(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	768(%rcx), %sil
	movb	768(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	769(%rcx), %sil
	movb	769(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	770(%rcx), %sil
	movb	770(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	771(%rcx), %sil
	movb	771(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	772(%rcx), %sil
	movb	772(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	773(%rcx), %sil
	movb	773(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	774(%rcx), %sil
	movb	774(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	775(%rcx), %sil
	movb	775(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	776(%rcx), %sil
	movb	776(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	777(%rcx), %sil
	movb	777(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	778(%rcx), %sil
	movb	778(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	779(%rcx), %sil
	movb	779(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	780(%rcx), %sil
	movb	780(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	781(%rcx), %sil
	movb	781(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	782(%rcx), %sil
	movb	782(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	783(%rcx), %sil
	movb	783(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	784(%rcx), %sil
	movb	784(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	785(%rcx), %sil
	movb	785(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	786(%rcx), %sil
	movb	786(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	787(%rcx), %sil
	movb	787(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	788(%rcx), %sil
	movb	788(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	789(%rcx), %sil
	movb	789(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	790(%rcx), %sil
	movb	790(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	791(%rcx), %sil
	movb	791(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	792(%rcx), %sil
	movb	792(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	793(%rcx), %sil
	movb	793(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	794(%rcx), %sil
	movb	794(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	795(%rcx), %sil
	movb	795(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	796(%rcx), %sil
	movb	796(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	797(%rcx), %sil
	movb	797(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	798(%rcx), %sil
	movb	798(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	799(%rcx), %sil
	movb	799(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	800(%rcx), %sil
	movb	800(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	801(%rcx), %sil
	movb	801(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	802(%rcx), %sil
	movb	802(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	803(%rcx), %sil
	movb	803(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	804(%rcx), %sil
	movb	804(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	805(%rcx), %sil
	movb	805(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	806(%rcx), %sil
	movb	806(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	807(%rcx), %sil
	movb	807(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	808(%rcx), %sil
	movb	808(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	809(%rcx), %sil
	movb	809(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	810(%rcx), %sil
	movb	810(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	811(%rcx), %sil
	movb	811(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	812(%rcx), %sil
	movb	812(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	813(%rcx), %sil
	movb	813(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	814(%rcx), %sil
	movb	814(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	815(%rcx), %sil
	movb	815(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	816(%rcx), %sil
	movb	816(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	817(%rcx), %sil
	movb	817(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	818(%rcx), %sil
	movb	818(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	819(%rcx), %sil
	movb	819(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	820(%rcx), %sil
	movb	820(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	821(%rcx), %sil
	movb	821(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	822(%rcx), %sil
	movb	822(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	823(%rcx), %sil
	movb	823(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	824(%rcx), %sil
	movb	824(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	825(%rcx), %sil
	movb	825(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	826(%rcx), %sil
	movb	826(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	827(%rcx), %sil
	movb	827(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	828(%rcx), %sil
	movb	828(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	829(%rcx), %sil
	movb	829(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	830(%rcx), %sil
	movb	830(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	831(%rcx), %sil
	movb	831(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	832(%rcx), %sil
	movb	832(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	833(%rcx), %sil
	movb	833(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	834(%rcx), %sil
	movb	834(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	835(%rcx), %sil
	movb	835(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	836(%rcx), %sil
	movb	836(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	837(%rcx), %sil
	movb	837(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	838(%rcx), %sil
	movb	838(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	839(%rcx), %sil
	movb	839(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	840(%rcx), %sil
	movb	840(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	841(%rcx), %sil
	movb	841(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	842(%rcx), %sil
	movb	842(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	843(%rcx), %sil
	movb	843(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	844(%rcx), %sil
	movb	844(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	845(%rcx), %sil
	movb	845(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	846(%rcx), %sil
	movb	846(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	847(%rcx), %sil
	movb	847(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	848(%rcx), %sil
	movb	848(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	849(%rcx), %sil
	movb	849(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	850(%rcx), %sil
	movb	850(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	851(%rcx), %sil
	movb	851(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	852(%rcx), %sil
	movb	852(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	853(%rcx), %sil
	movb	853(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	854(%rcx), %sil
	movb	854(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	855(%rcx), %sil
	movb	855(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	856(%rcx), %sil
	movb	856(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	857(%rcx), %sil
	movb	857(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	858(%rcx), %sil
	movb	858(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	859(%rcx), %sil
	movb	859(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	860(%rcx), %sil
	movb	860(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	861(%rcx), %sil
	movb	861(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	862(%rcx), %sil
	movb	862(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	863(%rcx), %sil
	movb	863(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	864(%rcx), %sil
	movb	864(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	865(%rcx), %sil
	movb	865(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	866(%rcx), %sil
	movb	866(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	867(%rcx), %sil
	movb	867(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	868(%rcx), %sil
	movb	868(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	869(%rcx), %sil
	movb	869(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	870(%rcx), %sil
	movb	870(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	871(%rcx), %sil
	movb	871(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	872(%rcx), %sil
	movb	872(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	873(%rcx), %sil
	movb	873(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	874(%rcx), %sil
	movb	874(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	875(%rcx), %sil
	movb	875(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	876(%rcx), %sil
	movb	876(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	877(%rcx), %sil
	movb	877(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	878(%rcx), %sil
	movb	878(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	879(%rcx), %sil
	movb	879(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	880(%rcx), %sil
	movb	880(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	881(%rcx), %sil
	movb	881(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	882(%rcx), %sil
	movb	882(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	883(%rcx), %sil
	movb	883(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	884(%rcx), %sil
	movb	884(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	885(%rcx), %sil
	movb	885(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	886(%rcx), %sil
	movb	886(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	887(%rcx), %sil
	movb	887(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	888(%rcx), %sil
	movb	888(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	889(%rcx), %sil
	movb	889(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	890(%rcx), %sil
	movb	890(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	891(%rcx), %sil
	movb	891(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	892(%rcx), %sil
	movb	892(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	893(%rcx), %sil
	movb	893(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	894(%rcx), %sil
	movb	894(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	895(%rcx), %sil
	movb	895(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	896(%rcx), %sil
	movb	896(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	897(%rcx), %sil
	movb	897(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	898(%rcx), %sil
	movb	898(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	899(%rcx), %sil
	movb	899(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	900(%rcx), %sil
	movb	900(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	901(%rcx), %sil
	movb	901(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	902(%rcx), %sil
	movb	902(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	903(%rcx), %sil
	movb	903(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	904(%rcx), %sil
	movb	904(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	905(%rcx), %sil
	movb	905(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	906(%rcx), %sil
	movb	906(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	907(%rcx), %sil
	movb	907(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	908(%rcx), %sil
	movb	908(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	909(%rcx), %sil
	movb	909(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	910(%rcx), %sil
	movb	910(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	911(%rcx), %sil
	movb	911(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	912(%rcx), %sil
	movb	912(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	913(%rcx), %sil
	movb	913(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	914(%rcx), %sil
	movb	914(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	915(%rcx), %sil
	movb	915(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	916(%rcx), %sil
	movb	916(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	917(%rcx), %sil
	movb	917(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	918(%rcx), %sil
	movb	918(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	919(%rcx), %sil
	movb	919(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	920(%rcx), %sil
	movb	920(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	921(%rcx), %sil
	movb	921(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	922(%rcx), %sil
	movb	922(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	923(%rcx), %sil
	movb	923(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	924(%rcx), %sil
	movb	924(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	925(%rcx), %sil
	movb	925(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	926(%rcx), %sil
	movb	926(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	927(%rcx), %sil
	movb	927(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	928(%rcx), %sil
	movb	928(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	929(%rcx), %sil
	movb	929(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	930(%rcx), %sil
	movb	930(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	931(%rcx), %sil
	movb	931(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	932(%rcx), %sil
	movb	932(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	933(%rcx), %sil
	movb	933(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	934(%rcx), %sil
	movb	934(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	935(%rcx), %sil
	movb	935(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	936(%rcx), %sil
	movb	936(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	937(%rcx), %sil
	movb	937(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	938(%rcx), %sil
	movb	938(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	939(%rcx), %sil
	movb	939(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	940(%rcx), %sil
	movb	940(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	941(%rcx), %sil
	movb	941(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	942(%rcx), %sil
	movb	942(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	943(%rcx), %sil
	movb	943(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	944(%rcx), %sil
	movb	944(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	945(%rcx), %sil
	movb	945(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	946(%rcx), %sil
	movb	946(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	947(%rcx), %sil
	movb	947(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	948(%rcx), %sil
	movb	948(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	949(%rcx), %sil
	movb	949(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	950(%rcx), %sil
	movb	950(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	951(%rcx), %sil
	movb	951(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	952(%rcx), %sil
	movb	952(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	953(%rcx), %sil
	movb	953(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	954(%rcx), %sil
	movb	954(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	955(%rcx), %sil
	movb	955(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	956(%rcx), %sil
	movb	956(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	957(%rcx), %sil
	movb	957(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	958(%rcx), %sil
	movb	958(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	959(%rcx), %sil
	movb	959(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	960(%rcx), %sil
	movb	960(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	961(%rcx), %sil
	movb	961(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	962(%rcx), %sil
	movb	962(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	963(%rcx), %sil
	movb	963(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	964(%rcx), %sil
	movb	964(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	965(%rcx), %sil
	movb	965(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	966(%rcx), %sil
	movb	966(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	967(%rcx), %sil
	movb	967(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	968(%rcx), %sil
	movb	968(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	969(%rcx), %sil
	movb	969(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	970(%rcx), %sil
	movb	970(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	971(%rcx), %sil
	movb	971(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	972(%rcx), %sil
	movb	972(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	973(%rcx), %sil
	movb	973(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	974(%rcx), %sil
	movb	974(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	975(%rcx), %sil
	movb	975(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	976(%rcx), %sil
	movb	976(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	977(%rcx), %sil
	movb	977(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	978(%rcx), %sil
	movb	978(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	979(%rcx), %sil
	movb	979(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	980(%rcx), %sil
	movb	980(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	981(%rcx), %sil
	movb	981(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	982(%rcx), %sil
	movb	982(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	983(%rcx), %sil
	movb	983(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	984(%rcx), %sil
	movb	984(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	985(%rcx), %sil
	movb	985(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	986(%rcx), %sil
	movb	986(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	987(%rcx), %sil
	movb	987(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	988(%rcx), %sil
	movb	988(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	989(%rcx), %sil
	movb	989(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	990(%rcx), %sil
	movb	990(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	991(%rcx), %sil
	movb	991(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	992(%rcx), %sil
	movb	992(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	993(%rcx), %sil
	movb	993(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	994(%rcx), %sil
	movb	994(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	995(%rcx), %sil
	movb	995(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	996(%rcx), %sil
	movb	996(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	997(%rcx), %sil
	movb	997(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	998(%rcx), %sil
	movb	998(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	999(%rcx), %sil
	movb	999(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1000(%rcx), %sil
	movb	1000(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1001(%rcx), %sil
	movb	1001(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1002(%rcx), %sil
	movb	1002(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1003(%rcx), %sil
	movb	1003(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1004(%rcx), %sil
	movb	1004(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1005(%rcx), %sil
	movb	1005(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1006(%rcx), %sil
	movb	1006(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1007(%rcx), %sil
	movb	1007(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1008(%rcx), %sil
	movb	1008(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1009(%rcx), %sil
	movb	1009(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1010(%rcx), %sil
	movb	1010(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1011(%rcx), %sil
	movb	1011(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1012(%rcx), %sil
	movb	1012(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1013(%rcx), %sil
	movb	1013(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1014(%rcx), %sil
	movb	1014(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1015(%rcx), %sil
	movb	1015(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1016(%rcx), %sil
	movb	1016(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1017(%rcx), %sil
	movb	1017(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1018(%rcx), %sil
	movb	1018(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1019(%rcx), %sil
	movb	1019(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1020(%rcx), %sil
	movb	1020(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1021(%rcx), %sil
	movb	1021(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1022(%rcx), %sil
	movb	1022(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1023(%rcx), %sil
	movb	1023(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1024(%rcx), %sil
	movb	1024(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1025(%rcx), %sil
	movb	1025(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1026(%rcx), %sil
	movb	1026(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1027(%rcx), %sil
	movb	1027(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1028(%rcx), %sil
	movb	1028(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1029(%rcx), %sil
	movb	1029(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1030(%rcx), %sil
	movb	1030(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1031(%rcx), %sil
	movb	1031(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1032(%rcx), %sil
	movb	1032(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1033(%rcx), %sil
	movb	1033(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1034(%rcx), %sil
	movb	1034(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1035(%rcx), %sil
	movb	1035(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1036(%rcx), %sil
	movb	1036(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1037(%rcx), %sil
	movb	1037(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1038(%rcx), %sil
	movb	1038(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1039(%rcx), %sil
	movb	1039(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1040(%rcx), %sil
	movb	1040(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1041(%rcx), %sil
	movb	1041(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1042(%rcx), %sil
	movb	1042(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1043(%rcx), %sil
	movb	1043(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1044(%rcx), %sil
	movb	1044(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1045(%rcx), %sil
	movb	1045(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1046(%rcx), %sil
	movb	1046(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1047(%rcx), %sil
	movb	1047(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1048(%rcx), %sil
	movb	1048(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1049(%rcx), %sil
	movb	1049(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1050(%rcx), %sil
	movb	1050(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1051(%rcx), %sil
	movb	1051(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1052(%rcx), %sil
	movb	1052(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1053(%rcx), %sil
	movb	1053(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1054(%rcx), %sil
	movb	1054(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1055(%rcx), %sil
	movb	1055(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1056(%rcx), %sil
	movb	1056(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1057(%rcx), %sil
	movb	1057(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1058(%rcx), %sil
	movb	1058(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1059(%rcx), %sil
	movb	1059(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1060(%rcx), %sil
	movb	1060(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1061(%rcx), %sil
	movb	1061(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1062(%rcx), %sil
	movb	1062(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1063(%rcx), %sil
	movb	1063(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1064(%rcx), %sil
	movb	1064(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1065(%rcx), %sil
	movb	1065(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1066(%rcx), %sil
	movb	1066(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1067(%rcx), %sil
	movb	1067(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1068(%rcx), %sil
	movb	1068(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1069(%rcx), %sil
	movb	1069(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1070(%rcx), %sil
	movb	1070(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1071(%rcx), %sil
	movb	1071(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1072(%rcx), %sil
	movb	1072(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1073(%rcx), %sil
	movb	1073(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1074(%rcx), %sil
	movb	1074(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1075(%rcx), %sil
	movb	1075(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1076(%rcx), %sil
	movb	1076(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1077(%rcx), %sil
	movb	1077(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1078(%rcx), %sil
	movb	1078(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1079(%rcx), %sil
	movb	1079(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1080(%rcx), %sil
	movb	1080(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1081(%rcx), %sil
	movb	1081(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1082(%rcx), %sil
	movb	1082(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1083(%rcx), %sil
	movb	1083(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1084(%rcx), %sil
	movb	1084(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1085(%rcx), %sil
	movb	1085(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1086(%rcx), %sil
	movb	1086(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1087(%rcx), %sil
	movb	1087(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rax
	orq 	%rax, %rdx
	negq	%rdx
	shrq	$63, %rdx
	movq	%rdx, %mm1
	movq	8(%rsp), %rcx
	movq	(%rsp), %rax
	leaq	4072(%rsp), %rdx
	leaq	-232(%rsp), %rsp
	call	L_shake256_A32__A1120$1
Ljade_kem_mlkem_mlkem768_amd64_ref_dec$1:
	leaq	232(%rsp), %rsp
	movq	%mm1, %rdx
	leaq	184(%rsp), %rax
	negq	%rdx
	movb	(%rcx), %dil
	movb	(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, (%rcx)
	movb	1(%rcx), %dil
	movb	1(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 1(%rcx)
	movb	2(%rcx), %dil
	movb	2(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 2(%rcx)
	movb	3(%rcx), %dil
	movb	3(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 3(%rcx)
	movb	4(%rcx), %dil
	movb	4(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 4(%rcx)
	movb	5(%rcx), %dil
	movb	5(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 5(%rcx)
	movb	6(%rcx), %dil
	movb	6(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 6(%rcx)
	movb	7(%rcx), %dil
	movb	7(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 7(%rcx)
	movb	8(%rcx), %dil
	movb	8(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 8(%rcx)
	movb	9(%rcx), %dil
	movb	9(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 9(%rcx)
	movb	10(%rcx), %dil
	movb	10(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 10(%rcx)
	movb	11(%rcx), %dil
	movb	11(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 11(%rcx)
	movb	12(%rcx), %dil
	movb	12(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 12(%rcx)
	movb	13(%rcx), %dil
	movb	13(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 13(%rcx)
	movb	14(%rcx), %dil
	movb	14(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 14(%rcx)
	movb	15(%rcx), %dil
	movb	15(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 15(%rcx)
	movb	16(%rcx), %dil
	movb	16(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 16(%rcx)
	movb	17(%rcx), %dil
	movb	17(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 17(%rcx)
	movb	18(%rcx), %dil
	movb	18(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 18(%rcx)
	movb	19(%rcx), %dil
	movb	19(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 19(%rcx)
	movb	20(%rcx), %dil
	movb	20(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 20(%rcx)
	movb	21(%rcx), %dil
	movb	21(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 21(%rcx)
	movb	22(%rcx), %dil
	movb	22(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 22(%rcx)
	movb	23(%rcx), %dil
	movb	23(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 23(%rcx)
	movb	24(%rcx), %dil
	movb	24(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 24(%rcx)
	movb	25(%rcx), %dil
	movb	25(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 25(%rcx)
	movb	26(%rcx), %dil
	movb	26(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 26(%rcx)
	movb	27(%rcx), %dil
	movb	27(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 27(%rcx)
	movb	28(%rcx), %dil
	movb	28(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 28(%rcx)
	movb	29(%rcx), %dil
	movb	29(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 29(%rcx)
	movb	30(%rcx), %dil
	movb	30(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 30(%rcx)
	movb	31(%rcx), %dil
	movb	31(%rax), %sil
	xorb	%sil, %dil
	andb	%dl, %dil
	xorb	%dil, %sil
	movb	%sil, 31(%rcx)
	movq	%mm0, %rsi
	movq	16(%rsp), %rax
	movq	%rax, (%rsi)
	movq	24(%rsp), %rax
	movq	%rax, 8(%rsi)
	movq	32(%rsp), %rax
	movq	%rax, 16(%rsi)
	movq	40(%rsp), %rax
	movq	%rax, 24(%rsi)
	xorl	%eax, %eax
	movq	17992(%rsp), %rbx
	movq	18000(%rsp), %rbp
	movq	18008(%rsp), %r12
	movq	18016(%rsp), %r13
	movq	18024(%rsp), %r14
	movq	18032(%rsp), %r15
	movq	18040(%rsp), %rsp
	ret
	.type	_jade_kem_mlkem_mlkem768_amd64_ref_enc, %function
	.type	jade_kem_mlkem_mlkem768_amd64_ref_enc, %function
_jade_kem_mlkem_mlkem768_amd64_ref_enc:
jade_kem_mlkem_mlkem768_amd64_ref_enc:
	movq	%rsp, %rax
	leaq	-15744(%rsp), %rsp
	andq	$-16, %rsp
	movq	%rbx, 15688(%rsp)
	movq	%rbp, 15696(%rsp)
	movq	%r12, 15704(%rsp)
	movq	%r13, 15712(%rsp)
	movq	%r14, 15720(%rsp)
	movq	%r15, 15728(%rsp)
	movq	%rax, 15736(%rsp)
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%rdx, %r12
	leaq	16(%rsp), %rdi
	movq	$32, %rsi
	call	__jasmin_syscall_randombytes__
	leaq	16(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	%rbx, %mm0
	movq	%rbp, %mm1
	movq	(%r12), %rax
	movq	%rax, 1704(%rsp)
	movq	8(%r12), %rax
	movq	%rax, 1712(%rsp)
	movq	16(%r12), %rax
	movq	%rax, 1720(%rsp)
	movq	24(%r12), %rax
	movq	%rax, 1728(%rsp)
	movq	32(%r12), %rax
	movq	%rax, 1736(%rsp)
	movq	40(%r12), %rax
	movq	%rax, 1744(%rsp)
	movq	48(%r12), %rax
	movq	%rax, 1752(%rsp)
	movq	56(%r12), %rax
	movq	%rax, 1760(%rsp)
	movq	64(%r12), %rax
	movq	%rax, 1768(%rsp)
	movq	72(%r12), %rax
	movq	%rax, 1776(%rsp)
	movq	80(%r12), %rax
	movq	%rax, 1784(%rsp)
	movq	88(%r12), %rax
	movq	%rax, 1792(%rsp)
	movq	96(%r12), %rax
	movq	%rax, 1800(%rsp)
	movq	104(%r12), %rax
	movq	%rax, 1808(%rsp)
	movq	112(%r12), %rax
	movq	%rax, 1816(%rsp)
	movq	120(%r12), %rax
	movq	%rax, 1824(%rsp)
	movq	128(%r12), %rax
	movq	%rax, 1832(%rsp)
	movq	136(%r12), %rax
	movq	%rax, 1840(%rsp)
	movq	144(%r12), %rax
	movq	%rax, 1848(%rsp)
	movq	152(%r12), %rax
	movq	%rax, 1856(%rsp)
	movq	160(%r12), %rax
	movq	%rax, 1864(%rsp)
	movq	168(%r12), %rax
	movq	%rax, 1872(%rsp)
	movq	176(%r12), %rax
	movq	%rax, 1880(%rsp)
	movq	184(%r12), %rax
	movq	%rax, 1888(%rsp)
	movq	192(%r12), %rax
	movq	%rax, 1896(%rsp)
	movq	200(%r12), %rax
	movq	%rax, 1904(%rsp)
	movq	208(%r12), %rax
	movq	%rax, 1912(%rsp)
	movq	216(%r12), %rax
	movq	%rax, 1920(%rsp)
	movq	224(%r12), %rax
	movq	%rax, 1928(%rsp)
	movq	232(%r12), %rax
	movq	%rax, 1936(%rsp)
	movq	240(%r12), %rax
	movq	%rax, 1944(%rsp)
	movq	248(%r12), %rax
	movq	%rax, 1952(%rsp)
	movq	256(%r12), %rax
	movq	%rax, 1960(%rsp)
	movq	264(%r12), %rax
	movq	%rax, 1968(%rsp)
	movq	272(%r12), %rax
	movq	%rax, 1976(%rsp)
	movq	280(%r12), %rax
	movq	%rax, 1984(%rsp)
	movq	288(%r12), %rax
	movq	%rax, 1992(%rsp)
	movq	296(%r12), %rax
	movq	%rax, 2000(%rsp)
	movq	304(%r12), %rax
	movq	%rax, 2008(%rsp)
	movq	312(%r12), %rax
	movq	%rax, 2016(%rsp)
	movq	320(%r12), %rax
	movq	%rax, 2024(%rsp)
	movq	328(%r12), %rax
	movq	%rax, 2032(%rsp)
	movq	336(%r12), %rax
	movq	%rax, 2040(%rsp)
	movq	344(%r12), %rax
	movq	%rax, 2048(%rsp)
	movq	352(%r12), %rax
	movq	%rax, 2056(%rsp)
	movq	360(%r12), %rax
	movq	%rax, 2064(%rsp)
	movq	368(%r12), %rax
	movq	%rax, 2072(%rsp)
	movq	376(%r12), %rax
	movq	%rax, 2080(%rsp)
	movq	384(%r12), %rax
	movq	%rax, 2088(%rsp)
	movq	392(%r12), %rax
	movq	%rax, 2096(%rsp)
	movq	400(%r12), %rax
	movq	%rax, 2104(%rsp)
	movq	408(%r12), %rax
	movq	%rax, 2112(%rsp)
	movq	416(%r12), %rax
	movq	%rax, 2120(%rsp)
	movq	424(%r12), %rax
	movq	%rax, 2128(%rsp)
	movq	432(%r12), %rax
	movq	%rax, 2136(%rsp)
	movq	440(%r12), %rax
	movq	%rax, 2144(%rsp)
	movq	448(%r12), %rax
	movq	%rax, 2152(%rsp)
	movq	456(%r12), %rax
	movq	%rax, 2160(%rsp)
	movq	464(%r12), %rax
	movq	%rax, 2168(%rsp)
	movq	472(%r12), %rax
	movq	%rax, 2176(%rsp)
	movq	480(%r12), %rax
	movq	%rax, 2184(%rsp)
	movq	488(%r12), %rax
	movq	%rax, 2192(%rsp)
	movq	496(%r12), %rax
	movq	%rax, 2200(%rsp)
	movq	504(%r12), %rax
	movq	%rax, 2208(%rsp)
	movq	512(%r12), %rax
	movq	%rax, 2216(%rsp)
	movq	520(%r12), %rax
	movq	%rax, 2224(%rsp)
	movq	528(%r12), %rax
	movq	%rax, 2232(%rsp)
	movq	536(%r12), %rax
	movq	%rax, 2240(%rsp)
	movq	544(%r12), %rax
	movq	%rax, 2248(%rsp)
	movq	552(%r12), %rax
	movq	%rax, 2256(%rsp)
	movq	560(%r12), %rax
	movq	%rax, 2264(%rsp)
	movq	568(%r12), %rax
	movq	%rax, 2272(%rsp)
	movq	576(%r12), %rax
	movq	%rax, 2280(%rsp)
	movq	584(%r12), %rax
	movq	%rax, 2288(%rsp)
	movq	592(%r12), %rax
	movq	%rax, 2296(%rsp)
	movq	600(%r12), %rax
	movq	%rax, 2304(%rsp)
	movq	608(%r12), %rax
	movq	%rax, 2312(%rsp)
	movq	616(%r12), %rax
	movq	%rax, 2320(%rsp)
	movq	624(%r12), %rax
	movq	%rax, 2328(%rsp)
	movq	632(%r12), %rax
	movq	%rax, 2336(%rsp)
	movq	640(%r12), %rax
	movq	%rax, 2344(%rsp)
	movq	648(%r12), %rax
	movq	%rax, 2352(%rsp)
	movq	656(%r12), %rax
	movq	%rax, 2360(%rsp)
	movq	664(%r12), %rax
	movq	%rax, 2368(%rsp)
	movq	672(%r12), %rax
	movq	%rax, 2376(%rsp)
	movq	680(%r12), %rax
	movq	%rax, 2384(%rsp)
	movq	688(%r12), %rax
	movq	%rax, 2392(%rsp)
	movq	696(%r12), %rax
	movq	%rax, 2400(%rsp)
	movq	704(%r12), %rax
	movq	%rax, 2408(%rsp)
	movq	712(%r12), %rax
	movq	%rax, 2416(%rsp)
	movq	720(%r12), %rax
	movq	%rax, 2424(%rsp)
	movq	728(%r12), %rax
	movq	%rax, 2432(%rsp)
	movq	736(%r12), %rax
	movq	%rax, 2440(%rsp)
	movq	744(%r12), %rax
	movq	%rax, 2448(%rsp)
	movq	752(%r12), %rax
	movq	%rax, 2456(%rsp)
	movq	760(%r12), %rax
	movq	%rax, 2464(%rsp)
	movq	768(%r12), %rax
	movq	%rax, 2472(%rsp)
	movq	776(%r12), %rax
	movq	%rax, 2480(%rsp)
	movq	784(%r12), %rax
	movq	%rax, 2488(%rsp)
	movq	792(%r12), %rax
	movq	%rax, 2496(%rsp)
	movq	800(%r12), %rax
	movq	%rax, 2504(%rsp)
	movq	808(%r12), %rax
	movq	%rax, 2512(%rsp)
	movq	816(%r12), %rax
	movq	%rax, 2520(%rsp)
	movq	824(%r12), %rax
	movq	%rax, 2528(%rsp)
	movq	832(%r12), %rax
	movq	%rax, 2536(%rsp)
	movq	840(%r12), %rax
	movq	%rax, 2544(%rsp)
	movq	848(%r12), %rax
	movq	%rax, 2552(%rsp)
	movq	856(%r12), %rax
	movq	%rax, 2560(%rsp)
	movq	864(%r12), %rax
	movq	%rax, 2568(%rsp)
	movq	872(%r12), %rax
	movq	%rax, 2576(%rsp)
	movq	880(%r12), %rax
	movq	%rax, 2584(%rsp)
	movq	888(%r12), %rax
	movq	%rax, 2592(%rsp)
	movq	896(%r12), %rax
	movq	%rax, 2600(%rsp)
	movq	904(%r12), %rax
	movq	%rax, 2608(%rsp)
	movq	912(%r12), %rax
	movq	%rax, 2616(%rsp)
	movq	920(%r12), %rax
	movq	%rax, 2624(%rsp)
	movq	928(%r12), %rax
	movq	%rax, 2632(%rsp)
	movq	936(%r12), %rax
	movq	%rax, 2640(%rsp)
	movq	944(%r12), %rax
	movq	%rax, 2648(%rsp)
	movq	952(%r12), %rax
	movq	%rax, 2656(%rsp)
	movq	960(%r12), %rax
	movq	%rax, 2664(%rsp)
	movq	968(%r12), %rax
	movq	%rax, 2672(%rsp)
	movq	976(%r12), %rax
	movq	%rax, 2680(%rsp)
	movq	984(%r12), %rax
	movq	%rax, 2688(%rsp)
	movq	992(%r12), %rax
	movq	%rax, 2696(%rsp)
	movq	1000(%r12), %rax
	movq	%rax, 2704(%rsp)
	movq	1008(%r12), %rax
	movq	%rax, 2712(%rsp)
	movq	1016(%r12), %rax
	movq	%rax, 2720(%rsp)
	movq	1024(%r12), %rax
	movq	%rax, 2728(%rsp)
	movq	1032(%r12), %rax
	movq	%rax, 2736(%rsp)
	movq	1040(%r12), %rax
	movq	%rax, 2744(%rsp)
	movq	1048(%r12), %rax
	movq	%rax, 2752(%rsp)
	movq	1056(%r12), %rax
	movq	%rax, 2760(%rsp)
	movq	1064(%r12), %rax
	movq	%rax, 2768(%rsp)
	movq	1072(%r12), %rax
	movq	%rax, 2776(%rsp)
	movq	1080(%r12), %rax
	movq	%rax, 2784(%rsp)
	movq	1088(%r12), %rax
	movq	%rax, 2792(%rsp)
	movq	1096(%r12), %rax
	movq	%rax, 2800(%rsp)
	movq	1104(%r12), %rax
	movq	%rax, 2808(%rsp)
	movq	1112(%r12), %rax
	movq	%rax, 2816(%rsp)
	movq	1120(%r12), %rax
	movq	%rax, 2824(%rsp)
	movq	1128(%r12), %rax
	movq	%rax, 2832(%rsp)
	movq	1136(%r12), %rax
	movq	%rax, 2840(%rsp)
	movq	1144(%r12), %rax
	movq	%rax, 2848(%rsp)
	movq	1152(%r12), %rax
	movq	%rax, 2856(%rsp)
	movq	1160(%r12), %rax
	movq	%rax, 2864(%rsp)
	movq	1168(%r12), %rax
	movq	%rax, 2872(%rsp)
	movq	1176(%r12), %rax
	movq	%rax, 2880(%rsp)
	movq	(%rcx), %rax
	movq	%rax, 48(%rsp)
	movq	8(%rcx), %rax
	movq	%rax, 56(%rsp)
	movq	16(%rcx), %rax
	movq	%rax, 64(%rsp)
	movq	24(%rcx), %rax
	movq	%rax, 72(%rsp)
	leaq	616(%rsp), %rcx
	leaq	1704(%rsp), %r10
	leaq	16(%rsp), %rax
	leaq	48(%rsp), %rdx
	movq	%r10, (%rsp)
	movq	%rax, 8(%rsp)
	movq	(%rdx), %rax
	movq	%rax, 120(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 128(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 136(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 144(%rsp)
	leaq	152(%rsp), %rax
	leaq	-232(%rsp), %rsp
	call	L_sha3_256A_A1184$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$229:
	leaq	232(%rsp), %rsp
	leaq	184(%rsp), %rax
	leaq	120(%rsp), %r10
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$228:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %r10
	leaq	120(%rsp), %rax
	leaq	216(%rsp), %r11
	movq	%rcx, %mm2
	movq	%r10, %rbx
	leaq	4936(%rsp), %rcx
	movq	%rbx, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$227:
	leaq	5448(%rsp), %rcx
	leaq	384(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$226:
	leaq	5960(%rsp), %rcx
	leaq	768(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$225:
	movq	1152(%r10), %rcx
	movq	%rcx, 48(%rsp)
	movq	1160(%r10), %rcx
	movq	%rcx, 56(%rsp)
	movq	1168(%r10), %rcx
	movq	%rcx, 64(%rsp)
	movq	1176(%r10), %rcx
	movq	%rcx, 72(%rsp)
	leaq	2888(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$224:
	movq	%r11, %mm3
	movq	$1, %rax
	movq	%rax, %mm4
	movb	48(%rsp), %al
	movb	%al, 80(%rsp)
	movb	49(%rsp), %al
	movb	%al, 81(%rsp)
	movb	50(%rsp), %al
	movb	%al, 82(%rsp)
	movb	51(%rsp), %al
	movb	%al, 83(%rsp)
	movb	52(%rsp), %al
	movb	%al, 84(%rsp)
	movb	53(%rsp), %al
	movb	%al, 85(%rsp)
	movb	54(%rsp), %al
	movb	%al, 86(%rsp)
	movb	55(%rsp), %al
	movb	%al, 87(%rsp)
	movb	56(%rsp), %al
	movb	%al, 88(%rsp)
	movb	57(%rsp), %al
	movb	%al, 89(%rsp)
	movb	58(%rsp), %al
	movb	%al, 90(%rsp)
	movb	59(%rsp), %al
	movb	%al, 91(%rsp)
	movb	60(%rsp), %al
	movb	%al, 92(%rsp)
	movb	61(%rsp), %al
	movb	%al, 93(%rsp)
	movb	62(%rsp), %al
	movb	%al, 94(%rsp)
	movb	63(%rsp), %al
	movb	%al, 95(%rsp)
	movb	64(%rsp), %al
	movb	%al, 96(%rsp)
	movb	65(%rsp), %al
	movb	%al, 97(%rsp)
	movb	66(%rsp), %al
	movb	%al, 98(%rsp)
	movb	67(%rsp), %al
	movb	%al, 99(%rsp)
	movb	68(%rsp), %al
	movb	%al, 100(%rsp)
	movb	69(%rsp), %al
	movb	%al, 101(%rsp)
	movb	70(%rsp), %al
	movb	%al, 102(%rsp)
	movb	71(%rsp), %al
	movb	%al, 103(%rsp)
	movb	72(%rsp), %al
	movb	%al, 104(%rsp)
	movb	73(%rsp), %al
	movb	%al, 105(%rsp)
	movb	74(%rsp), %al
	movb	%al, 106(%rsp)
	movb	75(%rsp), %al
	movb	%al, 107(%rsp)
	movb	76(%rsp), %al
	movb	%al, 108(%rsp)
	movb	77(%rsp), %al
	movb	%al, 109(%rsp)
	movb	78(%rsp), %al
	movb	%al, 110(%rsp)
	movb	79(%rsp), %al
	movb	%al, 111(%rsp)
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$222
	movb	$0, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$223
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$222:
	movb	$0, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$223:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$221:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$208
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$209:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$220:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	11080(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$206
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$207:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$206:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$207
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$204
	movb	$0, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$205
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$204:
	movb	$1, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$205:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$203:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$190
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$191:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$202:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	11592(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$188
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$189:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$188:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$189
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$186
	movb	$0, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$187
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$186:
	movb	$2, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$187:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$185:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$172
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$173:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$184:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	12104(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$170
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$171:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$170:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$171
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$168
	movb	$1, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$169
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$168:
	movb	$0, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$169:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$167:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$154
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$155:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$166:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	12616(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$152
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$153:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$152:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$153
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$150
	movb	$1, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$151
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$150:
	movb	$1, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$151:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$149:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$136
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$137:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$148:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	13128(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$134
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$135:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$134:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$135
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$132
	movb	$1, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$133
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$132:
	movb	$2, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$133:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$131:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$118
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$119:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$130:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	13640(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$116
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$117:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$116:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$117
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$114
	movb	$2, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$115
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$114:
	movb	$0, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$115:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$113:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$100
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$101:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$112:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	14152(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$98
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$99:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$98:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$99
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$96
	movb	$2, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$97
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$96:
	movb	$1, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$97:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$95:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$82
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$83:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$94:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	14664(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$80
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$81:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$80:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$81
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$78
	movb	$2, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$79
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$78:
	movb	$2, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$79:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$77:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$64
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$65:
	movq	%rcx, %mm4
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$76:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
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
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	15176(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$62
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$63:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$62:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$63
	movq	%mm3, %rcx
	movb	$0, %al
	leaq	6472(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$61:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	6984(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$60:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	7496(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$59:
	leaq	176(%rsp), %rsp
	movq	%mm3, %rcx
	movb	$3, %al
	leaq	8008(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$58:
	leaq	176(%rsp), %rsp
	movb	$4, %al
	leaq	8520(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$57:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	9032(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$56:
	leaq	176(%rsp), %rsp
	movb	$6, %al
	leaq	3400(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$55:
	leaq	176(%rsp), %rsp
	leaq	6472(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$54:
	leaq	6984(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$53:
	leaq	7496(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$52:
	leaq	9544(%rsp), %rdx
	leaq	11080(%rsp), %rax
	leaq	6472(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$51:
	leaq	16(%rsp), %rsp
	leaq	3912(%rsp), %rdx
	leaq	11592(%rsp), %rax
	leaq	6984(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$50:
	leaq	16(%rsp), %rsp
	leaq	9544(%rsp), %rax
	leaq	3912(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$49:
	leaq	3912(%rsp), %rdx
	leaq	12104(%rsp), %rax
	leaq	7496(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$48:
	leaq	16(%rsp), %rsp
	leaq	9544(%rsp), %rax
	leaq	3912(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$47:
	leaq	9544(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$45
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$46:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$45:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$46
	leaq	10056(%rsp), %rdx
	leaq	12616(%rsp), %rax
	leaq	6472(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$44:
	leaq	16(%rsp), %rsp
	leaq	3912(%rsp), %rdx
	leaq	13128(%rsp), %rax
	leaq	6984(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$43:
	leaq	16(%rsp), %rsp
	leaq	10056(%rsp), %rax
	leaq	3912(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$42:
	leaq	3912(%rsp), %rdx
	leaq	13640(%rsp), %rax
	leaq	7496(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$41:
	leaq	16(%rsp), %rsp
	leaq	10056(%rsp), %rax
	leaq	3912(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$40:
	leaq	10056(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$38
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$39:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$38:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$39
	leaq	10568(%rsp), %rdx
	leaq	14152(%rsp), %rax
	leaq	6472(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$37:
	leaq	16(%rsp), %rsp
	leaq	3912(%rsp), %rdx
	leaq	14664(%rsp), %rax
	leaq	6984(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$36:
	leaq	16(%rsp), %rsp
	leaq	10568(%rsp), %rax
	leaq	3912(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$35:
	leaq	3912(%rsp), %rdx
	leaq	15176(%rsp), %rax
	leaq	7496(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$34:
	leaq	16(%rsp), %rsp
	leaq	10568(%rsp), %rax
	leaq	3912(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$33:
	leaq	10568(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$31
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$32:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$31:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$32
	leaq	3912(%rsp), %rdx
	leaq	4936(%rsp), %rax
	leaq	6472(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$30:
	leaq	16(%rsp), %rsp
	leaq	4424(%rsp), %rdx
	leaq	5448(%rsp), %rax
	leaq	6984(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$29:
	leaq	16(%rsp), %rsp
	leaq	3912(%rsp), %rax
	leaq	4424(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$28:
	leaq	4424(%rsp), %rdx
	leaq	5960(%rsp), %rax
	leaq	7496(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$27:
	leaq	16(%rsp), %rsp
	leaq	3912(%rsp), %rax
	leaq	4424(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$26:
	leaq	3912(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$24
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$25:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$24:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$25
	leaq	9544(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$23:
	leaq	10056(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$22:
	leaq	10568(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$21:
	leaq	3912(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$20:
	leaq	9544(%rsp), %rax
	leaq	8008(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$19:
	leaq	10056(%rsp), %rax
	leaq	8520(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$18:
	leaq	10568(%rsp), %rax
	leaq	9032(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$17:
	leaq	3912(%rsp), %rax
	leaq	3400(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$16:
	leaq	3912(%rsp), %rax
	leaq	2888(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$15:
	leaq	9544(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$13
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$14:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$13:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$14
	leaq	10056(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$11
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$12:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$11:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$12
	leaq	10568(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$9
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$10:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$9:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$10
	leaq	3912(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$7
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$8:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$7:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$8
	movq	%mm2, %rdx
	movq	%rdx, %r10
	movq	$0, %rsi
	movq	$0, %rdi
	leaq	9544(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$6:
	leaq	10056(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$5:
	leaq	10568(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$4:
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$2
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$3:
	movzwq	9544(%rsp,%rsi,2), %r8
	shlq	$10, %r8
	addq	$1665, %r8
	imulq	$1290167, %r8, %r8
	shrq	$32, %r8
	andq	$1023, %r8
	movzwq	9546(%rsp,%rsi,2), %r9
	shlq	$10, %r9
	addq	$1665, %r9
	imulq	$1290167, %r9, %r9
	shrq	$32, %r9
	andq	$1023, %r9
	movzwq	9548(%rsp,%rsi,2), %r11
	shlq	$10, %r11
	addq	$1665, %r11
	imulq	$1290167, %r11, %r11
	shrq	$32, %r11
	andq	$1023, %r11
	movzwq	9550(%rsp,%rsi,2), %rbp
	shlq	$10, %rbp
	addq	$1665, %rbp
	imulq	$1290167, %rbp, %rbp
	shrq	$32, %rbp
	andq	$1023, %rbp
	movw	%r8w, %ax
	andw	$255, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$8, %r8w
	movw	%r9w, %ax
	shlw	$2, %ax
	orw 	%r8w, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$6, %r9w
	movw	%r11w, %ax
	shlw	$4, %ax
	orw 	%r9w, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$4, %r11w
	movw	%bp, %ax
	shlw	$6, %ax
	orw 	%r11w, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrq	$2, %rbp
	movb	%bpl, (%r10,%rdi)
	incq	%rdi
	addq	$4, %rsi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$2:
	cmpq	$765, %rsi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc$3
	leaq	960(%rdx), %rdx
	leaq	3912(%rsp), %rax
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc$1:
	movq	8(%rsp), %rcx
	movq	184(%rsp), %rax
	movq	%rax, (%rcx)
	movq	192(%rsp), %rax
	movq	%rax, 8(%rcx)
	movq	200(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	208(%rsp), %rax
	movq	%rax, 24(%rcx)
	movq	%mm0, %rsi
	movq	%mm1, %rdi
	movq	616(%rsp), %rax
	movq	%rax, (%rsi)
	movq	624(%rsp), %rax
	movq	%rax, 8(%rsi)
	movq	632(%rsp), %rax
	movq	%rax, 16(%rsi)
	movq	640(%rsp), %rax
	movq	%rax, 24(%rsi)
	movq	648(%rsp), %rax
	movq	%rax, 32(%rsi)
	movq	656(%rsp), %rax
	movq	%rax, 40(%rsi)
	movq	664(%rsp), %rax
	movq	%rax, 48(%rsi)
	movq	672(%rsp), %rax
	movq	%rax, 56(%rsi)
	movq	680(%rsp), %rax
	movq	%rax, 64(%rsi)
	movq	688(%rsp), %rax
	movq	%rax, 72(%rsi)
	movq	696(%rsp), %rax
	movq	%rax, 80(%rsi)
	movq	704(%rsp), %rax
	movq	%rax, 88(%rsi)
	movq	712(%rsp), %rax
	movq	%rax, 96(%rsi)
	movq	720(%rsp), %rax
	movq	%rax, 104(%rsi)
	movq	728(%rsp), %rax
	movq	%rax, 112(%rsi)
	movq	736(%rsp), %rax
	movq	%rax, 120(%rsi)
	movq	744(%rsp), %rax
	movq	%rax, 128(%rsi)
	movq	752(%rsp), %rax
	movq	%rax, 136(%rsi)
	movq	760(%rsp), %rax
	movq	%rax, 144(%rsi)
	movq	768(%rsp), %rax
	movq	%rax, 152(%rsi)
	movq	776(%rsp), %rax
	movq	%rax, 160(%rsi)
	movq	784(%rsp), %rax
	movq	%rax, 168(%rsi)
	movq	792(%rsp), %rax
	movq	%rax, 176(%rsi)
	movq	800(%rsp), %rax
	movq	%rax, 184(%rsi)
	movq	808(%rsp), %rax
	movq	%rax, 192(%rsi)
	movq	816(%rsp), %rax
	movq	%rax, 200(%rsi)
	movq	824(%rsp), %rax
	movq	%rax, 208(%rsi)
	movq	832(%rsp), %rax
	movq	%rax, 216(%rsi)
	movq	840(%rsp), %rax
	movq	%rax, 224(%rsi)
	movq	848(%rsp), %rax
	movq	%rax, 232(%rsi)
	movq	856(%rsp), %rax
	movq	%rax, 240(%rsi)
	movq	864(%rsp), %rax
	movq	%rax, 248(%rsi)
	movq	872(%rsp), %rax
	movq	%rax, 256(%rsi)
	movq	880(%rsp), %rax
	movq	%rax, 264(%rsi)
	movq	888(%rsp), %rax
	movq	%rax, 272(%rsi)
	movq	896(%rsp), %rax
	movq	%rax, 280(%rsi)
	movq	904(%rsp), %rax
	movq	%rax, 288(%rsi)
	movq	912(%rsp), %rax
	movq	%rax, 296(%rsi)
	movq	920(%rsp), %rax
	movq	%rax, 304(%rsi)
	movq	928(%rsp), %rax
	movq	%rax, 312(%rsi)
	movq	936(%rsp), %rax
	movq	%rax, 320(%rsi)
	movq	944(%rsp), %rax
	movq	%rax, 328(%rsi)
	movq	952(%rsp), %rax
	movq	%rax, 336(%rsi)
	movq	960(%rsp), %rax
	movq	%rax, 344(%rsi)
	movq	968(%rsp), %rax
	movq	%rax, 352(%rsi)
	movq	976(%rsp), %rax
	movq	%rax, 360(%rsi)
	movq	984(%rsp), %rax
	movq	%rax, 368(%rsi)
	movq	992(%rsp), %rax
	movq	%rax, 376(%rsi)
	movq	1000(%rsp), %rax
	movq	%rax, 384(%rsi)
	movq	1008(%rsp), %rax
	movq	%rax, 392(%rsi)
	movq	1016(%rsp), %rax
	movq	%rax, 400(%rsi)
	movq	1024(%rsp), %rax
	movq	%rax, 408(%rsi)
	movq	1032(%rsp), %rax
	movq	%rax, 416(%rsi)
	movq	1040(%rsp), %rax
	movq	%rax, 424(%rsi)
	movq	1048(%rsp), %rax
	movq	%rax, 432(%rsi)
	movq	1056(%rsp), %rax
	movq	%rax, 440(%rsi)
	movq	1064(%rsp), %rax
	movq	%rax, 448(%rsi)
	movq	1072(%rsp), %rax
	movq	%rax, 456(%rsi)
	movq	1080(%rsp), %rax
	movq	%rax, 464(%rsi)
	movq	1088(%rsp), %rax
	movq	%rax, 472(%rsi)
	movq	1096(%rsp), %rax
	movq	%rax, 480(%rsi)
	movq	1104(%rsp), %rax
	movq	%rax, 488(%rsi)
	movq	1112(%rsp), %rax
	movq	%rax, 496(%rsi)
	movq	1120(%rsp), %rax
	movq	%rax, 504(%rsi)
	movq	1128(%rsp), %rax
	movq	%rax, 512(%rsi)
	movq	1136(%rsp), %rax
	movq	%rax, 520(%rsi)
	movq	1144(%rsp), %rax
	movq	%rax, 528(%rsi)
	movq	1152(%rsp), %rax
	movq	%rax, 536(%rsi)
	movq	1160(%rsp), %rax
	movq	%rax, 544(%rsi)
	movq	1168(%rsp), %rax
	movq	%rax, 552(%rsi)
	movq	1176(%rsp), %rax
	movq	%rax, 560(%rsi)
	movq	1184(%rsp), %rax
	movq	%rax, 568(%rsi)
	movq	1192(%rsp), %rax
	movq	%rax, 576(%rsi)
	movq	1200(%rsp), %rax
	movq	%rax, 584(%rsi)
	movq	1208(%rsp), %rax
	movq	%rax, 592(%rsi)
	movq	1216(%rsp), %rax
	movq	%rax, 600(%rsi)
	movq	1224(%rsp), %rax
	movq	%rax, 608(%rsi)
	movq	1232(%rsp), %rax
	movq	%rax, 616(%rsi)
	movq	1240(%rsp), %rax
	movq	%rax, 624(%rsi)
	movq	1248(%rsp), %rax
	movq	%rax, 632(%rsi)
	movq	1256(%rsp), %rax
	movq	%rax, 640(%rsi)
	movq	1264(%rsp), %rax
	movq	%rax, 648(%rsi)
	movq	1272(%rsp), %rax
	movq	%rax, 656(%rsi)
	movq	1280(%rsp), %rax
	movq	%rax, 664(%rsi)
	movq	1288(%rsp), %rax
	movq	%rax, 672(%rsi)
	movq	1296(%rsp), %rax
	movq	%rax, 680(%rsi)
	movq	1304(%rsp), %rax
	movq	%rax, 688(%rsi)
	movq	1312(%rsp), %rax
	movq	%rax, 696(%rsi)
	movq	1320(%rsp), %rax
	movq	%rax, 704(%rsi)
	movq	1328(%rsp), %rax
	movq	%rax, 712(%rsi)
	movq	1336(%rsp), %rax
	movq	%rax, 720(%rsi)
	movq	1344(%rsp), %rax
	movq	%rax, 728(%rsi)
	movq	1352(%rsp), %rax
	movq	%rax, 736(%rsi)
	movq	1360(%rsp), %rax
	movq	%rax, 744(%rsi)
	movq	1368(%rsp), %rax
	movq	%rax, 752(%rsi)
	movq	1376(%rsp), %rax
	movq	%rax, 760(%rsi)
	movq	1384(%rsp), %rax
	movq	%rax, 768(%rsi)
	movq	1392(%rsp), %rax
	movq	%rax, 776(%rsi)
	movq	1400(%rsp), %rax
	movq	%rax, 784(%rsi)
	movq	1408(%rsp), %rax
	movq	%rax, 792(%rsi)
	movq	1416(%rsp), %rax
	movq	%rax, 800(%rsi)
	movq	1424(%rsp), %rax
	movq	%rax, 808(%rsi)
	movq	1432(%rsp), %rax
	movq	%rax, 816(%rsi)
	movq	1440(%rsp), %rax
	movq	%rax, 824(%rsi)
	movq	1448(%rsp), %rax
	movq	%rax, 832(%rsi)
	movq	1456(%rsp), %rax
	movq	%rax, 840(%rsi)
	movq	1464(%rsp), %rax
	movq	%rax, 848(%rsi)
	movq	1472(%rsp), %rax
	movq	%rax, 856(%rsi)
	movq	1480(%rsp), %rax
	movq	%rax, 864(%rsi)
	movq	1488(%rsp), %rax
	movq	%rax, 872(%rsi)
	movq	1496(%rsp), %rax
	movq	%rax, 880(%rsi)
	movq	1504(%rsp), %rax
	movq	%rax, 888(%rsi)
	movq	1512(%rsp), %rax
	movq	%rax, 896(%rsi)
	movq	1520(%rsp), %rax
	movq	%rax, 904(%rsi)
	movq	1528(%rsp), %rax
	movq	%rax, 912(%rsi)
	movq	1536(%rsp), %rax
	movq	%rax, 920(%rsi)
	movq	1544(%rsp), %rax
	movq	%rax, 928(%rsi)
	movq	1552(%rsp), %rax
	movq	%rax, 936(%rsi)
	movq	1560(%rsp), %rax
	movq	%rax, 944(%rsi)
	movq	1568(%rsp), %rax
	movq	%rax, 952(%rsi)
	movq	1576(%rsp), %rax
	movq	%rax, 960(%rsi)
	movq	1584(%rsp), %rax
	movq	%rax, 968(%rsi)
	movq	1592(%rsp), %rax
	movq	%rax, 976(%rsi)
	movq	1600(%rsp), %rax
	movq	%rax, 984(%rsi)
	movq	1608(%rsp), %rax
	movq	%rax, 992(%rsi)
	movq	1616(%rsp), %rax
	movq	%rax, 1000(%rsi)
	movq	1624(%rsp), %rax
	movq	%rax, 1008(%rsi)
	movq	1632(%rsp), %rax
	movq	%rax, 1016(%rsi)
	movq	1640(%rsp), %rax
	movq	%rax, 1024(%rsi)
	movq	1648(%rsp), %rax
	movq	%rax, 1032(%rsi)
	movq	1656(%rsp), %rax
	movq	%rax, 1040(%rsi)
	movq	1664(%rsp), %rax
	movq	%rax, 1048(%rsi)
	movq	1672(%rsp), %rax
	movq	%rax, 1056(%rsi)
	movq	1680(%rsp), %rax
	movq	%rax, 1064(%rsi)
	movq	1688(%rsp), %rax
	movq	%rax, 1072(%rsi)
	movq	1696(%rsp), %rax
	movq	%rax, 1080(%rsi)
	movq	16(%rsp), %rax
	movq	%rax, (%rdi)
	movq	24(%rsp), %rax
	movq	%rax, 8(%rdi)
	movq	32(%rsp), %rax
	movq	%rax, 16(%rdi)
	movq	40(%rsp), %rax
	movq	%rax, 24(%rdi)
	xorl	%eax, %eax
	movq	15688(%rsp), %rbx
	movq	15696(%rsp), %rbp
	movq	15704(%rsp), %r12
	movq	15712(%rsp), %r13
	movq	15720(%rsp), %r14
	movq	15728(%rsp), %r15
	movq	15736(%rsp), %rsp
	ret
	.type	_jade_kem_mlkem_mlkem768_amd64_ref_enc_derand, %function
	.type	jade_kem_mlkem_mlkem768_amd64_ref_enc_derand, %function
_jade_kem_mlkem_mlkem768_amd64_ref_enc_derand:
jade_kem_mlkem_mlkem768_amd64_ref_enc_derand:
	movq	%rsp, %rax
	leaq	-15744(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 15688(%rsp)
	movq	%rbp, 15696(%rsp)
	movq	%r12, 15704(%rsp)
	movq	%r13, 15712(%rsp)
	movq	%r14, 15720(%rsp)
	movq	%r15, 15728(%rsp)
	movq	%rax, 15736(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm0
	movq	%rsi, %mm1
	movq	(%rdx), %rax
	movq	%rax, 1704(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 1712(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 1720(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 1728(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 1736(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 1744(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 1752(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 1760(%rsp)
	movq	64(%rdx), %rax
	movq	%rax, 1768(%rsp)
	movq	72(%rdx), %rax
	movq	%rax, 1776(%rsp)
	movq	80(%rdx), %rax
	movq	%rax, 1784(%rsp)
	movq	88(%rdx), %rax
	movq	%rax, 1792(%rsp)
	movq	96(%rdx), %rax
	movq	%rax, 1800(%rsp)
	movq	104(%rdx), %rax
	movq	%rax, 1808(%rsp)
	movq	112(%rdx), %rax
	movq	%rax, 1816(%rsp)
	movq	120(%rdx), %rax
	movq	%rax, 1824(%rsp)
	movq	128(%rdx), %rax
	movq	%rax, 1832(%rsp)
	movq	136(%rdx), %rax
	movq	%rax, 1840(%rsp)
	movq	144(%rdx), %rax
	movq	%rax, 1848(%rsp)
	movq	152(%rdx), %rax
	movq	%rax, 1856(%rsp)
	movq	160(%rdx), %rax
	movq	%rax, 1864(%rsp)
	movq	168(%rdx), %rax
	movq	%rax, 1872(%rsp)
	movq	176(%rdx), %rax
	movq	%rax, 1880(%rsp)
	movq	184(%rdx), %rax
	movq	%rax, 1888(%rsp)
	movq	192(%rdx), %rax
	movq	%rax, 1896(%rsp)
	movq	200(%rdx), %rax
	movq	%rax, 1904(%rsp)
	movq	208(%rdx), %rax
	movq	%rax, 1912(%rsp)
	movq	216(%rdx), %rax
	movq	%rax, 1920(%rsp)
	movq	224(%rdx), %rax
	movq	%rax, 1928(%rsp)
	movq	232(%rdx), %rax
	movq	%rax, 1936(%rsp)
	movq	240(%rdx), %rax
	movq	%rax, 1944(%rsp)
	movq	248(%rdx), %rax
	movq	%rax, 1952(%rsp)
	movq	256(%rdx), %rax
	movq	%rax, 1960(%rsp)
	movq	264(%rdx), %rax
	movq	%rax, 1968(%rsp)
	movq	272(%rdx), %rax
	movq	%rax, 1976(%rsp)
	movq	280(%rdx), %rax
	movq	%rax, 1984(%rsp)
	movq	288(%rdx), %rax
	movq	%rax, 1992(%rsp)
	movq	296(%rdx), %rax
	movq	%rax, 2000(%rsp)
	movq	304(%rdx), %rax
	movq	%rax, 2008(%rsp)
	movq	312(%rdx), %rax
	movq	%rax, 2016(%rsp)
	movq	320(%rdx), %rax
	movq	%rax, 2024(%rsp)
	movq	328(%rdx), %rax
	movq	%rax, 2032(%rsp)
	movq	336(%rdx), %rax
	movq	%rax, 2040(%rsp)
	movq	344(%rdx), %rax
	movq	%rax, 2048(%rsp)
	movq	352(%rdx), %rax
	movq	%rax, 2056(%rsp)
	movq	360(%rdx), %rax
	movq	%rax, 2064(%rsp)
	movq	368(%rdx), %rax
	movq	%rax, 2072(%rsp)
	movq	376(%rdx), %rax
	movq	%rax, 2080(%rsp)
	movq	384(%rdx), %rax
	movq	%rax, 2088(%rsp)
	movq	392(%rdx), %rax
	movq	%rax, 2096(%rsp)
	movq	400(%rdx), %rax
	movq	%rax, 2104(%rsp)
	movq	408(%rdx), %rax
	movq	%rax, 2112(%rsp)
	movq	416(%rdx), %rax
	movq	%rax, 2120(%rsp)
	movq	424(%rdx), %rax
	movq	%rax, 2128(%rsp)
	movq	432(%rdx), %rax
	movq	%rax, 2136(%rsp)
	movq	440(%rdx), %rax
	movq	%rax, 2144(%rsp)
	movq	448(%rdx), %rax
	movq	%rax, 2152(%rsp)
	movq	456(%rdx), %rax
	movq	%rax, 2160(%rsp)
	movq	464(%rdx), %rax
	movq	%rax, 2168(%rsp)
	movq	472(%rdx), %rax
	movq	%rax, 2176(%rsp)
	movq	480(%rdx), %rax
	movq	%rax, 2184(%rsp)
	movq	488(%rdx), %rax
	movq	%rax, 2192(%rsp)
	movq	496(%rdx), %rax
	movq	%rax, 2200(%rsp)
	movq	504(%rdx), %rax
	movq	%rax, 2208(%rsp)
	movq	512(%rdx), %rax
	movq	%rax, 2216(%rsp)
	movq	520(%rdx), %rax
	movq	%rax, 2224(%rsp)
	movq	528(%rdx), %rax
	movq	%rax, 2232(%rsp)
	movq	536(%rdx), %rax
	movq	%rax, 2240(%rsp)
	movq	544(%rdx), %rax
	movq	%rax, 2248(%rsp)
	movq	552(%rdx), %rax
	movq	%rax, 2256(%rsp)
	movq	560(%rdx), %rax
	movq	%rax, 2264(%rsp)
	movq	568(%rdx), %rax
	movq	%rax, 2272(%rsp)
	movq	576(%rdx), %rax
	movq	%rax, 2280(%rsp)
	movq	584(%rdx), %rax
	movq	%rax, 2288(%rsp)
	movq	592(%rdx), %rax
	movq	%rax, 2296(%rsp)
	movq	600(%rdx), %rax
	movq	%rax, 2304(%rsp)
	movq	608(%rdx), %rax
	movq	%rax, 2312(%rsp)
	movq	616(%rdx), %rax
	movq	%rax, 2320(%rsp)
	movq	624(%rdx), %rax
	movq	%rax, 2328(%rsp)
	movq	632(%rdx), %rax
	movq	%rax, 2336(%rsp)
	movq	640(%rdx), %rax
	movq	%rax, 2344(%rsp)
	movq	648(%rdx), %rax
	movq	%rax, 2352(%rsp)
	movq	656(%rdx), %rax
	movq	%rax, 2360(%rsp)
	movq	664(%rdx), %rax
	movq	%rax, 2368(%rsp)
	movq	672(%rdx), %rax
	movq	%rax, 2376(%rsp)
	movq	680(%rdx), %rax
	movq	%rax, 2384(%rsp)
	movq	688(%rdx), %rax
	movq	%rax, 2392(%rsp)
	movq	696(%rdx), %rax
	movq	%rax, 2400(%rsp)
	movq	704(%rdx), %rax
	movq	%rax, 2408(%rsp)
	movq	712(%rdx), %rax
	movq	%rax, 2416(%rsp)
	movq	720(%rdx), %rax
	movq	%rax, 2424(%rsp)
	movq	728(%rdx), %rax
	movq	%rax, 2432(%rsp)
	movq	736(%rdx), %rax
	movq	%rax, 2440(%rsp)
	movq	744(%rdx), %rax
	movq	%rax, 2448(%rsp)
	movq	752(%rdx), %rax
	movq	%rax, 2456(%rsp)
	movq	760(%rdx), %rax
	movq	%rax, 2464(%rsp)
	movq	768(%rdx), %rax
	movq	%rax, 2472(%rsp)
	movq	776(%rdx), %rax
	movq	%rax, 2480(%rsp)
	movq	784(%rdx), %rax
	movq	%rax, 2488(%rsp)
	movq	792(%rdx), %rax
	movq	%rax, 2496(%rsp)
	movq	800(%rdx), %rax
	movq	%rax, 2504(%rsp)
	movq	808(%rdx), %rax
	movq	%rax, 2512(%rsp)
	movq	816(%rdx), %rax
	movq	%rax, 2520(%rsp)
	movq	824(%rdx), %rax
	movq	%rax, 2528(%rsp)
	movq	832(%rdx), %rax
	movq	%rax, 2536(%rsp)
	movq	840(%rdx), %rax
	movq	%rax, 2544(%rsp)
	movq	848(%rdx), %rax
	movq	%rax, 2552(%rsp)
	movq	856(%rdx), %rax
	movq	%rax, 2560(%rsp)
	movq	864(%rdx), %rax
	movq	%rax, 2568(%rsp)
	movq	872(%rdx), %rax
	movq	%rax, 2576(%rsp)
	movq	880(%rdx), %rax
	movq	%rax, 2584(%rsp)
	movq	888(%rdx), %rax
	movq	%rax, 2592(%rsp)
	movq	896(%rdx), %rax
	movq	%rax, 2600(%rsp)
	movq	904(%rdx), %rax
	movq	%rax, 2608(%rsp)
	movq	912(%rdx), %rax
	movq	%rax, 2616(%rsp)
	movq	920(%rdx), %rax
	movq	%rax, 2624(%rsp)
	movq	928(%rdx), %rax
	movq	%rax, 2632(%rsp)
	movq	936(%rdx), %rax
	movq	%rax, 2640(%rsp)
	movq	944(%rdx), %rax
	movq	%rax, 2648(%rsp)
	movq	952(%rdx), %rax
	movq	%rax, 2656(%rsp)
	movq	960(%rdx), %rax
	movq	%rax, 2664(%rsp)
	movq	968(%rdx), %rax
	movq	%rax, 2672(%rsp)
	movq	976(%rdx), %rax
	movq	%rax, 2680(%rsp)
	movq	984(%rdx), %rax
	movq	%rax, 2688(%rsp)
	movq	992(%rdx), %rax
	movq	%rax, 2696(%rsp)
	movq	1000(%rdx), %rax
	movq	%rax, 2704(%rsp)
	movq	1008(%rdx), %rax
	movq	%rax, 2712(%rsp)
	movq	1016(%rdx), %rax
	movq	%rax, 2720(%rsp)
	movq	1024(%rdx), %rax
	movq	%rax, 2728(%rsp)
	movq	1032(%rdx), %rax
	movq	%rax, 2736(%rsp)
	movq	1040(%rdx), %rax
	movq	%rax, 2744(%rsp)
	movq	1048(%rdx), %rax
	movq	%rax, 2752(%rsp)
	movq	1056(%rdx), %rax
	movq	%rax, 2760(%rsp)
	movq	1064(%rdx), %rax
	movq	%rax, 2768(%rsp)
	movq	1072(%rdx), %rax
	movq	%rax, 2776(%rsp)
	movq	1080(%rdx), %rax
	movq	%rax, 2784(%rsp)
	movq	1088(%rdx), %rax
	movq	%rax, 2792(%rsp)
	movq	1096(%rdx), %rax
	movq	%rax, 2800(%rsp)
	movq	1104(%rdx), %rax
	movq	%rax, 2808(%rsp)
	movq	1112(%rdx), %rax
	movq	%rax, 2816(%rsp)
	movq	1120(%rdx), %rax
	movq	%rax, 2824(%rsp)
	movq	1128(%rdx), %rax
	movq	%rax, 2832(%rsp)
	movq	1136(%rdx), %rax
	movq	%rax, 2840(%rsp)
	movq	1144(%rdx), %rax
	movq	%rax, 2848(%rsp)
	movq	1152(%rdx), %rax
	movq	%rax, 2856(%rsp)
	movq	1160(%rdx), %rax
	movq	%rax, 2864(%rsp)
	movq	1168(%rdx), %rax
	movq	%rax, 2872(%rsp)
	movq	1176(%rdx), %rax
	movq	%rax, 2880(%rsp)
	movq	(%rcx), %rax
	movq	%rax, 16(%rsp)
	movq	8(%rcx), %rax
	movq	%rax, 24(%rsp)
	movq	16(%rcx), %rax
	movq	%rax, 32(%rsp)
	movq	24(%rcx), %rax
	movq	%rax, 40(%rsp)
	leaq	616(%rsp), %rcx
	leaq	1704(%rsp), %r10
	leaq	48(%rsp), %rax
	leaq	16(%rsp), %rdx
	movq	%r10, (%rsp)
	movq	%rax, 8(%rsp)
	movq	(%rdx), %rax
	movq	%rax, 120(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 128(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 136(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 144(%rsp)
	leaq	152(%rsp), %rax
	leaq	-232(%rsp), %rsp
	call	L_sha3_256A_A1184$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$229:
	leaq	232(%rsp), %rsp
	leaq	184(%rsp), %rax
	leaq	120(%rsp), %r10
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$228:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %r10
	leaq	120(%rsp), %rax
	leaq	216(%rsp), %r11
	movq	%rcx, %mm2
	movq	%r10, %rbx
	leaq	4936(%rsp), %rcx
	movq	%rbx, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$227:
	leaq	5448(%rsp), %rcx
	leaq	384(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$226:
	leaq	5960(%rsp), %rcx
	leaq	768(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$225:
	movq	1152(%r10), %rcx
	movq	%rcx, 16(%rsp)
	movq	1160(%r10), %rcx
	movq	%rcx, 24(%rsp)
	movq	1168(%r10), %rcx
	movq	%rcx, 32(%rsp)
	movq	1176(%r10), %rcx
	movq	%rcx, 40(%rsp)
	leaq	2888(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$224:
	movq	%r11, %mm3
	movq	$1, %rax
	movq	%rax, %mm4
	movb	16(%rsp), %al
	movb	%al, 80(%rsp)
	movb	17(%rsp), %al
	movb	%al, 81(%rsp)
	movb	18(%rsp), %al
	movb	%al, 82(%rsp)
	movb	19(%rsp), %al
	movb	%al, 83(%rsp)
	movb	20(%rsp), %al
	movb	%al, 84(%rsp)
	movb	21(%rsp), %al
	movb	%al, 85(%rsp)
	movb	22(%rsp), %al
	movb	%al, 86(%rsp)
	movb	23(%rsp), %al
	movb	%al, 87(%rsp)
	movb	24(%rsp), %al
	movb	%al, 88(%rsp)
	movb	25(%rsp), %al
	movb	%al, 89(%rsp)
	movb	26(%rsp), %al
	movb	%al, 90(%rsp)
	movb	27(%rsp), %al
	movb	%al, 91(%rsp)
	movb	28(%rsp), %al
	movb	%al, 92(%rsp)
	movb	29(%rsp), %al
	movb	%al, 93(%rsp)
	movb	30(%rsp), %al
	movb	%al, 94(%rsp)
	movb	31(%rsp), %al
	movb	%al, 95(%rsp)
	movb	32(%rsp), %al
	movb	%al, 96(%rsp)
	movb	33(%rsp), %al
	movb	%al, 97(%rsp)
	movb	34(%rsp), %al
	movb	%al, 98(%rsp)
	movb	35(%rsp), %al
	movb	%al, 99(%rsp)
	movb	36(%rsp), %al
	movb	%al, 100(%rsp)
	movb	37(%rsp), %al
	movb	%al, 101(%rsp)
	movb	38(%rsp), %al
	movb	%al, 102(%rsp)
	movb	39(%rsp), %al
	movb	%al, 103(%rsp)
	movb	40(%rsp), %al
	movb	%al, 104(%rsp)
	movb	41(%rsp), %al
	movb	%al, 105(%rsp)
	movb	42(%rsp), %al
	movb	%al, 106(%rsp)
	movb	43(%rsp), %al
	movb	%al, 107(%rsp)
	movb	44(%rsp), %al
	movb	%al, 108(%rsp)
	movb	45(%rsp), %al
	movb	%al, 109(%rsp)
	movb	46(%rsp), %al
	movb	%al, 110(%rsp)
	movb	47(%rsp), %al
	movb	%al, 111(%rsp)
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$222
	movb	$0, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$223
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$222:
	movb	$0, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$223:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$221:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$208
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$209:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$220:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$218
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$219
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$218:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	11080(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$206
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$207:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$206:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$207
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$204
	movb	$0, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$205
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$204:
	movb	$1, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$205:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$203:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$190
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$191:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$202:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$200
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$201
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$200:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	11592(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$188
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$189:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$188:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$189
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$186
	movb	$0, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$187
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$186:
	movb	$2, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$187:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$185:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$172
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$173:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$184:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$182
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$183
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$182:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	12104(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$170
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$171:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$170:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$171
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$168
	movb	$1, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$169
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$168:
	movb	$0, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$169:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$167:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$154
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$155:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$166:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$164
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$165
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$164:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	12616(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$152
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$153:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$152:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$153
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$150
	movb	$1, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$151
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$150:
	movb	$1, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$151:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$149:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$136
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$137:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$148:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$146
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$147
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$146:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	13128(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$134
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$135:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$134:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$135
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$132
	movb	$1, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$133
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$132:
	movb	$2, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$133:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$131:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$118
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$119:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$130:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$128
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$129
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$128:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	13640(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$116
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$117:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$116:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$117
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$114
	movb	$2, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$115
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$114:
	movb	$0, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$115:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$113:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$100
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$101:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$112:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$110
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$111
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$110:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	14152(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$98
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$99:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$98:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$99
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$96
	movb	$2, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$97
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$96:
	movb	$1, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$97:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$95:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$82
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$83:
	movq	%rcx, %mm5
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$94:
	leaq	8(%rsp), %rsp
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$92
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$93
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$92:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	14664(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$80
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$81:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$80:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$81
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$78
	movb	$2, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$79
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$78:
	movb	$2, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$79:
	leaq	416(%rsp), %rsi
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$77:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$64
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$65:
	movq	%rcx, %mm4
	leaq	416(%rsp), %rsi
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$76:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	movw	%r9w, %di
	shrw	$4, %di
	andw	$15, %r9w
	shlw	$8, %r9w
	orw 	%r9w, %si
	movzbw	250(%rsp,%rdx), %r9w
	orw 	%ax, %r9w
	shlw	$4, %r9w
	orw 	%r9w, %di
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$74
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$75
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$74:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 3400(%rsp,%rcx,2)
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
	movw	%di, 3400(%rsp,%rcx,2)
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
	leaq	15176(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$62
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$63:
	movw	3400(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$62:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$63
	movq	%mm3, %rcx
	movb	$0, %al
	leaq	6472(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$61:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	6984(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$60:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	7496(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$59:
	leaq	176(%rsp), %rsp
	movq	%mm3, %rcx
	movb	$3, %al
	leaq	8008(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$58:
	leaq	176(%rsp), %rsp
	movb	$4, %al
	leaq	8520(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$57:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	9032(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$56:
	leaq	176(%rsp), %rsp
	movb	$6, %al
	leaq	3400(%rsp), %rdx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$55:
	leaq	176(%rsp), %rsp
	leaq	6472(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$54:
	leaq	6984(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$53:
	leaq	7496(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$52:
	leaq	9544(%rsp), %rdx
	leaq	11080(%rsp), %rax
	leaq	6472(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$51:
	leaq	16(%rsp), %rsp
	leaq	3912(%rsp), %rdx
	leaq	11592(%rsp), %rax
	leaq	6984(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$50:
	leaq	16(%rsp), %rsp
	leaq	9544(%rsp), %rax
	leaq	3912(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$49:
	leaq	3912(%rsp), %rdx
	leaq	12104(%rsp), %rax
	leaq	7496(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$48:
	leaq	16(%rsp), %rsp
	leaq	9544(%rsp), %rax
	leaq	3912(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$47:
	leaq	9544(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$45
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$46:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$45:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$46
	leaq	10056(%rsp), %rdx
	leaq	12616(%rsp), %rax
	leaq	6472(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$44:
	leaq	16(%rsp), %rsp
	leaq	3912(%rsp), %rdx
	leaq	13128(%rsp), %rax
	leaq	6984(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$43:
	leaq	16(%rsp), %rsp
	leaq	10056(%rsp), %rax
	leaq	3912(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$42:
	leaq	3912(%rsp), %rdx
	leaq	13640(%rsp), %rax
	leaq	7496(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$41:
	leaq	16(%rsp), %rsp
	leaq	10056(%rsp), %rax
	leaq	3912(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$40:
	leaq	10056(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$38
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$39:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$38:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$39
	leaq	10568(%rsp), %rdx
	leaq	14152(%rsp), %rax
	leaq	6472(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$37:
	leaq	16(%rsp), %rsp
	leaq	3912(%rsp), %rdx
	leaq	14664(%rsp), %rax
	leaq	6984(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$36:
	leaq	16(%rsp), %rsp
	leaq	10568(%rsp), %rax
	leaq	3912(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$35:
	leaq	3912(%rsp), %rdx
	leaq	15176(%rsp), %rax
	leaq	7496(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$34:
	leaq	16(%rsp), %rsp
	leaq	10568(%rsp), %rax
	leaq	3912(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$33:
	leaq	10568(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$31
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$32:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$31:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$32
	leaq	3912(%rsp), %rdx
	leaq	4936(%rsp), %rax
	leaq	6472(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$30:
	leaq	16(%rsp), %rsp
	leaq	4424(%rsp), %rdx
	leaq	5448(%rsp), %rax
	leaq	6984(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$29:
	leaq	16(%rsp), %rsp
	leaq	3912(%rsp), %rax
	leaq	4424(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$28:
	leaq	4424(%rsp), %rdx
	leaq	5960(%rsp), %rax
	leaq	7496(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$27:
	leaq	16(%rsp), %rsp
	leaq	3912(%rsp), %rax
	leaq	4424(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$26:
	leaq	3912(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$24
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$25:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$24:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$25
	leaq	9544(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$23:
	leaq	10056(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$22:
	leaq	10568(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$21:
	leaq	3912(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$20:
	leaq	9544(%rsp), %rax
	leaq	8008(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$19:
	leaq	10056(%rsp), %rax
	leaq	8520(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$18:
	leaq	10568(%rsp), %rax
	leaq	9032(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$17:
	leaq	3912(%rsp), %rax
	leaq	3400(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$16:
	leaq	3912(%rsp), %rax
	leaq	2888(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$15:
	leaq	9544(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$13
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$14:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$13:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$14
	leaq	10056(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$11
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$12:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$11:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$12
	leaq	10568(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$9
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$10:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$9:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$10
	leaq	3912(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$7
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$8:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$7:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$8
	movq	%mm2, %rdx
	movq	%rdx, %r10
	movq	$0, %rsi
	movq	$0, %rdi
	leaq	9544(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$6:
	leaq	10056(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$5:
	leaq	10568(%rsp), %rax
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$4:
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$2
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$3:
	movzwq	9544(%rsp,%rsi,2), %r8
	shlq	$10, %r8
	addq	$1665, %r8
	imulq	$1290167, %r8, %r8
	shrq	$32, %r8
	andq	$1023, %r8
	movzwq	9546(%rsp,%rsi,2), %r9
	shlq	$10, %r9
	addq	$1665, %r9
	imulq	$1290167, %r9, %r9
	shrq	$32, %r9
	andq	$1023, %r9
	movzwq	9548(%rsp,%rsi,2), %r11
	shlq	$10, %r11
	addq	$1665, %r11
	imulq	$1290167, %r11, %r11
	shrq	$32, %r11
	andq	$1023, %r11
	movzwq	9550(%rsp,%rsi,2), %rbp
	shlq	$10, %rbp
	addq	$1665, %rbp
	imulq	$1290167, %rbp, %rbp
	shrq	$32, %rbp
	andq	$1023, %rbp
	movw	%r8w, %ax
	andw	$255, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$8, %r8w
	movw	%r9w, %ax
	shlw	$2, %ax
	orw 	%r8w, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$6, %r9w
	movw	%r11w, %ax
	shlw	$4, %ax
	orw 	%r9w, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrw	$4, %r11w
	movw	%bp, %ax
	shlw	$6, %ax
	orw 	%r11w, %ax
	movb	%al, (%r10,%rdi)
	incq	%rdi
	shrq	$2, %rbp
	movb	%bpl, (%r10,%rdi)
	incq	%rdi
	addq	$4, %rsi
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$2:
	cmpq	$765, %rsi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$3
	leaq	960(%rdx), %rdx
	leaq	3912(%rsp), %rax
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem768_amd64_ref_enc_derand$1:
	movq	8(%rsp), %rcx
	movq	184(%rsp), %rax
	movq	%rax, (%rcx)
	movq	192(%rsp), %rax
	movq	%rax, 8(%rcx)
	movq	200(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	208(%rsp), %rax
	movq	%rax, 24(%rcx)
	movq	%mm0, %rsi
	movq	%mm1, %rdi
	movq	616(%rsp), %rax
	movq	%rax, (%rsi)
	movq	624(%rsp), %rax
	movq	%rax, 8(%rsi)
	movq	632(%rsp), %rax
	movq	%rax, 16(%rsi)
	movq	640(%rsp), %rax
	movq	%rax, 24(%rsi)
	movq	648(%rsp), %rax
	movq	%rax, 32(%rsi)
	movq	656(%rsp), %rax
	movq	%rax, 40(%rsi)
	movq	664(%rsp), %rax
	movq	%rax, 48(%rsi)
	movq	672(%rsp), %rax
	movq	%rax, 56(%rsi)
	movq	680(%rsp), %rax
	movq	%rax, 64(%rsi)
	movq	688(%rsp), %rax
	movq	%rax, 72(%rsi)
	movq	696(%rsp), %rax
	movq	%rax, 80(%rsi)
	movq	704(%rsp), %rax
	movq	%rax, 88(%rsi)
	movq	712(%rsp), %rax
	movq	%rax, 96(%rsi)
	movq	720(%rsp), %rax
	movq	%rax, 104(%rsi)
	movq	728(%rsp), %rax
	movq	%rax, 112(%rsi)
	movq	736(%rsp), %rax
	movq	%rax, 120(%rsi)
	movq	744(%rsp), %rax
	movq	%rax, 128(%rsi)
	movq	752(%rsp), %rax
	movq	%rax, 136(%rsi)
	movq	760(%rsp), %rax
	movq	%rax, 144(%rsi)
	movq	768(%rsp), %rax
	movq	%rax, 152(%rsi)
	movq	776(%rsp), %rax
	movq	%rax, 160(%rsi)
	movq	784(%rsp), %rax
	movq	%rax, 168(%rsi)
	movq	792(%rsp), %rax
	movq	%rax, 176(%rsi)
	movq	800(%rsp), %rax
	movq	%rax, 184(%rsi)
	movq	808(%rsp), %rax
	movq	%rax, 192(%rsi)
	movq	816(%rsp), %rax
	movq	%rax, 200(%rsi)
	movq	824(%rsp), %rax
	movq	%rax, 208(%rsi)
	movq	832(%rsp), %rax
	movq	%rax, 216(%rsi)
	movq	840(%rsp), %rax
	movq	%rax, 224(%rsi)
	movq	848(%rsp), %rax
	movq	%rax, 232(%rsi)
	movq	856(%rsp), %rax
	movq	%rax, 240(%rsi)
	movq	864(%rsp), %rax
	movq	%rax, 248(%rsi)
	movq	872(%rsp), %rax
	movq	%rax, 256(%rsi)
	movq	880(%rsp), %rax
	movq	%rax, 264(%rsi)
	movq	888(%rsp), %rax
	movq	%rax, 272(%rsi)
	movq	896(%rsp), %rax
	movq	%rax, 280(%rsi)
	movq	904(%rsp), %rax
	movq	%rax, 288(%rsi)
	movq	912(%rsp), %rax
	movq	%rax, 296(%rsi)
	movq	920(%rsp), %rax
	movq	%rax, 304(%rsi)
	movq	928(%rsp), %rax
	movq	%rax, 312(%rsi)
	movq	936(%rsp), %rax
	movq	%rax, 320(%rsi)
	movq	944(%rsp), %rax
	movq	%rax, 328(%rsi)
	movq	952(%rsp), %rax
	movq	%rax, 336(%rsi)
	movq	960(%rsp), %rax
	movq	%rax, 344(%rsi)
	movq	968(%rsp), %rax
	movq	%rax, 352(%rsi)
	movq	976(%rsp), %rax
	movq	%rax, 360(%rsi)
	movq	984(%rsp), %rax
	movq	%rax, 368(%rsi)
	movq	992(%rsp), %rax
	movq	%rax, 376(%rsi)
	movq	1000(%rsp), %rax
	movq	%rax, 384(%rsi)
	movq	1008(%rsp), %rax
	movq	%rax, 392(%rsi)
	movq	1016(%rsp), %rax
	movq	%rax, 400(%rsi)
	movq	1024(%rsp), %rax
	movq	%rax, 408(%rsi)
	movq	1032(%rsp), %rax
	movq	%rax, 416(%rsi)
	movq	1040(%rsp), %rax
	movq	%rax, 424(%rsi)
	movq	1048(%rsp), %rax
	movq	%rax, 432(%rsi)
	movq	1056(%rsp), %rax
	movq	%rax, 440(%rsi)
	movq	1064(%rsp), %rax
	movq	%rax, 448(%rsi)
	movq	1072(%rsp), %rax
	movq	%rax, 456(%rsi)
	movq	1080(%rsp), %rax
	movq	%rax, 464(%rsi)
	movq	1088(%rsp), %rax
	movq	%rax, 472(%rsi)
	movq	1096(%rsp), %rax
	movq	%rax, 480(%rsi)
	movq	1104(%rsp), %rax
	movq	%rax, 488(%rsi)
	movq	1112(%rsp), %rax
	movq	%rax, 496(%rsi)
	movq	1120(%rsp), %rax
	movq	%rax, 504(%rsi)
	movq	1128(%rsp), %rax
	movq	%rax, 512(%rsi)
	movq	1136(%rsp), %rax
	movq	%rax, 520(%rsi)
	movq	1144(%rsp), %rax
	movq	%rax, 528(%rsi)
	movq	1152(%rsp), %rax
	movq	%rax, 536(%rsi)
	movq	1160(%rsp), %rax
	movq	%rax, 544(%rsi)
	movq	1168(%rsp), %rax
	movq	%rax, 552(%rsi)
	movq	1176(%rsp), %rax
	movq	%rax, 560(%rsi)
	movq	1184(%rsp), %rax
	movq	%rax, 568(%rsi)
	movq	1192(%rsp), %rax
	movq	%rax, 576(%rsi)
	movq	1200(%rsp), %rax
	movq	%rax, 584(%rsi)
	movq	1208(%rsp), %rax
	movq	%rax, 592(%rsi)
	movq	1216(%rsp), %rax
	movq	%rax, 600(%rsi)
	movq	1224(%rsp), %rax
	movq	%rax, 608(%rsi)
	movq	1232(%rsp), %rax
	movq	%rax, 616(%rsi)
	movq	1240(%rsp), %rax
	movq	%rax, 624(%rsi)
	movq	1248(%rsp), %rax
	movq	%rax, 632(%rsi)
	movq	1256(%rsp), %rax
	movq	%rax, 640(%rsi)
	movq	1264(%rsp), %rax
	movq	%rax, 648(%rsi)
	movq	1272(%rsp), %rax
	movq	%rax, 656(%rsi)
	movq	1280(%rsp), %rax
	movq	%rax, 664(%rsi)
	movq	1288(%rsp), %rax
	movq	%rax, 672(%rsi)
	movq	1296(%rsp), %rax
	movq	%rax, 680(%rsi)
	movq	1304(%rsp), %rax
	movq	%rax, 688(%rsi)
	movq	1312(%rsp), %rax
	movq	%rax, 696(%rsi)
	movq	1320(%rsp), %rax
	movq	%rax, 704(%rsi)
	movq	1328(%rsp), %rax
	movq	%rax, 712(%rsi)
	movq	1336(%rsp), %rax
	movq	%rax, 720(%rsi)
	movq	1344(%rsp), %rax
	movq	%rax, 728(%rsi)
	movq	1352(%rsp), %rax
	movq	%rax, 736(%rsi)
	movq	1360(%rsp), %rax
	movq	%rax, 744(%rsi)
	movq	1368(%rsp), %rax
	movq	%rax, 752(%rsi)
	movq	1376(%rsp), %rax
	movq	%rax, 760(%rsi)
	movq	1384(%rsp), %rax
	movq	%rax, 768(%rsi)
	movq	1392(%rsp), %rax
	movq	%rax, 776(%rsi)
	movq	1400(%rsp), %rax
	movq	%rax, 784(%rsi)
	movq	1408(%rsp), %rax
	movq	%rax, 792(%rsi)
	movq	1416(%rsp), %rax
	movq	%rax, 800(%rsi)
	movq	1424(%rsp), %rax
	movq	%rax, 808(%rsi)
	movq	1432(%rsp), %rax
	movq	%rax, 816(%rsi)
	movq	1440(%rsp), %rax
	movq	%rax, 824(%rsi)
	movq	1448(%rsp), %rax
	movq	%rax, 832(%rsi)
	movq	1456(%rsp), %rax
	movq	%rax, 840(%rsi)
	movq	1464(%rsp), %rax
	movq	%rax, 848(%rsi)
	movq	1472(%rsp), %rax
	movq	%rax, 856(%rsi)
	movq	1480(%rsp), %rax
	movq	%rax, 864(%rsi)
	movq	1488(%rsp), %rax
	movq	%rax, 872(%rsi)
	movq	1496(%rsp), %rax
	movq	%rax, 880(%rsi)
	movq	1504(%rsp), %rax
	movq	%rax, 888(%rsi)
	movq	1512(%rsp), %rax
	movq	%rax, 896(%rsi)
	movq	1520(%rsp), %rax
	movq	%rax, 904(%rsi)
	movq	1528(%rsp), %rax
	movq	%rax, 912(%rsi)
	movq	1536(%rsp), %rax
	movq	%rax, 920(%rsi)
	movq	1544(%rsp), %rax
	movq	%rax, 928(%rsi)
	movq	1552(%rsp), %rax
	movq	%rax, 936(%rsi)
	movq	1560(%rsp), %rax
	movq	%rax, 944(%rsi)
	movq	1568(%rsp), %rax
	movq	%rax, 952(%rsi)
	movq	1576(%rsp), %rax
	movq	%rax, 960(%rsi)
	movq	1584(%rsp), %rax
	movq	%rax, 968(%rsi)
	movq	1592(%rsp), %rax
	movq	%rax, 976(%rsi)
	movq	1600(%rsp), %rax
	movq	%rax, 984(%rsi)
	movq	1608(%rsp), %rax
	movq	%rax, 992(%rsi)
	movq	1616(%rsp), %rax
	movq	%rax, 1000(%rsi)
	movq	1624(%rsp), %rax
	movq	%rax, 1008(%rsi)
	movq	1632(%rsp), %rax
	movq	%rax, 1016(%rsi)
	movq	1640(%rsp), %rax
	movq	%rax, 1024(%rsi)
	movq	1648(%rsp), %rax
	movq	%rax, 1032(%rsi)
	movq	1656(%rsp), %rax
	movq	%rax, 1040(%rsi)
	movq	1664(%rsp), %rax
	movq	%rax, 1048(%rsi)
	movq	1672(%rsp), %rax
	movq	%rax, 1056(%rsi)
	movq	1680(%rsp), %rax
	movq	%rax, 1064(%rsi)
	movq	1688(%rsp), %rax
	movq	%rax, 1072(%rsi)
	movq	1696(%rsp), %rax
	movq	%rax, 1080(%rsi)
	movq	48(%rsp), %rax
	movq	%rax, (%rdi)
	movq	56(%rsp), %rax
	movq	%rax, 8(%rdi)
	movq	64(%rsp), %rax
	movq	%rax, 16(%rdi)
	movq	72(%rsp), %rax
	movq	%rax, 24(%rdi)
	xorl	%eax, %eax
	movq	15688(%rsp), %rbx
	movq	15696(%rsp), %rbp
	movq	15704(%rsp), %r12
	movq	15712(%rsp), %r13
	movq	15720(%rsp), %r14
	movq	15728(%rsp), %r15
	movq	15736(%rsp), %rsp
	ret
	.type	_jade_kem_mlkem_mlkem768_amd64_ref_keypair, %function
	.type	jade_kem_mlkem_mlkem768_amd64_ref_keypair, %function
_jade_kem_mlkem_mlkem768_amd64_ref_keypair:
jade_kem_mlkem_mlkem768_amd64_ref_keypair:
	movq	%rsp, %rax
	leaq	-14032(%rsp), %rsp
	andq	$-16, %rsp
	movq	%rbx, 13976(%rsp)
	movq	%rbp, 13984(%rsp)
	movq	%r12, 13992(%rsp)
	movq	%r13, 14000(%rsp)
	movq	%r14, 14008(%rsp)
	movq	%r15, 14016(%rsp)
	movq	%rax, 14024(%rsp)
	movq	%rdi, %r12
	movq	%rsi, %rbx
	leaq	168(%rsp), %rdi
	movq	$64, %rsi
	call	__jasmin_syscall_randombytes__
	leaq	168(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	%r12, %mm0
	movq	%rbx, %mm1
	movq	(%rcx), %rax
	movq	%rax, 232(%rsp)
	movq	8(%rcx), %rax
	movq	%rax, 240(%rsp)
	movq	16(%rcx), %rax
	movq	%rax, 248(%rsp)
	movq	24(%rcx), %rax
	movq	%rax, 256(%rsp)
	movq	32(%rcx), %rax
	movq	%rax, 264(%rsp)
	movq	40(%rcx), %rax
	movq	%rax, 272(%rsp)
	movq	48(%rcx), %rax
	movq	%rax, 280(%rsp)
	movq	56(%rcx), %rax
	movq	%rax, 288(%rsp)
	leaq	664(%rsp), %r10
	leaq	1848(%rsp), %rax
	leaq	232(%rsp), %rdx
	movq	%rdx, %mm2
	movq	%rax, %rcx
	movq	%rax, (%rsp)
	movq	%r10, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	(%rdx), %rax
	movq	%rax, 88(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 96(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 104(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 112(%rsp)
	movb	$3, 120(%rsp)
	leaq	168(%rsp), %rax
	leaq	88(%rsp), %r10
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$215:
	leaq	224(%rsp), %rsp
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
	movq	192(%rsp), %rax
	movq	%rax, 80(%rsp)
	movq	224(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	$0, %rax
	movq	%rax, %mm3
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
	movb	64(%rsp), %al
	movb	%al, 136(%rsp)
	movb	65(%rsp), %al
	movb	%al, 137(%rsp)
	movb	66(%rsp), %al
	movb	%al, 138(%rsp)
	movb	67(%rsp), %al
	movb	%al, 139(%rsp)
	movb	68(%rsp), %al
	movb	%al, 140(%rsp)
	movb	69(%rsp), %al
	movb	%al, 141(%rsp)
	movb	70(%rsp), %al
	movb	%al, 142(%rsp)
	movb	71(%rsp), %al
	movb	%al, 143(%rsp)
	movb	72(%rsp), %al
	movb	%al, 144(%rsp)
	movb	73(%rsp), %al
	movb	%al, 145(%rsp)
	movb	74(%rsp), %al
	movb	%al, 146(%rsp)
	movb	75(%rsp), %al
	movb	%al, 147(%rsp)
	movb	76(%rsp), %al
	movb	%al, 148(%rsp)
	movb	77(%rsp), %al
	movb	%al, 149(%rsp)
	movb	78(%rsp), %al
	movb	%al, 150(%rsp)
	movb	79(%rsp), %al
	movb	%al, 151(%rsp)
	movb	80(%rsp), %al
	movb	%al, 152(%rsp)
	movb	81(%rsp), %al
	movb	%al, 153(%rsp)
	movb	82(%rsp), %al
	movb	%al, 154(%rsp)
	movb	83(%rsp), %al
	movb	%al, 155(%rsp)
	movb	84(%rsp), %al
	movb	%al, 156(%rsp)
	movb	85(%rsp), %al
	movb	%al, 157(%rsp)
	movb	86(%rsp), %al
	movb	%al, 158(%rsp)
	movb	87(%rsp), %al
	movb	%al, 159(%rsp)
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$213
	movb	$0, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$214
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$213:
	movb	$0, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$214:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$212:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$199
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$200:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$211:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$210
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$209:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	9368(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$197
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$198:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$197:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$198
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$195
	movb	$0, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$196
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$195:
	movb	$1, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$196:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$194:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$181
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$182:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$193:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$192
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$191:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	9880(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$179
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$180:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$179:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$180
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$177
	movb	$0, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$178
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$177:
	movb	$2, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$178:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$176:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$163
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$164:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$175:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$174
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$173:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	10392(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$161
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$162:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$161:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$162
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$159
	movb	$1, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$160
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$159:
	movb	$0, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$160:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$158:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$145
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$146:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$157:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$156
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$155:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	10904(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$143
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$144:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$143:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$144
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$141
	movb	$1, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$142
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$141:
	movb	$1, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$142:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$140:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$127
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$128:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$139:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$138
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$137:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	11416(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$125
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$126:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$125:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$126
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$123
	movb	$1, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$124
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$123:
	movb	$2, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$124:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$122:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$109
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$110:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$121:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$120
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$119:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	11928(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$107
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$108:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$107:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$108
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$105
	movb	$2, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$106
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$105:
	movb	$0, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$106:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$104:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$91
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$92:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$103:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$102
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$101:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	12440(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$89
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$90:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$89:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$90
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$87
	movb	$2, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$88
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$87:
	movb	$1, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$88:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$86:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$73
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$74:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$85:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$84
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$83:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	12952(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$71
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$72:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$71:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$72
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$69
	movb	$2, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$70
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$69:
	movb	$2, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$70:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$68:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$55
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$56:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$67:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$66
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$65:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	13464(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$53
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$54:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$53:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$54
	movb	$0, %al
	leaq	4760(%rsp), %rdx
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$52:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	5272(%rsp), %rdx
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$51:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	5784(%rsp), %rdx
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$50:
	leaq	176(%rsp), %rsp
	movb	$3, %al
	leaq	6296(%rsp), %rdx
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$49:
	leaq	176(%rsp), %rsp
	movb	$4, %al
	leaq	6808(%rsp), %rdx
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$48:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	7320(%rsp), %rdx
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$47:
	leaq	176(%rsp), %rsp
	leaq	4760(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$46:
	leaq	5272(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$45:
	leaq	5784(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$44:
	leaq	6296(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$43:
	leaq	6808(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$42:
	leaq	7320(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$41:
	leaq	7832(%rsp), %rdx
	leaq	9368(%rsp), %rax
	leaq	4760(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$40:
	leaq	16(%rsp), %rsp
	leaq	4248(%rsp), %rdx
	leaq	9880(%rsp), %rax
	leaq	5272(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$39:
	leaq	16(%rsp), %rsp
	leaq	7832(%rsp), %rax
	leaq	4248(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$38:
	leaq	4248(%rsp), %rdx
	leaq	10392(%rsp), %rax
	leaq	5784(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$37:
	leaq	16(%rsp), %rsp
	leaq	7832(%rsp), %rax
	leaq	4248(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$36:
	leaq	7832(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$34
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$35:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$34:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$35
	leaq	7832(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$33:
	leaq	8344(%rsp), %rdx
	leaq	10904(%rsp), %rax
	leaq	4760(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$32:
	leaq	16(%rsp), %rsp
	leaq	4248(%rsp), %rdx
	leaq	11416(%rsp), %rax
	leaq	5272(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$31:
	leaq	16(%rsp), %rsp
	leaq	8344(%rsp), %rax
	leaq	4248(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$30:
	leaq	4248(%rsp), %rdx
	leaq	11928(%rsp), %rax
	leaq	5784(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$29:
	leaq	16(%rsp), %rsp
	leaq	8344(%rsp), %rax
	leaq	4248(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$28:
	leaq	8344(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$26
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$27:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$26:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$27
	leaq	8344(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$25:
	leaq	8856(%rsp), %rdx
	leaq	12440(%rsp), %rax
	leaq	4760(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$24:
	leaq	16(%rsp), %rsp
	leaq	4248(%rsp), %rdx
	leaq	12952(%rsp), %rax
	leaq	5272(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$23:
	leaq	16(%rsp), %rsp
	leaq	8856(%rsp), %rax
	leaq	4248(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$22:
	leaq	4248(%rsp), %rdx
	leaq	13464(%rsp), %rax
	leaq	5784(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$21:
	leaq	16(%rsp), %rsp
	leaq	8856(%rsp), %rax
	leaq	4248(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$20:
	leaq	8856(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$18
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$19:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$18:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$19
	leaq	8856(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$17:
	leaq	7832(%rsp), %rax
	leaq	6296(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$16:
	leaq	8344(%rsp), %rax
	leaq	6808(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$15:
	leaq	8856(%rsp), %rax
	leaq	7320(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$14:
	leaq	7832(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$12
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$13:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$12:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$13
	leaq	8344(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$10
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$11:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$10:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$11
	leaq	8856(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$9:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$8:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$9
	movq	8(%rsp), %r10
	movq	16(%rsp), %rsi
	movq	%rsi, %rdx
	leaq	4760(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$7:
	leaq	384(%rsi), %rdx
	leaq	5272(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$6:
	leaq	768(%rsi), %rdx
	leaq	5784(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$5:
	movq	%r10, %rsi
	movq	%rsi, %rdx
	leaq	7832(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$4:
	leaq	384(%rsi), %rdx
	leaq	8344(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$3:
	leaq	768(%rsi), %rdx
	leaq	8856(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$2:
	movq	56(%rsp), %rax
	movq	%rax, 1152(%r10)
	movq	64(%rsp), %rax
	movq	%rax, 1160(%r10)
	movq	72(%rsp), %rax
	movq	%rax, 1168(%r10)
	movq	80(%rsp), %rax
	movq	%rax, 1176(%r10)
	movq	(%rsp), %rax
	movq	(%r10), %rcx
	movq	%rcx, 1152(%rax)
	movq	8(%r10), %rcx
	movq	%rcx, 1160(%rax)
	movq	16(%r10), %rcx
	movq	%rcx, 1168(%rax)
	movq	24(%r10), %rcx
	movq	%rcx, 1176(%rax)
	movq	32(%r10), %rcx
	movq	%rcx, 1184(%rax)
	movq	40(%r10), %rcx
	movq	%rcx, 1192(%rax)
	movq	48(%r10), %rcx
	movq	%rcx, 1200(%rax)
	movq	56(%r10), %rcx
	movq	%rcx, 1208(%rax)
	movq	64(%r10), %rcx
	movq	%rcx, 1216(%rax)
	movq	72(%r10), %rcx
	movq	%rcx, 1224(%rax)
	movq	80(%r10), %rcx
	movq	%rcx, 1232(%rax)
	movq	88(%r10), %rcx
	movq	%rcx, 1240(%rax)
	movq	96(%r10), %rcx
	movq	%rcx, 1248(%rax)
	movq	104(%r10), %rcx
	movq	%rcx, 1256(%rax)
	movq	112(%r10), %rcx
	movq	%rcx, 1264(%rax)
	movq	120(%r10), %rcx
	movq	%rcx, 1272(%rax)
	movq	128(%r10), %rcx
	movq	%rcx, 1280(%rax)
	movq	136(%r10), %rcx
	movq	%rcx, 1288(%rax)
	movq	144(%r10), %rcx
	movq	%rcx, 1296(%rax)
	movq	152(%r10), %rcx
	movq	%rcx, 1304(%rax)
	movq	160(%r10), %rcx
	movq	%rcx, 1312(%rax)
	movq	168(%r10), %rcx
	movq	%rcx, 1320(%rax)
	movq	176(%r10), %rcx
	movq	%rcx, 1328(%rax)
	movq	184(%r10), %rcx
	movq	%rcx, 1336(%rax)
	movq	192(%r10), %rcx
	movq	%rcx, 1344(%rax)
	movq	200(%r10), %rcx
	movq	%rcx, 1352(%rax)
	movq	208(%r10), %rcx
	movq	%rcx, 1360(%rax)
	movq	216(%r10), %rcx
	movq	%rcx, 1368(%rax)
	movq	224(%r10), %rcx
	movq	%rcx, 1376(%rax)
	movq	232(%r10), %rcx
	movq	%rcx, 1384(%rax)
	movq	240(%r10), %rcx
	movq	%rcx, 1392(%rax)
	movq	248(%r10), %rcx
	movq	%rcx, 1400(%rax)
	movq	256(%r10), %rcx
	movq	%rcx, 1408(%rax)
	movq	264(%r10), %rcx
	movq	%rcx, 1416(%rax)
	movq	272(%r10), %rcx
	movq	%rcx, 1424(%rax)
	movq	280(%r10), %rcx
	movq	%rcx, 1432(%rax)
	movq	288(%r10), %rcx
	movq	%rcx, 1440(%rax)
	movq	296(%r10), %rcx
	movq	%rcx, 1448(%rax)
	movq	304(%r10), %rcx
	movq	%rcx, 1456(%rax)
	movq	312(%r10), %rcx
	movq	%rcx, 1464(%rax)
	movq	320(%r10), %rcx
	movq	%rcx, 1472(%rax)
	movq	328(%r10), %rcx
	movq	%rcx, 1480(%rax)
	movq	336(%r10), %rcx
	movq	%rcx, 1488(%rax)
	movq	344(%r10), %rcx
	movq	%rcx, 1496(%rax)
	movq	352(%r10), %rcx
	movq	%rcx, 1504(%rax)
	movq	360(%r10), %rcx
	movq	%rcx, 1512(%rax)
	movq	368(%r10), %rcx
	movq	%rcx, 1520(%rax)
	movq	376(%r10), %rcx
	movq	%rcx, 1528(%rax)
	movq	384(%r10), %rcx
	movq	%rcx, 1536(%rax)
	movq	392(%r10), %rcx
	movq	%rcx, 1544(%rax)
	movq	400(%r10), %rcx
	movq	%rcx, 1552(%rax)
	movq	408(%r10), %rcx
	movq	%rcx, 1560(%rax)
	movq	416(%r10), %rcx
	movq	%rcx, 1568(%rax)
	movq	424(%r10), %rcx
	movq	%rcx, 1576(%rax)
	movq	432(%r10), %rcx
	movq	%rcx, 1584(%rax)
	movq	440(%r10), %rcx
	movq	%rcx, 1592(%rax)
	movq	448(%r10), %rcx
	movq	%rcx, 1600(%rax)
	movq	456(%r10), %rcx
	movq	%rcx, 1608(%rax)
	movq	464(%r10), %rcx
	movq	%rcx, 1616(%rax)
	movq	472(%r10), %rcx
	movq	%rcx, 1624(%rax)
	movq	480(%r10), %rcx
	movq	%rcx, 1632(%rax)
	movq	488(%r10), %rcx
	movq	%rcx, 1640(%rax)
	movq	496(%r10), %rcx
	movq	%rcx, 1648(%rax)
	movq	504(%r10), %rcx
	movq	%rcx, 1656(%rax)
	movq	512(%r10), %rcx
	movq	%rcx, 1664(%rax)
	movq	520(%r10), %rcx
	movq	%rcx, 1672(%rax)
	movq	528(%r10), %rcx
	movq	%rcx, 1680(%rax)
	movq	536(%r10), %rcx
	movq	%rcx, 1688(%rax)
	movq	544(%r10), %rcx
	movq	%rcx, 1696(%rax)
	movq	552(%r10), %rcx
	movq	%rcx, 1704(%rax)
	movq	560(%r10), %rcx
	movq	%rcx, 1712(%rax)
	movq	568(%r10), %rcx
	movq	%rcx, 1720(%rax)
	movq	576(%r10), %rcx
	movq	%rcx, 1728(%rax)
	movq	584(%r10), %rcx
	movq	%rcx, 1736(%rax)
	movq	592(%r10), %rcx
	movq	%rcx, 1744(%rax)
	movq	600(%r10), %rcx
	movq	%rcx, 1752(%rax)
	movq	608(%r10), %rcx
	movq	%rcx, 1760(%rax)
	movq	616(%r10), %rcx
	movq	%rcx, 1768(%rax)
	movq	624(%r10), %rcx
	movq	%rcx, 1776(%rax)
	movq	632(%r10), %rcx
	movq	%rcx, 1784(%rax)
	movq	640(%r10), %rcx
	movq	%rcx, 1792(%rax)
	movq	648(%r10), %rcx
	movq	%rcx, 1800(%rax)
	movq	656(%r10), %rcx
	movq	%rcx, 1808(%rax)
	movq	664(%r10), %rcx
	movq	%rcx, 1816(%rax)
	movq	672(%r10), %rcx
	movq	%rcx, 1824(%rax)
	movq	680(%r10), %rcx
	movq	%rcx, 1832(%rax)
	movq	688(%r10), %rcx
	movq	%rcx, 1840(%rax)
	movq	696(%r10), %rcx
	movq	%rcx, 1848(%rax)
	movq	704(%r10), %rcx
	movq	%rcx, 1856(%rax)
	movq	712(%r10), %rcx
	movq	%rcx, 1864(%rax)
	movq	720(%r10), %rcx
	movq	%rcx, 1872(%rax)
	movq	728(%r10), %rcx
	movq	%rcx, 1880(%rax)
	movq	736(%r10), %rcx
	movq	%rcx, 1888(%rax)
	movq	744(%r10), %rcx
	movq	%rcx, 1896(%rax)
	movq	752(%r10), %rcx
	movq	%rcx, 1904(%rax)
	movq	760(%r10), %rcx
	movq	%rcx, 1912(%rax)
	movq	768(%r10), %rcx
	movq	%rcx, 1920(%rax)
	movq	776(%r10), %rcx
	movq	%rcx, 1928(%rax)
	movq	784(%r10), %rcx
	movq	%rcx, 1936(%rax)
	movq	792(%r10), %rcx
	movq	%rcx, 1944(%rax)
	movq	800(%r10), %rcx
	movq	%rcx, 1952(%rax)
	movq	808(%r10), %rcx
	movq	%rcx, 1960(%rax)
	movq	816(%r10), %rcx
	movq	%rcx, 1968(%rax)
	movq	824(%r10), %rcx
	movq	%rcx, 1976(%rax)
	movq	832(%r10), %rcx
	movq	%rcx, 1984(%rax)
	movq	840(%r10), %rcx
	movq	%rcx, 1992(%rax)
	movq	848(%r10), %rcx
	movq	%rcx, 2000(%rax)
	movq	856(%r10), %rcx
	movq	%rcx, 2008(%rax)
	movq	864(%r10), %rcx
	movq	%rcx, 2016(%rax)
	movq	872(%r10), %rcx
	movq	%rcx, 2024(%rax)
	movq	880(%r10), %rcx
	movq	%rcx, 2032(%rax)
	movq	888(%r10), %rcx
	movq	%rcx, 2040(%rax)
	movq	896(%r10), %rcx
	movq	%rcx, 2048(%rax)
	movq	904(%r10), %rcx
	movq	%rcx, 2056(%rax)
	movq	912(%r10), %rcx
	movq	%rcx, 2064(%rax)
	movq	920(%r10), %rcx
	movq	%rcx, 2072(%rax)
	movq	928(%r10), %rcx
	movq	%rcx, 2080(%rax)
	movq	936(%r10), %rcx
	movq	%rcx, 2088(%rax)
	movq	944(%r10), %rcx
	movq	%rcx, 2096(%rax)
	movq	952(%r10), %rcx
	movq	%rcx, 2104(%rax)
	movq	960(%r10), %rcx
	movq	%rcx, 2112(%rax)
	movq	968(%r10), %rcx
	movq	%rcx, 2120(%rax)
	movq	976(%r10), %rcx
	movq	%rcx, 2128(%rax)
	movq	984(%r10), %rcx
	movq	%rcx, 2136(%rax)
	movq	992(%r10), %rcx
	movq	%rcx, 2144(%rax)
	movq	1000(%r10), %rcx
	movq	%rcx, 2152(%rax)
	movq	1008(%r10), %rcx
	movq	%rcx, 2160(%rax)
	movq	1016(%r10), %rcx
	movq	%rcx, 2168(%rax)
	movq	1024(%r10), %rcx
	movq	%rcx, 2176(%rax)
	movq	1032(%r10), %rcx
	movq	%rcx, 2184(%rax)
	movq	1040(%r10), %rcx
	movq	%rcx, 2192(%rax)
	movq	1048(%r10), %rcx
	movq	%rcx, 2200(%rax)
	movq	1056(%r10), %rcx
	movq	%rcx, 2208(%rax)
	movq	1064(%r10), %rcx
	movq	%rcx, 2216(%rax)
	movq	1072(%r10), %rcx
	movq	%rcx, 2224(%rax)
	movq	1080(%r10), %rcx
	movq	%rcx, 2232(%rax)
	movq	1088(%r10), %rcx
	movq	%rcx, 2240(%rax)
	movq	1096(%r10), %rcx
	movq	%rcx, 2248(%rax)
	movq	1104(%r10), %rcx
	movq	%rcx, 2256(%rax)
	movq	1112(%r10), %rcx
	movq	%rcx, 2264(%rax)
	movq	1120(%r10), %rcx
	movq	%rcx, 2272(%rax)
	movq	1128(%r10), %rcx
	movq	%rcx, 2280(%rax)
	movq	1136(%r10), %rcx
	movq	%rcx, 2288(%rax)
	movq	1144(%r10), %rcx
	movq	%rcx, 2296(%rax)
	movq	1152(%r10), %rcx
	movq	%rcx, 2304(%rax)
	movq	1160(%r10), %rcx
	movq	%rcx, 2312(%rax)
	movq	1168(%r10), %rcx
	movq	%rcx, 2320(%rax)
	movq	1176(%r10), %rcx
	movq	%rcx, 2328(%rax)
	movq	%rax, (%rsp)
	leaq	56(%rsp), %rax
	leaq	-232(%rsp), %rsp
	call	L_sha3_256A_A1184$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair$1:
	leaq	232(%rsp), %rsp
	movq	(%rsp), %rax
	movq	56(%rsp), %rcx
	movq	%rcx, 2336(%rax)
	movq	64(%rsp), %rcx
	movq	%rcx, 2344(%rax)
	movq	72(%rsp), %rcx
	movq	%rcx, 2352(%rax)
	movq	80(%rsp), %rcx
	movq	%rcx, 2360(%rax)
	movq	%mm2, %rdx
	leaq	32(%rdx), %rcx
	movq	(%rcx), %rsi
	movq	%rsi, 2368(%rax)
	movq	8(%rcx), %rsi
	movq	%rsi, 2376(%rax)
	movq	16(%rcx), %rsi
	movq	%rsi, 2384(%rax)
	movq	24(%rcx), %rcx
	movq	%rcx, 2392(%rax)
	movq	%mm0, %rdx
	movq	%mm1, %rsi
	movq	664(%rsp), %rax
	movq	%rax, (%rdx)
	movq	672(%rsp), %rax
	movq	%rax, 8(%rdx)
	movq	680(%rsp), %rax
	movq	%rax, 16(%rdx)
	movq	688(%rsp), %rax
	movq	%rax, 24(%rdx)
	movq	696(%rsp), %rax
	movq	%rax, 32(%rdx)
	movq	704(%rsp), %rax
	movq	%rax, 40(%rdx)
	movq	712(%rsp), %rax
	movq	%rax, 48(%rdx)
	movq	720(%rsp), %rax
	movq	%rax, 56(%rdx)
	movq	728(%rsp), %rax
	movq	%rax, 64(%rdx)
	movq	736(%rsp), %rax
	movq	%rax, 72(%rdx)
	movq	744(%rsp), %rax
	movq	%rax, 80(%rdx)
	movq	752(%rsp), %rax
	movq	%rax, 88(%rdx)
	movq	760(%rsp), %rax
	movq	%rax, 96(%rdx)
	movq	768(%rsp), %rax
	movq	%rax, 104(%rdx)
	movq	776(%rsp), %rax
	movq	%rax, 112(%rdx)
	movq	784(%rsp), %rax
	movq	%rax, 120(%rdx)
	movq	792(%rsp), %rax
	movq	%rax, 128(%rdx)
	movq	800(%rsp), %rax
	movq	%rax, 136(%rdx)
	movq	808(%rsp), %rax
	movq	%rax, 144(%rdx)
	movq	816(%rsp), %rax
	movq	%rax, 152(%rdx)
	movq	824(%rsp), %rax
	movq	%rax, 160(%rdx)
	movq	832(%rsp), %rax
	movq	%rax, 168(%rdx)
	movq	840(%rsp), %rax
	movq	%rax, 176(%rdx)
	movq	848(%rsp), %rax
	movq	%rax, 184(%rdx)
	movq	856(%rsp), %rax
	movq	%rax, 192(%rdx)
	movq	864(%rsp), %rax
	movq	%rax, 200(%rdx)
	movq	872(%rsp), %rax
	movq	%rax, 208(%rdx)
	movq	880(%rsp), %rax
	movq	%rax, 216(%rdx)
	movq	888(%rsp), %rax
	movq	%rax, 224(%rdx)
	movq	896(%rsp), %rax
	movq	%rax, 232(%rdx)
	movq	904(%rsp), %rax
	movq	%rax, 240(%rdx)
	movq	912(%rsp), %rax
	movq	%rax, 248(%rdx)
	movq	920(%rsp), %rax
	movq	%rax, 256(%rdx)
	movq	928(%rsp), %rax
	movq	%rax, 264(%rdx)
	movq	936(%rsp), %rax
	movq	%rax, 272(%rdx)
	movq	944(%rsp), %rax
	movq	%rax, 280(%rdx)
	movq	952(%rsp), %rax
	movq	%rax, 288(%rdx)
	movq	960(%rsp), %rax
	movq	%rax, 296(%rdx)
	movq	968(%rsp), %rax
	movq	%rax, 304(%rdx)
	movq	976(%rsp), %rax
	movq	%rax, 312(%rdx)
	movq	984(%rsp), %rax
	movq	%rax, 320(%rdx)
	movq	992(%rsp), %rax
	movq	%rax, 328(%rdx)
	movq	1000(%rsp), %rax
	movq	%rax, 336(%rdx)
	movq	1008(%rsp), %rax
	movq	%rax, 344(%rdx)
	movq	1016(%rsp), %rax
	movq	%rax, 352(%rdx)
	movq	1024(%rsp), %rax
	movq	%rax, 360(%rdx)
	movq	1032(%rsp), %rax
	movq	%rax, 368(%rdx)
	movq	1040(%rsp), %rax
	movq	%rax, 376(%rdx)
	movq	1048(%rsp), %rax
	movq	%rax, 384(%rdx)
	movq	1056(%rsp), %rax
	movq	%rax, 392(%rdx)
	movq	1064(%rsp), %rax
	movq	%rax, 400(%rdx)
	movq	1072(%rsp), %rax
	movq	%rax, 408(%rdx)
	movq	1080(%rsp), %rax
	movq	%rax, 416(%rdx)
	movq	1088(%rsp), %rax
	movq	%rax, 424(%rdx)
	movq	1096(%rsp), %rax
	movq	%rax, 432(%rdx)
	movq	1104(%rsp), %rax
	movq	%rax, 440(%rdx)
	movq	1112(%rsp), %rax
	movq	%rax, 448(%rdx)
	movq	1120(%rsp), %rax
	movq	%rax, 456(%rdx)
	movq	1128(%rsp), %rax
	movq	%rax, 464(%rdx)
	movq	1136(%rsp), %rax
	movq	%rax, 472(%rdx)
	movq	1144(%rsp), %rax
	movq	%rax, 480(%rdx)
	movq	1152(%rsp), %rax
	movq	%rax, 488(%rdx)
	movq	1160(%rsp), %rax
	movq	%rax, 496(%rdx)
	movq	1168(%rsp), %rax
	movq	%rax, 504(%rdx)
	movq	1176(%rsp), %rax
	movq	%rax, 512(%rdx)
	movq	1184(%rsp), %rax
	movq	%rax, 520(%rdx)
	movq	1192(%rsp), %rax
	movq	%rax, 528(%rdx)
	movq	1200(%rsp), %rax
	movq	%rax, 536(%rdx)
	movq	1208(%rsp), %rax
	movq	%rax, 544(%rdx)
	movq	1216(%rsp), %rax
	movq	%rax, 552(%rdx)
	movq	1224(%rsp), %rax
	movq	%rax, 560(%rdx)
	movq	1232(%rsp), %rax
	movq	%rax, 568(%rdx)
	movq	1240(%rsp), %rax
	movq	%rax, 576(%rdx)
	movq	1248(%rsp), %rax
	movq	%rax, 584(%rdx)
	movq	1256(%rsp), %rax
	movq	%rax, 592(%rdx)
	movq	1264(%rsp), %rax
	movq	%rax, 600(%rdx)
	movq	1272(%rsp), %rax
	movq	%rax, 608(%rdx)
	movq	1280(%rsp), %rax
	movq	%rax, 616(%rdx)
	movq	1288(%rsp), %rax
	movq	%rax, 624(%rdx)
	movq	1296(%rsp), %rax
	movq	%rax, 632(%rdx)
	movq	1304(%rsp), %rax
	movq	%rax, 640(%rdx)
	movq	1312(%rsp), %rax
	movq	%rax, 648(%rdx)
	movq	1320(%rsp), %rax
	movq	%rax, 656(%rdx)
	movq	1328(%rsp), %rax
	movq	%rax, 664(%rdx)
	movq	1336(%rsp), %rax
	movq	%rax, 672(%rdx)
	movq	1344(%rsp), %rax
	movq	%rax, 680(%rdx)
	movq	1352(%rsp), %rax
	movq	%rax, 688(%rdx)
	movq	1360(%rsp), %rax
	movq	%rax, 696(%rdx)
	movq	1368(%rsp), %rax
	movq	%rax, 704(%rdx)
	movq	1376(%rsp), %rax
	movq	%rax, 712(%rdx)
	movq	1384(%rsp), %rax
	movq	%rax, 720(%rdx)
	movq	1392(%rsp), %rax
	movq	%rax, 728(%rdx)
	movq	1400(%rsp), %rax
	movq	%rax, 736(%rdx)
	movq	1408(%rsp), %rax
	movq	%rax, 744(%rdx)
	movq	1416(%rsp), %rax
	movq	%rax, 752(%rdx)
	movq	1424(%rsp), %rax
	movq	%rax, 760(%rdx)
	movq	1432(%rsp), %rax
	movq	%rax, 768(%rdx)
	movq	1440(%rsp), %rax
	movq	%rax, 776(%rdx)
	movq	1448(%rsp), %rax
	movq	%rax, 784(%rdx)
	movq	1456(%rsp), %rax
	movq	%rax, 792(%rdx)
	movq	1464(%rsp), %rax
	movq	%rax, 800(%rdx)
	movq	1472(%rsp), %rax
	movq	%rax, 808(%rdx)
	movq	1480(%rsp), %rax
	movq	%rax, 816(%rdx)
	movq	1488(%rsp), %rax
	movq	%rax, 824(%rdx)
	movq	1496(%rsp), %rax
	movq	%rax, 832(%rdx)
	movq	1504(%rsp), %rax
	movq	%rax, 840(%rdx)
	movq	1512(%rsp), %rax
	movq	%rax, 848(%rdx)
	movq	1520(%rsp), %rax
	movq	%rax, 856(%rdx)
	movq	1528(%rsp), %rax
	movq	%rax, 864(%rdx)
	movq	1536(%rsp), %rax
	movq	%rax, 872(%rdx)
	movq	1544(%rsp), %rax
	movq	%rax, 880(%rdx)
	movq	1552(%rsp), %rax
	movq	%rax, 888(%rdx)
	movq	1560(%rsp), %rax
	movq	%rax, 896(%rdx)
	movq	1568(%rsp), %rax
	movq	%rax, 904(%rdx)
	movq	1576(%rsp), %rax
	movq	%rax, 912(%rdx)
	movq	1584(%rsp), %rax
	movq	%rax, 920(%rdx)
	movq	1592(%rsp), %rax
	movq	%rax, 928(%rdx)
	movq	1600(%rsp), %rax
	movq	%rax, 936(%rdx)
	movq	1608(%rsp), %rax
	movq	%rax, 944(%rdx)
	movq	1616(%rsp), %rax
	movq	%rax, 952(%rdx)
	movq	1624(%rsp), %rax
	movq	%rax, 960(%rdx)
	movq	1632(%rsp), %rax
	movq	%rax, 968(%rdx)
	movq	1640(%rsp), %rax
	movq	%rax, 976(%rdx)
	movq	1648(%rsp), %rax
	movq	%rax, 984(%rdx)
	movq	1656(%rsp), %rax
	movq	%rax, 992(%rdx)
	movq	1664(%rsp), %rax
	movq	%rax, 1000(%rdx)
	movq	1672(%rsp), %rax
	movq	%rax, 1008(%rdx)
	movq	1680(%rsp), %rax
	movq	%rax, 1016(%rdx)
	movq	1688(%rsp), %rax
	movq	%rax, 1024(%rdx)
	movq	1696(%rsp), %rax
	movq	%rax, 1032(%rdx)
	movq	1704(%rsp), %rax
	movq	%rax, 1040(%rdx)
	movq	1712(%rsp), %rax
	movq	%rax, 1048(%rdx)
	movq	1720(%rsp), %rax
	movq	%rax, 1056(%rdx)
	movq	1728(%rsp), %rax
	movq	%rax, 1064(%rdx)
	movq	1736(%rsp), %rax
	movq	%rax, 1072(%rdx)
	movq	1744(%rsp), %rax
	movq	%rax, 1080(%rdx)
	movq	1752(%rsp), %rax
	movq	%rax, 1088(%rdx)
	movq	1760(%rsp), %rax
	movq	%rax, 1096(%rdx)
	movq	1768(%rsp), %rax
	movq	%rax, 1104(%rdx)
	movq	1776(%rsp), %rax
	movq	%rax, 1112(%rdx)
	movq	1784(%rsp), %rax
	movq	%rax, 1120(%rdx)
	movq	1792(%rsp), %rax
	movq	%rax, 1128(%rdx)
	movq	1800(%rsp), %rax
	movq	%rax, 1136(%rdx)
	movq	1808(%rsp), %rax
	movq	%rax, 1144(%rdx)
	movq	1816(%rsp), %rax
	movq	%rax, 1152(%rdx)
	movq	1824(%rsp), %rax
	movq	%rax, 1160(%rdx)
	movq	1832(%rsp), %rax
	movq	%rax, 1168(%rdx)
	movq	1840(%rsp), %rax
	movq	%rax, 1176(%rdx)
	movq	1848(%rsp), %rax
	movq	%rax, (%rsi)
	movq	1856(%rsp), %rax
	movq	%rax, 8(%rsi)
	movq	1864(%rsp), %rax
	movq	%rax, 16(%rsi)
	movq	1872(%rsp), %rax
	movq	%rax, 24(%rsi)
	movq	1880(%rsp), %rax
	movq	%rax, 32(%rsi)
	movq	1888(%rsp), %rax
	movq	%rax, 40(%rsi)
	movq	1896(%rsp), %rax
	movq	%rax, 48(%rsi)
	movq	1904(%rsp), %rax
	movq	%rax, 56(%rsi)
	movq	1912(%rsp), %rax
	movq	%rax, 64(%rsi)
	movq	1920(%rsp), %rax
	movq	%rax, 72(%rsi)
	movq	1928(%rsp), %rax
	movq	%rax, 80(%rsi)
	movq	1936(%rsp), %rax
	movq	%rax, 88(%rsi)
	movq	1944(%rsp), %rax
	movq	%rax, 96(%rsi)
	movq	1952(%rsp), %rax
	movq	%rax, 104(%rsi)
	movq	1960(%rsp), %rax
	movq	%rax, 112(%rsi)
	movq	1968(%rsp), %rax
	movq	%rax, 120(%rsi)
	movq	1976(%rsp), %rax
	movq	%rax, 128(%rsi)
	movq	1984(%rsp), %rax
	movq	%rax, 136(%rsi)
	movq	1992(%rsp), %rax
	movq	%rax, 144(%rsi)
	movq	2000(%rsp), %rax
	movq	%rax, 152(%rsi)
	movq	2008(%rsp), %rax
	movq	%rax, 160(%rsi)
	movq	2016(%rsp), %rax
	movq	%rax, 168(%rsi)
	movq	2024(%rsp), %rax
	movq	%rax, 176(%rsi)
	movq	2032(%rsp), %rax
	movq	%rax, 184(%rsi)
	movq	2040(%rsp), %rax
	movq	%rax, 192(%rsi)
	movq	2048(%rsp), %rax
	movq	%rax, 200(%rsi)
	movq	2056(%rsp), %rax
	movq	%rax, 208(%rsi)
	movq	2064(%rsp), %rax
	movq	%rax, 216(%rsi)
	movq	2072(%rsp), %rax
	movq	%rax, 224(%rsi)
	movq	2080(%rsp), %rax
	movq	%rax, 232(%rsi)
	movq	2088(%rsp), %rax
	movq	%rax, 240(%rsi)
	movq	2096(%rsp), %rax
	movq	%rax, 248(%rsi)
	movq	2104(%rsp), %rax
	movq	%rax, 256(%rsi)
	movq	2112(%rsp), %rax
	movq	%rax, 264(%rsi)
	movq	2120(%rsp), %rax
	movq	%rax, 272(%rsi)
	movq	2128(%rsp), %rax
	movq	%rax, 280(%rsi)
	movq	2136(%rsp), %rax
	movq	%rax, 288(%rsi)
	movq	2144(%rsp), %rax
	movq	%rax, 296(%rsi)
	movq	2152(%rsp), %rax
	movq	%rax, 304(%rsi)
	movq	2160(%rsp), %rax
	movq	%rax, 312(%rsi)
	movq	2168(%rsp), %rax
	movq	%rax, 320(%rsi)
	movq	2176(%rsp), %rax
	movq	%rax, 328(%rsi)
	movq	2184(%rsp), %rax
	movq	%rax, 336(%rsi)
	movq	2192(%rsp), %rax
	movq	%rax, 344(%rsi)
	movq	2200(%rsp), %rax
	movq	%rax, 352(%rsi)
	movq	2208(%rsp), %rax
	movq	%rax, 360(%rsi)
	movq	2216(%rsp), %rax
	movq	%rax, 368(%rsi)
	movq	2224(%rsp), %rax
	movq	%rax, 376(%rsi)
	movq	2232(%rsp), %rax
	movq	%rax, 384(%rsi)
	movq	2240(%rsp), %rax
	movq	%rax, 392(%rsi)
	movq	2248(%rsp), %rax
	movq	%rax, 400(%rsi)
	movq	2256(%rsp), %rax
	movq	%rax, 408(%rsi)
	movq	2264(%rsp), %rax
	movq	%rax, 416(%rsi)
	movq	2272(%rsp), %rax
	movq	%rax, 424(%rsi)
	movq	2280(%rsp), %rax
	movq	%rax, 432(%rsi)
	movq	2288(%rsp), %rax
	movq	%rax, 440(%rsi)
	movq	2296(%rsp), %rax
	movq	%rax, 448(%rsi)
	movq	2304(%rsp), %rax
	movq	%rax, 456(%rsi)
	movq	2312(%rsp), %rax
	movq	%rax, 464(%rsi)
	movq	2320(%rsp), %rax
	movq	%rax, 472(%rsi)
	movq	2328(%rsp), %rax
	movq	%rax, 480(%rsi)
	movq	2336(%rsp), %rax
	movq	%rax, 488(%rsi)
	movq	2344(%rsp), %rax
	movq	%rax, 496(%rsi)
	movq	2352(%rsp), %rax
	movq	%rax, 504(%rsi)
	movq	2360(%rsp), %rax
	movq	%rax, 512(%rsi)
	movq	2368(%rsp), %rax
	movq	%rax, 520(%rsi)
	movq	2376(%rsp), %rax
	movq	%rax, 528(%rsi)
	movq	2384(%rsp), %rax
	movq	%rax, 536(%rsi)
	movq	2392(%rsp), %rax
	movq	%rax, 544(%rsi)
	movq	2400(%rsp), %rax
	movq	%rax, 552(%rsi)
	movq	2408(%rsp), %rax
	movq	%rax, 560(%rsi)
	movq	2416(%rsp), %rax
	movq	%rax, 568(%rsi)
	movq	2424(%rsp), %rax
	movq	%rax, 576(%rsi)
	movq	2432(%rsp), %rax
	movq	%rax, 584(%rsi)
	movq	2440(%rsp), %rax
	movq	%rax, 592(%rsi)
	movq	2448(%rsp), %rax
	movq	%rax, 600(%rsi)
	movq	2456(%rsp), %rax
	movq	%rax, 608(%rsi)
	movq	2464(%rsp), %rax
	movq	%rax, 616(%rsi)
	movq	2472(%rsp), %rax
	movq	%rax, 624(%rsi)
	movq	2480(%rsp), %rax
	movq	%rax, 632(%rsi)
	movq	2488(%rsp), %rax
	movq	%rax, 640(%rsi)
	movq	2496(%rsp), %rax
	movq	%rax, 648(%rsi)
	movq	2504(%rsp), %rax
	movq	%rax, 656(%rsi)
	movq	2512(%rsp), %rax
	movq	%rax, 664(%rsi)
	movq	2520(%rsp), %rax
	movq	%rax, 672(%rsi)
	movq	2528(%rsp), %rax
	movq	%rax, 680(%rsi)
	movq	2536(%rsp), %rax
	movq	%rax, 688(%rsi)
	movq	2544(%rsp), %rax
	movq	%rax, 696(%rsi)
	movq	2552(%rsp), %rax
	movq	%rax, 704(%rsi)
	movq	2560(%rsp), %rax
	movq	%rax, 712(%rsi)
	movq	2568(%rsp), %rax
	movq	%rax, 720(%rsi)
	movq	2576(%rsp), %rax
	movq	%rax, 728(%rsi)
	movq	2584(%rsp), %rax
	movq	%rax, 736(%rsi)
	movq	2592(%rsp), %rax
	movq	%rax, 744(%rsi)
	movq	2600(%rsp), %rax
	movq	%rax, 752(%rsi)
	movq	2608(%rsp), %rax
	movq	%rax, 760(%rsi)
	movq	2616(%rsp), %rax
	movq	%rax, 768(%rsi)
	movq	2624(%rsp), %rax
	movq	%rax, 776(%rsi)
	movq	2632(%rsp), %rax
	movq	%rax, 784(%rsi)
	movq	2640(%rsp), %rax
	movq	%rax, 792(%rsi)
	movq	2648(%rsp), %rax
	movq	%rax, 800(%rsi)
	movq	2656(%rsp), %rax
	movq	%rax, 808(%rsi)
	movq	2664(%rsp), %rax
	movq	%rax, 816(%rsi)
	movq	2672(%rsp), %rax
	movq	%rax, 824(%rsi)
	movq	2680(%rsp), %rax
	movq	%rax, 832(%rsi)
	movq	2688(%rsp), %rax
	movq	%rax, 840(%rsi)
	movq	2696(%rsp), %rax
	movq	%rax, 848(%rsi)
	movq	2704(%rsp), %rax
	movq	%rax, 856(%rsi)
	movq	2712(%rsp), %rax
	movq	%rax, 864(%rsi)
	movq	2720(%rsp), %rax
	movq	%rax, 872(%rsi)
	movq	2728(%rsp), %rax
	movq	%rax, 880(%rsi)
	movq	2736(%rsp), %rax
	movq	%rax, 888(%rsi)
	movq	2744(%rsp), %rax
	movq	%rax, 896(%rsi)
	movq	2752(%rsp), %rax
	movq	%rax, 904(%rsi)
	movq	2760(%rsp), %rax
	movq	%rax, 912(%rsi)
	movq	2768(%rsp), %rax
	movq	%rax, 920(%rsi)
	movq	2776(%rsp), %rax
	movq	%rax, 928(%rsi)
	movq	2784(%rsp), %rax
	movq	%rax, 936(%rsi)
	movq	2792(%rsp), %rax
	movq	%rax, 944(%rsi)
	movq	2800(%rsp), %rax
	movq	%rax, 952(%rsi)
	movq	2808(%rsp), %rax
	movq	%rax, 960(%rsi)
	movq	2816(%rsp), %rax
	movq	%rax, 968(%rsi)
	movq	2824(%rsp), %rax
	movq	%rax, 976(%rsi)
	movq	2832(%rsp), %rax
	movq	%rax, 984(%rsi)
	movq	2840(%rsp), %rax
	movq	%rax, 992(%rsi)
	movq	2848(%rsp), %rax
	movq	%rax, 1000(%rsi)
	movq	2856(%rsp), %rax
	movq	%rax, 1008(%rsi)
	movq	2864(%rsp), %rax
	movq	%rax, 1016(%rsi)
	movq	2872(%rsp), %rax
	movq	%rax, 1024(%rsi)
	movq	2880(%rsp), %rax
	movq	%rax, 1032(%rsi)
	movq	2888(%rsp), %rax
	movq	%rax, 1040(%rsi)
	movq	2896(%rsp), %rax
	movq	%rax, 1048(%rsi)
	movq	2904(%rsp), %rax
	movq	%rax, 1056(%rsi)
	movq	2912(%rsp), %rax
	movq	%rax, 1064(%rsi)
	movq	2920(%rsp), %rax
	movq	%rax, 1072(%rsi)
	movq	2928(%rsp), %rax
	movq	%rax, 1080(%rsi)
	movq	2936(%rsp), %rax
	movq	%rax, 1088(%rsi)
	movq	2944(%rsp), %rax
	movq	%rax, 1096(%rsi)
	movq	2952(%rsp), %rax
	movq	%rax, 1104(%rsi)
	movq	2960(%rsp), %rax
	movq	%rax, 1112(%rsi)
	movq	2968(%rsp), %rax
	movq	%rax, 1120(%rsi)
	movq	2976(%rsp), %rax
	movq	%rax, 1128(%rsi)
	movq	2984(%rsp), %rax
	movq	%rax, 1136(%rsi)
	movq	2992(%rsp), %rax
	movq	%rax, 1144(%rsi)
	movq	3000(%rsp), %rax
	movq	%rax, 1152(%rsi)
	movq	3008(%rsp), %rax
	movq	%rax, 1160(%rsi)
	movq	3016(%rsp), %rax
	movq	%rax, 1168(%rsi)
	movq	3024(%rsp), %rax
	movq	%rax, 1176(%rsi)
	movq	3032(%rsp), %rax
	movq	%rax, 1184(%rsi)
	movq	3040(%rsp), %rax
	movq	%rax, 1192(%rsi)
	movq	3048(%rsp), %rax
	movq	%rax, 1200(%rsi)
	movq	3056(%rsp), %rax
	movq	%rax, 1208(%rsi)
	movq	3064(%rsp), %rax
	movq	%rax, 1216(%rsi)
	movq	3072(%rsp), %rax
	movq	%rax, 1224(%rsi)
	movq	3080(%rsp), %rax
	movq	%rax, 1232(%rsi)
	movq	3088(%rsp), %rax
	movq	%rax, 1240(%rsi)
	movq	3096(%rsp), %rax
	movq	%rax, 1248(%rsi)
	movq	3104(%rsp), %rax
	movq	%rax, 1256(%rsi)
	movq	3112(%rsp), %rax
	movq	%rax, 1264(%rsi)
	movq	3120(%rsp), %rax
	movq	%rax, 1272(%rsi)
	movq	3128(%rsp), %rax
	movq	%rax, 1280(%rsi)
	movq	3136(%rsp), %rax
	movq	%rax, 1288(%rsi)
	movq	3144(%rsp), %rax
	movq	%rax, 1296(%rsi)
	movq	3152(%rsp), %rax
	movq	%rax, 1304(%rsi)
	movq	3160(%rsp), %rax
	movq	%rax, 1312(%rsi)
	movq	3168(%rsp), %rax
	movq	%rax, 1320(%rsi)
	movq	3176(%rsp), %rax
	movq	%rax, 1328(%rsi)
	movq	3184(%rsp), %rax
	movq	%rax, 1336(%rsi)
	movq	3192(%rsp), %rax
	movq	%rax, 1344(%rsi)
	movq	3200(%rsp), %rax
	movq	%rax, 1352(%rsi)
	movq	3208(%rsp), %rax
	movq	%rax, 1360(%rsi)
	movq	3216(%rsp), %rax
	movq	%rax, 1368(%rsi)
	movq	3224(%rsp), %rax
	movq	%rax, 1376(%rsi)
	movq	3232(%rsp), %rax
	movq	%rax, 1384(%rsi)
	movq	3240(%rsp), %rax
	movq	%rax, 1392(%rsi)
	movq	3248(%rsp), %rax
	movq	%rax, 1400(%rsi)
	movq	3256(%rsp), %rax
	movq	%rax, 1408(%rsi)
	movq	3264(%rsp), %rax
	movq	%rax, 1416(%rsi)
	movq	3272(%rsp), %rax
	movq	%rax, 1424(%rsi)
	movq	3280(%rsp), %rax
	movq	%rax, 1432(%rsi)
	movq	3288(%rsp), %rax
	movq	%rax, 1440(%rsi)
	movq	3296(%rsp), %rax
	movq	%rax, 1448(%rsi)
	movq	3304(%rsp), %rax
	movq	%rax, 1456(%rsi)
	movq	3312(%rsp), %rax
	movq	%rax, 1464(%rsi)
	movq	3320(%rsp), %rax
	movq	%rax, 1472(%rsi)
	movq	3328(%rsp), %rax
	movq	%rax, 1480(%rsi)
	movq	3336(%rsp), %rax
	movq	%rax, 1488(%rsi)
	movq	3344(%rsp), %rax
	movq	%rax, 1496(%rsi)
	movq	3352(%rsp), %rax
	movq	%rax, 1504(%rsi)
	movq	3360(%rsp), %rax
	movq	%rax, 1512(%rsi)
	movq	3368(%rsp), %rax
	movq	%rax, 1520(%rsi)
	movq	3376(%rsp), %rax
	movq	%rax, 1528(%rsi)
	movq	3384(%rsp), %rax
	movq	%rax, 1536(%rsi)
	movq	3392(%rsp), %rax
	movq	%rax, 1544(%rsi)
	movq	3400(%rsp), %rax
	movq	%rax, 1552(%rsi)
	movq	3408(%rsp), %rax
	movq	%rax, 1560(%rsi)
	movq	3416(%rsp), %rax
	movq	%rax, 1568(%rsi)
	movq	3424(%rsp), %rax
	movq	%rax, 1576(%rsi)
	movq	3432(%rsp), %rax
	movq	%rax, 1584(%rsi)
	movq	3440(%rsp), %rax
	movq	%rax, 1592(%rsi)
	movq	3448(%rsp), %rax
	movq	%rax, 1600(%rsi)
	movq	3456(%rsp), %rax
	movq	%rax, 1608(%rsi)
	movq	3464(%rsp), %rax
	movq	%rax, 1616(%rsi)
	movq	3472(%rsp), %rax
	movq	%rax, 1624(%rsi)
	movq	3480(%rsp), %rax
	movq	%rax, 1632(%rsi)
	movq	3488(%rsp), %rax
	movq	%rax, 1640(%rsi)
	movq	3496(%rsp), %rax
	movq	%rax, 1648(%rsi)
	movq	3504(%rsp), %rax
	movq	%rax, 1656(%rsi)
	movq	3512(%rsp), %rax
	movq	%rax, 1664(%rsi)
	movq	3520(%rsp), %rax
	movq	%rax, 1672(%rsi)
	movq	3528(%rsp), %rax
	movq	%rax, 1680(%rsi)
	movq	3536(%rsp), %rax
	movq	%rax, 1688(%rsi)
	movq	3544(%rsp), %rax
	movq	%rax, 1696(%rsi)
	movq	3552(%rsp), %rax
	movq	%rax, 1704(%rsi)
	movq	3560(%rsp), %rax
	movq	%rax, 1712(%rsi)
	movq	3568(%rsp), %rax
	movq	%rax, 1720(%rsi)
	movq	3576(%rsp), %rax
	movq	%rax, 1728(%rsi)
	movq	3584(%rsp), %rax
	movq	%rax, 1736(%rsi)
	movq	3592(%rsp), %rax
	movq	%rax, 1744(%rsi)
	movq	3600(%rsp), %rax
	movq	%rax, 1752(%rsi)
	movq	3608(%rsp), %rax
	movq	%rax, 1760(%rsi)
	movq	3616(%rsp), %rax
	movq	%rax, 1768(%rsi)
	movq	3624(%rsp), %rax
	movq	%rax, 1776(%rsi)
	movq	3632(%rsp), %rax
	movq	%rax, 1784(%rsi)
	movq	3640(%rsp), %rax
	movq	%rax, 1792(%rsi)
	movq	3648(%rsp), %rax
	movq	%rax, 1800(%rsi)
	movq	3656(%rsp), %rax
	movq	%rax, 1808(%rsi)
	movq	3664(%rsp), %rax
	movq	%rax, 1816(%rsi)
	movq	3672(%rsp), %rax
	movq	%rax, 1824(%rsi)
	movq	3680(%rsp), %rax
	movq	%rax, 1832(%rsi)
	movq	3688(%rsp), %rax
	movq	%rax, 1840(%rsi)
	movq	3696(%rsp), %rax
	movq	%rax, 1848(%rsi)
	movq	3704(%rsp), %rax
	movq	%rax, 1856(%rsi)
	movq	3712(%rsp), %rax
	movq	%rax, 1864(%rsi)
	movq	3720(%rsp), %rax
	movq	%rax, 1872(%rsi)
	movq	3728(%rsp), %rax
	movq	%rax, 1880(%rsi)
	movq	3736(%rsp), %rax
	movq	%rax, 1888(%rsi)
	movq	3744(%rsp), %rax
	movq	%rax, 1896(%rsi)
	movq	3752(%rsp), %rax
	movq	%rax, 1904(%rsi)
	movq	3760(%rsp), %rax
	movq	%rax, 1912(%rsi)
	movq	3768(%rsp), %rax
	movq	%rax, 1920(%rsi)
	movq	3776(%rsp), %rax
	movq	%rax, 1928(%rsi)
	movq	3784(%rsp), %rax
	movq	%rax, 1936(%rsi)
	movq	3792(%rsp), %rax
	movq	%rax, 1944(%rsi)
	movq	3800(%rsp), %rax
	movq	%rax, 1952(%rsi)
	movq	3808(%rsp), %rax
	movq	%rax, 1960(%rsi)
	movq	3816(%rsp), %rax
	movq	%rax, 1968(%rsi)
	movq	3824(%rsp), %rax
	movq	%rax, 1976(%rsi)
	movq	3832(%rsp), %rax
	movq	%rax, 1984(%rsi)
	movq	3840(%rsp), %rax
	movq	%rax, 1992(%rsi)
	movq	3848(%rsp), %rax
	movq	%rax, 2000(%rsi)
	movq	3856(%rsp), %rax
	movq	%rax, 2008(%rsi)
	movq	3864(%rsp), %rax
	movq	%rax, 2016(%rsi)
	movq	3872(%rsp), %rax
	movq	%rax, 2024(%rsi)
	movq	3880(%rsp), %rax
	movq	%rax, 2032(%rsi)
	movq	3888(%rsp), %rax
	movq	%rax, 2040(%rsi)
	movq	3896(%rsp), %rax
	movq	%rax, 2048(%rsi)
	movq	3904(%rsp), %rax
	movq	%rax, 2056(%rsi)
	movq	3912(%rsp), %rax
	movq	%rax, 2064(%rsi)
	movq	3920(%rsp), %rax
	movq	%rax, 2072(%rsi)
	movq	3928(%rsp), %rax
	movq	%rax, 2080(%rsi)
	movq	3936(%rsp), %rax
	movq	%rax, 2088(%rsi)
	movq	3944(%rsp), %rax
	movq	%rax, 2096(%rsi)
	movq	3952(%rsp), %rax
	movq	%rax, 2104(%rsi)
	movq	3960(%rsp), %rax
	movq	%rax, 2112(%rsi)
	movq	3968(%rsp), %rax
	movq	%rax, 2120(%rsi)
	movq	3976(%rsp), %rax
	movq	%rax, 2128(%rsi)
	movq	3984(%rsp), %rax
	movq	%rax, 2136(%rsi)
	movq	3992(%rsp), %rax
	movq	%rax, 2144(%rsi)
	movq	4000(%rsp), %rax
	movq	%rax, 2152(%rsi)
	movq	4008(%rsp), %rax
	movq	%rax, 2160(%rsi)
	movq	4016(%rsp), %rax
	movq	%rax, 2168(%rsi)
	movq	4024(%rsp), %rax
	movq	%rax, 2176(%rsi)
	movq	4032(%rsp), %rax
	movq	%rax, 2184(%rsi)
	movq	4040(%rsp), %rax
	movq	%rax, 2192(%rsi)
	movq	4048(%rsp), %rax
	movq	%rax, 2200(%rsi)
	movq	4056(%rsp), %rax
	movq	%rax, 2208(%rsi)
	movq	4064(%rsp), %rax
	movq	%rax, 2216(%rsi)
	movq	4072(%rsp), %rax
	movq	%rax, 2224(%rsi)
	movq	4080(%rsp), %rax
	movq	%rax, 2232(%rsi)
	movq	4088(%rsp), %rax
	movq	%rax, 2240(%rsi)
	movq	4096(%rsp), %rax
	movq	%rax, 2248(%rsi)
	movq	4104(%rsp), %rax
	movq	%rax, 2256(%rsi)
	movq	4112(%rsp), %rax
	movq	%rax, 2264(%rsi)
	movq	4120(%rsp), %rax
	movq	%rax, 2272(%rsi)
	movq	4128(%rsp), %rax
	movq	%rax, 2280(%rsi)
	movq	4136(%rsp), %rax
	movq	%rax, 2288(%rsi)
	movq	4144(%rsp), %rax
	movq	%rax, 2296(%rsi)
	movq	4152(%rsp), %rax
	movq	%rax, 2304(%rsi)
	movq	4160(%rsp), %rax
	movq	%rax, 2312(%rsi)
	movq	4168(%rsp), %rax
	movq	%rax, 2320(%rsi)
	movq	4176(%rsp), %rax
	movq	%rax, 2328(%rsi)
	movq	4184(%rsp), %rax
	movq	%rax, 2336(%rsi)
	movq	4192(%rsp), %rax
	movq	%rax, 2344(%rsi)
	movq	4200(%rsp), %rax
	movq	%rax, 2352(%rsi)
	movq	4208(%rsp), %rax
	movq	%rax, 2360(%rsi)
	movq	4216(%rsp), %rax
	movq	%rax, 2368(%rsi)
	movq	4224(%rsp), %rax
	movq	%rax, 2376(%rsi)
	movq	4232(%rsp), %rax
	movq	%rax, 2384(%rsi)
	movq	4240(%rsp), %rax
	movq	%rax, 2392(%rsi)
	xorl	%eax, %eax
	movq	13976(%rsp), %rbx
	movq	13984(%rsp), %rbp
	movq	13992(%rsp), %r12
	movq	14000(%rsp), %r13
	movq	14008(%rsp), %r14
	movq	14016(%rsp), %r15
	movq	14024(%rsp), %rsp
	ret
	.type	_jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand, %function
	.type	jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand, %function
_jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand:
jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand:
	movq	%rsp, %rax
	leaq	-14032(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 13976(%rsp)
	movq	%rbp, 13984(%rsp)
	movq	%r12, 13992(%rsp)
	movq	%r13, 14000(%rsp)
	movq	%r14, 14008(%rsp)
	movq	%r15, 14016(%rsp)
	movq	%rax, 14024(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm0
	movq	%rsi, %mm1
	movq	(%rdx), %rax
	movq	%rax, 168(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 176(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 184(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 192(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 200(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 208(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 216(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 224(%rsp)
	leaq	664(%rsp), %r10
	leaq	1848(%rsp), %rax
	leaq	168(%rsp), %rdx
	movq	%rdx, %mm2
	movq	%rax, %rcx
	movq	%rax, (%rsp)
	movq	%r10, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	(%rdx), %rax
	movq	%rax, 88(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 96(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 104(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 112(%rsp)
	movb	$3, 120(%rsp)
	leaq	232(%rsp), %rax
	leaq	88(%rsp), %r10
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$215:
	leaq	224(%rsp), %rsp
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
	movq	256(%rsp), %rax
	movq	%rax, 80(%rsp)
	movq	288(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	$0, %rax
	movq	%rax, %mm3
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
	movb	64(%rsp), %al
	movb	%al, 136(%rsp)
	movb	65(%rsp), %al
	movb	%al, 137(%rsp)
	movb	66(%rsp), %al
	movb	%al, 138(%rsp)
	movb	67(%rsp), %al
	movb	%al, 139(%rsp)
	movb	68(%rsp), %al
	movb	%al, 140(%rsp)
	movb	69(%rsp), %al
	movb	%al, 141(%rsp)
	movb	70(%rsp), %al
	movb	%al, 142(%rsp)
	movb	71(%rsp), %al
	movb	%al, 143(%rsp)
	movb	72(%rsp), %al
	movb	%al, 144(%rsp)
	movb	73(%rsp), %al
	movb	%al, 145(%rsp)
	movb	74(%rsp), %al
	movb	%al, 146(%rsp)
	movb	75(%rsp), %al
	movb	%al, 147(%rsp)
	movb	76(%rsp), %al
	movb	%al, 148(%rsp)
	movb	77(%rsp), %al
	movb	%al, 149(%rsp)
	movb	78(%rsp), %al
	movb	%al, 150(%rsp)
	movb	79(%rsp), %al
	movb	%al, 151(%rsp)
	movb	80(%rsp), %al
	movb	%al, 152(%rsp)
	movb	81(%rsp), %al
	movb	%al, 153(%rsp)
	movb	82(%rsp), %al
	movb	%al, 154(%rsp)
	movb	83(%rsp), %al
	movb	%al, 155(%rsp)
	movb	84(%rsp), %al
	movb	%al, 156(%rsp)
	movb	85(%rsp), %al
	movb	%al, 157(%rsp)
	movb	86(%rsp), %al
	movb	%al, 158(%rsp)
	movb	87(%rsp), %al
	movb	%al, 159(%rsp)
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$213
	movb	$0, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$214
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$213:
	movb	$0, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$214:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$212:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$199
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$200:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$211:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$209
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$210
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$209:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	9368(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$197
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$198:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$197:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$198
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$195
	movb	$0, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$196
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$195:
	movb	$1, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$196:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$194:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$181
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$182:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$193:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$191
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$192
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$191:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	9880(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$179
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$180:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$179:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$180
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$177
	movb	$0, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$178
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$177:
	movb	$2, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$178:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$176:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$163
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$164:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$175:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$173
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$174
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$173:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	10392(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$161
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$162:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$161:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$162
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$159
	movb	$1, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$160
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$159:
	movb	$0, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$160:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$158:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$145
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$146:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$157:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$155
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$156
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$155:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	10904(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$143
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$144:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$143:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$144
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$141
	movb	$1, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$142
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$141:
	movb	$1, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$142:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$140:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$127
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$128:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$139:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$137
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$138
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$137:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	11416(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$125
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$126:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$125:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$126
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$123
	movb	$1, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$124
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$123:
	movb	$2, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$124:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$122:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$109
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$110:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$121:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$119
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$120
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$119:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	11928(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$107
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$108:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$107:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$108
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$105
	movb	$2, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$106
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$105:
	movb	$0, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$106:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$104:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$91
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$92:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$103:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$101
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$102
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$101:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	12440(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$89
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$90:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$89:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$90
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$87
	movb	$2, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$88
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$87:
	movb	$1, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$88:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$86:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$73
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$74:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$85:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$83
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$84
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$83:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	12952(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$71
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$72:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$71:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$72
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$69
	movb	$2, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$70
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$69:
	movb	$2, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$70:
	leaq	464(%rsp), %rsi
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$68:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$55
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$56:
	movq	%rcx, %mm4
	leaq	464(%rsp), %rsi
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$67:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$65
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$66
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$65:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4248(%rsp,%rcx,2)
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
	movw	%di, 4248(%rsp,%rcx,2)
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
	leaq	13464(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$53
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$54:
	movw	4248(%rsp,%rax,2), %si
	movw	%si, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$53:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$54
	movb	$0, %al
	leaq	4760(%rsp), %rdx
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$52:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	5272(%rsp), %rdx
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$51:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	5784(%rsp), %rdx
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$50:
	leaq	176(%rsp), %rsp
	movb	$3, %al
	leaq	6296(%rsp), %rdx
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$49:
	leaq	176(%rsp), %rsp
	movb	$4, %al
	leaq	6808(%rsp), %rdx
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$48:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	7320(%rsp), %rdx
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$47:
	leaq	176(%rsp), %rsp
	leaq	4760(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$46:
	leaq	5272(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$45:
	leaq	5784(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$44:
	leaq	6296(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$43:
	leaq	6808(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$42:
	leaq	7320(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$41:
	leaq	7832(%rsp), %rdx
	leaq	9368(%rsp), %rax
	leaq	4760(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$40:
	leaq	16(%rsp), %rsp
	leaq	4248(%rsp), %rdx
	leaq	9880(%rsp), %rax
	leaq	5272(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$39:
	leaq	16(%rsp), %rsp
	leaq	7832(%rsp), %rax
	leaq	4248(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$38:
	leaq	4248(%rsp), %rdx
	leaq	10392(%rsp), %rax
	leaq	5784(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$37:
	leaq	16(%rsp), %rsp
	leaq	7832(%rsp), %rax
	leaq	4248(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$36:
	leaq	7832(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$34
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$35:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$34:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$35
	leaq	7832(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$33:
	leaq	8344(%rsp), %rdx
	leaq	10904(%rsp), %rax
	leaq	4760(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$32:
	leaq	16(%rsp), %rsp
	leaq	4248(%rsp), %rdx
	leaq	11416(%rsp), %rax
	leaq	5272(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$31:
	leaq	16(%rsp), %rsp
	leaq	8344(%rsp), %rax
	leaq	4248(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$30:
	leaq	4248(%rsp), %rdx
	leaq	11928(%rsp), %rax
	leaq	5784(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$29:
	leaq	16(%rsp), %rsp
	leaq	8344(%rsp), %rax
	leaq	4248(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$28:
	leaq	8344(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$26
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$27:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$26:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$27
	leaq	8344(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$25:
	leaq	8856(%rsp), %rdx
	leaq	12440(%rsp), %rax
	leaq	4760(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$24:
	leaq	16(%rsp), %rsp
	leaq	4248(%rsp), %rdx
	leaq	12952(%rsp), %rax
	leaq	5272(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$23:
	leaq	16(%rsp), %rsp
	leaq	8856(%rsp), %rax
	leaq	4248(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$22:
	leaq	4248(%rsp), %rdx
	leaq	13464(%rsp), %rax
	leaq	5784(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$21:
	leaq	16(%rsp), %rsp
	leaq	8856(%rsp), %rax
	leaq	4248(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$20:
	leaq	8856(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$18
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$19:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$18:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$19
	leaq	8856(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$17:
	leaq	7832(%rsp), %rax
	leaq	6296(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$16:
	leaq	8344(%rsp), %rax
	leaq	6808(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$15:
	leaq	8856(%rsp), %rax
	leaq	7320(%rsp), %rcx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$14:
	leaq	7832(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$12
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$13:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$12:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$13
	leaq	8344(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$10
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$11:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$10:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$11
	leaq	8856(%rsp), %rax
	movq	$0, %rdi
	jmp 	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$8
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$9:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$8:
	cmpq	$256, %rdi
	jb  	Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$9
	movq	8(%rsp), %r10
	movq	16(%rsp), %rsi
	movq	%rsi, %rdx
	leaq	4760(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$7:
	leaq	384(%rsi), %rdx
	leaq	5272(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$6:
	leaq	768(%rsi), %rdx
	leaq	5784(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$5:
	movq	%r10, %rsi
	movq	%rsi, %rdx
	leaq	7832(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$4:
	leaq	384(%rsi), %rdx
	leaq	8344(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$3:
	leaq	768(%rsi), %rdx
	leaq	8856(%rsp), %rax
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$2:
	movq	56(%rsp), %rax
	movq	%rax, 1152(%r10)
	movq	64(%rsp), %rax
	movq	%rax, 1160(%r10)
	movq	72(%rsp), %rax
	movq	%rax, 1168(%r10)
	movq	80(%rsp), %rax
	movq	%rax, 1176(%r10)
	movq	(%rsp), %rax
	movq	(%r10), %rcx
	movq	%rcx, 1152(%rax)
	movq	8(%r10), %rcx
	movq	%rcx, 1160(%rax)
	movq	16(%r10), %rcx
	movq	%rcx, 1168(%rax)
	movq	24(%r10), %rcx
	movq	%rcx, 1176(%rax)
	movq	32(%r10), %rcx
	movq	%rcx, 1184(%rax)
	movq	40(%r10), %rcx
	movq	%rcx, 1192(%rax)
	movq	48(%r10), %rcx
	movq	%rcx, 1200(%rax)
	movq	56(%r10), %rcx
	movq	%rcx, 1208(%rax)
	movq	64(%r10), %rcx
	movq	%rcx, 1216(%rax)
	movq	72(%r10), %rcx
	movq	%rcx, 1224(%rax)
	movq	80(%r10), %rcx
	movq	%rcx, 1232(%rax)
	movq	88(%r10), %rcx
	movq	%rcx, 1240(%rax)
	movq	96(%r10), %rcx
	movq	%rcx, 1248(%rax)
	movq	104(%r10), %rcx
	movq	%rcx, 1256(%rax)
	movq	112(%r10), %rcx
	movq	%rcx, 1264(%rax)
	movq	120(%r10), %rcx
	movq	%rcx, 1272(%rax)
	movq	128(%r10), %rcx
	movq	%rcx, 1280(%rax)
	movq	136(%r10), %rcx
	movq	%rcx, 1288(%rax)
	movq	144(%r10), %rcx
	movq	%rcx, 1296(%rax)
	movq	152(%r10), %rcx
	movq	%rcx, 1304(%rax)
	movq	160(%r10), %rcx
	movq	%rcx, 1312(%rax)
	movq	168(%r10), %rcx
	movq	%rcx, 1320(%rax)
	movq	176(%r10), %rcx
	movq	%rcx, 1328(%rax)
	movq	184(%r10), %rcx
	movq	%rcx, 1336(%rax)
	movq	192(%r10), %rcx
	movq	%rcx, 1344(%rax)
	movq	200(%r10), %rcx
	movq	%rcx, 1352(%rax)
	movq	208(%r10), %rcx
	movq	%rcx, 1360(%rax)
	movq	216(%r10), %rcx
	movq	%rcx, 1368(%rax)
	movq	224(%r10), %rcx
	movq	%rcx, 1376(%rax)
	movq	232(%r10), %rcx
	movq	%rcx, 1384(%rax)
	movq	240(%r10), %rcx
	movq	%rcx, 1392(%rax)
	movq	248(%r10), %rcx
	movq	%rcx, 1400(%rax)
	movq	256(%r10), %rcx
	movq	%rcx, 1408(%rax)
	movq	264(%r10), %rcx
	movq	%rcx, 1416(%rax)
	movq	272(%r10), %rcx
	movq	%rcx, 1424(%rax)
	movq	280(%r10), %rcx
	movq	%rcx, 1432(%rax)
	movq	288(%r10), %rcx
	movq	%rcx, 1440(%rax)
	movq	296(%r10), %rcx
	movq	%rcx, 1448(%rax)
	movq	304(%r10), %rcx
	movq	%rcx, 1456(%rax)
	movq	312(%r10), %rcx
	movq	%rcx, 1464(%rax)
	movq	320(%r10), %rcx
	movq	%rcx, 1472(%rax)
	movq	328(%r10), %rcx
	movq	%rcx, 1480(%rax)
	movq	336(%r10), %rcx
	movq	%rcx, 1488(%rax)
	movq	344(%r10), %rcx
	movq	%rcx, 1496(%rax)
	movq	352(%r10), %rcx
	movq	%rcx, 1504(%rax)
	movq	360(%r10), %rcx
	movq	%rcx, 1512(%rax)
	movq	368(%r10), %rcx
	movq	%rcx, 1520(%rax)
	movq	376(%r10), %rcx
	movq	%rcx, 1528(%rax)
	movq	384(%r10), %rcx
	movq	%rcx, 1536(%rax)
	movq	392(%r10), %rcx
	movq	%rcx, 1544(%rax)
	movq	400(%r10), %rcx
	movq	%rcx, 1552(%rax)
	movq	408(%r10), %rcx
	movq	%rcx, 1560(%rax)
	movq	416(%r10), %rcx
	movq	%rcx, 1568(%rax)
	movq	424(%r10), %rcx
	movq	%rcx, 1576(%rax)
	movq	432(%r10), %rcx
	movq	%rcx, 1584(%rax)
	movq	440(%r10), %rcx
	movq	%rcx, 1592(%rax)
	movq	448(%r10), %rcx
	movq	%rcx, 1600(%rax)
	movq	456(%r10), %rcx
	movq	%rcx, 1608(%rax)
	movq	464(%r10), %rcx
	movq	%rcx, 1616(%rax)
	movq	472(%r10), %rcx
	movq	%rcx, 1624(%rax)
	movq	480(%r10), %rcx
	movq	%rcx, 1632(%rax)
	movq	488(%r10), %rcx
	movq	%rcx, 1640(%rax)
	movq	496(%r10), %rcx
	movq	%rcx, 1648(%rax)
	movq	504(%r10), %rcx
	movq	%rcx, 1656(%rax)
	movq	512(%r10), %rcx
	movq	%rcx, 1664(%rax)
	movq	520(%r10), %rcx
	movq	%rcx, 1672(%rax)
	movq	528(%r10), %rcx
	movq	%rcx, 1680(%rax)
	movq	536(%r10), %rcx
	movq	%rcx, 1688(%rax)
	movq	544(%r10), %rcx
	movq	%rcx, 1696(%rax)
	movq	552(%r10), %rcx
	movq	%rcx, 1704(%rax)
	movq	560(%r10), %rcx
	movq	%rcx, 1712(%rax)
	movq	568(%r10), %rcx
	movq	%rcx, 1720(%rax)
	movq	576(%r10), %rcx
	movq	%rcx, 1728(%rax)
	movq	584(%r10), %rcx
	movq	%rcx, 1736(%rax)
	movq	592(%r10), %rcx
	movq	%rcx, 1744(%rax)
	movq	600(%r10), %rcx
	movq	%rcx, 1752(%rax)
	movq	608(%r10), %rcx
	movq	%rcx, 1760(%rax)
	movq	616(%r10), %rcx
	movq	%rcx, 1768(%rax)
	movq	624(%r10), %rcx
	movq	%rcx, 1776(%rax)
	movq	632(%r10), %rcx
	movq	%rcx, 1784(%rax)
	movq	640(%r10), %rcx
	movq	%rcx, 1792(%rax)
	movq	648(%r10), %rcx
	movq	%rcx, 1800(%rax)
	movq	656(%r10), %rcx
	movq	%rcx, 1808(%rax)
	movq	664(%r10), %rcx
	movq	%rcx, 1816(%rax)
	movq	672(%r10), %rcx
	movq	%rcx, 1824(%rax)
	movq	680(%r10), %rcx
	movq	%rcx, 1832(%rax)
	movq	688(%r10), %rcx
	movq	%rcx, 1840(%rax)
	movq	696(%r10), %rcx
	movq	%rcx, 1848(%rax)
	movq	704(%r10), %rcx
	movq	%rcx, 1856(%rax)
	movq	712(%r10), %rcx
	movq	%rcx, 1864(%rax)
	movq	720(%r10), %rcx
	movq	%rcx, 1872(%rax)
	movq	728(%r10), %rcx
	movq	%rcx, 1880(%rax)
	movq	736(%r10), %rcx
	movq	%rcx, 1888(%rax)
	movq	744(%r10), %rcx
	movq	%rcx, 1896(%rax)
	movq	752(%r10), %rcx
	movq	%rcx, 1904(%rax)
	movq	760(%r10), %rcx
	movq	%rcx, 1912(%rax)
	movq	768(%r10), %rcx
	movq	%rcx, 1920(%rax)
	movq	776(%r10), %rcx
	movq	%rcx, 1928(%rax)
	movq	784(%r10), %rcx
	movq	%rcx, 1936(%rax)
	movq	792(%r10), %rcx
	movq	%rcx, 1944(%rax)
	movq	800(%r10), %rcx
	movq	%rcx, 1952(%rax)
	movq	808(%r10), %rcx
	movq	%rcx, 1960(%rax)
	movq	816(%r10), %rcx
	movq	%rcx, 1968(%rax)
	movq	824(%r10), %rcx
	movq	%rcx, 1976(%rax)
	movq	832(%r10), %rcx
	movq	%rcx, 1984(%rax)
	movq	840(%r10), %rcx
	movq	%rcx, 1992(%rax)
	movq	848(%r10), %rcx
	movq	%rcx, 2000(%rax)
	movq	856(%r10), %rcx
	movq	%rcx, 2008(%rax)
	movq	864(%r10), %rcx
	movq	%rcx, 2016(%rax)
	movq	872(%r10), %rcx
	movq	%rcx, 2024(%rax)
	movq	880(%r10), %rcx
	movq	%rcx, 2032(%rax)
	movq	888(%r10), %rcx
	movq	%rcx, 2040(%rax)
	movq	896(%r10), %rcx
	movq	%rcx, 2048(%rax)
	movq	904(%r10), %rcx
	movq	%rcx, 2056(%rax)
	movq	912(%r10), %rcx
	movq	%rcx, 2064(%rax)
	movq	920(%r10), %rcx
	movq	%rcx, 2072(%rax)
	movq	928(%r10), %rcx
	movq	%rcx, 2080(%rax)
	movq	936(%r10), %rcx
	movq	%rcx, 2088(%rax)
	movq	944(%r10), %rcx
	movq	%rcx, 2096(%rax)
	movq	952(%r10), %rcx
	movq	%rcx, 2104(%rax)
	movq	960(%r10), %rcx
	movq	%rcx, 2112(%rax)
	movq	968(%r10), %rcx
	movq	%rcx, 2120(%rax)
	movq	976(%r10), %rcx
	movq	%rcx, 2128(%rax)
	movq	984(%r10), %rcx
	movq	%rcx, 2136(%rax)
	movq	992(%r10), %rcx
	movq	%rcx, 2144(%rax)
	movq	1000(%r10), %rcx
	movq	%rcx, 2152(%rax)
	movq	1008(%r10), %rcx
	movq	%rcx, 2160(%rax)
	movq	1016(%r10), %rcx
	movq	%rcx, 2168(%rax)
	movq	1024(%r10), %rcx
	movq	%rcx, 2176(%rax)
	movq	1032(%r10), %rcx
	movq	%rcx, 2184(%rax)
	movq	1040(%r10), %rcx
	movq	%rcx, 2192(%rax)
	movq	1048(%r10), %rcx
	movq	%rcx, 2200(%rax)
	movq	1056(%r10), %rcx
	movq	%rcx, 2208(%rax)
	movq	1064(%r10), %rcx
	movq	%rcx, 2216(%rax)
	movq	1072(%r10), %rcx
	movq	%rcx, 2224(%rax)
	movq	1080(%r10), %rcx
	movq	%rcx, 2232(%rax)
	movq	1088(%r10), %rcx
	movq	%rcx, 2240(%rax)
	movq	1096(%r10), %rcx
	movq	%rcx, 2248(%rax)
	movq	1104(%r10), %rcx
	movq	%rcx, 2256(%rax)
	movq	1112(%r10), %rcx
	movq	%rcx, 2264(%rax)
	movq	1120(%r10), %rcx
	movq	%rcx, 2272(%rax)
	movq	1128(%r10), %rcx
	movq	%rcx, 2280(%rax)
	movq	1136(%r10), %rcx
	movq	%rcx, 2288(%rax)
	movq	1144(%r10), %rcx
	movq	%rcx, 2296(%rax)
	movq	1152(%r10), %rcx
	movq	%rcx, 2304(%rax)
	movq	1160(%r10), %rcx
	movq	%rcx, 2312(%rax)
	movq	1168(%r10), %rcx
	movq	%rcx, 2320(%rax)
	movq	1176(%r10), %rcx
	movq	%rcx, 2328(%rax)
	movq	%rax, (%rsp)
	leaq	56(%rsp), %rax
	leaq	-232(%rsp), %rsp
	call	L_sha3_256A_A1184$1
Ljade_kem_mlkem_mlkem768_amd64_ref_keypair_derand$1:
	leaq	232(%rsp), %rsp
	movq	(%rsp), %rax
	movq	56(%rsp), %rcx
	movq	%rcx, 2336(%rax)
	movq	64(%rsp), %rcx
	movq	%rcx, 2344(%rax)
	movq	72(%rsp), %rcx
	movq	%rcx, 2352(%rax)
	movq	80(%rsp), %rcx
	movq	%rcx, 2360(%rax)
	movq	%mm2, %rdx
	leaq	32(%rdx), %rcx
	movq	(%rcx), %rsi
	movq	%rsi, 2368(%rax)
	movq	8(%rcx), %rsi
	movq	%rsi, 2376(%rax)
	movq	16(%rcx), %rsi
	movq	%rsi, 2384(%rax)
	movq	24(%rcx), %rcx
	movq	%rcx, 2392(%rax)
	movq	%mm0, %rdx
	movq	%mm1, %rsi
	movq	664(%rsp), %rax
	movq	%rax, (%rdx)
	movq	672(%rsp), %rax
	movq	%rax, 8(%rdx)
	movq	680(%rsp), %rax
	movq	%rax, 16(%rdx)
	movq	688(%rsp), %rax
	movq	%rax, 24(%rdx)
	movq	696(%rsp), %rax
	movq	%rax, 32(%rdx)
	movq	704(%rsp), %rax
	movq	%rax, 40(%rdx)
	movq	712(%rsp), %rax
	movq	%rax, 48(%rdx)
	movq	720(%rsp), %rax
	movq	%rax, 56(%rdx)
	movq	728(%rsp), %rax
	movq	%rax, 64(%rdx)
	movq	736(%rsp), %rax
	movq	%rax, 72(%rdx)
	movq	744(%rsp), %rax
	movq	%rax, 80(%rdx)
	movq	752(%rsp), %rax
	movq	%rax, 88(%rdx)
	movq	760(%rsp), %rax
	movq	%rax, 96(%rdx)
	movq	768(%rsp), %rax
	movq	%rax, 104(%rdx)
	movq	776(%rsp), %rax
	movq	%rax, 112(%rdx)
	movq	784(%rsp), %rax
	movq	%rax, 120(%rdx)
	movq	792(%rsp), %rax
	movq	%rax, 128(%rdx)
	movq	800(%rsp), %rax
	movq	%rax, 136(%rdx)
	movq	808(%rsp), %rax
	movq	%rax, 144(%rdx)
	movq	816(%rsp), %rax
	movq	%rax, 152(%rdx)
	movq	824(%rsp), %rax
	movq	%rax, 160(%rdx)
	movq	832(%rsp), %rax
	movq	%rax, 168(%rdx)
	movq	840(%rsp), %rax
	movq	%rax, 176(%rdx)
	movq	848(%rsp), %rax
	movq	%rax, 184(%rdx)
	movq	856(%rsp), %rax
	movq	%rax, 192(%rdx)
	movq	864(%rsp), %rax
	movq	%rax, 200(%rdx)
	movq	872(%rsp), %rax
	movq	%rax, 208(%rdx)
	movq	880(%rsp), %rax
	movq	%rax, 216(%rdx)
	movq	888(%rsp), %rax
	movq	%rax, 224(%rdx)
	movq	896(%rsp), %rax
	movq	%rax, 232(%rdx)
	movq	904(%rsp), %rax
	movq	%rax, 240(%rdx)
	movq	912(%rsp), %rax
	movq	%rax, 248(%rdx)
	movq	920(%rsp), %rax
	movq	%rax, 256(%rdx)
	movq	928(%rsp), %rax
	movq	%rax, 264(%rdx)
	movq	936(%rsp), %rax
	movq	%rax, 272(%rdx)
	movq	944(%rsp), %rax
	movq	%rax, 280(%rdx)
	movq	952(%rsp), %rax
	movq	%rax, 288(%rdx)
	movq	960(%rsp), %rax
	movq	%rax, 296(%rdx)
	movq	968(%rsp), %rax
	movq	%rax, 304(%rdx)
	movq	976(%rsp), %rax
	movq	%rax, 312(%rdx)
	movq	984(%rsp), %rax
	movq	%rax, 320(%rdx)
	movq	992(%rsp), %rax
	movq	%rax, 328(%rdx)
	movq	1000(%rsp), %rax
	movq	%rax, 336(%rdx)
	movq	1008(%rsp), %rax
	movq	%rax, 344(%rdx)
	movq	1016(%rsp), %rax
	movq	%rax, 352(%rdx)
	movq	1024(%rsp), %rax
	movq	%rax, 360(%rdx)
	movq	1032(%rsp), %rax
	movq	%rax, 368(%rdx)
	movq	1040(%rsp), %rax
	movq	%rax, 376(%rdx)
	movq	1048(%rsp), %rax
	movq	%rax, 384(%rdx)
	movq	1056(%rsp), %rax
	movq	%rax, 392(%rdx)
	movq	1064(%rsp), %rax
	movq	%rax, 400(%rdx)
	movq	1072(%rsp), %rax
	movq	%rax, 408(%rdx)
	movq	1080(%rsp), %rax
	movq	%rax, 416(%rdx)
	movq	1088(%rsp), %rax
	movq	%rax, 424(%rdx)
	movq	1096(%rsp), %rax
	movq	%rax, 432(%rdx)
	movq	1104(%rsp), %rax
	movq	%rax, 440(%rdx)
	movq	1112(%rsp), %rax
	movq	%rax, 448(%rdx)
	movq	1120(%rsp), %rax
	movq	%rax, 456(%rdx)
	movq	1128(%rsp), %rax
	movq	%rax, 464(%rdx)
	movq	1136(%rsp), %rax
	movq	%rax, 472(%rdx)
	movq	1144(%rsp), %rax
	movq	%rax, 480(%rdx)
	movq	1152(%rsp), %rax
	movq	%rax, 488(%rdx)
	movq	1160(%rsp), %rax
	movq	%rax, 496(%rdx)
	movq	1168(%rsp), %rax
	movq	%rax, 504(%rdx)
	movq	1176(%rsp), %rax
	movq	%rax, 512(%rdx)
	movq	1184(%rsp), %rax
	movq	%rax, 520(%rdx)
	movq	1192(%rsp), %rax
	movq	%rax, 528(%rdx)
	movq	1200(%rsp), %rax
	movq	%rax, 536(%rdx)
	movq	1208(%rsp), %rax
	movq	%rax, 544(%rdx)
	movq	1216(%rsp), %rax
	movq	%rax, 552(%rdx)
	movq	1224(%rsp), %rax
	movq	%rax, 560(%rdx)
	movq	1232(%rsp), %rax
	movq	%rax, 568(%rdx)
	movq	1240(%rsp), %rax
	movq	%rax, 576(%rdx)
	movq	1248(%rsp), %rax
	movq	%rax, 584(%rdx)
	movq	1256(%rsp), %rax
	movq	%rax, 592(%rdx)
	movq	1264(%rsp), %rax
	movq	%rax, 600(%rdx)
	movq	1272(%rsp), %rax
	movq	%rax, 608(%rdx)
	movq	1280(%rsp), %rax
	movq	%rax, 616(%rdx)
	movq	1288(%rsp), %rax
	movq	%rax, 624(%rdx)
	movq	1296(%rsp), %rax
	movq	%rax, 632(%rdx)
	movq	1304(%rsp), %rax
	movq	%rax, 640(%rdx)
	movq	1312(%rsp), %rax
	movq	%rax, 648(%rdx)
	movq	1320(%rsp), %rax
	movq	%rax, 656(%rdx)
	movq	1328(%rsp), %rax
	movq	%rax, 664(%rdx)
	movq	1336(%rsp), %rax
	movq	%rax, 672(%rdx)
	movq	1344(%rsp), %rax
	movq	%rax, 680(%rdx)
	movq	1352(%rsp), %rax
	movq	%rax, 688(%rdx)
	movq	1360(%rsp), %rax
	movq	%rax, 696(%rdx)
	movq	1368(%rsp), %rax
	movq	%rax, 704(%rdx)
	movq	1376(%rsp), %rax
	movq	%rax, 712(%rdx)
	movq	1384(%rsp), %rax
	movq	%rax, 720(%rdx)
	movq	1392(%rsp), %rax
	movq	%rax, 728(%rdx)
	movq	1400(%rsp), %rax
	movq	%rax, 736(%rdx)
	movq	1408(%rsp), %rax
	movq	%rax, 744(%rdx)
	movq	1416(%rsp), %rax
	movq	%rax, 752(%rdx)
	movq	1424(%rsp), %rax
	movq	%rax, 760(%rdx)
	movq	1432(%rsp), %rax
	movq	%rax, 768(%rdx)
	movq	1440(%rsp), %rax
	movq	%rax, 776(%rdx)
	movq	1448(%rsp), %rax
	movq	%rax, 784(%rdx)
	movq	1456(%rsp), %rax
	movq	%rax, 792(%rdx)
	movq	1464(%rsp), %rax
	movq	%rax, 800(%rdx)
	movq	1472(%rsp), %rax
	movq	%rax, 808(%rdx)
	movq	1480(%rsp), %rax
	movq	%rax, 816(%rdx)
	movq	1488(%rsp), %rax
	movq	%rax, 824(%rdx)
	movq	1496(%rsp), %rax
	movq	%rax, 832(%rdx)
	movq	1504(%rsp), %rax
	movq	%rax, 840(%rdx)
	movq	1512(%rsp), %rax
	movq	%rax, 848(%rdx)
	movq	1520(%rsp), %rax
	movq	%rax, 856(%rdx)
	movq	1528(%rsp), %rax
	movq	%rax, 864(%rdx)
	movq	1536(%rsp), %rax
	movq	%rax, 872(%rdx)
	movq	1544(%rsp), %rax
	movq	%rax, 880(%rdx)
	movq	1552(%rsp), %rax
	movq	%rax, 888(%rdx)
	movq	1560(%rsp), %rax
	movq	%rax, 896(%rdx)
	movq	1568(%rsp), %rax
	movq	%rax, 904(%rdx)
	movq	1576(%rsp), %rax
	movq	%rax, 912(%rdx)
	movq	1584(%rsp), %rax
	movq	%rax, 920(%rdx)
	movq	1592(%rsp), %rax
	movq	%rax, 928(%rdx)
	movq	1600(%rsp), %rax
	movq	%rax, 936(%rdx)
	movq	1608(%rsp), %rax
	movq	%rax, 944(%rdx)
	movq	1616(%rsp), %rax
	movq	%rax, 952(%rdx)
	movq	1624(%rsp), %rax
	movq	%rax, 960(%rdx)
	movq	1632(%rsp), %rax
	movq	%rax, 968(%rdx)
	movq	1640(%rsp), %rax
	movq	%rax, 976(%rdx)
	movq	1648(%rsp), %rax
	movq	%rax, 984(%rdx)
	movq	1656(%rsp), %rax
	movq	%rax, 992(%rdx)
	movq	1664(%rsp), %rax
	movq	%rax, 1000(%rdx)
	movq	1672(%rsp), %rax
	movq	%rax, 1008(%rdx)
	movq	1680(%rsp), %rax
	movq	%rax, 1016(%rdx)
	movq	1688(%rsp), %rax
	movq	%rax, 1024(%rdx)
	movq	1696(%rsp), %rax
	movq	%rax, 1032(%rdx)
	movq	1704(%rsp), %rax
	movq	%rax, 1040(%rdx)
	movq	1712(%rsp), %rax
	movq	%rax, 1048(%rdx)
	movq	1720(%rsp), %rax
	movq	%rax, 1056(%rdx)
	movq	1728(%rsp), %rax
	movq	%rax, 1064(%rdx)
	movq	1736(%rsp), %rax
	movq	%rax, 1072(%rdx)
	movq	1744(%rsp), %rax
	movq	%rax, 1080(%rdx)
	movq	1752(%rsp), %rax
	movq	%rax, 1088(%rdx)
	movq	1760(%rsp), %rax
	movq	%rax, 1096(%rdx)
	movq	1768(%rsp), %rax
	movq	%rax, 1104(%rdx)
	movq	1776(%rsp), %rax
	movq	%rax, 1112(%rdx)
	movq	1784(%rsp), %rax
	movq	%rax, 1120(%rdx)
	movq	1792(%rsp), %rax
	movq	%rax, 1128(%rdx)
	movq	1800(%rsp), %rax
	movq	%rax, 1136(%rdx)
	movq	1808(%rsp), %rax
	movq	%rax, 1144(%rdx)
	movq	1816(%rsp), %rax
	movq	%rax, 1152(%rdx)
	movq	1824(%rsp), %rax
	movq	%rax, 1160(%rdx)
	movq	1832(%rsp), %rax
	movq	%rax, 1168(%rdx)
	movq	1840(%rsp), %rax
	movq	%rax, 1176(%rdx)
	movq	1848(%rsp), %rax
	movq	%rax, (%rsi)
	movq	1856(%rsp), %rax
	movq	%rax, 8(%rsi)
	movq	1864(%rsp), %rax
	movq	%rax, 16(%rsi)
	movq	1872(%rsp), %rax
	movq	%rax, 24(%rsi)
	movq	1880(%rsp), %rax
	movq	%rax, 32(%rsi)
	movq	1888(%rsp), %rax
	movq	%rax, 40(%rsi)
	movq	1896(%rsp), %rax
	movq	%rax, 48(%rsi)
	movq	1904(%rsp), %rax
	movq	%rax, 56(%rsi)
	movq	1912(%rsp), %rax
	movq	%rax, 64(%rsi)
	movq	1920(%rsp), %rax
	movq	%rax, 72(%rsi)
	movq	1928(%rsp), %rax
	movq	%rax, 80(%rsi)
	movq	1936(%rsp), %rax
	movq	%rax, 88(%rsi)
	movq	1944(%rsp), %rax
	movq	%rax, 96(%rsi)
	movq	1952(%rsp), %rax
	movq	%rax, 104(%rsi)
	movq	1960(%rsp), %rax
	movq	%rax, 112(%rsi)
	movq	1968(%rsp), %rax
	movq	%rax, 120(%rsi)
	movq	1976(%rsp), %rax
	movq	%rax, 128(%rsi)
	movq	1984(%rsp), %rax
	movq	%rax, 136(%rsi)
	movq	1992(%rsp), %rax
	movq	%rax, 144(%rsi)
	movq	2000(%rsp), %rax
	movq	%rax, 152(%rsi)
	movq	2008(%rsp), %rax
	movq	%rax, 160(%rsi)
	movq	2016(%rsp), %rax
	movq	%rax, 168(%rsi)
	movq	2024(%rsp), %rax
	movq	%rax, 176(%rsi)
	movq	2032(%rsp), %rax
	movq	%rax, 184(%rsi)
	movq	2040(%rsp), %rax
	movq	%rax, 192(%rsi)
	movq	2048(%rsp), %rax
	movq	%rax, 200(%rsi)
	movq	2056(%rsp), %rax
	movq	%rax, 208(%rsi)
	movq	2064(%rsp), %rax
	movq	%rax, 216(%rsi)
	movq	2072(%rsp), %rax
	movq	%rax, 224(%rsi)
	movq	2080(%rsp), %rax
	movq	%rax, 232(%rsi)
	movq	2088(%rsp), %rax
	movq	%rax, 240(%rsi)
	movq	2096(%rsp), %rax
	movq	%rax, 248(%rsi)
	movq	2104(%rsp), %rax
	movq	%rax, 256(%rsi)
	movq	2112(%rsp), %rax
	movq	%rax, 264(%rsi)
	movq	2120(%rsp), %rax
	movq	%rax, 272(%rsi)
	movq	2128(%rsp), %rax
	movq	%rax, 280(%rsi)
	movq	2136(%rsp), %rax
	movq	%rax, 288(%rsi)
	movq	2144(%rsp), %rax
	movq	%rax, 296(%rsi)
	movq	2152(%rsp), %rax
	movq	%rax, 304(%rsi)
	movq	2160(%rsp), %rax
	movq	%rax, 312(%rsi)
	movq	2168(%rsp), %rax
	movq	%rax, 320(%rsi)
	movq	2176(%rsp), %rax
	movq	%rax, 328(%rsi)
	movq	2184(%rsp), %rax
	movq	%rax, 336(%rsi)
	movq	2192(%rsp), %rax
	movq	%rax, 344(%rsi)
	movq	2200(%rsp), %rax
	movq	%rax, 352(%rsi)
	movq	2208(%rsp), %rax
	movq	%rax, 360(%rsi)
	movq	2216(%rsp), %rax
	movq	%rax, 368(%rsi)
	movq	2224(%rsp), %rax
	movq	%rax, 376(%rsi)
	movq	2232(%rsp), %rax
	movq	%rax, 384(%rsi)
	movq	2240(%rsp), %rax
	movq	%rax, 392(%rsi)
	movq	2248(%rsp), %rax
	movq	%rax, 400(%rsi)
	movq	2256(%rsp), %rax
	movq	%rax, 408(%rsi)
	movq	2264(%rsp), %rax
	movq	%rax, 416(%rsi)
	movq	2272(%rsp), %rax
	movq	%rax, 424(%rsi)
	movq	2280(%rsp), %rax
	movq	%rax, 432(%rsi)
	movq	2288(%rsp), %rax
	movq	%rax, 440(%rsi)
	movq	2296(%rsp), %rax
	movq	%rax, 448(%rsi)
	movq	2304(%rsp), %rax
	movq	%rax, 456(%rsi)
	movq	2312(%rsp), %rax
	movq	%rax, 464(%rsi)
	movq	2320(%rsp), %rax
	movq	%rax, 472(%rsi)
	movq	2328(%rsp), %rax
	movq	%rax, 480(%rsi)
	movq	2336(%rsp), %rax
	movq	%rax, 488(%rsi)
	movq	2344(%rsp), %rax
	movq	%rax, 496(%rsi)
	movq	2352(%rsp), %rax
	movq	%rax, 504(%rsi)
	movq	2360(%rsp), %rax
	movq	%rax, 512(%rsi)
	movq	2368(%rsp), %rax
	movq	%rax, 520(%rsi)
	movq	2376(%rsp), %rax
	movq	%rax, 528(%rsi)
	movq	2384(%rsp), %rax
	movq	%rax, 536(%rsi)
	movq	2392(%rsp), %rax
	movq	%rax, 544(%rsi)
	movq	2400(%rsp), %rax
	movq	%rax, 552(%rsi)
	movq	2408(%rsp), %rax
	movq	%rax, 560(%rsi)
	movq	2416(%rsp), %rax
	movq	%rax, 568(%rsi)
	movq	2424(%rsp), %rax
	movq	%rax, 576(%rsi)
	movq	2432(%rsp), %rax
	movq	%rax, 584(%rsi)
	movq	2440(%rsp), %rax
	movq	%rax, 592(%rsi)
	movq	2448(%rsp), %rax
	movq	%rax, 600(%rsi)
	movq	2456(%rsp), %rax
	movq	%rax, 608(%rsi)
	movq	2464(%rsp), %rax
	movq	%rax, 616(%rsi)
	movq	2472(%rsp), %rax
	movq	%rax, 624(%rsi)
	movq	2480(%rsp), %rax
	movq	%rax, 632(%rsi)
	movq	2488(%rsp), %rax
	movq	%rax, 640(%rsi)
	movq	2496(%rsp), %rax
	movq	%rax, 648(%rsi)
	movq	2504(%rsp), %rax
	movq	%rax, 656(%rsi)
	movq	2512(%rsp), %rax
	movq	%rax, 664(%rsi)
	movq	2520(%rsp), %rax
	movq	%rax, 672(%rsi)
	movq	2528(%rsp), %rax
	movq	%rax, 680(%rsi)
	movq	2536(%rsp), %rax
	movq	%rax, 688(%rsi)
	movq	2544(%rsp), %rax
	movq	%rax, 696(%rsi)
	movq	2552(%rsp), %rax
	movq	%rax, 704(%rsi)
	movq	2560(%rsp), %rax
	movq	%rax, 712(%rsi)
	movq	2568(%rsp), %rax
	movq	%rax, 720(%rsi)
	movq	2576(%rsp), %rax
	movq	%rax, 728(%rsi)
	movq	2584(%rsp), %rax
	movq	%rax, 736(%rsi)
	movq	2592(%rsp), %rax
	movq	%rax, 744(%rsi)
	movq	2600(%rsp), %rax
	movq	%rax, 752(%rsi)
	movq	2608(%rsp), %rax
	movq	%rax, 760(%rsi)
	movq	2616(%rsp), %rax
	movq	%rax, 768(%rsi)
	movq	2624(%rsp), %rax
	movq	%rax, 776(%rsi)
	movq	2632(%rsp), %rax
	movq	%rax, 784(%rsi)
	movq	2640(%rsp), %rax
	movq	%rax, 792(%rsi)
	movq	2648(%rsp), %rax
	movq	%rax, 800(%rsi)
	movq	2656(%rsp), %rax
	movq	%rax, 808(%rsi)
	movq	2664(%rsp), %rax
	movq	%rax, 816(%rsi)
	movq	2672(%rsp), %rax
	movq	%rax, 824(%rsi)
	movq	2680(%rsp), %rax
	movq	%rax, 832(%rsi)
	movq	2688(%rsp), %rax
	movq	%rax, 840(%rsi)
	movq	2696(%rsp), %rax
	movq	%rax, 848(%rsi)
	movq	2704(%rsp), %rax
	movq	%rax, 856(%rsi)
	movq	2712(%rsp), %rax
	movq	%rax, 864(%rsi)
	movq	2720(%rsp), %rax
	movq	%rax, 872(%rsi)
	movq	2728(%rsp), %rax
	movq	%rax, 880(%rsi)
	movq	2736(%rsp), %rax
	movq	%rax, 888(%rsi)
	movq	2744(%rsp), %rax
	movq	%rax, 896(%rsi)
	movq	2752(%rsp), %rax
	movq	%rax, 904(%rsi)
	movq	2760(%rsp), %rax
	movq	%rax, 912(%rsi)
	movq	2768(%rsp), %rax
	movq	%rax, 920(%rsi)
	movq	2776(%rsp), %rax
	movq	%rax, 928(%rsi)
	movq	2784(%rsp), %rax
	movq	%rax, 936(%rsi)
	movq	2792(%rsp), %rax
	movq	%rax, 944(%rsi)
	movq	2800(%rsp), %rax
	movq	%rax, 952(%rsi)
	movq	2808(%rsp), %rax
	movq	%rax, 960(%rsi)
	movq	2816(%rsp), %rax
	movq	%rax, 968(%rsi)
	movq	2824(%rsp), %rax
	movq	%rax, 976(%rsi)
	movq	2832(%rsp), %rax
	movq	%rax, 984(%rsi)
	movq	2840(%rsp), %rax
	movq	%rax, 992(%rsi)
	movq	2848(%rsp), %rax
	movq	%rax, 1000(%rsi)
	movq	2856(%rsp), %rax
	movq	%rax, 1008(%rsi)
	movq	2864(%rsp), %rax
	movq	%rax, 1016(%rsi)
	movq	2872(%rsp), %rax
	movq	%rax, 1024(%rsi)
	movq	2880(%rsp), %rax
	movq	%rax, 1032(%rsi)
	movq	2888(%rsp), %rax
	movq	%rax, 1040(%rsi)
	movq	2896(%rsp), %rax
	movq	%rax, 1048(%rsi)
	movq	2904(%rsp), %rax
	movq	%rax, 1056(%rsi)
	movq	2912(%rsp), %rax
	movq	%rax, 1064(%rsi)
	movq	2920(%rsp), %rax
	movq	%rax, 1072(%rsi)
	movq	2928(%rsp), %rax
	movq	%rax, 1080(%rsi)
	movq	2936(%rsp), %rax
	movq	%rax, 1088(%rsi)
	movq	2944(%rsp), %rax
	movq	%rax, 1096(%rsi)
	movq	2952(%rsp), %rax
	movq	%rax, 1104(%rsi)
	movq	2960(%rsp), %rax
	movq	%rax, 1112(%rsi)
	movq	2968(%rsp), %rax
	movq	%rax, 1120(%rsi)
	movq	2976(%rsp), %rax
	movq	%rax, 1128(%rsi)
	movq	2984(%rsp), %rax
	movq	%rax, 1136(%rsi)
	movq	2992(%rsp), %rax
	movq	%rax, 1144(%rsi)
	movq	3000(%rsp), %rax
	movq	%rax, 1152(%rsi)
	movq	3008(%rsp), %rax
	movq	%rax, 1160(%rsi)
	movq	3016(%rsp), %rax
	movq	%rax, 1168(%rsi)
	movq	3024(%rsp), %rax
	movq	%rax, 1176(%rsi)
	movq	3032(%rsp), %rax
	movq	%rax, 1184(%rsi)
	movq	3040(%rsp), %rax
	movq	%rax, 1192(%rsi)
	movq	3048(%rsp), %rax
	movq	%rax, 1200(%rsi)
	movq	3056(%rsp), %rax
	movq	%rax, 1208(%rsi)
	movq	3064(%rsp), %rax
	movq	%rax, 1216(%rsi)
	movq	3072(%rsp), %rax
	movq	%rax, 1224(%rsi)
	movq	3080(%rsp), %rax
	movq	%rax, 1232(%rsi)
	movq	3088(%rsp), %rax
	movq	%rax, 1240(%rsi)
	movq	3096(%rsp), %rax
	movq	%rax, 1248(%rsi)
	movq	3104(%rsp), %rax
	movq	%rax, 1256(%rsi)
	movq	3112(%rsp), %rax
	movq	%rax, 1264(%rsi)
	movq	3120(%rsp), %rax
	movq	%rax, 1272(%rsi)
	movq	3128(%rsp), %rax
	movq	%rax, 1280(%rsi)
	movq	3136(%rsp), %rax
	movq	%rax, 1288(%rsi)
	movq	3144(%rsp), %rax
	movq	%rax, 1296(%rsi)
	movq	3152(%rsp), %rax
	movq	%rax, 1304(%rsi)
	movq	3160(%rsp), %rax
	movq	%rax, 1312(%rsi)
	movq	3168(%rsp), %rax
	movq	%rax, 1320(%rsi)
	movq	3176(%rsp), %rax
	movq	%rax, 1328(%rsi)
	movq	3184(%rsp), %rax
	movq	%rax, 1336(%rsi)
	movq	3192(%rsp), %rax
	movq	%rax, 1344(%rsi)
	movq	3200(%rsp), %rax
	movq	%rax, 1352(%rsi)
	movq	3208(%rsp), %rax
	movq	%rax, 1360(%rsi)
	movq	3216(%rsp), %rax
	movq	%rax, 1368(%rsi)
	movq	3224(%rsp), %rax
	movq	%rax, 1376(%rsi)
	movq	3232(%rsp), %rax
	movq	%rax, 1384(%rsi)
	movq	3240(%rsp), %rax
	movq	%rax, 1392(%rsi)
	movq	3248(%rsp), %rax
	movq	%rax, 1400(%rsi)
	movq	3256(%rsp), %rax
	movq	%rax, 1408(%rsi)
	movq	3264(%rsp), %rax
	movq	%rax, 1416(%rsi)
	movq	3272(%rsp), %rax
	movq	%rax, 1424(%rsi)
	movq	3280(%rsp), %rax
	movq	%rax, 1432(%rsi)
	movq	3288(%rsp), %rax
	movq	%rax, 1440(%rsi)
	movq	3296(%rsp), %rax
	movq	%rax, 1448(%rsi)
	movq	3304(%rsp), %rax
	movq	%rax, 1456(%rsi)
	movq	3312(%rsp), %rax
	movq	%rax, 1464(%rsi)
	movq	3320(%rsp), %rax
	movq	%rax, 1472(%rsi)
	movq	3328(%rsp), %rax
	movq	%rax, 1480(%rsi)
	movq	3336(%rsp), %rax
	movq	%rax, 1488(%rsi)
	movq	3344(%rsp), %rax
	movq	%rax, 1496(%rsi)
	movq	3352(%rsp), %rax
	movq	%rax, 1504(%rsi)
	movq	3360(%rsp), %rax
	movq	%rax, 1512(%rsi)
	movq	3368(%rsp), %rax
	movq	%rax, 1520(%rsi)
	movq	3376(%rsp), %rax
	movq	%rax, 1528(%rsi)
	movq	3384(%rsp), %rax
	movq	%rax, 1536(%rsi)
	movq	3392(%rsp), %rax
	movq	%rax, 1544(%rsi)
	movq	3400(%rsp), %rax
	movq	%rax, 1552(%rsi)
	movq	3408(%rsp), %rax
	movq	%rax, 1560(%rsi)
	movq	3416(%rsp), %rax
	movq	%rax, 1568(%rsi)
	movq	3424(%rsp), %rax
	movq	%rax, 1576(%rsi)
	movq	3432(%rsp), %rax
	movq	%rax, 1584(%rsi)
	movq	3440(%rsp), %rax
	movq	%rax, 1592(%rsi)
	movq	3448(%rsp), %rax
	movq	%rax, 1600(%rsi)
	movq	3456(%rsp), %rax
	movq	%rax, 1608(%rsi)
	movq	3464(%rsp), %rax
	movq	%rax, 1616(%rsi)
	movq	3472(%rsp), %rax
	movq	%rax, 1624(%rsi)
	movq	3480(%rsp), %rax
	movq	%rax, 1632(%rsi)
	movq	3488(%rsp), %rax
	movq	%rax, 1640(%rsi)
	movq	3496(%rsp), %rax
	movq	%rax, 1648(%rsi)
	movq	3504(%rsp), %rax
	movq	%rax, 1656(%rsi)
	movq	3512(%rsp), %rax
	movq	%rax, 1664(%rsi)
	movq	3520(%rsp), %rax
	movq	%rax, 1672(%rsi)
	movq	3528(%rsp), %rax
	movq	%rax, 1680(%rsi)
	movq	3536(%rsp), %rax
	movq	%rax, 1688(%rsi)
	movq	3544(%rsp), %rax
	movq	%rax, 1696(%rsi)
	movq	3552(%rsp), %rax
	movq	%rax, 1704(%rsi)
	movq	3560(%rsp), %rax
	movq	%rax, 1712(%rsi)
	movq	3568(%rsp), %rax
	movq	%rax, 1720(%rsi)
	movq	3576(%rsp), %rax
	movq	%rax, 1728(%rsi)
	movq	3584(%rsp), %rax
	movq	%rax, 1736(%rsi)
	movq	3592(%rsp), %rax
	movq	%rax, 1744(%rsi)
	movq	3600(%rsp), %rax
	movq	%rax, 1752(%rsi)
	movq	3608(%rsp), %rax
	movq	%rax, 1760(%rsi)
	movq	3616(%rsp), %rax
	movq	%rax, 1768(%rsi)
	movq	3624(%rsp), %rax
	movq	%rax, 1776(%rsi)
	movq	3632(%rsp), %rax
	movq	%rax, 1784(%rsi)
	movq	3640(%rsp), %rax
	movq	%rax, 1792(%rsi)
	movq	3648(%rsp), %rax
	movq	%rax, 1800(%rsi)
	movq	3656(%rsp), %rax
	movq	%rax, 1808(%rsi)
	movq	3664(%rsp), %rax
	movq	%rax, 1816(%rsi)
	movq	3672(%rsp), %rax
	movq	%rax, 1824(%rsi)
	movq	3680(%rsp), %rax
	movq	%rax, 1832(%rsi)
	movq	3688(%rsp), %rax
	movq	%rax, 1840(%rsi)
	movq	3696(%rsp), %rax
	movq	%rax, 1848(%rsi)
	movq	3704(%rsp), %rax
	movq	%rax, 1856(%rsi)
	movq	3712(%rsp), %rax
	movq	%rax, 1864(%rsi)
	movq	3720(%rsp), %rax
	movq	%rax, 1872(%rsi)
	movq	3728(%rsp), %rax
	movq	%rax, 1880(%rsi)
	movq	3736(%rsp), %rax
	movq	%rax, 1888(%rsi)
	movq	3744(%rsp), %rax
	movq	%rax, 1896(%rsi)
	movq	3752(%rsp), %rax
	movq	%rax, 1904(%rsi)
	movq	3760(%rsp), %rax
	movq	%rax, 1912(%rsi)
	movq	3768(%rsp), %rax
	movq	%rax, 1920(%rsi)
	movq	3776(%rsp), %rax
	movq	%rax, 1928(%rsi)
	movq	3784(%rsp), %rax
	movq	%rax, 1936(%rsi)
	movq	3792(%rsp), %rax
	movq	%rax, 1944(%rsi)
	movq	3800(%rsp), %rax
	movq	%rax, 1952(%rsi)
	movq	3808(%rsp), %rax
	movq	%rax, 1960(%rsi)
	movq	3816(%rsp), %rax
	movq	%rax, 1968(%rsi)
	movq	3824(%rsp), %rax
	movq	%rax, 1976(%rsi)
	movq	3832(%rsp), %rax
	movq	%rax, 1984(%rsi)
	movq	3840(%rsp), %rax
	movq	%rax, 1992(%rsi)
	movq	3848(%rsp), %rax
	movq	%rax, 2000(%rsi)
	movq	3856(%rsp), %rax
	movq	%rax, 2008(%rsi)
	movq	3864(%rsp), %rax
	movq	%rax, 2016(%rsi)
	movq	3872(%rsp), %rax
	movq	%rax, 2024(%rsi)
	movq	3880(%rsp), %rax
	movq	%rax, 2032(%rsi)
	movq	3888(%rsp), %rax
	movq	%rax, 2040(%rsi)
	movq	3896(%rsp), %rax
	movq	%rax, 2048(%rsi)
	movq	3904(%rsp), %rax
	movq	%rax, 2056(%rsi)
	movq	3912(%rsp), %rax
	movq	%rax, 2064(%rsi)
	movq	3920(%rsp), %rax
	movq	%rax, 2072(%rsi)
	movq	3928(%rsp), %rax
	movq	%rax, 2080(%rsi)
	movq	3936(%rsp), %rax
	movq	%rax, 2088(%rsi)
	movq	3944(%rsp), %rax
	movq	%rax, 2096(%rsi)
	movq	3952(%rsp), %rax
	movq	%rax, 2104(%rsi)
	movq	3960(%rsp), %rax
	movq	%rax, 2112(%rsi)
	movq	3968(%rsp), %rax
	movq	%rax, 2120(%rsi)
	movq	3976(%rsp), %rax
	movq	%rax, 2128(%rsi)
	movq	3984(%rsp), %rax
	movq	%rax, 2136(%rsi)
	movq	3992(%rsp), %rax
	movq	%rax, 2144(%rsi)
	movq	4000(%rsp), %rax
	movq	%rax, 2152(%rsi)
	movq	4008(%rsp), %rax
	movq	%rax, 2160(%rsi)
	movq	4016(%rsp), %rax
	movq	%rax, 2168(%rsi)
	movq	4024(%rsp), %rax
	movq	%rax, 2176(%rsi)
	movq	4032(%rsp), %rax
	movq	%rax, 2184(%rsi)
	movq	4040(%rsp), %rax
	movq	%rax, 2192(%rsi)
	movq	4048(%rsp), %rax
	movq	%rax, 2200(%rsi)
	movq	4056(%rsp), %rax
	movq	%rax, 2208(%rsi)
	movq	4064(%rsp), %rax
	movq	%rax, 2216(%rsi)
	movq	4072(%rsp), %rax
	movq	%rax, 2224(%rsi)
	movq	4080(%rsp), %rax
	movq	%rax, 2232(%rsi)
	movq	4088(%rsp), %rax
	movq	%rax, 2240(%rsi)
	movq	4096(%rsp), %rax
	movq	%rax, 2248(%rsi)
	movq	4104(%rsp), %rax
	movq	%rax, 2256(%rsi)
	movq	4112(%rsp), %rax
	movq	%rax, 2264(%rsi)
	movq	4120(%rsp), %rax
	movq	%rax, 2272(%rsi)
	movq	4128(%rsp), %rax
	movq	%rax, 2280(%rsi)
	movq	4136(%rsp), %rax
	movq	%rax, 2288(%rsi)
	movq	4144(%rsp), %rax
	movq	%rax, 2296(%rsi)
	movq	4152(%rsp), %rax
	movq	%rax, 2304(%rsi)
	movq	4160(%rsp), %rax
	movq	%rax, 2312(%rsi)
	movq	4168(%rsp), %rax
	movq	%rax, 2320(%rsi)
	movq	4176(%rsp), %rax
	movq	%rax, 2328(%rsi)
	movq	4184(%rsp), %rax
	movq	%rax, 2336(%rsi)
	movq	4192(%rsp), %rax
	movq	%rax, 2344(%rsi)
	movq	4200(%rsp), %rax
	movq	%rax, 2352(%rsi)
	movq	4208(%rsp), %rax
	movq	%rax, 2360(%rsi)
	movq	4216(%rsp), %rax
	movq	%rax, 2368(%rsi)
	movq	4224(%rsp), %rax
	movq	%rax, 2376(%rsi)
	movq	4232(%rsp), %rax
	movq	%rax, 2384(%rsi)
	movq	4240(%rsp), %rax
	movq	%rax, 2392(%rsi)
	xorl	%eax, %eax
	movq	13976(%rsp), %rbx
	movq	13984(%rsp), %rbp
	movq	13992(%rsp), %r12
	movq	14000(%rsp), %r13
	movq	14008(%rsp), %r14
	movq	14016(%rsp), %r15
	movq	14024(%rsp), %rsp
	ret
L_i_poly_decompress$1:
	movq	$0, %rcx
	jmp 	L_i_poly_decompress$2
L_i_poly_decompress$3:
	movb	(%rbx,%rcx), %sil
	movzbw	%sil, %r8w
	movzbw	%sil, %di
	andw	$15, %r8w
	shrw	$4, %di
	imulw	$3329, %r8w, %r8w
	imulw	$3329, %di, %di
	addw	$8, %r8w
	addw	$8, %di
	shrw	$4, %r8w
	shrw	$4, %di
	movw	%r8w, (%rdx,%rcx,4)
	movw	%di, 2(%rdx,%rcx,4)
	incq	%rcx
L_i_poly_decompress$2:
	cmpq	$128, %rcx
	jb  	L_i_poly_decompress$3
	ret
L_i_poly_compress$1:
	call	L_poly_csubq$1
L_i_poly_compress$4:
	movq	$0, %rcx
	jmp 	L_i_poly_compress$2
L_i_poly_compress$3:
	movzwl	(%rax,%rcx,4), %r8d
	movzwl	2(%rax,%rcx,4), %edi
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
	movb	%r8b, (%rdx,%rcx)
	incq	%rcx
L_i_poly_compress$2:
	cmpq	$128, %rcx
	jb  	L_i_poly_compress$3
	ret
L_i_poly_tomsg$1:
	call	L_poly_csubq$1
L_i_poly_tomsg$2:
	movb	$0, %cl
	movw	(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	2(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	4(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	6(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	8(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	10(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	12(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	14(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, (%r10)
	movb	$0, %cl
	movw	16(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	18(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	20(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	22(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	24(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	26(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	28(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	30(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 1(%r10)
	movb	$0, %cl
	movw	32(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	34(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	36(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	38(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	40(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	42(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	44(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	46(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 2(%r10)
	movb	$0, %cl
	movw	48(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	50(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	52(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	54(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	56(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	58(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	60(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	62(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 3(%r10)
	movb	$0, %cl
	movw	64(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	66(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	68(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	70(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	72(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	74(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	76(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	78(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 4(%r10)
	movb	$0, %cl
	movw	80(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	82(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	84(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	86(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	88(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	90(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	92(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	94(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 5(%r10)
	movb	$0, %cl
	movw	96(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	98(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	100(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	102(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	104(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	106(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	108(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	110(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 6(%r10)
	movb	$0, %cl
	movw	112(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	114(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	116(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	118(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	120(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	122(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	124(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	126(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 7(%r10)
	movb	$0, %cl
	movw	128(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	130(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	132(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	134(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	136(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	138(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	140(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	142(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 8(%r10)
	movb	$0, %cl
	movw	144(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	146(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	148(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	150(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	152(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	154(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	156(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	158(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 9(%r10)
	movb	$0, %cl
	movw	160(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	162(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	164(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	166(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	168(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	170(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	172(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	174(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 10(%r10)
	movb	$0, %cl
	movw	176(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	178(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	180(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	182(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	184(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	186(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	188(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	190(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 11(%r10)
	movb	$0, %cl
	movw	192(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	194(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	196(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	198(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	200(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	202(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	204(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	206(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 12(%r10)
	movb	$0, %cl
	movw	208(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	210(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	212(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	214(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	216(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	218(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	220(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	222(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 13(%r10)
	movb	$0, %cl
	movw	224(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	226(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	228(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	230(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	232(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	234(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	236(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	238(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 14(%r10)
	movb	$0, %cl
	movw	240(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	242(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	244(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	246(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	248(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	250(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	252(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	254(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 15(%r10)
	movb	$0, %cl
	movw	256(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	258(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	260(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	262(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	264(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	266(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	268(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	270(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 16(%r10)
	movb	$0, %cl
	movw	272(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	274(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	276(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	278(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	280(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	282(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	284(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	286(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 17(%r10)
	movb	$0, %cl
	movw	288(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	290(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	292(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	294(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	296(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	298(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	300(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	302(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 18(%r10)
	movb	$0, %cl
	movw	304(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	306(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	308(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	310(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	312(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	314(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	316(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	318(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 19(%r10)
	movb	$0, %cl
	movw	320(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	322(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	324(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	326(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	328(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	330(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	332(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	334(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 20(%r10)
	movb	$0, %cl
	movw	336(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	338(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	340(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	342(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	344(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	346(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	348(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	350(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 21(%r10)
	movb	$0, %cl
	movw	352(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	354(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	356(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	358(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	360(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	362(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	364(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	366(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 22(%r10)
	movb	$0, %cl
	movw	368(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	370(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	372(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	374(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	376(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	378(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	380(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	382(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 23(%r10)
	movb	$0, %cl
	movw	384(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	386(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	388(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	390(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	392(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	394(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	396(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	398(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 24(%r10)
	movb	$0, %cl
	movw	400(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	402(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	404(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	406(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	408(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	410(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	412(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	414(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 25(%r10)
	movb	$0, %cl
	movw	416(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	418(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	420(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	422(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	424(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	426(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	428(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	430(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 26(%r10)
	movb	$0, %cl
	movw	432(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	434(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	436(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	438(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	440(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	442(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	444(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	446(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 27(%r10)
	movb	$0, %cl
	movw	448(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	450(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	452(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	454(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	456(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	458(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	460(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	462(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 28(%r10)
	movb	$0, %cl
	movw	464(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	466(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	468(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	470(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	472(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	474(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	476(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	478(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 29(%r10)
	movb	$0, %cl
	movw	480(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	482(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	484(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	486(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	488(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	490(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	492(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	494(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 30(%r10)
	movb	$0, %cl
	movw	496(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$0, %r12d
	orb 	%r12b, %cl
	movw	498(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$1, %r12d
	orb 	%r12b, %cl
	movw	500(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$2, %r12d
	orb 	%r12b, %cl
	movw	502(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$3, %r12d
	orb 	%r12b, %cl
	movw	504(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$4, %r12d
	orb 	%r12b, %cl
	movw	506(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$5, %r12d
	orb 	%r12b, %cl
	movw	508(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$6, %r12d
	orb 	%r12b, %cl
	movw	510(%rax), %si
	movzwl	%si, %r12d
	shll	$1, %r12d
	addl	$1665, %r12d
	imull	$80635, %r12d, %r12d
	shrl	$28, %r12d
	andl	$1, %r12d
	shll	$7, %r12d
	orb 	%r12b, %cl
	movb	%cl, 31(%r10)
	ret
L_poly_tobytes$1:
	call	L_poly_csubq$1
L_poly_tobytes$4:
	movq	$0, %rdi
	movq	$0, %rcx
	jmp 	L_poly_tobytes$2
L_poly_tobytes$3:
	movw	(%rax,%rcx,2), %r8w
	movw	2(%rax,%rcx,2), %r9w
	movw	%r8w, %r12w
	andw	$255, %r12w
	movb	%r12b, (%rdx,%rdi)
	incq	%rdi
	shrw	$8, %r8w
	andw	$15, %r8w
	movw	%r9w, %r12w
	andw	$15, %r12w
	shlw	$4, %r12w
	orw 	%r8w, %r12w
	movb	%r12b, (%rdx,%rdi)
	incq	%rdi
	shrw	$4, %r9w
	movb	%r9b, (%rdx,%rdi)
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
	movw	(%rdx,%rsi,2), %bx
	movw	(%rcx,%rsi,2), %di
	subw	%di, %bx
	movw	%bx, (%rax,%rsi,2)
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
	movswl	%r12w, %r12d
	movswl	%bp, %r13d
	imull	%r13d, %r12d
	imull	$-218038272, %r12d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %r14d
	addl	%r12d, %r14d
	sarl	$16, %r14d
	subw	%r14w, %r11w
	addw	%r9w, %r14w
	movw	%r11w, (%rax,%rbx,2)
	movw	%r14w, (%rax,%rdi,2)
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
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %si
	movw	%si, (%rax,%rdi,2)
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
	movq	$0, %r9
	jmp 	L_poly_invntt$6
L_poly_invntt$7:
	movw	(%rcx,%rdx,2), %di
	incq	%rdx
	movq	%r9, %r8
	addq	%rsi, %r9
	jmp 	L_poly_invntt$8
L_poly_invntt$9:
	movw	(%rax,%r8,2), %bx
	movq	%r8, %r11
	addq	%rsi, %r11
	movw	(%rax,%r11,2), %bp
	movw	%bp, %r12w
	addw	%bx, %r12w
	movswl	%r12w, %r14d
	imull	$20159, %r14d, %r14d
	sarl	$26, %r14d
	imull	$3329, %r14d, %r14d
	subw	%r14w, %r12w
	movw	%r12w, (%rax,%r8,2)
	subw	%bp, %bx
	movswl	%bx, %r12d
	movswl	%di, %r13d
	imull	%r13d, %r12d
	imull	$-218038272, %r12d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %ebx
	addl	%r12d, %ebx
	sarl	$16, %ebx
	movw	%bx, (%rax,%r11,2)
	incq	%r8
L_poly_invntt$8:
	cmpq	%r9, %r8
	jb  	L_poly_invntt$9
	movq	%r8, %r9
	addq	%rsi, %r9
L_poly_invntt$6:
	cmpq	$256, %r9
	jb  	L_poly_invntt$7
	shlq	$1, %rsi
L_poly_invntt$4:
	cmpq	$128, %rsi
	jbe 	L_poly_invntt$5
	movw	254(%rcx), %dx
	movq	$0, %rdi
	jmp 	L_poly_invntt$2
L_poly_invntt$3:
	movw	(%rax,%rdi,2), %si
	movswl	%si, %r12d
	movswl	%dx, %r13d
	imull	%r13d, %r12d
	imull	$-218038272, %r12d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %esi
	addl	%r12d, %esi
	sarl	$16, %esi
	movw	%si, (%rax,%rdi,2)
	incq	%rdi
L_poly_invntt$2:
	cmpq	$256, %rdi
	jb  	L_poly_invntt$3
	ret
L_poly_getnoise$1:
	movq	%rdx, 8(%rsp)
	movq	%rcx, %rdx
	movb	(%rdx), %r12b
	movb	%r12b, 16(%rsp)
	movb	1(%rdx), %r12b
	movb	%r12b, 17(%rsp)
	movb	2(%rdx), %r12b
	movb	%r12b, 18(%rsp)
	movb	3(%rdx), %r12b
	movb	%r12b, 19(%rsp)
	movb	4(%rdx), %r12b
	movb	%r12b, 20(%rsp)
	movb	5(%rdx), %r12b
	movb	%r12b, 21(%rsp)
	movb	6(%rdx), %r12b
	movb	%r12b, 22(%rsp)
	movb	7(%rdx), %r12b
	movb	%r12b, 23(%rsp)
	movb	8(%rdx), %r12b
	movb	%r12b, 24(%rsp)
	movb	9(%rdx), %r12b
	movb	%r12b, 25(%rsp)
	movb	10(%rdx), %r12b
	movb	%r12b, 26(%rsp)
	movb	11(%rdx), %r12b
	movb	%r12b, 27(%rsp)
	movb	12(%rdx), %r12b
	movb	%r12b, 28(%rsp)
	movb	13(%rdx), %r12b
	movb	%r12b, 29(%rsp)
	movb	14(%rdx), %r12b
	movb	%r12b, 30(%rsp)
	movb	15(%rdx), %r12b
	movb	%r12b, 31(%rsp)
	movb	16(%rdx), %r12b
	movb	%r12b, 32(%rsp)
	movb	17(%rdx), %r12b
	movb	%r12b, 33(%rsp)
	movb	18(%rdx), %r12b
	movb	%r12b, 34(%rsp)
	movb	19(%rdx), %r12b
	movb	%r12b, 35(%rsp)
	movb	20(%rdx), %r12b
	movb	%r12b, 36(%rsp)
	movb	21(%rdx), %r12b
	movb	%r12b, 37(%rsp)
	movb	22(%rdx), %r12b
	movb	%r12b, 38(%rsp)
	movb	23(%rdx), %r12b
	movb	%r12b, 39(%rsp)
	movb	24(%rdx), %r12b
	movb	%r12b, 40(%rsp)
	movb	25(%rdx), %r12b
	movb	%r12b, 41(%rsp)
	movb	26(%rdx), %r12b
	movb	%r12b, 42(%rsp)
	movb	27(%rdx), %r12b
	movb	%r12b, 43(%rsp)
	movb	28(%rdx), %r12b
	movb	%r12b, 44(%rsp)
	movb	29(%rdx), %r12b
	movb	%r12b, 45(%rsp)
	movb	30(%rdx), %r12b
	movb	%r12b, 46(%rsp)
	movb	31(%rdx), %dl
	movb	%dl, 47(%rsp)
	movb	%al, 48(%rsp)
	leaq	56(%rsp), %rax
	leaq	16(%rsp), %r10
	leaq	-224(%rsp), %rsp
	call	L_shake256_128_33$1
L_poly_getnoise$4:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	$0, %rsi
	jmp 	L_poly_getnoise$2
L_poly_getnoise$3:
	movb	56(%rsp,%rsi), %dl
	movb	%dl, %bl
	andb	$85, %bl
	shrb	$1, %dl
	andb	$85, %dl
	addb	%bl, %dl
	movb	%dl, %bl
	andb	$3, %bl
	movb	%dl, %dil
	shrb	$2, %dil
	andb	$3, %dil
	subb	%dil, %bl
	movsbw	%bl, %r9w
	movw	%r9w, (%rax,%rsi,4)
	movb	%dl, %bl
	shrb	$4, %bl
	andb	$3, %bl
	shrb	$6, %dl
	andb	$3, %dl
	subb	%dl, %bl
	movsbw	%bl, %r9w
	movw	%r9w, 2(%rax,%rsi,4)
	incq	%rsi
L_poly_getnoise$2:
	cmpq	$128, %rsi
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 14(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 30(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 46(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 62(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 78(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 94(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 110(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 126(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 142(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 158(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 174(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 190(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 206(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 222(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 238(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 254(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 270(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 286(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 302(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 318(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 334(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 350(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 366(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 382(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 398(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 414(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 430(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 446(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 462(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 478(%rcx)
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
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 494(%rcx)
	movb	31(%rax), %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 496(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 498(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 500(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 502(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 504(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 506(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 508(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 510(%rcx)
	ret
L_poly_frommont$1:
	movw	$1353, %dx
	movq	$0, %rcx
	jmp 	L_poly_frommont$2
L_poly_frommont$3:
	movw	(%rax,%rcx,2), %si
	movswl	%si, %r12d
	movswl	%dx, %r13d
	imull	%r13d, %r12d
	imull	$-218038272, %r12d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %esi
	addl	%r12d, %esi
	sarl	$16, %esi
	movw	%si, (%rax,%rcx,2)
	incq	%rcx
L_poly_frommont$2:
	cmpq	$256, %rcx
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
	movq	$0, %rsi
	jmp 	L_poly_basemul$2
L_poly_basemul$3:
	leaq	glob_data + 576(%rip), %rdx
	movq	%rsi, %rdi
	shrq	$2, %rdi
	movw	(%rdx,%rdi,2), %bp
	movw	(%rax,%rsi,2), %bx
	movw	(%rcx,%rsi,2), %dx
	incq	%rsi
	movw	(%rax,%rsi,2), %r12w
	movw	(%rcx,%rsi,2), %di
	decq	%rsi
	movswl	%r12w, %r8d
	movswl	%di, %r13d
	imull	%r13d, %r8d
	imull	$-218038272, %r8d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %r9d
	addl	%r8d, %r9d
	sarl	$16, %r9d
	movswl	%r9w, %r8d
	movswl	%bp, %r13d
	imull	%r13d, %r8d
	imull	$-218038272, %r8d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %r9d
	addl	%r8d, %r9d
	sarl	$16, %r9d
	movw	%r9w, %r8w
	movswl	%bx, %r9d
	movswl	%dx, %r13d
	imull	%r13d, %r9d
	imull	$-218038272, %r9d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %r14d
	addl	%r9d, %r14d
	sarl	$16, %r14d
	addw	%r14w, %r8w
	movswl	%bx, %r9d
	movswl	%di, %r13d
	imull	%r13d, %r9d
	imull	$-218038272, %r9d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %ebx
	addl	%r9d, %ebx
	sarl	$16, %ebx
	movswl	%r12w, %r9d
	movswl	%dx, %r13d
	imull	%r13d, %r9d
	imull	$-218038272, %r9d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %r14d
	addl	%r9d, %r14d
	sarl	$16, %r14d
	addw	%r14w, %bx
	movq	8(%rsp), %rdx
	movw	%r8w, (%rdx,%rsi,2)
	incq	%rsi
	movw	%bx, (%rdx,%rsi,2)
	movq	%rdx, 16(%rsp)
	negw	%bp
	incq	%rsi
	movw	(%rax,%rsi,2), %bx
	movw	(%rcx,%rsi,2), %dx
	incq	%rsi
	movw	(%rax,%rsi,2), %r12w
	movw	(%rcx,%rsi,2), %di
	decq	%rsi
	movswl	%r12w, %r8d
	movswl	%di, %r13d
	imull	%r13d, %r8d
	imull	$-218038272, %r8d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %r9d
	addl	%r8d, %r9d
	sarl	$16, %r9d
	movswl	%r9w, %r8d
	movswl	%bp, %r13d
	imull	%r13d, %r8d
	imull	$-218038272, %r8d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %r9d
	addl	%r8d, %r9d
	sarl	$16, %r9d
	movw	%r9w, %r8w
	movswl	%bx, %r9d
	movswl	%dx, %r13d
	imull	%r13d, %r9d
	imull	$-218038272, %r9d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %r14d
	addl	%r9d, %r14d
	sarl	$16, %r14d
	addw	%r14w, %r8w
	movswl	%bx, %r9d
	movswl	%di, %r13d
	imull	%r13d, %r9d
	imull	$-218038272, %r9d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %ebx
	addl	%r9d, %ebx
	sarl	$16, %ebx
	movswl	%r12w, %r9d
	movswl	%dx, %r13d
	imull	%r13d, %r9d
	imull	$-218038272, %r9d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %r14d
	addl	%r9d, %r14d
	sarl	$16, %r14d
	addw	%r14w, %bx
	movq	16(%rsp), %rdx
	movw	%r8w, (%rdx,%rsi,2)
	incq	%rsi
	movw	%bx, (%rdx,%rsi,2)
	incq	%rsi
L_poly_basemul$2:
	cmpq	$253, %rsi
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
	movq	$0, %rsi
	jmp 	L_poly_add2$2
L_poly_add2$3:
	movw	(%rax,%rsi,2), %bx
	movw	(%rcx,%rsi,2), %dx
	addw	%dx, %bx
	movw	%bx, (%rax,%rsi,2)
	incq	%rsi
L_poly_add2$2:
	cmpq	$256, %rsi
	jb  	L_poly_add2$3
	ret
L_sha3_512A_A64$1:
	leaq	32(%rsp), %rsi
	movq	$0, %rdx
	movq	$0, %rdi
	jmp 	L_sha3_512A_A64$12
L_sha3_512A_A64$13:
	movq	%rdx, (%rsi,%rdi,8)
	incq	%rdi
L_sha3_512A_A64$12:
	cmpq	$25, %rdi
	jb  	L_sha3_512A_A64$13
	movq	%rax, 8(%rsp)
	movq	$0, %r11
	movq	$0, %rax
	jmp 	L_sha3_512A_A64$10
L_sha3_512A_A64$11:
	movq	(%r10,%r11), %rdx
	addq	$8, %r11
	xorq	%rdx, (%rsi,%rax,8)
	incq	%rax
L_sha3_512A_A64$10:
	cmpq	$8, %rax
	jb  	L_sha3_512A_A64$11
	movq	$0, %rdx
	movq	$6, %rdi
	orq 	%rdi, %rdx
	xorq	%rdx, (%rsi,%rax,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	64(%rsi), %rax
	movq	%rax, 64(%rsi)
	movq	8(%rsp), %rax
	movq	$0, %r11
	movq	$0, %rdi
	jmp 	L_sha3_512A_A64$5
L_sha3_512A_A64$6:
	movq	%rax, 8(%rsp)
	movq	%r11, 16(%rsp)
	movq	%rdi, 24(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A64$9:
	leaq	200(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %r11
	movq	$0, %rdi
	jmp 	L_sha3_512A_A64$7
L_sha3_512A_A64$8:
	movq	(%rsi,%rdi,8), %r9
	movq	%r9, (%rax,%r11)
	addq	$8, %r11
	incq	%rdi
L_sha3_512A_A64$7:
	cmpq	$9, %rdi
	jb  	L_sha3_512A_A64$8
	movq	24(%rsp), %rdi
	incq	%rdi
L_sha3_512A_A64$5:
	cmpq	$0, %rdi
	jb  	L_sha3_512A_A64$6
	movq	%rax, 24(%rsp)
	movq	%r11, 16(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A64$4:
	leaq	200(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	16(%rsp), %r11
	movq	$0, %rdi
	jmp 	L_sha3_512A_A64$2
L_sha3_512A_A64$3:
	movq	(%rsi,%rdi,8), %r9
	movq	%r9, (%rax,%r11)
	addq	$8, %r11
	incq	%rdi
L_sha3_512A_A64$2:
	cmpq	$8, %rdi
	jb  	L_sha3_512A_A64$3
	ret
L_sha3_256A_A1184$1:
	movq	%rax, 8(%rsp)
	leaq	40(%rsp), %rsi
	movq	$0, %rdx
	movq	$0, %rdi
	jmp 	L_sha3_256A_A1184$20
L_sha3_256A_A1184$21:
	movq	%rdx, (%rsi,%rdi,8)
	incq	%rdi
L_sha3_256A_A1184$20:
	cmpq	$25, %rdi
	jb  	L_sha3_256A_A1184$21
	movq	$0, %r11
	movq	$0, %rax
	jmp 	L_sha3_256A_A1184$18
L_sha3_256A_A1184$19:
	movq	(%r10,%r11), %rdx
	addq	$8, %r11
	xorq	%rdx, (%rsi,%rax,8)
	incq	%rax
L_sha3_256A_A1184$18:
	cmpq	$17, %rax
	jb  	L_sha3_256A_A1184$19
	movq	%r10, 16(%rsp)
	movq	%r11, 24(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1184$17:
	leaq	200(%rsp), %rsp
	movq	16(%rsp), %rax
	movq	24(%rsp), %r11
	movq	$0, %r8
	jmp 	L_sha3_256A_A1184$12
L_sha3_256A_A1184$13:
	movq	$0, %rdx
	jmp 	L_sha3_256A_A1184$15
L_sha3_256A_A1184$16:
	movq	(%rax,%r11), %rdi
	addq	$8, %r11
	xorq	%rdi, (%rsi,%rdx,8)
	incq	%rdx
L_sha3_256A_A1184$15:
	cmpq	$17, %rdx
	jb  	L_sha3_256A_A1184$16
	movq	%rax, 24(%rsp)
	movq	%r11, 16(%rsp)
	movq	%r8, 32(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1184$14:
	leaq	200(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	16(%rsp), %r11
	movq	32(%rsp), %r8
	incq	%r8
L_sha3_256A_A1184$12:
	cmpq	$7, %r8
	jb  	L_sha3_256A_A1184$13
	movq	$0, %rdx
	jmp 	L_sha3_256A_A1184$10
L_sha3_256A_A1184$11:
	movq	(%rax,%r11), %rdi
	addq	$8, %r11
	xorq	%rdi, (%rsi,%rdx,8)
	incq	%rdx
L_sha3_256A_A1184$10:
	cmpq	$12, %rdx
	jb  	L_sha3_256A_A1184$11
	movq	$0, %rdi
	movq	$6, %rax
	orq 	%rax, %rdi
	xorq	%rdi, (%rsi,%rdx,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	128(%rsi), %rax
	movq	%rax, 128(%rsi)
	movq	8(%rsp), %rax
	movq	$0, %r11
	movq	$0, %rdi
	jmp 	L_sha3_256A_A1184$5
L_sha3_256A_A1184$6:
	movq	%rax, 8(%rsp)
	movq	%r11, 32(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1184$9:
	leaq	200(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	32(%rsp), %r11
	movq	$0, %rdi
	jmp 	L_sha3_256A_A1184$7
L_sha3_256A_A1184$8:
	movq	(%rsi,%rdi,8), %r9
	movq	%r9, (%rax,%r11)
	addq	$8, %r11
	incq	%rdi
L_sha3_256A_A1184$7:
	cmpq	$17, %rdi
	jb  	L_sha3_256A_A1184$8
	movq	16(%rsp), %rdi
	incq	%rdi
L_sha3_256A_A1184$5:
	cmpq	$0, %rdi
	jb  	L_sha3_256A_A1184$6
	movq	%rax, 16(%rsp)
	movq	%r11, 32(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1184$4:
	leaq	200(%rsp), %rsp
	movq	16(%rsp), %rax
	movq	32(%rsp), %r11
	movq	$0, %rdi
	jmp 	L_sha3_256A_A1184$2
L_sha3_256A_A1184$3:
	movq	(%rsi,%rdi,8), %r9
	movq	%r9, (%rax,%r11)
	addq	$8, %r11
	incq	%rdi
L_sha3_256A_A1184$2:
	cmpq	$4, %rdi
	jb  	L_sha3_256A_A1184$3
	ret
L_shake128_squeezeblock$1:
	movq	%rax, 8(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake128_squeezeblock$4:
	leaq	200(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdi
	jmp 	L_shake128_squeezeblock$2
L_shake128_squeezeblock$3:
	movq	(%rsi,%rdi,8), %r9
	movq	%r9, (%rax,%rcx)
	addq	$8, %rcx
	incq	%rdi
L_shake128_squeezeblock$2:
	cmpq	$21, %rdi
	jb  	L_shake128_squeezeblock$3
	ret
L_shake128_absorb34$1:
	movq	$0, %rdx
	movq	$0, %rcx
	jmp 	L_shake128_absorb34$4
L_shake128_absorb34$5:
	movq	%rdx, (%rsi,%rcx,8)
	incq	%rcx
L_shake128_absorb34$4:
	cmpq	$25, %rcx
	jb  	L_shake128_absorb34$5
	movq	$0, %rcx
	movq	$0, %rax
	jmp 	L_shake128_absorb34$2
L_shake128_absorb34$3:
	movq	(%r10,%rcx), %rdx
	addq	$8, %rcx
	xorq	%rdx, (%rsi,%rax,8)
	incq	%rax
L_shake128_absorb34$2:
	cmpq	$4, %rax
	jb  	L_shake128_absorb34$3
	movq	$0, %rdx
	movzwq	(%r10,%rcx), %rcx
	orq 	%rcx, %rdx
	movq	$31, %rdi
	shlq	$16, %rdi
	orq 	%rdi, %rdx
	xorq	%rdx, (%rsi,%rax,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	160(%rsi), %rax
	movq	%rax, 160(%rsi)
	ret
L_sha3_512A_A33$1:
	leaq	32(%rsp), %rsi
	movq	$0, %rdx
	movq	$0, %rcx
	jmp 	L_sha3_512A_A33$12
L_sha3_512A_A33$13:
	movq	%rdx, (%rsi,%rcx,8)
	incq	%rcx
L_sha3_512A_A33$12:
	cmpq	$25, %rcx
	jb  	L_sha3_512A_A33$13
	movq	%rax, 8(%rsp)
	movq	$0, %rcx
	movq	$0, %rax
	jmp 	L_sha3_512A_A33$10
L_sha3_512A_A33$11:
	movq	(%r10,%rcx), %rdx
	addq	$8, %rcx
	xorq	%rdx, (%rsi,%rax,8)
	incq	%rax
L_sha3_512A_A33$10:
	cmpq	$4, %rax
	jb  	L_sha3_512A_A33$11
	movq	$0, %rdx
	movzbq	(%r10,%rcx), %rdi
	orq 	$1536, %rdi
	orq 	%rdi, %rdx
	xorq	%rdx, (%rsi,%rax,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	64(%rsi), %rax
	movq	%rax, 64(%rsi)
	movq	8(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdi
	jmp 	L_sha3_512A_A33$5
L_sha3_512A_A33$6:
	movq	%rax, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%rdi, 24(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A33$9:
	leaq	200(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	$0, %rdi
	jmp 	L_sha3_512A_A33$7
L_sha3_512A_A33$8:
	movq	(%rsi,%rdi,8), %r9
	movq	%r9, (%rax,%rcx)
	addq	$8, %rcx
	incq	%rdi
L_sha3_512A_A33$7:
	cmpq	$9, %rdi
	jb  	L_sha3_512A_A33$8
	movq	24(%rsp), %rdi
	incq	%rdi
L_sha3_512A_A33$5:
	cmpq	$0, %rdi
	jb  	L_sha3_512A_A33$6
	movq	%rax, 24(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A33$4:
	leaq	200(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	$0, %rdi
	jmp 	L_sha3_512A_A33$2
L_sha3_512A_A33$3:
	movq	(%rsi,%rdi,8), %r9
	movq	%r9, (%rax,%rcx)
	addq	$8, %rcx
	incq	%rdi
L_sha3_512A_A33$2:
	cmpq	$8, %rdi
	jb  	L_sha3_512A_A33$3
	ret
L_shake256_A32__A1120$1:
	leaq	40(%rsp), %rsi
	movq	$0, %rdi
	movq	$0, %r8
	jmp 	L_shake256_A32__A1120$22
L_shake256_A32__A1120$23:
	movq	%rdi, (%rsi,%r8,8)
	incq	%r8
L_shake256_A32__A1120$22:
	cmpq	$25, %r8
	jb  	L_shake256_A32__A1120$23
	movq	%rax, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	$0, %rcx
	movq	$0, %rax
	jmp 	L_shake256_A32__A1120$20
L_shake256_A32__A1120$21:
	movq	(%rdx,%rcx), %rdi
	addq	$8, %rcx
	xorq	%rdi, (%rsi,%rax,8)
	incq	%rax
L_shake256_A32__A1120$20:
	cmpq	$4, %rax
	jb  	L_shake256_A32__A1120$21
	movq	16(%rsp), %rax
	movq	$0, %rcx
	movq	(%rax,%rcx), %rdx
	xorq	%rdx, 32(%rsi)
	addq	$8, %rcx
	movq	$5, %rdx
	jmp 	L_shake256_A32__A1120$18
L_shake256_A32__A1120$19:
	movq	(%rax,%rcx), %rdi
	addq	$8, %rcx
	xorq	%rdi, (%rsi,%rdx,8)
	incq	%rdx
L_shake256_A32__A1120$18:
	cmpq	$17, %rdx
	jb  	L_shake256_A32__A1120$19
	movq	%rax, 16(%rsp)
	movq	%rcx, 24(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1120$17:
	leaq	200(%rsp), %rsp
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	movq	$0, %r8
	jmp 	L_shake256_A32__A1120$12
L_shake256_A32__A1120$13:
	movq	$0, %rdx
	jmp 	L_shake256_A32__A1120$15
L_shake256_A32__A1120$16:
	movq	(%rax,%rcx), %rdi
	addq	$8, %rcx
	xorq	%rdi, (%rsi,%rdx,8)
	incq	%rdx
L_shake256_A32__A1120$15:
	cmpq	$17, %rdx
	jb  	L_shake256_A32__A1120$16
	movq	%rax, 24(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%r8, 32(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1120$14:
	leaq	200(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	32(%rsp), %r8
	incq	%r8
L_shake256_A32__A1120$12:
	cmpq	$7, %r8
	jb  	L_shake256_A32__A1120$13
	movq	$0, %rdx
	jmp 	L_shake256_A32__A1120$10
L_shake256_A32__A1120$11:
	movq	(%rax,%rcx), %rdi
	addq	$8, %rcx
	xorq	%rdi, (%rsi,%rdx,8)
	incq	%rdx
L_shake256_A32__A1120$10:
	cmpq	$4, %rdx
	jb  	L_shake256_A32__A1120$11
	movq	$0, %rdi
	movq	$31, %rax
	orq 	%rax, %rdi
	xorq	%rdi, (%rsi,%rdx,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	128(%rsi), %rax
	movq	%rax, 128(%rsi)
	movq	8(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdi
	jmp 	L_shake256_A32__A1120$5
L_shake256_A32__A1120$6:
	movq	%rax, 8(%rsp)
	movq	%rcx, 32(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1120$9:
	leaq	200(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	32(%rsp), %rcx
	movq	$0, %rdi
	jmp 	L_shake256_A32__A1120$7
L_shake256_A32__A1120$8:
	movq	(%rsi,%rdi,8), %r9
	movq	%r9, (%rax,%rcx)
	addq	$8, %rcx
	incq	%rdi
L_shake256_A32__A1120$7:
	cmpq	$17, %rdi
	jb  	L_shake256_A32__A1120$8
	movq	16(%rsp), %rdi
	incq	%rdi
L_shake256_A32__A1120$5:
	cmpq	$0, %rdi
	jb  	L_shake256_A32__A1120$6
	movq	%rax, 16(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1120$4:
	leaq	200(%rsp), %rsp
	movq	16(%rsp), %rcx
	movq	32(%rsp), %r11
	movq	$0, %rdi
	jmp 	L_shake256_A32__A1120$2
L_shake256_A32__A1120$3:
	movq	(%rsi,%rdi,8), %r9
	movq	%r9, (%rcx,%r11)
	addq	$8, %r11
	incq	%rdi
L_shake256_A32__A1120$2:
	cmpq	$4, %rdi
	jb  	L_shake256_A32__A1120$3
	ret
L_shake256_128_33$1:
	leaq	32(%rsp), %rsi
	movq	$0, %rdx
	movq	$0, %rdi
	jmp 	L_shake256_128_33$12
L_shake256_128_33$13:
	movq	%rdx, (%rsi,%rdi,8)
	incq	%rdi
L_shake256_128_33$12:
	cmpq	$25, %rdi
	jb  	L_shake256_128_33$13
	movq	%rax, 8(%rsp)
	movq	$0, %r11
	movq	$0, %rax
	jmp 	L_shake256_128_33$10
L_shake256_128_33$11:
	movq	(%r10,%r11), %rdx
	addq	$8, %r11
	xorq	%rdx, (%rsi,%rax,8)
	incq	%rax
L_shake256_128_33$10:
	cmpq	$4, %rax
	jb  	L_shake256_128_33$11
	movq	$0, %rdx
	movzbq	(%r10,%r11), %rdi
	orq 	$7936, %rdi
	orq 	%rdi, %rdx
	xorq	%rdx, (%rsi,%rax,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	128(%rsi), %rax
	movq	%rax, 128(%rsi)
	movq	8(%rsp), %rax
	movq	$0, %r11
	movq	$0, %rdi
	jmp 	L_shake256_128_33$5
L_shake256_128_33$6:
	movq	%rax, 8(%rsp)
	movq	%r11, 16(%rsp)
	movq	%rdi, 24(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_128_33$9:
	leaq	200(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %r11
	movq	$0, %rdi
	jmp 	L_shake256_128_33$7
L_shake256_128_33$8:
	movq	(%rsi,%rdi,8), %r9
	movq	%r9, (%rax,%r11)
	addq	$8, %r11
	incq	%rdi
L_shake256_128_33$7:
	cmpq	$17, %rdi
	jb  	L_shake256_128_33$8
	movq	24(%rsp), %rdi
	incq	%rdi
L_shake256_128_33$5:
	cmpq	$0, %rdi
	jb  	L_shake256_128_33$6
	movq	%rax, 24(%rsp)
	movq	%r11, 16(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_128_33$4:
	leaq	200(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	16(%rsp), %r11
	movq	$0, %rdi
	jmp 	L_shake256_128_33$2
L_shake256_128_33$3:
	movq	(%rsi,%rdi,8), %r9
	movq	%r9, (%rax,%r11)
	addq	$8, %r11
	incq	%rdi
L_shake256_128_33$2:
	cmpq	$16, %rdi
	jb  	L_shake256_128_33$3
	ret
L_keccakf1600_ref$1:
	leaq	8(%rsp), %rax
	movq	$0, %rdx
L_keccakf1600_ref$2:
	call	L_pround_ref$1
L_keccakf1600_ref$4:
	xchg	%rsi, %rax
	leaq	glob_data + 0(%rip), %rdi
	movq	(%rdi,%rdx,8), %rdi
	xorq	%rdi, (%rsi)
	call	L_pround_ref$1
L_keccakf1600_ref$3:
	xchg	%rax, %rsi
	leaq	glob_data + 0(%rip), %rdi
	movq	8(%rdi,%rdx,8), %rdi
	xorq	%rdi, (%rsi)
	addq	$2, %rdx
	cmpq	$23, %rdx
	jb  	L_keccakf1600_ref$2
	ret
L_pround_ref$1:
	movq	(%rsi), %r11
	movq	8(%rsi), %r10
	movq	16(%rsi), %rbp
	movq	24(%rsi), %rbx
	movq	32(%rsi), %r12
	xorq	40(%rsi), %r11
	xorq	48(%rsi), %r10
	xorq	56(%rsi), %rbp
	xorq	64(%rsi), %rbx
	xorq	72(%rsi), %r12
	xorq	80(%rsi), %r11
	xorq	88(%rsi), %r10
	xorq	96(%rsi), %rbp
	xorq	104(%rsi), %rbx
	xorq	112(%rsi), %r12
	xorq	120(%rsi), %r11
	xorq	128(%rsi), %r10
	xorq	136(%rsi), %rbp
	xorq	144(%rsi), %rbx
	xorq	152(%rsi), %r12
	xorq	160(%rsi), %r11
	xorq	168(%rsi), %r10
	xorq	176(%rsi), %rbp
	xorq	184(%rsi), %rbx
	xorq	192(%rsi), %r12
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
	movq	(%rsi), %rbx
	xorq	%rdi, %rbx
	movq	48(%rsi), %rbp
	xorq	%r8, %rbp
	rolq	$44, %rbp
	movq	96(%rsi), %r12
	xorq	%r9, %r12
	rolq	$43, %r12
	movq	144(%rsi), %r15
	xorq	%r10, %r15
	rolq	$21, %r15
	movq	192(%rsi), %r13
	xorq	%r11, %r13
	rolq	$14, %r13
	andnq	%r12, %rbp, %r14
	xorq	%rbx, %r14
	movq	%r14, (%rax)
	andnq	%r15, %r12, %r14
	xorq	%rbp, %r14
	movq	%r14, 8(%rax)
	andnq	%r13, %r15, %r14
	xorq	%r12, %r14
	movq	%r14, 16(%rax)
	andnq	%rbx, %r13, %r14
	xorq	%r15, %r14
	movq	%r14, 24(%rax)
	andnq	%rbp, %rbx, %rbx
	xorq	%r13, %rbx
	movq	%rbx, 32(%rax)
	movq	24(%rsi), %rbx
	xorq	%r10, %rbx
	rolq	$28, %rbx
	movq	72(%rsi), %rbp
	xorq	%r11, %rbp
	rolq	$20, %rbp
	movq	80(%rsi), %r12
	xorq	%rdi, %r12
	rolq	$3, %r12
	movq	128(%rsi), %r15
	xorq	%r8, %r15
	rolq	$45, %r15
	movq	176(%rsi), %r13
	xorq	%r9, %r13
	rolq	$61, %r13
	andnq	%r12, %rbp, %r14
	xorq	%rbx, %r14
	movq	%r14, 40(%rax)
	andnq	%r15, %r12, %r14
	xorq	%rbp, %r14
	movq	%r14, 48(%rax)
	andnq	%r13, %r15, %r14
	xorq	%r12, %r14
	movq	%r14, 56(%rax)
	andnq	%rbx, %r13, %r14
	xorq	%r15, %r14
	movq	%r14, 64(%rax)
	andnq	%rbp, %rbx, %rbx
	xorq	%r13, %rbx
	movq	%rbx, 72(%rax)
	movq	8(%rsi), %rbx
	xorq	%r8, %rbx
	rolq	$1, %rbx
	movq	56(%rsi), %rbp
	xorq	%r9, %rbp
	rolq	$6, %rbp
	movq	104(%rsi), %r12
	xorq	%r10, %r12
	rolq	$25, %r12
	movq	152(%rsi), %r15
	xorq	%r11, %r15
	rolq	$8, %r15
	movq	160(%rsi), %r13
	xorq	%rdi, %r13
	rolq	$18, %r13
	andnq	%r12, %rbp, %r14
	xorq	%rbx, %r14
	movq	%r14, 80(%rax)
	andnq	%r15, %r12, %r14
	xorq	%rbp, %r14
	movq	%r14, 88(%rax)
	andnq	%r13, %r15, %r14
	xorq	%r12, %r14
	movq	%r14, 96(%rax)
	andnq	%rbx, %r13, %r14
	xorq	%r15, %r14
	movq	%r14, 104(%rax)
	andnq	%rbp, %rbx, %rbx
	xorq	%r13, %rbx
	movq	%rbx, 112(%rax)
	movq	32(%rsi), %rbx
	xorq	%r11, %rbx
	rolq	$27, %rbx
	movq	40(%rsi), %rbp
	xorq	%rdi, %rbp
	rolq	$36, %rbp
	movq	88(%rsi), %r12
	xorq	%r8, %r12
	rolq	$10, %r12
	movq	136(%rsi), %r15
	xorq	%r9, %r15
	rolq	$15, %r15
	movq	184(%rsi), %r13
	xorq	%r10, %r13
	rolq	$56, %r13
	andnq	%r12, %rbp, %r14
	xorq	%rbx, %r14
	movq	%r14, 120(%rax)
	andnq	%r15, %r12, %r14
	xorq	%rbp, %r14
	movq	%r14, 128(%rax)
	andnq	%r13, %r15, %r14
	xorq	%r12, %r14
	movq	%r14, 136(%rax)
	andnq	%rbx, %r13, %r14
	xorq	%r15, %r14
	movq	%r14, 144(%rax)
	andnq	%rbp, %rbx, %rbx
	xorq	%r13, %rbx
	movq	%rbx, 152(%rax)
	movq	16(%rsi), %rbx
	xorq	%r9, %rbx
	rolq	$62, %rbx
	movq	64(%rsi), %rbp
	xorq	%r10, %rbp
	rolq	$55, %rbp
	movq	112(%rsi), %r12
	xorq	%r11, %r12
	rolq	$39, %r12
	movq	120(%rsi), %r15
	xorq	%rdi, %r15
	rolq	$41, %r15
	movq	168(%rsi), %r13
	xorq	%r8, %r13
	rolq	$2, %r13
	andnq	%r12, %rbp, %r9
	xorq	%rbx, %r9
	movq	%r9, 160(%rax)
	andnq	%r15, %r12, %r9
	xorq	%rbp, %r9
	movq	%r9, 168(%rax)
	andnq	%r13, %r15, %r9
	xorq	%r12, %r9
	movq	%r9, 176(%rax)
	andnq	%rbx, %r13, %r9
	xorq	%r15, %r9
	movq	%r9, 184(%rax)
	andnq	%rbp, %rbx, %r9
	xorq	%r13, %r9
	movq	%r9, 192(%rax)
	ret
	.data
	.p2align	5
_glob_data:
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
