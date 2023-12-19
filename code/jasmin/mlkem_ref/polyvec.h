#ifndef POLYVEC_H
#define POLYVEC_H

#include "params.h"
#include "poly.h"

typedef struct{
  poly vec[MLKEM_K];
} polyvec;

void polyvec_compress(unsigned char *r, polyvec *a);
void polyvec_decompress(polyvec *r, const unsigned char *a);

void polyvec_tobytes(unsigned char *r, polyvec *a);
void polyvec_frombytes(polyvec *r, const unsigned char *a);

void polyvec_ntt(polyvec *r);
void polyvec_invntt(polyvec *r);

void polyvec_pointwise_acc(poly *r, const polyvec *a, const polyvec *b);

void polyvec_reduce(polyvec *r);
void polyvec_csubq(polyvec *r);

void polyvec_add(polyvec *r, const polyvec *a, const polyvec *b);




void polyvec_compress_jazz(unsigned char *r, polyvec *a);
void polyvec_decompress_jazz(polyvec *r, const unsigned char *a);

void polyvec_tobytes_jazz(unsigned char *r, polyvec *a);
void polyvec_frombytes_jazz(polyvec *r, const unsigned char *a);

void polyvec_ntt_jazz(polyvec *r);
void polyvec_invntt_jazz(polyvec *r);

void polyvec_pointwise_acc_jazz(poly *r, const polyvec *a, const polyvec *b);

void polyvec_reduce_jazz(polyvec *r);
void polyvec_csubq_jazz(polyvec *r);

void polyvec_add2_jazz(polyvec *r, const polyvec *b);


#endif
