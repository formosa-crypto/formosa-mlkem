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
  int test_ok = 1, test_ok_poly_getnoise_eta1_4x = 1,
      test_ok_poly_getnoise_eta1122_4x = 1;
  size_t test_iteration = 0;
  size_t ri;
  poly r0[4], r1[4];
  unsigned char seed[MLKEM_SYMBYTES];

  FILE *urandom = fopen("/dev/urandom", "r");

  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    ri = fread(seed, 1, MLKEM_SYMBYTES, urandom);
    assert(ri == MLKEM_SYMBYTES);

    poly_getnoise_eta1(r0, seed, 0);
    poly_getnoise_eta1(&r0[1], seed, 1);
    poly_getnoise_eta1(&r0[2], seed, 2);
    poly_getnoise_eta1(&r0[3], seed, 3);
    poly_getnoise_eta1_4x_jazz(r1, seed, 0);

    for(int i=0;i<4;i++)
    { for(int j=0;j<MLKEM_N;j++)
      { if(r0[i].coeffs[j] != r1[i].coeffs[j])
        { fprintf(stderr, "ERROR: poly_getnoise_eta1_4x %d, %d, %d\n", i*256+j, r0[i].coeffs[j], r1[i].coeffs[j]);
          test_ok_poly_getnoise_eta1_4x = 0;
          test_ok = 0;
        }
      }
    }

    poly_getnoise_eta1(r0, seed, 0);
    poly_getnoise_eta1(&r0[1], seed, 1);
    poly_getnoise_eta2(&r0[2], seed, 2);
    poly_getnoise_eta2(&r0[3], seed, 3);
    poly_getnoise_eta1122_4x_jazz(r1, seed, 0);

    for(int i=0;i<4;i++)
    { for(int j=0;j<MLKEM_N;j++)
      { if(r0[i].coeffs[j] != r1[i].coeffs[j])
        { fprintf(stderr, "ERROR: poly_getnoise_eta1122_4x %d, %d, %d\n", i*256+j, r0[i].coeffs[j], r1[i].coeffs[j]);
          test_ok_poly_getnoise_eta1122_4x = 0;
          test_ok = 0;
        }
      }
    }

    test_iteration += 1;
  }
  fclose(urandom);

  if(test_ok_poly_getnoise_eta1_4x == 1)
  { printf("OK: poly_getnoise_eta1_4x\n"); }

  if(test_ok_poly_getnoise_eta1122_4x == 1)
  { printf("OK: poly_getnoise_eta1122_4x\n"); }

  return 0;
}

