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

void jade_kem_mlkem_mlkem768_amd64_ref_keypair_derand(unsigned char *pk,
                         unsigned char *sk,
                         const unsigned char *randomness);

void jade_kem_mlkem_mlkem768_amd64_ref_enc_derand(unsigned char *c,
                     const unsigned char *m,
                     const unsigned char *pk,
                     const unsigned char *coins);


void jade_kem_mlkem_mlkem768_amd64_ref_keypair(unsigned char *pk,
                         unsigned char *sk);

void jade_kem_mlkem_mlkem768_amd64_ref_enc(unsigned char *c,
                     const unsigned char *m,
                     const unsigned char *pk);

void jade_kem_mlkem_mlkem768_amd64_ref_dec(unsigned char *m,
                     const unsigned char *c,
                     const unsigned char *sk);


#endif
