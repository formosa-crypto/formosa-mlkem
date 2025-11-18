require import AllCore List Int IntDiv Ring StdOrder.

from Jasmin require import JModel.

from JazzEC require import Array256 Array16 WArray32.
from JazzEC require import WArray512.
from JazzEC require import Array400 WArray800.


require import NTT_AVX_Fq_basemul MLKEMFCLib.
require import NTT_AVX_j_ntt NTT_AVX_j.

from CryptoSpecs require import GFq Correctness768.

require import Fq.
import Zq.

require import MLKEM_Poly.
import MLKEM_Poly.


require AVX2_Ops.
require import Montgomery16.
from JazzEC require import Jkem768_avx2 Jkem768.

import IntOrder.

lemma wmulhsC x y: W16.wmulhs x y = W16.wmulhs y x by smt().

lemma invbutterfly_r (n1 n2:int) xl xr z rxl rxr rzM rzMqinv rq:
 (n1+n2)*q <= W16.max_sint =>
 rq = W16.of_int q =>
 Iu16_sb n1 rxl xl =>
 Iu16_sb n2 rxr xr =>
 Iu16M_ub 1 rzM z =>
 rzMqinv = rzM * (W16.of_int 62209) =>
 Iu16_sb 1
   (wmulhs rzM (rxl-rxr) - wmulhs rq (rzMqinv * (rxl-rxr)))
   (z*(xl-xr)).
proof.
move => /= Hbnd Hq [-> Hxl] [-> Hxr] [HzM HzBnd] ->.
rewrite wmulhsC; pose t := (wmulhs _ _ - _)%W16.
have ->: t = Montgomery16.REDCmul16 (rxl - rxr) rzM.
 rewrite /t /REDC16 /Montgomery16.q /Montgomery16.qinv Hq /q /=; congr.
 by rewrite wmulhsC; congr; congr; ring.
have := Montgomery16.REDCmul16_correct (rxl-rxr) rzM _.
 smt().
rewrite (_:Montgomery16.q=q) 1:/#; move => /= [H1 H2].
split.
 rewrite -(asintK z) -incoeffM -eq_incoeff H1.
 have Hone: Zq.one = incoeff Montgomery16.R * incoeff Montgomery16.Rinv. 
  by rewrite -incoeffM -eq_incoeff -Montgomery16.RRinv /#.
 have ->: z = incoeffW16 rzM * incoeff Montgomery16.Rinv. 
  by rewrite -(ZqField.mul1r z) ZqField.mulrC Hone ZqField.mulrA HzM.
 by rewrite -incoeffM !incoeffK modzMml to_sintB_small /#.
by rewrite /=; apply (sint_bndW _ _ _ _ _ _ _ H2); smt().
qed.

lemma invntt_butterfly16xE (n1 n2:int) xl xr z rxl rxr rzM rzMqinv rq16x:
 (n1+n2)*q <= W16.max_sint =>
 I16u16_sb n1 rxl xl =>
 I16u16_sb n2 rxr xr =>
 qinv16u16M rzMqinv rzM =>
 I16u16M_ub 1 rzM z =>
 x16_spec q rq16x =>
 I16u16_sb 1
  (VPSUB_16u16
    (VPMULH_16u16 
      rzM
      (VPSUB_16u16 rxl rxr))
    (VPMULH_16u16
      rq16x
      (VPMULL_16u16 
        rzMqinv
        (VPSUB_16u16 rxl rxr))))
  (Array16.init (fun i=>z.[i]*(xl.[i]-xr.[i]))).
proof.
rewrite -3!allP_range.
move=> Hbnd Hl Hr /qinv16u16M_bits16 Hqinv Hz /x16_spec_bits16 Hq.
rewrite /VPSUB_16u16 /VPADD_16u16 /VPMULH_16u16 /VPMULL_16u16 /= -iotaredE /R2C /=.
do 15! (split; first by apply (invbutterfly_r n1 n2); [assumption|by apply Hq|by apply Hl|
 by apply Hr| by apply Hz| by rewrite Hqinv]).
by apply (invbutterfly_r n1 n2); [assumption|by apply Hq|by apply Hl|
 by apply Hr| by apply Hz| by rewrite Hqinv].
qed.

lemma I16u16S_ub_mul1x16 z1 z2 n x y:
 I16u16S_ub z1 n y (mul1x16 z2 x) = I16u16S_ub (z1*z2) n y x.
proof.
rewrite -iotaredE /Iu16_ub /=.
do 15! (congr; first by (congr; congr; ring)).
by (congr; congr; ring).
qed.

