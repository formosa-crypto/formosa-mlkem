# -*- Makefile -*-

# --------------------------------------------------------------------
-include ../../../../Makefile.conf

# --------------------------------------------------------------------
.PHONY: all ec ec_safety clean

# --------------------------------------------------------------------
all: ec


ec: 
	$(JASMIN2EC) ../jkem.jazz --array-model=old -o jkem768.ec \
	  -f jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand \
	  -f jade_kem_mlkem_mlkem768_amd64_ref_enc_derand \
	  -f jade_kem_mlkem_mlkem768_amd64_ref_dec

ec_safety: 
	$(JASMIN2EC) ../jkem.jazz -m safety -o safety_mlkem768_ref.ec \
	  -f jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand \
	  -f jade_kem_mlkem_mlkem768_amd64_ref_enc_derand \
	  -f jade_kem_mlkem_mlkem768_amd64_ref_dec

clean:
	rm -f *.ec
