#ifndef JADE_KEM_mlkem_mlkem1024_amd64_avx2_API_H
#define JADE_KEM_mlkem_mlkem1024_amd64_avx2_API_H

#include <stdint.h>

#define JADE_KEM_mlkem_mlkem1024_amd64_avx2_SECRETKEYBYTES 3168
#define JADE_KEM_mlkem_mlkem1024_amd64_avx2_PUBLICKEYBYTES 1568
#define JADE_KEM_mlkem_mlkem1024_amd64_avx2_CIPHERTEXTBYTES 1568
#define JADE_KEM_mlkem_mlkem1024_amd64_avx2_KEYPAIRCOINBYTES 64
#define JADE_KEM_mlkem_mlkem1024_amd64_avx2_ENCCOINBYTES 32
#define JADE_KEM_mlkem_mlkem1024_amd64_avx2_BYTES 32

int jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand(
  uint8_t *public_key,
  uint8_t *secret_key,
  const uint8_t *coins
);

int jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key,
  const uint8_t *coins
);

int jade_kem_mlkem_mlkem1024_amd64_avx2_dec(
  uint8_t *shared_secret,
  const uint8_t *ciphertext,
  const uint8_t *secret_key
);

#endif