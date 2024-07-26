#ifndef TEST_POLYVEC_SETRANDOM
#define TEST_POLYVEC_SETRANDOM

#include <stdio.h>
#include <assert.h>
#include "../polyvec.h"

// note: extend to *_setrandom_open; *_setrandom; *_setrandom_close;
// to not open the file so many times

void polyvec_setrandom(polyvec *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  for(int i=0;i<MLKEM_K;i++)
  { size_t ri = fread(r->vec[i].coeffs, sizeof(int16_t), MLKEM_N, urandom);
    assert(ri == MLKEM_N);
  }
  for(int i=0;i<MLKEM_K;i++)
    for(int j=0;j<MLKEM_N;j++)
      r->vec[i].coeffs[j] %= MLKEM_Q;
  fclose(urandom);
}

void polyvec_setrandom_reduce(polyvec *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  for(int i=0;i<MLKEM_K;i++)
  { size_t ri = fread(r->vec[i].coeffs, sizeof(int16_t), MLKEM_N, urandom);
    assert(ri == MLKEM_N);
  }
  polyvec_reduce(r);
  fclose(urandom);
}

void polyvec_setrandom_mod2q(polyvec *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  for(int i=0;i<MLKEM_K;i++)
  { size_t ri = fread(r->vec[i].coeffs, sizeof(int16_t), MLKEM_N, urandom);
    assert(ri == MLKEM_N);
  }
  for(int i=0;i<MLKEM_K;i++)
    for(int j=0;j<MLKEM_N;j++)
      r->vec[i].coeffs[j] %= 2*MLKEM_Q;
  fclose(urandom);
}

void polyvec_setrandom_nomodq(polyvec *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  for(int i=0;i<MLKEM_K;i++)
  { size_t ri = fread(r->vec[i].coeffs, sizeof(int16_t), MLKEM_N, urandom);
    assert(ri == MLKEM_N);
  }
  fclose(urandom);
}

#endif
