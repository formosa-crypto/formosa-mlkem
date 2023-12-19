# -*- Makefile -*-

# --------------------------------------------------------------------
-include ../../../Makefile.conf

# --------------------------------------------------------------------
.PHONY: all ec clean

# --------------------------------------------------------------------
all: ec

ec:
	$(JASMINC) ../jkem.jazz -oec jkem_avx2.ec \
	  -ec jade_kem_kyber_kyber768_amd64_avx2v_keypair \
	  -ec jade_kem_kyber_kyber768_amd64_avx2v_enc \
	  -ec jade_kem_kyber_kyber768_amd64_avx2v_dec

clean:
	rm -f *.ec
