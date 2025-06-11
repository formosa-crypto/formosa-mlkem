#include <stdio.h>
#include <string.h>

#include "../../../../kyber/ref/params.h"
#include "../../../../kyber/ref/indcpa.h"

int main(void)
{
  unsigned char matrix0[sizeof(poly)*KYBER_K*KYBER_K];
  unsigned char matrix1[sizeof(poly)*KYBER_K*KYBER_K];
  unsigned char rho[KYBER_SYMBYTES];

  FILE *urandom = fopen("/dev/urandom", "r");
  fread(matrix0, sizeof(poly)*KYBER_K*KYBER_K, 1, urandom);
  fread(matrix1, sizeof(poly)*KYBER_K*KYBER_K, 1, urandom);
  fread(rho, KYBER_SYMBYTES, 1, urandom);
  fclose(urandom);

  /* TEST GENMATRIX */
  jade_kem_mlkem_mlkem1024_amd64_avx2_gen_matrix(matrix0,rho,0);
  gen_matrix((polyvec*)matrix1,rho,0);
  
  for(unsigned int i=0;i<sizeof(poly)*KYBER_K*KYBER_K;i++)
     if(matrix0[i] != matrix1[i]) printf("error gen_matrix: %d\n", i);
  

  /* TEST GENMATRIX TRANSPOSED */
  jade_kem_mlkem_mlkem1024_amd64_avx2_gen_matrix(matrix0,rho,1);
  gen_matrix((polyvec*)matrix1,rho,1);

  for(unsigned int i=0;i<sizeof(poly)*KYBER_K*KYBER_K;i++)
    if(matrix0[i] != matrix1[i]) printf("error gen_matrix: %d\n", i);

  return 0;
}
