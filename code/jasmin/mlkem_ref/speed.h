#ifndef SPEED_H
#define SPEED_H

#include<stdint.h>
#include "params.h"

typedef struct{
  int16_t __attribute__((aligned(32))) coeffs[MLKEM_N];
} poly;

typedef struct{
  poly vec[MLKEM_K];
} polyvec;

uint64_t gen_matrix_jazz(polyvec *a, unsigned char *seed);

// Poly functions
uint64_t poly_getnoise_jazz(poly *r,const unsigned char *seed, unsigned char nonce);

uint64_t poly_ntt_jazz(poly *r);
uint64_t poly_invntt_jazz(poly *r);

uint64_t poly_frommsg_jazz(poly *r, const unsigned char msg[MLKEM_SYMBYTES]);
uint64_t poly_tomsg_jazz(unsigned char msg[MLKEM_SYMBYTES], poly *r);

uint64_t poly_compress_jazz(unsigned char *r, poly *a);
uint64_t poly_decompress_jazz(poly *r, const unsigned char *a);

// Polyvec functions
uint64_t polyvec_pointwise_acc_jazz(poly *r, const polyvec *a, const polyvec *b);
uint64_t polyvec_compress_jazz(unsigned char *r, polyvec *a);
uint64_t polyvec_decompress_jazz(polyvec *r, const unsigned char *a);

// Indcpa functions
void indcpa_keypair_jazz(unsigned char *pk,
                         unsigned char *sk,
                         const unsigned char *randomness);

void indcpa_enc_jazz(unsigned char *c,
                     const unsigned char *m,
                     const unsigned char *pk,
                     const unsigned char *coins);

void indcpa_dec_jazz(unsigned char *m,
                     const unsigned char *c,
                     const unsigned char *sk);

// KEM functions
void crypto_kem_keypair_jazz(unsigned char *pk,
                             unsigned char *sk,
                             const unsigned char *randomness);

void crypto_kem_enc_jazz(unsigned char *c,
                         const unsigned char *m,
                         const unsigned char *pk,
                         const unsigned char *coins);

void crypto_kem_dec_jazz(unsigned char *m,
                         const unsigned char *c,
                         const unsigned char *sk);
#endif
