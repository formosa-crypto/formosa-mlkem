#ifndef JADE_KEM_MLKEM_MLKEM1024_AMD64_AVX2_API_H
#define JADE_KEM_MLKEM_MLKEM1024_AMD64_AVX2_API_H

#include <stdint.h>

#define JADE_KEM_MLKEM_MLKEM1024_AMD64_AVX2_SECRETKEYBYTES  3168
#define JADE_KEM_MLKEM_MLKEM1024_AMD64_AVX2_PUBLICKEYBYTES  1568
#define JADE_KEM_MLKEM_MLKEM1024_AMD64_AVX2_CIPHERTEXTBYTES 1568
#define JADE_KEM_MLKEM_MLKEM1024_AMD64_AVX2_BYTES           32

#define JADE_KEM_MLKEM_MLKEM1024_AMD64_AVX2_ALGNAME         "MLKEM1024"
#define JADE_KEM_MLKEM_MLKEM1024_AMD64_AVX2_ARCH            "amd64"
#define JADE_KEM_MLKEM_MLKEM1024_AMD64_AVX2_IMPL            "avx2"

int jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand(
  uint8_t *public_key,
  uint8_t *secret_key,
  uint8_t *coins
);

int jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key,
  uint8_t *coins
);

int jade_kem_mlkem_mlkem1024_amd64_avx2_keypair(
  uint8_t *public_key,
  uint8_t *secret_key
);

int jade_kem_mlkem_mlkem1024_amd64_avx2_enc(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key
);

int jade_kem_mlkem_mlkem1024_amd64_avx2_dec(
  uint8_t *shared_secret,
  const uint8_t *ciphertext,
  const uint8_t *secret_key
);

#endif
