#include <stdio.h>
#include "../ntt.h"
#include "../poly.h"
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
  polyvec r0, r1;

  polyvec_setrandom(&r0);
  
  for(int i = 0;i<MLKEM_K;i++)
    for(int j = 0;j<MLKEM_N;j++)
      r1.vec[i].coeffs[j] = r0.vec[i].coeffs[j];

  polyvec_invntt(&r0);
  polyvec_invntt_jazz(&r1);

  for(int i=0;i<MLKEM_K;i++)
    for(int j=0;j<MLKEM_N;j++)
      if((r0.vec[i].coeffs[j] - r1.vec[i].coeffs[j]) % MLKEM_Q)
        printf("error polyvec_invntt %d,%d: %d, %d\n", i, j, r0.vec[i].coeffs[j], r1.vec[i].coeffs[j]);

  return 0;
}
