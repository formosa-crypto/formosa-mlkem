require import NTT_AVX_Fq_ntt NTT_AVX_Fq_basemul.
require import AllCore List IntDiv Ring StdOrder BitEncoding.

require import Fq NTT_Fq NTTAlgebra.

import GFq Rq Correctness768.

import Zq IntOrder BitReverse.
import NTTequiv.

from Jasmin require import JModel.
from JazzEC require import Array16 Array128  Array256 Array400.

require import MLKEMFCLib.
from JazzEC require import Array400 WArray32 WArray800 WArray512.

lemma invntt_avx_0_ll : islossless NTT_AVX.__invntt_level0 by islossless.
lemma invntt_avx_1_ll : islossless NTT_AVX.__invntt_level1 by islossless.
lemma invntt_avx_2_ll : islossless NTT_AVX.__invntt_level2 by islossless.
lemma invntt_avx_3_ll : islossless NTT_AVX.__invntt_level3 by islossless.
lemma invntt_avx_4_ll : islossless NTT_AVX.__invntt_level4 by islossless.
lemma invntt_avx_5_ll : islossless NTT_AVX.__invntt_level5 by islossless.
lemma _invntt_avx_6_ll : islossless NTT_AVX.___invntt_level6 by islossless.
lemma invntt_avx_6_ll : islossless NTT_AVX.__invntt_level6 by islossless.

op perm_inv_level0 : int list =
  [0;16;64;80;32;48;96;112;1;17;65;81;33;49;97;113;2;18;66;82;34;50;98;114;3;19;67;83;35;51;99;115;4;20;68;84;36;52;100;116;5;21;69;85;37;53;101;117;6;22;70;86;38;54;102;118;7;23;71;87;39;55;103;119;8;24;72;88;40;56;104;120;9;25;73;89;41;57;105;121;10;26;74;90;42;58;106;122;11;27;75;91;43;59;107;123;12;28;76;92;44;60;108;124;13;29;77;93;45;61;109;125;14;30;78;94;46;62;110;126;15;31;79;95;47;63;111;127]
 axiomatized by perm_inv_level0E.

hoare invntt_avx_0 r:
  NTT_AVX.__invntt_level0 : perm_ntt perm_nttpack128 rp = r ==> perm_ntt perm_inv_level0 res = r_avx2_invntt NTT_Fq.zetas_inv r 0.
proof.
proc; inline *; wp; auto => /> /= &hr.
rewrite NTT_Fq.zetas_invE r_avx2_invntt_spec => />. 
apply tP_red256 => i /=.
do 256!(try (move => Hi; case Hi => />); first by rewrite /CS2P !initiE /P2C /pchunk /punchunk /perm_nttpack128 /perm_inv_level0 => />).
qed.

lemma invntt_avx_0_pr r:
  phoare [NTT_AVX.__invntt_level0 : perm_ntt perm_nttpack128 rp = r ==> perm_ntt perm_inv_level0 res = r_avx2_invntt NTT_Fq.zetas_inv r 0] = 1%r.
proof. by conseq invntt_avx_0_ll (invntt_avx_0 r). qed.

op perm_inv_level1 : int list =
  [0;1;32;33;64;65;96;97;16;17;48;49;80;81;112;113;2;3;34;35;66;67;98;99;18;19;50;51;82;83;114;115;4;5;36;37;68;69;100;101;20;21;52;53;84;85;116;117;6;7;38;39;70;71;102;103;22;23;54;55;86;87;118;119;8;9;40;41;72;73;104;105;24;25;56;57;88;89;120;121;10;11;42;43;74;75;106;107;26;27;58;59;90;91;122;123;12;13;44;45;76;77;108;109;28;29;60;61;92;93;124;125;14;15;46;47;78;79;110;111;30;31;62;63;94;95;126;127]
  axiomatized by perm_inv_level1E.

hoare invntt_avx_1 r:
  NTT_AVX.__invntt_level1 : perm_ntt perm_inv_level0 rp = r ==> perm_ntt perm_inv_level1 res = r_avx2_invntt NTT_Fq.zetas_inv r 1.
