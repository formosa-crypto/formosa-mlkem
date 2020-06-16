require import AllCore List IntDiv CoreMap IntDiv.
from Jasmin require  import JModel JMemory.

op b16 (a : W16.t) (b : int) = 
     -b <= to_sint a < b axiomatized by b16E.

op bpos16 (a : W16.t) (b : int) = 
     0 <= to_sint a < b  axiomatized by bpos16E.

op bw16 (a : W16.t) i =
     -2^i <= to_sint a < 2^i  axiomatized by bw16E.

hint simplify b16E.
hint simplify bpos16E.
hint simplify bw16E.

lemma to_sint_unsigned : forall (x : W16.t), 
    0 <= to_sint x =>
    to_sint x = to_uint x.
proof.
  move => x; rewrite W16.to_sintE /smod.
  move : (W16.to_uint_cmp x) => /> ? ?.
  by case (32768 <= to_uint x) => ? // /#. 
qed.

lemma to_sintD_small : (forall (a b : W16.t), 
    -W16.modulus %/2 <= to_sint a + to_sint b < W16.modulus %/2 =>
    to_sint (a + b) = to_sint a + to_sint b).
proof. 
move => a b.
  rewrite !W16.to_sintE !/smod => />.
  move : (W16.to_uint_cmp a) (W16.to_uint_cmp b) => /> *.
  have sumbnd : to_uint a + to_uint b < 65536+65536 ; first  by smt(). 
  case (65536  <= to_uint a + to_uint b).
+    move => *; rewrite (_:  to_uint (a + b)= (to_uint a +  to_uint b) - 65536);
       [rewrite to_uintD => />; by  smt(@IntDiv @W16) |  smt(@W16)].
+    move => *; rewrite (_:  to_uint (a + b)= (to_uint a +  to_uint b));
       [rewrite to_uintD_small => />; by  smt(@IntDiv @W16) |  smt(@W16)].
qed.


lemma to_sintB_small : (forall (a b : W16.t), 
    -W16.modulus %/2 <= to_sint a - to_sint b < W16.modulus %/2 =>
    to_sint (a - b) = to_sint a - to_sint b).
proof.
  move => a b.
  rewrite !W16.to_sintE !/smod => />.
  move : (W16.to_uint_cmp a) (W16.to_uint_cmp b). 
  case (to_uint b <= to_uint a).
+ case(32768 <= to_uint a); 
    by move => *;
      rewrite (_:  to_uint (a - b)= (to_uint a -  to_uint b)); smt(@W16 @IntDiv).
+ case(32768 <= to_uint a);  by 
    move => /> *; rewrite (_:  to_uint (a - b)= (to_uint a -  to_uint b) + 65536);
      [rewrite to_uintD to_uintN => />;  smt(@W16 @IntDiv)| smt(@W16 @IntDiv)].
qed.

lemma to_sintb_lt0 : forall (x y : W16.t), 
    0 <= to_sint x =>
    0 <= to_sint y =>
    to_sint (x - y) < 0 => to_sint x < to_sint y.
proof.
  move => x y ? ?. 
  have : 0 <= to_sint y by done. 
  have : 0 <= to_sint x by done.
rewrite W16.to_sintE /smod.
  move : (W16.to_uint_cmp x) => /> ? ?.
  case (32768 <= to_uint x) => ? // *. 
smt().
  move : H5. rewrite W16.to_sintE /smod.
  move : (W16.to_uint_cmp y) => /> ? ?.
  case (32768 <= to_uint y) => ? // *. 
smt().

move : H6.
rewrite to_sintB_small.
rewrite !to_sintE.
rewrite /smod.
simplify.
rewrite H3 H8.
simplify.
smt().
move => *.
rewrite -to_sint_unsigned. done.
rewrite -to_sint_unsigned. done.
smt().
qed.

lemma to_sintM_small : (forall (a b : W16.t), 
    -W16.modulus %/2 <= to_sint a * to_sint b < W16.modulus %/2 =>
    to_sint (a * b) = to_sint a * to_sint b).
proof.
move => a b.
  rewrite !W16.to_sintE !/smod => />.
  move : (W16.to_uint_cmp a) (W16.to_uint_cmp b) => *.
  case(32768 <= to_uint a);
    case(32768 <= to_uint b);
      by case (65536  <= to_uint a * to_uint b);
       move => *;rewrite to_uintM  => />;  smt(@W16 @IntDiv). 
qed.

lemma to_sintN (a : W16.t) : 
      -W16.modulus %/2 < to_sint a < W16.modulus %/2 =>
      to_sint (- a) = - to_sint a.
proof. 
    rewrite !to_sintE /smod !to_uintN=> /> *. 
    move : (W16.to_uint_cmp a) => /> *. 
    case (to_uint a = 0); first by smt(@IntDiv @W16).
    case (to_uint a = 65535); first by smt(@W16).
    move => *.
    rewrite (_: (- to_uint a) %% 65536 = 65536 - to_uint a);
           smt(@IntDiv @W16 @Int).
qed.
