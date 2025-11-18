require import AllCore List Int IntDiv CoreMap Real Number.

from Jasmin require import JModel.
from JazzEC require import Array1536 Array1568 Array1408 Array1410 Array1024 Array400 Array384 Array256 Array160 Array128 Array64 Array32 Array16 Array4 Array8 Array2.
from JazzEC require import WArray512 WArray384 WArray32 WArray16 WArray1410 WArray160.

require import AVX2_Ops W16extra.
from JazzEC require import Jkem1024.
from JazzEC require import Jkem1024_avx2.
require import MLKEM_PolyVec_avx2_prevec.
require import MLKEM_Poly_avx2_prevec.
require import NTT_avx2 NTT_avx2_ntt NTT_avx2_invntt.
require import Fqmul_avx2 Red_x16_avx2.
require import Fq.
require import NTT_Fq.
require import MLKEM_Poly.
require import MLKEM_PolyVec.
require import MLKEM_avx2_auxlemmas.
require import MLKEM_Poly_avx2_proof.
require import MLKEM_PolyVec_avx2_proof.
require import MLKEM_Poly_avx2_vec.
require import MLKEM_PolyVec_avx2_vec.
require import MLKEM_InnerPKE.
require import MLKEMFCLib.

import GFq Rq Symmetric Symmetric1024 Serialization Serialization1024 Sampling VecMat VecMat1024 InnerPKE1024 MLKEM1024 Correctness1024 Fq SignedReductions.

import Zq.
import ZModP.
import Fq_avx2.
import NTT_Avx2.
import MLKEM_Poly.
import MLKEM_PolyVec.

import MLKEM_PolyAVX.
import MLKEM_PolyvecAVX.
import MLKEM_PolyAVXVec.
import MLKEM_PolyVecAVXVec.

require import Bindings.


import KMatrix Vector.

from JazzEC require import WArray1568 WArray2048.
require import Bindings BitEncoding.
import BitChunking BS2Int.

require import MLKEM_avx2_equivs_frombytes MLKEM_avx2_equivs_csubq.


op tobytes_circuit(a : W16.t) : W12.t = 
   if (a \ult W16.of_int 3329) then truncateu12 a else truncateu12 (W16_sub a (W16.of_int 3329)).  

lemma polyvec_tobytes_ll : islossless Jkem1024_avx2.M.__i_polyvec_tobytes.
proc.
inline *. 
do 9!(unroll for ^while); auto. 
qed.

