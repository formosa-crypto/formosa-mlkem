require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel JMemory JWord.
require import W16extra Array256 Fq Array16p WArray512 WArray32.
require import Ops.
require import List_hakyber.

pragma +oldip.

abbrev jqx16 = Array16.of_list witness [W16.of_int 3329; W16.of_int 3329;
W16.of_int 3329; W16.of_int 3329; W16.of_int 3329; W16.of_int 3329;
W16.of_int 3329; W16.of_int 3329; W16.of_int 3329; W16.of_int 3329;
W16.of_int 3329; W16.of_int 3329; W16.of_int 3329; W16.of_int 3329;
W16.of_int 3329; W16.of_int 3329].

op lift2poly (p: W256.t): W16.t Array16.t =
  Array16.init (fun (n : int) => p \bits16 n).

module Mavx2_prevec = {
  proc poly_add2(rp:W16.t Array256.t, bp:W16.t Array256.t) : W16.t Array256.t = {
    var i:int;
    var a:W256.t;
    var b:W256.t;
    var r:W256.t;
    var __a:W16.t Array16.t;
    var __b:W16.t Array16.t;
    var _r:W16.t Array16.t;

    i <- 0;

    while (i < 16) {
      a <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i));
      b <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * i));
      __a <- lift2poly(a);
      __b <- lift2poly(b);
      _r <@ Ops.ivadd16u256(__a, __b);
      r <- W16u16.pack16 [_r.[0]; _r.[1]; _r.[2]; _r.[3]; _r.[4]; _r.[5]; _r.[6]; _r.[7];
                          _r.[8]; _r.[9]; _r.[10]; _r.[11]; _r.[12]; _r.[13]; _r.[14]; _r.[15]];
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i) r));
      i <- i + 1;
    }

    return rp;
  }

  proc poly_sub(rp:W16.t Array256.t, ap:W16.t Array256.t,
                 bp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var i:int;
    var a:W256.t;
    var b:W256.t;
    var r:W256.t;
    var __a:W16.t Array16.t;
    var __b:W16.t Array16.t;
    var _r:W16.t Array16.t;

    i <- 0;
    while (i < 16) {
      a <- (get256_direct (WArray512.init16 (fun i => ap.[i])) (32 * i));
      b <- (get256_direct (WArray512.init16 (fun i => bp.[i])) (32 * i));
      __a <- lift2poly(a);
      __b <- lift2poly(b);
      _r <@ Ops.ivsub16u256(__a, __b);
      r <- W16u16.pack16 [_r.[0]; _r.[1]; _r.[2]; _r.[3]; _r.[4]; _r.[5]; _r.[6]; _r.[7];
                          _r.[8]; _r.[9]; _r.[10]; _r.[11]; _r.[12]; _r.[13]; _r.[14]; _r.[15]];
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i) r));
      i <- i + 1;
    }

    return (rp);
  }

  proc poly_csubq (rp:W16.t Array256.t) : W16.t Array256.t = {
    var aux: int;

    var qx16:W256.t;
    var _qx16: W16.t Array16.t;
    var i:int;
    var r:W256.t;
    var _r: W16.t Array16.t;
    var t: W16.t Array16.t;

    qx16 <- (get256 (WArray32.init16 (fun i => jqx16.[i])) 0);
    _qx16 <- lift2poly(qx16);
    i <- 0;
    while (i < 16) {
      r <- (get256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i));

      _r <- lift2poly(r);

      _r <@ Ops.ivsub16u256(_r, _qx16);
      t <@ Ops.iVPSRA_16u16(_r, (W8.of_int 15));
      t <@ Ops.ivpand16u16(t, _qx16);
      _r <@ Ops.ivadd16u256(t, _r);

      r <- W16u16.pack16 [_r.[0]; _r.[1]; _r.[2]; _r.[3]; _r.[4]; _r.[5]; _r.[6]; _r.[7];
                          _r.[8]; _r.[9]; _r.[10]; _r.[11]; _r.[12]; _r.[13]; _r.[14]; _r.[15]];
      rp <-
      Array256.init
      (WArray512.get16 (WArray512.set256_direct (WArray512.init16 (fun i => rp.[i])) (32 * i) r));
      i <- i + 1;
    }
    return (rp);
  }
}.

