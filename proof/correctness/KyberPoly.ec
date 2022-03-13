require import AllCore List IntDiv CoreMap IntDiv Real Number.
from Jasmin require  import JModel JMemory.
require import IntDiv_extra Ring_extra W16extra Array32 Array320 Array256 Array128 Array384.
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

lemma getsignNeg x :
      x \slt W16.zero => x `|>>` W8.of_int 15 = W16.onew.
proof.
rewrite /(`|>>`) sarE sltE !to_sintE /smod => /> hh.
apply W16.ext_eq => k kb; rewrite initiE => />.
have -> : min 15 (k+15) = 15; first by smt().
by rewrite get_to_uint => />;smt(W16.to_uint_cmp pow2_16).
qed.

lemma getsignPos x :
      (W16.zero \sle x => x `|>>` (of_int 15)%W8 = W16.zero).
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
    have -> : rp{hr}.[to_uint i{hr}] - W16.of_int 3329 + W16.of_int 3329 = rp{hr}.[to_uint i{hr}] by ring.
    by smt().
  move =>  H; rewrite (getsignPos _ _) /=; first by smt().
  by move : H;rewrite sltE to_sintD_small /to_sint /smod W16.to_uintN=> />; smt(to_uint_cmp pow2_16).

+ move => ii iib /=.
  case(ii <> to_uint i{hr}); 
     1:  by move => prior; rewrite !set_neqiE; smt(). 
  move => current; rewrite set_eqiE /=; 1,2:smt(). 
  case(rp{hr}.[to_uint i{hr}] - W16.of_int 3329 \slt W16.zero).
  + move => H; rewrite (getsignNeg _ H) //=.
    have -> : rp{hr}.[to_uint i{hr}] - W16.of_int 3329 + W16.of_int 3329 = rp{hr}.[to_uint i{hr}] by ring.
    by smt().
  move =>  H; rewrite (getsignPos _ _) /=; first by smt().
  by move : H;rewrite sltE to_sintD_small /to_sint /smod W16.to_uintN=> />; smt(to_uint_cmp pow2_16).

+ move => ii; rewrite /= to_uintD_small /=; 1: by smt(). 
  move => iib;case(ii <> to_uint i{hr}); 
     1:  by move => prior; rewrite !set_neqiE; smt(). 
  move => current; rewrite set_eqiE /=; 1,2:smt(). 
  case(rp{hr}.[to_uint i{hr}] - W16.of_int 3329 \slt W16.zero).
  + move => H; rewrite (getsignNeg _ H) //=.
    have -> : rp{hr}.[to_uint i{hr}] - W16.of_int 3329 + W16.of_int 3329 = rp{hr}.[to_uint i{hr}] by ring.
    move : H; rewrite sltE to_sintD_small /=; 
       1: by move :rbpre; rewrite /to_sint /smod /= to_uintN /= /#. 
    rewrite to_sintN /=; 1: by rewrite /to_sint /smod /=.
    by move :rbpre; rewrite /to_sint /smod /= /#.
  move =>  H; rewrite (getsignPos _ _) /=; first by smt().
  by move : H;rewrite sltE to_sintD_small /to_sint /smod W16.to_uintN=> />; smt(to_uint_cmp pow2_16).

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

lemma setbitor (r : W8.t) (w : W32.t) (v : int) j :
    0 <= j < 8 =>
    v %% 2 = to_uint (truncateu8 w) %% 2 =>
    !r.[j] => r `|` truncateu8 ((w `&` W32.one) `<<` W8.of_int j) = 
         r.[j <- bit_at v 0].
proof.
move => jb vv rj0.
have jpow : 1<= 2^j <=128. 
+ split; 1: smt(Ring.IntID.expr0 StdOrder.IntOrder.ler_weexpn2l). 
  move => *; rewrite (_: 128 = 2^7) //.
  by move : (StdOrder.IntOrder.ler_weexpn2l 2 _ j 7) => // /#.
apply W8.ext_eq => x xb.
rewrite /W32.(`<<`) /=  modz_dvd // modz_small //;1:smt().
rewrite (W8.get_to_uint (truncateu8 (w `&` W32.one `<<<` j)))  /= xb /=.
rewrite to_uint_truncateu8 /= (modz_small _ 256).
+ split; 1: by smt(W32.to_uint_cmp pow2_32).
  rewrite to_uint_shl; 1: smt().
  by rewrite modz_small /= andwC /=;  
      move : (W32.to_uint_ule_andw W32.one w); 
       rewrite !W32.of_uintK /=; smt(W32.to_uint_cmp).

case(x <> j).
+ move => neq; rewrite set_neqiE //. 
  have ? : !((w `&` W32.one) `<<<` j).[x]; last by smt(W32.get_to_uint).
  case (0 <= x-j < 32); last by smt(W32.get_out). 
  rewrite /(`&`)/=.
  move => *; rewrite(W32.get_to_uint W32.one) /=.
  have ? : 2^1<=2^(x - j); last by smt(Ring.IntID.expr1).
  by apply StdOrder.IntOrder.ler_weexpn2l =>  /#.

move => eq; rewrite set_eqiE //.
  move : rj0;rewrite (_: j = x); 1:by smt(). 
  move => -> /=; rewrite /bit_at /int2bs /mkseq /= -iotaredE /=; congr; congr.
  rewrite vv to_uint_truncateu8 /= modz_dvd //. 
  move : (W32.get_to_uint (w `&` W32.one `<<<` x) x).
  have /=  : 0 <= x < 32 by smt(). 
  move => -> /= => H.
  rewrite -b2i_mod2 -H /W32.one /= /int2bs /mkseq -iotaredE /= /b2i.
  by rewrite W32.get_to_uint /= /#.
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
rewrite /lift_array256 !mapiE /=; 1,2:smt().
rewrite (setbitor r{2} _ (compress 1 (inFq (to_sint a{1}.[8 * i{2} + j{2}]))) _) //; 2,3: by smt(W8.get_setE). 

 rewrite to_uint_truncateu8 /= /zeroextu32 /(`<<`) shlMP //=. 
 rewrite W32.to_uint_shr; first by smt().
 rewrite W32.of_uintK W8.of_uintK modz_dvd //.
 rewrite (modz_small _ W32.modulus); 1: by smt(W16.to_uint_cmp pow2_32).
 rewrite (modz_small _ 32); 1: by smt().
 rewrite -compress_alt_compress //; 1: by rewrite qE /=.
 rewrite /compress_alt !inFqK qE modz_mod /=.
 have -> : to_sint a{1}.[8 * i{2} + j{2}] %% 3329 = 
           to_uint a{1}.[8 * i{2} + j{2}].
 + move : (bound (8*i{2} + j{2}) _); 1: by smt(). 
   rewrite to_sintE /= /smod /= => boundi. 
   by rewrite modz_small; smt(W16.to_uint_cmp pow2_16).
 done.
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
         decompress 1 (b2i (bit_at (to_uint mem.[to_uint ap{1} + i{2}]) k)); last 
        by smt(Array256.set_neqiE Array256.set_eqiE).

