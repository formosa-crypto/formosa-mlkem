(* ML-KEM-1024 variant pinning for the avx2 correctness proofs.
   Mirrors formosa-mldsa-correctness's mldsa_65_prelude.ec (axiom kvec = 6).
   With kvec pinned, param_sets (Parameters.ec) determines du/dv/eta1/eta2. *)
require import AllCore.
from Spec require import Parameters.

axiom kvec_val : kvec = 4.
