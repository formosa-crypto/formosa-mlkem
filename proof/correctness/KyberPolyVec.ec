require import AllCore List IntDiv CoreMap.
from Jasmin require  import JModel JMemory.
require import W16extra Array3 Array320 Array384 Array256 Array128 Array768 .
require import Fq.
require import KyberPoly.
require import NTT_Fq.
require import Kyber.


require import Jindcpa.

theory KyberPolyVec.

import NTT_Fq.
import Zq.
import KyberPoly.
import Matrix_.
(* AUX *)

op lift_polyvec(row :  W16.t Array768.t, c : int) = 
   Array256.init (fun i => inFq (W16.to_sint row.[c*256 + i])). 

op lift_vector(vec: W16.t Array768.t) : vector =
    Vector.offunv (fun i => lift_polyvec vec i).

op scale_vector(v : vector, c : Fq) : vector = 
   Vector.offunv 
       (fun i => (scale ((Vector.tofunv v) i) c)).

lemma nttv_add (v1 v2 : vector) :
   nttv (v1 + v2) = 
    nttv v1 + nttv v2.
proof.
rewrite /nttv /mapv. 
rewrite eq_vectorP => x H.
rewrite !offunvE //= offunvK /vclamp H //= !offunvE //=. 
by rewrite add_comm_ntt.
qed.

lemma mulvec a b :
   dotp a b = 
    invntt (basemul (ntt a.[0]) (ntt b.[0])) &+
    invntt (basemul (ntt a.[1]) (ntt b.[1])) &+
    invntt (basemul (ntt a.[2]) (ntt b.[2])).
proof.
rewrite -!mul_comm_ntt !invnttK.
rewrite /dotp => />. 
rewrite /Big.BAdd.big /predT /kvec => />.
by ring.
qed.

op lift_array768 (p : W16.t Array768.t) =
  Array768.map (fun x => inFq (W16.to_sint x)) p.

op signed_bound768_cxq (coefs : W16.t Array768.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => b16 coefs.[k] (c * q).

op pos_bound768_cxq (coefs : W16.t Array768.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] (c * q).

op pos_bound768_b (coefs : W16.t Array768.t) (l u b : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] b.

lemma lift_array768_inFq (a : W16.t t) k :
  0 <= k < 768 =>
  inFq (to_sint a.[k]) = (lift_array768 a).[k].
proof. by move => H; rewrite /lift_array768 mapE /= initE H. qed.

lemma lift_array256_inFq (a : W16.t Array256.t) k :
  0 <= k < 256 =>
  inFq (to_sint a.[k]) = (lift_array256 a).[k].
proof. by move => H; rewrite /lift_array256 mapE /= initE H. qed.

lemma lift_array256_sub_768 a (b : W16.t Array256.t) x n :
  0 <= n =>
  lift_array768 a = x =>
  (forall (k : int), 0 <= k < 256 => inFq (to_sint b.[k]) = x.[k+n]) =>
  (forall (k : int), 0 <= k < 256 => b.[k] = a.[k+n]) =>
  lift_array256 b = Array256.of_list witness (sub x n 256).
proof.
  rewrite /lift_array768 => H H0 H1 H2.
  rewrite /lift_array256 tP => j H3.
  rewrite mapE /of_list !initE H3 /=.
  by rewrite H1 // nth_sub // addzC.
qed.

lemma inFq_lift_array256 (x : W16.t t) y n :
  0 <= n <= 512 =>
  (forall (k : int), 0 <= k < 256 => inFq (to_sint x.[k+n]) = (lift_array256 y).[k]) =>
  lift_array256 y = Array256.of_list witness (sub (lift_array768 x) n 256).
proof.
  move => H H0; rewrite tP => j H1.
  rewrite -H0 //.
  rewrite /of_list initE H1 /= nth_sub // /lift_array768 mapiE // /#. 
qed.

lemma lift_array768E (x : W16.t t) k :
  0 <= k < 768 =>
  (lift_array768 x).[k] = inFq (to_sint x.[k]).
proof.  by move => ?; rewrite /lift_array768 mapiE //. qed.

lemma lift_array768_eq (x y : W16.t t) :
  (forall k, 0 <= k < 256 =>
    inFq (to_sint x.[k]) = (Array256.of_list witness (sub (lift_array768 y) 0 256)).[k]) =>
  (forall k, 0 <= k < 256 =>
    inFq (to_sint x.[k+256]) = (Array256.of_list witness (sub (lift_array768 y) 256 256)).[k]) =>
  (forall k, 0 <= k < 256 =>
    inFq (to_sint x.[k+512]) = (Array256.of_list witness (sub (lift_array768 y) 512 256)).[k]) =>
  lift_array768 x = lift_array768 y.
proof.
  move => H H0 H1; rewrite tP => k H2.
  rewrite lift_array768E //.
  case (k < 256) => H3.
    by rewrite H 1:/# get_of_list 1:/# nth_sub 1:/#.
  case (k < 512) => H4.
    move : (H0 (k-256)).
    have ->: 0 <= k - 256 < 256 by smt().
    by move=> /= ->; rewrite /= get_of_list 1:/# nth_sub 1,2:/#.
  move : (H1 (k-512)).
  have -> /= H5: 0 <= k - 512 < 256 by smt().
  by rewrite H5 get_of_list 1:/# nth_sub 1,2:/#.
qed.

lemma lift_array768P (x y : W16.t t) :
  lift_array768 x = lift_array768 y <=>
  (forall k, 0 <= k < 768 => inFq (to_sint x.[k]) = inFq (to_sint y.[k])).
proof. 
  split; first by rewrite tP => H *; rewrite -!lift_array768E // H //. 
  by rewrite tP => H *; rewrite !lift_array768E // H //. 
qed.

op lift_array768_32 (p : W32.t Array768.t) =
  Array768.map (fun x => inFq (W32.to_sint x)) p.

op bpos32 a b = (0 <= W32.to_sint a && to_sint a < b)
  axiomatized by bpos32E.

op pos_bound768_cxq_32 (coefs : W32.t Array768.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos32 coefs.[k] (c * q).

op pos_bound768_b_32 (coefs : W32.t Array768.t) (l u b : int) : bool =
  forall (k : int), l <= k < u => bpos32 coefs.[k] b.

lemma to_sint_unsigned32 : forall (x : W32.t), 
    0 <= to_sint x =>
    to_sint x = to_uint x.
proof.
  move => x; rewrite W32.to_sintE /smod.
  move : (W32.to_uint_cmp x) => /> ? ?.
  by case (2147483648 <= to_uint x) => ? // /#. 
qed.

(* END AUX *)

lemma polyvec_topolys_corr_h ap ab pv' :
      hoare[ M.polyvec_topolys :
           pv = pv' /\ ap = lift_array768 pv /\
           signed_bound768_cxq pv 0 768 ab 
           ==>
           signed_bound_cxq res.`1 0 256 ab /\ 
           signed_bound_cxq res.`2 0 256 ab /\ 
           signed_bound_cxq res.`3 0 256 ab /\ 
           (forall k, 0 <= k < 256 => res.`1.[k] = pv'.[k]) /\
           (forall k, 0 <= k < 256 => res.`2.[k] = pv'.[k+256]) /\
           (forall k, 0 <= k < 256 => res.`3.[k] = pv'.[k+512]) /\
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`1.[k]) = ap.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`2.[k]) = ap.[256+k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`3.[k]) = ap.[512+k])]. 
proof.
  proc. 
  while ((forall k, 0 <= k < to_uint i => r2.[k] = pv.[k + 512]) /\ 
          0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 512).
  + wp; skip => /> &hr; rewrite /(\ult) /= => *.
    by rewrite !to_uintD_small /= 1,2:/#; smt (Array256.get_setE).
  wp; while ((forall k, 0 <= k < to_uint i => r1.[k] = pv.[k + 256]) /\ 
              0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 256).
  + wp; skip => /> &hr; rewrite /(\ult) /= => *.
    by rewrite !to_uintD_small /= 1,2:/#; smt (Array256.get_setE).
  wp; while ((forall k, 0 <= k < to_uint i => r0.[k] = pv.[k]) /\
              0 <= to_uint i <= 256).
  + wp; skip => /> &hr; rewrite /(\ult) /= => *.
    by rewrite to_uintD_small /= 1:/#; smt (Array256.get_setE).
  wp; skip => /> => &hr; rewrite /(\ult) /=. 
  smt (lift_array768_inFq).
