require import AllCore IntDiv List.

from Jasmin require import JModel.

from CryptoSpecs require export FIPS202_Keccakf1600 FIPS202_SHA3_Spec.
from CryptoSpecs require export Keccak1600_Spec Keccakf1600_Spec.


(***THESE ASSUMPTIONS MAP SHA OPERATORS FROM SPEC TO CODE IN
    THE IMPLEMENTATION ****)

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
 M.__state_init_ref ~ Jazz_ref.M.__state_init_ref
 : ={arg} ==> ={res}
 by sim.

equiv addratebit_avx2_eq:
 M.__addratebit_ref ~ Jazz_ref.M.__addratebit_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
(****************************************************************************)
from Keccak require Keccak1600_array_ref.

(****************************************************************************)
from JazzEC require import Array32 WArray32.

clone Keccak1600_array_ref.KeccakArrayRef as A32ref
 with op aSIZE <- 32,
      theory A <- Array32,
      theory WA <- WArray32
      proof aSIZE_ge0 by done.

equiv a32__squeeze_array_ref_eq:
 M.a32____squeeze_array_ref ~ A32ref.M(A32ref.P).__squeeze_array_ref
 : ={arg} ==> ={res}
 by sim.


(****************************************************************************)
from JazzEC require import Array33 WArray33.

clone Keccak1600_array_ref.KeccakArrayRef as A33ref
 with op aSIZE <- 33,
      theory A <- Array33,
      theory WA <- WArray33
      proof aSIZE_ge0 by done.

equiv a33__absorb_array_ref_eq:
 M.a33____absorb_array_ref ~ A33ref.M(A33ref.P).__absorb_array_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array34 WArray34.

clone Keccak1600_array_ref.KeccakArrayRef as A34ref
 with op aSIZE <- 34,
      theory A <- Array34,
      theory WA <- WArray34
      proof aSIZE_ge0 by done.

equiv a34__absorb_array_ref_eq:
 M.a34____absorb_array_ref ~ A34ref.M(A34ref.P).__absorb_array_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array64 WArray64.

clone Keccak1600_array_ref.KeccakArrayRef as A64ref
 with op aSIZE <- 64,
      theory A <- Array64,
      theory WA <- WArray64
      proof aSIZE_ge0 by done.

equiv a64__absorb_array_ref_eq:
 M.a64____absorb_array_ref ~ A64ref.M(A64ref.P).__absorb_array_ref
 : ={arg} ==> ={res}
 by sim.

equiv a64__squeeze_array_ref_eq:
 M.a64____squeeze_array_ref ~ A64ref.M(A64ref.P).__squeeze_array_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array128 WArray128.

clone Keccak1600_array_ref.KeccakArrayRef as A128ref
 with op aSIZE <- 128,
      theory A <- Array128,
      theory WA <- WArray128
      proof aSIZE_ge0 by done.

equiv a128__squeeze_array_ref_eq:
 M.a128____squeeze_array_ref ~ A128ref.M(A128ref.P).__squeeze_array_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array168 WArray168.

clone Keccak1600_array_ref.KeccakArrayRef as A168ref
 with op aSIZE <- 168,
      theory A <- Array168,
      theory WA <- WArray168
      proof aSIZE_ge0 by done.

equiv a168__dumpstate_array_ref_eq:
 M.a168____dumpstate_array_ref ~ A168ref.M(A168ref.P).__dumpstate_array_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array1568 WArray1568 Array1536.

clone Keccak1600_array_ref.KeccakArrayRef as A1568ref
 with op aSIZE <- 1568,
      theory A <- Array1568,
      theory WA <- WArray1568
      proof aSIZE_ge0 by done.
equiv a1568__absorb_array_ref_eq:
 M.a1568____absorb_array_ref ~ A1568ref.M(A1568ref.P).__absorb_array_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array1600 WArray1600 Array1408 Array160.

