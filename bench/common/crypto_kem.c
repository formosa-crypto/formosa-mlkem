#include "api.h"
#include "namespace.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

//

#define CRYPTO_BYTES           NAMESPACE(BYTES)
#define CRYPTO_PUBLICKEYBYTES  NAMESPACE(PUBLICKEYBYTES)
#define CRYPTO_SECRETKEYBYTES  NAMESPACE(SECRETKEYBYTES)
#define CRYPTO_CIPHERTEXTBYTES NAMESPACE(CIPHERTEXTBYTES)
#define CRYPTO_ALGNAME         NAMESPACE(ALGNAME)

#define crypto_kem_keypair NAMESPACE_LC(keypair)
#define crypto_kem_enc NAMESPACE_LC(enc)
#define crypto_kem_dec NAMESPACE_LC(dec)

#define OP 3

//

#include "config.h"
#include "cpucycles.c"
#include "median.c"
#include "alignedcalloc.c"

//

int main(int argc, char**argv)
{
  int run, loop, i;
  uint64_t cycles[TIMINGS];
  uint64_t results[OP][LOOPS];

  uint64_t cycles_keypair[RUNS];
  uint64_t cycles_enc[RUNS];
  uint64_t cycles_dec[RUNS];

  uint8_t *_ps, *ps, *p; // CRYPTO_PUBLICKEYBYTES
  uint8_t *_ss, *ss, *s; // CRYPTO_SECRETKEYBYTES
  uint8_t *_k, *k; // CRYPTO_BYTES
  uint8_t *_cs, *cs, *c; // CRYPTO_CIPHERTEXTBYTES
  uint8_t *_t, *t; // CRYPTO_BYTES
  size_t plen, slen, clen;

  plen = alignedcalloc_step(CRYPTO_PUBLICKEYBYTES);
  slen = alignedcalloc_step(CRYPTO_SECRETKEYBYTES);
  clen = alignedcalloc_step(CRYPTO_CIPHERTEXTBYTES);

  ps = alignedcalloc(&_ps, plen * TIMINGS);
  ss = alignedcalloc(&_ss, slen * TIMINGS);
  cs = alignedcalloc(&_cs, clen * TIMINGS);

  k = alignedcalloc(&_k, CRYPTO_BYTES);
  t = alignedcalloc(&_t, CRYPTO_BYTES);

  for(run = 0; run < RUNS; run++)
  {
    for(loop = 0; loop < LOOPS; loop++)
    {
      // keypair
      p = ps; s = ss;
      for (i = 0; i < TIMINGS; i++, p += plen, s += slen)
      { cycles[i] = cpucycles();
        crypto_kem_keypair(p, s); }
      results[0][loop] = cpucycles_median(cycles, TIMINGS);

      // enc
      p = ps;
      c = cs;
      for (i = 0; i < TIMINGS; i++, p += plen, c += clen)
      { cycles[i] = cpucycles();
        crypto_kem_enc(c, k, p); }
      results[1][loop] = cpucycles_median(cycles, TIMINGS);

      // dec
      s = ss;
      c = cs;
      for (i = 0; i < TIMINGS; i++, s += slen, c += clen)
      { cycles[i] = cpucycles();
        crypto_kem_dec(t, c, s); }
      results[2][loop] = cpucycles_median(cycles, TIMINGS);
    }

    median_fr(results);

    cycles_keypair[run] = results[0][0];
    cycles_enc[run] = results[1][0];
    cycles_dec[run] = results[2][0];
  }

  qsort(cycles_keypair,RUNS,sizeof(uint64_t),cmp_uint64);
  qsort(cycles_enc,RUNS,sizeof(uint64_t),cmp_uint64);
  qsort(cycles_dec,RUNS,sizeof(uint64_t),cmp_uint64);


  printf("|%" PRIu64 "|%" PRIu64 "|%"  PRIu64 "|",
      median_runs(cycles_keypair),
      median_runs(cycles_enc),
      median_runs(cycles_dec));

  free(_ps);
  free(_ss);
  free(_cs);
  free(_k);
  free(_t);

  return 0;
}

