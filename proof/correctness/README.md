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
- Correction of coefficient-operations and connection to semantics
  over Fq (i.e., congruence relations + ranges).
  First connection between implementation and security proof. 
  Clones ../security/Kyber and provides concrete parameters for vector 
  sizes and randomness seed type (byte arrays). Gets the modulus
  q value from Kyber, but  then defines all constants required for 
  implementation-specific optimizations, such a Montgomery
  representation, etc. 
  