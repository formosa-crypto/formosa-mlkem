#include <stdio.h>
#include "../poly.h"
#include "../ntt.h"
#include "../params.h"


int main(void)
{
  poly r0, r1;
  unsigned char seed[KYBER_SYMBYTES];

  FILE *urandom = fopen("/dev/urandom", "r");
  fread(seed, 1, KYBER_SYMBYTES, urandom);
  fclose(urandom);

  for(int i = 0; i < 1; i++)
  {
    poly_getnoise(&r0, seed, i);
    poly_getnoise_jazz(&r1, seed, i);

    for(int j=0;j<KYBER_N;j++)
    {
      if(r0.coeffs[j] != r1.coeffs[j])
        printf("error getnoise %d, %d, %d\n", j, r0.coeffs[j], r1.coeffs[j]);
    }
  }

  return 0;
}
