#ifndef ALIGNEDCALLOC_C
#define ALIGNEDCALLOC_C

#include <stdint.h>
#include <stdlib.h>

static size_t alignedcalloc_step(size_t len)
{
  size_t step;
  step = len + (63 & (-len));
  return step;
}

static uint8_t *alignedcalloc(uint8_t** _x, size_t len)
{
  uint8_t* x = calloc(1, len + 128);
  if (!x) exit(-1);
  if(_x){ *_x = x; }
  x += 63 & (-(uintptr_t) x);
  return x;
}

#endif
