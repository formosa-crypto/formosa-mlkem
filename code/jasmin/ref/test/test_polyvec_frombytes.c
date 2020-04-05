#include <stdio.h>
#include "../polyvec.h"

int main(void)
{
  unsigned char in[KYBER_POLYVECBYTES];
  polyvec r0, r1;
 
  FILE *urandom = fopen("/dev/urandom", "r");
  fread(in, 1, KYBER_POLYVECBYTES, urandom);
  fclose(urandom);

  polyvec_frombytes(&r0, in);
  polyvec_frombytes_jazz(&r1, in);

  for(int i=0;i<KYBER_K;i++)
    for(int j=0;j<KYBER_N;j++)
      if(r0.vec[i].coeffs[j] != r1.vec[i].coeffs[j])
        printf("error polyvec_frombytes %d,%d: %d, %d\n", i, j, r0.vec[i].coeffs[j], r1.vec[i].coeffs[j]);

  return 0;
}
