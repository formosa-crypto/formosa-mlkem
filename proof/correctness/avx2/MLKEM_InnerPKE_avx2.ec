require import AllCore IntDiv List.
from Jasmin require import JModel.
require import Array16 Array25 Array32 Array33 Array128 Array136 Array256 Array768 Array960 Array1088 Array2304.
require import List_extra.
require import MLKEM_Poly  MLKEM_PolyVec MLKEM_InnerPKE.
require import MLKEM_Poly_avx2_proof.
require import MLKEM_Poly_avx2_vec.
require import MLKEM_Poly_avx2_prevec.
require import MLKEM_PolyVec_avx2_proof.
require import MLKEM_PolyVec_avx2_vec.
require import MLKEMFCLib.
require import Jkem_avx2 Jkem.
require import NTT_avx2 NTT_AVX_j.
require import NTT_Fq NTT_AVX_Fq.
require import MLKEM_avx2_equivs.
require import Montgomery16.
require import AVX2_Ops.

require import MLKEM_genmatrix_avx2.

import GFq Rq Sampling Serialization Symmetric VecMat InnerPKE MLKEM Fq Correctness.

import MLKEM_Poly.
import MLKEM_PolyVec.
import MLKEM_PolyvecAVX.
import MLKEM_PolyAVXVec.
import NTT_Avx2.
import WArray136 WArray32 WArray128.
import WArray512 WArray256.

(* shake assumptions *)

