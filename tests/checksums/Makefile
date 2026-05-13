.PHONY: default build run check clean echo-vars

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

ALL := $(addsuffix _$(TESTS),$(ALL))
ALL_OUT := $(addsuffix .out,$(ALL))

ALL_EXTENDED := $(addsuffix _$(TESTS),$(ALL_EXTENDED))
ALL_EXTENDED_OUT := $(addsuffix .out,$(ALL_EXTENDED))

#-- TODO: move third_party out of bench
THIRD_PARTY := $(abspath ../../bench/third_party)

#----------------------------------------------------------

default: check-extended

#----------------------------------------------------------
#-- build formosa

build: $(ALL)

define FORMOSA_MLKEM
bin/formosa-mlkem-$(1)-$(2)_$(TESTS): src/checksums.c $(SRC)/$(1)/$(2)/jkem.s | bin/
	$(CC) $(CFLAGS) \
	  -o $$@ \
	  -I $(SRC)/$(1)/$(2)/include/ \
	  -DTESTING_LOOPS=$(TESTS) \
	  -DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem$(1)_amd64_$(2) \
	  -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem$(1)_amd64_$(2) \
	  src/checksums.c \
	  $(SRC)/$(1)/$(2)/jkem.s
endef

$(eval $(call FORMOSA_MLKEM,768,ref))
$(eval $(call FORMOSA_MLKEM,768,avx2))
$(eval $(call FORMOSA_MLKEM,1024,ref))
$(eval $(call FORMOSA_MLKEM,1024,avx2))

#----------------------------------------------------------
#-- build native

build-extended: build $(ALL_EXTENDED)

define NATIVE_MLKEM
bin/native-mlkem-$(1)_$(TESTS): src/checksums.c $(THIRD_PARTY)/mlkem-native/test/build/libmlkem$(1).a | bin/
	$(CC) $(CFLAGS) \
	  -o $$@ \
	  -I $(THIRD_PARTY)/bindings/mlkem-native-$(1)/ \
	  -DTESTING_LOOPS=$(TESTS) \
		-DJADE_NAMESPACE=PQCP_MLKEM_NATIVE_MLKEM$(1) \
		-DJADE_NAMESPACE_LC=PQCP_MLKEM_NATIVE_MLKEM$(1) \
	  src/checksums.c \
	  $(THIRD_PARTY)/mlkem-native/test/build/libmlkem$(1).a
endef

$(eval $(call NATIVE_MLKEM,768))
$(eval $(call NATIVE_MLKEM,1024))

MLKEM_NATIVE_STAMP := $(THIRD_PARTY)/mlkem-native/test/build/.mlkem-native-built

$(THIRD_PARTY)/mlkem-native/test/build/libmlkem768.a: $(MLKEM_NATIVE_STAMP)
$(THIRD_PARTY)/mlkem-native/test/build/libmlkem1024.a: $(MLKEM_NATIVE_STAMP)

$(MLKEM_NATIVE_STAMP):
	$(MAKE) -C $(THIRD_PARTY)/mlkem-native build OPT=1 AUTO=1
	touch $@

#----------------------------------------------------------
#-- run and check

run: $(ALL_OUT)

check: run
	@(cmp --silent bin/formosa-mlkem-768-avx2_$(TESTS).out bin/formosa-mlkem-768-ref_$(TESTS).out \
		 && echo -n "OK - ") || echo -n "ERROR - "; \
		echo "bin/formosa-mlkem-768-avx2_$(TESTS).out / bin/formosa-mlkem-768-ref_$(TESTS).out"; \
		\
	(cmp --silent bin/formosa-mlkem-1024-avx2_$(TESTS).out bin/formosa-mlkem-1024-ref_$(TESTS).out \
		 && echo -n "OK - ") || echo -n "ERROR - "; \
		echo "bin/formosa-mlkem-1024-avx2_$(TESTS).out / bin/formosa-mlkem-1024-ref_$(TESTS).out";

#----------------------------------------------------------
#-- run-extended and check-extended

run-extended: run $(ALL_EXTENDED_OUT)

check-extended: check run-extended
	@(cmp --silent bin/formosa-mlkem-768-avx2_$(TESTS).out bin/native-mlkem-768_$(TESTS).out \
		 && echo -n "OK - ") || echo -n "ERROR - "; \
		echo "bin/formosa-mlkem-768-avx2_$(TESTS).out / bin/native-mlkem-768_$(TESTS).out"; \
		\
		(cmp --silent bin/formosa-mlkem-1024-avx2_$(TESTS).out bin/native-mlkem-1024_$(TESTS).out \
		 && echo -n "OK - ") || echo -n "ERROR - "; \
		echo "bin/formosa-mlkem-1024-avx2_$(TESTS).out / bin/native-mlkem-1024_$(TESTS).out"; \

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
	@echo "ALL_EXTENDED: $(ALL_EXTENDED)"
	@echo "ALL_EXTENDED_OUT: $(ALL_EXTENDED_OUT)"
