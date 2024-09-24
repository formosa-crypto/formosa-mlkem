require import AllCore IntDiv List.
from Jasmin require import JModel.


require Jkem_avx2.

require import Keccak1600_Spec.

import FIPS202_SHA3_Spec.
import Keccakf1600_Spec.

require import Array7.


(* MLKEM array sizes *)
require import Array536. (* BUF_SIZE *)
require import Array32.  (* SEED SIZE *)
require import Array4.   (* mat. indexes *)

op stmatch_avx2 (st: FIPS202_Keccakf1600.state) (stavx2: W256.t Array7.t): bool.

op stavx2bytes (stavx2: W256.t Array7.t): W8.t list.



hoare stavx2_unpack_at_h _st _buf _at:
 Jkem_avx2.M(Jkem_avx2.Syscall)._stavx2_unpack_at
 : state = _st
   /\ buf = _buf
   /\ offset = _at
   ==>
   sub _buf 0 (to_uint _at) = sub res 0 (to_uint _at)
   /\ sub res (to_uint _at) 200 = stavx2bytes _st.
(*
   buf_subl res 0 (to_uint _at+200)
   = buf_subl _buf 0 (to_uint _at) ++ stavx2bytes _st.
proc.
*)
admitted.

lemma stavx2_unpack_at_ll:
 islossless Jkem_avx2.M(Jkem_avx2.Syscall)._stavx2_unpack_at.
proof. by islossless. qed.

phoare stavx2_unpack_at_ph _st _buf _at:
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._stavx2_unpack_at
   : state = _st
     /\ buf = _buf
     /\ offset = _at
     ==>
   sub _buf 0 (to_uint _at) = sub res 0 (to_uint _at)
   /\ sub res (to_uint _at) 200 = stavx2bytes _st
(*
     buf_subl res 0 (to_uint _at+200)
     = buf_subl _buf 0 (to_uint _at) ++ stavx2bytes _st
*)
 ] = 1%r.
proof.
by conseq stavx2_unpack_at_ll (stavx2_unpack_at_h _st _buf _at).
qed.

phoare stavx2_pack_at_ph _buf _at:
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._stavx2_pack_at
   : st = _buf
     /\ offset = _at
     ==>
     stavx2bytes res = sub _buf (to_uint _at) 200
 ] = 1%r.
proof.
admitted.

hoare xof_init_avx2_h _rho _rc:
 Jkem_avx2.M(Jkem_avx2.Syscall).xof_init_avx2
 : rho = _rho /\ index = _rc
   ==>
   stmatch_avx2 (SHAKE128_ABSORB (to_list _rho ++ W2u8.to_list _rc)) res.
proof.
proc; simplify.
admitted.

lemma xof_init_avx2_ll:
 islossless Jkem_avx2.M(Jkem_avx2.Syscall).xof_init_avx2.
proof.
islossless.
while (true) (7-i).
 by move=> z; auto => /> /#.
by auto => /> /#.
qed.

phoare xof_init_avx2_ph _rho _rc:
 [ Jkem_avx2.M(Jkem_avx2.Syscall).xof_init_avx2
   : rho = _rho /\ index = _rc
     ==>
     stmatch_avx2 (SHAKE128_ABSORB (to_list _rho ++ W2u8.to_list _rc)) res
 ] = 1%r.
proof. by conseq xof_init_avx2_ll (xof_init_avx2_h _rho _rc). qed.



op state_stavx2_match (st: W64.t Array25.t) (stavx2: W256.t Array7.t): bool.

op st25_to_stavx2 (st: W64.t Array25.t): W256.t Array7.t.
op stavx2_to_st25 (stavx2: W256.t Array7.t): W64.t Array25.t.


hoare keccakf1600_avx2_h (_st: W64.t Array25.t):
 Jkem_avx2.M(Jkem_avx2.Syscall)._keccakf1600_avx2
 : stmatch_avx2 _st state
 ==> stmatch_avx2 (Keccakf1600_Spec.keccak_f1600_op _st) res.
admitted.

lemma keccakf1600_avx2_ll: islossless Jkem_avx2.M(Jkem_avx2.Syscall)._keccakf1600_avx2.
proof.
admitted.

phoare keccakf1600_avx2_ph (_st: W64.t Array25.t):
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._keccakf1600_avx2
 : stmatch_avx2 _st state
 ==> stmatch_avx2 (Keccakf1600_Spec.keccak_f1600_op _st) res ] = 1%r.
proof. by conseq keccakf1600_avx2_ll (keccakf1600_avx2_h _st). qed.

type state4x = W256.t Array25.t.
type state = W64.t Array25.t.
op (\a25bits64) (a: state4x) (k: int): state =
 Array25.map (fun (x: W256.t) => W4u64.\bits64 x k) a.

op a25pack4 (l: state list): state4x =
 Array25.init (fun i => pack4 (map (fun (s: state) => s.[i]) l)).

op a25unpack4 (st4: state4x): state list =
 map (fun k=> st4 \a25bits64 k) (iota_ 0 4).

