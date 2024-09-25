#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <assert.h>

#include "../params.h"
#include "../ntt.h"
#include "../indcpa.h"

#define NRUNS 100

static inline uint64_t cpucycles(void) {
  uint64_t result;

  asm volatile("rdtsc; shlq $32,%%rdx; orq %%rdx,%%rax"
    : "=a" (result) : : "%rdx");

  return result;
}

static int cmp_uint64(const void *a, const void *b) {
  if(*(uint64_t *)a < *(uint64_t *)b) return -1;
  if(*(uint64_t *)a > *(uint64_t *)b) return 1;
  return 0;
}

static uint64_t median(uint64_t *l, size_t llen) {
  qsort(l,llen,sizeof(uint64_t),cmp_uint64);

  if(llen%2) return l[llen/2];
  else return (l[llen/2-1]+l[llen/2])/2;
}

static uint64_t average(uint64_t *t, size_t tlen) {
  size_t i;
  uint64_t acc=0;

  for(i=0;i<tlen;i++)
    acc += t[i];

  return acc/tlen;
}

void print_results(const char *s, uint64_t *t, size_t tlen) {
  size_t i;

  tlen--;
  for(i=0;i<tlen;++i)
    t[i] = t[i+1] - t[i];

  printf("%s\n", s);
  printf("median: %llu cycles/ticks\n", (unsigned long long)median(t, tlen));
  printf("average: %llu cycles/ticks\n", (unsigned long long)average(t, tlen));
  printf("\n");
}

int main(void)
{
  unsigned char sk[MLKEM_INDCPA_SECRETKEYBYTES];
  unsigned char pk[MLKEM_INDCPA_PUBLICKEYBYTES];
  unsigned char ct[MLKEM_INDCPA_BYTES];
  unsigned char randomness0[MLKEM_SYMBYTES];
  unsigned char randomness1[MLKEM_SYMBYTES];
  unsigned char message[MLKEM_INDCPA_MSGBYTES];
  unsigned char outmsg[MLKEM_POLYVECBYTES];

  uint64_t t[NRUNS], i;
  size_t ri;

  FILE *urandom = fopen("/dev/urandom", "r");
  ri = fread(randomness0, MLKEM_SYMBYTES, 1, urandom);
  assert( ri == 1 );
  ri = fread(randomness1, MLKEM_SYMBYTES, 1, urandom);
  assert( ri == 1 );
  ri = fread(message, MLKEM_SYMBYTES, 1, urandom);
  assert( ri == 1 );
  fclose(urandom);

  /* TEST KEYPAIR */
  for(i=0;i<NRUNS;i++)
  {
    t[i] = cpucycles();
    indcpa_keypair_jazz(pk, sk, randomness0);
  }
  print_results("keypair: ", t, NRUNS);

  /* TEST ENCRYPTION */
  for(i=0;i<NRUNS;i++)
  {
    t[i] = cpucycles();
    indcpa_enc_jazz(ct, message, pk, randomness1);
  }
  print_results("encaps: ", t, NRUNS);

  /* TEST DECRYPTION */
  for(i=0;i<NRUNS;i++)
  {
    t[i] = cpucycles();
    indcpa_dec_jazz(outmsg, ct, sk);
  }
  print_results("decaps: ", t, NRUNS);

  return 0;
}
