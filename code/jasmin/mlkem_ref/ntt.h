#ifndef NTT_H
#define NTT_H

#include <stdint.h>

extern int16_t zetas[128];
extern int16_t zetas_inv[128];

void ntt(int16_t poly[256]);
void splitntt(int16_t *poly);

void invntt(int16_t poly[256]);
void basemul(int16_t r[2], const int16_t a[2], const int16_t b[2], int16_t zeta);

#endif