qed.

lemma polyvec_topolys_ll  :
      islossless M.polyvec_topolys.
proof.
admitted.

lemma polyvec_topolys_corr ap ab pv' :
      phoare[ M.polyvec_topolys :
           pv = pv' /\ ap = lift_array768 pv /\
           signed_bound768_cxq pv 0 768 ab 
           ==>
           signed_bound_cxq res.`1 0 256 ab /\ 
           signed_bound_cxq res.`2 0 256 ab /\ 
           signed_bound_cxq res.`3 0 256 ab /\ 
           (forall k, 0 <= k < 256 => res.`1.[k] = pv'.[k]) /\
           (forall k, 0 <= k < 256 => res.`2.[k] = pv'.[k+256]) /\
           (forall k, 0 <= k < 256 => res.`3.[k] = pv'.[k+512]) /\
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`1.[k]) = ap.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`2.[k]) = ap.[256+k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`3.[k]) = ap.[512+k])] = 1%r 
by conseq polyvec_topolys_ll (polyvec_topolys_corr_h ap ab pv').
 
lemma polyvec_frompolys_corr_h _p0 _p1 _p2 a1p a2p a3p ab :
      hoare[ M.polyvec_frompolys :
           a1p = lift_array256 p0 /\
           signed_bound_cxq p0 0 256 ab /\
           a2p = lift_array256 p1 /\
           signed_bound_cxq p1 0 256 ab /\
           a3p = lift_array256 p2 /\
           signed_bound_cxq p2 0 256 ab /\
           _p0 = p0 /\ _p1 = p1 /\ _p2 = p2
           ==>
           signed_bound768_cxq res 0 768 ab /\ 
           (forall k, 0 <= k < 256 => res.[k] = _p0.[k]) /\
           (forall k, 0 <= k < 256 => res.[k+256] = _p1.[k]) /\
           (forall k, 0 <= k < 256 => res.[k+512] = _p2.[k]) /\
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = a1p.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k+256]) = a2p.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k+512]) = a3p.[k])].
proof.
  proc; while ((forall k, 0 <= k < 256 => r.[k] = p0.[k]) /\ 
                (forall k, 0 <= k < 256 => r.[k+256] = p1.[k]) /\ 
                (forall k, 0 <= k < to_uint i => r.[k+512] = p2.[k]) /\ 
                0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 512).
    wp; skip => /> &hr; rewrite /(\ult) /= => *. 
    rewrite !to_uintD_small /= 1,2:/#;smt(get_setE).
  wp; while ((forall k, 0 <= k < 256 => r.[k] = p0.[k]) /\ 
                (forall k, 0 <= k < to_uint i => r.[k+256] = p1.[k]) /\ 
                0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 256).
    wp; skip => /> &hr; rewrite /(\ult) /= => *.
    rewrite !to_uintD_small /= 1,2:/#; smt(get_setE).
  wp; while ((forall k, 0 <= k < to_uint i => r.[k] = p0.[k]) /\ 0 <= to_uint i <= 256).
    wp; skip => /> &hr; rewrite /(\ult) /= => *.
    rewrite to_uintD_small 1:/#; smt(get_setE).
  wp; skip => /> *; rewrite /(\ult) /= => *.
  do split => //. smt(). 
  move => *.
  do split => //. smt(). smt().
  move => *. 
  do split => //.  smt().  smt(). 
  move => *. 
  do split => //; first last.  
  smt().  
  smt (lift_array256_inFq).
  smt (lift_array256_inFq).
  smt (lift_array256_inFq).
  rewrite /signed_bound768_cxq => k *.
  case (0 <= k < 256). smt().
  case (256 <= k < 512). smt().
  smt().  
qed.

lemma polyvec_frompolys_ll  :
      islossless M.polyvec_frompolys.
admitted.

lemma polyvec_frompolys_corr _p0 _p1 _p2 a1p a2p a3p ab :
      phoare[ M.polyvec_frompolys :
           a1p = lift_array256 p0 /\
           signed_bound_cxq p0 0 256 ab /\
           a2p = lift_array256 p1 /\
           signed_bound_cxq p1 0 256 ab /\
           a3p = lift_array256 p2 /\
           signed_bound_cxq p2 0 256 ab /\
           _p0 = p0 /\ _p1 = p1 /\ _p2 = p2
           ==>
           signed_bound768_cxq res 0 768 ab /\ 
           (forall k, 0 <= k < 256 => res.[k] = _p0.[k]) /\
           (forall k, 0 <= k < 256 => res.[k+256] = _p1.[k]) /\
           (forall k, 0 <= k < 256 => res.[k+512] = _p2.[k]) /\
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = a1p.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k+256]) = a2p.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k+512]) = a3p.[k])]  = 1%r 
by conseq polyvec_frompolys_ll (polyvec_frompolys_corr_h _p0 _p1 _p2 a1p a2p a3p ab).
 
lemma polyvec_csubq_corr ap :
      hoare[ M.polyvec_csubq :
           ap = lift_array768 r /\
           pos_bound768_cxq r 0 768 2 
           ==>
           ap = lift_array768 res /\
           pos_bound768_cxq res 0 768 1 ] . 
