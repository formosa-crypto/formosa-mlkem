#include <stdio.h>
#include "../poly.h"
#include "../polyvec.h"

void polyvec_setrandom(polyvec *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  for(int i=0;i<KYBER_K;i++)
    fread(r->vec[i].coeffs, sizeof(int16_t), KYBER_N, urandom);
  fclose(urandom);
}

int main(void)
{
  polyvec r0, r1;

  polyvec_setrandom(&r0);
  
  for(int i = 0;i<KYBER_K;i++)
    for(int j = 0;j<KYBER_N;j++)
      r1.vec[i].coeffs[j] = r0.vec[i].coeffs[j];

  polyvec_reduce(&r0);
  polyvec_reduce_jazz(&r1);

  for(int i=0;i<KYBER_K;i++)
    for(int j=0;j<KYBER_N;j++)
      if(r0.vec[i].coeffs[j] != r1.vec[i].coeffs[j])
        printf("error polyvec_reduce %d,%d: %d, %d\n", i, j, r0.vec[i].coeffs[j], r1.vec[i].coeffs[j]);

  return 0;
}
