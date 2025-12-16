require import AllCore IntDiv List.

from Jasmin require import JModel.
from JazzEC require import Array4 Array33 Array128  Array16 Array25 Array32 Array33 Array64 Array128 Array160 Array136 Array256 Array1024 Array1408 Array1410 Array1536 Array4096 Array1536 Array1568.
from JazzEC require import WArray512 WArray256 WArray32 WArray33 WArray128 WArray160.

require import List_extra.
require import MLKEM_Poly  MLKEM_PolyVec MLKEM_InnerPKE.
require import MLKEM_Poly_avx2_proof.
require import MLKEM_Poly_avx2_vec.
require import MLKEM_Poly_avx2_prevec.
require import MLKEM_PolyVec_avx2_proof.
require import MLKEM_PolyVec_avx2_vec.
require import MLKEMFCLib.
from JazzEC require import Jkem1024_avx2 Jkem1024.
require import NTT_avx2 NTT_AVX_j.
require import Fq NTT_Fq NTT_AVX_Fq.
require import MLKEM_avx2_equivs.
require import Montgomery16.
require import AVX2_Ops.
require import MLKEM_keccak_ref MLKEM_keccak_avx2.
require import MLKEM_genmatrix_avx2.

from CryptoSpecs require import GFq Rq Sampling Serialization Symmetric VecMat InnerPKE1024 MLKEM1024 Correctness1024.

import Serialization1024 Symmetric1024 VecMat1024.

import MLKEM_Poly.
import MLKEM_PolyVec.
import MLKEM_PolyvecAVX.
import MLKEM_PolyAVXVec.
import NTT_Avx2.


equiv genmatrixequiv b :
 Jkem1024_avx2.M._gen_matrix_avx2 ~ Jkem1024.M.__gen_matrix :
    arg{1}.`2 = arg{2}.`1 /\ arg{1}.`3= (W64.of_int (b2i b)) /\ arg{2}.`2 =  (W64.of_int (b2i b))  ==>
    res{1} = nttunpackm res{2} /\
    pos_bound4096_cxq res{1} 0 4096 2 /\
    pos_bound4096_cxq res{2} 0 4096 2.
proc* => /=. 
transitivity {2} { r <@ AuxMLKEM.__gen_matrix(seed,b); }
     ( rho{1} = seed{2} /\ transposed{1} = (of_int (b2i b))%W64 /\ transposed{2} = (of_int (b2i b))%W64 ==> r{1} = nttunpackm r{2} /\ pos_bound4096_cxq r{1} 0 4096 2 /\ pos_bound4096_cxq r{2} 0 4096 2 )
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
      aux_3 <@Jkem1024.M._poly_getnoise(aux3,noiseseed,n3);
      aux_2 <@Jkem1024.M._poly_getnoise(aux2,noiseseed,n2);
      aux_1 <@Jkem1024.M._poly_getnoise(aux1,noiseseed,n1);
      aux_0 <@Jkem1024.M._poly_getnoise(aux0,noiseseed,n0);
      return (aux_3, aux_2, aux_1, aux_0);
  }

  proc sample_noise_kg(skpv e : W16.t Array1024.t, noiseseed:W8.t Array32.t) : W16.t Array1024.t * W16.t Array1024.t ={
     var nonce : W8.t;
     var aux_2, aux_1, aux_0, aux : W16.t Array256.t;
nonce <- W8.zero; 
(aux, aux_0, aux_1, aux_2) <@                               
  _poly_getnoise_eta1_4x(        
    Array256.init (fun (i_0 : int) => skpv.[0 + i_0]),      
    Array256.init (fun (i_0 : int) => skpv.[256 + i_0]),    
    Array256.init (fun (i_0 : int) => skpv.[2 * 256 + i_0]),
    Array256.init (fun (i_0 : int) => skpv.[3 * 256 + i_0]),
    noiseseed, nonce);                                       
skpv <-                                                     
  Array1024.init                                            
    (fun (i_0 : int) =>                                     
       if 0 <= i_0 < 0 + 256 then aux.[i_0 - 0]             
       else skpv.[i_0]);                                     
skpv <-                                                     
  Array1024.init                                            
    (fun (i_0 : int) =>                                     
       if 256 <= i_0 < 256 + 256 then aux_0.[i_0 - 256]     
       else skpv.[i_0]);                                    
skpv <-                                                     
  Array1024.init                                            
    (fun (i_0 : int) =>                                     
       if 2 * 256 <= i_0 < 2 * 256 + 256 then               
         aux_1.[i_0 - 2 * 256]                              
       else skpv.[i_0]);                                     
skpv <-                                                     
  Array1024.init                                            
    (fun (i_0 : int) =>                                     
       if 3 * 256 <= i_0 < 3 * 256 + 256 then               
         aux_2.[i_0 - 3 * 256]                              
       else skpv.[i_0]);                                     
nonce <- W8.of_int 4;                                       
(aux, aux_0, aux_1, aux_2) <@                               
  _poly_getnoise_eta1_4x(        
    Array256.init (fun (i_0 : int) => e.[0 + i_0]),         
    Array256.init (fun (i_0 : int) => e.[256 + i_0]),       
    Array256.init (fun (i_0 : int) => e.[2 * 256 + i_0]),   
    Array256.init (fun (i_0 : int) => e.[3 * 256 + i_0]),   
    noiseseed, nonce);                                     
e <-                                                        
  Array1024.init                                            
    (fun (i_0 : int) =>                                     
       if 0 <= i_0 < 0 + 256 then aux.[i_0 - 0]             
       else e.[i_0]);                                        
e <-                                                        
  Array1024.init                                            
    (fun (i_0 : int) =>                                     
       if 256 <= i_0 < 256 + 256 then aux_0.[i_0 - 256]     
       else e.[i_0]);                                        
e <-                                                        
  Array1024.init                                            
    (fun (i_0 : int) =>                                     
       if 2 * 256 <= i_0 < 2 * 256 + 256 then               
         aux_1.[i_0 - 2 * 256]                              
       else e.[i_0]);                                        
e <-                                                        
  Array1024.init                                            
    (fun (i_0 : int) =>                                     
       if 3 * 256 <= i_0 < 3 * 256 + 256 then               
         aux_2.[i_0 - 3 * 256]                              
       else e.[i_0]);                                               
     return (skpv,e);
  }

  proc samplenoise_enc(sp_0 ep : W16.t Array1024.t, epp : W16.t Array256.t, noiseseed:W8.t Array32.t) : W16.t Array1024.t * W16.t Array1024.t * W16.t Array256.t  = {
     var nonce : W8.t;
     var aux_2, aux_1, aux_0, aux : W16.t Array256.t;
nonce <- W8.zero;                                              
                                                              
                                                              
(aux, aux_0, aux_1, aux_2) <@    _poly_getnoise_eta1_4x(          
    Array256.init (fun (i_0 : int) => sp_0.[0 + i_0]),        
    Array256.init (fun (i_0 : int) => sp_0.[256 + i_0]),      
    Array256.init (fun (i_0 : int) => sp_0.[2 * 256 + i_0]),  
    Array256.init (fun (i_0 : int) => sp_0.[3 * 256 + i_0]),  
    noiseseed, nonce);                                       
sp_0 <-                                                       
  Array1024.init                                              
    (fun (i_0 : int) =>                                       
       if 0 <= i_0 < 0 + 256 then aux.[i_0 - 0]               
       else sp_0.[i_0]);                                      
sp_0 <-                                                       
  Array1024.init                                              
    (fun (i_0 : int) =>                                       
       if 256 <= i_0 < 256 + 256 then aux_0.[i_0 - 256]       
       else sp_0.[i_0]);                                       
sp_0 <-                                                       
  Array1024.init                                              
    (fun (i_0 : int) =>                                       
       if 2 * 256 <= i_0 < 2 * 256 + 256 then                 
         aux_1.[i_0 - 2 * 256]                                
       else sp_0.[i_0]);                                       
sp_0 <-                                                       
  Array1024.init                                              
    (fun (i_0 : int) =>                                       
       if 3 * 256 <= i_0 < 3 * 256 + 256 then                 
         aux_2.[i_0 - 3 * 256]                                
       else sp_0.[i_0]);                                       
nonce <- W8.of_int 4;                                          
(aux, aux_0, aux_1, aux_2) <@  _poly_getnoise_eta1_4x(          
    Array256.init (fun (i_0 : int) => ep.[0 + i_0]),          
    Array256.init (fun (i_0 : int) => ep.[256 + i_0]),        
    Array256.init (fun (i_0 : int) => ep.[2 * 256 + i_0]),    
    Array256.init (fun (i_0 : int) => ep.[3 * 256 + i_0]),    
    noiseseed, nonce);                                        
ep <-                                                         
  Array1024.init                                              
    (fun (i_0 : int) =>                                       
       if 0 <= i_0 < 0 + 256 then aux.[i_0 - 0]               
       else ep.[i_0]);                                         
ep <-                                                         
  Array1024.init                                              
    (fun (i_0 : int) =>                                       
       if 256 <= i_0 < 256 + 256 then aux_0.[i_0 - 256]       
       else ep.[i_0]) ;                                        
ep <-                                                         
  Array1024.init                                              
    (fun (i_0 : int) =>                                       
       if 2 * 256 <= i_0 < 2 * 256 + 256 then                 
         aux_1.[i_0 - 2 * 256]                                
       else ep.[i_0]);                                         
ep <-                                                         
  Array1024.init                                              
    (fun (i_0 : int) =>                                       
       if 3 * 256 <= i_0 < 3 * 256 + 256 then                 
         aux_2.[i_0 - 3 * 256]                                                                                
       else ep.[i_0]); 
nonce <- W8.of_int 8;                                          
epp <@                                                    
  Jkem1024.M._poly_getnoise(epp,     
    noiseseed, nonce);      
return (sp_0,ep,epp);
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
rewrite bits16_W8u32 Hk  /= get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%2 \in iota_ 0 2) by smt(mem_iota).
by move: (k%%2); rewrite -allP -iotaredE /= W2u16.bits16_div .
qed.