lemma post_lane_commute_in_aligned_perm ['a 'b 'c]
    (li : 'a list) 
    (loc : 'b list) 
    (tobitsi : 'a -> bool list)
    (ofbitsi : bool list -> 'a)
    (tobitsoc : 'b -> bool list)
    (ofbitsoc : bool list -> 'b)
    (tobitso : 'c -> bool list)
    (ofbitso : bool list -> 'c)
    (f : 'a -> 'c)
    (ni no noc  : int) 
    (perm : int -> int)
    (permi : int -> int):
  0 < ni =>  0 < no => 0 < noc => 
  no %| noc*size loc =>
  size li = (noc*size loc) %/ no =>
  (forall x, size (tobitsi x) = ni) =>
  (forall x, ofbitsi (tobitsi x) = x) =>
  (forall x, size (tobitso x) = no) =>
  (forall x, ofbitso (tobitso x) = x) =>
  (forall x, size x = no => tobitso (ofbitso x) = x) =>
  (forall x, size (tobitsoc x) = noc) =>
  (forall x, ofbitsoc (tobitsoc x) = x) =>
  (forall ii, 0 <= ii < size li => 0 <= permi ii < size li) =>
  (forall ii, 0 <= ii < size li => perm (permi ii) = ii) =>
map f (map ofbitsi (chunk ni (flatten (map tobitsi  li)))) =
mkseq (fun i => nth witness
     (map ofbitso (chunk no (flatten (map tobitsoc loc)))) (perm i)) 
      (size (map ofbitso (chunk no (flatten (map tobitsoc loc))))) => 
   flatten (map tobitsoc loc) =
   flatten (map tobitso (map f (mkseq (fun i => nth witness li (permi i)) (size li)))).
move => 14?.
rewrite map_chunk_flatten_id 1..3:/#.
move => H.
rewrite map_mkseq /(\o) /=.
have -> : (mkseq (fun (x : int) => f (nth witness li (permi x))) (size li)) =
   (mkseq (fun (x : int) =>  (nth witness (map f li) (permi x))) (size li)).
+ apply eq_in_mkseq => i ib /=.
  by rewrite (nth_map witness) 1:/#.
rewrite H.
have -> : (mkseq
        (fun (x : int) =>
           nth witness
             (mkseq (fun (i : int) => nth witness (map ofbitso (chunk no (flatten (map tobitsoc loc)))) (perm i))
                (size (map ofbitso (chunk no (flatten (map tobitsoc loc)))))) (
             permi x)) (size li)) =
   map ofbitso (mkseq
        (fun (x : int) =>
           nth witness
             (mkseq (fun (i : int) => nth witness (chunk no (flatten (map tobitsoc loc))) (perm i))
                (size (map ofbitso (chunk no (flatten (map tobitsoc loc)))))) (
             permi x)) (size li)).
have -> := map_mkseq ofbitso
     (fun (x : int) =>
        nth witness
          (mkseq (fun (i : int) => nth witness (chunk no (flatten (map tobitsoc loc))) (perm i))
             (size (map ofbitso (chunk no (flatten (map tobitsoc loc)))))) (
          permi x)) (size li).
+ apply eq_in_mkseq => i ib /=.
  rewrite /(\o) /= !(nth_mkseq) /=;1,2: by 
  rewrite size_map size_chunk 1:/#  (EclibExtra.size_flatten' noc);smt(mapP size_map).
  by rewrite (nth_map witness);1: by
   rewrite size_chunk 1:/# (EclibExtra.size_flatten' noc);smt(mapP size_map).

rewrite -map_comp /(\o) /=.

have -> : (mkseq
        (fun (x : int) =>
           nth witness
             (mkseq (fun (i : int) => nth witness (chunk no (flatten (map tobitsoc loc))) (perm i))
                (size (map ofbitso (chunk no (flatten (map tobitsoc loc)))))) (
             permi x)) (size li))
 = (chunk no (flatten (map tobitsoc loc))) .
+ apply (eq_from_nth witness).
  + rewrite size_mkseq size_chunk 1:/# (EclibExtra.size_flatten' noc);1: smt(mapP).
    rewrite size_map;smt(size_ge0).
  move => i; rewrite size_mkseq /max => ib.
  rewrite nth_mkseq 1:/# /= nth_mkseq /=.  
  + rewrite size_map size_chunk 1:/# (EclibExtra.size_flatten' noc);1: smt(mapP).
    rewrite size_map;smt(size_ge0).
  by smt().
have /= [-> x] := eq_in_map (fun (x : bool list) => tobitso (ofbitso x)) idfun (chunk no (flatten (map tobitsoc loc))).
have := in_chunk_size no (flatten (map tobitsoc loc)) x _;smt().

rewrite map_id chunkK 1:/#; last by done.
rewrite (EclibExtra.size_flatten' noc); smt(size_map mapP).
qed.

lemma output_pack_1536_8(l : bool list) :
 size l = 1024*12 =>
 flatten
  (map W8.w2bits
     (to_list (Array1536.of_list W8.zero (BitsToBytes l)))) = l.
move => *.
rewrite of_listK; 1: by rewrite size_BitsToBytes /#.
have ? : size (flatten (map W8.w2bits (BitsToBytes l))) = size l.
+ rewrite (EclibExtra.size_flatten' 8);1: smt(mapP W8.size_w2bits).
  by rewrite size_map size_BitsToBytes /#.

apply (eq_from_nth witness); 1: smt().
move => i ib.
rewrite (nth_flatten _ 8);1: by rewrite allP => *; smt( mapP W8.size_w2bits).
rewrite (nth_map witness);1: smt(size_BitsToBytes).
rewrite /BitsToBytes (nth_map []);1:by smt(size_chunk).
rewrite bits2wK;1: smt(size_nth_chunk).
rewrite -(nth_flatten _ 8);1: by rewrite allP => * /=;smt(in_chunk_size). 
by rewrite chunkK /#.
qed.

lemma nttpackv_alt (a : W16.t Array1024.t) i :
 0 <= i < 1024 =>
  a.[perm_nttpackv i] = (nttpackv a).[i].
proof.
move => ?;have : all (fun i => a.[perm_nttpackv i] = (nttpackv a).[i]) (iota_ 0 1024);
  last by rewrite allP => H; move : (H i);smt(mem_iota).
by rewrite /nttpackv /subarray256 /nttpack /perm_nttpackv -iotaredE /=.
qed. 

abbrev mask12 = VPBROADCAST_16u16(W16.of_int 4095).

module AuxToBytes = {
proc __i_polyvec_tobytes(r : W8.t Array1536.t, a : W16.t Array1024.t) : W8.t Array1536.t = {
  var i,rp,a0,i0,t0,t1,t2,t3,t4,t5,t6,t7,tt,ttt,a1,b,t00,r00,t10,r1,a2,b0,t01,r01,t11,r10,a3,b1,t02,r02,t12,r11,a4,b2,t03,t13,a5,b3,t04,t14,a6,b4,t05,t15,a7,b5,r03,r12,a8,b6,r04,r13,a9,b7,r05,r14,a10,b8,r06,r15,a11,b9,r07,r16,a12,b10,r08,r17,aux,aux_0;
  i <- 0;                                                                                                                       
  while (i < 4) {                                                                                                              
    rp <- Array384.init (fun (i_0 : int) => r.[384 * i + i_0]);                                                                 
    a0 <- Array256.init (fun (i_0 : int) => a.[256 * i + i_0]);  
    a0 <@ Jkem1024_avx2.M._poly_csubq(a0);                                                           
    i0 <- 0;                                                                                                                    
    while (i0 < 2) {                                                                                                           
      t0 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0);                                                   
      t1 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 1);                                               
      t2 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 2);                                               
      t3 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 3);                                               
      t4 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 4);                                               
      t5 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 5);                                               
      t6 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 6);                                               
      t7 <- get256 (WArray512.init16 (fun (i_0 : int) => a0.[i_0])) (8 * i0 + 7);                                               
      t0 <- t0 `&` mask12;                                                                                                      
      t1 <- t1 `&` mask12;                                                                                                      
      t2 <- t2 `&` mask12;                                                                                                      
      t3 <- t3 `&` mask12;                                                                                                      
      t4 <- t4 `&` mask12;                                                                                                      
      t5 <- t5 `&` mask12;                                                                                                      
      t6 <- t6 `&` mask12;                                                                                                      
      t7 <- t7 `&` mask12;                                                                                                      
      tt <- VPSLL_16u16 t1 (W128.of_int 12);                                                                                    
      tt <- tt `|` t0;                                                                                                          
      t0 <- VPSRL_16u16 t1 (W128.of_int 4);                                                                                     
      t1 <- VPSLL_16u16 t2 (W128.of_int 8);                                                                                     
      t0 <- t0 `|` t1;                                                                                                          
      t1 <- VPSRL_16u16 t2 (W128.of_int 8);                                                                                     
      t2 <- VPSLL_16u16 t3 (W128.of_int 4);                                                                                     
      t1 <- t1 `|` t2;                                                                                                          
      t2 <- VPSLL_16u16 t5 (W128.of_int 12);                                                                                    
      t2 <- t2 `|` t4;                                                                                                          
      t3 <- VPSRL_16u16 t5 (W128.of_int 4);                                                                                     
      t4 <- VPSLL_16u16 t6 (W128.of_int 8);                                                                                     
      t3 <- t3 `|` t4;                                                                                                         
      t4 <- VPSRL_16u16 t6 (W128.of_int 8);                                                                                     
      t5 <- VPSLL_16u16 t7 (W128.of_int 4);                                                                                     
      t4 <- t4 `|` t5;                                                                                                          
      a1 <- tt;                                                                                                                 
      b <- t0;                                                                                                                  
      t00 <- VPSLL_8u32 b (W128.of_int 16);                                                                                     
      r00 <- VPBLENDW_256 a1 t00 (W8.of_int 170);                                                                               
      t10 <- VPSRL_8u32 a1 (W128.of_int 16);                                                                                    
      r1 <- VPBLENDW_256 t10 b (W8.of_int 170);                                                                                 
      (ttt, t0) <- (r00, r1);                                                                                                   
      a2 <- t1;                                                                                                                 
      b0 <- t2;                                                                                                                 
      t01 <- VPSLL_8u32 b0 (W128.of_int 16);                                                                                    
      r01 <- VPBLENDW_256 a2 t01 (W8.of_int 170);                                                                               
      t11 <- VPSRL_8u32 a2 (W128.of_int 16);                                                                                    
      r10 <- VPBLENDW_256 t11 b0 (W8.of_int 170);                                                                               
      (tt, t2) <- (r01, r10);                                                                                                   
      a3 <- t3;                                                                                                                 
      b1 <- t4;                                                                                                                
      t02 <- VPSLL_8u32 b1 (W128.of_int 16);                                                                                    
      r02 <- VPBLENDW_256 a3 t02 (W8.of_int 170);                                                                               
      t12 <- VPSRL_8u32 a3 (W128.of_int 16);                                                                                    
      r11 <- VPBLENDW_256 t12 b1 (W8.of_int 170);                                                                               
      (t1, t4) <- (r02, r11);                                                                                                   
      a4 <- ttt;                                                                                                               
      b2 <- tt;                                                                                                                 
      t03 <- VMOVSLDUP_256 b2;                                                                                                  
      t03 <- VPBLENDD_256 a4 t03 (W8.of_int 170);                                                                               
      a4 <- VPSRL_4u64 a4 (W128.of_int 32);                                                                                     
      t13 <- VPBLENDD_256 a4 b2 (W8.of_int 170);                                                                                
      (t3, tt) <- (t03, t13);                                                                                                   
      a5 <- t1;                                                                                                                 
      b3 <- t0;                                                                                                                 
      t04 <- VMOVSLDUP_256 b3;                                                                                                  
      t04 <- VPBLENDD_256 a5 t04 (W8.of_int 170);                                                                               
      a5 <- VPSRL_4u64 a5 (W128.of_int 32);                                                                                     
      t14 <- VPBLENDD_256 a5 b3 (W8.of_int 170);                                                                                
      (ttt, t0) <- (t04, t14);                                                                                                  
      a6 <- t2;                                                                                                                 
      b4 <- t4;                                                                                                                 
      t05 <- VMOVSLDUP_256 b4;                                                                                                  
      t05 <- VPBLENDD_256 a6 t05 (W8.of_int 170);                                                                               
      a6 <- VPSRL_4u64 a6 (W128.of_int 32);                                                                                     
      t15 <- VPBLENDD_256 a6 b4 (W8.of_int 170);                                                                                
      (t1, t4) <- (t05, t15);                                                                                                   
      a7 <- t3;                                                                                                                 
      b5 <- ttt;                                                                                                                
      r03 <- VPUNPCKL_4u64 a7 b5;                                                                                               
      r12 <- VPUNPCKH_4u64 a7 b5;                                                                                               
      (t2, ttt) <- (r03, r12);                                                                                                  
      a8 <- t1;                                                                                                                 
      b6 <- tt;                                                                                                                 
      r04 <- VPUNPCKL_4u64 a8 b6;                                                                                               
      r13 <- VPUNPCKH_4u64 a8 b6;                                                                                               
      (t3, tt) <- (r04, r13);                                                                                                   
      a9 <- t0;                                                                                                                 
      b7 <- t4;                                                                                                                 
      r05 <- VPUNPCKL_4u64 a9 b7;                                                                                               
      r14 <- VPUNPCKH_4u64 a9 b7;                                                                                               
      (t1, t4) <- (r05, r14);                                                                                                   
      a10 <- t2;                                                                                                                
      b8 <- t3;                                                                                                                 
      r06 <- VPERM2I128 a10 b8 (W8.of_int 32);                                                                                  
      r15 <- VPERM2I128 a10 b8 (W8.of_int 49);                                                                                  
      (t0, t3) <- (r06, r15);                                                                                                   
      a11 <- t1;                                                                                                                
      b9 <- ttt;                                                                                                                
      r07 <- VPERM2I128 a11 b9 (W8.of_int 32) ;                                                                                 
      r16 <- VPERM2I128 a11 b9 (W8.of_int 49) ;                                                                                 
      (t2, ttt) <- (r07, r16);                                                                                                  
      a12 <- tt;                                                                                                                
      b10 <- t4;                                                                                                                
      r08 <- VPERM2I128 a12 b10 (W8.of_int 32);                                                                                 
      r17 <- VPERM2I128 a12 b10 (W8.of_int 49);                                                                                 
      (t1, t4) <- (r08, r17);                                                                                                   
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0) t0));      
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0 + 32) t2)); 
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0 + 64) t1)); 
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0 + 96) t3)); 
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (                    
                192 * i0 + 128) ttt));                                                                                          
      rp <-                                                                                                                    
        Array384.init                                                                                                          
          (WArray384.get8                                                                                            
             (WArray384.set256_direct (WArray384.init8 (fun (i_0 : int) => rp.[i_0])) (192 * i0 + 160) t4));
      i0 <- i0 + 1;                                                                                                             
    }                                                                                                                          
    (aux, aux_0) <- (rp, a0);                                                                                                   
    r <- Array1536.init (fun (i_0 : int) => if 384 * i <= i_0 < 384 * i + 384 then aux.[i_0 - 384 * i] else r.[i_0]);           
    a <- Array1024.init (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux_0.[i_0 - 256 * i] else a.[i_0]);         
    i <- i + 1;                                                                                                                 
  }
  return r;
 }       
}.

