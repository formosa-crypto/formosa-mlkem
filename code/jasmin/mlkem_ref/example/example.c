#include <stdint.h>
#include <string.h>
#include <assert.h>
#include <stdio.h>
#include <inttypes.h>

#include "api.h"

// print functions
static void print_info(const char *algname, const char *arch, const char *impl)
{
  printf("// {\"%s\" : { architecture : \"%s\", implementation : \"%s\"} }",
         algname, arch, impl);
  printf("\n");
}

static void print_u8(const uint8_t *a, size_t l)
{
  size_t i;

  if(l == 0)
  { return; }

  printf("{\n  ");
  for(i=0; i<(l-1); i++)
  { printf("0x%02" PRIx8 ", ", a[i]);
    if((i+1)%16 == 0)
    { printf("\n  "); }
  }

  printf("0x%02" PRIx8 "\n};\n", a[i]);
  return;
}

static void print_str_u8(const char *str, const uint8_t *a, size_t l)
{
  if( l == 0 )
  { printf("uint8_t *%s = NULL;\n", str);
    return;
  }
  
  printf("uint8_t %s[%zu] = ",str, l);
  print_u8(a, l);
}

// randombytes implementation, in this case we use the __jasmin_syscall_randombytes__
extern uint8_t* __jasmin_syscall_randombytes__(uint8_t* x, uint64_t xlen);

uint8_t* randombytes(uint8_t* x, uint64_t xlen)
{
  return __jasmin_syscall_randombytes__(x, xlen);
}

// mapping the fully namespaced macros from api.h into shorter names
#define JADE_KEM_SECRETKEYBYTES JADE_KEM_mlkem_mlkem768_amd64_ref_SECRETKEYBYTES
#define JADE_KEM_PUBLICKEYBYTES JADE_KEM_mlkem_mlkem768_amd64_ref_PUBLICKEYBYTES
#define JADE_KEM_CIPHERTEXTBYTES JADE_KEM_mlkem_mlkem768_amd64_ref_CIPHERTEXTBYTES
#define JADE_KEM_KEYPAIRCOINBYTES JADE_KEM_mlkem_mlkem768_amd64_ref_KEYPAIRCOINBYTES
#define JADE_KEM_ENCCOINBYTES JADE_KEM_mlkem_mlkem768_amd64_ref_ENCCOINBYTES
#define JADE_KEM_BYTES JADE_KEM_mlkem_mlkem768_amd64_ref_BYTES

#define jade_kem_keypair jade_kem_mlkem_mlkem768_amd64_ref_keypair
#define jade_kem_enc jade_kem_mlkem_mlkem768_amd64_ref_enc
#define jade_kem_dec jade_kem_mlkem_mlkem768_amd64_ref_dec

#define jade_kem_keypair_derand jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand
#define jade_kem_enc_derand jade_kem_mlkem_mlkem768_amd64_ref_enc_derand

#define JADE_KEM_ALGNAME JADE_KEM_mlkem_mlkem768_amd64_ref_ALGNAME
#define JADE_KEM_ARCH JADE_KEM_mlkem_mlkem768_amd64_ref_ARCH
#define JADE_KEM_IMPL JADE_KEM_mlkem_mlkem768_amd64_ref_IMPL

// this example program does the following:
// - creates a keypair (with the randomized api
// - encapsulates/decapsulates and checks that the shared secret is the same
//
// - it repeats the process using the derandomized ('derand') functions
//
int main(void)
{
  int r;
  uint8_t public_key[JADE_KEM_PUBLICKEYBYTES];
  uint8_t secret_key[JADE_KEM_SECRETKEYBYTES];

  uint8_t shared_secret_a[JADE_KEM_BYTES];
  uint8_t ciphertext[JADE_KEM_CIPHERTEXTBYTES];
  uint8_t shared_secret_b[JADE_KEM_BYTES];

  uint8_t keypair_coins[JADE_KEM_KEYPAIRCOINBYTES];
  uint8_t enc_coins[JADE_KEM_ENCCOINBYTES];

  // create key pair
  r = jade_kem_keypair(public_key, secret_key);
    assert(r == 0);

  // encapsulate
  r = jade_kem_enc(ciphertext, shared_secret_a, public_key);
    assert(r == 0);

  // decapsulate
  r = jade_kem_dec(shared_secret_b, ciphertext, secret_key);
    assert(r == 0);
    assert(memcmp(shared_secret_a, shared_secret_b, JADE_KEM_BYTES) == 0);

  print_info(JADE_KEM_ALGNAME, JADE_KEM_ARCH, JADE_KEM_IMPL);
  print_str_u8("secret_key", secret_key, JADE_KEM_SECRETKEYBYTES);
  print_str_u8("public_key", public_key, JADE_KEM_PUBLICKEYBYTES);
  print_str_u8("ciphertext", ciphertext, JADE_KEM_CIPHERTEXTBYTES);
  print_str_u8("shared_secret", shared_secret_a, JADE_KEM_BYTES);

  // create key pair using derand function (random coins are given as input)
  randombytes(keypair_coins, JADE_KEM_KEYPAIRCOINBYTES);
  r = jade_kem_keypair_derand(public_key, secret_key, keypair_coins);
    assert(r == 0);

  // encapsulate using derand function (random coins are given as input)
  randombytes(enc_coins, JADE_KEM_ENCCOINBYTES);
  r = jade_kem_enc_derand(ciphertext, shared_secret_a, public_key, enc_coins);
    assert(r == 0);

  // decapsulate
  r = jade_kem_dec(shared_secret_b, ciphertext, secret_key);
    assert(r == 0);
    assert(memcmp(shared_secret_a, shared_secret_b, JADE_KEM_BYTES) == 0);

  print_info(JADE_KEM_ALGNAME, JADE_KEM_ARCH, JADE_KEM_IMPL);
  print_str_u8("keypair_derand_coins", keypair_coins, JADE_KEM_KEYPAIRCOINBYTES);
  print_str_u8("secret_key_derand", secret_key, JADE_KEM_SECRETKEYBYTES);
  print_str_u8("public_key_derand", public_key, JADE_KEM_PUBLICKEYBYTES);

  print_str_u8("enc_derand_coins", enc_coins, JADE_KEM_ENCCOINBYTES);
  print_str_u8("ciphertext_derand", ciphertext, JADE_KEM_CIPHERTEXTBYTES);
  print_str_u8("shared_secret_derand", shared_secret_a, JADE_KEM_BYTES);



  return 0;
}

