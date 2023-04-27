require import PROM.
require PKE.

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

clone import FullRO as RO.

module type RO_ti = {
  proc init() : unit
  proc h(_: in_t) : out_t
}.

module type RO_t = {
  include RO_ti [h]
}.

module type SchemeRO(H : RO_t) = {
  include Scheme
}.


module type AdversaryRO(H : RO_t) = {
  include Adversary
}.

module type CAdversaryRO(H : RO_t) = {
  include CAdversary
}.

module type CPAGame(S: Scheme, A : Adversary) = {
   proc main() : bool
}.

module CPAGameROM(G : CPAGame, S : SchemeRO, A : AdversaryRO, H : RO_ti) = {
   proc main() : bool = {
     var b;
     H.init();
     b <@ G(S(H),A(H)).main();
     return b;
   }
}.

module CPAROM = CPAGameROM(CPA).
module CPA_L_ROM = CPAGameROM(CPA_L).
module CPA_R_ROM = CPAGameROM(CPA_R).

module type CGame(S: Scheme, A : CAdversary) = {
   proc main() : bool
}.

module CGameROM(G : CGame, S : SchemeRO, A : CAdversaryRO, H : RO_ti) = {
   proc main() : bool = {
     var b;
     H.init();
     b <@ G(S(H),A(H)).main();
     return b;
   }
}.

module CorrectnessAdvROM = CGameROM(CorrectnessAdv).


