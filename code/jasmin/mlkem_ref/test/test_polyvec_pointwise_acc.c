#include <stdio.h>
#include <assert.h>
#include "../ntt.h"
#include "../polyvec.h"

#ifndef TEST_ITERATIONS
#define TEST_ITERATIONS 10000
#endif

#include "test_polyvec_setrandom.c"

int main(void)
{
  int test_ok = 1;
  size_t test_iteration = 0;
  polyvec a, b;
  poly r0, r1;

  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    polyvec_setrandom(&a);
    polyvec_setrandom(&b);
    
    polyvec_pointwise_acc(&r0, &a, &b);
    polyvec_pointwise_acc_jazz(&r1, &a, &b);

    for(int j=0;j<MLKEM_N;j++)
    { if(r0.coeffs[j] != r1.coeffs[j])
      { fprintf(stderr, "ERROR: polyvec_pointwise_acc %d: %d, %d\n", j, r0.coeffs[j], r1.coeffs[j]);
        test_ok = 0;
      }
    }
    test_iteration += 1;
  }

  if(test_ok == 1)
  { printf("OK: polyvec_pointwise_acc\n"); }

  return 0;
}
