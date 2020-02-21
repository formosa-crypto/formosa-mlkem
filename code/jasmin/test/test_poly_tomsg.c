#include <stdio.h>
#include "../poly.h"
#include "../ntt.h"

void poly_setrandom(poly *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  fread(r->coeffs, sizeof(int16_t), KYBER_N, urandom);
  fclose(urandom);
  poly_reduce(r);
}

int main(void)
{
  unsigned char out0[32];
  unsigned char out1[32];
  poly a;
  
  poly_setrandom(&a);

  poly_tomsg(out0, &a);
  poly_tomsg(out1, &a);

  for(int i=0;i<32;i++)
  {
    if(out0[i] != out1[i])
      printf("error tomsg %d, %d, %d\n", i, out0[i], out1[i]);
  }

  return 0;
}
