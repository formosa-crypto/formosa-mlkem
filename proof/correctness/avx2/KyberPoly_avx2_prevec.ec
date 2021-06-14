require import AllCore List Int IntExtra IntDiv CoreMap Real Number.
from Jasmin require import JModel JMemory JWord.
require import W16extra Array256 Fq Array16p WArray512.
require import Ops.
require import List_hakyber.

pragma +oldip.

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
admit. (* FIXME *)
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

end KyberPolyAVX.
