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
 M.__state_init_avx2 ~ Keccak1600_Jazz.M.__state_init_avx2
 : ={arg} ==> ={res}
 by sim.

equiv addratebit_avx2_eq:
 M.__addratebit_avx2 ~ Keccak1600_Jazz.M.__addratebit_avx2
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
(****************************************************************************)
from Keccak require import Keccak1600_avx2x4.

equiv state_init_avx2x4_eq:
 M.__state_init_avx2x4 ~ Keccak1600_Jazz.M.__state_init_avx2x4
 : ={arg} ==> ={res}
 by sim.

equiv addratebit_avx2x4_eq:
 M.__addratebit_avx2x4 ~ Keccak1600_Jazz.M.__addratebit_avx2x4
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
(****************************************************************************)

from Keccak require import Keccakf1600_ref Keccakf1600_avx2x4.
from JazzEC require import WArray1536.
from JazzEC require import Array24 Array5.

from Keccak require import Keccak1600_fixedsizes_avx2.
from Keccak require import Keccak1600_fixedsizes_avx2x4.

(****************************************************************************)
from JazzEC require import Array1 WArray1.   (* nonce *)

clone KeccakArrayAvx2x4 as A1avx2x4
 with op _ASIZE <- 1,
      theory A <- Array1,
      theory WA <- WArray1
      proof _ASIZE_ge0 by done.

equiv a1__absorb_avx2x4_eq:
 M.a1____absorb_avx2x4 ~ A1avx2x4.MM.__absorb_avx2x4
 : ={arg} ==> ={res}
 by sim.


clone KeccakArrayAvx2 as A1avx2
 with op _ASIZE <- 1,
      theory A <- Array1,
      theory WA <- WArray1
      proof _ASIZE_ge0 by done.

equiv a1__absorb_avx2_eq:
 M.a1____absorb_avx2 ~ A1avx2.MM.__absorb_avx2
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array2 WArray2.   (* mat. position *)

clone KeccakArrayAvx2x4 as A2avx2x4
 with op _ASIZE <- 2,
      theory A <- Array2,
      theory WA <- WArray2
      proof _ASIZE_ge0 by done.

(****************************************************************************)
from JazzEC require import Array32 WArray32.  (* SEED SIZE *)

clone KeccakArrayAvx2 as A32avx2
 with op _ASIZE <- 32,
      theory A <- Array32,
      theory WA <- WArray32
      proof _ASIZE_ge0 by done.
clone KeccakArrayAvx2x4 as A32avx2x4
 with op _ASIZE <- 32,
      theory A <- Array32,
      theory WA <- WArray32
      proof _ASIZE_ge0 by done.

equiv a32__absorb_avx2_eq:
 M.a32____absorb_avx2 ~ A32avx2.MM.__absorb_avx2
 : ={arg} ==> ={res}
 by sim.

equiv a32__squeeze_avx2_eq:
 M.a32____squeeze_avx2 ~ A32avx2.MM.__squeeze_avx2
 : ={arg} ==> ={res}
 by sim.

equiv a32__absorb_avx2x4_eq:
 M.a32____absorb_bcast_avx2x4 ~ A32avx2x4.MM.__absorb_bcast_avx2x4
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array33 WArray33.  (* DS SEED SIZE *)

clone KeccakArrayAvx2 as A33avx2
 with op _ASIZE <- 33,
      theory A <- Array33,
      theory WA <- WArray33
      proof _ASIZE_ge0 by done.

equiv a33__absorb_avx2_eq:
 M.a33____absorb_avx2 ~ A33avx2.MM.__absorb_avx2
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array64 WArray64.  (* DS SEED SIZE *)

clone KeccakArrayAvx2 as A64avx2
 with op _ASIZE <- 64,
      theory A <- Array64,
      theory WA <- WArray64
      proof _ASIZE_ge0 by done.

equiv a64__absorb_avx2_eq:
 M.a64____absorb_avx2 ~ A64avx2.MM.__absorb_avx2
 : ={arg} ==> ={res}
 by sim.

equiv a64__squeeze_avx2_eq:
 M.a64____squeeze_avx2 ~ A64avx2.MM.__squeeze_avx2
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array128 WArray128. 

clone KeccakArrayAvx2x4 as A128avx2x4
 with op _ASIZE <- 128,
      theory A <- Array128,
      theory WA <- WArray128
      proof _ASIZE_ge0 by done.

equiv a128__squeeze_avx2x4_eq:
 M.a128____squeeze_avx2x4 ~ A128avx2x4.MM.__squeeze_avx2x4
 : ={arg} ==> ={res}
 by sim.

clone KeccakArrayAvx2 as A128avx2
 with op _ASIZE <- 128,
      theory A <- Array128,
      theory WA <- WArray128
      proof _ASIZE_ge0 by done.

