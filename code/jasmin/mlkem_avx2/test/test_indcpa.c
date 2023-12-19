#include <stdio.h>

#include "../params.h"
#include "../ntt.h"
#include "../indcpa.h"

int main(void)
{
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
  fread(randomness0, MLKEM_SYMBYTES, 1, urandom);
  fread(randomness1, MLKEM_SYMBYTES, 1, urandom);
  fread(message, MLKEM_SYMBYTES, 1, urandom);
  fclose(urandom);

  /* TEST KEYPAIR */
  indcpa_keypair_jazz(pk1, sk1, randomness0);
  indcpa_keypair(pk0, sk0, randomness0);

  for(int i=0;i<MLKEM_INDCPA_SECRETKEYBYTES;i++)
    if(sk0[i] != sk1[i]) printf("error indcpa_keypair sk: %d\n", i);

  for(int i=0;i<MLKEM_INDCPA_PUBLICKEYBYTES;i++)
    if(pk0[i] != pk1[i]) printf("error indcpa_keypair pk: %d\n", i);


  /* TEST ENCRYPTION */
  indcpa_enc(ct0, message, pk0, randomness1);
  indcpa_enc_jazz(ct1, message, pk1, randomness1);

  for(int i=0;i<MLKEM_INDCPA_BYTES;i++)
    if(ct0[i] != ct1[i]) printf("error indcpa_enc: %d\n", i);

  /* TEST DECRYPTION */
  indcpa_dec(outmsg0, ct0, sk0);
  indcpa_dec_jazz(outmsg1, ct0, sk0);

  for(int i=0;i<MLKEM_INDCPA_MSGBYTES;i++)
  {
    if(outmsg0[i] != outmsg1[i]) printf("error indcpa_dec: %d %d %d\n", i, outmsg0[i], outmsg1[i]);
    if(outmsg0[i] != message[i]) printf("decryption error: %d\n", i);
  }

  return 0;
}
