JASMINC?=jasminc

.SUFFIXES: .jazz .log

all: ref.log ref-derand.log avx.log avx-derand.log

clean:
	$(RM) *.log

%.log: %.jazz
	$(JASMINC) -timings -until_arraycopy $< | tee $@
