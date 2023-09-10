((easycrypt-mode .
  ((eval .
    (cl-flet ((pre (s) (concat (locate-dominating-file buffer-file-name ".dir-locals.el") s)))
           (setq easycrypt-load-path `(,(pre ".") ,
                (pre "../spec"), (pre "../../sha3/proof/"),
            (pre "../../code/jasmin/ref/extraction"), 
            (pre "../../code/jasmin/avx2v/extraction"), 
             (pre "../security"), (pre "../eclib"), 
             )))))))
