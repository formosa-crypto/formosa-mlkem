CC=/usr/bin/gcc
CFLAGS=-Wall -Wextra -g
JASMIN=~/svn/jasmin/compiler/jasminc
JFLAGS=-lea -pasm

.SECONDARY: jpoly.s jpolyvec.s jfips202.s indcpa_keypair.s indcpa_encrypt.s

default: test

test: test/test_poly_compress \
 		  test/test_poly_decompress \
			test/test_poly_tobytes \
			test/test_poly_frombytes \
			test/test_poly_tomsg \
			test/test_poly_frommsg \
			test/test_poly_add \
 			test/test_poly_sub \
 			test/test_poly_ntt \
 			test/test_poly_invntt \
 			test/test_poly_basemul \
 			test/test_poly_frommont \
 			test/test_poly_reduce \
 			test/test_poly_csubq \
 			test/test_poly_getnoise \
			test/test_polyvec_compress\
			test/test_polyvec_decompress\
			test/test_polyvec_tobytes \
			test/test_polyvec_frombytes \
			test/test_polyvec_add \
			test/test_polyvec_ntt \
			test/test_polyvec_invntt \
			test/test_polyvec_pointwise_acc \
			test/test_polyvec_reduce\
			test/test_polyvec_csubq \
 			test/test_fips202 \

kybertest: test/test_indcpa \


HEADERS = params.h poly.h fips202.h \


JHEADERS = params.jahh \
				   reduce.jahh \
           fips202.jahh \

POLYHEADERS = poly_compress.jahh \
				   poly_decompress.jahh \
				   poly_tobytes.jahh \
				   poly_frombytes.jahh \
				   poly_tomsg.jahh \
				   poly_frommsg.jahh \
				   poly_add.jahh \
				   poly_sub.jahh \
				   poly_ntt.jahh \
				   poly_invntt.jahh \
				   poly_basemul.jahh \
				   poly_frommont.jahh \
				   poly_reduce.jahh \
				   poly_csubq.jahh \
				   poly_getnoise.jahh \


POLYVECHEADERS = polyvec_compress.jahh \
                 polyvec_decompress.jahh \
                 polyvec_tobytes.jahh \
                 polyvec_frombytes.jahh \
                 polyvec_add.jahh \
                 polyvec_ntt.jahh \
                 polyvec_invntt.jahh \
                 polyvec_pointwise_acc.jahh \
                 polyvec_reduce.jahh \
                 polyvec_csubq.jahh \
								 polyvec_topolys.jahh \
								 polyvec_frompolys.jahh \
                 gen_matrix.jahh \

SOURCES = poly.c polyvec.c cbd.c fips202.c ntt.c reduce.c symmetric-fips202.c indcpa.c \

test/test_indcpa: test/test_indcpa.c $(HEADERS) $(SOURCES) indcpa_keypair.s indcpa_encrypt.s
	$(CC) $(CFLAGS) -o $@ $(SOURCES) indcpa_keypair.s indcpa_encrypt.s $<

test/%: test/%.c $(HEADERS) $(SOURCES) jpoly.s jpolyvec.s jfips202.s
	$(CC) $(CFLAGS) -o $@ $(SOURCES) jpoly.s jpolyvec.s jfips202.s $<

jfips202.japp: jfips202.jazz fips202.jahh
	cat $< | $(CC) -E - | grep -v ^# > $@

jpoly.japp: jpoly.jazz $(JHEADERS) $(POLYHEADERS)
	cat $< | $(CC) -E - | grep -v ^# > $@

jpolyvec.japp: jpolyvec.jazz $(JHEADERS) $(POLYHEADERS) $(POLYVECHEADERS)
	cat $< | $(CC) -E - | grep -v ^# > $@

indcpa_keypair.japp: indcpa_keypair.jazz $(JHEADERS) $(POLYHEADERS) $(POLYVECHEADERS)
	cat $< | $(CC) -E - | grep -v ^# > $@

indcpa_encrypt.japp: indcpa_encrypt.jazz $(JHEADERS) $(POLYHEADERS) $(POLYVECHEADERS)
	cat $< | $(CC) -E - | grep -v ^# > $@

%.s: %.japp
	$(JASMIN) $(JFLAGS) $^ > $@


.PHONY: clean

clean:
	-rm *.s
	-rm *.japp
	-rm test/test_poly_compress
	-rm test/test_poly_decompress
	-rm test/test_poly_tobytes
	-rm test/test_poly_frombytes
	-rm test/test_poly_tomsg
	-rm test/test_poly_frommsg
	-rm test/test_poly_add
	-rm test/test_poly_sub
	-rm test/test_poly_ntt
	-rm test/test_poly_invntt
	-rm test/test_poly_basemul
	-rm test/test_poly_frommont
	-rm test/test_poly_reduce
	-rm test/test_poly_csubq
	-rm test/test_poly_getnoise
	-rm test/test_polyvec_compress
	-rm test/test_polyvec_decompress
	-rm test/test_polyvec_tobytes
	-rm test/test_polyvec_frombytes
	-rm test/test_polyvec_add
	-rm test/test_polyvec_ntt
	-rm test/test_polyvec_invntt
	-rm test/test_polyvec_pointwise_acc
	-rm test/test_polyvec_reduce
	-rm test/test_polyvec_csubq
	-rm test/test_fips202
	-rm test/test_indcpa