clone Keccak1600_array_ref.KeccakArrayRef as A1600ref
 with op aSIZE <- 1600,
      theory A <- Array1600,
      theory WA <- WArray1600
      proof aSIZE_ge0 by done.

(****************************************************************************)
(****************************************************************************)
print M.
module K = {
  proc _shake256_128_33(out : W8.t Array128.t, in_0 : W8.t Array33.t) :
    W8.t Array128.t = {
    var st_s : W64.t Array25.t;
    var st : W64.t Array25.t;
    var offset : W64.t;
    var _0 : int;
    var _1 : W64.t;
    var _2 : W64.t;
    var _3 : W64.t Array25.t;
    
    _3 <- witness;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ Jazz_ref.M.__state_init_ref(st);
    offset <- W64.zero;
    (st, _0, _1) <@
      A33ref.M(A33ref.P).__absorb_array_ref(st, 0, in_0, offset, 33, 136, 31);
    offset <- W64.zero;
    (out, _2, _3) <@
      A128ref.M(A128ref.P).__squeeze_array_ref(out, offset, 128, st, 136);
    
    return out;
  }
  
  proc _shake256_1600_32(out : W8.t Array32.t, in0 : W8.t Array32.t, in1 : W8.t Array1568.t) : W8.t Array32.t = {
    var st_s : W64.t Array25.t;
    var st : W64.t Array25.t;
    var aT : int;
    var _0 : W64.t;
    var _1 : int;
    var _2 : W64.t;
    var _3 : W64.t;
    var _4 : W64.t Array25.t;
    
    _4 <- witness;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ Jazz_ref.M.__state_init_ref(st);
    (st, _1, _2) <@ A32ref.M(A32ref.P).__absorb_array_ref(st, 0, in0, W64.zero, 32, 136, 0);
    (st, _1, _0) <@ A1568ref.M(A1568ref.P).__absorb_array_ref(st, 32, in1, W64.zero, 1568, 136, 31);
    (out, _3, _4) <@ A32ref.M(A32ref.P).__squeeze_array_ref(out, W64.zero, 32, st, 136);
    
    return out;
  }
  
  proc _sha3512_33(out : W8.t Array64.t, in_0 : W8.t Array33.t) :
    W8.t Array64.t = {
    var st_s : W64.t Array25.t;
    var st : W64.t Array25.t;
    var offset : W64.t;
    var _0 : int;
    var _1 : W64.t;
    var _2 : W64.t;
    var _3 : W64.t Array25.t;
    
    _3 <- witness;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ Jazz_ref.M.__state_init_ref(st);
    offset <- W64.zero;
    (st, _0, _1) <@
      A33ref.M(A33ref.P).__absorb_array_ref(st, 0, in_0, offset, 33, 72, 6);
    offset <- W64.zero;
    (out, _2, _3) <@ A64ref.M(A64ref.P).__squeeze_array_ref(out, offset, 64, st, 72);
    
    return out;
  }
  
  proc _shake128_absorb34(st : W64.t Array25.t, in_0 : W8.t Array34.t) :
    W64.t Array25.t = {
    var offset : W64.t;
    var _0 : int;
    var _1 : W64.t;
    
    st <@ Jazz_ref.M.__state_init_ref(st);
    offset <- W64.zero;
    (st, _0, _1) <@
      A34ref.M(A34ref.P).__absorb_array_ref(st, 0, in_0, offset, 34, 168, 31);
    
    return st;
  }
  
  proc _shake128_squeezeblock(st : W64.t Array25.t, out : W8.t Array168.t) :
    W64.t Array25.t * W8.t Array168.t = {
    var offset : W64.t;
    var _0 : W64.t;
    
    st <@ Jazz_ref.M._keccakf1600_ref(st);
    offset <- W64.zero;
    (out, _0) <@ A168ref.M(A168ref.P).__dumpstate_array_ref(out, offset, 168, st);
    
    return (st, out);
  }
  
