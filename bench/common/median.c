#ifndef MEDIAN_C
#define MEDIAN_C

#include <inttypes.h>
#include <stdlib.h>
#include <stdio.h>

static void median_fr(uint64_t results[OP][LOOPS])
{
  int op, loop;
  uint64_t min;

  // get min median of LOOP runs
  for (op = 0; op < OP; op++)
  { min = results[op][0];
    for (loop = 1; loop < LOOPS; loop++)
    { if (min > results[op][loop])
      { min = results[op][loop]; } }
    results[op][0] = min;
  }
}

#endif
