require import Mlkem_filters_bridge_48.
require import AllCore List.
from Jasmin require import JModel_x86.
from JazzEC require import Array32 Array48 Array24 Array536 Array2048.

from CryptoSpecs require import Correctness1024.
from JazzEC require import Jkem1024_avx2.
from JazzEC require import Array16.

from JazzEC require import WArray512 Array40 Array256 Array56 WArray536 WArray2048.
require import IntDiv.

require import Mlkem_filters_bindings.
require import Mlkem_filters.

op sliceset_256_128_16 (a : W16.t Array256.t) (offset : int) (w : W128.t) : W16.t Array256.t =
  Array256.init
    (fun (i : int) =>
       W16.init
         (fun (j : int) =>
            let index = i * 16 + j in if offset <= index < offset + 128 then w.[index - offset] else a.[i].[j])).

hoare _write_u128_boundchk_corr_h _pol _ctr _in128 :
 M.__write_u128_boundchk :
 to_uint arg.`2 <= 256 + 8 /\
 arg.`1 = _pol /\ to_uint arg.`2 = _ctr /\ arg.`3 = _in128
 ==>
 res.`1 = sliceset_256_128_16 _pol (_ctr * 16) _in128.
proof.
proc.
sp 1;if.
+ (* all at once *)
  auto => /> &hr??; rewrite /= Array256.tP => i ib. 
  rewrite /sliceset_256_128_16 /= wordP => k kb.
  case (0 <= i < to_uint ctr{hr}) => *.
  + rewrite get_below; 1..2:smt(W64.to_uint_cmp).
    by rewrite initiE 1:/# /= initiE 1:/# /= /#.
  case (to_uint ctr{hr} <= i < to_uint ctr{hr} + 8) => *.
  + rewrite get_in; 1..2:smt(W64.to_uint_cmp).
    by rewrite initiE 1:/# /= initiE 1:/# /= /#.
  + rewrite get_above; 1..2:smt(W64.to_uint_cmp).
    by rewrite initiE 1:/# /= initiE 1:/# /= /#.
sp 3 => /=.
auto => /> &hr; rewrite !uleE /= => *; rewrite !to_uintD_small /= 1..3:/# /sliceset_256_128_16.
do split => *; do split => *; do split => *;rewrite tP => i ib; rewrite wordP => k kb; rewrite !initiE 1..3:/# /= => *.

(************)

+ rewrite get_set16E 1,2:/#.
  case (i = to_uint ctr{hr} + 6) => *.
  + rewrite ifT 1:/# /VPEXTR_64 /= /(`>>`) /= W16.get_to_uint W128.get_to_uint to_uint_truncateu16 /= to_uint_shr 1:/# /= bits64_div 1:/# /= kb /= of_uintK /=. 
    have -> /= : 0 <= i * 16 + k - to_uint ctr{hr} * 16 < 128 = true  by smt().
    rewrite (modz_small _ 18446744073709551616);1: by smt(W128.to_uint_cmp pow2_128).
     have -> : i * 16 + k - to_uint ctr{hr} * 16 = k + 6*16 by smt().
     congr;congr.
     rewrite -pow2_64 -pow2_32 -pow2_16 -divzMr 1,2://=.
     have -> : W64.modulus * W32.modulus = 2^(6*16) by auto.
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
     rewrite -divzMr;1,2:smt(StdOrder.IntOrder.expr_gt0).
     by congr;congr;congr;congr;rewrite Ring.IntID.exprD_nneg 1,2:/#;ring. 
  rewrite get16E /pack2_t initiE //= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  rewrite get16E set32E /(\bits8) initiE 1:/# /= /pack2_t  initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  case (2 * (to_uint ctr{hr} + 4) <= 2 * ((2 * i + k %/ 8) %/ 2) + ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %/ 8 <
    2 * (to_uint ctr{hr} + 4) + 4) => *.
  + rewrite ifT 1:/# initiE 1:/# /=.
     rewrite /VPEXTR_64 /= W32.get_to_uint W128.get_to_uint to_uint_truncateu32 /= bits64_div 1:/# /= of_uintK /=. 
    have -> /= : 0 <= i * 16 + k - to_uint ctr{hr} * 16 < 128 = true  by smt().
    rewrite (modz_small _ 18446744073709551616);1: by smt(W128.to_uint_cmp pow2_128). 
     have -> /= : 0 <=
 (2 * ((2 * i + k %/ 8) %/ 2) + ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %/ 8 - 2 * (to_uint ctr{hr} + 4)) * 8 +
 ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %% 8 < 32  by smt().
     congr;congr.
     rewrite -pow2_64 -pow2_32.
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
     rewrite -divzMr;1,2:smt(StdOrder.IntOrder.expr_gt0).
     by congr;congr;congr;congr; rewrite -(Ring.IntID.exprD_nneg 2 64) /#.
   rewrite initiE 1:/# /= initiE 1:/# /=.
   rewrite get16E set64E /(\bits8) initiE 1:/# /= /pack2_t  initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  case (2 * to_uint ctr{hr} <=
    2 * ((2 * ((2 * i + k %/ 8) %/ 2) + ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %/ 8) %/ 2) +
    ((2 * ((2 * i + k %/ 8) %/ 2) + ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %/ 8) %% 2 * 8 +
     ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %% 8) %/
    8 < 2 * to_uint ctr{hr} + 8) => *.
  + rewrite ifT 1:/# initiE 1:/# /=.
     rewrite /MOVV_64 /= W64.get_to_uint W128.get_to_uint to_uint_truncateu64 /=.
    have -> /= : 0 <= i * 16 + k - to_uint ctr{hr} * 16 < 128 = true  by smt().
     have -> /= : 0 <=
 (2 * ((2 * ((2 * i + k %/ 8) %/ 2) + ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %/ 8) %/ 2) +
  ((2 * ((2 * i + k %/ 8) %/ 2) + ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %/ 8) %% 2 * 8 +
   ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %% 8) %/
  8 - 2 * to_uint ctr{hr}) *
 8 +
 ((2 * ((2 * i + k %/ 8) %/ 2) + ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %/ 8) %% 2 * 8 +
  ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %% 8) %%
 8 < 64  by smt().
   +  congr;congr.
     rewrite -pow2_64 .
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
     congr;congr;congr;congr; rewrite Ring.IntID.exprD_nneg 1..2: /#. 
     rewrite -Ring.IntID.exprD_nneg 1,2:/#; congr;smt().
  rewrite initiE 1:/# /= ifF 1:/#; rewrite /(\bits8) initiE 1:/# /= /#. 

(************)
+   rewrite get16E set32E  /= /pack2_t  initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  case (2 * (to_uint ctr{hr} + 4) <= 2 * i + k %/ 8 < 2 * (to_uint ctr{hr} + 4) + 4) => *.
  + rewrite ifT 1:/#.
     rewrite /VPEXTR_64 /= W128.get_to_uint /(\bits8) initiE 1:/# /= bits64_div 1:/# /=. 
     rewrite W32.get_to_uint  to_uint_truncateu32 of_uintK /=.
      have -> /= : 0 <= i * 16 + k - to_uint ctr{hr} * 16 < 128 = true  by smt().
    rewrite (modz_small _ 18446744073709551616);1: by smt(W128.to_uint_cmp pow2_128).
    have -> /=: 0 <= (2 * i + k %/ 8 - 2 * (to_uint ctr{hr} + 4)) * 8 + k %% 8 < 32 by smt(). 
    congr;congr.
     rewrite -pow2_64 -pow2_32.
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
     rewrite -divzMr;1,2:smt(StdOrder.IntOrder.expr_gt0).
     congr;congr;congr;congr;rewrite Ring.IntID.exprD_nneg 1,2:/#. 
     by rewrite -!Ring.IntID.exprD_nneg  /#.
    rewrite initiE 1:/# /= initiE 1:/# /=.

   rewrite get16E set64E /(\bits8) initiE 1:/# /= /pack2_t  initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  case (2 * to_uint ctr{hr} <= 2 * ((2 * i + k %/ 8) %/ 2) + ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %/ 8 <
    2 * to_uint ctr{hr} + 8) => *.
  + rewrite ifT 1:/# initiE 1:/# /=.
     rewrite /MOVV_64 /= W64.get_to_uint W128.get_to_uint to_uint_truncateu64 /=.
    have -> /= : 0 <= i * 16 + k - to_uint ctr{hr} * 16 < 128 = true  by smt().
     have -> /= : 0 <=
 (2 * ((2 * i + k %/ 8) %/ 2) + ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %/ 8 - 2 * to_uint ctr{hr}) * 8 +
 ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %% 8 < 64  by smt().
   +  congr;congr.
     rewrite -pow2_64 .
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
     congr;congr;congr;congr; rewrite Ring.IntID.exprD_nneg 1..2: /#. 
     rewrite -Ring.IntID.exprD_nneg 1,2:/#; congr;smt().
  rewrite initiE 1:/# /= ifF 1:/#; rewrite /(\bits8) initiE 1:/# /= /#. 

(************)

rewrite get_set16E 1,2:/#.
  case (i = to_uint ctr{hr} + 4) => *.
  + rewrite ifT 1:/# /VPEXTR_64 /= /(`>>`) /= W16.get_to_uint W128.get_to_uint to_uint_truncateu16  /= bits64_div 1:/# /= kb /= of_uintK /=. 
    have -> /= : 0 <= i * 16 + k - to_uint ctr{hr} * 16 < 128 = true  by smt().
    rewrite (modz_small _ 18446744073709551616);1: by smt(W128.to_uint_cmp pow2_128).
     have -> : i * 16 + k - to_uint ctr{hr} * 16 = k + 4*16 by smt().
     congr;congr.
     rewrite -pow2_64 -pow2_16 .
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
     rewrite -divzMr;1,2:smt(StdOrder.IntOrder.expr_gt0).
     congr;congr;congr;congr;rewrite Ring.IntID.exprD_nneg 1,2:/#. 
     by smt(Ring.IntID.exprD_nneg).
 
  rewrite get16E /pack2_t initiE //= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  rewrite get16E set64E /(\bits8) initiE 1:/# /= /pack2_t  initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  case (2 * to_uint ctr{hr} <= 2 * ((2 * i + k %/ 8) %/ 2) + ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %/ 8 <
    2 * to_uint ctr{hr} + 8) => *.
  + rewrite ifT 1:/# initiE 1:/# /=.
     rewrite /MOVV_64 /= W64.get_to_uint W128.get_to_uint to_uint_truncateu64 /=.
    have -> /= : 0 <= i * 16 + k - to_uint ctr{hr} * 16 < 128 = true  by smt().
     have -> /= : 0 <=
 (2 * ((2 * i + k %/ 8) %/ 2) + ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %/ 8 - 2 * to_uint ctr{hr}) * 8 +
 ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %% 8 < 64  by smt().
   +  congr;congr.
     rewrite -pow2_64 .
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
     congr;congr;congr;congr; rewrite Ring.IntID.exprD_nneg 1..2: /#. 
     rewrite -Ring.IntID.exprD_nneg 1,2:/#; congr;smt().
  rewrite initiE 1:/# /= ifF 1:/#; rewrite /(\bits8) initiE 1:/# /= /#. 

(*****************)

   rewrite get16E set64E /(\bits8) /pack2_t  initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  case (2 * to_uint ctr{hr} <= 2 * i + k %/ 8 < 2 * to_uint ctr{hr} + 8) => *.
  + rewrite ifT 1:/# initiE 1:/# /=.
     rewrite /MOVV_64 /= W64.get_to_uint W128.get_to_uint to_uint_truncateu64 /=.
    have -> /= : 0 <= i * 16 + k - to_uint ctr{hr} * 16 < 128 = true  by smt().
     have -> /= : 0 <= (2 * i + k %/ 8 - 2 * to_uint ctr{hr}) * 8 + k %% 8 < 64  by smt().
   +  congr;congr.
     rewrite -pow2_64 .
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
     congr;congr;congr;congr; rewrite Ring.IntID.exprD_nneg 1..2: /#. 
     rewrite -Ring.IntID.exprD_nneg 1,2:/#; congr;smt().
  rewrite initiE 1:/# /= ifF 1:/#; rewrite /(\bits8) initiE 1:/# /= /#. 


(*****************)

rewrite get_set16E 1,2:/#.
  case (i = to_uint ctr{hr} + 2) => *.
     rewrite /MOVV_64 /= W16.get_to_uint W128.get_to_uint to_uint_truncateu16 /=.
    have -> /= : 0 <= i * 16 + k - to_uint ctr{hr} * 16 < 128 = true  by smt().
     rewrite kb /= ifT 1:/# /(`>>`) /=  to_uint_shr 1:/# /= to_uint_truncateu64.
     have -> : i * 16 + k - to_uint ctr{hr} * 16 = k + 2*16 by smt().
     congr;congr.
     rewrite -pow2_32 -pow2_16 .
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
     rewrite -divzMr;1,2:smt(StdOrder.IntOrder.expr_gt0).
     rewrite -Ring.IntID.exprD_nneg 1,2:/#.
    rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0); 1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
      by smt().

  rewrite get16E /pack2_t initiE //= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  rewrite get16E set32E /(\bits8) initiE 1:/# /= /pack2_t  initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  case (2 * to_uint ctr{hr} <= 2 * ((2 * i + k %/ 8) %/ 2) + ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %/ 8 <
    2 * to_uint ctr{hr} + 4) => *.
  + rewrite ifT 1:/# initiE 1:/# /=.
     rewrite /MOVV_64 /= W32.get_to_uint W128.get_to_uint to_uint_truncateu32 /=.
    have -> /= : 0 <= i * 16 + k - to_uint ctr{hr} * 16 < 128 = true  by smt().
     have -> /= : 0 <=
 (2 * ((2 * i + k %/ 8) %/ 2) + ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %/ 8 - 2 * to_uint ctr{hr}) * 8 +
 ((2 * i + k %/ 8) %% 2 * 8 + k %% 8) %% 8 < 32  by smt().
   +  congr;congr.
     rewrite -pow2_32 to_uint_truncateu64.
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
     congr;congr; rewrite Ring.IntID.exprD_nneg 1..2: /#. 
     rewrite -Ring.IntID.exprD_nneg 1,2:/# ; congr;smt().
  rewrite initiE 1:/# /= ifF 1:/#; rewrite /(\bits8) initiE 1:/# /= /#. 

(************)
+   rewrite get16E set32E  /= /pack2_t  initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  case (2 * to_uint ctr{hr} <= 2 * i + k %/ 8 < 2 * to_uint ctr{hr} + 4) => *.
  + rewrite ifT 1:/#.
     rewrite /MOVV_64 /= /(\bits8) initiE 1:/# /=  W32.get_to_uint W128.get_to_uint to_uint_truncateu32 /= to_uint_truncateu64 /=.
    have -> /= : 0 <= i * 16 + k - to_uint ctr{hr} * 16 < 128 = true  by smt().
    have -> /= : 0 <= (2 * i + k %/ 8 - 2 * to_uint ctr{hr}) * 8 + k %% 8 < 32  by smt().
     congr;congr.
     rewrite -pow2_32 -pow2_64 .
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
      by smt().

   rewrite initiE 1:/# ifF 1:/# /= /(\bits8) initiE 1:/# /= /#. 

(************)

rewrite get_set16E 1,2:/#.
  case (i = to_uint ctr{hr}) => *.
     rewrite /MOVV_64 /= W16.get_to_uint W128.get_to_uint to_uint_truncateu16 /=.
    have -> /= : 0 <= i * 16 + k - to_uint ctr{hr} * 16 < 128 = true  by smt().
     rewrite kb /= ifT  1:/# /= to_uint_truncateu64.
     rewrite -pow2_16 .
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
     rewrite dvdz_mod_div;1,2: smt(StdOrder.IntOrder.expr_gt0);1: apply dvdz_exp2l;1:smt(). 
     rewrite modz_dvd; 1: by rewrite -{1}pow2_1 expz_div 1,2:/#;1: apply dvdz_exp2l;1:smt(). 
      by smt().

   
   rewrite get16E/(\bits8) /pack2_t  initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  + rewrite ifF 1:/# /(\bits8) initiE 1:/# /= /#.
qed.

lemma _write_u128_boundchk_corr_ll : islossless  M.__write_u128_boundchk by islossless. 

phoare _write_u128_boundchk_corr _pol _ctr _in128 :
 [ M.__write_u128_boundchk :
   to_uint arg.`2 <= 256 + 8 /\
   arg.`1 = _pol /\ to_uint arg.`2 = _ctr /\ arg.`3 = _in128
   ==>
   res.`1 = sliceset_256_128_16 _pol (_ctr * 16) _in128
 ] = 1%r