lemma invntt_butterfly16xE_last (n1 n2:int) xl xr z rxl rxr rzM rzMqinv rq16x:
 (n1+n2)*q <= W16.max_sint =>
 I16u16_sb n1 rxl xl =>
 I16u16_sb n2 rxr xr =>
 qinv16u16M rzMqinv rzM =>
 I16u16S_ub (incoeff 1441) 1 rzM z =>
 x16_spec q rq16x =>
 I16u16S_sb (incoeff 3303 * incoeff 65536) 1
  (VPSUB_16u16
    (VPMULH_16u16 
      rzM
      (VPSUB_16u16 rxl rxr))
    (VPMULH_16u16
      rq16x
      (VPMULL_16u16 
        rzMqinv
        (VPSUB_16u16 rxl rxr))))
  (Array16.init (fun i=>z.[i]*(xl.[i]-xr.[i]))).
proof.
move => Hn Hxl Hxr Hzqinv.
have ->: incoeff 1441 = incoeff W16.modulus * incoeff 512.
 by rewrite -incoeffM_mod /q /=.
rewrite -I16u16S_ub_mul1x16 => Hz Hq.
move: (invntt_butterfly16xE _ _ _ _ (mul1x16 (incoeff 512) z) _ _ _ _ _ Hn Hxl Hxr Hzqinv Hz Hq).
move=> /List.allP H; apply/List.allP => x Hx /=.
move: (H x Hx); rewrite /Iu16_sb; move => [<- ->] /=.
have ->: incoeff 3303 * incoeff 65536 = incoeff 512 by rewrite -incoeffM_mod /q /=.
by move: Hx; rewrite mem_iota => ?; rewrite !initiE 1..2:/# /= !mapiE 1:/# /=; ring.
qed.

lemma invntt_butterfly16xE_l (n1 n2:int) rh rl h l:
 (n1+n2)*q <= W16.max_sint =>
 I16u16_sb n1 rl l => 
 I16u16_sb n2 rh h => 
 I16u16_sb (n1 + n2) (VPADD_16u16 rh rl)
  (Array16.init (fun i=> l.[i] + h.[i])).
proof.
rewrite addzC; move=> Hn; rewrite -2!allP_range.
rewrite /VPADD_16u16 /= /R2C /= => Hl Hr.
rewrite -iotaredE /=.
do 15! (split; first by rewrite (ZqField.addrC l.[_] h.[_]); apply Iu16_sbD; [assumption|apply Hr|apply Hl]).
by rewrite (ZqField.addrC l.[_] h.[_]); apply Iu16_sbD; [assumption|apply Hr|apply Hl].
qed.

equiv invntt_butterfly64x_eq c0 c1 c2 c3 c4 c5 c6 c7:
 NTT_AVX.__invntt___butterfly64x
 ~Jkem768_avx2.M.__invntt___butterfly64x :
 MAX (MAX (c0+c4) (c1+c5))%Int
     (MAX (c2+c6) (c3+c7))%Int * q
  <= W16.max_sint /\
 I16u16_sb c0 rl0{2} rl0t{1} /\
 I16u16_sb c1 rl1{2} rl1t{1} /\
 I16u16_sb c2 rl2{2} rl2t{1} /\
 I16u16_sb c3 rl3{2} rl3t{1} /\
 I16u16_sb c4 rh0{2} rh0t{1} /\
 I16u16_sb c5 rh1{2} rh1t{1} /\
 I16u16_sb c6 rh2{2} rh2t{1} /\
 I16u16_sb c7 rh3{2} rh3t{1} /\
 qinv16u16M zl0{2} zh0{2} /\
 qinv16u16M zl1{2} zh1{2} /\
 I16u16M_ub 1 zh0{2} z0{1} /\
 I16u16M_ub 1 zh1{2} z1{1} /\
 x16_spec q qx16{2}
 ==>
 I16u16_sb (c0+c4) res{2}.`1 res{1}.`1 /\
 I16u16_sb (c1+c5) res{2}.`2 res{1}.`2 /\
 I16u16_sb (c2+c6) res{2}.`3 res{1}.`3 /\
 I16u16_sb (c3+c7) res{2}.`4 res{1}.`4 /\
 I16u16_sb 1 res{2}.`5 res{1}.`5 /\
 I16u16_sb 1 res{2}.`6 res{1}.`6 /\
 I16u16_sb 1 res{2}.`7 res{1}.`7 /\
 I16u16_sb 1 res{2}.`8 res{1}.`8.
proof.
proc; sp 1 0; simplify.
wp; skip => |> &1 &2 Hbnd H0 H1 H2 H3 H4 H5 H6 H7 Hqinv0 Hqinv1 Hzl Hzh Hq.
do 4! (split; first by apply invntt_butterfly16xE_l; smt()).
split; first by apply (invntt_butterfly16xE c0 c4); smt().
split; first by apply (invntt_butterfly16xE c1 c5); smt().
split; first by apply (invntt_butterfly16xE c2 c6); smt().
by apply (invntt_butterfly16xE c3 c7); smt().
qed.

