#include <stdio.h>
#include "../poly.h"
#include "../ntt.h"

void poly_setrandom(poly *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  fread(r->coeffs, sizeof(int16_t), MLKEM_N, urandom);
  fclose(urandom);
  poly_reduce(r);
}

int main(void)
{
  unsigned char out0[MLKEM_POLYBYTES];
  unsigned char out1[MLKEM_POLYBYTES];
  poly a;
  
  poly_setrandom(&a);

  poly_tobytes(out0, &a);
  poly_tobytes_jazz(out1, &a);

  for(int i=0;i<MLKEM_POLYBYTES;i++)
  {
    if(out0[i] != out1[i])
      printf("error poly_tobytes %d, %d, %d\n", i, out0[i], out1[i]);
  }

  return 0;
}
