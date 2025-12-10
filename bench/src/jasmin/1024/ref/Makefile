.PHONY: libkyber1024_ref.a clean distclean

JASMINC ?= ../../../../../jasmin/compiler/jasminc 

all: libkyber1024_ref.a

libkyber1024_ref.a: jkem.s
	$(CC) $(CFLAGS) -c jkem.s
	$(AR) -r $@ jkem.o

jkem.s: jkem.jazz
	$(JASMINC) -nowarning -lea $< -o $@

clean:
	rm -f *.o *.a

distclean: clean
	rm -f *.s
