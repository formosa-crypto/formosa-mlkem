#include <stdio.h>
#include <stdint.h>

#include "indcpa.h"
#include "poly.h"
#include "polyvec.h"
#include "ntt.h"
#include "symmetric.h"

extern void gen_matrix_jazz(polyvec *a, const unsigned char *seed, long transposed);


void indcpa_keypair_c(unsigned char *pk, 
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

