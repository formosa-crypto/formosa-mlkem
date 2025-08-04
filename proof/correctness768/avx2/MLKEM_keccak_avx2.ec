require import AllCore IntDiv List.

from Jasmin require import JModel.

from CryptoSpecs require import JWordList.
from CryptoSpecs require import FIPS202_Keccakf1600 FIPS202_SHA3_Spec.

from Keccak require import Keccakf1600_ref.

from CryptoSpecs require export Keccak1600_Spec Keccakf1600_Spec.

from CryptoSpecs require import Symmetric.
require import MLKEMFCLib.

from JazzEC require import Jkem1024_avx2 WArray200.
from JazzEC require Jkem1024_avx2.




(****************************************************************************)
(****************************************************************************)
from Keccak require import Keccak1600_avx2.

equiv state_init_avx2_eq:
 M.__state_init_avx2 ~ Jazz_avx2.M.__state_init_avx2
 : ={arg} ==> ={res}
 by sim.

equiv pstate_init_avx2_eq:
 M.__pstate_init_avx2 ~ Jazz_avx2.M.__pstate_init_avx2
 : ={arg} ==> ={res}
 by sim.

equiv addratebit_avx2_eq:
 M.__addratebit_avx2 ~ Jazz_avx2.M.__addratebit_avx2
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
(****************************************************************************)
from Keccak require import Keccak1600_imem_avx2.

(****************************************************************************)
(****************************************************************************)
from Keccak require import Keccak1600_avx2x4.

equiv state_init_avx2x4_eq:
 M.__state_init_avx2x4 ~ Jazz_avx2.M.__state_init_avx2x4
 : ={arg} ==> ={res}
 by sim.

equiv addratebit_avx2x4_eq:
 M.__addratebit_avx2x4 ~ Jazz_avx2.M.__addratebit_avx2x4
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
(****************************************************************************)

from Keccak require import Keccakf1600_ref Keccakf1600_avx2x4.
from JazzEC require import WArray1536.
from JazzEC require import Array24 Array5.

from Keccak require Keccak1600_array_avx2.
from Keccak require Keccak1600_array_avx2x4.

(****************************************************************************)
from JazzEC require import Array1 WArray1.   (* nonce *)

clone Keccak1600_array_avx2x4.KeccakArrayAvx2x4 as A1avx2x4
 with op aSIZE <- 1,
      theory A <- Array1,
      theory WA <- WArray1
      proof aSIZE_ge0 by done.

equiv a1__pabsorb_array_avx2_eq:
 M.a1____absorb_array_avx2x4 ~ A1avx2x4.M(A1avx2x4.P).__absorb_array_avx2x4
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array2 WArray2.   (* mat. position *)

clone Keccak1600_array_avx2x4.KeccakArrayAvx2x4 as A2avx2x4
 with op aSIZE <- 2,
      theory A <- Array2,
      theory WA <- WArray2
      proof aSIZE_ge0 by done.

(****************************************************************************)
from JazzEC require import Array32 WArray32.  (* SEED SIZE *)

clone Keccak1600_array_avx2.KeccakArrayAvx2 as A32avx2
 with op aSIZE <- 32,
      theory A <- Array32,
      theory WA <- WArray32
      proof aSIZE_ge0 by done.
clone Keccak1600_array_avx2x4.KeccakArrayAvx2x4 as A32avx2x4
 with op aSIZE <- 32,
      theory A <- Array32,
      theory WA <- WArray32
      proof aSIZE_ge0 by done.


equiv a32__pabsorb_array_avx2_eq:
 M.a32____pabsorb_array_avx2 ~ A32avx2.M(A32avx2.P).__pabsorb_array_avx2
 : ={arg} ==> ={res}
 by sim.

equiv a32__squeeze_array_avx2_eq:
 M.a32____squeeze_array_avx2 ~ A32avx2.M(A32avx2.P).__squeeze_array_avx2
 : ={arg} ==> ={res}
 by sim.

equiv a32__absorb_array_avx2x4_eq:
 M.a32____absorb_bcast_array_avx2x4 ~ A32avx2x4.M(A32avx2x4.P).__absorb_bcast_array_avx2x4
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array33 WArray33.  (* DS SEED SIZE *)

clone Keccak1600_array_avx2.KeccakArrayAvx2 as A33avx2
 with op aSIZE <- 33,
      theory A <- Array33,
      theory WA <- WArray33
      proof aSIZE_ge0 by done.

equiv a33__absorb_array_avx2_eq:
 M.a33____absorb_array_avx2 ~ A33avx2.M(A33avx2.P).__absorb_array_avx2
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array64 WArray64.  (* DS SEED SIZE *)

clone Keccak1600_array_avx2.KeccakArrayAvx2 as A64avx2
 with op aSIZE <- 64,
      theory A <- Array64,
      theory WA <- WArray64
      proof aSIZE_ge0 by done.

equiv a64__absorb_array_avx2_eq:
 M.a64____absorb_array_avx2 ~ A64avx2.M(A64avx2.P).__absorb_array_avx2
 : ={arg} ==> ={res}
 by sim.

equiv a64__squeeze_array_avx2_eq:
 M.a64____squeeze_array_avx2 ~ A64avx2.M(A64avx2.P).__squeeze_array_avx2
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array128 WArray128. 

clone Keccak1600_array_avx2x4.KeccakArrayAvx2x4 as A128avx2x4
 with op aSIZE <- 128,
      theory A <- Array128,
      theory WA <- WArray128
      proof aSIZE_ge0 by done.

equiv a128__squeeze_array_avx2_eq:
 M.a128____squeeze_array_avx2x4 ~ A128avx2x4.M(A128avx2x4.P).__squeeze_array_avx2x4
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array536 WArray536. (* BUF_SIZE *)

clone Keccak1600_array_avx2.KeccakArrayAvx2 as ABUFLENavx2
 with op aSIZE <- 536,
      theory A <- Array536,
      theory WA <- WArray536
      proof aSIZE_ge0 by done.
clone Keccak1600_array_avx2x4.KeccakArrayAvx2x4 as ABUFLENavx2x4
 with op aSIZE <- 536,
      theory A <- Array536,
      theory WA <- WArray536
      proof aSIZE_ge0 by done.

