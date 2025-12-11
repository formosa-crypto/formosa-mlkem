# -*- Makefile -*-

-include ../../../Makefile.conf

CKP    := ../../../kyber/ref
CC     ?= arch -x86_64 gcc
CFLAGS := -Wall -Wextra -g -O3 -fomit-frame-pointer -Wno-implicit-function-declaration -D KYBER_K=4
JFLAGS := ${JADDFLAGS}
OS     := $(shell uname -s)

.SECONDARY: jkem.s


default: test speed

test: test/test_kem
	./test/test_kem

speed: test/speed_kem

keccak_test: test/test_keccak test/test_oldkeccak 

JINC = kem.jinc ../../common/avx2/params.jinc params.jinc ../../common/avx2/consts.jinc ../../common/avx2/verify.jinc ../../common/avx2/reduce.jinc \
       ../../common/avx2/polyvec.jinc polyvec.jinc ../../common/avx2/poly.jinc poly.jinc indcpa.jinc gen_matrix.jinc ../../common/avx2/mlkem_keccak_avx2.jinc


SOURCES = $(CKP)/verify.c $(CKP)/randombytes.c $(CKP)/poly.c $(CKP)/polyvec.c \
          $(CKP)/cbd.c $(CKP)/fips202.c $(CKP)/ntt.c $(CKP)/reduce.c \
          $(CKP)/symmetric-shake.c $(CKP)/indcpa.c $(CKP)/kem.c\
          $(JASMIN)/syscall/jasmin_syscall.c

test/test_keccak: test/test_keccak.c test/test_keccak_ref.s test/test_keccak_avx2.s
	$(CC) $(CFLAGS) -o $@ $^

test/test_oldkeccak: test/test_keccak.c test/test_keccak_oldref.s test/test_keccak_oldavx2.s
	$(CC) $(CFLAGS) -o $@ $^

test/test_kem: test/test_kem.c $(JINC) $(SOURCES) jkem.s
	$(CC) $(CFLAGS) -o $@ $(SOURCES) jkem.s $<

test/speed_kem: test/speed_kem.c $(JINC) $(SOURCES) jkem.s
	$(CC) $(CFLAGS) -o $@ $(SOURCES) jkem.s $<

jkem.s: $(JINC) jkem.jazz
	$(JASMINC) -o jkem.s $(JFLAGS) jkem.jazz

test/test_keccak_ref.s: ../../common/ref/mlkem_keccak_ref.jazz
	$(JASMINC) -o $@ $(JFLAGS) $<

test/test_keccak_avx2.s: ../../common/avx2/mlkem_keccak_avx2.jazz
	$(JASMINC) -o $@ $(JFLAGS) $<

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
	-rm -f test/test_kem
	-rm -f test/speed_kem
	-rm -f test/test_keccak
	-rm -f test/test_keccak_ref.s test/test_keccak_avx2.s 
	-rm -f test/test_oldkeccak
ifeq ($(OS),Darwin)
	-rm -rf test/*.dSYM
endif
