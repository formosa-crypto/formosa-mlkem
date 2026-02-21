# -*- Makefile -*-

-include ../../../Makefile.conf

CKP    := ../../../kyber/ref
CC     ?= /usr/bin/gcc
CFLAGS := -Wall -Wextra -g -O3 -fomit-frame-pointer -Wno-implicit-function-declaration -D KYBER_K=4
JFLAGS := ${JADDFLAGS}
OS     := $(shell uname -s)

.SECONDARY: jkem.s

default:
	@true

JINC = kem.jinc params.jinc ../../common/ref/params.jinc ../../common/ref/zetas.jinc ../../common/ref/verify.jinc ../../common/ref/reduce.jinc \
       ../../common/ref/polyvec.jinc polyvec.jinc ../../common/ref/poly.jinc poly.jinc ../../common/ref/indcpa.jinc ../../common/ref/gen_matrix.jinc ../../common/ref/mlkem_keccak_ref.jinc 

jkem.s: jkem.jazz $(JINC)
	$(JASMINC) -o $@ $(JFLAGS) jkem.jazz


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
