#include "randombytes.h"
#include "jasmin_syscall.h"

#include <inttypes.h>
#include <stdlib.h>

void randombytes(uint8_t* x, uint64_t xlen)
{
  x = __jasmin_syscall_randombytes__(x, xlen);
  return;
}