move => kk kkb; rewrite -decompress_alt_decompress /decompress_alt //; 1: by smt(qE).
congr; rewrite qE /=.
have one : W16.one = W16.of_int (2^1-1) by smt().
rewrite /to_sint /smod /= to_uintM_small; rewrite one W16.to_uint_and_mod //=; 1: smt(). 
rewrite /bit_at /b2i /int2bs /mkseq -iotaredE /=.
rewrite to_uint_zeroextu16 /loadW8 /=.
have -> /= : !(32768 <= to_uint (mem.[to_uint ap{1} + i{2}] `>>>` kk) %% 2 * 1665) by smt().
rewrite to_uint_shr; 1: smt().
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
while (
           0 <= to_uint i <= 256 /\
           _a = lift_array256 ap /\
           _b = lift_array256 bp /\
           signed_bound_cxq ap 0 256 ab /\
           signed_bound_cxq bp 0 256 bb /\
           signed_bound_cxq rp 0 (to_uint i) (ab + bb) /\ 
           forall k, 0 <= k < to_uint i =>
              inFq (to_sint rp.[k]) = _a.[k] - _b.[k]
); last by auto => /= &hr [#] 4?; split; [ smt() | move => 2?; rewrite ultE of_uintK /=; smt()]. 

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
while (
           0 <= to_uint i <= 256 /\
           (forall k, to_uint i <= k < 256 => _a.[k] = inFq (to_sint rp.[k])) /\
           _b = lift_array256 bp /\
           signed_bound_cxq rp (to_uint i) 256 ab /\
           signed_bound_cxq bp 0 256 bb /\
           signed_bound_cxq rp 0 (to_uint i) (ab + bb) /\ 
           forall k, 0 <= k < to_uint i =>
              inFq (to_sint rp.[k]) = _a.[k] + _b.[k]
); last first. 
+ auto => /= &hr; rewrite /lift_array256 !tP => [#] av bv ??; split. 
  + do split => //; 2,3: by smt().
    by  move => k kb; move : (av k kb); rewrite !mapiE //. 
  by move => i rp; rewrite ultE of_uintK /= /#.

auto => /> &hr ??.
rewrite /signed_bound_cxq qE ultE /lift_array256 !to_uintD_small /= ; 1: by smt(W64.to_uint_cmp pow2_64).
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
exists *rp; elim* => _rp.
conseq (_:
  _rp = rp /\
 (forall i, 0<= i < 256 =>
              inFq (to_sint rp.[i]) = _a.[i]) ==> 
           forall i, 0<= i < 256 =>
              to_sint rp.[i] = BREDC (to_sint _rp.[i]) 26
). 
move => &hr.
rewrite /lift_array256 => /> i H H0.
rewrite mapiE => />.
move => &hr.
rewrite /lift_array256 => /> _rp0 H.
split.
apply Array256.ext_eq => /> x H0 H1.
rewrite !mapiE => />.
move : (H x _) => />.
move : (BREDCp_corr (to_sint rp{hr}.[x]) 26 _ _ _ _ _ _) => />.
by rewrite ?qE /R /=.
by rewrite ?qE /R /=.
by rewrite ?qE /R /=.

rewrite ?qE /R => />. 

split.
rewrite to_sintE.
have ?: 0 <= to_uint rp{hr}.[x] < W16.modulus by rewrite to_uint_cmp.
rewrite /smod /=.
case (32768 <= to_uint rp{hr}.[x]) => ?.
smt().
smt().

move => H2.
rewrite !to_sintE.
rewrite /smod.
move : (W16.to_uint_cmp rp{hr}.[x]); smt().

move => a. rewrite /R /= => H2 H3.
rewrite qE /=.
split.
rewrite /Barrett_kyber_general.barrett_pred_low.
rewrite /Barrett_kyber_general.barrett_fun.
rewrite /Barrett_kyber_general.barrett_fun_aux.
simplify.
smt().
rewrite /Barrett_kyber_general.barrett_pred_high.
rewrite /Barrett_kyber_general.barrett_fun.
rewrite /Barrett_kyber_general.barrett_fun_aux.
simplify.
smt().
rewrite -eq_inFq => /#.

move => k H0 H1.
move : (H k _) => /> H2.
move : (BREDCp_corr (to_sint rp{hr}.[k]) 26 _ _ _ _ _ _) => />.
by rewrite ?qE /R /=.
by rewrite ?qE /R /=.
by rewrite ?qE /R /=.

rewrite ?qE /R => />. 

split.
rewrite to_sintE.
have H3: 0 <= to_uint rp{hr}.[k] < W16.modulus by rewrite to_uint_cmp.
rewrite /smod /=.
case (32768 <= to_uint rp{hr}.[k]) => H4.
smt().
smt().

move => H3.
rewrite !to_sintE.
rewrite /smod.
move : (W16.to_uint_cmp rp{hr}.[k]); smt().

move => a. rewrite /R /= => H3 H4.
rewrite qE /=.
split.
rewrite /Barrett_kyber_general.barrett_pred_low.
rewrite /Barrett_kyber_general.barrett_fun.
rewrite /Barrett_kyber_general.barrett_fun_aux.
simplify.
smt().
rewrite /Barrett_kyber_general.barrett_pred_high.
rewrite /Barrett_kyber_general.barrett_fun.
rewrite /Barrett_kyber_general.barrett_fun_aux.
simplify.
smt().

by smt(@W16 @Ring.IntID @JWord.W16.WRingA @IntDiv to_sint_unsigned b16E).

while (0 <= to_uint j <= 256 /\ 
       (forall k, 0 <= k < to_uint j => to_sint rp.[k] = (BREDC (to_sint _rp.[k]) 26)) /\
       (forall k, to_uint j <= k < 256 => to_sint rp.[k] =  (to_sint _rp.[k]))); last first.
auto => /> H. 
split; first by smt().
move => ??; move : H; rewrite ultE of_uintK => />; smt(@W16 @W64).
move => *;wp; sp; ecall (barrett_reduce_corr_h (to_sint _rp.[to_uint j])); 
 auto => />. 

move => &hr H H0 H1 H2 H3; do split.
smt(@W64 @Array256).
move => H4 result H5; do split.
smt(@W64 @Array256).
rewrite to_uintD_small 1:/#; move : H3; smt(@W64).
move => k H6 H7.
case (k < to_uint j{hr}) => k_tub.
move : (H1 k); rewrite H6 k_tub //=.
smt(@W64 @Array256).
rewrite get_setE.
move : H3; smt(@W64).
have ->: k = to_uint j{hr}.
rewrite -lezNgt in k_tub.
rewrite to_uintD_small of_uintK 1:/# in H7.
smt(@W64).
simplify.
apply H5.

move => k H6 H7.

rewrite get_setE.
move : H6. 
rewrite to_uintD_small.
smt().
smt().
have ->: k = to_uint j{hr} <=> false.
move : H6. 
rewrite to_uintD_small.
smt().
smt().
simplify.
rewrite (H2 k).
move : H6. 
rewrite to_uintD_small.
smt().
smt().
done.
qed.

lemma poly_reduce_ll:
  islossless M.__poly_reduce.
proof.
proc;while (0 <= to_uint j <= 256) (256 - to_uint j).
move => z;inline *; auto => />. 
move =>  &hr H H0 H1; do split.
smt(@W64).
move => _.
rewrite to_uintD_small 1:/#; move : H1; smt(@Int @W64).
move : H1.
rewrite ultE.
rewrite of_uintK /=.
move => *.
rewrite to_uintD_small.
smt().
smt().
auto => />; smt(@W64). 
qed.

lemma poly_reduce_corr (_a : Fq Array256.t):
      phoare[ M.__poly_reduce :
          _a = lift_array256 rp ==> 
          _a = lift_array256 res /\
          forall k, 0 <= k < 256 => bpos16  res.[k] (2*q)] = 1%r.
proof. by conseq poly_reduce_ll (poly_reduce_corr_h _a). qed.

lemma formula x :
  0 <= x < 3329 =>
   (x * 16 + 1665) * (268435456 %/ 3329) %% 4294967296 %/ 268435456 = (x * 16 +1664) %/ 3329 %% 16.
proof.
  have ? :
   (all
     (fun x => (x * 16 + 1665) * (268435456 %/ 3329 ) %% 4294967296 %/ 268435456 = (x * 16 +1664) %/ 3329 %% 16)
     (range 0 3329)).
by [] => />.
by smt().
qed.


lemma poly_tobytes_corr _a (_p : address) mem : 
    equiv [ M._poly_tobytes ~ EncDec.encode12 :
             pos_bound256_cxq a{1} 0 256 2 /\
             lift_array256 a{1} = _a /\
             p{2} = _a /\
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
             lift_array256 res{1} = res{2} /\
             pos_bound256_cxq res{1} 0 256 1 ].
admitted.


lemma poly_compress_corr _a (_p : address) mem : 
    equiv [ M._poly_compress ~ EncDec.encode4 :
             pos_bound256_cxq a{1} 0 256 2 /\
             lift_array256 a{1} = _a /\
             p{2} = compress_poly 4 _a /\
             valid_range W8 Glob.mem{1} _p 128 /\
             Glob.mem{1} = mem /\ to_uint rp{1} = _p
              ==>
             lift_array256 res{1} = _a /\
             pos_bound256_cxq res{1} 0 256 1 /\
             touches mem Glob.mem{1} _p 32 /\
             load_array128 Glob.mem{1} _p = res{2}].
admitted.
(* 
proc.
seq 1 : (ap = lift_array256 a /\
           pos_bound256_cxq a 0 256 1).
call (poly_csubq_corr_h ap) => />; first by auto => />.
while (ap = lift_array256 a /\
       pos_bound256_cxq a 0 256 1 /\
       (forall k,
          0 <= k < 2* to_uint i =>
           inFq (W16.to_sint r.[k]) = roundc ap.[k]) /\
       (forall k,
            0<= k < 2*i  => 0<= to_sint r.[k] < 16) /\
       0 <= i <= 128); last first.
auto => />  *.
split. smt().
move => *. 
split; last  by smt().
move : H1; rewrite /lift_array256 => *.
apply Array256.ext_eq => /> *.
move : (H1 x _) => />; first by smt().
by rewrite !mapiE => /> ->.
auto => />.
move => *.
split.
move => *.
case (k <2*i{hr}) => /> *.
rewrite set_neqiE; first 2 by smt().
rewrite set_neqiE; first 2 by smt().
by apply (H0 k _) => />.
case (k = 2*i{hr}) => /> *.
rewrite set_neqiE; first 2 by smt().
rewrite set_eqiE; first 2 by smt().
rewrite /lift_array256 mapiE => />; first by smt().
apply (roundcimpl a{hr}.[2 * i{hr}]).
  move : H; rewrite /pos_bound256_cxq => /> *.
  by move : (H (2*i{hr}) _); smt().
rewrite (_: k = 2*i{hr} + 1); first by smt().
rewrite set_eqiE; first 2 by smt().
rewrite /lift_array256 mapiE => />; first by smt().
apply (roundcimpl a{hr}.[2 * i{hr} + 1]).
  move : H; rewrite /pos_bound256_cxq => /> *.
  by move : (H (2*i{hr} + 1) _); smt().

split; last by smt().

move : H H1; rewrite /pos_bound256_cxq => /> *.
case (k <2*i{hr}) => /> *.
rewrite set_neqiE; first 2 by smt().
rewrite set_neqiE; first 2 by smt().
by smt().
case (k = 2*i{hr}) => /> *.
rewrite set_neqiE; first 2 by smt().
rewrite set_eqiE; first 2 by smt().
by move : (roundcimpl_rng a{hr}.[2*i{hr}]); smt().
rewrite (_: k = 2*i{hr} + 1); first by smt().
rewrite set_eqiE; first 2 by smt().
by move : (roundcimpl_rng a{hr}.[2*i{hr} + 1]); smt().
qed.
*)

lemma poly_compress_ll : islossless M._poly_compress.
proc.
while (0 <= to_uint i <= 128) (128-to_uint i); last by wp; call (poly_csubq_ll); auto =>  />; smt(@W64).
move => *;  auto => /> &hr H H0.
rewrite W64.ultE W64.to_uintD_small 1:/# /= => H1.
smt(@W64).
qed.

lemma mul_mod_add_mod (x y z m : int) :
 (x * y %% m + z) %% m = (x * y + z) %% m.
proof. by move => *; rewrite -modzDm modz_mod modzDm. qed.

(*
lemma poly_decompress_restore_corr ap :
      hoare[ Mderand.poly_decompress_restore :
           ap = lift_array256 r /\
           pos_bound256_b r 0 256 (2^4) 
           ==>
           Array256.map Poly.unroundc ap = lift_array256 res /\
           signed_bound_cxq res 0 256 1 ] . 
proof.
proc.
while (#pre /\ 0 <= i <= 128 /\
     (forall k, 0 <= k < i*2 => rp.[k] = ((r.[k] * W16.of_int 3329) + W16.of_int 8) `>>` W8.of_int 4)).
  wp; skip => /> *; do split; first 2 by smt().
  move => k *.
    rewrite get_setE 1:/#.
    case (k = 2 * i{hr} + 1) => ?.
      by rewrite H6.
    rewrite get_setE 1:/#.
    case (k = 2 * i{hr}) => ?.
      by rewrite H7.
    by smt().
wp; skip => /> *; do split; first by smt().
  move => *.
  have ?: forall (k : int), 0 <= k && k < 256 => 
                            rp0.[k] = r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8 by smt().
  move : H; rewrite /pos_bound256_b.
  have ->: (forall (k0 : int), 0 <= k0 && k0 < 256 => bpos16 r{hr}.[k0] 16) =
          (forall (k0 : int), 0 <= k0 && k0 < 256 => 0 <= to_sint r{hr}.[k0] < 16) by done.
  move => *; split.
    + rewrite /lift_array256 tP => k *.
      rewrite mapE initE /= H5 /= mapE initE /= H5 /= mapE initE /= H5 /= unroundcE /= inzmodK qE /= modz_small.
        by move : (H k); rewrite H5 /= /#.
      rewrite -eq_inzmod H4 //.
      rewrite (W16.to_sintE (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8)) /smod /=.
      have ->: 32768 <= to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8) <=> false.
        rewrite shr_div_le // /=.
        have ?: to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16) < 2^16.
          by move : (W16.to_uint_cmp (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16)).
        by rewrite -ltzNge; move : H6 => /#.
      rewrite shr_div_le /= // to_uintD of_uintK /= to_uintM of_uintK /= mul_mod_add_mod -!divz_mod_mul // qE //.
      congr; congr.
      by rewrite -to_sint_unsigned 1:/# (pmod_small _ 65536) => /#.

    + rewrite /signed_bound_cxq => k *.
      rewrite b16E; split; rewrite H4 //.
      rewrite (W16.to_sintE (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8)) /smod /=.
      have ->: 32768 <= to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8) <=> false.
        rewrite shr_div_le // /=.
        have ?: to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16) < 2^16.
          by move : (W16.to_uint_cmp (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16)).
        by rewrite -ltzNge; move : H6 => /#.
      rewrite shr_div_le /= // to_uintD of_uintK /= to_uintM of_uintK /= mul_mod_add_mod qE //.
      by rewrite -to_sint_unsigned 1:/# (pmod_small _ 65536) => /#.
      move => ?.
      rewrite (W16.to_sintE (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8)) /smod /=.
      have ->: 32768 <= to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8) <=> false.
        rewrite shr_div_le // /=.
        have ?: to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16) < 2^16.
          by move : (W16.to_uint_cmp (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16)).
        by rewrite -ltzNge; move : H7 => /#.
      rewrite shr_div_le /= // to_uintD of_uintK /= to_uintM of_uintK /= mul_mod_add_mod qE //.
      by rewrite -to_sint_unsigned 1:/# (pmod_small _ 65536) => /#.
qed.
*)

lemma poly_decompress_corr mem _p (_a : W8.t Array128.t): 
    equiv [ M._poly_decompress ~ EncDec.decode4 :
             valid_range W8 Glob.mem{1} _p 128 /\
             Glob.mem{1} = mem /\ to_uint ap{1} = _p /\
             load_array128 Glob.mem{1} _p = _a
              ==>
             Glob.mem{1} = mem /\
             lift_array256 res{1} = decompress_poly 4 res{2} /\
             pos_bound256_cxq res{1} 0 256 1 ].
