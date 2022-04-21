require import AllCore StdOrder IntDiv List.
(*---*) import IntOrder.
require import For.


module DualLoop = {

  var i, j, m, n, a, b : int

  proc innerloop () = {
    j <- 0; b <- 0;
    while (j < n) {
      b <- b + j;
      j <- j + 1; } }

  proc outerloop () = {
    i <- 0; a <- 0;
    while (i < m) {
      innerloop (); a <- a + b;
      i <- i + 1; } } }.


op b_k k = (k * (k - 1) %/ 2).

lemma b_Sk k :
  b_k (k + 1) =
  b_k k + k.
proof.
  by rewrite /b_k /= -{5}(mulzK k 2) // -divzDr;
  [apply/dvdz_mull|rewrite -mulzDr /= mulrC].
qed.

lemma wp_innerloop P :
  hoare [DualLoop.innerloop :
          0 <= DualLoop.n /\
          P DualLoop.m DualLoop.i DualLoop.a DualLoop.n DualLoop.n (b_k DualLoop.n) ==>
          P DualLoop.m DualLoop.i DualLoop.a DualLoop.n DualLoop.j DualLoop.b].
proof.
  proc.
  while (
    HL_FOR_INT_ADD_LT.inv
      DualLoop.n 1 0
      (0 <= DualLoop.n)
      (fun k _ b =>
        b = b_k k /\
        P DualLoop.m DualLoop.i DualLoop.a DualLoop.n DualLoop.n (b_k DualLoop.n))
      DualLoop.j DualLoop.b).
  + wp; skip => &m /=; apply/HL_FOR_INT_ADD_LT.inv_in.
    by move => le_0_n n /= <<- k mem_k_range <<- [->> ->] /=; rewrite b_Sk.
  wp; skip => &m [le_0_n ?]; split; first by apply/HL_FOR_INT_ADD_LT.inv_0.
  move => b j; move: j b; apply/HL_FOR_INT_ADD_LT.inv_out.
  move => _ s /=; case: (DualLoop.n{m} <= 0) => //= le_n_0 [_].
  by move => [->> P_n]; move: (eqz_leq DualLoop.n{m} 0); rewrite le_n_0 le_0_n.
qed.


op a_k k n = k * b_k n.

lemma a_Sk k n :
  a_k (k + 1) n =
  a_k k n + b_k n.
proof. by rewrite /a_k mulrDl. qed.

lemma wp_outerloop P :
  hoare
    [DualLoop.outerloop :
      ((0 < DualLoop.m) /\ (0 <= DualLoop.n)) /\
      P DualLoop.m DualLoop.m (a_k DualLoop.m DualLoop.n) DualLoop.n DualLoop.n (b_k DualLoop.n) ==>
      P DualLoop.m DualLoop.i DualLoop.a DualLoop.n DualLoop.j DualLoop.b].
