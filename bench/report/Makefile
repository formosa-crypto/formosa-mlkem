HAKYBER = $(abspath $(dir  $(filter %Makefile, $(MAKEFILE_LIST)))../../)
BENCH   = $(HAKYBER)/bench
RESULTS = $(BENCH)/results

MACROS = \
 $(RESULTS)/haswell-i74770k/supercop/macros.tex \
 $(RESULTS)/haswell-i74770k/macros.tex \
 $(RESULTS)/alderlake-i71260p/supercop/macros.tex \
 $(RESULTS)/alderlake-i71260p/macros.tex \
 $(RESULTS)/skylake-i76500u/supercop/macros.tex \
 $(RESULTS)/skylake-i76500u/macros.tex \
 $(RESULTS)/cannonlake-i710700k/supercop/macros.tex \
 $(RESULTS)/cannonlake-i710700k/macros.tex

report.pdf: report.tex macros.tex
	pdflatex $<
	pdflatex $<

macros.tex: $(MACROS)
	cat $(MACROS) > $@

.PHONY: clean distclean
clean:
	rm -f *.aux *.log

distclean: clean
	rm -f report.pdf macros.tex