admitted.
(*
proof.
proc.
while (#pre /\ 0 <= i <= 128 /\
     (forall k, 0 <= k < i*2 => rp.[k] = ((r.[k] * W16.of_int 3329) + W16.of_int 8) `>>` W8.of_int 4)).
  wp; skip => /> *; do split; first 2 by smt().
  move => k *.
    rewrite get_setE 1:/#.
    case (k = 2 * i{hr} + 1) => ?.
      by rewrite H6.
    rewrite get_setE 1:/#.
    case (k = 2 * i{hr}) => ?.
      by rewrite H7.
    by smt().
wp; skip => /> *; do split; first by smt().
  move => *.
  have ?: forall (k : int), 0 <= k && k < 256 => 
                            rp0.[k] = r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8 by smt().
  move : H; rewrite /pos_bound256_b.
  have ->: (forall (k0 : int), 0 <= k0 && k0 < 256 => bpos16 r{hr}.[k0] 16) =
          (forall (k0 : int), 0 <= k0 && k0 < 256 => 0 <= to_sint r{hr}.[k0] < 16) by done.
  move => *; split.
    + rewrite /lift_array256 tP => k *.
      rewrite mapE initE /= H5 /= mapE initE /= H5 /= mapE initE /= H5 /= unroundcE /= inFqK qE /= modz_small.
        by move : (H k); rewrite H5 /= /#.
      rewrite -eq_inFq H4 //.
      rewrite (W16.to_sintE (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8)) /smod /=.
      have ->: 32768 <= to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8) <=> false.
        rewrite shr_div_le // /=.
        have ?: to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16) < 2^16.
          by move : (W16.to_uint_cmp (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16)).
        by smt.
      rewrite shr_div_le /= // to_uintD of_uintK /= to_uintM of_uintK /= mul_mod_add_mod -!divz_mod_mul // qE //.
      congr; congr.
      by rewrite -to_sint_unsigned 1:/# (pmod_small _ 65536) => /#.

    + rewrite /signed_bound_cxq => k *.
      rewrite b16E; split; rewrite H4 //.
      rewrite (W16.to_sintE (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8)) /smod /=.
      have ->: 32768 <= to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8) <=> false.
        rewrite shr_div_le // /=.
        have ?: to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16) < 2^16.
          by move : (W16.to_uint_cmp (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16)).
        by smt. 
      rewrite shr_div_le /= // to_uintD of_uintK /= to_uintM of_uintK /= mul_mod_add_mod qE //.
      by rewrite -to_sint_unsigned 1:/# (pmod_small _ 65536) => /#.
      move => ?.
      rewrite (W16.to_sintE (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8)) /smod /=.
      have ->: 32768 <= to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16 `>>` (of_int 4)%W8) <=> false.
        rewrite shr_div_le // /=.
        have ?: to_uint (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16) < 2^16.
          by move : (W16.to_uint_cmp (r{hr}.[k] * (of_int 3329)%W16 + (of_int 8)%W16)).
        by smt. 
      rewrite shr_div_le /= // to_uintD of_uintK /= to_uintM of_uintK /= mul_mod_add_mod qE //.
      by rewrite -to_sint_unsigned 1:/# (pmod_small _ 65536) => /#.
qed.
*)



(*******DIRECT NTT *******)

import Jindcpa.

lemma zeta_bound :
   minimum_residues jzetas.
 proof.
rewrite /minimum_residues qE.
apply/(Array128.allP jzetas (fun x => bpos16 x 3329)).
simplify.
rewrite (_: 
  (fun (x : W16.t) => 0 <= to_sint x < 3329) = 
  (fun (x : W16.t) => 0 <= (if 32768 <= to_uint x then to_uint x - 65536 else to_uint x) < 3329)).
apply/fun_ext => x *.
by rewrite to_sintE /smod => />.
by rewrite /all -iotaredE; cbv delta.
qed. 

equiv ntt_correct_aux :
  NTT_Fq.NTT.ntt ~ M._poly_ntt : 
        r{1} = lift_array256 rp{2} /\ 
        NTT_Fq.array_mont zetas{1} = 
           lift_array128  jzetas /\
        signed_bound_cxq rp{2} 0 256 2
          ==> 
            res{1} = lift_array256 res{2} /\
            forall k, 0<=k<256 => bpos16 res{2}.[k] (2*q).
