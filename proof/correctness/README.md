W16extra.ec: 
- Signed W16 arithmetic lemmas.
- No dependencies. 

barrett_kyber_general.ec:
- Tight bound on Barrett refuction claimed in Kyber
- No dependencies

Montgomery.ec: 
- General results for (signed) Mongomery representation, including Barrett reduction. 
- Depends on barrett_kyber_general.ec for the tight bound of Barrett reduction.

IndCpaDerand.ec:
- Starting point for correctness proof: refactored version of the extracted code
in folder extraction, proved equivalent  to the extracted code, but with 
explicit separation of randomness generation and memory encoding/decoding
to match the abstract specification in the security proof. The encryption
and decryption functions take polynomials as inputs and output (possibly
rounded) polynomials.

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