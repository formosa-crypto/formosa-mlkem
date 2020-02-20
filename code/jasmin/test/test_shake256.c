#include <stdio.h>
#include "../fips202.h"

#define INLEN 33
#define OUTLEN 128

int main(void)
{
  unsigned char in[INLEN];
  unsigned char out0[OUTLEN];
  unsigned char out1[OUTLEN];
  int k;

  FILE *urandom = fopen("/dev/urandom", "r");
  fread(in, 1, sizeof(in), urandom);

  shake256(out0, OUTLEN, in, INLEN);
  shake256_128_33_jazz(out1, in);

  for(k=0;k<OUTLEN;k++)
    if(out0[k] != out1[k]) printf("error shake256 at %d: %d %d\n", k, out0[k], out1[k]);

  fclose(urandom);
}
