.PHONY: default build run check clean echo-vars

#----------------------------------------------------------

all: check
all-extended: check-extended

#----------------------------------------------------------

TESTS ?= 10000

#----------------------------------------------------------

CC ?= gcc

CFLAGS ?= -Wall -Wextra -Wpedantic -Wvla -Werror -std=c99 \
  -Wundef -Wshadow -Wcast-align -Wpointer-arith \
  -fstrict-aliasing -fno-common -pipe -O3 -g

SRC := $(abspath ../../code/jasmin/)

#----------------------------------------------------------

ALL := \
  bin/formosa-mlkem-768-avx2 \
  bin/formosa-mlkem-1024-avx2 \
  bin/formosa-mlkem-768-ref \
  bin/formosa-mlkem-1024-ref

ALL_EXTENDED := \
  bin/native-mlkem-768 \
  bin/native-mlkem-1024

#--

ALL_CHECKSMALL := $(addsuffix _checksumsmall,$(ALL))
ALL_CHECKBIG := $(addsuffix _checksumbig,$(ALL))
ALL_CHECKVERYBIG := $(addsuffix _checksumverybig,$(ALL))
ALL := $(ALL_CHECKSMALL) $(ALL_CHECKBIG) $(ALL_CHECKVERYBIG)
ALL_OUT := $(addsuffix .out,$(ALL))

ALL_EXTENDED_CHECKSMALL := $(addsuffix _checksumsmall,$(ALL_EXTENDED))
ALL_EXTENDED_CHECKBIG := $(addsuffix _checksumbig,$(ALL_EXTENDED))
ALL_EXTENDED_CHECKVERYBIG := $(addsuffix _checksumverybig,$(ALL_EXTENDED))
ALL_EXTENDED := $(ALL_EXTENDED_CHECKSMALL) $(ALL_EXTENDED_CHECKBIG) $(ALL_EXTENDED_CHECKVERYBIG)
ALL_EXTENDED_OUT := $(addsuffix .out,$(ALL_EXTENDED))

THIRD_PARTY := $(abspath ../../bench/third_party)

#----------------------------------------------------------

default: check

#----------------------------------------------------------
#-- build formosa

build: $(ALL)

define FORMOSA_768_REF
bin/formosa-mlkem-768-ref_checksum$(1): src/checksums.c $(SRC)/768/ref/jkem.s | bin/
	$(CC) $(CFLAGS) \
	  -o $$@ \
	  -I $(SRC)/768/ref/include/ \
	  -DTESTING_LOOPS=$(2) \
	  -DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem768_amd64_ref \
	  -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_ref \
	  src/checksums.c \
	  $(SRC)/768/ref/jkem.s
endef

define FORMOSA_768_AVX2
bin/formosa-mlkem-768-avx2_checksum$(1): src/checksums.c $(SRC)/768/avx2/jkem.s | bin/
	$(CC) $(CFLAGS) \
	  -o $$@ \
	  -I $(SRC)/768/avx2/include/ \
	  -DTESTING_LOOPS=$(2) \
	  -DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem768_amd64_avx2 \
	  -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_avx2 \
	  src/checksums.c \
	  $(SRC)/768/avx2/jkem.s
endef

#--

define FORMOSA_1024_REF
bin/formosa-mlkem-1024-ref_checksum$(1): src/checksums.c $(SRC)/1024/ref/jkem.s | bin/
	$(CC) $(CFLAGS) \
	  -o $$@ \
	  -I $(SRC)/1024/ref/include/ \
	  -DTESTING_LOOPS=$(2) \
	  -DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem1024_amd64_ref \
	  -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_ref \
	  src/checksums.c \
	  $(SRC)/1024/ref/jkem.s
endef

define FORMOSA_1024_AVX2
bin/formosa-mlkem-1024-avx2_checksum$(1): src/checksums.c $(SRC)/1024/avx2/jkem.s | bin/
	$(CC) $(CFLAGS) \
	  -o $$@ \
	  -I $(SRC)/1024/avx2/include/ \
	  -DTESTING_LOOPS=$(2) \
	  -DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem1024_amd64_avx2 \
	  -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_avx2 \
	  src/checksums.c \
	  $(SRC)/1024/avx2/jkem.s
endef

$(eval $(call FORMOSA_768_REF,small,8))
$(eval $(call FORMOSA_768_REF,big,64))
$(eval $(call FORMOSA_768_REF,verybig,$(TESTS)))
$(eval $(call FORMOSA_768_AVX2,small,8))
$(eval $(call FORMOSA_768_AVX2,big,64))
$(eval $(call FORMOSA_768_AVX2,verybig,$(TESTS)))

$(eval $(call FORMOSA_1024_REF,small,8))
$(eval $(call FORMOSA_1024_REF,big,64))
$(eval $(call FORMOSA_1024_REF,verybig,$(TESTS)))
$(eval $(call FORMOSA_1024_AVX2,small,8))
$(eval $(call FORMOSA_1024_AVX2,big,64))
$(eval $(call FORMOSA_1024_AVX2,verybig,$(TESTS)))

#----------------------------------------------------------
#-- build native

build-extended: $(ALL) $(ALL_EXTENDED)

