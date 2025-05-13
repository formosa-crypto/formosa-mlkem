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
 M(Syscall).__state_init_ref ~ Jazz_ref.M.__state_init_ref
 : ={arg} ==> ={res}
 by sim.

equiv addratebit_avx2_eq:
 M(Syscall).__addratebit_ref ~ Jazz_ref.M.__addratebit_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
(****************************************************************************)
from Keccak require import Keccak1600_imem_ref.

equiv absorb_imem_ref_eq:
 M(Syscall).__absorb_imem_ref ~ Jazz_ref.M.__absorb_imem_ref
 : ={arg,Glob.mem} ==> ={res,Glob.mem}
 by sim.

equiv squeeze_imem_ref_eq:
 M(Syscall).__squeeze_imem_ref ~ Jazz_ref.M.__squeeze_imem_ref
 : ={arg,Glob.mem} ==> ={res,Glob.mem}
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
 M(Syscall).a32____squeeze_array_ref ~ A32ref.M(A32ref.P).__squeeze_array_ref
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
 M(Syscall).a33____absorb_array_ref ~ A33ref.M(A33ref.P).__absorb_array_ref
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
 M(Syscall).a34____absorb_array_ref ~ A34ref.M(A34ref.P).__absorb_array_ref
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
 M(Syscall).a64____absorb_array_ref ~ A64ref.M(A64ref.P).__absorb_array_ref
 : ={arg} ==> ={res}
 by sim.

