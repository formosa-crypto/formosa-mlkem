#ifndef JASMIN_SYSCALL_H
#define JASMIN_SYSCALL_H

#include <stdint.h>

uint8_t* __jasmin_syscall_randombytes__(uint8_t* x, uint64_t xlen);

#endif
