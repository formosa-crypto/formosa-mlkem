// notes:
// - adapted from SUPERCOP

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <inttypes.h>

// ////////////////////////////////////////////////////////////////////////////
// test config

#ifndef TESTING_LOOPS
  #ifdef SMALL // checksumsmall
    #define TESTING_LOOPS 8
  #else // checksumbig
    #define TESTING_LOOPS 64
  #endif
#endif

#ifndef CANARY_LENGTH
#define CANARY_LENGTH 16
#endif


// ////////////////////////////////////////////////////////////////////////////
// api

// TODO: migrate to single NAMESPACE (avoid lc)

#ifndef JADE_NAMESPACE
#error "checksums.c requires the macro JADE_NAMESPACE to be defined. \
        - for instance, -DJADE_NAMESPACE=JADE_KEM_mlkem_mlkem768_amd64_avx2"
#endif

#ifndef JADE_NAMESPACE_LC
#error "checksums.c requires the macro JADE_NAMESPACE_LC to be defined. \
        - for instance, -DJADE_NAMESPACE_LC=jade_kem_mlkem_mlkem768_amd64_avx2"
#endif


#define PASTER(x, y) x##_##y
#define EVALUATOR(x, y) PASTER(x, y)
#define EVAL_NAMESPACE(fun) EVALUATOR(JADE_NAMESPACE, fun)
#define EVAL_NAMESPACE_LC(fun) EVALUATOR(JADE_NAMESPACE_LC, fun)

#include "api.h"

#define mlkem_SECRETKEYBYTES   EVAL_NAMESPACE(SECRETKEYBYTES)
#define mlkem_PUBLICKEYBYTES   EVAL_NAMESPACE(PUBLICKEYBYTES)
#define mlkem_KEYPAIRCOINBYTES EVAL_NAMESPACE(KEYPAIRCOINBYTES)
#define mlkem_CIPHERTEXTBYTES  EVAL_NAMESPACE(CIPHERTEXTBYTES)
#define mlkem_BYTES            EVAL_NAMESPACE(BYTES)
#define mlkem_ENCCOINBYTES     EVAL_NAMESPACE(ENCCOINBYTES)
#define mlkem_ALGNAME          EVAL_NAMESPACE(ALGNAME)
#define mlkem_ARCH             EVAL_NAMESPACE(ARCH)
#define mlkem_IMPL             EVAL_NAMESPACE(IMPL)

#define mlkem_keypair          EVAL_NAMESPACE_LC(keypair)
#define mlkem_keypair_derand   EVAL_NAMESPACE_LC(keypair_derand)
#define mlkem_enc              EVAL_NAMESPACE_LC(enc)
#define mlkem_enc_derand       EVAL_NAMESPACE_LC(enc_derand)
#define mlkem_dec              EVAL_NAMESPACE_LC(dec)

// ////////////////////////////////////////////////////////////////////////////
// not randombytes

#define ROTATE(v,c) ((v << c) | (v >> (32-c)))
#define QUARTERROUND(a,b,c,d) \
  a = a + b; d = ROTATE((d ^ a),16); \
  c = c + d; b = ROTATE((b ^ c),12); \
  a = a + b; d = ROTATE((d ^ a), 8); \
  c = c + d; b = ROTATE((b ^ c), 7);

static void chacha20_core(uint32_t output[16], const uint32_t input[16])
{
  uint32_t x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15;
  int i;

  x0 = input[0];
  x1 = input[1];
  x2 = input[2];
  x3 = input[3];
  x4 = input[4];
  x5 = input[5];
  x6 = input[6];
  x7 = input[7];
  x8 = input[8];
  x9 = input[9];
  x10 = input[10];
  x11 = input[11];
  x12 = input[12];
  x13 = input[13];
  x14 = input[14];
  x15 = input[15];

  for (i = 20;i > 0;i -= 2) {
    QUARTERROUND( x0, x4, x8,x12)
    QUARTERROUND( x1, x5, x9,x13)
    QUARTERROUND( x2, x6,x10,x14)
    QUARTERROUND( x3, x7,x11,x15)
    QUARTERROUND( x0, x5,x10,x15)
    QUARTERROUND( x1, x6,x11,x12)
    QUARTERROUND( x2, x7, x8,x13)
    QUARTERROUND( x3, x4, x9,x14)
  }

  x0  += input[0] ;
  x1  += input[1] ;
  x2  += input[2] ;
  x3  += input[3] ;
  x4  += input[4] ;
  x5  += input[5] ;
  x6  += input[6] ;
  x7  += input[7] ;
  x8  += input[8] ;
  x9  += input[9] ;
  x10 += input[10];
  x11 += input[11];
  x12 += input[12];
  x13 += input[13];
  x14 += input[14];
  x15 += input[15];

  output[0 ] = x0;
  output[1 ] = x1;
  output[2 ] = x2;
  output[3 ] = x3;
  output[4 ] = x4;
  output[5 ] = x5;
  output[6 ] = x6;
  output[7 ] = x7;
  output[8 ] = x8;
  output[9 ] = x9;
  output[10] = x10;
  output[11] = x11;
  output[12] = x12;
  output[13] = x13;
  output[14] = x14;
  output[15] = x15;
}

