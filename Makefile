# -*- Makefile -*-

# --------------------------------------------------------------------
ECCONF := config/tests.config 
CHECKS ?= mlkem

# --------------------------------------------------------------------
.PHONY: default check checkec jasmin clean_eco

default: check

check: jasmin checkec

jasmin:
	make -C code/jasmin/mlkem_ref/extraction
	make -C code/jasmin/mlkem_avx2v/extraction

checkec:
	easycrypt runtest $(ECCONF) $(CHECKS)

clean_eco:
	find proof -name '*.eco' -exec rm '{}' ';'
