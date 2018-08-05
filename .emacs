(package-initialize)

;; Change customize configuration location
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(defmacro with-directory (where &rest body)
  (let ((sym (make-symbol "dd")))
    `(let ((,sym default-directory))
       (unwind-protect
           (progn
             (cd ,where)
             ,@body)
         (cd ,sym)))))

(with-directory "~/.emacs.d/"
  (load-file "c++.el")
  (load-file "erlang.el")
  (load-file "elisp.el")
  (load-file "flymake.el")
  (load-file "go.el")
  (load-file "haskell.el")
  (load-file "hippie.el")
  (load-file "keybinds.el")
  (load-file "local-funs.el")
  (load-file "markdown.el")
  (load-file "ocaml.el")
  (load-file "opinions.el")
  (load-file "package.el")
  (load-file "python.el")
  (load-file "rust.el")
  (load-file "save-hist.el"))

(when (file-exists-p "~/.quicklisp/slime-helper.el")
  (load-file "~/.quicklisp/slime-helper.el"))

(cd (getenv "HOME"))
