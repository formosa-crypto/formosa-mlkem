#include <stdio.h>
#include "../poly.h"
#include "../ntt.h"

int main(void)
{
  unsigned char in[32];
  poly r0, r1;
 
  FILE *urandom = fopen("/dev/urandom", "r");
  fread(in, 1, 32, urandom);
  fclose(urandom);

  poly_frommsg(&r0, in);
  poly_frommsg_jazz(&r1, in);

  for(int i=0;i<MLKEM_N;i++)
  {
    if(r0.coeffs[i] != r1.coeffs[i])
      printf("error frombytes %d, %d, %d\n", i, r0.coeffs[i], r1.coeffs[i]);
  }

  return 0;
}
