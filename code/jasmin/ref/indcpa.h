#ifndef INDCPA_H
#define INDCPA_H

#include <stdint.h>

void indcpa_keypair(unsigned char *pk,
                    unsigned char *sk,
                    const unsigned char *randomness);

void indcpa_enc(unsigned char *c,
                const unsigned char *m,
                const unsigned char *pk,
                const unsigned char *coins);

void indcpa_dec(unsigned char *m,
                const unsigned char *c,
                const unsigned char *sk);




void indcpa_keypair_jazz(unsigned char *pk,
                         unsigned char *sk,
                         const unsigned char *randomness);

void indcpa_enc_jazz(unsigned char *c,
                     const unsigned char *m,
                     const unsigned char *pk,
                     const unsigned char *coins);

void indcpa_dec_jazz(unsigned char *m,
                     const unsigned char *c,
                     const unsigned char *sk);


#endif
