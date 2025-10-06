#ifndef JADE_KEM_MLKEM_MLKEM1024_AMD64_REF_API_H
#define JADE_KEM_MLKEM_MLKEM1024_AMD64_REF_API_H

#include <stdint.h>

#define JADE_KEM_MLKEM_MLKEM1024_AMD64_REF_SECRETKEYBYTES  3168
#define JADE_KEM_MLKEM_MLKEM1024_AMD64_REF_PUBLICKEYBYTES  1568
#define JADE_KEM_MLKEM_MLKEM1024_AMD64_REF_CIPHERTEXTBYTES 1568
#define JADE_KEM_MLKEM_MLKEM1024_AMD64_REF_BYTES           32

#define JADE_KEM_MLKEM_MLKEM1024_AMD64_REF_ALGNAME         "MLKEM1024"
#define JADE_KEM_MLKEM_MLKEM1024_AMD64_REF_ARCH            "amd64"
#define JADE_KEM_MLKEM_MLKEM1024_AMD64_REF_IMPL            "ref"

int jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand(
  uint8_t *public_key,
  uint8_t *secret_key,
  uint8_t *coins
);

int jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key,
  uint8_t *coins
);

int jade_kem_mlkem_mlkem1024_amd64_ref_dec(
  uint8_t *shared_secret,
  const uint8_t *ciphertext,
  const uint8_t *secret_key
);

#endif
