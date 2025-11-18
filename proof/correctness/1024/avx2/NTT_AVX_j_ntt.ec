require import AllCore List Int IntDiv Ring StdOrder.

from Jasmin require import JModel.

from JazzEC require import Array256 Array16 WArray32.
from JazzEC require import WArray512.
from JazzEC require import Array400 WArray800.


require import NTT_AVX_Fq_basemul MLKEMFCLib.
require import NTT_AVX_j.

from CryptoSpecs require import GFq Correctness1024.

require import Fq.
import Zq.

require import MLKEM_Poly.
import MLKEM_Poly.


require AVX2_Ops.
require import Montgomery16.
from JazzEC require import Jkem1024_avx2 Jkem1024.

import IntOrder.

(** Butterfly *)

lemma  REDCmul16coeff (x y: W16.t):
 sint_bnd 0 (q-1) y =>
 incoeffW16 (Montgomery16.REDCmul16 x y)
 = incoeffW16 x * incoeffW16 y * incoeff Montgomery16.Rinv
 /\ sint_bnd (-(q-1)) (q-1) (Montgomery16.REDCmul16 x y).
proof.
move: (Montgomery16.REDCmul16_correct x y).
rewrite /Montgomery16.q /q /Montgomery16.Rinv.
move => H1 H2; move: (H1 H2) => {H1} {H2} [H1 H2].
split => //.
by rewrite -(incoeffM_mod (to_sint x)) -incoeffM_mod /q modzMml -H1 /#.
qed.

lemma butterfly_r (c:int) xl xr z rxl rxr rzM rzMqinv rq:
 (c+1)*q <= W16.max_sint =>
 rq = W16.of_int q =>
 Iu16_sb c rxl xl =>
 Iu16_sb c rxr xr =>
 Iu16M_ub 1 rzM z =>
 rzMqinv = rzM * (W16.of_int 62209) =>
 Iu16_sb (c+1) 
   (wmulhs rzM rxr + rxl - wmulhs (rzMqinv * rxr) rq)
   (xl+z*xr).
proof.
move => Hbnd Hq [-> Hxl] [-> Hxr] [HzM HzBnd] ->.
have ->: wmulhs rzM rxr + rxl - wmulhs (rzM * (of_int 62209)%W16 * rxr) rq
 = rxl + (wmulhs rzM rxr - wmulhs (rzM * (of_int 62209)%W16 * rxr) rq) by ring.
apply Iu16_sbD; first 2 done.
pose t := (_ + - _)%W16.
have ->: t = Montgomery16.REDCmul16 rxr rzM.
 rewrite /t /REDC16 /Montgomery16.q /Montgomery16.qinv Hq /q /=.
 congr.
  by rewrite /wmulhs /#.
 by congr; congr; ring.
have := Montgomery16.REDCmul16_correct rxr rzM _.
 smt().
rewrite (_:Montgomery16.q=q) 1:/#; move => /= [H1 H2].
split.
 rewrite -(asintK z) -incoeffM -eq_incoeff H1.
 have Hone: Zq.one = incoeff Montgomery16.R * incoeff Montgomery16.Rinv. 
  by rewrite -incoeffM -eq_incoeff -Montgomery16.RRinv /#.
 have ->: z = incoeffW16 rzM * incoeff Montgomery16.Rinv. 
  by rewrite -(ZqField.mul1r z) ZqField.mulrC Hone ZqField.mulrA HzM.
 by rewrite -incoeffM incoeffK modzMml /#.
rewrite /=; apply (sint_bndW _ _ _ _ _ _ _ H2); smt().
qed.

lemma butterfly16x_rE (n:int) xl xr z rxl rxr rzM rzMqinv rq16x:
 (n+1)*q <= W16.max_sint =>
 I16u16_sb n rxl xl =>
 I16u16_sb n rxr xr =>
 qinv16u16M rzMqinv rzM =>
 I16u16M_ub 1 rzM z =>
 x16_spec q rq16x =>
 I16u16_sb (n+1)
  (VPSUB_16u16 (VPADD_16u16 (VPMULH_16u16 rzM rxr) rxl) (VPMULH_16u16 (VPMULL_16u16 rzMqinv rxr) rq16x))
  (Array16.init (fun i=>xl.[i]+z.[i]*xr.[i])).
proof.
rewrite -3!allP_range.
move=> Hbnd Hl Hr /qinv16u16M_bits16 Hqinv Hz /x16_spec_bits16 Hq.
rewrite /VPSUB_16u16 /VPADD_16u16 /VPMULH_16u16 /VPMULL_16u16 /= -iotaredE /R2C /=.
do 15! (split; first by apply butterfly_r; [assumption|by apply Hq|by apply Hl|
 by apply Hr| by apply Hz| by rewrite Hqinv]).
