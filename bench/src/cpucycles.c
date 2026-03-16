#ifndef CPUCYCLES_C
#define CPUCYCLES_C

#include <stdint.h>
#include <stddef.h>
#include <stdlib.h>

// try1
#define cpucycles_begin cpuid_rdtsc
#define cpucycles_end rdtscp_lfence

//try2
#if 0
#define cpucycles_begin lfence_rdtsc
#endif

static inline uint64_t cpuid_rdtsc(void)
{
    uint32_t lo, hi;

    __asm__ volatile (
        "cpuid\n\t"
        "rdtsc"
        : "=a"(lo), "=d"(hi)
        : "a"(0)
        : "rbx", "rcx", "memory"
    );

    return ((uint64_t)hi << 32) | lo;
}

static inline uint64_t lfence_rdtsc(void)
{
  uint32_t lo, hi;

  __asm__ volatile (
    "lfence\n\t"
    "rdtsc"
    : "=a"(lo), "=d"(hi)
    :
    : "memory"
  );

  return ((uint64_t)hi << 32) | lo;
}

//

static inline uint64_t rdtscp_lfence(void)
{
  uint32_t lo, hi;

  __asm__ volatile (
    "rdtscp\n\t"
    "lfence"
    : "=a"(lo), "=d"(hi)
    :
    : "rcx", "memory"
  );

  return ((uint64_t)hi << 32) | lo;
}

static int cmp_uint64(const void *a, const void *b)
{
  if(*(uint64_t *)a < *(uint64_t *)b){ return -1; }
  if(*(uint64_t *)a > *(uint64_t *)b){ return 1; }
  return 0;
}

static uint64_t cpucycles_median(uint64_t *l, size_t llen)
{
  qsort(l,llen,sizeof(uint64_t),cmp_uint64);

  if(llen%2) return l[llen/2];
  else return (l[llen/2-1]+l[llen/2])/2;
}

#endif