equiv aBUFLEN__dumpstate_array_avx2_eq:
 M.aBUFLEN____dumpstate_array_avx2 ~ ABUFLENavx2.M(ABUFLENavx2.P).__dumpstate_array_avx2
 : ={arg} ==> ={res}
 by sim.

equiv aBUFLEN__dumpstate_array_avx2x4_eq:
 M.aBUFLEN____dumpstate_array_avx2x4 ~ ABUFLENavx2x4.M(ABUFLENavx2x4.P).__dumpstate_array_avx2x4
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array1568 WArray1568.

clone Keccak1600_array_avx2.KeccakArrayAvx2 as A1568avx2
 with op aSIZE <- 1568,
      theory A <- Array1568,
      theory WA <- WArray1568
      proof aSIZE_ge0 by done.

equiv a1568__absorb_array_avx2_eq:
 Jkem1024_avx2.M.a1568____absorb_array_avx2 ~ A1568avx2.M(A1568avx2.P).__absorb_array_avx2
 : ={arg} ==> ={res}
 by sim.


(****************************************************************************)
from JazzEC require import Array1600 WArray1600.

clone Keccak1600_array_avx2.KeccakArrayAvx2 as A1600avx2
 with op aSIZE <- 1600,
      theory A <- Array1600,
      theory WA <- WArray1600
      proof aSIZE_ge0 by done.

equiv a1600__absorb_array_avx2_eq:
 Jkem1024_avx2.M.a1600____absorb_array_avx2 ~ A1600avx2.M(A1600avx2.P).__absorb_array_avx2
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
(****************************************************************************)


from JazzEC require import Array4.
from JazzEC require import Array8.   (* mat. indexes *)
from JazzEC require import Array128 WArray128.
from JazzEC require import Array1408.
from JazzEC require import Array1536.
from JazzEC require import Array2144. (* 4*BUF_SIZE *) 
from JazzEC require import Array7.

(* Keccak library interface *)
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
  proc _sha3_512A_A64(out : W8.t Array64.t, in_0 : W8.t Array64.t) :
    W8.t Array64.t = {
    var st : W256.t Array7.t;
    var offset : W64.t;
    var _0 : W64.t;
    var _1 : W256.t Array7.t;
    
    _1 <- witness;
    st <- witness;
    st <@ Jazz_avx2.M.__state_init_avx2();
    offset <- W64.zero;
    (st, _0) <@ A64avx2.M(A64avx2.P).__absorb_array_avx2(st, in_0, offset, 64, 72, 6);
    offset <- W64.zero;
    (out, _1) <@ A64avx2.M(A64avx2.P).__squeeze_array_avx2(out, offset, 64, st, 72);
    
    return out;
  }
  

  proc _sha3_256A_A1568(out : W8.t Array32.t, in_0 : W8.t Array1568.t) :
    W8.t Array32.t = {
    var st : W256.t Array7.t;
    var offset : W64.t;
    var _0 : W64.t;
    var _1 : W256.t Array7.t;
    
    _1 <- witness;
    st <- witness;
    st <@ Jazz_avx2.M.__state_init_avx2();
    (st, _0) <@ A1568avx2.M(A1568avx2.P).__absorb_array_avx2(st, in_0, W64.zero, 1568, 136, 6);
    offset <- W64.zero;
    (out, _1) <@ A32avx2.M(A32avx2.P).__squeeze_array_avx2(out, offset, 32, st, 136);
    
    return out;
  }
  
  proc _shake256_A32__A1600(out : W8.t Array32.t, in_0 : W8.t Array1600.t) :
    W8.t Array32.t = {
    var st : W256.t t;
    var offset : W64.t;
    var _0 : W64.t;
    var _1 : W256.t t;
    
    _1 <- witness;
    st <- witness;
    st <@ Jazz_avx2.M.__state_init_avx2();
    offset <- W64.zero;
    (st, _0) <@ A1600avx2.M(A1600avx2.P).__absorb_array_avx2(st, in_0, offset, 1600, 136, 31);
    offset <- W64.zero;
    (out, _1) <@ A32avx2.M(A32avx2.P).__squeeze_array_avx2(out, offset, 32, st, 136);
    
    return out;
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
  proc _shake256x4_A128__A32_A1(out0 : W8.t Array128.t, out1 : W8.t Array128.t, out2 : W8.t Array128.t, out3 : W8.t Array128.t, seed : W8.t Array32.t, nonces : W8.t Array4.t) :
    W8.t Array128.t * W8.t Array128.t *
    W8.t Array128.t * W8.t Array128.t = {
    var st_s : W256.t Array25.t;
    var st : W256.t Array25.t;
    var offset : W64.t;
    var _0 : int;
    var _1 : W64.t;
    var _2 : int;
    var _3 : W64.t;
    var _4 : W64.t;
    
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ Jazz_avx2.M.__state_init_avx2x4(st);
    offset <- W64.zero;
    (st, _0, _1) <@
      A32avx2x4.M(A32avx2x4.P).__absorb_bcast_array_avx2x4(st, 0, seed, offset, 32, 136, 0);
    offset <- W64.zero;
    (st, _2, _3) <@
      A1avx2x4.M(A1avx2x4.P).__absorb_array_avx2x4(st, 32,
                                      (init
                                         (fun (i : int) =>
                                            (nonces.[0 + i])%Array4))%Array1,
                                      (init
                                         (fun (i : int) =>
                                            (nonces.[1 + i])%Array4))%Array1,
                                      (init
                                         (fun (i : int) =>
                                            (nonces.[2 + i])%Array4))%Array1,
                                      (init
                                         (fun (i : int) =>
                                            (nonces.[3 + i])%Array4))%Array1,
                                      offset, 1, 136, 31);
    offset <- W64.zero;
    (out0, out1, out2, out3, _4, st) <@
      A128avx2x4.M(A128avx2x4.P).__squeeze_array_avx2x4(out0, out1, out2, out3, offset, 128,
                                         st, 136);
    st_s <- st;
    
    return (out0, out1, out2, out3);
  }
  proc _shake128x4_absorb_A32_A2(st : W256.t Array25.t, seed : W8.t Array32.t, pos : W8.t Array8.t) :
    W256.t Array25.t = {
    var offset : W64.t;
    var aT : int;
    var _0 : W64.t;
    var _1 : int;
    var _2 : W64.t;
    
    st <@ Jazz_avx2.M.__state_init_avx2x4(st);
    offset <- W64.zero;
    (st, aT, _0) <@
      A32avx2x4.M(A32avx2x4.P).__absorb_bcast_array_avx2x4(st, 0, seed, offset, 32, 168, 0);
    offset <- W64.zero;
    (st, _1, _2) <@
      A2avx2x4.M(A2avx2x4.P).__absorb_array_avx2x4(st, aT,
                                      (init (fun (i : int) => pos.[0 + i]))%Array2,
                                      (init (fun (i : int) => pos.[2 + i]))%Array2,
                                      (init (fun (i : int) => pos.[4 + i]))%Array2,
                                      (init (fun (i : int) => pos.[6 + i]))%Array2,
                                      offset, 2, 168, 31);
    
    return st;
  }
  proc _shake128x4_squeeze3blocks(st : W256.t Array25.t, buf : W8.t Array2144.t) :
    W256.t Array25.t * W8.t Array2144.t = {
    var buf0 : W8.t Array536.t;
    var buf1 : W8.t Array536.t;
    var buf2 : W8.t Array536.t;
    var buf3 : W8.t Array536.t;
    var offset : W64.t;
    
    buf0 <- witness;
    buf1 <- witness;
    buf2 <- witness;
    buf3 <- witness;
    buf0 <- (init (fun (i : int) => buf.[0 * 536 + i]))%Array536;
    buf1 <- (init (fun (i : int) => buf.[1 * 536 + i]))%Array536;
    buf2 <- (init (fun (i : int) => buf.[2 * 536 + i]))%Array536;
    buf3 <- (init (fun (i : int) => buf.[3 * 536 + i]))%Array536;
    offset <- W64.zero;
    st <@ Jazz_avx2.M._keccakf1600_avx2x4(st);
    (buf0, buf1, buf2, buf3, offset) <@
      ABUFLENavx2x4.M(ABUFLENavx2x4.P).__dumpstate_array_avx2x4(buf0, buf1, buf2, buf3, offset,
                                              168, st);
    st <@ Jazz_avx2.M._keccakf1600_avx2x4(st);
    (buf0, buf1, buf2, buf3, offset) <@
      ABUFLENavx2x4.M(ABUFLENavx2x4.P).__dumpstate_array_avx2x4(buf0, buf1, buf2, buf3, offset,
                                              168, st);
    st <@ Jazz_avx2.M._keccakf1600_avx2x4(st);
    (buf0, buf1, buf2, buf3, offset) <@
      ABUFLENavx2x4.M(ABUFLENavx2x4.P).__dumpstate_array_avx2x4(buf0, buf1, buf2, buf3, offset,
                                              200, st);
    buf <-
      (init
         (fun (i : int) =>
            if 0 * 536 <= i && i < 0 * 536 + 536 then buf0.[i - 0 * 536]
            else buf.[i]))%Array2144;
    buf <-
      (init
         (fun (i : int) =>
            if 1 * 536 <= i && i < 1 * 536 + 536 then buf1.[i - 1 * 536]
            else buf.[i]))%Array2144;
    buf <-
      (init
         (fun (i : int) =>
            if 2 * 536 <= i && i < 2 * 536 + 536 then buf2.[i - 2 * 536]
            else buf.[i]))%Array2144;
    buf <-
      (init
         (fun (i : int) =>
            if 3 * 536 <= i && i < 3 * 536 + 536 then buf3.[i - 3 * 536]
            else buf.[i]))%Array2144;
    
    return (st, buf);
  }
}.



