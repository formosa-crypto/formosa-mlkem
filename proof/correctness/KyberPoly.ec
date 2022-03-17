require import AllCore List IntDiv CoreMap IntDiv Real Number.
from Jasmin require  import JModel JMemory.
require import IntDiv_extra Ring_extra W16extra Array32 Array320 Array256 Array128 Array384 Array1024.
require import Fq.
require import NTT_Fq.
require import Kyber.

hint simplify range_ltn, range_geq.

theory KyberPoly.

import Fq. 
import Zq.

import SignedReductions.

op lift_array256 (p : W16.t Array256.t) =
  Array256.map (fun x => inFq (W16.to_sint x)) p.

op lift_array128 (p : W16.t Array128.t) =
  Array128.map (fun x => inFq (W16.to_sint x)) p.
op signed_bound_cxq(coefs : W16.t Array256.t, l u c : int) : bool =
   forall k, l <= k < u => b16 coefs.[k] (c*q).

op minimum_residues(zetas : W16.t Array128.t) : bool =
   forall k, 0 <= k < 128 => bpos16  zetas.[k] q.

op pos_bound256_cxq (coefs : W16.t Array256.t) (l u c : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] (c * q).

op pos_bound256_b (coefs : W16.t Array256.t) (l u b : int) : bool =
  forall (k : int), l <= k < u => bpos16 coefs.[k] b.

