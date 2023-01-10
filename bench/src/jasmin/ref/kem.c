#include "api.h"
//#include "randombytes1.h"

extern void crypto_kem_keypair_jazz(
  uint8_t *public_key,
  uint8_t *secret_key,
  const uint8_t *randomness
);

extern void crypto_kem_enc_jazz(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key,
  const uint8_t *randomness
);

extern void crypto_kem_dec_jazz(
  uint8_t *shared_secret,
  const uint8_t *ciphertext,
  const uint8_t *secret_key
);

//

#define KYBER_SYMBYTES 32

int jade_kem_kyber_kyber768_amd64_ref_keypair(
  uint8_t *public_key,
  uint8_t *secret_key
)
{
  uint8_t randomness[KYBER_SYMBYTES*2];
  //randombytes(randomness, KYBER_SYMBYTES*2);
  crypto_kem_keypair_jazz(public_key, secret_key, randomness);
  return 0;
}

int jade_kem_kyber_kyber768_amd64_ref_enc(
  uint8_t *ciphertext,
  uint8_t *shared_secret,
  const uint8_t *public_key
)
{
  uint8_t randomness[KYBER_SYMBYTES];
  //randombytes(randomness, KYBER_SYMBYTES);
  crypto_kem_enc_jazz(ciphertext, shared_secret, public_key, randomness);
  return 0;
}

int jade_kem_kyber_kyber768_amd64_ref_dec(
  uint8_t *shared_secret,
  const uint8_t *ciphertext,
  const uint8_t *secret_key
)
{
  crypto_kem_dec_jazz(shared_secret, ciphertext, secret_key);
  return 0;
}

