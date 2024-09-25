#include <stdio.h>
#include <assert.h>
#include "../poly.h"
#include "../polyvec.h"

#ifndef TEST_ITERATIONS
#define TEST_ITERATIONS 10000
#endif

#include "test_polyvec_setrandom.c"

int main(void)
{
  int test_ok = 1;
  size_t test_iteration = 0;
  polyvec r0, r1;

  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    polyvec_setrandom_reduce(&r0);
    
    for(int i = 0;i<MLKEM_K;i++)
      for(int j = 0;j<MLKEM_N;j++)
        r1.vec[i].coeffs[j] = r0.vec[i].coeffs[j];

    polyvec_csubq(&r0);
    polyvec_csubq_jazz(&r1);

    for(int i=0;i<MLKEM_K;i++)
    { for(int j=0;j<MLKEM_N;j++)
      { if(r0.vec[i].coeffs[j] != r1.vec[i].coeffs[j])
        { fprintf(stderr, "ERROR: polyvec_csubq: %d,%d: %d, %d\n", i, j, r0.vec[i].coeffs[j], r1.vec[i].coeffs[j]);
          test_ok = 0;
        }
      }
    }

    test_iteration += 1;
  }

  if(test_ok == 1)
  { printf("OK: polyvec_csubq\n"); }

  return 0;
}
