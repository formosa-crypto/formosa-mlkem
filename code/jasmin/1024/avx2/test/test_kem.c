#include <stdio.h>
#include <string.h>

#include "../../../../kyber/ref/params.h"
#include "../../../../kyber/ref/kem.h"

int main(void) {
  unsigned char input[KYBER_INDCPA_SECRETKEYBYTES];
  uint16_t output[KYBER_N*KYBER_K];
  size_t i;
  for(i = 0; i < KYBER_INDCPA_SECRETKEYBYTES;i++)
    input[i]=0xff;
  __i_polyvec_frombytes_test(output,input);
  printf("%x\n",output[0]);
  printf("%x\n",output[1]);
  return 0;

}