(*********************************************************************************)
equiv sha3_512A_A33_eq:
  M._sha3_512A_A33 ~ K._sha3_512A_A33
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
 M._sha3_512A_A33
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
 [ M._sha3_512A_A33
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
 [ M._sha3_512A_A33
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
equiv sha3_512A_A64_eq:
  M._sha3_512A_A64 ~ K._sha3_512A_A64
 : ={arg} ==> ={res}
by sim.


hoare sha3_512A_A64_h' _in:
 K._sha3_512A_A64
 : in_0 = _in
 ==> to_list res = SHA3_512 (to_list _in).
proof.
proc.
ecall (A64avx2.squeeze_array_avx2_h out offset 64 st 72).
wp; ecall (A64avx2.absorb_array_avx2_h st in_0 offset 64 72 6).
wp; call state_init_avx2_h.
auto => |> &m [st ?] /= -> _ [out st2] /= -> Hst2.
rewrite stavx2_from_st25K -(Array64.of_listK W8.zero (SHA3_512 _)).
 by rewrite size_SQUEEZE1600 /#.
congr; rewrite tP => i Hi.
rewrite initiE // filliE //= Hi /=.
by congr; rewrite /SHA3_512 /c1024_r8 /KECCAK1600; congr; congr => //.
qed.

lemma sha3_512A_A64_ll: islossless K._sha3_512A_A64.
proc.
call A64avx2.squeeze_array_avx2_ll.
wp; call A64avx2.absorb_array_avx2_ll.
wp; call state_init_avx2_ll.
by auto.
qed.

phoare sha3_512A_A64_ph' _in:
 [ K._sha3_512A_A64
 : in_0 = _in
 ==> to_list res = SHA3_512 (to_list _in)
 ] = 1%r.
proof.
by conseq sha3_512A_A64_ll (sha3_512A_A64_h' _in).
qed.

phoare sha3_512A_A64_ph inp: 
 [ M._sha3_512A_A64
 : arg.`2 = inp
 ==>
  let bytes = SHA3_512_64_64 (Array32.init (fun k => inp.[k])) 
                             (Array32.init (fun k => inp.[k+32]))
  in res = Array64.init (fun k => if k < 32
                                  then bytes.`1.[k]
                                  else bytes.`2.[k-32])
 ] = 1%r.
proof.
conseq sha3_512A_A64_eq (sha3_512A_A64_ph' inp) => /> &m.
 by exists arg{m} => />.
rewrite -(Array64.of_listK W8.zero (SHA3_512 (to_list inp))).
 by rewrite size_SQUEEZE1600 /#.
move=> /Array64.to_list_inj ->.
rewrite tP => i Hi.
rewrite get_of_list 1:// initiE 1:// /= /SHA3_512_64_64 /=.
rewrite {1}/Array64.to_list (mkseq_add _ 32 32) 1..2://.
case: (i<32) => C.
 rewrite initiE 1:/# /= (nth_take _ 32) 1..2:/#; congr; congr; congr.
  apply eq_in_mkseq => k Hk /=.
  by rewrite initiE 1:/#.
 apply eq_in_mkseq => k Hk /=.
 by rewrite initiE /#.
rewrite get_of_list 1:/# nth_drop 1..2:/#; congr.
 by congr; congr; apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
smt().
qed.

phoare sha3_512A_512A_A64 m hpk:
 [ Jkem1024_avx2.M._sha3_512A_A64
 : 
   m = Array32.init (fun i => arg.`2.[i]) /\
   hpk = Array32.init (fun i => arg.`2.[i+32])
  ==> 
   let (_K,r) =  SHA3_512_64_64 m hpk in
  _K = Array32.init (fun i => res.[i]) /\
  r = Array32.init (fun i => res.[i+32])
 ] = 1%r.
proof.
rewrite /SHA3_512_64_64 /=.
pose _in := Array64.of_list witness (to_list m++to_list hpk).
conseq (: arg.`2 = _in
        ==> _).
 move=> /> &m E1 E2.
 rewrite tP => i Hi.
 case: (i < 32) => C.
  have ->: in_0{m}.[i] = m.[i].
   by rewrite E1 initiE 1:/#.
  by rewrite get_of_list 1:// nth_cat size_to_list C /=.
 have ->: in_0{m}.[i] = hpk.[i-32].
  by rewrite E2 initiE 1:/#.
 by rewrite get_of_list 1:// nth_cat size_to_list C /=.
conseq sha3_512A_A64_eq (sha3_512A_A64_ph' _in) => />.
 by move=> &m ?; exists arg{m} => /=.
move=> &m; rewrite /_in of_listK.
 by rewrite size_cat !size_to_list.
move=> <-; split.
 rewrite tP => i Hi.
 rewrite get_of_list 1:// nth_take 1..2:/#.
 by rewrite /to_list initiE 1:// nth_mkseq 1:/#.
rewrite tP => i Hi.
rewrite get_of_list 1:// nth_drop 1..2:/#.
by rewrite /to_list initiE 1:// nth_mkseq /#.
qed.

(*********************************************************************************)
from JazzEC require import Array1568.


(*********************************************************************************)
equiv sha3_256A_A1568_eq:
  Jkem1024_avx2.M._sha3_256A_A1568 ~ K._sha3_256A_A1568
 : ={arg} ==> ={res}
 by sim.

hoare sha3_256A_A1568_h' _in:
 K._sha3_256A_A1568
 : arg.`2 = _in 
 ==> 
   res = SHA3_256_1568_32
            (Array1536.init (fun i => _in.[i]),
             Array32.init (fun i => _in.[1536+i])).
proof.
proc => /=.
ecall (A32avx2.squeeze_array_avx2_h out offset 32 st 136).
wp; ecall (A1568avx2.absorb_array_avx2_h st in_0 W64.zero 1568 136 6).
wp; call state_init_avx2_h.
auto =>  /> &m.
move=> [st ?] /= => -> _.
move=> [_out ?] /= -> _.
rewrite /SHA3_256_1568_32 stavx2_from_st25K /= tP => i Hi.
rewrite initiE // filliE //= Hi /=.
rewrite /SHA3_256 /c512_r8 /KECCAK1600; congr; congr; congr => //.
rewrite (:1568=1536+32) 1:// /sub mkseq_add 1..2://; congr.
 by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
qed.

lemma sha3_256A_A1568_ll: islossless K._sha3_256A_A1568.
proof.
proc.
call A32avx2.squeeze_array_avx2_ll.
wp; call A1568avx2.absorb_array_avx2_ll.
call state_init_avx2_ll.
by auto => />.
qed.

phoare sha3_256A_A1568_ph' _in:
 [ K._sha3_256A_A1568
 : arg.`2 = _in 
 ==> 
   res = SHA3_256_1568_32
            (Array1536.init (fun i => _in.[i]),
             Array32.init (fun i => _in.[1536+i]))
 ] = 1%r.
proof. by conseq sha3_256A_A1568_ll (sha3_256A_A1568_h' _in). qed.

phoare sha3_256A_M1568_ph (inp : W8.t Array1568.t):
 [ Jkem1024_avx2.M._sha3_256A_A1568
 : arg.`2 = inp 
 ==> 
   res = SHA3_256_1568_32
            (Array1536.init (fun i => inp.[i]),
             Array32.init (fun i => inp.[1536+i]))
 ] = 1%r.
proof.
by conseq sha3_256A_A1568_eq (sha3_256A_A1568_ph' inp) => /> /#.
qed.

(*********************************************************************************)


from JazzEC require import Array1408 Array160.


(*********************************************************************************)
equiv shake256_A32__A1600_eq:
  Jkem1024_avx2.M._shake256_A32__A1600 ~ K._shake256_A32__A1600
 : ={arg, Glob.mem} ==> ={res, Glob.mem}
 by sim.

hoare shake256_A32__A1600_h' _in:
 K._shake256_A32__A1600
 : arg.`2=_in
 ==>
   res = SHAKE_256_1600_32
           (init (fun (k : int) => _in.[k]))%Array32
           ((init (fun (k : int) => _in.[32 + k]))%Array1408,
            (init (fun (k : int) => _in.[1408 + 32 + k]))%Array160).
proof.
proc => /=.
ecall (A32avx2.squeeze_array_avx2_h out offset 32 st 136).
wp; ecall (A1600avx2.absorb_array_avx2_h st in_0 offset 1600 136 31).
wp; call state_init_avx2_h.
auto => |> &m [st ?] /= -> _ [out st2] /= -> Hst2.
rewrite stavx2_from_st25K /SHAKE_256_1600_32 -(Array32.of_listK W8.zero (SHAKE256 _ _)).
 by rewrite size_SHAKE256 /#.
rewrite tP => i Hi.
rewrite filliE 1:// /= Hi /= get_of_list 1://.
rewrite of_listK.
 by rewrite size_SHAKE256 /#.
rewrite /SHAKE256 /KECCAK1600; congr; congr; 1:smt().
congr; 1..2:smt().
rewrite (:1600=32+1408+160) 1:// /sub !mkseq_add 1..4:/#; congr.
 congr.
  by apply eq_in_mkseq => k Hk /=; rewrite initiE.
 by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
qed.

lemma shake256_A32__A1600_ll: islossless K._shake256_A32__A1600.
proof.
proc.
call A32avx2.squeeze_array_avx2_ll.
wp; call A1600avx2.absorb_array_avx2_ll.
wp; call state_init_avx2_ll.
by auto.
qed.

phoare shake256_A32__A1600_ph' _in:
 [ K._shake256_A32__A1600
 : arg.`2=_in
 ==>
   res = SHAKE_256_1600_32
           (init (fun (k : int) => _in.[k]))%Array32
           ((init (fun (k : int) => _in.[32 + k]))%Array1408,
            (init (fun (k : int) => _in.[1408 + 32 + k]))%Array160)
 ] = 1%r.
proof.
by conseq shake256_A32__A1600_ll (shake256_A32__A1600_h' _in).
qed.

phoare shake256_A32_A1600_ph (_in : W8.t Array1600.t):
 [ Jkem1024_avx2.M._shake256_A32__A1600
 : arg.`2=_in
 ==> res = SHAKE_256_1600_32 
               (init (fun (k : int) => _in.[k]))%Array32
               ((init (fun (k : int) => _in.[32 + k]))%Array1408,
                (init (fun (k : int) => _in.[1408 + 32 + k]))%Array160)
 ] = 1%r.
proof.
by conseq shake256_A32__A1600_eq (shake256_A32__A1600_ph' _in) => /> /#.
qed.

(*********************************************************************************)
(* 
equiv shake128_absorb_A32_A2_eq:
  M._shake128_absorb_A32_A2 ~ K._shake128_absorb_A32_A2
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
*)
op stmatch_avx2 st stavx2 =
 stavx2 = stavx2_from_st25 st.
(* 
phoare shake128_absorb_A32_A2_ph _rho _rc:
 [ Jkem1024_avx2.M._shake128_absorb_A32_A2
   : seed = _rho /\ pos = _rc
     ==>
     stmatch_avx2 (SHAKE128_ABSORB (to_list _rho ++ to_list _rc)) res
 ] = 1%r.
proof.
by conseq shake128_absorb_A32_A2_eq (shake128_absorb_A32_A2_ph' _rho _rc) => /> /#.
qed.
*)
(*********************************************************************************)
(* 
equiv shake128_squeeze3blocks_eq:
  M._shake128_squeeze3blocks ~ K._shake128_squeeze3blocks
 : ={arg} ==> ={res}
by sim.

hoare shake128_squeeze3blocks_h' _buf _st:
 K._shake128_squeeze3blocks
 : buf=_buf /\ st=stavx2_from_st25 _st
 ==> sub res (0*168) 168 = squeezestate_i 168 _st 0
  /\ sub res (1*168) 168 = squeezestate_i 168 _st 1
  /\ sub res (2*168) 168 = squeezestate_i 168 _st 2
  /\ sub res (2*168) 200 = state2bytes (FIPS202_SHA3_Spec.st_i _st 3).
proof.
proc.
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
+ apply (eq_from_nth W8.zero).
   by rewrite size_sub 1:// size_take' 1:// size_state2bytes.
  rewrite size_sub 1:// iter1 => i Hi.
  rewrite nth_sub 1:// nth_take 1..2:/# filliE 1:/# ifF 1:/#.
  rewrite filliE 1:/# ifF 1:/# filliE 1:/# ifT 1:/#.
  by rewrite initiE 1:/# /= state2bytesE initiE 1:/#.
+ apply (eq_from_nth W8.zero).
   by rewrite size_sub 1:// size_take' 1:// size_state2bytes.
  rewrite size_sub 1:// iter2 => i Hi.
  rewrite nth_sub 1:// nth_take 1..2:/# filliE 1:/# ifF 1:/#.
  rewrite filliE 1:/# ifT 1:/# /=.
  by rewrite initiE 1:/# /= state2bytesE initiE 1:/#.
+ apply (eq_from_nth W8.zero).
   by rewrite size_sub 1:// size_take' 1:// size_state2bytes.
  rewrite size_sub 1:// (:3=2+1) 1:// iterS 1:// iter2 => i Hi.
  rewrite nth_sub 1:// nth_take 1..2:/# filliE 1:/# ifT 1:/# /=.
  by rewrite initiE 1:/# /= state2bytesE initiE 1:/#.
+ apply (eq_from_nth W8.zero).
   by rewrite size_sub 1:// size_state2bytes.
  rewrite size_sub 1:// (:3=2+1) 1:// iterS 1:// iter2 => i Hi.
  rewrite nth_sub 1:// filliE 1:/# ifT 1:/# /=.
  by rewrite initiE 1:/# /= state2bytesE initiE 1:/#.
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
 [ M._shake128_squeeze3blocks
 : buf=_buf /\ st=stavx2_from_st25 _st
 ==> sub res (0*168) 168 = squeezestate_i 168 _st 0
  /\ sub res (1*168) 168 = squeezestate_i 168 _st 1
  /\ sub res (2*168) 168 = squeezestate_i 168 _st 2
  /\ sub res (2*168) 200 = state2bytes (FIPS202_SHA3_Spec.st_i _st 3)
 ] = 1%r.
proof.
by conseq shake128_squeeze3blocks_eq (shake128_squeeze3blocks_ph' _buf _st) => /> /#.
qed.
*)
(*********************************************************************************)
equiv shake128_next_state_eq:
  M._shake128_next_state ~ K._shake128_next_state
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
apply (eq_from_nth W8.zero).
 by rewrite size_sub 1:// size_state2bytes.
rewrite size_sub 1:// => i Hi.
rewrite nth_sub 1:// filliE 1:/# ifT 1:/# /=.
rewrite initiE 1:/# /= state2bytesE initiE 1:/# /=.
congr; congr; congr.
rewrite tP => k Hk.
rewrite !initiE 1..2:// /= nth_w64L_from_bytes 1:/#.
rewrite get64E /=; congr.
apply W8u8.Pack.ext_eq => j Hj.
rewrite initiE 1:// get_of_list 1:// /= initiE 1:/#.
rewrite nth_take 1..2:/# nth_drop 1..2:/# nth_sub 1:/# /=.
congr; smt().
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
 [ Jkem1024_avx2.M._shake128_next_state
 : buf = _buf
   ==>
   let st = bytes2state (sub _buf (2*168) 200) in
   sub res (2*168) 200 = state2bytes (keccak_f1600_op st)
 ] = 1%r.
proof.
by conseq shake128_next_state_eq (shake128_next_state_ph' _buf) => /> /#.
qed.

(*********************************************************************************)
(*********************************************************************************)

from Keccak require import Keccak1600_avx2x4.


(*********************************************************************************)

equiv shake256x4_A128__A32_A1_eq:
  M._shake256x4_A128__A32_A1 ~ K._shake256x4_A128__A32_A1
 : ={arg} ==> ={res}
by sim.

hoare shake256x4_A128__A32_A1_h' _seed _nonces :
 K._shake256x4_A128__A32_A1
 : seed = _seed /\ nonces = _nonces 
 ==>
    res.`1 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[0]]) 128)
 /\ res.`2 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[1]]) 128)
 /\ res.`3 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[2]]) 128)
 /\ res.`4 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[3]]) 128).
proof.
proc.
wp; ecall (A128avx2x4.squeeze_array_avx2x4_h out0 out1 out2 out3 offset 128 st 136)=> /=.
wp; ecall (A1avx2x4.absorb_array_avx2x4_h 
 (to_list _seed) (to_list _seed) (to_list _seed) (to_list _seed) st
 (Array1.init (fun (i : int) => nonces.[0 + i]))
 (Array1.init (fun (i : int) => nonces.[1 + i]))
 (Array1.init (fun (i : int) => nonces.[2 + i]))
 (Array1.init (fun (i : int) => nonces.[3 + i]))
 offset 1 136 31) => /=.
wp; ecall (A32avx2x4.absorb_bcast_array_avx2x4_h
 [<:W8.t>] [<:W8.t>] [<:W8.t>] [<:W8.t>] st seed offset 32 136 0).
wp; call state_init_avx2x4_h.
auto => |> &m s1 ->; split.
 split => //; rewrite !chunk0 1:// /chunkremains /=.
 by rewrite /stateabsorb_iblocks /= addstate_st0 bytes2state0 /#.
move=> H1 []s2 ?? /= /> H2.
rewrite size_to_list /= => H2'.
move=> []s3 ?? /= />.
rewrite /absorb_spec_avx2x4 /match_state4x => ->.
move => []o0 o1 o2 o3 ?? /= -> -> -> -> ?.
do (split);
 rewrite tP => i Hi;
 rewrite initiE 1:// filliE 1:// Hi /= a25pack4_bits64 1:// /=;
 rewrite /SHAKE256 /sub /mkseq -iotaredE /= /#.
qed.

lemma shake256x4_A128__A32_A1_ll: islossless K._shake256x4_A128__A32_A1.
proof.
proc => /=.
wp; call A128avx2x4.squeeze_array_avx2x4_ll.
wp; call A1avx2x4.absorb_array_avx2x4_ll.
wp; call A32avx2x4.absorb_bcast_array_avx2x4_ll.
wp; call state_init_avx2x4_ll.
by auto => />.
qed.

phoare shake256x4_A128__A32_A1_ph' _seed _nonces :
 [ K._shake256x4_A128__A32_A1
 : seed = _seed /\ nonces = _nonces 
 ==>
    res.`1 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[0]]) 128)
 /\ res.`2 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[1]]) 128)
 /\ res.`3 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[2]]) 128)
 /\ res.`4 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[3]]) 128)
 ] = 1%r.
