require import NTT_AVX_Fq_basemul.
require import AllCore List IntDiv Ring StdOrder BitEncoding.

require import Fq NTT_Fq NTTAlgebra.

import GFq Rq Correctness1024.

import Zq IntOrder BitReverse.
import NTTequiv.

from Jasmin require import JModel.
from JazzEC require import Array16 Array128  Array256 Array400.

require import MLKEMFCLib.
from JazzEC require import Array400 WArray32 WArray800 WArray512.

lemma ntt_avx_0_ll : islossless NTT_AVX.__ntt_level0 by islossless.
lemma ntt_avx_1_ll : islossless NTT_AVX.__ntt_level1 by islossless.
lemma ntt_avx_2_ll : islossless NTT_AVX.__ntt_level2 by islossless.
lemma ntt_avx_3_ll : islossless NTT_AVX.__ntt_level3 by islossless.
lemma ntt_avx_4_ll : islossless NTT_AVX.__ntt_level4 by islossless.
lemma ntt_avx_5_ll : islossless NTT_AVX.__ntt_level5 by islossless.
lemma ntt_avx_6_ll : islossless NTT_AVX.__ntt_level6 by islossless.

hoare ntt_avx_0 r:
  NTT_AVX.__ntt_level0 : rp = r ==> res = r_avx2_ntt NTT_Fq.zetas r 0.
proof.
proc; inline *; wp; auto => /> /=.
rewrite NTT_Fq.zetasE r_avx2_ntt_spec => />. 
apply tP_red256 => i /=.
do 255! (move => Hi; case Hi; first done).
by move=> ->; rewrite !initiE.
qed.

lemma ntt_avx_0_pr r:
  phoare [NTT_AVX.__ntt_level0 : rp = r ==> res = r_avx2_ntt NTT_Fq.zetas r 0] = 1%r.
proof. conseq ntt_avx_0_ll (ntt_avx_0 r) => />. qed.

hoare ntt_avx_1 r:
  NTT_AVX.__ntt_level1 : rp = r ==> res = r_avx2_ntt NTT_Fq.zetas r 1.
proof.
proc; inline *; wp; auto => />.
rewrite NTT_Fq.zetasE r_avx2_ntt_spec => />.
apply tP_red256 => i /=.
do 255! (move => Hi; case Hi; first done).
by move=> ->; rewrite !initiE.
qed.

lemma ntt_avx_1_pr r:
  phoare [NTT_AVX.__ntt_level1 : rp = r ==> res = r_avx2_ntt NTT_Fq.zetas r 1] = 1%r.
proof. by conseq ntt_avx_1_ll (ntt_avx_1 r). qed.

op perm_level2 : int list =
  [0;1;2;3;4;5;6;7;16;17;18;19;20;21;22;23;32;33;34;35;36;37;38;39;48;49;50;51;52;53;54;55;64;65;66;67;68;69;70;71;80;81;82;83;84;85;86;87;96;97;98;99;100;101;102;103;112;113;114;115;116;117;118;119;8;9;10;11;12;13;14;15;24;25;26;27;28;29;30;31;40;41;42;43;44;45;46;47;56;57;58;59;60;61;62;63;72;73;74;75;76;77;78;79;88;89;90;91;92;93;94;95;104;105;106;107;108;109;110;111;120;121;122;123;124;125;126;127] axiomatized by perm_level2E.

hoare ntt_avx_2 r:
  NTT_AVX.__ntt_level2 : rp = r ==> perm_ntt perm_level2 res = r_avx2_ntt NTT_Fq.zetas r 2.
