# -*- Makefile -*-

# --------------------------------------------------------------------
-include ../../../../Makefile.conf

# --------------------------------------------------------------------
.PHONY: all ec clean

# --------------------------------------------------------------------
all: ec


ec: 
	$(JASMIN2EC) ../jkem.jazz --array-model=old -o jkem1024.ec \
	  -f jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand \
	  -f jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand \
	  -f jade_kem_mlkem_mlkem1024_amd64_ref_dec

ec_safety: 
	$(JASMIN2EC) ../jkem.jazz -m safety -o jkem1024_safety.ec \
      --output-proof jkem1024_safety_proof.ec \
      -f jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand \
	  -f jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand \
	  -f jade_kem_mlkem_mlkem1024_amd64_ref_dec

clean:
	rm -f *.ec