static const uint8_t notrandombytes_sigma[16] = "expand 32-byte k";

static void chacha20_init(uint32_t x[16], const uint8_t n[8], const uint8_t k[32])
{
  #define LU8U32(p, i) ((((uint32_t)p[i+3])<<24) | (((uint32_t)p[i+2])<<16) | (((uint32_t)p[i+1])<<8) |(((uint32_t)p[i])<<0))

  x[0]  = LU8U32(notrandombytes_sigma, 0);
  x[1]  = LU8U32(notrandombytes_sigma, 4);
  x[2]  = LU8U32(notrandombytes_sigma, 8);
  x[3]  = LU8U32(notrandombytes_sigma, 12);

  x[4]  = LU8U32(k, 0 );
  x[5]  = LU8U32(k, 4 );
  x[6]  = LU8U32(k, 8 );
  x[7]  = LU8U32(k, 12);
  x[8]  = LU8U32(k, 16);
  x[9]  = LU8U32(k, 20);
  x[10] = LU8U32(k, 24);
  x[11] = LU8U32(k, 28);

  x[12] = 0;
  x[13] = 0;
  x[14] = LU8U32(n, 0);
  x[15] = LU8U32(n, 4);

  #undef LU8U32
}


static void chacha20(uint8_t *c, uint64_t clen, const uint8_t n[8], const uint8_t k[32])
{
  uint32_t x[16], output[16];
  uint64_t i;

  chacha20_init(x,n,k);
  while(clen > 0)
  {
    chacha20_core(output, x);
    x[12] += 1;
    if(x[12] == 0){ x[13] += 1; }

    if(clen >= 64)
    { for(i=0; i<64; i++)
      { c[i] = ((uint8_t*)output)[i]; }
      clen -= 64;
      c += 64;
    }
    else
    { for(i=0; i<clen; i++)
      { c[i] = ((uint8_t*)output)[i]; }
      return;
    }
  }
}

#define NONCEBYTES 8
#define KEYBYTES 32
#define OUTPUTBYTES 736

static const uint8_t nonce[NONCEBYTES] = {0};

static int crypto_rng(
        uint8_t *r, // random output
        uint8_t *n, // new key
  const uint8_t *g  // old key
)
{
  uint8_t x[KEYBYTES + OUTPUTBYTES];
  chacha20(x,sizeof x,nonce,g);
  memcpy(n,x,KEYBYTES);
  memcpy(r,x + KEYBYTES,OUTPUTBYTES);
  return 0;
}

static uint8_t g0[KEYBYTES];
static uint8_t g1[KEYBYTES];

static uint8_t r0[OUTPUTBYTES];
static uint8_t r1[OUTPUTBYTES];

static uint64_t pos0 = OUTPUTBYTES;
static uint64_t pos1 = OUTPUTBYTES;

static void randombytes_internal(
  uint8_t *x, uint64_t xlen,
  uint8_t *g, uint8_t *r,
  uint64_t *pos
)
{
  while (xlen > 0)
  {
    if ((*pos) == OUTPUTBYTES)
    { crypto_rng(r,g,g);
      *pos = 0;
    }

    *x = r[*pos]; x += 1;
    xlen -= 1;
    r[*pos] = 0; *pos += 1;
  }
}