by conseq _write_u128_boundchk_corr_ll ( _write_u128_boundchk_corr_h _pol _ctr _in128).


lemma bridge24 _ctr _offset _p : 
equiv [
Jkem1024_avx2.M.__gen_matrix_buf_rejection_filter24 ~ Filters.filter24 : 
  pol{1} = _p
 /\  0 <= _offset /\  _offset + 32 <= 536 
 /\  0 <= _ctr /\ _ctr  <= 256
/\  to_uint buf_offset{1} = _offset 
/\ to_uint  counter{1} = _ctr 
/\ bounds{1} = Mlkem_filters.sample_q
/\ load_shuffle{1} = Mlkem_filters.load_shuffle 
/\ mask{1} = Mlkem_filters.sample_mask
/\ sst{1} = Mlkem_filters.sample_shuffle_table 
/\ ones{1} = Mlkem_filters.sample_ones
/\ (forall k, 0 <= k < 32 => buf{1}.[to_uint buf_offset{1} + k] = 
                   buf{2}.[k]) ==> 
  0 <= _offset /\  _offset + 32 <= 536 
/\  0 <= _ctr /\ _ctr  <= 256
/\ plist (res{1}.`1) (min 256 (to_uint res{1}.`2)) =
plist _p _ctr ++ mkseq (Array16."_.[_]" res{2}.`1) ((min 256 (to_uint res{1}.`2)) - _ctr) 
/\  to_uint res{1}.`2 = to_uint res{2}.`2 + _ctr
].
proc => /=.
seq 1 1 : (#pre /\ ={f0}).
+ auto => /> &1 &2 *;congr;rewrite /sliceget_8_256_32 /=;
  (rewrite get256E -(W32u8.unpack8K (W256.init _));
  congr;apply W32u8.Pack.ext_eq => x xb;
  rewrite initiE 1:/# /= initiE; 1:smt(W64.to_uint_cmp);
  rewrite wordP => k kb;
  by rewrite get_unpack8 1:/# /(\bits8) initiE 1:/# /= initiE 1:/# /= /#).
seq 11 10 : (#pre /\ ={good, t0_0} /\ to_uint t0_0{1} < 256).
+ auto => /> &1 &2 *;rewrite /protect_64 /=.
  have -> : 255 = 2^8 - 1 by auto. 
  by rewrite and_mod 1:/# /= of_uintK /=; smt(W64.to_uint_cmp pow2_64 modz_small).

seq 13 13 : (#{/~t0_0{1}}pre /\ ={shuffle_0, shuffle_0_1} 
   /\ t0_0{1} = t0_0{2} + counter{1} 
   /\ t0_1{1} = t0_1{2} + counter{1} 
   /\ to_uint t0_0{2} <= 8 
   /\ to_uint t0_0{2} <= to_uint t0_1{2} <= to_uint t0_0{2} + 8).
auto => /> &1 &2 *;do split.
+ congr;congr;congr.
  + by rewrite vmov64_ext_256  sliceget_8_64_2048_get64;smt(W64.to_uint_cmp). 
  + by rewrite vmov64_ext_128  sliceget_8_64_2048_get64;1: by  
    rewrite (_: 255 = 2^8 - 1) 1://= !and_mod 1:/# /= /(`>>`) !to_uint_shr /=;[ by done | by rewrite !of_uintK /= /#].
  + rewrite vmov64_ext_256  vmov64_ext_128 sliceget_8_64_2048_get64;1:smt(W64.to_uint_cmp). 
    rewrite sliceget_8_64_2048_get64;1: rewrite (_: 255 = 2^8 - 1) 1://= !and_mod 1:/# /= /(`>>`) !to_uint_shr /=; [  by done | by rewrite !of_uintK /= /# | by done].
  + rewrite vmov64_ext_256  vmov64_ext_128.
    rewrite sliceget_8_64_2048_get64;1: smt(W64.to_uint_cmp).
    rewrite sliceget_8_64_2048_get64;1: rewrite (_: 255 = 2^8 - 1) 1://= !and_mod 1:/# /= /(`>>`) !to_uint_shr /=; [  by done | by rewrite !of_uintK /= /# | by done ]. 
  + rewrite vmov64_ext_128.
    rewrite sliceget_8_64_2048_get64;1: rewrite (_: 255 = 2^8 - 1) 1://= !and_mod 1:/# /= /(`>>`) !to_uint_shr /=; [  by done | by rewrite !of_uintK /= /# | by done ]. 
  + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
    by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
  + move => *. 
    have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
    by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
  + move => *. 
    rewrite !to_uintD_small /= .   
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
    + have := poprng ((good{2} `>>` (of_int 16)%W8) `&` (of_int 255)%W64) _;last first. 
      have := poprng ((good{2} `>>` (of_int 8)%W8) `&` (of_int 255)%W64) _;last 
         by smt(poprng W64.to_uintD_small pow2_64).
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.
      by rewrite (:255 = 2^8 -1) 1://= and_mod 1:/# /= of_uintK /= /#.

wp;ecall {1} (_write_u128_boundchk_corr pol{1} (to_uint t0_0{1}) t128{1}).
wp;ecall {1} (_write_u128_boundchk_corr pol{1} (to_uint counter{1}) t128{1}).
auto => />.
move => &1 &2 ???? H ???; split; 1: by smt().
move => ? r2 Hr2v; split; 1: by smt(W64.to_uintD_small pow2_64).
move  => ? r1 Hr1v; split; last  by smt(W64.to_uintD_small pow2_64).
rewrite to_uintD_small /=;1: smt().
rewrite /plist;apply (eq_from_nth witness). 
+ rewrite size_cat !size_mkseq;smt(W64.to_uint_cmp).
move => i; rewrite size_mkseq /= => ib;rewrite nth_cat !size_mkseq.
case (i < to_uint counter{1}) => *.
+ rewrite ifT 1:/#.
  rewrite !nth_mkseq; 1,2:smt(W64.to_uint_cmp). 
  rewrite Hr1v /sliceset_256_128_16 initiE 1:/# /=.
  rewrite wordP => k kb.
  rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
  rewrite !to_uintD_small 1:/# ifF; 1: smt(W64.to_uint_cmp pow2_64).
  rewrite Hr2v /sliceset_256_128_16 initiE 1:/# /=.
  rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
  by rewrite ifF; smt(W64.to_uint_cmp pow2_64).

case (i < to_uint counter{1} + to_uint t0_0{2}) => *.
+ rewrite ifF 1:/#.
  rewrite !nth_mkseq; 1,2:smt(W64.to_uint_cmp). 
  rewrite Hr1v /sliceset_256_128_16 initiE 1:/# /=.
  rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
  rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
  rewrite wordP => k kb.
  rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
  rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
  rewrite !to_uintD_small 1:/# ifF; 1: smt(W64.to_uint_cmp pow2_64).
  rewrite ifF; 1: smt(W64.to_uint_cmp pow2_64).
  rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
  rewrite ifT; 1: smt(W64.to_uint_cmp pow2_64).
  rewrite Hr2v /sliceset_256_128_16 initiE 1:/# /=.
  rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
  rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
  rewrite ifT; 1: smt(W64.to_uint_cmp pow2_64).
  by rewrite -!get_w2bits -BVA_truncate_Top_JWord_W256_t_Top_JWord_W128_t.bvtruncateP nth_take /#.

+ rewrite ifF 1:/#.
  rewrite !nth_mkseq; 1,2:smt(W64.to_uint_cmp). 
  rewrite Hr1v /sliceset_256_128_16 initiE 1:/# /=.
  rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
  rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
  rewrite wordP => k kb.
  rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
  rewrite  initiE /=; 1:smt(W64.to_uint_cmp size_mkseq).
  rewrite !to_uintD_small 1:/# ifT; 1: smt(W64.to_uint_cmp pow2_64).
  rewrite ifT; 1: smt(W64.to_uint_cmp pow2_64).
  rewrite extract_256_128E 1:/# -!get_w2bits. 
  rewrite /VEXTRACTI128 /=.
  have -> : b2i W8.one.[0] = 1 by rewrite get_to_uint to_uint1  /#.
  rewrite bits128E initiE /#.
qed.

import W12.


hoare buf_rejection_filter24_h _pol _ctr _buf _buf_offset:
 Jkem1024_avx2.M.__gen_matrix_buf_rejection_filter24
 : counter = _ctr
   /\ W64.to_uint _buf_offset + 32 < 536
   /\ W64.to_uint _ctr <= 256
   /\ pol = _pol
   /\ buf = _buf
   /\ buf_offset = _buf_offset
   /\ auxdata_ok load_shuffle mask bounds ones sst
   ==>
   let l = take (256-to_uint _ctr) (rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint _buf_offset + 24)))
   in plist res.`1 (to_uint _ctr + size l)
      = plist _pol (to_uint _ctr) ++ l
      /\ min 256 (to_uint res.`2) = to_uint _ctr + size l.