proc.
(* Dealing with final barret reduction *)
seq 3 5 :  (r{1} = lift_array256 rp{2}); last first.
ecall{2} (poly_reduce_corr (lift_array256 rp{2})).
skip; move => &1 &2 [#] ?? [#] ? bres.
split; first by smt (@Array256).
by apply bres.

(***********************************)

seq 0 1: #pre; first by auto => />. 
sp.

(* Outer loop *)
while (
   zetasp{2} = jzetas /\
   r{1} = lift_array256 rp{2} /\
   NTT_Fq.array_mont zetas{1} = lift_array128 jzetas /\
   len{1} = to_uint len{2} /\
   zetasctr{1} = to_uint zetasctr{2}/\
   (exists l, 0 <= l <= 7 /\ len{1} = 2^l) /\
   0 <= zetasctr{1} <= 127 /\
   2*(zetasctr{1}+1)*len{1} = 256 /\
   signed_bound_cxq rp{2} 0 256 (9 - log2 len{1})); last 
    by auto => />; move => *; split; [exists 7 => />; smt()| by smt(logs log2E)].
wp; exists* zetasctr{1}; elim* => zetasctr1 l.

(* Middle loop *)
while (#{/~zetasctr1=zetasctr{1}}
        {~2*(zetasctr{1}+1)*len{1} = 256}
        {~signed_bound_cxq rp{2} 0 256 (9 - log2 len{1})}pre /\ 
       2*(zetasctr1+1)*len{1}= 256 /\
       start{1} = to_uint start{2} /\
       0 <= start{1} <= 256 /\
       start{1} = 2*(zetasctr{1} - zetasctr1)*len{1} /\
       2* (zetasctr{1} - zetasctr1 ) * to_uint len{2} <= 256 /\
       (* Nasty carry inv *)
       signed_bound_cxq  rp{2} 0 256 (9 - log2 len{1} + 1) /\
       signed_bound_cxq  rp{2} start{1} 256 (9 - log2 len{1})
       ); last first.
auto => />; move => &1 &2 zmont H H0 H1 H2 H3 cinv cbnd H4 H5.
split.
move : cbnd; rewrite /signed_bound_cxq => />. move => *;split;smt(@Fq).
move => rp start zetasctr H6 H7 H8 H9 H10 H11 H12 H13 H14 H15;rewrite uleE !shr_div => />.
split; last by  
   rewrite (logdiv2 (to_uint len{2}) (log2 (to_uint len{2}))); 
    [ smt(@W64) | smt(log2E) | smt(@W64) ].
 exists (l-1).
 split; first by move : H H0; smt(@Int).
 rewrite H1 exprD_subz 1:// //=.
 rewrite H1 in H4; move : H4; smt(@IntDiv_extra @Ring.IntID). 

wp.

(* Inner loop *)
while (#{/~start{1} = 2*(zetasctr{1} - zetasctr1) * len{1}}
        {~signed_bound_cxq  rp{2} start{1} 256 (9 - log2 len{1})} pre /\
       zeta_{1}  *  (inFq R) = inFq (to_sint zeta_0{2}) /\  
       0 <= to_sint zeta_0{2} < q /\
       start{1} = 2*(zetasctr{1} -1 - zetasctr1) * len{1} /\
       W64.to_uint cmp{2} = start{1} + len{1} /\ 
       j{1} = to_uint j{2} /\
       start{1} <= j{1} <= start{1} + len{1} /\
       (
       signed_bound_cxq  rp{2} (j{1}) (start{1} + len{1}) (9 - log2 len{1}) /\
       signed_bound_cxq  rp{2} (j{1} + len{1}) 256 (9 - log2 len{1})
       )
       );last first. 
auto => />. 
move => &1 &2  H H0 H1 lenpow2 H2  H3 H4 H5 H6 H7 H8 H9 H10 cbdloose cbdtight H11 H12 => />.

split.

(* Initialization *) 
split; last by rewrite ultE to_uintD_small; by smt(@W64).
split; first rewrite !to_uintD_small of_uintK => />. 
smt(@Ring.IntID @W64).
split.
smt(@Ring.IntID @W64).
split.
smt(@Ring.IntID @W64).
smt(@W64).
split. 
rewrite to_uintD_small  => />; first by smt(@W64). 
move : H; rewrite /array_mont /lift_array128 => H.
have HH : (forall x, 0 <= x < 128 =>
  (map (transpose Zq.( * ) (inFq R)) zetas{1}).[x] = (map (fun (x0 : W16.t) => inFq (to_sint x0)) jzetas).[x]). 
by rewrite H. 
have H13 : (to_uint zetasctr{2}  < 127); first by smt(@W64).
move : (HH (to_uint zetasctr{2} + 1)_); first by smt().
rewrite mapiE; first   by smt(@W64). 
rewrite mapiE; first   by smt(@W64 @Fq).
split.
have H13 : (to_uint zetasctr{2}  < 127); first by smt(@W64).
move : zeta_bound; rewrite /minimum_residues => /> AA; move : (AA (to_uint zetasctr{2} + 1) _); first by smt(@W64).
rewrite !to_uintD_small; first 2 by smt(@W32).
move => H14.
split;  first  by smt().
split; first  by smt().
split; first  by smt().
move : cbdtight; rewrite /signed_bound_cxq => H15.
have H16 : (to_uint start{2} + to_uint len{2} <= 256).
rewrite -H6 H9; first by smt(@W64).
split; move => k *; move : (H15 k _); by smt().

(* Termination *)
move => j_R rp H13 H14 H15 H16 H17 H18 H19 H20 H21 H22 H23 H24 H25 H26 H27.
split.
rewrite (_:to_uint j_R = to_uint start{2} + to_uint len{2}); first by smt().
split; [ by rewrite !to_uintD_small => />;  by smt(@W64) | by smt(@W64) ].
by rewrite ultE /of_uingK to_uintD_small; smt(@W64).

(* Preservation *)
wp; sp. 
ecall {2} (fqmul_corr (to_sint t{2}) (to_sint zeta_0{2})).
skip => />.

move => &1 &2 [#] mont H H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 bloose H10 H11 zetaval H12 H13 -> cmp H14 H15 btightsmall btightlarge H16 H17 result resval.

move : btightlarge; rewrite /signed_bound_cxq => /> btightlarge. 
 move : (btightlarge (to_uint (j{2} + len{2})) _);
 rewrite to_uintD_small; first 3 by smt(@W16).  
move : btightsmall; rewrite /signed_bound_cxq => /> btightsmall. 
 move : (btightsmall (to_uint (j{2})) _); first by smt(@W16).
move => jbound jlenboundl llenboundh.

have bound1 : 2 <= to_uint len{2}; first by smt(). 
have bound2 : (9 - log2 (to_uint len{2})) * q <= 8*q. 
 rewrite qE (log2E (to_uint len{2}) l) //.
case (l = 0) => H18.
move : H1.
rewrite H18.
simplify.
smt().
smt().

have bound3 : -8*q <=  to_sint rp{2}.[to_uint j{2} + to_uint len{2}]<= 8*q; first by smt().
have bound4 : -8*q <=  to_sint rp{2}.[to_uint j{2}]<= 8*q; first by smt().
have bound5 : (-R %/ 2 * q < -8*q*q ); first by smt(@Fq).

move :resval; rewrite to_uintD_small; first by smt(@W64). move => resval.

move : (SREDCp_corr (to_sint rp{2}.[to_uint j{2} + to_uint len{2}] * to_sint zeta_0{2}) _ _); first by rewrite /R qE /=.
rewrite /R qE /=.
split.

move : bound3 bound4.
rewrite qE /=.
move => /> *. smt(@W16 @Zq).
move : bound3 bound4.
rewrite qE /=.
move => /> *. smt(@W16 @Zq).

rewrite -!resval. move => sredc.

split; last first.
split.
rewrite ultE.
rewrite to_uintD_small.
smt().
rewrite to_uint1.
smt().
rewrite ultE.
rewrite to_uintD_small.
smt().
rewrite to_uint1.
smt().

split; last first.
split.
rewrite to_uintD_small. smt().
by rewrite to_uint1.
split; first by smt().


(********* bounding carries *)
(* tighter bound *)
split; last first.
(* part 1*)
move => k H18 H19.
case (k <> to_uint j{2} /\ k <> to_uint j{2} + to_uint len{2}).
  move => H20. rewrite !Array256.set_neqiE. smt(@W64).
  move : H20 => /#.
  smt(@W64).
  move : H20 => /#.
  move : (btightlarge k) => /#.

  case (k = to_uint j{2}). 
  move => *;rewrite !Array256.set_eqiE;  smt(@W64).
  move => *; rewrite (_:k = to_uint j{2} + to_uint len{2}); first by smt().
  rewrite Array256.set_neqiE; first 2 by smt(@W64). 
  rewrite Array256.set_eqiE; by smt(@W64). 
(* part 2 *)
move => k H18 H19.
case (k <> to_uint j{2} /\ k <> to_uint j{2} + to_uint len{2}).
  move => H20. rewrite !Array256.set_neqiE. smt(@W64).
  move : H20 => /#.
  smt(@W64).
  move : H20 => /#.
  move : (btightsmall k) => /#.

  case (k = to_uint j{2}). 
  move => *;rewrite !Array256.set_eqiE;  smt(@W64).
  move => *; rewrite (_:k = to_uint j{2} + to_uint len{2}); first by smt().
  rewrite Array256.set_neqiE; first 2 by smt(@W64). 
  rewrite Array256.set_eqiE; by smt(@W64). 

split; last first.
(* looser bound *)
move => k H18 H19 *.
rewrite (_: (10 - log2 (to_uint len{2})) * q = 
            ( q) + ( (9 - log2 (to_uint len{2})) * q)); first by ring.
case (k <> to_uint j{2} /\ k <> to_uint j{2} + to_uint len{2}). 
  move => *; rewrite !Array256.set_neqiE; first 4 by smt(@W64). 
       move : bloose; rewrite /signed_bound_cxq. 
rewrite (log2E (to_uint len{2}) l) //.
rewrite qE /=.
move => H21 *.
move : (H21 k).
rewrite H18 H19 /=.
smt().
    
  case (k = to_uint j{2}). 
  move => *;rewrite !Array256.set_eqiE; first 2 by smt(@W64).
rewrite (log2E (to_uint len{2}) l) //.
rewrite qE /= => *.
rewrite to_sintD_small. 
simplify.
split.
move : bound3 bound4.
rewrite qE /=.
move => /> *. smt(@W16 @Zq).
move : bound3 bound4.
rewrite qE /=.
move => /> *. smt(@W16 @Zq).
split.
move : resval.
rewrite /SREDC.
rewrite /R qE /=.
rewrite expr0.
simplify.
smt.
move : resval.
rewrite /SREDC.
rewrite /R qE /=.
rewrite expr0.
simplify.
smt.
  move => *;rewrite Array256.set_neqiE. 
split.
smt.
smt().
smt().
  rewrite Array256.set_eqiE; first 2 by smt(@W64). 
  rewrite to_sintB_small; smt(@W16 @Zq).


(*****************)
(* One goal *)
apply Array256.ext_eq.
move => x xb => />.
rewrite /lift_array256 !mapiE => />. 
split.
smt(@W64).
smt().
split.
smt(@W64).
smt().

case (x <> to_uint j{2}). 
+ case (x <> to_uint j{2} + to_uint len{2}).
   move => *.
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
      rewrite mapiE; first by smt(). by auto => />. 
   move => *.
   rewrite Array256.set_neqiE. 
split.
smt(@W64).
smt().
done.
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_neqiE. 
split.
smt(@W64).
smt().
done.
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 

   rewrite to_sintB_small; first by smt(@W16 @Fq @Zq).

   rewrite !inFqB.
   rewrite (_: inFq (to_sint result) =
     inFq (to_sint rp{2}.[to_uint j{2} + to_uint len{2}] * to_sint zeta_0{2} * 169)).
     rewrite -eq_inFq; move : sredc; smt(@Zq).

   rewrite !inFqM -zetaval.
   rewrite (_: inFq (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * (zeta_{1} * inFq R) * inFq 169 =
     inFq (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * ((zeta_{1} * inFq R) * inFq 169)); first by ring.
   rewrite (_: (zeta_{1} * inFq R) * inFq 169 = zeta_{1}).
have ->: zeta_{1} * inFq R * inFq 169 = zeta_{1} * (inFq R * inFq 169).
smt(@Zq).
have ->: inFq R * inFq 169 = inFq 1.
have ->: inFq R * inFq 169 = inFq (R * 169).
  by rewrite inFqM.
have ?: Fqcgr (R * 169) 1.

smt(RRinv).
rewrite -eq_inFq.
done.
smt (@Zq).
    by ring.

+ case (x <> to_uint j{2} + to_uint len{2}); last by smt(@Array256).
   move => *; rewrite (_: x = to_uint j{2}); first by smt().
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 

   rewrite to_sintD_small; first by smt(@W16 @Fq @Zq).

   rewrite !inFqD.
   rewrite (_: inFq (to_sint result) = 
      inFq ((to_sint rp{2}.[to_uint j{2} + to_uint len{2}] * to_sint zeta_0{2} * 169))).
      rewrite -eq_inFq; move : sredc; smt(@Zq).
      rewrite !inFqM -zetaval. 
   rewrite (_: inFq (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * (zeta_{1} * inFq R) * inFq 169 = 
     inFq (to_sint rp{2}.[to_uint j{2} + to_uint len{2}]) * ((zeta_{1} * inFq R) * inFq 169)); first by ring.
   rewrite (_: (zeta_{1} * inFq R) * inFq 169 = zeta_{1}).
have ->: zeta_{1} * inFq R * inFq 169 = zeta_{1} * (inFq R * inFq 169).
smt(@Zq).
have ->: inFq R * inFq 169 = inFq 1.
have ->: inFq R * inFq 169 = inFq (R * 169).
  by rewrite inFqM.
have ?: Fqcgr (R * 169) 1.
smt(RRinv).
rewrite -eq_inFq.
done.
smt (@Zq).

   ring.
rewrite mapE.
rewrite initE.
have ->: 0 <= to_uint j{2} && to_uint j{2} < 256.
split.
smt().
smt().
simplify.
smt(@Zq).
qed.

import NTT_Fq.
lemma ntt_correct _r :
   phoare[ M._poly_ntt :
        _r = lift_array256 rp /\ 
        signed_bound_cxq rp 0 256 2
          ==> 
            ntt _r = lift_array256 res /\
            forall k, 0<=k<256 => bpos16 res.[k] (2*q)] = 1%r.
proof.
have H0 : array_mont zetas = lift_array128  jzetas
  by rewrite zetasE /lift_array128 /to_sint /smod /=; smt(@Array128).
bypr.
move => &m [#] H H1.
apply (eq_trans _ (Pr[NTT.ntt(_r,zetas) @ &m :
   ntt _r = res])).
have -> : (
Pr[NTT.ntt(_r, zetas) @ &m : ntt _r = res] = 
Pr[M._poly_ntt(rp{m}) @ &m :
   ntt _r = lift_array256 res /\ forall (k : int), 0 <= k < 256 => bpos16 res.[k] (2 * q)]); last by auto.
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

lemma zetainv_bound :
   minimum_residues jzetas_inv.
proof.
rewrite /minimum_residues qE.
apply/(Array128.allP jzetas_inv (fun x => bpos16 x 3329)).
simplify.
rewrite (_: 
  (fun (x : W16.t) => 0 <= to_sint x < 3329) = 
  (fun (x : W16.t) => 0 <= (if 32768 <= to_uint x then to_uint x - 65536 else to_uint x) < 3329)).
apply/fun_ext => x *.
rewrite to_sintE /smod => />.
by rewrite /all -iotaredE; cbv delta.
qed. 

lemma expr_pos (b e : int) :
  0 <= b => 0 <= e => 0 <= b ^ e.
proof.
move => ?.
elim e.
rewrite expr0.
done.
move => *.
rewrite exprS.
done.
smt().
qed.

equiv invntt_correct_aux :
  NTT_Fq.NTT.invntt ~ M._poly_invntt : 
        r{1} = lift_array256 rp{2} /\ 
        array_mont_inv zetas_inv{1} = 
           lift_array128  jzetas_inv /\
        signed_bound_cxq rp{2} 0 256 2
          ==> 
            map (fun x => x * (inFq R)) res{1} = lift_array256 res{2} /\
            forall k, 0<=k<256 => b16 res{2}.[k] (q+1).
proc.
(* Dealing with final loop *)
seq 3 5 :  (r{1} = lift_array256 rp{2} /\
         zetasp{2} = jzetas_inv /\
        array_mont_inv zetas_inv{1} = 
           lift_array128  jzetas_inv /\
        signed_bound_cxq rp{2} 0 256 4
); last first.
while (j{1} = to_uint j{2} /\
       0 <= j{1} <= 256 /\
       (forall k, (0 <= k < j{1} =>
            r{1}.[k] * inFq R = inFq (to_sint rp{2}.[k])) /\
                   (j{1} <= k < 256 =>
            r{1}.[k] = inFq (to_sint rp{2}.[k]))

       ) /\
       zetas_inv.[127]{1} * inFq R * inFq R  = inFq (to_sint jzetas_inv.[127]) /\
       zeta_0{2} = jzetas_inv.[127] /\
       signed_bound_cxq rp{2} 0 256 4 /\
       (forall k, 0 <= k < j{1} =>
           b16 rp{2}.[k] (q + 1))
); last first. 
  wp;skip; move => &1 &2 [#] -> zp zvals zbnd zeta_0_R j_R.
  split.
  do split.
  + move => k; split; first by smt().
    by move => *; rewrite /lift_array256 /= mapE /= initiE //.
  + move : zvals; rewrite /array_mont_inv /lift_array128 !mapE /=. 
    rewrite Array128.tP => H.
    move : (H 127 _) => //.
  + by rewrite /zeta_0_R zp.
  + by apply zbnd.
  + by smt(@W64 b16E @Array256).

  move => j_L r_L j_R0 rp_R H ;rewrite !ultE /=.
  move => H0 [#] H1 H2 H3. 
  rewrite (_: j_L = 256); first by smt().
  move => H4 H5 H6 H7 H8.
  split.
  + rewrite /lift_array256 !mapE.
    apply Array256.ext_eq => x xb.
    rewrite !initiE //=.
    move : (H4 x) => [#] H9.
    by rewrite (H9 _) //.
  + by apply H8.

sp;wp;ecall{2} (fqmul_corr (to_sint t{2}) (to_sint jzetas_inv.[127])).

skip => />; move => &1 &2 r_L H0 H1 H2 zetaval  cbound tightbound H3 H4 H5 resval.

move : cbound; rewrite /signed_bound_cxq => /> cbound. 
move : (cbound (to_uint j{2}) _) => />.
move => jboundl jboundh.

have bound4 : -4*q <=  to_sint rp{2}.[to_uint j{2}]<= 4*q; first by smt().
have bound5 : (-R %/ 2 * q < -4*q*q ); first by smt(@Fq).

move :resval; rewrite to_uintD_small; first by smt(@W64). move => resval.

move : (SREDCp_corr (to_sint rp{2}.[to_uint j{2}] * to_sint ((W16.of_int 1441))) _ _).
by rewrite /R qE /=.
have ? : (-R %/ 2 * q < -4*q* to_sint ((of_int 1441))%W16 ).
   by rewrite /R qE to_sintE => />; smt(@W16).
simplify => />. move : (cbound (to_uint j{2}) _); first  by smt(@Fq @W16).
move => * />. 
by move : H4 jboundl jboundh; rewrite ultE qE /R !to_sintE /smod => />;smt(@W16).

move => H6.
split. 
split; first by smt(@W64).
split; first by smt(@W64).
split; last first.
split. 

move => k H7 H8.
case (k = to_uint j{2}).

   move => ->; rewrite !Array256.set_eqiE; smt(@W64).
   move => H9;rewrite !Array256.set_neqiE. rewrite H0 H3 //. rewrite H9 //.
   move : (cbound k); rewrite H7 H8 //.
move => k k_lb k_ub.

case (k = to_uint j{2}).
   by move => ->; rewrite !Array256.set_eqiE; smt(@W64). 
   move => H7;rewrite !Array256.set_neqiE. rewrite H0 H3 //. rewrite H7 //.
   move : (tightbound k). rewrite k_lb //. smt(@W64). 

move => k.
split; last first.
  move => k_lb k_ub.
  rewrite Array256.set_neqiE. rewrite H0 H3 //. move : k_lb => /#.
  rewrite Array256.set_neqiE. rewrite H0 H3 //. move : k_lb => /#.
  move : (H2 k) => /#.

move => k_lb j_ub.
case (k = to_uint j{2}).
   move => ->; rewrite !Array256.set_eqiE //. 
rewrite (_: r_L.[to_uint j{2}] * zetas_inv{1}.[127] * inFq R = 
   r_L.[to_uint j{2}] * zetas_inv{1}.[127] * inFq R * (inFq R * (inFq 169))).
have zzz: Fqcgr (R * 169) 1.
smt(RRinv).
move : zzz; rewrite eq_inFq inFqM => ->.
rewrite -Zq.oneE asintK.
by ring.

rewrite ComRing.mulrA.
rewrite resval.
(* <<<<<<< HEAD *)
move : (H2 (to_uint j{2})) => [#] H7 H8.
rewrite (H8 _) //.
rewrite (_: inFq (SREDC (to_sint rp{2}.[to_uint j{2}] * to_sint ((of_int 1441))%W16)) =
   inFq ((to_sint rp{2}.[to_uint j{2}] * to_sint ((of_int 1441))%W16 * 169))).
   rewrite -eq_inFq. move : H4 => /#.

have H10: Fqcgr (R * 169) 1.
smt(RRinv).
rewrite !inFqM /= of_sintK /=.
move : H10; rewrite eq_inFq inFqM.
move => H9.
have ->: inFq (to_sint rp{2}.[to_uint j{2}]) * zetas_inv{1}.[127] * inFq R * inFq R * inFq 169 = inFq (to_sint rp{2}.[to_uint j{2}]) * inFq (to_sint ((of_int 1441))%W16) * inFq 169. smt(@Zq).

rewrite (_: to_sint ((of_int 1441))%W16 = W16.smod 1441).
by rewrite /smod to_sintE /smod /=; smt(@W16).
done.

by move => *;rewrite !Array256.set_neqiE; smt(@W64). 
by move : H3; rewrite !ultE to_uintD_small; smt(@W64).

(***********************************)

sp.
(* Outer loop *)
while (
   zetasp{2} = jzetas_inv /\
   r{1} = lift_array256 rp{2} /\
   array_mont_inv zetas_inv{1} = lift_array128 jzetas_inv /\
   len{1} = to_uint len{2} /\
   (exists l, 1 <= l <= 8 /\ len{1} = 2^l) /\
   0 <= zetasctr{1} <= 128 /\
   zetasctr{1} = to_uint zetasctr{2} /\
   zetasctr{1} * len{1} = 128 * (len{1} - 2) /\
   signed_bound_cxq rp{2} 0 256 4); last first.
auto => />. move => &1 &2 ?cbnd.
split; first by exists (1);  smt(logs).
move : cbnd; rewrite /signed_bound_cxq => cbnd k k_i. move : (cbnd k k_i); rewrite /b16 qE. smt(@Int).

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
auto => />; move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7 H8 rp start zetasctr H9 H10 H11 H12 H13 H14 H15 H16 H17.

rewrite /(W64.(`<<`)) !uleE !of_uintK !to_uint_shl=> />.
split; last by smt(@W64).
split; first by rewrite modz_small; smt().
split; last by smt(). 
exists (l+1).
 split.
   split; first by move : H0 => /#.
   move => H18.
   rewrite (ler_weexpn2r 2 (l+1) 8) 1:// 1:// 1:/# 1://.
     smt(@W8 @Int @Ring.IntID).
   rewrite H2; smt(@Int @Ring.IntID).

wp.

(* Inner loop *)
while (#{/~start{1} = 2*(zetasctr{1} - zetasctr1) * len{1}} pre /\
       zeta_{1}  *  (inFq R) = inFq (to_sint zeta_0{2}) /\  
       0 <= to_sint zeta_0{2} < q /\
       start{1} = 2*((zetasctr{1}-1) - zetasctr1) * len{1} /\
       W64.to_uint cmp{2} = start{1} + len{1} /\ 
       j{1} = to_uint j{2} /\
       start{1} <= j{1} <= start{1} + len{1}); last first.
auto => />. 
move => &1 &2 zetasd H H0 lenpow2 H1 H2 cbd H3 H4 H5 H6 H7 H8 H9 H10 H11 => />.

split.

(* Initialization *) 
split; last by rewrite ultE to_uintD_small; by smt(@W64).
split.
split.
by smt(@W64).
split; first by smt().
split; last first.
smt(@Int @W64).
rewrite to_uintD_small; smt(@W64).

split. 
move : zetasd; rewrite /array_mont_inv /lift_array128.
move => zz.
have H12 :(forall k, 0 <= k < 127 => 
  (map (transpose Zq.( * ) (inFq R)) zetas_inv{1}).[k] = (map (fun (x : W16.t) => inFq (to_sint x)) jzetas_inv).[k]).
rewrite -zz /= => *. rewrite set_neqiE //; first by smt().
move : (H12 (to_uint zetasctr{2})_); first by smt().
rewrite mapiE; first by smt().
rewrite mapiE; first by smt().
by simplify => />.

split; last first.
rewrite to_uintD_small. smt(). 
simplify.
have ?: 0 <= to_uint len{2}.
rewrite lenpow2.
rewrite expr_pos.
done.
smt(). 
smt().

move : zetainv_bound; rewrite /minimum_residues => zbnd; 
  move : (zbnd (to_uint zetasctr{2}) _);  smt(@W64).

(* Termination *)
move => j_R rp_R *.
split.
rewrite (_:to_uint j_R = to_uint start{2} + to_uint len{2}); first by smt().
split; [ by rewrite !to_uintD_small => />;  by smt(@W64) | by smt(@W64) ].
by rewrite ultE /of_uingK to_uintD_small; smt(@W64).

(* Preservation *)

(*  Dealing with barrett reduction *)
wp; sp; exists* m{2}; elim* => m2.
seq 0 1 : (#{/~m2=m{2}}{~ m{2} = s{2} + t{2}}pre /\ 
          inFq (to_sint m{2}) = inFq(to_sint (s{2} + t{2})) /\ 
          bpos16 m{2} (2*q)).
  ecall {2}  (barrett_reduce_corr (to_sint m2)) => />.
  auto => />; move => &1 &2 H H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 H22 H23 result H26.
 by  smt().
auto => />.
move => &1 &2 [#] H H0 H1 H2 H3 H4   cbnd H5 H6 H7 H8 H9 H10 H11 H12 zetaval H13 H14 -> ??? H19?? resval.

move : cbnd; rewrite /signed_bound_cxq => /> cbnd. 
 move : (cbnd (to_uint (j{2} + len{2})) _).
 rewrite to_uintD_small.   by smt(@W16 @W64). split. 
smt(@W64).
 by smt(@W16 @W64). move => jlenbound.
 move : (cbnd (to_uint j{2}) _); first by by smt(@W64). move => jbound.

move : resval.
rewrite !to_uintD_small; first by smt(@W64).
move : H12 H6 H19; rewrite !ultE uleE => *.
move  :  (BREDCp_corr (to_sint (rp{2}.[to_uint j{2} + to_uint len{2}] + rp{2}.[to_uint j{2}])) 26 _ _ _ _ _ _) => />; first 3 by rewrite /R; smt(@Fq).

move : jlenbound jbound cbnd; rewrite qE /R !to_uintD_small /=; 1: by smt(@W16).
move => jlenbound jbound cbnd.
rewrite to_sintD_small. split. 

move : jlenbound jbound.
rewrite -to_uintD_small.
smt().
smt().
move : jlenbound jbound.
rewrite -to_uintD_small.
smt().
smt().

move : jlenbound jbound.
rewrite /R => /> *.
rewrite -to_uintD_small.
smt().
rewrite to_uintD_small.
smt().
smt().

rewrite /R qE /= => a.
rewrite /barrett_pred_low /barrett_pred_high /barrett_fun /barrett_fun_aux.
smt(@Int @IntDiv).

by move => ? resval; smt(@Zq).

(* Dealing with the multiplication *)
sp.

ecall {2} (fqmul_corr (to_sint t{2}) (to_sint zeta_0{2})).
skip => />.
move => &1 &2 rP_R [#] H H0 H1 H2 H3 H4 cbnd H5 H6 H7 H8 H9 H10 H11 H12 zetaval H13 H14 -> cmp H15 H16 H17 H18 H19 H20 H21 H22 resval.

move : cbnd; rewrite /signed_bound_cxq => /> cbnd. 
 move : (cbnd (to_uint (j{2} + len{2})) _). 
rewrite !to_uintD_small.
smt().
split.
have ?: 0 <= to_uint len{2}.
rewrite H2.
rewrite expr_pos.
done. smt(). 
move : (W64.to_uint_cmp j{2}) (W64.to_uint_cmp len{2}); smt(). 
smt(@W16 @W64).
 rewrite !to_uintD_small;  first 2  by smt(@W16 @W64). move => /> jlenboundl jlenboundh.
 move : (cbnd (to_uint j{2}) _); first by smt(@W64). move => /> jboundl jboundh.

have bound1 : 2 <= to_uint len{2}; first by smt(@Ring.IntID).
have bound2 : (-R %/ 2 < -4*q ); first by smt(@Fq).
have bound3 : (-R %/ 2 * q < -4*q*q ) by rewrite /R qE /=.

move : resval.
rewrite !to_uintD_small; first by smt(@W64).
move : (SREDCp_corr (to_sint (rP_R.[to_uint j{2}] - rP_R.[to_uint j{2} + to_uint len{2}]) * to_sint zeta_0{2}) _ _) => />; first by rewrite /R qE.
 rewrite !to_sintD_small => />.  

rewrite !to_sintN; by smt(@Fq @Zq @W16).
rewrite !to_sintN;  by smt(@Fq @Zq @W16).

 move => resbl resbh rescong resval.

split; last first. 
split.
rewrite ultE to_uintD_small 1:/# of_uintK /=.
rewrite cmp.
done.
rewrite ultE to_uintD_small 1:/# of_uintK /=.
rewrite cmp.
done.

split; last smt(@W64).

(********* bounding carries *)
split; last first.
split.
(* part 1*)

move => k H23 H24.
case (k <> to_uint j{2} /\ k <> to_uint j{2} + to_uint len{2}).
  move => [#] H25 H26; rewrite !Array256.set_neqiE.
  move : bound1 H5 H15 H17; smt(@W64 @Int @IntDiv).
  apply H26.
  move : H15 H17; smt(@W64 @Int @IntDiv).
  apply H25.
  move : (cbnd k); smt(@W64).

  case (k = to_uint j{2}). 
  move =>  ->;rewrite Array256.set_neqiE; first 2  by smt(@W64). 
  rewrite Array256.set_eqiE;   by smt(@W64). 
  move => *; rewrite (_:k = to_uint j{2} + to_uint len{2}); first by smt().
  rewrite Array256.set_eqiE; first 2 by smt(@W64). 
smt. 
(* part 2 *)

move => k H23 H24.
case (k <> to_uint j{2} /\ k <> to_uint j{2} + to_uint len{2}).
  move => [#] H25 H26; rewrite !Array256.set_neqiE.
  move : bound1 H5 H15 H17; smt(@W64 @Int @IntDiv).
  apply H26.
  move : H15 H17; smt(@W64 @Int @IntDiv).
  apply H25.
  move : (cbnd k); smt(@W64).

  case (k = to_uint j{2}). 
  move => *. rewrite Array256.set_neqiE; first 2 by smt(@W64).
  move => *. rewrite Array256.set_eqiE; by smt(@W64).
  move => *; rewrite (_:k = to_uint j{2} + to_uint len{2}); first by smt().
  rewrite Array256.set_eqiE;  by smt(@W64). 

(*****************)
(* One goal *)
apply Array256.ext_eq.
move => x xb => />.
rewrite /lift_array256 !mapiE => />.
split.
smt(@W64).
smt().
split.
have ?: 0 <= to_uint len{2}.
smt(expr_pos).
rewrite /lift_array256 /=. 
move : (W64.to_uint_cmp j{2}) (W64.to_uint_cmp len{2}); smt(). 
smt().

case (x <> to_uint j{2} + to_uint len{2}). 
+ case (x <> to_uint j{2}). 
move => *.
rewrite Array256.set_neqiE.
split.
have ?: 0 <= to_uint len{2}.
smt(expr_pos).
smt(@W64).
smt().
done.
rewrite Array256.set_neqiE.
split.
smt(@W64).
smt().
done.
rewrite Array256.set_neqiE.
split.
have ?: 0 <= to_uint len{2}.
smt(expr_pos).
smt(@W64).
smt().
done.
rewrite Array256.set_neqiE.
split.
smt(@W64).
smt().
done.
rewrite mapiE.
done.
done.
   move => *.
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_neqiE; first 2 by smt(@W64).
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite H19.
   rewrite !to_sintD_small to_uintD_small; first  by smt().
   simplify => />. smt(@Fq @W16).
   simplify => />. smt(@Fq @W16).
   by rewrite !inFqD; ring.

+ case (x <> to_uint j{2}); last by smt(@Array256).
   move => *; rewrite (_: x = to_uint j{2}  + to_uint len{2}); first by smt().
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite Array256.set_eqiE; first 2 by smt(@W64).
   rewrite Array256.set_neqiE. 
split.
smt(@W64).
smt().
smt().
   rewrite Array256.set_eqiE; first 2 by smt(@W64). 
   rewrite mapiE; first by smt(@W64).
   rewrite resval => />. 
   rewrite (_:
     inFq (SREDC (to_sint (rP_R.[to_uint j{2}] - rP_R.[to_uint j{2} + to_uint len{2}]) * to_sint zeta_0{2})) = 
     inFq ((to_sint (rP_R.[to_uint j{2}] - rP_R.[to_uint j{2} + to_uint len{2}]) * to_sint zeta_0{2} * 169))).
     rewrite -eq_inFq. apply rescong.
   rewrite (_: zeta_{1} = inFq (to_sint zeta_0{2} * 169)).
       rewrite inFqM -zetaval.
       rewrite (_: zeta_{1} * inFq R * inFq 169 =
                    zeta_{1} * (inFq R * inFq 169)); first by ring.
have ->: inFq R * inFq 169 = inFq 1.
have ->: inFq R * inFq 169 = inFq (R * 169).
  by rewrite inFqM.
have ?: Fqcgr (R * 169) 1.
smt(RRinv).
rewrite -eq_inFq.
done.
smt (@Zq). 
 
   rewrite !to_sintD_small. rewrite to_sintN /R => />;  smt(@Fq @W16). 
   rewrite !to_sintN. 
move : jboundl jboundh.
rewrite /R qE /=.
smt(@Fq @W16 @Zq).
   by rewrite -inFqB !inFqM; ring.
qed.


lemma invntt_correct _r  :
   phoare[ M._poly_invntt :
        _r = lift_array256 rp /\ 
        signed_bound_cxq rp 0 256 2
          ==> 
            scale (invntt _r) (inFq R) = lift_array256 res /\
            forall k, 0<=k<256 => b16 res.[k] (q+1)] = 1%r.
proof.
have H0 : array_mont_inv zetas_inv = lift_array128  jzetas_inv
  by rewrite zetas_invE /lift_array128 /to_sint /smod /=; smt(@Array128).
bypr.
move => &m [#] &1 &2 *.
apply (eq_trans _ (Pr[NTT.invntt( _r,zetas_inv) @ &m :
   invntt _r = res])).
have -> : (
Pr[NTT.invntt(_r, zetas_inv) @ &m : invntt _r = res] = 
Pr[M._poly_invntt(rp{m}) @ &m :
  invntt (map (fun x => x * (inFq R)) _r) = lift_array256 res /\ forall (k : int), 0 <= k < 256 => b16 res.[k] (q+1)]); last first.  
by rewrite invntt_scale.
byequiv invntt_correct_aux.
smt().
move => &10 &20.
rewrite invntt_scale /scale.  
move => [#] H2 H3.
split. 
move => ->. 
split; last by apply H3.
by apply H2.
move =>  [#] H4 H5.
move : H4; rewrite -H2.
rewrite tP !mapE.
move => H4.
have H6 : (inFq R <> Zq.zero); first by rewrite /R; smt(@Zq qE).
move : (Zq.ZqField.mulIf (inFq R) H6) => inj.
apply Array256.ext_eq => x xb.
move : (H4 x xb).
(* <<<<<<< HEAD *)
rewrite !initiE //=.
have H7 : (inFq R <> Zq.zero); first by rewrite /R; smt(@Zq qE).
  move : (Zq.ZqField.mulIf (inFq R) H7). rewrite /injective /transpose => /#.
byphoare (invntt_spec _r). smt(). smt().
qed.

lemma invntt_correct_h (_r : Fq Array256.t):
      hoare[  M._poly_invntt :
             _r = lift_array256 arg /\
             signed_bound_cxq arg 0 256 2 ==>
             scale (invntt _r) (inFq R) = lift_array256 res /\
             forall (k : int), 0 <= k && k < 256 => b16 res.[k] (q + 1)]
by conseq (invntt_correct _r). 

(* COMPLEX MULTIPLICATION IN MONTGOMERY MULTIPLICATION WITH SOME EXTRA
   CONSTANTS THAT ARE LEFT AROUND. THEY SHOULD BE  TRIVIAL TO MATCH WITH
   THE SPECS IN NTT_Fq, SO MAYBE THEY ARE NOT ACTUALLY NEEDED. *)

op complex_mul (a :Fq * Fq, b : Fq * Fq, zzeta : Fq) =
     (a.`2 * b.`2 * zzeta * (inFq 169) + a.`1*b.`1  * (inFq 169), 
      a.`1 * b.`2  * (inFq 169) + a.`2 * b.`1  * (inFq 169)).

op double_mul(a1 : Fq * Fq, b1 : Fq * Fq, 
              a2 : Fq * Fq, b2 : Fq * Fq, zzeta : Fq) = 
     (complex_mul a1 b1 zzeta, complex_mul a2 b2 (-zzeta)).

op base_mul(ap bp : Fq Array256.t, zetas : Fq Array128.t, 
            rs : Fq Array256.t, i : int) : bool = 
    0 <= i <= 256 /\
   forall k, 0 <= k < i %/ 4 =>
     ((rs.[4*k],rs.[4*k+1]),(rs.[4*k+2],rs.[4*k+3])) =
         (double_mul (ap.[4*k],ap.[4*k+1]) (bp.[4*k],bp.[4*k+1])
                    (ap.[4*k+2],ap.[4*k+3]) (bp.[4*k+2],bp.[4*k+3]) (zetas.[k+64])).

lemma poly_basemul_corr _ap _bp:
      hoare[ M._poly_basemul :
           _ap = lift_array256 ap /\
           _bp = lift_array256 bp /\
           signed_bound_cxq ap 0 256 2 /\
           signed_bound_cxq bp 0 256 2 ==>
             signed_bound_cxq res 0 256 3 /\
             base_mul _ap _bp zetas (lift_array256 res) 256].
proof.
have H : array_mont zetas = lift_array128  jzetas
  by rewrite zetasE /lift_array128 /to_sint /smod /=; smt(@Array128).
proc.
seq 2 : #pre; first by auto => />.
while (#pre /\ srp = rp /\
    0<= to_uint i <= 256 /\ to_uint i %% 4 = 0 /\
    to_uint zetasctr = to_uint i %/ 4 + 64 /\
    signed_bound_cxq rp 0 (to_uint i) 3 /\
    base_mul _ap _bp zetas (lift_array256 rp) (to_uint i)); last first. 
    auto => />.
    move => &hr ??. 
    split; first by smt(). 
    move => i0 rp0 zetasctr. 
    rewrite ultE => /> ????. smt(). 

seq 3 : (#{/~to_uint zetasctr = to_uint i %/ 4 + 64}pre /\ inFq (to_sint zeta_0) = 
            zetas.[to_uint i %/4 + 64] * inFq R /\ 
            to_uint zetasctr - 1 = to_uint i %/ 4 + 64 /\
             bpos16 zeta_0 q).

auto => />.
move => &hr mnt abnd bbnd H0 H1 H2 H3 H4 H5 rbndrval.
rewrite ultE => /> H6.
move: zeta_bound; rewrite /minimum_residues /array_mont /lift_array128. 
move => H7.

split.
rewrite -H2.
rewrite tP in H.
move : (H (to_uint zetasctr{hr})).
have ->: (0 <= to_uint zetasctr{hr} && to_uint zetasctr{hr} < 128).
  smt().
do (rewrite mapiE 1:/#).
smt(@Array128 @Zq).

split; first by rewrite to_uintD_small H2; smt(@W64).
move : (zeta_bound (to_uint zetasctr{hr})); rewrite /minimum_residues =>/>.
by rewrite qE to_sintE => />; smt(@W16).

(* First complex multiplication *)

exists* (to_uint i). elim*=>ii.

seq 6 : (#pre /\ a0 = ap.[ii] /\ a1 = ap.[ii+1] /\ b0 = bp.[ii] /\ b1 = bp.[ii+1]).
    auto => /> &hr. rewrite (_: i{hr} + W64.one - W64.one = i{hr}); first by ring. 
    rewrite ultE => /> ????????. rewrite to_uintD_small; by smt(@W64).

seq  14 : (#{/~ii = to_uint i}
            {~to_uint i %% 4 = 0}
            {~inFq (to_sint zeta_0) = zetas.[to_uint i %/ 4 + 64] * inFq R }
            {~bpos16 zeta_0 q}pre /\
            ii + 2 = to_uint i /\ to_uint i %% 4 = 2 /\
           inFq (to_sint zeta_0) = -zetas.[to_uint i %/ 4 + 64] * inFq R  /\
           -q < to_sint zeta_0 <= 0 /\
           (inFq (to_sint rp.[ii]),inFq (to_sint rp.[ii+1])) = 
             complex_mul (inFq (to_sint ap.[ii]),inFq (to_sint ap.[ii+1])) 
                         (inFq (to_sint bp.[ii]),inFq (to_sint bp.[ii+1])) 
                         (zetas.[ii %/4 + 64]) /\
             b16 rp.[ii] (3*q) /\ b16 rp.[ii+1] (3*q)).

seq 4 : (#pre /\
          inFq (to_sint r0) = 
           inFq (to_sint ap.[ii+1]) * inFq (to_sint bp.[ii+1]) * 
           zetas.[ii %/4 + 64] * (inFq 169)  + 
           inFq (to_sint ap.[ii]) * inFq (to_sint bp.[ii])  * (inFq 169) /\
           b16 r0 (3*q)
        ).


seq 1 : (#pre /\
           inFq (to_sint r0) = 
           inFq (to_sint ap.[ii+1]) * inFq (to_sint bp.[ii+1])  * (inFq 169) /\
           b16 r0 (q+1)).
ecall (fqmul_corr_h (to_sint a1) (to_sint b1)).
auto => />. 
move => &hr bas bbs H0 H1 H2 pbnd H3 H4 H5 H6 H7 H8 H9 H10 H11 rval.

move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr} + 1] * to_sint bp{hr}.[to_uint i{hr} + 1]) _ _) => />; first by smt(@Fq). 

move : bas; rewrite /signed_bound_cxq => /> bas.
 move : (bas ( (to_uint i{hr} + 1)) _). move : H0 H6; rewrite ultE of_uintK /=; smt(@W64 @Int).
 move : (bas (to_uint i{hr}) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (to_uint i{hr} + 1)) _).  move : H0 H6; rewrite ultE of_uintK /=; smt(@W64 @Int). 
 move : (bbs (to_uint i{hr}) _); first by smt(@W64). move => bibnd bi1bnd.
rewrite /R qE /=.
split.
move : ai1bnd.
rewrite /R qE => /> *.
smt. 
move : ai1bnd.
rewrite /R qE => /> *.
smt(@W16 @Int).

by rewrite eq_inFq -rval !inFqM; smt(@Fq).

seq 1 : (#{~inFq (to_sint r0) = inFq (to_sint ap.[ii + 1]) * inFq (to_sint bp.[ii + 1]) * inFq 169}pre /\
           inFq (to_sint r0) = 
           inFq (to_sint ap.[ii+1]) * inFq (to_sint bp.[ii+1]) *
               zetas.[ii %/ 4 + 64] * (inFq 169) /\
           b16 r0 (q+1)).
ecall (fqmul_corr_h (to_sint r0) (to_sint zeta_0)).
auto => />. 
move => &hr bas bbs H0 H1 H2 pbndt  H3 H4 H5 H6 zetaval H7 H8 H9 r0val H10 H11 H12 rval.

move : (SREDCp_corr (to_sint r0{hr} * to_sint zeta_0{hr}) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM r0val. 

move => H13 H14 ->.

split; first by  smt(@Fq).
split; last by  smt(@Fq).

rewrite zetaval.
have ? : (inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * inFq 169 *
(zetas.[to_uint i{hr} %/4 + 64] * inFq R) * inFq 169 =
inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * inFq 169 *
zetas.[to_uint i{hr} %/4 + 64] * (inFq (R * 169))
); first by  rewrite inFqM; ring. 

have ->: inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * inFq 169 *
(zetas.[to_uint i{hr} %/ 4 + 64] * inFq R) * inFq 169 = 
inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * inFq 169 *
zetas.[to_uint i{hr} %/4 + 64] * (inFq R * inFq 169).
smt(@Zq).
have ->: inFq R * inFq 169 = inFq 1.
have ->: inFq R * inFq 169 = inFq (R * 169).
smt(@Zq).
have ?: Fqcgr (R * 169) 1.
smt(RRinv).
rewrite -eq_inFq.
done.
have ->: inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * inFq 169 * zetas.[ to_uint i{hr}  %/4 + 64] *
inFq 1 = inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * inFq 169 * zetas.[to_uint i{hr} %/4 + 64].
smt(@Zq).
have ->: inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * inFq 169 * zetas.[to_uint i{hr} %/ 4 + 64] = inFq (to_sint ap{hr}.[to_uint i{hr} + 1]) * inFq (to_sint bp{hr}.[to_uint i{hr} + 1]) * (inFq 169 * zetas.[to_uint i{hr} %/ 4 + 64]).
smt(@Zq).
smt(@Zq).

wp.
ecall (fqmul_corr_h (to_sint a0) (to_sint b0)).
auto => />. 
move => &hr bas bbs H0 H1 H2 rbnd rv H3 zval H4 H5 H6 H7 H8 r0val H9 rval.

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (to_uint i{hr} + 1)) _); first by move : H0 H4; rewrite ultE of_uintK /=; smt(@W64 @Int).
 move : (bas (to_uint i{hr}) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
  move : (bbs ( (to_uint i{hr} + 1)) _); first by  move : H0 H4; rewrite ultE of_uintK /=; smt(@W64 @Int).
 move : (bbs (to_uint i{hr}) _); first by smt(@W64). move => bibnd bi1bnd.

move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr}] * to_sint bp{hr}.[to_uint i{hr}]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => H10 H11 H12 H13 rrval.

rewrite !to_sintD_small. smt(@Fq).
split.
rewrite  !inFqD rrval. 
by smt(@Fq). 
by smt(@Fq).

(**************)
wp.

ecall (fqmul_corr_h (to_sint a1) (to_sint b0)).
ecall (fqmul_corr_h (to_sint a0) (to_sint b1)).

auto => />.

move => &hr bas bbs H0 H1 H3 rbnd H6 H7 rv H2 zval H8 H4 H5 r0val H9 H10 H11 rval H12 rvall. 

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (to_uint i{hr} + 1)) _); first by  move : H H2; rewrite ultE of_uintK /=; smt(@W64 @Int).
 move : (bas (to_uint i{hr}) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (to_uint i{hr} + 1)) _); first by  move : H H2; rewrite ultE of_uintK /=; smt(@W64 @Int).
 move : (bbs (to_uint i{hr}) _); first by smt(@W64). move => bibnd bi1bnd.

rewrite !to_uintD_small; first 2 by smt(@W64).
move : H2; rewrite !ultE => /> H2.

split.

split; first by smt(@W64).
split; first by smt(@W64).

split.

move => k kl kh.
case (k = to_uint  i{hr}). 
  move =>H13; rewrite Array256.set_neqiE; first 2 by smt().
  rewrite Array256.set_eqiE 1:/#. apply H13. rewrite H9 H10 //=.
case (k = to_uint i{hr}+1). 
  move => *. rewrite Array256.set_eqiE; first 2 by smt(). 
   rewrite qE to_sintD_small => />.

(*********************)
(*********************)

move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr}] * to_sint bp{hr}.[to_uint i{hr} + 1]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr} + 1] * to_sint bp{hr}.[to_uint i{hr}]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rvall !inFqM. 
move => ?? rrvall.

smt(@Fq).


move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr}] * to_sint bp{hr}.[to_uint i{hr} + 1]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr} + 1] * to_sint bp{hr}.[to_uint i{hr}]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rvall !inFqM. 
move => ?? rrvall.

smt(@Fq).

(*********************)
(********************)
move => *.
rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 

move : rbnd; rewrite /signed_bound_cxq => rbnd. 
move : (rbnd k). rewrite b16E.
smt(@Fq).

split.

rewrite /base_mul. split; first by smt().

move =>  k kb kbb.

rewrite /lift_array256 !mapiE; first 12 by smt(). 
rewrite !Array256.set_neqiE; first 16 by smt(@W64). 

simplify => />.

move : rv; rewrite /base_mul => rv.

move : (rv k _); first by smt().
rewrite /lift_array256 !mapiE; first 12 by smt(). 
simplify => />.

rewrite !to_uintD_small; first by smt(@W64).

split; first by smt(@W64).
smt(@Fq).

split; first by smt(@W64).

split.
move : H4 H5 zval; rewrite qE => ??H13.
rewrite to_sintN. smt(@W16).
rewrite (_: (to_uint i{hr} + 2) %/ 4 = to_uint i{hr} %/4); first  by smt().
ring. rewrite Zq.ComRing.mulrC -H13 inFqN. 
by  ring.

move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr}] * to_sint bp{hr}.[to_uint i{hr} + 1]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[to_uint i{hr} + 1] * to_sint bp{hr}.[to_uint i{hr}]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rvall !inFqM. 
move => ?? rrvall.

rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_eqiE; first 2 by smt(@W64). 
rewrite Array256.set_eqiE; first 2 by smt(@W64). 


split.  
move : H4 H5 zval; rewrite qE => *.
rewrite to_sintN; smt(@W16).
 
split.  rewrite !to_sintD_small. by smt(qE @W16). 
rewrite inFqD.
rewrite rrval rrvall. smt(@Zq).

rewrite to_sintD_small; smt(@Zq).

(* Second complex multiplication *)

seq 6 : (#{/~a0 = ap.[ii]}{~a1 = ap.[ii+1]}{~b0 = bp.[ii]}{~b1 = bp.[ii+1]}pre /\ 
         a0 = ap.[ii+2] /\ a1 = ap.[ii+3] /\ 
         b0 = bp.[ii+2] /\ b1 = bp.[ii+3]).
    auto => /> &hr. 
    rewrite (_: i{hr} + W64.one - W64.one = i{hr}); first by ring. 
    rewrite ultE => /> H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 H10 H11 H12 H13 H14 H15 H16 H17 H18.
    rewrite to_uintD_small 1:/# of_uintK => />.
    split; first by move : H5 => /#.
    smt(@Int @W64 @Array256).


seq  13 : (#{/~ii + 2 = to_uint i}
            {~to_uint i %% 4 = 2}
            {~i \ult W64.of_int 256}
            {~to_uint zetasctr{hr} - 1 = to_uint i{hr} %/ 4 + 64}
            {~inFq (to_sint zeta_0) = - zetas.[to_uint i %/ 4 + 64] * inFq R}pre /\
            ii + 4 = to_uint i /\ to_uint i %% 4 = 0 /\ to_uint i <= 256 /\ to_uint zetasctr{hr} = to_uint i{hr} %/ 4 + 64 /\
            inFq (to_sint zeta_0) = - zetas.[to_uint i %/ 4 - 1 + 64] * inFq R /\
           (inFq (to_sint rp.[ii+2]),inFq (to_sint rp.[ii+3])) = 
             complex_mul (inFq (to_sint ap.[ii+2]),inFq (to_sint ap.[ii+3])) 
                         (inFq (to_sint bp.[ii+2]),inFq (to_sint bp.[ii+3])) 
                         (-zetas.[ii %/4 + 64]) /\
             b16 rp.[ii+2] (3*q) /\ b16 rp.[ii+3] (3*q)).

