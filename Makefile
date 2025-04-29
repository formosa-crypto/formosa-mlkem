# -*- Makefile -*-

# --------------------------------------------------------------------
ECCONF := config/tests.config 
CHECKS ?= mlkem

# --------------------------------------------------------------------
.PHONY: default check checkec jasmin clean_eco

default: check

check: jasmin checkec

jasmin:
	make -C code/jasmin/768/ref/extraction
	make -C code/jasmin/768/avx2/extraction
	make -C code/jasmin/768/avx2_stack/extraction
	make -C code/jasmin/1024/ref/extraction
	make -C code/jasmin/1024/avx2/extraction
	make -C code/jasmin/1024/avx2_stack/extraction

checkec:
	easycrypt runtest $(ECCONF) $(CHECKS)

clean_eco:
	find proof -name '*.eco' -exec rm '{}' ';'
