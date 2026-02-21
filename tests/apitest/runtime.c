/* ------------------------------------------------------------------------ */
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <sys/random.h>

#include "runtime.h"

/* ------------------------------------------------------------------------ */
void print_and_abort(const char *format, ...) {
    va_list args;

    va_start(args, format);
    vfprintf(stderr, format, args);
    va_end(args);
    fflush(stderr);
    abort();
}

/* ------------------------------------------------------------------------ */
void get_randomness(uint8_t *buffer, size_t len) {
  for (size_t total = 0; total < len; ) {
    ssize_t n = getrandom(&buffer[total], len - total, 0);
  
    if (n < 0) {
      if (errno != EINTR)
        print_and_abort("cannot get randomness");
      continue;
    }
    total += n;
  }
}
