#all : jindcpa.ec jkem.ec

#jindcpa.ec : ../indcpa.jinc
#	jasminc ../indcpa.jinc -oec jindcpa.ec -ec indcpa_keypair_jazz -ec indcpa_enc_jazz -ec indcpa_dec_jazz

jkem.ec : ../jkem.jazz
	jasminc ../jkem.jazz -oec jkem.ec -ec crypto_kem_keypair_jazz -ec crypto_kem_enc_jazz -ec crypto_kem_dec_jazz
