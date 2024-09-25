#include <stdio.h>
#include <assert.h>
#include "../polyvec.h"

#ifndef TEST_ITERATIONS
#define TEST_ITERATIONS 10000
#endif

int main(void)
{
  int test_ok = 1;
  size_t test_iteration = 0;
  size_t ri;

  unsigned char in[MLKEM_POLYVECCOMPRESSEDBYTES];
  polyvec r0, r1;

  FILE *urandom = fopen("/dev/urandom", "r");

  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    ri = fread(in, 1, MLKEM_POLYVECCOMPRESSEDBYTES, urandom);
    assert(ri == MLKEM_POLYVECCOMPRESSEDBYTES);

    polyvec_decompress(&r0, in);
    polyvec_decompress_jazz(&r1, in);

    for(int i=0;i<MLKEM_K;i++)
    { for(int j=0;j<MLKEM_N;j++)
      { if(r0.vec[i].coeffs[j] != r1.vec[i].coeffs[j])
        { fprintf(stderr, "ERROR: polyvec_decompress: %d,%d: %d, %d\n", i, j, r0.vec[i].coeffs[j], r1.vec[i].coeffs[j]);
          test_ok = 0;
        }
      }
    }

    test_iteration += 1;
  }
  fclose(urandom);

  if(test_ok == 1)
  { printf("OK: polyvec_decompress\n"); }

  return 0;
}