proof.
by conseq shake256x4_A128__A32_A1_ll (shake256x4_A128__A32_A1_h' _seed _nonces).
qed.

phoare shake256x4_A128__A32_A1_ph _seed _nonces :
 [ 
   Jkem1024_avx2.M._shake256x4_A128__A32_A1
 : seed = _seed /\ nonces = _nonces 
 ==>
    res.`1 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[0]]) 128)
 /\ res.`2 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[1]]) 128)
 /\ res.`3 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[2]]) 128)
 /\ res.`4 = Array128.of_list W8.zero (SHAKE256 (to_list _seed ++ [_nonces.[3]]) 128)
 ] = 1%r.
proof.
by conseq shake256x4_A128__A32_A1_eq (shake256x4_A128__A32_A1_ph' _seed _nonces) => /> /#.
qed.


(*********************************************************************************)

equiv shake128x4_absorb_A32_A2_eq:
  M._shake128x4_absorb_A32_A2 ~ K._shake128x4_absorb_A32_A2
 : ={arg} ==> ={res}
by sim.

hoare shake128x4_absorb_A32_A2_h' _rho _rc:
 K._shake128x4_absorb_A32_A2
 : seed = _rho /\ pos = _rc
 ==>
    match_state4x
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 0 2)) 
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 2 2)) 
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 4 2)) 
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 6 2)) 
    res.
