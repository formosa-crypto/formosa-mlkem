require import AllCore IntDiv CoreMap List Distr.

from JazzEC require import Safety_mlkem1024_ref.

from Jasmin require import Jcheck JSafety.

(* The post and trace are valid. *)


lemma __fqmul_proof _a _b : (__fqmul_spec _a _b).
proof.
rewrite /__fqmul_spec .
by proc; auto .
qed .

lemma __barrett_reduce_proof _a : (__barrett_reduce_spec _a).
proof.
rewrite /__barrett_reduce_spec .
by proc; auto .
qed .

lemma __ANDN_64_proof _a _b : (__ANDN_64_spec _a _b).
proof.
rewrite /__ANDN_64_spec .
by proc; auto .
qed .

lemma __SHLQ_proof _x _shbytes : (__SHLQ_spec _x _shbytes).
proof.
rewrite /__SHLQ_spec .
by proc; auto .
qed .

lemma keccakf1600_index_proof _x _y : (keccakf1600_index_spec _x _y).
proof.
rewrite /keccakf1600_index_spec .
by proc; auto .
qed .

lemma keccakf1600_rho_offsets_proof _i : (keccakf1600_rho_offsets_spec _i).
proof.
rewrite /keccakf1600_rho_offsets_spec .
proc; auto . while true. by auto. by auto.
qed .

lemma keccakf1600_rhotates_proof _x _y : (keccakf1600_rhotates_spec _x _y).
proof.
rewrite /keccakf1600_rhotates_spec .
proc; auto .
ecall (keccakf1600_rho_offsets_proof param_1).
auto .
ecall (keccakf1600_index_proof param_0 param).
auto .
smt (List.all_cat).
qed .

lemma __rol_u64_ref_proof _x _i : (__rol_u64_ref_spec _x _i).
proof.
rewrite /__rol_u64_ref_spec .
by proc; auto . 
qed .

