#include <stdio.h>
#include "../poly.h"
#include "../ntt.h"

void poly_setrandom(poly *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  fread(r->coeffs, sizeof(int16_t), KYBER_N, urandom);
  for(int i=0;i<KYBER_N;i++)
  {
    r->coeffs[i] %= KYBER_Q;
  }
  fclose(urandom);
}

int main(void)
{
  poly r0, r1;

  poly_setrandom(&r0);


  for(int i=0;i<KYBER_N;i++)
    r1.coeffs[i] = r0.coeffs[i];
 
  /*
  for(int i=0;i<KYBER_N;i++)
    r1.coeffs[i] = r0.coeffs[i] = i;
    
  r1.coeffs[0] = r0.coeffs[0] = 0;
  r1.coeffs[1] = r0.coeffs[1] = 1;
  r1.coeffs[2] = r0.coeffs[2] = 2;
  r1.coeffs[3] = r0.coeffs[3] = 3;
  r1.coeffs[4] = r0.coeffs[4] = 4;
  r1.coeffs[5] = r0.coeffs[5] = 5;
  r1.coeffs[6] = r0.coeffs[6] = 6;
  r1.coeffs[7] = r0.coeffs[7] = 7;
  r1.coeffs[8] = r0.coeffs[8] = 8;
  */



  poly_ntt(&r0);
  poly_ntt_jazz(&r1, zetas);

  for(int i=0;i<KYBER_N;i++)
  {
    if(r0.coeffs[i] != r1.coeffs[i])
      printf("error %d, %d, %d\n", i, r0.coeffs[i], r1.coeffs[i]);
    /*
    else
      printf("success %d, %d, %d\n", i, r0.coeffs[i], r1.coeffs[i]);
      */
  }

  return 0;
}
