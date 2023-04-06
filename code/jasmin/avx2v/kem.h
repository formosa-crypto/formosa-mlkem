#ifndef CRYPTO_KEM_H
#define CRYPTO_KEM_H

#include <stdint.h>

void crypto_kem_keypair(unsigned char *pk,
                    unsigned char *sk,
                    const unsigned char *randomness);

void crypto_kem_enc(unsigned char *c,
                unsigned char *m,
                const unsigned char *pk,
                const unsigned char *coins);

void crypto_kem_dec(unsigned char *m,
                const unsigned char *c,
                const unsigned char *sk);


void jade_kem_kyber_kyber768_amd64_avx2v_keypair(unsigned char *pk,
                                                unsigned char *sk);

void jade_kem_kyber_kyber768_amd64_avx2v_enc(unsigned char *c,
                                            const unsigned char *m,
                                            const unsigned char *pk);

void jade_kem_kyber_kyber768_amd64_avx2v_dec(unsigned char *m,
                                            const unsigned char *c,
                                            const unsigned char *sk);

void randombytes(uint8_t* x, uint64_t xlen);


#endif
