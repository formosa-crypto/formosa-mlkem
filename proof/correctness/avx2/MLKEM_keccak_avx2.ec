require import AllCore IntDiv List.

from Jasmin require import JModel.

from CryptoSpecs require import JWordList.
from CryptoSpecs require export FIPS202_Keccakf1600 FIPS202_SHA3_Spec.
from CryptoSpecs require export Keccak1600_Spec Keccakf1600_Spec.

from CryptoSpecs require import Symmetric.
require import MLKEMFCLib.
from JazzEC require import Jkem_avx2.

(****************************************************************************)
(****************************************************************************)
from Keccak require import Keccak1600_avx2.

equiv state_init_avx2_eq:
 M(Syscall).__state_init_avx2 ~ Jazz_avx2.M.__state_init_avx2
 : ={arg} ==> ={res}
 by sim.

equiv pstate_init_avx2_eq:
 M(Syscall).__pstate_init_avx2 ~ Jazz_avx2.M.__pstate_init_avx2
 : ={arg} ==> ={res}
 by sim.

equiv addratebit_avx2_eq:
 M(Syscall).__addratebit_avx2 ~ Jazz_avx2.M.__addratebit_avx2
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
(****************************************************************************)

from Keccak require import Keccak1600_imem_avx2.

equiv absorb_imem_avx2_eq:
 M(Syscall).__absorb_imem_avx2 ~ Jazz_avx2.M.__absorb_imem_avx2
 : ={arg,Glob.mem} ==> ={res,Glob.mem}
 by sim.

equiv pabsorb_imem_avx2_eq:
 M(Syscall).__pabsorb_imem_avx2 ~ Jazz_avx2.M.__pabsorb_imem_avx2
 : ={arg,Glob.mem} ==> ={res,Glob.mem}
 by sim.

equiv squeeze_imem_avx2_eq:
 M(Syscall).__squeeze_imem_avx2 ~ Jazz_avx2.M.__squeeze_imem_avx2
 : ={arg,Glob.mem} ==> ={res,Glob.mem}.
admitted(*
 by proc; inline*; sim.*).

(****************************************************************************)
(****************************************************************************)


from Keccak require Keccak1600_array_avx2.

(****************************************************************************)
from JazzEC require import Array1 WArray1.   (* nonce *)

(*
clone Keccak1600_array_avx2.KeccakAvx2 as KeccakAvx2_A1
 with op aSIZE <- 1,
      theory A <- Array1,
      theory WA <- WArray1
      proof aSIZE_ge0 by done.


A1:
a1____addstate_array_avx2x4
a1____absorb_array_avx2x4
*)


(****************************************************************************)
from JazzEC require import Array2 WArray2.   (* mat. position *)

clone Keccak1600_array_avx2.KeccakArrayAvx2 as A2avx2
 with op aSIZE <- 2,
      theory A <- Array2,
      theory WA <- WArray2
      proof aSIZE_ge0 by done.

equiv a2__pabsorb_array_avx2_eq:
 M(Syscall).a2____pabsorb_array_avx2 ~ A2avx2.M(A2avx2.P).__pabsorb_array_avx2
 : ={arg} ==> ={res}
 by sim.

(*

A2:
a2____addstate_array_avx2
a2____pstate_array_avx2
a2____pabsorb_array_avx2
a2____addstate_array_avx2x4
a2____absorb_array_avx2x4

*)

(****************************************************************************)
from JazzEC require import Array32 WArray32.  (* SEED SIZE *)

clone Keccak1600_array_avx2.KeccakArrayAvx2 as A32avx2
 with op aSIZE <- 32,
      theory A <- Array32,
      theory WA <- WArray32
      proof aSIZE_ge0 by done.

equiv a32__pabsorb_array_avx2_eq:
 M(Syscall).a32____pabsorb_array_avx2 ~ A32avx2.M(A32avx2.P).__pabsorb_array_avx2
 : ={arg} ==> ={res}
 by sim.

equiv a32__squeeze_array_avx2_eq:
 M(Syscall).a32____squeeze_array_avx2 ~ A32avx2.M(A32avx2.P).__squeeze_array_avx2
 : ={arg} ==> ={res}
 by sim.

(*
A32:
- a32____addstate_array_avx2
- a32____pstate_array_avx2
+ a32____pabsorb_array_avx2
- a32____dumpstate_array_avx2
+ a32____squeeze_array_avx2
- a32____addstate_bcast_array_avx2x4
a32____absorb_bcast_array_avx2x4
*)

(****************************************************************************)
from JazzEC require import Array33 WArray33.  (* DS SEED SIZE *)

