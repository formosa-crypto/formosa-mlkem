import operator as op
from math import factorial as fac
from math import sqrt, log
import sys
from proba_util import *

#  (e `<*>` r) &- (s `<*>` (e1 &- cu)) &+ e2 &+ cv.

def p2_cyclotomic_final_error_distribution(ps):
    """ construct the final error distribution in our encryption scheme
    :param ps: parameter set (ParameterSet)
    """
    chis = build_centered_binomial_law(ps.ks)           # s, r
    chie = build_centered_binomial_law(ps.ke_ct)        # e1, e2
    chie_pk = build_centered_binomial_law(ps.ke)        # e
    #Rk = build_mod_switching_error_law(ps.q, ps.rqk)   # 0
    Rc = build_mod_switching_error_law(ps.q, ps.rqc)    # cu
    #chiRs = law_convolution(chis, Rk)                  # LWE+Rounding error key
    chiRe = law_convolution(chie, Rc)                   # e1 - cu

    B1 = law_product(chie_pk, chis)                     # e <*> r (1 coefficient)
    B2 = law_product(chis, chiRe)                       # s <*> (e1 - cu) (1 coefficient)

    C1 = iter_law_convolution(B1, ps.m * ps.n)          # e <*> r
    C2 = iter_law_convolution(B2, ps.m * ps.n)          # s <*> (e1 - cu) 

    C=law_convolution(C1, C2)                           # e <*> r + s <*> (e1 - cu) 

    R2 = build_mod_switching_error_law(ps.q, ps.rq2)    # cv
    F = law_convolution(R2, chie)                       # e2 + cv
    D = law_convolution(C, F)                           # full exp
    return D


def p2_cyclotomic_error_probability(ps):
    F = p2_cyclotomic_final_error_distribution(ps)
    proba = tail_probability(F, ps.q/4)
    return F, ps.n*proba

# op noise_exp_part1 s e r e1 e2 = 
#   ((e `<*>` r) &- (s `<*>` e1) &+ e2 ).

def p2_cyclotomic_final_error_distribution1(ps):
    """ construct the final error distribution in our encryption scheme
    :param ps: parameter set (ParameterSet)
    """
    chis = build_centered_binomial_law(ps.ks)           # s, r
    chie = build_centered_binomial_law(ps.ke_ct)        # e1, e2
    chie_pk = build_centered_binomial_law(ps.ke)        # e

    B1 = law_product(chie_pk, chis)          # e <*> r (1 coefficient)
    B2 = law_product(chis, chie)             # s <*> e1 (1 coefficient)

    C1 = iter_law_convolution(B1, ps.m * ps.n)       # e <*> r
    C2 = iter_law_convolution(B2, ps.m * ps.n)        # s <*> e1

    C=law_convolution(C1, C2)                        # e <*> r + s <*> e1

    D = law_convolution(C, chie)              # Final error
    return D


def p2_cyclotomic_error_probability1(ps,cu_bound, cv_bound):
    F = p2_cyclotomic_final_error_distribution1(ps)
    proba = tail_probability(F, ps.q/4 - cu_bound - cv_bound)
    return F, ps.n*proba

#op noise_exp_part2 _A s r e1 =
#  let u = m_transpose _A *^ r + e1 in
#  let cu = rnd_err_u u in
#    (s `<*>` cu).

def p2_cyclotomic_final_error_distribution2(ps):
    """ construct the final error distribution in our encryption scheme
    :param ps: parameter set (ParameterSet)
    """
    chis = build_centered_binomial_law(ps.ks)           # s
    Rc = build_mod_switching_error_law(ps.q, ps.rqc)    # cu
    B = law_product(chis, Rc)                   # s <*> cu (1 coeff)

    C = iter_law_convolution(B, ps.m * ps.n)       # s <*> cu

    return C

def p2_cyclotomic_error_probability2(ps,cu_bound):
    F = p2_cyclotomic_final_error_distribution2(ps)
    proba = tail_probability(F, cu_bound)
    return F, ps.n*proba

def p2_cyclotomic_final_error_distribution3(ps):
    """ construct the final error distribution in our encryption scheme
    :param ps: parameter set (ParameterSet)
    """
    R2 = build_mod_switching_error_law(ps.q, ps.rq2)    # cv
    return R2


def p2_cyclotomic_error_probability3(ps, cv_bound):
    F = p2_cyclotomic_final_error_distribution3(ps)
    proba = tail_probability(F, cv_bound)
    return F, ps.n*proba


#  (e `<*>` r)
def p2_cyclotomic_final_error_distribution4(ps):
    """ construct the final error distribution in our encryption scheme
    :param ps: parameter set (ParameterSet)
    """
    chis = build_centered_binomial_law(ps.ks)           # s, r
    chie_pk = build_centered_binomial_law(ps.ke)        # e

    B1 = law_product(chie_pk, chis)                     # e <*> r (1 coefficient)
    C1 = iter_law_convolution(B1, ps.m * ps.n)       # e <*> r
    return C1


def p2_cyclotomic_error_probability4(ps,cu_bound, cv_bound):
    F = p2_cyclotomic_final_error_distribution4(ps)
    proba = tail_probability(F, ps.q/4 - cu_bound - cv_bound)
    return F, ps.n*proba


#  (s `<*>` (e1 &- cu)) &+ e2

def p2_cyclotomic_final_error_distribution5(ps):
    """ construct the final error distribution in our encryption scheme
    :param ps: parameter set (ParameterSet)
    """
    chis = build_centered_binomial_law(ps.ks)           # s, r
    chie = build_centered_binomial_law(ps.ke_ct)        # e1, e2
    chie_pk = build_centered_binomial_law(ps.ke)        # e
    #Rk = build_mod_switching_error_law(ps.q, ps.rqk)   # 0
    Rc = build_mod_switching_error_law(ps.q, ps.rqc)    # cu
    #chiRs = law_convolution(chis, Rk)                  # LWE+Rounding error key
    chiRe = law_convolution(chie, Rc)                   # e1 - cu

    B2 = law_product(chis, chiRe)                       # s <*> (e1 - cu) (1 coefficient)

    C2 = iter_law_convolution(B2, ps.m * ps.n)          # s <*> (e1 - cu) 

    C=law_convolution(chie, C2)                           # s <*> (e1 - cu)  + e2

    return C


def p2_cyclotomic_error_probability5(ps, cu_bound):
    F = p2_cyclotomic_final_error_distribution5(ps)
    proba = tail_probability(F, cu_bound)
    return F, ps.n*proba