op touches (m m' : global_mem_t) (p : address) (len : int) =
    forall i, !(0 <= i < len) => m'.[p + i] = m.[p + i].

op load_array32(m : global_mem_t, p : address) : W8.t Array32.t = 
      Array32.init (fun i => m.[p + i]).

op load_array128(m : global_mem_t, p : address) : W8.t Array128.t = 
      Array128.init (fun i => m.[p + i]).

op load_array320(m : global_mem_t, p : address) : W8.t Array320.t = 
      Array320.init (fun i => m.[p + i]).

op load_array384(m : global_mem_t, p : address) : W8.t Array384.t = 
      Array384.init (fun i => m.[p + i]).

op valid_ptr(p : int, o : int) = 0 <= o => 0 <= p /\ p + o < W64.modulus.

require import Jindcpa.

(* These are powers of roots of unit in Mont form and
   bitwise permuted indices  zetas inv above needs to be
   defined, this axiom discharged, and then used to
   discharge other axioms below. *)

op array_mont (p : Fq Array128.t) =
  Array128.map (fun x => x *  (inFq Fq.SignedReductions.R)) p.

op array_mont_inv (p : Fq Array128.t) =
  let vv = Array128.map (fun x => x *  (inFq Fq.SignedReductions.R)) p in
      vv.[127 <- p.[127] * (inFq Fq.SignedReductions.R) * (inFq Fq.SignedReductions.R)].

lemma zetas_invE : array_mont_inv NTT_Fq.zetas_inv = 
     Array128.map (fun x => inFq (W16.to_sint x)) jzetas_inv.
admitted. (* need to compute the values. checked in Sage *)

lemma zetasE : array_mont NTT_Fq.zetas = 
     Array128.map (fun x => inFq (W16.to_sint x)) jzetas.
admitted. (* need to compute the values. checked in Sage *)

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
      hoare[ M._poly_csubq :
           ap = lift_array256 rp /\ pos_bound256_cxq rp 0 256 2 
           ==>
           ap = lift_array256 res /\ pos_bound256_cxq res 0 256 1 ].
proof.
move => *;proc.

while (ap = lift_array256 rp /\ 
       pos_bound256_cxq rp 0 256 2 /\ 
       pos_bound256_cxq rp 0 (to_uint i) 1 /\ 
       0 <= to_uint i<=256); last by auto => /> &hr;
          rewrite /pos_bound256_cxq /lift_array256 /(\ult) /= /#.

auto => /> &hr;rewrite /pos_bound256_cxq /lift_array256 /(\ult) qE /=.
move => rbpre rbdone ibl ibh entry; rewrite tP !mapE.
do split. (* 5 goals *)
+ move => ii iib; rewrite !initiE //=.
  case(ii <> to_uint i{hr}); 
     1:  by move => prior; rewrite !set_neqiE; smt(). 
  move => current; rewrite set_eqiE /=; 1,2:smt(). 
  case(rp{hr}.[to_uint i{hr}] - W16.of_int 3329 \slt W16.zero).
  + move => H; rewrite (getsignNeg _ H) //=.
    have -> : rp{hr}.[to_uint i{hr}] - W16.of_int 3329 + W16.of_int 3329 = 
              rp{hr}.[to_uint i{hr}] by ring.
    by smt().
  move =>  H; rewrite (getsignPos _ _) /=; first by smt().
  by move : H;rewrite sltE to_sintD_small /to_sint /smod W16.to_uintN=> />; 
     smt(to_uint_cmp pow2_16).

+ move => ii iib /=.
  case(ii <> to_uint i{hr}); 
     1:  by move => prior; rewrite !set_neqiE; smt(). 
  move => current; rewrite set_eqiE /=; 1,2:smt(). 
  case(rp{hr}.[to_uint i{hr}] - W16.of_int 3329 \slt W16.zero).
  + move => H; rewrite (getsignNeg _ H) //=.
    have -> : rp{hr}.[to_uint i{hr}] - W16.of_int 3329 + W16.of_int 3329 = 
            rp{hr}.[to_uint i{hr}] by ring.
    by smt().
  move =>  H; rewrite (getsignPos _ _) /=; first by smt().
  by move : H;rewrite sltE to_sintD_small /to_sint /smod W16.to_uintN=> />; 
     smt(to_uint_cmp pow2_16).

+ move => ii; rewrite /= to_uintD_small /=; 1: by smt(). 
  move => iib;case(ii <> to_uint i{hr}); 
     1:  by move => prior; rewrite !set_neqiE; smt(). 
  move => current; rewrite set_eqiE /=; 1,2:smt(). 
  case(rp{hr}.[to_uint i{hr}] - W16.of_int 3329 \slt W16.zero).
  + move => H; rewrite (getsignNeg _ H) //=.
    have -> : rp{hr}.[to_uint i{hr}] - W16.of_int 3329 + W16.of_int 3329 = 
              rp{hr}.[to_uint i{hr}] by ring.
    move : H; rewrite sltE to_sintD_small /=; 
       1: by move :rbpre; rewrite /to_sint /smod /= to_uintN /= /#. 
    rewrite to_sintN /=; 1: by rewrite /to_sint /smod /=.
    by move :rbpre; rewrite /to_sint /smod /= /#.
  move =>  H; rewrite (getsignPos _ _) /=; first by smt().
  by move : H;rewrite sltE to_sintD_small /to_sint /smod W16.to_uintN=> />; 
     smt(to_uint_cmp pow2_16).

+ by rewrite to_uintD_small /= /#.

by rewrite to_uintD_small /= /#.
qed.

lemma poly_csubq_ll : islossless M._poly_csubq.
proof.
proc; while (0 <= to_uint i <= 256) (256 - to_uint i); auto => />.
+ by move => &hr;rewrite ultE of_uintK /= => *; rewrite to_uintD_small /=; smt().
by move => *; rewrite ultE /= /#. 
qed.

lemma poly_csubq_corr ap :
      phoare[ M._poly_csubq :
           ap = lift_array256 rp /\ pos_bound256_cxq rp 0 256 2 
           ==>
           ap = lift_array256 res /\ pos_bound256_cxq res 0 256 1 ] = 1%r
  by conseq poly_csubq_ll (poly_csubq_corr_h ap). 

lemma compress_rng a d :
   1 <= d <= 12 =>
   0 <= compress d a < 2^d.
move => drng; rewrite /compress.
by apply modz_cmp; apply gt0_pow2.
qed.

lemma poly_tomsg_corr _a (_p : address) mem : 
    equiv [ M._poly_tomsg ~ EncDec.encode1 :
             pos_bound256_cxq a{1} 0 256 2 /\ 
             lift_array256 a{1} = _a /\ a{2} = compress_poly 1 _a /\ 
             valid_ptr _p 32 /\ Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             lift_array256 res{1} = _a /\
             pos_bound256_cxq res{1} 0 256 1 /\
             touches mem Glob.mem{1} _p 32 /\
             load_array32 Glob.mem{1} _p = res{2}].
proc => /=.
seq 2 2 : (#{/~a{1}}pre /\ ={i} /\ i{1} = 0 /\ pos_bound256_cxq a{1} 0 256 1 /\ lift_array256 a{1} = _a).
wp => /=;call{1} (poly_csubq_corr _a); 1: by auto => /#.

while (#{/~mem}{~i{1}=0}pre /\ 0<=i{1}<=32  /\ touches mem Glob.mem{1} _p i{1} /\ 
       forall k, 0<=k<i{2} => loadW8 Glob.mem{1} (_p + k) = ra{2}.[k]); last first.  
+ auto => /> &1 &2. rewrite /load_array32 /loadW8 /ptr /= => vpl vph bnd; split; 1: smt(). 
  move => mem' i' ra' exit _ ibl ibh touch load;split; 1:smt(). 
  by rewrite tP => k kb; rewrite initiE //= (load k _) /#.

wp;seq 2 2 : (#pre /\ j{1} = 0 /\ ={j,r} /\ forall k, j{1} <= k < 8 => !r{2}.[k]); 1: by auto.
conseq (_: _ ==> 
  0 <= i{2} + 1 <= 32 /\
  touches mem Glob.mem{1} _p i{1} /\
  (forall (k : int),
    0 <= k < i{2} =>
    loadW8 Glob.mem{1} (_p+k) = ra{2}.[k]) /\ ={r}).
+ by move => &1 &2 [#]; rewrite /valid_ptr /touches /storeW8 /loadW8 /=  => 16? rL rR [#] ??; 
     rewrite !to_uintD_small /= of_uintK /= modz_small; 
     smt(get_set_neqE_s get_set_eqE_s Array32.set_neqiE Array32.set_eqiE). 
while(#{/~j{1}=0}pre /\ 0 <= j{2} <=8); last by  auto => /> /#. 
auto => /> &1 &2; rewrite /pos_bound256_cxq /bpos16 qE=> ?? bound ?????????. 

have jpow : 1<= 2^j{2} <=128. 
+ split; 1: smt(Ring.IntID.expr0 StdOrder.IntOrder.ler_weexpn2l). 
  move => *; rewrite (_: 128 = 2^7) //.
  by move : (StdOrder.IntOrder.ler_weexpn2l 2 _ j{2} 7) => // /#.

rewrite /lift_array256 !mapiE /=; 1,2:smt().
split; last by smt(). 
pose x:=(compress 1 (inFq (to_sint a{1}.[8 * i{2} + j{2}]))).
have /= xrng := (compress_rng (inFq (to_sint a{1}.[8 * i{2} + j{2}])) 1 _) => //.

split.
+ congr; rewrite to_uint_eq to_uint_truncateu8 /= modz_small.
  + rewrite (_: W32.one = W32.of_int (2^1 - 1)) // W32.and_mod //= compress_impl_small // 1:/#.
    split; 1: by smt(W32.to_uint_cmp).
    move => *;rewrite /(`<<`) W32.to_uint_shl 1:/# W32.of_uintK /=.
    rewrite modz_dvd // (modz_small _ 32) 1:/# modz_small; 1: by rewrite modz_small; smt().
    by smt(). 
  rewrite (_: W32.one = W32.of_int (2^1 - 1)) // W32.and_mod //= compress_impl_small // 1:/# -/x.  
    move => *;rewrite /(`<<`) W32.to_uint_shl  1:/# W32.of_uintK /=.
    move => *;rewrite /(`<<`) W8.to_uint_shl  1:/# W8.of_uintK /=.
    by rewrite modz_dvd // !modz_small; smt(). 

move => k kbl kbh.
have : ((of_int x)%W8 `<<` (of_int j{2})%W8).[k] = false; last by smt().

move => *;rewrite /(`<<`) /(`<<<`) /= initiE /=; 1: smt(). 
rewrite get_to_uint /= modz_dvd // !(modz_small _ 8); 1: smt().
have ->  /=: ((0 <= k - j{2} && k - j{2} < 8)); 1: smt().
rewrite (modz_small _ 256); 1: smt().

have /= ? : 2^1 <= 2^(k-j{2}) 
  by move : (StdOrder.IntOrder.ler_weexpn2l 2 _ 1 (k-j{2})) => // /#.
by smt(pdiv_small).
qed.


lemma poly_tomsg_ll : islossless  M._poly_tomsg.
proc.
while (0 <= i <= 32) (32-i); last by wp; call (poly_csubq_ll); auto =>  /> /#.
move => *; wp; while (0 <= j <= 8) (8-j); last by auto =>  /> /#.
by move => *; auto => /> /#.
qed.

lemma poly_frommsg_corr mem _p (_m : W8.t Array32.t): 
    equiv [ M._poly_frommsg ~ EncDec.decode1 :
             valid_ptr _p 32 /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array32 Glob.mem{1} _p = _m /\
             bytes{2} = _m
              ==>
             Glob.mem{1} = mem /\
             lift_array256 res{1} = decompress_poly 1 res{2} /\
             pos_bound256_cxq res{1} 0 256 1 ].
proc. 
seq 0 2 : (#pre /\ bits{2} = bytes2bits32 bytes{2}); 1: by auto.
while(#pre /\ ={i} /\ 0 <= i{1} <= 32 /\ 
   forall k, 0<=k<i{1}*8 => inFq (to_sint rp{1}.[k]) = decompress 1 r{2}.[k] /\
                0 <= to_sint rp{1}.[k] <q); last first.
+ auto => /> &1 &2; rewrite /lift_array256 /decompress_poly /pos_bound256_cxq /=.
  move =>  vrl vrh; split; 1: by smt(). 
  move => rp i ip exit _ ibl ibh k; split; 2: by smt().
  by rewrite tP => x xb; rewrite !mapiE //= /#.

auto => /> &1 &2 => vrl vrh il ih [#] ??; split; 1: by smt().
move => k kl kh.
rewrite /(`>>`) /= /load_array32 /= !to_uintD_small /=; 1: by rewrite of_uintK /=;  smt(). 
rewrite !of_uintK /= modz_small /=; 1:by smt().
have -> : zeroextu16 (loadW8 mem (to_uint ap{1} + i{2})) `&` W16.one =
          zeroextu16 (loadW8 mem (to_uint ap{1} + i{2}) `>>>` 0) `&` W16.one by
        congr; congr; rewrite /(`>>>`) /=; apply  W8.ext_eq => i ib; rewrite W8.initiE //.  

split;last first.
+ case(k < i{2} * 8); 1: by smt(Array256.set_neqiE).
  move => khigh.
  have ? : forall k, 0 <= k < 8 => 
     0 <= to_sint (zeroextu16 (loadW8 mem (to_uint ap{1} + i{2}) `>>>` k) `&` W16.one * W16.of_int 1665) < q; last 
        by smt(Array256.set_neqiE Array256.set_eqiE).
  move => j jb.
  have one : W16.one = W16.of_int (2^1-1) by smt().
  by rewrite /to_sint /smod /= to_uintM_small; rewrite one W16.to_uint_and_mod //=; smt(). 

have -> : (bytes2bits32 ((init (fun (i : int) => mem.[to_uint ap{1} + i])))%Array32).[i{2} * 8] = 
            (bytes2bits32 ((init (fun (i : int) => mem.[to_uint ap{1} + i])))%Array32).[i{2} * 8 + 0] by auto.
rewrite !bytes2bits32E // !initiE //=. 
  have ? : forall k, 0 <= k < 8 => 
     inFq (to_sint (zeroextu16 (loadW8 mem (to_uint ap{1} + i{2}) `>>>` k) `&` W16.one * W16.of_int 1665)) =
         decompress 1 (b2i mem.[to_uint ap{1} + i{2}].[k]); last 
        by smt(Array256.set_neqiE Array256.set_eqiE).

move => kk kkb; rewrite -decompress_alt_decompress /decompress_alt //; 1: by smt(qE).
congr; rewrite qE /=.
have one : W16.one = W16.of_int (2^1-1) by smt().
rewrite /to_sint /smod /= to_uintM_small; rewrite one W16.to_uint_and_mod //=; 1: smt(). 
rewrite /b2i /= to_uint_zeroextu16 /loadW8 /=.
have -> /= : !(32768 <= to_uint (mem.[to_uint ap{1} + i{2}] `>>>` kk) %% 2 * 1665) by smt().
rewrite to_uint_shr; 1: smt().
rewrite get_to_uint  kkb /=.
(* Fix me: how to do this compactly? *)
case (kk = 0); 1: by move => -> /=; smt().
case (kk = 1); 1: by move => -> /=; smt().
case (kk = 2); 1: by move => -> /=; smt().
case (kk = 3); 1: by move => -> /=; smt().
case (kk = 4); 1: by move => -> /=; smt().
case (kk = 5); 1: by move => -> /=; smt().
case (kk = 6); 1: by move => -> /=; smt().
case (kk = 7); 1: by move => -> /=; smt().
by smt().
qed.

lemma poly_frommsg_ll : islossless  M._poly_frommsg
 by proc; while (0 <= i <= 32) (32-i);  by  auto =>  /> /#.

lemma poly_frommont_corr_h (_a : int Array256.t) : 
    hoare[ M._poly_frommont :
             forall k, 0<=k<256 => to_sint rp.[k] = _a.[k] ==>
             forall k, 0<=k<256 => to_sint res.[k] = SREDC (_a.[k] * ((R^2) %% q))].
proc.
while (0 <= to_uint i <= 256 /\ dmont = W16.of_int 1353 /\
       (forall k, 0 <= k < to_uint i =>
          W16.to_sint rp.[k] =  SREDC (_a.[k] * ((R^2) %% q))) /\
       (forall k, to_uint i <= k < 256 =>
          W16.to_sint rp.[k] = _a.[k])); last by 
  auto => /= &hr [#] ?; split; [ smt() | move => 2?; rewrite ultE of_uintK /=; smt()]. 

sp;wp;conseq />;1: by smt(). 
ecall (fqmul_corr_h (to_sint r) (to_sint dmont)).
auto => /> &hr ??.
rewrite qE /R ultE /= => ??? r rval. 
rewrite !to_uintD_small /=; 1: by smt(W64.to_uint_cmp pow2_64).
do split; 1, 2, 4: by smt(Array256.set_neqiE). 
move => k kb; case (k = to_uint i{hr}); last by smt(Array256.set_neqiE).
move => -> ?; rewrite Array256.set_eqiE // rval.
by congr;rewrite W16.of_sintK /= /smod /= /#.
qed.

lemma poly_sub_corr_h _a _b ab bb :
    0 <= ab <= 4 => 0 <= bb <= 4 =>  
      hoare[ M._poly_sub :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = _a.[k] - _b.[k]]. 
proof.
move => abbnd bbbnd;proc. 
while (0 <= to_uint i <= 256 /\
      _a = lift_array256 ap /\
      _b = lift_array256 bp /\
      signed_bound_cxq ap 0 256 ab /\
      signed_bound_cxq bp 0 256 bb /\
      signed_bound_cxq rp 0 (to_uint i) (ab + bb) /\ 
      forall k, 0 <= k < to_uint i =>
              inFq (to_sint rp.[k]) = _a.[k] - _b.[k]); 
   last by auto => /= &hr [#] 4?; split; 
    [ smt() | move => 2?; rewrite ultE of_uintK /=; smt()]. 

auto => /> &hr ??.
rewrite /signed_bound_cxq qE ultE /lift_array256 !to_uintD_small /= ; 1: by smt(W64.to_uint_cmp pow2_64).
move => abnd bbnd pastb pastv inloop; split; 1: by smt().
split.
+ move => k kb; case (k = to_uint i{hr}); last by smt(Array256.set_neqiE).
  by move => ->; rewrite !Array256.set_eqiE //= to_sintB_small /= /#.

move => k kb; case (k = to_uint i{hr}); last by smt(Array256.set_neqiE).
move => ->; rewrite !Array256.set_eqiE //= to_sintB_small /=; 1: by smt().
by rewrite !mapiE //= inFqD inFqN.
qed.

lemma poly_sub_ll: islossless M._poly_sub.
proc; while (0 <= to_uint i <= 256) (256 - to_uint i).
+  by move => *; auto => /> ???;rewrite ultE to_uintD_small /=; by smt(W32.to_uint_cmp).
by move => *; auto => /> i ibl ibh; rewrite ultE of_uintK; smt(W32.to_uint_cmp).
qed.

lemma poly_sub_corr _a _b ab bb :
    0 <= ab <= 4 => 0 <= bb <= 4 =>  
      phoare[ M._poly_sub :
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = _a.[k] - _b.[k]] = 1%r 
   by move => *;conseq poly_sub_ll (poly_sub_corr_h _a _b ab bb _ _).


lemma poly_add_corr _a _b ab bb :
    0 <= ab <= 6 => 0 <= bb <= 3 =>  
      hoare[ M._poly_add2 :
           _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
           forall k, 0 <= k < 256 =>
              inFq (to_sint res.[k]) = _a.[k] + _b.[k]]. 
proof.
move => abbnd bbbnd;proc. 
while (0 <= to_uint i <= 256 /\
        (forall k, to_uint i <= k < 256 => _a.[k] = inFq (to_sint rp.[k])) /\
        _b = lift_array256 bp /\
        signed_bound_cxq rp (to_uint i) 256 ab /\
        signed_bound_cxq bp 0 256 bb /\
        signed_bound_cxq rp 0 (to_uint i) (ab + bb) /\ 
        forall k, 0 <= k < to_uint i =>
           inFq (to_sint rp.[k]) = _a.[k] + _b.[k]); last first. 
+ auto => /= &hr; rewrite /lift_array256 !tP => [#] av bv ??; split. 
  + do split => //; 2,3: by smt().
    by  move => k kb; move : (av k kb); rewrite !mapiE //. 
  by move => i rp; rewrite ultE of_uintK /= /#.

auto => /> &hr ??.
rewrite /signed_bound_cxq qE ultE /lift_array256 !to_uintD_small /= ; 
   1: by smt(W64.to_uint_cmp pow2_64).
move => aval abnd bbnd pastb pastv inloop; split; 1: by smt().
do split; first last.
+ by smt(Array256.set_neqiE).
+ move => k kb; case (k = to_uint i{hr}); last by smt(Array256.set_neqiE).
  by move => ->; rewrite !Array256.set_eqiE //= to_sintD_small /= /#.
+ move => k kb; case (k = to_uint i{hr}); last by smt(Array256.set_neqiE).
  move => ->; rewrite !Array256.set_eqiE //= to_sintD_small /=; 1: by smt().
  by rewrite !mapiE //= inFqD /#.
by smt(Array256.set_neqiE).
qed.

lemma poly_add_corr_R _a _b ab bb :
  0 <= ab <= 6 =>
  0 <= bb <= 3 =>
  hoare [ Jindcpa.M._poly_add2 :
    _a = lift_array256 rp /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp 0 256 ab /\
           signed_bound_cxq bp 0 256 bb 
           ==>
           signed_bound_cxq res 0 256 (ab + bb) /\ 
    lift_array256 res = _a &+ _b].
move => abbnd bbbnd.
conseq (poly_add_corr _a _b ab bb abbnd bbbnd). 
move => ? [#] ????r [#] ? sum;split; 1: by smt().
rewrite /lift_array256 /(&+) mapE map2E /= tP /= => i ib.
by rewrite !initiE //= (sum i ib).
qed.

lemma poly_reduce_corr_h (_a : Fq Array256.t):
      hoare[ M.__poly_reduce :
          _a = lift_array256 rp ==> 
          _a = lift_array256 res /\
          forall k, 0 <= k < 256 => bpos16  res.[k] (2*q)].
proof.
proc.
while (0 <= to_uint j <= 256 /\
     (forall k, 0 <= k < 256 => _a.[k] = inFq (to_sint rp.[k])) /\
     forall k, 0 <= k < to_uint j => bpos16  rp.[k] (2*q)
); last first. 
+ auto => /= &hr; rewrite /lift_array256 !tP => [#] av; split. 
  + split => //; 2: by smt().
    by  move => k kb; move : (av k kb); rewrite !mapiE //. 
  move => i rp'; rewrite ultE of_uintK /= => exit [#] ?? ??.
  split; last by smt(). 
  by rewrite tP => k kb; move : (av k kb); rewrite !mapiE //= /#.

sp;wp;conseq />;1: by smt(). 
ecall (barrett_reduce_corr_h (to_sint t)).
auto => /> &hr ??.
rewrite qE /R ultE /= => av ab inl r rval. 
rewrite !to_uintD_small /=; 1: by smt(W64.to_uint_cmp pow2_64).
have bred := (BREDCp_corr (to_sint rp{hr}.[to_uint j{hr}]) 26 _ _ _ _ _ _); 
     1..4,6: smt(qE pow2_16).
+ by rewrite /R /=; move : W16.to_sint_cmp => /= /#.
do split; 1, 2: by smt(). 
+ move => k kbl kbh; case (k = to_uint j{hr}); last by smt(Array256.set_neqiE).
  move => ->>; rewrite Array256.set_eqiE // rval.
  move : (av (to_uint j{hr}) _) => // ->.
  by apply eq_inFq => /#. 
  
move => k kbl kbh.
case (k = to_uint j{hr}); last by smt(Array256.set_neqiE).
move => ->; rewrite !Array256.set_eqiE //=.
by smt().
qed.


lemma poly_reduce_ll: islossless M.__poly_reduce.
proof.
proc;while (0 <= to_uint j <= 256) (256 - to_uint j).
+ by move => z; inline *; auto => />; 
     move =>  &hr ??; rewrite ultE !to_uintD_small /= /#. 
by auto => />; move => ??; rewrite ultE  /= /#. 
qed.

lemma poly_reduce_corr (_a : Fq Array256.t):
      phoare[ M.__poly_reduce :
          _a = lift_array256 rp ==> 
          _a = lift_array256 res /\
          forall k, 0 <= k < 256 => bpos16  res.[k] (2*q)] = 1%r.
proof. by conseq poly_reduce_ll (poly_reduce_corr_h _a). qed.


lemma poly_tobytes_corr _a (_p : address) mem : 
    equiv [ M._poly_tobytes ~ EncDec.encode12 :
             pos_bound256_cxq a{1} 0 256 2 /\ 
             lift_array256 a{1} = _a /\
             map inFq p{2} = _a /\
             valid_range W8 Glob.mem{1} _p 384 /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             lift_array256 res{1} = _a /\
             pos_bound256_cxq res{1} 0 256 1 /\
             touches mem Glob.mem{1} _p 384 /\
             load_array384 Glob.mem{1} _p = res{2}].
admitted.

lemma poly_frombytes_corr mem _p (_a : W8.t Array384.t): 
    equiv [ M._poly_frombytes ~ EncDec.decode12 :
             valid_range W8 Glob.mem{1} _p 384 /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array384 Glob.mem{1} _p = _a
              ==>
             Glob.mem{1} = mem /\
             lift_array256 res{1} = map inFq res{2} /\
             pos_bound256_cxq res{1} 0 256 1 ].
admitted.


lemma poly_compress_corr _a (_p : address) mem : 
    equiv [ M._poly_compress ~ EncDec.encode4 :
             pos_bound256_cxq a{1} 0 256 2 /\
             lift_array256 a{1} = _a /\
             p{2} = compress_poly 4 _a /\
             valid_ptr _p 128 /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             lift_array256 res{1} = _a /\
             pos_bound256_cxq res{1} 0 256 1 /\
             touches mem Glob.mem{1} _p 128 /\
             load_array128 Glob.mem{1} _p = res{2}].
proc => /=.
seq 3 3 : (#{/~a{1}}pre /\ to_uint i{1} = i{2} /\ i{2} = 0 /\ 
           to_uint j{1} = j{2} /\ j{2} = 0 /\
           pos_bound256_cxq a{1} 0 256 1 /\ lift_array256 a{1} = _a).
wp => /=;call{1} (poly_csubq_corr _a); 1: by auto => /#.

while (#{/~mem}{~i{2}=0}{~j{2}=0}pre /\ to_uint i{1} = i{2} /\ 0<=i{2}<=128  /\ 
       to_uint j{1} = j{2} /\ j{2} = 2* i{2} /\
       touches mem Glob.mem{1} _p i{2} /\ 
       forall k, 0<=k<i{2} => loadW8 Glob.mem{1} (_p + k) = r{2}.[k]); last first.  
+ auto => /> &1 &2; rewrite ultE of_uintK /load_array32 /loadW8 /ptr /= => 
    vpl vph bnd ??; split; 1: by smt().
  move => mem' i' j' ra'; rewrite ultE of_uintK  /= => exit _ ibl ibh jv  touch load.
  split; 1:  smt(). 
  by rewrite tP => k kb; rewrite initiE //= (load k _) /#.

auto => /> &1 &2 ??; rewrite /pos_bound256_cxq /touches /storeW8  /loadW8 /=.
rewrite  ultE of_uintK /= => ????????. 
rewrite !to_uintD_small /=; 1..4: smt().
do split; 1..4: by smt(get_set_neqE_s). 
+ move => k kbl kbh.
  case (k = to_uint i{1}); last first.
  + move => neq; rewrite get_set_neqE_s; 1: by smt().
    by rewrite set_neqiE // /#.
  move => eq; rewrite get_set_eqE_s; 1: by smt().
  rewrite set_eqiE //.
  have -> : W32.of_int 15 = W32.of_int (2^4 - 1) by auto.
  rewrite /lift_array256 !mapiE /=; 1..4: smt().
  rewrite -compress_impl_small //; 1: smt().
  rewrite  -compress_impl_small //; 1:smt().
  
  case (k = to_uint i{1}); last by smt(Array128.set_neqiE).
  move => iv; have -> : 15 = 2^4 - 1 by auto.
  by rewrite !and_mod //.
+ by rewrite ultE /= to_uintD_small; smt().

by rewrite ultE /= to_uintD_small; smt().
qed.

lemma poly_compress_ll : islossless M._poly_compress.
proc.
while (0 <= to_uint i <= 128) (128-to_uint i); last 
   by wp; call (poly_csubq_ll); auto =>  />; smt(@W64).
move => *;  auto => /> &hr ??.
by rewrite W64.ultE W64.to_uintD_small /#. 
qed.

lemma poly_decompress_corr mem _p (_a : W8.t Array128.t): 
    equiv [ M._poly_decompress ~ EncDec.decode4 :
             valid_ptr _p 128 /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array128 Glob.mem{1} _p = _a /\
             bytes{2} = _a
              ==>
             Glob.mem{1} = mem /\
             lift_array256 res{1} = decompress_poly 4 res{2} /\
             pos_bound256_cxq res{1} 0 256 1 ].
proc. 
seq 0 2 : (#pre /\ bits{2} = bytes2bits128 bytes{2}); 1: by auto.
while(#pre /\ to_uint i{1} = i{2} /\ to_uint j{1} = 2*i{2} /\ 0 <= i{2} <= 128 /\ 
   forall k, 0<=k<i{2}*2 => inFq (to_sint rp{1}.[k]) = decompress 4 r{2}.[k] /\
                0 <= to_sint rp{1}.[k] <q); last first.
+ auto => /> &1 &2; rewrite /lift_array256 /decompress_poly /pos_bound256_cxq /=.
  move =>  vrl vrh; split; 1: by smt(). 
  move => i j rp rr; rewrite ultE of_uintK /= => exit _ ibl ibh jv prior; split; 2: by smt(). 
  by rewrite tP => x xb; rewrite !mapiE //= /#.

auto => /> &1 &2 vpl vph il ih jv prior; rewrite ultE of_uintK /= => enter _; 
  split; 2: by rewrite ultE of_uintK /= to_uintD_small /#.
rewrite  !to_uintD_small /=; 1..4: by smt().
do split; 1..3: by smt().
move => k kl kh.
rewrite /(`>>`) /= /load_array32 /=. 

split;last first.
+ case(k < to_uint i{1} * 2); 1: by smt(Array256.set_neqiE).
  case(k = to_uint j{1}).
  + move => ->;rewrite set_neqiE;1,2:smt(). 
    rewrite set_eqiE;1,2:smt().
    move => _;  have pow : W16.of_int 15 = W16.of_int (2^4-1) by smt().
    rewrite pow and_mod //= /to_sint !to_uint_shr // !to_uint_zeroextu16. 
    rewrite !of_uintK /= qE !(modz_small _ 65536) /=; 1: smt(). 
    by rewrite /smod /=; smt(to_uint_cmp).
 move => *;rewrite set_eqiE;1,2:smt(). 
 rewrite /to_sint  !to_uint_shr //.
 rewrite !to_uintD_small; first
   by rewrite !to_uintM_small; rewrite of_uintK /= to_uint_shr // 
                                  to_uint_zeroextu16 /= /loadW8 /=; 
                                  smt(W8.to_uint_cmp pow2_8).
    rewrite !of_uintK /= qE !to_uintM_small;1: by rewrite of_uintK /= to_uint_shr // 
                                  to_uint_zeroextu16 /= /loadW8 /=; 
                                  smt(W8.to_uint_cmp pow2_8).
    rewrite !to_uint_shr // to_uint_zeroextu16 /=.
    by rewrite /smod /=; smt(W8.to_uint_cmp pow2_8).

 move : (bytes2bits128E (load_array128 mem (to_uint ap{1})) (to_uint i{1}) _); 
    1: smt(); move => [#] bits0 bits1.

case(k < to_uint i{1} * 2); 1: by smt(Array256.set_neqiE).
case(k = to_uint j{1}).
+ move => ->;rewrite set_neqiE;1,2:smt(). 
  rewrite set_eqiE;1,2:smt().
  rewrite set_neqiE;1,2:smt(). 
  rewrite set_eqiE;1,2:smt().
  move => _;rewrite bits0 -decompress_alt_decompress //; 1: smt(qE).
  rewrite /load_array128 Array128.initiE //.
  rewrite /decompress_alt qE /loadW8 /=; congr.
  rewrite /to_sint.
  rewrite to_uint_shr //= to_uintD_small /=.
  + rewrite to_uintM_small /=.
    + rewrite (_: 15 = 2^4-1) // and_mod // of_uintK /= to_uint_zeroextu16.
      by rewrite (modz_small _ 65536) //; smt().
    rewrite (_: 15 = 2^4-1) // and_mod // of_uintK /= to_uint_zeroextu16.
    by rewrite (modz_small _ 65536) //; smt().
  rewrite (_: 15 = 2^4-1) // and_mod // of_uintK /=. 
  rewrite (modz_small _ 65536) //; 1: smt(W8.to_uint_cmp pow2_8).
  rewrite W16.of_uintK /= (modz_small _ 65536) //; 1: smt(W8.to_uint_cmp pow2_8).
  rewrite (_: 15 = 2^4-1) // and_mod // of_uintK /=. 
  rewrite (modz_small _ 256) //; 1: smt(W8.to_uint_cmp pow2_8).
  by rewrite /smod /=; smt(W8.to_uint_cmp pow2_8).
    
move => *;rewrite set_eqiE;1,2:smt(). 
rewrite set_eqiE;1,2:smt().
rewrite bits1 -decompress_alt_decompress //; 1: smt(qE).
rewrite /load_array128 Array128.initiE //.
rewrite /decompress_alt qE /loadW8 /=; congr.
rewrite /to_sint.
rewrite to_uint_shr //= to_uintD_small /=.
+ rewrite to_uintM_small /=.
    + rewrite to_uint_shr // to_uint_zeroextu16 /=; 1: smt(W8.to_uint_cmp pow2_8).
    rewrite to_uint_shr // to_uint_zeroextu16 /=; 1: smt(W8.to_uint_cmp pow2_8).
  rewrite to_uintM_small /=.
  + rewrite to_uint_shr // to_uint_zeroextu16 /=; 1: smt(W8.to_uint_cmp pow2_8).
  rewrite to_uint_shr // to_uint_zeroextu16 /=.
  rewrite to_uint_shr // of_uintK /=.
  by rewrite /smod;smt(W8.to_uint_cmp pow2_8).
qed.

(*******DIRECT NTT *******)

import Jindcpa.

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

lemma rrinvFq : inFq R * inFq 169 = Zq.one by rewrite -inFqM -eq_inFq; apply RRinv.

lemma mul_congr a b : Fqcgr (asint (inFq b) * asint (inFq a)) (b * a) by rewrite !inFqK modzMm.

import NTT_Fq.

(* 
lemma mont_lift_commute_inv  a b :
  array_mont_inv a = lift_array128  b =>
     forall k, 0<=k<127 => a.[k] * inFq R = inFq (to_sint b.[k]).
proof.
rewrite /array_mont_inv /lift_array128 /= tP => H.
move => k kb; move : (H k _); 1: smt(); rewrite !mapiE 1:/# => <-.
by move => *;rewrite set_neqiE 1,2:/# mapiE /#.
qed.

lemma mont_lift_commute  a b :
  array_mont a = lift_array128  b =>
     forall k, 0<=k<128 => a.[k] * inFq R = inFq (to_sint b.[k]).
proof.
rewrite /array_mont /lift_array128 /= tP => H.
by move => k kb; move : (H k _); 1: smt(); rewrite !mapiE 1,2:/# /=.
qed.
*)

equiv ntt_correct_aux :
     NTT.ntt ~ M._poly_ntt : 
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
   len{1} = to_uint len{2} /\
   zetasctr{1} = to_uint zetasctr{2}/\
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
       start{1} = to_uint start{2} /\
       0 <= start{1} <= 256 /\
       start{1} = 2*len{1}*(zetasctr{1} - zetasctr1) /\
       start{1} <= 256 /\
       (* Nasty carry inv *)
       (exists l, 0 <= l <= 7 /\ len{1} = 2^l /\
          signed_bound_cxq  rp{2} 0 256 (9 - (l - 1)) /\
          signed_bound_cxq  rp{2} start{1} 256 (9 - l))
       ); last first.
+ auto => />; move => &1 &2; rewrite /signed_bound_cxq => 4? rep blow exit ?;split;
     1: by exists l; do split; smt().
  move => rp start zetasctr; rewrite !ultE !uleE !shr_div /= => 7? l0 *. 
  split; 1: by smt().  
  exists (l0-1); do split.
  + move : exit; rewrite (_: 2 = 2^1) //;smt(Ring.IntID.expr0 StdOrder.IntOrder.ler_weexpn2l). 
  + smt().
  + rewrite rep Montgomery.pow_div1 //.
  + move : exit; rewrite (_: 2 = 2^1) //;smt(Ring.IntID.expr0 StdOrder.IntOrder.ler_weexpn2l).  
    by smt(StdOrder.IntOrder.ieexprIn).
  by smt().  

(* Inner loop *)
wp;while (#{/~start{1} = 2*len{1}*(zetasctr{1} - zetasctr1)}
        {~exists (l0 : int),
     (0 <= l0 && l0 <= 7) /\
     len{1} = 2 ^ l0 /\ signed_bound_cxq rp{2} 0 256 (9 - (l0 - 1)) /\ 
        signed_bound_cxq rp{2} start{1} 256 (9 - l0)} pre /\
       zeta_{1} = inFq (to_sint zeta_0{2}) * inFq 169 /\  
       0 <= to_sint zeta_0{2} < q /\
       start{1} = 2*len{1}*(zetasctr{1} - 1 - zetasctr1) /\
       W64.to_uint cmp{2} = start{1} + len{1} /\ 
       j{1} = to_uint j{2} /\
       start{1} <= j{1} <= start{1} + len{1} /\
       (exists l, 0 <= l <= 7 /\ len{1} = 2^l /\
          signed_bound_cxq  rp{2} 0 256 (9 - (l - 1)) /\
          signed_bound_cxq  rp{2} (j{1}) (start{1} + len{1}) (9 - l) /\
          signed_bound_cxq  rp{2} (j{1} + len{1}) 256 (9 - l)
       )
       );last first. 
+ auto => /> &1 &2; rewrite /signed_bound_cxq !uleE !ultE =>  5? lenpow2  3? l0 3?.
  rewrite !to_uintD_small; 1..2: smt().
  move => cbdloose cbdtight 2? => />;split.

  (* Initialization *) 
  + do split; 1..2,6: smt().
      move : zetasE; rewrite /array_mont /lift_array128 tP => mnt.
      + move : (mnt (to_uint zetasctr{1} + 1) _); 1: smt(); rewrite !mapiE /=; 1,2:smt().
        by move => <-; rewrite -ZqField.mulrA rrinvFq; ring.
    + by move:(zeta_bound); rewrite /minimum_residues /bpos16 /#.
    + by move:(zeta_bound); rewrite /minimum_residues /bpos16 /#.
    by exists (l0); do split; smt(). 

  (* Termination *)
  move => jl jr rpr; rewrite !ultE to_uintD_small; 1: smt(). 
  move => 8?l1; rewrite !to_uintD_small; 1: smt().  
  move => *.
  split; last by smt().
  do split; 1,3..4: by smt().
  + by have -> : to_uint jl = to_uint start{1} + to_uint len{1}; smt().
  by exists l1; do split; smt().

(* Preservation *)
wp; sp; ecall {2} (fqmul_corr (to_sint t{2}) (to_sint zeta_0{2})).
auto => /> &1 &2. rewrite   /signed_bound_cxq =>  3?  lenlb 5?.
rewrite !ultE !of_uintK /= => 7?; rewrite !to_uintD_small; 1..2: smt().
move => l1 3? bnt bt 3? result rval.

have l1lb : (1 <= l1) by move : lenlb ; rewrite (_: 2 = 2^1) //;
    smt(Ring.IntID.expr0 StdOrder.IntOrder.ler_weexpn2l). 

have  /= [#] redbl redbh redv := 
    (SREDCp_corr (to_sint rp{1}.[to_uint j{1} + to_uint len{1}] * to_sint zeta_0{1}) _ _); 1,2:
     by rewrite /R /=; move : (bnt (to_uint j{1} + to_uint len{1}) _);smt().

do split; 2..3,5..6: smt(). 
+ apply Array256.ext_eq  => x xb.
  case (x = to_uint j{1}); last first.
  + move => *; rewrite (set_neqiE);1,2 : smt().
    case(x = to_uint j{1} + to_uint len{1}); last first.
    + move => *; rewrite !(set_neqiE);1,2 : smt().
      by rewrite !mapiE //= !(set_neqiE);  smt().
    move => ->; rewrite !(set_eqiE); 1,2: smt().
    rewrite !mapiE //=; 1..3: smt().
    rewrite (set_neqiE); 1..2:  smt().
    rewrite (set_eqiE); 1..2:  smt().
    rewrite to_sintB_small /= 1:/# inFqB; congr;congr.
    by apply eq_inFq; rewrite rval redv mulrC -inFqM -mulrA mul_congr.
  move => ->; rewrite set_eqiE; 1,2: smt().
  rewrite (set_neqiE); 1..2:  smt().
  rewrite !mapiE //=; 1..3: smt().
  rewrite (set_eqiE); 1..2:  smt().
  rewrite to_sintD_small /= 1:/# inFqD ZqField.addrC; congr.
  apply eq_inFq; rewrite rval redv !inFqK. 
  rewrite !modzMm (modz_small 169 _); 1: by smt(qE).
  rewrite (modz_small (to_sint zeta_0{1}) _); 1: by smt(qE).
  by rewrite mulrC mulrA.

move : redbl redbh; rewrite -rval => redbl redbh.

exists l1; do split; 1..3: smt().
+ move => x xb.
  case (x = to_uint j{1}); last first.
  + move => *; rewrite (set_neqiE);1,2 : smt().
    case(x = to_uint j{1} + to_uint len{1}); last by
       move => *; rewrite !(set_neqiE); smt().
    move => ->; rewrite !(set_eqiE); 1,2: smt().
    by rewrite to_sintB_small /=; smt(). 
  move => ->; rewrite set_eqiE; 1,2: smt().
  by rewrite to_sintD_small /=; smt(). 

+ by move => x xb; rewrite !set_neqiE; smt().

by move => x xb; rewrite !set_neqiE; smt().

qed.

lemma ntt_correct _r :
   phoare[ M._poly_ntt :
        _r = lift_array256 rp /\ 
        signed_bound_cxq rp 0 256 2
          ==> 
            ntt _r = lift_array256 res /\
            forall k, 0<=k<256 => bpos16 res.[k] (2*q)] = 1%r.
proof.
bypr;move => &m [#] H H1.
apply (eq_trans _ (Pr[NTT.ntt(_r,zetas) @ &m : ntt _r = res])).
have -> : (Pr[NTT.ntt(_r, zetas) @ &m : ntt _r = res] = 
           Pr[M._poly_ntt(rp{m}) @ &m : ntt _r = lift_array256 res /\ 
            forall (k : int), 0 <= k < 256 => bpos16 res.[k] (2 * q)]); last by auto.
byequiv ntt_correct_aux =>//.
byphoare (ntt_spec _r)=> //.
qed.

lemma ntt_correct_h (_r0 : Fq Array256.t):
      hoare[ M._poly_ntt :
               _r0 = lift_array256 arg /\
               signed_bound_cxq arg 0 256 2 ==>
               ntt _r0 = lift_array256 res /\
               forall (k : int), 0 <= k && k < 256 => bpos16 res.[k] (2 * q)]
 by conseq (ntt_correct _r0). 


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
  NTT_Fq.NTT.invntt ~ M._poly_invntt : 
        r{1} = lift_array256 rp{2} /\ zetas_inv{1} = zetas_inv /\
           signed_bound_cxq rp{2} 0 256 2
          ==> 
            map (fun x => x * (inFq R)) res{1} = lift_array256 res{2} /\
            forall k, 0<=k<256 => b16 res{2}.[k] (q+1).
proc.
(* Final loop just reduces the range *)
seq 3 5 :  (r{1} = lift_array256 rp{2} /\ zetasp{2} = jzetas_inv /\
        zetas_inv{1} = zetas_inv /\
        signed_bound_cxq rp{2} 0 256 4
); last first.
+ while (j{1} = to_uint j{2} /\
       0 <= j{1} <= 256 /\
       (forall k, (0 <= k < j{1} => r{1}.[k] * inFq R = inFq (to_sint rp{2}.[k])) /\
                  (j{1} <= k < 256 => r{1}.[k] = inFq (to_sint rp{2}.[k]))

       ) /\
       zetas_inv.[127]{1} * inFq R  = inFq (to_sint jzetas_inv.[127]) * inFq 169 /\
       zeta_0{2} = jzetas_inv.[127] /\
       signed_bound_cxq rp{2} 0 256 4 /\
       (forall k, 0 <= k < j{1} => b16 rp{2}.[k] (q + 1))); last first. 
  + wp;skip; move => &1 &2 [#] ->. 
    rewrite /signed_bound_cxq => /= zp zvals zbnd.
    split.
    + do split; 4..: by smt().
      + by move => k; split; move => kb;rewrite !mapiE 1:/# /= /#.
      + rewrite zvals; move : zetas_invE; rewrite /array_mont_inv /=. 
        rewrite tP => zzvals; move : (zzvals 127 _) => //.
        rewrite set_eqiE //= /to_sint /smod /= => <-.
        by rewrite -ZqField.mulrA rrinvFq; ring.
      + by rewrite zp /=.
    move => jl rl jr rpr; rewrite ultE /= => ??[#] *.
    split; last by smt().
    by rewrite tP => x xb; rewrite !mapiE /#.
  
  auto => />.
  + move => &1 &2  [#] ->.
    rewrite /lift_array256 /signed_bound_cxq.
    by move => /= ?? zp zvals z2 bnd1 bnd2; rewrite !ultE => ?? t ? /#.
  ecall {2}(fqmul_corr (to_sint t{2}) (to_sint zeta_0{2})).
  auto => /> &1 &2;rewrite /array_mont_inv /lift_array128 /lift_array256 /signed_bound_cxq.
  move => /= ?? zp zvals bnd1 bnd2; rewrite !ultE => ?? result rval.

  have  /= [#] redbl redbh redv := 
    (SREDCp_corr (to_sint rp{2}.[to_uint j{2}] * to_sint ((of_int 1441))%W16)_ _).
  + by rewrite /R qE /=.
  by  rewrite /R /=; move : (bnd1 (to_uint j{2}) _); 1:smt(); 
      rewrite /to_sint /of_uintK /smod qE /#.
  
  rewrite to_uintD_small; 1: smt().
  split; 2: smt();do split; 1..2:smt().
  + move => k; split. 
    + move => kbl kbh; case (k = to_uint j{2}); last by move => *;rewrite !set_neqiE /#.
      move => ->; rewrite !set_eqiE // -ZqField.mulrA zvals.
      move : (zp (to_uint j{2})) => [#] _ -> //.
      apply eq_inFq; rewrite rval redv.
      by rewrite -inFqM !inFqK modzMm mulrA. 
    by move => kbl kbh;rewrite !set_neqiE /#.
  
  + move => k kb; case (k = to_uint j{2}); last by move => *;rewrite !set_neqiE /#. 
    by move => ->; rewrite !set_eqiE /#.

  move => k kb; case (k = to_uint j{2}); last by move => *;rewrite !set_neqiE /#. 
  by move => ->; rewrite !set_eqiE /#.

(* Outer loop *)
while (
   zetasp{2} = jzetas_inv /\
   r{1} = lift_array256 rp{2} /\
   zetas_inv{1} = zetas_inv /\
   len{1} = to_uint len{2} /\
   (exists l, 1 <= l <= 8 /\ len{1} = 2^l) /\
   0 <= zetasctr{1} <= 128 /\
   zetasctr{1} = to_uint zetasctr{2} /\
   zetasctr{1} * len{1} = 128 * (len{1} - 2) /\
   signed_bound_cxq rp{2} 0 256 4); last first.
+ auto => /> &1 cbnd; split. 
  + by exists (1); smt().
  by move : cbnd; rewrite /signed_bound_cxq /#. 

wp; exists* zetasctr{1}; elim* => zetasctr1 l.

(* Middle loop *)
while (#{/~zetasctr1=zetasctr{1}}
        {~zetasctr{1} * len{1} = 128 * (len{1} - 2)}pre /\ 
       zetasctr1 * len{1} = 128 * (len{1} - 2) /\
       start{1} = to_uint start{2} /\
       0 <= start{1} <= 256 /\
       start{1} = 2*(zetasctr{1} - zetasctr1)*len{1} /\
       2* (zetasctr{1} - zetasctr1) * to_uint len{2} <= 256 /\
       (* Nasty carry inv *)
       signed_bound_cxq  rp{2} 0 256 4); last first.

+ auto => /> &1; rewrite  !uleE /signed_bound_cxq.
  move => 2? rep 4? lb ? rp start zetasctr *.
  rewrite !to_uint_shl //= !(modz_small _ W64.modulus); 1: smt().
  do split; 2..: smt().
  exists (l+1); split; last by rewrite rep exprD_nneg /#.
  by smt(StdOrder.IntOrder.ler_weexpn2l pow2_7 StdOrder.IntOrder.ieexprIn). 

wp.
(* Inner loop *)
while (#{/~start{1} = 2*(zetasctr{1} - zetasctr1) * len{1}} pre /\
       zeta_{1} = inFq (to_sint zeta_0{2}) *  (inFq 169) /\  
       0 <= to_sint zeta_0{2} < q /\
       start{1} = 2*((zetasctr{1}-1) - zetasctr1) * len{1} /\
       W64.to_uint cmp{2} = start{1} + len{1} /\ 
       j{1} = to_uint j{2} /\
       start{1} <= j{1} <= start{1} + len{1}); last first.

+ auto => />  &1; rewrite !uleE /signed_bound_cxq.
  move => 2? rep 3? lb ? rp ??????.

  move : zetainv_bound; rewrite /minimum_residues /bpos16 => zb.

  rewrite !ultE //= !to_uintD_small;1,2:smt().
  do split; 1..3,5..6:smt().
  + move : zetas_invE; rewrite /array_mont_inv /lift_array128 tP => mnt.
    move : (mnt (to_uint zetasctr{1}) _); 1: smt().
    + rewrite mapiE /=; 1: smt().
      rewrite set_neqiE /=; 1,2: smt().
      rewrite mapiE /=; 1: smt().
    by move => <-; rewrite -ZqField.mulrA rrinvFq; ring.
  by move:(zeta_bound); rewrite /minimum_residues /bpos16 /#.
 
by move => jl rpl; rewrite !ultE => 13?; rewrite !to_uintD_small; smt(). 

(* Preservation *)

wp;ecall {2}(fqmul_corr (to_sint t{2}) (to_sint zeta_0{2})).
wp;ecall {2} (barrett_reduce_corr (to_sint m{2})).

auto => />  &1 &2; rewrite !uleE /signed_bound_cxq /b16. 
move => ? rep 3? lb; rewrite !ultE => 15?; rewrite !to_uintD_small; 1,2: smt(). 
move => result rval result0 rval0.
rewrite /lift_array256 /=.

have [#]bredbl bredbh bredv := (BREDCp_corr (to_sint (rp{1}.[to_uint j{1} + 
                          to_uint len{1}] + rp{1}.[to_uint j{1}])) 26 _ _ _ _ _ _); 
     1..4: smt(qE pow2_16).
+ by rewrite to_sintD_small /= /R /=; smt(qE).
+ by move => a; rewrite /R qE /= /barrett_pred => bnd; split; smt().

have  /= [#] redbl redbh redv := 
   (SREDCp_corr (to_sint (rp{1}.[to_uint j{1}] - rp{1}.[to_uint j{1} + 
                                to_uint len{1}]) * to_sint zeta_0{1})_ _).
  + by rewrite /R qE /=.
  by rewrite /R qE /= !to_sintB_small /=; smt(qE). 

move : redbl redbh; rewrite -rval0 => redbl redbh.
move : bredbl bredbh; rewrite -rval => bredbl bredbh.

do split; 4..: smt().

+ apply Array256.ext_eq  => x xb.
  case (x = to_uint j{1} + to_uint len{1}); last first.
  + move => *; rewrite (set_neqiE);1 ,2: smt().
    case(x = to_uint j{1}); last first.
    + move => *; rewrite !(set_neqiE);1,2 : smt().
      by rewrite !mapiE //= !(set_neqiE);  smt().
    move => ->; rewrite !(set_eqiE); 1,2: smt().
    rewrite !mapiE //=; 1..3: smt().
    rewrite (set_neqiE); 1..2:  smt().
    rewrite (set_eqiE); 1..2:  smt().
    rewrite rval -eq_inFq bredv !inFqK modzDm addrC.
    by rewrite to_sintD_small /=; smt(qE).
  move => ->; rewrite set_eqiE; 1,2: smt().
  rewrite (set_eqiE); 1..2:  smt().
  rewrite (set_neqiE); 1..2:  smt().
  rewrite !mapiE //=; 1..3: smt().
  rewrite (set_eqiE); 1..2:  smt().
  rewrite -inFqB; apply eq_inFq; rewrite rval0 redv !inFqK. 
  rewrite !modzMm !(modz_small 169 _) qE 1:/# (modz_small (to_sint zeta_0{1})); 1: by smt(qE).
  rewrite to_sintB_small /= ; 1: smt(qE).
  by rewrite mulrC mulrA.

+ move => x xb.
  case (x = to_uint j{1} + to_uint len{1}); last first.
  + move => *; rewrite (set_neqiE);1 ,2: smt().
    case(x = to_uint j{1}); last first.
    + by move => *; rewrite !(set_neqiE); smt().
    by move => ->; rewrite !(set_eqiE); smt().
  by move => ->; rewrite set_eqiE; smt().

move => x xb.
case (x = to_uint j{1} + to_uint len{1}); last first.
+ move => *; rewrite (set_neqiE);1 ,2: smt().
  case(x = to_uint j{1}); last first.
  + by move => *; rewrite !(set_neqiE); smt().
  by move => ->; rewrite !(set_eqiE); smt().
by move => ->; rewrite set_eqiE; smt().
qed.


lemma invntt_correct _r  :
   phoare[ M._poly_invntt :
        _r = lift_array256 rp /\ signed_bound_cxq rp 0 256 2
          ==> 
            scale (invntt _r) (inFq R) = lift_array256 res /\
            forall k, 0<=k<256 => b16 res.[k] (q+1)] = 1%r.
proof.
bypr;move => &m [#] H H1.
apply (eq_trans _ (Pr[NTT.invntt( _r,zetas_inv) @ &m :  invntt _r = res])).
+ have -> : (
Pr[NTT.invntt(_r, zetas_inv) @ &m : invntt _r = res] = 
Pr[M._poly_invntt(rp{m}) @ &m :
  invntt (map (fun x => x * (inFq R)) _r) = lift_array256 res /\ 
   forall (k : int), 0 <= k < 256 => b16 res.[k] (q+1)]); last by rewrite invntt_scale.
byequiv invntt_correct_aux; 1: by smt(). 
+ move => &1 &2;rewrite invntt_scale /scale /= /lift_array256 /= !tP/=.  
  move => [#] H2 H3;split.
  + move => H4; split; last by apply H3.
    by move => i ib; move : (H2 i ib) => <- /=; rewrite mapiE // (H4 i ib) mapiE //.
  move =>  [#] H4 H5.
  move => i ib; move : (H4 i ib) => /=; rewrite mapiE //= -(H2 i ib) mapiE //=. 
  have : inFq R <> Zq.zero; rewrite /R /=; move : (eq_inFq 65536 0); 1: smt().
  move => ? H0;move : (ZqField.mulfI (inFq 65536) H0) => minj. 
  by rewrite !(ZqField.mulrC _ (inFq 65536)) /#. 
by byphoare (invntt_spec _r) => /#. 
qed.

lemma invntt_correct_h (_r : Fq Array256.t):
      hoare[  M._poly_invntt :
             _r = lift_array256 arg /\
             signed_bound_cxq arg 0 256 2 ==>
             scale (invntt _r) (inFq R) = lift_array256 res /\
             forall (k : int), 0 <= k && k < 256 => b16 res.[k] (q + 1)]
by conseq (invntt_correct _r). 

(* some auxilliary definitions *) 

op cmplx_mul_169 (a :Fq * Fq, b : Fq * Fq, zzeta : Fq) =
     (a.`2 * b.`2 * zzeta * (inFq 169) + a.`1*b.`1  * (inFq 169), 
      a.`1 * b.`2  * (inFq 169) + a.`2 * b.`1  * (inFq 169)).

op doublemul(a1 : Fq * Fq, b1 : Fq * Fq, 
              a2 : Fq * Fq, b2 : Fq * Fq, zzeta : Fq) = 
     (cmplx_mul_169 a1 b1 zzeta, cmplx_mul_169 a2 b2 (-zzeta)).

op isbasemul(ap bp : Fq Array256.t, zetas : Fq Array128.t, 
            rs : Fq Array256.t, i : int) : bool = 
   forall k, 0 <= k < i %/ 4 =>
     ((rs.[4*k],rs.[4*k+1]),(rs.[4*k+2],rs.[4*k+3])) =
         (doublemul (ap.[4*k],ap.[4*k+1]) (bp.[4*k],bp.[4*k+1])
                    (ap.[4*k+2],ap.[4*k+3]) (bp.[4*k+2],bp.[4*k+3]) (zetas.[k+64])).


lemma basemul_sem p1 p2 r :
     isbasemul p1 p2 zetas r 256 =>
      r = scale (basemul p1 p2) (inFq 169). 
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
  rewrite (zetavals1 i _ case1); 1: smt(). 
  by ring.

case (i %% 4 = 1).
+ move => case2 ncase1; have subcase /= : i %% 2 = 1; 1: by smt().
  rewrite subcase; move : HH.
  have -> : 2 * ((i - 1) %/ 2) = 4 * (i %/ 4) by smt().
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
  rewrite (zetavals2 i _ case3); 1: smt(). 
  by ring.

case (i %% 4 = 3).
+ move => case4 ncase3 ncase2 ncase1; have subcase /= : i %% 2 = 1; 1: by smt().
  rewrite subcase; move : HH.
  have -> : 2 * ((i - 1) %/ 2) + 1 = 4 * (i %/ 4) + 3 by smt().
  have -> : 4 * (i %/ 4) + 3 = i by smt().
  have -> : 2*((i-1)%/2) = 4 * (i %/ 4) + 2 by smt().
  rewrite /= /cmplx_mul_169 /cmplx_mul /= => [#] ???->.
  by ring.
by smt().
qed.

lemma poly_basemul_corr _ap _bp:
   hoare[ M._poly_basemul :
     _ap = lift_array256 ap /\ _bp = lift_array256 bp /\
     signed_bound_cxq ap 0 256 2 /\  signed_bound_cxq bp 0 256 2 ==>
     signed_bound_cxq res 0 256 3 /\ 
     lift_array256 res = scale (basemul _ap _bp) (inFq 169)].
proof.
conseq (_: _ ==> 
   signed_bound_cxq res 0 256 3 /\ 
   isbasemul _ap _bp zetas (lift_array256 res) 256).
+ move => ?? result [#] ? H; split; 1:smt().  
  by apply (basemul_sem _ap _bp  (lift_array256 result)).
proc.
seq 2 : #pre; first by auto => />.
while (#pre /\ srp = rp /\
    0<= to_uint i <= 256 /\ to_uint i %% 4 = 0 /\
    to_uint zetasctr = to_uint i %/ 4 + 64 /\
    signed_bound_cxq rp 0 (to_uint i) 3 /\
    isbasemul _ap _bp zetas (lift_array256 rp) (to_uint i)); 
       last by auto => /> &hr ??; split; [ smt() | move => ??;rewrite ultE /#].

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
auto => /> &hr; rewrite /signed_bound_cxq /isbasemul /lift_array256 !ultE /=.
move => ba bb ??? zctl bprev vprev entry. 
have -> /= : i{hr} + W64.one - W64.one = i{hr} by ring.
have -> /= : i{hr} + W64.of_int 3 - W64.one = i{hr} + W64.of_int 2 by ring.
rewrite !to_uintD_small /=;1..5:smt();rewrite !zctl.
move => r1 r1val r2 r2val r3 r3val r4 r4val r5 r5val r6 r6val r7 r7val r8 r8val r9 r9val r10 r10val.

have  /= [#] redbl1 redbh1 redv1 := 
    (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr} + 1] * to_sint bp{hr}.[to_uint i{hr} + 1]) _ _); 1,2:
     by rewrite /R /=; smt().

have  /= [#] redbl2 redbh2 redv2 := 
    (SREDCp_corr (to_sint r1 * to_sint jzetas.[to_uint i{hr} %/ 4 + 64]) _ _); 1,2:
     by rewrite /R /=; move : zeta_bound; rewrite /minimum_residues; smt().

have  /= [#] redbl3 redbh3 redv3 := 
    (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr}] * to_sint bp{hr}.[to_uint i{hr}]) _ _); 1,2:
     by rewrite /R /=; smt().

have  /= [#] redbl4 redbh4 redv4 := 
    (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr}] * to_sint bp{hr}.[to_uint i{hr} + 1]) _ _); 1,2:
     by rewrite /R /=; smt().

have  /= [#] redbl5 redbh5 redv5 := 
    (SREDCp_corr(to_sint ap{hr}.[to_uint i{hr} + 1] * to_sint bp{hr}.[to_uint i{hr}]) _ _); 1,2:
     by rewrite /R /=; smt().

have  /= [#] redbl6 redbh6 redv6 := 
    (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr} + 3] * to_sint bp{hr}.[to_uint i{hr} + 3]) _ _); 1,2:
     by rewrite /R /=; smt().

have  /= [#] redbl7 redbh7 redv7 := 
    (SREDCp_corr (to_sint r6 * to_sint (- jzetas.[to_uint i{hr} %/ 4 + 64])) _ _); 1: by rewrite /R /=; smt().
+ rewrite /R /=; move : zeta_bound; rewrite /minimum_residues /bpos16 => zb. 
  by rewrite to_sintN /= /#.

have  /= [#] redbl8 redbh8 redv8 := 
    (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr}+2] * to_sint bp{hr}.[to_uint i{hr}+2]) _ _); 1,2:
     by rewrite /R /=; smt().

have  /= [#] redbl9 redbh9 redv9 := 
    (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr}+2] * to_sint bp{hr}.[to_uint i{hr} + 3]) _ _); 1,2:
     by rewrite /R /=; smt().

have  /= [#] redbl10 redbh10 redv10 := 
    (SREDCp_corr(to_sint ap{hr}.[to_uint i{hr} + 3] * to_sint bp{hr}.[to_uint i{hr}+2]) _ _); 1,2:
     by rewrite /R /=; smt().

rewrite -r1val in redbl1;rewrite -r1val in redbh1;rewrite -r1val eq_inFq in redv1.
rewrite -r2val in redbl2;rewrite -r2val in redbh2;rewrite -r2val eq_inFq in redv2.
rewrite -r3val in redbl3;rewrite -r3val in redbh3;rewrite -r3val eq_inFq in redv3.
rewrite -r4val in redbl4;rewrite -r4val in redbh4;rewrite -r4val eq_inFq in redv4.
rewrite -r5val in redbl5;rewrite -r5val in redbh5;rewrite -r5val eq_inFq in redv5.
rewrite -r6val in redbl6;rewrite -r6val in redbh6;rewrite -r6val eq_inFq in redv6.
rewrite -r7val in redbl7;rewrite -r7val in redbh7;rewrite -r7val in redv7.
rewrite eq_inFq !inFqM to_sintN in redv7; 1: by move : zeta_bound; rewrite /= /minimum_residues; smt().
rewrite inFqN in redv7.
rewrite -r8val in redbl8;rewrite -r8val in redbh8;rewrite -r8val eq_inFq in redv8.
rewrite -r9val in redbl9;rewrite -r9val in redbh9;rewrite -r9val eq_inFq in redv9.
rewrite -r10val in redbl10;rewrite -r10val in redbh10;rewrite -r10val eq_inFq in redv10.

move : zetasE; rewrite /array_mont /lift_array128 tP => zv.
move : (zv (to_uint i{hr} %/ 4 + 64) _); 1: smt().
rewrite !mapiE /=; 1,2: smt() => <-.
move => zv1. 
move : (zv (to_uint i{hr} %/ 4) _); 1: smt().
rewrite !mapiE /=; 1,2: smt() => <-.
move => zv2. 

do split; 1..4: smt().

+ move => k kb; case (k < to_uint i{hr}).
  + by move => *; rewrite !set_neqiE /#. 
  move => *; case (k = to_uint i{hr}).
  + move => *. 
    rewrite set_neqiE; 1,2: smt().
    rewrite set_neqiE; 1,2: smt().
    rewrite set_neqiE; 1,2: smt().
    rewrite set_eqiE; 1,2: smt().
    by rewrite to_sintD_small /#.
  move => *; case (k = to_uint i{hr} + 1).
  + move => *;rewrite set_neqiE; 1,2: smt().
    rewrite set_neqiE; 1,2: smt().
    rewrite set_eqiE; 1,2: smt().
    by rewrite to_sintD_small /#.
  move => *; case (k = to_uint i{hr} + 2).
  + move => *;rewrite set_neqiE; 1,2: smt().
    rewrite set_eqiE; 1,2: smt().
    by rewrite to_sintD_small /#.
  move => *;rewrite set_eqiE; 1,2: smt().
  by rewrite to_sintD_small /#.

move => k kb; rewrite /doublemul /cmplx_mul_169 !mapiE /=; 1..12:smt().

case (k < to_uint i{hr} %/4).

+ move => kbb; move: (vprev k _); 1:smt(); rewrite !mapiE /=; 1..12:smt().
  rewrite /doublemul /cmplx_mul_169 /=.
  move => /> vprev0 vprev1 vprev2 vprev3.
  by rewrite !set_neqiE /#. 

move => *; have kval : (k = to_uint i{hr} %/ 4) by smt().
have -> : 4 * k = to_uint i{hr} by smt().
do split.
+ rewrite set_neqiE; 1,2: smt().
  rewrite set_neqiE; 1,2: smt().
  rewrite set_neqiE; 1,2: smt().
  rewrite set_eqiE; 1,2: smt().
  rewrite to_sintD_small; 1: smt(). 
  rewrite inFqD redv2 redv3 !inFqM redv1 !inFqM -zv1 /zetas !initiE /=; 1,2: smt(). 
  rewrite kval zetavals1; 1,2: smt().
  rewrite ZqField.mulrA -ZqField.mulrA rrinvFq.
  by ring.
+ rewrite set_neqiE; 1,2: smt().
  rewrite set_neqiE; 1,2: smt().
  rewrite set_eqiE; 1,2: smt().
  rewrite to_sintD_small; 1: smt(). 
  rewrite inFqD redv4 redv5 !inFqM.
  by ring.
+ rewrite set_neqiE; 1,2: smt().
  rewrite set_eqiE; 1,2: smt().
  rewrite to_sintD_small; 1: smt(). 
  rewrite inFqD redv7 redv8 redv6 -zv1 /zetas !initiE /=; 1,2: smt(). 
  rewrite !inFqM kval zetavals1; 1,2:  smt(). 
  congr;congr;rewrite -ZqRing.mulrA -(ZqRing.mulrC _ (inFq 169));congr.
  rewrite ZqField.mulNr -ZqField.mulrA rrinvFq.
  by ring.
rewrite set_eqiE; 1,2: smt().
rewrite to_sintD_small; 1: smt(). 
rewrite inFqD redv9 redv10 !inFqM.
by ring.
qed.

import NTT_Fq.


end KyberPoly.