equiv a128__squeeze_avx2_eq:
 M.a128____squeeze_avx2 ~ A128avx2.MM.__squeeze_avx2
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array536 WArray536. (* BUF_SIZE *)

clone KeccakArrayAvx2 as ABUFLENavx2
 with op _ASIZE <- 536,
      theory A <- Array536,
      theory WA <- WArray536
      proof _ASIZE_ge0 by done.
clone KeccakArrayAvx2x4 as ABUFLENavx2x4
 with op _ASIZE <- 536,
      theory A <- Array536,
      theory WA <- WArray536
      proof _ASIZE_ge0 by done.

(*
equiv aBUFLEN__dumpstate_avx2_eq:
 M.aBUFLEN____dumpstate_avx2 ~ ABUFLENavx2.MM.__dumpstate_array_avx2
 : ={arg} ==> ={res}
 by sim.
*)

equiv aBUFLEN__dumpstate_avx2x4_eq:
 M.aBUFLEN____dumpstate_avx2x4 ~ ABUFLENavx2x4.MM.__dumpstate_avx2x4
 : ={arg} ==> ={res}
 by sim.

(****************************************************************************)
from JazzEC require import Array1568 WArray1568.

clone KeccakArrayAvx2 as A1568avx2
 with op _ASIZE <- 1568,
      theory A <- Array1568,
      theory WA <- WArray1568
      proof _ASIZE_ge0 by done.

equiv a1568__absorb_avx2_eq:
 M.a1568____absorb_avx2 ~ A1568avx2.MM.__absorb_avx2
 : ={arg} ==> ={res}
 by sim.


(****************************************************************************)
from JazzEC require import Array1600 WArray1600.

clone KeccakArrayAvx2 as A1600avx2
 with op _ASIZE <- 1600,
      theory A <- Array1600,
      theory WA <- WArray1600
      proof _ASIZE_ge0 by done.

