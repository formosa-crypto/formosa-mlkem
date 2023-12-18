	.att_syntax
	.text
	.p2align	5
	.globl	_shake128_squeezeblock_jazz
	.globl	shake128_squeezeblock_jazz
	.globl	_shake128_absorb34_jazz
	.globl	shake128_absorb34_jazz
	.globl	_sha3512_32_jazz
	.globl	sha3512_32_jazz
	.globl	_shake256_128_33_jazz
	.globl	shake256_128_33_jazz
_shake128_squeezeblock_jazz:
shake128_squeezeblock_jazz:
	movq	%rsp, %rax
	leaq	-408(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rax, 400(%rsp)
	movq	%rbp, 384(%rsp)
	movq	%rbx, 392(%rsp)
	movq	(%rsi), %rax
	movq	%rax, 16(%rsp)
	movq	8(%rsi), %rax
	movq	%rax, 24(%rsp)
	movq	16(%rsi), %rax
	movq	%rax, 32(%rsp)
	movq	24(%rsi), %rax
	movq	%rax, 40(%rsp)
	movq	32(%rsi), %rax
	movq	%rax, 48(%rsp)
	movq	40(%rsi), %rax
	movq	%rax, 56(%rsp)
	movq	48(%rsi), %rax
	movq	%rax, 64(%rsp)
	movq	56(%rsi), %rax
	movq	%rax, 72(%rsp)
	movq	64(%rsi), %rax
	movq	%rax, 80(%rsp)
	movq	72(%rsi), %rax
	movq	%rax, 88(%rsp)
	movq	80(%rsi), %rax
	movq	%rax, 96(%rsp)
	movq	88(%rsi), %rax
	movq	%rax, 104(%rsp)
	movq	96(%rsi), %rax
	movq	%rax, 112(%rsp)
	movq	104(%rsi), %rax
	movq	%rax, 120(%rsp)
	movq	112(%rsi), %rax
	movq	%rax, 128(%rsp)
	movq	120(%rsi), %rax
	movq	%rax, 136(%rsp)
	movq	128(%rsi), %rax
	movq	%rax, 144(%rsp)
	movq	136(%rsi), %rax
	movq	%rax, 152(%rsp)
	movq	144(%rsi), %rax
	movq	%rax, 160(%rsp)
	movq	152(%rsi), %rax
	movq	%rax, 168(%rsp)
	movq	160(%rsi), %rax
	movq	%rax, 176(%rsp)
	movq	168(%rsi), %rax
	movq	%rax, 184(%rsp)
	movq	176(%rsi), %rax
	movq	%rax, 192(%rsp)
	movq	184(%rsi), %rax
	movq	%rax, 200(%rsp)
	movq	192(%rsi), %rax
	movq	%rax, 208(%rsp)
	movq	%rdi, (%rsp)
	movq	%rsi, 8(%rsp)
	leaq	16(%rsp), %rcx
	leaq	216(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lshake128_squeezeblock_jazz$1:
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	%rdx, (%rcx)
	movq	24(%rsp), %rdx
	movq	%rdx, 8(%rcx)
	movq	32(%rsp), %rdx
	movq	%rdx, 16(%rcx)
	movq	40(%rsp), %rdx
	movq	%rdx, 24(%rcx)
	movq	48(%rsp), %rdx
	movq	%rdx, 32(%rcx)
	movq	56(%rsp), %rdx
	movq	%rdx, 40(%rcx)
	movq	64(%rsp), %rdx
	movq	%rdx, 48(%rcx)
	movq	72(%rsp), %rdx
	movq	%rdx, 56(%rcx)
	movq	80(%rsp), %rdx
	movq	%rdx, 64(%rcx)
	movq	88(%rsp), %rdx
	movq	%rdx, 72(%rcx)
	movq	96(%rsp), %rdx
	movq	%rdx, 80(%rcx)
	movq	104(%rsp), %rdx
	movq	%rdx, 88(%rcx)
	movq	112(%rsp), %rdx
	movq	%rdx, 96(%rcx)
	movq	120(%rsp), %rdx
	movq	%rdx, 104(%rcx)
	movq	128(%rsp), %rdx
	movq	%rdx, 112(%rcx)
	movq	136(%rsp), %rdx
	movq	%rdx, 120(%rcx)
	movq	144(%rsp), %rdx
	movq	%rdx, 128(%rcx)
	movq	152(%rsp), %rdx
	movq	%rdx, 136(%rcx)
	movq	160(%rsp), %rdx
	movq	%rdx, 144(%rcx)
	movq	168(%rsp), %rdx
	movq	%rdx, 152(%rcx)
	movq	176(%rsp), %rdx
	movq	%rdx, 160(%rcx)
	movq	184(%rsp), %rdx
	movq	%rdx, 168(%rcx)
	movq	192(%rsp), %rdx
	movq	%rdx, 176(%rcx)
	movq	200(%rsp), %rdx
	movq	%rdx, 184(%rcx)
	movq	208(%rsp), %rdx
	movq	%rdx, 192(%rcx)
	movb	216(%rsp), %cl
	movb	%cl, (%rax)
	movb	217(%rsp), %cl
	movb	%cl, 1(%rax)
	movb	218(%rsp), %cl
	movb	%cl, 2(%rax)
	movb	219(%rsp), %cl
	movb	%cl, 3(%rax)
	movb	220(%rsp), %cl
	movb	%cl, 4(%rax)
	movb	221(%rsp), %cl
	movb	%cl, 5(%rax)
	movb	222(%rsp), %cl
	movb	%cl, 6(%rax)
	movb	223(%rsp), %cl
	movb	%cl, 7(%rax)
	movb	224(%rsp), %cl
	movb	%cl, 8(%rax)
	movb	225(%rsp), %cl
	movb	%cl, 9(%rax)
	movb	226(%rsp), %cl
	movb	%cl, 10(%rax)
	movb	227(%rsp), %cl
	movb	%cl, 11(%rax)
	movb	228(%rsp), %cl
	movb	%cl, 12(%rax)
	movb	229(%rsp), %cl
	movb	%cl, 13(%rax)
	movb	230(%rsp), %cl
	movb	%cl, 14(%rax)
	movb	231(%rsp), %cl
	movb	%cl, 15(%rax)
	movb	232(%rsp), %cl
	movb	%cl, 16(%rax)
	movb	233(%rsp), %cl
	movb	%cl, 17(%rax)
	movb	234(%rsp), %cl
	movb	%cl, 18(%rax)
	movb	235(%rsp), %cl
	movb	%cl, 19(%rax)
	movb	236(%rsp), %cl
	movb	%cl, 20(%rax)
	movb	237(%rsp), %cl
	movb	%cl, 21(%rax)
	movb	238(%rsp), %cl
	movb	%cl, 22(%rax)
	movb	239(%rsp), %cl
	movb	%cl, 23(%rax)
	movb	240(%rsp), %cl
	movb	%cl, 24(%rax)
	movb	241(%rsp), %cl
	movb	%cl, 25(%rax)
	movb	242(%rsp), %cl
	movb	%cl, 26(%rax)
	movb	243(%rsp), %cl
	movb	%cl, 27(%rax)
	movb	244(%rsp), %cl
	movb	%cl, 28(%rax)
	movb	245(%rsp), %cl
	movb	%cl, 29(%rax)
	movb	246(%rsp), %cl
	movb	%cl, 30(%rax)
	movb	247(%rsp), %cl
	movb	%cl, 31(%rax)
	movb	248(%rsp), %cl
	movb	%cl, 32(%rax)
	movb	249(%rsp), %cl
	movb	%cl, 33(%rax)
	movb	250(%rsp), %cl
	movb	%cl, 34(%rax)
	movb	251(%rsp), %cl
	movb	%cl, 35(%rax)
	movb	252(%rsp), %cl
	movb	%cl, 36(%rax)
	movb	253(%rsp), %cl
	movb	%cl, 37(%rax)
	movb	254(%rsp), %cl
	movb	%cl, 38(%rax)
	movb	255(%rsp), %cl
	movb	%cl, 39(%rax)
	movb	256(%rsp), %cl
	movb	%cl, 40(%rax)
	movb	257(%rsp), %cl
	movb	%cl, 41(%rax)
	movb	258(%rsp), %cl
	movb	%cl, 42(%rax)
	movb	259(%rsp), %cl
	movb	%cl, 43(%rax)
	movb	260(%rsp), %cl
	movb	%cl, 44(%rax)
	movb	261(%rsp), %cl
	movb	%cl, 45(%rax)
	movb	262(%rsp), %cl
	movb	%cl, 46(%rax)
	movb	263(%rsp), %cl
	movb	%cl, 47(%rax)
	movb	264(%rsp), %cl
	movb	%cl, 48(%rax)
	movb	265(%rsp), %cl
	movb	%cl, 49(%rax)
	movb	266(%rsp), %cl
	movb	%cl, 50(%rax)
	movb	267(%rsp), %cl
	movb	%cl, 51(%rax)
	movb	268(%rsp), %cl
	movb	%cl, 52(%rax)
	movb	269(%rsp), %cl
	movb	%cl, 53(%rax)
	movb	270(%rsp), %cl
	movb	%cl, 54(%rax)
	movb	271(%rsp), %cl
	movb	%cl, 55(%rax)
	movb	272(%rsp), %cl
	movb	%cl, 56(%rax)
	movb	273(%rsp), %cl
	movb	%cl, 57(%rax)
	movb	274(%rsp), %cl
	movb	%cl, 58(%rax)
	movb	275(%rsp), %cl
	movb	%cl, 59(%rax)
	movb	276(%rsp), %cl
	movb	%cl, 60(%rax)
	movb	277(%rsp), %cl
	movb	%cl, 61(%rax)
	movb	278(%rsp), %cl
	movb	%cl, 62(%rax)
	movb	279(%rsp), %cl
	movb	%cl, 63(%rax)
	movb	280(%rsp), %cl
	movb	%cl, 64(%rax)
	movb	281(%rsp), %cl
	movb	%cl, 65(%rax)
	movb	282(%rsp), %cl
	movb	%cl, 66(%rax)
	movb	283(%rsp), %cl
	movb	%cl, 67(%rax)
	movb	284(%rsp), %cl
	movb	%cl, 68(%rax)
	movb	285(%rsp), %cl
	movb	%cl, 69(%rax)
	movb	286(%rsp), %cl
	movb	%cl, 70(%rax)
	movb	287(%rsp), %cl
	movb	%cl, 71(%rax)
	movb	288(%rsp), %cl
	movb	%cl, 72(%rax)
	movb	289(%rsp), %cl
	movb	%cl, 73(%rax)
	movb	290(%rsp), %cl
	movb	%cl, 74(%rax)
	movb	291(%rsp), %cl
	movb	%cl, 75(%rax)
	movb	292(%rsp), %cl
	movb	%cl, 76(%rax)
	movb	293(%rsp), %cl
	movb	%cl, 77(%rax)
	movb	294(%rsp), %cl
	movb	%cl, 78(%rax)
	movb	295(%rsp), %cl
	movb	%cl, 79(%rax)
	movb	296(%rsp), %cl
	movb	%cl, 80(%rax)
	movb	297(%rsp), %cl
	movb	%cl, 81(%rax)
	movb	298(%rsp), %cl
	movb	%cl, 82(%rax)
	movb	299(%rsp), %cl
	movb	%cl, 83(%rax)
	movb	300(%rsp), %cl
	movb	%cl, 84(%rax)
	movb	301(%rsp), %cl
	movb	%cl, 85(%rax)
	movb	302(%rsp), %cl
	movb	%cl, 86(%rax)
	movb	303(%rsp), %cl
	movb	%cl, 87(%rax)
	movb	304(%rsp), %cl
	movb	%cl, 88(%rax)
	movb	305(%rsp), %cl
	movb	%cl, 89(%rax)
	movb	306(%rsp), %cl
	movb	%cl, 90(%rax)
	movb	307(%rsp), %cl
	movb	%cl, 91(%rax)
	movb	308(%rsp), %cl
	movb	%cl, 92(%rax)
	movb	309(%rsp), %cl
	movb	%cl, 93(%rax)
	movb	310(%rsp), %cl
	movb	%cl, 94(%rax)
	movb	311(%rsp), %cl
	movb	%cl, 95(%rax)
	movb	312(%rsp), %cl
	movb	%cl, 96(%rax)
	movb	313(%rsp), %cl
	movb	%cl, 97(%rax)
	movb	314(%rsp), %cl
	movb	%cl, 98(%rax)
	movb	315(%rsp), %cl
	movb	%cl, 99(%rax)
	movb	316(%rsp), %cl
	movb	%cl, 100(%rax)
	movb	317(%rsp), %cl
	movb	%cl, 101(%rax)
	movb	318(%rsp), %cl
	movb	%cl, 102(%rax)
	movb	319(%rsp), %cl
	movb	%cl, 103(%rax)
	movb	320(%rsp), %cl
	movb	%cl, 104(%rax)
	movb	321(%rsp), %cl
	movb	%cl, 105(%rax)
	movb	322(%rsp), %cl
	movb	%cl, 106(%rax)
	movb	323(%rsp), %cl
	movb	%cl, 107(%rax)
	movb	324(%rsp), %cl
	movb	%cl, 108(%rax)
	movb	325(%rsp), %cl
	movb	%cl, 109(%rax)
	movb	326(%rsp), %cl
	movb	%cl, 110(%rax)
	movb	327(%rsp), %cl
	movb	%cl, 111(%rax)
	movb	328(%rsp), %cl
	movb	%cl, 112(%rax)
	movb	329(%rsp), %cl
	movb	%cl, 113(%rax)
	movb	330(%rsp), %cl
	movb	%cl, 114(%rax)
	movb	331(%rsp), %cl
	movb	%cl, 115(%rax)
	movb	332(%rsp), %cl
	movb	%cl, 116(%rax)
	movb	333(%rsp), %cl
	movb	%cl, 117(%rax)
	movb	334(%rsp), %cl
	movb	%cl, 118(%rax)
	movb	335(%rsp), %cl
	movb	%cl, 119(%rax)
	movb	336(%rsp), %cl
	movb	%cl, 120(%rax)
	movb	337(%rsp), %cl
	movb	%cl, 121(%rax)
	movb	338(%rsp), %cl
	movb	%cl, 122(%rax)
	movb	339(%rsp), %cl
	movb	%cl, 123(%rax)
	movb	340(%rsp), %cl
	movb	%cl, 124(%rax)
	movb	341(%rsp), %cl
	movb	%cl, 125(%rax)
	movb	342(%rsp), %cl
	movb	%cl, 126(%rax)
	movb	343(%rsp), %cl
	movb	%cl, 127(%rax)
	movb	344(%rsp), %cl
	movb	%cl, 128(%rax)
	movb	345(%rsp), %cl
	movb	%cl, 129(%rax)
	movb	346(%rsp), %cl
	movb	%cl, 130(%rax)
	movb	347(%rsp), %cl
	movb	%cl, 131(%rax)
	movb	348(%rsp), %cl
	movb	%cl, 132(%rax)
	movb	349(%rsp), %cl
	movb	%cl, 133(%rax)
	movb	350(%rsp), %cl
	movb	%cl, 134(%rax)
	movb	351(%rsp), %cl
	movb	%cl, 135(%rax)
	movb	352(%rsp), %cl
	movb	%cl, 136(%rax)
	movb	353(%rsp), %cl
	movb	%cl, 137(%rax)
	movb	354(%rsp), %cl
	movb	%cl, 138(%rax)
	movb	355(%rsp), %cl
	movb	%cl, 139(%rax)
	movb	356(%rsp), %cl
	movb	%cl, 140(%rax)
	movb	357(%rsp), %cl
	movb	%cl, 141(%rax)
	movb	358(%rsp), %cl
	movb	%cl, 142(%rax)
	movb	359(%rsp), %cl
	movb	%cl, 143(%rax)
	movb	360(%rsp), %cl
	movb	%cl, 144(%rax)
	movb	361(%rsp), %cl
	movb	%cl, 145(%rax)
	movb	362(%rsp), %cl
	movb	%cl, 146(%rax)
	movb	363(%rsp), %cl
	movb	%cl, 147(%rax)
	movb	364(%rsp), %cl
	movb	%cl, 148(%rax)
	movb	365(%rsp), %cl
	movb	%cl, 149(%rax)
	movb	366(%rsp), %cl
	movb	%cl, 150(%rax)
	movb	367(%rsp), %cl
	movb	%cl, 151(%rax)
	movb	368(%rsp), %cl
	movb	%cl, 152(%rax)
	movb	369(%rsp), %cl
	movb	%cl, 153(%rax)
	movb	370(%rsp), %cl
	movb	%cl, 154(%rax)
	movb	371(%rsp), %cl
	movb	%cl, 155(%rax)
	movb	372(%rsp), %cl
	movb	%cl, 156(%rax)
	movb	373(%rsp), %cl
	movb	%cl, 157(%rax)
	movb	374(%rsp), %cl
	movb	%cl, 158(%rax)
	movb	375(%rsp), %cl
	movb	%cl, 159(%rax)
	movb	376(%rsp), %cl
	movb	%cl, 160(%rax)
	movb	377(%rsp), %cl
	movb	%cl, 161(%rax)
	movb	378(%rsp), %cl
	movb	%cl, 162(%rax)
	movb	379(%rsp), %cl
	movb	%cl, 163(%rax)
	movb	380(%rsp), %cl
	movb	%cl, 164(%rax)
	movb	381(%rsp), %cl
	movb	%cl, 165(%rax)
	movb	382(%rsp), %cl
	movb	%cl, 166(%rax)
	movb	383(%rsp), %cl
	movb	%cl, 167(%rax)
	movq	384(%rsp), %rbp
	movq	392(%rsp), %rbx
	movq	400(%rsp), %rsp
	ret
_shake128_absorb34_jazz:
shake128_absorb34_jazz:
	movq	%rsp, %r10
	leaq	-234(%rsp), %rsp
	andq	$-8, %rsp
	movb	(%rsi), %al
	movb	%al, 200(%rsp)
	movb	1(%rsi), %al
	movb	%al, 201(%rsp)
	movb	2(%rsi), %al
	movb	%al, 202(%rsp)
	movb	3(%rsi), %al
	movb	%al, 203(%rsp)
	movb	4(%rsi), %al
	movb	%al, 204(%rsp)
	movb	5(%rsi), %al
	movb	%al, 205(%rsp)
	movb	6(%rsi), %al
	movb	%al, 206(%rsp)
	movb	7(%rsi), %al
	movb	%al, 207(%rsp)
	movb	8(%rsi), %al
	movb	%al, 208(%rsp)
	movb	9(%rsi), %al
	movb	%al, 209(%rsp)
	movb	10(%rsi), %al
	movb	%al, 210(%rsp)
	movb	11(%rsi), %al
	movb	%al, 211(%rsp)
	movb	12(%rsi), %al
	movb	%al, 212(%rsp)
	movb	13(%rsi), %al
	movb	%al, 213(%rsp)
	movb	14(%rsi), %al
	movb	%al, 214(%rsp)
	movb	15(%rsi), %al
	movb	%al, 215(%rsp)
	movb	16(%rsi), %al
	movb	%al, 216(%rsp)
	movb	17(%rsi), %al
	movb	%al, 217(%rsp)
	movb	18(%rsi), %al
	movb	%al, 218(%rsp)
	movb	19(%rsi), %al
	movb	%al, 219(%rsp)
	movb	20(%rsi), %al
	movb	%al, 220(%rsp)
	movb	21(%rsi), %al
	movb	%al, 221(%rsp)
	movb	22(%rsi), %al
	movb	%al, 222(%rsp)
	movb	23(%rsi), %al
	movb	%al, 223(%rsp)
	movb	24(%rsi), %al
	movb	%al, 224(%rsp)
	movb	25(%rsi), %al
	movb	%al, 225(%rsp)
	movb	26(%rsi), %al
	movb	%al, 226(%rsp)
	movb	27(%rsi), %al
	movb	%al, 227(%rsp)
	movb	28(%rsi), %al
	movb	%al, 228(%rsp)
	movb	29(%rsi), %al
	movb	%al, 229(%rsp)
	movb	30(%rsi), %al
	movb	%al, 230(%rsp)
	movb	31(%rsi), %al
	movb	%al, 231(%rsp)
	movb	32(%rsi), %al
	movb	%al, 232(%rsp)
	movb	33(%rsi), %al
	movb	%al, 233(%rsp)
	movq	%rsp, %rax
	leaq	200(%rsp), %rcx
	call	L_shake128_absorb34$1
Lshake128_absorb34_jazz$1:
	movq	(%rsp), %rax
	movq	%rax, (%rdi)
	movq	8(%rsp), %rax
	movq	%rax, 8(%rdi)
	movq	16(%rsp), %rax
	movq	%rax, 16(%rdi)
	movq	24(%rsp), %rax
	movq	%rax, 24(%rdi)
	movq	32(%rsp), %rax
	movq	%rax, 32(%rdi)
	movq	40(%rsp), %rax
	movq	%rax, 40(%rdi)
	movq	48(%rsp), %rax
	movq	%rax, 48(%rdi)
	movq	56(%rsp), %rax
	movq	%rax, 56(%rdi)
	movq	64(%rsp), %rax
	movq	%rax, 64(%rdi)
	movq	72(%rsp), %rax
	movq	%rax, 72(%rdi)
	movq	80(%rsp), %rax
	movq	%rax, 80(%rdi)
	movq	88(%rsp), %rax
	movq	%rax, 88(%rdi)
	movq	96(%rsp), %rax
	movq	%rax, 96(%rdi)
	movq	104(%rsp), %rax
	movq	%rax, 104(%rdi)
	movq	112(%rsp), %rax
	movq	%rax, 112(%rdi)
	movq	120(%rsp), %rax
	movq	%rax, 120(%rdi)
	movq	128(%rsp), %rax
	movq	%rax, 128(%rdi)
	movq	136(%rsp), %rax
	movq	%rax, 136(%rdi)
	movq	144(%rsp), %rax
	movq	%rax, 144(%rdi)
	movq	152(%rsp), %rax
	movq	%rax, 152(%rdi)
	movq	160(%rsp), %rax
	movq	%rax, 160(%rdi)
	movq	168(%rsp), %rax
	movq	%rax, 168(%rdi)
	movq	176(%rsp), %rax
	movq	%rax, 176(%rdi)
	movq	184(%rsp), %rax
	movq	%rax, 184(%rdi)
	movq	192(%rsp), %rax
	movq	%rax, 192(%rdi)
	movq	%r10, %rsp
	ret
_sha3512_32_jazz:
sha3512_32_jazz:
	movq	%rsp, %rax
	leaq	-128(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rax, 120(%rsp)
	movq	%rbp, 104(%rsp)
	movq	%rbx, 112(%rsp)
	movb	(%rsi), %al
	movb	%al, 8(%rsp)
	movb	1(%rsi), %al
	movb	%al, 9(%rsp)
	movb	2(%rsi), %al
	movb	%al, 10(%rsp)
	movb	3(%rsi), %al
	movb	%al, 11(%rsp)
	movb	4(%rsi), %al
	movb	%al, 12(%rsp)
	movb	5(%rsi), %al
	movb	%al, 13(%rsp)
	movb	6(%rsi), %al
	movb	%al, 14(%rsp)
	movb	7(%rsi), %al
	movb	%al, 15(%rsp)
	movb	8(%rsi), %al
	movb	%al, 16(%rsp)
	movb	9(%rsi), %al
	movb	%al, 17(%rsp)
	movb	10(%rsi), %al
	movb	%al, 18(%rsp)
	movb	11(%rsi), %al
	movb	%al, 19(%rsp)
	movb	12(%rsi), %al
	movb	%al, 20(%rsp)
	movb	13(%rsi), %al
	movb	%al, 21(%rsp)
	movb	14(%rsi), %al
	movb	%al, 22(%rsp)
	movb	15(%rsi), %al
	movb	%al, 23(%rsp)
	movb	16(%rsi), %al
	movb	%al, 24(%rsp)
	movb	17(%rsi), %al
	movb	%al, 25(%rsp)
	movb	18(%rsi), %al
	movb	%al, 26(%rsp)
	movb	19(%rsi), %al
	movb	%al, 27(%rsp)
	movb	20(%rsi), %al
	movb	%al, 28(%rsp)
	movb	21(%rsi), %al
	movb	%al, 29(%rsp)
	movb	22(%rsi), %al
	movb	%al, 30(%rsp)
	movb	23(%rsi), %al
	movb	%al, 31(%rsp)
	movb	24(%rsi), %al
	movb	%al, 32(%rsp)
	movb	25(%rsi), %al
	movb	%al, 33(%rsp)
	movb	26(%rsi), %al
	movb	%al, 34(%rsp)
	movb	27(%rsi), %al
	movb	%al, 35(%rsp)
	movb	28(%rsi), %al
	movb	%al, 36(%rsp)
	movb	29(%rsi), %al
	movb	%al, 37(%rsp)
	movb	30(%rsi), %al
	movb	%al, 38(%rsp)
	movb	31(%rsi), %al
	movb	%al, 39(%rsp)
	movq	%rdi, (%rsp)
	leaq	40(%rsp), %rax
	leaq	8(%rsp), %rcx
	leaq	-200(%rsp), %rsp
	call	L_sha3512_32$1
Lsha3512_32_jazz$1:
	leaq	200(%rsp), %rsp
	movq	(%rsp), %rax
	movb	40(%rsp), %cl
	movb	%cl, (%rax)
	movb	41(%rsp), %cl
	movb	%cl, 1(%rax)
	movb	42(%rsp), %cl
	movb	%cl, 2(%rax)
	movb	43(%rsp), %cl
	movb	%cl, 3(%rax)
	movb	44(%rsp), %cl
	movb	%cl, 4(%rax)
	movb	45(%rsp), %cl
	movb	%cl, 5(%rax)
	movb	46(%rsp), %cl
	movb	%cl, 6(%rax)
	movb	47(%rsp), %cl
	movb	%cl, 7(%rax)
	movb	48(%rsp), %cl
	movb	%cl, 8(%rax)
	movb	49(%rsp), %cl
	movb	%cl, 9(%rax)
	movb	50(%rsp), %cl
	movb	%cl, 10(%rax)
	movb	51(%rsp), %cl
	movb	%cl, 11(%rax)
	movb	52(%rsp), %cl
	movb	%cl, 12(%rax)
	movb	53(%rsp), %cl
	movb	%cl, 13(%rax)
	movb	54(%rsp), %cl
	movb	%cl, 14(%rax)
	movb	55(%rsp), %cl
	movb	%cl, 15(%rax)
	movb	56(%rsp), %cl
	movb	%cl, 16(%rax)
	movb	57(%rsp), %cl
	movb	%cl, 17(%rax)
	movb	58(%rsp), %cl
	movb	%cl, 18(%rax)
	movb	59(%rsp), %cl
	movb	%cl, 19(%rax)
	movb	60(%rsp), %cl
	movb	%cl, 20(%rax)
	movb	61(%rsp), %cl
	movb	%cl, 21(%rax)
	movb	62(%rsp), %cl
	movb	%cl, 22(%rax)
	movb	63(%rsp), %cl
	movb	%cl, 23(%rax)
	movb	64(%rsp), %cl
	movb	%cl, 24(%rax)
	movb	65(%rsp), %cl
	movb	%cl, 25(%rax)
	movb	66(%rsp), %cl
	movb	%cl, 26(%rax)
	movb	67(%rsp), %cl
	movb	%cl, 27(%rax)
	movb	68(%rsp), %cl
	movb	%cl, 28(%rax)
	movb	69(%rsp), %cl
	movb	%cl, 29(%rax)
	movb	70(%rsp), %cl
	movb	%cl, 30(%rax)
	movb	71(%rsp), %cl
	movb	%cl, 31(%rax)
	movb	72(%rsp), %cl
	movb	%cl, 32(%rax)
	movb	73(%rsp), %cl
	movb	%cl, 33(%rax)
	movb	74(%rsp), %cl
	movb	%cl, 34(%rax)
	movb	75(%rsp), %cl
	movb	%cl, 35(%rax)
	movb	76(%rsp), %cl
	movb	%cl, 36(%rax)
	movb	77(%rsp), %cl
	movb	%cl, 37(%rax)
	movb	78(%rsp), %cl
	movb	%cl, 38(%rax)
	movb	79(%rsp), %cl
	movb	%cl, 39(%rax)
	movb	80(%rsp), %cl
	movb	%cl, 40(%rax)
	movb	81(%rsp), %cl
	movb	%cl, 41(%rax)
	movb	82(%rsp), %cl
	movb	%cl, 42(%rax)
	movb	83(%rsp), %cl
	movb	%cl, 43(%rax)
	movb	84(%rsp), %cl
	movb	%cl, 44(%rax)
	movb	85(%rsp), %cl
	movb	%cl, 45(%rax)
	movb	86(%rsp), %cl
	movb	%cl, 46(%rax)
	movb	87(%rsp), %cl
	movb	%cl, 47(%rax)
	movb	88(%rsp), %cl
	movb	%cl, 48(%rax)
	movb	89(%rsp), %cl
	movb	%cl, 49(%rax)
	movb	90(%rsp), %cl
	movb	%cl, 50(%rax)
	movb	91(%rsp), %cl
	movb	%cl, 51(%rax)
	movb	92(%rsp), %cl
	movb	%cl, 52(%rax)
	movb	93(%rsp), %cl
	movb	%cl, 53(%rax)
	movb	94(%rsp), %cl
	movb	%cl, 54(%rax)
	movb	95(%rsp), %cl
	movb	%cl, 55(%rax)
	movb	96(%rsp), %cl
	movb	%cl, 56(%rax)
	movb	97(%rsp), %cl
	movb	%cl, 57(%rax)
	movb	98(%rsp), %cl
	movb	%cl, 58(%rax)
	movb	99(%rsp), %cl
	movb	%cl, 59(%rax)
	movb	100(%rsp), %cl
	movb	%cl, 60(%rax)
	movb	101(%rsp), %cl
	movb	%cl, 61(%rax)
	movb	102(%rsp), %cl
	movb	%cl, 62(%rax)
	movb	103(%rsp), %cl
	movb	%cl, 63(%rax)
	movq	104(%rsp), %rbp
	movq	112(%rsp), %rbx
	movq	120(%rsp), %rsp
	ret
_shake256_128_33_jazz:
shake256_128_33_jazz:
	movq	%rsp, %rax
	leaq	-200(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rax, 192(%rsp)
	movq	%rbp, 176(%rsp)
	movq	%rbx, 184(%rsp)
	movb	(%rsi), %al
	movb	%al, 8(%rsp)
	movb	1(%rsi), %al
	movb	%al, 9(%rsp)
	movb	2(%rsi), %al
	movb	%al, 10(%rsp)
	movb	3(%rsi), %al
	movb	%al, 11(%rsp)
	movb	4(%rsi), %al
	movb	%al, 12(%rsp)
	movb	5(%rsi), %al
	movb	%al, 13(%rsp)
	movb	6(%rsi), %al
	movb	%al, 14(%rsp)
	movb	7(%rsi), %al
	movb	%al, 15(%rsp)
	movb	8(%rsi), %al
	movb	%al, 16(%rsp)
	movb	9(%rsi), %al
	movb	%al, 17(%rsp)
	movb	10(%rsi), %al
	movb	%al, 18(%rsp)
	movb	11(%rsi), %al
	movb	%al, 19(%rsp)
	movb	12(%rsi), %al
	movb	%al, 20(%rsp)
	movb	13(%rsi), %al
	movb	%al, 21(%rsp)
	movb	14(%rsi), %al
	movb	%al, 22(%rsp)
	movb	15(%rsi), %al
	movb	%al, 23(%rsp)
	movb	16(%rsi), %al
	movb	%al, 24(%rsp)
	movb	17(%rsi), %al
	movb	%al, 25(%rsp)
	movb	18(%rsi), %al
	movb	%al, 26(%rsp)
	movb	19(%rsi), %al
	movb	%al, 27(%rsp)
	movb	20(%rsi), %al
	movb	%al, 28(%rsp)
	movb	21(%rsi), %al
	movb	%al, 29(%rsp)
	movb	22(%rsi), %al
	movb	%al, 30(%rsp)
	movb	23(%rsi), %al
	movb	%al, 31(%rsp)
	movb	24(%rsi), %al
	movb	%al, 32(%rsp)
	movb	25(%rsi), %al
	movb	%al, 33(%rsp)
	movb	26(%rsi), %al
	movb	%al, 34(%rsp)
	movb	27(%rsi), %al
	movb	%al, 35(%rsp)
	movb	28(%rsi), %al
	movb	%al, 36(%rsp)
	movb	29(%rsi), %al
	movb	%al, 37(%rsp)
	movb	30(%rsi), %al
	movb	%al, 38(%rsp)
	movb	31(%rsi), %al
	movb	%al, 39(%rsp)
	movb	32(%rsi), %al
	movb	%al, 40(%rsp)
	movq	%rdi, (%rsp)
	leaq	41(%rsp), %rcx
	leaq	8(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	L_shake256_128_33$1
Lshake256_128_33_jazz$1:
	leaq	208(%rsp), %rsp
	movq	(%rsp), %rax
	movb	41(%rsp), %cl
	movb	%cl, (%rax)
	movb	42(%rsp), %cl
	movb	%cl, 1(%rax)
	movb	43(%rsp), %cl
	movb	%cl, 2(%rax)
	movb	44(%rsp), %cl
	movb	%cl, 3(%rax)
	movb	45(%rsp), %cl
	movb	%cl, 4(%rax)
	movb	46(%rsp), %cl
	movb	%cl, 5(%rax)
	movb	47(%rsp), %cl
	movb	%cl, 6(%rax)
	movb	48(%rsp), %cl
	movb	%cl, 7(%rax)
	movb	49(%rsp), %cl
	movb	%cl, 8(%rax)
	movb	50(%rsp), %cl
	movb	%cl, 9(%rax)
	movb	51(%rsp), %cl
	movb	%cl, 10(%rax)
	movb	52(%rsp), %cl
	movb	%cl, 11(%rax)
	movb	53(%rsp), %cl
	movb	%cl, 12(%rax)
	movb	54(%rsp), %cl
	movb	%cl, 13(%rax)
	movb	55(%rsp), %cl
	movb	%cl, 14(%rax)
	movb	56(%rsp), %cl
	movb	%cl, 15(%rax)
	movb	57(%rsp), %cl
	movb	%cl, 16(%rax)
	movb	58(%rsp), %cl
	movb	%cl, 17(%rax)
	movb	59(%rsp), %cl
	movb	%cl, 18(%rax)
	movb	60(%rsp), %cl
	movb	%cl, 19(%rax)
	movb	61(%rsp), %cl
	movb	%cl, 20(%rax)
	movb	62(%rsp), %cl
	movb	%cl, 21(%rax)
	movb	63(%rsp), %cl
	movb	%cl, 22(%rax)
	movb	64(%rsp), %cl
	movb	%cl, 23(%rax)
	movb	65(%rsp), %cl
	movb	%cl, 24(%rax)
	movb	66(%rsp), %cl
	movb	%cl, 25(%rax)
	movb	67(%rsp), %cl
	movb	%cl, 26(%rax)
	movb	68(%rsp), %cl
	movb	%cl, 27(%rax)
	movb	69(%rsp), %cl
	movb	%cl, 28(%rax)
	movb	70(%rsp), %cl
	movb	%cl, 29(%rax)
	movb	71(%rsp), %cl
	movb	%cl, 30(%rax)
	movb	72(%rsp), %cl
	movb	%cl, 31(%rax)
	movb	73(%rsp), %cl
	movb	%cl, 32(%rax)
	movb	74(%rsp), %cl
	movb	%cl, 33(%rax)
	movb	75(%rsp), %cl
	movb	%cl, 34(%rax)
	movb	76(%rsp), %cl
	movb	%cl, 35(%rax)
	movb	77(%rsp), %cl
	movb	%cl, 36(%rax)
	movb	78(%rsp), %cl
	movb	%cl, 37(%rax)
	movb	79(%rsp), %cl
	movb	%cl, 38(%rax)
	movb	80(%rsp), %cl
	movb	%cl, 39(%rax)
	movb	81(%rsp), %cl
	movb	%cl, 40(%rax)
	movb	82(%rsp), %cl
	movb	%cl, 41(%rax)
	movb	83(%rsp), %cl
	movb	%cl, 42(%rax)
	movb	84(%rsp), %cl
	movb	%cl, 43(%rax)
	movb	85(%rsp), %cl
	movb	%cl, 44(%rax)
	movb	86(%rsp), %cl
	movb	%cl, 45(%rax)
	movb	87(%rsp), %cl
	movb	%cl, 46(%rax)
	movb	88(%rsp), %cl
	movb	%cl, 47(%rax)
	movb	89(%rsp), %cl
	movb	%cl, 48(%rax)
	movb	90(%rsp), %cl
	movb	%cl, 49(%rax)
	movb	91(%rsp), %cl
	movb	%cl, 50(%rax)
	movb	92(%rsp), %cl
	movb	%cl, 51(%rax)
	movb	93(%rsp), %cl
	movb	%cl, 52(%rax)
	movb	94(%rsp), %cl
	movb	%cl, 53(%rax)
	movb	95(%rsp), %cl
	movb	%cl, 54(%rax)
	movb	96(%rsp), %cl
	movb	%cl, 55(%rax)
	movb	97(%rsp), %cl
	movb	%cl, 56(%rax)
	movb	98(%rsp), %cl
	movb	%cl, 57(%rax)
	movb	99(%rsp), %cl
	movb	%cl, 58(%rax)
	movb	100(%rsp), %cl
	movb	%cl, 59(%rax)
	movb	101(%rsp), %cl
	movb	%cl, 60(%rax)
	movb	102(%rsp), %cl
	movb	%cl, 61(%rax)
	movb	103(%rsp), %cl
	movb	%cl, 62(%rax)
	movb	104(%rsp), %cl
	movb	%cl, 63(%rax)
	movb	105(%rsp), %cl
	movb	%cl, 64(%rax)
	movb	106(%rsp), %cl
	movb	%cl, 65(%rax)
	movb	107(%rsp), %cl
	movb	%cl, 66(%rax)
	movb	108(%rsp), %cl
	movb	%cl, 67(%rax)
	movb	109(%rsp), %cl
	movb	%cl, 68(%rax)
	movb	110(%rsp), %cl
	movb	%cl, 69(%rax)
	movb	111(%rsp), %cl
	movb	%cl, 70(%rax)
	movb	112(%rsp), %cl
	movb	%cl, 71(%rax)
	movb	113(%rsp), %cl
	movb	%cl, 72(%rax)
	movb	114(%rsp), %cl
	movb	%cl, 73(%rax)
	movb	115(%rsp), %cl
	movb	%cl, 74(%rax)
	movb	116(%rsp), %cl
	movb	%cl, 75(%rax)
	movb	117(%rsp), %cl
	movb	%cl, 76(%rax)
	movb	118(%rsp), %cl
	movb	%cl, 77(%rax)
	movb	119(%rsp), %cl
	movb	%cl, 78(%rax)
	movb	120(%rsp), %cl
	movb	%cl, 79(%rax)
	movb	121(%rsp), %cl
	movb	%cl, 80(%rax)
	movb	122(%rsp), %cl
	movb	%cl, 81(%rax)
	movb	123(%rsp), %cl
	movb	%cl, 82(%rax)
	movb	124(%rsp), %cl
	movb	%cl, 83(%rax)
	movb	125(%rsp), %cl
	movb	%cl, 84(%rax)
	movb	126(%rsp), %cl
	movb	%cl, 85(%rax)
	movb	127(%rsp), %cl
	movb	%cl, 86(%rax)
	movb	128(%rsp), %cl
	movb	%cl, 87(%rax)
	movb	129(%rsp), %cl
	movb	%cl, 88(%rax)
	movb	130(%rsp), %cl
	movb	%cl, 89(%rax)
	movb	131(%rsp), %cl
	movb	%cl, 90(%rax)
	movb	132(%rsp), %cl
	movb	%cl, 91(%rax)
	movb	133(%rsp), %cl
	movb	%cl, 92(%rax)
	movb	134(%rsp), %cl
	movb	%cl, 93(%rax)
	movb	135(%rsp), %cl
	movb	%cl, 94(%rax)
	movb	136(%rsp), %cl
	movb	%cl, 95(%rax)
	movb	137(%rsp), %cl
	movb	%cl, 96(%rax)
	movb	138(%rsp), %cl
	movb	%cl, 97(%rax)
	movb	139(%rsp), %cl
	movb	%cl, 98(%rax)
	movb	140(%rsp), %cl
	movb	%cl, 99(%rax)
	movb	141(%rsp), %cl
	movb	%cl, 100(%rax)
	movb	142(%rsp), %cl
	movb	%cl, 101(%rax)
	movb	143(%rsp), %cl
	movb	%cl, 102(%rax)
	movb	144(%rsp), %cl
	movb	%cl, 103(%rax)
	movb	145(%rsp), %cl
	movb	%cl, 104(%rax)
	movb	146(%rsp), %cl
	movb	%cl, 105(%rax)
	movb	147(%rsp), %cl
	movb	%cl, 106(%rax)
	movb	148(%rsp), %cl
	movb	%cl, 107(%rax)
	movb	149(%rsp), %cl
	movb	%cl, 108(%rax)
	movb	150(%rsp), %cl
	movb	%cl, 109(%rax)
	movb	151(%rsp), %cl
	movb	%cl, 110(%rax)
	movb	152(%rsp), %cl
	movb	%cl, 111(%rax)
	movb	153(%rsp), %cl
	movb	%cl, 112(%rax)
	movb	154(%rsp), %cl
	movb	%cl, 113(%rax)
	movb	155(%rsp), %cl
	movb	%cl, 114(%rax)
	movb	156(%rsp), %cl
	movb	%cl, 115(%rax)
	movb	157(%rsp), %cl
	movb	%cl, 116(%rax)
	movb	158(%rsp), %cl
	movb	%cl, 117(%rax)
	movb	159(%rsp), %cl
	movb	%cl, 118(%rax)
	movb	160(%rsp), %cl
	movb	%cl, 119(%rax)
	movb	161(%rsp), %cl
	movb	%cl, 120(%rax)
	movb	162(%rsp), %cl
	movb	%cl, 121(%rax)
	movb	163(%rsp), %cl
	movb	%cl, 122(%rax)
	movb	164(%rsp), %cl
	movb	%cl, 123(%rax)
	movb	165(%rsp), %cl
	movb	%cl, 124(%rax)
	movb	166(%rsp), %cl
	movb	%cl, 125(%rax)
	movb	167(%rsp), %cl
	movb	%cl, 126(%rax)
	movb	168(%rsp), %cl
	movb	%cl, 127(%rax)
	movq	176(%rsp), %rbp
	movq	184(%rsp), %rbx
	movq	192(%rsp), %rsp
	ret
L_shake128_squeezeblock$1:
	leaq	-200(%rsp), %rsp
	call	L__keccakf1600_ref$1
L_shake128_squeezeblock$2:
	leaq	200(%rsp), %rsp
	movb	(%rcx), %dl
	movb	%dl, (%rax)
	movb	1(%rcx), %dl
	movb	%dl, 1(%rax)
	movb	2(%rcx), %dl
	movb	%dl, 2(%rax)
	movb	3(%rcx), %dl
	movb	%dl, 3(%rax)
	movb	4(%rcx), %dl
	movb	%dl, 4(%rax)
	movb	5(%rcx), %dl
	movb	%dl, 5(%rax)
	movb	6(%rcx), %dl
	movb	%dl, 6(%rax)
	movb	7(%rcx), %dl
	movb	%dl, 7(%rax)
	movb	8(%rcx), %dl
	movb	%dl, 8(%rax)
	movb	9(%rcx), %dl
	movb	%dl, 9(%rax)
	movb	10(%rcx), %dl
	movb	%dl, 10(%rax)
	movb	11(%rcx), %dl
	movb	%dl, 11(%rax)
	movb	12(%rcx), %dl
	movb	%dl, 12(%rax)
	movb	13(%rcx), %dl
	movb	%dl, 13(%rax)
	movb	14(%rcx), %dl
	movb	%dl, 14(%rax)
	movb	15(%rcx), %dl
	movb	%dl, 15(%rax)
	movb	16(%rcx), %dl
	movb	%dl, 16(%rax)
	movb	17(%rcx), %dl
	movb	%dl, 17(%rax)
	movb	18(%rcx), %dl
	movb	%dl, 18(%rax)
	movb	19(%rcx), %dl
	movb	%dl, 19(%rax)
	movb	20(%rcx), %dl
	movb	%dl, 20(%rax)
	movb	21(%rcx), %dl
	movb	%dl, 21(%rax)
	movb	22(%rcx), %dl
	movb	%dl, 22(%rax)
	movb	23(%rcx), %dl
	movb	%dl, 23(%rax)
	movb	24(%rcx), %dl
	movb	%dl, 24(%rax)
	movb	25(%rcx), %dl
	movb	%dl, 25(%rax)
	movb	26(%rcx), %dl
	movb	%dl, 26(%rax)
	movb	27(%rcx), %dl
	movb	%dl, 27(%rax)
	movb	28(%rcx), %dl
	movb	%dl, 28(%rax)
	movb	29(%rcx), %dl
	movb	%dl, 29(%rax)
	movb	30(%rcx), %dl
	movb	%dl, 30(%rax)
	movb	31(%rcx), %dl
	movb	%dl, 31(%rax)
	movb	32(%rcx), %dl
	movb	%dl, 32(%rax)
	movb	33(%rcx), %dl
	movb	%dl, 33(%rax)
	movb	34(%rcx), %dl
	movb	%dl, 34(%rax)
	movb	35(%rcx), %dl
	movb	%dl, 35(%rax)
	movb	36(%rcx), %dl
	movb	%dl, 36(%rax)
	movb	37(%rcx), %dl
	movb	%dl, 37(%rax)
	movb	38(%rcx), %dl
	movb	%dl, 38(%rax)
	movb	39(%rcx), %dl
	movb	%dl, 39(%rax)
	movb	40(%rcx), %dl
	movb	%dl, 40(%rax)
	movb	41(%rcx), %dl
	movb	%dl, 41(%rax)
	movb	42(%rcx), %dl
	movb	%dl, 42(%rax)
	movb	43(%rcx), %dl
	movb	%dl, 43(%rax)
	movb	44(%rcx), %dl
	movb	%dl, 44(%rax)
	movb	45(%rcx), %dl
	movb	%dl, 45(%rax)
	movb	46(%rcx), %dl
	movb	%dl, 46(%rax)
	movb	47(%rcx), %dl
	movb	%dl, 47(%rax)
	movb	48(%rcx), %dl
	movb	%dl, 48(%rax)
	movb	49(%rcx), %dl
	movb	%dl, 49(%rax)
	movb	50(%rcx), %dl
	movb	%dl, 50(%rax)
	movb	51(%rcx), %dl
	movb	%dl, 51(%rax)
	movb	52(%rcx), %dl
	movb	%dl, 52(%rax)
	movb	53(%rcx), %dl
	movb	%dl, 53(%rax)
	movb	54(%rcx), %dl
	movb	%dl, 54(%rax)
	movb	55(%rcx), %dl
	movb	%dl, 55(%rax)
	movb	56(%rcx), %dl
	movb	%dl, 56(%rax)
	movb	57(%rcx), %dl
	movb	%dl, 57(%rax)
	movb	58(%rcx), %dl
	movb	%dl, 58(%rax)
	movb	59(%rcx), %dl
	movb	%dl, 59(%rax)
	movb	60(%rcx), %dl
	movb	%dl, 60(%rax)
	movb	61(%rcx), %dl
	movb	%dl, 61(%rax)
	movb	62(%rcx), %dl
	movb	%dl, 62(%rax)
	movb	63(%rcx), %dl
	movb	%dl, 63(%rax)
	movb	64(%rcx), %dl
	movb	%dl, 64(%rax)
	movb	65(%rcx), %dl
	movb	%dl, 65(%rax)
	movb	66(%rcx), %dl
	movb	%dl, 66(%rax)
	movb	67(%rcx), %dl
	movb	%dl, 67(%rax)
	movb	68(%rcx), %dl
	movb	%dl, 68(%rax)
	movb	69(%rcx), %dl
	movb	%dl, 69(%rax)
	movb	70(%rcx), %dl
	movb	%dl, 70(%rax)
	movb	71(%rcx), %dl
	movb	%dl, 71(%rax)
	movb	72(%rcx), %dl
	movb	%dl, 72(%rax)
	movb	73(%rcx), %dl
	movb	%dl, 73(%rax)
	movb	74(%rcx), %dl
	movb	%dl, 74(%rax)
	movb	75(%rcx), %dl
	movb	%dl, 75(%rax)
	movb	76(%rcx), %dl
	movb	%dl, 76(%rax)
	movb	77(%rcx), %dl
	movb	%dl, 77(%rax)
	movb	78(%rcx), %dl
	movb	%dl, 78(%rax)
	movb	79(%rcx), %dl
	movb	%dl, 79(%rax)
	movb	80(%rcx), %dl
	movb	%dl, 80(%rax)
	movb	81(%rcx), %dl
	movb	%dl, 81(%rax)
	movb	82(%rcx), %dl
	movb	%dl, 82(%rax)
	movb	83(%rcx), %dl
	movb	%dl, 83(%rax)
	movb	84(%rcx), %dl
	movb	%dl, 84(%rax)
	movb	85(%rcx), %dl
	movb	%dl, 85(%rax)
	movb	86(%rcx), %dl
	movb	%dl, 86(%rax)
	movb	87(%rcx), %dl
	movb	%dl, 87(%rax)
	movb	88(%rcx), %dl
	movb	%dl, 88(%rax)
	movb	89(%rcx), %dl
	movb	%dl, 89(%rax)
	movb	90(%rcx), %dl
	movb	%dl, 90(%rax)
	movb	91(%rcx), %dl
	movb	%dl, 91(%rax)
	movb	92(%rcx), %dl
	movb	%dl, 92(%rax)
	movb	93(%rcx), %dl
	movb	%dl, 93(%rax)
	movb	94(%rcx), %dl
	movb	%dl, 94(%rax)
	movb	95(%rcx), %dl
	movb	%dl, 95(%rax)
	movb	96(%rcx), %dl
	movb	%dl, 96(%rax)
	movb	97(%rcx), %dl
	movb	%dl, 97(%rax)
	movb	98(%rcx), %dl
	movb	%dl, 98(%rax)
	movb	99(%rcx), %dl
	movb	%dl, 99(%rax)
	movb	100(%rcx), %dl
	movb	%dl, 100(%rax)
	movb	101(%rcx), %dl
	movb	%dl, 101(%rax)
	movb	102(%rcx), %dl
	movb	%dl, 102(%rax)
	movb	103(%rcx), %dl
	movb	%dl, 103(%rax)
	movb	104(%rcx), %dl
	movb	%dl, 104(%rax)
	movb	105(%rcx), %dl
	movb	%dl, 105(%rax)
	movb	106(%rcx), %dl
	movb	%dl, 106(%rax)
	movb	107(%rcx), %dl
	movb	%dl, 107(%rax)
	movb	108(%rcx), %dl
	movb	%dl, 108(%rax)
	movb	109(%rcx), %dl
	movb	%dl, 109(%rax)
	movb	110(%rcx), %dl
	movb	%dl, 110(%rax)
	movb	111(%rcx), %dl
	movb	%dl, 111(%rax)
	movb	112(%rcx), %dl
	movb	%dl, 112(%rax)
	movb	113(%rcx), %dl
	movb	%dl, 113(%rax)
	movb	114(%rcx), %dl
	movb	%dl, 114(%rax)
	movb	115(%rcx), %dl
	movb	%dl, 115(%rax)
	movb	116(%rcx), %dl
	movb	%dl, 116(%rax)
	movb	117(%rcx), %dl
	movb	%dl, 117(%rax)
	movb	118(%rcx), %dl
	movb	%dl, 118(%rax)
	movb	119(%rcx), %dl
	movb	%dl, 119(%rax)
	movb	120(%rcx), %dl
	movb	%dl, 120(%rax)
	movb	121(%rcx), %dl
	movb	%dl, 121(%rax)
	movb	122(%rcx), %dl
	movb	%dl, 122(%rax)
	movb	123(%rcx), %dl
	movb	%dl, 123(%rax)
	movb	124(%rcx), %dl
	movb	%dl, 124(%rax)
	movb	125(%rcx), %dl
	movb	%dl, 125(%rax)
	movb	126(%rcx), %dl
	movb	%dl, 126(%rax)
	movb	127(%rcx), %dl
	movb	%dl, 127(%rax)
	movb	128(%rcx), %dl
	movb	%dl, 128(%rax)
	movb	129(%rcx), %dl
	movb	%dl, 129(%rax)
	movb	130(%rcx), %dl
	movb	%dl, 130(%rax)
	movb	131(%rcx), %dl
	movb	%dl, 131(%rax)
	movb	132(%rcx), %dl
	movb	%dl, 132(%rax)
	movb	133(%rcx), %dl
	movb	%dl, 133(%rax)
	movb	134(%rcx), %dl
	movb	%dl, 134(%rax)
	movb	135(%rcx), %dl
	movb	%dl, 135(%rax)
	movb	136(%rcx), %dl
	movb	%dl, 136(%rax)
	movb	137(%rcx), %dl
	movb	%dl, 137(%rax)
	movb	138(%rcx), %dl
	movb	%dl, 138(%rax)
	movb	139(%rcx), %dl
	movb	%dl, 139(%rax)
	movb	140(%rcx), %dl
	movb	%dl, 140(%rax)
	movb	141(%rcx), %dl
	movb	%dl, 141(%rax)
	movb	142(%rcx), %dl
	movb	%dl, 142(%rax)
	movb	143(%rcx), %dl
	movb	%dl, 143(%rax)
	movb	144(%rcx), %dl
	movb	%dl, 144(%rax)
	movb	145(%rcx), %dl
	movb	%dl, 145(%rax)
	movb	146(%rcx), %dl
	movb	%dl, 146(%rax)
	movb	147(%rcx), %dl
	movb	%dl, 147(%rax)
	movb	148(%rcx), %dl
	movb	%dl, 148(%rax)
	movb	149(%rcx), %dl
	movb	%dl, 149(%rax)
	movb	150(%rcx), %dl
	movb	%dl, 150(%rax)
	movb	151(%rcx), %dl
	movb	%dl, 151(%rax)
	movb	152(%rcx), %dl
	movb	%dl, 152(%rax)
	movb	153(%rcx), %dl
	movb	%dl, 153(%rax)
	movb	154(%rcx), %dl
	movb	%dl, 154(%rax)
	movb	155(%rcx), %dl
	movb	%dl, 155(%rax)
	movb	156(%rcx), %dl
	movb	%dl, 156(%rax)
	movb	157(%rcx), %dl
	movb	%dl, 157(%rax)
	movb	158(%rcx), %dl
	movb	%dl, 158(%rax)
	movb	159(%rcx), %dl
	movb	%dl, 159(%rax)
	movb	160(%rcx), %dl
	movb	%dl, 160(%rax)
	movb	161(%rcx), %dl
	movb	%dl, 161(%rax)
	movb	162(%rcx), %dl
	movb	%dl, 162(%rax)
	movb	163(%rcx), %dl
	movb	%dl, 163(%rax)
	movb	164(%rcx), %dl
	movb	%dl, 164(%rax)
	movb	165(%rcx), %dl
	movb	%dl, 165(%rax)
	movb	166(%rcx), %dl
	movb	%dl, 166(%rax)
	movb	167(%rcx), %cl
	movb	%cl, 167(%rax)
	ret
L_shake128_absorb34$1:
	movq	$0, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$0, 48(%rax)
	movq	$0, 56(%rax)
	movq	$0, 64(%rax)
	movq	$0, 72(%rax)
	movq	$0, 80(%rax)
	movq	$0, 88(%rax)
	movq	$0, 96(%rax)
	movq	$0, 104(%rax)
	movq	$0, 112(%rax)
	movq	$0, 120(%rax)
	movq	$0, 128(%rax)
	movq	$0, 136(%rax)
	movq	$0, 144(%rax)
	movq	$0, 152(%rax)
	movq	$0, 160(%rax)
	movq	$0, 168(%rax)
	movq	$0, 176(%rax)
	movq	$0, 184(%rax)
	movq	$0, 192(%rax)
	movb	(%rcx), %dl
	xorb	%dl, (%rax)
	movb	1(%rcx), %dl
	xorb	%dl, 1(%rax)
	movb	2(%rcx), %dl
	xorb	%dl, 2(%rax)
	movb	3(%rcx), %dl
	xorb	%dl, 3(%rax)
	movb	4(%rcx), %dl
	xorb	%dl, 4(%rax)
	movb	5(%rcx), %dl
	xorb	%dl, 5(%rax)
	movb	6(%rcx), %dl
	xorb	%dl, 6(%rax)
	movb	7(%rcx), %dl
	xorb	%dl, 7(%rax)
	movb	8(%rcx), %dl
	xorb	%dl, 8(%rax)
	movb	9(%rcx), %dl
	xorb	%dl, 9(%rax)
	movb	10(%rcx), %dl
	xorb	%dl, 10(%rax)
	movb	11(%rcx), %dl
	xorb	%dl, 11(%rax)
	movb	12(%rcx), %dl
	xorb	%dl, 12(%rax)
	movb	13(%rcx), %dl
	xorb	%dl, 13(%rax)
	movb	14(%rcx), %dl
	xorb	%dl, 14(%rax)
	movb	15(%rcx), %dl
	xorb	%dl, 15(%rax)
	movb	16(%rcx), %dl
	xorb	%dl, 16(%rax)
	movb	17(%rcx), %dl
	xorb	%dl, 17(%rax)
	movb	18(%rcx), %dl
	xorb	%dl, 18(%rax)
	movb	19(%rcx), %dl
	xorb	%dl, 19(%rax)
	movb	20(%rcx), %dl
	xorb	%dl, 20(%rax)
	movb	21(%rcx), %dl
	xorb	%dl, 21(%rax)
	movb	22(%rcx), %dl
	xorb	%dl, 22(%rax)
	movb	23(%rcx), %dl
	xorb	%dl, 23(%rax)
	movb	24(%rcx), %dl
	xorb	%dl, 24(%rax)
	movb	25(%rcx), %dl
	xorb	%dl, 25(%rax)
	movb	26(%rcx), %dl
	xorb	%dl, 26(%rax)
	movb	27(%rcx), %dl
	xorb	%dl, 27(%rax)
	movb	28(%rcx), %dl
	xorb	%dl, 28(%rax)
	movb	29(%rcx), %dl
	xorb	%dl, 29(%rax)
	movb	30(%rcx), %dl
	xorb	%dl, 30(%rax)
	movb	31(%rcx), %dl
	xorb	%dl, 31(%rax)
	movb	32(%rcx), %dl
	xorb	%dl, 32(%rax)
	movb	33(%rcx), %cl
	xorb	%cl, 33(%rax)
	xorb	$31, 34(%rax)
	xorb	$-128, 167(%rax)
	ret
L_sha3512_32$1:
	leaq	8(%rsp), %rdx
	movq	$0, (%rdx)
	movq	$0, 8(%rdx)
	movq	$0, 16(%rdx)
	movq	$0, 24(%rdx)
	movq	$0, 32(%rdx)
	movq	$0, 40(%rdx)
	movq	$0, 48(%rdx)
	movq	$0, 56(%rdx)
	movq	$0, 64(%rdx)
	movq	$0, 72(%rdx)
	movq	$0, 80(%rdx)
	movq	$0, 88(%rdx)
	movq	$0, 96(%rdx)
	movq	$0, 104(%rdx)
	movq	$0, 112(%rdx)
	movq	$0, 120(%rdx)
	movq	$0, 128(%rdx)
	movq	$0, 136(%rdx)
	movq	$0, 144(%rdx)
	movq	$0, 152(%rdx)
	movq	$0, 160(%rdx)
	movq	$0, 168(%rdx)
	movq	$0, 176(%rdx)
	movq	$0, 184(%rdx)
	movq	$0, 192(%rdx)
	movb	(%rcx), %dl
	xorb	%dl, 8(%rsp)
	movb	1(%rcx), %dl
	xorb	%dl, 9(%rsp)
	movb	2(%rcx), %dl
	xorb	%dl, 10(%rsp)
	movb	3(%rcx), %dl
	xorb	%dl, 11(%rsp)
	movb	4(%rcx), %dl
	xorb	%dl, 12(%rsp)
	movb	5(%rcx), %dl
	xorb	%dl, 13(%rsp)
	movb	6(%rcx), %dl
	xorb	%dl, 14(%rsp)
	movb	7(%rcx), %dl
	xorb	%dl, 15(%rsp)
	movb	8(%rcx), %dl
	xorb	%dl, 16(%rsp)
	movb	9(%rcx), %dl
	xorb	%dl, 17(%rsp)
	movb	10(%rcx), %dl
	xorb	%dl, 18(%rsp)
	movb	11(%rcx), %dl
	xorb	%dl, 19(%rsp)
	movb	12(%rcx), %dl
	xorb	%dl, 20(%rsp)
	movb	13(%rcx), %dl
	xorb	%dl, 21(%rsp)
	movb	14(%rcx), %dl
	xorb	%dl, 22(%rsp)
	movb	15(%rcx), %dl
	xorb	%dl, 23(%rsp)
	movb	16(%rcx), %dl
	xorb	%dl, 24(%rsp)
	movb	17(%rcx), %dl
	xorb	%dl, 25(%rsp)
	movb	18(%rcx), %dl
	xorb	%dl, 26(%rsp)
	movb	19(%rcx), %dl
	xorb	%dl, 27(%rsp)
	movb	20(%rcx), %dl
	xorb	%dl, 28(%rsp)
	movb	21(%rcx), %dl
	xorb	%dl, 29(%rsp)
	movb	22(%rcx), %dl
	xorb	%dl, 30(%rsp)
	movb	23(%rcx), %dl
	xorb	%dl, 31(%rsp)
	movb	24(%rcx), %dl
	xorb	%dl, 32(%rsp)
	movb	25(%rcx), %dl
	xorb	%dl, 33(%rsp)
	movb	26(%rcx), %dl
	xorb	%dl, 34(%rsp)
	movb	27(%rcx), %dl
	xorb	%dl, 35(%rsp)
	movb	28(%rcx), %dl
	xorb	%dl, 36(%rsp)
	movb	29(%rcx), %dl
	xorb	%dl, 37(%rsp)
	movb	30(%rcx), %dl
	xorb	%dl, 38(%rsp)
	movb	31(%rcx), %cl
	xorb	%cl, 39(%rsp)
	xorb	$6, 40(%rsp)
	xorb	$-128, 79(%rsp)
	leaq	8(%rsp), %rcx
	leaq	-200(%rsp), %rsp
	call	L__keccakf1600_ref$1
L_sha3512_32$2:
	leaq	200(%rsp), %rsp
	movb	8(%rsp), %cl
	movb	%cl, (%rax)
	movb	9(%rsp), %cl
	movb	%cl, 1(%rax)
	movb	10(%rsp), %cl
	movb	%cl, 2(%rax)
	movb	11(%rsp), %cl
	movb	%cl, 3(%rax)
	movb	12(%rsp), %cl
	movb	%cl, 4(%rax)
	movb	13(%rsp), %cl
	movb	%cl, 5(%rax)
	movb	14(%rsp), %cl
	movb	%cl, 6(%rax)
	movb	15(%rsp), %cl
	movb	%cl, 7(%rax)
	movb	16(%rsp), %cl
	movb	%cl, 8(%rax)
	movb	17(%rsp), %cl
	movb	%cl, 9(%rax)
	movb	18(%rsp), %cl
	movb	%cl, 10(%rax)
	movb	19(%rsp), %cl
	movb	%cl, 11(%rax)
	movb	20(%rsp), %cl
	movb	%cl, 12(%rax)
	movb	21(%rsp), %cl
	movb	%cl, 13(%rax)
	movb	22(%rsp), %cl
	movb	%cl, 14(%rax)
	movb	23(%rsp), %cl
	movb	%cl, 15(%rax)
	movb	24(%rsp), %cl
	movb	%cl, 16(%rax)
	movb	25(%rsp), %cl
	movb	%cl, 17(%rax)
	movb	26(%rsp), %cl
	movb	%cl, 18(%rax)
	movb	27(%rsp), %cl
	movb	%cl, 19(%rax)
	movb	28(%rsp), %cl
	movb	%cl, 20(%rax)
	movb	29(%rsp), %cl
	movb	%cl, 21(%rax)
	movb	30(%rsp), %cl
	movb	%cl, 22(%rax)
	movb	31(%rsp), %cl
	movb	%cl, 23(%rax)
	movb	32(%rsp), %cl
	movb	%cl, 24(%rax)
	movb	33(%rsp), %cl
	movb	%cl, 25(%rax)
	movb	34(%rsp), %cl
	movb	%cl, 26(%rax)
	movb	35(%rsp), %cl
	movb	%cl, 27(%rax)
	movb	36(%rsp), %cl
	movb	%cl, 28(%rax)
	movb	37(%rsp), %cl
	movb	%cl, 29(%rax)
	movb	38(%rsp), %cl
	movb	%cl, 30(%rax)
	movb	39(%rsp), %cl
	movb	%cl, 31(%rax)
	movb	40(%rsp), %cl
	movb	%cl, 32(%rax)
	movb	41(%rsp), %cl
	movb	%cl, 33(%rax)
	movb	42(%rsp), %cl
	movb	%cl, 34(%rax)
	movb	43(%rsp), %cl
	movb	%cl, 35(%rax)
	movb	44(%rsp), %cl
	movb	%cl, 36(%rax)
	movb	45(%rsp), %cl
	movb	%cl, 37(%rax)
	movb	46(%rsp), %cl
	movb	%cl, 38(%rax)
	movb	47(%rsp), %cl
	movb	%cl, 39(%rax)
	movb	48(%rsp), %cl
	movb	%cl, 40(%rax)
	movb	49(%rsp), %cl
	movb	%cl, 41(%rax)
	movb	50(%rsp), %cl
	movb	%cl, 42(%rax)
	movb	51(%rsp), %cl
	movb	%cl, 43(%rax)
	movb	52(%rsp), %cl
	movb	%cl, 44(%rax)
	movb	53(%rsp), %cl
	movb	%cl, 45(%rax)
	movb	54(%rsp), %cl
	movb	%cl, 46(%rax)
	movb	55(%rsp), %cl
	movb	%cl, 47(%rax)
	movb	56(%rsp), %cl
	movb	%cl, 48(%rax)
	movb	57(%rsp), %cl
	movb	%cl, 49(%rax)
	movb	58(%rsp), %cl
	movb	%cl, 50(%rax)
	movb	59(%rsp), %cl
	movb	%cl, 51(%rax)
	movb	60(%rsp), %cl
	movb	%cl, 52(%rax)
	movb	61(%rsp), %cl
	movb	%cl, 53(%rax)
	movb	62(%rsp), %cl
	movb	%cl, 54(%rax)
	movb	63(%rsp), %cl
	movb	%cl, 55(%rax)
	movb	64(%rsp), %cl
	movb	%cl, 56(%rax)
	movb	65(%rsp), %cl
	movb	%cl, 57(%rax)
	movb	66(%rsp), %cl
	movb	%cl, 58(%rax)
	movb	67(%rsp), %cl
	movb	%cl, 59(%rax)
	movb	68(%rsp), %cl
	movb	%cl, 60(%rax)
	movb	69(%rsp), %cl
	movb	%cl, 61(%rax)
	movb	70(%rsp), %cl
	movb	%cl, 62(%rax)
	movb	71(%rsp), %cl
	movb	%cl, 63(%rax)
	ret
L_shake256_128_33$1:
	movq	%rcx, 8(%rsp)
	leaq	16(%rsp), %rcx
	movq	$0, (%rcx)
	movq	$0, 8(%rcx)
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movq	$0, 32(%rcx)
	movq	$0, 40(%rcx)
	movq	$0, 48(%rcx)
	movq	$0, 56(%rcx)
	movq	$0, 64(%rcx)
	movq	$0, 72(%rcx)
	movq	$0, 80(%rcx)
	movq	$0, 88(%rcx)
	movq	$0, 96(%rcx)
	movq	$0, 104(%rcx)
	movq	$0, 112(%rcx)
	movq	$0, 120(%rcx)
	movq	$0, 128(%rcx)
	movq	$0, 136(%rcx)
	movq	$0, 144(%rcx)
	movq	$0, 152(%rcx)
	movq	$0, 160(%rcx)
	movq	$0, 168(%rcx)
	movq	$0, 176(%rcx)
	movq	$0, 184(%rcx)
	movq	$0, 192(%rcx)
	movb	(%rax), %cl
	xorb	%cl, 16(%rsp)
	movb	1(%rax), %cl
	xorb	%cl, 17(%rsp)
	movb	2(%rax), %cl
	xorb	%cl, 18(%rsp)
	movb	3(%rax), %cl
	xorb	%cl, 19(%rsp)
	movb	4(%rax), %cl
	xorb	%cl, 20(%rsp)
	movb	5(%rax), %cl
	xorb	%cl, 21(%rsp)
	movb	6(%rax), %cl
	xorb	%cl, 22(%rsp)
	movb	7(%rax), %cl
	xorb	%cl, 23(%rsp)
	movb	8(%rax), %cl
	xorb	%cl, 24(%rsp)
	movb	9(%rax), %cl
	xorb	%cl, 25(%rsp)
	movb	10(%rax), %cl
	xorb	%cl, 26(%rsp)
	movb	11(%rax), %cl
	xorb	%cl, 27(%rsp)
	movb	12(%rax), %cl
	xorb	%cl, 28(%rsp)
	movb	13(%rax), %cl
	xorb	%cl, 29(%rsp)
	movb	14(%rax), %cl
	xorb	%cl, 30(%rsp)
	movb	15(%rax), %cl
	xorb	%cl, 31(%rsp)
	movb	16(%rax), %cl
	xorb	%cl, 32(%rsp)
	movb	17(%rax), %cl
	xorb	%cl, 33(%rsp)
	movb	18(%rax), %cl
	xorb	%cl, 34(%rsp)
	movb	19(%rax), %cl
	xorb	%cl, 35(%rsp)
	movb	20(%rax), %cl
	xorb	%cl, 36(%rsp)
	movb	21(%rax), %cl
	xorb	%cl, 37(%rsp)
	movb	22(%rax), %cl
	xorb	%cl, 38(%rsp)
	movb	23(%rax), %cl
	xorb	%cl, 39(%rsp)
	movb	24(%rax), %cl
	xorb	%cl, 40(%rsp)
	movb	25(%rax), %cl
	xorb	%cl, 41(%rsp)
	movb	26(%rax), %cl
	xorb	%cl, 42(%rsp)
	movb	27(%rax), %cl
	xorb	%cl, 43(%rsp)
	movb	28(%rax), %cl
	xorb	%cl, 44(%rsp)
	movb	29(%rax), %cl
	xorb	%cl, 45(%rsp)
	movb	30(%rax), %cl
	xorb	%cl, 46(%rsp)
	movb	31(%rax), %cl
	xorb	%cl, 47(%rsp)
	movb	32(%rax), %al
	xorb	%al, 48(%rsp)
	xorb	$31, 49(%rsp)
	xorb	$-128, 151(%rsp)
	leaq	16(%rsp), %rcx
	leaq	-200(%rsp), %rsp
	call	L__keccakf1600_ref$1
L_shake256_128_33$2:
	leaq	200(%rsp), %rsp
	movq	8(%rsp), %rax
	movb	16(%rsp), %cl
	movb	%cl, (%rax)
	movb	17(%rsp), %cl
	movb	%cl, 1(%rax)
	movb	18(%rsp), %cl
	movb	%cl, 2(%rax)
	movb	19(%rsp), %cl
	movb	%cl, 3(%rax)
	movb	20(%rsp), %cl
	movb	%cl, 4(%rax)
	movb	21(%rsp), %cl
	movb	%cl, 5(%rax)
	movb	22(%rsp), %cl
	movb	%cl, 6(%rax)
	movb	23(%rsp), %cl
	movb	%cl, 7(%rax)
	movb	24(%rsp), %cl
	movb	%cl, 8(%rax)
	movb	25(%rsp), %cl
	movb	%cl, 9(%rax)
	movb	26(%rsp), %cl
	movb	%cl, 10(%rax)
	movb	27(%rsp), %cl
	movb	%cl, 11(%rax)
	movb	28(%rsp), %cl
	movb	%cl, 12(%rax)
	movb	29(%rsp), %cl
	movb	%cl, 13(%rax)
	movb	30(%rsp), %cl
	movb	%cl, 14(%rax)
	movb	31(%rsp), %cl
	movb	%cl, 15(%rax)
	movb	32(%rsp), %cl
	movb	%cl, 16(%rax)
	movb	33(%rsp), %cl
	movb	%cl, 17(%rax)
	movb	34(%rsp), %cl
	movb	%cl, 18(%rax)
	movb	35(%rsp), %cl
	movb	%cl, 19(%rax)
	movb	36(%rsp), %cl
	movb	%cl, 20(%rax)
	movb	37(%rsp), %cl
	movb	%cl, 21(%rax)
	movb	38(%rsp), %cl
	movb	%cl, 22(%rax)
	movb	39(%rsp), %cl
	movb	%cl, 23(%rax)
	movb	40(%rsp), %cl
	movb	%cl, 24(%rax)
	movb	41(%rsp), %cl
	movb	%cl, 25(%rax)
	movb	42(%rsp), %cl
	movb	%cl, 26(%rax)
	movb	43(%rsp), %cl
	movb	%cl, 27(%rax)
	movb	44(%rsp), %cl
	movb	%cl, 28(%rax)
	movb	45(%rsp), %cl
	movb	%cl, 29(%rax)
	movb	46(%rsp), %cl
	movb	%cl, 30(%rax)
	movb	47(%rsp), %cl
	movb	%cl, 31(%rax)
	movb	48(%rsp), %cl
	movb	%cl, 32(%rax)
	movb	49(%rsp), %cl
	movb	%cl, 33(%rax)
	movb	50(%rsp), %cl
	movb	%cl, 34(%rax)
	movb	51(%rsp), %cl
	movb	%cl, 35(%rax)
	movb	52(%rsp), %cl
	movb	%cl, 36(%rax)
	movb	53(%rsp), %cl
	movb	%cl, 37(%rax)
	movb	54(%rsp), %cl
	movb	%cl, 38(%rax)
	movb	55(%rsp), %cl
	movb	%cl, 39(%rax)
	movb	56(%rsp), %cl
	movb	%cl, 40(%rax)
	movb	57(%rsp), %cl
	movb	%cl, 41(%rax)
	movb	58(%rsp), %cl
	movb	%cl, 42(%rax)
	movb	59(%rsp), %cl
	movb	%cl, 43(%rax)
	movb	60(%rsp), %cl
	movb	%cl, 44(%rax)
	movb	61(%rsp), %cl
	movb	%cl, 45(%rax)
	movb	62(%rsp), %cl
	movb	%cl, 46(%rax)
	movb	63(%rsp), %cl
	movb	%cl, 47(%rax)
	movb	64(%rsp), %cl
	movb	%cl, 48(%rax)
	movb	65(%rsp), %cl
	movb	%cl, 49(%rax)
	movb	66(%rsp), %cl
	movb	%cl, 50(%rax)
	movb	67(%rsp), %cl
	movb	%cl, 51(%rax)
	movb	68(%rsp), %cl
	movb	%cl, 52(%rax)
	movb	69(%rsp), %cl
	movb	%cl, 53(%rax)
	movb	70(%rsp), %cl
	movb	%cl, 54(%rax)
	movb	71(%rsp), %cl
	movb	%cl, 55(%rax)
	movb	72(%rsp), %cl
	movb	%cl, 56(%rax)
	movb	73(%rsp), %cl
	movb	%cl, 57(%rax)
	movb	74(%rsp), %cl
	movb	%cl, 58(%rax)
	movb	75(%rsp), %cl
	movb	%cl, 59(%rax)
	movb	76(%rsp), %cl
	movb	%cl, 60(%rax)
	movb	77(%rsp), %cl
	movb	%cl, 61(%rax)
	movb	78(%rsp), %cl
	movb	%cl, 62(%rax)
	movb	79(%rsp), %cl
	movb	%cl, 63(%rax)
	movb	80(%rsp), %cl
	movb	%cl, 64(%rax)
	movb	81(%rsp), %cl
	movb	%cl, 65(%rax)
	movb	82(%rsp), %cl
	movb	%cl, 66(%rax)
	movb	83(%rsp), %cl
	movb	%cl, 67(%rax)
	movb	84(%rsp), %cl
	movb	%cl, 68(%rax)
	movb	85(%rsp), %cl
	movb	%cl, 69(%rax)
	movb	86(%rsp), %cl
	movb	%cl, 70(%rax)
	movb	87(%rsp), %cl
	movb	%cl, 71(%rax)
	movb	88(%rsp), %cl
	movb	%cl, 72(%rax)
	movb	89(%rsp), %cl
	movb	%cl, 73(%rax)
	movb	90(%rsp), %cl
	movb	%cl, 74(%rax)
	movb	91(%rsp), %cl
	movb	%cl, 75(%rax)
	movb	92(%rsp), %cl
	movb	%cl, 76(%rax)
	movb	93(%rsp), %cl
	movb	%cl, 77(%rax)
	movb	94(%rsp), %cl
	movb	%cl, 78(%rax)
	movb	95(%rsp), %cl
	movb	%cl, 79(%rax)
	movb	96(%rsp), %cl
	movb	%cl, 80(%rax)
	movb	97(%rsp), %cl
	movb	%cl, 81(%rax)
	movb	98(%rsp), %cl
	movb	%cl, 82(%rax)
	movb	99(%rsp), %cl
	movb	%cl, 83(%rax)
	movb	100(%rsp), %cl
	movb	%cl, 84(%rax)
	movb	101(%rsp), %cl
	movb	%cl, 85(%rax)
	movb	102(%rsp), %cl
	movb	%cl, 86(%rax)
	movb	103(%rsp), %cl
	movb	%cl, 87(%rax)
	movb	104(%rsp), %cl
	movb	%cl, 88(%rax)
	movb	105(%rsp), %cl
	movb	%cl, 89(%rax)
	movb	106(%rsp), %cl
	movb	%cl, 90(%rax)
	movb	107(%rsp), %cl
	movb	%cl, 91(%rax)
	movb	108(%rsp), %cl
	movb	%cl, 92(%rax)
	movb	109(%rsp), %cl
	movb	%cl, 93(%rax)
	movb	110(%rsp), %cl
	movb	%cl, 94(%rax)
	movb	111(%rsp), %cl
	movb	%cl, 95(%rax)
	movb	112(%rsp), %cl
	movb	%cl, 96(%rax)
	movb	113(%rsp), %cl
	movb	%cl, 97(%rax)
	movb	114(%rsp), %cl
	movb	%cl, 98(%rax)
	movb	115(%rsp), %cl
	movb	%cl, 99(%rax)
	movb	116(%rsp), %cl
	movb	%cl, 100(%rax)
	movb	117(%rsp), %cl
	movb	%cl, 101(%rax)
	movb	118(%rsp), %cl
	movb	%cl, 102(%rax)
	movb	119(%rsp), %cl
	movb	%cl, 103(%rax)
	movb	120(%rsp), %cl
	movb	%cl, 104(%rax)
	movb	121(%rsp), %cl
	movb	%cl, 105(%rax)
	movb	122(%rsp), %cl
	movb	%cl, 106(%rax)
	movb	123(%rsp), %cl
	movb	%cl, 107(%rax)
	movb	124(%rsp), %cl
	movb	%cl, 108(%rax)
	movb	125(%rsp), %cl
	movb	%cl, 109(%rax)
	movb	126(%rsp), %cl
	movb	%cl, 110(%rax)
	movb	127(%rsp), %cl
	movb	%cl, 111(%rax)
	movb	128(%rsp), %cl
	movb	%cl, 112(%rax)
	movb	129(%rsp), %cl
	movb	%cl, 113(%rax)
	movb	130(%rsp), %cl
	movb	%cl, 114(%rax)
	movb	131(%rsp), %cl
	movb	%cl, 115(%rax)
	movb	132(%rsp), %cl
	movb	%cl, 116(%rax)
	movb	133(%rsp), %cl
	movb	%cl, 117(%rax)
	movb	134(%rsp), %cl
	movb	%cl, 118(%rax)
	movb	135(%rsp), %cl
	movb	%cl, 119(%rax)
	movb	136(%rsp), %cl
	movb	%cl, 120(%rax)
	movb	137(%rsp), %cl
	movb	%cl, 121(%rax)
	movb	138(%rsp), %cl
	movb	%cl, 122(%rax)
	movb	139(%rsp), %cl
	movb	%cl, 123(%rax)
	movb	140(%rsp), %cl
	movb	%cl, 124(%rax)
	movb	141(%rsp), %cl
	movb	%cl, 125(%rax)
	movb	142(%rsp), %cl
	movb	%cl, 126(%rax)
	movb	143(%rsp), %cl
	movb	%cl, 127(%rax)
	ret
L__keccakf1600_ref$1:
	movq	$0, %rdx
	jmp 	L__keccakf1600_ref$2
L__keccakf1600_ref$3:
	movq	$0, %rsi
	xorq	(%rcx), %rsi
	xorq	40(%rcx), %rsi
	xorq	80(%rcx), %rsi
	xorq	120(%rcx), %rsi
	xorq	160(%rcx), %rsi
	movq	$0, %rdi
	xorq	8(%rcx), %rdi
	xorq	48(%rcx), %rdi
	xorq	88(%rcx), %rdi
	xorq	128(%rcx), %rdi
	xorq	168(%rcx), %rdi
	movq	$0, %r8
	xorq	16(%rcx), %r8
	xorq	56(%rcx), %r8
	xorq	96(%rcx), %r8
	xorq	136(%rcx), %r8
	xorq	176(%rcx), %r8
	movq	$0, %r9
	xorq	24(%rcx), %r9
	xorq	64(%rcx), %r9
	xorq	104(%rcx), %r9
	xorq	144(%rcx), %r9
	xorq	184(%rcx), %r9
	movq	$0, %r10
	xorq	32(%rcx), %r10
	xorq	72(%rcx), %r10
	xorq	112(%rcx), %r10
	xorq	152(%rcx), %r10
	xorq	192(%rcx), %r10
	movq	%rdi, %r11
	rolq	$1, %r11
	xorq	%r10, %r11
	movq	%r8, %rbx
	rolq	$1, %rbx
	xorq	%rsi, %rbx
	movq	%r9, %rbp
	rolq	$1, %rbp
	xorq	%rdi, %rbp
	rolq	$1, %r10
	xorq	%r8, %r10
	rolq	$1, %rsi
	xorq	%r9, %rsi
	xorq	%r11, (%rcx)
	xorq	%r11, 40(%rcx)
	xorq	%r11, 80(%rcx)
	xorq	%r11, 120(%rcx)
	xorq	%r11, 160(%rcx)
	xorq	%rbx, 8(%rcx)
	xorq	%rbx, 48(%rcx)
	xorq	%rbx, 88(%rcx)
	xorq	%rbx, 128(%rcx)
	xorq	%rbx, 168(%rcx)
	xorq	%rbp, 16(%rcx)
	xorq	%rbp, 56(%rcx)
	xorq	%rbp, 96(%rcx)
	xorq	%rbp, 136(%rcx)
	xorq	%rbp, 176(%rcx)
	xorq	%r10, 24(%rcx)
	xorq	%r10, 64(%rcx)
	xorq	%r10, 104(%rcx)
	xorq	%r10, 144(%rcx)
	xorq	%r10, 184(%rcx)
	xorq	%rsi, 32(%rcx)
	xorq	%rsi, 72(%rcx)
	xorq	%rsi, 112(%rcx)
	xorq	%rsi, 152(%rcx)
	xorq	%rsi, 192(%rcx)
	rolq	$0, (%rcx)
	rolq	$36, 40(%rcx)
	rolq	$3, 80(%rcx)
	rolq	$41, 120(%rcx)
	rolq	$18, 160(%rcx)
	rolq	$1, 8(%rcx)
	rolq	$44, 48(%rcx)
	rolq	$10, 88(%rcx)
	rolq	$45, 128(%rcx)
	rolq	$2, 168(%rcx)
	rolq	$62, 16(%rcx)
	rolq	$6, 56(%rcx)
	rolq	$43, 96(%rcx)
	rolq	$15, 136(%rcx)
	rolq	$61, 176(%rcx)
	rolq	$28, 24(%rcx)
	rolq	$55, 64(%rcx)
	rolq	$25, 104(%rcx)
	rolq	$21, 144(%rcx)
	rolq	$56, 184(%rcx)
	rolq	$27, 32(%rcx)
	rolq	$20, 72(%rcx)
	rolq	$39, 112(%rcx)
	rolq	$8, 152(%rcx)
	rolq	$14, 192(%rcx)
	movq	(%rcx), %rsi
	movq	%rsi, 8(%rsp)
	movq	8(%rcx), %rsi
	movq	%rsi, 16(%rsp)
	movq	16(%rcx), %rsi
	movq	%rsi, 24(%rsp)
	movq	24(%rcx), %rsi
	movq	%rsi, 32(%rsp)
	movq	32(%rcx), %rsi
	movq	%rsi, 40(%rsp)
	movq	40(%rcx), %rsi
	movq	%rsi, 48(%rsp)
	movq	48(%rcx), %rsi
	movq	%rsi, 56(%rsp)
	movq	56(%rcx), %rsi
	movq	%rsi, 64(%rsp)
	movq	64(%rcx), %rsi
	movq	%rsi, 72(%rsp)
	movq	72(%rcx), %rsi
	movq	%rsi, 80(%rsp)
	movq	80(%rcx), %rsi
	movq	%rsi, 88(%rsp)
	movq	88(%rcx), %rsi
	movq	%rsi, 96(%rsp)
	movq	96(%rcx), %rsi
	movq	%rsi, 104(%rsp)
	movq	104(%rcx), %rsi
	movq	%rsi, 112(%rsp)
	movq	112(%rcx), %rsi
	movq	%rsi, 120(%rsp)
	movq	120(%rcx), %rsi
	movq	%rsi, 128(%rsp)
	movq	128(%rcx), %rsi
	movq	%rsi, 136(%rsp)
	movq	136(%rcx), %rsi
	movq	%rsi, 144(%rsp)
	movq	144(%rcx), %rsi
	movq	%rsi, 152(%rsp)
	movq	152(%rcx), %rsi
	movq	%rsi, 160(%rsp)
	movq	160(%rcx), %rsi
	movq	%rsi, 168(%rsp)
	movq	168(%rcx), %rsi
	movq	%rsi, 176(%rsp)
	movq	176(%rcx), %rsi
	movq	%rsi, 184(%rsp)
	movq	184(%rcx), %rsi
	movq	%rsi, 192(%rsp)
	movq	192(%rcx), %rsi
	movq	%rsi, 200(%rsp)
	movq	8(%rsp), %rsi
	movq	%rsi, (%rcx)
	movq	48(%rsp), %rsi
	movq	%rsi, 128(%rcx)
	movq	88(%rsp), %rsi
	movq	%rsi, 56(%rcx)
	movq	128(%rsp), %rsi
	movq	%rsi, 184(%rcx)
	movq	168(%rsp), %rsi
	movq	%rsi, 112(%rcx)
	movq	16(%rsp), %rsi
	movq	%rsi, 80(%rcx)
	movq	56(%rsp), %rsi
	movq	%rsi, 8(%rcx)
	movq	96(%rsp), %rsi
	movq	%rsi, 136(%rcx)
	movq	136(%rsp), %rsi
	movq	%rsi, 64(%rcx)
	movq	176(%rsp), %rsi
	movq	%rsi, 192(%rcx)
	movq	24(%rsp), %rsi
	movq	%rsi, 160(%rcx)
	movq	64(%rsp), %rsi
	movq	%rsi, 88(%rcx)
	movq	104(%rsp), %rsi
	movq	%rsi, 16(%rcx)
	movq	144(%rsp), %rsi
	movq	%rsi, 144(%rcx)
	movq	184(%rsp), %rsi
	movq	%rsi, 72(%rcx)
	movq	32(%rsp), %rsi
	movq	%rsi, 40(%rcx)
	movq	72(%rsp), %rsi
	movq	%rsi, 168(%rcx)
	movq	112(%rsp), %rsi
	movq	%rsi, 96(%rcx)
	movq	152(%rsp), %rsi
	movq	%rsi, 24(%rcx)
	movq	192(%rsp), %rsi
	movq	%rsi, 152(%rcx)
	movq	40(%rsp), %rsi
	movq	%rsi, 120(%rcx)
	movq	80(%rsp), %rsi
	movq	%rsi, 48(%rcx)
	movq	120(%rsp), %rsi
	movq	%rsi, 176(%rcx)
	movq	160(%rsp), %rsi
	movq	%rsi, 104(%rcx)
	movq	200(%rsp), %rsi
	movq	%rsi, 32(%rcx)
	movq	8(%rcx), %rsi
	notq	%rsi
	andq	16(%rcx), %rsi
	xorq	(%rcx), %rsi
	movq	16(%rcx), %rdi
	notq	%rdi
	andq	24(%rcx), %rdi
	xorq	8(%rcx), %rdi
	movq	24(%rcx), %r8
	notq	%r8
	andq	32(%rcx), %r8
	xorq	16(%rcx), %r8
	movq	32(%rcx), %r9
	notq	%r9
	andq	(%rcx), %r9
	xorq	24(%rcx), %r9
	movq	(%rcx), %r10
	notq	%r10
	andq	8(%rcx), %r10
	xorq	32(%rcx), %r10
	movq	%rsi, (%rcx)
	movq	%rdi, 8(%rcx)
	movq	%r8, 16(%rcx)
	movq	%r9, 24(%rcx)
	movq	%r10, 32(%rcx)
	movq	48(%rcx), %rsi
	notq	%rsi
	andq	56(%rcx), %rsi
	xorq	40(%rcx), %rsi
	movq	56(%rcx), %rdi
	notq	%rdi
	andq	64(%rcx), %rdi
	xorq	48(%rcx), %rdi
	movq	64(%rcx), %r8
	notq	%r8
	andq	72(%rcx), %r8
	xorq	56(%rcx), %r8
	movq	72(%rcx), %r9
	notq	%r9
	andq	40(%rcx), %r9
	xorq	64(%rcx), %r9
	movq	40(%rcx), %r10
	notq	%r10
	andq	48(%rcx), %r10
	xorq	72(%rcx), %r10
	movq	%rsi, 40(%rcx)
	movq	%rdi, 48(%rcx)
	movq	%r8, 56(%rcx)
	movq	%r9, 64(%rcx)
	movq	%r10, 72(%rcx)
	movq	88(%rcx), %rsi
	notq	%rsi
	andq	96(%rcx), %rsi
	xorq	80(%rcx), %rsi
	movq	96(%rcx), %rdi
	notq	%rdi
	andq	104(%rcx), %rdi
	xorq	88(%rcx), %rdi
	movq	104(%rcx), %r8
	notq	%r8
	andq	112(%rcx), %r8
	xorq	96(%rcx), %r8
	movq	112(%rcx), %r9
	notq	%r9
	andq	80(%rcx), %r9
	xorq	104(%rcx), %r9
	movq	80(%rcx), %r10
	notq	%r10
	andq	88(%rcx), %r10
	xorq	112(%rcx), %r10
	movq	%rsi, 80(%rcx)
	movq	%rdi, 88(%rcx)
	movq	%r8, 96(%rcx)
	movq	%r9, 104(%rcx)
	movq	%r10, 112(%rcx)
	movq	128(%rcx), %rsi
	notq	%rsi
	andq	136(%rcx), %rsi
	xorq	120(%rcx), %rsi
	movq	136(%rcx), %rdi
	notq	%rdi
	andq	144(%rcx), %rdi
	xorq	128(%rcx), %rdi
	movq	144(%rcx), %r8
	notq	%r8
	andq	152(%rcx), %r8
	xorq	136(%rcx), %r8
	movq	152(%rcx), %r9
	notq	%r9
	andq	120(%rcx), %r9
	xorq	144(%rcx), %r9
	movq	120(%rcx), %r10
	notq	%r10
	andq	128(%rcx), %r10
	xorq	152(%rcx), %r10
	movq	%rsi, 120(%rcx)
	movq	%rdi, 128(%rcx)
	movq	%r8, 136(%rcx)
	movq	%r9, 144(%rcx)
	movq	%r10, 152(%rcx)
	movq	168(%rcx), %rsi
	notq	%rsi
	andq	176(%rcx), %rsi
	xorq	160(%rcx), %rsi
	movq	176(%rcx), %rdi
	notq	%rdi
	andq	184(%rcx), %rdi
	xorq	168(%rcx), %rdi
	movq	184(%rcx), %r8
	notq	%r8
	andq	192(%rcx), %r8
	xorq	176(%rcx), %r8
	movq	192(%rcx), %r9
	notq	%r9
	andq	160(%rcx), %r9
	xorq	184(%rcx), %r9
	movq	160(%rcx), %r10
	notq	%r10
	andq	168(%rcx), %r10
	xorq	192(%rcx), %r10
	movq	%rsi, 160(%rcx)
	movq	%rdi, 168(%rcx)
	movq	%r8, 176(%rcx)
	movq	%r9, 184(%rcx)
	movq	%r10, 192(%rcx)
	leaq	glob_data + 0(%rip), %rsi
	movq	(%rsi,%rdx), %rsi
	xorq	%rsi, (%rcx)
	leaq	8(%rdx), %rdx
L__keccakf1600_ref$2:
	cmpq	$192, %rdx
	jb  	L__keccakf1600_ref$3
	ret
	.data
	.p2align	5
_glob_data:
glob_data:
      .byte 1
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte -126
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte -118
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte -128
      .byte 0
      .byte -128
      .byte 0
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte -128
      .byte -117
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 1
      .byte 0
      .byte 0
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte -127
      .byte -128
      .byte 0
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte -128
      .byte 9
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte -128
      .byte -118
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte -120
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 9
      .byte -128
      .byte 0
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 10
      .byte 0
      .byte 0
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte -117
      .byte -128
      .byte 0
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte -117
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte -128
      .byte -119
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte -128
      .byte 3
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte -128
      .byte 2
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte -128
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte -128
      .byte 10
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 10
      .byte 0
      .byte 0
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte -128
      .byte -127
      .byte -128
      .byte 0
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte -128
      .byte -128
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte -128
      .byte 1
      .byte 0
      .byte 0
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte 0
      .byte 8
      .byte -128
      .byte 0
      .byte -128
      .byte 0
      .byte 0
      .byte 0
      .byte -128
