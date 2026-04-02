CFLAGS ?= -Wall -O3 -fomit-frame-pointer -fno-lto -march=native

CPU ?= ""

ALL := \
 bin/formosa-mlkem-768-avx2 \
 bin/formosa-mlkem-1024-avx2 \
 bin/formosa-mlkem-768-ref \
 bin/formosa-mlkem-1024-ref

SELFTEST_ALL := \
 bin/selftest-formosa-mlkem-768-avx2 \
 bin/selftest-formosa-mlkem-1024-avx2 \
 bin/selftest-formosa-mlkem-768-ref \
 bin/selftest-formosa-mlkem-1024-ref

ALL_EXTENDED := $(ALL) \
 bin/pqcp-mlkem-768-avx2 \
 bin/pqcp-mlkem-1024-avx2 \
 bin/libcrux-mlkem-768-avx2 \
 bin/libcrux-mlkem-1024-avx2 \
 bin/mlkem-native-768-avx2 \
 bin/mlkem-native-1024-avx2 \
 bin/pqcrystals-kyber-768-avx2 \
 bin/pqcrystals-kyber-1024-avx2

SELFTEST_EXTENDED := $(SELFTEST_ALL) \
 bin/selftest-pqcp-mlkem-768-avx2 \
 bin/selftest-pqcp-mlkem-1024-avx2 \
 bin/selftest-libcrux-mlkem-768-avx2 \
 bin/selftest-libcrux-mlkem-1024-avx2 \
 bin/selftest-mlkem-native-768-avx2 \
 bin/selftest-mlkem-native-1024-avx2 \
 bin/selftest-pqcrystals-kyber-768-avx2 \
 bin/selftest-pqcrystals-kyber-1024-avx2

default: run

compile: $(ALL)
compile-extended: $(ALL_EXTENDED)
selftest-compile: $(SELFTEST_ALL)
selftest-compile-extended: $(SELFTEST_EXTENDED)
graphics: graphics/derand-768.svg graphics/derand-1024.svg graphics/derand-768-no-pqcrystal.svg graphics/derand-1024-no-pqcrystal.svg
graphics-png: graphics/derand-768.png graphics/derand-1024.png graphics/derand-768-no-pqcrystal.png graphics/derand-1024-no-pqcrystal.png

run: compile
	@./bin/formosa-mlkem-768-avx2 "$(CPU)" "f.mlkem768 avx2" 1
	@./bin/formosa-mlkem-1024-avx2 "$(CPU)" "f.mlkem1024 avx2" 0
	@./bin/formosa-mlkem-768-ref "$(CPU)" "f.mlkem768 ref" 0
	@./bin/formosa-mlkem-1024-ref "$(CPU)" "f.mlkem1024 ref" 0

run-extended: compile-extended
	@./bin/formosa-mlkem-768-avx2 "$(CPU)" "f.mlkem768 avx2" 1
	@./bin/formosa-mlkem-1024-avx2 "$(CPU)" "f.mlkem1024 avx2" 0
	@./bin/libcrux-mlkem-768-avx2 "$(CPU)" "libcrux768 avx2" 0
	@./bin/libcrux-mlkem-1024-avx2 "$(CPU)" "libcrux1024 avx2" 0
	@./bin/mlkem-native-768-avx2 "$(CPU)" "nat.mlkem768 avx2" 0
	@./bin/mlkem-native-1024-avx2 "$(CPU)" "nat.mlkem1024 avx2" 0
	@./bin/pqcrystals-kyber-768-avx2 "$(CPU)" "pqc.kyber768 avx2" 0
	@./bin/pqcrystals-kyber-1024-avx2 "$(CPU)" "pqc.kyber1024 avx2" 0

test: selftest-compile
	@./bin/selftest-formosa-mlkem-768-avx2 "f.mlkem768 avx2"
	@./bin/selftest-formosa-mlkem-1024-avx2 "f.mlkem1024 avx2"
	@./bin/selftest-formosa-mlkem-768-ref "f.mlkem768 ref"
	@./bin/selftest-formosa-mlkem-1024-ref "f.mlkem1024 ref"

