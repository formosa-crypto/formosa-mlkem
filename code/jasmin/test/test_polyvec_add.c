#include <stdio.h>
#include "../polyvec.h"

void polyvec_setrandom(polyvec *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  for(int i=0;i<KYBER_K;i++)
    fread(r->vec[i].coeffs, sizeof(int16_t), KYBER_N, urandom);
  for(int i=0;i<KYBER_K;i++)
    for(int j=0;j<KYBER_N;j++)
      r->vec[i].coeffs[j] %= KYBER_Q;
  fclose(urandom);
}

int main(void)
{
  polyvec a, b, r0, r1;

  polyvec_setrandom(&a);
  polyvec_setrandom(&b);
  
  for(int i = 0;i<KYBER_K;i++)
    for(int j = 0;j<KYBER_N;j++)
      a.vec[i].coeffs[j] = b.vec[i].coeffs[j];

  polyvec_add(&r0, &a, &b);
  polyvec_add_jazz(&r1, &a, &b);

  for(int i=0;i<KYBER_K;i++)
    for(int j=0;j<KYBER_N;j++)
      if(r0.vec[i].coeffs[j] != r1.vec[i].coeffs[j])
        printf("error %d,%d: %d, %d\n", i, j, r0.vec[i].coeffs[j], r1.vec[i].coeffs[j]);

  return 0;
}
