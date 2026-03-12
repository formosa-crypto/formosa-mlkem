CFLAGS ?= -Wall -O3 -fomit-frame-pointer -fno-lto -march=native

ALL := \
 bin/formosa-mlkem-768-avx2 \
 bin/formosa-mlkem-1024-avx2 \
 bin/formosa-mlkem-768-ref \
 bin/formosa-mlkem-1024-ref

default: run

compile: $(ALL)

run: compile
	@./bin/formosa-mlkem-768-avx2 "" "fmlkem768 avx2" 1
	@./bin/formosa-mlkem-1024-avx2 "" "fmlkem1024 avx2" 0
	@./bin/formosa-mlkem-768-ref "" "fmlkem768 ref" 0
	@./bin/formosa-mlkem-1024-ref "" "fmlkem1024 ref" 0

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

#--randombytes
randombytes/librandombytes1.a:
	$(MAKE) -C randombytes/

#--misc
.PHONY: clean
clean:
	$(RM) -f bin/formosa-mlkem-*
	$(MAKE) -C randombytes/ clean
