#include <stdio.h>
#include "../poly.h"

#ifndef TEST_ITERATIONS
#define TEST_ITERATIONS 10000
#endif

#include "test_poly_setrandom.c"

int main(void)
{
  int test_ok = 1;
  size_t test_iteration = 0;
  poly a, b, r0;

  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    poly_setrandom(&a);
    poly_setrandom(&b);
    
    poly_add(&r0, &a, &b);
    
    poly_add2_jazz(&a, &b);

    for(int i=0;i<MLKEM_N;i++)
    { if(r0.coeffs[i] != a.coeffs[i])
      { fprintf(stderr, "ERROR: poly_add: %d, %d, %d\n", i, r0.coeffs[i], a.coeffs[i]);
        test_ok = 0;
      }
    }

    test_iteration += 1;
  }

  if(test_ok == 1)
  { printf("OK: poly_add\n"); }

  return 0;
}
