#ifndef JADE_KEM_KYBER_KYBER768_AMD64_AVX2V_API_H
#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2V_API_H

#include <stdint.h>

#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2V_SECRETKEYBYTES  2400
#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2V_PUBLICKEYBYTES  1184
#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2V_CIPHERTEXTBYTES 1088
#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2V_BYTES           32

#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2V_ALGNAME         "Kyber768"
#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2V_ARCH            "amd64"
#define JADE_KEM_KYBER_KYBER768_AMD64_AVX2V_IMPL            "avx2v"

int jade_kem_kyber_kyber768_amd64_avx2v_keypair(
  uint8_t *public_key,
  uint8_t *secret_key
);

int jade_kem_kyber_kyber768_amd64_avx2v_enc(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key
);

int jade_kem_kyber_kyber768_amd64_avx2v_dec(
  uint8_t *shared_secret,
  const uint8_t *ciphertext,
  const uint8_t *secret_key
);

#endif