void resetrandombytes(void)
{
  pos0 = OUTPUTBYTES;
  memset(g0, 0, KEYBYTES);
}

int randombytes(uint8_t* x, uint64_t xlen)
{
  randombytes_internal(x,xlen,g0,r0,&pos0);
  return 0;
}

void resetrandombytes1(void)
{
  pos1 = OUTPUTBYTES;
  memset(g1, 0, KEYBYTES);
}

int randombytes1(uint8_t* x, uint64_t xlen)
{
  randombytes_internal(x,xlen,g1,r1,&pos1);
  return 0;
}

uint8_t* __jasmin_syscall_randombytes__(uint8_t* dest, uint64_t length_in_bytes)
{
  randombytes(dest, length_in_bytes);
  return dest;
}

// ////////////////////////////////////////////////////////////////////////////

#define FOR(i,n) for (i = 0;i < n;++i)

static uint32_t L32(uint32_t x, int c)
{
  return (x << c) | ((x&0xffffffff) >> (32 - c));
}

static uint32_t ld32(const uint8_t *x)
{
  uint32_t u = x[3];
  u = (u<<8)|x[2];
  u = (u<<8)|x[1];
  return (u<<8)|x[0];
}

static void st32(uint8_t *x, uint32_t u)
{
  int i;
  FOR(i,4) { x[i] = u; u >>= 8; }
}

static const uint8_t sigma[17] = "expand 32-byte k";

static void core(uint8_t *out, const uint8_t *in, const uint8_t *k)
{
  uint32_t w[16], x[16], y[16], t[4];
  int i, j, m;

  FOR(i,4) {
    x[5*i] = ld32(sigma+4*i);
    x[1+i] = ld32(k+4*i);
    x[6+i] = ld32(in+4*i);
    x[11+i] = ld32(k+16+4*i);
  }

  FOR(i,16) y[i] = x[i];

  FOR(i,20) {
    FOR(j,4) {
      FOR(m,4) t[m] = x[(5*j+4*m)%16];
      t[1] ^= L32(t[0]+t[3], 7);
      t[2] ^= L32(t[1]+t[0], 9);
      t[3] ^= L32(t[2]+t[1],13);
      t[0] ^= L32(t[3]+t[2],18);
      FOR(m,4) w[4*j+(j+m)%4] = t[m];
    }
    FOR(m,16) x[m] = w[m];
  }

  FOR(i,16) st32(out + 4 * i,x[i] + y[i]);
}

static void salsa20(uint8_t *c, uint64_t b, const uint8_t *n, const uint8_t *k)
{
  uint8_t z[16], x[64];
  uint32_t u;
  uint64_t i;

  if (!b) return;
  FOR(i,16) z[i] = 0;
  FOR(i,8) z[i] = n[i];
  while (b >= 64) {
    core(x,z,k);
    FOR(i,64) c[i] = x[i];
    u = 1;
    for (i = 8;i < 16;++i) {
      u += (uint32_t) z[i];
      z[i] = u;
      u >>= 8;
    }
    b -= 64;
    c += 64;
  }
  if (b) {
    core(x,z,k);
    FOR(i,b) c[i] = x[i];
  }
}

static void increment(uint8_t *n)
{
  if (!++n[0])
    if (!++n[1])
      if (!++n[2])
        if (!++n[3])
          if (!++n[4])
            if (!++n[5])
              if (!++n[6])
                if (!++n[7])
                { return; }
}

static void testvector(unsigned char *x, uint64_t xlen)
{
  static const unsigned char testvector_k[33] = "generate inputs for test vectors";
  static unsigned char testvector_n[8];
  salsa20(x,xlen,testvector_n,testvector_k);
  increment(testvector_n);
}

unsigned long long myrandom(void)
{
  unsigned char x[8];
  unsigned long long result;
  testvector(x,8);
  result = x[7];
  result = (result<<8)|x[6];
  result = (result<<8)|x[5];
  result = (result<<8)|x[4];
  result = (result<<8)|x[3];
  result = (result<<8)|x[2];
  result = (result<<8)|x[1];
  result = (result<<8)|x[0];
  return result;
}

static void canary(uint8_t *x, uint64_t xlen)
{
  static const uint8_t canary_k[33] = "generate pad to catch overwrites";
  static uint8_t canary_n[8];
  salsa20(x,xlen,canary_n,canary_k);
  increment(canary_n);
}