by apply butterfly_r; [assumption|by apply Hq|by apply Hl|
 by apply Hr| by apply Hz| by rewrite Hqinv].
qed.

lemma butterfly_l (c:int) xl xr z rxl rxr rzM rzMqinv rq:
 (c+1)*q <= W16.max_sint =>
 rq = W16.of_int q =>
 Iu16_sb c rxl xl =>
 Iu16_sb c rxr xr =>
 Iu16M_ub 1 rzM z =>
 rzMqinv = rzM * (W16.of_int 62209) =>
 Iu16_sb (c+1) 
   (wmulhs (rzMqinv * rxr) rq + (rxl - wmulhs rzM rxr))
   (xl-z*xr).
proof.
move => Hbnd Hq [-> Hxl] [-> Hxr] [HzM HzBnd] ->.
have ->: wmulhs (rzM * (of_int 62209)%W16 * rxr) rq + (rxl - wmulhs rzM rxr)
 = rxl - (wmulhs rzM rxr - wmulhs (rzM * (of_int 62209)%W16 * rxr) rq) by ring.
apply Iu16_sbD; first 2 by done.
pose t := (- _)%W16.
have ->: t = - Montgomery16.REDCmul16 rxr rzM.
 rewrite /t /REDC16 /Montgomery16.q /Montgomery16.qinv Hq /q /=.
 congr; congr.
  by rewrite /wmulhs /#.
 by congr; congr; ring.
have := Montgomery16.REDCmul16_correct rxr rzM _.
 smt().
rewrite (_:Montgomery16.q=q) 1:/#; move => /= [H1 H2].
have /=H2':= to_sintN_bnd _ _ _ H2 _.
 smt().
split.
 rewrite to_sintN_small 1:/# incoeffN; congr.
 rewrite -(asintK z) -incoeffM -eq_incoeff H1.
 have Hone: Zq.one = incoeff Montgomery16.R * incoeff Montgomery16.Rinv. 
  by rewrite -incoeffM -eq_incoeff -Montgomery16.RRinv /#.
 have ->: z = incoeffW16 rzM * incoeff Montgomery16.Rinv. 
  by rewrite -(ZqField.mul1r z) ZqField.mulrC Hone ZqField.mulrA HzM.
 by rewrite -incoeffM incoeffK modzMml /#.
rewrite /=; apply (sint_bndW _ _ _ _ _ _ _ H2'); smt().
qed.

lemma butterfly16x_lE (n:int) xl xr z rxl rxr rzM rzMqinv rq16x:
 (n+1)*q <= W16.max_sint =>
 I16u16_sb n rxl xl =>
 I16u16_sb n rxr xr =>
 qinv16u16M rzMqinv rzM =>
 I16u16M_ub 1 rzM z =>
 x16_spec q rq16x =>
 I16u16_sb (n+1)
  (VPADD_16u16 (VPMULH_16u16 (VPMULL_16u16 rzMqinv rxr) rq16x) (VPSUB_16u16 rxl (VPMULH_16u16 rzM rxr)))
  (Array16.init (fun i=>xl.[i]-z.[i]*xr.[i])).
proof.
rewrite -3!allP_range.
move=> Hbnd Hl Hr /qinv16u16M_bits16 Hqinv Hz /x16_spec_bits16 Hq.
rewrite /VPSUB_16u16 /VPADD_16u16 /VPMULH_16u16 /VPMULL_16u16 /= -iotaredE /R2C /=.
do 15! (split; first by apply butterfly_l; [assumption|by apply Hq|by apply Hl|
 by apply Hr| by apply Hz| by rewrite Hqinv]).
by apply butterfly_l; [assumption|by apply Hq|by apply Hl|
 by apply Hr| by apply Hz| by rewrite Hqinv].
qed.

equiv butterfly64x_eq c:
 NTT_AVX.__butterfly64x ~Jkem1024_avx2.M.__butterfly64x :
 (c+1)*q <= W16.max_sint /\
 I16u16_sb c rl0{2} rl0t{1} /\
 I16u16_sb c rl1{2} rl1t{1} /\
 I16u16_sb c rl2{2} rl2t{1} /\
 I16u16_sb c rl3{2} rl3t{1} /\
 I16u16_sb c rh0{2} rh0t{1} /\
 I16u16_sb c rh1{2} rh1t{1} /\
 I16u16_sb c rh2{2} rh2t{1} /\
 I16u16_sb c rh3{2} rh3t{1} /\
 qinv16u16M zl0{2} zh0{2} /\
 qinv16u16M zl1{2} zh1{2} /\
 I16u16M_ub 1 zh0{2} z0{1} /\
 I16u16M_ub 1 zh1{2} z1{1} /\
 x16_spec q qx16{2}
 ==>
 I16u16_sb (c+1) res{2}.`1 res{1}.`1 /\
 I16u16_sb (c+1) res{2}.`2 res{1}.`2 /\
 I16u16_sb (c+1) res{2}.`3 res{1}.`3 /\
 I16u16_sb (c+1) res{2}.`4 res{1}.`4 /\
 I16u16_sb (c+1) res{2}.`5 res{1}.`5 /\
 I16u16_sb (c+1) res{2}.`6 res{1}.`6 /\
 I16u16_sb (c+1) res{2}.`7 res{1}.`7 /\
 I16u16_sb (c+1) res{2}.`8 res{1}.`8.
proof.
proc; sp 1 0; simplify.
wp; skip => |> &1 &2 Hbnd H0 H1 H2 H3 H4 H5 H6 H7 Hqinv0 Hqinv1 Hzl Hzh Hq.
do 4! (split; first by apply butterfly16x_rE).
do 3! (split; first by apply butterfly16x_lE).
by apply butterfly16x_lE.
qed.

lemma __shuffle8_ll: islossless Jkem1024_avx2.M.__shuffle8 by islossless.

hoare __shuffle8_h na nb _a _b:
Jkem1024_avx2.M.__shuffle8:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle8 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle8 _a _b).`2.
proof.
proc; simplify.
wp; skip => |> &m Ha Hb.
rewrite /VPERM2I128 /=.
rewrite ifF /int_bit //=.
move: Ha; rewrite -{1}iotaredE /R2C /= => |> *.
move: Hb; rewrite -{1}iotaredE /R2C /= => |> *.
by rewrite -iotaredE /= !b2i0 !b2i1 /shuffle8 /= /#.
qed.

phoare __shuffle8_ph' n _a _b:
 [Jkem1024_avx2.M.__shuffle8:
   I16u16_sb n a _a /\ I16u16_sb n b _b
   ==> I16u16_sb n res.`1 (shuffle8 _a _b).`1
       /\ I16u16_sb n res.`2 (shuffle8 _a _b).`2 ] = 1%r.
proof. by conseq __shuffle8_ll (__shuffle8_h n n _a _b). qed.

phoare __shuffle8_ph na nb _a _b:
 [Jkem1024_avx2.M.__shuffle8:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle8 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle8 _a _b).`2 ] = 1%r.
