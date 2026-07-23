# -*- Makefile -*-

-include ../../../Makefile.conf

CC     ?= arch -x86_64 gcc
CFLAGS := -Wall -Wextra -g -O3 -fomit-frame-pointer -Wno-implicit-function-declaration -D KYBER_K=4
JFLAGS := -system linux ${JADDFLAGS}

.SECONDARY: jkem.s


default:
	@true

JINC = kem.jinc ../../common/avx2/params.jinc params.jinc ../../common/avx2/consts.jinc ../../common/avx2/verify.jinc ../../common/avx2/reduce.jinc \
       ../../common/avx2/polyvec.jinc polyvec.jinc ../../common/avx2/poly.jinc poly.jinc indcpa.jinc gen_matrix.jinc ../../common/avx2/mlkem_keccak_avx2.jinc

jkem.s: $(JINC) jkem.jazz
	$(JASMINC) -o jkem.s $(JFLAGS) jkem.jazz

pqcp: $(JINC)  jkem.s
	$(JASMINC) -ptyping $(JFLAGS) jkem.jazz > jkem_pqcp.jazz
	$(JASMINC) -o jkem_pqcp.s $(JFLAGS) jkem_pqcp.jazz
	diff jkem_pqcp.s jkem.s > /dev/null; \
	if [ $$? -eq 0 ]; then echo "\nALL GOOD!"; else echo "\n!!!ASSEMBLY FILE AFTER TYPING NOT SAME!!!"; fi

.PHONY: ct clean

ct:
	$(JASMINCT) jkem.jazz

sct:
	$(JASMINCT) --sct jkem.jazz

clean:
	-rm -f *.s
	-rm -f jkem.o
