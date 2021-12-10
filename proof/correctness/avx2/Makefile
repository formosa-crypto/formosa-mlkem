ECSRC := \
 KyberCCA_avx2.ec \
 KyberCPA_avx2.ec

TOP_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))/../../..))

.PHONY: default generate clean

default: generate

generate: $(ECSRC)
	@true

clean:
	rm -f $(ECSRC)
	find . -name "*Array*.ec" | grep -v "p\.ec" | while read f; do rm -f $$f; done

KyberCCA_avx2.ec: $(TOP_DIR)code/jasmin/avx2/jindcca.jazz
	cd $$(dirname $@) && jasminc -ec indcca_keypair_jazz -ec indcca_enc_jazz -ec indcca_dec_jazz -oec $$(basename $@) $<

KyberCPA_avx2.ec: $(TOP_DIR)code/jasmin/avx2/jindcpa.jazz
	cd $$(dirname $@) && jasminc -ec indcpa_keypair_jazz -ec indcpa_enc_jazz -ec indcpa_dec_jazz -oec $$(basename $@) $<

%.jazz:
	cd $$(dirname $@) && $(MAKE) $$(basename $@)
