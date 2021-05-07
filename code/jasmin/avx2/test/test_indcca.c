#include <stdio.h>

#include "../params.h"
#include "../ntt.h"
#include "../indcca.h"

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
  unsigned char message[KYBER_INDCPA_MSGBYTES];
  
  /*
  unsigned char outmsg0[KYBER_INDCPA_MSGBYTES];
  unsigned char outmsg1[KYBER_INDCPA_MSGBYTES];
  */
  unsigned char outmsg0[KYBER_POLYVECBYTES];
  unsigned char outmsg1[KYBER_POLYVECBYTES];

  FILE *urandom = fopen("/dev/urandom", "r");
  fread(randomness0, KYBER_SYMBYTES, 1, urandom);
  fread(randomness1, KYBER_SYMBYTES, 1, urandom);
  fread(message, KYBER_SYMBYTES, 1, urandom);
  fclose(urandom);

  /* TEST KEYPAIR */
  indcca_keypair_jazz(pk1, sk1, randomness0);
  indcca_keypair(pk0, sk0, randomness0);

  for(int i=0;i<KYBER_INDCPA_SECRETKEYBYTES;i++)
    if(sk0[i] != sk1[i]) printf("error indcca_keypair sk: %d\n", i);

  for(int i=0;i<KYBER_INDCPA_PUBLICKEYBYTES;i++)
    if(pk0[i] != pk1[i]) printf("error indcca_keypair pk: %d\n", i);


  /* TEST ENCRYPTION */
  indcca_enc(ct0, message, pk0, randomness1);
  indcca_enc_jazz(ct1, message, pk1, randomness1);

  for(int i=0;i<KYBER_INDCPA_BYTES;i++)
    if(ct0[i] != ct1[i]) printf("error indcca_enc: %d\n", i);

  /* TEST DECRYPTION */
  indcca_dec(outmsg0, ct0, sk0);
  indcca_dec_jazz(outmsg1, ct0, sk0);

  for(int i=0;i<KYBER_INDCPA_MSGBYTES;i++)
  {
    if(outmsg0[i] != outmsg1[i]) printf("error indcca_dec: %d %d %d\n", i, outmsg0[i], outmsg1[i]);
    if(outmsg0[i] != message[i]) printf("decryption error: %d\n", i);
  }

  return 0;
}
