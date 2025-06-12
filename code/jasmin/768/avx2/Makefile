# -*- Makefile -*-

-include ../../../Makefile.conf

CKP    := ../../../kyber/ref
CC     ?= /usr/bin/gcc
CFLAGS := -Wall -Wextra -g -O3 -fomit-frame-pointer -Wno-implicit-function-declaration
JFLAGS := ${JADDFLAGS}
OS     := $(shell uname -s)

.SECONDARY: jkem.s

default: test speed

test: test/test_kem test/test_gen_matrix

speed: test/speed_kem

JINC = kem.jinc ../../common/avx2/params.jinc params.jinc ../../common/avx2/consts.jinc ../../common/avx2/verify.jinc ../../common/avx2/reduce.jinc \
       ../../common/avx2/polyvec.jinc polyvec.jinc ../../common/avx2/poly.jinc poly.jinc indcpa.jinc gen_matrix.jinc ../../common/avx2/mlkem_keccak_avx2.jinc


SOURCES = $(CKP)/verify.c $(CKP)/randombytes.c $(CKP)/poly.c $(CKP)/polyvec.c \
          $(CKP)/cbd.c $(CKP)/fips202.c $(CKP)/ntt.c $(CKP)/reduce.c \
          $(CKP)/symmetric-shake.c $(CKP)/indcpa.c $(CKP)/kem.c\
          $(JASMIN)/syscall/jasmin_syscall.c


test/test_kem: test/test_kem.c $(JINC) $(SOURCES) jkem.s
	$(CC) $(CFLAGS) -o $@ $(SOURCES) jkem.s $<

test/test_gen_matrix: test/test_gen_matrix.c $(JINC) $(SOURCES) gen_matrix.s
	$(CC) $(CFLAGS) -o $@ $(SOURCES) gen_matrix.s $<

test/speed_kem: test/speed_kem.c $(JINC) $(SOURCES) jkem.s
	$(CC) $(CFLAGS) -o $@ $(SOURCES) jkem.s $<

%.s: %.jazz
	$(JASMINC) -o $@ $(JFLAGS) $^ 


.PHONY: ct clean

ct:
	$(JASMINCT) gen_matrix.jazz
	$(JASMINCT) --infer jkem.jazz

sct:
	$(JASMINCT) --sct --slice jade_kem_mlkem_mlkem768_amd64_avx2_gen_matrix gen_matrix.jazz
	$(JASMINCT) --sct jkem.jazz

clean:
	-rm -f *.s
	-rm -f jkem.o
	-rm -f test/test_kem
	-rm -f test/speed_kem
ifeq ($(OS),Darwin)
	-rm -rf test/*.dSYM
endif