proof.
proc => /=.
wp; ecall (A2avx2x4.absorb_array_avx2x4_h 
 (to_list _rho) (to_list _rho) (to_list _rho) (to_list _rho) st
 (Array2.init (fun (i : int) => pos.[0 + i]))
 (Array2.init (fun (i : int) => pos.[2 + i]))
 (Array2.init (fun (i : int) => pos.[4 + i]))
 (Array2.init (fun (i : int) => pos.[6 + i]))
 offset 2 168 31) => /=.
wp; ecall (A32avx2x4.absorb_bcast_array_avx2x4_h
 [<:W8.t>] [<:W8.t>] [<:W8.t>] [<:W8.t>] st seed offset 32 168 0).
wp; call state_init_avx2x4_h.
auto => |> s1 ->; split.
 split => //; rewrite !chunk0 1:// /chunkremains /=.
 by rewrite /stateabsorb_iblocks /= addstate_st0 bytes2state0 /#.
move=> H1 []s2 ?? /= /> H2.
rewrite size_to_list /= => H2'.
move=> []s3 ?? /= />.
rewrite /absorb_spec_avx2x4 /match_state4x => ->.
have L: forall x, x\in[0;2;4;6] => sub ((init (fun i=> _rc.[x+i])))%Array2 0 2 = sub _rc x 2.
 by move=> i /= []Hi; apply eq_in_mkseq => j Hj /=; rewrite initiE //=.
