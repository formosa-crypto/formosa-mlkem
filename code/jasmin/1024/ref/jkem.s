	.att_syntax
	.text
	.p2align	5
	.global	_jade_kem_mlkem_mlkem1024_amd64_ref_dec
	.global	jade_kem_mlkem_mlkem1024_amd64_ref_dec
	.global	_jade_kem_mlkem_mlkem1024_amd64_ref_enc
	.global	jade_kem_mlkem_mlkem1024_amd64_ref_enc
	.global	_jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand
	.global	jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand
	.global	_jade_kem_mlkem_mlkem1024_amd64_ref_keypair
	.global	jade_kem_mlkem_mlkem1024_amd64_ref_keypair
	.global	_jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand
	.global	jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand
	.type	_jade_kem_mlkem_mlkem1024_amd64_ref_dec, %function
	.type	jade_kem_mlkem_mlkem1024_amd64_ref_dec, %function
_jade_kem_mlkem_mlkem1024_amd64_ref_dec:
jade_kem_mlkem_mlkem1024_amd64_ref_dec:
	movq	%rsp, %rax
	leaq	-25408(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 25352(%rsp)
	movq	%rbp, 25360(%rsp)
	movq	%r12, 25368(%rsp)
	movq	%r13, 25376(%rsp)
	movq	%r14, 25384(%rsp)
	movq	%r15, 25392(%rsp)
	movq	%rax, 25400(%rsp)
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
	leaq	616(%rsp), %rdx
	leaq	16(%rsp), %rax
	movq	%rax, (%rsp)
	movq	%rdx, 8(%rsp)
	leaq	120(%rsp), %rax
	leaq	2184(%rsp), %rbx
	leaq	7400(%rsp), %rcx
	movq	%rdx, %rsi
	movq	$0, %rdi
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$405
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$406:
	movzbl	(%rsi,%r8), %r9d
	incq	%r8
	movzbl	(%rsi,%r8), %r10d
	incq	%r8
	movl	%r10d, %r11d
	shll	$8, %r11d
	orl 	%r11d, %r9d
	andl	$2047, %r9d
	imull	$3329, %r9d, %r9d
	addl	$1024, %r9d
	shrl	$11, %r9d
	movw	%r9w, (%rcx,%rdi,2)
	movzbl	(%rsi,%r8), %r9d
	incq	%r8
	shrl	$3, %r10d
	movl	%r9d, %r11d
	shll	$5, %r11d
	orl 	%r11d, %r10d
	andl	$2047, %r10d
	imull	$3329, %r10d, %r10d
	addl	$1024, %r10d
	shrl	$11, %r10d
	movw	%r10w, 2(%rcx,%rdi,2)
	movzbl	(%rsi,%r8), %r10d
	incq	%r8
	movzbl	(%rsi,%r8), %r11d
	incq	%r8
	shrl	$6, %r9d
	shll	$2, %r10d
	movl	%r11d, %ebp
	shll	$10, %ebp
	orl 	%ebp, %r10d
	orl 	%r9d, %r10d
	andl	$2047, %r10d
	imull	$3329, %r10d, %r10d
	addl	$1024, %r10d
	shrl	$11, %r10d
	movw	%r10w, 4(%rcx,%rdi,2)
	movzbl	(%rsi,%r8), %r10d
	incq	%r8
	shrl	$1, %r11d
	movl	%r10d, %ebp
	shll	$7, %ebp
	orl 	%ebp, %r11d
	andl	$2047, %r11d
	imull	$3329, %r11d, %r11d
	addl	$1024, %r11d
	shrl	$11, %r11d
	movw	%r11w, 6(%rcx,%rdi,2)
	movzbl	(%rsi,%r8), %r9d
	incq	%r8
	shrl	$4, %r10d
	movl	%r9d, %r11d
	shll	$4, %r11d
	orl 	%r11d, %r10d
	andl	$2047, %r10d
	imull	$3329, %r10d, %r10d
	addl	$1024, %r10d
	shrl	$11, %r10d
	movw	%r10w, 8(%rcx,%rdi,2)
	movzbl	(%rsi,%r8), %r11d
	incq	%r8
	movzbl	(%rsi,%r8), %r10d
	incq	%r8
	shrl	$7, %r9d
	shll	$1, %r11d
	movl	%r10d, %ebp
	shll	$9, %ebp
	orl 	%ebp, %r11d
	orl 	%r9d, %r11d
	andl	$2047, %r11d
	imull	$3329, %r11d, %r11d
	addl	$1024, %r11d
	shrl	$11, %r11d
	movw	%r11w, 10(%rcx,%rdi,2)
	movzbl	(%rsi,%r8), %r9d
	incq	%r8
	shrl	$2, %r10d
	movl	%r9d, %r11d
	shll	$6, %r11d
	orl 	%r11d, %r10d
	andl	$2047, %r10d
	imull	$3329, %r10d, %r10d
	addl	$1024, %r10d
	shrl	$11, %r10d
	movw	%r10w, 12(%rcx,%rdi,2)
	movzbl	(%rsi,%r8), %r10d
	incq	%r8
	shrl	$5, %r9d
	shll	$3, %r10d
	orl 	%r10d, %r9d
	andl	$2047, %r9d
	imull	$3329, %r9d, %r9d
	addl	$1024, %r9d
	shrl	$11, %r9d
	movw	%r9w, 14(%rcx,%rdi,2)
	addq	$8, %rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$405:
	cmpq	$1024, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$406
	leaq	5352(%rsp), %rcx
	leaq	1408(%rdx), %rdx
	call	L_i_poly_decompress$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$404:
	leaq	9448(%rsp), %rcx
	movq	%rbx, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$403:
	leaq	9960(%rsp), %rcx
	leaq	384(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$402:
	leaq	10472(%rsp), %rcx
	leaq	768(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$401:
	leaq	10984(%rsp), %rcx
	leaq	1152(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$400:
	leaq	7400(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$399:
	leaq	7912(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$398:
	leaq	8424(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$397:
	leaq	8936(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$396:
	leaq	5864(%rsp), %rsi
	leaq	9448(%rsp), %rdx
	leaq	7400(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$395:
	leaq	16(%rsp), %rsp
	leaq	6376(%rsp), %rsi
	leaq	9960(%rsp), %rdx
	leaq	7912(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$394:
	leaq	16(%rsp), %rsp
	leaq	5864(%rsp), %rcx
	leaq	6376(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$393:
	leaq	6376(%rsp), %rsi
	leaq	10472(%rsp), %rdx
	leaq	8424(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$392:
	leaq	16(%rsp), %rsp
	leaq	5864(%rsp), %rcx
	leaq	6376(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$391:
	leaq	6376(%rsp), %rsi
	leaq	10984(%rsp), %rdx
	leaq	8936(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$390:
	leaq	16(%rsp), %rsp
	leaq	5864(%rsp), %rcx
	leaq	6376(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$389:
	leaq	5864(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$387
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$388:
	movw	(%rcx,%r8,2), %r11w
	movswl	%r11w, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %r11w
	movw	%r11w, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$387:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$388
	leaq	5864(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$386:
	leaq	6376(%rsp), %rcx
	leaq	5352(%rsp), %rdx
	leaq	5864(%rsp), %rsi
	call	L_poly_sub$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$385:
	leaq	6376(%rsp), %rcx
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$383
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$384:
	movw	(%rcx,%r8,2), %r11w
	movswl	%r11w, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %r11w
	movw	%r11w, (%rcx,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$383:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$384
	leaq	6376(%rsp), %rcx
	call	L_i_poly_tomsg$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$382:
	movq	5288(%rsp), %rax
	movq	%rax, 152(%rsp)
	movq	5296(%rsp), %rax
	movq	%rax, 160(%rsp)
	movq	5304(%rsp), %rax
	movq	%rax, 168(%rsp)
	movq	5312(%rsp), %rax
	movq	%rax, 176(%rsp)
	leaq	184(%rsp), %rax
	leaq	120(%rsp), %r10
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$381:
	leaq	224(%rsp), %rsp
	leaq	23784(%rsp), %rcx
	leaq	120(%rsp), %rax
	leaq	3720(%rsp), %r10
	leaq	216(%rsp), %r11
	movq	%rcx, %mm1
	movq	%r10, %rbx
	leaq	7400(%rsp), %rcx
	movq	%rbx, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$380:
	leaq	7912(%rsp), %rcx
	leaq	384(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$379:
	leaq	8424(%rsp), %rcx
	leaq	768(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$378:
	leaq	8936(%rsp), %rcx
	leaq	1152(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$377:
	movq	1536(%r10), %rcx
	movq	%rcx, 48(%rsp)
	movq	1544(%r10), %rcx
	movq	%rcx, 56(%rsp)
	movq	1552(%r10), %rcx
	movq	%rcx, 64(%rsp)
	movq	1560(%r10), %rcx
	movq	%rcx, 72(%rsp)
	leaq	6376(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$376:
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
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$374
	movb	$0, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$375
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$374:
	movb	$0, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$375:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$373:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$360
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$361:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$372:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$370
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$371
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$370:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	15592(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$358
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$359:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$358:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$355:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$342
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$343:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$354:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$352
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$353
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$352:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	16104(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$340
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$341:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$340:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$337:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$324
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$325:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$336:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$334
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$335
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$334:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	16616(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$322
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$323:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$322:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$319:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$306
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$307:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$318:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$316
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$317
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$316:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	17128(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$304
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$305:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$304:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$301:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$288
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$289:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$300:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$298
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$299
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$298:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	17640(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$286
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$287:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$286:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$283:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$270
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$271:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$282:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$280
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$281
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$280:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	18152(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$268
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$269:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$268:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$265:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$252
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$253:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$264:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$262
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$263
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$262:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	18664(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$250
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$251:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$250:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$247:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$234
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$235:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$246:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$244
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$245
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$244:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	19176(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$232
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$233:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$232:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$229:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$216
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$217:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$228:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$226
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$227
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$226:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	19688(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$214
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$215:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$214:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$211:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$198
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$199:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$210:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$208
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$209
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$208:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	20200(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$196
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$197:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$196:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$193:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$180
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$181:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$192:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$190
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$191
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$190:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	20712(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$178
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$179:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$178:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$175:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$162
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$163:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$174:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$172
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$173
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$172:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	21224(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$160
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$161:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$160:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$157:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$144
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$145:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$156:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$154
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$155
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$154:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	21736(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$142
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$143:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$142:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$139:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$126
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$127:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$138:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$136
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$137
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$136:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	22248(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$124
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$125:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$124:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$121:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$108
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$109:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$120:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$118
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$119
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$118:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	22760(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$106
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$107:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$106:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$103:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$90
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$91:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$102:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$100
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$101
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$100:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5864(%rsp,%rcx,2)
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
	movw	%di, 5864(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	23272(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$88
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$89:
	movw	5864(%rsp,%rdx,2), %r9w
	movw	%r9w, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$88:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$89
	movq	%mm2, %rcx
	movb	$0, %al
	leaq	9448(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$87:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	9960(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$86:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	10472(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$85:
	leaq	176(%rsp), %rsp
	movb	$3, %al
	leaq	10984(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$84:
	leaq	176(%rsp), %rsp
	movq	%mm2, %rcx
	movb	$4, %al
	leaq	11496(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$83:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	12008(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$82:
	leaq	176(%rsp), %rsp
	movb	$6, %al
	leaq	12520(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$81:
	leaq	176(%rsp), %rsp
	movb	$7, %al
	leaq	13032(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$80:
	leaq	176(%rsp), %rsp
	movb	$8, %al
	leaq	5864(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$79:
	leaq	176(%rsp), %rsp
	leaq	9448(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$78:
	leaq	9960(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$77:
	leaq	10472(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$76:
	leaq	10984(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$75:
	leaq	13544(%rsp), %rsi
	leaq	15592(%rsp), %rdx
	leaq	9448(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$74:
	leaq	16(%rsp), %rsp
	leaq	5352(%rsp), %rsi
	leaq	16104(%rsp), %rdx
	leaq	9960(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$73:
	leaq	16(%rsp), %rsp
	leaq	13544(%rsp), %rcx
	leaq	5352(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$72:
	leaq	5352(%rsp), %rsi
	leaq	16616(%rsp), %rdx
	leaq	10472(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$71:
	leaq	16(%rsp), %rsp
	leaq	13544(%rsp), %rcx
	leaq	5352(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$70:
	leaq	5352(%rsp), %rsi
	leaq	17128(%rsp), %rdx
	leaq	10984(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$69:
	leaq	16(%rsp), %rsp
	leaq	13544(%rsp), %rcx
	leaq	5352(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$68:
	leaq	13544(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$66
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$67:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$66:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$67
	leaq	14056(%rsp), %rsi
	leaq	17640(%rsp), %rdx
	leaq	9448(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$65:
	leaq	16(%rsp), %rsp
	leaq	5352(%rsp), %rsi
	leaq	18152(%rsp), %rdx
	leaq	9960(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$64:
	leaq	16(%rsp), %rsp
	leaq	14056(%rsp), %rcx
	leaq	5352(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$63:
	leaq	5352(%rsp), %rsi
	leaq	18664(%rsp), %rdx
	leaq	10472(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$62:
	leaq	16(%rsp), %rsp
	leaq	14056(%rsp), %rcx
	leaq	5352(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$61:
	leaq	5352(%rsp), %rsi
	leaq	19176(%rsp), %rdx
	leaq	10984(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$60:
	leaq	16(%rsp), %rsp
	leaq	14056(%rsp), %rcx
	leaq	5352(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$59:
	leaq	14056(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$57
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$58:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$57:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$58
	leaq	14568(%rsp), %rsi
	leaq	19688(%rsp), %rdx
	leaq	9448(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$56:
	leaq	16(%rsp), %rsp
	leaq	5352(%rsp), %rsi
	leaq	20200(%rsp), %rdx
	leaq	9960(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$55:
	leaq	16(%rsp), %rsp
	leaq	14568(%rsp), %rcx
	leaq	5352(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$54:
	leaq	5352(%rsp), %rsi
	leaq	20712(%rsp), %rdx
	leaq	10472(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$53:
	leaq	16(%rsp), %rsp
	leaq	14568(%rsp), %rcx
	leaq	5352(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$52:
	leaq	5352(%rsp), %rsi
	leaq	21224(%rsp), %rdx
	leaq	10984(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$51:
	leaq	16(%rsp), %rsp
	leaq	14568(%rsp), %rcx
	leaq	5352(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$50:
	leaq	14568(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$48
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$49:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$48:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$49
	leaq	15080(%rsp), %rsi
	leaq	21736(%rsp), %rdx
	leaq	9448(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$47:
	leaq	16(%rsp), %rsp
	leaq	5352(%rsp), %rsi
	leaq	22248(%rsp), %rdx
	leaq	9960(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$46:
	leaq	16(%rsp), %rsp
	leaq	15080(%rsp), %rcx
	leaq	5352(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$45:
	leaq	5352(%rsp), %rsi
	leaq	22760(%rsp), %rdx
	leaq	10472(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$44:
	leaq	16(%rsp), %rsp
	leaq	15080(%rsp), %rcx
	leaq	5352(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$43:
	leaq	5352(%rsp), %rsi
	leaq	23272(%rsp), %rdx
	leaq	10984(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$42:
	leaq	16(%rsp), %rsp
	leaq	15080(%rsp), %rcx
	leaq	5352(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$41:
	leaq	15080(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$39
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$40:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$39:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$40
	leaq	5352(%rsp), %rsi
	leaq	7400(%rsp), %rdx
	leaq	9448(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$38:
	leaq	16(%rsp), %rsp
	leaq	6888(%rsp), %rsi
	leaq	7912(%rsp), %rdx
	leaq	9960(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$37:
	leaq	16(%rsp), %rsp
	leaq	5352(%rsp), %rcx
	leaq	6888(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$36:
	leaq	6888(%rsp), %rsi
	leaq	8424(%rsp), %rdx
	leaq	10472(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$35:
	leaq	16(%rsp), %rsp
	leaq	5352(%rsp), %rcx
	leaq	6888(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$34:
	leaq	6888(%rsp), %rsi
	leaq	8936(%rsp), %rdx
	leaq	10984(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$33:
	leaq	16(%rsp), %rsp
	leaq	5352(%rsp), %rcx
	leaq	6888(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$32:
	leaq	5352(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$30
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$31:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$30:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$31
	leaq	13544(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$29:
	leaq	14056(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$28:
	leaq	14568(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$27:
	leaq	15080(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$26:
	leaq	5352(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$25:
	leaq	13544(%rsp), %rcx
	leaq	11496(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$24:
	leaq	14056(%rsp), %rcx
	leaq	12008(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$23:
	leaq	14568(%rsp), %rcx
	leaq	12520(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$22:
	leaq	15080(%rsp), %rcx
	leaq	13032(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$21:
	leaq	5352(%rsp), %rcx
	leaq	5864(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$20:
	leaq	5352(%rsp), %rcx
	leaq	6376(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$19:
	leaq	13544(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$17
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$18:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$17:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$18
	leaq	14056(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$15
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$16:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$15:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$16
	leaq	14568(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$13
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$14:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$13:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$14
	leaq	15080(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$11
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$12:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$11:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$12
	leaq	5352(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$9
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$10:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$9:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$10
	movq	%mm1, %rax
	movq	%rax, %rsi
	movq	$0, %rdi
	movq	$0, %r8
	leaq	13544(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$8:
	leaq	14056(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$7:
	leaq	14568(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$6:
	leaq	15080(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$5:
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$3
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$4:
	movzwq	13544(%rsp,%rdi,2), %r9
	shlq	$11, %r9
	addq	$1664, %r9
	imulq	$645084, %r9, %r9
	shrq	$31, %r9
	andq	$2047, %r9
	movw	%r9w, %cx
	movzwq	13546(%rsp,%rdi,2), %r9
	shlq	$11, %r9
	addq	$1664, %r9
	imulq	$645084, %r9, %r9
	shrq	$31, %r9
	andq	$2047, %r9
	movw	%r9w, %dx
	movzwq	13548(%rsp,%rdi,2), %r9
	shlq	$11, %r9
	addq	$1664, %r9
	imulq	$645084, %r9, %r9
	shrq	$31, %r9
	andq	$2047, %r9
	movzwq	13550(%rsp,%rdi,2), %r10
	shlq	$11, %r10
	addq	$1664, %r10
	imulq	$645084, %r10, %r10
	shrq	$31, %r10
	andq	$2047, %r10
	movzwq	13552(%rsp,%rdi,2), %r11
	shlq	$11, %r11
	addq	$1664, %r11
	imulq	$645084, %r11, %r11
	shrq	$31, %r11
	andq	$2047, %r11
	movzwq	13554(%rsp,%rdi,2), %rbx
	shlq	$11, %rbx
	addq	$1664, %rbx
	imulq	$645084, %rbx, %rbx
	shrq	$31, %rbx
	andq	$2047, %rbx
	movzwq	13556(%rsp,%rdi,2), %rbp
	shlq	$11, %rbp
	addq	$1664, %rbp
	imulq	$645084, %rbp, %rbp
	shrq	$31, %rbp
	andq	$2047, %rbp
	movzwq	13558(%rsp,%rdi,2), %r12
	shlq	$11, %r12
	addq	$1664, %r12
	imulq	$645084, %r12, %r12
	shrq	$31, %r12
	andq	$2047, %r12
	movw	%cx, %r13w
	movb	%r13b, (%rsi,%r8)
	incq	%r8
	shrw	$8, %cx
	movw	%dx, %r13w
	shlw	$3, %r13w
	orw 	%cx, %r13w
	movb	%r13b, (%rsi,%r8)
	incq	%r8
	shrw	$5, %dx
	movw	%r9w, %r13w
	shlw	$6, %r13w
	orw 	%dx, %r13w
	movb	%r13b, (%rsi,%r8)
	incq	%r8
	movw	%r9w, %cx
	shrw	$2, %cx
	movb	%cl, (%rsi,%r8)
	incq	%r8
	shrw	$10, %r9w
	movw	%r10w, %dx
	shlw	$1, %dx
	orw 	%r9w, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	shrw	$7, %r10w
	movw	%r11w, %dx
	shlw	$4, %dx
	orw 	%r10w, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	shrw	$4, %r11w
	movw	%bx, %dx
	shlw	$7, %dx
	orw 	%r11w, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	movw	%bx, %cx
	shrw	$1, %cx
	movb	%cl, (%rsi,%r8)
	incq	%r8
	shrw	$9, %bx
	movw	%bp, %dx
	shlw	$2, %dx
	orw 	%bx, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	shrw	$6, %bp
	movw	%r12w, %dx
	shlw	$5, %dx
	orw 	%bp, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	shrw	$3, %r12w
	movb	%r12b, (%rsi,%r8)
	incq	%r8
	addq	$8, %rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$3:
	cmpq	$1024, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$4
	leaq	1408(%rax), %rax
	leaq	5352(%rsp), %rcx
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$2:
	movq	8(%rsp), %rax
	leaq	23784(%rsp), %rcx
	movq	$0, %rdx
	movb	(%rcx), %r9b
	movb	(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1(%rcx), %r9b
	movb	1(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	2(%rcx), %r9b
	movb	2(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	3(%rcx), %r9b
	movb	3(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	4(%rcx), %r9b
	movb	4(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	5(%rcx), %r9b
	movb	5(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	6(%rcx), %r9b
	movb	6(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	7(%rcx), %r9b
	movb	7(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	8(%rcx), %r9b
	movb	8(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	9(%rcx), %r9b
	movb	9(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	10(%rcx), %r9b
	movb	10(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	11(%rcx), %r9b
	movb	11(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	12(%rcx), %r9b
	movb	12(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	13(%rcx), %r9b
	movb	13(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	14(%rcx), %r9b
	movb	14(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	15(%rcx), %r9b
	movb	15(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	16(%rcx), %r9b
	movb	16(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	17(%rcx), %r9b
	movb	17(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	18(%rcx), %r9b
	movb	18(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	19(%rcx), %r9b
	movb	19(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	20(%rcx), %r9b
	movb	20(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	21(%rcx), %r9b
	movb	21(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	22(%rcx), %r9b
	movb	22(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	23(%rcx), %r9b
	movb	23(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	24(%rcx), %r9b
	movb	24(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	25(%rcx), %r9b
	movb	25(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	26(%rcx), %r9b
	movb	26(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	27(%rcx), %r9b
	movb	27(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	28(%rcx), %r9b
	movb	28(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	29(%rcx), %r9b
	movb	29(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	30(%rcx), %r9b
	movb	30(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	31(%rcx), %r9b
	movb	31(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	32(%rcx), %r9b
	movb	32(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	33(%rcx), %r9b
	movb	33(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	34(%rcx), %r9b
	movb	34(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	35(%rcx), %r9b
	movb	35(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	36(%rcx), %r9b
	movb	36(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	37(%rcx), %r9b
	movb	37(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	38(%rcx), %r9b
	movb	38(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	39(%rcx), %r9b
	movb	39(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	40(%rcx), %r9b
	movb	40(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	41(%rcx), %r9b
	movb	41(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	42(%rcx), %r9b
	movb	42(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	43(%rcx), %r9b
	movb	43(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	44(%rcx), %r9b
	movb	44(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	45(%rcx), %r9b
	movb	45(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	46(%rcx), %r9b
	movb	46(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	47(%rcx), %r9b
	movb	47(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	48(%rcx), %r9b
	movb	48(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	49(%rcx), %r9b
	movb	49(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	50(%rcx), %r9b
	movb	50(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	51(%rcx), %r9b
	movb	51(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	52(%rcx), %r9b
	movb	52(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	53(%rcx), %r9b
	movb	53(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	54(%rcx), %r9b
	movb	54(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	55(%rcx), %r9b
	movb	55(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	56(%rcx), %r9b
	movb	56(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	57(%rcx), %r9b
	movb	57(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	58(%rcx), %r9b
	movb	58(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	59(%rcx), %r9b
	movb	59(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	60(%rcx), %r9b
	movb	60(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	61(%rcx), %r9b
	movb	61(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	62(%rcx), %r9b
	movb	62(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	63(%rcx), %r9b
	movb	63(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	64(%rcx), %r9b
	movb	64(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	65(%rcx), %r9b
	movb	65(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	66(%rcx), %r9b
	movb	66(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	67(%rcx), %r9b
	movb	67(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	68(%rcx), %r9b
	movb	68(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	69(%rcx), %r9b
	movb	69(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	70(%rcx), %r9b
	movb	70(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	71(%rcx), %r9b
	movb	71(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	72(%rcx), %r9b
	movb	72(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	73(%rcx), %r9b
	movb	73(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	74(%rcx), %r9b
	movb	74(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	75(%rcx), %r9b
	movb	75(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	76(%rcx), %r9b
	movb	76(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	77(%rcx), %r9b
	movb	77(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	78(%rcx), %r9b
	movb	78(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	79(%rcx), %r9b
	movb	79(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	80(%rcx), %r9b
	movb	80(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	81(%rcx), %r9b
	movb	81(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	82(%rcx), %r9b
	movb	82(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	83(%rcx), %r9b
	movb	83(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	84(%rcx), %r9b
	movb	84(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	85(%rcx), %r9b
	movb	85(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	86(%rcx), %r9b
	movb	86(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	87(%rcx), %r9b
	movb	87(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	88(%rcx), %r9b
	movb	88(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	89(%rcx), %r9b
	movb	89(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	90(%rcx), %r9b
	movb	90(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	91(%rcx), %r9b
	movb	91(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	92(%rcx), %r9b
	movb	92(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	93(%rcx), %r9b
	movb	93(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	94(%rcx), %r9b
	movb	94(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	95(%rcx), %r9b
	movb	95(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	96(%rcx), %r9b
	movb	96(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	97(%rcx), %r9b
	movb	97(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	98(%rcx), %r9b
	movb	98(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	99(%rcx), %r9b
	movb	99(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	100(%rcx), %r9b
	movb	100(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	101(%rcx), %r9b
	movb	101(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	102(%rcx), %r9b
	movb	102(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	103(%rcx), %r9b
	movb	103(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	104(%rcx), %r9b
	movb	104(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	105(%rcx), %r9b
	movb	105(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	106(%rcx), %r9b
	movb	106(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	107(%rcx), %r9b
	movb	107(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	108(%rcx), %r9b
	movb	108(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	109(%rcx), %r9b
	movb	109(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	110(%rcx), %r9b
	movb	110(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	111(%rcx), %r9b
	movb	111(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	112(%rcx), %r9b
	movb	112(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	113(%rcx), %r9b
	movb	113(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	114(%rcx), %r9b
	movb	114(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	115(%rcx), %r9b
	movb	115(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	116(%rcx), %r9b
	movb	116(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	117(%rcx), %r9b
	movb	117(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	118(%rcx), %r9b
	movb	118(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	119(%rcx), %r9b
	movb	119(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	120(%rcx), %r9b
	movb	120(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	121(%rcx), %r9b
	movb	121(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	122(%rcx), %r9b
	movb	122(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	123(%rcx), %r9b
	movb	123(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	124(%rcx), %r9b
	movb	124(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	125(%rcx), %r9b
	movb	125(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	126(%rcx), %r9b
	movb	126(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	127(%rcx), %r9b
	movb	127(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	128(%rcx), %r9b
	movb	128(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	129(%rcx), %r9b
	movb	129(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	130(%rcx), %r9b
	movb	130(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	131(%rcx), %r9b
	movb	131(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	132(%rcx), %r9b
	movb	132(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	133(%rcx), %r9b
	movb	133(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	134(%rcx), %r9b
	movb	134(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	135(%rcx), %r9b
	movb	135(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	136(%rcx), %r9b
	movb	136(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	137(%rcx), %r9b
	movb	137(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	138(%rcx), %r9b
	movb	138(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	139(%rcx), %r9b
	movb	139(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	140(%rcx), %r9b
	movb	140(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	141(%rcx), %r9b
	movb	141(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	142(%rcx), %r9b
	movb	142(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	143(%rcx), %r9b
	movb	143(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	144(%rcx), %r9b
	movb	144(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	145(%rcx), %r9b
	movb	145(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	146(%rcx), %r9b
	movb	146(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	147(%rcx), %r9b
	movb	147(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	148(%rcx), %r9b
	movb	148(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	149(%rcx), %r9b
	movb	149(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	150(%rcx), %r9b
	movb	150(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	151(%rcx), %r9b
	movb	151(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	152(%rcx), %r9b
	movb	152(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	153(%rcx), %r9b
	movb	153(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	154(%rcx), %r9b
	movb	154(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	155(%rcx), %r9b
	movb	155(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	156(%rcx), %r9b
	movb	156(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	157(%rcx), %r9b
	movb	157(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	158(%rcx), %r9b
	movb	158(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	159(%rcx), %r9b
	movb	159(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	160(%rcx), %r9b
	movb	160(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	161(%rcx), %r9b
	movb	161(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	162(%rcx), %r9b
	movb	162(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	163(%rcx), %r9b
	movb	163(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	164(%rcx), %r9b
	movb	164(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	165(%rcx), %r9b
	movb	165(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	166(%rcx), %r9b
	movb	166(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	167(%rcx), %r9b
	movb	167(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	168(%rcx), %r9b
	movb	168(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	169(%rcx), %r9b
	movb	169(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	170(%rcx), %r9b
	movb	170(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	171(%rcx), %r9b
	movb	171(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	172(%rcx), %r9b
	movb	172(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	173(%rcx), %r9b
	movb	173(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	174(%rcx), %r9b
	movb	174(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	175(%rcx), %r9b
	movb	175(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	176(%rcx), %r9b
	movb	176(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	177(%rcx), %r9b
	movb	177(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	178(%rcx), %r9b
	movb	178(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	179(%rcx), %r9b
	movb	179(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	180(%rcx), %r9b
	movb	180(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	181(%rcx), %r9b
	movb	181(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	182(%rcx), %r9b
	movb	182(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	183(%rcx), %r9b
	movb	183(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	184(%rcx), %r9b
	movb	184(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	185(%rcx), %r9b
	movb	185(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	186(%rcx), %r9b
	movb	186(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	187(%rcx), %r9b
	movb	187(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	188(%rcx), %r9b
	movb	188(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	189(%rcx), %r9b
	movb	189(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	190(%rcx), %r9b
	movb	190(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	191(%rcx), %r9b
	movb	191(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	192(%rcx), %r9b
	movb	192(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	193(%rcx), %r9b
	movb	193(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	194(%rcx), %r9b
	movb	194(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	195(%rcx), %r9b
	movb	195(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	196(%rcx), %r9b
	movb	196(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	197(%rcx), %r9b
	movb	197(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	198(%rcx), %r9b
	movb	198(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	199(%rcx), %r9b
	movb	199(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	200(%rcx), %r9b
	movb	200(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	201(%rcx), %r9b
	movb	201(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	202(%rcx), %r9b
	movb	202(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	203(%rcx), %r9b
	movb	203(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	204(%rcx), %r9b
	movb	204(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	205(%rcx), %r9b
	movb	205(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	206(%rcx), %r9b
	movb	206(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	207(%rcx), %r9b
	movb	207(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	208(%rcx), %r9b
	movb	208(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	209(%rcx), %r9b
	movb	209(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	210(%rcx), %r9b
	movb	210(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	211(%rcx), %r9b
	movb	211(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	212(%rcx), %r9b
	movb	212(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	213(%rcx), %r9b
	movb	213(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	214(%rcx), %r9b
	movb	214(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	215(%rcx), %r9b
	movb	215(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	216(%rcx), %r9b
	movb	216(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	217(%rcx), %r9b
	movb	217(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	218(%rcx), %r9b
	movb	218(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	219(%rcx), %r9b
	movb	219(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	220(%rcx), %r9b
	movb	220(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	221(%rcx), %r9b
	movb	221(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	222(%rcx), %r9b
	movb	222(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	223(%rcx), %r9b
	movb	223(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	224(%rcx), %r9b
	movb	224(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	225(%rcx), %r9b
	movb	225(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	226(%rcx), %r9b
	movb	226(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	227(%rcx), %r9b
	movb	227(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	228(%rcx), %r9b
	movb	228(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	229(%rcx), %r9b
	movb	229(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	230(%rcx), %r9b
	movb	230(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	231(%rcx), %r9b
	movb	231(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	232(%rcx), %r9b
	movb	232(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	233(%rcx), %r9b
	movb	233(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	234(%rcx), %r9b
	movb	234(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	235(%rcx), %r9b
	movb	235(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	236(%rcx), %r9b
	movb	236(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	237(%rcx), %r9b
	movb	237(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	238(%rcx), %r9b
	movb	238(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	239(%rcx), %r9b
	movb	239(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	240(%rcx), %r9b
	movb	240(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	241(%rcx), %r9b
	movb	241(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	242(%rcx), %r9b
	movb	242(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	243(%rcx), %r9b
	movb	243(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	244(%rcx), %r9b
	movb	244(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	245(%rcx), %r9b
	movb	245(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	246(%rcx), %r9b
	movb	246(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	247(%rcx), %r9b
	movb	247(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	248(%rcx), %r9b
	movb	248(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	249(%rcx), %r9b
	movb	249(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	250(%rcx), %r9b
	movb	250(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	251(%rcx), %r9b
	movb	251(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	252(%rcx), %r9b
	movb	252(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	253(%rcx), %r9b
	movb	253(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	254(%rcx), %r9b
	movb	254(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	255(%rcx), %r9b
	movb	255(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	256(%rcx), %r9b
	movb	256(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	257(%rcx), %r9b
	movb	257(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	258(%rcx), %r9b
	movb	258(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	259(%rcx), %r9b
	movb	259(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	260(%rcx), %r9b
	movb	260(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	261(%rcx), %r9b
	movb	261(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	262(%rcx), %r9b
	movb	262(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	263(%rcx), %r9b
	movb	263(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	264(%rcx), %r9b
	movb	264(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	265(%rcx), %r9b
	movb	265(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	266(%rcx), %r9b
	movb	266(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	267(%rcx), %r9b
	movb	267(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	268(%rcx), %r9b
	movb	268(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	269(%rcx), %r9b
	movb	269(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	270(%rcx), %r9b
	movb	270(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	271(%rcx), %r9b
	movb	271(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	272(%rcx), %r9b
	movb	272(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	273(%rcx), %r9b
	movb	273(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	274(%rcx), %r9b
	movb	274(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	275(%rcx), %r9b
	movb	275(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	276(%rcx), %r9b
	movb	276(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	277(%rcx), %r9b
	movb	277(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	278(%rcx), %r9b
	movb	278(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	279(%rcx), %r9b
	movb	279(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	280(%rcx), %r9b
	movb	280(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	281(%rcx), %r9b
	movb	281(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	282(%rcx), %r9b
	movb	282(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	283(%rcx), %r9b
	movb	283(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	284(%rcx), %r9b
	movb	284(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	285(%rcx), %r9b
	movb	285(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	286(%rcx), %r9b
	movb	286(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	287(%rcx), %r9b
	movb	287(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	288(%rcx), %r9b
	movb	288(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	289(%rcx), %r9b
	movb	289(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	290(%rcx), %r9b
	movb	290(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	291(%rcx), %r9b
	movb	291(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	292(%rcx), %r9b
	movb	292(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	293(%rcx), %r9b
	movb	293(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	294(%rcx), %r9b
	movb	294(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	295(%rcx), %r9b
	movb	295(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	296(%rcx), %r9b
	movb	296(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	297(%rcx), %r9b
	movb	297(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	298(%rcx), %r9b
	movb	298(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	299(%rcx), %r9b
	movb	299(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	300(%rcx), %r9b
	movb	300(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	301(%rcx), %r9b
	movb	301(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	302(%rcx), %r9b
	movb	302(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	303(%rcx), %r9b
	movb	303(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	304(%rcx), %r9b
	movb	304(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	305(%rcx), %r9b
	movb	305(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	306(%rcx), %r9b
	movb	306(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	307(%rcx), %r9b
	movb	307(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	308(%rcx), %r9b
	movb	308(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	309(%rcx), %r9b
	movb	309(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	310(%rcx), %r9b
	movb	310(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	311(%rcx), %r9b
	movb	311(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	312(%rcx), %r9b
	movb	312(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	313(%rcx), %r9b
	movb	313(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	314(%rcx), %r9b
	movb	314(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	315(%rcx), %r9b
	movb	315(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	316(%rcx), %r9b
	movb	316(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	317(%rcx), %r9b
	movb	317(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	318(%rcx), %r9b
	movb	318(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	319(%rcx), %r9b
	movb	319(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	320(%rcx), %r9b
	movb	320(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	321(%rcx), %r9b
	movb	321(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	322(%rcx), %r9b
	movb	322(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	323(%rcx), %r9b
	movb	323(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	324(%rcx), %r9b
	movb	324(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	325(%rcx), %r9b
	movb	325(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	326(%rcx), %r9b
	movb	326(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	327(%rcx), %r9b
	movb	327(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	328(%rcx), %r9b
	movb	328(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	329(%rcx), %r9b
	movb	329(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	330(%rcx), %r9b
	movb	330(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	331(%rcx), %r9b
	movb	331(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	332(%rcx), %r9b
	movb	332(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	333(%rcx), %r9b
	movb	333(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	334(%rcx), %r9b
	movb	334(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	335(%rcx), %r9b
	movb	335(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	336(%rcx), %r9b
	movb	336(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	337(%rcx), %r9b
	movb	337(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	338(%rcx), %r9b
	movb	338(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	339(%rcx), %r9b
	movb	339(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	340(%rcx), %r9b
	movb	340(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	341(%rcx), %r9b
	movb	341(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	342(%rcx), %r9b
	movb	342(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	343(%rcx), %r9b
	movb	343(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	344(%rcx), %r9b
	movb	344(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	345(%rcx), %r9b
	movb	345(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	346(%rcx), %r9b
	movb	346(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	347(%rcx), %r9b
	movb	347(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	348(%rcx), %r9b
	movb	348(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	349(%rcx), %r9b
	movb	349(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	350(%rcx), %r9b
	movb	350(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	351(%rcx), %r9b
	movb	351(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	352(%rcx), %r9b
	movb	352(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	353(%rcx), %r9b
	movb	353(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	354(%rcx), %r9b
	movb	354(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	355(%rcx), %r9b
	movb	355(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	356(%rcx), %r9b
	movb	356(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	357(%rcx), %r9b
	movb	357(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	358(%rcx), %r9b
	movb	358(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	359(%rcx), %r9b
	movb	359(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	360(%rcx), %r9b
	movb	360(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	361(%rcx), %r9b
	movb	361(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	362(%rcx), %r9b
	movb	362(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	363(%rcx), %r9b
	movb	363(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	364(%rcx), %r9b
	movb	364(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	365(%rcx), %r9b
	movb	365(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	366(%rcx), %r9b
	movb	366(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	367(%rcx), %r9b
	movb	367(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	368(%rcx), %r9b
	movb	368(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	369(%rcx), %r9b
	movb	369(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	370(%rcx), %r9b
	movb	370(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	371(%rcx), %r9b
	movb	371(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	372(%rcx), %r9b
	movb	372(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	373(%rcx), %r9b
	movb	373(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	374(%rcx), %r9b
	movb	374(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	375(%rcx), %r9b
	movb	375(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	376(%rcx), %r9b
	movb	376(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	377(%rcx), %r9b
	movb	377(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	378(%rcx), %r9b
	movb	378(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	379(%rcx), %r9b
	movb	379(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	380(%rcx), %r9b
	movb	380(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	381(%rcx), %r9b
	movb	381(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	382(%rcx), %r9b
	movb	382(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	383(%rcx), %r9b
	movb	383(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	384(%rcx), %r9b
	movb	384(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	385(%rcx), %r9b
	movb	385(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	386(%rcx), %r9b
	movb	386(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	387(%rcx), %r9b
	movb	387(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	388(%rcx), %r9b
	movb	388(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	389(%rcx), %r9b
	movb	389(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	390(%rcx), %r9b
	movb	390(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	391(%rcx), %r9b
	movb	391(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	392(%rcx), %r9b
	movb	392(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	393(%rcx), %r9b
	movb	393(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	394(%rcx), %r9b
	movb	394(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	395(%rcx), %r9b
	movb	395(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	396(%rcx), %r9b
	movb	396(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	397(%rcx), %r9b
	movb	397(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	398(%rcx), %r9b
	movb	398(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	399(%rcx), %r9b
	movb	399(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	400(%rcx), %r9b
	movb	400(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	401(%rcx), %r9b
	movb	401(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	402(%rcx), %r9b
	movb	402(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	403(%rcx), %r9b
	movb	403(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	404(%rcx), %r9b
	movb	404(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	405(%rcx), %r9b
	movb	405(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	406(%rcx), %r9b
	movb	406(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	407(%rcx), %r9b
	movb	407(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	408(%rcx), %r9b
	movb	408(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	409(%rcx), %r9b
	movb	409(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	410(%rcx), %r9b
	movb	410(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	411(%rcx), %r9b
	movb	411(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	412(%rcx), %r9b
	movb	412(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	413(%rcx), %r9b
	movb	413(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	414(%rcx), %r9b
	movb	414(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	415(%rcx), %r9b
	movb	415(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	416(%rcx), %r9b
	movb	416(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	417(%rcx), %r9b
	movb	417(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	418(%rcx), %r9b
	movb	418(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	419(%rcx), %r9b
	movb	419(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	420(%rcx), %r9b
	movb	420(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	421(%rcx), %r9b
	movb	421(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	422(%rcx), %r9b
	movb	422(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	423(%rcx), %r9b
	movb	423(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	424(%rcx), %r9b
	movb	424(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	425(%rcx), %r9b
	movb	425(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	426(%rcx), %r9b
	movb	426(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	427(%rcx), %r9b
	movb	427(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	428(%rcx), %r9b
	movb	428(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	429(%rcx), %r9b
	movb	429(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	430(%rcx), %r9b
	movb	430(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	431(%rcx), %r9b
	movb	431(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	432(%rcx), %r9b
	movb	432(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	433(%rcx), %r9b
	movb	433(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	434(%rcx), %r9b
	movb	434(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	435(%rcx), %r9b
	movb	435(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	436(%rcx), %r9b
	movb	436(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	437(%rcx), %r9b
	movb	437(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	438(%rcx), %r9b
	movb	438(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	439(%rcx), %r9b
	movb	439(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	440(%rcx), %r9b
	movb	440(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	441(%rcx), %r9b
	movb	441(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	442(%rcx), %r9b
	movb	442(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	443(%rcx), %r9b
	movb	443(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	444(%rcx), %r9b
	movb	444(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	445(%rcx), %r9b
	movb	445(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	446(%rcx), %r9b
	movb	446(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	447(%rcx), %r9b
	movb	447(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	448(%rcx), %r9b
	movb	448(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	449(%rcx), %r9b
	movb	449(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	450(%rcx), %r9b
	movb	450(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	451(%rcx), %r9b
	movb	451(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	452(%rcx), %r9b
	movb	452(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	453(%rcx), %r9b
	movb	453(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	454(%rcx), %r9b
	movb	454(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	455(%rcx), %r9b
	movb	455(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	456(%rcx), %r9b
	movb	456(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	457(%rcx), %r9b
	movb	457(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	458(%rcx), %r9b
	movb	458(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	459(%rcx), %r9b
	movb	459(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	460(%rcx), %r9b
	movb	460(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	461(%rcx), %r9b
	movb	461(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	462(%rcx), %r9b
	movb	462(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	463(%rcx), %r9b
	movb	463(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	464(%rcx), %r9b
	movb	464(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	465(%rcx), %r9b
	movb	465(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	466(%rcx), %r9b
	movb	466(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	467(%rcx), %r9b
	movb	467(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	468(%rcx), %r9b
	movb	468(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	469(%rcx), %r9b
	movb	469(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	470(%rcx), %r9b
	movb	470(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	471(%rcx), %r9b
	movb	471(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	472(%rcx), %r9b
	movb	472(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	473(%rcx), %r9b
	movb	473(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	474(%rcx), %r9b
	movb	474(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	475(%rcx), %r9b
	movb	475(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	476(%rcx), %r9b
	movb	476(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	477(%rcx), %r9b
	movb	477(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	478(%rcx), %r9b
	movb	478(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	479(%rcx), %r9b
	movb	479(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	480(%rcx), %r9b
	movb	480(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	481(%rcx), %r9b
	movb	481(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	482(%rcx), %r9b
	movb	482(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	483(%rcx), %r9b
	movb	483(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	484(%rcx), %r9b
	movb	484(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	485(%rcx), %r9b
	movb	485(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	486(%rcx), %r9b
	movb	486(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	487(%rcx), %r9b
	movb	487(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	488(%rcx), %r9b
	movb	488(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	489(%rcx), %r9b
	movb	489(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	490(%rcx), %r9b
	movb	490(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	491(%rcx), %r9b
	movb	491(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	492(%rcx), %r9b
	movb	492(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	493(%rcx), %r9b
	movb	493(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	494(%rcx), %r9b
	movb	494(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	495(%rcx), %r9b
	movb	495(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	496(%rcx), %r9b
	movb	496(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	497(%rcx), %r9b
	movb	497(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	498(%rcx), %r9b
	movb	498(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	499(%rcx), %r9b
	movb	499(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	500(%rcx), %r9b
	movb	500(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	501(%rcx), %r9b
	movb	501(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	502(%rcx), %r9b
	movb	502(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	503(%rcx), %r9b
	movb	503(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	504(%rcx), %r9b
	movb	504(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	505(%rcx), %r9b
	movb	505(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	506(%rcx), %r9b
	movb	506(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	507(%rcx), %r9b
	movb	507(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	508(%rcx), %r9b
	movb	508(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	509(%rcx), %r9b
	movb	509(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	510(%rcx), %r9b
	movb	510(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	511(%rcx), %r9b
	movb	511(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	512(%rcx), %r9b
	movb	512(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	513(%rcx), %r9b
	movb	513(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	514(%rcx), %r9b
	movb	514(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	515(%rcx), %r9b
	movb	515(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	516(%rcx), %r9b
	movb	516(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	517(%rcx), %r9b
	movb	517(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	518(%rcx), %r9b
	movb	518(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	519(%rcx), %r9b
	movb	519(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	520(%rcx), %r9b
	movb	520(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	521(%rcx), %r9b
	movb	521(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	522(%rcx), %r9b
	movb	522(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	523(%rcx), %r9b
	movb	523(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	524(%rcx), %r9b
	movb	524(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	525(%rcx), %r9b
	movb	525(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	526(%rcx), %r9b
	movb	526(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	527(%rcx), %r9b
	movb	527(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	528(%rcx), %r9b
	movb	528(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	529(%rcx), %r9b
	movb	529(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	530(%rcx), %r9b
	movb	530(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	531(%rcx), %r9b
	movb	531(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	532(%rcx), %r9b
	movb	532(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	533(%rcx), %r9b
	movb	533(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	534(%rcx), %r9b
	movb	534(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	535(%rcx), %r9b
	movb	535(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	536(%rcx), %r9b
	movb	536(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	537(%rcx), %r9b
	movb	537(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	538(%rcx), %r9b
	movb	538(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	539(%rcx), %r9b
	movb	539(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	540(%rcx), %r9b
	movb	540(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	541(%rcx), %r9b
	movb	541(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	542(%rcx), %r9b
	movb	542(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	543(%rcx), %r9b
	movb	543(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	544(%rcx), %r9b
	movb	544(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	545(%rcx), %r9b
	movb	545(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	546(%rcx), %r9b
	movb	546(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	547(%rcx), %r9b
	movb	547(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	548(%rcx), %r9b
	movb	548(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	549(%rcx), %r9b
	movb	549(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	550(%rcx), %r9b
	movb	550(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	551(%rcx), %r9b
	movb	551(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	552(%rcx), %r9b
	movb	552(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	553(%rcx), %r9b
	movb	553(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	554(%rcx), %r9b
	movb	554(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	555(%rcx), %r9b
	movb	555(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	556(%rcx), %r9b
	movb	556(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	557(%rcx), %r9b
	movb	557(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	558(%rcx), %r9b
	movb	558(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	559(%rcx), %r9b
	movb	559(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	560(%rcx), %r9b
	movb	560(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	561(%rcx), %r9b
	movb	561(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	562(%rcx), %r9b
	movb	562(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	563(%rcx), %r9b
	movb	563(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	564(%rcx), %r9b
	movb	564(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	565(%rcx), %r9b
	movb	565(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	566(%rcx), %r9b
	movb	566(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	567(%rcx), %r9b
	movb	567(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	568(%rcx), %r9b
	movb	568(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	569(%rcx), %r9b
	movb	569(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	570(%rcx), %r9b
	movb	570(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	571(%rcx), %r9b
	movb	571(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	572(%rcx), %r9b
	movb	572(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	573(%rcx), %r9b
	movb	573(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	574(%rcx), %r9b
	movb	574(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	575(%rcx), %r9b
	movb	575(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	576(%rcx), %r9b
	movb	576(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	577(%rcx), %r9b
	movb	577(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	578(%rcx), %r9b
	movb	578(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	579(%rcx), %r9b
	movb	579(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	580(%rcx), %r9b
	movb	580(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	581(%rcx), %r9b
	movb	581(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	582(%rcx), %r9b
	movb	582(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	583(%rcx), %r9b
	movb	583(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	584(%rcx), %r9b
	movb	584(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	585(%rcx), %r9b
	movb	585(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	586(%rcx), %r9b
	movb	586(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	587(%rcx), %r9b
	movb	587(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	588(%rcx), %r9b
	movb	588(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	589(%rcx), %r9b
	movb	589(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	590(%rcx), %r9b
	movb	590(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	591(%rcx), %r9b
	movb	591(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	592(%rcx), %r9b
	movb	592(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	593(%rcx), %r9b
	movb	593(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	594(%rcx), %r9b
	movb	594(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	595(%rcx), %r9b
	movb	595(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	596(%rcx), %r9b
	movb	596(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	597(%rcx), %r9b
	movb	597(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	598(%rcx), %r9b
	movb	598(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	599(%rcx), %r9b
	movb	599(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	600(%rcx), %r9b
	movb	600(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	601(%rcx), %r9b
	movb	601(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	602(%rcx), %r9b
	movb	602(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	603(%rcx), %r9b
	movb	603(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	604(%rcx), %r9b
	movb	604(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	605(%rcx), %r9b
	movb	605(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	606(%rcx), %r9b
	movb	606(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	607(%rcx), %r9b
	movb	607(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	608(%rcx), %r9b
	movb	608(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	609(%rcx), %r9b
	movb	609(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	610(%rcx), %r9b
	movb	610(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	611(%rcx), %r9b
	movb	611(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	612(%rcx), %r9b
	movb	612(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	613(%rcx), %r9b
	movb	613(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	614(%rcx), %r9b
	movb	614(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	615(%rcx), %r9b
	movb	615(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	616(%rcx), %r9b
	movb	616(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	617(%rcx), %r9b
	movb	617(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	618(%rcx), %r9b
	movb	618(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	619(%rcx), %r9b
	movb	619(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	620(%rcx), %r9b
	movb	620(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	621(%rcx), %r9b
	movb	621(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	622(%rcx), %r9b
	movb	622(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	623(%rcx), %r9b
	movb	623(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	624(%rcx), %r9b
	movb	624(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	625(%rcx), %r9b
	movb	625(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	626(%rcx), %r9b
	movb	626(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	627(%rcx), %r9b
	movb	627(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	628(%rcx), %r9b
	movb	628(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	629(%rcx), %r9b
	movb	629(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	630(%rcx), %r9b
	movb	630(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	631(%rcx), %r9b
	movb	631(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	632(%rcx), %r9b
	movb	632(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	633(%rcx), %r9b
	movb	633(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	634(%rcx), %r9b
	movb	634(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	635(%rcx), %r9b
	movb	635(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	636(%rcx), %r9b
	movb	636(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	637(%rcx), %r9b
	movb	637(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	638(%rcx), %r9b
	movb	638(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	639(%rcx), %r9b
	movb	639(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	640(%rcx), %r9b
	movb	640(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	641(%rcx), %r9b
	movb	641(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	642(%rcx), %r9b
	movb	642(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	643(%rcx), %r9b
	movb	643(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	644(%rcx), %r9b
	movb	644(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	645(%rcx), %r9b
	movb	645(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	646(%rcx), %r9b
	movb	646(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	647(%rcx), %r9b
	movb	647(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	648(%rcx), %r9b
	movb	648(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	649(%rcx), %r9b
	movb	649(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	650(%rcx), %r9b
	movb	650(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	651(%rcx), %r9b
	movb	651(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	652(%rcx), %r9b
	movb	652(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	653(%rcx), %r9b
	movb	653(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	654(%rcx), %r9b
	movb	654(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	655(%rcx), %r9b
	movb	655(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	656(%rcx), %r9b
	movb	656(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	657(%rcx), %r9b
	movb	657(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	658(%rcx), %r9b
	movb	658(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	659(%rcx), %r9b
	movb	659(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	660(%rcx), %r9b
	movb	660(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	661(%rcx), %r9b
	movb	661(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	662(%rcx), %r9b
	movb	662(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	663(%rcx), %r9b
	movb	663(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	664(%rcx), %r9b
	movb	664(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	665(%rcx), %r9b
	movb	665(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	666(%rcx), %r9b
	movb	666(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	667(%rcx), %r9b
	movb	667(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	668(%rcx), %r9b
	movb	668(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	669(%rcx), %r9b
	movb	669(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	670(%rcx), %r9b
	movb	670(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	671(%rcx), %r9b
	movb	671(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	672(%rcx), %r9b
	movb	672(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	673(%rcx), %r9b
	movb	673(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	674(%rcx), %r9b
	movb	674(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	675(%rcx), %r9b
	movb	675(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	676(%rcx), %r9b
	movb	676(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	677(%rcx), %r9b
	movb	677(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	678(%rcx), %r9b
	movb	678(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	679(%rcx), %r9b
	movb	679(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	680(%rcx), %r9b
	movb	680(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	681(%rcx), %r9b
	movb	681(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	682(%rcx), %r9b
	movb	682(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	683(%rcx), %r9b
	movb	683(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	684(%rcx), %r9b
	movb	684(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	685(%rcx), %r9b
	movb	685(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	686(%rcx), %r9b
	movb	686(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	687(%rcx), %r9b
	movb	687(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	688(%rcx), %r9b
	movb	688(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	689(%rcx), %r9b
	movb	689(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	690(%rcx), %r9b
	movb	690(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	691(%rcx), %r9b
	movb	691(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	692(%rcx), %r9b
	movb	692(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	693(%rcx), %r9b
	movb	693(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	694(%rcx), %r9b
	movb	694(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	695(%rcx), %r9b
	movb	695(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	696(%rcx), %r9b
	movb	696(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	697(%rcx), %r9b
	movb	697(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	698(%rcx), %r9b
	movb	698(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	699(%rcx), %r9b
	movb	699(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	700(%rcx), %r9b
	movb	700(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	701(%rcx), %r9b
	movb	701(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	702(%rcx), %r9b
	movb	702(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	703(%rcx), %r9b
	movb	703(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	704(%rcx), %r9b
	movb	704(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	705(%rcx), %r9b
	movb	705(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	706(%rcx), %r9b
	movb	706(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	707(%rcx), %r9b
	movb	707(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	708(%rcx), %r9b
	movb	708(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	709(%rcx), %r9b
	movb	709(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	710(%rcx), %r9b
	movb	710(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	711(%rcx), %r9b
	movb	711(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	712(%rcx), %r9b
	movb	712(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	713(%rcx), %r9b
	movb	713(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	714(%rcx), %r9b
	movb	714(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	715(%rcx), %r9b
	movb	715(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	716(%rcx), %r9b
	movb	716(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	717(%rcx), %r9b
	movb	717(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	718(%rcx), %r9b
	movb	718(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	719(%rcx), %r9b
	movb	719(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	720(%rcx), %r9b
	movb	720(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	721(%rcx), %r9b
	movb	721(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	722(%rcx), %r9b
	movb	722(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	723(%rcx), %r9b
	movb	723(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	724(%rcx), %r9b
	movb	724(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	725(%rcx), %r9b
	movb	725(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	726(%rcx), %r9b
	movb	726(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	727(%rcx), %r9b
	movb	727(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	728(%rcx), %r9b
	movb	728(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	729(%rcx), %r9b
	movb	729(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	730(%rcx), %r9b
	movb	730(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	731(%rcx), %r9b
	movb	731(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	732(%rcx), %r9b
	movb	732(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	733(%rcx), %r9b
	movb	733(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	734(%rcx), %r9b
	movb	734(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	735(%rcx), %r9b
	movb	735(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	736(%rcx), %r9b
	movb	736(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	737(%rcx), %r9b
	movb	737(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	738(%rcx), %r9b
	movb	738(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	739(%rcx), %r9b
	movb	739(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	740(%rcx), %r9b
	movb	740(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	741(%rcx), %r9b
	movb	741(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	742(%rcx), %r9b
	movb	742(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	743(%rcx), %r9b
	movb	743(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	744(%rcx), %r9b
	movb	744(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	745(%rcx), %r9b
	movb	745(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	746(%rcx), %r9b
	movb	746(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	747(%rcx), %r9b
	movb	747(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	748(%rcx), %r9b
	movb	748(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	749(%rcx), %r9b
	movb	749(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	750(%rcx), %r9b
	movb	750(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	751(%rcx), %r9b
	movb	751(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	752(%rcx), %r9b
	movb	752(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	753(%rcx), %r9b
	movb	753(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	754(%rcx), %r9b
	movb	754(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	755(%rcx), %r9b
	movb	755(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	756(%rcx), %r9b
	movb	756(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	757(%rcx), %r9b
	movb	757(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	758(%rcx), %r9b
	movb	758(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	759(%rcx), %r9b
	movb	759(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	760(%rcx), %r9b
	movb	760(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	761(%rcx), %r9b
	movb	761(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	762(%rcx), %r9b
	movb	762(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	763(%rcx), %r9b
	movb	763(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	764(%rcx), %r9b
	movb	764(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	765(%rcx), %r9b
	movb	765(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	766(%rcx), %r9b
	movb	766(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	767(%rcx), %r9b
	movb	767(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	768(%rcx), %r9b
	movb	768(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	769(%rcx), %r9b
	movb	769(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	770(%rcx), %r9b
	movb	770(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	771(%rcx), %r9b
	movb	771(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	772(%rcx), %r9b
	movb	772(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	773(%rcx), %r9b
	movb	773(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	774(%rcx), %r9b
	movb	774(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	775(%rcx), %r9b
	movb	775(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	776(%rcx), %r9b
	movb	776(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	777(%rcx), %r9b
	movb	777(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	778(%rcx), %r9b
	movb	778(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	779(%rcx), %r9b
	movb	779(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	780(%rcx), %r9b
	movb	780(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	781(%rcx), %r9b
	movb	781(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	782(%rcx), %r9b
	movb	782(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	783(%rcx), %r9b
	movb	783(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	784(%rcx), %r9b
	movb	784(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	785(%rcx), %r9b
	movb	785(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	786(%rcx), %r9b
	movb	786(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	787(%rcx), %r9b
	movb	787(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	788(%rcx), %r9b
	movb	788(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	789(%rcx), %r9b
	movb	789(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	790(%rcx), %r9b
	movb	790(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	791(%rcx), %r9b
	movb	791(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	792(%rcx), %r9b
	movb	792(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	793(%rcx), %r9b
	movb	793(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	794(%rcx), %r9b
	movb	794(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	795(%rcx), %r9b
	movb	795(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	796(%rcx), %r9b
	movb	796(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	797(%rcx), %r9b
	movb	797(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	798(%rcx), %r9b
	movb	798(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	799(%rcx), %r9b
	movb	799(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	800(%rcx), %r9b
	movb	800(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	801(%rcx), %r9b
	movb	801(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	802(%rcx), %r9b
	movb	802(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	803(%rcx), %r9b
	movb	803(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	804(%rcx), %r9b
	movb	804(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	805(%rcx), %r9b
	movb	805(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	806(%rcx), %r9b
	movb	806(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	807(%rcx), %r9b
	movb	807(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	808(%rcx), %r9b
	movb	808(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	809(%rcx), %r9b
	movb	809(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	810(%rcx), %r9b
	movb	810(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	811(%rcx), %r9b
	movb	811(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	812(%rcx), %r9b
	movb	812(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	813(%rcx), %r9b
	movb	813(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	814(%rcx), %r9b
	movb	814(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	815(%rcx), %r9b
	movb	815(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	816(%rcx), %r9b
	movb	816(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	817(%rcx), %r9b
	movb	817(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	818(%rcx), %r9b
	movb	818(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	819(%rcx), %r9b
	movb	819(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	820(%rcx), %r9b
	movb	820(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	821(%rcx), %r9b
	movb	821(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	822(%rcx), %r9b
	movb	822(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	823(%rcx), %r9b
	movb	823(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	824(%rcx), %r9b
	movb	824(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	825(%rcx), %r9b
	movb	825(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	826(%rcx), %r9b
	movb	826(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	827(%rcx), %r9b
	movb	827(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	828(%rcx), %r9b
	movb	828(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	829(%rcx), %r9b
	movb	829(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	830(%rcx), %r9b
	movb	830(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	831(%rcx), %r9b
	movb	831(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	832(%rcx), %r9b
	movb	832(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	833(%rcx), %r9b
	movb	833(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	834(%rcx), %r9b
	movb	834(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	835(%rcx), %r9b
	movb	835(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	836(%rcx), %r9b
	movb	836(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	837(%rcx), %r9b
	movb	837(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	838(%rcx), %r9b
	movb	838(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	839(%rcx), %r9b
	movb	839(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	840(%rcx), %r9b
	movb	840(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	841(%rcx), %r9b
	movb	841(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	842(%rcx), %r9b
	movb	842(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	843(%rcx), %r9b
	movb	843(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	844(%rcx), %r9b
	movb	844(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	845(%rcx), %r9b
	movb	845(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	846(%rcx), %r9b
	movb	846(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	847(%rcx), %r9b
	movb	847(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	848(%rcx), %r9b
	movb	848(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	849(%rcx), %r9b
	movb	849(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	850(%rcx), %r9b
	movb	850(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	851(%rcx), %r9b
	movb	851(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	852(%rcx), %r9b
	movb	852(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	853(%rcx), %r9b
	movb	853(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	854(%rcx), %r9b
	movb	854(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	855(%rcx), %r9b
	movb	855(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	856(%rcx), %r9b
	movb	856(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	857(%rcx), %r9b
	movb	857(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	858(%rcx), %r9b
	movb	858(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	859(%rcx), %r9b
	movb	859(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	860(%rcx), %r9b
	movb	860(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	861(%rcx), %r9b
	movb	861(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	862(%rcx), %r9b
	movb	862(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	863(%rcx), %r9b
	movb	863(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	864(%rcx), %r9b
	movb	864(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	865(%rcx), %r9b
	movb	865(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	866(%rcx), %r9b
	movb	866(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	867(%rcx), %r9b
	movb	867(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	868(%rcx), %r9b
	movb	868(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	869(%rcx), %r9b
	movb	869(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	870(%rcx), %r9b
	movb	870(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	871(%rcx), %r9b
	movb	871(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	872(%rcx), %r9b
	movb	872(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	873(%rcx), %r9b
	movb	873(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	874(%rcx), %r9b
	movb	874(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	875(%rcx), %r9b
	movb	875(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	876(%rcx), %r9b
	movb	876(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	877(%rcx), %r9b
	movb	877(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	878(%rcx), %r9b
	movb	878(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	879(%rcx), %r9b
	movb	879(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	880(%rcx), %r9b
	movb	880(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	881(%rcx), %r9b
	movb	881(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	882(%rcx), %r9b
	movb	882(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	883(%rcx), %r9b
	movb	883(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	884(%rcx), %r9b
	movb	884(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	885(%rcx), %r9b
	movb	885(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	886(%rcx), %r9b
	movb	886(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	887(%rcx), %r9b
	movb	887(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	888(%rcx), %r9b
	movb	888(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	889(%rcx), %r9b
	movb	889(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	890(%rcx), %r9b
	movb	890(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	891(%rcx), %r9b
	movb	891(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	892(%rcx), %r9b
	movb	892(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	893(%rcx), %r9b
	movb	893(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	894(%rcx), %r9b
	movb	894(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	895(%rcx), %r9b
	movb	895(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	896(%rcx), %r9b
	movb	896(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	897(%rcx), %r9b
	movb	897(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	898(%rcx), %r9b
	movb	898(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	899(%rcx), %r9b
	movb	899(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	900(%rcx), %r9b
	movb	900(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	901(%rcx), %r9b
	movb	901(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	902(%rcx), %r9b
	movb	902(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	903(%rcx), %r9b
	movb	903(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	904(%rcx), %r9b
	movb	904(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	905(%rcx), %r9b
	movb	905(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	906(%rcx), %r9b
	movb	906(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	907(%rcx), %r9b
	movb	907(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	908(%rcx), %r9b
	movb	908(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	909(%rcx), %r9b
	movb	909(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	910(%rcx), %r9b
	movb	910(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	911(%rcx), %r9b
	movb	911(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	912(%rcx), %r9b
	movb	912(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	913(%rcx), %r9b
	movb	913(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	914(%rcx), %r9b
	movb	914(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	915(%rcx), %r9b
	movb	915(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	916(%rcx), %r9b
	movb	916(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	917(%rcx), %r9b
	movb	917(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	918(%rcx), %r9b
	movb	918(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	919(%rcx), %r9b
	movb	919(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	920(%rcx), %r9b
	movb	920(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	921(%rcx), %r9b
	movb	921(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	922(%rcx), %r9b
	movb	922(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	923(%rcx), %r9b
	movb	923(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	924(%rcx), %r9b
	movb	924(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	925(%rcx), %r9b
	movb	925(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	926(%rcx), %r9b
	movb	926(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	927(%rcx), %r9b
	movb	927(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	928(%rcx), %r9b
	movb	928(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	929(%rcx), %r9b
	movb	929(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	930(%rcx), %r9b
	movb	930(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	931(%rcx), %r9b
	movb	931(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	932(%rcx), %r9b
	movb	932(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	933(%rcx), %r9b
	movb	933(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	934(%rcx), %r9b
	movb	934(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	935(%rcx), %r9b
	movb	935(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	936(%rcx), %r9b
	movb	936(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	937(%rcx), %r9b
	movb	937(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	938(%rcx), %r9b
	movb	938(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	939(%rcx), %r9b
	movb	939(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	940(%rcx), %r9b
	movb	940(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	941(%rcx), %r9b
	movb	941(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	942(%rcx), %r9b
	movb	942(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	943(%rcx), %r9b
	movb	943(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	944(%rcx), %r9b
	movb	944(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	945(%rcx), %r9b
	movb	945(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	946(%rcx), %r9b
	movb	946(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	947(%rcx), %r9b
	movb	947(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	948(%rcx), %r9b
	movb	948(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	949(%rcx), %r9b
	movb	949(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	950(%rcx), %r9b
	movb	950(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	951(%rcx), %r9b
	movb	951(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	952(%rcx), %r9b
	movb	952(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	953(%rcx), %r9b
	movb	953(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	954(%rcx), %r9b
	movb	954(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	955(%rcx), %r9b
	movb	955(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	956(%rcx), %r9b
	movb	956(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	957(%rcx), %r9b
	movb	957(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	958(%rcx), %r9b
	movb	958(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	959(%rcx), %r9b
	movb	959(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	960(%rcx), %r9b
	movb	960(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	961(%rcx), %r9b
	movb	961(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	962(%rcx), %r9b
	movb	962(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	963(%rcx), %r9b
	movb	963(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	964(%rcx), %r9b
	movb	964(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	965(%rcx), %r9b
	movb	965(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	966(%rcx), %r9b
	movb	966(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	967(%rcx), %r9b
	movb	967(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	968(%rcx), %r9b
	movb	968(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	969(%rcx), %r9b
	movb	969(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	970(%rcx), %r9b
	movb	970(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	971(%rcx), %r9b
	movb	971(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	972(%rcx), %r9b
	movb	972(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	973(%rcx), %r9b
	movb	973(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	974(%rcx), %r9b
	movb	974(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	975(%rcx), %r9b
	movb	975(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	976(%rcx), %r9b
	movb	976(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	977(%rcx), %r9b
	movb	977(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	978(%rcx), %r9b
	movb	978(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	979(%rcx), %r9b
	movb	979(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	980(%rcx), %r9b
	movb	980(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	981(%rcx), %r9b
	movb	981(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	982(%rcx), %r9b
	movb	982(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	983(%rcx), %r9b
	movb	983(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	984(%rcx), %r9b
	movb	984(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	985(%rcx), %r9b
	movb	985(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	986(%rcx), %r9b
	movb	986(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	987(%rcx), %r9b
	movb	987(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	988(%rcx), %r9b
	movb	988(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	989(%rcx), %r9b
	movb	989(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	990(%rcx), %r9b
	movb	990(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	991(%rcx), %r9b
	movb	991(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	992(%rcx), %r9b
	movb	992(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	993(%rcx), %r9b
	movb	993(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	994(%rcx), %r9b
	movb	994(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	995(%rcx), %r9b
	movb	995(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	996(%rcx), %r9b
	movb	996(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	997(%rcx), %r9b
	movb	997(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	998(%rcx), %r9b
	movb	998(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	999(%rcx), %r9b
	movb	999(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1000(%rcx), %r9b
	movb	1000(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1001(%rcx), %r9b
	movb	1001(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1002(%rcx), %r9b
	movb	1002(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1003(%rcx), %r9b
	movb	1003(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1004(%rcx), %r9b
	movb	1004(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1005(%rcx), %r9b
	movb	1005(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1006(%rcx), %r9b
	movb	1006(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1007(%rcx), %r9b
	movb	1007(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1008(%rcx), %r9b
	movb	1008(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1009(%rcx), %r9b
	movb	1009(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1010(%rcx), %r9b
	movb	1010(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1011(%rcx), %r9b
	movb	1011(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1012(%rcx), %r9b
	movb	1012(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1013(%rcx), %r9b
	movb	1013(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1014(%rcx), %r9b
	movb	1014(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1015(%rcx), %r9b
	movb	1015(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1016(%rcx), %r9b
	movb	1016(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1017(%rcx), %r9b
	movb	1017(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1018(%rcx), %r9b
	movb	1018(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1019(%rcx), %r9b
	movb	1019(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1020(%rcx), %r9b
	movb	1020(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1021(%rcx), %r9b
	movb	1021(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1022(%rcx), %r9b
	movb	1022(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1023(%rcx), %r9b
	movb	1023(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1024(%rcx), %r9b
	movb	1024(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1025(%rcx), %r9b
	movb	1025(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1026(%rcx), %r9b
	movb	1026(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1027(%rcx), %r9b
	movb	1027(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1028(%rcx), %r9b
	movb	1028(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1029(%rcx), %r9b
	movb	1029(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1030(%rcx), %r9b
	movb	1030(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1031(%rcx), %r9b
	movb	1031(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1032(%rcx), %r9b
	movb	1032(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1033(%rcx), %r9b
	movb	1033(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1034(%rcx), %r9b
	movb	1034(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1035(%rcx), %r9b
	movb	1035(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1036(%rcx), %r9b
	movb	1036(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1037(%rcx), %r9b
	movb	1037(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1038(%rcx), %r9b
	movb	1038(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1039(%rcx), %r9b
	movb	1039(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1040(%rcx), %r9b
	movb	1040(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1041(%rcx), %r9b
	movb	1041(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1042(%rcx), %r9b
	movb	1042(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1043(%rcx), %r9b
	movb	1043(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1044(%rcx), %r9b
	movb	1044(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1045(%rcx), %r9b
	movb	1045(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1046(%rcx), %r9b
	movb	1046(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1047(%rcx), %r9b
	movb	1047(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1048(%rcx), %r9b
	movb	1048(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1049(%rcx), %r9b
	movb	1049(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1050(%rcx), %r9b
	movb	1050(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1051(%rcx), %r9b
	movb	1051(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1052(%rcx), %r9b
	movb	1052(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1053(%rcx), %r9b
	movb	1053(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1054(%rcx), %r9b
	movb	1054(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1055(%rcx), %r9b
	movb	1055(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1056(%rcx), %r9b
	movb	1056(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1057(%rcx), %r9b
	movb	1057(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1058(%rcx), %r9b
	movb	1058(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1059(%rcx), %r9b
	movb	1059(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1060(%rcx), %r9b
	movb	1060(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1061(%rcx), %r9b
	movb	1061(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1062(%rcx), %r9b
	movb	1062(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1063(%rcx), %r9b
	movb	1063(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1064(%rcx), %r9b
	movb	1064(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1065(%rcx), %r9b
	movb	1065(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1066(%rcx), %r9b
	movb	1066(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1067(%rcx), %r9b
	movb	1067(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1068(%rcx), %r9b
	movb	1068(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1069(%rcx), %r9b
	movb	1069(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1070(%rcx), %r9b
	movb	1070(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1071(%rcx), %r9b
	movb	1071(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1072(%rcx), %r9b
	movb	1072(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1073(%rcx), %r9b
	movb	1073(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1074(%rcx), %r9b
	movb	1074(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1075(%rcx), %r9b
	movb	1075(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1076(%rcx), %r9b
	movb	1076(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1077(%rcx), %r9b
	movb	1077(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1078(%rcx), %r9b
	movb	1078(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1079(%rcx), %r9b
	movb	1079(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1080(%rcx), %r9b
	movb	1080(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1081(%rcx), %r9b
	movb	1081(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1082(%rcx), %r9b
	movb	1082(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1083(%rcx), %r9b
	movb	1083(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1084(%rcx), %r9b
	movb	1084(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1085(%rcx), %r9b
	movb	1085(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1086(%rcx), %r9b
	movb	1086(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1087(%rcx), %r9b
	movb	1087(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1088(%rcx), %r9b
	movb	1088(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1089(%rcx), %r9b
	movb	1089(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1090(%rcx), %r9b
	movb	1090(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1091(%rcx), %r9b
	movb	1091(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1092(%rcx), %r9b
	movb	1092(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1093(%rcx), %r9b
	movb	1093(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1094(%rcx), %r9b
	movb	1094(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1095(%rcx), %r9b
	movb	1095(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1096(%rcx), %r9b
	movb	1096(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1097(%rcx), %r9b
	movb	1097(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1098(%rcx), %r9b
	movb	1098(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1099(%rcx), %r9b
	movb	1099(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1100(%rcx), %r9b
	movb	1100(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1101(%rcx), %r9b
	movb	1101(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1102(%rcx), %r9b
	movb	1102(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1103(%rcx), %r9b
	movb	1103(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1104(%rcx), %r9b
	movb	1104(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1105(%rcx), %r9b
	movb	1105(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1106(%rcx), %r9b
	movb	1106(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1107(%rcx), %r9b
	movb	1107(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1108(%rcx), %r9b
	movb	1108(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1109(%rcx), %r9b
	movb	1109(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1110(%rcx), %r9b
	movb	1110(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1111(%rcx), %r9b
	movb	1111(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1112(%rcx), %r9b
	movb	1112(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1113(%rcx), %r9b
	movb	1113(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1114(%rcx), %r9b
	movb	1114(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1115(%rcx), %r9b
	movb	1115(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1116(%rcx), %r9b
	movb	1116(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1117(%rcx), %r9b
	movb	1117(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1118(%rcx), %r9b
	movb	1118(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1119(%rcx), %r9b
	movb	1119(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1120(%rcx), %r9b
	movb	1120(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1121(%rcx), %r9b
	movb	1121(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1122(%rcx), %r9b
	movb	1122(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1123(%rcx), %r9b
	movb	1123(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1124(%rcx), %r9b
	movb	1124(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1125(%rcx), %r9b
	movb	1125(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1126(%rcx), %r9b
	movb	1126(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1127(%rcx), %r9b
	movb	1127(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1128(%rcx), %r9b
	movb	1128(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1129(%rcx), %r9b
	movb	1129(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1130(%rcx), %r9b
	movb	1130(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1131(%rcx), %r9b
	movb	1131(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1132(%rcx), %r9b
	movb	1132(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1133(%rcx), %r9b
	movb	1133(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1134(%rcx), %r9b
	movb	1134(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1135(%rcx), %r9b
	movb	1135(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1136(%rcx), %r9b
	movb	1136(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1137(%rcx), %r9b
	movb	1137(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1138(%rcx), %r9b
	movb	1138(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1139(%rcx), %r9b
	movb	1139(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1140(%rcx), %r9b
	movb	1140(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1141(%rcx), %r9b
	movb	1141(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1142(%rcx), %r9b
	movb	1142(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1143(%rcx), %r9b
	movb	1143(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1144(%rcx), %r9b
	movb	1144(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1145(%rcx), %r9b
	movb	1145(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1146(%rcx), %r9b
	movb	1146(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1147(%rcx), %r9b
	movb	1147(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1148(%rcx), %r9b
	movb	1148(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1149(%rcx), %r9b
	movb	1149(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1150(%rcx), %r9b
	movb	1150(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1151(%rcx), %r9b
	movb	1151(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1152(%rcx), %r9b
	movb	1152(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1153(%rcx), %r9b
	movb	1153(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1154(%rcx), %r9b
	movb	1154(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1155(%rcx), %r9b
	movb	1155(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1156(%rcx), %r9b
	movb	1156(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1157(%rcx), %r9b
	movb	1157(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1158(%rcx), %r9b
	movb	1158(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1159(%rcx), %r9b
	movb	1159(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1160(%rcx), %r9b
	movb	1160(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1161(%rcx), %r9b
	movb	1161(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1162(%rcx), %r9b
	movb	1162(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1163(%rcx), %r9b
	movb	1163(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1164(%rcx), %r9b
	movb	1164(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1165(%rcx), %r9b
	movb	1165(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1166(%rcx), %r9b
	movb	1166(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1167(%rcx), %r9b
	movb	1167(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1168(%rcx), %r9b
	movb	1168(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1169(%rcx), %r9b
	movb	1169(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1170(%rcx), %r9b
	movb	1170(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1171(%rcx), %r9b
	movb	1171(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1172(%rcx), %r9b
	movb	1172(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1173(%rcx), %r9b
	movb	1173(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1174(%rcx), %r9b
	movb	1174(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1175(%rcx), %r9b
	movb	1175(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1176(%rcx), %r9b
	movb	1176(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1177(%rcx), %r9b
	movb	1177(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1178(%rcx), %r9b
	movb	1178(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1179(%rcx), %r9b
	movb	1179(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1180(%rcx), %r9b
	movb	1180(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1181(%rcx), %r9b
	movb	1181(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1182(%rcx), %r9b
	movb	1182(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1183(%rcx), %r9b
	movb	1183(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1184(%rcx), %r9b
	movb	1184(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1185(%rcx), %r9b
	movb	1185(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1186(%rcx), %r9b
	movb	1186(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1187(%rcx), %r9b
	movb	1187(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1188(%rcx), %r9b
	movb	1188(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1189(%rcx), %r9b
	movb	1189(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1190(%rcx), %r9b
	movb	1190(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1191(%rcx), %r9b
	movb	1191(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1192(%rcx), %r9b
	movb	1192(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1193(%rcx), %r9b
	movb	1193(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1194(%rcx), %r9b
	movb	1194(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1195(%rcx), %r9b
	movb	1195(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1196(%rcx), %r9b
	movb	1196(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1197(%rcx), %r9b
	movb	1197(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1198(%rcx), %r9b
	movb	1198(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1199(%rcx), %r9b
	movb	1199(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1200(%rcx), %r9b
	movb	1200(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1201(%rcx), %r9b
	movb	1201(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1202(%rcx), %r9b
	movb	1202(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1203(%rcx), %r9b
	movb	1203(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1204(%rcx), %r9b
	movb	1204(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1205(%rcx), %r9b
	movb	1205(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1206(%rcx), %r9b
	movb	1206(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1207(%rcx), %r9b
	movb	1207(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1208(%rcx), %r9b
	movb	1208(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1209(%rcx), %r9b
	movb	1209(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1210(%rcx), %r9b
	movb	1210(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1211(%rcx), %r9b
	movb	1211(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1212(%rcx), %r9b
	movb	1212(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1213(%rcx), %r9b
	movb	1213(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1214(%rcx), %r9b
	movb	1214(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1215(%rcx), %r9b
	movb	1215(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1216(%rcx), %r9b
	movb	1216(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1217(%rcx), %r9b
	movb	1217(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1218(%rcx), %r9b
	movb	1218(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1219(%rcx), %r9b
	movb	1219(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1220(%rcx), %r9b
	movb	1220(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1221(%rcx), %r9b
	movb	1221(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1222(%rcx), %r9b
	movb	1222(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1223(%rcx), %r9b
	movb	1223(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1224(%rcx), %r9b
	movb	1224(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1225(%rcx), %r9b
	movb	1225(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1226(%rcx), %r9b
	movb	1226(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1227(%rcx), %r9b
	movb	1227(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1228(%rcx), %r9b
	movb	1228(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1229(%rcx), %r9b
	movb	1229(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1230(%rcx), %r9b
	movb	1230(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1231(%rcx), %r9b
	movb	1231(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1232(%rcx), %r9b
	movb	1232(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1233(%rcx), %r9b
	movb	1233(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1234(%rcx), %r9b
	movb	1234(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1235(%rcx), %r9b
	movb	1235(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1236(%rcx), %r9b
	movb	1236(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1237(%rcx), %r9b
	movb	1237(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1238(%rcx), %r9b
	movb	1238(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1239(%rcx), %r9b
	movb	1239(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1240(%rcx), %r9b
	movb	1240(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1241(%rcx), %r9b
	movb	1241(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1242(%rcx), %r9b
	movb	1242(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1243(%rcx), %r9b
	movb	1243(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1244(%rcx), %r9b
	movb	1244(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1245(%rcx), %r9b
	movb	1245(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1246(%rcx), %r9b
	movb	1246(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1247(%rcx), %r9b
	movb	1247(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1248(%rcx), %r9b
	movb	1248(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1249(%rcx), %r9b
	movb	1249(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1250(%rcx), %r9b
	movb	1250(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1251(%rcx), %r9b
	movb	1251(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1252(%rcx), %r9b
	movb	1252(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1253(%rcx), %r9b
	movb	1253(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1254(%rcx), %r9b
	movb	1254(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1255(%rcx), %r9b
	movb	1255(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1256(%rcx), %r9b
	movb	1256(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1257(%rcx), %r9b
	movb	1257(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1258(%rcx), %r9b
	movb	1258(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1259(%rcx), %r9b
	movb	1259(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1260(%rcx), %r9b
	movb	1260(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1261(%rcx), %r9b
	movb	1261(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1262(%rcx), %r9b
	movb	1262(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1263(%rcx), %r9b
	movb	1263(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1264(%rcx), %r9b
	movb	1264(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1265(%rcx), %r9b
	movb	1265(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1266(%rcx), %r9b
	movb	1266(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1267(%rcx), %r9b
	movb	1267(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1268(%rcx), %r9b
	movb	1268(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1269(%rcx), %r9b
	movb	1269(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1270(%rcx), %r9b
	movb	1270(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1271(%rcx), %r9b
	movb	1271(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1272(%rcx), %r9b
	movb	1272(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1273(%rcx), %r9b
	movb	1273(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1274(%rcx), %r9b
	movb	1274(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1275(%rcx), %r9b
	movb	1275(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1276(%rcx), %r9b
	movb	1276(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1277(%rcx), %r9b
	movb	1277(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1278(%rcx), %r9b
	movb	1278(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1279(%rcx), %r9b
	movb	1279(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1280(%rcx), %r9b
	movb	1280(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1281(%rcx), %r9b
	movb	1281(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1282(%rcx), %r9b
	movb	1282(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1283(%rcx), %r9b
	movb	1283(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1284(%rcx), %r9b
	movb	1284(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1285(%rcx), %r9b
	movb	1285(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1286(%rcx), %r9b
	movb	1286(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1287(%rcx), %r9b
	movb	1287(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1288(%rcx), %r9b
	movb	1288(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1289(%rcx), %r9b
	movb	1289(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1290(%rcx), %r9b
	movb	1290(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1291(%rcx), %r9b
	movb	1291(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1292(%rcx), %r9b
	movb	1292(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1293(%rcx), %r9b
	movb	1293(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1294(%rcx), %r9b
	movb	1294(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1295(%rcx), %r9b
	movb	1295(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1296(%rcx), %r9b
	movb	1296(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1297(%rcx), %r9b
	movb	1297(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1298(%rcx), %r9b
	movb	1298(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1299(%rcx), %r9b
	movb	1299(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1300(%rcx), %r9b
	movb	1300(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1301(%rcx), %r9b
	movb	1301(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1302(%rcx), %r9b
	movb	1302(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1303(%rcx), %r9b
	movb	1303(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1304(%rcx), %r9b
	movb	1304(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1305(%rcx), %r9b
	movb	1305(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1306(%rcx), %r9b
	movb	1306(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1307(%rcx), %r9b
	movb	1307(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1308(%rcx), %r9b
	movb	1308(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1309(%rcx), %r9b
	movb	1309(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1310(%rcx), %r9b
	movb	1310(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1311(%rcx), %r9b
	movb	1311(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1312(%rcx), %r9b
	movb	1312(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1313(%rcx), %r9b
	movb	1313(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1314(%rcx), %r9b
	movb	1314(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1315(%rcx), %r9b
	movb	1315(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1316(%rcx), %r9b
	movb	1316(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1317(%rcx), %r9b
	movb	1317(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1318(%rcx), %r9b
	movb	1318(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1319(%rcx), %r9b
	movb	1319(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1320(%rcx), %r9b
	movb	1320(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1321(%rcx), %r9b
	movb	1321(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1322(%rcx), %r9b
	movb	1322(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1323(%rcx), %r9b
	movb	1323(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1324(%rcx), %r9b
	movb	1324(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1325(%rcx), %r9b
	movb	1325(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1326(%rcx), %r9b
	movb	1326(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1327(%rcx), %r9b
	movb	1327(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1328(%rcx), %r9b
	movb	1328(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1329(%rcx), %r9b
	movb	1329(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1330(%rcx), %r9b
	movb	1330(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1331(%rcx), %r9b
	movb	1331(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1332(%rcx), %r9b
	movb	1332(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1333(%rcx), %r9b
	movb	1333(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1334(%rcx), %r9b
	movb	1334(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1335(%rcx), %r9b
	movb	1335(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1336(%rcx), %r9b
	movb	1336(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1337(%rcx), %r9b
	movb	1337(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1338(%rcx), %r9b
	movb	1338(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1339(%rcx), %r9b
	movb	1339(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1340(%rcx), %r9b
	movb	1340(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1341(%rcx), %r9b
	movb	1341(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1342(%rcx), %r9b
	movb	1342(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1343(%rcx), %r9b
	movb	1343(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1344(%rcx), %r9b
	movb	1344(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1345(%rcx), %r9b
	movb	1345(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1346(%rcx), %r9b
	movb	1346(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1347(%rcx), %r9b
	movb	1347(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1348(%rcx), %r9b
	movb	1348(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1349(%rcx), %r9b
	movb	1349(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1350(%rcx), %r9b
	movb	1350(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1351(%rcx), %r9b
	movb	1351(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1352(%rcx), %r9b
	movb	1352(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1353(%rcx), %r9b
	movb	1353(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1354(%rcx), %r9b
	movb	1354(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1355(%rcx), %r9b
	movb	1355(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1356(%rcx), %r9b
	movb	1356(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1357(%rcx), %r9b
	movb	1357(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1358(%rcx), %r9b
	movb	1358(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1359(%rcx), %r9b
	movb	1359(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1360(%rcx), %r9b
	movb	1360(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1361(%rcx), %r9b
	movb	1361(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1362(%rcx), %r9b
	movb	1362(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1363(%rcx), %r9b
	movb	1363(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1364(%rcx), %r9b
	movb	1364(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1365(%rcx), %r9b
	movb	1365(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1366(%rcx), %r9b
	movb	1366(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1367(%rcx), %r9b
	movb	1367(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1368(%rcx), %r9b
	movb	1368(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1369(%rcx), %r9b
	movb	1369(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1370(%rcx), %r9b
	movb	1370(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1371(%rcx), %r9b
	movb	1371(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1372(%rcx), %r9b
	movb	1372(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1373(%rcx), %r9b
	movb	1373(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1374(%rcx), %r9b
	movb	1374(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1375(%rcx), %r9b
	movb	1375(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1376(%rcx), %r9b
	movb	1376(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1377(%rcx), %r9b
	movb	1377(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1378(%rcx), %r9b
	movb	1378(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1379(%rcx), %r9b
	movb	1379(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1380(%rcx), %r9b
	movb	1380(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1381(%rcx), %r9b
	movb	1381(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1382(%rcx), %r9b
	movb	1382(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1383(%rcx), %r9b
	movb	1383(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1384(%rcx), %r9b
	movb	1384(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1385(%rcx), %r9b
	movb	1385(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1386(%rcx), %r9b
	movb	1386(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1387(%rcx), %r9b
	movb	1387(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1388(%rcx), %r9b
	movb	1388(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1389(%rcx), %r9b
	movb	1389(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1390(%rcx), %r9b
	movb	1390(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1391(%rcx), %r9b
	movb	1391(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1392(%rcx), %r9b
	movb	1392(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1393(%rcx), %r9b
	movb	1393(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1394(%rcx), %r9b
	movb	1394(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1395(%rcx), %r9b
	movb	1395(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1396(%rcx), %r9b
	movb	1396(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1397(%rcx), %r9b
	movb	1397(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1398(%rcx), %r9b
	movb	1398(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1399(%rcx), %r9b
	movb	1399(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1400(%rcx), %r9b
	movb	1400(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1401(%rcx), %r9b
	movb	1401(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1402(%rcx), %r9b
	movb	1402(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1403(%rcx), %r9b
	movb	1403(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1404(%rcx), %r9b
	movb	1404(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1405(%rcx), %r9b
	movb	1405(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1406(%rcx), %r9b
	movb	1406(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1407(%rcx), %r9b
	movb	1407(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1408(%rcx), %r9b
	movb	1408(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1409(%rcx), %r9b
	movb	1409(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1410(%rcx), %r9b
	movb	1410(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1411(%rcx), %r9b
	movb	1411(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1412(%rcx), %r9b
	movb	1412(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1413(%rcx), %r9b
	movb	1413(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1414(%rcx), %r9b
	movb	1414(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1415(%rcx), %r9b
	movb	1415(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1416(%rcx), %r9b
	movb	1416(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1417(%rcx), %r9b
	movb	1417(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1418(%rcx), %r9b
	movb	1418(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1419(%rcx), %r9b
	movb	1419(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1420(%rcx), %r9b
	movb	1420(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1421(%rcx), %r9b
	movb	1421(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1422(%rcx), %r9b
	movb	1422(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1423(%rcx), %r9b
	movb	1423(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1424(%rcx), %r9b
	movb	1424(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1425(%rcx), %r9b
	movb	1425(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1426(%rcx), %r9b
	movb	1426(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1427(%rcx), %r9b
	movb	1427(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1428(%rcx), %r9b
	movb	1428(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1429(%rcx), %r9b
	movb	1429(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1430(%rcx), %r9b
	movb	1430(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1431(%rcx), %r9b
	movb	1431(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1432(%rcx), %r9b
	movb	1432(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1433(%rcx), %r9b
	movb	1433(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1434(%rcx), %r9b
	movb	1434(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1435(%rcx), %r9b
	movb	1435(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1436(%rcx), %r9b
	movb	1436(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1437(%rcx), %r9b
	movb	1437(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1438(%rcx), %r9b
	movb	1438(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1439(%rcx), %r9b
	movb	1439(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1440(%rcx), %r9b
	movb	1440(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1441(%rcx), %r9b
	movb	1441(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1442(%rcx), %r9b
	movb	1442(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1443(%rcx), %r9b
	movb	1443(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1444(%rcx), %r9b
	movb	1444(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1445(%rcx), %r9b
	movb	1445(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1446(%rcx), %r9b
	movb	1446(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1447(%rcx), %r9b
	movb	1447(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1448(%rcx), %r9b
	movb	1448(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1449(%rcx), %r9b
	movb	1449(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1450(%rcx), %r9b
	movb	1450(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1451(%rcx), %r9b
	movb	1451(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1452(%rcx), %r9b
	movb	1452(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1453(%rcx), %r9b
	movb	1453(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1454(%rcx), %r9b
	movb	1454(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1455(%rcx), %r9b
	movb	1455(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1456(%rcx), %r9b
	movb	1456(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1457(%rcx), %r9b
	movb	1457(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1458(%rcx), %r9b
	movb	1458(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1459(%rcx), %r9b
	movb	1459(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1460(%rcx), %r9b
	movb	1460(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1461(%rcx), %r9b
	movb	1461(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1462(%rcx), %r9b
	movb	1462(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1463(%rcx), %r9b
	movb	1463(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1464(%rcx), %r9b
	movb	1464(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1465(%rcx), %r9b
	movb	1465(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1466(%rcx), %r9b
	movb	1466(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1467(%rcx), %r9b
	movb	1467(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1468(%rcx), %r9b
	movb	1468(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1469(%rcx), %r9b
	movb	1469(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1470(%rcx), %r9b
	movb	1470(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1471(%rcx), %r9b
	movb	1471(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1472(%rcx), %r9b
	movb	1472(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1473(%rcx), %r9b
	movb	1473(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1474(%rcx), %r9b
	movb	1474(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1475(%rcx), %r9b
	movb	1475(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1476(%rcx), %r9b
	movb	1476(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1477(%rcx), %r9b
	movb	1477(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1478(%rcx), %r9b
	movb	1478(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1479(%rcx), %r9b
	movb	1479(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1480(%rcx), %r9b
	movb	1480(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1481(%rcx), %r9b
	movb	1481(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1482(%rcx), %r9b
	movb	1482(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1483(%rcx), %r9b
	movb	1483(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1484(%rcx), %r9b
	movb	1484(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1485(%rcx), %r9b
	movb	1485(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1486(%rcx), %r9b
	movb	1486(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1487(%rcx), %r9b
	movb	1487(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1488(%rcx), %r9b
	movb	1488(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1489(%rcx), %r9b
	movb	1489(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1490(%rcx), %r9b
	movb	1490(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1491(%rcx), %r9b
	movb	1491(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1492(%rcx), %r9b
	movb	1492(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1493(%rcx), %r9b
	movb	1493(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1494(%rcx), %r9b
	movb	1494(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1495(%rcx), %r9b
	movb	1495(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1496(%rcx), %r9b
	movb	1496(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1497(%rcx), %r9b
	movb	1497(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1498(%rcx), %r9b
	movb	1498(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1499(%rcx), %r9b
	movb	1499(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1500(%rcx), %r9b
	movb	1500(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1501(%rcx), %r9b
	movb	1501(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1502(%rcx), %r9b
	movb	1502(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1503(%rcx), %r9b
	movb	1503(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1504(%rcx), %r9b
	movb	1504(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1505(%rcx), %r9b
	movb	1505(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1506(%rcx), %r9b
	movb	1506(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1507(%rcx), %r9b
	movb	1507(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1508(%rcx), %r9b
	movb	1508(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1509(%rcx), %r9b
	movb	1509(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1510(%rcx), %r9b
	movb	1510(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1511(%rcx), %r9b
	movb	1511(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1512(%rcx), %r9b
	movb	1512(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1513(%rcx), %r9b
	movb	1513(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1514(%rcx), %r9b
	movb	1514(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1515(%rcx), %r9b
	movb	1515(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1516(%rcx), %r9b
	movb	1516(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1517(%rcx), %r9b
	movb	1517(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1518(%rcx), %r9b
	movb	1518(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1519(%rcx), %r9b
	movb	1519(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1520(%rcx), %r9b
	movb	1520(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1521(%rcx), %r9b
	movb	1521(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1522(%rcx), %r9b
	movb	1522(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1523(%rcx), %r9b
	movb	1523(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1524(%rcx), %r9b
	movb	1524(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1525(%rcx), %r9b
	movb	1525(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1526(%rcx), %r9b
	movb	1526(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1527(%rcx), %r9b
	movb	1527(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1528(%rcx), %r9b
	movb	1528(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1529(%rcx), %r9b
	movb	1529(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1530(%rcx), %r9b
	movb	1530(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1531(%rcx), %r9b
	movb	1531(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1532(%rcx), %r9b
	movb	1532(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1533(%rcx), %r9b
	movb	1533(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1534(%rcx), %r9b
	movb	1534(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1535(%rcx), %r9b
	movb	1535(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1536(%rcx), %r9b
	movb	1536(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1537(%rcx), %r9b
	movb	1537(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1538(%rcx), %r9b
	movb	1538(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1539(%rcx), %r9b
	movb	1539(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1540(%rcx), %r9b
	movb	1540(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1541(%rcx), %r9b
	movb	1541(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1542(%rcx), %r9b
	movb	1542(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1543(%rcx), %r9b
	movb	1543(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1544(%rcx), %r9b
	movb	1544(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1545(%rcx), %r9b
	movb	1545(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1546(%rcx), %r9b
	movb	1546(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1547(%rcx), %r9b
	movb	1547(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1548(%rcx), %r9b
	movb	1548(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1549(%rcx), %r9b
	movb	1549(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1550(%rcx), %r9b
	movb	1550(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1551(%rcx), %r9b
	movb	1551(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1552(%rcx), %r9b
	movb	1552(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1553(%rcx), %r9b
	movb	1553(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1554(%rcx), %r9b
	movb	1554(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1555(%rcx), %r9b
	movb	1555(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1556(%rcx), %r9b
	movb	1556(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1557(%rcx), %r9b
	movb	1557(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1558(%rcx), %r9b
	movb	1558(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1559(%rcx), %r9b
	movb	1559(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1560(%rcx), %r9b
	movb	1560(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1561(%rcx), %r9b
	movb	1561(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1562(%rcx), %r9b
	movb	1562(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1563(%rcx), %r9b
	movb	1563(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1564(%rcx), %r9b
	movb	1564(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1565(%rcx), %r9b
	movb	1565(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1566(%rcx), %r9b
	movb	1566(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rsi
	orq 	%rsi, %rdx
	movb	1567(%rcx), %r9b
	movb	1567(%rax), %r11b
	xorb	%r11b, %r9b
	movzbq	%r9b, %rax
	orq 	%rax, %rdx
	negq	%rdx
	shrq	$63, %rdx
	movq	%rdx, %mm1
	movq	8(%rsp), %rax
	movq	(%rsp), %rcx
	leaq	5320(%rsp), %rdx
	leaq	-224(%rsp), %rsp
	call	L_shake256_A32__A1600$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_dec$1:
	leaq	224(%rsp), %rsp
	movq	%mm1, %rdx
	leaq	184(%rsp), %rax
	negq	%rdx
	movb	(%rcx), %r11b
	movb	(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, (%rcx)
	movb	1(%rcx), %r11b
	movb	1(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 1(%rcx)
	movb	2(%rcx), %r11b
	movb	2(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 2(%rcx)
	movb	3(%rcx), %r11b
	movb	3(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 3(%rcx)
	movb	4(%rcx), %r11b
	movb	4(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 4(%rcx)
	movb	5(%rcx), %r11b
	movb	5(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 5(%rcx)
	movb	6(%rcx), %r11b
	movb	6(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 6(%rcx)
	movb	7(%rcx), %r11b
	movb	7(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 7(%rcx)
	movb	8(%rcx), %r11b
	movb	8(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 8(%rcx)
	movb	9(%rcx), %r11b
	movb	9(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 9(%rcx)
	movb	10(%rcx), %r11b
	movb	10(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 10(%rcx)
	movb	11(%rcx), %r11b
	movb	11(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 11(%rcx)
	movb	12(%rcx), %r11b
	movb	12(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 12(%rcx)
	movb	13(%rcx), %r11b
	movb	13(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 13(%rcx)
	movb	14(%rcx), %r11b
	movb	14(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 14(%rcx)
	movb	15(%rcx), %r11b
	movb	15(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 15(%rcx)
	movb	16(%rcx), %r11b
	movb	16(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 16(%rcx)
	movb	17(%rcx), %r11b
	movb	17(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 17(%rcx)
	movb	18(%rcx), %r11b
	movb	18(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 18(%rcx)
	movb	19(%rcx), %r11b
	movb	19(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 19(%rcx)
	movb	20(%rcx), %r11b
	movb	20(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 20(%rcx)
	movb	21(%rcx), %r11b
	movb	21(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 21(%rcx)
	movb	22(%rcx), %r11b
	movb	22(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 22(%rcx)
	movb	23(%rcx), %r11b
	movb	23(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 23(%rcx)
	movb	24(%rcx), %r11b
	movb	24(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 24(%rcx)
	movb	25(%rcx), %r11b
	movb	25(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 25(%rcx)
	movb	26(%rcx), %r11b
	movb	26(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 26(%rcx)
	movb	27(%rcx), %r11b
	movb	27(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 27(%rcx)
	movb	28(%rcx), %r11b
	movb	28(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 28(%rcx)
	movb	29(%rcx), %r11b
	movb	29(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 29(%rcx)
	movb	30(%rcx), %r11b
	movb	30(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 30(%rcx)
	movb	31(%rcx), %r11b
	movb	31(%rax), %r9b
	xorb	%r9b, %r11b
	andb	%dl, %r11b
	xorb	%r11b, %r9b
	movb	%r9b, 31(%rcx)
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
	movq	25352(%rsp), %rbx
	movq	25360(%rsp), %rbp
	movq	25368(%rsp), %r12
	movq	25376(%rsp), %r13
	movq	25384(%rsp), %r14
	movq	25392(%rsp), %r15
	movq	25400(%rsp), %rsp
	ret
	.type	_jade_kem_mlkem_mlkem1024_amd64_ref_enc, %function
	.type	jade_kem_mlkem_mlkem1024_amd64_ref_enc, %function
_jade_kem_mlkem_mlkem1024_amd64_ref_enc:
jade_kem_mlkem_mlkem1024_amd64_ref_enc:
	movq	%rsp, %rax
	leaq	-22240(%rsp), %rsp
	andq	$-16, %rsp
	movq	%rbx, 22184(%rsp)
	movq	%rbp, 22192(%rsp)
	movq	%r12, 22200(%rsp)
	movq	%r13, 22208(%rsp)
	movq	%r14, 22216(%rsp)
	movq	%r15, 22224(%rsp)
	movq	%rax, 22232(%rsp)
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%rdx, %r12
	leaq	16(%rsp), %rdi
	movq	$32, %rsi
	call	__jasmin_syscall_randombytes__
	leaq	16(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	%rbx, %mm1
	movq	%rbp, %mm2
	movq	(%r12), %rax
	movq	%rax, 616(%rsp)
	movq	8(%r12), %rax
	movq	%rax, 624(%rsp)
	movq	16(%r12), %rax
	movq	%rax, 632(%rsp)
	movq	24(%r12), %rax
	movq	%rax, 640(%rsp)
	movq	32(%r12), %rax
	movq	%rax, 648(%rsp)
	movq	40(%r12), %rax
	movq	%rax, 656(%rsp)
	movq	48(%r12), %rax
	movq	%rax, 664(%rsp)
	movq	56(%r12), %rax
	movq	%rax, 672(%rsp)
	movq	64(%r12), %rax
	movq	%rax, 680(%rsp)
	movq	72(%r12), %rax
	movq	%rax, 688(%rsp)
	movq	80(%r12), %rax
	movq	%rax, 696(%rsp)
	movq	88(%r12), %rax
	movq	%rax, 704(%rsp)
	movq	96(%r12), %rax
	movq	%rax, 712(%rsp)
	movq	104(%r12), %rax
	movq	%rax, 720(%rsp)
	movq	112(%r12), %rax
	movq	%rax, 728(%rsp)
	movq	120(%r12), %rax
	movq	%rax, 736(%rsp)
	movq	128(%r12), %rax
	movq	%rax, 744(%rsp)
	movq	136(%r12), %rax
	movq	%rax, 752(%rsp)
	movq	144(%r12), %rax
	movq	%rax, 760(%rsp)
	movq	152(%r12), %rax
	movq	%rax, 768(%rsp)
	movq	160(%r12), %rax
	movq	%rax, 776(%rsp)
	movq	168(%r12), %rax
	movq	%rax, 784(%rsp)
	movq	176(%r12), %rax
	movq	%rax, 792(%rsp)
	movq	184(%r12), %rax
	movq	%rax, 800(%rsp)
	movq	192(%r12), %rax
	movq	%rax, 808(%rsp)
	movq	200(%r12), %rax
	movq	%rax, 816(%rsp)
	movq	208(%r12), %rax
	movq	%rax, 824(%rsp)
	movq	216(%r12), %rax
	movq	%rax, 832(%rsp)
	movq	224(%r12), %rax
	movq	%rax, 840(%rsp)
	movq	232(%r12), %rax
	movq	%rax, 848(%rsp)
	movq	240(%r12), %rax
	movq	%rax, 856(%rsp)
	movq	248(%r12), %rax
	movq	%rax, 864(%rsp)
	movq	256(%r12), %rax
	movq	%rax, 872(%rsp)
	movq	264(%r12), %rax
	movq	%rax, 880(%rsp)
	movq	272(%r12), %rax
	movq	%rax, 888(%rsp)
	movq	280(%r12), %rax
	movq	%rax, 896(%rsp)
	movq	288(%r12), %rax
	movq	%rax, 904(%rsp)
	movq	296(%r12), %rax
	movq	%rax, 912(%rsp)
	movq	304(%r12), %rax
	movq	%rax, 920(%rsp)
	movq	312(%r12), %rax
	movq	%rax, 928(%rsp)
	movq	320(%r12), %rax
	movq	%rax, 936(%rsp)
	movq	328(%r12), %rax
	movq	%rax, 944(%rsp)
	movq	336(%r12), %rax
	movq	%rax, 952(%rsp)
	movq	344(%r12), %rax
	movq	%rax, 960(%rsp)
	movq	352(%r12), %rax
	movq	%rax, 968(%rsp)
	movq	360(%r12), %rax
	movq	%rax, 976(%rsp)
	movq	368(%r12), %rax
	movq	%rax, 984(%rsp)
	movq	376(%r12), %rax
	movq	%rax, 992(%rsp)
	movq	384(%r12), %rax
	movq	%rax, 1000(%rsp)
	movq	392(%r12), %rax
	movq	%rax, 1008(%rsp)
	movq	400(%r12), %rax
	movq	%rax, 1016(%rsp)
	movq	408(%r12), %rax
	movq	%rax, 1024(%rsp)
	movq	416(%r12), %rax
	movq	%rax, 1032(%rsp)
	movq	424(%r12), %rax
	movq	%rax, 1040(%rsp)
	movq	432(%r12), %rax
	movq	%rax, 1048(%rsp)
	movq	440(%r12), %rax
	movq	%rax, 1056(%rsp)
	movq	448(%r12), %rax
	movq	%rax, 1064(%rsp)
	movq	456(%r12), %rax
	movq	%rax, 1072(%rsp)
	movq	464(%r12), %rax
	movq	%rax, 1080(%rsp)
	movq	472(%r12), %rax
	movq	%rax, 1088(%rsp)
	movq	480(%r12), %rax
	movq	%rax, 1096(%rsp)
	movq	488(%r12), %rax
	movq	%rax, 1104(%rsp)
	movq	496(%r12), %rax
	movq	%rax, 1112(%rsp)
	movq	504(%r12), %rax
	movq	%rax, 1120(%rsp)
	movq	512(%r12), %rax
	movq	%rax, 1128(%rsp)
	movq	520(%r12), %rax
	movq	%rax, 1136(%rsp)
	movq	528(%r12), %rax
	movq	%rax, 1144(%rsp)
	movq	536(%r12), %rax
	movq	%rax, 1152(%rsp)
	movq	544(%r12), %rax
	movq	%rax, 1160(%rsp)
	movq	552(%r12), %rax
	movq	%rax, 1168(%rsp)
	movq	560(%r12), %rax
	movq	%rax, 1176(%rsp)
	movq	568(%r12), %rax
	movq	%rax, 1184(%rsp)
	movq	576(%r12), %rax
	movq	%rax, 1192(%rsp)
	movq	584(%r12), %rax
	movq	%rax, 1200(%rsp)
	movq	592(%r12), %rax
	movq	%rax, 1208(%rsp)
	movq	600(%r12), %rax
	movq	%rax, 1216(%rsp)
	movq	608(%r12), %rax
	movq	%rax, 1224(%rsp)
	movq	616(%r12), %rax
	movq	%rax, 1232(%rsp)
	movq	624(%r12), %rax
	movq	%rax, 1240(%rsp)
	movq	632(%r12), %rax
	movq	%rax, 1248(%rsp)
	movq	640(%r12), %rax
	movq	%rax, 1256(%rsp)
	movq	648(%r12), %rax
	movq	%rax, 1264(%rsp)
	movq	656(%r12), %rax
	movq	%rax, 1272(%rsp)
	movq	664(%r12), %rax
	movq	%rax, 1280(%rsp)
	movq	672(%r12), %rax
	movq	%rax, 1288(%rsp)
	movq	680(%r12), %rax
	movq	%rax, 1296(%rsp)
	movq	688(%r12), %rax
	movq	%rax, 1304(%rsp)
	movq	696(%r12), %rax
	movq	%rax, 1312(%rsp)
	movq	704(%r12), %rax
	movq	%rax, 1320(%rsp)
	movq	712(%r12), %rax
	movq	%rax, 1328(%rsp)
	movq	720(%r12), %rax
	movq	%rax, 1336(%rsp)
	movq	728(%r12), %rax
	movq	%rax, 1344(%rsp)
	movq	736(%r12), %rax
	movq	%rax, 1352(%rsp)
	movq	744(%r12), %rax
	movq	%rax, 1360(%rsp)
	movq	752(%r12), %rax
	movq	%rax, 1368(%rsp)
	movq	760(%r12), %rax
	movq	%rax, 1376(%rsp)
	movq	768(%r12), %rax
	movq	%rax, 1384(%rsp)
	movq	776(%r12), %rax
	movq	%rax, 1392(%rsp)
	movq	784(%r12), %rax
	movq	%rax, 1400(%rsp)
	movq	792(%r12), %rax
	movq	%rax, 1408(%rsp)
	movq	800(%r12), %rax
	movq	%rax, 1416(%rsp)
	movq	808(%r12), %rax
	movq	%rax, 1424(%rsp)
	movq	816(%r12), %rax
	movq	%rax, 1432(%rsp)
	movq	824(%r12), %rax
	movq	%rax, 1440(%rsp)
	movq	832(%r12), %rax
	movq	%rax, 1448(%rsp)
	movq	840(%r12), %rax
	movq	%rax, 1456(%rsp)
	movq	848(%r12), %rax
	movq	%rax, 1464(%rsp)
	movq	856(%r12), %rax
	movq	%rax, 1472(%rsp)
	movq	864(%r12), %rax
	movq	%rax, 1480(%rsp)
	movq	872(%r12), %rax
	movq	%rax, 1488(%rsp)
	movq	880(%r12), %rax
	movq	%rax, 1496(%rsp)
	movq	888(%r12), %rax
	movq	%rax, 1504(%rsp)
	movq	896(%r12), %rax
	movq	%rax, 1512(%rsp)
	movq	904(%r12), %rax
	movq	%rax, 1520(%rsp)
	movq	912(%r12), %rax
	movq	%rax, 1528(%rsp)
	movq	920(%r12), %rax
	movq	%rax, 1536(%rsp)
	movq	928(%r12), %rax
	movq	%rax, 1544(%rsp)
	movq	936(%r12), %rax
	movq	%rax, 1552(%rsp)
	movq	944(%r12), %rax
	movq	%rax, 1560(%rsp)
	movq	952(%r12), %rax
	movq	%rax, 1568(%rsp)
	movq	960(%r12), %rax
	movq	%rax, 1576(%rsp)
	movq	968(%r12), %rax
	movq	%rax, 1584(%rsp)
	movq	976(%r12), %rax
	movq	%rax, 1592(%rsp)
	movq	984(%r12), %rax
	movq	%rax, 1600(%rsp)
	movq	992(%r12), %rax
	movq	%rax, 1608(%rsp)
	movq	1000(%r12), %rax
	movq	%rax, 1616(%rsp)
	movq	1008(%r12), %rax
	movq	%rax, 1624(%rsp)
	movq	1016(%r12), %rax
	movq	%rax, 1632(%rsp)
	movq	1024(%r12), %rax
	movq	%rax, 1640(%rsp)
	movq	1032(%r12), %rax
	movq	%rax, 1648(%rsp)
	movq	1040(%r12), %rax
	movq	%rax, 1656(%rsp)
	movq	1048(%r12), %rax
	movq	%rax, 1664(%rsp)
	movq	1056(%r12), %rax
	movq	%rax, 1672(%rsp)
	movq	1064(%r12), %rax
	movq	%rax, 1680(%rsp)
	movq	1072(%r12), %rax
	movq	%rax, 1688(%rsp)
	movq	1080(%r12), %rax
	movq	%rax, 1696(%rsp)
	movq	1088(%r12), %rax
	movq	%rax, 1704(%rsp)
	movq	1096(%r12), %rax
	movq	%rax, 1712(%rsp)
	movq	1104(%r12), %rax
	movq	%rax, 1720(%rsp)
	movq	1112(%r12), %rax
	movq	%rax, 1728(%rsp)
	movq	1120(%r12), %rax
	movq	%rax, 1736(%rsp)
	movq	1128(%r12), %rax
	movq	%rax, 1744(%rsp)
	movq	1136(%r12), %rax
	movq	%rax, 1752(%rsp)
	movq	1144(%r12), %rax
	movq	%rax, 1760(%rsp)
	movq	1152(%r12), %rax
	movq	%rax, 1768(%rsp)
	movq	1160(%r12), %rax
	movq	%rax, 1776(%rsp)
	movq	1168(%r12), %rax
	movq	%rax, 1784(%rsp)
	movq	1176(%r12), %rax
	movq	%rax, 1792(%rsp)
	movq	1184(%r12), %rax
	movq	%rax, 1800(%rsp)
	movq	1192(%r12), %rax
	movq	%rax, 1808(%rsp)
	movq	1200(%r12), %rax
	movq	%rax, 1816(%rsp)
	movq	1208(%r12), %rax
	movq	%rax, 1824(%rsp)
	movq	1216(%r12), %rax
	movq	%rax, 1832(%rsp)
	movq	1224(%r12), %rax
	movq	%rax, 1840(%rsp)
	movq	1232(%r12), %rax
	movq	%rax, 1848(%rsp)
	movq	1240(%r12), %rax
	movq	%rax, 1856(%rsp)
	movq	1248(%r12), %rax
	movq	%rax, 1864(%rsp)
	movq	1256(%r12), %rax
	movq	%rax, 1872(%rsp)
	movq	1264(%r12), %rax
	movq	%rax, 1880(%rsp)
	movq	1272(%r12), %rax
	movq	%rax, 1888(%rsp)
	movq	1280(%r12), %rax
	movq	%rax, 1896(%rsp)
	movq	1288(%r12), %rax
	movq	%rax, 1904(%rsp)
	movq	1296(%r12), %rax
	movq	%rax, 1912(%rsp)
	movq	1304(%r12), %rax
	movq	%rax, 1920(%rsp)
	movq	1312(%r12), %rax
	movq	%rax, 1928(%rsp)
	movq	1320(%r12), %rax
	movq	%rax, 1936(%rsp)
	movq	1328(%r12), %rax
	movq	%rax, 1944(%rsp)
	movq	1336(%r12), %rax
	movq	%rax, 1952(%rsp)
	movq	1344(%r12), %rax
	movq	%rax, 1960(%rsp)
	movq	1352(%r12), %rax
	movq	%rax, 1968(%rsp)
	movq	1360(%r12), %rax
	movq	%rax, 1976(%rsp)
	movq	1368(%r12), %rax
	movq	%rax, 1984(%rsp)
	movq	1376(%r12), %rax
	movq	%rax, 1992(%rsp)
	movq	1384(%r12), %rax
	movq	%rax, 2000(%rsp)
	movq	1392(%r12), %rax
	movq	%rax, 2008(%rsp)
	movq	1400(%r12), %rax
	movq	%rax, 2016(%rsp)
	movq	1408(%r12), %rax
	movq	%rax, 2024(%rsp)
	movq	1416(%r12), %rax
	movq	%rax, 2032(%rsp)
	movq	1424(%r12), %rax
	movq	%rax, 2040(%rsp)
	movq	1432(%r12), %rax
	movq	%rax, 2048(%rsp)
	movq	1440(%r12), %rax
	movq	%rax, 2056(%rsp)
	movq	1448(%r12), %rax
	movq	%rax, 2064(%rsp)
	movq	1456(%r12), %rax
	movq	%rax, 2072(%rsp)
	movq	1464(%r12), %rax
	movq	%rax, 2080(%rsp)
	movq	1472(%r12), %rax
	movq	%rax, 2088(%rsp)
	movq	1480(%r12), %rax
	movq	%rax, 2096(%rsp)
	movq	1488(%r12), %rax
	movq	%rax, 2104(%rsp)
	movq	1496(%r12), %rax
	movq	%rax, 2112(%rsp)
	movq	1504(%r12), %rax
	movq	%rax, 2120(%rsp)
	movq	1512(%r12), %rax
	movq	%rax, 2128(%rsp)
	movq	1520(%r12), %rax
	movq	%rax, 2136(%rsp)
	movq	1528(%r12), %rax
	movq	%rax, 2144(%rsp)
	movq	1536(%r12), %rax
	movq	%rax, 2152(%rsp)
	movq	1544(%r12), %rax
	movq	%rax, 2160(%rsp)
	movq	1552(%r12), %rax
	movq	%rax, 2168(%rsp)
	movq	1560(%r12), %rax
	movq	%rax, 2176(%rsp)
	movq	(%rcx), %rax
	movq	%rax, 48(%rsp)
	movq	8(%rcx), %rax
	movq	%rax, 56(%rsp)
	movq	16(%rcx), %rax
	movq	%rax, 64(%rsp)
	movq	24(%rcx), %rax
	movq	%rax, 72(%rsp)
	leaq	2184(%rsp), %rcx
	leaq	616(%rsp), %r10
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
	leaq	-224(%rsp), %rsp
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$381:
	leaq	224(%rsp), %rsp
	leaq	184(%rsp), %rax
	leaq	120(%rsp), %r10
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$380:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %r10
	leaq	120(%rsp), %rax
	leaq	216(%rsp), %r11
	movq	%rcx, %mm0
	movq	%r10, %rbx
	leaq	5800(%rsp), %rcx
	movq	%rbx, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$379:
	leaq	6312(%rsp), %rcx
	leaq	384(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$378:
	leaq	6824(%rsp), %rcx
	leaq	768(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$377:
	leaq	7336(%rsp), %rcx
	leaq	1152(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$376:
	movq	1536(%r10), %rcx
	movq	%rcx, 48(%rsp)
	movq	1544(%r10), %rcx
	movq	%rcx, 56(%rsp)
	movq	1552(%r10), %rcx
	movq	%rcx, 64(%rsp)
	movq	1560(%r10), %rcx
	movq	%rcx, 72(%rsp)
	leaq	3752(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$375:
	movq	%r11, %mm3
	movq	$1, %rax
	movq	%rax, %mm4
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
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$373
	movb	$0, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$374
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$373:
	movb	$0, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$374:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$372:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$359
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$360:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$371:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$369
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$370
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$369:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	13992(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$357
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$358:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$357:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$358
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$355
	movb	$0, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$356
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$355:
	movb	$1, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$356:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$354:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$341
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$342:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$353:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$351
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$351:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	14504(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$339
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$340:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$339:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$340
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$337
	movb	$0, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$338
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$337:
	movb	$2, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$338:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$336:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$323
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$324:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$335:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$333
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$333:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	15016(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$321
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$322:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$321:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$322
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$319
	movb	$0, 112(%rsp)
	movb	$3, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$320
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$319:
	movb	$3, 112(%rsp)
	movb	$0, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$320:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$318:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$305
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$306:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$317:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$315
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$315:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	15528(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$303
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$304:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$303:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$304
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$301
	movb	$1, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$302
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$301:
	movb	$0, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$302:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$300:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$287
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$288:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$299:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$297
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$297:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	16040(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$285
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$286:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$285:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$286
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$283
	movb	$1, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$284
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$283:
	movb	$1, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$284:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$282:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$269
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$270:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$281:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$279
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$279:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	16552(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$267
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$268:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$267:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$268
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$265
	movb	$1, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$266
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$265:
	movb	$2, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$266:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$264:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$251
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$252:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$263:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$261
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$262
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$261:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	17064(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$249
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$250:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$249:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$250
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$247
	movb	$1, 112(%rsp)
	movb	$3, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$248
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$247:
	movb	$3, 112(%rsp)
	movb	$1, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$248:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$246:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$233
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$234:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$245:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$243
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$244
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$243:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	17576(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$231
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$232:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$231:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$232
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$229
	movb	$2, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$230
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$229:
	movb	$0, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$230:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$228:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$215
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$216:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$227:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$225
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$226
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$225:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	18088(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$213
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$214:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$213:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$214
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$211
	movb	$2, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$212
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$211:
	movb	$1, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$212:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$210:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$197
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$198:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$209:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$207
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$208
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$207:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	18600(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$195
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$196:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$195:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$196
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$193
	movb	$2, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$194
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$193:
	movb	$2, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$194:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$192:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$179
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$180:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$191:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$189
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$190
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$189:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	19112(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$177
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$178:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$177:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$178
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$175
	movb	$2, 112(%rsp)
	movb	$3, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$176
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$175:
	movb	$3, 112(%rsp)
	movb	$2, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$176:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$174:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$161
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$162:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$173:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$171
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$172
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$171:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	19624(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$159
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$160:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$159:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$160
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$157
	movb	$3, 112(%rsp)
	movb	$0, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$158
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$157:
	movb	$0, 112(%rsp)
	movb	$3, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$158:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$156:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$143
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$144:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$155:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$153
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$154
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$153:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	20136(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$141
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$142:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$141:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$142
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$139
	movb	$3, 112(%rsp)
	movb	$1, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$140
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$139:
	movb	$1, 112(%rsp)
	movb	$3, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$140:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$138:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$125
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$126:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$137:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$135
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$136
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$135:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	20648(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$123
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$124:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$123:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$124
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$121
	movb	$3, 112(%rsp)
	movb	$2, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$122
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$121:
	movb	$2, 112(%rsp)
	movb	$3, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$122:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$120:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$107
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$108:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$119:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$117
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$118
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$117:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	21160(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$105
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$106:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$105:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$106
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$103
	movb	$3, 112(%rsp)
	movb	$3, 113(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$104
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$103:
	movb	$3, 112(%rsp)
	movb	$3, 113(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$104:
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$102:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$89
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$90:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$101:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$99
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$100
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$99:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	21672(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$87
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$88:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$87:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$88
	movq	%mm3, %rcx
	movb	$0, %al
	leaq	7848(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$86:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	8360(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$85:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	8872(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$84:
	leaq	176(%rsp), %rsp
	movb	$3, %al
	leaq	9384(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$83:
	leaq	176(%rsp), %rsp
	movq	%mm3, %rcx
	movb	$4, %al
	leaq	9896(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$82:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	10408(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$81:
	leaq	176(%rsp), %rsp
	movb	$6, %al
	leaq	10920(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$80:
	leaq	176(%rsp), %rsp
	movb	$7, %al
	leaq	11432(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$79:
	leaq	176(%rsp), %rsp
	movb	$8, %al
	leaq	4264(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$78:
	leaq	176(%rsp), %rsp
	leaq	7848(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$77:
	leaq	8360(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$76:
	leaq	8872(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$75:
	leaq	9384(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$74:
	leaq	11944(%rsp), %rsi
	leaq	13992(%rsp), %rdx
	leaq	7848(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$73:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rsi
	leaq	14504(%rsp), %rdx
	leaq	8360(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$72:
	leaq	16(%rsp), %rsp
	leaq	11944(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$71:
	leaq	4776(%rsp), %rsi
	leaq	15016(%rsp), %rdx
	leaq	8872(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$70:
	leaq	16(%rsp), %rsp
	leaq	11944(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$69:
	leaq	4776(%rsp), %rsi
	leaq	15528(%rsp), %rdx
	leaq	9384(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$68:
	leaq	16(%rsp), %rsp
	leaq	11944(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$67:
	leaq	11944(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$65
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$66:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$65:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$66
	leaq	12456(%rsp), %rsi
	leaq	16040(%rsp), %rdx
	leaq	7848(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$64:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rsi
	leaq	16552(%rsp), %rdx
	leaq	8360(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$63:
	leaq	16(%rsp), %rsp
	leaq	12456(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$62:
	leaq	4776(%rsp), %rsi
	leaq	17064(%rsp), %rdx
	leaq	8872(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$61:
	leaq	16(%rsp), %rsp
	leaq	12456(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$60:
	leaq	4776(%rsp), %rsi
	leaq	17576(%rsp), %rdx
	leaq	9384(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$59:
	leaq	16(%rsp), %rsp
	leaq	12456(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$58:
	leaq	12456(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$56
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$57:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$56:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$57
	leaq	12968(%rsp), %rsi
	leaq	18088(%rsp), %rdx
	leaq	7848(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$55:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rsi
	leaq	18600(%rsp), %rdx
	leaq	8360(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$54:
	leaq	16(%rsp), %rsp
	leaq	12968(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$53:
	leaq	4776(%rsp), %rsi
	leaq	19112(%rsp), %rdx
	leaq	8872(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$52:
	leaq	16(%rsp), %rsp
	leaq	12968(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$51:
	leaq	4776(%rsp), %rsi
	leaq	19624(%rsp), %rdx
	leaq	9384(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$50:
	leaq	16(%rsp), %rsp
	leaq	12968(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$49:
	leaq	12968(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$47
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$48:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$47:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$48
	leaq	13480(%rsp), %rsi
	leaq	20136(%rsp), %rdx
	leaq	7848(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$46:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rsi
	leaq	20648(%rsp), %rdx
	leaq	8360(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$45:
	leaq	16(%rsp), %rsp
	leaq	13480(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$44:
	leaq	4776(%rsp), %rsi
	leaq	21160(%rsp), %rdx
	leaq	8872(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$43:
	leaq	16(%rsp), %rsp
	leaq	13480(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$42:
	leaq	4776(%rsp), %rsi
	leaq	21672(%rsp), %rdx
	leaq	9384(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$41:
	leaq	16(%rsp), %rsp
	leaq	13480(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$40:
	leaq	13480(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$38
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$39:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$38:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$39
	leaq	4776(%rsp), %rsi
	leaq	5800(%rsp), %rdx
	leaq	7848(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$37:
	leaq	16(%rsp), %rsp
	leaq	5288(%rsp), %rsi
	leaq	6312(%rsp), %rdx
	leaq	8360(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$36:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rcx
	leaq	5288(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$35:
	leaq	5288(%rsp), %rsi
	leaq	6824(%rsp), %rdx
	leaq	8872(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$34:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rcx
	leaq	5288(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$33:
	leaq	5288(%rsp), %rsi
	leaq	7336(%rsp), %rdx
	leaq	9384(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$32:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rcx
	leaq	5288(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$31:
	leaq	4776(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$29
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$30:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$29:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$30
	leaq	11944(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$28:
	leaq	12456(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$27:
	leaq	12968(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$26:
	leaq	13480(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$25:
	leaq	4776(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$24:
	leaq	11944(%rsp), %rcx
	leaq	9896(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$23:
	leaq	12456(%rsp), %rcx
	leaq	10408(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$22:
	leaq	12968(%rsp), %rcx
	leaq	10920(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$21:
	leaq	13480(%rsp), %rcx
	leaq	11432(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$20:
	leaq	4776(%rsp), %rcx
	leaq	4264(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$19:
	leaq	4776(%rsp), %rcx
	leaq	3752(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$18:
	leaq	11944(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$16
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$17:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$16:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$17
	leaq	12456(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$14
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$15:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$14:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$15
	leaq	12968(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$12
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$13:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$12:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$13
	leaq	13480(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$10
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$11:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$10:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$11
	leaq	4776(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$9:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$8:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$9
	movq	%mm0, %rax
	movq	%rax, %rsi
	movq	$0, %rdi
	movq	$0, %r8
	leaq	11944(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$7:
	leaq	12456(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$6:
	leaq	12968(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$5:
	leaq	13480(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$4:
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$2
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$3:
	movzwq	11944(%rsp,%rdi,2), %r9
	shlq	$11, %r9
	addq	$1664, %r9
	imulq	$645084, %r9, %r9
	shrq	$31, %r9
	andq	$2047, %r9
	movw	%r9w, %cx
	movzwq	11946(%rsp,%rdi,2), %r9
	shlq	$11, %r9
	addq	$1664, %r9
	imulq	$645084, %r9, %r9
	shrq	$31, %r9
	andq	$2047, %r9
	movw	%r9w, %dx
	movzwq	11948(%rsp,%rdi,2), %r9
	shlq	$11, %r9
	addq	$1664, %r9
	imulq	$645084, %r9, %r9
	shrq	$31, %r9
	andq	$2047, %r9
	movzwq	11950(%rsp,%rdi,2), %r10
	shlq	$11, %r10
	addq	$1664, %r10
	imulq	$645084, %r10, %r10
	shrq	$31, %r10
	andq	$2047, %r10
	movzwq	11952(%rsp,%rdi,2), %r11
	shlq	$11, %r11
	addq	$1664, %r11
	imulq	$645084, %r11, %r11
	shrq	$31, %r11
	andq	$2047, %r11
	movzwq	11954(%rsp,%rdi,2), %rbx
	shlq	$11, %rbx
	addq	$1664, %rbx
	imulq	$645084, %rbx, %rbx
	shrq	$31, %rbx
	andq	$2047, %rbx
	movzwq	11956(%rsp,%rdi,2), %rbp
	shlq	$11, %rbp
	addq	$1664, %rbp
	imulq	$645084, %rbp, %rbp
	shrq	$31, %rbp
	andq	$2047, %rbp
	movzwq	11958(%rsp,%rdi,2), %r12
	shlq	$11, %r12
	addq	$1664, %r12
	imulq	$645084, %r12, %r12
	shrq	$31, %r12
	andq	$2047, %r12
	movw	%cx, %r13w
	movb	%r13b, (%rsi,%r8)
	incq	%r8
	shrw	$8, %cx
	movw	%dx, %r13w
	shlw	$3, %r13w
	orw 	%cx, %r13w
	movb	%r13b, (%rsi,%r8)
	incq	%r8
	shrw	$5, %dx
	movw	%r9w, %r13w
	shlw	$6, %r13w
	orw 	%dx, %r13w
	movb	%r13b, (%rsi,%r8)
	incq	%r8
	movw	%r9w, %cx
	shrw	$2, %cx
	movb	%cl, (%rsi,%r8)
	incq	%r8
	shrw	$10, %r9w
	movw	%r10w, %dx
	shlw	$1, %dx
	orw 	%r9w, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	shrw	$7, %r10w
	movw	%r11w, %dx
	shlw	$4, %dx
	orw 	%r10w, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	shrw	$4, %r11w
	movw	%bx, %dx
	shlw	$7, %dx
	orw 	%r11w, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	movw	%bx, %cx
	shrw	$1, %cx
	movb	%cl, (%rsi,%r8)
	incq	%r8
	shrw	$9, %bx
	movw	%bp, %dx
	shlw	$2, %dx
	orw 	%bx, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	shrw	$6, %bp
	movw	%r12w, %dx
	shlw	$5, %dx
	orw 	%bp, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	shrw	$3, %r12w
	movb	%r12b, (%rsi,%r8)
	incq	%r8
	addq	$8, %rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$2:
	cmpq	$1024, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$3
	leaq	1408(%rax), %rax
	leaq	4776(%rsp), %rcx
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc$1:
	movq	8(%rsp), %rcx
	movq	184(%rsp), %rax
	movq	%rax, (%rcx)
	movq	192(%rsp), %rax
	movq	%rax, 8(%rcx)
	movq	200(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	208(%rsp), %rax
	movq	%rax, 24(%rcx)
	movq	%mm1, %rsi
	movq	%mm2, %rdi
	movq	2184(%rsp), %rax
	movq	%rax, (%rsi)
	movq	2192(%rsp), %rax
	movq	%rax, 8(%rsi)
	movq	2200(%rsp), %rax
	movq	%rax, 16(%rsi)
	movq	2208(%rsp), %rax
	movq	%rax, 24(%rsi)
	movq	2216(%rsp), %rax
	movq	%rax, 32(%rsi)
	movq	2224(%rsp), %rax
	movq	%rax, 40(%rsi)
	movq	2232(%rsp), %rax
	movq	%rax, 48(%rsi)
	movq	2240(%rsp), %rax
	movq	%rax, 56(%rsi)
	movq	2248(%rsp), %rax
	movq	%rax, 64(%rsi)
	movq	2256(%rsp), %rax
	movq	%rax, 72(%rsi)
	movq	2264(%rsp), %rax
	movq	%rax, 80(%rsi)
	movq	2272(%rsp), %rax
	movq	%rax, 88(%rsi)
	movq	2280(%rsp), %rax
	movq	%rax, 96(%rsi)
	movq	2288(%rsp), %rax
	movq	%rax, 104(%rsi)
	movq	2296(%rsp), %rax
	movq	%rax, 112(%rsi)
	movq	2304(%rsp), %rax
	movq	%rax, 120(%rsi)
	movq	2312(%rsp), %rax
	movq	%rax, 128(%rsi)
	movq	2320(%rsp), %rax
	movq	%rax, 136(%rsi)
	movq	2328(%rsp), %rax
	movq	%rax, 144(%rsi)
	movq	2336(%rsp), %rax
	movq	%rax, 152(%rsi)
	movq	2344(%rsp), %rax
	movq	%rax, 160(%rsi)
	movq	2352(%rsp), %rax
	movq	%rax, 168(%rsi)
	movq	2360(%rsp), %rax
	movq	%rax, 176(%rsi)
	movq	2368(%rsp), %rax
	movq	%rax, 184(%rsi)
	movq	2376(%rsp), %rax
	movq	%rax, 192(%rsi)
	movq	2384(%rsp), %rax
	movq	%rax, 200(%rsi)
	movq	2392(%rsp), %rax
	movq	%rax, 208(%rsi)
	movq	2400(%rsp), %rax
	movq	%rax, 216(%rsi)
	movq	2408(%rsp), %rax
	movq	%rax, 224(%rsi)
	movq	2416(%rsp), %rax
	movq	%rax, 232(%rsi)
	movq	2424(%rsp), %rax
	movq	%rax, 240(%rsi)
	movq	2432(%rsp), %rax
	movq	%rax, 248(%rsi)
	movq	2440(%rsp), %rax
	movq	%rax, 256(%rsi)
	movq	2448(%rsp), %rax
	movq	%rax, 264(%rsi)
	movq	2456(%rsp), %rax
	movq	%rax, 272(%rsi)
	movq	2464(%rsp), %rax
	movq	%rax, 280(%rsi)
	movq	2472(%rsp), %rax
	movq	%rax, 288(%rsi)
	movq	2480(%rsp), %rax
	movq	%rax, 296(%rsi)
	movq	2488(%rsp), %rax
	movq	%rax, 304(%rsi)
	movq	2496(%rsp), %rax
	movq	%rax, 312(%rsi)
	movq	2504(%rsp), %rax
	movq	%rax, 320(%rsi)
	movq	2512(%rsp), %rax
	movq	%rax, 328(%rsi)
	movq	2520(%rsp), %rax
	movq	%rax, 336(%rsi)
	movq	2528(%rsp), %rax
	movq	%rax, 344(%rsi)
	movq	2536(%rsp), %rax
	movq	%rax, 352(%rsi)
	movq	2544(%rsp), %rax
	movq	%rax, 360(%rsi)
	movq	2552(%rsp), %rax
	movq	%rax, 368(%rsi)
	movq	2560(%rsp), %rax
	movq	%rax, 376(%rsi)
	movq	2568(%rsp), %rax
	movq	%rax, 384(%rsi)
	movq	2576(%rsp), %rax
	movq	%rax, 392(%rsi)
	movq	2584(%rsp), %rax
	movq	%rax, 400(%rsi)
	movq	2592(%rsp), %rax
	movq	%rax, 408(%rsi)
	movq	2600(%rsp), %rax
	movq	%rax, 416(%rsi)
	movq	2608(%rsp), %rax
	movq	%rax, 424(%rsi)
	movq	2616(%rsp), %rax
	movq	%rax, 432(%rsi)
	movq	2624(%rsp), %rax
	movq	%rax, 440(%rsi)
	movq	2632(%rsp), %rax
	movq	%rax, 448(%rsi)
	movq	2640(%rsp), %rax
	movq	%rax, 456(%rsi)
	movq	2648(%rsp), %rax
	movq	%rax, 464(%rsi)
	movq	2656(%rsp), %rax
	movq	%rax, 472(%rsi)
	movq	2664(%rsp), %rax
	movq	%rax, 480(%rsi)
	movq	2672(%rsp), %rax
	movq	%rax, 488(%rsi)
	movq	2680(%rsp), %rax
	movq	%rax, 496(%rsi)
	movq	2688(%rsp), %rax
	movq	%rax, 504(%rsi)
	movq	2696(%rsp), %rax
	movq	%rax, 512(%rsi)
	movq	2704(%rsp), %rax
	movq	%rax, 520(%rsi)
	movq	2712(%rsp), %rax
	movq	%rax, 528(%rsi)
	movq	2720(%rsp), %rax
	movq	%rax, 536(%rsi)
	movq	2728(%rsp), %rax
	movq	%rax, 544(%rsi)
	movq	2736(%rsp), %rax
	movq	%rax, 552(%rsi)
	movq	2744(%rsp), %rax
	movq	%rax, 560(%rsi)
	movq	2752(%rsp), %rax
	movq	%rax, 568(%rsi)
	movq	2760(%rsp), %rax
	movq	%rax, 576(%rsi)
	movq	2768(%rsp), %rax
	movq	%rax, 584(%rsi)
	movq	2776(%rsp), %rax
	movq	%rax, 592(%rsi)
	movq	2784(%rsp), %rax
	movq	%rax, 600(%rsi)
	movq	2792(%rsp), %rax
	movq	%rax, 608(%rsi)
	movq	2800(%rsp), %rax
	movq	%rax, 616(%rsi)
	movq	2808(%rsp), %rax
	movq	%rax, 624(%rsi)
	movq	2816(%rsp), %rax
	movq	%rax, 632(%rsi)
	movq	2824(%rsp), %rax
	movq	%rax, 640(%rsi)
	movq	2832(%rsp), %rax
	movq	%rax, 648(%rsi)
	movq	2840(%rsp), %rax
	movq	%rax, 656(%rsi)
	movq	2848(%rsp), %rax
	movq	%rax, 664(%rsi)
	movq	2856(%rsp), %rax
	movq	%rax, 672(%rsi)
	movq	2864(%rsp), %rax
	movq	%rax, 680(%rsi)
	movq	2872(%rsp), %rax
	movq	%rax, 688(%rsi)
	movq	2880(%rsp), %rax
	movq	%rax, 696(%rsi)
	movq	2888(%rsp), %rax
	movq	%rax, 704(%rsi)
	movq	2896(%rsp), %rax
	movq	%rax, 712(%rsi)
	movq	2904(%rsp), %rax
	movq	%rax, 720(%rsi)
	movq	2912(%rsp), %rax
	movq	%rax, 728(%rsi)
	movq	2920(%rsp), %rax
	movq	%rax, 736(%rsi)
	movq	2928(%rsp), %rax
	movq	%rax, 744(%rsi)
	movq	2936(%rsp), %rax
	movq	%rax, 752(%rsi)
	movq	2944(%rsp), %rax
	movq	%rax, 760(%rsi)
	movq	2952(%rsp), %rax
	movq	%rax, 768(%rsi)
	movq	2960(%rsp), %rax
	movq	%rax, 776(%rsi)
	movq	2968(%rsp), %rax
	movq	%rax, 784(%rsi)
	movq	2976(%rsp), %rax
	movq	%rax, 792(%rsi)
	movq	2984(%rsp), %rax
	movq	%rax, 800(%rsi)
	movq	2992(%rsp), %rax
	movq	%rax, 808(%rsi)
	movq	3000(%rsp), %rax
	movq	%rax, 816(%rsi)
	movq	3008(%rsp), %rax
	movq	%rax, 824(%rsi)
	movq	3016(%rsp), %rax
	movq	%rax, 832(%rsi)
	movq	3024(%rsp), %rax
	movq	%rax, 840(%rsi)
	movq	3032(%rsp), %rax
	movq	%rax, 848(%rsi)
	movq	3040(%rsp), %rax
	movq	%rax, 856(%rsi)
	movq	3048(%rsp), %rax
	movq	%rax, 864(%rsi)
	movq	3056(%rsp), %rax
	movq	%rax, 872(%rsi)
	movq	3064(%rsp), %rax
	movq	%rax, 880(%rsi)
	movq	3072(%rsp), %rax
	movq	%rax, 888(%rsi)
	movq	3080(%rsp), %rax
	movq	%rax, 896(%rsi)
	movq	3088(%rsp), %rax
	movq	%rax, 904(%rsi)
	movq	3096(%rsp), %rax
	movq	%rax, 912(%rsi)
	movq	3104(%rsp), %rax
	movq	%rax, 920(%rsi)
	movq	3112(%rsp), %rax
	movq	%rax, 928(%rsi)
	movq	3120(%rsp), %rax
	movq	%rax, 936(%rsi)
	movq	3128(%rsp), %rax
	movq	%rax, 944(%rsi)
	movq	3136(%rsp), %rax
	movq	%rax, 952(%rsi)
	movq	3144(%rsp), %rax
	movq	%rax, 960(%rsi)
	movq	3152(%rsp), %rax
	movq	%rax, 968(%rsi)
	movq	3160(%rsp), %rax
	movq	%rax, 976(%rsi)
	movq	3168(%rsp), %rax
	movq	%rax, 984(%rsi)
	movq	3176(%rsp), %rax
	movq	%rax, 992(%rsi)
	movq	3184(%rsp), %rax
	movq	%rax, 1000(%rsi)
	movq	3192(%rsp), %rax
	movq	%rax, 1008(%rsi)
	movq	3200(%rsp), %rax
	movq	%rax, 1016(%rsi)
	movq	3208(%rsp), %rax
	movq	%rax, 1024(%rsi)
	movq	3216(%rsp), %rax
	movq	%rax, 1032(%rsi)
	movq	3224(%rsp), %rax
	movq	%rax, 1040(%rsi)
	movq	3232(%rsp), %rax
	movq	%rax, 1048(%rsi)
	movq	3240(%rsp), %rax
	movq	%rax, 1056(%rsi)
	movq	3248(%rsp), %rax
	movq	%rax, 1064(%rsi)
	movq	3256(%rsp), %rax
	movq	%rax, 1072(%rsi)
	movq	3264(%rsp), %rax
	movq	%rax, 1080(%rsi)
	movq	3272(%rsp), %rax
	movq	%rax, 1088(%rsi)
	movq	3280(%rsp), %rax
	movq	%rax, 1096(%rsi)
	movq	3288(%rsp), %rax
	movq	%rax, 1104(%rsi)
	movq	3296(%rsp), %rax
	movq	%rax, 1112(%rsi)
	movq	3304(%rsp), %rax
	movq	%rax, 1120(%rsi)
	movq	3312(%rsp), %rax
	movq	%rax, 1128(%rsi)
	movq	3320(%rsp), %rax
	movq	%rax, 1136(%rsi)
	movq	3328(%rsp), %rax
	movq	%rax, 1144(%rsi)
	movq	3336(%rsp), %rax
	movq	%rax, 1152(%rsi)
	movq	3344(%rsp), %rax
	movq	%rax, 1160(%rsi)
	movq	3352(%rsp), %rax
	movq	%rax, 1168(%rsi)
	movq	3360(%rsp), %rax
	movq	%rax, 1176(%rsi)
	movq	3368(%rsp), %rax
	movq	%rax, 1184(%rsi)
	movq	3376(%rsp), %rax
	movq	%rax, 1192(%rsi)
	movq	3384(%rsp), %rax
	movq	%rax, 1200(%rsi)
	movq	3392(%rsp), %rax
	movq	%rax, 1208(%rsi)
	movq	3400(%rsp), %rax
	movq	%rax, 1216(%rsi)
	movq	3408(%rsp), %rax
	movq	%rax, 1224(%rsi)
	movq	3416(%rsp), %rax
	movq	%rax, 1232(%rsi)
	movq	3424(%rsp), %rax
	movq	%rax, 1240(%rsi)
	movq	3432(%rsp), %rax
	movq	%rax, 1248(%rsi)
	movq	3440(%rsp), %rax
	movq	%rax, 1256(%rsi)
	movq	3448(%rsp), %rax
	movq	%rax, 1264(%rsi)
	movq	3456(%rsp), %rax
	movq	%rax, 1272(%rsi)
	movq	3464(%rsp), %rax
	movq	%rax, 1280(%rsi)
	movq	3472(%rsp), %rax
	movq	%rax, 1288(%rsi)
	movq	3480(%rsp), %rax
	movq	%rax, 1296(%rsi)
	movq	3488(%rsp), %rax
	movq	%rax, 1304(%rsi)
	movq	3496(%rsp), %rax
	movq	%rax, 1312(%rsi)
	movq	3504(%rsp), %rax
	movq	%rax, 1320(%rsi)
	movq	3512(%rsp), %rax
	movq	%rax, 1328(%rsi)
	movq	3520(%rsp), %rax
	movq	%rax, 1336(%rsi)
	movq	3528(%rsp), %rax
	movq	%rax, 1344(%rsi)
	movq	3536(%rsp), %rax
	movq	%rax, 1352(%rsi)
	movq	3544(%rsp), %rax
	movq	%rax, 1360(%rsi)
	movq	3552(%rsp), %rax
	movq	%rax, 1368(%rsi)
	movq	3560(%rsp), %rax
	movq	%rax, 1376(%rsi)
	movq	3568(%rsp), %rax
	movq	%rax, 1384(%rsi)
	movq	3576(%rsp), %rax
	movq	%rax, 1392(%rsi)
	movq	3584(%rsp), %rax
	movq	%rax, 1400(%rsi)
	movq	3592(%rsp), %rax
	movq	%rax, 1408(%rsi)
	movq	3600(%rsp), %rax
	movq	%rax, 1416(%rsi)
	movq	3608(%rsp), %rax
	movq	%rax, 1424(%rsi)
	movq	3616(%rsp), %rax
	movq	%rax, 1432(%rsi)
	movq	3624(%rsp), %rax
	movq	%rax, 1440(%rsi)
	movq	3632(%rsp), %rax
	movq	%rax, 1448(%rsi)
	movq	3640(%rsp), %rax
	movq	%rax, 1456(%rsi)
	movq	3648(%rsp), %rax
	movq	%rax, 1464(%rsi)
	movq	3656(%rsp), %rax
	movq	%rax, 1472(%rsi)
	movq	3664(%rsp), %rax
	movq	%rax, 1480(%rsi)
	movq	3672(%rsp), %rax
	movq	%rax, 1488(%rsi)
	movq	3680(%rsp), %rax
	movq	%rax, 1496(%rsi)
	movq	3688(%rsp), %rax
	movq	%rax, 1504(%rsi)
	movq	3696(%rsp), %rax
	movq	%rax, 1512(%rsi)
	movq	3704(%rsp), %rax
	movq	%rax, 1520(%rsi)
	movq	3712(%rsp), %rax
	movq	%rax, 1528(%rsi)
	movq	3720(%rsp), %rax
	movq	%rax, 1536(%rsi)
	movq	3728(%rsp), %rax
	movq	%rax, 1544(%rsi)
	movq	3736(%rsp), %rax
	movq	%rax, 1552(%rsi)
	movq	3744(%rsp), %rax
	movq	%rax, 1560(%rsi)
	movq	16(%rsp), %rax
	movq	%rax, (%rdi)
	movq	24(%rsp), %rax
	movq	%rax, 8(%rdi)
	movq	32(%rsp), %rax
	movq	%rax, 16(%rdi)
	movq	40(%rsp), %rax
	movq	%rax, 24(%rdi)
	xorl	%eax, %eax
	movq	22184(%rsp), %rbx
	movq	22192(%rsp), %rbp
	movq	22200(%rsp), %r12
	movq	22208(%rsp), %r13
	movq	22216(%rsp), %r14
	movq	22224(%rsp), %r15
	movq	22232(%rsp), %rsp
	ret
	.type	_jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand, %function
	.type	jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand, %function
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
	movq	%rdi, %mm1
	movq	%rsi, %mm2
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
	leaq	2184(%rsp), %rcx
	leaq	616(%rsp), %r10
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
	leaq	-224(%rsp), %rsp
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$381:
	leaq	224(%rsp), %rsp
	leaq	184(%rsp), %rax
	leaq	120(%rsp), %r10
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$380:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %r10
	leaq	120(%rsp), %rax
	leaq	216(%rsp), %r11
	movq	%rcx, %mm0
	movq	%r10, %rbx
	leaq	5800(%rsp), %rcx
	movq	%rbx, %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$379:
	leaq	6312(%rsp), %rcx
	leaq	384(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$378:
	leaq	6824(%rsp), %rcx
	leaq	768(%rbx), %rdx
	call	L_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$377:
	leaq	7336(%rsp), %rcx
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
	leaq	3752(%rsp), %rcx
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$375:
	movq	%r11, %mm3
	movq	$1, %rax
	movq	%rax, %mm4
	movb	16(%rsp), %dl
	movb	%dl, 80(%rsp)
	movb	17(%rsp), %dl
	movb	%dl, 81(%rsp)
	movb	18(%rsp), %dl
	movb	%dl, 82(%rsp)
	movb	19(%rsp), %dl
	movb	%dl, 83(%rsp)
	movb	20(%rsp), %dl
	movb	%dl, 84(%rsp)
	movb	21(%rsp), %dl
	movb	%dl, 85(%rsp)
	movb	22(%rsp), %dl
	movb	%dl, 86(%rsp)
	movb	23(%rsp), %dl
	movb	%dl, 87(%rsp)
	movb	24(%rsp), %dl
	movb	%dl, 88(%rsp)
	movb	25(%rsp), %dl
	movb	%dl, 89(%rsp)
	movb	26(%rsp), %dl
	movb	%dl, 90(%rsp)
	movb	27(%rsp), %dl
	movb	%dl, 91(%rsp)
	movb	28(%rsp), %dl
	movb	%dl, 92(%rsp)
	movb	29(%rsp), %dl
	movb	%dl, 93(%rsp)
	movb	30(%rsp), %dl
	movb	%dl, 94(%rsp)
	movb	31(%rsp), %dl
	movb	%dl, 95(%rsp)
	movb	32(%rsp), %dl
	movb	%dl, 96(%rsp)
	movb	33(%rsp), %dl
	movb	%dl, 97(%rsp)
	movb	34(%rsp), %dl
	movb	%dl, 98(%rsp)
	movb	35(%rsp), %dl
	movb	%dl, 99(%rsp)
	movb	36(%rsp), %dl
	movb	%dl, 100(%rsp)
	movb	37(%rsp), %dl
	movb	%dl, 101(%rsp)
	movb	38(%rsp), %dl
	movb	%dl, 102(%rsp)
	movb	39(%rsp), %dl
	movb	%dl, 103(%rsp)
	movb	40(%rsp), %dl
	movb	%dl, 104(%rsp)
	movb	41(%rsp), %dl
	movb	%dl, 105(%rsp)
	movb	42(%rsp), %dl
	movb	%dl, 106(%rsp)
	movb	43(%rsp), %dl
	movb	%dl, 107(%rsp)
	movb	44(%rsp), %dl
	movb	%dl, 108(%rsp)
	movb	45(%rsp), %dl
	movb	%dl, 109(%rsp)
	movb	46(%rsp), %dl
	movb	%dl, 110(%rsp)
	movb	47(%rsp), %dl
	movb	%dl, 111(%rsp)
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$372:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$359
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$360:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$371:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$369
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$370
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$369:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	13992(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$357
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$358:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$357:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$354:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$341
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$342:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$353:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$351
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$351:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	14504(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$339
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$340:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$339:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$336:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$323
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$324:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$335:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$333
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$333:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	15016(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$321
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$322:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$321:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$318:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$305
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$306:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$317:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$315
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$315:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	15528(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$303
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$304:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$303:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$300:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$287
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$288:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$299:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$297
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$297:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	16040(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$285
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$286:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$285:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$282:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$269
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$270:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$281:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$279
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$279:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	16552(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$267
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$268:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$267:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$264:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$251
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$252:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$263:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$261
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$262
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$261:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	17064(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$249
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$250:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$249:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$246:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$233
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$234:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$245:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$243
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$244
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$243:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	17576(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$231
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$232:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$231:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$228:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$215
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$216:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$227:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$225
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$226
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$225:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	18088(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$213
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$214:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$213:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$210:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$197
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$198:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$209:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$207
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$208
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$207:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	18600(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$195
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$196:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$195:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$192:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$179
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$180:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$191:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$189
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$190
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$189:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	19112(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$177
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$178:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$177:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$174:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$161
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$162:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$173:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$171
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$172
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$171:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	19624(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$159
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$160:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$159:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$156:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$143
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$144:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$155:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$153
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$154
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$153:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	20136(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$141
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$142:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$141:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$138:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$125
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$126:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$137:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$135
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$136
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$135:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	20648(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$123
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$124:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$123:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$120:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$107
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$108:
	movq	%rcx, %mm5
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$119:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$117
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$118
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$117:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	21160(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$105
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$106:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$105:
	cmpq	$256, %rdx
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
	leaq	416(%rsp), %r15
	leaq	80(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$102:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$89
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$90:
	movq	%rcx, %mm4
	leaq	416(%rsp), %r15
	leaq	248(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$101:
	leaq	8(%rsp), %rsp
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$99
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$100
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$99:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 4264(%rsp,%rcx,2)
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
	movw	%di, 4264(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	21672(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$87
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$88:
	movw	4264(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$87:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$88
	movq	%mm3, %rcx
	movb	$0, %al
	leaq	7848(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$86:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	8360(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$85:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	8872(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$84:
	leaq	176(%rsp), %rsp
	movb	$3, %al
	leaq	9384(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$83:
	leaq	176(%rsp), %rsp
	movq	%mm3, %rcx
	movb	$4, %al
	leaq	9896(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$82:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	10408(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$81:
	leaq	176(%rsp), %rsp
	movb	$6, %al
	leaq	10920(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$80:
	leaq	176(%rsp), %rsp
	movb	$7, %al
	leaq	11432(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$79:
	leaq	176(%rsp), %rsp
	movb	$8, %al
	leaq	4264(%rsp), %rsi
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$78:
	leaq	176(%rsp), %rsp
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
	leaq	13992(%rsp), %rdx
	leaq	7848(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$73:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rsi
	leaq	14504(%rsp), %rdx
	leaq	8360(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$72:
	leaq	16(%rsp), %rsp
	leaq	11944(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$71:
	leaq	4776(%rsp), %rsi
	leaq	15016(%rsp), %rdx
	leaq	8872(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$70:
	leaq	16(%rsp), %rsp
	leaq	11944(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$69:
	leaq	4776(%rsp), %rsi
	leaq	15528(%rsp), %rdx
	leaq	9384(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$68:
	leaq	16(%rsp), %rsp
	leaq	11944(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$67:
	leaq	11944(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$65
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$66:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$65:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$66
	leaq	12456(%rsp), %rsi
	leaq	16040(%rsp), %rdx
	leaq	7848(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$64:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rsi
	leaq	16552(%rsp), %rdx
	leaq	8360(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$63:
	leaq	16(%rsp), %rsp
	leaq	12456(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$62:
	leaq	4776(%rsp), %rsi
	leaq	17064(%rsp), %rdx
	leaq	8872(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$61:
	leaq	16(%rsp), %rsp
	leaq	12456(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$60:
	leaq	4776(%rsp), %rsi
	leaq	17576(%rsp), %rdx
	leaq	9384(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$59:
	leaq	16(%rsp), %rsp
	leaq	12456(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$58:
	leaq	12456(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$56
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$57:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$56:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$57
	leaq	12968(%rsp), %rsi
	leaq	18088(%rsp), %rdx
	leaq	7848(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$55:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rsi
	leaq	18600(%rsp), %rdx
	leaq	8360(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$54:
	leaq	16(%rsp), %rsp
	leaq	12968(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$53:
	leaq	4776(%rsp), %rsi
	leaq	19112(%rsp), %rdx
	leaq	8872(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$52:
	leaq	16(%rsp), %rsp
	leaq	12968(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$51:
	leaq	4776(%rsp), %rsi
	leaq	19624(%rsp), %rdx
	leaq	9384(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$50:
	leaq	16(%rsp), %rsp
	leaq	12968(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$49:
	leaq	12968(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$47
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$48:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$47:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$48
	leaq	13480(%rsp), %rsi
	leaq	20136(%rsp), %rdx
	leaq	7848(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$46:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rsi
	leaq	20648(%rsp), %rdx
	leaq	8360(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$45:
	leaq	16(%rsp), %rsp
	leaq	13480(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$44:
	leaq	4776(%rsp), %rsi
	leaq	21160(%rsp), %rdx
	leaq	8872(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$43:
	leaq	16(%rsp), %rsp
	leaq	13480(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$42:
	leaq	4776(%rsp), %rsi
	leaq	21672(%rsp), %rdx
	leaq	9384(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$41:
	leaq	16(%rsp), %rsp
	leaq	13480(%rsp), %rcx
	leaq	4776(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$40:
	leaq	13480(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$38
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$39:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$38:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$39
	leaq	4776(%rsp), %rsi
	leaq	5800(%rsp), %rdx
	leaq	7848(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$37:
	leaq	16(%rsp), %rsp
	leaq	5288(%rsp), %rsi
	leaq	6312(%rsp), %rdx
	leaq	8360(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$36:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rcx
	leaq	5288(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$35:
	leaq	5288(%rsp), %rsi
	leaq	6824(%rsp), %rdx
	leaq	8872(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$34:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rcx
	leaq	5288(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$33:
	leaq	5288(%rsp), %rsi
	leaq	7336(%rsp), %rdx
	leaq	9384(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$32:
	leaq	16(%rsp), %rsp
	leaq	4776(%rsp), %rcx
	leaq	5288(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$31:
	leaq	4776(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$29
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$30:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$29:
	cmpq	$256, %r8
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
	leaq	9896(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$23:
	leaq	12456(%rsp), %rcx
	leaq	10408(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$22:
	leaq	12968(%rsp), %rcx
	leaq	10920(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$21:
	leaq	13480(%rsp), %rcx
	leaq	11432(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$20:
	leaq	4776(%rsp), %rcx
	leaq	4264(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$19:
	leaq	4776(%rsp), %rcx
	leaq	3752(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$18:
	leaq	11944(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$16
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$17:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$16:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$17
	leaq	12456(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$14
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$15:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$14:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$15
	leaq	12968(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$12
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$13:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$12:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$13
	leaq	13480(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$10
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$11:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$10:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$11
	leaq	4776(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$9:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$8:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$9
	movq	%mm0, %rax
	movq	%rax, %rsi
	movq	$0, %rdi
	movq	$0, %r8
	leaq	11944(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$7:
	leaq	12456(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$6:
	leaq	12968(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$5:
	leaq	13480(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$4:
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$2
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$3:
	movzwq	11944(%rsp,%rdi,2), %r9
	shlq	$11, %r9
	addq	$1664, %r9
	imulq	$645084, %r9, %r9
	shrq	$31, %r9
	andq	$2047, %r9
	movw	%r9w, %cx
	movzwq	11946(%rsp,%rdi,2), %r9
	shlq	$11, %r9
	addq	$1664, %r9
	imulq	$645084, %r9, %r9
	shrq	$31, %r9
	andq	$2047, %r9
	movw	%r9w, %dx
	movzwq	11948(%rsp,%rdi,2), %r9
	shlq	$11, %r9
	addq	$1664, %r9
	imulq	$645084, %r9, %r9
	shrq	$31, %r9
	andq	$2047, %r9
	movzwq	11950(%rsp,%rdi,2), %r10
	shlq	$11, %r10
	addq	$1664, %r10
	imulq	$645084, %r10, %r10
	shrq	$31, %r10
	andq	$2047, %r10
	movzwq	11952(%rsp,%rdi,2), %r11
	shlq	$11, %r11
	addq	$1664, %r11
	imulq	$645084, %r11, %r11
	shrq	$31, %r11
	andq	$2047, %r11
	movzwq	11954(%rsp,%rdi,2), %rbx
	shlq	$11, %rbx
	addq	$1664, %rbx
	imulq	$645084, %rbx, %rbx
	shrq	$31, %rbx
	andq	$2047, %rbx
	movzwq	11956(%rsp,%rdi,2), %rbp
	shlq	$11, %rbp
	addq	$1664, %rbp
	imulq	$645084, %rbp, %rbp
	shrq	$31, %rbp
	andq	$2047, %rbp
	movzwq	11958(%rsp,%rdi,2), %r12
	shlq	$11, %r12
	addq	$1664, %r12
	imulq	$645084, %r12, %r12
	shrq	$31, %r12
	andq	$2047, %r12
	movw	%cx, %r13w
	movb	%r13b, (%rsi,%r8)
	incq	%r8
	shrw	$8, %cx
	movw	%dx, %r13w
	shlw	$3, %r13w
	orw 	%cx, %r13w
	movb	%r13b, (%rsi,%r8)
	incq	%r8
	shrw	$5, %dx
	movw	%r9w, %r13w
	shlw	$6, %r13w
	orw 	%dx, %r13w
	movb	%r13b, (%rsi,%r8)
	incq	%r8
	movw	%r9w, %cx
	shrw	$2, %cx
	movb	%cl, (%rsi,%r8)
	incq	%r8
	shrw	$10, %r9w
	movw	%r10w, %dx
	shlw	$1, %dx
	orw 	%r9w, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	shrw	$7, %r10w
	movw	%r11w, %dx
	shlw	$4, %dx
	orw 	%r10w, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	shrw	$4, %r11w
	movw	%bx, %dx
	shlw	$7, %dx
	orw 	%r11w, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	movw	%bx, %cx
	shrw	$1, %cx
	movb	%cl, (%rsi,%r8)
	incq	%r8
	shrw	$9, %bx
	movw	%bp, %dx
	shlw	$2, %dx
	orw 	%bx, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	shrw	$6, %bp
	movw	%r12w, %dx
	shlw	$5, %dx
	orw 	%bp, %dx
	movb	%dl, (%rsi,%r8)
	incq	%r8
	shrw	$3, %r12w
	movb	%r12b, (%rsi,%r8)
	incq	%r8
	addq	$8, %rdi
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$2:
	cmpq	$1024, %rdi
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$3
	leaq	1408(%rax), %rax
	leaq	4776(%rsp), %rcx
	call	L_i_poly_compress$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_enc_derand$1:
	movq	8(%rsp), %rcx
	movq	184(%rsp), %rax
	movq	%rax, (%rcx)
	movq	192(%rsp), %rax
	movq	%rax, 8(%rcx)
	movq	200(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	208(%rsp), %rax
	movq	%rax, 24(%rcx)
	movq	%mm1, %rsi
	movq	%mm2, %rdi
	movq	2184(%rsp), %rax
	movq	%rax, (%rsi)
	movq	2192(%rsp), %rax
	movq	%rax, 8(%rsi)
	movq	2200(%rsp), %rax
	movq	%rax, 16(%rsi)
	movq	2208(%rsp), %rax
	movq	%rax, 24(%rsi)
	movq	2216(%rsp), %rax
	movq	%rax, 32(%rsi)
	movq	2224(%rsp), %rax
	movq	%rax, 40(%rsi)
	movq	2232(%rsp), %rax
	movq	%rax, 48(%rsi)
	movq	2240(%rsp), %rax
	movq	%rax, 56(%rsi)
	movq	2248(%rsp), %rax
	movq	%rax, 64(%rsi)
	movq	2256(%rsp), %rax
	movq	%rax, 72(%rsi)
	movq	2264(%rsp), %rax
	movq	%rax, 80(%rsi)
	movq	2272(%rsp), %rax
	movq	%rax, 88(%rsi)
	movq	2280(%rsp), %rax
	movq	%rax, 96(%rsi)
	movq	2288(%rsp), %rax
	movq	%rax, 104(%rsi)
	movq	2296(%rsp), %rax
	movq	%rax, 112(%rsi)
	movq	2304(%rsp), %rax
	movq	%rax, 120(%rsi)
	movq	2312(%rsp), %rax
	movq	%rax, 128(%rsi)
	movq	2320(%rsp), %rax
	movq	%rax, 136(%rsi)
	movq	2328(%rsp), %rax
	movq	%rax, 144(%rsi)
	movq	2336(%rsp), %rax
	movq	%rax, 152(%rsi)
	movq	2344(%rsp), %rax
	movq	%rax, 160(%rsi)
	movq	2352(%rsp), %rax
	movq	%rax, 168(%rsi)
	movq	2360(%rsp), %rax
	movq	%rax, 176(%rsi)
	movq	2368(%rsp), %rax
	movq	%rax, 184(%rsi)
	movq	2376(%rsp), %rax
	movq	%rax, 192(%rsi)
	movq	2384(%rsp), %rax
	movq	%rax, 200(%rsi)
	movq	2392(%rsp), %rax
	movq	%rax, 208(%rsi)
	movq	2400(%rsp), %rax
	movq	%rax, 216(%rsi)
	movq	2408(%rsp), %rax
	movq	%rax, 224(%rsi)
	movq	2416(%rsp), %rax
	movq	%rax, 232(%rsi)
	movq	2424(%rsp), %rax
	movq	%rax, 240(%rsi)
	movq	2432(%rsp), %rax
	movq	%rax, 248(%rsi)
	movq	2440(%rsp), %rax
	movq	%rax, 256(%rsi)
	movq	2448(%rsp), %rax
	movq	%rax, 264(%rsi)
	movq	2456(%rsp), %rax
	movq	%rax, 272(%rsi)
	movq	2464(%rsp), %rax
	movq	%rax, 280(%rsi)
	movq	2472(%rsp), %rax
	movq	%rax, 288(%rsi)
	movq	2480(%rsp), %rax
	movq	%rax, 296(%rsi)
	movq	2488(%rsp), %rax
	movq	%rax, 304(%rsi)
	movq	2496(%rsp), %rax
	movq	%rax, 312(%rsi)
	movq	2504(%rsp), %rax
	movq	%rax, 320(%rsi)
	movq	2512(%rsp), %rax
	movq	%rax, 328(%rsi)
	movq	2520(%rsp), %rax
	movq	%rax, 336(%rsi)
	movq	2528(%rsp), %rax
	movq	%rax, 344(%rsi)
	movq	2536(%rsp), %rax
	movq	%rax, 352(%rsi)
	movq	2544(%rsp), %rax
	movq	%rax, 360(%rsi)
	movq	2552(%rsp), %rax
	movq	%rax, 368(%rsi)
	movq	2560(%rsp), %rax
	movq	%rax, 376(%rsi)
	movq	2568(%rsp), %rax
	movq	%rax, 384(%rsi)
	movq	2576(%rsp), %rax
	movq	%rax, 392(%rsi)
	movq	2584(%rsp), %rax
	movq	%rax, 400(%rsi)
	movq	2592(%rsp), %rax
	movq	%rax, 408(%rsi)
	movq	2600(%rsp), %rax
	movq	%rax, 416(%rsi)
	movq	2608(%rsp), %rax
	movq	%rax, 424(%rsi)
	movq	2616(%rsp), %rax
	movq	%rax, 432(%rsi)
	movq	2624(%rsp), %rax
	movq	%rax, 440(%rsi)
	movq	2632(%rsp), %rax
	movq	%rax, 448(%rsi)
	movq	2640(%rsp), %rax
	movq	%rax, 456(%rsi)
	movq	2648(%rsp), %rax
	movq	%rax, 464(%rsi)
	movq	2656(%rsp), %rax
	movq	%rax, 472(%rsi)
	movq	2664(%rsp), %rax
	movq	%rax, 480(%rsi)
	movq	2672(%rsp), %rax
	movq	%rax, 488(%rsi)
	movq	2680(%rsp), %rax
	movq	%rax, 496(%rsi)
	movq	2688(%rsp), %rax
	movq	%rax, 504(%rsi)
	movq	2696(%rsp), %rax
	movq	%rax, 512(%rsi)
	movq	2704(%rsp), %rax
	movq	%rax, 520(%rsi)
	movq	2712(%rsp), %rax
	movq	%rax, 528(%rsi)
	movq	2720(%rsp), %rax
	movq	%rax, 536(%rsi)
	movq	2728(%rsp), %rax
	movq	%rax, 544(%rsi)
	movq	2736(%rsp), %rax
	movq	%rax, 552(%rsi)
	movq	2744(%rsp), %rax
	movq	%rax, 560(%rsi)
	movq	2752(%rsp), %rax
	movq	%rax, 568(%rsi)
	movq	2760(%rsp), %rax
	movq	%rax, 576(%rsi)
	movq	2768(%rsp), %rax
	movq	%rax, 584(%rsi)
	movq	2776(%rsp), %rax
	movq	%rax, 592(%rsi)
	movq	2784(%rsp), %rax
	movq	%rax, 600(%rsi)
	movq	2792(%rsp), %rax
	movq	%rax, 608(%rsi)
	movq	2800(%rsp), %rax
	movq	%rax, 616(%rsi)
	movq	2808(%rsp), %rax
	movq	%rax, 624(%rsi)
	movq	2816(%rsp), %rax
	movq	%rax, 632(%rsi)
	movq	2824(%rsp), %rax
	movq	%rax, 640(%rsi)
	movq	2832(%rsp), %rax
	movq	%rax, 648(%rsi)
	movq	2840(%rsp), %rax
	movq	%rax, 656(%rsi)
	movq	2848(%rsp), %rax
	movq	%rax, 664(%rsi)
	movq	2856(%rsp), %rax
	movq	%rax, 672(%rsi)
	movq	2864(%rsp), %rax
	movq	%rax, 680(%rsi)
	movq	2872(%rsp), %rax
	movq	%rax, 688(%rsi)
	movq	2880(%rsp), %rax
	movq	%rax, 696(%rsi)
	movq	2888(%rsp), %rax
	movq	%rax, 704(%rsi)
	movq	2896(%rsp), %rax
	movq	%rax, 712(%rsi)
	movq	2904(%rsp), %rax
	movq	%rax, 720(%rsi)
	movq	2912(%rsp), %rax
	movq	%rax, 728(%rsi)
	movq	2920(%rsp), %rax
	movq	%rax, 736(%rsi)
	movq	2928(%rsp), %rax
	movq	%rax, 744(%rsi)
	movq	2936(%rsp), %rax
	movq	%rax, 752(%rsi)
	movq	2944(%rsp), %rax
	movq	%rax, 760(%rsi)
	movq	2952(%rsp), %rax
	movq	%rax, 768(%rsi)
	movq	2960(%rsp), %rax
	movq	%rax, 776(%rsi)
	movq	2968(%rsp), %rax
	movq	%rax, 784(%rsi)
	movq	2976(%rsp), %rax
	movq	%rax, 792(%rsi)
	movq	2984(%rsp), %rax
	movq	%rax, 800(%rsi)
	movq	2992(%rsp), %rax
	movq	%rax, 808(%rsi)
	movq	3000(%rsp), %rax
	movq	%rax, 816(%rsi)
	movq	3008(%rsp), %rax
	movq	%rax, 824(%rsi)
	movq	3016(%rsp), %rax
	movq	%rax, 832(%rsi)
	movq	3024(%rsp), %rax
	movq	%rax, 840(%rsi)
	movq	3032(%rsp), %rax
	movq	%rax, 848(%rsi)
	movq	3040(%rsp), %rax
	movq	%rax, 856(%rsi)
	movq	3048(%rsp), %rax
	movq	%rax, 864(%rsi)
	movq	3056(%rsp), %rax
	movq	%rax, 872(%rsi)
	movq	3064(%rsp), %rax
	movq	%rax, 880(%rsi)
	movq	3072(%rsp), %rax
	movq	%rax, 888(%rsi)
	movq	3080(%rsp), %rax
	movq	%rax, 896(%rsi)
	movq	3088(%rsp), %rax
	movq	%rax, 904(%rsi)
	movq	3096(%rsp), %rax
	movq	%rax, 912(%rsi)
	movq	3104(%rsp), %rax
	movq	%rax, 920(%rsi)
	movq	3112(%rsp), %rax
	movq	%rax, 928(%rsi)
	movq	3120(%rsp), %rax
	movq	%rax, 936(%rsi)
	movq	3128(%rsp), %rax
	movq	%rax, 944(%rsi)
	movq	3136(%rsp), %rax
	movq	%rax, 952(%rsi)
	movq	3144(%rsp), %rax
	movq	%rax, 960(%rsi)
	movq	3152(%rsp), %rax
	movq	%rax, 968(%rsi)
	movq	3160(%rsp), %rax
	movq	%rax, 976(%rsi)
	movq	3168(%rsp), %rax
	movq	%rax, 984(%rsi)
	movq	3176(%rsp), %rax
	movq	%rax, 992(%rsi)
	movq	3184(%rsp), %rax
	movq	%rax, 1000(%rsi)
	movq	3192(%rsp), %rax
	movq	%rax, 1008(%rsi)
	movq	3200(%rsp), %rax
	movq	%rax, 1016(%rsi)
	movq	3208(%rsp), %rax
	movq	%rax, 1024(%rsi)
	movq	3216(%rsp), %rax
	movq	%rax, 1032(%rsi)
	movq	3224(%rsp), %rax
	movq	%rax, 1040(%rsi)
	movq	3232(%rsp), %rax
	movq	%rax, 1048(%rsi)
	movq	3240(%rsp), %rax
	movq	%rax, 1056(%rsi)
	movq	3248(%rsp), %rax
	movq	%rax, 1064(%rsi)
	movq	3256(%rsp), %rax
	movq	%rax, 1072(%rsi)
	movq	3264(%rsp), %rax
	movq	%rax, 1080(%rsi)
	movq	3272(%rsp), %rax
	movq	%rax, 1088(%rsi)
	movq	3280(%rsp), %rax
	movq	%rax, 1096(%rsi)
	movq	3288(%rsp), %rax
	movq	%rax, 1104(%rsi)
	movq	3296(%rsp), %rax
	movq	%rax, 1112(%rsi)
	movq	3304(%rsp), %rax
	movq	%rax, 1120(%rsi)
	movq	3312(%rsp), %rax
	movq	%rax, 1128(%rsi)
	movq	3320(%rsp), %rax
	movq	%rax, 1136(%rsi)
	movq	3328(%rsp), %rax
	movq	%rax, 1144(%rsi)
	movq	3336(%rsp), %rax
	movq	%rax, 1152(%rsi)
	movq	3344(%rsp), %rax
	movq	%rax, 1160(%rsi)
	movq	3352(%rsp), %rax
	movq	%rax, 1168(%rsi)
	movq	3360(%rsp), %rax
	movq	%rax, 1176(%rsi)
	movq	3368(%rsp), %rax
	movq	%rax, 1184(%rsi)
	movq	3376(%rsp), %rax
	movq	%rax, 1192(%rsi)
	movq	3384(%rsp), %rax
	movq	%rax, 1200(%rsi)
	movq	3392(%rsp), %rax
	movq	%rax, 1208(%rsi)
	movq	3400(%rsp), %rax
	movq	%rax, 1216(%rsi)
	movq	3408(%rsp), %rax
	movq	%rax, 1224(%rsi)
	movq	3416(%rsp), %rax
	movq	%rax, 1232(%rsi)
	movq	3424(%rsp), %rax
	movq	%rax, 1240(%rsi)
	movq	3432(%rsp), %rax
	movq	%rax, 1248(%rsi)
	movq	3440(%rsp), %rax
	movq	%rax, 1256(%rsi)
	movq	3448(%rsp), %rax
	movq	%rax, 1264(%rsi)
	movq	3456(%rsp), %rax
	movq	%rax, 1272(%rsi)
	movq	3464(%rsp), %rax
	movq	%rax, 1280(%rsi)
	movq	3472(%rsp), %rax
	movq	%rax, 1288(%rsi)
	movq	3480(%rsp), %rax
	movq	%rax, 1296(%rsi)
	movq	3488(%rsp), %rax
	movq	%rax, 1304(%rsi)
	movq	3496(%rsp), %rax
	movq	%rax, 1312(%rsi)
	movq	3504(%rsp), %rax
	movq	%rax, 1320(%rsi)
	movq	3512(%rsp), %rax
	movq	%rax, 1328(%rsi)
	movq	3520(%rsp), %rax
	movq	%rax, 1336(%rsi)
	movq	3528(%rsp), %rax
	movq	%rax, 1344(%rsi)
	movq	3536(%rsp), %rax
	movq	%rax, 1352(%rsi)
	movq	3544(%rsp), %rax
	movq	%rax, 1360(%rsi)
	movq	3552(%rsp), %rax
	movq	%rax, 1368(%rsi)
	movq	3560(%rsp), %rax
	movq	%rax, 1376(%rsi)
	movq	3568(%rsp), %rax
	movq	%rax, 1384(%rsi)
	movq	3576(%rsp), %rax
	movq	%rax, 1392(%rsi)
	movq	3584(%rsp), %rax
	movq	%rax, 1400(%rsi)
	movq	3592(%rsp), %rax
	movq	%rax, 1408(%rsi)
	movq	3600(%rsp), %rax
	movq	%rax, 1416(%rsi)
	movq	3608(%rsp), %rax
	movq	%rax, 1424(%rsi)
	movq	3616(%rsp), %rax
	movq	%rax, 1432(%rsi)
	movq	3624(%rsp), %rax
	movq	%rax, 1440(%rsi)
	movq	3632(%rsp), %rax
	movq	%rax, 1448(%rsi)
	movq	3640(%rsp), %rax
	movq	%rax, 1456(%rsi)
	movq	3648(%rsp), %rax
	movq	%rax, 1464(%rsi)
	movq	3656(%rsp), %rax
	movq	%rax, 1472(%rsi)
	movq	3664(%rsp), %rax
	movq	%rax, 1480(%rsi)
	movq	3672(%rsp), %rax
	movq	%rax, 1488(%rsi)
	movq	3680(%rsp), %rax
	movq	%rax, 1496(%rsi)
	movq	3688(%rsp), %rax
	movq	%rax, 1504(%rsi)
	movq	3696(%rsp), %rax
	movq	%rax, 1512(%rsi)
	movq	3704(%rsp), %rax
	movq	%rax, 1520(%rsi)
	movq	3712(%rsp), %rax
	movq	%rax, 1528(%rsi)
	movq	3720(%rsp), %rax
	movq	%rax, 1536(%rsi)
	movq	3728(%rsp), %rax
	movq	%rax, 1544(%rsi)
	movq	3736(%rsp), %rax
	movq	%rax, 1552(%rsi)
	movq	3744(%rsp), %rax
	movq	%rax, 1560(%rsi)
	movq	48(%rsp), %rax
	movq	%rax, (%rdi)
	movq	56(%rsp), %rax
	movq	%rax, 8(%rdi)
	movq	64(%rsp), %rax
	movq	%rax, 16(%rdi)
	movq	72(%rsp), %rax
	movq	%rax, 24(%rdi)
	xorl	%eax, %eax
	movq	22184(%rsp), %rbx
	movq	22192(%rsp), %rbp
	movq	22200(%rsp), %r12
	movq	22208(%rsp), %r13
	movq	22216(%rsp), %r14
	movq	22224(%rsp), %r15
	movq	22232(%rsp), %rsp
	ret
	.type	_jade_kem_mlkem_mlkem1024_amd64_ref_keypair, %function
	.type	jade_kem_mlkem_mlkem1024_amd64_ref_keypair, %function
_jade_kem_mlkem_mlkem1024_amd64_ref_keypair:
jade_kem_mlkem_mlkem1024_amd64_ref_keypair:
	movq	%rsp, %rax
	leaq	-20304(%rsp), %rsp
	andq	$-16, %rsp
	movq	%rbx, 20248(%rsp)
	movq	%rbp, 20256(%rsp)
	movq	%r12, 20264(%rsp)
	movq	%r13, 20272(%rsp)
	movq	%r14, 20280(%rsp)
	movq	%r15, 20288(%rsp)
	movq	%rax, 20296(%rsp)
	movq	%rdi, %r12
	movq	%rsi, %rbx
	leaq	168(%rsp), %rdi
	movq	$64, %rsi
	call	__jasmin_syscall_randombytes__
	leaq	168(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	%r12, %mm1
	movq	%rbx, %mm2
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
	leaq	2232(%rsp), %rax
	leaq	232(%rsp), %rdx
	movq	%rdx, %mm3
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
	movb	$4, 120(%rsp)
	leaq	168(%rsp), %rax
	leaq	88(%rsp), %r10
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$366:
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
	movq	%rax, %mm4
	movb	56(%rsp), %dl
	movb	%dl, 128(%rsp)
	movb	57(%rsp), %dl
	movb	%dl, 129(%rsp)
	movb	58(%rsp), %dl
	movb	%dl, 130(%rsp)
	movb	59(%rsp), %dl
	movb	%dl, 131(%rsp)
	movb	60(%rsp), %dl
	movb	%dl, 132(%rsp)
	movb	61(%rsp), %dl
	movb	%dl, 133(%rsp)
	movb	62(%rsp), %dl
	movb	%dl, 134(%rsp)
	movb	63(%rsp), %dl
	movb	%dl, 135(%rsp)
	movb	64(%rsp), %dl
	movb	%dl, 136(%rsp)
	movb	65(%rsp), %dl
	movb	%dl, 137(%rsp)
	movb	66(%rsp), %dl
	movb	%dl, 138(%rsp)
	movb	67(%rsp), %dl
	movb	%dl, 139(%rsp)
	movb	68(%rsp), %dl
	movb	%dl, 140(%rsp)
	movb	69(%rsp), %dl
	movb	%dl, 141(%rsp)
	movb	70(%rsp), %dl
	movb	%dl, 142(%rsp)
	movb	71(%rsp), %dl
	movb	%dl, 143(%rsp)
	movb	72(%rsp), %dl
	movb	%dl, 144(%rsp)
	movb	73(%rsp), %dl
	movb	%dl, 145(%rsp)
	movb	74(%rsp), %dl
	movb	%dl, 146(%rsp)
	movb	75(%rsp), %dl
	movb	%dl, 147(%rsp)
	movb	76(%rsp), %dl
	movb	%dl, 148(%rsp)
	movb	77(%rsp), %dl
	movb	%dl, 149(%rsp)
	movb	78(%rsp), %dl
	movb	%dl, 150(%rsp)
	movb	79(%rsp), %dl
	movb	%dl, 151(%rsp)
	movb	80(%rsp), %dl
	movb	%dl, 152(%rsp)
	movb	81(%rsp), %dl
	movb	%dl, 153(%rsp)
	movb	82(%rsp), %dl
	movb	%dl, 154(%rsp)
	movb	83(%rsp), %dl
	movb	%dl, 155(%rsp)
	movb	84(%rsp), %dl
	movb	%dl, 156(%rsp)
	movb	85(%rsp), %dl
	movb	%dl, 157(%rsp)
	movb	86(%rsp), %dl
	movb	%dl, 158(%rsp)
	movb	87(%rsp), %dl
	movb	%dl, 159(%rsp)
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$364
	movb	$0, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$365
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$364:
	movb	$0, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$365:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$363:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$350
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$351:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$362:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$353:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$354
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$352
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$354:
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$360
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$361
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$360:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	12056(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$348
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$349:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$348:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$349
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$346
	movb	$0, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$347
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$346:
	movb	$1, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$347:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$345:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$332
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$333:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$344:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$335:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$336
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$334
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$336:
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$342
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$343
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$342:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	12568(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$330
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$331:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$330:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$331
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$328
	movb	$0, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$329
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$328:
	movb	$2, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$329:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$327:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$314
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$315:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$326:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$317:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$318
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$316
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$318:
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$324
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$325
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$324:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	13080(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$312
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$313:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$312:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$313
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$310
	movb	$0, 160(%rsp)
	movb	$3, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$311
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$310:
	movb	$3, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$311:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$309:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$296
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$297:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$308:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$299:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$300
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$298
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$300:
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$306
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$307
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$306:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	13592(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$294
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$295:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$294:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$295
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$292
	movb	$1, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$293
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$292:
	movb	$0, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$293:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$291:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$278
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$279:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$290:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$281:
	movq	$-1, %rsi
	cmovnb	%rsi, %rax
	cmpq	$256, %rcx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$282
	movq	$-1, %rdx
	cmovb	%rdx, %rax
	movq	$168, %rdx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$280
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$282:
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$288
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$289
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$288:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	14104(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$276
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$277:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$276:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$277
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$274
	movb	$1, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$275
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$274:
	movb	$1, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$275:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$273:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$260
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$261:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$272:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$270
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$271
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$270:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	14616(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$258
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$259:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$258:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$259
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$256
	movb	$1, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$257
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$256:
	movb	$2, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$257:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$255:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$242
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$243:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$254:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$252
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$253
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$252:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	15128(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$240
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$241:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$240:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$241
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$238
	movb	$1, 160(%rsp)
	movb	$3, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$239
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$238:
	movb	$3, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$239:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$237:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$224
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$225:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$236:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$234
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$235
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$234:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	15640(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$222
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$223:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$222:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$223
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$220
	movb	$2, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$221
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$220:
	movb	$0, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$221:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$219:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$206
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$207:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$218:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$216
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$217
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$216:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	16152(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$204
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$205:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$204:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$205
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$202
	movb	$2, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$203
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$202:
	movb	$1, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$203:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$201:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$188
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$189:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$200:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$198
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$199
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$198:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	16664(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$186
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$187:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$186:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$187
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$184
	movb	$2, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$185
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$184:
	movb	$2, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$185:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$183:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$170
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$171:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$182:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$180
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$181
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$180:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	17176(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$168
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$169:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$168:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$169
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$166
	movb	$2, 160(%rsp)
	movb	$3, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$167
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$166:
	movb	$3, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$167:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$165:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$152
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$153:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$164:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$162
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$163
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$162:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	17688(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$150
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$151:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$150:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$151
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$148
	movb	$3, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$149
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$148:
	movb	$0, 160(%rsp)
	movb	$3, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$149:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$147:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$134
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$135:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$146:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$144
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$145
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$144:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	18200(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$132
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$133:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$132:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$133
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$130
	movb	$3, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$131
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$130:
	movb	$1, 160(%rsp)
	movb	$3, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$131:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$129:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$116
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$117:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$128:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$126
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$127
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$126:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	18712(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$114
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$115:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$114:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$115
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$112
	movb	$3, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$113
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$112:
	movb	$2, 160(%rsp)
	movb	$3, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$113:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$111:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$98
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$99:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$110:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$108
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$109
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$108:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	19224(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$96
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$97:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$96:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$97
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$94
	movb	$3, 160(%rsp)
	movb	$3, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$95
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$94:
	movb	$3, 160(%rsp)
	movb	$3, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$95:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$93:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$80
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$81:
	movq	%rcx, %mm4
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$92:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$90
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$91
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$90:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	19736(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$78
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$79:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$78:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$79
	movb	$0, %al
	leaq	5912(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$77:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	6424(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$76:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	6936(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$75:
	leaq	176(%rsp), %rsp
	movb	$3, %al
	leaq	7448(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$74:
	leaq	176(%rsp), %rsp
	movb	$4, %al
	leaq	7960(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$73:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	8472(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$72:
	leaq	176(%rsp), %rsp
	movb	$6, %al
	leaq	8984(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$71:
	leaq	176(%rsp), %rsp
	movb	$7, %al
	leaq	9496(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$70:
	leaq	176(%rsp), %rsp
	leaq	5912(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$69:
	leaq	6424(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$68:
	leaq	6936(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$67:
	leaq	7448(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$66:
	leaq	7960(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$65:
	leaq	8472(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$64:
	leaq	8984(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$63:
	leaq	9496(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$62:
	leaq	10008(%rsp), %rsi
	leaq	12056(%rsp), %rdx
	leaq	5912(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$61:
	leaq	16(%rsp), %rsp
	leaq	5400(%rsp), %rsi
	leaq	12568(%rsp), %rdx
	leaq	6424(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$60:
	leaq	16(%rsp), %rsp
	leaq	10008(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$59:
	leaq	5400(%rsp), %rsi
	leaq	13080(%rsp), %rdx
	leaq	6936(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$58:
	leaq	16(%rsp), %rsp
	leaq	10008(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$57:
	leaq	5400(%rsp), %rsi
	leaq	13592(%rsp), %rdx
	leaq	7448(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$56:
	leaq	16(%rsp), %rsp
	leaq	10008(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$55:
	leaq	10008(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$53
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$54:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$53:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$54
	leaq	10008(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$52:
	leaq	10520(%rsp), %rsi
	leaq	14104(%rsp), %rdx
	leaq	5912(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$51:
	leaq	16(%rsp), %rsp
	leaq	5400(%rsp), %rsi
	leaq	14616(%rsp), %rdx
	leaq	6424(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$50:
	leaq	16(%rsp), %rsp
	leaq	10520(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$49:
	leaq	5400(%rsp), %rsi
	leaq	15128(%rsp), %rdx
	leaq	6936(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$48:
	leaq	16(%rsp), %rsp
	leaq	10520(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$47:
	leaq	5400(%rsp), %rsi
	leaq	15640(%rsp), %rdx
	leaq	7448(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$46:
	leaq	16(%rsp), %rsp
	leaq	10520(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$45:
	leaq	10520(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$43
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$44:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$43:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$44
	leaq	10520(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$42:
	leaq	11032(%rsp), %rsi
	leaq	16152(%rsp), %rdx
	leaq	5912(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$41:
	leaq	16(%rsp), %rsp
	leaq	5400(%rsp), %rsi
	leaq	16664(%rsp), %rdx
	leaq	6424(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$40:
	leaq	16(%rsp), %rsp
	leaq	11032(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$39:
	leaq	5400(%rsp), %rsi
	leaq	17176(%rsp), %rdx
	leaq	6936(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$38:
	leaq	16(%rsp), %rsp
	leaq	11032(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$37:
	leaq	5400(%rsp), %rsi
	leaq	17688(%rsp), %rdx
	leaq	7448(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$36:
	leaq	16(%rsp), %rsp
	leaq	11032(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$35:
	leaq	11032(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$33
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$34:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$33:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$34
	leaq	11032(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$32:
	leaq	11544(%rsp), %rsi
	leaq	18200(%rsp), %rdx
	leaq	5912(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$31:
	leaq	16(%rsp), %rsp
	leaq	5400(%rsp), %rsi
	leaq	18712(%rsp), %rdx
	leaq	6424(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$30:
	leaq	16(%rsp), %rsp
	leaq	11544(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$29:
	leaq	5400(%rsp), %rsi
	leaq	19224(%rsp), %rdx
	leaq	6936(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$28:
	leaq	16(%rsp), %rsp
	leaq	11544(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$27:
	leaq	5400(%rsp), %rsi
	leaq	19736(%rsp), %rdx
	leaq	7448(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$26:
	leaq	16(%rsp), %rsp
	leaq	11544(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$25:
	leaq	11544(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$23
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$24:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$23:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$24
	leaq	11544(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$22:
	leaq	10008(%rsp), %rcx
	leaq	7960(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$21:
	leaq	10520(%rsp), %rcx
	leaq	8472(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$20:
	leaq	11032(%rsp), %rcx
	leaq	8984(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$19:
	leaq	11544(%rsp), %rcx
	leaq	9496(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$18:
	leaq	10008(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$16
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$17:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$16:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$17
	leaq	10520(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$14
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$15:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$14:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$15
	leaq	11032(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$12
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$13:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$12:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$13
	leaq	11544(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$10
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$11:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$10:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$11
	movq	8(%rsp), %r10
	movq	16(%rsp), %rsi
	movq	%rsi, %rax
	leaq	5912(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$9:
	leaq	384(%rsi), %rax
	leaq	6424(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$8:
	leaq	768(%rsi), %rax
	leaq	6936(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$7:
	leaq	1152(%rsi), %rax
	leaq	7448(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$6:
	movq	%r10, %rsi
	movq	%rsi, %rax
	leaq	10008(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$5:
	leaq	384(%rsi), %rax
	leaq	10520(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$4:
	leaq	768(%rsi), %rax
	leaq	11032(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$3:
	leaq	1152(%rsi), %rax
	leaq	11544(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$2:
	movq	56(%rsp), %rax
	movq	%rax, 1536(%r10)
	movq	64(%rsp), %rax
	movq	%rax, 1544(%r10)
	movq	72(%rsp), %rax
	movq	%rax, 1552(%r10)
	movq	80(%rsp), %rax
	movq	%rax, 1560(%r10)
	movq	(%rsp), %rax
	movq	(%r10), %rcx
	movq	%rcx, 1536(%rax)
	movq	8(%r10), %rcx
	movq	%rcx, 1544(%rax)
	movq	16(%r10), %rcx
	movq	%rcx, 1552(%rax)
	movq	24(%r10), %rcx
	movq	%rcx, 1560(%rax)
	movq	32(%r10), %rcx
	movq	%rcx, 1568(%rax)
	movq	40(%r10), %rcx
	movq	%rcx, 1576(%rax)
	movq	48(%r10), %rcx
	movq	%rcx, 1584(%rax)
	movq	56(%r10), %rcx
	movq	%rcx, 1592(%rax)
	movq	64(%r10), %rcx
	movq	%rcx, 1600(%rax)
	movq	72(%r10), %rcx
	movq	%rcx, 1608(%rax)
	movq	80(%r10), %rcx
	movq	%rcx, 1616(%rax)
	movq	88(%r10), %rcx
	movq	%rcx, 1624(%rax)
	movq	96(%r10), %rcx
	movq	%rcx, 1632(%rax)
	movq	104(%r10), %rcx
	movq	%rcx, 1640(%rax)
	movq	112(%r10), %rcx
	movq	%rcx, 1648(%rax)
	movq	120(%r10), %rcx
	movq	%rcx, 1656(%rax)
	movq	128(%r10), %rcx
	movq	%rcx, 1664(%rax)
	movq	136(%r10), %rcx
	movq	%rcx, 1672(%rax)
	movq	144(%r10), %rcx
	movq	%rcx, 1680(%rax)
	movq	152(%r10), %rcx
	movq	%rcx, 1688(%rax)
	movq	160(%r10), %rcx
	movq	%rcx, 1696(%rax)
	movq	168(%r10), %rcx
	movq	%rcx, 1704(%rax)
	movq	176(%r10), %rcx
	movq	%rcx, 1712(%rax)
	movq	184(%r10), %rcx
	movq	%rcx, 1720(%rax)
	movq	192(%r10), %rcx
	movq	%rcx, 1728(%rax)
	movq	200(%r10), %rcx
	movq	%rcx, 1736(%rax)
	movq	208(%r10), %rcx
	movq	%rcx, 1744(%rax)
	movq	216(%r10), %rcx
	movq	%rcx, 1752(%rax)
	movq	224(%r10), %rcx
	movq	%rcx, 1760(%rax)
	movq	232(%r10), %rcx
	movq	%rcx, 1768(%rax)
	movq	240(%r10), %rcx
	movq	%rcx, 1776(%rax)
	movq	248(%r10), %rcx
	movq	%rcx, 1784(%rax)
	movq	256(%r10), %rcx
	movq	%rcx, 1792(%rax)
	movq	264(%r10), %rcx
	movq	%rcx, 1800(%rax)
	movq	272(%r10), %rcx
	movq	%rcx, 1808(%rax)
	movq	280(%r10), %rcx
	movq	%rcx, 1816(%rax)
	movq	288(%r10), %rcx
	movq	%rcx, 1824(%rax)
	movq	296(%r10), %rcx
	movq	%rcx, 1832(%rax)
	movq	304(%r10), %rcx
	movq	%rcx, 1840(%rax)
	movq	312(%r10), %rcx
	movq	%rcx, 1848(%rax)
	movq	320(%r10), %rcx
	movq	%rcx, 1856(%rax)
	movq	328(%r10), %rcx
	movq	%rcx, 1864(%rax)
	movq	336(%r10), %rcx
	movq	%rcx, 1872(%rax)
	movq	344(%r10), %rcx
	movq	%rcx, 1880(%rax)
	movq	352(%r10), %rcx
	movq	%rcx, 1888(%rax)
	movq	360(%r10), %rcx
	movq	%rcx, 1896(%rax)
	movq	368(%r10), %rcx
	movq	%rcx, 1904(%rax)
	movq	376(%r10), %rcx
	movq	%rcx, 1912(%rax)
	movq	384(%r10), %rcx
	movq	%rcx, 1920(%rax)
	movq	392(%r10), %rcx
	movq	%rcx, 1928(%rax)
	movq	400(%r10), %rcx
	movq	%rcx, 1936(%rax)
	movq	408(%r10), %rcx
	movq	%rcx, 1944(%rax)
	movq	416(%r10), %rcx
	movq	%rcx, 1952(%rax)
	movq	424(%r10), %rcx
	movq	%rcx, 1960(%rax)
	movq	432(%r10), %rcx
	movq	%rcx, 1968(%rax)
	movq	440(%r10), %rcx
	movq	%rcx, 1976(%rax)
	movq	448(%r10), %rcx
	movq	%rcx, 1984(%rax)
	movq	456(%r10), %rcx
	movq	%rcx, 1992(%rax)
	movq	464(%r10), %rcx
	movq	%rcx, 2000(%rax)
	movq	472(%r10), %rcx
	movq	%rcx, 2008(%rax)
	movq	480(%r10), %rcx
	movq	%rcx, 2016(%rax)
	movq	488(%r10), %rcx
	movq	%rcx, 2024(%rax)
	movq	496(%r10), %rcx
	movq	%rcx, 2032(%rax)
	movq	504(%r10), %rcx
	movq	%rcx, 2040(%rax)
	movq	512(%r10), %rcx
	movq	%rcx, 2048(%rax)
	movq	520(%r10), %rcx
	movq	%rcx, 2056(%rax)
	movq	528(%r10), %rcx
	movq	%rcx, 2064(%rax)
	movq	536(%r10), %rcx
	movq	%rcx, 2072(%rax)
	movq	544(%r10), %rcx
	movq	%rcx, 2080(%rax)
	movq	552(%r10), %rcx
	movq	%rcx, 2088(%rax)
	movq	560(%r10), %rcx
	movq	%rcx, 2096(%rax)
	movq	568(%r10), %rcx
	movq	%rcx, 2104(%rax)
	movq	576(%r10), %rcx
	movq	%rcx, 2112(%rax)
	movq	584(%r10), %rcx
	movq	%rcx, 2120(%rax)
	movq	592(%r10), %rcx
	movq	%rcx, 2128(%rax)
	movq	600(%r10), %rcx
	movq	%rcx, 2136(%rax)
	movq	608(%r10), %rcx
	movq	%rcx, 2144(%rax)
	movq	616(%r10), %rcx
	movq	%rcx, 2152(%rax)
	movq	624(%r10), %rcx
	movq	%rcx, 2160(%rax)
	movq	632(%r10), %rcx
	movq	%rcx, 2168(%rax)
	movq	640(%r10), %rcx
	movq	%rcx, 2176(%rax)
	movq	648(%r10), %rcx
	movq	%rcx, 2184(%rax)
	movq	656(%r10), %rcx
	movq	%rcx, 2192(%rax)
	movq	664(%r10), %rcx
	movq	%rcx, 2200(%rax)
	movq	672(%r10), %rcx
	movq	%rcx, 2208(%rax)
	movq	680(%r10), %rcx
	movq	%rcx, 2216(%rax)
	movq	688(%r10), %rcx
	movq	%rcx, 2224(%rax)
	movq	696(%r10), %rcx
	movq	%rcx, 2232(%rax)
	movq	704(%r10), %rcx
	movq	%rcx, 2240(%rax)
	movq	712(%r10), %rcx
	movq	%rcx, 2248(%rax)
	movq	720(%r10), %rcx
	movq	%rcx, 2256(%rax)
	movq	728(%r10), %rcx
	movq	%rcx, 2264(%rax)
	movq	736(%r10), %rcx
	movq	%rcx, 2272(%rax)
	movq	744(%r10), %rcx
	movq	%rcx, 2280(%rax)
	movq	752(%r10), %rcx
	movq	%rcx, 2288(%rax)
	movq	760(%r10), %rcx
	movq	%rcx, 2296(%rax)
	movq	768(%r10), %rcx
	movq	%rcx, 2304(%rax)
	movq	776(%r10), %rcx
	movq	%rcx, 2312(%rax)
	movq	784(%r10), %rcx
	movq	%rcx, 2320(%rax)
	movq	792(%r10), %rcx
	movq	%rcx, 2328(%rax)
	movq	800(%r10), %rcx
	movq	%rcx, 2336(%rax)
	movq	808(%r10), %rcx
	movq	%rcx, 2344(%rax)
	movq	816(%r10), %rcx
	movq	%rcx, 2352(%rax)
	movq	824(%r10), %rcx
	movq	%rcx, 2360(%rax)
	movq	832(%r10), %rcx
	movq	%rcx, 2368(%rax)
	movq	840(%r10), %rcx
	movq	%rcx, 2376(%rax)
	movq	848(%r10), %rcx
	movq	%rcx, 2384(%rax)
	movq	856(%r10), %rcx
	movq	%rcx, 2392(%rax)
	movq	864(%r10), %rcx
	movq	%rcx, 2400(%rax)
	movq	872(%r10), %rcx
	movq	%rcx, 2408(%rax)
	movq	880(%r10), %rcx
	movq	%rcx, 2416(%rax)
	movq	888(%r10), %rcx
	movq	%rcx, 2424(%rax)
	movq	896(%r10), %rcx
	movq	%rcx, 2432(%rax)
	movq	904(%r10), %rcx
	movq	%rcx, 2440(%rax)
	movq	912(%r10), %rcx
	movq	%rcx, 2448(%rax)
	movq	920(%r10), %rcx
	movq	%rcx, 2456(%rax)
	movq	928(%r10), %rcx
	movq	%rcx, 2464(%rax)
	movq	936(%r10), %rcx
	movq	%rcx, 2472(%rax)
	movq	944(%r10), %rcx
	movq	%rcx, 2480(%rax)
	movq	952(%r10), %rcx
	movq	%rcx, 2488(%rax)
	movq	960(%r10), %rcx
	movq	%rcx, 2496(%rax)
	movq	968(%r10), %rcx
	movq	%rcx, 2504(%rax)
	movq	976(%r10), %rcx
	movq	%rcx, 2512(%rax)
	movq	984(%r10), %rcx
	movq	%rcx, 2520(%rax)
	movq	992(%r10), %rcx
	movq	%rcx, 2528(%rax)
	movq	1000(%r10), %rcx
	movq	%rcx, 2536(%rax)
	movq	1008(%r10), %rcx
	movq	%rcx, 2544(%rax)
	movq	1016(%r10), %rcx
	movq	%rcx, 2552(%rax)
	movq	1024(%r10), %rcx
	movq	%rcx, 2560(%rax)
	movq	1032(%r10), %rcx
	movq	%rcx, 2568(%rax)
	movq	1040(%r10), %rcx
	movq	%rcx, 2576(%rax)
	movq	1048(%r10), %rcx
	movq	%rcx, 2584(%rax)
	movq	1056(%r10), %rcx
	movq	%rcx, 2592(%rax)
	movq	1064(%r10), %rcx
	movq	%rcx, 2600(%rax)
	movq	1072(%r10), %rcx
	movq	%rcx, 2608(%rax)
	movq	1080(%r10), %rcx
	movq	%rcx, 2616(%rax)
	movq	1088(%r10), %rcx
	movq	%rcx, 2624(%rax)
	movq	1096(%r10), %rcx
	movq	%rcx, 2632(%rax)
	movq	1104(%r10), %rcx
	movq	%rcx, 2640(%rax)
	movq	1112(%r10), %rcx
	movq	%rcx, 2648(%rax)
	movq	1120(%r10), %rcx
	movq	%rcx, 2656(%rax)
	movq	1128(%r10), %rcx
	movq	%rcx, 2664(%rax)
	movq	1136(%r10), %rcx
	movq	%rcx, 2672(%rax)
	movq	1144(%r10), %rcx
	movq	%rcx, 2680(%rax)
	movq	1152(%r10), %rcx
	movq	%rcx, 2688(%rax)
	movq	1160(%r10), %rcx
	movq	%rcx, 2696(%rax)
	movq	1168(%r10), %rcx
	movq	%rcx, 2704(%rax)
	movq	1176(%r10), %rcx
	movq	%rcx, 2712(%rax)
	movq	1184(%r10), %rcx
	movq	%rcx, 2720(%rax)
	movq	1192(%r10), %rcx
	movq	%rcx, 2728(%rax)
	movq	1200(%r10), %rcx
	movq	%rcx, 2736(%rax)
	movq	1208(%r10), %rcx
	movq	%rcx, 2744(%rax)
	movq	1216(%r10), %rcx
	movq	%rcx, 2752(%rax)
	movq	1224(%r10), %rcx
	movq	%rcx, 2760(%rax)
	movq	1232(%r10), %rcx
	movq	%rcx, 2768(%rax)
	movq	1240(%r10), %rcx
	movq	%rcx, 2776(%rax)
	movq	1248(%r10), %rcx
	movq	%rcx, 2784(%rax)
	movq	1256(%r10), %rcx
	movq	%rcx, 2792(%rax)
	movq	1264(%r10), %rcx
	movq	%rcx, 2800(%rax)
	movq	1272(%r10), %rcx
	movq	%rcx, 2808(%rax)
	movq	1280(%r10), %rcx
	movq	%rcx, 2816(%rax)
	movq	1288(%r10), %rcx
	movq	%rcx, 2824(%rax)
	movq	1296(%r10), %rcx
	movq	%rcx, 2832(%rax)
	movq	1304(%r10), %rcx
	movq	%rcx, 2840(%rax)
	movq	1312(%r10), %rcx
	movq	%rcx, 2848(%rax)
	movq	1320(%r10), %rcx
	movq	%rcx, 2856(%rax)
	movq	1328(%r10), %rcx
	movq	%rcx, 2864(%rax)
	movq	1336(%r10), %rcx
	movq	%rcx, 2872(%rax)
	movq	1344(%r10), %rcx
	movq	%rcx, 2880(%rax)
	movq	1352(%r10), %rcx
	movq	%rcx, 2888(%rax)
	movq	1360(%r10), %rcx
	movq	%rcx, 2896(%rax)
	movq	1368(%r10), %rcx
	movq	%rcx, 2904(%rax)
	movq	1376(%r10), %rcx
	movq	%rcx, 2912(%rax)
	movq	1384(%r10), %rcx
	movq	%rcx, 2920(%rax)
	movq	1392(%r10), %rcx
	movq	%rcx, 2928(%rax)
	movq	1400(%r10), %rcx
	movq	%rcx, 2936(%rax)
	movq	1408(%r10), %rcx
	movq	%rcx, 2944(%rax)
	movq	1416(%r10), %rcx
	movq	%rcx, 2952(%rax)
	movq	1424(%r10), %rcx
	movq	%rcx, 2960(%rax)
	movq	1432(%r10), %rcx
	movq	%rcx, 2968(%rax)
	movq	1440(%r10), %rcx
	movq	%rcx, 2976(%rax)
	movq	1448(%r10), %rcx
	movq	%rcx, 2984(%rax)
	movq	1456(%r10), %rcx
	movq	%rcx, 2992(%rax)
	movq	1464(%r10), %rcx
	movq	%rcx, 3000(%rax)
	movq	1472(%r10), %rcx
	movq	%rcx, 3008(%rax)
	movq	1480(%r10), %rcx
	movq	%rcx, 3016(%rax)
	movq	1488(%r10), %rcx
	movq	%rcx, 3024(%rax)
	movq	1496(%r10), %rcx
	movq	%rcx, 3032(%rax)
	movq	1504(%r10), %rcx
	movq	%rcx, 3040(%rax)
	movq	1512(%r10), %rcx
	movq	%rcx, 3048(%rax)
	movq	1520(%r10), %rcx
	movq	%rcx, 3056(%rax)
	movq	1528(%r10), %rcx
	movq	%rcx, 3064(%rax)
	movq	1536(%r10), %rcx
	movq	%rcx, 3072(%rax)
	movq	1544(%r10), %rcx
	movq	%rcx, 3080(%rax)
	movq	1552(%r10), %rcx
	movq	%rcx, 3088(%rax)
	movq	1560(%r10), %rcx
	movq	%rcx, 3096(%rax)
	movq	%rax, (%rsp)
	leaq	56(%rsp), %rax
	leaq	-224(%rsp), %rsp
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair$1:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %rax
	movq	56(%rsp), %rcx
	movq	%rcx, 3104(%rax)
	movq	64(%rsp), %rcx
	movq	%rcx, 3112(%rax)
	movq	72(%rsp), %rcx
	movq	%rcx, 3120(%rax)
	movq	80(%rsp), %rcx
	movq	%rcx, 3128(%rax)
	movq	%mm3, %rdx
	leaq	32(%rdx), %rcx
	movq	(%rcx), %rsi
	movq	%rsi, 3136(%rax)
	movq	8(%rcx), %rsi
	movq	%rsi, 3144(%rax)
	movq	16(%rcx), %rsi
	movq	%rsi, 3152(%rax)
	movq	24(%rcx), %rcx
	movq	%rcx, 3160(%rax)
	movq	%mm1, %rdx
	movq	%mm2, %rsi
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
	movq	%rax, 1184(%rdx)
	movq	1856(%rsp), %rax
	movq	%rax, 1192(%rdx)
	movq	1864(%rsp), %rax
	movq	%rax, 1200(%rdx)
	movq	1872(%rsp), %rax
	movq	%rax, 1208(%rdx)
	movq	1880(%rsp), %rax
	movq	%rax, 1216(%rdx)
	movq	1888(%rsp), %rax
	movq	%rax, 1224(%rdx)
	movq	1896(%rsp), %rax
	movq	%rax, 1232(%rdx)
	movq	1904(%rsp), %rax
	movq	%rax, 1240(%rdx)
	movq	1912(%rsp), %rax
	movq	%rax, 1248(%rdx)
	movq	1920(%rsp), %rax
	movq	%rax, 1256(%rdx)
	movq	1928(%rsp), %rax
	movq	%rax, 1264(%rdx)
	movq	1936(%rsp), %rax
	movq	%rax, 1272(%rdx)
	movq	1944(%rsp), %rax
	movq	%rax, 1280(%rdx)
	movq	1952(%rsp), %rax
	movq	%rax, 1288(%rdx)
	movq	1960(%rsp), %rax
	movq	%rax, 1296(%rdx)
	movq	1968(%rsp), %rax
	movq	%rax, 1304(%rdx)
	movq	1976(%rsp), %rax
	movq	%rax, 1312(%rdx)
	movq	1984(%rsp), %rax
	movq	%rax, 1320(%rdx)
	movq	1992(%rsp), %rax
	movq	%rax, 1328(%rdx)
	movq	2000(%rsp), %rax
	movq	%rax, 1336(%rdx)
	movq	2008(%rsp), %rax
	movq	%rax, 1344(%rdx)
	movq	2016(%rsp), %rax
	movq	%rax, 1352(%rdx)
	movq	2024(%rsp), %rax
	movq	%rax, 1360(%rdx)
	movq	2032(%rsp), %rax
	movq	%rax, 1368(%rdx)
	movq	2040(%rsp), %rax
	movq	%rax, 1376(%rdx)
	movq	2048(%rsp), %rax
	movq	%rax, 1384(%rdx)
	movq	2056(%rsp), %rax
	movq	%rax, 1392(%rdx)
	movq	2064(%rsp), %rax
	movq	%rax, 1400(%rdx)
	movq	2072(%rsp), %rax
	movq	%rax, 1408(%rdx)
	movq	2080(%rsp), %rax
	movq	%rax, 1416(%rdx)
	movq	2088(%rsp), %rax
	movq	%rax, 1424(%rdx)
	movq	2096(%rsp), %rax
	movq	%rax, 1432(%rdx)
	movq	2104(%rsp), %rax
	movq	%rax, 1440(%rdx)
	movq	2112(%rsp), %rax
	movq	%rax, 1448(%rdx)
	movq	2120(%rsp), %rax
	movq	%rax, 1456(%rdx)
	movq	2128(%rsp), %rax
	movq	%rax, 1464(%rdx)
	movq	2136(%rsp), %rax
	movq	%rax, 1472(%rdx)
	movq	2144(%rsp), %rax
	movq	%rax, 1480(%rdx)
	movq	2152(%rsp), %rax
	movq	%rax, 1488(%rdx)
	movq	2160(%rsp), %rax
	movq	%rax, 1496(%rdx)
	movq	2168(%rsp), %rax
	movq	%rax, 1504(%rdx)
	movq	2176(%rsp), %rax
	movq	%rax, 1512(%rdx)
	movq	2184(%rsp), %rax
	movq	%rax, 1520(%rdx)
	movq	2192(%rsp), %rax
	movq	%rax, 1528(%rdx)
	movq	2200(%rsp), %rax
	movq	%rax, 1536(%rdx)
	movq	2208(%rsp), %rax
	movq	%rax, 1544(%rdx)
	movq	2216(%rsp), %rax
	movq	%rax, 1552(%rdx)
	movq	2224(%rsp), %rax
	movq	%rax, 1560(%rdx)
	movq	2232(%rsp), %rax
	movq	%rax, (%rsi)
	movq	2240(%rsp), %rax
	movq	%rax, 8(%rsi)
	movq	2248(%rsp), %rax
	movq	%rax, 16(%rsi)
	movq	2256(%rsp), %rax
	movq	%rax, 24(%rsi)
	movq	2264(%rsp), %rax
	movq	%rax, 32(%rsi)
	movq	2272(%rsp), %rax
	movq	%rax, 40(%rsi)
	movq	2280(%rsp), %rax
	movq	%rax, 48(%rsi)
	movq	2288(%rsp), %rax
	movq	%rax, 56(%rsi)
	movq	2296(%rsp), %rax
	movq	%rax, 64(%rsi)
	movq	2304(%rsp), %rax
	movq	%rax, 72(%rsi)
	movq	2312(%rsp), %rax
	movq	%rax, 80(%rsi)
	movq	2320(%rsp), %rax
	movq	%rax, 88(%rsi)
	movq	2328(%rsp), %rax
	movq	%rax, 96(%rsi)
	movq	2336(%rsp), %rax
	movq	%rax, 104(%rsi)
	movq	2344(%rsp), %rax
	movq	%rax, 112(%rsi)
	movq	2352(%rsp), %rax
	movq	%rax, 120(%rsi)
	movq	2360(%rsp), %rax
	movq	%rax, 128(%rsi)
	movq	2368(%rsp), %rax
	movq	%rax, 136(%rsi)
	movq	2376(%rsp), %rax
	movq	%rax, 144(%rsi)
	movq	2384(%rsp), %rax
	movq	%rax, 152(%rsi)
	movq	2392(%rsp), %rax
	movq	%rax, 160(%rsi)
	movq	2400(%rsp), %rax
	movq	%rax, 168(%rsi)
	movq	2408(%rsp), %rax
	movq	%rax, 176(%rsi)
	movq	2416(%rsp), %rax
	movq	%rax, 184(%rsi)
	movq	2424(%rsp), %rax
	movq	%rax, 192(%rsi)
	movq	2432(%rsp), %rax
	movq	%rax, 200(%rsi)
	movq	2440(%rsp), %rax
	movq	%rax, 208(%rsi)
	movq	2448(%rsp), %rax
	movq	%rax, 216(%rsi)
	movq	2456(%rsp), %rax
	movq	%rax, 224(%rsi)
	movq	2464(%rsp), %rax
	movq	%rax, 232(%rsi)
	movq	2472(%rsp), %rax
	movq	%rax, 240(%rsi)
	movq	2480(%rsp), %rax
	movq	%rax, 248(%rsi)
	movq	2488(%rsp), %rax
	movq	%rax, 256(%rsi)
	movq	2496(%rsp), %rax
	movq	%rax, 264(%rsi)
	movq	2504(%rsp), %rax
	movq	%rax, 272(%rsi)
	movq	2512(%rsp), %rax
	movq	%rax, 280(%rsi)
	movq	2520(%rsp), %rax
	movq	%rax, 288(%rsi)
	movq	2528(%rsp), %rax
	movq	%rax, 296(%rsi)
	movq	2536(%rsp), %rax
	movq	%rax, 304(%rsi)
	movq	2544(%rsp), %rax
	movq	%rax, 312(%rsi)
	movq	2552(%rsp), %rax
	movq	%rax, 320(%rsi)
	movq	2560(%rsp), %rax
	movq	%rax, 328(%rsi)
	movq	2568(%rsp), %rax
	movq	%rax, 336(%rsi)
	movq	2576(%rsp), %rax
	movq	%rax, 344(%rsi)
	movq	2584(%rsp), %rax
	movq	%rax, 352(%rsi)
	movq	2592(%rsp), %rax
	movq	%rax, 360(%rsi)
	movq	2600(%rsp), %rax
	movq	%rax, 368(%rsi)
	movq	2608(%rsp), %rax
	movq	%rax, 376(%rsi)
	movq	2616(%rsp), %rax
	movq	%rax, 384(%rsi)
	movq	2624(%rsp), %rax
	movq	%rax, 392(%rsi)
	movq	2632(%rsp), %rax
	movq	%rax, 400(%rsi)
	movq	2640(%rsp), %rax
	movq	%rax, 408(%rsi)
	movq	2648(%rsp), %rax
	movq	%rax, 416(%rsi)
	movq	2656(%rsp), %rax
	movq	%rax, 424(%rsi)
	movq	2664(%rsp), %rax
	movq	%rax, 432(%rsi)
	movq	2672(%rsp), %rax
	movq	%rax, 440(%rsi)
	movq	2680(%rsp), %rax
	movq	%rax, 448(%rsi)
	movq	2688(%rsp), %rax
	movq	%rax, 456(%rsi)
	movq	2696(%rsp), %rax
	movq	%rax, 464(%rsi)
	movq	2704(%rsp), %rax
	movq	%rax, 472(%rsi)
	movq	2712(%rsp), %rax
	movq	%rax, 480(%rsi)
	movq	2720(%rsp), %rax
	movq	%rax, 488(%rsi)
	movq	2728(%rsp), %rax
	movq	%rax, 496(%rsi)
	movq	2736(%rsp), %rax
	movq	%rax, 504(%rsi)
	movq	2744(%rsp), %rax
	movq	%rax, 512(%rsi)
	movq	2752(%rsp), %rax
	movq	%rax, 520(%rsi)
	movq	2760(%rsp), %rax
	movq	%rax, 528(%rsi)
	movq	2768(%rsp), %rax
	movq	%rax, 536(%rsi)
	movq	2776(%rsp), %rax
	movq	%rax, 544(%rsi)
	movq	2784(%rsp), %rax
	movq	%rax, 552(%rsi)
	movq	2792(%rsp), %rax
	movq	%rax, 560(%rsi)
	movq	2800(%rsp), %rax
	movq	%rax, 568(%rsi)
	movq	2808(%rsp), %rax
	movq	%rax, 576(%rsi)
	movq	2816(%rsp), %rax
	movq	%rax, 584(%rsi)
	movq	2824(%rsp), %rax
	movq	%rax, 592(%rsi)
	movq	2832(%rsp), %rax
	movq	%rax, 600(%rsi)
	movq	2840(%rsp), %rax
	movq	%rax, 608(%rsi)
	movq	2848(%rsp), %rax
	movq	%rax, 616(%rsi)
	movq	2856(%rsp), %rax
	movq	%rax, 624(%rsi)
	movq	2864(%rsp), %rax
	movq	%rax, 632(%rsi)
	movq	2872(%rsp), %rax
	movq	%rax, 640(%rsi)
	movq	2880(%rsp), %rax
	movq	%rax, 648(%rsi)
	movq	2888(%rsp), %rax
	movq	%rax, 656(%rsi)
	movq	2896(%rsp), %rax
	movq	%rax, 664(%rsi)
	movq	2904(%rsp), %rax
	movq	%rax, 672(%rsi)
	movq	2912(%rsp), %rax
	movq	%rax, 680(%rsi)
	movq	2920(%rsp), %rax
	movq	%rax, 688(%rsi)
	movq	2928(%rsp), %rax
	movq	%rax, 696(%rsi)
	movq	2936(%rsp), %rax
	movq	%rax, 704(%rsi)
	movq	2944(%rsp), %rax
	movq	%rax, 712(%rsi)
	movq	2952(%rsp), %rax
	movq	%rax, 720(%rsi)
	movq	2960(%rsp), %rax
	movq	%rax, 728(%rsi)
	movq	2968(%rsp), %rax
	movq	%rax, 736(%rsi)
	movq	2976(%rsp), %rax
	movq	%rax, 744(%rsi)
	movq	2984(%rsp), %rax
	movq	%rax, 752(%rsi)
	movq	2992(%rsp), %rax
	movq	%rax, 760(%rsi)
	movq	3000(%rsp), %rax
	movq	%rax, 768(%rsi)
	movq	3008(%rsp), %rax
	movq	%rax, 776(%rsi)
	movq	3016(%rsp), %rax
	movq	%rax, 784(%rsi)
	movq	3024(%rsp), %rax
	movq	%rax, 792(%rsi)
	movq	3032(%rsp), %rax
	movq	%rax, 800(%rsi)
	movq	3040(%rsp), %rax
	movq	%rax, 808(%rsi)
	movq	3048(%rsp), %rax
	movq	%rax, 816(%rsi)
	movq	3056(%rsp), %rax
	movq	%rax, 824(%rsi)
	movq	3064(%rsp), %rax
	movq	%rax, 832(%rsi)
	movq	3072(%rsp), %rax
	movq	%rax, 840(%rsi)
	movq	3080(%rsp), %rax
	movq	%rax, 848(%rsi)
	movq	3088(%rsp), %rax
	movq	%rax, 856(%rsi)
	movq	3096(%rsp), %rax
	movq	%rax, 864(%rsi)
	movq	3104(%rsp), %rax
	movq	%rax, 872(%rsi)
	movq	3112(%rsp), %rax
	movq	%rax, 880(%rsi)
	movq	3120(%rsp), %rax
	movq	%rax, 888(%rsi)
	movq	3128(%rsp), %rax
	movq	%rax, 896(%rsi)
	movq	3136(%rsp), %rax
	movq	%rax, 904(%rsi)
	movq	3144(%rsp), %rax
	movq	%rax, 912(%rsi)
	movq	3152(%rsp), %rax
	movq	%rax, 920(%rsi)
	movq	3160(%rsp), %rax
	movq	%rax, 928(%rsi)
	movq	3168(%rsp), %rax
	movq	%rax, 936(%rsi)
	movq	3176(%rsp), %rax
	movq	%rax, 944(%rsi)
	movq	3184(%rsp), %rax
	movq	%rax, 952(%rsi)
	movq	3192(%rsp), %rax
	movq	%rax, 960(%rsi)
	movq	3200(%rsp), %rax
	movq	%rax, 968(%rsi)
	movq	3208(%rsp), %rax
	movq	%rax, 976(%rsi)
	movq	3216(%rsp), %rax
	movq	%rax, 984(%rsi)
	movq	3224(%rsp), %rax
	movq	%rax, 992(%rsi)
	movq	3232(%rsp), %rax
	movq	%rax, 1000(%rsi)
	movq	3240(%rsp), %rax
	movq	%rax, 1008(%rsi)
	movq	3248(%rsp), %rax
	movq	%rax, 1016(%rsi)
	movq	3256(%rsp), %rax
	movq	%rax, 1024(%rsi)
	movq	3264(%rsp), %rax
	movq	%rax, 1032(%rsi)
	movq	3272(%rsp), %rax
	movq	%rax, 1040(%rsi)
	movq	3280(%rsp), %rax
	movq	%rax, 1048(%rsi)
	movq	3288(%rsp), %rax
	movq	%rax, 1056(%rsi)
	movq	3296(%rsp), %rax
	movq	%rax, 1064(%rsi)
	movq	3304(%rsp), %rax
	movq	%rax, 1072(%rsi)
	movq	3312(%rsp), %rax
	movq	%rax, 1080(%rsi)
	movq	3320(%rsp), %rax
	movq	%rax, 1088(%rsi)
	movq	3328(%rsp), %rax
	movq	%rax, 1096(%rsi)
	movq	3336(%rsp), %rax
	movq	%rax, 1104(%rsi)
	movq	3344(%rsp), %rax
	movq	%rax, 1112(%rsi)
	movq	3352(%rsp), %rax
	movq	%rax, 1120(%rsi)
	movq	3360(%rsp), %rax
	movq	%rax, 1128(%rsi)
	movq	3368(%rsp), %rax
	movq	%rax, 1136(%rsi)
	movq	3376(%rsp), %rax
	movq	%rax, 1144(%rsi)
	movq	3384(%rsp), %rax
	movq	%rax, 1152(%rsi)
	movq	3392(%rsp), %rax
	movq	%rax, 1160(%rsi)
	movq	3400(%rsp), %rax
	movq	%rax, 1168(%rsi)
	movq	3408(%rsp), %rax
	movq	%rax, 1176(%rsi)
	movq	3416(%rsp), %rax
	movq	%rax, 1184(%rsi)
	movq	3424(%rsp), %rax
	movq	%rax, 1192(%rsi)
	movq	3432(%rsp), %rax
	movq	%rax, 1200(%rsi)
	movq	3440(%rsp), %rax
	movq	%rax, 1208(%rsi)
	movq	3448(%rsp), %rax
	movq	%rax, 1216(%rsi)
	movq	3456(%rsp), %rax
	movq	%rax, 1224(%rsi)
	movq	3464(%rsp), %rax
	movq	%rax, 1232(%rsi)
	movq	3472(%rsp), %rax
	movq	%rax, 1240(%rsi)
	movq	3480(%rsp), %rax
	movq	%rax, 1248(%rsi)
	movq	3488(%rsp), %rax
	movq	%rax, 1256(%rsi)
	movq	3496(%rsp), %rax
	movq	%rax, 1264(%rsi)
	movq	3504(%rsp), %rax
	movq	%rax, 1272(%rsi)
	movq	3512(%rsp), %rax
	movq	%rax, 1280(%rsi)
	movq	3520(%rsp), %rax
	movq	%rax, 1288(%rsi)
	movq	3528(%rsp), %rax
	movq	%rax, 1296(%rsi)
	movq	3536(%rsp), %rax
	movq	%rax, 1304(%rsi)
	movq	3544(%rsp), %rax
	movq	%rax, 1312(%rsi)
	movq	3552(%rsp), %rax
	movq	%rax, 1320(%rsi)
	movq	3560(%rsp), %rax
	movq	%rax, 1328(%rsi)
	movq	3568(%rsp), %rax
	movq	%rax, 1336(%rsi)
	movq	3576(%rsp), %rax
	movq	%rax, 1344(%rsi)
	movq	3584(%rsp), %rax
	movq	%rax, 1352(%rsi)
	movq	3592(%rsp), %rax
	movq	%rax, 1360(%rsi)
	movq	3600(%rsp), %rax
	movq	%rax, 1368(%rsi)
	movq	3608(%rsp), %rax
	movq	%rax, 1376(%rsi)
	movq	3616(%rsp), %rax
	movq	%rax, 1384(%rsi)
	movq	3624(%rsp), %rax
	movq	%rax, 1392(%rsi)
	movq	3632(%rsp), %rax
	movq	%rax, 1400(%rsi)
	movq	3640(%rsp), %rax
	movq	%rax, 1408(%rsi)
	movq	3648(%rsp), %rax
	movq	%rax, 1416(%rsi)
	movq	3656(%rsp), %rax
	movq	%rax, 1424(%rsi)
	movq	3664(%rsp), %rax
	movq	%rax, 1432(%rsi)
	movq	3672(%rsp), %rax
	movq	%rax, 1440(%rsi)
	movq	3680(%rsp), %rax
	movq	%rax, 1448(%rsi)
	movq	3688(%rsp), %rax
	movq	%rax, 1456(%rsi)
	movq	3696(%rsp), %rax
	movq	%rax, 1464(%rsi)
	movq	3704(%rsp), %rax
	movq	%rax, 1472(%rsi)
	movq	3712(%rsp), %rax
	movq	%rax, 1480(%rsi)
	movq	3720(%rsp), %rax
	movq	%rax, 1488(%rsi)
	movq	3728(%rsp), %rax
	movq	%rax, 1496(%rsi)
	movq	3736(%rsp), %rax
	movq	%rax, 1504(%rsi)
	movq	3744(%rsp), %rax
	movq	%rax, 1512(%rsi)
	movq	3752(%rsp), %rax
	movq	%rax, 1520(%rsi)
	movq	3760(%rsp), %rax
	movq	%rax, 1528(%rsi)
	movq	3768(%rsp), %rax
	movq	%rax, 1536(%rsi)
	movq	3776(%rsp), %rax
	movq	%rax, 1544(%rsi)
	movq	3784(%rsp), %rax
	movq	%rax, 1552(%rsi)
	movq	3792(%rsp), %rax
	movq	%rax, 1560(%rsi)
	movq	3800(%rsp), %rax
	movq	%rax, 1568(%rsi)
	movq	3808(%rsp), %rax
	movq	%rax, 1576(%rsi)
	movq	3816(%rsp), %rax
	movq	%rax, 1584(%rsi)
	movq	3824(%rsp), %rax
	movq	%rax, 1592(%rsi)
	movq	3832(%rsp), %rax
	movq	%rax, 1600(%rsi)
	movq	3840(%rsp), %rax
	movq	%rax, 1608(%rsi)
	movq	3848(%rsp), %rax
	movq	%rax, 1616(%rsi)
	movq	3856(%rsp), %rax
	movq	%rax, 1624(%rsi)
	movq	3864(%rsp), %rax
	movq	%rax, 1632(%rsi)
	movq	3872(%rsp), %rax
	movq	%rax, 1640(%rsi)
	movq	3880(%rsp), %rax
	movq	%rax, 1648(%rsi)
	movq	3888(%rsp), %rax
	movq	%rax, 1656(%rsi)
	movq	3896(%rsp), %rax
	movq	%rax, 1664(%rsi)
	movq	3904(%rsp), %rax
	movq	%rax, 1672(%rsi)
	movq	3912(%rsp), %rax
	movq	%rax, 1680(%rsi)
	movq	3920(%rsp), %rax
	movq	%rax, 1688(%rsi)
	movq	3928(%rsp), %rax
	movq	%rax, 1696(%rsi)
	movq	3936(%rsp), %rax
	movq	%rax, 1704(%rsi)
	movq	3944(%rsp), %rax
	movq	%rax, 1712(%rsi)
	movq	3952(%rsp), %rax
	movq	%rax, 1720(%rsi)
	movq	3960(%rsp), %rax
	movq	%rax, 1728(%rsi)
	movq	3968(%rsp), %rax
	movq	%rax, 1736(%rsi)
	movq	3976(%rsp), %rax
	movq	%rax, 1744(%rsi)
	movq	3984(%rsp), %rax
	movq	%rax, 1752(%rsi)
	movq	3992(%rsp), %rax
	movq	%rax, 1760(%rsi)
	movq	4000(%rsp), %rax
	movq	%rax, 1768(%rsi)
	movq	4008(%rsp), %rax
	movq	%rax, 1776(%rsi)
	movq	4016(%rsp), %rax
	movq	%rax, 1784(%rsi)
	movq	4024(%rsp), %rax
	movq	%rax, 1792(%rsi)
	movq	4032(%rsp), %rax
	movq	%rax, 1800(%rsi)
	movq	4040(%rsp), %rax
	movq	%rax, 1808(%rsi)
	movq	4048(%rsp), %rax
	movq	%rax, 1816(%rsi)
	movq	4056(%rsp), %rax
	movq	%rax, 1824(%rsi)
	movq	4064(%rsp), %rax
	movq	%rax, 1832(%rsi)
	movq	4072(%rsp), %rax
	movq	%rax, 1840(%rsi)
	movq	4080(%rsp), %rax
	movq	%rax, 1848(%rsi)
	movq	4088(%rsp), %rax
	movq	%rax, 1856(%rsi)
	movq	4096(%rsp), %rax
	movq	%rax, 1864(%rsi)
	movq	4104(%rsp), %rax
	movq	%rax, 1872(%rsi)
	movq	4112(%rsp), %rax
	movq	%rax, 1880(%rsi)
	movq	4120(%rsp), %rax
	movq	%rax, 1888(%rsi)
	movq	4128(%rsp), %rax
	movq	%rax, 1896(%rsi)
	movq	4136(%rsp), %rax
	movq	%rax, 1904(%rsi)
	movq	4144(%rsp), %rax
	movq	%rax, 1912(%rsi)
	movq	4152(%rsp), %rax
	movq	%rax, 1920(%rsi)
	movq	4160(%rsp), %rax
	movq	%rax, 1928(%rsi)
	movq	4168(%rsp), %rax
	movq	%rax, 1936(%rsi)
	movq	4176(%rsp), %rax
	movq	%rax, 1944(%rsi)
	movq	4184(%rsp), %rax
	movq	%rax, 1952(%rsi)
	movq	4192(%rsp), %rax
	movq	%rax, 1960(%rsi)
	movq	4200(%rsp), %rax
	movq	%rax, 1968(%rsi)
	movq	4208(%rsp), %rax
	movq	%rax, 1976(%rsi)
	movq	4216(%rsp), %rax
	movq	%rax, 1984(%rsi)
	movq	4224(%rsp), %rax
	movq	%rax, 1992(%rsi)
	movq	4232(%rsp), %rax
	movq	%rax, 2000(%rsi)
	movq	4240(%rsp), %rax
	movq	%rax, 2008(%rsi)
	movq	4248(%rsp), %rax
	movq	%rax, 2016(%rsi)
	movq	4256(%rsp), %rax
	movq	%rax, 2024(%rsi)
	movq	4264(%rsp), %rax
	movq	%rax, 2032(%rsi)
	movq	4272(%rsp), %rax
	movq	%rax, 2040(%rsi)
	movq	4280(%rsp), %rax
	movq	%rax, 2048(%rsi)
	movq	4288(%rsp), %rax
	movq	%rax, 2056(%rsi)
	movq	4296(%rsp), %rax
	movq	%rax, 2064(%rsi)
	movq	4304(%rsp), %rax
	movq	%rax, 2072(%rsi)
	movq	4312(%rsp), %rax
	movq	%rax, 2080(%rsi)
	movq	4320(%rsp), %rax
	movq	%rax, 2088(%rsi)
	movq	4328(%rsp), %rax
	movq	%rax, 2096(%rsi)
	movq	4336(%rsp), %rax
	movq	%rax, 2104(%rsi)
	movq	4344(%rsp), %rax
	movq	%rax, 2112(%rsi)
	movq	4352(%rsp), %rax
	movq	%rax, 2120(%rsi)
	movq	4360(%rsp), %rax
	movq	%rax, 2128(%rsi)
	movq	4368(%rsp), %rax
	movq	%rax, 2136(%rsi)
	movq	4376(%rsp), %rax
	movq	%rax, 2144(%rsi)
	movq	4384(%rsp), %rax
	movq	%rax, 2152(%rsi)
	movq	4392(%rsp), %rax
	movq	%rax, 2160(%rsi)
	movq	4400(%rsp), %rax
	movq	%rax, 2168(%rsi)
	movq	4408(%rsp), %rax
	movq	%rax, 2176(%rsi)
	movq	4416(%rsp), %rax
	movq	%rax, 2184(%rsi)
	movq	4424(%rsp), %rax
	movq	%rax, 2192(%rsi)
	movq	4432(%rsp), %rax
	movq	%rax, 2200(%rsi)
	movq	4440(%rsp), %rax
	movq	%rax, 2208(%rsi)
	movq	4448(%rsp), %rax
	movq	%rax, 2216(%rsi)
	movq	4456(%rsp), %rax
	movq	%rax, 2224(%rsi)
	movq	4464(%rsp), %rax
	movq	%rax, 2232(%rsi)
	movq	4472(%rsp), %rax
	movq	%rax, 2240(%rsi)
	movq	4480(%rsp), %rax
	movq	%rax, 2248(%rsi)
	movq	4488(%rsp), %rax
	movq	%rax, 2256(%rsi)
	movq	4496(%rsp), %rax
	movq	%rax, 2264(%rsi)
	movq	4504(%rsp), %rax
	movq	%rax, 2272(%rsi)
	movq	4512(%rsp), %rax
	movq	%rax, 2280(%rsi)
	movq	4520(%rsp), %rax
	movq	%rax, 2288(%rsi)
	movq	4528(%rsp), %rax
	movq	%rax, 2296(%rsi)
	movq	4536(%rsp), %rax
	movq	%rax, 2304(%rsi)
	movq	4544(%rsp), %rax
	movq	%rax, 2312(%rsi)
	movq	4552(%rsp), %rax
	movq	%rax, 2320(%rsi)
	movq	4560(%rsp), %rax
	movq	%rax, 2328(%rsi)
	movq	4568(%rsp), %rax
	movq	%rax, 2336(%rsi)
	movq	4576(%rsp), %rax
	movq	%rax, 2344(%rsi)
	movq	4584(%rsp), %rax
	movq	%rax, 2352(%rsi)
	movq	4592(%rsp), %rax
	movq	%rax, 2360(%rsi)
	movq	4600(%rsp), %rax
	movq	%rax, 2368(%rsi)
	movq	4608(%rsp), %rax
	movq	%rax, 2376(%rsi)
	movq	4616(%rsp), %rax
	movq	%rax, 2384(%rsi)
	movq	4624(%rsp), %rax
	movq	%rax, 2392(%rsi)
	movq	4632(%rsp), %rax
	movq	%rax, 2400(%rsi)
	movq	4640(%rsp), %rax
	movq	%rax, 2408(%rsi)
	movq	4648(%rsp), %rax
	movq	%rax, 2416(%rsi)
	movq	4656(%rsp), %rax
	movq	%rax, 2424(%rsi)
	movq	4664(%rsp), %rax
	movq	%rax, 2432(%rsi)
	movq	4672(%rsp), %rax
	movq	%rax, 2440(%rsi)
	movq	4680(%rsp), %rax
	movq	%rax, 2448(%rsi)
	movq	4688(%rsp), %rax
	movq	%rax, 2456(%rsi)
	movq	4696(%rsp), %rax
	movq	%rax, 2464(%rsi)
	movq	4704(%rsp), %rax
	movq	%rax, 2472(%rsi)
	movq	4712(%rsp), %rax
	movq	%rax, 2480(%rsi)
	movq	4720(%rsp), %rax
	movq	%rax, 2488(%rsi)
	movq	4728(%rsp), %rax
	movq	%rax, 2496(%rsi)
	movq	4736(%rsp), %rax
	movq	%rax, 2504(%rsi)
	movq	4744(%rsp), %rax
	movq	%rax, 2512(%rsi)
	movq	4752(%rsp), %rax
	movq	%rax, 2520(%rsi)
	movq	4760(%rsp), %rax
	movq	%rax, 2528(%rsi)
	movq	4768(%rsp), %rax
	movq	%rax, 2536(%rsi)
	movq	4776(%rsp), %rax
	movq	%rax, 2544(%rsi)
	movq	4784(%rsp), %rax
	movq	%rax, 2552(%rsi)
	movq	4792(%rsp), %rax
	movq	%rax, 2560(%rsi)
	movq	4800(%rsp), %rax
	movq	%rax, 2568(%rsi)
	movq	4808(%rsp), %rax
	movq	%rax, 2576(%rsi)
	movq	4816(%rsp), %rax
	movq	%rax, 2584(%rsi)
	movq	4824(%rsp), %rax
	movq	%rax, 2592(%rsi)
	movq	4832(%rsp), %rax
	movq	%rax, 2600(%rsi)
	movq	4840(%rsp), %rax
	movq	%rax, 2608(%rsi)
	movq	4848(%rsp), %rax
	movq	%rax, 2616(%rsi)
	movq	4856(%rsp), %rax
	movq	%rax, 2624(%rsi)
	movq	4864(%rsp), %rax
	movq	%rax, 2632(%rsi)
	movq	4872(%rsp), %rax
	movq	%rax, 2640(%rsi)
	movq	4880(%rsp), %rax
	movq	%rax, 2648(%rsi)
	movq	4888(%rsp), %rax
	movq	%rax, 2656(%rsi)
	movq	4896(%rsp), %rax
	movq	%rax, 2664(%rsi)
	movq	4904(%rsp), %rax
	movq	%rax, 2672(%rsi)
	movq	4912(%rsp), %rax
	movq	%rax, 2680(%rsi)
	movq	4920(%rsp), %rax
	movq	%rax, 2688(%rsi)
	movq	4928(%rsp), %rax
	movq	%rax, 2696(%rsi)
	movq	4936(%rsp), %rax
	movq	%rax, 2704(%rsi)
	movq	4944(%rsp), %rax
	movq	%rax, 2712(%rsi)
	movq	4952(%rsp), %rax
	movq	%rax, 2720(%rsi)
	movq	4960(%rsp), %rax
	movq	%rax, 2728(%rsi)
	movq	4968(%rsp), %rax
	movq	%rax, 2736(%rsi)
	movq	4976(%rsp), %rax
	movq	%rax, 2744(%rsi)
	movq	4984(%rsp), %rax
	movq	%rax, 2752(%rsi)
	movq	4992(%rsp), %rax
	movq	%rax, 2760(%rsi)
	movq	5000(%rsp), %rax
	movq	%rax, 2768(%rsi)
	movq	5008(%rsp), %rax
	movq	%rax, 2776(%rsi)
	movq	5016(%rsp), %rax
	movq	%rax, 2784(%rsi)
	movq	5024(%rsp), %rax
	movq	%rax, 2792(%rsi)
	movq	5032(%rsp), %rax
	movq	%rax, 2800(%rsi)
	movq	5040(%rsp), %rax
	movq	%rax, 2808(%rsi)
	movq	5048(%rsp), %rax
	movq	%rax, 2816(%rsi)
	movq	5056(%rsp), %rax
	movq	%rax, 2824(%rsi)
	movq	5064(%rsp), %rax
	movq	%rax, 2832(%rsi)
	movq	5072(%rsp), %rax
	movq	%rax, 2840(%rsi)
	movq	5080(%rsp), %rax
	movq	%rax, 2848(%rsi)
	movq	5088(%rsp), %rax
	movq	%rax, 2856(%rsi)
	movq	5096(%rsp), %rax
	movq	%rax, 2864(%rsi)
	movq	5104(%rsp), %rax
	movq	%rax, 2872(%rsi)
	movq	5112(%rsp), %rax
	movq	%rax, 2880(%rsi)
	movq	5120(%rsp), %rax
	movq	%rax, 2888(%rsi)
	movq	5128(%rsp), %rax
	movq	%rax, 2896(%rsi)
	movq	5136(%rsp), %rax
	movq	%rax, 2904(%rsi)
	movq	5144(%rsp), %rax
	movq	%rax, 2912(%rsi)
	movq	5152(%rsp), %rax
	movq	%rax, 2920(%rsi)
	movq	5160(%rsp), %rax
	movq	%rax, 2928(%rsi)
	movq	5168(%rsp), %rax
	movq	%rax, 2936(%rsi)
	movq	5176(%rsp), %rax
	movq	%rax, 2944(%rsi)
	movq	5184(%rsp), %rax
	movq	%rax, 2952(%rsi)
	movq	5192(%rsp), %rax
	movq	%rax, 2960(%rsi)
	movq	5200(%rsp), %rax
	movq	%rax, 2968(%rsi)
	movq	5208(%rsp), %rax
	movq	%rax, 2976(%rsi)
	movq	5216(%rsp), %rax
	movq	%rax, 2984(%rsi)
	movq	5224(%rsp), %rax
	movq	%rax, 2992(%rsi)
	movq	5232(%rsp), %rax
	movq	%rax, 3000(%rsi)
	movq	5240(%rsp), %rax
	movq	%rax, 3008(%rsi)
	movq	5248(%rsp), %rax
	movq	%rax, 3016(%rsi)
	movq	5256(%rsp), %rax
	movq	%rax, 3024(%rsi)
	movq	5264(%rsp), %rax
	movq	%rax, 3032(%rsi)
	movq	5272(%rsp), %rax
	movq	%rax, 3040(%rsi)
	movq	5280(%rsp), %rax
	movq	%rax, 3048(%rsi)
	movq	5288(%rsp), %rax
	movq	%rax, 3056(%rsi)
	movq	5296(%rsp), %rax
	movq	%rax, 3064(%rsi)
	movq	5304(%rsp), %rax
	movq	%rax, 3072(%rsi)
	movq	5312(%rsp), %rax
	movq	%rax, 3080(%rsi)
	movq	5320(%rsp), %rax
	movq	%rax, 3088(%rsi)
	movq	5328(%rsp), %rax
	movq	%rax, 3096(%rsi)
	movq	5336(%rsp), %rax
	movq	%rax, 3104(%rsi)
	movq	5344(%rsp), %rax
	movq	%rax, 3112(%rsi)
	movq	5352(%rsp), %rax
	movq	%rax, 3120(%rsi)
	movq	5360(%rsp), %rax
	movq	%rax, 3128(%rsi)
	movq	5368(%rsp), %rax
	movq	%rax, 3136(%rsi)
	movq	5376(%rsp), %rax
	movq	%rax, 3144(%rsi)
	movq	5384(%rsp), %rax
	movq	%rax, 3152(%rsi)
	movq	5392(%rsp), %rax
	movq	%rax, 3160(%rsi)
	xorl	%eax, %eax
	movq	20248(%rsp), %rbx
	movq	20256(%rsp), %rbp
	movq	20264(%rsp), %r12
	movq	20272(%rsp), %r13
	movq	20280(%rsp), %r14
	movq	20288(%rsp), %r15
	movq	20296(%rsp), %rsp
	ret
	.type	_jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand, %function
	.type	jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand, %function
_jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand:
jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand:
	movq	%rsp, %rax
	leaq	-20304(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 20248(%rsp)
	movq	%rbp, 20256(%rsp)
	movq	%r12, 20264(%rsp)
	movq	%r13, 20272(%rsp)
	movq	%r14, 20280(%rsp)
	movq	%r15, 20288(%rsp)
	movq	%rax, 20296(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm1
	movq	%rsi, %mm2
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
	leaq	2232(%rsp), %rax
	leaq	168(%rsp), %rdx
	movq	%rdx, %mm3
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
	movb	$4, 120(%rsp)
	leaq	232(%rsp), %rax
	leaq	88(%rsp), %r10
	leaq	-224(%rsp), %rsp
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$366:
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
	movq	%rax, %mm4
	movb	56(%rsp), %dl
	movb	%dl, 128(%rsp)
	movb	57(%rsp), %dl
	movb	%dl, 129(%rsp)
	movb	58(%rsp), %dl
	movb	%dl, 130(%rsp)
	movb	59(%rsp), %dl
	movb	%dl, 131(%rsp)
	movb	60(%rsp), %dl
	movb	%dl, 132(%rsp)
	movb	61(%rsp), %dl
	movb	%dl, 133(%rsp)
	movb	62(%rsp), %dl
	movb	%dl, 134(%rsp)
	movb	63(%rsp), %dl
	movb	%dl, 135(%rsp)
	movb	64(%rsp), %dl
	movb	%dl, 136(%rsp)
	movb	65(%rsp), %dl
	movb	%dl, 137(%rsp)
	movb	66(%rsp), %dl
	movb	%dl, 138(%rsp)
	movb	67(%rsp), %dl
	movb	%dl, 139(%rsp)
	movb	68(%rsp), %dl
	movb	%dl, 140(%rsp)
	movb	69(%rsp), %dl
	movb	%dl, 141(%rsp)
	movb	70(%rsp), %dl
	movb	%dl, 142(%rsp)
	movb	71(%rsp), %dl
	movb	%dl, 143(%rsp)
	movb	72(%rsp), %dl
	movb	%dl, 144(%rsp)
	movb	73(%rsp), %dl
	movb	%dl, 145(%rsp)
	movb	74(%rsp), %dl
	movb	%dl, 146(%rsp)
	movb	75(%rsp), %dl
	movb	%dl, 147(%rsp)
	movb	76(%rsp), %dl
	movb	%dl, 148(%rsp)
	movb	77(%rsp), %dl
	movb	%dl, 149(%rsp)
	movb	78(%rsp), %dl
	movb	%dl, 150(%rsp)
	movb	79(%rsp), %dl
	movb	%dl, 151(%rsp)
	movb	80(%rsp), %dl
	movb	%dl, 152(%rsp)
	movb	81(%rsp), %dl
	movb	%dl, 153(%rsp)
	movb	82(%rsp), %dl
	movb	%dl, 154(%rsp)
	movb	83(%rsp), %dl
	movb	%dl, 155(%rsp)
	movb	84(%rsp), %dl
	movb	%dl, 156(%rsp)
	movb	85(%rsp), %dl
	movb	%dl, 157(%rsp)
	movb	86(%rsp), %dl
	movb	%dl, 158(%rsp)
	movb	87(%rsp), %dl
	movb	%dl, 159(%rsp)
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$364
	movb	$0, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$365
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$364:
	movb	$0, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$365:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$363:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$350
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$351:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$362:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$360
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$361
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$360:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	12056(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$348
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$349:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$348:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$349
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$346
	movb	$0, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$347
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$346:
	movb	$1, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$347:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$345:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$332
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$333:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$344:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$342
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$343
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$342:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	12568(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$330
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$331:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$330:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$331
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$328
	movb	$0, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$329
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$328:
	movb	$2, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$329:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$327:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$314
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$315:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$326:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$324
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$325
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$324:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	13080(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$312
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$313:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$312:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$313
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$310
	movb	$0, 160(%rsp)
	movb	$3, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$311
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$310:
	movb	$3, 160(%rsp)
	movb	$0, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$311:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$309:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$296
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$297:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$308:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$306
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$307
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$306:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	13592(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$294
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$295:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$294:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$295
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$292
	movb	$1, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$293
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$292:
	movb	$0, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$293:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$291:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$278
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$279:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$290:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$288
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$289
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$288:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	14104(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$276
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$277:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$276:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$277
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$274
	movb	$1, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$275
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$274:
	movb	$1, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$275:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$273:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$260
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$261:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$272:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$270
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$271
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$270:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	14616(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$258
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$259:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$258:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$259
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$256
	movb	$1, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$257
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$256:
	movb	$2, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$257:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$255:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$242
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$243:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$254:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$252
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$253
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$252:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	15128(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$240
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$241:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$240:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$241
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$238
	movb	$1, 160(%rsp)
	movb	$3, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$239
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$238:
	movb	$3, 160(%rsp)
	movb	$1, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$239:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$237:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$224
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$225:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$236:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$234
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$235
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$234:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	15640(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$222
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$223:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$222:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$223
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$220
	movb	$2, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$221
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$220:
	movb	$0, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$221:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$219:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$206
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$207:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$218:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$216
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$217
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$216:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	16152(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$204
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$205:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$204:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$205
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$202
	movb	$2, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$203
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$202:
	movb	$1, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$203:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$201:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$188
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$189:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$200:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$198
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$199
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$198:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	16664(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$186
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$187:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$186:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$187
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$184
	movb	$2, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$185
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$184:
	movb	$2, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$185:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$183:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$170
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$171:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$182:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$180
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$181
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$180:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	17176(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$168
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$169:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$168:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$169
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$166
	movb	$2, 160(%rsp)
	movb	$3, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$167
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$166:
	movb	$3, 160(%rsp)
	movb	$2, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$167:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$165:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$152
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$153:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$164:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$162
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$163
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$162:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	17688(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$150
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$151:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$150:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$151
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$148
	movb	$3, 160(%rsp)
	movb	$0, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$149
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$148:
	movb	$0, 160(%rsp)
	movb	$3, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$149:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$147:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$134
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$135:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$146:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$144
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$145
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$144:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	18200(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$132
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$133:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$132:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$133
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$130
	movb	$3, 160(%rsp)
	movb	$1, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$131
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$130:
	movb	$1, 160(%rsp)
	movb	$3, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$131:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$129:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$116
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$117:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$128:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$126
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$127
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$126:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	18712(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$114
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$115:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$114:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$115
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$112
	movb	$3, 160(%rsp)
	movb	$2, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$113
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$112:
	movb	$2, 160(%rsp)
	movb	$3, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$113:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$111:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$98
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$99:
	movq	%rcx, %mm5
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$110:
	leaq	8(%rsp), %rsp
	movq	%mm5, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$108
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$109
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$108:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	19224(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$96
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$97:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$96:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$97
	movq	%mm4, %rax
	cmpq	$0, %rax
	je  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$94
	movb	$3, 160(%rsp)
	movb	$3, 161(%rsp)
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$95
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$94:
	movb	$3, 160(%rsp)
	movb	$3, 161(%rsp)
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$95:
	leaq	464(%rsp), %r15
	leaq	128(%rsp), %r10
	call	L_shake128_absorb34$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$93:
	movq	$0, %rcx
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$80
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$81:
	movq	%rcx, %mm4
	leaq	464(%rsp), %r15
	leaq	296(%rsp), %rax
	leaq	-8(%rsp), %rsp
	call	L_shake128_squeezeblock$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$92:
	leaq	8(%rsp), %rsp
	movq	%mm4, %rcx
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
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$90
	movq	$-1, %rsi
	cmovb	%rsi, %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$91
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$90:
	movq	$-1, %r8
	cmovnb	%r8, %rax
	movw	%si, 5400(%rsp,%rcx,2)
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
	movw	%di, 5400(%rsp,%rcx,2)
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
	movq	$0, %rdx
	leaq	19736(%rsp), %rax
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$78
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$79:
	movw	5400(%rsp,%rdx,2), %cx
	movw	%cx, (%rax,%rdx,2)
	incq	%rdx
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$78:
	cmpq	$256, %rdx
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$79
	movb	$0, %al
	leaq	5912(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$77:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	6424(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$76:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	6936(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$75:
	leaq	176(%rsp), %rsp
	movb	$3, %al
	leaq	7448(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$74:
	leaq	176(%rsp), %rsp
	movb	$4, %al
	leaq	7960(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$73:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	8472(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$72:
	leaq	176(%rsp), %rsp
	movb	$6, %al
	leaq	8984(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$71:
	leaq	176(%rsp), %rsp
	movb	$7, %al
	leaq	9496(%rsp), %rsi
	leaq	24(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$70:
	leaq	176(%rsp), %rsp
	leaq	5912(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$69:
	leaq	6424(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$68:
	leaq	6936(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$67:
	leaq	7448(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$66:
	leaq	7960(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$65:
	leaq	8472(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$64:
	leaq	8984(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$63:
	leaq	9496(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$62:
	leaq	10008(%rsp), %rsi
	leaq	12056(%rsp), %rdx
	leaq	5912(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$61:
	leaq	16(%rsp), %rsp
	leaq	5400(%rsp), %rsi
	leaq	12568(%rsp), %rdx
	leaq	6424(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$60:
	leaq	16(%rsp), %rsp
	leaq	10008(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$59:
	leaq	5400(%rsp), %rsi
	leaq	13080(%rsp), %rdx
	leaq	6936(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$58:
	leaq	16(%rsp), %rsp
	leaq	10008(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$57:
	leaq	5400(%rsp), %rsi
	leaq	13592(%rsp), %rdx
	leaq	7448(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$56:
	leaq	16(%rsp), %rsp
	leaq	10008(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$55:
	leaq	10008(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$53
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$54:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$53:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$54
	leaq	10008(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$52:
	leaq	10520(%rsp), %rsi
	leaq	14104(%rsp), %rdx
	leaq	5912(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$51:
	leaq	16(%rsp), %rsp
	leaq	5400(%rsp), %rsi
	leaq	14616(%rsp), %rdx
	leaq	6424(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$50:
	leaq	16(%rsp), %rsp
	leaq	10520(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$49:
	leaq	5400(%rsp), %rsi
	leaq	15128(%rsp), %rdx
	leaq	6936(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$48:
	leaq	16(%rsp), %rsp
	leaq	10520(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$47:
	leaq	5400(%rsp), %rsi
	leaq	15640(%rsp), %rdx
	leaq	7448(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$46:
	leaq	16(%rsp), %rsp
	leaq	10520(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$45:
	leaq	10520(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$43
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$44:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$43:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$44
	leaq	10520(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$42:
	leaq	11032(%rsp), %rsi
	leaq	16152(%rsp), %rdx
	leaq	5912(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$41:
	leaq	16(%rsp), %rsp
	leaq	5400(%rsp), %rsi
	leaq	16664(%rsp), %rdx
	leaq	6424(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$40:
	leaq	16(%rsp), %rsp
	leaq	11032(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$39:
	leaq	5400(%rsp), %rsi
	leaq	17176(%rsp), %rdx
	leaq	6936(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$38:
	leaq	16(%rsp), %rsp
	leaq	11032(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$37:
	leaq	5400(%rsp), %rsi
	leaq	17688(%rsp), %rdx
	leaq	7448(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$36:
	leaq	16(%rsp), %rsp
	leaq	11032(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$35:
	leaq	11032(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$33
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$34:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$33:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$34
	leaq	11032(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$32:
	leaq	11544(%rsp), %rsi
	leaq	18200(%rsp), %rdx
	leaq	5912(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$31:
	leaq	16(%rsp), %rsp
	leaq	5400(%rsp), %rsi
	leaq	18712(%rsp), %rdx
	leaq	6424(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$30:
	leaq	16(%rsp), %rsp
	leaq	11544(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$29:
	leaq	5400(%rsp), %rsi
	leaq	19224(%rsp), %rdx
	leaq	6936(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$28:
	leaq	16(%rsp), %rsp
	leaq	11544(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$27:
	leaq	5400(%rsp), %rsi
	leaq	19736(%rsp), %rdx
	leaq	7448(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$26:
	leaq	16(%rsp), %rsp
	leaq	11544(%rsp), %rcx
	leaq	5400(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$25:
	leaq	11544(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$23
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$24:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$23:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$24
	leaq	11544(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$22:
	leaq	10008(%rsp), %rcx
	leaq	7960(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$21:
	leaq	10520(%rsp), %rcx
	leaq	8472(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$20:
	leaq	11032(%rsp), %rcx
	leaq	8984(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$19:
	leaq	11544(%rsp), %rcx
	leaq	9496(%rsp), %rsi
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$18:
	leaq	10008(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$16
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$17:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$16:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$17
	leaq	10520(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$14
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$15:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$14:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$15
	leaq	11032(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$12
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$13:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$12:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$13
	leaq	11544(%rsp), %rax
	movq	$0, %r8
	jmp 	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$10
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$11:
	movw	(%rax,%r8,2), %cx
	movswl	%cx, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %cx
	movw	%cx, (%rax,%r8,2)
	incq	%r8
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$10:
	cmpq	$256, %r8
	jb  	Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$11
	movq	8(%rsp), %r10
	movq	16(%rsp), %rsi
	movq	%rsi, %rax
	leaq	5912(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$9:
	leaq	384(%rsi), %rax
	leaq	6424(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$8:
	leaq	768(%rsi), %rax
	leaq	6936(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$7:
	leaq	1152(%rsi), %rax
	leaq	7448(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$6:
	movq	%r10, %rsi
	movq	%rsi, %rax
	leaq	10008(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$5:
	leaq	384(%rsi), %rax
	leaq	10520(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$4:
	leaq	768(%rsi), %rax
	leaq	11032(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$3:
	leaq	1152(%rsi), %rax
	leaq	11544(%rsp), %rcx
	call	L_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$2:
	movq	56(%rsp), %rax
	movq	%rax, 1536(%r10)
	movq	64(%rsp), %rax
	movq	%rax, 1544(%r10)
	movq	72(%rsp), %rax
	movq	%rax, 1552(%r10)
	movq	80(%rsp), %rax
	movq	%rax, 1560(%r10)
	movq	(%rsp), %rax
	movq	(%r10), %rcx
	movq	%rcx, 1536(%rax)
	movq	8(%r10), %rcx
	movq	%rcx, 1544(%rax)
	movq	16(%r10), %rcx
	movq	%rcx, 1552(%rax)
	movq	24(%r10), %rcx
	movq	%rcx, 1560(%rax)
	movq	32(%r10), %rcx
	movq	%rcx, 1568(%rax)
	movq	40(%r10), %rcx
	movq	%rcx, 1576(%rax)
	movq	48(%r10), %rcx
	movq	%rcx, 1584(%rax)
	movq	56(%r10), %rcx
	movq	%rcx, 1592(%rax)
	movq	64(%r10), %rcx
	movq	%rcx, 1600(%rax)
	movq	72(%r10), %rcx
	movq	%rcx, 1608(%rax)
	movq	80(%r10), %rcx
	movq	%rcx, 1616(%rax)
	movq	88(%r10), %rcx
	movq	%rcx, 1624(%rax)
	movq	96(%r10), %rcx
	movq	%rcx, 1632(%rax)
	movq	104(%r10), %rcx
	movq	%rcx, 1640(%rax)
	movq	112(%r10), %rcx
	movq	%rcx, 1648(%rax)
	movq	120(%r10), %rcx
	movq	%rcx, 1656(%rax)
	movq	128(%r10), %rcx
	movq	%rcx, 1664(%rax)
	movq	136(%r10), %rcx
	movq	%rcx, 1672(%rax)
	movq	144(%r10), %rcx
	movq	%rcx, 1680(%rax)
	movq	152(%r10), %rcx
	movq	%rcx, 1688(%rax)
	movq	160(%r10), %rcx
	movq	%rcx, 1696(%rax)
	movq	168(%r10), %rcx
	movq	%rcx, 1704(%rax)
	movq	176(%r10), %rcx
	movq	%rcx, 1712(%rax)
	movq	184(%r10), %rcx
	movq	%rcx, 1720(%rax)
	movq	192(%r10), %rcx
	movq	%rcx, 1728(%rax)
	movq	200(%r10), %rcx
	movq	%rcx, 1736(%rax)
	movq	208(%r10), %rcx
	movq	%rcx, 1744(%rax)
	movq	216(%r10), %rcx
	movq	%rcx, 1752(%rax)
	movq	224(%r10), %rcx
	movq	%rcx, 1760(%rax)
	movq	232(%r10), %rcx
	movq	%rcx, 1768(%rax)
	movq	240(%r10), %rcx
	movq	%rcx, 1776(%rax)
	movq	248(%r10), %rcx
	movq	%rcx, 1784(%rax)
	movq	256(%r10), %rcx
	movq	%rcx, 1792(%rax)
	movq	264(%r10), %rcx
	movq	%rcx, 1800(%rax)
	movq	272(%r10), %rcx
	movq	%rcx, 1808(%rax)
	movq	280(%r10), %rcx
	movq	%rcx, 1816(%rax)
	movq	288(%r10), %rcx
	movq	%rcx, 1824(%rax)
	movq	296(%r10), %rcx
	movq	%rcx, 1832(%rax)
	movq	304(%r10), %rcx
	movq	%rcx, 1840(%rax)
	movq	312(%r10), %rcx
	movq	%rcx, 1848(%rax)
	movq	320(%r10), %rcx
	movq	%rcx, 1856(%rax)
	movq	328(%r10), %rcx
	movq	%rcx, 1864(%rax)
	movq	336(%r10), %rcx
	movq	%rcx, 1872(%rax)
	movq	344(%r10), %rcx
	movq	%rcx, 1880(%rax)
	movq	352(%r10), %rcx
	movq	%rcx, 1888(%rax)
	movq	360(%r10), %rcx
	movq	%rcx, 1896(%rax)
	movq	368(%r10), %rcx
	movq	%rcx, 1904(%rax)
	movq	376(%r10), %rcx
	movq	%rcx, 1912(%rax)
	movq	384(%r10), %rcx
	movq	%rcx, 1920(%rax)
	movq	392(%r10), %rcx
	movq	%rcx, 1928(%rax)
	movq	400(%r10), %rcx
	movq	%rcx, 1936(%rax)
	movq	408(%r10), %rcx
	movq	%rcx, 1944(%rax)
	movq	416(%r10), %rcx
	movq	%rcx, 1952(%rax)
	movq	424(%r10), %rcx
	movq	%rcx, 1960(%rax)
	movq	432(%r10), %rcx
	movq	%rcx, 1968(%rax)
	movq	440(%r10), %rcx
	movq	%rcx, 1976(%rax)
	movq	448(%r10), %rcx
	movq	%rcx, 1984(%rax)
	movq	456(%r10), %rcx
	movq	%rcx, 1992(%rax)
	movq	464(%r10), %rcx
	movq	%rcx, 2000(%rax)
	movq	472(%r10), %rcx
	movq	%rcx, 2008(%rax)
	movq	480(%r10), %rcx
	movq	%rcx, 2016(%rax)
	movq	488(%r10), %rcx
	movq	%rcx, 2024(%rax)
	movq	496(%r10), %rcx
	movq	%rcx, 2032(%rax)
	movq	504(%r10), %rcx
	movq	%rcx, 2040(%rax)
	movq	512(%r10), %rcx
	movq	%rcx, 2048(%rax)
	movq	520(%r10), %rcx
	movq	%rcx, 2056(%rax)
	movq	528(%r10), %rcx
	movq	%rcx, 2064(%rax)
	movq	536(%r10), %rcx
	movq	%rcx, 2072(%rax)
	movq	544(%r10), %rcx
	movq	%rcx, 2080(%rax)
	movq	552(%r10), %rcx
	movq	%rcx, 2088(%rax)
	movq	560(%r10), %rcx
	movq	%rcx, 2096(%rax)
	movq	568(%r10), %rcx
	movq	%rcx, 2104(%rax)
	movq	576(%r10), %rcx
	movq	%rcx, 2112(%rax)
	movq	584(%r10), %rcx
	movq	%rcx, 2120(%rax)
	movq	592(%r10), %rcx
	movq	%rcx, 2128(%rax)
	movq	600(%r10), %rcx
	movq	%rcx, 2136(%rax)
	movq	608(%r10), %rcx
	movq	%rcx, 2144(%rax)
	movq	616(%r10), %rcx
	movq	%rcx, 2152(%rax)
	movq	624(%r10), %rcx
	movq	%rcx, 2160(%rax)
	movq	632(%r10), %rcx
	movq	%rcx, 2168(%rax)
	movq	640(%r10), %rcx
	movq	%rcx, 2176(%rax)
	movq	648(%r10), %rcx
	movq	%rcx, 2184(%rax)
	movq	656(%r10), %rcx
	movq	%rcx, 2192(%rax)
	movq	664(%r10), %rcx
	movq	%rcx, 2200(%rax)
	movq	672(%r10), %rcx
	movq	%rcx, 2208(%rax)
	movq	680(%r10), %rcx
	movq	%rcx, 2216(%rax)
	movq	688(%r10), %rcx
	movq	%rcx, 2224(%rax)
	movq	696(%r10), %rcx
	movq	%rcx, 2232(%rax)
	movq	704(%r10), %rcx
	movq	%rcx, 2240(%rax)
	movq	712(%r10), %rcx
	movq	%rcx, 2248(%rax)
	movq	720(%r10), %rcx
	movq	%rcx, 2256(%rax)
	movq	728(%r10), %rcx
	movq	%rcx, 2264(%rax)
	movq	736(%r10), %rcx
	movq	%rcx, 2272(%rax)
	movq	744(%r10), %rcx
	movq	%rcx, 2280(%rax)
	movq	752(%r10), %rcx
	movq	%rcx, 2288(%rax)
	movq	760(%r10), %rcx
	movq	%rcx, 2296(%rax)
	movq	768(%r10), %rcx
	movq	%rcx, 2304(%rax)
	movq	776(%r10), %rcx
	movq	%rcx, 2312(%rax)
	movq	784(%r10), %rcx
	movq	%rcx, 2320(%rax)
	movq	792(%r10), %rcx
	movq	%rcx, 2328(%rax)
	movq	800(%r10), %rcx
	movq	%rcx, 2336(%rax)
	movq	808(%r10), %rcx
	movq	%rcx, 2344(%rax)
	movq	816(%r10), %rcx
	movq	%rcx, 2352(%rax)
	movq	824(%r10), %rcx
	movq	%rcx, 2360(%rax)
	movq	832(%r10), %rcx
	movq	%rcx, 2368(%rax)
	movq	840(%r10), %rcx
	movq	%rcx, 2376(%rax)
	movq	848(%r10), %rcx
	movq	%rcx, 2384(%rax)
	movq	856(%r10), %rcx
	movq	%rcx, 2392(%rax)
	movq	864(%r10), %rcx
	movq	%rcx, 2400(%rax)
	movq	872(%r10), %rcx
	movq	%rcx, 2408(%rax)
	movq	880(%r10), %rcx
	movq	%rcx, 2416(%rax)
	movq	888(%r10), %rcx
	movq	%rcx, 2424(%rax)
	movq	896(%r10), %rcx
	movq	%rcx, 2432(%rax)
	movq	904(%r10), %rcx
	movq	%rcx, 2440(%rax)
	movq	912(%r10), %rcx
	movq	%rcx, 2448(%rax)
	movq	920(%r10), %rcx
	movq	%rcx, 2456(%rax)
	movq	928(%r10), %rcx
	movq	%rcx, 2464(%rax)
	movq	936(%r10), %rcx
	movq	%rcx, 2472(%rax)
	movq	944(%r10), %rcx
	movq	%rcx, 2480(%rax)
	movq	952(%r10), %rcx
	movq	%rcx, 2488(%rax)
	movq	960(%r10), %rcx
	movq	%rcx, 2496(%rax)
	movq	968(%r10), %rcx
	movq	%rcx, 2504(%rax)
	movq	976(%r10), %rcx
	movq	%rcx, 2512(%rax)
	movq	984(%r10), %rcx
	movq	%rcx, 2520(%rax)
	movq	992(%r10), %rcx
	movq	%rcx, 2528(%rax)
	movq	1000(%r10), %rcx
	movq	%rcx, 2536(%rax)
	movq	1008(%r10), %rcx
	movq	%rcx, 2544(%rax)
	movq	1016(%r10), %rcx
	movq	%rcx, 2552(%rax)
	movq	1024(%r10), %rcx
	movq	%rcx, 2560(%rax)
	movq	1032(%r10), %rcx
	movq	%rcx, 2568(%rax)
	movq	1040(%r10), %rcx
	movq	%rcx, 2576(%rax)
	movq	1048(%r10), %rcx
	movq	%rcx, 2584(%rax)
	movq	1056(%r10), %rcx
	movq	%rcx, 2592(%rax)
	movq	1064(%r10), %rcx
	movq	%rcx, 2600(%rax)
	movq	1072(%r10), %rcx
	movq	%rcx, 2608(%rax)
	movq	1080(%r10), %rcx
	movq	%rcx, 2616(%rax)
	movq	1088(%r10), %rcx
	movq	%rcx, 2624(%rax)
	movq	1096(%r10), %rcx
	movq	%rcx, 2632(%rax)
	movq	1104(%r10), %rcx
	movq	%rcx, 2640(%rax)
	movq	1112(%r10), %rcx
	movq	%rcx, 2648(%rax)
	movq	1120(%r10), %rcx
	movq	%rcx, 2656(%rax)
	movq	1128(%r10), %rcx
	movq	%rcx, 2664(%rax)
	movq	1136(%r10), %rcx
	movq	%rcx, 2672(%rax)
	movq	1144(%r10), %rcx
	movq	%rcx, 2680(%rax)
	movq	1152(%r10), %rcx
	movq	%rcx, 2688(%rax)
	movq	1160(%r10), %rcx
	movq	%rcx, 2696(%rax)
	movq	1168(%r10), %rcx
	movq	%rcx, 2704(%rax)
	movq	1176(%r10), %rcx
	movq	%rcx, 2712(%rax)
	movq	1184(%r10), %rcx
	movq	%rcx, 2720(%rax)
	movq	1192(%r10), %rcx
	movq	%rcx, 2728(%rax)
	movq	1200(%r10), %rcx
	movq	%rcx, 2736(%rax)
	movq	1208(%r10), %rcx
	movq	%rcx, 2744(%rax)
	movq	1216(%r10), %rcx
	movq	%rcx, 2752(%rax)
	movq	1224(%r10), %rcx
	movq	%rcx, 2760(%rax)
	movq	1232(%r10), %rcx
	movq	%rcx, 2768(%rax)
	movq	1240(%r10), %rcx
	movq	%rcx, 2776(%rax)
	movq	1248(%r10), %rcx
	movq	%rcx, 2784(%rax)
	movq	1256(%r10), %rcx
	movq	%rcx, 2792(%rax)
	movq	1264(%r10), %rcx
	movq	%rcx, 2800(%rax)
	movq	1272(%r10), %rcx
	movq	%rcx, 2808(%rax)
	movq	1280(%r10), %rcx
	movq	%rcx, 2816(%rax)
	movq	1288(%r10), %rcx
	movq	%rcx, 2824(%rax)
	movq	1296(%r10), %rcx
	movq	%rcx, 2832(%rax)
	movq	1304(%r10), %rcx
	movq	%rcx, 2840(%rax)
	movq	1312(%r10), %rcx
	movq	%rcx, 2848(%rax)
	movq	1320(%r10), %rcx
	movq	%rcx, 2856(%rax)
	movq	1328(%r10), %rcx
	movq	%rcx, 2864(%rax)
	movq	1336(%r10), %rcx
	movq	%rcx, 2872(%rax)
	movq	1344(%r10), %rcx
	movq	%rcx, 2880(%rax)
	movq	1352(%r10), %rcx
	movq	%rcx, 2888(%rax)
	movq	1360(%r10), %rcx
	movq	%rcx, 2896(%rax)
	movq	1368(%r10), %rcx
	movq	%rcx, 2904(%rax)
	movq	1376(%r10), %rcx
	movq	%rcx, 2912(%rax)
	movq	1384(%r10), %rcx
	movq	%rcx, 2920(%rax)
	movq	1392(%r10), %rcx
	movq	%rcx, 2928(%rax)
	movq	1400(%r10), %rcx
	movq	%rcx, 2936(%rax)
	movq	1408(%r10), %rcx
	movq	%rcx, 2944(%rax)
	movq	1416(%r10), %rcx
	movq	%rcx, 2952(%rax)
	movq	1424(%r10), %rcx
	movq	%rcx, 2960(%rax)
	movq	1432(%r10), %rcx
	movq	%rcx, 2968(%rax)
	movq	1440(%r10), %rcx
	movq	%rcx, 2976(%rax)
	movq	1448(%r10), %rcx
	movq	%rcx, 2984(%rax)
	movq	1456(%r10), %rcx
	movq	%rcx, 2992(%rax)
	movq	1464(%r10), %rcx
	movq	%rcx, 3000(%rax)
	movq	1472(%r10), %rcx
	movq	%rcx, 3008(%rax)
	movq	1480(%r10), %rcx
	movq	%rcx, 3016(%rax)
	movq	1488(%r10), %rcx
	movq	%rcx, 3024(%rax)
	movq	1496(%r10), %rcx
	movq	%rcx, 3032(%rax)
	movq	1504(%r10), %rcx
	movq	%rcx, 3040(%rax)
	movq	1512(%r10), %rcx
	movq	%rcx, 3048(%rax)
	movq	1520(%r10), %rcx
	movq	%rcx, 3056(%rax)
	movq	1528(%r10), %rcx
	movq	%rcx, 3064(%rax)
	movq	1536(%r10), %rcx
	movq	%rcx, 3072(%rax)
	movq	1544(%r10), %rcx
	movq	%rcx, 3080(%rax)
	movq	1552(%r10), %rcx
	movq	%rcx, 3088(%rax)
	movq	1560(%r10), %rcx
	movq	%rcx, 3096(%rax)
	movq	%rax, (%rsp)
	leaq	56(%rsp), %rax
	leaq	-224(%rsp), %rsp
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand$1:
	leaq	224(%rsp), %rsp
	movq	(%rsp), %rax
	movq	56(%rsp), %rcx
	movq	%rcx, 3104(%rax)
	movq	64(%rsp), %rcx
	movq	%rcx, 3112(%rax)
	movq	72(%rsp), %rcx
	movq	%rcx, 3120(%rax)
	movq	80(%rsp), %rcx
	movq	%rcx, 3128(%rax)
	movq	%mm3, %rdx
	leaq	32(%rdx), %rcx
	movq	(%rcx), %rsi
	movq	%rsi, 3136(%rax)
	movq	8(%rcx), %rsi
	movq	%rsi, 3144(%rax)
	movq	16(%rcx), %rsi
	movq	%rsi, 3152(%rax)
	movq	24(%rcx), %rcx
	movq	%rcx, 3160(%rax)
	movq	%mm1, %rdx
	movq	%mm2, %rsi
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
	movq	%rax, 1184(%rdx)
	movq	1856(%rsp), %rax
	movq	%rax, 1192(%rdx)
	movq	1864(%rsp), %rax
	movq	%rax, 1200(%rdx)
	movq	1872(%rsp), %rax
	movq	%rax, 1208(%rdx)
	movq	1880(%rsp), %rax
	movq	%rax, 1216(%rdx)
	movq	1888(%rsp), %rax
	movq	%rax, 1224(%rdx)
	movq	1896(%rsp), %rax
	movq	%rax, 1232(%rdx)
	movq	1904(%rsp), %rax
	movq	%rax, 1240(%rdx)
	movq	1912(%rsp), %rax
	movq	%rax, 1248(%rdx)
	movq	1920(%rsp), %rax
	movq	%rax, 1256(%rdx)
	movq	1928(%rsp), %rax
	movq	%rax, 1264(%rdx)
	movq	1936(%rsp), %rax
	movq	%rax, 1272(%rdx)
	movq	1944(%rsp), %rax
	movq	%rax, 1280(%rdx)
	movq	1952(%rsp), %rax
	movq	%rax, 1288(%rdx)
	movq	1960(%rsp), %rax
	movq	%rax, 1296(%rdx)
	movq	1968(%rsp), %rax
	movq	%rax, 1304(%rdx)
	movq	1976(%rsp), %rax
	movq	%rax, 1312(%rdx)
	movq	1984(%rsp), %rax
	movq	%rax, 1320(%rdx)
	movq	1992(%rsp), %rax
	movq	%rax, 1328(%rdx)
	movq	2000(%rsp), %rax
	movq	%rax, 1336(%rdx)
	movq	2008(%rsp), %rax
	movq	%rax, 1344(%rdx)
	movq	2016(%rsp), %rax
	movq	%rax, 1352(%rdx)
	movq	2024(%rsp), %rax
	movq	%rax, 1360(%rdx)
	movq	2032(%rsp), %rax
	movq	%rax, 1368(%rdx)
	movq	2040(%rsp), %rax
	movq	%rax, 1376(%rdx)
	movq	2048(%rsp), %rax
	movq	%rax, 1384(%rdx)
	movq	2056(%rsp), %rax
	movq	%rax, 1392(%rdx)
	movq	2064(%rsp), %rax
	movq	%rax, 1400(%rdx)
	movq	2072(%rsp), %rax
	movq	%rax, 1408(%rdx)
	movq	2080(%rsp), %rax
	movq	%rax, 1416(%rdx)
	movq	2088(%rsp), %rax
	movq	%rax, 1424(%rdx)
	movq	2096(%rsp), %rax
	movq	%rax, 1432(%rdx)
	movq	2104(%rsp), %rax
	movq	%rax, 1440(%rdx)
	movq	2112(%rsp), %rax
	movq	%rax, 1448(%rdx)
	movq	2120(%rsp), %rax
	movq	%rax, 1456(%rdx)
	movq	2128(%rsp), %rax
	movq	%rax, 1464(%rdx)
	movq	2136(%rsp), %rax
	movq	%rax, 1472(%rdx)
	movq	2144(%rsp), %rax
	movq	%rax, 1480(%rdx)
	movq	2152(%rsp), %rax
	movq	%rax, 1488(%rdx)
	movq	2160(%rsp), %rax
	movq	%rax, 1496(%rdx)
	movq	2168(%rsp), %rax
	movq	%rax, 1504(%rdx)
	movq	2176(%rsp), %rax
	movq	%rax, 1512(%rdx)
	movq	2184(%rsp), %rax
	movq	%rax, 1520(%rdx)
	movq	2192(%rsp), %rax
	movq	%rax, 1528(%rdx)
	movq	2200(%rsp), %rax
	movq	%rax, 1536(%rdx)
	movq	2208(%rsp), %rax
	movq	%rax, 1544(%rdx)
	movq	2216(%rsp), %rax
	movq	%rax, 1552(%rdx)
	movq	2224(%rsp), %rax
	movq	%rax, 1560(%rdx)
	movq	2232(%rsp), %rax
	movq	%rax, (%rsi)
	movq	2240(%rsp), %rax
	movq	%rax, 8(%rsi)
	movq	2248(%rsp), %rax
	movq	%rax, 16(%rsi)
	movq	2256(%rsp), %rax
	movq	%rax, 24(%rsi)
	movq	2264(%rsp), %rax
	movq	%rax, 32(%rsi)
	movq	2272(%rsp), %rax
	movq	%rax, 40(%rsi)
	movq	2280(%rsp), %rax
	movq	%rax, 48(%rsi)
	movq	2288(%rsp), %rax
	movq	%rax, 56(%rsi)
	movq	2296(%rsp), %rax
	movq	%rax, 64(%rsi)
	movq	2304(%rsp), %rax
	movq	%rax, 72(%rsi)
	movq	2312(%rsp), %rax
	movq	%rax, 80(%rsi)
	movq	2320(%rsp), %rax
	movq	%rax, 88(%rsi)
	movq	2328(%rsp), %rax
	movq	%rax, 96(%rsi)
	movq	2336(%rsp), %rax
	movq	%rax, 104(%rsi)
	movq	2344(%rsp), %rax
	movq	%rax, 112(%rsi)
	movq	2352(%rsp), %rax
	movq	%rax, 120(%rsi)
	movq	2360(%rsp), %rax
	movq	%rax, 128(%rsi)
	movq	2368(%rsp), %rax
	movq	%rax, 136(%rsi)
	movq	2376(%rsp), %rax
	movq	%rax, 144(%rsi)
	movq	2384(%rsp), %rax
	movq	%rax, 152(%rsi)
	movq	2392(%rsp), %rax
	movq	%rax, 160(%rsi)
	movq	2400(%rsp), %rax
	movq	%rax, 168(%rsi)
	movq	2408(%rsp), %rax
	movq	%rax, 176(%rsi)
	movq	2416(%rsp), %rax
	movq	%rax, 184(%rsi)
	movq	2424(%rsp), %rax
	movq	%rax, 192(%rsi)
	movq	2432(%rsp), %rax
	movq	%rax, 200(%rsi)
	movq	2440(%rsp), %rax
	movq	%rax, 208(%rsi)
	movq	2448(%rsp), %rax
	movq	%rax, 216(%rsi)
	movq	2456(%rsp), %rax
	movq	%rax, 224(%rsi)
	movq	2464(%rsp), %rax
	movq	%rax, 232(%rsi)
	movq	2472(%rsp), %rax
	movq	%rax, 240(%rsi)
	movq	2480(%rsp), %rax
	movq	%rax, 248(%rsi)
	movq	2488(%rsp), %rax
	movq	%rax, 256(%rsi)
	movq	2496(%rsp), %rax
	movq	%rax, 264(%rsi)
	movq	2504(%rsp), %rax
	movq	%rax, 272(%rsi)
	movq	2512(%rsp), %rax
	movq	%rax, 280(%rsi)
	movq	2520(%rsp), %rax
	movq	%rax, 288(%rsi)
	movq	2528(%rsp), %rax
	movq	%rax, 296(%rsi)
	movq	2536(%rsp), %rax
	movq	%rax, 304(%rsi)
	movq	2544(%rsp), %rax
	movq	%rax, 312(%rsi)
	movq	2552(%rsp), %rax
	movq	%rax, 320(%rsi)
	movq	2560(%rsp), %rax
	movq	%rax, 328(%rsi)
	movq	2568(%rsp), %rax
	movq	%rax, 336(%rsi)
	movq	2576(%rsp), %rax
	movq	%rax, 344(%rsi)
	movq	2584(%rsp), %rax
	movq	%rax, 352(%rsi)
	movq	2592(%rsp), %rax
	movq	%rax, 360(%rsi)
	movq	2600(%rsp), %rax
	movq	%rax, 368(%rsi)
	movq	2608(%rsp), %rax
	movq	%rax, 376(%rsi)
	movq	2616(%rsp), %rax
	movq	%rax, 384(%rsi)
	movq	2624(%rsp), %rax
	movq	%rax, 392(%rsi)
	movq	2632(%rsp), %rax
	movq	%rax, 400(%rsi)
	movq	2640(%rsp), %rax
	movq	%rax, 408(%rsi)
	movq	2648(%rsp), %rax
	movq	%rax, 416(%rsi)
	movq	2656(%rsp), %rax
	movq	%rax, 424(%rsi)
	movq	2664(%rsp), %rax
	movq	%rax, 432(%rsi)
	movq	2672(%rsp), %rax
	movq	%rax, 440(%rsi)
	movq	2680(%rsp), %rax
	movq	%rax, 448(%rsi)
	movq	2688(%rsp), %rax
	movq	%rax, 456(%rsi)
	movq	2696(%rsp), %rax
	movq	%rax, 464(%rsi)
	movq	2704(%rsp), %rax
	movq	%rax, 472(%rsi)
	movq	2712(%rsp), %rax
	movq	%rax, 480(%rsi)
	movq	2720(%rsp), %rax
	movq	%rax, 488(%rsi)
	movq	2728(%rsp), %rax
	movq	%rax, 496(%rsi)
	movq	2736(%rsp), %rax
	movq	%rax, 504(%rsi)
	movq	2744(%rsp), %rax
	movq	%rax, 512(%rsi)
	movq	2752(%rsp), %rax
	movq	%rax, 520(%rsi)
	movq	2760(%rsp), %rax
	movq	%rax, 528(%rsi)
	movq	2768(%rsp), %rax
	movq	%rax, 536(%rsi)
	movq	2776(%rsp), %rax
	movq	%rax, 544(%rsi)
	movq	2784(%rsp), %rax
	movq	%rax, 552(%rsi)
	movq	2792(%rsp), %rax
	movq	%rax, 560(%rsi)
	movq	2800(%rsp), %rax
	movq	%rax, 568(%rsi)
	movq	2808(%rsp), %rax
	movq	%rax, 576(%rsi)
	movq	2816(%rsp), %rax
	movq	%rax, 584(%rsi)
	movq	2824(%rsp), %rax
	movq	%rax, 592(%rsi)
	movq	2832(%rsp), %rax
	movq	%rax, 600(%rsi)
	movq	2840(%rsp), %rax
	movq	%rax, 608(%rsi)
	movq	2848(%rsp), %rax
	movq	%rax, 616(%rsi)
	movq	2856(%rsp), %rax
	movq	%rax, 624(%rsi)
	movq	2864(%rsp), %rax
	movq	%rax, 632(%rsi)
	movq	2872(%rsp), %rax
	movq	%rax, 640(%rsi)
	movq	2880(%rsp), %rax
	movq	%rax, 648(%rsi)
	movq	2888(%rsp), %rax
	movq	%rax, 656(%rsi)
	movq	2896(%rsp), %rax
	movq	%rax, 664(%rsi)
	movq	2904(%rsp), %rax
	movq	%rax, 672(%rsi)
	movq	2912(%rsp), %rax
	movq	%rax, 680(%rsi)
	movq	2920(%rsp), %rax
	movq	%rax, 688(%rsi)
	movq	2928(%rsp), %rax
	movq	%rax, 696(%rsi)
	movq	2936(%rsp), %rax
	movq	%rax, 704(%rsi)
	movq	2944(%rsp), %rax
	movq	%rax, 712(%rsi)
	movq	2952(%rsp), %rax
	movq	%rax, 720(%rsi)
	movq	2960(%rsp), %rax
	movq	%rax, 728(%rsi)
	movq	2968(%rsp), %rax
	movq	%rax, 736(%rsi)
	movq	2976(%rsp), %rax
	movq	%rax, 744(%rsi)
	movq	2984(%rsp), %rax
	movq	%rax, 752(%rsi)
	movq	2992(%rsp), %rax
	movq	%rax, 760(%rsi)
	movq	3000(%rsp), %rax
	movq	%rax, 768(%rsi)
	movq	3008(%rsp), %rax
	movq	%rax, 776(%rsi)
	movq	3016(%rsp), %rax
	movq	%rax, 784(%rsi)
	movq	3024(%rsp), %rax
	movq	%rax, 792(%rsi)
	movq	3032(%rsp), %rax
	movq	%rax, 800(%rsi)
	movq	3040(%rsp), %rax
	movq	%rax, 808(%rsi)
	movq	3048(%rsp), %rax
	movq	%rax, 816(%rsi)
	movq	3056(%rsp), %rax
	movq	%rax, 824(%rsi)
	movq	3064(%rsp), %rax
	movq	%rax, 832(%rsi)
	movq	3072(%rsp), %rax
	movq	%rax, 840(%rsi)
	movq	3080(%rsp), %rax
	movq	%rax, 848(%rsi)
	movq	3088(%rsp), %rax
	movq	%rax, 856(%rsi)
	movq	3096(%rsp), %rax
	movq	%rax, 864(%rsi)
	movq	3104(%rsp), %rax
	movq	%rax, 872(%rsi)
	movq	3112(%rsp), %rax
	movq	%rax, 880(%rsi)
	movq	3120(%rsp), %rax
	movq	%rax, 888(%rsi)
	movq	3128(%rsp), %rax
	movq	%rax, 896(%rsi)
	movq	3136(%rsp), %rax
	movq	%rax, 904(%rsi)
	movq	3144(%rsp), %rax
	movq	%rax, 912(%rsi)
	movq	3152(%rsp), %rax
	movq	%rax, 920(%rsi)
	movq	3160(%rsp), %rax
	movq	%rax, 928(%rsi)
	movq	3168(%rsp), %rax
	movq	%rax, 936(%rsi)
	movq	3176(%rsp), %rax
	movq	%rax, 944(%rsi)
	movq	3184(%rsp), %rax
	movq	%rax, 952(%rsi)
	movq	3192(%rsp), %rax
	movq	%rax, 960(%rsi)
	movq	3200(%rsp), %rax
	movq	%rax, 968(%rsi)
	movq	3208(%rsp), %rax
	movq	%rax, 976(%rsi)
	movq	3216(%rsp), %rax
	movq	%rax, 984(%rsi)
	movq	3224(%rsp), %rax
	movq	%rax, 992(%rsi)
	movq	3232(%rsp), %rax
	movq	%rax, 1000(%rsi)
	movq	3240(%rsp), %rax
	movq	%rax, 1008(%rsi)
	movq	3248(%rsp), %rax
	movq	%rax, 1016(%rsi)
	movq	3256(%rsp), %rax
	movq	%rax, 1024(%rsi)
	movq	3264(%rsp), %rax
	movq	%rax, 1032(%rsi)
	movq	3272(%rsp), %rax
	movq	%rax, 1040(%rsi)
	movq	3280(%rsp), %rax
	movq	%rax, 1048(%rsi)
	movq	3288(%rsp), %rax
	movq	%rax, 1056(%rsi)
	movq	3296(%rsp), %rax
	movq	%rax, 1064(%rsi)
	movq	3304(%rsp), %rax
	movq	%rax, 1072(%rsi)
	movq	3312(%rsp), %rax
	movq	%rax, 1080(%rsi)
	movq	3320(%rsp), %rax
	movq	%rax, 1088(%rsi)
	movq	3328(%rsp), %rax
	movq	%rax, 1096(%rsi)
	movq	3336(%rsp), %rax
	movq	%rax, 1104(%rsi)
	movq	3344(%rsp), %rax
	movq	%rax, 1112(%rsi)
	movq	3352(%rsp), %rax
	movq	%rax, 1120(%rsi)
	movq	3360(%rsp), %rax
	movq	%rax, 1128(%rsi)
	movq	3368(%rsp), %rax
	movq	%rax, 1136(%rsi)
	movq	3376(%rsp), %rax
	movq	%rax, 1144(%rsi)
	movq	3384(%rsp), %rax
	movq	%rax, 1152(%rsi)
	movq	3392(%rsp), %rax
	movq	%rax, 1160(%rsi)
	movq	3400(%rsp), %rax
	movq	%rax, 1168(%rsi)
	movq	3408(%rsp), %rax
	movq	%rax, 1176(%rsi)
	movq	3416(%rsp), %rax
	movq	%rax, 1184(%rsi)
	movq	3424(%rsp), %rax
	movq	%rax, 1192(%rsi)
	movq	3432(%rsp), %rax
	movq	%rax, 1200(%rsi)
	movq	3440(%rsp), %rax
	movq	%rax, 1208(%rsi)
	movq	3448(%rsp), %rax
	movq	%rax, 1216(%rsi)
	movq	3456(%rsp), %rax
	movq	%rax, 1224(%rsi)
	movq	3464(%rsp), %rax
	movq	%rax, 1232(%rsi)
	movq	3472(%rsp), %rax
	movq	%rax, 1240(%rsi)
	movq	3480(%rsp), %rax
	movq	%rax, 1248(%rsi)
	movq	3488(%rsp), %rax
	movq	%rax, 1256(%rsi)
	movq	3496(%rsp), %rax
	movq	%rax, 1264(%rsi)
	movq	3504(%rsp), %rax
	movq	%rax, 1272(%rsi)
	movq	3512(%rsp), %rax
	movq	%rax, 1280(%rsi)
	movq	3520(%rsp), %rax
	movq	%rax, 1288(%rsi)
	movq	3528(%rsp), %rax
	movq	%rax, 1296(%rsi)
	movq	3536(%rsp), %rax
	movq	%rax, 1304(%rsi)
	movq	3544(%rsp), %rax
	movq	%rax, 1312(%rsi)
	movq	3552(%rsp), %rax
	movq	%rax, 1320(%rsi)
	movq	3560(%rsp), %rax
	movq	%rax, 1328(%rsi)
	movq	3568(%rsp), %rax
	movq	%rax, 1336(%rsi)
	movq	3576(%rsp), %rax
	movq	%rax, 1344(%rsi)
	movq	3584(%rsp), %rax
	movq	%rax, 1352(%rsi)
	movq	3592(%rsp), %rax
	movq	%rax, 1360(%rsi)
	movq	3600(%rsp), %rax
	movq	%rax, 1368(%rsi)
	movq	3608(%rsp), %rax
	movq	%rax, 1376(%rsi)
	movq	3616(%rsp), %rax
	movq	%rax, 1384(%rsi)
	movq	3624(%rsp), %rax
	movq	%rax, 1392(%rsi)
	movq	3632(%rsp), %rax
	movq	%rax, 1400(%rsi)
	movq	3640(%rsp), %rax
	movq	%rax, 1408(%rsi)
	movq	3648(%rsp), %rax
	movq	%rax, 1416(%rsi)
	movq	3656(%rsp), %rax
	movq	%rax, 1424(%rsi)
	movq	3664(%rsp), %rax
	movq	%rax, 1432(%rsi)
	movq	3672(%rsp), %rax
	movq	%rax, 1440(%rsi)
	movq	3680(%rsp), %rax
	movq	%rax, 1448(%rsi)
	movq	3688(%rsp), %rax
	movq	%rax, 1456(%rsi)
	movq	3696(%rsp), %rax
	movq	%rax, 1464(%rsi)
	movq	3704(%rsp), %rax
	movq	%rax, 1472(%rsi)
	movq	3712(%rsp), %rax
	movq	%rax, 1480(%rsi)
	movq	3720(%rsp), %rax
	movq	%rax, 1488(%rsi)
	movq	3728(%rsp), %rax
	movq	%rax, 1496(%rsi)
	movq	3736(%rsp), %rax
	movq	%rax, 1504(%rsi)
	movq	3744(%rsp), %rax
	movq	%rax, 1512(%rsi)
	movq	3752(%rsp), %rax
	movq	%rax, 1520(%rsi)
	movq	3760(%rsp), %rax
	movq	%rax, 1528(%rsi)
	movq	3768(%rsp), %rax
	movq	%rax, 1536(%rsi)
	movq	3776(%rsp), %rax
	movq	%rax, 1544(%rsi)
	movq	3784(%rsp), %rax
	movq	%rax, 1552(%rsi)
	movq	3792(%rsp), %rax
	movq	%rax, 1560(%rsi)
	movq	3800(%rsp), %rax
	movq	%rax, 1568(%rsi)
	movq	3808(%rsp), %rax
	movq	%rax, 1576(%rsi)
	movq	3816(%rsp), %rax
	movq	%rax, 1584(%rsi)
	movq	3824(%rsp), %rax
	movq	%rax, 1592(%rsi)
	movq	3832(%rsp), %rax
	movq	%rax, 1600(%rsi)
	movq	3840(%rsp), %rax
	movq	%rax, 1608(%rsi)
	movq	3848(%rsp), %rax
	movq	%rax, 1616(%rsi)
	movq	3856(%rsp), %rax
	movq	%rax, 1624(%rsi)
	movq	3864(%rsp), %rax
	movq	%rax, 1632(%rsi)
	movq	3872(%rsp), %rax
	movq	%rax, 1640(%rsi)
	movq	3880(%rsp), %rax
	movq	%rax, 1648(%rsi)
	movq	3888(%rsp), %rax
	movq	%rax, 1656(%rsi)
	movq	3896(%rsp), %rax
	movq	%rax, 1664(%rsi)
	movq	3904(%rsp), %rax
	movq	%rax, 1672(%rsi)
	movq	3912(%rsp), %rax
	movq	%rax, 1680(%rsi)
	movq	3920(%rsp), %rax
	movq	%rax, 1688(%rsi)
	movq	3928(%rsp), %rax
	movq	%rax, 1696(%rsi)
	movq	3936(%rsp), %rax
	movq	%rax, 1704(%rsi)
	movq	3944(%rsp), %rax
	movq	%rax, 1712(%rsi)
	movq	3952(%rsp), %rax
	movq	%rax, 1720(%rsi)
	movq	3960(%rsp), %rax
	movq	%rax, 1728(%rsi)
	movq	3968(%rsp), %rax
	movq	%rax, 1736(%rsi)
	movq	3976(%rsp), %rax
	movq	%rax, 1744(%rsi)
	movq	3984(%rsp), %rax
	movq	%rax, 1752(%rsi)
	movq	3992(%rsp), %rax
	movq	%rax, 1760(%rsi)
	movq	4000(%rsp), %rax
	movq	%rax, 1768(%rsi)
	movq	4008(%rsp), %rax
	movq	%rax, 1776(%rsi)
	movq	4016(%rsp), %rax
	movq	%rax, 1784(%rsi)
	movq	4024(%rsp), %rax
	movq	%rax, 1792(%rsi)
	movq	4032(%rsp), %rax
	movq	%rax, 1800(%rsi)
	movq	4040(%rsp), %rax
	movq	%rax, 1808(%rsi)
	movq	4048(%rsp), %rax
	movq	%rax, 1816(%rsi)
	movq	4056(%rsp), %rax
	movq	%rax, 1824(%rsi)
	movq	4064(%rsp), %rax
	movq	%rax, 1832(%rsi)
	movq	4072(%rsp), %rax
	movq	%rax, 1840(%rsi)
	movq	4080(%rsp), %rax
	movq	%rax, 1848(%rsi)
	movq	4088(%rsp), %rax
	movq	%rax, 1856(%rsi)
	movq	4096(%rsp), %rax
	movq	%rax, 1864(%rsi)
	movq	4104(%rsp), %rax
	movq	%rax, 1872(%rsi)
	movq	4112(%rsp), %rax
	movq	%rax, 1880(%rsi)
	movq	4120(%rsp), %rax
	movq	%rax, 1888(%rsi)
	movq	4128(%rsp), %rax
	movq	%rax, 1896(%rsi)
	movq	4136(%rsp), %rax
	movq	%rax, 1904(%rsi)
	movq	4144(%rsp), %rax
	movq	%rax, 1912(%rsi)
	movq	4152(%rsp), %rax
	movq	%rax, 1920(%rsi)
	movq	4160(%rsp), %rax
	movq	%rax, 1928(%rsi)
	movq	4168(%rsp), %rax
	movq	%rax, 1936(%rsi)
	movq	4176(%rsp), %rax
	movq	%rax, 1944(%rsi)
	movq	4184(%rsp), %rax
	movq	%rax, 1952(%rsi)
	movq	4192(%rsp), %rax
	movq	%rax, 1960(%rsi)
	movq	4200(%rsp), %rax
	movq	%rax, 1968(%rsi)
	movq	4208(%rsp), %rax
	movq	%rax, 1976(%rsi)
	movq	4216(%rsp), %rax
	movq	%rax, 1984(%rsi)
	movq	4224(%rsp), %rax
	movq	%rax, 1992(%rsi)
	movq	4232(%rsp), %rax
	movq	%rax, 2000(%rsi)
	movq	4240(%rsp), %rax
	movq	%rax, 2008(%rsi)
	movq	4248(%rsp), %rax
	movq	%rax, 2016(%rsi)
	movq	4256(%rsp), %rax
	movq	%rax, 2024(%rsi)
	movq	4264(%rsp), %rax
	movq	%rax, 2032(%rsi)
	movq	4272(%rsp), %rax
	movq	%rax, 2040(%rsi)
	movq	4280(%rsp), %rax
	movq	%rax, 2048(%rsi)
	movq	4288(%rsp), %rax
	movq	%rax, 2056(%rsi)
	movq	4296(%rsp), %rax
	movq	%rax, 2064(%rsi)
	movq	4304(%rsp), %rax
	movq	%rax, 2072(%rsi)
	movq	4312(%rsp), %rax
	movq	%rax, 2080(%rsi)
	movq	4320(%rsp), %rax
	movq	%rax, 2088(%rsi)
	movq	4328(%rsp), %rax
	movq	%rax, 2096(%rsi)
	movq	4336(%rsp), %rax
	movq	%rax, 2104(%rsi)
	movq	4344(%rsp), %rax
	movq	%rax, 2112(%rsi)
	movq	4352(%rsp), %rax
	movq	%rax, 2120(%rsi)
	movq	4360(%rsp), %rax
	movq	%rax, 2128(%rsi)
	movq	4368(%rsp), %rax
	movq	%rax, 2136(%rsi)
	movq	4376(%rsp), %rax
	movq	%rax, 2144(%rsi)
	movq	4384(%rsp), %rax
	movq	%rax, 2152(%rsi)
	movq	4392(%rsp), %rax
	movq	%rax, 2160(%rsi)
	movq	4400(%rsp), %rax
	movq	%rax, 2168(%rsi)
	movq	4408(%rsp), %rax
	movq	%rax, 2176(%rsi)
	movq	4416(%rsp), %rax
	movq	%rax, 2184(%rsi)
	movq	4424(%rsp), %rax
	movq	%rax, 2192(%rsi)
	movq	4432(%rsp), %rax
	movq	%rax, 2200(%rsi)
	movq	4440(%rsp), %rax
	movq	%rax, 2208(%rsi)
	movq	4448(%rsp), %rax
	movq	%rax, 2216(%rsi)
	movq	4456(%rsp), %rax
	movq	%rax, 2224(%rsi)
	movq	4464(%rsp), %rax
	movq	%rax, 2232(%rsi)
	movq	4472(%rsp), %rax
	movq	%rax, 2240(%rsi)
	movq	4480(%rsp), %rax
	movq	%rax, 2248(%rsi)
	movq	4488(%rsp), %rax
	movq	%rax, 2256(%rsi)
	movq	4496(%rsp), %rax
	movq	%rax, 2264(%rsi)
	movq	4504(%rsp), %rax
	movq	%rax, 2272(%rsi)
	movq	4512(%rsp), %rax
	movq	%rax, 2280(%rsi)
	movq	4520(%rsp), %rax
	movq	%rax, 2288(%rsi)
	movq	4528(%rsp), %rax
	movq	%rax, 2296(%rsi)
	movq	4536(%rsp), %rax
	movq	%rax, 2304(%rsi)
	movq	4544(%rsp), %rax
	movq	%rax, 2312(%rsi)
	movq	4552(%rsp), %rax
	movq	%rax, 2320(%rsi)
	movq	4560(%rsp), %rax
	movq	%rax, 2328(%rsi)
	movq	4568(%rsp), %rax
	movq	%rax, 2336(%rsi)
	movq	4576(%rsp), %rax
	movq	%rax, 2344(%rsi)
	movq	4584(%rsp), %rax
	movq	%rax, 2352(%rsi)
	movq	4592(%rsp), %rax
	movq	%rax, 2360(%rsi)
	movq	4600(%rsp), %rax
	movq	%rax, 2368(%rsi)
	movq	4608(%rsp), %rax
	movq	%rax, 2376(%rsi)
	movq	4616(%rsp), %rax
	movq	%rax, 2384(%rsi)
	movq	4624(%rsp), %rax
	movq	%rax, 2392(%rsi)
	movq	4632(%rsp), %rax
	movq	%rax, 2400(%rsi)
	movq	4640(%rsp), %rax
	movq	%rax, 2408(%rsi)
	movq	4648(%rsp), %rax
	movq	%rax, 2416(%rsi)
	movq	4656(%rsp), %rax
	movq	%rax, 2424(%rsi)
	movq	4664(%rsp), %rax
	movq	%rax, 2432(%rsi)
	movq	4672(%rsp), %rax
	movq	%rax, 2440(%rsi)
	movq	4680(%rsp), %rax
	movq	%rax, 2448(%rsi)
	movq	4688(%rsp), %rax
	movq	%rax, 2456(%rsi)
	movq	4696(%rsp), %rax
	movq	%rax, 2464(%rsi)
	movq	4704(%rsp), %rax
	movq	%rax, 2472(%rsi)
	movq	4712(%rsp), %rax
	movq	%rax, 2480(%rsi)
	movq	4720(%rsp), %rax
	movq	%rax, 2488(%rsi)
	movq	4728(%rsp), %rax
	movq	%rax, 2496(%rsi)
	movq	4736(%rsp), %rax
	movq	%rax, 2504(%rsi)
	movq	4744(%rsp), %rax
	movq	%rax, 2512(%rsi)
	movq	4752(%rsp), %rax
	movq	%rax, 2520(%rsi)
	movq	4760(%rsp), %rax
	movq	%rax, 2528(%rsi)
	movq	4768(%rsp), %rax
	movq	%rax, 2536(%rsi)
	movq	4776(%rsp), %rax
	movq	%rax, 2544(%rsi)
	movq	4784(%rsp), %rax
	movq	%rax, 2552(%rsi)
	movq	4792(%rsp), %rax
	movq	%rax, 2560(%rsi)
	movq	4800(%rsp), %rax
	movq	%rax, 2568(%rsi)
	movq	4808(%rsp), %rax
	movq	%rax, 2576(%rsi)
	movq	4816(%rsp), %rax
	movq	%rax, 2584(%rsi)
	movq	4824(%rsp), %rax
	movq	%rax, 2592(%rsi)
	movq	4832(%rsp), %rax
	movq	%rax, 2600(%rsi)
	movq	4840(%rsp), %rax
	movq	%rax, 2608(%rsi)
	movq	4848(%rsp), %rax
	movq	%rax, 2616(%rsi)
	movq	4856(%rsp), %rax
	movq	%rax, 2624(%rsi)
	movq	4864(%rsp), %rax
	movq	%rax, 2632(%rsi)
	movq	4872(%rsp), %rax
	movq	%rax, 2640(%rsi)
	movq	4880(%rsp), %rax
	movq	%rax, 2648(%rsi)
	movq	4888(%rsp), %rax
	movq	%rax, 2656(%rsi)
	movq	4896(%rsp), %rax
	movq	%rax, 2664(%rsi)
	movq	4904(%rsp), %rax
	movq	%rax, 2672(%rsi)
	movq	4912(%rsp), %rax
	movq	%rax, 2680(%rsi)
	movq	4920(%rsp), %rax
	movq	%rax, 2688(%rsi)
	movq	4928(%rsp), %rax
	movq	%rax, 2696(%rsi)
	movq	4936(%rsp), %rax
	movq	%rax, 2704(%rsi)
	movq	4944(%rsp), %rax
	movq	%rax, 2712(%rsi)
	movq	4952(%rsp), %rax
	movq	%rax, 2720(%rsi)
	movq	4960(%rsp), %rax
	movq	%rax, 2728(%rsi)
	movq	4968(%rsp), %rax
	movq	%rax, 2736(%rsi)
	movq	4976(%rsp), %rax
	movq	%rax, 2744(%rsi)
	movq	4984(%rsp), %rax
	movq	%rax, 2752(%rsi)
	movq	4992(%rsp), %rax
	movq	%rax, 2760(%rsi)
	movq	5000(%rsp), %rax
	movq	%rax, 2768(%rsi)
	movq	5008(%rsp), %rax
	movq	%rax, 2776(%rsi)
	movq	5016(%rsp), %rax
	movq	%rax, 2784(%rsi)
	movq	5024(%rsp), %rax
	movq	%rax, 2792(%rsi)
	movq	5032(%rsp), %rax
	movq	%rax, 2800(%rsi)
	movq	5040(%rsp), %rax
	movq	%rax, 2808(%rsi)
	movq	5048(%rsp), %rax
	movq	%rax, 2816(%rsi)
	movq	5056(%rsp), %rax
	movq	%rax, 2824(%rsi)
	movq	5064(%rsp), %rax
	movq	%rax, 2832(%rsi)
	movq	5072(%rsp), %rax
	movq	%rax, 2840(%rsi)
	movq	5080(%rsp), %rax
	movq	%rax, 2848(%rsi)
	movq	5088(%rsp), %rax
	movq	%rax, 2856(%rsi)
	movq	5096(%rsp), %rax
	movq	%rax, 2864(%rsi)
	movq	5104(%rsp), %rax
	movq	%rax, 2872(%rsi)
	movq	5112(%rsp), %rax
	movq	%rax, 2880(%rsi)
	movq	5120(%rsp), %rax
	movq	%rax, 2888(%rsi)
	movq	5128(%rsp), %rax
	movq	%rax, 2896(%rsi)
	movq	5136(%rsp), %rax
	movq	%rax, 2904(%rsi)
	movq	5144(%rsp), %rax
	movq	%rax, 2912(%rsi)
	movq	5152(%rsp), %rax
	movq	%rax, 2920(%rsi)
	movq	5160(%rsp), %rax
	movq	%rax, 2928(%rsi)
	movq	5168(%rsp), %rax
	movq	%rax, 2936(%rsi)
	movq	5176(%rsp), %rax
	movq	%rax, 2944(%rsi)
	movq	5184(%rsp), %rax
	movq	%rax, 2952(%rsi)
	movq	5192(%rsp), %rax
	movq	%rax, 2960(%rsi)
	movq	5200(%rsp), %rax
	movq	%rax, 2968(%rsi)
	movq	5208(%rsp), %rax
	movq	%rax, 2976(%rsi)
	movq	5216(%rsp), %rax
	movq	%rax, 2984(%rsi)
	movq	5224(%rsp), %rax
	movq	%rax, 2992(%rsi)
	movq	5232(%rsp), %rax
	movq	%rax, 3000(%rsi)
	movq	5240(%rsp), %rax
	movq	%rax, 3008(%rsi)
	movq	5248(%rsp), %rax
	movq	%rax, 3016(%rsi)
	movq	5256(%rsp), %rax
	movq	%rax, 3024(%rsi)
	movq	5264(%rsp), %rax
	movq	%rax, 3032(%rsi)
	movq	5272(%rsp), %rax
	movq	%rax, 3040(%rsi)
	movq	5280(%rsp), %rax
	movq	%rax, 3048(%rsi)
	movq	5288(%rsp), %rax
	movq	%rax, 3056(%rsi)
	movq	5296(%rsp), %rax
	movq	%rax, 3064(%rsi)
	movq	5304(%rsp), %rax
	movq	%rax, 3072(%rsi)
	movq	5312(%rsp), %rax
	movq	%rax, 3080(%rsi)
	movq	5320(%rsp), %rax
	movq	%rax, 3088(%rsi)
	movq	5328(%rsp), %rax
	movq	%rax, 3096(%rsi)
	movq	5336(%rsp), %rax
	movq	%rax, 3104(%rsi)
	movq	5344(%rsp), %rax
	movq	%rax, 3112(%rsi)
	movq	5352(%rsp), %rax
	movq	%rax, 3120(%rsi)
	movq	5360(%rsp), %rax
	movq	%rax, 3128(%rsi)
	movq	5368(%rsp), %rax
	movq	%rax, 3136(%rsi)
	movq	5376(%rsp), %rax
	movq	%rax, 3144(%rsi)
	movq	5384(%rsp), %rax
	movq	%rax, 3152(%rsi)
	movq	5392(%rsp), %rax
	movq	%rax, 3160(%rsi)
	xorl	%eax, %eax
	movq	20248(%rsp), %rbx
	movq	20256(%rsp), %rbp
	movq	20264(%rsp), %r12
	movq	20272(%rsp), %r13
	movq	20280(%rsp), %r14
	movq	20288(%rsp), %r15
	movq	20296(%rsp), %rsp
	ret
L_i_poly_decompress$1:
	movq	$0, %r8
	movq	$0, %rdi
	jmp 	L_i_poly_decompress$2
L_i_poly_decompress$3:
	movb	(%rdx,%r8), %r9b
	movb	%r9b, %sil
	incq	%r8
	shrb	$5, %r9b
	movb	(%rdx,%r8), %r10b
	movb	%r10b, %r13b
	shlb	$3, %r10b
	orb 	%r10b, %r9b
	incq	%r8
	shrb	$2, %r13b
	movb	%r13b, %r10b
	shrb	$5, %r13b
	movb	(%rdx,%r8), %r11b
	movb	%r11b, %bpl
	shlb	$1, %r11b
	orb 	%r13b, %r11b
	incq	%r8
	shrb	$4, %bpl
	movb	(%rdx,%r8), %r12b
	movb	%r12b, %r13b
	shlb	$4, %r12b
	orb 	%bpl, %r12b
	movb	%r12b, %bpl
	incq	%r8
	movb	%r13b, %r14b
	shrb	$1, %r14b
	movb	%r14b, %r12b
	shrb	$5, %r14b
	movb	(%rdx,%r8), %r15b
	movb	%r15b, %r13b
	shlb	$2, %r15b
	orb 	%r14b, %r15b
	movb	%r15b, %r14b
	incq	%r8
	shrb	$3, %r13b
	movzbl	%sil, %esi
	andl	$31, %esi
	imull	$3329, %esi, %esi
	addl	$16, %esi
	shrl	$5, %esi
	movw	%si, (%rcx,%rdi,2)
	movzbl	%r9b, %esi
	andl	$31, %esi
	imull	$3329, %esi, %esi
	addl	$16, %esi
	shrl	$5, %esi
	movw	%si, 2(%rcx,%rdi,2)
	movzbl	%r10b, %esi
	andl	$31, %esi
	imull	$3329, %esi, %esi
	addl	$16, %esi
	shrl	$5, %esi
	movw	%si, 4(%rcx,%rdi,2)
	movzbl	%r11b, %esi
	andl	$31, %esi
	imull	$3329, %esi, %esi
	addl	$16, %esi
	shrl	$5, %esi
	movw	%si, 6(%rcx,%rdi,2)
	movzbl	%bpl, %esi
	andl	$31, %esi
	imull	$3329, %esi, %esi
	addl	$16, %esi
	shrl	$5, %esi
	movw	%si, 8(%rcx,%rdi,2)
	movzbl	%r12b, %esi
	andl	$31, %esi
	imull	$3329, %esi, %esi
	addl	$16, %esi
	shrl	$5, %esi
	movw	%si, 10(%rcx,%rdi,2)
	movzbl	%r14b, %esi
	andl	$31, %esi
	imull	$3329, %esi, %esi
	addl	$16, %esi
	shrl	$5, %esi
	movw	%si, 12(%rcx,%rdi,2)
	movzbl	%r13b, %esi
	andl	$31, %esi
	imull	$3329, %esi, %esi
	addl	$16, %esi
	shrl	$5, %esi
	movw	%si, 14(%rcx,%rdi,2)
	addq	$8, %rdi
L_i_poly_decompress$2:
	cmpq	$256, %rdi
	jb  	L_i_poly_decompress$3
	ret
L_i_poly_compress$1:
	call	L_poly_csubq$1
L_i_poly_compress$4:
	movq	$0, %rdx
	movq	$0, %rdi
	jmp 	L_i_poly_compress$2
L_i_poly_compress$3:
	movw	(%rcx,%rdi,2), %si
	movzwl	%si, %esi
	shll	$5, %esi
	addl	$1664, %esi
	imull	$40318, %esi, %esi
	shrl	$27, %esi
	andl	$31, %esi
	movw	2(%rcx,%rdi,2), %r8w
	movzwl	%r8w, %r8d
	shll	$5, %r8d
	addl	$1664, %r8d
	imull	$40318, %r8d, %r8d
	shrl	$27, %r8d
	andl	$31, %r8d
	movb	%r8b, %r9b
	movw	4(%rcx,%rdi,2), %r8w
	movzwl	%r8w, %r8d
	shll	$5, %r8d
	addl	$1664, %r8d
	imull	$40318, %r8d, %r8d
	shrl	$27, %r8d
	andl	$31, %r8d
	movb	%r8b, %r10b
	movw	6(%rcx,%rdi,2), %r8w
	movzwl	%r8w, %r8d
	shll	$5, %r8d
	addl	$1664, %r8d
	imull	$40318, %r8d, %r8d
	shrl	$27, %r8d
	andl	$31, %r8d
	movb	%r8b, %r11b
	movw	8(%rcx,%rdi,2), %r8w
	movzwl	%r8w, %r8d
	shll	$5, %r8d
	addl	$1664, %r8d
	imull	$40318, %r8d, %r8d
	shrl	$27, %r8d
	andl	$31, %r8d
	movb	%r8b, %bpl
	movw	10(%rcx,%rdi,2), %r8w
	movzwl	%r8w, %r8d
	shll	$5, %r8d
	addl	$1664, %r8d
	imull	$40318, %r8d, %r8d
	shrl	$27, %r8d
	andl	$31, %r8d
	movb	%r8b, %bl
	movw	12(%rcx,%rdi,2), %r8w
	movzwl	%r8w, %r8d
	shll	$5, %r8d
	addl	$1664, %r8d
	imull	$40318, %r8d, %r8d
	shrl	$27, %r8d
	andl	$31, %r8d
	movb	%r8b, %r14b
	movw	14(%rcx,%rdi,2), %r8w
	movzwl	%r8w, %r8d
	shll	$5, %r8d
	addl	$1664, %r8d
	imull	$40318, %r8d, %r8d
	shrl	$27, %r8d
	andl	$31, %r8d
	movb	%r8b, %r12b
	movb	%r9b, %r13b
	shlb	$5, %r13b
	orb 	%r13b, %sil
	movb	%sil, (%rax,%rdx)
	shrb	$3, %r9b
	shlb	$2, %r10b
	movb	%r11b, %r13b
	shlb	$7, %r13b
	orb 	%r10b, %r9b
	orb 	%r13b, %r9b
	movb	%r9b, 1(%rax,%rdx)
	shrb	$1, %r11b
	movb	%bpl, %sil
	shlb	$4, %sil
	orb 	%sil, %r11b
	movb	%r11b, 2(%rax,%rdx)
	shrb	$4, %bpl
	shlb	$1, %bl
	movb	%r14b, %r13b
	shlb	$6, %r13b
	orb 	%bl, %bpl
	orb 	%r13b, %bpl
	movb	%bpl, 3(%rax,%rdx)
	shrb	$2, %r14b
	shlb	$3, %r12b
	orb 	%r12b, %r14b
	movb	%r14b, 4(%rax,%rdx)
	addq	$5, %rdx
	addq	$8, %rdi
L_i_poly_compress$2:
	cmpq	$256, %rdi
	jb  	L_i_poly_compress$3
	ret
L_i_poly_tomsg$1:
	call	L_poly_csubq$1
L_i_poly_tomsg$2:
	movb	$0, %dl
	movw	(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	2(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	4(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	6(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	8(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	10(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	12(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	14(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, (%rax)
	movb	$0, %dl
	movw	16(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	18(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	20(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	22(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	24(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	26(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	28(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	30(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 1(%rax)
	movb	$0, %dl
	movw	32(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	34(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	36(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	38(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	40(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	42(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	44(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	46(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 2(%rax)
	movb	$0, %dl
	movw	48(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	50(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	52(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	54(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	56(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	58(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	60(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	62(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 3(%rax)
	movb	$0, %dl
	movw	64(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	66(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	68(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	70(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	72(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	74(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	76(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	78(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 4(%rax)
	movb	$0, %dl
	movw	80(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	82(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	84(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	86(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	88(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	90(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	92(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	94(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 5(%rax)
	movb	$0, %dl
	movw	96(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	98(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	100(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	102(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	104(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	106(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	108(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	110(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 6(%rax)
	movb	$0, %dl
	movw	112(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	114(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	116(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	118(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	120(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	122(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	124(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	126(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 7(%rax)
	movb	$0, %dl
	movw	128(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	130(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	132(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	134(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	136(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	138(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	140(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	142(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 8(%rax)
	movb	$0, %dl
	movw	144(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	146(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	148(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	150(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	152(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	154(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	156(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	158(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 9(%rax)
	movb	$0, %dl
	movw	160(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	162(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	164(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	166(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	168(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	170(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	172(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	174(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 10(%rax)
	movb	$0, %dl
	movw	176(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	178(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	180(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	182(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	184(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	186(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	188(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	190(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 11(%rax)
	movb	$0, %dl
	movw	192(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	194(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	196(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	198(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	200(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	202(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	204(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	206(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 12(%rax)
	movb	$0, %dl
	movw	208(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	210(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	212(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	214(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	216(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	218(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	220(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	222(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 13(%rax)
	movb	$0, %dl
	movw	224(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	226(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	228(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	230(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	232(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	234(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	236(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	238(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 14(%rax)
	movb	$0, %dl
	movw	240(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	242(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	244(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	246(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	248(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	250(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	252(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	254(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 15(%rax)
	movb	$0, %dl
	movw	256(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	258(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	260(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	262(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	264(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	266(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	268(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	270(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 16(%rax)
	movb	$0, %dl
	movw	272(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	274(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	276(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	278(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	280(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	282(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	284(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	286(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 17(%rax)
	movb	$0, %dl
	movw	288(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	290(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	292(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	294(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	296(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	298(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	300(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	302(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 18(%rax)
	movb	$0, %dl
	movw	304(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	306(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	308(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	310(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	312(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	314(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	316(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	318(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 19(%rax)
	movb	$0, %dl
	movw	320(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	322(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	324(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	326(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	328(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	330(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	332(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	334(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 20(%rax)
	movb	$0, %dl
	movw	336(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	338(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	340(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	342(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	344(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	346(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	348(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	350(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 21(%rax)
	movb	$0, %dl
	movw	352(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	354(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	356(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	358(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	360(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	362(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	364(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	366(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 22(%rax)
	movb	$0, %dl
	movw	368(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	370(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	372(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	374(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	376(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	378(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	380(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	382(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 23(%rax)
	movb	$0, %dl
	movw	384(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	386(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	388(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	390(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	392(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	394(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	396(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	398(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 24(%rax)
	movb	$0, %dl
	movw	400(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	402(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	404(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	406(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	408(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	410(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	412(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	414(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 25(%rax)
	movb	$0, %dl
	movw	416(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	418(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	420(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	422(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	424(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	426(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	428(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	430(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 26(%rax)
	movb	$0, %dl
	movw	432(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	434(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	436(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	438(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	440(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	442(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	444(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	446(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 27(%rax)
	movb	$0, %dl
	movw	448(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	450(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	452(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	454(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	456(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	458(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	460(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	462(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 28(%rax)
	movb	$0, %dl
	movw	464(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	466(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	468(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	470(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	472(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	474(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	476(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	478(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 29(%rax)
	movb	$0, %dl
	movw	480(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	482(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	484(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	486(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	488(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	490(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	492(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	494(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 30(%rax)
	movb	$0, %dl
	movw	496(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$0, %esi
	orb 	%sil, %dl
	movw	498(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$1, %esi
	orb 	%sil, %dl
	movw	500(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$2, %esi
	orb 	%sil, %dl
	movw	502(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$3, %esi
	orb 	%sil, %dl
	movw	504(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$4, %esi
	orb 	%sil, %dl
	movw	506(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$5, %esi
	orb 	%sil, %dl
	movw	508(%rcx), %r9w
	movzwl	%r9w, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$6, %esi
	orb 	%sil, %dl
	movw	510(%rcx), %cx
	movzwl	%cx, %esi
	shll	$1, %esi
	addl	$1665, %esi
	imull	$80635, %esi, %esi
	shrl	$28, %esi
	andl	$1, %esi
	shll	$7, %esi
	orb 	%sil, %dl
	movb	%dl, 31(%rax)
	ret
L_poly_tobytes$1:
	call	L_poly_csubq$1
L_poly_tobytes$4:
	movq	$0, %r8
	movq	$0, %rdx
	jmp 	L_poly_tobytes$2
L_poly_tobytes$3:
	movw	(%rcx,%rdx,2), %r9w
	movw	2(%rcx,%rdx,2), %di
	movw	%r9w, %r11w
	andw	$255, %r11w
	movb	%r11b, (%rax,%r8)
	incq	%r8
	shrw	$8, %r9w
	andw	$15, %r9w
	movw	%di, %r11w
	andw	$15, %r11w
	shlw	$4, %r11w
	orw 	%r9w, %r11w
	movb	%r11b, (%rax,%r8)
	incq	%r8
	shrw	$4, %di
	movb	%dil, (%rax,%r8)
	incq	%r8
	addq	$2, %rdx
L_poly_tobytes$2:
	cmpq	$256, %rdx
	jb  	L_poly_tobytes$3
	ret
L_poly_sub$1:
	movq	$0, %rdi
	jmp 	L_poly_sub$2
L_poly_sub$3:
	movw	(%rdx,%rdi,2), %r11w
	movw	(%rsi,%rdi,2), %r8w
	subw	%r8w, %r11w
	movw	%r11w, (%rcx,%rdi,2)
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
	movw	(%rdx,%rsi,2), %bx
	movq	%r9, %r8
	addq	%rdi, %r9
	jmp 	L_poly_ntt$8
L_poly_ntt$9:
	movw	(%rcx,%r8,2), %r10w
	movw	%r10w, %r11w
	movq	%r8, %rbp
	addq	%rdi, %rbp
	movw	(%rcx,%rbp,2), %r12w
	movswl	%r12w, %r13d
	movswl	%bx, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r14d
	addl	%r13d, %r14d
	sarl	$16, %r14d
	subw	%r14w, %r11w
	addw	%r10w, %r14w
	movw	%r11w, (%rcx,%rbp,2)
	movw	%r14w, (%rcx,%r8,2)
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
	movw	(%rcx,%r8,2), %r11w
	movswl	%r11w, %r9d
	imull	$20159, %r9d, %r9d
	sarl	$26, %r9d
	imull	$3329, %r9d, %r9d
	subw	%r9w, %r11w
	movw	%r11w, (%rcx,%r8,2)
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
	movq	$0, %r9
	jmp 	L_poly_invntt$6
L_poly_invntt$7:
	movw	(%rdx,%rsi,2), %bx
	incq	%rsi
	movq	%r9, %r8
	addq	%rdi, %r9
	jmp 	L_poly_invntt$8
L_poly_invntt$9:
	movw	(%rcx,%r8,2), %r11w
	movq	%r8, %rbp
	addq	%rdi, %rbp
	movw	(%rcx,%rbp,2), %r10w
	movw	%r10w, %r12w
	addw	%r11w, %r12w
	movswl	%r12w, %r14d
	imull	$20159, %r14d, %r14d
	sarl	$26, %r14d
	imull	$3329, %r14d, %r14d
	subw	%r14w, %r12w
	movw	%r12w, (%rcx,%r8,2)
	subw	%r10w, %r11w
	movswl	%r11w, %r13d
	movswl	%bx, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r11d
	addl	%r13d, %r11d
	sarl	$16, %r11d
	movw	%r11w, (%rcx,%rbp,2)
	incq	%r8
L_poly_invntt$8:
	cmpq	%r9, %r8
	jb  	L_poly_invntt$9
	movq	%r8, %r9
	addq	%rdi, %r9
L_poly_invntt$6:
	cmpq	$256, %r9
	jb  	L_poly_invntt$7
	shlq	$1, %rdi
L_poly_invntt$4:
	cmpq	$128, %rdi
	jbe 	L_poly_invntt$5
	movw	254(%rdx), %dx
	movq	$0, %r8
	jmp 	L_poly_invntt$2
L_poly_invntt$3:
	movw	(%rcx,%r8,2), %r11w
	movswl	%r11w, %r13d
	movswl	%dx, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %esi
	sarl	$16, %esi
	imull	$-3329, %esi, %r9d
	addl	%r13d, %r9d
	sarl	$16, %r9d
	movw	%r9w, (%rcx,%r8,2)
	incq	%r8
L_poly_invntt$2:
	cmpq	$256, %r8
	jb  	L_poly_invntt$3
	ret
L_poly_getnoise$1:
	movq	%rsi, 8(%rsp)
	movq	%rcx, %rdx
	movb	(%rdx), %r13b
	movb	%r13b, 16(%rsp)
	movb	1(%rdx), %r13b
	movb	%r13b, 17(%rsp)
	movb	2(%rdx), %r13b
	movb	%r13b, 18(%rsp)
	movb	3(%rdx), %r13b
	movb	%r13b, 19(%rsp)
	movb	4(%rdx), %r13b
	movb	%r13b, 20(%rsp)
	movb	5(%rdx), %r13b
	movb	%r13b, 21(%rsp)
	movb	6(%rdx), %r13b
	movb	%r13b, 22(%rsp)
	movb	7(%rdx), %r13b
	movb	%r13b, 23(%rsp)
	movb	8(%rdx), %r13b
	movb	%r13b, 24(%rsp)
	movb	9(%rdx), %r13b
	movb	%r13b, 25(%rsp)
	movb	10(%rdx), %r13b
	movb	%r13b, 26(%rsp)
	movb	11(%rdx), %r13b
	movb	%r13b, 27(%rsp)
	movb	12(%rdx), %r13b
	movb	%r13b, 28(%rsp)
	movb	13(%rdx), %r13b
	movb	%r13b, 29(%rsp)
	movb	14(%rdx), %r13b
	movb	%r13b, 30(%rsp)
	movb	15(%rdx), %r13b
	movb	%r13b, 31(%rsp)
	movb	16(%rdx), %r13b
	movb	%r13b, 32(%rsp)
	movb	17(%rdx), %r13b
	movb	%r13b, 33(%rsp)
	movb	18(%rdx), %r13b
	movb	%r13b, 34(%rsp)
	movb	19(%rdx), %r13b
	movb	%r13b, 35(%rsp)
	movb	20(%rdx), %r13b
	movb	%r13b, 36(%rsp)
	movb	21(%rdx), %r13b
	movb	%r13b, 37(%rsp)
	movb	22(%rdx), %r13b
	movb	%r13b, 38(%rsp)
	movb	23(%rdx), %r13b
	movb	%r13b, 39(%rsp)
	movb	24(%rdx), %r13b
	movb	%r13b, 40(%rsp)
	movb	25(%rdx), %r13b
	movb	%r13b, 41(%rsp)
	movb	26(%rdx), %r13b
	movb	%r13b, 42(%rsp)
	movb	27(%rdx), %r13b
	movb	%r13b, 43(%rsp)
	movb	28(%rdx), %r13b
	movb	%r13b, 44(%rsp)
	movb	29(%rdx), %r13b
	movb	%r13b, 45(%rsp)
	movb	30(%rdx), %r13b
	movb	%r13b, 46(%rsp)
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
	movq	$0, %rdx
	jmp 	L_poly_getnoise$2
L_poly_getnoise$3:
	movb	56(%rsp,%rdx), %sil
	movb	%sil, %r11b
	andb	$85, %r11b
	shrb	$1, %sil
	andb	$85, %sil
	addb	%r11b, %sil
	movb	%sil, %r11b
	andb	$3, %r11b
	movb	%sil, %r8b
	shrb	$2, %r8b
	andb	$3, %r8b
	subb	%r8b, %r11b
	movsbw	%r11b, %r9w
	movw	%r9w, (%rax,%rdx,4)
	movb	%sil, %r11b
	shrb	$4, %r11b
	andb	$3, %r11b
	shrb	$6, %sil
	andb	$3, %sil
	subb	%sil, %r11b
	movsbw	%r11b, %r9w
	movw	%r9w, 2(%rax,%rdx,4)
	incq	%rdx
L_poly_getnoise$2:
	cmpq	$128, %rdx
	jb  	L_poly_getnoise$3
	ret
L_i_poly_frommsg$1:
	movb	(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, (%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 2(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 4(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 6(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 8(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 10(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 12(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 14(%rcx)
	movb	1(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 16(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 18(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 20(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 22(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 24(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 26(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 28(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 30(%rcx)
	movb	2(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 32(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 34(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 36(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 38(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 40(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 42(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 44(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 46(%rcx)
	movb	3(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 48(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 50(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 52(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 54(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 56(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 58(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 60(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 62(%rcx)
	movb	4(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 64(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 66(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 68(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 70(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 72(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 74(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 76(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 78(%rcx)
	movb	5(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 80(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 82(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 84(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 86(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 88(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 90(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 92(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 94(%rcx)
	movb	6(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 96(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 98(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 100(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 102(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 104(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 106(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 108(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 110(%rcx)
	movb	7(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 112(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 114(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 116(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 118(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 120(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 122(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 124(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 126(%rcx)
	movb	8(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 128(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 130(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 132(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 134(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 136(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 138(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 140(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 142(%rcx)
	movb	9(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 144(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 146(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 148(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 150(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 152(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 154(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 156(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 158(%rcx)
	movb	10(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 160(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 162(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 164(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 166(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 168(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 170(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 172(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 174(%rcx)
	movb	11(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 176(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 178(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 180(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 182(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 184(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 186(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 188(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 190(%rcx)
	movb	12(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 192(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 194(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 196(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 198(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 200(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 202(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 204(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 206(%rcx)
	movb	13(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 208(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 210(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 212(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 214(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 216(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 218(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 220(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 222(%rcx)
	movb	14(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 224(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 226(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 228(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 230(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 232(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 234(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 236(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 238(%rcx)
	movb	15(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 240(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 242(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 244(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 246(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 248(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 250(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 252(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 254(%rcx)
	movb	16(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 256(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 258(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 260(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 262(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 264(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 266(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 268(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 270(%rcx)
	movb	17(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 272(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 274(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 276(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 278(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 280(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 282(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 284(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 286(%rcx)
	movb	18(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 288(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 290(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 292(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 294(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 296(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 298(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 300(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 302(%rcx)
	movb	19(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 304(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 306(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 308(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 310(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 312(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 314(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 316(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 318(%rcx)
	movb	20(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 320(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 322(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 324(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 326(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 328(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 330(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 332(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 334(%rcx)
	movb	21(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 336(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 338(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 340(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 342(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 344(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 346(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 348(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 350(%rcx)
	movb	22(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 352(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 354(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 356(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 358(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 360(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 362(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 364(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 366(%rcx)
	movb	23(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 368(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 370(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 372(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 374(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 376(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 378(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 380(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 382(%rcx)
	movb	24(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 384(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 386(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 388(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 390(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 392(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 394(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 396(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 398(%rcx)
	movb	25(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 400(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 402(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 404(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 406(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 408(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 410(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 412(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 414(%rcx)
	movb	26(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 416(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 418(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 420(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 422(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 424(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 426(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 428(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 430(%rcx)
	movb	27(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 432(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 434(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 436(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 438(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 440(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 442(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 444(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 446(%rcx)
	movb	28(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 448(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 450(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 452(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 454(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 456(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 458(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 460(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 462(%rcx)
	movb	29(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 464(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 466(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 468(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 470(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 472(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 474(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 476(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 478(%rcx)
	movb	30(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 480(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 482(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 484(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 486(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 488(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 490(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 492(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 494(%rcx)
	movb	31(%rax), %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 496(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 498(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 500(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 502(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 504(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 506(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 508(%rcx)
	shrb	$1, %dl
	movzbw	%dl, %r9w
	andw	$1, %r9w
	imulw	$1665, %r9w, %r9w
	movw	%r9w, 510(%rcx)
	ret
L_poly_frommont$1:
	movw	$1353, %cx
	movq	$0, %rdx
	jmp 	L_poly_frommont$2
L_poly_frommont$3:
	movw	(%rax,%rdx,2), %r11w
	movswl	%r11w, %r13d
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
	movq	%rsi, 8(%rsp)
	movq	$0, %rdi
	jmp 	L_poly_basemul$2
L_poly_basemul$3:
	leaq	glob_data + 576(%rip), %rsi
	movq	%rdi, %r8
	shrq	$2, %r8
	movw	(%rsi,%r8,2), %bx
	movw	(%rdx,%rdi,2), %r11w
	movw	(%rcx,%rdi,2), %si
	incq	%rdi
	movw	(%rdx,%rdi,2), %bp
	movw	(%rcx,%rdi,2), %r8w
	decq	%rdi
	movswl	%bp, %r13d
	movswl	%r8w, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r9d
	addl	%r13d, %r9d
	sarl	$16, %r9d
	movswl	%r9w, %r13d
	movswl	%bx, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r9d
	addl	%r13d, %r9d
	sarl	$16, %r9d
	movswl	%r11w, %r13d
	movswl	%si, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r14d
	addl	%r13d, %r14d
	sarl	$16, %r14d
	addw	%r14w, %r9w
	movswl	%r11w, %r13d
	movswl	%r8w, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r8d
	sarl	$16, %r8d
	imull	$-3329, %r8d, %r11d
	addl	%r13d, %r11d
	sarl	$16, %r11d
	movswl	%bp, %r13d
	movswl	%si, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %esi
	sarl	$16, %esi
	imull	$-3329, %esi, %r14d
	addl	%r13d, %r14d
	sarl	$16, %r14d
	addw	%r14w, %r11w
	movq	8(%rsp), %rsi
	movw	%r9w, (%rsi,%rdi,2)
	incq	%rdi
	movw	%r11w, (%rsi,%rdi,2)
	movq	%rsi, 16(%rsp)
	negw	%bx
	incq	%rdi
	movw	(%rdx,%rdi,2), %r11w
	movw	(%rcx,%rdi,2), %si
	incq	%rdi
	movw	(%rdx,%rdi,2), %bp
	movw	(%rcx,%rdi,2), %r8w
	decq	%rdi
	movswl	%bp, %r13d
	movswl	%r8w, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r9d
	addl	%r13d, %r9d
	sarl	$16, %r9d
	movswl	%r9w, %r13d
	movswl	%bx, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r9d
	addl	%r13d, %r9d
	sarl	$16, %r9d
	movswl	%r11w, %r13d
	movswl	%si, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r14d
	addl	%r13d, %r14d
	sarl	$16, %r14d
	addw	%r14w, %r9w
	movswl	%r11w, %r13d
	movswl	%r8w, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %r8d
	sarl	$16, %r8d
	imull	$-3329, %r8d, %r11d
	addl	%r13d, %r11d
	sarl	$16, %r11d
	movswl	%bp, %r13d
	movswl	%si, %r12d
	imull	%r12d, %r13d
	imull	$-218038272, %r13d, %esi
	sarl	$16, %esi
	imull	$-3329, %esi, %r14d
	addl	%r13d, %r14d
	sarl	$16, %r14d
	addw	%r14w, %r11w
	movq	16(%rsp), %rsi
	movw	%r9w, (%rsi,%rdi,2)
	incq	%rdi
	movw	%r11w, (%rsi,%rdi,2)
	incq	%rdi
L_poly_basemul$2:
	cmpq	$253, %rdi
	jb  	L_poly_basemul$3
	ret
L_poly_csubq$1:
	movq	$0, %rdx
	jmp 	L_poly_csubq$2
L_poly_csubq$3:
	movw	(%rcx,%rdx,2), %r9w
	addw	$-3329, %r9w
	movw	%r9w, %bx
	sarw	$15, %bx
	andw	$3329, %bx
	addw	%bx, %r9w
	movw	%r9w, (%rcx,%rdx,2)
	incq	%rdx
L_poly_csubq$2:
	cmpq	$256, %rdx
	jb  	L_poly_csubq$3
	ret
L_poly_add2$1:
	movq	$0, %rdx
	jmp 	L_poly_add2$2
L_poly_add2$3:
	movw	(%rcx,%rdx,2), %r9w
	movw	(%rsi,%rdx,2), %r8w
	addw	%r8w, %r9w
	movw	%r9w, (%rcx,%rdx,2)
	incq	%rdx
L_poly_add2$2:
	cmpq	$256, %rdx
	jb  	L_poly_add2$3
	ret
L_sha3_512A_A64$1:
	leaq	32(%rsp), %r15
	movq	$0, %rdx
	movq	$0, %rdi
	jmp 	L_sha3_512A_A64$12
L_sha3_512A_A64$13:
	movq	%rdx, (%r15,%rdi,8)
	incq	%rdi
L_sha3_512A_A64$12:
	cmpq	$25, %rdi
	jb  	L_sha3_512A_A64$13
	movq	%rax, 8(%rsp)
	movq	$0, %rbp
	movq	$0, %rax
	jmp 	L_sha3_512A_A64$10
L_sha3_512A_A64$11:
	movq	(%r10,%rbp), %rdx
	addq	$8, %rbp
	xorq	%rdx, (%r15,%rax,8)
	incq	%rax
L_sha3_512A_A64$10:
	cmpq	$8, %rax
	jb  	L_sha3_512A_A64$11
	movq	$0, %rdx
	movq	$6, %rsi
	orq 	%rsi, %rdx
	xorq	%rdx, (%r15,%rax,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	64(%r15), %rax
	movq	%rax, 64(%r15)
	movq	8(%rsp), %rax
	movq	$0, %rbp
	movq	$0, %rdx
	jmp 	L_sha3_512A_A64$5
L_sha3_512A_A64$6:
	movq	%rax, 8(%rsp)
	movq	%rbp, 16(%rsp)
	movq	%rdx, 24(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A64$9:
	leaq	200(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %rbp
	movq	$0, %rdx
	jmp 	L_sha3_512A_A64$7
L_sha3_512A_A64$8:
	movq	(%r15,%rdx,8), %r9
	movq	%r9, (%rax,%rbp)
	addq	$8, %rbp
	incq	%rdx
L_sha3_512A_A64$7:
	cmpq	$9, %rdx
	jb  	L_sha3_512A_A64$8
	movq	24(%rsp), %rdx
	incq	%rdx
L_sha3_512A_A64$5:
	cmpq	$0, %rdx
	jb  	L_sha3_512A_A64$6
	movq	%rax, 24(%rsp)
	movq	%rbp, 16(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A64$4:
	leaq	200(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	16(%rsp), %rbp
	movq	$0, %rdx
	jmp 	L_sha3_512A_A64$2
L_sha3_512A_A64$3:
	movq	(%r15,%rdx,8), %r9
	movq	%r9, (%rax,%rbp)
	addq	$8, %rbp
	incq	%rdx
L_sha3_512A_A64$2:
	cmpq	$8, %rdx
	jb  	L_sha3_512A_A64$3
	ret
L_sha3_256A_A1568$1:
	movq	%rax, %mm0
	leaq	32(%rsp), %r15
	movq	$0, %rdx
	movq	$0, %rdi
	jmp 	L_sha3_256A_A1568$20
L_sha3_256A_A1568$21:
	movq	%rdx, (%r15,%rdi,8)
	incq	%rdi
L_sha3_256A_A1568$20:
	cmpq	$25, %rdi
	jb  	L_sha3_256A_A1568$21
	movq	$0, %rbp
	movq	$0, %rax
	jmp 	L_sha3_256A_A1568$18
L_sha3_256A_A1568$19:
	movq	(%r10,%rbp), %rdx
	addq	$8, %rbp
	xorq	%rdx, (%r15,%rax,8)
	incq	%rax
L_sha3_256A_A1568$18:
	cmpq	$17, %rax
	jb  	L_sha3_256A_A1568$19
	movq	%r10, 8(%rsp)
	movq	%rbp, 16(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1568$17:
	leaq	200(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %rbp
	movq	$0, %rdi
	jmp 	L_sha3_256A_A1568$12
L_sha3_256A_A1568$13:
	movq	$0, %rdx
	jmp 	L_sha3_256A_A1568$15
L_sha3_256A_A1568$16:
	movq	(%rax,%rbp), %rsi
	addq	$8, %rbp
	xorq	%rsi, (%r15,%rdx,8)
	incq	%rdx
L_sha3_256A_A1568$15:
	cmpq	$17, %rdx
	jb  	L_sha3_256A_A1568$16
	movq	%rax, 16(%rsp)
	movq	%rbp, 8(%rsp)
	movq	%rdi, 24(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1568$14:
	leaq	200(%rsp), %rsp
	movq	16(%rsp), %rax
	movq	8(%rsp), %rbp
	movq	24(%rsp), %rdi
	incq	%rdi
L_sha3_256A_A1568$12:
	cmpq	$10, %rdi
	jb  	L_sha3_256A_A1568$13
	movq	$0, %rdx
	jmp 	L_sha3_256A_A1568$10
L_sha3_256A_A1568$11:
	movq	(%rax,%rbp), %rsi
	addq	$8, %rbp
	xorq	%rsi, (%r15,%rdx,8)
	incq	%rdx
L_sha3_256A_A1568$10:
	cmpq	$9, %rdx
	jb  	L_sha3_256A_A1568$11
	movq	$0, %rsi
	movq	$6, %rax
	orq 	%rax, %rsi
	xorq	%rsi, (%r15,%rdx,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	128(%r15), %rax
	movq	%rax, 128(%r15)
	movq	%mm0, %rax
	movq	$0, %rbp
	movq	$0, %rdx
	jmp 	L_sha3_256A_A1568$5
L_sha3_256A_A1568$6:
	movq	%rax, 24(%rsp)
	movq	%rbp, 8(%rsp)
	movq	%rdx, 16(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1568$9:
	leaq	200(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	8(%rsp), %rbp
	movq	$0, %rdx
	jmp 	L_sha3_256A_A1568$7
L_sha3_256A_A1568$8:
	movq	(%r15,%rdx,8), %r9
	movq	%r9, (%rax,%rbp)
	addq	$8, %rbp
	incq	%rdx
L_sha3_256A_A1568$7:
	cmpq	$17, %rdx
	jb  	L_sha3_256A_A1568$8
	movq	16(%rsp), %rdx
	incq	%rdx
L_sha3_256A_A1568$5:
	cmpq	$0, %rdx
	jb  	L_sha3_256A_A1568$6
	movq	%rax, 16(%rsp)
	movq	%rbp, 8(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_256A_A1568$4:
	leaq	200(%rsp), %rsp
	movq	16(%rsp), %rax
	movq	8(%rsp), %rbp
	movq	$0, %rdx
	jmp 	L_sha3_256A_A1568$2
L_sha3_256A_A1568$3:
	movq	(%r15,%rdx,8), %r9
	movq	%r9, (%rax,%rbp)
	addq	$8, %rbp
	incq	%rdx
L_sha3_256A_A1568$2:
	cmpq	$4, %rdx
	jb  	L_sha3_256A_A1568$3
	ret
L_shake128_squeezeblock$1:
	movq	%rax, 8(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake128_squeezeblock$4:
	leaq	200(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	L_shake128_squeezeblock$2
L_shake128_squeezeblock$3:
	movq	(%r15,%rdx,8), %r9
	movq	%r9, (%rax,%rcx)
	addq	$8, %rcx
	incq	%rdx
L_shake128_squeezeblock$2:
	cmpq	$21, %rdx
	jb  	L_shake128_squeezeblock$3
	ret
L_shake128_absorb34$1:
	movq	$0, %rdx
	movq	$0, %rdi
	jmp 	L_shake128_absorb34$4
L_shake128_absorb34$5:
	movq	%rdx, (%r15,%rdi,8)
	incq	%rdi
L_shake128_absorb34$4:
	cmpq	$25, %rdi
	jb  	L_shake128_absorb34$5
	movq	$0, %rcx
	movq	$0, %rax
	jmp 	L_shake128_absorb34$2
L_shake128_absorb34$3:
	movq	(%r10,%rcx), %rdx
	addq	$8, %rcx
	xorq	%rdx, (%r15,%rax,8)
	incq	%rax
L_shake128_absorb34$2:
	cmpq	$4, %rax
	jb  	L_shake128_absorb34$3
	movq	$0, %rdx
	movzwq	(%r10,%rcx), %rcx
	orq 	%rcx, %rdx
	movq	$31, %rsi
	shlq	$16, %rsi
	orq 	%rsi, %rdx
	xorq	%rdx, (%r15,%rax,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	160(%r15), %rax
	movq	%rax, 160(%r15)
	ret
L_sha3_512A_A33$1:
	leaq	32(%rsp), %r15
	movq	$0, %rdx
	movq	$0, %rdi
	jmp 	L_sha3_512A_A33$12
L_sha3_512A_A33$13:
	movq	%rdx, (%r15,%rdi,8)
	incq	%rdi
L_sha3_512A_A33$12:
	cmpq	$25, %rdi
	jb  	L_sha3_512A_A33$13
	movq	%rax, 8(%rsp)
	movq	$0, %rcx
	movq	$0, %rax
	jmp 	L_sha3_512A_A33$10
L_sha3_512A_A33$11:
	movq	(%r10,%rcx), %rdx
	addq	$8, %rcx
	xorq	%rdx, (%r15,%rax,8)
	incq	%rax
L_sha3_512A_A33$10:
	cmpq	$4, %rax
	jb  	L_sha3_512A_A33$11
	movq	$0, %rdx
	movzbq	(%r10,%rcx), %rsi
	orq 	$1536, %rsi
	orq 	%rsi, %rdx
	xorq	%rdx, (%r15,%rax,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	64(%r15), %rax
	movq	%rax, 64(%r15)
	movq	8(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	L_sha3_512A_A33$5
L_sha3_512A_A33$6:
	movq	%rax, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%rdx, 24(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A33$9:
	leaq	200(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	$0, %rdx
	jmp 	L_sha3_512A_A33$7
L_sha3_512A_A33$8:
	movq	(%r15,%rdx,8), %r9
	movq	%r9, (%rax,%rcx)
	addq	$8, %rcx
	incq	%rdx
L_sha3_512A_A33$7:
	cmpq	$9, %rdx
	jb  	L_sha3_512A_A33$8
	movq	24(%rsp), %rdx
	incq	%rdx
L_sha3_512A_A33$5:
	cmpq	$0, %rdx
	jb  	L_sha3_512A_A33$6
	movq	%rax, 24(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_sha3_512A_A33$4:
	leaq	200(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	$0, %rdx
	jmp 	L_sha3_512A_A33$2
L_sha3_512A_A33$3:
	movq	(%r15,%rdx,8), %r9
	movq	%r9, (%rax,%rcx)
	addq	$8, %rcx
	incq	%rdx
L_sha3_512A_A33$2:
	cmpq	$8, %rdx
	jb  	L_sha3_512A_A33$3
	ret
L_shake256_A32__A1600$1:
	movq	%rcx, %mm2
	movq	%rax, 8(%rsp)
	leaq	32(%rsp), %r15
	movq	$0, %rax
	movq	$0, %rdi
	jmp 	L_shake256_A32__A1600$22
L_shake256_A32__A1600$23:
	movq	%rax, (%r15,%rdi,8)
	incq	%rdi
L_shake256_A32__A1600$22:
	cmpq	$25, %rdi
	jb  	L_shake256_A32__A1600$23
	movq	$0, %rcx
	movq	$0, %rax
	jmp 	L_shake256_A32__A1600$20
L_shake256_A32__A1600$21:
	movq	(%rdx,%rcx), %rsi
	addq	$8, %rcx
	xorq	%rsi, (%r15,%rax,8)
	incq	%rax
L_shake256_A32__A1600$20:
	cmpq	$4, %rax
	jb  	L_shake256_A32__A1600$21
	movq	8(%rsp), %rax
	movq	$0, %rcx
	movq	(%rax,%rcx), %rdx
	xorq	%rdx, 32(%r15)
	addq	$8, %rcx
	movq	$5, %rdx
	jmp 	L_shake256_A32__A1600$18
L_shake256_A32__A1600$19:
	movq	(%rax,%rcx), %rsi
	addq	$8, %rcx
	xorq	%rsi, (%r15,%rdx,8)
	incq	%rdx
L_shake256_A32__A1600$18:
	cmpq	$17, %rdx
	jb  	L_shake256_A32__A1600$19
	movq	%rax, 8(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1600$17:
	leaq	200(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	$0, %rdi
	jmp 	L_shake256_A32__A1600$12
L_shake256_A32__A1600$13:
	movq	$0, %rdx
	jmp 	L_shake256_A32__A1600$15
L_shake256_A32__A1600$16:
	movq	(%rax,%rcx), %rsi
	addq	$8, %rcx
	xorq	%rsi, (%r15,%rdx,8)
	incq	%rdx
L_shake256_A32__A1600$15:
	cmpq	$17, %rdx
	jb  	L_shake256_A32__A1600$16
	movq	%rax, 16(%rsp)
	movq	%rcx, 8(%rsp)
	movq	%rdi, 24(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1600$14:
	leaq	200(%rsp), %rsp
	movq	16(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	24(%rsp), %rdi
	incq	%rdi
L_shake256_A32__A1600$12:
	cmpq	$10, %rdi
	jb  	L_shake256_A32__A1600$13
	movq	$0, %rdx
	jmp 	L_shake256_A32__A1600$10
L_shake256_A32__A1600$11:
	movq	(%rax,%rcx), %rsi
	addq	$8, %rcx
	xorq	%rsi, (%r15,%rdx,8)
	incq	%rdx
L_shake256_A32__A1600$10:
	cmpq	$13, %rdx
	jb  	L_shake256_A32__A1600$11
	movq	$0, %rsi
	movq	$31, %rax
	orq 	%rax, %rsi
	xorq	%rsi, (%r15,%rdx,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	128(%r15), %rax
	movq	%rax, 128(%r15)
	movq	%mm2, %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	L_shake256_A32__A1600$5
L_shake256_A32__A1600$6:
	movq	%rax, 24(%rsp)
	movq	%rcx, 8(%rsp)
	movq	%rdx, 16(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1600$9:
	leaq	200(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	$0, %rdx
	jmp 	L_shake256_A32__A1600$7
L_shake256_A32__A1600$8:
	movq	(%r15,%rdx,8), %r9
	movq	%r9, (%rax,%rcx)
	addq	$8, %rcx
	incq	%rdx
L_shake256_A32__A1600$7:
	cmpq	$17, %rdx
	jb  	L_shake256_A32__A1600$8
	movq	16(%rsp), %rdx
	incq	%rdx
L_shake256_A32__A1600$5:
	cmpq	$0, %rdx
	jb  	L_shake256_A32__A1600$6
	movq	%rax, 16(%rsp)
	movq	%rcx, 8(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_A32__A1600$4:
	leaq	200(%rsp), %rsp
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rbp
	movq	$0, %rdx
	jmp 	L_shake256_A32__A1600$2
L_shake256_A32__A1600$3:
	movq	(%r15,%rdx,8), %r9
	movq	%r9, (%rcx,%rbp)
	addq	$8, %rbp
	incq	%rdx
L_shake256_A32__A1600$2:
	cmpq	$4, %rdx
	jb  	L_shake256_A32__A1600$3
	ret
L_shake256_128_33$1:
	leaq	32(%rsp), %r15
	movq	$0, %rdx
	movq	$0, %rdi
	jmp 	L_shake256_128_33$12
L_shake256_128_33$13:
	movq	%rdx, (%r15,%rdi,8)
	incq	%rdi
L_shake256_128_33$12:
	cmpq	$25, %rdi
	jb  	L_shake256_128_33$13
	movq	%rax, 8(%rsp)
	movq	$0, %rbp
	movq	$0, %rax
	jmp 	L_shake256_128_33$10
L_shake256_128_33$11:
	movq	(%r10,%rbp), %rdx
	addq	$8, %rbp
	xorq	%rdx, (%r15,%rax,8)
	incq	%rax
L_shake256_128_33$10:
	cmpq	$4, %rax
	jb  	L_shake256_128_33$11
	movq	$0, %rdx
	movzbq	(%r10,%rbp), %rsi
	orq 	$7936, %rsi
	orq 	%rsi, %rdx
	xorq	%rdx, (%r15,%rax,8)
	movq	$1, %rax
	shlq	$63, %rax
	xorq	128(%r15), %rax
	movq	%rax, 128(%r15)
	movq	8(%rsp), %rax
	movq	$0, %rbp
	movq	$0, %rdx
	jmp 	L_shake256_128_33$5
L_shake256_128_33$6:
	movq	%rax, 8(%rsp)
	movq	%rbp, 16(%rsp)
	movq	%rdx, 24(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_128_33$9:
	leaq	200(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %rbp
	movq	$0, %rdx
	jmp 	L_shake256_128_33$7
L_shake256_128_33$8:
	movq	(%r15,%rdx,8), %r9
	movq	%r9, (%rax,%rbp)
	addq	$8, %rbp
	incq	%rdx
L_shake256_128_33$7:
	cmpq	$17, %rdx
	jb  	L_shake256_128_33$8
	movq	24(%rsp), %rdx
	incq	%rdx
L_shake256_128_33$5:
	cmpq	$0, %rdx
	jb  	L_shake256_128_33$6
	movq	%rax, 24(%rsp)
	movq	%rbp, 16(%rsp)
	leaq	-200(%rsp), %rsp
	call	L_keccakf1600_ref$1
L_shake256_128_33$4:
	leaq	200(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	16(%rsp), %rbp
	movq	$0, %rdx
	jmp 	L_shake256_128_33$2
L_shake256_128_33$3:
	movq	(%r15,%rdx,8), %r9
	movq	%r9, (%rax,%rbp)
	addq	$8, %rbp
	incq	%rdx
L_shake256_128_33$2:
	cmpq	$16, %rdx
	jb  	L_shake256_128_33$3
	ret
L_keccakf1600_ref$1:
	leaq	8(%rsp), %rax
	movq	$0, %rdx
L_keccakf1600_ref$2:
	call	L_pround_ref$1
L_keccakf1600_ref$4:
	xchg	%r15, %rax
	leaq	glob_data + 0(%rip), %rsi
	movq	(%rsi,%rdx,8), %rsi
	xorq	%rsi, (%r15)
	call	L_pround_ref$1
L_keccakf1600_ref$3:
	xchg	%rax, %r15
	leaq	glob_data + 0(%rip), %rsi
	movq	8(%rsi,%rdx,8), %rsi
	xorq	%rsi, (%r15)
	addq	$2, %rdx
	cmpq	$23, %rdx
	jb  	L_keccakf1600_ref$2
	ret
L_pround_ref$1:
	movq	(%r15), %r10
	movq	8(%r15), %r9
	movq	16(%r15), %rbx
	movq	24(%r15), %r11
	movq	32(%r15), %rbp
	xorq	40(%r15), %r10
	xorq	48(%r15), %r9
	xorq	56(%r15), %rbx
	xorq	64(%r15), %r11
	xorq	72(%r15), %rbp
	xorq	80(%r15), %r10
	xorq	88(%r15), %r9
	xorq	96(%r15), %rbx
	xorq	104(%r15), %r11
	xorq	112(%r15), %rbp
	xorq	120(%r15), %r10
	xorq	128(%r15), %r9
	xorq	136(%r15), %rbx
	xorq	144(%r15), %r11
	xorq	152(%r15), %rbp
	xorq	160(%r15), %r10
	xorq	168(%r15), %r9
	xorq	176(%r15), %rbx
	xorq	184(%r15), %r11
	xorq	192(%r15), %rbp
	movq	%r9, %rsi
	rolq	$1, %rsi
	xorq	%rbp, %rsi
	movq	%rbx, %rdi
	rolq	$1, %rdi
	xorq	%r10, %rdi
	movq	%r11, %r8
	rolq	$1, %r8
	xorq	%r9, %r8
	movq	%rbp, %r9
	rolq	$1, %r9
	xorq	%rbx, %r9
	rolq	$1, %r10
	xorq	%r11, %r10
	movq	(%r15), %r11
	xorq	%rsi, %r11
	movq	48(%r15), %rbx
	xorq	%rdi, %rbx
	rolq	$44, %rbx
	movq	96(%r15), %rbp
	xorq	%r8, %rbp
	rolq	$43, %rbp
	movq	144(%r15), %r12
	xorq	%r9, %r12
	rolq	$21, %r12
	movq	192(%r15), %r13
	xorq	%r10, %r13
	rolq	$14, %r13
	andnq	%rbp, %rbx, %r14
	xorq	%r11, %r14
	movq	%r14, (%rax)
	andnq	%r12, %rbp, %r14
	xorq	%rbx, %r14
	movq	%r14, 8(%rax)
	andnq	%r13, %r12, %r14
	xorq	%rbp, %r14
	movq	%r14, 16(%rax)
	andnq	%r11, %r13, %r14
	xorq	%r12, %r14
	movq	%r14, 24(%rax)
	andnq	%rbx, %r11, %r11
	xorq	%r13, %r11
	movq	%r11, 32(%rax)
	movq	24(%r15), %r13
	xorq	%r9, %r13
	rolq	$28, %r13
	movq	72(%r15), %r11
	xorq	%r10, %r11
	rolq	$20, %r11
	movq	80(%r15), %rbp
	xorq	%rsi, %rbp
	rolq	$3, %rbp
	movq	128(%r15), %r12
	xorq	%rdi, %r12
	rolq	$45, %r12
	movq	176(%r15), %rbx
	xorq	%r8, %rbx
	rolq	$61, %rbx
	andnq	%rbp, %r11, %r14
	xorq	%r13, %r14
	movq	%r14, 40(%rax)
	andnq	%r12, %rbp, %r14
	xorq	%r11, %r14
	movq	%r14, 48(%rax)
	andnq	%rbx, %r12, %r14
	xorq	%rbp, %r14
	movq	%r14, 56(%rax)
	andnq	%r13, %rbx, %r14
	xorq	%r12, %r14
	movq	%r14, 64(%rax)
	andnq	%r11, %r13, %r11
	xorq	%rbx, %r11
	movq	%r11, 72(%rax)
	movq	8(%r15), %r11
	xorq	%rdi, %r11
	rolq	$1, %r11
	movq	56(%r15), %rbx
	xorq	%r8, %rbx
	rolq	$6, %rbx
	movq	104(%r15), %rbp
	xorq	%r9, %rbp
	rolq	$25, %rbp
	movq	152(%r15), %r12
	xorq	%r10, %r12
	rolq	$8, %r12
	movq	160(%r15), %r13
	xorq	%rsi, %r13
	rolq	$18, %r13
	andnq	%rbp, %rbx, %r14
	xorq	%r11, %r14
	movq	%r14, 80(%rax)
	andnq	%r12, %rbp, %r14
	xorq	%rbx, %r14
	movq	%r14, 88(%rax)
	andnq	%r13, %r12, %r14
	xorq	%rbp, %r14
	movq	%r14, 96(%rax)
	andnq	%r11, %r13, %r14
	xorq	%r12, %r14
	movq	%r14, 104(%rax)
	andnq	%rbx, %r11, %r11
	xorq	%r13, %r11
	movq	%r11, 112(%rax)
	movq	32(%r15), %r11
	xorq	%r10, %r11
	rolq	$27, %r11
	movq	40(%r15), %rbx
	xorq	%rsi, %rbx
	rolq	$36, %rbx
	movq	88(%r15), %rbp
	xorq	%rdi, %rbp
	rolq	$10, %rbp
	movq	136(%r15), %r12
	xorq	%r8, %r12
	rolq	$15, %r12
	movq	184(%r15), %r13
	xorq	%r9, %r13
	rolq	$56, %r13
	andnq	%rbp, %rbx, %r14
	xorq	%r11, %r14
	movq	%r14, 120(%rax)
	andnq	%r12, %rbp, %r14
	xorq	%rbx, %r14
	movq	%r14, 128(%rax)
	andnq	%r13, %r12, %r14
	xorq	%rbp, %r14
	movq	%r14, 136(%rax)
	andnq	%r11, %r13, %r14
	xorq	%r12, %r14
	movq	%r14, 144(%rax)
	andnq	%rbx, %r11, %r11
	xorq	%r13, %r11
	movq	%r11, 152(%rax)
	movq	16(%r15), %r11
	xorq	%r8, %r11
	rolq	$62, %r11
	movq	64(%r15), %rbx
	xorq	%r9, %rbx
	rolq	$55, %rbx
	movq	112(%r15), %rbp
	xorq	%r10, %rbp
	rolq	$39, %rbp
	movq	120(%r15), %r12
	xorq	%rsi, %r12
	rolq	$41, %r12
	movq	168(%r15), %r13
	xorq	%rdi, %r13
	rolq	$2, %r13
	andnq	%rbp, %rbx, %r9
	xorq	%r11, %r9
	movq	%r9, 160(%rax)
	andnq	%r12, %rbp, %r9
	xorq	%rbx, %r9
	movq	%r9, 168(%rax)
	andnq	%r13, %r12, %r9
	xorq	%rbp, %r9
	movq	%r9, 176(%rax)
	andnq	%r11, %r13, %r9
	xorq	%r12, %r9
	movq	%r9, 184(%rax)
	andnq	%rbx, %r11, %r9
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
