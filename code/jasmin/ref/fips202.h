#ifndef FIPS202_H
#define FIPS202_H

#include <stdint.h>

#define SHAKE128_RATE 168
#define SHAKE256_RATE 136
#define SHA3_256_RATE 136
#define SHA3_512_RATE  72

void shake128_absorb(uint64_t *s, const unsigned char *input, unsigned int inputByteLen);
void shake128_squeezeblocks(unsigned char *output, unsigned long long nblocks, uint64_t *s);

void shake256(unsigned char *output, unsigned long long outlen, const unsigned char *input,  unsigned long long inlen);

void sha3_256(unsigned char *output, const unsigned char *input,  unsigned long long inlen);
void sha3_512(unsigned char *output, const unsigned char *input,  unsigned long long inlen);



void shake256_128_33_jazz(unsigned char *output, const unsigned char *input);
void sha3512_32_jazz(unsigned char *output, const unsigned char *input);

void shake128_absorb34_jazz(uint64_t *s, const unsigned char *input);
void shake128_squeezeblock_jazz(unsigned char *output, uint64_t *s);


#endif
