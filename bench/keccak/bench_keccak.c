#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


//-------------------------------------------------------------------
#ifndef TIMINGS
#define TIMINGS 10000
#endif

#include "config.h"
#include "cpucycles.c"
#include "increment.c"
#include "printbench.c"
#include "alignedcalloc.c"
#include "benchrandombytes.c"
#include "notrandombytes.c"


//-------------------------------------------------------------------

extern void st25_to_stavx2(uint8_t stavx2[224], uint8_t st25[200]);
extern void keccakf1600_st25_avx2(uint8_t st[200]);
extern void keccakf1600_avx2(uint8_t st[224]);
extern void keccakf1600_avx2x4(uint8_t st[800]);

extern void sha3_512A_A33_new(uint8_t out[64], uint8_t in[33]);
extern void sha3_512A_A64_new(uint8_t out[64], uint8_t in[64]);
extern void shake256_A128__A32_A1_new(uint8_t out[128], uint8_t seed[32], uint8_t nonce[1]);
extern void shake256x4_A128__A32_A1_new(uint8_t out0[128], uint8_t out1[128], uint8_t out2[128], uint8_t out3[128], uint8_t seed[32], uint8_t nonces[4]);
extern void shake128_absorb_A32_A2_new(uint8_t st[224], uint8_t seed[32], uint8_t pos[2]);
extern void shake128x4_absorb_A32_A2_new(uint8_t st[800], uint8_t seed[32], uint8_t pos[8]);
extern void shake128_squeeze3blocks_new(uint8_t buf[536], uint8_t st[224]);
extern void shake128_next_state_new(uint8_t buf[536]);
extern void shake128x4_squeeze3blocks_new(uint8_t st[800], uint8_t buf[4*536]);
extern void sha3_256A_A1184_new(uint8_t out[32], uint8_t in[1184]);
extern void sha3_256A_A1568_new(uint8_t out[32], uint8_t in[1568]);
extern void shake256_A32__A1120_new(uint8_t out[32], uint8_t in[1120]);
extern void shake256_A32__A1600_new(uint8_t out[32], uint8_t in[1600]);

extern void sha3_512A_A33_old(uint8_t out[64], uint8_t in[33]);
extern void sha3_512A_A64_old(uint8_t out[64], uint8_t in[64]);
extern void shake256_A128__A32_A1_old(uint8_t out[128], uint8_t seed[32], uint8_t nonce[1]);
extern void shake256x4_A128__A32_A1_old(uint8_t out0[128], uint8_t out1[128], uint8_t out2[128], uint8_t out3[128], uint8_t seed[32], uint8_t nonces[4]);
extern void shake128_absorb_A32_A2_old(uint8_t st[224], uint8_t seed[32], uint8_t pos[2]);
extern void shake128x4_absorb_A32_A2_old(uint8_t st[800], uint8_t seed[32], uint8_t pos[8]);
extern void shake128_squeeze3blocks_old(uint8_t buf[536], uint8_t st[224]);
extern void shake128_next_state_old(uint8_t buf[536]);
extern void shake128x4_squeeze3blocks_old(uint8_t st[800], uint8_t buf[4*536]);
extern void sha3_256A_A1184_old(uint8_t out[32], uint8_t in[1184]);
extern void sha3_256A_A1568_old(uint8_t out[32], uint8_t in[1568]);
extern void shake256_A32__A1120_old(uint8_t out[32], uint8_t in[1120]);
extern void shake256_A32__A1600_old(uint8_t out[32], uint8_t in[1600]);

extern void genmatrix(uint16_t matrix[4096], uint8_t rho[32], uint64_t transposed);

extern void jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand(uint8_t pk[1568], uint8_t sk[3168], uint8_t rand[64]);
extern void jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand(uint8_t ct[1568], uint8_t shk[32], uint8_t pk[1568], uint8_t rand[64]);
extern void jade_kem_mlkem_mlkem1024_amd64_avx2_dec(uint8_t shk[32], uint8_t ct[1568], uint8_t sk[3168]);


// TESTING CODE
void print_buf(char* str, uint8_t a[], size_t len) {
  size_t i;
  if (str!=NULL) printf("%s = ", str);
  for (i=0; i<len; i++)
    printf("%02X", a[i]);
  printf("\n");
}

int chkeq_buf(char *str, uint8_t a1[], uint8_t a2[], size_t len) {
  #define DEBUG 0
  bool r;
  int i;

  r = true;
  for (i=0; r && i<(int)len; i++)
    r = r && (a1[i]==a2[i]);
  if (r) i = -1; else i -= 1;

  #if DEBUG
  if (str!=NULL) printf("TESTING %s:\n", str);
  #endif
  if (i < 0) {
  #if DEBUG
    printf("  Ok!\n");
  #endif
  } else {
    printf("  Error at pos=%d (len=%lu)\n", i, len);
    print_buf("L", a1, len);
    print_buf("R", a2, len);
  }
  #if DEBUG
  printf("\n");
  #endif

  return r?0:1;
  #undef DEBUG
}

