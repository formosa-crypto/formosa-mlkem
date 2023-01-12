#include <stdio.h>
#include <stdint.h>

#include "../params.h"

extern void gen_matrix_old_jazz(int16_t *r, unsigned char *seed);
extern void gen_matrix_jazz(int16_t *r, unsigned char *seed);

int main(void)
{
  unsigned char seed[32];
  int16_t aa0[KYBER_N*KYBER_K*KYBER_K];
  int16_t aa1[KYBER_N*KYBER_K*KYBER_K];
  int i;

  FILE *urandom = fopen("/dev/urandom", "r");
  fread(seed, 1, 32, urandom);

  gen_matrix_old_jazz(aa0, seed);
  gen_matrix_jazz(aa1, seed);

  for(i=0;i<KYBER_N*KYBER_K*KYBER_K;i++)
    if(aa0[i] != aa1[i])
      printf("error gen_matrix %d: %d %d\n", i, aa0[i], aa1[i]);

  fclose(urandom);

  return 0;
}
