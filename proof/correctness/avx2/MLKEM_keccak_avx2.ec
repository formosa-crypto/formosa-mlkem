require import AllCore IntDiv List.
from Jasmin require import JModel.

require export FIPS202_Keccakf1600 FIPS202_SHA3_Spec.
require export Keccak1600_Spec Keccakf1600_Spec.

require import Symmetric MLKEMFCLib.
require import Jkem_avx2.

require import Array1.   (* nonce *)
require import Array2.   (* mat. position *)
require import Array8.   (* mat. indexes *)
require import Array32.  (* SEED SIZE *)
require import Array33.  (* DS SEED SIZE *)
require import Array64.
require import Array128.
require import Array536. (* BUF_SIZE *)
require import Array960.
require import Array1152.
require import Array1184.
require import Array2144. (* 4*BUF_SIZE *) 


require import Array7.

op stmatch_avx2 (st: state) (stavx2: W256.t Array7.t): bool.

op stavx2bytes (stavx2: W256.t Array7.t): W8.t list.
op bytes2stavx2 (bs: W8.t list): W256.t Array7.t.

op stavx2_from_state (st: state): W256.t Array7.t.
op stavx2_to_state (st: W256.t Array7.t): state.

(*
hoare sha3_256A_M1184_h _in:
 M(Syscall)._sha3_256A_M1184
 : in_0 = _in ==> to_list res = SHA3_256 _in.
*)

hoare sha3_512A_A33_h _in:
 M(Syscall)._sha3_512A_A33
 : in_0 = _in
 ==> to_list res = SHA3_512 (to_list _in).
admitted.

phoare sha3_512A_A33_ph _in:
 [ M(Syscall)._sha3_512A_A33
 : in_0 = _in
 ==> res = Array64.of_list W8.zero (SHA3_512 (to_list _in))
 ] = 1%r.
admitted.