define NATIVE_768
bin/native-mlkem-768_checksum$(1): src/checksums.c $(THIRD_PARTY)/mlkem-native/test/build/libmlkem768.a | bin/
	$(CC) $(CFLAGS) \
	  -o $$@ \
	  -I $(THIRD_PARTY)/bindings/mlkem-native-768/ \
	  -DTESTING_LOOPS=$(2) \
		-DJADE_NAMESPACE=PQCP_MLKEM_NATIVE_MLKEM768 \
		-DJADE_NAMESPACE_LC=PQCP_MLKEM_NATIVE_MLKEM768 \
	  src/checksums.c \
	  $(THIRD_PARTY)/mlkem-native/test/build/libmlkem768.a
endef

define NATIVE_1024
bin/native-mlkem-1024_checksum$(1): src/checksums.c $(THIRD_PARTY)/mlkem-native/test/build/libmlkem1024.a | bin/
	$(CC) $(CFLAGS) \
	  -o $$@ \
	  -I $(THIRD_PARTY)/bindings/mlkem-native-1024/ \
	  -DTESTING_LOOPS=$(2) \
		-DJADE_NAMESPACE=PQCP_MLKEM_NATIVE_MLKEM1024 \
		-DJADE_NAMESPACE_LC=PQCP_MLKEM_NATIVE_MLKEM1024 \
	  src/checksums.c \
	  $(THIRD_PARTY)/mlkem-native/test/build/libmlkem1024.a
endef

$(eval $(call NATIVE_768,small,8))
$(eval $(call NATIVE_768,big,64))
$(eval $(call NATIVE_768,verybig,$(TESTS)))
$(eval $(call NATIVE_1024,small,8))
$(eval $(call NATIVE_1024,big,64))
$(eval $(call NATIVE_1024,verybig,$(TESTS)))

.NOTPARALLEL: $(THIRD_PARTY)/mlkem-native/test/build/libmlkem768.a
$(THIRD_PARTY)/mlkem-native/test/build/libmlkem768.a:
	$(MAKE) -C $(THIRD_PARTY)/mlkem-native/ build OPT=1 AUTO=1

.NOTPARALLEL: $(THIRD_PARTY)/mlkem-native/test/build/libmlkem1024.a
$(THIRD_PARTY)/mlkem-native/test/build/libmlkem1024.a:
	$(MAKE) -C $(THIRD_PARTY)/mlkem-native/ build OPT=1 AUTO=1



#----------------------------------------------------------
#-- run and check

run: $(ALL_OUT)

check: run
	@for t in small big verybig; do \
		(cmp --silent bin/formosa-mlkem-768-avx2_checksum$$t.out bin/formosa-mlkem-768-ref_checksum$$t.out \
		 && echo -n "OK - ") || echo -n "ERROR - "; \
		echo "bin/formosa-mlkem-768-avx2_checksum$$t.out / bin/formosa-mlkem-768-ref_checksum$$t.out"; \
		\
		(cmp --silent bin/formosa-mlkem-1024-avx2_checksum$$t.out bin/formosa-mlkem-1024-ref_checksum$$t.out \
		 && echo -n "OK - ") || echo -n "ERROR - "; \
		echo "bin/formosa-mlkem-1024-avx2_checksum$$t.out / bin/formosa-mlkem-1024-ref_checksum$$t.out"; \
	done;

#----------------------------------------------------------
#-- run-extended and check-extended

run-extended: $(ALL_OUT) $(ALL_EXTENDED_OUT)

check-extended: run-extended
	@for t in small big verybig; do \
		(cmp --silent bin/formosa-mlkem-768-avx2_checksum$$t.out bin/formosa-mlkem-768-ref_checksum$$t.out \
		 && echo -n "OK - ") || echo -n "ERROR - "; \
		echo "bin/formosa-mlkem-768-avx2_checksum$$t.out / bin/formosa-mlkem-768-ref_checksum$$t.out"; \
		\
		(cmp --silent bin/formosa-mlkem-1024-avx2_checksum$$t.out bin/formosa-mlkem-1024-ref_checksum$$t.out \
		 && echo -n "OK - ") || echo -n "ERROR - "; \
		echo "bin/formosa-mlkem-1024-avx2_checksum$$t.out / bin/formosa-mlkem-1024-ref_checksum$$t.out"; \
		\
		\
		(cmp --silent bin/formosa-mlkem-768-avx2_checksum$$t.out bin/native-mlkem-768_checksum$$t.out \
		 && echo -n "OK - ") || echo -n "ERROR - "; \
		echo "bin/formosa-mlkem-768-avx2_checksum$$t.out / bin/native-mlkem-768_checksum$$t.out"; \
		\
		(cmp --silent bin/formosa-mlkem-1024-avx2_checksum$$t.out bin/native-mlkem-1024_checksum$$t.out \
		 && echo -n "OK - ") || echo -n "ERROR - "; \
		echo "bin/formosa-mlkem-1024-avx2_checksum$$t.out / bin/native-mlkem-1024_checksum$$t.out"; \
	done;

bin/%.out: bin/%
	./$< > $@

#----------------------------------------------------------
#-- other

bin/:
	@mkdir -p $@

clean:
	rm -f $(ALL) $(ALL_OUT) $(ALL_EXTENDED) $(ALL_EXTENDED_OUT)
	$(MAKE) -C $(THIRD_PARTY)/mlkem-native clean

echo-vars:
	@echo "ALL: $(ALL)"
	@echo "ALL_OUT: $(ALL_OUT)"