void fill_buf(uint8_t a[], size_t len) {
  size_t i;
  uint8_t x=1;
  for (i=0; i<len; i++) a[i] = x++;
}

#define __bench(expr, exprs) \
  { \
    uint64_t __cycles[TIMINGS]; \
    for (int __i = 0; __i < TIMINGS; __i++) \
    { __cycles[__i] = cpucycles(); \
      expr; \
    } \
    printf("%s,%" PRIu64 "\n", exprs, cpucycles_median(__cycles, TIMINGS)); \
  }



int test_keccakf1600_avx2() {
  bool r;
  uint8_t st1[200];
  _Alignas(32) uint8_t out1[224];
  _Alignas(32) uint8_t out2[224];


  fill_buf(st1, sizeof(st1));
  st25_to_stavx2(out2, st1);

  __bench(keccakf1600_st25_avx2(st1), "keccakf1600_st25_avx2")
  __bench(keccakf1600_avx2(out2), "keccakf1600_avx2")

  st25_to_stavx2(out1, st1);
  r = chkeq_buf("keccakf1600_avx2", out1, out2, sizeof(out1));

  return r;
}

int test_sha3_512A_A33() {
  bool r;
  uint8_t out1[64];
  uint8_t out2[64];
  uint8_t in[33];

  fill_buf(in, sizeof(in));

  __bench(sha3_512A_A33_new(out1, in), "sha3_512A_A33_new")
  __bench(sha3_512A_A33_old(out2, in), "sha3_512A_A33_old")

  r = chkeq_buf("sha3_512A_A33", out1, out2, sizeof(out1));

  return r;
}

int test_sha3_512A_A64() {
  bool r;
  uint8_t out1[64];
  uint8_t out2[64];
  uint8_t in[64];

  fill_buf(in, sizeof(in));

  __bench(sha3_512A_A64_new(out1, in), "sha3_512A_A64_new")
  __bench(sha3_512A_A64_old(out2, in), "sha3_512A_A64_old")

  r = chkeq_buf("sha3_512A_A64", out1, out2, sizeof(out1));

  return r;
}

int test_shake256_A128__A32_A1() {
  bool r;
  uint8_t out1[128];
  uint8_t out2[128];
  uint8_t in1[32];
  uint8_t in2[1];


  fill_buf(in1, sizeof(in1));
  fill_buf(in2, sizeof(in2));

  __bench(shake256_A128__A32_A1_new(out1, in1, in2), "shake256_A128__A32_A1_new")
  __bench(shake256_A128__A32_A1_old(out2, in1, in2), "shake256_A128__A32_A1_old")

  r = chkeq_buf("shake256_A128__A32_A1", out1, out2, sizeof(out1));

  return r;
}

int test_shake256x4_A128__A32_A1() {
  bool r;
  uint8_t out10[128];
  uint8_t out11[128];
  uint8_t out12[128];
  uint8_t out13[128];
  uint8_t out20[128];
  uint8_t out21[128];
  uint8_t out22[128];
  uint8_t out23[128];
  uint8_t in1[32];
  uint8_t in2[4];

  fill_buf(in1, sizeof(in1));
  fill_buf(in2, sizeof(in2));

  __bench(shake256x4_A128__A32_A1_new(out10, out11, out12, out13, in1, in2), "shake256x4_A128__A32_A1_new")
  __bench(shake256x4_A128__A32_A1_old(out20, out21, out22, out23, in1, in2), "shake256x4_A128__A32_A1_old")

  r = chkeq_buf("shake256x4_A128__A32_A1(0)", out10, out20, sizeof(out10));
  r = r || chkeq_buf("shake256x4_A128__A32_A1(1)", out11, out21, sizeof(out11));
  r = r || chkeq_buf("shake256x4_A128__A32_A1(2)", out12, out22, sizeof(out12));
  r = r || chkeq_buf("shake256x4_A128__A32_A1(3)", out13, out23, sizeof(out13));

  return r;
}

int test_shake128_absorb_A32_A2() {
  bool r;
  _Alignas(32) uint8_t out1[224];
  _Alignas(32) uint8_t out2[224];
  uint8_t in1[32];
  uint8_t in2[2];

  fill_buf(in1, sizeof(in1));
  fill_buf(in2, sizeof(in2));

  __bench(shake128_absorb_A32_A2_new(out1, in1, in2), "shake128_absorb_A32_A2_new")
  __bench(shake128_absorb_A32_A2_old(out2, in1, in2), "shake128_absorb_A32_A2_old")

  r = chkeq_buf("shake128_absorb_A32_A2", out1, out2, sizeof(out1));

  return r;
}

int test_shake128_squeeze3blocks() {
  bool r;
  uint8_t out1[536];
  uint8_t out2[536];
  _Alignas(32) uint8_t in[224];

  fill_buf(in, sizeof(in));

  __bench(shake128_squeeze3blocks_new(out1, in), "shake128_squeeze3blocks_new")
  __bench(shake128_squeeze3blocks_old(out2, in), "shake128_squeeze3blocks_old")

  r = chkeq_buf("shake128_squeeze3blocks", out1, out2, sizeof(out1));

  return r;
}