lemma __theta_sum_ref_proof _a _b_a : (__theta_sum_ref_spec _a _b_a).
proof.
rewrite /__theta_sum_ref_spec .
proc. auto .
while ((valid trace___theta_sum_ref) /\ 0<= y /\  BArray40.is_init b_c 0 40).
auto .
while ((valid trace___theta_sum_ref) /\ 0<=y /\ y<5 /\ BArray40.is_init b_c 0 40 /\ 0<=x /\ x<=5).
auto .
rewrite /is_init /valid /= => &m /> *. smt(List.all_cat).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
while ((valid trace___theta_sum_ref) /\ 0<=x /\ x<=5 /\ BArray40.is_init b_c 0 (8*x)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __theta_rol_ref_proof _c _b_c : (__theta_rol_ref_spec _c _b_c).
proof.
rewrite /__theta_rol_ref_spec .
proc; auto .
while ((valid trace___theta_rol_ref) /\ 0<=x /\ x<=5 /\ BArray40.is_init b_d 0 (8*x)).
auto .
ecall (__rol_u64_ref_proof param_0 param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __rol_sum_ref_proof _a _b_a _d _b_d _y :
      (__rol_sum_ref_spec _a _b_a _d _b_d _y).
proof.
rewrite /__rol_sum_ref_spec .
proc; auto .
while ((valid trace___rol_sum_ref) /\ 0<=x /\ x<=5 /\ BArray40.is_init b_b 0 (x*8)).
auto .
ecall (__rol_u64_ref_proof param_2 param_1).
auto .
ecall (keccakf1600_rhotates_proof param_0 param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __set_row_ref_proof _e _b_e _b _b_b _y :
      (__set_row_ref_spec _e _b_e _b _b_b _y).
proof.
rewrite /__set_row_ref_spec .
proc; auto .
while ((valid trace___set_row_ref) /\ 0<=x /\ x<=5 /\ 0<=y /\ y<5 /\ BArray200.is_init b_e 0 (y*5*8 + 8*x)).
auto .
ecall (__ANDN_64_proof param_0 param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma _pround_ref_proof _e _b_e _a _b_a : (_pround_ref_spec _e _b_e _a _b_a).
proof.
rewrite /_pround_ref_spec .
proc; auto .
while ((valid trace__pround_ref) /\ 0<=y /\ y<=5 /\ BArray200.is_init b_e 0 (y*5*8) ).
auto .
ecall (__set_row_ref_proof param_6 b_param
       param_5 (BArray40.init_arr (JWord.W8.of_int 255)) param_4).
auto .
ecall (__rol_sum_ref_proof param_3 (BArray200.init_arr (JWord.W8.of_int 255)) 
       param_2 (BArray40.init_arr (JWord.W8.of_int 255)) param_1).
auto .
rewrite /is_init /valid /= => &m /> *.
split. smt(BArray40.init_arrP BArray200.init_arrP).
move=> *.  smt (List.all_cat BArray40.init_arrP BArray200.init_arrP).
auto .
ecall (__theta_rol_ref_proof param_0 (BArray40.init_arr (JWord.W8.of_int 255))).
auto .
ecall (__theta_sum_ref_proof param (BArray200.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray200.init_arrP BArray40.init_arrP).
qed .

lemma __keccakf1600_ref_proof _a _b_a : (__keccakf1600_ref_spec _a _b_a).
proof.
rewrite /__keccakf1600_ref_spec .
proc; auto .
while ((valid trace___keccakf1600_ref) /\ 0<=c /\ c<=24 /\ c%%2 = 0 /\ BArray200.is_init b_a 0 200).
auto .
ecall (_pround_ref_proof param_2 b_param_0 param_1 b_param).
auto .
ecall (_pround_ref_proof param_0 b_param_1 param (BArray200.init_arr
                                                 (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= => &m /> *. split. smt(BArray200.init_arrP).
rewrite /JModel_common.swap_ /= => /> *.
split. smt(BArray200.init_arrP).
move => *. split. smt(List.all_cat BArray200.init_arrP).
smt().
auto .
ecall (_pround_ref_proof param_2 b_param_0 param_1 b_param).
auto .
ecall (_pround_ref_proof param_0 b_param_1 param (BArray200.init_arr
                                                 (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray200.init_arrP).
qed .

lemma _keccakf1600_ref_proof _a _b_a : (_keccakf1600_ref_spec _a _b_a).
proof.
rewrite /_keccakf1600_ref_spec .
proc; auto .
ecall (__keccakf1600_ref_proof param (BArray200.init_arr (JWord.W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray200.init_arrP).
qed .

lemma __state_init_ref_proof _st _b_st : (__state_init_ref_spec _st _b_st).
proof.
rewrite /__state_init_ref_spec .
proc; auto .
while ((valid trace___state_init_ref) /\ 0<= i /\ i<=25 /\ BArray200.is_init b_st 0 (8*i)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __addratebit_ref_proof _st _b_st __RATE8 :
      (__addratebit_ref_spec _st _b_st __RATE8).
proof.
rewrite /__addratebit_ref_spec .
proc; auto .
rewrite /is_init /valid /= => &m /> *.
smt ( BArray200.init_arrP).
qed .


lemma a32____a_ilen_read_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :
      (a32____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN
      _tRAIL _cUR _aT).
proof.
rewrite /a32____a_ilen_read_upto8_at_spec .
admitted .

lemma a32____a_ilen_write_upto8_proof _buf _b_buf _offset _dELTA _lEN _w :
      (a32____a_ilen_write_upto8_spec _buf _b_buf _offset _dELTA _lEN _w).
proof.
rewrite /a32____a_ilen_write_upto8_spec .
admitted .

lemma a32____addstate_ref_proof _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB :
      (a32____addstate_ref_spec _st _b_st _aT _buf _b_buf _offset __LEN
      __TRAILB).
proof.
rewrite /a32____addstate_ref_spec .
admitted .

lemma a32____absorb_ref_proof _st _b_st _aT _buf _b_buf __TRAILB __RATE8 :
      (a32____absorb_ref_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8).
proof.
rewrite /a32____absorb_ref_spec .
admitted .

lemma a32____dumpstate_ref_proof _buf _b_buf _offset __LEN _st _b_st :
      (a32____dumpstate_ref_spec _buf _b_buf _offset __LEN _st _b_st).
proof.
rewrite /a32____dumpstate_ref_spec .
admitted .

lemma a32____squeeze_ref_proof _st _b_st _buf _b_buf __RATE8 :
      (a32____squeeze_ref_spec _st _b_st _buf _b_buf __RATE8).
proof.
rewrite /a32____squeeze_ref_spec .
admitted .

lemma a33____a_ilen_read_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :
      (a33____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN
      _tRAIL _cUR _aT).
proof.
rewrite /a33____a_ilen_read_upto8_at_spec .
admitted .

lemma a33____addstate_ref_proof _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB :
      (a33____addstate_ref_spec _st _b_st _aT _buf _b_buf _offset __LEN
      __TRAILB).
proof.
rewrite /a33____addstate_ref_spec .
admitted .

lemma a33____absorb_ref_proof _st _b_st _aT _buf _b_buf __TRAILB __RATE8 :
      (a33____absorb_ref_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8).
proof.
rewrite /a33____absorb_ref_spec .
admitted .

lemma a34____a_ilen_read_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :
      (a34____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN
      _tRAIL _cUR _aT).
proof.
rewrite /a34____a_ilen_read_upto8_at_spec .
admitted .

lemma a34____addstate_ref_proof _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB :
      (a34____addstate_ref_spec _st _b_st _aT _buf _b_buf _offset __LEN
      __TRAILB).
proof.
rewrite /a34____addstate_ref_spec .
admitted .

lemma a34____absorb_ref_proof _st _b_st _aT _buf _b_buf __TRAILB __RATE8 :
      (a34____absorb_ref_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8).
proof.
rewrite /a34____absorb_ref_spec .
admitted .

lemma a64____a_ilen_read_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :
      (a64____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA _lEN
      _tRAIL _cUR _aT).
proof.
rewrite /a64____a_ilen_read_upto8_at_spec .
admitted .

lemma a64____a_ilen_write_upto8_proof _buf _b_buf _offset _dELTA _lEN _w :
      (a64____a_ilen_write_upto8_spec _buf _b_buf _offset _dELTA _lEN _w).
proof.
rewrite /a64____a_ilen_write_upto8_spec .
admitted .

lemma a64____addstate_ref_proof _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB :
      (a64____addstate_ref_spec _st _b_st _aT _buf _b_buf _offset __LEN
      __TRAILB).
proof.
rewrite /a64____addstate_ref_spec .
admitted .

lemma a64____absorb_ref_proof _st _b_st _aT _buf _b_buf __TRAILB __RATE8 :
      (a64____absorb_ref_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8).
proof.
rewrite /a64____absorb_ref_spec .
admitted .

lemma a64____dumpstate_ref_proof _buf _b_buf _offset __LEN _st _b_st :
      (a64____dumpstate_ref_spec _buf _b_buf _offset __LEN _st _b_st).
proof.
rewrite /a64____dumpstate_ref_spec .
admitted .

lemma a64____squeeze_ref_proof _st _b_st _buf _b_buf __RATE8 :
      (a64____squeeze_ref_spec _st _b_st _buf _b_buf __RATE8).
proof.
rewrite /a64____squeeze_ref_spec .
admitted .

lemma a128____a_ilen_write_upto8_proof _buf _b_buf _offset _dELTA _lEN _w :
      (a128____a_ilen_write_upto8_spec _buf _b_buf _offset _dELTA _lEN _w).
proof.
rewrite /a128____a_ilen_write_upto8_spec .
admitted .

lemma a128____dumpstate_ref_proof _buf _b_buf _offset __LEN _st _b_st :
      (a128____dumpstate_ref_spec _buf _b_buf _offset __LEN _st _b_st).
proof.
rewrite /a128____dumpstate_ref_spec .
admitted .

lemma a128____squeeze_ref_proof _st _b_st _buf _b_buf __RATE8 :
      (a128____squeeze_ref_spec _st _b_st _buf _b_buf __RATE8).
proof.
rewrite /a128____squeeze_ref_spec .
admitted .

lemma a168____a_ilen_write_upto8_proof _buf _b_buf _offset _dELTA _lEN _w :
      (a168____a_ilen_write_upto8_spec _buf _b_buf _offset _dELTA _lEN _w).
proof.
rewrite /a168____a_ilen_write_upto8_spec .
admitted .

lemma a168____dumpstate_ref_proof _buf _b_buf _offset __LEN _st _b_st :
      (a168____dumpstate_ref_spec _buf _b_buf _offset __LEN _st _b_st).
proof.
rewrite /a168____dumpstate_ref_spec .
admitted .

lemma a1568____a_ilen_read_upto8_at_proof _buf _b_buf _offset _dELTA _lEN _tRAIL _cUR _aT :
      (a1568____a_ilen_read_upto8_at_spec _buf _b_buf _offset _dELTA 
      _lEN _tRAIL _cUR _aT).
proof.
rewrite /a1568____a_ilen_read_upto8_at_spec .
admitted .

lemma a1568____addstate_ref_proof _st _b_st _aT _buf _b_buf _offset __LEN __TRAILB :
      (a1568____addstate_ref_spec _st _b_st _aT _buf _b_buf _offset __LEN
      __TRAILB).
proof.
rewrite /a1568____addstate_ref_spec .
admitted .

lemma a1568____absorb_ref_proof _st _b_st _aT _buf _b_buf __TRAILB __RATE8 :
      (a1568____absorb_ref_spec _st _b_st _aT _buf _b_buf __TRAILB __RATE8).
proof.
rewrite /a1568____absorb_ref_spec .
admitted .


from Jasmin require import JWord JUtils.

lemma _shake256_128_33_proof _out _b_out _in _b_in :
      (_shake256_128_33_spec _out _b_out _in _b_in).
proof.
rewrite /_shake256_128_33_spec .
proc; auto .
ecall (a128____squeeze_ref_proof param_7 b_param_0 param_6 b_param param_5).
auto .
ecall (a33____absorb_ref_proof param_4 (BArray200.init_arr (W8.of_int 255)) 
       param_3 param_2 (BArray33.init_arr (W8.of_int 255)) param_1 param_0).
auto .
ecall (__state_init_ref_proof param b_param_1).
auto .
rewrite /is_init /valid /=  => &m /> *.
split. smt (BArray33.init_arrP BArray200.init_arrP).
move =>* . split.  smt(BArray128.init_arrP).
smt(List.all_cat).
qed .

lemma _shake256_A32__A1600_proof _out _b_out _in0 _b_in0 _in1 _b_in1 :
      (_shake256_A32__A1600_spec _out _b_out _in0 _b_in0 _in1 _b_in1).
proof.
rewrite /_shake256_A32__A1600_spec .
proc; auto .
ecall (a32____squeeze_ref_proof param_12 b_param_0 param_11 b_param param_10).
auto .
ecall (a1568____absorb_ref_proof param_9 b_param_1 param_8 param_7 (
                                                                   BArray1568.init_arr
                                                                   (W8.of_int
                                                                   255)) 
       param_6 param_5).
auto .
ecall (a32____absorb_ref_proof param_4 (BArray200.init_arr (W8.of_int 255)) 
       param_3 param_2 (BArray32.init_arr (W8.of_int 255)) param_1 param_0).
auto .
ecall (__state_init_ref_proof param b_param_2).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray32.init_arrP BArray200.init_arrP BArray1568.init_arrP).
qed .

lemma _sha3_512A_A33_proof _out _b_out _in _b_in :
      (_sha3_512A_A33_spec _out _b_out _in _b_in).
proof.
rewrite /_sha3_512A_A33_spec .
proc; auto .
ecall (a64____squeeze_ref_proof param_7 b_param_0 param_6 b_param param_5).
auto .
ecall (a33____absorb_ref_proof param_4 (BArray200.init_arr (W8.of_int 255)) 
       param_3 param_2 (BArray33.init_arr (W8.of_int 255)) param_1 param_0).
auto .
ecall (__state_init_ref_proof param b_param_1).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray33.init_arrP BArray200.init_arrP BArray64.init_arrP).
qed .

lemma _shake128_absorb34_proof _st _b_st _in _b_in :
      (_shake128_absorb34_spec _st _b_st _in _b_in).
proof.
rewrite /_shake128_absorb34_spec .
proc; auto .
ecall (a34____absorb_ref_proof param_4 (BArray200.init_arr (W8.of_int 255)) 
       param_3 param_2 (BArray34.init_arr (W8.of_int 255)) param_1 param_0).
auto .
ecall (__state_init_ref_proof param b_param).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray34.init_arrP BArray200.init_arrP).
qed .

lemma _shake128_squeezeblock_proof _st _b_st _out _b_out :
      (_shake128_squeezeblock_spec _st _b_st _out _b_out).
proof.
rewrite /_shake128_squeezeblock_spec .
proc; auto .
ecall (a168____dumpstate_ref_proof param_3 b_param param_2 param_1 param_0 
       (BArray200.init_arr (W8.of_int 255))).
auto .
ecall (_keccakf1600_ref_proof param (BArray200.init_arr (W8.of_int 255))).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray200.init_arrP).
qed .

lemma _sha3_256A_A1568_proof _out _b_out _in _b_in :
      (_sha3_256A_A1568_spec _out _b_out _in _b_in).
proof.
rewrite /_sha3_256A_A1568_spec .
proc; auto .
ecall (a32____squeeze_ref_proof param_7 b_param_0 param_6 b_param param_5).
auto .
ecall (a1568____absorb_ref_proof param_4 (BArray200.init_arr (W8.of_int 255)) 
       param_3 param_2 (BArray1568.init_arr (W8.of_int 255)) param_1 
       param_0).
auto .
ecall (__state_init_ref_proof param b_param_1).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray1568.init_arrP BArray200.init_arrP BArray32.init_arrP).
qed .

lemma _sha3_512A_A64_proof _out _b_out _in _b_in :
      (_sha3_512A_A64_spec _out _b_out _in _b_in).
proof.
rewrite /_sha3_512A_A64_spec .
proc; auto .
ecall (a64____squeeze_ref_proof param_7 b_param_0 param_6 b_param param_5).
auto .
ecall (a64____absorb_ref_proof param_4 (BArray200.init_arr (W8.of_int 255)) 
       param_3 param_2 (BArray64.init_arr (W8.of_int 255)) param_1 param_0).
auto .
ecall (__state_init_ref_proof param b_param_1).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray64.init_arrP BArray200.init_arrP).
qed .

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
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat  BArray512.init_arrP).
qed .

lemma _poly_basemul_proof _rp _b_rp _ap _b_ap _bp _b_bp :
      (_poly_basemul_spec _rp _b_rp _ap _b_ap _bp _b_bp).
proof.
rewrite /_poly_basemul_spec .
proc; auto .
while ((valid trace__poly_basemul) /\ 0<= i /\ i <=256 /\ i%%4 = 0 /\ BArray512.is_init b_rp 0 (i*2)  /\ BArray512.is_init b_srp 0 (i*2)).
auto .
ecall (__fqmul_proof param_18 param_17).
auto .
ecall (__fqmul_proof param_16 param_15).
auto .
ecall (__fqmul_proof param_14 param_13).
auto .
ecall (__fqmul_proof param_12 param_11).
auto .
ecall (__fqmul_proof param_10 param_9).
auto .
ecall (__fqmul_proof param_8 param_7).
auto .
ecall (__fqmul_proof param_6 param_5).
auto .
ecall (__fqmul_proof param_4 param_3).
auto .
ecall (__fqmul_proof param_2 param_1).
auto .
ecall (__fqmul_proof param_0 param).
auto .
rewrite /is_init /valid /= => &m /> *. rewrite  /(`|>>`) /(`<<`) /=. 
split. rewrite !List.all_cat /=. smt(). smt().
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat).
qed .

lemma __poly_reduce_proof _rp _b_rp : (__poly_reduce_spec _rp _b_rp).
proof.
rewrite /__poly_reduce_spec .
proc; auto .
while ((valid trace___poly_reduce) /\ 0<=j).
auto .
ecall (__barrett_reduce_proof param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray512.init_arrP).
qed .

lemma _poly_frombytes_proof _rp _b_rp _ap _b_ap :
      (_poly_frombytes_spec _rp _b_rp _ap _b_ap).
proof.
rewrite /_poly_frombytes_spec .
proc; auto .
while ((valid trace__poly_frombytes) /\ BArray512.is_init b_rp 0 (4*i) /\ 0<=i /\ i<=128).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
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
ecall (__fqmul_proof param_0 param).
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
while ((valid trace__i_poly_frommsg) /\ 0<=i<=32 /\ BArray512.is_init b_rp 0 (16*i)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma _poly_getnoise_proof _rp _b_rp _s_seed _b_s_seed _nonce :
      (_poly_getnoise_spec _rp _b_rp _s_seed _b_s_seed _nonce).
proof.
rewrite /_poly_getnoise_spec .
proc; auto .
while ((valid trace__poly_getnoise) /\ 0<=i<=128 /\ BArray512.is_init b_rp 0 (4*i)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (_shake256_128_33_proof param_0 b_param_0 param b_param).
auto .
while ((valid trace__poly_getnoise) /\  0<=k<=32 /\ BArray33.is_init b_extseed 0 k).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma _poly_invntt_proof _rp _b_rp : (_poly_invntt_spec _rp _b_rp).
proof.
rewrite /_poly_invntt_spec .
proc; auto .
while ((valid trace__poly_invntt) /\ 0 <= j ).
auto .
ecall (__fqmul_proof param_3 param_2).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
while (valid trace__poly_invntt /\  2 <= len /\ len <= 256 /\ exists l, 0 <= l /\ len = 2^l
       /\ 0 <= to_uint zetasctr <= 128 /\ to_uint zetasctr * len = 128 * (len - 2)); last first.
+ auto => /> *.  split; 1: by exists 1 => /=.
  by smt(BArray512.init_arrP).
move => *; wp; sp=> *; move=> *; exists *zetasctr.
elim*=> zetasctr1 l.
while ((valid trace__poly_invntt) /\  1 <= len /\ len <= 128 /\ 0 <= l /\ len = 2 ^ l
       /\ 0 <= to_uint zetasctr1 <= 128
       /\ 0 <= to_uint zetasctr <= 128
       /\ to_uint zetasctr1 * len = 128 * (len - 2)
       /\ 2 * (to_uint zetasctr - to_uint zetasctr1 ) * len <= 256
       /\ 0 <= start <= 256
       /\ start = 2 * (to_uint zetasctr - to_uint zetasctr1)*len); last first.
+ wp; skip => &m [#] h 5? l_ 2? z *.
  split;1: smt(W64.to_uint0). 
  move =>  /> start zetasctr *. rewrite /(`<<`) //=. split. smt(all_cat).   split. smt(). split. smt().
  exists (l+1). rewrite exprS; smt().
auto.
while ((valid trace__poly_invntt) /\ cmp = start + len 
       /\ 0 <= start <= 256
       /\ 1 <=  len /\ len <= 128  /\ start <=  j <=  start +  len
       /\ 0 <= to_uint zetasctr <= 128
       /\ to_uint zetasctr1 * len = 128 * ( len - 2)
       /\ start = 2 * (to_uint zetasctr -1 - to_uint zetasctr1) *  len
       /\ 2 * (to_uint zetasctr - to_uint zetasctr1 ) *  len <= 256); last first.
+ auto. move => &m /> *. rewrite !to_uintD_small /=. smt().
  split. split.  rewrite /valid !all_cat /=. smt(). split.  smt(). split. smt(). smt(). move => *. split. smt(all_cat). split. smt(). smt().
auto. 
ecall (__fqmul_proof param_1 param_0).
auto .
ecall (__barrett_reduce_proof param).
auto .
move => &m /> *. split. smt(all_cat). split. smt().  smt(). 
qed .


lemma _poly_ntt_proof _rp _b_rp : (_poly_ntt_spec _rp _b_rp).
proof.
rewrite /_poly_ntt_spec .
proc; auto .
ecall (__poly_reduce_proof param_1 (BArray512.init_arr (W8.of_int 255))).
auto .
while ((valid trace__poly_ntt) /\ 1 <= len /\ len <= 128 /\ exists l, 0 <= l /\ len = 2^l
       /\ 0 <= zetasctr <= 127 /\ 2*(zetasctr+1)*len = 256); last first. 
+ auto. move => &m /> ?. split. by exists 7. smt(all_cat BArray512.init_arrP).
wp; sp => *; exists *zetasctr; elim* => zetasctr1 l.
while ((valid trace__poly_ntt) /\ 1 <= len /\ len <= 128 /\ 0 <= l /\ len = 2 ^ l
       /\ 0 <= zetasctr1 <= 127
       /\ 0 <= zetasctr <= 127
       /\ 2 * (zetasctr1+ 1) * len = 256
       /\ 2 <= len
       /\ 2* (zetasctr - zetasctr1 ) * len <= 256
       /\ 0 <= start <= 256
       /\ start = 2*(zetasctr - zetasctr1)* len); last first.
+ wp; skip => &m [#] ??????l_??z?; split;1: by smt(W64.to_uint0).
  move => /> start ? zt0 10? l1 * . rewrite  /(`|>>`) /(`<<`) /=.  split.  smt(). split.  smt().
  exists(l-1). rewrite -!l_. case(l=0). move => l0. move: l1. by rewrite l0 /=.  
  smt(JUtils.powS_minus).
auto.
while ((valid trace__poly_ntt) /\ cmp =  start +  len 
       /\ 0 <= start <= 256
       /\ 1 <= len /\ len <= 128
       /\ start <= j <=  start + len
       /\ 0 <= zetasctr <= 127
       /\ 2 * (zetasctr1 + 1) * len = 256
       /\ start = 2*(zetasctr -1 - zetasctr1) * len
       /\ 2 * (zetasctr - zetasctr1 ) * len <= 256); last first.
+ auto .
  rewrite /is_init /valid /= => &m /> *.
  split.  rewrite !all_cat /=. smt(). move => *. split. smt(all_cat). smt().
auto.
ecall (__fqmul_proof param_0 param).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat).
qed .


lemma _poly_sub_proof _rp _b_rp _ap _b_ap _bp _b_bp :
      (_poly_sub_spec _rp _b_rp _ap _b_ap _bp _b_bp).
proof.
rewrite /_poly_sub_spec .
proc; auto .
while ((valid trace__poly_sub) /\ 0<=i<=256 /\ BArray512.is_init b_rp 0 (2*i)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma _poly_tobytes_proof _rp _b_rp _a _b_a :
      (_poly_tobytes_spec _rp _b_rp _a _b_a).
proof.
rewrite /_poly_tobytes_spec .
proc; auto .
while ((valid trace__poly_tobytes) /\ BArray384.is_init b_rp 0 j /\ j = (i%/2) * 3 /\ 0<=i<=256 /\ i%%2=0).
auto .
rewrite /is_init /valid /= => &m /> *.  split.  rewrite !List.all_cat /=. smt(). smt().
auto .
ecall (_poly_csubq_proof param (BArray512.init_arr (W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray512.init_arrP).
qed .

lemma _i_poly_tomsg_proof _rp _b_rp _a _b_a :
      (_i_poly_tomsg_spec _rp _b_rp _a _b_a).
proof.
rewrite /_i_poly_tomsg_spec .
proc; auto .
while ((valid trace__i_poly_tomsg) /\ 0<=i<=32 /\ BArray32.is_init b_rp 0 i).
auto .
while ((valid trace__i_poly_tomsg) /\ 0<= j /\ 0<=i<32).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (_poly_csubq_proof param (BArray512.init_arr (W8.of_int 255))).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray512.init_arrP).
qed .

lemma _i_poly_compress_proof _rp _b_rp _a _b_a :
      (_i_poly_compress_spec _rp _b_rp _a _b_a).
proof.
rewrite /_i_poly_compress_spec .
proc; auto .
while ((valid trace__i_poly_compress) /\ 0<=i<=256 /\ i%%8 = 0 /\ BArray160.is_init b_rp 0 k /\ k = i%/8 * 5).
auto .
while ((valid trace__i_poly_compress) /\ 0<=j<=8 /\ 0<=i<=248 /\  i%%8 = 0 /\  BArray160.is_init b_rp 0 k /\ k = i%/8 * 5 /\ BArray8.is_init b_t 0 j).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= => &m /> *. split. smt(). 
move => *. split. rewrite !List.all_cat /=. smt().
smt().
auto .
ecall (_poly_csubq_proof param (BArray512.init_arr (W8.of_int 255))).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray512.init_arrP).
qed .

lemma _i_poly_decompress_proof _rp _b_rp _ap _b_ap :
      (_i_poly_decompress_spec _rp _b_rp _ap _b_ap).
proof.
rewrite /_i_poly_decompress_spec .
proc; auto .
while ((valid trace__i_poly_decompress) /\ 0<=i<=256 /\  i%%8 = 0 /\ BArray512.is_init b_rp 0 (2*i) /\ j = i%/8 * 5).
auto .
while ((valid trace__i_poly_decompress) /\ 0<=i<=248 /\ 0<=k<=8 /\ BArray8.is_init b_t 0 8 /\ BArray512.is_init b_rp 0 (2*(i+k))).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= => &m /> *. split. rewrite !all_cat /=. smt().
smt (List.all_cat).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat).
qed .

lemma __polyvec_add2_proof _r _b_r _b _b_b :
      (__polyvec_add2_spec _r _b_r _b _b_b).
proof.
rewrite /__polyvec_add2_spec .
proc; auto .
while ((valid trace___polyvec_add2) /\ 0<=i /\ BArray2048.is_init b_r 0 2048 /\ BArray2048.is_init b_b 0 2048).
auto .
ecall (_poly_add2_proof param_0 b_param_0 param b_param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat SBArray2048_512.SBArray2048_512.is_init_cell_get SBArray2048_512.SBArray2048_512.is_init_cell_set BArray512.init_arrP).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray2048.init_arrP).
qed .

lemma __polyvec_csubq_proof _r _b_r : (__polyvec_csubq_spec _r _b_r).
proof.
rewrite /__polyvec_csubq_spec .
proc; auto .
  while ((valid trace___polyvec_csubq) /\ 0<=i /\ BArray2048.is_init b_r 0 2048).
auto .
ecall (_poly_csubq_proof param b_param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat SBArray2048_512.SBArray2048_512.is_init_cell_set SBArray2048_512.SBArray2048_512.is_init_cell_get BArray512.init_arrP).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray2048.init_arrP).
qed .

lemma __i_polyvec_frombytes_proof _ap _b_ap :
      (__i_polyvec_frombytes_spec _ap _b_ap).
proof.
rewrite /__i_polyvec_frombytes_spec .
proc; auto .
while ((valid trace___i_polyvec_frombytes) /\ 0<=i /\ i<=4 /\ BArray2048.is_init b_r 0 (i*512) /\ BArray1536.is_init b_ap 0 1536).
auto .
ecall (_poly_frombytes_proof param_0 b_param_0 param b_param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat SBArray2048_512.SBArray2048_512.is_init_cell_set BArray2048.init_arrP BArray512.init_arrP SBArray1536_384.SBArray1536_384.is_init_cell_get).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __polyvec_invntt_proof _r _b_r : (__polyvec_invntt_spec _r _b_r).
proof.
rewrite /__polyvec_invntt_spec .
proc; auto .
while ((valid trace___polyvec_invntt) /\ 0<=i /\ BArray2048.is_init b_r 0 2048).
auto .
ecall (_poly_invntt_proof param b_param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat  SBArray2048_512.SBArray2048_512.is_init_cell_set SBArray2048_512.SBArray2048_512.is_init_cell_get BArray512.init_arrP).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray2048.init_arrP).
qed .

lemma __polyvec_ntt_proof _r _b_r : (__polyvec_ntt_spec _r _b_r).
proof.
rewrite /__polyvec_ntt_spec .
proc; auto .
while ((valid trace___polyvec_ntt) /\ 0<=i /\ BArray2048.is_init b_r 0 2048).
auto .
ecall (_poly_ntt_proof param b_param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat  SBArray2048_512.SBArray2048_512.is_init_cell_set SBArray2048_512.SBArray2048_512.is_init_cell_get BArray512.init_arrP).
auto .
rewrite /is_init /valid /= . 
smt (List.all_cat BArray2048.init_arrP).
qed .

lemma __polyvec_pointwise_acc_proof _a _b_a _b _b_b :
      (__polyvec_pointwise_acc_spec _a _b_a _b _b_b).
proof.
rewrite /__polyvec_pointwise_acc_spec .
proc; auto .
ecall (__poly_reduce_proof param_7 (BArray512.init_arr (W8.of_int 255))).
auto .
while ((valid trace___polyvec_pointwise_acc)  /\  0<=i /\ BArray2048.is_init b_a 0 2048 /\ BArray2048.is_init b_b 0 2048 ).
auto .
ecall (_poly_add2_proof param_6 (BArray512.init_arr (W8.of_int 255)) 
       param_5 (BArray512.init_arr (W8.of_int 255))).
auto .
ecall (_poly_basemul_proof param_4 b_param_1 param_3 b_param_0 param_2 
       b_param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat BArray512.init_arrP SBArray2048_512.SBArray2048_512.is_init_cell_get SBArray2048_512.SBArray2048_512.is_init_cell_set ).
auto .
ecall (_poly_basemul_proof param_1 b_param_4 param_0 b_param_3 param 
       b_param_2).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat  BArray512.init_arrP SBArray2048_512.SBArray2048_512.is_init_cell_get SBArray2048_512.SBArray2048_512.is_init_cell_set).
qed .

lemma __polyvec_reduce_proof _r _b_r : (__polyvec_reduce_spec _r _b_r).
proof.
rewrite /__polyvec_reduce_spec .
proc; auto .
while ((valid trace___polyvec_reduce) /\  0<=i /\ BArray2048.is_init b_r 0 2048).
auto .
ecall (__poly_reduce_proof param b_param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat SBArray2048_512.SBArray2048_512.is_init_cell_set SBArray2048_512.SBArray2048_512.is_init_cell_get BArray512.init_arrP).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray2048.init_arrP).
qed .

lemma __i_polyvec_tobytes_proof _rp _b_rp _a _b_a :
      (__i_polyvec_tobytes_spec _rp _b_rp _a _b_a).
proof.
rewrite /__i_polyvec_tobytes_spec .
proc; auto .
while ((valid trace___i_polyvec_tobytes) /\ 0<=i /\ i<=4 /\ BArray1536.is_init b_rp 0 (i*384) /\ BArray2048.is_init b_a 0 2048).
auto .
ecall (_poly_tobytes_proof param_0 b_param_0 param b_param).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat SBArray2048_512.SBArray2048_512.is_init_cell_get SBArray2048_512.SBArray2048_512.is_init_cell_set  BArray384.init_arrP BArray512.init_arrP  SBArray1536_384.SBArray1536_384.is_init_cell_set).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat).
qed .

lemma __i_polyvec_compress_proof _rp _b_rp _a _b_a :
      (__i_polyvec_compress_spec _rp _b_rp _a _b_a).
proof.
rewrite /__i_polyvec_compress_spec .
proc;auto.
while ((valid trace___i_polyvec_compress) /\ 0<=i<=1024 /\ BArray1408.is_init b_rp 0 j /\ j = (i%/8)*11 /\ i%%8 = 0).
auto .
while ((valid trace___i_polyvec_compress) /\ 0<=k<=8 /\ BArray16.is_init b_t 0 (k*2) /\ 0<=i<=1016).
auto .
rewrite /is_init /valid /= => &m /> *. rewrite !all_cat /=. smt().
auto .
rewrite /is_init /valid /= => &m /> *.
split. smt().
move => *. rewrite !List.all_cat /=. smt().
auto .
ecall (__polyvec_csubq_proof param (BArray2048.init_arr (W8.of_int 255))).
auto .
rewrite /is_init /valid /= => &m /> *. split. smt(BArray2048.init_arrP).
move => *.  smt (List.all_cat BArray2048.init_arrP).
qed .


lemma __i_polyvec_decompress_proof _rp _b_rp _ap _b_ap :
      (__i_polyvec_decompress_spec _rp _b_rp _ap _b_ap).
proof.
rewrite /__i_polyvec_decompress_spec .
proc; auto .
while ((valid trace___i_polyvec_decompress) /\ 0<=i<=1024 /\ i%%8 = 0 /\ j = (i%/8)*11 /\ BArray2048.is_init b_rp 0 (2*i)).
auto .
rewrite /is_init /valid /= => &m /> *. rewrite !all_cat /=. split. smt(). smt().
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat).
qed .

