require import AllCore List IntDiv CoreMap.
from Jasmin require import JModel.

require import Fq.
require import KyberPoly.
require import KyberPolyVec.
require import KyberAlgLift.
require import NTT_Fq.

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

import H_MLWE.
import M.Vector.
import M.Matrix.
import NTT_Fq.

op ntt_matrix (m : matrix) = offunm (fun (i j :int) => ntt (m.[(i,j)])).
axiom gen_matrix s :
  hoare [ Mderand.gen_matrix  :
    s = seed /\ transposed = W64.zero ==>
      ntt_matrix (H s) = lift_matrix res /\
       signed_bound768_cxq res.`1 0 256 2 /\
       signed_bound768_cxq res.`2 0 256 2 /\
       signed_bound768_cxq res.`3 0 256 2
  ].

axiom gen_matrix_t s :
  hoare [ Mderand.gen_matrix  :
    s = seed /\ transposed = W64.one ==>
      trmx (ntt_matrix (H s)) = lift_matrix res /\
       signed_bound768_cxq res.`1 0 256 2 /\
       signed_bound768_cxq res.`2 0 256 2 /\
       signed_bound768_cxq res.`3 0 256 2
  ].

lemma kg_correct sd s_ e_ : 
   hoare  [ Mderand.indcpa_keypair_compute :  
    sd = publicseed  /\ lift_vector skpv = s_ /\ lift_vector e = e_ ==> 
      lift_vector res.`1 = polyvec_ntt s_ /\
       lift_vector res.`2 = polyvec_ntt (H(sd) *^ s_ + e_)].
proc. 
seq 3 : #pre; first by auto => />.
seq 2 : (#pre /\
   lift_vector a0 = offunv (fun i => (ntt_matrix (H sd)).[(0,i)]) /\
   lift_vector a1 = offunv (fun i => (ntt_matrix (H sd)).[(1,i)]) /\
   lift_vector a2 = offunv (fun i => (ntt_matrix (H sd)).[(2,i)]) /\
   signed_bound768_cxq a0 0 256 2 /\
   signed_bound768_cxq a1 0 256 2 /\
   signed_bound768_cxq a2 0 256 2).
ecall (gen_matrix sd).
auto => /> &hr ? -> *.
rewrite /lift_vector /lift_matrix /ntt_matrix /lift_polyvec => />.
do split.
rewrite eq_vectorP // => *.
rewrite !offunvE => />.
by rewrite !offunmE => />.
rewrite eq_vectorP // => *.
rewrite !offunvE => />.
by rewrite !offunmE => />.
rewrite eq_vectorP // => *.
rewrite !offunvE => />.
by rewrite !offunmE => />.
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
