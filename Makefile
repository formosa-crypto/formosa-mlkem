# -*- Makefile -*-

# --------------------------------------------------------------------
ECCONF := config/tests.config 
CHECKS ?= kyber

# --------------------------------------------------------------------
.PHONY: default check clean_eco

default: check

check:
	make -C code/jasmin/ref/extraction
	make -C code/jasmin/avx2v/extraction
	easycrypt runtest $(ECCONF) $(CHECKS)

clean_eco:
	find proof -name '*.eco' -exec rm '{}' ';'
