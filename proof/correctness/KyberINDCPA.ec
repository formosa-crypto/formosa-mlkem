require import AllCore List IntDiv CoreMap.
from Jasmin require import JModel.

require import Fq.
require import KyberPoly.
require import KyberPolyVec.

require import Array4 Array5 Array24 Array25 Array32 Array33 Array34 Array64
               Array128 Array168 Array256 Array768.
require import WArray20 WArray32 WArray33 WArray34 WArray40 WArray64
               WArray128 WArray168 WArray192 WArray200 WArray256 WArray512
               WArray1536.

require import IndcpaDerand.

import MLWE_PKE.
import MLWE_PKE.

(* WE DEFINE ALTERNATIVE VERSIONS OF THE EXTRACTED CODE TO
   MODULARIZE RANDOMNESS SAMPLINGS *)


(***************************************************)
(* Now we can prove that the deterministic 
   computations are correct assuming that H maps
   to gen_matrix.
*)

import Fq.Kyber_.
import MLWEPKE.
import KyberPoly KyberPolyVec.

op lift_vector(vec: W16.t Array768.t) : H_MLWE.M.vector =
    H_MLWE.M.Vector.offunv (fun i => lift_polyvec vec i).

op lift_matrix( rows : W16.t Array768.t * W16.t Array768.t * W16.t Array768.t) : 
     H_MLWE.M.Matrix.matrix =
     H_MLWE.M.Matrix.offunm (fun i j => 
        if i = 0
        then lift_polyvec rows.`1 j
        else if i = 1
             then lift_polyvec rows.`2 j
             else lift_polyvec rows.`3 j).

axiom gen_matrix s :
  hoare [ Mderand.gen_matrix  :
    s = seed /\ transposed = W64.zero ==>
      H_MLWE.H(s) = lift_matrix res
  ].

axiom gen_matrix_t s :
  hoare [ Mderand.gen_matrix  :
    s = seed /\ transposed = W64.one ==>
      H_MLWE.H(s) = H_MLWE.M.Matrix.trmx (lift_matrix res)
  ].

lemma kg_correct sd s_ e_ : 
   hoare  [ Mderand.indcpa_keypair_compute :  
    sd = publicseed  /\ lift_vector skpv = s_ /\ lift_vector e = e_ ==> 
      lift_vector res.`1 = polyvec_ntt s_ /\
       lift_vector res.`2 = H_MLWE.M.Vector.(+) (H_MLWE.M.Matrix.( *^) (H_MLWE.H sd) s_) e_
       ].
proc.
admitted.


(***************************************************)
(* Finally, under some assumptions on sampling 
   we should get full equivalences.
*)

section.

declare module H : H_MLWE.H_MLWE_ROM.POracle.

lemma kg_corr : 
  equiv [ MLWE_PKE(H).kg ~ Mderand.kg :
     true ==> true ].
proc.
inline Mderand.indcpa_keypair_jazz.
have indhop : 
   equiv [ MLWE_PKE(H).kg ~ Mderand.indcpa_keypair_jazz :
     true ==> true ].
proc.
admitted.

lemma enc_corr &m : 
  equiv [ MLWE_PKE(H).enc ~ Mderand.indcpa_enc_jazz :
     true ==> true ].
proc.
admitted.


lemma dec_corr &m : 
  equiv [ MLWE_PKE(H).dec ~ Mderand.indcpa_dec_jazz :
     true ==> true ].
proc.
admitted.

end section.
