#include <stdio.h>
#include "../poly.h"
#include "../ntt.h"

int main(void)
{
  unsigned char in[KYBER_POLYBYTES];
  poly r0, r1;
 
  FILE *urandom = fopen("/dev/urandom", "r");
  fread(in, 1, KYBER_POLYBYTES, urandom);
  fclose(urandom);

  poly_frombytes(&r0, in);
  poly_frombytes_jazz(&r1, in);

  for(int i=0;i<KYBER_N;i++)
  {
    if(r0.coeffs[i] != r1.coeffs[i])
      printf("error frombytes %d, %d, %d\n", i, r0.coeffs[i], r1.coeffs[i]);
  }

  return 0;
}
