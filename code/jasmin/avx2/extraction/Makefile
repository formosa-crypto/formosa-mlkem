#all : jindcpa.ec jkem.ec

#jindcpa.ec : ../indcpa.jinc
#	jasminc ../indcpa.jinc -oec jindcpa.ec -ec indcpa_keypair_jazz -ec indcpa_enc_jazz -ec indcpa_dec_jazz


all : 
	jasminc ../jkem.jazz -oec jkem_avx2.ec -ec jade_kem_kyber_kyber768_amd64_avx2_keypair -ec jade_kem_kyber_kyber768_amd64_avx2_enc -ec jade_kem_kyber_kyber768_amd64_avx2_dec
	
clean: 
	rm *.ec