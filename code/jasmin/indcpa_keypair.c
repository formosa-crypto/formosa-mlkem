#include <stdio.h>
#include <stdint.h>

#include "indcpa.h"
#include "poly.h"
#include "polyvec.h"
#include "ntt.h"
#include "symmetric.h"


#define gen_a(A,B)  gen_matrix(A,B,0)
#define gen_at(A,B) gen_matrix(A,B,1)

/*************************************************
* Name:        gen_matrix
*
* Description: Deterministically generate matrix A (or the transpose of A)
*              from a seed. Entries of the matrix are polynomials that look
*              uniformly random. Performs rejection sampling on output of
*              a XOF
*
* Arguments:   - polyvec *a:                pointer to ouptput matrix A
*              - const unsigned char *seed: pointer to input seed
*              - int transposed:            boolean deciding whether A or A^T is generated
**************************************************/
extern void gen_matrix_jazz(polyvec *a, const unsigned char *seed, long transposed);

/*
static void gen_matrix(polyvec *a, const unsigned char *seed, int transposed)
{
  unsigned int ctr, i, j;
  unsigned char buf[XOF_BLOCKBYTES];
  uint64_t state[25];
  unsigned char extseed[KYBER_SYMBYTES+2];

  for(i=0;i<KYBER_SYMBYTES;i++)
    extseed[i] = seed[i];

  for(i=0;i<KYBER_K;i++)
  {
    for(j=0;j<KYBER_K;j++)
    {
      if(transposed) {
        extseed[KYBER_SYMBYTES] = i;
        extseed[KYBER_SYMBYTES+1] = j;
      }
      else {
        extseed[KYBER_SYMBYTES] = j;
        extseed[KYBER_SYMBYTES+1] = i;
      }
        
      shake128_absorb34_jazz(&state, extseed);

      ctr = 0;
      while(ctr < KYBER_N)
      {
        shake128_squeezeblock_jazz(buf, &state);
        ctr = rej_uniform_jazz(a[i].vec[j].coeffs, ctr, buf);
      }
    }
  }
}
*/

/*************************************************
* Name:        indcpa_keypair
*
* Description: Generates public and private key for the CPA-secure
*              public-key encryption scheme underlying Kyber
*
* Arguments:   - unsigned char *pk: pointer to output public key (of length KYBER_INDCPA_PUBLICKEYBYTES bytes)
*              - unsigned char *sk: pointer to output private key (of length KYBER_INDCPA_SECRETKEYBYTES bytes)
**************************************************/
void indcpa_keypair_jazz(unsigned char *pk, 
                    unsigned char *sk,
                    const unsigned char *randomness,
                    const int16_t *zetas)
{
  polyvec a[KYBER_K], e, pkpv, skpv;
  unsigned char buf[2*KYBER_SYMBYTES];
  unsigned char *publicseed = buf;
  unsigned char *noiseseed = buf+KYBER_SYMBYTES;
  int i,j,k;

  //randombytes(buf, KYBER_SYMBYTES);
  for(i=0;i<KYBER_SYMBYTES;i++)
    buf[i] = randomness[i];

  //hash_g(buf, buf, KYBER_SYMBYTES);
  sha3512_32_jazz(buf, buf);

  gen_matrix_jazz(a, publicseed, 0);

  poly_getnoise_jazz(&skpv.vec[0], noiseseed, 0);
  poly_getnoise_jazz(&skpv.vec[1], noiseseed, 1);
  poly_getnoise_jazz(&skpv.vec[2], noiseseed, 2);

  poly_getnoise_jazz(&e.vec[0], noiseseed, 3);
  poly_getnoise_jazz(&e.vec[1], noiseseed, 4);
  poly_getnoise_jazz(&e.vec[2], noiseseed, 5);

  polyvec_ntt_jazz(&skpv, zetas);
  polyvec_ntt_jazz(&e, zetas);

  // matrix-vector multiplication
  polyvec_pointwise_acc_jazz(&pkpv.vec[0], &a[0], &skpv, zetas);
  polyvec_pointwise_acc_jazz(&pkpv.vec[1], &a[1], &skpv, zetas);
  polyvec_pointwise_acc_jazz(&pkpv.vec[2], &a[2], &skpv, zetas);
  poly_frommont_jazz(&pkpv.vec[0]);
  poly_frommont_jazz(&pkpv.vec[1]);
  poly_frommont_jazz(&pkpv.vec[2]);

  polyvec_add_jazz(&pkpv, &pkpv, &e);
  polyvec_reduce_jazz(&pkpv);

  polyvec_tobytes_jazz(sk, &skpv);
  polyvec_tobytes_jazz(pk, &pkpv);
  for(i=0;i<KYBER_SYMBYTES;i++)
    pk[KYBER_POLYVECBYTES+i] = publicseed[i];
}

