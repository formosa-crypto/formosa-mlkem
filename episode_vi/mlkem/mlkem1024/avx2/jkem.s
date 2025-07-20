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
	leaq	-31304(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 31248(%rsp)
	movq	%rbp, 31256(%rsp)
	movq	%r12, 31264(%rsp)
	movq	%r13, 31272(%rsp)
	movq	%r14, 31280(%rsp)
	movq	%r15, 31288(%rsp)
	movq	%rax, 31296(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm1
	movq	(%rsi), %rax
	movq	%rax, 3744(%rsp)
	movq	8(%rsi), %rax
	movq	%rax, 3752(%rsp)
	movq	16(%rsi), %rax
	movq	%rax, 3760(%rsp)
	movq	24(%rsi), %rax
	movq	%rax, 3768(%rsp)
	movq	32(%rsi), %rax
	movq	%rax, 3776(%rsp)
	movq	40(%rsi), %rax
	movq	%rax, 3784(%rsp)
	movq	48(%rsi), %rax
	movq	%rax, 3792(%rsp)
	movq	56(%rsi), %rax
	movq	%rax, 3800(%rsp)
	movq	64(%rsi), %rax
	movq	%rax, 3808(%rsp)
	movq	72(%rsi), %rax
	movq	%rax, 3816(%rsp)
	movq	80(%rsi), %rax
	movq	%rax, 3824(%rsp)
	movq	88(%rsi), %rax
	movq	%rax, 3832(%rsp)
	movq	96(%rsi), %rax
	movq	%rax, 3840(%rsp)
	movq	104(%rsi), %rax
	movq	%rax, 3848(%rsp)
	movq	112(%rsi), %rax
	movq	%rax, 3856(%rsp)
	movq	120(%rsi), %rax
	movq	%rax, 3864(%rsp)
	movq	128(%rsi), %rax
	movq	%rax, 3872(%rsp)
	movq	136(%rsi), %rax
	movq	%rax, 3880(%rsp)
	movq	144(%rsi), %rax
	movq	%rax, 3888(%rsp)
	movq	152(%rsi), %rax
	movq	%rax, 3896(%rsp)
	movq	160(%rsi), %rax
	movq	%rax, 3904(%rsp)
	movq	168(%rsi), %rax
	movq	%rax, 3912(%rsp)
	movq	176(%rsi), %rax
	movq	%rax, 3920(%rsp)
	movq	184(%rsi), %rax
	movq	%rax, 3928(%rsp)
	movq	192(%rsi), %rax
	movq	%rax, 3936(%rsp)
	movq	200(%rsi), %rax
	movq	%rax, 3944(%rsp)
	movq	208(%rsi), %rax
	movq	%rax, 3952(%rsp)
	movq	216(%rsi), %rax
	movq	%rax, 3960(%rsp)
	movq	224(%rsi), %rax
	movq	%rax, 3968(%rsp)
	movq	232(%rsi), %rax
	movq	%rax, 3976(%rsp)
	movq	240(%rsi), %rax
	movq	%rax, 3984(%rsp)
	movq	248(%rsi), %rax
	movq	%rax, 3992(%rsp)
	movq	256(%rsi), %rax
	movq	%rax, 4000(%rsp)
	movq	264(%rsi), %rax
	movq	%rax, 4008(%rsp)
	movq	272(%rsi), %rax
	movq	%rax, 4016(%rsp)
	movq	280(%rsi), %rax
	movq	%rax, 4024(%rsp)
	movq	288(%rsi), %rax
	movq	%rax, 4032(%rsp)
	movq	296(%rsi), %rax
	movq	%rax, 4040(%rsp)
	movq	304(%rsi), %rax
	movq	%rax, 4048(%rsp)
	movq	312(%rsi), %rax
	movq	%rax, 4056(%rsp)
	movq	320(%rsi), %rax
	movq	%rax, 4064(%rsp)
	movq	328(%rsi), %rax
	movq	%rax, 4072(%rsp)
	movq	336(%rsi), %rax
	movq	%rax, 4080(%rsp)
	movq	344(%rsi), %rax
	movq	%rax, 4088(%rsp)
	movq	352(%rsi), %rax
	movq	%rax, 4096(%rsp)
	movq	360(%rsi), %rax
	movq	%rax, 4104(%rsp)
	movq	368(%rsi), %rax
	movq	%rax, 4112(%rsp)
	movq	376(%rsi), %rax
	movq	%rax, 4120(%rsp)
	movq	384(%rsi), %rax
	movq	%rax, 4128(%rsp)
	movq	392(%rsi), %rax
	movq	%rax, 4136(%rsp)
	movq	400(%rsi), %rax
	movq	%rax, 4144(%rsp)
	movq	408(%rsi), %rax
	movq	%rax, 4152(%rsp)
	movq	416(%rsi), %rax
	movq	%rax, 4160(%rsp)
	movq	424(%rsi), %rax
	movq	%rax, 4168(%rsp)
	movq	432(%rsi), %rax
	movq	%rax, 4176(%rsp)
	movq	440(%rsi), %rax
	movq	%rax, 4184(%rsp)
	movq	448(%rsi), %rax
	movq	%rax, 4192(%rsp)
	movq	456(%rsi), %rax
	movq	%rax, 4200(%rsp)
	movq	464(%rsi), %rax
	movq	%rax, 4208(%rsp)
	movq	472(%rsi), %rax
	movq	%rax, 4216(%rsp)
	movq	480(%rsi), %rax
	movq	%rax, 4224(%rsp)
	movq	488(%rsi), %rax
	movq	%rax, 4232(%rsp)
	movq	496(%rsi), %rax
	movq	%rax, 4240(%rsp)
	movq	504(%rsi), %rax
	movq	%rax, 4248(%rsp)
	movq	512(%rsi), %rax
	movq	%rax, 4256(%rsp)
	movq	520(%rsi), %rax
	movq	%rax, 4264(%rsp)
	movq	528(%rsi), %rax
	movq	%rax, 4272(%rsp)
	movq	536(%rsi), %rax
	movq	%rax, 4280(%rsp)
	movq	544(%rsi), %rax
	movq	%rax, 4288(%rsp)
	movq	552(%rsi), %rax
	movq	%rax, 4296(%rsp)
	movq	560(%rsi), %rax
	movq	%rax, 4304(%rsp)
	movq	568(%rsi), %rax
	movq	%rax, 4312(%rsp)
	movq	576(%rsi), %rax
	movq	%rax, 4320(%rsp)
	movq	584(%rsi), %rax
	movq	%rax, 4328(%rsp)
	movq	592(%rsi), %rax
	movq	%rax, 4336(%rsp)
	movq	600(%rsi), %rax
	movq	%rax, 4344(%rsp)
	movq	608(%rsi), %rax
	movq	%rax, 4352(%rsp)
	movq	616(%rsi), %rax
	movq	%rax, 4360(%rsp)
	movq	624(%rsi), %rax
	movq	%rax, 4368(%rsp)
	movq	632(%rsi), %rax
	movq	%rax, 4376(%rsp)
	movq	640(%rsi), %rax
	movq	%rax, 4384(%rsp)
	movq	648(%rsi), %rax
	movq	%rax, 4392(%rsp)
	movq	656(%rsi), %rax
	movq	%rax, 4400(%rsp)
	movq	664(%rsi), %rax
	movq	%rax, 4408(%rsp)
	movq	672(%rsi), %rax
	movq	%rax, 4416(%rsp)
	movq	680(%rsi), %rax
	movq	%rax, 4424(%rsp)
	movq	688(%rsi), %rax
	movq	%rax, 4432(%rsp)
	movq	696(%rsi), %rax
	movq	%rax, 4440(%rsp)
	movq	704(%rsi), %rax
	movq	%rax, 4448(%rsp)
	movq	712(%rsi), %rax
	movq	%rax, 4456(%rsp)
	movq	720(%rsi), %rax
	movq	%rax, 4464(%rsp)
	movq	728(%rsi), %rax
	movq	%rax, 4472(%rsp)
	movq	736(%rsi), %rax
	movq	%rax, 4480(%rsp)
	movq	744(%rsi), %rax
	movq	%rax, 4488(%rsp)
	movq	752(%rsi), %rax
	movq	%rax, 4496(%rsp)
	movq	760(%rsi), %rax
	movq	%rax, 4504(%rsp)
	movq	768(%rsi), %rax
	movq	%rax, 4512(%rsp)
	movq	776(%rsi), %rax
	movq	%rax, 4520(%rsp)
	movq	784(%rsi), %rax
	movq	%rax, 4528(%rsp)
	movq	792(%rsi), %rax
	movq	%rax, 4536(%rsp)
	movq	800(%rsi), %rax
	movq	%rax, 4544(%rsp)
	movq	808(%rsi), %rax
	movq	%rax, 4552(%rsp)
	movq	816(%rsi), %rax
	movq	%rax, 4560(%rsp)
	movq	824(%rsi), %rax
	movq	%rax, 4568(%rsp)
	movq	832(%rsi), %rax
	movq	%rax, 4576(%rsp)
	movq	840(%rsi), %rax
	movq	%rax, 4584(%rsp)
	movq	848(%rsi), %rax
	movq	%rax, 4592(%rsp)
	movq	856(%rsi), %rax
	movq	%rax, 4600(%rsp)
	movq	864(%rsi), %rax
	movq	%rax, 4608(%rsp)
	movq	872(%rsi), %rax
	movq	%rax, 4616(%rsp)
	movq	880(%rsi), %rax
	movq	%rax, 4624(%rsp)
	movq	888(%rsi), %rax
	movq	%rax, 4632(%rsp)
	movq	896(%rsi), %rax
	movq	%rax, 4640(%rsp)
	movq	904(%rsi), %rax
	movq	%rax, 4648(%rsp)
	movq	912(%rsi), %rax
	movq	%rax, 4656(%rsp)
	movq	920(%rsi), %rax
	movq	%rax, 4664(%rsp)
	movq	928(%rsi), %rax
	movq	%rax, 4672(%rsp)
	movq	936(%rsi), %rax
	movq	%rax, 4680(%rsp)
	movq	944(%rsi), %rax
	movq	%rax, 4688(%rsp)
	movq	952(%rsi), %rax
	movq	%rax, 4696(%rsp)
	movq	960(%rsi), %rax
	movq	%rax, 4704(%rsp)
	movq	968(%rsi), %rax
	movq	%rax, 4712(%rsp)
	movq	976(%rsi), %rax
	movq	%rax, 4720(%rsp)
	movq	984(%rsi), %rax
	movq	%rax, 4728(%rsp)
	movq	992(%rsi), %rax
	movq	%rax, 4736(%rsp)
	movq	1000(%rsi), %rax
	movq	%rax, 4744(%rsp)
	movq	1008(%rsi), %rax
	movq	%rax, 4752(%rsp)
	movq	1016(%rsi), %rax
	movq	%rax, 4760(%rsp)
	movq	1024(%rsi), %rax
	movq	%rax, 4768(%rsp)
	movq	1032(%rsi), %rax
	movq	%rax, 4776(%rsp)
	movq	1040(%rsi), %rax
	movq	%rax, 4784(%rsp)
	movq	1048(%rsi), %rax
	movq	%rax, 4792(%rsp)
	movq	1056(%rsi), %rax
	movq	%rax, 4800(%rsp)
	movq	1064(%rsi), %rax
	movq	%rax, 4808(%rsp)
	movq	1072(%rsi), %rax
	movq	%rax, 4816(%rsp)
	movq	1080(%rsi), %rax
	movq	%rax, 4824(%rsp)
	movq	1088(%rsi), %rax
	movq	%rax, 4832(%rsp)
	movq	1096(%rsi), %rax
	movq	%rax, 4840(%rsp)
	movq	1104(%rsi), %rax
	movq	%rax, 4848(%rsp)
	movq	1112(%rsi), %rax
	movq	%rax, 4856(%rsp)
	movq	1120(%rsi), %rax
	movq	%rax, 4864(%rsp)
	movq	1128(%rsi), %rax
	movq	%rax, 4872(%rsp)
	movq	1136(%rsi), %rax
	movq	%rax, 4880(%rsp)
	movq	1144(%rsi), %rax
	movq	%rax, 4888(%rsp)
	movq	1152(%rsi), %rax
	movq	%rax, 4896(%rsp)
	movq	1160(%rsi), %rax
	movq	%rax, 4904(%rsp)
	movq	1168(%rsi), %rax
	movq	%rax, 4912(%rsp)
	movq	1176(%rsi), %rax
	movq	%rax, 4920(%rsp)
	movq	1184(%rsi), %rax
	movq	%rax, 4928(%rsp)
	movq	1192(%rsi), %rax
	movq	%rax, 4936(%rsp)
	movq	1200(%rsi), %rax
	movq	%rax, 4944(%rsp)
	movq	1208(%rsi), %rax
	movq	%rax, 4952(%rsp)
	movq	1216(%rsi), %rax
	movq	%rax, 4960(%rsp)
	movq	1224(%rsi), %rax
	movq	%rax, 4968(%rsp)
	movq	1232(%rsi), %rax
	movq	%rax, 4976(%rsp)
	movq	1240(%rsi), %rax
	movq	%rax, 4984(%rsp)
	movq	1248(%rsi), %rax
	movq	%rax, 4992(%rsp)
	movq	1256(%rsi), %rax
	movq	%rax, 5000(%rsp)
	movq	1264(%rsi), %rax
	movq	%rax, 5008(%rsp)
	movq	1272(%rsi), %rax
	movq	%rax, 5016(%rsp)
	movq	1280(%rsi), %rax
	movq	%rax, 5024(%rsp)
	movq	1288(%rsi), %rax
	movq	%rax, 5032(%rsp)
	movq	1296(%rsi), %rax
	movq	%rax, 5040(%rsp)
	movq	1304(%rsi), %rax
	movq	%rax, 5048(%rsp)
	movq	1312(%rsi), %rax
	movq	%rax, 5056(%rsp)
	movq	1320(%rsi), %rax
	movq	%rax, 5064(%rsp)
	movq	1328(%rsi), %rax
	movq	%rax, 5072(%rsp)
	movq	1336(%rsi), %rax
	movq	%rax, 5080(%rsp)
	movq	1344(%rsi), %rax
	movq	%rax, 5088(%rsp)
	movq	1352(%rsi), %rax
	movq	%rax, 5096(%rsp)
	movq	1360(%rsi), %rax
	movq	%rax, 5104(%rsp)
	movq	1368(%rsi), %rax
	movq	%rax, 5112(%rsp)
	movq	1376(%rsi), %rax
	movq	%rax, 5120(%rsp)
	movq	1384(%rsi), %rax
	movq	%rax, 5128(%rsp)
	movq	1392(%rsi), %rax
	movq	%rax, 5136(%rsp)
	movq	1400(%rsi), %rax
	movq	%rax, 5144(%rsp)
	movq	1408(%rsi), %rax
	movq	%rax, 5152(%rsp)
	movq	1416(%rsi), %rax
	movq	%rax, 5160(%rsp)
	movq	1424(%rsi), %rax
	movq	%rax, 5168(%rsp)
	movq	1432(%rsi), %rax
	movq	%rax, 5176(%rsp)
	movq	1440(%rsi), %rax
	movq	%rax, 5184(%rsp)
	movq	1448(%rsi), %rax
	movq	%rax, 5192(%rsp)
	movq	1456(%rsi), %rax
	movq	%rax, 5200(%rsp)
	movq	1464(%rsi), %rax
	movq	%rax, 5208(%rsp)
	movq	1472(%rsi), %rax
	movq	%rax, 5216(%rsp)
	movq	1480(%rsi), %rax
	movq	%rax, 5224(%rsp)
	movq	1488(%rsi), %rax
	movq	%rax, 5232(%rsp)
	movq	1496(%rsi), %rax
	movq	%rax, 5240(%rsp)
	movq	1504(%rsi), %rax
	movq	%rax, 5248(%rsp)
	movq	1512(%rsi), %rax
	movq	%rax, 5256(%rsp)
	movq	1520(%rsi), %rax
	movq	%rax, 5264(%rsp)
	movq	1528(%rsi), %rax
	movq	%rax, 5272(%rsp)
	movq	1536(%rsi), %rax
	movq	%rax, 5280(%rsp)
	movq	1544(%rsi), %rax
	movq	%rax, 5288(%rsp)
	movq	1552(%rsi), %rax
	movq	%rax, 5296(%rsp)
	movq	1560(%rsi), %rax
	movq	%rax, 5304(%rsp)
	movq	(%rdx), %rax
	movq	%rax, 24912(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 24920(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 24928(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 24936(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 24944(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 24952(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 24960(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 24968(%rsp)
	movq	64(%rdx), %rax
	movq	%rax, 24976(%rsp)
	movq	72(%rdx), %rax
	movq	%rax, 24984(%rsp)
	movq	80(%rdx), %rax
	movq	%rax, 24992(%rsp)
	movq	88(%rdx), %rax
	movq	%rax, 25000(%rsp)
	movq	96(%rdx), %rax
	movq	%rax, 25008(%rsp)
	movq	104(%rdx), %rax
	movq	%rax, 25016(%rsp)
	movq	112(%rdx), %rax
	movq	%rax, 25024(%rsp)
	movq	120(%rdx), %rax
	movq	%rax, 25032(%rsp)
	movq	128(%rdx), %rax
	movq	%rax, 25040(%rsp)
	movq	136(%rdx), %rax
	movq	%rax, 25048(%rsp)
	movq	144(%rdx), %rax
	movq	%rax, 25056(%rsp)
	movq	152(%rdx), %rax
	movq	%rax, 25064(%rsp)
	movq	160(%rdx), %rax
	movq	%rax, 25072(%rsp)
	movq	168(%rdx), %rax
	movq	%rax, 25080(%rsp)
	movq	176(%rdx), %rax
	movq	%rax, 25088(%rsp)
	movq	184(%rdx), %rax
	movq	%rax, 25096(%rsp)
	movq	192(%rdx), %rax
	movq	%rax, 25104(%rsp)
	movq	200(%rdx), %rax
	movq	%rax, 25112(%rsp)
	movq	208(%rdx), %rax
	movq	%rax, 25120(%rsp)
	movq	216(%rdx), %rax
	movq	%rax, 25128(%rsp)
	movq	224(%rdx), %rax
	movq	%rax, 25136(%rsp)
	movq	232(%rdx), %rax
	movq	%rax, 25144(%rsp)
	movq	240(%rdx), %rax
	movq	%rax, 25152(%rsp)
	movq	248(%rdx), %rax
	movq	%rax, 25160(%rsp)
	movq	256(%rdx), %rax
	movq	%rax, 25168(%rsp)
	movq	264(%rdx), %rax
	movq	%rax, 25176(%rsp)
	movq	272(%rdx), %rax
	movq	%rax, 25184(%rsp)
	movq	280(%rdx), %rax
	movq	%rax, 25192(%rsp)
	movq	288(%rdx), %rax
	movq	%rax, 25200(%rsp)
	movq	296(%rdx), %rax
	movq	%rax, 25208(%rsp)
	movq	304(%rdx), %rax
	movq	%rax, 25216(%rsp)
	movq	312(%rdx), %rax
	movq	%rax, 25224(%rsp)
	movq	320(%rdx), %rax
	movq	%rax, 25232(%rsp)
	movq	328(%rdx), %rax
	movq	%rax, 25240(%rsp)
	movq	336(%rdx), %rax
	movq	%rax, 25248(%rsp)
	movq	344(%rdx), %rax
	movq	%rax, 25256(%rsp)
	movq	352(%rdx), %rax
	movq	%rax, 25264(%rsp)
	movq	360(%rdx), %rax
	movq	%rax, 25272(%rsp)
	movq	368(%rdx), %rax
	movq	%rax, 25280(%rsp)
	movq	376(%rdx), %rax
	movq	%rax, 25288(%rsp)
	movq	384(%rdx), %rax
	movq	%rax, 25296(%rsp)
	movq	392(%rdx), %rax
	movq	%rax, 25304(%rsp)
	movq	400(%rdx), %rax
	movq	%rax, 25312(%rsp)
	movq	408(%rdx), %rax
	movq	%rax, 25320(%rsp)
	movq	416(%rdx), %rax
	movq	%rax, 25328(%rsp)
	movq	424(%rdx), %rax
	movq	%rax, 25336(%rsp)
	movq	432(%rdx), %rax
	movq	%rax, 25344(%rsp)
	movq	440(%rdx), %rax
	movq	%rax, 25352(%rsp)
	movq	448(%rdx), %rax
	movq	%rax, 25360(%rsp)
	movq	456(%rdx), %rax
	movq	%rax, 25368(%rsp)
	movq	464(%rdx), %rax
	movq	%rax, 25376(%rsp)
	movq	472(%rdx), %rax
	movq	%rax, 25384(%rsp)
	movq	480(%rdx), %rax
	movq	%rax, 25392(%rsp)
	movq	488(%rdx), %rax
	movq	%rax, 25400(%rsp)
	movq	496(%rdx), %rax
	movq	%rax, 25408(%rsp)
	movq	504(%rdx), %rax
	movq	%rax, 25416(%rsp)
	movq	512(%rdx), %rax
	movq	%rax, 25424(%rsp)
	movq	520(%rdx), %rax
	movq	%rax, 25432(%rsp)
	movq	528(%rdx), %rax
	movq	%rax, 25440(%rsp)
	movq	536(%rdx), %rax
	movq	%rax, 25448(%rsp)
	movq	544(%rdx), %rax
	movq	%rax, 25456(%rsp)
	movq	552(%rdx), %rax
	movq	%rax, 25464(%rsp)
	movq	560(%rdx), %rax
	movq	%rax, 25472(%rsp)
	movq	568(%rdx), %rax
	movq	%rax, 25480(%rsp)
	movq	576(%rdx), %rax
	movq	%rax, 25488(%rsp)
	movq	584(%rdx), %rax
	movq	%rax, 25496(%rsp)
	movq	592(%rdx), %rax
	movq	%rax, 25504(%rsp)
	movq	600(%rdx), %rax
	movq	%rax, 25512(%rsp)
	movq	608(%rdx), %rax
	movq	%rax, 25520(%rsp)
	movq	616(%rdx), %rax
	movq	%rax, 25528(%rsp)
	movq	624(%rdx), %rax
	movq	%rax, 25536(%rsp)
	movq	632(%rdx), %rax
	movq	%rax, 25544(%rsp)
	movq	640(%rdx), %rax
	movq	%rax, 25552(%rsp)
	movq	648(%rdx), %rax
	movq	%rax, 25560(%rsp)
	movq	656(%rdx), %rax
	movq	%rax, 25568(%rsp)
	movq	664(%rdx), %rax
	movq	%rax, 25576(%rsp)
	movq	672(%rdx), %rax
	movq	%rax, 25584(%rsp)
	movq	680(%rdx), %rax
	movq	%rax, 25592(%rsp)
	movq	688(%rdx), %rax
	movq	%rax, 25600(%rsp)
	movq	696(%rdx), %rax
	movq	%rax, 25608(%rsp)
	movq	704(%rdx), %rax
	movq	%rax, 25616(%rsp)
	movq	712(%rdx), %rax
	movq	%rax, 25624(%rsp)
	movq	720(%rdx), %rax
	movq	%rax, 25632(%rsp)
	movq	728(%rdx), %rax
	movq	%rax, 25640(%rsp)
	movq	736(%rdx), %rax
	movq	%rax, 25648(%rsp)
	movq	744(%rdx), %rax
	movq	%rax, 25656(%rsp)
	movq	752(%rdx), %rax
	movq	%rax, 25664(%rsp)
	movq	760(%rdx), %rax
	movq	%rax, 25672(%rsp)
	movq	768(%rdx), %rax
	movq	%rax, 25680(%rsp)
	movq	776(%rdx), %rax
	movq	%rax, 25688(%rsp)
	movq	784(%rdx), %rax
	movq	%rax, 25696(%rsp)
	movq	792(%rdx), %rax
	movq	%rax, 25704(%rsp)
	movq	800(%rdx), %rax
	movq	%rax, 25712(%rsp)
	movq	808(%rdx), %rax
	movq	%rax, 25720(%rsp)
	movq	816(%rdx), %rax
	movq	%rax, 25728(%rsp)
	movq	824(%rdx), %rax
	movq	%rax, 25736(%rsp)
	movq	832(%rdx), %rax
	movq	%rax, 25744(%rsp)
	movq	840(%rdx), %rax
	movq	%rax, 25752(%rsp)
	movq	848(%rdx), %rax
	movq	%rax, 25760(%rsp)
	movq	856(%rdx), %rax
	movq	%rax, 25768(%rsp)
	movq	864(%rdx), %rax
	movq	%rax, 25776(%rsp)
	movq	872(%rdx), %rax
	movq	%rax, 25784(%rsp)
	movq	880(%rdx), %rax
	movq	%rax, 25792(%rsp)
	movq	888(%rdx), %rax
	movq	%rax, 25800(%rsp)
	movq	896(%rdx), %rax
	movq	%rax, 25808(%rsp)
	movq	904(%rdx), %rax
	movq	%rax, 25816(%rsp)
	movq	912(%rdx), %rax
	movq	%rax, 25824(%rsp)
	movq	920(%rdx), %rax
	movq	%rax, 25832(%rsp)
	movq	928(%rdx), %rax
	movq	%rax, 25840(%rsp)
	movq	936(%rdx), %rax
	movq	%rax, 25848(%rsp)
	movq	944(%rdx), %rax
	movq	%rax, 25856(%rsp)
	movq	952(%rdx), %rax
	movq	%rax, 25864(%rsp)
	movq	960(%rdx), %rax
	movq	%rax, 25872(%rsp)
	movq	968(%rdx), %rax
	movq	%rax, 25880(%rsp)
	movq	976(%rdx), %rax
	movq	%rax, 25888(%rsp)
	movq	984(%rdx), %rax
	movq	%rax, 25896(%rsp)
	movq	992(%rdx), %rax
	movq	%rax, 25904(%rsp)
	movq	1000(%rdx), %rax
	movq	%rax, 25912(%rsp)
	movq	1008(%rdx), %rax
	movq	%rax, 25920(%rsp)
	movq	1016(%rdx), %rax
	movq	%rax, 25928(%rsp)
	movq	1024(%rdx), %rax
	movq	%rax, 25936(%rsp)
	movq	1032(%rdx), %rax
	movq	%rax, 25944(%rsp)
	movq	1040(%rdx), %rax
	movq	%rax, 25952(%rsp)
	movq	1048(%rdx), %rax
	movq	%rax, 25960(%rsp)
	movq	1056(%rdx), %rax
	movq	%rax, 25968(%rsp)
	movq	1064(%rdx), %rax
	movq	%rax, 25976(%rsp)
	movq	1072(%rdx), %rax
	movq	%rax, 25984(%rsp)
	movq	1080(%rdx), %rax
	movq	%rax, 25992(%rsp)
	movq	1088(%rdx), %rax
	movq	%rax, 26000(%rsp)
	movq	1096(%rdx), %rax
	movq	%rax, 26008(%rsp)
	movq	1104(%rdx), %rax
	movq	%rax, 26016(%rsp)
	movq	1112(%rdx), %rax
	movq	%rax, 26024(%rsp)
	movq	1120(%rdx), %rax
	movq	%rax, 26032(%rsp)
	movq	1128(%rdx), %rax
	movq	%rax, 26040(%rsp)
	movq	1136(%rdx), %rax
	movq	%rax, 26048(%rsp)
	movq	1144(%rdx), %rax
	movq	%rax, 26056(%rsp)
	movq	1152(%rdx), %rax
	movq	%rax, 26064(%rsp)
	movq	1160(%rdx), %rax
	movq	%rax, 26072(%rsp)
	movq	1168(%rdx), %rax
	movq	%rax, 26080(%rsp)
	movq	1176(%rdx), %rax
	movq	%rax, 26088(%rsp)
	movq	1184(%rdx), %rax
	movq	%rax, 26096(%rsp)
	movq	1192(%rdx), %rax
	movq	%rax, 26104(%rsp)
	movq	1200(%rdx), %rax
	movq	%rax, 26112(%rsp)
	movq	1208(%rdx), %rax
	movq	%rax, 26120(%rsp)
	movq	1216(%rdx), %rax
	movq	%rax, 26128(%rsp)
	movq	1224(%rdx), %rax
	movq	%rax, 26136(%rsp)
	movq	1232(%rdx), %rax
	movq	%rax, 26144(%rsp)
	movq	1240(%rdx), %rax
	movq	%rax, 26152(%rsp)
	movq	1248(%rdx), %rax
	movq	%rax, 26160(%rsp)
	movq	1256(%rdx), %rax
	movq	%rax, 26168(%rsp)
	movq	1264(%rdx), %rax
	movq	%rax, 26176(%rsp)
	movq	1272(%rdx), %rax
	movq	%rax, 26184(%rsp)
	movq	1280(%rdx), %rax
	movq	%rax, 26192(%rsp)
	movq	1288(%rdx), %rax
	movq	%rax, 26200(%rsp)
	movq	1296(%rdx), %rax
	movq	%rax, 26208(%rsp)
	movq	1304(%rdx), %rax
	movq	%rax, 26216(%rsp)
	movq	1312(%rdx), %rax
	movq	%rax, 26224(%rsp)
	movq	1320(%rdx), %rax
	movq	%rax, 26232(%rsp)
	movq	1328(%rdx), %rax
	movq	%rax, 26240(%rsp)
	movq	1336(%rdx), %rax
	movq	%rax, 26248(%rsp)
	movq	1344(%rdx), %rax
	movq	%rax, 26256(%rsp)
	movq	1352(%rdx), %rax
	movq	%rax, 26264(%rsp)
	movq	1360(%rdx), %rax
	movq	%rax, 26272(%rsp)
	movq	1368(%rdx), %rax
	movq	%rax, 26280(%rsp)
	movq	1376(%rdx), %rax
	movq	%rax, 26288(%rsp)
	movq	1384(%rdx), %rax
	movq	%rax, 26296(%rsp)
	movq	1392(%rdx), %rax
	movq	%rax, 26304(%rsp)
	movq	1400(%rdx), %rax
	movq	%rax, 26312(%rsp)
	movq	1408(%rdx), %rax
	movq	%rax, 26320(%rsp)
	movq	1416(%rdx), %rax
	movq	%rax, 26328(%rsp)
	movq	1424(%rdx), %rax
	movq	%rax, 26336(%rsp)
	movq	1432(%rdx), %rax
	movq	%rax, 26344(%rsp)
	movq	1440(%rdx), %rax
	movq	%rax, 26352(%rsp)
	movq	1448(%rdx), %rax
	movq	%rax, 26360(%rsp)
	movq	1456(%rdx), %rax
	movq	%rax, 26368(%rsp)
	movq	1464(%rdx), %rax
	movq	%rax, 26376(%rsp)
	movq	1472(%rdx), %rax
	movq	%rax, 26384(%rsp)
	movq	1480(%rdx), %rax
	movq	%rax, 26392(%rsp)
	movq	1488(%rdx), %rax
	movq	%rax, 26400(%rsp)
	movq	1496(%rdx), %rax
	movq	%rax, 26408(%rsp)
	movq	1504(%rdx), %rax
	movq	%rax, 26416(%rsp)
	movq	1512(%rdx), %rax
	movq	%rax, 26424(%rsp)
	movq	1520(%rdx), %rax
	movq	%rax, 26432(%rsp)
	movq	1528(%rdx), %rax
	movq	%rax, 26440(%rsp)
	movq	1536(%rdx), %rax
	movq	%rax, 26448(%rsp)
	movq	1544(%rdx), %rax
	movq	%rax, 26456(%rsp)
	movq	1552(%rdx), %rax
	movq	%rax, 26464(%rsp)
	movq	1560(%rdx), %rax
	movq	%rax, 26472(%rsp)
	movq	1568(%rdx), %rax
	movq	%rax, 26480(%rsp)
	movq	1576(%rdx), %rax
	movq	%rax, 26488(%rsp)
	movq	1584(%rdx), %rax
	movq	%rax, 26496(%rsp)
	movq	1592(%rdx), %rax
	movq	%rax, 26504(%rsp)
	movq	1600(%rdx), %rax
	movq	%rax, 26512(%rsp)
	movq	1608(%rdx), %rax
	movq	%rax, 26520(%rsp)
	movq	1616(%rdx), %rax
	movq	%rax, 26528(%rsp)
	movq	1624(%rdx), %rax
	movq	%rax, 26536(%rsp)
	movq	1632(%rdx), %rax
	movq	%rax, 26544(%rsp)
	movq	1640(%rdx), %rax
	movq	%rax, 26552(%rsp)
	movq	1648(%rdx), %rax
	movq	%rax, 26560(%rsp)
	movq	1656(%rdx), %rax
	movq	%rax, 26568(%rsp)
	movq	1664(%rdx), %rax
	movq	%rax, 26576(%rsp)
	movq	1672(%rdx), %rax
	movq	%rax, 26584(%rsp)
	movq	1680(%rdx), %rax
	movq	%rax, 26592(%rsp)
	movq	1688(%rdx), %rax
	movq	%rax, 26600(%rsp)
	movq	1696(%rdx), %rax
	movq	%rax, 26608(%rsp)
	movq	1704(%rdx), %rax
	movq	%rax, 26616(%rsp)
	movq	1712(%rdx), %rax
	movq	%rax, 26624(%rsp)
	movq	1720(%rdx), %rax
	movq	%rax, 26632(%rsp)
	movq	1728(%rdx), %rax
	movq	%rax, 26640(%rsp)
	movq	1736(%rdx), %rax
	movq	%rax, 26648(%rsp)
	movq	1744(%rdx), %rax
	movq	%rax, 26656(%rsp)
	movq	1752(%rdx), %rax
	movq	%rax, 26664(%rsp)
	movq	1760(%rdx), %rax
	movq	%rax, 26672(%rsp)
	movq	1768(%rdx), %rax
	movq	%rax, 26680(%rsp)
	movq	1776(%rdx), %rax
	movq	%rax, 26688(%rsp)
	movq	1784(%rdx), %rax
	movq	%rax, 26696(%rsp)
	movq	1792(%rdx), %rax
	movq	%rax, 26704(%rsp)
	movq	1800(%rdx), %rax
	movq	%rax, 26712(%rsp)
	movq	1808(%rdx), %rax
	movq	%rax, 26720(%rsp)
	movq	1816(%rdx), %rax
	movq	%rax, 26728(%rsp)
	movq	1824(%rdx), %rax
	movq	%rax, 26736(%rsp)
	movq	1832(%rdx), %rax
	movq	%rax, 26744(%rsp)
	movq	1840(%rdx), %rax
	movq	%rax, 26752(%rsp)
	movq	1848(%rdx), %rax
	movq	%rax, 26760(%rsp)
	movq	1856(%rdx), %rax
	movq	%rax, 26768(%rsp)
	movq	1864(%rdx), %rax
	movq	%rax, 26776(%rsp)
	movq	1872(%rdx), %rax
	movq	%rax, 26784(%rsp)
	movq	1880(%rdx), %rax
	movq	%rax, 26792(%rsp)
	movq	1888(%rdx), %rax
	movq	%rax, 26800(%rsp)
	movq	1896(%rdx), %rax
	movq	%rax, 26808(%rsp)
	movq	1904(%rdx), %rax
	movq	%rax, 26816(%rsp)
	movq	1912(%rdx), %rax
	movq	%rax, 26824(%rsp)
	movq	1920(%rdx), %rax
	movq	%rax, 26832(%rsp)
	movq	1928(%rdx), %rax
	movq	%rax, 26840(%rsp)
	movq	1936(%rdx), %rax
	movq	%rax, 26848(%rsp)
	movq	1944(%rdx), %rax
	movq	%rax, 26856(%rsp)
	movq	1952(%rdx), %rax
	movq	%rax, 26864(%rsp)
	movq	1960(%rdx), %rax
	movq	%rax, 26872(%rsp)
	movq	1968(%rdx), %rax
	movq	%rax, 26880(%rsp)
	movq	1976(%rdx), %rax
	movq	%rax, 26888(%rsp)
	movq	1984(%rdx), %rax
	movq	%rax, 26896(%rsp)
	movq	1992(%rdx), %rax
	movq	%rax, 26904(%rsp)
	movq	2000(%rdx), %rax
	movq	%rax, 26912(%rsp)
	movq	2008(%rdx), %rax
	movq	%rax, 26920(%rsp)
	movq	2016(%rdx), %rax
	movq	%rax, 26928(%rsp)
	movq	2024(%rdx), %rax
	movq	%rax, 26936(%rsp)
	movq	2032(%rdx), %rax
	movq	%rax, 26944(%rsp)
	movq	2040(%rdx), %rax
	movq	%rax, 26952(%rsp)
	movq	2048(%rdx), %rax
	movq	%rax, 26960(%rsp)
	movq	2056(%rdx), %rax
	movq	%rax, 26968(%rsp)
	movq	2064(%rdx), %rax
	movq	%rax, 26976(%rsp)
	movq	2072(%rdx), %rax
	movq	%rax, 26984(%rsp)
	movq	2080(%rdx), %rax
	movq	%rax, 26992(%rsp)
	movq	2088(%rdx), %rax
	movq	%rax, 27000(%rsp)
	movq	2096(%rdx), %rax
	movq	%rax, 27008(%rsp)
	movq	2104(%rdx), %rax
	movq	%rax, 27016(%rsp)
	movq	2112(%rdx), %rax
	movq	%rax, 27024(%rsp)
	movq	2120(%rdx), %rax
	movq	%rax, 27032(%rsp)
	movq	2128(%rdx), %rax
	movq	%rax, 27040(%rsp)
	movq	2136(%rdx), %rax
	movq	%rax, 27048(%rsp)
	movq	2144(%rdx), %rax
	movq	%rax, 27056(%rsp)
	movq	2152(%rdx), %rax
	movq	%rax, 27064(%rsp)
	movq	2160(%rdx), %rax
	movq	%rax, 27072(%rsp)
	movq	2168(%rdx), %rax
	movq	%rax, 27080(%rsp)
	movq	2176(%rdx), %rax
	movq	%rax, 27088(%rsp)
	movq	2184(%rdx), %rax
	movq	%rax, 27096(%rsp)
	movq	2192(%rdx), %rax
	movq	%rax, 27104(%rsp)
	movq	2200(%rdx), %rax
	movq	%rax, 27112(%rsp)
	movq	2208(%rdx), %rax
	movq	%rax, 27120(%rsp)
	movq	2216(%rdx), %rax
	movq	%rax, 27128(%rsp)
	movq	2224(%rdx), %rax
	movq	%rax, 27136(%rsp)
	movq	2232(%rdx), %rax
	movq	%rax, 27144(%rsp)
	movq	2240(%rdx), %rax
	movq	%rax, 27152(%rsp)
	movq	2248(%rdx), %rax
	movq	%rax, 27160(%rsp)
	movq	2256(%rdx), %rax
	movq	%rax, 27168(%rsp)
	movq	2264(%rdx), %rax
	movq	%rax, 27176(%rsp)
	movq	2272(%rdx), %rax
	movq	%rax, 27184(%rsp)
	movq	2280(%rdx), %rax
	movq	%rax, 27192(%rsp)
	movq	2288(%rdx), %rax
	movq	%rax, 27200(%rsp)
	movq	2296(%rdx), %rax
	movq	%rax, 27208(%rsp)
	movq	2304(%rdx), %rax
	movq	%rax, 27216(%rsp)
	movq	2312(%rdx), %rax
	movq	%rax, 27224(%rsp)
	movq	2320(%rdx), %rax
	movq	%rax, 27232(%rsp)
	movq	2328(%rdx), %rax
	movq	%rax, 27240(%rsp)
	movq	2336(%rdx), %rax
	movq	%rax, 27248(%rsp)
	movq	2344(%rdx), %rax
	movq	%rax, 27256(%rsp)
	movq	2352(%rdx), %rax
	movq	%rax, 27264(%rsp)
	movq	2360(%rdx), %rax
	movq	%rax, 27272(%rsp)
	movq	2368(%rdx), %rax
	movq	%rax, 27280(%rsp)
	movq	2376(%rdx), %rax
	movq	%rax, 27288(%rsp)
	movq	2384(%rdx), %rax
	movq	%rax, 27296(%rsp)
	movq	2392(%rdx), %rax
	movq	%rax, 27304(%rsp)
	movq	2400(%rdx), %rax
	movq	%rax, 27312(%rsp)
	movq	2408(%rdx), %rax
	movq	%rax, 27320(%rsp)
	movq	2416(%rdx), %rax
	movq	%rax, 27328(%rsp)
	movq	2424(%rdx), %rax
	movq	%rax, 27336(%rsp)
	movq	2432(%rdx), %rax
	movq	%rax, 27344(%rsp)
	movq	2440(%rdx), %rax
	movq	%rax, 27352(%rsp)
	movq	2448(%rdx), %rax
	movq	%rax, 27360(%rsp)
	movq	2456(%rdx), %rax
	movq	%rax, 27368(%rsp)
	movq	2464(%rdx), %rax
	movq	%rax, 27376(%rsp)
	movq	2472(%rdx), %rax
	movq	%rax, 27384(%rsp)
	movq	2480(%rdx), %rax
	movq	%rax, 27392(%rsp)
	movq	2488(%rdx), %rax
	movq	%rax, 27400(%rsp)
	movq	2496(%rdx), %rax
	movq	%rax, 27408(%rsp)
	movq	2504(%rdx), %rax
	movq	%rax, 27416(%rsp)
	movq	2512(%rdx), %rax
	movq	%rax, 27424(%rsp)
	movq	2520(%rdx), %rax
	movq	%rax, 27432(%rsp)
	movq	2528(%rdx), %rax
	movq	%rax, 27440(%rsp)
	movq	2536(%rdx), %rax
	movq	%rax, 27448(%rsp)
	movq	2544(%rdx), %rax
	movq	%rax, 27456(%rsp)
	movq	2552(%rdx), %rax
	movq	%rax, 27464(%rsp)
	movq	2560(%rdx), %rax
	movq	%rax, 27472(%rsp)
	movq	2568(%rdx), %rax
	movq	%rax, 27480(%rsp)
	movq	2576(%rdx), %rax
	movq	%rax, 27488(%rsp)
	movq	2584(%rdx), %rax
	movq	%rax, 27496(%rsp)
	movq	2592(%rdx), %rax
	movq	%rax, 27504(%rsp)
	movq	2600(%rdx), %rax
	movq	%rax, 27512(%rsp)
	movq	2608(%rdx), %rax
	movq	%rax, 27520(%rsp)
	movq	2616(%rdx), %rax
	movq	%rax, 27528(%rsp)
	movq	2624(%rdx), %rax
	movq	%rax, 27536(%rsp)
	movq	2632(%rdx), %rax
	movq	%rax, 27544(%rsp)
	movq	2640(%rdx), %rax
	movq	%rax, 27552(%rsp)
	movq	2648(%rdx), %rax
	movq	%rax, 27560(%rsp)
	movq	2656(%rdx), %rax
	movq	%rax, 27568(%rsp)
	movq	2664(%rdx), %rax
	movq	%rax, 27576(%rsp)
	movq	2672(%rdx), %rax
	movq	%rax, 27584(%rsp)
	movq	2680(%rdx), %rax
	movq	%rax, 27592(%rsp)
	movq	2688(%rdx), %rax
	movq	%rax, 27600(%rsp)
	movq	2696(%rdx), %rax
	movq	%rax, 27608(%rsp)
	movq	2704(%rdx), %rax
	movq	%rax, 27616(%rsp)
	movq	2712(%rdx), %rax
	movq	%rax, 27624(%rsp)
	movq	2720(%rdx), %rax
	movq	%rax, 27632(%rsp)
	movq	2728(%rdx), %rax
	movq	%rax, 27640(%rsp)
	movq	2736(%rdx), %rax
	movq	%rax, 27648(%rsp)
	movq	2744(%rdx), %rax
	movq	%rax, 27656(%rsp)
	movq	2752(%rdx), %rax
	movq	%rax, 27664(%rsp)
	movq	2760(%rdx), %rax
	movq	%rax, 27672(%rsp)
	movq	2768(%rdx), %rax
	movq	%rax, 27680(%rsp)
	movq	2776(%rdx), %rax
	movq	%rax, 27688(%rsp)
	movq	2784(%rdx), %rax
	movq	%rax, 27696(%rsp)
	movq	2792(%rdx), %rax
	movq	%rax, 27704(%rsp)
	movq	2800(%rdx), %rax
	movq	%rax, 27712(%rsp)
	movq	2808(%rdx), %rax
	movq	%rax, 27720(%rsp)
	movq	2816(%rdx), %rax
	movq	%rax, 27728(%rsp)
	movq	2824(%rdx), %rax
	movq	%rax, 27736(%rsp)
	movq	2832(%rdx), %rax
	movq	%rax, 27744(%rsp)
	movq	2840(%rdx), %rax
	movq	%rax, 27752(%rsp)
	movq	2848(%rdx), %rax
	movq	%rax, 27760(%rsp)
	movq	2856(%rdx), %rax
	movq	%rax, 27768(%rsp)
	movq	2864(%rdx), %rax
	movq	%rax, 27776(%rsp)
	movq	2872(%rdx), %rax
	movq	%rax, 27784(%rsp)
	movq	2880(%rdx), %rax
	movq	%rax, 27792(%rsp)
	movq	2888(%rdx), %rax
	movq	%rax, 27800(%rsp)
	movq	2896(%rdx), %rax
	movq	%rax, 27808(%rsp)
	movq	2904(%rdx), %rax
	movq	%rax, 27816(%rsp)
	movq	2912(%rdx), %rax
	movq	%rax, 27824(%rsp)
	movq	2920(%rdx), %rax
	movq	%rax, 27832(%rsp)
	movq	2928(%rdx), %rax
	movq	%rax, 27840(%rsp)
	movq	2936(%rdx), %rax
	movq	%rax, 27848(%rsp)
	movq	2944(%rdx), %rax
	movq	%rax, 27856(%rsp)
	movq	2952(%rdx), %rax
	movq	%rax, 27864(%rsp)
	movq	2960(%rdx), %rax
	movq	%rax, 27872(%rsp)
	movq	2968(%rdx), %rax
	movq	%rax, 27880(%rsp)
	movq	2976(%rdx), %rax
	movq	%rax, 27888(%rsp)
	movq	2984(%rdx), %rax
	movq	%rax, 27896(%rsp)
	movq	2992(%rdx), %rax
	movq	%rax, 27904(%rsp)
	movq	3000(%rdx), %rax
	movq	%rax, 27912(%rsp)
	movq	3008(%rdx), %rax
	movq	%rax, 27920(%rsp)
	movq	3016(%rdx), %rax
	movq	%rax, 27928(%rsp)
	movq	3024(%rdx), %rax
	movq	%rax, 27936(%rsp)
	movq	3032(%rdx), %rax
	movq	%rax, 27944(%rsp)
	movq	3040(%rdx), %rax
	movq	%rax, 27952(%rsp)
	movq	3048(%rdx), %rax
	movq	%rax, 27960(%rsp)
	movq	3056(%rdx), %rax
	movq	%rax, 27968(%rsp)
	movq	3064(%rdx), %rax
	movq	%rax, 27976(%rsp)
	movq	3072(%rdx), %rax
	movq	%rax, 27984(%rsp)
	movq	3080(%rdx), %rax
	movq	%rax, 27992(%rsp)
	movq	3088(%rdx), %rax
	movq	%rax, 28000(%rsp)
	movq	3096(%rdx), %rax
	movq	%rax, 28008(%rsp)
	movq	3104(%rdx), %rax
	movq	%rax, 28016(%rsp)
	movq	3112(%rdx), %rax
	movq	%rax, 28024(%rsp)
	movq	3120(%rdx), %rax
	movq	%rax, 28032(%rsp)
	movq	3128(%rdx), %rax
	movq	%rax, 28040(%rsp)
	movq	3136(%rdx), %rax
	movq	%rax, 28048(%rsp)
	movq	3144(%rdx), %rax
	movq	%rax, 28056(%rsp)
	movq	3152(%rdx), %rax
	movq	%rax, 28064(%rsp)
	movq	3160(%rdx), %rax
	movq	%rax, 28072(%rsp)
	leaq	3744(%rsp), %rax
	movq	%rsp, %rdx
	leaq	24912(%rsp), %rcx
	movq	%rdx, 24864(%rsp)
	movq	%rax, 24872(%rsp)
	movq	(%rcx), %rdx
	movq	%rdx, 28080(%rsp)
	movq	8(%rcx), %rdx
	movq	%rdx, 28088(%rsp)
	movq	16(%rcx), %rdx
	movq	%rdx, 28096(%rsp)
	movq	24(%rcx), %rdx
	movq	%rdx, 28104(%rsp)
	movq	32(%rcx), %rdx
	movq	%rdx, 28112(%rsp)
	movq	40(%rcx), %rdx
	movq	%rdx, 28120(%rsp)
	movq	48(%rcx), %rdx
	movq	%rdx, 28128(%rsp)
	movq	56(%rcx), %rdx
	movq	%rdx, 28136(%rsp)
	movq	64(%rcx), %rdx
	movq	%rdx, 28144(%rsp)
	movq	72(%rcx), %rdx
	movq	%rdx, 28152(%rsp)
	movq	80(%rcx), %rdx
	movq	%rdx, 28160(%rsp)
	movq	88(%rcx), %rdx
	movq	%rdx, 28168(%rsp)
	movq	96(%rcx), %rdx
	movq	%rdx, 28176(%rsp)
	movq	104(%rcx), %rdx
	movq	%rdx, 28184(%rsp)
	movq	112(%rcx), %rdx
	movq	%rdx, 28192(%rsp)
	movq	120(%rcx), %rdx
	movq	%rdx, 28200(%rsp)
	movq	128(%rcx), %rdx
	movq	%rdx, 28208(%rsp)
	movq	136(%rcx), %rdx
	movq	%rdx, 28216(%rsp)
	movq	144(%rcx), %rdx
	movq	%rdx, 28224(%rsp)
	movq	152(%rcx), %rdx
	movq	%rdx, 28232(%rsp)
	movq	160(%rcx), %rdx
	movq	%rdx, 28240(%rsp)
	movq	168(%rcx), %rdx
	movq	%rdx, 28248(%rsp)
	movq	176(%rcx), %rdx
	movq	%rdx, 28256(%rsp)
	movq	184(%rcx), %rdx
	movq	%rdx, 28264(%rsp)
	movq	192(%rcx), %rdx
	movq	%rdx, 28272(%rsp)
	movq	200(%rcx), %rdx
	movq	%rdx, 28280(%rsp)
	movq	208(%rcx), %rdx
	movq	%rdx, 28288(%rsp)
	movq	216(%rcx), %rdx
	movq	%rdx, 28296(%rsp)
	movq	224(%rcx), %rdx
	movq	%rdx, 28304(%rsp)
	movq	232(%rcx), %rdx
	movq	%rdx, 28312(%rsp)
	movq	240(%rcx), %rdx
	movq	%rdx, 28320(%rsp)
	movq	248(%rcx), %rdx
	movq	%rdx, 28328(%rsp)
	movq	256(%rcx), %rdx
	movq	%rdx, 28336(%rsp)
	movq	264(%rcx), %rdx
	movq	%rdx, 28344(%rsp)
	movq	272(%rcx), %rdx
	movq	%rdx, 28352(%rsp)
	movq	280(%rcx), %rdx
	movq	%rdx, 28360(%rsp)
	movq	288(%rcx), %rdx
	movq	%rdx, 28368(%rsp)
	movq	296(%rcx), %rdx
	movq	%rdx, 28376(%rsp)
	movq	304(%rcx), %rdx
	movq	%rdx, 28384(%rsp)
	movq	312(%rcx), %rdx
	movq	%rdx, 28392(%rsp)
	movq	320(%rcx), %rdx
	movq	%rdx, 28400(%rsp)
	movq	328(%rcx), %rdx
	movq	%rdx, 28408(%rsp)
	movq	336(%rcx), %rdx
	movq	%rdx, 28416(%rsp)
	movq	344(%rcx), %rdx
	movq	%rdx, 28424(%rsp)
	movq	352(%rcx), %rdx
	movq	%rdx, 28432(%rsp)
	movq	360(%rcx), %rdx
	movq	%rdx, 28440(%rsp)
	movq	368(%rcx), %rdx
	movq	%rdx, 28448(%rsp)
	movq	376(%rcx), %rdx
	movq	%rdx, 28456(%rsp)
	movq	384(%rcx), %rdx
	movq	%rdx, 28464(%rsp)
	movq	392(%rcx), %rdx
	movq	%rdx, 28472(%rsp)
	movq	400(%rcx), %rdx
	movq	%rdx, 28480(%rsp)
	movq	408(%rcx), %rdx
	movq	%rdx, 28488(%rsp)
	movq	416(%rcx), %rdx
	movq	%rdx, 28496(%rsp)
	movq	424(%rcx), %rdx
	movq	%rdx, 28504(%rsp)
	movq	432(%rcx), %rdx
	movq	%rdx, 28512(%rsp)
	movq	440(%rcx), %rdx
	movq	%rdx, 28520(%rsp)
	movq	448(%rcx), %rdx
	movq	%rdx, 28528(%rsp)
	movq	456(%rcx), %rdx
	movq	%rdx, 28536(%rsp)
	movq	464(%rcx), %rdx
	movq	%rdx, 28544(%rsp)
	movq	472(%rcx), %rdx
	movq	%rdx, 28552(%rsp)
	movq	480(%rcx), %rdx
	movq	%rdx, 28560(%rsp)
	movq	488(%rcx), %rdx
	movq	%rdx, 28568(%rsp)
	movq	496(%rcx), %rdx
	movq	%rdx, 28576(%rsp)
	movq	504(%rcx), %rdx
	movq	%rdx, 28584(%rsp)
	movq	512(%rcx), %rdx
	movq	%rdx, 28592(%rsp)
	movq	520(%rcx), %rdx
	movq	%rdx, 28600(%rsp)
	movq	528(%rcx), %rdx
	movq	%rdx, 28608(%rsp)
	movq	536(%rcx), %rdx
	movq	%rdx, 28616(%rsp)
	movq	544(%rcx), %rdx
	movq	%rdx, 28624(%rsp)
	movq	552(%rcx), %rdx
	movq	%rdx, 28632(%rsp)
	movq	560(%rcx), %rdx
	movq	%rdx, 28640(%rsp)
	movq	568(%rcx), %rdx
	movq	%rdx, 28648(%rsp)
	movq	576(%rcx), %rdx
	movq	%rdx, 28656(%rsp)
	movq	584(%rcx), %rdx
	movq	%rdx, 28664(%rsp)
	movq	592(%rcx), %rdx
	movq	%rdx, 28672(%rsp)
	movq	600(%rcx), %rdx
	movq	%rdx, 28680(%rsp)
	movq	608(%rcx), %rdx
	movq	%rdx, 28688(%rsp)
	movq	616(%rcx), %rdx
	movq	%rdx, 28696(%rsp)
	movq	624(%rcx), %rdx
	movq	%rdx, 28704(%rsp)
	movq	632(%rcx), %rdx
	movq	%rdx, 28712(%rsp)
	movq	640(%rcx), %rdx
	movq	%rdx, 28720(%rsp)
	movq	648(%rcx), %rdx
	movq	%rdx, 28728(%rsp)
	movq	656(%rcx), %rdx
	movq	%rdx, 28736(%rsp)
	movq	664(%rcx), %rdx
	movq	%rdx, 28744(%rsp)
	movq	672(%rcx), %rdx
	movq	%rdx, 28752(%rsp)
	movq	680(%rcx), %rdx
	movq	%rdx, 28760(%rsp)
	movq	688(%rcx), %rdx
	movq	%rdx, 28768(%rsp)
	movq	696(%rcx), %rdx
	movq	%rdx, 28776(%rsp)
	movq	704(%rcx), %rdx
	movq	%rdx, 28784(%rsp)
	movq	712(%rcx), %rdx
	movq	%rdx, 28792(%rsp)
	movq	720(%rcx), %rdx
	movq	%rdx, 28800(%rsp)
	movq	728(%rcx), %rdx
	movq	%rdx, 28808(%rsp)
	movq	736(%rcx), %rdx
	movq	%rdx, 28816(%rsp)
	movq	744(%rcx), %rdx
	movq	%rdx, 28824(%rsp)
	movq	752(%rcx), %rdx
	movq	%rdx, 28832(%rsp)
	movq	760(%rcx), %rdx
	movq	%rdx, 28840(%rsp)
	movq	768(%rcx), %rdx
	movq	%rdx, 28848(%rsp)
	movq	776(%rcx), %rdx
	movq	%rdx, 28856(%rsp)
	movq	784(%rcx), %rdx
	movq	%rdx, 28864(%rsp)
	movq	792(%rcx), %rdx
	movq	%rdx, 28872(%rsp)
	movq	800(%rcx), %rdx
	movq	%rdx, 28880(%rsp)
	movq	808(%rcx), %rdx
	movq	%rdx, 28888(%rsp)
	movq	816(%rcx), %rdx
	movq	%rdx, 28896(%rsp)
	movq	824(%rcx), %rdx
	movq	%rdx, 28904(%rsp)
	movq	832(%rcx), %rdx
	movq	%rdx, 28912(%rsp)
	movq	840(%rcx), %rdx
	movq	%rdx, 28920(%rsp)
	movq	848(%rcx), %rdx
	movq	%rdx, 28928(%rsp)
	movq	856(%rcx), %rdx
	movq	%rdx, 28936(%rsp)
	movq	864(%rcx), %rdx
	movq	%rdx, 28944(%rsp)
	movq	872(%rcx), %rdx
	movq	%rdx, 28952(%rsp)
	movq	880(%rcx), %rdx
	movq	%rdx, 28960(%rsp)
	movq	888(%rcx), %rdx
	movq	%rdx, 28968(%rsp)
	movq	896(%rcx), %rdx
	movq	%rdx, 28976(%rsp)
	movq	904(%rcx), %rdx
	movq	%rdx, 28984(%rsp)
	movq	912(%rcx), %rdx
	movq	%rdx, 28992(%rsp)
	movq	920(%rcx), %rdx
	movq	%rdx, 29000(%rsp)
	movq	928(%rcx), %rdx
	movq	%rdx, 29008(%rsp)
	movq	936(%rcx), %rdx
	movq	%rdx, 29016(%rsp)
	movq	944(%rcx), %rdx
	movq	%rdx, 29024(%rsp)
	movq	952(%rcx), %rdx
	movq	%rdx, 29032(%rsp)
	movq	960(%rcx), %rdx
	movq	%rdx, 29040(%rsp)
	movq	968(%rcx), %rdx
	movq	%rdx, 29048(%rsp)
	movq	976(%rcx), %rdx
	movq	%rdx, 29056(%rsp)
	movq	984(%rcx), %rdx
	movq	%rdx, 29064(%rsp)
	movq	992(%rcx), %rdx
	movq	%rdx, 29072(%rsp)
	movq	1000(%rcx), %rdx
	movq	%rdx, 29080(%rsp)
	movq	1008(%rcx), %rdx
	movq	%rdx, 29088(%rsp)
	movq	1016(%rcx), %rdx
	movq	%rdx, 29096(%rsp)
	movq	1024(%rcx), %rdx
	movq	%rdx, 29104(%rsp)
	movq	1032(%rcx), %rdx
	movq	%rdx, 29112(%rsp)
	movq	1040(%rcx), %rdx
	movq	%rdx, 29120(%rsp)
	movq	1048(%rcx), %rdx
	movq	%rdx, 29128(%rsp)
	movq	1056(%rcx), %rdx
	movq	%rdx, 29136(%rsp)
	movq	1064(%rcx), %rdx
	movq	%rdx, 29144(%rsp)
	movq	1072(%rcx), %rdx
	movq	%rdx, 29152(%rsp)
	movq	1080(%rcx), %rdx
	movq	%rdx, 29160(%rsp)
	movq	1088(%rcx), %rdx
	movq	%rdx, 29168(%rsp)
	movq	1096(%rcx), %rdx
	movq	%rdx, 29176(%rsp)
	movq	1104(%rcx), %rdx
	movq	%rdx, 29184(%rsp)
	movq	1112(%rcx), %rdx
	movq	%rdx, 29192(%rsp)
	movq	1120(%rcx), %rdx
	movq	%rdx, 29200(%rsp)
	movq	1128(%rcx), %rdx
	movq	%rdx, 29208(%rsp)
	movq	1136(%rcx), %rdx
	movq	%rdx, 29216(%rsp)
	movq	1144(%rcx), %rdx
	movq	%rdx, 29224(%rsp)
	movq	1152(%rcx), %rdx
	movq	%rdx, 29232(%rsp)
	movq	1160(%rcx), %rdx
	movq	%rdx, 29240(%rsp)
	movq	1168(%rcx), %rdx
	movq	%rdx, 29248(%rsp)
	movq	1176(%rcx), %rdx
	movq	%rdx, 29256(%rsp)
	movq	1184(%rcx), %rdx
	movq	%rdx, 29264(%rsp)
	movq	1192(%rcx), %rdx
	movq	%rdx, 29272(%rsp)
	movq	1200(%rcx), %rdx
	movq	%rdx, 29280(%rsp)
	movq	1208(%rcx), %rdx
	movq	%rdx, 29288(%rsp)
	movq	1216(%rcx), %rdx
	movq	%rdx, 29296(%rsp)
	movq	1224(%rcx), %rdx
	movq	%rdx, 29304(%rsp)
	movq	1232(%rcx), %rdx
	movq	%rdx, 29312(%rsp)
	movq	1240(%rcx), %rdx
	movq	%rdx, 29320(%rsp)
	movq	1248(%rcx), %rdx
	movq	%rdx, 29328(%rsp)
	movq	1256(%rcx), %rdx
	movq	%rdx, 29336(%rsp)
	movq	1264(%rcx), %rdx
	movq	%rdx, 29344(%rsp)
	movq	1272(%rcx), %rdx
	movq	%rdx, 29352(%rsp)
	movq	1280(%rcx), %rdx
	movq	%rdx, 29360(%rsp)
	movq	1288(%rcx), %rdx
	movq	%rdx, 29368(%rsp)
	movq	1296(%rcx), %rdx
	movq	%rdx, 29376(%rsp)
	movq	1304(%rcx), %rdx
	movq	%rdx, 29384(%rsp)
	movq	1312(%rcx), %rdx
	movq	%rdx, 29392(%rsp)
	movq	1320(%rcx), %rdx
	movq	%rdx, 29400(%rsp)
	movq	1328(%rcx), %rdx
	movq	%rdx, 29408(%rsp)
	movq	1336(%rcx), %rdx
	movq	%rdx, 29416(%rsp)
	movq	1344(%rcx), %rdx
	movq	%rdx, 29424(%rsp)
	movq	1352(%rcx), %rdx
	movq	%rdx, 29432(%rsp)
	movq	1360(%rcx), %rdx
	movq	%rdx, 29440(%rsp)
	movq	1368(%rcx), %rdx
	movq	%rdx, 29448(%rsp)
	movq	1376(%rcx), %rdx
	movq	%rdx, 29456(%rsp)
	movq	1384(%rcx), %rdx
	movq	%rdx, 29464(%rsp)
	movq	1392(%rcx), %rdx
	movq	%rdx, 29472(%rsp)
	movq	1400(%rcx), %rdx
	movq	%rdx, 29480(%rsp)
	movq	1408(%rcx), %rdx
	movq	%rdx, 29488(%rsp)
	movq	1416(%rcx), %rdx
	movq	%rdx, 29496(%rsp)
	movq	1424(%rcx), %rdx
	movq	%rdx, 29504(%rsp)
	movq	1432(%rcx), %rdx
	movq	%rdx, 29512(%rsp)
	movq	1440(%rcx), %rdx
	movq	%rdx, 29520(%rsp)
	movq	1448(%rcx), %rdx
	movq	%rdx, 29528(%rsp)
	movq	1456(%rcx), %rdx
	movq	%rdx, 29536(%rsp)
	movq	1464(%rcx), %rdx
	movq	%rdx, 29544(%rsp)
	movq	1472(%rcx), %rdx
	movq	%rdx, 29552(%rsp)
	movq	1480(%rcx), %rdx
	movq	%rdx, 29560(%rsp)
	movq	1488(%rcx), %rdx
	movq	%rdx, 29568(%rsp)
	movq	1496(%rcx), %rdx
	movq	%rdx, 29576(%rsp)
	movq	1504(%rcx), %rdx
	movq	%rdx, 29584(%rsp)
	movq	1512(%rcx), %rdx
	movq	%rdx, 29592(%rsp)
	movq	1520(%rcx), %rdx
	movq	%rdx, 29600(%rsp)
	movq	1528(%rcx), %rdx
	movq	%rdx, 29608(%rsp)
	movq	1536(%rcx), %rdx
	movq	%rdx, 29616(%rsp)
	movq	1544(%rcx), %rdx
	movq	%rdx, 29624(%rsp)
	movq	1552(%rcx), %rdx
	movq	%rdx, 29632(%rsp)
	movq	1560(%rcx), %rdx
	movq	%rdx, 29640(%rsp)
	movq	1568(%rcx), %rdx
	movq	%rdx, 29648(%rsp)
	movq	1576(%rcx), %rdx
	movq	%rdx, 29656(%rsp)
	movq	1584(%rcx), %rdx
	movq	%rdx, 29664(%rsp)
	movq	1592(%rcx), %rdx
	movq	%rdx, 29672(%rsp)
	movq	1600(%rcx), %rdx
	movq	%rdx, 29680(%rsp)
	movq	1608(%rcx), %rdx
	movq	%rdx, 29688(%rsp)
	movq	1616(%rcx), %rdx
	movq	%rdx, 29696(%rsp)
	movq	1624(%rcx), %rdx
	movq	%rdx, 29704(%rsp)
	movq	1632(%rcx), %rdx
	movq	%rdx, 29712(%rsp)
	movq	1640(%rcx), %rdx
	movq	%rdx, 29720(%rsp)
	movq	1648(%rcx), %rdx
	movq	%rdx, 29728(%rsp)
	movq	1656(%rcx), %rdx
	movq	%rdx, 29736(%rsp)
	movq	1664(%rcx), %rdx
	movq	%rdx, 29744(%rsp)
	movq	1672(%rcx), %rdx
	movq	%rdx, 29752(%rsp)
	movq	1680(%rcx), %rdx
	movq	%rdx, 29760(%rsp)
	movq	1688(%rcx), %rdx
	movq	%rdx, 29768(%rsp)
	movq	1696(%rcx), %rdx
	movq	%rdx, 29776(%rsp)
	movq	1704(%rcx), %rdx
	movq	%rdx, 29784(%rsp)
	movq	1712(%rcx), %rdx
	movq	%rdx, 29792(%rsp)
	movq	1720(%rcx), %rdx
	movq	%rdx, 29800(%rsp)
	movq	1728(%rcx), %rdx
	movq	%rdx, 29808(%rsp)
	movq	1736(%rcx), %rdx
	movq	%rdx, 29816(%rsp)
	movq	1744(%rcx), %rdx
	movq	%rdx, 29824(%rsp)
	movq	1752(%rcx), %rdx
	movq	%rdx, 29832(%rsp)
	movq	1760(%rcx), %rdx
	movq	%rdx, 29840(%rsp)
	movq	1768(%rcx), %rdx
	movq	%rdx, 29848(%rsp)
	movq	1776(%rcx), %rdx
	movq	%rdx, 29856(%rsp)
	movq	1784(%rcx), %rdx
	movq	%rdx, 29864(%rsp)
	movq	1792(%rcx), %rdx
	movq	%rdx, 29872(%rsp)
	movq	1800(%rcx), %rdx
	movq	%rdx, 29880(%rsp)
	movq	1808(%rcx), %rdx
	movq	%rdx, 29888(%rsp)
	movq	1816(%rcx), %rdx
	movq	%rdx, 29896(%rsp)
	movq	1824(%rcx), %rdx
	movq	%rdx, 29904(%rsp)
	movq	1832(%rcx), %rdx
	movq	%rdx, 29912(%rsp)
	movq	1840(%rcx), %rdx
	movq	%rdx, 29920(%rsp)
	movq	1848(%rcx), %rdx
	movq	%rdx, 29928(%rsp)
	movq	1856(%rcx), %rdx
	movq	%rdx, 29936(%rsp)
	movq	1864(%rcx), %rdx
	movq	%rdx, 29944(%rsp)
	movq	1872(%rcx), %rdx
	movq	%rdx, 29952(%rsp)
	movq	1880(%rcx), %rdx
	movq	%rdx, 29960(%rsp)
	movq	1888(%rcx), %rdx
	movq	%rdx, 29968(%rsp)
	movq	1896(%rcx), %rdx
	movq	%rdx, 29976(%rsp)
	movq	1904(%rcx), %rdx
	movq	%rdx, 29984(%rsp)
	movq	1912(%rcx), %rdx
	movq	%rdx, 29992(%rsp)
	movq	1920(%rcx), %rdx
	movq	%rdx, 30000(%rsp)
	movq	1928(%rcx), %rdx
	movq	%rdx, 30008(%rsp)
	movq	1936(%rcx), %rdx
	movq	%rdx, 30016(%rsp)
	movq	1944(%rcx), %rdx
	movq	%rdx, 30024(%rsp)
	movq	1952(%rcx), %rdx
	movq	%rdx, 30032(%rsp)
	movq	1960(%rcx), %rdx
	movq	%rdx, 30040(%rsp)
	movq	1968(%rcx), %rdx
	movq	%rdx, 30048(%rsp)
	movq	1976(%rcx), %rdx
	movq	%rdx, 30056(%rsp)
	movq	1984(%rcx), %rdx
	movq	%rdx, 30064(%rsp)
	movq	1992(%rcx), %rdx
	movq	%rdx, 30072(%rsp)
	movq	2000(%rcx), %rdx
	movq	%rdx, 30080(%rsp)
	movq	2008(%rcx), %rdx
	movq	%rdx, 30088(%rsp)
	movq	2016(%rcx), %rdx
	movq	%rdx, 30096(%rsp)
	movq	2024(%rcx), %rdx
	movq	%rdx, 30104(%rsp)
	movq	2032(%rcx), %rdx
	movq	%rdx, 30112(%rsp)
	movq	2040(%rcx), %rdx
	movq	%rdx, 30120(%rsp)
	movq	2048(%rcx), %rdx
	movq	%rdx, 30128(%rsp)
	movq	2056(%rcx), %rdx
	movq	%rdx, 30136(%rsp)
	movq	2064(%rcx), %rdx
	movq	%rdx, 30144(%rsp)
	movq	2072(%rcx), %rdx
	movq	%rdx, 30152(%rsp)
	movq	2080(%rcx), %rdx
	movq	%rdx, 30160(%rsp)
	movq	2088(%rcx), %rdx
	movq	%rdx, 30168(%rsp)
	movq	2096(%rcx), %rdx
	movq	%rdx, 30176(%rsp)
	movq	2104(%rcx), %rdx
	movq	%rdx, 30184(%rsp)
	movq	2112(%rcx), %rdx
	movq	%rdx, 30192(%rsp)
	movq	2120(%rcx), %rdx
	movq	%rdx, 30200(%rsp)
	movq	2128(%rcx), %rdx
	movq	%rdx, 30208(%rsp)
	movq	2136(%rcx), %rdx
	movq	%rdx, 30216(%rsp)
	movq	2144(%rcx), %rdx
	movq	%rdx, 30224(%rsp)
	movq	2152(%rcx), %rdx
	movq	%rdx, 30232(%rsp)
	movq	2160(%rcx), %rdx
	movq	%rdx, 30240(%rsp)
	movq	2168(%rcx), %rdx
	movq	%rdx, 30248(%rsp)
	movq	2176(%rcx), %rdx
	movq	%rdx, 30256(%rsp)
	movq	2184(%rcx), %rdx
	movq	%rdx, 30264(%rsp)
	movq	2192(%rcx), %rdx
	movq	%rdx, 30272(%rsp)
	movq	2200(%rcx), %rdx
	movq	%rdx, 30280(%rsp)
	movq	2208(%rcx), %rdx
	movq	%rdx, 30288(%rsp)
	movq	2216(%rcx), %rdx
	movq	%rdx, 30296(%rsp)
	movq	2224(%rcx), %rdx
	movq	%rdx, 30304(%rsp)
	movq	2232(%rcx), %rdx
	movq	%rdx, 30312(%rsp)
	movq	2240(%rcx), %rdx
	movq	%rdx, 30320(%rsp)
	movq	2248(%rcx), %rdx
	movq	%rdx, 30328(%rsp)
	movq	2256(%rcx), %rdx
	movq	%rdx, 30336(%rsp)
	movq	2264(%rcx), %rdx
	movq	%rdx, 30344(%rsp)
	movq	2272(%rcx), %rdx
	movq	%rdx, 30352(%rsp)
	movq	2280(%rcx), %rdx
	movq	%rdx, 30360(%rsp)
	movq	2288(%rcx), %rdx
	movq	%rdx, 30368(%rsp)
	movq	2296(%rcx), %rdx
	movq	%rdx, 30376(%rsp)
	movq	2304(%rcx), %rdx
	movq	%rdx, 30384(%rsp)
	movq	2312(%rcx), %rdx
	movq	%rdx, 30392(%rsp)
	movq	2320(%rcx), %rdx
	movq	%rdx, 30400(%rsp)
	movq	2328(%rcx), %rdx
	movq	%rdx, 30408(%rsp)
	movq	2336(%rcx), %rdx
	movq	%rdx, 30416(%rsp)
	movq	2344(%rcx), %rdx
	movq	%rdx, 30424(%rsp)
	movq	2352(%rcx), %rdx
	movq	%rdx, 30432(%rsp)
	movq	2360(%rcx), %rdx
	movq	%rdx, 30440(%rsp)
	movq	2368(%rcx), %rdx
	movq	%rdx, 30448(%rsp)
	movq	2376(%rcx), %rdx
	movq	%rdx, 30456(%rsp)
	movq	2384(%rcx), %rdx
	movq	%rdx, 30464(%rsp)
	movq	2392(%rcx), %rdx
	movq	%rdx, 30472(%rsp)
	movq	2400(%rcx), %rdx
	movq	%rdx, 30480(%rsp)
	movq	2408(%rcx), %rdx
	movq	%rdx, 30488(%rsp)
	movq	2416(%rcx), %rdx
	movq	%rdx, 30496(%rsp)
	movq	2424(%rcx), %rdx
	movq	%rdx, 30504(%rsp)
	movq	2432(%rcx), %rdx
	movq	%rdx, 30512(%rsp)
	movq	2440(%rcx), %rdx
	movq	%rdx, 30520(%rsp)
	movq	2448(%rcx), %rdx
	movq	%rdx, 30528(%rsp)
	movq	2456(%rcx), %rdx
	movq	%rdx, 30536(%rsp)
	movq	2464(%rcx), %rdx
	movq	%rdx, 30544(%rsp)
	movq	2472(%rcx), %rdx
	movq	%rdx, 30552(%rsp)
	movq	2480(%rcx), %rdx
	movq	%rdx, 30560(%rsp)
	movq	2488(%rcx), %rdx
	movq	%rdx, 30568(%rsp)
	movq	2496(%rcx), %rdx
	movq	%rdx, 30576(%rsp)
	movq	2504(%rcx), %rdx
	movq	%rdx, 30584(%rsp)
	movq	2512(%rcx), %rdx
	movq	%rdx, 30592(%rsp)
	movq	2520(%rcx), %rdx
	movq	%rdx, 30600(%rsp)
	movq	2528(%rcx), %rdx
	movq	%rdx, 30608(%rsp)
	movq	2536(%rcx), %rdx
	movq	%rdx, 30616(%rsp)
	movq	2544(%rcx), %rdx
	movq	%rdx, 30624(%rsp)
	movq	2552(%rcx), %rdx
	movq	%rdx, 30632(%rsp)
	movq	2560(%rcx), %rdx
	movq	%rdx, 30640(%rsp)
	movq	2568(%rcx), %rdx
	movq	%rdx, 30648(%rsp)
	movq	2576(%rcx), %rdx
	movq	%rdx, 30656(%rsp)
	movq	2584(%rcx), %rdx
	movq	%rdx, 30664(%rsp)
	movq	2592(%rcx), %rdx
	movq	%rdx, 30672(%rsp)
	movq	2600(%rcx), %rdx
	movq	%rdx, 30680(%rsp)
	movq	2608(%rcx), %rdx
	movq	%rdx, 30688(%rsp)
	movq	2616(%rcx), %rdx
	movq	%rdx, 30696(%rsp)
	movq	2624(%rcx), %rdx
	movq	%rdx, 30704(%rsp)
	movq	2632(%rcx), %rdx
	movq	%rdx, 30712(%rsp)
	movq	2640(%rcx), %rdx
	movq	%rdx, 30720(%rsp)
	movq	2648(%rcx), %rdx
	movq	%rdx, 30728(%rsp)
	movq	2656(%rcx), %rdx
	movq	%rdx, 30736(%rsp)
	movq	2664(%rcx), %rdx
	movq	%rdx, 30744(%rsp)
	movq	2672(%rcx), %rdx
	movq	%rdx, 30752(%rsp)
	movq	2680(%rcx), %rdx
	movq	%rdx, 30760(%rsp)
	movq	2688(%rcx), %rdx
	movq	%rdx, 30768(%rsp)
	movq	2696(%rcx), %rdx
	movq	%rdx, 30776(%rsp)
	movq	2704(%rcx), %rdx
	movq	%rdx, 30784(%rsp)
	movq	2712(%rcx), %rdx
	movq	%rdx, 30792(%rsp)
	movq	2720(%rcx), %rdx
	movq	%rdx, 30800(%rsp)
	movq	2728(%rcx), %rdx
	movq	%rdx, 30808(%rsp)
	movq	2736(%rcx), %rdx
	movq	%rdx, 30816(%rsp)
	movq	2744(%rcx), %rdx
	movq	%rdx, 30824(%rsp)
	movq	2752(%rcx), %rdx
	movq	%rdx, 30832(%rsp)
	movq	2760(%rcx), %rdx
	movq	%rdx, 30840(%rsp)
	movq	2768(%rcx), %rdx
	movq	%rdx, 30848(%rsp)
	movq	2776(%rcx), %rdx
	movq	%rdx, 30856(%rsp)
	movq	2784(%rcx), %rdx
	movq	%rdx, 30864(%rsp)
	movq	2792(%rcx), %rdx
	movq	%rdx, 30872(%rsp)
	movq	2800(%rcx), %rdx
	movq	%rdx, 30880(%rsp)
	movq	2808(%rcx), %rdx
	movq	%rdx, 30888(%rsp)
	movq	2816(%rcx), %rdx
	movq	%rdx, 30896(%rsp)
	movq	2824(%rcx), %rdx
	movq	%rdx, 30904(%rsp)
	movq	2832(%rcx), %rdx
	movq	%rdx, 30912(%rsp)
	movq	2840(%rcx), %rdx
	movq	%rdx, 30920(%rsp)
	movq	2848(%rcx), %rdx
	movq	%rdx, 30928(%rsp)
	movq	2856(%rcx), %rdx
	movq	%rdx, 30936(%rsp)
	movq	2864(%rcx), %rdx
	movq	%rdx, 30944(%rsp)
	movq	2872(%rcx), %rdx
	movq	%rdx, 30952(%rsp)
	movq	2880(%rcx), %rdx
	movq	%rdx, 30960(%rsp)
	movq	2888(%rcx), %rdx
	movq	%rdx, 30968(%rsp)
	movq	2896(%rcx), %rdx
	movq	%rdx, 30976(%rsp)
	movq	2904(%rcx), %rdx
	movq	%rdx, 30984(%rsp)
	movq	2912(%rcx), %rdx
	movq	%rdx, 30992(%rsp)
	movq	2920(%rcx), %rdx
	movq	%rdx, 31000(%rsp)
	movq	2928(%rcx), %rdx
	movq	%rdx, 31008(%rsp)
	movq	2936(%rcx), %rdx
	movq	%rdx, 31016(%rsp)
	movq	2944(%rcx), %rdx
	movq	%rdx, 31024(%rsp)
	movq	2952(%rcx), %rdx
	movq	%rdx, 31032(%rsp)
	movq	2960(%rcx), %rdx
	movq	%rdx, 31040(%rsp)
	movq	2968(%rcx), %rdx
	movq	%rdx, 31048(%rsp)
	movq	2976(%rcx), %rdx
	movq	%rdx, 31056(%rsp)
	movq	2984(%rcx), %rdx
	movq	%rdx, 31064(%rsp)
	movq	2992(%rcx), %rdx
	movq	%rdx, 31072(%rsp)
	movq	3000(%rcx), %rdx
	movq	%rdx, 31080(%rsp)
	movq	3008(%rcx), %rdx
	movq	%rdx, 31088(%rsp)
	movq	3016(%rcx), %rdx
	movq	%rdx, 31096(%rsp)
	movq	3024(%rcx), %rdx
	movq	%rdx, 31104(%rsp)
	movq	3032(%rcx), %rdx
	movq	%rdx, 31112(%rsp)
	movq	3040(%rcx), %rdx
	movq	%rdx, 31120(%rsp)
	movq	3048(%rcx), %rdx
	movq	%rdx, 31128(%rsp)
	movq	3056(%rcx), %rdx
	movq	%rdx, 31136(%rsp)
	movq	3064(%rcx), %rdx
	movq	%rdx, 31144(%rsp)
	movq	3072(%rcx), %rdx
	movq	%rdx, 31152(%rsp)
	movq	3080(%rcx), %rdx
	movq	%rdx, 31160(%rsp)
	movq	3088(%rcx), %rdx
	movq	%rdx, 31168(%rsp)
	movq	3096(%rcx), %rdx
	movq	%rdx, 31176(%rsp)
	movq	3104(%rcx), %rdx
	movq	%rdx, 31184(%rsp)
	movq	3112(%rcx), %rdx
	movq	%rdx, 31192(%rsp)
	movq	3120(%rcx), %rdx
	movq	%rdx, 31200(%rsp)
	movq	3128(%rcx), %rdx
	movq	%rdx, 31208(%rsp)
	movq	3136(%rcx), %rdx
	movq	%rdx, 31216(%rsp)
	movq	3144(%rcx), %rdx
	movq	%rdx, 31224(%rsp)
	movq	3152(%rcx), %rdx
	movq	%rdx, 31232(%rsp)
	movq	3160(%rcx), %rcx
	movq	%rcx, 31240(%rsp)
	leaq	32(%rsp), %rcx
	leaq	28080(%rsp), %rdx
	leaq	glob_data + 1184(%rip), %rsi
	vmovdqu	(%rsi), %ymm0
	leaq	glob_data + 288(%rip), %rsi
	vmovdqu	(%rsi), %ymm1
	leaq	glob_data + 256(%rip), %rsi
	vmovdqu	(%rsi), %ymm2
	leaq	glob_data + 224(%rip), %rsi
	vmovdqu	(%rsi), %ymm3
	leaq	glob_data + 192(%rip), %rsi
	vmovdqu	(%rsi), %ymm4
	vpbroadcastw	glob_data + 5186(%rip), %ymm5
	vmovdqu	(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8480(%rsp)
	vmovdqu	22(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8512(%rsp)
	vmovdqu	44(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8544(%rsp)
	vmovdqu	66(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8576(%rsp)
	vmovdqu	88(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8608(%rsp)
	vmovdqu	110(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8640(%rsp)
	vmovdqu	132(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8672(%rsp)
	vmovdqu	154(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8704(%rsp)
	vmovdqu	176(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8736(%rsp)
	vmovdqu	198(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8768(%rsp)
	vmovdqu	220(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8800(%rsp)
	vmovdqu	242(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8832(%rsp)
	vmovdqu	264(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8864(%rsp)
	vmovdqu	286(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8896(%rsp)
	vmovdqu	308(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8928(%rsp)
	vmovdqu	330(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8960(%rsp)
	vmovdqu	352(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 8992(%rsp)
	vmovdqu	374(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9024(%rsp)
	vmovdqu	396(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9056(%rsp)
	vmovdqu	418(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9088(%rsp)
	vmovdqu	440(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9120(%rsp)
	vmovdqu	462(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9152(%rsp)
	vmovdqu	484(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9184(%rsp)
	vmovdqu	506(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9216(%rsp)
	vmovdqu	528(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9248(%rsp)
	vmovdqu	550(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9280(%rsp)
	vmovdqu	572(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9312(%rsp)
	vmovdqu	594(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9344(%rsp)
	vmovdqu	616(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9376(%rsp)
	vmovdqu	638(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9408(%rsp)
	vmovdqu	660(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9440(%rsp)
	vmovdqu	682(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9472(%rsp)
	vmovdqu	704(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9504(%rsp)
	vmovdqu	726(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9536(%rsp)
	vmovdqu	748(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9568(%rsp)
	vmovdqu	770(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9600(%rsp)
	vmovdqu	792(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9632(%rsp)
	vmovdqu	814(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9664(%rsp)
	vmovdqu	836(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9696(%rsp)
	vmovdqu	858(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9728(%rsp)
	vmovdqu	880(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9760(%rsp)
	vmovdqu	902(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9792(%rsp)
	vmovdqu	924(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9824(%rsp)
	vmovdqu	946(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9856(%rsp)
	vmovdqu	968(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9888(%rsp)
	vmovdqu	990(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9920(%rsp)
	vmovdqu	1012(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9952(%rsp)
	vmovdqu	1034(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 9984(%rsp)
	vmovdqu	1056(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10016(%rsp)
	vmovdqu	1078(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10048(%rsp)
	vmovdqu	1100(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10080(%rsp)
	vmovdqu	1122(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10112(%rsp)
	vmovdqu	1144(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10144(%rsp)
	vmovdqu	1166(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10176(%rsp)
	vmovdqu	1188(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10208(%rsp)
	vmovdqu	1210(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10240(%rsp)
	vmovdqu	1232(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10272(%rsp)
	vmovdqu	1254(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10304(%rsp)
	vmovdqu	1276(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10336(%rsp)
	vmovdqu	1298(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10368(%rsp)
	vmovdqu	1320(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10400(%rsp)
	vmovdqu	1342(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10432(%rsp)
	vmovdqu	1364(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm6
	vpsrlvd	%ymm2, %ymm6, %ymm6
	vpsrlvq	%ymm3, %ymm6, %ymm6
	vpmullw	%ymm4, %ymm6, %ymm6
	vpsrlw	$1, %ymm6, %ymm6
	vpand	%ymm5, %ymm6, %ymm6
	vpmulhrsw	%ymm0, %ymm6, %ymm6
	vmovdqu	%ymm6, 10464(%rsp)
	vmovdqu	1386(%rax), %ymm6
	vpermq	$148, %ymm6, %ymm6
	vpshufb	%ymm1, %ymm6, %ymm1
	vpsrlvd	%ymm2, %ymm1, %ymm1
	vpsrlvq	%ymm3, %ymm1, %ymm1
	vpmullw	%ymm4, %ymm1, %ymm1
	vpsrlw	$1, %ymm1, %ymm1
	vpand	%ymm5, %ymm1, %ymm1
	vpmulhrsw	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, 10496(%rsp)
	leaq	160(%rsp), %rsi
	leaq	1408(%rax), %rax
	leaq	-24(%rsp), %rsp
	call	L_i_poly_decompress$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$85:
	leaq	24(%rsp), %rsp
	movq	(%rdx), %rax
	movq	%rax, 2208(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 2216(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 2224(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 2232(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 2240(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 2248(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 2256(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 2264(%rsp)
	movq	64(%rdx), %rax
	movq	%rax, 2272(%rsp)
	movq	72(%rdx), %rax
	movq	%rax, 2280(%rsp)
	movq	80(%rdx), %rax
	movq	%rax, 2288(%rsp)
	movq	88(%rdx), %rax
	movq	%rax, 2296(%rsp)
	movq	96(%rdx), %rax
	movq	%rax, 2304(%rsp)
	movq	104(%rdx), %rax
	movq	%rax, 2312(%rsp)
	movq	112(%rdx), %rax
	movq	%rax, 2320(%rsp)
	movq	120(%rdx), %rax
	movq	%rax, 2328(%rsp)
	movq	128(%rdx), %rax
	movq	%rax, 2336(%rsp)
	movq	136(%rdx), %rax
	movq	%rax, 2344(%rsp)
	movq	144(%rdx), %rax
	movq	%rax, 2352(%rsp)
	movq	152(%rdx), %rax
	movq	%rax, 2360(%rsp)
	movq	160(%rdx), %rax
	movq	%rax, 2368(%rsp)
	movq	168(%rdx), %rax
	movq	%rax, 2376(%rsp)
	movq	176(%rdx), %rax
	movq	%rax, 2384(%rsp)
	movq	184(%rdx), %rax
	movq	%rax, 2392(%rsp)
	movq	192(%rdx), %rax
	movq	%rax, 2400(%rsp)
	movq	200(%rdx), %rax
	movq	%rax, 2408(%rsp)
	movq	208(%rdx), %rax
	movq	%rax, 2416(%rsp)
	movq	216(%rdx), %rax
	movq	%rax, 2424(%rsp)
	movq	224(%rdx), %rax
	movq	%rax, 2432(%rsp)
	movq	232(%rdx), %rax
	movq	%rax, 2440(%rsp)
	movq	240(%rdx), %rax
	movq	%rax, 2448(%rsp)
	movq	248(%rdx), %rax
	movq	%rax, 2456(%rsp)
	movq	256(%rdx), %rax
	movq	%rax, 2464(%rsp)
	movq	264(%rdx), %rax
	movq	%rax, 2472(%rsp)
	movq	272(%rdx), %rax
	movq	%rax, 2480(%rsp)
	movq	280(%rdx), %rax
	movq	%rax, 2488(%rsp)
	movq	288(%rdx), %rax
	movq	%rax, 2496(%rsp)
	movq	296(%rdx), %rax
	movq	%rax, 2504(%rsp)
	movq	304(%rdx), %rax
	movq	%rax, 2512(%rsp)
	movq	312(%rdx), %rax
	movq	%rax, 2520(%rsp)
	movq	320(%rdx), %rax
	movq	%rax, 2528(%rsp)
	movq	328(%rdx), %rax
	movq	%rax, 2536(%rsp)
	movq	336(%rdx), %rax
	movq	%rax, 2544(%rsp)
	movq	344(%rdx), %rax
	movq	%rax, 2552(%rsp)
	movq	352(%rdx), %rax
	movq	%rax, 2560(%rsp)
	movq	360(%rdx), %rax
	movq	%rax, 2568(%rsp)
	movq	368(%rdx), %rax
	movq	%rax, 2576(%rsp)
	movq	376(%rdx), %rax
	movq	%rax, 2584(%rsp)
	movq	384(%rdx), %rax
	movq	%rax, 2592(%rsp)
	movq	392(%rdx), %rax
	movq	%rax, 2600(%rsp)
	movq	400(%rdx), %rax
	movq	%rax, 2608(%rsp)
	movq	408(%rdx), %rax
	movq	%rax, 2616(%rsp)
	movq	416(%rdx), %rax
	movq	%rax, 2624(%rsp)
	movq	424(%rdx), %rax
	movq	%rax, 2632(%rsp)
	movq	432(%rdx), %rax
	movq	%rax, 2640(%rsp)
	movq	440(%rdx), %rax
	movq	%rax, 2648(%rsp)
	movq	448(%rdx), %rax
	movq	%rax, 2656(%rsp)
	movq	456(%rdx), %rax
	movq	%rax, 2664(%rsp)
	movq	464(%rdx), %rax
	movq	%rax, 2672(%rsp)
	movq	472(%rdx), %rax
	movq	%rax, 2680(%rsp)
	movq	480(%rdx), %rax
	movq	%rax, 2688(%rsp)
	movq	488(%rdx), %rax
	movq	%rax, 2696(%rsp)
	movq	496(%rdx), %rax
	movq	%rax, 2704(%rsp)
	movq	504(%rdx), %rax
	movq	%rax, 2712(%rsp)
	movq	512(%rdx), %rax
	movq	%rax, 2720(%rsp)
	movq	520(%rdx), %rax
	movq	%rax, 2728(%rsp)
	movq	528(%rdx), %rax
	movq	%rax, 2736(%rsp)
	movq	536(%rdx), %rax
	movq	%rax, 2744(%rsp)
	movq	544(%rdx), %rax
	movq	%rax, 2752(%rsp)
	movq	552(%rdx), %rax
	movq	%rax, 2760(%rsp)
	movq	560(%rdx), %rax
	movq	%rax, 2768(%rsp)
	movq	568(%rdx), %rax
	movq	%rax, 2776(%rsp)
	movq	576(%rdx), %rax
	movq	%rax, 2784(%rsp)
	movq	584(%rdx), %rax
	movq	%rax, 2792(%rsp)
	movq	592(%rdx), %rax
	movq	%rax, 2800(%rsp)
	movq	600(%rdx), %rax
	movq	%rax, 2808(%rsp)
	movq	608(%rdx), %rax
	movq	%rax, 2816(%rsp)
	movq	616(%rdx), %rax
	movq	%rax, 2824(%rsp)
	movq	624(%rdx), %rax
	movq	%rax, 2832(%rsp)
	movq	632(%rdx), %rax
	movq	%rax, 2840(%rsp)
	movq	640(%rdx), %rax
	movq	%rax, 2848(%rsp)
	movq	648(%rdx), %rax
	movq	%rax, 2856(%rsp)
	movq	656(%rdx), %rax
	movq	%rax, 2864(%rsp)
	movq	664(%rdx), %rax
	movq	%rax, 2872(%rsp)
	movq	672(%rdx), %rax
	movq	%rax, 2880(%rsp)
	movq	680(%rdx), %rax
	movq	%rax, 2888(%rsp)
	movq	688(%rdx), %rax
	movq	%rax, 2896(%rsp)
	movq	696(%rdx), %rax
	movq	%rax, 2904(%rsp)
	movq	704(%rdx), %rax
	movq	%rax, 2912(%rsp)
	movq	712(%rdx), %rax
	movq	%rax, 2920(%rsp)
	movq	720(%rdx), %rax
	movq	%rax, 2928(%rsp)
	movq	728(%rdx), %rax
	movq	%rax, 2936(%rsp)
	movq	736(%rdx), %rax
	movq	%rax, 2944(%rsp)
	movq	744(%rdx), %rax
	movq	%rax, 2952(%rsp)
	movq	752(%rdx), %rax
	movq	%rax, 2960(%rsp)
	movq	760(%rdx), %rax
	movq	%rax, 2968(%rsp)
	movq	768(%rdx), %rax
	movq	%rax, 2976(%rsp)
	movq	776(%rdx), %rax
	movq	%rax, 2984(%rsp)
	movq	784(%rdx), %rax
	movq	%rax, 2992(%rsp)
	movq	792(%rdx), %rax
	movq	%rax, 3000(%rsp)
	movq	800(%rdx), %rax
	movq	%rax, 3008(%rsp)
	movq	808(%rdx), %rax
	movq	%rax, 3016(%rsp)
	movq	816(%rdx), %rax
	movq	%rax, 3024(%rsp)
	movq	824(%rdx), %rax
	movq	%rax, 3032(%rsp)
	movq	832(%rdx), %rax
	movq	%rax, 3040(%rsp)
	movq	840(%rdx), %rax
	movq	%rax, 3048(%rsp)
	movq	848(%rdx), %rax
	movq	%rax, 3056(%rsp)
	movq	856(%rdx), %rax
	movq	%rax, 3064(%rsp)
	movq	864(%rdx), %rax
	movq	%rax, 3072(%rsp)
	movq	872(%rdx), %rax
	movq	%rax, 3080(%rsp)
	movq	880(%rdx), %rax
	movq	%rax, 3088(%rsp)
	movq	888(%rdx), %rax
	movq	%rax, 3096(%rsp)
	movq	896(%rdx), %rax
	movq	%rax, 3104(%rsp)
	movq	904(%rdx), %rax
	movq	%rax, 3112(%rsp)
	movq	912(%rdx), %rax
	movq	%rax, 3120(%rsp)
	movq	920(%rdx), %rax
	movq	%rax, 3128(%rsp)
	movq	928(%rdx), %rax
	movq	%rax, 3136(%rsp)
	movq	936(%rdx), %rax
	movq	%rax, 3144(%rsp)
	movq	944(%rdx), %rax
	movq	%rax, 3152(%rsp)
	movq	952(%rdx), %rax
	movq	%rax, 3160(%rsp)
	movq	960(%rdx), %rax
	movq	%rax, 3168(%rsp)
	movq	968(%rdx), %rax
	movq	%rax, 3176(%rsp)
	movq	976(%rdx), %rax
	movq	%rax, 3184(%rsp)
	movq	984(%rdx), %rax
	movq	%rax, 3192(%rsp)
	movq	992(%rdx), %rax
	movq	%rax, 3200(%rsp)
	movq	1000(%rdx), %rax
	movq	%rax, 3208(%rsp)
	movq	1008(%rdx), %rax
	movq	%rax, 3216(%rsp)
	movq	1016(%rdx), %rax
	movq	%rax, 3224(%rsp)
	movq	1024(%rdx), %rax
	movq	%rax, 3232(%rsp)
	movq	1032(%rdx), %rax
	movq	%rax, 3240(%rsp)
	movq	1040(%rdx), %rax
	movq	%rax, 3248(%rsp)
	movq	1048(%rdx), %rax
	movq	%rax, 3256(%rsp)
	movq	1056(%rdx), %rax
	movq	%rax, 3264(%rsp)
	movq	1064(%rdx), %rax
	movq	%rax, 3272(%rsp)
	movq	1072(%rdx), %rax
	movq	%rax, 3280(%rsp)
	movq	1080(%rdx), %rax
	movq	%rax, 3288(%rsp)
	movq	1088(%rdx), %rax
	movq	%rax, 3296(%rsp)
	movq	1096(%rdx), %rax
	movq	%rax, 3304(%rsp)
	movq	1104(%rdx), %rax
	movq	%rax, 3312(%rsp)
	movq	1112(%rdx), %rax
	movq	%rax, 3320(%rsp)
	movq	1120(%rdx), %rax
	movq	%rax, 3328(%rsp)
	movq	1128(%rdx), %rax
	movq	%rax, 3336(%rsp)
	movq	1136(%rdx), %rax
	movq	%rax, 3344(%rsp)
	movq	1144(%rdx), %rax
	movq	%rax, 3352(%rsp)
	movq	1152(%rdx), %rax
	movq	%rax, 3360(%rsp)
	movq	1160(%rdx), %rax
	movq	%rax, 3368(%rsp)
	movq	1168(%rdx), %rax
	movq	%rax, 3376(%rsp)
	movq	1176(%rdx), %rax
	movq	%rax, 3384(%rsp)
	movq	1184(%rdx), %rax
	movq	%rax, 3392(%rsp)
	movq	1192(%rdx), %rax
	movq	%rax, 3400(%rsp)
	movq	1200(%rdx), %rax
	movq	%rax, 3408(%rsp)
	movq	1208(%rdx), %rax
	movq	%rax, 3416(%rsp)
	movq	1216(%rdx), %rax
	movq	%rax, 3424(%rsp)
	movq	1224(%rdx), %rax
	movq	%rax, 3432(%rsp)
	movq	1232(%rdx), %rax
	movq	%rax, 3440(%rsp)
	movq	1240(%rdx), %rax
	movq	%rax, 3448(%rsp)
	movq	1248(%rdx), %rax
	movq	%rax, 3456(%rsp)
	movq	1256(%rdx), %rax
	movq	%rax, 3464(%rsp)
	movq	1264(%rdx), %rax
	movq	%rax, 3472(%rsp)
	movq	1272(%rdx), %rax
	movq	%rax, 3480(%rsp)
	movq	1280(%rdx), %rax
	movq	%rax, 3488(%rsp)
	movq	1288(%rdx), %rax
	movq	%rax, 3496(%rsp)
	movq	1296(%rdx), %rax
	movq	%rax, 3504(%rsp)
	movq	1304(%rdx), %rax
	movq	%rax, 3512(%rsp)
	movq	1312(%rdx), %rax
	movq	%rax, 3520(%rsp)
	movq	1320(%rdx), %rax
	movq	%rax, 3528(%rsp)
	movq	1328(%rdx), %rax
	movq	%rax, 3536(%rsp)
	movq	1336(%rdx), %rax
	movq	%rax, 3544(%rsp)
	movq	1344(%rdx), %rax
	movq	%rax, 3552(%rsp)
	movq	1352(%rdx), %rax
	movq	%rax, 3560(%rsp)
	movq	1360(%rdx), %rax
	movq	%rax, 3568(%rsp)
	movq	1368(%rdx), %rax
	movq	%rax, 3576(%rsp)
	movq	1376(%rdx), %rax
	movq	%rax, 3584(%rsp)
	movq	1384(%rdx), %rax
	movq	%rax, 3592(%rsp)
	movq	1392(%rdx), %rax
	movq	%rax, 3600(%rsp)
	movq	1400(%rdx), %rax
	movq	%rax, 3608(%rsp)
	movq	1408(%rdx), %rax
	movq	%rax, 3616(%rsp)
	movq	1416(%rdx), %rax
	movq	%rax, 3624(%rsp)
	movq	1424(%rdx), %rax
	movq	%rax, 3632(%rsp)
	movq	1432(%rdx), %rax
	movq	%rax, 3640(%rsp)
	movq	1440(%rdx), %rax
	movq	%rax, 3648(%rsp)
	movq	1448(%rdx), %rax
	movq	%rax, 3656(%rsp)
	movq	1456(%rdx), %rax
	movq	%rax, 3664(%rsp)
	movq	1464(%rdx), %rax
	movq	%rax, 3672(%rsp)
	movq	1472(%rdx), %rax
	movq	%rax, 3680(%rsp)
	movq	1480(%rdx), %rax
	movq	%rax, 3688(%rsp)
	movq	1488(%rdx), %rax
	movq	%rax, 3696(%rsp)
	movq	1496(%rdx), %rax
	movq	%rax, 3704(%rsp)
	movq	1504(%rdx), %rax
	movq	%rax, 3712(%rsp)
	movq	1512(%rdx), %rax
	movq	%rax, 3720(%rsp)
	movq	1520(%rdx), %rax
	movq	%rax, 3728(%rsp)
	movq	1528(%rdx), %rax
	movq	%rax, 3736(%rsp)
	leaq	10528(%rsp), %rsi
	leaq	2208(%rsp), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$84:
	leaq	11040(%rsp), %rsi
	leaq	2592(%rsp), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$83:
	leaq	11552(%rsp), %rsi
	leaq	2976(%rsp), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$82:
	leaq	12064(%rsp), %rsi
	leaq	3360(%rsp), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$81:
	leaq	8480(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$80:
	leaq	8992(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$79:
	leaq	9504(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$78:
	leaq	10016(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$77:
	leaq	672(%rsp), %rax
	leaq	10528(%rsp), %rdx
	leaq	8480(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$76:
	leaq	1184(%rsp), %rax
	leaq	11040(%rsp), %rdx
	leaq	8992(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$75:
	leaq	672(%rsp), %rax
	leaq	1184(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$74:
	leaq	1184(%rsp), %rax
	leaq	11552(%rsp), %rdx
	leaq	9504(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$73:
	leaq	672(%rsp), %rax
	leaq	1184(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$72:
	leaq	1184(%rsp), %rax
	leaq	12064(%rsp), %rdx
	leaq	10016(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$71:
	leaq	672(%rsp), %rax
	leaq	1184(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$70:
	leaq	672(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$69:
	leaq	1184(%rsp), %rax
	leaq	160(%rsp), %rdx
	leaq	672(%rsp), %rsi
	call	L_poly_sub$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$68:
	leaq	1184(%rsp), %rax
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
	leaq	1184(%rsp), %rdx
	call	L_i_poly_tomsg$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$67:
	movq	31184(%rsp), %rax
	movq	%rax, 64(%rsp)
	movq	31192(%rsp), %rax
	movq	%rax, 72(%rsp)
	movq	31200(%rsp), %rax
	movq	%rax, 80(%rsp)
	movq	31208(%rsp), %rax
	movq	%rax, 88(%rsp)
	leaq	96(%rsp), %rcx
	leaq	32(%rsp), %rdx
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$66:
	leaq	5312(%rsp), %rcx
	leaq	32(%rsp), %rdx
	leaq	29616(%rsp), %rax
	leaq	128(%rsp), %r8
	movq	%rcx, %mm2
	movq	%rax, %rcx
	movq	(%rcx), %rsi
	movq	%rsi, 2208(%rsp)
	movq	8(%rcx), %rsi
	movq	%rsi, 2216(%rsp)
	movq	16(%rcx), %rsi
	movq	%rsi, 2224(%rsp)
	movq	24(%rcx), %rsi
	movq	%rsi, 2232(%rsp)
	movq	32(%rcx), %rsi
	movq	%rsi, 2240(%rsp)
	movq	40(%rcx), %rsi
	movq	%rsi, 2248(%rsp)
	movq	48(%rcx), %rsi
	movq	%rsi, 2256(%rsp)
	movq	56(%rcx), %rsi
	movq	%rsi, 2264(%rsp)
	movq	64(%rcx), %rsi
	movq	%rsi, 2272(%rsp)
	movq	72(%rcx), %rsi
	movq	%rsi, 2280(%rsp)
	movq	80(%rcx), %rsi
	movq	%rsi, 2288(%rsp)
	movq	88(%rcx), %rsi
	movq	%rsi, 2296(%rsp)
	movq	96(%rcx), %rsi
	movq	%rsi, 2304(%rsp)
	movq	104(%rcx), %rsi
	movq	%rsi, 2312(%rsp)
	movq	112(%rcx), %rsi
	movq	%rsi, 2320(%rsp)
	movq	120(%rcx), %rsi
	movq	%rsi, 2328(%rsp)
	movq	128(%rcx), %rsi
	movq	%rsi, 2336(%rsp)
	movq	136(%rcx), %rsi
	movq	%rsi, 2344(%rsp)
	movq	144(%rcx), %rsi
	movq	%rsi, 2352(%rsp)
	movq	152(%rcx), %rsi
	movq	%rsi, 2360(%rsp)
	movq	160(%rcx), %rsi
	movq	%rsi, 2368(%rsp)
	movq	168(%rcx), %rsi
	movq	%rsi, 2376(%rsp)
	movq	176(%rcx), %rsi
	movq	%rsi, 2384(%rsp)
	movq	184(%rcx), %rsi
	movq	%rsi, 2392(%rsp)
	movq	192(%rcx), %rsi
	movq	%rsi, 2400(%rsp)
	movq	200(%rcx), %rsi
	movq	%rsi, 2408(%rsp)
	movq	208(%rcx), %rsi
	movq	%rsi, 2416(%rsp)
	movq	216(%rcx), %rsi
	movq	%rsi, 2424(%rsp)
	movq	224(%rcx), %rsi
	movq	%rsi, 2432(%rsp)
	movq	232(%rcx), %rsi
	movq	%rsi, 2440(%rsp)
	movq	240(%rcx), %rsi
	movq	%rsi, 2448(%rsp)
	movq	248(%rcx), %rsi
	movq	%rsi, 2456(%rsp)
	movq	256(%rcx), %rsi
	movq	%rsi, 2464(%rsp)
	movq	264(%rcx), %rsi
	movq	%rsi, 2472(%rsp)
	movq	272(%rcx), %rsi
	movq	%rsi, 2480(%rsp)
	movq	280(%rcx), %rsi
	movq	%rsi, 2488(%rsp)
	movq	288(%rcx), %rsi
	movq	%rsi, 2496(%rsp)
	movq	296(%rcx), %rsi
	movq	%rsi, 2504(%rsp)
	movq	304(%rcx), %rsi
	movq	%rsi, 2512(%rsp)
	movq	312(%rcx), %rsi
	movq	%rsi, 2520(%rsp)
	movq	320(%rcx), %rsi
	movq	%rsi, 2528(%rsp)
	movq	328(%rcx), %rsi
	movq	%rsi, 2536(%rsp)
	movq	336(%rcx), %rsi
	movq	%rsi, 2544(%rsp)
	movq	344(%rcx), %rsi
	movq	%rsi, 2552(%rsp)
	movq	352(%rcx), %rsi
	movq	%rsi, 2560(%rsp)
	movq	360(%rcx), %rsi
	movq	%rsi, 2568(%rsp)
	movq	368(%rcx), %rsi
	movq	%rsi, 2576(%rsp)
	movq	376(%rcx), %rsi
	movq	%rsi, 2584(%rsp)
	movq	384(%rcx), %rsi
	movq	%rsi, 2592(%rsp)
	movq	392(%rcx), %rsi
	movq	%rsi, 2600(%rsp)
	movq	400(%rcx), %rsi
	movq	%rsi, 2608(%rsp)
	movq	408(%rcx), %rsi
	movq	%rsi, 2616(%rsp)
	movq	416(%rcx), %rsi
	movq	%rsi, 2624(%rsp)
	movq	424(%rcx), %rsi
	movq	%rsi, 2632(%rsp)
	movq	432(%rcx), %rsi
	movq	%rsi, 2640(%rsp)
	movq	440(%rcx), %rsi
	movq	%rsi, 2648(%rsp)
	movq	448(%rcx), %rsi
	movq	%rsi, 2656(%rsp)
	movq	456(%rcx), %rsi
	movq	%rsi, 2664(%rsp)
	movq	464(%rcx), %rsi
	movq	%rsi, 2672(%rsp)
	movq	472(%rcx), %rsi
	movq	%rsi, 2680(%rsp)
	movq	480(%rcx), %rsi
	movq	%rsi, 2688(%rsp)
	movq	488(%rcx), %rsi
	movq	%rsi, 2696(%rsp)
	movq	496(%rcx), %rsi
	movq	%rsi, 2704(%rsp)
	movq	504(%rcx), %rsi
	movq	%rsi, 2712(%rsp)
	movq	512(%rcx), %rsi
	movq	%rsi, 2720(%rsp)
	movq	520(%rcx), %rsi
	movq	%rsi, 2728(%rsp)
	movq	528(%rcx), %rsi
	movq	%rsi, 2736(%rsp)
	movq	536(%rcx), %rsi
	movq	%rsi, 2744(%rsp)
	movq	544(%rcx), %rsi
	movq	%rsi, 2752(%rsp)
	movq	552(%rcx), %rsi
	movq	%rsi, 2760(%rsp)
	movq	560(%rcx), %rsi
	movq	%rsi, 2768(%rsp)
	movq	568(%rcx), %rsi
	movq	%rsi, 2776(%rsp)
	movq	576(%rcx), %rsi
	movq	%rsi, 2784(%rsp)
	movq	584(%rcx), %rsi
	movq	%rsi, 2792(%rsp)
	movq	592(%rcx), %rsi
	movq	%rsi, 2800(%rsp)
	movq	600(%rcx), %rsi
	movq	%rsi, 2808(%rsp)
	movq	608(%rcx), %rsi
	movq	%rsi, 2816(%rsp)
	movq	616(%rcx), %rsi
	movq	%rsi, 2824(%rsp)
	movq	624(%rcx), %rsi
	movq	%rsi, 2832(%rsp)
	movq	632(%rcx), %rsi
	movq	%rsi, 2840(%rsp)
	movq	640(%rcx), %rsi
	movq	%rsi, 2848(%rsp)
	movq	648(%rcx), %rsi
	movq	%rsi, 2856(%rsp)
	movq	656(%rcx), %rsi
	movq	%rsi, 2864(%rsp)
	movq	664(%rcx), %rsi
	movq	%rsi, 2872(%rsp)
	movq	672(%rcx), %rsi
	movq	%rsi, 2880(%rsp)
	movq	680(%rcx), %rsi
	movq	%rsi, 2888(%rsp)
	movq	688(%rcx), %rsi
	movq	%rsi, 2896(%rsp)
	movq	696(%rcx), %rsi
	movq	%rsi, 2904(%rsp)
	movq	704(%rcx), %rsi
	movq	%rsi, 2912(%rsp)
	movq	712(%rcx), %rsi
	movq	%rsi, 2920(%rsp)
	movq	720(%rcx), %rsi
	movq	%rsi, 2928(%rsp)
	movq	728(%rcx), %rsi
	movq	%rsi, 2936(%rsp)
	movq	736(%rcx), %rsi
	movq	%rsi, 2944(%rsp)
	movq	744(%rcx), %rsi
	movq	%rsi, 2952(%rsp)
	movq	752(%rcx), %rsi
	movq	%rsi, 2960(%rsp)
	movq	760(%rcx), %rsi
	movq	%rsi, 2968(%rsp)
	movq	768(%rcx), %rsi
	movq	%rsi, 2976(%rsp)
	movq	776(%rcx), %rsi
	movq	%rsi, 2984(%rsp)
	movq	784(%rcx), %rsi
	movq	%rsi, 2992(%rsp)
	movq	792(%rcx), %rsi
	movq	%rsi, 3000(%rsp)
	movq	800(%rcx), %rsi
	movq	%rsi, 3008(%rsp)
	movq	808(%rcx), %rsi
	movq	%rsi, 3016(%rsp)
	movq	816(%rcx), %rsi
	movq	%rsi, 3024(%rsp)
	movq	824(%rcx), %rsi
	movq	%rsi, 3032(%rsp)
	movq	832(%rcx), %rsi
	movq	%rsi, 3040(%rsp)
	movq	840(%rcx), %rsi
	movq	%rsi, 3048(%rsp)
	movq	848(%rcx), %rsi
	movq	%rsi, 3056(%rsp)
	movq	856(%rcx), %rsi
	movq	%rsi, 3064(%rsp)
	movq	864(%rcx), %rsi
	movq	%rsi, 3072(%rsp)
	movq	872(%rcx), %rsi
	movq	%rsi, 3080(%rsp)
	movq	880(%rcx), %rsi
	movq	%rsi, 3088(%rsp)
	movq	888(%rcx), %rsi
	movq	%rsi, 3096(%rsp)
	movq	896(%rcx), %rsi
	movq	%rsi, 3104(%rsp)
	movq	904(%rcx), %rsi
	movq	%rsi, 3112(%rsp)
	movq	912(%rcx), %rsi
	movq	%rsi, 3120(%rsp)
	movq	920(%rcx), %rsi
	movq	%rsi, 3128(%rsp)
	movq	928(%rcx), %rsi
	movq	%rsi, 3136(%rsp)
	movq	936(%rcx), %rsi
	movq	%rsi, 3144(%rsp)
	movq	944(%rcx), %rsi
	movq	%rsi, 3152(%rsp)
	movq	952(%rcx), %rsi
	movq	%rsi, 3160(%rsp)
	movq	960(%rcx), %rsi
	movq	%rsi, 3168(%rsp)
	movq	968(%rcx), %rsi
	movq	%rsi, 3176(%rsp)
	movq	976(%rcx), %rsi
	movq	%rsi, 3184(%rsp)
	movq	984(%rcx), %rsi
	movq	%rsi, 3192(%rsp)
	movq	992(%rcx), %rsi
	movq	%rsi, 3200(%rsp)
	movq	1000(%rcx), %rsi
	movq	%rsi, 3208(%rsp)
	movq	1008(%rcx), %rsi
	movq	%rsi, 3216(%rsp)
	movq	1016(%rcx), %rsi
	movq	%rsi, 3224(%rsp)
	movq	1024(%rcx), %rsi
	movq	%rsi, 3232(%rsp)
	movq	1032(%rcx), %rsi
	movq	%rsi, 3240(%rsp)
	movq	1040(%rcx), %rsi
	movq	%rsi, 3248(%rsp)
	movq	1048(%rcx), %rsi
	movq	%rsi, 3256(%rsp)
	movq	1056(%rcx), %rsi
	movq	%rsi, 3264(%rsp)
	movq	1064(%rcx), %rsi
	movq	%rsi, 3272(%rsp)
	movq	1072(%rcx), %rsi
	movq	%rsi, 3280(%rsp)
	movq	1080(%rcx), %rsi
	movq	%rsi, 3288(%rsp)
	movq	1088(%rcx), %rsi
	movq	%rsi, 3296(%rsp)
	movq	1096(%rcx), %rsi
	movq	%rsi, 3304(%rsp)
	movq	1104(%rcx), %rsi
	movq	%rsi, 3312(%rsp)
	movq	1112(%rcx), %rsi
	movq	%rsi, 3320(%rsp)
	movq	1120(%rcx), %rsi
	movq	%rsi, 3328(%rsp)
	movq	1128(%rcx), %rsi
	movq	%rsi, 3336(%rsp)
	movq	1136(%rcx), %rsi
	movq	%rsi, 3344(%rsp)
	movq	1144(%rcx), %rsi
	movq	%rsi, 3352(%rsp)
	movq	1152(%rcx), %rsi
	movq	%rsi, 3360(%rsp)
	movq	1160(%rcx), %rsi
	movq	%rsi, 3368(%rsp)
	movq	1168(%rcx), %rsi
	movq	%rsi, 3376(%rsp)
	movq	1176(%rcx), %rsi
	movq	%rsi, 3384(%rsp)
	movq	1184(%rcx), %rsi
	movq	%rsi, 3392(%rsp)
	movq	1192(%rcx), %rsi
	movq	%rsi, 3400(%rsp)
	movq	1200(%rcx), %rsi
	movq	%rsi, 3408(%rsp)
	movq	1208(%rcx), %rsi
	movq	%rsi, 3416(%rsp)
	movq	1216(%rcx), %rsi
	movq	%rsi, 3424(%rsp)
	movq	1224(%rcx), %rsi
	movq	%rsi, 3432(%rsp)
	movq	1232(%rcx), %rsi
	movq	%rsi, 3440(%rsp)
	movq	1240(%rcx), %rsi
	movq	%rsi, 3448(%rsp)
	movq	1248(%rcx), %rsi
	movq	%rsi, 3456(%rsp)
	movq	1256(%rcx), %rsi
	movq	%rsi, 3464(%rsp)
	movq	1264(%rcx), %rsi
	movq	%rsi, 3472(%rsp)
	movq	1272(%rcx), %rsi
	movq	%rsi, 3480(%rsp)
	movq	1280(%rcx), %rsi
	movq	%rsi, 3488(%rsp)
	movq	1288(%rcx), %rsi
	movq	%rsi, 3496(%rsp)
	movq	1296(%rcx), %rsi
	movq	%rsi, 3504(%rsp)
	movq	1304(%rcx), %rsi
	movq	%rsi, 3512(%rsp)
	movq	1312(%rcx), %rsi
	movq	%rsi, 3520(%rsp)
	movq	1320(%rcx), %rsi
	movq	%rsi, 3528(%rsp)
	movq	1328(%rcx), %rsi
	movq	%rsi, 3536(%rsp)
	movq	1336(%rcx), %rsi
	movq	%rsi, 3544(%rsp)
	movq	1344(%rcx), %rsi
	movq	%rsi, 3552(%rsp)
	movq	1352(%rcx), %rsi
	movq	%rsi, 3560(%rsp)
	movq	1360(%rcx), %rsi
	movq	%rsi, 3568(%rsp)
	movq	1368(%rcx), %rsi
	movq	%rsi, 3576(%rsp)
	movq	1376(%rcx), %rsi
	movq	%rsi, 3584(%rsp)
	movq	1384(%rcx), %rsi
	movq	%rsi, 3592(%rsp)
	movq	1392(%rcx), %rsi
	movq	%rsi, 3600(%rsp)
	movq	1400(%rcx), %rsi
	movq	%rsi, 3608(%rsp)
	movq	1408(%rcx), %rsi
	movq	%rsi, 3616(%rsp)
	movq	1416(%rcx), %rsi
	movq	%rsi, 3624(%rsp)
	movq	1424(%rcx), %rsi
	movq	%rsi, 3632(%rsp)
	movq	1432(%rcx), %rsi
	movq	%rsi, 3640(%rsp)
	movq	1440(%rcx), %rsi
	movq	%rsi, 3648(%rsp)
	movq	1448(%rcx), %rsi
	movq	%rsi, 3656(%rsp)
	movq	1456(%rcx), %rsi
	movq	%rsi, 3664(%rsp)
	movq	1464(%rcx), %rsi
	movq	%rsi, 3672(%rsp)
	movq	1472(%rcx), %rsi
	movq	%rsi, 3680(%rsp)
	movq	1480(%rcx), %rsi
	movq	%rsi, 3688(%rsp)
	movq	1488(%rcx), %rsi
	movq	%rsi, 3696(%rsp)
	movq	1496(%rcx), %rsi
	movq	%rsi, 3704(%rsp)
	movq	1504(%rcx), %rsi
	movq	%rsi, 3712(%rsp)
	movq	1512(%rcx), %rsi
	movq	%rsi, 3720(%rsp)
	movq	1520(%rcx), %rsi
	movq	%rsi, 3728(%rsp)
	movq	1528(%rcx), %rcx
	movq	%rcx, 3736(%rsp)
	leaq	8480(%rsp), %rsi
	leaq	2208(%rsp), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$65:
	leaq	8992(%rsp), %rsi
	leaq	2592(%rsp), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$64:
	leaq	9504(%rsp), %rsi
	leaq	2976(%rsp), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$63:
	leaq	10016(%rsp), %rsi
	leaq	3360(%rsp), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$62:
	movq	1536(%rax), %rcx
	movq	%rcx, 24880(%rsp)
	movq	1544(%rax), %rcx
	movq	%rcx, 24888(%rsp)
	movq	1552(%rax), %rcx
	movq	%rcx, 24896(%rsp)
	movq	1560(%rax), %rax
	movq	%rax, 24904(%rsp)
	leaq	1184(%rsp), %rax
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$61:
	movq	%r8, %mm3
	movq	$1, %rcx
	leaq	16672(%rsp), %rax
	leaq	24880(%rsp), %rsi
	leaq	-2168(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$60:
	leaq	2168(%rsp), %rsp
	movq	%mm3, %r9
	movb	$0, %bpl
	leaq	10528(%rsp), %rdx
	leaq	11040(%rsp), %r10
	leaq	11552(%rsp), %r11
	leaq	12064(%rsp), %rbx
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$59:
	leaq	600(%rsp), %rsp
	movq	%mm3, %r9
	movb	$4, %bpl
	leaq	12576(%rsp), %rdx
	leaq	13088(%rsp), %r10
	leaq	13600(%rsp), %r11
	leaq	14112(%rsp), %rbx
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$58:
	leaq	600(%rsp), %rsp
	movb	$8, %al
	leaq	672(%rsp), %rcx
	leaq	-184(%rsp), %rsp
	call	L_poly_getnoise_eta2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$57:
	leaq	184(%rsp), %rsp
	leaq	10528(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$56:
	leaq	11040(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$55:
	leaq	11552(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$54:
	leaq	12064(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$53:
	leaq	14624(%rsp), %rax
	leaq	16672(%rsp), %rdx
	leaq	10528(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$52:
	leaq	160(%rsp), %rax
	leaq	17184(%rsp), %rdx
	leaq	11040(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$51:
	leaq	14624(%rsp), %rax
	leaq	160(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$50:
	leaq	160(%rsp), %rax
	leaq	17696(%rsp), %rdx
	leaq	11552(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$49:
	leaq	14624(%rsp), %rax
	leaq	160(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$48:
	leaq	160(%rsp), %rax
	leaq	18208(%rsp), %rdx
	leaq	12064(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$47:
	leaq	14624(%rsp), %rax
	leaq	160(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$46:
	leaq	15136(%rsp), %rax
	leaq	18720(%rsp), %rdx
	leaq	10528(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$45:
	leaq	160(%rsp), %rax
	leaq	19232(%rsp), %rdx
	leaq	11040(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$44:
	leaq	15136(%rsp), %rax
	leaq	160(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$43:
	leaq	160(%rsp), %rax
	leaq	19744(%rsp), %rdx
	leaq	11552(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$42:
	leaq	15136(%rsp), %rax
	leaq	160(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$41:
	leaq	160(%rsp), %rax
	leaq	20256(%rsp), %rdx
	leaq	12064(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$40:
	leaq	15136(%rsp), %rax
	leaq	160(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$39:
	leaq	15648(%rsp), %rax
	leaq	20768(%rsp), %rdx
	leaq	10528(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$38:
	leaq	160(%rsp), %rax
	leaq	21280(%rsp), %rdx
	leaq	11040(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$37:
	leaq	15648(%rsp), %rax
	leaq	160(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$36:
	leaq	160(%rsp), %rax
	leaq	21792(%rsp), %rdx
	leaq	11552(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$35:
	leaq	15648(%rsp), %rax
	leaq	160(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$34:
	leaq	160(%rsp), %rax
	leaq	22304(%rsp), %rdx
	leaq	12064(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$33:
	leaq	15648(%rsp), %rax
	leaq	160(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$32:
	leaq	16160(%rsp), %rax
	leaq	22816(%rsp), %rdx
	leaq	10528(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$31:
	leaq	160(%rsp), %rax
	leaq	23328(%rsp), %rdx
	leaq	11040(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$30:
	leaq	16160(%rsp), %rax
	leaq	160(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$29:
	leaq	160(%rsp), %rax
	leaq	23840(%rsp), %rdx
	leaq	11552(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$28:
	leaq	16160(%rsp), %rax
	leaq	160(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$27:
	leaq	160(%rsp), %rax
	leaq	24352(%rsp), %rdx
	leaq	12064(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$26:
	leaq	16160(%rsp), %rax
	leaq	160(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$25:
	leaq	160(%rsp), %rax
	leaq	8480(%rsp), %rdx
	leaq	10528(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$24:
	leaq	1696(%rsp), %rax
	leaq	8992(%rsp), %rdx
	leaq	11040(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$23:
	leaq	160(%rsp), %rax
	leaq	1696(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$22:
	leaq	1696(%rsp), %rax
	leaq	9504(%rsp), %rdx
	leaq	11552(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$21:
	leaq	160(%rsp), %rax
	leaq	1696(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$20:
	leaq	1696(%rsp), %rax
	leaq	10016(%rsp), %rdx
	leaq	12064(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$19:
	leaq	160(%rsp), %rax
	leaq	1696(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$18:
	leaq	14624(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$17:
	leaq	15136(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$16:
	leaq	15648(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$15:
	leaq	16160(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$14:
	leaq	160(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$13:
	leaq	14624(%rsp), %rax
	leaq	12576(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$12:
	leaq	15136(%rsp), %rax
	leaq	13088(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$11:
	leaq	15648(%rsp), %rax
	leaq	13600(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$10:
	leaq	16160(%rsp), %rax
	leaq	14112(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$9:
	leaq	160(%rsp), %rax
	leaq	672(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$8:
	leaq	160(%rsp), %rax
	leaq	1184(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$7:
	leaq	14624(%rsp), %rax
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
	leaq	15136(%rsp), %rax
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
	leaq	15648(%rsp), %rax
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
	leaq	16160(%rsp), %rax
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
	leaq	160(%rsp), %rax
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
	movq	%rax, %rcx
	leaq	14624(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$6:
	leaq	15136(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$5:
	leaq	15648(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$4:
	leaq	16160(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$3:
	leaq	glob_data + 1120(%rip), %rdx
	vmovdqu	(%rdx), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 5184(%rip), %ymm2
	vpbroadcastw	glob_data + 5182(%rip), %ymm3
	vpbroadcastw	glob_data + 5180(%rip), %ymm4
	vpbroadcastq	glob_data + 4968(%rip), %ymm5
	vpbroadcastq	glob_data + 4960(%rip), %ymm6
	vmovdqu	glob_data + 160(%rip), %ymm7
	vmovdqu	glob_data + 128(%rip), %ymm8
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
	vmovdqu	%xmm10, (%rcx)
	movq	%xmm9, 16(%rcx)
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
	vmovdqu	%xmm10, 22(%rcx)
	movq	%xmm9, 38(%rcx)
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
	vmovdqu	%xmm10, 44(%rcx)
	movq	%xmm9, 60(%rcx)
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
	vmovdqu	%xmm10, 66(%rcx)
	movq	%xmm9, 82(%rcx)
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
	vmovdqu	%xmm10, 88(%rcx)
	movq	%xmm9, 104(%rcx)
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
	vmovdqu	%xmm10, 110(%rcx)
	movq	%xmm9, 126(%rcx)
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
	vmovdqu	%xmm10, 132(%rcx)
	movq	%xmm9, 148(%rcx)
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
	vmovdqu	%xmm10, 154(%rcx)
	movq	%xmm9, 170(%rcx)
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
	vmovdqu	%xmm10, 176(%rcx)
	movq	%xmm9, 192(%rcx)
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
	vmovdqu	%xmm10, 198(%rcx)
	movq	%xmm9, 214(%rcx)
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
	vmovdqu	%xmm10, 220(%rcx)
	movq	%xmm9, 236(%rcx)
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
	vmovdqu	%xmm10, 242(%rcx)
	movq	%xmm9, 258(%rcx)
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
	vmovdqu	%xmm10, 264(%rcx)
	movq	%xmm9, 280(%rcx)
	vmovdqu	15040(%rsp), %ymm9
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
	vmovdqu	%xmm10, 286(%rcx)
	movq	%xmm9, 302(%rcx)
	vmovdqu	15072(%rsp), %ymm9
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
	vmovdqu	%xmm10, 308(%rcx)
	movq	%xmm9, 324(%rcx)
	vmovdqu	15104(%rsp), %ymm9
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
	vmovdqu	%xmm10, 330(%rcx)
	movq	%xmm9, 346(%rcx)
	vmovdqu	15136(%rsp), %ymm9
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
	vmovdqu	%xmm10, 352(%rcx)
	movq	%xmm9, 368(%rcx)
	vmovdqu	15168(%rsp), %ymm9
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
	vmovdqu	%xmm10, 374(%rcx)
	movq	%xmm9, 390(%rcx)
	vmovdqu	15200(%rsp), %ymm9
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
	vmovdqu	%xmm10, 396(%rcx)
	movq	%xmm9, 412(%rcx)
	vmovdqu	15232(%rsp), %ymm9
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
	vmovdqu	%xmm10, 418(%rcx)
	movq	%xmm9, 434(%rcx)
	vmovdqu	15264(%rsp), %ymm9
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
	vmovdqu	%xmm10, 440(%rcx)
	movq	%xmm9, 456(%rcx)
	vmovdqu	15296(%rsp), %ymm9
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
	vmovdqu	%xmm10, 462(%rcx)
	movq	%xmm9, 478(%rcx)
	vmovdqu	15328(%rsp), %ymm9
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
	vmovdqu	%xmm10, 484(%rcx)
	movq	%xmm9, 500(%rcx)
	vmovdqu	15360(%rsp), %ymm9
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
	vmovdqu	%xmm10, 506(%rcx)
	movq	%xmm9, 522(%rcx)
	vmovdqu	15392(%rsp), %ymm9
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
	vmovdqu	%xmm10, 528(%rcx)
	movq	%xmm9, 544(%rcx)
	vmovdqu	15424(%rsp), %ymm9
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
	vmovdqu	%xmm10, 550(%rcx)
	movq	%xmm9, 566(%rcx)
	vmovdqu	15456(%rsp), %ymm9
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
	vmovdqu	%xmm10, 572(%rcx)
	movq	%xmm9, 588(%rcx)
	vmovdqu	15488(%rsp), %ymm9
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
	vmovdqu	%xmm10, 594(%rcx)
	movq	%xmm9, 610(%rcx)
	vmovdqu	15520(%rsp), %ymm9
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
	vmovdqu	%xmm10, 616(%rcx)
	movq	%xmm9, 632(%rcx)
	vmovdqu	15552(%rsp), %ymm9
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
	vmovdqu	%xmm10, 638(%rcx)
	movq	%xmm9, 654(%rcx)
	vmovdqu	15584(%rsp), %ymm9
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
	vmovdqu	%xmm10, 660(%rcx)
	movq	%xmm9, 676(%rcx)
	vmovdqu	15616(%rsp), %ymm9
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
	vmovdqu	%xmm10, 682(%rcx)
	movq	%xmm9, 698(%rcx)
	vmovdqu	15648(%rsp), %ymm9
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
	vmovdqu	%xmm10, 704(%rcx)
	movq	%xmm9, 720(%rcx)
	vmovdqu	15680(%rsp), %ymm9
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
	vmovdqu	%xmm10, 726(%rcx)
	movq	%xmm9, 742(%rcx)
	vmovdqu	15712(%rsp), %ymm9
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
	vmovdqu	%xmm10, 748(%rcx)
	movq	%xmm9, 764(%rcx)
	vmovdqu	15744(%rsp), %ymm9
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
	vmovdqu	%xmm10, 770(%rcx)
	movq	%xmm9, 786(%rcx)
	vmovdqu	15776(%rsp), %ymm9
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
	vmovdqu	%xmm10, 792(%rcx)
	movq	%xmm9, 808(%rcx)
	vmovdqu	15808(%rsp), %ymm9
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
	vmovdqu	%xmm10, 814(%rcx)
	movq	%xmm9, 830(%rcx)
	vmovdqu	15840(%rsp), %ymm9
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
	vmovdqu	%xmm10, 836(%rcx)
	movq	%xmm9, 852(%rcx)
	vmovdqu	15872(%rsp), %ymm9
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
	vmovdqu	%xmm10, 858(%rcx)
	movq	%xmm9, 874(%rcx)
	vmovdqu	15904(%rsp), %ymm9
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
	vmovdqu	%xmm10, 880(%rcx)
	movq	%xmm9, 896(%rcx)
	vmovdqu	15936(%rsp), %ymm9
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
	vmovdqu	%xmm10, 902(%rcx)
	movq	%xmm9, 918(%rcx)
	vmovdqu	15968(%rsp), %ymm9
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
	vmovdqu	%xmm10, 924(%rcx)
	movq	%xmm9, 940(%rcx)
	vmovdqu	16000(%rsp), %ymm9
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
	vmovdqu	%xmm10, 946(%rcx)
	movq	%xmm9, 962(%rcx)
	vmovdqu	16032(%rsp), %ymm9
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
	vmovdqu	%xmm10, 968(%rcx)
	movq	%xmm9, 984(%rcx)
	vmovdqu	16064(%rsp), %ymm9
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
	vmovdqu	%xmm10, 990(%rcx)
	movq	%xmm9, 1006(%rcx)
	vmovdqu	16096(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1012(%rcx)
	movq	%xmm9, 1028(%rcx)
	vmovdqu	16128(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1034(%rcx)
	movq	%xmm9, 1050(%rcx)
	vmovdqu	16160(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1056(%rcx)
	movq	%xmm9, 1072(%rcx)
	vmovdqu	16192(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1078(%rcx)
	movq	%xmm9, 1094(%rcx)
	vmovdqu	16224(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1100(%rcx)
	movq	%xmm9, 1116(%rcx)
	vmovdqu	16256(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1122(%rcx)
	movq	%xmm9, 1138(%rcx)
	vmovdqu	16288(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1144(%rcx)
	movq	%xmm9, 1160(%rcx)
	vmovdqu	16320(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1166(%rcx)
	movq	%xmm9, 1182(%rcx)
	vmovdqu	16352(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1188(%rcx)
	movq	%xmm9, 1204(%rcx)
	vmovdqu	16384(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1210(%rcx)
	movq	%xmm9, 1226(%rcx)
	vmovdqu	16416(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1232(%rcx)
	movq	%xmm9, 1248(%rcx)
	vmovdqu	16448(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1254(%rcx)
	movq	%xmm9, 1270(%rcx)
	vmovdqu	16480(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1276(%rcx)
	movq	%xmm9, 1292(%rcx)
	vmovdqu	16512(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1298(%rcx)
	movq	%xmm9, 1314(%rcx)
	vmovdqu	16544(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1320(%rcx)
	movq	%xmm9, 1336(%rcx)
	vmovdqu	16576(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1342(%rcx)
	movq	%xmm9, 1358(%rcx)
	vmovdqu	16608(%rsp), %ymm9
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
	vmovdqu	%xmm10, 1364(%rcx)
	movq	%xmm9, 1380(%rcx)
	vmovdqu	16640(%rsp), %ymm9
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
	vmovdqu	%xmm1, 1386(%rcx)
	movq	%xmm0, 1402(%rcx)
	leaq	1408(%rax), %rax
	leaq	160(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$2:
	leaq	glob_data + 1120(%rip), %rcx
	vmovdqu	(%rcx), %ymm0
	vpbroadcastw	glob_data + 5190(%rip), %ymm1
	vpbroadcastw	glob_data + 5192(%rip), %ymm2
	vpbroadcastw	glob_data + 5188(%rip), %ymm3
	vpbroadcastd	glob_data + 5176(%rip), %ymm4
	vpbroadcastq	glob_data + 4976(%rip), %ymm5
	vmovdqu	glob_data + 416(%rip), %ymm6
	vmovdqu	(%rdx), %ymm7
	vmovdqu	32(%rdx), %ymm8
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
	vmovdqu	64(%rdx), %ymm7
	vmovdqu	96(%rdx), %ymm8
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
	vmovdqu	128(%rdx), %ymm7
	vmovdqu	160(%rdx), %ymm8
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
	vmovdqu	192(%rdx), %ymm7
	vmovdqu	224(%rdx), %ymm8
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
	vmovdqu	256(%rdx), %ymm7
	vmovdqu	288(%rdx), %ymm8
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
	vmovdqu	320(%rdx), %ymm7
	vmovdqu	352(%rdx), %ymm8
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
	vmovdqu	384(%rdx), %ymm7
	vmovdqu	416(%rdx), %ymm8
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
	vmovdqu	448(%rdx), %ymm7
	vmovdqu	480(%rdx), %ymm8
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
	movq	24872(%rsp), %rax
	leaq	5312(%rsp), %rcx
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
	movq	24872(%rsp), %rax
	movq	31216(%rsp), %rcx
	movq	%rcx, 6880(%rsp)
	movq	31224(%rsp), %rcx
	movq	%rcx, 6888(%rsp)
	movq	31232(%rsp), %rcx
	movq	%rcx, 6896(%rsp)
	movq	31240(%rsp), %rcx
	movq	%rcx, 6904(%rsp)
	movq	(%rax), %rcx
	movq	%rcx, 6912(%rsp)
	movq	8(%rax), %rcx
	movq	%rcx, 6920(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 6928(%rsp)
	movq	24(%rax), %rcx
	movq	%rcx, 6936(%rsp)
	movq	32(%rax), %rcx
	movq	%rcx, 6944(%rsp)
	movq	40(%rax), %rcx
	movq	%rcx, 6952(%rsp)
	movq	48(%rax), %rcx
	movq	%rcx, 6960(%rsp)
	movq	56(%rax), %rcx
	movq	%rcx, 6968(%rsp)
	movq	64(%rax), %rcx
	movq	%rcx, 6976(%rsp)
	movq	72(%rax), %rcx
	movq	%rcx, 6984(%rsp)
	movq	80(%rax), %rcx
	movq	%rcx, 6992(%rsp)
	movq	88(%rax), %rcx
	movq	%rcx, 7000(%rsp)
	movq	96(%rax), %rcx
	movq	%rcx, 7008(%rsp)
	movq	104(%rax), %rcx
	movq	%rcx, 7016(%rsp)
	movq	112(%rax), %rcx
	movq	%rcx, 7024(%rsp)
	movq	120(%rax), %rcx
	movq	%rcx, 7032(%rsp)
	movq	128(%rax), %rcx
	movq	%rcx, 7040(%rsp)
	movq	136(%rax), %rcx
	movq	%rcx, 7048(%rsp)
	movq	144(%rax), %rcx
	movq	%rcx, 7056(%rsp)
	movq	152(%rax), %rcx
	movq	%rcx, 7064(%rsp)
	movq	160(%rax), %rcx
	movq	%rcx, 7072(%rsp)
	movq	168(%rax), %rcx
	movq	%rcx, 7080(%rsp)
	movq	176(%rax), %rcx
	movq	%rcx, 7088(%rsp)
	movq	184(%rax), %rcx
	movq	%rcx, 7096(%rsp)
	movq	192(%rax), %rcx
	movq	%rcx, 7104(%rsp)
	movq	200(%rax), %rcx
	movq	%rcx, 7112(%rsp)
	movq	208(%rax), %rcx
	movq	%rcx, 7120(%rsp)
	movq	216(%rax), %rcx
	movq	%rcx, 7128(%rsp)
	movq	224(%rax), %rcx
	movq	%rcx, 7136(%rsp)
	movq	232(%rax), %rcx
	movq	%rcx, 7144(%rsp)
	movq	240(%rax), %rcx
	movq	%rcx, 7152(%rsp)
	movq	248(%rax), %rcx
	movq	%rcx, 7160(%rsp)
	movq	256(%rax), %rcx
	movq	%rcx, 7168(%rsp)
	movq	264(%rax), %rcx
	movq	%rcx, 7176(%rsp)
	movq	272(%rax), %rcx
	movq	%rcx, 7184(%rsp)
	movq	280(%rax), %rcx
	movq	%rcx, 7192(%rsp)
	movq	288(%rax), %rcx
	movq	%rcx, 7200(%rsp)
	movq	296(%rax), %rcx
	movq	%rcx, 7208(%rsp)
	movq	304(%rax), %rcx
	movq	%rcx, 7216(%rsp)
	movq	312(%rax), %rcx
	movq	%rcx, 7224(%rsp)
	movq	320(%rax), %rcx
	movq	%rcx, 7232(%rsp)
	movq	328(%rax), %rcx
	movq	%rcx, 7240(%rsp)
	movq	336(%rax), %rcx
	movq	%rcx, 7248(%rsp)
	movq	344(%rax), %rcx
	movq	%rcx, 7256(%rsp)
	movq	352(%rax), %rcx
	movq	%rcx, 7264(%rsp)
	movq	360(%rax), %rcx
	movq	%rcx, 7272(%rsp)
	movq	368(%rax), %rcx
	movq	%rcx, 7280(%rsp)
	movq	376(%rax), %rcx
	movq	%rcx, 7288(%rsp)
	movq	384(%rax), %rcx
	movq	%rcx, 7296(%rsp)
	movq	392(%rax), %rcx
	movq	%rcx, 7304(%rsp)
	movq	400(%rax), %rcx
	movq	%rcx, 7312(%rsp)
	movq	408(%rax), %rcx
	movq	%rcx, 7320(%rsp)
	movq	416(%rax), %rcx
	movq	%rcx, 7328(%rsp)
	movq	424(%rax), %rcx
	movq	%rcx, 7336(%rsp)
	movq	432(%rax), %rcx
	movq	%rcx, 7344(%rsp)
	movq	440(%rax), %rcx
	movq	%rcx, 7352(%rsp)
	movq	448(%rax), %rcx
	movq	%rcx, 7360(%rsp)
	movq	456(%rax), %rcx
	movq	%rcx, 7368(%rsp)
	movq	464(%rax), %rcx
	movq	%rcx, 7376(%rsp)
	movq	472(%rax), %rcx
	movq	%rcx, 7384(%rsp)
	movq	480(%rax), %rcx
	movq	%rcx, 7392(%rsp)
	movq	488(%rax), %rcx
	movq	%rcx, 7400(%rsp)
	movq	496(%rax), %rcx
	movq	%rcx, 7408(%rsp)
	movq	504(%rax), %rcx
	movq	%rcx, 7416(%rsp)
	movq	512(%rax), %rcx
	movq	%rcx, 7424(%rsp)
	movq	520(%rax), %rcx
	movq	%rcx, 7432(%rsp)
	movq	528(%rax), %rcx
	movq	%rcx, 7440(%rsp)
	movq	536(%rax), %rcx
	movq	%rcx, 7448(%rsp)
	movq	544(%rax), %rcx
	movq	%rcx, 7456(%rsp)
	movq	552(%rax), %rcx
	movq	%rcx, 7464(%rsp)
	movq	560(%rax), %rcx
	movq	%rcx, 7472(%rsp)
	movq	568(%rax), %rcx
	movq	%rcx, 7480(%rsp)
	movq	576(%rax), %rcx
	movq	%rcx, 7488(%rsp)
	movq	584(%rax), %rcx
	movq	%rcx, 7496(%rsp)
	movq	592(%rax), %rcx
	movq	%rcx, 7504(%rsp)
	movq	600(%rax), %rcx
	movq	%rcx, 7512(%rsp)
	movq	608(%rax), %rcx
	movq	%rcx, 7520(%rsp)
	movq	616(%rax), %rcx
	movq	%rcx, 7528(%rsp)
	movq	624(%rax), %rcx
	movq	%rcx, 7536(%rsp)
	movq	632(%rax), %rcx
	movq	%rcx, 7544(%rsp)
	movq	640(%rax), %rcx
	movq	%rcx, 7552(%rsp)
	movq	648(%rax), %rcx
	movq	%rcx, 7560(%rsp)
	movq	656(%rax), %rcx
	movq	%rcx, 7568(%rsp)
	movq	664(%rax), %rcx
	movq	%rcx, 7576(%rsp)
	movq	672(%rax), %rcx
	movq	%rcx, 7584(%rsp)
	movq	680(%rax), %rcx
	movq	%rcx, 7592(%rsp)
	movq	688(%rax), %rcx
	movq	%rcx, 7600(%rsp)
	movq	696(%rax), %rcx
	movq	%rcx, 7608(%rsp)
	movq	704(%rax), %rcx
	movq	%rcx, 7616(%rsp)
	movq	712(%rax), %rcx
	movq	%rcx, 7624(%rsp)
	movq	720(%rax), %rcx
	movq	%rcx, 7632(%rsp)
	movq	728(%rax), %rcx
	movq	%rcx, 7640(%rsp)
	movq	736(%rax), %rcx
	movq	%rcx, 7648(%rsp)
	movq	744(%rax), %rcx
	movq	%rcx, 7656(%rsp)
	movq	752(%rax), %rcx
	movq	%rcx, 7664(%rsp)
	movq	760(%rax), %rcx
	movq	%rcx, 7672(%rsp)
	movq	768(%rax), %rcx
	movq	%rcx, 7680(%rsp)
	movq	776(%rax), %rcx
	movq	%rcx, 7688(%rsp)
	movq	784(%rax), %rcx
	movq	%rcx, 7696(%rsp)
	movq	792(%rax), %rcx
	movq	%rcx, 7704(%rsp)
	movq	800(%rax), %rcx
	movq	%rcx, 7712(%rsp)
	movq	808(%rax), %rcx
	movq	%rcx, 7720(%rsp)
	movq	816(%rax), %rcx
	movq	%rcx, 7728(%rsp)
	movq	824(%rax), %rcx
	movq	%rcx, 7736(%rsp)
	movq	832(%rax), %rcx
	movq	%rcx, 7744(%rsp)
	movq	840(%rax), %rcx
	movq	%rcx, 7752(%rsp)
	movq	848(%rax), %rcx
	movq	%rcx, 7760(%rsp)
	movq	856(%rax), %rcx
	movq	%rcx, 7768(%rsp)
	movq	864(%rax), %rcx
	movq	%rcx, 7776(%rsp)
	movq	872(%rax), %rcx
	movq	%rcx, 7784(%rsp)
	movq	880(%rax), %rcx
	movq	%rcx, 7792(%rsp)
	movq	888(%rax), %rcx
	movq	%rcx, 7800(%rsp)
	movq	896(%rax), %rcx
	movq	%rcx, 7808(%rsp)
	movq	904(%rax), %rcx
	movq	%rcx, 7816(%rsp)
	movq	912(%rax), %rcx
	movq	%rcx, 7824(%rsp)
	movq	920(%rax), %rcx
	movq	%rcx, 7832(%rsp)
	movq	928(%rax), %rcx
	movq	%rcx, 7840(%rsp)
	movq	936(%rax), %rcx
	movq	%rcx, 7848(%rsp)
	movq	944(%rax), %rcx
	movq	%rcx, 7856(%rsp)
	movq	952(%rax), %rcx
	movq	%rcx, 7864(%rsp)
	movq	960(%rax), %rcx
	movq	%rcx, 7872(%rsp)
	movq	968(%rax), %rcx
	movq	%rcx, 7880(%rsp)
	movq	976(%rax), %rcx
	movq	%rcx, 7888(%rsp)
	movq	984(%rax), %rcx
	movq	%rcx, 7896(%rsp)
	movq	992(%rax), %rcx
	movq	%rcx, 7904(%rsp)
	movq	1000(%rax), %rcx
	movq	%rcx, 7912(%rsp)
	movq	1008(%rax), %rcx
	movq	%rcx, 7920(%rsp)
	movq	1016(%rax), %rcx
	movq	%rcx, 7928(%rsp)
	movq	1024(%rax), %rcx
	movq	%rcx, 7936(%rsp)
	movq	1032(%rax), %rcx
	movq	%rcx, 7944(%rsp)
	movq	1040(%rax), %rcx
	movq	%rcx, 7952(%rsp)
	movq	1048(%rax), %rcx
	movq	%rcx, 7960(%rsp)
	movq	1056(%rax), %rcx
	movq	%rcx, 7968(%rsp)
	movq	1064(%rax), %rcx
	movq	%rcx, 7976(%rsp)
	movq	1072(%rax), %rcx
	movq	%rcx, 7984(%rsp)
	movq	1080(%rax), %rcx
	movq	%rcx, 7992(%rsp)
	movq	1088(%rax), %rcx
	movq	%rcx, 8000(%rsp)
	movq	1096(%rax), %rcx
	movq	%rcx, 8008(%rsp)
	movq	1104(%rax), %rcx
	movq	%rcx, 8016(%rsp)
	movq	1112(%rax), %rcx
	movq	%rcx, 8024(%rsp)
	movq	1120(%rax), %rcx
	movq	%rcx, 8032(%rsp)
	movq	1128(%rax), %rcx
	movq	%rcx, 8040(%rsp)
	movq	1136(%rax), %rcx
	movq	%rcx, 8048(%rsp)
	movq	1144(%rax), %rcx
	movq	%rcx, 8056(%rsp)
	movq	1152(%rax), %rcx
	movq	%rcx, 8064(%rsp)
	movq	1160(%rax), %rcx
	movq	%rcx, 8072(%rsp)
	movq	1168(%rax), %rcx
	movq	%rcx, 8080(%rsp)
	movq	1176(%rax), %rcx
	movq	%rcx, 8088(%rsp)
	movq	1184(%rax), %rcx
	movq	%rcx, 8096(%rsp)
	movq	1192(%rax), %rcx
	movq	%rcx, 8104(%rsp)
	movq	1200(%rax), %rcx
	movq	%rcx, 8112(%rsp)
	movq	1208(%rax), %rcx
	movq	%rcx, 8120(%rsp)
	movq	1216(%rax), %rcx
	movq	%rcx, 8128(%rsp)
	movq	1224(%rax), %rcx
	movq	%rcx, 8136(%rsp)
	movq	1232(%rax), %rcx
	movq	%rcx, 8144(%rsp)
	movq	1240(%rax), %rcx
	movq	%rcx, 8152(%rsp)
	movq	1248(%rax), %rcx
	movq	%rcx, 8160(%rsp)
	movq	1256(%rax), %rcx
	movq	%rcx, 8168(%rsp)
	movq	1264(%rax), %rcx
	movq	%rcx, 8176(%rsp)
	movq	1272(%rax), %rcx
	movq	%rcx, 8184(%rsp)
	movq	1280(%rax), %rcx
	movq	%rcx, 8192(%rsp)
	movq	1288(%rax), %rcx
	movq	%rcx, 8200(%rsp)
	movq	1296(%rax), %rcx
	movq	%rcx, 8208(%rsp)
	movq	1304(%rax), %rcx
	movq	%rcx, 8216(%rsp)
	movq	1312(%rax), %rcx
	movq	%rcx, 8224(%rsp)
	movq	1320(%rax), %rcx
	movq	%rcx, 8232(%rsp)
	movq	1328(%rax), %rcx
	movq	%rcx, 8240(%rsp)
	movq	1336(%rax), %rcx
	movq	%rcx, 8248(%rsp)
	movq	1344(%rax), %rcx
	movq	%rcx, 8256(%rsp)
	movq	1352(%rax), %rcx
	movq	%rcx, 8264(%rsp)
	movq	1360(%rax), %rcx
	movq	%rcx, 8272(%rsp)
	movq	1368(%rax), %rcx
	movq	%rcx, 8280(%rsp)
	movq	1376(%rax), %rcx
	movq	%rcx, 8288(%rsp)
	movq	1384(%rax), %rcx
	movq	%rcx, 8296(%rsp)
	movq	1392(%rax), %rcx
	movq	%rcx, 8304(%rsp)
	movq	1400(%rax), %rcx
	movq	%rcx, 8312(%rsp)
	movq	1408(%rax), %rcx
	movq	%rcx, 8320(%rsp)
	movq	1416(%rax), %rcx
	movq	%rcx, 8328(%rsp)
	movq	1424(%rax), %rcx
	movq	%rcx, 8336(%rsp)
	movq	1432(%rax), %rcx
	movq	%rcx, 8344(%rsp)
	movq	1440(%rax), %rcx
	movq	%rcx, 8352(%rsp)
	movq	1448(%rax), %rcx
	movq	%rcx, 8360(%rsp)
	movq	1456(%rax), %rcx
	movq	%rcx, 8368(%rsp)
	movq	1464(%rax), %rcx
	movq	%rcx, 8376(%rsp)
	movq	1472(%rax), %rcx
	movq	%rcx, 8384(%rsp)
	movq	1480(%rax), %rcx
	movq	%rcx, 8392(%rsp)
	movq	1488(%rax), %rcx
	movq	%rcx, 8400(%rsp)
	movq	1496(%rax), %rcx
	movq	%rcx, 8408(%rsp)
	movq	1504(%rax), %rcx
	movq	%rcx, 8416(%rsp)
	movq	1512(%rax), %rcx
	movq	%rcx, 8424(%rsp)
	movq	1520(%rax), %rcx
	movq	%rcx, 8432(%rsp)
	movq	1528(%rax), %rcx
	movq	%rcx, 8440(%rsp)
	movq	1536(%rax), %rcx
	movq	%rcx, 8448(%rsp)
	movq	1544(%rax), %rcx
	movq	%rcx, 8456(%rsp)
	movq	1552(%rax), %rcx
	movq	%rcx, 8464(%rsp)
	movq	1560(%rax), %rax
	movq	%rax, 8472(%rsp)
	movq	24864(%rsp), %rax
	leaq	6880(%rsp), %rcx
	call	L_shake256_A32__A1600$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_dec$1:
	movq	%mm0, %rcx
	leaq	96(%rsp), %rdx
	negq	%rcx
	movq	%rcx, 24864(%rsp)
	vpbroadcastq	24864(%rsp), %ymm0
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
	movq	31248(%rsp), %rbx
	movq	31256(%rsp), %rbp
	movq	31264(%rsp), %r12
	movq	31272(%rsp), %r13
	movq	31280(%rsp), %r14
	movq	31288(%rsp), %r15
	movq	31296(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand:
jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand:
	movq	%rsp, %rax
	leaq	-23368(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 23312(%rsp)
	movq	%rbp, 23320(%rsp)
	movq	%r12, 23328(%rsp)
	movq	%r13, 23336(%rsp)
	movq	%r14, 23344(%rsp)
	movq	%r15, 23352(%rsp)
	movq	%rax, 23360(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm1
	movq	%rsi, %mm2
	movq	(%rdx), %rax
	movq	%rax, 3712(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 3720(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 3728(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 3736(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 3744(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 3752(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 3760(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 3768(%rsp)
	movq	64(%rdx), %rax
	movq	%rax, 3776(%rsp)
	movq	72(%rdx), %rax
	movq	%rax, 3784(%rsp)
	movq	80(%rdx), %rax
	movq	%rax, 3792(%rsp)
	movq	88(%rdx), %rax
	movq	%rax, 3800(%rsp)
	movq	96(%rdx), %rax
	movq	%rax, 3808(%rsp)
	movq	104(%rdx), %rax
	movq	%rax, 3816(%rsp)
	movq	112(%rdx), %rax
	movq	%rax, 3824(%rsp)
	movq	120(%rdx), %rax
	movq	%rax, 3832(%rsp)
	movq	128(%rdx), %rax
	movq	%rax, 3840(%rsp)
	movq	136(%rdx), %rax
	movq	%rax, 3848(%rsp)
	movq	144(%rdx), %rax
	movq	%rax, 3856(%rsp)
	movq	152(%rdx), %rax
	movq	%rax, 3864(%rsp)
	movq	160(%rdx), %rax
	movq	%rax, 3872(%rsp)
	movq	168(%rdx), %rax
	movq	%rax, 3880(%rsp)
	movq	176(%rdx), %rax
	movq	%rax, 3888(%rsp)
	movq	184(%rdx), %rax
	movq	%rax, 3896(%rsp)
	movq	192(%rdx), %rax
	movq	%rax, 3904(%rsp)
	movq	200(%rdx), %rax
	movq	%rax, 3912(%rsp)
	movq	208(%rdx), %rax
	movq	%rax, 3920(%rsp)
	movq	216(%rdx), %rax
	movq	%rax, 3928(%rsp)
	movq	224(%rdx), %rax
	movq	%rax, 3936(%rsp)
	movq	232(%rdx), %rax
	movq	%rax, 3944(%rsp)
	movq	240(%rdx), %rax
	movq	%rax, 3952(%rsp)
	movq	248(%rdx), %rax
	movq	%rax, 3960(%rsp)
	movq	256(%rdx), %rax
	movq	%rax, 3968(%rsp)
	movq	264(%rdx), %rax
	movq	%rax, 3976(%rsp)
	movq	272(%rdx), %rax
	movq	%rax, 3984(%rsp)
	movq	280(%rdx), %rax
	movq	%rax, 3992(%rsp)
	movq	288(%rdx), %rax
	movq	%rax, 4000(%rsp)
	movq	296(%rdx), %rax
	movq	%rax, 4008(%rsp)
	movq	304(%rdx), %rax
	movq	%rax, 4016(%rsp)
	movq	312(%rdx), %rax
	movq	%rax, 4024(%rsp)
	movq	320(%rdx), %rax
	movq	%rax, 4032(%rsp)
	movq	328(%rdx), %rax
	movq	%rax, 4040(%rsp)
	movq	336(%rdx), %rax
	movq	%rax, 4048(%rsp)
	movq	344(%rdx), %rax
	movq	%rax, 4056(%rsp)
	movq	352(%rdx), %rax
	movq	%rax, 4064(%rsp)
	movq	360(%rdx), %rax
	movq	%rax, 4072(%rsp)
	movq	368(%rdx), %rax
	movq	%rax, 4080(%rsp)
	movq	376(%rdx), %rax
	movq	%rax, 4088(%rsp)
	movq	384(%rdx), %rax
	movq	%rax, 4096(%rsp)
	movq	392(%rdx), %rax
	movq	%rax, 4104(%rsp)
	movq	400(%rdx), %rax
	movq	%rax, 4112(%rsp)
	movq	408(%rdx), %rax
	movq	%rax, 4120(%rsp)
	movq	416(%rdx), %rax
	movq	%rax, 4128(%rsp)
	movq	424(%rdx), %rax
	movq	%rax, 4136(%rsp)
	movq	432(%rdx), %rax
	movq	%rax, 4144(%rsp)
	movq	440(%rdx), %rax
	movq	%rax, 4152(%rsp)
	movq	448(%rdx), %rax
	movq	%rax, 4160(%rsp)
	movq	456(%rdx), %rax
	movq	%rax, 4168(%rsp)
	movq	464(%rdx), %rax
	movq	%rax, 4176(%rsp)
	movq	472(%rdx), %rax
	movq	%rax, 4184(%rsp)
	movq	480(%rdx), %rax
	movq	%rax, 4192(%rsp)
	movq	488(%rdx), %rax
	movq	%rax, 4200(%rsp)
	movq	496(%rdx), %rax
	movq	%rax, 4208(%rsp)
	movq	504(%rdx), %rax
	movq	%rax, 4216(%rsp)
	movq	512(%rdx), %rax
	movq	%rax, 4224(%rsp)
	movq	520(%rdx), %rax
	movq	%rax, 4232(%rsp)
	movq	528(%rdx), %rax
	movq	%rax, 4240(%rsp)
	movq	536(%rdx), %rax
	movq	%rax, 4248(%rsp)
	movq	544(%rdx), %rax
	movq	%rax, 4256(%rsp)
	movq	552(%rdx), %rax
	movq	%rax, 4264(%rsp)
	movq	560(%rdx), %rax
	movq	%rax, 4272(%rsp)
	movq	568(%rdx), %rax
	movq	%rax, 4280(%rsp)
	movq	576(%rdx), %rax
	movq	%rax, 4288(%rsp)
	movq	584(%rdx), %rax
	movq	%rax, 4296(%rsp)
	movq	592(%rdx), %rax
	movq	%rax, 4304(%rsp)
	movq	600(%rdx), %rax
	movq	%rax, 4312(%rsp)
	movq	608(%rdx), %rax
	movq	%rax, 4320(%rsp)
	movq	616(%rdx), %rax
	movq	%rax, 4328(%rsp)
	movq	624(%rdx), %rax
	movq	%rax, 4336(%rsp)
	movq	632(%rdx), %rax
	movq	%rax, 4344(%rsp)
	movq	640(%rdx), %rax
	movq	%rax, 4352(%rsp)
	movq	648(%rdx), %rax
	movq	%rax, 4360(%rsp)
	movq	656(%rdx), %rax
	movq	%rax, 4368(%rsp)
	movq	664(%rdx), %rax
	movq	%rax, 4376(%rsp)
	movq	672(%rdx), %rax
	movq	%rax, 4384(%rsp)
	movq	680(%rdx), %rax
	movq	%rax, 4392(%rsp)
	movq	688(%rdx), %rax
	movq	%rax, 4400(%rsp)
	movq	696(%rdx), %rax
	movq	%rax, 4408(%rsp)
	movq	704(%rdx), %rax
	movq	%rax, 4416(%rsp)
	movq	712(%rdx), %rax
	movq	%rax, 4424(%rsp)
	movq	720(%rdx), %rax
	movq	%rax, 4432(%rsp)
	movq	728(%rdx), %rax
	movq	%rax, 4440(%rsp)
	movq	736(%rdx), %rax
	movq	%rax, 4448(%rsp)
	movq	744(%rdx), %rax
	movq	%rax, 4456(%rsp)
	movq	752(%rdx), %rax
	movq	%rax, 4464(%rsp)
	movq	760(%rdx), %rax
	movq	%rax, 4472(%rsp)
	movq	768(%rdx), %rax
	movq	%rax, 4480(%rsp)
	movq	776(%rdx), %rax
	movq	%rax, 4488(%rsp)
	movq	784(%rdx), %rax
	movq	%rax, 4496(%rsp)
	movq	792(%rdx), %rax
	movq	%rax, 4504(%rsp)
	movq	800(%rdx), %rax
	movq	%rax, 4512(%rsp)
	movq	808(%rdx), %rax
	movq	%rax, 4520(%rsp)
	movq	816(%rdx), %rax
	movq	%rax, 4528(%rsp)
	movq	824(%rdx), %rax
	movq	%rax, 4536(%rsp)
	movq	832(%rdx), %rax
	movq	%rax, 4544(%rsp)
	movq	840(%rdx), %rax
	movq	%rax, 4552(%rsp)
	movq	848(%rdx), %rax
	movq	%rax, 4560(%rsp)
	movq	856(%rdx), %rax
	movq	%rax, 4568(%rsp)
	movq	864(%rdx), %rax
	movq	%rax, 4576(%rsp)
	movq	872(%rdx), %rax
	movq	%rax, 4584(%rsp)
	movq	880(%rdx), %rax
	movq	%rax, 4592(%rsp)
	movq	888(%rdx), %rax
	movq	%rax, 4600(%rsp)
	movq	896(%rdx), %rax
	movq	%rax, 4608(%rsp)
	movq	904(%rdx), %rax
	movq	%rax, 4616(%rsp)
	movq	912(%rdx), %rax
	movq	%rax, 4624(%rsp)
	movq	920(%rdx), %rax
	movq	%rax, 4632(%rsp)
	movq	928(%rdx), %rax
	movq	%rax, 4640(%rsp)
	movq	936(%rdx), %rax
	movq	%rax, 4648(%rsp)
	movq	944(%rdx), %rax
	movq	%rax, 4656(%rsp)
	movq	952(%rdx), %rax
	movq	%rax, 4664(%rsp)
	movq	960(%rdx), %rax
	movq	%rax, 4672(%rsp)
	movq	968(%rdx), %rax
	movq	%rax, 4680(%rsp)
	movq	976(%rdx), %rax
	movq	%rax, 4688(%rsp)
	movq	984(%rdx), %rax
	movq	%rax, 4696(%rsp)
	movq	992(%rdx), %rax
	movq	%rax, 4704(%rsp)
	movq	1000(%rdx), %rax
	movq	%rax, 4712(%rsp)
	movq	1008(%rdx), %rax
	movq	%rax, 4720(%rsp)
	movq	1016(%rdx), %rax
	movq	%rax, 4728(%rsp)
	movq	1024(%rdx), %rax
	movq	%rax, 4736(%rsp)
	movq	1032(%rdx), %rax
	movq	%rax, 4744(%rsp)
	movq	1040(%rdx), %rax
	movq	%rax, 4752(%rsp)
	movq	1048(%rdx), %rax
	movq	%rax, 4760(%rsp)
	movq	1056(%rdx), %rax
	movq	%rax, 4768(%rsp)
	movq	1064(%rdx), %rax
	movq	%rax, 4776(%rsp)
	movq	1072(%rdx), %rax
	movq	%rax, 4784(%rsp)
	movq	1080(%rdx), %rax
	movq	%rax, 4792(%rsp)
	movq	1088(%rdx), %rax
	movq	%rax, 4800(%rsp)
	movq	1096(%rdx), %rax
	movq	%rax, 4808(%rsp)
	movq	1104(%rdx), %rax
	movq	%rax, 4816(%rsp)
	movq	1112(%rdx), %rax
	movq	%rax, 4824(%rsp)
	movq	1120(%rdx), %rax
	movq	%rax, 4832(%rsp)
	movq	1128(%rdx), %rax
	movq	%rax, 4840(%rsp)
	movq	1136(%rdx), %rax
	movq	%rax, 4848(%rsp)
	movq	1144(%rdx), %rax
	movq	%rax, 4856(%rsp)
	movq	1152(%rdx), %rax
	movq	%rax, 4864(%rsp)
	movq	1160(%rdx), %rax
	movq	%rax, 4872(%rsp)
	movq	1168(%rdx), %rax
	movq	%rax, 4880(%rsp)
	movq	1176(%rdx), %rax
	movq	%rax, 4888(%rsp)
	movq	1184(%rdx), %rax
	movq	%rax, 4896(%rsp)
	movq	1192(%rdx), %rax
	movq	%rax, 4904(%rsp)
	movq	1200(%rdx), %rax
	movq	%rax, 4912(%rsp)
	movq	1208(%rdx), %rax
	movq	%rax, 4920(%rsp)
	movq	1216(%rdx), %rax
	movq	%rax, 4928(%rsp)
	movq	1224(%rdx), %rax
	movq	%rax, 4936(%rsp)
	movq	1232(%rdx), %rax
	movq	%rax, 4944(%rsp)
	movq	1240(%rdx), %rax
	movq	%rax, 4952(%rsp)
	movq	1248(%rdx), %rax
	movq	%rax, 4960(%rsp)
	movq	1256(%rdx), %rax
	movq	%rax, 4968(%rsp)
	movq	1264(%rdx), %rax
	movq	%rax, 4976(%rsp)
	movq	1272(%rdx), %rax
	movq	%rax, 4984(%rsp)
	movq	1280(%rdx), %rax
	movq	%rax, 4992(%rsp)
	movq	1288(%rdx), %rax
	movq	%rax, 5000(%rsp)
	movq	1296(%rdx), %rax
	movq	%rax, 5008(%rsp)
	movq	1304(%rdx), %rax
	movq	%rax, 5016(%rsp)
	movq	1312(%rdx), %rax
	movq	%rax, 5024(%rsp)
	movq	1320(%rdx), %rax
	movq	%rax, 5032(%rsp)
	movq	1328(%rdx), %rax
	movq	%rax, 5040(%rsp)
	movq	1336(%rdx), %rax
	movq	%rax, 5048(%rsp)
	movq	1344(%rdx), %rax
	movq	%rax, 5056(%rsp)
	movq	1352(%rdx), %rax
	movq	%rax, 5064(%rsp)
	movq	1360(%rdx), %rax
	movq	%rax, 5072(%rsp)
	movq	1368(%rdx), %rax
	movq	%rax, 5080(%rsp)
	movq	1376(%rdx), %rax
	movq	%rax, 5088(%rsp)
	movq	1384(%rdx), %rax
	movq	%rax, 5096(%rsp)
	movq	1392(%rdx), %rax
	movq	%rax, 5104(%rsp)
	movq	1400(%rdx), %rax
	movq	%rax, 5112(%rsp)
	movq	1408(%rdx), %rax
	movq	%rax, 5120(%rsp)
	movq	1416(%rdx), %rax
	movq	%rax, 5128(%rsp)
	movq	1424(%rdx), %rax
	movq	%rax, 5136(%rsp)
	movq	1432(%rdx), %rax
	movq	%rax, 5144(%rsp)
	movq	1440(%rdx), %rax
	movq	%rax, 5152(%rsp)
	movq	1448(%rdx), %rax
	movq	%rax, 5160(%rsp)
	movq	1456(%rdx), %rax
	movq	%rax, 5168(%rsp)
	movq	1464(%rdx), %rax
	movq	%rax, 5176(%rsp)
	movq	1472(%rdx), %rax
	movq	%rax, 5184(%rsp)
	movq	1480(%rdx), %rax
	movq	%rax, 5192(%rsp)
	movq	1488(%rdx), %rax
	movq	%rax, 5200(%rsp)
	movq	1496(%rdx), %rax
	movq	%rax, 5208(%rsp)
	movq	1504(%rdx), %rax
	movq	%rax, 5216(%rsp)
	movq	1512(%rdx), %rax
	movq	%rax, 5224(%rsp)
	movq	1520(%rdx), %rax
	movq	%rax, 5232(%rsp)
	movq	1528(%rdx), %rax
	movq	%rax, 5240(%rsp)
	movq	1536(%rdx), %rax
	movq	%rax, 5248(%rsp)
	movq	1544(%rdx), %rax
	movq	%rax, 5256(%rsp)
	movq	1552(%rdx), %rax
	movq	%rax, 5264(%rsp)
	movq	1560(%rdx), %rax
	movq	%rax, 5272(%rsp)
	movq	(%rcx), %rax
	movq	%rax, 23248(%rsp)
	movq	8(%rcx), %rax
	movq	%rax, 23256(%rsp)
	movq	16(%rcx), %rax
	movq	%rax, 23264(%rsp)
	movq	24(%rcx), %rax
	movq	%rax, 23272(%rsp)
	leaq	21664(%rsp), %rax
	leaq	3712(%rsp), %rcx
	leaq	23280(%rsp), %rdx
	leaq	23248(%rsp), %rsi
	movq	%rcx, 23232(%rsp)
	movq	%rdx, 23240(%rsp)
	movq	(%rsi), %rdx
	movq	%rdx, (%rsp)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%rsp)
	movq	16(%rsi), %rdx
	movq	%rdx, 16(%rsp)
	movq	24(%rsi), %rdx
	movq	%rdx, 24(%rsp)
	leaq	32(%rsp), %rdx
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$66:
	leaq	64(%rsp), %rcx
	movq	%rsp, %rdx
	call	L_sha3_512A_A64$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$65:
	movq	23232(%rsp), %rcx
	movq	%rsp, %rdx
	leaq	96(%rsp), %r8
	movq	%rax, %mm3
	movq	%rcx, %rax
	movq	(%rax), %rsi
	movq	%rsi, 2176(%rsp)
	movq	8(%rax), %rsi
	movq	%rsi, 2184(%rsp)
	movq	16(%rax), %rsi
	movq	%rsi, 2192(%rsp)
	movq	24(%rax), %rsi
	movq	%rsi, 2200(%rsp)
	movq	32(%rax), %rsi
	movq	%rsi, 2208(%rsp)
	movq	40(%rax), %rsi
	movq	%rsi, 2216(%rsp)
	movq	48(%rax), %rsi
	movq	%rsi, 2224(%rsp)
	movq	56(%rax), %rsi
	movq	%rsi, 2232(%rsp)
	movq	64(%rax), %rsi
	movq	%rsi, 2240(%rsp)
	movq	72(%rax), %rsi
	movq	%rsi, 2248(%rsp)
	movq	80(%rax), %rsi
	movq	%rsi, 2256(%rsp)
	movq	88(%rax), %rsi
	movq	%rsi, 2264(%rsp)
	movq	96(%rax), %rsi
	movq	%rsi, 2272(%rsp)
	movq	104(%rax), %rsi
	movq	%rsi, 2280(%rsp)
	movq	112(%rax), %rsi
	movq	%rsi, 2288(%rsp)
	movq	120(%rax), %rsi
	movq	%rsi, 2296(%rsp)
	movq	128(%rax), %rsi
	movq	%rsi, 2304(%rsp)
	movq	136(%rax), %rsi
	movq	%rsi, 2312(%rsp)
	movq	144(%rax), %rsi
	movq	%rsi, 2320(%rsp)
	movq	152(%rax), %rsi
	movq	%rsi, 2328(%rsp)
	movq	160(%rax), %rsi
	movq	%rsi, 2336(%rsp)
	movq	168(%rax), %rsi
	movq	%rsi, 2344(%rsp)
	movq	176(%rax), %rsi
	movq	%rsi, 2352(%rsp)
	movq	184(%rax), %rsi
	movq	%rsi, 2360(%rsp)
	movq	192(%rax), %rsi
	movq	%rsi, 2368(%rsp)
	movq	200(%rax), %rsi
	movq	%rsi, 2376(%rsp)
	movq	208(%rax), %rsi
	movq	%rsi, 2384(%rsp)
	movq	216(%rax), %rsi
	movq	%rsi, 2392(%rsp)
	movq	224(%rax), %rsi
	movq	%rsi, 2400(%rsp)
	movq	232(%rax), %rsi
	movq	%rsi, 2408(%rsp)
	movq	240(%rax), %rsi
	movq	%rsi, 2416(%rsp)
	movq	248(%rax), %rsi
	movq	%rsi, 2424(%rsp)
	movq	256(%rax), %rsi
	movq	%rsi, 2432(%rsp)
	movq	264(%rax), %rsi
	movq	%rsi, 2440(%rsp)
	movq	272(%rax), %rsi
	movq	%rsi, 2448(%rsp)
	movq	280(%rax), %rsi
	movq	%rsi, 2456(%rsp)
	movq	288(%rax), %rsi
	movq	%rsi, 2464(%rsp)
	movq	296(%rax), %rsi
	movq	%rsi, 2472(%rsp)
	movq	304(%rax), %rsi
	movq	%rsi, 2480(%rsp)
	movq	312(%rax), %rsi
	movq	%rsi, 2488(%rsp)
	movq	320(%rax), %rsi
	movq	%rsi, 2496(%rsp)
	movq	328(%rax), %rsi
	movq	%rsi, 2504(%rsp)
	movq	336(%rax), %rsi
	movq	%rsi, 2512(%rsp)
	movq	344(%rax), %rsi
	movq	%rsi, 2520(%rsp)
	movq	352(%rax), %rsi
	movq	%rsi, 2528(%rsp)
	movq	360(%rax), %rsi
	movq	%rsi, 2536(%rsp)
	movq	368(%rax), %rsi
	movq	%rsi, 2544(%rsp)
	movq	376(%rax), %rsi
	movq	%rsi, 2552(%rsp)
	movq	384(%rax), %rsi
	movq	%rsi, 2560(%rsp)
	movq	392(%rax), %rsi
	movq	%rsi, 2568(%rsp)
	movq	400(%rax), %rsi
	movq	%rsi, 2576(%rsp)
	movq	408(%rax), %rsi
	movq	%rsi, 2584(%rsp)
	movq	416(%rax), %rsi
	movq	%rsi, 2592(%rsp)
	movq	424(%rax), %rsi
	movq	%rsi, 2600(%rsp)
	movq	432(%rax), %rsi
	movq	%rsi, 2608(%rsp)
	movq	440(%rax), %rsi
	movq	%rsi, 2616(%rsp)
	movq	448(%rax), %rsi
	movq	%rsi, 2624(%rsp)
	movq	456(%rax), %rsi
	movq	%rsi, 2632(%rsp)
	movq	464(%rax), %rsi
	movq	%rsi, 2640(%rsp)
	movq	472(%rax), %rsi
	movq	%rsi, 2648(%rsp)
	movq	480(%rax), %rsi
	movq	%rsi, 2656(%rsp)
	movq	488(%rax), %rsi
	movq	%rsi, 2664(%rsp)
	movq	496(%rax), %rsi
	movq	%rsi, 2672(%rsp)
	movq	504(%rax), %rsi
	movq	%rsi, 2680(%rsp)
	movq	512(%rax), %rsi
	movq	%rsi, 2688(%rsp)
	movq	520(%rax), %rsi
	movq	%rsi, 2696(%rsp)
	movq	528(%rax), %rsi
	movq	%rsi, 2704(%rsp)
	movq	536(%rax), %rsi
	movq	%rsi, 2712(%rsp)
	movq	544(%rax), %rsi
	movq	%rsi, 2720(%rsp)
	movq	552(%rax), %rsi
	movq	%rsi, 2728(%rsp)
	movq	560(%rax), %rsi
	movq	%rsi, 2736(%rsp)
	movq	568(%rax), %rsi
	movq	%rsi, 2744(%rsp)
	movq	576(%rax), %rsi
	movq	%rsi, 2752(%rsp)
	movq	584(%rax), %rsi
	movq	%rsi, 2760(%rsp)
	movq	592(%rax), %rsi
	movq	%rsi, 2768(%rsp)
	movq	600(%rax), %rsi
	movq	%rsi, 2776(%rsp)
	movq	608(%rax), %rsi
	movq	%rsi, 2784(%rsp)
	movq	616(%rax), %rsi
	movq	%rsi, 2792(%rsp)
	movq	624(%rax), %rsi
	movq	%rsi, 2800(%rsp)
	movq	632(%rax), %rsi
	movq	%rsi, 2808(%rsp)
	movq	640(%rax), %rsi
	movq	%rsi, 2816(%rsp)
	movq	648(%rax), %rsi
	movq	%rsi, 2824(%rsp)
	movq	656(%rax), %rsi
	movq	%rsi, 2832(%rsp)
	movq	664(%rax), %rsi
	movq	%rsi, 2840(%rsp)
	movq	672(%rax), %rsi
	movq	%rsi, 2848(%rsp)
	movq	680(%rax), %rsi
	movq	%rsi, 2856(%rsp)
	movq	688(%rax), %rsi
	movq	%rsi, 2864(%rsp)
	movq	696(%rax), %rsi
	movq	%rsi, 2872(%rsp)
	movq	704(%rax), %rsi
	movq	%rsi, 2880(%rsp)
	movq	712(%rax), %rsi
	movq	%rsi, 2888(%rsp)
	movq	720(%rax), %rsi
	movq	%rsi, 2896(%rsp)
	movq	728(%rax), %rsi
	movq	%rsi, 2904(%rsp)
	movq	736(%rax), %rsi
	movq	%rsi, 2912(%rsp)
	movq	744(%rax), %rsi
	movq	%rsi, 2920(%rsp)
	movq	752(%rax), %rsi
	movq	%rsi, 2928(%rsp)
	movq	760(%rax), %rsi
	movq	%rsi, 2936(%rsp)
	movq	768(%rax), %rsi
	movq	%rsi, 2944(%rsp)
	movq	776(%rax), %rsi
	movq	%rsi, 2952(%rsp)
	movq	784(%rax), %rsi
	movq	%rsi, 2960(%rsp)
	movq	792(%rax), %rsi
	movq	%rsi, 2968(%rsp)
	movq	800(%rax), %rsi
	movq	%rsi, 2976(%rsp)
	movq	808(%rax), %rsi
	movq	%rsi, 2984(%rsp)
	movq	816(%rax), %rsi
	movq	%rsi, 2992(%rsp)
	movq	824(%rax), %rsi
	movq	%rsi, 3000(%rsp)
	movq	832(%rax), %rsi
	movq	%rsi, 3008(%rsp)
	movq	840(%rax), %rsi
	movq	%rsi, 3016(%rsp)
	movq	848(%rax), %rsi
	movq	%rsi, 3024(%rsp)
	movq	856(%rax), %rsi
	movq	%rsi, 3032(%rsp)
	movq	864(%rax), %rsi
	movq	%rsi, 3040(%rsp)
	movq	872(%rax), %rsi
	movq	%rsi, 3048(%rsp)
	movq	880(%rax), %rsi
	movq	%rsi, 3056(%rsp)
	movq	888(%rax), %rsi
	movq	%rsi, 3064(%rsp)
	movq	896(%rax), %rsi
	movq	%rsi, 3072(%rsp)
	movq	904(%rax), %rsi
	movq	%rsi, 3080(%rsp)
	movq	912(%rax), %rsi
	movq	%rsi, 3088(%rsp)
	movq	920(%rax), %rsi
	movq	%rsi, 3096(%rsp)
	movq	928(%rax), %rsi
	movq	%rsi, 3104(%rsp)
	movq	936(%rax), %rsi
	movq	%rsi, 3112(%rsp)
	movq	944(%rax), %rsi
	movq	%rsi, 3120(%rsp)
	movq	952(%rax), %rsi
	movq	%rsi, 3128(%rsp)
	movq	960(%rax), %rsi
	movq	%rsi, 3136(%rsp)
	movq	968(%rax), %rsi
	movq	%rsi, 3144(%rsp)
	movq	976(%rax), %rsi
	movq	%rsi, 3152(%rsp)
	movq	984(%rax), %rsi
	movq	%rsi, 3160(%rsp)
	movq	992(%rax), %rsi
	movq	%rsi, 3168(%rsp)
	movq	1000(%rax), %rsi
	movq	%rsi, 3176(%rsp)
	movq	1008(%rax), %rsi
	movq	%rsi, 3184(%rsp)
	movq	1016(%rax), %rsi
	movq	%rsi, 3192(%rsp)
	movq	1024(%rax), %rsi
	movq	%rsi, 3200(%rsp)
	movq	1032(%rax), %rsi
	movq	%rsi, 3208(%rsp)
	movq	1040(%rax), %rsi
	movq	%rsi, 3216(%rsp)
	movq	1048(%rax), %rsi
	movq	%rsi, 3224(%rsp)
	movq	1056(%rax), %rsi
	movq	%rsi, 3232(%rsp)
	movq	1064(%rax), %rsi
	movq	%rsi, 3240(%rsp)
	movq	1072(%rax), %rsi
	movq	%rsi, 3248(%rsp)
	movq	1080(%rax), %rsi
	movq	%rsi, 3256(%rsp)
	movq	1088(%rax), %rsi
	movq	%rsi, 3264(%rsp)
	movq	1096(%rax), %rsi
	movq	%rsi, 3272(%rsp)
	movq	1104(%rax), %rsi
	movq	%rsi, 3280(%rsp)
	movq	1112(%rax), %rsi
	movq	%rsi, 3288(%rsp)
	movq	1120(%rax), %rsi
	movq	%rsi, 3296(%rsp)
	movq	1128(%rax), %rsi
	movq	%rsi, 3304(%rsp)
	movq	1136(%rax), %rsi
	movq	%rsi, 3312(%rsp)
	movq	1144(%rax), %rsi
	movq	%rsi, 3320(%rsp)
	movq	1152(%rax), %rsi
	movq	%rsi, 3328(%rsp)
	movq	1160(%rax), %rsi
	movq	%rsi, 3336(%rsp)
	movq	1168(%rax), %rsi
	movq	%rsi, 3344(%rsp)
	movq	1176(%rax), %rsi
	movq	%rsi, 3352(%rsp)
	movq	1184(%rax), %rsi
	movq	%rsi, 3360(%rsp)
	movq	1192(%rax), %rsi
	movq	%rsi, 3368(%rsp)
	movq	1200(%rax), %rsi
	movq	%rsi, 3376(%rsp)
	movq	1208(%rax), %rsi
	movq	%rsi, 3384(%rsp)
	movq	1216(%rax), %rsi
	movq	%rsi, 3392(%rsp)
	movq	1224(%rax), %rsi
	movq	%rsi, 3400(%rsp)
	movq	1232(%rax), %rsi
	movq	%rsi, 3408(%rsp)
	movq	1240(%rax), %rsi
	movq	%rsi, 3416(%rsp)
	movq	1248(%rax), %rsi
	movq	%rsi, 3424(%rsp)
	movq	1256(%rax), %rsi
	movq	%rsi, 3432(%rsp)
	movq	1264(%rax), %rsi
	movq	%rsi, 3440(%rsp)
	movq	1272(%rax), %rsi
	movq	%rsi, 3448(%rsp)
	movq	1280(%rax), %rsi
	movq	%rsi, 3456(%rsp)
	movq	1288(%rax), %rsi
	movq	%rsi, 3464(%rsp)
	movq	1296(%rax), %rsi
	movq	%rsi, 3472(%rsp)
	movq	1304(%rax), %rsi
	movq	%rsi, 3480(%rsp)
	movq	1312(%rax), %rsi
	movq	%rsi, 3488(%rsp)
	movq	1320(%rax), %rsi
	movq	%rsi, 3496(%rsp)
	movq	1328(%rax), %rsi
	movq	%rsi, 3504(%rsp)
	movq	1336(%rax), %rsi
	movq	%rsi, 3512(%rsp)
	movq	1344(%rax), %rsi
	movq	%rsi, 3520(%rsp)
	movq	1352(%rax), %rsi
	movq	%rsi, 3528(%rsp)
	movq	1360(%rax), %rsi
	movq	%rsi, 3536(%rsp)
	movq	1368(%rax), %rsi
	movq	%rsi, 3544(%rsp)
	movq	1376(%rax), %rsi
	movq	%rsi, 3552(%rsp)
	movq	1384(%rax), %rsi
	movq	%rsi, 3560(%rsp)
	movq	1392(%rax), %rsi
	movq	%rsi, 3568(%rsp)
	movq	1400(%rax), %rsi
	movq	%rsi, 3576(%rsp)
	movq	1408(%rax), %rsi
	movq	%rsi, 3584(%rsp)
	movq	1416(%rax), %rsi
	movq	%rsi, 3592(%rsp)
	movq	1424(%rax), %rsi
	movq	%rsi, 3600(%rsp)
	movq	1432(%rax), %rsi
	movq	%rsi, 3608(%rsp)
	movq	1440(%rax), %rsi
	movq	%rsi, 3616(%rsp)
	movq	1448(%rax), %rsi
	movq	%rsi, 3624(%rsp)
	movq	1456(%rax), %rsi
	movq	%rsi, 3632(%rsp)
	movq	1464(%rax), %rsi
	movq	%rsi, 3640(%rsp)
	movq	1472(%rax), %rsi
	movq	%rsi, 3648(%rsp)
	movq	1480(%rax), %rsi
	movq	%rsi, 3656(%rsp)
	movq	1488(%rax), %rsi
	movq	%rsi, 3664(%rsp)
	movq	1496(%rax), %rsi
	movq	%rsi, 3672(%rsp)
	movq	1504(%rax), %rsi
	movq	%rsi, 3680(%rsp)
	movq	1512(%rax), %rsi
	movq	%rsi, 3688(%rsp)
	movq	1520(%rax), %rsi
	movq	%rsi, 3696(%rsp)
	movq	1528(%rax), %rax
	movq	%rax, 3704(%rsp)
	leaq	5280(%rsp), %rsi
	leaq	2176(%rsp), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$64:
	leaq	5792(%rsp), %rsi
	leaq	2560(%rsp), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$63:
	leaq	6304(%rsp), %rsi
	leaq	2944(%rsp), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$62:
	leaq	6816(%rsp), %rsi
	leaq	3328(%rsp), %rdi
	call	L_i_poly_frombytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$61:
	movq	1536(%rcx), %rax
	movq	%rax, 23248(%rsp)
	movq	1544(%rcx), %rax
	movq	%rax, 23256(%rsp)
	movq	1552(%rcx), %rax
	movq	%rax, 23264(%rsp)
	movq	1560(%rcx), %rax
	movq	%rax, 23272(%rsp)
	leaq	128(%rsp), %rax
	call	L_i_poly_frommsg$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$60:
	movq	%r8, %mm4
	movq	$1, %rcx
	leaq	13472(%rsp), %rax
	leaq	23248(%rsp), %rsi
	leaq	-2168(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$59:
	leaq	2168(%rsp), %rsp
	movq	%mm4, %r9
	movb	$0, %bpl
	leaq	7328(%rsp), %rdx
	leaq	7840(%rsp), %r10
	leaq	8352(%rsp), %r11
	leaq	8864(%rsp), %rbx
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$58:
	leaq	600(%rsp), %rsp
	movq	%mm4, %r9
	movb	$4, %bpl
	leaq	9376(%rsp), %rdx
	leaq	9888(%rsp), %r10
	leaq	10400(%rsp), %r11
	leaq	10912(%rsp), %rbx
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
	leaq	7328(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$55:
	leaq	7840(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$54:
	leaq	8352(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$53:
	leaq	8864(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$52:
	leaq	11424(%rsp), %rax
	leaq	13472(%rsp), %rdx
	leaq	7328(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$51:
	leaq	1152(%rsp), %rax
	leaq	13984(%rsp), %rdx
	leaq	7840(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$50:
	leaq	11424(%rsp), %rax
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$49:
	leaq	1152(%rsp), %rax
	leaq	14496(%rsp), %rdx
	leaq	8352(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$48:
	leaq	11424(%rsp), %rax
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$47:
	leaq	1152(%rsp), %rax
	leaq	15008(%rsp), %rdx
	leaq	8864(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$46:
	leaq	11424(%rsp), %rax
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$45:
	leaq	11936(%rsp), %rax
	leaq	15520(%rsp), %rdx
	leaq	7328(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$44:
	leaq	1152(%rsp), %rax
	leaq	16032(%rsp), %rdx
	leaq	7840(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$43:
	leaq	11936(%rsp), %rax
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$42:
	leaq	1152(%rsp), %rax
	leaq	16544(%rsp), %rdx
	leaq	8352(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$41:
	leaq	11936(%rsp), %rax
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$40:
	leaq	1152(%rsp), %rax
	leaq	17056(%rsp), %rdx
	leaq	8864(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$39:
	leaq	11936(%rsp), %rax
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$38:
	leaq	12448(%rsp), %rax
	leaq	17568(%rsp), %rdx
	leaq	7328(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$37:
	leaq	1152(%rsp), %rax
	leaq	18080(%rsp), %rdx
	leaq	7840(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$36:
	leaq	12448(%rsp), %rax
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$35:
	leaq	1152(%rsp), %rax
	leaq	18592(%rsp), %rdx
	leaq	8352(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$34:
	leaq	12448(%rsp), %rax
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$33:
	leaq	1152(%rsp), %rax
	leaq	19104(%rsp), %rdx
	leaq	8864(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$32:
	leaq	12448(%rsp), %rax
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$31:
	leaq	12960(%rsp), %rax
	leaq	19616(%rsp), %rdx
	leaq	7328(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$30:
	leaq	1152(%rsp), %rax
	leaq	20128(%rsp), %rdx
	leaq	7840(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$29:
	leaq	12960(%rsp), %rax
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$28:
	leaq	1152(%rsp), %rax
	leaq	20640(%rsp), %rdx
	leaq	8352(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$27:
	leaq	12960(%rsp), %rax
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$26:
	leaq	1152(%rsp), %rax
	leaq	21152(%rsp), %rdx
	leaq	8864(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$25:
	leaq	12960(%rsp), %rax
	leaq	1152(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$24:
	leaq	1152(%rsp), %rax
	leaq	5280(%rsp), %rdx
	leaq	7328(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$23:
	leaq	1664(%rsp), %rax
	leaq	5792(%rsp), %rdx
	leaq	7840(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$22:
	leaq	1152(%rsp), %rax
	leaq	1664(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$21:
	leaq	1664(%rsp), %rax
	leaq	6304(%rsp), %rdx
	leaq	8352(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$20:
	leaq	1152(%rsp), %rax
	leaq	1664(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$19:
	leaq	1664(%rsp), %rax
	leaq	6816(%rsp), %rdx
	leaq	8864(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$18:
	leaq	1152(%rsp), %rax
	leaq	1664(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$17:
	leaq	11424(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$16:
	leaq	11936(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$15:
	leaq	12448(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$14:
	leaq	12960(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$13:
	leaq	1152(%rsp), %rax
	call	L_poly_invntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$12:
	leaq	11424(%rsp), %rax
	leaq	9376(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$11:
	leaq	11936(%rsp), %rax
	leaq	9888(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$10:
	leaq	12448(%rsp), %rax
	leaq	10400(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$9:
	leaq	12960(%rsp), %rax
	leaq	10912(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$8:
	leaq	1152(%rsp), %rax
	leaq	640(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$7:
	leaq	1152(%rsp), %rax
	leaq	128(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$6:
	leaq	11424(%rsp), %rax
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
	leaq	11936(%rsp), %rax
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
	leaq	12448(%rsp), %rax
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
	leaq	12960(%rsp), %rax
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
	movq	%mm3, %rax
	movq	%rax, %rcx
	leaq	11424(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$5:
	leaq	11936(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$4:
	leaq	12448(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$3:
	leaq	12960(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$2:
	leaq	glob_data + 1120(%rip), %rdx
	vmovdqu	(%rdx), %ymm0
	vpsllw	$3, %ymm0, %ymm1
	vpbroadcastw	glob_data + 5184(%rip), %ymm2
	vpbroadcastw	glob_data + 5182(%rip), %ymm3
	vpbroadcastw	glob_data + 5180(%rip), %ymm4
	vpbroadcastq	glob_data + 4968(%rip), %ymm5
	vpbroadcastq	glob_data + 4960(%rip), %ymm6
	vmovdqu	glob_data + 160(%rip), %ymm7
	vmovdqu	glob_data + 128(%rip), %ymm8
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
	vmovdqu	%xmm10, (%rcx)
	movq	%xmm9, 16(%rcx)
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
	vmovdqu	%xmm10, 22(%rcx)
	movq	%xmm9, 38(%rcx)
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
	vmovdqu	%xmm10, 44(%rcx)
	movq	%xmm9, 60(%rcx)
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
	vmovdqu	%xmm10, 66(%rcx)
	movq	%xmm9, 82(%rcx)
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
	vmovdqu	%xmm10, 88(%rcx)
	movq	%xmm9, 104(%rcx)
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
	vmovdqu	%xmm10, 110(%rcx)
	movq	%xmm9, 126(%rcx)
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
	vmovdqu	%xmm10, 132(%rcx)
	movq	%xmm9, 148(%rcx)
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
	vmovdqu	%xmm10, 154(%rcx)
	movq	%xmm9, 170(%rcx)
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
	vmovdqu	%xmm10, 176(%rcx)
	movq	%xmm9, 192(%rcx)
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
	vmovdqu	%xmm10, 198(%rcx)
	movq	%xmm9, 214(%rcx)
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
	vmovdqu	%xmm10, 220(%rcx)
	movq	%xmm9, 236(%rcx)
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
	vmovdqu	%xmm10, 242(%rcx)
	movq	%xmm9, 258(%rcx)
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
	vmovdqu	%xmm10, 264(%rcx)
	movq	%xmm9, 280(%rcx)
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
	vmovdqu	%xmm10, 286(%rcx)
	movq	%xmm9, 302(%rcx)
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
	vmovdqu	%xmm10, 308(%rcx)
	movq	%xmm9, 324(%rcx)
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
	vmovdqu	%xmm10, 330(%rcx)
	movq	%xmm9, 346(%rcx)
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
	vmovdqu	%xmm10, 352(%rcx)
	movq	%xmm9, 368(%rcx)
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
	vmovdqu	%xmm10, 374(%rcx)
	movq	%xmm9, 390(%rcx)
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
	vmovdqu	%xmm10, 396(%rcx)
	movq	%xmm9, 412(%rcx)
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
	vmovdqu	%xmm10, 418(%rcx)
	movq	%xmm9, 434(%rcx)
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
	vmovdqu	%xmm10, 440(%rcx)
	movq	%xmm9, 456(%rcx)
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
	vmovdqu	%xmm10, 462(%rcx)
	movq	%xmm9, 478(%rcx)
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
	vmovdqu	%xmm10, 484(%rcx)
	movq	%xmm9, 500(%rcx)
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
	vmovdqu	%xmm10, 506(%rcx)
	movq	%xmm9, 522(%rcx)
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
	vmovdqu	%xmm10, 528(%rcx)
	movq	%xmm9, 544(%rcx)
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
	vmovdqu	%xmm10, 550(%rcx)
	movq	%xmm9, 566(%rcx)
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
	vmovdqu	%xmm10, 572(%rcx)
	movq	%xmm9, 588(%rcx)
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
	vmovdqu	%xmm10, 594(%rcx)
	movq	%xmm9, 610(%rcx)
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
	vmovdqu	%xmm10, 616(%rcx)
	movq	%xmm9, 632(%rcx)
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
	vmovdqu	%xmm10, 638(%rcx)
	movq	%xmm9, 654(%rcx)
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
	vmovdqu	%xmm10, 660(%rcx)
	movq	%xmm9, 676(%rcx)
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
	vmovdqu	%xmm10, 682(%rcx)
	movq	%xmm9, 698(%rcx)
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
	vmovdqu	%xmm10, 704(%rcx)
	movq	%xmm9, 720(%rcx)
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
	vmovdqu	%xmm10, 726(%rcx)
	movq	%xmm9, 742(%rcx)
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
	vmovdqu	%xmm10, 748(%rcx)
	movq	%xmm9, 764(%rcx)
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
	vmovdqu	%xmm10, 770(%rcx)
	movq	%xmm9, 786(%rcx)
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
	vmovdqu	%xmm10, 792(%rcx)
	movq	%xmm9, 808(%rcx)
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
	vmovdqu	%xmm10, 814(%rcx)
	movq	%xmm9, 830(%rcx)
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
	vmovdqu	%xmm10, 836(%rcx)
	movq	%xmm9, 852(%rcx)
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
	vmovdqu	%xmm10, 858(%rcx)
	movq	%xmm9, 874(%rcx)
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
	vmovdqu	%xmm10, 880(%rcx)
	movq	%xmm9, 896(%rcx)
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
	vmovdqu	%xmm10, 902(%rcx)
	movq	%xmm9, 918(%rcx)
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
	vmovdqu	%xmm10, 924(%rcx)
	movq	%xmm9, 940(%rcx)
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
	vmovdqu	%xmm10, 946(%rcx)
	movq	%xmm9, 962(%rcx)
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
	vmovdqu	%xmm10, 968(%rcx)
	movq	%xmm9, 984(%rcx)
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
	vmovdqu	%xmm10, 990(%rcx)
	movq	%xmm9, 1006(%rcx)
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
	vmovdqu	%xmm10, 1012(%rcx)
	movq	%xmm9, 1028(%rcx)
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
	vmovdqu	%xmm10, 1034(%rcx)
	movq	%xmm9, 1050(%rcx)
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
	vmovdqu	%xmm10, 1056(%rcx)
	movq	%xmm9, 1072(%rcx)
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
	vmovdqu	%xmm10, 1078(%rcx)
	movq	%xmm9, 1094(%rcx)
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
	vmovdqu	%xmm10, 1100(%rcx)
	movq	%xmm9, 1116(%rcx)
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
	vmovdqu	%xmm10, 1122(%rcx)
	movq	%xmm9, 1138(%rcx)
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
	vmovdqu	%xmm10, 1144(%rcx)
	movq	%xmm9, 1160(%rcx)
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
	vmovdqu	%xmm10, 1166(%rcx)
	movq	%xmm9, 1182(%rcx)
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
	vmovdqu	%xmm10, 1188(%rcx)
	movq	%xmm9, 1204(%rcx)
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
	vmovdqu	%xmm10, 1210(%rcx)
	movq	%xmm9, 1226(%rcx)
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
	vmovdqu	%xmm10, 1232(%rcx)
	movq	%xmm9, 1248(%rcx)
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
	vmovdqu	%xmm10, 1254(%rcx)
	movq	%xmm9, 1270(%rcx)
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
	vmovdqu	%xmm10, 1276(%rcx)
	movq	%xmm9, 1292(%rcx)
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
	vmovdqu	%xmm10, 1298(%rcx)
	movq	%xmm9, 1314(%rcx)
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
	vmovdqu	%xmm10, 1320(%rcx)
	movq	%xmm9, 1336(%rcx)
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
	vmovdqu	%xmm10, 1342(%rcx)
	movq	%xmm9, 1358(%rcx)
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
	vmovdqu	%xmm10, 1364(%rcx)
	movq	%xmm9, 1380(%rcx)
	vmovdqu	13440(%rsp), %ymm9
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
	vmovdqu	%xmm1, 1386(%rcx)
	movq	%xmm0, 1402(%rcx)
	leaq	1408(%rax), %rax
	leaq	1152(%rsp), %rdx
	call	L_poly_csubq$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand$1:
	leaq	glob_data + 1120(%rip), %rcx
	vmovdqu	(%rcx), %ymm0
	vpbroadcastw	glob_data + 5190(%rip), %ymm1
	vpbroadcastw	glob_data + 5192(%rip), %ymm2
	vpbroadcastw	glob_data + 5188(%rip), %ymm3
	vpbroadcastd	glob_data + 5176(%rip), %ymm4
	vpbroadcastq	glob_data + 4976(%rip), %ymm5
	vmovdqu	glob_data + 416(%rip), %ymm6
	vmovdqu	(%rdx), %ymm7
	vmovdqu	32(%rdx), %ymm8
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
	vmovdqu	64(%rdx), %ymm7
	vmovdqu	96(%rdx), %ymm8
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
	vmovdqu	128(%rdx), %ymm7
	vmovdqu	160(%rdx), %ymm8
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
	vmovdqu	192(%rdx), %ymm7
	vmovdqu	224(%rdx), %ymm8
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
	vmovdqu	256(%rdx), %ymm7
	vmovdqu	288(%rdx), %ymm8
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
	vmovdqu	320(%rdx), %ymm7
	vmovdqu	352(%rdx), %ymm8
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
	vmovdqu	384(%rdx), %ymm7
	vmovdqu	416(%rdx), %ymm8
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
	vmovdqu	448(%rdx), %ymm7
	vmovdqu	480(%rdx), %ymm8
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
	movq	23240(%rsp), %rax
	movq	64(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	72(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	80(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	88(%rsp), %rcx
	movq	%rcx, 24(%rax)
	movq	%mm1, %rax
	movq	%mm2, %rcx
	movq	21664(%rsp), %rdx
	movq	%rdx, (%rax)
	movq	21672(%rsp), %rdx
	movq	%rdx, 8(%rax)
	movq	21680(%rsp), %rdx
	movq	%rdx, 16(%rax)
	movq	21688(%rsp), %rdx
	movq	%rdx, 24(%rax)
	movq	21696(%rsp), %rdx
	movq	%rdx, 32(%rax)
	movq	21704(%rsp), %rdx
	movq	%rdx, 40(%rax)
	movq	21712(%rsp), %rdx
	movq	%rdx, 48(%rax)
	movq	21720(%rsp), %rdx
	movq	%rdx, 56(%rax)
	movq	21728(%rsp), %rdx
	movq	%rdx, 64(%rax)
	movq	21736(%rsp), %rdx
	movq	%rdx, 72(%rax)
	movq	21744(%rsp), %rdx
	movq	%rdx, 80(%rax)
	movq	21752(%rsp), %rdx
	movq	%rdx, 88(%rax)
	movq	21760(%rsp), %rdx
	movq	%rdx, 96(%rax)
	movq	21768(%rsp), %rdx
	movq	%rdx, 104(%rax)
	movq	21776(%rsp), %rdx
	movq	%rdx, 112(%rax)
	movq	21784(%rsp), %rdx
	movq	%rdx, 120(%rax)
	movq	21792(%rsp), %rdx
	movq	%rdx, 128(%rax)
	movq	21800(%rsp), %rdx
	movq	%rdx, 136(%rax)
	movq	21808(%rsp), %rdx
	movq	%rdx, 144(%rax)
	movq	21816(%rsp), %rdx
	movq	%rdx, 152(%rax)
	movq	21824(%rsp), %rdx
	movq	%rdx, 160(%rax)
	movq	21832(%rsp), %rdx
	movq	%rdx, 168(%rax)
	movq	21840(%rsp), %rdx
	movq	%rdx, 176(%rax)
	movq	21848(%rsp), %rdx
	movq	%rdx, 184(%rax)
	movq	21856(%rsp), %rdx
	movq	%rdx, 192(%rax)
	movq	21864(%rsp), %rdx
	movq	%rdx, 200(%rax)
	movq	21872(%rsp), %rdx
	movq	%rdx, 208(%rax)
	movq	21880(%rsp), %rdx
	movq	%rdx, 216(%rax)
	movq	21888(%rsp), %rdx
	movq	%rdx, 224(%rax)
	movq	21896(%rsp), %rdx
	movq	%rdx, 232(%rax)
	movq	21904(%rsp), %rdx
	movq	%rdx, 240(%rax)
	movq	21912(%rsp), %rdx
	movq	%rdx, 248(%rax)
	movq	21920(%rsp), %rdx
	movq	%rdx, 256(%rax)
	movq	21928(%rsp), %rdx
	movq	%rdx, 264(%rax)
	movq	21936(%rsp), %rdx
	movq	%rdx, 272(%rax)
	movq	21944(%rsp), %rdx
	movq	%rdx, 280(%rax)
	movq	21952(%rsp), %rdx
	movq	%rdx, 288(%rax)
	movq	21960(%rsp), %rdx
	movq	%rdx, 296(%rax)
	movq	21968(%rsp), %rdx
	movq	%rdx, 304(%rax)
	movq	21976(%rsp), %rdx
	movq	%rdx, 312(%rax)
	movq	21984(%rsp), %rdx
	movq	%rdx, 320(%rax)
	movq	21992(%rsp), %rdx
	movq	%rdx, 328(%rax)
	movq	22000(%rsp), %rdx
	movq	%rdx, 336(%rax)
	movq	22008(%rsp), %rdx
	movq	%rdx, 344(%rax)
	movq	22016(%rsp), %rdx
	movq	%rdx, 352(%rax)
	movq	22024(%rsp), %rdx
	movq	%rdx, 360(%rax)
	movq	22032(%rsp), %rdx
	movq	%rdx, 368(%rax)
	movq	22040(%rsp), %rdx
	movq	%rdx, 376(%rax)
	movq	22048(%rsp), %rdx
	movq	%rdx, 384(%rax)
	movq	22056(%rsp), %rdx
	movq	%rdx, 392(%rax)
	movq	22064(%rsp), %rdx
	movq	%rdx, 400(%rax)
	movq	22072(%rsp), %rdx
	movq	%rdx, 408(%rax)
	movq	22080(%rsp), %rdx
	movq	%rdx, 416(%rax)
	movq	22088(%rsp), %rdx
	movq	%rdx, 424(%rax)
	movq	22096(%rsp), %rdx
	movq	%rdx, 432(%rax)
	movq	22104(%rsp), %rdx
	movq	%rdx, 440(%rax)
	movq	22112(%rsp), %rdx
	movq	%rdx, 448(%rax)
	movq	22120(%rsp), %rdx
	movq	%rdx, 456(%rax)
	movq	22128(%rsp), %rdx
	movq	%rdx, 464(%rax)
	movq	22136(%rsp), %rdx
	movq	%rdx, 472(%rax)
	movq	22144(%rsp), %rdx
	movq	%rdx, 480(%rax)
	movq	22152(%rsp), %rdx
	movq	%rdx, 488(%rax)
	movq	22160(%rsp), %rdx
	movq	%rdx, 496(%rax)
	movq	22168(%rsp), %rdx
	movq	%rdx, 504(%rax)
	movq	22176(%rsp), %rdx
	movq	%rdx, 512(%rax)
	movq	22184(%rsp), %rdx
	movq	%rdx, 520(%rax)
	movq	22192(%rsp), %rdx
	movq	%rdx, 528(%rax)
	movq	22200(%rsp), %rdx
	movq	%rdx, 536(%rax)
	movq	22208(%rsp), %rdx
	movq	%rdx, 544(%rax)
	movq	22216(%rsp), %rdx
	movq	%rdx, 552(%rax)
	movq	22224(%rsp), %rdx
	movq	%rdx, 560(%rax)
	movq	22232(%rsp), %rdx
	movq	%rdx, 568(%rax)
	movq	22240(%rsp), %rdx
	movq	%rdx, 576(%rax)
	movq	22248(%rsp), %rdx
	movq	%rdx, 584(%rax)
	movq	22256(%rsp), %rdx
	movq	%rdx, 592(%rax)
	movq	22264(%rsp), %rdx
	movq	%rdx, 600(%rax)
	movq	22272(%rsp), %rdx
	movq	%rdx, 608(%rax)
	movq	22280(%rsp), %rdx
	movq	%rdx, 616(%rax)
	movq	22288(%rsp), %rdx
	movq	%rdx, 624(%rax)
	movq	22296(%rsp), %rdx
	movq	%rdx, 632(%rax)
	movq	22304(%rsp), %rdx
	movq	%rdx, 640(%rax)
	movq	22312(%rsp), %rdx
	movq	%rdx, 648(%rax)
	movq	22320(%rsp), %rdx
	movq	%rdx, 656(%rax)
	movq	22328(%rsp), %rdx
	movq	%rdx, 664(%rax)
	movq	22336(%rsp), %rdx
	movq	%rdx, 672(%rax)
	movq	22344(%rsp), %rdx
	movq	%rdx, 680(%rax)
	movq	22352(%rsp), %rdx
	movq	%rdx, 688(%rax)
	movq	22360(%rsp), %rdx
	movq	%rdx, 696(%rax)
	movq	22368(%rsp), %rdx
	movq	%rdx, 704(%rax)
	movq	22376(%rsp), %rdx
	movq	%rdx, 712(%rax)
	movq	22384(%rsp), %rdx
	movq	%rdx, 720(%rax)
	movq	22392(%rsp), %rdx
	movq	%rdx, 728(%rax)
	movq	22400(%rsp), %rdx
	movq	%rdx, 736(%rax)
	movq	22408(%rsp), %rdx
	movq	%rdx, 744(%rax)
	movq	22416(%rsp), %rdx
	movq	%rdx, 752(%rax)
	movq	22424(%rsp), %rdx
	movq	%rdx, 760(%rax)
	movq	22432(%rsp), %rdx
	movq	%rdx, 768(%rax)
	movq	22440(%rsp), %rdx
	movq	%rdx, 776(%rax)
	movq	22448(%rsp), %rdx
	movq	%rdx, 784(%rax)
	movq	22456(%rsp), %rdx
	movq	%rdx, 792(%rax)
	movq	22464(%rsp), %rdx
	movq	%rdx, 800(%rax)
	movq	22472(%rsp), %rdx
	movq	%rdx, 808(%rax)
	movq	22480(%rsp), %rdx
	movq	%rdx, 816(%rax)
	movq	22488(%rsp), %rdx
	movq	%rdx, 824(%rax)
	movq	22496(%rsp), %rdx
	movq	%rdx, 832(%rax)
	movq	22504(%rsp), %rdx
	movq	%rdx, 840(%rax)
	movq	22512(%rsp), %rdx
	movq	%rdx, 848(%rax)
	movq	22520(%rsp), %rdx
	movq	%rdx, 856(%rax)
	movq	22528(%rsp), %rdx
	movq	%rdx, 864(%rax)
	movq	22536(%rsp), %rdx
	movq	%rdx, 872(%rax)
	movq	22544(%rsp), %rdx
	movq	%rdx, 880(%rax)
	movq	22552(%rsp), %rdx
	movq	%rdx, 888(%rax)
	movq	22560(%rsp), %rdx
	movq	%rdx, 896(%rax)
	movq	22568(%rsp), %rdx
	movq	%rdx, 904(%rax)
	movq	22576(%rsp), %rdx
	movq	%rdx, 912(%rax)
	movq	22584(%rsp), %rdx
	movq	%rdx, 920(%rax)
	movq	22592(%rsp), %rdx
	movq	%rdx, 928(%rax)
	movq	22600(%rsp), %rdx
	movq	%rdx, 936(%rax)
	movq	22608(%rsp), %rdx
	movq	%rdx, 944(%rax)
	movq	22616(%rsp), %rdx
	movq	%rdx, 952(%rax)
	movq	22624(%rsp), %rdx
	movq	%rdx, 960(%rax)
	movq	22632(%rsp), %rdx
	movq	%rdx, 968(%rax)
	movq	22640(%rsp), %rdx
	movq	%rdx, 976(%rax)
	movq	22648(%rsp), %rdx
	movq	%rdx, 984(%rax)
	movq	22656(%rsp), %rdx
	movq	%rdx, 992(%rax)
	movq	22664(%rsp), %rdx
	movq	%rdx, 1000(%rax)
	movq	22672(%rsp), %rdx
	movq	%rdx, 1008(%rax)
	movq	22680(%rsp), %rdx
	movq	%rdx, 1016(%rax)
	movq	22688(%rsp), %rdx
	movq	%rdx, 1024(%rax)
	movq	22696(%rsp), %rdx
	movq	%rdx, 1032(%rax)
	movq	22704(%rsp), %rdx
	movq	%rdx, 1040(%rax)
	movq	22712(%rsp), %rdx
	movq	%rdx, 1048(%rax)
	movq	22720(%rsp), %rdx
	movq	%rdx, 1056(%rax)
	movq	22728(%rsp), %rdx
	movq	%rdx, 1064(%rax)
	movq	22736(%rsp), %rdx
	movq	%rdx, 1072(%rax)
	movq	22744(%rsp), %rdx
	movq	%rdx, 1080(%rax)
	movq	22752(%rsp), %rdx
	movq	%rdx, 1088(%rax)
	movq	22760(%rsp), %rdx
	movq	%rdx, 1096(%rax)
	movq	22768(%rsp), %rdx
	movq	%rdx, 1104(%rax)
	movq	22776(%rsp), %rdx
	movq	%rdx, 1112(%rax)
	movq	22784(%rsp), %rdx
	movq	%rdx, 1120(%rax)
	movq	22792(%rsp), %rdx
	movq	%rdx, 1128(%rax)
	movq	22800(%rsp), %rdx
	movq	%rdx, 1136(%rax)
	movq	22808(%rsp), %rdx
	movq	%rdx, 1144(%rax)
	movq	22816(%rsp), %rdx
	movq	%rdx, 1152(%rax)
	movq	22824(%rsp), %rdx
	movq	%rdx, 1160(%rax)
	movq	22832(%rsp), %rdx
	movq	%rdx, 1168(%rax)
	movq	22840(%rsp), %rdx
	movq	%rdx, 1176(%rax)
	movq	22848(%rsp), %rdx
	movq	%rdx, 1184(%rax)
	movq	22856(%rsp), %rdx
	movq	%rdx, 1192(%rax)
	movq	22864(%rsp), %rdx
	movq	%rdx, 1200(%rax)
	movq	22872(%rsp), %rdx
	movq	%rdx, 1208(%rax)
	movq	22880(%rsp), %rdx
	movq	%rdx, 1216(%rax)
	movq	22888(%rsp), %rdx
	movq	%rdx, 1224(%rax)
	movq	22896(%rsp), %rdx
	movq	%rdx, 1232(%rax)
	movq	22904(%rsp), %rdx
	movq	%rdx, 1240(%rax)
	movq	22912(%rsp), %rdx
	movq	%rdx, 1248(%rax)
	movq	22920(%rsp), %rdx
	movq	%rdx, 1256(%rax)
	movq	22928(%rsp), %rdx
	movq	%rdx, 1264(%rax)
	movq	22936(%rsp), %rdx
	movq	%rdx, 1272(%rax)
	movq	22944(%rsp), %rdx
	movq	%rdx, 1280(%rax)
	movq	22952(%rsp), %rdx
	movq	%rdx, 1288(%rax)
	movq	22960(%rsp), %rdx
	movq	%rdx, 1296(%rax)
	movq	22968(%rsp), %rdx
	movq	%rdx, 1304(%rax)
	movq	22976(%rsp), %rdx
	movq	%rdx, 1312(%rax)
	movq	22984(%rsp), %rdx
	movq	%rdx, 1320(%rax)
	movq	22992(%rsp), %rdx
	movq	%rdx, 1328(%rax)
	movq	23000(%rsp), %rdx
	movq	%rdx, 1336(%rax)
	movq	23008(%rsp), %rdx
	movq	%rdx, 1344(%rax)
	movq	23016(%rsp), %rdx
	movq	%rdx, 1352(%rax)
	movq	23024(%rsp), %rdx
	movq	%rdx, 1360(%rax)
	movq	23032(%rsp), %rdx
	movq	%rdx, 1368(%rax)
	movq	23040(%rsp), %rdx
	movq	%rdx, 1376(%rax)
	movq	23048(%rsp), %rdx
	movq	%rdx, 1384(%rax)
	movq	23056(%rsp), %rdx
	movq	%rdx, 1392(%rax)
	movq	23064(%rsp), %rdx
	movq	%rdx, 1400(%rax)
	movq	23072(%rsp), %rdx
	movq	%rdx, 1408(%rax)
	movq	23080(%rsp), %rdx
	movq	%rdx, 1416(%rax)
	movq	23088(%rsp), %rdx
	movq	%rdx, 1424(%rax)
	movq	23096(%rsp), %rdx
	movq	%rdx, 1432(%rax)
	movq	23104(%rsp), %rdx
	movq	%rdx, 1440(%rax)
	movq	23112(%rsp), %rdx
	movq	%rdx, 1448(%rax)
	movq	23120(%rsp), %rdx
	movq	%rdx, 1456(%rax)
	movq	23128(%rsp), %rdx
	movq	%rdx, 1464(%rax)
	movq	23136(%rsp), %rdx
	movq	%rdx, 1472(%rax)
	movq	23144(%rsp), %rdx
	movq	%rdx, 1480(%rax)
	movq	23152(%rsp), %rdx
	movq	%rdx, 1488(%rax)
	movq	23160(%rsp), %rdx
	movq	%rdx, 1496(%rax)
	movq	23168(%rsp), %rdx
	movq	%rdx, 1504(%rax)
	movq	23176(%rsp), %rdx
	movq	%rdx, 1512(%rax)
	movq	23184(%rsp), %rdx
	movq	%rdx, 1520(%rax)
	movq	23192(%rsp), %rdx
	movq	%rdx, 1528(%rax)
	movq	23200(%rsp), %rdx
	movq	%rdx, 1536(%rax)
	movq	23208(%rsp), %rdx
	movq	%rdx, 1544(%rax)
	movq	23216(%rsp), %rdx
	movq	%rdx, 1552(%rax)
	movq	23224(%rsp), %rdx
	movq	%rdx, 1560(%rax)
	movq	23280(%rsp), %rax
	movq	%rax, (%rcx)
	movq	23288(%rsp), %rax
	movq	%rax, 8(%rcx)
	movq	23296(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	23304(%rsp), %rax
	movq	%rax, 24(%rcx)
	xorq	%rax, %rax
	movq	23312(%rsp), %rbx
	movq	23320(%rsp), %rbp
	movq	23328(%rsp), %r12
	movq	23336(%rsp), %r13
	movq	23344(%rsp), %r14
	movq	23352(%rsp), %r15
	movq	23360(%rsp), %rsp
	ret
_jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand:
jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand:
	movq	%rsp, %rax
	leaq	-19880(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, 19824(%rsp)
	movq	%rbp, 19832(%rsp)
	movq	%r12, 19840(%rsp)
	movq	%r13, 19848(%rsp)
	movq	%r14, 19856(%rsp)
	movq	%r15, 19864(%rsp)
	movq	%rax, 19872(%rsp)
	lfence
	movq	$0, %rax
	movq	%rdi, %mm1
	movq	%rsi, %mm2
	movq	(%rdx), %rax
	movq	%rax, 19760(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 19768(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 19776(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 19784(%rsp)
	movq	32(%rdx), %rax
	movq	%rax, 19792(%rsp)
	movq	40(%rdx), %rax
	movq	%rax, 19800(%rsp)
	movq	48(%rdx), %rax
	movq	%rax, 19808(%rsp)
	movq	56(%rdx), %rax
	movq	%rax, 19816(%rsp)
	leaq	576(%rsp), %rax
	leaq	8288(%rsp), %rcx
	leaq	19760(%rsp), %rdx
	movq	%rdx, %mm3
	movq	%rax, %mm4
	movq	%rcx, %mm5
	movq	(%rdx), %rax
	movq	%rax, 19680(%rsp)
	movq	8(%rdx), %rax
	movq	%rax, 19688(%rsp)
	movq	16(%rdx), %rax
	movq	%rax, 19696(%rsp)
	movq	24(%rdx), %rax
	movq	%rax, 19704(%rsp)
	movb	$4, 19712(%rsp)
	movq	%rsp, %rax
	leaq	19680(%rsp), %rcx
	call	L_sha3_512A_A33$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$57:
	movq	(%rsp), %rax
	movq	%rax, 19648(%rsp)
	movq	32(%rsp), %rax
	movq	%rax, 19728(%rsp)
	movq	8(%rsp), %rax
	movq	%rax, 19656(%rsp)
	movq	40(%rsp), %rax
	movq	%rax, 19736(%rsp)
	movq	16(%rsp), %rax
	movq	%rax, 19664(%rsp)
	movq	48(%rsp), %rax
	movq	%rax, 19744(%rsp)
	movq	24(%rsp), %rax
	movq	%rax, 19672(%rsp)
	movq	56(%rsp), %rax
	movq	%rax, 19752(%rsp)
	movq	$0, %rcx
	leaq	11456(%rsp), %rax
	leaq	19648(%rsp), %rsi
	leaq	-2168(%rsp), %rsp
	call	L_gen_matrix_avx2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$56:
	leaq	2168(%rsp), %rsp
	movb	$0, %bpl
	leaq	2144(%rsp), %rdx
	leaq	2656(%rsp), %r10
	leaq	3168(%rsp), %r11
	leaq	3680(%rsp), %rbx
	leaq	19728(%rsp), %r9
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$55:
	leaq	600(%rsp), %rsp
	movb	$4, %bpl
	leaq	4192(%rsp), %rdx
	leaq	4704(%rsp), %r10
	leaq	5216(%rsp), %r11
	leaq	5728(%rsp), %rbx
	leaq	19728(%rsp), %r9
	leaq	-600(%rsp), %rsp
	call	L_poly_getnoise_eta1_4x$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$54:
	leaq	600(%rsp), %rsp
	leaq	2144(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$53:
	leaq	2656(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$52:
	leaq	3168(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$51:
	leaq	3680(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$50:
	leaq	4192(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$49:
	leaq	4704(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$48:
	leaq	5216(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$47:
	leaq	5728(%rsp), %rax
	call	L_poly_ntt$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$46:
	leaq	6240(%rsp), %rax
	leaq	11456(%rsp), %rdx
	leaq	2144(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$45:
	leaq	64(%rsp), %rax
	leaq	11968(%rsp), %rdx
	leaq	2656(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$44:
	leaq	6240(%rsp), %rax
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$43:
	leaq	64(%rsp), %rax
	leaq	12480(%rsp), %rdx
	leaq	3168(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$42:
	leaq	6240(%rsp), %rax
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$41:
	leaq	64(%rsp), %rax
	leaq	12992(%rsp), %rdx
	leaq	3680(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$40:
	leaq	6240(%rsp), %rax
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$39:
	leaq	6240(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$38:
	leaq	6752(%rsp), %rax
	leaq	13504(%rsp), %rdx
	leaq	2144(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$37:
	leaq	64(%rsp), %rax
	leaq	14016(%rsp), %rdx
	leaq	2656(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$36:
	leaq	6752(%rsp), %rax
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$35:
	leaq	64(%rsp), %rax
	leaq	14528(%rsp), %rdx
	leaq	3168(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$34:
	leaq	6752(%rsp), %rax
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$33:
	leaq	64(%rsp), %rax
	leaq	15040(%rsp), %rdx
	leaq	3680(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$32:
	leaq	6752(%rsp), %rax
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$31:
	leaq	6752(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$30:
	leaq	7264(%rsp), %rax
	leaq	15552(%rsp), %rdx
	leaq	2144(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$29:
	leaq	64(%rsp), %rax
	leaq	16064(%rsp), %rdx
	leaq	2656(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$28:
	leaq	7264(%rsp), %rax
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$27:
	leaq	64(%rsp), %rax
	leaq	16576(%rsp), %rdx
	leaq	3168(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$26:
	leaq	7264(%rsp), %rax
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$25:
	leaq	64(%rsp), %rax
	leaq	17088(%rsp), %rdx
	leaq	3680(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$24:
	leaq	7264(%rsp), %rax
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$23:
	leaq	7264(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$22:
	leaq	7776(%rsp), %rax
	leaq	17600(%rsp), %rdx
	leaq	2144(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$21:
	leaq	64(%rsp), %rax
	leaq	18112(%rsp), %rdx
	leaq	2656(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$20:
	leaq	7776(%rsp), %rax
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$19:
	leaq	64(%rsp), %rax
	leaq	18624(%rsp), %rdx
	leaq	3168(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$18:
	leaq	7776(%rsp), %rax
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$17:
	leaq	64(%rsp), %rax
	leaq	19136(%rsp), %rdx
	leaq	3680(%rsp), %rsi
	call	L_poly_basemul$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$16:
	leaq	7776(%rsp), %rax
	leaq	64(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$15:
	leaq	7776(%rsp), %rax
	call	L_poly_frommont$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$14:
	leaq	6240(%rsp), %rax
	leaq	4192(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$13:
	leaq	6752(%rsp), %rax
	leaq	4704(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$12:
	leaq	7264(%rsp), %rax
	leaq	5216(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$11:
	leaq	7776(%rsp), %rax
	leaq	5728(%rsp), %rdx
	call	L_poly_add2$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$10:
	leaq	6240(%rsp), %rax
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
	leaq	6752(%rsp), %rax
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
	leaq	7264(%rsp), %rax
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
	leaq	7776(%rsp), %rax
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
	movq	%mm4, %rcx
	movq	%mm5, %rax
	movq	%rax, %rsi
	movq	%rsi, %rdi
	leaq	2144(%rsp), %rdx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$9:
	leaq	384(%rsi), %rdi
	leaq	2656(%rsp), %rdx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$8:
	leaq	768(%rsi), %rdi
	leaq	3168(%rsp), %rdx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$7:
	leaq	1152(%rsi), %rdi
	leaq	3680(%rsp), %rdx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$6:
	movq	%rcx, %rsi
	movq	%rsi, %rdi
	leaq	6240(%rsp), %rdx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$5:
	leaq	384(%rsi), %rdi
	leaq	6752(%rsp), %rdx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$4:
	leaq	768(%rsi), %rdi
	leaq	7264(%rsp), %rdx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$3:
	leaq	1152(%rsi), %rdi
	leaq	7776(%rsp), %rdx
	call	L_i_poly_tobytes$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$2:
	movq	19648(%rsp), %rdx
	movq	%rdx, 1536(%rcx)
	movq	19656(%rsp), %rdx
	movq	%rdx, 1544(%rcx)
	movq	19664(%rsp), %rdx
	movq	%rdx, 1552(%rcx)
	movq	19672(%rsp), %rdx
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
	movq	%rax, 19720(%rsp)
	leaq	19648(%rsp), %rdx
	call	L_sha3_256A_A1568$1
Ljade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand$1:
	movq	19720(%rsp), %rax
	movq	19648(%rsp), %rcx
	movq	%rcx, 3104(%rax)
	movq	19656(%rsp), %rcx
	movq	%rcx, 3112(%rax)
	movq	19664(%rsp), %rcx
	movq	%rcx, 3120(%rax)
	movq	19672(%rsp), %rcx
	movq	%rcx, 3128(%rax)
	movq	%mm3, %rcx
	leaq	32(%rcx), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, 3136(%rax)
	movq	8(%rcx), %rdx
	movq	%rdx, 3144(%rax)
	movq	16(%rcx), %rdx
	movq	%rdx, 3152(%rax)
	movq	24(%rcx), %rcx
	movq	%rcx, 3160(%rax)
	movq	%mm1, %rax
	movq	%mm2, %rcx
	movq	576(%rsp), %rdx
	movq	%rdx, (%rax)
	movq	584(%rsp), %rdx
	movq	%rdx, 8(%rax)
	movq	592(%rsp), %rdx
	movq	%rdx, 16(%rax)
	movq	600(%rsp), %rdx
	movq	%rdx, 24(%rax)
	movq	608(%rsp), %rdx
	movq	%rdx, 32(%rax)
	movq	616(%rsp), %rdx
	movq	%rdx, 40(%rax)
	movq	624(%rsp), %rdx
	movq	%rdx, 48(%rax)
	movq	632(%rsp), %rdx
	movq	%rdx, 56(%rax)
	movq	640(%rsp), %rdx
	movq	%rdx, 64(%rax)
	movq	648(%rsp), %rdx
	movq	%rdx, 72(%rax)
	movq	656(%rsp), %rdx
	movq	%rdx, 80(%rax)
	movq	664(%rsp), %rdx
	movq	%rdx, 88(%rax)
	movq	672(%rsp), %rdx
	movq	%rdx, 96(%rax)
	movq	680(%rsp), %rdx
	movq	%rdx, 104(%rax)
	movq	688(%rsp), %rdx
	movq	%rdx, 112(%rax)
	movq	696(%rsp), %rdx
	movq	%rdx, 120(%rax)
	movq	704(%rsp), %rdx
	movq	%rdx, 128(%rax)
	movq	712(%rsp), %rdx
	movq	%rdx, 136(%rax)
	movq	720(%rsp), %rdx
	movq	%rdx, 144(%rax)
	movq	728(%rsp), %rdx
	movq	%rdx, 152(%rax)
	movq	736(%rsp), %rdx
	movq	%rdx, 160(%rax)
	movq	744(%rsp), %rdx
	movq	%rdx, 168(%rax)
	movq	752(%rsp), %rdx
	movq	%rdx, 176(%rax)
	movq	760(%rsp), %rdx
	movq	%rdx, 184(%rax)
	movq	768(%rsp), %rdx
	movq	%rdx, 192(%rax)
	movq	776(%rsp), %rdx
	movq	%rdx, 200(%rax)
	movq	784(%rsp), %rdx
	movq	%rdx, 208(%rax)
	movq	792(%rsp), %rdx
	movq	%rdx, 216(%rax)
	movq	800(%rsp), %rdx
	movq	%rdx, 224(%rax)
	movq	808(%rsp), %rdx
	movq	%rdx, 232(%rax)
	movq	816(%rsp), %rdx
	movq	%rdx, 240(%rax)
	movq	824(%rsp), %rdx
	movq	%rdx, 248(%rax)
	movq	832(%rsp), %rdx
	movq	%rdx, 256(%rax)
	movq	840(%rsp), %rdx
	movq	%rdx, 264(%rax)
	movq	848(%rsp), %rdx
	movq	%rdx, 272(%rax)
	movq	856(%rsp), %rdx
	movq	%rdx, 280(%rax)
	movq	864(%rsp), %rdx
	movq	%rdx, 288(%rax)
	movq	872(%rsp), %rdx
	movq	%rdx, 296(%rax)
	movq	880(%rsp), %rdx
	movq	%rdx, 304(%rax)
	movq	888(%rsp), %rdx
	movq	%rdx, 312(%rax)
	movq	896(%rsp), %rdx
	movq	%rdx, 320(%rax)
	movq	904(%rsp), %rdx
	movq	%rdx, 328(%rax)
	movq	912(%rsp), %rdx
	movq	%rdx, 336(%rax)
	movq	920(%rsp), %rdx
	movq	%rdx, 344(%rax)
	movq	928(%rsp), %rdx
	movq	%rdx, 352(%rax)
	movq	936(%rsp), %rdx
	movq	%rdx, 360(%rax)
	movq	944(%rsp), %rdx
	movq	%rdx, 368(%rax)
	movq	952(%rsp), %rdx
	movq	%rdx, 376(%rax)
	movq	960(%rsp), %rdx
	movq	%rdx, 384(%rax)
	movq	968(%rsp), %rdx
	movq	%rdx, 392(%rax)
	movq	976(%rsp), %rdx
	movq	%rdx, 400(%rax)
	movq	984(%rsp), %rdx
	movq	%rdx, 408(%rax)
	movq	992(%rsp), %rdx
	movq	%rdx, 416(%rax)
	movq	1000(%rsp), %rdx
	movq	%rdx, 424(%rax)
	movq	1008(%rsp), %rdx
	movq	%rdx, 432(%rax)
	movq	1016(%rsp), %rdx
	movq	%rdx, 440(%rax)
	movq	1024(%rsp), %rdx
	movq	%rdx, 448(%rax)
	movq	1032(%rsp), %rdx
	movq	%rdx, 456(%rax)
	movq	1040(%rsp), %rdx
	movq	%rdx, 464(%rax)
	movq	1048(%rsp), %rdx
	movq	%rdx, 472(%rax)
	movq	1056(%rsp), %rdx
	movq	%rdx, 480(%rax)
	movq	1064(%rsp), %rdx
	movq	%rdx, 488(%rax)
	movq	1072(%rsp), %rdx
	movq	%rdx, 496(%rax)
	movq	1080(%rsp), %rdx
	movq	%rdx, 504(%rax)
	movq	1088(%rsp), %rdx
	movq	%rdx, 512(%rax)
	movq	1096(%rsp), %rdx
	movq	%rdx, 520(%rax)
	movq	1104(%rsp), %rdx
	movq	%rdx, 528(%rax)
	movq	1112(%rsp), %rdx
	movq	%rdx, 536(%rax)
	movq	1120(%rsp), %rdx
	movq	%rdx, 544(%rax)
	movq	1128(%rsp), %rdx
	movq	%rdx, 552(%rax)
	movq	1136(%rsp), %rdx
	movq	%rdx, 560(%rax)
	movq	1144(%rsp), %rdx
	movq	%rdx, 568(%rax)
	movq	1152(%rsp), %rdx
	movq	%rdx, 576(%rax)
	movq	1160(%rsp), %rdx
	movq	%rdx, 584(%rax)
	movq	1168(%rsp), %rdx
	movq	%rdx, 592(%rax)
	movq	1176(%rsp), %rdx
	movq	%rdx, 600(%rax)
	movq	1184(%rsp), %rdx
	movq	%rdx, 608(%rax)
	movq	1192(%rsp), %rdx
	movq	%rdx, 616(%rax)
	movq	1200(%rsp), %rdx
	movq	%rdx, 624(%rax)
	movq	1208(%rsp), %rdx
	movq	%rdx, 632(%rax)
	movq	1216(%rsp), %rdx
	movq	%rdx, 640(%rax)
	movq	1224(%rsp), %rdx
	movq	%rdx, 648(%rax)
	movq	1232(%rsp), %rdx
	movq	%rdx, 656(%rax)
	movq	1240(%rsp), %rdx
	movq	%rdx, 664(%rax)
	movq	1248(%rsp), %rdx
	movq	%rdx, 672(%rax)
	movq	1256(%rsp), %rdx
	movq	%rdx, 680(%rax)
	movq	1264(%rsp), %rdx
	movq	%rdx, 688(%rax)
	movq	1272(%rsp), %rdx
	movq	%rdx, 696(%rax)
	movq	1280(%rsp), %rdx
	movq	%rdx, 704(%rax)
	movq	1288(%rsp), %rdx
	movq	%rdx, 712(%rax)
	movq	1296(%rsp), %rdx
	movq	%rdx, 720(%rax)
	movq	1304(%rsp), %rdx
	movq	%rdx, 728(%rax)
	movq	1312(%rsp), %rdx
	movq	%rdx, 736(%rax)
	movq	1320(%rsp), %rdx
	movq	%rdx, 744(%rax)
	movq	1328(%rsp), %rdx
	movq	%rdx, 752(%rax)
	movq	1336(%rsp), %rdx
	movq	%rdx, 760(%rax)
	movq	1344(%rsp), %rdx
	movq	%rdx, 768(%rax)
	movq	1352(%rsp), %rdx
	movq	%rdx, 776(%rax)
	movq	1360(%rsp), %rdx
	movq	%rdx, 784(%rax)
	movq	1368(%rsp), %rdx
	movq	%rdx, 792(%rax)
	movq	1376(%rsp), %rdx
	movq	%rdx, 800(%rax)
	movq	1384(%rsp), %rdx
	movq	%rdx, 808(%rax)
	movq	1392(%rsp), %rdx
	movq	%rdx, 816(%rax)
	movq	1400(%rsp), %rdx
	movq	%rdx, 824(%rax)
	movq	1408(%rsp), %rdx
	movq	%rdx, 832(%rax)
	movq	1416(%rsp), %rdx
	movq	%rdx, 840(%rax)
	movq	1424(%rsp), %rdx
	movq	%rdx, 848(%rax)
	movq	1432(%rsp), %rdx
	movq	%rdx, 856(%rax)
	movq	1440(%rsp), %rdx
	movq	%rdx, 864(%rax)
	movq	1448(%rsp), %rdx
	movq	%rdx, 872(%rax)
	movq	1456(%rsp), %rdx
	movq	%rdx, 880(%rax)
	movq	1464(%rsp), %rdx
	movq	%rdx, 888(%rax)
	movq	1472(%rsp), %rdx
	movq	%rdx, 896(%rax)
	movq	1480(%rsp), %rdx
	movq	%rdx, 904(%rax)
	movq	1488(%rsp), %rdx
	movq	%rdx, 912(%rax)
	movq	1496(%rsp), %rdx
	movq	%rdx, 920(%rax)
	movq	1504(%rsp), %rdx
	movq	%rdx, 928(%rax)
	movq	1512(%rsp), %rdx
	movq	%rdx, 936(%rax)
	movq	1520(%rsp), %rdx
	movq	%rdx, 944(%rax)
	movq	1528(%rsp), %rdx
	movq	%rdx, 952(%rax)
	movq	1536(%rsp), %rdx
	movq	%rdx, 960(%rax)
	movq	1544(%rsp), %rdx
	movq	%rdx, 968(%rax)
	movq	1552(%rsp), %rdx
	movq	%rdx, 976(%rax)
	movq	1560(%rsp), %rdx
	movq	%rdx, 984(%rax)
	movq	1568(%rsp), %rdx
	movq	%rdx, 992(%rax)
	movq	1576(%rsp), %rdx
	movq	%rdx, 1000(%rax)
	movq	1584(%rsp), %rdx
	movq	%rdx, 1008(%rax)
	movq	1592(%rsp), %rdx
	movq	%rdx, 1016(%rax)
	movq	1600(%rsp), %rdx
	movq	%rdx, 1024(%rax)
	movq	1608(%rsp), %rdx
	movq	%rdx, 1032(%rax)
	movq	1616(%rsp), %rdx
	movq	%rdx, 1040(%rax)
	movq	1624(%rsp), %rdx
	movq	%rdx, 1048(%rax)
	movq	1632(%rsp), %rdx
	movq	%rdx, 1056(%rax)
	movq	1640(%rsp), %rdx
	movq	%rdx, 1064(%rax)
	movq	1648(%rsp), %rdx
	movq	%rdx, 1072(%rax)
	movq	1656(%rsp), %rdx
	movq	%rdx, 1080(%rax)
	movq	1664(%rsp), %rdx
	movq	%rdx, 1088(%rax)
	movq	1672(%rsp), %rdx
	movq	%rdx, 1096(%rax)
	movq	1680(%rsp), %rdx
	movq	%rdx, 1104(%rax)
	movq	1688(%rsp), %rdx
	movq	%rdx, 1112(%rax)
	movq	1696(%rsp), %rdx
	movq	%rdx, 1120(%rax)
	movq	1704(%rsp), %rdx
	movq	%rdx, 1128(%rax)
	movq	1712(%rsp), %rdx
	movq	%rdx, 1136(%rax)
	movq	1720(%rsp), %rdx
	movq	%rdx, 1144(%rax)
	movq	1728(%rsp), %rdx
	movq	%rdx, 1152(%rax)
	movq	1736(%rsp), %rdx
	movq	%rdx, 1160(%rax)
	movq	1744(%rsp), %rdx
	movq	%rdx, 1168(%rax)
	movq	1752(%rsp), %rdx
	movq	%rdx, 1176(%rax)
	movq	1760(%rsp), %rdx
	movq	%rdx, 1184(%rax)
	movq	1768(%rsp), %rdx
	movq	%rdx, 1192(%rax)
	movq	1776(%rsp), %rdx
	movq	%rdx, 1200(%rax)
	movq	1784(%rsp), %rdx
	movq	%rdx, 1208(%rax)
	movq	1792(%rsp), %rdx
	movq	%rdx, 1216(%rax)
	movq	1800(%rsp), %rdx
	movq	%rdx, 1224(%rax)
	movq	1808(%rsp), %rdx
	movq	%rdx, 1232(%rax)
	movq	1816(%rsp), %rdx
	movq	%rdx, 1240(%rax)
	movq	1824(%rsp), %rdx
	movq	%rdx, 1248(%rax)
	movq	1832(%rsp), %rdx
	movq	%rdx, 1256(%rax)
	movq	1840(%rsp), %rdx
	movq	%rdx, 1264(%rax)
	movq	1848(%rsp), %rdx
	movq	%rdx, 1272(%rax)
	movq	1856(%rsp), %rdx
	movq	%rdx, 1280(%rax)
	movq	1864(%rsp), %rdx
	movq	%rdx, 1288(%rax)
	movq	1872(%rsp), %rdx
	movq	%rdx, 1296(%rax)
	movq	1880(%rsp), %rdx
	movq	%rdx, 1304(%rax)
	movq	1888(%rsp), %rdx
	movq	%rdx, 1312(%rax)
	movq	1896(%rsp), %rdx
	movq	%rdx, 1320(%rax)
	movq	1904(%rsp), %rdx
	movq	%rdx, 1328(%rax)
	movq	1912(%rsp), %rdx
	movq	%rdx, 1336(%rax)
	movq	1920(%rsp), %rdx
	movq	%rdx, 1344(%rax)
	movq	1928(%rsp), %rdx
	movq	%rdx, 1352(%rax)
	movq	1936(%rsp), %rdx
	movq	%rdx, 1360(%rax)
	movq	1944(%rsp), %rdx
	movq	%rdx, 1368(%rax)
	movq	1952(%rsp), %rdx
	movq	%rdx, 1376(%rax)
	movq	1960(%rsp), %rdx
	movq	%rdx, 1384(%rax)
	movq	1968(%rsp), %rdx
	movq	%rdx, 1392(%rax)
	movq	1976(%rsp), %rdx
	movq	%rdx, 1400(%rax)
	movq	1984(%rsp), %rdx
	movq	%rdx, 1408(%rax)
	movq	1992(%rsp), %rdx
	movq	%rdx, 1416(%rax)
	movq	2000(%rsp), %rdx
	movq	%rdx, 1424(%rax)
	movq	2008(%rsp), %rdx
	movq	%rdx, 1432(%rax)
	movq	2016(%rsp), %rdx
	movq	%rdx, 1440(%rax)
	movq	2024(%rsp), %rdx
	movq	%rdx, 1448(%rax)
	movq	2032(%rsp), %rdx
	movq	%rdx, 1456(%rax)
	movq	2040(%rsp), %rdx
	movq	%rdx, 1464(%rax)
	movq	2048(%rsp), %rdx
	movq	%rdx, 1472(%rax)
	movq	2056(%rsp), %rdx
	movq	%rdx, 1480(%rax)
	movq	2064(%rsp), %rdx
	movq	%rdx, 1488(%rax)
	movq	2072(%rsp), %rdx
	movq	%rdx, 1496(%rax)
	movq	2080(%rsp), %rdx
	movq	%rdx, 1504(%rax)
	movq	2088(%rsp), %rdx
	movq	%rdx, 1512(%rax)
	movq	2096(%rsp), %rdx
	movq	%rdx, 1520(%rax)
	movq	2104(%rsp), %rdx
	movq	%rdx, 1528(%rax)
	movq	2112(%rsp), %rdx
	movq	%rdx, 1536(%rax)
	movq	2120(%rsp), %rdx
	movq	%rdx, 1544(%rax)
	movq	2128(%rsp), %rdx
	movq	%rdx, 1552(%rax)
	movq	2136(%rsp), %rdx
	movq	%rdx, 1560(%rax)
	movq	8288(%rsp), %rax
	movq	%rax, (%rcx)
	movq	8296(%rsp), %rax
	movq	%rax, 8(%rcx)
	movq	8304(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	8312(%rsp), %rax
	movq	%rax, 24(%rcx)
	movq	8320(%rsp), %rax
	movq	%rax, 32(%rcx)
	movq	8328(%rsp), %rax
	movq	%rax, 40(%rcx)
	movq	8336(%rsp), %rax
	movq	%rax, 48(%rcx)
	movq	8344(%rsp), %rax
	movq	%rax, 56(%rcx)
	movq	8352(%rsp), %rax
	movq	%rax, 64(%rcx)
	movq	8360(%rsp), %rax
	movq	%rax, 72(%rcx)
	movq	8368(%rsp), %rax
	movq	%rax, 80(%rcx)
	movq	8376(%rsp), %rax
	movq	%rax, 88(%rcx)
	movq	8384(%rsp), %rax
	movq	%rax, 96(%rcx)
	movq	8392(%rsp), %rax
	movq	%rax, 104(%rcx)
	movq	8400(%rsp), %rax
	movq	%rax, 112(%rcx)
	movq	8408(%rsp), %rax
	movq	%rax, 120(%rcx)
	movq	8416(%rsp), %rax
	movq	%rax, 128(%rcx)
	movq	8424(%rsp), %rax
	movq	%rax, 136(%rcx)
	movq	8432(%rsp), %rax
	movq	%rax, 144(%rcx)
	movq	8440(%rsp), %rax
	movq	%rax, 152(%rcx)
	movq	8448(%rsp), %rax
	movq	%rax, 160(%rcx)
	movq	8456(%rsp), %rax
	movq	%rax, 168(%rcx)
	movq	8464(%rsp), %rax
	movq	%rax, 176(%rcx)
	movq	8472(%rsp), %rax
	movq	%rax, 184(%rcx)
	movq	8480(%rsp), %rax
	movq	%rax, 192(%rcx)
	movq	8488(%rsp), %rax
	movq	%rax, 200(%rcx)
	movq	8496(%rsp), %rax
	movq	%rax, 208(%rcx)
	movq	8504(%rsp), %rax
	movq	%rax, 216(%rcx)
	movq	8512(%rsp), %rax
	movq	%rax, 224(%rcx)
	movq	8520(%rsp), %rax
	movq	%rax, 232(%rcx)
	movq	8528(%rsp), %rax
	movq	%rax, 240(%rcx)
	movq	8536(%rsp), %rax
	movq	%rax, 248(%rcx)
	movq	8544(%rsp), %rax
	movq	%rax, 256(%rcx)
	movq	8552(%rsp), %rax
	movq	%rax, 264(%rcx)
	movq	8560(%rsp), %rax
	movq	%rax, 272(%rcx)
	movq	8568(%rsp), %rax
	movq	%rax, 280(%rcx)
	movq	8576(%rsp), %rax
	movq	%rax, 288(%rcx)
	movq	8584(%rsp), %rax
	movq	%rax, 296(%rcx)
	movq	8592(%rsp), %rax
	movq	%rax, 304(%rcx)
	movq	8600(%rsp), %rax
	movq	%rax, 312(%rcx)
	movq	8608(%rsp), %rax
	movq	%rax, 320(%rcx)
	movq	8616(%rsp), %rax
	movq	%rax, 328(%rcx)
	movq	8624(%rsp), %rax
	movq	%rax, 336(%rcx)
	movq	8632(%rsp), %rax
	movq	%rax, 344(%rcx)
	movq	8640(%rsp), %rax
	movq	%rax, 352(%rcx)
	movq	8648(%rsp), %rax
	movq	%rax, 360(%rcx)
	movq	8656(%rsp), %rax
	movq	%rax, 368(%rcx)
	movq	8664(%rsp), %rax
	movq	%rax, 376(%rcx)
	movq	8672(%rsp), %rax
	movq	%rax, 384(%rcx)
	movq	8680(%rsp), %rax
	movq	%rax, 392(%rcx)
	movq	8688(%rsp), %rax
	movq	%rax, 400(%rcx)
	movq	8696(%rsp), %rax
	movq	%rax, 408(%rcx)
	movq	8704(%rsp), %rax
	movq	%rax, 416(%rcx)
	movq	8712(%rsp), %rax
	movq	%rax, 424(%rcx)
	movq	8720(%rsp), %rax
	movq	%rax, 432(%rcx)
	movq	8728(%rsp), %rax
	movq	%rax, 440(%rcx)
	movq	8736(%rsp), %rax
	movq	%rax, 448(%rcx)
	movq	8744(%rsp), %rax
	movq	%rax, 456(%rcx)
	movq	8752(%rsp), %rax
	movq	%rax, 464(%rcx)
	movq	8760(%rsp), %rax
	movq	%rax, 472(%rcx)
	movq	8768(%rsp), %rax
	movq	%rax, 480(%rcx)
	movq	8776(%rsp), %rax
	movq	%rax, 488(%rcx)
	movq	8784(%rsp), %rax
	movq	%rax, 496(%rcx)
	movq	8792(%rsp), %rax
	movq	%rax, 504(%rcx)
	movq	8800(%rsp), %rax
	movq	%rax, 512(%rcx)
	movq	8808(%rsp), %rax
	movq	%rax, 520(%rcx)
	movq	8816(%rsp), %rax
	movq	%rax, 528(%rcx)
	movq	8824(%rsp), %rax
	movq	%rax, 536(%rcx)
	movq	8832(%rsp), %rax
	movq	%rax, 544(%rcx)
	movq	8840(%rsp), %rax
	movq	%rax, 552(%rcx)
	movq	8848(%rsp), %rax
	movq	%rax, 560(%rcx)
	movq	8856(%rsp), %rax
	movq	%rax, 568(%rcx)
	movq	8864(%rsp), %rax
	movq	%rax, 576(%rcx)
	movq	8872(%rsp), %rax
	movq	%rax, 584(%rcx)
	movq	8880(%rsp), %rax
	movq	%rax, 592(%rcx)
	movq	8888(%rsp), %rax
	movq	%rax, 600(%rcx)
	movq	8896(%rsp), %rax
	movq	%rax, 608(%rcx)
	movq	8904(%rsp), %rax
	movq	%rax, 616(%rcx)
	movq	8912(%rsp), %rax
	movq	%rax, 624(%rcx)
	movq	8920(%rsp), %rax
	movq	%rax, 632(%rcx)
	movq	8928(%rsp), %rax
	movq	%rax, 640(%rcx)
	movq	8936(%rsp), %rax
	movq	%rax, 648(%rcx)
	movq	8944(%rsp), %rax
	movq	%rax, 656(%rcx)
	movq	8952(%rsp), %rax
	movq	%rax, 664(%rcx)
	movq	8960(%rsp), %rax
	movq	%rax, 672(%rcx)
	movq	8968(%rsp), %rax
	movq	%rax, 680(%rcx)
	movq	8976(%rsp), %rax
	movq	%rax, 688(%rcx)
	movq	8984(%rsp), %rax
	movq	%rax, 696(%rcx)
	movq	8992(%rsp), %rax
	movq	%rax, 704(%rcx)
	movq	9000(%rsp), %rax
	movq	%rax, 712(%rcx)
	movq	9008(%rsp), %rax
	movq	%rax, 720(%rcx)
	movq	9016(%rsp), %rax
	movq	%rax, 728(%rcx)
	movq	9024(%rsp), %rax
	movq	%rax, 736(%rcx)
	movq	9032(%rsp), %rax
	movq	%rax, 744(%rcx)
	movq	9040(%rsp), %rax
	movq	%rax, 752(%rcx)
	movq	9048(%rsp), %rax
	movq	%rax, 760(%rcx)
	movq	9056(%rsp), %rax
	movq	%rax, 768(%rcx)
	movq	9064(%rsp), %rax
	movq	%rax, 776(%rcx)
	movq	9072(%rsp), %rax
	movq	%rax, 784(%rcx)
	movq	9080(%rsp), %rax
	movq	%rax, 792(%rcx)
	movq	9088(%rsp), %rax
	movq	%rax, 800(%rcx)
	movq	9096(%rsp), %rax
	movq	%rax, 808(%rcx)
	movq	9104(%rsp), %rax
	movq	%rax, 816(%rcx)
	movq	9112(%rsp), %rax
	movq	%rax, 824(%rcx)
	movq	9120(%rsp), %rax
	movq	%rax, 832(%rcx)
	movq	9128(%rsp), %rax
	movq	%rax, 840(%rcx)
	movq	9136(%rsp), %rax
	movq	%rax, 848(%rcx)
	movq	9144(%rsp), %rax
	movq	%rax, 856(%rcx)
	movq	9152(%rsp), %rax
	movq	%rax, 864(%rcx)
	movq	9160(%rsp), %rax
	movq	%rax, 872(%rcx)
	movq	9168(%rsp), %rax
	movq	%rax, 880(%rcx)
	movq	9176(%rsp), %rax
	movq	%rax, 888(%rcx)
	movq	9184(%rsp), %rax
	movq	%rax, 896(%rcx)
	movq	9192(%rsp), %rax
	movq	%rax, 904(%rcx)
	movq	9200(%rsp), %rax
	movq	%rax, 912(%rcx)
	movq	9208(%rsp), %rax
	movq	%rax, 920(%rcx)
	movq	9216(%rsp), %rax
	movq	%rax, 928(%rcx)
	movq	9224(%rsp), %rax
	movq	%rax, 936(%rcx)
	movq	9232(%rsp), %rax
	movq	%rax, 944(%rcx)
	movq	9240(%rsp), %rax
	movq	%rax, 952(%rcx)
	movq	9248(%rsp), %rax
	movq	%rax, 960(%rcx)
	movq	9256(%rsp), %rax
	movq	%rax, 968(%rcx)
	movq	9264(%rsp), %rax
	movq	%rax, 976(%rcx)
	movq	9272(%rsp), %rax
	movq	%rax, 984(%rcx)
	movq	9280(%rsp), %rax
	movq	%rax, 992(%rcx)
	movq	9288(%rsp), %rax
	movq	%rax, 1000(%rcx)
	movq	9296(%rsp), %rax
	movq	%rax, 1008(%rcx)
	movq	9304(%rsp), %rax
	movq	%rax, 1016(%rcx)
	movq	9312(%rsp), %rax
	movq	%rax, 1024(%rcx)
	movq	9320(%rsp), %rax
	movq	%rax, 1032(%rcx)
	movq	9328(%rsp), %rax
	movq	%rax, 1040(%rcx)
	movq	9336(%rsp), %rax
	movq	%rax, 1048(%rcx)
	movq	9344(%rsp), %rax
	movq	%rax, 1056(%rcx)
	movq	9352(%rsp), %rax
	movq	%rax, 1064(%rcx)
	movq	9360(%rsp), %rax
	movq	%rax, 1072(%rcx)
	movq	9368(%rsp), %rax
	movq	%rax, 1080(%rcx)
	movq	9376(%rsp), %rax
	movq	%rax, 1088(%rcx)
	movq	9384(%rsp), %rax
	movq	%rax, 1096(%rcx)
	movq	9392(%rsp), %rax
	movq	%rax, 1104(%rcx)
	movq	9400(%rsp), %rax
	movq	%rax, 1112(%rcx)
	movq	9408(%rsp), %rax
	movq	%rax, 1120(%rcx)
	movq	9416(%rsp), %rax
	movq	%rax, 1128(%rcx)
	movq	9424(%rsp), %rax
	movq	%rax, 1136(%rcx)
	movq	9432(%rsp), %rax
	movq	%rax, 1144(%rcx)
	movq	9440(%rsp), %rax
	movq	%rax, 1152(%rcx)
	movq	9448(%rsp), %rax
	movq	%rax, 1160(%rcx)
	movq	9456(%rsp), %rax
	movq	%rax, 1168(%rcx)
	movq	9464(%rsp), %rax
	movq	%rax, 1176(%rcx)
	movq	9472(%rsp), %rax
	movq	%rax, 1184(%rcx)
	movq	9480(%rsp), %rax
	movq	%rax, 1192(%rcx)
	movq	9488(%rsp), %rax
	movq	%rax, 1200(%rcx)
	movq	9496(%rsp), %rax
	movq	%rax, 1208(%rcx)
	movq	9504(%rsp), %rax
	movq	%rax, 1216(%rcx)
	movq	9512(%rsp), %rax
	movq	%rax, 1224(%rcx)
	movq	9520(%rsp), %rax
	movq	%rax, 1232(%rcx)
	movq	9528(%rsp), %rax
	movq	%rax, 1240(%rcx)
	movq	9536(%rsp), %rax
	movq	%rax, 1248(%rcx)
	movq	9544(%rsp), %rax
	movq	%rax, 1256(%rcx)
	movq	9552(%rsp), %rax
	movq	%rax, 1264(%rcx)
	movq	9560(%rsp), %rax
	movq	%rax, 1272(%rcx)
	movq	9568(%rsp), %rax
	movq	%rax, 1280(%rcx)
	movq	9576(%rsp), %rax
	movq	%rax, 1288(%rcx)
	movq	9584(%rsp), %rax
	movq	%rax, 1296(%rcx)
	movq	9592(%rsp), %rax
	movq	%rax, 1304(%rcx)
	movq	9600(%rsp), %rax
	movq	%rax, 1312(%rcx)
	movq	9608(%rsp), %rax
	movq	%rax, 1320(%rcx)
	movq	9616(%rsp), %rax
	movq	%rax, 1328(%rcx)
	movq	9624(%rsp), %rax
	movq	%rax, 1336(%rcx)
	movq	9632(%rsp), %rax
	movq	%rax, 1344(%rcx)
	movq	9640(%rsp), %rax
	movq	%rax, 1352(%rcx)
	movq	9648(%rsp), %rax
	movq	%rax, 1360(%rcx)
	movq	9656(%rsp), %rax
	movq	%rax, 1368(%rcx)
	movq	9664(%rsp), %rax
	movq	%rax, 1376(%rcx)
	movq	9672(%rsp), %rax
	movq	%rax, 1384(%rcx)
	movq	9680(%rsp), %rax
	movq	%rax, 1392(%rcx)
	movq	9688(%rsp), %rax
	movq	%rax, 1400(%rcx)
	movq	9696(%rsp), %rax
	movq	%rax, 1408(%rcx)
	movq	9704(%rsp), %rax
	movq	%rax, 1416(%rcx)
	movq	9712(%rsp), %rax
	movq	%rax, 1424(%rcx)
	movq	9720(%rsp), %rax
	movq	%rax, 1432(%rcx)
	movq	9728(%rsp), %rax
	movq	%rax, 1440(%rcx)
	movq	9736(%rsp), %rax
	movq	%rax, 1448(%rcx)
	movq	9744(%rsp), %rax
	movq	%rax, 1456(%rcx)
	movq	9752(%rsp), %rax
	movq	%rax, 1464(%rcx)
	movq	9760(%rsp), %rax
	movq	%rax, 1472(%rcx)
	movq	9768(%rsp), %rax
	movq	%rax, 1480(%rcx)
	movq	9776(%rsp), %rax
	movq	%rax, 1488(%rcx)
	movq	9784(%rsp), %rax
	movq	%rax, 1496(%rcx)
	movq	9792(%rsp), %rax
	movq	%rax, 1504(%rcx)
	movq	9800(%rsp), %rax
	movq	%rax, 1512(%rcx)
	movq	9808(%rsp), %rax
	movq	%rax, 1520(%rcx)
	movq	9816(%rsp), %rax
	movq	%rax, 1528(%rcx)
	movq	9824(%rsp), %rax
	movq	%rax, 1536(%rcx)
	movq	9832(%rsp), %rax
	movq	%rax, 1544(%rcx)
	movq	9840(%rsp), %rax
	movq	%rax, 1552(%rcx)
	movq	9848(%rsp), %rax
	movq	%rax, 1560(%rcx)
	movq	9856(%rsp), %rax
	movq	%rax, 1568(%rcx)
	movq	9864(%rsp), %rax
	movq	%rax, 1576(%rcx)
	movq	9872(%rsp), %rax
	movq	%rax, 1584(%rcx)
	movq	9880(%rsp), %rax
	movq	%rax, 1592(%rcx)
	movq	9888(%rsp), %rax
	movq	%rax, 1600(%rcx)
	movq	9896(%rsp), %rax
	movq	%rax, 1608(%rcx)
	movq	9904(%rsp), %rax
	movq	%rax, 1616(%rcx)
	movq	9912(%rsp), %rax
	movq	%rax, 1624(%rcx)
	movq	9920(%rsp), %rax
	movq	%rax, 1632(%rcx)
	movq	9928(%rsp), %rax
	movq	%rax, 1640(%rcx)
	movq	9936(%rsp), %rax
	movq	%rax, 1648(%rcx)
	movq	9944(%rsp), %rax
	movq	%rax, 1656(%rcx)
	movq	9952(%rsp), %rax
	movq	%rax, 1664(%rcx)
	movq	9960(%rsp), %rax
	movq	%rax, 1672(%rcx)
	movq	9968(%rsp), %rax
	movq	%rax, 1680(%rcx)
	movq	9976(%rsp), %rax
	movq	%rax, 1688(%rcx)
	movq	9984(%rsp), %rax
	movq	%rax, 1696(%rcx)
	movq	9992(%rsp), %rax
	movq	%rax, 1704(%rcx)
	movq	10000(%rsp), %rax
	movq	%rax, 1712(%rcx)
	movq	10008(%rsp), %rax
	movq	%rax, 1720(%rcx)
	movq	10016(%rsp), %rax
	movq	%rax, 1728(%rcx)
	movq	10024(%rsp), %rax
	movq	%rax, 1736(%rcx)
	movq	10032(%rsp), %rax
	movq	%rax, 1744(%rcx)
	movq	10040(%rsp), %rax
	movq	%rax, 1752(%rcx)
	movq	10048(%rsp), %rax
	movq	%rax, 1760(%rcx)
	movq	10056(%rsp), %rax
	movq	%rax, 1768(%rcx)
	movq	10064(%rsp), %rax
	movq	%rax, 1776(%rcx)
	movq	10072(%rsp), %rax
	movq	%rax, 1784(%rcx)
	movq	10080(%rsp), %rax
	movq	%rax, 1792(%rcx)
	movq	10088(%rsp), %rax
	movq	%rax, 1800(%rcx)
	movq	10096(%rsp), %rax
	movq	%rax, 1808(%rcx)
	movq	10104(%rsp), %rax
	movq	%rax, 1816(%rcx)
	movq	10112(%rsp), %rax
	movq	%rax, 1824(%rcx)
	movq	10120(%rsp), %rax
	movq	%rax, 1832(%rcx)
	movq	10128(%rsp), %rax
	movq	%rax, 1840(%rcx)
	movq	10136(%rsp), %rax
	movq	%rax, 1848(%rcx)
	movq	10144(%rsp), %rax
	movq	%rax, 1856(%rcx)
	movq	10152(%rsp), %rax
	movq	%rax, 1864(%rcx)
	movq	10160(%rsp), %rax
	movq	%rax, 1872(%rcx)
	movq	10168(%rsp), %rax
	movq	%rax, 1880(%rcx)
	movq	10176(%rsp), %rax
	movq	%rax, 1888(%rcx)
	movq	10184(%rsp), %rax
	movq	%rax, 1896(%rcx)
	movq	10192(%rsp), %rax
	movq	%rax, 1904(%rcx)
	movq	10200(%rsp), %rax
	movq	%rax, 1912(%rcx)
	movq	10208(%rsp), %rax
	movq	%rax, 1920(%rcx)
	movq	10216(%rsp), %rax
	movq	%rax, 1928(%rcx)
	movq	10224(%rsp), %rax
	movq	%rax, 1936(%rcx)
	movq	10232(%rsp), %rax
	movq	%rax, 1944(%rcx)
	movq	10240(%rsp), %rax
	movq	%rax, 1952(%rcx)
	movq	10248(%rsp), %rax
	movq	%rax, 1960(%rcx)
	movq	10256(%rsp), %rax
	movq	%rax, 1968(%rcx)
	movq	10264(%rsp), %rax
	movq	%rax, 1976(%rcx)
	movq	10272(%rsp), %rax
	movq	%rax, 1984(%rcx)
	movq	10280(%rsp), %rax
	movq	%rax, 1992(%rcx)
	movq	10288(%rsp), %rax
	movq	%rax, 2000(%rcx)
	movq	10296(%rsp), %rax
	movq	%rax, 2008(%rcx)
	movq	10304(%rsp), %rax
	movq	%rax, 2016(%rcx)
	movq	10312(%rsp), %rax
	movq	%rax, 2024(%rcx)
	movq	10320(%rsp), %rax
	movq	%rax, 2032(%rcx)
	movq	10328(%rsp), %rax
	movq	%rax, 2040(%rcx)
	movq	10336(%rsp), %rax
	movq	%rax, 2048(%rcx)
	movq	10344(%rsp), %rax
	movq	%rax, 2056(%rcx)
	movq	10352(%rsp), %rax
	movq	%rax, 2064(%rcx)
	movq	10360(%rsp), %rax
	movq	%rax, 2072(%rcx)
	movq	10368(%rsp), %rax
	movq	%rax, 2080(%rcx)
	movq	10376(%rsp), %rax
	movq	%rax, 2088(%rcx)
	movq	10384(%rsp), %rax
	movq	%rax, 2096(%rcx)
	movq	10392(%rsp), %rax
	movq	%rax, 2104(%rcx)
	movq	10400(%rsp), %rax
	movq	%rax, 2112(%rcx)
	movq	10408(%rsp), %rax
	movq	%rax, 2120(%rcx)
	movq	10416(%rsp), %rax
	movq	%rax, 2128(%rcx)
	movq	10424(%rsp), %rax
	movq	%rax, 2136(%rcx)
	movq	10432(%rsp), %rax
	movq	%rax, 2144(%rcx)
	movq	10440(%rsp), %rax
	movq	%rax, 2152(%rcx)
	movq	10448(%rsp), %rax
	movq	%rax, 2160(%rcx)
	movq	10456(%rsp), %rax
	movq	%rax, 2168(%rcx)
	movq	10464(%rsp), %rax
	movq	%rax, 2176(%rcx)
	movq	10472(%rsp), %rax
	movq	%rax, 2184(%rcx)
	movq	10480(%rsp), %rax
	movq	%rax, 2192(%rcx)
	movq	10488(%rsp), %rax
	movq	%rax, 2200(%rcx)
	movq	10496(%rsp), %rax
	movq	%rax, 2208(%rcx)
	movq	10504(%rsp), %rax
	movq	%rax, 2216(%rcx)
	movq	10512(%rsp), %rax
	movq	%rax, 2224(%rcx)
	movq	10520(%rsp), %rax
	movq	%rax, 2232(%rcx)
	movq	10528(%rsp), %rax
	movq	%rax, 2240(%rcx)
	movq	10536(%rsp), %rax
	movq	%rax, 2248(%rcx)
	movq	10544(%rsp), %rax
	movq	%rax, 2256(%rcx)
	movq	10552(%rsp), %rax
	movq	%rax, 2264(%rcx)
	movq	10560(%rsp), %rax
	movq	%rax, 2272(%rcx)
	movq	10568(%rsp), %rax
	movq	%rax, 2280(%rcx)
	movq	10576(%rsp), %rax
	movq	%rax, 2288(%rcx)
	movq	10584(%rsp), %rax
	movq	%rax, 2296(%rcx)
	movq	10592(%rsp), %rax
	movq	%rax, 2304(%rcx)
	movq	10600(%rsp), %rax
	movq	%rax, 2312(%rcx)
	movq	10608(%rsp), %rax
	movq	%rax, 2320(%rcx)
	movq	10616(%rsp), %rax
	movq	%rax, 2328(%rcx)
	movq	10624(%rsp), %rax
	movq	%rax, 2336(%rcx)
	movq	10632(%rsp), %rax
	movq	%rax, 2344(%rcx)
	movq	10640(%rsp), %rax
	movq	%rax, 2352(%rcx)
	movq	10648(%rsp), %rax
	movq	%rax, 2360(%rcx)
	movq	10656(%rsp), %rax
	movq	%rax, 2368(%rcx)
	movq	10664(%rsp), %rax
	movq	%rax, 2376(%rcx)
	movq	10672(%rsp), %rax
	movq	%rax, 2384(%rcx)
	movq	10680(%rsp), %rax
	movq	%rax, 2392(%rcx)
	movq	10688(%rsp), %rax
	movq	%rax, 2400(%rcx)
	movq	10696(%rsp), %rax
	movq	%rax, 2408(%rcx)
	movq	10704(%rsp), %rax
	movq	%rax, 2416(%rcx)
	movq	10712(%rsp), %rax
	movq	%rax, 2424(%rcx)
	movq	10720(%rsp), %rax
	movq	%rax, 2432(%rcx)
	movq	10728(%rsp), %rax
	movq	%rax, 2440(%rcx)
	movq	10736(%rsp), %rax
	movq	%rax, 2448(%rcx)
	movq	10744(%rsp), %rax
	movq	%rax, 2456(%rcx)
	movq	10752(%rsp), %rax
	movq	%rax, 2464(%rcx)
	movq	10760(%rsp), %rax
	movq	%rax, 2472(%rcx)
	movq	10768(%rsp), %rax
	movq	%rax, 2480(%rcx)
	movq	10776(%rsp), %rax
	movq	%rax, 2488(%rcx)
	movq	10784(%rsp), %rax
	movq	%rax, 2496(%rcx)
	movq	10792(%rsp), %rax
	movq	%rax, 2504(%rcx)
	movq	10800(%rsp), %rax
	movq	%rax, 2512(%rcx)
	movq	10808(%rsp), %rax
	movq	%rax, 2520(%rcx)
	movq	10816(%rsp), %rax
	movq	%rax, 2528(%rcx)
	movq	10824(%rsp), %rax
	movq	%rax, 2536(%rcx)
	movq	10832(%rsp), %rax
	movq	%rax, 2544(%rcx)
	movq	10840(%rsp), %rax
	movq	%rax, 2552(%rcx)
	movq	10848(%rsp), %rax
	movq	%rax, 2560(%rcx)
	movq	10856(%rsp), %rax
	movq	%rax, 2568(%rcx)
	movq	10864(%rsp), %rax
	movq	%rax, 2576(%rcx)
	movq	10872(%rsp), %rax
	movq	%rax, 2584(%rcx)
	movq	10880(%rsp), %rax
	movq	%rax, 2592(%rcx)
	movq	10888(%rsp), %rax
	movq	%rax, 2600(%rcx)
	movq	10896(%rsp), %rax
	movq	%rax, 2608(%rcx)
	movq	10904(%rsp), %rax
	movq	%rax, 2616(%rcx)
	movq	10912(%rsp), %rax
	movq	%rax, 2624(%rcx)
	movq	10920(%rsp), %rax
	movq	%rax, 2632(%rcx)
	movq	10928(%rsp), %rax
	movq	%rax, 2640(%rcx)
	movq	10936(%rsp), %rax
	movq	%rax, 2648(%rcx)
	movq	10944(%rsp), %rax
	movq	%rax, 2656(%rcx)
	movq	10952(%rsp), %rax
	movq	%rax, 2664(%rcx)
	movq	10960(%rsp), %rax
	movq	%rax, 2672(%rcx)
	movq	10968(%rsp), %rax
	movq	%rax, 2680(%rcx)
	movq	10976(%rsp), %rax
	movq	%rax, 2688(%rcx)
	movq	10984(%rsp), %rax
	movq	%rax, 2696(%rcx)
	movq	10992(%rsp), %rax
	movq	%rax, 2704(%rcx)
	movq	11000(%rsp), %rax
	movq	%rax, 2712(%rcx)
	movq	11008(%rsp), %rax
	movq	%rax, 2720(%rcx)
	movq	11016(%rsp), %rax
	movq	%rax, 2728(%rcx)
	movq	11024(%rsp), %rax
	movq	%rax, 2736(%rcx)
	movq	11032(%rsp), %rax
	movq	%rax, 2744(%rcx)
	movq	11040(%rsp), %rax
	movq	%rax, 2752(%rcx)
	movq	11048(%rsp), %rax
	movq	%rax, 2760(%rcx)
	movq	11056(%rsp), %rax
	movq	%rax, 2768(%rcx)
	movq	11064(%rsp), %rax
	movq	%rax, 2776(%rcx)
	movq	11072(%rsp), %rax
	movq	%rax, 2784(%rcx)
	movq	11080(%rsp), %rax
	movq	%rax, 2792(%rcx)
	movq	11088(%rsp), %rax
	movq	%rax, 2800(%rcx)
	movq	11096(%rsp), %rax
	movq	%rax, 2808(%rcx)
	movq	11104(%rsp), %rax
	movq	%rax, 2816(%rcx)
	movq	11112(%rsp), %rax
	movq	%rax, 2824(%rcx)
	movq	11120(%rsp), %rax
	movq	%rax, 2832(%rcx)
	movq	11128(%rsp), %rax
	movq	%rax, 2840(%rcx)
	movq	11136(%rsp), %rax
	movq	%rax, 2848(%rcx)
	movq	11144(%rsp), %rax
	movq	%rax, 2856(%rcx)
	movq	11152(%rsp), %rax
	movq	%rax, 2864(%rcx)
	movq	11160(%rsp), %rax
	movq	%rax, 2872(%rcx)
	movq	11168(%rsp), %rax
	movq	%rax, 2880(%rcx)
	movq	11176(%rsp), %rax
	movq	%rax, 2888(%rcx)
	movq	11184(%rsp), %rax
	movq	%rax, 2896(%rcx)
	movq	11192(%rsp), %rax
	movq	%rax, 2904(%rcx)
	movq	11200(%rsp), %rax
	movq	%rax, 2912(%rcx)
	movq	11208(%rsp), %rax
	movq	%rax, 2920(%rcx)
	movq	11216(%rsp), %rax
	movq	%rax, 2928(%rcx)
	movq	11224(%rsp), %rax
	movq	%rax, 2936(%rcx)
	movq	11232(%rsp), %rax
	movq	%rax, 2944(%rcx)
	movq	11240(%rsp), %rax
	movq	%rax, 2952(%rcx)
	movq	11248(%rsp), %rax
	movq	%rax, 2960(%rcx)
	movq	11256(%rsp), %rax
	movq	%rax, 2968(%rcx)
	movq	11264(%rsp), %rax
	movq	%rax, 2976(%rcx)
	movq	11272(%rsp), %rax
	movq	%rax, 2984(%rcx)
	movq	11280(%rsp), %rax
	movq	%rax, 2992(%rcx)
	movq	11288(%rsp), %rax
	movq	%rax, 3000(%rcx)
	movq	11296(%rsp), %rax
	movq	%rax, 3008(%rcx)
	movq	11304(%rsp), %rax
	movq	%rax, 3016(%rcx)
	movq	11312(%rsp), %rax
	movq	%rax, 3024(%rcx)
	movq	11320(%rsp), %rax
	movq	%rax, 3032(%rcx)
	movq	11328(%rsp), %rax
	movq	%rax, 3040(%rcx)
	movq	11336(%rsp), %rax
	movq	%rax, 3048(%rcx)
	movq	11344(%rsp), %rax
	movq	%rax, 3056(%rcx)
	movq	11352(%rsp), %rax
	movq	%rax, 3064(%rcx)
	movq	11360(%rsp), %rax
	movq	%rax, 3072(%rcx)
	movq	11368(%rsp), %rax
	movq	%rax, 3080(%rcx)
	movq	11376(%rsp), %rax
	movq	%rax, 3088(%rcx)
	movq	11384(%rsp), %rax
	movq	%rax, 3096(%rcx)
	movq	11392(%rsp), %rax
	movq	%rax, 3104(%rcx)
	movq	11400(%rsp), %rax
	movq	%rax, 3112(%rcx)
	movq	11408(%rsp), %rax
	movq	%rax, 3120(%rcx)
	movq	11416(%rsp), %rax
	movq	%rax, 3128(%rcx)
	movq	11424(%rsp), %rax
	movq	%rax, 3136(%rcx)
	movq	11432(%rsp), %rax
	movq	%rax, 3144(%rcx)
	movq	11440(%rsp), %rax
	movq	%rax, 3152(%rcx)
	movq	11448(%rsp), %rax
	movq	%rax, 3160(%rcx)
	xorq	%rax, %rax
	movq	19824(%rsp), %rbx
	movq	19832(%rsp), %rbp
	movq	19840(%rsp), %r12
	movq	19848(%rsp), %r13
	movq	19856(%rsp), %r14
	movq	19864(%rsp), %r15
	movq	19872(%rsp), %rsp
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
	movq	(%rax), %xmm4
	movw	8(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, (%rsi)
	movq	10(%rax), %xmm4
	movw	18(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 32(%rsi)
	movq	20(%rax), %xmm4
	movw	28(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 64(%rsi)
	movq	30(%rax), %xmm4
	movw	38(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 96(%rsi)
	movq	40(%rax), %xmm4
	movw	48(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 128(%rsi)
	movq	50(%rax), %xmm4
	movw	58(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 160(%rsi)
	movq	60(%rax), %xmm4
	movw	68(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 192(%rsi)
	movq	70(%rax), %xmm4
	movw	78(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 224(%rsi)
	movq	80(%rax), %xmm4
	movw	88(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 256(%rsi)
	movq	90(%rax), %xmm4
	movw	98(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 288(%rsi)
	movq	100(%rax), %xmm4
	movw	108(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 320(%rsi)
	movq	110(%rax), %xmm4
	movw	118(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 352(%rsi)
	movq	120(%rax), %xmm4
	movw	128(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 384(%rsi)
	movq	130(%rax), %xmm4
	movw	138(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 416(%rsi)
	movq	140(%rax), %xmm4
	movw	148(%rax), %di
	vpinsrw	$4, %edi, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm4
	vpand	%ymm2, %ymm4, %ymm4
	vpmullw	%ymm3, %ymm4, %ymm4
	vpmulhrsw	%ymm0, %ymm4, %ymm4
	vmovdqu	%ymm4, 448(%rsi)
	movq	150(%rax), %xmm4
	movw	158(%rax), %ax
	vpinsrw	$4, %eax, %xmm4, %xmm4
	vmovdqu	%xmm4, 16(%rsp)
	vbroadcasti128	16(%rsp), %ymm4
	vpshufb	%ymm1, %ymm4, %ymm1
	vpand	%ymm2, %ymm1, %ymm1
	vpmullw	%ymm3, %ymm1, %ymm1
	vpmulhrsw	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm0, 480(%rsi)
	ret
L_i_poly_tomsg$1:
	call	L_poly_csubq$1
L_i_poly_tomsg$2:
	leaq	glob_data + 960(%rip), %rax
	vmovdqu	(%rax), %ymm0
	leaq	glob_data + 928(%rip), %rax
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
	leaq	glob_data + 2016(%rip), %rdx
	vmovdqu	glob_data + 1184(%rip), %ymm0
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
	leaq	glob_data + 1216(%rip), %rdx
	vmovdqu	glob_data + 1184(%rip), %ymm0
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
	vmovdqu	glob_data + 1056(%rip), %ymm8
	vmovdqu	glob_data + 1088(%rip), %ymm9
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
	vmovdqu	glob_data + 1056(%rip), %ymm2
	vmovdqu	glob_data + 1088(%rip), %ymm3
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
	leaq	glob_data + 1024(%rip), %r9
	vmovdqu	(%r9), %ymm0
	vmovdqu	(%rdi), %ymm1
	vmovdqu	32(%rdi), %ymm2
	vmovdqu	64(%rdi), %ymm3
	vmovdqu	96(%rdi), %ymm4
	vmovdqu	128(%rdi), %ymm5
	vmovdqu	160(%rdi), %ymm6
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
	vmovdqu	192(%rdi), %ymm1
	vmovdqu	224(%rdi), %ymm2
	vmovdqu	256(%rdi), %ymm3
	vmovdqu	288(%rdi), %ymm4
	vmovdqu	320(%rdi), %ymm5
	vmovdqu	352(%rdi), %ymm6
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
	vmovdqu	glob_data + 1184(%rip), %ymm0
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
	movq	$0, %rsi
	movq	$0, %rdi
	jmp 	L_sha3_256A_A1568$3
L_sha3_256A_A1568$4:
	movq	(%rcx,%rsi), %r8
	movq	%r8, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
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
	addq	$136, %rsi
	call	L_keccakf1600_avx2$1
L_sha3_256A_A1568$5:
	incq	%rdi
L_sha3_256A_A1568$3:
	cmpq	$11, %rdi
	jb  	L_sha3_256A_A1568$4
	movq	(%rcx,%rsi), %rdi
	movq	%rdi, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	vmovdqu	8(%rcx,%rsi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	40(%rcx,%rsi), %rdi
	movq	%rdi, %xmm9
	vmovdqu	48(%rcx,%rsi), %xmm7
	vmovq	64(%rcx,%rsi), %xmm8
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
	movq	%xmm6, (%rdx,%rcx)
	vmovdqu	%xmm5, %xmm0
	vmovdqu	%xmm0, 8(%rdx,%rcx)
	vextracti128	$1, %ymm5, %xmm0
	movq	%xmm0, 24(%rdx,%rcx)
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
	movq	$0, %rsi
	movq	(%rdx,%rsi), %rdi
	movq	%rdi, %xmm6
	vpbroadcastq	%xmm6, %ymm6
	vpxor	%ymm6, %ymm5, %ymm6
	vmovdqu	8(%rdx,%rsi), %ymm5
	vpxor	%ymm5, %ymm7, %ymm5
	movq	40(%rdx,%rsi), %rdi
	movq	%rdi, %xmm9
	vmovdqu	48(%rdx,%rsi), %xmm7
	movq	$6, %rdx
	movq	%rdx, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	movq	$0, %rdx
	movq	%rdx, %xmm10
	vpxor	%ymm8, %ymm8, %ymm8
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm9, %xmm11
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm10, %xmm10
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
	movq	$1, %rdx
	shlq	$63, %rdx
	movq	%rdx, %xmm3
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$1, %xmm3, %ymm8, %ymm3
	vpxor	%ymm3, %ymm7, %ymm3
	movq	$0, %rdx
	call	L_keccakf1600_avx2$1
L_sha3_512A_A64$2:
	movq	%xmm6, (%rcx,%rdx)
	vmovdqu	%ymm5, 8(%rcx,%rdx)
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpblendd	$240, %ymm3, %ymm1, %ymm0
	vpblendd	$240, %ymm2, %ymm4, %ymm1
	vpblendd	$195, %ymm1, %ymm0, %ymm0
	vmovdqu	%xmm0, 48(%rcx,%rdx)
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
