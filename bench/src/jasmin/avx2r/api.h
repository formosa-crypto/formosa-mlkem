#ifndef JADE_KEM_KYBER_KYBER768_AMD64_AVX2R_API_H
#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2R_API_H

#include <stdint.h>

#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2R_SECRETKEYBYTES  2400
#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2R_PUBLICKEYBYTES  1184
#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2R_CIPHERTEXTBYTES 1088
#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2R_BYTES           32

#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2R_ALGNAME         "Kyber768"
#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2R_ARCH            "amd64"
#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2R_IMPL            "avx2r"

int jade_kem_kyber_kyber768_amd64_avx2r_keypair(
  uint8_t *public_key,
  uint8_t *secret_key
);

int jade_kem_kyber_kyber768_amd64_avx2r_enc(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key
);

int jade_kem_kyber_kyber768_amd64_avx2r_dec(
  uint8_t *shared_secret,
  const uint8_t *ciphertext,
  const uint8_t *secret_key
);

#endif
