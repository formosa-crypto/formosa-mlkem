require import AllCore List Int IntDiv CoreMap Real Number.
from Jasmin require import JModel.
require import Array1152 Array960 Array768 Array400 Array384 Array256 Array128 Array64 Array32 Array16 Array4 Array8.
require import W16extra WArray1536 WArray960 WArray512 WArray32 WArray16.
require import AVX2_Ops.
require import MLKEM_avx2_encdec.
require import Jkem.
require import Jkem_avx2.
require import MLKEM_PolyVec_avx2_prevec.
require import MLKEM_Poly_avx2_prevec.
require import NTT_avx2.
require import Fq_avx2.
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

import GFq Rq Symmetric Serialization Sampling VecMat InnerPKE MLKEM Correctness Fq SignedReductions.

import Zq.
import ZModP.
import Fq_avx2.
import NTT_Avx2.
import MLKEM_Poly.
import MLKEM_PolyVec.
import AVX2_cf.

import MLKEM_PolyAVX.
import MLKEM_PolyvecAVX.
import MLKEM_PolyAVXVec.
import MLKEM_PolyVecAVXVec.


import BitEncoding.BitChunking.

require import Array128 WArray128.


timeout 1.

(*************************)
(*************************)
(* BEGIN BINDINGS        *)
(*************************)
(*************************)
(*************************)

require import QFABV.

theory W4.
  abbrev [-printing] size = 4.
  clone include BitWordSH with op size <- size
  rename "_XX" as "_4"
  proof gt0_size by done,
        size_le_256 by done.

end W4. export W4 W4.ALU W4.SHIFT.

bind bitstring W4.w2bits W4.bits2w W4.t 4.
realize ge0_size by auto.
realize size_tolist by exact W4.size_w2bits.
realize tolistK by exact W4.w2bitsK.
realize oflistK by exact W4.bits2wK.
bind bitstring W256.w2bits W256.bits2w W256.t 256.
realize ge0_size by auto.
realize size_tolist by exact W256.size_w2bits.
realize tolistK by exact W256.w2bitsK.
realize oflistK by exact W256.bits2wK.
bind bitstring W64.w2bits W64.bits2w W64.t 64.
realize ge0_size by auto.
realize size_tolist by exact W64.size_w2bits.
realize tolistK by exact W64.w2bitsK.
realize oflistK by exact W64.bits2wK.
bind bitstring W32.w2bits W32.bits2w W32.t 32.
realize ge0_size by auto.
realize size_tolist by exact W32.size_w2bits.
realize tolistK by exact W32.w2bitsK.
realize oflistK by exact W32.bits2wK.
bind bitstring W16.w2bits W16.bits2w W16.t 16.
realize ge0_size by auto.
realize size_tolist by exact W16.size_w2bits.
realize tolistK by exact W16.w2bitsK.
realize oflistK by exact W16.bits2wK.
bind bitstring W8.w2bits W8.bits2w W8.t 8.
realize ge0_size by auto.
realize size_tolist by exact W8.size_w2bits.
realize tolistK by exact W8.w2bitsK.
realize oflistK by exact W8.bits2wK.
bind circuit VPSUB_16u16 "VPSUB_16u16".
bind circuit VPSRA_16u16 "VPSRA_16u16".
bind circuit VPADD_16u16 "VPADD_16u16".
bind circuit W256.(`&`) "AND_256".
bind circuit VPBROADCAST_16u16 "VPBROADCAST_16u16".
bind circuit VPMULH_16u16 "VPMULH_16u16".
bind circuit VPMULHRS_16u16 "VPMULHRS_16u16".
bind circuit VPACKUS_16u16 "VPACKUS_16u16".
bind circuit VPMADDUBSW_256 "VPMADDUBSW_256".
bind circuit VPERMD "VPERMD".

bind op W16.(+) "bvadd".
realize bvaddP. 
move => bv1 bv2.
by rewrite /BV_W16_t.toint -!W16.to_uintE !W16.to_uintD W16.to_uintE.
qed.

bind op W32.(+) "bvadd".
realize bvaddP. 
move => bv1 bv2.
by rewrite /BV_W32_t.toint -!W32.to_uintE !W32.to_uintD W32.to_uintE.
qed.

bind op W64.(+) "bvadd".
realize bvaddP. 
move => bv1 bv2.
by rewrite /BV_W64_t.toint -!W64.to_uintE !W64.to_uintD W64.to_uintE.
qed.

op sliceget_256_256_16(a : W16.t Array256.t, i : int) : W256.t =
   WArray512.get256 (WArray512.init16 (fun (i_0 : int) => a.[i_0])) i.

lemma sliceget_256_256_16E (a : W16.t Array256.t) (i : int) :
   WArray512.get256 (WArray512.init16 (fun (i_0 : int) => a.[i_0])) i = 
    sliceget_256_256_16 a i by auto.

op sliceset_256_256_16(a : W16.t Array256.t,i : int, x : W256.t) : W16.t Array256.t =
   Array256.init (fun (i0 : int) => WArray512.get16 (WArray512.set256 ((WArray512.init16 (fun (i_0 : int) => a.[i_0]))) i x) i0).

lemma sliceset_256_256_16E  (a : W16.t Array256.t) (i : int) (x  : W256.t) :
  Array256.init (fun (i0 : int) => WArray512.get16 (WArray512.set256 ((WArray512.init16 (fun (i_0 : int) => a.[i_0]))) i x) i0) = 
   sliceset_256_256_16 a i x by auto.

op sliceget_256_768_16(a : W16.t Array768.t, i : int) : W256.t =
   WArray1536.get256 (WArray1536.init16 (fun (i_0 : int) => a.[i_0])) i.

lemma sliceget_256_768_16E (a : W16.t Array768.t) (i : int) :
   WArray1536.get256 (WArray1536.init16 (fun (i_0 : int) => a.[i_0])) i = 
    sliceget_256_768_16 a i by auto.

op sliceset_128_960_8(a : W8.t Array960.t,i : int, x : W128.t) : W8.t Array960.t =
   Array960.init (fun (i0 : int) => WArray960.get8 (WArray960.set128_direct ((WArray960.init8 (fun (i_0 : int) => a.[i_0]))) i x) i0).

lemma sliceset_128_960_8E  (a : W8.t Array960.t) (i : int) (x  : W128.t) :
  Array960.init (fun (i0 : int) => WArray960.get8 (WArray960.set128_direct ((WArray960.init8 (fun (i_0 : int) => a.[i_0]))) i x) i0) = 
   sliceset_128_960_8 a i x by auto.

op sliceset_32_960_8(a : W8.t Array960.t,i : int, x : W32.t) : W8.t Array960.t =
   Array960.init (fun (i0 : int) => WArray960.get8 (WArray960.set32_direct ((WArray960.init8 (fun (i_0 : int) => a.[i_0]))) i x) i0).

lemma sliceset_32_960_8E  (a : W8.t Array960.t) (i : int) (x  : W32.t) :
  Array960.init (fun (i0 : int) => WArray960.get8 (WArray960.set32_direct ((WArray960.init8 (fun (i_0 : int) => a.[i_0]))) i x) i0) = 
   sliceset_32_960_8 a i x by auto.

op sliceget_256_16_16(a : W16.t Array16.t, i : int) : W256.t =
   WArray32.get256 (WArray32.init16 (fun (i_0 : int) => a.[i_0])) i.

lemma sliceget_256_16_16E (a : W16.t Array16.t) (i : int) :
   WArray32.get256 (WArray32.init16 (fun (i_0 : int) => a.[i_0])) i = 
    sliceget_256_16_16 a i by auto.

op sliceget_256_8_32(a : W32.t Array8.t, i : int) : W256.t =
   WArray32.get256 (WArray32.init32 (fun (i_0 : int) => a.[i_0])) i.

lemma sliceget_256_8_32E (a : W32.t Array8.t) (i : int) :
   WArray32.get256 (WArray32.init32 (fun (i_0 : int) => a.[i_0])) i = 
    sliceget_256_8_32 a i by auto.

op sliceget_256_32_8(a : W8.t Array32.t, i : int) : W256.t =
   WArray32.get256 (WArray32.init8 (fun (i_0 : int) => a.[i_0])) i.

lemma sliceget_256_32_8E (a : W8.t Array32.t) (i : int) :
   WArray32.get256 (WArray32.init8 (fun (i_0 : int) => a.[i_0])) i = 
    sliceget_256_32_8 a i by auto.

op sliceset_256_128_8(a : W8.t Array128.t,i : int, x : W256.t) : W8.t Array128.t =
   Array128.init ((WArray128.get8 ((WArray128.set256 ((WArray128.init8 (fun (i_0 : int) => a.[i_0]))) i x)))).

lemma sliceset_256_128_8E  (a : W8.t Array128.t) (i : int) (x  : W256.t) :
  Array128.init ((WArray128.get8 ((WArray128.set256 ((WArray128.init8 (fun (i_0 : int) => a.[i_0]))) i x)))) = 
   sliceset_256_128_8 a i x by auto.


bind bitstring circuit Array768."_.[_]" Array768."_.[_<-_]" Array768.to_list (W16.t Array768.t) 768.

bind bitstring circuit Array256."_.[_]" Array256."_.[_<-_]" Array256.to_list (W16.t Array256.t) 256.

bind bitstring circuit Array16."_.[_]" Array16."_.[_<-_]" Array16.to_list (W16.t Array16.t) 16.

bind bitstring circuit Array128."_.[_]" Array128."_.[_<-_]" Array128.to_list (W8.t Array128.t) 128.

bind bitstring circuit Array8."_.[_]" Array8."_.[_<-_]" Array8.to_list (W32.t Array8.t) 8.

op uext16_32 = W2u16.zeroextu32.

lemma uext16_32E : W2u16.zeroextu32 = uext16_32 by auto.

op truncate32_8 = W4u8.truncateu8.

lemma truncate32_8E : W4u8.truncateu8 = truncate32_8 by auto.

op uext16_64 = W4u16.zeroextu64.

lemma uext16_64E : W4u16.zeroextu64 = uext16_64 by auto.

op truncate16_8 = W2u8.truncateu8.

lemma truncate16_8E : W2u8.truncateu8 = truncate16_8 by auto.

op truncate64_16 = W4u16.truncateu16.

lemma truncate64_16E : W4u16.truncateu16 = truncate64_16 by auto.

op truncate256_128 = W2u128.truncateu128.

lemma truncate256_128E : W2u128.truncateu128 = truncate256_128 by auto.


(*************************)
(*************************)
(* END BINDINGS          *)
(*************************)
(*************************)
(*************************)

(*************************)
(*************************)
(* begin aux lemmas      *)
(*************************)
(*************************)
(*************************)


lemma get_vs_bits_256u16_size(wa : W16.t Array256.t) :
   size (chunk 16 (flatten [flatten (map W16.w2bits (to_list wa))])) = 256.
     rewrite flatten1 size_chunk // size_flatten // -map_comp /(\o). 
     rewrite (eq_map _ (fun _ => 16)) => //=.
     have -> : map (fun (_ : W16.t) => 16) (to_list wa) =
               mkseq (fun _ => 16) 256; last 
        by rewrite /mkseq -iotaredE /= /sumz /=. 
     apply (eq_from_nth witness).
     + by rewrite size_map Array256.size_to_list size_mkseq /#.
     move => i.
     rewrite size_map Array256.size_to_list => ib.
     rewrite (nth_map witness) /=;1: by smt(Array256.size_to_list).
     by rewrite (nth_mkseq) /#.
qed.

lemma get_vs_bits_256u16(wa : W16.t Array256.t) k :
  0 <= k < 256 =>
  nth witness (map W16.bits2w (chunk 16 (flatten [flatten (map W16.w2bits (to_list wa))]))) k = wa.[k].
move => kb.
  rewrite (nth_map witness);1:smt(get_vs_bits_256u16_size size_map).
  rewrite  (nth_change_dfl [] witness);
     1: by smt(get_vs_bits_256u16_size). 
  rewrite JWordList.nth_chunk //; move : kb => [#kb0 kb1] //.
  rewrite flatten1 size_flatten  /= /sumz /=. 
  + have -> : (map List.size (map W16.w2bits (to_list wa))) = 
         mkseq (fun _ => 16) 256.
     apply (eq_from_nth witness);1:
      by rewrite !size_map size_iota. 
    move => i. rewrite !size_map size_iota /max /= => ib.
    rewrite nth_mkseq 1:/# /=.
    rewrite (nth_map witness);1:by rewrite size_map Array256.size_to_list /#.
    rewrite (nth_map witness); 1:by rewrite  Array256.size_to_list /#.
    by rewrite size_w2bits.
  by rewrite /mkseq -iotaredE /= /#.
  rewrite flatten1 drop_flatten_ctt.
  by move => x; rewrite mapP => H;elim H => x0; smt(W16.size_w2bits).
  rewrite -map_drop. 
  rewrite (: 16 = 16*1) 1:/# take_flatten_ctt.
  by move => x; rewrite mapP => H;elim H => x0; smt(W16.size_w2bits).
  rewrite -map_take (drop_take1_nth witness) /=;1:smt(Array256.size_to_list).
  by rewrite flatten1 w2bitsK.
qed.

lemma get_vs_bits_pre_256u16 (wa : W16.t Array256.t) (f : W16.t -> bool) (g : W16.t -> bool) :  (forall x, f x => g x) => 
   (forall (k : int), 0 <= k && k < 256 => f wa.[k]) =>
         all g (map W16.bits2w (chunk 16 (flatten [flatten (map W16.w2bits (to_list wa))]))).
proof. 
  move => H H0.
  apply (all_nthP _ _ witness) => k kb /=.
  by rewrite get_vs_bits_256u16;smt(get_vs_bits_256u16_size size_map).
qed.

(*************************)
(*************************)
(* end aux lemmas        *)
(*************************)
(*************************)
(*************************)

(******* BEGIN REMOVE INTS FROM LOOPS *)

