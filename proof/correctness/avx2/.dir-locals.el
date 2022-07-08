((easycrypt-mode .
  ((eval .
    (cl-flet ((pre (s) (concat (locate-dominating-file buffer-file-name ".dir-locals.el") s)))
           (setq easycrypt-load-path `(, (pre "."), (pre "./extraction"), (pre "../extraction"), (pre ".."), (pre "../../security"), (pre "../../spec"), (pre "../../eclib"))))))))
