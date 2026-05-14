#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#ifndef TESTS
#define TESTS 100
#endif

// ////////////////////////////////////////////////////////////////////////////
// api
#ifndef JADE_NAMESPACE
#error "memory.c requires the macro JADE_NAMESPACE to be defined. \
        - for instance, -DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem_amd64_avx2"
#endif

#ifndef JADE_NAMESPACE_LC
#error "checksums.c requires the macro JADE_NAMESPACE_LC to be defined. \
        - for instance, -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem_amd64_avx2"
#endif


#define PASTER(x, y) x##_##y
#define EVALUATOR(x, y) PASTER(x, y)
#define EVAL_NAMESPACE(fun) EVALUATOR(JADE_NAMESPACE, fun)
#define EVAL_NAMESPACE_LC(fun) EVALUATOR(JADE_NAMESPACE_LC, fun)

#include "api.h"

#define mlkem_SECRETKEYBYTES   EVAL_NAMESPACE(SECRETKEYBYTES)
#define mlkem_PUBLICKEYBYTES   EVAL_NAMESPACE(PUBLICKEYBYTES)
#define mlkem_KEYPAIRCOINBYTES EVAL_NAMESPACE(KEYPAIRCOINBYTES)
#define mlkem_CIPHERTEXTBYTES  EVAL_NAMESPACE(CIPHERTEXTBYTES)
#define mlkem_BYTES            EVAL_NAMESPACE(BYTES)
#define mlkem_ENCCOINBYTES     EVAL_NAMESPACE(ENCCOINBYTES)
#define mlkem_ALGNAME          EVAL_NAMESPACE(ALGNAME)
#define mlkem_ARCH             EVAL_NAMESPACE(ARCH)
#define mlkem_IMPL             EVAL_NAMESPACE(IMPL)

#define mlkem_keypair          EVAL_NAMESPACE_LC(keypair)
#define mlkem_keypair_derand   EVAL_NAMESPACE_LC(keypair_derand)
#define mlkem_enc              EVAL_NAMESPACE_LC(enc)
#define mlkem_enc_derand       EVAL_NAMESPACE_LC(enc_derand)
#define mlkem_dec              EVAL_NAMESPACE_LC(dec)

extern int randombytes(uint8_t*, uint64_t);

int main(void)
{
  int r;
  uint8_t *public_key;
  uint8_t *secret_key;
  uint8_t *shared_secret_a;
  uint8_t *ciphertext;
  uint8_t *shared_secret_b;
  uint8_t *keypair_random_coins;
  uint8_t *enc_random_coins;
  size_t t;
  
  public_key = malloc(mlkem_PUBLICKEYBYTES-1);
  secret_key = malloc(mlkem_SECRETKEYBYTES);
  shared_secret_a = malloc(mlkem_BYTES);
  ciphertext = malloc(mlkem_CIPHERTEXTBYTES);
  shared_secret_b = malloc(mlkem_BYTES);
  keypair_random_coins = malloc(mlkem_KEYPAIRCOINBYTES);
  enc_random_coins = malloc(mlkem_ENCCOINBYTES);

	for(t = 0; t < TESTS; t++)
	{
		// create key pair
		r = mlkem_keypair(public_key, secret_key);
		  assert(r == 0);

		// encapsulate
		r = mlkem_enc(ciphertext, shared_secret_a, public_key);
		  assert(r == 0);

		// decapsulate
		r = mlkem_dec(shared_secret_b, ciphertext, secret_key);
		  assert(r == 0);
		  assert(memcmp(shared_secret_a, shared_secret_b, mlkem_BYTES) == 0);

		// 
		// create key pair using derand function (random coins are given as input)
		randombytes(keypair_random_coins, mlkem_KEYPAIRCOINBYTES);
		r = mlkem_keypair_derand(public_key, secret_key, keypair_random_coins);
		  assert(r == 0);

		// encapsulate using derand function (random coins are given as input)
		randombytes(enc_random_coins, mlkem_ENCCOINBYTES);
		r = mlkem_enc_derand(ciphertext, shared_secret_a, public_key, enc_random_coins);
		  assert(r == 0);

		// decapsulate
		r = mlkem_dec(shared_secret_b, ciphertext, secret_key);
		  assert(r == 0);
		  assert(memcmp(shared_secret_a, shared_secret_b, mlkem_BYTES) == 0);
	}

  free(public_key);
  free(secret_key);
  free(shared_secret_a);
  free(ciphertext);
  free(shared_secret_b);
  free(keypair_random_coins);
  free(enc_random_coins);

  return 0;
}

