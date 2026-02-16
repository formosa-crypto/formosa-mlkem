require import AllCore IntDiv CoreMap List Distr.

require import Safety_mlkem768_avx2.
 
from Jasmin require import Jcheck JSafety.

(* The post and trace are valid. *)

lemma __shuffle8_proof _a _b : (__shuffle8_spec _a _b).
proof.
rewrite /__shuffle8_spec .
proc; inline *; auto .
qed .

lemma __shuffle4_proof _a _b : (__shuffle4_spec _a _b).
proof.
rewrite /__shuffle4_spec .
proc; inline *; auto .
qed .

lemma __shuffle2_proof _a _b : (__shuffle2_spec _a _b).
proof.
rewrite /__shuffle2_spec .
proc; inline *; auto .
qed .

lemma __shuffle1_proof _a _b : (__shuffle1_spec _a _b).
proof.
rewrite /__shuffle1_spec .
proc; inline *; auto .
qed .

lemma __nttunpack128_proof _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7 :
      (__nttunpack128_spec _r0 _r1 _r2 _r3 _r4 _r5 _r6 _r7).
proof.
rewrite /__nttunpack128_spec .
proc; auto .
ecall (__shuffle1_proof param_30 param_29).
auto .
ecall (__shuffle1_proof param_28 param_27).
auto .
ecall (__shuffle1_proof param_26 param_25).
auto .
ecall (__shuffle1_proof param_24 param_23).
auto .
ecall (__shuffle2_proof param_22 param_21).
auto .
ecall (__shuffle2_proof param_20 param_19).
auto .
ecall (__shuffle2_proof param_18 param_17).
auto .
ecall (__shuffle2_proof param_16 param_15).
auto .
ecall (__shuffle4_proof param_14 param_13).
auto .
ecall (__shuffle4_proof param_12 param_11).
auto .
ecall (__shuffle4_proof param_10 param_9).
auto .
ecall (__shuffle4_proof param_8 param_7).
auto .
ecall (__shuffle8_proof param_6 param_5).
auto .
ecall (__shuffle8_proof param_4 param_3).
auto .
ecall (__shuffle8_proof param_2 param_1).
auto .
ecall (__shuffle8_proof param_0 param).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed. 

lemma _nttunpack_proof _rp _b_rp : (_nttunpack_spec _rp _b_rp).
proof. 
rewrite /_nttunpack_spec .
proc; auto .
ecall (__nttunpack128_proof param_14 param_13 param_12 param_11 param_10 
       param_9 param_8 param_7).
auto .
ecall (__nttunpack128_proof param_6 param_5 param_4 param_3 param_2 param_1 
       param_0 param).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray512.init_arrP).
qed. 

lemma __csubq_proof _r _qx16 : (__csubq_spec _r _qx16).
proof. 
rewrite /__csubq_spec .
by proc; auto .
qed. 

lemma __red16x_proof _r _qx16 _vx16 : (__red16x_spec _r _qx16 _vx16).
proof.
rewrite /__red16x_spec .
by proc; auto .
qed.

lemma __fqmulprecomp16x_proof _b _al _ah _qx16 :
      (__fqmulprecomp16x_spec _b _al _ah _qx16).
proof.
rewrite /__fqmulprecomp16x_spec .
by proc; auto .
qed.

lemma __fqmulx16_proof _a _b _qx16 _qinvx16 :
      (__fqmulx16_spec _a _b _qx16 _qinvx16).
proof. 
rewrite /__fqmulx16_spec .
by proc; auto .
qed.

lemma __keccakf1600_pround_avx2_proof _state _b_state :
      (__keccakf1600_pround_avx2_spec _state _b_state).
proof. 
rewrite /__keccakf1600_pround_avx2_spec .
 proc. rewrite /=. wp -1.
  seq 2: (valid trace___keccakf1600_pround_avx2). by auto.
  conseq (:true). smt(BArray224.init_arrP).
  by auto.
qed. 

lemma __keccakf1600_avx2_proof _state _b_state :
      (__keccakf1600_avx2_spec _state _b_state).
