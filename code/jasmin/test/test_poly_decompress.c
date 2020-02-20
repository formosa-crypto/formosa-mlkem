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
  unsigned char in[128];
  poly r0, r1;
 
  FILE *urandom = fopen("/dev/urandom", "r");
  fread(in, 1, 128, urandom);
  fclose(urandom);

  poly_decompress(&r0, in);
  poly_decompress_jazz(&r1, in);

  for(int i=0;i<156;i++)
  {
    if(r0.coeffs[i] != r1.coeffs[i])
      printf("error decompress %d, %d, %d\n", i, r0.coeffs[i], r1.coeffs[i]);
  }

  return 0;
}
