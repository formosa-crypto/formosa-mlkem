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
  unsigned char out0[MLKEM_INDCPA_MSGBYTES];
  unsigned char out1[MLKEM_INDCPA_MSGBYTES];
  poly a;

  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    poly_setrandom_nomodq(&a);

    poly_tomsg(out0, &a);
    poly_tomsg_jazz(out1, &a);

    for(int i=0;i<MLKEM_INDCPA_MSGBYTES;i++)
    { if(out0[i] != out1[i])
      { fprintf(stderr, "ERROR: poly_tomsg %d, %d, %d\n", i, out0[i], out1[i]);
        test_ok = 0;
      }
    }

    test_iteration += 1;
  }

  if(test_ok == 1)
  { printf("OK: poly_tomsg\n"); }

  return 0;
}
