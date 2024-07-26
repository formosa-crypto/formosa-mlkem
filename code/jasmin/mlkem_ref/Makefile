# -*- Makefile -*-

-include ../../Makefile.conf

CC     ?= /usr/bin/gcc
CFLAGS := -Wall -Wextra -g -O3 -fomit-frame-pointer
JFLAGS := ${JADDFLAGS}
OS     := $(shell uname -s)

default: run-tests run-speed

# --
TESTS_POLY := \
  test/test_poly_compress \
  test/test_poly_decompress \
  test/test_poly_tobytes \
  test/test_poly_frombytes \
  test/test_poly_tomsg \
  test/test_poly_frommsg \
  test/test_poly_add2 \
  test/test_poly_sub \
  test/test_poly_ntt \
  test/test_poly_invntt \
  test/test_poly_basemul \
  test/test_poly_frommont \
  test/test_poly_reduce \
  test/test_poly_csubq \
  test/test_poly_getnoise

TESTS_POLYVEC := \
  test/test_polyvec_compress \
  test/test_polyvec_decompress\
  test/test_polyvec_tobytes \
  test/test_polyvec_frombytes \
  test/test_polyvec_add2 \
  test/test_polyvec_ntt \
  test/test_polyvec_invntt \
  test/test_polyvec_pointwise_acc \
  test/test_polyvec_reduce\
  test/test_polyvec_csubq

TESTS := \
  $(TESTS_POLY) \
  $(TESTS_POLYVEC) \
  test/test_fips202 \
  test/test_indcpa \
  test/test_kem

test: $(TESTS)

speed: test/speed_indcpa

#-- 

HEADERS := \
  params.h \
  poly.h \
  fips202.h \
  kem.h

C_SOURCES := \
  poly.c \
  polyvec.c \
  cbd.c \
  fips202.c \
  ntt.c \
  reduce.c \
  symmetric-fips202.c \
  indcpa.c \
  kem.c

JHEADERS := \
  params.jinc \
  reduce.jinc \
  fips202.jinc \
  kem.jinc \
  verify.jinc

POLYHEADERS := \
  poly.jinc \
	zetas.jinc

POLYVECHEADERS := \
  polyvec.jinc \
  gen_matrix.jinc

# --

JASMIN_SOURCES := \
  jpoly.jazz \
  jpolyvec.jazz \
  jfips203.jazz \
  jindcpa.jazz \
  jkem.jazz

JASMIN_ASSEMBLY := $(JASMIN_SOURCES:%.jazz=%.s)

# --

RANDOMBYTES := $(PROJECT_DIR)/jasmin/compiler/syscall/jasmin_syscall.o

$(RANDOMBYTES): $(PROJECT_DIR)/jasmin/compiler/syscall/jasmin_syscall.c $(PROJECT_DIR)/jasmin/compiler/syscall/jasmin_syscall.h
	$(MAKE) -C $(@D)

$(JASMIN_ASSEMBLY):
%.s: %.jazz
	$(JASMINC) -nowarning -o $@ $(JFLAGS) $^ 

#--

compile-tests-poly: $(TESTS_POLY)
$(TESTS_POLY):
test/test_poly_%: test/test_poly_%.c $(HEADERS) $(C_SOURCES) jpoly.s
	$(CC) $(CFLAGS) -o $@ $(C_SOURCES) jpoly.s $<

compile-tests-polyvec: $(TESTS_POLYVEC)
$(TESTS_POLYVEC):
test/test_polyvec_%: test/test_polyvec_%.c $(HEADERS) $(C_SOURCES) jpolyvec.s
	$(CC) $(CFLAGS) -o $@ $(C_SOURCES) jpolyvec.s $<

test/test_fips202: test/test_fips202.c $(HEADERS) $(C_SOURCES) jfips202.s
	$(CC) $(CFLAGS) -o $@ $(C_SOURCES) jfips202.s $<

test/test_indcpa: test/test_indcpa.c $(HEADERS) $(C_SOURCES) jindcpa.o
	$(CC) $(CFLAGS) -o $@ $(C_SOURCES) jindcpa.o $<

test/test_kem: test/test_kem.c $(HEADERS) $(C_SOURCES) $(RANDOMBYTES) jkem.o
	$(CC) $(CFLAGS) -o $@ $(C_SOURCES) $(RANDOMBYTES) jkem.o $<

compile-tests: test

# --
# note: to improve speed, remove for loop and define *.out targets

run-tests-poly: compile-tests-poly
	for i in $(TESTS_POLY); do ./$$i; done

run-tests-polyvec: compile-tests-polyvec
	for i in $(TESTS_POLYVEC); do ./$$i; done

run-tests: compile-tests
	for i in $(TESTS); do ./$$i; done

#--

test/speed_indcpa: test/speed_indcpa.c $(HEADERS) $(C_SOURCES) jindcpa.o
	$(CC) $(CFLAGS) -o $@ $(C_SOURCES) jindcpa.o $<

compile-speed: test/speed_indcpa

run-speed: compile-speed
	./test/speed_indcpa

# --

.PHONY: check-ct

check-constant-time:
	$(JASMIN_CT) --infer jkem.jazz

# --

.PHONY: clean

clean:
	-rm -f *.s
	-rm -f jindcpa.o
	-rm -f jkem.o
	-rm -f $(TESTS_POLY)
	-rm -f $(TESTS_POLYVEC)
	-rm -f test/test_fips202
	-rm -f test/test_indcpa
	-rm -f test/test_kem
	-rm -f test/speed_indcpa
ifeq ($(OS),Darwin)
	-rm -rf test/*.dSYM
endif