void double_canary(uint8_t *x2, uint8_t *x, uint64_t xlen)
{
  canary(x - CANARY_LENGTH, CANARY_LENGTH);
  canary(x + xlen, CANARY_LENGTH);
  memcpy(x2 - CANARY_LENGTH, x - CANARY_LENGTH, CANARY_LENGTH);
  memcpy(x2 + xlen, x + xlen, CANARY_LENGTH);
}

void input_prepare(uint8_t *x2, uint8_t *x, uint64_t xlen)
{
  testvector(x, xlen);
  canary(x - CANARY_LENGTH, CANARY_LENGTH);
  canary(x + xlen, CANARY_LENGTH);
  memcpy(x2 - CANARY_LENGTH, x - CANARY_LENGTH, xlen + (2*CANARY_LENGTH));
}

void input_compare(const uint8_t *x2, const uint8_t *x, uint64_t xlen, const char *fun)
{
  if (memcmp(x2 - CANARY_LENGTH, x - CANARY_LENGTH, xlen + (2*CANARY_LENGTH)))
  { fprintf(stderr,"%s overwrites input\n",fun);
    exit(111);
  }
}

void output_prepare(uint8_t *x2, uint8_t *x, uint64_t xlen)
{
  canary(x - CANARY_LENGTH, xlen + (2*CANARY_LENGTH));
  memcpy(x2 - CANARY_LENGTH, x - CANARY_LENGTH, xlen + (2*CANARY_LENGTH));
}

void output_compare(const uint8_t *x2, const uint8_t *x, uint64_t xlen, const char *fun)
{
  if (memcmp(x2 - CANARY_LENGTH, x - CANARY_LENGTH, CANARY_LENGTH))
  { fprintf(stderr,"%s writes before output\n",fun);
    exit(111);
  }
  if (memcmp(x2 + xlen, x + xlen, CANARY_LENGTH))
  { fprintf(stderr,"%s writes after output\n",fun);
    exit(111);
  }
}

static void printword(const char *s)
{
  if (!*s) putchar('-');
  while (*s)
  { if (*s == ' ') putchar('_');
    else if (*s == '\t') putchar('_');
    else if (*s == '\r') putchar('_');
    else if (*s == '\n') putchar('_');
    else putchar(*s);
    ++s;
  }
  //putchar(' ');
}
/*
static void dump_hex(uint8_t *x, uint64_t xlen) {
  uint64_t i;
  char *xhex = (char *)malloc(2*xlen+1);
  for ( i = 0;i < xlen;++i) {
    xhex[2 * i] = "0123456789abcdef"[15 & (x[i] >> 4)];
    xhex[2 * i + 1] = "0123456789abcdef"[15 & x[i]];
  }
  xhex[2 * i] = 0;
  printword(xhex);
  free(xhex);
}
*/

void checksum(uint8_t *checksum_state, uint8_t *x, uint64_t xlen)
{
  uint8_t block[16];
  uint64_t i;

  //dump_hex(x,xlen);
  while (xlen >= 16)
  { core(checksum_state, x, checksum_state);
    x += 16;
    xlen -= 16;
  }
  FOR(i,16) block[i] = 0;
  FOR(i,xlen) block[i] = x[i];
  block[xlen] = 1;
  checksum_state[0] ^= 1;
  core(checksum_state,block,checksum_state);
}



void fail(const char *why)
{
  fprintf(stderr,"%s\n",why);
  exit(111);
}

uint8_t* alignedcalloc(void** c, uint64_t len)
{
  uint8_t *x;
  uint64_t i;

  x = (uint8_t *) calloc(1,len + 256);
  if (!x) fail("out of memory");
  if(c) *c = (void*) x; // copy original pointer to *c
  for (i = 0;i < len + 256;++i) x[i] = rand();
  x += 64;
  x += 63 & (-(unsigned long) x);
  for (i = 0;i < len;++i) x[i] = 0;
  return x;
}

// ////////////////////////////////////////////////////////////////////////////

