CC=/usr/bin/gcc
CFLAGS=-Wall -Wextra -g -O3 -fomit-frame-pointer
JASMIN=jasminc
JFLAGS=-lea ${JADDFLAGS}

.SECONDARY: jpoly.s jpolyvec.s jfips202.s jindcpa.s jindcpa.o

default: test speed

test: test/test_poly_compress \
 		  test/test_poly_decompress \
			test/test_poly_tobytes \
			test/test_poly_frombytes \
			test/test_poly_tomsg \
			test/test_poly_frommsg \
			test/test_poly_add2 \
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
			test/test_polyvec_add2 \
			test/test_polyvec_ntt \
			test/test_polyvec_invntt \
			test/test_polyvec_pointwise_acc \
			test/test_polyvec_reduce\
			test/test_polyvec_csubq \
 			test/test_fips202 \
 			test/test_indcpa \

speed: test/speed_indcpa

HEADERS = params.h poly.h fips202.h ntt.h \


JHEADERS = params.jahh \
				   reduce.jahh \
           fips202.jahh \

POLYHEADERS = poly_compress.jahh \
              poly_decompress.jahh \
              poly_tobytes.jahh \
              poly_frombytes.jahh \
              poly_tomsg.jahh \
              poly_frommsg.jahh \
              poly_add2.jahh \
              poly_sub.jahh \
              poly_ntt.jahh \
              poly_invntt.jahh \
              poly_basemul.jahh \
              poly_frommont.jahh \
              poly_reduce.jahh \
              poly_csubq.jahh \
              poly_getnoise.jahh \
							zetas.jahh \

POLYVECHEADERS = polyvec_compress.jahh \
                 polyvec_decompress.jahh \
                 polyvec_tobytes.jahh \
                 polyvec_frombytes.jahh \
                 polyvec_add2.jahh \
                 polyvec_ntt.jahh \
                 polyvec_invntt.jahh \
                 polyvec_pointwise_acc.jahh \
                 polyvec_reduce.jahh \
                 polyvec_csubq.jahh \
								 polyvec_topolys.jahh \
								 polyvec_frompolys.jahh \
                 gen_matrix.jahh \

INCS    = fq.inc shuffle.inc
SOURCES = poly.c polyvec.c cbd.c fips202.c ntt.c reduce.c symmetric-fips202.c indcpa.c consts.c ntt.S shuffle.S fq.S\

test/test_indcpa: test/test_indcpa.c $(HEADERS) $(SOURCES) $(INCS) jindcpa.o
	$(CC) $(CFLAGS) -o $@ $(SOURCES) jindcpa.o $<

test/speed_indcpa: test/speed_indcpa.c $(HEADERS) $(SOURCES) $(INCS) jindcpa.o
	$(CC) $(CFLAGS) -o $@ $(SOURCES) jindcpa.o $<

test/test_fips202: test/test_fips202.c $(HEADERS) $(SOURCES) jfips202.s
	$(CC) $(CFLAGS) -o $@ $(SOURCES) jfips202.s $<
 
test/test_poly_%: test/test_poly_%.c $(HEADERS) $(SOURCES) $(INCS) jpoly.s 
	$(CC) $(CFLAGS) -o $@ $(SOURCES) jpoly.s $<
			
test/test_polyvec_%: test/test_polyvec_%.c $(HEADERS) $(SOURCES) $(INCS) jpolyvec.s
	$(CC) $(CFLAGS) -o $@ $(SOURCES) jpolyvec.s $<



jfips202.japp: jfips202.jazz fips202.jahh
	cat $< | $(CC) -E - | grep -v ^# > $@

jpoly.japp: jpoly.jazz $(JHEADERS) $(POLYHEADERS)
	cat $< | $(CC) -E - | grep -v ^# > $@

jpolyvec.japp: jpolyvec.jazz $(JHEADERS) $(POLYHEADERS) $(POLYVECHEADERS)
	cat $< | $(CC) -E - | grep -v ^# > $@

jindcpa.japp: indcpa.jazz $(JHEADERS) $(POLYHEADERS) $(POLYVECHEADERS)
	cat $< | $(CC) -E - | grep -v ^# > $@

%.s: %.japp
	$(JASMIN) -o $@ $(JFLAGS) $^ 


.PHONY: clean

clean:
	-rm *.japp
	-rm *.o
	-rm gen_matrix.s
	-rm indcpa.s
	-rm jfips202.s
	-rm jpoly.s
	-rm jpolyvec.s
	-rm test/test_poly_compress
	-rm test/test_poly_decompress
	-rm test/test_poly_tobytes
	-rm test/test_poly_frombytes
	-rm test/test_poly_tomsg
	-rm test/test_poly_frommsg
	-rm test/test_poly_add2
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
	-rm test/test_polyvec_add2
	-rm test/test_polyvec_ntt
	-rm test/test_polyvec_invntt
	-rm test/test_polyvec_pointwise_acc
	-rm test/test_polyvec_reduce
	-rm test/test_polyvec_csubq
	-rm test/test_fips202
	-rm test/test_indcpa