(*
op SHAKE256_ABSORB4x_33 : W8.t Array33.t -> W8.t Array33.t -> W8.t Array33.t -> W8.t Array33.t -> W256.t Array25.t.
op SHAKE256_SQUEEZENBLOCKS4x : W256.t Array25.t -> W256.t Array25.t * W8.t Array136.t * W8.t Array136.t * W8.t Array136.t * W8.t Array136.t.

axiom shake_absorb4x state seed1 seed2 seed3 seed4 : 
   phoare [ Jkem_avx2.M(Jkem_avx2.Syscall)._shake256_absorb4x_33 : 
               arg = (state,seed1,seed2,seed3,seed4) ==>
               res = SHAKE256_ABSORB4x_33 seed1 seed2 seed3 seed4 ] = 1%r.

axiom shake_squeezenblocks4x state buf1 buf2 buf3 buf4 : 
   phoare [ Jkem_avx2.M(Jkem_avx2.Syscall).__shake256_squeezenblocks4x : `
               arg = (state,buf1,buf2,buf3,buf4) ==>
               res = SHAKE256_SQUEEZENBLOCKS4x state ] = 1%r.

axiom shake4x_equiv (sn1 sn2 sn3 sn4: W8.t Array33.t) (s1 s2 s3 s4 : W8.t Array32.t) n1 n2 n3 n4 :
  s1 = Array32.init (fun i => sn1.[i]) =>
  s2 = Array32.init (fun i => sn2.[i]) =>
  s3 = Array32.init (fun i => sn3.[i]) =>
  s4 = Array32.init (fun i => sn4.[i]) =>
  n1 = sn1.[32] => n2 = sn2.[32] => n3 = sn3.[32] => n4 = sn4.[32] =>
  Array128.init ("_.[_]" (SHAKE256_SQUEEZENBLOCKS4x (SHAKE256_ABSORB4x_33 sn1 sn2 sn3 sn4)).`2) = SHAKE256_33_128 s1 n1 /\
  Array128.init ("_.[_]" (SHAKE256_SQUEEZENBLOCKS4x (SHAKE256_ABSORB4x_33 sn1 sn2 sn3 sn4)).`3) = SHAKE256_33_128 s2 n2 /\
  Array128.init ("_.[_]" (SHAKE256_SQUEEZENBLOCKS4x (SHAKE256_ABSORB4x_33 sn1 sn2 sn3 sn4)).`4) = SHAKE256_33_128 s3 n3 /\
  Array128.init ("_.[_]" (SHAKE256_SQUEEZENBLOCKS4x (SHAKE256_ABSORB4x_33 sn1 sn2 sn3 sn4)).`5) = SHAKE256_33_128 s4 n4.

axiom sha3equiv : 
 equiv [ (* is this in the sha3 paper? *)
Jkem_avx2.M(Jkem_avx2.Syscall)._sha3_512_32 ~Jkem.M(Jkem.Syscall)._sha3512_32 : ={arg} ==> ={res}].

lemma keccakf1600_set_row_ll : islossless M(Syscall).keccakf1600_set_row.
proc. by unroll for ^while; auto. qed.

lemma keccakf1600_rho_offsets_ll : islossless M(Syscall).keccakf1600_rho_offsets.
proc. by unroll for ^while; islossless. qed.

lemma keccakf1600_rhotates_ll : islossless M(Syscall).keccakf1600_rhotates.
proc. by call keccakf1600_rho_offsets_ll; islossless. qed.

lemma keccakf1600_theta_rol_ll : islossless M(Syscall).keccakf1600_theta_rol.
proc. by unroll for ^while; islossless. qed.

lemma keccakf1600_theta_sum_ll : islossless M(Syscall).keccakf1600_theta_sum.
proc. by do 6!(unroll for ^while); islossless. qed.

lemma keccakf1600_rol_sum_ll : islossless M(Syscall).keccakf1600_rol_sum.
proc.
while (x <= 5) (5 - x); auto; last smt().
conseq => /=; call keccakf1600_rhotates_ll; auto => /#.
qed.

lemma keccakf1600_round_ll : islossless Jkem.M(Syscall).keccakf1600_round.
proc; auto.
while (y <= 5) (5 - y); auto.
+ call keccakf1600_set_row_ll.
  call keccakf1600_rol_sum_ll.
  auto; smt().
call keccakf1600_theta_rol_ll.
call keccakf1600_theta_sum_ll.
auto; smt().
qed.

lemma keccakf1600_ll : islossless Jkem.M(Syscall)._keccakf1600_.
proc; auto.
call (:true); auto.
call (:true); auto.
while (to_uint c <= 24 /\ to_uint c %% 2 = 0) (24 - to_uint c); auto; last by move => /> *; rewrite ultE to_uint_small //= /#.
call keccakf1600_round_ll; auto.
call keccakf1600_round_ll; auto.
move => /> ??; rewrite ultE to_uintD_small to_uint_small //= /#.
qed.

lemma sha3ll : islossless Jkem.M(Jkem.Syscall)._shake256_128_33.
proof.
proc.
unroll for 9; wp; conseq => /=.
call keccakf1600_ll; auto.
conseq => /=.
unroll for ^while; auto.
conseq => /=.
inline *; unroll for ^while; auto.
qed.

(*
axiom shake128_equiv_absorb : equiv [ M(Syscall)._shake128_absorb34 ~ 
   Jkem_avx2.M(Jkem_avx2.Syscall)._shake128_absorb34   :
      ={state, in_0} ==> ={res}].
axiom shake128_equiv_squeezeblock : equiv [  M(Syscall)._shake128_squeezeblock ~
     Jkem_avx2.M(Jkem_avx2.Syscall)._shake128_squeezeblock  :
      ={state, out} ==> ={res}].
*)


equiv genmatrixequiv b :
 Jkem_avx2.M(Jkem_avx2.Syscall)._gen_matrix_avx2 ~ Jkem.M(Jkem.Syscall).__gen_matrix :
    arg{1}.`2 = arg{2}.`1 /\ arg{1}.`3= (W64.of_int (b2i b)) /\ arg{2}.`2 =  (W64.of_int (b2i b))  ==>
    res{1} = nttunpackm res{2} /\
    pos_bound2304_cxq res{1} 0 2304 2 /\
    pos_bound2304_cxq res{2} 0 2304 2.
proc* => /=. 
transitivity {2} { r <@ AuxMLKEM.__gen_matrix(seed,b); }
     ( rho{1} = seed{2} /\ transposed{1} = (of_int (b2i b))%W64 /\ transposed{2} = (of_int (b2i b))%W64 ==> r{1} = nttunpackm r{2} /\ pos_bound2304_cxq r{1} 0 2304 2 /\ pos_bound2304_cxq r{2} 0 2304 2 )
     ( seed{1} = seed{2} /\ transposed{1} = (of_int (b2i b))%W64 /\ transposed{2} = (of_int (b2i b))%W64==> ={r});1,2:smt().
    + call (genmatrixequiv_aux b); 1: by auto => />. 
    by symmetry;call (auxgenmatrix_good);  auto => /> /#.  
qed.

module GetNoiseAVX2 = {
  proc _poly_getnoise_eta1_4x(aux3 aux2 aux1 aux0 : W16.t Array256.t,
                               noiseseed : W8.t Array32.t, 
                               nonce : W8.t) : 
      W16.t Array256.t * W16.t Array256.t * W16.t Array256.t * W16.t Array256.t = {
      var n3, n2, n1, n0 : W8.t;
      var aux_3, aux_2, aux_1, aux_0 : W16.t Array256.t;
      n0 <- nonce + W8.of_int 3;
      n1 <- nonce + W8.of_int 2;
      n2 <- nonce + W8.of_int 1;
      n3 <- nonce;
      aux_3 <@Jkem.M(Jkem.Syscall)._poly_getnoise(aux3,noiseseed,n3);
      aux_2 <@Jkem.M(Jkem.Syscall)._poly_getnoise(aux2,noiseseed,n2);
      aux_1 <@Jkem.M(Jkem.Syscall)._poly_getnoise(aux1,noiseseed,n1);
      aux_0 <@Jkem.M(Jkem.Syscall)._poly_getnoise(aux0,noiseseed,n0);
      return (aux_3, aux_2, aux_1, aux_0);
  }

  proc sample_noise_kg(skpv pkpv e : W16.t Array768.t, noiseseed:W8.t Array32.t) : W16.t Array768.t * W16.t Array768.t ={
     var nonce : W8.t;
     var aux_3, aux_2, aux_1, aux_0 : W16.t Array256.t;
                nonce <- (W8.of_int 0);
                (aux_3, aux_2, aux_1,
                aux_0) <@ _poly_getnoise_eta1_4x ((Array256.init (fun i_0 => skpv.[0 + i_0])),
                (Array256.init (fun i_0 => skpv.[256 + i_0])),
                (Array256.init (fun i_0 => skpv.[(2 * 256) + i_0])),
                (Array256.init (fun i_0 => e.[0 + i_0])), noiseseed, nonce);
                skpv <- Array768.init
                        (fun i_0 => if 0 <= i_0 < 0 + 256 then aux_3.[i_0-0]
                        else skpv.[i_0]);
                skpv <- Array768.init
                        (fun i_0 => if 256 <= i_0 < 256 + 256
                        then aux_2.[i_0-256] else skpv.[i_0]);
                skpv <- Array768.init
                        (fun i_0 => if (2 * 256) <= i_0 < (2 * 256) + 256
                        then aux_1.[i_0-(2 * 256)] else skpv.[i_0]);
                e <- Array768.init
                     (fun i_0 => if 0 <= i_0 < 0 + 256 then aux_0.[i_0-0]
                     else e.[i_0]);
                nonce <- (W8.of_int 4);
                (aux_3, aux_2, aux_1,
                aux_0) <@ _poly_getnoise_eta1_4x ((Array256.init (fun i_0 => e.[256 + i_0])),
                (Array256.init (fun i_0 => e.[(2 * 256) + i_0])),
                (Array256.init (fun i_0 => pkpv.[0 + i_0])),
                (Array256.init (fun i_0 => pkpv.[256 + i_0])), noiseseed,
                nonce);
                e <- Array768.init
                     (fun i_0 => if 256 <= i_0 < 256 + 256
                     then aux_3.[i_0-256] else e.[i_0]);
                e <- Array768.init
                     (fun i_0 => if (2 * 256) <= i_0 < (2 * 256) + 256
                     then aux_2.[i_0-(2 * 256)] else e.[i_0]);
     return (skpv,e);
  }

  proc samplenoise_enc(sp_0 ep bp : W16.t Array768.t, epp : W16.t Array256.t, noiseseed:W8.t Array32.t) : W16.t Array768.t * W16.t Array768.t * W16.t Array768.t * W16.t Array256.t  = {
     var nonce : W8.t;
     var aux_2, aux_1, aux_0, aux : W16.t Array256.t;
                nonce <- (W8.of_int 0);
                (aux_2, aux_1, aux_0,
                aux) <@ _poly_getnoise_eta1_4x ((Array256.init (fun i_0 => sp_0.[0 + i_0])),
                (Array256.init (fun i_0 => sp_0.[256 + i_0])),
                (Array256.init (fun i_0 => sp_0.[(2 * 256) + i_0])),
                (Array256.init (fun i_0 => ep.[0 + i_0])), noiseseed,
                nonce);
                sp_0 <- Array768.init
                        (fun i_0 => if 0 <= i_0 < 0 + 256 then aux_2.[i_0-0]
                        else sp_0.[i_0]);
                sp_0 <- Array768.init
                        (fun i_0 => if 256 <= i_0 < 256 + 256
                        then aux_1.[i_0-256] else sp_0.[i_0]);
                sp_0 <- Array768.init
                        (fun i_0 => if (2 * 256) <= i_0 < (2 * 256) + 256
                        then aux_0.[i_0-(2 * 256)] else sp_0.[i_0]);
                ep <- Array768.init
                      (fun i_0 => if 0 <= i_0 < 0 + 256 then aux.[i_0-0]
                      else ep.[i_0]);
                nonce <- (W8.of_int 4);
                (aux_2, aux_1, aux_0,
                aux) <@ _poly_getnoise_eta1_4x ((Array256.init (fun i_0 => ep.[256 + i_0])),
                (Array256.init (fun i_0 => ep.[(2 * 256) + i_0])), epp,
                (Array256.init (fun i_0 => bp.[0 + i_0])), noiseseed,
                nonce);
                ep <- Array768.init
                      (fun i_0 => if 256 <= i_0 < 256 + 256
                      then aux_2.[i_0-256] else ep.[i_0]);
                ep <- Array768.init
                      (fun i_0 => if (2 * 256) <= i_0 < (2 * 256) + 256
                      then aux_1.[i_0-(2 * 256)] else ep.[i_0]);
                epp <- aux_0;
                bp <- Array768.init
                      (fun i_0 => if 0 <= i_0 < 0 + 256 then aux.[i_0-0]
                      else bp.[i_0]);
                return (sp_0,ep,bp, epp);

  }
}.

(* int value of jth noise coeficient *)
op noise_coef (bytes: W8.t Array128.t) (j: int): int =
 let b = bytes.[j%/2] in b2i b.[j%%2*4] + b2i b.[j%%2*4+1] - (b2i b.[j%%2*4+2] + b2i b.[j%%2*4+3]).

import WArray128.

op B2Ri (bytes: W8.t Array128.t) (j: int): W256.t =
 get256 (WArray128.init8 (fun i => bytes.[i])) j.

lemma bytes_getR (bytes: W8.t Array128.t) (k: int):
 0 <= k && k < 128 =>
 bytes.[k] = B2Ri bytes (k %/ 32) \bits8 (k %% 32).
proof.
move=> Hk; rewrite /B2Ri /get256_direct pack32bE 1:/# initiE 1:/# /=.
by rewrite mulrC -divz_eq /init8 initiE.
qed.

abbrev mask55u256 = VPBROADCAST_8u32 (W32.of_int 1431655765).
abbrev mask33u256 = VPBROADCAST_8u32 (W32.of_int 858993459).
abbrev mask03u256 = VPBROADCAST_8u32 (W32.of_int 50529027).
abbrev mask0Fu256 = VPBROADCAST_8u32 (W32.of_int 252645135).

abbrev mask55u16 = W16.of_int 21845. (* 21845 = 0x5555 *)
abbrev mask33u16 = W16.of_int 13107. (* 13107 = 0x3333 *)
abbrev mask03u16 = W16.of_int 771. (* 771 = 0x0303 *)
abbrev mask0Fu16 = W16.of_int 3855. (* 3855 = 0x0F0F *)

abbrev mask55u8 = W8.of_int 85. (* 85 = 0x55 *)
abbrev mask33u8 = W8.of_int 51. (* 51 = 0x33 *)
abbrev mask03u8 = W8.of_int 3. (* 3 = 0x03 *)
abbrev mask0Fu8 = W8.of_int 15. (* 15 = 0x0F *)

lemma mask55_bits16 k:
 0 <= k < 16 =>
 mask55u256 \bits16 k = mask55u16.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits16_W8u32 Hk //= get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%2 \in iota_ 0 2) by smt(mem_iota).
by move: (k%%2); rewrite -allP -iotaredE /= W2u16.bits16_div //.
qed.

lemma mask55_bits8 k:
 0 <= k < 32 =>
 mask55u256 \bits8 k = mask55u8.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits8_W8u32 Hk //= get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%4 \in iota_ 0 4) by smt(mem_iota).
by move: (k%%4); rewrite -allP -iotaredE /= W4u8.bits8_div //.
qed.

lemma mask33_bits16 k:
 0 <= k < 16 =>
 mask33u256 \bits16 k = mask33u16.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits16_W8u32 Hk //= get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%2 \in iota_ 0 2) by smt(mem_iota).
by move: (k%%2); rewrite -allP -iotaredE /= W2u16.bits16_div //.
qed.

lemma mask33_bits8 k:
 0 <= k < 32 =>
 mask33u256 \bits8 k = mask33u8.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits8_W8u32 Hk //= get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%4 \in iota_ 0 4) by smt(mem_iota).
by move: (k%%4); rewrite -allP -iotaredE /= W4u8.bits8_div //.
qed.

lemma mask03_bits8 k:
 0 <= k < 32 =>
 mask03u256 \bits8 k = mask03u8.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits8_W8u32 Hk //= get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%4 \in iota_ 0 4) by smt(mem_iota).
by move: (k%%4); rewrite -allP -iotaredE /= W4u8.bits8_div //.
qed.

lemma mask0F_bits16 k:
 0 <= k < 16 =>
 mask0Fu256 \bits16 k = mask0Fu16.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits16_W8u32 Hk //= get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%2 \in iota_ 0 2) by smt(mem_iota).
by move: (k%%2); rewrite -allP -iotaredE /= W2u16.bits16_div //.
qed.

lemma mask0F_bits8 k:
 0 <= k < 32 =>
 mask0Fu256 \bits8 k = mask0Fu8.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits8_W8u32 Hk //= get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%4 \in iota_ 0 4) by smt(mem_iota).
by move: (k%%4); rewrite -allP -iotaredE /= W4u8.bits8_div //.
qed.

lemma VPSRL1_ANDmask55 w k:
 0 <= k < 32 =>
 mask55u256 `&` (VPSRL_16u16 w (W8.of_int 1)) \bits8 k
 = mask55u8 `&` ((w \bits8 k) `>>` (W8.of_int 1)).
proof.
move=> Hk.
rewrite {1}(_:k=2*(k%/2) + (k%%2)); first smt(divz_eq).
rewrite -W256_bits16_bits8 1:/# andb16E /VPSRL_16u16 mapbE 1:/# /=.
rewrite W256_bits16_bits8 1:/# mask55_bits8 1:/#.
apply W8extra.wordP_red. rewrite -allP /=.
have: (k\in iota_ 0 32) by smt(mem_iota).
by move: {Hk} k; rewrite -allP -iotaredE /= !W16.shrwE !W8.shrwE /int_bit /=.
qed.

lemma VPSRL2_ANDmask33 w k:
 0 <= k < 32 =>
 mask33u256 `&` (VPSRL_16u16 w (W8.of_int 2)) \bits8 k
 = mask33u8 `&` ((w \bits8 k) `>>` (W8.of_int 2)).
proof.
move=> Hk.
rewrite {1}(_:k=2*(k%/2) + (k%%2)); first smt(divz_eq).
rewrite -W256_bits16_bits8 1:/# andb16E /VPSRL_16u16 mapbE 1:/# /=.
rewrite W256_bits16_bits8 1:/# mask33_bits8 1:/#.
apply W8extra.wordP_red. rewrite -allP /=.
have: (k\in iota_ 0 32) by smt(mem_iota).
by move: {Hk} k; rewrite -allP -iotaredE /= !W16.shrwE !W8.shrwE /int_bit /=.
qed.

lemma VPSRL4_ANDmask0F w k:
 0 <= k < 32 =>
 VPAND_256 mask0Fu256 (VPSRL_16u16 w (W8.of_int 4)) \bits8 k
 = mask0Fu8 `&` ((w \bits8 k) `>>` (W8.of_int 4)).
proof.
move=> Hk.
rewrite {1}(_:k=2*(k%/2) + (k%%2)); first smt(divz_eq).
rewrite -W256_bits16_bits8 1:/# andb16E /VPSRL_16u16 mapbE 1:/# /=.
rewrite W256_bits16_bits8 1:/# mask0F_bits8 1:/#.
apply W8extra.wordP_red. rewrite -allP /=.
have: (k\in iota_ 0 32) by smt(mem_iota).
by move: {Hk} k; rewrite -allP -iotaredE /= !W16.shrwE !W8.shrwE /int_bit /=.
qed.

lemma to_uint_mask33 (w:W8.t):
 to_uint (mask33u8 `&` w)
 = to_uint w %% 4 + to_uint w %/ 16 %% 4 * 16.
proof.
have ->: mask33u8 = (mask03u8 `<<<` 4) `|` mask03u8.
 apply W8.wordP => k; rewrite -mem_range /range /=. 
 by move: k; apply/List.allP; rewrite -iotaredE /int_bit /=.
rewrite andwC andw_orwDr orw_disjoint.
 apply W8.wordP => k; rewrite -mem_range /range /=. 
 by move: k; apply/List.allP; rewrite -iotaredE /int_bit /=.
have ->: w `&` (mask03u8 `<<<` 4)
        = ((w `>>>` 4) `&` W8.masklsb (6-4)) `<<<` 4.
rewrite -shlw_andmask // shrl_andmaskN // -andwA /=.
congr.
rewrite /max /=.
 apply W8.wordP => k; rewrite -mem_range /range /=. 
 by move: k; apply/List.allP; rewrite -iotaredE /int_bit /=.
have E1: to_uint (w `&` mask03u8) = to_uint w %% 4.
 by rewrite (W8.to_uint_and_mod 2) //.
have /= E2: to_uint ((w `>>>` 4) `&` (masklsb (6-4))%W8 `<<<` 4) = to_uint w %/ 16 %% 4 * 16.
 rewrite /max /= to_uint_shl // (W8.to_uint_and_mod 2) //.
 by rewrite to_uint_shr //= modz_small /#.
rewrite to_uintD_small /=.
 by rewrite E1 E2 /#.
by rewrite E1 E2 /#.
qed.

lemma aux_coef_pos b:
 to_uint (mask33u8 `&` (mask55u8 `&` b  + mask55u8 `&` (b `>>` ru_ones_s)))
 = b2i b.[0] + b2i b.[1] + 16 * (b2i b.[4] + b2i b.[5]).
proof.
rewrite addrC -(mask85_sum b 0) // -(mask85_sum b 2) //= !(W8.andwC mask55u8).
by rewrite to_uint_mask33 /(`>>`) to_uint_shr //= to_uint_shr //= /#.
qed.

lemma aux_coef_neg b:
 to_uint (mask33u8 `&` ((mask55u8 `&` b + mask55u8 `&` (b `>>` ru_ones_s)) `>>` W8.of_int 2))
 = b2i b.[2] + b2i b.[3] + 16 * (b2i b.[6] + b2i b.[7]).
proof.
rewrite to_uint_mask33 to_uint_shr // -divz_mul //= !(W8.andwC mask55u8).
rewrite {1}(_:4=2^2) // (_:64=2^6) // -(mask85_sum b 1) // -(mask85_sum b 3) //=. 
by rewrite to_uint_shr //= to_uint_shr //= /#.
qed.

lemma noise_coef_avx2_aux bytes j:
 3 + noise_coef bytes j
 = let b = bytes.[j%/2] in
   let x = mask55u8 `&` b + mask55u8 `&` (b `>>` W8.one) in
   let y = mask33u8 `&` x + mask33u8 - mask33u8 `&` (x `>>` (W8.of_int 2))in
   to_uint y %/ 2^(j%%2*4) %% 16.
proof.
have LL1: forall (x y z:int), (x + z*y) %% z = x %% z.
 by move=> x1 x2 x3; rewrite -modzDm modzMr /= modz_mod.
have LL2: forall (x y z:int), (x - z*y) %% z = x %% z.
 by move=> x1 x2 x3; rewrite -modzDm -modzNm modzMr /= modz_mod.
move=> /=.
pose b:= bytes.[j %/ 2].
pose x:= mask55u8 `&` b  + mask55u8 `&` (b `>>` ru_ones_s).
case: (j %% 2 = 0) => C.
 rewrite C /=. 
 rewrite -addrA to_uintD /= modz_dvd 1:/#.
 rewrite aux_coef_pos W8.to_uintB.
  by rewrite ule_andw.
 rewrite -modzDm LL1 modzDm aux_coef_neg.
 rewrite Ring.IntID.opprD !addzA LL2 /=.
 by rewrite -modzDml -(modzDmr _ 51) /= modzDml modz_small /#. 
have ->/=: j%%2 = 1 by smt().
rewrite -addrA to_uintD.
rewrite (_:16=2^4) // modz_pow_div //= modz_mod.
rewrite aux_coef_pos W8.to_uintB.
 by rewrite ule_andw.
rewrite aux_coef_neg /= (divz_eq 51 16).
pose X:= (b2i _ + _ + _ + _)%W8.
have /=->: X 
   = b2i b.[0] + b2i b.[1] + (51 %% 16) - (b2i b.[2] + b2i b.[3]) 
     + 16 * (b2i b.[4] + b2i b.[5] + (51 %/ 16) - (b2i b.[6] + b2i b.[7])).
 by rewrite /X /=; ring.
by rewrite mulzC divzMDr // divz_small //= /#.
qed.

lemma noise_coef_avx2 bytes j:
 noise_coef bytes j
 = let b = bytes.[j%/2] in
   let x = mask55u8 `&` b + mask55u8 `&` (b `>>` W8.one) in
   let y = mask33u8 `&` x + mask33u8 - mask33u8 `&` (x `>>` (W8.of_int 2)) in
   if j%%2 = 0
   then to_sint (mask0Fu8 `&` y - mask03u8)
   else to_sint (mask0Fu8 `&` (y `>>` (W8.of_int 4)) - mask03u8).
proof.
have L1: forall x, W8.to_uint x < 128 => W8.to_sint x = to_uint x. 
 by move=> x; rewrite to_sintE /smod /= /#.
rewrite /noise_coef /=.
pose b:= bytes.[j %/ 2].
pose x:= b `&` mask55u8 + (b `>>` ru_ones_s) `&` mask55u8.
pose y:= x `&` mask33u8 + mask33u8 - (x `>>` (W8.of_int 2)) `&` mask33u8.
case: (j %% 2 = 0) => C.
 rewrite C /= andwC W8_to_sintB_small.
  by rewrite !to_sintE  (W8.to_uint_and_mod 4) /smod //= /#.
 rewrite L1 (W8.to_uint_and_mod 4) //= /smod /= 1:/#.
 move: (noise_coef_avx2_aux bytes j) => /=.
 by rewrite C to_sintE /smod => <- /#. 
have C': j %% 2 = 1 by smt().
rewrite C' /= andwC W8_to_sintB_small.
 by rewrite !to_sintE  (W8.to_uint_and_mod 4) /smod //= /#.
rewrite L1 (W8.to_uint_and_mod 4) //= /smod /= 1:/#.
move: (noise_coef_avx2_aux bytes j) => /=.
by rewrite /noise_coef C' to_sintE /smod to_uint_shr //= => <- /#.
qed.

lemma  to_sint8_mod x:
 W8.to_sint x %% W8.modulus = to_uint x.
proof.
rewrite /to_sint /smod.
case: (2 ^ (8 - 1) <= to_uint x) => C.
 rewrite -modzDm -modzNm modzz /= modz_mod.
 rewrite modz_small //.
 by apply JUtils.bound_abs; apply W8.to_uint_cmp.
rewrite modz_small //.
by apply JUtils.bound_abs; apply W8.to_uint_cmp.
qed.

lemma to_sint8K (x:W8.t): W8.of_int (to_sint x) = x.
proof. by rewrite -of_int_mod to_sint8_mod to_uintK. qed.

lemma truncateu128_bits128 (w:W256.t):
 truncateu128 w = w \bits128 0.
proof. by rewrite /truncateu128 to_uint_eq of_uintK bits128_div // of_uintK. qed.

hoare cbd2_avx2_h _bytes:
 Jkem_avx2.M(Jkem_avx2.Syscall).__cbd2: buf=_bytes ==> res = Array256.init (fun k => W16.of_int (noise_coef _bytes k)).
proof.
proc.
sp; simplify.
while (0 <= i <= 4 /\ #{~i}pre /\ List.all (fun k => rp.[k]=W16.of_int (noise_coef _bytes k)) (iota_ 0 (64*i))).
 seq 15: (#pre /\ 
          all (fun k=> if k%%2 = 0
                       then to_sint (f0 \bits8 (k %/ 2)) = noise_coef _bytes (64*i+k)
                       else to_sint (f1 \bits8 (k %/ 2)) = noise_coef _bytes (64*i+k))
              (iota_ 0 64)).
  auto => &m |> ?_ /List.allP H ?; apply/List.allP => k; rewrite mem_iota /= => *.
  case: (k%%2=0) => C1.
   move: (noise_coef_avx2 buf{m} (64*i{m}+k)).
   have ->: (64 * i{m} + k) %% 2 = 0 by smt().
   rewrite /= => ->.
   have:= (bytes_getR buf{m} ((64*i{m}+k)%/2) _); first smt().
   rewrite /B2Ri /= -!divz_mul //=. 
   have ->: (64 * i{m} + k) %/ 64 = i{m}.
    by rewrite (mulzC 64) divzMDl // (divz_small _ 64) 1:/# /=.
   have ->: (64 * i{m} + k) %/ 2 %% 32 = k %/ 2.
    rewrite -(modz_pow_div 2 6 1) //=.
    by rewrite (mulzC 64) modzMDl modz_small /#.
   move => Eb.
   rewrite map2bE 1:/# /= mask0F_bits8 1:/# /=.
   rewrite map2bE 1:/#. beta. 
   rewrite VPSRL2_ANDmask33 1:/#.
   rewrite map2bE 1:/#; beta.
   rewrite map2bE 1:/#; beta.
   rewrite VPSRL1_ANDmask55 1:/#.
   rewrite mask33_bits8 1:/# /=.
   rewrite map2bE 1:/#; beta.
   rewrite VPSRL1_ANDmask55 1:/#.
   rewrite mask33_bits8 1:/# /=.
   rewrite mask55_bits8 1:/# /=.
   rewrite mask03_bits8 1:/# -!Eb.
   by congr.
  have C2: k %% 2 = 1 by smt().
  move: (noise_coef_avx2 buf{m} (64*i{m}+k)).
  have ->: (64 * i{m} + k) %% 2 = 1 by smt().
  rewrite /= => ->.
  have:= (bytes_getR buf{m} ((64*i{m}+k)%/2) _); first smt().
  rewrite /B2Ri /= -!divz_mul //=. 
  have ->: (64 * i{m} + k) %/ 64 = i{m}.
   by rewrite (mulzC 64) divzMDl // (divz_small _ 64) 1:/# /=.
  have ->: (64 * i{m} + k) %/ 2 %% 32 = k %/ 2.
   rewrite -(modz_pow_div 2 6 1) //=.
   by rewrite (mulzC 64) modzMDl modz_small /#.
  move => Eb.
  rewrite map2bE 1:/#; beta.
  rewrite VPSRL4_ANDmask0F 1:/#.
  rewrite map2bE 1:/#; beta.
  rewrite map2bE 1:/#; beta.
  rewrite VPSRL2_ANDmask33 1:/#.
  rewrite map2bE 1:/#; beta.
  rewrite VPSRL1_ANDmask55 1:/#.
  rewrite mask33_bits8 1:/# /=.
  rewrite map2bE 1:/#; beta.
  rewrite VPSRL1_ANDmask55 1:/#.
  rewrite mask33_bits8 1:/# /=.
  rewrite mask55_bits8 1:/# /=.
  rewrite mask03_bits8 1:/# -!Eb.
  by congr.
 seq 10: (#[/:-2]pre /\
          all (fun (k : int) =>
                if k %/ 16 = 0 
                then f0 \bits16 k%%16 = W16.of_int (noise_coef _bytes (64*i+k))
                else if k %/ 16 = 1
                then f2 \bits16 k%%16 = W16.of_int (noise_coef _bytes (64*i+k))
                else if k %/ 16 = 2
                then f1 \bits16 k%%16 = W16.of_int (noise_coef _bytes (64*i+k))
                else f3 \bits16 k%%16 = W16.of_int (noise_coef _bytes (64*i+k)))
              (iota_ 0 64)).
  auto => &m |> ?_ /List.allP IH ?.
  rewrite -{1}iotaredE /= => |> *.
  rewrite -iotaredE /=.
  do 32! (split; first by 
   rewrite /VPMOVSX_16u8_16u16 /VPUNPCKL_32u8 /VPUNPCKL_16u8 /VPUNPCKH_32u8 /VPUNPCKH_16u8 /MOVSX_u16s8 truncateu128_bits128 /interleave_gen /get_lo_2u64 /get_hi_2u64 /= /#).
  do 31! (split; first by
   rewrite /VPMOVSX_16u8_16u16 /VPUNPCKL_32u8 /VPUNPCKL_16u8 /VPUNPCKH_32u8 /VPUNPCKH_16u8 /MOVSX_u16s8 /VEXTRACTI128 /interleave_gen /get_lo_2u64 /get_hi_2u64 /b2i /= /int_bit /= /#).
  by rewrite /VPMOVSX_16u8_16u16 /VPUNPCKL_32u8 /VPUNPCKL_16u8 /VPUNPCKH_32u8 /VPUNPCKH_16u8 /MOVSX_u16s8 /VEXTRACTI128 /interleave_gen /get_lo_2u64 /get_hi_2u64 /b2i /= /int_bit /= /#.
 auto => |> &m ? _ /List.allP IH ? /List.allP H.
 split; first smt().
 rewrite -!NTT_AVX_Fq.PURE 1..4:/#. 
 apply/List.allP => k; rewrite mem_iota /= => |> *.
 rewrite !NTT_AVX_Fq.PUR_get 1..8:/#.
 case: (k %/ 16 = 4 * i{m} + 3) => C1.
  move: (H (k %% 64) _) => /=; first smt(mem_iota).
  rewrite (modz_pow_div 2 6 4) //= C1 (mulzC 4) modzMDl /=.
  rewrite (modz_dvd_pow 4 6 _ 2) //.
  have ->: 64 * i{m} + k %% 64 = k by smt().
  by rewrite /R2C /= Array16.initiE /#.
 case: (k %/ 16 = 4 * i{m} + 2) => C2.
  move: (H (k %% 64) _) => /=; first smt(mem_iota).
  rewrite (modz_pow_div 2 6 4) //= C2 (mulzC 4) modzMDl /=.
  rewrite (modz_dvd_pow 4 6 _ 2) //.
  have ->: 64 * i{m} + k %% 64 = k by smt().
  by rewrite /R2C /= Array16.initiE /#.
 case: (k %/ 16 = 4 * i{m} + 1) => C3.
  move: (H (k %% 64) _) => /=; first smt(mem_iota).
  rewrite (modz_pow_div 2 6 4) //= C3 (mulzC 4) modzMDl /=.
  rewrite (modz_dvd_pow 4 6 _ 2) //.
  have ->: 64 * i{m} + k %% 64 = k by smt().
  by rewrite /R2C /= Array16.initiE /#.
 case: (k %/ 16 = 4 * i{m}) => C4.
  move: (H (k %% 64) _) => /=; first smt(mem_iota).
  rewrite (modz_pow_div 2 6 4) //= C4 modzMr. 
  rewrite (modz_dvd_pow 4 6 _ 2) //.
  have ->: 64 * i{m} + k %% 64 = k by smt().
  by rewrite /R2C /= Array16.initiE /#.
 have ?: k < 64*i{m} by smt().   
 by move: (IH k _) => /=; first smt(mem_iota).
auto => &m |> *.
split; first by rewrite iota0.
move => i rp ???; rewrite (_:i=4) 1:/# /=.
move => /List.allP H.
rewrite tP => k Hk; rewrite (H k _); first smt(mem_iota).
by rewrite initiE /#.
qed.

lemma cbd2_ll : islossless Jkem_avx2.M(Jkem_avx2.Syscall).__cbd2.
proc. inline *. sp; wp. while (true) (4-i). move => z.
auto => /> &hr H. smt().
auto => />i. smt(). qed. 

phoare cbd2_avx2_ph _bytes:
 [Jkem_avx2.M(Jkem_avx2.Syscall).__cbd2: buf=_bytes ==> res = Array256.init (fun k => W16.of_int (noise_coef _bytes k))] = 1%r.
conseq cbd2_ll (cbd2_avx2_h _bytes) => />. qed.

module AuxMLKEMAvx2 = {
  proc cbd2_ref (rp:W16.t Array256.t,buf:W8.t Array128.t) : W16.t Array256.t = {
    var k: int;
    var a, b, c: W8.t;
    var i: W64.t;
    var t: W16.t;
    i <- (W64.of_int 0);

    while ((i \ult (W64.of_int 128))) {
      c <- buf.[(W64.to_uint i)];
      a <- c;
      a <- (a `&` (W8.of_int 85));
      c <- (c `>>` (W8.of_int 1));
      c <- (c `&` (W8.of_int 85));
      c <- (c + a);
      a <- c;
      a <- (a `&` (W8.of_int 3));
      b <- c;
      b <- (b `>>` (W8.of_int 2));
      b <- (b `&` (W8.of_int 3));
      a <- (a - b);
      t <- (sigextu16 a);
      rp.[W64.to_uint (W64.of_int 2 * i)] <- t;
      a <- c;
      a <- (a `>>` (W8.of_int 4));
      a <- (a `&` (W8.of_int 3));
      b <- (c `>>` (W8.of_int 6));
      b <- (b `&` (W8.of_int 3));
      a <- (a - b);
      t <- (sigextu16 a);
      rp.[W64.to_uint (W64.of_int 2 * i + W64.one)] <- t;
      i <- (i + (W64.of_int 1));
    }
    return (rp);
  }
  proc _poly_getnoise (rp:W16.t Array256.t, seed:W8.t Array32.t,nonce:W8.t) : W16.t Array256.t = {
    var buf:W8.t Array128.t;
    var r;

    buf <- witness;
    buf <@ M(Syscall)._shake256_128_33 (buf,Array33.init (fun i => if i=32 then nonce else seed.[i]));
    r <@ cbd2_ref(rp,buf);
    return r;
  }
  proc __poly_getnoise_eta1_4x(aux3 aux2 aux1 aux0 : W16.t Array256.t,
                               noiseseed : W8.t Array32.t, 
                               nonce : W8.t) : 
      W16.t Array256.t * W16.t Array256.t * W16.t Array256.t * W16.t Array256.t = {
      var n3, n2, n1, n0 : W8.t;
      var aux_3, aux_2, aux_1, aux_0 : W16.t Array256.t;
      n0 <- nonce + W8.of_int 3;
      n1 <- nonce + W8.of_int 2;
      n2 <- nonce + W8.of_int 1;
      n3 <- nonce;
      aux_3 <@ _poly_getnoise(aux3,noiseseed,n3);
      aux_2 <@ _poly_getnoise(aux2,noiseseed,n2);
      aux_1 <@ _poly_getnoise(aux1,noiseseed,n1);
      aux_0 <@ _poly_getnoise(aux0,noiseseed,n0);
      return (aux_3, aux_2, aux_1, aux_0);
  }
}.

hoare cbd2_ref_h _bytes:
 AuxMLKEMAvx2.cbd2_ref: buf=_bytes ==> res = Array256.init (fun k => W16.of_int (noise_coef _bytes k)).
proof.
proc.
while (to_uint i <= 128 /\ #pre /\ List.all (fun k => rp.[k]=W16.of_int (noise_coef _bytes k)) (iota_ 0 (2 * to_uint i))).
 auto => &m |>; rewrite /(\ult) => _ /List.allP IH /= Hi.
 rewrite to_uintD_small /= 1:/#.
 split; first smt().
 apply/List.allP => k; rewrite mem_iota /=; move => [? Hk].
 rewrite to_uintD_small !to_uintM_small /= 1..3:/#.
 case: (k = 2 * to_uint i{m}) => C1.
  rewrite /noise_coef !get_setE 1..2:/# C1 /= ifF 1:/#.
  have ->/=: 2 * to_uint i{m} %/ 2 = to_uint i{m} by smt().
  rewrite -to_sint_eq sigextu16_to_sint (_: 3 = 2^2 -1) // !and_mod //= W8_of_sintK_signed /=; 1: smt(). 
  have ->  /= : 2 * to_uint i{m} %% 2 = 0 by smt().
  by rewrite -parallel_noisesum_low smod_small // /#.
 case: (k = 2 * to_uint i{m}+1) => C2.
  rewrite /noise_coef !get_setE 1..2:/# C2 /=.
  have ->/=: (2 * to_uint i{m} + 1) %/ 2 = to_uint i{m} by smt().
  rewrite -to_sint_eq sigextu16_to_sint (_: 3 = 2^2 -1) // !and_mod //= W8_of_sintK_signed /=; 1: smt(). 
  have ->  /= : (2 * to_uint i{m}+1) %% 2 = 1 by smt().
  by rewrite -parallel_noisesum_high smod_small // /#.
 rewrite !get_setE 1..2:/# C1 C2 /=; apply IH.
 smt(mem_iota).
auto => &m |> *.
split; first by rewrite iota0.
move=> i rp; rewrite /(\ult) => |> ??.
have ->/=: to_uint i = 128 by smt().
rewrite tP => /List.allP H k Hk.
rewrite (H k _) /=.
 smt(mem_iota).
by rewrite initiE //.
qed.

lemma cbd2_ref_ll : islossless AuxMLKEMAvx2.cbd2_ref.
proc. inline*. sp; wp. while (true) (128 - W64.to_uint i). move => z.
auto => /> &hr. rewrite ultE of_uintK //= => H. rewrite to_uintD_small //= /#.
auto => />i H. rewrite ultE of_uintK //= 1:/#. qed.

phoare cbd2_ref_ph _bytes:
 [AuxMLKEMAvx2.cbd2_ref: buf=_bytes ==> res = Array256.init (fun k => W16.of_int (noise_coef _bytes k))] = 1%r.
conseq cbd2_ref_ll (cbd2_ref_h _bytes) => />. qed.

equiv getnoise_split : 
  M(Syscall)._poly_getnoise ~ AuxMLKEMAvx2._poly_getnoise : ={arg} ==> ={res}.
proc; wp; sp => />. 
seq 2 0 : ( ={buf,rp,seed,nonce} /\ extseed{1}=Array33.init (fun i => if i=32 then nonce{1} else seed{1}.[i]) ).
wp. while{1} (0 <= k{1} <= 32 /\ (forall i, 0 <= i < k{1} => extseed{1}.[i]=seed{1}.[i])) (32-k{1}).
auto => /> &m H1 H2 H3 H4. split. split. smt(). move => i Hi1 Hi2. rewrite get_setE 1:/#. smt(). smt().
auto => /> &m. split. move => i Hi1 Hi2. rewrite !get_out /#. move => extseed k. split. smt(). move => H1 H2 H3 H4. rewrite tP => i Hi. rewrite !initiE 1:/# => />. rewrite get_setE 1:/#. smt().
seq 1 1 : (#pre).
call (_:true). auto => />. sim. auto => />.  
inline *. sim. qed.

equiv getnoise_1x_equiv_avx :
  Jkem_avx2.M(Jkem_avx2.Syscall).__poly_cbd_eta1 ~ AuxMLKEMAvx2.cbd2_ref : ={arg} ==> ={res}.
proc*. inline Jkem_avx2.M(Jkem_avx2.Syscall).__poly_cbd_eta1. rcondt{1} 3. auto => />. sp;wp.
ecall{1} (cbd2_avx2_ph buf{1}) => />.
ecall{2} (cbd2_ref_ph buf{2}) => />.
auto => /> &2. rewrite tP => i Hi. rewrite initiE //=. qed.

equiv getnoise_4x_split : 
  GetNoiseAVX2._poly_getnoise_eta1_4x ~ AuxMLKEMAvx2.__poly_getnoise_eta1_4x : ={arg} ==> ={res}.
proc; wp; sp => />. call getnoise_split => />. call getnoise_split => />. call getnoise_split => />. call getnoise_split => />. auto => />. qed.

equiv getnoiseequiv_avx : 
   Jkem_avx2.M(Jkem_avx2.Syscall)._poly_getnoise_eta1_4x ~ GetNoiseAVX2._poly_getnoise_eta1_4x : ={arg} ==> ={res}.
proc*. 
transitivity{2} { r <@ AuxMLKEMAvx2.__poly_getnoise_eta1_4x(aux3,aux2,aux1,aux0,noiseseed,nonce); } ((r0{1}, r1{1}, r2{1}, r3{1}, seed{1}, nonce{1}) = (aux3{2}, aux2{2}, aux1{2}, aux0{2}, noiseseed{2}, nonce{2}) ==> ={r}) (={aux3,aux2,aux1,aux0,noiseseed,nonce} ==> ={r}); last first.
symmetry. call getnoise_4x_split => />. auto => />. smt(). smt().
(*main proof*)
inline Jkem_avx2.M(Jkem_avx2.Syscall)._poly_getnoise_eta1_4x AuxMLKEMAvx2.__poly_getnoise_eta1_4x AuxMLKEMAvx2._poly_getnoise. swap{2} [30..31] 5. swap{2} [23..24] 10. swap{2} [16..17] 15.
seq 25 30 : (
    r00{1}=rp{2}  /\ Array128.init (fun (i : int) => buf0{1}.[i]) =buf{2}
 /\ r10{1}=rp0{2} /\ Array128.init (fun (i : int) => buf1{1}.[i]) =buf0{2}
 /\ r20{1}=rp1{2} /\ Array128.init (fun (i : int) => buf2{1}.[i]) =buf1{2}
 /\ r30{1}=rp2{2} /\ Array128.init (fun (i : int) => buf3{1}.[i]) =buf2{2}
).
sp => />.
ecall{2} (shake256_33_128 buf2{2} (Array33.init (fun i => if i = 32 then nonce4{2} else seed2{2}.[i]))); wp => />.
ecall{2} (shake256_33_128 buf1{2} (Array33.init (fun i => if i = 32 then nonce3{2} else seed1{2}.[i]))); wp => />.
ecall{2} (shake256_33_128 buf0{2} (Array33.init (fun i => if i = 32 then nonce2{2} else seed0{2}.[i]))); wp => />.
ecall{2} (shake256_33_128 buf{2} (Array33.init (fun i=> if i = 32 then nonce1{2} else seed{2}.[i]))); wp => />.
ecall{1} (shake_squeezenblocks4x state{1} buf0{1} buf1{1} buf2{1} buf3{1}); wp => />.
ecall{1} (shake_absorb4x state{1} (Array33.init (fun i => buf0{1}.[i])) (Array33.init (fun i => buf1{1}.[i])) (Array33.init (fun i => buf2{1}.[i])) (Array33.init (fun i => buf3{1}.[i])) ); wp => />.
auto => /> &2. rewrite shake4x_equiv => />.
rewrite tP => k Hk; rewrite !initiE //= 1..3:/#; rewrite ifF 1:/#; rewrite /get8 /init8 set_neqiE 1:/#; rewrite initiE //= 1:/#; rewrite initiE //= 1:/#; rewrite set256E initiE //= 1:/#; rewrite ifT //; rewrite /get256_direct bits8_W32u8 //=; rewrite ifT //; rewrite initiE //=; rewrite initiE //=.
rewrite tP => k Hk; rewrite !initiE //= 1..3:/#; rewrite ifF 1:/#; rewrite /get8 /init8 set_neqiE 1:/#; rewrite initiE //= 1:/#; rewrite initiE //= 1:/#; rewrite set256E initiE //= 1:/#; rewrite ifT //; rewrite /get256_direct bits8_W32u8 //=; rewrite ifT //; rewrite initiE //=; rewrite initiE //=.
rewrite tP => k Hk; rewrite !initiE //= 1..3:/#; rewrite ifF 1:/#; rewrite /get8 /init8 set_neqiE 1:/#; rewrite initiE //= 1:/#; rewrite initiE //= 1:/#; rewrite set256E initiE //= 1:/#; rewrite ifT //; rewrite /get256_direct bits8_W32u8 //=; rewrite ifT //; rewrite initiE //=; rewrite initiE //=.
rewrite tP => k Hk; rewrite !initiE //= 1..3:/#; rewrite ifF 1:/#; rewrite /get8 /init8 set_neqiE 1:/#; rewrite initiE //= 1:/#; rewrite initiE //= 1:/#; rewrite set256E initiE //= 1:/#; rewrite ifT //; rewrite /get256_direct bits8_W32u8 //=; rewrite ifT //; rewrite initiE //=; rewrite initiE //=.
wp. call getnoise_1x_equiv_avx => />.
wp. call getnoise_1x_equiv_avx => />.
wp. call getnoise_1x_equiv_avx => />.
wp. call getnoise_1x_equiv_avx => />.
auto => />. qed.

lemma polygetnoise_ll : islossless Jkem.M(Jkem.Syscall)._poly_getnoise.
proc. 
while (0 <= to_uint i <= 128) (128 - to_uint i);
  1: by move => z; auto => />;rewrite  ultE /= => &hr ???; rewrite !to_uintD_small /=; smt(to_uint_cmp).
wp; call sha3ll; wp; while (0<=k<=32) (32 -k); 1: by move => z; auto=> /> /#.
auto => /> *; do split; 1:smt(). 
by move => *; rewrite ultE /=; smt().
qed.

equiv getnoiseequiv : 
  Jkem.M(Jkem.Syscall)._poly_getnoise ~Jkem.M(Jkem.Syscall)._poly_getnoise :
   ={arg} ==> ={res} /\
   signed_bound_cxq res{1} 0 256 1.
have H : forall &m a,
   Pr[Jkem.M(Jkem.Syscall)._poly_getnoise(a) @ &m : forall k, 0<=k<256 => -5 < to_sint res.[k] < 5] = 1%r.
+ move => &m a.
  have -> : 1%r = Pr [ CBD2.sample(PRF a.`2 a.`3) @ &m : true].
  + byphoare => //.
    proc; inline *; while (0<=i<=128) (128-i); 1: by move => z; auto => /> /#. 
    by auto => /> /#.
  by byequiv get_noise_sample_noise => //.
have HH0 : hoare [Jkem.M(Jkem.Syscall)._poly_getnoise : true ==> forall k, 0<=k<256 => -5 < to_sint res.[k] < 5].
+ hoare; bypr => //= &m; rewrite Pr[mu_not].
  have -> : Pr[Jkem.M(Jkem.Syscall)._poly_getnoise(rp{m}, s_seed{m}, nonce{m}) @ &m : true] = 1%r.
  + by byphoare => //; apply polygetnoise_ll.
  smt().
have HHH : equiv [ Jkem.M(Jkem.Syscall)._poly_getnoise ~Jkem.M(Jkem.Syscall)._poly_getnoise : ={arg} ==> ={res} ] by sim.
conseq HHH HH0.
move => *; rewrite /signed_bound_cxq /b16 qE /#.
qed.

import InnerPKE.

lemma mlkem_correct_kg_avx2 mem _pkp _skp  : 
   equiv [Jkem_avx2.M(Jkem_avx2.Syscall).__indcpa_keypair ~ InnerPKE.kg_derand : 
       Glob.mem{1} = mem /\ to_uint pkp{1} = _pkp /\ to_uint skp{1} = _skp /\ 
       randomnessp{1} = coins{2}  /\
       valid_disj_reg _pkp (384*3+32) _skp (384*3)
        ==> 
       touches2 Glob.mem{1} mem _pkp (384*3+32) _skp (384*3) /\
       let (pk,sk) = res{2} in let (t,rho) = pk in
         sk = load_array1152 Glob.mem{1} _skp /\
         t = load_array1152 Glob.mem{1} _pkp  /\
         rho = load_array32 Glob.mem{1} (_pkp+1152)].
proc*.
transitivity {1} {Jkem.M(Jkem.Syscall).__indcpa_keypair(pkp, skp, randomnessp);} 
(={Glob.mem,pkp,skp,randomnessp} /\ 
  Glob.mem{1} = mem /\
    to_uint pkp{1} = _pkp /\
    to_uint skp{1} = _skp /\
    randomnessp{1} = randomnessp{2} /\
    valid_disj_reg _pkp (384 * 3 + 32) _skp (384 * 3) ==> ={Glob.mem}) 
(   Glob.mem{1} = mem /\ to_uint pkp{1} = _pkp /\ to_uint skp{1} = _skp /\ 
       randomnessp{1} = coins{2} /\
       valid_disj_reg _pkp (384*3+32) _skp (384*3)
    ==> 
    touches2 Glob.mem{1} mem _pkp (384*3+32) _skp (384*3) /\
    let (pk, sk) = r{2} in
    let (t, rho) = pk in
        sk = load_array1152 Glob.mem{1} _skp /\
        t = load_array1152 Glob.mem{1} _pkp /\ 
        rho = load_array32 Glob.mem{1} (_pkp + 1152)); 1,2: smt(); 
   last by call(mlkem_correct_kg mem _pkp _skp); auto => />. 

inline{1} 1; inline {2} 1. sim 40 62. 

call (polyvec_tobytes_equiv _pkp).
call (polyvec_tobytes_equiv _skp).
wp;conseq />;1:smt().
ecall (polyvec_reduce_equiv (lift_array768 pkpv{2})).

have H := polyvec_add2_equiv 2 2 _ _ => //.
ecall (H (lift_array768 pkpv{2}) (lift_array768 e{2})); clear H.
unroll for {1} 36.

sp 3 3.

seq 15 17  : (#pre /\ ={publicseed, noiseseed,e,skpv,pkpv} /\ sskp{2} = skp{1} /\ spkp{2} = pkp{1}); 1: by
 sp; conseq />; sim 2 2; call( sha3equiv); conseq />; sim. 

sp 0 2.
seq 2 2 : (#pre /\ aa{1} = nttunpackm a{2} /\
           pos_bound2304_cxq aa{1} 0 2304 2 /\
           pos_bound2304_cxq a{2} 0 2304 2); 1: by 
   conseq />; call (genmatrixequiv false); auto => />.

swap {1} [11..12] 2.

seq 10 18 : (#pre  /\
    signed_bound768_cxq skpv{1} 0 768 1 /\
    signed_bound768_cxq e{1} 0 768 1 /\
    signed_bound768_cxq skpv{2} 0 768 1 /\
    signed_bound768_cxq e{2} 0 768 1). 
+ conseq />.
  transitivity {1} { (skpv,e) <@ GetNoiseAVX2.sample_noise_kg(skpv,pkpv,e,noiseseed);} (={noiseseed,skpv,pkpv,e} ==> ={skpv,e}) 
   ((r_noiseseed{2} = noiseseed{2} /\
   s_noiseseed{2} = r_noiseseed{2} /\
   (spkp{2} = pkp{2} /\
    sskp{2} = skp{2} /\
    randomnessp0{2} = randomnessp{2} /\
    pkp0{1} = pkp{1} /\
    skp0{1} = skp{1} /\
    randomnessp0{1} = randomnessp{1} /\
    ={Glob.mem, pkp, skp, randomnessp} /\
    Glob.mem{1} = mem /\
    to_uint pkp{1} = _pkp /\
    to_uint skp{1} = _skp /\ ={randomnessp} /\ valid_disj_reg _pkp (384 * 3 + 32) _skp (384 * 3)) /\
   ={publicseed, noiseseed, e, skpv, pkpv} /\ sskp{2} = skp{1} /\ spkp{2} = pkp{1}) /\
  aa{1} = nttunpackm a{2} /\ pos_bound2304_cxq aa{1} 0 2304 2 /\ pos_bound2304_cxq a{2} 0 2304 2

   ==> 
    ={skpv, e} /\
  signed_bound768_cxq skpv{1} 0 768 1 /\
  signed_bound768_cxq e{1} 0 768 1 /\ signed_bound768_cxq skpv{2} 0 768 1 /\ signed_bound768_cxq e{2} 0 768 1
  ); 1,2:smt().
  + by inline {2} 1;do 2!(wp; call getnoiseequiv_avx);auto => />. 
  inline {1} 1. inline GetNoiseAVX2._poly_getnoise_eta1_4x.
  wp; do 2!(call{1} (_: true ==> true); 1: by apply polygetnoise_ll).
  do 6!(wp; call  getnoiseequiv); auto => />.
  move => &1 &2 ??????R?; split.
  + by rewrite tP => k kb; rewrite !initiE //= initiE /#.
  move => ?R0?; split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /= /#.
  move => ?R1?????; split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.
  move => ?R2?; do split. 
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  rewrite /signed_bound768_cxq => x xb /=.
  rewrite !initiE //= fun_if. 
  case (512 <= x && x < 768); 1: by smt().
  move => *; rewrite !initiE //= fun_if. 
  case (256 <= x && x < 512); 1: by smt().
  move => *; rewrite !initiE //= fun_if. 
  by smt().

seq 2 2 : (#{/~skpv{1}}{~e{1}}{~skpv{2}}{~e{2}}pre /\ 
           lift_array768 skpv{1} = nttunpackv (lift_array768 skpv{2}) /\
           lift_array768 e{1} = nttunpackv (lift_array768 e{2}) /\
           pos_bound768_cxq skpv{1} 0 768 2 /\
           pos_bound768_cxq skpv{2} 0 768 2 /\
           pos_bound768_cxq e{1} 0 768 2 /\
           pos_bound768_cxq e{2} 0 768 2); 1: 
 by  conseq />; call (nttequiv); call (nttequiv); auto => /> /#.

(* First ip *)
seq 8 4: (#{/~pkpv{2}}pre /\ 
              lift_array256 (subarray256 pkpv{1} 0) = nttunpack (lift_array256 (subarray256 pkpv{2} 0)) /\
              signed_bound768_cxq pkpv{1} 0 256 2 /\
              signed_bound768_cxq pkpv{2} 0 256 2 /\ i{1} = 1).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE // 1:/# /= kb /= initiE //=. 
+ rewrite /signed_bound768_cxq => k kb; rewrite initiE //=. 
+ rewrite /unpackm /unpackv /=.
  rewrite !initiE // 1:/# /= kb /= initiE //=.
  rewrite fun_if. 
  case (0<=k<256).
  + move => kbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray768 a{2} 0).[256 * 0 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array768.initiE). smt().
  case (256<=k<512).
  + move => kbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray768 a{2} 0).[256 * 1 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array768.initiE). smt(). auto.
  case (512<=k<768).
  + move => kbbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray768 a{2} 0).[256 * 2 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array768.initiE). smt(). auto.
  by smt().
+ move : H10; rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ move : H8; rewrite /pos_bound768_cxq /signed_bound_768_cxq; smt(Array768.initiE).
+ move : H10; rewrite /pos_bound768_cxq /signed_bound_768_cxq; smt(Array768.initiE).

move => H15 H16 H17 H18 H19 r1 r2 H20 H21 H22;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  rewrite kb /=. 
  have -> /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  move : H20; rewrite /lift_array256 tP => H20.
  move : (H20 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

move => H23 r3 r4 H24 H25 H26;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite kb /=. 
  have -> /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  move : H24; rewrite /lift_array256 tP => H24.
  move : (H24 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).


+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

(* Second ip *)

seq 5 4: (#{/~i{1}}pre /\ lift_array256 (subarray256 pkpv{1} 1) = nttunpack (lift_array256 (subarray256 pkpv{2} 1)) /\
              signed_bound768_cxq pkpv{1} 256 512 2 /\
              signed_bound768_cxq pkpv{2} 256 512 2 /\ i{1} = 2).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifT 1:/# initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H18 H19 H20 H21 H22 r1 r2 H23 H24 H25;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1,2: smt(nttunpack_bnd Array256.allP).
  move : H23; rewrite /lift_array256 tP => H23.
  move : (H23 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

move => H26 r3 r4 H27 H28 H29;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H15; rewrite /lift_array256 /subarray256 tP => H15.
  move : (H15 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H27; rewrite /lift_array256 /subarray256 tP => H27.
  move : (H27 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

(* Third ip *)

seq 5 4: (#{/~i{1}}pre /\ lift_array256 (subarray256 pkpv{1} 2) = nttunpack (lift_array256 (subarray256 pkpv{2} 2)) /\
              signed_bound768_cxq pkpv{1} 512 768 2 /\
              signed_bound768_cxq pkpv{2} 512 768 2).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifF 1:/# initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H21 H22 H23 H24 H25 r1 r2 H26 H27 H28;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1,2: smt(nttunpack_bnd Array256.allP).
  move : H26; rewrite /lift_array256 tP => H26.
  move : (H26 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

  move => H29 r3 r4 H30 H31 H32;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H15; rewrite /lift_array256 /subarray256 tP => H15.
  move : (H15 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifF /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H18; rewrite /lift_array256 /subarray256 tP => H18.
  move : (H18 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite /subarray256 /=.
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..2: smt(nttunpack_bnd Array256.allP).
  rewrite !ifT /=; 1..2: smt(nttunpack_bnd Array256.allP).
  move : H30; rewrite /lift_array256 /subarray256 tP => H30.
  move : (H30 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().


auto => />.

move => &1 &2 ?????????????H1??H2??H3??. 
do split.
+ smt().
+ smt(). 
+ rewrite /lift_array256 /subarray256 tP in H1.
  rewrite /lift_array256 /subarray256 tP in H2.
  rewrite /lift_array256 /subarray256 tP in H3.
  rewrite /nttpackv tP => k kb.
  rewrite initiE //=.
  case (0 <= k && k < 256).
  + move => kbb.
    move : (H1 (nttpack_idx.[k]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /nttunpack !initiE //=; 1..2: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite /lift_array768 /subarray256 /=.
    pose c := nttpack_idx.[k].
  rewrite /nttunpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite /nttpack initiE //=.
  rewrite initiE //=. smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().
  case (256 <= k && k < 512).
  + move => kbb ?.
    move : (H2 (nttpack_idx.[k-256]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k-256].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /nttunpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /lift_array768 /subarray256 /=.
    pose c := nttpack_idx.[k-256].
  rewrite /nttpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k-256. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().

  + move => *.
    move : (H3 (nttpack_idx.[k-512]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k-512].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /nttunpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /lift_array768 /subarray256 /=.
    pose c := nttpack_idx.[k-512].
  rewrite /nttpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k-512. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().

+  smt(unpackvK).
+ smt().
+ smt().
by smt(unpackvK).
qed.

(***************************************************)
*)

 import WArray960 WArray1536 Array4.

module AuxPolyVecCompress10 = {
    proc avx2_orig(ctp : W64.t, bp : W16.t Array768.t) : W8.t Array960.t = {
       bp <@  Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_reduce_sig(bp);  
       Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_compress(ctp, bp);
       return witness;
    }

    proc avx2_orig_i(ctp : W8.t Array1088.t, bp : W16.t Array768.t) : W8.t Array960.t = {
       var rr : W8.t Array960.t;
       bp <@  Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_reduce_sig(bp);  
       rr <@ Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_compress_1(Array960.init   (fun (i_0 : int) =>   ctp.[0 + i_0]),bp);
       return rr;
    }


proc __polyvec_compress_avx2(ctp : W8.t Array1088.t, a : W16.t Array768.t) : W8.t Array960.t = {
    var aux : int;
    var b0 : W256.t;
    var b1 : W256.t;
    var b2 : W256.t;
    var mask10 : W256.t;
    var shift : W256.t;
    var sllv_indx : W256.t;
    var shuffle : W256.t;
    var i : int;
    var a0 : W256.t;
    var lo : W128.t;
    var hi : W128.t;
    var rp : W8.t Array960.t <- (init (fun (i_0 : int) => ctp.[0 + i_0]))%Array960;
    
    b0 <- VPBROADCAST_16u16 compress10_b0;
    b1 <- VPBROADCAST_16u16 compress10_b1;
    b2 <- VPBROADCAST_16u16 pc_shift1_s;
    mask10 <- VPBROADCAST_16u16 pvc_mask_s;
    shift <- VPBROADCAST_8u32 compress10_shift;
    sllv_indx <- VPBROADCAST_4u64 pvc_sllvdidx_s;
    shuffle <- get256 ((init8 (fun (i_0 : int) => pvc_shufbidx_s.[i_0])))%WArray32 0;
    aux <- 3 * 256 %/ 16;
    i <- 0;
    while (i < aux){
      a0 <- (get256 ((WArray1536.init16 (fun (i_0 : int) => a.[i_0]))) i);
      a0 <@ Jkem_avx2.M(Syscall).compress10_16x16_inline(a0, b0, b1, b2, mask10);
      (lo, hi) <@ Jkem_avx2.M(Syscall).pack10_16x16(a0, shift, sllv_indx, shuffle);
rp <-                                                          
   (init                                                      
      (get8                                                   
         (set128_direct                                       
            ((init8 (fun (i_0 : int) => rp.[i_0])))%WArray960 
            (20 * i) lo)))%Array960 ;                        
                                                              
 rp <-                                                        
   (init                                                      
      (get8                                                   
         (set32_direct                                        
            ((init8 (fun (i_0 : int) => rp.[i_0])))%WArray960 
            (20 * i + 16) (VPEXTR_32 hi W8.zero))))%Array960 ;
                                                              (* 
      Glob.mem <- storeW128 Glob.mem (to_uint (r + (of_int (i * 20 + 0))%W64)) lo;
      Glob.mem <- storeW32 Glob.mem (to_uint (r + (of_int (i * 20 + 16))%W64)) (VPEXTR_32 hi W8.zero);
*)
      i <- i + 1;
    }
    
    return rp;
  }

    proc avx2(bp : W16.t Array768.t) : W8.t Array960.t = {
       var rr : W8.t Array960.t;
       var ctp : W8.t Array1088.t <- (init (fun (i_0 : int) => W8.zero))%Array1088;
       bp <@  Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_reduce_sig(bp);  
       rr <@ __polyvec_compress_avx2(ctp,bp);
       return rr;
    }

    proc ref_orig(ctp : W64.t, bp : W16.t Array768.t)  : W8.t Array960.t = {
       bp <@ Jkem.M(Syscall).__polyvec_reduce(bp); 
       Jkem.M(Syscall).__polyvec_compress(ctp, bp);
       return witness;
    }

    proc ref_orig_i(ctp : W8.t Array1088.t, bp : W16.t Array768.t) : W8.t Array960.t = {
       var rr : W8.t Array960.t;
       bp <@ M(Syscall).__polyvec_reduce(bp) ;  
       rr <@ M(Syscall).__i_polyvec_compress(Array960.init   (fun (i_0 : int) =>   ctp.[0 + i_0]),bp);
       return rr;
    }

proc _poly_csubq_ref(rp : W16.t Array256.t) : W16.t Array256.t = {
    var i : int;
    var t : W16.t;
    var b : W16.t;
    
    i <- 0;
    while (i < 256){
      t <- rp.[i];
      t <- t - qlocal;
      b <- t;
      b <- b `|>>` (of_int 15)%W8;
      b <- b `&` qlocal;
      t <- t + b;
      rp.[i] <- t;
      i <- i + 1;
    }
    
    return rp;
  }
  proc __polyvec_csubq_ref(r : W16.t Array768.t) : W16.t Array768.t = {
    var aux : W16.t Array256.t;
    
    aux <@ _poly_csubq_ref((init (fun (i : int) => r.[0 + i]))%Array256);
    r <- (init (fun (i : int) => if 0 <= i && i < 0 + 256 then aux.[i - 0] else r.[i]))%Array768;
    aux <@ _poly_csubq_ref((init (fun (i : int) => r.[256 + i]))%Array256);
    r <- (init (fun (i : int) => if 256 <= i && i < 256 + 256 then aux.[i - 256] else r.[i]))%Array768;
    aux <@ _poly_csubq_ref((init (fun (i : int) => r.[2 * 256 + i]))%Array256);
    r <- (init (fun (i : int) => if 2 * 256 <= i && i < 2 * 256 + 256 then aux.[i - 2 * 256] else r.[i]))%Array768;
    
    return r;
  }

(* proc __polyvec_compress_ref(a : W16.t Array768.t) : W8.t Array960.t = {
    var aux : int;
    var i : int;
    var j : int;
    var aa : W16.t Array768.t;
    var k : int;
    var t : W64.t Array4.t;
    var c : W16.t;
    var b : W16.t;
    var rr : W8.t Array960.t <- Array960.init(fun _ => W8.zero);
    
    aa <- witness;
    t <- Array4.init(fun _ => W64.zero);
    i <- 0;
    j <- 0;
    aa <@ __polyvec_csubq_ref(a);
    while (i < (3 * 256 - 3)){
      k <- 0;
      while (k < 4){
        t.[k] <- zeroextu64 aa.[i];
        i <- i + 1;
        t.[k] <- (t.[k]) `<<` (of_int 10)%W8;
        t.[k] <- (t.[k]) + (of_int 1665)%W64;
        t.[k] <- (t.[k]) * (of_int 1290167)%W64;
        t.[k] <- (t.[k]) `>>` (of_int 32)%W8;
        t.[k] <- (t.[k]) `&` (of_int 1023)%W64;
        k <- k + 1;
      }
      c <- truncateu16 (t.[0]);
      c <- c `&` (of_int 255)%W16;
      rr.[j] <- (truncateu8 c);
      (* 
      Glob.mem <- storeW8 Glob.mem (to_uint (rp + j)) (truncateu8 c); 
      *)
      j <- j + 1;
      b <- truncateu16 (t.[0]);
      b <- b `>>` (of_int 8)%W8;
      c <- truncateu16 (t.[1]);
      c <- c `<<` (of_int 2)%W8;
      c <- c `|` b;
      rr.[j] <- (truncateu8 c);
      (* 
      Glob.mem <- storeW8 Glob.mem (to_uint (rp + j)) (truncateu8 c); 
      *)
      j <- j + 1;
      b <- truncateu16 (t.[1]);
      b <- b `>>` (of_int 6)%W8;
      c <- truncateu16 (t.[2]);
      c <- c `<<` (of_int 4)%W8;
      c <- c `|` b;
      rr.[j] <- (truncateu8 c);
      (* 
      Glob.mem <- storeW8 Glob.mem (to_uint (rp + j)) (truncateu8 c); 
      *)
      j <- j + 1;
      b <- truncateu16 (t.[2]);
      b <- b `>>` (of_int 4)%W8;
      c <- truncateu16 (t.[3]);
      c <- c `<<` (of_int 6)%W8;
      c <- c `|` b;
      rr.[j] <- (truncateu8 c);
      (* 
      Glob.mem <- storeW8 Glob.mem (to_uint (rp + j)) (truncateu8 c); 
      *)
      j <- j + 1;
      t.[3] <- (t.[3]) `>>` (of_int 2)%W8;
      rr.[j] <- (truncateu8 (t.[3]));
      (* 
      Glob.mem <- storeW8 Glob.mem (to_uint (rp + j)) (truncateu8 (t.[3]));
      *)
      j <- j + 1;
    }
    
    return rr;
  }
*)

  proc __i_polyvec_compress_ref(a : W16.t Array768.t) : W8.t Array960.t = {
    var aux : int;
    var i : int;
    var j : int;
    var aa : W16.t Array768.t;
    var t : W64.t t;
    var c : W16.t;
    var b : W16.t;
    
    var rp : W8.t Array960.t  <- Array960.init(fun _ => W8.zero);
    t <- Array4.init(fun _ => W64.zero);
    aa <@ __polyvec_csubq_ref(a);
    j <- 0;
    i <- 0;
    while (i < (3 * 256 - 3)){
      (* k = 0 *)
        t.[0] <- zeroextu64 aa.[i+0];
        t.[0] <- t.[0] `<<` (of_int 10)%W8;
        t.[0] <- t.[0] + (of_int 1665)%W64;
        t.[0] <- t.[0] * (of_int 1290167)%W64;
        t.[0] <- t.[0] `>>` (of_int 32)%W8;
        t.[0] <- t.[0] `&` (of_int 1023)%W64;
      (* k = 1 *)
        t.[1] <- zeroextu64 aa.[i+1];
        t.[1] <- t.[1] `<<` (of_int 10)%W8;
        t.[1] <- t.[1] + (of_int 1665)%W64;
        t.[1] <- t.[1] * (of_int 1290167)%W64;
        t.[1] <- t.[1] `>>` (of_int 32)%W8;
        t.[1] <- t.[1] `&` (of_int 1023)%W64;
      (* k = 2 *)
        t.[2] <- zeroextu64 aa.[i+2];
        t.[2] <- t.[2] `<<` (of_int 10)%W8;
        t.[2] <- t.[2] + (of_int 1665)%W64;
        t.[2] <- t.[2] * (of_int 1290167)%W64;
        t.[2] <- t.[2] `>>` (of_int 32)%W8;
        t.[2] <- t.[2] `&` (of_int 1023)%W64;
      (* k = 3 *)
        t.[3] <- zeroextu64 aa.[i+3];
        t.[3] <- t.[3] `<<` (of_int 10)%W8;
        t.[3] <- t.[3] + (of_int 1665)%W64;
        t.[3] <- t.[3] * (of_int 1290167)%W64;
        t.[3] <- t.[3] `>>` (of_int 32)%W8;
        t.[3] <- t.[3] `&` (of_int 1023)%W64;
      c <- truncateu16 t.[0];
      c <- c `&` (of_int 255)%W16;
      rp.[j] <- truncateu8 c;
      j <- j + 1;
      b <- truncateu16 t.[0];
      b <- b `>>` (of_int 8)%W8;
      c <- truncateu16 t.[1];
      c <- c `<<` (of_int 2)%W8;
      c <- c `|` b;
      rp.[j] <- truncateu8 c;
      j <- j + 1;
      b <- truncateu16 t.[1];
      b <- b `>>` (of_int 6)%W8;
      c <- truncateu16 t.[2];
      c <- c `<<` (of_int 4)%W8;
      c <- c `|` b;
      rp.[j] <- truncateu8 c;
      j <- j + 1;
      b <- truncateu16 t.[2];
      b <- b `>>` (of_int 4)%W8;
      c <- truncateu16 t.[3];
      c <- c `<<` (of_int 6)%W8;
      c <- c `|` b;
      rp.[j] <- truncateu8 c;
      j <- j + 1;
      t.[3] <- t.[3] `>>` (of_int 2)%W8;
      rp.[j] <- truncateu8 t.[3];
      j <- j + 1;
      i <- i + 4;
    }
    
    return rp;
  }

proc __poly_reduce(rp : W16.t Array256.t) : W16.t Array256.t = {
    var j : int;
    var t : W16.t;
    
    j <- 0;
    while (j < 256){
      t <- rp.[j];
      t <@ M(Syscall).__barrett_reduce(t);
      rp.[j] <- t;
      j <- j + 1;
    }
    
    return rp;
  }

  proc __polyvec_reduce(r : W16.t Array768.t) : W16.t Array768.t = {
    var aux : W16.t Array256.t;
    
    aux <@ __poly_reduce((init (fun (i : int) => r.[0 + i]))%Array256);
    r <- (init (fun (i : int) => if 0 <= i && i < 0 + 256 then aux.[i - 0] else r.[i]))%Array768;
    aux <@ __poly_reduce((init (fun (i : int) => r.[256 + i]))%Array256);
    r <- (init (fun (i : int) => if 256 <= i && i < 256 + 256 then aux.[i - 256] else r.[i]))%Array768;
    aux <@ __poly_reduce((init (fun (i : int) => r.[2 * 256 + i]))%Array256);
    r <- (init (fun (i : int) => if 2 * 256 <= i && i < 2 * 256 + 256 then aux.[i - 2 * 256] else r.[i]))%Array768;
    
    return r;
  }

    proc ref(bp : W16.t Array768.t) : W8.t Array960.t = {
       var rr : W8.t Array960.t;
       bp <@  __polyvec_reduce(bp);  
       rr <@ __i_polyvec_compress_ref(bp);
       return rr;
    }


}.

lemma compress10_equiv_avx2mem _ctp _mem :
   equiv [ AuxPolyVecCompress10.avx2_orig ~  AuxPolyVecCompress10.avx2 :
      ={bp} /\ ctp{1} = _ctp /\ Glob.mem{1} = _mem /\ valid_ptr (to_uint ctp{1}) (128 + 3 * 320) ==> 
         Glob.mem{1} = stores _mem (to_uint _ctp) (to_list res{2}) ].
proc => /=.
swap {2} 2 -1;seq 1 1 : #pre; 1: by conseq />;inline *;sim.
inline {1} 1; inline {2} 2.
wp.
while (Glob.mem{1} = stores _mem (to_uint _ctp) (take (i{2}*20) (to_list rp{2})) /\ aux{1} = 48 /\
         valid_ptr (to_uint r{1}) (128 + 3 * 320) /\ r{1} = _ctp /\
         ={i,a,aux,sllv_indx, shuffle, shift, mask10, b2, b1, b0} /\ 0 <= i{2} <= 48); last 
 by auto => />;smt(Array960.size_to_list List.take_size List.take0 storesE iota0). 

seq 3 3 : (#pre /\ ={lo,hi}); 
  1: by conseq />; sim. 
auto => /> &1 &2 ????;split;last  by smt().
rewrite /storeW32 /storeW128. 
apply mem_eq_ext => add.
rewrite !get_storesE !to_uintD_small /= !of_uintK /= 1,2:/# !modz_small 1..2:/#. 
rewrite !size_take 1,2:/# /= !size_to_list.
case ((to_uint _ctp <= add && add < to_uint _ctp + MIN ((i{1} + 1) * 20) 960)); last by smt().
move => *. 
case ((to_uint _ctp + MIN (i{1} * 20) 960) <= add && add < to_uint _ctp + MIN (i{1} * 20 + 16) 960).
+ move => *; rewrite ifF 1:/# ifT 1:/# mulrDl /= takeD 1,2:/# nth_cat !size_take 1:/# size_to_list . 
  have -> /= : add - to_uint _ctp < MIN (i{1} * 20) 960 = false by smt(). 
  rewrite /to_list drop_mkseq 1:/# take_mkseq 1:/# /= /(\o) /= /mkseq (nth_map witness) /=;1:smt(size_iota).
  rewrite nth_iota 1:/# initiE 1:/# get8_set32_directE 1,2:/# /= /get8 initiE 1:/# /= -/WArray960.get8 initiE 1:/# get8_set128_directE /#.
case ((to_uint _ctp + MIN (i{1} * 20+16) 960) <= add && add < to_uint _ctp + MIN (i{1} * 20 + 20) 960).
+ move => *; rewrite ifT 1:/# mulrDl /= takeD 1,2:/# nth_cat !size_take 1:/# size_to_list . 
  have -> /= : add - to_uint _ctp < MIN (i{1} * 20) 960 = false by smt(). 
  rewrite /to_list drop_mkseq 1:/# take_mkseq 1:/# /= /(\o) /= /mkseq (nth_map witness) /=;1:smt(size_iota).
  rewrite nth_iota 1:/# initiE 1:/# get8_set32_directE 1,2:/# /= /get8 initiE 1:/# /= -/WArray960.get8 initiE 1:/# get8_set128_directE /#.
case (to_uint _ctp <= add && add < to_uint _ctp + MIN (i{1} * 20) 960); last by smt().
move => *; rewrite ifF 1:/# ifF 1:/# mulrDl /= /to_list !take_mkseq 1,2:/# /= /mkseq !(nth_map witness); 1,2: smt(size_iota). 
rewrite !nth_iota 1,2:/# initiE 1:/# get8_set32_directE 1,2:/# /get8 !initiE 1,2:/# /= -/WArray960.get8 get8_set128_directE 1,2:/# /get8 initiE /#.
qed.

lemma poly_reduce_noloops :
  equiv [ AuxPolyVecCompress10.__poly_reduce ~ M(Syscall).__poly_reduce :
   ={arg} ==> ={res} ].
proc => /=.
while (#pre /\ 0<=j{1} <= 256 /\ j{1} = to_uint j{2}); last by auto.
inline *;auto => /> &2; rewrite !W64.ultE /= => *;do split;1..2:smt();by rewrite to_uintD_small  /=; smt(). 
qed.

lemma polyvec_reduce_noloops :
  equiv [ AuxPolyVecCompress10.__polyvec_reduce ~ M(Syscall).__polyvec_reduce :
   ={arg} ==> ={res} ].
proc => /=.
by do 3!(wp;call poly_reduce_noloops);auto => />.
qed.

lemma poly_csubq_noloops :
  equiv [ AuxPolyVecCompress10._poly_csubq_ref ~ M(Syscall)._poly_csubq :
   ={arg} ==> ={res} ].
proc => /=.
while (#pre /\ 0<=i{1} <= 256 /\ i{1} = to_uint i{2}); last by auto.
inline *;auto => /> &2; rewrite !W64.ultE /= => *;do split;1..2:smt();by rewrite to_uintD_small  /=; smt(). 
qed.

lemma polyvec_csubq_noloops :
  equiv [ AuxPolyVecCompress10.__polyvec_csubq_ref ~ M(Syscall).__polyvec_csubq :
   ={arg} ==> ={res} ].
proc => /=.
by do 3!(wp;call poly_csubq_noloops);auto => />.
qed.

lemma compress10_equiv_refmem _ctp _mem :
   equiv [ AuxPolyVecCompress10.ref ~  AuxPolyVecCompress10.ref_orig :
      ={bp} /\ ctp{2} = _ctp /\ Glob.mem{2} = _mem /\ valid_ptr (to_uint ctp{2}) (128 + 3 * 320) ==> 
         Glob.mem{2} = stores _mem (to_uint _ctp) (to_list res{1}) ].
 proc => /=. 
seq 1 1 : #pre; 1: by call polyvec_reduce_noloops => />.
inline {1} 1; inline {2} 1.
swap {1} 3 -1; swap {1} 4 -2; swap {2} [2..3] -1; swap {2} 7 -4.
seq 2 3 : (#pre /\ ={aa});1:by call polyvec_csubq_noloops;auto => />.
wp;while (0 <= i{1} <= 768 /\ i{1} = to_uint i{2} /\ valid_ptr (to_uint rp{2}) (128 + 3 * 320)  /\
       0 <= j{1} <= 960 /\ j{1} = to_uint j{2} /\ rp{2} = _ctp /\
       j{1} *4 = i{1} * 5 /\ ={aa} /\
       Glob.mem{2} = stores _mem (to_uint _ctp) (take j{1} (to_list rp{1}))); last 
   by auto => />; smt(Array960.size_to_list List.take_size List.take0 storesE iota0). 
unroll for {2} 2;auto => /> &1 &2;rewrite !ultE /= => ?????????;do split;1,2,4,5:smt();1..3,5..:by rewrite ?to_uintD_small;smt().
rewrite /storeW8 /=.
apply mem_eq_ext => adr.
 rewrite !to_uintD_small /= 1..16:/# !addrA.
rewrite !get_storesE.
case (to_uint _ctp + to_uint j{2} <= adr < to_uint _ctp + to_uint j{2} + 5); last first.
case (to_uint _ctp <= adr < to_uint _ctp + to_uint j{2}); last first. 
+ move => *;do 5!(rewrite get_set_neqE_s 1:/#).
  rewrite !size_take 1:/# size_to_list /= ifF 1:/# get_storesE /= size_take 1:/# size_to_list /#. 
+ move => *.
   move => *;do 5!(rewrite get_set_neqE_s 1:/#).
  rewrite !size_take 1:/# size_to_list /= ifT 1:/# nth_take 1,2:/# /to_list nth_mkseq 1:/# /= get_storesE size_take 1:/# size_mkseq /= ifT 1:/#. 
  by rewrite nth_take 1,2:/# nth_mkseq 1:/# /=; smt(Array960.get_setE). 
move => *; rewrite size_take 1:/# size_to_list ifT 1:/# nth_take 1,2:/# /to_list nth_mkseq 1:/# /=.
by smt(Array960.get_setE get_set_neqE_s get_set_eqE_s).
qed.

lemma compress10_equiv_avx2i  :
   equiv [ AuxPolyVecCompress10.avx2_orig_i ~  AuxPolyVecCompress10.avx2 :
      ={bp} ==> ={res} ].
proc => /=.
swap {2} 2 -1.
seq 1 1 : #pre; 1: by sim.
inline *;wp.
while (={i,a,bp,b0,b1,b2,mask10,shift,sllv_indx,shuffle,aux} /\ 0<=i{1} <= 48 /\ aux{1}=48 /\ (forall k, 0<=k<i{1}*20 => rp{1}.[k] = rp{2}.[k]));
  last by  auto => /> *; split;[ smt() | move => *; rewrite tP => *;smt()].
auto => /> &1 &2 *;split;1:smt().
move => k kbl kbh; rewrite !initiE 1,2:/# /=.
rewrite !get8_set32_directE 1..4:/#. 
case (0<=k<i{2}*20). 
+ move => *; rewrite !ifF 1,2:/# /get8 !initiE 1..4:/# /=. 
  rewrite -/WArray960.get8 !get8_set128_directE 1..4:/# !ifF 1,2:/#. 
  by rewrite /get8 !initiE /#.
move => *;case (i{2}*20<=k<i{2}*20+16). 
+ move => *; rewrite !ifF 1,2:/# /get8 !initiE 1..4:/# /=. 
  by rewrite -/WArray960.get8 !get8_set128_directE 1..4:/# !ifT /#. 
by smt().
qed.

lemma compress10_equiv_refi  :
   equiv [ AuxPolyVecCompress10.ref ~  AuxPolyVecCompress10.ref_orig_i :
      ={bp} ==> ={res} ].
proc. 
seq 1 1 : #pre; 1: by call polyvec_reduce_noloops => />.
inline {1} 1; inline {2} 1.
swap {1} 4 -2;swap {2} [2..3] -1; swap {2} 7 -4.
seq 2 3 : (#pre /\ ={aa});1:by call polyvec_csubq_noloops;auto => />.
wp;while (0 <= i{1} <= 768 /\ i{1} = to_uint i{2} /\ 
       0 <= j{1} <= 960 /\ j{1} = to_uint j{2} /\
       j{1} *4 = i{1} * 5 /\ ={aa} /\
       (forall kk, 0 <= kk < j{1} => rp{1}.[kk] = rp{2}.[kk])); last by  auto => />*; split;[ smt() | move => *; rewrite tP => *; smt()].
unroll for {2} 2;auto => /> &1 &2;rewrite !ultE /= => ????????;do split; 1,2,4,5:smt();1..3,5..:by rewrite ?to_uintD_small;smt().
move => kk kkb ?.
rewrite !to_uintD_small /=;1..7:smt().
case (kk < to_uint j{2}); by smt(Array960.get_setE).
qed.

(*****************************************************************)


require import Bindings.
(* BINDINGS *)

bind array Array256."_.[_]" Array256."_.[_<-_]" Array256.to_list Array256.of_list Array256.t 256.
realize tolistP by done.
realize get_setP by smt(Array256.get_setE). 
realize eqP by smt(Array256.tP).
realize get_out by smt(Array256.get_out).


bind array Array768."_.[_]" Array768."_.[_<-_]" Array768.to_list Array768.of_list Array768.t 768.
realize tolistP by done.
realize get_setP by smt(Array768.get_setE). 
realize eqP by smt(Array768.tP).
realize get_out by smt(Array768.get_out).

bind array Array32."_.[_]" Array32."_.[_<-_]" Array32.to_list Array32.of_list Array32.t 32.
realize tolistP by done.
realize get_setP by smt(Array32.get_setE). 
realize eqP by smt(Array32.tP).
realize get_out by smt(Array32.get_out).

bind array Array960."_.[_]" Array960."_.[_<-_]" Array960.to_list Array960.of_list Array960.t 960.
realize tolistP by done.
realize get_setP by smt(Array960.get_setE). 
realize eqP by smt(Array960.tP).
realize get_out by smt(Array960.get_out).

bind array Array1088."_.[_]" Array1088."_.[_<-_]" Array1088.to_list Array1088.of_list Array1088.t 1088.
realize tolistP by done.
realize get_setP by smt(Array1088.get_setE). 
realize eqP by smt(Array1088.tP).
realize get_out by smt(Array1088.get_out).

bind array Array4."_.[_]" Array4."_.[_<-_]" Array4.to_list Array4.of_list Array4.t 4.
realize tolistP by done.
realize get_setP by smt(Array4.get_setE). 
realize eqP by smt(Array4.tP).
realize get_out by smt(Array4.get_out).


op init_256_16 (f: int -> W16.t) : W16.t Array256.t = Array256.init f.

bind op [W16.t & Array256.t] init_256_16 "ainit". 
realize bvainitP by admit. (* Not provable *)


op init_768_16 (f: int -> W16.t) : W16.t Array768.t = Array768.init f.

bind op [W16.t & Array768.t] init_768_16 "ainit".
realize bvainitP by admit. (* Not provable *)

op init_4_64 (f: int -> W64.t) : W64.t Array4.t = Array4.init f.

bind op [W64.t & Array4.t] init_4_64 "ainit".
realize bvainitP by admit. (* Not provable *)

op init_960_8 (f: int -> W8.t) : W8.t Array960.t = Array960.init f.

bind op [W8.t & Array960.t] init_960_8 "ainit".
realize bvainitP by admit. (* Not provable *)

op init_1088_8 (f: int -> W8.t) : W8.t Array1088.t = Array1088.init f.

bind op [W8.t & Array1088.t] init_1088_8 "ainit".
realize bvainitP by admit. (* Not provable *)

op sliceget256_16_256 (arr: W16.t Array256.t) (i: int) : W256.t = WArray512.get256 (WArray512.init16 (fun (i_0 : int) => arr.[i_0])) (i %/ 256).

bind op [W16.t & W256.t & Array256.t] sliceget256_16_256 "asliceget".
realize bvaslicegetP  by admit.

op sliceset256_16_256 (arr: W16.t Array256.t) (i: int) (bv: W256.t) : W16.t Array256.t = Array256.init (fun (i3 : int) => get16 (set256 ((init16 (fun (i_0 : int) => arr.[i_0])))%WArray512 (i %/ 256) bv) i3).

bind op [W16.t & W256.t & Array256.t] sliceset256_16_256 "asliceset".
realize bvaslicesetP by admit.

op sliceget32_8_256 (arr: W8.t Array32.t) (i: int) : W256.t = get256 (WArray32.init8 (fun (i_0 : int) => pvc_shufbidx_s.[i_0])) (i%/256).

bind op [W8.t & W256.t & Array32.t] sliceget32_8_256 "asliceget".
realize bvaslicegetP by admit.

op sliceget768_16_256 (arr: W16.t Array768.t) (i: int) : W256.t = get256 (WArray1536.init16 (fun (i_0 : int) => arr.[i_0])) (i %/ 256). 

bind op [W16.t & W256.t & Array768.t] sliceget768_16_256 "asliceget".
realize bvaslicegetP by admit.

op sliceset960_8_128 (arr: W8.t Array960.t) (i: int) (bv: W128.t) : W8.t Array960.t = Array960.init (get8 (set128_direct ((init8 (fun (i_0 : int) => arr.[i_0])))%WArray960 (i %/ 8) bv)).

bind op [W8.t & W128.t & Array960.t] sliceset960_8_128 "asliceset".
realize bvaslicesetP by admit.


op sliceset960_8_32 (arr: W8.t Array960.t) (i: int) (bv: W32.t) : W8.t Array960.t = Array960.init
     (WArray960.get8
        (set32_direct (WArray960.init8 (fun (i_0 : int) => arr.[i_0])) (
           i %/ 8) bv)).


bind op [W8.t & W32.t & Array960.t] sliceset960_8_32 "asliceset".
realize bvaslicesetP by admit.


theory W10.
abbrev [-printing] size = 10.
clone include BitWordSH with op size <- size
rename "_XX" as "_10"
proof gt0_size by done,
size_le_256 by done.

end W10. export W10 W10.ALU W10.SHIFT.

import BitEncoding.BS2Int.
bind bitstring W10.w2bits W10.bits2w W10.to_uint W10.to_sint W10.of_int W10.t 10.
realize size_tolist by auto.
realize tolistP by auto.
realize oflistP by smt(W10.bits2wK). 
realize ofintP by move => *;rewrite /of_int int2bs_mod.
realize tosintP. move => bv /=;rewrite /to_sint /smod /BVA_Top_W10_t.msb.
have -> /=: nth false (w2bits bv) (10 - 1) = 2 ^ (10 - 1) <= to_uint bv; last by smt().
rewrite /to_uint. 
rewrite -{2}(cat_take_drop 9 (w2bits bv)).
rewrite bs2int_cat size_take // W10.size_w2bits /=.
rewrite -bs2int_div //= get_to_uint //=.
rewrite -bs2int_mod // /= /to_uint.
have ? : 2^10 = 1024 by rewrite /=.
by smt(bs2int_range mem_range W10.size_w2bits).
qed.
realize touintP by smt().

op truncate64_10 (bw: W64.t) : W10.t = W10.bits2w (W64.w2bits bw).

bind op [W64.t & W10.t] truncate64_10 "truncate".
realize bvtruncateP. 
move => mv. rewrite /truncate64_10 /W64.w2bits take_mkseq //= /w2bits.
apply (eq_from_nth witness);1: by smt(size_mkseq).
move => i; rewrite size_mkseq /= /max /= => ib.
by rewrite !nth_mkseq // /bits2w initiE //= nth_mkseq /#.  
qed.

bind op [W64.t & W8.t] W8u8.truncateu8 "truncate".
realize bvtruncateP. 
move => mv; rewrite /truncateu8 /W64.w2bits take_mkseq //= /w2bits.
apply (eq_from_nth witness);1: by smt(size_mkseq).
move => i; rewrite size_mkseq /= /max /= => ib.
rewrite !nth_mkseq // /of_int /to_uint /= get_bits2w // nth_mkseq //=. 
rewrite get_to_uint //= /to_uint.
have -> /=: (0 <= i && i < 64) by smt().
pose a := bs2int (w2bits mv).
admit.
qed.

bind op [W16.t & W8.t] W2u8.truncateu8 "truncate".
realize bvtruncateP by admit.

bind op [W16.t & W64.t] W4u16.zeroextu64 "zextend".
realize bvzextendP by admit.

bind op [W64.t & W16.t] W4u16.truncateu16 "truncate".
realize bvtruncateP by admit.

op sll_64 (w1 w2 : W64.t) : W64.t =
  w1 `<<` (truncateu8 w2).

bind op [W64.t] sll_64 "shl".
realize bvshlP by  admit.

bind op [W32.t & W16.t] W2u16.truncateu16 "truncate".
realize bvtruncateP by admit.


bind op [W16.t & W32.t] sigextu32 "sextend".
realize bvsextendP by admit.

bind op [W32.t & W8.t] W4u8.truncateu8 "truncate".
realize bvtruncateP by admit. 

bind circuit VPBROADCAST_8u32 "VPBROADCAST_8u32".
bind circuit VPBROADCAST_4u64 "VPBROADCAST_4u64".

bind circuit VPMADDWD_256 "VPMADDWD_16u16".

bind circuit VPSLLV_8u32 "VPSLLV_8u32".

bind circuit VPSRL_4u64 "VPSRL_4u64".

bind circuit VPSHUFB_256 "VPSHUFB_256".

bind circuit VEXTRACTI128 "VEXTRACTI128".

bind circuit VPBLENDW_128 "VPBLEND_8u16".

bind circuit VPEXTR_32 "VEXTRACTI32_256".

bind circuit W4u32.VPEXTR_32 "VEXTRACTI32_128".

bind op [W256.t & W128.t] truncateu128 "truncate".
realize bvtruncateP by admit.

op sra_32 (w1 w2 : W32.t) : W32.t =
  w1 `|>>` (truncateu8 w2).

bind op [W32.t] sra_32 "ashr".
realize bvashrP by admit.

op sra_16 (w1 w2 : W16.t) : W16.t =
  w1 `|>>` (truncateu8 w2).

bind op [W16.t] sra_16 "ashr".
realize bvashrP by admit.

op srl_16 (w1 w2 : W16.t) : W16.t =
  w1 `>>` (truncateu8 w2).

bind op [W16.t] srl_16 "shr".
realize bvshrP by admit.

op sll_16 (w1 w2 : W16.t) : W16.t =
  w1 `<<` (truncateu8 w2).

bind op [W16.t] sll_16 "shl".
realize bvshlP by admit.

op srl_64 (w1 w2 : W64.t) : W64.t =
  w1 `>>` (truncateu8 w2).

bind op [W64.t] srl_64 "shr".
realize bvshrP by admit.

op lane_func_reduce(c : W16.t) : W16.t =  
    let t =  (sigextu32 c)  * (W32.of_int 20159) in
    let t = (sra_32 t (W32.of_int 26)) in
    let t = (t * (W32.of_int 3329)) in 
    let r = (W16_sub c  (W2u16.truncateu16 t)) in r. 

op lane_func_csubq(c : W16.t) : W16.t = if (c \ult W16.of_int 3329) then c else (W16_sub c (W16.of_int 3329)).

op lane_func_compress10(x : W16.t) : W10.t = truncate64_10 (
   srl_64 (((sll_64 (W4u16.zeroextu64 (lane_func_csubq x)) (W64.of_int 10)) + W64.of_int 1665) * (W64.of_int 1290167)) (W64.of_int 32)). 

op lane_polyvec_redcomp10(w : W16.t) : W10.t = lane_func_compress10 (lane_func_reduce w). 

op pcond_all (w: W16.t) = true.
op pcond_reduced (w: W16.t) = w \ule W16.of_int (2*3329).

lemma reduce_commutes x xr : xr = lane_func_reduce x => pcond_reduced xr.
rewrite /lane_func_reduce /pcond_reduced. print Fq.SignedReductions.
have := Fq.SignedReductions.BREDCp_corr (to_sint x) 26 _ _ _ _ _ _; rewrite ?qE /R //=.
+ admit. smt().
  rewrite /BREDC.
  admit.
qed.

import BitEncoding.BitChunking.
lemma ref_polyvec_reduce (_r : W16.t Array768.t) : hoare [ AuxPolyVecCompress10.__polyvec_reduce : r = _r ==> 
  map lane_func_reduce
      (map W16.bits2w (chunk 16 (flatten [flatten (map W16.w2bits (to_list _r))]))) =
    map W16.bits2w (chunk 16 (flatten [flatten (map W16.w2bits (to_list res))]))].
proc. 
inline *.
proc change 1 : (init_256_16 (fun i => r.[i]));1: by auto.
proc change ^while{1}.5 : (sra_32 t2 (W32.of_int 26));1: by auto.
proc change ^while{1}.9 : (W16_sub r0 (truncateu16 t2));1: by auto.
proc change 5 : (init_768_16 (fun i => if 0 <= i < 256 then aux.[i] else r.[i]));1: by auto.
proc change 6 : (init_256_16 (fun i => r.[256+i]));1: by auto.
proc change ^while{2}.5 : (sra_32 t3 (W32.of_int 26));1: by auto.
proc change ^while{2}.9 : (W16_sub r1 (truncateu16 t3));1: by auto.
proc change 10 : (init_768_16 (fun i => if 256 <= i < 512 then aux.[i-256] else r.[i]));1: by auto.
proc change 11 : (init_256_16 (fun i => r.[512+i]));1: by auto.
proc change ^while{3}.5 : (sra_32 t4 (W32.of_int 26));1: by auto.
proc change ^while{3}.9 : (W16_sub r2 (truncateu16 t4));1: by auto.
proc change 15 : (init_768_16 (fun i => if 512 <= i < 768 then aux.[i-512] else r.[i]));1: by auto.
do 3!(unroll for ^while).
cfold 2818.
cfold 5637.
cfold 8456.
wp 8457.
bdep 16 16 [_r] [r] [r]  lane_func_reduce pcond_all.
+ by move => *;rewrite /pcond_all -/predT;smt(all_predT).
by smt().
qed.


lemma ref_polyvec_compress (_a : W16.t Array768.t) : hoare [ AuxPolyVecCompress10.__i_polyvec_compress_ref : 
 a = _a /\ all pcond_reduced (map W16.bits2w (chunk 16 (flatten [flatten (map W16.w2bits (to_list _a))]))) ==>
map lane_func_compress10 (map W16.bits2w (chunk 16 (flatten [flatten (map W16.w2bits (to_list _a))]))) =
    map W10.bits2w (chunk 10 (flatten [flatten (map W8.w2bits (to_list res))]))].
proc. 
inline *. 
proc change 1 : (init_960_8 (fun i => W8.zero));1: by auto.
proc change 2 : (init_4_64 (fun i => W64.zero));1: by auto.
proc change 4 : (init_256_16 (fun i => r.[i]));1: by auto.
proc change ^while.2: (W16_sub t0 qlocal);1: by auto.
proc change ^while.4 : (sra_16 b0 (W16.of_int 15));1: by auto.
proc change 8 : (init_768_16 (fun i => if 0 <= i < 256 then aux0.[i] else r.[i]));1: by auto.
proc change 9 : (init_256_16 (fun i => r.[256+i]));1: by auto.
proc change ^while{2}.2: (W16_sub t1 qlocal);1: by auto.
proc change ^while{2}.4 : (sra_16 b1 (W16.of_int 15));1: by auto.
proc change 13 : (init_768_16 (fun i => if 256 <= i < 512 then aux0.[i-256] else r.[i]));1: by auto.
proc change 14 : (init_256_16 (fun i => r.[512+i]));1: by auto.
proc change ^while{3}.2: (W16_sub t2 qlocal);1: by auto.
proc change ^while{3}.4 : (sra_16 b2 (W16.of_int 15));1: by auto.
proc change 18 : (init_768_16 (fun i => if 512 <= i < 768 then aux0.[i-512] else r.[i]));1: by auto.
proc change ^while{4}.2 :  (t.[0 <- sll_64 t.[0] (W64.of_int 10)]);1: by auto.
proc change ^while{4}.5 :  (t.[0 <- srl_64 t.[0] (W64.of_int 32)]);1: by auto.
proc change ^while{4}.8 :  (t.[1 <- sll_64 t.[1] (W64.of_int 10)]);1: by auto.
proc change ^while{4}.11 : (t.[1 <- srl_64 t.[1] (W64.of_int 32)]);1: by auto.
proc change ^while{4}.14 : (t.[2 <- sll_64 t.[2] (W64.of_int 10)]);1: by auto.
proc change ^while{4}.17 : (t.[2 <- srl_64 t.[2] (W64.of_int 32)]);1: by auto.
proc change ^while{4}.20 : (t.[3 <- sll_64 t.[3] (W64.of_int 10)]);1: by auto.
proc change ^while{4}.23 : (t.[3 <- srl_64 t.[3] (W64.of_int 32)]);1: by auto.
proc change ^while{4}.30 : (srl_16 b (W16.of_int 8));1: by auto.
proc change ^while{4}.32 : (sll_16 c (W16.of_int 2));1: by auto.
proc change ^while{4}.37 : (srl_16 b (W16.of_int 6));1: by auto.
proc change ^while{4}.39 : (sll_16 c (W16.of_int 4));1: by auto.
proc change ^while{4}.44 : (srl_16 b (W16.of_int 4));1: by auto.
proc change ^while{4}.46 : (sll_16 c (W16.of_int 6));1: by auto.
proc change ^while{4}.50 : (t.[3 <- srl_64 t.[3] (W64.of_int 2)]);1: by auto.

do 4!(unroll for ^while).

cfold 1797.
cfold 3592.
cfold 5387.
cfold 5390.
wp 14413.
bdep 16 10 [_a] [a] [rp]  lane_func_compress10 pcond_reduced. 
by smt(). by smt().
qed.

lemma ref_correctness (_bp : W16.t Array768.t) : hoare [ AuxPolyVecCompress10.ref :
_bp = bp ==> 
map lane_polyvec_redcomp10 (map W16.bits2w (chunk 16 (flatten [flatten (map W16.w2bits (to_list _bp))]))) =
    map W10.bits2w (chunk 10 (flatten [flatten (map W8.w2bits (to_list res))]))
].
proof.
proc.
ecall (ref_polyvec_compress bp).
ecall (ref_polyvec_reduce bp).
auto => />. 
move => inter Hreduce;split.
+ rewrite -Hreduce allP => x.
  rewrite mapP => exm;elim exm => xrep.
  rewrite mapP => exmm;elim exmm => xxrep.
  by smt(reduce_commutes).
move => preCompress fin.
rewrite -Hreduce => <-. 
by rewrite map_comp /=.
qed.

lemma avx_correctness (_bp : W16.t Array768.t) : hoare [ AuxPolyVecCompress10.avx2 : _bp = bp ==> 
map lane_polyvec_redcomp10 (map W16.bits2w (chunk 16 (flatten [flatten (map W16.w2bits (to_list _bp))]))) =
    map W10.bits2w (chunk 10 (flatten [flatten (map W8.w2bits (to_list res))]))].
proof.
proc.
inline *.
proc change 1 : (init_1088_8 (fun i => W8.zero));1: by auto. 
proc change 3 : (init_256_16 (fun i => r.[i]));1: by auto.
proc change ^while.1 : (sliceget256_16_256 ap (i0*256));1: by smt().
proc change ^while.11 : (sliceset256_16_256 ap (i0*256) a1);1: by smt().

proc change 10 : (init_768_16 (fun i => if 0 <= i && i < 256 then aux.[i] else r.[i]));1: by auto.
proc change 11 : (init_256_16 (fun i => r.[256 + i]));1: by auto.
proc change ^while{2}.1 : (sliceget256_16_256 ap0 (i1*256));1: by smt().
proc change ^while{2}.11 : (sliceset256_16_256 ap0 (i1*256) a2);1: by smt().

proc change 18 : (init_768_16 (fun i => if 256 <= i && i < 256 + 256 then aux.[i - 256] else r.[i]));1: by auto.
proc change 19 : (init_256_16 (fun i => r.[2*256 + i]));1: by auto.
proc change ^while{3}.1 : (sliceget256_16_256 ap1 (i2*256));1: by smt().
proc change ^while{3}.11 : (sliceset256_16_256 ap1 (i2*256) a3);1: by smt().

proc change 26 : (init_768_16 (fun i => if 2 * 256 <= i < 3 * 256 then aux.[i - 2 * 256] else r.[i]));1: by auto.

proc change 30 : (init_960_8 (fun i_0 => ctp0.[i_0 + 0]));1: by done.
proc change 37 : (sliceget32_8_256 pvc_shufbidx_s 0);1: by auto.

proc change ^while{4}.1 : (sliceget768_16_256 a (i*256));1: by smt().

proc change ^while{4}.25 : (sliceset960_8_128 rp (i * 160) lo); 1: by smt().
proc change ^while{4}.26 : (sliceset960_8_32 rp (i * 160 + 128) (VPEXTR_32 hi W8.zero));1: by smt().
cfold 38.
unroll for 39.
unroll for 24. 
unroll for 16. 
unroll for 8. 
cfold 183.
cfold 365.
cfold 547.
wp 1807. 
bdep 16 10 [_bp] [bp] [rp] lane_polyvec_redcomp10 pcond_all. 
+ by move => *;rewrite /pcond_all -/predT;smt(all_predT).
+ by smt().
qed.

lemma ref_correctness_p (_bp : W16.t Array768.t) : phoare [ AuxPolyVecCompress10.ref :
_bp = bp ==> 
map lane_polyvec_redcomp10 (map W16.bits2w (chunk 16 (flatten [flatten (map W16.w2bits (to_list _bp))]))) =
    map W10.bits2w (chunk 10 (flatten [flatten (map W8.w2bits (to_list res))]))
] = 1%r.
admitted.

lemma avx_correctness_p (_bp : W16.t Array768.t) : phoare [ AuxPolyVecCompress10.avx2 : _bp = bp ==> 
map lane_polyvec_redcomp10 (map W16.bits2w (chunk 16 (flatten [flatten (map W16.w2bits (to_list _bp))]))) =
    map W10.bits2w (chunk 10 (flatten [flatten (map W8.w2bits (to_list res))]))] = 1%r.
admitted.

(* MAP REDUCE GOAL *)
lemma compress10_mr : 
  equiv [AuxPolyVecCompress10.avx2 ~ AuxPolyVecCompress10.ref : lift_array768 bp{1} = lift_array768 bp{2}==> ={res}].
proc*.
exlim bp{1}, bp{2} => _bp1 _bp2.
call{1} (avx_correctness_p _bp1).
call{2} (ref_correctness_p _bp2).
auto => /> Hpre r1 Hr1 r2 Hr2.
admit.
qed.

(*****************************************************************)

lemma compress10_equiv :
   equiv [ AuxPolyVecCompress10.avx2_orig ~  AuxPolyVecCompress10.ref_orig :
      lift_array768 bp{1} = lift_array768 bp{2} /\ valid_ptr (to_uint ctp{1}) (128 + 3 * 320) /\ ={ctp,Glob.mem} ==>  ={Glob.mem}].
proof. 
proc* => /=.
exlim  Glob.mem{1}, ctp{1} => _mem _ctp.
transitivity {1} { r <@ AuxPolyVecCompress10.avx2(bp); } 
      (={bp} /\ ctp{1} = _ctp /\ Glob.mem{1} = _mem /\ valid_ptr (to_uint ctp{1}) (128 + 3 * 320) ==> 
         Glob.mem{1} = stores _mem (to_uint _ctp) (to_list r{2}))
      (lift_array768 bp{1} = lift_array768 bp{2} /\ ctp{2} = _ctp /\ Glob.mem{2} = _mem /\ valid_ptr (to_uint ctp{2}) (128 + 3 * 320) ==>  Glob.mem{2} = stores _mem (to_uint _ctp) (to_list r{1}));
   [ by smt() | by smt() | by call (compress10_equiv_avx2mem _ctp _mem); auto => /> |].
transitivity {2} { r <@ AuxPolyVecCompress10.ref(bp); } 
    (lift_array768 bp{1} = lift_array768 bp{2} ==> ={r})
      (={bp} /\ ctp{2} = _ctp /\ Glob.mem{2} = _mem /\ valid_ptr (to_uint ctp{2}) (128 + 3 * 320) ==>  Glob.mem{2} = stores _mem (to_uint _ctp) (to_list r{1}));
   [ by smt() | by smt() | |  by call (compress10_equiv_refmem _ctp _mem); auto => />].
by call compress10_mr; auto => />.
qed.

lemma compress10_equiv_i :
   equiv [ AuxPolyVecCompress10.avx2_orig_i ~  AuxPolyVecCompress10.ref_orig_i :
      lift_array768 bp{1} = lift_array768 bp{2} /\ ={ctp} ==>  ={res}].
proof. 
proc* => /=.
exlim  Glob.mem{1}, ctp{1} => _mem _ctp.
transitivity {1} { r <@ AuxPolyVecCompress10.avx2(bp); } 
      (={bp,ctp} ==> ={r})
      (lift_array768 bp{1} = lift_array768 bp{2} /\ ={ctp} ==> ={r});
   [ by smt() | by smt() | by call (compress10_equiv_avx2i); auto => /> |].
transitivity {2} { r <@ AuxPolyVecCompress10.ref(bp); } 
    (lift_array768 bp{1} = lift_array768 bp{2} /\ ={ctp} ==> ={r})
      (={bp,ctp}  ==>  ={r});
   [ by smt() | by smt() | |  by call (compress10_equiv_refi); auto => />].
by call compress10_mr; auto => />.
qed.
import InnerPKE.
lemma mlkem_correct_enc_0_avx2 mem _ctp _pkp : 
   equiv [Jkem_avx2.M(Jkem_avx2.Syscall).__indcpa_enc_0 ~ InnerPKE.enc_derand: 
     valid_ptr _pkp (384*3 + 32) /\
     valid_ptr _ctp (3*320+128) /\
     Glob.mem{1} = mem /\ 
     msgp{1} = m{2} /\ 
     to_uint sctp{1} = _ctp /\ 
     to_uint pkp{1} = _pkp /\
     noiseseed{1} = coins{2} /\
     pk{2}.`1 = load_array1152 mem _pkp /\
     pk{2}.`2 = load_array32 mem (_pkp + 3*384)
       ==> 
     touches Glob.mem{1} mem _ctp (3*320+128) /\
     let (c1,c2) = res{2} in
     c1 = load_array960 Glob.mem{1} _ctp /\
     c2 = load_array128 Glob.mem{1} (_ctp + 960)
].
proc*.
transitivity {1} {Jkem.M(Jkem.Syscall).__indcpa_enc(sctp,msgp,pkp,noiseseed);} 
(={Glob.mem,msgp,pkp,noiseseed,sctp} /\
  valid_ptr _pkp (384 * 3 + 32) /\
  valid_ptr _ctp (3 * 320 + 128) /\
  Glob.mem{1} = mem /\
  to_uint sctp{1} = _ctp /\
  to_uint pkp{1} = _pkp
   ==> ={Glob.mem,r}) 
( valid_ptr _pkp (384 * 3 + 32) /\
  valid_ptr _ctp (3 * 320 + 128) /\
  Glob.mem{1} = mem /\
  msgp{1} = m{2} /\
  to_uint sctp{1} = _ctp /\
  to_uint pkp{1} = _pkp /\
  noiseseed{1} = coins{2} /\
  pk{2}.`1 = load_array1152 mem _pkp /\ 
  pk{2}.`2 = load_array32 mem (_pkp + 3 * 384)
  ==>
  touches Glob.mem{1} mem _ctp (3*320+128) /\
  let (c1, c2) = r{2} in 
      c1 = load_array960 Glob.mem{1} _ctp /\ 
      c2 = load_array128 Glob.mem{1} (_ctp + 960)); 1,2: smt();  
   last by call(mlkem_correct_enc mem _ctp _pkp); auto => />. 

inline{1} 1; inline {2} 1. wp.

seq 50 59 : (={ctp,Glob.mem} /\
     pos_bound256_cxq v{1} 0 256 2 /\
     pos_bound256_cxq v{2} 0 256 2 /\
    lift_array256 v{1} = lift_array256 v{2} /\ 
    valid_ptr (to_uint ctp{1}) 128); last by
  exists *Glob.mem{1}, (to_uint ctp{1}); elim* => memm _p; call (compressequiv memm _p); auto.

swap {1} 47 1.
swap {2} 55 2.

seq 47 56 : (={ctp,Glob.mem} /\
     pos_bound256_cxq v{1} 0 256 2 /\
     pos_bound256_cxq v{2} 0 256 2 /\
    lift_array256 v{1} = lift_array256 v{2} /\ 
    lift_array768 bp{1} = lift_array768 bp{2} /\ 
    valid_ptr (to_uint ctp{1}) (128+3*320)); last first. 
wp; conseq (: _ ==> ={Glob.mem}).
+ auto => /> &1 &2 *; do split;1,2:
    smt (W64.to_uintD_small W64.of_uintK W64.to_uint_cmp pow2_64). 
  transitivity {1} { AuxPolyVecCompress10.avx2_orig(ctp,bp); }
    (={bp,ctp,Glob.mem} ==> ={Glob.mem})
    ( lift_array768 bp{1} = lift_array768 bp{2} /\ valid_ptr (to_uint ctp{1}) (128 + 3 * 320)  /\ ={ctp,Glob.mem} ==> ={Glob.mem});
      [ smt() | smt() | by inline*;sim |].
  transitivity {2} { AuxPolyVecCompress10.ref_orig(ctp,bp); }
    ( lift_array768 bp{1} = lift_array768 bp{2} /\ valid_ptr (to_uint ctp{1}) (128 + 3 * 320)  /\ ={ctp,Glob.mem} ==> ={Glob.mem})
    (={bp,ctp,Glob.mem} ==> ={Glob.mem});
      [ smt() | smt() |  | by inline *;sim].
  by call compress10_equiv;auto => />.

wp;conseq />.
call (reduceequiv_noperm).
call (addequiv_noperm 4 2 _ _) => //.
call (addequiv_noperm 2 2 _ _) => //.

have H := polyvec_add2_equiv_noperm 2 2 _ _ => //.
ecall (H (lift_array768 bp{2}) (lift_array768 ep{2})); clear H.


unroll for {1} 39.

swap {1} 3 -2; swap {2} 3 -2; seq 1 1: (#pre /\ ={pkp0} /\ pkp0{2}=pkp{1}); 1: by auto.
sp 3 3.
swap {1} 17 2.
seq 18 17  : (#pre /\ ={publicseed, bp,ep,epp,v,sp_0,k} /\
           s_noiseseed{2} = noiseseed0{2} /\
           pos_bound256_cxq k{1} 0 256 1 /\
           pos_bound256_cxq k{2} 0 256 1 /\
           lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\
           pos_bound768_cxq pkpv{1} 0 768 2 /\
           pos_bound768_cxq pkpv{2} 0 768 2 /\
           aat{1} = nttunpackm aat{2} /\
           pos_bound2304_cxq aat{1} 0 2304 2 /\
           pos_bound2304_cxq aat{2} 0 2304 2). 
+ call (genmatrixequiv true).
  wp;call frommsgequiv_noperm. conseq />. smt().
  conseq (_: _ ==> lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\
       pos_bound768_cxq pkpv{1} 0 768 2 /\ pos_bound768_cxq pkpv{2} 0 768 2 /\ ={publicseed,pkp0,bp,ep,epp,v,sp_0,Glob.mem} /\ pkp0{2} = pkp{1} /\ s_noiseseed{2} = noiseseed0{2}).
  auto => /> &2 ????????? rl rr H H0 H1 ????.
  + rewrite tP => k kb.
    move : H; rewrite /lift_array256 tP => H.
    move : (H k kb); rewrite !mapiE //=. 
    move : H0 H1; rewrite /pos_bound256_cxq /bpos16 /= => H0 H1.
    move : (H0 k kb) (H1 k kb).
    rewrite -Zq.eq_incoeff /= qE. 
    move => HH0 HH1; rewrite !modz_small; 1,2: smt( StdOrder.IntOrder.gtr0_norm).    
    move : HH0 HH1; rewrite /to_sint /smod /= => HH0 HH1.
    rewrite  ifF. smt(W16.to_uint_cmp). 
    rewrite  ifF. smt(W16.to_uint_cmp). 
    smt(W16.to_uint_eq).
  seq 12 12 : (#{/~publicseed{2}}post /\ ={publicseed}).
  wp;sp; conseq />.
  call (polyvec_frombytes_equiv).
  auto => />. smt(). 
  conseq />. sim.

sp 2 0.
(* swap {1} [11..12] 2. *)

seq 11 20 : (#{/~bp{1}=bp{2}}pre  /\
    signed_bound768_cxq sp_0{1} 0 768 1 /\
    signed_bound768_cxq ep{1} 0 768 1 /\
    signed_bound_cxq epp{1} 0 256 1 /\
    signed_bound768_cxq sp_0{2} 0 768 1 /\
    signed_bound768_cxq ep{2} 0 768 1 /\ 
    signed_bound_cxq epp{1} 0 256 1).
+ conseq />.
  transitivity {1} { (sp_0,ep,bp,epp) <@ GetNoiseAVX2.samplenoise_enc(sp_0,ep,bp, epp,noiseseed);} (lnoiseseed{1} = noiseseed{2} /\ ={sp_0,ep,bp,epp} ==> ={sp_0,ep,epp}) 
   (
   s_noiseseed{1} = noiseseed0{1} /\
  lnoiseseed{1} = s_noiseseed{1} /\
  (sctp0{2} = sctp{2} /\
   msgp0{2} = msgp{2} /\
   noiseseed0{2} = noiseseed{2} /\
   sctp0{1} = sctp{1} /\
   msgp0{1} = msgp{1} /\
   noiseseed0{1} = noiseseed{1} /\
   (={Glob.mem, msgp, noiseseed, pkp, sctp} /\
    valid_ptr _pkp (384 * 3 + 32) /\
    valid_ptr _ctp (3 * 320 + 128) /\ Glob.mem{1} = mem /\ to_uint sctp{1} = _ctp /\ to_uint pkp{1} = _pkp) /\
   ={pkp0}) /\
  ={publicseed, bp, ep, epp, v, sp_0, k} /\
  s_noiseseed{2} = noiseseed0{2} /\
  pos_bound256_cxq k{1} 0 256 1 /\
  pos_bound256_cxq k{2} 0 256 1 /\
  lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\
  pos_bound768_cxq pkpv{1} 0 768 2 /\
  pos_bound768_cxq pkpv{2} 0 768 2 /\
  aat{1} = nttunpackm aat{2} /\ pos_bound2304_cxq aat{1} 0 2304 2 /\ pos_bound2304_cxq aat{2} 0 2304 2
   ==> 
    ={ep, epp, sp_0} /\
  signed_bound768_cxq sp_0{1} 0 768 1 /\
  signed_bound768_cxq ep{1} 0 768 1 /\
  signed_bound_cxq epp{1} 0 256 1 /\
  signed_bound768_cxq sp_0{2} 0 768 1 /\ signed_bound768_cxq ep{2} 0 768 1 /\ signed_bound_cxq epp{1} 0 256 1
  ); 1,2:smt().
  + by inline {2} 1;do 2!(wp; call getnoiseequiv_avx);auto => />. 
  inline {1} 1. inline GetNoiseAVX2._poly_getnoise_eta1_4x.
  wp; call{1} (_: true ==> true); 1: by apply polygetnoise_ll.
  do 7!(wp; call  getnoiseequiv); auto => />.
  move => &1 &2 ??????????R?; split.
  + by rewrite tP => k kb; rewrite !initiE //= initiE /#.
  move => ?R0?; split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /= /#.
  move => ?R1?????; split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.
  move => ?R2???; do split.
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  rewrite /signed_bound768_cxq => x xb /=.
  rewrite !initiE //= fun_if. 
  case (512 <= x && x < 768); 1: by smt().
  move => *; rewrite !initiE //= fun_if. 
  case (256 <= x && x < 512); 1: by smt().
  move => *; rewrite !initiE //= fun_if. 
  by smt().

swap {1} 1 2.
seq 1 1 : (#{/~sp_0{1}}{~sp_0{2}}pre /\ 
           lift_array768 sp_0{1} = nttunpackv (lift_array768 sp_0{2}) /\
           pos_bound768_cxq sp_0{1} 0 768 2 /\
           pos_bound768_cxq sp_0{2} 0 768 2); 1: 
 by  conseq />; call (nttequiv); auto => /> /#.

(* First ip *)

seq 5 2 : (#pre /\ 
              lift_array256 (subarray256 bp{1} 0) = nttunpack (lift_array256 (subarray256 bp{2} 0)) /\
              signed_bound768_cxq bp{1} 0 256 4 /\
              signed_bound768_cxq bp{2} 0 256 2 /\ w{1} = 1).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE // 1:/# /= kb /= initiE //=. 
+ rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#.
+ rewrite /signed_bound768_cxq => k kb; smt(). 
+ rewrite /signed_bound768_cxq => *; rewrite initiE //=; smt().
+ by smt().

move => H15 H16 H17 H18 H19 r1 r2 H20 H21 H22;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  rewrite kb /=. 
  have -> /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  move : H20; rewrite /lift_array256 tP => H20.
  move : (H20 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

(* Second ip *)

seq 3 2: (#{/~w{1}}pre /\ lift_array256 (subarray256 bp{1} 1) = nttunpack (lift_array256 (subarray256 bp{2} 1)) /\
              signed_bound768_cxq bp{1} 256 512 4 /\
              signed_bound768_cxq bp{2} 256 512 2 /\ w{1} = 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifT 1:/# initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H18 H19 H20 H21 H22 r1 r2 H23 H24 H25;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H15; rewrite /lift_array256 /subarray256 tP => H15.
  move : (H15 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifT 1: /# ifT 1: /# /=. 
  move : H23; rewrite /lift_array256 tP => H23.
  move : (H23 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

(* Third ip *)

seq 3 2: (#{/~w{1}}pre /\ lift_array256 (subarray256 bp{1} 2) = nttunpack (lift_array256 (subarray256 bp{2} 2)) /\
              signed_bound768_cxq bp{1} 512 768 4 /\
              signed_bound768_cxq bp{2} 512 768 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifF 1:/# initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H121 H22 H23 H24 H25 r1 r2 H26 H27 H28;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H15; rewrite /lift_array256 /subarray256 tP => H15.
  move : (H15 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H18; rewrite /lift_array256 tP => H18.
  move : (H18 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifT 1: /# ifT 1: /# /=. 
  move : H26; rewrite /lift_array256 tP => H26.
  move : (H26 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

(* Fourth ip *)

seq 1 1: (#{/~v{1}}pre /\ lift_array256 v{1} = nttunpack (lift_array256 v{2}) /\
              signed_bound_cxq v{1} 0 256 4 /\
              signed_bound_cxq v{2} 0 256 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 H22 H23; do split.
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 

(* INV NTT!!! *)
seq 1 1 : (#{/~bp{2}}{~bp{1}}pre /\ lift_array768 bp{1} = lift_array768 bp{2} /\ signed_bound768_cxq bp{1} 0 768 2 /\ signed_bound768_cxq bp{2} 0 768 2).
conseq />.  call(invnttequiv). auto => />. move => &1 &2 ???????????????H1??H0??H?????; split.
+ do split; 2,3: by smt().
  rewrite /nttunpackv.
  rewrite tP => k kb; rewrite initiE //=.
  move : H H0 H1; rewrite !tP => H H0 H1.
  case (0 <= k < 256).
  + move => kkb; move : (H1 k kkb). rewrite subliftsub //= => ->. 
    congr;congr.
    rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
    rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  case (256 <= k < 512).
  + move => nkkb kkb. move : (H0 (k-256) _); 1: smt(). rewrite subliftsub //= 1: /# => ->. 
    congr;congr.
    rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
    rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  move => *.
  move : (H (k-512) _); 1: smt(). rewrite subliftsub //= 1: /# => ->. 
  congr;congr.
  rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
  rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  smt().

seq 1 1 : (#{/~v{2}}{~v{1}}pre /\ lift_array256 v{1} = lift_array256 v{2} /\ signed_bound_cxq v{1} 0 256 2 /\ signed_bound_cxq v{2} 0 256 2).
conseq />.  call(polyinvnttequiv). auto => />. smt().

auto => /> /#.
qed.


(***************************************************)

lemma mlkem_correct_enc_1_avx2 mem _pkp : 
   equiv [Jkem_avx2.M(Jkem_avx2.Syscall).__indcpa_enc_1 ~ InnerPKE.enc_derand: 
     valid_ptr _pkp (384*3 + 32) /\
     Glob.mem{1} = mem /\ 
     msgp{1} = m{2} /\ 
     to_uint pkp{1} = _pkp /\
     noiseseed{1} = coins{2} /\
     pk{2}.`1 = load_array1152 mem _pkp /\
     pk{2}.`2 = load_array32 mem (_pkp + 3*384)
       ==> 
     Glob.mem{1} = mem /\
     let (c1,c2) = res{2} in
     c1 = Array960.init (fun i => res{1}.[i]) /\
     c2 = Array128.init (fun i => res{1}.[i+960])
].
proc*.
transitivity {1} { r <@Jkem.M(Jkem.Syscall).__iindcpa_enc(ctp,msgp,pkp,noiseseed);} 
(={Glob.mem,ctp,msgp,pkp,noiseseed} /\
  valid_ptr _pkp (384 * 3 + 32) /\
  Glob.mem{1} = mem /\
  to_uint pkp{1} = _pkp 
   ==> ={Glob.mem,r} /\ Glob.mem{1} = mem) 
( valid_ptr _pkp (384 * 3 + 32) /\
  Glob.mem{1} = mem /\
  msgp{1} = m{2} /\
  to_uint pkp{1} = _pkp /\
  noiseseed{1} = coins{2} /\
  pk{2}.`1 = load_array1152 mem _pkp /\ 
  pk{2}.`2 = load_array32 mem (_pkp + 3 * 384) 
  ==>
  Glob.mem{1} = mem /\
  r{1} = (Array1088.init (fun (i : int) => if 0 <= i && i < 960 then r{2}.`1.[i] else r{2}.`2.[i - 960])));[ by smt() | | | by call(mlkem_correct_ienc mem _pkp); auto => />].
  + move => /> c1 c2. 
    rewrite !tP;split;move => *.
    + by rewrite !initiE // 1:/# /= /#.
    by rewrite !initiE //= !initiE 1:/# /= /#.

inline{1} 1; inline {2} 1. wp.

seq 49 61 : (={ctp0,Glob.mem} /\ Glob.mem{1} = mem /\
     pos_bound256_cxq v{1} 0 256 2 /\
     pos_bound256_cxq v{2} 0 256 2 /\
    lift_array256 v{1} = lift_array256 v{2}); last by
  exists *Glob.mem{1}; elim* => memm; call (compressequiv_1 memm); auto => />; smt(Array1088.tP Array1088.initiE).

swap {2} 57 2.

seq 46  58 : (={ctp0,Glob.mem} /\ Glob.mem{1} = mem /\ 
     pos_bound256_cxq v{1} 0 256 2 /\
     pos_bound256_cxq v{2} 0 256 2 /\
    lift_array256 v{1} = lift_array256 v{2} /\ 
    lift_array768 bp{1} = lift_array768 bp{2}); last first. 
+ wp; conseq />; conseq (: _ ==> aux_4{1} = aux_0{2}); 1: by smt().

+ transitivity {1} { aux_4 <@ AuxPolyVecCompress10.avx2_orig_i(ctp0,bp); }
    (={bp,ctp0}  ==> ={aux_4})
    ( lift_array768 bp{1} = lift_array768 bp{2} /\ ={ctp0} ==> aux_4{1}=aux_0{2});
      [ smt() | smt() | by inline*;sim | ]. 
  transitivity {2} { aux_0 <@ AuxPolyVecCompress10.ref_orig_i(ctp0,bp); }
    ( lift_array768 bp{1} = lift_array768 bp{2} /\ ={ctp0}  ==> aux_4{1} =aux_0{2})
    (={bp,ctp0} ==> ={aux_0});
      [ smt() | smt() |  call compress10_equiv_i;auto => /> | by inline *;sim].

wp;conseq />.
call (reduceequiv_noperm).
call (addequiv_noperm 4 2 _ _) => //.
call (addequiv_noperm 2 2 _ _) => //.

have H := polyvec_add2_equiv_noperm 2 2 _ _ => //.
ecall (H (lift_array768 bp{2}) (lift_array768 ep{2})); clear H.


unroll for {1} 39.

swap {1} 3 -2; swap {2} 3 -2; seq 1 1: (#pre /\ ={pkp0} /\ pkp0{2} = pkp{1}); 1: by auto.
sp 3 3.

swap {1} 17 2. (* avoid dealing with stack noise seed *)

seq 18 19  : (#pre /\ ={publicseed, bp,ep,epp,v,sp_0,k} /\ ctp{2} = sctp{2} /\
           s_noiseseed{2} = noiseseed0{2} /\
           pos_bound256_cxq k{1} 0 256 1 /\
           pos_bound256_cxq k{2} 0 256 1 /\
           lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\
           pos_bound768_cxq pkpv{1} 0 768 2 /\
           pos_bound768_cxq pkpv{2} 0 768 2 /\
           aat{1} = nttunpackm aat{2} /\
           pos_bound2304_cxq aat{1} 0 2304 2 /\
           pos_bound2304_cxq aat{2} 0 2304 2). 
+ call (genmatrixequiv true).
  wp;call frommsgequiv_noperm. conseq />. smt().
  conseq (_: _ ==> lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\ ctp{2} = sctp{2} /\
       pos_bound768_cxq pkpv{1} 0 768 2 /\ pos_bound768_cxq pkpv{2} 0 768 2 /\ ={publicseed,pkp0,bp,ep,epp,v,sp_0,Glob.mem} /\ pkp0{2} = pkp{1} /\ s_noiseseed{2} = noiseseed0{2}).
  auto => /> &2 ??????? rl rr H H0 H1 ????. 
  + rewrite tP => k kb.
    move : H; rewrite /lift_array256 tP => H.
    move : (H k kb); rewrite !mapiE //=. 
    move : H0 H1; rewrite /pos_bound256_cxq /bpos16 /= => H0 H1.
    move : (H0 k kb) (H1 k kb).
    rewrite -Zq.eq_incoeff /= qE. 
    move => HH0 HH1; rewrite !modz_small; 1,2: smt( StdOrder.IntOrder.gtr0_norm).    
    move : HH0 HH1; rewrite /to_sint /smod /= => HH0 HH1.
    rewrite  ifF. smt(W16.to_uint_cmp). 
    rewrite  ifF. smt(W16.to_uint_cmp). 
    smt(W16.to_uint_eq).

  seq 12 14 : (#{/~publicseed{2}}post /\ ={publicseed}).
  wp;sp; conseq />.
  call (polyvec_frombytes_equiv).
  auto => />. smt().
  conseq />. sim.

sp 2 0.
(* swap {1} [11..12] 2. *)

seq 12 20 : (#{/~bp{1}=bp{2}}pre  /\
    signed_bound768_cxq sp_0{1} 0 768 1 /\
    signed_bound768_cxq ep{1} 0 768 1 /\
    signed_bound_cxq epp{1} 0 256 1 /\
    signed_bound768_cxq sp_0{2} 0 768 1 /\
    signed_bound768_cxq ep{2} 0 768 1 /\ 
    signed_bound_cxq epp{1} 0 256 1).
+ conseq />.
  transitivity {1} { (sp_0,ep,bp,epp) <@ GetNoiseAVX2.samplenoise_enc(sp_0,ep,bp, epp,noiseseed);} (lnoiseseed{1} = noiseseed{2} /\ ={sp_0,ep,bp,epp} ==> ={sp_0,ep,epp}) 
   (
   s_noiseseed{1} = noiseseed0{1} /\
  lnoiseseed{1} = s_noiseseed{1} /\
  (ctp0{2} = ctp{2} /\
   msgp0{2} = msgp{2} /\
   noiseseed0{2} = noiseseed{2} /\
   ctp0{1} = ctp{1} /\
   msgp0{1} = msgp{1} /\
   noiseseed0{1} = noiseseed{1} /\
   (={Glob.mem, msgp, pkp, noiseseed} /\ valid_ptr _pkp (384 * 3 + 32) /\ Glob.mem{1} = mem /\ to_uint pkp{1} = _pkp) /\
   ={pkp0}) /\
  ={publicseed, bp, ep, epp, v, sp_0, k} /\
  s_noiseseed{2} = noiseseed0{2} /\
  pos_bound256_cxq k{1} 0 256 1 /\
  pos_bound256_cxq k{2} 0 256 1 /\
  lift_array768 pkpv{1} = nttunpackv (lift_array768 pkpv{2}) /\
  pos_bound768_cxq pkpv{1} 0 768 2 /\
  pos_bound768_cxq pkpv{2} 0 768 2 /\
  aat{1} = nttunpackm aat{2} /\ pos_bound2304_cxq aat{1} 0 2304 2 /\ pos_bound2304_cxq aat{2} 0 2304 2
   ==> 
    ={ep, epp, sp_0} /\
  signed_bound768_cxq sp_0{1} 0 768 1 /\
  signed_bound768_cxq ep{1} 0 768 1 /\
  signed_bound_cxq epp{1} 0 256 1 /\
  signed_bound768_cxq sp_0{2} 0 768 1 /\ signed_bound768_cxq ep{2} 0 768 1 /\ signed_bound_cxq epp{1} 0 256 1
  ); 1,2:smt().
  + by inline {2} 1;do 2!(wp; call getnoiseequiv_avx);auto => />. 
  inline {1} 1. inline GetNoiseAVX2._poly_getnoise_eta1_4x.
  wp; call{1} (_: true ==> true); 1: by apply polygetnoise_ll.
  do 7!(wp; call  getnoiseequiv); auto => />.
  move => &1 &2 ????????R?; split.
  + by rewrite tP => k kb; rewrite !initiE //= initiE /#.
  move => ?R0?; split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /= /#.
  move => ?R1?????; split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.
  move => ?R2???; do split.
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound768_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  rewrite /signed_bound768_cxq => x xb /=.
  rewrite !initiE //= fun_if. 
  case (512 <= x && x < 768); 1: by smt().
  move => *; rewrite !initiE //= fun_if. 
  case (256 <= x && x < 512); 1: by smt().
  move => *; rewrite !initiE //= fun_if. 
  by smt().

seq 1 1 : (#{/~sp_0{1}}{~sp_0{2}}pre /\ 
           lift_array768 sp_0{1} = nttunpackv (lift_array768 sp_0{2}) /\
           pos_bound768_cxq sp_0{1} 0 768 2 /\
           pos_bound768_cxq sp_0{2} 0 768 2); 1: 
 by  conseq />; call (nttequiv); auto => /> /#.

(* First ip *)

seq 4 2 : (#pre /\ 
              lift_array256 (subarray256 bp{1} 0) = nttunpack (lift_array256 (subarray256 bp{2} 0)) /\
              signed_bound768_cxq bp{1} 0 256 4 /\
              signed_bound768_cxq bp{2} 0 256 2 /\ w{1} = 1).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE // 1:/# /= kb /= initiE //=. 
+ rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#.
+ rewrite /signed_bound768_cxq => k kb; smt(). 
+ rewrite /signed_bound768_cxq => *; rewrite initiE //=; smt().
+ by smt().

move => H15 H16 H17 H18 H19 r1 r2 H20 H21 H22;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  rewrite kb /=. 
  have -> /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  move : H20; rewrite /lift_array256 tP => H20.
  move : (H20 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=;smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

(* Second ip *)

seq 3 2: (#{/~w{1}}pre /\ lift_array256 (subarray256 bp{1} 1) = nttunpack (lift_array256 (subarray256 bp{2} 1)) /\
              signed_bound768_cxq bp{1} 256 512 4 /\
              signed_bound768_cxq bp{2} 256 512 2 /\ w{1} = 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifT 1:/# initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H18 H19 H20 H21 H22 r1 r2 H23 H24 H25;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H13; rewrite /lift_array256 /subarray256 tP => H13.
  move : (H13 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifT 1: /# ifT 1: /# /=. 
  move : H23; rewrite /lift_array256 tP => H23.
  move : (H23 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

(* Third ip *)

seq 3 2: (#{/~w{1}}pre /\ lift_array256 (subarray256 bp{1} 2) = nttunpack (lift_array256 (subarray256 bp{2} 2)) /\
              signed_bound768_cxq bp{1} 512 768 4 /\
              signed_bound768_cxq bp{2} 512 768 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18; do split.
+ rewrite -lift768_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifF 1:/# initiE //=. 
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.
+ by rewrite /signed_bound768_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound768_cxq /signed_bound_768_cxq /#.

move => H121 H22 H23 H24 H25 r1 r2 H26 H27 H28;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H13; rewrite /lift_array256 /subarray256 tP => H13.
  move : (H13 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H16; rewrite /lift_array256 tP => H16.
  move : (H16 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifT 1: /# ifT 1: /# /=. 
  move : H26; rewrite /lift_array256 tP => H26.
  move : (H26 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound768_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound768_cxq /= => i ib; rewrite !initiE  //=; smt().

(* Fourth ip *)

seq 1 1: (#{/~v{1}}pre /\ lift_array256 v{1} = nttunpack (lift_array256 v{2}) /\
              signed_bound_cxq v{1} 0 256 4 /\
              signed_bound_cxq v{2} 0 256 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21; do split.
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 
+ by rewrite /signed_bound768_cxq => k kb; smt(). 

(* INV NTT!!! *)
seq 1 1 : (#{/~bp{2}}{~bp{1}}pre /\ lift_array768 bp{1} = lift_array768 bp{2}  /\ signed_bound768_cxq bp{1} 0 768 2 /\ signed_bound768_cxq bp{2} 0 768 2).
conseq />.  call(invnttequiv). auto => />. move => &1 &2 ?????????????H1??H0??H?????; split.
+ do split; 2,3: by smt().
  rewrite /nttunpackv.
  rewrite tP => k kb; rewrite initiE //=.
  move : H H0 H1; rewrite !tP => H H0 H1.
  case (0 <= k < 256).
  + move => kkb; move : (H1 k kkb). rewrite subliftsub //= => ->. 
    congr;congr.
    rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
    rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  case (256 <= k < 512).
  + move => nkkb kkb. move : (H0 (k-256) _); 1: smt(). rewrite subliftsub //= 1: /# => ->. 
    congr;congr.
    rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
    rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  move => *.
  move : (H (k-512) _); 1: smt(). rewrite subliftsub //= 1: /# => ->. 
  congr;congr.
  rewrite /lift_array256 /subarray256 /lift_array768 tP => i ib.
  rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  smt().

seq 1 1 : (#{/~v{2}}{~v{1}}pre /\ lift_array256 v{1} = lift_array256 v{2} /\ signed_bound_cxq v{1} 0 256 2 /\ signed_bound_cxq v{2} 0 256 2).
conseq />.  call(polyinvnttequiv). auto => />. smt().

auto => /> /#. 
qed.


lemma mlkem_correct_dec mem _ctp _skp : 
   equiv [Jkem_avx2.M(Jkem_avx2.Syscall).__indcpa_dec_1 ~ InnerPKE.dec : 
     valid_ptr _ctp (3*320+128) /\
     valid_ptr _skp 1152 /\
     Glob.mem{1} = mem /\ 
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp /\
     sk{2} = load_array1152 Glob.mem{1} _skp /\
     let (c1,c2) = cph{2} in
       c1 = load_array960 Glob.mem{1} _ctp /\
       c2 = load_array128 Glob.mem{1} (_ctp + 960)
       ==> 
     Glob.mem{1} = mem /\
     res{1} = res{2}
].
proc*.
transitivity {1} { r <@Jkem.M(Jkem.Syscall).__indcpa_dec(msgp,ctp,skp);} 
(={Glob.mem,ctp,skp} /\
  valid_ptr _ctp (3*320+128) /\
     valid_ptr _skp 1152 /\
     Glob.mem{1} = mem /\ 
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp 
   ==> ={Glob.mem,r} /\ Glob.mem{1} = mem) 
( valid_ptr _ctp (3*320+128) /\
     valid_ptr _skp 1152 /\
     Glob.mem{1} = mem /\ 
     to_uint ctp{1} = _ctp /\
     to_uint skp{1} = _skp /\
     sk{2} = load_array1152 Glob.mem{1} _skp /\
     let (c1,c2) = cph{2} in
       c1 = load_array960 Glob.mem{1} _ctp /\
       c2 = load_array128 Glob.mem{1} (_ctp + 960)
       ==> 
     Glob.mem{1} = mem /\
     r{1} = r{2}); 1,2: smt();  
   last by call(mlkem_correct_dec mem _ctp _skp); auto => />. 

inline{1} 1; inline {2} 1.
wp; ecall (tomsgequiv_noperm).
call (reduceequiv_noperm).
call (subequiv_noperm 2 2 _ _) => //.
call(polyinvnttequiv).
call pointwiseequiv.
call(nttequiv).
call (polyvec_frombytes_equiv).
ecall (poly_decompress_equiv mem (_ctp + 3*320)).
wp; call (polyvec_decompress_equiv mem _ctp).
auto => />.
move => &2 ????; split; 1: smt().
move => ????; do split; 1:smt(). 
+ by rewrite to_uintD_small /=; 1: smt().
move => ????? r0 ? rl1 rr1 ???; do split; 1,2: smt().
move => ? rl2 rr2 ???; do split; 1..4: smt().
move => ???? rl3 rr3 ???. do split; smt().
qed.