lemma auxtobytes_corr_h (_aw : W16.t Array1024.t):
    hoare[AuxToBytes.__i_polyvec_tobytes :
             pos_bound1024_cxq a 0 1024 2 /\ a = _aw ==> 
    res = encode12_vec (map asint (lift_array1024 (nttpackv _aw)))]. 
proc;inline *.
proc change ^while.1: (init_384_8 (fun i_0 => r.[384 * i + i_0]));1: by auto.
proc change ^while.2: (init_256_16 (fun i_0 => a.[256 * i + i_0]));1: by auto.
(* FIXME: CHECK qx16 initialization inside while *)
proc change ^while.4: (sliceget16_16_256 jqx16 0); 1: by auto.
proc change ^while.^while.1: (sliceget256_16_256 rp0 (i1*256)); 1: by auto => /#.
proc change ^while.^while.9 : (sliceset256_16_256 rp0 (i1*256) r0); 1: by auto => /> /#.
proc change ^while.^while{2}.1 : (sliceget256_16_256 a0 (8*i0*256));1: by auto => /#.
proc change ^while.^while{2}.2 : (sliceget256_16_256 a0 ((8*i0+1)*256));1: by auto => /#.
proc change ^while.^while{2}.3 : (sliceget256_16_256 a0 ((8*i0+2)*256));1: by auto => /#.
proc change ^while.^while{2}.4 : (sliceget256_16_256 a0 ((8*i0+3)*256));1: by auto => /#.
proc change ^while.^while{2}.5 : (sliceget256_16_256 a0 ((8*i0+4)*256));1: by auto => /#.
proc change ^while.^while{2}.6 : (sliceget256_16_256 a0 ((8*i0+5)*256));1: by auto => /#.
proc change ^while.^while{2}.7 : (sliceget256_16_256 a0 ((8*i0+6)*256));1: by auto => /#.
proc change ^while.^while{2}.8 : (sliceget256_16_256 a0 ((8*i0+7)*256));1: by auto => /#.
proc change ^while.^while{2}.105 : (sliceset384_8_256 rp (192*i0*8) t0);1: by auto => /#.
proc change ^while.^while{2}.106 : (sliceset384_8_256 rp ((192*i0+32)*8) t2);1: by auto => /#.
proc change ^while.^while{2}.107 : (sliceset384_8_256 rp ((192*i0+64)*8) t1);1: by auto => /#.
proc change ^while.^while{2}.108 : (sliceset384_8_256 rp ((192*i0+96)*8) t3);1: by auto => /#.
proc change ^while.^while{2}.109 : (sliceset384_8_256 rp ((192*i0+128)*8) ttt);1: by auto => /#.
proc change ^while.^while{2}.110 : (sliceset384_8_256 rp ((192*i0+160)*8) t4);1: by auto => /#.
proc change ^while.11: (init_1536_8 (fun (i_0 : int) => if 384 * i <= i_0 < 384 * i + 384 then aux.[i_0 - 384 * i] else r.[i_0])  ); 1: by auto.
proc change ^while.12: (init_1024_16  (fun (i_0 : int) => if 256 * i <= i_0 < 256 * i + 256 then aux_0.[i_0 - 256 * i] else a.[i_0]));1: by auto. 

