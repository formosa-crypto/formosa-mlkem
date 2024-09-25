# -*- Makefile -*-

# --------------------------------------------------------------------
ECCONF := config/tests.config
CHECKS ?= mlkem

# --------------------------------------------------------------------
.PHONY: default check checkec jasmin clean_eco test bench

default: check

check: jasmin checkec

jasmin:
	$(MAKE) -C code/jasmin/mlkem_ref/extraction
	$(MAKE) -C code/jasmin/mlkem_avx2/extraction

checkec:
	easycrypt runtest $(ECCONF) $(CHECKS)

clean_eco:
	find proof -name '*.eco' -exec rm '{}' ';'

test:
	$(MAKE) -C code/jasmin/mlkem_ref/ -j$(nproc) compile-tests
	$(MAKE) -C code/jasmin/mlkem_avx2/ -j$(nproc) compile-tests
	@echo "\n\n### Testing the reference implementation"
	$(MAKE) -C code/jasmin/mlkem_ref/ run-tests
	@echo "\n\n### Testing the avx2 implementation"
	$(MAKE) -C code/jasmin/mlkem_avx2/ run-tests

bench:
	$(MAKE) -C code/jasmin/mlkem_ref/ -j$(nproc) compile-speed
	$(MAKE) -C code/jasmin/mlkem_avx2/ -j$(nproc) compile-speed
	@echo "\n\n### Benchmarking the reference implementation"
	$(MAKE) -C code/jasmin/mlkem_ref/ run-speed
	@echo "\n\n### Benchmarking the avx2 implementation"
	$(MAKE) -C code/jasmin/mlkem_avx2/ run-speed

example:
	$(MAKE) -C code/jasmin/mlkem_ref/example
	$(MAKE) -C code/jasmin/mlkem_avx2/example


