#include <stdint.h>
#include "indcpa.h"
#include "poly.h"
#include "polyvec.h"
#include "ntt.h"
#include "symmetric.h"


/*************************************************
* Name:        rej_uniform
*
* Description: Run rejection sampling on uniform random bytes to generate
*              uniform random integers mod q
*
* Arguments:   - int16_t *r:               pointer to output buffer
*              - unsigned int len:         requested number of 16-bit integers (uniform mod q)
*              - const unsigned char *buf: pointer to input buffer (assumed to be uniform random bytes)
*              - unsigned int buflen:      length of input buffer in bytes
*
* Returns number of sampled 16-bit integers (at most len)
**************************************************/
static unsigned int rej_uniform(int16_t *r, unsigned int offset, const unsigned char *buf, unsigned int buflen)
{
  unsigned int ctr, pos;
  uint16_t val;

  ctr = offset;
  pos = 0;
  while(ctr < KYBER_N && pos + 2 <= buflen)
  {
    val = buf[pos] | ((uint16_t)buf[pos+1] << 8);
    pos += 2;

    if(val < 19*KYBER_Q)
    {
      val -= (val >> 12) * KYBER_Q; // Barrett reduction
      r[ctr++] = (int16_t)val;
    }
  } 

  return ctr;
}

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
static void gen_matrix(polyvec *a, const unsigned char *seed, int transposed) // Not static for benchmarking
{
  unsigned int ctr, i, j;
  unsigned char buf[XOF_BLOCKBYTES];
  xof_state state;

  for(i=0;i<KYBER_K;i++)
  {
    for(j=0;j<KYBER_K;j++)
    {
      if(transposed) {
        xof_absorb(&state, seed, i, j);
      }
      else {
        xof_absorb(&state, seed, j, i);
      }

      xof_squeezeblocks(buf, 1, &state);
      ctr = rej_uniform(a[i].vec[j].coeffs, 0, buf, XOF_BLOCKBYTES);

      while(ctr < KYBER_N)
      {
        xof_squeezeblocks(buf, 1, &state);
        ctr = rej_uniform(a[i].vec[j].coeffs, ctr, buf, XOF_BLOCKBYTES);
      }
    }
  }
}

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
                    const int16_t *zetas,
                    const int16_t *zetas_inv)
{
  polyvec a[KYBER_K], e, pkpv, skpv;
  unsigned char buf[2*KYBER_SYMBYTES];
  unsigned char *publicseed = buf;
  unsigned char *noiseseed = buf+KYBER_SYMBYTES;
  int i;
  unsigned char nonce=0;

  //randombytes(buf, KYBER_SYMBYTES);
  for(i=0;i<KYBER_SYMBYTES;i++)
    buf[i] = randomness[i];

  //hash_g(buf, buf, KYBER_SYMBYTES);
  sha3512_32_jazz(buf, buf);

  gen_a(a, publicseed);

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