typedef struct state {

  // rand (10)
  uint8_t *p, *s, *k, *c, *t, *p2, *s2, *k2, *c2, *t2;

  // derand (10+4)
  uint8_t *_p, *_s, *_k, *_c, *_t, *_p2, *_s2, *_k2, *_c2, *_t2;
  uint8_t *_kc, *_ec, *_kc2, *_ec2; // coins

  // lengths
  uint64_t plen, slen, klen, clen, tlen, kclen, eclen;

  void* free[24];
} state;

state* preallocate(void);
void allocate(state*);
void deallocate(state**);
void unalign(state*);
void realign(state*);
void test(unsigned char*,state *);

state* preallocate(void)
{
  state *s = calloc(sizeof(state), 1);
  return s;
}

void allocate(state *s)
{
  unsigned long long alloclen = 0;

  if (alloclen < mlkem_SECRETKEYBYTES) alloclen = mlkem_SECRETKEYBYTES;
  if (alloclen < mlkem_PUBLICKEYBYTES) alloclen = mlkem_PUBLICKEYBYTES;
  if (alloclen < mlkem_CIPHERTEXTBYTES) alloclen = mlkem_CIPHERTEXTBYTES;
  if (alloclen < mlkem_KEYPAIRCOINBYTES) alloclen = mlkem_KEYPAIRCOINBYTES;
  if (alloclen < mlkem_ENCCOINBYTES) alloclen = mlkem_ENCCOINBYTES;
  if (alloclen < mlkem_BYTES) alloclen = mlkem_BYTES;

  s->p  = alignedcalloc(&(s->free[0]), alloclen);
  s->s  = alignedcalloc(&(s->free[1]), alloclen);
  s->k  = alignedcalloc(&(s->free[2]), alloclen);
  s->c  = alignedcalloc(&(s->free[3]), alloclen);
  s->t  = alignedcalloc(&(s->free[4]), alloclen);
  s->p2 = alignedcalloc(&(s->free[5]), alloclen);
  s->s2 = alignedcalloc(&(s->free[6]), alloclen);
  s->k2 = alignedcalloc(&(s->free[7]), alloclen);
  s->c2 = alignedcalloc(&(s->free[8]), alloclen);
  s->t2 = alignedcalloc(&(s->free[9]), alloclen);

  s->_p  = alignedcalloc(&(s->free[10]), alloclen);
  s->_s  = alignedcalloc(&(s->free[11]), alloclen);
  s->_k  = alignedcalloc(&(s->free[12]), alloclen);
  s->_c  = alignedcalloc(&(s->free[13]), alloclen);
  s->_t  = alignedcalloc(&(s->free[14]), alloclen);
  s->_p2 = alignedcalloc(&(s->free[15]), alloclen);
  s->_s2 = alignedcalloc(&(s->free[16]), alloclen);
  s->_k2 = alignedcalloc(&(s->free[17]), alloclen);
  s->_c2 = alignedcalloc(&(s->free[18]), alloclen);
  s->_t2 = alignedcalloc(&(s->free[19]), alloclen);

  s->_kc  = alignedcalloc(&(s->free[20]), alloclen);
  s->_ec  = alignedcalloc(&(s->free[21]), alloclen);
  s->_kc2 = alignedcalloc(&(s->free[22]), alloclen);
  s->_ec2 = alignedcalloc(&(s->free[23]), alloclen);

  s->plen  = mlkem_PUBLICKEYBYTES;
  s->slen  = mlkem_SECRETKEYBYTES;
  s->klen  = mlkem_BYTES;
  s->clen  = mlkem_CIPHERTEXTBYTES;
  s->tlen  = mlkem_BYTES;
  s->kclen = mlkem_KEYPAIRCOINBYTES;
  s->eclen = mlkem_ENCCOINBYTES;
}

void deallocate(state **_s)
{
  int i;
  state *s = *_s;

  for(i=0; i<24; i++)
  { free(s->free[i]); }
  free(s);
  *_s = NULL;
}

void unalign(state *s)
{
  ++(s->p);
  ++(s->s);
  ++(s->k);
  ++(s->c);
  ++(s->t);
  ++(s->p2);
  ++(s->s2);
  ++(s->k2);
  ++(s->c2);
  ++(s->t2);

  ++(s->_p);
  ++(s->_s);
  ++(s->_k);
  ++(s->_c);
  ++(s->_t);
  ++(s->_p2);
  ++(s->_s2);
  ++(s->_k2);
  ++(s->_c2);
  ++(s->_t2);

  ++(s->_kc);
  ++(s->_ec);
  ++(s->_kc2);
  ++(s->_ec2);
}

