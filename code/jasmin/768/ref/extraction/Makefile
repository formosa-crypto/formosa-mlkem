# -*- Makefile -*-

# --------------------------------------------------------------------
-include ../../../../Makefile.conf

# --------------------------------------------------------------------
.PHONY: all ec clean

# --------------------------------------------------------------------
all: ec


ec: 
	$(JASMIN2EC) ../jkem.jazz --array-model=old -o jkem768.ec \
	  -f jade_kem_mlkem_mlkem768_amd64_ref_keypair \
	  -f jade_kem_mlkem_mlkem768_amd64_ref_enc \
	  -f jade_kem_mlkem_mlkem768_amd64_ref_dec

clean:
	rm -f *.ec