  proc _isha3_256_A1568(out : W8.t Array32.t, in_0 :  W8.t Array1568.t) : W8.t Array32.t = {
    var st_s : W64.t Array25.t;
    var st : W64.t Array25.t;
    var offset : W64.t;
    var _0 : int;
    var _1 : W64.t;
    var _2 : W64.t;
    var _3 : W64.t Array25.t;
    
    _3 <- witness;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ Jazz_ref.M.__state_init_ref(st);
    (st, _0, _1) <@ A1568ref.M(A1568ref.P).__absorb_array_ref(st, 0, in_0, W64.zero, 1568, 136, 6);
    offset <- W64.zero;
    (out, _2, _3) <@ A32ref.M(A32ref.P).__squeeze_array_ref(out, offset, 32, st, 136);
    
    return out;
  }
  
  proc _sha3_512_64(out : W8.t Array64.t, in_0 : W8.t Array64.t) :
    W8.t Array64.t = {
    var st_s : W64.t Array25.t;
    var st : W64.t Array25.t;
    var offset : W64.t;
    var _0 : int;
    var _1 : W64.t;
    var _2 : W64.t;
    var _3 : W64.t Array25.t;
    
    _3 <- witness;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ Jazz_ref.M.__state_init_ref(st);
    offset <- W64.zero;
    (st, _0, _1) <@
      A64ref.M(A64ref.P).__absorb_array_ref(st, 0, in_0, offset, 64, 72, 6);
    offset <- W64.zero;
    (out, _2, _3) <@ A64ref.M(A64ref.P).__squeeze_array_ref(out, offset, 64, st, 72);
    
    return out;
  }
}.


(****************************************************************************)
(****************************************************************************)
from JazzEC require import Array1152 Array960.


(****************************************************************************)

equiv sha3512_33_eq:
  M._sha3_512A_A33 ~ K._sha3512_33
 : ={arg} ==> ={res}. 
by proc; inline *; sim; wp; sim.
qed.

hoare sha3512_33_h' seed : 
 K._sha3512_33
 : arg.`2 = seed
 ==>
    Array32.init (fun i => res.[i]) = (SHA3_512_33_64 seed).`1
 /\ Array32.init(fun i => res.[32 + i]) = (SHA3_512_33_64 seed).`2.
proof.
proc.
ecall (A64ref.squeeze_array_ref_h out offset 64 st 72) => /=.
wp; ecall (A33ref.absorb_array_ref_h [<:W8.t>] in_0 offset 33 72 6).
wp; ecall (state_init_ref_h 72).
auto => /> &m []st2 ?? /= -> ?.
move=> []out?st1 /= Eout ??; rewrite /SHA3_512_33_64 /=.
have EEout: out = Array64.of_list W8.zero (SHA3_512 (to_list seed)).
 rewrite Eout tP => i Hi.
 rewrite filliE 1:/# Hi /= get_of_list 1://; congr.
 rewrite /SHA3_512 /KECCAK1600; congr; 1:smt(); congr; 1..2:smt().
 by apply eq_in_mkseq => k Hk.
split; rewrite tP => i Hi.
 by rewrite initiE 1:// get_of_list 1:// nth_take 1..2:/# EEout get_of_list /#.
by rewrite initiE 1:// get_of_list 1:// nth_drop 1..2:/# EEout /= get_of_list /#.
qed.

lemma sha3512_33_ll: islossless K._sha3512_33.
proof.
proc.
call A64ref.squeeze_array_ref_ll.
wp; call A33ref.absorb_array_ref_ll.
wp; call state_init_ref_ll.
by auto.
qed.

phoare sha3512_33_ph' seed : 
 [ K._sha3512_33
 : arg.`2 = seed
 ==>
    Array32.init (fun i => res.[i]) = (SHA3_512_33_64 seed).`1
 /\ Array32.init(fun i => res.[32 + i]) = (SHA3_512_33_64 seed).`2
 ] = 1%r.