lemma __rej_uniform_proof _rp _b_rp _offset _buf _b_buf :
      (__rej_uniform_spec _rp _b_rp _offset _buf _b_buf).
proof.
rewrite /__rej_uniform_spec .
  proc; auto .
  while ((valid trace___rej_uniform) /\ BArray512.is_init b_rp 0 (2*ctr) /\ 0<=_offset <= ctr /\ 2*ctr <= 18446744073709551615 /\ 0<=pos /\ cond = pos < 166 /\ pos%%3 = 0).
  + sp 2.
    if. auto.
    + rewrite /is_init /valid /= => &m /> *.
      rewrite !ultE /=. rewrite /(`<<`)  /(`>>`) /=. rewrite /(`<<<`) /(`>>>`).  split.  move => *.  rewrite !List.all_cat /=. split. move => *. split. move => *.  smt(). smt(). smt(). 
      rewrite !all_cat /=. smt().
    by auto. 
  auto .
  rewrite /is_init /valid /= => &m /> *. smt().  
qed .


lemma __gen_matrix_proof _seed _b_seed _transposed :
      (__gen_matrix_spec _seed _b_seed _transposed).
proof.
rewrite /__gen_matrix_spec .
proc; auto .
  while ((valid trace___gen_matrix) /\ 0<=i<=4 /\ BArray8192.is_init b_r 0 (i*2048) /\ BArray34.is_init b_extseed 0 32).
  + auto .
    while ((valid trace___gen_matrix) /\ 0<=i<4 /\ 0<=j<=4 /\ BArray8192.is_init b_r 0 (2 * (i * 1024 + j * 256))  /\ BArray34.is_init b_extseed 0 32 ).
    + auto .
      while ((valid trace___gen_matrix) /\ 0<=to_uint k<= 256 /\ BArray512.is_init b_rij 0 (2* to_uint k) /\ BArray512.is_init b_poly 0 512).
      + auto .
        rewrite /is_init /valid /= => &m /> 4?.
        rewrite !ultE /= => *. rewrite !List.all_cat /=. rewrite !to_uintD_small /=; smt(). 
      auto .
      while ((valid trace___gen_matrix) /\ 0<=ctr /\ BArray512.is_init b_poly 0 (2*ctr)).
      + auto .
        ecall (__rej_uniform_proof param_5 b_param param_4 param_3  (BArray168.init_arr (W8.of_int 255))).
        auto .
        ecall (_shake128_squeezeblock_proof param_2 (BArray200.init_arr (W8.of_int 255)) param_1 b_param_0).
        auto .
        rewrite /is_init /valid /= => &m /> *.
        split.  smt(BArray200.init_arrP).
        move => *. split.  smt(BArray168.init_arrP).
        move => *. rewrite !all_cat /=. smt().
      auto.
      ecall (_shake128_absorb34_proof param_0 b_param_2 param b_param_1).
      auto .
      rewrite /is_init /valid /= => &m /> *.
      split. move => *.
      + split. smt().   
        move => *. split. smt(all_cat).
        move => *. split. smt(all_cat).
        move => 3?. rewrite !ultE /= => *. smt(all_cat SBArray8192_512.SBArray8192_512.is_init_cell_set).
      move => *. split. smt().
      move => *. split.  smt(all_cat).
      move => *. split. smt(all_cat).
      move => 3?. rewrite !ultE /= => *. smt(all_cat SBArray8192_512.SBArray8192_512.is_init_cell_set).
    auto .
    rewrite /is_init /valid /=.
    smt (List.all_cat).
  auto .
  while ((valid trace___gen_matrix) /\ 0<=j<=32 /\ BArray34.is_init b_extseed 0 j).
  auto .
  rewrite /is_init /valid /=.
  smt (List.all_cat).
  auto .
  rewrite /is_init /valid /= .
  smt (List.all_cat).
