#include "jasmin_syscall.h"

#include <stdint.h>
#include <string.h>

uint8_t* __jasmin_syscall_randombytes__(uint8_t* _x, uint64_t xlen)
{
  memset(_x, 0, xlen);
  return _x;
}