proof.
conseq  (bridge24 (to_uint _ctr) (to_uint _buf_offset) _pol)(filter24P (Array32.init (fun i => _buf.[to_uint _buf_offset+i]))).  
  + move => &1 [#] ??????;rewrite /auxdata_ok => [#] ->->->->->.
    exists ((Array32.init (fun (i : int) => _buf.[to_uint _buf_offset + i])), witness).
    auto => />; do split;1..5: smt(W64.to_uint_cmp). 
    + rewrite /Mlkem_filters.load_shuffle /Mlkem_filters.load_shuffle /u8_256_32.
      rewrite wordP => i ib;rewrite pack32wE 1:/# of_listK /= 1:/# initiE 1:/# /=;do      congr;rewrite /Mlkem_filters.sample_load_shuffle.
      rewrite !get_of_list 1,2:/#. 
      by smt().
  + by move => *; rewrite initiE /#. 
+ move => &1 &2 /=.
  rewrite /rejection16 /buf_subl /rejection /= -map_comp /(\o) /=.
  have -> : to_uint _buf_offset + 24 - to_uint _buf_offset = 24 by smt().
  move => [#] ???.
  pose xx := pmap _ _.
  pose yy := List.map _ _.
  have ? : map W12.to_uint xx = map W16.to_uint yy; last first.
  move => /= ? [# Hs1 Hs2] [# Hl1 Hl2] .
  split; last first. 
  + rewrite Hs2 Hl2 /yy; smt(@List size_map take_oversize size_ge0 count_size size_filter size_bytes2coeffs W64.to_uint_cmp size_drop Array536.size_to_list).
  + move :Hs1.
    have ->: (min 256 (to_uint res{1}.`2)) = to_uint _ctr + size (take (256 - to_uint _ctr) yy) by smt(size_take size_map take_oversize size_ge0 count_size size_filter size_bytes2coeffs W64.to_uint_cmp size_drop Array536.size_to_list).
    move => ->.
    congr. 
    apply (eq_from_nth witness).
    + rewrite size_mkseq;1: smt(size_ge0).
    rewrite size_mkseq => i ib.
    rewrite nth_mkseq;1:smt(size_ge0).
    rewrite Hl1;1:smt(size_ge0 size_map size_take).   
    rewrite to_uint_eq.
    rewrite -BVA_zextend_Top_Bindings_W12_t_Top_JWord_W16_t.bvzextendP.
    have : nth witness (map W12.to_uint xx) i  = nth witness (map W16.to_uint yy) i by smt().
    do 2!(rewrite (nth_map witness); smt(size_ge0 @List)). 
    

(* THE MAIN LEMMA *)
rewrite /yy /bytes2coeffs.
have -> : BitEncoding.BitChunking.chunk 12 (JWordList.Bytes2Bits.bytes_to_bits (take 24 (drop (to_uint _buf_offset) (bufl _buf)))) =
    map W12.w2bits (map (fun i => sliceget_8_12_24
                     (Array24.init ("_.[_]" (Array32.init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0]))))
                     (12 * i)) (iota_ 0 16)); last first.

rewrite -map_comp -map_comp filter_map -map_comp.
rewrite /xx pmap_map -map_comp filter_map -map_comp /(\o) /preim /=.
apply (eq_from_nth witness).
+ rewrite !size_map !size_filter.
  elim (iota_ 0 16); 1: by auto.
  move => x l I.
  rewrite /= I;congr;congr.
  rewrite /predC1 W12.ultE /= /to_uint /#.
move => i ib.
congr.
elim (iota_ 0 16); 1: by auto.
move => x l.
pose F1 := (fun (x0 : int) =>
     to_uint
       (oget
          (if sliceget_8_12_24
                (Array24.init ("_.[_]" (Array32.init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0])))) (
                12 * x0) \ult
              W12.of_int 3329 then
             Some
               (sliceget_8_12_24
                  (Array24.init ("_.[_]" (Array32.init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0])))) (
                  12 * x0))
           else None))).
pose P1 := (fun (x0 : int) =>
        predC1 None
          (if sliceget_8_12_24
                (Array24.init ("_.[_]" (Array32.init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0])))) (
                12 * x0) \ult
              W12.of_int 3329 then
             Some
               (sliceget_8_12_24
                  (Array24.init ("_.[_]" (Array32.init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0])))) (
                  12 * x0))
           else None)).
pose F2 := (fun (x0 : t) => to_uint ((of_int ((GFq.Zq.asint ((GFq.Zq.incoeff ((BitEncoding.BS2Int.bs2int (w2bits x0)))))))%GFq.Zq))%W16).
pose P2 := (fun (x0 : t) => (BitEncoding.BS2Int.bs2int (w2bits x0)) < GFq.q).
rewrite !filter_cons. 
case (P1 x) => /=.
+ move => HP1 ->.
  have HH /= : P2 (sliceget_8_12_24 (Array24.init ("_.[_]" (Array32.init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0]))))
           (12 * x)).
    + move : HP1; rewrite /P1 /P2 /=.
    by rewrite /predC1 ultE /= /to_uint /#.
  rewrite HH /F1 /F2.
   rewrite /predC1 ultE /= GFq.Zq.incoeffK /=.
   pose a :=  (sliceget_8_12_24
              (Array24.init ("_.[_]" (Array32.init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0])))) (
              12 * x)).
  rewrite of_uintK /q /= modz_small 1:/# /to_uint /=.
  rewrite ifT 1:/# modz_small;smt(W12.to_uint_cmp).

+ move => HP1 ->.
  have HH /= : !P2 (sliceget_8_12_24 (Array24.init ("_.[_]" (Array32.init (fun (i0 : int) => _buf.[to_uint _buf_offset + i0]))))
           (12 * x)).
    + move : HP1; rewrite /P1 /P2 /=.
    by rewrite /predC1 ultE /= /to_uint /#.
  rewrite /= HH /F1 /F2 => />.

(* bit flipping *)
rewrite -map_comp.
have Hs : size
    ((BitEncoding.BitChunking.chunk 12 ((JWordList.Bytes2Bits.bytes_to_bits (take 24 (drop (to_uint _buf_offset) (bufl _buf))))))) = 16.
+ rewrite !size_map !size_iota /= /max /=.
  rewrite /bytes_to_bits size_flatten -map_comp /(\o). 
  rewrite StdBigop.Bigint.sumzE /to_list /= /mkseq -map_drop drop_iota;1: smt(W64.to_uint_cmp).
  by rewrite -map_take take_iota StdBigop.Bigint.BIA.big_map /(\o)  /= /predT /= -/predT StdBigop.Bigint.big_constz count_predT /= size_map size_iota /= /#. 

have Hs2 : size
    ((JWordList.Bytes2Bits.bytes_to_bits (take 24 (drop (to_uint _buf_offset) (bufl _buf))))) %/ 12 = 16.
  rewrite /bytes_to_bits size_flatten -map_comp /(\o).
  rewrite StdBigop.Bigint.sumzE /to_list /= /mkseq -map_drop drop_iota;1: smt(W64.to_uint_cmp).
  by rewrite -map_take take_iota StdBigop.Bigint.BIA.big_map /(\o)  /= /predT /= -/predT StdBigop.Bigint.big_constz count_predT /= size_map size_iota /= /#. 

apply (eq_from_nth witness);1: by rewrite Hs !size_map !size_iota /= /max /=.

rewrite Hs => i ib.
rewrite !(nth_map witness)/= /(\o) /=; 1,2: by smt(size_iota).
rewrite Hs2 nth_iota 1:/# /=.

have Hs3: 
size
      (take 12
         (drop (12 * i) ((JWordList.Bytes2Bits.bytes_to_bits (take 24 (drop (to_uint _buf_offset) (bufl _buf))))))) = 12 by smt(size_take size_drop).

apply (eq_from_nth witness);1: smt(W12.size_w2bits). 
rewrite Hs3;move => k kb.
rewrite nth_take 1,2:/# nth_drop 1,2:/# /w2bits nth_mkseq 1:/# /=.
rewrite /bytes_to_bits /sliceget_8_12_32 initiE 1:/# /= initiE 1:/# initiE 1:/# /=.
have -> := BitEncoding.BitChunking.nth_flatten witness 8 (map W8.w2bits (take 24 (drop (to_uint _buf_offset) (bufl _buf)))) (12*i+k) _.
+ rewrite allP => x.
  rewrite mapP => He; elim He => vv /=;smt(W8.size_w2bits).
  rewrite (nth_map witness);1: by smt(size_take size_drop Array536.size_to_list).
  rewrite /w2bits nth_mkseq 1:/# /= nth_take 1,2:/# nth_drop /#.
 qed.


lemma buf_rejection_filter24_ll:
 islossless Jkem1024_avx2.M.__gen_matrix_buf_rejection_filter24
 by islossless.

phoare buf_rejection_filter24_ph _pol _ctr _buf _buf_offset:
 [Jkem1024_avx2.M.__gen_matrix_buf_rejection_filter24
 :counter = _ctr
   /\ W64.to_uint _buf_offset + 32 < 536
   /\  W64.to_uint _ctr <= 256
   /\ pol = _pol
   /\ buf = _buf
   /\ buf_offset = _buf_offset
   /\ auxdata_ok load_shuffle mask bounds ones sst
   ==>
   let l = take (256-to_uint _ctr) (rejection16 (buf_subl _buf (to_uint _buf_offset) (to_uint _buf_offset + 24)))
   in plist res.`1 (to_uint _ctr + size l)
      = plist _pol (to_uint _ctr) ++ l
      /\ 
      min 256 (to_uint res.`2) = to_uint _ctr + size l
] = 1%r.
proof.
by conseq buf_rejection_filter24_ll (buf_rejection_filter24_h _pol _ctr _buf _buf_offset).
qed.