equiv a1600__absorb_avx2_eq:
 M.a1600____absorb_avx2 ~ A1600avx2.MM.__absorb_avx2
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
  proc _sha3_512A_A33 (out:W8.t Array64.t, in_0:W8.t Array33.t) : W8.t Array64.t = {
    var st:W256.t Array7.t;
    var  _0:int;
    var  _1:W256.t Array7.t;
     _1 <- witness;
    st <- witness;
    st <@ Keccak1600_Jazz.M.__state_init_avx2 ();
    (st,  _0) <@ A33avx2.MM.__absorb_avx2 (st, 0, in_0, 6, 72);
    ( _1, out) <@ A64avx2.MM.__squeeze_avx2 (st, out, 72);
    return out;
  }
  proc _sha3_512A_A64 (out:W8.t Array64.t, in_0:W8.t Array64.t) : W8.t Array64.t = {
    var st:W256.t Array7.t;
    var  _0:int;
    var  _1:W256.t Array7.t;
     _1 <- witness;
    st <- witness;
    st <@ Keccak1600_Jazz.M.__state_init_avx2 ();
    (st,  _0) <@ A64avx2.MM.__absorb_avx2 (st, 0, in_0, 6, 72);
    ( _1, out) <@ A64avx2.MM.__squeeze_avx2 (st, out, 72);
    return out;
  }
  proc _shake256_A128__A32_A1 (out:W8.t Array128.t, seed:W8.t Array32.t,
                               nonce:W8.t Array1.t) : W8.t Array128.t = {
    var st:W256.t Array7.t;
    var  _0:int;
    var  _1:int;
    var  _2:W256.t Array7.t;
     _2 <- witness;
    st <- witness;
    st <@ Keccak1600_Jazz.M.__state_init_avx2 ();
    (st,  _0) <@ A32avx2.MM.__absorb_avx2 (st, 0, seed, 0, 136);
    (st,  _1) <@ A1avx2.MM.__absorb_avx2 (st, 32, nonce, 31, 136);
    ( _2, out) <@ A128avx2.MM.__squeeze_avx2 (st, out, 136);
    return out;
  }
  proc _shake256x4_A128__A32_A1 (out0:W8.t Array128.t, out1:W8.t Array128.t,
                                 out2:W8.t Array128.t, out3:W8.t Array128.t,
                                 seed:W8.t Array32.t, nonces:W8.t Array4.t) : 
  W8.t Array128.t * W8.t Array128.t * W8.t Array128.t * W8.t Array128.t = {
    var st_s:W256.t Array25.t;
    var st:W256.t Array25.t;
    var  _0:int;
    var  _1:int;
    st <- witness;
    st_s <- witness;
    st <- st_s;
    st <@ Keccak1600_Jazz.M.__state_init_avx2x4 (st);
    (st,  _0) <@ A32avx2x4.MM.__absorb_bcast_avx2x4 (st, 0, seed, 0, 136);
    (st,  _1) <@ A1avx2x4.MM.__absorb_avx2x4 (st, 32,
    (Array1.init (fun i => nonces.[(0 + i)])),
    (Array1.init (fun i => nonces.[(1 + i)])),
    (Array1.init (fun i => nonces.[(2 + i)])),
    (Array1.init (fun i => nonces.[(3 + i)])), 31, 136);
    (st, out0, out1, out2, out3) <@ A128avx2x4.MM.__squeeze_avx2x4 (st, out0, 
    out1, out2, out3, 136);
    return (out0, out1, out2, out3);
  }
  proc _shake128x4_absorb_A32_A2 (st:W256.t Array25.t, seed:W8.t Array32.t,
                                  pos:W8.t Array8.t) : W256.t Array25.t = {
    var aT:int;
    var  _0:int;
    st <@ Keccak1600_Jazz.M.__state_init_avx2x4 (st);
    (st, aT) <@ A32avx2x4.MM.__absorb_bcast_avx2x4 (st, 0, seed, 0, 168);
    (st,  _0) <@ A2avx2x4.MM.__absorb_avx2x4 (st, 32,
    (Array2.init (fun i => pos.[(0 + i)])),
    (Array2.init (fun i => pos.[(2 + i)])),
    (Array2.init (fun i => pos.[(4 + i)])),
    (Array2.init (fun i => pos.[(6 + i)])), 31, 168);
    return st;
  }
  proc _shake128_next_state (buf:W8.t Array536.t) : W8.t Array536.t = {
    var pst:W64.t Array25.t;
    pst <- witness;
    pst <-
    (Array25.init
    (fun i => (get64 (WArray536.init8 (fun i => buf.[i]))
              ((2 * (168 %/ 8)) + i)))
    );
    pst <@ Keccak1600_Jazz.M._keccakf1600_st25_avx2 (pst);
    buf <-
    (Array536.init
    (WArray536.get8
    (WArray536.init8
    (fun i => (if ((8 * (2 * (168 %/ 8))) <= i < ((8 * (2 * (168 %/ 8))) +
                                                 200)) then (WArray200.get8
                                                            (WArray200.init64
                                                            (fun i => 
                                                            pst.[i]))
                                                            (i -
                                                            (8 *
                                                            (2 * (168 %/ 8))))
                                                            ) else (
                                                                   WArray536.get8
                                                                   (
                                                                   WArray536.init8
                                                                   (fun i => 
                                                                   buf.[
                                                                   i])) 
                                                                   i)))
    )));
    return buf;
  }
  proc _shake128x4_squeeze3blocks (st:W256.t Array25.t, buf:W8.t Array2144.t) : 
  W256.t Array25.t * W8.t Array2144.t = {
    var buf0:W8.t Array536.t;
    var buf1:W8.t Array536.t;
    var buf2:W8.t Array536.t;
    var buf3:W8.t Array536.t;
    var offset:int;
    buf0 <- witness;
    buf1 <- witness;
    buf2 <- witness;
    buf3 <- witness;
    buf0 <- (Array536.init (fun i => buf.[((0 * 536) + i)]));
    buf1 <- (Array536.init (fun i => buf.[((1 * 536) + i)]));
    buf2 <- (Array536.init (fun i => buf.[((2 * 536) + i)]));
    buf3 <- (Array536.init (fun i => buf.[((3 * 536) + i)]));
    offset <- 0;
    st <@ Keccak1600_Jazz.M._keccakf1600_avx2x4 (st);
    (buf0, buf1, buf2, buf3, offset) <@ ABUFLENavx2x4.MM.__dumpstate_avx2x4 (
    buf0, buf1, buf2, buf3, offset, 168, st);
    st <@ Keccak1600_Jazz.M._keccakf1600_avx2x4 (st);
    (buf0, buf1, buf2, buf3, offset) <@ ABUFLENavx2x4.MM.__dumpstate_avx2x4 (
    buf0, buf1, buf2, buf3, offset, 168, st);
    st <@ Keccak1600_Jazz.M._keccakf1600_avx2x4 (st);
    (buf0, buf1, buf2, buf3, offset) <@ ABUFLENavx2x4.MM.__dumpstate_avx2x4 (
    buf0, buf1, buf2, buf3, offset, 200, st);
    buf <-
    (Array2144.init
    (fun i => (if ((0 * 536) <= i < ((0 * 536) + 536)) then buf0.[(i -
                                                                  (0 * 536))] else 
              buf.[i]))
    );
    buf <-
    (Array2144.init
    (fun i => (if ((1 * 536) <= i < ((1 * 536) + 536)) then buf1.[(i -
                                                                  (1 * 536))] else 
              buf.[i]))
    );
    buf <-
    (Array2144.init
    (fun i => (if ((2 * 536) <= i < ((2 * 536) + 536)) then buf2.[(i -
                                                                  (2 * 536))] else 
              buf.[i]))
    );
    buf <-
    (Array2144.init
    (fun i => (if ((3 * 536) <= i < ((3 * 536) + 536)) then buf3.[(i -
                                                                  (3 * 536))] else 
              buf.[i]))
    );
    return (st, buf);
  }
  proc _sha3_256A_A1568 (out:W8.t Array32.t, in_0:W8.t Array1568.t) : 
  W8.t Array32.t = {
    var st:W256.t Array7.t;
    var  _0:int;
    var  _1:W256.t Array7.t;
     _1 <- witness;
    st <- witness;
    st <@ Keccak1600_Jazz.M.__state_init_avx2 ();
    (st,  _0) <@ A1568avx2.MM.__absorb_avx2 (st, 0, in_0, 6, 136);
    ( _1, out) <@ A32avx2.MM.__squeeze_avx2 (st, out, 136);
    return out;
  }
  proc _shake256_A32__A1600 (out:W8.t Array32.t, in_0:W8.t Array1600.t) : 
  W8.t Array32.t = {
    var st:W256.t Array7.t;
    var  _0:int;
    var  _1:W256.t Array7.t;
     _1 <- witness;
    st <- witness;
    st <@ Keccak1600_Jazz.M.__state_init_avx2 ();
    (st,  _0) <@ A1600avx2.MM.__absorb_avx2 (st, 0, in_0, 31, 136);
    ( _1, out) <@ A32avx2.MM.__squeeze_avx2 (st, out, 136);
    return out;
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
ecall (A64avx2.squeeze_avx2_h out st 72).
wp; ecall (A33avx2.absorb_avx2_h [<:W8.t>] in_0 6 72).
wp; call (state_init_avx2_h 72).
auto => |> st0 H0 [st1 ?] /= H1 [st2 out] /= _ ->.
rewrite of_listK 1:size_SQUEEZE1600 //.
by rewrite /SHA3_512 /c1024_r8 /KECCAK1600 H1 stavx2_from_st25K; congr => //.
qed.

lemma sha3_512A_A33_ll: islossless K._sha3_512A_A33.
proc.
call A64avx2.squeeze_avx2_ll.
wp; call A33avx2.absorb_avx2_ll.
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
(* ??? Anomaly *)
admit(*
by conseq sha3_512A_A33_eq (sha3_512A_A33_ph' _in) => // /#.
*).
qed.

(*********************************************************************************)
equiv shake256_128A_A33_eq:
  M._shake256_A128__A32_A1 ~ K._shake256_A128__A32_A1
 : ={arg} ==> ={res} by sim.

hoare shake256_128A_A33_h' _in0 _in1:
 K._shake256_A128__A32_A1
 : seed = _in0 /\ nonce = _in1
 ==> to_list res = SHAKE256 (to_list _in0 ++ to_list _in1) 128.
proof.
proc.
ecall (A128avx2.squeeze_avx2_h out st 136).
wp; ecall (A1avx2.absorb_avx2_h (to_list seed) nonce 31 136). 
wp; ecall (A32avx2.absorb_avx2_h [<:W8.t>] seed 0 136). 
wp; call (state_init_avx2_h 136).
auto =>/> [st0 ?] /= _ _; split.
 smt(Array32.size_to_list).
move => _ [st1 ?] /= -> [st2 out] /= _ ->.
rewrite stavx2_from_st25K -(Array128.of_listK W8.zero (SHAKE256 _ 128)).
 by rewrite size_SQUEEZE1600.
by congr; congr; smt().
qed.

lemma shake256_128A_A33_ll: islossless K._shake256_A128__A32_A1.
proc.
call A128avx2.squeeze_avx2_ll.
wp; call A1avx2.absorb_avx2_ll.
wp; call A32avx2.absorb_avx2_ll.
wp; call state_init_avx2_ll.
by auto.
qed.

phoare shake256_128A_A33_ph' _in0 _in1:
 [K._shake256_A128__A32_A1
 : seed = _in0 /\ nonce = _in1
 ==> to_list res = SHAKE256 (to_list _in0 ++ to_list _in1) 128] =1%r
 by conseq shake256_128A_A33_ll (shake256_128A_A33_h' _in0 _in1).

phoare shake256_128A_A33_ph _in0 _in1:
 [ M._shake256_A128__A32_A1
 : seed = _in0 /\ nonce = _in1
 ==> to_list res = SHAKE256 (to_list _in0 ++ to_list _in1) 128
 ] = 1%r.
proof.
admit (* ??? Anomaly 
by conseq shake256_128A_A33_eq (shake256_128A_A33_ph' _in0 _in1) => // /#.
*).
qed.

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
ecall (A64avx2.squeeze_avx2_h out st 72).
wp; ecall (A64avx2.absorb_avx2_h [<:W8.t>] in_0 6 72).
wp; call (state_init_avx2_h 72).
auto => /> [st0 ?] /= -> [st1 out] /= _ ->.
rewrite stavx2_from_st25K -(Array64.of_listK W8.zero (SHA3_512 _)).
 by rewrite size_SQUEEZE1600 /#.
congr; rewrite tP => i Hi.
by rewrite !initiE //=.
qed.

lemma sha3_512A_A64_ll: islossless K._sha3_512A_A64.
proc.
call A64avx2.squeeze_avx2_ll.
wp; call A64avx2.absorb_avx2_ll.
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
admit (* ??? Anomaly 
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
*).
qed.

phoare sha3_512A_512A_A64 m hpk:
 [ M._sha3_512A_A64
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
admit (* ???
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
*).
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
ecall (A32avx2.squeeze_avx2_h out st 136).
wp; ecall (A1568avx2.absorb_avx2_h [<:W8.t>] in_0 6 136).
wp; call (state_init_avx2_h 136).
auto => /> []/= st1 -> []/= st2 out _ ->.
rewrite /SHA3_256_1568_32 stavx2_from_st25K /= tP => i Hi.
rewrite initiE //= get_of_list //.
rewrite /to_list /SHA3_256 /c512_r8 /KECCAK1600; congr; congr; congr => //.
rewrite (:1568=1536+32) 1:// /sub mkseq_add 1..2://; congr.
 by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
by apply eq_in_mkseq => k Hk /=; rewrite initiE /#.
qed.

lemma sha3_256A_A1568_ll: islossless K._sha3_256A_A1568.
proof.
proc.
call A32avx2.squeeze_avx2_ll.
wp; call A1568avx2.absorb_avx2_ll.
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
admit (* ???
by conseq sha3_256A_A1568_eq (sha3_256A_A1568_ph' inp) => /> /#.
*).
qed.

(*********************************************************************************)


from JazzEC require import Array1408 Array160.


(*********************************************************************************)
equiv shake256_A32__A1600_eq:
  M._shake256_A32__A1600 ~ K._shake256_A32__A1600
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
ecall (A32avx2.squeeze_avx2_h out st 136).
wp; ecall (A1600avx2.absorb_avx2_h [<:W8.t>] in_0 31 136).
wp; call (state_init_avx2_h 136).
auto => /> []/= st1 -> []/= st2 out _ ->.
rewrite stavx2_from_st25K /SHAKE_256_1600_32 -(Array32.of_listK W8.zero (SHAKE256 _ _)).
 by rewrite size_SHAKE256 /#.
rewrite tP => i Hi.
rewrite !get_of_list //.
rewrite of_listK.
 by rewrite size_SHAKE256 /#.
rewrite /to_list /SHAKE256 /KECCAK1600; congr; congr; 1:smt().
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
call A32avx2.squeeze_avx2_ll.
wp; call A1600avx2.absorb_avx2_ll.
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
admit (*
by conseq shake256_A32__A1600_eq (shake256_A32__A1600_ph' _in) => /> /#.
*).
qed.

(*********************************************************************************)
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
wp; ecall (keccakf1600_st25_avx2_h pst).
auto => />.
apply (eq_from_nth W8.zero).
 by rewrite size_sub 1:// size_state2bytes.
rewrite size_sub 1:// => i Hi.
rewrite nth_sub 1://.
rewrite initiE 1:/# /= state2bytesE initiE 1:/# /=.
rewrite /get8 initiE 1:/# /= ifT 1:/# initiE //=; congr; congr; congr.
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
have ?:= keccakf1600_st25_avx2_ll.
by islossless.
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
admit (*
by conseq shake128_next_state_eq (shake128_next_state_ph' _buf) => /> /#.
*).
qed.

(*********************************************************************************)
(*********************************************************************************)

from Keccak require import Keccak1600_avx2x4.


(*********************************************************************************)


equiv shake256x4_A128__A32_A1_eq:
  M._shake256x4_A128__A32_A1 ~ K._shake256x4_A128__A32_A1
 : ={arg} ==> ={res}
by sim.

from Keccak require import Avx2_extra.

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
wp; ecall (A128avx2x4.squeeze_avx2x4_h out0 out1 out2 out3 st 136)=> /=.
wp; ecall (A1avx2x4.absorb_avx2x4_h 
 (to_list _seed) (to_list _seed) (to_list _seed) (to_list _seed) st
 (Array1.init (fun (i : int) => nonces.[0 + i]))
 (Array1.init (fun (i : int) => nonces.[1 + i]))
 (Array1.init (fun (i : int) => nonces.[2 + i]))
 (Array1.init (fun (i : int) => nonces.[3 + i]))
 31 136) => /=.
wp; ecall (A32avx2x4.absorb_bcast_avx2x4_h
 [<:W8.t>] [<:W8.t>] [<:W8.t>] [<:W8.t>] st seed 0 136).
wp; call (state_init_avx2x4_h 136).
auto => |> st0 _ []/= st1 ??_; split.
 by rewrite size_to_list /#.
auto => _ []/= st2 @/absorb_spec_avx2x4 -> []/= st3 out0 out1 out2 out3 ? -> -> -> ->.
clear.
pose st0 := ABSORB1600 _ _ _.
pose st1 := ABSORB1600 _ _ _.
pose st2 := ABSORB1600 _ _ _.
pose st3 := ABSORB1600 _ _ _.
split.
 congr; rewrite /SHAKE256 /KECCAK1600; congr => //. 
 rewrite tP => i Hi.
 rewrite initiE //=.
 rewrite (:8 * (4 * i) * 8=8 * (4 * i+0) * 8) 1:/# sliceget64_256_25E //.
 rewrite initiE //= u256_pack4E get_pack4 //= /st0.
 congr; congr => //.
 by congr; rewrite /to_list /mkseq -iotaredE /=. 
split.
 congr; rewrite /SHAKE256 /KECCAK1600; congr => //. 
 rewrite tP => i Hi.
 rewrite initiE //=.
 rewrite sliceget64_256_25E //.
 rewrite initiE //= u256_pack4E get_pack4 //= /st1.
 congr; congr => //.
 by congr; rewrite /to_list /mkseq -iotaredE /=. 
split.
 congr; rewrite /SHAKE256 /KECCAK1600; congr => //. 
 rewrite tP => i Hi.
 rewrite initiE //=.
 rewrite sliceget64_256_25E //.
 rewrite initiE //= u256_pack4E get_pack4 //= /st2.
 congr; congr => //.
 by congr; rewrite /to_list /mkseq -iotaredE /=. 
congr; rewrite /SHAKE256 /KECCAK1600; congr => //. 
rewrite tP => i Hi.
rewrite initiE //=.
rewrite sliceget64_256_25E //.
rewrite initiE //= u256_pack4E get_pack4 //= /st3.
congr; congr => //.
by congr; rewrite /to_list /mkseq -iotaredE /=.
qed.

lemma shake256x4_A128__A32_A1_ll: islossless K._shake256x4_A128__A32_A1.
proof.
proc => /=.
wp; call A128avx2x4.squeeze_avx2x4_ll.
wp; call A1avx2x4.absorb_avx2x4_ll.
wp; call A32avx2x4.absorb_bcast_avx2x4_ll.
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
admit (*
by conseq shake256x4_A128__A32_A1_eq (shake256x4_A128__A32_A1_ph' _seed _nonces) => /> /#.
*).
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
    st4x_match res
    ( SHAKE128_ABSORB (to_list _rho ++ sub _rc 0 2) 
    , SHAKE128_ABSORB (to_list _rho ++ sub _rc 2 2) 
    , SHAKE128_ABSORB (to_list _rho ++ sub _rc 4 2) 
    , SHAKE128_ABSORB (to_list _rho ++ sub _rc 6 2)
    ).
proof.
proc => /=.
wp; ecall (A2avx2x4.absorb_avx2x4_h 
 (to_list _rho) (to_list _rho) (to_list _rho) (to_list _rho) st
 (Array2.init (fun (i : int) => pos.[0 + i]))
 (Array2.init (fun (i : int) => pos.[2 + i]))
 (Array2.init (fun (i : int) => pos.[4 + i]))
 (Array2.init (fun (i : int) => pos.[6 + i]))
 31 168) => /=.
wp; ecall (A32avx2x4.absorb_bcast_avx2x4_h
 [<:W8.t>] [<:W8.t>] [<:W8.t>] [<:W8.t>] st seed 0 168).
wp; call (state_init_avx2x4_h 168).
auto => |> s0 _ []/= s1 ? _ _; split.
 by rewrite size_to_list.
move=> _ []/= s2 @/absorb_spec_avx2x4 ->.
rewrite /st4x_match tP => i Hi.
by rewrite st4x_packiE //= eq_sym initiE //=; congr; congr; congr => //;
   congr; rewrite /sub /to_list /=; apply eq_in_mkseq => j Hj /=;
   rewrite initiE.
qed.

lemma shake128x4_absorb_A32_A2_ll: islossless K._shake128x4_absorb_A32_A2.
proof.
proc => /=.
call A2avx2x4.absorb_avx2x4_ll.
wp; call A32avx2x4.absorb_bcast_avx2x4_ll.
wp; call state_init_avx2x4_ll.
by auto => />.
qed.

phoare shake128x4_absorb_A32_A2_ph' _rho _rc:
 [ K._shake128x4_absorb_A32_A2
 : seed = _rho /\ pos = _rc
 ==>
    st4x_match res
    ( SHAKE128_ABSORB (to_list _rho ++ sub _rc 0 2)
    , SHAKE128_ABSORB (to_list _rho ++ sub _rc 2 2)
    , SHAKE128_ABSORB (to_list _rho ++ sub _rc 4 2)
    , SHAKE128_ABSORB (to_list _rho ++ sub _rc 6 2)
    )
 ] = 1%r.
proof.
by conseq shake128x4_absorb_A32_A2_ll (shake128x4_absorb_A32_A2_h' _rho _rc).
qed.

phoare shake128x4_absorb_A32_A2_ph _rho _rc:
 [ M._shake128x4_absorb_A32_A2
 : seed = _rho /\ pos = _rc
 ==>
    st4x_match res
    ( SHAKE128_ABSORB (to_list _rho ++ sub _rc 0 2)
    , SHAKE128_ABSORB (to_list _rho ++ sub _rc 2 2)
    , SHAKE128_ABSORB (to_list _rho ++ sub _rc 4 2)
    , SHAKE128_ABSORB (to_list _rho ++ sub _rc 6 2)
    )
 ] = 1%r.
proof.
admit (*
by conseq shake128x4_absorb_A32_A2_eq (shake128x4_absorb_A32_A2_ph' _rho _rc) => /> /#.
*).
qed.

(*********************************************************************************)

equiv shake128x4_squeeze3blocks_eq:
  M._shake128x4_squeeze3blocks ~ K._shake128x4_squeeze3blocks
 : ={arg} ==> ={res}
by sim.

hoare shake128x4_squeeze3blocks_h' _st0 _st1 _st2 _st3:
 K._shake128x4_squeeze3blocks
 : st4x_match st (_st0,_st1,_st2,_st3)
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
ecall (ABUFLENavx2x4.dumpstate_avx2x4_h buf0 buf1 buf2 buf3 offset 200 st).
ecall (keccakf1600_avx2x4_h st).
ecall (ABUFLENavx2x4.dumpstate_avx2x4_h buf0 buf1 buf2 buf3 offset 168 st).
ecall (keccakf1600_avx2x4_h st).
ecall (ABUFLENavx2x4.dumpstate_avx2x4_h buf0 buf1 buf2 buf3 offset 168 st).
ecall (keccakf1600_avx2x4_h st).
auto => &m Pre st ->; split; first smt().
move=> _ []b00 b10 b20 b30 ? /=.
rewrite !st4x_get_map // => />.
rewrite !Pre !st4x_get_pack0 !st4x_get_pack1 !st4x_get_pack2 !st4x_get_pack3 /=; clear.
move => [#] []b01 b11 b21 b31 ? /= Eb01 Eb11 Eb21 Eb31 -> />.
move=> []b02 b12 b22 b32 ? /= Eb02 Eb12 Eb22 Eb32 _.
split.
 apply (eq_from_nth W8.zero).
  by rewrite size_sub 1:// size_SQUEEZE1600 /#.
 move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifF 1:/# /=.
 rewrite initiE 1:/# /= ifF 1:/# initiE 1:/# /= ifF 1:/# initiE 1:/# /= ifT 1:/#.
 rewrite Eb02 filliE 1:/# /=.
 case: (i < 336) => C3.
  rewrite ifF 1:/# Eb01 filliE 1:/# /=.
  case: (i < 168) => C2.
   rewrite ifF 1:/# filliE 1:/# /= ifT 1:/# nth_SQUEEZE1600 1..2:/#.
   by rewrite divz_small 1:/# /= /st_i iter1 modz_small 1:/#.
  rewrite ifT 1:/# nth_SQUEEZE1600 1..2:/#.
  by rewrite (:i %/ c256_r8 = 1) 1:/# /st_i iter2 (:i %% c256_r8 = i-168) 1:/#.
 rewrite ifT 1:/# nth_SQUEEZE1600 1..2:/#.
 by rewrite (:i %/ c256_r8 = 2) 1:/# /st_i iterS 1:// iter2 (:i %% c256_r8 = i-336) 1:/#.
split.
 apply (eq_from_nth W8.zero).
  by rewrite size_sub 1:// size_SQUEEZE1600 /#.
 move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifF 1:/# /=.
 rewrite initiE 1:/# /= ifF 1:/# initiE 1:/# /=.
 rewrite ifT 1:/#.
 rewrite Eb12 filliE 1:/# /=.
 case: (i < 336) => C3.
  rewrite ifF 1:/# Eb11 filliE 1:/# /=.
  case: (i < 168) => C2.
   rewrite ifF 1:/# filliE 1:/# /= ifT 1:/# nth_SQUEEZE1600 1..2:/#.
   by rewrite divz_small 1:/# /= /st_i iter1 modz_small 1:/#.
  rewrite ifT 1:/# nth_SQUEEZE1600 1..2:/#.
  by rewrite (:i %/ c256_r8 = 1) 1:/# /st_i iter2 (:i %% c256_r8 = i-168) 1:/#.
 rewrite ifT 1:/# nth_SQUEEZE1600 1..2:/#.
 by rewrite (:i %/ c256_r8 = 2) 1:/# /st_i iterS 1:// iter2 (:i %% c256_r8 = i-336) 1:/#.
split.
 apply (eq_from_nth W8.zero).
  by rewrite size_sub 1:// size_SQUEEZE1600 /#.
 move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifF 1:/# /=.
 rewrite initiE 1:/# /= ifT 1:/#.
 rewrite Eb22 filliE 1:/# /=.
 case: (i < 336) => C3.
  rewrite ifF 1:/# Eb21 filliE 1:/# /= nth_SQUEEZE1600 1..2:/#.
  case: (i < 168) => C2.
   rewrite ifF 1:/# filliE 1:/# /= ifT 1:/#.
   by rewrite divz_small 1:/# /= /st_i iter1 modz_small 1:/#.
  rewrite ifT 1:/#.
  by rewrite (:i %/ c256_r8 = 1) 1:/# /st_i iter2 (:i %% c256_r8 = i-168) 1:/#.
 rewrite ifT 1:/# nth_SQUEEZE1600 1..2:/#.
 by rewrite (:i %/ c256_r8 = 2) 1:/# /st_i iterS 1:// iter2 (:i %% c256_r8 = i-336) 1:/#.
split.
 apply (eq_from_nth W8.zero).
  by rewrite size_sub 1:// size_SQUEEZE1600 /#.
 move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifT 1:/# /=.
 rewrite Eb32 filliE 1:/# /=.
 case: (i < 336) => C3.
  rewrite ifF 1:/# Eb31 filliE 1:/# /= nth_SQUEEZE1600 1..2:/#.
  case: (i < 168) => C2.
   rewrite ifF 1:/# filliE 1:/# /= ifT 1:/#.
   by rewrite divz_small 1:/# /= /st_i iter1 modz_small 1:/#.
  rewrite ifT 1:/#.
  by rewrite (:i %/ c256_r8 = 1) 1:/# /st_i iter2 (:i %% c256_r8 = i-168) 1:/#.
 rewrite ifT 1:/# nth_SQUEEZE1600 1..2:/#.
 by rewrite (:i %/ c256_r8 = 2) 1:/# /st_i iterS 1:// iter2 (:i %% c256_r8 = i-336) 1:/#.
split.
 apply (eq_from_nth W8.zero).
  by rewrite size_sub 1:// size_state2bytes /#.
 move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifF 1:/# /=.
 rewrite initiE 1:/# /= ifF 1:/# initiE 1:/# /= ifF 1:/# initiE 1:/# /= ifT 1:/#.
 rewrite Eb02 filliE 1:/# /= ifT 1:/#.
 rewrite /st_i (:3=2+1) 1:// iterS 1:// iter2.
 by rewrite state2bytesE.
split.
 apply (eq_from_nth W8.zero).
  by rewrite size_sub 1:// size_state2bytes /#.
 move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifF 1:/# /=.
 rewrite initiE 1:/# /= ifF 1:/# initiE 1:/# /= ifT 1:/# /=.
 rewrite Eb12 filliE 1:/# /= ifT 1:/#.
 rewrite /st_i (:3=2+1) 1:// iterS 1:// iter2.
 by rewrite state2bytesE.
split.
 apply (eq_from_nth W8.zero).
  by rewrite size_sub 1:// size_state2bytes /#.
 move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifF 1:/# /=.
 rewrite initiE 1:/# /= ifT 1:/# /=.
 rewrite Eb22 filliE 1:/# /= ifT 1:/#.
 rewrite /st_i (:3=2+1) 1:// iterS 1:// iter2.
 by rewrite state2bytesE.
apply (eq_from_nth W8.zero).
 by rewrite size_sub 1:// size_state2bytes /#.
move=> i; rewrite size_sub 1:/# =>  Hi; rewrite nth_sub 1:// initiE 1:/# /= ifT 1:/# /=.
rewrite Eb32 filliE 1:/# /= ifT 1:/#.
rewrite /st_i (:3=2+1) 1:// iterS 1:// iter2.
by rewrite state2bytesE.
qed.

lemma shake128x4_squeeze3blocks_ll: islossless K._shake128x4_squeeze3blocks.
proof.
proc.
wp; call ABUFLENavx2x4.dumpstate_avx2x4_ll.
call keccakf1600_avx2x4_ll.
call ABUFLENavx2x4.dumpstate_avx2x4_ll.
call keccakf1600_avx2x4_ll.
call ABUFLENavx2x4.dumpstate_avx2x4_ll.
call keccakf1600_avx2x4_ll.
by auto => />.
qed.

phoare shake128x4_squeeze3blocks_ph' _st0 _st1 _st2 _st3:
 [ K._shake128x4_squeeze3blocks
 : st4x_match st (_st0,_st1,_st2,_st3)
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
 : st4x_match st (_st0,_st1,_st2,_st3)
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
admit (*
by conseq shake128x4_squeeze3blocks_eq (shake128x4_squeeze3blocks_ph' _st0 _st1 _st2 _st3) => /> /#.
*).
qed.