equiv a64__squeeze_array_ref_eq:
 M(Syscall).a64____squeeze_array_ref ~ A64ref.M(A64ref.P).__squeeze_array_ref
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
 M(Syscall).a128____squeeze_array_ref ~ A128ref.M(A128ref.P).__squeeze_array_ref
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
 M(Syscall).a168____dumpstate_array_ref ~ A168ref.M(A168ref.P).__dumpstate_array_ref
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
(****************************************************************************)

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
  
  proc _shake256_1120_32(out : W64.t, in0 : W64.t, in1 : W64.t) : unit = {
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
    (st, _1, _0) <@ Jazz_ref.M.__absorb_imem_ref(st, 0, in0, 32, 136, 0);
    (st, _1, _2) <@ Jazz_ref.M.__absorb_imem_ref(st, 32, in1, 1088, 136, 31);
    (_3, _4) <@ Jazz_ref.M.__squeeze_imem_ref(out, 32, st, 136);
    
    return tt;
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
  
  proc _isha3_256_M1184(out : W8.t Array32.t, in_0 : W64.t) : W8.t Array32.t = {
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
    (st, _0, _1) <@ Jazz_ref.M.__absorb_imem_ref(st, 0, in_0, 1184, 136, 6);
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
  M(Syscall)._sha3512_33 ~ K._sha3512_33
 : ={arg} ==> ={res}
by sim.

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
 [ Jkem1024.M(Jkem1024.Syscall)._sha3512_33
 : arg.`2 = seed
 ==>
   Array32.init (fun i => res.[i]) = (SHA3_512_33_64 seed).`1
 /\ Array32.init(fun i => res.[32 + i]) = (SHA3_512_33_64 seed).`2
 ] = 1%r.
proof. by conseq sha3512_33_eq (sha3512_33_ph' seed) => /> /#. qed.

(****************************************************************************)
equiv shake128_absorb34_eq:
  M(Syscall)._shake128_absorb34 ~ K._shake128_absorb34
 : ={arg} ==> ={res}
by sim.

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
 [ Jkem1024.M(Jkem1024.Syscall)._shake128_absorb34
 : arg.`2 = seed
 ==> res = SHAKE128_ABSORB_34 
            (Array32.init (fun k => seed.[k]))
            (seed.[32])
            (seed.[33])
 ] = 1%r.
proof. by conseq shake128_absorb34_eq (shake128_absorb34_ph' seed) => /> /#. qed.

(****************************************************************************)
equiv shake128_squeezeblock_eq:
  M(Syscall)._shake128_squeezeblock ~ K._shake128_squeezeblock
 : ={arg} ==> ={res}
by sim.

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
 [ Jkem1024.M(Jkem1024.Syscall)._shake128_squeezeblock
 : arg.`1 = state
 ==> res = SHAKE128_SQUEEZE_168 state
 ] = 1%r.
proof. by conseq shake128_squeezeblock_eq (shake128_squeezeblock_ph' state) => /> /#. qed.

(****************************************************************************)
equiv shake256_128_33_eq:
  M(Syscall)._shake256_128_33 ~ K._shake256_128_33
 : ={arg} ==> ={res}
by sim.

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
 [ Jkem1024.M(Jkem1024.Syscall)._shake256_128_33
 : arg.`2 = seed
 ==> res = SHAKE256_33_128
            (Array32.init (fun i => seed.[i]))
            seed.[32]
 ] = 1%r.
proof. by conseq shake256_128_33_eq (shake256_128_33_ph' seed) => /> /#. qed.

lemma shake256_33_128_ll: islossless M(Syscall)._shake256_128_33.
proof. by conseq shake256_128_33_eq shake256_128_33_ll => /> /#. qed.

(****************************************************************************)
equiv isha3_256_M1536_eq:
  M(Syscall)._isha3_256_M1408 ~ K._isha3_256_M1536
 : ={arg, Glob.mem} ==> ={res, Glob.mem}
 by sim.

hoare isha3_256_M1184_h' _mem _ptr: 
 K._isha3_256_M1184
 : arg.`2 = W64.of_int _ptr
 /\ valid_ptr _ptr 1184
 /\ Glob.mem = _mem
 ==> Glob.mem = _mem
  /\ res = SHA3_256_1184_32
            (Array1152.init (fun k => _mem.[_ptr+k]),
             Array32.init (fun k => _mem.[_ptr+1152+k])).
proof.
proc.
ecall (A32ref.squeeze_array_ref_h out offset 32 st 136).
wp; ecall (absorb_imem_ref_h [<:W8.t>] _mem in_0 1184 136 6).
call (state_init_ref_h 136).
auto => /> &m Hp1 Hp2; rewrite !of_uintK; split; first smt().
move => _ []st ?? /= -> ?.
move=> []out ?? -> /= ??; rewrite tP => i Hi.
rewrite filliE 1:// Hi /SHA3_256_1184_32 get_of_list 1:// /=.
rewrite /SHA3_256 /KECCAK1600; congr; congr; 1:smt(); congr; 1..2:smt().
rewrite /memread (:1184=1152+32) 1:// mkseq_add 1..2://; congr.
 by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
qed.

lemma isha3_256_M1184_ll: islossless K._isha3_256_M1184.
proc.
call A32ref.squeeze_array_ref_ll.
wp; call absorb_imem_ref_ll.
wp; call state_init_ref_ll.
by auto.
qed.

phoare isha3_256_M1184_ph' _mem _ptr: 
 [ K._isha3_256_M1184
 : arg.`2 = W64.of_int _ptr
 /\ valid_ptr _ptr 1184
 /\ Glob.mem = _mem
 ==> Glob.mem = _mem
  /\ res = SHA3_256_1184_32
            (Array1152.init (fun k => _mem.[_ptr+k]),
             Array32.init (fun k => _mem.[_ptr+1152+k]))
 ] = 1%r.
proof. by conseq isha3_256_M1184_ll (isha3_256_M1184_h' _mem _ptr). qed.

phoare pkH_sha mem _ptr: 
 [ Jkem1024.M(Jkem1024.Syscall)._isha3_256_M1184
 : arg.`2 = W64.of_int _ptr
 /\ valid_ptr _ptr 1184
 /\ Glob.mem = mem
 ==> Glob.mem = mem
  /\ res = SHA3_256_1184_32
            (Array1152.init (fun k => mem.[_ptr+k]),
             Array32.init (fun k => mem.[_ptr+1152+k]))
 ] = 1%r.
proof. by conseq isha3_256_M1184_eq (isha3_256_M1184_ph' mem _ptr) => /> /#. qed.

(****************************************************************************)
equiv shake256_1120_32_eq:
  M(Syscall)._shake256_1120_32 ~ K._shake256_1120_32
 : ={arg, Glob.mem} ==> ={res, Glob.mem}
 by sim.

hoare shake256_1120_32_h' mem _pout _pin1 _pin2: 
 K._shake256_1120_32
 : arg = (W64.of_int _pout,W64.of_int _pin1,W64.of_int _pin2)
 /\ valid_ptr _pout 32
 /\ valid_ptr _pin1 32
 /\ valid_ptr _pin2 1088
 /\ Glob.mem = mem
 ==> touches Glob.mem mem _pout 32
  /\ Array32.init (fun k => Glob.mem.[_pout+k])
     = SHAKE_256_1120_32
        (Array32.init (fun k => mem.[_pin1+k])) 
        ( Array960.init (fun k => mem.[_pin2+k])
        , Array128.init (fun k => mem.[_pin2+960+k])).
proof.
proc.
ecall (squeeze_imem_ref_h Glob.mem out 32 st 136).
ecall (absorb_imem_ref_h (memread mem _pin1 32) Glob.mem in1 1088 136 31).
ecall (absorb_imem_ref_h [<:W8.t>] Glob.mem in0 32 136 0).
call (state_init_ref_h 136).
auto; rewrite /valid_ptr => |> ??????; rewrite !of_uintK.
move=> st1 H1; split; first smt().
move=> _ []st2 ?? /= ? ??; split.
 by rewrite size_memread /#.
move=> _ H2 ? [] st3 ? /= out -> _; split; first smt().
move=> _ []?? /= _ _.
split.
 by rewrite /touches => i Hi; rewrite get_storesE size_SQUEEZE1600 1..2:// ifF /#.
rewrite /SHAKE_256_1120_32 tP => i Hi /=; rewrite initiE 1:// get_of_list 1:// /=.
rewrite get_storesE size_SQUEEZE1600 1..2:// ifT 1:/# /SHAKE256 /KECCAK1600; congr; 2:smt().
congr; 1:smt(); congr; 1..2:smt().
rewrite -catA; congr.
 by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
rewrite /memread (:1088=960+128) 1:// mkseq_add 1..2://; congr.
 by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
qed.

lemma shake256_1120_32_ll: islossless K._shake256_1120_32.
proof.
proc.
call squeeze_imem_ref_ll => /=.
call absorb_imem_ref_ll.
call absorb_imem_ref_ll.
call state_init_ref_ll.
by auto => />.
qed.

phoare shake256_1120_32_ph' mem _pout _pin1 _pin2: 
 [ K._shake256_1120_32
 : arg = (W64.of_int _pout,W64.of_int _pin1,W64.of_int _pin2)
 /\ valid_ptr _pout 32
 /\ valid_ptr _pin1 32
 /\ valid_ptr _pin2 1088
 /\ Glob.mem = mem
 ==> touches Glob.mem mem _pout 32
  /\ Array32.init (fun k => Glob.mem.[_pout+k])
     = SHAKE_256_1120_32
        (Array32.init (fun k => mem.[_pin1+k])) 
        ( Array960.init (fun k => mem.[_pin2+k])
        , Array128.init (fun k => mem.[_pin2+960+k]))
 ] = 1%r.
proof. by conseq shake256_1120_32_ll (shake256_1120_32_h' mem _pout _pin1 _pin2). qed.

phoare j_shake mem _pout _pin1 _pin2: 
 [ Jkem1024.M(Syscall)._shake256_1120_32
 : arg = (W64.of_int _pout,W64.of_int _pin1,W64.of_int _pin2)
 /\ valid_ptr _pout 32
 /\ valid_ptr _pin1 32
 /\ valid_ptr _pin2 1088
 /\ Glob.mem = mem
 ==> touches Glob.mem mem _pout 32
  /\ Array32.init (fun k => Glob.mem.[_pout+k])
     = SHAKE_256_1120_32
        (Array32.init (fun k => mem.[_pin1+k])) 
        ( Array960.init (fun k => mem.[_pin2+k])
        , Array128.init (fun k => mem.[_pin2+960+k]))
 ] = 1%r.
proof. by conseq shake256_1120_32_eq (shake256_1120_32_ph' mem _pout _pin1 _pin2) => /> /#. qed.

(****************************************************************************)
equiv sha3_512_64_eq:
  M(Syscall)._sha3_512_64 ~ K._sha3_512_64
 : ={arg} ==> ={res}
 by sim.

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
 [ Jkem1024.M(Jkem1024.Syscall)._sha3_512_64
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
