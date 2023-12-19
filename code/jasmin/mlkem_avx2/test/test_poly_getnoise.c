#include <stdio.h>
#include "../poly.h"
#include "../ntt.h"
#include "../params.h"


int main(void)
{
  poly r0[4], r1[4];
  unsigned char seed[MLKEM_SYMBYTES];

  FILE *urandom = fopen("/dev/urandom", "r");
  fread(seed, 1, MLKEM_SYMBYTES, urandom);
  fclose(urandom);

  poly_getnoise_eta1(r0, seed, 0);
  poly_getnoise_eta1(&r0[1], seed, 1);
  poly_getnoise_eta1(&r0[2], seed, 2);
  poly_getnoise_eta1(&r0[3], seed, 3);
  poly_getnoise_eta1_4x_jazz(r1, seed, 0);

  for(int i=0;i<4;i++)
  {
    for(int j=0;j<MLKEM_N;j++)
    {
      if(r0[i].coeffs[j] != r1[i].coeffs[j])
        printf("error getnoise %d, %d, %d\n", i*256+j, r0[i].coeffs[j], r1[i].coeffs[j]);
    }
  }

  poly_getnoise_eta1(r0, seed, 0);
  poly_getnoise_eta1(&r0[1], seed, 1);
  poly_getnoise_eta2(&r0[2], seed, 2);
  poly_getnoise_eta2(&r0[3], seed, 3);
  poly_getnoise_eta1122_4x_jazz(r1, seed, 0);

  for(int i=0;i<4;i++)
  {
    for(int j=0;j<MLKEM_N;j++)
    {
      if(r0[i].coeffs[j] != r1[i].coeffs[j])
        printf("error getnoise %d, %d, %d\n", i*256+j, r0[i].coeffs[j], r1[i].coeffs[j]);
    }
  }

  return 0;
}
