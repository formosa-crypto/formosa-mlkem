require import AllCore List IntDiv CoreMap IntDiv Real Number Ring StdOrder.

from Jasmin require import JModel JMemory.
from JazzEC require import Array32 Array320 Array256 Array128 Array384 Array1024.

require import IntDiv_extra W16extra.

from CryptoSpecs require import GFq Rq Serialization MLKEM768 Correctness768.
import Serialization768.

require import Fq NTT_Fq NTTAlgebra MLKEMFCLib.

hint simplify range_ltn, range_geq.

theory MLKEM_Poly.

import Fq Zq IntOrder.

import SignedReductions.


from JazzEC require import Jkem768.

(* jzetas values are correct *)


lemma zetas_invE : array_mont_inv NTT_Fq.zetas_inv = 
     Array128.map (fun x => incoeff (W16.to_sint x)) jzetas_inv.
have := NTT_Fq.zetas_inv_vals.
rewrite /array128_mont_inv  /array_mont_inv /= => ->.
rewrite !of_sintK /smod /= /of_list.
rewrite tP /= => i ib.
by rewrite !Array128.initiE /= /#.
qed.

lemma zetas_montE : array_mont NTT_Fq.zetas = 
     Array128.map (fun x => incoeff (W16.to_sint x)) jzetas.
have := NTT_Fq.zetas_vals.
rewrite /array128_mont  /array_mont /= => ->.
rewrite !of_sintK /smod /= /of_list.
rewrite tP /= => i ib.
by rewrite !Array128.initiE /= /#.
qed.

lemma getsignNeg x : x \slt W16.zero => x `|>>` W8.of_int 15 = W16.onew.
proof.
rewrite /(`|>>`) sarE sltE !to_sintE /smod => /> hh.
apply W16.ext_eq => k kb; rewrite initiE => />.
have -> : min 15 (k+15) = 15; first by smt().
by rewrite get_to_uint => />;smt(W16.to_uint_cmp pow2_16).
qed.

lemma getsignPos x : (W16.zero \sle x => x `|>>` (of_int 15)%W8 = W16.zero).
proof.
rewrite /(`|>>`) sarE sleE !to_sintE /smod => /> hh.
apply W16.ext_eq => k kb; rewrite initiE => />.
rewrite (_: min 15 (k+15) = 15); first by smt().
by rewrite get_to_uint => />;smt(W16.to_uint_cmp pow2_16).
qed.

lemma poly_csubq_corr_h ap :
      hoare[Jkem768.M._poly_csubq :
           ap = lift_array256 rp /\ pos_bound256_cxq rp 0 256 2 
           ==>
           ap = lift_array256 res /\ pos_bound256_cxq res 0 256 1 ].
proof.
move => *;proc.

while (ap = lift_array256 rp /\ 
       pos_bound256_cxq rp 0 256 2 /\ 
       pos_bound256_cxq rp 0 i 1 /\ 
       0 <=  i<=256); last by auto => /> &hr;
          rewrite /pos_bound256_cxq /lift_array256 /(\ult) /= /#.

auto => /> &hr;rewrite /pos_bound256_cxq /lift_array256 qE /=.
move => rbpre rbdone ibl ibh entry; rewrite tP !mapE.
do split. (* 5 goals *)
+ move => ii iib; rewrite !initiE //=.
  case(ii <> i{hr}); 
     1:  by move => prior; rewrite !set_neqiE; smt(). 
  move => current; rewrite set_eqiE /=; 1,2:smt(). 
  case(rp{hr}.[i{hr}] - W16.of_int 3329 \slt W16.zero).
  + move => H; rewrite (getsignNeg _ H) //=.
    have -> : rp{hr}.[i{hr}] - W16.of_int 3329 + W16.of_int 3329 = 
              rp{hr}.[i{hr}] by ring.
    by smt().
  move =>  H; rewrite (getsignPos _ _) /=; first by smt().
  by move : H;rewrite sltE to_sintD_small /to_sint /smod W16.to_uintN=> />; 
     smt(to_uint_cmp pow2_16).

+ move => ii iib /=.
  case(ii <> i{hr}); 
     1:  by move => prior; rewrite !set_neqiE; smt(). 
  move => current; rewrite set_eqiE /=; 1,2:smt(). 
  case(rp{hr}.[i{hr}] - W16.of_int 3329 \slt W16.zero).
  + move => H; rewrite (getsignNeg _ H) //=.
    have -> : rp{hr}.[i{hr}] - W16.of_int 3329 + W16.of_int 3329 = 
            rp{hr}.[i{hr}] by ring.
    by smt().
  move =>  H; rewrite (getsignPos _ _) /=; first by smt().
  by move : H;rewrite sltE to_sintD_small /to_sint /smod W16.to_uintN=> />; 
     smt(to_uint_cmp pow2_16).

+ move => ii iib;case(ii <> i{hr}); 
     1:  by move => prior; rewrite !set_neqiE; smt(). 
  move => current; rewrite set_eqiE /=; 1,2:smt(). 
  case(rp{hr}.[i{hr}] - W16.of_int 3329 \slt W16.zero).
  + move => H; rewrite (getsignNeg _ H) //=.
    have -> : rp{hr}.[i{hr}] - W16.of_int 3329 + W16.of_int 3329 = 
              rp{hr}.[i{hr}] by ring.
    move : H; rewrite sltE to_sintD_small /=; 
       1: by move :rbpre; rewrite /to_sint /smod /= to_uintN /= /#. 
    rewrite to_sintN /=; 1: by rewrite /to_sint /smod /=.
    by move :rbpre; rewrite /to_sint /smod /= /#.
  move =>  H; rewrite (getsignPos _ _) /=; first by smt().
  by move : H;rewrite sltE to_sintD_small /to_sint /smod W16.to_uintN=> />; 
     smt(to_uint_cmp pow2_16).

+ by smt().

by smt().
qed.

lemma poly_csubq_ll : islossless Jkem768.M._poly_csubq.
proof.
proc; while (0 <= i <= 256) (256 - i); auto => /> /#.
qed.

lemma poly_csubq_corr ap :
      phoare[Jkem768.M._poly_csubq :
           ap = lift_array256 rp /\ pos_bound256_cxq rp 0 256 2 
           ==>
           ap = lift_array256 res /\ pos_bound256_cxq res 0 256 1 ] = 1%r
  by conseq poly_csubq_ll (poly_csubq_corr_h ap). 

lemma compress_rng a d :
   1 <= d < 12 =>
   0 <= compress d a < 2^d.
move => drng; rewrite /compress.
by apply modz_cmp; apply gt0_pow2.
qed.

lemma poly_tomsg_ll : islossless Jkem768.M._i_poly_tomsg.
proc.
while (0 <= i <= 32) (32-i); last by wp; call (poly_csubq_ll); auto =>  /> /#.
move => *; wp; while (0 <= j <= 8) (8-j); last by auto =>  /> /#.
by move => *; auto => /> /#.
qed.


(********** BEGIN BDEP PROOF OF TOMSG **************)

require import Bindings BitEncoding.
import BitChunking.

op compress1_circuit(a : W16.t) : bool = 
   if (a \ult W16.of_int 3329) then  
   (srl_32 ((sll_32 (zeroextu32 a) (W32.of_int 1) + W32.of_int 1665) * W32.of_int 80635) (W32.of_int 28)).[0]
   else 
   (srl_32 ((sll_32 (zeroextu32 (W16_sub a (W16.of_int 3329))) (W32.of_int 1) + W32.of_int 1665) * W32.of_int 80635) (W32.of_int 28)).[0].  

op encode_compress_poly1(p : W16.t Array256.t):
  bool Array256.t = 
   map compress1_circuit p.

op pcond_reduced (w: W16.t) =   w \ult W16.of_int (3*3329). 

module ToMsgInit = {
    proc toMsgInit(rp: W8.t Array32.t, a: W16.t Array256.t) : W8.t Array32.t *  W16.t Array256.t = {
       rp <- init_32_8 (fun i => W8.zero);
       (rp,a) <@ Jkem768.M._i_poly_tomsg(rp,a);
       return (rp,a);
    }
}.

lemma tomsginit_ll : islossless ToMsgInit.toMsgInit.
proc;inline 2.
wp;while (0 <= i <= 32) (32-i); last by wp; call (poly_csubq_ll); auto =>  /> /#.
move => *; wp; while (0 <= j <= 8) (8-j); last by auto =>  /> /#.
by move => *; auto => /> /#.
qed.

