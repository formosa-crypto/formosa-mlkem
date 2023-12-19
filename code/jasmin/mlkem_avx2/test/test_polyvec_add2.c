#include <stdio.h>
#include "../polyvec.h"

void polyvec_setrandom(polyvec *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  for(int i=0;i<MLKEM_K;i++)
    fread(r->vec[i].coeffs, sizeof(int16_t), MLKEM_N, urandom);
  for(int i=0;i<MLKEM_K;i++)
    for(int j=0;j<MLKEM_N;j++)
      r->vec[i].coeffs[j] %= MLKEM_Q;
  fclose(urandom);
}

int main(void)
{
  polyvec a, b, r0;

  polyvec_setrandom(&a);
  polyvec_setrandom(&b);
  
  polyvec_add(&r0, &a, &b);
  polyvec_add2_jazz(&a, &b);

  for(int i=0;i<MLKEM_K;i++)
    for(int j=0;j<MLKEM_N;j++)
      if(r0.vec[i].coeffs[j] != a.vec[i].coeffs[j])
        printf("error polyvec_add %d,%d: %d, %d\n", i, j, r0.vec[i].coeffs[j], a.vec[i].coeffs[j]);

  return 0;
}