proof. by conseq __shuffle8_ll (__shuffle8_h na nb _a _b). qed.

lemma __shuffle4_ll: islossless Jkem1024_avx2.M.__shuffle4 by islossless.

hoare __shuffle4_h na nb _a _b:
Jkem1024_avx2.M.__shuffle4:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle4 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle4 _a _b).`2.
proof.
proc; simplify.
wp; skip => |> &m Ha Hb.
rewrite /VPUNPCKL_4u64 /VPUNPCKH_4u64 /VPUNPCKL_2u64 /VPUNPCKH_2u64 /= /shuffle4 /= /interleave_gen /get_lo_2u64 /get_hi_2u64 /=.
move: Ha; rewrite -{1}iotaredE /R2C /= => |> *.
move: Hb; rewrite -{1}iotaredE /R2C /= => |> *.
by rewrite -!iotaredE /= /#.
qed.

phoare __shuffle4_ph na nb _a _b:
 [Jkem1024_avx2.M.__shuffle4:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle4 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle4 _a _b).`2 ] = 1%r.
proof. by conseq __shuffle4_ll (__shuffle4_h na nb _a _b). qed.

lemma __shuffle2_ll: islossless Jkem1024_avx2.M.__shuffle2 by islossless.

hoare __shuffle2_h na nb _a _b:
Jkem1024_avx2.M.__shuffle2:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle2 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle2 _a _b).`2.
proof.
proc; simplify.
wp; skip => |> &m Ha Hb.
rewrite /VPBLENDD_256 /VMOVSLDUP_256 /VMOVSLDUP_128 /VPSRL_4u64 /shuffle2 /= /int_bit /=.
move: Ha; rewrite -{1}iotaredE /R2C /= => |> *.
move: Hb; rewrite -{1}iotaredE /R2C /= => |> *.
rewrite -!iotaredE /= => |>.
by rewrite !bits64_shr32_bits16 /= /#.
qed.

phoare __shuffle2_ph na nb _a _b:
 [Jkem1024_avx2.M.__shuffle2:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle2 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle2 _a _b).`2 ] = 1%r.
proof. by conseq __shuffle2_ll (__shuffle2_h na nb _a _b). qed.

lemma __shuffle1_ll: islossless Jkem1024_avx2.M.__shuffle1 by islossless.

