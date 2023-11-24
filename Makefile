# -*- Makefile -*-

# --------------------------------------------------------------------
ECCONF := config/tests.config 
CHECKS ?= kyber

# --------------------------------------------------------------------
.PHONY: default check checkec jasmin clean_eco

default: check

check: jasmin checkec

jasmin:
	make -C code/jasmin/ref/extraction
	make -C code/jasmin/avx2/extraction
	make -C code/jasmin/avx2v/extraction

checkec:
	easycrypt runtest $(ECCONF) $(CHECKS)

clean_eco:
	find proof -name '*.eco' -exec rm '{}' ';'
