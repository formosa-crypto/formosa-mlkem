#include <stdio.h>
#include <string.h>

#include "../../../../kyber/ref/params.h"
#include "../../../../kyber/ref/kem.h"

int main(void)
{
  unsigned char sk0[KYBER_SECRETKEYBYTES];
  unsigned char sk1[KYBER_SECRETKEYBYTES];
  unsigned char pk0[KYBER_PUBLICKEYBYTES];
  unsigned char pk1[KYBER_PUBLICKEYBYTES];
  unsigned char ct0[KYBER_CIPHERTEXTBYTES];
  unsigned char ct1[KYBER_CIPHERTEXTBYTES];
  unsigned char shk0[KYBER_SSBYTES];
  unsigned char shk1[KYBER_SSBYTES];

  unsigned char randomness0[2*KYBER_SYMBYTES];
  unsigned char randomness1[2*KYBER_SYMBYTES];

  FILE *urandom = fopen("/dev/urandom", "r");
  fread(randomness0, 2*KYBER_SYMBYTES, 1, urandom);
  fread(randomness1, 2*KYBER_SYMBYTES, 1, urandom);
  fclose(urandom);

  /* TEST KEYPAIR */
  jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand(pk1, sk1, randomness0);
  crypto_kem_keypair_derand(pk0, sk0, randomness0);

  for(int i=0;i<KYBER_SECRETKEYBYTES;i++)
    if(sk0[i] != sk1[i]) {printf("error crypto_kem_keypair sk: %d\n", i);exit(-1); }

  for(int i=0;i<KYBER_PUBLICKEYBYTES;i++)
    if(pk0[i] != pk1[i]) {printf("error crypto_kem_keypair pk: %d\n", i);exit(-1); }

  /* TEST ENCAPSULATION */
  crypto_kem_enc_derand(ct0, shk0, pk0, randomness1);
  jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand(ct1, shk1, pk1, randomness1);

  for(int i=0;i<KYBER_CIPHERTEXTBYTES;i++)
    if(ct0[i] != ct1[i]) {printf("error crypto_kem_enc ct: %d\n", i);exit(-1); }

  for(int i=0;i<KYBER_SSBYTES;i++)
    if(shk0[i] != shk1[i]) {printf("error crypto_kem_enc ss: %d\n", i);exit(-1); }
  
  /* TEST DECAPSULATION */
  memset(shk0, 0, KYBER_SSBYTES);
  memset(shk1, 0, KYBER_SSBYTES);

  crypto_kem_dec(shk0, ct0, sk0);
  jade_kem_mlkem_mlkem1024_amd64_avx2_dec(shk1, ct1, sk1);

  for(int i=0;i<KYBER_SSBYTES;i++)
    if(shk0[i] != shk1[i]) {printf("error crypto_kem_dec (suc): %d %d %d\n", i, shk0[i], shk1[i]);exit(-1); }

  /* TEST DECAPSULATION FAILURE */
  memset(shk0, 0, KYBER_SSBYTES);
  memset(shk1, 0, KYBER_SSBYTES);

  ct0[0] = !ct0[0]; // corrupt a single byte
  ct1[0] = ct0[0];

  crypto_kem_dec(shk0, ct0, sk0);
  jade_kem_mlkem_mlkem1024_amd64_avx2_dec(shk1, ct1, sk1);

  for(int i=0;i<KYBER_SSBYTES;i++)
    if(shk0[i] != shk1[i]) {printf("error crypto_kem_dec (fail): %d %d %d\n", i, shk0[i], shk1[i]);exit(-1); }

  return 0;
}
