#ifndef TEST_POLY_SETRANDOM
#define TEST_POLY_SETRANDOM

#include <stdio.h>
#include <assert.h>
#include "../poly.h"

// note: extend to *_setrandom_open; *_setrandom; *_setrandom_close;
// to not open the file so many times

void poly_setrandom(poly *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  size_t ri = fread(r->coeffs, sizeof(int16_t), MLKEM_N, urandom);
  assert(ri == MLKEM_N);
  for(int i=0;i<MLKEM_N;i++)
  { r->coeffs[i] %= MLKEM_Q; }
  fclose(urandom);
}

void poly_setrandom_mod2q(poly *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  size_t ri = fread(r->coeffs, sizeof(int16_t), MLKEM_N, urandom);
  assert(ri == MLKEM_N);
  for(int i=0;i<MLKEM_N;i++)
  { r->coeffs[i] %= 2*MLKEM_Q; }
  fclose(urandom);
}

void poly_setrandom_nomodq(poly *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  size_t ri = fread(r->coeffs, sizeof(int16_t), MLKEM_N, urandom);
  assert(ri == MLKEM_N);
  fclose(urandom);
  poly_reduce(r);
}

#endif
