#ifndef CBD_H
#define CBD_H

#include "poly.h"

void poly_cbd_eta1(poly *r, const uint8_t buf[MLKEM_ETA1*MLKEM_N/4]);
void poly_cbd_eta2(poly *r, const uint8_t buf[MLKEM_ETA2*MLKEM_N/4]);

#endif
