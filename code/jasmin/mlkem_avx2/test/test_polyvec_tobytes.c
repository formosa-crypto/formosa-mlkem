#include <stdio.h>
#include "../polyvec.h"
#include "../ntt.h"
#include "../reduce.h"

void polyvec_setrandom(polyvec *r)
{
  FILE *urandom = fopen("/dev/urandom", "r");
  for(int i=0;i<KYBER_K;i++)
    fread(r->vec[i].coeffs, sizeof(int16_t), KYBER_N, urandom);

  polyvec_reduce(r);

  fclose(urandom);
}

int main(void)
{
  unsigned char out0[KYBER_POLYVECBYTES];
  unsigned char out1[KYBER_POLYVECBYTES];
  polyvec a;
  
  polyvec_setrandom(&a);

  polyvec_tobytes(out0, &a);
  polyvec_tobytes_jazz(out1, &a);

  for(int i=0;i<KYBER_POLYVECBYTES;i++)
  {
    if(out0[i] != out1[i])
      printf("error polyvec_tobytes %d, %d, %d\n", i, out0[i], out1[i]);
  }

  return 0;
}
