#include <stdio.h>
#include "../fips202.h"

#define MAXINLEN 200
#define MAXOUTLEN 200

int main(void)
{
  unsigned char in[MAXINLEN];
  unsigned char out0[MAXOUTLEN];
  unsigned char out1[MAXOUTLEN];
  int i,j,k;

  FILE *urandom = fopen("/dev/urandom", "r");
  fread(in, 1, sizeof(in), urandom);

  for(i=0;i<MAXINLEN;i++)
  {
    for(j=0;j<MAXOUTLEN;j++)
    {
      shake256(out0, j, in, i);
      shake256_jazz(out1, j, in, i);
      for(k=0;k<j;k++)
        if(out0[k] != out1[k]) printf("error shake256\n");
    }
  }

  fclose(urandom);
}
