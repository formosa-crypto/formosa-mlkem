#include "poly.h"
#include "ntt.h"

void poly_ntt_jazz(poly *r, int16_t *zetas)
{
  ntt(r->coeffs);
  poly_reduce(r);
}