lemma lift2poly_iso (p: W16.t Array256.t) i:
    0 <= i < 16 =>
    let x = lift2poly (get256 (WArray512.init16 (fun j => p.[j])) i) in
    forall k, 16 * i <= k < 16 * i + 16 => x.[k %% 16] = p.[k].
proof.
move => i_b x k k_b.
rewrite /x /lift2poly get256E => />.
rewrite initiE.
move : k_b => /#.
have k_mb : 0 <= k %% 16 && k %% 16 < 16.
 by move : k_b => /#.
admit. (* FIXME 
rewrite (H4 asp) qE => />. 
rewrite /lift_array256 => />.
apply Array256.ext_eq => /> *.
rewrite mapiE => />.
rewrite mapiE => />.
case (x = to_uint i{hr}); last by smt(@Array256).
move => ->.
rewrite set_eqiE => />.
smt(@W64).
*)
qed.

lemma set_get_def (v : W16.t Array256.t) (w: W256.t) i j :
    0 <= i < 16 => 0 <= j < 256 =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      if 16 * i <= j < 16 * i + 16 then w \bits16 (j %% 16)
      else v.[j].
    proof.
    move => hx hs; rewrite set256E !get16E.
      rewrite -(W2u8.unpack8K (if 16 * i <= j < 16 * i + 16 then w \bits16 (j %% 16) else v.[j])); congr.
      apply W2u8.Pack.ext_eq => k hk.
      rewrite W2u8.get_unpack8 //= W2u8.Pack.initiE 1:/# /=.
      have H : (32 * i <= 2 * j + k < 32 * (i + 1)) = (16 * i <= j < 16 * i + 16) by smt().
      rewrite /H.
      case : (16 * i <= j < 16 * i + 16) => h.
      +  by admit. (* FIXME: rewrite W256_bits16_bits8 1:// /#. *)
      by admit. (*FIXME: rewrite /init16 initiE /#. *)
    qed.

lemma set_get_eq (v: W16.t Array256.t) (w: W256.t) i j:
    0 <= i < 16 => 0 <= j < 256 => 16 * i <= j < 16 * i + 16 =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      w \bits16 j %% 16.
    proof.
    by move => h1 h2 h3; rewrite set_get_def // h3.
  qed.

lemma set_get_diff (v: W16.t Array256.t) (w: W256.t) i j:
    0 <= i < 16 => 0 <= j < 256 => !(16 * i <= j < 16 * i + 16) =>
    WArray512.get16
    (WArray512.set256 (WArray512.init16 (fun i => v.[i])) i w) j =
      v.[j].
    proof.
    move => h1 h2 h3; rewrite set_get_def // h3. auto.
  qed.

lemma get_set_get_eqb (v: W16.t Array256.t) (w: W256.t) i:
  0 <= i < 16 => forall k, 0 <= k < i*16 =>
  v.[k] = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof.
move => i_i k k_i.
rewrite Array256.initiE.
move : i_i k_i; smt.
simplify.
rewrite set_get_def => /#.
qed.

lemma get_set_get_eqa (v: W16.t Array256.t) (w: W256.t) i:
  0 <= i < 16 => forall k, i*16 + 16 <= k < 256 =>
  v.[k] = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof.
move => i_i k k_i.
rewrite Array256.initiE.
move : i_i k_i; smt.
simplify.
rewrite set_get_def => /#.
qed.

lemma get_set_get_diff (v: W16.t Array256.t) (w: vt16u16) i:
  0 <= i < 16 => forall k, i*16 <= k < i*16 + 16 =>
  w \bits16 (k%%16) = (Array256.init (WArray512.get16 (WArray512.set256 (WArray512.init16 (fun j => v.[j])) i w))).[k].
proof.
move => i_i k k_i.
rewrite Array256.initiE.
move : i_i k_i; smt.
simplify.
rewrite set_get_def => /#.
qed.

theory KyberPolyAVX.

import Fq. 
import Kyber_.
import ZModField.

op signed_bound_cxq(coefs : W16.t Array256.t, l u c : int) : bool =
  forall k, l <= k < u => b16 coefs.[k] (c*Kyber_.q).

op pos_bound256_cxq (coefs : W16.t Array256.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] (c * q).

op lift_array256 (p: W16.t Array256.t) =
  Array256.map (fun x => inzmod (W16.to_sint x)) p.

lemma get_lift_array256_eq (p: W16.t Array256.t):
  let p_lift = lift_array256 p in
  forall k, 0 <= k < 256 => p_lift.[k] = inzmod (W16.to_sint p.[k]).
proof.
rewrite /lift_array256 => p_lift. rewrite /p_lift.
move => k k_i.
smt (@Array256).
qed.

lemma poly_add_corr _a _b ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 =>
      hoare[ Mavx2_prevec.poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
             inzmod (to_sint res.[k]) = _a.[k] + _b.[k]].
proof.
move => a_i b_i.
  proc => /=.
  while (
  0 <= i <= 16 /\
  (forall k, i*16 <= k < 256 =>
    inzmod (to_sint rp.[k]) = _a.[k]) /\
  _b = lift_array256 bp /\
    signed_bound_cxq rp (i*16) 256 ab /\
    signed_bound_cxq bp 0 256 bb /\
    signed_bound_cxq rp 0 (i*16) (ab + bb) /\
  (forall k, 0 <= k < i*16 =>
    inzmod (to_sint rp.[k]) = _a.[k] + _b.[k])
); last first.
auto => />.
move => *.
do split.
  smt(@Array256).
  smt().
  smt(@Array256).
move => *.
split. 
  smt(@Array256).
  smt(@Array256).
inline Ops.ivadd16u256. wp; skip.
move => &hr [#] H1 H2 H3 H4 H5 H6 H7 H8 H9 x y r rpu i.
have rpu_eqb_rp: forall k, 0 <= k < (i-1)*16 => rp{hr}.[k] = rpu.[k].
  by rewrite /rpu /i; apply get_set_get_eqb.
have rpu_eqa_rp: forall k, i*16 <= k < 256 => rp{hr}.[k] = rpu.[k].
  by rewrite /rpu /i mulzDl; apply get_set_get_eqa.
have rpu_eqm_ab: forall k, (i-1)*16 <= k < i*16 => rp{hr}.[k] + bp{hr}.[k] = rpu.[k].
  rewrite /rpu. rewrite /i. do rewrite mulzDl => />. move => k k_lb k_ub. rewrite -get_set_get_diff.
  smt. rewrite k_lb k_ub => />. rewrite -get_unpack16. smt. rewrite pack16K. rewrite get_of_list. smt. rewrite /r. do rewrite get_set_if => />.
  rewrite /x /y. rewrite -(lift2poly_iso rp{hr} (i-1)). smt. smt. rewrite -(lift2poly_iso bp{hr} (i-1)). smt. smt. smt.
do split. 
  rewrite /i. apply ltzW. apply ltzS. auto. move => H10. move : H9. rewrite /i. apply ltzE.
  move => k k_i. rewrite -rpu_eqa_rp. apply k_i. apply H3. move : k_i => /#.
  apply H4.
  rewrite /signed_bound_cxq. move => k k_i. rewrite -rpu_eqa_rp. apply k_i. apply H5. move : k_i => /#.
  apply H6.
  rewrite /signed_bound_cxq => k k_i.
case (k < (i-1)*16).
  move => k_ni.
  rewrite -rpu_eqb_rp.
  rewrite k_ni => /=.
  move : k_i => //.
  apply H7.
  rewrite /i in k_ni.
  rewrite k_ni => /=.
  move : k_i. trivial.
rewrite -lezNgt => k_ni.
rewrite /b16.
rewrite -rpu_eqm_ab.
rewrite k_ni => /#.

move : (add_corr_qv rp{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 6 3 _ _ _ _ _ _) => />; first 2 by smt(@Array256).

split.
  move : (H5 k _) => /#. move : (H5 k _) => /#.
  move : (H6 k _) => /#. 

move => *.
rewrite to_sintD_small => />.
move : (H5 k _); first by smt().
move : (H6 k _); first by smt().
move => *.
rewrite /b16 in H11.
rewrite /b16 in H12.
split.
move : H11 => /#.
move : H12 => /#.
split.
move : (H5 k _) (H6 k _) => /#.
move : (H5 k _) (H6 k _) => /#.

move => k k_i.
case (k < (i-1)*16).
  move => k_ni.
  rewrite -rpu_eqb_rp.
  rewrite k_ni => /=.
  move : k_i => //.
  apply H8.
  rewrite k_ni => /=.
  move : k_i => //.
  rewrite -lezNgt => k_ni.
rewrite -rpu_eqm_ab.
smt.

move : (add_corr_qv rp{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 6 3 _ _ _ _ _ _) => />.
move : (H3 k _) => /#.
move : H4. rewrite /lift_array256. smt(@Array256).

split.
  move : (H5 k _) => /#. 
  move : (H5 k _) => /#.
  move : (H6 k _) => /#. 
qed.


lemma poly_sub_corr _a _b ab bb :
    0 <= ab <= 4 => 0 <= bb <= 4 =>  
      hoare[ Mavx2_prevec.poly_sub :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              inzmod (to_sint res.[k]) = _a.[k] - _b.[k]]. 
proof.
move => *.
proc. 
while (
           0 <= i <= 16 /\
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb /\
           signed_bound_cxq rp 0 (i*16) (ab + bb) /\ 
           forall k, 0 <= k < (i*16) =>
              inzmod (to_sint rp.[k]) = _a.[k] - _b.[k]
); first last.
auto => />.
move => *.
do split.
 smt(@Array256).
 smt.
 smt(@Array256).
move => *.
 inline Ops.ivsub16u256; wp; skip.
move => &hr [#] H1 H2 H3 H4 H5 H6 H7 H8 H9 x y r rpu i.
have rpu_eqb_rp: forall k, 0 <= k < (i-1)*16 => rp{hr}.[k] = rpu.[k].
   by rewrite /rpu /i; apply get_set_get_eqb.
have rpu_eqa_rp: forall k, i*16 <= k < 256 => rp{hr}.[k] = rpu.[k].
  by rewrite /rpu /i mulzDl; apply get_set_get_eqa.
have rpu_eqm_ab: forall k, (i-1)*16 <= k < i*16 => ap{hr}.[k] - bp{hr}.[k] = rpu.[k].
  rewrite /rpu. rewrite /i. do rewrite mulzDl => />. move => k k_lb k_ub. rewrite -get_set_get_diff.
  smt. rewrite k_lb k_ub => />. rewrite -get_unpack16. smt. rewrite pack16K. rewrite get_of_list. smt. rewrite /r. do rewrite get_set_if => />.
  rewrite /x /y. rewrite -(lift2poly_iso ap{hr} (i-1)). smt. smt. rewrite -(lift2poly_iso bp{hr} (i-1)). smt. smt. smt.
split.
 rewrite /i; move : H1 H9 => /#.
do split.
 apply H3.
 apply H4.
 apply H5.
 apply H6.
 rewrite /signed_bound_cxq => k k_i.
case (k < (i-1) * 16).
  move => k_ni.
  rewrite -rpu_eqb_rp.
  rewrite k_ni => /=.
  move : k_i => //.
  apply H7.
  rewrite /i in k_ni.
  rewrite k_ni => /=.
  move : k_i => />.
rewrite -lezNgt => k_ni.
rewrite /b16.
rewrite -rpu_eqm_ab.
rewrite k_ni => /#.

move : (sub_corr ap{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 14 14 _ _ _ _ _ _) => />; first 2 by smt(@Array256).

move : (H5 k _) => /#.
move : (H6 k _) => /#.

move => *.
rewrite to_sintB_small => />.
move : (H5 k _) (H6 k _) => /#.
move : (H5 k _) (H6 k _) => /#.

move => k k_i.
case (k < (i-1)*16).
move => k_ub.
rewrite -rpu_eqb_rp => /=.
rewrite k_ub; move : k_i => />.
apply H8.
rewrite k_ub; move : k_i => />.
rewrite -lezNgt => k_ni.

rewrite -rpu_eqm_ab.
rewrite k_ni => /#.

move : (sub_corr ap{hr}.[k] bp{hr}.[k] _a.[k] _b.[k] 14 14 _ _ _ _ _ _) => />; first 2 by smt(@Array256).
move : (H5 k _) => /#.
move : (H6 k _) => /#.
qed.

(* FIXME: dup from KyberPoly*)
lemma m1true x :
  0 <= x < 16 =>
    (W16.of_int 65535).[x].
proof.
move => *.
rewrite of_intwE => />.
rewrite /int_bit => />. 
case (x = 0); first by smt(@Ring.IntID) => />.
move => *; case(x=1); first by auto => />.
move => *; case(x=2); first by auto => />.
move => *; case(x=3); first by auto => />.
move => *; case(x=4); first by auto => />.
move => *; case(x=5); first by auto => />.
move => *; case(x=6); first by auto => />.
move => *; case(x=7); first by auto => />.
move => *; case(x=8); first by auto => />.
move => *; case(x=9); first by auto => />.
move => *; case(x=10); first by auto => />.
move => *; case(x=11); first by auto => />.
move => *; case(x=12); first by auto => />.
move => *; case(x=13); first by auto => />.
move => *; case(x=14); first by auto => />.
move => *; case(x=15); first by auto => />.
smt().
qed.

lemma getsign x :
      (x \slt W16.zero => x `|>>` (of_int 15)%W8 = (of_int 65535)%W16) /\
      (W16.zero \sle x => x `|>>` (of_int 15)%W8 = W16.zero).
proof.
rewrite /(`|>>`) sarE sltE sleE !to_sintE /smod => />.
split; move => hh.
  have  xb : (32768 <= to_uint x); first by smt(W16.to_uint_cmp).
  apply W16.ext_eq => k kb; rewrite initiE => />.
  rewrite (_: min 15 (k+15) = 15); first by smt().
  by rewrite m1true // get_to_uint => />;smt().
have  xb : (0 <= to_uint x < 32768).
   split; first by smt().
   case (32768 <= to_uint x).
      move => *.
      have ? : false;  move : (W16.to_uint_cmp x) => />; smt().
      smt(). 
move => *.
  apply W16.ext_eq => k kb; rewrite initiE => />.
  rewrite (_: min 15 (k+15) = 15); first by smt().
  by rewrite get_to_uint => />;smt().
qed.


lemma poly_csubq_corr_h ap :
      hoare[ Mavx2_prevec.poly_csubq :
             ap = lift_array256 rp /\
             pos_bound256_cxq rp 0 256 2
             ==>
             ap = lift_array256 res /\
             pos_bound256_cxq res 0 256 1 ].
proof.
proc.
while (ap = lift_array256 rp /\ pos_bound256_cxq rp 0 256 2 /\ pos_bound256_cxq rp 0 (16*i) 1 /\ 0 <= i <= 16 /\ forall k, 0 <= k < 16 => _qx16.[k] = jqx16.[k]).
seq 3 : (#pre /\ forall k, 16*i <= k < 16*i + 16 => _r.[k%%16] = rp.[k] - _qx16.[k%%16]).
inline Ops.ivsub16u256.
wp. skip. simplify.
move => &hr [#] *.
split.
trivial.
move => k k_i.
do rewrite get_set_if => />.
rewrite -(lift2poly_iso _ i{hr}) => /#.
seq 2 : (#pre /\
         (forall k, 16*i <= k < 16 * i + 16 => (_r.[k%%16] \slt W16.zero => t.[k%%16] = _qx16.[k%%16]))  /\
          (forall k, 16*i <= k < 16 * i + 16 => (W16.zero \sle _r.[k%%16] => t.[k%%16] = W16.zero))).
seq 1 : (#pre /\
         (forall k, 16*i <= k < 16 * i + 16 => (_r.[k%%16] \slt W16.zero => t.[k%%16] = W16.of_int (W16.modulus - 1))) /\
         (forall k, 16*i <= k < 16 * i + 16 => (W16.zero \sle _r.[k%%16] => t.[k%%16] = W16.zero))).
auto => />.
move => &hr [#] *.
do split.
apply H.
apply H0.
apply H1.
apply H2.
move => *; apply H3.
apply H4.
apply H5.
move => k k_i.
move : H6 => /#.
move : H6 => /#.
move : H7 => /#.
inline Ops.iVPSRA_16u16.
auto => />.
move => &hr [#] *.
split.
move => *.
do rewrite get_set_if => />.
smt(getsign @Array16 @W16).
move => *.
do rewrite get_set_if => />.
smt(getsign @Array16 @W16).
auto => />.
move => &hr [#] *.
do split.
apply H.
apply H0.
apply H1.
apply H2.
move => *; apply H3.
apply H4.
move : H5 => //=.
move : H6 => /#.
move : H7 => /#.
move : H8 => /#.
inline Ops.ivpand16u16.
auto => />.
move => &hr [#] *.
split.
move => *.
have k_i : 0 <= k %% 16 && k %% 16 < 16.
move : H8 H9 => /#.
move : (H6 _ _ H10).
move : H8 H9 => //=.
move => t.
do rewrite get_set_if => />.
case (k%%16 = 15) => *.
rewrite -H11 t  -/W16.onew and1w => //.
admit.
(* FIXME: works but not pretty
case (k%%16 = 14) => *.
rewrite -H10 t  -/W16.onew and1w => //.
case (k%%16 = 13) => *.
rewrite -H10 t  -/W16.onew and1w => //.
case (k%%16 = 12) => *.
rewrite -H10 t  -/W16.onew and1w => //.
case (k%%16 = 11) => *.
rewrite -H10 t  -/W16.onew and1w => //.
case (k%%16 = 10) => *.
rewrite -H10 t  -/W16.onew and1w => //.
case (k%%16 = 9) => *.
rewrite -H10 t  -/W16.onew and1w => //.
case (k%%16 = 8) => *.
rewrite -H10 t  -/W16.onew and1w => //.
case (k%%16 = 7) => *.
rewrite -H10 t  -/W16.onew and1w => //.
case (k%%16 = 6) => *.
rewrite -H10 t  -/W16.onew and1w => //.
case (k%%16 = 4) => *.
rewrite -H10 t  -/W16.onew and1w => //.
case (k%%16 = 3) => *.
rewrite -H10 t  -/W16.onew and1w => //.
case (k%%16 = 2) => *.
rewrite -H10 t  -/W16.onew and1w => //.
case (k%%16 = 1) => *.
rewrite -H10 t  -/W16.onew and1w => //.
case (k%%16 = 0) => *.
rewrite -H10 t  -/W16.onew and1w => //.
*)
move => *.
have k_i : 0 <= k %% 16 && k %% 16 < 16.
  move : H8 H9 => /#.
move : (H7 _ _ H10).
move : H8 H9 => /#.
move => t.
do rewrite get_set_if => />.
case (k%%16 = 15) => *.
rewrite -H11 t and0w => //.
admit.
(* FIXME: works but not pretty
case (k%%16 = 14) => *.
rewrite -H10 t and0w => //.
case (k%%16 = 13) => *.
rewrite -H10 t and0w => //.
case (k%%16 = 12) => *.
rewrite -H10 t and0w => //.
case (k%%16 = 11) => *.
rewrite -H10 t and0w => //.
case (k%%16 = 10) => *.
rewrite -H10 t and0w => //.
case (k%%16 = 9) => *.
rewrite -H10 t and0w => //.
case (k%%16 = 8) => *.
rewrite -H10 t and0w => //.
case (k%%16 = 7) => *.
rewrite -H10 t and0w => //.
case (k%%16 = 6) => *.
rewrite -H10 t and0w => //.
case (k%%16 = 4) => *.
rewrite -H10 t and0w => //.
case (k%%16 = 3) => *.
rewrite -H10 t and0w => //.
case (k%%16 = 2) => *.
rewrite -H10 t and0w => //.
case (k%%16 = 1) => *.
rewrite -H10 t and0w => //.
case (k%%16 = 0) => *.
rewrite -H10 t and0w => //.
*)
inline Ops.ivadd16u256.
auto => />.
move => &hr [#] * => />.
do split.
case (forall k, 16*i{hr} <= k < 16 * i{hr} + 16 => (rp{hr}.[k] - _qx16{hr}.[k%%16]) \slt W16.zero).
pose w := pack16 [t{hr}.[0] + _r{hr}.[0]; t{hr}.[1] + _r{hr}.[1];
                  t{hr}.[2] + _r{hr}.[2]; t{hr}.[3] + _r{hr}.[3];
                  t{hr}.[4] + _r{hr}.[4]; t{hr}.[5] + _r{hr}.[5];
                  t{hr}.[6] + _r{hr}.[6]; t{hr}.[7] + _r{hr}.[7];
                  t{hr}.[8] + _r{hr}.[8]; t{hr}.[9] + _r{hr}.[9];
                  t{hr}.[10] + _r{hr}.[10]; t{hr}.[11] + _r{hr}.[11];
                  t{hr}.[12] + _r{hr}.[12]; t{hr}.[13] + _r{hr}.[13];
                  t{hr}.[14] + _r{hr}.[14]; t{hr}.[15] + _r{hr}.[15]].
move => *.
have r_b : (forall k, 16*i{hr} <= k < 16 * i{hr} + 16 => _r{hr}.[k %% 16] \slt W16.zero).
  by move => *; rewrite H5 => //=; apply H8 => //=.
rewrite /lift_array256 => />.
apply Array256.ext_eq => /> *.
do rewrite mapiE => />.
case (16 * i{hr} <= x0 < 16 * i{hr} + 16); first last.
move => x_b.
rewrite -(set_get_diff rp{hr} w i{hr}).
rewrite H1 H4 => //.
rewrite H9 H10 => //.
apply x_b.
rewrite initiE.
rewrite H9 H10 => //.
trivial.
move => x_b.
have x_i : 0 <= x0 %% 16 && x0 %% 16 < 16.
  move : x_b => /#.
rewrite initiE.
rewrite H9 H10 => //.
simplify.
rewrite set_get_eq.
rewrite H1 H4 => //.
rewrite H9 H10 => //.
apply x_b.
rewrite /w.
rewrite -get_unpack16 => //=.
rewrite get_of_list => //=.
case (x0 %% 16 = 0) => *.
rewrite -H11.
rewrite H6 => //=.
apply r_b => //=.
rewrite H5 => //=.
rewrite addrC; smt(@W16).
admit. (* FIXME *)

pose w := pack16 [t{hr}.[0] + _r{hr}.[0]; t{hr}.[1] + _r{hr}.[1];
                  t{hr}.[2] + _r{hr}.[2]; t{hr}.[3] + _r{hr}.[3];
                  t{hr}.[4] + _r{hr}.[4]; t{hr}.[5] + _r{hr}.[5];
                  t{hr}.[6] + _r{hr}.[6]; t{hr}.[7] + _r{hr}.[7];
                  t{hr}.[8] + _r{hr}.[8]; t{hr}.[9] + _r{hr}.[9];
                  t{hr}.[10] + _r{hr}.[10]; t{hr}.[11] + _r{hr}.[11];
                  t{hr}.[12] + _r{hr}.[12]; t{hr}.[13] + _r{hr}.[13];
                  t{hr}.[14] + _r{hr}.[14]; t{hr}.[15] + _r{hr}.[15]].
pose qx16 := [(of_int 3329)%W16; (of_int 3329)%W16; (of_int 3329)%W16;
               (of_int 3329)%W16; (of_int 3329)%W16; (of_int 3329)%W16;
               (of_int 3329)%W16; (of_int 3329)%W16; (of_int 3329)%W16;
               (of_int 3329)%W16; (of_int 3329)%W16; (of_int 3329)%W16;
               (of_int 3329)%W16; (of_int 3329)%W16; (of_int 3329)%W16;
               (of_int 3329)%W16].
move => *.
have H9: (forall k, 16*i{hr} <= k < 16 * i{hr} + 16 => W16.zero \sle _r{hr}.[k%%16]).
  move => k k_i.
  rewrite /W16.(\sle). rewrite H5 => //=. rewrite (lezNgt (to_sint W16.zero) (to_sint (rp{hr}.[k] - _qx16{hr}.[k %% 16]))).
  rewrite -W16.sltE. (* apply H7. *) admit.
rewrite /lift_array256 => />.
apply Array256.ext_eq => /> *.
do rewrite mapiE => />.
case (16 * i{hr} <= x0 < 16 * i{hr} + 16); first last.
move => x_b.
rewrite -(set_get_diff rp{hr} w i{hr}).
rewrite H1 H4 => //.
rewrite H10 H11 => //.
apply x_b.
rewrite initiE.
rewrite H10 H11 => //.
trivial.
move => x_b.
have x_i : 0 <= x0 %% 16 && x0 %% 16 < 16.
  move : x_b => /#.
rewrite initiE.
rewrite H10 H11 => //.
simplify.
rewrite set_get_eq.
rewrite H1 H4 => //.
rewrite H10 H11 => //.
apply x_b.
rewrite /w.
rewrite -get_unpack16 => //=.
rewrite get_of_list => //=.
case (x0 %% 16 = 0) => *.
rewrite -H12.
rewrite H5 => //=.
rewrite H7 => //=.
apply H9 => //=.
rewrite to_sintD_small => />.
move : H; rewrite /pos_bound256_cxq => bnd.
move : (bnd x0 _); first by smt(@W64).
auto => />.
rewrite qE => /> *.
split.

(****)
rewrite to_sintN => //=.
rewrite H3 => //=.
rewrite /(jqx16).
rewrite get_of_list => //=.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
have ->: 2 ^ (16 - 1) <= 3329 <=> false. smt().
simplify.
smt.
rewrite H3 => //=.
rewrite /(jqx16).
rewrite get_of_list => //=.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
have ->: 2 ^ (16 - 1) <= 3329 <=> false. smt().
simplify.
smt.
(****)

(****)
rewrite to_sintN => //=.
rewrite H3 => //=.
rewrite /(jqx16).
rewrite get_of_list => //=.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
have ->: 2 ^ (16 - 1) <= 3329 <=> false. smt().
simplify.
smt.
rewrite H3 => //=.
rewrite /(jqx16).
rewrite get_of_list => //=.
do rewrite fun_if.
rewrite of_sintK.
simplify.
rewrite /smod.
have ->: 2 ^ (16 - 1) <= 3329 <=> false. smt().
simplify.
smt.
(****)

rewrite inzmodD. ring.
rewrite H3 => //=.
rewrite /(jqx16).
rewrite get_of_list => //=.
rewrite fun_if.
do rewrite fun_if.
rewrite to_sintE /smod to_uintN => />.

have ?: 3329 %% q = 0.
  rewrite qE => /#.

rewrite -inzmodN.
rewrite /zero.
simplify.
do smt(eq_inzmod).
admit. (* FIXME *)

(****)
pose w := pack16 [t{hr}.[0] + _r{hr}.[0]; t{hr}.[1] + _r{hr}.[1];
                  t{hr}.[2] + _r{hr}.[2]; t{hr}.[3] + _r{hr}.[3];
                  t{hr}.[4] + _r{hr}.[4]; t{hr}.[5] + _r{hr}.[5];
                  t{hr}.[6] + _r{hr}.[6]; t{hr}.[7] + _r{hr}.[7];
                  t{hr}.[8] + _r{hr}.[8]; t{hr}.[9] + _r{hr}.[9];
                  t{hr}.[10] + _r{hr}.[10]; t{hr}.[11] + _r{hr}.[11];
                  t{hr}.[12] + _r{hr}.[12]; t{hr}.[13] + _r{hr}.[13];
                  t{hr}.[14] + _r{hr}.[14]; t{hr}.[15] + _r{hr}.[15]].
move : H H0; rewrite /pos_bound256_cxq => /> *.
split.
case (forall k, 16*i{hr} <= k < 16 * i{hr} + 16 => (rp{hr}.[k] - _qx16{hr}.[k%%16]) \slt W16.zero).
move => *.
case (16 * i{hr} <= k < 16 * i{hr} + 16); last first.
move => *.
rewrite initiE => //=.
rewrite (set_get_diff rp{hr} w i{hr}) => //=.
move : (H k); rewrite /bpos16 => /#.
move => *.
have k_i : 0 <= k %% 16 && k %% 16 < 16.
  move : H10 => /#.
rewrite initiE => //=.
rewrite set_get_eq => //=.
rewrite /w.
rewrite -get_unpack16 => //=.
rewrite get_of_list => //=.
case (k %% 16 = 0). (* FIXME *)
move => *.
rewrite -H12.

(* rewrite (if_congr (k %% 16 = 0) (k %% 16 = 0) (t{hr}.[0] + _r{hr}.[0]) _ (t{hr}.[k %% 16] + _r{hr}.[k%%16]) _). *)

admit.

qed.

end KyberPolyAVX.
