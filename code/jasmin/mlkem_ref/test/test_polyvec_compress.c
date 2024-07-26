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
  unsigned char out0[MLKEM_POLYVECCOMPRESSEDBYTES];
  unsigned char out1[MLKEM_POLYVECCOMPRESSEDBYTES];
  polyvec a;
  
  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    polyvec_setrandom_reduce(&a);

    polyvec_compress(out0, &a);
    polyvec_compress_jazz(out1, &a);

    for(int i=0;i<MLKEM_POLYVECCOMPRESSEDBYTES;i++)
    { if(out0[i] != out1[i])
      { fprintf(stderr, "ERROR: polyvec_compress: %d, %d, %d\n", i, out0[i], out1[i]);
        test_ok = 0;
      }
    }

    test_iteration += 1;
  }

  if(test_ok == 1)
  { printf("OK: polyvec_compress\n"); }

  return 0;
}
