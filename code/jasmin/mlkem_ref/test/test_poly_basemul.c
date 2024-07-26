#include <stdio.h>
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
  poly a, b, r0, r1;

  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    poly_setrandom(&a);
    poly_setrandom(&b);

    poly_basemul(&r0, &a, &b);
    
    poly_basemul_jazz(&r1, &a, &b);

    for(int i=0;i<MLKEM_N;i++)
    { if(r0.coeffs[i] != r1.coeffs[i])
      { fprintf(stderr, "ERROR: poly_basemul: %d, %d, %d\n", i, r0.coeffs[i], r1.coeffs[i]);
        test_ok = 0;
      }
    }

    test_iteration += 1;
  }

  if(test_ok == 1)
  { printf("OK: poly_basemul\n"); }

  return 0;
}
