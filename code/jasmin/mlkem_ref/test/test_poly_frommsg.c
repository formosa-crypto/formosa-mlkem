#include <stdio.h>
#include <assert.h>
#include "../poly.h"
#include "../ntt.h"

#ifndef TEST_ITERATIONS
#define TEST_ITERATIONS 10000
#endif

int main(void)
{
  int test_ok = 1;
  size_t test_iteration = 0;
  size_t ri;
  unsigned char in[32];
  poly r0, r1;

  FILE *urandom = fopen("/dev/urandom", "r");

  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    ri = fread(in, 1, 32, urandom);
    assert(ri == 32);

    poly_frommsg(&r0, in);
    poly_frommsg_jazz(&r1, in);

    for(int i=0;i<MLKEM_N;i++)
    { if(r0.coeffs[i] != r1.coeffs[i])
       { fprintf(stderr, "ERROR: poly_frommsg: %d, %d, %d\n", i, r0.coeffs[i], r1.coeffs[i]);
         test_ok = 0;
       }
    }

    test_iteration += 1;
  }

  fclose(urandom);

  if(test_ok == 1)
  { printf("OK: poly_frommsg\n"); }

  return 0;
}