lemma pre_lane_commute_aligned ['a] 
    (l : 'a list) 
    (tobits : 'a -> bool list)
    (ofbits : bool list -> 'a)
    (P : 'a -> bool) 
    (n : int) :
  0 < n =>
  (forall x, size (tobits x) = n) =>
  (forall x, ofbits (tobits x) = x) =>
  all P (map ofbits (chunk n (flatten (map tobits l)))) =
  all P l.
move => H H0 H1.
congr.
rewrite flattenK //; 1:by move => b;rewrite mapP;smt(). 
rewrite -map_comp /(\o).
have -> : (fun (x : 'a) => ofbits (tobits x))  = idfun by apply fun_ext;smt().
by apply map_id.  
qed.

lemma map_chunk_flatten_id ['a] 
    (li : 'a list) 
    (tobitsi : 'a -> bool list)
    (ofbitsi : bool list -> 'a)
    (ni : int) :
  0 < ni =>  
  (forall x, size (tobitsi x) = ni) =>
  (forall x, ofbitsi (tobitsi x) = x) =>
    (map ofbitsi (chunk ni (flatten (map tobitsi li)))) = li.
proof.
move => *.
apply (eq_from_nth witness).
  + rewrite size_map size_chunk 1:/# (EclibExtra.size_flatten' ni);1: by smt(mapP).
    rewrite size_map /#.
  move => i; rewrite size_map size_chunk 1:/# (EclibExtra.size_flatten' ni);1: by smt(mapP).
  rewrite size_map => Hs.
  rewrite (nth_map []);1: by rewrite size_chunk 1:/# (EclibExtra.size_flatten' ni);by smt(size_map mapP).
  rewrite JWordList.nth_chunk 1,2:/#; 1: by rewrite (EclibExtra.size_flatten' ni);by smt(size_map mapP).
   have -> : (take ni (drop (ni * i) (flatten (map tobitsi li))))  = tobitsi (nth witness li i).
   + rewrite drop_flatten_ctt;1:smt(mapP).
     have /= -> := take_flatten_ctt ni 1 (drop i (map tobitsi li));1:smt(mem_drop mapP).
     rewrite (drop_take1_nth witness) /=;1:smt(size_map).
     rewrite flatten1 /= (nth_map witness) /#.
   by smt().
qed.

lemma post_lane_commute_aligned ['a 'b 'c]
    (li : 'a list) 
    (loc : 'b list) 
    (tobitsi : 'a -> bool list)
    (ofbitsi : bool list -> 'a)
    (tobitsoc : 'b -> bool list)
    (ofbitsoc : bool list -> 'b)
    (tobitso : 'c -> bool list)
    (ofbitso : bool list -> 'c)
    (f : 'a -> 'c)
    (ni no noc  : int) :
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
map f (map ofbitsi (chunk ni (flatten (map tobitsi li)))) =
map ofbitso (chunk no (flatten (map tobitsoc loc))) => 
   flatten (map tobitsoc loc) =
   flatten (map tobitso (map f li)).
move => 12?.
rewrite map_chunk_flatten_id 1..3:/#.
move => ->.
rewrite -map_comp /(\o) /=. 
have [H _]:= (eq_in_map (fun (x : bool list) => tobitso (ofbitso x)) idfun (chunk no (flatten (map tobitsoc loc)))).
rewrite H /=;1:smt(in_chunk_size).
rewrite map_id.
rewrite chunkK 1:/#;1: rewrite (EclibExtra.size_flatten' noc);  smt(size_map mapP).
qed.

lemma size_BitsToBytes l :
   8 %| size l =>
   size (BitsToBytes l) = size l %/8 by
rewrite /BitsToBytes size_map size_chunk /#. 

lemma output_pack_32_8(l : bool list) :
 size l = 256 =>
 flatten
  (map W8.w2bits
     (to_list (Array32.of_list W8.zero (BitsToBytes l)))) = l.
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

lemma flatten_map_eq ['a] (l1 l2 : 'a list) (f : 'a ->  bool list) (n : int):
     0 < n =>
     injective f =>
     (forall x, size (f x) = n) =>
     flatten (map f l1) = flatten (map f l2) => l1 = l2.
move => *.
apply (in_inj_map f predT);1..3:by rewrite ?allP /=;smt().
apply (flatten_ctt_inj n); 1:smt();1,2:
 by move => b;rewrite mapP;smt(). 
by smt().
qed.

lemma poly_tomsg_corr_h _aw : 
    hoare [Jkem768.M._i_poly_tomsg :
             pos_bound256_cxq a 0 256 2 /\ 
              a = _aw
              ==>
             res.`1 = encode1 (compress_poly 1 (lift_array256 _aw))  ].
proof.
bypr => &m H.
rewrite Pr[mu_not].
have -> : Pr[M._i_poly_tomsg(rp{m}, a{m}) @ &m : true] = 1%r by byphoare => //;apply poly_tomsg_ll.
have : Pr[M._i_poly_tomsg(rp{m}, a{m}) @ &m : res.`1 = encode1 (compress_poly 1 (lift_array256 _aw))] = 1%r; last by smt().
have <- : Pr[ ToMsgInit.toMsgInit(rp{m}, a{m}) @ &m : res.`1 = encode1 (compress_poly 1 (lift_array256 _aw))] = 1%r; last first.
+ byequiv (: ={a} ==> ={res}) => //.
  proc;inline *.
  admit.

byphoare (: pos_bound256_cxq a 0 256 2 /\  a = _aw ==> 
    res.`1 = encode1 (compress_poly 1 (lift_array256 _aw))) => //.
conseq tomsginit_ll (: _  ==> _);1:smt(). 
proc; inline *.
proc change ^while.2: (W16_sub t0 (W16.of_int 3329)); 1: by auto.
proc change ^while.4 : (sra_16 b (W16.of_int 15)); 1: by auto.
proc change ^while{2}.^while.3 : (sll_32 d (W32.of_int 1)); 1: by auto.
proc change ^while{2}.^while.6 : (srl_32 d (W32.of_int 28)); 1: by auto.
proc change ^while{2}.^while.8 : (if 0 <= j < 8 then sll_32 d (W32.of_int j) else d `<<` W8.of_int j). 
+ move => &hr; case (0 <= j{hr} < 8) => ?;last by auto. 
  rewrite /sll_32 /= /(`<<`) /=.
  rewrite modz_small 1:/# to_uint_eq !to_uint_shl 1:/# /= W32.of_uintK /=;1: smt().
  congr;congr;congr;congr;smt(modz_small).
unroll for 6.
do 33!(unroll for ^while).
cfold ^i0<-.
do 32!(cfold ^j<-).
wp -4.
bdep 16 1 [_aw] [a] [rp0] compress1_circuit pcond_reduced. 

(* BDEP pre conseq *)
+ move => &hr />; rewrite flatten1 /= pre_lane_commute_aligned 1:/# //=.
  rewrite allP /pos_bound256_cxq /= => Hb. 
  rewrite /pcond_reduced /= /tolist /= => x.
  rewrite  mkseqP => He;elim He => /= i [ib?]; rewrite ultE /=.
  have := Hb i; rewrite ib /= qE /=.
  rewrite /to_sint /smod /=.
  smt(W16.to_uint_cmp).

(* BDEP post conseq *)

(* We start with some boilerplate *)
move => &hr [#]/= H0 <- rr; rewrite /= !flatten1.
move => H1; have H2 := post_lane_commute_aligned (to_list a{hr}) (to_list rr) W16.w2bits W16.bits2w W8.w2bits W8.bits2w bool2bits bits2bool  compress1_circuit 16 1 8 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
smt(Array32.size_to_list Array256.size_to_list W16.bits2wK BVA_Top_Pervasive_bool.oflistP).

apply (inj_eq Array32.to_list Array32.to_list_inj).
apply (flatten_map_eq _ _ W8.w2bits 8 _ W8.w2bits_inj W8.size_w2bits);1:smt().
have -> := post_lane_commute_aligned (to_list a{hr}) (to_list rr) W16.w2bits W16.bits2w W8.w2bits W8.bits2w bool2bits bits2bool  compress1_circuit 16 1 8 _ _ _ _ _ _ _ _ _ _ _ _ H1;1..12:
    smt(Array32.size_to_list Array256.size_to_list W16.bits2wK BVA_Top_Pervasive_bool.oflistP).

rewrite output_pack_32_8. 
+ rewrite (EclibExtra.size_flatten' 1);1: smt(mapP BS2Int.size_int2bs).
  by rewrite size_map size_to_list /=.

congr.
rewrite /compress1_circuit /compress_poly -map_comp -map_comp -map_comp /(\o) /=.  
apply (eq_from_nth witness); 1: by rewrite !size_map //.
rewrite size_map size_iota /max /= => i ib; rewrite !(nth_map witness) //=;1,2:smt(size_iota).
rewrite nth_iota 1:/# -(BVA_Top_Pervasive_bool.oflistP (BS2Int.int2bs 1 (map (compress 1) (lift_array256 a{hr})).[i]));1: by rewrite BS2Int.size_int2bs /#.
congr; rewrite -BVA_Top_Pervasive_bool.ofintP /lift_array256;rewrite !mapiE;1,2:smt().

rewrite /i2b !get_to_uint /=.

(* This is now the equivalence betwen specs. It's made slightly more verbose
   because the impl circuit is only proved correct wrt compress for values
   in the q range. *)
rewrite ultE /=. 
case (to_uint a{hr}.[i] < 3329) => /= *.
+ rewrite -compress_impl_small //=;1: by rewrite /bpos16 qE /= /to_sint /smod /=;smt(W16.to_uint_cmp).  
  congr;congr;rewrite modz_mod;congr;congr.
  by rewrite /srl_32 /sll_32 /(`<<`) /(`>>`).

have := H0;rewrite /pos_bound256_cxq qE /= => H00.

have ? : 0 <= to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) < 3329.
+  rewrite /bpos16 to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have ? : to_sint ((W16_sub a{hr}.[i] (W16.of_int 3329))) = to_sint a{hr}.[i] -  3329.
+  rewrite to_sintB_small /=;1: by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=;smt(size_map size_iota). 
   by rewrite  /(to_sint (W16.of_int 3329))  W16.of_uintK /= /smod /=; smt(size_map size_iota W16.to_uint_cmp).

have -> : (incoeff (to_sint a{hr}.[i])) = (incoeff (to_sint (W16_sub a{hr}.[i] (W16.of_int 3329)))) by  rewrite -eq_incoeff;  smt().  

rewrite -compress_impl_small //=;1:by smt().
by rewrite modz_mod /srl_32 /sll_32 /(`<<`) /(`>>`).
qed.

(********** END BDEP PROOF OF TOMSG **************)



lemma poly_tomsg_corr _aw : 
    phoare [Jkem768.M._i_poly_tomsg :
             pos_bound256_cxq a 0 256 2 /\ 
             a = _aw 
              ==>
             res.`1 = encode1 (compress_poly 1 (lift_array256 _aw))  ] =1%r.
by conseq poly_tomsg_ll (poly_tomsg_corr_h _aw).

lemma poly_frommsg_corr_h (_m : W8.t Array32.t): 
    hoare [Jkem768.M._i_poly_frommsg :
             ap =  _m 
              ==>
             lift_array256 res = decompress_poly 1 (decode1 _m) /\
             pos_bound256_cxq res 0 256 1 ].
admitted.

lemma poly_frommsg_corr (_m : W8.t Array32.t): 
    phoare [Jkem768.M._i_poly_frommsg :
             ap =  _m 
              ==>
             lift_array256 res = decompress_poly 1 (decode1 _m) /\
             pos_bound256_cxq res 0 256 1] = 1%r.
admitted.

lemma poly_frommsg_ll : islossless Jkem768.M._i_poly_frommsg
 by proc; while (0 <= i <= 32) (32-i);  by  auto =>  /> /#.

lemma poly_frommont_corr_h (_a : int Array256.t) : 
    hoare[Jkem768.M._poly_frommont :
             forall k, 0<=k<256 => to_sint rp.[k] = _a.[k] ==>
             forall k, 0<=k<256 => to_sint res.[k] = SREDC (_a.[k] * ((R^2) %% q))].
proc.
while (0 <= i <= 256 /\ dmont = W16.of_int 1353 /\
       (forall k, 0 <= k <  i =>
          W16.to_sint rp.[k] =  SREDC (_a.[k] * ((R^2) %% q))) /\
       (forall k, i <= k < 256 =>
          W16.to_sint rp.[k] = _a.[k])); last by 
  auto => /> /#. 

sp;wp;conseq />;1: by smt(). 
ecall (fqmul_corr_h (to_sint r) (to_sint dmont)).
auto => /> &hr ??.
rewrite qE /R /= => ??? r rval. 
do split; 1, 2, 4: by smt(Array256.set_neqiE). 
move => k kb; case (k = i{hr}); last by smt(Array256.set_neqiE).
move => -> ?; rewrite Array256.set_eqiE // rval.
by congr;rewrite W16.of_sintK /= /smod /= /#.
qed.

lemma poly_frommont_ll : islossless Jkem768.M._poly_frommont.
proc. 
while (0 <= i <= 256) (256 - i).
+ move => *; wp; call fqmul_ll; auto => /> /#.
by auto => /> /#.
qed.

lemma poly_frommont_corr (_a : int Array256.t) : 
    phoare[Jkem768.M._poly_frommont :
             forall k, 0<=k<256 => to_sint rp.[k] = _a.[k] ==>
             forall k, 0<=k<256 => to_sint res.[k] = SREDC (_a.[k] * ((R^2) %% q))]=1%r
  by conseq poly_frommont_ll (poly_frommont_corr_h _a). 

lemma poly_sub_corr_h _a _b ab bb :
    0 <= ab <= 4 => 0 <= bb <= 4 =>  
      hoare[Jkem768.M._poly_sub :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              incoeff (to_sint res.[k]) = _a.[k] - _b.[k]]. 
proof.
move => abbnd bbbnd;proc. 
while (0 <=  i <= 256 /\
      _a = lift_array256 ap /\
      _b = lift_array256 bp /\
      signed_bound_cxq ap 0 256 ab /\
      signed_bound_cxq bp 0 256 bb /\
      signed_bound_cxq rp 0 i (ab + bb) /\ 
      forall k, 0 <= k <  i =>
              incoeff (to_sint rp.[k]) = _a.[k] - _b.[k]); 
   last by auto => /> /#.
auto => /> &hr ??.
rewrite /signed_bound_cxq qE /lift_array256 /=.
move => abnd bbnd pastb pastv inloop; split; 1: by smt().
split.
+ move => k kb; case (k = i{hr}); last by smt(Array256.set_neqiE).
  by move => ->; rewrite !Array256.set_eqiE //= to_sintB_small /= /#.

move => k kb; case (k = i{hr}); last by smt(Array256.set_neqiE).
move => ->; rewrite !Array256.set_eqiE //= to_sintB_small /=; 1: by smt().
by rewrite !mapiE //= incoeffD incoeffN.
qed.

lemma poly_sub_ll: islossless Jkem768.M._poly_sub.
proc; while (0 <= i <= 256) (256 - i).
+  by move => *; auto => /> /#. 
by move => *; auto => /> /#.
qed.

lemma poly_sub_corr _a _b ab bb :
    0 <= ab <= 4 => 0 <= bb <= 4 =>  
      phoare[Jkem768.M._poly_sub :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              incoeff (to_sint res.[k]) = _a.[k] - _b.[k]] = 1%r 
   by move => *;conseq poly_sub_ll (poly_sub_corr_h _a _b ab bb _ _).

lemma poly_sub_corr_alg ab bb :
  0 <= ab <= 4 =>
  0 <= bb <= 4 =>
  forall _a _b, 
  phoare [Jkem768.M._poly_sub :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           lift_array256 res = _a &+ (&-) _b] = 1%r.
move => abbnd bbbnd _a _b.
conseq (poly_sub_corr _a _b ab bb abbnd bbbnd). 
move => ? [#] ??r [#] ? sum. 
rewrite /signed_bound_cxq /lift_array256 /= tP /= !mapE /=. 
split.
+ move => [#] subb subv; split; 1: by smt().
  move => i ib; move : (subv i ib); rewrite !initiE //=.
  by rewrite  /(&+) /(&-) /= map2E //= initiE //=  mapiE //=. 
+ move => [#] subb subv; split; 1: by smt().
  move => i ib; move : (subv i ib); rewrite !initiE //=.
  by rewrite  /(&+) /(&-) /= map2E //= initiE //=  mapiE //=. 
qed.

lemma poly_add_corr_h _a _b ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 =>  
      hoare[Jkem768.M._poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k]]. 
proof.
move => abbnd bbbnd;proc. 
while (0 <= i <= 256 /\
        (forall k, i <= k < 256 => _a.[k] = incoeff (to_sint rp.[k])) /\
        _b = lift_array256 bp /\
        signed_bound_cxq rp i 256 ab /\
        signed_bound_cxq bp 0 256 bb /\
        signed_bound_cxq rp 0 i (ab + bb) /\ 
        forall k, 0 <= k <  i =>
           incoeff (to_sint rp.[k]) = _a.[k] + _b.[k]); last first. 
+ auto => /= &hr; rewrite /lift_array256 !tP => [#] av bv ??; split. 
  + do split => //; 2,3: by smt().
    by  move => k kb; move : (av k kb); rewrite !mapiE //. 
  by smt().

auto => /> &hr ??.
rewrite /signed_bound_cxq qE.
move => aval abnd bbnd pastb pastv inloop; split; 1: by smt().
do split; first last.
+ by smt(Array256.set_neqiE).
+ move => k kb; case (k = i{hr}); last by smt(Array256.set_neqiE).
  by move => ->; rewrite !Array256.set_eqiE //= to_sintD_small /= /#.
+ move => k kb; case (k = i{hr}); last by smt(Array256.set_neqiE).
  move => ->; rewrite !Array256.set_eqiE //= to_sintD_small /=; 1: by smt().
  by rewrite !mapiE //= incoeffD /#.
by smt(Array256.set_neqiE).
qed.

lemma poly_add_ll : islossless Jkem768.M._poly_add2.
proc; while (0<=  i <= 256) (256 - i);
by move => *; auto => /> /#. 
qed.

lemma poly_add_corr _a _b ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 =>  
      phoare[Jkem768.M._poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r
   by move => abb bbb; conseq poly_add_ll (poly_add_corr_h _a _b ab bb abb bbb). 
 

lemma poly_add_corr_impl_h ab bb :
  0 <= ab <= 6 =>
  0 <= bb <= 3 =>
  forall _a _b,
      hoare[Jkem768.M._poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k]].
move => abb bbb _a _b.
apply (poly_add_corr_h _a _b ab bb abb bbb).
qed.

lemma poly_add_corr_alg ab bb :
  0 <= ab <= 6 =>
  0 <= bb <= 3 =>
  forall _a _b, 
  phoare [Jkem768.M._poly_add2 :
    _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           lift_array256 res = _a &+ _b] = 1%r.
move => abbnd bbbnd _a _b.
conseq (poly_add_corr _a _b ab bb abbnd bbbnd). 
move => ? [#] ??r [#] ? sum. 
rewrite /signed_bound_cxq /lift_array256 /= tP /= !mapE /=. 
split.
+ move => [#] sumb sumv; split; 1: by smt().
  move => i ib; move : (sumv i ib); rewrite !initiE //=.
  by rewrite  /(&+)/= map2E //= initiE //=. 
+ move => [#] sumb sumv; split; 1: by smt().
  move => i ib; move : (sumv i ib); rewrite !initiE //=.
  by rewrite  /(&+)/= map2E //= initiE //=. 
qed.

lemma poly_add_correct_impl ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 =>  
    forall _a _b,
      phoare[Jkem768.M._poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              incoeff (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r
   by move => abb bbb _a _b; conseq poly_add_ll (poly_add_corr_impl_h ab bb abb bbb _a _b ). (* move to poly *)


lemma poly_reduce_corr_h (_a : coeff Array256.t):
      hoare[Jkem768.M.__poly_reduce :
          _a = lift_array256 rp ==> 
          _a = lift_array256 res /\
          forall k, 0 <= k < 256 => bpos16  res.[k] (2*q)].
proof.
proc.
while (0 <= j <= 256 /\
     (forall k, 0 <= k < 256 => _a.[k] = incoeff (to_sint rp.[k])) /\
     forall k, 0 <= k < j => bpos16  rp.[k] (2*q)
); last first. 
+ auto => /= &hr; rewrite /lift_array256 !tP => [#] av; split. 
  + split => //; 2: by smt().
    by  move => k kb; move : (av k kb); rewrite !mapiE //. 
  move => i rp' exit [#] ?? ??.
  split; last by smt(). 
  by rewrite tP => k kb; move : (av k kb); rewrite !mapiE //= /#.

sp;wp;conseq />;1: by smt(). 
ecall (barrett_reduce_corr_h (to_sint t)).
auto => /> &hr ??.
rewrite qE /R /= => av ab inl r rval. 
have bred := (BREDCp_corr (to_sint rp{hr}.[j{hr}]) 26 _ _ _ _ _ _); 
     1..4: smt(qE pow2_16).
+ rewrite /R /=; move: (W16.to_sint_cmp rp{hr}.[j{hr}]); smt().
+ by rewrite /R /=; move : W16.to_sint_cmp => /= /#.
do split; 1, 2: by smt(). 
+ move => k kbl kbh; case (k = j{hr}); last by smt(Array256.set_neqiE).
  move => ->>; rewrite Array256.set_eqiE // rval.
  move : (av (j{hr}) _) => // ->.
  by apply eq_incoeff => /#. 
  
move => k kbl kbh.
case (k = j{hr}); last by smt(Array256.set_neqiE).
move => ->; rewrite !Array256.set_eqiE //=.
by smt().
qed.


lemma poly_reduce_ll: islossless Jkem768.M.__poly_reduce.
proof.
proc;while (0 <= j <= 256) (256 - j);
 by move => *; inline *; auto => /> /#. 
qed.

lemma poly_reduce_corr (_a : coeff Array256.t):
      phoare[Jkem768.M.__poly_reduce :
          _a = lift_array256 rp ==> 
          _a = lift_array256 res /\
          forall k, 0 <= k < 256 => bpos16  res.[k] (2*q)] = 1%r.
proof. by conseq poly_reduce_ll (poly_reduce_corr_h _a). qed.

lemma poly_tobytes_corr _a : 
    hoare [Jkem768.M._poly_tobytes :
             pos_bound256_cxq a 0 256 2 
         /\  lift_array256 a = _a
              ==>
             res.`1 = encode12 (map asint _a)].
admitted.

lemma poly_frombytes_corr (_a : W8.t Array384.t): 
    hoare [Jkem768.M._poly_frombytes :
             arg.`2 = _a
              ==>
             lift_array256 res = map incoeff (decode12 _a) /\
             pos_bound256_cxq res 0 256 2 ].
admitted.

lemma i_poly_compress_corr_h _a  : 
    hoare [Jkem768.M._i_poly_compress  :
             pos_bound256_cxq a 0 256 2 /\
             lift_array256 a = _a 
              ==>
             res.`1 = encode4 (compress_poly 4 _a) 
             ].
admitted.

lemma i_poly_compress_ll : islossless Jkem768.M._i_poly_compress.
proc.
while (0 <=  i <= 128) (128-i); last 
   by wp; call (poly_csubq_ll); auto =>  /> /#. 
by auto => /#.
qed.

lemma i_poly_compress_corr _a  : 
    phoare [Jkem768.M._i_poly_compress  :
             pos_bound256_cxq a 0 256 2 /\
             lift_array256 a = _a 
              ==>
             res.`1 = encode4 (compress_poly 4 _a) 
             ] = 1%r.
admitted.

lemma poly_decompress_corr_h (_a : W8.t Array128.t): 
    hoare [Jkem768.M._i_poly_decompress  :
              arg.`2 = _a
              ==>
             lift_array256 res = decompress_poly 4 (decode4 _a) /\
             pos_bound256_cxq res 0 256 1 ].
admitted.

lemma poly_decompress_corr (_a : W8.t Array128.t): 
    phoare [Jkem768.M._i_poly_decompress  :
              arg.`2 = _a
              ==>
             lift_array256 res = decompress_poly 4 (decode4 _a) /\
             pos_bound256_cxq res 0 256 1] = 1%r.
admitted.

(*******DIRECT NTT *******)

lemma zeta_bound :  minimum_residues jzetas.
 proof.
rewrite /minimum_residues qE.
apply/(Array128.allP jzetas (fun x => bpos16 x 3329)) => /=.
have -> : 
  (fun (x : W16.t) => 0 <= to_sint x < 3329) = 
  (fun (x : W16.t) => 0 <= (if 32768 <= to_uint x 
                            then to_uint x - 65536 
                            else to_uint x) < 3329) 
    by apply/fun_ext => x *; rewrite to_sintE /smod => />.
by rewrite /all -iotaredE; cbv delta.
qed. 

lemma rrinvcoeff : incoeff R * incoeff 169 = Zq.one by rewrite -incoeffM -eq_incoeff; apply RRinv.

lemma mul_congr a b : coeffcgr (asint (incoeff b) * asint (incoeff a)) (b * a) by rewrite !incoeffK modzMm.

import NTT_Fq.

equiv ntt_correct_aux :
     NTT.ntt ~Jkem768.M._poly_ntt : 
        r{1} = lift_array256 rp{2} /\  
        zetas{1} = zetas /\
        signed_bound_cxq rp{2} 0 256 2
          ==> 
        res{1} = lift_array256 res{2} /\
        forall k, 0<=k<256 => bpos16 res{2}.[k] (2*q).
proc.
(* Simplify post usiung barret reduction *)
seq 3 5 :  (r{1} = lift_array256 rp{2}); last first.
+ ecall{2} (poly_reduce_corr (lift_array256 rp{2})).
  skip; move => &1 &2 [#] ?? [#] ? bres.
  split; first by smt ().
  by apply bres.

(***********************************)

seq 0 1: #pre; first by auto => />. 
sp.

(* Outer loop *)
while (
   zetasp{2} = jzetas /\
   r{1} = lift_array256 rp{2} /\
   zetas{1} = zetas /\
   len{1} = len{2} /\
   zetasctr{1} = zetasctr{2}/\
   0 <= zetasctr{1} <= 127 /\
   (zetasctr{1}+1)*len{1} = 128 /\
   (exists l, 0 <= l <= 7 /\ len{1} = 2^l /\
      signed_bound_cxq rp{2} 0 256 (9 - l))); 
      last by auto => />; move => *; exists 7; auto.

wp; exists* zetasctr{1}; elim* => zetasctr1 l.

(* Middle loop *)
while (#{/~zetasctr1=zetasctr{1}}
        {~(zetasctr{1}+1)*len{1} = 128}
        {~(0 <= l <= 7)}
        {~(len{1} = 2^l)}
        {~(signed_bound_cxq rp{2} 0 256 (9 - l))}pre /\ 
       (zetasctr1+1)*len{1}=128 /\
       start{1} =  start{2} /\
       0 <= start{1} <= 256 /\
       start{1} = 2*len{1}*(zetasctr{1} - zetasctr1) /\
       (* Nasty carry inv *)
       (exists l, 0 <= l <= 7 /\ len{1} = 2^l /\
          signed_bound_cxq  rp{2} 0 256 (9 - (l - 1)) /\
          signed_bound_cxq  rp{2} start{1} 256 (9 - l))
       ); last first.
+ auto => />; move => &1; rewrite /signed_bound_cxq => 1? hh 2? rep blow exit;split;
     1: by exists l; do split; smt().
  move => _rp _zetasctr 6? l0 *. 
  split. 
  + by smt().
  exists (l0-1); do split.
  + move : exit; rewrite (_: 2 = 2^1) //;smt(Ring.IntID.expr0 StdOrder.IntOrder.ler_weexpn2l). 
  + smt().
  + rewrite  Montgomery.pow_div1;1,2: smt(Ring.IntID.expr0 StdOrder.IntOrder.ler_weexpn2l).  
    by smt(StdOrder.IntOrder.ieexprIn).
  by smt().  

(* Inner loop *)
wp;while (#{/~start{1} = 2*len{1}*(zetasctr{1} - zetasctr1)}
        {~exists (l0 : int),
     (0 <= l0 && l0 <= 7) /\
     len{1} = 2 ^ l0 /\ signed_bound_cxq rp{2} 0 256 (9 - (l0 - 1)) /\ 
        signed_bound_cxq rp{2} start{1} 256 (9 - l0)} pre /\
       zeta_{1} = incoeff (to_sint zeta_0{2}) * incoeff 169 /\  
       0 <= to_sint zeta_0{2} < q /\
       start{1} = 2*len{1}*(zetasctr{1} - 1 - zetasctr1) /\
       cmp{2} = start{1} + len{1} /\ 
       j{1} = j{2} /\
       start{1} <= j{1} <= start{1} + len{1} /\
       (exists l, 0 <= l <= 7 /\ len{1} = 2^l /\
          signed_bound_cxq  rp{2} 0 256 (9 - (l - 1)) /\
          signed_bound_cxq  rp{2} (j{1}) (start{1} + len{1}) (9 - l) /\
          signed_bound_cxq  rp{2} (j{1} + len{1}) 256 (9 - l)
       )
       );last first. 
+ auto => /> &1; rewrite /signed_bound_cxq=>  4?lenpow2  2? sval l0 l0l l0h l0v cbdloose cbdtight /= HH=> />;split.

  (* Initialization *) 
  + do split; 1..2,6: smt().
      move : zetas_montE; rewrite /array_mont /lift_array128 tP => mnt.
      + move : (mnt ( zetasctr{1} + 1) _); 1: smt(); rewrite !mapiE /=; 1,2:smt().
        by move => <-; rewrite -ZqField.mulrA rrinvcoeff; ring.
    + by move:(zeta_bound); rewrite /minimum_residues /bpos16 /#.
    + by move:(zeta_bound); rewrite /minimum_residues /bpos16 /#.
    exists (l0); do split; smt().

  (* Termination *)
  move => jl jr rp r1  6? l1 *.
  split; last by smt().
  auto => />;do split;1: by smt().
  + have : (2^l0) \in map (fun i => 2^i) (iota_ 0 8); 
      last by rewrite -JUtils.iotaredE => /> /#.
     have -> : 2^l0 = ((fun x => 2^x) l0) by auto. 
     by rewrite (map_f (fun x => 2^x)) mem_iota /#.

(* Preservation *)
wp; sp; ecall {2} (fqmul_corr (to_sint t{2}) (to_sint zeta_0{2})).
auto => /> &1 &2. rewrite   /signed_bound_cxq =>  3?  lenlb 5?.
move => 3? l1 2? Hl bnt bt 2? result rval.

have l1lb : (1 <= l1) by move : lenlb ; rewrite (_: 2 = 2^1) //;
    smt(Ring.IntID.expr0 StdOrder.IntOrder.ler_weexpn2l). 

have : len{1} \in map (fun i => 2^i) (iota_ 0 8) by smt(mem_iota map_f). 
rewrite -JUtils.iotaredE => /> lenvals.

have  /= [#] redbl redbh redv := 
    (SREDCp_corr (to_sint rp{1}.[j{1} + len{1}] * to_sint zeta_0{1}) _ _); 1,2:
 by rewrite qE /R;move : (bnt (j{1} + len{1}) _); smt().

do split; 2..3: smt(). 
+ apply Array256.ext_eq  => x xb.
  case (x = j{1}); last first.
  + move => *; rewrite set_neqiE; 1 : smt().
    case(x =  j{1} + len{1}); last first.
    + move => *; rewrite set_neqiE;1 : smt().
      by rewrite !mapiE //= !(set_neqiE);  smt().
    move => ->; rewrite !(set_eqiE); 1,2: smt().
    rewrite !mapiE //=; 1..3: smt().
    rewrite (set_neqiE); 1..2:  smt().
    rewrite (set_eqiE); 1..2:  smt().
    rewrite to_sintB_small /= 1:/# incoeffB; congr;congr.
    by apply eq_incoeff; rewrite rval -Hl redv mulrC -incoeffM -mulrA mul_congr.
  move => ->; rewrite set_eqiE; 1,2: smt().
  rewrite (set_neqiE); 1:  smt().
  rewrite !mapiE //=; 1..3: smt().
  rewrite (set_eqiE); 1..2:  smt().
  rewrite to_sintD_small /= 1:/# incoeffD ZqField.addrC; congr.
  apply eq_incoeff; rewrite rval -Hl redv !incoeffK. 
  rewrite !modzMm (modz_small 169 _); 1: by smt(qE).
  rewrite (modz_small (to_sint zeta_0{1}) _); 1: by smt(qE).
  by rewrite mulrC mulrA.

move : redbl redbh; rewrite Hl -rval => redbl redbh.

exists l1; do split; 1..2: smt().
+ move => x xb.
  case (x = j{1}); last first.
  + move => *; rewrite (set_neqiE);1,2 : smt(). 
    case(x = j{1} + len{1}); last by
       move => *; rewrite !(set_neqiE); smt().
    move => ->; rewrite !(set_eqiE); 1,2: smt().
    by rewrite to_sintB_small /=; smt(). 
  move => ->; rewrite set_eqiE; 1,2: smt().
  by rewrite to_sintD_small /=; smt(). 

+ by move => x xb; rewrite !set_neqiE; smt().

by move => x xb; rewrite !set_neqiE; smt().

qed.

lemma ntt_correct _r :
   phoare[Jkem768.M._poly_ntt :
        _r = lift_array256 rp /\ 
        signed_bound_cxq rp 0 256 2
          ==> 
            ntt _r = lift_array256 res /\
            forall k, 0<=k<256 => bpos16 res.[k] (2*q)] = 1%r.
proof.
bypr;move => &m [#] H H1.
apply (eq_trans _ (Pr[NTT.ntt(_r,zetas) @ &m : ntt _r = res])).
have -> : (Pr[NTT.ntt(_r, zetas) @ &m : ntt _r = res] = 
           Pr[Jkem768.M._poly_ntt(rp{m}) @ &m : ntt _r = lift_array256 res /\ 
            forall (k : int), 0 <= k < 256 => bpos16 res.[k] (2 * q)]); last by auto.
byequiv ntt_correct_aux =>//.
byphoare (ntt_spec _r)=> //.
qed.

lemma ntt_correct_h (_r0 : coeff Array256.t):
      hoare[Jkem768.M._poly_ntt :
               _r0 = lift_array256 arg /\
               signed_bound_cxq arg 0 256 2 ==>
               ntt _r0 = lift_array256 res /\
               forall (k : int), 0 <= k && k < 256 => bpos16 res.[k] (2 * q)]
 by conseq (ntt_correct _r0). 

lemma ntt_ll : islossless Jkem768.M._poly_ntt.
proof.
proc; call poly_reduce_ll.
while (   1 <= len /\ len <= 128
       /\ exists l, 0 <= l /\ len = 2^l
       /\ 0 <= zetasctr <= 127
       /\ 2*(zetasctr+1)*len = 256) (len);
  last by auto => />; split; [ by exists 7 | by smt()].
move=> z; wp; sp => *; exists *zetasctr; elim* => zetasctr1 l.
while (   1 <= len /\ len <= 128 /\ 0 <= l /\ len = 2 ^ l
       /\ 0 <= zetasctr1 <= 127
       /\ 0 <= zetasctr <= 127
       /\ 2 * (zetasctr1+ 1) * len = 256
       /\ 2 <= len
       /\ 2* (zetasctr - zetasctr1 ) * len <= 256
       /\ 0 <= start <= 256
       /\ start = 2*(zetasctr - zetasctr1)* len) (256 -start); last first.
+ wp; skip => &m [#] ???????????; split;1: by smt(W64.to_uint0).
  move => start zt0; split;1: by smt(W64.to_uint0).
  move => ge2576_start h2; split;last by rewrite /(`|>>`) /(`<<`) /=; smt(). 
  do 2! (split; first by rewrite  /(`|>>`) /(`<<`) /=; smt()).
have gt0_l: 0 < l. 
  have /ler_eqVlt [<<- /=|/#]: 0 <= l by move: h2 => [#].
  have: 2 <= len{m} by smt().
  have ->: len{m} = 2^0 by move: h2 => [#] *.
  by rewrite expr0.
exists (l-1); do! split; 1,3,4:smt().
+ rewrite  /(`|>>`) /(`<<`) /=; have ->:  len{m} = 2^l by move: h2=> [#].
  by rewrite  -{1}(@IntID.subrK l 1) JUtils.powS_minus /#.
by rewrite  /(`|>>`) /(`<<`) /= //= /#.

move=> *; wp.
while (    cmp =  start +  len 
       /\ 0 <= start <= 256
       /\ 1 <= len /\ len <= 128
       /\ start <= j <=  start + len
       /\ 0 <= zetasctr <= 127
       /\ 2 * (zetasctr1 + 1) * len = 256
       /\ start = 2*(zetasctr -1 - zetasctr1) * len
       /\ 2 * (zetasctr - zetasctr1 ) * len <= 256) (start + len - j); last first. 
+ wp; skip => &hr /> /#. 
move => *;wp; call fqmul_ll; auto => />  /#.
qed.

(*******INVERSE *******)

lemma zetainv_bound :  minimum_residues jzetas_inv.
proof.
rewrite /minimum_residues qE.
apply/(Array128.allP jzetas_inv (fun x => bpos16 x 3329)) => /=.
have -> : 
  (fun (x : W16.t) => 0 <= to_sint x < 3329) = 
  (fun (x : W16.t) => 0 <= (if 32768 <= to_uint x 
                            then to_uint x - 65536 
                            else to_uint x) < 3329) 
    by apply/fun_ext => x *; rewrite to_sintE /smod => />.
by rewrite /all -iotaredE; cbv delta.
qed.


equiv invntt_correct_aux :
  NTT_Fq.NTT.invntt ~Jkem768.M._poly_invntt : 
        r{1} = lift_array256 rp{2} /\ zetas_inv{1} = zetas_inv /\
           signed_bound_cxq rp{2} 0 256 4
          ==> 
            map (fun x => x * (incoeff SignedReductions.R)) res{1} = lift_array256 res{2} /\
            forall k, 0<=k<256 => b16 res{2}.[k] (q).
proc.
(* Final loop just reduces the range *)
seq 3 5 :  (r{1} = lift_array256 rp{2} /\ zetasp{2} = jzetas_inv /\
        zetas_inv{1} = zetas_inv /\
        signed_bound_cxq rp{2} 0 256 4
); last first.
+ while (j{1} = j{2} /\
       0 <= j{1} <= 256 /\
       (forall k, (0 <= k < j{1} => r{1}.[k] * incoeff SignedReductions.R = incoeff (to_sint rp{2}.[k])) /\
                  (j{1} <= k < 256 => r{1}.[k] = incoeff (to_sint rp{2}.[k]))

       ) /\
       zetas_inv.[127]{1} * incoeff SignedReductions.R  = incoeff (to_sint jzetas_inv.[127]) * incoeff 169 /\
       zeta_0{2} = jzetas_inv.[127] /\
       signed_bound_cxq rp{2} 0 256 4 /\
       (forall k, 0 <= k < j{1} => b16 rp{2}.[k] (q))); last first. 
  + wp;skip; move => &1 &2 [#] ->. 
    rewrite /signed_bound_cxq => /= zp zvals zbnd.
    split.
    + do split; 4..: by smt().
      + by move => k; split; move => kb;rewrite !mapiE 1:/# /= /#.
      + rewrite zvals; move : zetas_invE; rewrite /array_mont_inv /=. 
        rewrite tP => zzvals; move : (zzvals 127 _) => //.
        rewrite get_of_list 1://= //= /to_sint /smod /= => ->.
        have ->: 1441 = 512 * SignedReductions.R %% 3329.
          by cbv.
        rewrite -qE incoeffM_mod -ZqField.mulrA rrinvcoeff.
        by rewrite -incoeffM_mod /R qE //= ZqField.mulr1.
      + by rewrite zp /=.
    move => jl rl jr rpr *.
    have ? : jl = 256 by smt().
    subst jl.
    split; last by smt().
    by rewrite tP => x xb; rewrite !mapiE /#.
  
  auto => />.
  + move => &1 &2  [#] ->.
    rewrite /lift_array256 /signed_bound_cxq.
    by move => /= ?? zp zvals z2 bnd1 bnd2 ?? t ? /#.
  ecall {2}(fqmul_corr (to_sint t{2}) (to_sint zeta_0{2})).
  auto => /> &1 &2;rewrite /array_mont_inv /lift_array128 /lift_array256 /signed_bound_cxq.
  move => /= ?? zp zvals bnd1 bnd2 ? result rval.

  have  /= [#] redbl redbh redv := 
    (SREDCp_corr (to_sint rp{2}.[j{2}] * to_sint ((of_int 1441))%W16)_ _).
  + by rewrite /R qE /=.
  by  rewrite /R /=; move : (bnd1 (j{2}) _); 1:smt(); 
      rewrite /to_sint /of_uintK /smod qE /#.
  
  do split; 1,2:smt().
  + move => k; split. 
    + move => kbl kbh; case (k = j{2}); last by move => *;rewrite !set_neqiE /#.
      move => ->; rewrite !set_eqiE // -ZqField.mulrA zvals.
      move : (zp (j{2})) => [#] _ -> //.
      apply eq_incoeff; rewrite rval redv.
      by rewrite -incoeffM !incoeffK modzMm mulrA. 
    by move => kbl kbh;rewrite !set_neqiE /#.
  
  + move => k kb; case (k = j{2}); last by move => *;rewrite !set_neqiE /#. 
    by move => ->; rewrite !set_eqiE /#.

  move => k kb; case (k = j{2}); last by move => *;rewrite !set_neqiE /#. 
  move => ->; rewrite !set_eqiE //. move => ?. rewrite rval redbl //=.

(* Outer loop *)
while (
   zetasp{2} = jzetas_inv /\
   r{1} = lift_array256 rp{2} /\
   zetas_inv{1} = zetas_inv /\
   len{1} = len{2} /\
   (exists l, 1 <= l <= 8 /\ len{1} = 2^l) /\
   0 <= zetasctr{1} <= 128 /\
   zetasctr{1} = to_uint zetasctr{2} /\
   zetasctr{1} * len{1} = 128 * (len{1} - 2) /\
   signed_bound_cxq rp{2} 0 256 4); last first.
+ auto => /> &1 cbnd. exists (1); smt().

wp; exists* zetasctr{1}; elim* => zetasctr1 l.

(* Middle loop *)
while (#{/~zetasctr1=zetasctr{1}}
        {~zetasctr{1} * len{1} = 128 * (len{1} - 2)}pre /\ 
       zetasctr1 * len{1} = 128 * (len{1} - 2) /\
       start{1} = start{2} /\
       0 <= start{1} <= 256 /\
       start{1} = 2*(zetasctr{1} - zetasctr1)*len{1} /\
       2* (zetasctr{1} - zetasctr1) * len{2} <= 256 /\
       (* Nasty carry inv *)
       signed_bound_cxq  rp{2} 0 256 4); last first.

+ auto => /> &1; rewrite  /signed_bound_cxq.
  move => 2? rep ? lb ? rp start zetasctr *.
  do split; 2..: smt().
  exists (l+1); split; last by rewrite  exprD_nneg /#.
  by smt(StdOrder.IntOrder.ler_weexpn2l pow2_7 StdOrder.IntOrder.ieexprIn). 

wp.
(* Inner loop *)
while (#{/~start{1} = 2*(zetasctr{1} - zetasctr1) * len{1}} pre /\
       zeta_{1} = incoeff (to_sint zeta_0{2}) *  (incoeff 169) /\  
       0 <= to_sint zeta_0{2} < q /\
       start{1} = 2*((zetasctr{1}-1) - zetasctr1) * len{1} /\
       cmp{2} = start{1} + len{1} /\ 
       j{1} = j{2} /\
       start{1} <= j{1} <= start{1} + len{1}); last first.

+ auto => />  &1; rewrite /signed_bound_cxq.
  move => 3? rep zctr_lb zctr_ub ? lb ? rp ?.

  move : zetainv_bound; rewrite /minimum_residues /bpos16 => zb.

  have : 2^l \in map (fun i => 2^i) (iota_ 1 8) by smt(mem_iota map_f). 
  rewrite -JUtils.iotaredE => /> lenvals.

  rewrite !to_uintD_small /= 1:/#.

  do split; 1..3,5..6:smt().
  + rewrite -(Array128.mapiE (fun x => incoeff (W16.to_sint x))) 1:/#.
    rewrite -zetas_invE /array_mont_inv //=.
    rewrite set_neqiE /=; 1,2: smt().
    rewrite mapiE /=; 1: smt().
    by rewrite -ZqField.mulrA rrinvcoeff; ring.
  by move:(zeta_bound); rewrite /minimum_residues /bpos16 /#.
by smt().

(* Preservation *)

wp;ecall {2}(fqmul_corr (to_sint t{2}) (to_sint zeta_0{2})).
wp;ecall {2} (barrett_reduce_corr (to_sint m{2})).

auto => />  &1 &2; rewrite /signed_bound_cxq /b16. 
move => ?????????? rep 3? lb result rval result0 rval0.
rewrite /lift_array256 /=.

have [#]bredbl bredbh bredv := (BREDCp_corr (to_sint (rp{1}.[j{1} + 
                          2^l] + rp{1}.[j{1}])) 26 _ _ _ _ _ _); 
     1..4: smt(qE pow2_16).
+ rewrite to_sintD_small /= /R /=; smt(qE).
+ by move => a; rewrite /R qE /= /barrett_pred => bnd; split; smt().

have  /= [#] redbl redbh redv := 
   (SREDCp_corr (to_sint (rp{1}.[j{1}] - rp{1}.[j{1} + 
                                2^l]) * to_sint zeta_0{1})_ _).
  + by rewrite /R qE /=.
  by rewrite /R qE /= !to_sintB_small /=; smt(qE). 

move : redbl redbh; rewrite -rval0 => redbl redbh.
move : bredbl bredbh; rewrite -rval => bredbl bredbh.

have :2^l \in map (fun i => 2^i) (iota_ 1 8) by smt(mem_iota map_f). 
rewrite -JUtils.iotaredE => /> lenvals.

do split; 4..: smt().

+ apply Array256.ext_eq  => x xb.
  case (x = j{1} + 2^l); last first.
  + move => *; rewrite (set_neqiE);1: smt().
    case(x = j{1}); last first.
    + move => *; rewrite set_neqiE;1 : smt().
      by rewrite !mapiE //= !(set_neqiE);  smt().
    move => ->; rewrite !(set_eqiE); 1,2: smt().
    rewrite !mapiE //=; 1..3: smt().
    rewrite (set_neqiE); 1..2:  smt().
    rewrite (set_eqiE); 1..2:  smt().
    rewrite rval -eq_incoeff bredv !incoeffK modzDm addrC.
    by rewrite to_sintD_small /=; smt(qE).
  move => ->; rewrite set_eqiE; 1,2: smt().
  rewrite (set_eqiE); 1..2:  smt().
  rewrite (set_neqiE); 1:  smt().
  rewrite !mapiE //=; 1..3: smt().
  rewrite (set_eqiE); 1..2:  smt().
  rewrite -incoeffB; apply eq_incoeff; rewrite rval0 redv !incoeffK. 
  rewrite !modzMm !(modz_small 169 _) qE 1:/# (modz_small (to_sint zeta_0{1})); 1: by smt(qE).
  rewrite to_sintB_small /= ; 1: smt(qE).
  by rewrite mulrC mulrA.

+ move => x xb.
  case (x = j{1} + 2^l); last first.
  + move => *; rewrite (set_neqiE);1 ,2: smt().
    case(x = j{1}); last first.
    + by move => *; rewrite !(set_neqiE); smt().
    by move => ->; rewrite !(set_eqiE); smt().
  by move => ->; rewrite set_eqiE; smt().

move => x xb.
case (x = j{1} + 2^l); last first.
+ move => *; rewrite (set_neqiE);1 ,2: smt().
  case(x = j{1}); last first.
  + by move => *; rewrite !(set_neqiE); smt().
  by move => ->; rewrite !(set_eqiE); smt().
by move => ->; rewrite set_eqiE; smt().
qed.

lemma invntt_correct _r  :
   phoare[Jkem768.M._poly_invntt :
        _r = lift_array256 rp /\ signed_bound_cxq rp 0 256 4
          ==> 
            scale (invntt _r) (incoeff SignedReductions.R) = lift_array256 res /\
            forall k, 0<=k<256 => b16 res.[k] (q)] = 1%r.
proof.
bypr;move => &m [#] H H1.
apply (eq_trans _ (Pr[NTT.invntt( _r,zetas_inv) @ &m :  invntt _r = res])).
+ have -> : (
Pr[NTT.invntt(_r, zetas_inv) @ &m : invntt _r = res] = 
Pr[Jkem768.M._poly_invntt(rp{m}) @ &m :
  invntt (map (fun x => x * (incoeff SignedReductions.R)) _r) = lift_array256 res /\ 
   forall (k : int), 0 <= k < 256 => b16 res.[k] (q)]); last by rewrite invntt_scale.
byequiv invntt_correct_aux; 1: by smt(). 
+ move => &1 &2;rewrite invntt_scale /scale /= /lift_array256 /= !tP/=.  
  move => [#] H2 H3;split.
  + move => H4; split; last by apply H3.
    by move => i ib; move : (H2 i ib) => <- /=; rewrite mapiE // (H4 i ib) mapiE //.
  move =>  [#] H4 H5.
  move => i ib; move : (H4 i ib) => /=; rewrite mapiE //= -(H2 i ib) mapiE //=. 
  have : incoeff SignedReductions.R <> Zq.zero; rewrite /R /=; move : (eq_incoeff 65536 0); 1: smt().
  move => ? H0;move : (ZqField.mulfI (incoeff 65536) H0) => minj. 
  by rewrite !(ZqField.mulrC _ (incoeff 65536)) /#. 
by byphoare (invntt_spec _r) => /#. 
qed.

lemma invntt_correct_h (_r : coeff Array256.t):
      hoare[ Jkem768.M._poly_invntt :
             _r = lift_array256 arg /\
             signed_bound_cxq arg 0 256 4 ==>
             scale (invntt _r) (incoeff SignedReductions.R) = lift_array256 res /\
             forall (k : int), 0 <= k && k < 256 => b16 res.[k] (q)]
by conseq (invntt_correct _r). 

lemma invntt_ll : islossless Jkem768.M._poly_invntt.
proof.
proc.
while(0<=j<=256) (256-j);1: by
 move => *; auto => />;call fqmul_ll; auto => /> /#.
wp.
while (   2 <= len /\ len <= 256
       /\ exists l, 0 <= l /\ len = 2^l
       /\ 0 <= to_uint zetasctr <= 128
       /\ to_uint zetasctr * len = 128 * (len - 2)) (256-len);
 last first.
+ auto => />; split; 1: by exists 1 => /=.
  by smt().
move => *; wp; sp=> *; move=> *; exists *zetasctr.
elim*=> zetasctr1 l.
while (   1 <= len /\ len <= 128 /\ 0 <= l /\ len = 2 ^ l
       /\ 0 <= to_uint zetasctr1 <= 128
       /\ 0 <= to_uint zetasctr <= 128
       /\ to_uint zetasctr1 * len = 128 * (len - 2)
       /\ 2 * (to_uint zetasctr - to_uint zetasctr1 ) * len <= 256
       /\ 0 <= start <= 256
       /\ start = 2 * (to_uint zetasctr - to_uint zetasctr1)*len) (256 -start); last first.
+ wp; skip => &m [#] h *.
  split;1: smt(W64.to_uint0). 
  move => start zetasctr; split;first by smt(W64.to_uint0).
  move=> ge256_st h2; split.
  rewrite /(`<<`) //=; do split; 1,2:by smt(). 
have gt0_l: 0 < l.
  have /ler_eqVlt [<<- /=|/#]: 0 <= l by move: h2 => [#].
  have: 2 <= len{m} by move: h => [#] *.
  have ->:  len{m} = 2^0 by move: h2 => [#] *.
  by rewrite expr0.
exists (l+1); do! split; 1,3,4,5:smt().
+ have ->:  len{m} = 2^l by move: h2=> [#].
  by rewrite exprS 1:/# mulrC.
by rewrite /(`<<`) //=/#.

move => *; wp.
while (   cmp = start + len 
       /\ 0 <= start <= 256
       /\ 1 <=  len /\ len <= 128  /\ start <=  j <=  start +  len
       /\ 0 <= to_uint zetasctr <= 128
       /\ to_uint zetasctr1 * len = 128 * ( len - 2)
       /\ start = 2 * (to_uint zetasctr -1 - to_uint zetasctr1) *  len
       /\ 2 * (to_uint zetasctr - to_uint zetasctr1 ) *  len <= 256) ( start +  len -  j); last first.
+ wp;skip => &m *.
  rewrite !to_uintD_small /= 1:/#; split; 1: by smt().
  by smt().
move => *; wp; call fqmul_ll; wp; call barrett_reduce_ll; auto => /> /#. 
qed.

(* some auxilliary definitions *) 

op cmplx_mul_169 (a :coeff * coeff, b : coeff * coeff, zzeta : coeff) =
     (a.`2 * b.`2 * zzeta * (incoeff 169) + a.`1*b.`1  * (incoeff 169), 
      a.`1 * b.`2  * (incoeff 169) + a.`2 * b.`1  * (incoeff 169)).

op doublemul(a1 : coeff * coeff, b1 : coeff * coeff, 
              a2 : coeff * coeff, b2 : coeff * coeff, zzeta : coeff) = 
     (cmplx_mul_169 a1 b1 zzeta, cmplx_mul_169 a2 b2 (-zzeta)).

op isbasemul(ap bp : coeff Array256.t, zetas : coeff Array128.t, 
            rs : coeff Array256.t, i : int) : bool = 
   forall k, 0 <= k < i %/ 4 =>
     ((rs.[4*k],rs.[4*k+1]),(rs.[4*k+2],rs.[4*k+3])) =
         (doublemul (ap.[4*k],ap.[4*k+1]) (bp.[4*k],bp.[4*k+1])
                    (ap.[4*k+2],ap.[4*k+3]) (bp.[4*k+2],bp.[4*k+3]) (zetas.[k+64])).


lemma basemul_sem p1 p2 r :
     isbasemul p1 p2 zetas r 256 =>
      r = scale (basemul p1 p2) (incoeff 169). 
proof.
rewrite /isbasemul /scale /doublemul /cmplxmul_169 /lift_array256 /basemul.
move => H.
rewrite tP => i ib; move : (H (i %/ 4) _); 1: smt().
rewrite !mapiE 1:/# !initiE  1,2:/# => /=  HH.
case (i %% 4 = 0).
+ move => case1; have subcase /= : i %% 2 = 0; 1: by smt().
  rewrite subcase; move : HH.
  have -> : 4 * (i %/ 4) = i by smt().
  have ->/= : 2 * (i %/ 2) = i by smt().
  rewrite /cmplx_mul_169 /cmplx_mul /= => [#] -> ? three four.
  move : (zetavals1 i _ case1); 1: smt(). 
  rewrite /zetas /= initiE 1:/# /= => ->.
  have -> : Zq.exp = ZqRing.exp by smt().
  by ring.

case (i %% 4 = 1).
+ move => case2 ncase1; have subcase /= : i %% 2 = 1; 1: by smt().
  rewrite subcase; move : HH.
  have -> : 2 * (i %/ 2) = 4 * (i %/ 4) by smt().
  have -> : 4 * (i %/ 4) + 1 = i by smt().
  rewrite /= /cmplx_mul_169 /cmplx_mul /= => [#] ? -> ??.
  by ring.

case (i %% 4 = 2).
+ move => case3 ncase2 ncase1; have subcase /= : i %% 2 = 0; 1: by smt().
  rewrite subcase /=; move : HH.
  have -> : 4 * (i %/ 4) + 2= i by smt().
  have -> : 4 * (i %/ 4) + 3= i+1 by smt().
  have -> : 2*(i%/2) = i by smt().
  rewrite /= /cmplx_mul_169 /cmplx_mul /= => [#] ??->?.
  move : (zetavals2 i _ case3); 1: smt(). 
  rewrite /zetas /= initiE 1:/# /= => ->.
  have -> : Zq.exp = ZqRing.exp by smt().
  by ring.

case (i %% 4 = 3).
+ move => case4 ncase3 ncase2 ncase1; have subcase /= : i %% 2 = 1; 1: by smt().
  rewrite subcase; move : HH.
  have -> : 2 * (i %/ 2) + 1 = 4 * (i %/ 4) + 3 by smt().
  have -> : 4 * (i %/ 4) + 3 = i by smt().
  have -> : 2*(i%/2) = 4 * (i %/ 4) + 2 by smt().
  rewrite /= /cmplx_mul_169 /cmplx_mul /= => [#] ???->.
  by ring.
by smt().
qed.

lemma poly_basemul_corr _ap _bp:
   hoare[Jkem768.M._poly_basemul :
     _ap = lift_array256 ap /\ _bp = lift_array256 bp /\
     signed_bound_cxq ap 0 256 2 /\  signed_bound_cxq bp 0 256 2 ==>
     signed_bound_cxq res 0 256 3 /\ 
     lift_array256 res = scale (basemul _ap _bp) (incoeff 169)].
proof.
conseq (_: _ ==> 
   signed_bound_cxq res 0 256 3 /\ 
   isbasemul _ap _bp zetas (lift_array256 res) 256).
+ move => ?? result [#] ? H; split; 1:smt().  
  by apply (basemul_sem _ap _bp  (lift_array256 result)).
proc.
seq 2 : #pre; first by auto => />.
while (#pre /\ srp = rp /\
    0<= i <= 256 /\  i %% 4 = 0 /\
    signed_bound_cxq rp 0 ( i) 3 /\
    isbasemul _ap _bp zetas (lift_array256 rp) (i)); 
       last by auto => /> &hr ??; split;smt().

wp;ecall(fqmul_corr_h (to_sint a1) (to_sint b0)).
wp;ecall(fqmul_corr_h (to_sint a0) (to_sint b1)).
wp;ecall(fqmul_corr_h (to_sint a0) (to_sint b0)).
wp;ecall(fqmul_corr_h (to_sint r0) (to_sint zeta_0)).
wp;ecall(fqmul_corr_h (to_sint a1) (to_sint b1)).
wp;ecall(fqmul_corr_h (to_sint a1) (to_sint b0)).
wp;ecall(fqmul_corr_h (to_sint a0) (to_sint b1)).
wp;ecall(fqmul_corr_h (to_sint a0) (to_sint b0)).
wp;ecall(fqmul_corr_h (to_sint r0) (to_sint zeta_0)).
wp;ecall(fqmul_corr_h (to_sint a1) (to_sint b1)).
auto => /> &hr; rewrite /signed_bound_cxq /isbasemul /lift_array256 /=.
move => ba bb ??? bprev vprev entry.
rewrite /(`|>>`) /(`<<`) /= Array64.Array64.initiE /=; 1: smt().
move => r1 r1val r2 r2val r3 r3val r4 r4val r5 r5val r6 r6val r7 r7val r8 r8val r9 r9val r10 r10val.

have hq : 0 < q && q < SignedReductions.R %/ 2 by rewrite /R /#.
have hi: 0 <= i{hr} &&  i{hr} < 256 by smt().
have hip1: 0 <= i{hr} + 1 && i{hr} + 1 < 256 by smt().
have hip2: 0 <= i{hr} + 2 && i{hr} + 2 < 256 by smt().
have hip3: 0 <= i{hr} + 3 && i{hr} + 3 < 256 by smt().

have  /= [#] redbl1 redbh1 redv1 :=
    (SREDCp_corr (to_sint ap{hr}.[i{hr} + 1] * to_sint bp{hr}.[i{hr} + 1]) hq _).
     by move: (ba _ hip1) (bb _ hip1); rewrite /R /#.

have  /= [#] redbl2 redbh2 redv2 :=
    (SREDCp_corr (to_sint r1 * to_sint jzetas.[64 + i{hr} %/ 4]) hq _).
     by rewrite /R /=; move : (zeta_bound (64 +  i{hr} %/ 4)); rewrite /minimum_residues; smt().

have  /= [#] redbl3 redbh3 redv3 :=
    (SREDCp_corr (to_sint ap{hr}.[i{hr}] * to_sint bp{hr}.[i{hr}]) hq _).
     by move: (ba _ hi) (bb _ hi); rewrite /R /#.

have  /= [#] redbl4 redbh4 redv4 :=
    (SREDCp_corr (to_sint ap{hr}.[i{hr}] * to_sint bp{hr}.[i{hr} + 1]) hq _).
     by move: (ba _ hi) (bb _ hip1); rewrite /R /#.

have  /= [#] redbl5 redbh5 redv5 :=
    (SREDCp_corr(to_sint ap{hr}.[i{hr} + 1] * to_sint bp{hr}.[i{hr}]) hq _).
     by move: (ba _ hip1) (bb _ hi); rewrite /R /#.

have  /= [#] redbl6 redbh6 redv6 :=
    (SREDCp_corr (to_sint ap{hr}.[i{hr} + 3] * to_sint bp{hr}.[i{hr} + 3]) hq _).
     by move: (ba _ hip3) (bb _ hip3); rewrite /R /#.

have  /= [#] redbl7 redbh7 redv7 :=
    (SREDCp_corr (to_sint r6 * to_sint (- jzetas.[64 + i{hr} %/ 4])) hq _).
+ rewrite /R /=; move : (zeta_bound (64 + i{hr} %/ 4)); rewrite /minimum_residues /bpos16 => zb.
  rewrite to_sintN /= ?IntID.mulrN; do split;smt(W16.to_sint_cmp). 

have  /= [#] redbl8 redbh8 redv8 :=
    (SREDCp_corr (to_sint ap{hr}.[i{hr}+2] * to_sint bp{hr}.[ i{hr}+2]) hq _).
     by move: (ba _ hip2) (bb _ hip2); rewrite /R /#.

have  /= [#] redbl9 redbh9 redv9 :=
    (SREDCp_corr (to_sint ap{hr}.[i{hr}+2] * to_sint bp{hr}.[i{hr} + 3]) hq _).
     by move: (ba _ hip2) (bb _ hip3); rewrite /R /#.

have  /= [#] redbl10 redbh10 redv10 :=
    (SREDCp_corr(to_sint ap{hr}.[i{hr} + 3] * to_sint bp{hr}.[i{hr}+2]) hq _).
     by move: (ba _ hip3) (bb _ hip2); rewrite /R /#.

rewrite -r1val in redbl1;rewrite -r1val in redbh1;rewrite -r1val eq_incoeff in redv1.
rewrite -r2val in redbl2;rewrite -r2val in redbh2;rewrite -r2val eq_incoeff in redv2.
rewrite -r3val in redbl3;rewrite -r3val in redbh3;rewrite -r3val eq_incoeff in redv3.
rewrite -r4val in redbl4;rewrite -r4val in redbh4;rewrite -r4val eq_incoeff in redv4.
rewrite -r5val in redbl5;rewrite -r5val in redbh5;rewrite -r5val eq_incoeff in redv5.
rewrite -r6val in redbl6;rewrite -r6val in redbh6;rewrite -r6val eq_incoeff in redv6.
rewrite -r7val in redbl7;rewrite -r7val in redbh7;rewrite -r7val in redv7.
rewrite eq_incoeff !incoeffM to_sintN in redv7.
+ move : zeta_bound; rewrite /= /minimum_residues /=.
  move => HH;move : (HH (64 + i{hr} %/ 4) _);1:smt(). 
  by smt(qE).
rewrite incoeffN in redv7.
rewrite -r8val in redbl8;rewrite -r8val in redbh8;rewrite -r8val eq_incoeff in redv8.
rewrite -r9val in redbl9;rewrite -r9val in redbh9;rewrite -r9val eq_incoeff in redv9.
rewrite -r10val in redbl10;rewrite -r10val in redbh10;rewrite -r10val eq_incoeff in redv10.

move : zetas_montE; rewrite /array_mont /lift_array128 tP => zv.
move : (zv (64 + i{hr} %/ 4) _); 1: smt().
rewrite !mapiE /=; 1,2: smt() => <-.
move => zv1. 
move : (zv (i{hr} %/ 4) _); 1: smt().
rewrite !mapiE /=; 1,2: smt() => <-.
move => zv2. 

do split; 1..3: smt().

+ move => k kb; case (k <  i{hr}).
  + move => *; rewrite !set_neqiE // 1..4:/#; apply: bprev => /#.
  move => *; case (k = i{hr}).
  + move => *. 
    rewrite set_neqiE; 1,2: smt().
    rewrite set_neqiE; 1,2: smt().
    rewrite set_neqiE; 1,2: smt().
    rewrite set_eqiE; 1,2: smt().
    by rewrite to_sintD_small /#.
  move => *; case (k =  i{hr} + 1).
  + move => *;rewrite set_neqiE; 1,2: smt().
    rewrite set_neqiE; 1,2: smt().
    rewrite set_eqiE; 1,2: smt().
    by rewrite to_sintD_small /#.
  move => *; case (k = i{hr} + 2).
  + move => *;rewrite set_neqiE; 1,2: smt().
    rewrite set_eqiE; 1,2: smt().
    by rewrite to_sintD_small /#.
  move => *;rewrite set_eqiE; 1,2: smt().
  by rewrite to_sintD_small /#.

move => k kb; rewrite /doublemul /cmplx_mul_169 !mapiE /=; 1..12:smt().

case (k < i{hr} %/4).

+ move => kbb; move: (vprev k _); 1:smt(); rewrite !mapiE /=; 1..12:smt().
  rewrite /doublemul /cmplx_mul_169 /=.
  move => /> vprev0 vprev1 vprev2 vprev3.
  by rewrite !set_neqiE /#. 

move => *; have kval : (k =  i{hr} %/ 4) by smt().
have -> : 4 * k = i{hr} by smt().
do split.
+ rewrite set_neqiE; 1,2: smt().
  rewrite set_neqiE; 1,2: smt().
  rewrite set_neqiE; 1,2: smt().
  rewrite set_eqiE; 1,2: smt().
  rewrite to_sintD_small; 1: smt(). 
  rewrite incoeffD redv2 redv3 !incoeffM redv1 !incoeffM -zv1 /zetas !initiE /=; 1,2: smt(). 
  rewrite kval (IntID.addrC 64).
  move : (zetavals1 (i{hr}) _ _); 1,2: smt().
  rewrite /zetas /= initiE 1:/# /= => ->.
  rewrite ZqField.mulrA -ZqField.mulrA rrinvcoeff.
  by ring.
+ move => *.
  rewrite set_neqiE; 1,2: smt().
  rewrite set_neqiE; 1,2: smt().
  rewrite set_eqiE; 1,2: smt().
  rewrite to_sintD_small; 1: smt(). 
  rewrite incoeffD redv4 redv5 !incoeffM.
  by ring.

rewrite set_neqiE; 1,2: smt().
rewrite set_eqiE; 1,2: smt().
rewrite to_sintD_small; 1: smt(). 
rewrite incoeffD redv7 redv8 redv6 -zv1 /zetas !initiE /=; 1,2: smt(). 
rewrite !incoeffM kval (IntID.addrC 64).
move : (zetavals1 ( i{hr}) _ _); 1,2: smt().
rewrite /zetas /= initiE 1:/# /= => ->.
congr;congr;rewrite -ZqRing.mulrA -(ZqRing.mulrC _ (incoeff 169));congr.
rewrite ZqField.mulNr -ZqField.mulrA rrinvcoeff.
by ring.

move => *.
rewrite set_eqiE; 1,2: smt().
rewrite to_sintD_small; 1: smt(). 
rewrite incoeffD redv9 redv10 !incoeffM.
by ring.

qed.

lemma poly_basemul_ll : islossless Jkem768.M._poly_basemul.
proc.
while (0 <=  i <= 256 /\  i %%4 = 0) (256 -  i); 
    last by auto => />  /#.
move => *; do 10! (wp;call fqmul_ll); auto => />.
by auto => /#.
qed.


lemma poly_basemul_correct _ap _bp:
   phoare[Jkem768.M._poly_basemul :
     _ap = lift_array256 ap /\ _bp = lift_array256 bp /\
     signed_bound_cxq ap 0 256 2 /\  signed_bound_cxq bp 0 256 2 ==>
     signed_bound_cxq res 0 256 3 /\ 
     lift_array256 res = scale (basemul _ap _bp) (incoeff 169)] =1%r 
  by conseq poly_basemul_ll (poly_basemul_corr _ap _bp). 

end MLKEM_Poly.
