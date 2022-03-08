W16extra.ec: 
- Signed W16 arithmetic lemmas.
- No dependencies. 

barrett_kyber_general.ec:
- Tight bound on Barrett reduction claimed in Kyber
- No dependencies

Montgomery.ec: 
- General results for (signed) Mongomery representation, including Barrett reduction. 
- Depends on barrett_kyber_general.ec for the tight bound of Barrett reduction.

Fq.ec: 
- Correction of coefficient-wise operations in IndCpaDerand and 
  connection to semantics over Fq (i.e., congruence relations + ranges).
  First connection between implementation and security proof. 
  Clones ../security/Kyber and provides concrete parameters for vector 
  sizes and randomness seed type (byte arrays). Gets the modulus
  q value from Kyber, but  then defines all constants required for 
  implementation-specific optimizations, such a Montgomery
  representation, etc. 
- Depends on all previous files.

NTT_Fq.ec:
- Specification of NTT transformation over Fq (i.e. using field
  operations). Gives ntt operators that can be linked to  algebraic
  theory, which will show implementation is doing polynomial
  multiplication equivalent to the product scanning method
  used in security/Kyber.ec. 
- Depends only on Fq.ec for the definitions of the field. 

KyberPoly.ec:
- Proves all poly computations correct with respect to the
  abstract specifications. Uses  all previous files.

KyberPolyVec.ec:
- Proves all poly computations correct with respect to the
  abstract specifications. Uses  all previous files.
  