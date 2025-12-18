require import AllCore IntDiv List.

from Jasmin require import JModel.

from CryptoSpecs require export FIPS202_Keccakf1600 FIPS202_SHA3_Spec.
from CryptoSpecs require export Keccak1600_Spec Keccakf1600_Spec.

from CryptoSpecs require import JWordList.
from CryptoSpecs require import FIPS202_Keccakf1600 FIPS202_SHA3_Spec.

from CryptoSpecs require export Keccak1600_Spec Keccakf1600_Spec.
from CryptoSpecs require import Symmetric.
require import MLKEMFCLib.

from JazzEC require import Jkem1024 WArray200.


(****************************************************************************)
(****************************************************************************)
from Keccak require import Keccakf1600_ref Keccak1600_ref.

equiv state_init_ref_eq:
 M.__state_init_ref ~ Keccak1600_Jazz.M.__state_init_ref
 : ={arg} ==> ={res}
 by sim.

equiv addratebit_avx2_eq:
 M.__addratebit_ref ~ Keccak1600_Jazz.M.__addratebit_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
(****************************************************************************)
from Keccak require import Keccak1600_fixedsizes_ref.

(****************************************************************************)
from JazzEC require import Array32 WArray32.

clone Keccak1600_fixedsizes_ref.KeccakArrayRef as A32ref
 with op _ASIZE <- 32,
      theory A <- Array32,
      theory WA <- WArray32
      proof _ASIZE_ge0 by done.

equiv a32__squeeze_array_ref_eq:
 M.a32____squeeze_ref ~ A32ref.MM.__squeeze_ref
 : ={arg} ==> ={res}
 by sim.


(****************************************************************************)
from JazzEC require import Array33 WArray33.

clone KeccakArrayRef as A33ref
 with op _ASIZE <- 33,
      theory A <- Array33,
      theory WA <- WArray33
      proof _ASIZE_ge0 by done.
     
equiv a33__absorb_ref_eq:
 M.a33____absorb_ref ~ A33ref.MM.__absorb_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array34 WArray34.

clone KeccakArrayRef as A34ref
 with op _ASIZE <- 34,
      theory A <- Array34,
      theory WA <- WArray34
      proof _ASIZE_ge0 by done.

equiv a34__absorb_ref_eq:
 M.a34____absorb_ref ~ A34ref.MM.__absorb_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array64 WArray64.

clone KeccakArrayRef as A64ref
 with op _ASIZE <- 64,
      theory A <- Array64,
      theory WA <- WArray64
      proof _ASIZE_ge0 by done.

equiv a64__absorb_ref_eq:
 M.a64____absorb_ref ~ A64ref.MM.__absorb_ref
 : ={arg} ==> ={res}
 by sim.

equiv a64__squeeze_ref_eq:
 M.a64____squeeze_ref ~ A64ref.MM.__squeeze_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array128 WArray128.

clone KeccakArrayRef as A128ref
 with op _ASIZE <- 128,
      theory A <- Array128,
      theory WA <- WArray128
      proof _ASIZE_ge0 by done.

equiv a128__squeeze_ref_eq:
 M.a128____squeeze_ref ~ A128ref.MM.__squeeze_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array168 WArray168.

clone KeccakArrayRef as A168ref
 with op _ASIZE <- 168,
      theory A <- Array168,
      theory WA <- WArray168
      proof _ASIZE_ge0 by done.
 
equiv a168__dumpstate_ref_eq:
 M.a168____dumpstate_ref ~ A168ref.MM.__dumpstate_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array1568 WArray1568.

clone KeccakArrayRef as A1568ref
 with op _ASIZE <- 1568,
      theory A <- Array1568,
      theory WA <- WArray1568
      proof _ASIZE_ge0 by done.
 
equiv a1568__absorb_ref_eq:
 M.a1568____absorb_ref ~ A1568ref.MM.__absorb_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array1536 WArray1536.

clone KeccakArrayRef as A1536ref
 with op _ASIZE <- 1536,
      theory A <- Array1536,
      theory WA <- WArray1536
      proof _ASIZE_ge0 by done.

(* 
equiv a1600__absorb_ref_eq:
 M.a1600____absorb_ref ~ A1600ref.MM.__absorb_ref
 : ={arg} ==> ={res}
 by sim.
*)