equiv invntt_butterfly64x_eq_last c0 c1 c2 c3 c4 c5 c6 c7:
 NTT_AVX.__invntt___butterfly64x
 ~Jkem768_avx2.M.__invntt___butterfly64x :
 MAX (MAX (c0+c4) (c1+c5))%Int
     (MAX (c2+c6) (c3+c7))%Int * q
  <= W16.max_sint /\
 I16u16_sb c0 rl0{2} rl0t{1} /\
 I16u16_sb c1 rl1{2} rl1t{1} /\
 I16u16_sb c2 rl2{2} rl2t{1} /\
 I16u16_sb c3 rl3{2} rl3t{1} /\
 I16u16_sb c4 rh0{2} rh0t{1} /\
 I16u16_sb c5 rh1{2} rh1t{1} /\
 I16u16_sb c6 rh2{2} rh2t{1} /\
 I16u16_sb c7 rh3{2} rh3t{1} /\
 qinv16u16M zl0{2} zh0{2} /\
 qinv16u16M zl1{2} zh1{2} /\
 I16u16S_ub (incoeff 1441) 1 zh0{2} z0{1} /\
 I16u16S_ub (incoeff 1441) 1 zh1{2} z1{1} /\
 x16_spec q qx16{2}
 ==>
 I16u16_sb (c0+c4) res{2}.`1 res{1}.`1 /\
 I16u16_sb (c1+c5) res{2}.`2 res{1}.`2 /\
 I16u16_sb (c2+c6) res{2}.`3 res{1}.`3 /\
 I16u16_sb (c3+c7) res{2}.`4 res{1}.`4 /\
 I16u16S_sb (incoeff 3303 * incoeff 65536) 1 res{2}.`5 res{1}.`5 /\
 I16u16S_sb (incoeff 3303 * incoeff 65536) 1 res{2}.`6 res{1}.`6 /\
 I16u16S_sb (incoeff 3303 * incoeff 65536) 1 res{2}.`7 res{1}.`7 /\
 I16u16S_sb (incoeff 3303 * incoeff 65536) 1 res{2}.`8 res{1}.`8.
proof.
proc; sp 1 0; simplify.
wp; skip => |> &1 &2 Hbnd H0 H1 H2 H3 H4 H5 H6 H7 Hqinv0 Hqinv1 Hzl Hzh Hq.
do 4! (split; first by apply invntt_butterfly16xE_l; smt()).
split; first by apply (invntt_butterfly16xE_last c0 c4); smt().
split; first by apply (invntt_butterfly16xE_last c1 c5); smt().
split; first by apply (invntt_butterfly16xE_last c2 c6); smt().
by apply (invntt_butterfly16xE_last c3 c7); smt().
qed.


phoare fq_mulprecomp16x_aux _n _r:
 [Jkem768_avx2.M.__fqmulprecomp16x :
   x16_spec q qx16 /\
   x16_spec 1441 ah /\
   x16_spec (-10079) al /\
   I16u16_sb _n b _r
   ==> I16u16S_sb (incoeff 3303*incoeff W16.modulus) 1 res _r ] = 1%r.
proof.
conseq (fqmulprecomp16x_ph _n (Array16.create (incoeff 512)) _r) => /> &m.
 rewrite /x16_spec /qinv16u16M /R2C !allP => Hq Ha Hqinv Hb; split => k Hk /=.
  move: (Hq _ Hk) (Ha _ Hk) (Hqinv _ Hk) (Hb _ Hk) => {Hq Ha Hqinv Hb} /=.
  rewrite !initiE; first 4 smt(mem_iota).
  move=> Hq -> -> Hb; smt().
 move: (Hq _ Hk) (Ha _ Hk) (Hqinv _ Hk) (Hb _ Hk) => {Hq Ha Hqinv Hb} /=.
 rewrite createE !initiE; first 5 smt(mem_iota).
 move=> /= _ -> _ _.
 rewrite -incoeffM incoeff_mod /q /=.
 by apply Iu16_ub_of_int.
move=> |> *; split.
 rewrite !List.allP /R2C /= => H k Hk.
 move: Hk (H _ Hk); rewrite mem_iota /= => {H} |> ??.
 rewrite createE !initiE 1:/# /=.
 rewrite -incoeffM incoeff_mod /q map2iE 1:/# /=.
 by rewrite initiE 1:/# /= /#.
rewrite !List.allP /R2C /= => H k Hk.
move: Hk (H _ Hk); rewrite mem_iota /= => {H} |> ??.
rewrite createE !initiE 1:/# /=.
rewrite -incoeffM incoeff_mod /q map2iE 1:/# /=.
by rewrite initiE 1:/# /= /#.
qed.

