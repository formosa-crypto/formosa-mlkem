#include "api.h"
#include "namespace.h"
#include "randombytes1.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CRYPTO_SECRETKEYBYTES     NAMESPACE(SECRETKEYBYTES)
#define CRYPTO_PUBLICKEYBYTES     NAMESPACE(PUBLICKEYBYTES)
#define CRYPTO_KEYPAIRCOINBYTES   NAMESPACE(KEYPAIRCOINBYTES)

#define CRYPTO_CIPHERTEXTBYTES    NAMESPACE(CIPHERTEXTBYTES)
#define CRYPTO_BYTES              NAMESPACE(BYTES)
#define CRYPTO_ENCCOINBYTES       NAMESPACE(ENCCOINBYTES)

#define crypto_kem_keypair        NAMESPACE_LC(keypair)
#define crypto_kem_keypair_derand NAMESPACE_LC(keypair_derand)
#define crypto_kem_enc            NAMESPACE_LC(enc)
#define crypto_kem_enc_derand     NAMESPACE_LC(enc_derand)
#define crypto_kem_dec            NAMESPACE_LC(dec)

#define SELFTEST_ITERS 64

static void fail(const char *impl, const char *msg)
{
  fprintf(stderr, "[FAIL] %s: %s\n", impl, msg);
  exit(1);
}

static void check_rc(const char *impl, const char *op, int rc)
{
  if(rc != 0)
  { fail(impl, op); }
}

int main(int argc, char **argv)
{
  const char *implementation_name = "unknown";

  if (argc > 1)
  { implementation_name = argv[1]; }

  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];
  uint8_t ct[CRYPTO_CIPHERTEXTBYTES];
  uint8_t ss_enc[CRYPTO_BYTES];
  uint8_t ss_dec[CRYPTO_BYTES];

  uint8_t d_pk1[CRYPTO_PUBLICKEYBYTES];
  uint8_t d_sk1[CRYPTO_SECRETKEYBYTES];
  uint8_t d_pk2[CRYPTO_PUBLICKEYBYTES];
  uint8_t d_sk2[CRYPTO_SECRETKEYBYTES];
  uint8_t d_ct1[CRYPTO_CIPHERTEXTBYTES];
  uint8_t d_ct2[CRYPTO_CIPHERTEXTBYTES];
  uint8_t d_ss1[CRYPTO_BYTES];
  uint8_t d_ss2[CRYPTO_BYTES];
  uint8_t d_ss_dec[CRYPTO_BYTES];
  uint8_t kc[CRYPTO_KEYPAIRCOINBYTES];
  uint8_t ec[CRYPTO_ENCCOINBYTES];

  size_t i;

  for(i = 0; i < SELFTEST_ITERS; i++)
  {
    check_rc(implementation_name, "keypair", crypto_kem_keypair(pk, sk));
    check_rc(implementation_name, "enc", crypto_kem_enc(ct, ss_enc, pk));
    check_rc(implementation_name, "dec", crypto_kem_dec(ss_dec, ct, sk));

    if(memcmp(ss_enc, ss_dec, CRYPTO_BYTES) != 0)
    { fail(implementation_name, "enc/dec shared secret mismatch"); }

    randombytes(kc, CRYPTO_KEYPAIRCOINBYTES);
    check_rc(implementation_name, "keypair_derand", crypto_kem_keypair_derand(d_pk1, d_sk1, kc));
    check_rc(implementation_name, "keypair_derand(repeat)", crypto_kem_keypair_derand(d_pk2, d_sk2, kc));

    if(memcmp(d_pk1, d_pk2, CRYPTO_PUBLICKEYBYTES) != 0)
    { fail(implementation_name, "keypair_derand public key mismatch"); }
    if(memcmp(d_sk1, d_sk2, CRYPTO_SECRETKEYBYTES) != 0)
    { fail(implementation_name, "keypair_derand secret key mismatch"); }

    randombytes(ec, CRYPTO_ENCCOINBYTES);
    check_rc(implementation_name, "enc_derand", crypto_kem_enc_derand(d_ct1, d_ss1, d_pk1, ec));
    check_rc(implementation_name, "enc_derand(repeat)", crypto_kem_enc_derand(d_ct2, d_ss2, d_pk1, ec));
    check_rc(implementation_name, "dec(derand)", crypto_kem_dec(d_ss_dec, d_ct1, d_sk1));

    if(memcmp(d_ct1, d_ct2, CRYPTO_CIPHERTEXTBYTES) != 0)
    { fail(implementation_name, "enc_derand ciphertext mismatch"); }
    if(memcmp(d_ss1, d_ss2, CRYPTO_BYTES) != 0)
    { fail(implementation_name, "enc_derand shared secret mismatch"); }
    if(memcmp(d_ss1, d_ss_dec, CRYPTO_BYTES) != 0)
    { fail(implementation_name, "enc_derand/dec shared secret mismatch"); }
  }

  printf("[OK] %s (%d iterations)\n", implementation_name, SELFTEST_ITERS);
  return 0;
}
