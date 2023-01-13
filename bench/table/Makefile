table.pdf: table.tex macros.tex
	pdflatex table.tex

macros.tex:
	$(MAKE) -C ../ -f Makefile.artifact

clean:
	rm -f *.aux *.log

distclean: clean
	rm -f table.pdf macros.tex