proof.
  move => *; proc; sp. 
  ecall (polyvec_frompolys_corr_h r0 r1 r2
                               (Array256.of_list witness (sub ap 0 256)) 
                               (Array256.of_list witness (sub ap 256 256)) 
                               (Array256.of_list witness (sub ap 512 256)) 1).
  ecall (poly_csubq_corr_h (Array256.of_list witness (sub ap 512 256))).
  ecall (poly_csubq_corr_h (Array256.of_list witness (sub ap 256 256))).
  ecall (poly_csubq_corr_h (Array256.of_list witness (sub ap 0 256))).
  ecall (polyvec_topolys_corr_h ap 2 r); skip => />.
  move=> &hr H. 
  split; 1: smt().
  move=> H0 result H1 H2 H3 H4 H5 H6 H7 H8 H9; split; 1:smt(lift_array256_sub_768).
  move=> H10 H11 result0 H12 H13; split; 1:smt(lift_array256_sub_768).
  move=> H14 H15 result1 H16 H17; split; 1:smt(lift_array256_sub_768).
  move=> H18 H19 result2 H20 H21; split; 1:smt().
  move=> H22 H23 H24 result3 H25 H26 H27 H28 H29 H30 H31; split; 1:smt(lift_array768_eq).
  rewrite /pos_bound768_cxq => k *.
  case (0 <= k < 256). smt().
  case (256 <= k < 512).
  move => *. pose kp := k - 256.
   have -> : result3.[k] = result3.[kp + 256]; 1: smt().
    rewrite (H27 kp _); smt().
  move => *. pose kp := k - 512.
   have -> : result3.[k] = result3.[kp + 512]; 1: smt().
    rewrite (H28 kp _); smt().
qed.

lemma formula_polyvec x : 
  0 <= x < 3329 =>
  (x * 1024 + 1665) * (4294967296 %/ 3329) %% 18446744073709551616 %/ 4294967296 %% 1024 =
  (x * 1024 + 1664) %/ 3329 %% 1024.
proof.
move=> /mem_range.
have :  
   (all
     (fun x => (x * 1024 + 1665) * (4294967296 %/ 3329) %% 18446744073709551616 %/ 4294967296 %% 1024 =
               (x * 1024 + 1664) %/ 3329 %% 1024)
     (range 0 3329)).
by move=> />.
by rewrite allP => H /H /={H}.
qed.

lemma compressimpl64 (a : W16.t) :
  bpos16 a q =>
  inFq
  (to_sint (truncateu16
         ((((zeroextu64 a `<<` (of_int 10)%W8) + (of_int 1665)%W64) * (of_int 1290167)%W64 `>>`
           (of_int 32)%W8) `&`
          (of_int 1023)%W64))) = compress 10 (inFq (to_sint a)).
proof.
rewrite /zeroextu64 /truncateu16 -compress_alt_compress; 1..2 : smt(). 
rewrite /compress_alt qE => /> *.
rewrite (_: W64.of_int 1023 = W64.masklsb 10); first by rewrite /max /=.
rewrite W64.and_mod 1:// /max /= !W64.of_uintK to_sintE /(`<<`) /(`>>`) W64.shlMP 1:/#.
rewrite W64.to_uint_shr 1:/# W16.of_uintK; congr.
rewrite inFqK to_sintE qE /=.
rewrite IntDiv.pmod_small /= 1:/#.
rewrite IntDiv.pmod_small /= 1:/#. 
rewrite (IntDiv.pmod_small _ 3329) /= 1:/#.
rewrite (_: W16.smod (to_uint a) = to_uint a); 1:smt(@W16).
pose xx := (to_uint a * 1024 + 1665).
rewrite W64.of_uintK => />.
pose yy := xx * 1290167 %% 18446744073709551616 %/ 4294967296 %% 1024.
have ? : (0 <= yy < 2^16) by smt(@W16).
rewrite (_: W16.smod yy = yy). 
+ by rewrite /smod /= /#.
rewrite /yy (_: 1290167 = 4294967296 %/ 3329) 1://.
rewrite /xx formula_polyvec 2://.
by rewrite -to_sint_unsigned.
qed.

lemma compress_rng (a : W16.t) :
  bpos16 a q =>
  0 <= to_sint (truncateu16
         ((((zeroextu64 a `<<` (of_int 10)%W8) + (of_int 1665)%W64) * (of_int 1290167)%W64 `>>`
           (of_int 32)%W8) `&`
          (of_int 1023)%W64)) < 1024.
proof.
rewrite to_sintE => /> *.
rewrite (_: W64.of_int 1023 = W64.masklsb 10); first by rewrite /max /=.
rewrite W64.and_mod => />. 
pose xx := (W64.of_int
             (to_uint
                (((zeroextu64 a `<<` (of_int 10)%W8) + (of_int 1665)%W64) * (of_int 1290167)%W64 `>>` (of_int 32)%W8) %%
              1024)).
have ? : 0<= to_uint xx < 1024 by smt(@W64).
have ? : 0<= to_uint (truncateu16 xx) < 1024.
+ rewrite /truncateu16; smt(@W16 @W64).
by rewrite /max /smod /=;  smt(@W16).
qed.

lemma polyvec_compress_corr mem _p _a :
    equiv [ M.polyvec_compress ~ EncDec.encode10_vec :
             pos_bound768_cxq a{1} 0 768 2 /\
             lift_array768 a{1} = _a /\
             u{2}.[0] = compress_poly 10 (Array256.of_list witness (sub _a 0 256)) /\
             u{2}.[1] = compress_poly 10 (Array256.of_list witness (sub _a 256 256)) /\
             u{2}.[2] = compress_poly 10 (Array256.of_list witness (sub _a 512 256)) /\
             valid_range W8 Glob.mem{1} _p (3*320) /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             touches mem Glob.mem{1} _p (3*320) /\
             load_array320 Glob.mem{1} _p = res{2}.[0] /\
             load_array320 Glob.mem{1} (_p + 320) = res{2}.[1] /\
             load_array320 Glob.mem{1} (_p + 640) = res{2}.[2]
              ].
