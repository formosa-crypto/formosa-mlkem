#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <assert.h>

#include "../params.h"
#include "../speed.h"

#define NRUNS 10000

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

uint64_t cpucycles_overhead(void) {
  uint64_t t0, t1, overhead = -1LL;
  unsigned int i;

  for(i=0;i<100000;i++) {
    t0 = cpucycles();
    __asm__ volatile ("");
    t1 = cpucycles();
    if(t1 - t0 < overhead)
      overhead = t1 - t0;
  }

  return overhead;
}

void print_results(const char *s, uint64_t *t, size_t tlen) {
  size_t i;
  static uint64_t overhead = -1;

  if(overhead == (uint64_t)-1)
    overhead = cpucycles_overhead();

  tlen--;
  for(i=0;i<tlen;++i)
    t[i] = t[i+1] - t[i] - overhead;

  printf("%s\n", s);
  printf("median: %llu cycles/ticks\n", (unsigned long long)median(t, tlen));
  printf("average: %llu cycles/ticks\n", (unsigned long long)average(t, tlen));
  printf("\n");
}

void print_results_jasmin(const char *s, uint64_t *t, size_t tlen) {
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
  
  polyvec a[MLKEM_K];
  uint8_t seed[MLKEM_SYMBYTES] = {0};
  poly ap;

  uint64_t t[NRUNS], i;
  size_t ri;

  FILE *urandom = fopen("/dev/urandom", "r");

  ri = fread(randomness0, MLKEM_SYMBYTES, 1, urandom);
  assert(ri == 1);

  ri = fread(randomness1, MLKEM_SYMBYTES, 1, urandom);
  assert(ri == 1);

  ri = fread(message, MLKEM_SYMBYTES, 1, urandom);
  assert(ri == 1);

  ri = fread(seed, MLKEM_SYMBYTES, 1, urandom);
  assert(ri == 1);

  fclose(urandom);

  // test gen_matrix
  for(i=0;i<NRUNS;i++)
  {
    t[i] = gen_matrix_jazz(a, seed);
  }
  print_results_jasmin("gen_matrix: ", t, NRUNS);


  // poly ///////////////////////////////////////////////////////////
  // test get_noise
  for(i=0;i<NRUNS;i++)
  {
    t[i] = poly_getnoise_jazz(&ap, seed, 0);
  }
  print_results_jasmin("poly_getnoise: ", t, NRUNS);

  // test NTT
  for(i=0; i<NRUNS;i++)
  {
    t[i] = poly_ntt_jazz(&ap);
  }
  print_results_jasmin("poly_ntt: ", t, NRUNS);

  // test INVNTT
  for(i=0; i<NRUNS;i++)
  {
    t[i] = poly_invntt_jazz(&ap);
  }
  print_results_jasmin("poly_invntt: ", t, NRUNS);

  // test poly_tomsg
  for(i=0; i<NRUNS; i++)
  {
    t[i] = poly_tomsg_jazz(ct, &ap);
  }
  print_results_jasmin("poly_tomsg: ", t, NRUNS);

  /// test poly_fromsg
  for(i=0; i<NRUNS; i++)
  {
    t[i] = poly_frommsg_jazz(&ap, ct);
  }
  print_results_jasmin("poly_frommsg: ", t, NRUNS);

  // test poly_compress_jazz
  for(i=0; i<NRUNS; i++)
  {
    t[i] = poly_compress_jazz(ct, &ap);
  }
  print_results_jasmin("poly_compress: ", t, NRUNS);

  // test poly_decompress_jazz
  for(i=0; i<NRUNS; i++)
  {
    t[i] = poly_decompress_jazz(&ap, ct);
  }
  print_results_jasmin("poly_decompress: ", t, NRUNS);


  // polyvec ////////////////////////////////////////////////////////
  // test polyvec_pointwise_acc
  for(i=0; i<NRUNS; i++)
  {
    t[i] = polyvec_pointwise_acc_jazz(&ap, &a[0], &a[1]);
  }
  print_results_jasmin("polyvec_pointwise_acc: ", t, NRUNS);

  // test polyvec_compress_jazz
  for(i=0; i<NRUNS; i++)
  {
    t[i] = polyvec_compress_jazz(ct, &a[0]);
  }
  print_results_jasmin("polyvec_compress: ", t, NRUNS);

  // test polyvec_decompress_jazz
  for(i=0; i<NRUNS; i++)
  {
    t[i] = polyvec_decompress_jazz(&a[0], ct);
  }
  print_results_jasmin("polyvec_decompress: ", t, NRUNS);


  // kem ////////////////////////////////////////////////////////////

  // test KEM KEYPAIR
  for(i=0;i<NRUNS;i++)
  {
    t[i] = cpucycles();
    crypto_kem_keypair_jazz(pk, sk, randomness0);
  }
  print_results("mlkem_keypair: ", t, NRUNS);

  // test KEM ENCAPSULATION
  for(i=0;i<NRUNS;i++)
  {
    t[i] = cpucycles();
    crypto_kem_enc_jazz(ct, message, pk, randomness1);
  }
  print_results("mlkem_encaps: ", t, NRUNS);

  // test KEM DECAPSULATION
  for(i=0;i<NRUNS;i++)
  {
    t[i] = cpucycles();
    crypto_kem_dec_jazz(outmsg, ct, sk);
  }
  print_results("mlkem_decaps: ", t, NRUNS);

  return 0;
}