rewrite !L //=; congr; congr; congr;1..2,4..: smt().
congr.
by smt(Array2.initiE Array2.tP).
qed.

lemma shake128x4_absorb_A32_A2_ll: islossless K._shake128x4_absorb_A32_A2.
proof.
proc => /=.
call A2avx2x4.absorb_array_avx2x4_ll.
wp; call A32avx2x4.absorb_bcast_array_avx2x4_ll.
wp; call state_init_avx2x4_ll.
by auto => />.
qed.

phoare shake128x4_absorb_A32_A2_ph' _rho _rc:
 [ K._shake128x4_absorb_A32_A2
 : seed = _rho /\ pos = _rc
 ==>
    match_state4x
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 0 2)) 
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 2 2)) 
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 4 2)) 
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 6 2)) 
    res
 ] = 1%r.
proof.
by conseq shake128x4_absorb_A32_A2_ll (shake128x4_absorb_A32_A2_h' _rho _rc).
qed.

phoare shake128x4_absorb_A32_A2_ph _rho _rc:
 [ Jkem1024_avx2.M._shake128x4_absorb_A32_A2
 : seed = _rho /\ pos = _rc
 ==>
    match_state4x
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 0 2)) 
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 2 2)) 
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 4 2)) 
    (SHAKE128_ABSORB (to_list _rho ++ sub _rc 6 2)) 
    res
 ] = 1%r.
