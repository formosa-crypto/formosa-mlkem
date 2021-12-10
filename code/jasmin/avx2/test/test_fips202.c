#include <stdio.h>
#include "../fips202.h"

#define MAXINLEN 33
#define MAXOUTLEN 168

int main(void)
{
  unsigned char in[MAXINLEN];
  unsigned char out0[MAXOUTLEN];
  unsigned char out1[MAXOUTLEN];
  uint64_t state0[25];
  uint64_t state1[25];
  int k;

  FILE *urandom = fopen("/dev/urandom", "r");
  fread(in, 1, sizeof(in), urandom);

  shake256(out0, 128, in, 33);
  shake256_128_33_jazz(out1, in);

  for(k=0;k<128;k++)
    if(out0[k] != out1[k]) printf("error shake256 at %d: %d %d\n", k, out0[k], out1[k]);

  sha3_512(out0, in, 32);
  sha3_512_32_jazz(out1, in);

  for(k=0;k<64;k++)
    if(out0[k] != out1[k]) printf("error sha3512 at %d: %d %d\n", k, out0[k], out1[k]);

  shake128_absorb(state0, in, 34);
  shake128_absorb34_jazz(state1, in);

  for(k=0;k<25;k++)
    if(state0[k] != state1[k]) printf("error shake128_absorb at %d: %lu %lu\n", k, state0[k], state1[k]);

  shake128_squeezeblocks(out0, 1, state0);
  shake128_squeezeblock_jazz(out1, state1);

  for(k=0;k<25;k++)
    if(state0[k] != state1[k]) printf("error shake128_squeezeblock (state) at %d: %lu %lu\n", k, state0[k], state1[k]);

  for(k=0;k<SHAKE128_RATE;k++)
    if(out0[k] != out1[k]) printf("error shake128_squeezeblock (out) at %d: %d %d\n", k, out0[k], out1[k]);


  fclose(urandom);
}
