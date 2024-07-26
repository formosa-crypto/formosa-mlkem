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
  unsigned char out0[128];
  unsigned char out1[128];
  poly a;
  
  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    poly_setrandom_nomodq(&a);

    poly_compress(out0, &a);
    poly_compress_jazz(out1, &a);

    for(int i=0;i<128;i++)
    { if(out0[i] != out1[i])
      { fprintf(stderr, "ERROR: poly_compress: %d, %d, %d\n", i, out0[i], out1[i]);
        test_ok = 0;
      }
    }

    test_iteration += 1;
  }

  if(test_ok == 1)
  { printf("OK: poly_compress\n"); }

  return 0;
}
