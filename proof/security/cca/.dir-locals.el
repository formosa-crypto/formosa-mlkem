((easycrypt-mode .
  ((eval .
    (cl-flet ((pre (s) (concat (locate-dominating-file buffer-file-name ".dir-locals.el") s)))
           (setq easycrypt-load-path `(,(pre ".") , 
            (pre "../"), (pre "../../../sha3/proof"), 
            (pre "../../../sha3/proof/smart_counter"))))))))
