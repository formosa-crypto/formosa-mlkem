# -*- Makefile -*-

# --------------------------------------------------------------------
-include ../../../../Makefile.conf

# --------------------------------------------------------------------
.PHONY: all ec clean

# --------------------------------------------------------------------
all: ec


ec: 
	$(JASMIN2EC) ../jkem.jazz --array-model=old -o jkem1024_avx2.ec \
	  -f jade_kem_mlkem_mlkem1024_amd64_avx2_keypair \
	  -f jade_kem_mlkem_mlkem1024_amd64_avx2_enc \
	  -f jade_kem_mlkem_mlkem1024_amd64_avx2_dec

clean:
	rm -f *.ec
