require import Int.

op foo : int -> int -> int.

module M = {
  proc bar () : int = {
    var i, c;
    i <- 0;
    c <- 0;
    while (i < 10) {
      c <- foo i c;
      i <- i + 1;
    }
    return i;
    }
}.

lemma example:
  hoare [M.bar : true ==> true].
proof.
  proc.
  swap 1 1.
  unroll for 3.
abort.

module N = {
  var a1, a2, a3 : bool
  proc f1 () : int = {return 0;}
  proc f2 () : int = {return 0;}
  proc f3 () : int = {return 0;}
}.

lemma eq12 : equiv [N.f1 ~ N.f2 : true ==> N.a1{1} => N.a2{2} => ={res}].
admitted.

lemma eq23 : equiv [N.f2 ~ N.f3 : true ==> N.a2{1} => N.a3{2} => ={res}].
admitted.

lemma eq13 : equiv [N.f1 ~ N.f3 : true ==> N.a1{1} => N.a3{2} => ={res}].
proof.
  transitivity N.f2 (true ==> N.a1{1} => N.a2{2} => ={res}) (true ==> N.a2{1} => N.a3{2} => ={res}).
  + done.
  + admit.
  + admit.
  admit.
qed.