test-extended: selftest-compile-extended
	@./bin/selftest-formosa-mlkem-768-avx2 "f.mlkem768 avx2"
	@./bin/selftest-formosa-mlkem-1024-avx2 "f.mlkem1024 avx2"
	@./bin/selftest-formosa-mlkem-768-ref "f.mlkem768 ref"
	@./bin/selftest-formosa-mlkem-1024-ref "f.mlkem1024 ref"
	@./bin/selftest-pqcp-mlkem-768-avx2 "pqcp.mlkem768 avx2"
	@./bin/selftest-pqcp-mlkem-1024-avx2 "pqcp.mlkem1024 avx2"
	@./bin/selftest-libcrux-mlkem-768-avx2 "libcrux768 auto"
	@./bin/selftest-libcrux-mlkem-1024-avx2 "libcrux1024 auto"
	@./bin/selftest-mlkem-native-768-avx2 "nat.mlkem768 avx2"
	@./bin/selftest-mlkem-native-1024-avx2 "nat.mlkem1024 avx2"
	@./bin/selftest-pqcrystals-kyber-768-avx2 "pqc.kyber768 avx2"
	@./bin/selftest-pqcrystals-kyber-1024-avx2 "pqc.kyber1024 avx2"

#-- formosa-mlkem (this repository ----------------------------------
#-- avx2
bin/formosa-mlkem-768-avx2: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem768_amd64_avx2 \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_avx2 \
		-Irandombytes/ \
		-I../code/jasmin/768/avx2/include/ \
    ../code/jasmin/768/avx2/jkem.s \
    randombytes/librandombytes1.a

bin/formosa-mlkem-1024-avx2: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem1024_amd64_avx2 \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_avx2 \
		-Irandombytes/ \
		-I../code/jasmin/1024/avx2/include/ \
    ../code/jasmin/1024/avx2/jkem.s \
    randombytes/librandombytes1.a

bin/selftest-formosa-mlkem-768-avx2: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/selftest.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem768_amd64_avx2 \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_avx2 \
		-Irandombytes/ \
		-I../code/jasmin/768/avx2/include/ \
    ../code/jasmin/768/avx2/jkem.s \
    randombytes/librandombytes1.a

bin/selftest-formosa-mlkem-1024-avx2: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/selftest.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem1024_amd64_avx2 \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_avx2 \
		-Irandombytes/ \
		-I../code/jasmin/1024/avx2/include/ \
    ../code/jasmin/1024/avx2/jkem.s \
    randombytes/librandombytes1.a

#--ref
bin/formosa-mlkem-768-ref: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem768_amd64_ref \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_ref \
		-Irandombytes/ \
		-I../code/jasmin/768/ref/include/ \
    ../code/jasmin/768/ref/jkem.s \
    randombytes/librandombytes1.a

bin/formosa-mlkem-1024-ref: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem1024_amd64_ref \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_ref \
		-Irandombytes/ \
		-I../code/jasmin/1024/ref/include/ \
    ../code/jasmin/1024/ref/jkem.s \
    randombytes/librandombytes1.a

bin/selftest-formosa-mlkem-768-ref: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/selftest.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem768_amd64_ref \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_ref \
		-Irandombytes/ \
		-I../code/jasmin/768/ref/include/ \
    ../code/jasmin/768/ref/jkem.s \
    randombytes/librandombytes1.a

bin/selftest-formosa-mlkem-1024-ref: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/selftest.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem1024_amd64_ref \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_ref \
		-Irandombytes/ \
		-I../code/jasmin/1024/ref/include/ \
    ../code/jasmin/1024/ref/jkem.s \
    randombytes/librandombytes1.a

#-- mlkem-libjade (from pq-code-package) ----------------------------
#--avx2
bin/pqcp-mlkem-768-avx2: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem768_amd64_avx2 \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_avx2 \
		-Irandombytes/ \
		-I../code/jasmin/768/avx2/include/ \
		third_party/mlkem-libjade/src/mlkem768_amd64_avx2/mlkem768_amd64_avx2.s \
    randombytes/librandombytes1.a

bin/pqcp-mlkem-1024-avx2: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem1024_amd64_avx2 \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_avx2 \
		-Irandombytes/ \
		-I../code/jasmin/1024/avx2/include/ \
		third_party/mlkem-libjade/src/mlkem1024_amd64_avx2/mlkem1024_amd64_avx2.s \
    randombytes/librandombytes1.a

