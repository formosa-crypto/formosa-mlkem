.PHONY: default build run check clean echo-vars

#----------------------------------------------------------

TESTS ?= 100

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

#--

ALL := $(addsuffix _$(TESTS),$(ALL))
ALL_OUT := $(addsuffix .out,$(ALL))

#-- TODO: move third_party out of bench
THIRD_PARTY := $(abspath ../../bench/third_party)
RANDOM_BYTES := $(abspath ../../bench/randombytes)
#----------------------------------------------------------

default: check

#----------------------------------------------------------
#-- build formosa

build: $(ALL)

define FORMOSA_MLKEM
bin/formosa-mlkem-$(1)-$(2)_$(TESTS): src/memory.c $(SRC)/$(1)/$(2)/jkem.s $(RANDOM_BYTES)/librandombytes1.a | bin/
	$(CC) $(CFLAGS) \
	  -o $$@ \
	  -I $(SRC)/$(1)/$(2)/include/ \
	  -DTESTS=$(TESTS) \
	  -DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem$(1)_amd64_$(2) \
	  -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem$(1)_amd64_$(2) \
	  src/memory.c \
	  $(RANDOM_BYTES)/librandombytes1.a \
	  $(SRC)/$(1)/$(2)/jkem.s
endef

$(eval $(call FORMOSA_MLKEM,768,ref))
$(eval $(call FORMOSA_MLKEM,768,avx2))
$(eval $(call FORMOSA_MLKEM,1024,ref))
$(eval $(call FORMOSA_MLKEM,1024,avx2))

$(RANDOM_BYTES)/librandombytes1.a:
	$(MAKE) -C $(RANDOM_BYTES)

#----------------------------------------------------------
#-- run and check

run: $(ALL_OUT)

check: run
	@if ls bin/*.error >/dev/null 2>&1; then \
		echo -n "ERROR - "; \
		ls bin/*.error; \
	else \
		echo "OK - no *.error files"; \
	fi

bin/%.out: bin/%
	./$< > $@
	((valgrind --leak-check=full --error-exitcode=1 --log-file=$@ ./$<) || mv $@ $@.error)
	

#----------------------------------------------------------
#-- other

bin/:
	@mkdir -p $@

clean:
	rm -f $(ALL) $(ALL_OUT) bin/*.error
	$(MAKE) -C $(RANDOM_BYTES) clean

echo-vars:
	@echo "ALL: $(ALL)"
	@echo "ALL_OUT: $(ALL_OUT)"