wp.
seq 4 : (#pre /\
          inFq (to_sint r0) = 
           inFq (to_sint ap.[ii+3]) * inFq (to_sint bp.[ii+3]) * 
           (-zetas.[ii %/4 + 64]) * (inFq 169)  + 
           inFq (to_sint ap.[ii+2]) * inFq (to_sint bp.[ii+2])  * (inFq 169) /\
           b16 r0 (3*q)
        ).
seq 1 : (#pre /\
           inFq (to_sint r0) = 
           inFq (to_sint ap.[ii+3]) * inFq (to_sint bp.[ii+3])  * (inFq 169) /\
           b16 r0 (q+1)).
ecall (fqmul_corr_h (to_sint a1) (to_sint b1)).
auto => />. 
move => &hr bas bbs ?? rb rv ?????? zval zbl zbh ??????? rval.

move : (SREDCp_corr (to_sint ap{hr}.[ii + 3] * to_sint bp{hr}.[ii + 3]) _ _) => />; first by smt(@Fq). 

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (ii + 3)) _); first by smt().
 move : (bas (ii+2) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (ii + 3)) _); first by smt().
 move : (bbs (ii+2) _); first by smt(@W64). move => bibnd bi1bnd.
rewrite /R qE /=.
split.
move : ai1bnd.
rewrite /R qE => /> *.
smt. 
move : ai1bnd.
rewrite /R qE => /> *.
smt. 