bin/selftest-pqcp-mlkem-768-avx2: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/selftest.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem768_amd64_avx2 \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_avx2 \
		-Irandombytes/ \
		-I../code/jasmin/768/avx2/include/ \
		third_party/mlkem-libjade/src/mlkem768_amd64_avx2/mlkem768_amd64_avx2.s \
    randombytes/librandombytes1.a

bin/selftest-pqcp-mlkem-1024-avx2: randombytes/librandombytes1.a
	$(CC) $(CFLAGS) -o $@ src/selftest.c \
		-DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem1024_amd64_avx2 \
		-DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_avx2 \
		-Irandombytes/ \
		-I../code/jasmin/1024/avx2/include/ \
		third_party/mlkem-libjade/src/mlkem1024_amd64_avx2/mlkem1024_amd64_avx2.s \
    randombytes/librandombytes1.a

#-- mlkem-native (from pq-code-package) -----------------------------
#--avx2
bin/mlkem-native-768-avx2: randombytes/librandombytes1.a third_party/mlkem-native/test/build/libmlkem768.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=PQCP_MLKEM_NATIVE_MLKEM768 \
		-DJADE_NAMESPACE_LC=PQCP_MLKEM_NATIVE_MLKEM768 \
		-Irandombytes/ \
		-Ithird_party/bindings/mlkem-native-768/ \
		third_party/mlkem-native/test/build/libmlkem768.a \
    randombytes/librandombytes1.a

bin/mlkem-native-1024-avx2: randombytes/librandombytes1.a third_party/mlkem-native/test/build/libmlkem1024.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=PQCP_MLKEM_NATIVE_MLKEM1024 \
		-DJADE_NAMESPACE_LC=PQCP_MLKEM_NATIVE_MLKEM1024 \
		-Irandombytes/ \
		-Ithird_party/bindings/mlkem-native-1024/ \
		third_party/mlkem-native/test/build/libmlkem1024.a \
    randombytes/librandombytes1.a

bin/selftest-mlkem-native-768-avx2: randombytes/librandombytes1.a third_party/mlkem-native/test/build/libmlkem768.a
	$(CC) $(CFLAGS) -o $@ src/selftest.c \
		-DJADE_NAMESPACE=PQCP_MLKEM_NATIVE_MLKEM768 \
		-DJADE_NAMESPACE_LC=PQCP_MLKEM_NATIVE_MLKEM768 \
		-Irandombytes/ \
		-Ithird_party/bindings/mlkem-native-768/ \
		third_party/mlkem-native/test/build/libmlkem768.a \
    randombytes/librandombytes1.a

bin/selftest-mlkem-native-1024-avx2: randombytes/librandombytes1.a third_party/mlkem-native/test/build/libmlkem1024.a
	$(CC) $(CFLAGS) -o $@ src/selftest.c \
		-DJADE_NAMESPACE=PQCP_MLKEM_NATIVE_MLKEM1024 \
		-DJADE_NAMESPACE_LC=PQCP_MLKEM_NATIVE_MLKEM1024 \
		-Irandombytes/ \
		-Ithird_party/bindings/mlkem-native-1024/ \
		third_party/mlkem-native/test/build/libmlkem1024.a \
    randombytes/librandombytes1.a

third_party/mlkem-native/test/build/libmlkem768.a:
	$(MAKE) -C third_party/mlkem-native/ build OPT=1 AUTO=1

third_party/mlkem-native/test/build/libmlkem1024.a:
	$(MAKE) -C third_party/mlkem-native/ build OPT=1 AUTO=1

#-- libcrux ---------------------------------------------------------
LIBCRUX_CARGO ?= cargo
LIBCRUX_TARGET_DIR := third_party/libcrux-wrapper/target
LIBCRUX_STATICLIB := $(LIBCRUX_TARGET_DIR)/release/liblibcrux_bench_wrapper.a
LIBCRUX_CFLAGS := $(CFLAGS)
LIBCRUX_LDLIBS := -lpthread -ldl -lm

