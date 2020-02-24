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

  unsigned char randomness[KYBER_SYMBYTES];

  FILE *urandom = fopen("/dev/urandom", "r");
  fread(randomness, KYBER_SYMBYTES, 1, urandom);
  fclose(urandom);

  indcpa_keypair(pk0, sk0, randomness);
  indcpa_keypair_jazz(pk1, sk1, randomness, zetas, zetas_inv);

  //for(int i=0;i<KYBER_INDCPA_SECRETKEYBYTES;i++)
  for(int i=0;i<32;i++)
    if(sk0[i] != sk1[i]) printf("error indcpa_keypair sk: %d\n", i);

  //for(int i=0;i<KYBER_INDCPA_PUBLICKEYBYTES;i++)
  for(int i=0;i<32;i++)
    if(pk0[i] != pk1[i]) printf("error indcpa_keypair pk: %d\n", i);

  return 0;
}