lemma mask55_bits8 k:
 0 <= k < 32 =>
 mask55u256 \bits8 k = mask55u8.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits8_W8u32 Hk get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%4 \in iota_ 0 4) by smt(mem_iota).
by move: (k%%4); rewrite -allP -iotaredE /= W4u8.bits8_div.
qed.

lemma mask33_bits16 k:
 0 <= k < 16 =>
 mask33u256 \bits16 k = mask33u16.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits16_W8u32 Hk  get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%2 \in iota_ 0 2) by smt(mem_iota).
by move: (k%%2); rewrite -allP -iotaredE /= W2u16.bits16_div .
qed.

lemma mask33_bits8 k:
 0 <= k < 32 =>
 mask33u256 \bits8 k = mask33u8.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits8_W8u32 Hk  get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%4 \in iota_ 0 4) by smt(mem_iota).
by move: (k%%4); rewrite -allP -iotaredE /= W4u8.bits8_div .
qed.

lemma mask03_bits8 k:
 0 <= k < 32 =>
 mask03u256 \bits8 k = mask03u8.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits8_W8u32 Hk  get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%4 \in iota_ 0 4) by smt(mem_iota).
by move: (k%%4); rewrite -allP -iotaredE /= W4u8.bits8_div .
qed.

lemma mask0F_bits16 k:
 0 <= k < 16 =>
 mask0Fu256 \bits16 k = mask0Fu16.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits16_W8u32 Hk  get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%2 \in iota_ 0 2) by smt(mem_iota).
by move: (k%%2); rewrite -allP -iotaredE /= W2u16.bits16_div .
qed.

lemma mask0F_bits8 k:
 0 <= k < 32 =>
 mask0Fu256 \bits8 k = mask0Fu8.
proof.
move=> Hk.
rewrite /VPBROADCAST_8u32.
rewrite bits8_W8u32 Hk  get_of_list 1:/# /=. 
rewrite (nth_map 0) /=; first smt(size_iota).
have: (k%%4 \in iota_ 0 4) by smt(mem_iota).
by move: (k%%4); rewrite -allP -iotaredE /= W4u8.bits8_div .
qed.

require import W8extra.
lemma VPSRL1_ANDmask55 w k:
 0 <= k < 32 =>
 mask55u256 `&` (VPSRL_16u16 w (W128.of_int 1)) \bits8 k
 = mask55u8 `&` ((w \bits8 k) `>>` (W8.of_int 1)).
proof.
move=> Hk.
rewrite {1}(_:k=2*(k%/2) + (k%%2)); first smt(divz_eq).
rewrite -W256_bits16_bits8 1:/# andb16E /VPSRL_16u16 mapbE 1:/# /=.
rewrite W256_bits16_bits8 1:/# mask55_bits8 1:/#.
apply W8extra.wordP_red. rewrite -allP /=.
have: (k\in iota_ 0 32) by smt(mem_iota).
by move: {Hk} k; rewrite -allP -iotaredE /= /(`>>`)  !W8.shrwE /int_bit /=.
qed.

lemma VPSRL2_ANDmask33 w k:
 0 <= k < 32 =>
 mask33u256 `&` (VPSRL_16u16 w (W128.of_int 2)) \bits8 k
 = mask33u8 `&` ((w \bits8 k) `>>` (W8.of_int 2)).
proof.
move=> Hk.
rewrite {1}(_:k=2*(k%/2) + (k%%2)); first smt(divz_eq).
rewrite -W256_bits16_bits8 1:/# andb16E /VPSRL_16u16 mapbE 1:/# /=.
rewrite W256_bits16_bits8 1:/# mask33_bits8 1:/#.
apply W8extra.wordP_red. rewrite -allP /=.
have: (k\in iota_ 0 32) by smt(mem_iota).
by move: {Hk} k; rewrite -allP -iotaredE /= /(`>>`) !W8.shrwE /int_bit /=.
qed.

lemma VPSRL4_ANDmask0F w k:
 0 <= k < 32 =>
 VPAND_256 mask0Fu256 (VPSRL_16u16 w (W128.of_int 4)) \bits8 k
 = mask0Fu8 `&` ((w \bits8 k) `>>` (W8.of_int 4)).
proof.
move=> Hk.
rewrite {1}(_:k=2*(k%/2) + (k%%2)); first smt(divz_eq).
rewrite -W256_bits16_bits8 1:/# andb16E /VPSRL_16u16 mapbE 1:/# /=.
rewrite W256_bits16_bits8 1:/# mask0F_bits8 1:/#.
apply W8extra.wordP_red. rewrite -allP /=.
have: (k\in iota_ 0 32) by smt(mem_iota).
by move: {Hk} k; rewrite -allP -iotaredE /= /(`>>`) !W8.shrwE /int_bit /=.
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
rewrite -shlw_andmask 1:/# shrl_andmaskN 1:/# -andwA /=.
congr.
rewrite /max /=.
 apply W8.wordP => k; rewrite -mem_range /range /=. 
 by move: k; apply/List.allP; rewrite -iotaredE /int_bit /=.
have E1: to_uint (w `&` mask03u8) = to_uint w %% 4.
 by rewrite (W8.to_uint_and_mod 2).
have /= E2: to_uint ((w `>>>` 4) `&` (masklsb (6-4))%W8 `<<<` 4) = to_uint w %/ 16 %% 4 * 16.
 rewrite /max /= to_uint_shl 1:/# (W8.to_uint_and_mod 2) 1:/#.
 by rewrite to_uint_shr 1:/# /= modz_small /#.
rewrite to_uintD_small /=.
 by rewrite E1 E2 /#.
by rewrite E1 E2 /#.
qed.

abbrev ru_ones_s = W8.of_int 1.
lemma aux_coef_pos b:
 to_uint (mask33u8 `&` (mask55u8 `&` b  + mask55u8 `&` (b `>>` ru_ones_s)))
 = b2i b.[0] + b2i b.[1] + 16 * (b2i b.[4] + b2i b.[5]).
proof.
rewrite addrC -(mask85_sum b 0) 1:/# -(mask85_sum b 2) 1:/# /= !(W8.andwC mask55u8).
by rewrite to_uint_mask33 /(`>>`) to_uint_shr 1:/# /= to_uint_shr 1:/# /= /#.
qed.

lemma aux_coef_neg b:
 to_uint (mask33u8 `&` ((mask55u8 `&` b + mask55u8 `&` (b `>>` ru_ones_s)) `>>` W8.of_int 2))
 = b2i b.[2] + b2i b.[3] + 16 * (b2i b.[6] + b2i b.[7]).
proof.
rewrite to_uint_mask33 to_uint_shr 1:/# /= -divz_mul 1:/# /= !(W8.andwC mask55u8).
rewrite -{1}pow2_2  -pow2_6 -(mask85_sum b 1) 1:/# /= -(mask85_sum b 3) 1:/# /=. 
by rewrite to_uint_shr 1:/# /= to_uint_shr 1:/# /= /#.
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
rewrite -pow2_4 modz_pow_div 1,2:/# /= modz_mod.
rewrite aux_coef_pos W8.to_uintB.
 by rewrite ule_andw.
