#ifndef LIBCRUX_MLKEM1024_API_H
#define LIBCRUX_MLKEM1024_API_H

#include <stdint.h>

#define LIBCRUX_MLKEM1024_SECRETKEYBYTES   3168
#define LIBCRUX_MLKEM1024_PUBLICKEYBYTES   1568
#define LIBCRUX_MLKEM1024_CIPHERTEXTBYTES  1568
#define LIBCRUX_MLKEM1024_KEYPAIRCOINBYTES 64
#define LIBCRUX_MLKEM1024_ENCCOINBYTES     32
#define LIBCRUX_MLKEM1024_BYTES            32

#define LIBCRUX_MLKEM1024_ALGNAME          "MLKEM1024"
#define LIBCRUX_MLKEM1024_ARCH             "amd64"
#define LIBCRUX_MLKEM1024_IMPL             "avx2"

int LIBCRUX_MLKEM1024_keypair_derand(
  uint8_t *public_key,
  uint8_t *secret_key,
  uint8_t *coins
);

int LIBCRUX_MLKEM1024_enc_derand(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key,
  uint8_t *coins
);

int LIBCRUX_MLKEM1024_keypair(
  uint8_t *public_key,
  uint8_t *secret_key
);

int LIBCRUX_MLKEM1024_enc(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key
);

int LIBCRUX_MLKEM1024_dec(
  uint8_t *shared_secret,
  const uint8_t *ciphertext,
  const uint8_t *secret_key
);

#endif