admitted.
(*
proof.
proc.
while (#pre /\ 0 <= to_uint i <= 768 + 3 /\ to_uint i %% 4 = 0 /\ 
        ap = lift_array768 aa /\ pos_bound768_cxq aa 0 768 1 /\
        (forall k,
          0 <= k < to_uint i =>
           inFq (W16.to_sint r.[k]) = PolyVec.roundc ap.[k]) /\ 
        (forall k,
            0<= k < to_uint i => 0 <= to_sint r.[k] < 1024)).
+ unroll for ^while; wp; skip => />;rewrite /(\ult) /= => &hr H H0 H1 H2 H3 H4 H5 H6 H7.
  rewrite !to_uintD_small /= 1..4:/# andbA; split; 1:smt().
  split; move => k [#] *.
  move : (H5 k).
  rewrite H3 !lift_array768E; 1: smt(). 
  rewrite -roundcimpl64; 1: smt(). 
  case (0 <= k && k < to_uint i{hr}) => /> *. 
  rewrite !get_setE; 1..4: smt().
  by smt().
  rewrite !get_setE; 1..4: smt().
  by smt().
  rewrite !get_setE; 1..4: smt().
  smt(roundcimpl_rng get_setE).
call (polyvec_csubq_corr ap). 
wp; skip => /> *; split; 1: smt().
rewrite /(\ult) /= => i0 r0 *; split; 2: smt().
rewrite tP => j *; rewrite mapiE //; smt(@Array768).
qed.
*)

(******************************************************)
(* FIXME: this is a dirty hack, it should be defined like that in KyberPoly *)
lemma poly_add_corr (_a _b : Fq Array256.t) (ab bb : int) :
    hoare[ Jindcpa.M.poly_add2 :
           (0 <= ab <= 6 /\ 0 <= bb <= 3) /\

            _a = lift_array256 rp /\
            _b = lift_array256 bp /\ signed_bound_cxq rp 0 256 ab /\ signed_bound_cxq bp 0 256 bb ==>
            signed_bound_cxq res 0 256 (ab + bb) /\
            forall (k : int), 0 <= k && k < 256 => inFq (to_sint res.[k]) = _a.[k] + _b.[k]].
bypr => &m [[h1 h2] h].
byphoare (_ : _a = lift_array256 rp /\
            _b = lift_array256 bp /\ signed_bound_cxq rp 0 256 ab /\ signed_bound_cxq bp 0 256 bb ==>
            !(signed_bound_cxq res 0 256 (ab + bb) /\
              forall (k : int), 0 <= k && k < 256 => inFq (to_sint res.[k]) = _a.[k] + _b.[k]) ) => //.
hoare; apply (poly_add_corr _a _b ab bb h1 h2).
qed.

lemma poly_add_ll : islossless Jindcpa.M.poly_add2.
admitted. 
lemma poly_add_corr_ph (_a _b : Fq Array256.t) (ab bb : int) :
    phoare[ Jindcpa.M.poly_add2 :
           (0 <= ab <= 6 /\ 0 <= bb <= 3) /\

            _a = lift_array256 rp /\
            _b = lift_array256 bp /\ signed_bound_cxq rp 0 256 ab /\ signed_bound_cxq bp 0 256 bb ==>
            signed_bound_cxq res 0 256 (ab + bb) /\
            forall (k : int), 0 <= k && k < 256 => inFq (to_sint res.[k]) = _a.[k] + _b.[k]] = 1%r 
by conseq poly_add_ll (poly_add_corr  _a _b ab bb).

(*******)

lemma polyvec_add_corr_h _a _b ab bb :
      hoare[ M.polyvec_add2 :
            0 <= ab <= 6 /\ 0 <= bb <= 3 /\
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb 
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\ 
           forall k, 0 <= k < 768 =>
              inFq (to_sint res.[k]) = _a.[k] + _b.[k]]. 
proof.
proc.
ecall (polyvec_frompolys_corr_h r0 r1 r2 (lift_array256 r0) (lift_array256 r1) (lift_array256 r2) (ab + bb)).
ecall (poly_add_corr (lift_array256 r2) (lift_array256 b2) ab bb).
ecall (poly_add_corr (lift_array256 r1) (lift_array256 b1) ab bb).
ecall (poly_add_corr (lift_array256 r0) (lift_array256 b0) ab bb).
ecall (polyvec_topolys_corr_h _b bb b).
ecall (polyvec_topolys_corr_h _a ab r).
wp; skip => />.
move => &hr ?????????? H11 H12 H13 H14 H15 H16????????? ?? H17 H18 ?  H19 H20 ? H21 ?? H22 H23 H24 H25 H26?? k??.
case (0 <= k < 256).
by smt(@Array768 @Array256).
case (256 <= k < 512).
move => *. 
pose kp := k - 256.
have -> : k = kp + 256; 1:  smt().
rewrite H24; 1: smt(). 
by smt(@Array768 @Array256).
move => *. 
pose kp := k - 512.
have -> : k = kp + 512; 1:  smt().
rewrite H25; 1: smt(). 
by smt(@Array768 @Array256).
qed.

lemma polyvec_add_ll  :
      islossless M.polyvec_add2.
admitted.

lemma polyvec_add_corr  _a _b ab bb:
   phoare[ M.polyvec_add2 :
            0 <= ab <= 6 /\ 0 <= bb <= 3 /\
           _a = lift_array768 r /\
           _b = lift_array768 b /\
           signed_bound768_cxq r 0 768 ab /\
           signed_bound768_cxq b 0 768 bb 
           ==>
           signed_bound768_cxq res 0 768 (ab + bb) /\ 
           forall k, 0 <= k < 768 =>
              inFq (to_sint res.[k]) = _a.[k] + _b.[k] ]  = 1%r 
by conseq polyvec_add_ll (polyvec_add_corr_h  _a _b ab bb).


(******************************************************)

lemma polyvec_topolys_corr_aux ap pv' :
      hoare[ M.polyvec_topolys :
           pv = pv' /\ ap = lift_array768 pv
           ==>
           (forall k, 0 <= k < 256 => res.`1.[k] = pv'.[k]) /\
           (forall k, 0 <= k < 256 => res.`2.[k] = pv'.[k+256]) /\
           (forall k, 0 <= k < 256 => res.`3.[k] = pv'.[k+512]) /\
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`1.[k]) = ap.[k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`2.[k]) = ap.[256+k]) /\ 
           (forall k, 0 <= k < 256 =>
              inFq (to_sint res.`3.[k]) = ap.[512+k])]. 
proof.
  proc.
  while ((forall k, 0 <= k < to_uint i => r2.[k] = pv.[k + 512]) /\ 
                0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 512).
  + wp; skip => /> &hr; rewrite /(\ult) /= => *.
    rewrite !to_uintD_small /= 1,2:/# => *; smt(Array256.get_setE).
  wp; while ((forall k, 0 <= k < to_uint i => r1.[k] = pv.[k + 256]) /\ 
              0 <= to_uint i <= 256 /\ to_uint j - to_uint i = 256).
    wp; skip => /> &hr; rewrite /(\ult) /= => *. 
    rewrite !to_uintD_small /= 1,2:/#; smt(Array256.get_setE).
  wp; while ((forall k, 0 <= k < to_uint i => r0.[k] = pv.[k]) /\
              0 <= to_uint i <= 256).
    wp; skip => /> &hr; rewrite /(\ult) /= => *. 
    rewrite to_uintD_small /= 1:/#; smt(Array256.get_setE).
  wp; skip => /> => *; rewrite /(\ult) /=; smt (lift_array768_inFq).
qed.

lemma polyvec_reduce_corr_h _a :
      hoare[ M.polyvec_reduce :
          _a = lift_array768 r ==> 
          _a = lift_array768 res /\
          forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)].
proof.
proc.
ecall (polyvec_frompolys_corr_h r0 r1 r2 (lift_array256 r0) (lift_array256 r1) (lift_array256 r2) 2).
ecall (poly_reduce_corr_h (lift_array256 r2)).
ecall (poly_reduce_corr_h (lift_array256 r1)).
ecall (poly_reduce_corr_h (lift_array256 r0)).
ecall (polyvec_topolys_corr_aux _a r).
wp; skip => /> &hr ???? ????????????.
split; 1: by rewrite /signed_bound_cxq; smt (b16E).
move=> ?????H H0 H1 H2 H3 H4; split.
apply tP => k *.
rewrite /lift_array768 => *.
rewrite !Array768.mapiE //=.
case (0 <= k < 256). 
move => *; rewrite H; 1: smt(). 
smt(lift_array768_inFq lift_array256_inFq).
case (256 <= k < 512).
pose kp := k - 256.
have -> : k = kp + 256; 1: smt(). 
move => *; rewrite H0; 1: smt(). 
smt(lift_array768_inFq lift_array256_inFq).
smt(lift_array768_inFq lift_array256_inFq).
move => k *.
case (0 <= k < 256). 
move => *; rewrite H; 1: smt(). 
smt(lift_array768_inFq lift_array256_inFq).
case (256 <= k < 512).
pose kp := k - 256.
have -> : k = kp + 256; 1: smt(). 
move => *; rewrite H0; 1: smt(). 
smt(lift_array768_inFq lift_array256_inFq).
pose kp := k - 512.
have -> : k = kp + 512; 1: smt(). 
move => *; rewrite H1; 1: smt(). 
smt(lift_array768_inFq lift_array256_inFq).
qed.

lemma polyvec_reduce_ll  :
      islossless M.polyvec_reduce.
admitted.

lemma polyvec_reduce_corr  _a :
      phoare[ M.polyvec_reduce :
          _a = lift_array768 r ==> 
          _a = lift_array768 res /\
          forall k, 0 <= k < 768 => bpos16 res.[k] (2*q)]  = 1%r 
by conseq polyvec_reduce_ll (polyvec_reduce_corr_h  _a).

lemma polyvec_decompress_corr mem _p (_a : (W8.t Array320.t) Array3.t) :
    equiv [ M.polyvec_decompress ~ EncDec.decode10_vec :
             valid_range W8 Glob.mem{1} _p (3*320) /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array320 Glob.mem{1} _p = _a.[0] /\
             load_array320 Glob.mem{1} (_p + 320) = _a.[1] /\
             load_array320 Glob.mem{1} (_p + 640) = _a.[2]
              ==>
             lift_array256 (Array256.of_list witness (sub res{1} 0 256)) = decompress_poly 10 res{2}.[0] /\
             lift_array256 (Array256.of_list witness (sub res{1} 256 256)) = decompress_poly 10 res{2}.[1] /\
             lift_array256 (Array256.of_list witness (sub res{1} 512 256)) = decompress_poly 10 res{2}.[2] /\
             Glob.mem{1} = mem ].
admitted.
(*
while (#pre /\ 0 <= to_uint i <= 768 /\ to_uint i %% 4 = 0 /\
       forall k, 0 <= k < to_uint i => r.[k] = truncateu16 (((rp.[k] * W32.of_int 3329) + W32.of_int 512) `>>` 
                                               W8.of_int 10)).
 + exlim (to_uint i) => i0.
   while ((0 <= i0 && i0 < 768) /\ i0 %% 4 = 0 /\ to_uint i = i0 + k /\ 0 <= k <= 4 /\
          (forall z, k <= z < 5 => t.[z] = rp.[i0 + z]) /\
          forall k, 0 <= k < to_uint i => r.[k] = 
               truncateu16 (((rp.[k] * W32.of_int 3329) + W32.of_int 512) `>>` W8.of_int 10)).
   + auto => /> &hr *.
     by rewrite to_uintD_small /= 1:/#; smt (Array5.get_setE Array768.get_setE). 
   wp; while ((0 <= i0 && i0 < 768) /\ i0 %% 4 = 0 /\ to_uint i = i0 /\ 0 <= k <= 5 /\
           (forall z, 0 <= z < k=> t.[z] = rp.[i0 + z])).
   + auto => /> &hr; smt (Array5.get_setE).
   by auto => /> &hr; rewrite ultE /= /#.

wp; skip => /> &hr H; split; 1: smt().
rewrite /(\ult) /= => i0 r0 4?.
have -> hr0 : to_uint i0 = 768 by smt().
have h : forall k, 0 <= k && k < 768 => 
  to_sint r0.[k] = ((to_sint rp{hr}.[k] %% 3329 * 3329 + 512) %/ 2 ^ 10).
+ move=> k hk; rewrite hr0 1://.
  move: (H k hk); rewrite bpos32E => /> *.
  have heq : to_uint (rp{hr}.[k] * W32.of_int 3329) = to_uint rp{hr}.[k] * 3329.
  + by rewrite to_uintM_small /=; smt(to_sint_unsigned32).
  have heq1 : to_uint (rp{hr}.[k] * W32.of_int 3329 + W32.of_int 512) = 
              to_uint rp{hr}.[k] * 3329 + 512.
  + rewrite to_uintD_small /=; smt(to_sint_unsigned32).
  pose X := (W2u16.truncateu16 _).
  have heq2 : to_uint X = (to_sint rp{hr}.[k] %% 3329 * 3329 + 512) %/ 2 ^ 10.
  + rewrite to_uint_truncateu16 shr_div_le // /=. 
    rewrite heq1; smt(to_sint_unsigned32).
  rewrite (W16.to_sintE X) /smod /=.
  have -> /=: !(32768 <= to_uint X). 
  + rewrite heq2 /=; smt(to_sint_unsigned32).
  by rewrite heq2.
split.
+ apply Array768.tP => k hk.
  by rewrite /lift_array768 !mapiE 1..3:// /= PolyVec.unroundcE inFqK qE h.
move=> k hk; rewrite b16E h 1:// /= qE. 
by move: (H k hk); rewrite bpos32E /#.
qed.*)

require import Jindcpa.


lemma polyvec_ntt_correct_h _r:
   hoare[ M.polyvec_ntt :
        _r = r /\
        signed_bound768_cxq r 0 768 2
          ==> 
            nttv (lift_vector _r) = lift_vector res /\
            pos_bound768_cxq res 0 768 2 ].
proof.
proc.
ecall (polyvec_frompolys_corr_h r0 r1 r2 (lift_array256 r0) (lift_array256 r1) (lift_array256 r2) 2).
ecall (ntt_correct_h (lift_array256 r2)).
ecall (ntt_correct_h (lift_array256 r1)).
ecall (ntt_correct_h (lift_array256 r0)).
ecall (polyvec_topolys_corr_h (lift_array768 _r) 2 r).
wp; skip => /> &hr ? result 5? H1 H2 H3 ? H4 ? ? H5 ? ? H6 ?.
split.
 + rewrite /signed_bound_cxq=> />; do split; smt(b16E). 
move=>5? H7 H8 H9 H10 H11 H12; split.
+ rewrite /nttv /lift_vector /mapv offunvK /vclamp /= eq_vectorP => i ib. 
  rewrite !offunvE //= ib /= tP /= => k kb.
case (i = 0).
move => ->.
rewrite /lift_polyvec /= initiE 1:// /= H10 1:// -H4.
  congr; congr.
  apply Array256.tP => j hj.
  smt(@Array256 @Array768).
move => *.
case (i = 1).
move => ->.
rewrite /lift_polyvec /= initiE 1:// /= addzC H11 1:// -H5.
  congr; congr.
  apply Array256.tP => j hj.
  smt(@Array256 @Array768).
case (i = 2).
move => ->.
rewrite /lift_polyvec /= initiE 1:// /= addzC H12 1:// -H6.
  congr; congr.
  apply Array256.tP => j hj.
  smt(@Array256 @Array768).
smt().
rewrite /pos_bound768_cxq.
move => k *.
case (0 <= k < 256).
 smt (bpos16E). 
case (256 <= k < 512).
move => *.
pose kp := k - 256.
have -> : k = kp + 256; 1: smt().
rewrite H8; 1: smt().
 smt (bpos16E). 
case (512 <= k < 768).
move => *.
pose kp := k - 512.
have -> : k = kp + 512; 1: smt().
rewrite H9; 1: smt().
 smt (bpos16E). 
 smt (). 
qed.

lemma polyvec_ntt_ll  :
      islossless M.polyvec_ntt.
admitted.

lemma polyvec_ntt_corr _r:
   phoare[ M.polyvec_ntt :
        _r = r /\
        signed_bound768_cxq r 0 768 2
          ==> 
            nttv (lift_vector _r) = lift_vector res /\
            pos_bound768_cxq res 0 768 2 ]  = 1%r 
by conseq polyvec_ntt_ll (polyvec_ntt_correct_h _r).

lemma polyvec_invntt_correct_h _r:
   hoare[ M.polyvec_invntt :
        _r = r /\
        signed_bound768_cxq r 0 768 2
          ==> 
            scale_vector (invnttv (lift_vector _r)) (inFq Fq.SignedReductions.R) = lift_vector res /\
            forall (k : int), 0 <= k && k < 768 => b16 res.[k] (q + 1) ].
proof.
proc.
ecall (polyvec_frompolys_corr_h r0 r1 r2 (lift_array256 r0) (lift_array256 r1) (lift_array256 r2) 2).
ecall (invntt_correct_h (lift_array256 r2)).
ecall (invntt_correct_h (lift_array256 r1)).
ecall (invntt_correct_h (lift_array256 r0)).
ecall (polyvec_topolys_corr_h (lift_array768 _r) 2 r).
wp; skip => /> &hr ? result 8? result0 h0 ? result1 h1 ? result2 h2 ?.
split. do split; smt (b16E qE).
move=> 5? H1 H2 H3 H4 H5 H6. 
split.
+ rewrite /scale_vector /invnttv /lift_vector /mapv offunvK /vclamp /= eq_vectorP => i ib. 
  rewrite !offunvE //= ib /= tP /= => k kb.
case (i = 0).
move => i0.
rewrite i0 /lift_polyvec /= initiE 1:// /= offunvK /vclamp /kvec /= H1 1://.
move : h0; rewrite tP /lift_array256 !mapE /= => h0.
move : (h0 k kb); rewrite initiE //= => <-. 
congr; congr; congr.
rewrite tP => kk kkb.
by rewrite !initiE //=; smt().
case (i = 1).
move => i1.
rewrite i1 /lift_polyvec /= initiE 1:// /= offunvK /vclamp /kvec /= addrC  H2 1://.
move : h1; rewrite tP /lift_array256 !mapE /= => h1.
move : (h1 k kb); rewrite initiE //= => <-. 
congr; congr; congr.
rewrite tP => kk kkb.
by rewrite !initiE //=; smt().
case (i = 2).
move => i2.
rewrite i2 /lift_polyvec /= initiE 1:// /= offunvK /vclamp /kvec /= addrC  H3 1://.
move : h2; rewrite tP /lift_array256 !mapE /= => h2.
move : (h2 k kb); rewrite initiE //= => <-. 
congr; congr; congr.
rewrite tP => kk kkb.
by rewrite !initiE //=; smt().
smt().

move => k *.
case (0 <= k < 256).
 smt (). 
case (256 <= k < 512).
move => *.
pose kp := k - 256.
have -> : k = kp + 256; 1: smt().
rewrite H2; 1: smt().
 smt (). 
case (512 <= k < 768).
move => *.
pose kp := k - 512.
have -> : k = kp + 512; 1: smt().
rewrite H3; 1: smt().
 smt (). 
 smt (). 
qed.

lemma polyvec_invntt_ll  :
      islossless M.polyvec_invntt.
admitted.

lemma polyvec_invntt_corr _r:
   phoare[ M.polyvec_invntt :
        _r = r /\
        signed_bound768_cxq r 0 768 2
          ==> 
            scale_vector (invnttv (lift_vector _r)) (inFq Fq.SignedReductions.R) = lift_vector res /\
            forall (k : int), 0 <= k && k < 768 => b16 res.[k] (q + 1) ]  = 1%r   
   by conseq polyvec_invntt_ll (polyvec_invntt_correct_h _r).


lemma polyvec_pointwise_acc_corr_h _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 (_r : Fq Array256.t) :
  _p0 = scale (basemul _a0 _b0) (inFq 169) =>
  _p1 = scale (basemul _a1 _b1) (inFq 169) =>
  _p2 = scale (basemul _a2 _b2) (inFq 169) =>
  (forall k, 0 <=  k < 256 =>
     _r.[k] = _p0.[k] + _p1.[k] + _p2.[k])  =>
  hoare [ M.polyvec_pointwise_acc : 
    _a0 = lift_polyvec a 0 /\
    _a1 = lift_polyvec a 1 /\
    _a2 = lift_polyvec a 2 /\
    _b0 = lift_polyvec b 0 /\
    _b1 = lift_polyvec b 1 /\
    _b2 = lift_polyvec b 2 /\
    signed_bound768_cxq a 0 768 2 /\ 
    signed_bound768_cxq b  0 768 2 
     ==> 
    lift_array256 res =  _r /\
    forall (k : int), 0 <= k && k < 256 => 
        bpos16 res.[k] (2 * q)
  ].
proof.
move => *.
proc.
ecall (poly_reduce_corr_h (lift_array256 r)).
ecall (poly_add_corr (lift_array256 r) _p2 6 3).
call (poly_basemul_corr _a2 _b2).
call (poly_add_corr _p0 _p1 3 3).
call (poly_basemul_corr _a1 _b1).
call (poly_basemul_corr _a0 _b0).
ecall (polyvec_topolys_corr_h (lift_array768 b) 2 b).
ecall (polyvec_topolys_corr_h (lift_array768 a) 2 a).
wp; skip; subst => /> &hr /> ??????????????????????.
split.
+ rewrite /lift_polyvec /lift_array256 mapE //.
  split; apply Array256.ext_eq; smt(Array256.initiE). 
move=> ??result1 ??;split.
+ rewrite /lift_polyvec /lift_array256 mapE. 
  split; apply Array256.ext_eq; smt(Array256.initiE).
move=> ??result2??; split. 
split. 
+ move : (basemul_scales (lift_polyvec a{hr} 0) (lift_polyvec b{hr} 0) (lift_array256 result1)).
  smt().
+ move : (basemul_scales (lift_polyvec a{hr} 1) (lift_polyvec b{hr} 1) (lift_array256 result2)).
  smt().  
move=> ?? result3 ??; split.
+ rewrite /lift_polyvec /lift_array256 mapE. 
  split; apply Array256.ext_eq; smt(Array256.initiE).
move=> ?? result4 ??; split.
+ move : (basemul_scales (lift_polyvec a{hr} 2) (lift_polyvec b{hr} 2) (lift_array256 result4)).
  smt().
move=> *; apply Array256.ext_eq; smt(@Array256).
qed.

lemma polyvec_pointwise_acc_ll  :
      islossless M.polyvec_pointwise_acc.
admitted.

lemma polyvec_pointwise_acc_corr _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 (_r : Fq Array256.t) :
  _p0 = scale (basemul _a0 _b0) (inFq 169) =>
  _p1 = scale (basemul _a1 _b1) (inFq 169) =>
  _p2 = scale (basemul _a2 _b2) (inFq 169) =>
  (forall k, 0 <=  k < 256 =>
     _r.[k] = _p0.[k] + _p1.[k] + _p2.[k])  =>
  phoare [ M.polyvec_pointwise_acc : 
    _a0 = lift_polyvec a 0 /\
    _a1 = lift_polyvec a 1 /\
    _a2 = lift_polyvec a 2 /\
    _b0 = lift_polyvec b 0 /\
    _b1 = lift_polyvec b 1 /\
    _b2 = lift_polyvec b 2 /\
    signed_bound768_cxq a 0 768 2 /\ 
    signed_bound768_cxq b  0 768 2 
     ==> 
    lift_array256 res =  _r /\
    forall (k : int), 0 <= k && k < 256 => 
        bpos16 res.[k] (2 * q)
  ]  = 1%r by
move => *;conseq polyvec_pointwise_acc_ll (polyvec_pointwise_acc_corr_h _a0 _a1 _a2 _b0 _b1 _b2 _p0 _p1 _p2 _r _ _ _ _) => //.

lemma polyvec_tobytes_corr mem _p _a :
    equiv [ M.polyvec_tobytes ~ EncDec.encode12_vec :
             pos_bound768_cxq a{1} 0 768 2 /\
             lift_array768 a{1} = _a /\
             u{2}.[0] = Array256.of_list witness (sub _a 0 256) /\
             u{2}.[1] = Array256.of_list witness (sub _a 256 256) /\
             u{2}.[2] = Array256.of_list witness (sub _a 512 256) /\
             valid_range W8 Glob.mem{1} _p (3*384) /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             touches mem Glob.mem{1} _p (3*384) /\
             load_array384 Glob.mem{1} _p = res{2}.[0] /\
             load_array384 Glob.mem{1} (_p + 384) = res{2}.[1] /\
             load_array384 Glob.mem{1} (_p + 768) = res{2}.[2]
              ].
admitted.

lemma polyvec_frombytes_corr mem _p (_a : (W8.t Array384.t) Array3.t) :
    equiv [ M.polyvec_frombytes ~ EncDec.decode12_vec :
             valid_range W8 Glob.mem{1} _p (3*384) /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array384 Glob.mem{1} _p = _a.[0] /\
             load_array384 Glob.mem{1} (_p + 384) = _a.[1] /\
             load_array384 Glob.mem{1} (_p + 768) = _a.[2]
              ==>
             lift_array256 (Array256.of_list witness (sub res{1} 0 384)) = res{2}.[0] /\
             lift_array256 (Array256.of_list witness (sub res{1} 384 384)) = res{2}.[1] /\
             lift_array256 (Array256.of_list witness (sub res{1} 768 384)) = res{2}.[2] /\
             Glob.mem{1} = mem ].
admitted.


lemma polyvec_pointwise_acc_corr_alg_h va vb :
  hoare [ M.polyvec_pointwise_acc :
    nttv va = lift_vector a /\
    nttv vb = lift_vector b /\
    signed_bound768_cxq a 0 768 2 /\
    signed_bound768_cxq b 0 768 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = scale (ntt (dotp va vb)) (inFq 169)  ].
proof.
 move : (polyvec_pointwise_acc_corr_h (ntt va.[0]) (ntt va.[1]) 
               (ntt va.[2]) (ntt vb.[0]) (ntt vb.[1]) (ntt vb.[2]) 
          (scale (basemul (ntt va.[0]) (ntt vb.[0])) (inFq 169))
          (scale (basemul (ntt va.[1]) (ntt vb.[1])) (inFq 169))
          (scale (basemul (ntt va.[2]) (ntt vb.[2])) (inFq 169))
          ((scale (basemul (ntt va.[0]) (ntt vb.[0])) (inFq 169)) &+
           (scale (basemul (ntt va.[1]) (ntt vb.[1])) (inFq 169)) &+
           (scale (basemul (ntt va.[2]) (ntt vb.[2])) (inFq 169)))   _ _ _ _) => //=.
by move => k; rewrite /(&+) map2E map2E /= initE /= initE //= /#.
move => H; conseq (H).
move => &hr.
rewrite /nttv /lift_vector /lift_polyvec  => />  H0 H1 H2 H3.
move : H0 H1; rewrite !eq_vectorP => /> H0 H1. 
do split.
by move : (H0 0 _) => //; rewrite !offunvE => />.
by move : (H0 1 _) => //; rewrite !offunvE => />.
by move : (H0 2 _) => //; rewrite !offunvE => />.
by move : (H1 0 _) => //; rewrite !offunvE => />.
by move : (H1 1 _) => //; rewrite !offunvE => />.
by move : (H1 2 _) => //; rewrite !offunvE => />.
move => &hr [#] H0 H1 H2 H3 result H4.
move : H4 =>  [# H4 H5].
split; first by rewrite /signed_bound_cxq; smt().
rewrite H4 /dotp  /kvec //=.
rewrite !Big.BAdd.big_consT //= Big.BAdd.big_nil //=. 
rewrite /scale !add_comm_ntt !mul_comm_ntt.  
apply Array256.ext_eq => x xb.
rewrite !mapE   => />.
rewrite /(&+) map2E //=  !initiE => />.
rewrite /(&+) map2E //=  !initiE => />.
rewrite /(&+) map2E //=  !initiE => />.
rewrite map2E //=  !initiE => />.
rewrite map2E //=  !initiE => />.
rewrite nttZero.
rewrite /Poly.zero createE !initiE => />.
rewrite /basemul.
by ring.
qed.

lemma polyvec_pointwise_acc_corr_alg va vb :
  phoare [ M.polyvec_pointwise_acc :
    nttv va = lift_vector a /\
    nttv vb = lift_vector b /\
    signed_bound768_cxq a 0 768 2 /\
    signed_bound768_cxq b 0 768 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = scale (ntt (dotp va vb)) (inFq 169)  ] = 1%r by
move => *;conseq polyvec_pointwise_acc_ll (polyvec_pointwise_acc_corr_alg_h va vb) => //.

module Aux = {
   proc inner_product(ai skpv : W16.t Array768.t) : W16.t Array256.t = {
        var polyi,r';
        polyi <@M.polyvec_pointwise_acc(ai,skpv);
        r' <@M.poly_frommont(polyi);
        return r';
   }
}.

lemma innerprod_corr_h va vb:
  hoare [ Aux.inner_product :
    nttv va = lift_vector ai /\
    nttv vb = lift_vector skpv /\
    signed_bound768_cxq ai 0 768 2 /\
    signed_bound768_cxq skpv 0 768 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = ntt (dotp va vb)  ].
proof.
proc.
seq 1 : (#pre /\
    signed_bound_cxq polyi 0 256 2 /\
    lift_array256 polyi =  scale (ntt (dotp va vb)) (inFq 169)
    ).
by call (polyvec_pointwise_acc_corr_alg_h va vb); auto => />.

ecall(poly_frommont_corr_h (map W16.to_sint polyi)).
skip => &hr.
move => /> VA VB AB BB  H H0 result.
rewrite (Array256.tP (Array256.map W16.to_sint result)
                         (map
        (fun (x : int) =>
           (Fq.SignedReductions.SREDC (x * (Fq.SignedReductions.R * (Fq.SignedReductions.R * Fq.SignedReductions.R ^ 0) %% q)%IntDiv)))
        (map W16.to_sint polyi{hr}))).
move => rval.

split.
rewrite /signed_bound_cxq qE => k kb => />.
move : (rval k kb); rewrite !mapiE /R => />.
rewrite qE (_: 65536 ^ 0 = 1); first by smt(@Int).
rewrite (_: 65536 * (65536 * 1) %% 3329 = 1353); first smt().
move => ->.
move : (Fq.SignedReductions.SREDCp_corr (to_sint polyi{hr}.[k] * 1353) _ _); rewrite qE /R => />.
by move : (H k kb); rewrite qE => />; smt(@W16).
by  smt(@W16).

move :H0; rewrite /lift_array256 /scale.
rewrite (Array256.tP (map (fun (x : W16.t) => inFq (to_sint x)) polyi{hr})
        (map (transpose Zq.( * ) (inFq 169)) (ntt (dotp va vb)))) => H0.
apply Array256.ext_eq => k kb.
move : (H0 k kb).
move : (rval k kb).
rewrite !mapiE /R => /> -> H1.
rewrite qE (_: 65536 ^ 0 = 1); first by smt(@Int).
rewrite (_: 65536 * (65536 * 1) %% 3329 = 1353); first smt().
move : (Fq.SignedReductions.SREDCp_corr (to_sint polyi{hr}.[k] * 1353) _ _); rewrite qE /R => />.
by move : (H k kb); rewrite qE => />; smt(@W16).
move => H2 H3 H4.
rewrite (_: inFq (Fq.SignedReductions.SREDC (to_sint polyi{hr}.[k] * 1353)) = inFq (to_sint polyi{hr}.[k] * 1353 * 169 %% 3329)); first by rewrite -H4 -qE -inFqK asintK.
rewrite -qE -(inFqK (to_sint polyi{hr}.[k] * 1353 * 169)) asintK  !inFqM H1.
rewrite (_: inFq 1353 = inFq (Fq.SignedReductions.R*Fq.SignedReductions.R)); first by  rewrite /R //= -eq_inFq; smt(qE).
rewrite inFqM. 
rewrite Zq.ComRing.mulrA.

rewrite (_:(ntt (dotp va vb)).[k] * inFq 169 * inFq Fq.SignedReductions.R * inFq Fq.SignedReductions.R * inFq 169
        =(ntt (dotp va vb)).[k] * (inFq Fq.SignedReductions.R * inFq 169) * (inFq Fq.SignedReductions.R * inFq 169)); first by ring.
rewrite  (_: inFq Fq.SignedReductions.R * inFq 169 = Zq.one); first by rewrite -inFqM; smt(@Zq Fq.SignedReductions.RRinv).
by ring.
qed.

lemma inner_product_ll  :
      islossless Aux.inner_product.
admitted.

lemma innerprod_corr va vb:
  phoare [ Aux.inner_product :
    nttv va = lift_vector ai /\
    nttv vb = lift_vector skpv /\
    signed_bound768_cxq ai 0 768 2 /\
    signed_bound768_cxq skpv 0 768 2
    ==> 
    signed_bound_cxq res 0 256 2 /\
    lift_array256  res = ntt (dotp va vb)  ]  = 1%r by
move => *;conseq inner_product_ll (innerprod_corr_h va vb) => //.

(* OPERATIONS OVER MATRICES *)

op lift_matrix( rows : W16.t Array768.t * W16.t Array768.t * W16.t Array768.t) : 
     matrix =
       Matrix.offunm (fun i j => 
        if i = 0
        then KyberPolyVec.lift_polyvec rows.`1 j
        else if i = 1
             then KyberPolyVec.lift_polyvec rows.`2 j
             else KyberPolyVec.lift_polyvec rows.`3 j).


end KyberPolyVec.

