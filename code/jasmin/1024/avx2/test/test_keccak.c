#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef uint64_t KeccakState[25];
typedef uint64_t KeccakStateX4[4*25];


//REF
// out=64; in=33
extern void sha3_512A_A33_ref(uint8_t out[], uint8_t in[]);
// out=64, in=64
extern void sha3_512A_A64_ref(uint8_t out[], uint8_t in[]);
// out=128, seed=32, nonce=1
extern void shake256_A128__A32_A1_ref(uint8_t out[], uint8_t seed[], uint8_t nonce[]);
// out=536, seed=32, pos=2
extern void shake128_absorb_squeeze3blocks_ref(uint8_t out[], uint8_t seed[], uint8_t pos[]);
// out=200, seed=32, pos=2
extern void shake128_absorb_ref(uint8_t out[], uint8_t seed[], uint8_t pos[]);
// buf=536
extern void shake128_next_state_ref(uint8_t buf[]);
// out=32, in=1184
extern void sha3_256A_A1184_ref(uint8_t out[], uint8_t in[]);
// out=32, in=1120
extern void sha3_256A_A1568_ref(uint8_t out[], uint8_t in[]);
// out=32, in=1120
extern void shake256_A32__A1120_ref(uint8_t out[], uint8_t in[]);
// out=32, in=1600
extern void shake256_A32__A1600_ref(uint8_t out[], uint8_t in[]);

// AVX2
// out=64; in=33
extern void sha3_512A_A33_avx2(uint8_t out[], uint8_t in[]);
// out=64, in=64
extern void sha3_512A_A64_avx2(uint8_t out[], uint8_t in[]);
// out=128, seed=32, nonce=1
extern void shake256_A128__A32_A1_avx2(uint8_t out[], uint8_t seed[], uint8_t nonce[]);
// out=536, seed=32, pos=2
extern void shake128_absorb_squeeze3blocks_avx2(uint8_t out[], uint8_t seed[], uint8_t pos[]);
// buf=526
extern void shake128_next_state_avx2(uint8_t buf[]);
// out=32, in=1184
extern void sha3_256A_A1184_avx2(uint8_t out[], uint8_t in[]);
// out=32, in=1568
extern void sha3_256A_A1568_avx2(uint8_t out[], uint8_t in[]);
// out=32, in=1120
extern void shake256_A32__A1120_avx2(uint8_t out[], uint8_t in[]);
// out=32, in=1600
extern void shake256_A32__A1600_avx2(uint8_t out[], uint8_t in[]);

// AVX2X4
// out=4*536, seed=32, pos=8
extern void shake128x4_absorb_squeeze3blocks_avx2x4(uint8_t out[], uint8_t seed[], uint8_t pos[]);
// out*4=128, seed=32, nonces=4
extern void shake256x4_A128__A32_A1_avx2x4(uint8_t out0[], uint8_t out1[], uint8_t out2[], uint8_t out3[], uint8_t seed[], uint8_t nonces[]);
extern void shake128x4_absorb_avx2x4(uint8_t out0[], uint8_t out1[], uint8_t out2[], uint8_t out3[], uint8_t seed[], uint8_t nonces[]);



// TESTING CODE
void print_buf(char* str, uint8_t a[], size_t len) {
  size_t i;
  if (str!=NULL) printf("%s = ", str);
  for (i=0; i<len; i++)
    printf("%02X", a[i]);
  printf("\n");
}

int chkeq_buf(char *str, uint8_t a1[], uint8_t a2[], size_t len) {
  bool r;
  int i;

  r = true;
  for (i=0; r && i<(int)len; i++)
    r = r && (a1[i]==a2[i]);
  if (r) i = -1; else i -= 1;

  if (str!=NULL) printf("TESTING %s:\n", str);
  if (i < 0) {
    printf("  Ok!\n");
  } else {
    printf("  Error at pos=%d\n", i);
    print_buf("L", a1, len);
    print_buf("R", a2, len);
  }
  printf("\n");
  return r?0:1;
}

void fill_buf(uint8_t a[], size_t len) {
  size_t i;
  uint8_t x=1;
  for (i=0; i<len; i++) a[i] = x++;
}