qed .

lemma __indcpa_keypair_proof _pk _b_pk _sk _b_sk _randomnessp _b_randomnessp :
      (__indcpa_keypair_spec _pk _b_pk _sk _b_sk _randomnessp _b_randomnessp).
proof.
rewrite /__indcpa_keypair_spec .
proc; auto .
while ((valid trace___indcpa_keypair) /\ 0<=i /\ i<=4 /\ BArray32.is_init b_publicseed 0 32 /\ BArray1568.is_init b_pk 0 ((i + 192)*8)).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat).
auto .
ecall (__i_polyvec_tobytes_proof param_20 b_param param_19 (
                                                           BArray2048.init_arr
                                                           (W8.of_int 255))).
auto .
ecall (__i_polyvec_tobytes_proof param_18 b_param_0 param_17 (
                                                             BArray2048.init_arr
                                                             (W8.of_int 255))).
auto .
ecall (__polyvec_reduce_proof param_16 (BArray2048.init_arr (W8.of_int 255))).
auto .
ecall (__polyvec_add2_proof param_15 b_param_1 param_14 (BArray2048.init_arr
                                                        (W8.of_int 255))).
auto .
while ((valid trace___indcpa_keypair) /\  BArray32.is_init b_publicseed 0 32 /\ BArray2048.is_init b_pkpv 0 (i*512) /\ 0<=i /\ i<=4 /\ BArray8192.is_init b_aa 0 8192).
auto .
ecall (_poly_frommont_proof param_13 b_param_2).
auto .
ecall (__polyvec_pointwise_acc_proof param_12 b_param_3 param_11 (
                                                                 BArray2048.init_arr
                                                                 (W8.of_int
                                                                 255))).