void realign(state *s)
{
  --(s->p);
  --(s->s);
  --(s->k);
  --(s->c);
  --(s->t);
  --(s->p2);
  --(s->s2);
  --(s->k2);
  --(s->c2);
  --(s->t2);

  --(s->_p);
  --(s->_s);
  --(s->_k);
  --(s->_c);
  --(s->_t);
  --(s->_p2);
  --(s->_s2);
  --(s->_k2);
  --(s->_c2);
  --(s->_t2);

  --(s->_kc);
  --(s->_ec);
  --(s->_kc2);
  --(s->_ec2);
}

void test(unsigned char *checksum_state, state *_s)
{
  unsigned long long loop;
  int result;
  state s = *_s;
  
  for (loop = 0;loop < TESTING_LOOPS;++loop)
  {
  //////////////////////////////////
  // rand keypair
    output_prepare(s.p2, s.p, s.plen);
    output_prepare(s.s2, s.s, s.slen);
    result = mlkem_keypair(s.p, s.s);
    if (result != 0) fail("mlkem_keypair returns nonzero");
    checksum(checksum_state, s.p, s.plen);
    checksum(checksum_state, s.s, s.slen);
    output_compare(s.p2, s.p, s.plen, "mlkem_keypair - public_key");
    output_compare(s.s2, s.s, s.slen, "mlkem_keypair - secret_key");

      // derand keypair
        output_prepare(s._p2, s._p, s.plen);
        output_prepare(s._s2, s._s, s.slen);
        randombytes1(s._kc, s.kclen);
        memcpy(s._kc2, s._kc, s.kclen);
        double_canary(s._kc2, s._kc, s.kclen);
        result = mlkem_keypair_derand(s._p, s._s, s._kc);
        if (result != 0) fail("mlkem_keypair_derand returns nonzero");

        // check canaries
        output_compare(s._p2, s._p, s.plen,   "mlkem_keypair_derand - public_key");
        output_compare(s._s2, s._s, s.slen,   "mlkem_keypair_derand - secret_key");
        input_compare(s._kc2, s._kc, s.kclen, "mlkem_keypair_derand - coins");

        // check that 'rand' and 'derand' produce the same keys (randomness is the same for both)
        if (memcmp(s.p, s._p, s.plen) != 0)
        { fail("mlkem_keypair public_key does not match the one from mlkem_keypair_derand"); }
        if (memcmp(s.s, s._s, s.slen) != 0)
        { fail("mlkem_keypair secret_key does not match the one from mlkem_keypair_derand"); }

  //////////////////////////////////
  // rand enc
    output_prepare(s.c2, s.c, s.clen);
    output_prepare(s.k2, s.k, s.klen);
    memcpy(s.p2, s.p, s.plen);
    double_canary(s.p2, s.p, s.plen);
    result = mlkem_enc(s.c, s.k, s.p);
    if (result != 0) fail("mlkem_enc returns nonzero");
    checksum(checksum_state, s.c, s.clen);
    checksum(checksum_state, s.k, s.klen);
    output_compare(s.c2, s.c, s.clen, "mlkem_enc - ciphertext");
    output_compare(s.k2, s.k, s.klen, "mlkem_enc - shared_secret");
    input_compare(s.p2, s.p, s.plen,  "mlkem_enc - public_key");

      // derand enc
        output_prepare(s._c2, s._c, s.clen);
        output_prepare(s._k2, s._k, s.klen);
        memcpy(s._p2, s._p, s.plen);
        double_canary(s._p2, s._p, s.plen);
        randombytes1(s._ec, s.eclen);
        memcpy(s._ec2, s._ec, s.eclen);
        double_canary(s._ec2, s._ec, s.eclen);

        result = mlkem_enc_derand(s._c, s._k, s._p, s._ec);
        if (result != 0) fail("mlkem_enc_derand returns nonzero");

        // check canaries
        output_compare(s._c2, s._c, s.clen,   "mlkem_enc_derand - ciphertext");
        output_compare(s._k2, s._k, s.klen,   "mlkem_enc_derand - shared_secret");
        input_compare(s._p2, s._p, s.plen,    "mlkem_enc_derand - public_key");
        input_compare(s._ec2, s._ec, s.eclen, "mlkem_enc_derand - coins");

        // check that 'rand' and 'derand' produce the same ciphertext and shared_secret
        if (memcmp(s.c, s._c, s.clen) != 0)
        { fail("mlkem_enc ciphertext does not match the one from mlkem_enc_derand"); }
        if (memcmp(s.k, s._k, s.klen) != 0)
        { fail("mlkem_enc shared_secret does not match the one from mlkem_enc_derand"); }

  // dec
    output_prepare(s.t2, s.t, s.tlen);
    memcpy(s.c2, s.c, s.clen);
    double_canary(s.c2, s.c, s.clen);
    memcpy(s.s2, s.s, s.slen);
    double_canary(s.s2, s.s, s.slen);
    result = mlkem_dec(s.t, s.c, s.s);
    if (result != 0) fail("mlkem_dec returns nonzero");
    if (memcmp(s.t, s.k, s.klen) != 0) fail("mlkem_dec does not match k");
    checksum(checksum_state, s.t, s.tlen);
    output_compare(s.t2, s.t, s.tlen, "mlkem_dec");
    input_compare(s.c2, s.c, s.clen, "mlkem_dec");
    input_compare(s.s2, s.s, s.slen, "mlkem_dec");
    
    double_canary(s.t2, s.t, s.tlen);
    double_canary(s.c2, s.c, s.clen);
    double_canary(s.s2, s.s, s.slen);
    result = mlkem_dec(s.t2, s.c2, s.s2);
    if (result != 0) fail("mlkem_dec returns nonzero");
    if (memcmp(s.t2, s.t, s.tlen) != 0) fail("mlkem_dec is nondeterministic");
    
    double_canary(s.t2, s.t, s.tlen);
    double_canary(s.c2, s.c, s.clen);
    double_canary(s.s2, s.s, s.slen);
    result = mlkem_dec(s.c2, s.c2, s.s);
    if (result != 0) fail("mlkem_dec with c=t overlap returns nonzero");
    if (memcmp(s.c2, s.t, s.tlen) != 0) fail("mlkem_dec does not handle c=t overlap");
    memcpy(s.c2, s.c, s.clen);
    result = mlkem_dec(s.s2, s.c, s.s2);
    if (result != 0) fail("mlkem_dec with s=t overlap returns nonzero");
    if (memcmp(s.s2, s.t, s.tlen) != 0) fail("mlkem_dec does not handle s=t overlap");
    memcpy(s.s2, s.s, s.slen);
    
    s.c[myrandom() % s.clen] += 1 + (myrandom() % 255);
    if (mlkem_dec(s.t, s.c, s.s) == 0)
      checksum(checksum_state, s.t, s.tlen);
    else
      checksum(checksum_state, s.c, s.clen);
    s.c[myrandom() % s.clen] += 1 + (myrandom() % 255);
    if (mlkem_dec(s.t, s.c, s.s) == 0)
      checksum(checksum_state, s.t, s.tlen);
    else
      checksum(checksum_state, s.c, s.clen);
    s.c[myrandom() % s.clen] += 1 + (myrandom() % 255);
    if (mlkem_dec(s.t, s.c, s.s) == 0)
      checksum(checksum_state, s.t, s.tlen);
    else
      checksum(checksum_state, s.c, s.clen);
  }
}

int try_anything_main(void)
{
  long long i;
  uint8_t checksum_state[64];
  char checksum_hex[65];
  state *s;

  memset(checksum_state, 0, sizeof(checksum_state));
  memset(checksum_hex, 0, sizeof(checksum_hex)); 

  s = preallocate();
  allocate(s);
  srand(getpid());
  unalign(s);
  test(checksum_state, s);
  deallocate(&s);

  for (i = 0;i < 32;++i) {
    checksum_hex[2 * i] = "0123456789abcdef"[15 & (checksum_state[i] >> 4)];
    checksum_hex[2 * i + 1] = "0123456789abcdef"[15 & checksum_state[i]];
  }
  checksum_hex[2 * i] = 0;
  printword(checksum_hex);
  printf("\n");

  return 0;
}

int main(void)
{
  return try_anything_main();
}