proof. by conseq sha3512_33_ll (sha3512_33_h' seed). qed.

phoare sha3_512_33_64 seed : 
 [ Jkem1024.M._sha3_512A_A33
 : arg.`2 = seed
 ==>
   Array32.init (fun i => res.[i]) = (SHA3_512_33_64 seed).`1
 /\ Array32.init(fun i => res.[32 + i]) = (SHA3_512_33_64 seed).`2
 ] = 1%r.
proof. by conseq sha3512_33_eq (sha3512_33_ph' seed) => /> /#. qed.

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
ecall (A34ref.absorb_array_ref_h [<:W8.t>] in_0 offset 34 168 31).
wp; ecall (state_init_ref_h 168).
auto => /> []st1 ?? /= -> ?.
rewrite /SHAKE128_ABSORB_34; congr; 1..2:smt().
rewrite /sub (:34=32+2) 1:// mkseq_add 1..2://; congr.
 by apply eq_in_mkseq => i Hi /=; rewrite initiE /#.
by rewrite /mkseq -iotaredE /=.
qed.

lemma shake128_absorb34_ll: islossless K._shake128_absorb34.
proof.
proc.
call A34ref.absorb_array_ref_ll.
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
 [ Jkem1024.M._shake128_absorb34
 : arg.`2 = seed
 ==> res = SHAKE128_ABSORB_34 
            (Array32.init (fun k => seed.[k]))
            (seed.[32])
            (seed.[33])
 ] = 1%r.
proof. by conseq shake128_absorb34_eq (shake128_absorb34_ph' seed) => /> /#. qed.

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
ecall (A168ref.dumpstate_array_ref_h out offset 168 st).
wp; ecall (keccakf1600_ref_h st).
auto => /> &m []st1 ? /= @/SHAKE128_SQUEEZE_168 -> ? /=; split.
 by rewrite /st_i iter1.
rewrite tP => i Hi; rewrite filliE 1:// Hi get_of_list //=.
by rewrite /squeezestate_i /st_i iter1 /squeezestate nth_take 1..2:/# state2bytesE.
qed.

lemma shake128_squeezeblock_ll: islossless K._shake128_squeezeblock.
proof.
proc.
call A168ref.dumpstate_array_ref_ll.
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
 [ Jkem1024.M._shake128_squeezeblock
 : arg.`1 = state
 ==> res = SHAKE128_SQUEEZE_168 state
 ] = 1%r.
proof. by conseq shake128_squeezeblock_eq (shake128_squeezeblock_ph' state) => /> /#. qed.

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
ecall (A128ref.squeeze_array_ref_h out offset 128 st 136).
wp; ecall (A33ref.absorb_array_ref_h [<:W8.t>] in_0 offset 33 136 31).
wp; call (state_init_ref_h 136).
auto => /> &m []st1 ?? /= ->?.
move=> []out ? ? /= -> ??.
rewrite tP=> i Hi; rewrite filliE 1:/# Hi /SHAKE256_33_128 get_of_list 1:/# /=.
congr; rewrite /SHAKE256 /KECCAK1600; congr; 1:smt().
congr; 1..2:smt().
rewrite /sub (:33=32+1) 1:// mkseq_add 1..2://; congr.
 by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
by rewrite /mkseq -iotaredE /=.
qed.

lemma shake256_128_33_ll: islossless K._shake256_128_33.
proof.
proc.
call A128ref.squeeze_array_ref_ll.
wp; call A33ref.absorb_array_ref_ll.
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
 [ Jkem1024.M._shake256_128_33
 : arg.`2 = seed
 ==> res = SHAKE256_33_128
            (Array32.init (fun i => seed.[i]))
            seed.[32]
 ] = 1%r.
proof. by conseq shake256_128_33_eq (shake256_128_33_ph' seed) => /> /#. qed.

lemma shake256_33_128_ll: islossless M._shake256_128_33.
proof. by conseq shake256_128_33_eq shake256_128_33_ll => /> /#. qed.

(****************************************************************************)
equiv isha3_256_A1568_eq:
  M._sha3_256A_A1568 ~ K._isha3_256_A1568
 : ={arg} ==> ={res}.
by proc; inline *; sim; wp; sim.
qed.

hoare isha3_256_A1568_h' in_: 
 K._isha3_256_A1568
 : arg.`2 = in_
 ==> 
res = SHA3_256_1568_32
            (Array1536.init (fun k => in_.[k]),
             Array32.init (fun k => in_.[1536+k])).
proof.
proc.
ecall (A32ref.squeeze_array_ref_h out offset 32 st 136).
wp; ecall (A1568ref.absorb_array_ref_h [<:W8.t>]  in_0 W64.zero  1568 136 6).
call (state_init_ref_h 136).
auto => /> &m. 
move=> []out ?? -> /= ??H0 H1 H2; rewrite tP => i Hi.
rewrite /SHA3_256_1184_32 get_of_list 1:// /=.
rewrite /SHA3_256 /KECCAK1600 H0 fillE /= initiE //= Hi /=; congr; congr; 1:smt(); congr; 1..2:smt().
rewrite /sub /to_list;apply (eq_from_nth witness);1:smt(size_cat size_mkseq).
move => k; rewrite size_mkseq /= => *;rewrite nth_cat  /= !size_mkseq /= /max /=.
case (k<1536) => *;by rewrite !nth_mkseq 1,2:/# initiE /=/#.  
qed.

lemma isha3_256_A1568_ll: islossless K._isha3_256_A1568.
proc. 
call A32ref.squeeze_array_ref_ll.
wp; call A1568ref.absorb_array_ref_ll.
wp; call state_init_ref_ll.
by auto.
qed.

phoare isha3_256_A1568_ph' in_: 
 [ K._isha3_256_A1568
 : arg.`2 = in_
 ==>
   res = SHA3_256_1568_32
            (Array1536.init (fun k => in_.[k]),
             Array32.init (fun k => in_.[1536+k]))
 ] = 1%r.
proof. by conseq isha3_256_A1568_ll (isha3_256_A1568_h' in_). qed.

phoare pkH_sha in_: 
 [ Jkem1024.M._sha3_256A_A1568
 : arg.`2 = in_
 ==> 
  res = SHA3_256_1568_32
            (Array1536.init (fun k => in_.[k]),
             Array32.init (fun k => in_.[1536+k]))
 ] = 1%r.
proof. by conseq isha3_256_A1568_eq (isha3_256_A1568_ph' in_) => /> /#. qed.

(****************************************************************************)
print M.
equiv shake256_1600_32_eq:
  M._shake256_A32__A1600 ~ K._shake256_1600_32
 : ={arg} ==> ={res}.
by proc; inline *; sim; wp; sim.
qed.

hoare shake256_1600_32_h' in0_ in1_: 
 K._shake256_1600_32
 : arg.`2 = in0_ /\ arg.`3 = in1_
 ==> res = SHAKE_256_1600_32
        in0_ 
        ( Array1408.init (fun k => in1_.[k])
        , Array160.init (fun k => in1_.[1408+k])).
proc. 
ecall (A32ref.squeeze_array_ref_h out W64.zero 32 st 136).
wp; ecall (A1568ref.absorb_array_ref_h (to_list in0)  in1 W64.zero  1568 136 31).
ecall (A32ref.absorb_array_ref_h [<:W8.t>] in0 W64.zero 32 136 0).
call (state_init_ref_h 136).
auto => /> &hr out1; rewrite !size_to_list /= => ???? out2 H2? out3 ->??. 
rewrite /SHAKE_256_1120_32 tP => i Hi /=; rewrite initiE 1:// /= fillE initiE 1:/# /= Hi /= /SHAKE256 /KECCAK1600; congr;congr;1:smt(). 
rewrite H2;congr;1,2:by smt().
rewrite -catA; congr.
rewrite /sub /to_list;apply (eq_from_nth witness);1:smt(size_cat size_mkseq).
move => k; rewrite size_mkseq /= => *;rewrite nth_cat  /= !size_mkseq /= /max /=.
case (k<1408) => *;by rewrite !nth_mkseq 1,2:/# initiE /=/#.  
qed. 

lemma shake256_1600_32_ll: islossless K._shake256_1600_32.
proof.
proc.
call A32ref.squeeze_array_ref_ll => /=.
call A1568ref.absorb_array_ref_ll.
call A32ref.absorb_array_ref_ll.
call state_init_ref_ll.
by auto => />.
qed. 

phoare shake256_1600_32_ph' in0_ in1_: 
 [ K._shake256_1600_32
 :  arg.`2 = in0_ /\ arg.`3 = in1_
 ==> res = SHAKE_256_1600_32
        in0_ 
        ( Array1408.init (fun k => in1_.[k])
        , Array160.init (fun k => in1_.[1408+k]))
 ] = 1%r.
proof. by conseq shake256_1600_32_ll (shake256_1600_32_h' in0_ in1_). qed.

phoare j_shake in0_ in1_: 
 [ Jkem1024.M._shake256_A32__A1600
 :  arg.`2 = in0_ /\ arg.`3 = in1_
 ==> res = SHAKE_256_1600_32
        in0_ 
        ( Array1408.init (fun k => in1_.[k])
        , Array160.init (fun k => in1_.[1408+k]))
 ] = 1%r.
proof. by conseq shake256_1600_32_eq (shake256_1600_32_ph' in0_ in1_) => /> /#. qed.

(****************************************************************************)
print M.
equiv sha3_512_64_eq:
  M._sha3_512A_A64 ~ K._sha3_512_64
 : ={arg} ==> ={res}.
by proc; inline *; sim; wp; sim.
qed.

hoare sha3_512_64_h' buf:
 K._sha3_512_64
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
ecall (A64ref.squeeze_array_ref_h out offset 64 st 72).
wp; ecall (A64ref.absorb_array_ref_h [<:W8.t>] in_0 offset 64 72 6).
wp; call (state_init_ref_h 72).
auto => /> &m []st1 ?? /= ->?.
move=> []out ? ? /= -> ??.
rewrite tP=> i Hi; rewrite filliE 1:/# Hi /SHA3_512_64_64 initiE 1:/# /=.
rewrite /SHA3_512 /KECCAK1600; case:(i<32) =>C.
 rewrite get_of_list 1:/# !nth_take 1..6:/# /=; congr; congr; 1:smt().
 congr; 1..2:smt().
  rewrite /sub (:64=32+32) 1:// mkseq_add 1..2:/#; congr.
   by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
  by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
 smt().
rewrite get_of_list 1:/# !nth_drop 1..2:/# /=; congr; congr; 1:smt().
congr; 1..2:smt().
rewrite /sub (:64=32+32) 1:// mkseq_add 1..2:/#; congr.
 by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
qed.

lemma sha3_512_64_ll: islossless K._sha3_512_64.
proof.
proc.
call A64ref.squeeze_array_ref_ll.
wp; call A64ref.absorb_array_ref_ll.
wp; call state_init_ref_ll.
by auto.
qed.

phoare sha3_512_64_ph' buf:
 [ K._sha3_512_64
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
proof. by conseq sha3_512_64_ll (sha3_512_64_h' buf). qed.

phoare sha_g buf: 
 [ Jkem1024.M._sha3_512A_A64
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
proof. by conseq sha3_512_64_eq (sha3_512_64_ph' buf) => /> /#. qed.