equiv poly_invntt_avx2_eq:
Jkem768_avx2.M._poly_invntt ~ NTT_AVX.invntt:
 rp{2}=lift_array256 rp{1} /\ signed_bound_cxq rp{1} 0 256 4 ==>
 mul1x256 (incoeff W16.modulus) res{2}=lift_array256 res{1} /\
 signed_bound_cxq res{1} 0 256 1.
proof.
symmetry; transitivity Tmp._invntt
 ( I256u16_sb 4 rp{2} rp{1} ==> I256u16S_sb (incoeff W16.modulus) 1 res{2} res{1} )
 ( ={rp} ==> ={res} ); last by symmetry; conseq invntt_avx2_eq_.
  by move=> |> &2 H; exists arg{2}; rewrite I256u16_sbE. 
 move => &1 &m &2 /= H <-; rewrite -I256u16_sbE .
 move: H; rewrite -{2 4}iotaredE => |> *.
 by rewrite !P2C_map // !I16u16_sb_map /#.
proc.
unroll{2} 4; rcondt{2} 4; first by auto.
seq 11 16: (x16_spec q qx16{2} /\ zetasp{2}=zetas_inv_op  /\ i{2}=0 /\
  I16u16_sb 4 (P2R rp{2} 8) (P2C rp{1} 8) /\
  I16u16_sb 4 (P2R rp{2} 9) (P2C rp{1} 9) /\
  I16u16_sb 4 (P2R rp{2} 10) (P2C rp{1} 10) /\
  I16u16_sb 4 (P2R rp{2} 11) (P2C rp{1} 11) /\
  I16u16_sb 4 (P2R rp{2} 12) (P2C rp{1} 12) /\
  I16u16_sb 4 (P2R rp{2} 13) (P2C rp{1} 13) /\
  I16u16_sb 4 (P2R rp{2} 14) (P2C rp{1} 14) /\
  I16u16_sb 4 (P2R rp{2} 15) (P2C rp{1} 15) /\
  I16u16_sb 8 r0{2} r0a{1} /\
  I16u16_sb 8 r1{2} r1a{1} /\
  I16u16_sb 1 r2{2} r2a{1} /\
  I16u16_sb 1 r3{2} r3a{1} /\
  I16u16_sb 8 r4{2} r4a{1} /\
  I16u16_sb 8 r5{2} r5a{1} /\
  I16u16_sb 1 r6{2} r6a{1} /\
  I16u16_sb 1 r7{2} r7a{1}).
 call (invntt_butterfly64x_eq 4 4 4 4 4 4 4 4).
 wp; skip => &1 &2.
 rewrite -{2}iotaredE /= => [#] |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z2R := z2u256 _ _.
 pose z3R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 pose z3L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 have ->: qinv16u16M z2R z3R.
  rewrite /z2R /z3R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q.
 clear xx; pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z3R /z3L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q.
 have ->: x16_spec q (C2R qx16_op).
  by rewrite x16_spec_C2R /q /=.
 by clear xx z0R z1R z2R z3R z1L z3L => |>.
seq 2 8: (#[/:11]pre /\ x16_spec 20159 vx16{2} /\
  I16u16_sb 4 r0{2} r0b{1} /\
  I16u16_sb 4 r1{2} r1b{1} /\
  I16u16_sb 2 r2{2} r2b{1} /\
  I16u16_sb 2 r3{2} r3b{1} /\
  I16u16_sb 1 r4{2} r4b{1} /\
  I16u16_sb 1 r5{2} r5b{1} /\
  I16u16_sb 1 r6{2} r6b{1} /\
  I16u16_sb 1 r7{2} r7b{1} ).
 call (invntt_butterfly64x_eq 2 2 1 1 2 2 1 1).
 ecall {2} (__red16x_sb_ph 8 r5a{1}).
 ecall {2} (__red16x_sb_ph 8 r4a{1}).
 ecall {2} (__red16x_sb_ph 8 r1a{1}).
 ecall {2} (__red16x_sb_ph 8 r0a{1}).
 wp; skip => |> &1 &2 *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 4*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q.
 move => |> *.
 have ->: x16_spec 20159 (C2R vx16_op).
  by rewrite x16_spec_C2R /q /=.
 done.
seq 6 7: (#[/:12]pre /\
  I16u16_sb 8 r0{2} r0d{1} /\
  I16u16_sb 1 r1{2} r1d{1} /\
  I16u16_sb 4 r2{2} r2d{1} /\
  I16u16_sb 1 r3{2} r3d{1} /\
  I16u16_sb 2 r4{2} r4d{1} /\
  I16u16_sb 1 r5{2} r5d{1} /\
  I16u16_sb 2 r6{2} r6d{1} /\
  I16u16_sb 1 r7{2} r7d{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle1_ph 1 1 r6b{1} r7b{1}).
 ecall {2} (__shuffle1_ph 1 1 r4b{1} r5b{1}).
 ecall {2} (__shuffle1_ph 2 2 r2b{1} r3b{1}).
 ecall {2} (__shuffle1_ph 4 4 r0b{1} r1b{1}).
 have Emax: forall x, max x x = x by done. 
 wp; skip => |> &1 &2; rewrite !Emax => |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q.
 by move => |> *.
seq 6 8: (#[/:12]pre /\
  I16u16_sb 8 r0{2} r0f{1} /\
  I16u16_sb 2 r1{2} r1f{1} /\
  I16u16_sb 1 r2{2} r2f{1} /\
  I16u16_sb 1 r3{2} r3f{1} /\
  I16u16_sb 4 r4{2} r4f{1} /\
  I16u16_sb 2 r5{2} r5f{1} /\
  I16u16_sb 1 r6{2} r6f{1} /\
  I16u16_sb 1 r7{2} r7f{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle2_ph 1 1 r5d{1} r7d{1}).
 ecall {2} (__shuffle2_ph 1 1 r1d{1} r3d{1}).
 ecall {2} (__shuffle2_ph 2 2 r4d{1} r6d{1}).
 ecall {2} (__shuffle2_ph 2 4 r0d{1} r2d{1}).
 ecall {2} (__red16x_sb_ph 8 r0d{1}).
 have Emax: forall x, max x x = x by done. 
 wp; skip => |> &1 &2; rewrite !Emax => |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z0R /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q.
 by move => |> *.
seq 6 8: (#[/:12]pre /\
  I16u16_sb 8 r0{2} r0h{1} /\
  I16u16_sb 4 r1{2} r1h{1} /\
  I16u16_sb 2 r2{2} r2h{1} /\
  I16u16_sb 2 r3{2} r3h{1} /\
  I16u16_sb 1 r4{2} r4h{1} /\
  I16u16_sb 1 r5{2} r5h{1} /\
  I16u16_sb 1 r6{2} r6h{1} /\
  I16u16_sb 1 r7{2} r7h{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle4_ph 1 1 r3f{1} r7f{1}).
 ecall {2} (__shuffle4_ph 1 1 r2f{1} r6f{1}).
 ecall {2} (__shuffle4_ph 2 2 r1f{1} r5f{1}).
 ecall {2} (__shuffle4_ph 2 4 r0f{1} r4f{1}).
 ecall {2} (__red16x_sb_ph 8 r0f{1}).
 wp; skip => |> &1 &2; rewrite !lez_maxr 1..3:/# => |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z0R /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q.
 by move => |> *.
seq 6 8: (#[/:12]pre /\
  I16u16_sb 8 r0{2} r0j{1} /\
  I16u16_sb 1 r1{2} r1j{1} /\
  I16u16_sb 4 r2{2} r2j{1} /\
  I16u16_sb 1 r3{2} r3j{1} /\
  I16u16_sb 2 r4{2} r4j{1} /\
  I16u16_sb 1 r5{2} r5j{1} /\
  I16u16_sb 2 r6{2} r6j{1} /\
  I16u16_sb 1 r7{2} r7j{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle8_ph 1 1 r6h{1} r7h{1}).
 ecall {2} (__shuffle8_ph 1 1 r4h{1} r5h{1}).
 ecall {2} (__shuffle8_ph 2 2 r2h{1} r3h{1}).
 ecall {2} (__shuffle8_ph 2 4 r0h{1} r1h{1}).
 ecall {2} (__red16x_sb_ph 8 r0h{1}).
 wp; skip => |> &1 &2; rewrite !lez_maxr 1..3:/# => |> *.
 pose z0R := VPBROADCAST_8u32 _.
 pose z1R := VPBROADCAST_8u32 _.
 pose z1L := Array16.init _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  by rewrite /z0R /z1R /zetas_inv_op !z2u32E //= /VPBROADCAST_8u32 /qinv16u16M -iotaredE /R2C /=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1L /z1R !z2u32E //= /VPBROADCAST_8u32 /R2C -iotaredE /= -incoeffM_mod /q /= /zetas_inv_op !initiE //= !Iu16_ub_of_int /q /=.
 by move => |> *.
rcondt{2} 2; first by move=> *; inline*; auto.
unroll{2} 11; rcondt{2} 11; first by move=> *; inline*; auto.
seq 19 23: (#[/:2]pre /\ i{2}=1 /\ 
   I16u16_sb 2 (P2R rp{2} 0) (P2C rp8{1} 0) /\
   I16u16_sb 4 (P2R rp{2} 1) (P2C rp8{1} 1) /\
   I16u16_sb 2 (P2R rp{2} 2) (P2C rp8{1} 2) /\
   I16u16_sb 2 (P2R rp{2} 3) (P2C rp8{1} 3) /\
   I16u16_sb 1 (P2R rp{2} 4) (P2C rp8{1} 4) /\
   I16u16_sb 1 (P2R rp{2} 5) (P2C rp8{1} 5) /\
   I16u16_sb 1 (P2R rp{2} 6) (P2C rp8{1} 6) /\
   I16u16_sb 1 (P2R rp{2} 7) (P2C rp8{1} 7) /\
   I16u16_sb 8 r0{2} r0l{1} /\
   I16u16_sb 8 r1{2} r1l{1} /\
   I16u16_sb 1 r2{2} r2l{1} /\
   I16u16_sb 1 r3{2} r3l{1} /\
   I16u16_sb 8 r4{2} r4l{1} /\
   I16u16_sb 8 r5{2} r5l{1} /\
   I16u16_sb 1 r6{2} r6l{1} /\
   I16u16_sb 1 r7{2} r7l{1} ).
 call (invntt_butterfly64x_eq 4 4 4 4 4 4 4 4).
 wp; ecall {2} (__red16x_sb_ph 8 r0j{1}).
 wp; skip => &1 &2 |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z2R := z2u256 _ _.
 pose z3R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 pose z3L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 have ->: qinv16u16M z2R z3R.
  rewrite /z2R /z3R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 rewrite (P2RS rp{2}) !PUR_i //= !P2R_i //= (P2CS rp{1}) !PUC_i //= !P2C_i //= => |>. 
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q.
 clear xx; pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z3R /z3L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q.
 by move => |> *.
seq 2 8: (#[/:11]pre /\ x16_spec 20159 vx16{2} /\
   I16u16_sb 4 r0{2} r0m{1} /\
   I16u16_sb 4 r1{2} r1m{1} /\
   I16u16_sb 2 r2{2} r2m{1} /\
   I16u16_sb 2 r3{2} r3m{1} /\
   I16u16_sb 1 r4{2} r4m{1} /\
   I16u16_sb 1 r5{2} r5m{1} /\
   I16u16_sb 1 r6{2} r6m{1} /\
   I16u16_sb 1 r7{2} r7m{1} ).
 call (invntt_butterfly64x_eq 2 2 1 1 2 2 1 1).
 ecall {2} (__red16x_sb_ph 8 r5l{1}).
 ecall {2} (__red16x_sb_ph 8 r4l{1}).
 ecall {2} (__red16x_sb_ph 8 r1l{1}).
 ecall {2} (__red16x_sb_ph 8 r0l{1}).
 wp; skip => |> &1 &2 *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 4*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q.
 move => |> *.
 have ->: x16_spec 20159 (C2R vx16_op).
  by rewrite x16_spec_C2R /q /=.
 done.
seq 6 7: (#[/:12]pre /\
   I16u16_sb 8 r0{2} r0o{1} /\
   I16u16_sb 1 r1{2} r1o{1} /\
   I16u16_sb 4 r2{2} r2o{1} /\
   I16u16_sb 1 r3{2} r3o{1} /\
   I16u16_sb 2 r4{2} r4o{1} /\
   I16u16_sb 1 r5{2} r5o{1} /\
   I16u16_sb 2 r6{2} r6o{1} /\
   I16u16_sb 1 r7{2} r7o{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle1_ph 1 1 r6m{1} r7m{1}).
 ecall {2} (__shuffle1_ph 1 1 r4m{1} r5m{1}).
 ecall {2} (__shuffle1_ph 2 2 r2m{1} r3m{1}).
 ecall {2} (__shuffle1_ph 4 4 r0m{1} r1m{1}).
 have Emax: forall x, max x x = x by done. 
 wp; skip => |> &1 &2; rewrite !Emax => |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q.
 by move => |> *.
seq 6 8: (#[/:12]pre /\
   I16u16_sb 8 r0{2} r0q{1} /\
   I16u16_sb 2 r1{2} r1q{1} /\
   I16u16_sb 1 r2{2} r2q{1} /\
   I16u16_sb 1 r3{2} r3q{1} /\
   I16u16_sb 4 r4{2} r4q{1} /\
   I16u16_sb 2 r5{2} r5q{1} /\
   I16u16_sb 1 r6{2} r6q{1} /\
   I16u16_sb 1 r7{2} r7q{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle2_ph 1 1 r5o{1} r7o{1}).
 ecall {2} (__shuffle2_ph 1 1 r1o{1} r3o{1}).
 ecall {2} (__shuffle2_ph 2 2 r4o{1} r6o{1}).
 ecall {2} (__shuffle2_ph 2 4 r0o{1} r2o{1}).
 ecall {2} (__red16x_sb_ph 8 r0o{1}).
 have Emax: forall x, max x x = x by done.
 wp; skip => |> &1 &2; rewrite !Emax => |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q.
 by move => |> *.
seq 6 8: (#[/:12]pre /\
  I16u16_sb 8 r0{2} r0s{1} /\
  I16u16_sb 4 r1{2} r1s{1} /\
  I16u16_sb 2 r2{2} r2s{1} /\
  I16u16_sb 2 r3{2} r3s{1} /\
  I16u16_sb 1 r4{2} r4s{1} /\
  I16u16_sb 1 r5{2} r5s{1} /\
  I16u16_sb 1 r6{2} r6s{1} /\
  I16u16_sb 1 r7{2} r7s{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle4_ph 1 1 r3q{1} r7q{1}).
 ecall {2} (__shuffle4_ph 1 1 r2q{1} r6q{1}).
 ecall {2} (__shuffle4_ph 2 2 r1q{1} r5q{1}).
 ecall {2} (__shuffle4_ph 2 4 r0q{1} r4q{1}).
 ecall {2} (__red16x_sb_ph 8 r0q{1}).
 wp; skip => |> &1 &2; rewrite !lez_maxr 1..3:/# => |> *.
 pose z0R := z2u256 _ _.
 pose z1R := z2u256 _ _.
 pose z1L := Array16.of_list _ _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  rewrite /z0R /z1R !z2u256E 1..2:// /qinv16u16M -iotaredE.
  by rewrite /= !C2RK /zetas_inv_op !initiE //=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z0R /z1R /z1L -iotaredE /= !z2u256E // !C2RK /zetas_inv_op /= -!incoeffM_mod /q /= !Iu16_ub_of_int /q.
 by move => |> *.
seq 6 8: (#[/:12]pre /\
  I16u16_sb 8 r0{2} r0u{1} /\
  I16u16_sb 1 r1{2} r1u{1} /\
  I16u16_sb 4 r2{2} r2u{1} /\
  I16u16_sb 1 r3{2} r3u{1} /\
  I16u16_sb 2 r4{2} r4u{1} /\
  I16u16_sb 1 r5{2} r5u{1} /\
  I16u16_sb 2 r6{2} r6u{1} /\
  I16u16_sb 1 r7{2} r7u{1} ).
 call (invntt_butterfly64x_eq 4 2 1 1 4 2 1 1).
 wp; ecall {2} (__shuffle8_ph 1 1 r6s{1} r7s{1}).
 ecall {2} (__shuffle8_ph 1 1 r4s{1} r5s{1}).
 ecall {2} (__shuffle8_ph 2 2 r2s{1} r3s{1}).
 ecall {2} (__shuffle8_ph 2 4 r0s{1} r1s{1}).
 ecall {2} (__red16x_sb_ph 8 r0s{1}).
 wp; skip => |> &1 &2; rewrite !lez_maxr 1..3:/# => |> *.
 pose z0R := VPBROADCAST_8u32 _.
 pose z1R := VPBROADCAST_8u32 _.
 pose z1L := Array16.init _.
 have ->: 8*q <= 32767 by smt().
 have ->: qinv16u16M z0R z1R.
  by rewrite /z0R /z1R /zetas_inv_op !z2u32E //= /VPBROADCAST_8u32 /qinv16u16M -iotaredE /R2C /=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1L /z1R !z2u32E //= /VPBROADCAST_8u32 /R2C -iotaredE /= -incoeffM_mod /q /= /zetas_inv_op !initiE //= !Iu16_ub_of_int /q /=.
 by move => |> *.
rcondf{2} 2; first by move=> *; inline*; auto.
rcondf{2} 7; first by move=> *; inline*; auto.
unroll{2} 10; rcondt{2} 10; first by move => *; inline*; auto.
rcondt{2} 10; first by move => *; inline*; auto.
seq 13 33: (#[/:2]pre /\ x16_spec (-10079) flox16{2} /\
            x16_spec 1441 fhix16{2} /\ i{2}=1 /\ 
   I16u16S_sb (incoeff 3303*incoeff W16.modulus) 1 (P2R rp{2} 0) r0a{1} /\
   I16u16S_sb (incoeff 3303*incoeff W16.modulus) 1 (P2R rp{2} 1) r1a{1} /\
   I16u16S_sb (incoeff 3303*incoeff W16.modulus) 1 (P2R rp{2} 2) r2a{1} /\
   I16u16S_sb (incoeff 3303*incoeff W16.modulus) 1 (P2R rp{2} 3) r3a{1} /\
   I16u16_sb 1 (P2R rp{2} 4) r0b{1} /\
   I16u16_sb 1 (P2R rp{2} 5) r1b{1} /\
   I16u16_sb 1 (P2R rp{2} 6) r2b{1} /\
   I16u16_sb 1 (P2R rp{2} 7) r3b{1} /\
   I16u16S_sb (incoeff 3303*incoeff W16.modulus) 1 (P2R rp{2} 8) r4a{1} /\
   I16u16S_sb (incoeff 3303*incoeff W16.modulus) 1 (P2R rp{2} 9) r5a{1} /\
   I16u16S_sb (incoeff 3303*incoeff W16.modulus) 1 (P2R rp{2} 10) r6a{1} /\
   I16u16S_sb (incoeff 3303*incoeff W16.modulus) 1 (P2R rp{2} 11) r7a{1} /\
   I16u16_sb 1 (P2R rp{2} 12) r4b{1} /\
   I16u16_sb 1 (P2R rp{2} 13) r5b{1} /\
   I16u16_sb 1 (P2R rp{2} 14) r6b{1} /\
   I16u16_sb 1 (P2R rp{2} 15) r7b{1} /\
   zeta0{2} = VPBROADCAST_8u32 (z2u32 zetas_inv_op 392) /\
   zeta1{2} = VPBROADCAST_8u32 (z2u32 zetas_inv_op 394) /\
   fhix16{2} = C2R fhix16_op /\
   flox16{2} = C2R flox16_op /\
   zeta0{1} = Array16.init (fun (_ : int) => incoeff 1600) ).
 wp.
 ecall {2} (fq_mulprecomp16x_aux 4 r3a{1}).
 ecall {2} (fq_mulprecomp16x_aux 4 r2a{1}).
 ecall {2} (fq_mulprecomp16x_aux 8 r1a{1}).
 ecall {2} (fq_mulprecomp16x_aux 4 r0a{1}).
 wp; call (invntt_butterfly64x_eq_last 2 4 2 2 2 4 2 2).
 wp; ecall {2} (__red16x_sb_ph 8 r0u{1}).
 skip => |> &1 &2 *.
 pose z0R := VPBROADCAST_8u32 _.
 pose z1R := VPBROADCAST_8u32 _.
 pose z1L := Array16.init _.
 rewrite (P2RS rp{2}) !PUR_i //= !P2R_i //= (P2CS rp8{1}) !PUC_i //= !P2C_i //= => |>.
 have ->: 8*q <= 32767 by rewrite /q /=.
 have ->: qinv16u16M z0R z1R.
  by rewrite /z0R /z1R /zetas_inv_op !z2u32E //= /VPBROADCAST_8u32 /qinv16u16M -iotaredE /R2C /=.
 pose xx := List.all _ _.
 have ->: xx.
  by rewrite /xx /z1L /z1R !z2u32E //= /VPBROADCAST_8u32 /R2C -iotaredE /= -!incoeffM_mod /q /= /zetas_inv_op !initiE //= !Iu16_ub_of_int /q /=.
 move => |> *.
 have ->: x16_spec 1441 (C2R fhix16_op).
  by rewrite x16_spec_C2R /=.
 have ->: x16_spec (-10079) (C2R flox16_op).
  by rewrite x16_spec_C2R /=.
 move => |> *.
 by rewrite !PUR_i //= !P2R_i //=.
unroll{2} 1; rcondt{2} 1; first by auto.
rcondf{2} 1; first by auto.
rcondf{2} 25; first by move=> *; inline*; auto.
wp.
ecall {2} (fq_mulprecomp16x_aux 2 r3c{1}).
ecall {2} (fq_mulprecomp16x_aux 2 r2c{1}).
ecall {2} (fq_mulprecomp16x_aux 2 r1c{1}).
ecall {2} (fq_mulprecomp16x_aux 2 r0c{1}).
wp; call (invntt_butterfly64x_eq_last 1 1 1 1 1 1 1 1).
wp; skip => |> &1 &2 *.
pose z0R := VPBROADCAST_8u32 _.
pose z1R := VPBROADCAST_8u32 _.
pose z1L := Array16.init _.
have ->: 2*q <= 32767 by smt().
have ->: qinv16u16M z0R z1R.
 by rewrite /z0R /z1R /zetas_inv_op !z2u32E //= /VPBROADCAST_8u32 /qinv16u16M -iotaredE /R2C /=.
pose xx := List.all _ _.
have ->: xx.
 by rewrite /xx /z1L /z1R !z2u32E //= /VPBROADCAST_8u32 /R2C -iotaredE /= -!incoeffM_mod /q /= /zetas_inv_op !initiE //= !Iu16_ub_of_int /q /=.
move => |> *.
rewrite (P2RS rp{2}) !PUR_i //=.
rewrite -{2}iotaredE /= !P2R_i //=.
by rewrite !P2C_map //= !I16u16S_sb_map !P2C_i //=.
qed.

