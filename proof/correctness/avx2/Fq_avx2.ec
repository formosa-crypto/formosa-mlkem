require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel JWord.
require import Fq Array16 Array16p.
require import W16extra WArray512 WArray32 WArray16.
require import Ops.
require import List_hakyber.
require import KyberPoly_avx2.

pragma +oldip.

theory Fq_avx2.

import Fq.
import SignedReductions.
import Kyber_.
import ZModField.

op lift_array16 (p: W16.t Array16.t) =
  Array16.map (fun x => (W16.to_sint x)) p.

lemma barret_red16x_corr_h a:
  hoare[ Mavx2_prevec.red16x :
       a = lift_array16 r ==>
       forall k, 0 <= k < 16 => W16.to_sint res.[k] = BREDC a.[k] 26].
proof.
proc.
admit. (* FIXME *)
qed.

end Fq_avx2.
