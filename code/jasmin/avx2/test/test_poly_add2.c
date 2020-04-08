#include <stdio.h>
#include "../poly.h"

void poly_setrandom(poly *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  fread(r->coeffs, sizeof(int16_t), KYBER_N, urandom);
  for(int i=0;i<KYBER_N;i++)
    r->coeffs[i] %= KYBER_Q;
  fclose(urandom);
}

int main(void)
{
  poly a, b, r0;

  poly_setrandom(&a);
  poly_setrandom(&b);
  
  poly_add(&r0, &a, &b);
  
  poly_add2_jazz(&a, &b);

  for(int i=0;i<KYBER_N;i++)
    if(r0.coeffs[i] != a.coeffs[i])
      printf("error %d, %d, %d\n", i, r0.coeffs[i], a.coeffs[i]);

  return 0;
}
