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
  poly a, b, r0, r1;

  /*
  poly_setrandom(&a);
  poly_setrandom(&b);
  */
  for(int i = 0;i<KYBER_N;i++)
  {
    a.coeffs[i] = b.coeffs[i] = i;
  }

  poly_add(&r0, &a, &b);
  
  poly_add_jazz(&r1, &a, &b);

  for(int i=0;i<KYBER_N;i++)
    if(r0.coeffs[i] != r1.coeffs[i])
      printf("error %d, %d, %d\n", i, r0.coeffs[i], r1.coeffs[i]);

  return 0;
}
