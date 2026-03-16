#include "api.h"
#include "namespace.h"
#include "randombytes1.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <inttypes.h>

//

#define CRYPTO_SECRETKEYBYTES     NAMESPACE(SECRETKEYBYTES)
#define CRYPTO_PUBLICKEYBYTES     NAMESPACE(PUBLICKEYBYTES)
#define CRYPTO_KEYPAIRCOINBYTES   NAMESPACE(KEYPAIRCOINBYTES)

#define CRYPTO_CIPHERTEXTBYTES    NAMESPACE(CIPHERTEXTBYTES)
#define CRYPTO_BYTES              NAMESPACE(BYTES)
#define CRYPTO_ENCCOINBYTES       NAMESPACE(ENCCOINBYTES)

#define CRYPTO_ALGNAME            NAMESPACE(ALGNAME)
#define CRYPTO_ARCH               NAMESPACE(ARCH)
#define CRYPTO_IMPL               NAMESPACE(IMPL)

#define crypto_kem_keypair        NAMESPACE_LC(keypair)
#define crypto_kem_keypair_derand NAMESPACE_LC(keypair_derand)
#define crypto_kem_enc            NAMESPACE_LC(enc)
#define crypto_kem_enc_derand     NAMESPACE_LC(enc_derand)
#define crypto_kem_dec            NAMESPACE_LC(dec)

#define OP 5

//

#include "config.h"
#include "cpucycles.c"
#include "alignedcalloc.c"

//

void print_results_op5(
  const char *cpu,
  const char *impl,
  int print_header,
  uint64_t results[OP][RUNS]
){
  #ifdef RUNS_SORT
  for(size_t i=0; i<OP; i++)
  { qsort(&(results[i][0]), RUNS, sizeof(uint64_t), cmp_uint64); }
  #endif

  if(print_header)
  { printf("|        cpu |              implem. |    keypair | keypair_derand ");
    printf("|        enc | enc_derand |        dec |\n");
    printf("|-----------:|---------------------:|-----------:|---------------:");
    printf("|-----------:|-----------:|-----------:|\n");
  }

  printf("|%12.11s", cpu);
  printf("|%22.21s", impl);

  printf("|%12" PRIu64 "", results[0][RUNS/2]);
  printf("|%16" PRIu64 "", results[1][RUNS/2]);
  printf("|%12" PRIu64 "", results[2][RUNS/2]);
  printf("|%12" PRIu64 "", results[3][RUNS/2]);
  printf("|%12" PRIu64 "", results[4][RUNS/2]);
  printf("|\n");
}


//

