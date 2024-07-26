#ifndef NTT_H
#define NTT_H

#include <stdint.h>
#include "params.h"
#include "consts.h"

extern int16_t zetas[128];
extern int16_t zetas_inv[128];

void ntt(int16_t r[256]);
void invntt(int16_t r[256]);

void basemul(int16_t r[2], const int16_t a[2], const int16_t b[2], int16_t zeta);

#define ntt_avx MLKEM_NAMESPACE(ntt_avx)
//void ntt_avx(int16_t *r, const uint16_t *qdata);
//void nttl0_avx(int16_t *r, const uint16_t *qdata);
//void nttl1t6_avx(int16_t *r, const uint16_t *qdata);
#define invntt_avx MLKEM_NAMESPACE(invntt_avx)
//void invntt_avx(int16_t *r, const uint16_t *qdata);

#define nttpack_avx MLKEM_NAMESPACE(nttpack_avx)
void nttpack_avx(int16_t *r, const uint16_t *qdata);
#define nttunpack_avx MLKEM_NAMESPACE(nttunpack_avx)
void nttunpack_avx(int16_t *r, const uint16_t *qdata);

#define basemul_avx MLKEM_NAMESPACE(basemul_avx)
void basemul_avx(int16_t *r,
                 const int16_t *a,
                 const int16_t *b,
                 const uint16_t *qdata);
#define basemul_acc_avx MLKEM_NAMESPACE(basemul_acc_avx)
void basemul_acc_avx(int16_t *r,
                     const int16_t *a,
                     const int16_t *b,
                     const uint16_t *qdata);

#define ntttobytes_avx MLKEM_NAMESPACE(ntttobytes_avx)
void ntttobytes_avx(uint8_t *r, const int16_t *a, const uint16_t *qdata);
#define nttfrombytes_avx MLKEM_NAMESPACE(nttfrombytes_avx)
void nttfrombytes_avx(int16_t *r, const uint8_t *a, const uint16_t *qdata);

#endif
