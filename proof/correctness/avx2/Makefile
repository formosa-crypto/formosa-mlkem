ECSRC := \
 KyberCCA_avx2.ec \
 KyberCPA_avx2.ec

EXT_DIR := extraction

TOP_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))/../../..))

.PHONY: default generate clean

default: generate

generate: $(ECSRC)
	@true

clean:
	rm -rf $(EXT_DIR)
	find . -name "*Array*.ec" | grep -v "p\.ec" | while read f; do rm -f $$f; done

KyberCCA_avx2.ec: $(TOP_DIR)code/jasmin/avx2/jindcca.jazz
	@mkdir -p $(EXT_DIR)
	cd $(EXT_DIR) && jasminc -ec indcca_keypair_jazz -ec indcca_enc_jazz -ec indcca_dec_jazz -oec $$(basename $@) $<

KyberCPA_avx2.ec: $(TOP_DIR)code/jasmin/avx2/jindcpa.jazz
	@mkdir -p $(EXT_DIR)
	cd $(EXT_DIR) && jasminc -ec indcpa_keypair_jazz -ec indcpa_enc_jazz -ec indcpa_dec_jazz -oec $$(basename $@) $<

#%.jazz:
#	cd $$(dirname $@) && $(MAKE) $$(basename $@)
