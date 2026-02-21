/* ------------------------------------------------------------------------ */
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>

/* ------------------------------------------------------------------------ */
#include "kyber/ref/params.h"
#include "kyber/ref/kem.h"
#include "runtime.h"

/* ------------------------------------------------------------------------ */
#include "api.h"

#define CAT_(a,b) a##b
#define CAT(a,b)  CAT_(a,b)

#define MLKEM_SYM_(prefix, suffix) CAT(prefix, suffix)
#define MLKEM_SYM(suffix)          MLKEM_SYM_(MLKEM_NAMESPACE, suffix)

#define jade_kem_mlkem_keypair_derand MLKEM_SYM(_keypair_derand)
#define jade_kem_mlkem_enc_derand     MLKEM_SYM(_enc_derand)
#define jade_kem_mlkem_dec            MLKEM_SYM(_dec)

/* ------------------------------------------------------------------------ */
static void check_equal_or_abort(
    const uint8_t* a,
    const uint8_t* b,
    size_t len,
    const char* label)
{
  for (size_t i = 0; i < len; i++) {
    if (a[i] != b[i]) {
      print_and_abort("%s mismatch at byte %zu\n", label, i);
    }
  }
}

/* ------------------------------------------------------------------------ */
static void do_roundtrip(void) {
  uint8_t sk0[KYBER_SECRETKEYBYTES];
  uint8_t sk1[KYBER_SECRETKEYBYTES];
  uint8_t pk0[KYBER_PUBLICKEYBYTES];
  uint8_t pk1[KYBER_PUBLICKEYBYTES];
  uint8_t ct0[KYBER_CIPHERTEXTBYTES];
  uint8_t ct1[KYBER_CIPHERTEXTBYTES];
  uint8_t ss0[KYBER_SSBYTES];
  uint8_t ss1[KYBER_SSBYTES];

  uint8_t randomness0[2*KYBER_SYMBYTES];
  uint8_t randomness1[KYBER_SYMBYTES];

  get_randomness(randomness0, sizeof(randomness0));
  get_randomness(randomness1, sizeof(randomness1));

  /* TEST KEYPAIR */
  jade_kem_mlkem_keypair_derand(pk1, sk1, randomness0);
  crypto_kem_keypair_derand(pk0, sk0, randomness0);

  check_equal_or_abort(sk0, sk1, KYBER_SECRETKEYBYTES, "crypto_kem_keypair sk");
  check_equal_or_abort(pk0, pk1, KYBER_PUBLICKEYBYTES, "crypto_kem_keypair pk");

  /* TEST ENCAPSULATION */
  crypto_kem_enc_derand(ct0, ss0, pk0, randomness1);
  jade_kem_mlkem_enc_derand(ct1, ss1, pk1, randomness1);

  check_equal_or_abort(ct0, ct1, KYBER_CIPHERTEXTBYTES, "crypto_kem_enc ct");
  check_equal_or_abort(ss0, ss1, KYBER_SSBYTES, "crypto_kem_enc ss");
  
  /* TEST DECAPSULATION */
  memset(ss0, 0, KYBER_SSBYTES);
  memset(ss1, 0, KYBER_SSBYTES);

  crypto_kem_dec(ss0, ct0, sk0);
  jade_kem_mlkem_dec(ss1, ct1, sk1);

  check_equal_or_abort(ss0, ss1, KYBER_SSBYTES, "error crypto_kem_dec (success)");

  /* TEST DECAPSULATION FAILURE */
  memset(ss0, 0, KYBER_SSBYTES);
  memset(ss1, 0, KYBER_SSBYTES);

  ct0[0] = !ct0[0]; // corrupt a single byte
  ct1[0] = ct0[0];

  crypto_kem_dec(ss0, ct0, sk0);
  jade_kem_mlkem_dec(ss1, ct1, sk1);

  check_equal_or_abort(ss0, ss1, KYBER_SSBYTES, "error crypto_kem_dec (failure)");
}

/* ------------------------------------------------------------------------ */
static void log_progress(size_t done, size_t total) {
  double percent =
    (total == 0) ? 100.0 : (100.0 * (double)done / (double)total);

  printf("Progress: %zu/%zu (%.1f%%)\n", done, total, percent);
  fflush(stdout);
}

/* ------------------------------------------------------------------------ */
#define NRUNS 10000

int main(void) {
  for (size_t i = 0; i < NRUNS; ++i) {
    do_roundtrip();
    if ((i + 1) % 1000 == 0 || i + 1 == NRUNS) {
      log_progress(i + 1, NRUNS);
    }
  }
}
