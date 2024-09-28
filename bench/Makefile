# TODO: cleanup / improve depen. / generic

# --------------------------------------------------------------------
CC ?= clang-14
CFLAGS ?= -march=native -O3 -fomit-frame-pointer -fwrapv -Qunused-arguments -fPIC -fPIE

BIN ?= bin
TARGETS ?= \
$(BIN)/bench_pqclean_clean \
$(BIN)/bench_pqclean_avx2 \
$(BIN)/bench_jasmin_ref \
$(BIN)/bench_jasmin_avx2 \
$(BIN)/bench_jasmin_avx2v \
$(BIN)/bench_crystals_ref \
$(BIN)/bench_crystals_avx2 \
$(BIN)/bench_libjade_ref \
$(BIN)/bench_libjade_avx2

TTARGETS ?= \
$(BIN)/test_pqclean_clean \
$(BIN)/test_pqclean_avx2 \
$(BIN)/test_jasmin_ref \
$(BIN)/test_jasmin_avx2 \
$(BIN)/test_jasmin_avx2v \
$(BIN)/test_crystals_ref \
$(BIN)/test_crystals_avx2 \
$(BIN)/test_libjade_ref \
$(BIN)/test_libjade_avx2


# --------------------------------------------------------------------
.PHONY: all $(TARGETS)
all: $(TARGETS)

$(BIN)/bench_pqclean_clean: rnd libpq_clean | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pqclean/clean/ -DJADE_NAMESPACE=PQCLEAN_KYBER768_CLEAN -DJADE_NAMESPACE_LC=PQCLEAN_KYBER768_CLEAN_crypto_kem ./common/crypto_kem.c ./src/pqclean/clean/libkyber768_clean.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_pqclean_avx2: rnd libpq_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pqclean/avx2/ -DJADE_NAMESPACE=PQCLEAN_KYBER768_AVX2 -DJADE_NAMESPACE_LC=PQCLEAN_KYBER768_AVX2_crypto_kem ./common/crypto_kem.c ./src/pqclean/avx2/libkyber768_avx2.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_jasmin_ref: rnd libj_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/jasmin/ref/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM768_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_ref ./common/crypto_kem.c ./src/jasmin/ref/libkyber768_ref.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_jasmin_avx2: rnd libj_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/jasmin/avx2/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM768_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_avx2 ./common/crypto_kem.c ./src/jasmin/avx2/libkyber768_avx2.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_jasmin_avx2v: rnd libj_avx2v | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/jasmin/avx2v/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_AVX2V -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_avx2v ./common/crypto_kem.c ./src/jasmin/avx2v/libkyber768_avx2v.a ./src/randombytes/librandombytes1.a

#--
$(BIN)/bench_crystals_ref: rnd libcry_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pq-crystals/ref/ -D__HAKYBER__ -DJADE_NAMESPACE=PQCRYSTALS_KYBER768_REF -DJADE_NAMESPACE_LC=pqcrystals_kyber768_ref ./common/crypto_kem.c ./src/pq-crystals/ref/libpqcrystals_kyber768_ref.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_crystals_avx2: rnd libcry_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/pq-crystals/avx2/ -D__HAKYBER__ -DJADE_NAMESPACE=PQCRYSTALS_KYBER768_AVX2 -DJADE_NAMESPACE_LC=pqcrystals_kyber768_avx2 ./common/crypto_kem.c ./src/pq-crystals/avx2/libpqcrystals_kyber768_avx2.a ./src/randombytes/librandombytes1.a

#--
$(BIN)/bench_libjade_ref: rnd liblj_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/libjade/ref/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_ref ./common/crypto_kem.c ./src/libjade/ref/libkyber768_ref.a ./src/randombytes/librandombytes1.a

$(BIN)/bench_libjade_avx2: rnd liblj_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./common/ -I./src/libjade/avx2/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_avx2 ./common/crypto_kem.c ./src/libjade/avx2/libkyber768_avx2.a ./src/randombytes/librandombytes1.a



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

$(BIN)/test_jasmin_avx2v: libj_avx2v | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/jasmin/avx2v/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_AVX2V -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_avx2v ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/jasmin/avx2v/libkyber768_avx2v.a

#--
$(BIN)/test_crystals_ref: libcry_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/pq-crystals/ref/ -D__HAKYBER__ -DJADE_NAMESPACE=PQCRYSTALS_KYBER768_REF -DJADE_NAMESPACE_LC=pqcrystals_kyber768_ref ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/pq-crystals/ref/libpqcrystals_kyber768_ref.a

$(BIN)/test_crystals_avx2: libcry_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/pq-crystals/avx2/ -D__HAKYBER__ -DJADE_NAMESPACE=PQCRYSTALS_KYBER768_AVX2 -DJADE_NAMESPACE_LC=pqcrystals_kyber768_avx2 ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/pq-crystals/avx2/libpqcrystals_kyber768_avx2.a

# --
$(BIN)/test_libjade_ref: liblj_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/libjade/ref/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_ref ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/libjade/ref/libkyber768_ref.a

$(BIN)/test_libjade_avx2: liblj_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./test/ -I./src/libjade/avx2/ -DJADE_NAMESPACE=JADE_KEM_KYBER_KYBER768_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_kyber_kyber768_amd64_avx2 ./test/crypto_kem.c test/notrandombytes.c test/notrandombytes1.c ./src/libjade/avx2/libkyber768_avx2.a


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

libj_avx2v:
	make -C ./src/jasmin/avx2v/

# --
libcry_ref:
	make -C ./src/pq-crystals/ref/ libpqcrystals_kyber768_ref.a

libcry_avx2:
	make -C ./src/pq-crystals/avx2/ libpqcrystals_kyber768_avx2.a

# --
liblj_ref:
	make -C ./src/libjade/ref/

liblj_avx2:
	make -C ./src/libjade/avx2/


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
	make -C ./src/jasmin/avx2v/ clean
	make -C ./src/pq-crystals/ref/ clean
	make -C ./src/pq-crystals/avx2/ clean
	make -C ./src/libjade/ref/ clean
	make -C ./src/libjade/avx2/ clean

clean: libs-clean
	rm -fr $(BIN)

