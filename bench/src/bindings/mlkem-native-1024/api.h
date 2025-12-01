#ifndef PQCP_MLKEM_NATIVE_MLKEM1024_API_H
#define PQCP_MLKEM_NATIVE_MLKEM1024_API_H

#include <stdint.h>

#define PQCP_MLKEM_NATIVE_MLKEM1024_SECRETKEYBYTES  3168
#define PQCP_MLKEM_NATIVE_MLKEM1024_PUBLICKEYBYTES  1568
#define PQCP_MLKEM_NATIVE_MLKEM1024_CIPHERTEXTBYTES 1568
#define PQCP_MLKEM_NATIVE_MLKEM1024_BYTES           32

#define PQCP_MLKEM_NATIVE_MLKEM1024_ALGNAME         "MLKEM1024"
#define PQCP_MLKEM_NATIVE_MLKEM1024_ARCH            "amd64"
#define PQCP_MLKEM_NATIVE_MLKEM1024_IMPL            "avx2"


int PQCP_MLKEM_NATIVE_MLKEM1024_keypair_derand(
  uint8_t *public_key,
  uint8_t *secret_key,
  uint8_t *coins
);

int PQCP_MLKEM_NATIVE_MLKEM1024_enc_derand(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key,
  uint8_t *coins
);

int PQCP_MLKEM_NATIVE_MLKEM1024_keypair(
  uint8_t *public_key,
  uint8_t *secret_key
);

int PQCP_MLKEM_NATIVE_MLKEM1024_enc(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key
);

int PQCP_MLKEM_NATIVE_MLKEM1024_dec(
  uint8_t *shared_secret,
  const uint8_t *ciphertext,
  const uint8_t *secret_key
);

#endif
