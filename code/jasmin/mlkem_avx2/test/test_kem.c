#include <stdio.h>
#include <strings.h>

#include "../params.h"
#include "../ntt.h"
#include "../kem.h"

int main(void)
{
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
  fread(randomness0, 2*MLKEM_SYMBYTES, 1, urandom);
  fread(randomness1, 2*MLKEM_SYMBYTES, 1, urandom);
  fclose(urandom);

  /* TEST KEYPAIR */
  jade_kem_mlkem_mlkem768_amd64_avx2v_keypair_derand(pk1, sk1, randomness0);
  crypto_kem_keypair(pk0, sk0, randomness0);

  for(int i=0;i<MLKEM_SECRETKEYBYTES;i++)
    if(sk0[i] != sk1[i]) printf("error crypto_kem_keypair sk: %d\n", i);

  for(int i=0;i<MLKEM_PUBLICKEYBYTES;i++)
    if(pk0[i] != pk1[i]) printf("error crypto_kem_keypair pk: %d\n", i);

  /* TEST ENCAPSULATION */
  crypto_kem_enc(ct0, shk0, pk0, randomness1);
  jade_kem_mlkem_mlkem768_amd64_avx2v_enc_derand(ct1, shk1, pk1, randomness1);

  for(int i=0;i<MLKEM_CIPHERTEXTBYTES;i++)
    if(ct0[i] != ct1[i]) printf("error crypto_kem_enc ct: %d\n", i);

  for(int i=0;i<MLKEM_SSBYTES;i++)
    if(shk0[i] != shk1[i]) printf("error crypto_kem_enc ss: %d\n", i);
  
  /* TEST DECAPSULATION */
  memset(shk0, 0, MLKEM_SSBYTES);
  memset(shk1, 0, MLKEM_SSBYTES);

  crypto_kem_dec(shk0, ct0, sk0);
  jade_kem_mlkem_mlkem768_amd64_avx2v_dec(shk1, ct1, sk1);

  for(int i=0;i<MLKEM_SSBYTES;i++)
    if(shk0[i] != shk1[i]) printf("error crypto_kem_dec (suc): %d %d %d\n", i, shk0[i], shk1[i]);

  /* TEST DECAPSULATION FAILURE */
  memset(shk0, 0, MLKEM_SSBYTES);
  memset(shk1, 0, MLKEM_SSBYTES);

  ct0[0] = !ct0[0]; // corrupt a single byte
  ct1[0] = ct0[0];

  crypto_kem_dec(shk0, ct0, sk0);
  jade_kem_mlkem_mlkem768_amd64_avx2v_dec(shk1, ct1, sk1);

  for(int i=0;i<MLKEM_SSBYTES;i++)
    if(shk0[i] != shk1[i]) printf("error crypto_kem_dec (fail): %d %d %d\n", i, shk0[i], shk1[i]);

  return 0;
}