auto .
rewrite /is_init /valid /= => &m /> *.
split. smt(BArray2048.init_arrP SBArray8192_2048.SBArray8192_2048.is_init_cell_get). move => *.
smt(SBArray2048_512.SBArray2048_512.is_init_cell_get SBArray2048_512.SBArray2048_512.is_init_cell_set BArray512.init_arrP all_cat). 
auto .
ecall (__polyvec_ntt_proof param_10 b_param_4).
auto .
ecall (__polyvec_ntt_proof param_9 b_param_5).
auto .
while((valid trace___indcpa_keypair) /\ 0<=i /\ i<=4 /\ BArray32.is_init b_noiseseed 0 32 /\ BArray32.is_init b_publicseed 0 32 /\ BArray2048.is_init b_e 0 (2*256*i) /\ BArray2048.is_init b_skpv 0 2048).
auto. 
ecall (_poly_getnoise_proof param_8 b_param_7 param_7 b_param_6 param_6).
auto. 
rewrite /is_init /valid /= => &m /> *. 
smt(all_cat BArray512.init_arrP SBArray2048_512.SBArray2048_512.is_init_cell_set).
auto. 
while ((valid trace___indcpa_keypair) /\ 0<=i /\ i<=4 /\  BArray32.is_init b_noiseseed 0 32 /\ BArray32.is_init b_publicseed 0 32  /\ BArray2048.is_init b_skpv  0 (i*2*256)).
auto.
ecall (_poly_getnoise_proof param_5 b_param_9 param_4 b_param_8 param_3).
auto.                                                              
rewrite /is_init /valid /= => &m /> *. 
smt(all_cat BArray512.init_arrP SBArray2048_512.SBArray2048_512.is_init_cell_set).
auto.
ecall (__gen_matrix_proof param_2 b_param_10 param_1).
auto .
while ((valid trace___indcpa_keypair) /\ 0<=i /\ i<=4 /\ BArray32.is_init b_publicseed 0 (i*8) /\ BArray32.is_init b_noiseseed 0 (i*8)).
auto .                                                           
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (_sha3_512A_A33_proof param_0 b_param_12 param b_param_11).
auto . 
while ((valid trace___indcpa_keypair) /\ 0<=i /\ i<=4 /\ BArray33.is_init b_inbuf 0 (8*i)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= => &m /> *.
split. smt().
move => *. split. smt().
move => *. split.  smt(all_cat).
move => *. split. smt().
move => *. split. smt(all_cat).
move => *. split. smt().
move => *. split. smt().
move => *. split. smt(all_cat BArray8192.init_arrP).
move => *. split.  smt(BArray2048.init_arrP).
move => *. split. smt(all_cat BArray1536.init_arrP SBArray1568_1536.SBArray1568_1536.is_init_cell_set).
move => *. smt(BArray1536.init_arrP).
qed .

lemma __indcpa_enc_proof _ct _b_ct _msgp _b_msgp _pk _b_pk _noiseseed _b_noiseseed :
      (__indcpa_enc_spec _ct _b_ct _msgp _b_msgp _pk _b_pk _noiseseed
      _b_noiseseed).
proof.
rewrite /__indcpa_enc_spec .
proc; auto .
ecall (_i_poly_compress_proof param_31 b_param param_30 (BArray512.init_arr
                                                        (W8.of_int 255))).
auto .
ecall (__i_polyvec_compress_proof param_29 b_param_0 param_28 (
                                                              BArray2048.init_arr
                                                              (W8.of_int 255)
                                                              )).
auto .
ecall (__poly_reduce_proof param_27 (BArray512.init_arr (W8.of_int 255))).
auto .
ecall (__polyvec_reduce_proof param_26 (BArray2048.init_arr (W8.of_int 255))).
auto .
ecall (_poly_add2_proof param_25 (BArray512.init_arr (W8.of_int 255)) 
       param_24 (BArray512.init_arr (W8.of_int 255))).
auto .
ecall (_poly_add2_proof param_23 (BArray512.init_arr (W8.of_int 255)) 
       param_22 (BArray512.init_arr (W8.of_int 255))).
auto .
ecall (__polyvec_add2_proof param_21 (BArray2048.init_arr (W8.of_int 255)) 
       param_20 b_param_1).
auto .
ecall (_poly_invntt_proof param_19 (BArray512.init_arr (W8.of_int 255))).
auto .
ecall (__polyvec_invntt_proof param_18 b_param_2).
auto .
ecall (__polyvec_pointwise_acc_proof param_17 (BArray2048.init_arr
                                              (W8.of_int 255)) param_16 
       (BArray2048.init_arr (W8.of_int 255))).
auto .
while ((valid trace___indcpa_enc) /\  0<=w /\ w<=4 /\ BArray2048.is_init b_bp 0 (w*512) /\ BArray8192.is_init b_aat 0 8192).
auto .
ecall (__polyvec_pointwise_acc_proof param_15 b_param_3 param_14 (
                                                                 BArray2048.init_arr
                                                                 (W8.of_int
                                                                 255))).
auto .
rewrite /is_init /valid /= => &m /> *.
split. smt(BArray2048.init_arrP SBArray8192_2048.SBArray8192_2048.is_init_cell_get). move => *.
smt(all_cat SBArray2048_512.SBArray2048_512.is_init_cell_set BArray512.init_arrP).
auto .
ecall (__polyvec_ntt_proof param_13 b_param_4).
auto .
ecall (_poly_getnoise_proof param_12 b_param_5 param_11 (BArray32.init_arr
                                                        (W8.of_int 255)) 
       param_10).
auto .
while ((valid trace___indcpa_enc) /\ 0<=w<=4 /\ BArray2048.is_init b_ep 0 (512*w)).
auto .
ecall (_poly_getnoise_proof param_9 b_param_6 param_8 (BArray32.init_arr
                                                      (W8.of_int 255)) 
       param_7).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray32.init_arrP BArray512.init_arrP SBArray2048_512.SBArray2048_512.is_init_cell_set).
