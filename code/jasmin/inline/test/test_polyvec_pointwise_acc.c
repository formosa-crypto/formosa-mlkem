#include <stdio.h>
#include "../ntt.h"
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
  polyvec a, b;
  poly r0, r1;

  polyvec_setrandom(&a);
  polyvec_setrandom(&b);
  
  polyvec_pointwise_acc(&r0, &a, &b);
  polyvec_pointwise_acc_jazz(&r1, &a, &b);

    for(int j=0;j<KYBER_N;j++)
      if(r0.coeffs[j] != r1.coeffs[j])
        printf("error polyvec_pointwise_acc %d: %d, %d\n", j, r0.coeffs[j], r1.coeffs[j]);

  return 0;
}