proof.
  proc.
  pose Q (m i a n j b : int) :=
         ( HL_FOR_INT_ADD_LT.inv m 1 0
           (0 < m /\ 0 <= n)
           ( fun k _ ajb =>
             ajb = (a_k k n, if k = 0 then snd ajb else (n, b_k n)) /\
             P m m (a_k m n) n n (b_k n))
           i (a, (j, b))).
  while (Q DualLoop.m DualLoop.i DualLoop.a DualLoop.n DualLoop.j DualLoop.b).
  + wp.
    seq 0 : (Q DualLoop.m (DualLoop.i + 1) (DualLoop.a + (b_k DualLoop.n)) DualLoop.n DualLoop.n (b_k DualLoop.n)).
    - skip => &m; apply/HL_FOR_INT_ADD_LT.inv_in.
      by move => _ n /= <<- k _ <<- [[->> _] ->]; split => //=; rewrite a_Sk.
    move: (wp_innerloop (fun m i a n j b : int => Q m (i + 1) (a + b) n j b)) => /=.
    move => H; call H; rewrite /Q; skip => &m P_Sk; rewrite P_Sk /=.
    by case/HL_FOR_INT_ADD_LT.inv_const: P_Sk.
  wp; skip => &m [[lt_0_m le_0_n] P_n]; split.
  + by apply/HL_FOR_INT_ADD_LT.inv_0.
  move => a b i j; rewrite /Q.
  pose ajb:= (a, (j, b)).
  have ->: a = fst ajb by trivial.
  have ->: j = fst (snd ajb) by trivial.
  have ->: b = snd (snd ajb) by trivial.
  move: i ajb => {a j b}.
  apply/HL_FOR_INT_ADD_LT.inv_out.
  move => _ [a [j b]] /=.
  case: (DualLoop.m{m} <= 0) => //=.
  move => _; case: (DualLoop.m{m} = 0) => [->>//|_].
  by move => [[->> [->> ->>]]].
qed.


module DualLoop2 = {

  var i, j, m, n, a, b : int

  proc innerloop2 () = {
    j <- 0;
    b <- 0;
    while (j < n) {
      j <- j + 1;
      b <- b + j - 1;
    }
  }

  proc outerloop2 () = {
    i <- 0;
    a <- 0;
    while (i < m) {
      innerloop2 ();
      a <- a + b;
      i <- i + 1;
    }
  }

}.

(*
equiv wp_equiv_innerloop P :
  DualLoop.innerloop ~ DualLoop2.innerloop2 :
    ((0 <= DualLoop.n{1}) /\ (DualLoop.n{1} = DualLoop2.n{2})) /\
    P DualLoop.m{1}  DualLoop.i{1}  DualLoop.a{1}  DualLoop.n{1}  DualLoop.n{1}  (b_k DualLoop.n{1})
      DualLoop2.m{2} DualLoop2.i{2} DualLoop2.a{2} DualLoop2.n{2} DualLoop2.n{2} (b_k DualLoop2.n{2}) ==>
    P DualLoop.m{1}  DualLoop.i{1}  DualLoop.a{1}  DualLoop.n{1}  DualLoop.j{1}  DualLoop.b{1}
      DualLoop2.m{2} DualLoop2.i{2} DualLoop2.a{2} DualLoop2.n{2} DualLoop2.j{2} DualLoop2.b{2}.
proof.
  proc.
  while (
    RHL_FOR_INT_ADD_LT2.inv
      DualLoop.n{1} DualLoop.n{1} 1 1 0 0
      ((0 <= DualLoop.n{1}) /\ (DualLoop.n{1} = DualLoop2.n{2}))
      (fun _ _ k pb =>
        fst pb = b_k k /\
        snd pb = b_k k /\
        P DualLoop.m{1}  DualLoop.i{1}  DualLoop.a{1}  DualLoop.n{1}  DualLoop.n{1}  (b_k DualLoop.n{1})
        DualLoop2.m{2} DualLoop2.i{2} DualLoop2.a{2} DualLoop2.n{2} DualLoop2.n{2} (b_k DualLoop2.n{2}))
      DualLoop.j{1} DualLoop2.j{2} (DualLoop.b{1}, DualLoop2.b{2})).
  + wp; skip => &1 &2 /=.apply/RHL_FOR_INT_ADD_LT2.inv_in => /=. [by move => [_ <<-]|].
    move => [le_0_n <<-] ? <<- k; move/ler_eqVlt: le_0_n => [<<-|/ltrNge Nle_n_0]; [rewrite range_geq //|].
    by rewrite Nle_n_0 b_Sk /= => mem_k_range ->> ->> /= [->> [->> ->]] /=; ring.
  wp; skip => &1 &2 [[le_0_n <<-] P_n]; split.
  + by apply/RHL_FOR_INT_ADD_LT2.inv_0.
  move => b1 j1 b2 j2.
  pose pb:= (b1, b2).
  have ->: b1 = fst pb by trivial.
  have ->: b2 = snd pb by trivial.
  move: j1 j2 pb => {b1 b2}.
  apply/RHL_FOR_INT_ADD_LT2.inv_out => //.
  move => _ [b1 b2] /=.
  move/ler_eqVlt: le_0_n => [<<- /= [->> [->>]] //|/ltrNge Nle_n_0].
  by rewrite Nle_n_0 /= => -[->> [->>]].
qed.
*)

module M = {

  var i, n, a : int

  proc loop1 () = {
    a <- 0; i <- 0;
    while (i < n) {
      a <- a + i;
      i <- i + 1; } } 

  proc loop2 () = {
    a <- 0; i <- 0;
    while (i < n) {
      a <- a - i;
      i <- i + 1; } } }.

equiv Mloop:
  M.loop1 ~ M.loop2 :
    M.n{1} = M.n{2} ==> M.a{1} + M.a{2} = 0.
proof.
  proc.
  while (RHL_FOR_INT_ADD_LT2.inv M.n{1} M.n{2} 1 1 0 0 (M.n{1} = M.n{2})
          (fun _ _ _ (pa : int * int) => pa.`1 + pa.`2 = 0)
          M.i{1} M.i{2} (M.a{1}, M.a{2})).
  + wp; skip => &1 &2 /=; apply/RHL_FOR_INT_ADD_LT2.inv_in => //=.
    by move => _ n _ k mem_k_range ->> ->> <- /=; ring.
  wp; skip => &1 &2 /= => pre; split.
  + by apply/RHL_FOR_INT_ADD_LT2.inv_0.
  move => a1 i1 a2 i2.
  pose R (_ _ : int) (pa : int * int):= pa.`1 + pa.`2 = 0.
  by apply/(RHL_FOR_INT_ADD_LT2.inv_out _ _ _ _ _ _ _ _ _ R).
qed.
