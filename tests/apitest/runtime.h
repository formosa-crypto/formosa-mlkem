#ifndef FORMOSA_MLKEM_TEST_RUNTIME_H_
# define FORMOSA_MLKEM_TEST_RUNTIME_H_

# include <sys/types.h>
# include <stdint.h>

void print_and_abort(const char *format, ...)
  __attribute__((noreturn));

void get_randomness(uint8_t *buffer, size_t len);

#endif
