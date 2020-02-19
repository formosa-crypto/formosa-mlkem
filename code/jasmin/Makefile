CC=/usr/bin/gcc
CFLAGS=-Wall -Wextra -g
JASMIN=~/svn/jasmin/compiler/jasminc
JFLAGS=-lea -pasm

test: test/test_poly_add \
 			test/test_poly_sub \
 			test/test_poly_ntt \
 			test/test_poly_invntt \
 			test/test_poly_frommont \
 			test/test_poly_basemul \
 			test/test_shake256 \


HEADERS = params.h poly.h \


JHEADERS = params.jahh \
				   reduce.jahh \
				   poly_add.jahh \
				   poly_sub.jahh \
				   poly_frommont.jahh \
				   poly_ntt.jahh \
				   poly_invntt.jahh \
				   poly_basemul.jahh \
				   fips202.jahh \

SOURCES = poly.c cbd.c fips202.c ntt.c reduce.c symmetric-fips202.c \
					poly.s \
					fips202.s \


test/%: test/%.c $(HEADERS) $(SOURCES)
	$(CC) $(CFLAGS) -o $@ $(SOURCES) $<


%.japp: %.jazz $(JHEADERS)
	cat $< | $(CC) -E - | grep -v ^# > $@

%.s: %.japp
	$(JASMIN) $(JFLAGS) $^ > $@


.PHONY: clean

clean:
	-rm *.s
	-rm *.japp
	-rm test/test_poly_add
	-rm test/test_poly_sub
	-rm test/test_poly_ntt
	-rm test/test_poly_invntt
	-rm test/test_poly_basemul
	-rm test/test_poly_frommont
	-rm test/test_poly_shake256
	-rm test/test_shake256