(****************************************************************************)
(****************************************************************************)

module K = {
  proc _shake256_128_33(out : W8.t Array128.t, in_0 : W8.t Array33.t) :
    W8.t Array128.t = {
    var st_s : W64.t Array25.t;
    var st : W64.t Array25.t;
    var _0 : int;
    var _1 : W64.t Array25.t;
    
    _1 <- witness;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ Keccak1600_Jazz.M.__state_init_ref(st);
    (st, _0) <@ A33ref.MM.__absorb_ref(st, 0, in_0, 31, 136);
    (_1, out) <@ A128ref.MM.__squeeze_ref(st, out, 136);
    
    return out;
  }
  proc _shake256_A32__A1600(out : W8.t Array32.t, in0 : W8.t Array32.t, in1 : W8.t Array1568.t) :
    W8.t Array32.t = {
    var st_s : W64.t Array25.t;
    var st : W64.t Array25.t;
    var _0 : int;
    var _1 : int;
    var _2 : W64.t Array25.t;
    
    _2 <- witness;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ Keccak1600_Jazz.M.__state_init_ref(st);
    (st, _0) <@ A32ref.MM.__absorb_ref(st, 0, in0, 0, 136);
    (st, _1) <@ A1568ref.MM.__absorb_ref(st, 32, in1, 31, 136);
    (_2, out) <@ A32ref.MM.__squeeze_ref(st, out, 136);
    
    return out;
  }
  proc _sha3_512A_A33 (out:W8.t Array64.t, in_0:W8.t Array33.t) : W8.t Array64.t = {
    var st_s:W64.t Array25.t;
    var st:W64.t Array25.t;
    var  _0:int;
    var  _1:W64.t Array25.t;
     _1 <- witness;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ Keccak1600_Jazz.M.__state_init_ref (st);
    (* Erased call to spill *)
    (st,  _0) <@ A33ref.MM.__absorb_ref (st, 0, in_0, 6, 72);
    (* Erased call to unspill *)
    ( _1, out) <@ A64ref.MM.__squeeze_ref (st, out, 72);
    return out;
  }
  proc _shake128_absorb34 (st:W64.t Array25.t, in_0:W8.t Array34.t) : 
  W64.t Array25.t = {
    var  _0:int;
    st <@ Keccak1600_Jazz.M.__state_init_ref (st);
    (st,  _0) <@ A34ref.MM.__absorb_ref (st, 0, in_0, 31, 168);
    return st;
  }
  proc _shake128_squeezeblock (st:W64.t Array25.t, out:W8.t Array168.t) : 
  W64.t Array25.t * W8.t Array168.t = {
    var  _0:int;
    (* Erased call to spill *)
    st <@ Keccak1600_Jazz.M._keccakf1600_ref (st);
    (* Erased call to unspill *)
    (out,  _0) <@ A168ref.MM.__dumpstate_ref (out, 0, 168, st);
    return (st, out);
  }
  proc _sha3_256A_A1568 (out:W8.t Array32.t, in_0:W8.t Array1568.t) : 
  W8.t Array32.t = {
    var st_s:W64.t Array25.t;
    var st:W64.t Array25.t;
    var  _0:int;
    var  _1:W64.t Array25.t;
     _1 <- witness;
    st <- witness;
    st_s <- witness;
    (* Erased call to spill *)
    st <- st_s;
    st <@ Keccak1600_Jazz.M.__state_init_ref (st);
    (st,  _0) <@ A1568ref.MM.__absorb_ref (st, 0, in_0, 6, 136);
    (* Erased call to unspill *)
    ( _1, out) <@ A32ref.MM.__squeeze_ref (st, out, 136);
    return out;
  }
  proc _sha3_512A_A64 (out:W8.t Array64.t, in_0:W8.t Array64.t) : W8.t Array64.t = {
    var st_s:W64.t Array25.t;
    var st:W64.t Array25.t;
    var  _0:int;
    var  _1:W64.t Array25.t;
     _1 <- witness;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ Keccak1600_Jazz.M.__state_init_ref (st);
    (* Erased call to spill *)
    (st,  _0) <@ A64ref.MM.__absorb_ref (st, 0, in_0, 6, 72);
    (* Erased call to unspill *)
    ( _1, out) <@ A64ref.MM.__squeeze_ref (st, out, 72);
    return out;
  }
}.