lemma a25bits64iE x k i:
 0 <= i < 25 =>
 (x \a25bits64 k).[i] = x.[i] \bits64 k.
proof. by move=> Hi; rewrite mapiE //. qed.

lemma a25unpack4K s4:
 a25pack4 (a25unpack4 s4) = s4.
proof.
rewrite /a25pack4 /a25unpack4.
apply Array25.ext_eq => i Hi; rewrite initiE //=.
rewrite -iotaredE /= !a25bits64iE //=.
rewrite -{5}(unpack64K s4.[i]); congr.
by rewrite unpack64E init_of_list -iotaredE /=. 
qed.

op st0: state = Array25.create W64.zero.

lemma a25pack4_bits64 k (stl: state list):
 0 <= k < 4 =>
 a25pack4 stl \a25bits64 k = nth st0 stl k.
proof.
move=> Hk; apply Array25.ext_eq => i Hi.
rewrite mapiE //= initiE //= pack4bE //=.
rewrite of_listE initiE //=.
case: (k < size stl) => E.
 by rewrite (nth_map st0) 1:/#.
rewrite !nth_out; first 2 by smt(size_map).
by rewrite createiE.
qed.

op match_state4x (st0 st1 st2 st3: state) (st4x: state4x) =
 st4x = a25pack4 [st0; st1; st2; st3].

lemma a25pack4_eq stl st4x:
 a25pack4 stl = st4x
 <=>
 all (fun k=>st4x \a25bits64 k = nth st0 stl k) (iota_ 0 4).
proof.
split.
 move => <-; apply/List.allP => k. 
 rewrite mem_iota => Hk /=; apply a25pack4_bits64; smt().
move=> /List.allP H.
apply Array25.ext_eq => i Hi.
rewrite initiE //=.
rewrite -(unpack64K st4x.[i]); congr.
apply W4u64.Pack.ext_eq => k Hk.
rewrite of_listE unpack64E !initiE //=.
rewrite -a25bits64iE // H; first smt(mem_iota).
case: (k < size stl) => E.
 by rewrite (nth_map st0) 1:/#.
rewrite !nth_out; first 2 by smt(size_map).
by rewrite createiE.
qed.

lemma xorw_bits64 (w1 w2: W256.t) k:
 0 <= k < 4 =>
 w1 `^` w2 \bits64 k = (w1 \bits64 k) `^` (w2 \bits64 k).
proof.
move=> Hk; rewrite -{1}(unpack64K w1) -{1}(unpack64K w2). 
by rewrite xorb4u64E pack4bE // map2iE // !unpack64E !initiE.
qed.

lemma invw_bits64 (w: W256.t) k:
 0 <= k < 4 =>
 invw w \bits64 k = invw (w \bits64 k).
proof. by move=> Hk; rewrite -{1}(unpack64K w) invw64E //. qed.

op map_state4x (f:state->state) (st:state4x): state4x =
 a25pack4 (map f (a25unpack4 st)).

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

hoare keccakf1600_4x_h (_a: state4x):
 Jkem_avx2.M(Jkem_avx2.Syscall)._keccakf1600_4x :
 a = _a
 ==> res = map_state4x keccak_f1600_op _a.
proof.
admitted.

lemma keccakf1600_4x_round_ll:
 islossless Jkem_avx2.M(Jkem_avx2.Syscall).keccakf1600_4x_round.
admitted.

lemma keccakf1600_4x_ll:
 islossless Jkem_avx2.M(Jkem_avx2.Syscall)._keccakf1600_4x.
proof.
islossless.
while (true) (768 - to_uint c).
 move=> z.
 wp; call keccakf1600_4x_round_ll.
 wp; call keccakf1600_4x_round_ll.
 auto => /> &m.
 by rewrite ultE to_uintD of_uintK /#.
by auto => /> c; rewrite ultE of_uintK /#.
qed.

phoare keccakf1600_4x_ph (_a: state4x):
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._keccakf1600_4x :
   a = _a
   ==> res = map_state4x keccak_f1600_op _a ] = 1%r.
proof. by conseq keccakf1600_4x_ll (keccakf1600_4x_h _a). qed.

lemma st_i_add st a b:
 0 <= a => 0 <= b =>
 st_i (FIPS202_SHA3_Spec.st_i st b) a
 = st_i st (a+b).
proof.
rewrite /st_i.
elim/natind: a b.
 move=> n Hn b Ha Hb; rewrite (iter0 n) /#.
move=> n Hn IH b Ha Hb.
by rewrite eq_sym (:n+1+b=n+b+1) 1:/# (iterS (n+b)) 1:/# -IH // iterS 1:/#.
qed.