int test_sha3_512A_A33() {
  int r=0;
  uint8_t in[33], outr[64], outa[64];
  fill_buf(in, 33);
  sha3_512A_A33_ref(outr, in);
  sha3_512A_A33_avx2(outa, in);
  r = chkeq_buf("sha3_512A_A33", outr, outa, sizeof(outr));

  return r;
}

int test_sha3_512A_A64() {
  int r=0;
  uint8_t in[64], outr[64], outa[64];
  fill_buf(in, sizeof(in));
  sha3_512A_A64_ref(outr, in);
  sha3_512A_A64_avx2(outa, in);
  r = chkeq_buf("sha3_512A_A64", outr, outa, sizeof(outr));

  return r;
}

int test_shake256_A128__A32_A1() {
  int r=0;
  uint8_t in1[32], in2[1], outr[128], outa[128];
  fill_buf(in1, sizeof(in1));
  fill_buf(in2, sizeof(in2));
  shake256_A128__A32_A1_ref(outr, in1, in2);
  shake256_A128__A32_A1_avx2(outa, in1, in2);
  r = chkeq_buf("shake256_A128__A32_A1", outr, outa, sizeof(outr));

  return r;
}

int test_shake128_absorb_squeeze3blocks() {
  int r=0;
  uint8_t in1[32], in2[2], outr[536], outa[536];
  fill_buf(in1, sizeof(in1));
  fill_buf(in2, sizeof(in2));
  shake128_absorb_squeeze3blocks_ref(outr, in1, in2);
  shake128_absorb_squeeze3blocks_avx2(outa, in1, in2);
  r = chkeq_buf("shake128_absorb_squeeze3blocks", outr, outa, sizeof(outr));

  return r;
}

int test_shake128_next_state() {
  int r=0;
  uint8_t outr[536], outa[536];
  fill_buf(outr, sizeof(outr));
  fill_buf(outa, sizeof(outa));
  shake128_next_state_ref(outr);
  shake128_next_state_avx2(outa);
  r = chkeq_buf("shake128_next_state_avx2", outr, outa, sizeof(outr));

  return r;
}

int test_sha3_256A_A1184() {
  int r=0;
  uint8_t in[1184], outr[32], outa[32];
  fill_buf(in, sizeof(in));
  sha3_256A_A1184_ref(outr, in);
  sha3_256A_A1184_avx2(outa, in);
  r = chkeq_buf("sha3_256A_A1184", outr, outa, sizeof(outr));

  return r;
}

int test_sha3_256A_A1568() {
  int r=0;
  uint8_t in[1568], outr[32], outa[32];
  fill_buf(in, sizeof(in));
  sha3_256A_A1568_ref(outr, in);
  sha3_256A_A1568_avx2(outa, in);
  r = chkeq_buf("sha3_256A_A1568", outr, outa, sizeof(outr));

  return r;
}

int test_shake256_A32__A1120() {
  int r=0;
  uint8_t in[1120], outr[32], outa[32];
  fill_buf(in, sizeof(in));
  shake256_A32__A1120_ref(outr, in);
  shake256_A32__A1120_avx2(outa, in);
  r = chkeq_buf("shake256_A32__A1120", outr, outa, sizeof(outr));

  return r;
}

int test_shake256_A32__A1600() {
  int r=0;
  uint8_t in[1600], outr[32], outa[32];
  fill_buf(in, sizeof(in));
  shake256_A32__A1600_ref(outr, in);
  shake256_A32__A1600_avx2(outa, in);
  r = chkeq_buf("shake256_A32__A1600", outr, outa, sizeof(outr));

  return r;
}