(****************************************************************************)
(****************************************************************************)
from JazzEC require import Array1152 Array960.


(****************************************************************************)
 
equiv sha3512_33_eq:
  M._sha3_512A_A33 ~ K._sha3_512A_A33
 : ={arg} ==> ={res}. 
by proc; inline *; sim; wp; sim.
qed.

hoare sha3512_33_h' seed : 
 K._sha3_512A_A33
 : arg.`2 = seed
 ==>
    Array32.init (fun i => res.[i]) = (SHA3_512_33_64 seed).`1
 /\ Array32.init(fun i => res.[32 + i]) = (SHA3_512_33_64 seed).`2.
proof.
proc.
ecall (A64ref.squeeze_ref_h out st 72) => /=.
wp; ecall (A33ref.absorb_ref_h [<:W8.t>] in_0 6 72).
wp; ecall (state_init_ref_h 72).
auto => /> []st2 /= ->.
move=> []/=st1 out ? Eout; rewrite /SHA3_512_33_64 /=.
have EEout: out = Array64.of_list W8.zero (SHA3_512 (to_list seed)).
 apply Array64.to_list_inj.
 rewrite Eout of_listK; smt(size_SQUEEZE1600).
split; rewrite tP => i Hi.
 by rewrite initiE 1:// get_of_list 1:// nth_take 1..2:/# EEout get_of_list /#.
by rewrite initiE 1:// get_of_list 1:// nth_drop 1..2:/# EEout /= get_of_list /#.
qed.

lemma sha3512_33_ll: islossless K._sha3_512A_A33.
proof.
proc.
call A64ref.squeeze_ref_ll.
wp; call A33ref.absorb_ref_ll.
wp; call state_init_ref_ll.
by auto.
qed.

phoare sha3512_33_ph' seed : 
 [ K._sha3_512A_A33
 : arg.`2 = seed
 ==>
    Array32.init (fun i => res.[i]) = (SHA3_512_33_64 seed).`1
 /\ Array32.init(fun i => res.[32 + i]) = (SHA3_512_33_64 seed).`2
 ] = 1%r.
