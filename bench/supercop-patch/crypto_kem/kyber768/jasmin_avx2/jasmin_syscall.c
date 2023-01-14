#include "randombytes.h"

#include <stdint.h>

uint8_t* __jasmin_syscall_randombytes__(uint8_t* _x, uint64_t xlen)
{
  randombytes(_x, xlen);
  return _x;
}

