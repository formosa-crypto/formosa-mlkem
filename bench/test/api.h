#ifndef JADE_KEM_API_H
#define JADE_KEM_API_H

#include <stdint.h>

#define JADE_KEM_SECRETKEYBYTES  2400
#define JADE_KEM_PUBLICKEYBYTES  1184
#define JADE_KEM_CIPHERTEXTBYTES 1088
#define JADE_KEM_BYTES           32

#define JADE_KEM_ALGNAME         "Kyber768"
#define JADE_KEM_ARCH            "amd64"
#define JADE_KEM_IMPL            "avx2"

int jade_kem_keypair(
  uint8_t *public_key,
  uint8_t *secret_key
);

int jade_kem_enc(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key
);

int jade_kem_dec(
  uint8_t *shared_secret,
  const uint8_t *ciphertext,
  const uint8_t *secret_key
);

#endif
