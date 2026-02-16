# -*- Makefile -*-

# --------------------------------------------------------------------
-include ../../../../Makefile.conf

# --------------------------------------------------------------------
.PHONY: all ec clean

# --------------------------------------------------------------------
all: ec


ec: 
	$(JASMIN2EC) ../jkem.jazz --array-model=old -o jkem1024_avx2.ec \
	  -f jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand \
	  -f jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand \
	  -f jade_kem_mlkem_mlkem1024_amd64_avx2_dec

ec_safety: 
	$(JASMIN2EC) ../jkem.jazz -m safety -o jkem1024_avx2_safety.ec \
	  --output-proof jkem1024_avx2_safety_proof.ec \	
	  -f jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand \
	  -f jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand \
	  -f jade_kem_mlkem_mlkem1024_amd64_avx2_dec

clean:
	rm -f *.ec