proof.
rewrite /__keccakf1600_avx2_spec .
proc; auto .
while ((valid trace___keccakf1600_avx2) /\ BArray224.is_init b_state 0 224 /\ 0 <=  r).
auto .
ecall (__keccakf1600_pround_avx2_proof param (BArray224.init_arr
                                             (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /=.
smt (all_cat BArray224.init_arrP).
auto .
ecall (__keccakf1600_pround_avx2_proof param (BArray224.init_arr
                                             (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (all_cat BArray224.init_arrP).
qed .

lemma _keccakf1600_avx2_proof _state _b_state :
      (_keccakf1600_avx2_spec _state _b_state).
proof.
rewrite /_keccakf1600_avx2_spec .
proc; auto .
ecall (__keccakf1600_avx2_proof param (BArray224.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (BArray224.init_arrP List.all_cat).
qed .

lemma __stavx2_pack_proof _st _b_st : (__stavx2_pack_spec _st _b_st).
proof. 
rewrite /__stavx2_pack_spec .
proc; auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed. 

lemma __stavx2_unpack_proof _st _b_st _state _b_state :
      (__stavx2_unpack_spec _st _b_st _state _b_state).
proof. 
rewrite /__stavx2_unpack_spec .
proc; auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed.

lemma _keccakf1600_st25_avx2_proof _st25 _b_st25 :
      (_keccakf1600_st25_avx2_spec _st25 _b_st25).
proof.
proc; auto .
ecall (__stavx2_unpack_proof param_2 (BArray200.init_arr (JWord.W8.of_int 255)) 
       param_1 (BArray224.init_arr (JWord.W8.of_int 255))).
auto .
ecall (__keccakf1600_avx2_proof param_0 (BArray224.init_arr (JWord.W8.of_int 255))).
auto .
ecall (__stavx2_pack_proof param (BArray200.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray224.init_arrP BArray200.init_arrP).
qed .

lemma __SHLQ_proof _x _shbytes : (__SHLQ_spec _x _shbytes).
proof. 
rewrite /__SHLQ_spec .
by proc; auto .
qed.

lemma __SHLDQ_proof _x _shbytes : (__SHLDQ_spec _x _shbytes).
proof. 
rewrite /__SHLDQ_spec .
by proc; auto .
qed.

lemma __SHLQ_256_proof _x _shbytes : (__SHLQ_256_spec _x _shbytes).
proof. 
rewrite /__SHLQ_256_spec .
by proc; auto .
qed. 

lemma __u64_to_u256_proof _x _l : (__u64_to_u256_spec _x _l).
proof.
rewrite /__u64_to_u256_spec .
by proc; auto .
qed .

lemma __state_init_avx2_proof  : (__state_init_avx2_spec).
proof.
rewrite /__state_init_avx2_spec .
proc; auto .
while ((valid trace___state_init_avx2) /\ 0<= i /\ i<= 7 /\ BArray224.is_init b_st 0 (32*i)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).

qed .

lemma __perm_reg3456_avx2_proof _r3 _r4 _r5 _r6 :
      (__perm_reg3456_avx2_spec _r3 _r4 _r5 _r6).
proof.
rewrite /__perm_reg3456_avx2_spec .
by proc; auto .
qed .

lemma __addstate_r3456_avx2_proof _st _b_st _r3 _r4 _r5 _r6 :
      (__addstate_r3456_avx2_spec _st _b_st _r3 _r4 _r5 _r6).
proof.
rewrite /__addstate_r3456_avx2_spec .
proc; auto .
ecall (__perm_reg3456_avx2_proof param_2 param_1 param_0 param).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray224.init_arrP).
qed .

lemma __stavx2_pos_avx2_proof _pOS : (__stavx2_pos_avx2_spec _pOS).
proof.
rewrite /__stavx2_pos_avx2_spec .
by proc; auto .
qed .

lemma __addratebit_avx2_proof _st _b_st _rATE_8 :
      (__addratebit_avx2_spec _st _b_st _rATE_8).
proof.
rewrite /__addratebit_avx2_spec .
proc; auto. inline *. auto.
rewrite /is_init /valid /= .
smt (List.all_cat BArray224.init_arrP).
qed .
lemma _keccakf1600_4x_pround_proof _e _b_e _a _b_a _r8 _r56 :
      (_keccakf1600_4x_pround_spec _e _b_e _a _b_a _r8 _r56).
proof.
rewrite /_keccakf1600_4x_pround_spec .
proc; auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __keccakf1600_avx2x4_proof _a _b_a :
      (__keccakf1600_avx2x4_spec _a _b_a).
proof.
rewrite /__keccakf1600_avx2x4_spec .
proc; auto .
while ((valid trace___keccakf1600_avx2x4) /\ 0 <=  c /\ ( c) %% 2 = 0).
auto .
ecall (_keccakf1600_4x_pround_proof param_6 b_param_0 param_5 b_param 
       param_4 param_3).
auto .
ecall (_keccakf1600_4x_pround_proof param_2 b_param_1 param_1 (
                                                              BArray800.init_arr
                                                              (JWord.W8.of_int 255)
                                                              ) param_0 
       param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat BArray800.init_arrP).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray800.init_arrP).
qed .

lemma _keccakf1600_avx2x4_proof _a _b_a : (_keccakf1600_avx2x4_spec _a _b_a).
proof.
rewrite /_keccakf1600_avx2x4_spec .
proc; auto .
ecall (__keccakf1600_avx2x4_proof param (BArray800.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray800.init_arrP).
qed .


lemma __4u64x4_u256x4_proof _y0 _y1 _y2 _y3 :
      (__4u64x4_u256x4_spec _y0 _y1 _y2 _y3).
proof.
rewrite /__4u64x4_u256x4_spec .
by proc; auto .
qed .

lemma __state_init_avx2x4_proof _st _b_st :
      (__state_init_avx2x4_spec _st _b_st).
proof.
rewrite /__state_init_avx2x4_spec .
proc; auto .
while ((valid trace___state_init_avx2x4) /\ 0<=i /\ i<=800 /\ (i%%32) = 0 /\ BArray800.is_init b_st 0 i).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __addratebit_avx2x4_proof _st _b_st _rATE8 :
      (__addratebit_avx2x4_spec _st _b_st _rATE8).
proof.
rewrite /__addratebit_avx2x4_spec .
  proc; auto . admit. (*assert false - fix compiler*)
qed .

require import Keccak_new_ASIZE.

clone KECCAK_ARRAY_ASIZE as KECCAK1 with
  op size <= 1, 
  theory BArrayS <= BArray1.


clone KECCAK_ARRAY_ASIZE as KECCAK2 with
  op size <= 2, 
  theory BArrayS <= BArray2.

 
clone KECCAK_ARRAY_ASIZE as KECCAK32 with
  op size <= 32, 
  theory BArrayS <= BArray32.

clone KECCAK_ARRAY_ASIZE as KECCAK33 with
  op size <= 33, 
  theory BArrayS <= BArray33.

clone KECCAK_ARRAY_ASIZE as KECCAK64 with
  op size <= 64, 
  theory BArrayS <= BArray64.

clone KECCAK_ARRAY_ASIZE as KECCAK128 with
  op size <= 128, 
  theory BArrayS <= BArray128.

clone KECCAK_ARRAY_ASIZE as KECCAK536 with
  op size <= 536, 
  theory BArrayS <= BArray536.

clone KECCAK_ARRAY_ASIZE as KECCAK1120 with
  op size <= 1120, 
  theory BArrayS <= BArray1120.


clone KECCAK_ARRAY_ASIZE as KECCAK1184 with
  op size <= 1184, 
  theory BArrayS <= BArray1184.

equiv a1____a_ilen_read_upto8_at_eq: M(Syscall).a1____a_ilen_read_upto8_at ~ KECCAK1.M.__a_ilen_read_upto8_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a1____a_ilen_read_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a1____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT .
proof.
  rewrite /a1____a_ilen_read_upto8_at_spec.
  have p := KECCAK1.__a_ilen_read_upto8_at_proof; rewrite /KECCAK1.__a_ilen_read_upto8_at_spec in p; 
  conseq( a1____a_ilen_read_upto8_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a1____addstate_avx2x4_eq: M(Syscall).a1____addstate_avx2x4 ~ KECCAK1.M.__addstate_avx2x4 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a1____addstate_avx2x4_proof _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN __TRAILB :  a1____addstate_avx2x4_spec _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN __TRAILB. 
proof. 
  rewrite /a1____addstate_avx2x4_spec.
  have p:= KECCAK1.__addstate_avx2x4_proof; rewrite /KECCAK1.__addstate_avx2x4_spec in p;
  conseq( a1____addstate_avx2x4_eq) (p _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN __TRAILB) => //.
  smt().
qed.

equiv a1____absorb_avx2x4_eq: M(Syscall).a1____absorb_avx2x4 ~ KECCAK1.M.__absorb_avx2x4 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a1____absorb_avx2x4_proof _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 __TRAILB __RATE8 :  a1____absorb_avx2x4_spec _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 __TRAILB __RATE8. 
proof. 
  rewrite /a1____absorb_avx2x4_spec.
  have p:= KECCAK1.__absorb_avx2x4_proof; rewrite /KECCAK1.__absorb_avx2x4_spec in p;
  conseq( a1____absorb_avx2x4_eq) (p _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 __TRAILB __RATE8) => //. smt().
qed.

equiv a2____a_ilen_read_upto8_at_eq: M(Syscall).a2____a_ilen_read_upto8_at ~ KECCAK2.M.__a_ilen_read_upto8_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a2____a_ilen_read_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a2____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a2____a_ilen_read_upto8_at_spec.
  have p:= KECCAK2.__a_ilen_read_upto8_at_proof; rewrite /KECCAK2.__a_ilen_read_upto8_at_spec in p;
  conseq( a2____a_ilen_read_upto8_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a2____a_ilen_read_upto16_at_eq: M(Syscall).a2____a_ilen_read_upto16_at ~ KECCAK2.M.__a_ilen_read_upto16_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.

lemma a2____a_ilen_read_upto16_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :
      (a2____a_ilen_read_upto16_at_spec _buf _b_buf _offset _dELTA _lEN
      _tRAIL _cUR _aT).
proof.
  rewrite /a2____a_ilen_read_upto16_at_spec.
  have p:= KECCAK2.__a_ilen_read_upto16_at_proof; rewrite /KECCAK2.__a_ilen_read_upto16_at_spec in p;
  conseq( a2____a_ilen_read_upto16_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a2____a_ilen_read_upto32_at_eq: M(Syscall).a2____a_ilen_read_upto32_at ~ KECCAK2.M.__a_ilen_read_upto32_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a2____a_ilen_read_upto32_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :
      (a2____a_ilen_read_upto32_at_spec _buf _b_buf _offset _dELTA _lEN
      _tRAIL _cUR _aT).
proof.
  rewrite /a2____a_ilen_read_upto32_at_spec.
  have p:= KECCAK2.__a_ilen_read_upto32_at_proof; rewrite /KECCAK2.__a_ilen_read_upto32_at_spec in p;
  conseq( a2____a_ilen_read_upto32_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.


equiv a2____addstate_avx2_eq: M(Syscall).a2____addstate_avx2 ~ KECCAK2.M.__addstate_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a2____addstate_avx2_proof _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB :  a2____addstate_avx2_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB. 
proof. 
  rewrite /a2____addstate_avx2_spec.
  have p:= KECCAK2.__addstate_avx2_proof; rewrite /KECCAK2.__addstate_avx2_spec in p;
  conseq( a2____addstate_avx2_eq) (p _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB) => //.
  smt().
qed.


equiv a2____absorb_avx2_eq: M(Syscall).a2____absorb_avx2 ~ KECCAK2.M.__absorb_avx2 : ={arg}==> ={res}.
proof.
    proc. inline *. sim.
qed.

   
  

lemma a2____absorb_avx2_proof _st _b_st _aT _buf _b_buf __TRAILB __RATE8 :  a2____absorb_avx2_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8. 
proof. 
  rewrite /a2____absorb_avx2_spec.
  have p:= KECCAK2.__absorb_avx2_proof; rewrite /KECCAK2.__absorb_avx2_spec in p;
  conseq( a2____absorb_avx2_eq) (p _st _b_st _aT _buf _b_buf __TRAILB __RATE8) => //.
  smt().
qed.

equiv a2____addstate_avx2x4_eq: M(Syscall).a2____addstate_avx2x4 ~ KECCAK2.M.__addstate_avx2x4 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a2____addstate_avx2x4_proof _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN __TRAILB :  a2____addstate_avx2x4_spec _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN __TRAILB. 
proof. 
  rewrite /a2____addstate_avx2x4_spec.
  have p:= KECCAK2.__addstate_avx2x4_proof; rewrite /KECCAK2.__addstate_avx2x4_spec in p;
  conseq( a2____addstate_avx2x4_eq) (p _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN __TRAILB) => //.
  smt().
qed.

equiv a2____absorb_avx2x4_eq: M(Syscall).a2____absorb_avx2x4 ~ KECCAK2.M.__absorb_avx2x4 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a2____absorb_avx2x4_proof _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 __TRAILB __RATE8 :  a2____absorb_avx2x4_spec _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 __TRAILB __RATE8. 
proof. 
  rewrite /a2____absorb_avx2x4_spec.
  have p:= KECCAK2.__absorb_avx2x4_proof; rewrite /KECCAK2.__absorb_avx2x4_spec in p;
  conseq( a2____absorb_avx2x4_eq) (p _st _b_st _aT _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 __TRAILB __RATE8) => //. smt(). 
qed.

equiv a32____a_ilen_read_upto8_at_eq: M(Syscall).a32____a_ilen_read_upto8_at ~ KECCAK32.M.__a_ilen_read_upto8_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a32____a_ilen_read_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a32____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a32____a_ilen_read_upto8_at_spec.
  have p:= KECCAK32.__a_ilen_read_upto8_at_proof; rewrite /KECCAK32.__a_ilen_read_upto8_at_spec in p;
  conseq( a32____a_ilen_read_upto8_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a32____a_ilen_read_upto16_at_eq: M(Syscall).a32____a_ilen_read_upto16_at ~ KECCAK32.M.__a_ilen_read_upto16_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.

lemma a32____a_ilen_read_upto16_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :
      (a32____a_ilen_read_upto16_at_spec _buf _b_buf _offset _dELTA _lEN
      _tRAIL _cUR _aT).
proof.
  rewrite /a32____a_ilen_read_upto16_at_spec.
  have p:= KECCAK32.__a_ilen_read_upto16_at_proof; rewrite /KECCAK32.__a_ilen_read_upto16_at_spec in p;
  conseq( a32____a_ilen_read_upto16_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a32____a_ilen_read_upto32_at_eq: M(Syscall).a32____a_ilen_read_upto32_at ~ KECCAK32.M.__a_ilen_read_upto32_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a32____a_ilen_read_upto32_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :
      (a32____a_ilen_read_upto32_at_spec _buf _b_buf _offset _dELTA _lEN
      _tRAIL _cUR _aT).
proof.
  rewrite /a32____a_ilen_read_upto32_at_spec.
  have p:= KECCAK32.__a_ilen_read_upto32_at_proof; rewrite /KECCAK32.__a_ilen_read_upto32_at_spec in p;
  conseq( a32____a_ilen_read_upto32_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.


equiv a32____a_ilen_read_bcast_upto8_at_eq: M(Syscall).a32____a_ilen_read_bcast_upto8_at ~ KECCAK32.M.__a_ilen_read_bcast_upto8_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a32____a_ilen_read_bcast_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a32____a_ilen_read_bcast_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a32____a_ilen_read_bcast_upto8_at_spec.
  have p:= KECCAK32.__a_ilen_read_bcast_upto8_at_proof; rewrite /KECCAK32.__a_ilen_read_bcast_upto8_at_spec in p;
  conseq( a32____a_ilen_read_bcast_upto8_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a32____a_ilen_write_upto8_eq: M(Syscall).a32____a_ilen_write_upto8 ~ KECCAK32.M.__a_ilen_write_upto8 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a32____a_ilen_write_upto8_proof _buf _b_buf _offset _dELTA _lEN _w :  a32____a_ilen_write_upto8_spec _buf _b_buf _offset _dELTA _lEN _w. 
proof. 
  rewrite /a32____a_ilen_write_upto8_spec.
  have p:= KECCAK32.__a_ilen_write_upto8_proof; rewrite /KECCAK32.__a_ilen_write_upto8_spec in p;
  conseq( a32____a_ilen_write_upto8_eq) (p  _buf _b_buf _offset _dELTA _lEN _w) => //.
  smt().
qed.

equiv a32____a_ilen_write_upto16_eq: M(Syscall).a32____a_ilen_write_upto16 ~ KECCAK32.M.__a_ilen_write_upto16 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a32____a_ilen_write_upto16_proof _buf _b_buf _offset _dELTA _lEN _w :  a32____a_ilen_write_upto16_spec _buf _b_buf _offset _dELTA _lEN _w. 
proof. 
  rewrite /a32____a_ilen_write_upto16_spec.
  have p:= KECCAK32.__a_ilen_write_upto16_proof; rewrite /KECCAK32.__a_ilen_write_upto16_spec in p;
  conseq( a32____a_ilen_write_upto16_eq) (p  _buf _b_buf _offset _dELTA _lEN _w) => //.
  smt().
qed.

equiv a32____a_ilen_write_upto32_eq: M(Syscall).a32____a_ilen_write_upto32 ~ KECCAK32.M.__a_ilen_write_upto32 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a32____a_ilen_write_upto32_proof _buf _b_buf _offset _dELTA _lEN _w :  a32____a_ilen_write_upto32_spec _buf _b_buf _offset _dELTA _lEN _w. 
proof. 
  rewrite /a32____a_ilen_write_upto32_spec.
  have p:= KECCAK32.__a_ilen_write_upto32_proof; rewrite /KECCAK32.__a_ilen_write_upto32_spec in p;
  conseq( a32____a_ilen_write_upto32_eq) (p  _buf _b_buf _offset _dELTA _lEN _w) => //.
  smt().
qed.

equiv a32____addstate_avx2_eq: M(Syscall).a32____addstate_avx2 ~ KECCAK32.M.__addstate_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a32____addstate_avx2_proof _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB :  a32____addstate_avx2_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB. 
proof. 
  rewrite /a32____addstate_avx2_spec.
  have p:= KECCAK32.__addstate_avx2_proof; rewrite /KECCAK32.__addstate_avx2_spec in p;
  conseq( a32____addstate_avx2_eq) (p  _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB) => //.
  smt().
qed.

equiv a32____absorb_avx2_eq: M(Syscall).a32____absorb_avx2 ~ KECCAK32.M.__absorb_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a32____absorb_avx2_proof _st _b_st _aT _buf _b_buf __TRAILB __RATE8 :  a32____absorb_avx2_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8. 
proof. 
  rewrite /a32____absorb_avx2_spec.
  have p:= KECCAK32.__absorb_avx2_proof; rewrite /KECCAK32.__absorb_avx2_spec in p;
  conseq( a32____absorb_avx2_eq) (p  _st _b_st _aT _buf _b_buf __TRAILB __RATE8) => //.
  smt().
qed.

equiv a32____dumpstate_avx2_eq: M(Syscall).a32____dumpstate_avx2 ~ KECCAK32.M.__dumpstate_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a32____dumpstate_avx2_proof _buf _b_buf _offset __LEN _st _b_st :  a32____dumpstate_avx2_spec _buf _b_buf _offset __LEN _st _b_st. 
proof. 
  rewrite /a32____dumpstate_avx2_spec.
  have p:= KECCAK32.__dumpstate_avx2_proof; rewrite /KECCAK32.__dumpstate_avx2_spec in p;
  conseq( a32____dumpstate_avx2_eq) (p  _buf _b_buf _offset __LEN _st _b_st) => //.
  smt().
qed.

equiv a32____squeeze_avx2_eq: M(Syscall).a32____squeeze_avx2 ~ KECCAK32.M.__squeeze_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a32____squeeze_avx2_proof _st _b_st _buf _b_buf __RATE8 :  a32____squeeze_avx2_spec _st _b_st _buf _b_buf __RATE8. 
proof. 
  rewrite /a32____squeeze_avx2_spec.
  have p:= KECCAK32.__squeeze_avx2_proof; rewrite /KECCAK32.__squeeze_avx2_spec in p;
  conseq( a32____squeeze_avx2_eq) (p  _st _b_st _buf _b_buf __RATE8) => //.
  smt().
qed.

equiv a32____addstate_bcast_avx2x4_eq: M(Syscall).a32____addstate_bcast_avx2x4 ~ KECCAK32.M.__addstate_bcast_avx2x4 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a32____addstate_bcast_avx2x4_proof _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB :  a32____addstate_bcast_avx2x4_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB. 
proof. 
  rewrite /a32____addstate_bcast_avx2x4_spec.
  have p:= KECCAK32.__addstate_bcast_avx2x4_proof; rewrite /KECCAK32.__addstate_bcast_avx2x4_spec in p;
  conseq( a32____addstate_bcast_avx2x4_eq) (p  _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB) => //.
  smt().
qed.

equiv a32____absorb_bcast_avx2x4_eq: M(Syscall).a32____absorb_bcast_avx2x4 ~ KECCAK32.M.__absorb_bcast_avx2x4 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a32____absorb_bcast_avx2x4_proof _st _b_st _aT _buf _b_buf __TRAILB __RATE8 :  a32____absorb_bcast_avx2x4_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8. 
proof. 
  rewrite /a32____absorb_bcast_avx2x4_spec.
  have p:= KECCAK32.__absorb_bcast_avx2x4_proof; rewrite /KECCAK32.__absorb_bcast_avx2x4_spec in p;
  conseq( a32____absorb_bcast_avx2x4_eq) (p  _st _b_st _aT _buf _b_buf __TRAILB __RATE8) => //.
  smt().
qed.

equiv a33____a_ilen_read_upto8_at_eq: M(Syscall).a33____a_ilen_read_upto8_at ~ KECCAK33.M.__a_ilen_read_upto8_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a33____a_ilen_read_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a33____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a33____a_ilen_read_upto8_at_spec.
  have p:= KECCAK33.__a_ilen_read_upto8_at_proof; rewrite /KECCAK33.__a_ilen_read_upto8_at_spec in p;
  conseq( a33____a_ilen_read_upto8_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a33____a_ilen_read_upto16_at_eq: M(Syscall).a33____a_ilen_read_upto16_at ~ KECCAK33.M.__a_ilen_read_upto16_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a33____a_ilen_read_upto16_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a33____a_ilen_read_upto16_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a33____a_ilen_read_upto16_at_spec.
  have p:= KECCAK33.__a_ilen_read_upto16_at_proof; rewrite /KECCAK33.__a_ilen_read_upto16_at_spec in p;
  conseq( a33____a_ilen_read_upto16_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a33____a_ilen_read_upto32_at_eq: M(Syscall).a33____a_ilen_read_upto32_at ~ KECCAK33.M.__a_ilen_read_upto32_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a33____a_ilen_read_upto32_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a33____a_ilen_read_upto32_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a33____a_ilen_read_upto32_at_spec.
  have p:= KECCAK33.__a_ilen_read_upto32_at_proof; rewrite /KECCAK33.__a_ilen_read_upto32_at_spec in p;
  conseq( a33____a_ilen_read_upto32_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a33____addstate_avx2_eq: M(Syscall).a33____addstate_avx2 ~ KECCAK33.M.__addstate_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a33____addstate_avx2_proof _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB :  a33____addstate_avx2_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB. 
proof. 
  rewrite /a33____addstate_avx2_spec.
  have p:= KECCAK33.__addstate_avx2_proof; rewrite /KECCAK33.__addstate_avx2_spec in p;
  conseq( a33____addstate_avx2_eq) (p  _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB) => //.
  smt().
qed.

equiv a33____absorb_avx2_eq: M(Syscall).a33____absorb_avx2 ~ KECCAK33.M.__absorb_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a33____absorb_avx2_proof _st _b_st _aT _buf _b_buf __TRAILB __RATE8 :  a33____absorb_avx2_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8. 
proof. 
  rewrite /a33____absorb_avx2_spec.
  have p:= KECCAK33.__absorb_avx2_proof; rewrite /KECCAK33.__absorb_avx2_spec in p;
  conseq( a33____absorb_avx2_eq) (p  _st _b_st _aT _buf _b_buf __TRAILB __RATE8) => //.
  smt().
qed.

equiv a64____a_ilen_read_upto8_at_eq: M(Syscall).a64____a_ilen_read_upto8_at ~ KECCAK64.M.__a_ilen_read_upto8_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a64____a_ilen_read_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a64____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a64____a_ilen_read_upto8_at_spec.
  have p:= KECCAK64.__a_ilen_read_upto8_at_proof; rewrite /KECCAK64.__a_ilen_read_upto8_at_spec in p;
  conseq( a64____a_ilen_read_upto8_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a64____a_ilen_read_upto16_at_eq: M(Syscall).a64____a_ilen_read_upto16_at ~ KECCAK64.M.__a_ilen_read_upto16_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a64____a_ilen_read_upto16_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a64____a_ilen_read_upto16_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a64____a_ilen_read_upto16_at_spec.
  have p:= KECCAK64.__a_ilen_read_upto16_at_proof; rewrite /KECCAK64.__a_ilen_read_upto16_at_spec in p;
  conseq( a64____a_ilen_read_upto16_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a64____a_ilen_read_upto32_at_eq: M(Syscall).a64____a_ilen_read_upto32_at ~ KECCAK64.M.__a_ilen_read_upto32_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a64____a_ilen_read_upto32_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a64____a_ilen_read_upto32_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a64____a_ilen_read_upto32_at_spec.
  have p:= KECCAK64.__a_ilen_read_upto32_at_proof; rewrite /KECCAK64.__a_ilen_read_upto32_at_spec in p;
  conseq( a64____a_ilen_read_upto32_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a64____a_ilen_write_upto8_eq: M(Syscall).a64____a_ilen_write_upto8 ~ KECCAK64.M.__a_ilen_write_upto8 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a64____a_ilen_write_upto8_proof _buf _b_buf _offset _dELTA _lEN _w :  a64____a_ilen_write_upto8_spec _buf _b_buf _offset _dELTA _lEN _w. 
proof. 
  rewrite /a64____a_ilen_write_upto8_spec.
  have p:= KECCAK64.__a_ilen_write_upto8_proof; rewrite /KECCAK64.__a_ilen_write_upto8_spec in p;
  conseq( a64____a_ilen_write_upto8_eq) (p  _buf _b_buf _offset _dELTA _lEN _w) => //.
  smt().
qed.

equiv a64____a_ilen_write_upto16_eq: M(Syscall).a64____a_ilen_write_upto16 ~ KECCAK64.M.__a_ilen_write_upto16 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a64____a_ilen_write_upto16_proof _buf _b_buf _offset _dELTA _lEN _w :  a64____a_ilen_write_upto16_spec _buf _b_buf _offset _dELTA _lEN _w. 
proof. 
  rewrite /a64____a_ilen_write_upto16_spec.
  have p:= KECCAK64.__a_ilen_write_upto16_proof; rewrite /KECCAK64.__a_ilen_write_upto16_spec in p;
  conseq( a64____a_ilen_write_upto16_eq) (p  _buf _b_buf _offset _dELTA _lEN _w) => //.
  smt().
qed.

equiv a64____a_ilen_write_upto32_eq: M(Syscall).a64____a_ilen_write_upto32 ~ KECCAK64.M.__a_ilen_write_upto32 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a64____a_ilen_write_upto32_proof _buf _b_buf _offset _dELTA _lEN _w :  a64____a_ilen_write_upto32_spec _buf _b_buf _offset _dELTA _lEN _w. 
proof. 
  rewrite /a64____a_ilen_write_upto32_spec.
  have p:= KECCAK64.__a_ilen_write_upto32_proof; rewrite /KECCAK64.__a_ilen_write_upto32_spec in p;
  conseq( a64____a_ilen_write_upto32_eq) (p  _buf _b_buf _offset _dELTA _lEN _w) => //.
  smt().
qed.

equiv a64____addstate_avx2_eq: M(Syscall).a64____addstate_avx2 ~ KECCAK64.M.__addstate_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a64____addstate_avx2_proof _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB :  a64____addstate_avx2_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB. 
proof. 
  rewrite /a64____addstate_avx2_spec.
  have p:= KECCAK64.__addstate_avx2_proof; rewrite /KECCAK64.__addstate_avx2_spec in p;
  conseq( a64____addstate_avx2_eq) (p  _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB) => //.
  smt().
qed.

equiv a64____absorb_avx2_eq: M(Syscall).a64____absorb_avx2 ~ KECCAK64.M.__absorb_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a64____absorb_avx2_proof _st _b_st _aT _buf _b_buf __TRAILB __RATE8 :  a64____absorb_avx2_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8. 
proof. 
  rewrite /a64____absorb_avx2_spec.
  have p:= KECCAK64.__absorb_avx2_proof; rewrite /KECCAK64.__absorb_avx2_spec in p;
  conseq( a64____absorb_avx2_eq) (p  _st _b_st _aT _buf _b_buf __TRAILB __RATE8) => //.
  smt().
qed.

equiv a64____dumpstate_avx2_eq: M(Syscall).a64____dumpstate_avx2 ~ KECCAK64.M.__dumpstate_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a64____dumpstate_avx2_proof _buf _b_buf _offset __LEN _st _b_st :  a64____dumpstate_avx2_spec _buf _b_buf _offset __LEN _st _b_st. 
proof. 
  rewrite /a64____dumpstate_avx2_spec.
  have p:= KECCAK64.__dumpstate_avx2_proof; rewrite /KECCAK64.__dumpstate_avx2_spec in p;
  conseq( a64____dumpstate_avx2_eq) (p  _buf _b_buf _offset __LEN _st _b_st) => //.
  smt().
qed.

equiv a64____squeeze_avx2_eq: M(Syscall).a64____squeeze_avx2 ~ KECCAK64.M.__squeeze_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a64____squeeze_avx2_proof _st _b_st _buf _b_buf __RATE8 :  a64____squeeze_avx2_spec _st _b_st _buf _b_buf __RATE8. 
proof. 
  rewrite /a64____squeeze_avx2_spec.
  have p:= KECCAK64.__squeeze_avx2_proof; rewrite /KECCAK64.__squeeze_avx2_spec in p;
  conseq( a64____squeeze_avx2_eq) (p  _st _b_st _buf _b_buf __RATE8) => //.
  smt().
qed.

equiv a128____a_ilen_write_upto8_eq: M(Syscall).a128____a_ilen_write_upto8 ~ KECCAK128.M.__a_ilen_write_upto8 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a128____a_ilen_write_upto8_proof _buf _b_buf _offset _dELTA _lEN _w :  a128____a_ilen_write_upto8_spec _buf _b_buf _offset _dELTA _lEN _w. 
proof. 
  rewrite /a128____a_ilen_write_upto8_spec.
  have p:= KECCAK128.__a_ilen_write_upto8_proof; rewrite /KECCAK128.__a_ilen_write_upto8_spec in p;
  conseq( a128____a_ilen_write_upto8_eq) (p  _buf _b_buf _offset _dELTA _lEN _w) => //.
  smt().
qed.

equiv a128____dumpstate_avx2x4_eq: M(Syscall).a128____dumpstate_avx2x4 ~ KECCAK128.M.__dumpstate_avx2x4 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a128____dumpstate_avx2x4_proof _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN _st _b_st :  a128____dumpstate_avx2x4_spec _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN _st _b_st. 
proof. 
  rewrite /a128____dumpstate_avx2x4_spec.
  have p:= KECCAK128.__dumpstate_avx2x4_proof; rewrite /KECCAK128.__dumpstate_avx2x4_spec in p;
  conseq( a128____dumpstate_avx2x4_eq) (p  _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN _st _b_st) => //.
  smt().
qed.

equiv a128____squeeze_avx2x4_eq: M(Syscall).a128____squeeze_avx2x4 ~ KECCAK128.M.__squeeze_avx2x4 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a128____squeeze_avx2x4_proof _st _b_st _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 __RATE8 :  a128____squeeze_avx2x4_spec _st _b_st _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 __RATE8. 
proof. 
  rewrite /a128____squeeze_avx2x4_spec.
  have p:= KECCAK128.__squeeze_avx2x4_proof; rewrite /KECCAK128.__squeeze_avx2x4_spec in p;
  conseq( a128____squeeze_avx2x4_eq) (p  _st _b_st _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 __RATE8) => //.
  smt().
qed.

 
equiv a1184____a_ilen_read_upto8_at_eq: M(Syscall).a1184____a_ilen_read_upto8_at ~ KECCAK1184.M.__a_ilen_read_upto8_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a1184____a_ilen_read_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a1184____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a1184____a_ilen_read_upto8_at_spec.
  have p:= KECCAK1184.__a_ilen_read_upto8_at_proof; rewrite /KECCAK1184.__a_ilen_read_upto8_at_spec in p;
  conseq( a1184____a_ilen_read_upto8_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a1184____a_ilen_read_upto16_at_eq: M(Syscall).a1184____a_ilen_read_upto16_at ~ KECCAK1184.M.__a_ilen_read_upto16_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a1184____a_ilen_read_upto16_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a1184____a_ilen_read_upto16_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a1184____a_ilen_read_upto16_at_spec.
  have p:= KECCAK1184.__a_ilen_read_upto16_at_proof; rewrite /KECCAK1184.__a_ilen_read_upto16_at_spec in p;
  conseq( a1184____a_ilen_read_upto16_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a1184____a_ilen_read_upto32_at_eq: M(Syscall).a1184____a_ilen_read_upto32_at ~ KECCAK1184.M.__a_ilen_read_upto32_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a1184____a_ilen_read_upto32_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a1184____a_ilen_read_upto32_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a1184____a_ilen_read_upto32_at_spec.
  have p:= KECCAK1184.__a_ilen_read_upto32_at_proof; rewrite /KECCAK1184.__a_ilen_read_upto32_at_spec in p;
  conseq( a1184____a_ilen_read_upto32_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a1184____addstate_avx2_eq: M(Syscall).a1184____addstate_avx2 ~ KECCAK1184.M.__addstate_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a1184____addstate_avx2_proof _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB :  a1184____addstate_avx2_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB. 
proof. 
  rewrite /a1184____addstate_avx2_spec.
  have p:= KECCAK1184.__addstate_avx2_proof; rewrite /KECCAK1184.__addstate_avx2_spec in p;
  conseq( a1184____addstate_avx2_eq) (p  _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB) => //.
  smt().
qed.

equiv a1184____absorb_avx2_eq: M(Syscall).a1184____absorb_avx2 ~ KECCAK1184.M.__absorb_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a1184____absorb_avx2_proof _st _b_st _aT _buf _b_buf __TRAILB __RATE8 :  a1184____absorb_avx2_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8. 
proof. 
  rewrite /a1184____absorb_avx2_spec.
  have p:= KECCAK1184.__absorb_avx2_proof; rewrite /KECCAK1184.__absorb_avx2_spec in p;
  conseq( a1184____absorb_avx2_eq) (p  _st _b_st _aT _buf _b_buf __TRAILB __RATE8) => //.
  smt().
qed.

equiv a1120____a_ilen_read_upto8_at_eq: M(Syscall).a1120____a_ilen_read_upto8_at ~ KECCAK1120.M.__a_ilen_read_upto8_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a1120____a_ilen_read_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a1120____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a1120____a_ilen_read_upto8_at_spec.
  have p:= KECCAK1120.__a_ilen_read_upto8_at_proof; rewrite /KECCAK1120.__a_ilen_read_upto8_at_spec in p;
  conseq( a1120____a_ilen_read_upto8_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a1120____a_ilen_read_upto16_at_eq: M(Syscall).a1120____a_ilen_read_upto16_at ~ KECCAK1120.M.__a_ilen_read_upto16_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a1120____a_ilen_read_upto16_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a1120____a_ilen_read_upto16_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a1120____a_ilen_read_upto16_at_spec.
  have p:= KECCAK1120.__a_ilen_read_upto16_at_proof; rewrite /KECCAK1120.__a_ilen_read_upto16_at_spec in p;
  conseq( a1120____a_ilen_read_upto16_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a1120____a_ilen_read_upto32_at_eq: M(Syscall).a1120____a_ilen_read_upto32_at ~ KECCAK1120.M.__a_ilen_read_upto32_at : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a1120____a_ilen_read_upto32_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :  a1120____a_ilen_read_upto32_at_spec _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT. 
proof. 
  rewrite /a1120____a_ilen_read_upto32_at_spec.
  have p:= KECCAK1120.__a_ilen_read_upto32_at_proof; rewrite /KECCAK1120.__a_ilen_read_upto32_at_spec in p;
  conseq( a1120____a_ilen_read_upto32_at_eq) (p  _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT) => //.
  smt().
qed.

equiv a1120____addstate_avx2_eq: M(Syscall).a1120____addstate_avx2 ~ KECCAK1120.M.__addstate_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a1120____addstate_avx2_proof _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB :  a1120____addstate_avx2_spec _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB. 
proof. 
  rewrite /a1120____addstate_avx2_spec.
  have p:= KECCAK1120.__addstate_avx2_proof; rewrite /KECCAK1120.__addstate_avx2_spec in p;
  conseq( a1120____addstate_avx2_eq) (p  _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB) => //.
  smt().
qed.

equiv a1120____absorb_avx2_eq: M(Syscall).a1120____absorb_avx2 ~ KECCAK1120.M.__absorb_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma a1120____absorb_avx2_proof _st _b_st _aT _buf _b_buf __TRAILB __RATE8 :  a1120____absorb_avx2_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8. 
proof. 
  rewrite /a1120____absorb_avx2_spec.
  have p:= KECCAK1120.__absorb_avx2_proof; rewrite /KECCAK1120.__absorb_avx2_spec in p;
  conseq( a1120____absorb_avx2_eq) (p _st _b_st _aT _buf _b_buf __TRAILB __RATE8) => //.
  smt().
qed.

equiv aBUFLEN____a_ilen_write_upto8_eq: M(Syscall).aBUFLEN____a_ilen_write_upto8 ~ KECCAK536.M.__a_ilen_write_upto8 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma aBUFLEN____a_ilen_write_upto8_proof _buf _b_buf _offset _dELTA _lEN _w :  aBUFLEN____a_ilen_write_upto8_spec _buf _b_buf _offset _dELTA _lEN _w. 
proof. 
  rewrite /aBUFLEN____a_ilen_write_upto8_spec.
  have p:= KECCAK536.__a_ilen_write_upto8_proof; rewrite /KECCAK536.__a_ilen_write_upto8_spec in p;
  conseq( aBUFLEN____a_ilen_write_upto8_eq) (p  _buf _b_buf _offset _dELTA _lEN _w) => //.
  smt().
qed.


equiv aBUFLEN____a_ilen_write_upto16_eq: M(Syscall).aBUFLEN____a_ilen_write_upto16 ~ KECCAK536.M.__a_ilen_write_upto16 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma aBUFLEN____a_ilen_write_upto16_proof _buf _b_buf _offset _dELTA _lEN _w :  aBUFLEN____a_ilen_write_upto16_spec _buf _b_buf _offset _dELTA _lEN _w. 
proof. 
  rewrite /aBUFLEN____a_ilen_write_upto16_spec.
  have p:= KECCAK536.__a_ilen_write_upto16_proof; rewrite /KECCAK536.__a_ilen_write_upto16_spec in p;
  conseq( aBUFLEN____a_ilen_write_upto16_eq) (p  _buf _b_buf _offset _dELTA _lEN _w) => //.
  smt().
qed.


equiv aBUFLEN____a_ilen_write_upto32_eq: M(Syscall).aBUFLEN____a_ilen_write_upto32 ~ KECCAK536.M.__a_ilen_write_upto32 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma aBUFLEN____a_ilen_write_upto32_proof _buf _b_buf _offset _dELTA _lEN _w :  aBUFLEN____a_ilen_write_upto32_spec _buf _b_buf _offset _dELTA _lEN _w. 
proof. 
  rewrite /aBUFLEN____a_ilen_write_upto32_spec.
  have p:= KECCAK536.__a_ilen_write_upto32_proof; rewrite /KECCAK536.__a_ilen_write_upto32_spec in p;
  conseq( aBUFLEN____a_ilen_write_upto32_eq) (p  _buf _b_buf _offset _dELTA _lEN _w) => //.
  smt().
qed.

equiv aBUFLEN____dumpstate_avx2_eq: M(Syscall).aBUFLEN____dumpstate_avx2 ~ KECCAK536.M.__dumpstate_avx2 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.

lemma aBUFLEN____dumpstate_avx2_proof _buf _b_buf _offset __LEN _st _b_st :
      (aBUFLEN____dumpstate_avx2_spec _buf _b_buf _offset __LEN _st _b_st).
proof.
       rewrite /aBUFLEN____dumpstate_avx2_spec.
       have p:= KECCAK536.__dumpstate_avx2_proof; rewrite /KECCAK536.__dumpstate_avx2_spec in p;
       conseq( aBUFLEN____dumpstate_avx2_eq) (p _buf _b_buf _offset __LEN _st _b_st) => //.
       smt().
qed.

equiv aBUFLEN____dumpstate_avx2x4_eq: M(Syscall).aBUFLEN____dumpstate_avx2x4 ~ KECCAK536.M.__dumpstate_avx2x4 : ={arg}==> ={res}.
proof.
    proc;inline *; sim.
qed.


lemma aBUFLEN____dumpstate_avx2x4_proof _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN _st _b_st :  aBUFLEN____dumpstate_avx2x4_spec _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN _st _b_st. 
proof. 
  rewrite /aBUFLEN____dumpstate_avx2x4_spec.
  have p:= KECCAK536.__dumpstate_avx2x4_proof; rewrite /KECCAK536.__dumpstate_avx2x4_spec in p;
  conseq( aBUFLEN____dumpstate_avx2x4_eq) (p _buf0 _b_buf0 _buf1 _b_buf1 _buf2 _b_buf2 _buf3 _b_buf3 _offset __LEN _st _b_st) => //.
  smt().
qed.


lemma _sha3_512A_A33_proof _out _b_out _in _b_in :
      (_sha3_512A_A33_spec _out _b_out _in _b_in).
proof.
proc; auto .
ecall (a64____squeeze_avx2_proof param_6 (BArray224.init_arr (JWord.W8.of_int 255)) 
       param_5 b_param param_4).
auto .
ecall (a33____absorb_avx2_proof param_3 (BArray224.init_arr (JWord.W8.of_int 255)) 
       param_2 param_1 (BArray33.init_arr (JWord.W8.of_int 255)) param_0 param).
auto .
ecall (__state_init_avx2_proof).
auto .
rewrite /is_init /valid /= => &m /> * .
smt (List.all_cat BArray33.init_arrP BArray224.init_arrP BArray64.init_arrP).
qed .


lemma _sha3_512A_A64_proof _out _b_out _in _b_in :
      (_sha3_512A_A64_spec _out _b_out _in _b_in).
proof. 
rewrite /_sha3_512A_A64_spec .
proc; auto .
ecall (a64____squeeze_avx2_proof param_6 (BArray224.init_arr (JWord.W8.of_int 255)) 
       param_5 b_param param_4).
auto .
ecall (a64____absorb_avx2_proof param_3 (BArray224.init_arr (JWord.W8.of_int 255)) 
       param_2 param_1 (BArray64.init_arr (JWord.W8.of_int 255)) param_0 param).
auto .
ecall (__state_init_avx2_proof).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat  BArray224.init_arrP BArray64.init_arrP).
qed .


lemma _shake256x4_A128__A32_A1_proof _out0 _b_out0 _out1 _b_out1 _out2 _b_out2 _out3 _b_out3 _seed _b_seed _nonces _b_nonces :
      (_shake256x4_A128__A32_A1_spec _out0 _b_out0 _out1 _b_out1 _out2
      _b_out2 _out3 _b_out3 _seed _b_seed _nonces _b_nonces).
proof. 
rewrite /_shake256x4_A128__A32_A1_spec .
proc; auto .
ecall (a128____squeeze_avx2x4_proof param_18 (BArray800.init_arr
                                             (JWord.W8.of_int 255)) param_17 
       b_param_2 param_16 b_param_1 param_15 b_param_0 param_14 b_param 
       param_13).
auto .
ecall (a1____absorb_avx2x4_proof param_12 (BArray800.init_arr (JWord.W8.of_int 255)
                                          ) param_11 param_10 b_param_6 
       param_9 b_param_5 param_8 b_param_4 param_7 b_param_3 param_6 
       param_5).
auto .
ecall (a32____absorb_bcast_avx2x4_proof param_4 (BArray800.init_arr
                                                (JWord.W8.of_int 255)) param_3 
       param_2 (BArray32.init_arr (JWord.W8.of_int 255)) param_1 param_0).
auto .
ecall (__state_init_avx2x4_proof param b_param_7).
auto .
rewrite /is_init /valid /= => &m /> *.
split.  smt(BArray32.init_arrP BArray800.init_arrP).
move => *. split. smt(SBArray4_1.SBArray4_1.is_init_cell_get).
move => *. rewrite !List.all_cat /=. smt(BArray128.init_arrP).
qed.

lemma _shake128_absorb_A32_A2_proof _seed _b_seed _pos _b_pos :
      (_shake128_absorb_A32_A2_spec _seed _b_seed _pos _b_pos).
proof. 
rewrite /_shake128_absorb_A32_A2_spec .
proc; auto .
ecall (a2____absorb_avx2_proof param_8 (BArray224.init_arr (JWord.W8.of_int 255)) 
       param_7 param_6 (BArray2.init_arr (JWord.W8.of_int 255)) param_5 param_4).
auto .
ecall (a32____absorb_avx2_proof param_3 (BArray224.init_arr (JWord.W8.of_int 255)) 
       param_2 param_1 (BArray32.init_arr (JWord.W8.of_int 255)) param_0 param).
auto .
ecall (__state_init_avx2_proof).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray32.init_arrP BArray224.init_arrP BArray2.init_arrP).
qed. 

lemma _shake128x4_absorb_A32_A2_proof _st _b_st _seed _b_seed _pos _b_pos :
      (_shake128x4_absorb_A32_A2_spec _st _b_st _seed _b_seed _pos _b_pos).
proof. 
rewrite /_shake128x4_absorb_A32_A2_spec .
proc; auto .
ecall (a2____absorb_avx2x4_proof param_12 (BArray800.init_arr (JWord.W8.of_int 255)
                                          ) param_11 param_10 b_param_2 
       param_9 b_param_1 param_8 b_param_0 param_7 b_param param_6 param_5).
auto .
ecall (a32____absorb_bcast_avx2x4_proof param_4 (BArray800.init_arr
                                                (JWord.W8.of_int 255)) param_3 
       param_2 (BArray32.init_arr (JWord.W8.of_int 255)) param_1 param_0).
auto .
ecall (__state_init_avx2x4_proof param b_param_3).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray32.init_arrP BArray800.init_arrP SBArray8_2.SBArray8_2.is_init_cell_get).
qed .

lemma _shake128_squeeze3blocks_proof _buf _b_buf _st _b_st :
      (_shake128_squeeze3blocks_spec _buf _b_buf _st _b_st).
proof. 
rewrite /_shake128_squeeze3blocks_spec .
proc; auto .
ecall (aBUFLEN____dumpstate_avx2_proof param_13 b_param param_12 param_11 
       param_10 (BArray224.init_arr (JWord.W8.of_int 255))).
auto .
ecall (_keccakf1600_avx2_proof param_9 (BArray224.init_arr (JWord.W8.of_int 255))).
auto .
ecall (aBUFLEN____dumpstate_avx2_proof param_8 b_param_0 param_7 param_6 
       param_5 (BArray224.init_arr (JWord.W8.of_int 255))).
auto .
ecall (_keccakf1600_avx2_proof param_4 (BArray224.init_arr (JWord.W8.of_int 255))).
auto .
ecall (aBUFLEN____dumpstate_avx2_proof param_3 b_param_1 param_2 param_1 
       param_0 (BArray224.init_arr (JWord.W8.of_int 255))).
auto .
ecall (_keccakf1600_avx2_proof param (BArray224.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= => &m /> *.
split.  smt(BArray224.init_arrP).
move => *. split.  smt().
move => *. split. smt().
move => *. split.  smt().
move => *. split.  smt().
move => *. rewrite !List.all_cat /=. smt().
qed.

lemma _shake128_next_state_proof _buf _b_buf :
      (_shake128_next_state_spec _buf _b_buf).
proof.
rewrite /_shake128_next_state_spec .
proc; auto .
ecall (_keccakf1600_st25_avx2_proof param b_param).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray200.init_arrP SBArray536_200.SBArray536_200.is_init_cell_get BArray536.init_arrP SBArray536_200.SBArray536_200.is_init_cell_set).
qed .

lemma _shake128x4_squeeze3blocks_proof _st _b_st _buf _b_buf :
      (_shake128x4_squeeze3blocks_spec _st _b_st _buf _b_buf).
proof.
rewrite /_shake128x4_squeeze3blocks_spec .
proc; auto .
ecall (aBUFLEN____dumpstate_avx2x4_proof param_22 b_param_2 param_21 
       b_param_1 param_20 b_param_0 param_19 b_param param_18 param_17 
       param_16 (BArray800.init_arr (JWord.W8.of_int 255))).
auto .
ecall (_keccakf1600_avx2x4_proof param_15 (BArray800.init_arr (JWord.W8.of_int 255)
                                          )).
auto .
ecall (aBUFLEN____dumpstate_avx2x4_proof param_14 b_param_6 param_13 
       b_param_5 param_12 b_param_4 param_11 b_param_3 param_10 param_9 
       param_8 (BArray800.init_arr (JWord.W8.of_int 255))).
auto .
ecall (_keccakf1600_avx2x4_proof param_7 (BArray800.init_arr (JWord.W8.of_int 255))).
auto .
ecall (aBUFLEN____dumpstate_avx2x4_proof param_6 b_param_10 param_5 b_param_9 
       param_4 b_param_8 param_3 b_param_7 param_2 param_1 param_0 (
                                                                   BArray800.init_arr
                                                                   (JWord.W8.of_int
                                                                   255))).
auto .
ecall (_keccakf1600_avx2x4_proof param (BArray800.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= => &m /> *. split.  smt(BArray800.init_arrP).
move => *. split. smt( SBArray2144_536.SBArray2144_536.is_init_cell_get).
move => *. split.  smt().
move => *. split. smt().
move => *. split. smt( SBArray2144_536.SBArray2144_536.is_init_cell_set SBArray2144_536.SBArray2144_536.is_init_cell_get).
move => *. rewrite !List.all_cat /=. smt().
qed.

lemma _sha3_256A_A1184_proof _out _b_out _in _b_in :
      (_sha3_256A_A1184_spec _out _b_out _in _b_in).
proof. 
rewrite /_sha3_256A_A1184_spec .
proc; auto .
ecall (a32____squeeze_avx2_proof param_6 (BArray224.init_arr (JWord.W8.of_int 255)) 
       param_5 b_param param_4).
auto .
ecall (a1184____absorb_avx2_proof param_3 (BArray224.init_arr (JWord.W8.of_int 255)
                                          ) param_2 param_1 (
                                                            BArray1184.init_arr
                                                            (JWord.W8.of_int 255)) 
       param_0 param).
auto .
ecall (__state_init_avx2_proof).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray224.init_arrP BArray1184.init_arrP BArray32.init_arrP).
qed.

lemma _shake256_A32__A1120_proof _out _b_out _in _b_in :
      (_shake256_A32__A1120_spec _out _b_out _in _b_in).
proof. 
rewrite /_shake256_A32__A1120_spec .
proc; auto .
ecall (a32____squeeze_avx2_proof param_6 (BArray224.init_arr (JWord.W8.of_int 255)) 
       param_5 b_param param_4).
auto .
ecall (a1120____absorb_avx2_proof param_3 (BArray224.init_arr (JWord.W8.of_int 255)
                                          ) param_2 param_1 (
                                                            BArray1120.init_arr
                                                            (JWord.W8.of_int 255)) 
       param_0 param).
auto .
ecall (__state_init_avx2_proof).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray1120.init_arrP BArray224.init_arrP BArray32.init_arrP).
qed.

lemma _poly_add2_proof _rp _b_rp _bp _b_bp :
      (_poly_add2_spec _rp _b_rp _bp _b_bp).
proof. 
rewrite /_poly_add2_spec .
proc; auto .
while ((valid trace__poly_add2) /\ 0<=i).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray512.init_arrP).
qed .

lemma _poly_csubq_proof _rp _b_rp : (_poly_csubq_spec _rp _b_rp).
proof.
rewrite /_poly_csubq_spec .
proc; auto .
while ((valid trace__poly_csubq) /\ 0<=i).
auto .
ecall (__csubq_proof param_0 param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray512.init_arrP).
qed .

lemma __w256_interleave_u16_proof _al _ah :
      (__w256_interleave_u16_spec _al _ah).
proof.
rewrite /__w256_interleave_u16_spec .
by proc; auto .
qed .

lemma __w256_deinterleave_u16_proof __zero _a0 _a1 :
      (__w256_deinterleave_u16_spec __zero _a0 _a1).
proof.
rewrite /__w256_deinterleave_u16_spec .
by proc; auto .
qed .

lemma __mont_red_proof _lo _hi _qx16 _qinvx16 :
      (__mont_red_spec _lo _hi _qx16 _qinvx16).
proof.
rewrite /__mont_red_spec .
by proc; auto .
qed .

lemma __wmul_16u16_proof _x _y : (__wmul_16u16_spec _x _y).
proof.
rewrite /__wmul_16u16_spec .
proc; auto .
ecall (__w256_interleave_u16_proof param_0 param).
by auto .
qed .

lemma __schoolbook16x_proof _are _aim _bre _bim _zeta _zetaqinv _qx16 _qinvx16 _sign :
      (__schoolbook16x_spec _are _aim _bre _bim _zeta _zetaqinv _qx16
      _qinvx16 _sign).
proof.
rewrite /__schoolbook16x_spec .
proc; auto .
ecall (__mont_red_proof param_24 param_23 param_22 param_21).
auto .
ecall (__mont_red_proof param_20 param_19 param_18 param_17).
auto .
ecall (__w256_deinterleave_u16_proof param_16 param_15 param_14).
auto .
ecall (__w256_deinterleave_u16_proof param_13 param_12 param_11).
auto .
ecall (__wmul_16u16_proof param_10 param_9).
  auto .
  ecall (__wmul_16u16_proof param_8 param_7).
  auto .
  ecall (__wmul_16u16_proof param_6 param_5).
  auto .
  ecall (__wmul_16u16_proof param_4 param_3).
  auto .
  ecall (__fqmulprecomp16x_proof param_2 param_1 param_0 param).
  auto .
  rewrite /is_init /valid /= .
  smt (List.all_cat).
smt(List.all_cat).
qed .

lemma _poly_basemul_proof _rp _b_rp _ap _b_ap _bp _b_bp :
      (_poly_basemul_spec _rp _b_rp _ap _b_ap _bp _b_bp).
proof. 
rewrite /_poly_basemul_spec .
proc; auto .
ecall (__schoolbook16x_proof param_70 param_69 param_68 param_67 param_66 
       param_65 param_64 param_63 param_62).
auto .
ecall (__schoolbook16x_proof param_61 param_60 param_59 param_58 param_57 
       param_56 param_55 param_54 param_53).
auto .
ecall (__schoolbook16x_proof param_52 param_51 param_50 param_49 param_48 
       param_47 param_46 param_45 param_44).
auto .
ecall (__schoolbook16x_proof param_43 param_42 param_41 param_40 param_39 
       param_38 param_37 param_36 param_35).
auto .
ecall (__schoolbook16x_proof param_34 param_33 param_32 param_31 param_30 
       param_29 param_28 param_27 param_26).
auto .
ecall (__schoolbook16x_proof param_25 param_24 param_23 param_22 param_21 
       param_20 param_19 param_18 param_17).
auto .
ecall (__schoolbook16x_proof param_16 param_15 param_14 param_13 param_12 
       param_11 param_10 param_9 param_8).
auto .
ecall (__schoolbook16x_proof param_7 param_6 param_5 param_4 param_3 
       param_2 param_1 param_0 param).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed. 

lemma _i_poly_frombytes_proof _rp _b_rp _ap _b_ap :
      (_i_poly_frombytes_spec _rp _b_rp _ap _b_ap).
proof.
rewrite /_i_poly_frombytes_spec .
proc; auto .
while ((valid trace__i_poly_frombytes) /\ BArray512.is_init b_rp 0 (256*i) /\ 0<=i /\ i<=2).
auto .
ecall (__shuffle1_proof param_22 param_21).
auto .
ecall (__shuffle1_proof param_20 param_19).
auto .
ecall (__shuffle1_proof param_18 param_17).
auto .
ecall (__shuffle2_proof param_16 param_15).
auto .
ecall (__shuffle2_proof param_14 param_13).
auto .
ecall (__shuffle2_proof param_12 param_11).
auto .
ecall (__shuffle4_proof param_10 param_9).
auto .
ecall (__shuffle4_proof param_8 param_7).
auto .
ecall (__shuffle4_proof param_6 param_5).
auto .
ecall (__shuffle8_proof param_4 param_3).
auto .
ecall (__shuffle8_proof param_2 param_1).
auto .
ecall (__shuffle8_proof param_0 param).
auto .
rewrite /is_init /valid /= => &m /> *.
split; smt (List.all_cat). 
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma _poly_frommont_proof _rp _b_rp : (_poly_frommont_spec _rp _b_rp).
proof.
rewrite /_poly_frommont_spec .
proc; auto .
while ((valid trace__poly_frommont) /\ 0<=i).
auto .
ecall (__fqmulx16_proof param_2 param_1 param_0 param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray512.init_arrP).
qed .

lemma _i_poly_frommsg_proof _rp _b_rp _ap _b_ap :
      (_i_poly_frommsg_spec _rp _b_rp _ap _b_ap).
proof.
rewrite /_i_poly_frommsg_spec .
proc; auto .
while ((valid trace__i_poly_frommsg) /\ 0<= i<=4 /\ BArray512.is_init b_rp 0 ((32 * i) * 2) /\
           (BArray512.is_init b_rp 256 ((32 * i) * 2))).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __cbd2_proof _rp _b_rp _buf _b_buf :
      (__cbd2_spec _rp _b_rp _buf _b_buf).
proof.
rewrite /__cbd2_spec .
proc; auto .
while ((valid trace___cbd2) /\ 0 <= i <= 4 /\ (BArray512.is_init b_rp 0 ((32 * i) * 4))).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __poly_cbd_eta1_proof _rp _b_rp _buf _b_buf :
      (__poly_cbd_eta1_spec _rp _b_rp _buf _b_buf).
proof.
rewrite /__poly_cbd_eta1_spec .
proc; auto .
ecall (__cbd2_proof param_0 b_param_0 param b_param).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat SBArray128_128.SBArray128_128.is_init_cell_get BArray512.init_arrP).
qed .


lemma _poly_getnoise_eta1_4x_proof _r0 _b_r0 _r1 _b_r1 _r2 _b_r2 _r3 _b_r3 _seed _b_seed _nonce :
      (_poly_getnoise_eta1_4x_spec _r0 _b_r0 _r1 _b_r1 _r2 _b_r2 _r3 
      _b_r3 _seed _b_seed _nonce).
proof.
rewrite /_poly_getnoise_eta1_4x_spec .
proc; auto .
ecall (__poly_cbd_eta1_proof param_12 b_param param_11 (BArray128.init_arr
                                                       (JWord.W8.of_int 255))).
auto .
ecall (__poly_cbd_eta1_proof param_10 b_param_0 param_9 (BArray128.init_arr
                                                        (JWord.W8.of_int 255))).
auto .
ecall (__poly_cbd_eta1_proof param_8 b_param_1 param_7 (BArray128.init_arr
                                                       (JWord.W8.of_int 255))).
auto .
ecall (__poly_cbd_eta1_proof param_6 b_param_2 param_5 (BArray128.init_arr
                                                       (JWord.W8.of_int 255))).
auto .
ecall (_shake256x4_A128__A32_A1_proof param_4 b_param_7 param_3 b_param_6 
       param_2 b_param_5 param_1 b_param_4 param_0 (BArray32.init_arr
                                                   (JWord.W8.of_int 255)) param 
       b_param_3).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray128.init_arrP BArray32.init_arrP BArray512.init_arrP).
qed .

lemma __invntt___butterfly64x_proof _rl0 _rl1 _rl2 _rl3 _rh0 _rh1 _rh2 _rh3 _zl0 _zl1 _zh0 _zh1 _qx16 :
      (__invntt___butterfly64x_spec _rl0 _rl1 _rl2 _rl3 _rh0 _rh1 _rh2 
      _rh3 _zl0 _zl1 _zh0 _zh1 _qx16).
proof.
rewrite /__invntt___butterfly64x_spec .
by proc; auto .
qed .

lemma _poly_invntt_proof _rp _b_rp : (_poly_invntt_spec _rp _b_rp).
proof.
rewrite /_poly_invntt_spec .
proc; auto .
while ((valid trace__poly_invntt) /\ 0<=i /\ b_r6 /\ b_r4 /\ b_r2 /\ b_r0).
auto .
ecall (__fqmulprecomp16x_proof param_161 param_160 param_159 param_158).
auto .
ecall (__fqmulprecomp16x_proof param_157 param_156 param_155 param_154).
auto .
ecall (__fqmulprecomp16x_proof param_153 param_152 param_151 param_150).
auto .
ecall (__fqmulprecomp16x_proof param_149 param_148 param_147 param_146).
auto .
ecall (__invntt___butterfly64x_proof param_145 param_144 param_143 param_142 
       param_141 param_140 param_139 param_138 param_137 param_136 param_135 
       param_134 param_133).
auto .  have h: forall k, (0<=k < 2 /\ k<>0) =>  k = 1. smt().
rewrite /is_init /valid /= => &m /> ? . move => i0 _ _ _ _ i2. split; move => *;rewrite !List.all_cat /=. smt(). rewrite( h (i{m})); by auto. 
auto .
while ((valid trace__poly_invntt) /\ 0<= i /\ ((2<=i) ? ((b_r6 /\ b_r4) /\ b_r2 /\ b_r0) : true)).
auto .
ecall (__red16x_proof param_132 param_131 param_130).
auto .
ecall (__invntt___butterfly64x_proof param_129 param_128 param_127 param_126 
       param_125 param_124 param_123 param_122 param_121 param_120 param_119 
       param_118 param_117).
auto .
ecall (__shuffle8_proof param_116 param_115).
auto .
ecall (__shuffle8_proof param_114 param_113).
auto .
ecall (__shuffle8_proof param_112 param_111).
auto .
ecall (__shuffle8_proof param_110 param_109).
auto .
ecall (__red16x_proof param_108 param_107 param_106).
auto .
ecall (__invntt___butterfly64x_proof param_105 param_104 param_103 param_102 
       param_101 param_100 param_99 param_98 param_97 param_96 param_95 
       param_94 param_93).
auto .
ecall (__shuffle4_proof param_92 param_91).
auto .
ecall (__shuffle4_proof param_90 param_89).
auto .
ecall (__shuffle4_proof param_88 param_87).
auto .
ecall (__shuffle4_proof param_86 param_85).
auto .
ecall (__red16x_proof param_84 param_83 param_82).
auto .
ecall (__invntt___butterfly64x_proof param_81 param_80 param_79 param_78 
       param_77 param_76 param_75 param_74 param_73 param_72 param_71 
       param_70 param_69).
auto .
ecall (__shuffle2_proof param_68 param_67).
auto .
ecall (__shuffle2_proof param_66 param_65).
auto .
ecall (__shuffle2_proof param_64 param_63).
auto .
ecall (__shuffle2_proof param_62 param_61).
auto .
ecall (__red16x_proof param_60 param_59 param_58).
auto .
ecall (__invntt___butterfly64x_proof param_57 param_56 param_55 param_54 
       param_53 param_52 param_51 param_50 param_49 param_48 param_47 
       param_46 param_45).
auto .
ecall (__shuffle1_proof param_44 param_43).
auto .
ecall (__shuffle1_proof param_42 param_41).
auto .
ecall (__shuffle1_proof param_40 param_39).
auto .
ecall (__shuffle1_proof param_38 param_37).
auto .
ecall (__invntt___butterfly64x_proof param_36 param_35 param_34 param_33 
       param_32 param_31 param_30 param_29 param_28 param_27 param_26 
       param_25 param_24).
auto .
ecall (__red16x_proof param_23 param_22 param_21).
auto .
ecall (__red16x_proof param_20 param_19 param_18).
auto .
ecall (__red16x_proof param_17 param_16 param_15).
auto .
ecall (__red16x_proof param_14 param_13 param_12).
auto .
ecall (__invntt___butterfly64x_proof param_11 param_10 param_9 param_8 
       param_7 param_6 param_5 param_4 param_3 param_2 param_1 param_0 
       param).
auto .
rewrite /is_init /valid /= => &m /> *. split; move => *; rewrite !List.all_cat /=. smt(). smt().
auto .
rewrite /is_init /valid /= => &m /> *. split. smt(). 
smt (BArray512.init_arrP).
qed .

lemma __butterfly64x_proof _rl0 _rl1 _rl2 _rl3 _rh0 _rh1 _rh2 _rh3 _zl0 _zl1 _zh0 _zh1 _qx16 :
      (__butterfly64x_spec _rl0 _rl1 _rl2 _rl3 _rh0 _rh1 _rh2 _rh3 _zl0 
      _zl1 _zh0 _zh1 _qx16).
proof.
rewrite /__butterfly64x_spec .
by proc; auto .
qed .

lemma _poly_ntt_proof _rp _b_rp : (_poly_ntt_spec _rp _b_rp).
proof.
rewrite /_poly_ntt_spec .
proc; auto .
while ((valid trace__poly_ntt) /\ 0<=i).
auto .
ecall (__red16x_proof param_158 param_157 param_156).
auto .
ecall (__red16x_proof param_155 param_154 param_153).
auto .
ecall (__red16x_proof param_152 param_151 param_150).
auto .
ecall (__red16x_proof param_149 param_148 param_147).
auto .
ecall (__red16x_proof param_146 param_145 param_144).
auto .
ecall (__red16x_proof param_143 param_142 param_141).
auto .
ecall (__red16x_proof param_140 param_139 param_138).
auto .
ecall (__red16x_proof param_137 param_136 param_135).
auto .
ecall (__butterfly64x_proof param_134 param_133 param_132 param_131 param_130 
       param_129 param_128 param_127 param_126 param_125 param_124 param_123 
       param_122).
auto .
ecall (__butterfly64x_proof param_121 param_120 param_119 param_118 param_117 
       param_116 param_115 param_114 param_113 param_112 param_111 param_110 
       param_109).
auto .
ecall (__shuffle1_proof param_108 param_107).
auto .
ecall (__shuffle1_proof param_106 param_105).
auto .
ecall (__shuffle1_proof param_104 param_103).
auto .
ecall (__shuffle1_proof param_102 param_101).
auto .
ecall (__butterfly64x_proof param_100 param_99 param_98 param_97 param_96 
       param_95 param_94 param_93 param_92 param_91 param_90 param_89 
       param_88).
auto .
ecall (__shuffle2_proof param_87 param_86).
auto .
ecall (__shuffle2_proof param_85 param_84).
auto .
ecall (__shuffle2_proof param_83 param_82).
auto .
ecall (__shuffle2_proof param_81 param_80).
auto .
ecall (__butterfly64x_proof param_79 param_78 param_77 param_76 param_75 
       param_74 param_73 param_72 param_71 param_70 param_69 param_68 
       param_67).
auto .
ecall (__shuffle4_proof param_66 param_65).
auto .
ecall (__shuffle4_proof param_64 param_63).
auto .
ecall (__shuffle4_proof param_62 param_61).
auto .
ecall (__shuffle4_proof param_60 param_59).
auto .
ecall (__butterfly64x_proof param_58 param_57 param_56 param_55 param_54 
       param_53 param_52 param_51 param_50 param_49 param_48 param_47 
       param_46).
auto .
ecall (__shuffle8_proof param_45 param_44).
auto .
ecall (__shuffle8_proof param_43 param_42).
auto .
ecall (__shuffle8_proof param_41 param_40).
auto .
ecall (__shuffle8_proof param_39 param_38).
auto .
ecall (__butterfly64x_proof param_37 param_36 param_35 param_34 param_33 
       param_32 param_31 param_30 param_29 param_28 param_27 param_26 
       param_25).
auto .
rewrite /is_init /valid /= => &m /> *. split. move => *.  rewrite !List.all_cat /=. smt().
move => *. rewrite !List.all_cat /=. have -> :i{m} = 1. smt(). rewrite /=. smt().
auto .
ecall (__butterfly64x_proof param_24 param_23 param_22 param_21 param_20 
       param_19 param_18 param_17 param_16 param_15 param_14 param_13 
       param_12).
auto .
ecall (__butterfly64x_proof param_11 param_10 param_9 param_8 param_7 
       param_6 param_5 param_4 param_3 param_2 param_1 param_0 param).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray512.init_arrP).
qed .

lemma __poly_reduce_proof _rp _b_rp : (__poly_reduce_spec _rp _b_rp).
proof.
rewrite /__poly_reduce_spec .
proc; auto .
while ((valid trace___poly_reduce) /\ 0<=i).
auto .
ecall (__red16x_proof param_1 param_0 param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray512.init_arrP).
qed .

lemma _poly_sub_proof _rp _b_rp _ap _b_ap _bp _b_bp :
      (_poly_sub_spec _rp _b_rp _ap _b_ap _bp _b_bp).
proof.
rewrite /_poly_sub_spec .
proc; auto .
while ((valid trace__poly_sub) /\ 0<=i /\ BArray512.is_init b_rp 0 (32*i)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma _i_poly_tobytes_proof _rp _b_rp _a _b_a :
      (_i_poly_tobytes_spec _rp _b_rp _a _b_a).
proof.
rewrite /_i_poly_tobytes_spec .
proc; auto .
while ((valid trace__i_poly_tobytes) /\ 0 <= i /\ i<=2 /\ BArray384.is_init b_rp 0 (i*192)).
auto .
ecall (__shuffle8_proof param_23 param_22).
auto .
ecall (__shuffle8_proof param_21 param_20).
auto .
ecall (__shuffle8_proof param_19 param_18).
auto .
ecall (__shuffle4_proof param_17 param_16).
auto .
ecall (__shuffle4_proof param_15 param_14).
auto .
ecall (__shuffle4_proof param_13 param_12).
auto .
ecall (__shuffle2_proof param_11 param_10).
auto .
ecall (__shuffle2_proof param_9 param_8).
auto .
ecall (__shuffle2_proof param_7 param_6).
auto .
ecall (__shuffle1_proof param_5 param_4).
auto .
ecall (__shuffle1_proof param_3 param_2).
auto .
ecall (__shuffle1_proof param_1 param_0).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat).
auto .
ecall (_poly_csubq_proof param (BArray512.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /=  => &m /> *.
smt (List.all_cat BArray512.init_arrP).
qed .

lemma _i_poly_tomsg_proof _rp _b_rp _a _b_a :
      (_i_poly_tomsg_spec _rp _b_rp _a _b_a).
proof.
rewrite /_i_poly_tomsg_spec .
proc; auto .
while ((valid trace__i_poly_tomsg) /\ 0<=i /\ i<=8 /\ BArray32.is_init b_rp 0 (4*i)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (_poly_csubq_proof param (BArray512.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray512.init_arrP).
qed .

lemma _i_poly_compress_proof _rp _b_rp _a _b_a :
      (_i_poly_compress_spec _rp _b_rp _a _b_a).
proof.
rewrite /_i_poly_compress_spec .
proc; auto .
while ((valid trace__i_poly_compress) /\ 0<=i <=8 /\ BArray128.is_init b_rp 0 (i*32)).
auto .
rewrite /is_init /valid /= => &m /> *. split. smt(List.all_cat).
smt (List.all_cat).
auto .
ecall (_poly_csubq_proof param (BArray512.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray512.init_arrP).
qed .

lemma _i_poly_decompress_proof _rp _b_rp _a _b_a :
      (_i_poly_decompress_spec _rp _b_rp _a _b_a).
proof.
rewrite /_i_poly_decompress_spec .
proc; auto .
while ((valid trace__i_poly_decompress) /\ 0<=i /\ i<= 16 /\ BArray512.is_init b_rp 0 (i*32)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= => &m /> *.
smt ().
qed .




lemma __polyvec_add2_proof _r _b_r _b _b_b :
      (__polyvec_add2_spec _r _b_r _b _b_b).
proof.
rewrite /__polyvec_add2_spec .
proc; auto .
while ((valid trace___polyvec_add2) /\ 0<=i /\ BArray1536.is_init b_r 0 1536 /\ BArray1536.is_init b_b 0 1536).
auto .
ecall (_poly_add2_proof param_0 b_param_0 param b_param).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat SBArray1536_512.SBArray1536_512.is_init_cell_get SBArray1536_512.SBArray1536_512.is_init_cell_set BArray512.init_arrP).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray1536.init_arrP).
qed .

lemma __polyvec_csubq_proof _r _b_r : (__polyvec_csubq_spec _r _b_r).
proof.
rewrite /__polyvec_csubq_spec .
proc; auto .
  while ((valid trace___polyvec_csubq) /\ 0<=i /\ BArray1536.is_init b_r 0 1536).
auto .
ecall (_poly_csubq_proof param b_param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat SBArray1536_512.SBArray1536_512.is_init_cell_set SBArray1536_512.SBArray1536_512.is_init_cell_get BArray512.init_arrP).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray1536.init_arrP).
qed .

lemma __polyvec_invntt_proof _r _b_r : (__polyvec_invntt_spec _r _b_r).
proof.
rewrite /__polyvec_invntt_spec .
proc; auto .
while ((valid trace___polyvec_invntt) /\ 0<=i /\ BArray1536.is_init b_r 0 1536).
auto .
ecall (_poly_invntt_proof param b_param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat  SBArray1536_512.SBArray1536_512.is_init_cell_set SBArray1536_512.SBArray1536_512.is_init_cell_get BArray512.init_arrP).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray1536.init_arrP).
qed .

lemma __polyvec_ntt_proof _r _b_r : (__polyvec_ntt_spec _r _b_r).
proof.
rewrite /__polyvec_ntt_spec .
proc; auto .
while ((valid trace___polyvec_ntt) /\ 0<=i /\ BArray1536.is_init b_r 0 1536).
auto .
ecall (_poly_ntt_proof param b_param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat  SBArray1536_512.SBArray1536_512.is_init_cell_set SBArray1536_512.SBArray1536_512.is_init_cell_get BArray512.init_arrP).
auto .
rewrite /is_init /valid /= . 
smt (List.all_cat BArray1536.init_arrP).
qed .

lemma __polyvec_reduce_proof _r _b_r : (__polyvec_reduce_spec _r _b_r).
proof.
rewrite /__polyvec_reduce_spec .
proc; auto .
while ((valid trace___polyvec_reduce) /\  0<=i /\ BArray1536.is_init b_r 0 1536).
auto .
ecall (__poly_reduce_proof param b_param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat SBArray1536_512.SBArray1536_512.is_init_cell_set SBArray1536_512.SBArray1536_512.is_init_cell_get BArray512.init_arrP).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray1536.init_arrP).
qed .

lemma __i_polyvec_frombytes_proof _a _b_a :
      (__i_polyvec_frombytes_spec _a _b_a).
proof.
rewrite /__i_polyvec_frombytes_spec .
proc; auto .
while ((valid trace___i_polyvec_frombytes) /\ 0<=i /\ i<=4 /\ BArray1536.is_init b_r 0 (i*512) /\ BArray1152.is_init b_a 0 1152).
auto .
ecall (_i_poly_frombytes_proof param_0 b_param_0 param b_param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat SBArray1536_512.SBArray1536_512.is_init_cell_set BArray1536.init_arrP BArray512.init_arrP SBArray1152_384.SBArray1152_384.is_init_cell_get).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __i_polyvec_tobytes_proof _r _b_r _a _b_a :
      (__i_polyvec_tobytes_spec _r _b_r _a _b_a).
proof.
rewrite /__i_polyvec_tobytes_spec .
proc; auto .
while ((valid trace___i_polyvec_tobytes) /\ 0<=i /\ i<=4 /\ BArray1152.is_init b_r 0 (i*384) /\ BArray1536.is_init b_a 0 1536).
auto .
ecall (_i_poly_tobytes_proof param_0 b_param_0 param b_param).
auto .
rewrite /is_init /valid /= => &m /> *.
split.  smt(SBArray1536_512.SBArray1536_512.is_init_cell_get). 
move => *. split.  smt(List.all_cat).
move => *. split.  smt().
  split.  smt().
  smt ( SBArray1536_512.SBArray1536_512.is_init_cell_set  SBArray1152_384.SBArray1152_384.is_init_cell_set BArray512.init_arrP BArray384.init_arrP).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __polyvec_pointwise_acc_proof _r _b_r _a _b_a _b _b_b :
      (__polyvec_pointwise_acc_spec _r _b_r _a _b_a _b _b_b).
proof.
rewrite /__polyvec_pointwise_acc_spec .
proc; auto .
while ((valid trace___polyvec_pointwise_acc) /\  0<=i /\ BArray1536.is_init b_a 0 1536 /\ BArray1536.is_init b_b 0 1536 ).
auto .
ecall (_poly_add2_proof param_6 (BArray512.init_arr (JWord.W8.of_int 255)) 
       param_5 (BArray512.init_arr (JWord.W8.of_int 255))).
auto .
ecall (_poly_basemul_proof param_4 b_param_1 param_3 b_param_0 param_2 
       b_param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat BArray512.init_arrP SBArray1536_512.SBArray1536_512.is_init_cell_get SBArray1536_512.SBArray1536_512.is_init_cell_set ).
auto .
ecall (_poly_basemul_proof param_1 b_param_4 param_0 b_param_3 param 
       b_param_2).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat  BArray512.init_arrP SBArray1536_512.SBArray1536_512.is_init_cell_get SBArray1536_512.SBArray1536_512.is_init_cell_set).
qed .

lemma __i_polyvec_decompress_proof  _rp _b_rp :
      (__i_polyvec_decompress_spec  _rp _b_rp).
proof.
rewrite /__i_polyvec_decompress_spec .
proc; auto .
while ((valid trace___i_polyvec_decompress) /\ 0<=k /\ k<=3 /\ BArray1536.is_init b_r 0 (k*512)).
auto .
while ((valid trace___i_polyvec_decompress) /\  0<=i /\ i<=16 /\ 0<=k /\ k<3 /\ BArray1536.is_init b_r 0 (32*(16*k + i))).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __i_polyvec_compress_proof _rp _b_rp _a _b_a :
      (__i_polyvec_compress_spec _rp _b_rp _a _b_a).
proof.
rewrite /__i_polyvec_compress_spec .
proc; auto .
while ((valid trace___i_polyvec_compress) /\  0<=i /\ i<=48 /\ (i<> 0 => BArray960.is_init b_rp 0 (i*20))).
auto .
rewrite /is_init /valid /= => &m /> *. split. smt(List.all_cat). 
smt (List.all_cat).
auto .
ecall (__polyvec_csubq_proof param (BArray1536.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray1536.init_arrP).
qed .

import JWord JUtils.

lemma __gen_matrix_buf_rejection_filter48_proof _pol _b_pol _counter _buf _b_buf _buf_offset _load_shuffle _mask _bounds _sst _b_sst _ones _ms :
      (__gen_matrix_buf_rejection_filter48_spec _pol _b_pol _counter 
      _buf _b_buf _buf_offset _load_shuffle _mask _bounds _sst _b_sst 
      _ones _ms).
proof.
rewrite /__gen_matrix_buf_rejection_filter48_spec .
proc. 
auto => /> *.
have H : forall w,0<= count idfun (W64.w2bits (W64.of_int (W64.to_uint w %% 256))) <= 8.
+ move => w; rewrite count_ge0 /=.
  rewrite w2bitsE (: 64 = 8 + 56) 1://  mkseq_add // count_cat /=.
  have  ->/= : count idfun (mkseq (fun (i : int) => (W64.of_int (to_uint w %% 256)).[8 + i]) 56) = 0 ; last  by smt(size_mkseq count_ge0 count_size).
  rewrite /mkseq count_map /preim /idfun /=;apply count_pred0_eq_in => x; rewrite mem_iota  /= => *.
  rewrite get_to_uint /= (: (0 <= 8 + x < 64)) 1:/# /=.
  rewrite of_uintK /= (modz_small _ 18446744073709551616); 1:smt().
  have /= ? : 2^8 <=  2 ^ (8 + x) <= 2^64; last by smt().
  split; 1: by  apply StdOrder.IntOrder.ler_weexpn2l; smt(). 
  move => ?. 
  by have  := StdOrder.IntOrder.ler_weexpn2l 2 _ (8+x) 64 _;  smt(). 

pose w := ((Jslh.SLH64.protect_64 _)).
have H255 : 255 = 2^8 - 1 by auto.
rewrite H255 !and_mod //=.
rewrite / POPCNT_64 /rflags_of_popcnt /flags_w /=.  
pose c1 := to_uint (W64.of_int (count idfun (w2bits (W64.of_int (to_uint (w _ms `>>` W8.of_int 8) %% 256))))).
pose c2 := to_uint (W64.of_int (count idfun (w2bits (W64.of_int (to_uint (w _ms `>>` W8.of_int 16) %% 256))))).
pose c3 := to_uint (W64.of_int (count idfun (w2bits (W64.of_int (to_uint (w _ms `>>` W8.of_int 24) %% 256))))).
pose c4 := to_uint(W64.of_int (count idfun (w2bits (W64.of_int (to_uint (w _ms) %% 256))))).
have h : forall w, 0 <=to_uint(W64.of_int (count idfun (w2bits (W64.of_int (W64.to_uint (w) %% 256))))) <=8. move => ?. rewrite !to_uintK_small; smt().
(*
rewrite !to_uintM_small => /=;1..4:smt(W64.of_uintK pow2_64 modz_small).
rewrite !W64.to_uintD_small /=;1..15:
 smt(W64.of_uintK pow2_64 modz_small).
do split; 1,2,4..20:smt(W64.of_uintK pow2_64 modz_small);
  last by  smt(W64.of_uintK pow2_64 modz_small).
rewrite and_iota => k kb /=. *) admit.
qed.

lemma __write_u128_boundchk_proof _pol _b_pol _ctr _data _ms :
      (__write_u128_boundchk_spec _pol _b_pol _ctr _data _ms).
proof.
rewrite /__write_u128_boundchk_spec .
  proc. sp 3.
  if. auto.  move => &m /> ?. rewrite  W64.uleE /=. rewrite /is_init /= => *. smt(W64.to_uint_cmp).
  admit. (* assert false - fix compiler *)
qed .

lemma __gen_matrix_buf_rejection_filter24_proof _pol _b_pol _counter _buf _b_buf _buf_offset _load_shuffle _mask _bounds _sst _b_sst _ones _ms :
      (__gen_matrix_buf_rejection_filter24_spec _pol _b_pol _counter 
      _buf _b_buf _buf_offset _load_shuffle _mask _bounds _sst _b_sst 
      _ones _ms).
proof.
rewrite /__gen_matrix_buf_rejection_filter24_spec .
  proc. auto. ecall (__write_u128_boundchk_proof param_2 b_param param_1 param_0 param). auto.
  ecall (__write_u128_boundchk_proof param_6 b_param_0 param_5 param_4 param_3). auto. rewrite /valid  => /> . 
  have H : forall w,0<= count idfun (W64.w2bits (W64.of_int (W64.to_uint w %% 256))) <= 8.
+ move => w; rewrite count_ge0 /=. 
  rewrite w2bitsE (: 64 = 8 + 56) 1://  mkseq_add // count_cat /=.
  have  ->/= : count idfun (mkseq (fun (i : int) => (W64.of_int (to_uint w %% 256)).[8 + i]) 56) = 0 ; last  by smt(size_mkseq count_ge0 count_size).
  rewrite /mkseq count_map /preim /idfun /=;apply count_pred0_eq_in => x; rewrite mem_iota  /= => *.
  rewrite get_to_uint /= (: (0 <= 8 + x < 64)) 1:/# /=.
  rewrite of_uintK /= (modz_small _ 18446744073709551616); 1:smt().
  have /= ? : 2^8 <=  2 ^ (8 + x) <= 2^64; last by smt().
  split; 1: by  apply StdOrder.IntOrder.ler_weexpn2l; smt(). 
  move => ?.  by have  := StdOrder.IntOrder.ler_weexpn2l 2 _ (8+x) 64 _;  smt(). 
  have H' : forall w',0<= count idfun (W64.w2bits (W64.of_int (W32.to_uint w' %% 256))) <= 8.
  + move => w'; rewrite count_ge0 /=.   rewrite w2bitsE (: 64 = 8 + 56) 1://  mkseq_add // count_cat /=.    have  ->/= : count idfun (mkseq (fun (i : int) => (W64.of_int (to_uint w' %% 256)).[8 + i]) 56) = 0 ; last  by smt(size_mkseq count_ge0 count_size).
  rewrite /mkseq count_map /preim /idfun /=;apply count_pred0_eq_in => x; rewrite mem_iota  /= => *.
  rewrite get_to_uint /= (: (0 <= 8 + x < 64)) 1:/# /=.
  rewrite of_uintK /= (modz_small _ 18446744073709551616); 1:smt().
  have /= ? : 2^8 <=  2 ^ (8 + x) <= 2^64; last by smt().
  split; 1: by  apply StdOrder.IntOrder.ler_weexpn2l; smt(). 
  move => ?.  by have  := StdOrder.IntOrder.ler_weexpn2l 2 _ (8+x) 64 _;  smt(). 
  pose w := ((Jslh.SLH64.protect_64 _)). 
  have H255 : 255 = 2^8 - 1 by auto.
  rewrite H255 !and_mod //=.
  rewrite / POPCNT_64 /rflags_of_popcnt /flags_w /=. (*  rewrite uleE /=.*)  have h: W32.modulus < 18446744073709551616. by auto.
  pose c1 := to_uint (W64.of_int (count idfun (w2bits (W64.of_int (to_uint (w _ms) %% 256))))).
  move => 5? i1 2?.
  have h2 : forall w, 0 <=to_uint(W64.of_int (count idfun (w2bits (W64.of_int (W64.to_uint (w) %% 256))))) <=8. move => ?. rewrite !to_uintK_small; smt().
  admit. (*rewrite !to_uintD_small !to_uintK_small /=;1..23: smt(W32.to_uint_cmp).
  pose c2 := count idfun
            (w2bits
               (W64.of_int
                  (to_uint
                     (MOVEMASK_32u8
                        (VPACKSS_16u16
                           (VPCMPGT_16u16 _bounds
                              (VPBLENDW_256
                                 (VPSHUFB_256
                                    (VPERMQ
                                       (get256d _buf (to_uint _buf_offset))
                                       (W8.of_int 148)) _load_shuffle)
                                 (VPSRL_16u16
                                    (VPSHUFB_256
                                       (VPERMQ
                                          (get256d _buf (to_uint _buf_offset))
                                          (W8.of_int 148)) _load_shuffle)
                                    (W128.of_int 4)) (W8.of_int 170) `&`
                               _mask)) W256.zero)) %%
                   256))).
  pose c3 := count idfun (w2bits (W64.of_int (to_uint (w _ms `>>` W8.of_int 16) %% 256))). move => i2 *.
  split. split. smt().
  + move: i1 i2. rewrite !and_iota /=.
  move => i1 i2 k ?. have := i1 k _. by auto. have := i2 k _. by auto. smt(). 
  smt(W32.to_uint_cmp all_cat). *)
qed.

lemma _gen_matrix_buf_rejection_proof _pol _b_pol _counter _buf _b_buf _buf_offset :
      (_gen_matrix_buf_rejection_spec _pol _b_pol _counter _buf _b_buf
      _buf_offset).
proof.
  rewrite /_gen_matrix_buf_rejection_spec .
  proc; auto .
  while ((valid trace__gen_matrix_buf_rejection) /\ 0<= JWord.W64.to_uint counter /\ BArray512.is_init b_pol 0 (2*  JWord.W64.to_uint counter ) /\
         (condition_loop => ( JWord.W64.to_uint  buf_offset < 481)) /\
            JWord.W64.to_uint _counter <=  JWord.W64.to_uint counter) .
  + auto. sp. if .
    + auto .
      ecall (__gen_matrix_buf_rejection_filter24_proof param_18 b_param param_17 
       param_16 (BArray536.init_arr (JWord.W8.of_int 255)) param_15 param_14 
       param_13 param_12 param_11 (BArray2048.init_arr (JWord.W8.of_int 255)) 
       param_10 param_9).
      auto .
      rewrite /is_init /valid /= => &m /> 7?. rewrite JWord.W64.ultE /= => *.
      split. move => *. smt(JWord.W64.to_uint_cmp  BArray2048.init_arrP BArray536.init_arrP).  move => /> 7?.
      rewrite /protect_64 !JWord.W64.uleE !JWord.W64.ultE !JWord.W64.to_uintD_small /=. smt(). smt(List.all_cat  JWord.W64.to_uint_cmp).
    by auto.
  wp.
  while ((valid trace__gen_matrix_buf_rejection) /\ 0<= JWord.W64.to_uint counter /\ JWord.W64.to_uint counter <= 256 /\
         JWord.W64.to_uint _counter <= JWord.W64.to_uint counter /\ BArray512.is_init b_pol 0 (2*  JWord.W64.to_uint counter ) /\
         (JWord.W64.to_uint counter < 225 => saved_buf_offset = buf_offset) /\
         (condition_loop => (JWord.W64.to_uint  buf_offset < 457))).
  + auto . sp. if.
    + auto .
      ecall (__gen_matrix_buf_rejection_filter48_proof param_8 b_param_0 param_7 
         param_6 (BArray536.init_arr (JWord.W8.of_int 255)) param_5 param_4 param_3 
         param_2 param_1 (BArray2048.init_arr (JWord.W8.of_int 255)) param_0 
         param). auto. rewrite /is_init /valid /= => &m /> 7?. rewrite JWord.W64.ultE /= => *.
      split. smt(JWord.W64.to_uint_cmp BArray536.init_arrP BArray2048.init_arrP). move => /> *.
      rewrite !JWord.W64.ultE !JWord.W64.to_uintD_small /=. smt(). split. smt(List.all_cat).
      split. smt(JWord.W64.to_uint_cmp).  smt(JWord.W64.to_uint_cmp).
    auto. rewrite /is_init /valid /= => &m /> 8?. rewrite JWord.W64.ultE /= => *. smt().
  auto. 
  rewrite /is_init /valid /= => &m /> *. split. rewrite !JWord.W64.ultE /=. smt(). move => *.
  split.  rewrite !JWord.W64.ultE /=. smt(). move => *. rewrite JWord.W64.uleE /=. smt().
qed .


lemma gen_matrix_get_indexes_proof _b __t :
      (gen_matrix_get_indexes_spec _b __t).
proof.
rewrite /gen_matrix_get_indexes_spec .
proc; auto .
rewrite /is_init /valid /= => &m /> . rewrite !JWord.W64.uleE /= => *. smt().
qed .

lemma __gen_matrix_fill_polynomial_proof _pol _b_pol _buf _b_buf :
      (__gen_matrix_fill_polynomial_spec _pol _b_pol _buf _b_buf).
proof.
  rewrite /__gen_matrix_fill_polynomial_spec .
  proc; auto .
  while ((valid trace___gen_matrix_fill_polynomial) /\ 0 <=JWord.W64.to_uint counter /\ JWord.W64.to_uint buf_offset = 2*168  /\ BArray512.is_init b_pol 0 (JWord.W64.to_uint counter*2) /\ BArray536.is_init b_buf 0 536).
  + auto .
    ecall (_gen_matrix_buf_rejection_proof param_7 b_param param_6 param_5 
       (BArray536.init_arr (JWord.W8.of_int 255)) param_4).
    auto .
    ecall (_shake128_next_state_proof param_3 (BArray536.init_arr (JWord.W8.of_int 255))).
    auto .
    rewrite /is_init /valid /= => &m /> . rewrite !JWord.W64.ultE !JWord.W64.to_uintK_small /=. smt(). move => *.
    split.  smt(BArray536.init_arrP JWord.W64.to_uint_cmp). move => *. split. smt(). move => 4? .
    rewrite !JWord.W64.uleE /= =>? h *. rewrite !List.all_cat /=. smt().
  auto .
  ecall (_gen_matrix_buf_rejection_proof param_2 b_param_0 param_1 param_0 
       (BArray536.init_arr (JWord.W8.of_int 255)) param).
  auto .
  rewrite /is_init /valid /= => &m /> *. split. smt(BArray536.init_arrP). move => 3?.
  rewrite JWord.W64.uleE /= => *. split. smt(List.all_cat).  move => 3?. rewrite JWord.W64.ultE /=. smt ().
qed .

lemma _gen_matrix_sample_four_polynomials_proof _polx4 _b_polx4 _buf _b_buf _rho _b_rho _pos_entry _transposed :
      (_gen_matrix_sample_four_polynomials_spec _polx4 _b_polx4 _buf 
      _b_buf _rho _b_rho _pos_entry _transposed).
proof.
rewrite /_gen_matrix_sample_four_polynomials_spec .
proc; auto .
ecall (__gen_matrix_fill_polynomial_proof param_13 b_param_0 param_12 b_param).
auto .
ecall (__gen_matrix_fill_polynomial_proof param_11 b_param_2 param_10 
       b_param_1).
auto .
ecall (__gen_matrix_fill_polynomial_proof param_9 b_param_4 param_8 b_param_3).
auto .
ecall (__gen_matrix_fill_polynomial_proof param_7 b_param_6 param_6 b_param_5).
auto .
ecall (_shake128x4_squeeze3blocks_proof param_5 (BArray800.init_arr
                                                (JWord.W8.of_int 255)) param_4 
       b_param_7).
auto .
ecall (_shake128x4_absorb_A32_A2_proof param_3 b_param_9 param_2 (
                                                                 BArray32.init_arr
                                                                 (JWord.W8.of_int
                                                                 255)) 
       param_1 b_param_8).
auto .
ecall (gen_matrix_get_indexes_proof param_0 param).
auto .
rewrite /is_init /valid /= => &m /> *.
split. smt(BArray32.init_arrP). move => /> *. 
split. smt(BArray800.init_arrP). move => /> *. split. smt(SBArray2144_536.SBArray2144_536.is_init_cell_get BArray2144.init_arrP). move => /> *.
split. smt(SBArray2144_536.SBArray2144_536.is_init_cell_set SBArray2144_536.SBArray2144_536.is_init_cell_get BArray2144.init_arrP BArray536.init_arrP).
move => /> *. split.  smt(SBArray2144_536.SBArray2144_536.is_init_cell_set SBArray2144_536.SBArray2144_536.is_init_cell_get BArray536.init_arrP BArray2144.init_arrP).
move => /> *. split. smt(SBArray2144_536.SBArray2144_536.is_init_cell_set SBArray2144_536.SBArray2144_536.is_init_cell_get BArray536.init_arrP BArray2144.init_arrP).
move => /> *.  split. smt(SBArray2048_512.SBArray2048_512.is_init_cell_set BArray512.init_arrP). move => /> *. 
 smt(List.all_cat).
qed .


lemma __gen_matrix_sample_one_polynomial_proof _pol _b_pol _buf _b_buf _rho _b_rho _rc :
      (__gen_matrix_sample_one_polynomial_spec _pol _b_pol _buf _b_buf 
      _rho _b_rho _rc).
proof.
rewrite /__gen_matrix_sample_one_polynomial_spec .
proc; auto .
ecall (__gen_matrix_fill_polynomial_proof param_4 b_param param_3 (
                                                                  BArray536.init_arr
                                                                  (W8.of_int
                                                                  255))).
auto .
ecall (_shake128_squeeze3blocks_proof param_2 b_param_0 param_1 (
                                                                BArray224.init_arr
                                                                (W8.of_int
                                                                255))).
auto .
ecall (_shake128_absorb_A32_A2_proof param_0 (BArray32.init_arr
                                             (W8.of_int 255)) param b_param_1).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray32.init_arrP BArray224.init_arrP BArray536.init_arrP BArray512.init_arrP List.all_cat).
qed. 





lemma _gen_matrix_avx2_proof _matrix _b_matrix _rho _b_rho _transposed :
      (_gen_matrix_avx2_spec _matrix _b_matrix _rho _b_rho _transposed).
proof.
rewrite /_gen_matrix_avx2_spec .
proc; auto .
while ((valid trace__gen_matrix_avx2) /\ 0<= i /\ BArray4608.is_init b_matrix 0 4608).
auto .
while ((valid trace__gen_matrix_avx2) /\  0<=i /\ i<3 /\ 0<= j /\ BArray4608.is_init b_matrix 0 4608).
auto .
ecall (_nttunpack_proof param_8 b_param).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat SBArray4608_512.SBArray4608_512.is_init_cell_set  SBArray4608_512.SBArray4608_512.is_init_cell_get BArray512.init_arrP).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat).
  auto .
ecall(__gen_matrix_sample_one_polynomial_proof param_7 b_param_1 param_6 b_param_0 param_5 (BArray32.init_arr (W8.of_int 255)) param_4). auto.
while ((valid trace__gen_matrix_avx2) /\  BArray4608.is_init b_matrix 0 (i*4*256*2) /\ 0<=i /\ i<=2 /\ 0<= JWord.W64.to_uint transposed /\ JWord.W64.to_uint transposed <=1).
auto .
ecall (_gen_matrix_sample_four_polynomials_proof param_3 b_param_3 param_2 
       b_param_2 param_1 (BArray32.init_arr (JWord.W8.of_int 255)) param_0 
       param).
auto .
rewrite /is_init /valid /= => &m /> *.
  split. rewrite !JWord.W64.uleE /= !JWord.W64.to_uintD_small JWord.W64.to_uint_shl /=. by auto.
  + rewrite !JWord.W64.to_uintK_small /=; smt(BArray32.init_arrP). by auto. rewrite !JWord.W64.to_uintK_small /=; smt(BArray32.init_arrP).   move => *.
  smt(List.all_cat SBArray4608_2048.SBArray4608_2048.is_init_cell_set BArray2048.init_arrP).
auto. rewrite /is_init /valid /= => &m /> ?. rewrite !JWord.W64.uleE JWord.W64.to_uintK_small /=. by auto. 
move => *. split.  smt().  move => *.  split.  smt(BArray32.init_arrP ).  move => *. smt(List.all_cat BArray512.init_arrP SBArray4608_512.SBArray4608_512.is_init_cell_set).
qed .

lemma __indcpa_keypair_proof _pk _b_pk _sk _b_sk _randomnessp _b_randomnessp :
      (__indcpa_keypair_spec _pk _b_pk _sk _b_sk _randomnessp _b_randomnessp).
proof.
rewrite /__indcpa_keypair_spec .
proc; auto .
while ((valid trace___indcpa_keypair) /\  0<=i /\ i<=4 /\ BArray32.is_init b_publicseed 0 32 /\ BArray1184.is_init b_pk 0 ((i + 144)*8)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (__i_polyvec_tobytes_proof param_28 b_param param_27 (
                                                           BArray1536.init_arr
                                                           (JWord.W8.of_int 255))).
auto .
ecall (__i_polyvec_tobytes_proof param_26 b_param_0 param_25 (
                                                             BArray1536.init_arr
                                                             (JWord.W8.of_int 255))).
auto .
ecall (__polyvec_reduce_proof param_24 (BArray1536.init_arr (JWord.W8.of_int 255))).
auto .
ecall (__polyvec_add2_proof param_23 b_param_1 param_22 (BArray1536.init_arr
                                                        (JWord.W8.of_int 255))).
auto .
while ((valid trace___indcpa_keypair) /\  BArray32.is_init b_publicseed 0 32 /\ BArray1536.is_init b_pkpv 0 (i*512) /\ 0<=i /\ i<=3 /\ BArray4608.is_init b_aa 0 4608).
auto .
ecall (_poly_frommont_proof param_21 b_param_2).
auto .
ecall (__polyvec_pointwise_acc_proof param_20 b_param_4 param_19 b_param_3 
       param_18 (BArray1536.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= => &m /> *.
split. smt(BArray1536.init_arrP SBArray4608_1536.SBArray4608_1536.is_init_cell_get). move => *.
smt(SBArray1536_512.SBArray1536_512.is_init_cell_get SBArray1536_512.SBArray1536_512.is_init_cell_set BArray512.init_arrP all_cat). 
auto .
ecall (__polyvec_ntt_proof param_17 b_param_5).
auto .
ecall (__polyvec_ntt_proof param_16 b_param_6).
auto .
ecall (_poly_getnoise_eta1_4x_proof param_15 b_param_11 param_14 b_param_10 
       param_13 b_param_9 param_12 b_param_8 param_11 b_param_7 param_10).
auto .
ecall (_poly_getnoise_eta1_4x_proof param_9 b_param_16 param_8 b_param_15 
       param_7 b_param_14 param_6 b_param_13 param_5 b_param_12 param_4).
auto .
ecall (_gen_matrix_avx2_proof param_3 b_param_18 param_2 b_param_17 param_1).
auto .
while ((valid trace___indcpa_keypair) /\ 0<=i /\ i<=4 /\ BArray32.is_init b_publicseed 0 (i*8) /\ BArray32.is_init b_noiseseed 0 (i*8)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (_sha3_512A_A33_proof param_0 b_param_20 param b_param_19).
auto .
while ((valid trace___indcpa_keypair) /\  0<=i /\ i<=4  /\ BArray33.is_init b_inbuf 0 (8*i) ).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat). 
auto .
rewrite /is_init /valid /= => &m /> *.
split. smt(BArray33.init_arrP).
move => *. split.  smt().
move => *. split. rewrite !List.all_cat /=. smt().
move => *. split. smt().
move => *. split. smt().
move => *. split. move => 3?. rewrite !SBArray1536_512.SBArray1536_512.is_init_cell_set /=. smt(BArray512.init_arrP).
move =>* . split. rewrite !List.all_cat /= => /> *. smt(BArray4608.init_arrP BArray512.init_arrP SBArray1536_512.SBArray1536_512.is_init_cell_set).
move => *. split. smt(BArray1536.init_arrP).
move => *. rewrite !List.all_cat /=. smt(BArray1152.init_arrP SBArray1184_1152.SBArray1184_1152.is_init_cell_set).
qed .

lemma __indcpa_enc_proof _ct _b_ct _msgp _b_msgp _pk _b_pk _noiseseed _b_noiseseed :
      (__indcpa_enc_spec _ct _b_ct _msgp _b_msgp _pk _b_pk _noiseseed
      _b_noiseseed).
proof.
rewrite /__indcpa_enc_spec .
proc; auto .
ecall (_i_poly_compress_proof param_37 b_param param_36 (BArray512.init_arr
                                                        (JWord.W8.of_int 255))).
auto .
ecall (__i_polyvec_compress_proof param_35 b_param_0 param_34 (
                                                              BArray1536.init_arr
                                                              (JWord.W8.of_int 255)
                                                              )).
auto .
ecall (__poly_reduce_proof param_33 (BArray512.init_arr (JWord.W8.of_int 255))).
auto .
ecall (__polyvec_reduce_proof param_32 (BArray1536.init_arr (JWord.W8.of_int 255))).
auto .
ecall (_poly_add2_proof param_31 (BArray512.init_arr (JWord.W8.of_int 255)) 
       param_30 (BArray512.init_arr (JWord.W8.of_int 255))).
auto .
ecall (_poly_add2_proof param_29 (BArray512.init_arr (JWord.W8.of_int 255)) 
       param_28 (BArray512.init_arr (JWord.W8.of_int 255))).
auto .
ecall (__polyvec_add2_proof param_27 (BArray1536.init_arr (JWord.W8.of_int 255)) 
       param_26 b_param_1).
auto .
ecall (_poly_invntt_proof param_25 (BArray512.init_arr (JWord.W8.of_int 255))).
auto .
ecall (__polyvec_invntt_proof param_24 b_param_2).
auto .
ecall (__polyvec_pointwise_acc_proof param_23 b_param_3 param_22 (
                                                                 BArray1536.init_arr
                                                                 (JWord.W8.of_int
                                                                 255)) 
       param_21 (BArray1536.init_arr (JWord.W8.of_int 255))).
auto .
while ((valid trace___indcpa_enc) /\  0<=w /\ w<=3 /\ BArray1536.is_init b_bp 0 (w*512) /\ BArray4608.is_init b_aat 0 4608 ).
auto .
ecall (__polyvec_pointwise_acc_proof param_20 b_param_5 param_19 b_param_4 
       param_18 (BArray1536.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= => &m /> *.
split. smt(BArray1536.init_arrP SBArray4608_1536.SBArray4608_1536.is_init_cell_get). move => *.
 smt(all_cat SBArray1536_512.SBArray1536_512.is_init_cell_set BArray512.init_arrP).
auto .
ecall (__polyvec_ntt_proof param_17 b_param_6).
auto .
ecall (_poly_getnoise_eta1_4x_proof param_16 b_param_11 param_15 b_param_10 
       param_14 b_param_9 param_13 b_param_8 param_12 (BArray32.init_arr
                                                      (JWord.W8.of_int 255)) 
       param_11).
auto .
ecall (_poly_getnoise_eta1_4x_proof param_10 b_param_14 param_9 b_param_13
       param_8 b_param_12 param_7 b_param_11 param_6 (BArray32.init_arr
                                                     (JWord.W8.of_int 255)) 
       param_5).
auto . 
ecall (_gen_matrix_avx2_proof param_4 b_param_16 param_3 b_param_15 param_2).
auto .
ecall (_i_poly_frommsg_proof param_1 b_param_17 param_0 (BArray32.init_arr
                                                        (JWord.W8.of_int 255))).
auto .
while ((valid trace___indcpa_enc) /\  0<=w /\  w <= 4 /\ BArray32.is_init b_publicseed 0 (8*w)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (__i_polyvec_frombytes_proof param b_param_18).
auto .
rewrite /is_init /valid /= => &m /> *.
split. smt( SBArray1184_1152.SBArray1184_1152.is_init_cell_get).
move => *. split. smt(List.all_cat).
move => * . split. smt(BArray32.init_arrP).
move => *. split. smt().
move => *. split. admit. (*smt(SBArray1536_512.SBArray1536_512.is_init_cell_get SBArray1536_512.SBArray1536_512.is_init_cell_set  BArray512.init_arrP).*)
move => *. split. smt(BArray512.init_arrP SBArray1536_512.SBArray1536_512.is_init_cell_set ).
move => *. split. rewrite !List.all_cat /=.  smt(BArray4608.init_arrP BArray512.init_arrP SBArray1536_512.SBArray1536_512.is_init_cell_set ).
move => *. split. smt(BArray1536.init_arrP).
move => *. split. smt().
move => *. split. smt(BArray512.init_arrP).
move => *. split. move => 3?. rewrite !SBArray1088_128.SBArray1088_128.is_init_cell_set SBArray1088_960.SBArray1088_960.is_init_cell_set /=. smt(BArray960.init_arrP BArray128.init_arrP ).
move =>*. rewrite !List.all_cat /=. smt().
qed .

lemma __indcpa_dec_proof _msgp _b_msgp _ct _b_ct _sk _b_sk :
      (__indcpa_dec_spec _msgp _b_msgp _ct _b_ct _sk _b_sk).
proof.
rewrite /__indcpa_dec_spec .
proc; auto .
ecall (_i_poly_tomsg_proof param_13 b_param param_12 (BArray512.init_arr
                                                     (JWord.W8.of_int 255))).
auto .
ecall (__poly_reduce_proof param_11 (BArray512.init_arr (JWord.W8.of_int 255))).
auto .
ecall (_poly_sub_proof param_10 b_param_0 param_9 (BArray512.init_arr (W8.of_int 255)) param_8
       (BArray512.init_arr (JWord.W8.of_int 255))).
auto .
ecall (_poly_invntt_proof param_7 (BArray512.init_arr (JWord.W8.of_int 255))).
auto .
ecall (__polyvec_pointwise_acc_proof param_6 b_param_1 param_5 (
                                                               BArray1536.init_arr
                                                               (JWord.W8.of_int 255
                                                               )) param_4 
       (BArray1536.init_arr (JWord.W8.of_int 255))).
auto .
ecall (__polyvec_ntt_proof param_3 (BArray1536.init_arr (JWord.W8.of_int 255))).
auto .
ecall (__i_polyvec_frombytes_proof param_2 (BArray1152.init_arr
                                           (JWord.W8.of_int 255))).
auto .
ecall (_i_poly_decompress_proof param_1 b_param_3 param_0 b_param_2).
auto .
ecall (__i_polyvec_decompress_proof param (
                                                            BArray1088.init_arr
                                                            (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= => &m /> *.
split.  smt(BArray1088.init_arrP).
move => *. split.  smt(SBArray1088_128.SBArray1088_128.is_init_cell_get).
move => *. split.  smt(BArray1152.init_arrP).
move => *. split. smt(BArray1536.init_arrP).
move => *. split. smt(BArray512.init_arrP).
move => *. split. smt(BArray32.init_arrP).
smt (List.all_cat).
qed .

lemma __verify_proof _ct _b_ct _ctpc _b_ctpc :
      (__verify_spec _ct _b_ct _ctpc _b_ctpc).
proof.
rewrite /__verify_spec .
proc; auto .
while ((valid trace___verify) /\ 0<=i).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
by auto  .
qed .

lemma __cmov_proof _dst _b_dst _src _b_src _cnd :
      (__cmov_spec _dst _b_dst _src _b_src _cnd).
proof.
rewrite /__cmov_spec .
proc; auto .
rewrite /is_init /valid /= .
smt (BArray32.init_arrP).
qed .

lemma __crypto_kem_keypair_jazz_proof _pk _b_pk _sk _b_sk _randomnessp _b_randomnessp :
      (__crypto_kem_keypair_jazz_spec _pk _b_pk _sk _b_sk _randomnessp
      _b_randomnessp).
proof.
rewrite /__crypto_kem_keypair_jazz_spec .
proc; auto .
while ((valid trace___crypto_kem_keypair_jazz) /\  0<=i /\ i<=4 /\ BArray2400.is_init b_sk 0 ((296+i) *8)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (_sha3_256A_A1184_proof param_3 b_param param_2 (BArray1184.init_arr
                                                      (JWord.W8.of_int 255))).
auto .
while ((valid trace___crypto_kem_keypair_jazz) /\ 0<=i /\ i<=148 /\ BArray2400.is_init b_sk 0 ((144 + i) *8)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (__indcpa_keypair_proof param_1 b_param_2 param_0 b_param_1 param 
       b_param_0).
auto .
rewrite /is_init /valid /= => &m /> *.
split.  smt(SBArray64_32.SBArray64_32.is_init_cell_get).
move => *. split. smt(all_cat BArray1152.init_arrP SBArray2400_1152.SBArray2400_1152.is_init_cell_set).
move => *. split.  smt(BArray1184.init_arrP).
smt(all_cat BArray32.init_arrP SBArray2400_32.SBArray2400_32.is_init_cell_set).
qed .

lemma __crypto_kem_enc_jazz_proof _ct _b_ct _shk _b_shk _pk _b_pk _randomnessp _b_randomnessp :
      (__crypto_kem_enc_jazz_spec _ct _b_ct _shk _b_shk _pk _b_pk
      _randomnessp _b_randomnessp).
proof.
rewrite /__crypto_kem_enc_jazz_spec .
proc; auto .
ecall (__indcpa_enc_proof param_6 b_param_1 param_5 b_param_0 param_4 
       (BArray1184.init_arr (JWord.W8.of_int 255)) param_3 b_param).
auto .
ecall (_sha3_512A_A64_proof param_2 b_param_3 param_1 b_param_2).
auto .
ecall (_sha3_256A_A1184_proof param_0 b_param_4 param (BArray1184.init_arr
                                                      (JWord.W8.of_int 255))).
auto .  
rewrite /is_init /valid /= => &m /> *. admitted. (*assert false - FIX compiler
smt (List.all_cat BArray1568.init_arrP SBArray64_32.SBArray64_32.is_init_cell_get SBArray64_32.SBArray64_32.is_init_cell_set BArray32.init_arrP BArray64.init_arrP BArray1568.init_arrP).                                                 
qed .*)

lemma __crypto_kem_dec_jazz_proof _shk _b_shk _ct _b_ct _sk _b_sk :
      (__crypto_kem_dec_jazz_spec _shk _b_shk _ct _b_ct _sk _b_sk).
proof.
rewrite /__crypto_kem_dec_jazz_spec .
proc; auto .
ecall (__cmov_proof param_14 (BArray32.init_arr (JWord.W8.of_int 255)) param_13 
       b_param param_12).
auto .
ecall (_shake256_A32__A1120_proof param_11 b_param_1 param_10 b_param_0).
auto .
ecall (__verify_proof param_9 (BArray1088.init_arr (JWord.W8.of_int 255)) param_8 
       (BArray1088.init_arr (JWord.W8.of_int 255))).
auto .
ecall (__indcpa_enc_proof param_7 b_param_5 param_6 b_param_4 param_5 
       b_param_3 param_4 b_param_2).
auto .
ecall (_sha3_512A_A64_proof param_3 b_param_7 param_2 b_param_6).
auto .
ecall (__indcpa_dec_proof param_1 b_param_9 param_0 (BArray1088.init_arr
                                                    (JWord.W8.of_int 255)) 
       param b_param_8).
auto .
rewrite /is_init /valid /= => &m /> *. admitted. (*assert false - FIX compiler
smt (List.all_cat BArray32.init_arrP BArray64.init_arrP BArray1568.init_arrP SBArray3168_1536.SBArray3168_1536.is_init_cell_get SBArray64_32.SBArray64_32.is_init_cell_set SBArray64_32.SBArray64_32.is_init_cell_get SBArray3168_32.SBArray3168_32.is_init_cell_get SBArray3168_1568.SBArray3168_1568.is_init_cell_get SBArray1600_1568.SBArray1600_1568.is_init_cell_set SBArray1600_32.SBArray1600_32.is_init_cell_set).
qed .*)

lemma jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand_proof _public_key _b_public_key _secret_key _b_secret_key _coins _b_coins :
      (jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand_spec _public_key
      _b_public_key _secret_key _b_secret_key _coins _b_coins).
proof.
rewrite /jade_kem_mlkem_mlkem768_amd64_avx2_keypair_derand_spec .
proc; auto .
ecall (__crypto_kem_keypair_jazz_proof param_1 b_param_0 param_0 b_param 
       param (BArray64.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray64.init_arrP BArray1184.init_arrP BArray2400.init_arrP).
qed .

lemma jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand_proof _ciphertext _b_ciphertext _shared_secret _b_shared_secret _public_key _b_public_key _coins _b_coins :
      (jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand_spec _ciphertext
      _b_ciphertext _shared_secret _b_shared_secret _public_key _b_public_key
      _coins _b_coins).
proof.
rewrite /jade_kem_mlkem_mlkem768_amd64_avx2_enc_derand_spec .
proc; auto .
ecall (__crypto_kem_enc_jazz_proof param_2 b_param_0 param_1 b_param 
       param_0 (BArray1184.init_arr (JWord.W8.of_int 255)) param (BArray32.init_arr
                                                           (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= => &m /> * .
smt (List.all_cat BArray32.init_arrP BArray1184.init_arrP BArray1088.init_arrP).
qed .

lemma jade_kem_mlkem_mlkem768_amd64_avx2_keypair_proof _public_key _b_public_key _secret_key _b_secret_key :
      (jade_kem_mlkem_mlkem768_amd64_avx2_keypair_spec _public_key
      _b_public_key _secret_key _b_secret_key).
proof.
rewrite /jade_kem_mlkem_mlkem768_amd64_avx2_keypair_spec .
proc; auto .
ecall (__crypto_kem_keypair_jazz_proof param_1 b_param_0 param_0 b_param 
       param (BArray64.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= . inline. auto.
smt (List.all_cat BArray64.init_arrP BArray1184.init_arrP BArray2400.init_arrP).
qed .

lemma jade_kem_mlkem_mlkem768_amd64_avx2_enc_proof _ciphertext _b_ciphertext _shared_secret _b_shared_secret _public_key _b_public_key :
      (jade_kem_mlkem_mlkem768_amd64_avx2_enc_spec _ciphertext _b_ciphertext
      _shared_secret _b_shared_secret _public_key _b_public_key).
proof.
rewrite /jade_kem_mlkem_mlkem768_amd64_avx2_enc_spec .
proc; auto .
ecall (__crypto_kem_enc_jazz_proof param_2 b_param_0 param_1 b_param 
       param_0 (BArray1184.init_arr (JWord.W8.of_int 255)) param (BArray32.init_arr
                                                           (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= . inline. auto.
move => &m /> *. split. smt (BArray32.init_arrP BArray1184.init_arrP).
move => /> *. smt(BArray1088.init_arrP List.all_cat).
qed .

lemma jade_kem_mlkem_mlkem768_amd64_avx2_dec_proof _shared_secret _b_shared_secret _ciphertext _b_ciphertext _secret_key _b_secret_key :
      (jade_kem_mlkem_mlkem768_amd64_avx2_dec_spec _shared_secret
      _b_shared_secret _ciphertext _b_ciphertext _secret_key _b_secret_key).
proof.
rewrite /jade_kem_mlkem_mlkem768_amd64_avx2_dec_spec .
proc; auto .
ecall (__crypto_kem_dec_jazz_proof param_1 b_param param_0 (
                                                           BArray1088.init_arr
                                                           (JWord.W8.of_int 255)) 
       param (BArray2400.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray32.init_arrP BArray1088.init_arrP BArray2400.init_arrP).
qed .