bin/libcrux-mlkem-768-avx2: randombytes/librandombytes1.a $(LIBCRUX_STATICLIB)
	$(CC) $(LIBCRUX_CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=LIBCRUX_MLKEM768 \
		-DJADE_NAMESPACE_LC=LIBCRUX_MLKEM768 \
		-Irandombytes/ \
		-Ithird_party/bindings/libcrux-mlkem-768/ \
		$(LIBCRUX_STATICLIB) \
		randombytes/librandombytes1.a \
		$(LIBCRUX_LDLIBS)

bin/libcrux-mlkem-1024-avx2: randombytes/librandombytes1.a $(LIBCRUX_STATICLIB)
	$(CC) $(LIBCRUX_CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=LIBCRUX_MLKEM1024 \
		-DJADE_NAMESPACE_LC=LIBCRUX_MLKEM1024 \
		-Irandombytes/ \
		-Ithird_party/bindings/libcrux-mlkem-1024/ \
		$(LIBCRUX_STATICLIB) \
		randombytes/librandombytes1.a \
		$(LIBCRUX_LDLIBS)

bin/selftest-libcrux-mlkem-768-avx2: randombytes/librandombytes1.a $(LIBCRUX_STATICLIB)
	$(CC) $(LIBCRUX_CFLAGS) -o $@ src/selftest.c \
		-DJADE_NAMESPACE=LIBCRUX_MLKEM768 \
		-DJADE_NAMESPACE_LC=LIBCRUX_MLKEM768 \
		-Irandombytes/ \
		-Ithird_party/bindings/libcrux-mlkem-768/ \
		$(LIBCRUX_STATICLIB) \
		randombytes/librandombytes1.a \
		$(LIBCRUX_LDLIBS)

bin/selftest-libcrux-mlkem-1024-avx2: randombytes/librandombytes1.a $(LIBCRUX_STATICLIB)
	$(CC) $(LIBCRUX_CFLAGS) -o $@ src/selftest.c \
		-DJADE_NAMESPACE=LIBCRUX_MLKEM1024 \
		-DJADE_NAMESPACE_LC=LIBCRUX_MLKEM1024 \
		-Irandombytes/ \
		-Ithird_party/bindings/libcrux-mlkem-1024/ \
		$(LIBCRUX_STATICLIB) \
		randombytes/librandombytes1.a \
		$(LIBCRUX_LDLIBS)

$(LIBCRUX_STATICLIB): third_party/libcrux-wrapper/Cargo.toml third_party/libcrux-wrapper/src/lib.rs
	cd third_party/libcrux-wrapper && \
	  LIBCRUX_ENABLE_SIMD256=1 $(LIBCRUX_CARGO) build --release

#-- pqcrystals-kyber ------------------------------------------------
KYBER_AVX2_DIR := third_party/pqcrystals-kyber/avx2
KYBER_AVX2_SRCS := kem.c indcpa.c polyvec.c poly.c fq.S shuffle.S ntt.S \
  invntt.S basemul.S consts.c rejsample.c cbd.c verify.c \
  fips202.c fips202x4.c symmetric-shake.c \
  keccak4x/KeccakP-1600-times4-SIMD256.c
KYBER_AVX2_CFLAGS := -mavx2 -mbmi2 -mpopcnt

third_party/pqcrystals-kyber/build/libkyber768_avx2.a: $(addprefix $(KYBER_AVX2_DIR)/,$(KYBER_AVX2_SRCS))
	@mkdir -p third_party/pqcrystals-kyber/build/768
	cd $(KYBER_AVX2_DIR) && \
	  $(CC) $(CFLAGS) $(KYBER_AVX2_CFLAGS) -DKYBER_K=3 -c $(KYBER_AVX2_SRCS) && \
	  mv *.o ../../../third_party/pqcrystals-kyber/build/768/
	ar rcs $@ third_party/pqcrystals-kyber/build/768/*.o

third_party/pqcrystals-kyber/build/libkyber1024_avx2.a: $(addprefix $(KYBER_AVX2_DIR)/,$(KYBER_AVX2_SRCS))
	@mkdir -p third_party/pqcrystals-kyber/build/1024
	cd $(KYBER_AVX2_DIR) && \
	  $(CC) $(CFLAGS) $(KYBER_AVX2_CFLAGS) -DKYBER_K=4 -c $(KYBER_AVX2_SRCS) && \
	  mv *.o ../../../third_party/pqcrystals-kyber/build/1024/
	ar rcs $@ third_party/pqcrystals-kyber/build/1024/*.o

bin/pqcrystals-kyber-768-avx2: randombytes/librandombytes1.a third_party/pqcrystals-kyber/build/libkyber768_avx2.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=pqcrystals_kyber768_avx2 \
		-DJADE_NAMESPACE_LC=pqcrystals_kyber768_avx2 \
		-Irandombytes/ \
		-Ithird_party/bindings/pqcrystals-kyber-768/ \
		third_party/pqcrystals-kyber/build/libkyber768_avx2.a \
    randombytes/librandombytes1.a

bin/pqcrystals-kyber-1024-avx2: randombytes/librandombytes1.a third_party/pqcrystals-kyber/build/libkyber1024_avx2.a
	$(CC) $(CFLAGS) -o $@ src/crypto_kem.c \
		-DJADE_NAMESPACE=pqcrystals_kyber1024_avx2 \
		-DJADE_NAMESPACE_LC=pqcrystals_kyber1024_avx2 \
		-Irandombytes/ \
		-Ithird_party/bindings/pqcrystals-kyber-1024/ \
		third_party/pqcrystals-kyber/build/libkyber1024_avx2.a \
    randombytes/librandombytes1.a

bin/selftest-pqcrystals-kyber-768-avx2: randombytes/librandombytes1.a third_party/pqcrystals-kyber/build/libkyber768_avx2.a
	$(CC) $(CFLAGS) -o $@ src/selftest.c \
		-DJADE_NAMESPACE=pqcrystals_kyber768_avx2 \
		-DJADE_NAMESPACE_LC=pqcrystals_kyber768_avx2 \
		-Irandombytes/ \
		-Ithird_party/bindings/pqcrystals-kyber-768/ \
		third_party/pqcrystals-kyber/build/libkyber768_avx2.a \
    randombytes/librandombytes1.a

bin/selftest-pqcrystals-kyber-1024-avx2: randombytes/librandombytes1.a third_party/pqcrystals-kyber/build/libkyber1024_avx2.a
	$(CC) $(CFLAGS) -o $@ src/selftest.c \
		-DJADE_NAMESPACE=pqcrystals_kyber1024_avx2 \
		-DJADE_NAMESPACE_LC=pqcrystals_kyber1024_avx2 \
		-Irandombytes/ \
		-Ithird_party/bindings/pqcrystals-kyber-1024/ \
		third_party/pqcrystals-kyber/build/libkyber1024_avx2.a \
    randombytes/librandombytes1.a

#-- randombytes -----------------------------------------------------
randombytes/librandombytes1.a:
	$(MAKE) -C randombytes/

graphics/derand-768.svg graphics/derand-1024.svg graphics/derand-768-no-pqcrystal.svg graphics/derand-1024-no-pqcrystal.svg: results/run-extended-latest.md scripts/plot_results.py
	@mkdir -p graphics
	python3 scripts/plot_results.py results/run-extended-latest.md graphics

graphics/derand-768.png: graphics/derand-768.svg
	convert -density 240 $< -background white -alpha remove -alpha off $@

graphics/derand-1024.png: graphics/derand-1024.svg
	convert -density 240 $< -background white -alpha remove -alpha off $@

graphics/derand-768-no-pqcrystal.png: graphics/derand-768-no-pqcrystal.svg
	convert -density 240 $< -background white -alpha remove -alpha off $@

graphics/derand-1024-no-pqcrystal.png: graphics/derand-1024-no-pqcrystal.svg
	convert -density 240 $< -background white -alpha remove -alpha off $@

#-- misc ------------------------------------------------------------
.PHONY: clean
clean:
	$(RM) -f bin/formosa-mlkem-*
	$(RM) -f bin/selftest-formosa-mlkem-*
	$(RM) -f bin/selftest-libcrux-mlkem-*
	$(RM) -f bin/selftest-mlkem-native-*
	$(RM) -f bin/selftest-pqcp-mlkem-*
	$(RM) -f bin/selftest-pqcrystals-kyber-*
	$(RM) -f bin/libcrux-mlkem-*
	$(RM) -f bin/mlkem-native-*
	$(RM) -f bin/pqcp-mlkem-*
	$(RM) -f bin/pqcrystals-kyber-*
	$(RM) -rf third_party/pqcrystals-kyber/build
	$(RM) -rf third_party/libcrux-wrapper/target
	$(MAKE) -C randombytes/ clean
	$(MAKE) -C third_party/mlkem-native clean
