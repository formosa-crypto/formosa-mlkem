require PKE ROM.

clone include PKE.

(* Fix me. Move to Library. *)

module type CAdversary = {
   proc find(pk : pkey, sk : skey) : plaintext 
}.

module CorrectnessAdv(S : Scheme, A : CAdversary) = {
  proc main() : bool = {
    var pk, sk, c, m, m';
    (pk,sk) <@ S.kg();
    m <@ A.find(pk,sk);
    c <@ S.enc(pk, m);
    m' <@ S.dec(sk,c);

    return m' = Some m;
  }
}.

(* Extensions to ROM *)

clone import ROM as RO.

module type SchemeRO(H : POracle) = {
  include Scheme
}.

module type AdversaryRO(H : POracle) = {
  include Adversary
}.

module type CAdversaryRO(H : POracle) = {
  include CAdversary
}.

module type CPAGame(S: Scheme, A : Adversary) = {
   proc main() : bool
}.

module CPAGameROM(G : CPAGame, S : SchemeRO, A : AdversaryRO, O : Oracle) = {
   proc main() : bool = {
     var b;
     O.init();
     b <@ G(S(O),A(O)).main();
     return b;
   }
}.

module CPAROM = CPAGameROM(CPA).
module CPA_L_ROM = CPAGameROM(CPA_L).
module CPA_R_ROM = CPAGameROM(CPA_R).

module type CGame(S: Scheme, A : CAdversary) = {
   proc main() : bool
}.

module CGameROM(G : CGame, S : SchemeRO, A : CAdversaryRO, O : Oracle) = {
   proc main() : bool = {
     var b;
     O.init();
     b <@ G(S(O),A(O)).main();
     return b;
   }
}.

module CorrectnessAdvROM = CGameROM(CorrectnessAdv).