int test_shake128x4_absorb_squeeze3blocks() {
  int r=0;
  uint8_t seed[32], pos[8];
  uint8_t outr0[536], outr1[536], outr2[536], outr3[536];
  uint8_t outa[4*536];
  fill_buf(seed, sizeof(seed));
  fill_buf(pos, sizeof(pos));
  shake128_absorb_squeeze3blocks_ref(outr0, seed, pos);
  shake128_absorb_squeeze3blocks_ref(outr1, seed, pos+2);
  shake128_absorb_squeeze3blocks_ref(outr2, seed, pos+4);
  shake128_absorb_squeeze3blocks_ref(outr3, seed, pos+6);
  shake128x4_absorb_squeeze3blocks_avx2x4(outa, seed, pos);
  r = chkeq_buf("shake128x4_absorb_squeeze3blocks[0]", outr0, outa+0*536, sizeof(outr0));
  r = chkeq_buf("shake128x4_absorb_squeeze3blocks[1]", outr1, outa+1*536, sizeof(outr1));
  r = chkeq_buf("shake128x4_absorb_squeeze3blocks[2]", outr2, outa+2*536, sizeof(outr2));
  r = chkeq_buf("shake128x4_absorb_squeeze3blocks[3]", outr3, outa+3*536, sizeof(outr3));

  return r;
}

int test_shake128x4_absorb() {
  int r=0;
  uint8_t seed[32], pos[8];
  _Alignas(8) uint8_t outr0[200], outr1[200], outr2[200], outr3[200];
  _Alignas(8) uint8_t outa0[200], outa1[200], outa2[200], outa3[200];
  fill_buf(seed, sizeof(seed));
  fill_buf(pos, sizeof(pos));
  shake128_absorb_ref(outr0, seed, pos);
  shake128_absorb_ref(outr1, seed, pos+2);
  shake128_absorb_ref(outr2, seed, pos+4);
  shake128_absorb_ref(outr3, seed, pos+6);
  shake128x4_absorb_avx2x4(outa0, outa1, outa2, outa3, seed, pos);
  r = chkeq_buf("shake128x4_absorb[0]", outr0, outa0, sizeof(outr0));
  r = chkeq_buf("shake128x4_absorb[1]", outr1, outa1, sizeof(outr1));
  r = chkeq_buf("shake128x4_absorb[2]", outr2, outa2, sizeof(outr2));
  r = chkeq_buf("shake128x4_absorb[3]", outr3, outa3, sizeof(outr3));

  return r;
}

int test_shake256x4_A128__A32_A1() {
  int r=0;
  uint8_t seed[32], nonces[4];
  uint8_t outr0[128], outr1[128], outr2[128], outr3[128];
  uint8_t outa0[128], outa1[128], outa2[128], outa3[128];

  fill_buf(seed, sizeof(seed));
  fill_buf(nonces, sizeof(nonces));
  shake256_A128__A32_A1_ref(outr0, seed, nonces);
  shake256_A128__A32_A1_ref(outr1, seed, nonces+1);
  shake256_A128__A32_A1_ref(outr2, seed, nonces+2);
  shake256_A128__A32_A1_ref(outr3, seed, nonces+3);
  shake256x4_A128__A32_A1_avx2x4(outa0, outa1, outa2, outa3, seed, nonces);
  r = chkeq_buf("shake256x4_A128__A32_A1_avx2x4[0]", outr0, outa0, sizeof(outr0));
  r = chkeq_buf("shake256x4_A128__A32_A1_avx2x4[1]", outr1, outa1, sizeof(outr1));
  r = chkeq_buf("shake256x4_A128__A32_A1_avx2x4[2]", outr2, outa2, sizeof(outr2));
  r = chkeq_buf("shake256x4_A128__A32_A1_avx2x4[3]", outr3, outa3, sizeof(outr3));

  return r;
}



int main() {
  int r=0;

  r = r || test_sha3_512A_A33();
  r = r || test_sha3_512A_A64();
  r = r || test_shake256_A128__A32_A1();
  r = r || test_shake128_absorb_squeeze3blocks();
  r = r || test_shake128_next_state();
  r = r || test_sha3_256A_A1184();
  r = r || test_sha3_256A_A1568();
  r = r || test_shake256_A32__A1120();
  r = r || test_shake256_A32__A1600();

  r = r || test_shake128x4_absorb();
  r = r || test_shake128x4_absorb_squeeze3blocks();
  r = r || test_shake256x4_A128__A32_A1();

  return r;
}