unroll for ^while.
do 8!(unroll for ^while).
cfold ^i<-.
cfold ^i0<-.
cfold ^i1<-.
wp -4.

bdep 16 12 [_aw] [a] [r] tobytes_circuit pcond_reduced perm_nttunpackv. 

(* BDEP pre conseq *)
+ move => &hr />; rewrite flatten1 /= pre_lane_commute_in_aligned 1:/# //=.
  rewrite allP /pos_bound124_cxq /= => Hb. 
  rewrite /pcond_reduced /= /tolist /= => x.
  rewrite  mkseqP => He;elim He => /= i [ib?]; rewrite ultE /=.
  have := Hb i; rewrite ib /= qE /=.
  rewrite /to_sint /smod /=.
  smt(W16.to_uint_cmp).

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= H0 <- rr; rewrite /= !flatten1.
move => H1.
apply (inj_eq Array1536.to_list Array1536.to_list_inj).
apply (flatten_map_eq _ _ W8.w2bits 8 _ W8.w2bits_inj W8.size_w2bits);1:smt().
have -> := post_lane_commute_in_aligned_perm (to_list a{hr}) (to_list rr) W16.w2bits W16.bits2w W8.w2bits W8.bits2w W12.w2bits W12.bits2w  tobytes_circuit 16 12 8 perm_nttunpackv perm_nttpackv _ _ _ _ _ _ _ _ _ _ _ _ _ _ _;1..12:
smt(Array1536.size_to_list Array1024.size_to_list W16.bits2wK BVA_Top_Bindings_W12_t.oflistP).
+ smt(perm_nttpackv_rng Array1024.size_to_list).
+ move => ?; rewrite Array1024.size_to_list => ?;smt(nttpermsKi). 
+ by smt().

