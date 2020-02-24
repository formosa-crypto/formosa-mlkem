#include <stdio.h>
#include "../fips202.h"

#define MAXINLEN 33
#define MAXOUTLEN 128

int main(void)
{
  unsigned char in[MAXINLEN];
  unsigned char out0[MAXOUTLEN];
  unsigned char out1[MAXOUTLEN];
  int k;

  FILE *urandom = fopen("/dev/urandom", "r");
  fread(in, 1, sizeof(in), urandom);

  shake256(out0, 128, in, 33);
  shake256_128_33_jazz(out1, in);

  for(k=0;k<128;k++)
    if(out0[k] != out1[k]) printf("error shake256 at %d: %d %d\n", k, out0[k], out1[k]);

  sha3_512(out0, in, 32);
  sha3512_32_jazz(out1, in);

  for(k=0;k<64;k++)
    if(out0[k] != out1[k]) printf("error sha3512 at %d: %d %d\n", k, out0[k], out1[k]);

  fclose(urandom);
}
