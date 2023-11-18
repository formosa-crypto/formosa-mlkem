((easycrypt-mode .
  ((eval .
    (cl-flet ((pre (s) (concat (locate-dominating-file buffer-file-name ".dir-locals.el") s)))
           (setq easycrypt-load-path `(,(pre ".") ,
                (pre "../../crypto-specs/common/"), 
                (pre "../../crypto-specs/kyber768/"), 
                (pre "../../crypto-specs/kyber768/properties"), 
            (pre "../../code/jasmin/ref/extraction"), 
            (pre "../../code/jasmin/avx2v/extraction"), 
             (pre "../security"), (pre "../eclib")
             )))))))
