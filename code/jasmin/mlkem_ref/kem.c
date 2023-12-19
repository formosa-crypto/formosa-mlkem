#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include "kem.h"
#include "indcpa.h"
#include "symmetric.h"

/*************************************************
* Name:        verify
*
* Description: Compare two arrays for equality in constant time.
*
* Arguments:   const uint8_t *a: pointer to first byte array
*              const uint8_t *b: pointer to second byte array
*              size_t len:       length of the byte arrays
*
* Returns 0 if the byte arrays are equal, 1 otherwise
**************************************************/
uint64_t verify(const uint8_t *a, const uint8_t *b, size_t len)
{
  size_t i;
  uint8_t r;

  r = 0;
  for(i=0; i < len; i ++)
    r |= a[i] ^ b[i];

  return (-(uint64_t)r) >> 63;
}

/*************************************************
* Name:        cmov
*
* Description: Copy len bytes from x to r if b is 1;
*              don't modify x if b is 0. Requires b to be in {0,1};
*              assumes two's complement representation of negative integers.
*              Runs in constant time.
*
* Arguments:   uint8_t *r:       pointer to output byte array
*              const uint8_t *x: pointer to input byte array
*              size_t len:       Amount of bytes to be copied
*              uint8_t b:        Condition bit; has to be in {0,1}
**************************************************/
void cmov(uint8_t *r, const uint8_t *x, size_t len, uint8_t b)
{
  size_t i;

  b = -b;
  for(i=0; i < len; i++)
    r[i] ^= b & (r[i] ^ x[i]);
}

/*************************************************
* Name:        crypto_kem_keypair
*
* Description: Generates public and private key for the CCA-secure
*              Kyber key encapsulation mechanism
*
* Arguments:   - unsigned char *pk: pointer to output public key
*              - unsigned char *sk: pointer to output private key
**************************************************/
void crypto_kem_keypair(unsigned char *pk, 
                    unsigned char *sk,
                    const unsigned char *randomness)
{
  indcpa_keypair(pk, sk, randomness);

  memcpy(sk+MLKEM_INDCPA_SECRETKEYBYTES, pk, MLKEM_INDCPA_PUBLICKEYBYTES);

  hash_h(sk+MLKEM_SECRETKEYBYTES-2*MLKEM_SYMBYTES, pk, MLKEM_PUBLICKEYBYTES);

  memcpy(sk+MLKEM_SECRETKEYBYTES-MLKEM_SYMBYTES, randomness + MLKEM_SYMBYTES, MLKEM_SYMBYTES);
}

/*************************************************
* Name:        crypto_kem_enc
*
* Description: Generates cipher text and shared
*              secret for given public key
*
* Arguments:   - unsigned char *c:          pointer to output ciphertext (of length MLKEM_INDCPA_BYTES bytes)
*              - const unsigned char *m:    pointer to input message (of length MLKEM_INDCPA_MSGBYTES bytes)
*              - const unsigned char *pk:   pointer to input public key (of length MLKEM_INDCPA_PUBLICKEYBYTES bytes)
*              - const unsigned char *coin: pointer to input random coins used as seed (of length MLKEM_SYMBYTES bytes)
*                                           to deterministically generate all randomness
**************************************************/
void crypto_kem_enc(unsigned char *ct,
                unsigned char *ss,
                const unsigned char *pk,
                const unsigned char *coins)
{
  uint8_t buf[2*MLKEM_SYMBYTES];
  /* Will contain key, coins */
  uint8_t kr[2*MLKEM_SYMBYTES];

  memcpy(buf, coins, MLKEM_SYMBYTES);

  /* Multitarget countermeasure for coins + contributory KEM */
  hash_h(buf+MLKEM_SYMBYTES, pk, MLKEM_PUBLICKEYBYTES);
  hash_g(kr, buf, 2*MLKEM_SYMBYTES);

  /* coins are in kr+MLKEM_SYMBYTES */
  indcpa_enc(ct, buf, pk, kr+MLKEM_SYMBYTES);

  memcpy(ss,kr,MLKEM_SYMBYTES);
}

/*************************************************
* Name:        crypto_kem_dec
*
* Description: Generates shared secret for given
*              cipher text and private key
*
* Arguments:   - unsigned char *m:        pointer to output decrypted message (of length MLKEM_INDCPA_MSGBYTES)
*              - const unsigned char *c:  pointer to input ciphertext (of length MLKEM_INDCPA_BYTES)
*              - const unsigned char *sk: pointer to input secret key (of length MLKEM_INDCPA_SECRETKEYBYTES)
**************************************************/
void crypto_kem_dec(uint8_t *ss,
                const uint8_t *ct,
                const uint8_t *sk)
{
  int fail;
  uint8_t buf[2*MLKEM_SYMBYTES];
  /* Will contain key, coins */
  uint8_t kr[2*MLKEM_SYMBYTES];
  uint8_t cmp[MLKEM_CIPHERTEXTBYTES+MLKEM_SYMBYTES];
  const uint8_t *pk = sk+MLKEM_INDCPA_SECRETKEYBYTES;

  indcpa_dec(buf, ct, sk);

  /* Multitarget countermeasure for coins + contributory KEM */
  memcpy(buf+MLKEM_SYMBYTES, sk+MLKEM_SECRETKEYBYTES-2*MLKEM_SYMBYTES, MLKEM_SYMBYTES);
  hash_g(kr, buf, 2*MLKEM_SYMBYTES);

  /* coins are in kr+MLKEM_SYMBYTES */
  indcpa_enc(cmp, buf, pk, kr+MLKEM_SYMBYTES);

  fail = verify(ct, cmp, MLKEM_CIPHERTEXTBYTES);

  /* Compute rejection key */
  rkprf(ss,sk+MLKEM_SECRETKEYBYTES-MLKEM_SYMBYTES,ct);

  /* Copy true key to return buffer if fail is false */
  cmov(ss,kr,MLKEM_SYMBYTES,!fail);
}