proof.
proc; inline *; wp; auto => /> &hr.
rewrite NTT_Fq.zetas_invE r_avx2_invntt_spec => />.
apply tP_red256 => i /=.
do 256!(try (move => Hi; case Hi => />); first by rewrite /perm_inv_level0 /perm_inv_level1 /shuffle1 //=).
qed.

lemma invntt_avx_1_pr r:
  phoare [NTT_AVX.__invntt_level1 : perm_ntt perm_inv_level0 rp = r ==> perm_ntt perm_inv_level1 res = r_avx2_invntt NTT_Fq.zetas_inv r 1] = 1%r.
proof. by conseq invntt_avx_1_ll (invntt_avx_1 r). qed.

op perm_inv_level2 : int list =
  [0;1;2;3;32;33;34;35;64;65;66;67;96;97;98;99;16;17;18;19;48;49;50;51;80;81;82;83;112;113;114;115;4;5;6;7;36;37;38;39;68;69;70;71;100;101;102;103;20;21;22;23;52;53;54;55;84;85;86;87;116;117;118;119;8;9;10;11;40;41;42;43;72;73;74;75;104;105;106;107;24;25;26;27;56;57;58;59;88;89;90;91;120;121;122;123;12;13;14;15;44;45;46;47;76;77;78;79;108;109;110;111;28;29;30;31;60;61;62;63;92;93;94;95;124;125;126;127]
  axiomatized by perm_inv_level2E.

hoare invntt_avx_2 r:
  NTT_AVX.__invntt_level2 : perm_ntt perm_inv_level1 rp = r ==> perm_ntt perm_inv_level2 res = r_avx2_invntt NTT_Fq.zetas_inv r 2.
proof.
proc; inline *; wp; auto => /> &hr.
rewrite NTT_Fq.zetas_invE r_avx2_invntt_spec => />.
apply tP_red256 => i /=.
do 256!(try (move => Hi; case Hi => />); first by rewrite /perm_inv_level1 /perm_inv_level2 /shuffle2 //=).
qed.

lemma invntt_avx_2_pr r:
  phoare [NTT_AVX.__invntt_level2 : perm_ntt perm_inv_level1 rp = r ==> perm_ntt perm_inv_level2 res = r_avx2_invntt NTT_Fq.zetas_inv r 2] = 1%r.
proof. by conseq invntt_avx_2_ll (invntt_avx_2 r). qed.

op perm_inv_level3 : int list =
  [0;1;2;3;4;5;6;7;32;33;34;35;36;37;38;39;64;65;66;67;68;69;70;71;96;97;98;99;100;101;102;103;16;17;18;19;20;21;22;23;48;49;50;51;52;53;54;55;80;81;82;83;84;85;86;87;112;113;114;115;116;117;118;119;8;9;10;11;12;13;14;15;40;41;42;43;44;45;46;47;72;73;74;75;76;77;78;79;104;105;106;107;108;109;110;111;24;25;26;27;28;29;30;31;56;57;58;59;60;61;62;63;88;89;90;91;92;93;94;95;120;121;122;123;124;125;126;127]
  axiomatized by perm_inv_level3E.

hoare invntt_avx_3 r:
  NTT_AVX.__invntt_level3 : perm_ntt perm_inv_level2 rp = r ==> perm_ntt perm_inv_level3 res = r_avx2_invntt NTT_Fq.zetas_inv r 3.
proof.
proc; inline *; wp; auto => /> &hr.
rewrite NTT_Fq.zetas_invE r_avx2_invntt_spec => />.
apply tP_red256 => i /=.
do 256!(try (move => Hi; case Hi => />); first by rewrite /perm_inv_level2 /perm_inv_level3 /shuffle4 //=).
qed.

lemma invntt_avx_3_pr r:
  phoare [NTT_AVX.__invntt_level3 : perm_ntt perm_inv_level2 rp = r ==> perm_ntt perm_inv_level3 res = r_avx2_invntt NTT_Fq.zetas_inv r 3] = 1%r.
proof. by conseq invntt_avx_3_ll (invntt_avx_3 r). qed.

op perm_inv_level4 : int list =
  [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;32;33;34;35;36;37;38;39;40;41;42;43;44;45;46;47;64;65;66;67;68;69;70;71;72;73;74;75;76;77;78;79;96;97;98;99;100;101;102;103;104;105;106;107;108;109;110;111;16;17;18;19;20;21;22;23;24;25;26;27;28;29;30;31;48;49;50;51;52;53;54;55;56;57;58;59;60;61;62;63;80;81;82;83;84;85;86;87;88;89;90;91;92;93;94;95;112;113;114;115;116;117;118;119;120;121;122;123;124;125;126;127]
  axiomatized by perm_inv_level4E.

hoare invntt_avx_4 r:
  NTT_AVX.__invntt_level4 : perm_ntt perm_inv_level3 rp = r ==> perm_ntt perm_inv_level4 res = r_avx2_invntt NTT_Fq.zetas_inv r 4.
proof.
proc; inline *; wp; auto => /> &hr.
rewrite NTT_Fq.zetas_invE r_avx2_invntt_spec => />.
apply tP_red256 => i /=.
do 256!(try (move => Hi; case Hi => />); first by rewrite /perm_inv_level3 /perm_inv_level4 /shuffle8 //=).
qed.

lemma invntt_avx_4_pr r:
  phoare [NTT_AVX.__invntt_level4 : perm_ntt perm_inv_level3 rp = r ==> perm_ntt perm_inv_level4 res = r_avx2_invntt NTT_Fq.zetas_inv r 4] = 1%r.
proof. by conseq invntt_avx_4_ll (invntt_avx_4 r). qed.

hoare invntt_avx_5 r:
  NTT_AVX.__invntt_level5 : perm_ntt perm_inv_level4 rp = r ==> res = r_avx2_invntt NTT_Fq.zetas_inv r 5.
proof.
proc; inline *; wp; auto => /> &hr.
rewrite NTT_Fq.zetas_invE r_avx2_invntt_spec => />.
apply tP_red256 => i /=.
do 256!(try (move => Hi; case Hi => />); first by rewrite /perm_inv_level4 //=).
qed.

lemma invntt_avx_5_pr r:
  phoare [NTT_AVX.__invntt_level5 : perm_ntt perm_inv_level4 rp = r ==> res = r_avx2_invntt NTT_Fq.zetas_inv r 5] = 1%r.
proof. by conseq invntt_avx_5_ll (invntt_avx_5 r). qed.

hoare invntt_avx_6 r:
  NTT_AVX.___invntt_level6 : rp = r ==> res = r_avx2_invntt NTT_Fq.zetas_inv r 6.
proof.
proc; inline *; wp; auto => />. 
rewrite NTT_Fq.zetas_invE r_avx2_invntt_spec => />.
apply tP_red256 => i /=.
do 255!(move => Hi; case Hi => />).
qed.

lemma invntt_avx_6_pr r:
  phoare [NTT_AVX.___invntt_level6 : rp = r ==> res = r_avx2_invntt NTT_Fq.zetas_inv r 6] = 1%r.
proof. by conseq _invntt_avx_6_ll (invntt_avx_6 r). qed.

(** Main Theorem in this module: abstract coeff-based AVX implementation and original NTT specification are equivalent (inverse) **)
lemma invntt_avx2_equiv : 
     equiv [ NTT_AVX.invntt ~ NTT_avx2.invntt :
          perm_ntt perm_nttpack128 rp{1} = NTT_avx2.r{2} /\ NTT_avx2.zetas_inv{2} = NTT_Fq.zetas_inv
          ==> res{1} = res{2}].
proof.
proc*.
transitivity{1} { r <@ NTT_AVX.invntt0t6(r); }
  (rp{1}=r{2} ==> ={r})
  (perm_ntt perm_nttpack128 r{1} = NTT_avx2.r{2} /\ NTT_avx2.zetas_inv{2}=NTT_Fq.zetas_inv  ==> r{1}=r{2}) => //.
  by move => /> &1 /#. 
call invntt0t6_invntt; first by auto.
inline NTT_AVX.invntt0t6 NTT_avx2.invntt.
(*level 0*)
rcondt{2} 2; auto => />.
seq 2 3 : (NTT_avx2.zetas_inv{2}=NTT_Fq.zetas_inv /\ perm_ntt perm_inv_level0 rp0{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=1 ). 
ecall {1} (invntt_avx_0_pr (perm_ntt perm_nttpack128 r{1})).
 by auto => /> *. 
(*level 1*)
exlim NTT_avx2.r{2} => r0.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas_inv{2}=NTT_Fq.zetas_inv /\ perm_ntt perm_inv_level1 rp1{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=2 ).
ecall {1} (invntt_avx_1_pr r0); auto.
(*level 2*)
exlim NTT_avx2.r{2} => r1.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas_inv{2}=NTT_Fq.zetas_inv /\ perm_ntt perm_inv_level2 rp2{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=3 ).
call{1} (invntt_avx_2_pr r1); auto.
(*level 3*)
exlim NTT_avx2.r{2} => r2.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas_inv{2}=NTT_Fq.zetas_inv /\ perm_ntt perm_inv_level3 rp3{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=4 ).
call{1} (invntt_avx_3_pr r2); auto.
(*level 4*)
exlim NTT_avx2.r{2} => r3.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas_inv{2}=NTT_Fq.zetas_inv /\ perm_ntt perm_inv_level4 rp4{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=5 ).
call{1} (invntt_avx_4_pr r3); auto.
(*level 5*)
exlim NTT_avx2.r{2} => r4.
rcondt{2} 1; auto => />.
seq 1 2 : (NTT_avx2.zetas_inv{2}=NTT_Fq.zetas_inv /\ rp5{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=6 ).
call{1} (invntt_avx_5_pr r4); auto.
(*level 6*)
exlim NTT_avx2.r{2} => r5.
rcondt{2} 1; auto => />.
inline{1} NTT_AVX.__invntt_level6.
seq 2 2 : (NTT_avx2.zetas_inv{2}=NTT_Fq.zetas_inv /\ rp10{1}=NTT_avx2.r{2} /\ NTT_avx2.k{2}=7 ).
call{1} (invntt_avx_6_pr r5); auto.
(*exit*)
rcondf{2} 1; auto => /> &2.
rewrite r_avx2_invntt_post_spec /NTT_Fq.zetas_inv tP => />i Hi1 Hi2.
rewrite !initiE => />. 
rewrite mapiE // ZqField.mulrC; congr.
by rewrite -eq_incoeff /q //=.
qed.

lemma invntt_avx_equiv : 
     equiv [ NTT_AVX.invntt ~ NTT_AVX.invntt_bsrev :
          perm_ntt perm_nttpack128 rp{1} = r{2}
          ==> res{1} = res{2}].
proof.
proc*.
transitivity{1} { r <@ NTT_avx2.invntt(); }
  (perm_ntt perm_nttpack128 rp{1}=NTT_avx2.r{2} /\ NTT_avx2.zetas_inv{2}=NTT_Fq.zetas_inv ==> ={r})
  (NTT_avx2.r{1} = r{2} /\ NTT_avx2.zetas_inv{1}=NTT_Fq.zetas_inv ==> r{1}=r0{2}) => //.
move => /> &1 /#. 
call invntt_avx2_equiv; first by auto.
inline NTT_AVX.invntt_bsrev; wp; sp => />. symmetry.
call avx2_invntt; auto. qed.

hoare invntt_bsrev_h _r: 
   NTT_AVX.invntt_bsrev:
    r = _r ==> res = invntt _r.
proof.
proc.
ecall (bsrev_invntt_spec NTT_vars.r).
wp; skip => /> rr.
by apply imp_invntt_spec.
qed.


hoare invntt_avx_h _r:
 NTT_AVX.invntt : perm_ntt perm_nttpack128 rp = _r ==> res = invntt _r.
proof.
bypr => // &m <-. clear _r. 
have <-: Pr[NTT_AVX.invntt_bsrev(perm_ntt perm_nttpack128 arg{m}) @ &m : res <> invntt (perm_ntt perm_nttpack128 arg{m})] = 0%r.
 byphoare (_:r=perm_ntt perm_nttpack128 arg{m} ==> _) => //. hoare => />.
 conseq (invntt_bsrev_h (perm_ntt perm_nttpack128 arg{m})) => />.
byequiv => //.
conseq invntt_avx_equiv => />. qed.

lemma invntt_avx_ll: islossless  NTT_AVX.invntt by islossless.

phoare invntt_avx_spec _r:
 [ NTT_AVX.invntt : perm_ntt perm_nttpack128 rp = _r ==>  res = invntt _r ] = 1%r.
proof. conseq invntt_avx_ll (invntt_avx_h _r) => />. qed.
