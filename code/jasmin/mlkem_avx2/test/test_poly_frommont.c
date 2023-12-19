#include <stdio.h>
#include "../poly.h"
#include "../ntt.h"

void poly_setrandom(poly *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  fread(r->coeffs, sizeof(int16_t), MLKEM_N, urandom);
  for(int i=0;i<MLKEM_N;i++)
  {
    r->coeffs[i] %= MLKEM_Q;
  }
  fclose(urandom);
}

int main(void)
{
  poly r0, r1;

  poly_setrandom(&r0);


  for(int i=0;i<MLKEM_N;i++)
    r1.coeffs[i] = r0.coeffs[i];
 
  poly_frommont(&r0);
  poly_frommont_jazz(&r1);

  for(int i=0;i<MLKEM_N;i++)
  {
    if(r0.coeffs[i] != r1.coeffs[i])
      printf("error %d, %d, %d\n", i, r0.coeffs[i], r1.coeffs[i]);
  }

  return 0;
}
