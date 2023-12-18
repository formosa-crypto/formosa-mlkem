# -*- Makefile -*-

# --------------------------------------------------------------------
-include ../../../Makefile.conf

# --------------------------------------------------------------------
.PHONY: all ec clean

# --------------------------------------------------------------------
all: ec

ec:
	$(JASMINC) ../jkem.jazz -oec jkem.ec \
	  -ec jade_kem_kyber_kyber768_amd64_ref_keypair \
	  -ec jade_kem_kyber_kyber768_amd64_ref_enc \
	  -ec jade_kem_kyber_kyber768_amd64_ref_dec

clean:
	rm -f *.ec
