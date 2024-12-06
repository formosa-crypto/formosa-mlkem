# -*- Makefile -*-

# --------------------------------------------------------------------
-include ../../../Makefile.conf

# --------------------------------------------------------------------
.PHONY: all ec clean

# --------------------------------------------------------------------
all: ec

ec:
	$(JASMINC) ../jkem.jazz -oec jkem_avx2_stack.ec \
	  -ec jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand \
	  -ec jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand \
	  -ec jade_kem_mlkem_mlkem768_amd64_avx2_dec

clean:
	rm -f *.ec
