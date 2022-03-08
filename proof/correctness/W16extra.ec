require import AllCore List IntDiv CoreMap IntDiv.
from Jasmin require  import JModel JMemory.
import W16.

op b16 (a : W16.t) (b : int) = -b <= to_sint a < b axiomatized by b16E.

op bpos16 (a : W16.t) (b : int) = 0 <= to_sint a < b  axiomatized by bpos16E.

op bw16 (a : W16.t) i = -2^i <= to_sint a < 2^i  axiomatized by bw16E.

hint simplify b16E.
hint simplify bpos16E.
hint simplify bw16E.

lemma to_sint_unsigned (x : W16.t): 0 <= to_sint x => to_sint x = to_uint x 
   by smt(to_sintE to_uint_cmp).

lemma to_sintD_small (a b : W16.t):
-W16.modulus %/2 <= to_sint a + to_sint b < W16.modulus %/2 =>
      to_sint (a + b) = to_sint a + to_sint b
  by rewrite !to_sintE /smod /= to_uintD;smt(to_uint_cmp).

lemma to_sintB_small(a b : W16.t):
    -W16.modulus %/2 <= to_sint a - to_sint b < W16.modulus %/2 =>
          to_sint (a - b) = to_sint a - to_sint b
 by rewrite !W16.to_sintE !/smod /= to_uintD to_uintN modzDmr; smt(to_uint_cmp).

lemma to_sintb_lt0(x y : W16.t): 
    0 <= to_sint x =>
    0 <= to_sint y =>
    to_sint (x - y) < 0 => to_sint x < to_sint y.
proof.
rewrite (to_sintE x) (to_sintE y) /smod /=.
move : (to_uint_cmp x)  (to_uint_cmp y) => /=.
case (32768 <= to_uint x); 1: by smt(). 
case (32768 <= to_uint y); 1: by smt(). 
by move => b1 b2 xl xh yl yh; rewrite to_sintB_small /=;
  rewrite!to_sintE /smod /=; smt().
qed.

lemma to_sintM_small(a b : W16.t): 
    -W16.modulus %/2 <= to_sint a * to_sint b < W16.modulus %/2 =>
    to_sint (a * b) = to_sint a * to_sint b.
proof.
rewrite !to_sintE !/smod /= to_uintM /=. 
by case(32768 <= to_uint a); case(32768 <= to_uint b);  smt(). 
qed.

lemma to_sintN (a : W16.t) : 
-W16.modulus %/2 < to_sint a < W16.modulus %/2 => to_sint (- a) = - to_sint a
   by rewrite !to_sintE /smod !to_uintN /=; smt(to_uint_cmp).
