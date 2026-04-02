#ifndef LIBCRUX_MLKEM768_API_H
#define LIBCRUX_MLKEM768_API_H

#include <stdint.h>

#define LIBCRUX_MLKEM768_SECRETKEYBYTES   2400
#define LIBCRUX_MLKEM768_PUBLICKEYBYTES   1184
#define LIBCRUX_MLKEM768_CIPHERTEXTBYTES  1088
#define LIBCRUX_MLKEM768_KEYPAIRCOINBYTES 64
#define LIBCRUX_MLKEM768_ENCCOINBYTES     32
#define LIBCRUX_MLKEM768_BYTES            32

#define LIBCRUX_MLKEM768_ALGNAME          "MLKEM768"
#define LIBCRUX_MLKEM768_ARCH             "amd64"
#define LIBCRUX_MLKEM768_IMPL             "avx2"

int LIBCRUX_MLKEM768_keypair_derand(
  uint8_t *public_key,
  uint8_t *secret_key,
  uint8_t *coins
);

int LIBCRUX_MLKEM768_enc_derand(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key,
  uint8_t *coins
);

int LIBCRUX_MLKEM768_keypair(
  uint8_t *public_key,
  uint8_t *secret_key
);

int LIBCRUX_MLKEM768_enc(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key
);

int LIBCRUX_MLKEM768_dec(
  uint8_t *shared_secret,
  const uint8_t *ciphertext,
  const uint8_t *secret_key
);

#endif
