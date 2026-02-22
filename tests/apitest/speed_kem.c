/* ------------------------------------------------------------------------ */
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>

/* ------------------------------------------------------------------------ */
#include "kyber/ref/params.h"
#include "kyber/ref/kem.h"
#include "runtime.h"

/* ------------------------------------------------------------------------ */
#include "api.h"

#define CAT_(a,b) a##b
#define CAT(a,b)  CAT_(a,b)

#define MLKEM_SYM_(prefix, suffix) CAT(prefix, suffix)
#define MLKEM_SYM(suffix)          MLKEM_SYM_(MLKEM_NAMESPACE, suffix)

#define jade_kem_mlkem_keypair_derand MLKEM_SYM(_keypair_derand)
#define jade_kem_mlkem_enc_derand     MLKEM_SYM(_enc_derand)
#define jade_kem_mlkem_dec            MLKEM_SYM(_dec)

/* ------------------------------------------------------------------------ */
#define NRUNS 100

/* ------------------------------------------------------------------------ */
static inline uint64_t cpucycles(void) {
  uint64_t result;

  asm volatile("rdtsc; shlq $32,%%rdx; orq %%rdx,%%rax"
    : "=a" (result) : : "%rdx");

  return result;
}

/* ------------------------------------------------------------------------ */
static int cmp_uint64(const void *a, const void *b) {
  if(*(uint64_t *)a < *(uint64_t *)b) return -1;
  if(*(uint64_t *)a > *(uint64_t *)b) return 1;
  return 0;
}

/* ------------------------------------------------------------------------ */
static uint64_t median(uint64_t *l, size_t llen) {
  qsort(l,llen,sizeof(uint64_t),cmp_uint64);

  if(llen%2) return l[llen/2];
  else return (l[llen/2-1]+l[llen/2])/2;
}

/* ------------------------------------------------------------------------ */
static uint64_t average(uint64_t *t, size_t tlen) {
  size_t i;
  uint64_t acc=0;

  for(i=0;i<tlen;i++)
    acc += t[i];

  return acc/tlen;
}

/* ------------------------------------------------------------------------ */
static void print_results(const char *s, uint64_t *t, size_t tlen) {
  size_t i;

  tlen--;
  for(i=0;i<tlen;++i)
    t[i] = t[i+1] - t[i];

  printf("%s\n", s);
  printf("median: %llu cycles/ticks\n", (unsigned long long)median(t, tlen));
  printf("average: %llu cycles/ticks\n", (unsigned long long)average(t, tlen));
  printf("\n");
}

/* ------------------------------------------------------------------------ */
int main(void) {
  uint8_t sk[KYBER_SECRETKEYBYTES];
  uint8_t pk[KYBER_PUBLICKEYBYTES];
  uint8_t ct[KYBER_CIPHERTEXTBYTES];
  uint8_t randomness0[2*KYBER_SYMBYTES];
  uint8_t randomness1[2*KYBER_SYMBYTES];
  uint8_t shk[KYBER_SSBYTES];

  uint64_t t[NRUNS], i;

  FILE *urandom = fopen("/dev/urandom", "r");
  fread(randomness0, 2*KYBER_SYMBYTES, 1, urandom);
  fread(randomness1, 2*KYBER_SYMBYTES, 1, urandom);
  fclose(urandom);

  /* TEST KEYPAIR */
  for(i=0;i<NRUNS;i++)
  {
    t[i] = cpucycles();
    jade_kem_mlkem_keypair_derand(pk, sk, randomness0);
  }
  print_results("keypair: ", t, NRUNS);

  /* TEST ENCRYPTION */
  for(i=0;i<NRUNS;i++)
  {
    t[i] = cpucycles();
    jade_kem_mlkem_enc_derand(ct, shk, pk, randomness1);
  }
  print_results("encaps: ", t, NRUNS);

  /* TEST DECRYPTION */
  for(i=0;i<NRUNS;i++)
  {
    t[i] = cpucycles();
    jade_kem_mlkem_dec(shk, ct, sk);
  }
  print_results("decaps: ", t, NRUNS);

  return 0;
}
