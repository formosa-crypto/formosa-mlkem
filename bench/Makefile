# TODO: cleanup / improve depen. / generic

# --------------------------------------------------------------------
CC ?= gcc
CFLAGS ?= -Wall -Wno-unused-function -O3
BIN ?= bin
TARGETS ?= \
$(BIN)/bench_pqclean_clean \
$(BIN)/bench_pqclean_avx2 \
$(BIN)/bench_jasmin_ref \
$(BIN)/bench_jasmin_avx2 \
$(BIN)/bench_jasmin_avx2r \
$(BIN)/bench_crystals_ref

TTARGETS ?= \
$(BIN)/test_pqclean_clean \
$(BIN)/test_pqclean_avx2 \
$(BIN)/test_jasmin_ref \
$(BIN)/test_jasmin_avx2 \
$(BIN)/test_jasmin_avx2r \
$(BIN)/test_crystals_ref


# --------------------------------------------------------------------
.PHONY: all $(TARGETS)
all: $(TARGETS)

$(BIN)/bench_pqclean_clean: rnd libpq_clean | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pqclean/clean/ -DJADE_NAMESPACE=PQCLEAN_KYBER768_CLEAN -DJADE_NAMESPACE_LC=PQCLEAN_KYBER768_CLEAN_crypto_kem ./common/crypto_kem.c ./src/pqclean/clean/libkyber768_clean.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_pqclean_avx2: rnd libpq_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pqclean/avx2/ -DJADE_NAMESPACE=PQCLEAN_KYBER768_AVX2 -DJADE_NAMESPACE_LC=PQCLEAN_KYBER768_AVX2_crypto_kem ./common/crypto_kem.c ./src/pqclean/avx2/libkyber768_avx2.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_jasmin_ref: rnd libj_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/jasmin/ref/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_ref ./common/crypto_kem.c ./src/jasmin/ref/libkyber768_ref.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_jasmin_avx2: rnd libj_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/jasmin/avx2/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_avx2 ./common/crypto_kem.c ./src/jasmin/avx2/libkyber768_avx2.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_jasmin_avx2r: rnd libj_avx2r | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/jasmin/avx2r/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_AVX2R -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_avx2r ./common/crypto_kem.c ./src/jasmin/avx2r/libkyber768_avx2r.a ./src/randombytes/librandombytes1.a

#--
$(BIN)/bench_crystals_ref: rnd libcry_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pq-crystals/ref/ -D__HAKYBER__ -DJADE_NAMESPACE=PQCRYSTALS_KYBER768_REF -DJADE_NAMESPACE_LC=pqcrystals_kyber768_ref ./common/crypto_kem.c ./src/pq-crystals/ref/libpqcrystals_kyber768_ref.so ./src/pq-crystals/ref/libpqcrystals_fips202_ref.so ./src/randombytes/librandombytes1.a


# --------------------------------------------------------------------
.PHONY: all $(TTARGETS)
all-tests: $(TTARGETS)

$(BIN)/test_pqclean_clean: libpq_clean | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/pqclean/clean/ -DJADE_NAMESPACE=PQCLEAN_KYBER768_CLEAN -DJADE_NAMESPACE_LC=PQCLEAN_KYBER768_CLEAN_crypto_kem ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/pqclean/clean/libkyber768_clean.a

$(BIN)/test_pqclean_avx2: libpq_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/pqclean/avx2/ -DJADE_NAMESPACE=PQCLEAN_KYBER768_AVX2 -DJADE_NAMESPACE_LC=PQCLEAN_KYBER768_AVX2_crypto_kem ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/pqclean/avx2/libkyber768_avx2.a

$(BIN)/test_jasmin_ref: libj_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/jasmin/ref/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_ref ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/jasmin/ref/libkyber768_ref.a

$(BIN)/test_jasmin_avx2: libj_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/jasmin/avx2/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_avx2 ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/jasmin/avx2/libkyber768_avx2.a

$(BIN)/test_jasmin_avx2r: libj_avx2r | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/jasmin/avx2r/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_AVX2R -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_avx2r ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/jasmin/avx2r/libkyber768_avx2r.a

#--
$(BIN)/test_crystals_ref: libcry_ref | $(BIN)
	$(CC) $(CFLAGS) -g -o $@ -I./test/ -I./src/pq-crystals/ref/ -D__HAKYBER__ -DJADE_NAMESPACE=PQCRYSTALS_KYBER768_REF -DJADE_NAMESPACE_LC=pqcrystals_kyber768_ref ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/pq-crystals/ref/libpqcrystals_kyber768_ref.so ./src/pq-crystals/ref/libpqcrystals_fips202_ref.so



# --------------------------------------------------------------------

$(BIN): ; @mkdir -p $@

# --------------------------------------------------------------------
.PHONY: rnd

rnd:
	make -C ./src/randombytes/

libpq_clean:
	make -C ./src/pqclean/clean/

libpq_avx2:
	make -C ./src/pqclean/avx2/

libj_ref:
	make -C ./src/jasmin/ref/

libj_avx2:
	make -C ./src/jasmin/avx2/

libj_avx2r:
	make -C ./src/jasmin/avx2r/

# --
libcry_ref:
	make -C ./src/pq-crystals/ref/ libpqcrystals_kyber768_ref.so
	make -C ./src/pq-crystals/ref/ libpqcrystals_fips202_ref.so


# --------------------------------------------------------------------
run: $(TARGETS)
	for d in $(TARGETS); do (./$$d > $$d.out); done

run-tests: $(TTARGETS)
	for d in $(TTARGETS); do (./$$d); done

# --------------------------------------------------------------------
.PHONY: libs-clean clean

libs-clean:
	make -C ./src/randombytes/ clean
	make -C ./src/pqclean/clean/ clean
	make -C ./src/pqclean/avx2/ clean
	make -C ./src/jasmin/ref/ clean
	make -C ./src/jasmin/avx2/ clean
	make -C ./src/jasmin/avx2r/ clean
	make -C ./src/pq-crystals/ref/ clean

clean: libs-clean
	rm -fr $(BIN)

