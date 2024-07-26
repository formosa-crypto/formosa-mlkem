#include <stdio.h>
#include <assert.h>
#include "../polyvec.h"
#include "../ntt.h"

#ifndef TEST_ITERATIONS
#define TEST_ITERATIONS 10000
#endif

#include "test_polyvec_setrandom.c"

int main(void)
{
  int test_ok = 1;
  size_t test_iteration = 0;
  unsigned char out0[MLKEM_POLYVECBYTES];
  unsigned char out1[MLKEM_POLYVECBYTES];
  polyvec a;

  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    polyvec_setrandom(&a);

    polyvec_tobytes(out0, &a);
    polyvec_tobytes_jazz(out1, &a);

    for(int i=0;i<MLKEM_POLYVECBYTES;i++)
    { if(out0[i] != out1[i])
      { fprintf(stderr, "ERROR: poly_tobytes: %d, %d, %d\n", i, out0[i], out1[i]);
        test_ok = 0;
      }
    }

    test_iteration += 1;
  }

  if(test_ok == 1)
  { printf("OK: polyvec_tobytes\n"); }


  return 0;
}