rewrite output_pack_1536_8. 
+ rewrite (EclibExtra.size_flatten' 12);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /=.

congr.
rewrite /tobytes_circuit -map_comp -map_comp -map_comp /(\o) /=.
apply (eq_from_nth witness);1: by  rewrite !size_map //;smt(size_iota).
rewrite size_map !size_iota /max /= => i; rewrite size_to_list /= => ib; rewrite !(nth_map witness) //=;1,2:smt(size_iota).
rewrite nth_iota 1:/# -(BVA_Top_Bindings_W12_t.oflistP (BS2Int.int2bs 12 (map asint (lift_array1024 (nttpackv a{hr}))).[i])); 1: by rewrite BS2Int.size_int2bs /#.
congr; rewrite -BVA_Top_Bindings_W12_t.ofintP /lift_array256;rewrite !mapiE 1,2:/#.

(* This is now the equivalence betwen specs.*)
rewrite ultE /=; have HH := nttpackv_alt a{hr} i ib.
have HG := perm_nttpackv_rng i ib.
rewrite HH.

case (to_uint (nttpackv a{hr}).[i] < 3329) => /= *.
+ rewrite  /truncateu12;congr. 
  rewrite incoeffK qE /to_sint /= /smod /= ifF 1:/#  modz_small;smt(W16.to_uint_cmp). 

have := H0;rewrite /pos_bound1024_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub (nttpackv a{hr}).[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=;smt(size_map size_iota). 
   rewrite  /(to_sint (W16.of_int 3329)) /= /smod /=;   smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub (nttpackv a{hr}).[i] (W16.of_int 3329))) = to_sint (nttpackv a{hr}).[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have -> : (incoeff (to_sint (nttpackv a{hr}).[i])) = (incoeff (to_sint (W16_sub (nttpackv a{hr}).[i] (W16.of_int 3329)))) by  rewrite -eq_incoeff; smt(). 

+ rewrite  /truncateu12;congr. 
  rewrite incoeffK qE modz_small;smt(W16.to_uint_cmp). 
 
qed.

lemma auxtobytes_ll : islossless AuxToBytes.__i_polyvec_tobytes.
proc.
inline *. 
do 9!(unroll for ^while); auto. 
qed.

lemma auxtobytes_corr (_aw : W16.t Array1024.t):
    phoare[ AuxToBytes.__i_polyvec_tobytes :
             pos_bound1024_cxq a 0 1024 2 /\ a = _aw ==> 
    res = encode12_vec (map asint (lift_array1024 (nttpackv _aw)))] = 1%r
  by conseq auxtobytes_ll (auxtobytes_corr_h _aw).


lemma polyvec_tobytes_corr (_aw : W16.t Array1024.t):
    phoare[ Jkem1024_avx2.M.__i_polyvec_tobytes :
             pos_bound1024_cxq a 0 1024 2 /\ a = _aw ==> 
    res = encode12_vec (map asint (lift_array1024 (nttpackv _aw)))] = 1%r.
proof.
bypr => &m [??].
have <- : Pr[AuxToBytes.__i_polyvec_tobytes(r{m}, _aw) @ &m : res = encode12_vec (map asint (lift_array1024 (nttpackv _aw)))] = 1%r
 by byphoare (auxtobytes_corr _aw)  =>/=; 1:smt().
byequiv (: ={arg} /\ a{1} = _aw /\
             pos_bound1024_cxq a{1} 0 1024 2 ==> ={res}) => //.
proc => /=. 
inline M._i_poly_tobytes.
while (={r, a,i} /\ 0 <= i{1} <= 4 /\
   pos_bound1024_cxq a{1} 0 1024 2); last by auto => /> /#.
seq 3 3 : (#pre /\ ={rp,a0} /\
   pos_bound256_cxq a0{1} 0 256 1).
+ ecall {1} (poly_csubq_avx2_corr a0{1}).
  ecall {2} (poly_csubq_avx2_corr a0{2}).
  auto => /> &1; rewrite /pos_bound1024_cxq /pos_bound256_cxq /lift_array256 /= qE /= => ????;split; 1: by smt(Array256.initiE).
  move => ? rr1.
  rewrite !tP;move =>  Hrr11 Hrr12 rr2.
  rewrite !tP;move =>  Hrr21 Hrr22.
  move => ii iib. 
  have := Hrr11 ii iib; rewrite !mapiE 1,2:/# /=. 
  have := Hrr12 ii iib.  
  have := Hrr21 ii iib; rewrite !mapiE 1,2:/# /=. 
  have := Hrr22 ii iib.  
  rewrite /to_sint /smod /=. 
  move => Hrr11i Hrr12i Hrr21i Hrr22i.
  have Hn1 : !(32768 <= to_uint rr2.[ii]) by smt(W16.to_uint_cmp pow2_16).
  have Hn2 : !(32768 <= to_uint rr1.[ii]) by smt(W16.to_uint_cmp pow2_16).
  have Hn3 : !(32768 <= to_uint _aw.[ii]) by smt(W16.to_uint_cmp pow2_16).
  move : Hrr11i Hrr12i Hrr21i Hrr22i; rewrite Hn1 Hn2 /=.
  move => Hrr11i Hrr12i Hrr21i Hrr22i.
  move : Hrr12i; rewrite -Hrr22i -eq_incoeff.  
  by rewrite !modz_small ?qE /= 1,2:/# to_uint_eq /#.

wp;while (#pre /\ ={i0} /\ 0<=i0{1}<=2); last first.
+ auto => /> &2 ?????i0r????;split;1:smt().
  rewrite /pos_bound1024_cxq => k kb; rewrite initiE 1:/# /= /#.

wp -1 -1; conseq (: _ ==> ={rp}); 1: by smt().

inline *;sim; auto => /> &1 &2 ???;rewrite /pos_bound256_cxq qE /= => Hb ???.

have Hpos : forall jj kk ii, 0 <= jj < 8 => 0 <= kk < 16 => 0 <= ii < 16 => (get256 (WArray512.init16 ("_.[_]" a0{1})) (8 * i0{1} + jj) \bits16 kk).[ii] = a0{1}.[kk + 16*jj + i0{1}*128].[ii] by
  move => jj kk ii jjb kkb iib; rewrite get256E /pack32_t /(\bits16) initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= /(\bits8) initiE 1:/# /= /#.

have bits : forall kk ii, 0 <= kk < 256 => 12 <= ii < 16 => !a0{1}.[kk].[ii].
+ move => kk ii kkb iib; have := Hb kk kkb;rewrite /to_sint /smod /= => Hn.
  have Hn1 : !32768 <= to_uint a0{1}.[kk] by smt(W16.to_uint_cmp pow2_16).
  move : Hn; rewrite Hn1 /= get_to_uint . 
  have ? : 4096 <= 2^ii;last by smt().
  have ? : 4096 = 2^12 by auto.
  smt(@StdOrder.IntOrder). 

have bitsC : forall  ii, 0 <= ii < 16 => (W16.of_int 4095).[ii] <=> 0<=ii<12.
+ move => ii iib.
  have : all (fun i => (W16.of_int 4095).[i] <=> 0 <= i < 12) (iota_ 0 16); 
  last by rewrite allP => H; move : (H ii _);smt(mem_iota).
  by rewrite -iotaredE /= !get_to_uint /=.


do split; rewrite /VPBROADCAST_16u16 /= -(W16u16.unpack16K (WArray512.get256 _ _)) -(W16u16.unpack16K (W16u16.pack16 _)) !andb16u16E;congr;rewrite packP => k kb;rewrite map2iE 1:/# /= andE wordP => ii iib;rewrite map2iE 1:/# /= get_of_list 1:/# /= (nth_map witness)  /=;1,3,5,7,9,11,13,15:smt(size_iota); rewrite unpack16E initiE 1:/# /=;1..7: by rewrite Hpos /#.
      have /= -> := Hpos 0;smt().
qed.


lemma polyvec_tobytes_equiv :
    equiv [Jkem1024_avx2.M.__i_polyvec_tobytes ~Jkem1024.M.__i_polyvec_tobytes :
             pos_bound1024_cxq a{1} 0 1024 2 /\
             pos_bound1024_cxq a{2} 0 1024 2 /\
             lift_array1024 a{1} = nttunpackv (lift_array1024 a{2}) ==> ={res} ].
proof.
proc*.
ecall{1} (polyvec_tobytes_corr a{1}).
ecall{2} (MLKEM_PolyVec.polyvec_tobytes_corr a{2}).
by auto => /> &1 &2 ??; rewrite -nttpackv_lift => ->; rewrite  unpackvK.
qed.