clone Keccak1600_array_avx2.KeccakArrayAvx2 as A33avx2
 with op aSIZE <- 33,
      theory A <- Array33,
      theory WA <- WArray33
      proof aSIZE_ge0 by done.

equiv a33__absorb_array_avx2_eq:
 M(Syscall).a33____absorb_array_avx2 ~ A33avx2.M(A33avx2.P).__absorb_array_avx2
 : ={arg} ==> ={res}
 by sim.

(*
A33:
- a33____addstate_array_avx2
+ a33____absorb_array_avx2
*)


(****************************************************************************)
from JazzEC require import Array64 WArray64.  (* DS SEED SIZE *)

clone Keccak1600_array_avx2.KeccakArrayAvx2 as A64avx2
 with op aSIZE <- 64,
      theory A <- Array64,
      theory WA <- WArray64
      proof aSIZE_ge0 by done.

equiv a64__absorb_array_avx2_eq:
 M(Syscall).a64____absorb_array_avx2 ~ A64avx2.M(A64avx2.P).__absorb_array_avx2
 : ={arg} ==> ={res}
 by sim.

equiv a64__squeeze_array_avx2_eq:
 M(Syscall).a64____squeeze_array_avx2 ~ A64avx2.M(A64avx2.P).__squeeze_array_avx2
 : ={arg} ==> ={res}
 by sim.

(*
A64:
- a64____addstate_array_avx2
+ a64____absorb_array_avx2
- a64____dumpstate_array_avx2
+ a64____squeeze_array_avx2
*)

(****************************************************************************)
from JazzEC require import Array536 WArray536. (* BUF_SIZE *)

clone Keccak1600_array_avx2.KeccakArrayAvx2 as ABUFLENavx2
 with op aSIZE <- 536,
      theory A <- Array536,
      theory WA <- WArray536
      proof aSIZE_ge0 by done.

equiv aBUFLEN__dumpstate_array_avx2_eq:
 M(Syscall).aBUFLEN____dumpstate_array_avx2 ~ ABUFLENavx2.M(ABUFLENavx2.P).__dumpstate_array_avx2
 : ={arg} ==> ={res}
 by sim.

(*
ABUFLEN:
+ dumpstate_array_avx2
dumpstate_array_avx2x4
*)


(****************************************************************************)
(****************************************************************************)


from JazzEC require import Array8.   (* mat. indexes *)
(* from JazzEC require import Array128 WArray128.
from JazzEC require import Array960.
from JazzEC require import Array1152.
from JazzEC require import Array1184. *)
from JazzEC require import Array2144. (* 4*BUF_SIZE *) 
from JazzEC require import Array7.

(* Keccak library interface
Jkem_avx2.M(Jkem_avx2.Syscall)._sha3_512A_A64
Jkem_avx2.M(Jkem_avx2.Syscall)._sha3_256A_M1184
Jkem_avx2.M(Jkem_avx2.Syscall)._shake256_M32__M32_M1088
Jkem_avx2.M(Jkem_avx2.Syscall)._shake128_next_state
Jkem_avx2.M(Jkem_avx2.Syscall)._shake256x4_A128__A32_A1
Jkem_avx2.M(Jkem_avx2.Syscall)._shake128_absorb_A32_A2
Jkem_avx2.M(Jkem_avx2.Syscall)._shake128_squeeze3blocks
Jkem_avx2.M(Jkem_avx2.Syscall)._shake128x4_absorb_A32_A2
Jkem_avx2.M(Jkem_avx2.Syscall)._shake128x4_squeeze3blocks
 *)
