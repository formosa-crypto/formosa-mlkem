#include "notrandombytes.h"
#include "notrandombytes1.h"
#include <stdio.h> 

//static int initialized = 0;


uint8_t* __jasmin_syscall_randombytes__(uint8_t* x, uint64_t xlen)
__asm("__jasmin_syscall_randombytes__");
uint8_t* __jasmin_syscall_randombytes__(uint8_t* x, uint64_t xlen)
{
  //   if (!initialized) {
  //   // This message confirms that the specific notrandombytes implementation is running
  //   fprintf(stderr, "DRBG INIT (jasmin): Using ChaCha20 Deterministic PRNG. - %d %d\n", sizeof(uint8_t*), sizeof(uint64_t));
  //   initialized = 1;
  // }
  notrandombytes(x,xlen);
  return x;
}


void randombytes(uint8_t* x, uint64_t xlen)
{
  // if (!initialized) {
  //   // This message confirms that the specific notrandombytes implementation is running
  //   fprintf(stderr, "DRBG INIT: Using ChaCha20 Deterministic PRNG. - %d %d\n", sizeof(uint8_t*), sizeof(uint64_t));
  //   initialized = 1;
  // }
  notrandombytes(x,xlen);
}