module Aux(SC : Jkem.Syscall_t) = {
proc _poly_csubq(rp : W16.t Array256.t) : W16.t Array256.t = {
    var i : int;
    var t : W16.t;
    var b : W16.t;
    
    i <- 0;
    while (i < 256){
      t <- rp.[i];
      t <- t - (of_int 3329)%W16;
      b <- t;
      b <- b `|>>` (of_int 15)%W8;
      b <- b `&` (of_int 3329)%W16;
      t <- t + b;
      rp.[i] <- t;
      i <- i + 1;
    }
    
    return rp;
  }

proc __polyvec_csubq(r : W16.t Array768.t) : W16.t Array768.t = {
    var aux : W16.t Array256.t;
    
    aux <@ _poly_csubq((init (fun (i : int) => r.[0 + i]))%Array256);
    r <- (init (fun (i : int) => if 0 <= i && i < 0 + 256 then aux.[i - 0] else r.[i]))%Array768;
    aux <@ _poly_csubq((init (fun (i : int) => r.[256 + i]))%Array256);
    r <- (init (fun (i : int) => if 256 <= i && i < 256 + 256 then aux.[i - 256] else r.[i]))%Array768;
    aux <@ _poly_csubq((init (fun (i : int) => r.[2 * 256 + i]))%Array256);
    r <- (init (fun (i : int) => if 2 * 256 <= i && i < 2 * 256 + 256 then aux.[i - 2 * 256] else r.[i]))%Array768;
    
    return r;
  }
  
proc _i_poly_compress(rp : W8.t Array128.t, a : W16.t Array256.t) : W8.t Array128.t * W16.t Array256.t = {
    var i : int;
    var d0 : W32.t;
    var d1 : W32.t;
    
    a <@ _poly_csubq(a);
    i <- 0;
    while (i < 128){
      d0 <- zeroextu32 a.[2 * i];
      d1 <- zeroextu32 a.[2 * i + 1];
      d0 <- d0 `<<` (of_int 4)%W8;
      d0 <- d0 + (of_int 1665)%W32;
      d0 <- d0 * (of_int 80635)%W32;
      d0 <- d0 `>>` (of_int 28)%W8;
      d0 <- d0 `&` (of_int 15)%W32;
      d1 <- d1 `<<` (of_int 4)%W8;
      d1 <- d1 + (of_int 1665)%W32;
      d1 <- d1 * (of_int 80635)%W32;
      d1 <- d1 `>>` (of_int 28)%W8;
      d1 <- d1 `&` (of_int 15)%W32;
      d1 <- d1 `<<` (of_int 4)%W8;
      d0 <- d0 `|` d1;
      rp.[i] <- truncateu8 d0;
      i <- i + 1;
    }
    
    return (rp, a);
  }
  
proc __i_polyvec_compress(rp : W8.t Array960.t, a : W16.t Array768.t) : W8.t Array960.t = {
    var aux : int;
    var i : int;
    var j : int;
    var aa : W16.t Array768.t;
    var k : int;
    var t : W64.t Array4.t;
    var c : W16.t;
    var b : W16.t;
    
    aa <- witness;
    t <- witness;
    i <- 0;
    j <- 0;
    aa <@ __polyvec_csubq(a);
    while (i < (3 * 256 - 3)){
      k <- 0;
      while (k < 4){
        t.[k] <- zeroextu64 aa.[i+k];
        t.[k] <- t.[k] `<<` (of_int 10)%W8;
        t.[k] <- t.[k] + (of_int 1665)%W64;
        t.[k] <- t.[k] * (of_int 1290167)%W64;
        t.[k] <- t.[k] `>>` (of_int 32)%W8;
        t.[k] <- t.[k] `&` (of_int 1023)%W64;
        k <- k + 1;
      }
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

proc __polyvec_compress(rp : W64.t, a : W16.t Array768.t) : unit = {
    var aux : int;
    var i : int;
    var j : int;
    var aa : W16.t Array768.t;
    var k : int;
    var t : W64.t Array4.t;
    var c : W16.t;
    var b : W16.t;
    
    aa <- witness;
    t <- witness;
    i <- 0;
    j <- 0;
    aa <@ __polyvec_csubq(a);
    while (i < (3 * 256 - 3)){
      k <- 0;
      while (k < 4){
        t.[k] <- zeroextu64 aa.[i];
        i <- i + 1;
        t.[k] <- t.[k] `<<` (of_int 10)%W8;
        t.[k] <- t.[k] + (of_int 1665)%W64;
        t.[k] <- t.[k] * (of_int 1290167)%W64;
        t.[k] <- t.[k] `>>` (of_int 32)%W8;
        t.[k] <- t.[k] `&` (of_int 1023)%W64;
        k <- k + 1;
      }
      c <- truncateu16 t.[0];
      c <- c `&` (of_int 255)%W16;
      Glob.mem <- storeW8 Glob.mem (to_uint rp + j) (truncateu8 c);
      j <- j + 1;
      b <- truncateu16 t.[0];
      b <- b `>>` (of_int 8)%W8;
      c <- truncateu16 t.[1];
      c <- c `<<` (of_int 2)%W8;
      c <- c `|` b;
      Glob.mem <- storeW8 Glob.mem (to_uint rp + j) (truncateu8 c);
      j <- j + 1;
      b <- truncateu16 t.[1];
      b <- b `>>` (of_int 6)%W8;
      c <- truncateu16 t.[2];
      c <- c `<<` (of_int 4)%W8;
      c <- c `|` b;
      Glob.mem <- storeW8 Glob.mem (to_uint rp + j) (truncateu8 c);
      j <- j + 1;
      b <- truncateu16 t.[2];
      b <- b `>>` (of_int 4)%W8;
      c <- truncateu16 t.[3];
      c <- c `<<` (of_int 6)%W8;
      c <- c `|` b;
      Glob.mem <- storeW8 Glob.mem (to_uint rp + j) (truncateu8 c);
      j <- j + 1;
      t.[3] <- t.[3] `>>` (of_int 2)%W8;
      Glob.mem <- storeW8 Glob.mem (to_uint rp + j) (truncateu8 t.[3]);
      j <- j + 1;
    }
    
    return tt;
  }
  
  
  proc __poly_reduce(rp : W16.t Array256.t) : W16.t Array256.t = {
    var j : int;
    var t : W16.t;
    
    j <- 0;
    while (j < 256){
      t <- rp.[j];
      t <@ Jkem.M(SC).__barrett_reduce(t);
      rp.[j] <- t;
      j <- j + 1;
    }
    
    return rp;
  }

  proc __polyvec_reduce(r : W16.t Array768.t) : W16.t Array768.t = {
    var aux : W16.t Array256.t;
    
    aux <@ Jkem.M(SC).__poly_reduce((init (fun (i : int) => r.[0 + i]))%Array256);
    r <- (init (fun (i : int) => if 0 <= i && i < 0 + 256 then aux.[i - 0] else r.[i]))%Array768;
    aux <@ Jkem.M(SC).__poly_reduce((init (fun (i : int) => r.[256 + i]))%Array256);
    r <- (init (fun (i : int) => if 256 <= i && i < 256 + 256 then aux.[i - 256] else r.[i]))%Array768;
    aux <@ Jkem.M(SC).__poly_reduce((init (fun (i : int) => r.[2 * 256 + i]))%Array256);
    r <- (init (fun (i : int) => if 2 * 256 <= i && i < 2 * 256 + 256 then aux.[i - 2 * 256] else r.[i]))%Array768;
    
    return r;
  }

}.

equiv auxcsubq : Jkem.M(Jkem.Syscall)._poly_csubq ~ Aux(Jkem.Syscall)._poly_csubq : ={arg} ==> ={res}.
proc. 
while(={rp} /\ to_uint i{1} = i{2} /\ 0 <= i{2} <= 256).
+ auto => /> &1;rewrite !ultE /= => ????.
  rewrite !to_uintD_small /=; smt().
by auto.
qed.


equiv auxcompress : Jkem.M(Jkem.Syscall)._i_poly_compress ~ Aux(Jkem.Syscall)._i_poly_compress : ={arg} ==> ={res}.
proc.
while (0<=i{2}<=128 /\ to_uint i{1} = i{2} /\ ={rp,a}).
+ auto => /> &1 &2. 
  rewrite !ultE /= => ????.
  rewrite !to_uintM_small /= 1:/# !to_uintD_small /= 1:/#.
  rewrite !to_uintM_small /= 1,2:/#. 
  rewrite !to_uintM_small /= /#.
by wp; call auxcsubq;auto => />.
qed.

equiv auxcsubqv : Jkem.M(Jkem.Syscall).__polyvec_csubq ~ Aux(Jkem.Syscall).__polyvec_csubq : ={arg} ==> ={res}.
proc.
do 3!(wp;call auxcsubq).
by auto => />.
qed.

equiv auxpolyveccompress1 : Jkem.M(Jkem.Syscall).__i_polyvec_compress ~ Aux(Jkem.Syscall).__i_polyvec_compress : ={arg} ==> ={res}.
proc.
while (0<=i{2}<=768 /\ to_uint i{1} = i{2} /\ to_uint j{1} = j{2} /\ to_uint j{1} * 4 = i{2} * 5 /\ ={rp,aa}).
+ unroll for {1} 2; unroll for {2} 2; auto => /> &1. 
  by rewrite !ultE /= => &2????;rewrite !to_uintD_small /=; smt().
by call auxcsubqv;auto => />.
qed.

equiv auxpolyveccompress : Jkem.M(Jkem.Syscall).__polyvec_compress ~ Aux(Jkem.Syscall).__polyvec_compress : ={arg} ==> ={res}.
proc.
while (0<=i{2}<=768 /\ to_uint i{1} = i{2} /\ to_uint j{1} = j{2} /\ to_uint j{1} * 4 = i{2} * 5 /\ ={rp,aa}).
+ unroll for {1} 2; unroll for {2} 2; auto => /> &1. 
  by rewrite !ultE /= => &2????;rewrite !to_uintD_small /=; smt().
by call auxcsubqv;auto => />.
qed.

(**** BEGIN csubq *****)

op lane_func_csubq(x : W16.t) = if W16.of_int 3329 \sle x then x - W16.of_int 3329 else x. 
op pre16_csubq(x : W16.t) : bool =  W16.zero \sle x && x \slt W16.of_int (6658). 

lemma post_commutes_csubq x : pre16_csubq x =>
    incoeff (to_sint x) = incoeff (to_sint (lane_func_csubq x)) /\ bpos16 (lane_func_csubq x) q.
proof.
rewrite /pre16_csubq /lane_func_csubq sltE !sleE /= /smod /= -eq_incoeff. 
case (3329 <= to_sint x);last by smt().
by move => *;rewrite  to_sintB_small /= /smod /= /#. 
qed.


(******* BEGIN POLYVEC_COMPRESS *****)

op pre16_compress(x : W16.t) : bool =  W16.zero \sle x && x \slt W16.of_int (6658). 

equiv compressequiv_1 mem  : 
 Jkem_avx2.M(Jkem_avx2.Syscall)._poly_compress_1 ~  Jkem.M(Jkem.Syscall)._i_poly_compress :

     pos_bound256_cxq a{1} 0 256 2 /\
     pos_bound256_cxq a{2} 0 256 2 /\
(*
    lift_array256 a{1} = lift_array256 a{2} /\ 
    ={Glob.mem} /\ Glob.mem{1} = mem   
    ==> 
    ={Glob.mem} /\  Glob.mem{1} = mem /\
    res.`1{1} = res.`1{2}.
*)
={arg} /\ ={Glob.mem} /\ Glob.mem{1} = mem ==> ={Glob.mem} /\  Glob.mem{1} = mem /\ ={res}.
proof.
proc*.
conseq />.
transitivity {1} { r <@ Aux(Jkem.Syscall)._i_poly_compress(rp, a); }
    (pos_bound256_cxq a{1} 0 256 2 /\ pos_bound256_cxq a{2} 0 256 2 /\  ={rp,a} ==> ={r} )
    (={rp,a} ==> ={r} );[ by smt() | by smt() | | by symmetry;call auxcompress; auto ].
 
inline {1} 1;inline {2} 1.
swap {1} 3 -2;seq 1 0:#pre;1: by auto.

proc rewrite {1} 5  sliceget_256_16_16E.
proc rewrite {1} 9 sliceget_256_8_32E.
proc rewrite {1} ^while.1 sliceget_256_256_16E.
proc rewrite {1} ^while.2 sliceget_256_256_16E.
proc rewrite {1} ^while.3 sliceget_256_256_16E.
proc rewrite {1} ^while.4 sliceget_256_256_16E.
proc rewrite {1} ^while.23 sliceset_256_128_8E.
proc rewrite {2} ^while.1 uext16_32E.
proc rewrite {2} ^while.2 uext16_32E.
proc rewrite {2} ^while.15 truncate32_8E.
wp 12 5 => />.

inline {1} 3;inline {2} 3.
proc rewrite {1} 4  sliceget_256_16_16E.
proc rewrite {1} ^while.1  sliceget_256_256_16E.
proc rewrite {1} ^while.3  sliceset_256_256_16E.
cfold{1} 14;unroll for {1} 15;cfold {1} 14; unroll for {1} 6; cfold {1} 5.
unroll for {2} 8;cfold {2} 7;unroll for {2} 5;cfold {2} 4.
inline *;bdepeq 16 [ "a" ] [ "a" ] {16:["a0" ~ "a0"]; 4:["rp0" ~ "rp0"] } pre16_compress.
+ move => /> &hr ??;split;
    (apply (get_vs_bits_pre_256u16 a{hr}
        (fun w => 0 <= W16.to_sint w && W16.to_sint w < 2*q)
         pre16_compress _ _);
   [ by move => x; rewrite /pre16_compress sleE sltE /=   /to_sint /smod /= qE //= | by smt()]).
by smt().
qed.


op asliceget_16_768_256(a : W16.t Array768.t, i : int) : W16.t Array256.t =
   Array256.init (fun (i3 : int) => a.[256*i + i3]).

lemma asliceget_16_768_256E (i : int) (a : W16.t Array768.t)  :
   Array256.init (fun (i3 : int) => a.[256*i + i3]) = 
    asliceget_16_768_256 a i by auto.

op asliceset_16_768_256(a : W16.t Array768.t,i : int, asa : W16.t Array256.t) : W16.t Array768.t =
  Array768.init           
     (fun (i3 : int) =>   
     if 256*i <= i3 && i3 < 256*i + 256 
     then asa.[i3 - 256*i]
     else a.[i3]).

lemma asliceset_16_768_256E (i : int) (a : W16.t Array768.t)  (asa  : W16.t Array256.t) :
  Array768.init           
     (fun (i3 : int) =>   
     if 256*i <= i3 && i3 < 256*i + 256 
     then asa.[i3 - 256*i]
     else a.[i3]) = 
   asliceset_16_768_256 a i asa by auto.


(****** BEGIN POLYVEC_COMPRESS ******)

equiv compressequivvec_1 mem : 
 Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_compress_1 ~  Jkem.M(Jkem.Syscall).__i_polyvec_compress :
     ={arg} /\
    ={Glob.mem} /\ Glob.mem{1} = mem 
    ==> 
    ={Glob.mem,res} /\  Glob.mem{1} = mem.
proof.
proc * => /=.
conseq />.
transitivity {1} { r <@ Aux(Jkem.Syscall).__i_polyvec_compress(rp, a); }
    (={rp,a} ==> ={r} )
    (={rp,a} ==> ={r} );[ by smt() | by smt() | | by symmetry;call auxpolyveccompress1; auto ].

inline {1} 1; inline {2} 1.
swap {1} 2 -1; swap {1} 4 -2.
swap {2} [2..3] -1; swap {2} 7 -4.
seq 2 3 : (a0{1}=aa{2}). sp 1 2 => /=.


+ inline {1} 1. inline {2} 1.

  inline {1} 6. inline {2} 6.
  have /= AA := asliceget_16_768_256E 2.
  proc rewrite {1} 6 AA.
  proc rewrite {2} 6 AA.
  clear AA.
  proc rewrite {1} 7 sliceget_256_16_16E.
  proc rewrite {1} ^while.1 sliceget_256_256_16E.
  proc rewrite {1} ^while.3 sliceset_256_256_16E.
  have /= AA := asliceset_16_768_256E 2.
  proc rewrite {1} 11 AA.
  proc rewrite {2} 10 AA.
  clear AA.

  inline {1} 4. inline {2} 4.
  have /= AA := asliceget_16_768_256E 1.
  proc rewrite {1} 4 AA.
  proc rewrite {2} 4 AA.
  clear AA.
  proc rewrite {1} 5 sliceget_256_16_16E.
  proc rewrite {1} ^while.1 sliceget_256_256_16E.
  proc rewrite {1} ^while.3 sliceset_256_256_16E.
  have /= AA := asliceset_16_768_256E 1.
  proc rewrite {1} 9 AA.
  proc rewrite {2} 8 AA.
  clear AA.

  inline {1} 2. inline {2} 2.
  have /= AA := asliceget_16_768_256E 0.
  proc rewrite {1} 2 AA.
  proc rewrite {2} 2 AA.
  clear AA.
  proc rewrite {1} 3 sliceget_256_16_16E.
  proc rewrite {1} ^while.1 sliceget_256_256_16E.
  proc rewrite {1} ^while.3 sliceset_256_256_16E.
  have /= AA := asliceset_16_768_256E 0.
  proc rewrite {1} 7 AA.
  proc rewrite {2} 6 AA.
  clear AA.
  (* it works
  inline *.
  do 3!(unroll for {1} ^while);
    cfold {1} 334; cfold {1} 169; cfold {1} 4.
  do 3!(unroll for {2} ^while);
    cfold{2} 4107;cfold {2} 2055;cfold{2} 3.
  
  by bdepeq 16 [ "a0" ] [ "a0" ] {16:["a0" ~ "aa"]};smt(). *)
  admit.

  proc rewrite {1} 4 sliceget_256_16_16E. 
  proc rewrite {1} 11 sliceget_256_32_8E.
  proc rewrite {1} ^while.1 sliceget_256_768_16E.
  proc rewrite {1} ^while.19 sliceset_128_960_8E.
  proc rewrite {1} ^while.20 sliceset_32_960_8E.

  sp 2 2. swap {2} 1 1.

  cfold {1} 10. unroll for {1} 11. cfold {1} 10.
  unroll for {2} 3; cfold {2} 2; cfold {2} 1.
  do 192!(unroll for {2} ^while).
cfold {2} 9933.
cfold {2} 9881.
cfold {2} 9829.
cfold {2} 9777.
cfold {2} 9725.
cfold {2} 9673.
cfold {2} 9621.
cfold {2} 9569.
cfold {2} 9517.
cfold {2} 9465.
cfold {2} 9413.
cfold {2} 9361.
cfold {2} 9309.
cfold {2} 9257.
cfold {2} 9205.
cfold {2} 9153.
cfold {2} 9101.
cfold {2} 9049.
cfold {2} 8997.
cfold {2} 8945.
cfold {2} 8893.
cfold {2} 8841.
cfold {2} 8789.
cfold {2} 8737.
cfold {2} 8685.
cfold {2} 8633.
cfold {2} 8581.
cfold {2} 8529.
cfold {2} 8477.
cfold {2} 8425.
cfold {2} 8373.
cfold {2} 8321.
cfold {2} 8269.
cfold {2} 8217.
cfold {2} 8165.
cfold {2} 8113.
cfold {2} 8061.
cfold {2} 8009.
cfold {2} 7957.
cfold {2} 7905.
cfold {2} 7853.
cfold {2} 7801.
cfold {2} 7749.
cfold {2} 7697.
cfold {2} 7645.
cfold {2} 7593.
cfold {2} 7541.
cfold {2} 7489.
cfold {2} 7437.
cfold {2} 7385.
cfold {2} 7333.
cfold {2} 7281.
cfold {2} 7229.
cfold {2} 7177.
cfold {2} 7125.
cfold {2} 7073.
cfold {2} 7021.
cfold {2} 6969.
cfold {2} 6917.
cfold {2} 6865.
cfold {2} 6813.
cfold {2} 6761.
cfold {2} 6709.
cfold {2} 6657.
cfold {2} 6605.
cfold {2} 6553.
cfold {2} 6501.
cfold {2} 6449.
cfold {2} 6397.
cfold {2} 6345.
cfold {2} 6293.
cfold {2} 6241.
cfold {2} 6189.
cfold {2} 6137.
cfold {2} 6085.
cfold {2} 6033.
cfold {2} 5981.
cfold {2} 5929.
cfold {2} 5877.
cfold {2} 5825.
cfold {2} 5773.
cfold {2} 5721.
cfold {2} 5669.
cfold {2} 5617.
cfold {2} 5565.
cfold {2} 5513.
cfold {2} 5461.
cfold {2} 5409.
cfold {2} 5357.
cfold {2} 5305.
cfold {2} 5253.
cfold {2} 5201.
cfold {2} 5149.
cfold {2} 5097.
cfold {2} 5045.
cfold {2} 4993.
cfold {2} 4941.
cfold {2} 4889.
cfold {2} 4837.
cfold {2} 4785.
cfold {2} 4733.
cfold {2} 4681.
cfold {2} 4629.
cfold {2} 4577.
cfold {2} 4525.
cfold {2} 4473.
cfold {2} 4421.
cfold {2} 4369.
cfold {2} 4317.
cfold {2} 4265.
cfold {2} 4213.
cfold {2} 4161.
cfold {2} 4109.
cfold {2} 4057.
cfold {2} 4005.
cfold {2} 3953.
cfold {2} 3901.
cfold {2} 3849.
cfold {2} 3797.
cfold {2} 3745.
cfold {2} 3693.
cfold {2} 3641.
cfold {2} 3589.
cfold {2} 3537.
cfold {2} 3485.
cfold {2} 3433.
cfold {2} 3381.
cfold {2} 3329.
cfold {2} 3277.
cfold {2} 3225.
cfold {2} 3173.
cfold {2} 3121.
cfold {2} 3069.
cfold {2} 3017.
cfold {2} 2965.
cfold {2} 2913.
cfold {2} 2861.
cfold {2} 2809.
cfold {2} 2757.
cfold {2} 2705.
cfold {2} 2653.
cfold {2} 2601.
cfold {2} 2549.
cfold {2} 2497.
cfold {2} 2445.
cfold {2} 2393.
cfold {2} 2341.
cfold {2} 2289.
cfold {2} 2237.
cfold {2} 2185.
cfold {2} 2133.
cfold {2} 2081.
cfold {2} 2029.
cfold {2} 1977.
cfold {2} 1925.
cfold {2} 1873.
cfold {2} 1821.
cfold {2} 1769.
cfold {2} 1717.
cfold {2} 1665.
cfold {2} 1613.
cfold {2} 1561.
cfold {2} 1509.
cfold {2} 1457.
cfold {2} 1405.
cfold {2} 1353.
cfold {2} 1301.
cfold {2} 1249.
cfold {2} 1197.
cfold {2} 1145.
cfold {2} 1093.
cfold {2} 1041.
cfold {2} 989.
cfold {2} 937.
cfold {2} 885.
cfold {2} 833.
cfold {2} 781.
cfold {2} 729.
cfold {2} 677.
cfold {2} 625.
cfold {2} 573.
cfold {2} 521.
cfold {2} 469.
cfold {2} 417.
cfold {2} 365.
cfold {2} 313.
cfold {2} 261.
cfold {2} 209.
cfold {2} 157.
cfold {2} 105.
cfold {2} 53.
cfold {2} 1.

  bdepeq 16 [ "a0" ] [ "aa" ] {10:["r" ~ "r"]};smt().


  unroll for {1} ^while.
  (* Left treatment *)
  (* WE NEED SLICE GET FOR ARRAY SLICES *)
  proc rewrite {1} 2  sliceget_256_16_16E.
  (* WHY IS THIS FAILING? *)
  proc rewrite {1} 4  sliceget_256_256_16E.
  proc rewrite {1} 8  sliceget_256_256_16E.
  proc rewrite 11  sliceget_256_256_16E.
  proc rewrite 15  sliceget_256_256_16E.
  proc rewrite 19 sliceget_256_256_16E.
  proc rewrite 23  sliceget_256_256_16E.
  proc rewrite 27  sliceget_256_256_16E.
  proc rewrite 31  sliceget_256_256_16E.
  proc rewrite 35  sliceget_256_256_16E.
  proc rewrite 39  sliceget_256_256_16E.
  proc rewrite 43  sliceget_256_256_16E.
  proc rewrite 47  sliceget_256_256_16E.
  proc rewrite 51  sliceget_256_256_16E.
  proc rewrite 55  sliceget_256_256_16E.
  proc rewrite 59  sliceget_256_256_16E.
  proc rewrite 63  sliceget_256_256_16E.
  proc rewrite 5  sliceset_256_256_16E.
  proc rewrite 9  sliceset_256_256_16E.


equiv compressequivvec_1 mem : 
 Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_compress_1 ~  Jkem.M(Jkem.Syscall).__i_polyvec_compress :
     pos_bound768_cxq a{1} 0 768 2 /\
     pos_bound768_cxq a{2} 0 768 2 /\
    lift_array768 a{1} = lift_array768 a{2} /\ 
    ={Glob.mem} /\ Glob.mem{1} = mem 
    ==> 
    ={Glob.mem,res} /\  Glob.mem{1} = mem.
proof.
proc * => /=.
conseq />.

proc. 
  transitivity MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_compress_1
               (={rp, a, Glob.mem} ==> ={res, Glob.mem})
               (pos_bound768_cxq a{1} 0 768 2 /\
                pos_bound768_cxq a{2} 0 768 2 /\
                lift_array768 a{1} = lift_array768 a{2} /\ ={Glob.mem} /\ Glob.mem{1} = mem
                 ==>
                ={Glob.mem, res} /\ Glob.mem{2} = mem); 1,2: smt().
    + symmetry. proc * => /=. call prevec_eq_polyvec_compress_1 => //=.
  transitivity EncDec_AVX2.encode10_opt_vec
               (a{2} = compress_polyvec 10  (lift_polyvec a{1}) /\
                pos_bound768_cxq a{1} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= a{2}.[i] < q) /\
                Glob.mem{1} = mem /\ ={Glob.mem} ==>
                Glob.mem{1} = mem /\
                ={res})
               (pos_bound768_cxq a{2} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= a{1}.[i] < q) /\
                a{1} = compress_polyvec 10 (lift_polyvec a{2}) /\
                Glob.mem{2} = mem /\ ={Glob.mem} ==>
                Glob.mem{2} = mem /\
                ={res}).
    auto => &1 &2 [#] pos_bound_al pos_bound_ar al_eq_ar />.
    exists Glob.mem{2}.
      exists (compress_polyvec 10 (lift_polyvec a{1})).
        rewrite pos_bound_al pos_bound_ar /=.
        do split.
        + move => i ib; rewrite /compress_polyvec /lift_polyvec !mapiE //=.
          pose x := fromarray256 _ _ _.
          move : (compress_rng x.[i] 10 _) => //=; smt (qE).
        + move => i ib; rewrite /compress_polyvec /lift_polyvec !mapiE //=.
          pose x := fromarray256 _ _ _.
          move : (compress_rng x.[i] 10 _) => //=; smt (qE).
        + congr; rewrite /lift_polyvec KMatrix.Vector.eq_vectorP => i ib /=.
          rewrite !KMatrix.Vector.offunvE /kvec //=.
          rewrite /lift_array768 /subarray256 /lift_array256 tP => k kb.
          rewrite !mapiE //= !initiE //=.
          smt(@Array768).
        + smt().
    + proc * => /=.
      ecall (polyvec_compress_1_corr (lift_polyvec a{1})  mem) => //=.
  symmetry.
  transitivity EncDec.encode10_vec
               (u{2} = compress_polyvec 10 (lift_polyvec a{1}) /\
                pos_bound768_cxq a{1} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= u{2}.[i] < q) /\
                Glob.mem{1} = mem /\ ={Glob.mem} ==>
                Glob.mem{1} = mem /\ ={res})
               ((forall i, 0<=i<768 => 0 <= u{1}.[i] < q) /\
                u{1} = a{2} /\
                ={Glob.mem} ==> ={Glob.mem, res}).
               auto => &1 &2 [#] pos_bound_a a2_bnd a1_eq_a2 mem_eq />.
               exists Glob.mem{1}.
                 exists (compress_polyvec 10 (lift_polyvec a{1})).
                   auto => />;do split.
                   + move => i ibl ibh; rewrite /compress_polyvec /lift_polyvec !mapiE //=.
                     pose x := fromarray256 _ _ _.
                     move : (compress_rng x.[i] 10 _) => //=; smt (qE).
                   + move => i ibl ibh; rewrite /compress_polyvec /lift_polyvec !mapiE //=.
                     pose x := fromarray256 _ _ _.
                     move : (compress_rng x.[i] 10 _) => //=; smt (qE).
                   + smt().
               smt().
    + proc * => /=.
      ecall (MLKEM_PolyVec.i_polyvec_compress_corr (lift_array768 a{1})) => //=.
      auto => /> &1 H H0.
        + rewrite /compress_polyvec; congr.
          rewrite /fromarray256 /lift_polyvec /lift_array768 tP => i ib /=.
          rewrite !initiE //= !mapiE //= !getvE !KMatrix.Vector.offunvE //=.
          rewrite /subarray256 /lift_array256 /=.
          smt(@Array256).
  symmetry.
  proc * => /=.
  call encode10_opt_corr.
  auto => />.
qed.


lemma polyvec_decompress_equiv mem _p :
    equiv [Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_decompress ~  Jkem.M(Jkem.Syscall).__polyvec_decompress  :
             valid_ptr _p (3*320) /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p /\
             ={Glob.mem} /\ rp{1} = ap{2}
              ==>
             ={Glob.mem,res} /\ Glob.mem{1} = mem /\
             lift_array768 res{1} = lift_array768 res{2} /\
             pos_bound768_cxq res{1} 0 768 1 /\
             pos_bound768_cxq res{2} 0 768 1 ].
proof.
  transitivity MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_decompress
               (={rp, Glob.mem} /\ valid_ptr (W64.to_uint rp{1}) 960 /\ _p = to_uint rp{1} ==>
                   ={res, Glob.mem})
               (={Glob.mem} /\ rp{1} = ap{2} /\ Glob.mem{1} = mem /\
                valid_ptr (W64.to_uint rp{1}) 960 /\
                to_uint rp{1} = _p ==>
                ={Glob.mem, res} /\
                Glob.mem{1} = mem /\
                lift_array768 res{1} = lift_array768 res{2} /\
                pos_bound768_cxq res{1} 0 768 1 /\
                pos_bound768_cxq res{1} 0 768 1); 1,2: smt().
    + symmetry. proc * => /=. call prevec_eq_polyvec_decompress => //=.
  transitivity EncDec_AVX2.decode10_opt_vec
               (W64.to_uint rp{1} = _p /\ valid_ptr _p 960 /\
                load_array960 Glob.mem{1} _p = u{2} /\
                Glob.mem{1} = mem /\ ={Glob.mem}
                ==>
                ={Glob.mem} /\ Glob.mem{1} = mem /\
                pos_bound768_cxq res{1} 0 768 1 /\
                lift_polyvec res{1} = decompress_polyvec 10 res{2})
               (W64.to_uint ap{2} = _p /\ valid_ptr _p 960 /\
                load_array960 Glob.mem{2} _p = u{1} /\
                ={Glob.mem} /\ Glob.mem{2} = mem
                 ==>
                ={Glob.mem} /\ Glob.mem{2} = mem /\
                pos_bound768_cxq res{2} 0 768 1 /\
                lift_polyvec res{2} = decompress_polyvec 10 res{1}).
    auto => &1 &2 [#] mem_eq arg_eq mem_def valid_p p_eq />.
    exists mem.
      exists (load_array960 mem _p).
        rewrite p_eq /= -p_eq valid_p mem_def arg_eq /= -mem_eq mem_def //=.
    move => &1 &m &2 [#] H0 H1 H2 H3 [#] H4 H5 H6 H7 />.
    rewrite H0 -H4 /=.
    split.
      + rewrite tP => k kb.
        rewrite /pos_bound768_cxq /bpos16 in H2.
        rewrite /pos_bound768_cxq /bpos16 in H6.
        move : H3; rewrite -H7 => H8.
        rewrite KMatrix.Vector.eq_vectorP in H8.
        move : (H8 (k %/ 256)).
        have -> /=: (0 <= k %/ 256 && k %/ 256 < kvec).
          move : kb => /#.
        rewrite (KMatrix.Vector.offunvE _ (k %/ 256)) 1:/# (KMatrix.Vector.offunvE _ (k %/ 256)) 1:/# /=.
        rewrite Array256.tP => H9.
        move : (H9 (k %% 256)); rewrite (modz_cmp k 256) //=.
        rewrite subliftsub 1..2:/# subliftsub 1..2:/# mulzC -divz_eq.
        rewrite /lift_array768 mapiE 1:kb mapiE 1:kb /=.
        rewrite -eq_incoeff (pmod_small _ q) 1:H2 1:kb (pmod_small _ q) 1:H6 1:kb.
        rewrite to_sint_unsigned. move : (H2 k kb) => />.
        rewrite to_sint_unsigned. move : (H6 k kb) => />.
        by rewrite -W16.to_uint_eq => />.
      + rewrite tP => k kb.
        move : H3; rewrite -H7 => H8.
        rewrite (divz_eq k 256) mulzC.
        rewrite -(liftarrayvector _ (k %/ 256) (k %% 256)) 1:/# 1:(modz_cmp k 256) 1://=.
        rewrite -(liftarrayvector _ (k %/ 256) (k %% 256)) 1:/# 1:(modz_cmp k 256) 1://=.
        by rewrite H8 //=.
    + proc * => /=. ecall (polyvec_decompress_corr mem _p (load_array960 Glob.mem{1} _p)) => //=.
  symmetry.
  transitivity EncDec.decode10_vec
               (W64.to_uint ap{1} = _p /\ valid_ptr _p 960 /\
                ={Glob.mem} /\ Glob.mem{1} = mem /\
                load_array960 Glob.mem{1} _p = u{2}
                 ==>
                ={Glob.mem} /\ Glob.mem{1} = mem /\
                pos_bound768_cxq res{1} 0 768 1 /\
                lift_polyvec res{1} = decompress_polyvec 10 res{2})
               (={u, Glob.mem}
                 ==>
                ={Glob.mem, res}).
    auto => &1 &2 [#] p_def valid_p u_def mem_eq mem_def />.
    exists mem.
      exists (load_array960 Glob.mem{1} _p).
        + by rewrite p_def valid_p u_def mem_def /= mem_eq mem_def /=.
    auto => />.
    proc * => /=. ecall (MLKEM_PolyVec.polyvec_decompress_corr mem _p (load_array960 Glob.mem{1} _p)) => //=.
  symmetry.
  proc * => /=.
  call decode10_opt_vec_corr.
  auto => />.
qed.


equiv compressequivvec mem _p : 
 Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_compress ~  Jkem.M(Jkem.Syscall).__polyvec_compress :
     pos_bound768_cxq a{1} 0 768 2 /\
     pos_bound768_cxq a{2} 0 768 2 /\
    lift_array768 a{1} = lift_array768 a{2} /\ 
    ={rp,Glob.mem} /\ Glob.mem{1} = mem /\   valid_ptr _p (3*320) /\ _p = to_uint rp{1}
    ==> 
    ={Glob.mem} /\  touches mem Glob.mem{1} _p (3*320).
proof.
  transitivity MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_compress
               (={rp, a, Glob.mem} /\ valid_ptr (W64.to_uint rp{1}) (3*320) /\ _p = to_uint rp{1} ==> 
                   ={res, Glob.mem})
               (valid_ptr (W64.to_uint rp{1}) (3*320) /\
                pos_bound768_cxq a{1} 0 768 2 /\
                pos_bound768_cxq a{2} 0 768 2 /\
                lift_array768 a{1} = lift_array768 a{2} /\ ={rp,Glob.mem} /\ Glob.mem{1} = mem /\
                _p = to_uint rp{1} ==>
                ={Glob.mem}  /\  touches mem Glob.mem{1} _p (3*320)); 1,2: smt().  
    + symmetry. proc * => /=. call prevec_eq_polyvec_compress => //=.
  transitivity EncDec_AVX2.encode10_opt_vec
               (a{2} = compress_polyvec 10  (lift_polyvec a{1}) /\
                pos_bound768_cxq a{1} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= a{2}.[i] < q) /\
                to_uint rp{1} = _p /\ valid_ptr _p (3*320) /\ Glob.mem{1} = mem /\
                ={Glob.mem} ==>
                touches mem Glob.mem{1} _p (3*320) /\
                load_array960 Glob.mem{1} _p = res{2})
               (pos_bound768_cxq a{2} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= a{1}.[i] < q) /\
                a{1} = compress_polyvec 10 (lift_polyvec a{2}) /\
                to_uint rp{2} = _p /\ valid_ptr _p 960 /\ Glob.mem{2} = mem /\
                ={Glob.mem} ==>
                touches mem Glob.mem{2} _p 960 /\
                load_array960 Glob.mem{2} _p = res{1}).
    auto => &1 &2 [#] valid_p pos_bound_al pos_bound_ar al_eq_ar p_eq />.
    exists Glob.mem{2}.
      exists (compress_polyvec 10 (lift_polyvec a{1})).
        rewrite pos_bound_al pos_bound_ar /=.
        do split.
        + move => i ib; rewrite /compress_polyvec /lift_polyvec !mapiE //=. 
          pose x := fromarray256 _ _ _.
          move : (compress_rng x.[i] 10 _) => //=; smt (qE).
        + smt().
        + rewrite /valid_ptr in valid_p. move : valid_p => //=.
        + move => i ib; rewrite /compress_polyvec /lift_polyvec !mapiE //=. 
          pose x := fromarray256 _ _ _.
          move : (compress_rng x.[i] 10 _) => //=; smt (qE).
        + congr; rewrite /lift_polyvec KMatrix.Vector.eq_vectorP => i ib /=.
          rewrite !KMatrix.Vector.offunvE /kvec //=.
          rewrite /lift_array768 /subarray256 /lift_array256 tP => k kb.
          rewrite !mapiE //= !initiE //=.
          smt(@Array768).
        + smt().
        + smt().
        + rewrite /valid_ptr in valid_p. move : valid_p => //=.
    rewrite /touches; auto => &1 &m &2 [#] H0 H1 [#] H2 H3 /> *; split ; last by smt().
    apply mem_eq_ext => i.
    have ->: forall (j: address), Glob.mem{1}.[j] = if _p + 0 <= j < _p + 960 then res{m}.[j - _p]
                                                      else mem.[j].
      move => j.
      case (_p + 0 <= j < _p + 960) => jbb.
        + move : H1; rewrite /load_array960 Array960.tP => H1.
          rewrite -H1. smt(). rewrite initiE /= /#. 
        + move : (H0 (j - _p)) => /#.
    have ->: forall (j: address), Glob.mem{2}.[j] = if _p + 0 <= j < _p + 960 then res{m}.[j - _p]
                                                     else mem.[j].
      move => j.
      case (_p + 0 <= j < _p + 960) => jbb.
        + move : H3; rewrite /load_array960 Array960.tP => H3.
          rewrite -H3. smt(). rewrite initiE /= /#.
        + move : (H2 (j - _p)) => /#.
    trivial.
    + proc * => /=.
      ecall (polyvec_compress_corr (lift_polyvec a{1}) _p  mem) => //=. 
  symmetry.
  transitivity EncDec.encode10_vec
               (u{2} = compress_polyvec 10 (lift_polyvec a{1}) /\
                pos_bound768_cxq a{1} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= u{2}.[i] < q) /\
                to_uint rp{1} = _p /\ valid_ptr _p 960 /\ Glob.mem{1} = mem /\
                ={Glob.mem} ==>
                touches mem Glob.mem{1} _p 960 /\
                load_array960 Glob.mem{1} _p = res{2})
               ((forall i, 0<=i<768 => 0 <= u{1}.[i] < q) /\
                u{1} = a{2} /\
                ={Glob.mem} ==> ={Glob.mem, res}). 
               auto => &1 &2 [#] pos_bound_a a2_bnd a1_eq_a2 _p_eq_urp valid_p />.
               exists Glob.mem{1}.
                 exists (compress_polyvec 10 (lift_polyvec a{1})).
                   auto => />;do split.
                   + move => i ibl ibh; rewrite /compress_polyvec /lift_polyvec !mapiE //=. 
                     pose x := fromarray256 _ _ _.
                     move : (compress_rng x.[i] 10 _) => //=; smt (qE).
                   + move => i ibl ibh; rewrite /compress_polyvec /lift_polyvec !mapiE //=. 
                     pose x := fromarray256 _ _ _.
                     move : (compress_rng x.[i] 10 _) => //=; smt (qE).
                   + smt().
               smt().
    + proc * => /=.
      ecall (MLKEM_PolyVec.polyvec_compress_corr mem _p (lift_array768 a{1})) => //=.
      auto => /> &1 H H0 H1 H2.
        + rewrite /compress_polyvec; congr. 
          rewrite /fromarray256 /lift_polyvec /lift_array768 tP => i ib /=.
          rewrite !initiE //= !mapiE //= !getvE !KMatrix.Vector.offunvE //=.
          rewrite /subarray256 /lift_array256 /=.
          smt(@Array256).
  symmetry.
  proc * => /=.
  call encode10_opt_corr.
  auto => />.
qed.


lemma poly_decompress_equiv mem _p : 
    equiv [Jkem_avx2.M(Jkem_avx2.Syscall)._poly_decompress ~  Jkem.M(Jkem.Syscall)._poly_decompress  :
             valid_ptr _p 128 /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             ={Glob.mem,ap}
              ==>
             ={Glob.mem,res} /\ Glob.mem{1} = mem /\
             lift_array256 res{1} = lift_array256 res{2} /\
             pos_bound256_cxq res{1} 0 256 1 /\
             pos_bound256_cxq res{2} 0 256 1 ].
proof.
  transitivity MLKEM_Poly_avx2_prevec.Mprevec.poly_decompress
               (={ap, Glob.mem} /\ valid_ptr _p 128 /\ Glob.mem{1} = mem /\ _p = to_uint ap{1} ==> 
                   ={res, Glob.mem})
               (={ap, Glob.mem} /\ valid_ptr _p 128 /\ Glob.mem{1} = mem /\ _p = to_uint ap{2} ==>
                ={res, Glob.mem} /\
                Glob.mem{1} = mem /\
                lift_array256 res{1} = lift_array256 res{2} /\
                pos_bound256_cxq res{1} 0 256 1 /\
                pos_bound256_cxq res{2} 0 256 1); 1,2: smt().
    symmetry. proc * => /=. call prevec_eq_poly_decompress => //=.
  transitivity EncDec_AVX2.decode4
               (valid_ptr _p 128 /\ ={Glob.mem} /\
                Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
                load_array128 Glob.mem{1} _p = a{2} ==>
                ={Glob.mem} /\ Glob.mem{1} = mem /\
                lift_array256 res{1} = decompress_poly 4 res{2} /\
                pos_bound256_cxq res{1} 0 256 1)
               (valid_ptr _p 128 /\ ={Glob.mem} /\
                Glob.mem{2} = mem /\ to_uint ap{2} = _p /\
                load_array128 Glob.mem{2} _p = a{1} ==>
                ={Glob.mem} /\ Glob.mem{2} = mem /\
                lift_array256 res{2} = decompress_poly 4 res{1} /\
                pos_bound256_cxq res{2} 0 256 1).
    auto => &1 &2 [#] ap_eq mem_eq valid_p mem_def _p_def />.
    exists mem.
      exists (load_array128 mem _p).
        rewrite valid_p -mem_eq -ap_eq mem_def ap_eq _p_def //=.
        auto => &1 &m &2 [#] H0 H1 H2 H3 [#] H4 H5 H6 H7 />.
        do split.
        + rewrite /lift_array256 /decompress_poly /decompress Array256.tP in H2.
          rewrite /pos_bound256_cxq /bpos16 in H3.
          rewrite /pos_bound256_cxq /bpos16 in H7.
          rewrite /lift_array256 /decompress_poly /decompress Array256.tP in H6.
          apply Array256.ext_eq => x x_b.
            rewrite to_uint_eq -to_sint_unsigned. by move : H3 => /#.
            rewrite -to_sint_unsigned. by move : H7 => /#.
            move : (H2 x x_b); rewrite mapiE 1:x_b mapiE 1:x_b /= -eq_incoeff (pmod_small _ q) 1:H3 1:x_b => ->.
            move : (H6 x x_b); rewrite mapiE 1:x_b mapiE 1:x_b /= -eq_incoeff (pmod_small _ q) 1:H7 1:x_b => -> //=.
        + by rewrite H0 H4.
        + by rewrite H2 H6.
        + proc * => /=.
          ecall (poly_decompress_corr (Glob.mem{1}) (to_uint ap{1}) (load_array128 Glob.mem{1} _p)) => //=.
  symmetry.
  transitivity EncDec.decode4
               (valid_ptr _p 128 /\
                Glob.mem{1} = mem /\ _p = to_uint ap{1} /\
                load_array128 Glob.mem{1} _p = a{2} ==>
                Glob.mem{1} = mem /\
                lift_array256 res{1} = decompress_poly 4 res{2} /\
                pos_bound256_cxq res{1} 0 256 1)
               (mem = Glob.mem{2} /\ a{1} = a{2} ==>
                ={res} /\ mem = Glob.mem{2}).
    auto => &1 &2 [#] H0 H1 H2 H3 H4 />.
    exists (load_array128 Glob.mem{1} _p).
        rewrite H0 H1 H4 H2 H3 //=.
      auto => />.
    proc * => /=.
    ecall (MLKEM_Poly.poly_decompress_corr mem (to_uint ap{1}) (load_array128 mem _p)) => //=.
  symmetry.
  proc * => /=.
  call eq_decode4.
  auto => />.
qed.

equiv compressequiv_1 mem : 
 Jkem_avx2.M(Jkem_avx2.Syscall)._poly_compress_1 ~  Jkem.M(Jkem.Syscall)._i_poly_compress :
     pos_bound256_cxq a{1} 0 256 2 /\
     pos_bound256_cxq a{2} 0 256 2 /\
    lift_array256 a{1} = lift_array256 a{2} /\ 
    ={Glob.mem} /\ Glob.mem{1} = mem   
    ==> 
    ={Glob.mem} /\  Glob.mem{1} = mem /\
    res.`1{1} = res.`1{2}.
proof.
  transitivity MLKEM_Poly_avx2_prevec.Mprevec.poly_compress_1
               (={rp, a, Glob.mem} ==> 
                   ={res, Glob.mem})
               (pos_bound256_cxq a{1} 0 256 2 /\
                pos_bound256_cxq a{2} 0 256 2 /\
                lift_array256 a{1} = lift_array256 a{2} /\ ={Glob.mem} /\ Glob.mem{1} = mem
                ==>
                ={Glob.mem}  /\ Glob.mem{1} = mem /\ res.`1{1} = res.`1{2}); 1,2: smt().  
    + symmetry. proc * => /=. call prevec_eq_poly_compress_1 => //=. 
  transitivity EncDec_AVX2.encode4
               (p{2} = compress_poly 4 (lift_array256 a{1}) /\
                pos_bound256_cxq a{1} 0 256 2 /\ (forall i, 0<=i<256 => 0 <= p{2}.[i] < q) /\
                Glob.mem{1} = mem /\ ={Glob.mem} ==>
                ={Glob.mem}  /\ Glob.mem{1} = mem /\ res{1}.`1 = res{2})
               (pos_bound256_cxq a{2} 0 256 2 /\ (forall i, 0<=i<256 => 0 <= p{1}.[i] < q) /\
                p{1} = compress_poly 4 (lift_array256 a{2}) /\
                Glob.mem{2} = mem /\ ={Glob.mem} ==>
                ={Glob.mem}  /\ Glob.mem{2} = mem /\ res{2}.`1 = res{1}).
    auto => &1 &2 [#] pos_bound_al pos_bound_ar al_eq_ar p_eq />.
    exists Glob.mem{2}.
      exists (compress_poly 4 (lift_array256 a{1})).
        rewrite pos_bound_al pos_bound_ar /=.
        do split.
        + move => i ib; rewrite /compress_poly /lift_array256 !mapiE //=.
          move : (compress_rng (incoeff (to_sint a{1}.[i])) 4 _) => //=; smt (qE).
        + smt().
        + move => i ib; rewrite /compress_poly /lift_array256 !mapiE //=.
          move : (compress_rng (incoeff (to_sint a{1}.[i])) 4 _) => //=; smt (qE).
        + smt().
        + smt().
        + smt().
    + proc * => /=.
      ecall (poly_compress_1_corr (lift_array256 a{1})  mem) => //=.
  symmetry.
  transitivity EncDec.encode4
               (p{2} = compress_poly 4 (lift_array256 a{1}) /\
                pos_bound256_cxq a{1} 0 256 2 /\ (forall i, 0<=i<256 => 0 <= p{2}.[i] < q) /\
                Glob.mem{1} = mem /\ ={Glob.mem} ==>
                Glob.mem{1} = mem /\ ={Glob.mem} /\
                res.`1{1} = res{2})
               ((forall i, 0<=i<256 => 0 <= p{1}.[i] < q) /\
                p{1} = p{2} /\
                ={Glob.mem} ==> ={Glob.mem, res}).
               auto => &1 &2 [#] pos_bound_a a2_bnd a1_eq_a2 _p_eq_urp />.
               exists Glob.mem{1}.
                 exists (compress_poly 4 (lift_array256 a{1})).
                   auto => />;do split.
                   + move => i ibl ibh; rewrite /load_array256 !mapiE //=.
                     move : (compress_rng (incoeff (to_sint a{1}.[i])) 4 _) => //=; smt (qE).
                   + move => i ibl ibh; rewrite /load_array256 !mapiE //=.
                     move : (compress_rng (incoeff (to_sint a{1}.[i])) 4 _) => //=; smt (qE).
                   + by rewrite a1_eq_a2.
               smt().
    + proc * => /=.
      ecall (MLKEM_Poly.i_poly_compress_corr (lift_array256 a{1})) => //=.
  symmetry.
  proc * => /=.
  call eq_encode4.
  auto => />.
qed.

equiv compressequiv mem _p : 
 Jkem_avx2.M(Jkem_avx2.Syscall)._poly_compress ~  Jkem.M(Jkem.Syscall)._poly_compress :
     pos_bound256_cxq a{1} 0 256 2 /\
     pos_bound256_cxq a{2} 0 256 2 /\
    lift_array256 a{1} = lift_array256 a{2} /\ 
    ={Glob.mem,rp} /\ Glob.mem{1} = mem /\   valid_ptr _p 128 /\ _p = to_uint rp{1}
    ==> 
    ={Glob.mem} /\  touches mem Glob.mem{1} _p 128.
proof.
  transitivity MLKEM_Poly_avx2_prevec.Mprevec.poly_compress
               (={rp, a, Glob.mem} /\ valid_ptr (W64.to_uint rp{1}) 128 /\ _p = to_uint rp{1} ==> 
                   ={res, Glob.mem})
               (valid_ptr (W64.to_uint rp{1}) 128 /\
                pos_bound256_cxq a{1} 0 256 2 /\
                pos_bound256_cxq a{2} 0 256 2 /\
                lift_array256 a{1} = lift_array256 a{2} /\ ={rp,Glob.mem} /\ Glob.mem{1} = mem /\
                _p = to_uint rp{1} ==>
                ={Glob.mem}  /\  touches mem Glob.mem{1} _p 128); 1,2: smt().  
    + symmetry. proc * => /=. call prevec_eq_poly_compress => //=. 
  transitivity EncDec_AVX2.encode4
               (p{2} = compress_poly 4 (lift_array256 a{1}) /\
                pos_bound256_cxq a{1} 0 256 2 /\ (forall i, 0<=i<256 => 0 <= p{2}.[i] < q) /\
                to_uint rp{1} = _p /\ valid_ptr _p 128 /\ Glob.mem{1} = mem /\
                ={Glob.mem} ==>
                touches mem Glob.mem{1} _p 128 /\
                load_array128 Glob.mem{1} _p = res{2})
               (pos_bound256_cxq a{2} 0 256 2 /\ (forall i, 0<=i<256 => 0 <= p{1}.[i] < q) /\
                p{1} = compress_poly 4 (lift_array256 a{2}) /\
                to_uint rp{2} = _p /\ valid_ptr _p 128 /\ Glob.mem{2} = mem /\
                ={Glob.mem} ==>
                touches mem Glob.mem{2} _p 128 /\
                load_array128 Glob.mem{2} _p = res{1}).
    auto => &1 &2 [#] valid_p pos_bound_al pos_bound_ar al_eq_ar p_eq />.
    exists Glob.mem{2}.
      exists (compress_poly 4 (lift_array256 a{1})).
        rewrite pos_bound_al pos_bound_ar /=.
        do split.
        + move => i ib; rewrite /compress_poly /lift_array256 !mapiE //=. 
          move : (compress_rng (incoeff (to_sint a{1}.[i])) 4 _) => //=; smt (qE).
        + smt().
        + rewrite /valid_ptr in valid_p. move : valid_p => //=.
        + move => i ib; rewrite /compress_poly /lift_array256 !mapiE //=. 
          move : (compress_rng (incoeff (to_sint a{1}.[i])) 4 _) => //=; smt (qE).
        + smt().
        + smt().
        + smt().
        + rewrite /valid_ptr in valid_p. move : valid_p => //=.
    rewrite /touches; auto => &1 &m &2 [#] H0 H1 [#] H2 H3 />.
    apply mem_eq_ext => i.
    have ->: forall (j: address), Glob.mem{1}.[j] = if _p + 0 <= j < _p + 128 then res{m}.[j - _p]
                                                      else mem.[j].
      move => j.
      case (_p + 0 <= j < _p + 128) => jbb.
        + move : H1; rewrite /load_array128 Array128.tP => H1.
          rewrite -H1. smt(). rewrite initiE /= /#.
        + move : (H0 (j - _p)) => /#.
    have ->: forall (j: address), Glob.mem{2}.[j] = if _p + 0 <= j < _p + 128 then res{m}.[j - _p]
                                                     else mem.[j].
      move => j.
      case (_p + 0 <= j < _p + 128) => jbb.
        + move : H3; rewrite /load_array128 Array128.tP => H3.
          rewrite -H3. smt(). rewrite initiE /= /#.
        + move : (H2 (j - _p)) => /#.
    trivial.
    + proc * => /=.
      ecall (poly_compress_corr (lift_array256 a{1}) _p  mem) => //=. 
  symmetry.
  transitivity EncDec.encode4
               (p{2} = compress_poly 4 (lift_array256 a{1}) /\
                pos_bound256_cxq a{1} 0 256 2 /\ (forall i, 0<=i<256 => 0 <= p{2}.[i] < q) /\
                to_uint rp{1} = _p /\ valid_ptr _p 128 /\ Glob.mem{1} = mem /\
                ={Glob.mem} ==>
                touches mem Glob.mem{1} _p 128 /\
                load_array128 Glob.mem{1} _p = res{2})
               ((forall i, 0<=i<256 => 0 <= p{1}.[i] < q) /\
                p{1} = p{2} /\
                ={Glob.mem} ==> ={Glob.mem, res}). 
               auto => &1 &2 [#] pos_bound_a a2_bnd a1_eq_a2 _p_eq_urp valid_p />.
               exists Glob.mem{1}.
                 exists (compress_poly 4 (lift_array256 a{1})).
                   auto => />;do split.
                   + move => i ibl ibh; rewrite /load_array256 !mapiE //=.
                     move : (compress_rng (incoeff (to_sint a{1}.[i])) 4 _) => //=; smt (qE).
                   + move => i ibl ibh; rewrite /load_array256 !mapiE //=.
                     move : (compress_rng (incoeff (to_sint a{1}.[i])) 4 _) => //=; smt (qE).
                   + smt().
               smt().
    + proc * => /=.
      ecall (MLKEM_Poly.poly_compress_corr (lift_array256 a{1}) _p mem) => //=.
  symmetry.
  proc * => /=.
  call eq_encode4.
  auto => />.
qed.


lemma subequiv_noperm  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
    equiv [Jkem_avx2.M(Jkem_avx2.Syscall)._poly_sub ~Jkem.M(Jkem.Syscall)._poly_sub :
      lift_array256 ap{1} = lift_array256 ( ap{2}) /\
      lift_array256 bp{1} = lift_array256 ( bp{2}) /\
      signed_bound_cxq ap{2} 0 256 ab /\ 
      signed_bound_cxq bp{2} 0 256 bb /\
      signed_bound_cxq ap{1} 0 256 ab /\ 
      signed_bound_cxq bp{1} 0 256 bb
           ==> lift_array256 res{1} = lift_array256  ( res{2}) /\
               signed_bound_cxq res{1} 0 256 (ab + bb) /\
               signed_bound_cxq res{2} 0 256 (ab + bb) 
              ].
move => boundab boundbb; proc => /=.
exists* ap{2}, bp{2}. elim* => _ap2 _bp2.
while {2} (#pre /\ 0<= to_uint i{2} <= 256 /\ forall k, 0<=k<to_uint i{2} => rp{2}.[k] = _ap2.[k] -_bp2.[k]) (256 - to_uint i{2}); 
 1: by move => &1 ?; auto => /> => &2 ?????????; rewrite ultE /=  !to_uintD_small 1:/# ;
  smt(Array256.set_neqiE Array256.set_eqiE).

exists* ap{1}, bp{1}. elim* => _ap1 _bp1.
while {1} (#pre /\ 0<= i{1} <= 16 /\ forall k, 0<=k<16*i{1} => rp{1}.[k] = _ap1.[k] -_bp1.[k]) (16 - i{1}); last first.
+ auto => />.
  move => &1 &2 H H0 H1 H2 H3 H4; split; 1: smt(). 
  move => i1 res1; split; 1: smt().
  move => ??? res1v; split; 1: smt().
  move => i2 res2; rewrite ultE /=; split; 1: smt().
  move => ??? res2v.
  do split; first last.
  + do 2!( move : H3 H4;rewrite /signed_bound_cxq => H3 H4 k kb; rewrite res1v // 1:/#; 
    move : (H3 k _) (H4 k _)=> // ;
    rewrite /b16 qE to_sintB_small /= /#).
  + do 2!( move : H1 H2;rewrite /signed_bound_cxq => H1 H2 k kb; rewrite res2v // 1:/#; 
    move : (H1 k _) (H2 k _)=> // ;
    rewrite /b16 qE to_sintB_small /= /#).
  rewrite /lift_array256 tP => k kbl; rewrite !mapiE //= res1v 1:/# res2v 1: /#.
  rewrite !to_sintB_small => /=.
  + do 2!( move : H3 H4;rewrite /signed_bound_cxq => H3 H4; 
    move : (H3 k _) (H4 k _)=> // ;
    rewrite /b16 qE /= /#).
  + do 2!( move : H1 H2;rewrite /signed_bound_cxq => H1 H2; 
    move : (H1 k _) (H2 k _)=> // ;
    rewrite /b16 qE /= /#).
   move : H H0; rewrite /lift_array256 !tP => H H0.
   move : (H k _); 1: smt(); rewrite !mapiE //=.  
   move : (H0 k _); 1: smt(); rewrite !mapiE //=.  
   rewrite -!eq_incoeff /#.

move => &1 ?; auto => /> => &2 ??????????; do split; 1,2,4: smt().

move => k kbl kbh; rewrite initiE /= 1: /#.
case (k < 16*i{2}); 1: by move => kdif; rewrite set_get_diff // /#. 
move => *; rewrite set_get_eq //= 1,2:/#.
rewrite /VPSUB_16u16; rewrite map2bE 1: /# /=.
congr.
+ rewrite get256E /= ifT 1:/# /= !initiE /= 1,2:/# !initiE 1,2:/# /=.
  rewrite -(W16.to_uintK (_ap1.[k])) of_uint_pack2  /= -iotaredE /=.
  have -> : (32 * i{2} + 2 * (k %% 16)) %/ 2 = k by smt().
  have -> : (32 * i{2} + 2 * (k %% 16)) %% 2 = 0 by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %/ 2 = k by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %% 2 = 1 by smt().
  rewrite !bits8_div //=. 
  congr.
  apply W2u8.Pack.ext_eq => i ib.
  case (i = 0); 1:  by move => -> /=; apply W8.to_uint_eq; smt(). 
  move => *; have -> : i = 1 by smt().
  apply W8.to_uint_eq; smt(). 

congr.
rewrite get256E /= ifT 1:/# /= !initiE /= 1,2:/# !initiE 1,2:/# /=.
  rewrite -(W16.to_uintK (_bp1.[k])) of_uint_pack2  /= -iotaredE /=.
  have -> : (32 * i{2} + 2 * (k %% 16)) %/ 2 = k by smt().
  have -> : (32 * i{2} + 2 * (k %% 16)) %% 2 = 0 by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %/ 2 = k by smt().
  have -> : (32 * i{2} + (2 * (k %% 16) + 1)) %% 2 = 1 by smt().
  rewrite !bits8_div //=. 
  congr.
  apply W2u8.Pack.ext_eq => i ib.
  case (i = 0); 1:  by move => -> /=; apply W8.to_uint_eq; smt(). 
  move => *; have -> : i = 1 by smt().
  apply W8.to_uint_eq; smt(). 
qed.

lemma to_sintInj : injective W16.to_sint. 
rewrite /injective /to_sint /smod /=. 
move => x y. move => HHH. have : to_uint x = to_uint y; last by smt(W16.to_uint_eq).
move : HHH; move : (W16.to_uint_cmp x); move :  (W16.to_uint_cmp y) => /=; smt().
qed.

equiv frommontequiv : 
 Jkem_avx2.M(Jkem_avx2.Syscall)._poly_frommont ~  Jkem.M(Jkem.Syscall)._poly_frommont :
    lift_array256 arg{1} = nttunpack (lift_array256 arg{2}) ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 2 /\ 
    signed_bound_cxq res{2} 0 256 2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_frommont(rp); }
     (={rp} ==> ={r}) 
     (lift_array256  rp{1} = nttunpack (lift_array256 rp{2}) ==> 
    lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
    signed_bound_cxq r{1} 0 256 2 /\ 
    signed_bound_cxq r{2} 0 256 2); 1,2: smt(). 
symmetry. call prevec_eq_poly_frommont. auto => />.

ecall{2} (MLKEM_Poly.poly_frommont_corr (map W16.to_sint rp{2})).
ecall{1} (MLKEM_PolyAVX.poly_frommont_corr (map W16.to_sint rp{1})).

auto => />.
move => &1 &2 Hvals r1 H.

split.  
+ by move => k kbl kbh ;rewrite mapE //= initiE //=.
move => H1 _r0 H0.
move : H; rewrite tP => H.

move : H H0;  rewrite qE /Fq.SignedReductions.R /= => H H0.

do split. 
+ rewrite tP => k kb.
  rewrite /lift_array256 /= mapiE //= /nttunpack initiE //=.
  pose a:= nttunpack_idx.[k].
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  move : (H k kb); rewrite !mapiE //= => ->.
  move : (H0 (nttunpack_idx.[k]) _). move : nttunpack_bnd; rewrite allP /#. 
  rewrite -/a => ->.
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  move : (Fq.SignedReductions.SREDCp_corr (to_sint rp{1}.[k] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{1}.[k] * 1353 && to_sint rp{1}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  move => [corr11 corr12].
  move : (Fq.SignedReductions.SREDCp_corr (to_sint rp{2}.[a] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{2}.[a] * 1353 && to_sint rp{2}.[a] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  move => [corr21 corr22].
  move : Hvals; rewrite /lift_array256 tP => Hvals.
  move : (Hvals k kb).
  rewrite /lift_array256 /= mapiE //= /nttunpack initiE //=.
  rewrite -/a.
  rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
  rewrite -!Zq.eq_incoeff /= /#.

+ rewrite /signed_bound_cxq /= => k kb.
  move : (H k kb); rewrite !mapiE //= => HH.
  move : (Fq.SignedReductions.SREDCp_corr (to_sint rp{1}.[k] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  have -> /= : -109084672 <= to_sint rp{1}.[k] * 1353 && to_sint rp{1}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  smt().

+ rewrite /signed_bound_cxq /= => k kb.
  move : (H0 k kb); rewrite !mapiE //= => HH.
  move : (Fq.SignedReductions.SREDCp_corr ((map W16.to_sint rp{2}).[k] * 1353)).
  rewrite qE /Fq.SignedReductions.R /=. 
  rewrite !mapiE //=.
  have -> /= : -109084672 <= to_sint rp{2}.[k] * 1353 && to_sint rp{2}.[k] * 1353 < 109084672. move : W16.to_sint_cmp => /=; smt(). 
  smt().

qed.

equiv reduceequiv : 
 Jkem_avx2.M(Jkem_avx2.Syscall).__poly_reduce ~  Jkem.M(Jkem.Syscall).__poly_reduce :
    lift_array256 arg{1} = nttunpack (lift_array256 arg{2}) ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    pos_bound256_cxq res{1} 0 256 2 /\ 
    pos_bound256_cxq res{2} 0 256 2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_reduce(rp); }
     (={rp} ==> ={r}) 
     (lift_array256 rp{1} = nttunpack (lift_array256 rp{2}) ==> 
    lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
    pos_bound256_cxq r{1} 0 256 2 /\ 
    pos_bound256_cxq r{2} 0 256 2);1,2: smt(). 
symmetry. call prevec_eq_poly_reduce. auto => />.

ecall{2} (MLKEM_Poly.poly_reduce_corr (lift_array256 rp{2})).
ecall{1} (MLKEM_PolyAVX.poly_reduce_corr (lift_array256 rp{1})).

auto => />.
move => &1 &2; rewrite /lift_array256 tP => Hvals r1; rewrite tP => r1val r1rng r2; rewrite tP => r2val r2rng.

rewrite tP => k kb ;rewrite mapE //= initiE //=.
rewrite /nttunpack initiE //=.
pose a:= nttunpack_idx.[k].
rewrite !mapiE /=. move : nttunpack_bnd; rewrite allP /#.
move : (Hvals k kb). rewrite mapiE //=.
rewrite /nttunpack initiE //= -/a mapiE //=. move : nttunpack_bnd; rewrite allP /#.
smt(Array256.mapiE nttunpack_bnd Array256.allP).
qed.

equiv reduceequiv_noperm : 
 Jkem_avx2.M(Jkem_avx2.Syscall).__poly_reduce ~  Jkem.M(Jkem.Syscall).__poly_reduce :
    lift_array256 arg{1} = lift_array256 arg{2} ==> 
    lift_array256 res{1} = lift_array256 res{2} /\
    pos_bound256_cxq res{1} 0 256 2 /\ 
    pos_bound256_cxq res{2} 0 256 2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_reduce(rp); }
     (={rp} ==> ={r}) 
     (lift_array256 rp{1} =  (lift_array256 rp{2}) ==> 
    lift_array256 r{1} =  (lift_array256 r{2}) /\
    pos_bound256_cxq r{1} 0 256 2 /\ 
    pos_bound256_cxq r{2} 0 256 2); 1,2: smt(). 
symmetry. call prevec_eq_poly_reduce. auto => />.

ecall{2} (MLKEM_Poly.poly_reduce_corr (lift_array256 rp{2})).
ecall{1} (MLKEM_PolyAVX.poly_reduce_corr (lift_array256 rp{1})).

auto => />.
move => &1 &2; rewrite /lift_array256 tP => Hvals r1; rewrite tP => r1val r1rng r2; rewrite tP => r2val r2rng.

rewrite tP => k kb ;rewrite mapE //= initiE //=.
rewrite !mapiE /=;1: smt().  
move : (Hvals k kb). rewrite mapiE //=.
rewrite  mapiE //=. 
smt(Array256.mapiE).
qed.


import Zq. 

require import NTT_AVX_j.

equiv basemulequiv : 
 Jkem_avx2.M(Jkem_avx2.Syscall)._poly_basemul ~Jkem.M(Jkem.Syscall)._poly_basemul :
    lift_array256 ap{1} = nttunpack (lift_array256 ap{2}) /\
    lift_array256 bp{1} = nttunpack (lift_array256 bp{2}) /\
    signed_bound_cxq ap{1} 0 256 2 /\  
    signed_bound_cxq bp{1} 0 256 2 /\
    signed_bound_cxq ap{2} 0 256 2 /\  
    signed_bound_cxq bp{2} 0 256 2
                              ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 1 /\ 
    signed_bound_cxq res{2} 0 256 3.
proof.
proc*; simplify.
ecall{2} (poly_basemul_correct (lift_array256 ap{2}) (lift_array256 bp{2})).
ecall{1} (poly_basemul_avx2_ph (nttpack (lift_array256 ap{1})) (nttpack (lift_array256  bp{1}))).
auto => />.
move => &1 &2 /> E1 E2 *. 
rewrite !nttpackK => /> r1 -> Hb1 r2 Hb2 ->.
by rewrite E1 E2 !nttunpackK.
qed.

lemma poly_add_corr_avx_impl ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 => 
  forall _a _b,
      phoare[ Mprevec.poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r
   by move => abb bbb _a _b; apply (MLKEM_PolyAVX.poly_add_corr _a _b ab bb abb bbb).

lemma addequiv  (ab1 bb1 ab2 bb2 : int):
    0 <= ab1 && ab1 <= 6 =>
    0 <= ab2 && ab2 <= 6 =>
    0 <= bb1 && bb1 <= 3 =>
    0 <= bb2 && bb2 <= 3 =>
    equiv [Jkem_avx2.M(Jkem_avx2.Syscall)._poly_add2 ~Jkem.M(Jkem.Syscall)._poly_add2 :
      lift_array256 rp{1} = lift_array256 (nttunpack rp{2}) /\
      lift_array256 bp{1} = lift_array256 (nttunpack bp{2}) /\
      signed_bound_cxq rp{2} 0 256 ab2 /\ 
      signed_bound_cxq bp{2} 0 256 bb2 /\
      signed_bound_cxq rp{1} 0 256 ab1 /\ 
      signed_bound_cxq bp{1} 0 256 bb1
           ==> lift_array256 res{1} = lift_array256  (nttunpack res{2}) /\
               signed_bound_cxq res{1} 0 256 (ab1 + bb1) /\
               signed_bound_cxq res{2} 0 256 (ab2 + bb2) 
              ].
proof.
move => abb1 abb2 bbb1 bbb2.
proc*.  
transitivity {1} { r <@ Mprevec.poly_add2(rp,bp); }
     (={rp,bp} ==> ={r}) 
     (lift_array256 rp{1} = lift_array256 (nttunpack rp{2}) /\
      lift_array256 bp{1} = lift_array256 (nttunpack bp{2}) /\
    signed_bound_cxq rp{1} 0 256 ab1 /\  
    signed_bound_cxq bp{1} 0 256 bb1 /\
    signed_bound_cxq rp{2} 0 256 ab2 /\  
    signed_bound_cxq bp{2} 0 256 bb2
                              ==> 
    lift_array256 r{1} = lift_array256 (nttunpack r{2}) /\
    signed_bound_cxq r{1} 0 256 (ab1+bb1) /\ 
    signed_bound_cxq r{2} 0 256 (ab2+bb2)); 1,2: smt(). 
symmetry. call prevec_eq_poly_add2. auto => />.

have Hright :=  (poly_add_correct_impl ab2 bb2 abb2 bbb2).
ecall{2} (Hright (lift_array256 rp{2}) (lift_array256 bp{2})).
have Hleft :=  (poly_add_corr_avx_impl ab1 bb1 abb1 bbb1).
ecall{1} (Hleft (lift_array256 rp{1}) (lift_array256  bp{1})).

auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 r2 H6 H7 r1 H8 H9.
rewrite /lift_array256 tP => k kb.
rewrite !mapiE //=.
rewrite /nttunpack initiE //=.
pose a:= nttunpack_idx.[k].
rewrite H7 // H9; 1: smt(nttunpack_bnd Array256.allP).
rewrite /lift_array256 !mapiE //=;1,2: smt(nttunpack_bnd Array256.allP). 
rewrite /lift_array256 !tP in H0.
rewrite /lift_array256 !tP in H1.
move : (H0 k kb); rewrite !mapiE //=.
move : (H1 k kb); rewrite !mapiE //=.
smt(Array256.initiE).
qed.

lemma addequiv_noperm  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
    equiv [Jkem_avx2.M(Jkem_avx2.Syscall)._poly_add2 ~Jkem.M(Jkem.Syscall)._poly_add2 :
      lift_array256 rp{1} = lift_array256 ( rp{2}) /\
      lift_array256 bp{1} = lift_array256 ( bp{2}) /\
      signed_bound_cxq rp{2} 0 256 ab /\ 
      signed_bound_cxq bp{2} 0 256 bb /\
      signed_bound_cxq rp{1} 0 256 ab /\ 
      signed_bound_cxq bp{1} 0 256 bb
           ==> lift_array256 res{1} = lift_array256  ( res{2}) /\
               signed_bound_cxq res{1} 0 256 (ab + bb) /\
               signed_bound_cxq res{2} 0 256 (ab + bb) 
              ].
move => abb bbb.
proc*.  
transitivity {1} { r <@ Mprevec.poly_add2(rp,bp); }
     (={rp,bp} ==> ={r}) 
     (lift_array256 rp{1} = lift_array256 ( rp{2}) /\
      lift_array256 bp{1} = lift_array256 ( bp{2}) /\
    signed_bound_cxq rp{1} 0 256 ab /\  
    signed_bound_cxq bp{1} 0 256 bb /\
    signed_bound_cxq rp{2} 0 256 ab /\  
    signed_bound_cxq bp{2} 0 256 bb
                              ==> 
    lift_array256 r{1} = lift_array256 ( r{2}) /\
    signed_bound_cxq r{1} 0 256 (ab+bb) /\ 
    signed_bound_cxq r{2} 0 256 (ab+bb)); 1,2: smt().
symmetry. call prevec_eq_poly_add2. auto => />.

have Hright :=  (poly_add_correct_impl ab bb abb bbb).
ecall{2} (Hright (lift_array256 rp{2}) (lift_array256 bp{2})).
have Hleft :=  (poly_add_corr_avx_impl ab bb abb bbb).
ecall{1} (Hleft (lift_array256 rp{1}) (lift_array256  bp{1})).

auto => />.
move => &1 &2 H0 H1 H2 H3 H4 H5 r2 H6 H7 r1 H8 H9.
rewrite /lift_array256 tP => k kb.
rewrite !mapiE //=.
rewrite H7 // H9 /#.
qed.

equiv frommsgequiv_noperm  : 
 Jkem_avx2.M(Jkem_avx2.Syscall)._poly_frommsg_1 ~  Jkem.M(Jkem.Syscall)._i_poly_frommsg :
    ={ap} ==> 
    lift_array256 res{1} = lift_array256 res{2} /\
    pos_bound256_cxq res{1} 0 256 1 /\ 
    pos_bound256_cxq res{2} 0 256 1.
transitivity Mprevec.poly_frommsg_1
     (={ap,rp} ==> ={res}) 
     (={ap}
                              ==> 
    lift_array256 res{1} = lift_array256 ( res{2}) /\
    pos_bound256_cxq res{1} 0 256 1 /\
    pos_bound256_cxq res{2} 0 256 1);1,2: smt().
symmetry. proc*; call prevec_eq_poly_frommsg. auto => />.

  transitivity EncDec_AVX2.decode1_opt
               (
    ap{1} = a{2} ==> 
    lift_array256 res{1} = decompress_poly 1 res{2} /\
    pos_bound256_cxq res{1} 0 256 1)
               (
    a{1} = ap{2} ==> 
    decompress_poly 1 res{1} = lift_array256 ( res{2}) /\
    pos_bound256_cxq res{2} 0 256 1);1,2: smt(). 
    proc*; ecall (poly_frommsg_corr ap{1}). auto => />.
    transitivity EncDec.decode1 
      (={a} ==> ={res})
               (
    a{1} = ap{2} ==> 
    decompress_poly 1 res{1} = lift_array256 ( res{2}) /\
    pos_bound256_cxq res{2} 0 256 1);1,2: smt(). 
    proc*. ecall (eq_decode1_opt); auto => />. 
    symmetry; proc*; ecall  (MLKEM_Poly.poly_frommsg_corr ap{1}); auto => />;smt().
qed.

lemma compress_poly_rng i xs :
  1 <= i < 12 =>
  all (fun (x : int) => 0 <= x < 2^i) (compress_poly i xs).
rewrite /compress_poly /map allP => Hi j Hj. rewrite !initiE //=. rewrite compress_rng //. qed.

equiv tomsgequiv_noperm  : 
 Jkem_avx2.M(Jkem_avx2.Syscall)._poly_tomsg_1 ~  Jkem.M(Jkem.Syscall)._i_poly_tomsg :
    lift_array256 a{1} = lift_array256 a{2} /\
    pos_bound256_cxq a{1} 0 256 2 /\ 
    pos_bound256_cxq a{2} 0 256 2 ==>
    res{1}.`1 = res{2}.`1.
transitivity Mprevec.poly_tomsg_1
     (={a,rp} ==> res{1}.`1 = res{2}.`1) 
     (lift_array256 a{1} = lift_array256 ( a{2}) /\
    pos_bound256_cxq a{1} 0 256 2 /\
    pos_bound256_cxq a{2} 0 256 2
                              ==> 
    res{1}.`1 = res{2}.`1);1,2: smt(). 
symmetry. proc*; call prevec_eq_poly_tomsg. auto => />.

  transitivity EncDec_AVX2.encode1
               (
    a{2} = compress_poly 1 (lift_array256 a{1}) /\
    pos_bound256_cxq a{1} 0 256 2
                              ==> 
    res{1}.`1 = res{2})
               (
    a{1} = compress_poly 1 (lift_array256 a{2}) /\
    pos_bound256_cxq a{2} 0 256 2
                              ==> 
    res{2}.`1 = res{1});1,2: smt(). 
    proc*; ecall (poly_tomsg_corr (lift_array256 a{1})). by auto => />.
    transitivity EncDec.encode1 
      (={a} /\ Array256.all (fun x => 0 <= x < 2 ) a{1} ==> ={res})
               (
    a{1} = compress_poly 1 (lift_array256 a{2}) /\
    pos_bound256_cxq a{2} 0 256 2
                              ==> 
    res{2}.`1 = res{1}).
    auto => /> &1 &2. exists (compress_poly 1 (lift_array256 a{1})) => />. rewrite compress_poly_rng //. smt().
    proc*. ecall (eq_encode1). auto => />. 
    symmetry; proc*; ecall  (MLKEM_Poly.poly_tomsg_corr (lift_array256 a{1})); auto => />. 
qed.

lemma polyvec_tobytes_equiv :
    forall (_p : int),
    equiv [Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_tobytes ~Jkem.M(Jkem.Syscall).__polyvec_tobytes :
             _p = to_uint rp{1} /\
             valid_ptr (W64.to_uint rp{1}) (3*384) /\
             pos_bound768_cxq a{1} 0 768 2 /\
             pos_bound768_cxq a{2} 0 768 2 /\
             lift_array768 a{1} = nttunpackv (lift_array768 a{2}) /\ ={rp,Glob.mem} ==> ={Glob.mem} ].
proof.
  move => _p.
  transitivity MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_tobytes
               (={rp, a, Glob.mem} /\ valid_ptr (W64.to_uint rp{1}) 1152 /\ _p = to_uint rp{1} ==> ={res, Glob.mem})
               (valid_ptr (W64.to_uint rp{1}) 1152 /\
                pos_bound768_cxq a{1} 0 768 2 /\
                pos_bound768_cxq a{2} 0 768 2 /\
                lift_array768 a{1} = nttunpackv (lift_array768 a{2}) /\ ={rp,Glob.mem} /\
                _p = to_uint rp{1} ==>
                ={Glob.mem}); first 2 by smt().
    + symmetry. proc * => /=. call prevec_eq_polyvec_tobytes => //=.
  transitivity EncDec_AVX2.encode12_opt_vec
               (map incoeff a{2} = lift_array768 (nttpackv a{1}) /\
                pos_bound768_cxq a{1} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= a{2}.[i] < q) /\
                to_uint rp{1} = _p /\ valid_ptr _p (3*384) /\
                ={Glob.mem} ==>
                touches Glob.mem{2} Glob.mem{1} _p (3*384) /\
                load_array1152 Glob.mem{1} _p = res{2})
               (pos_bound768_cxq a{2} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= a{1}.[i] < q) /\
                map incoeff a{1} = lift_array768 a{2} /\
                to_uint rp{2} = _p /\ valid_ptr _p (3*384) /\
                ={Glob.mem} ==>
                touches Glob.mem{1} Glob.mem{2} _p (3*384) /\
                load_array1152 Glob.mem{2} _p = res{1}).
    auto => &1 &2 [#] valid_p pos_bound_al pos_bound_ar al_eq_ar p_eq />.
    exists Glob.mem{2}.
      exists (map (fun x => (W16.to_sint x) %% q) (nttpackv a{1})).
        rewrite pos_bound_al pos_bound_ar /=.
        do split.
        + rewrite /lift_array768 tP => i i_b.
          rewrite mapiE 1://= mapiE 1://= mapiE 1://= //=.
          rewrite -eq_incoeff modz_mod => />.
        + move => i i_b.
          rewrite mapiE 1:i_b /=.
          rewrite modz_cmp 1:qE //=.
        + move : (W64.to_uint_cmp rp{1}) => //=.
        + rewrite /valid_ptr in valid_p. move : valid_p => //=.
        + move => i i_b.
          rewrite mapiE 1:i_b /=.
          rewrite modz_cmp 1:qE //=.
        + rewrite /lift_array768 tP => i i_b.
          rewrite mapiE 1://= mapiE 1://= mapiE 1://= //=.
          rewrite -eq_incoeff modz_mod eq_incoeff => />.
          rewrite -(Array768.mapiE (fun x => incoeff (W16.to_sint x))) 1:i_b.
          rewrite (_: (map (fun x => incoeff (W16.to_sint x)) (nttpackv a{1})) = lift_array768 (nttpackv a{1})) => />.
          rewrite -nttpackv_lift al_eq_ar unpackvK //=.
          rewrite /lift_array768 mapiE 1:i_b //=.
        + rewrite p_eq //=.
        + move : (W64.to_uint_cmp rp{1}) => //=.
        + rewrite /valid_ptr in valid_p. move : valid_p => //=.
    rewrite /touches; auto => &1 &m &2 [#] H0 H1 [#] H2 H3 />.
    apply mem_eq_ext => i.
    have ->: forall (j: address), Glob.mem{1}.[j] = if _p + 0 <= j < _p + 1152 then res{m}.[j - _p]
                                                      else Glob.mem{m}.[_p + (j - _p)].
      move => j.
      case (_p + 0 <= j < _p + 1152) => jbb.
        + move : H1; rewrite /load_array1152 Array1152.tP => H1.
          rewrite -H1. smt(). rewrite initiE /= /#.
        + rewrite -H0. smt().
          move : jbb => /#.
    have ->: forall (j: address), Glob.mem{2}.[j] = if _p + 0 <= j < _p + 1152 then res{m}.[j - _p]
                                                     else Glob.mem{m}.[_p + (j - _p)].
      move => j.
      case (_p + 0 <= j < _p + 1152) => jbb.
        + move : H3; rewrite /load_array1152 Array1152.tP => H3.
          rewrite -H3. smt(). rewrite initiE /= /#.
        + rewrite -H2. smt().
          move : jbb => /#.
    trivial.
    + proc * => /=.
      ecall (polyvec_tobytes_corr (Glob.mem{1}) (to_uint rp{1}) (lift_array768 (nttpackv a{1}))) => //=.
  symmetry.
  transitivity EncDec.encode12_vec
               (pos_bound768_cxq a{1} 0 768 2 /\ (forall i, 0<=i<768 => 0 <= a{2}.[i] < q) /\
                map incoeff a{2} = lift_array768 a{1} /\
                to_uint rp{1} = _p /\ valid_ptr _p (3*384) /\
                ={Glob.mem} ==>
                touches Glob.mem{2} Glob.mem{1} _p (3*384) /\
                load_array1152 Glob.mem{1} _p = res{2})
               ((forall i, 0<=i<768 => 0 <= a{1}.[i] < q) /\
                a{1} = a{2} /\
                ={Glob.mem} ==> ={Glob.mem, res}).
               auto => &1 &2 [#] pos_bound_a a2_bnd a1_eq_a2 _p_eq_urp valid_p />.
               exists Glob.mem{1}.
                 exists (arg{2}).
                   split.
                   + auto => />.
                     rewrite valid_p 1:/= //=.
                   + auto => />.
               auto => />.
    + proc * => /=.
      ecall (MLKEM_PolyVec.polyvec_tobytes_corr (Glob.mem{1}) (to_uint rp{1}) (lift_array768 a{1})) => //=.
      auto => />.
  symmetry.
  proc * => /=.
  call encode12_opt_vec_corr.
  auto => />.
qed.


lemma polyvec_add2_equiv  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
  forall (_a _b : coeff Array768.t),
    equiv [Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_add2 ~Jkem.M(Jkem.Syscall).__polyvec_add2 :
      _a = lift_array768 r{2} /\
      _b = lift_array768 b{2} /\ signed_bound768_cxq r{2} 0 768 ab /\ signed_bound768_cxq b{2} 0 768 bb /\
      _a = nttpackv (lift_array768 r{1}) /\
      _b = nttpackv (lift_array768 b{1}) /\ signed_bound768_cxq r{1} 0 768 ab /\ signed_bound768_cxq b{1} 0 768 bb
           ==> lift_array768 res{1} = nttunpackv (lift_array768  res{2}) /\
               signed_bound768_cxq res{1} 0 768 (ab + bb) /\
               signed_bound768_cxq res{2} 0 768 (ab + bb) 
              ].
proof. 
move => abb bbb _a _b;proc* => /=.
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_add2(r,b); }
       (={r,b} ==> ={r0})
       (_a = lift_array768 r{2} /\
  _b = lift_array768 b{2} /\
  signed_bound768_cxq r{2} 0 768 ab /\
  signed_bound768_cxq b{2} 0 768 bb /\
  _a = nttpackv (lift_array768 r{1}) /\
  _b = nttpackv (lift_array768 b{1}) /\ signed_bound768_cxq r{1} 0 768 ab /\ signed_bound768_cxq b{1} 0 768 bb   ==> 
      lift_array768 r0{1} = nttunpackv (lift_array768 r0{2}) /\ signed_bound768_cxq r0{1} 0 768 (ab + bb) /\ signed_bound768_cxq r0{2} 0 768 (ab + bb)); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_add2 => //.
have corr1 := (polvec_add_corr (nttunpackv _a) (nttunpackv _b) ab bb abb bbb). call {1} corr1.
have corr2 := (polyvec_add_corr _a _b ab bb abb bbb); call {2} corr2.

auto => />. 
move => &1 &2 ????->->??rr?rval; do split; 1,2: by rewrite packvK.  
move => ??rr0?r0val.
rewrite tP => k kb.
rewrite /(lift_array768 rr0) mapiE //= r0val // !packvK.
have  -> : lift_array768 rr = 
   Array768.init (fun k => (nttpackv (lift_array768 r{1})).[k] + (nttpackv (lift_array768 b{1})).[k])
 by rewrite tP => kk kkb; rewrite initiE //= /(lift_array768 rr) mapiE //= /#.
rewrite /nttunpackv /nttpackv initiE //=.
case (0<=k<256).
+ move => *.
  rewrite /subarray256 /nttunpack initiE //= initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k].
  do 4!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
  do 2!(rewrite ifT; 1: smt(nttunpack_bnd Array256.allP);
   rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  rewrite -/b.
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  move : nttpack_idxK; rewrite allP; smt(mem_iota).  

case (256<=k<512).
+ move => *.
  rewrite /subarray256 /nttunpack initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k-256].
  do 3!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifT; 1: smt(nttunpack_bnd Array256.allP). 
  do 2!(rewrite  /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite ifF; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite ifT; 1: smt(nttunpack_bnd Array256.allP). 
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  rewrite -/b.
  rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP).
  move : nttpack_idxK; rewrite allP; smt(mem_iota).  

+ move => *.
  rewrite /subarray256 /nttunpack initiE //=;1: smt(nttunpack_bnd Array256.allP).
  pose a := nttunpack_idx.[k - 512].
  do 4!(rewrite initiE //=; 1:smt(nttunpack_bnd Array256.allP)).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  do 2!(rewrite /nttpack initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  pose b := nttpack_idx.[a].
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  rewrite ifF;1: smt(nttunpack_bnd Array256.allP).
  do 2!(rewrite initiE //=;1: smt(nttpack_bnd nttunpack_bnd Array256.allP)).
  rewrite /a.
  move : nttpack_idxK; rewrite allP; smt(mem_iota).  
qed.

lemma polyvec_add2_equiv_noperm  (ab bb : int):
    0 <= ab && ab <= 6 =>
    0 <= bb && bb <= 3 =>
  forall (_a _b : coeff Array768.t),
    equiv [Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_add2 ~Jkem.M(Jkem.Syscall).__polyvec_add2 :
      _a = lift_array768 r{2} /\
      _b = lift_array768 b{2} /\ signed_bound768_cxq r{2} 0 768 ab /\ signed_bound768_cxq b{2} 0 768 bb /\
      _a = lift_array768 r{1} /\
      _b = lift_array768 b{1} /\ signed_bound768_cxq r{1} 0 768 ab /\ signed_bound768_cxq b{1} 0 768 bb
           ==> lift_array768 res{1} = lift_array768  res{2} /\
               signed_bound768_cxq res{1} 0 768 (ab + bb) /\
               signed_bound768_cxq res{2} 0 768 (ab + bb) 
              ].
proof. 
move => abb bbb _a _b;proc* => /=.
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_add2(r,b); }
       (={r,b} ==> ={r0})
       (_a = lift_array768 r{2} /\
  _b = lift_array768 b{2} /\
  signed_bound768_cxq r{2} 0 768 ab /\
  signed_bound768_cxq b{2} 0 768 bb /\
  _a =  (lift_array768 r{1}) /\
  _b =  (lift_array768 b{1}) /\ signed_bound768_cxq r{1} 0 768 ab /\ signed_bound768_cxq b{1} 0 768 bb   ==> 
      lift_array768 r0{1} = (lift_array768 r0{2}) /\ signed_bound768_cxq r0{1} 0 768 (ab + bb) /\ signed_bound768_cxq r0{2} 0 768 (ab + bb)); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_add2 => //.
have corr1 := (polvec_add_corr ( _a) ( _b) ab bb abb bbb). call {1} corr1.
have corr2 := (polyvec_add_corr _a _b ab bb abb bbb); call {2} corr2.

auto => />.  
move => &1 &2 ????????rr? H rval? H0. 
move : H H0; rewrite /lift_array768 !tP => ? ? k kb. 
rewrite !mapiE;smt(Array768.mapiE).
qed.

lemma polyvec_reduce_equiv _a :
    equiv [Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_reduce ~Jkem.M(Jkem.Syscall).__polyvec_reduce :
       _a  = lift_array768 r{2} /\  _a  = nttpackv (lift_array768 r{1})  ==>
       (forall k, 0 <= k < 768 => bpos16 res{1}.[k] (2*q)) /\
       (forall k, 0 <= k < 768 => bpos16 res{2}.[k] (2*q)) /\
              lift_array768 res{1} = nttunpackv (lift_array768 res{2}) ].
proc*. 
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_reduce(r); }
       (={r} ==> ={r0})
       (_a = lift_array768 r{2} /\ _a = nttpackv (lift_array768 r{1})   ==> 
      (forall (k : int), 0 <= k && k < 768 => bpos16 r0{1}.[k] (2 * q)) /\
  (forall (k : int), 0 <= k && k < 768 => bpos16 r0{2}.[k] (2 * q)) /\
  lift_array768 r0{1} = nttunpackv (lift_array768  r0{2})); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_reduce => //.
have corr1 := (polvec_reduce_corr (nttunpackv _a)). call {1} corr1.
have corr2 := (polyvec_reduce_corr _a); call {2} corr2.

auto => />. 
move => &1 &2 ?????; do split;1: smt(packvK unpackvK). 
move => ??<-?.
smt(packvK unpackvK). 
qed.

lemma polyvec_reduce_equiv_noperm _a :
    equiv [Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_reduce ~Jkem.M(Jkem.Syscall).__polyvec_reduce :
       _a  = lift_array768 r{2} /\  _a  = lift_array768 r{1}  ==>
       (forall k, 0 <= k < 768 => bpos16 res{1}.[k] (2*q)) /\
       (forall k, 0 <= k < 768 => bpos16 res{2}.[k] (2*q)) /\
              lift_array768 res{1} =  lift_array768 res{2} ].
proc*. 
transitivity {1} {r0 <@ MLKEM_PolyVec_avx2_prevec.Mprevec.polyvec_reduce(r); }
       (={r} ==> ={r0})
       (_a = lift_array768 r{2} /\ _a = (lift_array768 r{1})   ==> 
      (forall (k : int), 0 <= k && k < 768 => bpos16 r0{1}.[k] (2 * q)) /\
  (forall (k : int), 0 <= k && k < 768 => bpos16 r0{2}.[k] (2 * q)) /\
  lift_array768 r0{1} =  (lift_array768  r0{2})); 1,2: by smt().
  + symmetry. call prevec_eq_polyvec_reduce => //.
have corr1 := (polvec_reduce_corr ( _a)). call {1} corr1.
have corr2 := (polyvec_reduce_corr _a); call {2} corr2.

auto => /> /#. 
qed.

equiv pointwiseequiv : 
 Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_pointwise_acc ~  Jkem.M(Jkem.Syscall).__polyvec_pointwise_acc :
    lift_array768 arg{1}.`2 = nttunpackv (lift_array768 arg{2}.`1) /\
    lift_array768 arg{1}.`3 = nttunpackv (lift_array768 arg{2}.`2) /\
    signed_bound768_cxq arg{1}.`2 0 768 2 /\
    signed_bound768_cxq arg{1}.`3 0 768 2 /\
    signed_bound768_cxq arg{2}.`1 0 768 2 /\
    signed_bound768_cxq arg{2}.`2 0 768 2
    ==> 
    lift_array256 res{1} = nttunpack (lift_array256 res{2}) /\
    signed_bound_cxq res{1} 0 256 4 /\ 
    signed_bound_cxq res{2} 0 256 2.
proof.
proc => /=.
seq 2 3 :(#pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 1 /\
         signed_bound_cxq r{2} 0 256 3).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4. do split. 
+ move : H; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H k kb.
  move : (H k _); 1: smt(). rewrite !initiE//= 1:/# kb /=.
  rewrite /nttunpack !mapiE //= 1:/# !initiE//=.
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 k _); 1: smt(). rewrite !initiE//= 1:/# kb /=.
  rewrite /nttunpack !mapiE //= 1:/# !initiE//=.
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=.
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=.
+ move : H3; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=.
move : H4; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=.

seq 1 1 :(#pre /\ 
         lift_array256 t{1} = nttunpack (lift_array256 t{2}) /\
         signed_bound_cxq t{1} 0 256 1 /\
         signed_bound_cxq t{2} 0 256 3).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7. do split. 
+ move : H; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H k kb.
  move : (H (256+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /nttunpack !mapiE //= 1:/# ifT 1:/# !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 (256+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /nttunpack !mapiE //= 1:/# ifT 1:/# !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=;1: smt().
+ move : H3; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H4; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=;1:smt().

seq 1 1 :(#{/~r{2}}{~r{1}}{~t{2}}{~t{1}}pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 2 /\
         signed_bound_cxq r{2} 0 256 6).
have Hcall:= addequiv 1 1 3 3 _ _ => //.
call Hcall.
auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10. do split. 
+ rewrite lift256_nttunpack; apply H5.
+ rewrite lift256_nttunpack; apply H8.
move => ?? r2 r1 ???.
rewrite -lift256_nttunpack;1: assumption.

seq 1 1 :(#pre /\ 
         lift_array256 t{1} = nttunpack (lift_array256 t{2}) /\
         signed_bound_cxq t{1} 0 256 1 /\
         signed_bound_cxq t{2} 0 256 3).
ecall (basemulequiv). auto => />.
move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7. do split. 
+ move : H; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H k kb.
  move : (H (512+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /nttunpack !mapiE //= 1:/# ifF 1:/# !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H0; rewrite /nttunpackv -lift256_nttunpack /lift_array256 !tP => H0 k kb.
  move : (H0 (512+k) _); 1: smt(). rewrite !initiE//= 1:/# /=.
  rewrite ifF 1:/# /nttunpack !mapiE //= 1:/# ifF 1:/# !initiE//=. 
  pose a := nttunpack_idx.[k].
  rewrite !initiE//=; 1,2: smt(nttunpack_bnd Array256.allP). 
  rewrite /lift_array768;smt(Array768.mapiE nttunpack_bnd Array256.allP).
+ move : H1; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H1 k kb.
  move : (H1 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H2; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H2 k kb.
move : (H2 k _); 1: smt(). rewrite !initiE//=;1: smt().
+ move : H3; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H3 k kb.
  move : (H3 k _); 1: smt(). rewrite !initiE//=;1: smt().
move : H4; rewrite /signed_bound768_cxq /signed_bound_cxq /nttunpackv => H4 k kb.
move : (H4 k _); 1: smt(). rewrite !initiE//=;1: smt().


seq 1 1 :(#{/~r{2}}{~r{1}}{~t{2}}{~t{1}}pre /\ 
         lift_array256 r{1} = nttunpack (lift_array256 r{2}) /\
         signed_bound_cxq r{1} 0 256 3 /\
         signed_bound_cxq r{2} 0 256 9).
have Hcall:= addequiv 2 1 6 3 _ _ => //.
call Hcall.
auto => />.
move => &1 &2 ????????????. do split. 
+ rewrite lift256_nttunpack;1: assumption.
+ rewrite lift256_nttunpack;1: assumption.
move => ?? r1 r2 ???.
rewrite -lift256_nttunpack;1: assumption.

ecall{2} (MLKEM_Poly.poly_reduce_corr (lift_array256 r{2})).
auto => />.
move => &1 &2 ?????? H H1 ? rr.
move: H; rewrite /lift_array256 => H H2 ?.
split.
 by rewrite H H2.
smt().
qed.

equiv nttequiv :
Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_ntt ~Jkem.M(Jkem.Syscall).__polyvec_ntt : 
   lift_array768 arg{1} = lift_array768 arg{2} /\ 
   signed_bound768_cxq arg{1} 0 768 2 /\ 
   signed_bound768_cxq arg{2} 0 768 2 ==>
   lift_array768 res{1} = nttunpackv (lift_array768 res{2}) /\ 
   pos_bound768_cxq res{1} 0 768 2 /\ 
   pos_bound768_cxq res{2} 0 768 2.
proc *. 
ecall {2} (polyvec_ntt_corr r{2}) => /=.
conseq />;1: smt().
ecall {1} (polyvec_ntt_avx2_corr r{1}) => /=.
auto => /> &1 &2 HH?? r H H0 r2 H1 H2. 
have  : lift_polyvec (nttpackv r) = lift_polyvec r2.
+ rewrite -H1 -H;congr.
  rewrite /lift_polyvec KMatrix.Vector.eq_vectorP => k kb.
  rewrite !KMatrix.Vector.offunvE //=.
  rewrite /lift_array768 tP in HH.
  rewrite /subarray256 /lift_array256 tP => i ib.
  move : (HH (k*256+i) _); 1: by smt().
  rewrite !mapiE //= 1,2: /# !initiE //= /#.
rewrite /lift_polyvec /lift_array768 tP KMatrix.Vector.eq_vectorP => H3 k kb. 
rewrite !mapiE //=.
case (0<=k<256).
+ move => kbb; move : (H3 0 _) => //; rewrite !KMatrix.Vector.offunvE //=.
  rewrite /nttpackv /nttunpackv initiE//= kbb /= /nttunpack initiE//=.
  pose a := nttunpack_idx.[k].
  rewrite /subarray256 /lift_array256 /nttpackv tP => HHH.
  move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
  move : (HHH a _); 1: smt(). 
  rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/#.
  rewrite initiE//= 1:/# initiE//= 1:/#. 
  pose b := nttpack_idx.[a].
  rewrite ifT 1:/# /nttpack initiE//= 1:/# initiE//= 1:/# mapiE //= 1:/#. 
  move : nttpack_idxK; rewrite allP => Hidx.
  move : (Hidx k _)=>//; smt(mem_iota).

case (256 <= k < 512).
+ move => kbb ?; move : (H3 1 _) => //; rewrite !KMatrix.Vector.offunvE //=.
  rewrite /nttpackv /nttunpackv /= /nttpack /nttunpack initiE//=.
  rewrite /subarray256 /lift_array256 /nttpackv tP => HHH.
  rewrite ifF //= ifT //= initiE //= 1:/#.
  pose a := nttunpack_idx.[k-256].
  move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
  rewrite initiE //= 1: /# !mapiE //= 1: /#. 
  move : (HHH (a) _); 1: smt(). 
  rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/# initiE//= 1:/#.
  rewrite ifF 1: /# initiE//= 1:/# initiE//= 1:/#. 
  rewrite ifT 1: /#. 
  pose b := nttpack_idx.[a].
  move : nttpack_idxK; rewrite allP => Hidx.
  move : (Hidx (k-256) _)=>//; smt(mem_iota).

move => *; move : (H3 2 _) => //; rewrite !KMatrix.Vector.offunvE //=.
rewrite /nttpackv /nttunpackv /= /nttpack /nttunpack initiE//=.
rewrite /subarray256 /lift_array256 /nttpackv tP => HHH.
rewrite ifF //= ifF //= initiE //= 1:/#.
pose a := nttunpack_idx.[k-512].
move :nttunpack_bnd nttpack_bnd; rewrite !allP => pb upb.
rewrite initiE //= 1: /# !mapiE //= 1: /#. 
move : (HHH (a) _); 1: smt(). 
rewrite !mapiE //= 1,2: /# initiE//= 1:/#  initiE//= 1:/# initiE//= 1:/#.
rewrite ifF 1: /# ifF 1:/# initiE//= 1:/#. 
pose b := nttpack_idx.[a].
rewrite initiE//=  1:/# . 
move : nttpack_idxK; rewrite allP => Hidx.
move : (Hidx (k-512) _)=>//; smt(mem_iota).
qed.

equiv polyinvnttequiv :
Jkem_avx2.M(Jkem_avx2.Syscall)._poly_invntt ~Jkem.M(Jkem.Syscall)._poly_invntt : 
   lift_array256 arg{1} = nttunpack (lift_array256 arg{2}) /\ 
   signed_bound_cxq arg{1} 0 256 4 /\ 
   signed_bound_cxq arg{2} 0 256 4 ==>
   lift_array256 res{1} = lift_array256 res{2} /\ 
   signed_bound_cxq res{1} 0 256 1 /\
   signed_bound_cxq res{2} 0 256 1.
proc*.
ecall{2} (invntt_correct (lift_array256 rp{2})) => /=.
conseq />; 1: by move => &1 &2 *;do split;  smt(). 
ecall{1} (poly_invntt_avx2_corr rp{2}) => /=. 
auto => /> &1 &2. rewrite lift_nttpack => -> H1 H2. rewrite nttunpackK //= => r <- H3. move => r0 <- H4. 
rewrite /scale /map /lift_array256 /R tP => /> i Hi1 Hi2. rewrite !initiE //=. rewrite Zq.ComRing.mulrC //. qed.

lemma signed_bound768_cxq_small r (i j:int) :
  i <= j => signed_bound768_cxq r 0 768 i => signed_bound768_cxq r 0 768 j.
rewrite /signed_bound768_cxq => />Hij H k Hk1 Hk2. move :(H k). rewrite Hk1 Hk2 => />. smt(). qed.

lemma eq_vectorP3 :
      forall (v1 v2 : PolyVec.polyvec),
        (v1 = v2) <=> ((KMatrix.Vector."_.[_]" v1 0 = KMatrix.Vector."_.[_]" v2 0) /\ (KMatrix.Vector."_.[_]" v1 1 = KMatrix.Vector."_.[_]" v2 1) /\ (KMatrix.Vector."_.[_]" v1 2 = KMatrix.Vector."_.[_]" v2 2) ).
smt(KMatrix.Vector.eq_vectorP). qed.

equiv invnttequiv :
Jkem_avx2.M(Jkem_avx2.Syscall).__polyvec_invntt ~Jkem.M(Jkem.Syscall).__polyvec_invntt : 
   lift_array768 arg{1} = nttunpackv (lift_array768 arg{2}) /\ 
   signed_bound768_cxq arg{1} 0 768 4 /\ 
   signed_bound768_cxq arg{2} 0 768 4 ==>
   lift_array768 res{1} = lift_array768 res{2} /\ 
   signed_bound768_cxq res{1} 0 768 1 /\ 
   signed_bound768_cxq res{2} 0 768 1.
proc *.
ecall {2} (polyvec_invntt_corr r{2}) => /=.
conseq />;1: smt().
ecall {1} (polyvec_invntt_avx2_corr r{2}) => /=. 
auto => /> &1 &2 -> Hm1 Hm2. rewrite unpackvK //= => r Hr1 Hr2 s Hs1 Hs2.
rewrite /lift_array768 /map tP => />j Hj1 Hj2. rewrite !initiE //=.
move :Hr1. rewrite !mapvE /lift_polyvec eq_vectorP3. rewrite !KMatrix.Vector.offunvE //=. rewrite /lift_array256 /subarray256 /map !tP -!andaE. apply andaW. move => Hr10. apply andaW. move => Hr11 Hr12. 
move :Hs1. rewrite /scale_vector /lift_polyvec eq_vectorP3. rewrite !KMatrix.Vector.offunvE //=. rewrite /scale /lift_array256 /subarray256 /map !tP -!andaE. apply andaW. move => Hs10. apply andaW. move => Hs11 Hs12.
case (0 <= j < 256) => Hj_0.
 + move :(Hr10 j). rewrite Hj_0 !initiE //= !initiE //= => <-.
 + move :(Hs10 j). rewrite Hj_0 !initiE //= !initiE //= => <-.
 + rewrite /R Zq.ComRing.mulrC => />. 
case (256 <= j < 512). move => Hj_1.
 + have Hj_2: 0 <= j - 256 && j - 256 < 256. smt().
 + move :(Hr11 (j-256)). rewrite Hj_2 !initiE //= !initiE //= => <-.
 + move :(Hs11 (j-256)). rewrite Hj_2 !initiE //= !initiE //= => <-.
 + rewrite /R Zq.ComRing.mulrC => />. 
move => Hj_2.
 + have Hj_3: 0 <= j - 512 && j - 512 < 256. smt().
 + move :(Hr12 (j-512)). rewrite Hj_3 !initiE //= !initiE //= => <-.
 + move :(Hs12 (j-512)). rewrite Hj_3 !initiE //= !initiE //= => <-.
 + rewrite /R Zq.ComRing.mulrC => />. 
qed.