module K = {
  proc _sha3_512A_A33(out : W8.t Array64.t, in_0 : W8.t Array33.t) :
    W8.t Array64.t = {
    var st : W256.t Array7.t;
    var offset : W64.t;
    var _0 : W64.t;
    var _1 : W256.t Array7.t;
    
    _1 <- witness;
    st <- witness;
    st <@ Jazz_avx2.M.__state_init_avx2();
    offset <- W64.zero;
    (st, _0) <@ A33avx2.M(A33avx2.P).__absorb_array_avx2(st, in_0, offset, 33, 72, 6);
    offset <- W64.zero;
    (out, _1) <@ A64avx2.M(A64avx2.P).__squeeze_array_avx2(out, offset, 64, st, 72);
    
    return out;
  }
  proc _sha3_256A_M1184(out : W8.t Array32.t, in_0 : W64.t) : W8.t Array32.t = {
    var st : W256.t t;
    var offset : W64.t;
    var _0 : W64.t;
    var _1 : W256.t t;
    
    _1 <- witness;
    st <- witness;
    st <@ Jazz_avx2.M.__state_init_avx2();
    (st, _0) <@ Jazz_avx2.M.__absorb_imem_avx2(st, in_0, 1184, 136, 6);
    offset <- W64.zero;
    (out, _1) <@ A32avx2.M(A32avx2.P).__squeeze_array_avx2(out, offset, 32, st, 136);
    
    return out;
  }
  proc _shake256_M32__M32_M1088(out : W64.t, in0 : W64.t, in1 : W64.t) : unit = {
    var pst_s : W64.t Array25.t;
    var pst : W64.t Array25.t;
    var st : W256.t t;
    var _0 : int;
    var _1 : W64.t;
    var _2 : int;
    var _3 : W64.t;
    var _4 : W64.t;
    var _5 : W256.t t;
    
    _5 <- witness;
    pst <- witness;
    pst_s <- witness;
    st <- witness;
    pst <- pst_s;
    (pst, st) <@ Jazz_avx2.M.__pstate_init_avx2(pst);
    (pst, _0, st, _1) <@
      Jazz_avx2.M.__pabsorb_imem_avx2(pst, 0, st, in0, 32, 136, 0);
    (pst, _2, st, _3) <@
      Jazz_avx2.M.__pabsorb_imem_avx2(pst, 32, st, in1, 1088, 136, 31);
    (_4, _5) <@ Jazz_avx2.M.__squeeze_imem_avx2(out, 32, st, 136);
    
    return tt;
  }
  proc _shake128_absorb_A32_A2(seed : W8.t Array32.t, pos : W8.t Array2.t) :
    W256.t t = {
    var st : W256.t t;
    var pst_s : W64.t Array25.t;
    var pst : W64.t Array25.t;
    var offset : W64.t;
    var _0 : int;
    var _1 : W64.t;
    var _2 : int;
    var _3 : W64.t;
    
    pst <- witness;
    pst_s <- witness;
    st <- witness;
    pst <- pst_s;
    (pst, st) <@ Jazz_avx2.M.__pstate_init_avx2(pst);
    offset <- W64.zero;
    (pst, _0, st, _1) <@
      A32avx2.M(A32avx2.P).__pabsorb_array_avx2(pst, 0, st, seed, offset, 32, 168, 0);
    offset <- W64.zero;
    (pst, _2, st, _3) <@
      A2avx2.M(A2avx2.P).__pabsorb_array_avx2(pst, 32, st, pos, offset, 2, 168, 31);
    
    return st;
  }
  proc _shake128_squeeze3blocks(buf : W8.t Array536.t, st : W256.t t) :
    W8.t Array536.t = {
    var offset : W64.t;
    
    st <@ Jazz_avx2.M._keccakf1600_avx2(st);
    offset <- W64.zero;
    (buf, offset) <@
      ABUFLENavx2.M(ABUFLENavx2.P).__dumpstate_array_avx2(buf, offset, 168, st);
    st <@ Jazz_avx2.M._keccakf1600_avx2(st);
    (buf, offset) <@
      ABUFLENavx2.M(ABUFLENavx2.P).__dumpstate_array_avx2(buf, offset, 168, st);
    st <@ Jazz_avx2.M._keccakf1600_avx2(st);
    (buf, offset) <@
      ABUFLENavx2.M(ABUFLENavx2.P).__dumpstate_array_avx2(buf, offset, 200, st);
    
    return buf;
  }
  proc _shake128_next_state(buf : W8.t Array536.t) : W8.t Array536.t = {
    var pst : W64.t Array25.t;
    var st : W256.t t;
    var offset : W64.t;
    var _0 : W64.t;
    
    pst <- witness;
    st <- witness;
    pst <-
      (init
         (fun (i : int) =>
            get64 ((init8 (fun (i0 : int) => buf.[i0])))%WArray536
              (2 * (168 %/ 8) + i)))%Array25;
    st <@ Jazz_avx2.M.__state_from_pstate_avx2(pst);
    st <@ Jazz_avx2.M._keccakf1600_avx2(st);
    offset <- (of_int (2 * 168))%W64;
    (buf, _0) <@ ABUFLENavx2.M(ABUFLENavx2.P).__dumpstate_array_avx2(buf, offset, 200, st);
    
    return buf;
  }
}.

(*********************************************************************************)
equiv sha3_512A_A33_eq:
  M(Syscall)._sha3_512A_A33 ~ K._sha3_512A_A33
 : ={arg} ==> ={res}
by sim.

hoare sha3_512A_A33_h' _in:
 K._sha3_512A_A33
 : in_0 = _in
 ==> to_list res = SHA3_512 (to_list _in).
proof.
proc.
ecall (A64avx2.squeeze_array_avx2_h out offset 64 st 72).
wp; ecall (A33avx2.absorb_array_avx2_h st in_0 offset 33 72 6).
wp; call state_init_avx2_h.
auto => |> &m [st ?] /= -> _ [out st2] /= -> Hst2.
rewrite stavx2_from_st25K -(Array64.of_listK W8.zero (SHA3_512 _)).
 by rewrite size_SQUEEZE1600 /#.