int main(int argc, char**argv)
{
  const char *cpu_name = "";
  const char *implementation_name = "";
  int print_headers = 1;

  if (argc > 1) cpu_name = argv[1];
  if (argc > 2) implementation_name = argv[2];
  if (argc > 3) print_headers = (int)strtol(argv[3], NULL, 10);

  size_t run, i;
  uint64_t cycles[TIMINGS];
  uint64_t begin, end;
  uint64_t median[OP][RUNS];
  int r;

  // 'rand'
  uint8_t *_ss,  *ss,  *s;  // CRYPTO_SECRETKEYBYTES  // keypair, dec
  uint8_t *_ps,  *ps,  *p;  // CRYPTO_PUBLICKEYBYTES  // keypair, enc
  uint8_t *_cs,  *cs,  *c;  // CRYPTO_CIPHERTEXTBYTES // enc, dec
  uint8_t *_ks,  *ks,  *k;  // CRYPTO_BYTES           // enc
  uint8_t *_ts,  *ts,  *t;  // CRYPTO_BYTES           // dec

  // 'derand'
  uint8_t *_d_ss,  *d_ss,  *d_s;  // CRYPTO_SECRETKEYBYTES    // keypair, dec
  uint8_t *_d_ps,  *d_ps,  *d_p;  // CRYPTO_PUBLICKEYBYTES    // keypair, enc
  uint8_t *_d_cs,  *d_cs,  *d_c;  // CRYPTO_CIPHERTEXTBYTES   // enc, dec
  uint8_t *_d_ks,  *d_ks,  *d_k;  // CRYPTO_BYTES             // enc
  uint8_t *_d_kcs, *d_kcs, *d_kc; // CRYPTO_KEYPAIRCOINBYTES  // keypair
  uint8_t *_d_ecs, *d_ecs, *d_ec; // CRYPTO_ENCCOINBYTES      // enc

  size_t slen, plen, clen, klen, tlen;
  size_t kclen, eclen;

  slen  = alignedcalloc_step(CRYPTO_SECRETKEYBYTES);
  plen  = alignedcalloc_step(CRYPTO_PUBLICKEYBYTES);
  clen  = alignedcalloc_step(CRYPTO_CIPHERTEXTBYTES);
  klen  = alignedcalloc_step(CRYPTO_BYTES);
  tlen  = alignedcalloc_step(CRYPTO_BYTES);
  kclen = alignedcalloc_step(CRYPTO_KEYPAIRCOINBYTES);
  eclen = alignedcalloc_step(CRYPTO_ENCCOINBYTES);

  //

  ss  = alignedcalloc(&_ss,  slen  * TIMINGS);
  ps  = alignedcalloc(&_ps,  plen  * TIMINGS);
  cs  = alignedcalloc(&_cs,  clen  * TIMINGS);
  ks  = alignedcalloc(&_ks,  klen  * TIMINGS);
  ts  = alignedcalloc(&_ts,  tlen  * TIMINGS);

  d_ss  = alignedcalloc(&_d_ss,  slen  * TIMINGS);
  d_ps  = alignedcalloc(&_d_ps,  plen  * TIMINGS);
  d_cs  = alignedcalloc(&_d_cs,  clen  * TIMINGS);
  d_ks  = alignedcalloc(&_d_ks,  klen  * TIMINGS);
  d_kcs = alignedcalloc(&_d_kcs, kclen * TIMINGS);
  d_ecs = alignedcalloc(&_d_ecs, eclen * TIMINGS);

  for(run = 0; run < RUNS; run++)
  {
    // //////////////////////////////////////////////////
    // keypair
    p = ps; s = ss;
    for (i = 0; i < TIMINGS; i++, p += plen, s += slen)
    { begin = cpucycles_begin();
      r = crypto_kem_keypair(p, s);
      end = cpucycles_end();
      cycles[i] = end - begin;
      assert(r == 0);
    }
    median[0][run] = cpucycles_median(cycles, TIMINGS);

    // //////////////////////////////////////////////////
    // keypair derand:
    d_kc = d_kcs;
    for (i = 0; i < TIMINGS; i++, d_kc += kclen)
    { randombytes(d_kc, CRYPTO_KEYPAIRCOINBYTES); }

    d_p = d_ps; d_s = d_ss; d_kc = d_kcs;
    for (i = 0; i < TIMINGS; i++, d_p += plen, d_s += slen, d_kc += kclen)
    { begin = cpucycles_begin();
      r = crypto_kem_keypair_derand(d_p, d_s, d_kc);
      end = cpucycles_end();
      cycles[i] = end - begin;
      assert(r == 0);
    }
    median[1][run] = cpucycles_median(cycles, TIMINGS);

    // //////////////////////////////////////////////////
    // enc
    c = cs; k = ks; p = ps;
    for (i = 0; i < TIMINGS; i++, c += clen, k += klen, p += plen)
    { begin = cpucycles_begin();
      r = crypto_kem_enc(c, k, p);
      end = cpucycles_end();
      cycles[i] = end - begin;
      assert(r == 0);
    }
    median[2][run] = cpucycles_median(cycles, TIMINGS);

    // //////////////////////////////////////////////////
    // enc derand
    d_ec = d_ecs;
    for (i = 0; i < TIMINGS; i++, d_ec += eclen)
    { randombytes(d_ec, CRYPTO_ENCCOINBYTES); }

    d_c = d_cs; d_k = d_ks; d_p = d_ps; d_ec = d_ecs;
    for (i = 0; i < TIMINGS; i++, d_c += clen, d_k += klen, d_p += plen, d_ec += eclen)
    { begin = cpucycles_begin();
      r = crypto_kem_enc_derand(d_c, d_k, d_p, d_ec);
      end = cpucycles_end();
      cycles[i] = end - begin;
      assert(r == 0);
    }
    median[3][run] = cpucycles_median(cycles, TIMINGS);

    // //////////////////////////////////////////////////
    // dec
    t = ts; c = cs; s = ss;
    for (i = 0; i < TIMINGS; i++, t += tlen, c += clen, s += slen)
    { begin = cpucycles_begin();
      r = crypto_kem_dec(t, c, s);
      end = cpucycles_end();
      cycles[i] = end - begin;
      assert(r == 0);
    }
    median[4][run] = cpucycles_median(cycles, TIMINGS);

    // //////////////////////////////////////////////////
    // check that shared_secrets match
    k = ks; t = ts;
    for (i = 0; i < TIMINGS; i++, k += klen, t += tlen)
    { assert(memcmp(k, t, CRYPTO_BYTES) == 0); }

    d_k = d_ks; t = ts; d_c = d_cs; d_s = d_ss;
    for (i = 0; i < TIMINGS; i++, d_k += klen, t += tlen, d_c += clen, d_s += slen)
    { crypto_kem_dec(t, d_c, d_s);
      assert(memcmp(d_k, t, CRYPTO_BYTES) == 0);
    }
  }

  print_results_op5(cpu_name, implementation_name, print_headers, median);

  free(_ps);
  free(_ss);
  free(_ks);
  free(_cs);
  free(_ts);

  free(_d_ps);
  free(_d_ss);
  free(_d_ks);
  free(_d_cs);
  free(_d_kcs);
  free(_d_ecs);

  return 0;
}