(* sha3 assumptions from MLKEM_KEM_avx2 *)
axiom sha3_256A_M1184_ph mem _ptr:
 phoare [ Jkem_avx2.M(Jkem_avx2.Syscall)._sha3_256A_M1184
        : arg.`2 = W64.of_int _ptr /\
          valid_ptr _ptr 1184 /\
          Glob.mem = mem
          ==> 
          Glob.mem = mem /\
          res = SHA3_256_1184_32
            (Array1152.init (fun k =>  mem.[_ptr+k]),
            (Array32.init (fun k => mem.[_ptr+1152+k])))] = 1%r.

axiom sha3_512A_A64_ph buf inp: 
 phoare [ Jkem_avx2.M(Jkem_avx2.Syscall)._sha3_512A_A64
        : arg = (inp,buf)
        ==> 
        let bytes = SHA3_512_64_64 (Array32.init (fun k => buf.[k])) 
                                   (Array32.init (fun k => buf.[k+32])) in
        res = Array64.init (fun k => if k < 32 then bytes.`1.[k] else bytes.`2.[k-32])] = 1%r.


axiom shake256_M32__M32_M1088_ph mem _pout _pin1 _pin2: 
 phoare [ Jkem_avx2.M(Jkem_avx2.Syscall)._shake256_M32__M32_M1088
        : arg = (W64.of_int _pout,W64.of_int _pin1,W64.of_int _pin2) /\
          valid_ptr _pout 32 /\
          valid_ptr _pin1 32 /\
          valid_ptr _pin2 1088 /\
          Glob.mem = mem
          ==> 
          touches Glob.mem mem _pout 32 /\
          (Array32.init (fun k =>  Glob.mem.[_pout+k])) = 
             SHAKE_256_1120_32 (Array32.init (fun k => mem.[_pin1+k])) 
                            (Array960.init (fun k => mem.[_pin2+k]), Array128.init (fun k => mem.[_pin2+960+k])) ] = 1%r.


(*
hoare shake256_M32__M32_M1088_h _in0 _in1:
 M(Syscall)._shake256_M32__M32_M1088
 : in0 = _in0 /\ in1 = _in1
 ==> res = SHAKE256 (to_list _in) 32.
admitted.
*)

(*
*)

(*
hoare shake128_absorb_A32_A2_h _seed _pos:
 M(Syscall)._shake128_absorb_A32_A2
 : seed = _seed /\ pos = _pos
 ==> res = stavx2_from_st25 (SHAKE128_ABSORB (to_list _seed ++ to_list _pos)).
admitted.
*)

(*
_shake128x4_absorb_A32_A2
*)

(*
_shake128_squeeze3blocks
*)

hoare shake128_next_state_h _buf:
 Jkem_avx2.M(Jkem_avx2.Syscall)._shake128_next_state
 : buf = _buf
   ==>
   let st = bytes2state (sub _buf (2*168) 200) in
   sub res (2*168) 200 = state2bytes (keccak_f1600_op st).
admitted.

(*
lemma dumpstate_array_avx2_ll: islossless Jkem_avx2.M(Jkem_avx2.Syscall).aBUFLEN____dumpstate_array_avx2.
admitted.

lemma keccakf1600_avx2_ll: islossless Jkem_avx2.M(Jkem_avx2.Syscall)._keccakf1600_avx2.
admitted.

lemma state_from_pstate_avx2_ll: islossless Jkem_avx2.M(Jkem_avx2.Syscall).__state_from_pstate_avx2.
admitted.
*)

lemma shake128_next_state_ll: islossless Jkem_avx2.M(Jkem_avx2.Syscall)._shake128_next_state.
proof.
admit(*
proc.
wp; call dumpstate_array_avx2_ll.
wp; call keccakf1600_avx2_ll.
call state_from_pstate_avx2_ll.
by auto => />.
*).
qed.

phoare shake128_next_state_ph _buf:
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._shake128_next_state
 : buf = _buf
   ==>
   let st = bytes2state (sub _buf (2*168) 200) in
   sub res (2*168) 200 = state2bytes (keccak_f1600_op st)
 ] = 1%r
by conseq shake128_next_state_ll (shake128_next_state_h _buf).

(*
_shake128x4_squeeze3blocks
*)

require import Array4 Array128.

hoare shake256x4_A128__A32_A1_h _seed _nonces :
 Jkem_avx2.M(Jkem_avx2.Syscall)._shake256x4_A128__A32_A1
 : seed = _seed /\ nonces = _nonces 
 ==>
    res.`1 = Array128.of_list witness (SHAKE256 (to_list _seed ++ [_nonces.[0]]) 128)
 /\ res.`2 = Array128.of_list witness (SHAKE256 (to_list _seed ++ [_nonces.[1]]) 128)
 /\ res.`3 = Array128.of_list witness (SHAKE256 (to_list _seed ++ [_nonces.[2]]) 128)
 /\ res.`4 = Array128.of_list witness (SHAKE256 (to_list _seed ++ [_nonces.[3]]) 128).
admitted.

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

(*
axiom shake256_4x_128_32 _seed _nonces :
  phoare [
   Jkem_avx2.M(Jkem_avx2.Syscall)._shake256x4_A128__A32_A1 : arg.`5 = _seed /\ arg.`6 = _nonces ==>
   res.`1 = 
     SHAKE256_33_128 _seed _nonces.[0] /\
   res.`2 = 
     SHAKE256_33_128 _seed _nonces.[1] /\
   res.`3 = 
     SHAKE256_33_128 _seed _nonces.[2] /\
   res.`4 = 
     SHAKE256_33_128 _seed _nonces.[3]
] = 1%r.
*)

(*
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

*)

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

hoare keccakf1600_avx2x4_h (_a: state4x):
 Jkem_avx2.M(Jkem_avx2.Syscall)._keccakf1600_avx2x4 :
 a = _a
 ==> res = map_state4x keccak_f1600_op _a.
proof.
admitted.

lemma keccakf1600_4x_round_ll:
 islossless Jkem_avx2.M(Jkem_avx2.Syscall)._keccakf1600_4x_round.
admitted.

lemma keccakf1600_avx2x4_ll:
 islossless Jkem_avx2.M(Jkem_avx2.Syscall)._keccakf1600_avx2x4.
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

phoare keccakf1600_avx2x4_ph (_a: state4x):
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._keccakf1600_avx2x4 :
   a = _a
   ==> res = map_state4x keccak_f1600_op _a ] = 1%r.
proof. by conseq keccakf1600_avx2x4_ll (keccakf1600_avx2x4_h _a). qed.

lemma st_i_add st a b:
 0 <= a => 0 <= b =>
 st_i (st_i st b) a
 = st_i st (a+b).
proof.
rewrite /st_i.
elim/natind: a b.
 move=> n Hn b Ha Hb; rewrite (iter0 n) /#.
move=> n Hn IH b Ha Hb.
by rewrite eq_sym (:n+1+b=n+b+1) 1:/# (iterS (n+b)) 1:/# -IH // iterS 1:/#.
qed.

(*
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
*)
lemma stmatch_avx2_bytes st stavx:
 stmatch_avx2 st stavx <=>
 state2bytes st = stavx2bytes stavx.
proof.
admitted.

lemma state2bytesK st1:
 bytes2state (state2bytes st1) = st1.
admitted.

phoare shake128_absorb_A32_A2_ph _rho _rc:
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._shake128_absorb_A32_A2
   : seed = _rho /\ pos = _rc
     ==>
     stmatch_avx2 (SHAKE128_ABSORB (to_list _rho ++ to_list _rc)) res
 ] = 1%r.
admitted.

phoare shake128_squeeze3blocks_ph _buf _st:
 [ Jkem_avx2.M(Jkem_avx2.Syscall)._shake128_squeeze3blocks
 : buf=_buf /\ stmatch_avx2 _st st
 ==> sub res (0*168) 168 = squeezestate_i 168 _st 0
  /\ sub res (1*168) 168 = squeezestate_i 168 _st 1
  /\ sub res (2*168) 168 = squeezestate_i 168 _st 2
  /\ sub res (2*168) 200 = state2bytes (FIPS202_SHA3_Spec.st_i _st 3)
 ] =1%r.
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

(*
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

(*
axiom sha3equiv :
 equiv [    Jkem_avx2.M(Jkem_avx2.Syscall)._sha3_512A_A33 ~ M(Syscall)._sha3512_33 :
       ={arg} ==> ={res} ].
*)
