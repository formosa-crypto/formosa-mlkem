ECSRC := jindcpa.ec

EXT_DIR := extraction

TOP_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))/../..))

.PHONY: default generate clean test_d

default: generate

generate: $(ECSRC)
	@true

clean:
	rm -rf $(EXT_DIR)

jindcca.ec: $(TOP_DIR)code/jasmin/ref/jkem.jazz
	@mkdir $(EXT_DIR)
	cd $(EXT_DIR) && jasminc -ec crypto_kem_keypair_jazz -ec crypto_kem_enc_jazz -ec crypto_kem_dec_jazz -oec $$(basename $@) $<

jindcpa.ec: $(TOP_DIR)code/jasmin/ref/jindcpa.jazz
	@mkdir $(EXT_DIR)
	cd $(EXT_DIR) && jasminc -ec indcpa_keypair_jazz -ec indcpa_enc_jazz -ec indcpa_dec_jazz -oec $$(basename $@) $<

%.jazz:
	cd $$(dirname $@) && $(MAKE) $$(basename $@)
