# -*- Makefile -*-

# --------------------------------------------------------------------
ECCONF := config/tests.config 
CHECKS ?= \
	mlkem_correctness_768_ref   \
	mlkem_correctness_768_avx2  \
	mlkem_correctness_1024_ref  \
	mlkem_correctness_1024_avx2 \
	mlkem_safety_768_ref        \
	mlkem_safety_768_avx2       \
	mlkem_safety_1024_ref       \
	mlkem_safety_1024_avx2      \
	mlkem_security              \
	mlkem_spec_bridge

# --------------------------------------------------------------------
.PHONY: default check checkec jasmin assembly clean_eco

default: check

check: jasmin checkec

jasmin:
	make -C code/jasmin/768/ref/extraction
	make -C code/jasmin/768/avx2/extraction
	make -C code/jasmin/1024/ref/extraction
	make -C code/jasmin/1024/avx2/extraction

checkec:
	easycrypt runtest -jobs 3 $(ECCONF) $(CHECKS)

assembly:
	$(MAKE) -C code/jasmin/768/avx2/ jkem.s
	$(MAKE) -C code/jasmin/768/ref/ jkem.s
	$(MAKE) -C code/jasmin/1024/avx2/ jkem.s
	$(MAKE) -C code/jasmin/1024/ref/ jkem.s

clean_eco:
	find proof -name '*.eco' -exec rm '{}' ';'
