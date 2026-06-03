# -*- Makefile -*-

# --------------------------------------------------------------------
ECCONF := config/tests.config 
ECJOBS ?= 3
CHECKS ?= \
	mlkem_correctness_768_avx2  \
	mlkem_correctness_1024_avx2 \
	mlkem_safety_768_avx2       \
	mlkem_safety_1024_avx2      \
	mlkem_security              \
	mlkem_spec_bridge

# --------------------------------------------------------------------
.PHONY: default check checkec weakcheck jasmin assembly clean_eco

default: check

check: jasmin checkec

jasmin:
	make -C code/jasmin/768/avx2/extraction
	make -C code/jasmin/1024/avx2/extraction

checkec:
	easycrypt runtest -jobs $(ECJOBS) $(ECPRAGMAS) $(ECCONF) $(CHECKS)

# Weak-check mode: skip SMT proofs (structural / type check only).
weakcheck:
	$(MAKE) checkec ECPRAGMAS="-pragmas Proofs:weak"

assembly:
	$(MAKE) -C code/jasmin/768/avx2/ jkem.s
	$(MAKE) -C code/jasmin/1024/avx2/ jkem.s

pqcp:
	$(MAKE) -C code/jasmin/768/avx2 pqcp
	$(MAKE) -C code/jasmin/1024/avx2 pqcp

clean_eco:
	find proof -name '*.eco' -exec rm '{}' ';'
