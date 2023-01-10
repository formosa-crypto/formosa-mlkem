#all : jindcpa.ec jkem.ec

#jindcpa.ec : ../indcpa.jinc
#	jasminc ../indcpa.jinc -oec jindcpa.ec -ec indcpa_keypair_jazz -ec indcpa_enc_jazz -ec indcpa_dec_jazz

all: jkem_avx2.ec jkemr_avx2.ec


jkem_avx2.ec : ../jkem.jazz
	jasminc ../jkem.jazz -oec jkem_avx2.ec -ec crypto_kem_keypair_jazz -ec crypto_kem_enc_jazz -ec crypto_kem_dec_jazz

jkemr_avx2.ec : ../jkemr.jazz
	jasminc ../jkemr.jazz -oec jkemr_avx2.ec -ec crypto_kem_keypair_jazz -ec crypto_kem_enc_jazz -ec crypto_kem_dec_jazz

clean: 
	rm *.ec