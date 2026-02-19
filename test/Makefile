# TODO: cleanup / improve depen. / generic

# --------------------------------------------------------------------
CC ?= clang-14
CFLAGS ?= -O3 -fomit-frame-pointer -fwrapv -fPIC -fPIE -mavx2 -march=native

BIN ?= bin

TARGETS ?= \
$(BIN)/test_jasmin_768_ref \
$(BIN)/test_jasmin_768_avx2 \
$(BIN)/test_jasmin_1024_ref \
$(BIN)/test_jasmin_1024_avx2 \
$(BIN)/test_mlkem_native_768 \
$(BIN)/test_mlkem_native_1024

MTARGETS ?= \
$(BIN)/memory_jasmin_768_ref \
$(BIN)/memory_jasmin_768_avx2 \
$(BIN)/memory_jasmin_1024_ref \
$(BIN)/memory_jasmin_1024_avx2

# --------------------------------------------------------------------
.PHONY: all $(TARGETS)
all: $(TARGETS)

$(BIN)/test_jasmin_768_ref: libj_768_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./correctness/ -I./../bench/jasmin/768/ref/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM768_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_ref ./correctness/checksums.c correctness/notrandombytes.c correctness/notrandombytes1.c ../bench/src/jasmin/768/ref/libkyber768_ref.a

$(BIN)/test_jasmin_768_avx2: libj_768_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./correctness/ -I./../bench/jasmin/768/avx2/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM768_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_avx2 ./correctness/checksums.c correctness/notrandombytes.c correctness/notrandombytes1.c ../bench/src/jasmin/768/avx2/libkyber768_avx2.a

$(BIN)/test_jasmin_1024_ref: libj_1024_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./correctness/ -I./../bench/src/jasmin/1024/ref/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM1024_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_ref ./correctness/checksums.c correctness/notrandombytes.c correctness/notrandombytes1.c ../bench/src/jasmin/1024/ref/libkyber1024_ref.a

$(BIN)/test_jasmin_1024_avx2: libj_1024_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./correctness/ -I./../bench/src/jasmin/1024/avx2/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM1024_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_avx2 ./correctness/checksums.c correctness/notrandombytes.c correctness/notrandombytes1.c ../bench/src/jasmin/1024/avx2/libkyber1024_avx2.a

#--

$(BIN)/test_mlkem_native_768: libmn | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./correctness/ -I./../bench/src/bindings/mlkem-native-768 -DJADE_NAMESPACE=PQCP_MLKEM_NATIVE_MLKEM768 -DJADE_NAMESPACE_LC=PQCP_MLKEM_NATIVE_MLKEM768 ./correctness/checksums.c correctness/notrandombytes.c correctness/notrandombytes1.c ../bench/src/mlkem-native/libmlkem768.a

$(BIN)/test_mlkem_native_1024: libmn | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./correctness/ -I./../bench/src/bindings/mlkem-native-1024 -DJADE_NAMESPACE=PQCP_MLKEM_NATIVE_MLKEM1024 -DJADE_NAMESPACE_LC=PQCP_MLKEM_NATIVE_MLKEM1024 ./correctness/checksums.c correctness/notrandombytes.c correctness/notrandombytes1.c ../bench/src/mlkem-native/libmlkem1024.a

# --------------------------------------------------------------------

all_memory: $(MTARGETS)

$(BIN)/memory_jasmin_768_ref: libj_768_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./memory/ -I./../bench/src/jasmin/768/ref/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM768_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_ref ./memory/memory.c correctness/notrandombytes.c correctness/notrandombytes1.c ../bench/src/jasmin/768/ref/libkyber768_ref.a

$(BIN)/memory_jasmin_768_avx2: libj_768_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./memory/ -I./../bench/src/jasmin/768/avx2/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM768_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_avx2 ./memory/memory.c correctness/notrandombytes.c correctness/notrandombytes1.c ../bench/src/jasmin/768/avx2/libkyber768_avx2.a

$(BIN)/memory_jasmin_1024_ref: libj_1024_ref | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./memory/ -I./../bench/src/jasmin/1024/ref/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM1024_AMD64_REF -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_ref ./memory/memory.c correctness/notrandombytes.c correctness/notrandombytes1.c ../bench/src/jasmin/1024/ref/libkyber1024_ref.a

$(BIN)/memory_jasmin_1024_avx2: libj_1024_avx2 | $(BIN)
	$(CC) $(CFLAGS) -o $@ -I./memory/ -I./../bench/src/jasmin/1024/avx2/ -DJADE_NAMESPACE=JADE_KEM_MLKEM_MLKEM1024_AMD64_AVX2 -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem1024_amd64_avx2 ./memory/memory.c correctness/notrandombytes.c correctness/notrandombytes1.c ../bench/src/jasmin/1024/avx2/libkyber1024_avx2.a


# --------------------------------------------------------------------

$(BIN): ; @mkdir -p $@

# --------------------------------------------------------------------
.PHONY: rnd

rnd:
	make -C ../bench/src/randombytes/

libj_768_ref:
	make -C ../bench/src/jasmin/768/ref

libj_768_avx2:
	make -C ../bench/src/jasmin/768/avx2/

libj_1024_ref:
	make -C ../bench/src/jasmin/1024/ref

libj_1024_avx2:
	make -C ../bench/src/jasmin/1024/avx2/

libmn:
	make -C ../bench/src/mlkem-native lib

# --------------------------------------------------------------------

run: $(TARGETS)
	for d in $(TARGETS); do (./$$d > $$d.sha); done

memory_768_ref: $(BIN)/memory_jasmin_768_ref
	(valgrind --leak-check=full --error-exitcode=1 --log-file=$@.out ./$(BIN)/memory_jasmin_768_ref)

memory_768_avx2: $(BIN)/memory_jasmin_768_avx2
	(valgrind --leak-check=full --error-exitcode=1 --log-file=$@.out ./$(BIN)/memory_jasmin_768_avx2)

memory_1024_ref: $(BIN)/memory_jasmin_1024_ref
	(valgrind --leak-check=full --error-exitcode=1 --log-file=$@.out ./$(BIN)/memory_jasmin_1024_ref)

memory_1024_avx2: $(BIN)/memory_jasmin_1024_avx2
	(valgrind --leak-check=full --error-exitcode=1 --log-file=$@.out ./$(BIN)/memory_jasmin_1024_avx2)

memory-check: $(MTARGETS)
	for d in $(MTARGETS); do ((valgrind --leak-check=full --error-exitcode=1 --log-file=$$d-mem.out ./$$d) || true); done

# --------------------------------------------------------------------
.PHONY: libs-clean clean

libs-clean:
	make -C ./src/randombytes/ clean
	make -C ./src/jasmin/768/ref/ clean
	make -C ./src/jasmin/768/avx2/ clean
	make -C ./src/jasmin/1024/ref/ clean
	make -C ./src/jasmin/1024/avx2/ clean
	make -C ./src/mlkem-native/ clean

clean: libs-clean
	rm -fr $(BIN)

