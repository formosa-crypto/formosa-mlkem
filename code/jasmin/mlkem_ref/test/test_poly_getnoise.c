#include <stdio.h>
#include <assert.h>
#include "../poly.h"
#include "../ntt.h"
#include "../params.h"

#ifndef TEST_ITERATIONS
#define TEST_ITERATIONS 10000
#endif

int main(void)
{
  int test_ok = 1;
  size_t test_iteration = 0;
  size_t ri;
  poly r0, r1;
  unsigned char seed[MLKEM_SYMBYTES];

  FILE *urandom = fopen("/dev/urandom", "r");

  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    ri = fread(seed, 1, MLKEM_SYMBYTES, urandom);
    assert(ri == MLKEM_SYMBYTES);

    for(int i = 0; i < 1; i++)
    {
      poly_getnoise(&r0, seed, i);
      poly_getnoise_jazz(&r1, seed, i);

      for(int j=0;j<MLKEM_N;j++)
      { if(r0.coeffs[j] != r1.coeffs[j])
        { fprintf(stderr, "ERROR: poly_getnoise: %d, %d, %d\n", j, r0.coeffs[j], r1.coeffs[j]);
          test_ok = 0;
        }
      }
    }

    test_iteration += 1;
  }
  fclose(urandom);

  if(test_ok == 1)
  { printf("OK: poly_getnoise\n"); }

  return 0;
}