hoare __shuffle1_h na nb _a _b:
Jkem1024_avx2.M.__shuffle1:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle1 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle1 _a _b).`2.
proof.
proc; simplify.
wp; skip => |> &m Ha Hb.
rewrite /VPBLENDW_256 /VPBLENDW_128 /VPSLL_8u32 /VPSRL_8u32 /shuffle1 /= W2u128_W16u16 /int_bit /=.
rewrite /= !bits32_shl16_bits16H // !bits32_shr16_bits16L //=.
move: Ha; rewrite -{1}iotaredE /R2C /= => |> *.
move: Hb; rewrite -{1}iotaredE /R2C /= => |> *.
by rewrite -!iotaredE /= => |> /#.
qed.

phoare __shuffle1_ph na nb _a _b:
 [Jkem1024_avx2.M.__shuffle1:
   I16u16_sb na a _a /\ I16u16_sb nb b _b
   ==> I16u16_sb (max na nb) res.`1 (shuffle1 _a _b).`1
       /\ I16u16_sb (max na nb) res.`2 (shuffle1 _a _b).`2 ] = 1%r.
proof. by conseq __shuffle1_ll (__shuffle1_h na nb _a _b). qed.

(* Poly reduction *)
lemma __red16x_ll: islossless Jkem1024_avx2.M.__red16x by islossless.

lemma sbred16_spec x y:
  y = incoeff (W16.to_sint x) =>
  Iu16_ub 2 (sbred16 x) y.
proof.
move => ->. rewrite /Iu16_ub -sbred16_eq.
move: (Fq.SignedReductions.BREDCp_corr (to_sint x) 26 _ _ _ _ _ _).
+ by rewrite /Fq.SignedReductions.R /q /=.
+ by rewrite /Fq.SignedReductions.R /q /=.
+ by rewrite /Fq.SignedReductions.R /q /=.
+ by rewrite /Fq.SignedReductions.R /q /=.
+ by move: (W16.to_sint_cmp x); rewrite /Fq.SignedReductions.R /q /= /#.
+ move=> n.
  by rewrite /barrett_pred /barrett_pred_low /barrett_pred_high
       /barrett_fun /barrett_fun_aux /q /Fq.SignedReductions.R /= /#.
smt().
qed.

hoare __red16x_h n y:
Jkem1024_avx2.M.__red16x :
    x16_spec q qx16 /\
    x16_spec 20159 vx16 /\
    I16u16_sb n r y ==> I16u16_ub 2 res y.
proof.
proc; simplify.
wp; skip => |> &m.
rewrite !x16_spec_bits16 => Hq Hv.
rewrite -!iotaredE /VPSUB_16u16 /VPMULL_16u16 /VPMULH_16u16 /VPSRA_16u16 /R2C /= => |> *.
do split;(move : sbred16_spec);rewrite /sbred16 /(`|>>`) /=; smt(). 
qed.

phoare __red16x_ph n x:
 [Jkem1024_avx2.M.__red16x :
    x16_spec q qx16 /\
    x16_spec 20159 vx16 /\
    I16u16_sb n r x ==> I16u16_ub 2 res x ] = 1%r.
proof. by conseq __red16x_ll (__red16x_h n x). qed.

phoare __red16x_sb_ph n x:
 [Jkem1024_avx2.M.__red16x :
    x16_spec q qx16 /\
    x16_spec 20159 vx16 /\
    I16u16_sb n r x ==> I16u16_sb 2 res x ] = 1%r.
proof. 
proc*.
call (__red16x_ph n x).
by skip => /> *; apply I16u16_ub_sb.
qed.

equiv poly_ntt_avx2_eq:
Jkem1024_avx2.M._poly_ntt ~ NTT_AVX.ntt:
 rp{2}=lift_array256 rp{1} /\ signed_bound_cxq rp{1} 0 256 2 ==>
 res{2}=lift_array256 res{1} /\
 pos_bound256_cxq res{1} 0 256 2.
proof.
symmetry; simplify.
transitivity Tmp._ntt
 ( I256u16_sb 2 rp{2} rp{1} ==> I256u16_ub 2 res{2} res{1} )
 ( ={rp} ==> ={res} ); last by symmetry; conseq ntt_avx2_eq_.
  by move=> |> &2 H; exists arg{2}; rewrite I256u16_sbE. 
  by move => &1 &m &2 /= H HH; rewrite -I256u16_ubE  -HH H. 
proc.
seq 6 35: (x16_spec q qx16{2} /\ zetasp{2}=zetas_op  /\ i{2}=0 /\
  I16u16_sb 3 (P2R rp{2} 8) (P2C rp{1} 8) /\
  I16u16_sb 3 (P2R rp{2} 9) (P2C rp{1} 9) /\
  I16u16_sb 3 (P2R rp{2} 10) (P2C rp{1} 10) /\
  I16u16_sb 3 (P2R rp{2} 11) (P2C rp{1} 11) /\
  I16u16_sb 3 (P2R rp{2} 12) (P2C rp{1} 12) /\
  I16u16_sb 3 (P2R rp{2} 13) (P2C rp{1} 13) /\
  I16u16_sb 3 (P2R rp{2} 14) (P2C rp{1} 14) /\
  I16u16_sb 3 (P2R rp{2} 15) (P2C rp{1} 15) /\
  I16u16_sb 3 (P2R rp{2} 0) (P2C rp{1} 0) /\
  I16u16_sb 3 (P2R rp{2} 1) (P2C rp{1} 1) /\
  I16u16_sb 3 (P2R rp{2} 2) (P2C rp{1} 2) /\
  I16u16_sb 3 (P2R rp{2} 3) (P2C rp{1} 3) /\
  I16u16_sb 3 r0{2} (P2C rp{1} 4) /\
  I16u16_sb 3 r1{2} (P2C rp{1} 5) /\
  I16u16_sb 3 r2{2} (P2C rp{1} 6) /\
  I16u16_sb 3 r3{2} (P2C rp{1} 7)).
 wp; call (butterfly64x_eq 2).
 wp; call (butterfly64x_eq 2).
 wp; skip => &1 &2 Hpre qx16 z0R z1R /=.
 have ->: 3 * q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  by rewrite /z0R /z1R /zR !z2u32E //= /VPBROADCAST_8u32 /qinv16u16M -iotaredE /= !R2C_pack16 //=. 
 have ->: x16_spec q qx16.
  by rewrite x16_spec_C2R /q /=.
 pose z1L:= Array16.init _.
 have ->: I16u16M_ub 1 z1R z1L.
  by move: Iu16_ub_of_int; rewrite /z1L /z1R /zR /zetas_op !z2u32E //= /VPBROADCAST_8u32 /R2C -iotaredE /= -incoeffM_mod /q /= !Iu16_ub_of_int.
 move: Hpre; rewrite -{2}iotaredE /= => |> *.
 rewrite (P2RS rp{2}) /= !PUR_i //= !P2R_i //= => |> *.
 rewrite (P2RS rp{2}) /= !PUR_i //= => |> *.
 do 16!(rewrite P2R_i 1,2://).
 simplify.
 do 16!(rewrite P2C_i 1,2://).
 simplify. smt().
unroll {2} 1; rcondt {2} 1.
 by move=> &m; skip => /=.
seq 10 8: (#[/:11]pre /\
  I16u16_sb 4 r0{2} r0a{1} /\
  I16u16_sb 4 r1{2} r1a{1} /\
  I16u16_sb 4 r2{2} r2a{1} /\
  I16u16_sb 4 r3{2} r3a{1} /\
  I16u16_sb 4 r4{2} r4a{1} /\
  I16u16_sb 4 r5{2} r5a{1} /\
  I16u16_sb 4 r6{2} r6a{1} /\
  I16u16_sb 4 r7{2} r7a{1} ).
 wp; call (butterfly64x_eq 3); wp; skip => &1 &2 Hpre z0R z1R |>.
 move: Hpre => |> *.
 have ->:  4 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M z0R z1R.
  by rewrite /z0R /z1R /zetas_op !z2u32E 1..2:/# /VPBROADCAST_8u32 /qinv16u16M -iotaredE /= !R2C_pack16 //=.
 pose z1L:= Array16.init _.
 have ->: I16u16M_ub 1 z1R z1L.
  by move: Iu16_ub_of_int; rewrite /z1L /z1R /zR /zetas_op !z2u32E //= /VPBROADCAST_8u32 /R2C -iotaredE /= -incoeffM_mod /q /= !Iu16_ub_of_int.
 done.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 5 r0{2} r0c{1} /\
  I16u16_sb 5 r1{2} r1c{1} /\
  I16u16_sb 5 r2{2} r2c{1} /\
  I16u16_sb 5 r3{2} r3c{1} /\
  I16u16_sb 5 r4{2} r4c{1} /\
  I16u16_sb 5 r5{2} r5c{1} /\
  I16u16_sb 5 r6{2} r6c{1} /\
  I16u16_sb 5 r7{2} r7c{1} ).
 wp; call (butterfly64x_eq 4).
 ecall {2} (__shuffle8_ph 4 4 r3a{1} r7a{1}).
 ecall {2} (__shuffle8_ph 4 4 r2a{1} r6a{1}).
 ecall {2} (__shuffle8_ph 4 4 r1a{1} r5a{1}).
 ecall {2} (__shuffle8_ph 4 4 r0a{1} r4a{1}).
 wp; skip => &1 &2 |> /=; rewrite ler_maxr 1:// => *.
 have ->:  5 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 zetas_op 8) (z2u256 zetas_op 24).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE /=.
  by rewrite /= !C2RK !initiE 1..32:// /jzetas_exp /=.
 pose xx := List.all _ _.
 have: xx.
   by rewrite /xx -iotaredE /= /zetas_op !z2u256E 1..2:// !C2RK /jzetas_exp /= -!incoeffM_mod /q /= !Iu16_ub_of_int. 
 by rewrite /xx => {xx} -> |> *.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 6 r0{2} r0e{1} /\
  I16u16_sb 6 r1{2} r1e{1} /\
  I16u16_sb 6 r2{2} r2e{1} /\
  I16u16_sb 6 r3{2} r3e{1} /\
  I16u16_sb 6 r4{2} r4e{1} /\
  I16u16_sb 6 r5{2} r5e{1} /\
  I16u16_sb 6 r6{2} r6e{1} /\
  I16u16_sb 6 r7{2} r7e{1} ).
 wp; call (butterfly64x_eq 5).
 ecall {2} (__shuffle4_ph 5 5 r5c{1} r7c{1}).
 ecall {2} (__shuffle4_ph 5 5 r1c{1} r3c{1}).
 ecall {2} (__shuffle4_ph 5 5 r4c{1} r6c{1}).
 ecall {2} (__shuffle4_ph 5 5 r0c{1} r2c{1}).
 wp; skip => &1 &2 |> /=; rewrite ler_maxr 1:// => *.
 have ->:  6 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 jzetas_exp 40) (z2u256 jzetas_exp 56).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /jzetas_exp /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /jzetas_exp /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q /=.
 by rewrite /xx => {xx} -> |> *.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 7 r0{2} r0g{1} /\
  I16u16_sb 7 r1{2} r1g{1} /\
  I16u16_sb 7 r2{2} r2g{1} /\
  I16u16_sb 7 r3{2} r3g{1} /\
  I16u16_sb 7 r4{2} r4g{1} /\
  I16u16_sb 7 r5{2} r5g{1} /\
  I16u16_sb 7 r6{2} r6g{1} /\
  I16u16_sb 7 r7{2} r7g{1} ).
 wp; call (butterfly64x_eq 6).
 ecall {2} (__shuffle2_ph 6 6 r6e{1} r7e{1}).
 ecall {2} (__shuffle2_ph 6 6 r4e{1} r5e{1}).
 ecall {2} (__shuffle2_ph 6 6 r2e{1} r3e{1}).
 ecall {2} (__shuffle2_ph 6 6 r0e{1} r1e{1}).
 wp; skip => &1 &2 |>; rewrite ler_maxr 1:// => *.
 have ->:  7 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 jzetas_exp 72) (z2u256 jzetas_exp 88).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /jzetas_exp /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /jzetas_exp /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q /=.
 by rewrite /xx => {xx} -> |> *.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 8 r0{2} r0i{1} /\
  I16u16_sb 8 r1{2} r1i{1} /\
  I16u16_sb 8 r2{2} r2i{1} /\
  I16u16_sb 8 r3{2} r3i{1} /\
  I16u16_sb 8 r4{2} r4i{1} /\
  I16u16_sb 8 r5{2} r5i{1} /\
  I16u16_sb 8 r6{2} r6i{1} /\
  I16u16_sb 8 r7{2} r7i{1} ).
 wp; call (butterfly64x_eq 7).
 ecall {2} (__shuffle1_ph 7 7 r3g{1} r7g{1}).
 ecall {2} (__shuffle1_ph 7 7 r2g{1} r6g{1}).
 ecall {2} (__shuffle1_ph 7 7 r1g{1} r5g{1}).
 ecall {2} (__shuffle1_ph 7 7 r0g{1} r4g{1}).
 wp; skip => &1 &2 |>; rewrite ler_maxr 1:// => *.
 have ->:  8 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 jzetas_exp 104) (z2u256 jzetas_exp 120).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /jzetas_exp /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /jzetas_exp /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q.
 by rewrite /xx => {xx} -> |> *.
seq 11 23: (#[/:2]pre /\ i{2}=1 /\ 
  I16u16_ub 2 (P2R rp{2} 0) (P2C rp8{1} 0) /\
  I16u16_ub 2 (P2R rp{2} 1) (P2C rp8{1} 1) /\
  I16u16_ub 2 (P2R rp{2} 2) (P2C rp8{1} 2) /\
  I16u16_ub 2 (P2R rp{2} 3) (P2C rp8{1} 3) /\
  I16u16_ub 2 (P2R rp{2} 4) (P2C rp8{1} 4) /\
  I16u16_ub 2 (P2R rp{2} 5) (P2C rp8{1} 5) /\
  I16u16_ub 2 (P2R rp{2} 6) (P2C rp8{1} 6) /\
  I16u16_ub 2 (P2R rp{2} 7) (P2C rp8{1} 7) /\ #[/4:11]pre).
 wp; ecall {2} (__red16x_ph 9 r7j{1}).
 ecall {2} (__red16x_ph 9 r3j{1}).
 ecall {2} (__red16x_ph 9 r5j{1}).
 ecall {2} (__red16x_ph 9 r1j{1}).
 ecall {2} (__red16x_ph 9 r6j{1}).
 ecall {2} (__red16x_ph 9 r2j{1}).
 ecall {2} (__red16x_ph 9 r4j{1}).
 ecall {2} (__red16x_ph 9 r0j{1}).
 wp; call (butterfly64x_eq 8).
 wp; skip => &1 &2 |> *.
 have ->:  9 * q <= 32767 by rewrite /q /=.
 have ->: qinv16u16M (z2u256 jzetas_exp 136) (z2u256 jzetas_exp 152).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /jzetas_exp /=.
 have ->: qinv16u16M (z2u256 jzetas_exp 168) (z2u256 jzetas_exp 184).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /jzetas_exp /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /jzetas_exp /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q /=.
 rewrite /xx => {xx} ->; pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /jzetas_exp /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q /=.
 rewrite /xx => {xx} -> |> *.
 have ->: x16_spec 20159 (C2R vx16_op).
  by rewrite x16_spec_C2R /q /=.
 move => |> *.
 rewrite (P2RS rp{2}) /= !PUR_i //= !P2R_i //= => |> *.
 by rewrite (P2CS rp{1}) /= !PUC_i //= !P2C_i //= => |> *.
(* second iteration *)
unroll {2} 1; rcondt {2} 1.
 by move=> &m; skip.
seq 10 8: (#[/:11]pre /\
  I16u16_sb 4 r0{2} r0l{1} /\
  I16u16_sb 4 r1{2} r1l{1} /\
  I16u16_sb 4 r2{2} r2l{1} /\
  I16u16_sb 4 r3{2} r3l{1} /\
  I16u16_sb 4 r4{2} r4l{1} /\
  I16u16_sb 4 r5{2} r5l{1} /\
  I16u16_sb 4 r6{2} r6l{1} /\
  I16u16_sb 4 r7{2} r7l{1} ).
 rcondf {2} 3; first by auto.
 wp; call (butterfly64x_eq 3); wp; skip => &1 &2 |> *.
 have ->:  4 * q <= 32767 by rewrite /q.
 pose z0R := VPBROADCAST_8u32 _.
 pose z1R := VPBROADCAST_8u32 _.
 have ->: qinv16u16M z0R z1R.
  by rewrite /z0R /z1R /zR !z2u32E 1..2://= /VPBROADCAST_8u32 /qinv16u16M -iotaredE /R2C /zetas_op /=.
 pose z1L:= Array16.init _.
 have ->: I16u16M_ub 1 z1R z1L.
  by rewrite /z1L /z1R /zR !z2u32E 1..2://= /VPBROADCAST_8u32 /R2C -iotaredE /= -incoeffM_mod /q !Iu16_ub_of_int /#. 
 done.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 5 r0{2} r0n{1} /\
  I16u16_sb 5 r1{2} r1n{1} /\
  I16u16_sb 5 r2{2} r2n{1} /\
  I16u16_sb 5 r3{2} r3n{1} /\
  I16u16_sb 5 r4{2} r4n{1} /\
  I16u16_sb 5 r5{2} r5n{1} /\
  I16u16_sb 5 r6{2} r6n{1} /\
  I16u16_sb 5 r7{2} r7n{1} ).
 wp; call (butterfly64x_eq 4).
 ecall {2} (__shuffle8_ph 4 4 r3l{1} r7l{1}).
 ecall {2} (__shuffle8_ph 4 4 r2l{1} r6l{1}).
 ecall {2} (__shuffle8_ph 4 4 r1l{1} r5l{1}).
 ecall {2} (__shuffle8_ph 4 4 r0l{1} r4l{1}).
 wp; skip => &1 &2 |> /=; rewrite ler_maxr 1:// => *.
 have ->:  5 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 zetas_op 204) (z2u256 zetas_op 220).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /zetas_op /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /zetas /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q /=.
 by rewrite /xx => {xx} -> |> *.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 6 r0{2} r0p{1} /\
  I16u16_sb 6 r1{2} r1p{1} /\
  I16u16_sb 6 r2{2} r2p{1} /\
  I16u16_sb 6 r3{2} r3p{1} /\
  I16u16_sb 6 r4{2} r4p{1} /\
  I16u16_sb 6 r5{2} r5p{1} /\
  I16u16_sb 6 r6{2} r6p{1} /\
  I16u16_sb 6 r7{2} r7p{1} ).
 wp; call (butterfly64x_eq 5).
 ecall {2} (__shuffle4_ph 5 5 r5n{1} r7n{1}).
 ecall {2} (__shuffle4_ph 5 5 r1n{1} r3n{1}).
 ecall {2} (__shuffle4_ph 5 5 r4n{1} r6n{1}).
 ecall {2} (__shuffle4_ph 5 5 r0n{1} r2n{1}).
 wp; skip => &1 &2 |> /=; rewrite ler_maxr 1:// => *.
 have ->:  6 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 zetas_op 236) (z2u256 zetas_op 252).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /zetas_op /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /zetas_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q /=.
 by rewrite /xx => {xx} -> |> *.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 7 r0{2} r0r{1} /\
  I16u16_sb 7 r1{2} r1r{1} /\
  I16u16_sb 7 r2{2} r2r{1} /\
  I16u16_sb 7 r3{2} r3r{1} /\
  I16u16_sb 7 r4{2} r4r{1} /\
  I16u16_sb 7 r5{2} r5r{1} /\
  I16u16_sb 7 r6{2} r6r{1} /\
  I16u16_sb 7 r7{2} r7r{1} ).
 wp; call (butterfly64x_eq 6).
 ecall {2} (__shuffle2_ph 6 6 r6p{1} r7p{1}).
 ecall {2} (__shuffle2_ph 6 6 r4p{1} r5p{1}).
 ecall {2} (__shuffle2_ph 6 6 r2p{1} r3p{1}).
 ecall {2} (__shuffle2_ph 6 6 r0p{1} r1p{1}).
 wp; skip => &1 &2 |>; rewrite ler_maxr 1:// => *.
 have ->:  7 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 zetas_op 268) (z2u256 zetas_op 284).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /zetas_op /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /zetas_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q.
 by rewrite /xx => {xx} -> |> *.
seq 6 7: (#[/:11]pre /\
  I16u16_sb 8 r0{2} r0t{1} /\
  I16u16_sb 8 r1{2} r1t{1} /\
  I16u16_sb 8 r2{2} r2t{1} /\
  I16u16_sb 8 r3{2} r3t{1} /\
  I16u16_sb 8 r4{2} r4t{1} /\
  I16u16_sb 8 r5{2} r5t{1} /\
  I16u16_sb 8 r6{2} r6t{1} /\
  I16u16_sb 8 r7{2} r7t{1} ).
 wp; call (butterfly64x_eq 7).
 ecall {2} (__shuffle1_ph 7 7 r3r{1} r7r{1}).
 ecall {2} (__shuffle1_ph 7 7 r2r{1} r6r{1}).
 ecall {2} (__shuffle1_ph 7 7 r1r{1} r5r{1}).
 ecall {2} (__shuffle1_ph 7 7 r0r{1} r4r{1}).
 wp; skip => &1 &2 |>; rewrite ler_maxr 1:// => *.
 have ->:  8 * q <= 32767 by rewrite /q.
 have ->: qinv16u16M (z2u256 zetas_op 300) (z2u256 zetas_op 316).
  rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK !initiE 1..32:// /zetas_op /=.
 pose xx := List.all _ _.
 have: xx.
  by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /zetas_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q /=.
 by rewrite /xx => {xx} -> |> *.
rcondf {2} 24; first by (move=> *; inline*; wp; auto).
wp; ecall {2} (__red16x_ph 9 r7u{1}).
ecall {2} (__red16x_ph 9 r3u{1}).
ecall {2} (__red16x_ph 9 r5u{1}).
ecall {2} (__red16x_ph 9 r1u{1}).
ecall {2} (__red16x_ph 9 r6u{1}).
ecall {2} (__red16x_ph 9 r2u{1}).
ecall {2} (__red16x_ph 9 r4u{1}).
ecall {2} (__red16x_ph 9 r0u{1}).
wp; call (butterfly64x_eq 8).
wp; skip => &1 &2 |> *.
have ->:  9 * q <= 32767 by rewrite /q.
have ->: qinv16u16M (z2u256 zetas_op 332) (z2u256 zetas_op 348).
 rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
 by rewrite /= !C2RK !initiE 1..32:// /zetas_op /=.
have ->: qinv16u16M (z2u256 zetas_op 364) (z2u256 zetas_op 380).
 rewrite !z2u256E 1..2:// /qinv16u16M -iotaredE.
 by rewrite /= !C2RK !initiE 1..32:// /zetas_op /=.
pose xx := List.all _ _.
have: xx.
 by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /zetas_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q /=.
rewrite /xx => {xx} ->; pose xx := List.all _ _.
have: xx.
 by rewrite /xx -iotaredE /= !z2u256E 1..2:// !C2RK /zetas_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q /=.
rewrite /xx => {xx} -> |> *.
have Hvx16: x16_spec 20159 (C2R vx16_op).
 by rewrite x16_spec_C2R /q /=.
move => |> *.
by rewrite (P2RS rp{2}) (P2CS rp8{1}) /= !PUR_i //= !PUC_i //= -{2}iotaredE /= !P2R_i //= !P2C_i //=.
qed.