proof.
by conseq shake128x4_absorb_A32_A2_eq (shake128x4_absorb_A32_A2_ph' _rho _rc) => /> /#.
qed.

(*********************************************************************************)

equiv shake128x4_squeeze3blocks_eq:
  M._shake128x4_squeeze3blocks ~ K._shake128x4_squeeze3blocks
 : ={arg} ==> ={res}
by sim.

hoare shake128x4_squeeze3blocks_h' _st0 _st1 _st2 _st3:
 K._shake128x4_squeeze3blocks
 : match_state4x _st0 _st1 _st2 _st3 st
 ==>
      sub res.`2 (0*536) (3*168) = SHAKE128_SQUEEZE (3*168) _st0
   /\ sub res.`2 (1*536) (3*168) = SHAKE128_SQUEEZE (3*168) _st1
   /\ sub res.`2 (2*536) (3*168) = SHAKE128_SQUEEZE (3*168) _st2
   /\ sub res.`2 (3*536) (3*168) = SHAKE128_SQUEEZE (3*168) _st3
   /\ sub res.`2 (0*536+2*168) 200 = state2bytes (st_i _st0 3)
   /\ sub res.`2 (1*536+2*168) 200 = state2bytes (st_i _st1 3)
   /\ sub res.`2 (2*536+2*168) 200 = state2bytes (st_i _st2 3)
   /\ sub res.`2 (3*536+2*168) 200 = state2bytes (st_i _st3 3).
proof.
proc => /=.
wp.
ecall (ABUFLENavx2x4.dumpstate_array_avx2x4_h buf0 buf1 buf2 buf3 offset 200 st).
ecall (keccakf1600_avx2x4_h st).
ecall (ABUFLENavx2x4.dumpstate_array_avx2x4_h buf0 buf1 buf2 buf3 offset 168 st).
ecall (keccakf1600_avx2x4_h st).
ecall (ABUFLENavx2x4.dumpstate_array_avx2x4_h buf0 buf1 buf2 buf3 offset 168 st).
ecall (keccakf1600_avx2x4_h st).
auto => /> &m Hst.
rewrite !map_state4x_a25bits64 //.
move=> []b01 b11 b21 b31 ? /= Eb01 Eb11 Eb21 Eb31 ->; split.
 by rewrite of_uintK /#.
move=> _[]b02 b12 b22 b32 ? /= Eb02 Eb12 Eb22 Eb32 ->; split.
 by rewrite of_uintK /#.
move=> _[]b03 b13 b23 b33 ? /= Eb03 Eb13 Eb23 Eb33 _.
split.
 apply (eq_from_nth W8.zero).
  by rewrite size_sub 1:// size_SQUEEZE1600 /#.
 move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifF 1:/# /=.
 rewrite initiE 1:/# /= ifF 1:/# initiE 1:/# /= ifF 1:/# initiE 1:/# /= ifT 1:/#.
 rewrite Eb03 filliE 1:/# /=.
 case: (i < 336) => C3.
  rewrite ifF 1:/# Eb02 filliE 1:/# /=.
  case: (i < 168) => C2.
   rewrite ifF 1:/# Eb01 filliE 1:/# /= ifT 1:/# nth_SQUEEZE1600 1..2:/#.
   by rewrite divz_small 1:/# /= /st_i iter1 modz_small 1:/# Hst a25pack4_bits64 /#.
  rewrite ifT 1:/# nth_SQUEEZE1600 1..2:/#.
  rewrite (:i %/ c256_r8 = 1) 1:/# /st_i iter2 (:i %% c256_r8 = i-168) 1:/#.
  by rewrite Hst a25pack4_bits64 /#.
 rewrite ifT 1:/# nth_SQUEEZE1600 1..2:/#.
 rewrite (:i %/ c256_r8 = 2) 1:/# /st_i iterS 1:// iter2 (:i %% c256_r8 = i-336) 1:/#.
 by rewrite Hst a25pack4_bits64 /#.
split.
 apply (eq_from_nth W8.zero).
  by rewrite size_sub 1:// size_SQUEEZE1600 /#.
 move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifF 1:/# /=.
 rewrite initiE 1:/# /= ifF 1:/# initiE 1:/# /=.
 rewrite ifT 1:/#.
 rewrite Eb13 filliE 1:/# /=.
 case: (i < 336) => C3.
  rewrite ifF 1:/# Eb12 filliE 1:/# /=.
  case: (i < 168) => C2.
   rewrite ifF 1:/# Eb11 filliE 1:/# /= ifT 1:/# nth_SQUEEZE1600 1..2:/#.
   by rewrite divz_small 1:/# /= /st_i iter1 modz_small 1:/# Hst a25pack4_bits64 /#.
  rewrite ifT 1:/# nth_SQUEEZE1600 1..2:/#.
  rewrite (:i %/ c256_r8 = 1) 1:/# /st_i iter2 (:i %% c256_r8 = i-168) 1:/#.
  by rewrite Hst a25pack4_bits64 /#.
 rewrite ifT 1:/# nth_SQUEEZE1600 1..2:/#.
 rewrite (:i %/ c256_r8 = 2) 1:/# /st_i iterS 1:// iter2 (:i %% c256_r8 = i-336) 1:/#.
 by rewrite Hst a25pack4_bits64 /#.
split.
 apply (eq_from_nth W8.zero).
  by rewrite size_sub 1:// size_SQUEEZE1600 /#.
 move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifF 1:/# /=.
 rewrite initiE 1:/# /= ifT 1:/#.
 rewrite Eb23 filliE 1:/# /=.
 case: (i < 336) => C3.
  rewrite ifF 1:/# Eb22 filliE 1:/# /= nth_SQUEEZE1600 1..2:/#.
  case: (i < 168) => C2.
   rewrite ifF 1:/# Eb21 filliE 1:/# /= ifT 1:/#.
   by rewrite divz_small 1:/# /= /st_i iter1 modz_small 1:/# Hst a25pack4_bits64 /#.
  rewrite ifT 1:/#.
  rewrite (:i %/ c256_r8 = 1) 1:/# /st_i iter2 (:i %% c256_r8 = i-168) 1:/#.
  by rewrite Hst a25pack4_bits64 /#.
 rewrite ifT 1:/# nth_SQUEEZE1600 1..2:/#.
 rewrite (:i %/ c256_r8 = 2) 1:/# /st_i iterS 1:// iter2 (:i %% c256_r8 = i-336) 1:/#.
 by rewrite Hst a25pack4_bits64 /#.
split.
 apply (eq_from_nth W8.zero).
  by rewrite size_sub 1:// size_SQUEEZE1600 /#.
 move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifT 1:/# /=.
 rewrite Eb33 filliE 1:/# /=.
 case: (i < 336) => C3.
  rewrite ifF 1:/# Eb32 filliE 1:/# /= nth_SQUEEZE1600 1..2:/#.
  case: (i < 168) => C2.
   rewrite ifF 1:/# Eb31 filliE 1:/# /= ifT 1:/#.
   by rewrite divz_small 1:/# /= /st_i iter1 modz_small 1:/# Hst a25pack4_bits64 /#.
  rewrite ifT 1:/#.
  rewrite (:i %/ c256_r8 = 1) 1:/# /st_i iter2 (:i %% c256_r8 = i-168) 1:/#.
  by rewrite Hst a25pack4_bits64 /#.
 rewrite ifT 1:/# nth_SQUEEZE1600 1..2:/#.
 rewrite (:i %/ c256_r8 = 2) 1:/# /st_i iterS 1:// iter2 (:i %% c256_r8 = i-336) 1:/#.
 by rewrite Hst a25pack4_bits64 /#.
split.
 apply (eq_from_nth W8.zero).
  by rewrite size_sub 1:// size_state2bytes /#.
 move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifF 1:/# /=.
 rewrite initiE 1:/# /= ifF 1:/# initiE 1:/# /= ifF 1:/# initiE 1:/# /= ifT 1:/#.
 rewrite Eb03 filliE 1:/# /= ifT 1:/#.
 rewrite /st_i (:3=2+1) 1:// iterS 1:// iter2.
 by rewrite Hst a25pack4_bits64 //= state2bytesE.
split.
 apply (eq_from_nth W8.zero).
  by rewrite size_sub 1:// size_state2bytes /#.
 move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifF 1:/# /=.
 rewrite initiE 1:/# /= ifF 1:/# initiE 1:/# /= ifT 1:/# /=.
 rewrite Eb13 filliE 1:/# /= ifT 1:/#.
 rewrite /st_i (:3=2+1) 1:// iterS 1:// iter2.
 by rewrite Hst a25pack4_bits64 //= state2bytesE.
split.
 apply (eq_from_nth W8.zero).
  by rewrite size_sub 1:// size_state2bytes /#.
 move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifF 1:/# /=.
 rewrite initiE 1:/# /= ifT 1:/# /=.
 rewrite Eb23 filliE 1:/# /= ifT 1:/#.
 rewrite /st_i (:3=2+1) 1:// iterS 1:// iter2.
 by rewrite Hst a25pack4_bits64 //= state2bytesE.
apply (eq_from_nth W8.zero).
 by rewrite size_sub 1:// size_state2bytes /#.
move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifT 1:/# /=.
rewrite Eb33 filliE 1:/# /= ifT 1:/#.
rewrite /st_i (:3=2+1) 1:// iterS 1:// iter2.
by rewrite Hst a25pack4_bits64 //= state2bytesE.
qed.

lemma shake128x4_squeeze3blocks_ll: islossless K._shake128x4_squeeze3blocks.
proof.
proc.
wp; call ABUFLENavx2x4.dumpstate_array_avx2x4_ll.
call keccakf1600_avx2x4_ll.
call ABUFLENavx2x4.dumpstate_array_avx2x4_ll.
call keccakf1600_avx2x4_ll.
call ABUFLENavx2x4.dumpstate_array_avx2x4_ll.
call keccakf1600_avx2x4_ll.
by auto => />.
qed.

phoare shake128x4_squeeze3blocks_ph' _st0 _st1 _st2 _st3:
 [ K._shake128x4_squeeze3blocks
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
proof.
by conseq shake128x4_squeeze3blocks_ll (shake128x4_squeeze3blocks_h' _st0 _st1 _st2 _st3).
qed.

phoare shake128x4_squeeze3blocks_ph _st0 _st1 _st2 _st3:
 [ Jkem1024_avx2.M._shake128x4_squeeze3blocks
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
proof.
by conseq shake128x4_squeeze3blocks_eq (shake128x4_squeeze3blocks_ph' _st0 _st1 _st2 _st3) => /> /#.
qed.

