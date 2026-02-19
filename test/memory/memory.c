#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "api.h"
#include "../common/config.h"
#include "../common/jade_kem.h"

int main(void)
{
  uint8_t *public_key;
  uint8_t *secret_key;
  uint8_t *ciphertext;
  uint8_t *shared_secret;

  public_key    = malloc(sizeof(uint8_t) * JADE_KEM_PUBLICKEYBYTES);
  secret_key    = malloc(sizeof(uint8_t) * JADE_KEM_SECRETKEYBYTES);
  ciphertext    = malloc(sizeof(uint8_t) * JADE_KEM_CIPHERTEXTBYTES);
  shared_secret = malloc(sizeof(uint8_t) * JADE_KEM_BYTES);

  jade_kem_keypair(public_key, secret_key);
  jade_kem_enc(ciphertext, shared_secret, public_key);
  jade_kem_dec(shared_secret, ciphertext, secret_key);

  free(public_key);
  free(secret_key);
  free(ciphertext);
  free(shared_secret);

  return 0;
}