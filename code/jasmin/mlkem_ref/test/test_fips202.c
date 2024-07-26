#include <stdio.h>
#include <assert.h>
#include "../fips202.h"

#ifndef TEST_ITERATIONS
#define TEST_ITERATIONS 10000
#endif

#define MAXINLEN 33
#define MAXOUTLEN 168

int main(void)
{
  int test_ok = 1, test_ok_shake256_128_33 = 1, test_ok_sha3512_32 = 1,
      test_ok_shake128_absorb34 = 1, test_ok_shake128_squeezeblock = 1;
  size_t test_iteration = 0;
  unsigned char in[MAXINLEN];
  unsigned char out0[MAXOUTLEN];
  unsigned char out1[MAXOUTLEN];
  uint64_t state0[25];
  uint64_t state1[25];
  int k;

  FILE *urandom = fopen("/dev/urandom", "r");

  while(test_ok == 1 && test_iteration < TEST_ITERATIONS)
  {
    size_t ri = fread(in, 1, sizeof(in), urandom);
    assert(ri == sizeof(in));

    //
    shake256(out0, 128, in, 33);
    shake256_128_33_jazz(out1, in);

    for(k=0;k<128;k++)
    { if(out0[k] != out1[k])
      { fprintf(stderr, "ERROR: shake256_128_33 at %d: %d %d\n", k, out0[k], out1[k]);
        test_ok_shake256_128_33 = 0;
        test_ok = 0;
      }
    }

    //
    sha3_512(out0, in, 32);
    sha3512_32_jazz(out1, in);

    for(k=0;k<64;k++)
    { if(out0[k] != out1[k])
      { fprintf(stderr, "ERROR: sha3512 at %d: %d %d\n", k, out0[k], out1[k]);
        test_ok_sha3512_32 = 0;
        test_ok = 0;
      }
    }

    //
    shake128_absorb(state0, in, 34);
    shake128_absorb34_jazz(state1, in);

    for(k=0;k<25;k++)
    { if(state0[k] != state1[k])
      { fprintf(stderr, "ERROR: shake128_absorb at %d: %lu %lu\n", k, state0[k], state1[k]);
        test_ok_shake128_absorb34 = 0;
        test_ok = 0;
      }
    }

    //
    shake128_squeezeblocks(out0, 1, state0);
    shake128_squeezeblock_jazz(out1, state1);

    for(k=0;k<25;k++)
    { if(state0[k] != state1[k])
      { fprintf(stderr, "ERROR: shake128_squeezeblock (state) at %d: %lu %lu\n", k, state0[k], state1[k]);
        test_ok_shake128_squeezeblock = 0;
        test_ok = 0;
      }
    }

    for(k=0;k<SHAKE128_RATE;k++)
    { if(out0[k] != out1[k])
      { fprintf(stderr, "ERROR: shake128_squeezeblock (out) at %d: %d %d\n", k, out0[k], out1[k]);
        test_ok_shake128_squeezeblock = 0;
        test_ok = 0;
      }
    }

    test_iteration += 1;
  }

  fclose(urandom);

  //
  if(test_ok_shake256_128_33 == 1)
  { printf("OK: shake256_128_33\n"); }

  if(test_ok_sha3512_32 == 1)
  { printf("OK: sha3512_32\n"); }

  if(test_ok_shake128_absorb34 == 1)
  { printf("OK: shake128_absorb34\n"); }

  if(test_ok_shake128_squeezeblock == 1)
  { printf("OK: shake128_squeezeblock\n"); }
}
