	.att_syntax
	.text
	.p2align	5
	.global	_jade_kem_mlkem_mlkem1024_amd64_ref_dec
	.global	jade_kem_mlkem_mlkem1024_amd64_ref_dec
	.global	_jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand
	.global	jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand
	.global	_jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand
	.global	jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand
_jade_kem_mlkem_mlkem1024_amd64_ref_dec:
jade_kem_mlkem_mlkem1024_amd64_ref_dec:
	movq	%rsp, %rax
	leaq	-28576(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 28520(%rsp)
	movq	%rbp, 28528(%rsp)
	movq	%r12, 28536(%rsp)
	movq	%r13, 28544(%rsp)
	movq	%r14, 28552(%rsp)
	movq	%r15, 28560(%rsp)
	movq	%rax, 28568(%rsp)
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
	movq	1088(%rsi), %rax
	movq	%rax, 1704(%rsp)
	movq	1096(%rsi), %rax
	movq	%rax, 1712(%rsp)
	movq	1104(%rsi), %rax
	movq	%rax, 1720(%rsp)
	movq	1112(%rsi), %rax
	movq	%rax, 1728(%rsp)
	movq	1120(%rsi), %rax
	movq	%rax, 1736(%rsp)
	movq	1128(%rsi), %rax
	movq	%rax, 1744(%rsp)
	movq	1136(%rsi), %rax
	movq	%rax, 1752(%rsp)
	movq	1144(%rsi), %rax
	movq	%rax, 1760(%rsp)
	movq	1152(%rsi), %rax
	movq	%rax, 1768(%rsp)
	movq	1160(%rsi), %rax
	movq	%rax, 1776(%rsp)
	movq	1168(%rsi), %rax
	movq	%rax, 1784(%rsp)
	movq	1176(%rsi), %rax
	movq	%rax, 1792(%rsp)
	movq	1184(%rsi), %rax
	movq	%rax, 1800(%rsp)
	movq	1192(%rsi), %rax
	movq	%rax, 1808(%rsp)
	movq	1200(%rsi), %rax
	movq	%rax, 1816(%rsp)
	movq	1208(%rsi), %rax
	movq	%rax, 1824(%rsp)
	movq	1216(%rsi), %rax
	movq	%rax, 1832(%rsp)
	movq	1224(%rsi), %rax
	movq	%rax, 1840(%rsp)
	movq	1232(%rsi), %rax
	movq	%rax, 1848(%rsp)
	movq	1240(%rsi), %rax
	movq	%rax, 1856(%rsp)
	movq	1248(%rsi), %rax
	movq	%rax, 1864(%rsp)
	movq	1256(%rsi), %rax
	movq	%rax, 1872(%rsp)
	movq	1264(%rsi), %rax
	movq	%rax, 1880(%rsp)
	movq	1272(%rsi), %rax
	movq	%rax, 1888(%rsp)
	movq	1280(%rsi), %rax
	movq	%rax, 1896(%rsp)
	movq	1288(%rsi), %rax
	movq	%rax, 1904(%rsp)
	movq	1296(%rsi), %rax
	movq	%rax, 1912(%rsp)
	movq	1304(%rsi), %rax
	movq	%rax, 1920(%rsp)
	movq	1312(%rsi), %rax
	movq	%rax, 1928(%rsp)
	movq	1320(%rsi), %rax
	movq	%rax, 1936(%rsp)
	movq	1328(%rsi), %rax
	movq	%rax, 1944(%rsp)
	movq	1336(%rsi), %rax
	movq	%rax, 1952(%rsp)
	movq	1344(%rsi), %rax
	movq	%rax, 1960(%rsp)
	movq	1352(%rsi), %rax
	movq	%rax, 1968(%rsp)
	movq	1360(%rsi), %rax
	movq	%rax, 1976(%rsp)
	movq	1368(%rsi), %rax
	movq	%rax, 1984(%rsp)
	movq	1376(%rsi), %rax
	movq	%rax, 1992(%rsp)
	movq	1384(%rsi), %rax
	movq	%rax, 2000(%rsp)
	movq	1392(%rsi), %rax
	movq	%rax, 2008(%rsp)
	movq	1400(%rsi), %rax
	movq	%rax, 2016(%rsp)
	movq	1408(%rsi), %rax
	movq	%rax, 2024(%rsp)
	movq	1416(%rsi), %rax
	movq	%rax, 2032(%rsp)
	movq	1424(%rsi), %rax
	movq	%rax, 2040(%rsp)
	movq	1432(%rsi), %rax
	movq	%rax, 2048(%rsp)
	movq	1440(%rsi), %rax
	movq	%rax, 2056(%rsp)
	movq	1448(%rsi), %rax
	movq	%rax, 2064(%rsp)
	movq	1456(%rsi), %rax
	movq	%rax, 2072(%rsp)
	movq	1464(%rsi), %rax
	movq	%rax, 2080(%rsp)
	movq	1472(%rsi), %rax
	movq	%rax, 2088(%rsp)
	movq	1480(%rsi), %rax
	movq	%rax, 2096(%rsp)
	movq	1488(%rsi), %rax
	movq	%rax, 2104(%rsp)
	movq	1496(%rsi), %rax
	movq	%rax, 2112(%rsp)
	movq	1504(%rsi), %rax
	movq	%rax, 2120(%rsp)
	movq	1512(%rsi), %rax
	movq	%rax, 2128(%rsp)
	movq	1520(%rsi), %rax
	movq	%rax, 2136(%rsp)
	movq	1528(%rsi), %rax
	movq	%rax, 2144(%rsp)
	movq	1536(%rsi), %rax
	movq	%rax, 2152(%rsp)
	movq	1544(%rsi), %rax
	movq	%rax, 2160(%rsp)
	movq	1552(%rsi), %rax
	movq	%rax, 2168(%rsp)
	movq	1560(%rsi), %rax
	movq	%rax, 2176(%rsp)
	movq	(%rdx), %rax
	movq	%rax, 2184(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 2192(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 2200(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 2208(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 2216(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 2224(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 2232(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 2240(%rsp)
	movq	64(%rdx), %rax
	movq	%rax, 2248(%rsp)
	movq	72(%rdx), %rax
	movq	%rax, 2256(%rsp)
	movq	80(%rdx), %rax
	movq	%rax, 2264(%rsp)
	movq	88(%rdx), %rax
	movq	%rax, 2272(%rsp)
	movq	96(%rdx), %rax
	movq	%rax, 2280(%rsp)
	movq	104(%rdx), %rax
	movq	%rax, 2288(%rsp)
	movq	112(%rdx), %rax
	movq	%rax, 2296(%rsp)
	movq	120(%rdx), %rax
	movq	%rax, 2304(%rsp)
	movq	128(%rdx), %rax
	movq	%rax, 2312(%rsp)
	movq	136(%rdx), %rax
	movq	%rax, 2320(%rsp)
	movq	144(%rdx), %rax
	movq	%rax, 2328(%rsp)
	movq	152(%rdx), %rax
	movq	%rax, 2336(%rsp)
	movq	160(%rdx), %rax
	movq	%rax, 2344(%rsp)
	movq	168(%rdx), %rax
	movq	%rax, 2352(%rsp)
	movq	176(%rdx), %rax
	movq	%rax, 2360(%rsp)
	movq	184(%rdx), %rax
	movq	%rax, 2368(%rsp)
	movq	192(%rdx), %rax
	movq	%rax, 2376(%rsp)
	movq	200(%rdx), %rax
	movq	%rax, 2384(%rsp)
	movq	208(%rdx), %rax
	movq	%rax, 2392(%rsp)
	movq	216(%rdx), %rax
	movq	%rax, 2400(%rsp)
	movq	224(%rdx), %rax
	movq	%rax, 2408(%rsp)
	movq	232(%rdx), %rax
	movq	%rax, 2416(%rsp)
	movq	240(%rdx), %rax
	movq	%rax, 2424(%rsp)
	movq	248(%rdx), %rax
	movq	%rax, 2432(%rsp)
	movq	256(%rdx), %rax
	movq	%rax, 2440(%rsp)
	movq	264(%rdx), %rax
	movq	%rax, 2448(%rsp)
	movq	272(%rdx), %rax
	movq	%rax, 2456(%rsp)
	movq	280(%rdx), %rax
	movq	%rax, 2464(%rsp)
	movq	288(%rdx), %rax
	movq	%rax, 2472(%rsp)
	movq	296(%rdx), %rax
	movq	%rax, 2480(%rsp)
	movq	304(%rdx), %rax
	movq	%rax, 2488(%rsp)
	movq	312(%rdx), %rax
	movq	%rax, 2496(%rsp)
	movq	320(%rdx), %rax
	movq	%rax, 2504(%rsp)
	movq	328(%rdx), %rax
	movq	%rax, 2512(%rsp)
	movq	336(%rdx), %rax
	movq	%rax, 2520(%rsp)
	movq	344(%rdx), %rax
	movq	%rax, 2528(%rsp)
	movq	352(%rdx), %rax
	movq	%rax, 2536(%rsp)
	movq	360(%rdx), %rax
	movq	%rax, 2544(%rsp)
	movq	368(%rdx), %rax
	movq	%rax, 2552(%rsp)
	movq	376(%rdx), %rax
	movq	%rax, 2560(%rsp)
	movq	384(%rdx), %rax
	movq	%rax, 2568(%rsp)
	movq	392(%rdx), %rax
	movq	%rax, 2576(%rsp)
	movq	400(%rdx), %rax
	movq	%rax, 2584(%rsp)
	movq	408(%rdx), %rax
	movq	%rax, 2592(%rsp)
	movq	416(%rdx), %rax
	movq	%rax, 2600(%rsp)
	movq	424(%rdx), %rax
	movq	%rax, 2608(%rsp)
	movq	432(%rdx), %rax
	movq	%rax, 2616(%rsp)
	movq	440(%rdx), %rax
	movq	%rax, 2624(%rsp)
	movq	448(%rdx), %rax
	movq	%rax, 2632(%rsp)
	movq	456(%rdx), %rax
	movq	%rax, 2640(%rsp)
	movq	464(%rdx), %rax
	movq	%rax, 2648(%rsp)
	movq	472(%rdx), %rax
	movq	%rax, 2656(%rsp)
	movq	480(%rdx), %rax
	movq	%rax, 2664(%rsp)
	movq	488(%rdx), %rax
	movq	%rax, 2672(%rsp)
	movq	496(%rdx), %rax
	movq	%rax, 2680(%rsp)
	movq	504(%rdx), %rax
	movq	%rax, 2688(%rsp)
	movq	512(%rdx), %rax
	movq	%rax, 2696(%rsp)
	movq	520(%rdx), %rax
	movq	%rax, 2704(%rsp)
	movq	528(%rdx), %rax
	movq	%rax, 2712(%rsp)
	movq	536(%rdx), %rax
	movq	%rax, 2720(%rsp)
	movq	544(%rdx), %rax
	movq	%rax, 2728(%rsp)
	movq	552(%rdx), %rax
	movq	%rax, 2736(%rsp)
	movq	560(%rdx), %rax
	movq	%rax, 2744(%rsp)
	movq	568(%rdx), %rax
	movq	%rax, 2752(%rsp)
	movq	576(%rdx), %rax
	movq	%rax, 2760(%rsp)
	movq	584(%rdx), %rax
	movq	%rax, 2768(%rsp)
	movq	592(%rdx), %rax
	movq	%rax, 2776(%rsp)
	movq	600(%rdx), %rax
	movq	%rax, 2784(%rsp)
	movq	608(%rdx), %rax
	movq	%rax, 2792(%rsp)
	movq	616(%rdx), %rax
	movq	%rax, 2800(%rsp)
	movq	624(%rdx), %rax
	movq	%rax, 2808(%rsp)
	movq	632(%rdx), %rax
	movq	%rax, 2816(%rsp)
	movq	640(%rdx), %rax
	movq	%rax, 2824(%rsp)
	movq	648(%rdx), %rax
	movq	%rax, 2832(%rsp)
	movq	656(%rdx), %rax
	movq	%rax, 2840(%rsp)
	movq	664(%rdx), %rax
	movq	%rax, 2848(%rsp)
	movq	672(%rdx), %rax
	movq	%rax, 2856(%rsp)
	movq	680(%rdx), %rax
	movq	%rax, 2864(%rsp)
	movq	688(%rdx), %rax
	movq	%rax, 2872(%rsp)
	movq	696(%rdx), %rax
	movq	%rax, 2880(%rsp)
	movq	704(%rdx), %rax
	movq	%rax, 2888(%rsp)
	movq	712(%rdx), %rax
	movq	%rax, 2896(%rsp)
	movq	720(%rdx), %rax
	movq	%rax, 2904(%rsp)
	movq	728(%rdx), %rax
	movq	%rax, 2912(%rsp)
	movq	736(%rdx), %rax
	movq	%rax, 2920(%rsp)
	movq	744(%rdx), %rax
	movq	%rax, 2928(%rsp)
	movq	752(%rdx), %rax
	movq	%rax, 2936(%rsp)
	movq	760(%rdx), %rax
	movq	%rax, 2944(%rsp)
	movq	768(%rdx), %rax
	movq	%rax, 2952(%rsp)
	movq	776(%rdx), %rax
	movq	%rax, 2960(%rsp)
	movq	784(%rdx), %rax
	movq	%rax, 2968(%rsp)
	movq	792(%rdx), %rax
	movq	%rax, 2976(%rsp)
	movq	800(%rdx), %rax
	movq	%rax, 2984(%rsp)
	movq	808(%rdx), %rax
	movq	%rax, 2992(%rsp)
	movq	816(%rdx), %rax
	movq	%rax, 3000(%rsp)
	movq	824(%rdx), %rax
	movq	%rax, 3008(%rsp)
	movq	832(%rdx), %rax
	movq	%rax, 3016(%rsp)
	movq	840(%rdx), %rax
	movq	%rax, 3024(%rsp)
	movq	848(%rdx), %rax
	movq	%rax, 3032(%rsp)
	movq	856(%rdx), %rax
	movq	%rax, 3040(%rsp)
	movq	864(%rdx), %rax
	movq	%rax, 3048(%rsp)
	movq	872(%rdx), %rax
	movq	%rax, 3056(%rsp)
	movq	880(%rdx), %rax
	movq	%rax, 3064(%rsp)
	movq	888(%rdx), %rax
	movq	%rax, 3072(%rsp)
	movq	896(%rdx), %rax
	movq	%rax, 3080(%rsp)
	movq	904(%rdx), %rax
	movq	%rax, 3088(%rsp)
	movq	912(%rdx), %rax
	movq	%rax, 3096(%rsp)
	movq	920(%rdx), %rax
	movq	%rax, 3104(%rsp)
	movq	928(%rdx), %rax
	movq	%rax, 3112(%rsp)
	movq	936(%rdx), %rax
	movq	%rax, 3120(%rsp)
	movq	944(%rdx), %rax
	movq	%rax, 3128(%rsp)
	movq	952(%rdx), %rax
	movq	%rax, 3136(%rsp)
	movq	960(%rdx), %rax
	movq	%rax, 3144(%rsp)
	movq	968(%rdx), %rax
	movq	%rax, 3152(%rsp)
	movq	976(%rdx), %rax
	movq	%rax, 3160(%rsp)
	movq	984(%rdx), %rax
	movq	%rax, 3168(%rsp)
	movq	992(%rdx), %rax
	movq	%rax, 3176(%rsp)
	movq	1000(%rdx), %rax
	movq	%rax, 3184(%rsp)
	movq	1008(%rdx), %rax
	movq	%rax, 3192(%rsp)
	movq	1016(%rdx), %rax
	movq	%rax, 3200(%rsp)
	movq	1024(%rdx), %rax
	movq	%rax, 3208(%rsp)
	movq	1032(%rdx), %rax
	movq	%rax, 3216(%rsp)
	movq	1040(%rdx), %rax
	movq	%rax, 3224(%rsp)
	movq	1048(%rdx), %rax
	movq	%rax, 3232(%rsp)
	movq	1056(%rdx), %rax
	movq	%rax, 3240(%rsp)
	movq	1064(%rdx), %rax
	movq	%rax, 3248(%rsp)
	movq	1072(%rdx), %rax
	movq	%rax, 3256(%rsp)
	movq	1080(%rdx), %rax
	movq	%rax, 3264(%rsp)
	movq	1088(%rdx), %rax
	movq	%rax, 3272(%rsp)
	movq	1096(%rdx), %rax
	movq	%rax, 3280(%rsp)
	movq	1104(%rdx), %rax
	movq	%rax, 3288(%rsp)
	movq	1112(%rdx), %rax
	movq	%rax, 3296(%rsp)
	movq	1120(%rdx), %rax
	movq	%rax, 3304(%rsp)
	movq	1128(%rdx), %rax
	movq	%rax, 3312(%rsp)
	movq	1136(%rdx), %rax
	movq	%rax, 3320(%rsp)
	movq	1144(%rdx), %rax
	movq	%rax, 3328(%rsp)
	movq	1152(%rdx), %rax
	movq	%rax, 3336(%rsp)
	movq	1160(%rdx), %rax
	movq	%rax, 3344(%rsp)
	movq	1168(%rdx), %rax
	movq	%rax, 3352(%rsp)
	movq	1176(%rdx), %rax
	movq	%rax, 3360(%rsp)
	movq	1184(%rdx), %rax
	movq	%rax, 3368(%rsp)
	movq	1192(%rdx), %rax
	movq	%rax, 3376(%rsp)
	movq	1200(%rdx), %rax
	movq	%rax, 3384(%rsp)
	movq	1208(%rdx), %rax
	movq	%rax, 3392(%rsp)
	movq	1216(%rdx), %rax
	movq	%rax, 3400(%rsp)
	movq	1224(%rdx), %rax
	movq	%rax, 3408(%rsp)
	movq	1232(%rdx), %rax
	movq	%rax, 3416(%rsp)
	movq	1240(%rdx), %rax
	movq	%rax, 3424(%rsp)
	movq	1248(%rdx), %rax
	movq	%rax, 3432(%rsp)
	movq	1256(%rdx), %rax
	movq	%rax, 3440(%rsp)
	movq	1264(%rdx), %rax
	movq	%rax, 3448(%rsp)
	movq	1272(%rdx), %rax
	movq	%rax, 3456(%rsp)
	movq	1280(%rdx), %rax
	movq	%rax, 3464(%rsp)
	movq	1288(%rdx), %rax
	movq	%rax, 3472(%rsp)
	movq	1296(%rdx), %rax
	movq	%rax, 3480(%rsp)
	movq	1304(%rdx), %rax
	movq	%rax, 3488(%rsp)
	movq	1312(%rdx), %rax
	movq	%rax, 3496(%rsp)
	movq	1320(%rdx), %rax
	movq	%rax, 3504(%rsp)
	movq	1328(%rdx), %rax
	movq	%rax, 3512(%rsp)
	movq	1336(%rdx), %rax
	movq	%rax, 3520(%rsp)
	movq	1344(%rdx), %rax
	movq	%rax, 3528(%rsp)
	movq	1352(%rdx), %rax
	movq	%rax, 3536(%rsp)
	movq	1360(%rdx), %rax
	movq	%rax, 3544(%rsp)
	movq	1368(%rdx), %rax
	movq	%rax, 3552(%rsp)
	movq	1376(%rdx), %rax
	movq	%rax, 3560(%rsp)
	movq	1384(%rdx), %rax
	movq	%rax, 3568(%rsp)
	movq	1392(%rdx), %rax
	movq	%rax, 3576(%rsp)
	movq	1400(%rdx), %rax
	movq	%rax, 3584(%rsp)
	movq	1408(%rdx), %rax
	movq	%rax, 3592(%rsp)
	movq	1416(%rdx), %rax
	movq	%rax, 3600(%rsp)
	movq	1424(%rdx), %rax
	movq	%rax, 3608(%rsp)
	movq	1432(%rdx), %rax
	movq	%rax, 3616(%rsp)
	movq	1440(%rdx), %rax
	movq	%rax, 3624(%rsp)
	movq	1448(%rdx), %rax
	movq	%rax, 3632(%rsp)
	movq	1456(%rdx), %rax
	movq	%rax, 3640(%rsp)
	movq	1464(%rdx), %rax
	movq	%rax, 3648(%rsp)
	movq	1472(%rdx), %rax
	movq	%rax, 3656(%rsp)
	movq	1480(%rdx), %rax
	movq	%rax, 3664(%rsp)
	movq	1488(%rdx), %rax
	movq	%rax, 3672(%rsp)
	movq	1496(%rdx), %rax
	movq	%rax, 3680(%rsp)
	movq	1504(%rdx), %rax
	movq	%rax, 3688(%rsp)
	movq	1512(%rdx), %rax
	movq	%rax, 3696(%rsp)
	movq	1520(%rdx), %rax
	movq	%rax, 3704(%rsp)
	movq	1528(%rdx), %rax
	movq	%rax, 3712(%rsp)
	movq	1536(%rdx), %rax
	movq	%rax, 3720(%rsp)
	movq	1544(%rdx), %rax
	movq	%rax, 3728(%rsp)
	movq	1552(%rdx), %rax
	movq	%rax, 3736(%rsp)
	movq	1560(%rdx), %rax
	movq	%rax, 3744(%rsp)
	movq	1568(%rdx), %rax
	movq	%rax, 3752(%rsp)
	movq	1576(%rdx), %rax
	movq	%rax, 3760(%rsp)
	movq	1584(%rdx), %rax
	movq	%rax, 3768(%rsp)
	movq	1592(%rdx), %rax
	movq	%rax, 3776(%rsp)
	movq	1600(%rdx), %rax
	movq	%rax, 3784(%rsp)
	movq	1608(%rdx), %rax
	movq	%rax, 3792(%rsp)
	movq	1616(%rdx), %rax
	movq	%rax, 3800(%rsp)
	movq	1624(%rdx), %rax
	movq	%rax, 3808(%rsp)
	movq	1632(%rdx), %rax
	movq	%rax, 3816(%rsp)
	movq	1640(%rdx), %rax
	movq	%rax, 3824(%rsp)
	movq	1648(%rdx), %rax
	movq	%rax, 3832(%rsp)
	movq	1656(%rdx), %rax
	movq	%rax, 3840(%rsp)
	movq	1664(%rdx), %rax
	movq	%rax, 3848(%rsp)
	movq	1672(%rdx), %rax
	movq	%rax, 3856(%rsp)
	movq	1680(%rdx), %rax
	movq	%rax, 3864(%rsp)
	movq	1688(%rdx), %rax
	movq	%rax, 3872(%rsp)
	movq	1696(%rdx), %rax
	movq	%rax, 3880(%rsp)
	movq	1704(%rdx), %rax
	movq	%rax, 3888(%rsp)
	movq	1712(%rdx), %rax
	movq	%rax, 3896(%rsp)
	movq	1720(%rdx), %rax
	movq	%rax, 3904(%rsp)
	movq	1728(%rdx), %rax
	movq	%rax, 3912(%rsp)
	movq	1736(%rdx), %rax
	movq	%rax, 3920(%rsp)
	movq	1744(%rdx), %rax
	movq	%rax, 3928(%rsp)
	movq	1752(%rdx), %rax
	movq	%rax, 3936(%rsp)
	movq	1760(%rdx), %rax
	movq	%rax, 3944(%rsp)
	movq	1768(%rdx), %rax
	movq	%rax, 3952(%rsp)
	movq	1776(%rdx), %rax
	movq	%rax, 3960(%rsp)
	movq	1784(%rdx), %rax
	movq	%rax, 3968(%rsp)
	movq	1792(%rdx), %rax
	movq	%rax, 3976(%rsp)
	movq	1800(%rdx), %rax
	movq	%rax, 3984(%rsp)
	movq	1808(%rdx), %rax
	movq	%rax, 3992(%rsp)
	movq	1816(%rdx), %rax
	movq	%rax, 4000(%rsp)
	movq	1824(%rdx), %rax
	movq	%rax, 4008(%rsp)
	movq	1832(%rdx), %rax
	movq	%rax, 4016(%rsp)
	movq	1840(%rdx), %rax
	movq	%rax, 4024(%rsp)
	movq	1848(%rdx), %rax
	movq	%rax, 4032(%rsp)
	movq	1856(%rdx), %rax
	movq	%rax, 4040(%rsp)
	movq	1864(%rdx), %rax
	movq	%rax, 4048(%rsp)
	movq	1872(%rdx), %rax
	movq	%rax, 4056(%rsp)
	movq	1880(%rdx), %rax
	movq	%rax, 4064(%rsp)
	movq	1888(%rdx), %rax
	movq	%rax, 4072(%rsp)
	movq	1896(%rdx), %rax
	movq	%rax, 4080(%rsp)
	movq	1904(%rdx), %rax
	movq	%rax, 4088(%rsp)
	movq	1912(%rdx), %rax
	movq	%rax, 4096(%rsp)
	movq	1920(%rdx), %rax
	movq	%rax, 4104(%rsp)
	movq	1928(%rdx), %rax
	movq	%rax, 4112(%rsp)
	movq	1936(%rdx), %rax
	movq	%rax, 4120(%rsp)
	movq	1944(%rdx), %rax
	movq	%rax, 4128(%rsp)
	movq	1952(%rdx), %rax
	movq	%rax, 4136(%rsp)
	movq	1960(%rdx), %rax
	movq	%rax, 4144(%rsp)
	movq	1968(%rdx), %rax
	movq	%rax, 4152(%rsp)
	movq	1976(%rdx), %rax
	movq	%rax, 4160(%rsp)
	movq	1984(%rdx), %rax
	movq	%rax, 4168(%rsp)
	movq	1992(%rdx), %rax
	movq	%rax, 4176(%rsp)
	movq	2000(%rdx), %rax
	movq	%rax, 4184(%rsp)
	movq	2008(%rdx), %rax
	movq	%rax, 4192(%rsp)
	movq	2016(%rdx), %rax
	movq	%rax, 4200(%rsp)
	movq	2024(%rdx), %rax
	movq	%rax, 4208(%rsp)
	movq	2032(%rdx), %rax
	movq	%rax, 4216(%rsp)
	movq	2040(%rdx), %rax
	movq	%rax, 4224(%rsp)
	movq	2048(%rdx), %rax
	movq	%rax, 4232(%rsp)
	movq	2056(%rdx), %rax
	movq	%rax, 4240(%rsp)
	movq	2064(%rdx), %rax
	movq	%rax, 4248(%rsp)
	movq	2072(%rdx), %rax
	movq	%rax, 4256(%rsp)
	movq	2080(%rdx), %rax
	movq	%rax, 4264(%rsp)
	movq	2088(%rdx), %rax
	movq	%rax, 4272(%rsp)
	movq	2096(%rdx), %rax
	movq	%rax, 4280(%rsp)
	movq	2104(%rdx), %rax
	movq	%rax, 4288(%rsp)
	movq	2112(%rdx), %rax
	movq	%rax, 4296(%rsp)
	movq	2120(%rdx), %rax
	movq	%rax, 4304(%rsp)
	movq	2128(%rdx), %rax
	movq	%rax, 4312(%rsp)
	movq	2136(%rdx), %rax
	movq	%rax, 4320(%rsp)
	movq	2144(%rdx), %rax
	movq	%rax, 4328(%rsp)
	movq	2152(%rdx), %rax
	movq	%rax, 4336(%rsp)
	movq	2160(%rdx), %rax
	movq	%rax, 4344(%rsp)
	movq	2168(%rdx), %rax
	movq	%rax, 4352(%rsp)
	movq	2176(%rdx), %rax
	movq	%rax, 4360(%rsp)
	movq	2184(%rdx), %rax
	movq	%rax, 4368(%rsp)
	movq	2192(%rdx), %rax
	movq	%rax, 4376(%rsp)
	movq	2200(%rdx), %rax
	movq	%rax, 4384(%rsp)
	movq	2208(%rdx), %rax
	movq	%rax, 4392(%rsp)
	movq	2216(%rdx), %rax
	movq	%rax, 4400(%rsp)
	movq	2224(%rdx), %rax
	movq	%rax, 4408(%rsp)
	movq	2232(%rdx), %rax
	movq	%rax, 4416(%rsp)
	movq	2240(%rdx), %rax
	movq	%rax, 4424(%rsp)
	movq	2248(%rdx), %rax
	movq	%rax, 4432(%rsp)
	movq	2256(%rdx), %rax
	movq	%rax, 4440(%rsp)
	movq	2264(%rdx), %rax
	movq	%rax, 4448(%rsp)
	movq	2272(%rdx), %rax
	movq	%rax, 4456(%rsp)
	movq	2280(%rdx), %rax
	movq	%rax, 4464(%rsp)
	movq	2288(%rdx), %rax
	movq	%rax, 4472(%rsp)
	movq	2296(%rdx), %rax
	movq	%rax, 4480(%rsp)
	movq	2304(%rdx), %rax
	movq	%rax, 4488(%rsp)
	movq	2312(%rdx), %rax
	movq	%rax, 4496(%rsp)
	movq	2320(%rdx), %rax
	movq	%rax, 4504(%rsp)
	movq	2328(%rdx), %rax
	movq	%rax, 4512(%rsp)
	movq	2336(%rdx), %rax
	movq	%rax, 4520(%rsp)
	movq	2344(%rdx), %rax
	movq	%rax, 4528(%rsp)
	movq	2352(%rdx), %rax
	movq	%rax, 4536(%rsp)
	movq	2360(%rdx), %rax
	movq	%rax, 4544(%rsp)
	movq	2368(%rdx), %rax
	movq	%rax, 4552(%rsp)
	movq	2376(%rdx), %rax
	movq	%rax, 4560(%rsp)
	movq	2384(%rdx), %rax
	movq	%rax, 4568(%rsp)
	movq	2392(%rdx), %rax
	movq	%rax, 4576(%rsp)
	movq	2400(%rdx), %rax
	movq	%rax, 4584(%rsp)
	movq	2408(%rdx), %rax
	movq	%rax, 4592(%rsp)
	movq	2416(%rdx), %rax
	movq	%rax, 4600(%rsp)
	movq	2424(%rdx), %rax
	movq	%rax, 4608(%rsp)
	movq	2432(%rdx), %rax
	movq	%rax, 4616(%rsp)
	movq	2440(%rdx), %rax
	movq	%rax, 4624(%rsp)
	movq	2448(%rdx), %rax
	movq	%rax, 4632(%rsp)
	movq	2456(%rdx), %rax
	movq	%rax, 4640(%rsp)
	movq	2464(%rdx), %rax
	movq	%rax, 4648(%rsp)
	movq	2472(%rdx), %rax
	movq	%rax, 4656(%rsp)
	movq	2480(%rdx), %rax
	movq	%rax, 4664(%rsp)
	movq	2488(%rdx), %rax
	movq	%rax, 4672(%rsp)
	movq	2496(%rdx), %rax
	movq	%rax, 4680(%rsp)
	movq	2504(%rdx), %rax
	movq	%rax, 4688(%rsp)
	movq	2512(%rdx), %rax
	movq	%rax, 4696(%rsp)
	movq	2520(%rdx), %rax
	movq	%rax, 4704(%rsp)
	movq	2528(%rdx), %rax
	movq	%rax, 4712(%rsp)
	movq	2536(%rdx), %rax
	movq	%rax, 4720(%rsp)
	movq	2544(%rdx), %rax
	movq	%rax, 4728(%rsp)
	movq	2552(%rdx), %rax
	movq	%rax, 4736(%rsp)
	movq	2560(%rdx), %rax
	movq	%rax, 4744(%rsp)
	movq	2568(%rdx), %rax
	movq	%rax, 4752(%rsp)
	movq	2576(%rdx), %rax
	movq	%rax, 4760(%rsp)
	movq	2584(%rdx), %rax
	movq	%rax, 4768(%rsp)
	movq	2592(%rdx), %rax
	movq	%rax, 4776(%rsp)
	movq	2600(%rdx), %rax
	movq	%rax, 4784(%rsp)
	movq	2608(%rdx), %rax
	movq	%rax, 4792(%rsp)
	movq	2616(%rdx), %rax
	movq	%rax, 4800(%rsp)
	movq	2624(%rdx), %rax
	movq	%rax, 4808(%rsp)
	movq	2632(%rdx), %rax
	movq	%rax, 4816(%rsp)
	movq	2640(%rdx), %rax
	movq	%rax, 4824(%rsp)
	movq	2648(%rdx), %rax
	movq	%rax, 4832(%rsp)
	movq	2656(%rdx), %rax
	movq	%rax, 4840(%rsp)
	movq	2664(%rdx), %rax
	movq	%rax, 4848(%rsp)
	movq	2672(%rdx), %rax
	movq	%rax, 4856(%rsp)
	movq	2680(%rdx), %rax
	movq	%rax, 4864(%rsp)
	movq	2688(%rdx), %rax
	movq	%rax, 4872(%rsp)
	movq	2696(%rdx), %rax
	movq	%rax, 4880(%rsp)
	movq	2704(%rdx), %rax
	movq	%rax, 4888(%rsp)
	movq	2712(%rdx), %rax
	movq	%rax, 4896(%rsp)
	movq	2720(%rdx), %rax
	movq	%rax, 4904(%rsp)
	movq	2728(%rdx), %rax
	movq	%rax, 4912(%rsp)
	movq	2736(%rdx), %rax
	movq	%rax, 4920(%rsp)
	movq	2744(%rdx), %rax
	movq	%rax, 4928(%rsp)
	movq	2752(%rdx), %rax
	movq	%rax, 4936(%rsp)
	movq	2760(%rdx), %rax
	movq	%rax, 4944(%rsp)
	movq	2768(%rdx), %rax
	movq	%rax, 4952(%rsp)
	movq	2776(%rdx), %rax
	movq	%rax, 4960(%rsp)
	movq	2784(%rdx), %rax
	movq	%rax, 4968(%rsp)
	movq	2792(%rdx), %rax
	movq	%rax, 4976(%rsp)
	movq	2800(%rdx), %rax
	movq	%rax, 4984(%rsp)
	movq	2808(%rdx), %rax
	movq	%rax, 4992(%rsp)
	movq	2816(%rdx), %rax
	movq	%rax, 5000(%rsp)
	movq	2824(%rdx), %rax
	movq	%rax, 5008(%rsp)
	movq	2832(%rdx), %rax
	movq	%rax, 5016(%rsp)
	movq	2840(%rdx), %rax
	movq	%rax, 5024(%rsp)
	movq	2848(%rdx), %rax
	movq	%rax, 5032(%rsp)
	movq	2856(%rdx), %rax
	movq	%rax, 5040(%rsp)
	movq	2864(%rdx), %rax
	movq	%rax, 5048(%rsp)
	movq	2872(%rdx), %rax
	movq	%rax, 5056(%rsp)
	movq	2880(%rdx), %rax
	movq	%rax, 5064(%rsp)
	movq	2888(%rdx), %rax
	movq	%rax, 5072(%rsp)
	movq	2896(%rdx), %rax
	movq	%rax, 5080(%rsp)
	movq	2904(%rdx), %rax
	movq	%rax, 5088(%rsp)
	movq	2912(%rdx), %rax
	movq	%rax, 5096(%rsp)
	movq	2920(%rdx), %rax
	movq	%rax, 5104(%rsp)
	movq	2928(%rdx), %rax
	movq	%rax, 5112(%rsp)
	movq	2936(%rdx), %rax
	movq	%rax, 5120(%rsp)
	movq	2944(%rdx), %rax
	movq	%rax, 5128(%rsp)
	movq	2952(%rdx), %rax
	movq	%rax, 5136(%rsp)
	movq	2960(%rdx), %rax
	movq	%rax, 5144(%rsp)
	movq	2968(%rdx), %rax
	movq	%rax, 5152(%rsp)
	movq	2976(%rdx), %rax
	movq	%rax, 5160(%rsp)
	movq	2984(%rdx), %rax
	movq	%rax, 5168(%rsp)
	movq	2992(%rdx), %rax
	movq	%rax, 5176(%rsp)
	movq	3000(%rdx), %rax
	movq	%rax, 5184(%rsp)
	movq	3008(%rdx), %rax
	movq	%rax, 5192(%rsp)
	movq	3016(%rdx), %rax
	movq	%rax, 5200(%rsp)
	movq	3024(%rdx), %rax
	movq	%rax, 5208(%rsp)
	movq	3032(%rdx), %rax
	movq	%rax, 5216(%rsp)
	movq	3040(%rdx), %rax
	movq	%rax, 5224(%rsp)
	movq	3048(%rdx), %rax
	movq	%rax, 5232(%rsp)
	movq	3056(%rdx), %rax
	movq	%rax, 5240(%rsp)
	movq	3064(%rdx), %rax
	movq	%rax, 5248(%rsp)
	movq	3072(%rdx), %rax
	movq	%rax, 5256(%rsp)
	movq	3080(%rdx), %rax
	movq	%rax, 5264(%rsp)
	movq	3088(%rdx), %rax
	movq	%rax, 5272(%rsp)
	movq	3096(%rdx), %rax
	movq	%rax, 5280(%rsp)
	movq	3104(%rdx), %rax
	movq	%rax, 5288(%rsp)
	movq	3112(%rdx), %rax
	movq	%rax, 5296(%rsp)
	movq	3120(%rdx), %rax
	movq	%rax, 5304(%rsp)
	movq	3128(%rdx), %rax
	movq	%rax, 5312(%rsp)
	movq	3136(%rdx), %rax
	movq	%rax, 5320(%rsp)
	movq	3144(%rdx), %rax
	movq	%rax, 5328(%rsp)
	movq	3152(%rdx), %rax
	movq	%rax, 5336(%rsp)
	movq	3160(%rdx), %rax
	movq	%rax, 5344(%rsp)
	leaq	616(%rsp), %rsi
	leaq	16(%rsp), %rcx
	leaq	2184(%rsp), %rax
	movq	%rcx, (%rsp)
	movq	%rsi, 8(%rsp)
	movq	(%rax), %rcx
	movq	%rcx, 5352(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 5360(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 5368(%rsp)
	movq	24(%rax), %rcx
	movq	%rcx, 5376(%rsp)
	movq	32(%rax), %rcx
	movq	%rcx, 5384(%rsp)
	movq	40(%rax), %rcx
	movq	%rcx, 5392(%rsp)
	movq	48(%rax), %rcx
	movq	%rcx, 5400(%rsp)
	movq	56(%rax), %rcx
	movq	%rcx, 5408(%rsp)
	movq	64(%rax), %rcx
	movq	%rcx, 5416(%rsp)
	movq	72(%rax), %rcx
	movq	%rcx, 5424(%rsp)
	movq	80(%rax), %rcx
	movq	%rcx, 5432(%rsp)
	movq	88(%rax), %rcx
	movq	%rcx, 5440(%rsp)
	movq	96(%rax), %rcx
	movq	%rcx, 5448(%rsp)
	movq	104(%rax), %rcx
	movq	%rcx, 5456(%rsp)
	movq	112(%rax), %rcx
	movq	%rcx, 5464(%rsp)
	movq	120(%rax), %rcx
	movq	%rcx, 5472(%rsp)
	movq	128(%rax), %rcx
	movq	%rcx, 5480(%rsp)
	movq	136(%rax), %rcx
	movq	%rcx, 5488(%rsp)
	movq	144(%rax), %rcx
	movq	%rcx, 5496(%rsp)
	movq	152(%rax), %rcx
	movq	%rcx, 5504(%rsp)
	movq	160(%rax), %rcx
	movq	%rcx, 5512(%rsp)
	movq	168(%rax), %rcx
	movq	%rcx, 5520(%rsp)
	movq	176(%rax), %rcx
	movq	%rcx, 5528(%rsp)
	movq	184(%rax), %rcx
	movq	%rcx, 5536(%rsp)
	movq	192(%rax), %rcx
	movq	%rcx, 5544(%rsp)
	movq	200(%rax), %rcx
	movq	%rcx, 5552(%rsp)
	movq	208(%rax), %rcx
	movq	%rcx, 5560(%rsp)
	movq	216(%rax), %rcx
	movq	%rcx, 5568(%rsp)
	movq	224(%rax), %rcx
	movq	%rcx, 5576(%rsp)
	movq	232(%rax), %rcx
	movq	%rcx, 5584(%rsp)
	movq	240(%rax), %rcx
	movq	%rcx, 5592(%rsp)
	movq	248(%rax), %rcx
	movq	%rcx, 5600(%rsp)
	movq	256(%rax), %rcx
	movq	%rcx, 5608(%rsp)
	movq	264(%rax), %rcx
	movq	%rcx, 5616(%rsp)
	movq	272(%rax), %rcx
	movq	%rcx, 5624(%rsp)
	movq	280(%rax), %rcx
	movq	%rcx, 5632(%rsp)
	movq	288(%rax), %rcx
	movq	%rcx, 5640(%rsp)
	movq	296(%rax), %rcx
	movq	%rcx, 5648(%rsp)
	movq	304(%rax), %rcx
	movq	%rcx, 5656(%rsp)
	movq	312(%rax), %rcx
	movq	%rcx, 5664(%rsp)
	movq	320(%rax), %rcx
	movq	%rcx, 5672(%rsp)
	movq	328(%rax), %rcx
	movq	%rcx, 5680(%rsp)
	movq	336(%rax), %rcx
	movq	%rcx, 5688(%rsp)
	movq	344(%rax), %rcx
	movq	%rcx, 5696(%rsp)
	movq	352(%rax), %rcx
	movq	%rcx, 5704(%rsp)
	movq	360(%rax), %rcx
	movq	%rcx, 5712(%rsp)
	movq	368(%rax), %rcx
	movq	%rcx, 5720(%rsp)
	movq	376(%rax), %rcx
	movq	%rcx, 5728(%rsp)
	movq	384(%rax), %rcx
	movq	%rcx, 5736(%rsp)
	movq	392(%rax), %rcx
	movq	%rcx, 5744(%rsp)
	movq	400(%rax), %rcx
	movq	%rcx, 5752(%rsp)
	movq	408(%rax), %rcx
	movq	%rcx, 5760(%rsp)
	movq	416(%rax), %rcx
	movq	%rcx, 5768(%rsp)
	movq	424(%rax), %rcx
	movq	%rcx, 5776(%rsp)
	movq	432(%rax), %rcx
	movq	%rcx, 5784(%rsp)
	movq	440(%rax), %rcx
	movq	%rcx, 5792(%rsp)
	movq	448(%rax), %rcx
	movq	%rcx, 5800(%rsp)
	movq	456(%rax), %rcx
	movq	%rcx, 5808(%rsp)
	movq	464(%rax), %rcx
	movq	%rcx, 5816(%rsp)
	movq	472(%rax), %rcx
	movq	%rcx, 5824(%rsp)
	movq	480(%rax), %rcx
	movq	%rcx, 5832(%rsp)
	movq	488(%rax), %rcx
	movq	%rcx, 5840(%rsp)
	movq	496(%rax), %rcx
	movq	%rcx, 5848(%rsp)
	movq	504(%rax), %rcx
	movq	%rcx, 5856(%rsp)
	movq	512(%rax), %rcx
	movq	%rcx, 5864(%rsp)
	movq	520(%rax), %rcx
	movq	%rcx, 5872(%rsp)
	movq	528(%rax), %rcx
	movq	%rcx, 5880(%rsp)
	movq	536(%rax), %rcx
	movq	%rcx, 5888(%rsp)
	movq	544(%rax), %rcx
	movq	%rcx, 5896(%rsp)
	movq	552(%rax), %rcx
	movq	%rcx, 5904(%rsp)
	movq	560(%rax), %rcx
	movq	%rcx, 5912(%rsp)
	movq	568(%rax), %rcx
	movq	%rcx, 5920(%rsp)
	movq	576(%rax), %rcx
	movq	%rcx, 5928(%rsp)
	movq	584(%rax), %rcx
	movq	%rcx, 5936(%rsp)
	movq	592(%rax), %rcx
	movq	%rcx, 5944(%rsp)
	movq	600(%rax), %rcx
	movq	%rcx, 5952(%rsp)
	movq	608(%rax), %rcx
	movq	%rcx, 5960(%rsp)
	movq	616(%rax), %rcx
	movq	%rcx, 5968(%rsp)
	movq	624(%rax), %rcx
	movq	%rcx, 5976(%rsp)
	movq	632(%rax), %rcx
	movq	%rcx, 5984(%rsp)
	movq	640(%rax), %rcx
	movq	%rcx, 5992(%rsp)
	movq	648(%rax), %rcx
	movq	%rcx, 6000(%rsp)
	movq	656(%rax), %rcx
	movq	%rcx, 6008(%rsp)
	movq	664(%rax), %rcx
	movq	%rcx, 6016(%rsp)
	movq	672(%rax), %rcx
	movq	%rcx, 6024(%rsp)
	movq	680(%rax), %rcx
	movq	%rcx, 6032(%rsp)
	movq	688(%rax), %rcx
	movq	%rcx, 6040(%rsp)
	movq	696(%rax), %rcx
	movq	%rcx, 6048(%rsp)
	movq	704(%rax), %rcx
	movq	%rcx, 6056(%rsp)
	movq	712(%rax), %rcx
	movq	%rcx, 6064(%rsp)
	movq	720(%rax), %rcx
	movq	%rcx, 6072(%rsp)
	movq	728(%rax), %rcx
	movq	%rcx, 6080(%rsp)
	movq	736(%rax), %rcx
	movq	%rcx, 6088(%rsp)
	movq	744(%rax), %rcx
	movq	%rcx, 6096(%rsp)
	movq	752(%rax), %rcx
	movq	%rcx, 6104(%rsp)
	movq	760(%rax), %rcx
	movq	%rcx, 6112(%rsp)
	movq	768(%rax), %rcx
	movq	%rcx, 6120(%rsp)
	movq	776(%rax), %rcx
	movq	%rcx, 6128(%rsp)
	movq	784(%rax), %rcx
	movq	%rcx, 6136(%rsp)
	movq	792(%rax), %rcx
	movq	%rcx, 6144(%rsp)
	movq	800(%rax), %rcx
	movq	%rcx, 6152(%rsp)
	movq	808(%rax), %rcx
	movq	%rcx, 6160(%rsp)
	movq	816(%rax), %rcx
	movq	%rcx, 6168(%rsp)
	movq	824(%rax), %rcx
	movq	%rcx, 6176(%rsp)
	movq	832(%rax), %rcx
	movq	%rcx, 6184(%rsp)
	movq	840(%rax), %rcx
	movq	%rcx, 6192(%rsp)
	movq	848(%rax), %rcx
	movq	%rcx, 6200(%rsp)
	movq	856(%rax), %rcx
	movq	%rcx, 6208(%rsp)
	movq	864(%rax), %rcx
	movq	%rcx, 6216(%rsp)
	movq	872(%rax), %rcx
	movq	%rcx, 6224(%rsp)
	movq	880(%rax), %rcx
	movq	%rcx, 6232(%rsp)
	movq	888(%rax), %rcx
	movq	%rcx, 6240(%rsp)
	movq	896(%rax), %rcx
	movq	%rcx, 6248(%rsp)
	movq	904(%rax), %rcx
	movq	%rcx, 6256(%rsp)
	movq	912(%rax), %rcx
	movq	%rcx, 6264(%rsp)
	movq	920(%rax), %rcx
	movq	%rcx, 6272(%rsp)
	movq	928(%rax), %rcx
	movq	%rcx, 6280(%rsp)
	movq	936(%rax), %rcx
	movq	%rcx, 6288(%rsp)
	movq	944(%rax), %rcx
	movq	%rcx, 6296(%rsp)
	movq	952(%rax), %rcx
	movq	%rcx, 6304(%rsp)
	movq	960(%rax), %rcx
	movq	%rcx, 6312(%rsp)
	movq	968(%rax), %rcx
	movq	%rcx, 6320(%rsp)
	movq	976(%rax), %rcx
	movq	%rcx, 6328(%rsp)
	movq	984(%rax), %rcx
	movq	%rcx, 6336(%rsp)
	movq	992(%rax), %rcx
	movq	%rcx, 6344(%rsp)
	movq	1000(%rax), %rcx
	movq	%rcx, 6352(%rsp)
	movq	1008(%rax), %rcx
	movq	%rcx, 6360(%rsp)
	movq	1016(%rax), %rcx
	movq	%rcx, 6368(%rsp)
	movq	1024(%rax), %rcx
	movq	%rcx, 6376(%rsp)
	movq	1032(%rax), %rcx
	movq	%rcx, 6384(%rsp)
	movq	1040(%rax), %rcx
	movq	%rcx, 6392(%rsp)
	movq	1048(%rax), %rcx
	movq	%rcx, 6400(%rsp)
	movq	1056(%rax), %rcx
	movq	%rcx, 6408(%rsp)
	movq	1064(%rax), %rcx
	movq	%rcx, 6416(%rsp)
	movq	1072(%rax), %rcx
	movq	%rcx, 6424(%rsp)
	movq	1080(%rax), %rcx
	movq	%rcx, 6432(%rsp)
	movq	1088(%rax), %rcx
	movq	%rcx, 6440(%rsp)
	movq	1096(%rax), %rcx
	movq	%rcx, 6448(%rsp)
	movq	1104(%rax), %rcx
	movq	%rcx, 6456(%rsp)
	movq	1112(%rax), %rcx
	movq	%rcx, 6464(%rsp)
	movq	1120(%rax), %rcx
	movq	%rcx, 6472(%rsp)
	movq	1128(%rax), %rcx
	movq	%rcx, 6480(%rsp)
	movq	1136(%rax), %rcx
	movq	%rcx, 6488(%rsp)
	movq	1144(%rax), %rcx
	movq	%rcx, 6496(%rsp)
	movq	1152(%rax), %rcx
	movq	%rcx, 6504(%rsp)
	movq	1160(%rax), %rcx
	movq	%rcx, 6512(%rsp)
	movq	1168(%rax), %rcx
	movq	%rcx, 6520(%rsp)
	movq	1176(%rax), %rcx
	movq	%rcx, 6528(%rsp)
	movq	1184(%rax), %rcx
	movq	%rcx, 6536(%rsp)
	movq	1192(%rax), %rcx
	movq	%rcx, 6544(%rsp)
	movq	1200(%rax), %rcx
	movq	%rcx, 6552(%rsp)
	movq	1208(%rax), %rcx
	movq	%rcx, 6560(%rsp)
	movq	1216(%rax), %rcx
	movq	%rcx, 6568(%rsp)
	movq	1224(%rax), %rcx
	movq	%rcx, 6576(%rsp)
	movq	1232(%rax), %rcx
	movq	%rcx, 6584(%rsp)
	movq	1240(%rax), %rcx
	movq	%rcx, 6592(%rsp)
	movq	1248(%rax), %rcx
	movq	%rcx, 6600(%rsp)
	movq	1256(%rax), %rcx
	movq	%rcx, 6608(%rsp)
	movq	1264(%rax), %rcx
	movq	%rcx, 6616(%rsp)
	movq	1272(%rax), %rcx
	movq	%rcx, 6624(%rsp)
	movq	1280(%rax), %rcx
	movq	%rcx, 6632(%rsp)
	movq	1288(%rax), %rcx
	movq	%rcx, 6640(%rsp)
	movq	1296(%rax), %rcx
	movq	%rcx, 6648(%rsp)
	movq	1304(%rax), %rcx
	movq	%rcx, 6656(%rsp)
	movq	1312(%rax), %rcx
	movq	%rcx, 6664(%rsp)
	movq	1320(%rax), %rcx
	movq	%rcx, 6672(%rsp)
	movq	1328(%rax), %rcx
	movq	%rcx, 6680(%rsp)
	movq	1336(%rax), %rcx
	movq	%rcx, 6688(%rsp)
	movq	1344(%rax), %rcx
	movq	%rcx, 6696(%rsp)
	movq	1352(%rax), %rcx
	movq	%rcx, 6704(%rsp)
	movq	1360(%rax), %rcx
	movq	%rcx, 6712(%rsp)
	movq	1368(%rax), %rcx
	movq	%rcx, 6720(%rsp)
	movq	1376(%rax), %rcx
	movq	%rcx, 6728(%rsp)
	movq	1384(%rax), %rcx
	movq	%rcx, 6736(%rsp)
	movq	1392(%rax), %rcx
	movq	%rcx, 6744(%rsp)
	movq	1400(%rax), %rcx
	movq	%rcx, 6752(%rsp)
	movq	1408(%rax), %rcx
	movq	%rcx, 6760(%rsp)
	movq	1416(%rax), %rcx
	movq	%rcx, 6768(%rsp)
	movq	1424(%rax), %rcx
	movq	%rcx, 6776(%rsp)
	movq	1432(%rax), %rcx
	movq	%rcx, 6784(%rsp)
	movq	1440(%rax), %rcx
	movq	%rcx, 6792(%rsp)
	movq	1448(%rax), %rcx
	movq	%rcx, 6800(%rsp)
	movq	1456(%rax), %rcx
	movq	%rcx, 6808(%rsp)
	movq	1464(%rax), %rcx
	movq	%rcx, 6816(%rsp)
	movq	1472(%rax), %rcx
	movq	%rcx, 6824(%rsp)
	movq	1480(%rax), %rcx
	movq	%rcx, 6832(%rsp)
	movq	1488(%rax), %rcx
	movq	%rcx, 6840(%rsp)
	movq	1496(%rax), %rcx
	movq	%rcx, 6848(%rsp)
	movq	1504(%rax), %rcx
	movq	%rcx, 6856(%rsp)
	movq	1512(%rax), %rcx
	movq	%rcx, 6864(%rsp)
	movq	1520(%rax), %rcx
	movq	%rcx, 6872(%rsp)
	movq	1528(%rax), %rcx
	movq	%rcx, 6880(%rsp)
	movq	1536(%rax), %rcx
	movq	%rcx, 6888(%rsp)
	movq	1544(%rax), %rcx
	movq	%rcx, 6896(%rsp)
	movq	1552(%rax), %rcx
	movq	%rcx, 6904(%rsp)
	movq	1560(%rax), %rcx
	movq	%rcx, 6912(%rsp)
	movq	1568(%rax), %rcx
	movq	%rcx, 6920(%rsp)
	movq	1576(%rax), %rcx
	movq	%rcx, 6928(%rsp)
	movq	1584(%rax), %rcx
	movq	%rcx, 6936(%rsp)
	movq	1592(%rax), %rcx
	movq	%rcx, 6944(%rsp)
	movq	1600(%rax), %rcx
	movq	%rcx, 6952(%rsp)
	movq	1608(%rax), %rcx
	movq	%rcx, 6960(%rsp)
	movq	1616(%rax), %rcx
	movq	%rcx, 6968(%rsp)
	movq	1624(%rax), %rcx
	movq	%rcx, 6976(%rsp)
	movq	1632(%rax), %rcx
	movq	%rcx, 6984(%rsp)
	movq	1640(%rax), %rcx
	movq	%rcx, 6992(%rsp)
	movq	1648(%rax), %rcx
	movq	%rcx, 7000(%rsp)
	movq	1656(%rax), %rcx
	movq	%rcx, 7008(%rsp)
	movq	1664(%rax), %rcx
	movq	%rcx, 7016(%rsp)
	movq	1672(%rax), %rcx
	movq	%rcx, 7024(%rsp)
	movq	1680(%rax), %rcx
	movq	%rcx, 7032(%rsp)
	movq	1688(%rax), %rcx
	movq	%rcx, 7040(%rsp)
	movq	1696(%rax), %rcx
	movq	%rcx, 7048(%rsp)
	movq	1704(%rax), %rcx
	movq	%rcx, 7056(%rsp)
	movq	1712(%rax), %rcx
	movq	%rcx, 7064(%rsp)
	movq	1720(%rax), %rcx
	movq	%rcx, 7072(%rsp)
	movq	1728(%rax), %rcx
	movq	%rcx, 7080(%rsp)
	movq	1736(%rax), %rcx
	movq	%rcx, 7088(%rsp)
	movq	1744(%rax), %rcx
	movq	%rcx, 7096(%rsp)
	movq	1752(%rax), %rcx
	movq	%rcx, 7104(%rsp)
	movq	1760(%rax), %rcx
	movq	%rcx, 7112(%rsp)
	movq	1768(%rax), %rcx
	movq	%rcx, 7120(%rsp)
	movq	1776(%rax), %rcx
	movq	%rcx, 7128(%rsp)
	movq	1784(%rax), %rcx
	movq	%rcx, 7136(%rsp)
	movq	1792(%rax), %rcx
	movq	%rcx, 7144(%rsp)
	movq	1800(%rax), %rcx
	movq	%rcx, 7152(%rsp)
	movq	1808(%rax), %rcx
	movq	%rcx, 7160(%rsp)
	movq	1816(%rax), %rcx
	movq	%rcx, 7168(%rsp)
	movq	1824(%rax), %rcx
	movq	%rcx, 7176(%rsp)
	movq	1832(%rax), %rcx
	movq	%rcx, 7184(%rsp)
	movq	1840(%rax), %rcx
	movq	%rcx, 7192(%rsp)
	movq	1848(%rax), %rcx
	movq	%rcx, 7200(%rsp)
	movq	1856(%rax), %rcx
	movq	%rcx, 7208(%rsp)
	movq	1864(%rax), %rcx
	movq	%rcx, 7216(%rsp)
	movq	1872(%rax), %rcx
	movq	%rcx, 7224(%rsp)
	movq	1880(%rax), %rcx
	movq	%rcx, 7232(%rsp)
	movq	1888(%rax), %rcx
	movq	%rcx, 7240(%rsp)
	movq	1896(%rax), %rcx
	movq	%rcx, 7248(%rsp)
	movq	1904(%rax), %rcx
	movq	%rcx, 7256(%rsp)
	movq	1912(%rax), %rcx
	movq	%rcx, 7264(%rsp)
	movq	1920(%rax), %rcx
	movq	%rcx, 7272(%rsp)
	movq	1928(%rax), %rcx
	movq	%rcx, 7280(%rsp)
	movq	1936(%rax), %rcx
	movq	%rcx, 7288(%rsp)
	movq	1944(%rax), %rcx
	movq	%rcx, 7296(%rsp)
	movq	1952(%rax), %rcx
	movq	%rcx, 7304(%rsp)
	movq	1960(%rax), %rcx
	movq	%rcx, 7312(%rsp)
	movq	1968(%rax), %rcx
	movq	%rcx, 7320(%rsp)
	movq	1976(%rax), %rcx
	movq	%rcx, 7328(%rsp)
	movq	1984(%rax), %rcx
	movq	%rcx, 7336(%rsp)
	movq	1992(%rax), %rcx
	movq	%rcx, 7344(%rsp)
	movq	2000(%rax), %rcx
	movq	%rcx, 7352(%rsp)
	movq	2008(%rax), %rcx
	movq	%rcx, 7360(%rsp)
	movq	2016(%rax), %rcx
	movq	%rcx, 7368(%rsp)
	movq	2024(%rax), %rcx
	movq	%rcx, 7376(%rsp)
	movq	2032(%rax), %rcx
	movq	%rcx, 7384(%rsp)
	movq	2040(%rax), %rcx
	movq	%rcx, 7392(%rsp)
	movq	2048(%rax), %rcx
	movq	%rcx, 7400(%rsp)
	movq	2056(%rax), %rcx
	movq	%rcx, 7408(%rsp)
	movq	2064(%rax), %rcx
	movq	%rcx, 7416(%rsp)
	movq	2072(%rax), %rcx
	movq	%rcx, 7424(%rsp)
	movq	2080(%rax), %rcx
	movq	%rcx, 7432(%rsp)
	movq	2088(%rax), %rcx
	movq	%rcx, 7440(%rsp)
	movq	2096(%rax), %rcx
	movq	%rcx, 7448(%rsp)
	movq	2104(%rax), %rcx
	movq	%rcx, 7456(%rsp)
	movq	2112(%rax), %rcx
	movq	%rcx, 7464(%rsp)
	movq	2120(%rax), %rcx
	movq	%rcx, 7472(%rsp)
	movq	2128(%rax), %rcx
	movq	%rcx, 7480(%rsp)
	movq	2136(%rax), %rcx
	movq	%rcx, 7488(%rsp)
	movq	2144(%rax), %rcx
	movq	%rcx, 7496(%rsp)
	movq	2152(%rax), %rcx
	movq	%rcx, 7504(%rsp)
	movq	2160(%rax), %rcx
	movq	%rcx, 7512(%rsp)
	movq	2168(%rax), %rcx
	movq	%rcx, 7520(%rsp)
	movq	2176(%rax), %rcx
	movq	%rcx, 7528(%rsp)
	movq	2184(%rax), %rcx
	movq	%rcx, 7536(%rsp)
	movq	2192(%rax), %rcx
	movq	%rcx, 7544(%rsp)
	movq	2200(%rax), %rcx
	movq	%rcx, 7552(%rsp)
	movq	2208(%rax), %rcx
	movq	%rcx, 7560(%rsp)
	movq	2216(%rax), %rcx
	movq	%rcx, 7568(%rsp)
	movq	2224(%rax), %rcx
	movq	%rcx, 7576(%rsp)
	movq	2232(%rax), %rcx
	movq	%rcx, 7584(%rsp)
	movq	2240(%rax), %rcx
	movq	%rcx, 7592(%rsp)
	movq	2248(%rax), %rcx
	movq	%rcx, 7600(%rsp)
	movq	2256(%rax), %rcx
	movq	%rcx, 7608(%rsp)
	movq	2264(%rax), %rcx
	movq	%rcx, 7616(%rsp)
	movq	2272(%rax), %rcx
	movq	%rcx, 7624(%rsp)
	movq	2280(%rax), %rcx
	movq	%rcx, 7632(%rsp)
	movq	2288(%rax), %rcx
	movq	%rcx, 7640(%rsp)
	movq	2296(%rax), %rcx
	movq	%rcx, 7648(%rsp)
	movq	2304(%rax), %rcx
	movq	%rcx, 7656(%rsp)
	movq	2312(%rax), %rcx
	movq	%rcx, 7664(%rsp)
	movq	2320(%rax), %rcx
	movq	%rcx, 7672(%rsp)
	movq	2328(%rax), %rcx
	movq	%rcx, 7680(%rsp)
	movq	2336(%rax), %rcx
	movq	%rcx, 7688(%rsp)
	movq	2344(%rax), %rcx
	movq	%rcx, 7696(%rsp)
	movq	2352(%rax), %rcx
	movq	%rcx, 7704(%rsp)
	movq	2360(%rax), %rcx
	movq	%rcx, 7712(%rsp)
	movq	2368(%rax), %rcx
	movq	%rcx, 7720(%rsp)
	movq	2376(%rax), %rcx
	movq	%rcx, 7728(%rsp)
	movq	2384(%rax), %rcx
	movq	%rcx, 7736(%rsp)
	movq	2392(%rax), %rcx
	movq	%rcx, 7744(%rsp)
	movq	2400(%rax), %rcx
	movq	%rcx, 7752(%rsp)
	movq	2408(%rax), %rcx
	movq	%rcx, 7760(%rsp)
	movq	2416(%rax), %rcx
	movq	%rcx, 7768(%rsp)
	movq	2424(%rax), %rcx
	movq	%rcx, 7776(%rsp)
	movq	2432(%rax), %rcx
	movq	%rcx, 7784(%rsp)
	movq	2440(%rax), %rcx
	movq	%rcx, 7792(%rsp)
	movq	2448(%rax), %rcx
	movq	%rcx, 7800(%rsp)
	movq	2456(%rax), %rcx
	movq	%rcx, 7808(%rsp)
	movq	2464(%rax), %rcx
	movq	%rcx, 7816(%rsp)
	movq	2472(%rax), %rcx
	movq	%rcx, 7824(%rsp)
	movq	2480(%rax), %rcx
	movq	%rcx, 7832(%rsp)
	movq	2488(%rax), %rcx
	movq	%rcx, 7840(%rsp)
	movq	2496(%rax), %rcx
	movq	%rcx, 7848(%rsp)
	movq	2504(%rax), %rcx
	movq	%rcx, 7856(%rsp)
	movq	2512(%rax), %rcx
	movq	%rcx, 7864(%rsp)
	movq	2520(%rax), %rcx
	movq	%rcx, 7872(%rsp)
	movq	2528(%rax), %rcx
	movq	%rcx, 7880(%rsp)
	movq	2536(%rax), %rcx
	movq	%rcx, 7888(%rsp)
	movq	2544(%rax), %rcx
	movq	%rcx, 7896(%rsp)
	movq	2552(%rax), %rcx
	movq	%rcx, 7904(%rsp)
	movq	2560(%rax), %rcx
	movq	%rcx, 7912(%rsp)
	movq	2568(%rax), %rcx
	movq	%rcx, 7920(%rsp)
	movq	2576(%rax), %rcx
	movq	%rcx, 7928(%rsp)
	movq	2584(%rax), %rcx
	movq	%rcx, 7936(%rsp)
	movq	2592(%rax), %rcx
	movq	%rcx, 7944(%rsp)
	movq	2600(%rax), %rcx
	movq	%rcx, 7952(%rsp)
	movq	2608(%rax), %rcx
	movq	%rcx, 7960(%rsp)
	movq	2616(%rax), %rcx
	movq	%rcx, 7968(%rsp)
	movq	2624(%rax), %rcx
	movq	%rcx, 7976(%rsp)
	movq	2632(%rax), %rcx
	movq	%rcx, 7984(%rsp)
	movq	2640(%rax), %rcx
	movq	%rcx, 7992(%rsp)
	movq	2648(%rax), %rcx
	movq	%rcx, 8000(%rsp)
	movq	2656(%rax), %rcx
	movq	%rcx, 8008(%rsp)
	movq	2664(%rax), %rcx
	movq	%rcx, 8016(%rsp)
	movq	2672(%rax), %rcx
	movq	%rcx, 8024(%rsp)
	movq	2680(%rax), %rcx
	movq	%rcx, 8032(%rsp)
	movq	2688(%rax), %rcx
	movq	%rcx, 8040(%rsp)
	movq	2696(%rax), %rcx
	movq	%rcx, 8048(%rsp)
	movq	2704(%rax), %rcx
	movq	%rcx, 8056(%rsp)
	movq	2712(%rax), %rcx
	movq	%rcx, 8064(%rsp)
	movq	2720(%rax), %rcx
	movq	%rcx, 8072(%rsp)
	movq	2728(%rax), %rcx
	movq	%rcx, 8080(%rsp)
	movq	2736(%rax), %rcx
	movq	%rcx, 8088(%rsp)
	movq	2744(%rax), %rcx
	movq	%rcx, 8096(%rsp)
	movq	2752(%rax), %rcx
	movq	%rcx, 8104(%rsp)
	movq	2760(%rax), %rcx
	movq	%rcx, 8112(%rsp)
	movq	2768(%rax), %rcx
	movq	%rcx, 8120(%rsp)
	movq	2776(%rax), %rcx
	movq	%rcx, 8128(%rsp)
	movq	2784(%rax), %rcx
	movq	%rcx, 8136(%rsp)
	movq	2792(%rax), %rcx
	movq	%rcx, 8144(%rsp)
	movq	2800(%rax), %rcx
	movq	%rcx, 8152(%rsp)
	movq	2808(%rax), %rcx
	movq	%rcx, 8160(%rsp)
	movq	2816(%rax), %rcx
	movq	%rcx, 8168(%rsp)
	movq	2824(%rax), %rcx
	movq	%rcx, 8176(%rsp)
	movq	2832(%rax), %rcx
	movq	%rcx, 8184(%rsp)
	movq	2840(%rax), %rcx
	movq	%rcx, 8192(%rsp)
	movq	2848(%rax), %rcx
	movq	%rcx, 8200(%rsp)
	movq	2856(%rax), %rcx
	movq	%rcx, 8208(%rsp)
	movq	2864(%rax), %rcx
	movq	%rcx, 8216(%rsp)
	movq	2872(%rax), %rcx
	movq	%rcx, 8224(%rsp)
	movq	2880(%rax), %rcx
	movq	%rcx, 8232(%rsp)
	movq	2888(%rax), %rcx
	movq	%rcx, 8240(%rsp)
	movq	2896(%rax), %rcx
	movq	%rcx, 8248(%rsp)
	movq	2904(%rax), %rcx
	movq	%rcx, 8256(%rsp)
	movq	2912(%rax), %rcx
	movq	%rcx, 8264(%rsp)
	movq	2920(%rax), %rcx
	movq	%rcx, 8272(%rsp)
	movq	2928(%rax), %rcx
	movq	%rcx, 8280(%rsp)
	movq	2936(%rax), %rcx
	movq	%rcx, 8288(%rsp)
	movq	2944(%rax), %rcx
	movq	%rcx, 8296(%rsp)
	movq	2952(%rax), %rcx
	movq	%rcx, 8304(%rsp)
	movq	2960(%rax), %rcx
	movq	%rcx, 8312(%rsp)
	movq	2968(%rax), %rcx
	movq	%rcx, 8320(%rsp)
	movq	2976(%rax), %rcx
	movq	%rcx, 8328(%rsp)
	movq	2984(%rax), %rcx
	movq	%rcx, 8336(%rsp)
	movq	2992(%rax), %rcx
	movq	%rcx, 8344(%rsp)
	movq	3000(%rax), %rcx
	movq	%rcx, 8352(%rsp)
	movq	3008(%rax), %rcx
	movq	%rcx, 8360(%rsp)
	movq	3016(%rax), %rcx
	movq	%rcx, 8368(%rsp)
	movq	3024(%rax), %rcx
	movq	%rcx, 8376(%rsp)
	movq	3032(%rax), %rcx
	movq	%rcx, 8384(%rsp)
	movq	3040(%rax), %rcx
	movq	%rcx, 8392(%rsp)
	movq	3048(%rax), %rcx
	movq	%rcx, 8400(%rsp)
	movq	3056(%rax), %rcx
	movq	%rcx, 8408(%rsp)
	movq	3064(%rax), %rcx
	movq	%rcx, 8416(%rsp)
	movq	3072(%rax), %rcx
	movq	%rcx, 8424(%rsp)
	movq	3080(%rax), %rcx
	movq	%rcx, 8432(%rsp)
	movq	3088(%rax), %rcx
	movq	%rcx, 8440(%rsp)
	movq	3096(%rax), %rcx
	movq	%rcx, 8448(%rsp)
	movq	3104(%rax), %rcx
	movq	%rcx, 8456(%rsp)
	movq	3112(%rax), %rcx
	movq	%rcx, 8464(%rsp)
	movq	3120(%rax), %rcx
	movq	%rcx, 8472(%rsp)
	movq	3128(%rax), %rcx
	movq	%rcx, 8480(%rsp)
	movq	3136(%rax), %rcx
	movq	%rcx, 8488(%rsp)
	movq	3144(%rax), %rcx
	movq	%rcx, 8496(%rsp)
	movq	3152(%rax), %rcx
	movq	%rcx, 8504(%rsp)
	movq	3160(%rax), %rax
	movq	%rax, 8512(%rsp)
	leaq	120(%rsp), %rax
	leaq	5352(%rsp), %rcx
	leaq	10568(%rsp), %rdx
	movq	%rsi, %rdi
	movq	$0, %r8
	movq	$0, %r9
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$405
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$406:
	movzbl	(%rdi,%r9), %r10d
	incq	%r9
	movzbl	(%rdi,%r9), %r11d
	incq	%r9
	movl	%r11d, %ebx
	shll	$8, %ebx
	orl 	%ebx, %r10d
	andl	$2047, %r10d
	imull	$3329, %r10d, %r10d
	addl	$1024, %r10d
	shrl	$11, %r10d
	movw	%r10w, (%rdx,%r8,2)
	incq	%r8
	movzbl	(%rdi,%r9), %r10d
	incq	%r9
	shrl	$3, %r11d
	movl	%r10d, %ebx
	shll	$5, %ebx
	orl 	%ebx, %r11d
	andl	$2047, %r11d
	imull	$3329, %r11d, %r11d
	addl	$1024, %r11d
	shrl	$11, %r11d
	movw	%r11w, (%rdx,%r8,2)
	incq	%r8
	movzbl	(%rdi,%r9), %r11d
	incq	%r9
	movzbl	(%rdi,%r9), %ebx
	incq	%r9
	shrl	$6, %r10d
	shll	$2, %r11d
	movl	%ebx, %ebp
	shll	$10, %ebp
	orl 	%ebp, %r11d
	orl 	%r10d, %r11d
	andl	$2047, %r11d
	imull	$3329, %r11d, %r10d
	addl	$1024, %r10d
	shrl	$11, %r10d
	movw	%r10w, (%rdx,%r8,2)
	incq	%r8
	movzbl	(%rdi,%r9), %r11d
	incq	%r9
	shrl	$1, %ebx
	movl	%r11d, %r10d
	shll	$7, %r10d
	orl 	%r10d, %ebx
	andl	$2047, %ebx
	imull	$3329, %ebx, %r10d
	addl	$1024, %r10d
	shrl	$11, %r10d
	movw	%r10w, (%rdx,%r8,2)
	incq	%r8
	movzbl	(%rdi,%r9), %r10d
	incq	%r9
	shrl	$4, %r11d
	movl	%r10d, %ebx
	shll	$4, %ebx
	orl 	%ebx, %r11d
	andl	$2047, %r11d
	imull	$3329, %r11d, %r11d
	addl	$1024, %r11d
	shrl	$11, %r11d
	movw	%r11w, (%rdx,%r8,2)
	incq	%r8
	movzbl	(%rdi,%r9), %r11d
	incq	%r9
	movzbl	(%rdi,%r9), %ebx
	incq	%r9
	shrl	$7, %r10d
	shll	$1, %r11d
	movl	%ebx, %ebp
	shll	$9, %ebp
	orl 	%ebp, %r11d
	orl 	%r10d, %r11d
	andl	$2047, %r11d
	imull	$3329, %r11d, %r10d
	addl	$1024, %r10d
	shrl	$11, %r10d
	movw	%r10w, (%rdx,%r8,2)
	incq	%r8
	movzbl	(%rdi,%r9), %r10d
	incq	%r9
	shrl	$2, %ebx
	movl	%r10d, %r11d
	shll	$6, %r11d
	orl 	%r11d, %ebx
	andl	$2047, %ebx
	imull	$3329, %ebx, %r11d
	addl	$1024, %r11d
	shrl	$11, %r11d
	movw	%r11w, (%rdx,%r8,2)
	incq	%r8
	movzbl	(%rdi,%r9), %r11d
	incq	%r9
	shrl	$5, %r10d
	shll	$3, %r11d
	orl 	%r11d, %r10d
	andl	$2047, %r10d
	imull	$3329, %r10d, %r10d
	addl	$1024, %r10d
	shrl	$11, %r10d
	movw	%r10w, (%rdx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$405:
	cmpq	$1024, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$406
	leaq	8520(%rsp), %rdx
	leaq	1408(%rsi), %rsi
	call	L_i_poly_decompress$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$404:
	leaq	12616(%rsp), %rdi
	movq	%rcx, %r8
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$403:
	leaq	13128(%rsp), %rdi
	leaq	384(%rcx), %r8
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$402:
	leaq	13640(%rsp), %rdi
	leaq	768(%rcx), %r8
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$401:
	leaq	14152(%rsp), %rdi
	leaq	1152(%rcx), %r8
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$400:
	leaq	10568(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$399:
	leaq	11080(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$398:
	leaq	11592(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$397:
	leaq	12104(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$396:
	leaq	9032(%rsp), %rsi
	leaq	12616(%rsp), %rcx
	leaq	10568(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$395:
	leaq	16(%rsp), %rsp
	leaq	9544(%rsp), %rsi
	leaq	13128(%rsp), %rcx
	leaq	11080(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$394:
	leaq	16(%rsp), %rsp
	leaq	9032(%rsp), %rcx
	leaq	9544(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$393:
	leaq	9544(%rsp), %rsi
	leaq	13640(%rsp), %rcx
	leaq	11592(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$392:
	leaq	16(%rsp), %rsp
	leaq	9032(%rsp), %rcx
	leaq	9544(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$391:
	leaq	9544(%rsp), %rsi
	leaq	14152(%rsp), %rcx
	leaq	12104(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$390:
	leaq	16(%rsp), %rsp
	leaq	9032(%rsp), %rcx
	leaq	9544(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$389:
	leaq	9032(%rsp), %rcx
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$387
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$388:
	movw	(%rcx,%rdx,2), %si
	movswl	%si, %edi
	imull	$20159, %edi, %edi
	sarl	$26, %edi
	imull	$3329, %edi, %edi
	subw	%di, %si
	movw	%si, (%rcx,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$387:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$388
	leaq	9032(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$386:
	leaq	9544(%rsp), %rcx
	leaq	8520(%rsp), %rdx
	leaq	9032(%rsp), %rsi
	call	L_poly_sub$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$385:
	leaq	9544(%rsp), %rcx
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$383
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$384:
	movw	(%rcx,%rdx,2), %si
	movswl	%si, %edi
	imull	$20159, %edi, %edi
	sarl	$26, %edi
	imull	$3329, %edi, %edi
	subw	%di, %si
	movw	%si, (%rcx,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$383:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$384
	leaq	9544(%rsp), %rdi
	call	L_i_poly_tomsg$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$382:
	movq	8456(%rsp), %rax
	movq	%rax, 152(%rsp)
	movq	8464(%rsp), %rax
	movq	%rax, 160(%rsp)
	movq	8472(%rsp), %rax
	movq	%rax, 168(%rsp)
	movq	8480(%rsp), %rax
	movq	%rax, 176(%rsp)
	leaq	184(%rsp), %rcx
	leaq	120(%rsp), %rdx
	leaq	-216(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$381:
	leaq	216(%rsp), %rsp
	leaq	26952(%rsp), %rdx
	leaq	120(%rsp), %rsi
	leaq	6888(%rsp), %rax
	leaq	216(%rsp), %rcx
	movq	%rdx, %mm1
	movq	%rax, %rdx
	leaq	10568(%rsp), %rdi
	movq	%rdx, %r8
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$380:
	leaq	11080(%rsp), %rdi
	leaq	384(%rdx), %r8
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$379:
	leaq	11592(%rsp), %rdi
	leaq	768(%rdx), %r8
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$378:
	leaq	12104(%rsp), %rdi
	leaq	1152(%rdx), %r8
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$377:
	movq	1536(%rax), %rdx
	movq	%rdx, 48(%rsp)
	movq	1544(%rax), %rdx
	movq	%rdx, 56(%rsp)
	movq	1552(%rax), %rdx
	movq	%rdx, 64(%rsp)
	movq	1560(%rax), %rax
	movq	%rax, 72(%rsp)
	leaq	9544(%rsp), %rax
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$376:
	movq	%rcx, %mm2
	movq	$1, %rax
	movq	%rax, %mm3
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
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$374
	movb	$0, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$375
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$374:
	movb	$0, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$375:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$373:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$360
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$361:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$372:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$370
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$371
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$370:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$371:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	18760(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$358
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$359:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$358:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$359
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$356
	movb	$0, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$357
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$356:
	movb	$1, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$357:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$355:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$342
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$343:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$354:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$352
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$353
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$352:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$353:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	19272(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$340
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$341:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$340:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$341
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$338
	movb	$0, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$339
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$338:
	movb	$2, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$339:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$337:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$324
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$325:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$336:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$334
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$335
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$334:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$335:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	19784(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$322
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$323:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$322:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$323
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$320
	movb	$0, 112(%rsp)
	movb	$3, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$321
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$320:
	movb	$3, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$321:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$319:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$306
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$307:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$318:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$316
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$317
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$316:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$317:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	20296(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$304
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$305:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$304:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$305
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$302
	movb	$1, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$303
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$302:
	movb	$0, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$303:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$301:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$288
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$289:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$300:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$298
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$299
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$298:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$299:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	20808(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$286
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$287:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$286:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$287
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$284
	movb	$1, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$285
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$284:
	movb	$1, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$285:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$283:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$270
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$271:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$282:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$280
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$281
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$280:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$281:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	21320(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$268
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$269:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$268:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$269
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$266
	movb	$1, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$267
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$266:
	movb	$2, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$267:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$265:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$252
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$253:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$264:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$262
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$263
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$262:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$263:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	21832(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$250
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$251:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$250:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$251
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$248
	movb	$1, 112(%rsp)
	movb	$3, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$249
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$248:
	movb	$3, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$249:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$247:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$234
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$235:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$246:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$244
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$245
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$244:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$245:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	22344(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$232
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$233:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$232:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$233
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$230
	movb	$2, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$231
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$230:
	movb	$0, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$231:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$229:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$216
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$217:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$228:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$226
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$227
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$226:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$227:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	22856(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$214
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$215:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$214:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$215
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$212
	movb	$2, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$213
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$212:
	movb	$1, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$213:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$211:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$198
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$199:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$210:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$208
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$209
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$208:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$209:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	23368(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$196
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$197:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$196:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$197
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$194
	movb	$2, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$195
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$194:
	movb	$2, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$195:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$193:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$180
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$181:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$192:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$190
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$191
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$190:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$191:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	23880(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$178
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$179:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$178:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$179
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$176
	movb	$2, 112(%rsp)
	movb	$3, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$177
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$176:
	movb	$3, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$177:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$175:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$162
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$163:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$174:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$172
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$173
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$172:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$173:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	24392(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$160
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$161:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$160:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$161
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$158
	movb	$3, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$159
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$158:
	movb	$0, 112(%rsp)
	movb	$3, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$159:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$157:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$144
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$145:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$156:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$154
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$155
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$154:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$155:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	24904(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$142
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$143:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$142:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$143
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$140
	movb	$3, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$141
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$140:
	movb	$1, 112(%rsp)
	movb	$3, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$141:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$139:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$126
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$127:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$138:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$136
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$137
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$136:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$137:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	25416(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$124
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$125:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$124:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$125
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$122
	movb	$3, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$123
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$122:
	movb	$2, 112(%rsp)
	movb	$3, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$123:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$121:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$108
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$109:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$120:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$118
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$119
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$118:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$119:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	25928(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$106
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$107:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$106:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$107
	movq	%mm3, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$104
	movb	$3, 112(%rsp)
	movb	$3, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$105
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$104:
	movb	$3, 112(%rsp)
	movb	$3, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$105:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$103:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$90
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$91:
	movq	%rcx, %mm3
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$102:
	movq	%mm3, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$100
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$101
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$100:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 9032(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$101:
	cmpw	$3329, %r8w
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
	movw	%r8w, 9032(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	26440(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$88
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$89:
	movw	9032(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$88:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$89
	movq	%mm2, %rax
	movb	$0, %cl
	leaq	12616(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$87:
	leaq	168(%rsp), %rsp
	movb	$1, %cl
	leaq	13128(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$86:
	leaq	168(%rsp), %rsp
	movb	$2, %cl
	leaq	13640(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$85:
	leaq	168(%rsp), %rsp
	movb	$3, %cl
	leaq	14152(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$84:
	leaq	168(%rsp), %rsp
	movq	%mm2, %rax
	movb	$4, %cl
	leaq	14664(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$83:
	leaq	168(%rsp), %rsp
	movb	$5, %cl
	leaq	15176(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$82:
	leaq	168(%rsp), %rsp
	movb	$6, %cl
	leaq	15688(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$81:
	leaq	168(%rsp), %rsp
	movb	$7, %cl
	leaq	16200(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$80:
	leaq	168(%rsp), %rsp
	movb	$8, %cl
	leaq	9032(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$79:
	leaq	168(%rsp), %rsp
	leaq	12616(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$78:
	leaq	13128(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$77:
	leaq	13640(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$76:
	leaq	14152(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$75:
	leaq	16712(%rsp), %rsi
	leaq	18760(%rsp), %rcx
	leaq	12616(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$74:
	leaq	16(%rsp), %rsp
	leaq	8520(%rsp), %rsi
	leaq	19272(%rsp), %rcx
	leaq	13128(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$73:
	leaq	16(%rsp), %rsp
	leaq	16712(%rsp), %rcx
	leaq	8520(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$72:
	leaq	8520(%rsp), %rsi
	leaq	19784(%rsp), %rcx
	leaq	13640(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$71:
	leaq	16(%rsp), %rsp
	leaq	16712(%rsp), %rcx
	leaq	8520(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$70:
	leaq	8520(%rsp), %rsi
	leaq	20296(%rsp), %rcx
	leaq	14152(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$69:
	leaq	16(%rsp), %rsp
	leaq	16712(%rsp), %rcx
	leaq	8520(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$68:
	leaq	16712(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$66
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$67:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$66:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$67
	leaq	17224(%rsp), %rsi
	leaq	20808(%rsp), %rcx
	leaq	12616(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$65:
	leaq	16(%rsp), %rsp
	leaq	8520(%rsp), %rsi
	leaq	21320(%rsp), %rcx
	leaq	13128(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$64:
	leaq	16(%rsp), %rsp
	leaq	17224(%rsp), %rcx
	leaq	8520(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$63:
	leaq	8520(%rsp), %rsi
	leaq	21832(%rsp), %rcx
	leaq	13640(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$62:
	leaq	16(%rsp), %rsp
	leaq	17224(%rsp), %rcx
	leaq	8520(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$61:
	leaq	8520(%rsp), %rsi
	leaq	22344(%rsp), %rcx
	leaq	14152(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$60:
	leaq	16(%rsp), %rsp
	leaq	17224(%rsp), %rcx
	leaq	8520(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$59:
	leaq	17224(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$57
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$58:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$57:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$58
	leaq	17736(%rsp), %rsi
	leaq	22856(%rsp), %rcx
	leaq	12616(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$56:
	leaq	16(%rsp), %rsp
	leaq	8520(%rsp), %rsi
	leaq	23368(%rsp), %rcx
	leaq	13128(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$55:
	leaq	16(%rsp), %rsp
	leaq	17736(%rsp), %rcx
	leaq	8520(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$54:
	leaq	8520(%rsp), %rsi
	leaq	23880(%rsp), %rcx
	leaq	13640(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$53:
	leaq	16(%rsp), %rsp
	leaq	17736(%rsp), %rcx
	leaq	8520(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$52:
	leaq	8520(%rsp), %rsi
	leaq	24392(%rsp), %rcx
	leaq	14152(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$51:
	leaq	16(%rsp), %rsp
	leaq	17736(%rsp), %rcx
	leaq	8520(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$50:
	leaq	17736(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$48
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$49:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$48:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$49
	leaq	18248(%rsp), %rsi
	leaq	24904(%rsp), %rcx
	leaq	12616(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$47:
	leaq	16(%rsp), %rsp
	leaq	8520(%rsp), %rsi
	leaq	25416(%rsp), %rcx
	leaq	13128(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$46:
	leaq	16(%rsp), %rsp
	leaq	18248(%rsp), %rcx
	leaq	8520(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$45:
	leaq	8520(%rsp), %rsi
	leaq	25928(%rsp), %rcx
	leaq	13640(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$44:
	leaq	16(%rsp), %rsp
	leaq	18248(%rsp), %rcx
	leaq	8520(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$43:
	leaq	8520(%rsp), %rsi
	leaq	26440(%rsp), %rcx
	leaq	14152(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$42:
	leaq	16(%rsp), %rsp
	leaq	18248(%rsp), %rcx
	leaq	8520(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$41:
	leaq	18248(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$39
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$40:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$39:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$40
	leaq	8520(%rsp), %rsi
	leaq	10568(%rsp), %rcx
	leaq	12616(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$38:
	leaq	16(%rsp), %rsp
	leaq	10056(%rsp), %rsi
	leaq	11080(%rsp), %rcx
	leaq	13128(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$37:
	leaq	16(%rsp), %rsp
	leaq	8520(%rsp), %rcx
	leaq	10056(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$36:
	leaq	10056(%rsp), %rsi
	leaq	11592(%rsp), %rcx
	leaq	13640(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$35:
	leaq	16(%rsp), %rsp
	leaq	8520(%rsp), %rcx
	leaq	10056(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$34:
	leaq	10056(%rsp), %rsi
	leaq	12104(%rsp), %rcx
	leaq	14152(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$33:
	leaq	16(%rsp), %rsp
	leaq	8520(%rsp), %rcx
	leaq	10056(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$32:
	leaq	8520(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$30
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$31:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$30:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$31
	leaq	16712(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$29:
	leaq	17224(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$28:
	leaq	17736(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$27:
	leaq	18248(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$26:
	leaq	8520(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$25:
	leaq	16712(%rsp), %rcx
	leaq	14664(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$24:
	leaq	17224(%rsp), %rcx
	leaq	15176(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$23:
	leaq	17736(%rsp), %rcx
	leaq	15688(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$22:
	leaq	18248(%rsp), %rcx
	leaq	16200(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$21:
	leaq	8520(%rsp), %rcx
	leaq	9032(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$20:
	leaq	8520(%rsp), %rcx
	leaq	9544(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$19:
	leaq	16712(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$17
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$18:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$17:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$18
	leaq	17224(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$15
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$16:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$15:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$16
	leaq	17736(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$13
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$14:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$13:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$14
	leaq	18248(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$11
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$12:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$11:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$12
	leaq	8520(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$9
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$10:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$9:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$10
	movq	%mm1, %rax
	movq	%rax, %rcx
	movq	$0, %rdx
	movq	$0, %rsi
	leaq	16712(%rsp), %rdi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$8:
	leaq	17224(%rsp), %rdi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$7:
	leaq	17736(%rsp), %rdi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$6:
	leaq	18248(%rsp), %rdi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$5:
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$3
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$4:
	movzwq	16712(%rsp,%rdx,2), %rdi
	shlq	$11, %rdi
	addq	$1664, %rdi
	imulq	$645084, %rdi, %rdi
	shrq	$31, %rdi
	andq	$2047, %rdi
	incq	%rdx
	movzwq	16712(%rsp,%rdx,2), %r8
	shlq	$11, %r8
	addq	$1664, %r8
	imulq	$645084, %r8, %r8
	shrq	$31, %r8
	andq	$2047, %r8
	incq	%rdx
	movzwq	16712(%rsp,%rdx,2), %r9
	shlq	$11, %r9
	addq	$1664, %r9
	imulq	$645084, %r9, %r9
	shrq	$31, %r9
	andq	$2047, %r9
	incq	%rdx
	movzwq	16712(%rsp,%rdx,2), %r10
	shlq	$11, %r10
	addq	$1664, %r10
	imulq	$645084, %r10, %r10
	shrq	$31, %r10
	andq	$2047, %r10
	incq	%rdx
	movzwq	16712(%rsp,%rdx,2), %r11
	shlq	$11, %r11
	addq	$1664, %r11
	imulq	$645084, %r11, %r11
	shrq	$31, %r11
	andq	$2047, %r11
	incq	%rdx
	movzwq	16712(%rsp,%rdx,2), %rbx
	shlq	$11, %rbx
	addq	$1664, %rbx
	imulq	$645084, %rbx, %rbx
	shrq	$31, %rbx
	andq	$2047, %rbx
	incq	%rdx
	movzwq	16712(%rsp,%rdx,2), %rbp
	shlq	$11, %rbp
	addq	$1664, %rbp
	imulq	$645084, %rbp, %rbp
	shrq	$31, %rbp
	andq	$2047, %rbp
	incq	%rdx
	movzwq	16712(%rsp,%rdx,2), %r12
	shlq	$11, %r12
	addq	$1664, %r12
	imulq	$645084, %r12, %r12
	shrq	$31, %r12
	andq	$2047, %r12
	incq	%rdx
	movw	%di, %r13w
	movb	%r13b, (%rcx,%rsi)
	incq	%rsi
	shrw	$8, %di
	movw	%r8w, %r13w
	shlw	$3, %r13w
	orw 	%di, %r13w
	movb	%r13b, (%rcx,%rsi)
	incq	%rsi
	shrw	$5, %r8w
	movw	%r9w, %di
	shlw	$6, %di
	orw 	%r8w, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	movw	%r9w, %di
	shrw	$2, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	shrw	$10, %r9w
	movw	%r10w, %di
	shlw	$1, %di
	orw 	%r9w, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	shrw	$7, %r10w
	movw	%r11w, %di
	shlw	$4, %di
	orw 	%r10w, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	shrw	$4, %r11w
	movw	%bx, %di
	shlw	$7, %di
	orw 	%r11w, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	movw	%bx, %di
	shrw	$1, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	shrw	$9, %bx
	movw	%bp, %di
	shlw	$2, %di
	orw 	%bx, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	shrw	$6, %bp
	movw	%r12w, %di
	shlw	$5, %di
	orw 	%bp, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	shrw	$3, %r12w
	movb	%r12b, (%rcx,%rsi)
	incq	%rsi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$3:
	cmpq	$1024, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$4
	leaq	1408(%rax), %rax
	leaq	8520(%rsp), %rdi
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$2:
	movq	8(%rsp), %rax
	leaq	26952(%rsp), %rcx
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
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1088(%rcx), %sil
	movb	1088(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1089(%rcx), %sil
	movb	1089(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1090(%rcx), %sil
	movb	1090(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1091(%rcx), %sil
	movb	1091(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1092(%rcx), %sil
	movb	1092(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1093(%rcx), %sil
	movb	1093(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1094(%rcx), %sil
	movb	1094(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1095(%rcx), %sil
	movb	1095(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1096(%rcx), %sil
	movb	1096(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1097(%rcx), %sil
	movb	1097(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1098(%rcx), %sil
	movb	1098(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1099(%rcx), %sil
	movb	1099(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1100(%rcx), %sil
	movb	1100(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1101(%rcx), %sil
	movb	1101(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1102(%rcx), %sil
	movb	1102(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1103(%rcx), %sil
	movb	1103(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1104(%rcx), %sil
	movb	1104(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1105(%rcx), %sil
	movb	1105(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1106(%rcx), %sil
	movb	1106(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1107(%rcx), %sil
	movb	1107(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1108(%rcx), %sil
	movb	1108(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1109(%rcx), %sil
	movb	1109(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1110(%rcx), %sil
	movb	1110(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1111(%rcx), %sil
	movb	1111(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1112(%rcx), %sil
	movb	1112(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1113(%rcx), %sil
	movb	1113(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1114(%rcx), %sil
	movb	1114(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1115(%rcx), %sil
	movb	1115(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1116(%rcx), %sil
	movb	1116(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1117(%rcx), %sil
	movb	1117(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1118(%rcx), %sil
	movb	1118(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1119(%rcx), %sil
	movb	1119(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1120(%rcx), %sil
	movb	1120(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1121(%rcx), %sil
	movb	1121(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1122(%rcx), %sil
	movb	1122(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1123(%rcx), %sil
	movb	1123(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1124(%rcx), %sil
	movb	1124(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1125(%rcx), %sil
	movb	1125(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1126(%rcx), %sil
	movb	1126(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1127(%rcx), %sil
	movb	1127(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1128(%rcx), %sil
	movb	1128(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1129(%rcx), %sil
	movb	1129(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1130(%rcx), %sil
	movb	1130(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1131(%rcx), %sil
	movb	1131(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1132(%rcx), %sil
	movb	1132(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1133(%rcx), %sil
	movb	1133(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1134(%rcx), %sil
	movb	1134(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1135(%rcx), %sil
	movb	1135(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1136(%rcx), %sil
	movb	1136(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1137(%rcx), %sil
	movb	1137(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1138(%rcx), %sil
	movb	1138(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1139(%rcx), %sil
	movb	1139(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1140(%rcx), %sil
	movb	1140(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1141(%rcx), %sil
	movb	1141(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1142(%rcx), %sil
	movb	1142(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1143(%rcx), %sil
	movb	1143(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1144(%rcx), %sil
	movb	1144(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1145(%rcx), %sil
	movb	1145(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1146(%rcx), %sil
	movb	1146(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1147(%rcx), %sil
	movb	1147(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1148(%rcx), %sil
	movb	1148(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1149(%rcx), %sil
	movb	1149(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1150(%rcx), %sil
	movb	1150(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1151(%rcx), %sil
	movb	1151(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1152(%rcx), %sil
	movb	1152(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1153(%rcx), %sil
	movb	1153(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1154(%rcx), %sil
	movb	1154(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1155(%rcx), %sil
	movb	1155(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1156(%rcx), %sil
	movb	1156(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1157(%rcx), %sil
	movb	1157(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1158(%rcx), %sil
	movb	1158(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1159(%rcx), %sil
	movb	1159(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1160(%rcx), %sil
	movb	1160(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1161(%rcx), %sil
	movb	1161(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1162(%rcx), %sil
	movb	1162(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1163(%rcx), %sil
	movb	1163(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1164(%rcx), %sil
	movb	1164(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1165(%rcx), %sil
	movb	1165(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1166(%rcx), %sil
	movb	1166(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1167(%rcx), %sil
	movb	1167(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1168(%rcx), %sil
	movb	1168(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1169(%rcx), %sil
	movb	1169(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1170(%rcx), %sil
	movb	1170(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1171(%rcx), %sil
	movb	1171(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1172(%rcx), %sil
	movb	1172(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1173(%rcx), %sil
	movb	1173(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1174(%rcx), %sil
	movb	1174(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1175(%rcx), %sil
	movb	1175(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1176(%rcx), %sil
	movb	1176(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1177(%rcx), %sil
	movb	1177(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1178(%rcx), %sil
	movb	1178(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1179(%rcx), %sil
	movb	1179(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1180(%rcx), %sil
	movb	1180(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1181(%rcx), %sil
	movb	1181(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1182(%rcx), %sil
	movb	1182(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1183(%rcx), %sil
	movb	1183(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1184(%rcx), %sil
	movb	1184(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1185(%rcx), %sil
	movb	1185(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1186(%rcx), %sil
	movb	1186(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1187(%rcx), %sil
	movb	1187(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1188(%rcx), %sil
	movb	1188(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1189(%rcx), %sil
	movb	1189(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1190(%rcx), %sil
	movb	1190(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1191(%rcx), %sil
	movb	1191(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1192(%rcx), %sil
	movb	1192(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1193(%rcx), %sil
	movb	1193(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1194(%rcx), %sil
	movb	1194(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1195(%rcx), %sil
	movb	1195(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1196(%rcx), %sil
	movb	1196(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1197(%rcx), %sil
	movb	1197(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1198(%rcx), %sil
	movb	1198(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1199(%rcx), %sil
	movb	1199(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1200(%rcx), %sil
	movb	1200(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1201(%rcx), %sil
	movb	1201(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1202(%rcx), %sil
	movb	1202(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1203(%rcx), %sil
	movb	1203(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1204(%rcx), %sil
	movb	1204(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1205(%rcx), %sil
	movb	1205(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1206(%rcx), %sil
	movb	1206(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1207(%rcx), %sil
	movb	1207(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1208(%rcx), %sil
	movb	1208(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1209(%rcx), %sil
	movb	1209(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1210(%rcx), %sil
	movb	1210(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1211(%rcx), %sil
	movb	1211(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1212(%rcx), %sil
	movb	1212(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1213(%rcx), %sil
	movb	1213(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1214(%rcx), %sil
	movb	1214(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1215(%rcx), %sil
	movb	1215(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1216(%rcx), %sil
	movb	1216(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1217(%rcx), %sil
	movb	1217(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1218(%rcx), %sil
	movb	1218(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1219(%rcx), %sil
	movb	1219(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1220(%rcx), %sil
	movb	1220(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1221(%rcx), %sil
	movb	1221(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1222(%rcx), %sil
	movb	1222(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1223(%rcx), %sil
	movb	1223(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1224(%rcx), %sil
	movb	1224(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1225(%rcx), %sil
	movb	1225(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1226(%rcx), %sil
	movb	1226(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1227(%rcx), %sil
	movb	1227(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1228(%rcx), %sil
	movb	1228(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1229(%rcx), %sil
	movb	1229(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1230(%rcx), %sil
	movb	1230(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1231(%rcx), %sil
	movb	1231(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1232(%rcx), %sil
	movb	1232(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1233(%rcx), %sil
	movb	1233(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1234(%rcx), %sil
	movb	1234(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1235(%rcx), %sil
	movb	1235(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1236(%rcx), %sil
	movb	1236(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1237(%rcx), %sil
	movb	1237(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1238(%rcx), %sil
	movb	1238(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1239(%rcx), %sil
	movb	1239(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1240(%rcx), %sil
	movb	1240(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1241(%rcx), %sil
	movb	1241(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1242(%rcx), %sil
	movb	1242(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1243(%rcx), %sil
	movb	1243(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1244(%rcx), %sil
	movb	1244(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1245(%rcx), %sil
	movb	1245(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1246(%rcx), %sil
	movb	1246(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1247(%rcx), %sil
	movb	1247(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1248(%rcx), %sil
	movb	1248(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1249(%rcx), %sil
	movb	1249(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1250(%rcx), %sil
	movb	1250(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1251(%rcx), %sil
	movb	1251(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1252(%rcx), %sil
	movb	1252(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1253(%rcx), %sil
	movb	1253(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1254(%rcx), %sil
	movb	1254(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1255(%rcx), %sil
	movb	1255(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1256(%rcx), %sil
	movb	1256(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1257(%rcx), %sil
	movb	1257(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1258(%rcx), %sil
	movb	1258(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1259(%rcx), %sil
	movb	1259(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1260(%rcx), %sil
	movb	1260(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1261(%rcx), %sil
	movb	1261(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1262(%rcx), %sil
	movb	1262(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1263(%rcx), %sil
	movb	1263(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1264(%rcx), %sil
	movb	1264(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1265(%rcx), %sil
	movb	1265(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1266(%rcx), %sil
	movb	1266(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1267(%rcx), %sil
	movb	1267(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1268(%rcx), %sil
	movb	1268(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1269(%rcx), %sil
	movb	1269(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1270(%rcx), %sil
	movb	1270(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1271(%rcx), %sil
	movb	1271(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1272(%rcx), %sil
	movb	1272(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1273(%rcx), %sil
	movb	1273(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1274(%rcx), %sil
	movb	1274(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1275(%rcx), %sil
	movb	1275(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1276(%rcx), %sil
	movb	1276(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1277(%rcx), %sil
	movb	1277(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1278(%rcx), %sil
	movb	1278(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1279(%rcx), %sil
	movb	1279(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1280(%rcx), %sil
	movb	1280(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1281(%rcx), %sil
	movb	1281(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1282(%rcx), %sil
	movb	1282(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1283(%rcx), %sil
	movb	1283(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1284(%rcx), %sil
	movb	1284(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1285(%rcx), %sil
	movb	1285(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1286(%rcx), %sil
	movb	1286(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1287(%rcx), %sil
	movb	1287(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1288(%rcx), %sil
	movb	1288(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1289(%rcx), %sil
	movb	1289(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1290(%rcx), %sil
	movb	1290(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1291(%rcx), %sil
	movb	1291(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1292(%rcx), %sil
	movb	1292(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1293(%rcx), %sil
	movb	1293(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1294(%rcx), %sil
	movb	1294(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1295(%rcx), %sil
	movb	1295(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1296(%rcx), %sil
	movb	1296(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1297(%rcx), %sil
	movb	1297(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1298(%rcx), %sil
	movb	1298(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1299(%rcx), %sil
	movb	1299(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1300(%rcx), %sil
	movb	1300(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1301(%rcx), %sil
	movb	1301(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1302(%rcx), %sil
	movb	1302(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1303(%rcx), %sil
	movb	1303(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1304(%rcx), %sil
	movb	1304(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1305(%rcx), %sil
	movb	1305(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1306(%rcx), %sil
	movb	1306(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1307(%rcx), %sil
	movb	1307(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1308(%rcx), %sil
	movb	1308(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1309(%rcx), %sil
	movb	1309(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1310(%rcx), %sil
	movb	1310(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1311(%rcx), %sil
	movb	1311(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1312(%rcx), %sil
	movb	1312(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1313(%rcx), %sil
	movb	1313(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1314(%rcx), %sil
	movb	1314(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1315(%rcx), %sil
	movb	1315(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1316(%rcx), %sil
	movb	1316(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1317(%rcx), %sil
	movb	1317(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1318(%rcx), %sil
	movb	1318(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1319(%rcx), %sil
	movb	1319(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1320(%rcx), %sil
	movb	1320(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1321(%rcx), %sil
	movb	1321(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1322(%rcx), %sil
	movb	1322(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1323(%rcx), %sil
	movb	1323(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1324(%rcx), %sil
	movb	1324(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1325(%rcx), %sil
	movb	1325(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1326(%rcx), %sil
	movb	1326(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1327(%rcx), %sil
	movb	1327(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1328(%rcx), %sil
	movb	1328(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1329(%rcx), %sil
	movb	1329(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1330(%rcx), %sil
	movb	1330(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1331(%rcx), %sil
	movb	1331(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1332(%rcx), %sil
	movb	1332(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1333(%rcx), %sil
	movb	1333(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1334(%rcx), %sil
	movb	1334(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1335(%rcx), %sil
	movb	1335(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1336(%rcx), %sil
	movb	1336(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1337(%rcx), %sil
	movb	1337(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1338(%rcx), %sil
	movb	1338(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1339(%rcx), %sil
	movb	1339(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1340(%rcx), %sil
	movb	1340(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1341(%rcx), %sil
	movb	1341(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1342(%rcx), %sil
	movb	1342(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1343(%rcx), %sil
	movb	1343(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1344(%rcx), %sil
	movb	1344(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1345(%rcx), %sil
	movb	1345(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1346(%rcx), %sil
	movb	1346(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1347(%rcx), %sil
	movb	1347(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1348(%rcx), %sil
	movb	1348(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1349(%rcx), %sil
	movb	1349(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1350(%rcx), %sil
	movb	1350(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1351(%rcx), %sil
	movb	1351(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1352(%rcx), %sil
	movb	1352(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1353(%rcx), %sil
	movb	1353(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1354(%rcx), %sil
	movb	1354(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1355(%rcx), %sil
	movb	1355(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1356(%rcx), %sil
	movb	1356(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1357(%rcx), %sil
	movb	1357(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1358(%rcx), %sil
	movb	1358(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1359(%rcx), %sil
	movb	1359(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1360(%rcx), %sil
	movb	1360(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1361(%rcx), %sil
	movb	1361(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1362(%rcx), %sil
	movb	1362(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1363(%rcx), %sil
	movb	1363(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1364(%rcx), %sil
	movb	1364(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1365(%rcx), %sil
	movb	1365(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1366(%rcx), %sil
	movb	1366(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1367(%rcx), %sil
	movb	1367(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1368(%rcx), %sil
	movb	1368(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1369(%rcx), %sil
	movb	1369(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1370(%rcx), %sil
	movb	1370(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1371(%rcx), %sil
	movb	1371(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1372(%rcx), %sil
	movb	1372(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1373(%rcx), %sil
	movb	1373(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1374(%rcx), %sil
	movb	1374(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1375(%rcx), %sil
	movb	1375(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1376(%rcx), %sil
	movb	1376(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1377(%rcx), %sil
	movb	1377(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1378(%rcx), %sil
	movb	1378(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1379(%rcx), %sil
	movb	1379(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1380(%rcx), %sil
	movb	1380(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1381(%rcx), %sil
	movb	1381(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1382(%rcx), %sil
	movb	1382(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1383(%rcx), %sil
	movb	1383(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1384(%rcx), %sil
	movb	1384(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1385(%rcx), %sil
	movb	1385(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1386(%rcx), %sil
	movb	1386(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1387(%rcx), %sil
	movb	1387(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1388(%rcx), %sil
	movb	1388(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1389(%rcx), %sil
	movb	1389(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1390(%rcx), %sil
	movb	1390(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1391(%rcx), %sil
	movb	1391(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1392(%rcx), %sil
	movb	1392(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1393(%rcx), %sil
	movb	1393(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1394(%rcx), %sil
	movb	1394(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1395(%rcx), %sil
	movb	1395(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1396(%rcx), %sil
	movb	1396(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1397(%rcx), %sil
	movb	1397(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1398(%rcx), %sil
	movb	1398(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1399(%rcx), %sil
	movb	1399(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1400(%rcx), %sil
	movb	1400(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1401(%rcx), %sil
	movb	1401(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1402(%rcx), %sil
	movb	1402(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1403(%rcx), %sil
	movb	1403(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1404(%rcx), %sil
	movb	1404(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1405(%rcx), %sil
	movb	1405(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1406(%rcx), %sil
	movb	1406(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1407(%rcx), %sil
	movb	1407(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1408(%rcx), %sil
	movb	1408(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1409(%rcx), %sil
	movb	1409(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1410(%rcx), %sil
	movb	1410(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1411(%rcx), %sil
	movb	1411(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1412(%rcx), %sil
	movb	1412(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1413(%rcx), %sil
	movb	1413(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1414(%rcx), %sil
	movb	1414(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1415(%rcx), %sil
	movb	1415(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1416(%rcx), %sil
	movb	1416(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1417(%rcx), %sil
	movb	1417(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1418(%rcx), %sil
	movb	1418(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1419(%rcx), %sil
	movb	1419(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1420(%rcx), %sil
	movb	1420(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1421(%rcx), %sil
	movb	1421(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1422(%rcx), %sil
	movb	1422(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1423(%rcx), %sil
	movb	1423(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1424(%rcx), %sil
	movb	1424(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1425(%rcx), %sil
	movb	1425(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1426(%rcx), %sil
	movb	1426(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1427(%rcx), %sil
	movb	1427(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1428(%rcx), %sil
	movb	1428(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1429(%rcx), %sil
	movb	1429(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1430(%rcx), %sil
	movb	1430(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1431(%rcx), %sil
	movb	1431(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1432(%rcx), %sil
	movb	1432(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1433(%rcx), %sil
	movb	1433(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1434(%rcx), %sil
	movb	1434(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1435(%rcx), %sil
	movb	1435(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1436(%rcx), %sil
	movb	1436(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1437(%rcx), %sil
	movb	1437(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1438(%rcx), %sil
	movb	1438(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1439(%rcx), %sil
	movb	1439(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1440(%rcx), %sil
	movb	1440(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1441(%rcx), %sil
	movb	1441(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1442(%rcx), %sil
	movb	1442(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1443(%rcx), %sil
	movb	1443(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1444(%rcx), %sil
	movb	1444(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1445(%rcx), %sil
	movb	1445(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1446(%rcx), %sil
	movb	1446(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1447(%rcx), %sil
	movb	1447(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1448(%rcx), %sil
	movb	1448(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1449(%rcx), %sil
	movb	1449(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1450(%rcx), %sil
	movb	1450(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1451(%rcx), %sil
	movb	1451(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1452(%rcx), %sil
	movb	1452(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1453(%rcx), %sil
	movb	1453(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1454(%rcx), %sil
	movb	1454(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1455(%rcx), %sil
	movb	1455(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1456(%rcx), %sil
	movb	1456(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1457(%rcx), %sil
	movb	1457(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1458(%rcx), %sil
	movb	1458(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1459(%rcx), %sil
	movb	1459(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1460(%rcx), %sil
	movb	1460(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1461(%rcx), %sil
	movb	1461(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1462(%rcx), %sil
	movb	1462(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1463(%rcx), %sil
	movb	1463(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1464(%rcx), %sil
	movb	1464(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1465(%rcx), %sil
	movb	1465(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1466(%rcx), %sil
	movb	1466(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1467(%rcx), %sil
	movb	1467(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1468(%rcx), %sil
	movb	1468(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1469(%rcx), %sil
	movb	1469(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1470(%rcx), %sil
	movb	1470(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1471(%rcx), %sil
	movb	1471(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1472(%rcx), %sil
	movb	1472(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1473(%rcx), %sil
	movb	1473(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1474(%rcx), %sil
	movb	1474(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1475(%rcx), %sil
	movb	1475(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1476(%rcx), %sil
	movb	1476(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1477(%rcx), %sil
	movb	1477(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1478(%rcx), %sil
	movb	1478(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1479(%rcx), %sil
	movb	1479(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1480(%rcx), %sil
	movb	1480(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1481(%rcx), %sil
	movb	1481(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1482(%rcx), %sil
	movb	1482(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1483(%rcx), %sil
	movb	1483(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1484(%rcx), %sil
	movb	1484(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1485(%rcx), %sil
	movb	1485(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1486(%rcx), %sil
	movb	1486(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1487(%rcx), %sil
	movb	1487(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1488(%rcx), %sil
	movb	1488(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1489(%rcx), %sil
	movb	1489(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1490(%rcx), %sil
	movb	1490(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1491(%rcx), %sil
	movb	1491(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1492(%rcx), %sil
	movb	1492(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1493(%rcx), %sil
	movb	1493(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1494(%rcx), %sil
	movb	1494(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1495(%rcx), %sil
	movb	1495(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1496(%rcx), %sil
	movb	1496(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1497(%rcx), %sil
	movb	1497(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1498(%rcx), %sil
	movb	1498(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1499(%rcx), %sil
	movb	1499(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1500(%rcx), %sil
	movb	1500(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1501(%rcx), %sil
	movb	1501(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1502(%rcx), %sil
	movb	1502(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1503(%rcx), %sil
	movb	1503(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1504(%rcx), %sil
	movb	1504(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1505(%rcx), %sil
	movb	1505(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1506(%rcx), %sil
	movb	1506(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1507(%rcx), %sil
	movb	1507(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1508(%rcx), %sil
	movb	1508(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1509(%rcx), %sil
	movb	1509(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1510(%rcx), %sil
	movb	1510(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1511(%rcx), %sil
	movb	1511(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1512(%rcx), %sil
	movb	1512(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1513(%rcx), %sil
	movb	1513(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1514(%rcx), %sil
	movb	1514(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1515(%rcx), %sil
	movb	1515(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1516(%rcx), %sil
	movb	1516(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1517(%rcx), %sil
	movb	1517(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1518(%rcx), %sil
	movb	1518(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1519(%rcx), %sil
	movb	1519(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1520(%rcx), %sil
	movb	1520(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1521(%rcx), %sil
	movb	1521(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1522(%rcx), %sil
	movb	1522(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1523(%rcx), %sil
	movb	1523(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1524(%rcx), %sil
	movb	1524(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1525(%rcx), %sil
	movb	1525(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1526(%rcx), %sil
	movb	1526(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1527(%rcx), %sil
	movb	1527(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1528(%rcx), %sil
	movb	1528(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1529(%rcx), %sil
	movb	1529(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1530(%rcx), %sil
	movb	1530(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1531(%rcx), %sil
	movb	1531(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1532(%rcx), %sil
	movb	1532(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1533(%rcx), %sil
	movb	1533(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1534(%rcx), %sil
	movb	1534(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1535(%rcx), %sil
	movb	1535(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1536(%rcx), %sil
	movb	1536(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1537(%rcx), %sil
	movb	1537(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1538(%rcx), %sil
	movb	1538(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1539(%rcx), %sil
	movb	1539(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1540(%rcx), %sil
	movb	1540(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1541(%rcx), %sil
	movb	1541(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1542(%rcx), %sil
	movb	1542(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1543(%rcx), %sil
	movb	1543(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1544(%rcx), %sil
	movb	1544(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1545(%rcx), %sil
	movb	1545(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1546(%rcx), %sil
	movb	1546(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1547(%rcx), %sil
	movb	1547(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1548(%rcx), %sil
	movb	1548(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1549(%rcx), %sil
	movb	1549(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1550(%rcx), %sil
	movb	1550(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1551(%rcx), %sil
	movb	1551(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1552(%rcx), %sil
	movb	1552(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1553(%rcx), %sil
	movb	1553(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1554(%rcx), %sil
	movb	1554(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1555(%rcx), %sil
	movb	1555(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1556(%rcx), %sil
	movb	1556(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1557(%rcx), %sil
	movb	1557(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1558(%rcx), %sil
	movb	1558(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1559(%rcx), %sil
	movb	1559(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1560(%rcx), %sil
	movb	1560(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1561(%rcx), %sil
	movb	1561(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1562(%rcx), %sil
	movb	1562(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1563(%rcx), %sil
	movb	1563(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1564(%rcx), %sil
	movb	1564(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1565(%rcx), %sil
	movb	1565(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1566(%rcx), %sil
	movb	1566(%rax), %dil
	xorb	%dil, %sil
	movzbq	%sil, %rsi
	orq 	%rsi, %rdx
	movb	1567(%rcx), %cl
	movb	1567(%rax), %al
	xorb	%al, %cl
	movzbq	%cl, %rax
	orq 	%rax, %rdx
	negq	%rdx
	shrq	$63, %rdx
	movq	%rdx, %mm1
	movq	8(%rsp), %rcx
	movq	(%rsp), %rax
	leaq	8488(%rsp), %rdx
	leaq	-224(%rsp), %rsp
	call	L_shake256_A32__A1600$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$1:
	leaq	224(%rsp), %rsp
	movq	%mm1, %rax
	leaq	184(%rsp), %rcx
	negq	%rax
	movb	(%rdx), %sil
	movb	(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, (%rdx)
	movb	1(%rdx), %sil
	movb	1(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 1(%rdx)
	movb	2(%rdx), %sil
	movb	2(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 2(%rdx)
	movb	3(%rdx), %sil
	movb	3(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 3(%rdx)
	movb	4(%rdx), %sil
	movb	4(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 4(%rdx)
	movb	5(%rdx), %sil
	movb	5(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 5(%rdx)
	movb	6(%rdx), %sil
	movb	6(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 6(%rdx)
	movb	7(%rdx), %sil
	movb	7(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 7(%rdx)
	movb	8(%rdx), %sil
	movb	8(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 8(%rdx)
	movb	9(%rdx), %sil
	movb	9(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 9(%rdx)
	movb	10(%rdx), %sil
	movb	10(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 10(%rdx)
	movb	11(%rdx), %sil
	movb	11(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 11(%rdx)
	movb	12(%rdx), %sil
	movb	12(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 12(%rdx)
	movb	13(%rdx), %sil
	movb	13(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 13(%rdx)
	movb	14(%rdx), %sil
	movb	14(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 14(%rdx)
	movb	15(%rdx), %sil
	movb	15(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 15(%rdx)
	movb	16(%rdx), %sil
	movb	16(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 16(%rdx)
	movb	17(%rdx), %sil
	movb	17(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 17(%rdx)
	movb	18(%rdx), %sil
	movb	18(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 18(%rdx)
	movb	19(%rdx), %sil
	movb	19(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 19(%rdx)
	movb	20(%rdx), %sil
	movb	20(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 20(%rdx)
	movb	21(%rdx), %sil
	movb	21(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 21(%rdx)
	movb	22(%rdx), %sil
	movb	22(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 22(%rdx)
	movb	23(%rdx), %sil
	movb	23(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 23(%rdx)
	movb	24(%rdx), %sil
	movb	24(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 24(%rdx)
	movb	25(%rdx), %sil
	movb	25(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 25(%rdx)
	movb	26(%rdx), %sil
	movb	26(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 26(%rdx)
	movb	27(%rdx), %sil
	movb	27(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 27(%rdx)
	movb	28(%rdx), %sil
	movb	28(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 28(%rdx)
	movb	29(%rdx), %sil
	movb	29(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 29(%rdx)
	movb	30(%rdx), %sil
	movb	30(%rcx), %dil
	xorb	%dil, %sil
	andb	%al, %sil
	xorb	%sil, %dil
	movb	%dil, 30(%rdx)
	movb	31(%rdx), %sil
	movb	31(%rcx), %cl
	xorb	%cl, %sil
	andb	%al, %sil
	xorb	%sil, %cl
	movb	%cl, 31(%rdx)
	movq	%mm0, %rax
	movq	16(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	24(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	32(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	40(%rsp), %rcx
	movq	%rcx, 24(%rax)
	xorq	%rax, %rax
	movq	28520(%rsp), %rbx
	movq	28528(%rsp), %rbp
	movq	28536(%rsp), %r12
	movq	28544(%rsp), %r13
	movq	28552(%rsp), %r14
	movq	28560(%rsp), %r15
	movq	28568(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand:
jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand:
	movq	%rsp, %rax
	leaq	-22240(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 22184(%rsp)
	movq	%rbp, 22192(%rsp)
	movq	%r12, 22200(%rsp)
	movq	%r13, 22208(%rsp)
	movq	%r14, 22216(%rsp)
	movq	%r15, 22224(%rsp)
	movq	%rax, 22232(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm0
	movq	%rsi, %mm1
	movq	(%rdx), %rax
	movq	%rax, 616(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 624(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 632(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 640(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 648(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 656(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 664(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 672(%rsp)
	movq	64(%rdx), %rax
	movq	%rax, 680(%rsp)
	movq	72(%rdx), %rax
	movq	%rax, 688(%rsp)
	movq	80(%rdx), %rax
	movq	%rax, 696(%rsp)
	movq	88(%rdx), %rax
	movq	%rax, 704(%rsp)
	movq	96(%rdx), %rax
	movq	%rax, 712(%rsp)
	movq	104(%rdx), %rax
	movq	%rax, 720(%rsp)
	movq	112(%rdx), %rax
	movq	%rax, 728(%rsp)
	movq	120(%rdx), %rax
	movq	%rax, 736(%rsp)
	movq	128(%rdx), %rax
	movq	%rax, 744(%rsp)
	movq	136(%rdx), %rax
	movq	%rax, 752(%rsp)
	movq	144(%rdx), %rax
	movq	%rax, 760(%rsp)
	movq	152(%rdx), %rax
	movq	%rax, 768(%rsp)
	movq	160(%rdx), %rax
	movq	%rax, 776(%rsp)
	movq	168(%rdx), %rax
	movq	%rax, 784(%rsp)
	movq	176(%rdx), %rax
	movq	%rax, 792(%rsp)
	movq	184(%rdx), %rax
	movq	%rax, 800(%rsp)
	movq	192(%rdx), %rax
	movq	%rax, 808(%rsp)
	movq	200(%rdx), %rax
	movq	%rax, 816(%rsp)
	movq	208(%rdx), %rax
	movq	%rax, 824(%rsp)
	movq	216(%rdx), %rax
	movq	%rax, 832(%rsp)
	movq	224(%rdx), %rax
	movq	%rax, 840(%rsp)
	movq	232(%rdx), %rax
	movq	%rax, 848(%rsp)
	movq	240(%rdx), %rax
	movq	%rax, 856(%rsp)
	movq	248(%rdx), %rax
	movq	%rax, 864(%rsp)
	movq	256(%rdx), %rax
	movq	%rax, 872(%rsp)
	movq	264(%rdx), %rax
	movq	%rax, 880(%rsp)
	movq	272(%rdx), %rax
	movq	%rax, 888(%rsp)
	movq	280(%rdx), %rax
	movq	%rax, 896(%rsp)
	movq	288(%rdx), %rax
	movq	%rax, 904(%rsp)
	movq	296(%rdx), %rax
	movq	%rax, 912(%rsp)
	movq	304(%rdx), %rax
	movq	%rax, 920(%rsp)
	movq	312(%rdx), %rax
	movq	%rax, 928(%rsp)
	movq	320(%rdx), %rax
	movq	%rax, 936(%rsp)
	movq	328(%rdx), %rax
	movq	%rax, 944(%rsp)
	movq	336(%rdx), %rax
	movq	%rax, 952(%rsp)
	movq	344(%rdx), %rax
	movq	%rax, 960(%rsp)
	movq	352(%rdx), %rax
	movq	%rax, 968(%rsp)
	movq	360(%rdx), %rax
	movq	%rax, 976(%rsp)
	movq	368(%rdx), %rax
	movq	%rax, 984(%rsp)
	movq	376(%rdx), %rax
	movq	%rax, 992(%rsp)
	movq	384(%rdx), %rax
	movq	%rax, 1000(%rsp)
	movq	392(%rdx), %rax
	movq	%rax, 1008(%rsp)
	movq	400(%rdx), %rax
	movq	%rax, 1016(%rsp)
	movq	408(%rdx), %rax
	movq	%rax, 1024(%rsp)
	movq	416(%rdx), %rax
	movq	%rax, 1032(%rsp)
	movq	424(%rdx), %rax
	movq	%rax, 1040(%rsp)
	movq	432(%rdx), %rax
	movq	%rax, 1048(%rsp)
	movq	440(%rdx), %rax
	movq	%rax, 1056(%rsp)
	movq	448(%rdx), %rax
	movq	%rax, 1064(%rsp)
	movq	456(%rdx), %rax
	movq	%rax, 1072(%rsp)
	movq	464(%rdx), %rax
	movq	%rax, 1080(%rsp)
	movq	472(%rdx), %rax
	movq	%rax, 1088(%rsp)
	movq	480(%rdx), %rax
	movq	%rax, 1096(%rsp)
	movq	488(%rdx), %rax
	movq	%rax, 1104(%rsp)
	movq	496(%rdx), %rax
	movq	%rax, 1112(%rsp)
	movq	504(%rdx), %rax
	movq	%rax, 1120(%rsp)
	movq	512(%rdx), %rax
	movq	%rax, 1128(%rsp)
	movq	520(%rdx), %rax
	movq	%rax, 1136(%rsp)
	movq	528(%rdx), %rax
	movq	%rax, 1144(%rsp)
	movq	536(%rdx), %rax
	movq	%rax, 1152(%rsp)
	movq	544(%rdx), %rax
	movq	%rax, 1160(%rsp)
	movq	552(%rdx), %rax
	movq	%rax, 1168(%rsp)
	movq	560(%rdx), %rax
	movq	%rax, 1176(%rsp)
	movq	568(%rdx), %rax
	movq	%rax, 1184(%rsp)
	movq	576(%rdx), %rax
	movq	%rax, 1192(%rsp)
	movq	584(%rdx), %rax
	movq	%rax, 1200(%rsp)
	movq	592(%rdx), %rax
	movq	%rax, 1208(%rsp)
	movq	600(%rdx), %rax
	movq	%rax, 1216(%rsp)
	movq	608(%rdx), %rax
	movq	%rax, 1224(%rsp)
	movq	616(%rdx), %rax
	movq	%rax, 1232(%rsp)
	movq	624(%rdx), %rax
	movq	%rax, 1240(%rsp)
	movq	632(%rdx), %rax
	movq	%rax, 1248(%rsp)
	movq	640(%rdx), %rax
	movq	%rax, 1256(%rsp)
	movq	648(%rdx), %rax
	movq	%rax, 1264(%rsp)
	movq	656(%rdx), %rax
	movq	%rax, 1272(%rsp)
	movq	664(%rdx), %rax
	movq	%rax, 1280(%rsp)
	movq	672(%rdx), %rax
	movq	%rax, 1288(%rsp)
	movq	680(%rdx), %rax
	movq	%rax, 1296(%rsp)
	movq	688(%rdx), %rax
	movq	%rax, 1304(%rsp)
	movq	696(%rdx), %rax
	movq	%rax, 1312(%rsp)
	movq	704(%rdx), %rax
	movq	%rax, 1320(%rsp)
	movq	712(%rdx), %rax
	movq	%rax, 1328(%rsp)
	movq	720(%rdx), %rax
	movq	%rax, 1336(%rsp)
	movq	728(%rdx), %rax
	movq	%rax, 1344(%rsp)
	movq	736(%rdx), %rax
	movq	%rax, 1352(%rsp)
	movq	744(%rdx), %rax
	movq	%rax, 1360(%rsp)
	movq	752(%rdx), %rax
	movq	%rax, 1368(%rsp)
	movq	760(%rdx), %rax
	movq	%rax, 1376(%rsp)
	movq	768(%rdx), %rax
	movq	%rax, 1384(%rsp)
	movq	776(%rdx), %rax
	movq	%rax, 1392(%rsp)
	movq	784(%rdx), %rax
	movq	%rax, 1400(%rsp)
	movq	792(%rdx), %rax
	movq	%rax, 1408(%rsp)
	movq	800(%rdx), %rax
	movq	%rax, 1416(%rsp)
	movq	808(%rdx), %rax
	movq	%rax, 1424(%rsp)
	movq	816(%rdx), %rax
	movq	%rax, 1432(%rsp)
	movq	824(%rdx), %rax
	movq	%rax, 1440(%rsp)
	movq	832(%rdx), %rax
	movq	%rax, 1448(%rsp)
	movq	840(%rdx), %rax
	movq	%rax, 1456(%rsp)
	movq	848(%rdx), %rax
	movq	%rax, 1464(%rsp)
	movq	856(%rdx), %rax
	movq	%rax, 1472(%rsp)
	movq	864(%rdx), %rax
	movq	%rax, 1480(%rsp)
	movq	872(%rdx), %rax
	movq	%rax, 1488(%rsp)
	movq	880(%rdx), %rax
	movq	%rax, 1496(%rsp)
	movq	888(%rdx), %rax
	movq	%rax, 1504(%rsp)
	movq	896(%rdx), %rax
	movq	%rax, 1512(%rsp)
	movq	904(%rdx), %rax
	movq	%rax, 1520(%rsp)
	movq	912(%rdx), %rax
	movq	%rax, 1528(%rsp)
	movq	920(%rdx), %rax
	movq	%rax, 1536(%rsp)
	movq	928(%rdx), %rax
	movq	%rax, 1544(%rsp)
	movq	936(%rdx), %rax
	movq	%rax, 1552(%rsp)
	movq	944(%rdx), %rax
	movq	%rax, 1560(%rsp)
	movq	952(%rdx), %rax
	movq	%rax, 1568(%rsp)
	movq	960(%rdx), %rax
	movq	%rax, 1576(%rsp)
	movq	968(%rdx), %rax
	movq	%rax, 1584(%rsp)
	movq	976(%rdx), %rax
	movq	%rax, 1592(%rsp)
	movq	984(%rdx), %rax
	movq	%rax, 1600(%rsp)
	movq	992(%rdx), %rax
	movq	%rax, 1608(%rsp)
	movq	1000(%rdx), %rax
	movq	%rax, 1616(%rsp)
	movq	1008(%rdx), %rax
	movq	%rax, 1624(%rsp)
	movq	1016(%rdx), %rax
	movq	%rax, 1632(%rsp)
	movq	1024(%rdx), %rax
	movq	%rax, 1640(%rsp)
	movq	1032(%rdx), %rax
	movq	%rax, 1648(%rsp)
	movq	1040(%rdx), %rax
	movq	%rax, 1656(%rsp)
	movq	1048(%rdx), %rax
	movq	%rax, 1664(%rsp)
	movq	1056(%rdx), %rax
	movq	%rax, 1672(%rsp)
	movq	1064(%rdx), %rax
	movq	%rax, 1680(%rsp)
	movq	1072(%rdx), %rax
	movq	%rax, 1688(%rsp)
	movq	1080(%rdx), %rax
	movq	%rax, 1696(%rsp)
	movq	1088(%rdx), %rax
	movq	%rax, 1704(%rsp)
	movq	1096(%rdx), %rax
	movq	%rax, 1712(%rsp)
	movq	1104(%rdx), %rax
	movq	%rax, 1720(%rsp)
	movq	1112(%rdx), %rax
	movq	%rax, 1728(%rsp)
	movq	1120(%rdx), %rax
	movq	%rax, 1736(%rsp)
	movq	1128(%rdx), %rax
	movq	%rax, 1744(%rsp)
	movq	1136(%rdx), %rax
	movq	%rax, 1752(%rsp)
	movq	1144(%rdx), %rax
	movq	%rax, 1760(%rsp)
	movq	1152(%rdx), %rax
	movq	%rax, 1768(%rsp)
	movq	1160(%rdx), %rax
	movq	%rax, 1776(%rsp)
	movq	1168(%rdx), %rax
	movq	%rax, 1784(%rsp)
	movq	1176(%rdx), %rax
	movq	%rax, 1792(%rsp)
	movq	1184(%rdx), %rax
	movq	%rax, 1800(%rsp)
	movq	1192(%rdx), %rax
	movq	%rax, 1808(%rsp)
	movq	1200(%rdx), %rax
	movq	%rax, 1816(%rsp)
	movq	1208(%rdx), %rax
	movq	%rax, 1824(%rsp)
	movq	1216(%rdx), %rax
	movq	%rax, 1832(%rsp)
	movq	1224(%rdx), %rax
	movq	%rax, 1840(%rsp)
	movq	1232(%rdx), %rax
	movq	%rax, 1848(%rsp)
	movq	1240(%rdx), %rax
	movq	%rax, 1856(%rsp)
	movq	1248(%rdx), %rax
	movq	%rax, 1864(%rsp)
	movq	1256(%rdx), %rax
	movq	%rax, 1872(%rsp)
	movq	1264(%rdx), %rax
	movq	%rax, 1880(%rsp)
	movq	1272(%rdx), %rax
	movq	%rax, 1888(%rsp)
	movq	1280(%rdx), %rax
	movq	%rax, 1896(%rsp)
	movq	1288(%rdx), %rax
	movq	%rax, 1904(%rsp)
	movq	1296(%rdx), %rax
	movq	%rax, 1912(%rsp)
	movq	1304(%rdx), %rax
	movq	%rax, 1920(%rsp)
	movq	1312(%rdx), %rax
	movq	%rax, 1928(%rsp)
	movq	1320(%rdx), %rax
	movq	%rax, 1936(%rsp)
	movq	1328(%rdx), %rax
	movq	%rax, 1944(%rsp)
	movq	1336(%rdx), %rax
	movq	%rax, 1952(%rsp)
	movq	1344(%rdx), %rax
	movq	%rax, 1960(%rsp)
	movq	1352(%rdx), %rax
	movq	%rax, 1968(%rsp)
	movq	1360(%rdx), %rax
	movq	%rax, 1976(%rsp)
	movq	1368(%rdx), %rax
	movq	%rax, 1984(%rsp)
	movq	1376(%rdx), %rax
	movq	%rax, 1992(%rsp)
	movq	1384(%rdx), %rax
	movq	%rax, 2000(%rsp)
	movq	1392(%rdx), %rax
	movq	%rax, 2008(%rsp)
	movq	1400(%rdx), %rax
	movq	%rax, 2016(%rsp)
	movq	1408(%rdx), %rax
	movq	%rax, 2024(%rsp)
	movq	1416(%rdx), %rax
	movq	%rax, 2032(%rsp)
	movq	1424(%rdx), %rax
	movq	%rax, 2040(%rsp)
	movq	1432(%rdx), %rax
	movq	%rax, 2048(%rsp)
	movq	1440(%rdx), %rax
	movq	%rax, 2056(%rsp)
	movq	1448(%rdx), %rax
	movq	%rax, 2064(%rsp)
	movq	1456(%rdx), %rax
	movq	%rax, 2072(%rsp)
	movq	1464(%rdx), %rax
	movq	%rax, 2080(%rsp)
	movq	1472(%rdx), %rax
	movq	%rax, 2088(%rsp)
	movq	1480(%rdx), %rax
	movq	%rax, 2096(%rsp)
	movq	1488(%rdx), %rax
	movq	%rax, 2104(%rsp)
	movq	1496(%rdx), %rax
	movq	%rax, 2112(%rsp)
	movq	1504(%rdx), %rax
	movq	%rax, 2120(%rsp)
	movq	1512(%rdx), %rax
	movq	%rax, 2128(%rsp)
	movq	1520(%rdx), %rax
	movq	%rax, 2136(%rsp)
	movq	1528(%rdx), %rax
	movq	%rax, 2144(%rsp)
	movq	1536(%rdx), %rax
	movq	%rax, 2152(%rsp)
	movq	1544(%rdx), %rax
	movq	%rax, 2160(%rsp)
	movq	1552(%rdx), %rax
	movq	%rax, 2168(%rsp)
	movq	1560(%rdx), %rax
	movq	%rax, 2176(%rsp)
	movq	(%rcx), %rax
	movq	%rax, 16(%rsp)
	movq	8(%rcx), %rax
	movq	%rax, 24(%rsp)
	movq	16(%rcx), %rax
	movq	%rax, 32(%rsp)
	movq	24(%rcx), %rax
	movq	%rax, 40(%rsp)
	leaq	2184(%rsp), %rax
	leaq	616(%rsp), %rcx
	leaq	48(%rsp), %rdx
	leaq	16(%rsp), %rsi
	movq	%rcx, (%rsp)
	movq	%rdx, 8(%rsp)
	movq	(%rsi), %rdx
	movq	%rdx, 120(%rsp)
	movq	8(%rsi), %rdx
	movq	%rdx, 128(%rsp)
	movq	16(%rsi), %rdx
	movq	%rdx, 136(%rsp)
	movq	24(%rsi), %rdx
	movq	%rdx, 144(%rsp)
	leaq	152(%rsp), %rdx
	leaq	-224(%rsp), %rsp
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$381:
	leaq	224(%rsp), %rsp
	leaq	184(%rsp), %rcx
	leaq	120(%rsp), %rdx
	leaq	-216(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$380:
	leaq	216(%rsp), %rsp
	movq	(%rsp), %rcx
	leaq	120(%rsp), %rsi
	leaq	216(%rsp), %rdx
	movq	%rax, %mm2
	movq	%rcx, %rax
	leaq	5800(%rsp), %rdi
	movq	%rax, %r8
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$379:
	leaq	6312(%rsp), %rdi
	leaq	384(%rax), %r8
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$378:
	leaq	6824(%rsp), %rdi
	leaq	768(%rax), %r8
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$377:
	leaq	7336(%rsp), %rdi
	leaq	1152(%rax), %r8
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$376:
	movq	1536(%rcx), %rax
	movq	%rax, 16(%rsp)
	movq	1544(%rcx), %rax
	movq	%rax, 24(%rsp)
	movq	1552(%rcx), %rax
	movq	%rax, 32(%rsp)
	movq	1560(%rcx), %rax
	movq	%rax, 40(%rsp)
	leaq	3752(%rsp), %rax
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$375:
	movq	%rdx, %mm3
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
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$373
	movb	$0, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$374
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$373:
	movb	$0, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$374:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$372:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$359
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$360:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$371:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$361
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$363:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$369
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$370
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$369:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$370:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	13992(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$357
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$358:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$357:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$358
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$355
	movb	$0, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$356
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$355:
	movb	$1, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$356:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$354:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$341
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$342:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$353:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$343
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$345:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$351
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$351:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$352:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	14504(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$339
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$340:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$339:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$340
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$337
	movb	$0, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$338
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$337:
	movb	$2, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$338:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$336:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$323
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$324:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$335:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$325
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$327:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$333
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$333:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$334:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	15016(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$321
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$322:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$321:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$322
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$319
	movb	$0, 112(%rsp)
	movb	$3, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$320
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$319:
	movb	$3, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$320:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$318:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$305
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$306:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$317:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$307
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$309:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$315
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$315:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$316:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	15528(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$303
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$304:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$303:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$304
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$301
	movb	$1, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$302
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$301:
	movb	$0, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$302:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$300:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$287
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$288:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$299:
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
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$289
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$291:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$297
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$297:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$298:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	16040(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$285
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$286:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$285:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$286
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$283
	movb	$1, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$284
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$283:
	movb	$1, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$284:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$282:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$269
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$270:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$281:
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$279
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$279:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$280:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	16552(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$267
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$268:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$267:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$268
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$265
	movb	$1, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$266
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$265:
	movb	$2, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$266:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$264:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$251
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$252:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$263:
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$261
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$262
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$261:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$262:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	17064(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$249
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$250:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$249:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$250
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$247
	movb	$1, 112(%rsp)
	movb	$3, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$248
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$247:
	movb	$3, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$248:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$246:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$233
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$234:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$245:
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$243
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$244
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$243:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$244:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	17576(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$231
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$232:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$231:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$232
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$229
	movb	$2, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$230
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$229:
	movb	$0, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$230:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$228:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$215
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$216:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$227:
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$225
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$226
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$225:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$226:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	18088(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$213
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$214:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$213:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$214
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$211
	movb	$2, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$212
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$211:
	movb	$1, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$212:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$210:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$197
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$198:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$209:
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$207
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$208
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$207:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$208:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	18600(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$195
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$196:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$195:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$196
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$193
	movb	$2, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$194
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$193:
	movb	$2, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$194:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$192:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$179
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$180:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$191:
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$189
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$190
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$189:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$190:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	19112(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$177
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$178:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$177:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$178
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$175
	movb	$2, 112(%rsp)
	movb	$3, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$176
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$175:
	movb	$3, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$176:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$174:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$161
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$162:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$173:
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$171
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$172
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$171:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$172:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	19624(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$159
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$160:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$159:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$160
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$157
	movb	$3, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$158
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$157:
	movb	$0, 112(%rsp)
	movb	$3, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$158:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$156:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$143
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$144:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$155:
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$153
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$154
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$153:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$154:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	20136(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$141
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$142:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$141:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$142
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$139
	movb	$3, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$140
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$139:
	movb	$1, 112(%rsp)
	movb	$3, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$140:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$138:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$125
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$126:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$137:
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$135
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$136
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$135:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$136:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	20648(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$123
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$124:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$123:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$124
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$121
	movb	$3, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$122
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$121:
	movb	$2, 112(%rsp)
	movb	$3, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$122:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$120:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$107
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$108:
	movq	%rcx, %mm6
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$119:
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$117
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$118
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$117:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$118:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	21160(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$105
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$106:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$105:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$106
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$103
	movb	$3, 112(%rsp)
	movb	$3, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$104
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$103:
	movb	$3, 112(%rsp)
	movb	$3, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$104:
	leaq	416(%rsp), %rax
	leaq	80(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$102:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$89
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$90:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$101:
	movq	%mm4, %rcx
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
	movzbw	248(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	249(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	250(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$99
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$100
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$99:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 4264(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$100:
	cmpw	$3329, %r8w
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
	movw	%r8w, 4264(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	21672(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$87
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$88:
	movw	4264(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$87:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$88
	movq	%mm3, %rax
	movb	$0, %cl
	leaq	7848(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$86:
	leaq	168(%rsp), %rsp
	movb	$1, %cl
	leaq	8360(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$85:
	leaq	168(%rsp), %rsp
	movb	$2, %cl
	leaq	8872(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$84:
	leaq	168(%rsp), %rsp
	movb	$3, %cl
	leaq	9384(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$83:
	leaq	168(%rsp), %rsp
	movq	%mm3, %rax
	movb	$4, %cl
	leaq	9896(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$82:
	leaq	168(%rsp), %rsp
	movb	$5, %cl
	leaq	10408(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$81:
	leaq	168(%rsp), %rsp
	movb	$6, %cl
	leaq	10920(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$80:
	leaq	168(%rsp), %rsp
	movb	$7, %cl
	leaq	11432(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$79:
	leaq	168(%rsp), %rsp
	movb	$8, %cl
	leaq	4264(%rsp), %rdx
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$78:
	leaq	168(%rsp), %rsp
	leaq	7848(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$77:
	leaq	8360(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$76:
	leaq	8872(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$75:
	leaq	9384(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$74:
	leaq	11944(%rsp), %rsi
	leaq	13992(%rsp), %rcx
	leaq	7848(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$73:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rsi
	leaq	14504(%rsp), %rcx
	leaq	8360(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$72:
	leaq	16(%rsp), %rsp
	leaq	11944(%rsp), %rcx
	leaq	4776(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$71:
	leaq	4776(%rsp), %rsi
	leaq	15016(%rsp), %rcx
	leaq	8872(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$70:
	leaq	16(%rsp), %rsp
	leaq	11944(%rsp), %rcx
	leaq	4776(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$69:
	leaq	4776(%rsp), %rsi
	leaq	15528(%rsp), %rcx
	leaq	9384(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$68:
	leaq	16(%rsp), %rsp
	leaq	11944(%rsp), %rcx
	leaq	4776(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$67:
	leaq	11944(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$65
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$66:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$65:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$66
	leaq	12456(%rsp), %rsi
	leaq	16040(%rsp), %rcx
	leaq	7848(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$64:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rsi
	leaq	16552(%rsp), %rcx
	leaq	8360(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$63:
	leaq	16(%rsp), %rsp
	leaq	12456(%rsp), %rcx
	leaq	4776(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$62:
	leaq	4776(%rsp), %rsi
	leaq	17064(%rsp), %rcx
	leaq	8872(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$61:
	leaq	16(%rsp), %rsp
	leaq	12456(%rsp), %rcx
	leaq	4776(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$60:
	leaq	4776(%rsp), %rsi
	leaq	17576(%rsp), %rcx
	leaq	9384(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$59:
	leaq	16(%rsp), %rsp
	leaq	12456(%rsp), %rcx
	leaq	4776(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$58:
	leaq	12456(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$56
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$57:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$56:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$57
	leaq	12968(%rsp), %rsi
	leaq	18088(%rsp), %rcx
	leaq	7848(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$55:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rsi
	leaq	18600(%rsp), %rcx
	leaq	8360(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$54:
	leaq	16(%rsp), %rsp
	leaq	12968(%rsp), %rcx
	leaq	4776(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$53:
	leaq	4776(%rsp), %rsi
	leaq	19112(%rsp), %rcx
	leaq	8872(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$52:
	leaq	16(%rsp), %rsp
	leaq	12968(%rsp), %rcx
	leaq	4776(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$51:
	leaq	4776(%rsp), %rsi
	leaq	19624(%rsp), %rcx
	leaq	9384(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$50:
	leaq	16(%rsp), %rsp
	leaq	12968(%rsp), %rcx
	leaq	4776(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$49:
	leaq	12968(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$47
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$48:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$47:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$48
	leaq	13480(%rsp), %rsi
	leaq	20136(%rsp), %rcx
	leaq	7848(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$46:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rsi
	leaq	20648(%rsp), %rcx
	leaq	8360(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$45:
	leaq	16(%rsp), %rsp
	leaq	13480(%rsp), %rcx
	leaq	4776(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$44:
	leaq	4776(%rsp), %rsi
	leaq	21160(%rsp), %rcx
	leaq	8872(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$43:
	leaq	16(%rsp), %rsp
	leaq	13480(%rsp), %rcx
	leaq	4776(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$42:
	leaq	4776(%rsp), %rsi
	leaq	21672(%rsp), %rcx
	leaq	9384(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$41:
	leaq	16(%rsp), %rsp
	leaq	13480(%rsp), %rcx
	leaq	4776(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$40:
	leaq	13480(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$38
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$39:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$38:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$39
	leaq	4776(%rsp), %rsi
	leaq	5800(%rsp), %rcx
	leaq	7848(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$37:
	leaq	16(%rsp), %rsp
	leaq	5288(%rsp), %rsi
	leaq	6312(%rsp), %rcx
	leaq	8360(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$36:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rcx
	leaq	5288(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$35:
	leaq	5288(%rsp), %rsi
	leaq	6824(%rsp), %rcx
	leaq	8872(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$34:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rcx
	leaq	5288(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$33:
	leaq	5288(%rsp), %rsi
	leaq	7336(%rsp), %rcx
	leaq	9384(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$32:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rcx
	leaq	5288(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$31:
	leaq	4776(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$29
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$30:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$29:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$30
	leaq	11944(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$28:
	leaq	12456(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$27:
	leaq	12968(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$26:
	leaq	13480(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$25:
	leaq	4776(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$24:
	leaq	11944(%rsp), %rcx
	leaq	9896(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$23:
	leaq	12456(%rsp), %rcx
	leaq	10408(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$22:
	leaq	12968(%rsp), %rcx
	leaq	10920(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$21:
	leaq	13480(%rsp), %rcx
	leaq	11432(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$20:
	leaq	4776(%rsp), %rcx
	leaq	4264(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$19:
	leaq	4776(%rsp), %rcx
	leaq	3752(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$18:
	leaq	11944(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$16
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$17:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$16:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$17
	leaq	12456(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$14
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$15:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$14:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$15
	leaq	12968(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$12
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$13:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$12:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$13
	leaq	13480(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$10
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$11:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$10:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$11
	leaq	4776(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$9:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$8:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$9
	movq	%mm2, %rax
	movq	%rax, %rcx
	movq	$0, %rdx
	movq	$0, %rsi
	leaq	11944(%rsp), %rdi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$7:
	leaq	12456(%rsp), %rdi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$6:
	leaq	12968(%rsp), %rdi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$5:
	leaq	13480(%rsp), %rdi
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$4:
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$2
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$3:
	movzwq	11944(%rsp,%rdx,2), %rdi
	shlq	$11, %rdi
	addq	$1664, %rdi
	imulq	$645084, %rdi, %rdi
	shrq	$31, %rdi
	andq	$2047, %rdi
	incq	%rdx
	movzwq	11944(%rsp,%rdx,2), %r8
	shlq	$11, %r8
	addq	$1664, %r8
	imulq	$645084, %r8, %r8
	shrq	$31, %r8
	andq	$2047, %r8
	incq	%rdx
	movzwq	11944(%rsp,%rdx,2), %r9
	shlq	$11, %r9
	addq	$1664, %r9
	imulq	$645084, %r9, %r9
	shrq	$31, %r9
	andq	$2047, %r9
	incq	%rdx
	movzwq	11944(%rsp,%rdx,2), %r10
	shlq	$11, %r10
	addq	$1664, %r10
	imulq	$645084, %r10, %r10
	shrq	$31, %r10
	andq	$2047, %r10
	incq	%rdx
	movzwq	11944(%rsp,%rdx,2), %r11
	shlq	$11, %r11
	addq	$1664, %r11
	imulq	$645084, %r11, %r11
	shrq	$31, %r11
	andq	$2047, %r11
	incq	%rdx
	movzwq	11944(%rsp,%rdx,2), %rbx
	shlq	$11, %rbx
	addq	$1664, %rbx
	imulq	$645084, %rbx, %rbx
	shrq	$31, %rbx
	andq	$2047, %rbx
	incq	%rdx
	movzwq	11944(%rsp,%rdx,2), %rbp
	shlq	$11, %rbp
	addq	$1664, %rbp
	imulq	$645084, %rbp, %rbp
	shrq	$31, %rbp
	andq	$2047, %rbp
	incq	%rdx
	movzwq	11944(%rsp,%rdx,2), %r12
	shlq	$11, %r12
	addq	$1664, %r12
	imulq	$645084, %r12, %r12
	shrq	$31, %r12
	andq	$2047, %r12
	incq	%rdx
	movw	%di, %r13w
	movb	%r13b, (%rcx,%rsi)
	incq	%rsi
	shrw	$8, %di
	movw	%r8w, %r13w
	shlw	$3, %r13w
	orw 	%di, %r13w
	movb	%r13b, (%rcx,%rsi)
	incq	%rsi
	shrw	$5, %r8w
	movw	%r9w, %di
	shlw	$6, %di
	orw 	%r8w, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	movw	%r9w, %di
	shrw	$2, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	shrw	$10, %r9w
	movw	%r10w, %di
	shlw	$1, %di
	orw 	%r9w, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	shrw	$7, %r10w
	movw	%r11w, %di
	shlw	$4, %di
	orw 	%r10w, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	shrw	$4, %r11w
	movw	%bx, %di
	shlw	$7, %di
	orw 	%r11w, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	movw	%bx, %di
	shrw	$1, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	shrw	$9, %bx
	movw	%bp, %di
	shlw	$2, %di
	orw 	%bx, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	shrw	$6, %bp
	movw	%r12w, %di
	shlw	$5, %di
	orw 	%bp, %di
	movb	%dil, (%rcx,%rsi)
	incq	%rsi
	shrw	$3, %r12w
	movb	%r12b, (%rcx,%rsi)
	incq	%rsi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$2:
	cmpq	$1024, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$3
	leaq	1408(%rax), %rax
	leaq	4776(%rsp), %rdi
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$1:
	movq	8(%rsp), %rax
	movq	184(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	192(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	200(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	208(%rsp), %rcx
	movq	%rcx, 24(%rax)
	movq	%mm0, %rax
	movq	%mm1, %rcx
	movq	2184(%rsp), %rdx
	movq	%rdx, (%rax)
	movq	2192(%rsp), %rdx
	movq	%rdx, 8(%rax)
	movq	2200(%rsp), %rdx
	movq	%rdx, 16(%rax)
	movq	2208(%rsp), %rdx
	movq	%rdx, 24(%rax)
	movq	2216(%rsp), %rdx
	movq	%rdx, 32(%rax)
	movq	2224(%rsp), %rdx
	movq	%rdx, 40(%rax)
	movq	2232(%rsp), %rdx
	movq	%rdx, 48(%rax)
	movq	2240(%rsp), %rdx
	movq	%rdx, 56(%rax)
	movq	2248(%rsp), %rdx
	movq	%rdx, 64(%rax)
	movq	2256(%rsp), %rdx
	movq	%rdx, 72(%rax)
	movq	2264(%rsp), %rdx
	movq	%rdx, 80(%rax)
	movq	2272(%rsp), %rdx
	movq	%rdx, 88(%rax)
	movq	2280(%rsp), %rdx
	movq	%rdx, 96(%rax)
	movq	2288(%rsp), %rdx
	movq	%rdx, 104(%rax)
	movq	2296(%rsp), %rdx
	movq	%rdx, 112(%rax)
	movq	2304(%rsp), %rdx
	movq	%rdx, 120(%rax)
	movq	2312(%rsp), %rdx
	movq	%rdx, 128(%rax)
	movq	2320(%rsp), %rdx
	movq	%rdx, 136(%rax)
	movq	2328(%rsp), %rdx
	movq	%rdx, 144(%rax)
	movq	2336(%rsp), %rdx
	movq	%rdx, 152(%rax)
	movq	2344(%rsp), %rdx
	movq	%rdx, 160(%rax)
	movq	2352(%rsp), %rdx
	movq	%rdx, 168(%rax)
	movq	2360(%rsp), %rdx
	movq	%rdx, 176(%rax)
	movq	2368(%rsp), %rdx
	movq	%rdx, 184(%rax)
	movq	2376(%rsp), %rdx
	movq	%rdx, 192(%rax)
	movq	2384(%rsp), %rdx
	movq	%rdx, 200(%rax)
	movq	2392(%rsp), %rdx
	movq	%rdx, 208(%rax)
	movq	2400(%rsp), %rdx
	movq	%rdx, 216(%rax)
	movq	2408(%rsp), %rdx
	movq	%rdx, 224(%rax)
	movq	2416(%rsp), %rdx
	movq	%rdx, 232(%rax)
	movq	2424(%rsp), %rdx
	movq	%rdx, 240(%rax)
	movq	2432(%rsp), %rdx
	movq	%rdx, 248(%rax)
	movq	2440(%rsp), %rdx
	movq	%rdx, 256(%rax)
	movq	2448(%rsp), %rdx
	movq	%rdx, 264(%rax)
	movq	2456(%rsp), %rdx
	movq	%rdx, 272(%rax)
	movq	2464(%rsp), %rdx
	movq	%rdx, 280(%rax)
	movq	2472(%rsp), %rdx
	movq	%rdx, 288(%rax)
	movq	2480(%rsp), %rdx
	movq	%rdx, 296(%rax)
	movq	2488(%rsp), %rdx
	movq	%rdx, 304(%rax)
	movq	2496(%rsp), %rdx
	movq	%rdx, 312(%rax)
	movq	2504(%rsp), %rdx
	movq	%rdx, 320(%rax)
	movq	2512(%rsp), %rdx
	movq	%rdx, 328(%rax)
	movq	2520(%rsp), %rdx
	movq	%rdx, 336(%rax)
	movq	2528(%rsp), %rdx
	movq	%rdx, 344(%rax)
	movq	2536(%rsp), %rdx
	movq	%rdx, 352(%rax)
	movq	2544(%rsp), %rdx
	movq	%rdx, 360(%rax)
	movq	2552(%rsp), %rdx
	movq	%rdx, 368(%rax)
	movq	2560(%rsp), %rdx
	movq	%rdx, 376(%rax)
	movq	2568(%rsp), %rdx
	movq	%rdx, 384(%rax)
	movq	2576(%rsp), %rdx
	movq	%rdx, 392(%rax)
	movq	2584(%rsp), %rdx
	movq	%rdx, 400(%rax)
	movq	2592(%rsp), %rdx
	movq	%rdx, 408(%rax)
	movq	2600(%rsp), %rdx
	movq	%rdx, 416(%rax)
	movq	2608(%rsp), %rdx
	movq	%rdx, 424(%rax)
	movq	2616(%rsp), %rdx
	movq	%rdx, 432(%rax)
	movq	2624(%rsp), %rdx
	movq	%rdx, 440(%rax)
	movq	2632(%rsp), %rdx
	movq	%rdx, 448(%rax)
	movq	2640(%rsp), %rdx
	movq	%rdx, 456(%rax)
	movq	2648(%rsp), %rdx
	movq	%rdx, 464(%rax)
	movq	2656(%rsp), %rdx
	movq	%rdx, 472(%rax)
	movq	2664(%rsp), %rdx
	movq	%rdx, 480(%rax)
	movq	2672(%rsp), %rdx
	movq	%rdx, 488(%rax)
	movq	2680(%rsp), %rdx
	movq	%rdx, 496(%rax)
	movq	2688(%rsp), %rdx
	movq	%rdx, 504(%rax)
	movq	2696(%rsp), %rdx
	movq	%rdx, 512(%rax)
	movq	2704(%rsp), %rdx
	movq	%rdx, 520(%rax)
	movq	2712(%rsp), %rdx
	movq	%rdx, 528(%rax)
	movq	2720(%rsp), %rdx
	movq	%rdx, 536(%rax)
	movq	2728(%rsp), %rdx
	movq	%rdx, 544(%rax)
	movq	2736(%rsp), %rdx
	movq	%rdx, 552(%rax)
	movq	2744(%rsp), %rdx
	movq	%rdx, 560(%rax)
	movq	2752(%rsp), %rdx
	movq	%rdx, 568(%rax)
	movq	2760(%rsp), %rdx
	movq	%rdx, 576(%rax)
	movq	2768(%rsp), %rdx
	movq	%rdx, 584(%rax)
	movq	2776(%rsp), %rdx
	movq	%rdx, 592(%rax)
	movq	2784(%rsp), %rdx
	movq	%rdx, 600(%rax)
	movq	2792(%rsp), %rdx
	movq	%rdx, 608(%rax)
	movq	2800(%rsp), %rdx
	movq	%rdx, 616(%rax)
	movq	2808(%rsp), %rdx
	movq	%rdx, 624(%rax)
	movq	2816(%rsp), %rdx
	movq	%rdx, 632(%rax)
	movq	2824(%rsp), %rdx
	movq	%rdx, 640(%rax)
	movq	2832(%rsp), %rdx
	movq	%rdx, 648(%rax)
	movq	2840(%rsp), %rdx
	movq	%rdx, 656(%rax)
	movq	2848(%rsp), %rdx
	movq	%rdx, 664(%rax)
	movq	2856(%rsp), %rdx
	movq	%rdx, 672(%rax)
	movq	2864(%rsp), %rdx
	movq	%rdx, 680(%rax)
	movq	2872(%rsp), %rdx
	movq	%rdx, 688(%rax)
	movq	2880(%rsp), %rdx
	movq	%rdx, 696(%rax)
	movq	2888(%rsp), %rdx
	movq	%rdx, 704(%rax)
	movq	2896(%rsp), %rdx
	movq	%rdx, 712(%rax)
	movq	2904(%rsp), %rdx
	movq	%rdx, 720(%rax)
	movq	2912(%rsp), %rdx
	movq	%rdx, 728(%rax)
	movq	2920(%rsp), %rdx
	movq	%rdx, 736(%rax)
	movq	2928(%rsp), %rdx
	movq	%rdx, 744(%rax)
	movq	2936(%rsp), %rdx
	movq	%rdx, 752(%rax)
	movq	2944(%rsp), %rdx
	movq	%rdx, 760(%rax)
	movq	2952(%rsp), %rdx
	movq	%rdx, 768(%rax)
	movq	2960(%rsp), %rdx
	movq	%rdx, 776(%rax)
	movq	2968(%rsp), %rdx
	movq	%rdx, 784(%rax)
	movq	2976(%rsp), %rdx
	movq	%rdx, 792(%rax)
	movq	2984(%rsp), %rdx
	movq	%rdx, 800(%rax)
	movq	2992(%rsp), %rdx
	movq	%rdx, 808(%rax)
	movq	3000(%rsp), %rdx
	movq	%rdx, 816(%rax)
	movq	3008(%rsp), %rdx
	movq	%rdx, 824(%rax)
	movq	3016(%rsp), %rdx
	movq	%rdx, 832(%rax)
	movq	3024(%rsp), %rdx
	movq	%rdx, 840(%rax)
	movq	3032(%rsp), %rdx
	movq	%rdx, 848(%rax)
	movq	3040(%rsp), %rdx
	movq	%rdx, 856(%rax)
	movq	3048(%rsp), %rdx
	movq	%rdx, 864(%rax)
	movq	3056(%rsp), %rdx
	movq	%rdx, 872(%rax)
	movq	3064(%rsp), %rdx
	movq	%rdx, 880(%rax)
	movq	3072(%rsp), %rdx
	movq	%rdx, 888(%rax)
	movq	3080(%rsp), %rdx
	movq	%rdx, 896(%rax)
	movq	3088(%rsp), %rdx
	movq	%rdx, 904(%rax)
	movq	3096(%rsp), %rdx
	movq	%rdx, 912(%rax)
	movq	3104(%rsp), %rdx
	movq	%rdx, 920(%rax)
	movq	3112(%rsp), %rdx
	movq	%rdx, 928(%rax)
	movq	3120(%rsp), %rdx
	movq	%rdx, 936(%rax)
	movq	3128(%rsp), %rdx
	movq	%rdx, 944(%rax)
	movq	3136(%rsp), %rdx
	movq	%rdx, 952(%rax)
	movq	3144(%rsp), %rdx
	movq	%rdx, 960(%rax)
	movq	3152(%rsp), %rdx
	movq	%rdx, 968(%rax)
	movq	3160(%rsp), %rdx
	movq	%rdx, 976(%rax)
	movq	3168(%rsp), %rdx
	movq	%rdx, 984(%rax)
	movq	3176(%rsp), %rdx
	movq	%rdx, 992(%rax)
	movq	3184(%rsp), %rdx
	movq	%rdx, 1000(%rax)
	movq	3192(%rsp), %rdx
	movq	%rdx, 1008(%rax)
	movq	3200(%rsp), %rdx
	movq	%rdx, 1016(%rax)
	movq	3208(%rsp), %rdx
	movq	%rdx, 1024(%rax)
	movq	3216(%rsp), %rdx
	movq	%rdx, 1032(%rax)
	movq	3224(%rsp), %rdx
	movq	%rdx, 1040(%rax)
	movq	3232(%rsp), %rdx
	movq	%rdx, 1048(%rax)
	movq	3240(%rsp), %rdx
	movq	%rdx, 1056(%rax)
	movq	3248(%rsp), %rdx
	movq	%rdx, 1064(%rax)
	movq	3256(%rsp), %rdx
	movq	%rdx, 1072(%rax)
	movq	3264(%rsp), %rdx
	movq	%rdx, 1080(%rax)
	movq	3272(%rsp), %rdx
	movq	%rdx, 1088(%rax)
	movq	3280(%rsp), %rdx
	movq	%rdx, 1096(%rax)
	movq	3288(%rsp), %rdx
	movq	%rdx, 1104(%rax)
	movq	3296(%rsp), %rdx
	movq	%rdx, 1112(%rax)
	movq	3304(%rsp), %rdx
	movq	%rdx, 1120(%rax)
	movq	3312(%rsp), %rdx
	movq	%rdx, 1128(%rax)
	movq	3320(%rsp), %rdx
	movq	%rdx, 1136(%rax)
	movq	3328(%rsp), %rdx
	movq	%rdx, 1144(%rax)
	movq	3336(%rsp), %rdx
	movq	%rdx, 1152(%rax)
	movq	3344(%rsp), %rdx
	movq	%rdx, 1160(%rax)
	movq	3352(%rsp), %rdx
	movq	%rdx, 1168(%rax)
	movq	3360(%rsp), %rdx
	movq	%rdx, 1176(%rax)
	movq	3368(%rsp), %rdx
	movq	%rdx, 1184(%rax)
	movq	3376(%rsp), %rdx
	movq	%rdx, 1192(%rax)
	movq	3384(%rsp), %rdx
	movq	%rdx, 1200(%rax)
	movq	3392(%rsp), %rdx
	movq	%rdx, 1208(%rax)
	movq	3400(%rsp), %rdx
	movq	%rdx, 1216(%rax)
	movq	3408(%rsp), %rdx
	movq	%rdx, 1224(%rax)
	movq	3416(%rsp), %rdx
	movq	%rdx, 1232(%rax)
	movq	3424(%rsp), %rdx
	movq	%rdx, 1240(%rax)
	movq	3432(%rsp), %rdx
	movq	%rdx, 1248(%rax)
	movq	3440(%rsp), %rdx
	movq	%rdx, 1256(%rax)
	movq	3448(%rsp), %rdx
	movq	%rdx, 1264(%rax)
	movq	3456(%rsp), %rdx
	movq	%rdx, 1272(%rax)
	movq	3464(%rsp), %rdx
	movq	%rdx, 1280(%rax)
	movq	3472(%rsp), %rdx
	movq	%rdx, 1288(%rax)
	movq	3480(%rsp), %rdx
	movq	%rdx, 1296(%rax)
	movq	3488(%rsp), %rdx
	movq	%rdx, 1304(%rax)
	movq	3496(%rsp), %rdx
	movq	%rdx, 1312(%rax)
	movq	3504(%rsp), %rdx
	movq	%rdx, 1320(%rax)
	movq	3512(%rsp), %rdx
	movq	%rdx, 1328(%rax)
	movq	3520(%rsp), %rdx
	movq	%rdx, 1336(%rax)
	movq	3528(%rsp), %rdx
	movq	%rdx, 1344(%rax)
	movq	3536(%rsp), %rdx
	movq	%rdx, 1352(%rax)
	movq	3544(%rsp), %rdx
	movq	%rdx, 1360(%rax)
	movq	3552(%rsp), %rdx
	movq	%rdx, 1368(%rax)
	movq	3560(%rsp), %rdx
	movq	%rdx, 1376(%rax)
	movq	3568(%rsp), %rdx
	movq	%rdx, 1384(%rax)
	movq	3576(%rsp), %rdx
	movq	%rdx, 1392(%rax)
	movq	3584(%rsp), %rdx
	movq	%rdx, 1400(%rax)
	movq	3592(%rsp), %rdx
	movq	%rdx, 1408(%rax)
	movq	3600(%rsp), %rdx
	movq	%rdx, 1416(%rax)
	movq	3608(%rsp), %rdx
	movq	%rdx, 1424(%rax)
	movq	3616(%rsp), %rdx
	movq	%rdx, 1432(%rax)
	movq	3624(%rsp), %rdx
	movq	%rdx, 1440(%rax)
	movq	3632(%rsp), %rdx
	movq	%rdx, 1448(%rax)
	movq	3640(%rsp), %rdx
	movq	%rdx, 1456(%rax)
	movq	3648(%rsp), %rdx
	movq	%rdx, 1464(%rax)
	movq	3656(%rsp), %rdx
	movq	%rdx, 1472(%rax)
	movq	3664(%rsp), %rdx
	movq	%rdx, 1480(%rax)
	movq	3672(%rsp), %rdx
	movq	%rdx, 1488(%rax)
	movq	3680(%rsp), %rdx
	movq	%rdx, 1496(%rax)
	movq	3688(%rsp), %rdx
	movq	%rdx, 1504(%rax)
	movq	3696(%rsp), %rdx
	movq	%rdx, 1512(%rax)
	movq	3704(%rsp), %rdx
	movq	%rdx, 1520(%rax)
	movq	3712(%rsp), %rdx
	movq	%rdx, 1528(%rax)
	movq	3720(%rsp), %rdx
	movq	%rdx, 1536(%rax)
	movq	3728(%rsp), %rdx
	movq	%rdx, 1544(%rax)
	movq	3736(%rsp), %rdx
	movq	%rdx, 1552(%rax)
	movq	3744(%rsp), %rdx
	movq	%rdx, 1560(%rax)
	movq	48(%rsp), %rax
	movq	%rax, (%rcx)
	movq	56(%rsp), %rax
	movq	%rax, 8(%rcx)
	movq	64(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	72(%rsp), %rax
	movq	%rax, 24(%rcx)
	xorq	%rax, %rax
	movq	22184(%rsp), %rbx
	movq	22192(%rsp), %rbp
	movq	22200(%rsp), %r12
	movq	22208(%rsp), %r13
	movq	22216(%rsp), %r14
	movq	22224(%rsp), %r15
	movq	22232(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand:
jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand:
	movq	%rsp, %rax
	leaq	-20288(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 20232(%rsp)
	movq	%rbp, 20240(%rsp)
	movq	%r12, 20248(%rsp)
	movq	%r13, 20256(%rsp)
	movq	%r14, 20264(%rsp)
	movq	%r15, 20272(%rsp)
	movq	%rax, 20280(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm0
	movq	%rsi, %mm1
	movq	(%rdx), %rax
	movq	%rax, 152(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 160(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 168(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 176(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 184(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 192(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 200(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 208(%rsp)
	leaq	648(%rsp), %rax
	leaq	2216(%rsp), %rcx
	leaq	152(%rsp), %rdx
	movq	%rdx, %mm2
	movq	%rax, %mm3
	movq	%rcx, %mm4
	movq	(%rdx), %rax
	movq	%rax, 72(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 80(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 88(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 96(%rsp)
	movb	$4, 104(%rsp)
	leaq	216(%rsp), %rax
	leaq	72(%rsp), %rcx
	leaq	-216(%rsp), %rsp
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$366:
	leaq	216(%rsp), %rsp
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
	movq	240(%rsp), %rax
	movq	%rax, 64(%rsp)
	movq	272(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	$0, %rax
	movq	%rax, %mm6
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
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$364
	movb	$0, 144(%rsp)
	movb	$0, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$365
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$364:
	movb	$0, 144(%rsp)
	movb	$0, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$365:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$363:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$350
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$351:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$362:
	movq	%mm7, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$353:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$354
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$354:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$360
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$361
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$360:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$361:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	12040(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$348
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$349:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$348:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$349
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$346
	movb	$0, 144(%rsp)
	movb	$1, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$347
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$346:
	movb	$1, 144(%rsp)
	movb	$0, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$347:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$345:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$332
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$333:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$344:
	movq	%mm7, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$335:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$336
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$336:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$342
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$343
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$342:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$343:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	12552(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$330
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$331:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$330:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$331
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$328
	movb	$0, 144(%rsp)
	movb	$2, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$329
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$328:
	movb	$2, 144(%rsp)
	movb	$0, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$329:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$327:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$314
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$315:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$326:
	movq	%mm7, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$317:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$318
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$318:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$324
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$325
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$324:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$325:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	13064(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$312
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$313:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$312:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$313
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$310
	movb	$0, 144(%rsp)
	movb	$3, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$311
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$310:
	movb	$3, 144(%rsp)
	movb	$0, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$311:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$309:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$296
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$297:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$308:
	movq	%mm7, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$299:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$300
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$300:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$306
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$307
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$306:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$307:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	13576(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$294
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$295:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$294:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$295
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$292
	movb	$1, 144(%rsp)
	movb	$0, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$293
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$292:
	movb	$0, 144(%rsp)
	movb	$1, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$293:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$291:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$278
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$279:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$290:
	movq	%mm7, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$281:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$282
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$282:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$288
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$289
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$288:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$289:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	14088(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$276
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$277:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$276:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$277
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$274
	movb	$1, 144(%rsp)
	movb	$1, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$275
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$274:
	movb	$1, 144(%rsp)
	movb	$1, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$275:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$273:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$260
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$261:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$272:
	movq	%mm7, %rcx
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
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$270
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$271
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$270:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$271:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	14600(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$258
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$259:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$258:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$259
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$256
	movb	$1, 144(%rsp)
	movb	$2, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$257
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$256:
	movb	$2, 144(%rsp)
	movb	$1, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$257:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$255:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$242
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$243:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$254:
	movq	%mm7, %rcx
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
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$252
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$253
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$252:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$253:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	15112(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$240
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$241:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$240:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$241
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$238
	movb	$1, 144(%rsp)
	movb	$3, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$239
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$238:
	movb	$3, 144(%rsp)
	movb	$1, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$239:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$237:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$224
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$225:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$236:
	movq	%mm7, %rcx
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
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$234
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$235
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$234:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$235:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	15624(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$222
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$223:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$222:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$223
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$220
	movb	$2, 144(%rsp)
	movb	$0, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$221
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$220:
	movb	$0, 144(%rsp)
	movb	$2, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$221:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$219:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$206
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$207:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$218:
	movq	%mm7, %rcx
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
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$216
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$217
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$216:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$217:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	16136(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$204
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$205:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$204:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$205
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$202
	movb	$2, 144(%rsp)
	movb	$1, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$203
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$202:
	movb	$1, 144(%rsp)
	movb	$2, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$203:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$201:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$188
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$189:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$200:
	movq	%mm7, %rcx
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
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$198
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$199
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$198:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$199:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	16648(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$186
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$187:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$186:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$187
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$184
	movb	$2, 144(%rsp)
	movb	$2, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$185
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$184:
	movb	$2, 144(%rsp)
	movb	$2, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$185:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$183:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$170
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$171:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$182:
	movq	%mm7, %rcx
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
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$180
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$181
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$180:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$181:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	17160(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$168
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$169:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$168:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$169
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$166
	movb	$2, 144(%rsp)
	movb	$3, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$167
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$166:
	movb	$3, 144(%rsp)
	movb	$2, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$167:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$165:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$152
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$153:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$164:
	movq	%mm7, %rcx
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
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$162
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$163
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$162:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$163:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	17672(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$150
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$151:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$150:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$151
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$148
	movb	$3, 144(%rsp)
	movb	$0, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$149
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$148:
	movb	$0, 144(%rsp)
	movb	$3, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$149:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$147:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$134
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$135:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$146:
	movq	%mm7, %rcx
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
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$144
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$145
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$144:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$145:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	18184(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$132
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$133:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$132:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$133
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$130
	movb	$3, 144(%rsp)
	movb	$1, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$131
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$130:
	movb	$1, 144(%rsp)
	movb	$3, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$131:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$129:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$116
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$117:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$128:
	movq	%mm7, %rcx
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
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$126
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$127
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$126:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$127:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	18696(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$114
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$115:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$114:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$115
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$112
	movb	$3, 144(%rsp)
	movb	$2, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$113
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$112:
	movb	$2, 144(%rsp)
	movb	$3, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$113:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$111:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$98
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$99:
	movq	%rcx, %mm7
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$110:
	movq	%mm7, %rcx
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
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$108
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$109
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$108:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$109:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	19208(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$96
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$97:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$96:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$97
	movq	%mm6, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$94
	movb	$3, 144(%rsp)
	movb	$3, 145(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$95
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$94:
	movb	$3, 144(%rsp)
	movb	$3, 145(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$95:
	leaq	448(%rsp), %rax
	leaq	112(%rsp), %rcx
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$93:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$80
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$81:
	movq	%rcx, %mm6
	leaq	448(%rsp), %r15
	leaq	280(%rsp), %rax
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$92:
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
	movzbw	280(%rsp,%rdx), %si
	orw 	%ax, %si
	movzbw	281(%rsp,%rdx), %di
	orw 	%ax, %di
	movw	%di, %r8w
	shrw	$4, %r8w
	andw	$15, %di
	shlw	$8, %di
	orw 	%di, %si
	movzbw	282(%rsp,%rdx), %di
	orw 	%ax, %di
	shlw	$4, %di
	orw 	%di, %r8w
	addq	$3, %rdx
	cmpw	$3329, %si
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$90
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$91
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$90:
	movq	$-1, %rdi
	cmovnb	%rdi, %rax
	movw	%si, 5384(%rsp,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$91:
	cmpw	$3329, %r8w
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
	movw	%r8w, 5384(%rsp,%rcx,2)
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
	movq	$0, %rax
	leaq	19720(%rsp), %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$78
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$79:
	movw	5384(%rsp,%rax,2), %dx
	movw	%dx, (%rcx,%rax,2)
	incq	%rax
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$78:
	cmpq	$256, %rax
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$79
	movb	$0, %cl
	leaq	5896(%rsp), %rdx
	leaq	8(%rsp), %rax
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$77:
	leaq	168(%rsp), %rsp
	movb	$1, %cl
	leaq	6408(%rsp), %rdx
	leaq	8(%rsp), %rax
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$76:
	leaq	168(%rsp), %rsp
	movb	$2, %cl
	leaq	6920(%rsp), %rdx
	leaq	8(%rsp), %rax
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$75:
	leaq	168(%rsp), %rsp
	movb	$3, %cl
	leaq	7432(%rsp), %rdx
	leaq	8(%rsp), %rax
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$74:
	leaq	168(%rsp), %rsp
	movb	$4, %cl
	leaq	7944(%rsp), %rdx
	leaq	8(%rsp), %rax
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$73:
	leaq	168(%rsp), %rsp
	movb	$5, %cl
	leaq	8456(%rsp), %rdx
	leaq	8(%rsp), %rax
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$72:
	leaq	168(%rsp), %rsp
	movb	$6, %cl
	leaq	8968(%rsp), %rdx
	leaq	8(%rsp), %rax
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$71:
	leaq	168(%rsp), %rsp
	movb	$7, %cl
	leaq	9480(%rsp), %rdx
	leaq	8(%rsp), %rax
	leaq	-168(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$70:
	leaq	168(%rsp), %rsp
	leaq	5896(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$69:
	leaq	6408(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$68:
	leaq	6920(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$67:
	leaq	7432(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$66:
	leaq	7944(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$65:
	leaq	8456(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$64:
	leaq	8968(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$63:
	leaq	9480(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$62:
	leaq	9992(%rsp), %rsi
	leaq	12040(%rsp), %rcx
	leaq	5896(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$61:
	leaq	16(%rsp), %rsp
	leaq	5384(%rsp), %rsi
	leaq	12552(%rsp), %rcx
	leaq	6408(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$60:
	leaq	16(%rsp), %rsp
	leaq	9992(%rsp), %rcx
	leaq	5384(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$59:
	leaq	5384(%rsp), %rsi
	leaq	13064(%rsp), %rcx
	leaq	6920(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$58:
	leaq	16(%rsp), %rsp
	leaq	9992(%rsp), %rcx
	leaq	5384(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$57:
	leaq	5384(%rsp), %rsi
	leaq	13576(%rsp), %rcx
	leaq	7432(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$56:
	leaq	16(%rsp), %rsp
	leaq	9992(%rsp), %rcx
	leaq	5384(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$55:
	leaq	9992(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$53
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$54:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$53:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$54
	leaq	9992(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$52:
	leaq	10504(%rsp), %rsi
	leaq	14088(%rsp), %rcx
	leaq	5896(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$51:
	leaq	16(%rsp), %rsp
	leaq	5384(%rsp), %rsi
	leaq	14600(%rsp), %rcx
	leaq	6408(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$50:
	leaq	16(%rsp), %rsp
	leaq	10504(%rsp), %rcx
	leaq	5384(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$49:
	leaq	5384(%rsp), %rsi
	leaq	15112(%rsp), %rcx
	leaq	6920(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$48:
	leaq	16(%rsp), %rsp
	leaq	10504(%rsp), %rcx
	leaq	5384(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$47:
	leaq	5384(%rsp), %rsi
	leaq	15624(%rsp), %rcx
	leaq	7432(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$46:
	leaq	16(%rsp), %rsp
	leaq	10504(%rsp), %rcx
	leaq	5384(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$45:
	leaq	10504(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$43
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$44:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$43:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$44
	leaq	10504(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$42:
	leaq	11016(%rsp), %rsi
	leaq	16136(%rsp), %rcx
	leaq	5896(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$41:
	leaq	16(%rsp), %rsp
	leaq	5384(%rsp), %rsi
	leaq	16648(%rsp), %rcx
	leaq	6408(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$40:
	leaq	16(%rsp), %rsp
	leaq	11016(%rsp), %rcx
	leaq	5384(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$39:
	leaq	5384(%rsp), %rsi
	leaq	17160(%rsp), %rcx
	leaq	6920(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$38:
	leaq	16(%rsp), %rsp
	leaq	11016(%rsp), %rcx
	leaq	5384(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$37:
	leaq	5384(%rsp), %rsi
	leaq	17672(%rsp), %rcx
	leaq	7432(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$36:
	leaq	16(%rsp), %rsp
	leaq	11016(%rsp), %rcx
	leaq	5384(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$35:
	leaq	11016(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$33
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$34:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$33:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$34
	leaq	11016(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$32:
	leaq	11528(%rsp), %rsi
	leaq	18184(%rsp), %rcx
	leaq	5896(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$31:
	leaq	16(%rsp), %rsp
	leaq	5384(%rsp), %rsi
	leaq	18696(%rsp), %rcx
	leaq	6408(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$30:
	leaq	16(%rsp), %rsp
	leaq	11528(%rsp), %rcx
	leaq	5384(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$29:
	leaq	5384(%rsp), %rsi
	leaq	19208(%rsp), %rcx
	leaq	6920(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$28:
	leaq	16(%rsp), %rsp
	leaq	11528(%rsp), %rcx
	leaq	5384(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$27:
	leaq	5384(%rsp), %rsi
	leaq	19720(%rsp), %rcx
	leaq	7432(%rsp), %rdx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$26:
	leaq	16(%rsp), %rsp
	leaq	11528(%rsp), %rcx
	leaq	5384(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$25:
	leaq	11528(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$23
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$24:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$23:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$24
	leaq	11528(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$22:
	leaq	9992(%rsp), %rcx
	leaq	7944(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$21:
	leaq	10504(%rsp), %rcx
	leaq	8456(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$20:
	leaq	11016(%rsp), %rcx
	leaq	8968(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$19:
	leaq	11528(%rsp), %rcx
	leaq	9480(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$18:
	leaq	9992(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$16
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$17:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$16:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$17
	leaq	10504(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$14
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$15:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$14:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$15
	leaq	11016(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$12
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$13:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$12:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$13
	leaq	11528(%rsp), %rax
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$10
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$11:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	incq	%rcx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$10:
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$11
	movq	%mm3, %rcx
	movq	%mm4, %rax
	movq	%rax, %rdx
	movq	%rdx, %rsi
	leaq	5896(%rsp), %rdi
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$9:
	leaq	384(%rdx), %rsi
	leaq	6408(%rsp), %rdi
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$8:
	leaq	768(%rdx), %rsi
	leaq	6920(%rsp), %rdi
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$7:
	leaq	1152(%rdx), %rsi
	leaq	7432(%rsp), %rdi
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$6:
	movq	%rcx, %rdx
	movq	%rdx, %rsi
	leaq	9992(%rsp), %rdi
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$5:
	leaq	384(%rdx), %rsi
	leaq	10504(%rsp), %rdi
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$4:
	leaq	768(%rdx), %rsi
	leaq	11016(%rsp), %rdi
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$3:
	leaq	1152(%rdx), %rsi
	leaq	11528(%rsp), %rdi
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$2:
	movq	40(%rsp), %rdx
	movq	%rdx, 1536(%rcx)
	movq	48(%rsp), %rdx
	movq	%rdx, 1544(%rcx)
	movq	56(%rsp), %rdx
	movq	%rdx, 1552(%rcx)
	movq	64(%rsp), %rdx
	movq	%rdx, 1560(%rcx)
	movq	(%rcx), %rdx
	movq	%rdx, 1536(%rax)
	movq	8(%rcx), %rdx
	movq	%rdx, 1544(%rax)
	movq	16(%rcx), %rdx
	movq	%rdx, 1552(%rax)
	movq	24(%rcx), %rdx
	movq	%rdx, 1560(%rax)
	movq	32(%rcx), %rdx
	movq	%rdx, 1568(%rax)
	movq	40(%rcx), %rdx
	movq	%rdx, 1576(%rax)
	movq	48(%rcx), %rdx
	movq	%rdx, 1584(%rax)
	movq	56(%rcx), %rdx
	movq	%rdx, 1592(%rax)
	movq	64(%rcx), %rdx
	movq	%rdx, 1600(%rax)
	movq	72(%rcx), %rdx
	movq	%rdx, 1608(%rax)
	movq	80(%rcx), %rdx
	movq	%rdx, 1616(%rax)
	movq	88(%rcx), %rdx
	movq	%rdx, 1624(%rax)
	movq	96(%rcx), %rdx
	movq	%rdx, 1632(%rax)
	movq	104(%rcx), %rdx
	movq	%rdx, 1640(%rax)
	movq	112(%rcx), %rdx
	movq	%rdx, 1648(%rax)
	movq	120(%rcx), %rdx
	movq	%rdx, 1656(%rax)
	movq	128(%rcx), %rdx
	movq	%rdx, 1664(%rax)
	movq	136(%rcx), %rdx
	movq	%rdx, 1672(%rax)
	movq	144(%rcx), %rdx
	movq	%rdx, 1680(%rax)
	movq	152(%rcx), %rdx
	movq	%rdx, 1688(%rax)
	movq	160(%rcx), %rdx
	movq	%rdx, 1696(%rax)
	movq	168(%rcx), %rdx
	movq	%rdx, 1704(%rax)
	movq	176(%rcx), %rdx
	movq	%rdx, 1712(%rax)
	movq	184(%rcx), %rdx
	movq	%rdx, 1720(%rax)
	movq	192(%rcx), %rdx
	movq	%rdx, 1728(%rax)
	movq	200(%rcx), %rdx
	movq	%rdx, 1736(%rax)
	movq	208(%rcx), %rdx
	movq	%rdx, 1744(%rax)
	movq	216(%rcx), %rdx
	movq	%rdx, 1752(%rax)
	movq	224(%rcx), %rdx
	movq	%rdx, 1760(%rax)
	movq	232(%rcx), %rdx
	movq	%rdx, 1768(%rax)
	movq	240(%rcx), %rdx
	movq	%rdx, 1776(%rax)
	movq	248(%rcx), %rdx
	movq	%rdx, 1784(%rax)
	movq	256(%rcx), %rdx
	movq	%rdx, 1792(%rax)
	movq	264(%rcx), %rdx
	movq	%rdx, 1800(%rax)
	movq	272(%rcx), %rdx
	movq	%rdx, 1808(%rax)
	movq	280(%rcx), %rdx
	movq	%rdx, 1816(%rax)
	movq	288(%rcx), %rdx
	movq	%rdx, 1824(%rax)
	movq	296(%rcx), %rdx
	movq	%rdx, 1832(%rax)
	movq	304(%rcx), %rdx
	movq	%rdx, 1840(%rax)
	movq	312(%rcx), %rdx
	movq	%rdx, 1848(%rax)
	movq	320(%rcx), %rdx
	movq	%rdx, 1856(%rax)
	movq	328(%rcx), %rdx
	movq	%rdx, 1864(%rax)
	movq	336(%rcx), %rdx
	movq	%rdx, 1872(%rax)
	movq	344(%rcx), %rdx
	movq	%rdx, 1880(%rax)
	movq	352(%rcx), %rdx
	movq	%rdx, 1888(%rax)
	movq	360(%rcx), %rdx
	movq	%rdx, 1896(%rax)
	movq	368(%rcx), %rdx
	movq	%rdx, 1904(%rax)
	movq	376(%rcx), %rdx
	movq	%rdx, 1912(%rax)
	movq	384(%rcx), %rdx
	movq	%rdx, 1920(%rax)
	movq	392(%rcx), %rdx
	movq	%rdx, 1928(%rax)
	movq	400(%rcx), %rdx
	movq	%rdx, 1936(%rax)
	movq	408(%rcx), %rdx
	movq	%rdx, 1944(%rax)
	movq	416(%rcx), %rdx
	movq	%rdx, 1952(%rax)
	movq	424(%rcx), %rdx
	movq	%rdx, 1960(%rax)
	movq	432(%rcx), %rdx
	movq	%rdx, 1968(%rax)
	movq	440(%rcx), %rdx
	movq	%rdx, 1976(%rax)
	movq	448(%rcx), %rdx
	movq	%rdx, 1984(%rax)
	movq	456(%rcx), %rdx
	movq	%rdx, 1992(%rax)
	movq	464(%rcx), %rdx
	movq	%rdx, 2000(%rax)
	movq	472(%rcx), %rdx
	movq	%rdx, 2008(%rax)
	movq	480(%rcx), %rdx
	movq	%rdx, 2016(%rax)
	movq	488(%rcx), %rdx
	movq	%rdx, 2024(%rax)
	movq	496(%rcx), %rdx
	movq	%rdx, 2032(%rax)
	movq	504(%rcx), %rdx
	movq	%rdx, 2040(%rax)
	movq	512(%rcx), %rdx
	movq	%rdx, 2048(%rax)
	movq	520(%rcx), %rdx
	movq	%rdx, 2056(%rax)
	movq	528(%rcx), %rdx
	movq	%rdx, 2064(%rax)
	movq	536(%rcx), %rdx
	movq	%rdx, 2072(%rax)
	movq	544(%rcx), %rdx
	movq	%rdx, 2080(%rax)
	movq	552(%rcx), %rdx
	movq	%rdx, 2088(%rax)
	movq	560(%rcx), %rdx
	movq	%rdx, 2096(%rax)
	movq	568(%rcx), %rdx
	movq	%rdx, 2104(%rax)
	movq	576(%rcx), %rdx
	movq	%rdx, 2112(%rax)
	movq	584(%rcx), %rdx
	movq	%rdx, 2120(%rax)
	movq	592(%rcx), %rdx
	movq	%rdx, 2128(%rax)
	movq	600(%rcx), %rdx
	movq	%rdx, 2136(%rax)
	movq	608(%rcx), %rdx
	movq	%rdx, 2144(%rax)
	movq	616(%rcx), %rdx
	movq	%rdx, 2152(%rax)
	movq	624(%rcx), %rdx
	movq	%rdx, 2160(%rax)
	movq	632(%rcx), %rdx
	movq	%rdx, 2168(%rax)
	movq	640(%rcx), %rdx
	movq	%rdx, 2176(%rax)
	movq	648(%rcx), %rdx
	movq	%rdx, 2184(%rax)
	movq	656(%rcx), %rdx
	movq	%rdx, 2192(%rax)
	movq	664(%rcx), %rdx
	movq	%rdx, 2200(%rax)
	movq	672(%rcx), %rdx
	movq	%rdx, 2208(%rax)
	movq	680(%rcx), %rdx
	movq	%rdx, 2216(%rax)
	movq	688(%rcx), %rdx
	movq	%rdx, 2224(%rax)
	movq	696(%rcx), %rdx
	movq	%rdx, 2232(%rax)
	movq	704(%rcx), %rdx
	movq	%rdx, 2240(%rax)
	movq	712(%rcx), %rdx
	movq	%rdx, 2248(%rax)
	movq	720(%rcx), %rdx
	movq	%rdx, 2256(%rax)
	movq	728(%rcx), %rdx
	movq	%rdx, 2264(%rax)
	movq	736(%rcx), %rdx
	movq	%rdx, 2272(%rax)
	movq	744(%rcx), %rdx
	movq	%rdx, 2280(%rax)
	movq	752(%rcx), %rdx
	movq	%rdx, 2288(%rax)
	movq	760(%rcx), %rdx
	movq	%rdx, 2296(%rax)
	movq	768(%rcx), %rdx
	movq	%rdx, 2304(%rax)
	movq	776(%rcx), %rdx
	movq	%rdx, 2312(%rax)
	movq	784(%rcx), %rdx
	movq	%rdx, 2320(%rax)
	movq	792(%rcx), %rdx
	movq	%rdx, 2328(%rax)
	movq	800(%rcx), %rdx
	movq	%rdx, 2336(%rax)
	movq	808(%rcx), %rdx
	movq	%rdx, 2344(%rax)
	movq	816(%rcx), %rdx
	movq	%rdx, 2352(%rax)
	movq	824(%rcx), %rdx
	movq	%rdx, 2360(%rax)
	movq	832(%rcx), %rdx
	movq	%rdx, 2368(%rax)
	movq	840(%rcx), %rdx
	movq	%rdx, 2376(%rax)
	movq	848(%rcx), %rdx
	movq	%rdx, 2384(%rax)
	movq	856(%rcx), %rdx
	movq	%rdx, 2392(%rax)
	movq	864(%rcx), %rdx
	movq	%rdx, 2400(%rax)
	movq	872(%rcx), %rdx
	movq	%rdx, 2408(%rax)
	movq	880(%rcx), %rdx
	movq	%rdx, 2416(%rax)
	movq	888(%rcx), %rdx
	movq	%rdx, 2424(%rax)
	movq	896(%rcx), %rdx
	movq	%rdx, 2432(%rax)
	movq	904(%rcx), %rdx
	movq	%rdx, 2440(%rax)
	movq	912(%rcx), %rdx
	movq	%rdx, 2448(%rax)
	movq	920(%rcx), %rdx
	movq	%rdx, 2456(%rax)
	movq	928(%rcx), %rdx
	movq	%rdx, 2464(%rax)
	movq	936(%rcx), %rdx
	movq	%rdx, 2472(%rax)
	movq	944(%rcx), %rdx
	movq	%rdx, 2480(%rax)
	movq	952(%rcx), %rdx
	movq	%rdx, 2488(%rax)
	movq	960(%rcx), %rdx
	movq	%rdx, 2496(%rax)
	movq	968(%rcx), %rdx
	movq	%rdx, 2504(%rax)
	movq	976(%rcx), %rdx
	movq	%rdx, 2512(%rax)
	movq	984(%rcx), %rdx
	movq	%rdx, 2520(%rax)
	movq	992(%rcx), %rdx
	movq	%rdx, 2528(%rax)
	movq	1000(%rcx), %rdx
	movq	%rdx, 2536(%rax)
	movq	1008(%rcx), %rdx
	movq	%rdx, 2544(%rax)
	movq	1016(%rcx), %rdx
	movq	%rdx, 2552(%rax)
	movq	1024(%rcx), %rdx
	movq	%rdx, 2560(%rax)
	movq	1032(%rcx), %rdx
	movq	%rdx, 2568(%rax)
	movq	1040(%rcx), %rdx
	movq	%rdx, 2576(%rax)
	movq	1048(%rcx), %rdx
	movq	%rdx, 2584(%rax)
	movq	1056(%rcx), %rdx
	movq	%rdx, 2592(%rax)
	movq	1064(%rcx), %rdx
	movq	%rdx, 2600(%rax)
	movq	1072(%rcx), %rdx
	movq	%rdx, 2608(%rax)
	movq	1080(%rcx), %rdx
	movq	%rdx, 2616(%rax)
	movq	1088(%rcx), %rdx
	movq	%rdx, 2624(%rax)
	movq	1096(%rcx), %rdx
	movq	%rdx, 2632(%rax)
	movq	1104(%rcx), %rdx
	movq	%rdx, 2640(%rax)
	movq	1112(%rcx), %rdx
	movq	%rdx, 2648(%rax)
	movq	1120(%rcx), %rdx
	movq	%rdx, 2656(%rax)
	movq	1128(%rcx), %rdx
	movq	%rdx, 2664(%rax)
	movq	1136(%rcx), %rdx
	movq	%rdx, 2672(%rax)
	movq	1144(%rcx), %rdx
	movq	%rdx, 2680(%rax)
	movq	1152(%rcx), %rdx
	movq	%rdx, 2688(%rax)
	movq	1160(%rcx), %rdx
	movq	%rdx, 2696(%rax)
	movq	1168(%rcx), %rdx
	movq	%rdx, 2704(%rax)
	movq	1176(%rcx), %rdx
	movq	%rdx, 2712(%rax)
	movq	1184(%rcx), %rdx
	movq	%rdx, 2720(%rax)
	movq	1192(%rcx), %rdx
	movq	%rdx, 2728(%rax)
	movq	1200(%rcx), %rdx
	movq	%rdx, 2736(%rax)
	movq	1208(%rcx), %rdx
	movq	%rdx, 2744(%rax)
	movq	1216(%rcx), %rdx
	movq	%rdx, 2752(%rax)
	movq	1224(%rcx), %rdx
	movq	%rdx, 2760(%rax)
	movq	1232(%rcx), %rdx
	movq	%rdx, 2768(%rax)
	movq	1240(%rcx), %rdx
	movq	%rdx, 2776(%rax)
	movq	1248(%rcx), %rdx
	movq	%rdx, 2784(%rax)
	movq	1256(%rcx), %rdx
	movq	%rdx, 2792(%rax)
	movq	1264(%rcx), %rdx
	movq	%rdx, 2800(%rax)
	movq	1272(%rcx), %rdx
	movq	%rdx, 2808(%rax)
	movq	1280(%rcx), %rdx
	movq	%rdx, 2816(%rax)
	movq	1288(%rcx), %rdx
	movq	%rdx, 2824(%rax)
	movq	1296(%rcx), %rdx
	movq	%rdx, 2832(%rax)
	movq	1304(%rcx), %rdx
	movq	%rdx, 2840(%rax)
	movq	1312(%rcx), %rdx
	movq	%rdx, 2848(%rax)
	movq	1320(%rcx), %rdx
	movq	%rdx, 2856(%rax)
	movq	1328(%rcx), %rdx
	movq	%rdx, 2864(%rax)
	movq	1336(%rcx), %rdx
	movq	%rdx, 2872(%rax)
	movq	1344(%rcx), %rdx
	movq	%rdx, 2880(%rax)
	movq	1352(%rcx), %rdx
	movq	%rdx, 2888(%rax)
	movq	1360(%rcx), %rdx
	movq	%rdx, 2896(%rax)
	movq	1368(%rcx), %rdx
	movq	%rdx, 2904(%rax)
	movq	1376(%rcx), %rdx
	movq	%rdx, 2912(%rax)
	movq	1384(%rcx), %rdx
	movq	%rdx, 2920(%rax)
	movq	1392(%rcx), %rdx
	movq	%rdx, 2928(%rax)
	movq	1400(%rcx), %rdx
	movq	%rdx, 2936(%rax)
	movq	1408(%rcx), %rdx
	movq	%rdx, 2944(%rax)
	movq	1416(%rcx), %rdx
	movq	%rdx, 2952(%rax)
	movq	1424(%rcx), %rdx
	movq	%rdx, 2960(%rax)
	movq	1432(%rcx), %rdx
	movq	%rdx, 2968(%rax)
	movq	1440(%rcx), %rdx
	movq	%rdx, 2976(%rax)
	movq	1448(%rcx), %rdx
	movq	%rdx, 2984(%rax)
	movq	1456(%rcx), %rdx
	movq	%rdx, 2992(%rax)
	movq	1464(%rcx), %rdx
	movq	%rdx, 3000(%rax)
	movq	1472(%rcx), %rdx
	movq	%rdx, 3008(%rax)
	movq	1480(%rcx), %rdx
	movq	%rdx, 3016(%rax)
	movq	1488(%rcx), %rdx
	movq	%rdx, 3024(%rax)
	movq	1496(%rcx), %rdx
	movq	%rdx, 3032(%rax)
	movq	1504(%rcx), %rdx
	movq	%rdx, 3040(%rax)
	movq	1512(%rcx), %rdx
	movq	%rdx, 3048(%rax)
	movq	1520(%rcx), %rdx
	movq	%rdx, 3056(%rax)
	movq	1528(%rcx), %rdx
	movq	%rdx, 3064(%rax)
	movq	1536(%rcx), %rdx
	movq	%rdx, 3072(%rax)
	movq	1544(%rcx), %rdx
	movq	%rdx, 3080(%rax)
	movq	1552(%rcx), %rdx
	movq	%rdx, 3088(%rax)
	movq	1560(%rcx), %rdx
	movq	%rdx, 3096(%rax)
	movq	%rax, (%rsp)
	leaq	40(%rsp), %rdx
	leaq	-224(%rsp), %rsp
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$1:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %rax
	movq	40(%rsp), %rcx
	movq	%rcx, 3104(%rax)
	movq	48(%rsp), %rcx
	movq	%rcx, 3112(%rax)
	movq	56(%rsp), %rcx
	movq	%rcx, 3120(%rax)
	movq	64(%rsp), %rcx
	movq	%rcx, 3128(%rax)
	movq	%mm2, %rcx
	leaq	32(%rcx), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, 3136(%rax)
	movq	8(%rcx), %rdx
	movq	%rdx, 3144(%rax)
	movq	16(%rcx), %rdx
	movq	%rdx, 3152(%rax)
	movq	24(%rcx), %rcx
	movq	%rcx, 3160(%rax)
	movq	%mm0, %rax
	movq	%mm1, %rcx
	movq	648(%rsp), %rdx
	movq	%rdx, (%rax)
	movq	656(%rsp), %rdx
	movq	%rdx, 8(%rax)
	movq	664(%rsp), %rdx
	movq	%rdx, 16(%rax)
	movq	672(%rsp), %rdx
	movq	%rdx, 24(%rax)
	movq	680(%rsp), %rdx
	movq	%rdx, 32(%rax)
	movq	688(%rsp), %rdx
	movq	%rdx, 40(%rax)
	movq	696(%rsp), %rdx
	movq	%rdx, 48(%rax)
	movq	704(%rsp), %rdx
	movq	%rdx, 56(%rax)
	movq	712(%rsp), %rdx
	movq	%rdx, 64(%rax)
	movq	720(%rsp), %rdx
	movq	%rdx, 72(%rax)
	movq	728(%rsp), %rdx
	movq	%rdx, 80(%rax)
	movq	736(%rsp), %rdx
	movq	%rdx, 88(%rax)
	movq	744(%rsp), %rdx
	movq	%rdx, 96(%rax)
	movq	752(%rsp), %rdx
	movq	%rdx, 104(%rax)
	movq	760(%rsp), %rdx
	movq	%rdx, 112(%rax)
	movq	768(%rsp), %rdx
	movq	%rdx, 120(%rax)
	movq	776(%rsp), %rdx
	movq	%rdx, 128(%rax)
	movq	784(%rsp), %rdx
	movq	%rdx, 136(%rax)
	movq	792(%rsp), %rdx
	movq	%rdx, 144(%rax)
	movq	800(%rsp), %rdx
	movq	%rdx, 152(%rax)
	movq	808(%rsp), %rdx
	movq	%rdx, 160(%rax)
	movq	816(%rsp), %rdx
	movq	%rdx, 168(%rax)
	movq	824(%rsp), %rdx
	movq	%rdx, 176(%rax)
	movq	832(%rsp), %rdx
	movq	%rdx, 184(%rax)
	movq	840(%rsp), %rdx
	movq	%rdx, 192(%rax)
	movq	848(%rsp), %rdx
	movq	%rdx, 200(%rax)
	movq	856(%rsp), %rdx
	movq	%rdx, 208(%rax)
	movq	864(%rsp), %rdx
	movq	%rdx, 216(%rax)
	movq	872(%rsp), %rdx
	movq	%rdx, 224(%rax)
	movq	880(%rsp), %rdx
	movq	%rdx, 232(%rax)
	movq	888(%rsp), %rdx
	movq	%rdx, 240(%rax)
	movq	896(%rsp), %rdx
	movq	%rdx, 248(%rax)
	movq	904(%rsp), %rdx
	movq	%rdx, 256(%rax)
	movq	912(%rsp), %rdx
	movq	%rdx, 264(%rax)
	movq	920(%rsp), %rdx
	movq	%rdx, 272(%rax)
	movq	928(%rsp), %rdx
	movq	%rdx, 280(%rax)
	movq	936(%rsp), %rdx
	movq	%rdx, 288(%rax)
	movq	944(%rsp), %rdx
	movq	%rdx, 296(%rax)
	movq	952(%rsp), %rdx
	movq	%rdx, 304(%rax)
	movq	960(%rsp), %rdx
	movq	%rdx, 312(%rax)
	movq	968(%rsp), %rdx
	movq	%rdx, 320(%rax)
	movq	976(%rsp), %rdx
	movq	%rdx, 328(%rax)
	movq	984(%rsp), %rdx
	movq	%rdx, 336(%rax)
	movq	992(%rsp), %rdx
	movq	%rdx, 344(%rax)
	movq	1000(%rsp), %rdx
	movq	%rdx, 352(%rax)
	movq	1008(%rsp), %rdx
	movq	%rdx, 360(%rax)
	movq	1016(%rsp), %rdx
	movq	%rdx, 368(%rax)
	movq	1024(%rsp), %rdx
	movq	%rdx, 376(%rax)
	movq	1032(%rsp), %rdx
	movq	%rdx, 384(%rax)
	movq	1040(%rsp), %rdx
	movq	%rdx, 392(%rax)
	movq	1048(%rsp), %rdx
	movq	%rdx, 400(%rax)
	movq	1056(%rsp), %rdx
	movq	%rdx, 408(%rax)
	movq	1064(%rsp), %rdx
	movq	%rdx, 416(%rax)
	movq	1072(%rsp), %rdx
	movq	%rdx, 424(%rax)
	movq	1080(%rsp), %rdx
	movq	%rdx, 432(%rax)
	movq	1088(%rsp), %rdx
	movq	%rdx, 440(%rax)
	movq	1096(%rsp), %rdx
	movq	%rdx, 448(%rax)
	movq	1104(%rsp), %rdx
	movq	%rdx, 456(%rax)
	movq	1112(%rsp), %rdx
	movq	%rdx, 464(%rax)
	movq	1120(%rsp), %rdx
	movq	%rdx, 472(%rax)
	movq	1128(%rsp), %rdx
	movq	%rdx, 480(%rax)
	movq	1136(%rsp), %rdx
	movq	%rdx, 488(%rax)
	movq	1144(%rsp), %rdx
	movq	%rdx, 496(%rax)
	movq	1152(%rsp), %rdx
	movq	%rdx, 504(%rax)
	movq	1160(%rsp), %rdx
	movq	%rdx, 512(%rax)
	movq	1168(%rsp), %rdx
	movq	%rdx, 520(%rax)
	movq	1176(%rsp), %rdx
	movq	%rdx, 528(%rax)
	movq	1184(%rsp), %rdx
	movq	%rdx, 536(%rax)
	movq	1192(%rsp), %rdx
	movq	%rdx, 544(%rax)
	movq	1200(%rsp), %rdx
	movq	%rdx, 552(%rax)
	movq	1208(%rsp), %rdx
	movq	%rdx, 560(%rax)
	movq	1216(%rsp), %rdx
	movq	%rdx, 568(%rax)
	movq	1224(%rsp), %rdx
	movq	%rdx, 576(%rax)
	movq	1232(%rsp), %rdx
	movq	%rdx, 584(%rax)
	movq	1240(%rsp), %rdx
	movq	%rdx, 592(%rax)
	movq	1248(%rsp), %rdx
	movq	%rdx, 600(%rax)
	movq	1256(%rsp), %rdx
	movq	%rdx, 608(%rax)
	movq	1264(%rsp), %rdx
	movq	%rdx, 616(%rax)
	movq	1272(%rsp), %rdx
	movq	%rdx, 624(%rax)
	movq	1280(%rsp), %rdx
	movq	%rdx, 632(%rax)
	movq	1288(%rsp), %rdx
	movq	%rdx, 640(%rax)
	movq	1296(%rsp), %rdx
	movq	%rdx, 648(%rax)
	movq	1304(%rsp), %rdx
	movq	%rdx, 656(%rax)
	movq	1312(%rsp), %rdx
	movq	%rdx, 664(%rax)
	movq	1320(%rsp), %rdx
	movq	%rdx, 672(%rax)
	movq	1328(%rsp), %rdx
	movq	%rdx, 680(%rax)
	movq	1336(%rsp), %rdx
	movq	%rdx, 688(%rax)
	movq	1344(%rsp), %rdx
	movq	%rdx, 696(%rax)
	movq	1352(%rsp), %rdx
	movq	%rdx, 704(%rax)
	movq	1360(%rsp), %rdx
	movq	%rdx, 712(%rax)
	movq	1368(%rsp), %rdx
	movq	%rdx, 720(%rax)
	movq	1376(%rsp), %rdx
	movq	%rdx, 728(%rax)
	movq	1384(%rsp), %rdx
	movq	%rdx, 736(%rax)
	movq	1392(%rsp), %rdx
	movq	%rdx, 744(%rax)
	movq	1400(%rsp), %rdx
	movq	%rdx, 752(%rax)
	movq	1408(%rsp), %rdx
	movq	%rdx, 760(%rax)
	movq	1416(%rsp), %rdx
	movq	%rdx, 768(%rax)
	movq	1424(%rsp), %rdx
	movq	%rdx, 776(%rax)
	movq	1432(%rsp), %rdx
	movq	%rdx, 784(%rax)
	movq	1440(%rsp), %rdx
	movq	%rdx, 792(%rax)
	movq	1448(%rsp), %rdx
	movq	%rdx, 800(%rax)
	movq	1456(%rsp), %rdx
	movq	%rdx, 808(%rax)
	movq	1464(%rsp), %rdx
	movq	%rdx, 816(%rax)
	movq	1472(%rsp), %rdx
	movq	%rdx, 824(%rax)
	movq	1480(%rsp), %rdx
	movq	%rdx, 832(%rax)
	movq	1488(%rsp), %rdx
	movq	%rdx, 840(%rax)
	movq	1496(%rsp), %rdx
	movq	%rdx, 848(%rax)
	movq	1504(%rsp), %rdx
	movq	%rdx, 856(%rax)
	movq	1512(%rsp), %rdx
	movq	%rdx, 864(%rax)
	movq	1520(%rsp), %rdx
	movq	%rdx, 872(%rax)
	movq	1528(%rsp), %rdx
	movq	%rdx, 880(%rax)
	movq	1536(%rsp), %rdx
	movq	%rdx, 888(%rax)
	movq	1544(%rsp), %rdx
	movq	%rdx, 896(%rax)
	movq	1552(%rsp), %rdx
	movq	%rdx, 904(%rax)
	movq	1560(%rsp), %rdx
	movq	%rdx, 912(%rax)
	movq	1568(%rsp), %rdx
	movq	%rdx, 920(%rax)
	movq	1576(%rsp), %rdx
	movq	%rdx, 928(%rax)
	movq	1584(%rsp), %rdx
	movq	%rdx, 936(%rax)
	movq	1592(%rsp), %rdx
	movq	%rdx, 944(%rax)
	movq	1600(%rsp), %rdx
	movq	%rdx, 952(%rax)
	movq	1608(%rsp), %rdx
	movq	%rdx, 960(%rax)
	movq	1616(%rsp), %rdx
	movq	%rdx, 968(%rax)
	movq	1624(%rsp), %rdx
	movq	%rdx, 976(%rax)
	movq	1632(%rsp), %rdx
	movq	%rdx, 984(%rax)
	movq	1640(%rsp), %rdx
	movq	%rdx, 992(%rax)
	movq	1648(%rsp), %rdx
	movq	%rdx, 1000(%rax)
	movq	1656(%rsp), %rdx
	movq	%rdx, 1008(%rax)
	movq	1664(%rsp), %rdx
	movq	%rdx, 1016(%rax)
	movq	1672(%rsp), %rdx
	movq	%rdx, 1024(%rax)
	movq	1680(%rsp), %rdx
	movq	%rdx, 1032(%rax)
	movq	1688(%rsp), %rdx
	movq	%rdx, 1040(%rax)
	movq	1696(%rsp), %rdx
	movq	%rdx, 1048(%rax)
	movq	1704(%rsp), %rdx
	movq	%rdx, 1056(%rax)
	movq	1712(%rsp), %rdx
	movq	%rdx, 1064(%rax)
	movq	1720(%rsp), %rdx
	movq	%rdx, 1072(%rax)
	movq	1728(%rsp), %rdx
	movq	%rdx, 1080(%rax)
	movq	1736(%rsp), %rdx
	movq	%rdx, 1088(%rax)
	movq	1744(%rsp), %rdx
	movq	%rdx, 1096(%rax)
	movq	1752(%rsp), %rdx
	movq	%rdx, 1104(%rax)
	movq	1760(%rsp), %rdx
	movq	%rdx, 1112(%rax)
	movq	1768(%rsp), %rdx
	movq	%rdx, 1120(%rax)
	movq	1776(%rsp), %rdx
	movq	%rdx, 1128(%rax)
	movq	1784(%rsp), %rdx
	movq	%rdx, 1136(%rax)
	movq	1792(%rsp), %rdx
	movq	%rdx, 1144(%rax)
	movq	1800(%rsp), %rdx
	movq	%rdx, 1152(%rax)
	movq	1808(%rsp), %rdx
	movq	%rdx, 1160(%rax)
	movq	1816(%rsp), %rdx
	movq	%rdx, 1168(%rax)
	movq	1824(%rsp), %rdx
	movq	%rdx, 1176(%rax)
	movq	1832(%rsp), %rdx
	movq	%rdx, 1184(%rax)
	movq	1840(%rsp), %rdx
	movq	%rdx, 1192(%rax)
	movq	1848(%rsp), %rdx
	movq	%rdx, 1200(%rax)
	movq	1856(%rsp), %rdx
	movq	%rdx, 1208(%rax)
	movq	1864(%rsp), %rdx
	movq	%rdx, 1216(%rax)
	movq	1872(%rsp), %rdx
	movq	%rdx, 1224(%rax)
	movq	1880(%rsp), %rdx
	movq	%rdx, 1232(%rax)
	movq	1888(%rsp), %rdx
	movq	%rdx, 1240(%rax)
	movq	1896(%rsp), %rdx
	movq	%rdx, 1248(%rax)
	movq	1904(%rsp), %rdx
	movq	%rdx, 1256(%rax)
	movq	1912(%rsp), %rdx
	movq	%rdx, 1264(%rax)
	movq	1920(%rsp), %rdx
	movq	%rdx, 1272(%rax)
	movq	1928(%rsp), %rdx
	movq	%rdx, 1280(%rax)
	movq	1936(%rsp), %rdx
	movq	%rdx, 1288(%rax)
	movq	1944(%rsp), %rdx
	movq	%rdx, 1296(%rax)
	movq	1952(%rsp), %rdx
	movq	%rdx, 1304(%rax)
	movq	1960(%rsp), %rdx
	movq	%rdx, 1312(%rax)
	movq	1968(%rsp), %rdx
	movq	%rdx, 1320(%rax)
	movq	1976(%rsp), %rdx
	movq	%rdx, 1328(%rax)
	movq	1984(%rsp), %rdx
	movq	%rdx, 1336(%rax)
	movq	1992(%rsp), %rdx
	movq	%rdx, 1344(%rax)
	movq	2000(%rsp), %rdx
	movq	%rdx, 1352(%rax)
	movq	2008(%rsp), %rdx
	movq	%rdx, 1360(%rax)
	movq	2016(%rsp), %rdx
	movq	%rdx, 1368(%rax)
	movq	2024(%rsp), %rdx
	movq	%rdx, 1376(%rax)
	movq	2032(%rsp), %rdx
	movq	%rdx, 1384(%rax)
	movq	2040(%rsp), %rdx
	movq	%rdx, 1392(%rax)
	movq	2048(%rsp), %rdx
	movq	%rdx, 1400(%rax)
	movq	2056(%rsp), %rdx
	movq	%rdx, 1408(%rax)
	movq	2064(%rsp), %rdx
	movq	%rdx, 1416(%rax)
	movq	2072(%rsp), %rdx
	movq	%rdx, 1424(%rax)
	movq	2080(%rsp), %rdx
	movq	%rdx, 1432(%rax)
	movq	2088(%rsp), %rdx
	movq	%rdx, 1440(%rax)
	movq	2096(%rsp), %rdx
	movq	%rdx, 1448(%rax)
	movq	2104(%rsp), %rdx
	movq	%rdx, 1456(%rax)
	movq	2112(%rsp), %rdx
	movq	%rdx, 1464(%rax)
	movq	2120(%rsp), %rdx
	movq	%rdx, 1472(%rax)
	movq	2128(%rsp), %rdx
	movq	%rdx, 1480(%rax)
	movq	2136(%rsp), %rdx
	movq	%rdx, 1488(%rax)
	movq	2144(%rsp), %rdx
	movq	%rdx, 1496(%rax)
	movq	2152(%rsp), %rdx
	movq	%rdx, 1504(%rax)
	movq	2160(%rsp), %rdx
	movq	%rdx, 1512(%rax)
	movq	2168(%rsp), %rdx
	movq	%rdx, 1520(%rax)
	movq	2176(%rsp), %rdx
	movq	%rdx, 1528(%rax)
	movq	2184(%rsp), %rdx
	movq	%rdx, 1536(%rax)
	movq	2192(%rsp), %rdx
	movq	%rdx, 1544(%rax)
	movq	2200(%rsp), %rdx
	movq	%rdx, 1552(%rax)
	movq	2208(%rsp), %rdx
	movq	%rdx, 1560(%rax)
	movq	2216(%rsp), %rax
	movq	%rax, (%rcx)
	movq	2224(%rsp), %rax
	movq	%rax, 8(%rcx)
	movq	2232(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	2240(%rsp), %rax
	movq	%rax, 24(%rcx)
	movq	2248(%rsp), %rax
	movq	%rax, 32(%rcx)
	movq	2256(%rsp), %rax
	movq	%rax, 40(%rcx)
	movq	2264(%rsp), %rax
	movq	%rax, 48(%rcx)
	movq	2272(%rsp), %rax
	movq	%rax, 56(%rcx)
	movq	2280(%rsp), %rax
	movq	%rax, 64(%rcx)
	movq	2288(%rsp), %rax
	movq	%rax, 72(%rcx)
	movq	2296(%rsp), %rax
	movq	%rax, 80(%rcx)
	movq	2304(%rsp), %rax
	movq	%rax, 88(%rcx)
	movq	2312(%rsp), %rax
	movq	%rax, 96(%rcx)
	movq	2320(%rsp), %rax
	movq	%rax, 104(%rcx)
	movq	2328(%rsp), %rax
	movq	%rax, 112(%rcx)
	movq	2336(%rsp), %rax
	movq	%rax, 120(%rcx)
	movq	2344(%rsp), %rax
	movq	%rax, 128(%rcx)
	movq	2352(%rsp), %rax
	movq	%rax, 136(%rcx)
	movq	2360(%rsp), %rax
	movq	%rax, 144(%rcx)
	movq	2368(%rsp), %rax
	movq	%rax, 152(%rcx)
	movq	2376(%rsp), %rax
	movq	%rax, 160(%rcx)
	movq	2384(%rsp), %rax
	movq	%rax, 168(%rcx)
	movq	2392(%rsp), %rax
	movq	%rax, 176(%rcx)
	movq	2400(%rsp), %rax
	movq	%rax, 184(%rcx)
	movq	2408(%rsp), %rax
	movq	%rax, 192(%rcx)
	movq	2416(%rsp), %rax
	movq	%rax, 200(%rcx)
	movq	2424(%rsp), %rax
	movq	%rax, 208(%rcx)
	movq	2432(%rsp), %rax
	movq	%rax, 216(%rcx)
	movq	2440(%rsp), %rax
	movq	%rax, 224(%rcx)
	movq	2448(%rsp), %rax
	movq	%rax, 232(%rcx)
	movq	2456(%rsp), %rax
	movq	%rax, 240(%rcx)
	movq	2464(%rsp), %rax
	movq	%rax, 248(%rcx)
	movq	2472(%rsp), %rax
	movq	%rax, 256(%rcx)
	movq	2480(%rsp), %rax
	movq	%rax, 264(%rcx)
	movq	2488(%rsp), %rax
	movq	%rax, 272(%rcx)
	movq	2496(%rsp), %rax
	movq	%rax, 280(%rcx)
	movq	2504(%rsp), %rax
	movq	%rax, 288(%rcx)
	movq	2512(%rsp), %rax
	movq	%rax, 296(%rcx)
	movq	2520(%rsp), %rax
	movq	%rax, 304(%rcx)
	movq	2528(%rsp), %rax
	movq	%rax, 312(%rcx)
	movq	2536(%rsp), %rax
	movq	%rax, 320(%rcx)
	movq	2544(%rsp), %rax
	movq	%rax, 328(%rcx)
	movq	2552(%rsp), %rax
	movq	%rax, 336(%rcx)
	movq	2560(%rsp), %rax
	movq	%rax, 344(%rcx)
	movq	2568(%rsp), %rax
	movq	%rax, 352(%rcx)
	movq	2576(%rsp), %rax
	movq	%rax, 360(%rcx)
	movq	2584(%rsp), %rax
	movq	%rax, 368(%rcx)
	movq	2592(%rsp), %rax
	movq	%rax, 376(%rcx)
	movq	2600(%rsp), %rax
	movq	%rax, 384(%rcx)
	movq	2608(%rsp), %rax
	movq	%rax, 392(%rcx)
	movq	2616(%rsp), %rax
	movq	%rax, 400(%rcx)
	movq	2624(%rsp), %rax
	movq	%rax, 408(%rcx)
	movq	2632(%rsp), %rax
	movq	%rax, 416(%rcx)
	movq	2640(%rsp), %rax
	movq	%rax, 424(%rcx)
	movq	2648(%rsp), %rax
	movq	%rax, 432(%rcx)
	movq	2656(%rsp), %rax
	movq	%rax, 440(%rcx)
	movq	2664(%rsp), %rax
	movq	%rax, 448(%rcx)
	movq	2672(%rsp), %rax
	movq	%rax, 456(%rcx)
	movq	2680(%rsp), %rax
	movq	%rax, 464(%rcx)
	movq	2688(%rsp), %rax
	movq	%rax, 472(%rcx)
	movq	2696(%rsp), %rax
	movq	%rax, 480(%rcx)
	movq	2704(%rsp), %rax
	movq	%rax, 488(%rcx)
	movq	2712(%rsp), %rax
	movq	%rax, 496(%rcx)
	movq	2720(%rsp), %rax
	movq	%rax, 504(%rcx)
	movq	2728(%rsp), %rax
	movq	%rax, 512(%rcx)
	movq	2736(%rsp), %rax
	movq	%rax, 520(%rcx)
	movq	2744(%rsp), %rax
	movq	%rax, 528(%rcx)
	movq	2752(%rsp), %rax
	movq	%rax, 536(%rcx)
	movq	2760(%rsp), %rax
	movq	%rax, 544(%rcx)
	movq	2768(%rsp), %rax
	movq	%rax, 552(%rcx)
	movq	2776(%rsp), %rax
	movq	%rax, 560(%rcx)
	movq	2784(%rsp), %rax
	movq	%rax, 568(%rcx)
	movq	2792(%rsp), %rax
	movq	%rax, 576(%rcx)
	movq	2800(%rsp), %rax
	movq	%rax, 584(%rcx)
	movq	2808(%rsp), %rax
	movq	%rax, 592(%rcx)
	movq	2816(%rsp), %rax
	movq	%rax, 600(%rcx)
	movq	2824(%rsp), %rax
	movq	%rax, 608(%rcx)
	movq	2832(%rsp), %rax
	movq	%rax, 616(%rcx)
	movq	2840(%rsp), %rax
	movq	%rax, 624(%rcx)
	movq	2848(%rsp), %rax
	movq	%rax, 632(%rcx)
	movq	2856(%rsp), %rax
	movq	%rax, 640(%rcx)
	movq	2864(%rsp), %rax
	movq	%rax, 648(%rcx)
	movq	2872(%rsp), %rax
	movq	%rax, 656(%rcx)
	movq	2880(%rsp), %rax
	movq	%rax, 664(%rcx)
	movq	2888(%rsp), %rax
	movq	%rax, 672(%rcx)
	movq	2896(%rsp), %rax
	movq	%rax, 680(%rcx)
	movq	2904(%rsp), %rax
	movq	%rax, 688(%rcx)
	movq	2912(%rsp), %rax
	movq	%rax, 696(%rcx)
	movq	2920(%rsp), %rax
	movq	%rax, 704(%rcx)
	movq	2928(%rsp), %rax
	movq	%rax, 712(%rcx)
	movq	2936(%rsp), %rax
	movq	%rax, 720(%rcx)
	movq	2944(%rsp), %rax
	movq	%rax, 728(%rcx)
	movq	2952(%rsp), %rax
	movq	%rax, 736(%rcx)
	movq	2960(%rsp), %rax
	movq	%rax, 744(%rcx)
	movq	2968(%rsp), %rax
	movq	%rax, 752(%rcx)
	movq	2976(%rsp), %rax
	movq	%rax, 760(%rcx)
	movq	2984(%rsp), %rax
	movq	%rax, 768(%rcx)
	movq	2992(%rsp), %rax
	movq	%rax, 776(%rcx)
	movq	3000(%rsp), %rax
	movq	%rax, 784(%rcx)
	movq	3008(%rsp), %rax
	movq	%rax, 792(%rcx)
	movq	3016(%rsp), %rax
	movq	%rax, 800(%rcx)
	movq	3024(%rsp), %rax
	movq	%rax, 808(%rcx)
	movq	3032(%rsp), %rax
	movq	%rax, 816(%rcx)
	movq	3040(%rsp), %rax
	movq	%rax, 824(%rcx)
	movq	3048(%rsp), %rax
	movq	%rax, 832(%rcx)
	movq	3056(%rsp), %rax
	movq	%rax, 840(%rcx)
	movq	3064(%rsp), %rax
	movq	%rax, 848(%rcx)
	movq	3072(%rsp), %rax
	movq	%rax, 856(%rcx)
	movq	3080(%rsp), %rax
	movq	%rax, 864(%rcx)
	movq	3088(%rsp), %rax
	movq	%rax, 872(%rcx)
	movq	3096(%rsp), %rax
	movq	%rax, 880(%rcx)
	movq	3104(%rsp), %rax
	movq	%rax, 888(%rcx)
	movq	3112(%rsp), %rax
	movq	%rax, 896(%rcx)
	movq	3120(%rsp), %rax
	movq	%rax, 904(%rcx)
	movq	3128(%rsp), %rax
	movq	%rax, 912(%rcx)
	movq	3136(%rsp), %rax
	movq	%rax, 920(%rcx)
	movq	3144(%rsp), %rax
	movq	%rax, 928(%rcx)
	movq	3152(%rsp), %rax
	movq	%rax, 936(%rcx)
	movq	3160(%rsp), %rax
	movq	%rax, 944(%rcx)
	movq	3168(%rsp), %rax
	movq	%rax, 952(%rcx)
	movq	3176(%rsp), %rax
	movq	%rax, 960(%rcx)
	movq	3184(%rsp), %rax
	movq	%rax, 968(%rcx)
	movq	3192(%rsp), %rax
	movq	%rax, 976(%rcx)
	movq	3200(%rsp), %rax
	movq	%rax, 984(%rcx)
	movq	3208(%rsp), %rax
	movq	%rax, 992(%rcx)
	movq	3216(%rsp), %rax
	movq	%rax, 1000(%rcx)
	movq	3224(%rsp), %rax
	movq	%rax, 1008(%rcx)
	movq	3232(%rsp), %rax
	movq	%rax, 1016(%rcx)
	movq	3240(%rsp), %rax
	movq	%rax, 1024(%rcx)
	movq	3248(%rsp), %rax
	movq	%rax, 1032(%rcx)
	movq	3256(%rsp), %rax
	movq	%rax, 1040(%rcx)
	movq	3264(%rsp), %rax
	movq	%rax, 1048(%rcx)
	movq	3272(%rsp), %rax
	movq	%rax, 1056(%rcx)
	movq	3280(%rsp), %rax
	movq	%rax, 1064(%rcx)
	movq	3288(%rsp), %rax
	movq	%rax, 1072(%rcx)
	movq	3296(%rsp), %rax
	movq	%rax, 1080(%rcx)
	movq	3304(%rsp), %rax
	movq	%rax, 1088(%rcx)
	movq	3312(%rsp), %rax
	movq	%rax, 1096(%rcx)
	movq	3320(%rsp), %rax
	movq	%rax, 1104(%rcx)
	movq	3328(%rsp), %rax
	movq	%rax, 1112(%rcx)
	movq	3336(%rsp), %rax
	movq	%rax, 1120(%rcx)
	movq	3344(%rsp), %rax
	movq	%rax, 1128(%rcx)
	movq	3352(%rsp), %rax
	movq	%rax, 1136(%rcx)
	movq	3360(%rsp), %rax
	movq	%rax, 1144(%rcx)
	movq	3368(%rsp), %rax
	movq	%rax, 1152(%rcx)
	movq	3376(%rsp), %rax
	movq	%rax, 1160(%rcx)
	movq	3384(%rsp), %rax
	movq	%rax, 1168(%rcx)
	movq	3392(%rsp), %rax
	movq	%rax, 1176(%rcx)
	movq	3400(%rsp), %rax
	movq	%rax, 1184(%rcx)
	movq	3408(%rsp), %rax
	movq	%rax, 1192(%rcx)
	movq	3416(%rsp), %rax
	movq	%rax, 1200(%rcx)
	movq	3424(%rsp), %rax
	movq	%rax, 1208(%rcx)
	movq	3432(%rsp), %rax
	movq	%rax, 1216(%rcx)
	movq	3440(%rsp), %rax
	movq	%rax, 1224(%rcx)
	movq	3448(%rsp), %rax
	movq	%rax, 1232(%rcx)
	movq	3456(%rsp), %rax
	movq	%rax, 1240(%rcx)
	movq	3464(%rsp), %rax
	movq	%rax, 1248(%rcx)
	movq	3472(%rsp), %rax
	movq	%rax, 1256(%rcx)
	movq	3480(%rsp), %rax
	movq	%rax, 1264(%rcx)
	movq	3488(%rsp), %rax
	movq	%rax, 1272(%rcx)
	movq	3496(%rsp), %rax
	movq	%rax, 1280(%rcx)
	movq	3504(%rsp), %rax
	movq	%rax, 1288(%rcx)
	movq	3512(%rsp), %rax
	movq	%rax, 1296(%rcx)
	movq	3520(%rsp), %rax
	movq	%rax, 1304(%rcx)
	movq	3528(%rsp), %rax
	movq	%rax, 1312(%rcx)
	movq	3536(%rsp), %rax
	movq	%rax, 1320(%rcx)
	movq	3544(%rsp), %rax
	movq	%rax, 1328(%rcx)
	movq	3552(%rsp), %rax
	movq	%rax, 1336(%rcx)
	movq	3560(%rsp), %rax
	movq	%rax, 1344(%rcx)
	movq	3568(%rsp), %rax
	movq	%rax, 1352(%rcx)
	movq	3576(%rsp), %rax
	movq	%rax, 1360(%rcx)
	movq	3584(%rsp), %rax
	movq	%rax, 1368(%rcx)
	movq	3592(%rsp), %rax
	movq	%rax, 1376(%rcx)
	movq	3600(%rsp), %rax
	movq	%rax, 1384(%rcx)
	movq	3608(%rsp), %rax
	movq	%rax, 1392(%rcx)
	movq	3616(%rsp), %rax
	movq	%rax, 1400(%rcx)
	movq	3624(%rsp), %rax
	movq	%rax, 1408(%rcx)
	movq	3632(%rsp), %rax
	movq	%rax, 1416(%rcx)
	movq	3640(%rsp), %rax
	movq	%rax, 1424(%rcx)
	movq	3648(%rsp), %rax
	movq	%rax, 1432(%rcx)
	movq	3656(%rsp), %rax
	movq	%rax, 1440(%rcx)
	movq	3664(%rsp), %rax
	movq	%rax, 1448(%rcx)
	movq	3672(%rsp), %rax
	movq	%rax, 1456(%rcx)
	movq	3680(%rsp), %rax
	movq	%rax, 1464(%rcx)
	movq	3688(%rsp), %rax
	movq	%rax, 1472(%rcx)
	movq	3696(%rsp), %rax
	movq	%rax, 1480(%rcx)
	movq	3704(%rsp), %rax
	movq	%rax, 1488(%rcx)
	movq	3712(%rsp), %rax
	movq	%rax, 1496(%rcx)
	movq	3720(%rsp), %rax
	movq	%rax, 1504(%rcx)
	movq	3728(%rsp), %rax
	movq	%rax, 1512(%rcx)
	movq	3736(%rsp), %rax
	movq	%rax, 1520(%rcx)
	movq	3744(%rsp), %rax
	movq	%rax, 1528(%rcx)
	movq	3752(%rsp), %rax
	movq	%rax, 1536(%rcx)
	movq	3760(%rsp), %rax
	movq	%rax, 1544(%rcx)
	movq	3768(%rsp), %rax
	movq	%rax, 1552(%rcx)
	movq	3776(%rsp), %rax
	movq	%rax, 1560(%rcx)
	movq	3784(%rsp), %rax
	movq	%rax, 1568(%rcx)
	movq	3792(%rsp), %rax
	movq	%rax, 1576(%rcx)
	movq	3800(%rsp), %rax
	movq	%rax, 1584(%rcx)
	movq	3808(%rsp), %rax
	movq	%rax, 1592(%rcx)
	movq	3816(%rsp), %rax
	movq	%rax, 1600(%rcx)
	movq	3824(%rsp), %rax
	movq	%rax, 1608(%rcx)
	movq	3832(%rsp), %rax
	movq	%rax, 1616(%rcx)
	movq	3840(%rsp), %rax
	movq	%rax, 1624(%rcx)
	movq	3848(%rsp), %rax
	movq	%rax, 1632(%rcx)
	movq	3856(%rsp), %rax
	movq	%rax, 1640(%rcx)
	movq	3864(%rsp), %rax
	movq	%rax, 1648(%rcx)
	movq	3872(%rsp), %rax
	movq	%rax, 1656(%rcx)
	movq	3880(%rsp), %rax
	movq	%rax, 1664(%rcx)
	movq	3888(%rsp), %rax
	movq	%rax, 1672(%rcx)
	movq	3896(%rsp), %rax
	movq	%rax, 1680(%rcx)
	movq	3904(%rsp), %rax
	movq	%rax, 1688(%rcx)
	movq	3912(%rsp), %rax
	movq	%rax, 1696(%rcx)
	movq	3920(%rsp), %rax
	movq	%rax, 1704(%rcx)
	movq	3928(%rsp), %rax
	movq	%rax, 1712(%rcx)
	movq	3936(%rsp), %rax
	movq	%rax, 1720(%rcx)
	movq	3944(%rsp), %rax
	movq	%rax, 1728(%rcx)
	movq	3952(%rsp), %rax
	movq	%rax, 1736(%rcx)
	movq	3960(%rsp), %rax
	movq	%rax, 1744(%rcx)
	movq	3968(%rsp), %rax
	movq	%rax, 1752(%rcx)
	movq	3976(%rsp), %rax
	movq	%rax, 1760(%rcx)
	movq	3984(%rsp), %rax
	movq	%rax, 1768(%rcx)
	movq	3992(%rsp), %rax
	movq	%rax, 1776(%rcx)
	movq	4000(%rsp), %rax
	movq	%rax, 1784(%rcx)
	movq	4008(%rsp), %rax
	movq	%rax, 1792(%rcx)
	movq	4016(%rsp), %rax
	movq	%rax, 1800(%rcx)
	movq	4024(%rsp), %rax
	movq	%rax, 1808(%rcx)
	movq	4032(%rsp), %rax
	movq	%rax, 1816(%rcx)
	movq	4040(%rsp), %rax
	movq	%rax, 1824(%rcx)
	movq	4048(%rsp), %rax
	movq	%rax, 1832(%rcx)
	movq	4056(%rsp), %rax
	movq	%rax, 1840(%rcx)
	movq	4064(%rsp), %rax
	movq	%rax, 1848(%rcx)
	movq	4072(%rsp), %rax
	movq	%rax, 1856(%rcx)
	movq	4080(%rsp), %rax
	movq	%rax, 1864(%rcx)
	movq	4088(%rsp), %rax
	movq	%rax, 1872(%rcx)
	movq	4096(%rsp), %rax
	movq	%rax, 1880(%rcx)
	movq	4104(%rsp), %rax
	movq	%rax, 1888(%rcx)
	movq	4112(%rsp), %rax
	movq	%rax, 1896(%rcx)
	movq	4120(%rsp), %rax
	movq	%rax, 1904(%rcx)
	movq	4128(%rsp), %rax
	movq	%rax, 1912(%rcx)
	movq	4136(%rsp), %rax
	movq	%rax, 1920(%rcx)
	movq	4144(%rsp), %rax
	movq	%rax, 1928(%rcx)
	movq	4152(%rsp), %rax
	movq	%rax, 1936(%rcx)
	movq	4160(%rsp), %rax
	movq	%rax, 1944(%rcx)
	movq	4168(%rsp), %rax
	movq	%rax, 1952(%rcx)
	movq	4176(%rsp), %rax
	movq	%rax, 1960(%rcx)
	movq	4184(%rsp), %rax
	movq	%rax, 1968(%rcx)
	movq	4192(%rsp), %rax
	movq	%rax, 1976(%rcx)
	movq	4200(%rsp), %rax
	movq	%rax, 1984(%rcx)
	movq	4208(%rsp), %rax
	movq	%rax, 1992(%rcx)
	movq	4216(%rsp), %rax
	movq	%rax, 2000(%rcx)
	movq	4224(%rsp), %rax
	movq	%rax, 2008(%rcx)
	movq	4232(%rsp), %rax
	movq	%rax, 2016(%rcx)
	movq	4240(%rsp), %rax
	movq	%rax, 2024(%rcx)
	movq	4248(%rsp), %rax
	movq	%rax, 2032(%rcx)
	movq	4256(%rsp), %rax
	movq	%rax, 2040(%rcx)
	movq	4264(%rsp), %rax
	movq	%rax, 2048(%rcx)
	movq	4272(%rsp), %rax
	movq	%rax, 2056(%rcx)
	movq	4280(%rsp), %rax
	movq	%rax, 2064(%rcx)
	movq	4288(%rsp), %rax
	movq	%rax, 2072(%rcx)
	movq	4296(%rsp), %rax
	movq	%rax, 2080(%rcx)
	movq	4304(%rsp), %rax
	movq	%rax, 2088(%rcx)
	movq	4312(%rsp), %rax
	movq	%rax, 2096(%rcx)
	movq	4320(%rsp), %rax
	movq	%rax, 2104(%rcx)
	movq	4328(%rsp), %rax
	movq	%rax, 2112(%rcx)
	movq	4336(%rsp), %rax
	movq	%rax, 2120(%rcx)
	movq	4344(%rsp), %rax
	movq	%rax, 2128(%rcx)
	movq	4352(%rsp), %rax
	movq	%rax, 2136(%rcx)
	movq	4360(%rsp), %rax
	movq	%rax, 2144(%rcx)
	movq	4368(%rsp), %rax
	movq	%rax, 2152(%rcx)
	movq	4376(%rsp), %rax
	movq	%rax, 2160(%rcx)
	movq	4384(%rsp), %rax
	movq	%rax, 2168(%rcx)
	movq	4392(%rsp), %rax
	movq	%rax, 2176(%rcx)
	movq	4400(%rsp), %rax
	movq	%rax, 2184(%rcx)
	movq	4408(%rsp), %rax
	movq	%rax, 2192(%rcx)
	movq	4416(%rsp), %rax
	movq	%rax, 2200(%rcx)
	movq	4424(%rsp), %rax
	movq	%rax, 2208(%rcx)
	movq	4432(%rsp), %rax
	movq	%rax, 2216(%rcx)
	movq	4440(%rsp), %rax
	movq	%rax, 2224(%rcx)
	movq	4448(%rsp), %rax
	movq	%rax, 2232(%rcx)
	movq	4456(%rsp), %rax
	movq	%rax, 2240(%rcx)
	movq	4464(%rsp), %rax
	movq	%rax, 2248(%rcx)
	movq	4472(%rsp), %rax
	movq	%rax, 2256(%rcx)
	movq	4480(%rsp), %rax
	movq	%rax, 2264(%rcx)
	movq	4488(%rsp), %rax
	movq	%rax, 2272(%rcx)
	movq	4496(%rsp), %rax
	movq	%rax, 2280(%rcx)
	movq	4504(%rsp), %rax
	movq	%rax, 2288(%rcx)
	movq	4512(%rsp), %rax
	movq	%rax, 2296(%rcx)
	movq	4520(%rsp), %rax
	movq	%rax, 2304(%rcx)
	movq	4528(%rsp), %rax
	movq	%rax, 2312(%rcx)
	movq	4536(%rsp), %rax
	movq	%rax, 2320(%rcx)
	movq	4544(%rsp), %rax
	movq	%rax, 2328(%rcx)
	movq	4552(%rsp), %rax
	movq	%rax, 2336(%rcx)
	movq	4560(%rsp), %rax
	movq	%rax, 2344(%rcx)
	movq	4568(%rsp), %rax
	movq	%rax, 2352(%rcx)
	movq	4576(%rsp), %rax
	movq	%rax, 2360(%rcx)
	movq	4584(%rsp), %rax
	movq	%rax, 2368(%rcx)
	movq	4592(%rsp), %rax
	movq	%rax, 2376(%rcx)
	movq	4600(%rsp), %rax
	movq	%rax, 2384(%rcx)
	movq	4608(%rsp), %rax
	movq	%rax, 2392(%rcx)
	movq	4616(%rsp), %rax
	movq	%rax, 2400(%rcx)
	movq	4624(%rsp), %rax
	movq	%rax, 2408(%rcx)
	movq	4632(%rsp), %rax
	movq	%rax, 2416(%rcx)
	movq	4640(%rsp), %rax
	movq	%rax, 2424(%rcx)
	movq	4648(%rsp), %rax
	movq	%rax, 2432(%rcx)
	movq	4656(%rsp), %rax
	movq	%rax, 2440(%rcx)
	movq	4664(%rsp), %rax
	movq	%rax, 2448(%rcx)
	movq	4672(%rsp), %rax
	movq	%rax, 2456(%rcx)
	movq	4680(%rsp), %rax
	movq	%rax, 2464(%rcx)
	movq	4688(%rsp), %rax
	movq	%rax, 2472(%rcx)
	movq	4696(%rsp), %rax
	movq	%rax, 2480(%rcx)
	movq	4704(%rsp), %rax
	movq	%rax, 2488(%rcx)
	movq	4712(%rsp), %rax
	movq	%rax, 2496(%rcx)
	movq	4720(%rsp), %rax
	movq	%rax, 2504(%rcx)
	movq	4728(%rsp), %rax
	movq	%rax, 2512(%rcx)
	movq	4736(%rsp), %rax
	movq	%rax, 2520(%rcx)
	movq	4744(%rsp), %rax
	movq	%rax, 2528(%rcx)
	movq	4752(%rsp), %rax
	movq	%rax, 2536(%rcx)
	movq	4760(%rsp), %rax
	movq	%rax, 2544(%rcx)
	movq	4768(%rsp), %rax
	movq	%rax, 2552(%rcx)
	movq	4776(%rsp), %rax
	movq	%rax, 2560(%rcx)
	movq	4784(%rsp), %rax
	movq	%rax, 2568(%rcx)
	movq	4792(%rsp), %rax
	movq	%rax, 2576(%rcx)
	movq	4800(%rsp), %rax
	movq	%rax, 2584(%rcx)
	movq	4808(%rsp), %rax
	movq	%rax, 2592(%rcx)
	movq	4816(%rsp), %rax
	movq	%rax, 2600(%rcx)
	movq	4824(%rsp), %rax
	movq	%rax, 2608(%rcx)
	movq	4832(%rsp), %rax
	movq	%rax, 2616(%rcx)
	movq	4840(%rsp), %rax
	movq	%rax, 2624(%rcx)
	movq	4848(%rsp), %rax
	movq	%rax, 2632(%rcx)
	movq	4856(%rsp), %rax
	movq	%rax, 2640(%rcx)
	movq	4864(%rsp), %rax
	movq	%rax, 2648(%rcx)
	movq	4872(%rsp), %rax
	movq	%rax, 2656(%rcx)
	movq	4880(%rsp), %rax
	movq	%rax, 2664(%rcx)
	movq	4888(%rsp), %rax
	movq	%rax, 2672(%rcx)
	movq	4896(%rsp), %rax
	movq	%rax, 2680(%rcx)
	movq	4904(%rsp), %rax
	movq	%rax, 2688(%rcx)
	movq	4912(%rsp), %rax
	movq	%rax, 2696(%rcx)
	movq	4920(%rsp), %rax
	movq	%rax, 2704(%rcx)
	movq	4928(%rsp), %rax
	movq	%rax, 2712(%rcx)
	movq	4936(%rsp), %rax
	movq	%rax, 2720(%rcx)
	movq	4944(%rsp), %rax
	movq	%rax, 2728(%rcx)
	movq	4952(%rsp), %rax
	movq	%rax, 2736(%rcx)
	movq	4960(%rsp), %rax
	movq	%rax, 2744(%rcx)
	movq	4968(%rsp), %rax
	movq	%rax, 2752(%rcx)
	movq	4976(%rsp), %rax
	movq	%rax, 2760(%rcx)
	movq	4984(%rsp), %rax
	movq	%rax, 2768(%rcx)
	movq	4992(%rsp), %rax
	movq	%rax, 2776(%rcx)
	movq	5000(%rsp), %rax
	movq	%rax, 2784(%rcx)
	movq	5008(%rsp), %rax
	movq	%rax, 2792(%rcx)
	movq	5016(%rsp), %rax
	movq	%rax, 2800(%rcx)
	movq	5024(%rsp), %rax
	movq	%rax, 2808(%rcx)
	movq	5032(%rsp), %rax
	movq	%rax, 2816(%rcx)
	movq	5040(%rsp), %rax
	movq	%rax, 2824(%rcx)
	movq	5048(%rsp), %rax
	movq	%rax, 2832(%rcx)
	movq	5056(%rsp), %rax
	movq	%rax, 2840(%rcx)
	movq	5064(%rsp), %rax
	movq	%rax, 2848(%rcx)
	movq	5072(%rsp), %rax
	movq	%rax, 2856(%rcx)
	movq	5080(%rsp), %rax
	movq	%rax, 2864(%rcx)
	movq	5088(%rsp), %rax
	movq	%rax, 2872(%rcx)
	movq	5096(%rsp), %rax
	movq	%rax, 2880(%rcx)
	movq	5104(%rsp), %rax
	movq	%rax, 2888(%rcx)
	movq	5112(%rsp), %rax
	movq	%rax, 2896(%rcx)
	movq	5120(%rsp), %rax
	movq	%rax, 2904(%rcx)
	movq	5128(%rsp), %rax
	movq	%rax, 2912(%rcx)
	movq	5136(%rsp), %rax
	movq	%rax, 2920(%rcx)
	movq	5144(%rsp), %rax
	movq	%rax, 2928(%rcx)
	movq	5152(%rsp), %rax
	movq	%rax, 2936(%rcx)
	movq	5160(%rsp), %rax
	movq	%rax, 2944(%rcx)
	movq	5168(%rsp), %rax
	movq	%rax, 2952(%rcx)
	movq	5176(%rsp), %rax
	movq	%rax, 2960(%rcx)
	movq	5184(%rsp), %rax
	movq	%rax, 2968(%rcx)
	movq	5192(%rsp), %rax
	movq	%rax, 2976(%rcx)
	movq	5200(%rsp), %rax
	movq	%rax, 2984(%rcx)
	movq	5208(%rsp), %rax
	movq	%rax, 2992(%rcx)
	movq	5216(%rsp), %rax
	movq	%rax, 3000(%rcx)
	movq	5224(%rsp), %rax
	movq	%rax, 3008(%rcx)
	movq	5232(%rsp), %rax
	movq	%rax, 3016(%rcx)
	movq	5240(%rsp), %rax
	movq	%rax, 3024(%rcx)
	movq	5248(%rsp), %rax
	movq	%rax, 3032(%rcx)
	movq	5256(%rsp), %rax
	movq	%rax, 3040(%rcx)
	movq	5264(%rsp), %rax
	movq	%rax, 3048(%rcx)
	movq	5272(%rsp), %rax
	movq	%rax, 3056(%rcx)
	movq	5280(%rsp), %rax
	movq	%rax, 3064(%rcx)
	movq	5288(%rsp), %rax
	movq	%rax, 3072(%rcx)
	movq	5296(%rsp), %rax
	movq	%rax, 3080(%rcx)
	movq	5304(%rsp), %rax
	movq	%rax, 3088(%rcx)
	movq	5312(%rsp), %rax
	movq	%rax, 3096(%rcx)
	movq	5320(%rsp), %rax
	movq	%rax, 3104(%rcx)
	movq	5328(%rsp), %rax
	movq	%rax, 3112(%rcx)
	movq	5336(%rsp), %rax
	movq	%rax, 3120(%rcx)
	movq	5344(%rsp), %rax
	movq	%rax, 3128(%rcx)
	movq	5352(%rsp), %rax
	movq	%rax, 3136(%rcx)
	movq	5360(%rsp), %rax
	movq	%rax, 3144(%rcx)
	movq	5368(%rsp), %rax
	movq	%rax, 3152(%rcx)
	movq	5376(%rsp), %rax
	movq	%rax, 3160(%rcx)
	xorq	%rax, %rax
	movq	20232(%rsp), %rbx
	movq	20240(%rsp), %rbp
	movq	20248(%rsp), %r12
	movq	20256(%rsp), %r13
	movq	20264(%rsp), %r14
	movq	20272(%rsp), %r15
	movq	20280(%rsp), %rsp
	ret
L_i_poly_decompress$1:
	movq	$0, %rdi
	movq	$0, %r8
	jmp 	L_i_poly_decompress$2
L_i_poly_decompress$3:
	movb	(%rsi,%r8), %r10b
	movb	%r10b, %r9b
	incq	%r8
	shrb	$5, %r10b
	movb	(%rsi,%r8), %r11b
	movb	%r11b, %bl
	shlb	$3, %r11b
	orb 	%r11b, %r10b
	incq	%r8
	shrb	$2, %bl
	movb	%bl, %r11b
	shrb	$5, %bl
	movb	(%rsi,%r8), %bpl
	movb	%bpl, %r12b
	shlb	$1, %bpl
	orb 	%bl, %bpl
	movb	%bpl, %bl
	incq	%r8
	shrb	$4, %r12b
	movb	(%rsi,%r8), %bpl
	movb	%bpl, %r13b
	shlb	$4, %bpl
	orb 	%r12b, %bpl
	incq	%r8
	movb	%r13b, %r14b
	shrb	$1, %r14b
	movb	%r14b, %r12b
	shrb	$5, %r14b
	movb	(%rsi,%r8), %r15b
	movb	%r15b, %r13b
	shlb	$2, %r15b
	orb 	%r14b, %r15b
	movb	%r15b, %r14b
	incq	%r8
	shrb	$3, %r13b
	movzbl	%r9b, %r9d
	andl	$31, %r9d
	imull	$3329, %r9d, %r9d
	addl	$16, %r9d
	shrl	$5, %r9d
	movw	%r9w, (%rdx,%rdi,2)
	incq	%rdi
	movzbl	%r10b, %r9d
	andl	$31, %r9d
	imull	$3329, %r9d, %r9d
	addl	$16, %r9d
	shrl	$5, %r9d
	movw	%r9w, (%rdx,%rdi,2)
	incq	%rdi
	movzbl	%r11b, %r9d
	andl	$31, %r9d
	imull	$3329, %r9d, %r9d
	addl	$16, %r9d
	shrl	$5, %r9d
	movw	%r9w, (%rdx,%rdi,2)
	incq	%rdi
	movzbl	%bl, %r9d
	andl	$31, %r9d
	imull	$3329, %r9d, %r9d
	addl	$16, %r9d
	shrl	$5, %r9d
	movw	%r9w, (%rdx,%rdi,2)
	incq	%rdi
	movzbl	%bpl, %r9d
	andl	$31, %r9d
	imull	$3329, %r9d, %r9d
	addl	$16, %r9d
	shrl	$5, %r9d
	movw	%r9w, (%rdx,%rdi,2)
	incq	%rdi
	movzbl	%r12b, %r9d
	andl	$31, %r9d
	imull	$3329, %r9d, %r9d
	addl	$16, %r9d
	shrl	$5, %r9d
	movw	%r9w, (%rdx,%rdi,2)
	incq	%rdi
	movzbl	%r14b, %r9d
	andl	$31, %r9d
	imull	$3329, %r9d, %r9d
	addl	$16, %r9d
	shrl	$5, %r9d
	movw	%r9w, (%rdx,%rdi,2)
	incq	%rdi
	movzbl	%r13b, %r9d
	andl	$31, %r9d
	imull	$3329, %r9d, %r9d
	addl	$16, %r9d
	shrl	$5, %r9d
	movw	%r9w, (%rdx,%rdi,2)
	incq	%rdi
L_i_poly_decompress$2:
	cmpq	$256, %rdi
	jb  	L_i_poly_decompress$3
	ret
L_i_poly_compress$1:
	call	L_poly_csubq$1
L_i_poly_compress$4:
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	L_i_poly_compress$2
L_i_poly_compress$3:
	movw	(%rdi,%rcx,2), %si
	movw	%si, %r8w
	shrw	$15, %r8w
	andw	$3329, %r8w
	addw	%r8w, %si
	movzwl	%si, %esi
	shll	$5, %esi
	addl	$1664, %esi
	imull	$40318, %esi, %esi
	shrl	$27, %esi
	andl	$31, %esi
	incq	%rcx
	movw	(%rdi,%rcx,2), %r8w
	movw	%r8w, %r9w
	shrw	$15, %r9w
	andw	$3329, %r9w
	addw	%r9w, %r8w
	movzwl	%r8w, %r8d
	shll	$5, %r8d
	addl	$1664, %r8d
	imull	$40318, %r8d, %r8d
	shrl	$27, %r8d
	andl	$31, %r8d
	incq	%rcx
	movw	(%rdi,%rcx,2), %r9w
	movw	%r9w, %r10w
	shrw	$15, %r10w
	andw	$3329, %r10w
	addw	%r10w, %r9w
	movzwl	%r9w, %r9d
	shll	$5, %r9d
	addl	$1664, %r9d
	imull	$40318, %r9d, %r9d
	shrl	$27, %r9d
	andl	$31, %r9d
	incq	%rcx
	movw	(%rdi,%rcx,2), %r10w
	movw	%r10w, %r11w
	shrw	$15, %r11w
	andw	$3329, %r11w
	addw	%r11w, %r10w
	movzwl	%r10w, %r10d
	shll	$5, %r10d
	addl	$1664, %r10d
	imull	$40318, %r10d, %r10d
	shrl	$27, %r10d
	andl	$31, %r10d
	incq	%rcx
	movw	(%rdi,%rcx,2), %r11w
	movw	%r11w, %bx
	shrw	$15, %bx
	andw	$3329, %bx
	addw	%bx, %r11w
	movzwl	%r11w, %r11d
	shll	$5, %r11d
	addl	$1664, %r11d
	imull	$40318, %r11d, %r11d
	shrl	$27, %r11d
	andl	$31, %r11d
	incq	%rcx
	movw	(%rdi,%rcx,2), %bx
	movw	%bx, %bp
	shrw	$15, %bp
	andw	$3329, %bp
	addw	%bp, %bx
	movzwl	%bx, %ebx
	shll	$5, %ebx
	addl	$1664, %ebx
	imull	$40318, %ebx, %ebx
	shrl	$27, %ebx
	andl	$31, %ebx
	incq	%rcx
	movw	(%rdi,%rcx,2), %bp
	movw	%bp, %r12w
	shrw	$15, %r12w
	andw	$3329, %r12w
	addw	%r12w, %bp
	movzwl	%bp, %ebp
	shll	$5, %ebp
	addl	$1664, %ebp
	imull	$40318, %ebp, %ebp
	shrl	$27, %ebp
	andl	$31, %ebp
	incq	%rcx
	movw	(%rdi,%rcx,2), %r12w
	movw	%r12w, %r13w
	shrw	$15, %r13w
	andw	$3329, %r13w
	addw	%r13w, %r12w
	movzwl	%r12w, %r12d
	shll	$5, %r12d
	addl	$1664, %r12d
	imull	$40318, %r12d, %r12d
	shrl	$27, %r12d
	andl	$31, %r12d
	incq	%rcx
	movb	%r8b, %r13b
	shlb	$5, %r13b
	orb 	%r13b, %sil
	movb	%sil, (%rax,%rdx)
	shrb	$3, %r8b
	shlb	$2, %r9b
	movb	%r10b, %sil
	shlb	$7, %sil
	orb 	%r9b, %r8b
	orb 	%sil, %r8b
	movb	%r8b, 1(%rax,%rdx)
	shrb	$1, %r10b
	movb	%r11b, %sil
	shlb	$4, %sil
	orb 	%sil, %r10b
	movb	%r10b, 2(%rax,%rdx)
	shrb	$4, %r11b
	shlb	$1, %bl
	movb	%bpl, %sil
	shlb	$6, %sil
	orb 	%bl, %r11b
	orb 	%sil, %r11b
	movb	%r11b, 3(%rax,%rdx)
	shrb	$2, %bpl
	shlb	$3, %r12b
	orb 	%r12b, %bpl
	movb	%bpl, 4(%rax,%rdx)
	addq	$5, %rdx
L_i_poly_compress$2:
	cmpq	$256, %rcx
	jb  	L_i_poly_compress$3
	ret
L_i_poly_tomsg$1:
	call	L_poly_csubq$1
L_i_poly_tomsg$2:
	movb	$0, %cl
	movw	(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	2(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	4(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	6(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	8(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	10(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	12(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	14(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, (%rax)
	movb	$0, %cl
	movw	16(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	18(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	20(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	22(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	24(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	26(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	28(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	30(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 1(%rax)
	movb	$0, %cl
	movw	32(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	34(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	36(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	38(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	40(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	42(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	44(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	46(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 2(%rax)
	movb	$0, %cl
	movw	48(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	50(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	52(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	54(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	56(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	58(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	60(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	62(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 3(%rax)
	movb	$0, %cl
	movw	64(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	66(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	68(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	70(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	72(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	74(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	76(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	78(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 4(%rax)
	movb	$0, %cl
	movw	80(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	82(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	84(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	86(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	88(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	90(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	92(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	94(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 5(%rax)
	movb	$0, %cl
	movw	96(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	98(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	100(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	102(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	104(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	106(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	108(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	110(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 6(%rax)
	movb	$0, %cl
	movw	112(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	114(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	116(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	118(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	120(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	122(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	124(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	126(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 7(%rax)
	movb	$0, %cl
	movw	128(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	130(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	132(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	134(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	136(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	138(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	140(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	142(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 8(%rax)
	movb	$0, %cl
	movw	144(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	146(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	148(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	150(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	152(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	154(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	156(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	158(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 9(%rax)
	movb	$0, %cl
	movw	160(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	162(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	164(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	166(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	168(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	170(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	172(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	174(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 10(%rax)
	movb	$0, %cl
	movw	176(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	178(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	180(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	182(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	184(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	186(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	188(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	190(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 11(%rax)
	movb	$0, %cl
	movw	192(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	194(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	196(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	198(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	200(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	202(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	204(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	206(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 12(%rax)
	movb	$0, %cl
	movw	208(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	210(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	212(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	214(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	216(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	218(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	220(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	222(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 13(%rax)
	movb	$0, %cl
	movw	224(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	226(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	228(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	230(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	232(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	234(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	236(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	238(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 14(%rax)
	movb	$0, %cl
	movw	240(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	242(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	244(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	246(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	248(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	250(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	252(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	254(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 15(%rax)
	movb	$0, %cl
	movw	256(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	258(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	260(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	262(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	264(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	266(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	268(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	270(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 16(%rax)
	movb	$0, %cl
	movw	272(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	274(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	276(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	278(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	280(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	282(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	284(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	286(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 17(%rax)
	movb	$0, %cl
	movw	288(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	290(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	292(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	294(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	296(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	298(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	300(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	302(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 18(%rax)
	movb	$0, %cl
	movw	304(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	306(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	308(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	310(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	312(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	314(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	316(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	318(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 19(%rax)
	movb	$0, %cl
	movw	320(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	322(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	324(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	326(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	328(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	330(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	332(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	334(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 20(%rax)
	movb	$0, %cl
	movw	336(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	338(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	340(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	342(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	344(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	346(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	348(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	350(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 21(%rax)
	movb	$0, %cl
	movw	352(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	354(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	356(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	358(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	360(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	362(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	364(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	366(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 22(%rax)
	movb	$0, %cl
	movw	368(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	370(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	372(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	374(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	376(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	378(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	380(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	382(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 23(%rax)
	movb	$0, %cl
	movw	384(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	386(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	388(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	390(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	392(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	394(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	396(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	398(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 24(%rax)
	movb	$0, %cl
	movw	400(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	402(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	404(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	406(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	408(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	410(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	412(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	414(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 25(%rax)
	movb	$0, %cl
	movw	416(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	418(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	420(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	422(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	424(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	426(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	428(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	430(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 26(%rax)
	movb	$0, %cl
	movw	432(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	434(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	436(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	438(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	440(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	442(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	444(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	446(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 27(%rax)
	movb	$0, %cl
	movw	448(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	450(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	452(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	454(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	456(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	458(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	460(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	462(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 28(%rax)
	movb	$0, %cl
	movw	464(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	466(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	468(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	470(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	472(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	474(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	476(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	478(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 29(%rax)
	movb	$0, %cl
	movw	480(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	482(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	484(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	486(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	488(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	490(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	492(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	494(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 30(%rax)
	movb	$0, %cl
	movw	496(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	498(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	500(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	502(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	504(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	506(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	508(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	510(%rdi), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	addl	$1665, %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 31(%rax)
	ret
L_poly_tobytes$1:
	call	L_poly_csubq$1
L_poly_tobytes$4:
	movq	$0, %r8
	movq	$0, %r9
	jmp 	L_poly_tobytes$2
L_poly_tobytes$3:
	movw	(%rdi,%r8,2), %r10w
	incq	%r8
	movw	(%rdi,%r8,2), %r11w
	incq	%r8
	movw	%r10w, %bx
	andw	$255, %bx
	movb	%bl, (%rsi,%r9)
	incq	%r9
	shrw	$8, %r10w
	movw	%r11w, %bx
	andw	$15, %bx
	shlw	$4, %bx
	orw 	%r10w, %bx
	movb	%bl, (%rsi,%r9)
	incq	%r9
	shrw	$4, %r11w
	movb	%r11b, (%rsi,%r9)
	incq	%r9
L_poly_tobytes$2:
	cmpq	$256, %r8
	jb  	L_poly_tobytes$3
	ret
L_poly_sub$1:
	movq	$0, %rdi
	jmp 	L_poly_sub$2
L_poly_sub$3:
	movw	(%rdx,%rdi,2), %r8w
	movw	(%rsi,%rdi,2), %r9w
	subw	%r9w, %r8w
	movw	%r8w, (%rcx,%rdi,2)
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
	movq	$0, %r10
	jmp 	L_poly_ntt$6
L_poly_ntt$7:
	incq	%rsi
	movw	(%rdx,%rsi,2), %r8w
	movq	%r10, %r9
	addq	%rdi, %r10
	jmp 	L_poly_ntt$8
L_poly_ntt$9:
	movw	(%rcx,%r9,2), %r11w
	movw	%r11w, %bx
	movq	%r9, %rbp
	addq	%rdi, %rbp
	movw	(%rcx,%rbp,2), %r12w
	movswl	%r12w, %r12d
	movswl	%r8w, %r13d
	imull	%r13d, %r12d
	imull	$-218038272, %r12d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %r13d
	addl	%r12d, %r13d
	sarl	$16, %r13d
	subw	%r13w, %bx
	addw	%r11w, %r13w
	movw	%bx, (%rcx,%rbp,2)
	movw	%r13w, (%rcx,%r9,2)
	incq	%r9
L_poly_ntt$8:
	cmpq	%r10, %r9
	jb  	L_poly_ntt$9
	movq	%r9, %r10
	addq	%rdi, %r10
L_poly_ntt$6:
	cmpq	$256, %r10
	jb  	L_poly_ntt$7
	shrq	$1, %rdi
L_poly_ntt$4:
	cmpq	$2, %rdi
	jnb 	L_poly_ntt$5
	movq	$0, %rdx
	jmp 	L_poly_ntt$2
L_poly_ntt$3:
	movw	(%rcx,%rdx,2), %si
	movswl	%si, %edi
	imull	$20159, %edi, %edi
	sarl	$26, %edi
	imull	$3329, %edi, %edi
	subw	%di, %si
	movw	%si, (%rcx,%rdx,2)
	incq	%rdx
L_poly_ntt$2:
	cmpq	$256, %rdx
	jb  	L_poly_ntt$3
	ret
L_poly_invntt$1:
	leaq	glob_data + 192(%rip), %rdx
	movq	$0, %rsi
	movq	$2, %rdi
	jmp 	L_poly_invntt$4
L_poly_invntt$5:
	movq	$0, %r10
	jmp 	L_poly_invntt$6
L_poly_invntt$7:
	movw	(%rdx,%rsi,2), %r8w
	incq	%rsi
	movq	%r10, %r9
	addq	%rdi, %r10
	jmp 	L_poly_invntt$8
L_poly_invntt$9:
	movw	(%rcx,%r9,2), %r11w
	movq	%r9, %rbx
	addq	%rdi, %rbx
	movw	(%rcx,%rbx,2), %bp
	movw	%bp, %r12w
	addw	%r11w, %r12w
	movswl	%r12w, %r13d
	imull	$20159, %r13d, %r13d
	sarl	$26, %r13d
	imull	$3329, %r13d, %r13d
	subw	%r13w, %r12w
	movw	%r12w, (%rcx,%r9,2)
	subw	%bp, %r11w
	movswl	%r11w, %r11d
	movswl	%r8w, %ebp
	imull	%ebp, %r11d
	imull	$-218038272, %r11d, %ebp
	sarl	$16, %ebp
	imull	$-3329, %ebp, %ebp
	addl	%r11d, %ebp
	sarl	$16, %ebp
	movw	%bp, (%rcx,%rbx,2)
	incq	%r9
L_poly_invntt$8:
	cmpq	%r10, %r9
	jb  	L_poly_invntt$9
	movq	%r9, %r10
	addq	%rdi, %r10
L_poly_invntt$6:
	cmpq	$256, %r10
	jb  	L_poly_invntt$7
	shlq	$1, %rdi
L_poly_invntt$4:
	cmpq	$128, %rdi
	jbe 	L_poly_invntt$5
	movw	254(%rdx), %dx
	movq	$0, %rsi
	jmp 	L_poly_invntt$2
L_poly_invntt$3:
	movw	(%rcx,%rsi,2), %di
	movswl	%di, %edi
	movswl	%dx, %r8d
	imull	%r8d, %edi
	imull	$-218038272, %edi, %r8d
	sarl	$16, %r8d
	imull	$-3329, %r8d, %r8d
	addl	%edi, %r8d
	sarl	$16, %r8d
	movw	%r8w, (%rcx,%rsi,2)
	incq	%rsi
L_poly_invntt$2:
	cmpq	$256, %rsi
	jb  	L_poly_invntt$3
	ret
L_poly_getnoise$1:
	movq	%rdx, %mm5
	movq	%rax, %rdx
	movb	(%rdx), %sil
	movb	%sil, 8(%rsp)
	movb	1(%rdx), %sil
	movb	%sil, 9(%rsp)
	movb	2(%rdx), %sil
	movb	%sil, 10(%rsp)
	movb	3(%rdx), %sil
	movb	%sil, 11(%rsp)
	movb	4(%rdx), %sil
	movb	%sil, 12(%rsp)
	movb	5(%rdx), %sil
	movb	%sil, 13(%rsp)
	movb	6(%rdx), %sil
	movb	%sil, 14(%rsp)
	movb	7(%rdx), %sil
	movb	%sil, 15(%rsp)
	movb	8(%rdx), %sil
	movb	%sil, 16(%rsp)
	movb	9(%rdx), %sil
	movb	%sil, 17(%rsp)
	movb	10(%rdx), %sil
	movb	%sil, 18(%rsp)
	movb	11(%rdx), %sil
	movb	%sil, 19(%rsp)
	movb	12(%rdx), %sil
	movb	%sil, 20(%rsp)
	movb	13(%rdx), %sil
	movb	%sil, 21(%rsp)
	movb	14(%rdx), %sil
	movb	%sil, 22(%rsp)
	movb	15(%rdx), %sil
	movb	%sil, 23(%rsp)
	movb	16(%rdx), %sil
	movb	%sil, 24(%rsp)
	movb	17(%rdx), %sil
	movb	%sil, 25(%rsp)
	movb	18(%rdx), %sil
	movb	%sil, 26(%rsp)
	movb	19(%rdx), %sil
	movb	%sil, 27(%rsp)
	movb	20(%rdx), %sil
	movb	%sil, 28(%rsp)
	movb	21(%rdx), %sil
	movb	%sil, 29(%rsp)
	movb	22(%rdx), %sil
	movb	%sil, 30(%rsp)
	movb	23(%rdx), %sil
	movb	%sil, 31(%rsp)
	movb	24(%rdx), %sil
	movb	%sil, 32(%rsp)
	movb	25(%rdx), %sil
	movb	%sil, 33(%rsp)
	movb	26(%rdx), %sil
	movb	%sil, 34(%rsp)
	movb	27(%rdx), %sil
	movb	%sil, 35(%rsp)
	movb	28(%rdx), %sil
	movb	%sil, 36(%rsp)
	movb	29(%rdx), %sil
	movb	%sil, 37(%rsp)
	movb	30(%rdx), %sil
	movb	%sil, 38(%rsp)
	movb	31(%rdx), %dl
	movb	%dl, 39(%rsp)
	movb	%cl, 40(%rsp)
	leaq	48(%rsp), %rcx
	leaq	8(%rsp), %rdx
	leaq	-216(%rsp), %rsp
	call	L_shake256_128_33$1
L_poly_getnoise$4:
	leaq	216(%rsp), %rsp
	movq	%mm5, %rcx
	movq	$0, %rdx
	jmp 	L_poly_getnoise$2
L_poly_getnoise$3:
	movb	48(%rsp,%rdx), %sil
	movb	%sil, %dil
	andb	$85, %dil
	shrb	$1, %sil
	andb	$85, %sil
	addb	%dil, %sil
	movb	%sil, %dil
	andb	$3, %dil
	movb	%sil, %r8b
	shrb	$2, %r8b
	andb	$3, %r8b
	subb	%r8b, %dil
	movsbw	%dil, %di
	movw	%di, (%rcx,%rdx,4)
	movb	%sil, %dil
	shrb	$4, %dil
	andb	$3, %dil
	shrb	$6, %sil
	andb	$3, %sil
	subb	%sil, %dil
	movsbw	%dil, %si
	movw	%si, 2(%rcx,%rdx,4)
	incq	%rdx
L_poly_getnoise$2:
	cmpq	$128, %rdx
	jb  	L_poly_getnoise$3
	ret
L_i_poly_frommsg$1:
	movb	(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, (%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 2(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 4(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 6(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 8(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 10(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 12(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 14(%rax)
	movb	1(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 16(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 18(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 20(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 22(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 24(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 26(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 28(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 30(%rax)
	movb	2(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 32(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 34(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 36(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 38(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 40(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 42(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 44(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 46(%rax)
	movb	3(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 48(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 50(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 52(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 54(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 56(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 58(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 60(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 62(%rax)
	movb	4(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 64(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 66(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 68(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 70(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 72(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 74(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 76(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 78(%rax)
	movb	5(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 80(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 82(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 84(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 86(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 88(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 90(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 92(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 94(%rax)
	movb	6(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 96(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 98(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 100(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 102(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 104(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 106(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 108(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 110(%rax)
	movb	7(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 112(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 114(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 116(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 118(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 120(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 122(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 124(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 126(%rax)
	movb	8(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 128(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 130(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 132(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 134(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 136(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 138(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 140(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 142(%rax)
	movb	9(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 144(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 146(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 148(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 150(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 152(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 154(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 156(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 158(%rax)
	movb	10(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 160(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 162(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 164(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 166(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 168(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 170(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 172(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 174(%rax)
	movb	11(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 176(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 178(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 180(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 182(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 184(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 186(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 188(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 190(%rax)
	movb	12(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 192(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 194(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 196(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 198(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 200(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 202(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 204(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 206(%rax)
	movb	13(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 208(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 210(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 212(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 214(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 216(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 218(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 220(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 222(%rax)
	movb	14(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 224(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 226(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 228(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 230(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 232(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 234(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 236(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 238(%rax)
	movb	15(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 240(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 242(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 244(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 246(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 248(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 250(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 252(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 254(%rax)
	movb	16(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 256(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 258(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 260(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 262(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 264(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 266(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 268(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 270(%rax)
	movb	17(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 272(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 274(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 276(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 278(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 280(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 282(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 284(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 286(%rax)
	movb	18(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 288(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 290(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 292(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 294(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 296(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 298(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 300(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 302(%rax)
	movb	19(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 304(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 306(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 308(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 310(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 312(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 314(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 316(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 318(%rax)
	movb	20(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 320(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 322(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 324(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 326(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 328(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 330(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 332(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 334(%rax)
	movb	21(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 336(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 338(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 340(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 342(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 344(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 346(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 348(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 350(%rax)
	movb	22(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 352(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 354(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 356(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 358(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 360(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 362(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 364(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 366(%rax)
	movb	23(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 368(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 370(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 372(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 374(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 376(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 378(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 380(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 382(%rax)
	movb	24(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 384(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 386(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 388(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 390(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 392(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 394(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 396(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 398(%rax)
	movb	25(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 400(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 402(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 404(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 406(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 408(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 410(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 412(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 414(%rax)
	movb	26(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 416(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 418(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 420(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 422(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 424(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 426(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 428(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 430(%rax)
	movb	27(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 432(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 434(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 436(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 438(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 440(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 442(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 444(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 446(%rax)
	movb	28(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 448(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 450(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 452(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 454(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 456(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 458(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 460(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 462(%rax)
	movb	29(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 464(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 466(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 468(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 470(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 472(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 474(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 476(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 478(%rax)
	movb	30(%rsi), %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 480(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 482(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 484(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 486(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 488(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 490(%rax)
	shrb	$1, %dil
	movzbw	%dil, %r8w
	andw	$1, %r8w
	imulw	$1665, %r8w, %r8w
	movw	%r8w, 492(%rax)
	shrb	$1, %dil
	movzbw	%dil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 494(%rax)
	movb	31(%rsi), %sil
	movzbw	%sil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 496(%rax)
	shrb	$1, %sil
	movzbw	%sil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 498(%rax)
	shrb	$1, %sil
	movzbw	%sil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 500(%rax)
	shrb	$1, %sil
	movzbw	%sil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 502(%rax)
	shrb	$1, %sil
	movzbw	%sil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 504(%rax)
	shrb	$1, %sil
	movzbw	%sil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 506(%rax)
	shrb	$1, %sil
	movzbw	%sil, %di
	andw	$1, %di
	imulw	$1665, %di, %di
	movw	%di, 508(%rax)
	shrb	$1, %sil
	movzbw	%sil, %si
	andw	$1, %si
	imulw	$1665, %si, %si
	movw	%si, 510(%rax)
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
	movb	(%r8), %r11b
	movb	1(%r8), %r9b
	movb	2(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, (%rdi)
	movw	%r10w, 2(%rdi)
	movb	3(%r8), %r11b
	movb	4(%r8), %r9b
	movb	5(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 4(%rdi)
	movw	%r10w, 6(%rdi)
	movb	6(%r8), %r11b
	movb	7(%r8), %r9b
	movb	8(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 8(%rdi)
	movw	%r10w, 10(%rdi)
	movb	9(%r8), %r11b
	movb	10(%r8), %r9b
	movb	11(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 12(%rdi)
	movw	%r10w, 14(%rdi)
	movb	12(%r8), %r11b
	movb	13(%r8), %r9b
	movb	14(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 16(%rdi)
	movw	%r10w, 18(%rdi)
	movb	15(%r8), %r11b
	movb	16(%r8), %r9b
	movb	17(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 20(%rdi)
	movw	%r10w, 22(%rdi)
	movb	18(%r8), %r11b
	movb	19(%r8), %r9b
	movb	20(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 24(%rdi)
	movw	%r10w, 26(%rdi)
	movb	21(%r8), %r11b
	movb	22(%r8), %r9b
	movb	23(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 28(%rdi)
	movw	%r10w, 30(%rdi)
	movb	24(%r8), %r11b
	movb	25(%r8), %r9b
	movb	26(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 32(%rdi)
	movw	%r10w, 34(%rdi)
	movb	27(%r8), %r11b
	movb	28(%r8), %r9b
	movb	29(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 36(%rdi)
	movw	%r10w, 38(%rdi)
	movb	30(%r8), %r11b
	movb	31(%r8), %r9b
	movb	32(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 40(%rdi)
	movw	%r10w, 42(%rdi)
	movb	33(%r8), %r11b
	movb	34(%r8), %r9b
	movb	35(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 44(%rdi)
	movw	%r10w, 46(%rdi)
	movb	36(%r8), %r11b
	movb	37(%r8), %r9b
	movb	38(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 48(%rdi)
	movw	%r10w, 50(%rdi)
	movb	39(%r8), %r11b
	movb	40(%r8), %r9b
	movb	41(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 52(%rdi)
	movw	%r10w, 54(%rdi)
	movb	42(%r8), %r11b
	movb	43(%r8), %r9b
	movb	44(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 56(%rdi)
	movw	%r10w, 58(%rdi)
	movb	45(%r8), %r11b
	movb	46(%r8), %r9b
	movb	47(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 60(%rdi)
	movw	%r10w, 62(%rdi)
	movb	48(%r8), %r11b
	movb	49(%r8), %r9b
	movb	50(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 64(%rdi)
	movw	%r10w, 66(%rdi)
	movb	51(%r8), %r11b
	movb	52(%r8), %r9b
	movb	53(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 68(%rdi)
	movw	%r10w, 70(%rdi)
	movb	54(%r8), %r11b
	movb	55(%r8), %r9b
	movb	56(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 72(%rdi)
	movw	%r10w, 74(%rdi)
	movb	57(%r8), %r11b
	movb	58(%r8), %r9b
	movb	59(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 76(%rdi)
	movw	%r10w, 78(%rdi)
	movb	60(%r8), %r11b
	movb	61(%r8), %r9b
	movb	62(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 80(%rdi)
	movw	%r10w, 82(%rdi)
	movb	63(%r8), %r11b
	movb	64(%r8), %r9b
	movb	65(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 84(%rdi)
	movw	%r10w, 86(%rdi)
	movb	66(%r8), %r11b
	movb	67(%r8), %r9b
	movb	68(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 88(%rdi)
	movw	%r10w, 90(%rdi)
	movb	69(%r8), %r11b
	movb	70(%r8), %r9b
	movb	71(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 92(%rdi)
	movw	%r10w, 94(%rdi)
	movb	72(%r8), %r11b
	movb	73(%r8), %r9b
	movb	74(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 96(%rdi)
	movw	%r10w, 98(%rdi)
	movb	75(%r8), %r11b
	movb	76(%r8), %r9b
	movb	77(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 100(%rdi)
	movw	%r10w, 102(%rdi)
	movb	78(%r8), %r11b
	movb	79(%r8), %r9b
	movb	80(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 104(%rdi)
	movw	%r10w, 106(%rdi)
	movb	81(%r8), %r11b
	movb	82(%r8), %r9b
	movb	83(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 108(%rdi)
	movw	%r10w, 110(%rdi)
	movb	84(%r8), %r11b
	movb	85(%r8), %r9b
	movb	86(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 112(%rdi)
	movw	%r10w, 114(%rdi)
	movb	87(%r8), %r11b
	movb	88(%r8), %r9b
	movb	89(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 116(%rdi)
	movw	%r10w, 118(%rdi)
	movb	90(%r8), %r11b
	movb	91(%r8), %r9b
	movb	92(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 120(%rdi)
	movw	%r10w, 122(%rdi)
	movb	93(%r8), %r11b
	movb	94(%r8), %r9b
	movb	95(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 124(%rdi)
	movw	%r10w, 126(%rdi)
	movb	96(%r8), %r11b
	movb	97(%r8), %r9b
	movb	98(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 128(%rdi)
	movw	%r10w, 130(%rdi)
	movb	99(%r8), %r11b
	movb	100(%r8), %r9b
	movb	101(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 132(%rdi)
	movw	%r10w, 134(%rdi)
	movb	102(%r8), %r11b
	movb	103(%r8), %r9b
	movb	104(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 136(%rdi)
	movw	%r10w, 138(%rdi)
	movb	105(%r8), %r11b
	movb	106(%r8), %r9b
	movb	107(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 140(%rdi)
	movw	%r10w, 142(%rdi)
	movb	108(%r8), %r11b
	movb	109(%r8), %r9b
	movb	110(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 144(%rdi)
	movw	%r10w, 146(%rdi)
	movb	111(%r8), %r11b
	movb	112(%r8), %r9b
	movb	113(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 148(%rdi)
	movw	%r10w, 150(%rdi)
	movb	114(%r8), %r11b
	movb	115(%r8), %r9b
	movb	116(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 152(%rdi)
	movw	%r10w, 154(%rdi)
	movb	117(%r8), %r11b
	movb	118(%r8), %r9b
	movb	119(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 156(%rdi)
	movw	%r10w, 158(%rdi)
	movb	120(%r8), %r11b
	movb	121(%r8), %r9b
	movb	122(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 160(%rdi)
	movw	%r10w, 162(%rdi)
	movb	123(%r8), %r11b
	movb	124(%r8), %r9b
	movb	125(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 164(%rdi)
	movw	%r10w, 166(%rdi)
	movb	126(%r8), %r11b
	movb	127(%r8), %r9b
	movb	128(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 168(%rdi)
	movw	%r10w, 170(%rdi)
	movb	129(%r8), %r11b
	movb	130(%r8), %r9b
	movb	131(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 172(%rdi)
	movw	%r10w, 174(%rdi)
	movb	132(%r8), %r11b
	movb	133(%r8), %r9b
	movb	134(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 176(%rdi)
	movw	%r10w, 178(%rdi)
	movb	135(%r8), %r11b
	movb	136(%r8), %r9b
	movb	137(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 180(%rdi)
	movw	%r10w, 182(%rdi)
	movb	138(%r8), %r11b
	movb	139(%r8), %r9b
	movb	140(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 184(%rdi)
	movw	%r10w, 186(%rdi)
	movb	141(%r8), %r11b
	movb	142(%r8), %r9b
	movb	143(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 188(%rdi)
	movw	%r10w, 190(%rdi)
	movb	144(%r8), %r11b
	movb	145(%r8), %r9b
	movb	146(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 192(%rdi)
	movw	%r10w, 194(%rdi)
	movb	147(%r8), %r11b
	movb	148(%r8), %r9b
	movb	149(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 196(%rdi)
	movw	%r10w, 198(%rdi)
	movb	150(%r8), %r11b
	movb	151(%r8), %r9b
	movb	152(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 200(%rdi)
	movw	%r10w, 202(%rdi)
	movb	153(%r8), %r11b
	movb	154(%r8), %r9b
	movb	155(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 204(%rdi)
	movw	%r10w, 206(%rdi)
	movb	156(%r8), %r11b
	movb	157(%r8), %r9b
	movb	158(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 208(%rdi)
	movw	%r10w, 210(%rdi)
	movb	159(%r8), %r11b
	movb	160(%r8), %r9b
	movb	161(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 212(%rdi)
	movw	%r10w, 214(%rdi)
	movb	162(%r8), %r11b
	movb	163(%r8), %r9b
	movb	164(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 216(%rdi)
	movw	%r10w, 218(%rdi)
	movb	165(%r8), %r11b
	movb	166(%r8), %r9b
	movb	167(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 220(%rdi)
	movw	%r10w, 222(%rdi)
	movb	168(%r8), %r11b
	movb	169(%r8), %r9b
	movb	170(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 224(%rdi)
	movw	%r10w, 226(%rdi)
	movb	171(%r8), %r11b
	movb	172(%r8), %r9b
	movb	173(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 228(%rdi)
	movw	%r10w, 230(%rdi)
	movb	174(%r8), %r11b
	movb	175(%r8), %r9b
	movb	176(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 232(%rdi)
	movw	%r10w, 234(%rdi)
	movb	177(%r8), %r11b
	movb	178(%r8), %r9b
	movb	179(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 236(%rdi)
	movw	%r10w, 238(%rdi)
	movb	180(%r8), %r11b
	movb	181(%r8), %r9b
	movb	182(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 240(%rdi)
	movw	%r10w, 242(%rdi)
	movb	183(%r8), %r11b
	movb	184(%r8), %r9b
	movb	185(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 244(%rdi)
	movw	%r10w, 246(%rdi)
	movb	186(%r8), %r11b
	movb	187(%r8), %r9b
	movb	188(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 248(%rdi)
	movw	%r10w, 250(%rdi)
	movb	189(%r8), %r11b
	movb	190(%r8), %r9b
	movb	191(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 252(%rdi)
	movw	%r10w, 254(%rdi)
	movb	192(%r8), %r11b
	movb	193(%r8), %r9b
	movb	194(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 256(%rdi)
	movw	%r10w, 258(%rdi)
	movb	195(%r8), %r11b
	movb	196(%r8), %r9b
	movb	197(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 260(%rdi)
	movw	%r10w, 262(%rdi)
	movb	198(%r8), %r11b
	movb	199(%r8), %r9b
	movb	200(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 264(%rdi)
	movw	%r10w, 266(%rdi)
	movb	201(%r8), %r11b
	movb	202(%r8), %r9b
	movb	203(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 268(%rdi)
	movw	%r10w, 270(%rdi)
	movb	204(%r8), %r11b
	movb	205(%r8), %r9b
	movb	206(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 272(%rdi)
	movw	%r10w, 274(%rdi)
	movb	207(%r8), %r11b
	movb	208(%r8), %r9b
	movb	209(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 276(%rdi)
	movw	%r10w, 278(%rdi)
	movb	210(%r8), %r11b
	movb	211(%r8), %r9b
	movb	212(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 280(%rdi)
	movw	%r10w, 282(%rdi)
	movb	213(%r8), %r11b
	movb	214(%r8), %r9b
	movb	215(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 284(%rdi)
	movw	%r10w, 286(%rdi)
	movb	216(%r8), %r11b
	movb	217(%r8), %r9b
	movb	218(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 288(%rdi)
	movw	%r10w, 290(%rdi)
	movb	219(%r8), %r11b
	movb	220(%r8), %r9b
	movb	221(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 292(%rdi)
	movw	%r10w, 294(%rdi)
	movb	222(%r8), %r11b
	movb	223(%r8), %r9b
	movb	224(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 296(%rdi)
	movw	%r10w, 298(%rdi)
	movb	225(%r8), %r11b
	movb	226(%r8), %r9b
	movb	227(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 300(%rdi)
	movw	%r10w, 302(%rdi)
	movb	228(%r8), %r11b
	movb	229(%r8), %r9b
	movb	230(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 304(%rdi)
	movw	%r10w, 306(%rdi)
	movb	231(%r8), %r11b
	movb	232(%r8), %r9b
	movb	233(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 308(%rdi)
	movw	%r10w, 310(%rdi)
	movb	234(%r8), %r11b
	movb	235(%r8), %r9b
	movb	236(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 312(%rdi)
	movw	%r10w, 314(%rdi)
	movb	237(%r8), %r11b
	movb	238(%r8), %r9b
	movb	239(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 316(%rdi)
	movw	%r10w, 318(%rdi)
	movb	240(%r8), %r11b
	movb	241(%r8), %r9b
	movb	242(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 320(%rdi)
	movw	%r10w, 322(%rdi)
	movb	243(%r8), %r11b
	movb	244(%r8), %r9b
	movb	245(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 324(%rdi)
	movw	%r10w, 326(%rdi)
	movb	246(%r8), %r11b
	movb	247(%r8), %r9b
	movb	248(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 328(%rdi)
	movw	%r10w, 330(%rdi)
	movb	249(%r8), %r11b
	movb	250(%r8), %r9b
	movb	251(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 332(%rdi)
	movw	%r10w, 334(%rdi)
	movb	252(%r8), %r11b
	movb	253(%r8), %r9b
	movb	254(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 336(%rdi)
	movw	%r10w, 338(%rdi)
	movb	255(%r8), %r11b
	movb	256(%r8), %r9b
	movb	257(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 340(%rdi)
	movw	%r10w, 342(%rdi)
	movb	258(%r8), %r11b
	movb	259(%r8), %r9b
	movb	260(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 344(%rdi)
	movw	%r10w, 346(%rdi)
	movb	261(%r8), %r11b
	movb	262(%r8), %r9b
	movb	263(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 348(%rdi)
	movw	%r10w, 350(%rdi)
	movb	264(%r8), %r11b
	movb	265(%r8), %r9b
	movb	266(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 352(%rdi)
	movw	%r10w, 354(%rdi)
	movb	267(%r8), %r11b
	movb	268(%r8), %r9b
	movb	269(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 356(%rdi)
	movw	%r10w, 358(%rdi)
	movb	270(%r8), %r11b
	movb	271(%r8), %r9b
	movb	272(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 360(%rdi)
	movw	%r10w, 362(%rdi)
	movb	273(%r8), %r11b
	movb	274(%r8), %r9b
	movb	275(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 364(%rdi)
	movw	%r10w, 366(%rdi)
	movb	276(%r8), %r11b
	movb	277(%r8), %r9b
	movb	278(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 368(%rdi)
	movw	%r10w, 370(%rdi)
	movb	279(%r8), %r11b
	movb	280(%r8), %r9b
	movb	281(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 372(%rdi)
	movw	%r10w, 374(%rdi)
	movb	282(%r8), %r11b
	movb	283(%r8), %r9b
	movb	284(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 376(%rdi)
	movw	%r10w, 378(%rdi)
	movb	285(%r8), %r11b
	movb	286(%r8), %r9b
	movb	287(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 380(%rdi)
	movw	%r10w, 382(%rdi)
	movb	288(%r8), %r11b
	movb	289(%r8), %r9b
	movb	290(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 384(%rdi)
	movw	%r10w, 386(%rdi)
	movb	291(%r8), %r11b
	movb	292(%r8), %r9b
	movb	293(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 388(%rdi)
	movw	%r10w, 390(%rdi)
	movb	294(%r8), %r11b
	movb	295(%r8), %r9b
	movb	296(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 392(%rdi)
	movw	%r10w, 394(%rdi)
	movb	297(%r8), %r11b
	movb	298(%r8), %r9b
	movb	299(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 396(%rdi)
	movw	%r10w, 398(%rdi)
	movb	300(%r8), %r11b
	movb	301(%r8), %r9b
	movb	302(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 400(%rdi)
	movw	%r10w, 402(%rdi)
	movb	303(%r8), %r11b
	movb	304(%r8), %r9b
	movb	305(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 404(%rdi)
	movw	%r10w, 406(%rdi)
	movb	306(%r8), %r11b
	movb	307(%r8), %r9b
	movb	308(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 408(%rdi)
	movw	%r10w, 410(%rdi)
	movb	309(%r8), %r11b
	movb	310(%r8), %r9b
	movb	311(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 412(%rdi)
	movw	%r10w, 414(%rdi)
	movb	312(%r8), %r11b
	movb	313(%r8), %r9b
	movb	314(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 416(%rdi)
	movw	%r10w, 418(%rdi)
	movb	315(%r8), %r11b
	movb	316(%r8), %r9b
	movb	317(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 420(%rdi)
	movw	%r10w, 422(%rdi)
	movb	318(%r8), %r11b
	movb	319(%r8), %r9b
	movb	320(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 424(%rdi)
	movw	%r10w, 426(%rdi)
	movb	321(%r8), %r11b
	movb	322(%r8), %r9b
	movb	323(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 428(%rdi)
	movw	%r10w, 430(%rdi)
	movb	324(%r8), %r11b
	movb	325(%r8), %r9b
	movb	326(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 432(%rdi)
	movw	%r10w, 434(%rdi)
	movb	327(%r8), %r11b
	movb	328(%r8), %r9b
	movb	329(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 436(%rdi)
	movw	%r10w, 438(%rdi)
	movb	330(%r8), %r11b
	movb	331(%r8), %r9b
	movb	332(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 440(%rdi)
	movw	%r10w, 442(%rdi)
	movb	333(%r8), %r11b
	movb	334(%r8), %r9b
	movb	335(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 444(%rdi)
	movw	%r10w, 446(%rdi)
	movb	336(%r8), %r11b
	movb	337(%r8), %r9b
	movb	338(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 448(%rdi)
	movw	%r10w, 450(%rdi)
	movb	339(%r8), %r11b
	movb	340(%r8), %r9b
	movb	341(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 452(%rdi)
	movw	%r10w, 454(%rdi)
	movb	342(%r8), %r11b
	movb	343(%r8), %r9b
	movb	344(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 456(%rdi)
	movw	%r10w, 458(%rdi)
	movb	345(%r8), %r11b
	movb	346(%r8), %r9b
	movb	347(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 460(%rdi)
	movw	%r10w, 462(%rdi)
	movb	348(%r8), %r11b
	movb	349(%r8), %r9b
	movb	350(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 464(%rdi)
	movw	%r10w, 466(%rdi)
	movb	351(%r8), %r11b
	movb	352(%r8), %r9b
	movb	353(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 468(%rdi)
	movw	%r10w, 470(%rdi)
	movb	354(%r8), %r11b
	movb	355(%r8), %r9b
	movb	356(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 472(%rdi)
	movw	%r10w, 474(%rdi)
	movb	357(%r8), %r11b
	movb	358(%r8), %r9b
	movb	359(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 476(%rdi)
	movw	%r10w, 478(%rdi)
	movb	360(%r8), %r11b
	movb	361(%r8), %r9b
	movb	362(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 480(%rdi)
	movw	%r10w, 482(%rdi)
	movb	363(%r8), %r11b
	movb	364(%r8), %r9b
	movb	365(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 484(%rdi)
	movw	%r10w, 486(%rdi)
	movb	366(%r8), %r11b
	movb	367(%r8), %r9b
	movb	368(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 488(%rdi)
	movw	%r10w, 490(%rdi)
	movb	369(%r8), %r11b
	movb	370(%r8), %r9b
	movb	371(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 492(%rdi)
	movw	%r10w, 494(%rdi)
	movb	372(%r8), %r11b
	movb	373(%r8), %r9b
	movb	374(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 496(%rdi)
	movw	%r10w, 498(%rdi)
	movb	375(%r8), %r11b
	movb	376(%r8), %r9b
	movb	377(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 500(%rdi)
	movw	%r10w, 502(%rdi)
	movb	378(%r8), %r11b
	movb	379(%r8), %r9b
	movb	380(%r8), %r10b
	movzbw	%r11b, %r11w
	movzbw	%r9b, %bx
	andw	$15, %bx
	shlw	$8, %bx
	orw 	%bx, %r11w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r11w, 504(%rdi)
	movw	%r10w, 506(%rdi)
	movb	381(%r8), %r10b
	movb	382(%r8), %r9b
	movb	383(%r8), %r11b
	movzbw	%r10b, %r8w
	movzbw	%r9b, %r10w
	andw	$15, %r10w
	shlw	$8, %r10w
	orw 	%r10w, %r8w
	movzbw	%r11b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 508(%rdi)
	movw	%r10w, 510(%rdi)
	ret
L_poly_basemul$1:
	movq	%rsi, 8(%rsp)
	movq	$0, %rsi
	jmp 	L_poly_basemul$2
L_poly_basemul$3:
	leaq	glob_data + 576(%rip), %rdi
	movq	%rsi, %r8
	shrq	$2, %r8
	movw	(%rdi,%r8,2), %di
	movw	(%rcx,%rsi,2), %r8w
	movw	(%rdx,%rsi,2), %r9w
	incq	%rsi
	movw	(%rcx,%rsi,2), %r10w
	movw	(%rdx,%rsi,2), %r11w
	addq	$-1, %rsi
	movswl	%r10w, %ebx
	movswl	%r11w, %ebp
	imull	%ebp, %ebx
	imull	$-218038272, %ebx, %ebp
	sarl	$16, %ebp
	imull	$-3329, %ebp, %ebp
	addl	%ebx, %ebp
	sarl	$16, %ebp
	movswl	%bp, %ebx
	movswl	%di, %ebp
	imull	%ebp, %ebx
	imull	$-218038272, %ebx, %ebp
	sarl	$16, %ebp
	imull	$-3329, %ebp, %ebp
	addl	%ebx, %ebp
	sarl	$16, %ebp
	movw	%bp, %bx
	movswl	%r8w, %ebp
	movswl	%r9w, %r12d
	imull	%r12d, %ebp
	imull	$-218038272, %ebp, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r12d
	addl	%ebp, %r12d
	sarl	$16, %r12d
	addw	%r12w, %bx
	movswl	%r8w, %r8d
	movswl	%r11w, %r11d
	imull	%r11d, %r8d
	imull	$-218038272, %r8d, %r11d
	sarl	$16, %r11d
	imull	$-3329, %r11d, %r11d
	addl	%r8d, %r11d
	sarl	$16, %r11d
	movswl	%r10w, %r8d
	movswl	%r9w, %r9d
	imull	%r9d, %r8d
	imull	$-218038272, %r8d, %r9d
	sarl	$16, %r9d
	imull	$-3329, %r9d, %r9d
	addl	%r8d, %r9d
	sarl	$16, %r9d
	addw	%r9w, %r11w
	movq	8(%rsp), %r8
	movw	%bx, (%r8,%rsi,2)
	incq	%rsi
	movw	%r11w, (%r8,%rsi,2)
	movq	%r8, 16(%rsp)
	negw	%di
	incq	%rsi
	movw	(%rcx,%rsi,2), %r8w
	movw	(%rdx,%rsi,2), %r9w
	incq	%rsi
	movw	(%rcx,%rsi,2), %r10w
	movw	(%rdx,%rsi,2), %r11w
	addq	$-1, %rsi
	movswl	%r10w, %ebx
	movswl	%r11w, %ebp
	imull	%ebp, %ebx
	imull	$-218038272, %ebx, %ebp
	sarl	$16, %ebp
	imull	$-3329, %ebp, %ebp
	addl	%ebx, %ebp
	sarl	$16, %ebp
	movswl	%bp, %ebx
	movswl	%di, %edi
	imull	%edi, %ebx
	imull	$-218038272, %ebx, %edi
	sarl	$16, %edi
	imull	$-3329, %edi, %edi
	addl	%ebx, %edi
	sarl	$16, %edi
	movswl	%r8w, %ebx
	movswl	%r9w, %ebp
	imull	%ebp, %ebx
	imull	$-218038272, %ebx, %ebp
	sarl	$16, %ebp
	imull	$-3329, %ebp, %ebp
	addl	%ebx, %ebp
	sarl	$16, %ebp
	addw	%bp, %di
	movswl	%r8w, %r8d
	movswl	%r11w, %r11d
	imull	%r11d, %r8d
	imull	$-218038272, %r8d, %r11d
	sarl	$16, %r11d
	imull	$-3329, %r11d, %r11d
	addl	%r8d, %r11d
	sarl	$16, %r11d
	movswl	%r10w, %r8d
	movswl	%r9w, %r9d
	imull	%r9d, %r8d
	imull	$-218038272, %r8d, %r9d
	sarl	$16, %r9d
	imull	$-3329, %r9d, %r9d
	addl	%r8d, %r9d
	sarl	$16, %r9d
	addw	%r9w, %r11w
	movq	16(%rsp), %r8
	movw	%di, (%r8,%rsi,2)
	incq	%rsi
	movw	%r11w, (%r8,%rsi,2)
	incq	%rsi
L_poly_basemul$2:
	cmpq	$253, %rsi
	jb  	L_poly_basemul$3
	ret
L_poly_csubq$1:
	movq	$0, %r8
	jmp 	L_poly_csubq$2
L_poly_csubq$3:
	movw	(%rdi,%r8,2), %r9w
	addw	$-3329, %r9w
	movw	%r9w, %r10w
	sarw	$15, %r10w
	andw	$3329, %r10w
	addw	%r10w, %r9w
	movw	%r9w, (%rdi,%r8,2)
	incq	%r8
L_poly_csubq$2:
	cmpq	$256, %r8
	jb  	L_poly_csubq$3
	ret
L_poly_add2$1:
	movq	$0, %rsi
	jmp 	L_poly_add2$2
L_poly_add2$3:
	movw	(%rcx,%rsi,2), %di
	movw	(%rdx,%rsi,2), %r8w
	addw	%r8w, %di
	movw	%di, (%rcx,%rsi,2)
	incq	%rsi
L_poly_add2$2:
	cmpq	$256, %rsi
	jb  	L_poly_add2$3
	ret
L_sha3_512A_A64$1:
	movq	%rcx, %mm2
	leaq	24(%rsp), %r15
	movq	$0, %rcx
	movq	$0, %rsi
	jmp 	L_sha3_512A_A64$7
L_sha3_512A_A64$8:
	movq	%rcx, (%r15,%rsi,8)
	incq	%rsi
L_sha3_512A_A64$7:
	cmpq	$25, %rsi
	jb  	L_sha3_512A_A64$8
	movq	$0, %rcx
	movq	$0, %rsi
	jmp 	L_sha3_512A_A64$5
L_sha3_512A_A64$6:
	movq	(%rdx,%rcx), %rdi
	addq	$8, %rcx
	xorq	(%r15,%rsi,8), %rdi
	movq	%rdi, (%r15,%rsi,8)
	incq	%rsi
L_sha3_512A_A64$5:
	cmpq	$8, %rsi
	jb  	L_sha3_512A_A64$6
	movq	$6, %rcx
	xorq	(%r15,%rsi,8), %rcx
	movq	%rcx, (%r15,%rsi,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	64(%r15), %rcx
	movq	%rcx, 64(%r15)
	movq	$0, %rcx
	movq	%mm2, %rdx
	movq	%rdx, 8(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A64$4:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	$0, %rsi
	jmp 	L_sha3_512A_A64$2
L_sha3_512A_A64$3:
	movq	(%r15,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rdx)
	incq	%rsi
	addq	$8, %rdx
L_sha3_512A_A64$2:
	cmpq	$8, %rsi
	jl  	L_sha3_512A_A64$3
	ret
L_sha3_256A_A1568$1:
	movq	%rdx, %mm3
	leaq	32(%rsp), %r15
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1568$12
L_sha3_256A_A1568$13:
	movq	%rdx, (%r15,%rsi,8)
	incq	%rsi
L_sha3_256A_A1568$12:
	cmpq	$25, %rsi
	jb  	L_sha3_256A_A1568$13
	movq	$0, %rdx
	movq	$0, %r8
	jmp 	L_sha3_256A_A1568$7
L_sha3_256A_A1568$8:
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1568$10
L_sha3_256A_A1568$11:
	movq	(%rcx,%rdx), %rdi
	addq	$8, %rdx
	xorq	(%r15,%rsi,8), %rdi
	movq	%rdi, (%r15,%rsi,8)
	incq	%rsi
L_sha3_256A_A1568$10:
	cmpq	$17, %rsi
	jb  	L_sha3_256A_A1568$11
	movq	%rcx, 8(%rsp)
	movq	%rdx, 16(%rsp)
	movq	%r8, 24(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1568$9:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	24(%rsp), %r8
	incq	%r8
L_sha3_256A_A1568$7:
	cmpq	$11, %r8
	jb  	L_sha3_256A_A1568$8
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1568$5
L_sha3_256A_A1568$6:
	movq	(%rcx,%rdx), %rdi
	addq	$8, %rdx
	xorq	(%r15,%rsi,8), %rdi
	movq	%rdi, (%r15,%rsi,8)
	incq	%rsi
L_sha3_256A_A1568$5:
	cmpq	$9, %rsi
	jb  	L_sha3_256A_A1568$6
	movq	$6, %rcx
	xorq	(%r15,%rsi,8), %rcx
	movq	%rcx, (%r15,%rsi,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	128(%r15), %rcx
	movq	%rcx, 128(%r15)
	movq	$0, %rcx
	movq	%mm3, %rdx
	movq	%rdx, 24(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1568$4:
	leaq	224(%rsp), %rsp
	movq	24(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1568$2
L_sha3_256A_A1568$3:
	movq	(%r15,%rsi,8), %rdi
	movq	%rdi, (%rcx,%rdx)
	incq	%rsi
	addq	$8, %rdx
L_sha3_256A_A1568$2:
	cmpq	$4, %rsi
	jl  	L_sha3_256A_A1568$3
	ret
L_shake128_squeezeblock$1:
	movq	%rax, %mm5
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake128_squeezeblock$4:
	leaq	224(%rsp), %rsp
	movq	%mm5, %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	L_shake128_squeezeblock$2
L_shake128_squeezeblock$3:
	movq	(%r15,%rdx,8), %rsi
	movq	%rsi, (%rax,%rcx)
	incq	%rdx
	addq	$8, %rcx
L_shake128_squeezeblock$2:
	cmpq	$21, %rdx
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
L_sha3_512A_A33$1:
	leaq	24(%rsp), %r15
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_sha3_512A_A33$7
L_sha3_512A_A33$8:
	movq	%rdx, (%r15,%rsi,8)
	incq	%rsi
L_sha3_512A_A33$7:
	cmpq	$25, %rsi
	jb  	L_sha3_512A_A33$8
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_sha3_512A_A33$5
L_sha3_512A_A33$6:
	movq	(%rcx,%rdx), %rdi
	addq	$8, %rdx
	xorq	(%r15,%rsi,8), %rdi
	movq	%rdi, (%r15,%rsi,8)
	incq	%rsi
L_sha3_512A_A33$5:
	cmpq	$4, %rsi
	jb  	L_sha3_512A_A33$6
	movq	$0, %rdi
	movq	$0, %r8
	movzbq	(%rcx,%rdx), %rcx
	orq 	$1536, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %r8
	shlq	$0, %r8
	orq 	%r8, %rdi
	xorq	(%r15,%rsi,8), %rdi
	movq	%rdi, (%r15,%rsi,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	64(%r15), %rcx
	movq	%rcx, 64(%r15)
	movq	$0, %rcx
	movq	%rax, 8(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A33$4:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	$0, %rdx
	jmp 	L_sha3_512A_A33$2
L_sha3_512A_A33$3:
	movq	(%r15,%rdx,8), %rsi
	movq	%rsi, (%rax,%rcx)
	incq	%rdx
	addq	$8, %rcx
L_sha3_512A_A33$2:
	cmpq	$8, %rdx
	jl  	L_sha3_512A_A33$3
	ret
L_shake256_A32__A1600$1:
	leaq	32(%rsp), %r15
	movq	$0, %rsi
	movq	$0, %rdi
	jmp 	L_shake256_A32__A1600$17
L_shake256_A32__A1600$18:
	movq	%rsi, (%r15,%rdi,8)
	incq	%rdi
L_shake256_A32__A1600$17:
	cmpq	$25, %rdi
	jb  	L_shake256_A32__A1600$18
	movq	$0, %rsi
	movq	$0, %rdi
	jmp 	L_shake256_A32__A1600$15
L_shake256_A32__A1600$16:
	movq	(%rdx,%rsi), %r8
	addq	$8, %rsi
	xorq	(%r15,%rdi,8), %r8
	movq	%r8, (%r15,%rdi,8)
	incq	%rdi
L_shake256_A32__A1600$15:
	cmpq	$4, %rdi
	jb  	L_shake256_A32__A1600$16
	movq	$0, %rdx
	movq	$4, %rsi
	jmp 	L_shake256_A32__A1600$13
L_shake256_A32__A1600$14:
	movq	(%rcx,%rdx), %rdi
	addq	$8, %rdx
	xorq	(%r15,%rsi,8), %rdi
	movq	%rdi, (%r15,%rsi,8)
	incq	%rsi
L_shake256_A32__A1600$13:
	cmpq	$17, %rsi
	jb  	L_shake256_A32__A1600$14
	movq	%rcx, 8(%rsp)
	movq	%rdx, 16(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1600$12:
	leaq	224(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	$0, %r8
	jmp 	L_shake256_A32__A1600$7
L_shake256_A32__A1600$8:
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1600$10
L_shake256_A32__A1600$11:
	movq	(%rcx,%rdx), %rdi
	addq	$8, %rdx
	xorq	(%r15,%rsi,8), %rdi
	movq	%rdi, (%r15,%rsi,8)
	incq	%rsi
L_shake256_A32__A1600$10:
	cmpq	$17, %rsi
	jb  	L_shake256_A32__A1600$11
	movq	%rcx, 16(%rsp)
	movq	%rdx, 8(%rsp)
	movq	%r8, 24(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1600$9:
	leaq	224(%rsp), %rsp
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	24(%rsp), %r8
	incq	%r8
L_shake256_A32__A1600$7:
	cmpq	$10, %r8
	jb  	L_shake256_A32__A1600$8
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1600$5
L_shake256_A32__A1600$6:
	movq	(%rcx,%rdx), %rdi
	addq	$8, %rdx
	xorq	(%r15,%rsi,8), %rdi
	movq	%rdi, (%r15,%rsi,8)
	incq	%rsi
L_shake256_A32__A1600$5:
	cmpq	$13, %rsi
	jb  	L_shake256_A32__A1600$6
	movq	$31, %rcx
	xorq	(%r15,%rsi,8), %rcx
	movq	%rcx, (%r15,%rsi,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	128(%r15), %rcx
	movq	%rcx, 128(%r15)
	movq	$0, %rcx
	movq	%rax, 24(%rsp)
	movq	%rcx, 8(%rsp)
	leaq	-224(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1600$4:
	leaq	224(%rsp), %rsp
	movq	24(%rsp), %rdx
	movq	8(%rsp), %rax
	movq	$0, %rcx
	jmp 	L_shake256_A32__A1600$2
L_shake256_A32__A1600$3:
	movq	(%r15,%rcx,8), %rsi
	movq	%rsi, (%rdx,%rax)
	incq	%rcx
	addq	$8, %rax
L_shake256_A32__A1600$2:
	cmpq	$4, %rcx
	jl  	L_shake256_A32__A1600$3
	ret
L_shake256_128_33$1:
	movq	%rcx, %mm6
	leaq	24(%rsp), %r15
	movq	$0, %rcx
	movq	$0, %rsi
	jmp 	L_shake256_128_33$7
L_shake256_128_33$8:
	movq	%rcx, (%r15,%rsi,8)
	incq	%rsi
L_shake256_128_33$7:
	cmpq	$25, %rsi
	jb  	L_shake256_128_33$8
	movq	$0, %rcx
	movq	$0, %rsi
	jmp 	L_shake256_128_33$5
L_shake256_128_33$6:
	movq	(%rdx,%rcx), %rdi
	addq	$8, %rcx
	xorq	(%r15,%rsi,8), %rdi
	movq	%rdi, (%r15,%rsi,8)
	incq	%rsi
L_shake256_128_33$5:
	cmpq	$4, %rsi
	jb  	L_shake256_128_33$6
	movq	$0, %rdi
	movq	$0, %r8
	movzbq	(%rdx,%rcx), %rcx
	orq 	$7936, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %r8
	shlq	$0, %r8
	orq 	%r8, %rdi
	xorq	(%r15,%rsi,8), %rdi
	movq	%rdi, (%r15,%rsi,8)
	movq	$1, %rcx
	shlq	$63, %rcx
	xorq	128(%r15), %rcx
	movq	%rcx, 128(%r15)
	movq	$0, %rcx
	movq	%mm6, %rdx
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
	movq	(%r15,%rsi,8), %rdi
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
	movq	$0, %r9
L_keccakf1600_ref$2:
	movq	%r9, 16(%rsp)
	movq	8(%rsp), %rdx
	movq	(%rdx,%r9,8), %rdx
	movq	%rdx, 24(%rsp)
	movq	(%r15), %r8
	movq	8(%r15), %r11
	movq	16(%r15), %rbx
	movq	24(%r15), %r10
	movq	32(%r15), %rbp
	xorq	40(%r15), %r8
	xorq	48(%r15), %r11
	xorq	56(%r15), %rbx
	xorq	64(%r15), %r10
	xorq	72(%r15), %rbp
	xorq	80(%r15), %r8
	xorq	88(%r15), %r11
	xorq	96(%r15), %rbx
	xorq	104(%r15), %r10
	xorq	112(%r15), %rbp
	xorq	120(%r15), %r8
	xorq	128(%r15), %r11
	xorq	136(%r15), %rbx
	xorq	144(%r15), %r10
	xorq	152(%r15), %rbp
	xorq	160(%r15), %r8
	xorq	168(%r15), %r11
	xorq	176(%r15), %rbx
	xorq	184(%r15), %r10
	xorq	192(%r15), %rbp
	movq	%r11, %rdx
	rolq	$1, %rdx
	xorq	%rbp, %rdx
	movq	%rbx, %rsi
	rolq	$1, %rsi
	xorq	%r8, %rsi
	movq	%r10, %rdi
	rolq	$1, %rdi
	xorq	%r11, %rdi
	movq	%rbp, %r14
	rolq	$1, %r14
	xorq	%rbx, %r14
	rolq	$1, %r8
	xorq	%r10, %r8
	movq	(%r15), %r10
	xorq	%rdx, %r10
	movq	48(%r15), %r11
	xorq	%rsi, %r11
	rolq	$44, %r11
	movq	96(%r15), %rbx
	xorq	%rdi, %rbx
	rolq	$43, %rbx
	movq	144(%r15), %rbp
	xorq	%r14, %rbp
	rolq	$21, %rbp
	movq	192(%r15), %r12
	xorq	%r8, %r12
	rolq	$14, %r12
	movq	%r11, %r13
	notq	%r13
	andq	%rbx, %r13
	xorq	%r10, %r13
	xorq	24(%rsp), %r13
	movq	%r13, (%rcx)
	movq	%rbx, %r13
	notq	%r13
	andq	%rbp, %r13
	xorq	%r11, %r13
	movq	%r13, 8(%rcx)
	movq	%rbp, %r13
	notq	%r13
	andq	%r12, %r13
	xorq	%rbx, %r13
	movq	%r13, 16(%rcx)
	movq	%r12, %rbx
	notq	%rbx
	andq	%r10, %rbx
	xorq	%rbp, %rbx
	movq	%rbx, 24(%rcx)
	notq	%r10
	andq	%r11, %r10
	xorq	%r12, %r10
	movq	%r10, 32(%rcx)
	movq	24(%r15), %r10
	xorq	%r14, %r10
	rolq	$28, %r10
	movq	72(%r15), %r11
	xorq	%r8, %r11
	rolq	$20, %r11
	movq	80(%r15), %rbx
	xorq	%rdx, %rbx
	rolq	$3, %rbx
	movq	128(%r15), %rbp
	xorq	%rsi, %rbp
	rolq	$45, %rbp
	movq	176(%r15), %r12
	xorq	%rdi, %r12
	rolq	$61, %r12
	movq	%r11, %r13
	notq	%r13
	andq	%rbx, %r13
	xorq	%r10, %r13
	movq	%r13, 40(%rcx)
	movq	%rbx, %r13
	notq	%r13
	andq	%rbp, %r13
	xorq	%r11, %r13
	movq	%r13, 48(%rcx)
	movq	%rbp, %r13
	notq	%r13
	andq	%r12, %r13
	xorq	%rbx, %r13
	movq	%r13, 56(%rcx)
	movq	%r12, %rbx
	notq	%rbx
	andq	%r10, %rbx
	xorq	%rbp, %rbx
	movq	%rbx, 64(%rcx)
	notq	%r10
	andq	%r11, %r10
	xorq	%r12, %r10
	movq	%r10, 72(%rcx)
	movq	8(%r15), %r10
	xorq	%rsi, %r10
	rolq	$1, %r10
	movq	56(%r15), %r11
	xorq	%rdi, %r11
	rolq	$6, %r11
	movq	104(%r15), %rbx
	xorq	%r14, %rbx
	rolq	$25, %rbx
	movq	152(%r15), %rbp
	xorq	%r8, %rbp
	rolq	$8, %rbp
	movq	160(%r15), %r12
	xorq	%rdx, %r12
	rolq	$18, %r12
	movq	%r11, %r13
	notq	%r13
	andq	%rbx, %r13
	xorq	%r10, %r13
	movq	%r13, 80(%rcx)
	movq	%rbx, %r13
	notq	%r13
	andq	%rbp, %r13
	xorq	%r11, %r13
	movq	%r13, 88(%rcx)
	movq	%rbp, %r13
	notq	%r13
	andq	%r12, %r13
	xorq	%rbx, %r13
	movq	%r13, 96(%rcx)
	movq	%r12, %rbx
	notq	%rbx
	andq	%r10, %rbx
	xorq	%rbp, %rbx
	movq	%rbx, 104(%rcx)
	notq	%r10
	andq	%r11, %r10
	xorq	%r12, %r10
	movq	%r10, 112(%rcx)
	movq	32(%r15), %r10
	xorq	%r8, %r10
	rolq	$27, %r10
	movq	40(%r15), %r11
	xorq	%rdx, %r11
	rolq	$36, %r11
	movq	88(%r15), %rbx
	xorq	%rsi, %rbx
	rolq	$10, %rbx
	movq	136(%r15), %rbp
	xorq	%rdi, %rbp
	rolq	$15, %rbp
	movq	184(%r15), %r12
	xorq	%r14, %r12
	rolq	$56, %r12
	movq	%r11, %r13
	notq	%r13
	andq	%rbx, %r13
	xorq	%r10, %r13
	movq	%r13, 120(%rcx)
	movq	%rbx, %r13
	notq	%r13
	andq	%rbp, %r13
	xorq	%r11, %r13
	movq	%r13, 128(%rcx)
	movq	%rbp, %r13
	notq	%r13
	andq	%r12, %r13
	xorq	%rbx, %r13
	movq	%r13, 136(%rcx)
	movq	%r12, %rbx
	notq	%rbx
	andq	%r10, %rbx
	xorq	%rbp, %rbx
	movq	%rbx, 144(%rcx)
	notq	%r10
	andq	%r11, %r10
	xorq	%r12, %r10
	movq	%r10, 152(%rcx)
	movq	16(%r15), %r10
	xorq	%rdi, %r10
	rolq	$62, %r10
	movq	64(%r15), %rdi
	xorq	%r14, %rdi
	rolq	$55, %rdi
	movq	112(%r15), %r11
	xorq	%r8, %r11
	rolq	$39, %r11
	movq	120(%r15), %r8
	xorq	%rdx, %r8
	rolq	$41, %r8
	movq	168(%r15), %rdx
	xorq	%rsi, %rdx
	rolq	$2, %rdx
	movq	%rdi, %rsi
	notq	%rsi
	andq	%r11, %rsi
	xorq	%r10, %rsi
	movq	%rsi, 160(%rcx)
	movq	%r11, %rsi
	notq	%rsi
	andq	%r8, %rsi
	xorq	%rdi, %rsi
	movq	%rsi, 168(%rcx)
	movq	%r8, %rsi
	notq	%rsi
	andq	%rdx, %rsi
	xorq	%r11, %rsi
	movq	%rsi, 176(%rcx)
	movq	%rdx, %rsi
	notq	%rsi
	andq	%r10, %rsi
	xorq	%r8, %rsi
	movq	%rsi, 184(%rcx)
	notq	%r10
	andq	%rdi, %r10
	xorq	%rdx, %r10
	movq	%r10, 192(%rcx)
	movq	8(%rsp), %rdx
	movq	8(%rdx,%r9,8), %rdx
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
	movq	96(%rcx), %rbx
	xorq	%rdi, %rbx
	rolq	$43, %rbx
	movq	144(%rcx), %rbp
	xorq	%r8, %rbp
	rolq	$21, %rbp
	movq	192(%rcx), %r12
	xorq	%r9, %r12
	rolq	$14, %r12
	movq	%r11, %r13
	notq	%r13
	andq	%rbx, %r13
	xorq	%r10, %r13
	xorq	24(%rsp), %r13
	movq	%r13, (%r15)
	movq	%rbx, %r13
	notq	%r13
	andq	%rbp, %r13
	xorq	%r11, %r13
	movq	%r13, 8(%r15)
	movq	%rbp, %r13
	notq	%r13
	andq	%r12, %r13
	xorq	%rbx, %r13
	movq	%r13, 16(%r15)
	movq	%r12, %rbx
	notq	%rbx
	andq	%r10, %rbx
	xorq	%rbp, %rbx
	movq	%rbx, 24(%r15)
	notq	%r10
	andq	%r11, %r10
	xorq	%r12, %r10
	movq	%r10, 32(%r15)
	movq	24(%rcx), %r10
	xorq	%r8, %r10
	rolq	$28, %r10
	movq	72(%rcx), %r11
	xorq	%r9, %r11
	rolq	$20, %r11
	movq	80(%rcx), %rbx
	xorq	%rdx, %rbx
	rolq	$3, %rbx
	movq	128(%rcx), %rbp
	xorq	%rsi, %rbp
	rolq	$45, %rbp
	movq	176(%rcx), %r12
	xorq	%rdi, %r12
	rolq	$61, %r12
	movq	%r11, %r13
	notq	%r13
	andq	%rbx, %r13
	xorq	%r10, %r13
	movq	%r13, 40(%r15)
	movq	%rbx, %r13
	notq	%r13
	andq	%rbp, %r13
	xorq	%r11, %r13
	movq	%r13, 48(%r15)
	movq	%rbp, %r13
	notq	%r13
	andq	%r12, %r13
	xorq	%rbx, %r13
	movq	%r13, 56(%r15)
	movq	%r12, %rbx
	notq	%rbx
	andq	%r10, %rbx
	xorq	%rbp, %rbx
	movq	%rbx, 64(%r15)
	notq	%r10
	andq	%r11, %r10
	xorq	%r12, %r10
	movq	%r10, 72(%r15)
	movq	8(%rcx), %r10
	xorq	%rsi, %r10
	rolq	$1, %r10
	movq	56(%rcx), %r11
	xorq	%rdi, %r11
	rolq	$6, %r11
	movq	104(%rcx), %rbx
	xorq	%r8, %rbx
	rolq	$25, %rbx
	movq	152(%rcx), %rbp
	xorq	%r9, %rbp
	rolq	$8, %rbp
	movq	160(%rcx), %r12
	xorq	%rdx, %r12
	rolq	$18, %r12
	movq	%r11, %r13
	notq	%r13
	andq	%rbx, %r13
	xorq	%r10, %r13
	movq	%r13, 80(%r15)
	movq	%rbx, %r13
	notq	%r13
	andq	%rbp, %r13
	xorq	%r11, %r13
	movq	%r13, 88(%r15)
	movq	%rbp, %r13
	notq	%r13
	andq	%r12, %r13
	xorq	%rbx, %r13
	movq	%r13, 96(%r15)
	movq	%r12, %rbx
	notq	%rbx
	andq	%r10, %rbx
	xorq	%rbp, %rbx
	movq	%rbx, 104(%r15)
	notq	%r10
	andq	%r11, %r10
	xorq	%r12, %r10
	movq	%r10, 112(%r15)
	movq	32(%rcx), %r10
	xorq	%r9, %r10
	rolq	$27, %r10
	movq	40(%rcx), %r11
	xorq	%rdx, %r11
	rolq	$36, %r11
	movq	88(%rcx), %rbx
	xorq	%rsi, %rbx
	rolq	$10, %rbx
	movq	136(%rcx), %rbp
	xorq	%rdi, %rbp
	rolq	$15, %rbp
	movq	184(%rcx), %r12
	xorq	%r8, %r12
	rolq	$56, %r12
	movq	%r11, %r13
	notq	%r13
	andq	%rbx, %r13
	xorq	%r10, %r13
	movq	%r13, 120(%r15)
	movq	%rbx, %r13
	notq	%r13
	andq	%rbp, %r13
	xorq	%r11, %r13
	movq	%r13, 128(%r15)
	movq	%rbp, %r13
	notq	%r13
	andq	%r12, %r13
	xorq	%rbx, %r13
	movq	%r13, 136(%r15)
	movq	%r12, %rbx
	notq	%rbx
	andq	%r10, %rbx
	xorq	%rbp, %rbx
	movq	%rbx, 144(%r15)
	notq	%r10
	andq	%r11, %r10
	xorq	%r12, %r10
	movq	%r10, 152(%r15)
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
	movq	%rsi, 160(%r15)
	movq	%r8, %rsi
	notq	%rsi
	andq	%r9, %rsi
	xorq	%rdi, %rsi
	movq	%rsi, 168(%r15)
	movq	%r9, %rsi
	notq	%rsi
	andq	%rdx, %rsi
	xorq	%r8, %rsi
	movq	%rsi, 176(%r15)
	movq	%rdx, %rsi
	notq	%rsi
	andq	%r10, %rsi
	xorq	%r9, %rsi
	movq	%rsi, 184(%r15)
	notq	%r10
	andq	%rdi, %r10
	xorq	%rdx, %r10
	movq	%r10, 192(%r15)
	movq	16(%rsp), %r9
	addq	$2, %r9
	cmpq	$23, %r9
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