congr; rewrite tP => i Hi.
rewrite initiE // filliE //= Hi /=.
by congr; rewrite /SHA3_512 /c1024_r8 /KECCAK1600; congr; congr => //.
qed.

(* IF NEEDED...
hoare sha3_512A_A33_h _in:
 M(Syscall)._sha3_512A_A33
 : in_0 = _in
 ==> to_list res = SHA3_512 (to_list _in).
proof.
by conseq sha3_512A_A33_eq (sha3_512A_A33_h' _in) => // /#.
qed.
*)

lemma sha3_512A_A33_ll: islossless K._sha3_512A_A33.
proc.
call A64avx2.squeeze_array_avx2_ll.
wp; call A33avx2.absorb_array_avx2_ll.
wp; call state_init_avx2_ll.
by auto.
qed.

phoare sha3_512A_A33_ph' _in:
 [ K._sha3_512A_A33
 : in_0 = _in
 ==> to_list res = SHA3_512 (to_list _in)
 ] = 1%r.
proof.
by conseq sha3_512A_A33_ll (sha3_512A_A33_h' _in).
qed.

phoare sha3_512A_A33_ph _in:
 [ M(Syscall)._sha3_512A_A33
 : in_0 = _in
 ==> to_list res = SHA3_512 (to_list _in)
 ] = 1%r.
proof.
by conseq sha3_512A_A33_eq (sha3_512A_A33_ph' _in) => // /#.
qed.

(*
(* Alternatively, we might have tackled directly the final phoare result... But
  we loose the ability of using 'ecall' and need to give explicit contracts for
  every call to the library functions.  *)
phoare sha3_512A_A33_phX _in:
 [ M(Syscall)._sha3_512A_A33
 : in_0 = _in
 ==> to_list res = SHA3_512 (to_list _in)
 ] = 1%r.
proof.
proc => /=.
call (: offset=W64.of_int 0 /\ lEN=64 /\ rATE8=72 /\ absorb_spec_avx2 rATE8 6 (to_list _in) st
 ==> to_list res.`1 = SHA3_512 (to_list _in)).
 exlim st, buf, rATE8 => _st _buf _r8.
 conseq  a64__squeeze_array_avx2_eq (A64avx2.squeeze_array_avx2_ph _buf W64.zero 64 _st 72) => //=.
  by move => /> &m *; exists arg{m} => />. 
 move=> /> &m -> _.
 rewrite -(Array64.of_listK W8.zero (SHA3_512 (to_list _in))).
  rewrite size_SQUEEZE1600 /#.
 congr; rewrite tP => i Hi.
 rewrite initiE // filliE //= Hi /=.
 congr; rewrite /SHA3_512 /c1024_r8 /KECCAK1600; congr.
 (* etc... *).
wp; call (: st=stavx2_st0 /\ buf=_in /\ offset=W64.of_int 0 /\ lEN=33 /\ rATE8=72 /\ tRAILB=6 ==> absorb_spec_avx2 72 6 (to_list _in) res.`1 ).
 conseq a33__absorb_array_avx2_eq (A33avx2.absorb_array_avx2_ph stavx2_st0 _in W64.zero 33 72 6) => //.
 move=> &m H; exists arg{m}; move: H => /> ? -> ??? /= /#.
wp; call (:true ==> res = stavx2_st0).
 conseq state_init_avx2_eq state_init_avx2_ph => //=.
by auto => />.
qed.
*)


(*********************************************************************************)
from JazzEC require import Array1152.
equiv sha3_256A_M1184_eq:
  M(Syscall)._sha3_256A_M1184 ~ K._sha3_256A_M1184
 : ={arg, Glob.mem} ==> ={res, Glob.mem}
 by sim.

hoare sha3_256A_M1184_h' _mem _in:
 K._sha3_256A_M1184
 : arg.`2 = W64.of_int _in /\
   valid_ptr _in 1184 /\
   Glob.mem = _mem
 ==> 
   Glob.mem = _mem /\
   res = SHA3_256_1184_32
            (Array1152.init (fun k =>  _mem.[_in+k]),
            (Array32.init (fun k => _mem.[_in+1152+k]))).
proof.
proc => /=.
ecall (A32avx2.squeeze_array_avx2_h out offset 32 st 136).
wp; ecall (absorb_imem_avx2_h Glob.mem st in_0 1184 136 6).
wp; call state_init_avx2_h.
auto =>  /> &m; rewrite !of_uintK /= => /> ??; split; first smt().
move=> _ [st ?]; rewrite modz_small 1:/# /= => -> _.
move=> [_out ?] /= -> _.
rewrite /SHA3_256_1184_32 stavx2_from_st25K /= tP => i Hi.
rewrite initiE // filliE //= Hi /=.
rewrite /SHA3_256 /c512_r8 /KECCAK1600; congr; congr; congr => //.
rewrite (memread_split 1152) 1://; congr.
 by apply eq_in_mkseq => j Hj /=; rewrite initiE.
by apply eq_in_mkseq => j Hj /=; rewrite initiE.
qed.

phoare sha3_256A_M1184_ll: 
 [ K._sha3_256A_M1184 : valid_ptr (to_uint in_0) 1184 ==> true ] = 1%r.
proof.
proc.
call A32avx2.squeeze_array_avx2_ll.
wp; call absorb_imem_avx2_ll.
call state_init_avx2_ll.
by auto => />.
qed.

phoare sha3_256A_M1184_ph' _mem _in:
 [ K._sha3_256A_M1184
 : arg.`2 = W64.of_int _in /\
   valid_ptr _in 1184 /\
   Glob.mem = _mem
 ==> 
   Glob.mem = _mem /\
   res = SHA3_256_1184_32
            (Array1152.init (fun k =>  _mem.[_in+k]),
            (Array32.init (fun k => _mem.[_in+1152+k])))
 ] = 1%r.
proof.
conseq sha3_256A_M1184_ll (sha3_256A_M1184_h' _mem _in) => //.
by move=> /> &m ->*; rewrite of_uintK; smt(W64.to_uint_cmp).
qed.

phoare sha3_256A_M1184_ph _mem _in:
 [ M(Syscall)._sha3_256A_M1184
 : arg.`2 = W64.of_int _in /\
   valid_ptr _in 1184 /\
   Glob.mem = _mem
 ==> 
   Glob.mem = _mem /\
   res = SHA3_256_1184_32
            (Array1152.init (fun k =>  _mem.[_in+k]),
            (Array32.init (fun k => _mem.[_in+1152+k])))
 ] = 1%r.
proof.
by conseq sha3_256A_M1184_eq (sha3_256A_M1184_ph' _mem _in) => /#.
qed.

(*********************************************************************************)
equiv shake256_M32__M32_M1088_eq:
  M(Syscall)._shake256_M32__M32_M1088 ~ K._shake256_M32__M32_M1088
 : ={arg, Glob.mem} ==> ={res, Glob.mem}.
proof.
proc.
call squeeze_imem_avx2_eq.
call pabsorb_imem_avx2_eq.
call pabsorb_imem_avx2_eq.
call pstate_init_avx2_eq.
by auto => />.
qed.

hoare shake256_M32__M32_M1088_h' mem _pout _pin1 _pin2:
 K._shake256_M32__M32_M1088
 : Glob.mem = mem /\ arg=(_pout, _pin1, _pin2)
 /\ valid_ptr (to_uint _pout) 32
 /\ valid_ptr (to_uint _pin1) 32
 /\ valid_ptr (to_uint _pin2) 1088
 ==> Glob.mem
   = stores mem (to_uint _pout)
       (SHAKE256 (memread mem (to_uint _pin1) 32++memread mem (to_uint _pin2) 1088) 32).
proof.
proc => /=.
ecall (squeeze_imem_avx2_h Glob.mem out 32 st 136).
ecall (pabsorb_imem_avx2_h Glob.mem (memread mem (to_uint _pin1) 32) in1 1088 136 31).
ecall (pabsorb_imem_avx2_h Glob.mem [<:W8.t>] in0 32 136 0).
call (pstate_init_avx2_h 136).
auto; rewrite /valid_ptr /= => |> _?_?_? [pst0 st0] /= H0 []pst1 at1 st1 off1 /= H1.
move => |>; rewrite size_memread 1:// /=.
move=> []pst2 at2 st2 off2 /= -> []out st3 /= _ ?.
rewrite stavx2_from_st25K /SHAKE256 /KECCAK1600 /#.
qed.

phoare shake256_M32__M32_M1088_ll: 
 [ K._shake256_M32__M32_M1088
 : valid_ptr (to_uint out) 32
 /\ valid_ptr (to_uint in0) 32
 /\ valid_ptr (to_uint in1) 1088
 ==> true ] = 1%r.
proof.
proc.
call squeeze_imem_avx2_ll.
call pabsorb_imem_avx2_ll.
call pabsorb_imem_avx2_ll.
call pstate_init_avx2_ll.
by auto => />.
qed.

phoare shake256_M32__M32_M1088_ph' mem _pout _pin1 _pin2:
 [ K._shake256_M32__M32_M1088
 : Glob.mem = mem /\ arg=(_pout, _pin1, _pin2)
 /\ valid_ptr (to_uint _pout) 32
 /\ valid_ptr (to_uint _pin1) 32
 /\ valid_ptr (to_uint _pin2) 1088
 ==> Glob.mem
   = stores mem (to_uint _pout)
       (SHAKE256 (memread mem (to_uint _pin1) 32++memread mem (to_uint _pin2) 1088) 32)
 ] = 1%r.
proof.
by conseq shake256_M32__M32_M1088_ll (shake256_M32__M32_M1088_h' mem _pout _pin1 _pin2).
qed.

from JazzEC require import Array960 Array128.
phoare shake256_M32__M32_M1088_ph_alt mem _pout _pin1 _pin2: 
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._shake256_M32__M32_M1088
 : arg = (_pout,_pin1,_pin2) /\
   valid_ptr (to_uint _pout) 32 /\
   valid_ptr (to_uint _pin1) 32 /\
   valid_ptr (to_uint _pin2) 1088 /\
   Glob.mem = mem
 ==> 
   touches Glob.mem mem (to_uint _pout) 32 /\
   (Array32.init (fun k =>  Glob.mem.[to_uint _pout+k])) = 
     SHAKE_256_1120_32
       (Array32.init (fun k => mem.[to_uint _pin1+k])) 
       (Array960.init (fun k => mem.[to_uint _pin2+k]), Array128.init (fun k => mem.[to_uint _pin2+960+k]))
 ] = 1%r.
proof.
conseq shake256_M32__M32_M1088_eq (shake256_M32__M32_M1088_ph' mem _pout _pin1 _pin2) => />.
 move=> ??????; exists mem (_pout, _pin1,  _pin2) => />.
split.
 by move=> i Hi; rewrite get_storesE ifF //= size_SHAKE256 1:// /#.
rewrite tP => i Hi.
rewrite /SHAKE_256_1120_32 initiE 1:// initiE 1:// /= get_storesE size_SHAKE256 1://.
rewrite ifT 1:/#; congr; last smt().
congr; rewrite -catA; congr.
 rewrite /memread /to_list; apply eq_in_mkseq => j Hj /=.
 by rewrite initiE.
rewrite (memread_split 960) 1://; congr.
 rewrite /memread /to_list; apply eq_in_mkseq => j Hj /=.
 by rewrite initiE.
rewrite /memread /to_list; apply eq_in_mkseq => j Hj /=.
by rewrite initiE.
qed. 

phoare shake256_M32__M32_M1088_ph mem _pout _pin1 _pin2: 
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._shake256_M32__M32_M1088
 : arg = (W64.of_int _pout,W64.of_int _pin1,W64.of_int _pin2) /\
   valid_ptr _pout 32 /\
   valid_ptr _pin1 32 /\
   valid_ptr _pin2 1088 /\
   Glob.mem = mem
 ==> 
   touches Glob.mem mem _pout 32 /\
   (Array32.init (fun k =>  Glob.mem.[_pout+k])) = 
     SHAKE_256_1120_32
       (Array32.init (fun k => mem.[_pin1+k])) 
       (Array960.init (fun k => mem.[_pin2+k]), Array128.init (fun k => mem.[_pin2+960+k]))
 ] = 1%r.
proof.
conseq (shake256_M32__M32_M1088_ph_alt mem (W64.of_int _pout) (W64.of_int _pin1) (W64.of_int _pin2)).
 by move => />; rewrite !of_uintK; smt(W64.to_uint_cmp).
move=> />; rewrite !of_uintK => *; split.
 move=> *; rewrite !modz_small /#.
by rewrite !modz_small /#.
qed.


(*********************************************************************************)
equiv shake128_absorb_A32_A2_eq:
  M(Syscall)._shake128_absorb_A32_A2 ~ K._shake128_absorb_A32_A2
 : ={arg} ==> ={res}
 by sim.

hoare shake128_absorb_A32_A2_h' _rho _rc:
 K._shake128_absorb_A32_A2
 : seed = _rho /\ pos = _rc
 ==>
   absorb_spec_avx2 168 31 (to_list _rho ++ to_list _rc) res.
proof.
proc.
ecall (A2avx2.pabsorb_array_avx2_h (to_list _rho) pos offset 2 168 31).
wp; ecall (A32avx2.pabsorb_array_avx2_h [<:W8.t>] seed offset 32 168 0).
wp; call (pstate_init_avx2_h 168).
auto => |> []pst0 st0 /= H0 []pst1 at1 st1 off1 /= H1 *.
by rewrite size_to_list.
qed.

lemma shake128_absorb_A32_A2_ll: islossless K._shake128_absorb_A32_A2.
proof.
proc.
call A2avx2.pabsorb_array_avx2_ll.
wp; call A32avx2.pabsorb_array_avx2_ll.
wp; call pstate_init_avx2_ll.
by auto.
qed.

phoare shake128_absorb_A32_A2_ph' _rho _rc:
 [ K._shake128_absorb_A32_A2
 : seed = _rho /\ pos = _rc
 ==>
   absorb_spec_avx2 168 31 (to_list _rho ++ to_list _rc) res
 ] = 1%r.
proof.
by conseq shake128_absorb_A32_A2_ll (shake128_absorb_A32_A2_h' _rho _rc).
qed.


(*********************************************************************************)
equiv shake128_squeeze3blocks_eq:
  M(Syscall)._shake128_squeeze3blocks ~ K._shake128_squeeze3blocks
 : ={arg} ==> ={res}
by sim.

from Keccak require import Keccakf1600_avx2.

hoare shake128_squeeze3blocks_h' _buf _st:
 K._shake128_squeeze3blocks
 : buf=_buf /\ st=stavx2_from_st25 _st
 ==> sub res (0*168) 168 = squeezestate_i 168 _st 0
  /\ sub res (1*168) 168 = squeezestate_i 168 _st 1
  /\ sub res (2*168) 168 = squeezestate_i 168 _st 2
  /\ sub res (2*168) 200 = state2bytes (FIPS202_SHA3_Spec.st_i _st 3).
proof.
proc.
print ABUFLENavx2.dumpstate_array_avx2_h.
ecall (ABUFLENavx2.dumpstate_array_avx2_h buf offset 200 st).
ecall (keccakf1600_avx2_h (stavx2_to_st25 st)).
ecall (ABUFLENavx2.dumpstate_array_avx2_h buf offset 168 st).
ecall (keccakf1600_avx2_h (stavx2_to_st25 st)).
ecall (ABUFLENavx2.dumpstate_array_avx2_h buf offset 168 st).
wp; ecall (keccakf1600_avx2_h (stavx2_to_st25 st)).
auto => />; rewrite !stavx2_from_st25K => />.
move=> [r0 o0] /= -> ->; rewrite of_uintK /=.
move=> [r1 o1] /= -> ->; rewrite of_uintK /=.
move=> [r2 o2] /= -> _; do split; rewrite /squeezestate_i /st_i /squeezestate /=.
+ admit.
+ admit.
+ admit.
+ admit.
qed.

lemma shake128_squeeze3blocks_ll: islossless K._shake128_squeeze3blocks.
proc.
call ABUFLENavx2.dumpstate_array_avx2_ll.
call keccakf1600_avx2_ll.
call ABUFLENavx2.dumpstate_array_avx2_ll.
call keccakf1600_avx2_ll.
call ABUFLENavx2.dumpstate_array_avx2_ll.
wp; call keccakf1600_avx2_ll.
by auto.
qed.

phoare shake128_squeeze3blocks_ph' _buf _st:
 [ K._shake128_squeeze3blocks
 : buf=_buf /\ st=stavx2_from_st25 _st
 ==> sub res (0*168) 168 = squeezestate_i 168 _st 0
  /\ sub res (1*168) 168 = squeezestate_i 168 _st 1
  /\ sub res (2*168) 168 = squeezestate_i 168 _st 2
  /\ sub res (2*168) 200 = state2bytes (FIPS202_SHA3_Spec.st_i _st 3)
 ] = 1%r.
proof.
by conseq shake128_squeeze3blocks_ll (shake128_squeeze3blocks_h' _buf _st).
qed.

phoare shake128_squeeze3blocks_ph _buf _st:
 [ M(Syscall)._shake128_squeeze3blocks
 : buf=_buf /\ st=stavx2_from_st25 _st
 ==> sub res (0*168) 168 = squeezestate_i 168 _st 0
  /\ sub res (1*168) 168 = squeezestate_i 168 _st 1
  /\ sub res (2*168) 168 = squeezestate_i 168 _st 2
  /\ sub res (2*168) 200 = state2bytes (FIPS202_SHA3_Spec.st_i _st 3)
 ] = 1%r.
proof.
by conseq shake128_squeeze3blocks_eq (shake128_squeeze3blocks_ph' _buf _st) => /> /#.
qed.

(*********************************************************************************)
equiv shake128_next_state_eq:
  M(Syscall)._shake128_next_state ~ K._shake128_next_state
 : ={arg} ==> ={res}
by sim.

hoare shake128_next_state_h' _buf:
 K._shake128_next_state
 : buf = _buf
   ==>
   let st = bytes2state (sub _buf (2*168) 200) in
   sub res (2*168) 200 = state2bytes (keccak_f1600_op st).
proof.
proc.
ecall (ABUFLENavx2.dumpstate_array_avx2_h buf offset 200 st).
wp; ecall (keccakf1600_avx2_h (stavx2_to_st25 st)).
ecall (state_from_pstate_avx2_h pst).
auto => />; rewrite !stavx2_from_st25K.
split => //.
move=> _ [buf off] /= -> _.
admit.
qed.

lemma shake128_next_state_ll: islossless K._shake128_next_state.
proof.
proc.
call ABUFLENavx2.dumpstate_array_avx2_ll.
wp; call keccakf1600_avx2_ll.
call state_from_pstate_avx2_ll.
by auto.
qed.

phoare shake128_next_state_ph' _buf:
 [ K._shake128_next_state
 : buf = _buf
   ==>
   let st = bytes2state (sub _buf (2*168) 200) in
   sub res (2*168) 200 = state2bytes (keccak_f1600_op st)
 ] = 1%r.
proof.
by conseq shake128_next_state_ll (shake128_next_state_h' _buf).
qed.

phoare shake128_next_state_ph _buf:
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._shake128_next_state
 : buf = _buf
   ==>
   let st = bytes2state (sub _buf (2*168) 200) in
   sub res (2*168) 200 = state2bytes (keccak_f1600_op st)
 ] = 1%r.
proof.
by conseq shake128_next_state_eq (shake128_next_state_ph' _buf) => /> /#.
qed.

(*********************************************************************************)

from Keccak require import Keccak1600_avx2x4.

from JazzEC require import Array4.
phoare shake256x4_A128__A32_A1_ph _seed _nonces :
 [ 
   Jkem_avx2.M(Jkem_avx2.Syscall)._shake256x4_A128__A32_A1
 : seed = _seed /\ nonces = _nonces 
 ==>
    res.`1 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[0]]) 128)
 /\ res.`2 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[1]]) 128)
 /\ res.`3 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[2]]) 128)
 /\ res.`4 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[3]]) 128)
 ] = 1%r.
admitted.

op map_state4x (f:state->state) (st:state4x): state4x =
 a25pack4 (map f (a25unpack4 st)).

(*
lemma map_state4x_neq r a:
 r <> map_state4x keccak_f1600_op a
 <=> (r \a25bits64 0) <> keccak_f1600_op (a \a25bits64 0) \/
     (r \a25bits64 1) <> keccak_f1600_op (a \a25bits64 1) \/
     (r \a25bits64 2) <> keccak_f1600_op (a \a25bits64 2) \/
     (r \a25bits64 3) <> keccak_f1600_op (a \a25bits64 3).
proof.
rewrite /map_state4x eq_sym a25pack4_eq -iotaredE /=.
rewrite !(nth_map st0); first 4 by rewrite /a25unpack4 size_map size_iota.
by rewrite /a25unpack4 -iotaredE /= /#.
qed.
*)

lemma stx4_map_keccakf st0 st1 st2 st3 stx4:
 match_state4x st0 st1 st2 st3 stx4 =>
 match_state4x (keccak_f1600_op st0) (keccak_f1600_op st1) (keccak_f1600_op st2) (
  keccak_f1600_op st3) (map_state4x keccak_f1600_op stx4).
admitted.


phoare shake128x4_absorb_A32_A2_ph _rho _rc:
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._shake128x4_absorb_A32_A2
 : seed = _rho /\ pos = _rc
 ==>
    match_state4x
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 0 2)) 
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 2 2)) 
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 4 2)) 
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 6 2)) 
    res
 ] = 1%r.
admitted.

phoare shake128x4_squeeze3blocks_ph _st0 _st1 _st2 _st3:
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._shake128x4_squeeze3blocks
 : match_state4x _st0 _st1 _st2 _st3 st
 ==>
      sub res.`2 (0*536) (3*168) = SHAKE128_SQUEEZE (3*168) _st0
   /\ sub res.`2 (1*536) (3*168) = SHAKE128_SQUEEZE (3*168) _st1
   /\ sub res.`2 (2*536) (3*168) = SHAKE128_SQUEEZE (3*168) _st2
   /\ sub res.`2 (3*536) (3*168) = SHAKE128_SQUEEZE (3*168) _st3
   /\ sub res.`2 (0*536+2*168) 200 = state2bytes (st_i _st0 3)
   /\ sub res.`2 (1*536+2*168) 200 = state2bytes (st_i _st1 3)
   /\ sub res.`2 (2*536+2*168) 200 = state2bytes (st_i _st2 3)
   /\ sub res.`2 (3*536+2*168) 200 = state2bytes (st_i _st3 3)
 ] = 1%r.
admitted.

