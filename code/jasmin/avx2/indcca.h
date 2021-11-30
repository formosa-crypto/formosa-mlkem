#ifndef INDCCA_H
#define INDCCA_H

#include <stdint.h>

void indcca_keypair(unsigned char *pk,
                    unsigned char *sk,
                    const unsigned char *randomness);

void indcca_enc(unsigned char *c,
                unsigned char *m,
                const unsigned char *pk,
                const unsigned char *coins);

void indcca_dec(unsigned char *m,
                const unsigned char *c,
                const unsigned char *sk);


void indcca_keypair_jazz(unsigned char *pk,
                         unsigned char *sk,
                         const unsigned char *randomness);

void indcca_enc_jazz(unsigned char *c,
                     const unsigned char *m,
                     const unsigned char *pk,
                     const unsigned char *coins);

void indcca_dec_jazz(unsigned char *m,
                     const unsigned char *c,
                     const unsigned char *sk);


#endif