auto .
while ((valid trace___indcpa_enc) /\ 0<=w<=4 /\ BArray2048.is_init b_sp 0 (512*w)).
auto .
ecall (_poly_getnoise_proof param_6 b_param_7 param_5 (BArray32.init_arr
                                                      (W8.of_int 255)) 
       param_4).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray32.init_arrP BArray512.init_arrP SBArray2048_512.SBArray2048_512.is_init_cell_set).
auto .
ecall (__gen_matrix_proof param_3 b_param_8 param_2).
auto .
ecall (_i_poly_frommsg_proof param_1 b_param_9 param_0 (BArray32.init_arr
                                                       (W8.of_int 255))).
auto .
while ((valid trace___indcpa_enc) /\  0<=w /\  w <= 4 /\ BArray32.is_init b_publicseed 0 (8*w)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (__i_polyvec_frombytes_proof param b_param_10).
auto .
rewrite /is_init /valid /= => &m /> *.
split.  smt(SBArray1568_1536.SBArray1568_1536.is_init_cell_get).
move => *. split. smt(all_cat).
move => *. split. smt(BArray32.init_arrP).
move => *. split. smt().
move => *. split. smt(all_cat).
move => *. split. smt(). 
move => *. split. smt().
move => *. split. smt(all_cat BArray8192.init_arrP).
move => *. split. smt(BArray2048.init_arrP).
move => *. split. smt().
move => *. split. smt(BArray512.init_arrP).
move => *. split. smt().
move => *. smt(all_cat BArray160.init_arrP BArray1408.init_arrP SBArray1568_1408.SBArray1568_1408.is_init_cell_set SBArray1568_160.SBArray1568_160.is_init_cell_set).
qed .

lemma __indcpa_dec_proof _msgp _b_msgp _ct _b_ct _sk _b_sk :
      (__indcpa_dec_spec _msgp _b_msgp _ct _b_ct _sk _b_sk).
proof.
rewrite /__indcpa_dec_spec .
proc; auto .
ecall (_i_poly_tomsg_proof param_13 b_param param_12 (BArray512.init_arr
                                                     (W8.of_int 255))).
auto .
ecall (__poly_reduce_proof param_11 (BArray512.init_arr (W8.of_int 255))).
auto .
ecall (_poly_sub_proof param_10 b_param_0 param_9 (BArray512.init_arr
                                                  (W8.of_int 255)) param_8 
       (BArray512.init_arr (W8.of_int 255))).
auto .
ecall (_poly_invntt_proof param_7 (BArray512.init_arr (W8.of_int 255))).
auto .
ecall (__polyvec_pointwise_acc_proof param_6 (BArray2048.init_arr
                                             (W8.of_int 255)) param_5 
       (BArray2048.init_arr (W8.of_int 255))).
auto .
ecall (__polyvec_ntt_proof param_4 (BArray2048.init_arr (W8.of_int 255))).
auto .
ecall (__i_polyvec_frombytes_proof param_3 (BArray1536.init_arr
                                           (W8.of_int 255))).
auto .
ecall (_i_poly_decompress_proof param_2 b_param_2 param_1 b_param_1).
auto .
ecall (__i_polyvec_decompress_proof param_0 b_param_4 param b_param_3).
auto .
rewrite /is_init /valid /= => &m /> *.
split.  smt(SBArray1568_1408.SBArray1568_1408.is_init_cell_get).
move => *. split. smt(SBArray1568_160.SBArray1568_160.is_init_cell_get).
move => *. split. smt(BArray1536.init_arrP).
move => *. split. smt(BArray2048.init_arrP).
move => *. smt(BArray512.init_arrP BArray32.init_arrP all_cat).
qed .

lemma __verify_proof _ctp _b_ctp _ctpc _b_ctpc :
      (__verify_spec _ctp _b_ctp _ctpc _b_ctpc).
proof.
rewrite /__verify_spec .
proc; auto .
while ((valid trace___verify) /\ 0<=i).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
by auto .
qed .

lemma __cmov_proof _dst _b_dst _src _b_src _cnd :
      (__cmov_spec _dst _b_dst _src _b_src _cnd).
proof.
rewrite /__cmov_spec .
proc; auto .
while ((valid trace___cmov) /\ 0<=i).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= .
smt (BArray32.init_arrP).
qed .

lemma __crypto_kem_keypair_jazz_proof _pk _b_pk _sk _b_sk _randomnessp _b_randomnessp :
      (__crypto_kem_keypair_jazz_spec _pk _b_pk _sk _b_sk _randomnessp
      _b_randomnessp).
proof.
rewrite /__crypto_kem_keypair_jazz_spec .
proc; auto .
while ((valid trace___crypto_kem_keypair_jazz) /\ 0<=i /\ i<=4 /\ BArray3168.is_init b_sk 0 ((392+i) *8) /\ BArray32.is_init b_randomnessp2 0 32).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
while ((valid trace___crypto_kem_keypair_jazz) /\ 0<=i /\ i<=4  /\ BArray3168.is_init b_sk 0 ((388+ i) *8)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (_sha3_256A_A1568_proof param_3 b_param param_2 (BArray1568.init_arr
                                                      (W8.of_int 255))).
auto .
while ((valid trace___crypto_kem_keypair_jazz) /\ 0<=i /\ i<=196 /\ BArray3168.is_init b_sk 0 ((192 + i) *8)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (__indcpa_keypair_proof param_1 b_param_2 param_0 b_param_1 param 
       b_param_0).
auto .
rewrite /is_init /valid /= => &m /> *.
split. smt(SBArray64_32.SBArray64_32.is_init_cell_get).
move => *. split. smt(all_cat BArray1536.init_arrP SBArray3168_1536.SBArray3168_1536.is_init_cell_set).
move => *. smt(BArray1568.init_arrP all_cat BArray64.init_arrP SBArray64_32.SBArray64_32.is_init_cell_get).
qed .

lemma __crypto_kem_enc_jazz_proof _ct _b_ct _shk _b_shk _pk _b_pk _randomnessp _b_randomnessp :
      (__crypto_kem_enc_jazz_spec _ct _b_ct _shk _b_shk _pk _b_pk
      _randomnessp _b_randomnessp).
proof.
rewrite /__crypto_kem_enc_jazz_spec .
proc; auto .
while ((valid trace___crypto_kem_enc_jazz) /\ 0<=i<=4 /\ BArray32.is_init b_shk 0 (i*8)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (__indcpa_enc_proof param_6 b_param_1 param_5 b_param_0 param_4 
       (BArray1568.init_arr (W8.of_int 255)) param_3 b_param).
auto .
ecall (_sha3_512A_A64_proof param_2 b_param_3 param_1 b_param_2).
auto .
ecall (_sha3_256A_A1568_proof param_0 b_param_4 param (BArray1568.init_arr
                                                      (W8.of_int 255))).
auto .
while ((valid trace___crypto_kem_enc_jazz) /\  0<=i<=4 /\ BArray64.is_init b_buf 0 (i*8)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
rewrite /is_init /valid /= => &m /> *.
smt (List.all_cat BArray1568.init_arrP BArray32.init_arrP BArray64.init_arrP SBArray64_32.SBArray64_32.is_init_cell_get SBArray64_32.SBArray64_32.is_init_cell_set).
qed .

lemma __crypto_kem_dec_jazz_proof _shk _b_shk _ct _b_ct _sk _b_sk :
      (__crypto_kem_dec_jazz_spec _shk _b_shk _ct _b_ct _sk _b_sk).
proof.
rewrite /__crypto_kem_dec_jazz_spec .
proc; auto .
ecall (__cmov_proof param_15 (BArray32.init_arr (W8.of_int 255)) param_14 
       b_param param_13).
auto .
ecall (_shake256_A32__A1600_proof param_12 b_param_1 param_11 b_param_0 
       param_10 (BArray1568.init_arr (W8.of_int 255))).
auto .
ecall (__verify_proof param_9 (BArray1568.init_arr (W8.of_int 255)) param_8 
       (BArray1568.init_arr (W8.of_int 255))).
auto .
ecall (__indcpa_enc_proof param_7 b_param_5 param_6 b_param_4 param_5 
       b_param_3 param_4 b_param_2).
auto .
ecall (_sha3_512A_A64_proof param_3 b_param_7 param_2 b_param_6).
auto .
while ((valid trace___crypto_kem_dec_jazz) /\ 0<=i<=4 /\ BArray64.is_init b_buf 0 ((i+4)*8)).
auto .
rewrite /is_init /valid /=.
smt (List.all_cat).
auto .
ecall (__indcpa_dec_proof param_1 b_param_9 param_0 (BArray1568.init_arr
                                                    (W8.of_int 255)) 
       param b_param_8).
auto .
rewrite /is_init /valid /= => &m /> *.
split. smt(BArray1568.init_arrP BArray3168.init_arrP SBArray3168_1536.SBArray3168_1536.is_init_cell_get).
move => *.  split. smt(all_cat BArray32.init_arrP SBArray64_32.SBArray64_32.is_init_cell_set).
move => *.  split. smt().
move => *. split. smt(BArray64.init_arrP BArray3168.init_arrP SBArray64_32.SBArray64_32.is_init_cell_get SBArray3168_1568.SBArray3168_1568.is_init_cell_get).
move => *. split. smt(BArray3168.init_arrP SBArray3168_32.SBArray3168_32.is_init_cell_get).
move => *. smt(all_cat BArray32.init_arrP BArray64.init_arrP SBArray64_32.SBArray64_32.is_init_cell_get).
qed .

lemma jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand_proof _public_key _b_public_key _secret_key _b_secret_key _coins _b_coins :
      (jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand_spec _public_key
      _b_public_key _secret_key _b_secret_key _coins _b_coins).
proof.
rewrite /jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand_spec .
proc; auto .
ecall (__crypto_kem_keypair_jazz_proof param_1 b_param_0 param_0 b_param 
       param (BArray64.init_arr (W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray1568.init_arrP BArray64.init_arrP BArray3168.init_arrP).
qed .

lemma jade_kem_mlkem_mlkem1024_amd64_ref_keypair_proof _public_key _b_public_key _secret_key _b_secret_key :
      (jade_kem_mlkem_mlkem1024_amd64_ref_keypair_spec _public_key
      _b_public_key _secret_key _b_secret_key).
proof.
rewrite /jade_kem_mlkem_mlkem1024_amd64_ref_keypair_spec .
proc; auto .
ecall (jade_kem_mlkem_mlkem1024_amd64_ref_keypair_derand_proof param_1 
       b_param_0 param_0 b_param param (BArray64.init_arr (W8.of_int 255))).
auto . inline. auto.
rewrite /is_init /valid /= .
smt (List.all_cat BArray3168.init_arrP BArray1568.init_arrP BArray64.init_arrP).
qed .

lemma jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand_proof _ciphertext _b_ciphertext _shared_secret _b_shared_secret _public_key _b_public_key _coins _b_coins :
      (jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand_spec _ciphertext
      _b_ciphertext _shared_secret _b_shared_secret _public_key _b_public_key
      _coins _b_coins).
proof.
rewrite /jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand_spec .
proc; auto .
ecall (__crypto_kem_enc_jazz_proof param_2 b_param_0 param_1 b_param 
       param_0 (BArray1568.init_arr (W8.of_int 255)) param (BArray32.init_arr
                                                           (W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray32.init_arrP BArray1568.init_arrP).
qed .

lemma jade_kem_mlkem_mlkem1024_amd64_ref_enc_proof _ciphertext _b_ciphertext _shared_secret _b_shared_secret _public_key _b_public_key :
      (jade_kem_mlkem_mlkem1024_amd64_ref_enc_spec _ciphertext _b_ciphertext
      _shared_secret _b_shared_secret _public_key _b_public_key).
proof.
rewrite /jade_kem_mlkem_mlkem1024_amd64_ref_enc_spec .
proc; auto .
ecall (jade_kem_mlkem_mlkem1024_amd64_ref_enc_derand_proof param_2 b_param_0 
       param_1 b_param param_0 (BArray1568.init_arr (W8.of_int 255)) 
       param (BArray32.init_arr (W8.of_int 255))).
auto . inline. auto.
rewrite /is_init /valid /= .
smt (List.all_cat BArray1568.init_arrP BArray32.init_arrP).
qed .

lemma jade_kem_mlkem_mlkem1024_amd64_ref_dec_proof _shared_secret _b_shared_secret _ciphertext _b_ciphertext _secret_key _b_secret_key :
      (jade_kem_mlkem_mlkem1024_amd64_ref_dec_spec _shared_secret
      _b_shared_secret _ciphertext _b_ciphertext _secret_key _b_secret_key).
proof.
rewrite /jade_kem_mlkem_mlkem1024_amd64_ref_dec_spec .
proc; auto .
ecall (__crypto_kem_dec_jazz_proof param_1 b_param param_0 (
                                                           BArray1568.init_arr
                                                           (W8.of_int 255)) 
       param (BArray3168.init_arr (W8.of_int 255))).
auto .
rewrite /is_init /valid /= .
smt (List.all_cat BArray1568.init_arrP BArray3168.init_arrP BArray32.init_arrP).
qed .
