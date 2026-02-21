# -*- Makefile -*-

-include ../../../Makefile.conf

CKP    := ../../../kyber/ref
CC     ?= /usr/bin/gcc
CFLAGS := -Wall -Wextra -g -O3 -fomit-frame-pointer -Wno-implicit-function-declaration
JFLAGS := ${JADDFLAGS}
OS     := $(shell uname -s)

.SECONDARY: jkem.s

default:
	@true

JINC = kem.jinc ../../common/avx2/params.jinc params.jinc ../../common/avx2/consts.jinc ../../common/avx2/verify.jinc ../../common/avx2/reduce.jinc \
       ../../common/avx2/polyvec.jinc polyvec.jinc ../../common/avx2/poly.jinc poly.jinc indcpa.jinc gen_matrix.jinc ../../common/avx2/mlkem_keccak_avx2.jinc

%.s: %.jazz
	$(JASMINC) -o $@ $(JFLAGS) $^ 

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
	-rm -f test/speed_kem
ifeq ($(OS),Darwin)
	-rm -rf test/*.dSYM
endif
