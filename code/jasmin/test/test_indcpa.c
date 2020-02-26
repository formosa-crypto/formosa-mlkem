#include <stdio.h>

#include "../params.h"
#include "../ntt.h"
#include "../indcpa.h"

int main(void)
{
  unsigned char sk0[KYBER_INDCPA_SECRETKEYBYTES];
  unsigned char sk1[KYBER_INDCPA_SECRETKEYBYTES];
  unsigned char pk0[KYBER_INDCPA_PUBLICKEYBYTES];
  unsigned char pk1[KYBER_INDCPA_PUBLICKEYBYTES];
  unsigned char ct0[KYBER_INDCPA_BYTES];
  unsigned char ct1[KYBER_INDCPA_BYTES];

  unsigned char randomness0[KYBER_SYMBYTES];
  unsigned char randomness1[KYBER_SYMBYTES];
  unsigned char message[KYBER_SYMBYTES];

  FILE *urandom = fopen("/dev/urandom", "r");
  fread(randomness0, KYBER_SYMBYTES, 1, urandom);
  fread(randomness1, KYBER_SYMBYTES, 1, urandom);
  fread(message, KYBER_SYMBYTES, 1, urandom);
  fclose(urandom);

  /* TEST KEYPAIR */
  indcpa_keypair_jazz(pk1, sk1, randomness0, zetas);
  indcpa_keypair(pk0, sk0, randomness0);

  for(int i=0;i<KYBER_INDCPA_SECRETKEYBYTES;i++)
    if(sk0[i] != sk1[i]) printf("error indcpa_keypair sk: %d\n", i);

  for(int i=0;i<KYBER_INDCPA_PUBLICKEYBYTES;i++)
    if(pk0[i] != pk1[i]) printf("error indcpa_keypair pk: %d\n", i);


  /* TEST ENCRYPTION */
  indcpa_enc(ct0, message, pk0, randomness1);
  indcpa_enc_jazz(ct1, message, pk1, randomness1, zetas, zetas_inv);

  for(int i=0;i<KYBER_INDCPA_BYTES;i++)
    if(sk0[i] != sk1[i]) printf("error indcpa_enc: %d\n", i);

  return 0;
}
