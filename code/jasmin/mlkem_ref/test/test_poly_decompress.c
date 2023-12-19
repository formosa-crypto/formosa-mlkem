#include <stdio.h>
#include "../poly.h"
#include "../ntt.h"

int main(void)
{
  unsigned char in[MLKEM_POLYCOMPRESSEDBYTES];
  poly r0, r1;
 
  FILE *urandom = fopen("/dev/urandom", "r");
  fread(in, 1, MLKEM_POLYCOMPRESSEDBYTES, urandom);
  fclose(urandom);

  poly_decompress(&r0, in);
  poly_decompress_jazz(&r1, in);

  for(int i=0;i<MLKEM_N;i++)
  {
    if(r0.coeffs[i] != r1.coeffs[i])
      printf("error decompress %d, %d, %d\n", i, r0.coeffs[i], r1.coeffs[i]);
  }

  return 0;
}
