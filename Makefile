# -*- Makefile -*-

# --------------------------------------------------------------------
ECCONF := config/tests.config 
CHECKS ?= mlkem

# --------------------------------------------------------------------
.PHONY: default check checkec jasmin assembly clean_eco

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

assembly:
	$(MAKE) -C code/jasmin/768/avx2/ jkem.s gen_matrix.s
	$(MAKE) -C code/jasmin/768/avx2_stack/ jkem.s
	$(MAKE) -C code/jasmin/768/ref/ jkem.s
	$(MAKE) -C code/jasmin/1024/avx2/ jkem.s gen_matrix.s
	$(MAKE) -C code/jasmin/1024/avx2_stack/ jkem.s
	$(MAKE) -C code/jasmin/1024/ref/ jkem.s

clean_eco:
	find proof -name '*.eco' -exec rm '{}' ';'