by rewrite eq_inFq -rval !inFqM; smt(@Fq).

seq 1 : (#{~inFq (to_sint r0) = inFq (to_sint ap.[ii + 3]) * inFq (to_sint bp.[ii + 3]) * inFq 169}pre /\
           inFq (to_sint r0) = 
           inFq (to_sint ap.[ii+3]) * inFq (to_sint bp.[ii+3]) *
               -zetas.[ii %/4 +64] * (inFq 169) /\
           b16 r0 (q+1)).
ecall (fqmul_corr_h (to_sint r0) (to_sint zeta_0)).
auto => />.
move => &hr bas bbs ?? rb rv ?????? zval zbl zbh ?????? r0val ???rval.

move : (SREDCp_corr (to_sint r0{hr} * to_sint zeta_0{hr}) _ _) => />.
  by smt(@Fq). 
  by smt(@Fq). 

rewrite eq_inFq -rval !inFqM r0val. 

move => ?? ->.

split; first by  smt(@Fq).
split; last by  smt(@Fq).

rewrite zval.
have aux : (inFq (to_sint ap{hr}.[ii + 3]) * inFq (to_sint bp{hr}.[ii + 3]) * inFq 169 *
- zetas.[ii %/4 + 64] * inFq R * inFq 169 =
(inFq R * inFq 169) * inFq (to_sint ap{hr}.[ii + 3]) * inFq (to_sint bp{hr}.[ii + 3]) *
- zetas.[ii %/4 + 64]  * inFq 169
); first by ring. 
move : aux.
rewrite (_: (inFq R * inFq 169)= inFq (R*169)); first by rewrite inFqM.
move : RRinv; rewrite eq_inFq => ->.
rewrite (_: inFq 1 = Zq.one); first by smt(@Zq). 
rewrite Zq.ComRing.mul1r. 
pose a := inFq (to_sint ap{hr}.[ii + 3]).
pose b := inFq (to_sint bp{hr}.[ii + 3]).
rewrite (_: to_uint i{hr} %/ 4 = ii %/ 4). smt().
pose z := zetas.[ii %/ 4 + 64].
pose c := inFq 169.
pose d := inFq R.
move => XX; rewrite -XX. 
by ring.

