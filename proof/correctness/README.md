W16extra.ec: 
- Signed W16 arithmetic lemmas.
- No dependencies. 

barrett_kyber_general.ec:
- Tight bound on Barrett refuction claimed in Kyber
- No dependencies

Montgomery.ec: 
- General results for (signed) Mongomery representation, including Barrett reduction. 
- Depends on barrett_kyber_general.ec for the tight bound of Barrett reduction.
