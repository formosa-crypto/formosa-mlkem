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


HEADERS = params.h poly.h
SOURCES = poly.c cbd.c fips202.c ntt.c reduce.c symmetric-fips202.c \
					poly_add.s \
					poly_sub.s \
					poly_ntt.s \
					poly_invntt.s \
					poly_frommont.s \
					poly_basemul.s

test/%: test/%.c $(HEADERS) $(SOURCES)
	$(CC) $(CFLAGS) -o $@ $(SOURCES) $<


%.japp: %.jazz macros.jazz
	cat macros.jazz $< > $@

%.s: %.japp
	$(JASMIN) $(JFLAGS) $^ > $@


.PHONY: clean

clean:
	-rm *.s
	-rm *.japp
	-rm test/test_poly_add
	-rm test/test_poly_sub
	-rm test/test_poly_ntt