rewrite aux_coef_neg /= (divz_eq 51 16).
pose X:= (b2i _ + _ + _ + _)%W8.
have /=->: X 
   = b2i b.[0] + b2i b.[1] + (51 %% 16) - (b2i b.[2] + b2i b.[3]) 
     + 16 * (b2i b.[4] + b2i b.[5] + (51 %/ 16) - (b2i b.[6] + b2i b.[7])).
 by rewrite /X /=; ring.
by rewrite mulzC divzMDr 1:/# /= divz_small 1:/# /= /#.
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
  by rewrite !to_sintE  (W8.to_uint_and_mod 4) /smod 1:/# /= /#.
 rewrite L1 (W8.to_uint_and_mod 4) 1:/# /= /smod /= 1,2:/#.
 move: (noise_coef_avx2_aux bytes j) => /=.
 by rewrite C to_sintE /smod => <- /#. 
have C': j %% 2 = 1 by smt().
rewrite C' /= andwC W8_to_sintB_small.
 by rewrite !to_sintE  (W8.to_uint_and_mod 4) /smod 1:/# /= /#.
rewrite L1 (W8.to_uint_and_mod 4) 1:/# /= /smod /= 1,2:/#.
move: (noise_coef_avx2_aux bytes j) => /=.
by rewrite /noise_coef C' to_sintE /smod to_uint_shr 1:/# /= => <- /#.
qed.

lemma  to_sint8_mod x:
 W8.to_sint x %% W8.modulus = to_uint x.
proof.
rewrite /to_sint /smod.
case: (2 ^ (8 - 1) <= to_uint x) => C.
 rewrite -modzDm -modzNm modzz /= modz_mod.
 rewrite modz_small 2:/#.
 by apply JUtils.bound_abs; apply W8.to_uint_cmp.
rewrite modz_small 2:/#.
by apply JUtils.bound_abs; apply W8.to_uint_cmp.
qed.

lemma to_sint8K (x:W8.t): W8.of_int (to_sint x) = x.
proof. by rewrite -of_int_mod to_sint8_mod to_uintK. qed.

lemma truncateu128_bits128 (w:W256.t):
 truncateu128 w = w \bits128 0.
proof. by rewrite /truncateu128 to_uint_eq of_uintK bits128_div 1:/# /= of_uintK. qed.

hoare cbd2_avx2_h _bytes:
 Jkem1024_avx2.M.__cbd2: buf=_bytes ==> res = Array256.init (fun k => W16.of_int (noise_coef _bytes k)).
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
   rewrite /B2Ri /= -!divz_mul 1:/# /=. 
   have ->: (64 * i{m} + k) %/ 64 = i{m}.
    by rewrite (mulzC 64) divzMDl 1:/# (divz_small _ 64) 1:/# /=.
   have ->: (64 * i{m} + k) %/ 2 %% 32 = k %/ 2.
    rewrite -(modz_pow_div 2 6 1) 1,2:/# /=.
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
  rewrite /B2Ri /= -!divz_mul 1:/# /=. 
  have ->: (64 * i{m} + k) %/ 64 = i{m}.
   by rewrite (mulzC 64) divzMDl 1:/# (divz_small _ 64) 1:/# /=.
  have ->: (64 * i{m} + k) %/ 2 %% 32 = k %/ 2.
   rewrite -(modz_pow_div 2 6 1) 1,2:/# /=.
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
  rewrite (modz_pow_div 2 6 4) 1,2:/# /= C1 (mulzC 4) modzMDl /=.
  rewrite (modz_dvd_pow 4 6 _ 2) 1:/#.
  have ->: 64 * i{m} + k %% 64 = k by smt().
  by rewrite /R2C /= Array16.initiE /#.
 case: (k %/ 16 = 4 * i{m} + 2) => C2.
  move: (H (k %% 64) _) => /=; first smt(mem_iota).
  rewrite (modz_pow_div 2 6 4) 1,2:/# /= C2 (mulzC 4) modzMDl /=.
  rewrite (modz_dvd_pow 4 6 _ 2) 1:/#.
  have ->: 64 * i{m} + k %% 64 = k by smt().
  by rewrite /R2C /= Array16.initiE /#.
 case: (k %/ 16 = 4 * i{m} + 1) => C3.
  move: (H (k %% 64) _) => /=; first smt(mem_iota).
  rewrite (modz_pow_div 2 6 4) 1,2:/# /= C3 (mulzC 4) modzMDl /=.
  rewrite (modz_dvd_pow 4 6 _ 2) 1:/#.
  have ->: 64 * i{m} + k %% 64 = k by smt().
  by rewrite /R2C /= Array16.initiE /#.
 case: (k %/ 16 = 4 * i{m}) => C4.
  move: (H (k %% 64) _) => /=; first smt(mem_iota).
  rewrite (modz_pow_div 2 6 4) 1,2:/# /= C4 modzMr. 
  rewrite (modz_dvd_pow 4 6 _ 2) 1:/#.
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

lemma cbd2_ll : islossless Jkem1024_avx2.M.__cbd2.
proc. inline *. sp; wp. while (true) (4-i). move => z.
auto => /> &hr H. smt().
auto => />i. smt(). qed. 

phoare cbd2_avx2_ph _bytes:
 [Jkem1024_avx2.M.__cbd2: buf=_bytes ==> res = Array256.init (fun k => W16.of_int (noise_coef _bytes k))] = 1%r.
conseq cbd2_ll (cbd2_avx2_h _bytes) => />. qed.

