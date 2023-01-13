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


void crypto_kem_keypair_jazz(unsigned char *pk,
                         unsigned char *sk,
                         const unsigned char *randomness);

void crypto_kem_enc_jazz(unsigned char *c,
                     const unsigned char *m,
                     const unsigned char *pk,
                     const unsigned char *coins);

void crypto_kem_dec_jazz(unsigned char *m,
                     const unsigned char *c,
                     const unsigned char *sk);


#endif
