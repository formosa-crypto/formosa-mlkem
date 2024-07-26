#include <stdio.h>
#include <assert.h>
#include "../poly.h"
#include "../ntt.h"

#ifndef TEST_ITERATIONS
#define TEST_ITERATIONS 10000
#endif

#include "test_poly_setrandom.c"

int main(void)
{
  int test_ok = 1;
  size_t test_iteration = 0;
  poly r0, r1;

  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    poly_setrandom_nomodq(&r0);

    for(int i=0;i<MLKEM_N;i++)
      r1.coeffs[i] = r0.coeffs[i];
   
    poly_reduce(&r0);
    poly_reduce_jazz(&r1);

    for(int i=0;i<MLKEM_N;i++)
    { if(r0.coeffs[i] != r1.coeffs[i])
      { fprintf(stderr, "ERROR: poly_reduce: %d, %d, %d\n", i, r0.coeffs[i], r1.coeffs[i]);
        test_ok = 0;
      }
    }

    test_iteration += 1;
  }

  if(test_ok == 1)
  { printf("OK: poly_reduce\n"); }

  return 0;
}