module AuxMLKEMAvx2 = {
  proc cbd2_ref (rp:W16.t Array256.t,buf:W8.t Array128.t) : W16.t Array256.t = {
    var k: int;
    var a, b, c: W8.t;
    var i: int;
    var t: W16.t;
    i <- 0;

    while ((i < (2 * 256 %/ 4))) {
      c <- buf.[(i)];
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
      rp.[(2 * i)] <- t;
      a <- c;
      a <- (a `>>` (W8.of_int 4));
      a <- (a `&` (W8.of_int 3));
      b <- (c `>>` (W8.of_int 6));
      b <- (b `&` (W8.of_int 3));
      a <- (a - b);
      t <- (sigextu16 a);
      rp.[ (2 * i + 1)] <- t;
      i <- (i + 1);
    }
    return (rp);
  }
  proc _poly_getnoise (rp:W16.t Array256.t, seed:W8.t Array32.t,nonce:W8.t) : W16.t Array256.t = {
    var buf:W8.t Array128.t;
    var r;

    buf <- witness;
    buf <@ M._shake256_128_33 (buf,Array33.init (fun i => if i=32 then nonce else seed.[i]));
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
while ( i <= 128 /\ #pre /\ List.all (fun k => rp.[k]=W16.of_int (noise_coef _bytes k)) (iota_ 0 (2 *  i))).
 auto => &m |>; rewrite /(\ult) => _ /List.allP IH /= Hi.
 split; first smt().
 apply/List.allP => k; rewrite mem_iota /=; move => [? Hk].
 case: (k = 2 *  i{m}) => C1.
  rewrite /noise_coef !get_setE 1..2:/# C1 /= ifF 1:/#.
  have ->/=: 2 *  i{m} %/ 2 =  i{m} by smt().
  rewrite -to_sint_eq sigextu16_to_sint (_: 3 = 2^2 -1) 1:/# !and_mod 1,2:/# /= W8_of_sintK_signed /=; 1: smt(). 
  have ->  /= : 2 * i{m} %% 2 = 0 by smt().
  by rewrite -parallel_noisesum_low smod_small  /#.
 case: (k = 2 * i{m}+1) => C2.
  rewrite /noise_coef !get_setE 1..2:/# C2 /=.
  have ->/=: (2 *  i{m} + 1) %/ 2 =  i{m} by smt().
  rewrite -to_sint_eq sigextu16_to_sint (_: 3 = 2^2 -1) 1:/# !and_mod 1,2:/# /= W8_of_sintK_signed /=; 1: smt(). 
  have ->  /= : (2 *  i{m}+1) %% 2 = 1 by smt().
  by rewrite -parallel_noisesum_high smod_small  /#.
 rewrite !get_setE 1..2:/# C1 C2 /=; apply IH.
 smt(mem_iota).
auto => &m |> *.
split; first by rewrite iota0.
move=> i rp; rewrite /(\ult) => |> ??.
have ->/=:  i = 128 by smt().
rewrite tP => /List.allP H k Hk.
rewrite (H k _) /=.
 smt(mem_iota).
by rewrite initiE /#.
qed.

lemma cbd2_ref_ll : islossless AuxMLKEMAvx2.cbd2_ref.
proc. inline*. sp; wp. while (true) (128 -  i); move => *;auto => /> /#. 
qed.

phoare cbd2_ref_ph _bytes:
 [AuxMLKEMAvx2.cbd2_ref: buf=_bytes ==> res = Array256.init (fun k => W16.of_int (noise_coef _bytes k))] = 1%r.
conseq cbd2_ref_ll (cbd2_ref_h _bytes) => />. qed.

equiv getnoise_split : 
  M._poly_getnoise ~ AuxMLKEMAvx2._poly_getnoise : ={arg} ==> ={res}.
proc; wp; sp => />. 
seq 2 0 : ( ={buf,rp,seed,nonce} /\ extseed{1}=Array33.init (fun i => if i=32 then nonce{1} else seed{1}.[i]) ).
wp. while{1} (0 <= k{1} <= 32 /\ (forall i, 0 <= i < k{1} => extseed{1}.[i]=seed{1}.[i])) (32-k{1}).
auto => /> &m H1 H2 H3 H4. split. split. smt(). move => i Hi1 Hi2. rewrite get_setE 1:/#. smt(). smt().
auto => /> &m. split. move => i Hi1 Hi2. rewrite !get_out /#. move => extseed k. split. smt(). move => H1 H2 H3 H4. rewrite tP => i Hi. rewrite !initiE 1:/# => />. rewrite get_setE 1:/#. smt().
seq 1 1 : (#pre).
call (_:true). auto => />. sim. auto => />.  
inline *. sim. qed.

equiv getnoise_1x_equiv_avx :
  Jkem1024_avx2.M.__poly_cbd_eta1 ~ AuxMLKEMAvx2.cbd2_ref : ={arg} ==> ={res}.
proc*. inline Jkem1024_avx2.M.__poly_cbd_eta1.  sp;wp.
ecall{1} (cbd2_avx2_ph buf{1}) => />.
ecall{2} (cbd2_ref_ph buf{2}) => />.
auto => /> &2. rewrite tP => i Hi. rewrite initiE /#. qed.

equiv getnoise_4x_split : 
  GetNoiseAVX2._poly_getnoise_eta1_4x ~ AuxMLKEMAvx2.__poly_getnoise_eta1_4x : ={arg} ==> ={res}.
proc; wp; sp => />. call getnoise_split => />. call getnoise_split => />. call getnoise_split => />. call getnoise_split => />. auto => />. qed.


equiv getnoiseequiv_avx : 
   Jkem1024_avx2.M._poly_getnoise_eta1_4x ~ GetNoiseAVX2._poly_getnoise_eta1_4x : ={arg} ==> ={res}.
proc*. 
transitivity{2} { r <@ AuxMLKEMAvx2.__poly_getnoise_eta1_4x(aux3,aux2,aux1,aux0,noiseseed,nonce); } ((r0{1}, r1{1}, r2{1}, r3{1}, seed{1}, nonce{1}) = (aux3{2}, aux2{2}, aux1{2}, aux0{2}, noiseseed{2}, nonce{2}) ==> ={r}) (={aux3,aux2,aux1,aux0,noiseseed,nonce} ==> ={r}); last first.
symmetry. call getnoise_4x_split => />. auto => />. smt(). smt().
(*main proof*)
inline Jkem1024_avx2.M._poly_getnoise_eta1_4x AuxMLKEMAvx2.__poly_getnoise_eta1_4x AuxMLKEMAvx2._poly_getnoise. swap{2} [30..31] 5. swap{2} [23..24] 10. swap{2} [16..17] 15.
seq 27 30 : (
    r00{1}=rp{2}  /\ buf0{1} =buf{2}
 /\ r10{1}=rp0{2} /\ buf1{1} =buf0{2}
 /\ r20{1}=rp1{2} /\ buf2{1} =buf1{2}
 /\ r30{1}=rp2{2} /\ buf3{1} =buf2{2}
).
sp => />.
ecall{2} (shake256_33_128 (Array33.init (fun i => if i = 32 then nonce4{2} else seed2{2}.[i]))); wp => />.
ecall{2} (shake256_33_128 (Array33.init (fun i => if i = 32 then nonce3{2} else seed1{2}.[i]))); wp => />.
ecall{2} (shake256_33_128 (Array33.init (fun i => if i = 32 then nonce2{2} else seed0{2}.[i]))); wp => />.
ecall{2} (shake256_33_128 (Array33.init (fun i=> if i = 32 then nonce1{2} else seed{2}.[i]))); wp => />.
ecall{1} (shake256x4_A128__A32_A1_ph seed0{1} nonces{1}).
auto => /> &1 rr ->->->->.
rewrite /SHAKE256_33_128; do split; congr; congr; congr; congr;
rewrite tP => k kb;rewrite !initiE /# /=.
wp. call getnoise_1x_equiv_avx => />.
wp. call getnoise_1x_equiv_avx => />.
wp. call getnoise_1x_equiv_avx => />.
wp. call getnoise_1x_equiv_avx => />.
by auto. 
qed.

lemma polygetnoise_ll : islossless Jkem1024.M._poly_getnoise.
proc. 
while (0 <=  i <= 128) (128 -  i);
  1: by move => z; auto => /> /#.
wp; call shake256_33_128_ll.
wp; while (0<=k<=32) (32 -k); 1: by move => z; auto=> /> /#.
auto => />/#. 
qed.

equiv getnoiseequiv : 
  Jkem1024.M._poly_getnoise ~Jkem1024.M._poly_getnoise :
   ={arg} ==> ={res} /\
   signed_bound_cxq res{1} 0 256 1.
have H : forall &m a,
   Pr[Jkem1024.M._poly_getnoise(a) @ &m : forall k, 0<=k<256 => -5 < to_sint res.[k] < 5] = 1%r.
+ move => &m a.
  have -> : 1%r = Pr [ CBD2.sample(PRF a.`2 a.`3) @ &m : true].
  + byphoare;2..:smt().
    proc; inline *; while (0<=i<=128) (128-i); 1: by move => z; auto => /> /#. 
    by auto => /> /#.
  by byequiv get_noise_sample_noise => //.
have HH0 : hoare [Jkem1024.M._poly_getnoise : true ==> forall k, 0<=k<256 => -5 < to_sint res.[k] < 5].
+ hoare; bypr =>  &m; rewrite Pr[mu_not].
  have -> : Pr[Jkem1024.M._poly_getnoise(rp{m}, s_seed{m}, nonce{m}) @ &m : true] = 1%r.
  + by byphoare;2..:smt(); apply polygetnoise_ll.
  smt().
have HHH : equiv [ Jkem1024.M._poly_getnoise ~Jkem1024.M._poly_getnoise : ={arg} ==> ={res} ] by sim.
admit(* ??? Anomaly
conseq HHH HH0.
move => *; rewrite /signed_bound_cxq /b16 qE /#.
*).
qed.

equiv getnoiseequiv2 : 
   Jkem1024_avx2.M._poly_getnoise_eta2 ~M._poly_getnoise :
   ={arg} ==> ={res}  /\
   signed_bound_cxq res{1} 0 256 1.
symmetry.
proc*. 
symmetry.
transitivity{1} { r <@ AuxMLKEMAvx2._poly_getnoise(rp,seed,nonce); } 
     ( ={rp,seed,nonce}  ==> ={r})
    ( ={rp,nonce} /\ seed{1} = s_seed{2} ==> ={r} /\  signed_bound_cxq r{1} 0 256 1);1,2:smt().
+ inline {1} 1. inline {2} 1. 
  wp;call (getnoise_1x_equiv_avx).
  sp;conseq/>.
  (* Need to extend the keccak results to this one.
     Jkem1024_avx2.M._shake256_A128__A32_A1
  Jkem.M._shake256_128_33 *)
  ecall {1} (shake256_128A_A33_ph seed0{1} nonce_s{1}).
  ecall {2} (shake256_33_128 (Array33.init                               
                                   (fun (i : int) =>                        
                                      if i = 32 then nonce0{2} else seed0{2}.[i]))).
  auto => /> &2 r0; rewrite /SHAKE256_33_128 /=.
  have <- := (Array128.to_listK W8.zero r0); rewrite of_listK;1:by rewrite size_to_list.
  move => ->;congr;congr;congr.
  + apply (eq_from_nth witness);1: by rewrite !size_to_list.
    move => k;rewrite !size_to_list /= => ?.
    rewrite initiE 1:/# /= initiE 1:/# /= /#.
  by rewrite /to_list mkseq1 /=.
transitivity{1} { r <@ M._poly_getnoise(rp,seed,nonce); } 
     ( ={rp,seed,nonce}  ==> ={r})
    ( ={rp,nonce} /\ seed{1} = s_seed{2} ==> ={r} /\  signed_bound_cxq r{1} 0 256 1);1,2:smt().
+  by symmetry;call getnoise_split => />.
symmetry.
call getnoiseequiv.
auto => />.
qed.


import InnerPKE1024.

lemma mlkem_correct_kg_avx2   : 
   equiv [Jkem1024_avx2.M.__indcpa_keypair ~ InnerPKE1024.kg_derand : 
       randomnessp{1} = coins{2}  
        ==> 
       let (pk,sk) = res{2} in let (t,rho) = pk in
         sk = res{1}.`2 /\
         t = Array1536.init (fun i => res{1}.`1.[i])  /\
         rho = Array32.init (fun i => res{1}.`1.[1536+i])].
proc*.
transitivity {1} {r <@Jkem1024.M.__indcpa_keypair(pk, sk, randomnessp);} 
(={pk,sk,randomnessp} ==> ={r}) 
( randomnessp{1} = coins{2}  
        ==> 
       let (pk,sk) = r{2} in let (t,rho) = pk in
         sk = r{1}.`2 /\
         t = Array1536.init (fun i => r{1}.`1.[i])  /\
         rho = Array32.init (fun i => r{1}.`1.[1536+i]));1,2:smt(); last by 
  call(mlkem_correct_kg); auto => />  [r11 r12] [[r211 r212] r22] /= => [#] H H0 H1 r1 r2 [<-<-] r3 r4 [<-<-];
  smt(Array1536.tP Array1536.initiE Array32.tP Array32.initiE).  


inline{1} 1; inline {2} 1. sim 41 33. 

call (polyvec_tobytes_equiv).
call (polyvec_tobytes_equiv).
wp;conseq />.
ecall (polyvec_reduce_equiv (lift_array1024 pkpv{2})).

have H := polyvec_add2_equiv 2 2 _ _;1,2:smt().
ecall (H (lift_array1024 pkpv{2}) (lift_array1024 e{2})); clear H.

unroll for* {1} ^while{3}.
(*unroll for* {1} 37.*)

sp 3 3.

seq 16 16  : (#pre /\ ={publicseed, noiseseed,e,skpv,pkpv}).

 sp; conseq />.
 sim 3 3. 
 ecall{2} (sha3_512_33_64 inbuf{1}).
 ecall{1} (sha3_512A_A33_ph inbuf{1}) => /=.
 wp; while (={i, inc, randomnessp0, inbuf}); first by auto.
 auto => />  ???? inbuf HH r.
   rewrite /SHA3_512_33_64 /=.
 rewrite !tP => H1 H2 i ?.
 case: (0 <= i < 32) => C.
  move: (H1 i _); first done.
  rewrite initiE 1:/# /= !get_of_list 1:/# /= nth_take 1,2:/#   => ->.
   rewrite -(get_to_list) HH; smt (size_SQUEEZE1600 nth_change_dfl).
 move: (H2 (i-32) _); first smt().
 rewrite initiE 1:/# get_of_list 1:/# nth_drop 1..2:/# /= => ->.    
  rewrite -(get_to_list) HH; smt (size_SQUEEZE1600 nth_change_dfl).


seq 2 2 : (#pre /\ aa{1} = nttunpackm aa{2} /\
           pos_bound4096_cxq aa{1} 0 4096 2 /\
           pos_bound4096_cxq aa{2} 0 4096 2); 1: by 
   conseq />; call (genmatrixequiv false); auto => />.

(* swap {1} [11..12] 2. *)
do 2!(unroll for {2} ^while).
seq 12 26 : (#pre  /\
    signed_bound1024_cxq skpv{1} 0 1024 1 /\
    signed_bound1024_cxq e{1} 0 1024 1 /\
    signed_bound1024_cxq skpv{2} 0 1024 1 /\
    signed_bound1024_cxq e{2} 0 1024 1). 
+ conseq />.
  transitivity {1} { (skpv,e) <@ GetNoiseAVX2.sample_noise_kg(skpv,e,noiseseed);} (={noiseseed,skpv,pkpv,e} ==> ={skpv,e}) 
   ((
   (pk0{2} = pk{2} /\
    sk0{2} = sk{2} /\
    randomnessp0{2} = randomnessp{2} /\
    pk0{1} = pk{1} /\
    sk0{1} = sk{1} /\
    randomnessp0{1} = randomnessp{1} /\
    ={pk, sk, randomnessp} /\
   ={publicseed, noiseseed, e, skpv, pkpv}) /\
  aa{1} = nttunpackm aa{2} /\ pos_bound4096_cxq aa{1} 0 4096 2 /\ pos_bound4096_cxq aa{2} 0 4096 2)

   ==> 
    ={skpv, e} /\
  signed_bound1024_cxq skpv{1} 0 1024 1 /\
  signed_bound1024_cxq e{1} 0 1024 1 /\ signed_bound1024_cxq skpv{2} 0 1024 1 /\ signed_bound1024_cxq e{2} 0 1024 1
  ); 1,2:smt().
   
  + inline {2} 1;do 2!(wp; call getnoiseequiv_avx);auto => />. 
  inline {1} 1. inline GetNoiseAVX2._poly_getnoise_eta1_4x.
  wp;do 8!(wp; call  getnoiseequiv). 
  wp;skip  => &1 &2 [#] ????????????????R? => /=;do split.
  +  rewrite tP => k kb; rewrite !initiE //=/#.
  +  by smt().
  move => ?R0??; do split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /#.
  + by smt().
  move => ?R1??. rewrite !andabP;do split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /=  initiE 1:/# /=  /#.
  + by smt().
  move => ?R2?.  rewrite !andabP;do split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /=  initiE 1:/# /=  initiE 1:/# /=  /#.
  + by smt().
  move => ?R3?; do split.
  +  rewrite tP => k kb; rewrite !initiE //=/#.
  + by smt().
  move => ?R4??; do split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /=  /#.
  + by smt().
  move => ?R5??. rewrite !andabP;do split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /=  /#.
  + by smt().
  move => ?R6?; rewrite !andabP;do split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /=  initiE 1:/# /=  /#.
  + by smt().
  move => ?R7?;do split.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /=  initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.
  + rewrite tP => k kb; rewrite !initiE //= initiE 1:/# /= initiE 1:/# /=  initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /#.

  + rewrite /signed_bound1024_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (768 <= x && x < 1024); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound1024_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (768 <= x && x < 1024); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound1024_cxq => x xb /=.
    rewrite !andabP !initiE //= fun_if. 
    case (768 <= x && x < 1024); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound1024_cxq => x xb /=.
    rewrite !andabP !initiE //= fun_if. 
    case (768 <= x && x < 1024); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().

seq 2 2 : (#{/~skpv{1}}{~e{1}}{~skpv{2}}{~e{2}}pre /\ 
           lift_array1024 skpv{1} = nttunpackv (lift_array1024 skpv{2}) /\
           lift_array1024 e{1} = nttunpackv (lift_array1024 e{2}) /\
           pos_bound1024_cxq skpv{1} 0 1024 2 /\
           pos_bound1024_cxq skpv{2} 0 1024 2 /\
           pos_bound1024_cxq e{1} 0 1024 2 /\
           pos_bound1024_cxq e{2} 0 1024 2); 1: 
 by  conseq />; call (nttequiv); call (nttequiv); auto => /> /#.

(* First ip *)
unroll for {2} ^while.
seq 6 4: (#{/~pkpv{2}}pre /\ 
              lift_array256 (subarray256 pkpv{1} 0) = nttunpack (lift_array256 (subarray256 pkpv{2} 0)) /\
              signed_bound1024_cxq pkpv{1} 0 256 2 /\
              signed_bound1024_cxq pkpv{2} 0 256 2 /\ i{1} = 1).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9; do split.
+ rewrite -lift1024_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE // 1:/# /= kb /= initiE //=. 
+ rewrite /signed_bound1024_cxq => k kb; rewrite initiE //=. 
+ rewrite /unpackm /unpackv /=.
  rewrite !initiE // 1:/# /= kb /= initiE //=.
  rewrite fun_if. 
  case (0<=k<256).
  + move => kbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray1024 aa{2} 0).[256 * 0 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array1024.initiE). smt().
  case (256<=k<512).
  + move => kbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray1024 aa{2} 0).[256 * 1 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array1024.initiE). smt(). auto.
  case (512<=k<768).
  + move => kbbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray1024 aa{2} 0).[256 * 2 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array1024.initiE). smt(). auto.
  case (768<=k<1024).
  + move => kbbbb;rewrite /subarray256. 
    move : (nttunpack_pred (Array256.init (fun (k0 : int) => (subarray1024 aa{2} 0).[256 * 3 + k0])) (fun x => -2*q <= W16.to_sint x < 2*q)).
    rewrite !allP; move => /= [h0 h1]; rewrite  h1. move => *. rewrite initiE //=. smt(Array1024.initiE). smt(). auto.
  by smt().
+ move : H9; rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.
+ move : H8; rewrite /pos_bound1024_cxq /signed_bound_1024_cxq; smt(Array1024.initiE).
+ move : H9; rewrite /pos_bound1024_cxq /signed_bound_1024_cxq; smt(Array1024.initiE).

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


+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

(* Second ip *)

seq 5 4: (#{/~i{1}}pre /\ lift_array256 (subarray256 pkpv{1} 1) = nttunpack (lift_array256 (subarray256 pkpv{2} 1)) /\
              signed_bound1024_cxq pkpv{1} 256 512 2 /\
              signed_bound1024_cxq pkpv{2} 256 512 2 /\ i{1} = 2).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 ; do split.
+ rewrite -lift1024_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifT 1:/# initiE //=. 
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.

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
  move : H10; rewrite /lift_array256 /subarray256 tP => H15.
  move : (H15 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
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

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

(* Third ip *)

seq 5 4: (#{/~i{1}}pre /\ lift_array256 (subarray256 pkpv{1} 2) = nttunpack (lift_array256 (subarray256 pkpv{2} 2)) /\
              signed_bound1024_cxq pkpv{1} 512 768 2 /\
              signed_bound1024_cxq pkpv{2} 512 768 2 /\ i{1} = 3).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 ; do split.
+ rewrite -lift1024_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifF 1:/# ifT 1:/# initiE //=. 
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.

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
  move : H10; rewrite /lift_array256 /subarray256 tP => H10.
  move : (H10 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
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
  move : H13; rewrite /lift_array256 /subarray256 tP => H13.
  move : (H13 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
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

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

(* Fourth ip *)

seq 5 4: (#{/~i{1}}pre /\ lift_array256 (subarray256 pkpv{1} 3) = nttunpack (lift_array256 (subarray256 pkpv{2} 3)) /\
              signed_bound1024_cxq pkpv{1} 768 1024 2 /\
              signed_bound1024_cxq pkpv{2} 768 1024 2).
wp; call frommontequiv; wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18; do split.
+ rewrite -lift1024_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifF 1:/# ifF 1:/# initiE //=. 
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.

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
  move : H10; rewrite /lift_array256 /subarray256 tP => H10.
  move : (H10 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
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
  move : H13; rewrite /lift_array256 /subarray256 tP => H13.
  move : (H13 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=; 1:smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !ifF /=. smt(). 
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
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
  rewrite ifF;1:smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1:smt(nttunpack_bnd Array256.allP).
  move : H16; rewrite /lift_array256 /subarray256 tP => H16.
  move : (H16 k kb).
  rewrite /nttunpack Array256.initiE //= -/a !mapiE //=;1: smt(nttunpack_bnd Array256.allP).
  by rewrite !initiE /=;1..2:smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
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
  by rewrite /nttunpack Array256.initiE //= -/a !mapiE //=;1: smt(nttunpack_bnd Array256.allP).

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite !initiE  //=. smt(). smt().


auto => />.

move => &1 &2 ????????H1??H2??H3??H4??. 
do split.
+ smt().
+ smt(). 
+ rewrite /lift_array256 /subarray256 tP in H1.
  rewrite /lift_array256 /subarray256 tP in H2.
  rewrite /lift_array256 /subarray256 tP in H3.
  rewrite /lift_array256 /subarray256 tP in H4.
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
    rewrite /lift_array1024 /subarray256 /=.
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
    rewrite /lift_array1024 /subarray256 /=.
    pose c := nttpack_idx.[k-256].
  rewrite /nttpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k-256. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().

  case (512 <= k && k < 768).
  + move => kbb ?.
    move : (H3 (nttpack_idx.[k-512]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k-512].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /nttunpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /lift_array1024 /subarray256 /=.
    pose c := nttpack_idx.[k-512].
  rewrite /nttpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k-512. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().

  + move => *.
    move : (H4 (nttpack_idx.[k-768]) _); 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
    pose a:=nttpack_idx.[k-768].
    rewrite !mapiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /nttunpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    pose b:=nttunpack_idx.[a].
    rewrite !mapiE //=; 1:  smt(nttpack_bnd nttunpack_bnd Array256.allP).
    rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP). 
    rewrite /lift_array1024 /subarray256 /=.
    pose c := nttpack_idx.[k-768].
  rewrite /nttpack initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite initiE //=; 1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite !mapiE //=; 1:  smt(nttpack_bnd Array256.allP).
  have -> : b = k-768. move : nttunpack_idxK; rewrite /b /a allP; smt(mem_iota).
  smt().

+  smt(unpackvK).
+ smt().
+ smt().
by smt(unpackvK).
qed.


(***************************************************)

lemma mlkem_correct_enc_1_avx2 _pkp : 
   equiv [Jkem1024_avx2.M.__indcpa_enc ~ InnerPKE1024.enc_derand: 
     msgp{1} = m{2} /\  pk{1} = _pkp /\
     noiseseed{1} = coins{2} /\
     pk{2}.`1 = Array1536.init (fun i => pk{1}.[i]) /\
     pk{2}.`2 = Array32.init (fun i => pk{1}.[i+1536])
       ==> 
     let (c1,c2) = res{2} in
     c1 = Array1408.init (fun i => res{1}.[i]) /\
     c2 = Array160.init (fun i => res{1}.[i+1408])
].
proc*. 
transitivity {1} { r <@Jkem1024.M.__indcpa_enc(ct,msgp,pk,noiseseed);} 
(={ct,msgp,pk,noiseseed}  ==> ={r}) 
( msgp{1} = m{2} /\ pk{1} = _pkp /\
     noiseseed{1} = coins{2} /\
     pk{2}.`1 = Array1536.init (fun i => pk{1}.[i]) /\
     pk{2}.`2 = Array32.init (fun i => pk{1}.[i+1536])
       ==> 
     let (c1,c2) = r{2} in
     c1 = Array1408.init (fun i => r{1}.[i]) /\
     c2 = Array160.init (fun i => r{1}.[i+1408]));[ by smt() | by auto | | by call(mlkem_correct_enc _pkp); auto => /> /#].

inline{1} 1; inline {2} 1. wp.

seq 47 47 : (
     (forall k, 0 <= k < 1408 => ct0{1}.[k] = ct0{2}.[k]) /\
     pos_bound256_cxq v{1} 0 256 2 /\
     pos_bound256_cxq v{2} 0 256 2 /\
    lift_array256 v{1} = lift_array256 v{2}); last by  call (compressequiv_1); auto => /> &1 &2 H ???rr1 rr2; rewrite !tP => ? kk *;rewrite !Array1568.initiE 1,2:/# /=; smt().

swap {2} 17 27. swap {2} 1 42.
seq 45  42 : (
     pos_bound256_cxq v{1} 0 256 2 /\
     pos_bound256_cxq v{2} 0 256 2 /\
     pos_bound1024_cxq bp{1} 0 1024 2 /\
     pos_bound1024_cxq bp{2} 0 1024 2 /\
    lift_array256 v{1} = lift_array256 v{2} /\ 
    lift_array1024 bp{1} = lift_array1024 bp{2}); last  first.
+ wp;call (compressequivvec); auto => />. 
  by move => &1 &2?????? rr k *;rewrite !initiE 1,2:/# /= initiE /#.

wp;conseq />.
call (reduceequiv_noperm).
ecall (polyvec_reduce_equiv_noperm (lift_array1024 bp{2})).
call (addequiv_noperm 4 2 _ _) => //.
call (addequiv_noperm 2 2 _ _) => //.

have H := polyvec_add2_equiv_noperm 2 2 _ _ => //.
ecall (H (lift_array1024 bp{2}) (lift_array1024 ep{2})); clear H.

unroll for* {1} ^while{2}.

sp 4 3.

seq 16 20  : (#pre /\ ={publicseed, bp,ep,epp,v,sp_0,k} /\ ct{2} = ct0{1} /\ msgp0{2} = msgp{1} /\ pk0{2} = pk{1} /\
           s_noiseseed{2} = noiseseed0{2} /\
           pos_bound256_cxq k{1} 0 256 1 /\
           pos_bound256_cxq k{2} 0 256 1 /\
           lift_array1024 pkpv{1} = nttunpackv (lift_array1024 pkpv{2}) /\
           pos_bound1024_cxq pkpv{1} 0 1024 2 /\
           pos_bound1024_cxq pkpv{2} 0 1024 2 /\
           aat{1} = nttunpackm aat{2} /\
           pos_bound4096_cxq aat{1} 0 4096 2 /\
           pos_bound4096_cxq aat{2} 0 4096 2). 
+ call (genmatrixequiv true).
  wp;call frommsgequiv_noperm. conseq />. smt().
  conseq (_: _ ==> lift_array1024 pkpv{1} = nttunpackv (lift_array1024 pkpv{2}) /\ 
       pos_bound1024_cxq pkpv{1} 0 1024 2 /\ pos_bound1024_cxq pkpv{2} 0 1024 2 /\ ={publicseed,pk,bp,ep,epp,v,sp_0,pk0}).
  auto => /> pkl pkr ??? rl rr H H0 H1 ?rr0??. 
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
    by smt(W16.to_uint_eq). 
    
  seq 10 13 : (#post /\ ={publicseed}).
  wp;sp; conseq />.
  call (polyvec_frombytes_equiv).
  by auto => />. 

  by conseq />; sim.

(* swap {1} [11..12] 2. *)

do 2!(unroll for {2} ^while). sp 0 1.
seq 14 29 : (#pre  /\
    signed_bound1024_cxq sp_0{1} 0 1024 1 /\
    signed_bound1024_cxq ep{1} 0 1024 1 /\
    signed_bound_cxq epp{1} 0 256 1 /\
    signed_bound1024_cxq sp_0{2} 0 1024 1 /\
    signed_bound1024_cxq ep{2} 0 1024 1 /\ 
    signed_bound_cxq epp{1} 0 256 1).
+ conseq />.
  transitivity {1} { (sp_0,ep,epp) <@ GetNoiseAVX2.samplenoise_enc(sp_0,ep, epp,noiseseed);} 
    (noiseseed0{1} = noiseseed{2} /\
 ={sp_0,ep,bp,epp} ==> ={sp_0,ep,epp}) 
   (
   msgp0{2} = msgp{2} /\ noiseseed{2} = lnoiseseed{2} /\
   noiseseed0{2} = noiseseed{2} /\
   ct0{1} = ct{2} /\
   msgp0{2} = msgp{1} /\
   noiseseed0{1} = noiseseed{1} /\
   (={msgp, pk, noiseseed}) /\
   ={pk0} /\
  ={publicseed, bp, ep, epp, v, sp_0, k} /\
  s_noiseseed{2} = noiseseed0{2} /\
  pos_bound256_cxq k{1} 0 256 1 /\
  pos_bound256_cxq k{2} 0 256 1 /\
  lift_array1024 pkpv{1} = nttunpackv (lift_array1024 pkpv{2}) /\
  pos_bound1024_cxq pkpv{1} 0 1024 2 /\
  pos_bound1024_cxq pkpv{2} 0 1024 2 /\
  aat{1} = nttunpackm aat{2} /\ pos_bound4096_cxq aat{1} 0 4096 2 /\ pos_bound4096_cxq aat{2} 0 4096 2
   ==> 
    ={ep, epp, sp_0} /\ lnoiseseed{2} = noiseseed{2} /\
  signed_bound1024_cxq sp_0{1} 0 1024 1 /\
  signed_bound1024_cxq ep{1} 0 1024 1 /\
  signed_bound_cxq epp{1} 0 256 1 /\
  signed_bound1024_cxq sp_0{2} 0 1024 1 /\ signed_bound1024_cxq ep{2} 0 1024 1 /\ signed_bound_cxq epp{1} 0 256 1
  );1,2: smt(). 
  + inline {2} 1. 
    wp; call getnoiseequiv2. 
    by do 2!(wp; call getnoiseequiv_avx);auto => />. 
  inline {1} 1. 
  inline GetNoiseAVX2._poly_getnoise_eta1_4x.
  do 9!(wp; call  getnoiseequiv). 
  wp;skip => &1 &2 [#] ->->->?->???->???->->?->->-> ????? ->??n ; rewrite andabP;split; 1:smt(). 
  move => rr1 rr2 [#] ->? sp0;rewrite andabP;split.
  + congr; 1: by
    rewrite tP => *; rewrite !initiE /= 1,2:/# /= /sp0 initiE /#.
    by rewrite /n; ring. 
  move => r1 r2 [#] ->? sp01; split .
  + congr.
    rewrite tP => *; rewrite !initiE /= 1,2:/# /= /sp01 /sp0 initiE 1:/# /= ifF 1:/# initiE 1:/# /= /#.
    by rewrite /n; ring. 

  move => ? r11 r12 [#] ->? sp011; split .
  + congr.
    rewrite tP => *; rewrite !initiE /= 1,2:/# /= /sp011 /sp01 /sp0 initiE 1:/# /= ifF 1:/# initiE 1:/# /= initiE 1:/# /= /#.
    by rewrite /n; ring. 

  move => ? r21 r22 [#] ->? sp021; split .
  + congr.
    by rewrite tP => *; rewrite !initiE /= 1,2:/#.

  move => ? r31 r32 [#] ->? sp031; split .
  + congr.
    by rewrite tP => *; rewrite !initiE /= 1,2:/# /sp031 initiE 1:/# /= ifF 1:/#. 
    by rewrite /n; ring. 

  move => ? r41 r42 [#] ->? sp041; split .
  + congr.
     rewrite tP => *; rewrite !initiE /= 1,2:/# /sp041 initiE 1:/# /= ifF 1:/# /sp031 initiE 1:/# /= /#. 
    by rewrite /n; ring. 

  move => ? r51 r52 [#] ->? sp051; split .
  + congr.
     rewrite tP => *; rewrite !initiE /= 1,2:/# /sp051 initiE 1:/# /= ifF 1:/# /sp041 initiE 1:/# /= /sp031 initiE 1:/# /= /#. 
    by rewrite /n; ring. 

  move => ? r71 r72 [#] ->? sp071; split .
  + congr. by rewrite /n;ring.

  move => ? r81 r82 [#] ->?; do split .
  + rewrite /signed_bound1024_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (768 <= x && x < 1024); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound1024_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (768 <= x && x < 1024); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /signed_bound1024_cxq => x xb /= /#.
  + rewrite /sp021 /signed_bound1024_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (768 <= x && x < 1024); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + rewrite /sp071 /signed_bound1024_cxq => x xb /=.
    rewrite !initiE //= fun_if. 
    case (768 <= x && x < 1024); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (512 <= x && x < 768); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    case (256 <= x && x < 512); 1: by smt().
    move => *; rewrite !initiE //= fun_if. 
    by smt().
  + by smt().


seq 1 1 : (#{/~sp_0{1}}{~sp_0{2}}pre /\ 
           lift_array1024 sp_0{1} = nttunpackv (lift_array1024 sp_0{2}) /\
           pos_bound1024_cxq sp_0{1} 0 1024 2 /\
           pos_bound1024_cxq sp_0{2} 0 1024 2); 1: 
 by  conseq />; call (nttequiv); auto => /> /#.

(* First ip *)

unroll for {2} ^while.
seq 4 2 : (#{/~bp{1}}pre /\ 
              lift_array256 (subarray256 bp{1} 0) = nttunpack (lift_array256 (subarray256 bp{2} 0)) /\
              signed_bound1024_cxq bp{1} 0 256 4 /\
              signed_bound1024_cxq bp{2} 0 256 2 /\ w{1} = 1).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10; do split.
+ rewrite -lift1024_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE // 1:/# /= kb /= initiE //=. 
+ rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#.
+ rewrite /signed_bound1024_cxq => k kb; smt(). 
+ rewrite /signed_bound1024_cxq => *; rewrite initiE //=; smt().
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

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=. smt().
  rewrite kb /=. smt().

(* Second ip *)

seq 3 2: (#{/~w{1}}pre /\ lift_array256 (subarray256 bp{1} 1) = nttunpack (lift_array256 (subarray256 bp{2} 1)) /\
              signed_bound1024_cxq bp{1} 256 512 4 /\
              signed_bound1024_cxq bp{2} 256 512 2 /\ w{1} = 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13; do split.
+ rewrite -lift1024_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifT 1:/# initiE //=. 
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.

move => H18 H19 H20 H21 H22 r1 r2 H23 H24 H25;do split. 
+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1..3: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H11; rewrite /lift_array256 /subarray256 tP => H11.
  move : (H11 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //= initiE //= initiE //=. 

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound1024_cxq /= => i ib; rewrite !initiE  //=; smt().

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

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound1024_cxq /= => i ib; rewrite !initiE  //=; smt().


(* Third ip *)

seq 3 2: (#{/~w{1}}pre /\ lift_array256 (subarray256 bp{1} 2) = nttunpack (lift_array256 (subarray256 bp{2} 2)) /\
              signed_bound1024_cxq bp{1} 512 768 4 /\
              signed_bound1024_cxq bp{2} 512 768 2 /\ w{1} = 3).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H181; do split.
+ rewrite -lift1024_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifF 1:/# ifT 1:/# initiE //=. 
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.

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

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound1024_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H16; rewrite /lift_array256 /subarray256 tP => H16.
  move : (H16 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=.
  by smt(nttunpack_bnd Array256.allP Array256.initiE).  

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound1024_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifT 1: /# ifT 1:/# /=. 
  move : H23; rewrite /lift_array256 /subarray256 tP => H23.
  move : (H23 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //=.

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound1024_cxq /= => i ib; rewrite !initiE  //=; smt().

(* Fourth ip *)

seq 3 2: (#{/~w{1}}pre /\ lift_array256 (subarray256 bp{1} 3) = nttunpack (lift_array256 (subarray256 bp{2} 3)) /\
              signed_bound1024_cxq bp{1} 768 1024 4 /\
              signed_bound1024_cxq bp{2} 768 1024 2 ).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H211; do split.
+ rewrite -lift1024_nttunpack. congr.
  rewrite /nttunpackm /nttunpackv tP /= => k kb.
  rewrite !initiE //= initiE //= 1:/# ifF 1:/# ifF 1:/# ifF 1:/# initiE //=. 
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.
+ by rewrite /signed_bound1024_cxq => k kb; rewrite initiE //= /#. 
+ by rewrite /pos_bound1024_cxq /signed_bound_1024_cxq /#.

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

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound1024_cxq /= => i ib; rewrite !initiE  //=; smt().

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

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound1024_cxq /= => i ib; rewrite !initiE  //=; smt().

+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifF 1: /# ifF 1: /# /=. 
  move : H19; rewrite /lift_array256 /subarray256 tP => H19.
  move : (H19 k kb). 
  rewrite /nttunpack initiE //= -/a !mapiE //=.
  by smt(nttunpack_bnd Array256.allP Array256.initiE).  

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound1024_cxq /= => i ib; rewrite !initiE  //=; smt().


+ rewrite tP /= => k kb.
  rewrite /lift_array256 /subarray256 /nttunpack !initiE //=. 
  pose a:=nttunpack_idx.[k].
  rewrite !mapiE //=; 1:  smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1: smt(nttunpack_bnd Array256.allP).
  rewrite !initiE //=; 1, 2: smt(nttunpack_bnd Array256.allP).
  have ? /= :  0 <= a && a < 256  by smt(nttunpack_bnd Array256.allP).
  rewrite ifT 1: /# ifT 1:/# /=. 
  move : H26; rewrite /lift_array256 /subarray256 tP => H26.
  move : (H26 k kb). 
  by rewrite /nttunpack initiE //= -/a !mapiE //=.

+ rewrite /signed_bound1024_cxq /= => k kb; rewrite !initiE  //=; smt().

+ rewrite /signed_bound1024_cxq /= => i ib; rewrite !initiE  //=; smt().

(* Fifth ip *)

seq 1 2: (#{/~v{1}}pre /\ lift_array256 v{1} = nttunpack (lift_array256 v{2}) /\
              signed_bound_cxq v{1} 0 256 4 /\
              signed_bound_cxq v{2} 0 256 2).
wp; call pointwiseequiv; auto => />.
move => &1 &2 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 H22 H23 H241; do split.
+ by rewrite /signed_bound1024_cxq => k kb; smt(). 
+ by rewrite /signed_bound1024_cxq => k kb; smt(). 
+ by rewrite /signed_bound1024_cxq => k kb; smt(). 
+ by rewrite /signed_bound1024_cxq => k kb; smt(). 

(* INV NTT!!! *)
seq 1 1 : (#{/~bp{2}}{~bp{1}}pre /\ lift_array1024 bp{1} = lift_array1024 bp{2} /\ signed_bound1024_cxq bp{1} 0 1024 2 /\ signed_bound1024_cxq bp{2} 0 1024 2).
conseq />.  call(invnttequiv). auto => />. move => &1 &2 ???????????H2??H1??H0??H?????; split.
+ do split; 2,3: by smt().
  rewrite /nttunpackv.
  rewrite tP => k kb; rewrite initiE //=.
  move : H H0 H1 H2; rewrite !tP => H H0 H1 H2.
  case (0 <= k < 256).
  + move => kkb; move : (H2 k kkb). rewrite subliftsub //= => ->. 
    congr;congr.
    rewrite /lift_array256 /subarray256 /lift_array1024 tP => i ib.
    rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  case (256 <= k < 512).
  + move => nkkb kkb. move : (H1 (k-256) _); 1: smt(). rewrite subliftsub //= 1: /# => ->. 
    congr;congr.
    rewrite /lift_array256 /subarray256 /lift_array1024 tP => i ib.
    rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  case (512 <= k < 768).
  + move => nkkb kkb. move : (H0 (k-512) _); 1: smt(). rewrite subliftsub //= 1: /# => -> ?. 
    congr;congr.
    rewrite /lift_array256 /subarray256 /lift_array1024 tP => i ib.
    rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  move => *.
  move : (H (k-768) _); 1: smt(). rewrite subliftsub //= 1: /# => ->. 
  congr;congr.
  rewrite /lift_array256 /subarray256 /lift_array1024 tP => i ib.
  rewrite !mapiE //= !initiE //= !mapiE //= 1:/#.
  smt().

seq 1 1 : (#{/~v{2}}{~v{1}}pre /\ lift_array256 v{1} = lift_array256 v{2} /\ signed_bound_cxq v{1} 0 256 2 /\ signed_bound_cxq v{2} 0 256 2).
conseq />.  call(polyinvnttequiv). auto => />. smt().

auto => /> /#.
qed.




lemma mlkem_correct_dec : 
   equiv [Jkem1024_avx2.M.__indcpa_dec ~ InnerPKE1024.dec : 
     ={sk} /\
     let (c1,c2) = cph{2} in
       c1 = Array1408.init(fun i => ct{1}.[i]) /\
       c2 = Array160.init(fun i => ct{1}.[i+1408])
       ==> 
     res{1} = res{2}
].
proc*.
transitivity {1} { r <@Jkem1024.M.__indcpa_dec(msgp,ct,sk);} 
(={ct,sk} 
   ==> ={r}) 
( ={sk} /\
     let (c1,c2) = cph{2} in
       c1 = Array1408.init(fun i => ct{1}.[i]) /\
       c2 = Array160.init(fun i => ct{1}.[1408+i])
       ==> 
     r{1} = r{2}); 1,2: smt();  
   last by call(mlkem_correct_dec); auto => />.

inline{1} 1; inline {2} 1.
wp; ecall (tomsgequiv_noperm).
call (reduceequiv_noperm).
call (subequiv_noperm 2 2 _ _) => //.
call(polyinvnttequiv).
call pointwiseequiv.
call(nttequiv).
call (polyvec_frombytes_equiv).
ecall (poly_decompress_equiv).
wp; call (polyvec_decompress_equiv).
auto => />.
move => *;do split;1,2:smt().
move => *;do split;1..4:smt().
move => *;do split;1:smt().
move => *;do split;1..4:smt().
qed.
