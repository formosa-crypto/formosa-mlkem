# -*- Makefile -*-

-include ../../Makefile.conf

CKP    := ../../kyber/ref
CC     ?= /usr/bin/gcc
CFLAGS := -Wall -Wextra -g -O3 -fomit-frame-pointer -Wno-implicit-function-declaration
JFLAGS := ${JADDFLAGS}
OS     := $(shell uname -s)

.SECONDARY: jkem.s

default: test speed

test: test/test_kem

speed: test/speed_kem

JINC = kem.jinc ../mlkem_avx2/params.jinc ../mlkem_avx2/consts.jinc ../mlkem_avx2/verify.jinc ../mlkem_avx2/reduce.jinc \
       ../mlkem_avx2/polyvec.jinc ../mlkem_avx2/poly.jinc ../mlkem_avx2/indcpa.jinc ../mlkem_avx2/gen_matrix.jinc ../mlkem_avx2/mlkem_keccak_avx2.jinc


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
	$(JASMINC) -checkCT -infer jkem.jazz

sct:
	$(JASMINC) -checkSCT jkem.jazz

clean:
	-rm -f *.s
	-rm -f jkem.o
	-rm -f test/test_kem
	-rm -f test/speed_kem
ifeq ($(OS),Darwin)
	-rm -rf test/*.dSYM
endif