proof.
proc; inline *; wp; auto => />.
rewrite NTT_Fq.zetasE r_avx2_ntt_spec => />.
apply tP_red256 => i /=.
do 255! (move => [->|];
first by (rewrite /perm_ntt /perm_level2 initiE 1:// /= /CS2P initiE 1:// /= !shuffle8E /P2C /pchunk /=)).
by move=> ->; rewrite !perm_level2E !shuffle8E !initiE.
qed.

lemma ntt_avx_2_pr r:
  phoare [NTT_AVX.__ntt_level2 : rp = r ==> perm_ntt perm_level2 res = r_avx2_ntt NTT_Fq.zetas r 2] = 1%r.
proof. by conseq ntt_avx_2_ll (ntt_avx_2 r). qed.

op perm_level3 : int list =
  [0;1;2;3;16;17;18;19;32;33;34;35;48;49;50;51;64;65;66;67;80;81;82;83;96;97;98;99;112;113;114;115;4;5;6;7;20;21;22;23;36;37;38;39;52;53;54;55;68;69;70;71;84;85;86;87;100;101;102;103;116;117;118;119;8;9;10;11;24;25;26;27;40;41;42;43;56;57;58;59;72;73;74;75;88;89;90;91;104;105;106;107;120;121;122;123;12;13;14;15;28;29;30;31;44;45;46;47;60;61;62;63;76;77;78;79;92;93;94;95;108;109;110;111;124;125;126;127] axiomatized by perm_level3E.

hoare ntt_avx_3 r:
  NTT_AVX.__ntt_level3 : perm_ntt perm_level2 rp = r ==> perm_ntt perm_level3 res = r_avx2_ntt NTT_Fq.zetas r 3.
proof.
proc; inline *; wp; auto => /> &1. 
rewrite NTT_Fq.zetasE r_avx2_ntt_spec => />.
apply tP_red256 => i /=.
do 255! (move => [->|];
first by (rewrite /perm_ntt /perm_level2 /perm_level3 initiE 1:// /= /CS2P initiE 1:// /= !shuffle4E /P2C /pchunk /=)).
by move=> ->; rewrite /perm_level2 /perm_level3 !shuffle4E !initiE.
qed.

lemma ntt_avx_3_pr r:
  phoare [NTT_AVX.__ntt_level3 : perm_ntt perm_level2 rp = r ==> perm_ntt perm_level3 res = r_avx2_ntt NTT_Fq.zetas r 3] = 1%r.
proof. by conseq ntt_avx_3_ll (ntt_avx_3 r). qed.

op perm_level4 : int list =
  [0;1;16;17;32;33;48;49;64;65;80;81;96;97;112;113;2;3;18;19;34;35;50;51;66;67;82;83;98;99;114;115;4;5;20;21;36;37;52;53;68;69;84;85;100;101;116;117;6;7;22;23;38;39;54;55;70;71;86;87;102;103;118;119;8;9;24;25;40;41;56;57;72;73;88;89;104;105;120;121;10;11;26;27;42;43;58;59;74;75;90;91;106;107;122;123;12;13;28;29;44;45;60;61;76;77;92;93;108;109;124;125;14;15;30;31;46;47;62;63;78;79;94;95;110;111;126;127] axiomatized by perm_level4E.

hoare ntt_avx_4 r:
  NTT_AVX.__ntt_level4 : perm_ntt perm_level3 rp = r ==> perm_ntt perm_level4 res = r_avx2_ntt NTT_Fq.zetas r 4.
proof.
proc; inline *; wp; auto => /> &1. 
rewrite NTT_Fq.zetasE r_avx2_ntt_spec => />.
apply tP_red256 => i /=.
do 255! (move => [->|];
first by (rewrite /perm_ntt /perm_level3 /perm_level4 initiE 1:// /= /CS2P initiE 1:// /= /shuffle2 /P2C /pchunk /=)).
by move=> ->; rewrite /perm_level3 /perm_level4 /shuffle2 !initiE.
qed.

lemma ntt_avx_4_pr r:
  phoare [NTT_AVX.__ntt_level4 : perm_ntt perm_level3 rp = r ==> perm_ntt perm_level4 res = r_avx2_ntt NTT_Fq.zetas r 4] = 1%r.
proof. by conseq ntt_avx_4_ll (ntt_avx_4 r). qed.

op perm_level5 : int list =
  [0;16;32;48;64;80;96;112;1;17;33;49;65;81;97;113;2;18;34;50;66;82;98;114;3;19;35;51;67;83;99;115;4;20;36;52;68;84;100;116;5;21;37;53;69;85;101;117;6;22;38;54;70;86;102;118;7;23;39;55;71;87;103;119;8;24;40;56;72;88;104;120;9;25;41;57;73;89;105;121;10;26;42;58;74;90;106;122;11;27;43;59;75;91;107;123;12;28;44;60;76;92;108;124;13;29;45;61;77;93;109;125;14;30;46;62;78;94;110;126;15;31;47;63;79;95;111;127] axiomatized by perm_level5E.

hoare ntt_avx_5 r:
  NTT_AVX.__ntt_level5 : perm_ntt perm_level4 rp = r ==> perm_ntt perm_level5 res = r_avx2_ntt NTT_Fq.zetas r 5.
proof.
proc; inline *; wp; auto => /> &1. 
rewrite NTT_Fq.zetasE r_avx2_ntt_spec => />.
apply tP_red256 => i /=.
do 255! (move => [->|];
first by (rewrite /perm_ntt /perm_level4 /perm_level5 initiE 1:// /= /CS2P initiE 1:// /= /shuffle1 /P2C /pchunk /=)).
by move=> ->; rewrite /perm_level4 /perm_level5 /shuffle1 !initiE.
qed.

lemma ntt_avx_5_pr r:
  phoare [NTT_AVX.__ntt_level5 : perm_ntt perm_level4 rp = r ==> perm_ntt perm_level5 res = r_avx2_ntt NTT_Fq.zetas r 5] = 1%r.
proof. by conseq ntt_avx_5_ll (ntt_avx_5 r). qed.

hoare ntt_avx_6 r:
  NTT_AVX.__ntt_level6 : perm_ntt perm_level5 rp = r ==> perm_ntt perm_nttpack128 res = r_avx2_ntt NTT_Fq.zetas r 6.
proof.
proc; inline *; wp; auto => /> &1. 
rewrite NTT_Fq.zetasE r_avx2_ntt_spec => />.
apply tP_red256 => i /=.
do 255! (move => [->|];
first by (rewrite /perm_ntt /perm_level5 /perm_nttpack128 initiE 1:// /= /CS2P initiE 1:// /= /P2C /pchunk /=)).
by move=> ->; rewrite /perm_level5 /perm_nttpack128 !initiE.
qed.

lemma ntt_avx_6_pr r:
  phoare [NTT_AVX.__ntt_level6 : perm_ntt perm_level5 rp = r ==> perm_ntt perm_nttpack128 res = r_avx2_ntt NTT_Fq.zetas r 6] = 1%r.
proof. by conseq ntt_avx_6_ll (ntt_avx_6 r). qed.


(** Main Theorems in this module: abstract coeff-based AVX implementation and original NTT specification are equivalent **)
lemma ntt_avx_equiv : 
     equiv [ NTT_AVX.ntt ~ NTT_AVX.ntt_bsrev:
          rp{1}=r{2} ==> perm_ntt perm_nttpack128 res{1} = res{2}].
proof.
transitivity NTT_avx2.ntt
  (rp{1}=NTT_avx2.r{2} /\  NTT_avx2.zetas{2}=NTT_Fq.zetas ==> perm_ntt perm_nttpack128 res{1}=res{2})
  (NTT_avx2.r{1}=r{2} /\ NTT_avx2.zetas{1}=NTT_Fq.zetas ==> ={res})=> //;
 [ by ( move => /> &2; exists r{2} NTT_Fq.zetas)
 | | by (symmetry; proc*; inline NTT_AVX.ntt_bsrev;
         wp; call avx2_ntt; wp; skip => /> &1 &2)].
proc*.
transitivity{1} { r <@ NTT_AVX.ntt0t6(r); }
  (rp{1}=r{2} ==> ={r})
  (r{1} = NTT_avx2.r{2} /\ NTT_avx2.zetas{2}=NTT_Fq.zetas  ==> perm_ntt perm_nttpack128 r{1}=r{2}) => //.
  by move => /> &1 /#. 
 by call ntt0t6_ntt.
inline NTT_AVX.ntt0t6 NTT_avx2.ntt.
(*level 0*)
rcondt{2} 2; auto => />.
seq 2 3 : (NTT_avx2.zetas{2}=NTT_Fq.zetas /\ rp0{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=1 ).
ecall {1} (ntt_avx_0_pr r0{1}).
 by auto => /> *.
(*level 1*)
exlim NTT_avx2.r{2} => r0.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas{2}=NTT_Fq.zetas /\ rp1{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=2 ).
 by ecall {1} (ntt_avx_1_pr r0); auto.
(*level 2*)
exlim NTT_avx2.r{2} => r1.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas{2}=NTT_Fq.zetas /\ perm_ntt perm_level2 rp2{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=3 ).
 by call{1} (ntt_avx_2_pr r1); auto.
(*level 3*)
exlim NTT_avx2.r{2} => r2.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas{2}=NTT_Fq.zetas /\ perm_ntt perm_level3 rp3{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=4 ).
 by call{1} (ntt_avx_3_pr r2); auto.
(*level 4*)
exlim NTT_avx2.r{2} => r3.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas{2}=NTT_Fq.zetas /\ perm_ntt perm_level4 rp4{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=5 ).
 by call{1} (ntt_avx_4_pr r3); auto.
(*level 5*)
exlim NTT_avx2.r{2} => r4.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas{2}=NTT_Fq.zetas /\ perm_ntt perm_level5 rp5{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=6 ).
 by call{1} (ntt_avx_5_pr r4); auto.
(*level 6*)
exlim NTT_avx2.r{2} => r5.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas{2}=NTT_Fq.zetas /\ perm_ntt perm_nttpack128 rp6{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=7 ).
 by call{1} (ntt_avx_6_pr r5); auto.
(*exit*)
by rcondf{2} 1; auto => />.
qed.

hoare ntt_bsrev_h _r: 
   NTT_AVX.ntt_bsrev:
    r = _r ==> res = ntt _r.
proof.
proc.
ecall (bsrev_ntt_spec NTT_vars.r).
wp; skip => /> rr.
by apply imp_ntt_spec.
qed.

hoare ntt_avx_h _r:
 NTT_AVX.ntt : rp = _r ==> perm_ntt perm_nttpack128 res = ntt _r.
proof.
bypr => // &m ->.
have <-: Pr[NTT_AVX.ntt_bsrev(_r) @ &m : res <> ntt _r] = 0%r.
 byphoare (_:r=_r ==> _) => //; hoare => //.
 by conseq (ntt_bsrev_h _r).
byequiv => //.
by conseq ntt_avx_equiv.
qed.

lemma ntt_avx_ll: islossless  NTT_AVX.ntt by islossless.

phoare ntt_avx_spec _r:
 [ NTT_AVX.ntt : rp = _r ==> perm_ntt perm_nttpack128 res = ntt _r ] = 1%r.
proof. by conseq ntt_avx_ll (ntt_avx_h _r). qed.

(* equivalence between full-inline-SSA and level-by-level ntt avx2 (inverse) *)
lemma invntt0t6_invntt : 
  equiv [ NTT_AVX.invntt ~ NTT_AVX.invntt0t6 : rp{1}=r{2} ==> ={res}].
proof.
proc; simplify.
(* level 0 *) (* [loc(zeta0k)..loc(r0l)] - (loc(zeta0k)-loc(r0a)-1) *)
swap{1} [46..56] -34.
seq 22 1: (CS2P [r0a;r1a;r4a;r5a;r2a;r3a;r6a;r7a;r0l;r1l;r4l;r5l;r2l;r3l;r6l;r7l]{1} = rp0{2}).
 by inline *; auto.
(* level 1 *) (* [loc(zeta1l)..loc(r7n)] - (loc(zeta1l)-loc(r7c)-1) *)
swap{1} [35..40] -28.
seq 12 1: (CS2P [r0c;r1c;r2c;r3c;r4c;r5c;r6c;r7c;r0n;r1n;r2n;r3n;r4n;r5n;r6n;r7n]{1} = rp1{2}).
  inline *; auto => /> *. rewrite !P2C_i => />.
(* level 2 *) (* [loc(zeta1n)..loc(r7p)] - (loc(zeta1n)-loc(r7e)-1) *)
swap{1} [29..34] -22.
seq 12 1: (CS2P [r0e;r2e;r4e;r6e;r1e;r3e;r5e;r7e;r0p;r2p;r4p;r6p;r1p;r3p;r5p;r7p]{1} = rp2{2}).
  by inline *; auto => />*; rewrite !P2C_i => />.
(* level 3 *) (* [loc(zeta1p)..loc(r7r)] - (loc(zeta1p)-loc(r7g)-1) *)
swap{1} [23..28] -16.
seq 12 1: (CS2P [r0g;r4g;r1g;r5g;r2g;r6g;r3g;r7g;r0r;r4r;r1r;r5r;r2r;r6r;r3r;r7r]{1} = rp3{2}).
 by inline *; auto => /> *; rewrite !P2C_i => />.
(* level 4 *) (* [loc(zeta1r)..loc(r7t)] - (loc(zeta1r)-loc(r7i)-1) *)
swap{1} [17..22] -10.
seq 12 1: (CS2P [r0i;r1i;r2i;r3i;r4i;r5i;r6i;r7i;r0t;r1t;r2t;r3t;r4t;r5t;r6t;r7t]{1} = rp4{2}).
 by inline *; auto => /> *; rewrite !P2C_i => />.
(* level 5 *)
seq 21 1: (rp{1} = rp5{2}).
  by inline *; auto => /> &1*; rewrite !P2C_i => />; rewrite (P2CS (rp{1})) !PUC_i //. 
by inline *; auto => />*.
qed.
