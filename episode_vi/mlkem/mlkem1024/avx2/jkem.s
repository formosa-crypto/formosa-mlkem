	.att_syntax
	.text
	.p2align	5
	.global	_jade_kem_mlkem_mlkem1024_amd64_avx2_dec
	.global	jade_kem_mlkem_mlkem1024_amd64_avx2_dec
	.global	_jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand
	.global	jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand
	.global	_jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand
	.global	jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand
_jade_kem_mlkem_mlkem1024_amd64_avx2_dec:
jade_kem_mlkem_mlkem1024_amd64_avx2_dec:
	movq	%rsp, %rax
	leaq	-26528(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 26472(%rsp)
	movq	%rbp, 26480(%rsp)
	movq	%r12, 26488(%rsp)
	movq	%r13, 26496(%rsp)
	movq	%r14, 26504(%rsp)
	movq	%r15, 26512(%rsp)
	movq	%rax, 26520(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm1
	movq	%rsi, %mm2
	movq	(%rdx), %rax
	movq	%rax, 23304(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 23312(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 23320(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 23328(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 23336(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 23344(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 23352(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 23360(%rsp)
	movq	64(%rdx), %rax
	movq	%rax, 23368(%rsp)
	movq	72(%rdx), %rax
	movq	%rax, 23376(%rsp)
	movq	80(%rdx), %rax
	movq	%rax, 23384(%rsp)
	movq	88(%rdx), %rax
	movq	%rax, 23392(%rsp)
	movq	96(%rdx), %rax
	movq	%rax, 23400(%rsp)
	movq	104(%rdx), %rax
	movq	%rax, 23408(%rsp)
	movq	112(%rdx), %rax
	movq	%rax, 23416(%rsp)
	movq	120(%rdx), %rax
	movq	%rax, 23424(%rsp)
	movq	128(%rdx), %rax
	movq	%rax, 23432(%rsp)
	movq	136(%rdx), %rax
	movq	%rax, 23440(%rsp)
	movq	144(%rdx), %rax
	movq	%rax, 23448(%rsp)
	movq	152(%rdx), %rax
	movq	%rax, 23456(%rsp)
	movq	160(%rdx), %rax
	movq	%rax, 23464(%rsp)
	movq	168(%rdx), %rax
	movq	%rax, 23472(%rsp)
	movq	176(%rdx), %rax
	movq	%rax, 23480(%rsp)
	movq	184(%rdx), %rax
	movq	%rax, 23488(%rsp)
	movq	192(%rdx), %rax
	movq	%rax, 23496(%rsp)
	movq	200(%rdx), %rax
	movq	%rax, 23504(%rsp)
	movq	208(%rdx), %rax
	movq	%rax, 23512(%rsp)
	movq	216(%rdx), %rax
	movq	%rax, 23520(%rsp)
	movq	224(%rdx), %rax
	movq	%rax, 23528(%rsp)
	movq	232(%rdx), %rax
	movq	%rax, 23536(%rsp)
	movq	240(%rdx), %rax
	movq	%rax, 23544(%rsp)
	movq	248(%rdx), %rax
	movq	%rax, 23552(%rsp)
	movq	256(%rdx), %rax
	movq	%rax, 23560(%rsp)
	movq	264(%rdx), %rax
	movq	%rax, 23568(%rsp)
	movq	272(%rdx), %rax
	movq	%rax, 23576(%rsp)
	movq	280(%rdx), %rax
	movq	%rax, 23584(%rsp)
	movq	288(%rdx), %rax
	movq	%rax, 23592(%rsp)
	movq	296(%rdx), %rax
	movq	%rax, 23600(%rsp)
	movq	304(%rdx), %rax
	movq	%rax, 23608(%rsp)
	movq	312(%rdx), %rax
	movq	%rax, 23616(%rsp)
	movq	320(%rdx), %rax
	movq	%rax, 23624(%rsp)
	movq	328(%rdx), %rax
	movq	%rax, 23632(%rsp)
	movq	336(%rdx), %rax
	movq	%rax, 23640(%rsp)
	movq	344(%rdx), %rax
	movq	%rax, 23648(%rsp)
	movq	352(%rdx), %rax
	movq	%rax, 23656(%rsp)
	movq	360(%rdx), %rax
	movq	%rax, 23664(%rsp)
	movq	368(%rdx), %rax
	movq	%rax, 23672(%rsp)
	movq	376(%rdx), %rax
	movq	%rax, 23680(%rsp)
	movq	384(%rdx), %rax
	movq	%rax, 23688(%rsp)
	movq	392(%rdx), %rax
	movq	%rax, 23696(%rsp)
	movq	400(%rdx), %rax
	movq	%rax, 23704(%rsp)
	movq	408(%rdx), %rax
	movq	%rax, 23712(%rsp)
	movq	416(%rdx), %rax
	movq	%rax, 23720(%rsp)
	movq	424(%rdx), %rax
	movq	%rax, 23728(%rsp)
	movq	432(%rdx), %rax
	movq	%rax, 23736(%rsp)
	movq	440(%rdx), %rax
	movq	%rax, 23744(%rsp)
	movq	448(%rdx), %rax
	movq	%rax, 23752(%rsp)
	movq	456(%rdx), %rax
	movq	%rax, 23760(%rsp)
	movq	464(%rdx), %rax
	movq	%rax, 23768(%rsp)
	movq	472(%rdx), %rax
	movq	%rax, 23776(%rsp)
	movq	480(%rdx), %rax
	movq	%rax, 23784(%rsp)
	movq	488(%rdx), %rax
	movq	%rax, 23792(%rsp)
	movq	496(%rdx), %rax
	movq	%rax, 23800(%rsp)
	movq	504(%rdx), %rax
	movq	%rax, 23808(%rsp)
	movq	512(%rdx), %rax
	movq	%rax, 23816(%rsp)
	movq	520(%rdx), %rax
	movq	%rax, 23824(%rsp)
	movq	528(%rdx), %rax
	movq	%rax, 23832(%rsp)
	movq	536(%rdx), %rax
	movq	%rax, 23840(%rsp)
	movq	544(%rdx), %rax
	movq	%rax, 23848(%rsp)
	movq	552(%rdx), %rax
	movq	%rax, 23856(%rsp)
	movq	560(%rdx), %rax
	movq	%rax, 23864(%rsp)
	movq	568(%rdx), %rax
	movq	%rax, 23872(%rsp)
	movq	576(%rdx), %rax
	movq	%rax, 23880(%rsp)
	movq	584(%rdx), %rax
	movq	%rax, 23888(%rsp)
	movq	592(%rdx), %rax
	movq	%rax, 23896(%rsp)
	movq	600(%rdx), %rax
	movq	%rax, 23904(%rsp)
	movq	608(%rdx), %rax
	movq	%rax, 23912(%rsp)
	movq	616(%rdx), %rax
	movq	%rax, 23920(%rsp)
	movq	624(%rdx), %rax
	movq	%rax, 23928(%rsp)
	movq	632(%rdx), %rax
	movq	%rax, 23936(%rsp)
	movq	640(%rdx), %rax
	movq	%rax, 23944(%rsp)
	movq	648(%rdx), %rax
	movq	%rax, 23952(%rsp)
	movq	656(%rdx), %rax
	movq	%rax, 23960(%rsp)
	movq	664(%rdx), %rax
	movq	%rax, 23968(%rsp)
	movq	672(%rdx), %rax
	movq	%rax, 23976(%rsp)
	movq	680(%rdx), %rax
	movq	%rax, 23984(%rsp)
	movq	688(%rdx), %rax
	movq	%rax, 23992(%rsp)
	movq	696(%rdx), %rax
	movq	%rax, 24000(%rsp)
	movq	704(%rdx), %rax
	movq	%rax, 24008(%rsp)
	movq	712(%rdx), %rax
	movq	%rax, 24016(%rsp)
	movq	720(%rdx), %rax
	movq	%rax, 24024(%rsp)
	movq	728(%rdx), %rax
	movq	%rax, 24032(%rsp)
	movq	736(%rdx), %rax
	movq	%rax, 24040(%rsp)
	movq	744(%rdx), %rax
	movq	%rax, 24048(%rsp)
	movq	752(%rdx), %rax
	movq	%rax, 24056(%rsp)
	movq	760(%rdx), %rax
	movq	%rax, 24064(%rsp)
	movq	768(%rdx), %rax
	movq	%rax, 24072(%rsp)
	movq	776(%rdx), %rax
	movq	%rax, 24080(%rsp)
	movq	784(%rdx), %rax
	movq	%rax, 24088(%rsp)
	movq	792(%rdx), %rax
	movq	%rax, 24096(%rsp)
	movq	800(%rdx), %rax
	movq	%rax, 24104(%rsp)
	movq	808(%rdx), %rax
	movq	%rax, 24112(%rsp)
	movq	816(%rdx), %rax
	movq	%rax, 24120(%rsp)
	movq	824(%rdx), %rax
	movq	%rax, 24128(%rsp)
	movq	832(%rdx), %rax
	movq	%rax, 24136(%rsp)
	movq	840(%rdx), %rax
	movq	%rax, 24144(%rsp)
	movq	848(%rdx), %rax
	movq	%rax, 24152(%rsp)
	movq	856(%rdx), %rax
	movq	%rax, 24160(%rsp)
	movq	864(%rdx), %rax
	movq	%rax, 24168(%rsp)
	movq	872(%rdx), %rax
	movq	%rax, 24176(%rsp)
	movq	880(%rdx), %rax
	movq	%rax, 24184(%rsp)
	movq	888(%rdx), %rax
	movq	%rax, 24192(%rsp)
	movq	896(%rdx), %rax
	movq	%rax, 24200(%rsp)
	movq	904(%rdx), %rax
	movq	%rax, 24208(%rsp)
	movq	912(%rdx), %rax
	movq	%rax, 24216(%rsp)
	movq	920(%rdx), %rax
	movq	%rax, 24224(%rsp)
	movq	928(%rdx), %rax
	movq	%rax, 24232(%rsp)
	movq	936(%rdx), %rax
	movq	%rax, 24240(%rsp)
	movq	944(%rdx), %rax
	movq	%rax, 24248(%rsp)
	movq	952(%rdx), %rax
	movq	%rax, 24256(%rsp)
	movq	960(%rdx), %rax
	movq	%rax, 24264(%rsp)
	movq	968(%rdx), %rax
	movq	%rax, 24272(%rsp)
	movq	976(%rdx), %rax
	movq	%rax, 24280(%rsp)
	movq	984(%rdx), %rax
	movq	%rax, 24288(%rsp)
	movq	992(%rdx), %rax
	movq	%rax, 24296(%rsp)
	movq	1000(%rdx), %rax
	movq	%rax, 24304(%rsp)
	movq	1008(%rdx), %rax
	movq	%rax, 24312(%rsp)
	movq	1016(%rdx), %rax
	movq	%rax, 24320(%rsp)
	movq	1024(%rdx), %rax
	movq	%rax, 24328(%rsp)
	movq	1032(%rdx), %rax
	movq	%rax, 24336(%rsp)
	movq	1040(%rdx), %rax
	movq	%rax, 24344(%rsp)
	movq	1048(%rdx), %rax
	movq	%rax, 24352(%rsp)
	movq	1056(%rdx), %rax
	movq	%rax, 24360(%rsp)
	movq	1064(%rdx), %rax
	movq	%rax, 24368(%rsp)
	movq	1072(%rdx), %rax
	movq	%rax, 24376(%rsp)
	movq	1080(%rdx), %rax
	movq	%rax, 24384(%rsp)
	movq	1088(%rdx), %rax
	movq	%rax, 24392(%rsp)
	movq	1096(%rdx), %rax
	movq	%rax, 24400(%rsp)
	movq	1104(%rdx), %rax
	movq	%rax, 24408(%rsp)
	movq	1112(%rdx), %rax
	movq	%rax, 24416(%rsp)
	movq	1120(%rdx), %rax
	movq	%rax, 24424(%rsp)
	movq	1128(%rdx), %rax
	movq	%rax, 24432(%rsp)
	movq	1136(%rdx), %rax
	movq	%rax, 24440(%rsp)
	movq	1144(%rdx), %rax
	movq	%rax, 24448(%rsp)
	movq	1152(%rdx), %rax
	movq	%rax, 24456(%rsp)
	movq	1160(%rdx), %rax
	movq	%rax, 24464(%rsp)
	movq	1168(%rdx), %rax
	movq	%rax, 24472(%rsp)
	movq	1176(%rdx), %rax
	movq	%rax, 24480(%rsp)
	movq	1184(%rdx), %rax
	movq	%rax, 24488(%rsp)
	movq	1192(%rdx), %rax
	movq	%rax, 24496(%rsp)
	movq	1200(%rdx), %rax
	movq	%rax, 24504(%rsp)
	movq	1208(%rdx), %rax
	movq	%rax, 24512(%rsp)
	movq	1216(%rdx), %rax
	movq	%rax, 24520(%rsp)
	movq	1224(%rdx), %rax
	movq	%rax, 24528(%rsp)
	movq	1232(%rdx), %rax
	movq	%rax, 24536(%rsp)
	movq	1240(%rdx), %rax
	movq	%rax, 24544(%rsp)
	movq	1248(%rdx), %rax
	movq	%rax, 24552(%rsp)
	movq	1256(%rdx), %rax
	movq	%rax, 24560(%rsp)
	movq	1264(%rdx), %rax
	movq	%rax, 24568(%rsp)
	movq	1272(%rdx), %rax
	movq	%rax, 24576(%rsp)
	movq	1280(%rdx), %rax
	movq	%rax, 24584(%rsp)
	movq	1288(%rdx), %rax
	movq	%rax, 24592(%rsp)
	movq	1296(%rdx), %rax
	movq	%rax, 24600(%rsp)
	movq	1304(%rdx), %rax
	movq	%rax, 24608(%rsp)
	movq	1312(%rdx), %rax
	movq	%rax, 24616(%rsp)
	movq	1320(%rdx), %rax
	movq	%rax, 24624(%rsp)
	movq	1328(%rdx), %rax
	movq	%rax, 24632(%rsp)
	movq	1336(%rdx), %rax
	movq	%rax, 24640(%rsp)
	movq	1344(%rdx), %rax
	movq	%rax, 24648(%rsp)
	movq	1352(%rdx), %rax
	movq	%rax, 24656(%rsp)
	movq	1360(%rdx), %rax
	movq	%rax, 24664(%rsp)
	movq	1368(%rdx), %rax
	movq	%rax, 24672(%rsp)
	movq	1376(%rdx), %rax
	movq	%rax, 24680(%rsp)
	movq	1384(%rdx), %rax
	movq	%rax, 24688(%rsp)
	movq	1392(%rdx), %rax
	movq	%rax, 24696(%rsp)
	movq	1400(%rdx), %rax
	movq	%rax, 24704(%rsp)
	movq	1408(%rdx), %rax
	movq	%rax, 24712(%rsp)
	movq	1416(%rdx), %rax
	movq	%rax, 24720(%rsp)
	movq	1424(%rdx), %rax
	movq	%rax, 24728(%rsp)
	movq	1432(%rdx), %rax
	movq	%rax, 24736(%rsp)
	movq	1440(%rdx), %rax
	movq	%rax, 24744(%rsp)
	movq	1448(%rdx), %rax
	movq	%rax, 24752(%rsp)
	movq	1456(%rdx), %rax
	movq	%rax, 24760(%rsp)
	movq	1464(%rdx), %rax
	movq	%rax, 24768(%rsp)
	movq	1472(%rdx), %rax
	movq	%rax, 24776(%rsp)
	movq	1480(%rdx), %rax
	movq	%rax, 24784(%rsp)
	movq	1488(%rdx), %rax
	movq	%rax, 24792(%rsp)
	movq	1496(%rdx), %rax
	movq	%rax, 24800(%rsp)
	movq	1504(%rdx), %rax
	movq	%rax, 24808(%rsp)
	movq	1512(%rdx), %rax
	movq	%rax, 24816(%rsp)
	movq	1520(%rdx), %rax
	movq	%rax, 24824(%rsp)
	movq	1528(%rdx), %rax
	movq	%rax, 24832(%rsp)
	movq	1536(%rdx), %rax
	movq	%rax, 24840(%rsp)
	movq	1544(%rdx), %rax
	movq	%rax, 24848(%rsp)
	movq	1552(%rdx), %rax
	movq	%rax, 24856(%rsp)
	movq	1560(%rdx), %rax
	movq	%rax, 24864(%rsp)
	movq	1568(%rdx), %rax
	movq	%rax, 24872(%rsp)
	movq	1576(%rdx), %rax
	movq	%rax, 24880(%rsp)
	movq	1584(%rdx), %rax
	movq	%rax, 24888(%rsp)
	movq	1592(%rdx), %rax
	movq	%rax, 24896(%rsp)
	movq	1600(%rdx), %rax
	movq	%rax, 24904(%rsp)
	movq	1608(%rdx), %rax
	movq	%rax, 24912(%rsp)
	movq	1616(%rdx), %rax
	movq	%rax, 24920(%rsp)
	movq	1624(%rdx), %rax
	movq	%rax, 24928(%rsp)
	movq	1632(%rdx), %rax
	movq	%rax, 24936(%rsp)
	movq	1640(%rdx), %rax
	movq	%rax, 24944(%rsp)
	movq	1648(%rdx), %rax
	movq	%rax, 24952(%rsp)
	movq	1656(%rdx), %rax
	movq	%rax, 24960(%rsp)
	movq	1664(%rdx), %rax
	movq	%rax, 24968(%rsp)
	movq	1672(%rdx), %rax
	movq	%rax, 24976(%rsp)
	movq	1680(%rdx), %rax
	movq	%rax, 24984(%rsp)
	movq	1688(%rdx), %rax
	movq	%rax, 24992(%rsp)
	movq	1696(%rdx), %rax
	movq	%rax, 25000(%rsp)
	movq	1704(%rdx), %rax
	movq	%rax, 25008(%rsp)
	movq	1712(%rdx), %rax
	movq	%rax, 25016(%rsp)
	movq	1720(%rdx), %rax
	movq	%rax, 25024(%rsp)
	movq	1728(%rdx), %rax
	movq	%rax, 25032(%rsp)
	movq	1736(%rdx), %rax
	movq	%rax, 25040(%rsp)
	movq	1744(%rdx), %rax
	movq	%rax, 25048(%rsp)
	movq	1752(%rdx), %rax
	movq	%rax, 25056(%rsp)
	movq	1760(%rdx), %rax
	movq	%rax, 25064(%rsp)
	movq	1768(%rdx), %rax
	movq	%rax, 25072(%rsp)
	movq	1776(%rdx), %rax
	movq	%rax, 25080(%rsp)
	movq	1784(%rdx), %rax
	movq	%rax, 25088(%rsp)
	movq	1792(%rdx), %rax
	movq	%rax, 25096(%rsp)
	movq	1800(%rdx), %rax
	movq	%rax, 25104(%rsp)
	movq	1808(%rdx), %rax
	movq	%rax, 25112(%rsp)
	movq	1816(%rdx), %rax
	movq	%rax, 25120(%rsp)
	movq	1824(%rdx), %rax
	movq	%rax, 25128(%rsp)
	movq	1832(%rdx), %rax
	movq	%rax, 25136(%rsp)
	movq	1840(%rdx), %rax
	movq	%rax, 25144(%rsp)
	movq	1848(%rdx), %rax
	movq	%rax, 25152(%rsp)
	movq	1856(%rdx), %rax
	movq	%rax, 25160(%rsp)
	movq	1864(%rdx), %rax
	movq	%rax, 25168(%rsp)
	movq	1872(%rdx), %rax
	movq	%rax, 25176(%rsp)
	movq	1880(%rdx), %rax
	movq	%rax, 25184(%rsp)
	movq	1888(%rdx), %rax
	movq	%rax, 25192(%rsp)
	movq	1896(%rdx), %rax
	movq	%rax, 25200(%rsp)
	movq	1904(%rdx), %rax
	movq	%rax, 25208(%rsp)
	movq	1912(%rdx), %rax
	movq	%rax, 25216(%rsp)
	movq	1920(%rdx), %rax
	movq	%rax, 25224(%rsp)
	movq	1928(%rdx), %rax
	movq	%rax, 25232(%rsp)
	movq	1936(%rdx), %rax
	movq	%rax, 25240(%rsp)
	movq	1944(%rdx), %rax
	movq	%rax, 25248(%rsp)
	movq	1952(%rdx), %rax
	movq	%rax, 25256(%rsp)
	movq	1960(%rdx), %rax
	movq	%rax, 25264(%rsp)
	movq	1968(%rdx), %rax
	movq	%rax, 25272(%rsp)
	movq	1976(%rdx), %rax
	movq	%rax, 25280(%rsp)
	movq	1984(%rdx), %rax
	movq	%rax, 25288(%rsp)
	movq	1992(%rdx), %rax
	movq	%rax, 25296(%rsp)
	movq	2000(%rdx), %rax
	movq	%rax, 25304(%rsp)
	movq	2008(%rdx), %rax
	movq	%rax, 25312(%rsp)
	movq	2016(%rdx), %rax
	movq	%rax, 25320(%rsp)
	movq	2024(%rdx), %rax
	movq	%rax, 25328(%rsp)
	movq	2032(%rdx), %rax
	movq	%rax, 25336(%rsp)
	movq	2040(%rdx), %rax
	movq	%rax, 25344(%rsp)
	movq	2048(%rdx), %rax
	movq	%rax, 25352(%rsp)
	movq	2056(%rdx), %rax
	movq	%rax, 25360(%rsp)
	movq	2064(%rdx), %rax
	movq	%rax, 25368(%rsp)
	movq	2072(%rdx), %rax
	movq	%rax, 25376(%rsp)
	movq	2080(%rdx), %rax
	movq	%rax, 25384(%rsp)
	movq	2088(%rdx), %rax
	movq	%rax, 25392(%rsp)
	movq	2096(%rdx), %rax
	movq	%rax, 25400(%rsp)
	movq	2104(%rdx), %rax
	movq	%rax, 25408(%rsp)
	movq	2112(%rdx), %rax
	movq	%rax, 25416(%rsp)
	movq	2120(%rdx), %rax
	movq	%rax, 25424(%rsp)
	movq	2128(%rdx), %rax
	movq	%rax, 25432(%rsp)
	movq	2136(%rdx), %rax
	movq	%rax, 25440(%rsp)
	movq	2144(%rdx), %rax
	movq	%rax, 25448(%rsp)
	movq	2152(%rdx), %rax
	movq	%rax, 25456(%rsp)
	movq	2160(%rdx), %rax
	movq	%rax, 25464(%rsp)
	movq	2168(%rdx), %rax
	movq	%rax, 25472(%rsp)
	movq	2176(%rdx), %rax
	movq	%rax, 25480(%rsp)
	movq	2184(%rdx), %rax
	movq	%rax, 25488(%rsp)
	movq	2192(%rdx), %rax
	movq	%rax, 25496(%rsp)
	movq	2200(%rdx), %rax
	movq	%rax, 25504(%rsp)
	movq	2208(%rdx), %rax
	movq	%rax, 25512(%rsp)
	movq	2216(%rdx), %rax
	movq	%rax, 25520(%rsp)
	movq	2224(%rdx), %rax
	movq	%rax, 25528(%rsp)
	movq	2232(%rdx), %rax
	movq	%rax, 25536(%rsp)
	movq	2240(%rdx), %rax
	movq	%rax, 25544(%rsp)
	movq	2248(%rdx), %rax
	movq	%rax, 25552(%rsp)
	movq	2256(%rdx), %rax
	movq	%rax, 25560(%rsp)
	movq	2264(%rdx), %rax
	movq	%rax, 25568(%rsp)
	movq	2272(%rdx), %rax
	movq	%rax, 25576(%rsp)
	movq	2280(%rdx), %rax
	movq	%rax, 25584(%rsp)
	movq	2288(%rdx), %rax
	movq	%rax, 25592(%rsp)
	movq	2296(%rdx), %rax
	movq	%rax, 25600(%rsp)
	movq	2304(%rdx), %rax
	movq	%rax, 25608(%rsp)
	movq	2312(%rdx), %rax
	movq	%rax, 25616(%rsp)
	movq	2320(%rdx), %rax
	movq	%rax, 25624(%rsp)
	movq	2328(%rdx), %rax
	movq	%rax, 25632(%rsp)
	movq	2336(%rdx), %rax
	movq	%rax, 25640(%rsp)
	movq	2344(%rdx), %rax
	movq	%rax, 25648(%rsp)
	movq	2352(%rdx), %rax
	movq	%rax, 25656(%rsp)
	movq	2360(%rdx), %rax
	movq	%rax, 25664(%rsp)
	movq	2368(%rdx), %rax
	movq	%rax, 25672(%rsp)
	movq	2376(%rdx), %rax
	movq	%rax, 25680(%rsp)
	movq	2384(%rdx), %rax
	movq	%rax, 25688(%rsp)
	movq	2392(%rdx), %rax
	movq	%rax, 25696(%rsp)
	movq	2400(%rdx), %rax
	movq	%rax, 25704(%rsp)
	movq	2408(%rdx), %rax
	movq	%rax, 25712(%rsp)
	movq	2416(%rdx), %rax
	movq	%rax, 25720(%rsp)
	movq	2424(%rdx), %rax
	movq	%rax, 25728(%rsp)
	movq	2432(%rdx), %rax
	movq	%rax, 25736(%rsp)
	movq	2440(%rdx), %rax
	movq	%rax, 25744(%rsp)
	movq	2448(%rdx), %rax
	movq	%rax, 25752(%rsp)
	movq	2456(%rdx), %rax
	movq	%rax, 25760(%rsp)
	movq	2464(%rdx), %rax
	movq	%rax, 25768(%rsp)
	movq	2472(%rdx), %rax
	movq	%rax, 25776(%rsp)
	movq	2480(%rdx), %rax
	movq	%rax, 25784(%rsp)
	movq	2488(%rdx), %rax
	movq	%rax, 25792(%rsp)
	movq	2496(%rdx), %rax
	movq	%rax, 25800(%rsp)
	movq	2504(%rdx), %rax
	movq	%rax, 25808(%rsp)
	movq	2512(%rdx), %rax
	movq	%rax, 25816(%rsp)
	movq	2520(%rdx), %rax
	movq	%rax, 25824(%rsp)
	movq	2528(%rdx), %rax
	movq	%rax, 25832(%rsp)
	movq	2536(%rdx), %rax
	movq	%rax, 25840(%rsp)
	movq	2544(%rdx), %rax
	movq	%rax, 25848(%rsp)
	movq	2552(%rdx), %rax
	movq	%rax, 25856(%rsp)
	movq	2560(%rdx), %rax
	movq	%rax, 25864(%rsp)
	movq	2568(%rdx), %rax
	movq	%rax, 25872(%rsp)
	movq	2576(%rdx), %rax
	movq	%rax, 25880(%rsp)
	movq	2584(%rdx), %rax
	movq	%rax, 25888(%rsp)
	movq	2592(%rdx), %rax
	movq	%rax, 25896(%rsp)
	movq	2600(%rdx), %rax
	movq	%rax, 25904(%rsp)
	movq	2608(%rdx), %rax
	movq	%rax, 25912(%rsp)
	movq	2616(%rdx), %rax
	movq	%rax, 25920(%rsp)
	movq	2624(%rdx), %rax
	movq	%rax, 25928(%rsp)
	movq	2632(%rdx), %rax
	movq	%rax, 25936(%rsp)
	movq	2640(%rdx), %rax
	movq	%rax, 25944(%rsp)
	movq	2648(%rdx), %rax
	movq	%rax, 25952(%rsp)
	movq	2656(%rdx), %rax
	movq	%rax, 25960(%rsp)
	movq	2664(%rdx), %rax
	movq	%rax, 25968(%rsp)
	movq	2672(%rdx), %rax
	movq	%rax, 25976(%rsp)
	movq	2680(%rdx), %rax
	movq	%rax, 25984(%rsp)
	movq	2688(%rdx), %rax
	movq	%rax, 25992(%rsp)
	movq	2696(%rdx), %rax
	movq	%rax, 26000(%rsp)
	movq	2704(%rdx), %rax
	movq	%rax, 26008(%rsp)
	movq	2712(%rdx), %rax
	movq	%rax, 26016(%rsp)
	movq	2720(%rdx), %rax
	movq	%rax, 26024(%rsp)
	movq	2728(%rdx), %rax
	movq	%rax, 26032(%rsp)
	movq	2736(%rdx), %rax
	movq	%rax, 26040(%rsp)
	movq	2744(%rdx), %rax
	movq	%rax, 26048(%rsp)
	movq	2752(%rdx), %rax
	movq	%rax, 26056(%rsp)
	movq	2760(%rdx), %rax
	movq	%rax, 26064(%rsp)
	movq	2768(%rdx), %rax
	movq	%rax, 26072(%rsp)
	movq	2776(%rdx), %rax
	movq	%rax, 26080(%rsp)
	movq	2784(%rdx), %rax
	movq	%rax, 26088(%rsp)
	movq	2792(%rdx), %rax
	movq	%rax, 26096(%rsp)
	movq	2800(%rdx), %rax
	movq	%rax, 26104(%rsp)
	movq	2808(%rdx), %rax
	movq	%rax, 26112(%rsp)
	movq	2816(%rdx), %rax
	movq	%rax, 26120(%rsp)
	movq	2824(%rdx), %rax
	movq	%rax, 26128(%rsp)
	movq	2832(%rdx), %rax
	movq	%rax, 26136(%rsp)
	movq	2840(%rdx), %rax
	movq	%rax, 26144(%rsp)
	movq	2848(%rdx), %rax
	movq	%rax, 26152(%rsp)
	movq	2856(%rdx), %rax
	movq	%rax, 26160(%rsp)
	movq	2864(%rdx), %rax
	movq	%rax, 26168(%rsp)
	movq	2872(%rdx), %rax
	movq	%rax, 26176(%rsp)
	movq	2880(%rdx), %rax
	movq	%rax, 26184(%rsp)
	movq	2888(%rdx), %rax
	movq	%rax, 26192(%rsp)
	movq	2896(%rdx), %rax
	movq	%rax, 26200(%rsp)
	movq	2904(%rdx), %rax
	movq	%rax, 26208(%rsp)
	movq	2912(%rdx), %rax
	movq	%rax, 26216(%rsp)
	movq	2920(%rdx), %rax
	movq	%rax, 26224(%rsp)
	movq	2928(%rdx), %rax
	movq	%rax, 26232(%rsp)
	movq	2936(%rdx), %rax
	movq	%rax, 26240(%rsp)
	movq	2944(%rdx), %rax
	movq	%rax, 26248(%rsp)
	movq	2952(%rdx), %rax
	movq	%rax, 26256(%rsp)
	movq	2960(%rdx), %rax
	movq	%rax, 26264(%rsp)
	movq	2968(%rdx), %rax
	movq	%rax, 26272(%rsp)
	movq	2976(%rdx), %rax
	movq	%rax, 26280(%rsp)
	movq	2984(%rdx), %rax
	movq	%rax, 26288(%rsp)
	movq	2992(%rdx), %rax
	movq	%rax, 26296(%rsp)
	movq	3000(%rdx), %rax
	movq	%rax, 26304(%rsp)
	movq	3008(%rdx), %rax
	movq	%rax, 26312(%rsp)
	movq	3016(%rdx), %rax
	movq	%rax, 26320(%rsp)
	movq	3024(%rdx), %rax
	movq	%rax, 26328(%rsp)
	movq	3032(%rdx), %rax
	movq	%rax, 26336(%rsp)
	movq	3040(%rdx), %rax
	movq	%rax, 26344(%rsp)
	movq	3048(%rdx), %rax
	movq	%rax, 26352(%rsp)
	movq	3056(%rdx), %rax
	movq	%rax, 26360(%rsp)
	movq	3064(%rdx), %rax
	movq	%rax, 26368(%rsp)
	movq	3072(%rdx), %rax
	movq	%rax, 26376(%rsp)
	movq	3080(%rdx), %rax
	movq	%rax, 26384(%rsp)
	movq	3088(%rdx), %rax
	movq	%rax, 26392(%rsp)
	movq	3096(%rdx), %rax
	movq	%rax, 26400(%rsp)
	movq	3104(%rdx), %rax
	movq	%rax, 26408(%rsp)
	movq	3112(%rdx), %rax
	movq	%rax, 26416(%rsp)
	movq	3120(%rdx), %rax
	movq	%rax, 26424(%rsp)
	movq	3128(%rdx), %rax
	movq	%rax, 26432(%rsp)
	movq	3136(%rdx), %rax
	movq	%rax, 26440(%rsp)
	movq	3144(%rdx), %rax
	movq	%rax, 26448(%rsp)
	movq	3152(%rdx), %rax
	movq	%rax, 26456(%rsp)
	movq	3160(%rdx), %rax
	movq	%rax, 26464(%rsp)
	movq	%rsp, %rax
	leaq	23304(%rsp), %rcx
	leaq	glob_data + 1184(%rip), %rdx
	vmovdqu	(%rdx), %ymm0
	leaq	glob_data + 288(%rip), %rdx
	vmovdqu	(%rdx), %ymm1
	leaq	glob_data + 256(%rip), %rdx
	vmovdqu	(%rdx), %ymm2
	leaq	glob_data + 224(%rip), %rdx
	vmovdqu	(%rdx), %ymm3
	leaq	glob_data + 192(%rip), %rdx
	vmovdqu	(%rdx), %ymm4
	vpbroadcastw	glob_data + 5186(%rip), %ymm5
	vmovdqu	(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 6880(%rsp)
	vmovdqu	22(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 6912(%rsp)
	vmovdqu	44(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 6944(%rsp)
	vmovdqu	66(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 6976(%rsp)
	vmovdqu	88(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7008(%rsp)
	vmovdqu	110(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7040(%rsp)
	vmovdqu	132(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7072(%rsp)
	vmovdqu	154(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7104(%rsp)
	vmovdqu	176(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7136(%rsp)
	vmovdqu	198(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7168(%rsp)
	vmovdqu	220(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7200(%rsp)
	vmovdqu	242(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7232(%rsp)
	vmovdqu	264(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7264(%rsp)
	vmovdqu	286(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7296(%rsp)
	vmovdqu	308(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7328(%rsp)
	vmovdqu	330(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7360(%rsp)
	vmovdqu	352(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7392(%rsp)
	vmovdqu	374(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7424(%rsp)
	vmovdqu	396(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7456(%rsp)
	vmovdqu	418(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7488(%rsp)
	vmovdqu	440(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7520(%rsp)
	vmovdqu	462(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7552(%rsp)
	vmovdqu	484(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7584(%rsp)
	vmovdqu	506(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7616(%rsp)
	vmovdqu	528(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7648(%rsp)
	vmovdqu	550(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7680(%rsp)
	vmovdqu	572(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7712(%rsp)
	vmovdqu	594(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7744(%rsp)
	vmovdqu	616(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7776(%rsp)
	vmovdqu	638(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7808(%rsp)
	vmovdqu	660(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7840(%rsp)
	vmovdqu	682(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7872(%rsp)
	vmovdqu	704(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7904(%rsp)
	vmovdqu	726(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7936(%rsp)
	vmovdqu	748(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 7968(%rsp)
	vmovdqu	770(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8000(%rsp)
	vmovdqu	792(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8032(%rsp)
	vmovdqu	814(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8064(%rsp)
	vmovdqu	836(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8096(%rsp)
	vmovdqu	858(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8128(%rsp)
	vmovdqu	880(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8160(%rsp)
	vmovdqu	902(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8192(%rsp)
	vmovdqu	924(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8224(%rsp)
	vmovdqu	946(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8256(%rsp)
	vmovdqu	968(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8288(%rsp)
	vmovdqu	990(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8320(%rsp)
	vmovdqu	1012(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8352(%rsp)
	vmovdqu	1034(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8384(%rsp)
	vmovdqu	1056(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8416(%rsp)
	vmovdqu	1078(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8448(%rsp)
	vmovdqu	1100(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8480(%rsp)
	vmovdqu	1122(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8512(%rsp)
	vmovdqu	1144(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8544(%rsp)
	vmovdqu	1166(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8576(%rsp)
	vmovdqu	1188(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8608(%rsp)
	vmovdqu	1210(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8640(%rsp)
	vmovdqu	1232(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8672(%rsp)
	vmovdqu	1254(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8704(%rsp)
	vmovdqu	1276(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8736(%rsp)
	vmovdqu	1298(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8768(%rsp)
	vmovdqu	1320(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8800(%rsp)
	vmovdqu	1342(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8832(%rsp)
	vmovdqu	1364(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8864(%rsp)
	vmovdqu	1386(%rsi), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm1
	vpsrlvd	%ymm2, %ymm1, %ymm1
	vpsrlvq	%ymm3, %ymm1, %ymm1
	vpmullw	%ymm4, %ymm1, %ymm1
	vpsrlw	$1, %ymm1, %ymm1
	vpand	%ymm5, %ymm1, %ymm1
	vpmulhrsw	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, 8896(%rsp)
	leaq	128(%rsp), %rdx
	leaq	1408(%rsi), %rsi
	leaq	-24(%rsp), %rsp
	call	L_i_poly_decompress$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$85:
	leaq	24(%rsp), %rsp
	movq	(%rcx), %rdx
	movq	%rdx, 2176(%rsp)
	movq	8(%rcx), %rdx
	movq	%rdx, 2184(%rsp)
	movq	16(%rcx), %rdx
	movq	%rdx, 2192(%rsp)
	movq	24(%rcx), %rdx
	movq	%rdx, 2200(%rsp)
	movq	32(%rcx), %rdx
	movq	%rdx, 2208(%rsp)
	movq	40(%rcx), %rdx
	movq	%rdx, 2216(%rsp)
	movq	48(%rcx), %rdx
	movq	%rdx, 2224(%rsp)
	movq	56(%rcx), %rdx
	movq	%rdx, 2232(%rsp)
	movq	64(%rcx), %rdx
	movq	%rdx, 2240(%rsp)
	movq	72(%rcx), %rdx
	movq	%rdx, 2248(%rsp)
	movq	80(%rcx), %rdx
	movq	%rdx, 2256(%rsp)
	movq	88(%rcx), %rdx
	movq	%rdx, 2264(%rsp)
	movq	96(%rcx), %rdx
	movq	%rdx, 2272(%rsp)
	movq	104(%rcx), %rdx
	movq	%rdx, 2280(%rsp)
	movq	112(%rcx), %rdx
	movq	%rdx, 2288(%rsp)
	movq	120(%rcx), %rdx
	movq	%rdx, 2296(%rsp)
	movq	128(%rcx), %rdx
	movq	%rdx, 2304(%rsp)
	movq	136(%rcx), %rdx
	movq	%rdx, 2312(%rsp)
	movq	144(%rcx), %rdx
	movq	%rdx, 2320(%rsp)
	movq	152(%rcx), %rdx
	movq	%rdx, 2328(%rsp)
	movq	160(%rcx), %rdx
	movq	%rdx, 2336(%rsp)
	movq	168(%rcx), %rdx
	movq	%rdx, 2344(%rsp)
	movq	176(%rcx), %rdx
	movq	%rdx, 2352(%rsp)
	movq	184(%rcx), %rdx
	movq	%rdx, 2360(%rsp)
	movq	192(%rcx), %rdx
	movq	%rdx, 2368(%rsp)
	movq	200(%rcx), %rdx
	movq	%rdx, 2376(%rsp)
	movq	208(%rcx), %rdx
	movq	%rdx, 2384(%rsp)
	movq	216(%rcx), %rdx
	movq	%rdx, 2392(%rsp)
	movq	224(%rcx), %rdx
	movq	%rdx, 2400(%rsp)
	movq	232(%rcx), %rdx
	movq	%rdx, 2408(%rsp)
	movq	240(%rcx), %rdx
	movq	%rdx, 2416(%rsp)
	movq	248(%rcx), %rdx
	movq	%rdx, 2424(%rsp)
	movq	256(%rcx), %rdx
	movq	%rdx, 2432(%rsp)
	movq	264(%rcx), %rdx
	movq	%rdx, 2440(%rsp)
	movq	272(%rcx), %rdx
	movq	%rdx, 2448(%rsp)
	movq	280(%rcx), %rdx
	movq	%rdx, 2456(%rsp)
	movq	288(%rcx), %rdx
	movq	%rdx, 2464(%rsp)
	movq	296(%rcx), %rdx
	movq	%rdx, 2472(%rsp)
	movq	304(%rcx), %rdx
	movq	%rdx, 2480(%rsp)
	movq	312(%rcx), %rdx
	movq	%rdx, 2488(%rsp)
	movq	320(%rcx), %rdx
	movq	%rdx, 2496(%rsp)
	movq	328(%rcx), %rdx
	movq	%rdx, 2504(%rsp)
	movq	336(%rcx), %rdx
	movq	%rdx, 2512(%rsp)
	movq	344(%rcx), %rdx
	movq	%rdx, 2520(%rsp)
	movq	352(%rcx), %rdx
	movq	%rdx, 2528(%rsp)
	movq	360(%rcx), %rdx
	movq	%rdx, 2536(%rsp)
	movq	368(%rcx), %rdx
	movq	%rdx, 2544(%rsp)
	movq	376(%rcx), %rdx
	movq	%rdx, 2552(%rsp)
	movq	384(%rcx), %rdx
	movq	%rdx, 2560(%rsp)
	movq	392(%rcx), %rdx
	movq	%rdx, 2568(%rsp)
	movq	400(%rcx), %rdx
	movq	%rdx, 2576(%rsp)
	movq	408(%rcx), %rdx
	movq	%rdx, 2584(%rsp)
	movq	416(%rcx), %rdx
	movq	%rdx, 2592(%rsp)
	movq	424(%rcx), %rdx
	movq	%rdx, 2600(%rsp)
	movq	432(%rcx), %rdx
	movq	%rdx, 2608(%rsp)
	movq	440(%rcx), %rdx
	movq	%rdx, 2616(%rsp)
	movq	448(%rcx), %rdx
	movq	%rdx, 2624(%rsp)
	movq	456(%rcx), %rdx
	movq	%rdx, 2632(%rsp)
	movq	464(%rcx), %rdx
	movq	%rdx, 2640(%rsp)
	movq	472(%rcx), %rdx
	movq	%rdx, 2648(%rsp)
	movq	480(%rcx), %rdx
	movq	%rdx, 2656(%rsp)
	movq	488(%rcx), %rdx
	movq	%rdx, 2664(%rsp)
	movq	496(%rcx), %rdx
	movq	%rdx, 2672(%rsp)
	movq	504(%rcx), %rdx
	movq	%rdx, 2680(%rsp)
	movq	512(%rcx), %rdx
	movq	%rdx, 2688(%rsp)
	movq	520(%rcx), %rdx
	movq	%rdx, 2696(%rsp)
	movq	528(%rcx), %rdx
	movq	%rdx, 2704(%rsp)
	movq	536(%rcx), %rdx
	movq	%rdx, 2712(%rsp)
	movq	544(%rcx), %rdx
	movq	%rdx, 2720(%rsp)
	movq	552(%rcx), %rdx
	movq	%rdx, 2728(%rsp)
	movq	560(%rcx), %rdx
	movq	%rdx, 2736(%rsp)
	movq	568(%rcx), %rdx
	movq	%rdx, 2744(%rsp)
	movq	576(%rcx), %rdx
	movq	%rdx, 2752(%rsp)
	movq	584(%rcx), %rdx
	movq	%rdx, 2760(%rsp)
	movq	592(%rcx), %rdx
	movq	%rdx, 2768(%rsp)
	movq	600(%rcx), %rdx
	movq	%rdx, 2776(%rsp)
	movq	608(%rcx), %rdx
	movq	%rdx, 2784(%rsp)
	movq	616(%rcx), %rdx
	movq	%rdx, 2792(%rsp)
	movq	624(%rcx), %rdx
	movq	%rdx, 2800(%rsp)
	movq	632(%rcx), %rdx
	movq	%rdx, 2808(%rsp)
	movq	640(%rcx), %rdx
	movq	%rdx, 2816(%rsp)
	movq	648(%rcx), %rdx
	movq	%rdx, 2824(%rsp)
	movq	656(%rcx), %rdx
	movq	%rdx, 2832(%rsp)
	movq	664(%rcx), %rdx
	movq	%rdx, 2840(%rsp)
	movq	672(%rcx), %rdx
	movq	%rdx, 2848(%rsp)
	movq	680(%rcx), %rdx
	movq	%rdx, 2856(%rsp)
	movq	688(%rcx), %rdx
	movq	%rdx, 2864(%rsp)
	movq	696(%rcx), %rdx
	movq	%rdx, 2872(%rsp)
	movq	704(%rcx), %rdx
	movq	%rdx, 2880(%rsp)
	movq	712(%rcx), %rdx
	movq	%rdx, 2888(%rsp)
	movq	720(%rcx), %rdx
	movq	%rdx, 2896(%rsp)
	movq	728(%rcx), %rdx
	movq	%rdx, 2904(%rsp)
	movq	736(%rcx), %rdx
	movq	%rdx, 2912(%rsp)
	movq	744(%rcx), %rdx
	movq	%rdx, 2920(%rsp)
	movq	752(%rcx), %rdx
	movq	%rdx, 2928(%rsp)
	movq	760(%rcx), %rdx
	movq	%rdx, 2936(%rsp)
	movq	768(%rcx), %rdx
	movq	%rdx, 2944(%rsp)
	movq	776(%rcx), %rdx
	movq	%rdx, 2952(%rsp)
	movq	784(%rcx), %rdx
	movq	%rdx, 2960(%rsp)
	movq	792(%rcx), %rdx
	movq	%rdx, 2968(%rsp)
	movq	800(%rcx), %rdx
	movq	%rdx, 2976(%rsp)
	movq	808(%rcx), %rdx
	movq	%rdx, 2984(%rsp)
	movq	816(%rcx), %rdx
	movq	%rdx, 2992(%rsp)
	movq	824(%rcx), %rdx
	movq	%rdx, 3000(%rsp)
	movq	832(%rcx), %rdx
	movq	%rdx, 3008(%rsp)
	movq	840(%rcx), %rdx
	movq	%rdx, 3016(%rsp)
	movq	848(%rcx), %rdx
	movq	%rdx, 3024(%rsp)
	movq	856(%rcx), %rdx
	movq	%rdx, 3032(%rsp)
	movq	864(%rcx), %rdx
	movq	%rdx, 3040(%rsp)
	movq	872(%rcx), %rdx
	movq	%rdx, 3048(%rsp)
	movq	880(%rcx), %rdx
	movq	%rdx, 3056(%rsp)
	movq	888(%rcx), %rdx
	movq	%rdx, 3064(%rsp)
	movq	896(%rcx), %rdx
	movq	%rdx, 3072(%rsp)
	movq	904(%rcx), %rdx
	movq	%rdx, 3080(%rsp)
	movq	912(%rcx), %rdx
	movq	%rdx, 3088(%rsp)
	movq	920(%rcx), %rdx
	movq	%rdx, 3096(%rsp)
	movq	928(%rcx), %rdx
	movq	%rdx, 3104(%rsp)
	movq	936(%rcx), %rdx
	movq	%rdx, 3112(%rsp)
	movq	944(%rcx), %rdx
	movq	%rdx, 3120(%rsp)
	movq	952(%rcx), %rdx
	movq	%rdx, 3128(%rsp)
	movq	960(%rcx), %rdx
	movq	%rdx, 3136(%rsp)
	movq	968(%rcx), %rdx
	movq	%rdx, 3144(%rsp)
	movq	976(%rcx), %rdx
	movq	%rdx, 3152(%rsp)
	movq	984(%rcx), %rdx
	movq	%rdx, 3160(%rsp)
	movq	992(%rcx), %rdx
	movq	%rdx, 3168(%rsp)
	movq	1000(%rcx), %rdx
	movq	%rdx, 3176(%rsp)
	movq	1008(%rcx), %rdx
	movq	%rdx, 3184(%rsp)
	movq	1016(%rcx), %rdx
	movq	%rdx, 3192(%rsp)
	movq	1024(%rcx), %rdx
	movq	%rdx, 3200(%rsp)
	movq	1032(%rcx), %rdx
	movq	%rdx, 3208(%rsp)
	movq	1040(%rcx), %rdx
	movq	%rdx, 3216(%rsp)
	movq	1048(%rcx), %rdx
	movq	%rdx, 3224(%rsp)
	movq	1056(%rcx), %rdx
	movq	%rdx, 3232(%rsp)
	movq	1064(%rcx), %rdx
	movq	%rdx, 3240(%rsp)
	movq	1072(%rcx), %rdx
	movq	%rdx, 3248(%rsp)
	movq	1080(%rcx), %rdx
	movq	%rdx, 3256(%rsp)
	movq	1088(%rcx), %rdx
	movq	%rdx, 3264(%rsp)
	movq	1096(%rcx), %rdx
	movq	%rdx, 3272(%rsp)
	movq	1104(%rcx), %rdx
	movq	%rdx, 3280(%rsp)
	movq	1112(%rcx), %rdx
	movq	%rdx, 3288(%rsp)
	movq	1120(%rcx), %rdx
	movq	%rdx, 3296(%rsp)
	movq	1128(%rcx), %rdx
	movq	%rdx, 3304(%rsp)
	movq	1136(%rcx), %rdx
	movq	%rdx, 3312(%rsp)
	movq	1144(%rcx), %rdx
	movq	%rdx, 3320(%rsp)
	movq	1152(%rcx), %rdx
	movq	%rdx, 3328(%rsp)
	movq	1160(%rcx), %rdx
	movq	%rdx, 3336(%rsp)
	movq	1168(%rcx), %rdx
	movq	%rdx, 3344(%rsp)
	movq	1176(%rcx), %rdx
	movq	%rdx, 3352(%rsp)
	movq	1184(%rcx), %rdx
	movq	%rdx, 3360(%rsp)
	movq	1192(%rcx), %rdx
	movq	%rdx, 3368(%rsp)
	movq	1200(%rcx), %rdx
	movq	%rdx, 3376(%rsp)
	movq	1208(%rcx), %rdx
	movq	%rdx, 3384(%rsp)
	movq	1216(%rcx), %rdx
	movq	%rdx, 3392(%rsp)
	movq	1224(%rcx), %rdx
	movq	%rdx, 3400(%rsp)
	movq	1232(%rcx), %rdx
	movq	%rdx, 3408(%rsp)
	movq	1240(%rcx), %rdx
	movq	%rdx, 3416(%rsp)
	movq	1248(%rcx), %rdx
	movq	%rdx, 3424(%rsp)
	movq	1256(%rcx), %rdx
	movq	%rdx, 3432(%rsp)
	movq	1264(%rcx), %rdx
	movq	%rdx, 3440(%rsp)
	movq	1272(%rcx), %rdx
	movq	%rdx, 3448(%rsp)
	movq	1280(%rcx), %rdx
	movq	%rdx, 3456(%rsp)
	movq	1288(%rcx), %rdx
	movq	%rdx, 3464(%rsp)
	movq	1296(%rcx), %rdx
	movq	%rdx, 3472(%rsp)
	movq	1304(%rcx), %rdx
	movq	%rdx, 3480(%rsp)
	movq	1312(%rcx), %rdx
	movq	%rdx, 3488(%rsp)
	movq	1320(%rcx), %rdx
	movq	%rdx, 3496(%rsp)
	movq	1328(%rcx), %rdx
	movq	%rdx, 3504(%rsp)
	movq	1336(%rcx), %rdx
	movq	%rdx, 3512(%rsp)
	movq	1344(%rcx), %rdx
	movq	%rdx, 3520(%rsp)
	movq	1352(%rcx), %rdx
	movq	%rdx, 3528(%rsp)
	movq	1360(%rcx), %rdx
	movq	%rdx, 3536(%rsp)
	movq	1368(%rcx), %rdx
	movq	%rdx, 3544(%rsp)
	movq	1376(%rcx), %rdx
	movq	%rdx, 3552(%rsp)
	movq	1384(%rcx), %rdx
	movq	%rdx, 3560(%rsp)
	movq	1392(%rcx), %rdx
	movq	%rdx, 3568(%rsp)
	movq	1400(%rcx), %rdx
	movq	%rdx, 3576(%rsp)
	movq	1408(%rcx), %rdx
	movq	%rdx, 3584(%rsp)
	movq	1416(%rcx), %rdx
	movq	%rdx, 3592(%rsp)
	movq	1424(%rcx), %rdx
	movq	%rdx, 3600(%rsp)
	movq	1432(%rcx), %rdx
	movq	%rdx, 3608(%rsp)
	movq	1440(%rcx), %rdx
	movq	%rdx, 3616(%rsp)
	movq	1448(%rcx), %rdx
	movq	%rdx, 3624(%rsp)
	movq	1456(%rcx), %rdx
	movq	%rdx, 3632(%rsp)
	movq	1464(%rcx), %rdx
	movq	%rdx, 3640(%rsp)
	movq	1472(%rcx), %rdx
	movq	%rdx, 3648(%rsp)
	movq	1480(%rcx), %rdx
	movq	%rdx, 3656(%rsp)
	movq	1488(%rcx), %rdx
	movq	%rdx, 3664(%rsp)
	movq	1496(%rcx), %rdx
	movq	%rdx, 3672(%rsp)
	movq	1504(%rcx), %rdx
	movq	%rdx, 3680(%rsp)
	movq	1512(%rcx), %rdx
	movq	%rdx, 3688(%rsp)
	movq	1520(%rcx), %rdx
	movq	%rdx, 3696(%rsp)
	movq	1528(%rcx), %rcx
	movq	%rcx, 3704(%rsp)
	leaq	8928(%rsp), %rcx
	leaq	2176(%rsp), %rsi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$84:
	leaq	9440(%rsp), %rcx
	leaq	2560(%rsp), %rsi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$83:
	leaq	9952(%rsp), %rcx
	leaq	2944(%rsp), %rsi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$82:
	leaq	10464(%rsp), %rcx
	leaq	3328(%rsp), %rsi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$81:
	leaq	6880(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$80:
	leaq	7392(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$79:
	leaq	7904(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$78:
	leaq	8416(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$77:
	leaq	640(%rsp), %rcx
	leaq	8928(%rsp), %rdx
	leaq	6880(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$76:
	leaq	1152(%rsp), %rcx
	leaq	9440(%rsp), %rdx
	leaq	7392(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$75:
	leaq	640(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$74:
	leaq	1152(%rsp), %rcx
	leaq	9952(%rsp), %rdx
	leaq	7904(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$73:
	leaq	640(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$72:
	leaq	1152(%rsp), %rcx
	leaq	10464(%rsp), %rdx
	leaq	8416(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$71:
	leaq	640(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$70:
	leaq	640(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$69:
	leaq	1152(%rsp), %rcx
	leaq	128(%rsp), %rdx
	leaq	640(%rsp), %rsi
	call	L_poly_sub$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$68:
	leaq	1152(%rsp), %rcx
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	leaq	1152(%rsp), %rcx
	call	L_i_poly_tomsg$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$67:
	movq	26408(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	26416(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	26424(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	26432(%rsp), %rax
	movq	%rax, 56(%rsp)
	leaq	64(%rsp), %rax
	movq	%rsp, %rcx
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$66:
	leaq	3712(%rsp), %rcx
	movq	%rsp, %rdx
	leaq	24840(%rsp), %rax
	leaq	96(%rsp), %r8
	movq	%rcx, %mm3
	movq	%rax, %rcx
	movq	(%rcx), %rsi
	movq	%rsi, 2176(%rsp)
	movq	8(%rcx), %rsi
	movq	%rsi, 2184(%rsp)
	movq	16(%rcx), %rsi
	movq	%rsi, 2192(%rsp)
	movq	24(%rcx), %rsi
	movq	%rsi, 2200(%rsp)
	movq	32(%rcx), %rsi
	movq	%rsi, 2208(%rsp)
	movq	40(%rcx), %rsi
	movq	%rsi, 2216(%rsp)
	movq	48(%rcx), %rsi
	movq	%rsi, 2224(%rsp)
	movq	56(%rcx), %rsi
	movq	%rsi, 2232(%rsp)
	movq	64(%rcx), %rsi
	movq	%rsi, 2240(%rsp)
	movq	72(%rcx), %rsi
	movq	%rsi, 2248(%rsp)
	movq	80(%rcx), %rsi
	movq	%rsi, 2256(%rsp)
	movq	88(%rcx), %rsi
	movq	%rsi, 2264(%rsp)
	movq	96(%rcx), %rsi
	movq	%rsi, 2272(%rsp)
	movq	104(%rcx), %rsi
	movq	%rsi, 2280(%rsp)
	movq	112(%rcx), %rsi
	movq	%rsi, 2288(%rsp)
	movq	120(%rcx), %rsi
	movq	%rsi, 2296(%rsp)
	movq	128(%rcx), %rsi
	movq	%rsi, 2304(%rsp)
	movq	136(%rcx), %rsi
	movq	%rsi, 2312(%rsp)
	movq	144(%rcx), %rsi
	movq	%rsi, 2320(%rsp)
	movq	152(%rcx), %rsi
	movq	%rsi, 2328(%rsp)
	movq	160(%rcx), %rsi
	movq	%rsi, 2336(%rsp)
	movq	168(%rcx), %rsi
	movq	%rsi, 2344(%rsp)
	movq	176(%rcx), %rsi
	movq	%rsi, 2352(%rsp)
	movq	184(%rcx), %rsi
	movq	%rsi, 2360(%rsp)
	movq	192(%rcx), %rsi
	movq	%rsi, 2368(%rsp)
	movq	200(%rcx), %rsi
	movq	%rsi, 2376(%rsp)
	movq	208(%rcx), %rsi
	movq	%rsi, 2384(%rsp)
	movq	216(%rcx), %rsi
	movq	%rsi, 2392(%rsp)
	movq	224(%rcx), %rsi
	movq	%rsi, 2400(%rsp)
	movq	232(%rcx), %rsi
	movq	%rsi, 2408(%rsp)
	movq	240(%rcx), %rsi
	movq	%rsi, 2416(%rsp)
	movq	248(%rcx), %rsi
	movq	%rsi, 2424(%rsp)
	movq	256(%rcx), %rsi
	movq	%rsi, 2432(%rsp)
	movq	264(%rcx), %rsi
	movq	%rsi, 2440(%rsp)
	movq	272(%rcx), %rsi
	movq	%rsi, 2448(%rsp)
	movq	280(%rcx), %rsi
	movq	%rsi, 2456(%rsp)
	movq	288(%rcx), %rsi
	movq	%rsi, 2464(%rsp)
	movq	296(%rcx), %rsi
	movq	%rsi, 2472(%rsp)
	movq	304(%rcx), %rsi
	movq	%rsi, 2480(%rsp)
	movq	312(%rcx), %rsi
	movq	%rsi, 2488(%rsp)
	movq	320(%rcx), %rsi
	movq	%rsi, 2496(%rsp)
	movq	328(%rcx), %rsi
	movq	%rsi, 2504(%rsp)
	movq	336(%rcx), %rsi
	movq	%rsi, 2512(%rsp)
	movq	344(%rcx), %rsi
	movq	%rsi, 2520(%rsp)
	movq	352(%rcx), %rsi
	movq	%rsi, 2528(%rsp)
	movq	360(%rcx), %rsi
	movq	%rsi, 2536(%rsp)
	movq	368(%rcx), %rsi
	movq	%rsi, 2544(%rsp)
	movq	376(%rcx), %rsi
	movq	%rsi, 2552(%rsp)
	movq	384(%rcx), %rsi
	movq	%rsi, 2560(%rsp)
	movq	392(%rcx), %rsi
	movq	%rsi, 2568(%rsp)
	movq	400(%rcx), %rsi
	movq	%rsi, 2576(%rsp)
	movq	408(%rcx), %rsi
	movq	%rsi, 2584(%rsp)
	movq	416(%rcx), %rsi
	movq	%rsi, 2592(%rsp)
	movq	424(%rcx), %rsi
	movq	%rsi, 2600(%rsp)
	movq	432(%rcx), %rsi
	movq	%rsi, 2608(%rsp)
	movq	440(%rcx), %rsi
	movq	%rsi, 2616(%rsp)
	movq	448(%rcx), %rsi
	movq	%rsi, 2624(%rsp)
	movq	456(%rcx), %rsi
	movq	%rsi, 2632(%rsp)
	movq	464(%rcx), %rsi
	movq	%rsi, 2640(%rsp)
	movq	472(%rcx), %rsi
	movq	%rsi, 2648(%rsp)
	movq	480(%rcx), %rsi
	movq	%rsi, 2656(%rsp)
	movq	488(%rcx), %rsi
	movq	%rsi, 2664(%rsp)
	movq	496(%rcx), %rsi
	movq	%rsi, 2672(%rsp)
	movq	504(%rcx), %rsi
	movq	%rsi, 2680(%rsp)
	movq	512(%rcx), %rsi
	movq	%rsi, 2688(%rsp)
	movq	520(%rcx), %rsi
	movq	%rsi, 2696(%rsp)
	movq	528(%rcx), %rsi
	movq	%rsi, 2704(%rsp)
	movq	536(%rcx), %rsi
	movq	%rsi, 2712(%rsp)
	movq	544(%rcx), %rsi
	movq	%rsi, 2720(%rsp)
	movq	552(%rcx), %rsi
	movq	%rsi, 2728(%rsp)
	movq	560(%rcx), %rsi
	movq	%rsi, 2736(%rsp)
	movq	568(%rcx), %rsi
	movq	%rsi, 2744(%rsp)
	movq	576(%rcx), %rsi
	movq	%rsi, 2752(%rsp)
	movq	584(%rcx), %rsi
	movq	%rsi, 2760(%rsp)
	movq	592(%rcx), %rsi
	movq	%rsi, 2768(%rsp)
	movq	600(%rcx), %rsi
	movq	%rsi, 2776(%rsp)
	movq	608(%rcx), %rsi
	movq	%rsi, 2784(%rsp)
	movq	616(%rcx), %rsi
	movq	%rsi, 2792(%rsp)
	movq	624(%rcx), %rsi
	movq	%rsi, 2800(%rsp)
	movq	632(%rcx), %rsi
	movq	%rsi, 2808(%rsp)
	movq	640(%rcx), %rsi
	movq	%rsi, 2816(%rsp)
	movq	648(%rcx), %rsi
	movq	%rsi, 2824(%rsp)
	movq	656(%rcx), %rsi
	movq	%rsi, 2832(%rsp)
	movq	664(%rcx), %rsi
	movq	%rsi, 2840(%rsp)
	movq	672(%rcx), %rsi
	movq	%rsi, 2848(%rsp)
	movq	680(%rcx), %rsi
	movq	%rsi, 2856(%rsp)
	movq	688(%rcx), %rsi
	movq	%rsi, 2864(%rsp)
	movq	696(%rcx), %rsi
	movq	%rsi, 2872(%rsp)
	movq	704(%rcx), %rsi
	movq	%rsi, 2880(%rsp)
	movq	712(%rcx), %rsi
	movq	%rsi, 2888(%rsp)
	movq	720(%rcx), %rsi
	movq	%rsi, 2896(%rsp)
	movq	728(%rcx), %rsi
	movq	%rsi, 2904(%rsp)
	movq	736(%rcx), %rsi
	movq	%rsi, 2912(%rsp)
	movq	744(%rcx), %rsi
	movq	%rsi, 2920(%rsp)
	movq	752(%rcx), %rsi
	movq	%rsi, 2928(%rsp)
	movq	760(%rcx), %rsi
	movq	%rsi, 2936(%rsp)
	movq	768(%rcx), %rsi
	movq	%rsi, 2944(%rsp)
	movq	776(%rcx), %rsi
	movq	%rsi, 2952(%rsp)
	movq	784(%rcx), %rsi
	movq	%rsi, 2960(%rsp)
	movq	792(%rcx), %rsi
	movq	%rsi, 2968(%rsp)
	movq	800(%rcx), %rsi
	movq	%rsi, 2976(%rsp)
	movq	808(%rcx), %rsi
	movq	%rsi, 2984(%rsp)
	movq	816(%rcx), %rsi
	movq	%rsi, 2992(%rsp)
	movq	824(%rcx), %rsi
	movq	%rsi, 3000(%rsp)
	movq	832(%rcx), %rsi
	movq	%rsi, 3008(%rsp)
	movq	840(%rcx), %rsi
	movq	%rsi, 3016(%rsp)
	movq	848(%rcx), %rsi
	movq	%rsi, 3024(%rsp)
	movq	856(%rcx), %rsi
	movq	%rsi, 3032(%rsp)
	movq	864(%rcx), %rsi
	movq	%rsi, 3040(%rsp)
	movq	872(%rcx), %rsi
	movq	%rsi, 3048(%rsp)
	movq	880(%rcx), %rsi
	movq	%rsi, 3056(%rsp)
	movq	888(%rcx), %rsi
	movq	%rsi, 3064(%rsp)
	movq	896(%rcx), %rsi
	movq	%rsi, 3072(%rsp)
	movq	904(%rcx), %rsi
	movq	%rsi, 3080(%rsp)
	movq	912(%rcx), %rsi
	movq	%rsi, 3088(%rsp)
	movq	920(%rcx), %rsi
	movq	%rsi, 3096(%rsp)
	movq	928(%rcx), %rsi
	movq	%rsi, 3104(%rsp)
	movq	936(%rcx), %rsi
	movq	%rsi, 3112(%rsp)
	movq	944(%rcx), %rsi
	movq	%rsi, 3120(%rsp)
	movq	952(%rcx), %rsi
	movq	%rsi, 3128(%rsp)
	movq	960(%rcx), %rsi
	movq	%rsi, 3136(%rsp)
	movq	968(%rcx), %rsi
	movq	%rsi, 3144(%rsp)
	movq	976(%rcx), %rsi
	movq	%rsi, 3152(%rsp)
	movq	984(%rcx), %rsi
	movq	%rsi, 3160(%rsp)
	movq	992(%rcx), %rsi
	movq	%rsi, 3168(%rsp)
	movq	1000(%rcx), %rsi
	movq	%rsi, 3176(%rsp)
	movq	1008(%rcx), %rsi
	movq	%rsi, 3184(%rsp)
	movq	1016(%rcx), %rsi
	movq	%rsi, 3192(%rsp)
	movq	1024(%rcx), %rsi
	movq	%rsi, 3200(%rsp)
	movq	1032(%rcx), %rsi
	movq	%rsi, 3208(%rsp)
	movq	1040(%rcx), %rsi
	movq	%rsi, 3216(%rsp)
	movq	1048(%rcx), %rsi
	movq	%rsi, 3224(%rsp)
	movq	1056(%rcx), %rsi
	movq	%rsi, 3232(%rsp)
	movq	1064(%rcx), %rsi
	movq	%rsi, 3240(%rsp)
	movq	1072(%rcx), %rsi
	movq	%rsi, 3248(%rsp)
	movq	1080(%rcx), %rsi
	movq	%rsi, 3256(%rsp)
	movq	1088(%rcx), %rsi
	movq	%rsi, 3264(%rsp)
	movq	1096(%rcx), %rsi
	movq	%rsi, 3272(%rsp)
	movq	1104(%rcx), %rsi
	movq	%rsi, 3280(%rsp)
	movq	1112(%rcx), %rsi
	movq	%rsi, 3288(%rsp)
	movq	1120(%rcx), %rsi
	movq	%rsi, 3296(%rsp)
	movq	1128(%rcx), %rsi
	movq	%rsi, 3304(%rsp)
	movq	1136(%rcx), %rsi
	movq	%rsi, 3312(%rsp)
	movq	1144(%rcx), %rsi
	movq	%rsi, 3320(%rsp)
	movq	1152(%rcx), %rsi
	movq	%rsi, 3328(%rsp)
	movq	1160(%rcx), %rsi
	movq	%rsi, 3336(%rsp)
	movq	1168(%rcx), %rsi
	movq	%rsi, 3344(%rsp)
	movq	1176(%rcx), %rsi
	movq	%rsi, 3352(%rsp)
	movq	1184(%rcx), %rsi
	movq	%rsi, 3360(%rsp)
	movq	1192(%rcx), %rsi
	movq	%rsi, 3368(%rsp)
	movq	1200(%rcx), %rsi
	movq	%rsi, 3376(%rsp)
	movq	1208(%rcx), %rsi
	movq	%rsi, 3384(%rsp)
	movq	1216(%rcx), %rsi
	movq	%rsi, 3392(%rsp)
	movq	1224(%rcx), %rsi
	movq	%rsi, 3400(%rsp)
	movq	1232(%rcx), %rsi
	movq	%rsi, 3408(%rsp)
	movq	1240(%rcx), %rsi
	movq	%rsi, 3416(%rsp)
	movq	1248(%rcx), %rsi
	movq	%rsi, 3424(%rsp)
	movq	1256(%rcx), %rsi
	movq	%rsi, 3432(%rsp)
	movq	1264(%rcx), %rsi
	movq	%rsi, 3440(%rsp)
	movq	1272(%rcx), %rsi
	movq	%rsi, 3448(%rsp)
	movq	1280(%rcx), %rsi
	movq	%rsi, 3456(%rsp)
	movq	1288(%rcx), %rsi
	movq	%rsi, 3464(%rsp)
	movq	1296(%rcx), %rsi
	movq	%rsi, 3472(%rsp)
	movq	1304(%rcx), %rsi
	movq	%rsi, 3480(%rsp)
	movq	1312(%rcx), %rsi
	movq	%rsi, 3488(%rsp)
	movq	1320(%rcx), %rsi
	movq	%rsi, 3496(%rsp)
	movq	1328(%rcx), %rsi
	movq	%rsi, 3504(%rsp)
	movq	1336(%rcx), %rsi
	movq	%rsi, 3512(%rsp)
	movq	1344(%rcx), %rsi
	movq	%rsi, 3520(%rsp)
	movq	1352(%rcx), %rsi
	movq	%rsi, 3528(%rsp)
	movq	1360(%rcx), %rsi
	movq	%rsi, 3536(%rsp)
	movq	1368(%rcx), %rsi
	movq	%rsi, 3544(%rsp)
	movq	1376(%rcx), %rsi
	movq	%rsi, 3552(%rsp)
	movq	1384(%rcx), %rsi
	movq	%rsi, 3560(%rsp)
	movq	1392(%rcx), %rsi
	movq	%rsi, 3568(%rsp)
	movq	1400(%rcx), %rsi
	movq	%rsi, 3576(%rsp)
	movq	1408(%rcx), %rsi
	movq	%rsi, 3584(%rsp)
	movq	1416(%rcx), %rsi
	movq	%rsi, 3592(%rsp)
	movq	1424(%rcx), %rsi
	movq	%rsi, 3600(%rsp)
	movq	1432(%rcx), %rsi
	movq	%rsi, 3608(%rsp)
	movq	1440(%rcx), %rsi
	movq	%rsi, 3616(%rsp)
	movq	1448(%rcx), %rsi
	movq	%rsi, 3624(%rsp)
	movq	1456(%rcx), %rsi
	movq	%rsi, 3632(%rsp)
	movq	1464(%rcx), %rsi
	movq	%rsi, 3640(%rsp)
	movq	1472(%rcx), %rsi
	movq	%rsi, 3648(%rsp)
	movq	1480(%rcx), %rsi
	movq	%rsi, 3656(%rsp)
	movq	1488(%rcx), %rsi
	movq	%rsi, 3664(%rsp)
	movq	1496(%rcx), %rsi
	movq	%rsi, 3672(%rsp)
	movq	1504(%rcx), %rsi
	movq	%rsi, 3680(%rsp)
	movq	1512(%rcx), %rsi
	movq	%rsi, 3688(%rsp)
	movq	1520(%rcx), %rsi
	movq	%rsi, 3696(%rsp)
	movq	1528(%rcx), %rcx
	movq	%rcx, 3704(%rsp)
	leaq	6880(%rsp), %rcx
	leaq	2176(%rsp), %rsi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$65:
	leaq	7392(%rsp), %rcx
	leaq	2560(%rsp), %rsi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$64:
	leaq	7904(%rsp), %rcx
	leaq	2944(%rsp), %rsi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$63:
	leaq	8416(%rsp), %rcx
	leaq	3328(%rsp), %rsi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$62:
	movq	1536(%rax), %rcx
	movq	%rcx, 23272(%rsp)
	movq	1544(%rax), %rcx
	movq	%rcx, 23280(%rsp)
	movq	1552(%rax), %rcx
	movq	%rcx, 23288(%rsp)
	movq	1560(%rax), %rax
	movq	%rax, 23296(%rsp)
	leaq	1152(%rsp), %rax
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$61:
	movq	%r8, %mm4
	movq	$1, %rcx
	leaq	15072(%rsp), %rax
	leaq	23272(%rsp), %rsi
	leaq	-2168(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$60:
	leaq	2168(%rsp), %rsp
	movq	%mm4, %r9
	movb	$0, %bpl
	leaq	8928(%rsp), %rdx
	leaq	9440(%rsp), %r10
	leaq	9952(%rsp), %r11
	leaq	10464(%rsp), %rbx
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$59:
	leaq	600(%rsp), %rsp
	movq	%mm4, %r9
	movb	$4, %bpl
	leaq	10976(%rsp), %rdx
	leaq	11488(%rsp), %r10
	leaq	12000(%rsp), %r11
	leaq	12512(%rsp), %rbx
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
	leaq	8928(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$56:
	leaq	9440(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$55:
	leaq	9952(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$54:
	leaq	10464(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$53:
	leaq	13024(%rsp), %rcx
	leaq	15072(%rsp), %rdx
	leaq	8928(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$52:
	leaq	128(%rsp), %rcx
	leaq	15584(%rsp), %rdx
	leaq	9440(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$51:
	leaq	13024(%rsp), %rcx
	leaq	128(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$50:
	leaq	128(%rsp), %rcx
	leaq	16096(%rsp), %rdx
	leaq	9952(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$49:
	leaq	13024(%rsp), %rcx
	leaq	128(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$48:
	leaq	128(%rsp), %rcx
	leaq	16608(%rsp), %rdx
	leaq	10464(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$47:
	leaq	13024(%rsp), %rcx
	leaq	128(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$46:
	leaq	13536(%rsp), %rcx
	leaq	17120(%rsp), %rdx
	leaq	8928(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$45:
	leaq	128(%rsp), %rcx
	leaq	17632(%rsp), %rdx
	leaq	9440(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$44:
	leaq	13536(%rsp), %rcx
	leaq	128(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$43:
	leaq	128(%rsp), %rcx
	leaq	18144(%rsp), %rdx
	leaq	9952(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$42:
	leaq	13536(%rsp), %rcx
	leaq	128(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$41:
	leaq	128(%rsp), %rcx
	leaq	18656(%rsp), %rdx
	leaq	10464(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$40:
	leaq	13536(%rsp), %rcx
	leaq	128(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$39:
	leaq	14048(%rsp), %rcx
	leaq	19168(%rsp), %rdx
	leaq	8928(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$38:
	leaq	128(%rsp), %rcx
	leaq	19680(%rsp), %rdx
	leaq	9440(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$37:
	leaq	14048(%rsp), %rcx
	leaq	128(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$36:
	leaq	128(%rsp), %rcx
	leaq	20192(%rsp), %rdx
	leaq	9952(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$35:
	leaq	14048(%rsp), %rcx
	leaq	128(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$34:
	leaq	128(%rsp), %rcx
	leaq	20704(%rsp), %rdx
	leaq	10464(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$33:
	leaq	14048(%rsp), %rcx
	leaq	128(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$32:
	leaq	14560(%rsp), %rcx
	leaq	21216(%rsp), %rdx
	leaq	8928(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$31:
	leaq	128(%rsp), %rcx
	leaq	21728(%rsp), %rdx
	leaq	9440(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$30:
	leaq	14560(%rsp), %rcx
	leaq	128(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$29:
	leaq	128(%rsp), %rcx
	leaq	22240(%rsp), %rdx
	leaq	9952(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$28:
	leaq	14560(%rsp), %rcx
	leaq	128(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$27:
	leaq	128(%rsp), %rcx
	leaq	22752(%rsp), %rdx
	leaq	10464(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$26:
	leaq	14560(%rsp), %rcx
	leaq	128(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$25:
	leaq	128(%rsp), %rcx
	leaq	6880(%rsp), %rdx
	leaq	8928(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$24:
	leaq	1664(%rsp), %rcx
	leaq	7392(%rsp), %rdx
	leaq	9440(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$23:
	leaq	128(%rsp), %rcx
	leaq	1664(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$22:
	leaq	1664(%rsp), %rcx
	leaq	7904(%rsp), %rdx
	leaq	9952(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$21:
	leaq	128(%rsp), %rcx
	leaq	1664(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$20:
	leaq	1664(%rsp), %rcx
	leaq	8416(%rsp), %rdx
	leaq	10464(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$19:
	leaq	128(%rsp), %rcx
	leaq	1664(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$18:
	leaq	13024(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$17:
	leaq	13536(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$16:
	leaq	14048(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$15:
	leaq	14560(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$14:
	leaq	128(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$13:
	leaq	13024(%rsp), %rcx
	leaq	10976(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$12:
	leaq	13536(%rsp), %rcx
	leaq	11488(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$11:
	leaq	14048(%rsp), %rcx
	leaq	12000(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$10:
	leaq	14560(%rsp), %rcx
	leaq	12512(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$9:
	leaq	128(%rsp), %rcx
	leaq	640(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$8:
	leaq	128(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$7:
	leaq	13024(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	leaq	13536(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	leaq	14048(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	leaq	14560(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	leaq	128(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	movq	%mm3, %rax
	movq	%rax, %rdx
	leaq	13024(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$6:
	leaq	13536(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$5:
	leaq	14048(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$4:
	leaq	14560(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$3:
	leaq	glob_data + 1120(%rip), %rcx
	vmovdqu	(%rcx), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 5184(%rip), %ymm2
	vpbroadcastw	glob_data + 5182(%rip), %ymm3
	vpbroadcastw	glob_data + 5180(%rip), %ymm4
	vpbroadcastq	glob_data + 4968(%rip), %ymm5
	vpbroadcastq	glob_data + 4960(%rip), %ymm6
	vmovdqu	glob_data + 160(%rip), %ymm7
	vmovdqu	glob_data + 128(%rip), %ymm8
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, (%rdx)
	movq	%xmm9, 16(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 22(%rdx)
	movq	%xmm9, 38(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 44(%rdx)
	movq	%xmm9, 60(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 66(%rdx)
	movq	%xmm9, 82(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 88(%rdx)
	movq	%xmm9, 104(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 110(%rdx)
	movq	%xmm9, 126(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 132(%rdx)
	movq	%xmm9, 148(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 154(%rdx)
	movq	%xmm9, 170(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 176(%rdx)
	movq	%xmm9, 192(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 198(%rdx)
	movq	%xmm9, 214(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 220(%rdx)
	movq	%xmm9, 236(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 242(%rdx)
	movq	%xmm9, 258(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 264(%rdx)
	movq	%xmm9, 280(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 286(%rdx)
	movq	%xmm9, 302(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 308(%rdx)
	movq	%xmm9, 324(%rdx)
	vmovdqu	13504(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 330(%rdx)
	movq	%xmm9, 346(%rdx)
	vmovdqu	13536(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 352(%rdx)
	movq	%xmm9, 368(%rdx)
	vmovdqu	13568(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 374(%rdx)
	movq	%xmm9, 390(%rdx)
	vmovdqu	13600(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 396(%rdx)
	movq	%xmm9, 412(%rdx)
	vmovdqu	13632(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 418(%rdx)
	movq	%xmm9, 434(%rdx)
	vmovdqu	13664(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 440(%rdx)
	movq	%xmm9, 456(%rdx)
	vmovdqu	13696(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 462(%rdx)
	movq	%xmm9, 478(%rdx)
	vmovdqu	13728(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 484(%rdx)
	movq	%xmm9, 500(%rdx)
	vmovdqu	13760(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 506(%rdx)
	movq	%xmm9, 522(%rdx)
	vmovdqu	13792(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 528(%rdx)
	movq	%xmm9, 544(%rdx)
	vmovdqu	13824(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 550(%rdx)
	movq	%xmm9, 566(%rdx)
	vmovdqu	13856(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 572(%rdx)
	movq	%xmm9, 588(%rdx)
	vmovdqu	13888(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 594(%rdx)
	movq	%xmm9, 610(%rdx)
	vmovdqu	13920(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 616(%rdx)
	movq	%xmm9, 632(%rdx)
	vmovdqu	13952(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 638(%rdx)
	movq	%xmm9, 654(%rdx)
	vmovdqu	13984(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 660(%rdx)
	movq	%xmm9, 676(%rdx)
	vmovdqu	14016(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 682(%rdx)
	movq	%xmm9, 698(%rdx)
	vmovdqu	14048(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 704(%rdx)
	movq	%xmm9, 720(%rdx)
	vmovdqu	14080(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 726(%rdx)
	movq	%xmm9, 742(%rdx)
	vmovdqu	14112(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 748(%rdx)
	movq	%xmm9, 764(%rdx)
	vmovdqu	14144(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 770(%rdx)
	movq	%xmm9, 786(%rdx)
	vmovdqu	14176(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 792(%rdx)
	movq	%xmm9, 808(%rdx)
	vmovdqu	14208(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 814(%rdx)
	movq	%xmm9, 830(%rdx)
	vmovdqu	14240(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 836(%rdx)
	movq	%xmm9, 852(%rdx)
	vmovdqu	14272(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 858(%rdx)
	movq	%xmm9, 874(%rdx)
	vmovdqu	14304(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 880(%rdx)
	movq	%xmm9, 896(%rdx)
	vmovdqu	14336(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 902(%rdx)
	movq	%xmm9, 918(%rdx)
	vmovdqu	14368(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 924(%rdx)
	movq	%xmm9, 940(%rdx)
	vmovdqu	14400(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 946(%rdx)
	movq	%xmm9, 962(%rdx)
	vmovdqu	14432(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 968(%rdx)
	movq	%xmm9, 984(%rdx)
	vmovdqu	14464(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 990(%rdx)
	movq	%xmm9, 1006(%rdx)
	vmovdqu	14496(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1012(%rdx)
	movq	%xmm9, 1028(%rdx)
	vmovdqu	14528(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1034(%rdx)
	movq	%xmm9, 1050(%rdx)
	vmovdqu	14560(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1056(%rdx)
	movq	%xmm9, 1072(%rdx)
	vmovdqu	14592(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1078(%rdx)
	movq	%xmm9, 1094(%rdx)
	vmovdqu	14624(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1100(%rdx)
	movq	%xmm9, 1116(%rdx)
	vmovdqu	14656(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1122(%rdx)
	movq	%xmm9, 1138(%rdx)
	vmovdqu	14688(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1144(%rdx)
	movq	%xmm9, 1160(%rdx)
	vmovdqu	14720(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1166(%rdx)
	movq	%xmm9, 1182(%rdx)
	vmovdqu	14752(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1188(%rdx)
	movq	%xmm9, 1204(%rdx)
	vmovdqu	14784(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1210(%rdx)
	movq	%xmm9, 1226(%rdx)
	vmovdqu	14816(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1232(%rdx)
	movq	%xmm9, 1248(%rdx)
	vmovdqu	14848(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1254(%rdx)
	movq	%xmm9, 1270(%rdx)
	vmovdqu	14880(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1276(%rdx)
	movq	%xmm9, 1292(%rdx)
	vmovdqu	14912(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1298(%rdx)
	movq	%xmm9, 1314(%rdx)
	vmovdqu	14944(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1320(%rdx)
	movq	%xmm9, 1336(%rdx)
	vmovdqu	14976(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1342(%rdx)
	movq	%xmm9, 1358(%rdx)
	vmovdqu	15008(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1364(%rdx)
	movq	%xmm9, 1380(%rdx)
	vmovdqu	15040(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm1
	vpaddw	%ymm2, %ymm9, %ymm2
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm0
	vpsubw	%ymm2, %ymm1, %ymm2
	vpandn	%ymm2, %ymm1, %ymm1
	vpsrlw	$15, %ymm1, %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vpmulhrsw	%ymm3, %ymm0, %ymm0
	vpand	%ymm4, %ymm0, %ymm0
	vpmaddwd	%ymm5, %ymm0, %ymm0
	vpsllvd	%ymm6, %ymm0, %ymm0
	vpsrldq	$8, %ymm0, %ymm1
	vpsrlvq	%ymm7, %ymm0, %ymm0
	vpsllq	$34, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm0, %ymm0
	vpshufb	%ymm8, %ymm0, %ymm0
	vmovdqu	%xmm0, %xmm1
	vextracti128	$1, %ymm0, %xmm0
	vpblendvb	%xmm8, %xmm0, %xmm1, %xmm1
	vmovdqu	%xmm1, 1386(%rdx)
	movq	%xmm0, 1402(%rdx)
	leaq	1408(%rax), %rax
	leaq	128(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$2:
	leaq	glob_data + 1120(%rip), %rdx
	vmovdqu	(%rdx), %ymm0
	vpbroadcastw	glob_data + 5190(%rip), %ymm1
	vpbroadcastw	glob_data + 5192(%rip), %ymm2
	vpbroadcastw	glob_data + 5188(%rip), %ymm3
	vpbroadcastd	glob_data + 5176(%rip), %ymm4
	vpbroadcastq	glob_data + 4976(%rip), %ymm5
	vmovdqu	glob_data + 416(%rip), %ymm6
	vmovdqu	(%rcx), %ymm7
	vmovdqu	32(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm8, %ymm7, %ymm7
	vpmaddubsw	%ymm3, %ymm7, %ymm7
	vpmaddwd	%ymm4, %ymm7, %ymm7
	vpsllvd	%ymm5, %ymm7, %ymm7
	vpsrlvq	%ymm5, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm7, %ymm7
	vmovdqu	%xmm7, %xmm8
	vextracti128	$1, %ymm7, %xmm7
	vpblendvb	%xmm6, %xmm7, %xmm8, %xmm8
	vmovdqu	%xmm8, (%rax)
	movd	%xmm7, 16(%rax)
	vmovdqu	64(%rcx), %ymm7
	vmovdqu	96(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm8, %ymm7, %ymm7
	vpmaddubsw	%ymm3, %ymm7, %ymm7
	vpmaddwd	%ymm4, %ymm7, %ymm7
	vpsllvd	%ymm5, %ymm7, %ymm7
	vpsrlvq	%ymm5, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm7, %ymm7
	vmovdqu	%xmm7, %xmm8
	vextracti128	$1, %ymm7, %xmm7
	vpblendvb	%xmm6, %xmm7, %xmm8, %xmm8
	vmovdqu	%xmm8, 20(%rax)
	movd	%xmm7, 36(%rax)
	vmovdqu	128(%rcx), %ymm7
	vmovdqu	160(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm8, %ymm7, %ymm7
	vpmaddubsw	%ymm3, %ymm7, %ymm7
	vpmaddwd	%ymm4, %ymm7, %ymm7
	vpsllvd	%ymm5, %ymm7, %ymm7
	vpsrlvq	%ymm5, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm7, %ymm7
	vmovdqu	%xmm7, %xmm8
	vextracti128	$1, %ymm7, %xmm7
	vpblendvb	%xmm6, %xmm7, %xmm8, %xmm8
	vmovdqu	%xmm8, 40(%rax)
	movd	%xmm7, 56(%rax)
	vmovdqu	192(%rcx), %ymm7
	vmovdqu	224(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm8, %ymm7, %ymm7
	vpmaddubsw	%ymm3, %ymm7, %ymm7
	vpmaddwd	%ymm4, %ymm7, %ymm7
	vpsllvd	%ymm5, %ymm7, %ymm7
	vpsrlvq	%ymm5, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm7, %ymm7
	vmovdqu	%xmm7, %xmm8
	vextracti128	$1, %ymm7, %xmm7
	vpblendvb	%xmm6, %xmm7, %xmm8, %xmm8
	vmovdqu	%xmm8, 60(%rax)
	movd	%xmm7, 76(%rax)
	vmovdqu	256(%rcx), %ymm7
	vmovdqu	288(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm8, %ymm7, %ymm7
	vpmaddubsw	%ymm3, %ymm7, %ymm7
	vpmaddwd	%ymm4, %ymm7, %ymm7
	vpsllvd	%ymm5, %ymm7, %ymm7
	vpsrlvq	%ymm5, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm7, %ymm7
	vmovdqu	%xmm7, %xmm8
	vextracti128	$1, %ymm7, %xmm7
	vpblendvb	%xmm6, %xmm7, %xmm8, %xmm8
	vmovdqu	%xmm8, 80(%rax)
	movd	%xmm7, 96(%rax)
	vmovdqu	320(%rcx), %ymm7
	vmovdqu	352(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm8, %ymm7, %ymm7
	vpmaddubsw	%ymm3, %ymm7, %ymm7
	vpmaddwd	%ymm4, %ymm7, %ymm7
	vpsllvd	%ymm5, %ymm7, %ymm7
	vpsrlvq	%ymm5, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm7, %ymm7
	vmovdqu	%xmm7, %xmm8
	vextracti128	$1, %ymm7, %xmm7
	vpblendvb	%xmm6, %xmm7, %xmm8, %xmm8
	vmovdqu	%xmm8, 100(%rax)
	movd	%xmm7, 116(%rax)
	vmovdqu	384(%rcx), %ymm7
	vmovdqu	416(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm8, %ymm7, %ymm7
	vpmaddubsw	%ymm3, %ymm7, %ymm7
	vpmaddwd	%ymm4, %ymm7, %ymm7
	vpsllvd	%ymm5, %ymm7, %ymm7
	vpsrlvq	%ymm5, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm7, %ymm7
	vmovdqu	%xmm7, %xmm8
	vextracti128	$1, %ymm7, %xmm7
	vpblendvb	%xmm6, %xmm7, %xmm8, %xmm8
	vmovdqu	%xmm8, 120(%rax)
	movd	%xmm7, 136(%rax)
	vmovdqu	448(%rcx), %ymm7
	vmovdqu	480(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm0
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm0, %ymm0
	vpand	%ymm2, %ymm7, %ymm1
	vpand	%ymm2, %ymm0, %ymm0
	vpackuswb	%ymm0, %ymm1, %ymm0
	vpmaddubsw	%ymm3, %ymm0, %ymm0
	vpmaddwd	%ymm4, %ymm0, %ymm0
	vpsllvd	%ymm5, %ymm0, %ymm0
	vpsrlvq	%ymm5, %ymm0, %ymm0
	vpshufb	%ymm6, %ymm0, %ymm0
	vmovdqu	%xmm0, %xmm1
	vextracti128	$1, %ymm0, %xmm0
	vpblendvb	%xmm6, %xmm0, %xmm1, %xmm1
	vmovdqu	%xmm1, 140(%rax)
	movd	%xmm0, 156(%rax)
	movq	%mm2, %rax
	leaq	3712(%rsp), %rcx
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
	vmovdqu	1088(%rcx), %ymm1
	vmovdqu	1088(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1120(%rcx), %ymm1
	vmovdqu	1120(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1152(%rcx), %ymm1
	vmovdqu	1152(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1184(%rcx), %ymm1
	vmovdqu	1184(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1216(%rcx), %ymm1
	vmovdqu	1216(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1248(%rcx), %ymm1
	vmovdqu	1248(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1280(%rcx), %ymm1
	vmovdqu	1280(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1312(%rcx), %ymm1
	vmovdqu	1312(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1344(%rcx), %ymm1
	vmovdqu	1344(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1376(%rcx), %ymm1
	vmovdqu	1376(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1408(%rcx), %ymm1
	vmovdqu	1408(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1440(%rcx), %ymm1
	vmovdqu	1440(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1472(%rcx), %ymm1
	vmovdqu	1472(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1504(%rcx), %ymm1
	vmovdqu	1504(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vmovdqu	1536(%rcx), %ymm1
	vmovdqu	1536(%rax), %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm0
	vptest	%ymm0, %ymm0
	cmovne	%rsi, %rdx
	movq	%rdx, %mm0
	movq	%mm2, %rax
	movq	26440(%rsp), %rcx
	movq	%rcx, 5280(%rsp)
	movq	26448(%rsp), %rcx
	movq	%rcx, 5288(%rsp)
	movq	26456(%rsp), %rcx
	movq	%rcx, 5296(%rsp)
	movq	26464(%rsp), %rcx
	movq	%rcx, 5304(%rsp)
	movq	(%rax), %rcx
	movq	%rcx, 5312(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 5320(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 5328(%rsp)
	movq	24(%rax), %rcx
	movq	%rcx, 5336(%rsp)
	movq	32(%rax), %rcx
	movq	%rcx, 5344(%rsp)
	movq	40(%rax), %rcx
	movq	%rcx, 5352(%rsp)
	movq	48(%rax), %rcx
	movq	%rcx, 5360(%rsp)
	movq	56(%rax), %rcx
	movq	%rcx, 5368(%rsp)
	movq	64(%rax), %rcx
	movq	%rcx, 5376(%rsp)
	movq	72(%rax), %rcx
	movq	%rcx, 5384(%rsp)
	movq	80(%rax), %rcx
	movq	%rcx, 5392(%rsp)
	movq	88(%rax), %rcx
	movq	%rcx, 5400(%rsp)
	movq	96(%rax), %rcx
	movq	%rcx, 5408(%rsp)
	movq	104(%rax), %rcx
	movq	%rcx, 5416(%rsp)
	movq	112(%rax), %rcx
	movq	%rcx, 5424(%rsp)
	movq	120(%rax), %rcx
	movq	%rcx, 5432(%rsp)
	movq	128(%rax), %rcx
	movq	%rcx, 5440(%rsp)
	movq	136(%rax), %rcx
	movq	%rcx, 5448(%rsp)
	movq	144(%rax), %rcx
	movq	%rcx, 5456(%rsp)
	movq	152(%rax), %rcx
	movq	%rcx, 5464(%rsp)
	movq	160(%rax), %rcx
	movq	%rcx, 5472(%rsp)
	movq	168(%rax), %rcx
	movq	%rcx, 5480(%rsp)
	movq	176(%rax), %rcx
	movq	%rcx, 5488(%rsp)
	movq	184(%rax), %rcx
	movq	%rcx, 5496(%rsp)
	movq	192(%rax), %rcx
	movq	%rcx, 5504(%rsp)
	movq	200(%rax), %rcx
	movq	%rcx, 5512(%rsp)
	movq	208(%rax), %rcx
	movq	%rcx, 5520(%rsp)
	movq	216(%rax), %rcx
	movq	%rcx, 5528(%rsp)
	movq	224(%rax), %rcx
	movq	%rcx, 5536(%rsp)
	movq	232(%rax), %rcx
	movq	%rcx, 5544(%rsp)
	movq	240(%rax), %rcx
	movq	%rcx, 5552(%rsp)
	movq	248(%rax), %rcx
	movq	%rcx, 5560(%rsp)
	movq	256(%rax), %rcx
	movq	%rcx, 5568(%rsp)
	movq	264(%rax), %rcx
	movq	%rcx, 5576(%rsp)
	movq	272(%rax), %rcx
	movq	%rcx, 5584(%rsp)
	movq	280(%rax), %rcx
	movq	%rcx, 5592(%rsp)
	movq	288(%rax), %rcx
	movq	%rcx, 5600(%rsp)
	movq	296(%rax), %rcx
	movq	%rcx, 5608(%rsp)
	movq	304(%rax), %rcx
	movq	%rcx, 5616(%rsp)
	movq	312(%rax), %rcx
	movq	%rcx, 5624(%rsp)
	movq	320(%rax), %rcx
	movq	%rcx, 5632(%rsp)
	movq	328(%rax), %rcx
	movq	%rcx, 5640(%rsp)
	movq	336(%rax), %rcx
	movq	%rcx, 5648(%rsp)
	movq	344(%rax), %rcx
	movq	%rcx, 5656(%rsp)
	movq	352(%rax), %rcx
	movq	%rcx, 5664(%rsp)
	movq	360(%rax), %rcx
	movq	%rcx, 5672(%rsp)
	movq	368(%rax), %rcx
	movq	%rcx, 5680(%rsp)
	movq	376(%rax), %rcx
	movq	%rcx, 5688(%rsp)
	movq	384(%rax), %rcx
	movq	%rcx, 5696(%rsp)
	movq	392(%rax), %rcx
	movq	%rcx, 5704(%rsp)
	movq	400(%rax), %rcx
	movq	%rcx, 5712(%rsp)
	movq	408(%rax), %rcx
	movq	%rcx, 5720(%rsp)
	movq	416(%rax), %rcx
	movq	%rcx, 5728(%rsp)
	movq	424(%rax), %rcx
	movq	%rcx, 5736(%rsp)
	movq	432(%rax), %rcx
	movq	%rcx, 5744(%rsp)
	movq	440(%rax), %rcx
	movq	%rcx, 5752(%rsp)
	movq	448(%rax), %rcx
	movq	%rcx, 5760(%rsp)
	movq	456(%rax), %rcx
	movq	%rcx, 5768(%rsp)
	movq	464(%rax), %rcx
	movq	%rcx, 5776(%rsp)
	movq	472(%rax), %rcx
	movq	%rcx, 5784(%rsp)
	movq	480(%rax), %rcx
	movq	%rcx, 5792(%rsp)
	movq	488(%rax), %rcx
	movq	%rcx, 5800(%rsp)
	movq	496(%rax), %rcx
	movq	%rcx, 5808(%rsp)
	movq	504(%rax), %rcx
	movq	%rcx, 5816(%rsp)
	movq	512(%rax), %rcx
	movq	%rcx, 5824(%rsp)
	movq	520(%rax), %rcx
	movq	%rcx, 5832(%rsp)
	movq	528(%rax), %rcx
	movq	%rcx, 5840(%rsp)
	movq	536(%rax), %rcx
	movq	%rcx, 5848(%rsp)
	movq	544(%rax), %rcx
	movq	%rcx, 5856(%rsp)
	movq	552(%rax), %rcx
	movq	%rcx, 5864(%rsp)
	movq	560(%rax), %rcx
	movq	%rcx, 5872(%rsp)
	movq	568(%rax), %rcx
	movq	%rcx, 5880(%rsp)
	movq	576(%rax), %rcx
	movq	%rcx, 5888(%rsp)
	movq	584(%rax), %rcx
	movq	%rcx, 5896(%rsp)
	movq	592(%rax), %rcx
	movq	%rcx, 5904(%rsp)
	movq	600(%rax), %rcx
	movq	%rcx, 5912(%rsp)
	movq	608(%rax), %rcx
	movq	%rcx, 5920(%rsp)
	movq	616(%rax), %rcx
	movq	%rcx, 5928(%rsp)
	movq	624(%rax), %rcx
	movq	%rcx, 5936(%rsp)
	movq	632(%rax), %rcx
	movq	%rcx, 5944(%rsp)
	movq	640(%rax), %rcx
	movq	%rcx, 5952(%rsp)
	movq	648(%rax), %rcx
	movq	%rcx, 5960(%rsp)
	movq	656(%rax), %rcx
	movq	%rcx, 5968(%rsp)
	movq	664(%rax), %rcx
	movq	%rcx, 5976(%rsp)
	movq	672(%rax), %rcx
	movq	%rcx, 5984(%rsp)
	movq	680(%rax), %rcx
	movq	%rcx, 5992(%rsp)
	movq	688(%rax), %rcx
	movq	%rcx, 6000(%rsp)
	movq	696(%rax), %rcx
	movq	%rcx, 6008(%rsp)
	movq	704(%rax), %rcx
	movq	%rcx, 6016(%rsp)
	movq	712(%rax), %rcx
	movq	%rcx, 6024(%rsp)
	movq	720(%rax), %rcx
	movq	%rcx, 6032(%rsp)
	movq	728(%rax), %rcx
	movq	%rcx, 6040(%rsp)
	movq	736(%rax), %rcx
	movq	%rcx, 6048(%rsp)
	movq	744(%rax), %rcx
	movq	%rcx, 6056(%rsp)
	movq	752(%rax), %rcx
	movq	%rcx, 6064(%rsp)
	movq	760(%rax), %rcx
	movq	%rcx, 6072(%rsp)
	movq	768(%rax), %rcx
	movq	%rcx, 6080(%rsp)
	movq	776(%rax), %rcx
	movq	%rcx, 6088(%rsp)
	movq	784(%rax), %rcx
	movq	%rcx, 6096(%rsp)
	movq	792(%rax), %rcx
	movq	%rcx, 6104(%rsp)
	movq	800(%rax), %rcx
	movq	%rcx, 6112(%rsp)
	movq	808(%rax), %rcx
	movq	%rcx, 6120(%rsp)
	movq	816(%rax), %rcx
	movq	%rcx, 6128(%rsp)
	movq	824(%rax), %rcx
	movq	%rcx, 6136(%rsp)
	movq	832(%rax), %rcx
	movq	%rcx, 6144(%rsp)
	movq	840(%rax), %rcx
	movq	%rcx, 6152(%rsp)
	movq	848(%rax), %rcx
	movq	%rcx, 6160(%rsp)
	movq	856(%rax), %rcx
	movq	%rcx, 6168(%rsp)
	movq	864(%rax), %rcx
	movq	%rcx, 6176(%rsp)
	movq	872(%rax), %rcx
	movq	%rcx, 6184(%rsp)
	movq	880(%rax), %rcx
	movq	%rcx, 6192(%rsp)
	movq	888(%rax), %rcx
	movq	%rcx, 6200(%rsp)
	movq	896(%rax), %rcx
	movq	%rcx, 6208(%rsp)
	movq	904(%rax), %rcx
	movq	%rcx, 6216(%rsp)
	movq	912(%rax), %rcx
	movq	%rcx, 6224(%rsp)
	movq	920(%rax), %rcx
	movq	%rcx, 6232(%rsp)
	movq	928(%rax), %rcx
	movq	%rcx, 6240(%rsp)
	movq	936(%rax), %rcx
	movq	%rcx, 6248(%rsp)
	movq	944(%rax), %rcx
	movq	%rcx, 6256(%rsp)
	movq	952(%rax), %rcx
	movq	%rcx, 6264(%rsp)
	movq	960(%rax), %rcx
	movq	%rcx, 6272(%rsp)
	movq	968(%rax), %rcx
	movq	%rcx, 6280(%rsp)
	movq	976(%rax), %rcx
	movq	%rcx, 6288(%rsp)
	movq	984(%rax), %rcx
	movq	%rcx, 6296(%rsp)
	movq	992(%rax), %rcx
	movq	%rcx, 6304(%rsp)
	movq	1000(%rax), %rcx
	movq	%rcx, 6312(%rsp)
	movq	1008(%rax), %rcx
	movq	%rcx, 6320(%rsp)
	movq	1016(%rax), %rcx
	movq	%rcx, 6328(%rsp)
	movq	1024(%rax), %rcx
	movq	%rcx, 6336(%rsp)
	movq	1032(%rax), %rcx
	movq	%rcx, 6344(%rsp)
	movq	1040(%rax), %rcx
	movq	%rcx, 6352(%rsp)
	movq	1048(%rax), %rcx
	movq	%rcx, 6360(%rsp)
	movq	1056(%rax), %rcx
	movq	%rcx, 6368(%rsp)
	movq	1064(%rax), %rcx
	movq	%rcx, 6376(%rsp)
	movq	1072(%rax), %rcx
	movq	%rcx, 6384(%rsp)
	movq	1080(%rax), %rcx
	movq	%rcx, 6392(%rsp)
	movq	1088(%rax), %rcx
	movq	%rcx, 6400(%rsp)
	movq	1096(%rax), %rcx
	movq	%rcx, 6408(%rsp)
	movq	1104(%rax), %rcx
	movq	%rcx, 6416(%rsp)
	movq	1112(%rax), %rcx
	movq	%rcx, 6424(%rsp)
	movq	1120(%rax), %rcx
	movq	%rcx, 6432(%rsp)
	movq	1128(%rax), %rcx
	movq	%rcx, 6440(%rsp)
	movq	1136(%rax), %rcx
	movq	%rcx, 6448(%rsp)
	movq	1144(%rax), %rcx
	movq	%rcx, 6456(%rsp)
	movq	1152(%rax), %rcx
	movq	%rcx, 6464(%rsp)
	movq	1160(%rax), %rcx
	movq	%rcx, 6472(%rsp)
	movq	1168(%rax), %rcx
	movq	%rcx, 6480(%rsp)
	movq	1176(%rax), %rcx
	movq	%rcx, 6488(%rsp)
	movq	1184(%rax), %rcx
	movq	%rcx, 6496(%rsp)
	movq	1192(%rax), %rcx
	movq	%rcx, 6504(%rsp)
	movq	1200(%rax), %rcx
	movq	%rcx, 6512(%rsp)
	movq	1208(%rax), %rcx
	movq	%rcx, 6520(%rsp)
	movq	1216(%rax), %rcx
	movq	%rcx, 6528(%rsp)
	movq	1224(%rax), %rcx
	movq	%rcx, 6536(%rsp)
	movq	1232(%rax), %rcx
	movq	%rcx, 6544(%rsp)
	movq	1240(%rax), %rcx
	movq	%rcx, 6552(%rsp)
	movq	1248(%rax), %rcx
	movq	%rcx, 6560(%rsp)
	movq	1256(%rax), %rcx
	movq	%rcx, 6568(%rsp)
	movq	1264(%rax), %rcx
	movq	%rcx, 6576(%rsp)
	movq	1272(%rax), %rcx
	movq	%rcx, 6584(%rsp)
	movq	1280(%rax), %rcx
	movq	%rcx, 6592(%rsp)
	movq	1288(%rax), %rcx
	movq	%rcx, 6600(%rsp)
	movq	1296(%rax), %rcx
	movq	%rcx, 6608(%rsp)
	movq	1304(%rax), %rcx
	movq	%rcx, 6616(%rsp)
	movq	1312(%rax), %rcx
	movq	%rcx, 6624(%rsp)
	movq	1320(%rax), %rcx
	movq	%rcx, 6632(%rsp)
	movq	1328(%rax), %rcx
	movq	%rcx, 6640(%rsp)
	movq	1336(%rax), %rcx
	movq	%rcx, 6648(%rsp)
	movq	1344(%rax), %rcx
	movq	%rcx, 6656(%rsp)
	movq	1352(%rax), %rcx
	movq	%rcx, 6664(%rsp)
	movq	1360(%rax), %rcx
	movq	%rcx, 6672(%rsp)
	movq	1368(%rax), %rcx
	movq	%rcx, 6680(%rsp)
	movq	1376(%rax), %rcx
	movq	%rcx, 6688(%rsp)
	movq	1384(%rax), %rcx
	movq	%rcx, 6696(%rsp)
	movq	1392(%rax), %rcx
	movq	%rcx, 6704(%rsp)
	movq	1400(%rax), %rcx
	movq	%rcx, 6712(%rsp)
	movq	1408(%rax), %rcx
	movq	%rcx, 6720(%rsp)
	movq	1416(%rax), %rcx
	movq	%rcx, 6728(%rsp)
	movq	1424(%rax), %rcx
	movq	%rcx, 6736(%rsp)
	movq	1432(%rax), %rcx
	movq	%rcx, 6744(%rsp)
	movq	1440(%rax), %rcx
	movq	%rcx, 6752(%rsp)
	movq	1448(%rax), %rcx
	movq	%rcx, 6760(%rsp)
	movq	1456(%rax), %rcx
	movq	%rcx, 6768(%rsp)
	movq	1464(%rax), %rcx
	movq	%rcx, 6776(%rsp)
	movq	1472(%rax), %rcx
	movq	%rcx, 6784(%rsp)
	movq	1480(%rax), %rcx
	movq	%rcx, 6792(%rsp)
	movq	1488(%rax), %rcx
	movq	%rcx, 6800(%rsp)
	movq	1496(%rax), %rcx
	movq	%rcx, 6808(%rsp)
	movq	1504(%rax), %rcx
	movq	%rcx, 6816(%rsp)
	movq	1512(%rax), %rcx
	movq	%rcx, 6824(%rsp)
	movq	1520(%rax), %rcx
	movq	%rcx, 6832(%rsp)
	movq	1528(%rax), %rcx
	movq	%rcx, 6840(%rsp)
	movq	1536(%rax), %rcx
	movq	%rcx, 6848(%rsp)
	movq	1544(%rax), %rcx
	movq	%rcx, 6856(%rsp)
	movq	1552(%rax), %rcx
	movq	%rcx, 6864(%rsp)
	movq	1560(%rax), %rax
	movq	%rax, 6872(%rsp)
	movq	%mm1, %rax
	leaq	5280(%rsp), %rcx
	call	L_shake256_A32__A1600$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$1:
	movq	%mm0, %rcx
	leaq	64(%rsp), %rdx
	negq	%rcx
	movq	%rcx, 23264(%rsp)
	vpbroadcastq	23264(%rsp), %ymm0
	vmovdqu	(%rdx), %ymm1
	vmovdqu	(%rax), %ymm2
	vpblendvb	%ymm0, %ymm2, %ymm1, %ymm0
	vmovdqu	%ymm0, (%rax)
	xorq	%rax, %rax
	movq	26472(%rsp), %rbx
	movq	26480(%rsp), %rbp
	movq	26488(%rsp), %r12
	movq	26496(%rsp), %r13
	movq	26504(%rsp), %r14
	movq	26512(%rsp), %r15
	movq	26520(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand:
jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand:
	movq	%rsp, %rax
	leaq	-20184(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 20128(%rsp)
	movq	%rbp, 20136(%rsp)
	movq	%r12, 20144(%rsp)
	movq	%r13, 20152(%rsp)
	movq	%r14, 20160(%rsp)
	movq	%r15, 20168(%rsp)
	movq	%rax, 20176(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdx, %mm0
	movq	%rsi, %mm1
	movq	(%rcx), %rax
	movq	%rax, (%rsp)
	movq	8(%rcx), %rax
	movq	%rax, 8(%rsp)
	movq	16(%rcx), %rax
	movq	%rax, 16(%rsp)
	movq	24(%rcx), %rax
	movq	%rax, 24(%rsp)
	leaq	32(%rsp), %rax
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$66:
	leaq	64(%rsp), %rax
	movq	%rsp, %rcx
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$65:
	movq	%mm0, %rax
	movq	%rsp, %rdx
	leaq	96(%rsp), %r8
	movq	%rdi, %mm2
	movq	%rax, %rcx
	movq	(%rcx), %rsi
	movq	%rsi, 2176(%rsp)
	movq	8(%rcx), %rsi
	movq	%rsi, 2184(%rsp)
	movq	16(%rcx), %rsi
	movq	%rsi, 2192(%rsp)
	movq	24(%rcx), %rsi
	movq	%rsi, 2200(%rsp)
	movq	32(%rcx), %rsi
	movq	%rsi, 2208(%rsp)
	movq	40(%rcx), %rsi
	movq	%rsi, 2216(%rsp)
	movq	48(%rcx), %rsi
	movq	%rsi, 2224(%rsp)
	movq	56(%rcx), %rsi
	movq	%rsi, 2232(%rsp)
	movq	64(%rcx), %rsi
	movq	%rsi, 2240(%rsp)
	movq	72(%rcx), %rsi
	movq	%rsi, 2248(%rsp)
	movq	80(%rcx), %rsi
	movq	%rsi, 2256(%rsp)
	movq	88(%rcx), %rsi
	movq	%rsi, 2264(%rsp)
	movq	96(%rcx), %rsi
	movq	%rsi, 2272(%rsp)
	movq	104(%rcx), %rsi
	movq	%rsi, 2280(%rsp)
	movq	112(%rcx), %rsi
	movq	%rsi, 2288(%rsp)
	movq	120(%rcx), %rsi
	movq	%rsi, 2296(%rsp)
	movq	128(%rcx), %rsi
	movq	%rsi, 2304(%rsp)
	movq	136(%rcx), %rsi
	movq	%rsi, 2312(%rsp)
	movq	144(%rcx), %rsi
	movq	%rsi, 2320(%rsp)
	movq	152(%rcx), %rsi
	movq	%rsi, 2328(%rsp)
	movq	160(%rcx), %rsi
	movq	%rsi, 2336(%rsp)
	movq	168(%rcx), %rsi
	movq	%rsi, 2344(%rsp)
	movq	176(%rcx), %rsi
	movq	%rsi, 2352(%rsp)
	movq	184(%rcx), %rsi
	movq	%rsi, 2360(%rsp)
	movq	192(%rcx), %rsi
	movq	%rsi, 2368(%rsp)
	movq	200(%rcx), %rsi
	movq	%rsi, 2376(%rsp)
	movq	208(%rcx), %rsi
	movq	%rsi, 2384(%rsp)
	movq	216(%rcx), %rsi
	movq	%rsi, 2392(%rsp)
	movq	224(%rcx), %rsi
	movq	%rsi, 2400(%rsp)
	movq	232(%rcx), %rsi
	movq	%rsi, 2408(%rsp)
	movq	240(%rcx), %rsi
	movq	%rsi, 2416(%rsp)
	movq	248(%rcx), %rsi
	movq	%rsi, 2424(%rsp)
	movq	256(%rcx), %rsi
	movq	%rsi, 2432(%rsp)
	movq	264(%rcx), %rsi
	movq	%rsi, 2440(%rsp)
	movq	272(%rcx), %rsi
	movq	%rsi, 2448(%rsp)
	movq	280(%rcx), %rsi
	movq	%rsi, 2456(%rsp)
	movq	288(%rcx), %rsi
	movq	%rsi, 2464(%rsp)
	movq	296(%rcx), %rsi
	movq	%rsi, 2472(%rsp)
	movq	304(%rcx), %rsi
	movq	%rsi, 2480(%rsp)
	movq	312(%rcx), %rsi
	movq	%rsi, 2488(%rsp)
	movq	320(%rcx), %rsi
	movq	%rsi, 2496(%rsp)
	movq	328(%rcx), %rsi
	movq	%rsi, 2504(%rsp)
	movq	336(%rcx), %rsi
	movq	%rsi, 2512(%rsp)
	movq	344(%rcx), %rsi
	movq	%rsi, 2520(%rsp)
	movq	352(%rcx), %rsi
	movq	%rsi, 2528(%rsp)
	movq	360(%rcx), %rsi
	movq	%rsi, 2536(%rsp)
	movq	368(%rcx), %rsi
	movq	%rsi, 2544(%rsp)
	movq	376(%rcx), %rsi
	movq	%rsi, 2552(%rsp)
	movq	384(%rcx), %rsi
	movq	%rsi, 2560(%rsp)
	movq	392(%rcx), %rsi
	movq	%rsi, 2568(%rsp)
	movq	400(%rcx), %rsi
	movq	%rsi, 2576(%rsp)
	movq	408(%rcx), %rsi
	movq	%rsi, 2584(%rsp)
	movq	416(%rcx), %rsi
	movq	%rsi, 2592(%rsp)
	movq	424(%rcx), %rsi
	movq	%rsi, 2600(%rsp)
	movq	432(%rcx), %rsi
	movq	%rsi, 2608(%rsp)
	movq	440(%rcx), %rsi
	movq	%rsi, 2616(%rsp)
	movq	448(%rcx), %rsi
	movq	%rsi, 2624(%rsp)
	movq	456(%rcx), %rsi
	movq	%rsi, 2632(%rsp)
	movq	464(%rcx), %rsi
	movq	%rsi, 2640(%rsp)
	movq	472(%rcx), %rsi
	movq	%rsi, 2648(%rsp)
	movq	480(%rcx), %rsi
	movq	%rsi, 2656(%rsp)
	movq	488(%rcx), %rsi
	movq	%rsi, 2664(%rsp)
	movq	496(%rcx), %rsi
	movq	%rsi, 2672(%rsp)
	movq	504(%rcx), %rsi
	movq	%rsi, 2680(%rsp)
	movq	512(%rcx), %rsi
	movq	%rsi, 2688(%rsp)
	movq	520(%rcx), %rsi
	movq	%rsi, 2696(%rsp)
	movq	528(%rcx), %rsi
	movq	%rsi, 2704(%rsp)
	movq	536(%rcx), %rsi
	movq	%rsi, 2712(%rsp)
	movq	544(%rcx), %rsi
	movq	%rsi, 2720(%rsp)
	movq	552(%rcx), %rsi
	movq	%rsi, 2728(%rsp)
	movq	560(%rcx), %rsi
	movq	%rsi, 2736(%rsp)
	movq	568(%rcx), %rsi
	movq	%rsi, 2744(%rsp)
	movq	576(%rcx), %rsi
	movq	%rsi, 2752(%rsp)
	movq	584(%rcx), %rsi
	movq	%rsi, 2760(%rsp)
	movq	592(%rcx), %rsi
	movq	%rsi, 2768(%rsp)
	movq	600(%rcx), %rsi
	movq	%rsi, 2776(%rsp)
	movq	608(%rcx), %rsi
	movq	%rsi, 2784(%rsp)
	movq	616(%rcx), %rsi
	movq	%rsi, 2792(%rsp)
	movq	624(%rcx), %rsi
	movq	%rsi, 2800(%rsp)
	movq	632(%rcx), %rsi
	movq	%rsi, 2808(%rsp)
	movq	640(%rcx), %rsi
	movq	%rsi, 2816(%rsp)
	movq	648(%rcx), %rsi
	movq	%rsi, 2824(%rsp)
	movq	656(%rcx), %rsi
	movq	%rsi, 2832(%rsp)
	movq	664(%rcx), %rsi
	movq	%rsi, 2840(%rsp)
	movq	672(%rcx), %rsi
	movq	%rsi, 2848(%rsp)
	movq	680(%rcx), %rsi
	movq	%rsi, 2856(%rsp)
	movq	688(%rcx), %rsi
	movq	%rsi, 2864(%rsp)
	movq	696(%rcx), %rsi
	movq	%rsi, 2872(%rsp)
	movq	704(%rcx), %rsi
	movq	%rsi, 2880(%rsp)
	movq	712(%rcx), %rsi
	movq	%rsi, 2888(%rsp)
	movq	720(%rcx), %rsi
	movq	%rsi, 2896(%rsp)
	movq	728(%rcx), %rsi
	movq	%rsi, 2904(%rsp)
	movq	736(%rcx), %rsi
	movq	%rsi, 2912(%rsp)
	movq	744(%rcx), %rsi
	movq	%rsi, 2920(%rsp)
	movq	752(%rcx), %rsi
	movq	%rsi, 2928(%rsp)
	movq	760(%rcx), %rsi
	movq	%rsi, 2936(%rsp)
	movq	768(%rcx), %rsi
	movq	%rsi, 2944(%rsp)
	movq	776(%rcx), %rsi
	movq	%rsi, 2952(%rsp)
	movq	784(%rcx), %rsi
	movq	%rsi, 2960(%rsp)
	movq	792(%rcx), %rsi
	movq	%rsi, 2968(%rsp)
	movq	800(%rcx), %rsi
	movq	%rsi, 2976(%rsp)
	movq	808(%rcx), %rsi
	movq	%rsi, 2984(%rsp)
	movq	816(%rcx), %rsi
	movq	%rsi, 2992(%rsp)
	movq	824(%rcx), %rsi
	movq	%rsi, 3000(%rsp)
	movq	832(%rcx), %rsi
	movq	%rsi, 3008(%rsp)
	movq	840(%rcx), %rsi
	movq	%rsi, 3016(%rsp)
	movq	848(%rcx), %rsi
	movq	%rsi, 3024(%rsp)
	movq	856(%rcx), %rsi
	movq	%rsi, 3032(%rsp)
	movq	864(%rcx), %rsi
	movq	%rsi, 3040(%rsp)
	movq	872(%rcx), %rsi
	movq	%rsi, 3048(%rsp)
	movq	880(%rcx), %rsi
	movq	%rsi, 3056(%rsp)
	movq	888(%rcx), %rsi
	movq	%rsi, 3064(%rsp)
	movq	896(%rcx), %rsi
	movq	%rsi, 3072(%rsp)
	movq	904(%rcx), %rsi
	movq	%rsi, 3080(%rsp)
	movq	912(%rcx), %rsi
	movq	%rsi, 3088(%rsp)
	movq	920(%rcx), %rsi
	movq	%rsi, 3096(%rsp)
	movq	928(%rcx), %rsi
	movq	%rsi, 3104(%rsp)
	movq	936(%rcx), %rsi
	movq	%rsi, 3112(%rsp)
	movq	944(%rcx), %rsi
	movq	%rsi, 3120(%rsp)
	movq	952(%rcx), %rsi
	movq	%rsi, 3128(%rsp)
	movq	960(%rcx), %rsi
	movq	%rsi, 3136(%rsp)
	movq	968(%rcx), %rsi
	movq	%rsi, 3144(%rsp)
	movq	976(%rcx), %rsi
	movq	%rsi, 3152(%rsp)
	movq	984(%rcx), %rsi
	movq	%rsi, 3160(%rsp)
	movq	992(%rcx), %rsi
	movq	%rsi, 3168(%rsp)
	movq	1000(%rcx), %rsi
	movq	%rsi, 3176(%rsp)
	movq	1008(%rcx), %rsi
	movq	%rsi, 3184(%rsp)
	movq	1016(%rcx), %rsi
	movq	%rsi, 3192(%rsp)
	movq	1024(%rcx), %rsi
	movq	%rsi, 3200(%rsp)
	movq	1032(%rcx), %rsi
	movq	%rsi, 3208(%rsp)
	movq	1040(%rcx), %rsi
	movq	%rsi, 3216(%rsp)
	movq	1048(%rcx), %rsi
	movq	%rsi, 3224(%rsp)
	movq	1056(%rcx), %rsi
	movq	%rsi, 3232(%rsp)
	movq	1064(%rcx), %rsi
	movq	%rsi, 3240(%rsp)
	movq	1072(%rcx), %rsi
	movq	%rsi, 3248(%rsp)
	movq	1080(%rcx), %rsi
	movq	%rsi, 3256(%rsp)
	movq	1088(%rcx), %rsi
	movq	%rsi, 3264(%rsp)
	movq	1096(%rcx), %rsi
	movq	%rsi, 3272(%rsp)
	movq	1104(%rcx), %rsi
	movq	%rsi, 3280(%rsp)
	movq	1112(%rcx), %rsi
	movq	%rsi, 3288(%rsp)
	movq	1120(%rcx), %rsi
	movq	%rsi, 3296(%rsp)
	movq	1128(%rcx), %rsi
	movq	%rsi, 3304(%rsp)
	movq	1136(%rcx), %rsi
	movq	%rsi, 3312(%rsp)
	movq	1144(%rcx), %rsi
	movq	%rsi, 3320(%rsp)
	movq	1152(%rcx), %rsi
	movq	%rsi, 3328(%rsp)
	movq	1160(%rcx), %rsi
	movq	%rsi, 3336(%rsp)
	movq	1168(%rcx), %rsi
	movq	%rsi, 3344(%rsp)
	movq	1176(%rcx), %rsi
	movq	%rsi, 3352(%rsp)
	movq	1184(%rcx), %rsi
	movq	%rsi, 3360(%rsp)
	movq	1192(%rcx), %rsi
	movq	%rsi, 3368(%rsp)
	movq	1200(%rcx), %rsi
	movq	%rsi, 3376(%rsp)
	movq	1208(%rcx), %rsi
	movq	%rsi, 3384(%rsp)
	movq	1216(%rcx), %rsi
	movq	%rsi, 3392(%rsp)
	movq	1224(%rcx), %rsi
	movq	%rsi, 3400(%rsp)
	movq	1232(%rcx), %rsi
	movq	%rsi, 3408(%rsp)
	movq	1240(%rcx), %rsi
	movq	%rsi, 3416(%rsp)
	movq	1248(%rcx), %rsi
	movq	%rsi, 3424(%rsp)
	movq	1256(%rcx), %rsi
	movq	%rsi, 3432(%rsp)
	movq	1264(%rcx), %rsi
	movq	%rsi, 3440(%rsp)
	movq	1272(%rcx), %rsi
	movq	%rsi, 3448(%rsp)
	movq	1280(%rcx), %rsi
	movq	%rsi, 3456(%rsp)
	movq	1288(%rcx), %rsi
	movq	%rsi, 3464(%rsp)
	movq	1296(%rcx), %rsi
	movq	%rsi, 3472(%rsp)
	movq	1304(%rcx), %rsi
	movq	%rsi, 3480(%rsp)
	movq	1312(%rcx), %rsi
	movq	%rsi, 3488(%rsp)
	movq	1320(%rcx), %rsi
	movq	%rsi, 3496(%rsp)
	movq	1328(%rcx), %rsi
	movq	%rsi, 3504(%rsp)
	movq	1336(%rcx), %rsi
	movq	%rsi, 3512(%rsp)
	movq	1344(%rcx), %rsi
	movq	%rsi, 3520(%rsp)
	movq	1352(%rcx), %rsi
	movq	%rsi, 3528(%rsp)
	movq	1360(%rcx), %rsi
	movq	%rsi, 3536(%rsp)
	movq	1368(%rcx), %rsi
	movq	%rsi, 3544(%rsp)
	movq	1376(%rcx), %rsi
	movq	%rsi, 3552(%rsp)
	movq	1384(%rcx), %rsi
	movq	%rsi, 3560(%rsp)
	movq	1392(%rcx), %rsi
	movq	%rsi, 3568(%rsp)
	movq	1400(%rcx), %rsi
	movq	%rsi, 3576(%rsp)
	movq	1408(%rcx), %rsi
	movq	%rsi, 3584(%rsp)
	movq	1416(%rcx), %rsi
	movq	%rsi, 3592(%rsp)
	movq	1424(%rcx), %rsi
	movq	%rsi, 3600(%rsp)
	movq	1432(%rcx), %rsi
	movq	%rsi, 3608(%rsp)
	movq	1440(%rcx), %rsi
	movq	%rsi, 3616(%rsp)
	movq	1448(%rcx), %rsi
	movq	%rsi, 3624(%rsp)
	movq	1456(%rcx), %rsi
	movq	%rsi, 3632(%rsp)
	movq	1464(%rcx), %rsi
	movq	%rsi, 3640(%rsp)
	movq	1472(%rcx), %rsi
	movq	%rsi, 3648(%rsp)
	movq	1480(%rcx), %rsi
	movq	%rsi, 3656(%rsp)
	movq	1488(%rcx), %rsi
	movq	%rsi, 3664(%rsp)
	movq	1496(%rcx), %rsi
	movq	%rsi, 3672(%rsp)
	movq	1504(%rcx), %rsi
	movq	%rsi, 3680(%rsp)
	movq	1512(%rcx), %rsi
	movq	%rsi, 3688(%rsp)
	movq	1520(%rcx), %rsi
	movq	%rsi, 3696(%rsp)
	movq	1528(%rcx), %rcx
	movq	%rcx, 3704(%rsp)
	leaq	3712(%rsp), %rcx
	leaq	2176(%rsp), %rsi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$64:
	leaq	4224(%rsp), %rcx
	leaq	2560(%rsp), %rsi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$63:
	leaq	4736(%rsp), %rcx
	leaq	2944(%rsp), %rsi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$62:
	leaq	5248(%rsp), %rcx
	leaq	3328(%rsp), %rsi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$61:
	movq	1536(%rax), %rcx
	movq	%rcx, 20096(%rsp)
	movq	1544(%rax), %rcx
	movq	%rcx, 20104(%rsp)
	movq	1552(%rax), %rcx
	movq	%rcx, 20112(%rsp)
	movq	1560(%rax), %rax
	movq	%rax, 20120(%rsp)
	leaq	128(%rsp), %rax
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$60:
	movq	%r8, %mm3
	movq	$1, %rcx
	leaq	11904(%rsp), %rax
	leaq	20096(%rsp), %rsi
	leaq	-2168(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$59:
	leaq	2168(%rsp), %rsp
	movq	%mm3, %r9
	movb	$0, %bpl
	leaq	5760(%rsp), %rdx
	leaq	6272(%rsp), %r10
	leaq	6784(%rsp), %r11
	leaq	7296(%rsp), %rbx
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$58:
	leaq	600(%rsp), %rsp
	movq	%mm3, %r9
	movb	$4, %bpl
	leaq	7808(%rsp), %rdx
	leaq	8320(%rsp), %r10
	leaq	8832(%rsp), %r11
	leaq	9344(%rsp), %rbx
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
	leaq	5760(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$55:
	leaq	6272(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$54:
	leaq	6784(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$53:
	leaq	7296(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$52:
	leaq	9856(%rsp), %rcx
	leaq	11904(%rsp), %rdx
	leaq	5760(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$51:
	leaq	1152(%rsp), %rcx
	leaq	12416(%rsp), %rdx
	leaq	6272(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$50:
	leaq	9856(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$49:
	leaq	1152(%rsp), %rcx
	leaq	12928(%rsp), %rdx
	leaq	6784(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$48:
	leaq	9856(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$47:
	leaq	1152(%rsp), %rcx
	leaq	13440(%rsp), %rdx
	leaq	7296(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$46:
	leaq	9856(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$45:
	leaq	10368(%rsp), %rcx
	leaq	13952(%rsp), %rdx
	leaq	5760(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$44:
	leaq	1152(%rsp), %rcx
	leaq	14464(%rsp), %rdx
	leaq	6272(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$43:
	leaq	10368(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$42:
	leaq	1152(%rsp), %rcx
	leaq	14976(%rsp), %rdx
	leaq	6784(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$41:
	leaq	10368(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$40:
	leaq	1152(%rsp), %rcx
	leaq	15488(%rsp), %rdx
	leaq	7296(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$39:
	leaq	10368(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$38:
	leaq	10880(%rsp), %rcx
	leaq	16000(%rsp), %rdx
	leaq	5760(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$37:
	leaq	1152(%rsp), %rcx
	leaq	16512(%rsp), %rdx
	leaq	6272(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$36:
	leaq	10880(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$35:
	leaq	1152(%rsp), %rcx
	leaq	17024(%rsp), %rdx
	leaq	6784(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$34:
	leaq	10880(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$33:
	leaq	1152(%rsp), %rcx
	leaq	17536(%rsp), %rdx
	leaq	7296(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$32:
	leaq	10880(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$31:
	leaq	11392(%rsp), %rcx
	leaq	18048(%rsp), %rdx
	leaq	5760(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$30:
	leaq	1152(%rsp), %rcx
	leaq	18560(%rsp), %rdx
	leaq	6272(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$29:
	leaq	11392(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$28:
	leaq	1152(%rsp), %rcx
	leaq	19072(%rsp), %rdx
	leaq	6784(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$27:
	leaq	11392(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$26:
	leaq	1152(%rsp), %rcx
	leaq	19584(%rsp), %rdx
	leaq	7296(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$25:
	leaq	11392(%rsp), %rcx
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$24:
	leaq	1152(%rsp), %rcx
	leaq	3712(%rsp), %rdx
	leaq	5760(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$23:
	leaq	1664(%rsp), %rcx
	leaq	4224(%rsp), %rdx
	leaq	6272(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$22:
	leaq	1152(%rsp), %rcx
	leaq	1664(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$21:
	leaq	1664(%rsp), %rcx
	leaq	4736(%rsp), %rdx
	leaq	6784(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$20:
	leaq	1152(%rsp), %rcx
	leaq	1664(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$19:
	leaq	1664(%rsp), %rcx
	leaq	5248(%rsp), %rdx
	leaq	7296(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$18:
	leaq	1152(%rsp), %rcx
	leaq	1664(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$17:
	leaq	9856(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$16:
	leaq	10368(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$15:
	leaq	10880(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$14:
	leaq	11392(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$13:
	leaq	1152(%rsp), %rcx
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$12:
	leaq	9856(%rsp), %rcx
	leaq	7808(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$11:
	leaq	10368(%rsp), %rcx
	leaq	8320(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$10:
	leaq	10880(%rsp), %rcx
	leaq	8832(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$9:
	leaq	11392(%rsp), %rcx
	leaq	9344(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$8:
	leaq	1152(%rsp), %rcx
	leaq	640(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$7:
	leaq	1152(%rsp), %rcx
	leaq	128(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$6:
	leaq	9856(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	leaq	10368(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	leaq	10880(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	leaq	11392(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	leaq	1152(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	movq	%mm2, %rax
	movq	%rax, %rdx
	leaq	9856(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$5:
	leaq	10368(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$4:
	leaq	10880(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$3:
	leaq	11392(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$2:
	leaq	glob_data + 1120(%rip), %rcx
	vmovdqu	(%rcx), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 5184(%rip), %ymm2
	vpbroadcastw	glob_data + 5182(%rip), %ymm3
	vpbroadcastw	glob_data + 5180(%rip), %ymm4
	vpbroadcastq	glob_data + 4968(%rip), %ymm5
	vpbroadcastq	glob_data + 4960(%rip), %ymm6
	vmovdqu	glob_data + 160(%rip), %ymm7
	vmovdqu	glob_data + 128(%rip), %ymm8
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, (%rdx)
	movq	%xmm9, 16(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 22(%rdx)
	movq	%xmm9, 38(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 44(%rdx)
	movq	%xmm9, 60(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 66(%rdx)
	movq	%xmm9, 82(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 88(%rdx)
	movq	%xmm9, 104(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 110(%rdx)
	movq	%xmm9, 126(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 132(%rdx)
	movq	%xmm9, 148(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 154(%rdx)
	movq	%xmm9, 170(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 176(%rdx)
	movq	%xmm9, 192(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 198(%rdx)
	movq	%xmm9, 214(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 220(%rdx)
	movq	%xmm9, 236(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 242(%rdx)
	movq	%xmm9, 258(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 264(%rdx)
	movq	%xmm9, 280(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 286(%rdx)
	movq	%xmm9, 302(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 308(%rdx)
	movq	%xmm9, 324(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 330(%rdx)
	movq	%xmm9, 346(%rdx)
	vmovdqu	10368(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 352(%rdx)
	movq	%xmm9, 368(%rdx)
	vmovdqu	10400(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 374(%rdx)
	movq	%xmm9, 390(%rdx)
	vmovdqu	10432(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 396(%rdx)
	movq	%xmm9, 412(%rdx)
	vmovdqu	10464(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 418(%rdx)
	movq	%xmm9, 434(%rdx)
	vmovdqu	10496(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 440(%rdx)
	movq	%xmm9, 456(%rdx)
	vmovdqu	10528(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 462(%rdx)
	movq	%xmm9, 478(%rdx)
	vmovdqu	10560(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 484(%rdx)
	movq	%xmm9, 500(%rdx)
	vmovdqu	10592(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 506(%rdx)
	movq	%xmm9, 522(%rdx)
	vmovdqu	10624(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 528(%rdx)
	movq	%xmm9, 544(%rdx)
	vmovdqu	10656(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 550(%rdx)
	movq	%xmm9, 566(%rdx)
	vmovdqu	10688(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 572(%rdx)
	movq	%xmm9, 588(%rdx)
	vmovdqu	10720(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 594(%rdx)
	movq	%xmm9, 610(%rdx)
	vmovdqu	10752(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 616(%rdx)
	movq	%xmm9, 632(%rdx)
	vmovdqu	10784(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 638(%rdx)
	movq	%xmm9, 654(%rdx)
	vmovdqu	10816(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 660(%rdx)
	movq	%xmm9, 676(%rdx)
	vmovdqu	10848(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 682(%rdx)
	movq	%xmm9, 698(%rdx)
	vmovdqu	10880(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 704(%rdx)
	movq	%xmm9, 720(%rdx)
	vmovdqu	10912(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 726(%rdx)
	movq	%xmm9, 742(%rdx)
	vmovdqu	10944(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 748(%rdx)
	movq	%xmm9, 764(%rdx)
	vmovdqu	10976(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 770(%rdx)
	movq	%xmm9, 786(%rdx)
	vmovdqu	11008(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 792(%rdx)
	movq	%xmm9, 808(%rdx)
	vmovdqu	11040(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 814(%rdx)
	movq	%xmm9, 830(%rdx)
	vmovdqu	11072(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 836(%rdx)
	movq	%xmm9, 852(%rdx)
	vmovdqu	11104(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 858(%rdx)
	movq	%xmm9, 874(%rdx)
	vmovdqu	11136(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 880(%rdx)
	movq	%xmm9, 896(%rdx)
	vmovdqu	11168(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 902(%rdx)
	movq	%xmm9, 918(%rdx)
	vmovdqu	11200(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 924(%rdx)
	movq	%xmm9, 940(%rdx)
	vmovdqu	11232(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 946(%rdx)
	movq	%xmm9, 962(%rdx)
	vmovdqu	11264(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 968(%rdx)
	movq	%xmm9, 984(%rdx)
	vmovdqu	11296(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 990(%rdx)
	movq	%xmm9, 1006(%rdx)
	vmovdqu	11328(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1012(%rdx)
	movq	%xmm9, 1028(%rdx)
	vmovdqu	11360(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1034(%rdx)
	movq	%xmm9, 1050(%rdx)
	vmovdqu	11392(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1056(%rdx)
	movq	%xmm9, 1072(%rdx)
	vmovdqu	11424(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1078(%rdx)
	movq	%xmm9, 1094(%rdx)
	vmovdqu	11456(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm10
	vpaddw	%ymm2, %ymm9, %ymm11
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm9
	vpsubw	%ymm11, %ymm10, %ymm11
	vpandn	%ymm11, %ymm10, %ymm10
	vpsrlw	$15, %ymm10, %ymm10
	vpsubw	%ymm10, %ymm9, %ymm9
	vpmulhrsw	%ymm3, %ymm9, %ymm9
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1100(%rdx)
	movq	%xmm9, 1116(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1122(%rdx)
	movq	%xmm9, 1138(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1144(%rdx)
	movq	%xmm9, 1160(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1166(%rdx)
	movq	%xmm9, 1182(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1188(%rdx)
	movq	%xmm9, 1204(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1210(%rdx)
	movq	%xmm9, 1226(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1232(%rdx)
	movq	%xmm9, 1248(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1254(%rdx)
	movq	%xmm9, 1270(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1276(%rdx)
	movq	%xmm9, 1292(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1298(%rdx)
	movq	%xmm9, 1314(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1320(%rdx)
	movq	%xmm9, 1336(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1342(%rdx)
	movq	%xmm9, 1358(%rdx)
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
	vpand	%ymm4, %ymm9, %ymm9
	vpmaddwd	%ymm5, %ymm9, %ymm9
	vpsllvd	%ymm6, %ymm9, %ymm9
	vpsrldq	$8, %ymm9, %ymm10
	vpsrlvq	%ymm7, %ymm9, %ymm9
	vpsllq	$34, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm9, %ymm9
	vpshufb	%ymm8, %ymm9, %ymm9
	vmovdqu	%xmm9, %xmm10
	vextracti128	$1, %ymm9, %xmm9
	vpblendvb	%xmm8, %xmm9, %xmm10, %xmm10
	vmovdqu	%xmm10, 1364(%rdx)
	movq	%xmm9, 1380(%rdx)
	vmovdqu	11872(%rsp), %ymm9
	vpmullw	%ymm1, %ymm9, %ymm1
	vpaddw	%ymm2, %ymm9, %ymm2
	vpsllw	$3, %ymm9, %ymm9
	vpmulhw	%ymm0, %ymm9, %ymm0
	vpsubw	%ymm2, %ymm1, %ymm2
	vpandn	%ymm2, %ymm1, %ymm1
	vpsrlw	$15, %ymm1, %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vpmulhrsw	%ymm3, %ymm0, %ymm0
	vpand	%ymm4, %ymm0, %ymm0
	vpmaddwd	%ymm5, %ymm0, %ymm0
	vpsllvd	%ymm6, %ymm0, %ymm0
	vpsrldq	$8, %ymm0, %ymm1
	vpsrlvq	%ymm7, %ymm0, %ymm0
	vpsllq	$34, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm0, %ymm0
	vpshufb	%ymm8, %ymm0, %ymm0
	vmovdqu	%xmm0, %xmm1
	vextracti128	$1, %ymm0, %xmm0
	vpblendvb	%xmm8, %xmm0, %xmm1, %xmm1
	vmovdqu	%xmm1, 1386(%rdx)
	movq	%xmm0, 1402(%rdx)
	leaq	1408(%rax), %rax
	leaq	1152(%rsp), %rcx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$1:
	leaq	glob_data + 1120(%rip), %rdx
	vmovdqu	(%rdx), %ymm0
	vpbroadcastw	glob_data + 5190(%rip), %ymm1
	vpbroadcastw	glob_data + 5192(%rip), %ymm2
	vpbroadcastw	glob_data + 5188(%rip), %ymm3
	vpbroadcastd	glob_data + 5176(%rip), %ymm4
	vpbroadcastq	glob_data + 4976(%rip), %ymm5
	vmovdqu	glob_data + 416(%rip), %ymm6
	vmovdqu	(%rcx), %ymm7
	vmovdqu	32(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm8, %ymm7, %ymm7
	vpmaddubsw	%ymm3, %ymm7, %ymm7
	vpmaddwd	%ymm4, %ymm7, %ymm7
	vpsllvd	%ymm5, %ymm7, %ymm7
	vpsrlvq	%ymm5, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm7, %ymm7
	vmovdqu	%xmm7, %xmm8
	vextracti128	$1, %ymm7, %xmm7
	vpblendvb	%xmm6, %xmm7, %xmm8, %xmm8
	vmovdqu	%xmm8, (%rax)
	movd	%xmm7, 16(%rax)
	vmovdqu	64(%rcx), %ymm7
	vmovdqu	96(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm8, %ymm7, %ymm7
	vpmaddubsw	%ymm3, %ymm7, %ymm7
	vpmaddwd	%ymm4, %ymm7, %ymm7
	vpsllvd	%ymm5, %ymm7, %ymm7
	vpsrlvq	%ymm5, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm7, %ymm7
	vmovdqu	%xmm7, %xmm8
	vextracti128	$1, %ymm7, %xmm7
	vpblendvb	%xmm6, %xmm7, %xmm8, %xmm8
	vmovdqu	%xmm8, 20(%rax)
	movd	%xmm7, 36(%rax)
	vmovdqu	128(%rcx), %ymm7
	vmovdqu	160(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm8, %ymm7, %ymm7
	vpmaddubsw	%ymm3, %ymm7, %ymm7
	vpmaddwd	%ymm4, %ymm7, %ymm7
	vpsllvd	%ymm5, %ymm7, %ymm7
	vpsrlvq	%ymm5, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm7, %ymm7
	vmovdqu	%xmm7, %xmm8
	vextracti128	$1, %ymm7, %xmm7
	vpblendvb	%xmm6, %xmm7, %xmm8, %xmm8
	vmovdqu	%xmm8, 40(%rax)
	movd	%xmm7, 56(%rax)
	vmovdqu	192(%rcx), %ymm7
	vmovdqu	224(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm8, %ymm7, %ymm7
	vpmaddubsw	%ymm3, %ymm7, %ymm7
	vpmaddwd	%ymm4, %ymm7, %ymm7
	vpsllvd	%ymm5, %ymm7, %ymm7
	vpsrlvq	%ymm5, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm7, %ymm7
	vmovdqu	%xmm7, %xmm8
	vextracti128	$1, %ymm7, %xmm7
	vpblendvb	%xmm6, %xmm7, %xmm8, %xmm8
	vmovdqu	%xmm8, 60(%rax)
	movd	%xmm7, 76(%rax)
	vmovdqu	256(%rcx), %ymm7
	vmovdqu	288(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm8, %ymm7, %ymm7
	vpmaddubsw	%ymm3, %ymm7, %ymm7
	vpmaddwd	%ymm4, %ymm7, %ymm7
	vpsllvd	%ymm5, %ymm7, %ymm7
	vpsrlvq	%ymm5, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm7, %ymm7
	vmovdqu	%xmm7, %xmm8
	vextracti128	$1, %ymm7, %xmm7
	vpblendvb	%xmm6, %xmm7, %xmm8, %xmm8
	vmovdqu	%xmm8, 80(%rax)
	movd	%xmm7, 96(%rax)
	vmovdqu	320(%rcx), %ymm7
	vmovdqu	352(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm8, %ymm7, %ymm7
	vpmaddubsw	%ymm3, %ymm7, %ymm7
	vpmaddwd	%ymm4, %ymm7, %ymm7
	vpsllvd	%ymm5, %ymm7, %ymm7
	vpsrlvq	%ymm5, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm7, %ymm7
	vmovdqu	%xmm7, %xmm8
	vextracti128	$1, %ymm7, %xmm7
	vpblendvb	%xmm6, %xmm7, %xmm8, %xmm8
	vmovdqu	%xmm8, 100(%rax)
	movd	%xmm7, 116(%rax)
	vmovdqu	384(%rcx), %ymm7
	vmovdqu	416(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm8
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm8, %ymm8
	vpand	%ymm2, %ymm7, %ymm7
	vpand	%ymm2, %ymm8, %ymm8
	vpackuswb	%ymm8, %ymm7, %ymm7
	vpmaddubsw	%ymm3, %ymm7, %ymm7
	vpmaddwd	%ymm4, %ymm7, %ymm7
	vpsllvd	%ymm5, %ymm7, %ymm7
	vpsrlvq	%ymm5, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm7, %ymm7
	vmovdqu	%xmm7, %xmm8
	vextracti128	$1, %ymm7, %xmm7
	vpblendvb	%xmm6, %xmm7, %xmm8, %xmm8
	vmovdqu	%xmm8, 120(%rax)
	movd	%xmm7, 136(%rax)
	vmovdqu	448(%rcx), %ymm7
	vmovdqu	480(%rcx), %ymm8
	vpmulhw	%ymm0, %ymm7, %ymm7
	vpmulhw	%ymm0, %ymm8, %ymm0
	vpmulhrsw	%ymm1, %ymm7, %ymm7
	vpmulhrsw	%ymm1, %ymm0, %ymm0
	vpand	%ymm2, %ymm7, %ymm1
	vpand	%ymm2, %ymm0, %ymm0
	vpackuswb	%ymm0, %ymm1, %ymm0
	vpmaddubsw	%ymm3, %ymm0, %ymm0
	vpmaddwd	%ymm4, %ymm0, %ymm0
	vpsllvd	%ymm5, %ymm0, %ymm0
	vpsrlvq	%ymm5, %ymm0, %ymm0
	vpshufb	%ymm6, %ymm0, %ymm0
	vmovdqu	%xmm0, %xmm1
	vextracti128	$1, %ymm0, %xmm0
	vpblendvb	%xmm6, %xmm0, %xmm1, %xmm1
	vmovdqu	%xmm1, 140(%rax)
	movd	%xmm0, 156(%rax)
	movq	%mm1, %rax
	movq	64(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	72(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	80(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	88(%rsp), %rcx
	movq	%rcx, 24(%rax)
	xorq	%rax, %rax
	movq	20128(%rsp), %rbx
	movq	20136(%rsp), %rbp
	movq	20144(%rsp), %r12
	movq	20152(%rsp), %r13
	movq	20160(%rsp), %r14
	movq	20168(%rsp), %r15
	movq	20176(%rsp), %rsp
	ret
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
	movq	%rdi, %mm2
	movq	%rsi, %mm3
	movq	(%rdx), %rax
	movq	%rax, 14944(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 14952(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 14960(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 14968(%rsp)
	movb	$4, 14976(%rsp)
	movq	%rsp, %rax
	leaq	14944(%rsp), %rcx
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$57:
	movq	(%rsp), %rax
	movq	%rax, 14912(%rsp)
	movq	32(%rsp), %rax
	movq	%rax, 14984(%rsp)
	movq	8(%rsp), %rax
	movq	%rax, 14920(%rsp)
	movq	40(%rsp), %rax
	movq	%rax, 14992(%rsp)
	movq	16(%rsp), %rax
	movq	%rax, 14928(%rsp)
	movq	48(%rsp), %rax
	movq	%rax, 15000(%rsp)
	movq	24(%rsp), %rax
	movq	%rax, 14936(%rsp)
	movq	56(%rsp), %rax
	movq	%rax, 15008(%rsp)
	movq	$0, %rcx
	leaq	6720(%rsp), %rax
	leaq	14912(%rsp), %rsi
	leaq	-2168(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$56:
	leaq	2168(%rsp), %rsp
	movb	$0, %bpl
	leaq	576(%rsp), %rdx
	leaq	1088(%rsp), %r10
	leaq	1600(%rsp), %r11
	leaq	2112(%rsp), %rbx
	leaq	14984(%rsp), %r9
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$55:
	leaq	600(%rsp), %rsp
	movb	$4, %bpl
	leaq	2624(%rsp), %rdx
	leaq	3136(%rsp), %r10
	leaq	3648(%rsp), %r11
	leaq	4160(%rsp), %rbx
	leaq	14984(%rsp), %r9
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$54:
	leaq	600(%rsp), %rsp
	leaq	576(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$53:
	leaq	1088(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$52:
	leaq	1600(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$51:
	leaq	2112(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$50:
	leaq	2624(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$49:
	leaq	3136(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$48:
	leaq	3648(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$47:
	leaq	4160(%rsp), %rcx
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$46:
	leaq	4672(%rsp), %rcx
	leaq	6720(%rsp), %rdx
	leaq	576(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$45:
	leaq	64(%rsp), %rcx
	leaq	7232(%rsp), %rdx
	leaq	1088(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$44:
	leaq	4672(%rsp), %rcx
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$43:
	leaq	64(%rsp), %rcx
	leaq	7744(%rsp), %rdx
	leaq	1600(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$42:
	leaq	4672(%rsp), %rcx
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$41:
	leaq	64(%rsp), %rcx
	leaq	8256(%rsp), %rdx
	leaq	2112(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$40:
	leaq	4672(%rsp), %rcx
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$39:
	leaq	4672(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$38:
	leaq	5184(%rsp), %rcx
	leaq	8768(%rsp), %rdx
	leaq	576(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$37:
	leaq	64(%rsp), %rcx
	leaq	9280(%rsp), %rdx
	leaq	1088(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$36:
	leaq	5184(%rsp), %rcx
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$35:
	leaq	64(%rsp), %rcx
	leaq	9792(%rsp), %rdx
	leaq	1600(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$34:
	leaq	5184(%rsp), %rcx
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$33:
	leaq	64(%rsp), %rcx
	leaq	10304(%rsp), %rdx
	leaq	2112(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$32:
	leaq	5184(%rsp), %rcx
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$31:
	leaq	5184(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$30:
	leaq	5696(%rsp), %rcx
	leaq	10816(%rsp), %rdx
	leaq	576(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$29:
	leaq	64(%rsp), %rcx
	leaq	11328(%rsp), %rdx
	leaq	1088(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$28:
	leaq	5696(%rsp), %rcx
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$27:
	leaq	64(%rsp), %rcx
	leaq	11840(%rsp), %rdx
	leaq	1600(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$26:
	leaq	5696(%rsp), %rcx
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$25:
	leaq	64(%rsp), %rcx
	leaq	12352(%rsp), %rdx
	leaq	2112(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$24:
	leaq	5696(%rsp), %rcx
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$23:
	leaq	5696(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$22:
	leaq	6208(%rsp), %rcx
	leaq	12864(%rsp), %rdx
	leaq	576(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$21:
	leaq	64(%rsp), %rcx
	leaq	13376(%rsp), %rdx
	leaq	1088(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$20:
	leaq	6208(%rsp), %rcx
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$19:
	leaq	64(%rsp), %rcx
	leaq	13888(%rsp), %rdx
	leaq	1600(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$18:
	leaq	6208(%rsp), %rcx
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$17:
	leaq	64(%rsp), %rcx
	leaq	14400(%rsp), %rdx
	leaq	2112(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$16:
	leaq	6208(%rsp), %rcx
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$15:
	leaq	6208(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$14:
	leaq	4672(%rsp), %rcx
	leaq	2624(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$13:
	leaq	5184(%rsp), %rcx
	leaq	3136(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$12:
	leaq	5696(%rsp), %rcx
	leaq	3648(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$11:
	leaq	6208(%rsp), %rcx
	leaq	4160(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$10:
	leaq	4672(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	leaq	5184(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	leaq	5696(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	leaq	6208(%rsp), %rax
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	movq	%mm2, %rdx
	movq	%mm3, %rax
	movq	%rax, %rsi
	movq	%rsi, %rdi
	leaq	576(%rsp), %rcx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$9:
	leaq	384(%rsi), %rdi
	leaq	1088(%rsp), %rcx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$8:
	leaq	768(%rsi), %rdi
	leaq	1600(%rsp), %rcx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$7:
	leaq	1152(%rsi), %rdi
	leaq	2112(%rsp), %rcx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$6:
	movq	%rdx, %rsi
	movq	%rsi, %rdi
	leaq	4672(%rsp), %rcx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$5:
	leaq	384(%rsi), %rdi
	leaq	5184(%rsp), %rcx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$4:
	leaq	768(%rsi), %rdi
	leaq	5696(%rsp), %rcx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$3:
	leaq	1152(%rsi), %rdi
	leaq	6208(%rsp), %rcx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$2:
	movq	14912(%rsp), %rcx
	movq	%rcx, 1536(%rdx)
	movq	14920(%rsp), %rcx
	movq	%rcx, 1544(%rdx)
	movq	14928(%rsp), %rcx
	movq	%rcx, 1552(%rdx)
	movq	14936(%rsp), %rcx
	movq	%rcx, 1560(%rdx)
	movq	(%rdx), %rcx
	movq	%rcx, 1536(%rax)
	movq	8(%rdx), %rcx
	movq	%rcx, 1544(%rax)
	movq	16(%rdx), %rcx
	movq	%rcx, 1552(%rax)
	movq	24(%rdx), %rcx
	movq	%rcx, 1560(%rax)
	movq	32(%rdx), %rcx
	movq	%rcx, 1568(%rax)
	movq	40(%rdx), %rcx
	movq	%rcx, 1576(%rax)
	movq	48(%rdx), %rcx
	movq	%rcx, 1584(%rax)
	movq	56(%rdx), %rcx
	movq	%rcx, 1592(%rax)
	movq	64(%rdx), %rcx
	movq	%rcx, 1600(%rax)
	movq	72(%rdx), %rcx
	movq	%rcx, 1608(%rax)
	movq	80(%rdx), %rcx
	movq	%rcx, 1616(%rax)
	movq	88(%rdx), %rcx
	movq	%rcx, 1624(%rax)
	movq	96(%rdx), %rcx
	movq	%rcx, 1632(%rax)
	movq	104(%rdx), %rcx
	movq	%rcx, 1640(%rax)
	movq	112(%rdx), %rcx
	movq	%rcx, 1648(%rax)
	movq	120(%rdx), %rcx
	movq	%rcx, 1656(%rax)
	movq	128(%rdx), %rcx
	movq	%rcx, 1664(%rax)
	movq	136(%rdx), %rcx
	movq	%rcx, 1672(%rax)
	movq	144(%rdx), %rcx
	movq	%rcx, 1680(%rax)
	movq	152(%rdx), %rcx
	movq	%rcx, 1688(%rax)
	movq	160(%rdx), %rcx
	movq	%rcx, 1696(%rax)
	movq	168(%rdx), %rcx
	movq	%rcx, 1704(%rax)
	movq	176(%rdx), %rcx
	movq	%rcx, 1712(%rax)
	movq	184(%rdx), %rcx
	movq	%rcx, 1720(%rax)
	movq	192(%rdx), %rcx
	movq	%rcx, 1728(%rax)
	movq	200(%rdx), %rcx
	movq	%rcx, 1736(%rax)
	movq	208(%rdx), %rcx
	movq	%rcx, 1744(%rax)
	movq	216(%rdx), %rcx
	movq	%rcx, 1752(%rax)
	movq	224(%rdx), %rcx
	movq	%rcx, 1760(%rax)
	movq	232(%rdx), %rcx
	movq	%rcx, 1768(%rax)
	movq	240(%rdx), %rcx
	movq	%rcx, 1776(%rax)
	movq	248(%rdx), %rcx
	movq	%rcx, 1784(%rax)
	movq	256(%rdx), %rcx
	movq	%rcx, 1792(%rax)
	movq	264(%rdx), %rcx
	movq	%rcx, 1800(%rax)
	movq	272(%rdx), %rcx
	movq	%rcx, 1808(%rax)
	movq	280(%rdx), %rcx
	movq	%rcx, 1816(%rax)
	movq	288(%rdx), %rcx
	movq	%rcx, 1824(%rax)
	movq	296(%rdx), %rcx
	movq	%rcx, 1832(%rax)
	movq	304(%rdx), %rcx
	movq	%rcx, 1840(%rax)
	movq	312(%rdx), %rcx
	movq	%rcx, 1848(%rax)
	movq	320(%rdx), %rcx
	movq	%rcx, 1856(%rax)
	movq	328(%rdx), %rcx
	movq	%rcx, 1864(%rax)
	movq	336(%rdx), %rcx
	movq	%rcx, 1872(%rax)
	movq	344(%rdx), %rcx
	movq	%rcx, 1880(%rax)
	movq	352(%rdx), %rcx
	movq	%rcx, 1888(%rax)
	movq	360(%rdx), %rcx
	movq	%rcx, 1896(%rax)
	movq	368(%rdx), %rcx
	movq	%rcx, 1904(%rax)
	movq	376(%rdx), %rcx
	movq	%rcx, 1912(%rax)
	movq	384(%rdx), %rcx
	movq	%rcx, 1920(%rax)
	movq	392(%rdx), %rcx
	movq	%rcx, 1928(%rax)
	movq	400(%rdx), %rcx
	movq	%rcx, 1936(%rax)
	movq	408(%rdx), %rcx
	movq	%rcx, 1944(%rax)
	movq	416(%rdx), %rcx
	movq	%rcx, 1952(%rax)
	movq	424(%rdx), %rcx
	movq	%rcx, 1960(%rax)
	movq	432(%rdx), %rcx
	movq	%rcx, 1968(%rax)
	movq	440(%rdx), %rcx
	movq	%rcx, 1976(%rax)
	movq	448(%rdx), %rcx
	movq	%rcx, 1984(%rax)
	movq	456(%rdx), %rcx
	movq	%rcx, 1992(%rax)
	movq	464(%rdx), %rcx
	movq	%rcx, 2000(%rax)
	movq	472(%rdx), %rcx
	movq	%rcx, 2008(%rax)
	movq	480(%rdx), %rcx
	movq	%rcx, 2016(%rax)
	movq	488(%rdx), %rcx
	movq	%rcx, 2024(%rax)
	movq	496(%rdx), %rcx
	movq	%rcx, 2032(%rax)
	movq	504(%rdx), %rcx
	movq	%rcx, 2040(%rax)
	movq	512(%rdx), %rcx
	movq	%rcx, 2048(%rax)
	movq	520(%rdx), %rcx
	movq	%rcx, 2056(%rax)
	movq	528(%rdx), %rcx
	movq	%rcx, 2064(%rax)
	movq	536(%rdx), %rcx
	movq	%rcx, 2072(%rax)
	movq	544(%rdx), %rcx
	movq	%rcx, 2080(%rax)
	movq	552(%rdx), %rcx
	movq	%rcx, 2088(%rax)
	movq	560(%rdx), %rcx
	movq	%rcx, 2096(%rax)
	movq	568(%rdx), %rcx
	movq	%rcx, 2104(%rax)
	movq	576(%rdx), %rcx
	movq	%rcx, 2112(%rax)
	movq	584(%rdx), %rcx
	movq	%rcx, 2120(%rax)
	movq	592(%rdx), %rcx
	movq	%rcx, 2128(%rax)
	movq	600(%rdx), %rcx
	movq	%rcx, 2136(%rax)
	movq	608(%rdx), %rcx
	movq	%rcx, 2144(%rax)
	movq	616(%rdx), %rcx
	movq	%rcx, 2152(%rax)
	movq	624(%rdx), %rcx
	movq	%rcx, 2160(%rax)
	movq	632(%rdx), %rcx
	movq	%rcx, 2168(%rax)
	movq	640(%rdx), %rcx
	movq	%rcx, 2176(%rax)
	movq	648(%rdx), %rcx
	movq	%rcx, 2184(%rax)
	movq	656(%rdx), %rcx
	movq	%rcx, 2192(%rax)
	movq	664(%rdx), %rcx
	movq	%rcx, 2200(%rax)
	movq	672(%rdx), %rcx
	movq	%rcx, 2208(%rax)
	movq	680(%rdx), %rcx
	movq	%rcx, 2216(%rax)
	movq	688(%rdx), %rcx
	movq	%rcx, 2224(%rax)
	movq	696(%rdx), %rcx
	movq	%rcx, 2232(%rax)
	movq	704(%rdx), %rcx
	movq	%rcx, 2240(%rax)
	movq	712(%rdx), %rcx
	movq	%rcx, 2248(%rax)
	movq	720(%rdx), %rcx
	movq	%rcx, 2256(%rax)
	movq	728(%rdx), %rcx
	movq	%rcx, 2264(%rax)
	movq	736(%rdx), %rcx
	movq	%rcx, 2272(%rax)
	movq	744(%rdx), %rcx
	movq	%rcx, 2280(%rax)
	movq	752(%rdx), %rcx
	movq	%rcx, 2288(%rax)
	movq	760(%rdx), %rcx
	movq	%rcx, 2296(%rax)
	movq	768(%rdx), %rcx
	movq	%rcx, 2304(%rax)
	movq	776(%rdx), %rcx
	movq	%rcx, 2312(%rax)
	movq	784(%rdx), %rcx
	movq	%rcx, 2320(%rax)
	movq	792(%rdx), %rcx
	movq	%rcx, 2328(%rax)
	movq	800(%rdx), %rcx
	movq	%rcx, 2336(%rax)
	movq	808(%rdx), %rcx
	movq	%rcx, 2344(%rax)
	movq	816(%rdx), %rcx
	movq	%rcx, 2352(%rax)
	movq	824(%rdx), %rcx
	movq	%rcx, 2360(%rax)
	movq	832(%rdx), %rcx
	movq	%rcx, 2368(%rax)
	movq	840(%rdx), %rcx
	movq	%rcx, 2376(%rax)
	movq	848(%rdx), %rcx
	movq	%rcx, 2384(%rax)
	movq	856(%rdx), %rcx
	movq	%rcx, 2392(%rax)
	movq	864(%rdx), %rcx
	movq	%rcx, 2400(%rax)
	movq	872(%rdx), %rcx
	movq	%rcx, 2408(%rax)
	movq	880(%rdx), %rcx
	movq	%rcx, 2416(%rax)
	movq	888(%rdx), %rcx
	movq	%rcx, 2424(%rax)
	movq	896(%rdx), %rcx
	movq	%rcx, 2432(%rax)
	movq	904(%rdx), %rcx
	movq	%rcx, 2440(%rax)
	movq	912(%rdx), %rcx
	movq	%rcx, 2448(%rax)
	movq	920(%rdx), %rcx
	movq	%rcx, 2456(%rax)
	movq	928(%rdx), %rcx
	movq	%rcx, 2464(%rax)
	movq	936(%rdx), %rcx
	movq	%rcx, 2472(%rax)
	movq	944(%rdx), %rcx
	movq	%rcx, 2480(%rax)
	movq	952(%rdx), %rcx
	movq	%rcx, 2488(%rax)
	movq	960(%rdx), %rcx
	movq	%rcx, 2496(%rax)
	movq	968(%rdx), %rcx
	movq	%rcx, 2504(%rax)
	movq	976(%rdx), %rcx
	movq	%rcx, 2512(%rax)
	movq	984(%rdx), %rcx
	movq	%rcx, 2520(%rax)
	movq	992(%rdx), %rcx
	movq	%rcx, 2528(%rax)
	movq	1000(%rdx), %rcx
	movq	%rcx, 2536(%rax)
	movq	1008(%rdx), %rcx
	movq	%rcx, 2544(%rax)
	movq	1016(%rdx), %rcx
	movq	%rcx, 2552(%rax)
	movq	1024(%rdx), %rcx
	movq	%rcx, 2560(%rax)
	movq	1032(%rdx), %rcx
	movq	%rcx, 2568(%rax)
	movq	1040(%rdx), %rcx
	movq	%rcx, 2576(%rax)
	movq	1048(%rdx), %rcx
	movq	%rcx, 2584(%rax)
	movq	1056(%rdx), %rcx
	movq	%rcx, 2592(%rax)
	movq	1064(%rdx), %rcx
	movq	%rcx, 2600(%rax)
	movq	1072(%rdx), %rcx
	movq	%rcx, 2608(%rax)
	movq	1080(%rdx), %rcx
	movq	%rcx, 2616(%rax)
	movq	1088(%rdx), %rcx
	movq	%rcx, 2624(%rax)
	movq	1096(%rdx), %rcx
	movq	%rcx, 2632(%rax)
	movq	1104(%rdx), %rcx
	movq	%rcx, 2640(%rax)
	movq	1112(%rdx), %rcx
	movq	%rcx, 2648(%rax)
	movq	1120(%rdx), %rcx
	movq	%rcx, 2656(%rax)
	movq	1128(%rdx), %rcx
	movq	%rcx, 2664(%rax)
	movq	1136(%rdx), %rcx
	movq	%rcx, 2672(%rax)
	movq	1144(%rdx), %rcx
	movq	%rcx, 2680(%rax)
	movq	1152(%rdx), %rcx
	movq	%rcx, 2688(%rax)
	movq	1160(%rdx), %rcx
	movq	%rcx, 2696(%rax)
	movq	1168(%rdx), %rcx
	movq	%rcx, 2704(%rax)
	movq	1176(%rdx), %rcx
	movq	%rcx, 2712(%rax)
	movq	1184(%rdx), %rcx
	movq	%rcx, 2720(%rax)
	movq	1192(%rdx), %rcx
	movq	%rcx, 2728(%rax)
	movq	1200(%rdx), %rcx
	movq	%rcx, 2736(%rax)
	movq	1208(%rdx), %rcx
	movq	%rcx, 2744(%rax)
	movq	1216(%rdx), %rcx
	movq	%rcx, 2752(%rax)
	movq	1224(%rdx), %rcx
	movq	%rcx, 2760(%rax)
	movq	1232(%rdx), %rcx
	movq	%rcx, 2768(%rax)
	movq	1240(%rdx), %rcx
	movq	%rcx, 2776(%rax)
	movq	1248(%rdx), %rcx
	movq	%rcx, 2784(%rax)
	movq	1256(%rdx), %rcx
	movq	%rcx, 2792(%rax)
	movq	1264(%rdx), %rcx
	movq	%rcx, 2800(%rax)
	movq	1272(%rdx), %rcx
	movq	%rcx, 2808(%rax)
	movq	1280(%rdx), %rcx
	movq	%rcx, 2816(%rax)
	movq	1288(%rdx), %rcx
	movq	%rcx, 2824(%rax)
	movq	1296(%rdx), %rcx
	movq	%rcx, 2832(%rax)
	movq	1304(%rdx), %rcx
	movq	%rcx, 2840(%rax)
	movq	1312(%rdx), %rcx
	movq	%rcx, 2848(%rax)
	movq	1320(%rdx), %rcx
	movq	%rcx, 2856(%rax)
	movq	1328(%rdx), %rcx
	movq	%rcx, 2864(%rax)
	movq	1336(%rdx), %rcx
	movq	%rcx, 2872(%rax)
	movq	1344(%rdx), %rcx
	movq	%rcx, 2880(%rax)
	movq	1352(%rdx), %rcx
	movq	%rcx, 2888(%rax)
	movq	1360(%rdx), %rcx
	movq	%rcx, 2896(%rax)
	movq	1368(%rdx), %rcx
	movq	%rcx, 2904(%rax)
	movq	1376(%rdx), %rcx
	movq	%rcx, 2912(%rax)
	movq	1384(%rdx), %rcx
	movq	%rcx, 2920(%rax)
	movq	1392(%rdx), %rcx
	movq	%rcx, 2928(%rax)
	movq	1400(%rdx), %rcx
	movq	%rcx, 2936(%rax)
	movq	1408(%rdx), %rcx
	movq	%rcx, 2944(%rax)
	movq	1416(%rdx), %rcx
	movq	%rcx, 2952(%rax)
	movq	1424(%rdx), %rcx
	movq	%rcx, 2960(%rax)
	movq	1432(%rdx), %rcx
	movq	%rcx, 2968(%rax)
	movq	1440(%rdx), %rcx
	movq	%rcx, 2976(%rax)
	movq	1448(%rdx), %rcx
	movq	%rcx, 2984(%rax)
	movq	1456(%rdx), %rcx
	movq	%rcx, 2992(%rax)
	movq	1464(%rdx), %rcx
	movq	%rcx, 3000(%rax)
	movq	1472(%rdx), %rcx
	movq	%rcx, 3008(%rax)
	movq	1480(%rdx), %rcx
	movq	%rcx, 3016(%rax)
	movq	1488(%rdx), %rcx
	movq	%rcx, 3024(%rax)
	movq	1496(%rdx), %rcx
	movq	%rcx, 3032(%rax)
	movq	1504(%rdx), %rcx
	movq	%rcx, 3040(%rax)
	movq	1512(%rdx), %rcx
	movq	%rcx, 3048(%rax)
	movq	1520(%rdx), %rcx
	movq	%rcx, 3056(%rax)
	movq	1528(%rdx), %rcx
	movq	%rcx, 3064(%rax)
	movq	1536(%rdx), %rcx
	movq	%rcx, 3072(%rax)
	movq	1544(%rdx), %rcx
	movq	%rcx, 3080(%rax)
	movq	1552(%rdx), %rcx
	movq	%rcx, 3088(%rax)
	movq	1560(%rdx), %rcx
	movq	%rcx, 3096(%rax)
	movq	%rax, %mm0
	leaq	14912(%rsp), %rax
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$1:
	movq	%mm0, %rax
	movq	14912(%rsp), %rcx
	movq	%rcx, 3104(%rax)
	movq	14920(%rsp), %rcx
	movq	%rcx, 3112(%rax)
	movq	14928(%rsp), %rcx
	movq	%rcx, 3120(%rax)
	movq	14936(%rsp), %rcx
	movq	%rcx, 3128(%rax)
	movq	%mm1, %rcx
	leaq	32(%rcx), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, 3136(%rax)
	movq	8(%rcx), %rdx
	movq	%rdx, 3144(%rax)
	movq	16(%rcx), %rdx
	movq	%rdx, 3152(%rax)
	movq	24(%rcx), %rcx
	movq	%rcx, 3160(%rax)
	xorq	%rax, %rax
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
	leaq	32(%rsp), %rdi
	movq	$0, %r10
	movq	%rax, %rcx
	movq	%mm0, %rdx
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$21:
	leaq	856(%rsp), %rsp
	movq	$8, %r10
	leaq	2048(%rax), %rcx
	movq	%mm0, %rdx
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$20:
	leaq	856(%rsp), %rsp
	movq	$16, %r10
	leaq	4096(%rax), %rcx
	movq	%mm0, %rdx
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$19:
	leaq	856(%rsp), %rsp
	movq	$24, %r10
	leaq	6144(%rax), %rcx
	movq	%mm0, %rdx
	leaq	-856(%rsp), %rsp
	call	L_gen_matrix_sample_four_polynomials$1
L_gen_matrix_avx2$18:
	leaq	856(%rsp), %rsp
	movq	%rax, %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$17:
	leaq	512(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$16:
	leaq	1024(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$15:
	leaq	1536(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$14:
	leaq	2048(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$13:
	leaq	2560(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$12:
	leaq	3072(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$11:
	leaq	3584(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$10:
	leaq	4096(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$9:
	leaq	4608(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$8:
	leaq	5120(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$7:
	leaq	5632(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$6:
	leaq	6144(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$5:
	leaq	6656(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$4:
	leaq	7168(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$3:
	leaq	7680(%rax), %rcx
	call	L_nttunpack$1
L_gen_matrix_avx2$2:
	ret
L_gen_matrix_sample_four_polynomials$1:
	leaq	glob_data + 2848(%rip), %r9
	shlq	$5, %rdx
	addq	%rdx, %r10
	movq	(%r9,%r10), %rdx
	movq	%rdx, 832(%rsp)
	leaq	32(%rsp), %rdx
	leaq	832(%rsp), %r11
	call	L_shake128x4_absorb_A32_A2$1
L_gen_matrix_sample_four_polynomials$7:
	leaq	-24(%rsp), %rsp
	call	L_shake128x4_squeeze3blocks$1
L_gen_matrix_sample_four_polynomials$6:
	leaq	24(%rsp), %rsp
	movq	%rcx, %r9
	movq	%rdi, %r10
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$5:
	leaq	512(%rcx), %r9
	leaq	536(%rdi), %r10
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$4:
	leaq	1024(%rcx), %r9
	leaq	1072(%rdi), %r10
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$3:
	leaq	1536(%rcx), %r9
	leaq	1608(%rdi), %r10
	call	L__gen_matrix_fill_polynomial$1
L_gen_matrix_sample_four_polynomials$2:
	ret
L__gen_matrix_fill_polynomial$1:
	movq	$0, %rdx
	movq	$0, %rbp
	leaq	-8(%rsp), %rsp
	call	L_gen_matrix_buf_rejection$1
L__gen_matrix_fill_polynomial$6:
	leaq	8(%rsp), %rsp
	movq	$336, %rdx
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
	vmovdqu	glob_data + 32(%rip), %ymm1
	vmovdqu	glob_data + 0(%rip), %ymm2
	vmovdqu	glob_data + 64(%rip), %ymm3
	leaq	glob_data + 2912(%rip), %rbx
	movq	%rdx, 8(%rsp)
	movq	%rdx, %r13
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
	vpermq	$148, (%r10,%r13), %ymm4
	vpermq	$148, 24(%r10,%r13), %ymm5
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
	vinserti128	$1, %xmm9, %ymm8, %ymm7
	vpaddb	%ymm3, %ymm6, %ymm8
	vpunpcklbw	%ymm8, %ymm6, %ymm6
	vpaddb	%ymm3, %ymm7, %ymm8
	vpunpcklbw	%ymm8, %ymm7, %ymm7
	vpshufb	%ymm6, %ymm4, %ymm4
	vpshufb	%ymm7, %ymm5, %ymm5
	vmovdqu	%xmm4, (%r9,%rbp,2)
	vextracti128	$1, %ymm4, (%r9,%r13,2)
	vmovdqu	%xmm5, (%r9,%r14,2)
	vextracti128	$1, %ymm5, (%r9,%r15,2)
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
	movq	8(%rsp), %r12
	orq 	%r11, %r12
	jmp 	L_gen_matrix_buf_rejection$2
L_gen_matrix_buf_rejection$3:
	movq	$-1, %r13
	cmovnb	%r13, %r11
	cmpq	$256, %rbp
	jb  	L_gen_matrix_buf_rejection$4
	movq	$-1, %r12
	cmovb	%r12, %r11
	movq	$504, %r12
	jmp 	L_gen_matrix_buf_rejection$2
L_gen_matrix_buf_rejection$4:
	movq	$-1, %r13
	cmovnb	%r13, %r11
	movq	%r12, 8(%rsp)
	vpermq	$148, (%r10,%r12), %ymm4
	vpshufb	%ymm0, %ymm4, %ymm4
	vpsrlw	$4, %ymm4, %ymm5
	vpblendw	$170, %ymm5, %ymm4, %ymm4
	vpand	%ymm1, %ymm4, %ymm4
	vpcmpgtw	%ymm4, %ymm2, %ymm5
	vpxor	%ymm6, %ymm6, %ymm6
	vpacksswb	%ymm6, %ymm5, %ymm5
	vpmovmskb	%ymm5, %r13
	orq 	%r11, %r13
	movq	%r13, %r12
	andq	$255, %r12
	vmovq	(%rbx,%r12,8), %xmm5
	popcnt	%r12, %r12
	addq	%rbp, %r12
	shrq	$16, %r13
	andq	$255, %r13
	vmovq	(%rbx,%r13,8), %xmm6
	popcnt	%r13, %r13
	addq	%r12, %r13
	vinserti128	$1, %xmm6, %ymm5, %ymm5
	vpaddb	%ymm3, %ymm5, %ymm6
	vpunpcklbw	%ymm6, %ymm5, %ymm5
	vpshufb	%ymm5, %ymm4, %ymm4
	vmovdqu	%xmm4, %xmm5
	cmpq	$248, %rbp
	jbe 	L_gen_matrix_buf_rejection$14
	movq	$-1, %r14
	cmovbe	%r14, %r11
	movq	%xmm5, %r14
	cmpq	$252, %rbp
	jbe 	L_gen_matrix_buf_rejection$20
	movq	$-1, %r15
	cmovbe	%r15, %r11
	jmp 	L_gen_matrix_buf_rejection$21
L_gen_matrix_buf_rejection$20:
	movq	$-1, %r15
	cmovnbe	%r15, %r11
	movq	%r14, (%r9,%rbp,2)
	vpextrq	$1, %xmm5, %r14
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
	movl	%r14d, (%r9,%rbp,2)
	shrq	$32, %r14
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
	movw	%r14w, (%r9,%rbp,2)
L_gen_matrix_buf_rejection$17:
	jmp 	L_gen_matrix_buf_rejection$15
L_gen_matrix_buf_rejection$14:
	movq	$-1, %r14
	cmovnbe	%r14, %r11
	vmovdqu	%xmm5, (%r9,%rbp,2)
L_gen_matrix_buf_rejection$15:
	vextracti128	$1, %ymm4, %xmm4
	cmpq	$248, %r12
	jbe 	L_gen_matrix_buf_rejection$6
	movq	$-1, %rbp
	cmovbe	%rbp, %r11
	movq	%xmm4, %rbp
	cmpq	$252, %r12
	jbe 	L_gen_matrix_buf_rejection$12
	movq	$-1, %r14
	cmovbe	%r14, %r11
	jmp 	L_gen_matrix_buf_rejection$13
L_gen_matrix_buf_rejection$12:
	movq	$-1, %r14
	cmovnbe	%r14, %r11
	movq	%rbp, (%r9,%r12,2)
	vpextrq	$1, %xmm4, %rbp
	addq	$4, %r12
L_gen_matrix_buf_rejection$13:
	cmpq	$254, %r12
	jbe 	L_gen_matrix_buf_rejection$10
	movq	$-1, %r14
	cmovbe	%r14, %r11
	jmp 	L_gen_matrix_buf_rejection$11
L_gen_matrix_buf_rejection$10:
	movq	$-1, %r14
	cmovnbe	%r14, %r11
	movl	%ebp, (%r9,%r12,2)
	shrq	$32, %rbp
	addq	$2, %r12
L_gen_matrix_buf_rejection$11:
	cmpq	$255, %r12
	jbe 	L_gen_matrix_buf_rejection$8
	movq	$-1, %rbp
	cmovbe	%rbp, %r11
	jmp 	L_gen_matrix_buf_rejection$7
L_gen_matrix_buf_rejection$8:
	movq	$-1, %r14
	cmovnbe	%r14, %r11
	movw	%bp, (%r9,%r12,2)
L_gen_matrix_buf_rejection$9:
	jmp 	L_gen_matrix_buf_rejection$7
L_gen_matrix_buf_rejection$6:
	movq	$-1, %rbp
	cmovnbe	%rbp, %r11
	vmovdqu	%xmm4, (%r9,%r12,2)
L_gen_matrix_buf_rejection$7:
	movq	%r13, %rbp
	movq	8(%rsp), %r12
	orq 	%r11, %r12
	addq	$24, %r12
L_gen_matrix_buf_rejection$5:
L_gen_matrix_buf_rejection$2:
	cmpq	$481, %r12
	jb  	L_gen_matrix_buf_rejection$3
	ret
L_i_poly_decompress$1:
	leaq	glob_data + 1184(%rip), %rdi
	vmovdqu	(%rdi), %ymm0
	vmovdqu	glob_data + 384(%rip), %ymm1
	vmovdqu	glob_data + 352(%rip), %ymm2
	vmovdqu	glob_data + 320(%rip), %ymm3
	movq	(%rsi), %xmm4
	movw	8(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, (%rdx)
	movq	10(%rsi), %xmm4
	movw	18(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 32(%rdx)
	movq	20(%rsi), %xmm4
	movw	28(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 64(%rdx)
	movq	30(%rsi), %xmm4
	movw	38(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 96(%rdx)
	movq	40(%rsi), %xmm4
	movw	48(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 128(%rdx)
	movq	50(%rsi), %xmm4
	movw	58(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 160(%rdx)
	movq	60(%rsi), %xmm4
	movw	68(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 192(%rdx)
	movq	70(%rsi), %xmm4
	movw	78(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 224(%rdx)
	movq	80(%rsi), %xmm4
	movw	88(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 256(%rdx)
	movq	90(%rsi), %xmm4
	movw	98(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 288(%rdx)
	movq	100(%rsi), %xmm4
	movw	108(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 320(%rdx)
	movq	110(%rsi), %xmm4
	movw	118(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 352(%rdx)
	movq	120(%rsi), %xmm4
	movw	128(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 384(%rdx)
	movq	130(%rsi), %xmm4
	movw	138(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 416(%rdx)
	movq	140(%rsi), %xmm4
	movw	148(%rsi), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 448(%rdx)
	movq	150(%rsi), %xmm4
	movw	158(%rsi), %si
	vpinsrw	$4, %esi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm1
	vpand	%ymm2, %ymm1, %ymm1
	vpmullw	%ymm3, %ymm1, %ymm1
	vpmulhrsw	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, 480(%rdx)
	ret
L_i_poly_tomsg$1:
	call	L_poly_csubq$1
L_i_poly_tomsg$2:
	leaq	glob_data + 960(%rip), %rdx
	vmovdqu	(%rdx), %ymm0
	leaq	glob_data + 928(%rip), %rdx
	vmovdqu	(%rdx), %ymm1
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
	vpmovmskb	%ymm2, %edx
	movl	%edx, (%rax)
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
	vpmovmskb	%ymm2, %edx
	movl	%edx, 4(%rax)
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
	vpmovmskb	%ymm2, %edx
	movl	%edx, 8(%rax)
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
	vpmovmskb	%ymm2, %edx
	movl	%edx, 12(%rax)
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
	vpmovmskb	%ymm2, %edx
	movl	%edx, 16(%rax)
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
	vpmovmskb	%ymm2, %edx
	movl	%edx, 20(%rax)
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
	vpmovmskb	%ymm2, %edx
	movl	%edx, 24(%rax)
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
L_i_poly_tobytes$1:
	call	L_poly_csubq$1
L_i_poly_tobytes$2:
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
	vmovdqu	%ymm4, (%rdi)
	vmovdqu	%ymm5, 32(%rdi)
	vmovdqu	%ymm6, 64(%rdi)
	vmovdqu	%ymm1, 96(%rdi)
	vmovdqu	%ymm2, 128(%rdi)
	vmovdqu	%ymm0, 160(%rdi)
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
	vmovdqu	%ymm4, 192(%rdi)
	vmovdqu	%ymm5, 224(%rdi)
	vmovdqu	%ymm6, 256(%rdi)
	vmovdqu	%ymm1, 288(%rdi)
	vmovdqu	%ymm2, 320(%rdi)
	vmovdqu	%ymm0, 352(%rdi)
	ret
L_poly_sub$1:
	vmovdqu	(%rdx), %ymm0
	vmovdqu	(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rcx)
	vmovdqu	32(%rdx), %ymm0
	vmovdqu	32(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rcx)
	vmovdqu	64(%rdx), %ymm0
	vmovdqu	64(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 64(%rcx)
	vmovdqu	96(%rdx), %ymm0
	vmovdqu	96(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 96(%rcx)
	vmovdqu	128(%rdx), %ymm0
	vmovdqu	128(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 128(%rcx)
	vmovdqu	160(%rdx), %ymm0
	vmovdqu	160(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 160(%rcx)
	vmovdqu	192(%rdx), %ymm0
	vmovdqu	192(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 192(%rcx)
	vmovdqu	224(%rdx), %ymm0
	vmovdqu	224(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 224(%rcx)
	vmovdqu	256(%rdx), %ymm0
	vmovdqu	256(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 256(%rcx)
	vmovdqu	288(%rdx), %ymm0
	vmovdqu	288(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 288(%rcx)
	vmovdqu	320(%rdx), %ymm0
	vmovdqu	320(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 320(%rcx)
	vmovdqu	352(%rdx), %ymm0
	vmovdqu	352(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 352(%rcx)
	vmovdqu	384(%rdx), %ymm0
	vmovdqu	384(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 384(%rcx)
	vmovdqu	416(%rdx), %ymm0
	vmovdqu	416(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 416(%rcx)
	vmovdqu	448(%rdx), %ymm0
	vmovdqu	448(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 448(%rcx)
	vmovdqu	480(%rdx), %ymm0
	vmovdqu	480(%rsi), %ymm1
	vpsubw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 480(%rcx)
	ret
L_poly_ntt$1:
	leaq	glob_data + 2016(%rip), %rdx
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vpbroadcastd	(%rdx), %ymm1
	vpbroadcastd	4(%rdx), %ymm2
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
	vpbroadcastd	8(%rdx), %ymm1
	vpbroadcastd	12(%rdx), %ymm4
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
	vmovdqu	glob_data + 1120(%rip), %ymm9
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
	vpbroadcastd	400(%rdx), %ymm5
	vpbroadcastd	404(%rdx), %ymm8
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
	vmovdqu	glob_data + 1120(%rip), %ymm9
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
	leaq	glob_data + 1216(%rip), %rdx
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	(%rdx), %ymm12
	vmovdqu	64(%rdx), %ymm1
	vmovdqu	32(%rdx), %ymm2
	vmovdqu	96(%rdx), %ymm5
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
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	vmovdqu	%ymm1, (%rcx)
	vmovdqu	%ymm3, 32(%rcx)
	vmovdqu	%ymm6, 64(%rcx)
	vmovdqu	%ymm4, 96(%rcx)
	vmovdqu	%ymm5, 128(%rcx)
	vmovdqu	%ymm8, 160(%rcx)
	vmovdqu	%ymm9, 192(%rcx)
	vmovdqu	%ymm7, 224(%rcx)
	vmovdqu	392(%rdx), %ymm12
	vmovdqu	456(%rdx), %ymm1
	vmovdqu	424(%rdx), %ymm2
	vmovdqu	488(%rdx), %ymm5
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
	vmovdqu	glob_data + 1120(%rip), %ymm1
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
	vmovdqu	%ymm5, 384(%rcx)
	vmovdqu	%ymm8, 416(%rcx)
	vmovdqu	%ymm9, 448(%rcx)
	vmovdqu	%ymm7, 480(%rcx)
	vpbroadcastd	784(%rdx), %ymm1
	vpbroadcastd	788(%rdx), %ymm2
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
	vmovdqu	glob_data + 1056(%rip), %ymm8
	vmovdqu	glob_data + 1088(%rip), %ymm9
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
	vmovdqu	glob_data + 1056(%rip), %ymm2
	vmovdqu	glob_data + 1088(%rip), %ymm3
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
	leaq	576(%rsp), %rbx
	leaq	-824(%rsp), %rsp
	call	L_shake256x4_A128__A32_A1$1
L_poly_getnoise_eta1_4x$2:
	leaq	824(%rsp), %rsp
	lfence
	movq	$0, %rdx
	movq	544(%rsp), %rdx
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
	vmovdqu	%ymm5, (%r9)
	vmovdqu	%ymm7, 32(%r9)
	vmovdqu	%ymm6, 64(%r9)
	vmovdqu	%ymm4, 96(%r9)
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
	vmovdqu	%ymm5, 128(%r9)
	vmovdqu	%ymm7, 160(%r9)
	vmovdqu	%ymm6, 192(%r9)
	vmovdqu	%ymm4, 224(%r9)
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
	vmovdqu	%ymm5, 256(%r9)
	vmovdqu	%ymm7, 288(%r9)
	vmovdqu	%ymm6, 320(%r9)
	vmovdqu	%ymm4, 352(%r9)
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
	vmovdqu	%ymm5, (%r10)
	vmovdqu	%ymm7, 32(%r10)
	vmovdqu	%ymm6, 64(%r10)
	vmovdqu	%ymm4, 96(%r10)
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
	vmovdqu	%ymm5, 128(%r10)
	vmovdqu	%ymm7, 160(%r10)
	vmovdqu	%ymm6, 192(%r10)
	vmovdqu	%ymm4, 224(%r10)
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
	vmovdqu	%ymm5, 256(%r10)
	vmovdqu	%ymm7, 288(%r10)
	vmovdqu	%ymm6, 320(%r10)
	vmovdqu	%ymm4, 352(%r10)
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
	vmovdqu	%ymm5, (%r11)
	vmovdqu	%ymm7, 32(%r11)
	vmovdqu	%ymm6, 64(%r11)
	vmovdqu	%ymm4, 96(%r11)
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
	vmovdqu	%ymm5, 128(%r11)
	vmovdqu	%ymm7, 160(%r11)
	vmovdqu	%ymm6, 192(%r11)
	vmovdqu	%ymm4, 224(%r11)
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
	vmovdqu	%ymm5, 256(%r11)
	vmovdqu	%ymm7, 288(%r11)
	vmovdqu	%ymm6, 320(%r11)
	vmovdqu	%ymm4, 352(%r11)
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
	vmovdqu	%ymm1, 384(%r11)
	vmovdqu	%ymm3, 416(%r11)
	vmovdqu	%ymm2, 448(%r11)
	vmovdqu	%ymm0, 480(%r11)
	ret
L_poly_getnoise_eta2$1:
	movq	%rcx, %mm0
	movb	%al, 176(%rsp)
	leaq	32(%rsp), %rax
	leaq	176(%rsp), %rcx
	leaq	-248(%rsp), %rsp
	call	L_shake256_A128__A32_A1$1
L_poly_getnoise_eta2$2:
	leaq	248(%rsp), %rsp
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
	ret
L_i_poly_frommsg$1:
	leaq	glob_data + 992(%rip), %rcx
	vmovdqu	(%rcx), %ymm0
	vbroadcasti128	glob_data + 2832(%rip), %ymm1
	vbroadcasti128	glob_data + 2816(%rip), %ymm2
	vmovdqu	(%rdx), %ymm3
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
L_poly_frommont$1:
	leaq	glob_data + 1184(%rip), %rcx
	vmovdqu	(%rcx), %ymm0
	leaq	glob_data + 1152(%rip), %rcx
	vmovdqu	(%rcx), %ymm1
	leaq	glob_data + 896(%rip), %rcx
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
L_i_poly_frombytes$1:
	leaq	glob_data + 1024(%rip), %rdi
	vmovdqu	(%rdi), %ymm0
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
	vmovdqu	%ymm3, (%rcx)
	vmovdqu	%ymm6, 32(%rcx)
	vmovdqu	%ymm4, 64(%rcx)
	vmovdqu	%ymm7, 96(%rcx)
	vmovdqu	%ymm1, 128(%rcx)
	vmovdqu	%ymm8, 160(%rcx)
	vmovdqu	%ymm5, 192(%rcx)
	vmovdqu	%ymm2, 224(%rcx)
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
	vmovdqu	%ymm3, 256(%rcx)
	vmovdqu	%ymm6, 288(%rcx)
	vmovdqu	%ymm4, 320(%rcx)
	vmovdqu	%ymm7, 352(%rcx)
	vmovdqu	%ymm1, 384(%rcx)
	vmovdqu	%ymm8, 416(%rcx)
	vmovdqu	%ymm5, 448(%rcx)
	vmovdqu	%ymm0, 480(%rcx)
	ret
L_poly_basemul$1:
	vmovdqu	glob_data + 1184(%rip), %ymm0
	vmovdqu	glob_data + 1152(%rip), %ymm1
	vmovdqu	glob_data + 2288(%rip), %ymm2
	vmovdqu	glob_data + 2320(%rip), %ymm3
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
	vmovdqu	%ymm5, (%rcx)
	vmovdqu	%ymm4, 32(%rcx)
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
	vmovdqu	%ymm3, 64(%rcx)
	vmovdqu	%ymm2, 96(%rcx)
	vmovdqu	glob_data + 2352(%rip), %ymm2
	vmovdqu	glob_data + 2384(%rip), %ymm3
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
	vmovdqu	%ymm5, 128(%rcx)
	vmovdqu	%ymm4, 160(%rcx)
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
	vmovdqu	%ymm3, 192(%rcx)
	vmovdqu	%ymm2, 224(%rcx)
	vmovdqu	glob_data + 2680(%rip), %ymm2
	vmovdqu	glob_data + 2712(%rip), %ymm3
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
	vmovdqu	%ymm5, 256(%rcx)
	vmovdqu	%ymm4, 288(%rcx)
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
	vmovdqu	%ymm3, 320(%rcx)
	vmovdqu	%ymm2, 352(%rcx)
	vmovdqu	glob_data + 2744(%rip), %ymm2
	vmovdqu	glob_data + 2776(%rip), %ymm3
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
	vmovdqu	%ymm5, 384(%rcx)
	vmovdqu	%ymm4, 416(%rcx)
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
	vmovdqu	%ymm3, 448(%rcx)
	vmovdqu	%ymm0, 480(%rcx)
	ret
L_poly_csubq$1:
	vmovdqu	glob_data + 1184(%rip), %ymm0
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
	vmovdqu	(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rcx)
	vmovdqu	32(%rcx), %ymm0
	vmovdqu	32(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rcx)
	vmovdqu	64(%rcx), %ymm0
	vmovdqu	64(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 64(%rcx)
	vmovdqu	96(%rcx), %ymm0
	vmovdqu	96(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 96(%rcx)
	vmovdqu	128(%rcx), %ymm0
	vmovdqu	128(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 128(%rcx)
	vmovdqu	160(%rcx), %ymm0
	vmovdqu	160(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 160(%rcx)
	vmovdqu	192(%rcx), %ymm0
	vmovdqu	192(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 192(%rcx)
	vmovdqu	224(%rcx), %ymm0
	vmovdqu	224(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 224(%rcx)
	vmovdqu	256(%rcx), %ymm0
	vmovdqu	256(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 256(%rcx)
	vmovdqu	288(%rcx), %ymm0
	vmovdqu	288(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 288(%rcx)
	vmovdqu	320(%rcx), %ymm0
	vmovdqu	320(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 320(%rcx)
	vmovdqu	352(%rcx), %ymm0
	vmovdqu	352(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 352(%rcx)
	vmovdqu	384(%rcx), %ymm0
	vmovdqu	384(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 384(%rcx)
	vmovdqu	416(%rcx), %ymm0
	vmovdqu	416(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 416(%rcx)
	vmovdqu	448(%rcx), %ymm0
	vmovdqu	448(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 448(%rcx)
	vmovdqu	480(%rcx), %ymm0
	vmovdqu	480(%rdx), %ymm1
	vpaddw	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 480(%rcx)
	ret
L_shake256_A32__A1600$1:
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm4, %ymm4, %ymm4
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_shake256_A32__A1600$3
L_shake256_A32__A1600$4:
	movq	(%rcx,%rdx), %rdi
	movq	%rdi, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
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
	vpxor	%ymm10, %ymm0, %ymm0
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm8, %ymm4, %ymm4
	addq	$136, %rdx
	call	L_keccakf1600_avx2$1
L_shake256_A32__A1600$5:
	incq	%rsi
L_shake256_A32__A1600$3:
	cmpq	$11, %rsi
	jb  	L_shake256_A32__A1600$4
	movq	(%rcx,%rdx), %rsi
	movq	%rsi, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	vmovdqu	8(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rcx,%rdx), %rsi
	movq	%rsi, %xmm9
	vmovdqu	48(%rcx,%rdx), %ymm7
	movq	80(%rcx,%rdx), %rsi
	movq	%rsi, %xmm10
	vmovdqu	88(%rcx,%rdx), %xmm8
	movq	$31, %rcx
	movq	%rcx, %xmm11
	vinserti128	$1, %xmm11, %ymm8, %ymm8
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm9, %xmm11
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm0, %ymm0
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm8, %ymm4, %ymm4
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	movq	$0, %rcx
	call	L_keccakf1600_avx2$1
L_shake256_A32__A1600$2:
	movq	%xmm6, (%rax,%rcx)
	vmovdqu	%xmm5, %xmm0
	vmovdqu	%xmm0, 8(%rax,%rcx)
	vextracti128	$1, %ymm5, %xmm0
	movq	%xmm0, 24(%rax,%rcx)
	ret
L_sha3_256A_A1568$1:
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm4, %ymm4, %ymm4
	movq	$0, %rcx
	movq	$0, %rsi
	jmp 	L_sha3_256A_A1568$3
L_sha3_256A_A1568$4:
	movq	(%rdx,%rcx), %r8
	movq	%r8, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	vmovdqu	8(%rdx,%rcx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rdx,%rcx), %r8
	movq	%r8, %xmm9
	vmovdqu	48(%rdx,%rcx), %ymm7
	movq	80(%rdx,%rcx), %r8
	movq	%r8, %xmm10
	vmovdqu	88(%rdx,%rcx), %ymm8
	movq	120(%rdx,%rcx), %r8
	vpinsrq	$1, %r8, %xmm9, %xmm11
	vpxor	%xmm9, %xmm9, %xmm9
	vmovq	128(%rdx,%rcx), %xmm12
	movq	$0, %r8
	vpinsrq	$1, %r8, %xmm12, %xmm12
	vinserti128	$1, %xmm9, %ymm12, %ymm9
	movq	$0, %r8
	vpinsrq	$1, %r8, %xmm10, %xmm10
	vinserti128	$1, %xmm11, %ymm10, %ymm10
	vpxor	%ymm10, %ymm0, %ymm0
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm8, %ymm4, %ymm4
	addq	$136, %rcx
	call	L_keccakf1600_avx2$1
L_sha3_256A_A1568$5:
	incq	%rsi
L_sha3_256A_A1568$3:
	cmpq	$11, %rsi
	jb  	L_sha3_256A_A1568$4
	movq	(%rdx,%rcx), %rsi
	movq	%rsi, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	vmovdqu	8(%rdx,%rcx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rdx,%rcx), %rsi
	movq	%rsi, %xmm9
	vmovdqu	48(%rdx,%rcx), %xmm7
	vmovq	64(%rdx,%rcx), %xmm8
	movq	$6, %rcx
	vpinsrq	$1, %rcx, %xmm8, %xmm8
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
	vpxor	%ymm10, %ymm0, %ymm0
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm10, %ymm2, %ymm2
	vpxor	%ymm8, %ymm4, %ymm4
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	movq	$0, %rcx
	call	L_keccakf1600_avx2$1
L_sha3_256A_A1568$2:
	movq	%xmm6, (%rax,%rcx)
	vmovdqu	%xmm5, %xmm0
	vmovdqu	%xmm0, 8(%rax,%rcx)
	vextracti128	$1, %ymm5, %xmm0
	movq	%xmm0, 24(%rax,%rcx)
	ret
L_shake128x4_squeeze3blocks$1:
	movq	%rdi, %rbx
	leaq	536(%rdi), %rbp
	leaq	1072(%rdi), %r12
	leaq	1608(%rdi), %r13
	movq	$0, %r14
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake128x4_squeeze3blocks$16:
	leaq	824(%rsp), %rsp
	movq	$0, %r9
	jmp 	L_shake128x4_squeeze3blocks$14
L_shake128x4_squeeze3blocks$15:
	vmovdqu	(%rdx,%r9,4), %ymm0
	vmovdqu	32(%rdx,%r9,4), %ymm1
	vmovdqu	64(%rdx,%r9,4), %ymm2
	vmovdqu	96(%rdx,%r9,4), %ymm3
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
	movq	(%rdx,%r9,4), %r10
	movq	%r10, (%rbx,%r14)
	movq	8(%rdx,%r9,4), %r10
	movq	%r10, (%rbp,%r14)
	movq	16(%rdx,%r9,4), %r10
	movq	%r10, (%r12,%r14)
	movq	24(%rdx,%r9,4), %r10
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
	vmovdqu	(%rdx,%r9,4), %ymm0
	vmovdqu	32(%rdx,%r9,4), %ymm1
	vmovdqu	64(%rdx,%r9,4), %ymm2
	vmovdqu	96(%rdx,%r9,4), %ymm3
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
	movq	(%rdx,%r9,4), %r10
	movq	%r10, (%rbx,%r14)
	movq	8(%rdx,%r9,4), %r10
	movq	%r10, (%rbp,%r14)
	movq	16(%rdx,%r9,4), %r10
	movq	%r10, (%r12,%r14)
	movq	24(%rdx,%r9,4), %r10
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
	vmovdqu	(%rdx,%r9,4), %ymm0
	vmovdqu	32(%rdx,%r9,4), %ymm1
	vmovdqu	64(%rdx,%r9,4), %ymm2
	vmovdqu	96(%rdx,%r9,4), %ymm3
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
	movq	(%rdx,%r9,4), %r10
	movq	%r10, (%rbx,%r14)
	movq	8(%rdx,%r9,4), %r10
	movq	%r10, (%rbp,%r14)
	movq	16(%rdx,%r9,4), %r10
	movq	%r10, (%r12,%r14)
	movq	24(%rdx,%r9,4), %r10
	movq	%r10, (%r13,%r14)
	addq	$8, %r9
	addq	$8, %r14
L_shake128x4_squeeze3blocks$2:
	cmpq	$200, %r9
	jl  	L_shake128x4_squeeze3blocks$3
	ret
L_shake128_next_state$1:
	leaq	336(%r10), %r11
	vpbroadcastq	(%r11), %ymm6
	vmovdqu	8(%r11), %ymm5
	vmovq	40(%r11), %xmm0
	vmovdqu	48(%r11), %ymm1
	vmovq	80(%r11), %xmm2
	vmovdqu	88(%r11), %ymm3
	movq	120(%r11), %rbx
	vpinsrq	$1, %rbx, %xmm0, %xmm0
	vmovdqu	128(%r11), %ymm4
	movq	160(%r11), %rbx
	vpinsrq	$1, %rbx, %xmm2, %xmm2
	vinserti128	$1, %xmm0, %ymm2, %ymm0
	vmovdqu	168(%r11), %ymm2
	vpblendd	$195, %ymm4, %ymm1, %ymm7
	vpblendd	$195, %ymm3, %ymm2, %ymm8
	vpblendd	$195, %ymm1, %ymm3, %ymm9
	vpblendd	$240, %ymm8, %ymm7, %ymm1
	vpblendd	$240, %ymm7, %ymm8, %ymm3
	vpblendd	$195, %ymm2, %ymm4, %ymm4
	vpblendd	$240, %ymm9, %ymm4, %ymm2
	vpblendd	$240, %ymm4, %ymm9, %ymm4
	call	L_keccakf1600_avx2$1
L_shake128_next_state$2:
	movq	$336, %r11
	movq	%xmm6, (%r10,%r11)
	vmovdqu	%ymm5, 8(%r10,%r11)
	vmovdqu	%xmm0, %xmm5
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, %rbx
	movq	%rbx, 40(%r10,%r11)
	vpunpckhqdq	%xmm0, %xmm0, %xmm0
	vpblendd	$240, %ymm3, %ymm1, %ymm6
	vpblendd	$240, %ymm1, %ymm3, %ymm1
	vpblendd	$240, %ymm4, %ymm2, %ymm3
	vpblendd	$240, %ymm2, %ymm4, %ymm2
	vpblendd	$195, %ymm2, %ymm6, %ymm4
	vmovdqu	%ymm4, 48(%r10,%r11)
	movq	%xmm5, %rbx
	movq	%rbx, 80(%r10,%r11)
	vpunpckhqdq	%xmm5, %xmm5, %xmm4
	vpblendd	$195, %ymm1, %ymm2, %ymm2
	vmovdqu	%ymm2, 88(%r10,%r11)
	movq	%xmm0, %rbx
	movq	%rbx, 120(%r10,%r11)
	vpblendd	$195, %ymm6, %ymm3, %ymm0
	vmovdqu	%ymm0, 128(%r10,%r11)
	movq	%xmm4, %rbx
	movq	%rbx, 160(%r10,%r11)
	vpblendd	$195, %ymm3, %ymm1, %ymm0
	vmovdqu	%ymm0, 168(%r10,%r11)
	ret
L_shake128x4_absorb_A32_A2$1:
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %r9
	jmp 	L_shake128x4_absorb_A32_A2$4
L_shake128x4_absorb_A32_A2$5:
	vmovdqu	%ymm0, (%rdx,%r9)
	addq	$32, %r9
L_shake128x4_absorb_A32_A2$4:
	cmpq	$800, %r9
	jb  	L_shake128x4_absorb_A32_A2$5
	movq	$0, %r9
	movq	$0, %r10
	jmp 	L_shake128x4_absorb_A32_A2$2
L_shake128x4_absorb_A32_A2$3:
	vpbroadcastq	(%rsi,%r9), %ymm0
	addq	$8, %r9
	vpxor	(%rdx,%r10), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rdx,%r10)
	addq	$32, %r10
L_shake128x4_absorb_A32_A2$2:
	cmpq	$128, %r10
	jb  	L_shake128x4_absorb_A32_A2$3
	movq	$0, %rbp
	movq	%r11, %r13
	leaq	2(%r11), %r9
	leaq	4(%r11), %r10
	leaq	6(%r11), %r11
	movq	$16, %rbx
	movq	$0, %r12
	movzwq	(%r13,%rbp), %r13
	movq	$31, %r14
	shlq	$16, %r14
	orq 	%r14, %r13
	shlq	$0, %r13
	orq 	%r13, %r12
	movq	$0, %r13
	movzwq	(%r9,%rbp), %r9
	movq	$31, %r14
	shlq	$16, %r14
	orq 	%r14, %r9
	shlq	$0, %r9
	orq 	%r9, %r13
	movq	$0, %r9
	movzwq	(%r10,%rbp), %r10
	movq	$31, %r14
	shlq	$16, %r14
	orq 	%r14, %r10
	shlq	$0, %r10
	orq 	%r10, %r9
	movq	$0, %r10
	movzwq	(%r11,%rbp), %r11
	movq	$31, %rbp
	shlq	$16, %rbp
	orq 	%rbp, %r11
	shlq	$0, %r11
	orq 	%r11, %r10
	xorq	(%rdx,%rbx,8), %r12
	movq	%r12, (%rdx,%rbx,8)
	xorq	8(%rdx,%rbx,8), %r13
	movq	%r13, 8(%rdx,%rbx,8)
	xorq	16(%rdx,%rbx,8), %r9
	movq	%r9, 16(%rdx,%rbx,8)
	xorq	24(%rdx,%rbx,8), %r10
	movq	%r10, 24(%rdx,%rbx,8)
	movq	$1, %r9
	shlq	$63, %r9
	movq	%r9, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpxor	640(%rdx), %ymm0, %ymm0
	vmovdqu	%ymm0, 640(%rdx)
	ret
L_shake256x4_A128__A32_A1$1:
	leaq	32(%rsp), %rdx
	vpxor	%ymm0, %ymm0, %ymm0
	movq	$0, %r10
	jmp 	L_shake256x4_A128__A32_A1$9
L_shake256x4_A128__A32_A1$10:
	vmovdqu	%ymm0, (%rdx,%r10)
	addq	$32, %r10
L_shake256x4_A128__A32_A1$9:
	cmpq	$800, %r10
	jb  	L_shake256x4_A128__A32_A1$10
	movq	$0, %r10
	movq	$0, %r11
	jmp 	L_shake256x4_A128__A32_A1$7
L_shake256x4_A128__A32_A1$8:
	vpbroadcastq	(%r9,%r10), %ymm0
	addq	$8, %r10
	vpxor	(%rdx,%r11), %ymm0, %ymm0
	vmovdqu	%ymm0, (%rdx,%r11)
	addq	$32, %r11
L_shake256x4_A128__A32_A1$7:
	cmpq	$128, %r11
	jb  	L_shake256x4_A128__A32_A1$8
	movq	$0, %r12
	movq	%rbx, %r9
	leaq	1(%rbx), %r10
	leaq	2(%rbx), %r11
	leaq	3(%rbx), %rbx
	movq	$16, %rbp
	movq	$0, %r13
	movq	$0, %r14
	movzbq	(%r9,%r12), %r9
	orq 	$7936, %r9
	shlq	$0, %r9
	orq 	%r9, %r14
	shlq	$0, %r14
	orq 	%r14, %r13
	movq	$0, %r9
	movq	$0, %r14
	movzbq	(%r10,%r12), %r10
	orq 	$7936, %r10
	shlq	$0, %r10
	orq 	%r10, %r14
	shlq	$0, %r14
	orq 	%r14, %r9
	movq	$0, %r10
	movq	$0, %r14
	movzbq	(%r11,%r12), %r11
	orq 	$7936, %r11
	shlq	$0, %r11
	orq 	%r11, %r14
	shlq	$0, %r14
	orq 	%r14, %r10
	movq	$0, %r11
	movq	$0, %r14
	movzbq	(%rbx,%r12), %rbx
	orq 	$7936, %rbx
	shlq	$0, %rbx
	orq 	%rbx, %r14
	shlq	$0, %r14
	orq 	%r14, %r11
	xorq	(%rdx,%rbp,8), %r13
	movq	%r13, (%rdx,%rbp,8)
	xorq	8(%rdx,%rbp,8), %r9
	movq	%r9, 8(%rdx,%rbp,8)
	xorq	16(%rdx,%rbp,8), %r10
	movq	%r10, 16(%rdx,%rbp,8)
	xorq	24(%rdx,%rbp,8), %r11
	movq	%r11, 24(%rdx,%rbp,8)
	movq	$1, %r9
	shlq	$63, %r9
	movq	%r9, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpxor	512(%rdx), %ymm0, %ymm0
	vmovdqu	%ymm0, 512(%rdx)
	movq	$0, %rbx
	leaq	-824(%rsp), %rsp
	call	L_keccakf1600_avx2x4$1
L_shake256x4_A128__A32_A1$6:
	leaq	824(%rsp), %rsp
	movq	$0, %r9
	jmp 	L_shake256x4_A128__A32_A1$4
L_shake256x4_A128__A32_A1$5:
	vmovdqu	(%rdx,%r9,4), %ymm0
	vmovdqu	32(%rdx,%r9,4), %ymm1
	vmovdqu	64(%rdx,%r9,4), %ymm2
	vmovdqu	96(%rdx,%r9,4), %ymm3
	addq	$32, %r9
	vperm2i128	$32, %ymm2, %ymm0, %ymm4
	vperm2i128	$32, %ymm3, %ymm1, %ymm5
	vperm2i128	$49, %ymm2, %ymm0, %ymm0
	vperm2i128	$49, %ymm3, %ymm1, %ymm1
	vpunpcklqdq	%ymm5, %ymm4, %ymm2
	vpunpckhqdq	%ymm5, %ymm4, %ymm3
	vpunpcklqdq	%ymm1, %ymm0, %ymm4
	vpunpckhqdq	%ymm1, %ymm0, %ymm0
	vmovdqu	%ymm2, (%rax,%rbx)
	vmovdqu	%ymm3, (%rcx,%rbx)
	vmovdqu	%ymm4, (%rsi,%rbx)
	vmovdqu	%ymm0, (%rdi,%rbx)
	addq	$32, %rbx
L_shake256x4_A128__A32_A1$4:
	cmpq	$128, %r9
	jl  	L_shake256x4_A128__A32_A1$5
	jmp 	L_shake256x4_A128__A32_A1$2
L_shake256x4_A128__A32_A1$3:
	movq	(%rdx,%r9,4), %r10
	movq	%r10, (%rax,%rbx)
	movq	8(%rdx,%r9,4), %r10
	movq	%r10, (%rcx,%rbx)
	movq	16(%rdx,%r9,4), %r10
	movq	%r10, (%rsi,%rbx)
	movq	24(%rdx,%r9,4), %r10
	movq	%r10, (%rdi,%rbx)
	addq	$8, %r9
	addq	$8, %rbx
L_shake256x4_A128__A32_A1$2:
	cmpq	$128, %r9
	jl  	L_shake256x4_A128__A32_A1$3
	ret
L_shake256_A128__A32_A1$1:
	leaq	32(%rsp), %rdx
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rdx)
	vmovdqu	%ymm0, 32(%rdx)
	vmovdqu	%ymm0, 64(%rdx)
	vmovdqu	%ymm0, 96(%rdx)
	vmovdqu	%ymm0, 128(%rdx)
	vmovdqu	%ymm0, 160(%rdx)
	movq	$0, %rsi
	movq	%rsi, 192(%rdx)
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm4, %ymm4, %ymm4
	movq	$0, %rsi
	movq	$0, %rdi
	jmp 	L_shake256_A128__A32_A1$5
L_shake256_A128__A32_A1$6:
	vmovdqu	(%r8,%rsi), %ymm6
	addq	$32, %rsi
	vmovdqu	%ymm6, (%rdx,%rdi,8)
	addq	$4, %rdi
L_shake256_A128__A32_A1$5:
	cmpq	$4, %rdi
	jb  	L_shake256_A128__A32_A1$6
	movq	$0, %rsi
	movq	$0, %rdi
	movq	$0, %r8
	movzbq	(%rcx,%rsi), %rcx
	orq 	$7936, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %r8
	shlq	$0, %r8
	orq 	%r8, %rdi
	movq	%rdi, 32(%rdx)
	movq	$5, %rcx
	jmp 	L_shake256_A128__A32_A1$3
L_shake256_A128__A32_A1$4:
	movq	$0, (%rdx,%rcx,8)
	incq	%rcx
L_shake256_A128__A32_A1$3:
	cmpq	$5, %rcx
	jb  	L_shake256_A128__A32_A1$4
	vpbroadcastq	(%rdx), %ymm6
	vpxor	%ymm6, %ymm1, %ymm6
	vmovdqu	8(%rdx), %ymm1
	vpxor	%ymm1, %ymm5, %ymm5
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm1
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm1, %ymm8, %ymm1
	vpxor	%ymm1, %ymm7, %ymm1
	movq	$0, %rcx
	call	L_keccakf1600_avx2$1
L_shake256_A128__A32_A1$2:
	movq	%xmm6, (%rax,%rcx)
	vmovdqu	%ymm5, 8(%rax,%rcx)
	vmovdqu	%xmm0, %xmm5
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, %rdx
	movq	%rdx, 40(%rax,%rcx)
	vpunpckhqdq	%xmm0, %xmm0, %xmm0
	vpblendd	$240, %ymm3, %ymm1, %ymm6
	vpblendd	$240, %ymm1, %ymm3, %ymm1
	vpblendd	$240, %ymm2, %ymm4, %ymm2
	vpblendd	$195, %ymm2, %ymm6, %ymm3
	vmovdqu	%ymm3, 48(%rax,%rcx)
	movq	%xmm5, %rdx
	movq	%rdx, 80(%rax,%rcx)
	vpblendd	$195, %ymm1, %ymm2, %ymm1
	vmovdqu	%ymm1, 88(%rax,%rcx)
	movq	%xmm0, %rdx
	movq	%rdx, 120(%rax,%rcx)
	ret
L_sha3_512A_A64$1:
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	movq	$0, %rdx
	movq	(%rcx,%rdx), %rsi
	movq	%rsi, %xmm6
	vpbroadcastq	%xmm6, %ymm6
	vpxor	%ymm6, %ymm5, %ymm6
	vmovdqu	8(%rcx,%rdx), %ymm5
	vpxor	%ymm5, %ymm7, %ymm5
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
	vpxor	%ymm10, %ymm0, %ymm0
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm7, %ymm11
	vpblendd	$195, %ymm8, %ymm10, %ymm12
	vpblendd	$195, %ymm7, %ymm8, %ymm8
	vpblendd	$240, %ymm12, %ymm11, %ymm7
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm9
	vpblendd	$240, %ymm8, %ymm9, %ymm10
	vpblendd	$240, %ymm9, %ymm8, %ymm8
	vpxor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm11, %ymm2, %ymm7
	vpxor	%ymm10, %ymm3, %ymm2
	vpxor	%ymm8, %ymm4, %ymm4
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm3
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$1, %xmm3, %ymm8, %ymm3
	vpxor	%ymm3, %ymm7, %ymm3
	movq	$0, %rcx
	call	L_keccakf1600_avx2$1
L_sha3_512A_A64$2:
	movq	%xmm6, (%rax,%rcx)
	vmovdqu	%ymm5, 8(%rax,%rcx)
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, %rdx
	movq	%rdx, 40(%rax,%rcx)
	vpblendd	$240, %ymm3, %ymm1, %ymm0
	vpblendd	$240, %ymm2, %ymm4, %ymm1
	vpblendd	$195, %ymm1, %ymm0, %ymm0
	vmovdqu	%xmm0, 48(%rax,%rcx)
	ret
L_sha3_512A_A33$1:
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm4, %ymm4, %ymm4
	movq	$0, %rdx
	movq	(%rcx,%rdx), %rsi
	movq	%rsi, %xmm6
	vpbroadcastq	%xmm6, %ymm6
	vpxor	%ymm6, %ymm5, %ymm6
	vmovdqu	8(%rcx,%rdx), %xmm5
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
	vinserti128	$1, %xmm8, %ymm5, %ymm5
	vpxor	%ymm5, %ymm7, %ymm5
	movq	$1, %rcx
	shlq	$63, %rcx
	movq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$1, %xmm7, %ymm8, %ymm7
	vpxor	%ymm7, %ymm3, %ymm3
	movq	$0, %rcx
	call	L_keccakf1600_avx2$1
L_sha3_512A_A33$2:
	movq	%xmm6, (%rax,%rcx)
	vmovdqu	%ymm5, 8(%rax,%rcx)
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, %rdx
	movq	%rdx, 40(%rax,%rcx)
	vpblendd	$240, %ymm3, %ymm1, %ymm0
	vpblendd	$240, %ymm2, %ymm4, %ymm1
	vpblendd	$195, %ymm1, %ymm0, %ymm0
	vmovdqu	%xmm0, 48(%rax,%rcx)
	ret
L_keccakf1600_avx2x4$1:
	leaq	glob_data + 4984(%rip), %r9
	leaq	32(%rsp), %r10
	vmovdqu	glob_data + 448(%rip), %ymm0
	vmovdqu	glob_data + 480(%rip), %ymm1
	movq	$0, %r11
	jmp 	L_keccakf1600_avx2x4$2
L_keccakf1600_avx2x4$3:
	vpbroadcastq	(%r9,%r11,8), %ymm2
	call	L_keccakf1600_4x_round$1
L_keccakf1600_avx2x4$5:
	xchg	%rdx, %r10
	vpbroadcastq	8(%r9,%r11,8), %ymm2
	call	L_keccakf1600_4x_round$1
L_keccakf1600_avx2x4$4:
	xchg	%r10, %rdx
	addq	$2, %r11
L_keccakf1600_avx2x4$2:
	cmpq	$24, %r11
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
	leaq	glob_data + 4984(%rip), %r11
	movq	$0, %rbx
L_keccakf1600_avx2$2:
	vpshufd	$78, %ymm0, %ymm8
	vpxor	%ymm1, %ymm2, %ymm7
	vpxor	%ymm4, %ymm3, %ymm9
	vpxor	%ymm5, %ymm7, %ymm7
	vpxor	%ymm9, %ymm7, %ymm10
	vpermq	$147, %ymm10, %ymm7
	vpxor	%ymm0, %ymm8, %ymm8
	vpermq	$78, %ymm8, %ymm9
	vpsrlq	$63, %ymm10, %ymm11
	vpaddq	%ymm10, %ymm10, %ymm10
	vpor	%ymm10, %ymm11, %ymm11
	vpermq	$57, %ymm11, %ymm10
	vpxor	%ymm7, %ymm11, %ymm11
	vpermq	$0, %ymm11, %ymm11
	vpxor	%ymm6, %ymm8, %ymm8
	vpxor	%ymm9, %ymm8, %ymm8
	vpsrlq	$63, %ymm8, %ymm9
	vpaddq	%ymm8, %ymm8, %ymm12
	vpor	%ymm9, %ymm12, %ymm9
	vpxor	%ymm11, %ymm0, %ymm0
	vpxor	%ymm11, %ymm6, %ymm6
	vpblendd	$192, %ymm9, %ymm10, %ymm9
	vpblendd	$3, %ymm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm9, %ymm9
	vpsllvq	glob_data + 704(%rip), %ymm0, %ymm7
	vpsrlvq	glob_data + 512(%rip), %ymm0, %ymm0
	vpor	%ymm7, %ymm0, %ymm0
	vpxor	%ymm9, %ymm1, %ymm1
	vpsllvq	glob_data + 768(%rip), %ymm1, %ymm7
	vpsrlvq	glob_data + 576(%rip), %ymm1, %ymm1
	vpor	%ymm7, %ymm1, %ymm1
	vpxor	%ymm9, %ymm3, %ymm3
	vpsllvq	glob_data + 800(%rip), %ymm3, %ymm7
	vpsrlvq	glob_data + 608(%rip), %ymm3, %ymm3
	vpor	%ymm7, %ymm3, %ymm10
	vpxor	%ymm9, %ymm2, %ymm2
	vpsllvq	glob_data + 832(%rip), %ymm2, %ymm3
	vpsrlvq	glob_data + 640(%rip), %ymm2, %ymm2
	vpor	%ymm3, %ymm2, %ymm2
	vpxor	%ymm9, %ymm4, %ymm4
	vpermq	$141, %ymm0, %ymm3
	vpermq	$141, %ymm1, %ymm7
	vpsllvq	glob_data + 864(%rip), %ymm4, %ymm0
	vpsrlvq	glob_data + 672(%rip), %ymm4, %ymm1
	vpor	%ymm0, %ymm1, %ymm8
	vpxor	%ymm9, %ymm5, %ymm0
	vpermq	$27, %ymm10, %ymm5
	vpermq	$114, %ymm2, %ymm9
	vpsllvq	glob_data + 736(%rip), %ymm0, %ymm1
	vpsrlvq	glob_data + 544(%rip), %ymm0, %ymm0
	vpor	%ymm1, %ymm0, %ymm10
	vpsrldq	$8, %ymm8, %ymm0
	vpandn	%ymm0, %ymm8, %ymm1
	vpblendd	$12, %ymm9, %ymm10, %ymm0
	vpblendd	$12, %ymm10, %ymm7, %ymm2
	vpblendd	$12, %ymm7, %ymm3, %ymm4
	vpblendd	$12, %ymm3, %ymm10, %ymm11
	vpblendd	$48, %ymm7, %ymm0, %ymm0
	vpblendd	$48, %ymm5, %ymm2, %ymm2
	vpblendd	$48, %ymm10, %ymm4, %ymm4
	vpblendd	$48, %ymm9, %ymm11, %ymm11
	vpblendd	$192, %ymm5, %ymm0, %ymm0
	vpblendd	$192, %ymm9, %ymm2, %ymm2
	vpblendd	$192, %ymm9, %ymm4, %ymm4
	vpblendd	$192, %ymm7, %ymm11, %ymm11
	vpandn	%ymm2, %ymm0, %ymm0
	vpandn	%ymm11, %ymm4, %ymm4
	vpblendd	$12, %ymm10, %ymm5, %ymm11
	vpblendd	$12, %ymm5, %ymm3, %ymm12
	vpxor	%ymm3, %ymm0, %ymm2
	vpblendd	$48, %ymm3, %ymm11, %ymm0
	vpblendd	$48, %ymm7, %ymm12, %ymm11
	vpxor	%ymm5, %ymm4, %ymm4
	vpblendd	$192, %ymm7, %ymm0, %ymm0
	vpblendd	$192, %ymm10, %ymm11, %ymm11
	vpandn	%ymm11, %ymm0, %ymm0
	vpxor	%ymm9, %ymm0, %ymm12
	vpermq	$30, %ymm8, %ymm0
	vpblendd	$48, %ymm6, %ymm0, %ymm0
	vpermq	$57, %ymm8, %ymm11
	vpblendd	$192, %ymm6, %ymm11, %ymm11
	vpandn	%ymm0, %ymm11, %ymm11
	vpblendd	$12, %ymm5, %ymm7, %ymm0
	vpblendd	$12, %ymm7, %ymm9, %ymm13
	vpblendd	$48, %ymm9, %ymm0, %ymm0
	vpblendd	$48, %ymm3, %ymm13, %ymm13
	vpblendd	$192, %ymm3, %ymm0, %ymm0
	vpblendd	$192, %ymm5, %ymm13, %ymm13
	vpandn	%ymm13, %ymm0, %ymm0
	vpxor	%ymm10, %ymm0, %ymm0
	vpermq	$0, %ymm1, %ymm13
	vpermq	$27, %ymm2, %ymm1
	vpermq	$141, %ymm4, %ymm2
	vpermq	$114, %ymm12, %ymm4
	vpblendd	$12, %ymm3, %ymm9, %ymm12
	vpblendd	$12, %ymm9, %ymm5, %ymm9
	vpblendd	$48, %ymm5, %ymm12, %ymm5
	vpblendd	$48, %ymm10, %ymm9, %ymm9
	vpblendd	$192, %ymm10, %ymm5, %ymm5
	vpblendd	$192, %ymm3, %ymm9, %ymm3
	vpandn	%ymm3, %ymm5, %ymm3
	vpxor	%ymm13, %ymm6, %ymm6
	vpxor	%ymm8, %ymm11, %ymm5
	vpxor	%ymm7, %ymm3, %ymm3
	vpbroadcastq	(%r11,%rbx,8), %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	incq	%rbx
	cmpq	$24, %rbx
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
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
G$pvc_srlvqidx:
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	30
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
	.byte	30
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
G$pvd_shift_s:
	.byte	32
	.byte	0
	.byte	4
	.byte	0
	.byte	1
	.byte	0
	.byte	32
	.byte	0
	.byte	8
	.byte	0
	.byte	1
	.byte	0
	.byte	32
	.byte	0
	.byte	4
	.byte	0
	.byte	32
	.byte	0
	.byte	4
	.byte	0
	.byte	1
	.byte	0
	.byte	32
	.byte	0
	.byte	8
	.byte	0
	.byte	1
	.byte	0
	.byte	32
	.byte	0
	.byte	4
	.byte	0
G$pvd_srlvqidx_s:
	.byte	0
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
	.byte	0
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
G$pvd_srlvdidx_s:
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
	.byte	0
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
	.byte	0
	.byte	0
	.byte	0
	.byte	0
G$pvd_shufbidx_s:
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	9
	.byte	10
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
	.byte	11
	.byte	12
	.byte	12
	.byte	13
G$pd_shift_s:
	.byte	0
	.byte	4
	.byte	32
	.byte	0
	.byte	0
	.byte	1
	.byte	8
	.byte	0
	.byte	64
	.byte	0
	.byte	0
	.byte	2
	.byte	16
	.byte	0
	.byte	-128
	.byte	0
	.byte	0
	.byte	4
	.byte	32
	.byte	0
	.byte	0
	.byte	1
	.byte	8
	.byte	0
	.byte	64
	.byte	0
	.byte	0
	.byte	2
	.byte	16
	.byte	0
	.byte	-128
	.byte	0
G$pd_mask_s:
	.byte	31
	.byte	0
	.byte	-32
	.byte	3
	.byte	124
	.byte	0
	.byte	-128
	.byte	15
	.byte	-16
	.byte	1
	.byte	62
	.byte	0
	.byte	-64
	.byte	7
	.byte	-8
	.byte	0
	.byte	31
	.byte	0
	.byte	-32
	.byte	3
	.byte	124
	.byte	0
	.byte	-128
	.byte	15
	.byte	-16
	.byte	1
	.byte	62
	.byte	0
	.byte	-64
	.byte	7
	.byte	-8
	.byte	0
G$pd_jshufbidx:
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	9
	.byte	9
	.byte	9
G$pc_shufbidx_s:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	-1
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	-1
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	8
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
	.byte	3
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	1
	.byte	3
	.byte	1
	.byte	0
	.byte	2
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	0
	.byte	3
	.byte	1
	.byte	3
	.byte	2
	.byte	3
	.byte	3
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	3
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	1
	.byte	3
	.byte	2
	.byte	0
	.byte	2
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	0
	.byte	3
	.byte	1
	.byte	3
	.byte	2
	.byte	3
	.byte	3
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
	.byte	10
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
	.byte	8
	.byte	1
	.byte	0
	.byte	0
	.byte	8
G$pc_sllvdidx_s:
	.byte	12
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
G$pc_shift3_s:
	.byte	1
	.byte	0
	.byte	0
	.byte	4
G$pvc_mask_s:
	.byte	-1
	.byte	7
G$pvc_shift1_s:
	.byte	0
	.byte	32
G$pvc_off_s:
	.byte	36
	.byte	0
G$pvd_mask_s:
	.byte	-16
	.byte	127
G$pc_shift2_s:
	.byte	1
	.byte	32
G$pc_shift1_s:
	.byte	0
	.byte	4
G$pc_mask_s:
	.byte	31
	.byte	0
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