int test_shake128_next_state() {
  bool r;
  uint8_t out1[536];
  uint8_t out2[536];

  fill_buf(out1, sizeof(out1));
  fill_buf(out2, sizeof(out2));

  __bench(shake128_next_state_new(out1), "shake128_next_state_new")
  __bench(shake128_next_state_old(out2), "shake128_next_state_old")

  r = chkeq_buf("shake128_next_state", out1, out2, sizeof(out1));

  return r;
}

int test_shake128x4_squeeze3blocks() {
  bool r;
  uint8_t out1[4*536];
  uint8_t out2[4*536];
  _Alignas(32) uint8_t in1[800];
  _Alignas(32) uint8_t in2[800];

  fill_buf(in1, sizeof(in1));
  fill_buf(in2, sizeof(in2));

  __bench(shake128x4_squeeze3blocks_new(in1, out1), "shake128x4_squeeze3blocks_new")
  __bench(shake128x4_squeeze3blocks_old(in2, out2), "shake128x4_squeeze3blocks_old")

  r = chkeq_buf("shake128x4_squeeze3blocks(buf)", out1, out2, sizeof(out1));
  r = r || chkeq_buf("shake128x4_squeeze3blocks(st)", in1, in2, sizeof(in1));

  return r;
}

int test_sha3_256A_A1184() {
  bool r;
  uint8_t out1[32];
  uint8_t out2[32];
  uint8_t in[1184];

  fill_buf(in, sizeof(in));

  __bench(sha3_256A_A1184_new(out1, in), "sha3_256A_A1184_new")
  __bench(sha3_256A_A1184_old(out2, in), "sha3_256A_A1184_old")

  r = chkeq_buf("sha3_256A_A1184", out1, out2, sizeof(out1));

  return r;
}

int test_sha3_256A_A1568() {
  bool r;
  uint8_t out1[32];
  uint8_t out2[32];
  uint8_t in[1568];

  fill_buf(in, sizeof(in));

  __bench(sha3_256A_A1568_new(out1, in), "sha3_256A_A1568_new")
  __bench(sha3_256A_A1568_old(out2, in), "sha3_256A_A1568_old")

  r = chkeq_buf("sha3_256A_A1568", out1, out2, sizeof(out1));

  return r;
}

int test_shake256_A32__A1120() {
  bool r;
  uint8_t out1[32];
  uint8_t out2[32];
  uint8_t in[1120];

  fill_buf(in, sizeof(in));

  __bench(shake256_A32__A1120_new(out1, in), "shake256_A32__A1120_new")
  __bench(shake256_A32__A1120_old(out2, in), "shake256_A32__A1120_old")

  r = chkeq_buf("shake256_A32__A1120", out1, out2, sizeof(out1));

  return r;
}

int test_shake256_A32__A1600() {
  bool r;
  uint8_t out1[32];
  uint8_t out2[32];
  uint8_t in[1600];

  fill_buf(in, sizeof(in));

  __bench(shake256_A32__A1600_new(out1, in), "shake256_A32__A1600_new")
  __bench(shake256_A32__A1600_old(out2, in), "shake256_A32__A1600_old")

  r = chkeq_buf("shake256_A32__A1600", out1, out2, sizeof(out1));

  return r;
}


int test_genmatrix() {
  uint16_t mat[4096];
  uint8_t in[32];
  uint64_t transp = 0;
  fill_buf(in, sizeof(in));

  __bench(genmatrix(mat, in, transp), "genmatrix")

  return 0;
}

int test_mlkem() {
  bool r;
  uint8_t pk[1568];
  uint8_t sk[3168];
  uint8_t in[64];
  uint8_t ct[1568];
  uint8_t shk1[32];
  uint8_t shk2[32];

  fill_buf(in, sizeof(in));

  __bench(jade_kem_mlkem_mlkem1024_amd64_avx2_keypair_derand(pk, sk, in), "keypair")
  __bench(jade_kem_mlkem_mlkem1024_amd64_avx2_enc_derand(ct, shk1, pk, in), "enc");
  __bench(jade_kem_mlkem_mlkem1024_amd64_avx2_dec(shk2, ct, sk), "dec");

  r = chkeq_buf("mlkem encap/decap", shk1, shk2, sizeof(shk1));

  return r;
}



int main() {
  int r=0;

  r = r || test_keccakf1600_avx2();
  r = r || test_sha3_512A_A33();
  r = r || test_sha3_512A_A64();
  r = r || test_shake256_A128__A32_A1();
  r = r || test_shake256x4_A128__A32_A1();
  r = r || test_shake128_absorb_A32_A2();
  r = r || test_shake128_squeeze3blocks();
  r = r || test_shake128_next_state();
  r = r || test_shake128x4_squeeze3blocks();
  r = r || test_sha3_256A_A1184();
  r = r || test_sha3_256A_A1568();
  r = r || test_shake256_A32__A1120();
  r = r || test_shake256_A32__A1600();
  r = r || test_genmatrix();
  r = r || test_mlkem();

  return r;
}


