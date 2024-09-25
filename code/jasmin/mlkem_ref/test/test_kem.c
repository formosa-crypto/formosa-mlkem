#include <stdio.h>
#include <assert.h>
#include <string.h>

#include "../params.h"
#include "../ntt.h"
#include "../kem.h"

#ifndef TEST_ITERATIONS
#define TEST_ITERATIONS 10000
#endif

int main(void)
{
  int test_ok = 1, test_ok_kem_keypair_sk = 1, test_ok_kem_keypair_pk = 1,
      test_ok_kem_enc_ct = 1, test_ok_kem_enc_ss = 1,
      test_ok_kem_dec_success = 1, test_ok_kem_dec_failure = 1;
  size_t test_iteration = 0;
  size_t ri;

  unsigned char sk0[MLKEM_SECRETKEYBYTES];
  unsigned char sk1[MLKEM_SECRETKEYBYTES];
  unsigned char pk0[MLKEM_PUBLICKEYBYTES];
  unsigned char pk1[MLKEM_PUBLICKEYBYTES];
  unsigned char ct0[MLKEM_CIPHERTEXTBYTES];
  unsigned char ct1[MLKEM_CIPHERTEXTBYTES];
  unsigned char shk0[MLKEM_SSBYTES];
  unsigned char shk1[MLKEM_SSBYTES];

  unsigned char randomness0[2*MLKEM_SYMBYTES];
  unsigned char randomness1[2*MLKEM_SYMBYTES];
  
  FILE *urandom = fopen("/dev/urandom", "r");

  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    ri = fread(randomness0, 2*MLKEM_SYMBYTES, 1, urandom);
    assert(ri == 1);
    ri = fread(randomness1, 2*MLKEM_SYMBYTES, 1, urandom);
    assert(ri == 1);

    /* TEST KEYPAIR */
    jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand(pk1, sk1, randomness0);
    crypto_kem_keypair(pk0, sk0, randomness0);

    for(int i=0;i<MLKEM_SECRETKEYBYTES;i++)
    { if(sk0[i] != sk1[i])
      { fprintf(stderr, "ERROR: crypto_kem_keypair sk: %d\n", i);
        test_ok_kem_keypair_sk = 0;
        test_ok = 0;
      }
    }

    for(int i=0;i<MLKEM_PUBLICKEYBYTES;i++)
    { if(pk0[i] != pk1[i])
      { fprintf(stderr, "ERROR: crypto_kem_keypair pk: %d\n", i);
        test_ok_kem_keypair_pk = 0;
        test_ok = 0;
      }
    }

    /* TEST ENCAPSULATION */
    crypto_kem_enc(ct0, shk0, pk0, randomness1);
    jade_kem_mlkem_mlkem768_amd64_ref_enc_derand(ct1, shk1, pk1, randomness1);

    for(int i=0;i<MLKEM_CIPHERTEXTBYTES;i++)
    { if(ct0[i] != ct1[i])
      { fprintf(stderr, "ERROR: crypto_kem_enc ct: %d\n", i);
        test_ok_kem_enc_ct = 0;
        test_ok = 0;
      }
    }

    for(int i=0;i<MLKEM_SSBYTES;i++)
    { if(shk0[i] != shk1[i])
      { fprintf(stderr, "ERROR: crypto_kem_enc ss: %d\n", i);
        test_ok_kem_enc_ss = 0;
        test_ok = 0;
      }
    }

    /* TEST DECAPSULATION */
    memset(shk0, 0, MLKEM_SSBYTES);
    memset(shk1, 0, MLKEM_SSBYTES);

    crypto_kem_dec(shk0, ct0, sk0);
    jade_kem_mlkem_mlkem768_amd64_ref_dec(shk1, ct1, sk1);

    for(int i=0;i<MLKEM_SSBYTES;i++)
    { if(shk0[i] != shk1[i])
      { fprintf(stderr, "ERROR: crypto_kem_dec (suc): %d %d %d\n", i, shk0[i], shk1[i]);
        test_ok_kem_dec_success = 0;
        test_ok = 0;
      }
    }

    /* TEST DECAPSULATION FAILURE */
    memset(shk0, 0, MLKEM_SSBYTES);
    memset(shk1, 0, MLKEM_SSBYTES);

    ct0[0] = !ct0[0]; // corrupt a single byte
    ct1[0] = ct0[0];

    crypto_kem_dec(shk0, ct0, sk0);
    jade_kem_mlkem_mlkem768_amd64_ref_dec(shk1, ct1, sk1);

    for(int i=0;i<MLKEM_SSBYTES;i++)
    { if(shk0[i] != shk1[i])
      { fprintf(stderr, "ERROR: crypto_kem_dec (fail -- corrupt byte): %d %d %d\n", i, shk0[i], shk1[i]);
        test_ok_kem_dec_failure = 0;
        test_ok = 0;  
      }
    }

    test_iteration += 1;
  }
  fclose(urandom);

  if(test_ok_kem_keypair_sk == 1)
  { printf("OK: kem_keypair sk\n"); }

  if(test_ok_kem_keypair_pk == 1)
  { printf("OK: kem_keypair pk\n"); }

  if(test_ok_kem_enc_ct == 1)
  { printf("OK: indcpa_enc_ct\n"); }

  if(test_ok_kem_enc_ss == 1)
  { printf("OK: indcpa_enc_ss\n"); }

  if(test_ok_kem_dec_success == 1)
  { printf("OK: kem_dec_success\n"); }

  if(test_ok_kem_dec_failure == 1)
  { printf("OK: kem_dec_failure (it is the corrupting byte test)\n"); }

  return 0;
}