wp.
ecall (fqmul_corr_h (to_sint a0) (to_sint b0)).
auto => />. 
move => &hr bas bbs ?? rb ??rv ???? zval zbl zbh ?????? r0val ?H12?rval.

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (ii + 3)) _); first by smt().
 move : (bas (ii + 2) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (ii + 3)) _); first by smt().
 move : (bbs (ii + 2) _); first by smt(@W64). move => bibnd bi1bnd.

move : (SREDCp_corr (to_sint ap{hr}.[ii + 2] * to_sint bp{hr}.[ii + 2]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.

rewrite !to_sintD_small. smt(@Fq).
split.
rewrite  !inFqD rrval H12.  by  ring.
smt(@Zq).

ecall (fqmul_corr_h (to_sint a1) (to_sint b0)).
ecall (fqmul_corr_h (to_sint a0) (to_sint b1)).

auto => />.
move => &hr bas bbs ?? rb ?? rv   H1 ? H3 ? zval zbl zbh H5  H6 ???? r0val ???rval ?rvall. 

move : bas; rewrite /signed_bound_cxq => /> bas. 
 move : (bas ( (ii + 3)) _); first by smt().
 move : (bas (ii+2) _); first by smt(@W64). move => aibnd ai1bnd.

move : bbs; rewrite /signed_bound_cxq => /> bbs. 
 move : (bbs ( (ii + 3)) _); first by smt().
 move : (bbs (ii + 2) _); first by smt(@W64). move => bibnd bi1bnd.

rewrite !to_uintD_small; first 2 by smt(@W64).
move : H1; rewrite !ultE => /> *.

split.

split; first by smt(@W64).
split; first by smt(@W64).

split.

move => k kl kh.
case (k = ii + 2). 
  move => *.
  rewrite Array256.set_neqiE; first 2 by smt(@W64).
  rewrite Array256.set_eqiE; first by smt(@W64). smt().  smt(@Array256 @Fq). 
  move => *.
  case (k = ii + 3).  
  move => *.
  rewrite Array256.set_eqiE; first 2 by smt(@W64). 
  rewrite to_sintD_small => />. 

move : (SREDCp_corr (to_sint ap{hr}.[ii+2] * to_sint bp{hr}.[ii + 3]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[ii + 3] * to_sint bp{hr}.[ii+2]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rvall !inFqM. 
move => ?? rrvall.

smt(@Fq).

move : (SREDCp_corr (to_sint ap{hr}.[ii+2] * to_sint bp{hr}.[ii + 3]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[ii + 3] * to_sint bp{hr}.[ii+2]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rvall !inFqM. 
move => ?? rrvall.

smt(@Fq).






move => *.

rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 

move : rb; rewrite /signed_bound_cxq => rb. 
move : (rb k). rewrite b16E.
smt(@Fq).


split.

rewrite /base_mul.

rewrite -H3.

rewrite (_: (ii + 2 + 2) %/ 4 = ii %/4 + 1). smt().

split. by smt().


move => k *.
rewrite /lift_array256 !mapiE; first 12 by smt(). 

case (k < ii %/4); last first.
(**************)
move => *.
have -> : k = ii %/4; first by smt(). 
have -> : 4 * (ii %/4) = ii; first by smt(). 
simplify.
move => *; rewrite Array256.set_neqiE; first 2 by smt(@W64).
move => *; rewrite Array256.set_neqiE; first 2 by smt(@W64). 
move => *; rewrite Array256.set_neqiE; first 2 by smt(@W64). 
move => *; rewrite Array256.set_neqiE; first 2 by smt(@W64). 
move => *; rewrite Array256.set_neqiE; first 2 by smt(@W64). 
move => *; rewrite Array256.set_eqiE; first 2 by smt(@W64). 
move => *; rewrite Array256.set_eqiE; first 2 by smt(@W64). 
move :  H5 H6.
rewrite (_: odflt witness ((Sub.insub (to_sint rp{hr}.[ii] %% q)))%Sub 
    =  inFq (to_sint rp{hr}.[ii])).
  rewrite /inFq /insubd //.
rewrite (_: odflt witness ((Sub.insub (to_sint rp{hr}.[ii +1] %% q)))%Sub 
    =  inFq (to_sint rp{hr}.[ii + 1])).
  rewrite /inzmod /insubd //.

move => H5 H6.
rewrite H5 H6 /double_mul /complex_mul => />.

move : (SREDCp_corr (to_sint ap{hr}.[ii+2] * to_sint bp{hr}.[ii + 3]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[ii + 3] * to_sint bp{hr}.[ii+2]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rvall !inFqM. 
move => ?? rrvall.

rewrite to_sintD_small =>  />. smt(@W16 qE).

rewrite inFqD. rewrite rrval rrvall. by ring. 

(********************)
move => *.
move => *; rewrite !Array256.set_neqiE; first 16 by smt(@W64). 

move : rv; rewrite /base_mul => rv.

move : (rv k _); first by smt().
rewrite /lift_array256 !mapiE; first 12 by smt(). 
simplify => />.


rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_neqiE; first 2 by smt(@W64).
split.
rewrite /complex_mul //=.
move : rb => /#.

split; first by smt(). 
split; first by smt(). 
split; first by smt(). 
split; first by smt(). 

move : (SREDCp_corr (to_sint ap{hr}.[ii+2] * to_sint bp{hr}.[ii + 3]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rval !inFqM. 
move => ?? rrval.


move : (SREDCp_corr (to_sint ap{hr}.[ii + 3] * to_sint bp{hr}.[ii+2]) _ _) => />;
  first 2 by smt(@Fq). 

rewrite eq_inFq -rvall !inFqM. 
move => ?? rrvall.

split. 
rewrite (_: (to_uint i{hr} + 2) %/ 4 + 63 = to_uint i{hr} %/ 4 + 64).
smt(@IntDiv).
smt().

rewrite Array256.set_neqiE; first 2 by smt(@W64). 
rewrite Array256.set_eqiE; first 2 by smt(@W64). 
rewrite Array256.set_eqiE; first 2 by smt(@W64). 

rewrite to_sintD_small =>  />. smt(@W16 qE).
rewrite inFqD. 
split; first by rewrite rrval rrvall; rewrite /complex_mul => />. 
smt(qE).

(**** FINAL GOAL *)
by  auto => />.
qed.

import NTT_Fq.

lemma basemul_scales ap bp rs:
 base_mul ap bp zetas rs 256 =>
  rs = scale (basemul ap bp) (inFq 169). 
proof.
rewrite /base_mul /double_mul /basemul /scale /complex_mul => /> H.
apply Array256.ext_eq => /> k *.
rewrite mapiE /=; first by smt().
rewrite initiE /=; first by smt().
move : (H (k %/4) _) => />; first by smt().
rewrite /dcmplx_mul /cmplx_mul => /> H2 H3 H4 H5.
case (k %% 4 = 0).
move => H6.
have -> : (k %% 2 = 0);1:  smt().
simplify.
move : H2.
have -> : (4 * (k %/ 4)) = k. smt().
move => ->.
have -> : 2 * (k %/ 2) + 1 = k + 1. smt().
have -> : 2 * (k %/ 2) = k . smt().
rewrite zetavals1 //. by ring.
move => *.
case (k %% 4 = 1).
move => H6.
have -> : (k %% 2 = 1);1:  smt().
simplify.
move : H3.
have -> : (4 * (k %/ 4) + 1) = k. smt().
move => ->.
have -> : 2 * ((k-1) %/ 2) = 4 * (k %/ 4). smt().
have -> : (4 * (k %/ 4) + 1) = k. smt().
by ring.

case (k %% 4 = 2).
move => H6 *.
have -> : (k %% 2 = 0);1:  smt().
simplify.
move : H4.
have -> : (4 * (k %/ 4) + 2) = k. smt().
move => ->.
have -> : 2 * (k %/ 2) + 1 = k + 1. smt().
have -> : (4 * (k %/ 4) + 3) = k + 1. smt().
have -> : 2 * (k %/ 2) = k . smt().
rewrite zetavals2 //. by ring.
move => *.
have ? : k %% 4 = 3; 1: smt().
have -> : (k %% 2 = 1);1:  smt().
simplify.
move : H5.
have -> : (4 * (k %/ 4) + 3) = k. smt().
move => ->.
have -> : 2 * ((k-1) %/ 2) = 4 * (k %/ 4) + 2. smt().
have -> : (4 * (k %/ 4) + 2 + 1) = k. smt().
by ring.
qed.

end KyberPoly.
