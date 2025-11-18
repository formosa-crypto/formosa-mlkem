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
require import NTT_avx2_invntt NTT_avx2_ntt NTT_avx2.
require import NTT_AVX_j_invntt NTT_AVX_j_ntt NTT_AVX_j.
require import Fq NTT_Fq NTT_AVX_Fq_ntt NTT_AVX_Fq_invntt NTT_AVX_Fq_basemul.
require import 
  MLKEM_avx2_equivs_basemul_add2 
  MLKEM_avx2_equivs_compress 
  MLKEM_avx2_equivs_compress2 
  MLKEM_avx2_equivs_csubq 
  MLKEM_avx2_equivs_decompress 
  MLKEM_avx2_equivs_decompress2 
  MLKEM_avx2_equivs_frombytes 
  MLKEM_avx2_equivs_frommont_reduce 
  MLKEM_avx2_equivs_frommsg 
  MLKEM_avx2_equivs_invntt 
  MLKEM_avx2_equivs_ntt 
  MLKEM_avx2_equivs_pointwise 
  MLKEM_avx2_equivs_polysub 
  MLKEM_avx2_equivs_polyvecadd2_reduce 
  MLKEM_avx2_equivs_tobytes 
  MLKEM_avx2_equivs_tomsg.
require import Montgomery16.
require import AVX2_Ops.
require import MLKEM_keccak_ref MLKEM_keccak_avx2.
require import MLKEM_ntt_pack_avx2 MLKEM_genmatrix_avx2 MLKEM_genmatrix_avx2_more.

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
 rewrite -!PURE 1..4:/#. 
 apply/List.allP => k; rewrite mem_iota /= => |> *.
 rewrite !PUR_get 1..8:/#.
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
conseq HHH HH0.
move => *; rewrite /signed_bound_cxq /b16 qE /#.
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
