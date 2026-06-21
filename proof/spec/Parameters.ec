require import AllCore IntDiv List.

op kvec : int.  
op du   : int.  
op dv   : int.  
op eta1 : int.  
op eta2 : int.  

axiom param_sets :
  (kvec, du, dv, eta1, eta2) \in [ (3, 10, 4, 2, 2);   (* ML-KEM-768  *)
                                (4, 11, 5, 2, 2) ]. (* ML-KEM-1024 *)

theory MLKEMParams.

lemma gt0_k    : 0 < kvec by smt(param_sets).
lemma gt0_du   : 0 < du   by smt(param_sets).
lemma gt0_dv   : 0 < dv   by smt(param_sets).
lemma gt0_eta1 : 0 < eta1 by smt(param_sets).
lemma gt0_eta2 : 0 < eta2 by smt(param_sets).

lemma du_le12 : du <= 12 by smt(param_sets).
lemma dv_le12 : dv <= 12 by smt(param_sets).

end MLKEMParams.
