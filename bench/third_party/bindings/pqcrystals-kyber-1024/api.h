#ifndef pqcrystals_kyber1024_avx2_API_H
#define pqcrystals_kyber1024_avx2_API_H

#include <stdint.h>

#define pqcrystals_kyber1024_avx2_SECRETKEYBYTES   3168
#define pqcrystals_kyber1024_avx2_PUBLICKEYBYTES   1568
#define pqcrystals_kyber1024_avx2_CIPHERTEXTBYTES  1568
#define pqcrystals_kyber1024_avx2_KEYPAIRCOINBYTES 64
#define pqcrystals_kyber1024_avx2_ENCCOINBYTES     32
#define pqcrystals_kyber1024_avx2_BYTES            32

#define pqcrystals_kyber1024_avx2_ALGNAME          "Kyber1024"
#define pqcrystals_kyber1024_avx2_ARCH             "amd64"
#define pqcrystals_kyber1024_avx2_IMPL             "avx2"

int pqcrystals_kyber1024_avx2_keypair_derand(
  uint8_t *pk,
  uint8_t *sk,
  const uint8_t *coins
);

int pqcrystals_kyber1024_avx2_keypair(
  uint8_t *pk,
  uint8_t *sk
);

int pqcrystals_kyber1024_avx2_enc_derand(
  uint8_t *ct,
  uint8_t *ss,
  const uint8_t *pk,
  const uint8_t *coins
);

int pqcrystals_kyber1024_avx2_enc(
  uint8_t *ct,
  uint8_t *ss,
  const uint8_t *pk
);

int pqcrystals_kyber1024_avx2_dec(
  uint8_t *ss,
  const uint8_t *ct,
  const uint8_t *sk
);

#endif
