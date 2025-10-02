CC ?= clang-14
CFLAGS ?= -march=native -O3 -fomit-frame-pointer -fwrapv -fPIC -fPIE

KeccakP-1600-times4-SIMD256.o: KeccakP-1600-times4-SIMD256.c \
  align.h brg_endian.h KeccakP-1600-times4-SnP.h \
  KeccakP-1600-unrolling.macros SIMD256-config.h
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	$(RM) KeccakP-1600-times4-SIMD256.o
