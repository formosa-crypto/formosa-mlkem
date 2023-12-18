	.att_syntax
	.text
	.p2align	5
	.globl	_indcpa_dec_jazz
	.globl	indcpa_dec_jazz
	.globl	_indcpa_enc_jazz
	.globl	indcpa_enc_jazz
	.globl	_indcpa_keypair_jazz
	.globl	indcpa_keypair_jazz
_indcpa_dec_jazz:
indcpa_dec_jazz:
	movq	%rsp, %rax
	leaq	-4648(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rax, 4640(%rsp)
	movq	%r13, 4608(%rsp)
	movq	%r12, 4616(%rsp)
	movq	%rbp, 4624(%rsp)
	movq	%rbx, 4632(%rsp)
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_dec_jazz$20
Lindcpa_dec_jazz$21:
	movzbl	(%rsi,%rcx), %r8d
	leaq	1(%rcx), %rcx
	movzbl	(%rsi,%rcx), %r9d
	leaq	1(%rcx), %rcx
	movzbl	(%rsi,%rcx), %r10d
	leaq	1(%rcx), %rcx
	movzbl	(%rsi,%rcx), %r11d
	leaq	1(%rcx), %rcx
	movzbl	(%rsi,%rcx), %ebx
	leaq	1(%rcx), %rcx
	movl	%r9d, %ebp
	shrl	$2, %r9d
	andl	$3, %ebp
	shll	$8, %ebp
	orl 	%ebp, %r8d
	movl	%r10d, %ebp
	shrl	$4, %r10d
	andl	$15, %ebp
	shll	$6, %ebp
	orl 	%ebp, %r9d
	movl	%r11d, %ebp
	shrl	$6, %r11d
	andl	$63, %ebp
	shll	$4, %ebp
	orl 	%ebp, %r10d
	shll	$2, %ebx
	orl 	%ebx, %r11d
	imull	$3329, %r8d, %r8d
	leal	512(%r8), %r8d
	shrl	$10, %r8d
	movw	%r8w, 1536(%rsp,%rax,2)
	leaq	1(%rax), %rax
	imull	$3329, %r9d, %r8d
	leal	512(%r8), %r8d
	shrl	$10, %r8d
	movw	%r8w, 1536(%rsp,%rax,2)
	leaq	1(%rax), %rax
	imull	$3329, %r10d, %r8d
	leal	512(%r8), %r8d
	shrl	$10, %r8d
	movw	%r8w, 1536(%rsp,%rax,2)
	leaq	1(%rax), %rax
	imull	$3329, %r11d, %r8d
	leal	512(%r8), %r8d
	shrl	$10, %r8d
	movw	%r8w, 1536(%rsp,%rax,2)
	leaq	1(%rax), %rax
Lindcpa_dec_jazz$20:
	cmpq	$768, %rax
	jb  	Lindcpa_dec_jazz$21
	leaq	960(%rsi), %rax
	movq	%rsp, %rcx
	call	L_poly_decompress$1
Lindcpa_dec_jazz$19:
	movq	%rdx, %rax
	leaq	3072(%rsp), %rcx
	call	L_poly_frombytes$1
Lindcpa_dec_jazz$18:
	leaq	384(%rax), %rax
	leaq	3584(%rsp), %rcx
	call	L_poly_frombytes$1
Lindcpa_dec_jazz$17:
	leaq	384(%rax), %rax
	leaq	4096(%rsp), %rcx
	call	L_poly_frombytes$1
Lindcpa_dec_jazz$16:
	leaq	1536(%rsp), %rax
	call	L_poly_ntt$1
Lindcpa_dec_jazz$15:
	leaq	2048(%rsp), %rax
	call	L_poly_ntt$1
Lindcpa_dec_jazz$14:
	leaq	2560(%rsp), %rax
	call	L_poly_ntt$1
Lindcpa_dec_jazz$13:
	leaq	512(%rsp), %rdx
	leaq	3072(%rsp), %rax
	leaq	1536(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_dec_jazz$12:
	leaq	16(%rsp), %rsp
	leaq	1024(%rsp), %rdx
	leaq	3584(%rsp), %rax
	leaq	2048(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_dec_jazz$11:
	leaq	16(%rsp), %rsp
	leaq	512(%rsp), %rax
	leaq	1024(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_dec_jazz$10:
	leaq	1024(%rsp), %rdx
	leaq	4096(%rsp), %rax
	leaq	2560(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_dec_jazz$9:
	leaq	16(%rsp), %rsp
	leaq	512(%rsp), %rax
	leaq	1024(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_dec_jazz$8:
	leaq	512(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_dec_jazz$6
Lindcpa_dec_jazz$7:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_dec_jazz$6:
	cmpq	$256, %rcx
	jb  	Lindcpa_dec_jazz$7
	leaq	512(%rsp), %rax
	call	L_poly_invntt$1
Lindcpa_dec_jazz$5:
	leaq	1024(%rsp), %rax
	movq	%rsp, %rcx
	leaq	512(%rsp), %rdx
	call	L_poly_sub$1
Lindcpa_dec_jazz$4:
	leaq	1024(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_dec_jazz$2
Lindcpa_dec_jazz$3:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_dec_jazz$2:
	cmpq	$256, %rcx
	jb  	Lindcpa_dec_jazz$3
	leaq	1024(%rsp), %rax
	call	L_poly_tomsg$1
Lindcpa_dec_jazz$1:
	movq	4608(%rsp), %r13
	movq	4616(%rsp), %r12
	movq	4624(%rsp), %rbp
	movq	4632(%rsp), %rbx
	movq	4640(%rsp), %rsp
	ret
_indcpa_enc_jazz:
indcpa_enc_jazz:
	movq	%rsp, %rax
	leaq	-13336(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rax, 13328(%rsp)
	movq	%r13, 13296(%rsp)
	movq	%r12, 13304(%rsp)
	movq	%rbp, 13312(%rsp)
	movq	%rbx, 13320(%rsp)
	movq	%rdi, (%rsp)
	movq	$0, %rax
	jmp 	Lindcpa_enc_jazz$185
Lindcpa_enc_jazz$186:
	movb	(%rcx,%rax), %dil
	movb	%dil, 13024(%rsp,%rax)
	leaq	1(%rax), %rax
Lindcpa_enc_jazz$185:
	cmpq	$32, %rax
	jb  	Lindcpa_enc_jazz$186
	movq	%rdx, %rax
	leaq	2272(%rsp), %rcx
	call	L_poly_frombytes$1
Lindcpa_enc_jazz$184:
	leaq	384(%rax), %rax
	leaq	2784(%rsp), %rcx
	call	L_poly_frombytes$1
Lindcpa_enc_jazz$183:
	leaq	384(%rax), %rax
	leaq	3296(%rsp), %rcx
	call	L_poly_frombytes$1
Lindcpa_enc_jazz$182:
	movq	$0, %rax
	leaq	1152(%rdx), %rcx
	jmp 	Lindcpa_enc_jazz$180
Lindcpa_enc_jazz$181:
	movb	(%rcx), %dl
	movb	%dl, 13056(%rsp,%rax)
	leaq	1(%rcx), %rcx
	leaq	1(%rax), %rax
Lindcpa_enc_jazz$180:
	cmpq	$32, %rax
	jb  	Lindcpa_enc_jazz$181
	leaq	224(%rsp), %rax
	call	L_poly_frommsg$1
Lindcpa_enc_jazz$179:
	movq	$1, %rax
	movq	%rax, 8(%rsp)
	movb	13056(%rsp), %al
	movb	%al, 13088(%rsp)
	movb	13057(%rsp), %al
	movb	%al, 13089(%rsp)
	movb	13058(%rsp), %al
	movb	%al, 13090(%rsp)
	movb	13059(%rsp), %al
	movb	%al, 13091(%rsp)
	movb	13060(%rsp), %al
	movb	%al, 13092(%rsp)
	movb	13061(%rsp), %al
	movb	%al, 13093(%rsp)
	movb	13062(%rsp), %al
	movb	%al, 13094(%rsp)
	movb	13063(%rsp), %al
	movb	%al, 13095(%rsp)
	movb	13064(%rsp), %al
	movb	%al, 13096(%rsp)
	movb	13065(%rsp), %al
	movb	%al, 13097(%rsp)
	movb	13066(%rsp), %al
	movb	%al, 13098(%rsp)
	movb	13067(%rsp), %al
	movb	%al, 13099(%rsp)
	movb	13068(%rsp), %al
	movb	%al, 13100(%rsp)
	movb	13069(%rsp), %al
	movb	%al, 13101(%rsp)
	movb	13070(%rsp), %al
	movb	%al, 13102(%rsp)
	movb	13071(%rsp), %al
	movb	%al, 13103(%rsp)
	movb	13072(%rsp), %al
	movb	%al, 13104(%rsp)
	movb	13073(%rsp), %al
	movb	%al, 13105(%rsp)
	movb	13074(%rsp), %al
	movb	%al, 13106(%rsp)
	movb	13075(%rsp), %al
	movb	%al, 13107(%rsp)
	movb	13076(%rsp), %al
	movb	%al, 13108(%rsp)
	movb	13077(%rsp), %al
	movb	%al, 13109(%rsp)
	movb	13078(%rsp), %al
	movb	%al, 13110(%rsp)
	movb	13079(%rsp), %al
	movb	%al, 13111(%rsp)
	movb	13080(%rsp), %al
	movb	%al, 13112(%rsp)
	movb	13081(%rsp), %al
	movb	%al, 13113(%rsp)
	movb	13082(%rsp), %al
	movb	%al, 13114(%rsp)
	movb	13083(%rsp), %al
	movb	%al, 13115(%rsp)
	movb	13084(%rsp), %al
	movb	%al, 13116(%rsp)
	movb	13085(%rsp), %al
	movb	%al, 13117(%rsp)
	movb	13086(%rsp), %al
	movb	%al, 13118(%rsp)
	movb	13087(%rsp), %al
	movb	%al, 13119(%rsp)
	movq	8(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_enc_jazz$177
	movb	$0, 13120(%rsp)
	movb	$0, 13121(%rsp)
	jmp 	Lindcpa_enc_jazz$178
Lindcpa_enc_jazz$177:
	movb	$0, 13120(%rsp)
	movb	$0, 13121(%rsp)
Lindcpa_enc_jazz$178:
	leaq	24(%rsp), %rax
	leaq	13088(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_enc_jazz$176:
	movq	$0, %rdi
	jmp 	Lindcpa_enc_jazz$168
Lindcpa_enc_jazz$169:
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %rcx
	leaq	13122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_enc_jazz$175:
	movq	16(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$170
Lindcpa_enc_jazz$171:
	movzbw	13122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_enc_jazz$174
	movw	%cx, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$174:
	cmpw	$3329, %si
	jnb 	Lindcpa_enc_jazz$172
	cmpq	$256, %rdi
	jnb 	Lindcpa_enc_jazz$172
	movw	%si, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$173:
Lindcpa_enc_jazz$172:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_enc_jazz$170:
	cmpq	$0, %rcx
	je  	Lindcpa_enc_jazz$171
Lindcpa_enc_jazz$168:
	cmpq	$256, %rdi
	jb  	Lindcpa_enc_jazz$169
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$166
Lindcpa_enc_jazz$167:
	movw	736(%rsp,%rax,2), %dx
	movw	%dx, 8416(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$166:
	cmpq	$256, %rax
	jb  	Lindcpa_enc_jazz$167
	movq	8(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_enc_jazz$164
	movb	$0, 13120(%rsp)
	movb	$1, 13121(%rsp)
	jmp 	Lindcpa_enc_jazz$165
Lindcpa_enc_jazz$164:
	movb	$1, 13120(%rsp)
	movb	$0, 13121(%rsp)
Lindcpa_enc_jazz$165:
	leaq	24(%rsp), %rax
	leaq	13088(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_enc_jazz$163:
	movq	$0, %rdi
	jmp 	Lindcpa_enc_jazz$155
Lindcpa_enc_jazz$156:
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %rcx
	leaq	13122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_enc_jazz$162:
	movq	16(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$157
Lindcpa_enc_jazz$158:
	movzbw	13122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_enc_jazz$161
	movw	%cx, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$161:
	cmpw	$3329, %si
	jnb 	Lindcpa_enc_jazz$159
	cmpq	$256, %rdi
	jnb 	Lindcpa_enc_jazz$159
	movw	%si, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$160:
Lindcpa_enc_jazz$159:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_enc_jazz$157:
	cmpq	$0, %rcx
	je  	Lindcpa_enc_jazz$158
Lindcpa_enc_jazz$155:
	cmpq	$256, %rdi
	jb  	Lindcpa_enc_jazz$156
	movq	$0, %rax
	movq	$256, %rcx
	jmp 	Lindcpa_enc_jazz$153
Lindcpa_enc_jazz$154:
	movw	736(%rsp,%rax,2), %dx
	movw	%dx, 8416(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$153:
	cmpq	$256, %rax
	jb  	Lindcpa_enc_jazz$154
	movq	8(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_enc_jazz$151
	movb	$0, 13120(%rsp)
	movb	$2, 13121(%rsp)
	jmp 	Lindcpa_enc_jazz$152
Lindcpa_enc_jazz$151:
	movb	$2, 13120(%rsp)
	movb	$0, 13121(%rsp)
Lindcpa_enc_jazz$152:
	leaq	24(%rsp), %rax
	leaq	13088(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_enc_jazz$150:
	movq	$0, %rdi
	jmp 	Lindcpa_enc_jazz$142
Lindcpa_enc_jazz$143:
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %rcx
	leaq	13122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_enc_jazz$149:
	movq	16(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$144
Lindcpa_enc_jazz$145:
	movzbw	13122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_enc_jazz$148
	movw	%cx, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$148:
	cmpw	$3329, %si
	jnb 	Lindcpa_enc_jazz$146
	cmpq	$256, %rdi
	jnb 	Lindcpa_enc_jazz$146
	movw	%si, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$147:
Lindcpa_enc_jazz$146:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_enc_jazz$144:
	cmpq	$0, %rcx
	je  	Lindcpa_enc_jazz$145
Lindcpa_enc_jazz$142:
	cmpq	$256, %rdi
	jb  	Lindcpa_enc_jazz$143
	movq	$0, %rax
	movq	$512, %rcx
	jmp 	Lindcpa_enc_jazz$140
Lindcpa_enc_jazz$141:
	movw	736(%rsp,%rax,2), %dx
	movw	%dx, 8416(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$140:
	cmpq	$256, %rax
	jb  	Lindcpa_enc_jazz$141
	movq	8(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_enc_jazz$138
	movb	$1, 13120(%rsp)
	movb	$0, 13121(%rsp)
	jmp 	Lindcpa_enc_jazz$139
Lindcpa_enc_jazz$138:
	movb	$0, 13120(%rsp)
	movb	$1, 13121(%rsp)
Lindcpa_enc_jazz$139:
	leaq	24(%rsp), %rax
	leaq	13088(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_enc_jazz$137:
	movq	$0, %rdi
	jmp 	Lindcpa_enc_jazz$129
Lindcpa_enc_jazz$130:
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %rcx
	leaq	13122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_enc_jazz$136:
	movq	16(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$131
Lindcpa_enc_jazz$132:
	movzbw	13122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_enc_jazz$135
	movw	%cx, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$135:
	cmpw	$3329, %si
	jnb 	Lindcpa_enc_jazz$133
	cmpq	$256, %rdi
	jnb 	Lindcpa_enc_jazz$133
	movw	%si, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$134:
Lindcpa_enc_jazz$133:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_enc_jazz$131:
	cmpq	$0, %rcx
	je  	Lindcpa_enc_jazz$132
Lindcpa_enc_jazz$129:
	cmpq	$256, %rdi
	jb  	Lindcpa_enc_jazz$130
	movq	$0, %rax
	movq	$768, %rcx
	jmp 	Lindcpa_enc_jazz$127
Lindcpa_enc_jazz$128:
	movw	736(%rsp,%rax,2), %dx
	movw	%dx, 8416(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$127:
	cmpq	$256, %rax
	jb  	Lindcpa_enc_jazz$128
	movq	8(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_enc_jazz$125
	movb	$1, 13120(%rsp)
	movb	$1, 13121(%rsp)
	jmp 	Lindcpa_enc_jazz$126
Lindcpa_enc_jazz$125:
	movb	$1, 13120(%rsp)
	movb	$1, 13121(%rsp)
Lindcpa_enc_jazz$126:
	leaq	24(%rsp), %rax
	leaq	13088(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_enc_jazz$124:
	movq	$0, %rdi
	jmp 	Lindcpa_enc_jazz$116
Lindcpa_enc_jazz$117:
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %rcx
	leaq	13122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_enc_jazz$123:
	movq	16(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$118
Lindcpa_enc_jazz$119:
	movzbw	13122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_enc_jazz$122
	movw	%cx, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$122:
	cmpw	$3329, %si
	jnb 	Lindcpa_enc_jazz$120
	cmpq	$256, %rdi
	jnb 	Lindcpa_enc_jazz$120
	movw	%si, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$121:
Lindcpa_enc_jazz$120:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_enc_jazz$118:
	cmpq	$0, %rcx
	je  	Lindcpa_enc_jazz$119
Lindcpa_enc_jazz$116:
	cmpq	$256, %rdi
	jb  	Lindcpa_enc_jazz$117
	movq	$0, %rax
	movq	$1024, %rcx
	jmp 	Lindcpa_enc_jazz$114
Lindcpa_enc_jazz$115:
	movw	736(%rsp,%rax,2), %dx
	movw	%dx, 8416(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$114:
	cmpq	$256, %rax
	jb  	Lindcpa_enc_jazz$115
	movq	8(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_enc_jazz$112
	movb	$1, 13120(%rsp)
	movb	$2, 13121(%rsp)
	jmp 	Lindcpa_enc_jazz$113
Lindcpa_enc_jazz$112:
	movb	$2, 13120(%rsp)
	movb	$1, 13121(%rsp)
Lindcpa_enc_jazz$113:
	leaq	24(%rsp), %rax
	leaq	13088(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_enc_jazz$111:
	movq	$0, %rdi
	jmp 	Lindcpa_enc_jazz$103
Lindcpa_enc_jazz$104:
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %rcx
	leaq	13122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_enc_jazz$110:
	movq	16(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$105
Lindcpa_enc_jazz$106:
	movzbw	13122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_enc_jazz$109
	movw	%cx, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$109:
	cmpw	$3329, %si
	jnb 	Lindcpa_enc_jazz$107
	cmpq	$256, %rdi
	jnb 	Lindcpa_enc_jazz$107
	movw	%si, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$108:
Lindcpa_enc_jazz$107:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_enc_jazz$105:
	cmpq	$0, %rcx
	je  	Lindcpa_enc_jazz$106
Lindcpa_enc_jazz$103:
	cmpq	$256, %rdi
	jb  	Lindcpa_enc_jazz$104
	movq	$0, %rax
	movq	$1280, %rcx
	jmp 	Lindcpa_enc_jazz$101
Lindcpa_enc_jazz$102:
	movw	736(%rsp,%rax,2), %dx
	movw	%dx, 8416(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$101:
	cmpq	$256, %rax
	jb  	Lindcpa_enc_jazz$102
	movq	8(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_enc_jazz$99
	movb	$2, 13120(%rsp)
	movb	$0, 13121(%rsp)
	jmp 	Lindcpa_enc_jazz$100
Lindcpa_enc_jazz$99:
	movb	$0, 13120(%rsp)
	movb	$2, 13121(%rsp)
Lindcpa_enc_jazz$100:
	leaq	24(%rsp), %rax
	leaq	13088(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_enc_jazz$98:
	movq	$0, %rdi
	jmp 	Lindcpa_enc_jazz$90
Lindcpa_enc_jazz$91:
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %rcx
	leaq	13122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_enc_jazz$97:
	movq	16(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$92
Lindcpa_enc_jazz$93:
	movzbw	13122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_enc_jazz$96
	movw	%cx, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$96:
	cmpw	$3329, %si
	jnb 	Lindcpa_enc_jazz$94
	cmpq	$256, %rdi
	jnb 	Lindcpa_enc_jazz$94
	movw	%si, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$95:
Lindcpa_enc_jazz$94:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_enc_jazz$92:
	cmpq	$0, %rcx
	je  	Lindcpa_enc_jazz$93
Lindcpa_enc_jazz$90:
	cmpq	$256, %rdi
	jb  	Lindcpa_enc_jazz$91
	movq	$0, %rax
	movq	$1536, %rcx
	jmp 	Lindcpa_enc_jazz$88
Lindcpa_enc_jazz$89:
	movw	736(%rsp,%rax,2), %dx
	movw	%dx, 8416(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$88:
	cmpq	$256, %rax
	jb  	Lindcpa_enc_jazz$89
	movq	8(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_enc_jazz$86
	movb	$2, 13120(%rsp)
	movb	$1, 13121(%rsp)
	jmp 	Lindcpa_enc_jazz$87
Lindcpa_enc_jazz$86:
	movb	$1, 13120(%rsp)
	movb	$2, 13121(%rsp)
Lindcpa_enc_jazz$87:
	leaq	24(%rsp), %rax
	leaq	13088(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_enc_jazz$85:
	movq	$0, %rdi
	jmp 	Lindcpa_enc_jazz$77
Lindcpa_enc_jazz$78:
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %rcx
	leaq	13122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_enc_jazz$84:
	movq	16(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$79
Lindcpa_enc_jazz$80:
	movzbw	13122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_enc_jazz$83
	movw	%cx, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$83:
	cmpw	$3329, %si
	jnb 	Lindcpa_enc_jazz$81
	cmpq	$256, %rdi
	jnb 	Lindcpa_enc_jazz$81
	movw	%si, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$82:
Lindcpa_enc_jazz$81:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_enc_jazz$79:
	cmpq	$0, %rcx
	je  	Lindcpa_enc_jazz$80
Lindcpa_enc_jazz$77:
	cmpq	$256, %rdi
	jb  	Lindcpa_enc_jazz$78
	movq	$0, %rax
	movq	$1792, %rcx
	jmp 	Lindcpa_enc_jazz$75
Lindcpa_enc_jazz$76:
	movw	736(%rsp,%rax,2), %dx
	movw	%dx, 8416(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$75:
	cmpq	$256, %rax
	jb  	Lindcpa_enc_jazz$76
	movq	8(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_enc_jazz$73
	movb	$2, 13120(%rsp)
	movb	$2, 13121(%rsp)
	jmp 	Lindcpa_enc_jazz$74
Lindcpa_enc_jazz$73:
	movb	$2, 13120(%rsp)
	movb	$2, 13121(%rsp)
Lindcpa_enc_jazz$74:
	leaq	24(%rsp), %rax
	leaq	13088(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_enc_jazz$72:
	movq	$0, %rdi
	jmp 	Lindcpa_enc_jazz$64
Lindcpa_enc_jazz$65:
	movq	%rdi, 8(%rsp)
	leaq	24(%rsp), %rcx
	leaq	13122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_enc_jazz$71:
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$66
Lindcpa_enc_jazz$67:
	movzbw	13122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	13122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_enc_jazz$70
	movw	%cx, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$70:
	cmpw	$3329, %si
	jnb 	Lindcpa_enc_jazz$68
	cmpq	$256, %rdi
	jnb 	Lindcpa_enc_jazz$68
	movw	%si, 736(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_enc_jazz$69:
Lindcpa_enc_jazz$68:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_enc_jazz$66:
	cmpq	$0, %rcx
	je  	Lindcpa_enc_jazz$67
Lindcpa_enc_jazz$64:
	cmpq	$256, %rdi
	jb  	Lindcpa_enc_jazz$65
	movq	$0, %rax
	movq	$2048, %rcx
	jmp 	Lindcpa_enc_jazz$62
Lindcpa_enc_jazz$63:
	movw	736(%rsp,%rax,2), %dx
	movw	%dx, 8416(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$62:
	cmpq	$256, %rax
	jb  	Lindcpa_enc_jazz$63
	movb	$0, %al
	leaq	3808(%rsp), %rdx
	leaq	13024(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Lindcpa_enc_jazz$61:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	4320(%rsp), %rdx
	leaq	13024(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Lindcpa_enc_jazz$60:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	4832(%rsp), %rdx
	leaq	13024(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Lindcpa_enc_jazz$59:
	leaq	176(%rsp), %rsp
	movb	$3, %al
	leaq	5344(%rsp), %rdx
	leaq	13024(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Lindcpa_enc_jazz$58:
	leaq	176(%rsp), %rsp
	movb	$4, %al
	leaq	5856(%rsp), %rdx
	leaq	13024(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Lindcpa_enc_jazz$57:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	6368(%rsp), %rdx
	leaq	13024(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Lindcpa_enc_jazz$56:
	leaq	176(%rsp), %rsp
	movb	$6, %al
	leaq	736(%rsp), %rdx
	leaq	13024(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Lindcpa_enc_jazz$55:
	leaq	176(%rsp), %rsp
	leaq	3808(%rsp), %rax
	call	L_poly_ntt$1
Lindcpa_enc_jazz$54:
	leaq	4320(%rsp), %rax
	call	L_poly_ntt$1
Lindcpa_enc_jazz$53:
	leaq	4832(%rsp), %rax
	call	L_poly_ntt$1
Lindcpa_enc_jazz$52:
	leaq	6880(%rsp), %rdx
	leaq	8416(%rsp), %rax
	leaq	3808(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_enc_jazz$51:
	leaq	16(%rsp), %rsp
	leaq	1248(%rsp), %rdx
	leaq	8928(%rsp), %rax
	leaq	4320(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_enc_jazz$50:
	leaq	16(%rsp), %rsp
	leaq	6880(%rsp), %rax
	leaq	1248(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_enc_jazz$49:
	leaq	1248(%rsp), %rdx
	leaq	9440(%rsp), %rax
	leaq	4832(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_enc_jazz$48:
	leaq	16(%rsp), %rsp
	leaq	6880(%rsp), %rax
	leaq	1248(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_enc_jazz$47:
	leaq	6880(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$45
Lindcpa_enc_jazz$46:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$45:
	cmpq	$256, %rcx
	jb  	Lindcpa_enc_jazz$46
	leaq	7392(%rsp), %rdx
	leaq	9952(%rsp), %rax
	leaq	3808(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_enc_jazz$44:
	leaq	16(%rsp), %rsp
	leaq	1248(%rsp), %rdx
	leaq	10464(%rsp), %rax
	leaq	4320(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_enc_jazz$43:
	leaq	16(%rsp), %rsp
	leaq	7392(%rsp), %rax
	leaq	1248(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_enc_jazz$42:
	leaq	1248(%rsp), %rdx
	leaq	10976(%rsp), %rax
	leaq	4832(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_enc_jazz$41:
	leaq	16(%rsp), %rsp
	leaq	7392(%rsp), %rax
	leaq	1248(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_enc_jazz$40:
	leaq	7392(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$38
Lindcpa_enc_jazz$39:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$38:
	cmpq	$256, %rcx
	jb  	Lindcpa_enc_jazz$39
	leaq	7904(%rsp), %rdx
	leaq	11488(%rsp), %rax
	leaq	3808(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_enc_jazz$37:
	leaq	16(%rsp), %rsp
	leaq	1248(%rsp), %rdx
	leaq	12000(%rsp), %rax
	leaq	4320(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_enc_jazz$36:
	leaq	16(%rsp), %rsp
	leaq	7904(%rsp), %rax
	leaq	1248(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_enc_jazz$35:
	leaq	1248(%rsp), %rdx
	leaq	12512(%rsp), %rax
	leaq	4832(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_enc_jazz$34:
	leaq	16(%rsp), %rsp
	leaq	7904(%rsp), %rax
	leaq	1248(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_enc_jazz$33:
	leaq	7904(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$31
Lindcpa_enc_jazz$32:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$31:
	cmpq	$256, %rcx
	jb  	Lindcpa_enc_jazz$32
	leaq	1248(%rsp), %rdx
	leaq	2272(%rsp), %rax
	leaq	3808(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_enc_jazz$30:
	leaq	16(%rsp), %rsp
	leaq	1760(%rsp), %rdx
	leaq	2784(%rsp), %rax
	leaq	4320(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_enc_jazz$29:
	leaq	16(%rsp), %rsp
	leaq	1248(%rsp), %rax
	leaq	1760(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_enc_jazz$28:
	leaq	1760(%rsp), %rdx
	leaq	3296(%rsp), %rax
	leaq	4832(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_enc_jazz$27:
	leaq	16(%rsp), %rsp
	leaq	1248(%rsp), %rax
	leaq	1760(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_enc_jazz$26:
	leaq	1248(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$24
Lindcpa_enc_jazz$25:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$24:
	cmpq	$256, %rcx
	jb  	Lindcpa_enc_jazz$25
	leaq	6880(%rsp), %rax
	call	L_poly_invntt$1
Lindcpa_enc_jazz$23:
	leaq	7392(%rsp), %rax
	call	L_poly_invntt$1
Lindcpa_enc_jazz$22:
	leaq	7904(%rsp), %rax
	call	L_poly_invntt$1
Lindcpa_enc_jazz$21:
	leaq	1248(%rsp), %rax
	call	L_poly_invntt$1
Lindcpa_enc_jazz$20:
	leaq	6880(%rsp), %rax
	leaq	5344(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_enc_jazz$19:
	leaq	7392(%rsp), %rax
	leaq	5856(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_enc_jazz$18:
	leaq	7904(%rsp), %rax
	leaq	6368(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_enc_jazz$17:
	leaq	1248(%rsp), %rax
	leaq	736(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_enc_jazz$16:
	leaq	1248(%rsp), %rax
	leaq	224(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_enc_jazz$15:
	leaq	6880(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$13
Lindcpa_enc_jazz$14:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$13:
	cmpq	$256, %rcx
	jb  	Lindcpa_enc_jazz$14
	leaq	7392(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$11
Lindcpa_enc_jazz$12:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$11:
	cmpq	$256, %rcx
	jb  	Lindcpa_enc_jazz$12
	leaq	7904(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$9
Lindcpa_enc_jazz$10:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$9:
	cmpq	$256, %rcx
	jb  	Lindcpa_enc_jazz$10
	leaq	1248(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_enc_jazz$7
Lindcpa_enc_jazz$8:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_enc_jazz$7:
	cmpq	$256, %rcx
	jb  	Lindcpa_enc_jazz$8
	movq	(%rsp), %rcx
	movq	$0, %rdx
	movq	$0, %rsi
	leaq	6880(%rsp), %rax
	call	L_poly_csubq$1
Lindcpa_enc_jazz$6:
	leaq	7392(%rsp), %rax
	call	L_poly_csubq$1
Lindcpa_enc_jazz$5:
	leaq	7904(%rsp), %rax
	call	L_poly_csubq$1
Lindcpa_enc_jazz$4:
	jmp 	Lindcpa_enc_jazz$2
Lindcpa_enc_jazz$3:
	movzwq	6880(%rsp,%rdx,2), %rax
	leaq	1(%rdx), %rdx
	shlq	$10, %rax
	leaq	1665(%rax), %rax
	imulq	$1290167, %rax, %rax
	shrq	$32, %rax
	andq	$1023, %rax
	movzwq	6880(%rsp,%rdx,2), %rdi
	leaq	1(%rdx), %rdx
	shlq	$10, %rdi
	leaq	1665(%rdi), %rdi
	imulq	$1290167, %rdi, %rdi
	shrq	$32, %rdi
	andq	$1023, %rdi
	movzwq	6880(%rsp,%rdx,2), %r8
	leaq	1(%rdx), %rdx
	shlq	$10, %r8
	leaq	1665(%r8), %r8
	imulq	$1290167, %r8, %r8
	shrq	$32, %r8
	andq	$1023, %r8
	movzwq	6880(%rsp,%rdx,2), %r9
	leaq	1(%rdx), %rdx
	shlq	$10, %r9
	leaq	1665(%r9), %r9
	imulq	$1290167, %r9, %r9
	shrq	$32, %r9
	andq	$1023, %r9
	movw	%ax, %r10w
	andw	$255, %r10w
	movb	%r10b, (%rcx,%rsi)
	leaq	1(%rsi), %rsi
	shrw	$8, %ax
	movw	%di, %r10w
	shlw	$2, %r10w
	orw 	%ax, %r10w
	movb	%r10b, (%rcx,%rsi)
	leaq	1(%rsi), %rax
	shrw	$6, %di
	movw	%r8w, %si
	shlw	$4, %si
	orw 	%di, %si
	movb	%sil, (%rcx,%rax)
	leaq	1(%rax), %rax
	shrw	$4, %r8w
	movw	%r9w, %si
	shlw	$6, %si
	orw 	%r8w, %si
	movb	%sil, (%rcx,%rax)
	leaq	1(%rax), %rax
	shrq	$2, %r9
	movb	%r9b, (%rcx,%rax)
	leaq	1(%rax), %rsi
Lindcpa_enc_jazz$2:
	cmpq	$768, %rdx
	jb  	Lindcpa_enc_jazz$3
	leaq	960(%rcx), %rcx
	leaq	1248(%rsp), %rax
	call	L_poly_compress$1
Lindcpa_enc_jazz$1:
	movq	13296(%rsp), %r13
	movq	13304(%rsp), %r12
	movq	13312(%rsp), %rbp
	movq	13320(%rsp), %rbx
	movq	13328(%rsp), %rsp
	ret
_indcpa_keypair_jazz:
indcpa_keypair_jazz:
	movq	%rsp, %rax
	leaq	-10336(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rax, 10328(%rsp)
	movq	%r13, 10296(%rsp)
	movq	%r12, 10304(%rsp)
	movq	%rbp, 10312(%rsp)
	movq	%rbx, 10320(%rsp)
	movq	%rdi, (%rsp)
	movq	%rsi, 8(%rsp)
	movq	$0, %rax
	jmp 	Lindcpa_keypair_jazz$174
Lindcpa_keypair_jazz$175:
	movb	(%rdx,%rax), %cl
	movb	%cl, 9960(%rsp,%rax)
	leaq	1(%rax), %rax
Lindcpa_keypair_jazz$174:
	cmpq	$32, %rax
	jb  	Lindcpa_keypair_jazz$175
	leaq	10058(%rsp), %rax
	leaq	9960(%rsp), %rcx
	leaq	-200(%rsp), %rsp
	call	L_sha3512_32$1
Lindcpa_keypair_jazz$173:
	leaq	200(%rsp), %rsp
	movq	$0, %rax
	movq	$32, %rcx
	jmp 	Lindcpa_keypair_jazz$171
Lindcpa_keypair_jazz$172:
	movb	10058(%rsp,%rax), %dl
	movb	%dl, 9992(%rsp,%rax)
	movb	10058(%rsp,%rcx), %dl
	movb	%dl, 9960(%rsp,%rax)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$171:
	cmpq	$32, %rax
	jb  	Lindcpa_keypair_jazz$172
	movq	$0, %rax
	movq	%rax, 16(%rsp)
	movb	9992(%rsp), %al
	movb	%al, 10024(%rsp)
	movb	9993(%rsp), %al
	movb	%al, 10025(%rsp)
	movb	9994(%rsp), %al
	movb	%al, 10026(%rsp)
	movb	9995(%rsp), %al
	movb	%al, 10027(%rsp)
	movb	9996(%rsp), %al
	movb	%al, 10028(%rsp)
	movb	9997(%rsp), %al
	movb	%al, 10029(%rsp)
	movb	9998(%rsp), %al
	movb	%al, 10030(%rsp)
	movb	9999(%rsp), %al
	movb	%al, 10031(%rsp)
	movb	10000(%rsp), %al
	movb	%al, 10032(%rsp)
	movb	10001(%rsp), %al
	movb	%al, 10033(%rsp)
	movb	10002(%rsp), %al
	movb	%al, 10034(%rsp)
	movb	10003(%rsp), %al
	movb	%al, 10035(%rsp)
	movb	10004(%rsp), %al
	movb	%al, 10036(%rsp)
	movb	10005(%rsp), %al
	movb	%al, 10037(%rsp)
	movb	10006(%rsp), %al
	movb	%al, 10038(%rsp)
	movb	10007(%rsp), %al
	movb	%al, 10039(%rsp)
	movb	10008(%rsp), %al
	movb	%al, 10040(%rsp)
	movb	10009(%rsp), %al
	movb	%al, 10041(%rsp)
	movb	10010(%rsp), %al
	movb	%al, 10042(%rsp)
	movb	10011(%rsp), %al
	movb	%al, 10043(%rsp)
	movb	10012(%rsp), %al
	movb	%al, 10044(%rsp)
	movb	10013(%rsp), %al
	movb	%al, 10045(%rsp)
	movb	10014(%rsp), %al
	movb	%al, 10046(%rsp)
	movb	10015(%rsp), %al
	movb	%al, 10047(%rsp)
	movb	10016(%rsp), %al
	movb	%al, 10048(%rsp)
	movb	10017(%rsp), %al
	movb	%al, 10049(%rsp)
	movb	10018(%rsp), %al
	movb	%al, 10050(%rsp)
	movb	10019(%rsp), %al
	movb	%al, 10051(%rsp)
	movb	10020(%rsp), %al
	movb	%al, 10052(%rsp)
	movb	10021(%rsp), %al
	movb	%al, 10053(%rsp)
	movb	10022(%rsp), %al
	movb	%al, 10054(%rsp)
	movb	10023(%rsp), %al
	movb	%al, 10055(%rsp)
	movq	16(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_keypair_jazz$169
	movb	$0, 10056(%rsp)
	movb	$0, 10057(%rsp)
	jmp 	Lindcpa_keypair_jazz$170
Lindcpa_keypair_jazz$169:
	movb	$0, 10056(%rsp)
	movb	$0, 10057(%rsp)
Lindcpa_keypair_jazz$170:
	leaq	32(%rsp), %rax
	leaq	10024(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_keypair_jazz$168:
	movq	$0, %rdi
	jmp 	Lindcpa_keypair_jazz$160
Lindcpa_keypair_jazz$161:
	movq	%rdi, 24(%rsp)
	leaq	32(%rsp), %rcx
	leaq	10122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_keypair_jazz$167:
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$162
Lindcpa_keypair_jazz$163:
	movzbw	10122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_keypair_jazz$166
	movw	%cx, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$166:
	cmpw	$3329, %si
	jnb 	Lindcpa_keypair_jazz$164
	cmpq	$256, %rdi
	jnb 	Lindcpa_keypair_jazz$164
	movw	%si, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$165:
Lindcpa_keypair_jazz$164:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_keypair_jazz$162:
	cmpq	$0, %rcx
	je  	Lindcpa_keypair_jazz$163
Lindcpa_keypair_jazz$160:
	cmpq	$256, %rdi
	jb  	Lindcpa_keypair_jazz$161
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$158
Lindcpa_keypair_jazz$159:
	movw	232(%rsp,%rax,2), %dx
	movw	%dx, 5352(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$158:
	cmpq	$256, %rax
	jb  	Lindcpa_keypair_jazz$159
	movq	16(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_keypair_jazz$156
	movb	$0, 10056(%rsp)
	movb	$1, 10057(%rsp)
	jmp 	Lindcpa_keypair_jazz$157
Lindcpa_keypair_jazz$156:
	movb	$1, 10056(%rsp)
	movb	$0, 10057(%rsp)
Lindcpa_keypair_jazz$157:
	leaq	32(%rsp), %rax
	leaq	10024(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_keypair_jazz$155:
	movq	$0, %rdi
	jmp 	Lindcpa_keypair_jazz$147
Lindcpa_keypair_jazz$148:
	movq	%rdi, 24(%rsp)
	leaq	32(%rsp), %rcx
	leaq	10122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_keypair_jazz$154:
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$149
Lindcpa_keypair_jazz$150:
	movzbw	10122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_keypair_jazz$153
	movw	%cx, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$153:
	cmpw	$3329, %si
	jnb 	Lindcpa_keypair_jazz$151
	cmpq	$256, %rdi
	jnb 	Lindcpa_keypair_jazz$151
	movw	%si, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$152:
Lindcpa_keypair_jazz$151:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_keypair_jazz$149:
	cmpq	$0, %rcx
	je  	Lindcpa_keypair_jazz$150
Lindcpa_keypair_jazz$147:
	cmpq	$256, %rdi
	jb  	Lindcpa_keypair_jazz$148
	movq	$0, %rax
	movq	$256, %rcx
	jmp 	Lindcpa_keypair_jazz$145
Lindcpa_keypair_jazz$146:
	movw	232(%rsp,%rax,2), %dx
	movw	%dx, 5352(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$145:
	cmpq	$256, %rax
	jb  	Lindcpa_keypair_jazz$146
	movq	16(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_keypair_jazz$143
	movb	$0, 10056(%rsp)
	movb	$2, 10057(%rsp)
	jmp 	Lindcpa_keypair_jazz$144
Lindcpa_keypair_jazz$143:
	movb	$2, 10056(%rsp)
	movb	$0, 10057(%rsp)
Lindcpa_keypair_jazz$144:
	leaq	32(%rsp), %rax
	leaq	10024(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_keypair_jazz$142:
	movq	$0, %rdi
	jmp 	Lindcpa_keypair_jazz$134
Lindcpa_keypair_jazz$135:
	movq	%rdi, 24(%rsp)
	leaq	32(%rsp), %rcx
	leaq	10122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_keypair_jazz$141:
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$136
Lindcpa_keypair_jazz$137:
	movzbw	10122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_keypair_jazz$140
	movw	%cx, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$140:
	cmpw	$3329, %si
	jnb 	Lindcpa_keypair_jazz$138
	cmpq	$256, %rdi
	jnb 	Lindcpa_keypair_jazz$138
	movw	%si, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$139:
Lindcpa_keypair_jazz$138:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_keypair_jazz$136:
	cmpq	$0, %rcx
	je  	Lindcpa_keypair_jazz$137
Lindcpa_keypair_jazz$134:
	cmpq	$256, %rdi
	jb  	Lindcpa_keypair_jazz$135
	movq	$0, %rax
	movq	$512, %rcx
	jmp 	Lindcpa_keypair_jazz$132
Lindcpa_keypair_jazz$133:
	movw	232(%rsp,%rax,2), %dx
	movw	%dx, 5352(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$132:
	cmpq	$256, %rax
	jb  	Lindcpa_keypair_jazz$133
	movq	16(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_keypair_jazz$130
	movb	$1, 10056(%rsp)
	movb	$0, 10057(%rsp)
	jmp 	Lindcpa_keypair_jazz$131
Lindcpa_keypair_jazz$130:
	movb	$0, 10056(%rsp)
	movb	$1, 10057(%rsp)
Lindcpa_keypair_jazz$131:
	leaq	32(%rsp), %rax
	leaq	10024(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_keypair_jazz$129:
	movq	$0, %rdi
	jmp 	Lindcpa_keypair_jazz$121
Lindcpa_keypair_jazz$122:
	movq	%rdi, 24(%rsp)
	leaq	32(%rsp), %rcx
	leaq	10122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_keypair_jazz$128:
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$123
Lindcpa_keypair_jazz$124:
	movzbw	10122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_keypair_jazz$127
	movw	%cx, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$127:
	cmpw	$3329, %si
	jnb 	Lindcpa_keypair_jazz$125
	cmpq	$256, %rdi
	jnb 	Lindcpa_keypair_jazz$125
	movw	%si, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$126:
Lindcpa_keypair_jazz$125:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_keypair_jazz$123:
	cmpq	$0, %rcx
	je  	Lindcpa_keypair_jazz$124
Lindcpa_keypair_jazz$121:
	cmpq	$256, %rdi
	jb  	Lindcpa_keypair_jazz$122
	movq	$0, %rax
	movq	$768, %rcx
	jmp 	Lindcpa_keypair_jazz$119
Lindcpa_keypair_jazz$120:
	movw	232(%rsp,%rax,2), %dx
	movw	%dx, 5352(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$119:
	cmpq	$256, %rax
	jb  	Lindcpa_keypair_jazz$120
	movq	16(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_keypair_jazz$117
	movb	$1, 10056(%rsp)
	movb	$1, 10057(%rsp)
	jmp 	Lindcpa_keypair_jazz$118
Lindcpa_keypair_jazz$117:
	movb	$1, 10056(%rsp)
	movb	$1, 10057(%rsp)
Lindcpa_keypair_jazz$118:
	leaq	32(%rsp), %rax
	leaq	10024(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_keypair_jazz$116:
	movq	$0, %rdi
	jmp 	Lindcpa_keypair_jazz$108
Lindcpa_keypair_jazz$109:
	movq	%rdi, 24(%rsp)
	leaq	32(%rsp), %rcx
	leaq	10122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_keypair_jazz$115:
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$110
Lindcpa_keypair_jazz$111:
	movzbw	10122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_keypair_jazz$114
	movw	%cx, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$114:
	cmpw	$3329, %si
	jnb 	Lindcpa_keypair_jazz$112
	cmpq	$256, %rdi
	jnb 	Lindcpa_keypair_jazz$112
	movw	%si, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$113:
Lindcpa_keypair_jazz$112:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_keypair_jazz$110:
	cmpq	$0, %rcx
	je  	Lindcpa_keypair_jazz$111
Lindcpa_keypair_jazz$108:
	cmpq	$256, %rdi
	jb  	Lindcpa_keypair_jazz$109
	movq	$0, %rax
	movq	$1024, %rcx
	jmp 	Lindcpa_keypair_jazz$106
Lindcpa_keypair_jazz$107:
	movw	232(%rsp,%rax,2), %dx
	movw	%dx, 5352(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$106:
	cmpq	$256, %rax
	jb  	Lindcpa_keypair_jazz$107
	movq	16(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_keypair_jazz$104
	movb	$1, 10056(%rsp)
	movb	$2, 10057(%rsp)
	jmp 	Lindcpa_keypair_jazz$105
Lindcpa_keypair_jazz$104:
	movb	$2, 10056(%rsp)
	movb	$1, 10057(%rsp)
Lindcpa_keypair_jazz$105:
	leaq	32(%rsp), %rax
	leaq	10024(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_keypair_jazz$103:
	movq	$0, %rdi
	jmp 	Lindcpa_keypair_jazz$95
Lindcpa_keypair_jazz$96:
	movq	%rdi, 24(%rsp)
	leaq	32(%rsp), %rcx
	leaq	10122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_keypair_jazz$102:
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$97
Lindcpa_keypair_jazz$98:
	movzbw	10122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_keypair_jazz$101
	movw	%cx, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$101:
	cmpw	$3329, %si
	jnb 	Lindcpa_keypair_jazz$99
	cmpq	$256, %rdi
	jnb 	Lindcpa_keypair_jazz$99
	movw	%si, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$100:
Lindcpa_keypair_jazz$99:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_keypair_jazz$97:
	cmpq	$0, %rcx
	je  	Lindcpa_keypair_jazz$98
Lindcpa_keypair_jazz$95:
	cmpq	$256, %rdi
	jb  	Lindcpa_keypair_jazz$96
	movq	$0, %rax
	movq	$1280, %rcx
	jmp 	Lindcpa_keypair_jazz$93
Lindcpa_keypair_jazz$94:
	movw	232(%rsp,%rax,2), %dx
	movw	%dx, 5352(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$93:
	cmpq	$256, %rax
	jb  	Lindcpa_keypair_jazz$94
	movq	16(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_keypair_jazz$91
	movb	$2, 10056(%rsp)
	movb	$0, 10057(%rsp)
	jmp 	Lindcpa_keypair_jazz$92
Lindcpa_keypair_jazz$91:
	movb	$0, 10056(%rsp)
	movb	$2, 10057(%rsp)
Lindcpa_keypair_jazz$92:
	leaq	32(%rsp), %rax
	leaq	10024(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_keypair_jazz$90:
	movq	$0, %rdi
	jmp 	Lindcpa_keypair_jazz$82
Lindcpa_keypair_jazz$83:
	movq	%rdi, 24(%rsp)
	leaq	32(%rsp), %rcx
	leaq	10122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_keypair_jazz$89:
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$84
Lindcpa_keypair_jazz$85:
	movzbw	10122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_keypair_jazz$88
	movw	%cx, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$88:
	cmpw	$3329, %si
	jnb 	Lindcpa_keypair_jazz$86
	cmpq	$256, %rdi
	jnb 	Lindcpa_keypair_jazz$86
	movw	%si, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$87:
Lindcpa_keypair_jazz$86:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_keypair_jazz$84:
	cmpq	$0, %rcx
	je  	Lindcpa_keypair_jazz$85
Lindcpa_keypair_jazz$82:
	cmpq	$256, %rdi
	jb  	Lindcpa_keypair_jazz$83
	movq	$0, %rax
	movq	$1536, %rcx
	jmp 	Lindcpa_keypair_jazz$80
Lindcpa_keypair_jazz$81:
	movw	232(%rsp,%rax,2), %dx
	movw	%dx, 5352(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$80:
	cmpq	$256, %rax
	jb  	Lindcpa_keypair_jazz$81
	movq	16(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_keypair_jazz$78
	movb	$2, 10056(%rsp)
	movb	$1, 10057(%rsp)
	jmp 	Lindcpa_keypair_jazz$79
Lindcpa_keypair_jazz$78:
	movb	$1, 10056(%rsp)
	movb	$2, 10057(%rsp)
Lindcpa_keypair_jazz$79:
	leaq	32(%rsp), %rax
	leaq	10024(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_keypair_jazz$77:
	movq	$0, %rdi
	jmp 	Lindcpa_keypair_jazz$69
Lindcpa_keypair_jazz$70:
	movq	%rdi, 24(%rsp)
	leaq	32(%rsp), %rcx
	leaq	10122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_keypair_jazz$76:
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$71
Lindcpa_keypair_jazz$72:
	movzbw	10122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_keypair_jazz$75
	movw	%cx, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$75:
	cmpw	$3329, %si
	jnb 	Lindcpa_keypair_jazz$73
	cmpq	$256, %rdi
	jnb 	Lindcpa_keypair_jazz$73
	movw	%si, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$74:
Lindcpa_keypair_jazz$73:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_keypair_jazz$71:
	cmpq	$0, %rcx
	je  	Lindcpa_keypair_jazz$72
Lindcpa_keypair_jazz$69:
	cmpq	$256, %rdi
	jb  	Lindcpa_keypair_jazz$70
	movq	$0, %rax
	movq	$1792, %rcx
	jmp 	Lindcpa_keypair_jazz$67
Lindcpa_keypair_jazz$68:
	movw	232(%rsp,%rax,2), %dx
	movw	%dx, 5352(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$67:
	cmpq	$256, %rax
	jb  	Lindcpa_keypair_jazz$68
	movq	16(%rsp), %rax
	cmpq	$0, %rax
	je  	Lindcpa_keypair_jazz$65
	movb	$2, 10056(%rsp)
	movb	$2, 10057(%rsp)
	jmp 	Lindcpa_keypair_jazz$66
Lindcpa_keypair_jazz$65:
	movb	$2, 10056(%rsp)
	movb	$2, 10057(%rsp)
Lindcpa_keypair_jazz$66:
	leaq	32(%rsp), %rax
	leaq	10024(%rsp), %rcx
	call	L_shake128_absorb34$1
Lindcpa_keypair_jazz$64:
	movq	$0, %rdi
	jmp 	Lindcpa_keypair_jazz$56
Lindcpa_keypair_jazz$57:
	movq	%rdi, 16(%rsp)
	leaq	32(%rsp), %rcx
	leaq	10122(%rsp), %rax
	call	L_shake128_squeezeblock$1
Lindcpa_keypair_jazz$63:
	movq	16(%rsp), %rax
	movq	%rax, %rdi
	movq	$0, %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$58
Lindcpa_keypair_jazz$59:
	movzbw	10122(%rsp,%rax), %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	movw	%dx, %si
	shrw	$4, %si
	andw	$15, %dx
	shlw	$8, %dx
	orw 	%dx, %cx
	leaq	1(%rax), %rax
	movzbw	10122(%rsp,%rax), %dx
	shlw	$4, %dx
	orw 	%dx, %si
	leaq	1(%rax), %rax
	cmpw	$3329, %cx
	jnb 	Lindcpa_keypair_jazz$62
	movw	%cx, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$62:
	cmpw	$3329, %si
	jnb 	Lindcpa_keypair_jazz$60
	cmpq	$256, %rdi
	jnb 	Lindcpa_keypair_jazz$60
	movw	%si, 232(%rsp,%rdi,2)
	leaq	1(%rdi), %rdi
Lindcpa_keypair_jazz$61:
Lindcpa_keypair_jazz$60:
	movq	$256, %rcx
	subq	%rdi, %rcx
	leaq	-1(%rcx), %rcx
	movq	$168, %rdx
	subq	%rax, %rdx
	leaq	-3(%rdx), %rdx
	orq 	%rdx, %rcx
	shrq	$63, %rcx
Lindcpa_keypair_jazz$58:
	cmpq	$0, %rcx
	je  	Lindcpa_keypair_jazz$59
Lindcpa_keypair_jazz$56:
	cmpq	$256, %rdi
	jb  	Lindcpa_keypair_jazz$57
	movq	$0, %rax
	movq	$2048, %rcx
	jmp 	Lindcpa_keypair_jazz$54
Lindcpa_keypair_jazz$55:
	movw	232(%rsp,%rax,2), %dx
	movw	%dx, 5352(%rsp,%rcx,2)
	leaq	1(%rax), %rax
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$54:
	cmpq	$256, %rax
	jb  	Lindcpa_keypair_jazz$55
	movb	$0, %al
	leaq	744(%rsp), %rdx
	leaq	9960(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Lindcpa_keypair_jazz$53:
	leaq	176(%rsp), %rsp
	movb	$1, %al
	leaq	1256(%rsp), %rdx
	leaq	9960(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Lindcpa_keypair_jazz$52:
	leaq	176(%rsp), %rsp
	movb	$2, %al
	leaq	1768(%rsp), %rdx
	leaq	9960(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Lindcpa_keypair_jazz$51:
	leaq	176(%rsp), %rsp
	movb	$3, %al
	leaq	2280(%rsp), %rdx
	leaq	9960(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Lindcpa_keypair_jazz$50:
	leaq	176(%rsp), %rsp
	movb	$4, %al
	leaq	2792(%rsp), %rdx
	leaq	9960(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Lindcpa_keypair_jazz$49:
	leaq	176(%rsp), %rsp
	movb	$5, %al
	leaq	3304(%rsp), %rdx
	leaq	9960(%rsp), %rcx
	leaq	-176(%rsp), %rsp
	call	L_poly_getnoise$1
Lindcpa_keypair_jazz$48:
	leaq	176(%rsp), %rsp
	leaq	744(%rsp), %rax
	call	L_poly_ntt$1
Lindcpa_keypair_jazz$47:
	leaq	1256(%rsp), %rax
	call	L_poly_ntt$1
Lindcpa_keypair_jazz$46:
	leaq	1768(%rsp), %rax
	call	L_poly_ntt$1
Lindcpa_keypair_jazz$45:
	leaq	2280(%rsp), %rax
	call	L_poly_ntt$1
Lindcpa_keypair_jazz$44:
	leaq	2792(%rsp), %rax
	call	L_poly_ntt$1
Lindcpa_keypair_jazz$43:
	leaq	3304(%rsp), %rax
	call	L_poly_ntt$1
Lindcpa_keypair_jazz$42:
	leaq	3816(%rsp), %rdx
	leaq	5352(%rsp), %rax
	leaq	744(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_keypair_jazz$41:
	leaq	16(%rsp), %rsp
	leaq	232(%rsp), %rdx
	leaq	5864(%rsp), %rax
	leaq	1256(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_keypair_jazz$40:
	leaq	16(%rsp), %rsp
	leaq	3816(%rsp), %rax
	leaq	232(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_keypair_jazz$39:
	leaq	232(%rsp), %rdx
	leaq	6376(%rsp), %rax
	leaq	1768(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_keypair_jazz$38:
	leaq	16(%rsp), %rsp
	leaq	3816(%rsp), %rax
	leaq	232(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_keypair_jazz$37:
	leaq	3816(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$35
Lindcpa_keypair_jazz$36:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$35:
	cmpq	$256, %rcx
	jb  	Lindcpa_keypair_jazz$36
	leaq	3816(%rsp), %rax
	call	L_poly_frommont$1
Lindcpa_keypair_jazz$34:
	leaq	4328(%rsp), %rdx
	leaq	6888(%rsp), %rax
	leaq	744(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_keypair_jazz$33:
	leaq	16(%rsp), %rsp
	leaq	232(%rsp), %rdx
	leaq	7400(%rsp), %rax
	leaq	1256(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_keypair_jazz$32:
	leaq	16(%rsp), %rsp
	leaq	4328(%rsp), %rax
	leaq	232(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_keypair_jazz$31:
	leaq	232(%rsp), %rdx
	leaq	7912(%rsp), %rax
	leaq	1768(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_keypair_jazz$30:
	leaq	16(%rsp), %rsp
	leaq	4328(%rsp), %rax
	leaq	232(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_keypair_jazz$29:
	leaq	4328(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$27
Lindcpa_keypair_jazz$28:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$27:
	cmpq	$256, %rcx
	jb  	Lindcpa_keypair_jazz$28
	leaq	4328(%rsp), %rax
	call	L_poly_frommont$1
Lindcpa_keypair_jazz$26:
	leaq	4840(%rsp), %rdx
	leaq	8424(%rsp), %rax
	leaq	744(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_keypair_jazz$25:
	leaq	16(%rsp), %rsp
	leaq	232(%rsp), %rdx
	leaq	8936(%rsp), %rax
	leaq	1256(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_keypair_jazz$24:
	leaq	16(%rsp), %rsp
	leaq	4840(%rsp), %rax
	leaq	232(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_keypair_jazz$23:
	leaq	232(%rsp), %rdx
	leaq	9448(%rsp), %rax
	leaq	1768(%rsp), %rcx
	leaq	-16(%rsp), %rsp
	call	L_poly_basemul$1
Lindcpa_keypair_jazz$22:
	leaq	16(%rsp), %rsp
	leaq	4840(%rsp), %rax
	leaq	232(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_keypair_jazz$21:
	leaq	4840(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$19
Lindcpa_keypair_jazz$20:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$19:
	cmpq	$256, %rcx
	jb  	Lindcpa_keypair_jazz$20
	leaq	4840(%rsp), %rax
	call	L_poly_frommont$1
Lindcpa_keypair_jazz$18:
	leaq	3816(%rsp), %rax
	leaq	2280(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_keypair_jazz$17:
	leaq	4328(%rsp), %rax
	leaq	2792(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_keypair_jazz$16:
	leaq	4840(%rsp), %rax
	leaq	3304(%rsp), %rcx
	call	L_poly_add2$1
Lindcpa_keypair_jazz$15:
	leaq	3816(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$13
Lindcpa_keypair_jazz$14:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$13:
	cmpq	$256, %rcx
	jb  	Lindcpa_keypair_jazz$14
	leaq	4328(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$11
Lindcpa_keypair_jazz$12:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$11:
	cmpq	$256, %rcx
	jb  	Lindcpa_keypair_jazz$12
	leaq	4840(%rsp), %rax
	movq	$0, %rcx
	jmp 	Lindcpa_keypair_jazz$9
Lindcpa_keypair_jazz$10:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
Lindcpa_keypair_jazz$9:
	cmpq	$256, %rcx
	jb  	Lindcpa_keypair_jazz$10
	movq	(%rsp), %rcx
	movq	8(%rsp), %rdx
	leaq	744(%rsp), %rax
	call	L_poly_tobytes$1
Lindcpa_keypair_jazz$8:
	leaq	384(%rdx), %rdx
	leaq	1256(%rsp), %rax
	call	L_poly_tobytes$1
Lindcpa_keypair_jazz$7:
	leaq	384(%rdx), %rdx
	leaq	1768(%rsp), %rax
	call	L_poly_tobytes$1
Lindcpa_keypair_jazz$6:
	movq	%rcx, %rdx
	leaq	3816(%rsp), %rax
	call	L_poly_tobytes$1
Lindcpa_keypair_jazz$5:
	leaq	384(%rdx), %rdx
	leaq	4328(%rsp), %rax
	call	L_poly_tobytes$1
Lindcpa_keypair_jazz$4:
	leaq	384(%rdx), %rdx
	leaq	4840(%rsp), %rax
	call	L_poly_tobytes$1
Lindcpa_keypair_jazz$3:
	movq	$0, %rax
	leaq	1152(%rcx), %rcx
	jmp 	Lindcpa_keypair_jazz$1
Lindcpa_keypair_jazz$2:
	movb	9992(%rsp,%rax), %dl
	movb	%dl, (%rcx)
	leaq	1(%rcx), %rcx
	leaq	1(%rax), %rax
Lindcpa_keypair_jazz$1:
	cmpq	$32, %rax
	jb  	Lindcpa_keypair_jazz$2
	movq	10296(%rsp), %r13
	movq	10304(%rsp), %r12
	movq	10312(%rsp), %rbp
	movq	10320(%rsp), %rbx
	movq	10328(%rsp), %rsp
	ret
L_poly_tomsg$1:
	call	L_poly_csubq$1
L_poly_tomsg$2:
	movb	$0, %cl
	movw	(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	2(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	4(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	6(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	8(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	10(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	12(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	14(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, (%rdi)
	movb	$0, %cl
	movw	16(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	18(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	20(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	22(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	24(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	26(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	28(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	30(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 1(%rdi)
	movb	$0, %cl
	movw	32(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	34(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	36(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	38(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	40(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	42(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	44(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	46(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 2(%rdi)
	movb	$0, %cl
	movw	48(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	50(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	52(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	54(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	56(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	58(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	60(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	62(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 3(%rdi)
	movb	$0, %cl
	movw	64(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	66(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	68(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	70(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	72(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	74(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	76(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	78(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 4(%rdi)
	movb	$0, %cl
	movw	80(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	82(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	84(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	86(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	88(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	90(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	92(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	94(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 5(%rdi)
	movb	$0, %cl
	movw	96(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	98(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	100(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	102(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	104(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	106(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	108(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	110(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 6(%rdi)
	movb	$0, %cl
	movw	112(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	114(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	116(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	118(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	120(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	122(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	124(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	126(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 7(%rdi)
	movb	$0, %cl
	movw	128(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	130(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	132(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	134(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	136(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	138(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	140(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	142(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 8(%rdi)
	movb	$0, %cl
	movw	144(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	146(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	148(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	150(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	152(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	154(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	156(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	158(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 9(%rdi)
	movb	$0, %cl
	movw	160(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	162(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	164(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	166(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	168(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	170(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	172(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	174(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 10(%rdi)
	movb	$0, %cl
	movw	176(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	178(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	180(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	182(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	184(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	186(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	188(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	190(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 11(%rdi)
	movb	$0, %cl
	movw	192(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	194(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	196(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	198(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	200(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	202(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	204(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	206(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 12(%rdi)
	movb	$0, %cl
	movw	208(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	210(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	212(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	214(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	216(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	218(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	220(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	222(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 13(%rdi)
	movb	$0, %cl
	movw	224(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	226(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	228(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	230(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	232(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	234(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	236(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	238(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 14(%rdi)
	movb	$0, %cl
	movw	240(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	242(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	244(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	246(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	248(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	250(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	252(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	254(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 15(%rdi)
	movb	$0, %cl
	movw	256(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	258(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	260(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	262(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	264(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	266(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	268(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	270(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 16(%rdi)
	movb	$0, %cl
	movw	272(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	274(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	276(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	278(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	280(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	282(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	284(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	286(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 17(%rdi)
	movb	$0, %cl
	movw	288(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	290(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	292(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	294(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	296(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	298(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	300(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	302(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 18(%rdi)
	movb	$0, %cl
	movw	304(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	306(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	308(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	310(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	312(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	314(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	316(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	318(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 19(%rdi)
	movb	$0, %cl
	movw	320(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	322(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	324(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	326(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	328(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	330(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	332(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	334(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 20(%rdi)
	movb	$0, %cl
	movw	336(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	338(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	340(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	342(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	344(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	346(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	348(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	350(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 21(%rdi)
	movb	$0, %cl
	movw	352(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	354(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	356(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	358(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	360(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	362(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	364(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	366(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 22(%rdi)
	movb	$0, %cl
	movw	368(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	370(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	372(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	374(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	376(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	378(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	380(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	382(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 23(%rdi)
	movb	$0, %cl
	movw	384(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	386(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	388(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	390(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	392(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	394(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	396(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	398(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 24(%rdi)
	movb	$0, %cl
	movw	400(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	402(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	404(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	406(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	408(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	410(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	412(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	414(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 25(%rdi)
	movb	$0, %cl
	movw	416(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	418(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	420(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	422(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	424(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	426(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	428(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	430(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 26(%rdi)
	movb	$0, %cl
	movw	432(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	434(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	436(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	438(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	440(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	442(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	444(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	446(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 27(%rdi)
	movb	$0, %cl
	movw	448(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	450(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	452(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	454(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	456(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	458(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	460(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	462(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 28(%rdi)
	movb	$0, %cl
	movw	464(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	466(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	468(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	470(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	472(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	474(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	476(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	478(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 29(%rdi)
	movb	$0, %cl
	movw	480(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	482(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	484(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	486(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	488(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	490(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	492(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	494(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$7, %edx
	orb 	%dl, %cl
	movb	%cl, 30(%rdi)
	movb	$0, %cl
	movw	496(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$0, %edx
	orb 	%dl, %cl
	movw	498(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$1, %edx
	orb 	%dl, %cl
	movw	500(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$2, %edx
	orb 	%dl, %cl
	movw	502(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$3, %edx
	orb 	%dl, %cl
	movw	504(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$4, %edx
	orb 	%dl, %cl
	movw	506(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$5, %edx
	orb 	%dl, %cl
	movw	508(%rax), %dx
	movzwl	%dx, %edx
	shll	$1, %edx
	leal	1665(%rdx), %edx
	imull	$80635, %edx, %edx
	shrl	$28, %edx
	andl	$1, %edx
	shll	$6, %edx
	orb 	%dl, %cl
	movw	510(%rax), %ax
	movzwl	%ax, %eax
	shll	$1, %eax
	leal	1665(%rax), %eax
	imull	$80635, %eax, %eax
	shrl	$28, %eax
	andl	$1, %eax
	shll	$7, %eax
	orb 	%al, %cl
	movb	%cl, 31(%rdi)
	ret
L_poly_tobytes$1:
	call	L_poly_csubq$1
L_poly_tobytes$4:
	movq	$0, %rsi
	movq	$0, %rdi
	jmp 	L_poly_tobytes$2
L_poly_tobytes$3:
	movw	(%rax,%rsi,2), %r8w
	leaq	1(%rsi), %rsi
	movw	(%rax,%rsi,2), %r9w
	leaq	1(%rsi), %rsi
	movw	%r8w, %r10w
	andw	$255, %r10w
	movb	%r10b, (%rdx,%rdi)
	leaq	1(%rdi), %rdi
	shrw	$8, %r8w
	movw	%r9w, %r10w
	andw	$15, %r10w
	shlw	$4, %r10w
	orw 	%r8w, %r10w
	movb	%r10b, (%rdx,%rdi)
	leaq	1(%rdi), %rdi
	shrw	$4, %r9w
	movb	%r9b, (%rdx,%rdi)
	leaq	1(%rdi), %rdi
L_poly_tobytes$2:
	cmpq	$256, %rsi
	jb  	L_poly_tobytes$3
	ret
L_poly_sub$1:
	movq	$0, %rsi
	jmp 	L_poly_sub$2
L_poly_sub$3:
	movw	(%rcx,%rsi,2), %r8w
	movw	(%rdx,%rsi,2), %r9w
	subw	%r9w, %r8w
	movw	%r8w, (%rax,%rsi,2)
	leaq	1(%rsi), %rsi
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
	movq	$0, %r10
	jmp 	L_poly_ntt$6
L_poly_ntt$7:
	leaq	1(%rdx), %rdx
	movw	(%rcx,%rdx,2), %r8w
	movq	%r10, %r9
	leaq	(%r10,%rsi), %r10
	jmp 	L_poly_ntt$8
L_poly_ntt$9:
	leaq	(%r9,%rsi), %r11
	movw	(%rax,%r11,2), %bx
	movswl	%bx, %ebx
	movswl	%r8w, %ebp
	imull	%ebp, %ebx
	imull	$-218038272, %ebx, %ebp
	sarl	$16, %ebp
	imull	$-3329, %ebp, %ebp
	leal	(%rbp,%rbx), %ebx
	sarl	$16, %ebx
	movw	(%rax,%r9,2), %bp
	movw	%bp, %r12w
	subw	%bx, %r12w
	movw	%r12w, (%rax,%r11,2)
	leaw	(%rbx,%rbp), %r11w
	movw	%r11w, (%rax,%r9,2)
	leaq	1(%r9), %r9
L_poly_ntt$8:
	cmpq	%r10, %r9
	jb  	L_poly_ntt$9
	leaq	(%r9,%rsi), %r10
L_poly_ntt$6:
	cmpq	$256, %r10
	jb  	L_poly_ntt$7
	shrq	$1, %rsi
L_poly_ntt$4:
	cmpq	$2, %rsi
	jnb 	L_poly_ntt$5
	movq	$0, %rcx
	jmp 	L_poly_ntt$2
L_poly_ntt$3:
	movw	(%rax,%rcx,2), %dx
	movswl	%dx, %esi
	imull	$20159, %esi, %esi
	sarl	$26, %esi
	imull	$3329, %esi, %esi
	subw	%si, %dx
	movw	%dx, (%rax,%rcx,2)
	leaq	1(%rcx), %rcx
L_poly_ntt$2:
	cmpq	$256, %rcx
	jb  	L_poly_ntt$3
	ret
L_poly_invntt$1:
	leaq	glob_data + 192(%rip), %rcx
	movq	$0, %rdx
	movq	$2, %rsi
	jmp 	L_poly_invntt$4
L_poly_invntt$5:
	movq	$0, %r10
	jmp 	L_poly_invntt$6
L_poly_invntt$7:
	movw	(%rcx,%rdx,2), %r8w
	leaq	1(%rdx), %rdx
	movq	%r10, %r9
	leaq	(%r10,%rsi), %r10
	jmp 	L_poly_invntt$8
L_poly_invntt$9:
	leaq	(%r9,%rsi), %r11
	movw	(%rax,%r11,2), %bx
	movw	(%rax,%r9,2), %bp
	leaw	(%rbx,%rbp), %r12w
	movswl	%r12w, %r13d
	imull	$20159, %r13d, %r13d
	sarl	$26, %r13d
	imull	$3329, %r13d, %r13d
	subw	%r13w, %r12w
	movw	%r12w, (%rax,%r9,2)
	subw	%bx, %bp
	movswl	%bp, %ebx
	movswl	%r8w, %ebp
	imull	%ebp, %ebx
	imull	$-218038272, %ebx, %ebp
	sarl	$16, %ebp
	imull	$-3329, %ebp, %ebp
	leal	(%rbp,%rbx), %ebx
	sarl	$16, %ebx
	movw	%bx, (%rax,%r11,2)
	leaq	1(%r9), %r9
L_poly_invntt$8:
	cmpq	%r10, %r9
	jb  	L_poly_invntt$9
	leaq	(%r9,%rsi), %r10
L_poly_invntt$6:
	cmpq	$256, %r10
	jb  	L_poly_invntt$7
	shlq	$1, %rsi
L_poly_invntt$4:
	cmpq	$128, %rsi
	jbe 	L_poly_invntt$5
	movw	254(%rcx), %cx
	movq	$0, %rdx
	jmp 	L_poly_invntt$2
L_poly_invntt$3:
	movw	(%rax,%rdx,2), %si
	movswl	%si, %esi
	movswl	%cx, %r8d
	imull	%r8d, %esi
	imull	$-218038272, %esi, %r8d
	sarl	$16, %r8d
	imull	$-3329, %r8d, %r8d
	leal	(%r8,%rsi), %esi
	sarl	$16, %esi
	movw	%si, (%rax,%rdx,2)
	leaq	1(%rdx), %rdx
L_poly_invntt$2:
	cmpq	$256, %rdx
	jb  	L_poly_invntt$3
	ret
L_poly_getnoise$1:
	movq	%rdx, 8(%rsp)
	movb	(%rcx), %dl
	movb	%dl, 16(%rsp)
	movb	1(%rcx), %dl
	movb	%dl, 17(%rsp)
	movb	2(%rcx), %dl
	movb	%dl, 18(%rsp)
	movb	3(%rcx), %dl
	movb	%dl, 19(%rsp)
	movb	4(%rcx), %dl
	movb	%dl, 20(%rsp)
	movb	5(%rcx), %dl
	movb	%dl, 21(%rsp)
	movb	6(%rcx), %dl
	movb	%dl, 22(%rsp)
	movb	7(%rcx), %dl
	movb	%dl, 23(%rsp)
	movb	8(%rcx), %dl
	movb	%dl, 24(%rsp)
	movb	9(%rcx), %dl
	movb	%dl, 25(%rsp)
	movb	10(%rcx), %dl
	movb	%dl, 26(%rsp)
	movb	11(%rcx), %dl
	movb	%dl, 27(%rsp)
	movb	12(%rcx), %dl
	movb	%dl, 28(%rsp)
	movb	13(%rcx), %dl
	movb	%dl, 29(%rsp)
	movb	14(%rcx), %dl
	movb	%dl, 30(%rsp)
	movb	15(%rcx), %dl
	movb	%dl, 31(%rsp)
	movb	16(%rcx), %dl
	movb	%dl, 32(%rsp)
	movb	17(%rcx), %dl
	movb	%dl, 33(%rsp)
	movb	18(%rcx), %dl
	movb	%dl, 34(%rsp)
	movb	19(%rcx), %dl
	movb	%dl, 35(%rsp)
	movb	20(%rcx), %dl
	movb	%dl, 36(%rsp)
	movb	21(%rcx), %dl
	movb	%dl, 37(%rsp)
	movb	22(%rcx), %dl
	movb	%dl, 38(%rsp)
	movb	23(%rcx), %dl
	movb	%dl, 39(%rsp)
	movb	24(%rcx), %dl
	movb	%dl, 40(%rsp)
	movb	25(%rcx), %dl
	movb	%dl, 41(%rsp)
	movb	26(%rcx), %dl
	movb	%dl, 42(%rsp)
	movb	27(%rcx), %dl
	movb	%dl, 43(%rsp)
	movb	28(%rcx), %dl
	movb	%dl, 44(%rsp)
	movb	29(%rcx), %dl
	movb	%dl, 45(%rsp)
	movb	30(%rcx), %dl
	movb	%dl, 46(%rsp)
	movb	31(%rcx), %cl
	movb	%cl, 47(%rsp)
	movb	%al, 48(%rsp)
	leaq	49(%rsp), %rcx
	leaq	16(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	L_shake256_128_33$1
L_poly_getnoise$4:
	leaq	208(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %rdx
	jmp 	L_poly_getnoise$2
L_poly_getnoise$3:
	movb	49(%rsp,%rcx), %sil
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
	movw	%di, (%rax,%rdx,2)
	movb	%sil, %dil
	shrb	$4, %dil
	andb	$3, %dil
	shrb	$6, %sil
	andb	$3, %sil
	subb	%sil, %dil
	movsbw	%dil, %si
	leaq	1(%rdx), %rdx
	movw	%si, (%rax,%rdx,2)
	leaq	1(%rcx), %rcx
	leaq	1(%rdx), %rdx
L_poly_getnoise$2:
	cmpq	$128, %rcx
	jb  	L_poly_getnoise$3
	ret
L_poly_frommsg$1:
	movb	(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, (%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 2(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 4(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 6(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 8(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 10(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 12(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 14(%rax)
	movb	1(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 16(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 18(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 20(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 22(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 24(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 26(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 28(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 30(%rax)
	movb	2(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 32(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 34(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 36(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 38(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 40(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 42(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 44(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 46(%rax)
	movb	3(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 48(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 50(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 52(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 54(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 56(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 58(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 60(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 62(%rax)
	movb	4(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 64(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 66(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 68(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 70(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 72(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 74(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 76(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 78(%rax)
	movb	5(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 80(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 82(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 84(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 86(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 88(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 90(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 92(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 94(%rax)
	movb	6(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 96(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 98(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 100(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 102(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 104(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 106(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 108(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 110(%rax)
	movb	7(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 112(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 114(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 116(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 118(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 120(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 122(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 124(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 126(%rax)
	movb	8(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 128(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 130(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 132(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 134(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 136(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 138(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 140(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 142(%rax)
	movb	9(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 144(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 146(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 148(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 150(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 152(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 154(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 156(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 158(%rax)
	movb	10(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 160(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 162(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 164(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 166(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 168(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 170(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 172(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 174(%rax)
	movb	11(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 176(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 178(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 180(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 182(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 184(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 186(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 188(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 190(%rax)
	movb	12(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 192(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 194(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 196(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 198(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 200(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 202(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 204(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 206(%rax)
	movb	13(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 208(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 210(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 212(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 214(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 216(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 218(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 220(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 222(%rax)
	movb	14(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 224(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 226(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 228(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 230(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 232(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 234(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 236(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 238(%rax)
	movb	15(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 240(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 242(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 244(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 246(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 248(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 250(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 252(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 254(%rax)
	movb	16(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 256(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 258(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 260(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 262(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 264(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 266(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 268(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 270(%rax)
	movb	17(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 272(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 274(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 276(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 278(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 280(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 282(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 284(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 286(%rax)
	movb	18(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 288(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 290(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 292(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 294(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 296(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 298(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 300(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 302(%rax)
	movb	19(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 304(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 306(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 308(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 310(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 312(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 314(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 316(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 318(%rax)
	movb	20(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 320(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 322(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 324(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 326(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 328(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 330(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 332(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 334(%rax)
	movb	21(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 336(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 338(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 340(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 342(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 344(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 346(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 348(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 350(%rax)
	movb	22(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 352(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 354(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 356(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 358(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 360(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 362(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 364(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 366(%rax)
	movb	23(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 368(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 370(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 372(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 374(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 376(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 378(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 380(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 382(%rax)
	movb	24(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 384(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 386(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 388(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 390(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 392(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 394(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 396(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 398(%rax)
	movb	25(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 400(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 402(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 404(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 406(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 408(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 410(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 412(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 414(%rax)
	movb	26(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 416(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 418(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 420(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 422(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 424(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 426(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 428(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 430(%rax)
	movb	27(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 432(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 434(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 436(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 438(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 440(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 442(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 444(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 446(%rax)
	movb	28(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 448(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 450(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 452(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 454(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 456(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 458(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 460(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 462(%rax)
	movb	29(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 464(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 466(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 468(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 470(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 472(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 474(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 476(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 478(%rax)
	movb	30(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 480(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 482(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 484(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 486(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 488(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 490(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 492(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 494(%rax)
	movb	31(%rsi), %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 496(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 498(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 500(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 502(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 504(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 506(%rax)
	shrb	$1, %cl
	movzbw	%cl, %dx
	andw	$1, %dx
	imulw	$1665, %dx, %dx
	movw	%dx, 508(%rax)
	shrb	$1, %cl
	movzbw	%cl, %cx
	andw	$1, %cx
	imulw	$1665, %cx, %cx
	movw	%cx, 510(%rax)
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
	leal	(%rdi,%rsi), %esi
	sarl	$16, %esi
	movw	%si, (%rax,%rdx,2)
	leaq	1(%rdx), %rdx
L_poly_frommont$2:
	cmpq	$256, %rdx
	jb  	L_poly_frommont$3
	ret
L_poly_frombytes$1:
	movb	(%rax), %r8b
	movb	1(%rax), %r9b
	movb	2(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, (%rcx)
	movw	%r10w, 2(%rcx)
	movb	3(%rax), %r8b
	movb	4(%rax), %r9b
	movb	5(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 4(%rcx)
	movw	%r10w, 6(%rcx)
	movb	6(%rax), %r8b
	movb	7(%rax), %r9b
	movb	8(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 8(%rcx)
	movw	%r10w, 10(%rcx)
	movb	9(%rax), %r8b
	movb	10(%rax), %r9b
	movb	11(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 12(%rcx)
	movw	%r10w, 14(%rcx)
	movb	12(%rax), %r8b
	movb	13(%rax), %r9b
	movb	14(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 16(%rcx)
	movw	%r10w, 18(%rcx)
	movb	15(%rax), %r8b
	movb	16(%rax), %r9b
	movb	17(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 20(%rcx)
	movw	%r10w, 22(%rcx)
	movb	18(%rax), %r8b
	movb	19(%rax), %r9b
	movb	20(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 24(%rcx)
	movw	%r10w, 26(%rcx)
	movb	21(%rax), %r8b
	movb	22(%rax), %r9b
	movb	23(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 28(%rcx)
	movw	%r10w, 30(%rcx)
	movb	24(%rax), %r8b
	movb	25(%rax), %r9b
	movb	26(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 32(%rcx)
	movw	%r10w, 34(%rcx)
	movb	27(%rax), %r8b
	movb	28(%rax), %r9b
	movb	29(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 36(%rcx)
	movw	%r10w, 38(%rcx)
	movb	30(%rax), %r8b
	movb	31(%rax), %r9b
	movb	32(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 40(%rcx)
	movw	%r10w, 42(%rcx)
	movb	33(%rax), %r8b
	movb	34(%rax), %r9b
	movb	35(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 44(%rcx)
	movw	%r10w, 46(%rcx)
	movb	36(%rax), %r8b
	movb	37(%rax), %r9b
	movb	38(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 48(%rcx)
	movw	%r10w, 50(%rcx)
	movb	39(%rax), %r8b
	movb	40(%rax), %r9b
	movb	41(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 52(%rcx)
	movw	%r10w, 54(%rcx)
	movb	42(%rax), %r8b
	movb	43(%rax), %r9b
	movb	44(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 56(%rcx)
	movw	%r10w, 58(%rcx)
	movb	45(%rax), %r8b
	movb	46(%rax), %r9b
	movb	47(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 60(%rcx)
	movw	%r10w, 62(%rcx)
	movb	48(%rax), %r8b
	movb	49(%rax), %r9b
	movb	50(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 64(%rcx)
	movw	%r10w, 66(%rcx)
	movb	51(%rax), %r8b
	movb	52(%rax), %r9b
	movb	53(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 68(%rcx)
	movw	%r10w, 70(%rcx)
	movb	54(%rax), %r8b
	movb	55(%rax), %r9b
	movb	56(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 72(%rcx)
	movw	%r10w, 74(%rcx)
	movb	57(%rax), %r8b
	movb	58(%rax), %r9b
	movb	59(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 76(%rcx)
	movw	%r10w, 78(%rcx)
	movb	60(%rax), %r8b
	movb	61(%rax), %r9b
	movb	62(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 80(%rcx)
	movw	%r10w, 82(%rcx)
	movb	63(%rax), %r8b
	movb	64(%rax), %r9b
	movb	65(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 84(%rcx)
	movw	%r10w, 86(%rcx)
	movb	66(%rax), %r8b
	movb	67(%rax), %r9b
	movb	68(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 88(%rcx)
	movw	%r10w, 90(%rcx)
	movb	69(%rax), %r8b
	movb	70(%rax), %r9b
	movb	71(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 92(%rcx)
	movw	%r10w, 94(%rcx)
	movb	72(%rax), %r8b
	movb	73(%rax), %r9b
	movb	74(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 96(%rcx)
	movw	%r10w, 98(%rcx)
	movb	75(%rax), %r8b
	movb	76(%rax), %r9b
	movb	77(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 100(%rcx)
	movw	%r10w, 102(%rcx)
	movb	78(%rax), %r8b
	movb	79(%rax), %r9b
	movb	80(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 104(%rcx)
	movw	%r10w, 106(%rcx)
	movb	81(%rax), %r8b
	movb	82(%rax), %r9b
	movb	83(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 108(%rcx)
	movw	%r10w, 110(%rcx)
	movb	84(%rax), %r8b
	movb	85(%rax), %r9b
	movb	86(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 112(%rcx)
	movw	%r10w, 114(%rcx)
	movb	87(%rax), %r8b
	movb	88(%rax), %r9b
	movb	89(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 116(%rcx)
	movw	%r10w, 118(%rcx)
	movb	90(%rax), %r8b
	movb	91(%rax), %r9b
	movb	92(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 120(%rcx)
	movw	%r10w, 122(%rcx)
	movb	93(%rax), %r8b
	movb	94(%rax), %r9b
	movb	95(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 124(%rcx)
	movw	%r10w, 126(%rcx)
	movb	96(%rax), %r8b
	movb	97(%rax), %r9b
	movb	98(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 128(%rcx)
	movw	%r10w, 130(%rcx)
	movb	99(%rax), %r8b
	movb	100(%rax), %r9b
	movb	101(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 132(%rcx)
	movw	%r10w, 134(%rcx)
	movb	102(%rax), %r8b
	movb	103(%rax), %r9b
	movb	104(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 136(%rcx)
	movw	%r10w, 138(%rcx)
	movb	105(%rax), %r8b
	movb	106(%rax), %r9b
	movb	107(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 140(%rcx)
	movw	%r10w, 142(%rcx)
	movb	108(%rax), %r8b
	movb	109(%rax), %r9b
	movb	110(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 144(%rcx)
	movw	%r10w, 146(%rcx)
	movb	111(%rax), %r8b
	movb	112(%rax), %r9b
	movb	113(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 148(%rcx)
	movw	%r10w, 150(%rcx)
	movb	114(%rax), %r8b
	movb	115(%rax), %r9b
	movb	116(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 152(%rcx)
	movw	%r10w, 154(%rcx)
	movb	117(%rax), %r8b
	movb	118(%rax), %r9b
	movb	119(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 156(%rcx)
	movw	%r10w, 158(%rcx)
	movb	120(%rax), %r8b
	movb	121(%rax), %r9b
	movb	122(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 160(%rcx)
	movw	%r10w, 162(%rcx)
	movb	123(%rax), %r8b
	movb	124(%rax), %r9b
	movb	125(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 164(%rcx)
	movw	%r10w, 166(%rcx)
	movb	126(%rax), %r8b
	movb	127(%rax), %r9b
	movb	128(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 168(%rcx)
	movw	%r10w, 170(%rcx)
	movb	129(%rax), %r8b
	movb	130(%rax), %r9b
	movb	131(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 172(%rcx)
	movw	%r10w, 174(%rcx)
	movb	132(%rax), %r8b
	movb	133(%rax), %r9b
	movb	134(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 176(%rcx)
	movw	%r10w, 178(%rcx)
	movb	135(%rax), %r8b
	movb	136(%rax), %r9b
	movb	137(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 180(%rcx)
	movw	%r10w, 182(%rcx)
	movb	138(%rax), %r8b
	movb	139(%rax), %r9b
	movb	140(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 184(%rcx)
	movw	%r10w, 186(%rcx)
	movb	141(%rax), %r8b
	movb	142(%rax), %r9b
	movb	143(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 188(%rcx)
	movw	%r10w, 190(%rcx)
	movb	144(%rax), %r8b
	movb	145(%rax), %r9b
	movb	146(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 192(%rcx)
	movw	%r10w, 194(%rcx)
	movb	147(%rax), %r8b
	movb	148(%rax), %r9b
	movb	149(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 196(%rcx)
	movw	%r10w, 198(%rcx)
	movb	150(%rax), %r8b
	movb	151(%rax), %r9b
	movb	152(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 200(%rcx)
	movw	%r10w, 202(%rcx)
	movb	153(%rax), %r8b
	movb	154(%rax), %r9b
	movb	155(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 204(%rcx)
	movw	%r10w, 206(%rcx)
	movb	156(%rax), %r8b
	movb	157(%rax), %r9b
	movb	158(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 208(%rcx)
	movw	%r10w, 210(%rcx)
	movb	159(%rax), %r8b
	movb	160(%rax), %r9b
	movb	161(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 212(%rcx)
	movw	%r10w, 214(%rcx)
	movb	162(%rax), %r8b
	movb	163(%rax), %r9b
	movb	164(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 216(%rcx)
	movw	%r10w, 218(%rcx)
	movb	165(%rax), %r8b
	movb	166(%rax), %r9b
	movb	167(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 220(%rcx)
	movw	%r10w, 222(%rcx)
	movb	168(%rax), %r8b
	movb	169(%rax), %r9b
	movb	170(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 224(%rcx)
	movw	%r10w, 226(%rcx)
	movb	171(%rax), %r8b
	movb	172(%rax), %r9b
	movb	173(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 228(%rcx)
	movw	%r10w, 230(%rcx)
	movb	174(%rax), %r8b
	movb	175(%rax), %r9b
	movb	176(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 232(%rcx)
	movw	%r10w, 234(%rcx)
	movb	177(%rax), %r8b
	movb	178(%rax), %r9b
	movb	179(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 236(%rcx)
	movw	%r10w, 238(%rcx)
	movb	180(%rax), %r8b
	movb	181(%rax), %r9b
	movb	182(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 240(%rcx)
	movw	%r10w, 242(%rcx)
	movb	183(%rax), %r8b
	movb	184(%rax), %r9b
	movb	185(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 244(%rcx)
	movw	%r10w, 246(%rcx)
	movb	186(%rax), %r8b
	movb	187(%rax), %r9b
	movb	188(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 248(%rcx)
	movw	%r10w, 250(%rcx)
	movb	189(%rax), %r8b
	movb	190(%rax), %r9b
	movb	191(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 252(%rcx)
	movw	%r10w, 254(%rcx)
	movb	192(%rax), %r8b
	movb	193(%rax), %r9b
	movb	194(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 256(%rcx)
	movw	%r10w, 258(%rcx)
	movb	195(%rax), %r8b
	movb	196(%rax), %r9b
	movb	197(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 260(%rcx)
	movw	%r10w, 262(%rcx)
	movb	198(%rax), %r8b
	movb	199(%rax), %r9b
	movb	200(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 264(%rcx)
	movw	%r10w, 266(%rcx)
	movb	201(%rax), %r8b
	movb	202(%rax), %r9b
	movb	203(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 268(%rcx)
	movw	%r10w, 270(%rcx)
	movb	204(%rax), %r8b
	movb	205(%rax), %r9b
	movb	206(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 272(%rcx)
	movw	%r10w, 274(%rcx)
	movb	207(%rax), %r8b
	movb	208(%rax), %r9b
	movb	209(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 276(%rcx)
	movw	%r10w, 278(%rcx)
	movb	210(%rax), %r8b
	movb	211(%rax), %r9b
	movb	212(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 280(%rcx)
	movw	%r10w, 282(%rcx)
	movb	213(%rax), %r8b
	movb	214(%rax), %r9b
	movb	215(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 284(%rcx)
	movw	%r10w, 286(%rcx)
	movb	216(%rax), %r8b
	movb	217(%rax), %r9b
	movb	218(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 288(%rcx)
	movw	%r10w, 290(%rcx)
	movb	219(%rax), %r8b
	movb	220(%rax), %r9b
	movb	221(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 292(%rcx)
	movw	%r10w, 294(%rcx)
	movb	222(%rax), %r8b
	movb	223(%rax), %r9b
	movb	224(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 296(%rcx)
	movw	%r10w, 298(%rcx)
	movb	225(%rax), %r8b
	movb	226(%rax), %r9b
	movb	227(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 300(%rcx)
	movw	%r10w, 302(%rcx)
	movb	228(%rax), %r8b
	movb	229(%rax), %r9b
	movb	230(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 304(%rcx)
	movw	%r10w, 306(%rcx)
	movb	231(%rax), %r8b
	movb	232(%rax), %r9b
	movb	233(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 308(%rcx)
	movw	%r10w, 310(%rcx)
	movb	234(%rax), %r8b
	movb	235(%rax), %r9b
	movb	236(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 312(%rcx)
	movw	%r10w, 314(%rcx)
	movb	237(%rax), %r8b
	movb	238(%rax), %r9b
	movb	239(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 316(%rcx)
	movw	%r10w, 318(%rcx)
	movb	240(%rax), %r8b
	movb	241(%rax), %r9b
	movb	242(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 320(%rcx)
	movw	%r10w, 322(%rcx)
	movb	243(%rax), %r8b
	movb	244(%rax), %r9b
	movb	245(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 324(%rcx)
	movw	%r10w, 326(%rcx)
	movb	246(%rax), %r8b
	movb	247(%rax), %r9b
	movb	248(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 328(%rcx)
	movw	%r10w, 330(%rcx)
	movb	249(%rax), %r8b
	movb	250(%rax), %r9b
	movb	251(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 332(%rcx)
	movw	%r10w, 334(%rcx)
	movb	252(%rax), %r8b
	movb	253(%rax), %r9b
	movb	254(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 336(%rcx)
	movw	%r10w, 338(%rcx)
	movb	255(%rax), %r8b
	movb	256(%rax), %r9b
	movb	257(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 340(%rcx)
	movw	%r10w, 342(%rcx)
	movb	258(%rax), %r8b
	movb	259(%rax), %r9b
	movb	260(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 344(%rcx)
	movw	%r10w, 346(%rcx)
	movb	261(%rax), %r8b
	movb	262(%rax), %r9b
	movb	263(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 348(%rcx)
	movw	%r10w, 350(%rcx)
	movb	264(%rax), %r8b
	movb	265(%rax), %r9b
	movb	266(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 352(%rcx)
	movw	%r10w, 354(%rcx)
	movb	267(%rax), %r8b
	movb	268(%rax), %r9b
	movb	269(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 356(%rcx)
	movw	%r10w, 358(%rcx)
	movb	270(%rax), %r8b
	movb	271(%rax), %r9b
	movb	272(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 360(%rcx)
	movw	%r10w, 362(%rcx)
	movb	273(%rax), %r8b
	movb	274(%rax), %r9b
	movb	275(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 364(%rcx)
	movw	%r10w, 366(%rcx)
	movb	276(%rax), %r8b
	movb	277(%rax), %r9b
	movb	278(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 368(%rcx)
	movw	%r10w, 370(%rcx)
	movb	279(%rax), %r8b
	movb	280(%rax), %r9b
	movb	281(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 372(%rcx)
	movw	%r10w, 374(%rcx)
	movb	282(%rax), %r8b
	movb	283(%rax), %r9b
	movb	284(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 376(%rcx)
	movw	%r10w, 378(%rcx)
	movb	285(%rax), %r8b
	movb	286(%rax), %r9b
	movb	287(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 380(%rcx)
	movw	%r10w, 382(%rcx)
	movb	288(%rax), %r8b
	movb	289(%rax), %r9b
	movb	290(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 384(%rcx)
	movw	%r10w, 386(%rcx)
	movb	291(%rax), %r8b
	movb	292(%rax), %r9b
	movb	293(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 388(%rcx)
	movw	%r10w, 390(%rcx)
	movb	294(%rax), %r8b
	movb	295(%rax), %r9b
	movb	296(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 392(%rcx)
	movw	%r10w, 394(%rcx)
	movb	297(%rax), %r8b
	movb	298(%rax), %r9b
	movb	299(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 396(%rcx)
	movw	%r10w, 398(%rcx)
	movb	300(%rax), %r8b
	movb	301(%rax), %r9b
	movb	302(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 400(%rcx)
	movw	%r10w, 402(%rcx)
	movb	303(%rax), %r8b
	movb	304(%rax), %r9b
	movb	305(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 404(%rcx)
	movw	%r10w, 406(%rcx)
	movb	306(%rax), %r8b
	movb	307(%rax), %r9b
	movb	308(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 408(%rcx)
	movw	%r10w, 410(%rcx)
	movb	309(%rax), %r8b
	movb	310(%rax), %r9b
	movb	311(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 412(%rcx)
	movw	%r10w, 414(%rcx)
	movb	312(%rax), %r8b
	movb	313(%rax), %r9b
	movb	314(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 416(%rcx)
	movw	%r10w, 418(%rcx)
	movb	315(%rax), %r8b
	movb	316(%rax), %r9b
	movb	317(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 420(%rcx)
	movw	%r10w, 422(%rcx)
	movb	318(%rax), %r8b
	movb	319(%rax), %r9b
	movb	320(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 424(%rcx)
	movw	%r10w, 426(%rcx)
	movb	321(%rax), %r8b
	movb	322(%rax), %r9b
	movb	323(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 428(%rcx)
	movw	%r10w, 430(%rcx)
	movb	324(%rax), %r8b
	movb	325(%rax), %r9b
	movb	326(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 432(%rcx)
	movw	%r10w, 434(%rcx)
	movb	327(%rax), %r8b
	movb	328(%rax), %r9b
	movb	329(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 436(%rcx)
	movw	%r10w, 438(%rcx)
	movb	330(%rax), %r8b
	movb	331(%rax), %r9b
	movb	332(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 440(%rcx)
	movw	%r10w, 442(%rcx)
	movb	333(%rax), %r8b
	movb	334(%rax), %r9b
	movb	335(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 444(%rcx)
	movw	%r10w, 446(%rcx)
	movb	336(%rax), %r8b
	movb	337(%rax), %r9b
	movb	338(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 448(%rcx)
	movw	%r10w, 450(%rcx)
	movb	339(%rax), %r8b
	movb	340(%rax), %r9b
	movb	341(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 452(%rcx)
	movw	%r10w, 454(%rcx)
	movb	342(%rax), %r8b
	movb	343(%rax), %r9b
	movb	344(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 456(%rcx)
	movw	%r10w, 458(%rcx)
	movb	345(%rax), %r8b
	movb	346(%rax), %r9b
	movb	347(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 460(%rcx)
	movw	%r10w, 462(%rcx)
	movb	348(%rax), %r8b
	movb	349(%rax), %r9b
	movb	350(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 464(%rcx)
	movw	%r10w, 466(%rcx)
	movb	351(%rax), %r8b
	movb	352(%rax), %r9b
	movb	353(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 468(%rcx)
	movw	%r10w, 470(%rcx)
	movb	354(%rax), %r8b
	movb	355(%rax), %r9b
	movb	356(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 472(%rcx)
	movw	%r10w, 474(%rcx)
	movb	357(%rax), %r8b
	movb	358(%rax), %r9b
	movb	359(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 476(%rcx)
	movw	%r10w, 478(%rcx)
	movb	360(%rax), %r8b
	movb	361(%rax), %r9b
	movb	362(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 480(%rcx)
	movw	%r10w, 482(%rcx)
	movb	363(%rax), %r8b
	movb	364(%rax), %r9b
	movb	365(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 484(%rcx)
	movw	%r10w, 486(%rcx)
	movb	366(%rax), %r8b
	movb	367(%rax), %r9b
	movb	368(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 488(%rcx)
	movw	%r10w, 490(%rcx)
	movb	369(%rax), %r8b
	movb	370(%rax), %r9b
	movb	371(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 492(%rcx)
	movw	%r10w, 494(%rcx)
	movb	372(%rax), %r8b
	movb	373(%rax), %r9b
	movb	374(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 496(%rcx)
	movw	%r10w, 498(%rcx)
	movb	375(%rax), %r8b
	movb	376(%rax), %r9b
	movb	377(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 500(%rcx)
	movw	%r10w, 502(%rcx)
	movb	378(%rax), %r8b
	movb	379(%rax), %r9b
	movb	380(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 504(%rcx)
	movw	%r10w, 506(%rcx)
	movb	381(%rax), %r8b
	movb	382(%rax), %r9b
	movb	383(%rax), %r10b
	movzbw	%r8b, %r8w
	movzbw	%r9b, %r11w
	andw	$15, %r11w
	shlw	$8, %r11w
	orw 	%r11w, %r8w
	movzbw	%r10b, %r10w
	shlw	$4, %r10w
	movzbw	%r9b, %r9w
	shrw	$4, %r9w
	orw 	%r9w, %r10w
	movw	%r8w, 508(%rcx)
	movw	%r10w, 510(%rcx)
	ret
L_poly_decompress$1:
	movq	$0, %rsi
	movq	$0, %r8
	jmp 	L_poly_decompress$2
L_poly_decompress$3:
	movb	(%rax,%rsi), %r9b
	movzbw	%r9b, %r10w
	movzbw	%r9b, %r9w
	andw	$15, %r10w
	shrw	$4, %r9w
	imulw	$3329, %r10w, %r10w
	imulw	$3329, %r9w, %r9w
	leaw	8(%r10), %r10w
	leaw	8(%r9), %r9w
	shrw	$4, %r10w
	shrw	$4, %r9w
	movw	%r10w, (%rcx,%r8,2)
	leaq	1(%r8), %r8
	movw	%r9w, (%rcx,%r8,2)
	leaq	1(%r8), %r8
	leaq	1(%rsi), %rsi
L_poly_decompress$2:
	cmpq	$128, %rsi
	jb  	L_poly_decompress$3
	ret
L_poly_compress$1:
	call	L_poly_csubq$1
L_poly_compress$4:
	movq	$0, %rdx
	movq	$0, %rsi
	jmp 	L_poly_compress$2
L_poly_compress$3:
	movw	(%rax,%rsi,2), %di
	movzwl	%di, %edi
	shll	$4, %edi
	leal	1665(%rdi), %edi
	imull	$80635, %edi, %edi
	shrl	$28, %edi
	andl	$15, %edi
	leaq	1(%rsi), %rsi
	movw	(%rax,%rsi,2), %r8w
	movzwl	%r8w, %r8d
	shll	$4, %r8d
	leal	1665(%r8), %r8d
	imull	$80635, %r8d, %r8d
	shrl	$28, %r8d
	andl	$15, %r8d
	shll	$4, %r8d
	orl 	%r8d, %edi
	movb	%dil, (%rcx,%rdx)
	leaq	1(%rdx), %rdx
	leaq	1(%rsi), %rsi
L_poly_compress$2:
	cmpq	$128, %rdx
	jb  	L_poly_compress$3
	ret
L_poly_basemul$1:
	movq	%rdx, 8(%rsp)
	movq	$64, %rdx
	movq	$0, %r10
	jmp 	L_poly_basemul$2
L_poly_basemul$3:
	leaq	glob_data + 448(%rip), %rsi
	movw	(%rsi,%rdx,2), %si
	leaq	1(%rdx), %rdx
	movw	(%rax,%r10,2), %r8w
	movw	(%rcx,%r10,2), %r9w
	leaq	1(%r10), %rbx
	movw	(%rax,%rbx,2), %r10w
	movw	(%rcx,%rbx,2), %r11w
	leaq	-1(%rbx), %rbx
	movswl	%r10w, %ebp
	movswl	%r11w, %r12d
	imull	%r12d, %ebp
	imull	$-218038272, %ebp, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r12d
	leal	(%r12,%rbp), %ebp
	sarl	$16, %ebp
	movswl	%bp, %ebp
	movswl	%si, %r12d
	imull	%r12d, %ebp
	imull	$-218038272, %ebp, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r12d
	leal	(%r12,%rbp), %ebp
	sarl	$16, %ebp
	movswl	%r8w, %r12d
	movswl	%r9w, %r13d
	imull	%r13d, %r12d
	imull	$-218038272, %r12d, %r13d
	sarl	$16, %r13d
	imull	$-3329, %r13d, %r13d
	leal	(%r13,%r12), %r12d
	sarl	$16, %r12d
	leaw	(%rbp,%r12), %bp
	movswl	%r8w, %r8d
	movswl	%r11w, %r11d
	imull	%r11d, %r8d
	imull	$-218038272, %r8d, %r11d
	sarl	$16, %r11d
	imull	$-3329, %r11d, %r11d
	leal	(%r11,%r8), %r8d
	sarl	$16, %r8d
	movswl	%r10w, %r10d
	movswl	%r9w, %r9d
	imull	%r9d, %r10d
	imull	$-218038272, %r10d, %r9d
	sarl	$16, %r9d
	imull	$-3329, %r9d, %r9d
	leal	(%r9,%r10), %r9d
	sarl	$16, %r9d
	leaw	(%r8,%r9), %r8w
	movq	8(%rsp), %r9
	movw	%bp, (%r9,%rbx,2)
	leaq	1(%rbx), %r10
	movw	%r8w, (%r9,%r10,2)
	movq	%r9, 16(%rsp)
	negw	%si
	leaq	1(%r10), %r10
	movw	(%rax,%r10,2), %r8w
	movw	(%rcx,%r10,2), %r9w
	leaq	1(%r10), %rbx
	movw	(%rax,%rbx,2), %r10w
	movw	(%rcx,%rbx,2), %r11w
	leaq	-1(%rbx), %rbx
	movswl	%r10w, %ebp
	movswl	%r11w, %r12d
	imull	%r12d, %ebp
	imull	$-218038272, %ebp, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r12d
	leal	(%r12,%rbp), %ebp
	sarl	$16, %ebp
	movswl	%bp, %ebp
	movswl	%si, %esi
	imull	%esi, %ebp
	imull	$-218038272, %ebp, %esi
	sarl	$16, %esi
	imull	$-3329, %esi, %esi
	leal	(%rsi,%rbp), %esi
	sarl	$16, %esi
	movswl	%r8w, %ebp
	movswl	%r9w, %r12d
	imull	%r12d, %ebp
	imull	$-218038272, %ebp, %r12d
	sarl	$16, %r12d
	imull	$-3329, %r12d, %r12d
	leal	(%r12,%rbp), %ebp
	sarl	$16, %ebp
	leaw	(%rsi,%rbp), %si
	movswl	%r8w, %r8d
	movswl	%r11w, %r11d
	imull	%r11d, %r8d
	imull	$-218038272, %r8d, %r11d
	sarl	$16, %r11d
	imull	$-3329, %r11d, %r11d
	leal	(%r11,%r8), %r8d
	sarl	$16, %r8d
	movswl	%r10w, %r10d
	movswl	%r9w, %r9d
	imull	%r9d, %r10d
	imull	$-218038272, %r10d, %r9d
	sarl	$16, %r9d
	imull	$-3329, %r9d, %r9d
	leal	(%r9,%r10), %r9d
	sarl	$16, %r9d
	leaw	(%r8,%r9), %r8w
	movq	16(%rsp), %r9
	movw	%si, (%r9,%rbx,2)
	leaq	1(%rbx), %rsi
	movw	%r8w, (%r9,%rsi,2)
	leaq	1(%rsi), %r10
L_poly_basemul$2:
	cmpq	$256, %r10
	jb  	L_poly_basemul$3
	ret
L_poly_csubq$1:
	movq	$0, %r8
	jmp 	L_poly_csubq$2
L_poly_csubq$3:
	movw	(%rax,%r8,2), %r9w
	leaw	-3329(%r9), %r9w
	movw	%r9w, %r10w
	sarw	$15, %r10w
	andw	$3329, %r10w
	leaw	(%r9,%r10), %r9w
	movw	%r9w, (%rax,%r8,2)
	leaq	1(%r8), %r8
L_poly_csubq$2:
	cmpq	$256, %r8
	jb  	L_poly_csubq$3
	ret
L_poly_add2$1:
	movq	$0, %rdx
	jmp 	L_poly_add2$2
L_poly_add2$3:
	movw	(%rax,%rdx,2), %si
	movw	(%rcx,%rdx,2), %r8w
	leaw	(%rsi,%r8), %si
	movw	%si, (%rax,%rdx,2)
	leaq	1(%rdx), %rdx
L_poly_add2$2:
	cmpq	$256, %rdx
	jb  	L_poly_add2$3
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
      .byte -91
      .byte 6
      .byte 15
      .byte 7
      .byte -76
      .byte 5
      .byte 67
      .byte 9
      .byte 34
      .byte 9
      .byte 29
      .byte 9
      .byte 52
      .byte 1
      .byte 108
      .byte 0
      .byte 35
      .byte 11
      .byte 102
      .byte 3
      .byte 86
      .byte 3
      .byte -26
      .byte 5
      .byte -25
      .byte 9
      .byte -2
      .byte 4
      .byte -6
      .byte 5
      .byte -95
      .byte 4
      .byte 123
      .byte 6
      .byte -93
      .byte 4
      .byte 37
      .byte 12
      .byte 106
      .byte 3
      .byte 55
      .byte 5
      .byte 63
      .byte 8
      .byte -120
      .byte 0
      .byte -65
      .byte 4
      .byte -127
      .byte 11
      .byte -71
      .byte 5
      .byte 5
      .byte 5
      .byte -41
      .byte 7
      .byte -97
      .byte 10
      .byte -90
      .byte 10
      .byte -72
      .byte 8
      .byte -48
      .byte 9
      .byte 75
      .byte 0
      .byte -100
      .byte 0
      .byte -72
      .byte 11
      .byte 95
      .byte 11
      .byte -92
      .byte 11
      .byte 104
      .byte 3
      .byte 125
      .byte 10
      .byte 54
      .byte 6
      .byte -94
      .byte 8
      .byte 90
      .byte 2
      .byte 54
      .byte 7
      .byte 9
      .byte 3
      .byte -109
      .byte 0
      .byte 122
      .byte 8
      .byte -9
      .byte 9
      .byte -10
      .byte 0
      .byte -116
      .byte 6
      .byte -37
      .byte 6
      .byte -52
      .byte 1
      .byte 35
      .byte 1
      .byte -21
      .byte 0
      .byte 80
      .byte 12
      .byte -74
      .byte 10
      .byte 91
      .byte 11
      .byte -104
      .byte 12
      .byte -13
      .byte 6
      .byte -102
      .byte 9
      .byte -29
      .byte 4
      .byte -74
      .byte 9
      .byte -42
      .byte 10
      .byte 83
      .byte 11
      .byte 79
      .byte 4
      .byte -5
      .byte 4
      .byte 92
      .byte 10
      .byte 41
      .byte 4
      .byte 65
      .byte 11
      .byte -43
      .byte 2
      .byte -28
      .byte 5
      .byte 64
      .byte 9
      .byte -114
      .byte 1
      .byte -73
      .byte 3
      .byte -9
      .byte 0
      .byte -115
      .byte 5
      .byte -106
      .byte 12
      .byte -61
      .byte 9
      .byte 15
      .byte 1
      .byte 90
      .byte 0
      .byte 85
      .byte 3
      .byte 68
      .byte 7
      .byte -125
      .byte 12
      .byte -118
      .byte 4
      .byte 82
      .byte 6
      .byte -102
      .byte 2
      .byte 64
      .byte 1
      .byte 8
      .byte 0
      .byte -3
      .byte 10
      .byte 8
      .byte 6
      .byte 26
      .byte 1
      .byte 46
      .byte 7
      .byte 13
      .byte 5
      .byte 10
      .byte 9
      .byte 40
      .byte 2
      .byte 117
      .byte 10
      .byte 58
      .byte 8
      .byte 35
      .byte 6
      .byte -51
      .byte 0
      .byte 102
      .byte 11
      .byte 6
      .byte 6
      .byte -95
      .byte 10
      .byte 37
      .byte 10
      .byte 8
      .byte 9
      .byte -87
      .byte 2
      .byte -126
      .byte 0
      .byte 66
      .byte 6
      .byte 79
      .byte 7
      .byte 61
      .byte 3
      .byte -126
      .byte 11
      .byte -7
      .byte 11
      .byte 45
      .byte 5
      .byte -60
      .byte 10
      .byte 69
      .byte 7
      .byte -62
      .byte 5
      .byte -78
      .byte 4
      .byte 63
      .byte 9
      .byte 75
      .byte 12
      .byte -40
      .byte 6
      .byte -109
      .byte 10
      .byte -85
      .byte 0
      .byte 55
      .byte 12
      .byte -30
      .byte 11
      .byte 115
      .byte 7
      .byte 44
      .byte 7
      .byte -19
      .byte 5
      .byte 103
      .byte 1
      .byte -10
      .byte 2
      .byte -95
      .byte 5
      .byte -19
      .byte 8
      .byte 11
      .byte 10
      .byte -102
      .byte 11
      .byte 20
      .byte 7
      .byte -43
      .byte 5
      .byte -114
      .byte 5
      .byte 31
      .byte 1
      .byte -54
      .byte 0
      .byte 86
      .byte 12
      .byte 110
      .byte 2
      .byte 41
      .byte 6
      .byte -74
      .byte 0
      .byte -62
      .byte 3
      .byte 79
      .byte 8
      .byte 63
      .byte 7
      .byte -68
      .byte 5
      .byte 61
      .byte 2
      .byte -44
      .byte 7
      .byte 8
      .byte 1
      .byte 127
      .byte 1
      .byte -60
      .byte 9
      .byte -78
      .byte 5
      .byte -65
      .byte 6
      .byte 127
      .byte 12
      .byte 88
      .byte 10
      .byte -7
      .byte 3
      .byte -36
      .byte 2
      .byte 96
      .byte 2
      .byte -5
      .byte 6
      .byte -101
      .byte 1
      .byte 52
      .byte 12
      .byte -34
      .byte 6
      .byte -57
      .byte 4
      .byte -116
      .byte 2
      .byte -39
      .byte 10
      .byte -9
      .byte 3
      .byte -12
      .byte 7
      .byte -45
      .byte 5
      .byte -25
      .byte 11
      .byte -7
      .byte 6
      .byte 4
      .byte 2
      .byte -7
      .byte 12
      .byte -63
      .byte 11
      .byte 103
      .byte 10
      .byte -81
      .byte 6
      .byte 119
      .byte 8
      .byte 126
      .byte 0
      .byte -67
      .byte 5
      .byte -84
      .byte 9
      .byte -89
      .byte 12
      .byte -14
      .byte 11
      .byte 62
      .byte 3
      .byte 107
      .byte 0
      .byte 116
      .byte 7
      .byte 10
      .byte 12
      .byte 74
      .byte 9
      .byte 115
      .byte 11
      .byte -63
      .byte 3
      .byte 29
      .byte 7
      .byte 44
      .byte 10
      .byte -64
      .byte 1
      .byte -40
      .byte 8
      .byte -91
      .byte 2
      .byte 6
      .byte 8
      .byte -78
      .byte 8
      .byte -82
      .byte 1
      .byte 43
      .byte 2
      .byte 75
      .byte 3
      .byte 30
      .byte 8
      .byte 103
      .byte 3
      .byte 14
      .byte 6
      .byte 105
      .byte 0
      .byte -90
      .byte 1
      .byte 75
      .byte 2
      .byte -79
      .byte 0
      .byte 22
      .byte 12
      .byte -34
      .byte 11
      .byte 53
      .byte 11
      .byte 38
      .byte 6
      .byte 117
      .byte 6
      .byte 11
      .byte 12
      .byte 10
      .byte 3
      .byte -121
      .byte 4
      .byte 110
      .byte 12
      .byte -8
      .byte 9
      .byte -53
      .byte 5
      .byte -89
      .byte 10
      .byte 95
      .byte 4
      .byte -53
      .byte 6
      .byte -124
      .byte 2
      .byte -103
      .byte 9
      .byte 93
      .byte 1
      .byte -94
      .byte 1
      .byte 73
      .byte 1
      .byte 101
      .byte 12
      .byte -74
      .byte 12
      .byte 49
      .byte 3
      .byte 73
      .byte 4
      .byte 91
      .byte 2
      .byte 98
      .byte 2
      .byte 42
      .byte 5
      .byte -4
      .byte 7
      .byte 72
      .byte 7
      .byte -128
      .byte 1
      .byte 66
      .byte 8
      .byte 121
      .byte 12
      .byte -62
      .byte 4
      .byte -54
      .byte 7
      .byte -105
      .byte 9
      .byte -36
      .byte 0
      .byte 94
      .byte 8
      .byte -122
      .byte 6
      .byte 96
      .byte 8
      .byte 7
      .byte 7
      .byte 3
      .byte 8
      .byte 26
      .byte 3
      .byte 27
      .byte 7
      .byte -85
      .byte 9
      .byte -101
      .byte 9
      .byte -34
      .byte 1
      .byte -107
      .byte 12
      .byte -51
      .byte 11
      .byte -28
      .byte 3
      .byte -33
      .byte 3
      .byte -66
      .byte 3
      .byte 77
      .byte 7
      .byte -14
      .byte 5
      .byte 92
      .byte 6