proof. by conseq sha3512_33_ll (sha3512_33_h' seed). qed.

phoare sha3_512_33_64 seed : 
 [ M._sha3_512A_A33
 : arg.`2 = seed
 ==>
   Array32.init (fun i => res.[i]) = (SHA3_512_33_64 seed).`1
 /\ Array32.init(fun i => res.[32 + i]) = (SHA3_512_33_64 seed).`2
 ] = 1%r.
proof.
by conseq sha3512_33_eq (sha3512_33_ph' seed) => /> /#.
qed.

(****************************************************************************)

equiv shake128_absorb34_eq:
  M._shake128_absorb34 ~ K._shake128_absorb34
 : ={arg} ==> ={res}.
by proc; inline *; sim; wp; sim.
qed.

hoare shake128_absorb34_h' (seed : W8.t Array34.t): 
 K._shake128_absorb34
 : arg.`2 = seed
 ==> res = SHAKE128_ABSORB_34 
            (Array32.init (fun k => seed.[k]))
            (seed.[32])
            (seed.[33]).
proof.
proc.
ecall (A34ref.absorb_ref_h [<:W8.t>] in_0 31 168).
wp; ecall (state_init_ref_h 168).
auto => /> []st1 ? /= ->.
rewrite /SHAKE128_ABSORB_34; congr; 1..2:smt().
rewrite /to_list.
rewrite /sub (:34=32+2) 1:// mkseq_add 1..2://; congr.
 by apply eq_in_mkseq => i Hi /=; rewrite initiE /#.
by rewrite /mkseq -iotaredE /=.
qed.

lemma shake128_absorb34_ll: islossless K._shake128_absorb34.
proof.
proc.
call A34ref.absorb_ref_ll.
wp; call state_init_ref_ll.
by auto.
qed.

phoare shake128_absorb34_ph' (seed : W8.t Array34.t): 
 [ K._shake128_absorb34
 : arg.`2 = seed
 ==> res = SHAKE128_ABSORB_34 
            (Array32.init (fun k => seed.[k]))
            (seed.[32])
            (seed.[33])
 ] = 1%r.
proof. by conseq shake128_absorb34_ll (shake128_absorb34_h' seed). qed.

phoare shake_absorb (seed : W8.t Array34.t): 
 [ M._shake128_absorb34
 : arg.`2 = seed
 ==> res = SHAKE128_ABSORB_34 
            (Array32.init (fun k => seed.[k]))
            (seed.[32])
            (seed.[33])
 ] = 1%r.
proof. 
by conseq shake128_absorb34_eq (shake128_absorb34_ph' seed) => /> /#. 
qed. 

(****************************************************************************)
 
equiv shake128_squeezeblock_eq:
  M._shake128_squeezeblock ~ K._shake128_squeezeblock
 : ={arg} ==> ={res}.
by proc; inline *; sim; wp; sim.
qed.

hoare shake128_squeezeblock_h' state : 
 K._shake128_squeezeblock
 : arg.`1 = state
 ==> res = SHAKE128_SQUEEZE_168 state.
proof.
proc.
ecall (A168ref.dumpstate_ref_h out 0 168 st).
wp; ecall (keccakf1600_ref_h st).
auto => /> &m []st1 ? /= @/SHAKE128_SQUEEZE_168 -> ? /=; split.
 by rewrite /st_i iter1.
rewrite tP => i Hi; rewrite filliE 1:// Hi get_of_list //=.
by rewrite /squeezestate_i /st_i iter1 /squeezestate nth_take 1..2:/# state2bytesE.
qed.

lemma shake128_squeezeblock_ll: islossless K._shake128_squeezeblock.
proof.
proc.
call A168ref.dumpstate_ref_ll.
wp; call keccakf1600_ref_ll.
by auto.
qed.

phoare shake128_squeezeblock_ph' state : 
 [ K._shake128_squeezeblock
 : arg.`1 = state
 ==> res = SHAKE128_SQUEEZE_168 state
 ] = 1%r.
proof. by conseq shake128_squeezeblock_ll (shake128_squeezeblock_h' state). qed.

phoare shake_squeeze state : 
 [ M._shake128_squeezeblock
 : arg.`1 = state
 ==> res = SHAKE128_SQUEEZE_168 state
 ] = 1%r.
proof.
 by  conseq shake128_squeezeblock_eq (shake128_squeezeblock_ph' state) => /> /#.
qed. 

(****************************************************************************)
equiv shake256_128_33_eq:
  M._shake256_128_33 ~ K._shake256_128_33
 : ={arg} ==> ={res}
by proc; inline *; sim; wp; sim.

hoare shake256_128_33_h' seed : 
 K._shake256_128_33
 : arg.`2 = seed
 ==> res = SHAKE256_33_128
            (Array32.init (fun i => seed.[i]))
            seed.[32].
proof.
proc.
ecall (A128ref.squeeze_ref_h out st 136).
wp; ecall (A33ref.absorb_ref_h [<:W8.t>] in_0 31 136).
wp; call (state_init_ref_h 136).
auto => /> []st1 ? /= -> []? out /= ? H.
apply Array128.to_list_inj; rewrite H.
rewrite of_listK.
 by rewrite size_SQUEEZE1600.
rewrite /SHAKE256 /KECCAK1600; congr => //.
congr=> //.
by rewrite /to_list /mkseq -iotaredE /=.
qed.

lemma shake256_128_33_ll: islossless K._shake256_128_33.
proof.
proc.
call A128ref.squeeze_ref_ll.
wp; call A33ref.absorb_ref_ll.
wp; call state_init_ref_ll.
by auto.
qed.

phoare shake256_128_33_ph' seed : 
 [ K._shake256_128_33
 : arg.`2 = seed
 ==> res = SHAKE256_33_128
            (Array32.init (fun i => seed.[i]))
            seed.[32]
 ] = 1%r.
proof. by conseq shake256_128_33_ll (shake256_128_33_h' seed). qed.

phoare shake256_33_128 seed : 
 [ M._shake256_128_33
 : arg.`2 = seed
 ==> res = SHAKE256_33_128
            (Array32.init (fun i => seed.[i]))
            seed.[32]
 ] = 1%r.
proof. 
 by conseq shake256_128_33_eq (shake256_128_33_ph' seed) => /> /#. 
qed.

lemma shake256_33_128_ll: islossless M._shake256_128_33.
proof.
by conseq shake256_128_33_eq shake256_128_33_ll => /> /#.
qed.

(****************************************************************************)

equiv isha3_256_A1568_eq:
  M._sha3_256A_A1568 ~ K._sha3_256A_A1568
 : ={arg} ==> ={res}.
by proc; inline *; sim; wp; sim.
qed.

hoare isha3_256_A1568_h' in_: 
 K._sha3_256A_A1568
 : arg.`2 = in_
 ==> 
res = SHA3_256_1568_32
            (Array1536.init (fun k => in_.[k]),
             Array32.init (fun k => in_.[1536+k])).
proc.
ecall (A32ref.squeeze_ref_h out st 136).
wp; ecall (A1568ref.absorb_ref_h [<:W8.t>] in_0 6 136).
call (state_init_ref_h 136).
auto => /> []st at /= -> []st1 at1 /= ? H.
apply Array32.to_list_inj; rewrite H.
rewrite of_listK; first smt(size_SQUEEZE1600).
rewrite /SHA3_256 /KECCAK1600; congr => //.
congr=> //.
rewrite /to_list.
apply (eq_from_nth witness);1:smt(size_cat size_mkseq).
move => k; rewrite size_mkseq /= => *;rewrite nth_cat  /= !size_mkseq /= /max /=.
case (k<1536) => *;by rewrite !nth_mkseq 1,2:/# initiE /=/#.  
qed.

lemma isha3_256_A1568_ll: islossless K._sha3_256A_A1568.
proc.
call A32ref.squeeze_ref_ll.
wp; call A1568ref.absorb_ref_ll.
wp; call state_init_ref_ll.
by auto.
qed.

phoare isha3_256_A1568_ph' in_: 
 [ K._sha3_256A_A1568
 : arg.`2 = in_
 ==>
   res = SHA3_256_1568_32
            (Array1536.init (fun k => in_.[k]),
             Array32.init (fun k => in_.[1536+k]))
 ] = 1%r.
proof.
by conseq isha3_256_A1568_ll (isha3_256_A1568_h' in_).
qed.

phoare pkH_sha in_: 
 [ M._sha3_256A_A1568
 : arg.`2 = in_
 ==> 
  res = SHA3_256_1568_32
            (Array1536.init (fun k => in_.[k]),
             Array32.init (fun k => in_.[1536+k]))
 ] = 1%r.
proof.
by conseq isha3_256_A1568_eq (isha3_256_A1568_ph' in_) => /> /#.
qed.

(****************************************************************************)
 
equiv shake256_1600_32_eq:
  M._shake256_A32__A1600 ~ K._shake256_A32__A1600
 : ={arg} ==> ={res}.
by proc; inline *; sim; wp; sim.
qed.

from JazzEC require import Array1408 Array160.
hoare shake256_1600_32_h' in0_ in1_: 
 K._shake256_A32__A1600
 : arg.`2 = in0_ /\ arg.`3 = in1_
 ==> res = SHAKE_256_1600_32
        in0_ 
        ( Array1408.init (fun k => in1_.[k])
        , Array160.init (fun k => in1_.[1408+k])).
proc.
ecall (A32ref.squeeze_ref_h out st 136).
wp; ecall (A1568ref.absorb_ref_h (to_list in0) in1 31 136).
ecall (A32ref.absorb_ref_h [<:W8.t>] in0 0 136).
call (state_init_ref_h 136).
auto => /> []st1? /= ? ?.
rewrite !size_to_list /= => [[st2 ?]] /= -> []st3? -> /= H.
apply Array32.to_list_inj; rewrite H of_listK.
 smt(size_SQUEEZE1600).
rewrite /SHAKE256 /KECCAK1600; congr => //.
congr => //=.
rewrite -catA; congr => //.
rewrite /to_list;apply (eq_from_nth witness);1:smt(size_cat size_mkseq).
move => k; rewrite size_mkseq /= => *;rewrite nth_cat  /= !size_mkseq /= /max /=.
by case (k<1408) => *; rewrite !nth_mkseq 1,2:/# initiE /=/#.  
qed.

lemma shake256_1600_32_ll: islossless K._shake256_A32__A1600.
proof.
proc.
call A32ref.squeeze_ref_ll => /=.
call A1568ref.absorb_ref_ll.
call A32ref.absorb_ref_ll.
call state_init_ref_ll.
by auto => />.
qed. 

phoare shake256_1600_32_ph' in0_ in1_: 
 [ K._shake256_A32__A1600
 :  arg.`2 = in0_ /\ arg.`3 = in1_
 ==> res = SHAKE_256_1600_32
        in0_ 
        ( Array1408.init (fun k => in1_.[k])
        , Array160.init (fun k => in1_.[1408+k]))
 ] = 1%r.
proof.
by conseq shake256_1600_32_ll (shake256_1600_32_h' in0_ in1_).
qed. 

phoare j_shake in0_ in1_: 
 [ M._shake256_A32__A1600
 :  arg.`2 = in0_ /\ arg.`3 = in1_
 ==> res = SHAKE_256_1600_32
        in0_ 
        ( Array1408.init (fun k => in1_.[k])
        , Array160.init (fun k => in1_.[1408+k]))
 ] = 1%r.
proof.
by conseq shake256_1600_32_eq (shake256_1600_32_ph' in0_ in1_) => /> /#. 
qed.

(****************************************************************************)

equiv sha3_512_64_eq:
  M._sha3_512A_A64 ~ K._sha3_512A_A64
 : ={arg} ==> ={res}.
by proc; inline *; sim; wp; sim.
qed.


hoare sha3_512_64_h' buf:
 K._sha3_512A_A64
 : arg.`2 = buf
 ==>
   let bytes = SHA3_512_64_64
                (Array32.init (fun k => buf.[k]))
                (Array32.init (fun k => buf.[k+32]))
   in res = Array64.init
             (fun k => if k < 32
                       then bytes.`1.[k]
                       else bytes.`2.[k-32]).
proof.
proc.
ecall (A64ref.squeeze_ref_h out st 72).
wp; ecall (A64ref.absorb_ref_h [<:W8.t>] in_0 6 72).
wp; call (state_init_ref_h 72).
auto => /> []st1? /= ->.
move=> []st2 out /= ?H.
print Array64.of_listK.
rewrite -(Array64.to_listK W8.zero) H tP => i Hi.
rewrite get_of_list // /SHA3_512_64_64 initiE //=.
case: (i<32) => C.
 rewrite get_of_list 1:/# eq_sym nth_take 1..2:/#.
 congr; rewrite /SHA3_512 /KECCAK1600; congr => //; congr=>//.
 rewrite /to_list (:64=32+32) 1:// mkseq_add 1..2:/#; congr.
  by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
 by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
rewrite get_of_list 1:/# eq_sym nth_drop 1..2:/#.
rewrite /SHA3_512 /KECCAK1600; congr => //; congr=>//.
rewrite /to_list (:64=32+32) 1:// mkseq_add 1..2:/#; congr => //; congr=> //.
 by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
qed.

lemma sha3_512_64_ll: islossless K._sha3_512A_A64.
proof.
proc.
call A64ref.squeeze_ref_ll.
wp; call A64ref.absorb_ref_ll.
wp; call state_init_ref_ll.
by auto.
qed.

phoare sha3_512_64_ph' buf:
 [ K._sha3_512A_A64
 : arg.`2 = buf
 ==>
   let bytes = SHA3_512_64_64
                (Array32.init (fun k => buf.[k]))
                (Array32.init (fun k => buf.[k+32]))
   in res = Array64.init
             (fun k => if k < 32
                       then bytes.`1.[k]
                       else bytes.`2.[k-32])
 ] = 1%r.
proof.
by conseq sha3_512_64_ll (sha3_512_64_h' buf).
qed.

phoare sha_g buf: 
 [ M._sha3_512A_A64
 : arg.`2 = buf
 ==>
   let bytes = SHA3_512_64_64
                (Array32.init (fun k => buf.[k]))
                (Array32.init (fun k => buf.[k+32]))
   in res = Array64.init
             (fun k => if k < 32
                       then bytes.`1.[k]
                       else bytes.`2.[k-32])
 ] = 1%r.
proof.
by conseq sha3_512_64_eq (sha3_512_64_ph' buf) => /> /#. 
qed.
