#include <stdio.h>
#include "../poly.h"
#include "../ntt.h"

void poly_setrandom(poly *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  fread(r->coeffs, sizeof(int16_t), KYBER_N, urandom);
  fclose(urandom);
}

int main(void)
{
  poly r0, r1;

  poly_setrandom(&r0);

  for(int i=0;i<KYBER_N;i++)
    r1.coeffs[i] = r0.coeffs[i];
 
  poly_reduce(&r0);
  poly_reduce_jazz(&r1);

  for(int i=0;i<KYBER_N;i++)
  {
    if(r0.coeffs[i] != r1.coeffs[i])
      printf("error reduce %d, %d, %d\n", i, r0.coeffs[i], r1.coeffs[i]);
  }

  return 0;
}
