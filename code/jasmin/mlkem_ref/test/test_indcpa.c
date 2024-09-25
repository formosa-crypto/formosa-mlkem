#include <stdio.h>
#include <assert.h>
#include "../params.h"
#include "../ntt.h"
#include "../indcpa.h"

#ifndef TEST_ITERATIONS
#define TEST_ITERATIONS 10000
#endif

int main(void)
{
  int test_ok = 1, test_ok_indcpa_keypair_sk = 1, test_ok_indcpa_keypair_pk = 1,
      test_ok_indcpa_enc = 1, test_ok_indcpa_dec = 1, test_ok_decryption = 1;
  size_t test_iteration = 0;
  size_t ri;

  unsigned char sk0[MLKEM_INDCPA_SECRETKEYBYTES];
  unsigned char sk1[MLKEM_INDCPA_SECRETKEYBYTES];
  unsigned char pk0[MLKEM_INDCPA_PUBLICKEYBYTES];
  unsigned char pk1[MLKEM_INDCPA_PUBLICKEYBYTES];
  unsigned char ct0[MLKEM_INDCPA_BYTES];
  unsigned char ct1[MLKEM_INDCPA_BYTES];

  unsigned char randomness0[MLKEM_SYMBYTES];
  unsigned char randomness1[MLKEM_SYMBYTES];
  unsigned char message[MLKEM_INDCPA_MSGBYTES];
  
  /*
  unsigned char outmsg0[MLKEM_INDCPA_MSGBYTES];
  unsigned char outmsg1[MLKEM_INDCPA_MSGBYTES];
  */
  unsigned char outmsg0[MLKEM_POLYVECBYTES];
  unsigned char outmsg1[MLKEM_POLYVECBYTES];

  FILE *urandom = fopen("/dev/urandom", "r");

  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    ri = fread(randomness0, MLKEM_SYMBYTES, 1, urandom);
    assert(ri == 1);

    ri = fread(randomness1, MLKEM_SYMBYTES, 1, urandom);
    assert(ri == 1);

    ri = fread(message, MLKEM_SYMBYTES, 1, urandom);
    assert(ri == 1);

    /* TEST KEYPAIR */
    indcpa_keypair_jazz(pk1, sk1, randomness0);
    indcpa_keypair(pk0, sk0, randomness0);

    for(int i=0;i<MLKEM_INDCPA_SECRETKEYBYTES;i++)
    { if(sk0[i] != sk1[i])
      { fprintf(stderr, "ERROR: indcpa_keypair sk: %d\n", i);
        test_ok_indcpa_keypair_sk = 0;
        test_ok = 0;
      }
    }

    for(int i=0;i<MLKEM_INDCPA_PUBLICKEYBYTES;i++)
    { if(pk0[i] != pk1[i])
      { fprintf(stderr, "ERROR: indcpa_keypair pk: %d\n", i);
        test_ok_indcpa_keypair_pk = 0;
        test_ok = 0;
      }
    }

    /* TEST ENCRYPTION */
    indcpa_enc(ct0, message, pk0, randomness1);
    indcpa_enc_jazz(ct1, message, pk1, randomness1);

    for(int i=0;i<MLKEM_INDCPA_BYTES;i++)
    { if(ct0[i] != ct1[i])
      { fprintf(stderr, "ERROR: indcpa_enc: %d\n", i);
        test_ok_indcpa_enc = 0;
        test_ok = 0;
      }
    }

    /* TEST DECRYPTION */
    indcpa_dec(outmsg0, ct0, sk0);
    indcpa_dec_jazz(outmsg1, ct0, sk0);

    for(int i=0;i<MLKEM_INDCPA_MSGBYTES;i++)
    {
      if(outmsg0[i] != outmsg1[i])
      { fprintf(stderr, "ERROR: indcpa_dec: %d %d %d\n", i, outmsg0[i], outmsg1[i]);
        test_ok_indcpa_dec = 0;
        test_ok = 0;
      }

      if(outmsg0[i] != message[i])
      { fprintf(stderr, "ERROR: decryption: %d\n", i);
        test_ok_decryption = 0;
        test_ok = 0;
      }
    }

    test_iteration += 1;
  }
  fclose(urandom);


  if(test_ok_indcpa_keypair_sk == 1)
  { printf("OK: indcpa_keypair sk\n"); }

  if(test_ok_indcpa_keypair_pk == 1)
  { printf("OK: indcpa_keypair pk\n"); }

  if(test_ok_indcpa_enc == 1)
  { printf("OK: indcpa_enc\n"); }

  if(test_ok_indcpa_dec == 1)
  { printf("OK: indcpa_dec\n"); }

  if(test_ok_decryption == 1)
  { printf("OK: indcpa_decryption\n"); }

  return 0;
}
