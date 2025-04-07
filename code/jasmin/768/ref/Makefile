# -*- Makefile -*-

-include ../../../Makefile.conf

CKP    := ../../../kyber/ref
CC     ?= /usr/bin/gcc
CFLAGS := -Wall -Wextra -g -O3 -fomit-frame-pointer -Wno-implicit-function-declaration
JFLAGS := ${JADDFLAGS}
OS     := $(shell uname -s)

.SECONDARY: jkem.s

default: test speed

test: test/test_kem

speed: test/speed_kem

JINC = kem.jinc params.jinc ../../common/ref/params.jinc ../../common/ref/zetas.jinc ../../common/ref/verify.jinc ../../common/ref/reduce.jinc \
       ../../common/ref/polyvec.jinc polyvec.jinc ../../common/ref/poly.jinc poly.jinc indcpa.jinc ../../common/ref/gen_matrix.jinc ../../common/ref/mlkem_keccak_ref.jinc 


SOURCES = $(CKP)/verify.c $(CKP)/randombytes.c $(CKP)/poly.c $(CKP)/polyvec.c \
          $(CKP)/cbd.c $(CKP)/fips202.c $(CKP)/ntt.c $(CKP)/reduce.c \
          $(CKP)/symmetric-shake.c $(CKP)/indcpa.c $(CKP)/kem.c\
          $(JASMIN)/syscall/jasmin_syscall.c


test/test_kem: test/test_kem.c $(JINC) $(SOURCES) jkem.s
	$(CC) $(CFLAGS) -o $@ $(SOURCES) jkem.s $<


test/speed_kem: test/speed_kem.c $(JINC) $(SOURCES) jkem.s
	$(CC) $(CFLAGS) -o $@ $(SOURCES) jkem.s $<

%.s: %.jazz
	$(JASMINC) -o $@ $(JFLAGS) $^ 


.PHONY: ct clean

ct:
	$(JASMINCT) --infer jkem.jazz

sct:
	$(JASMINCT) --sct jkem.jazz

clean:
	-rm -f *.s
	-rm -f jkem.o
	-rm -f test/test_kem
	-rm -f test/speed_kem
ifeq ($(OS),Darwin)
	-rm -rf test/*.dSYM
endif