hoare xof_init_x4_h _rho _idxs:
 Jkem_avx2.M(Jkem_avx2.Syscall).xof_init_x4
 : rho = _rho /\ indexes = _idxs
   ==>
   match_state4x
    (SHAKE128_ABSORB (to_list _rho ++ W2u8.to_list _idxs.[0])) 
    (SHAKE128_ABSORB (to_list _rho ++ W2u8.to_list _idxs.[1])) 
    (SHAKE128_ABSORB (to_list _rho ++ W2u8.to_list _idxs.[2])) 
    (SHAKE128_ABSORB (to_list _rho ++ W2u8.to_list _idxs.[3])) 
    res.
proof.
proc; simplify.
admit.
qed.

lemma xof_init_x4_ll: islossless Jkem_avx2.M(Jkem_avx2.Syscall).xof_init_x4.
proof.
islossless.
+ while (true) (25-i).
   by move=> z; auto => /> /#.
  by auto => /> /#.
+ while (true) (4-i).
   by move=> z; auto => /> /#.
  by auto => /> /#.
while (true) (4-i).
 by move=> z; auto => /> /#.
by auto => /> /#.
qed.

phoare xof_init_x4_ph _rho _idxs:
 [ Jkem_avx2.M(Jkem_avx2.Syscall).xof_init_x4
   : rho = _rho /\ indexes = _idxs
     ==>
     match_state4x
      (SHAKE128_ABSORB (to_list _rho ++ W2u8.to_list _idxs.[0])) 
      (SHAKE128_ABSORB (to_list _rho ++ W2u8.to_list _idxs.[1])) 
      (SHAKE128_ABSORB (to_list _rho ++ W2u8.to_list _idxs.[2])) 
      (SHAKE128_ABSORB (to_list _rho ++ W2u8.to_list _idxs.[3])) 
      res ] = 1%r.
proof. by conseq xof_init_x4_ll (xof_init_x4_h _rho _idxs). qed.

hoare st4x_unpack_at_h _st0 _st1 _st2 _st3 _buf0 _buf1 _buf2 _buf3 _at:
 Jkem_avx2.M(Jkem_avx2.Syscall).__st4x_unpack_at
 : match_state4x _st0 _st1 _st2 _st3 st4x
   /\ buf0=_buf0 /\ buf1=_buf1 /\ buf2=_buf2 /\ buf3=_buf3
   /\ offset=_at
   ==> sub _buf0 0 (to_uint _at) = sub res.`1 0 (to_uint _at)
       /\ sub _buf1 0 (to_uint _at) = sub res.`2 0 (to_uint _at)
       /\ sub _buf2 0 (to_uint _at) = sub res.`3 0 (to_uint _at)
       /\ sub _buf3 0 (to_uint _at) = sub res.`4 0 (to_uint _at)
       /\ sub res.`1 (to_uint _at) 200 = state2bytes _st0
       /\ sub res.`2 (to_uint _at) 200 = state2bytes _st1
       /\ sub res.`3 (to_uint _at) 200 = state2bytes _st2
       /\ sub res.`4 (to_uint _at) 200 = state2bytes _st3.
proof.
proc.
admitted.

lemma stmatch_avx2_bytes st stavx:
 stmatch_avx2 st stavx <=>
 state2bytes st = stavx2bytes stavx.
proof.
admitted.

(*
lemma stavx2_bytes_squeeze at (buf: W8.t Array536.t) st stavx:
 stmatch_avx2 st stavx =>
 sub buf at 200 = stavx2bytes stavx =>
 sub buf at 168 = squeezestate st 168.
proof.
move => /stmatch_avx2_bytes Hm.
rewrite -Hm /squeezestate => <-.
by rewrite /sub take_mkseq /#.
qed.
*)

phoare st4x_unpack_at_ph _st0 _st1 _st2 _st3 _buf0 _buf1 _buf2 _buf3 _at:
 [ Jkem_avx2.M(Jkem_avx2.Syscall).__st4x_unpack_at
   : match_state4x _st0 _st1 _st2 _st3 st4x
     /\ buf0=_buf0 /\ buf1=_buf1 /\ buf2=_buf2 /\ buf3=_buf3
     /\ offset=_at
     ==> sub _buf0 0 (to_uint _at) = sub res.`1 0 (to_uint _at)
         /\ sub _buf1 0 (to_uint _at) = sub res.`2 0 (to_uint _at)
         /\ sub _buf2 0 (to_uint _at) = sub res.`3 0 (to_uint _at)
         /\ sub _buf3 0 (to_uint _at) = sub res.`4 0 (to_uint _at)
         /\ sub res.`1 (to_uint _at) 200 = state2bytes _st0
         /\ sub res.`2 (to_uint _at) 200 = state2bytes _st1
         /\ sub res.`3 (to_uint _at) 200 = state2bytes _st2
         /\ sub res.`4 (to_uint _at) 200 = state2bytes _st3 ] = 1%r.
proof.
proc.
admitted.

lemma stx4_map_keccakf st0 st1 st2 st3 stx4:
 match_state4x st0 st1 st2 st3 stx4 =>
 match_state4x (keccak_f1600_op st0) (keccak_f1600_op st1) (keccak_f1600_op st2) (
  keccak_f1600_op st3) (map_state4x keccak_f1600_op stx4).
admitted.

