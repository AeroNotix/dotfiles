;; Change customize configuration location

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load-file "~/.emacs.d/opinions.el")
(load-file "~/.emacs.d/package.el")
(load-file "~/.emacs.d/flymake.el")
(load-file "~/.emacs.d/go.el")
(load-file "~/.emacs.d/erlang.el")
(load-file "~/.emacs.d/c++.el")
(load-file "~/.emacs.d/python.el")
(load-file "~/.emacs.d/save-hist.el")
(load-file "~/.emacs.d/ocaml.el")
(load-file "~/.emacs.d/haskell.el")
(load-file "~/.emacs.d/local-funs.el")
(load-file "~/.emacs.d/keybinds.el")
(load-file "~/.quicklisp/slime-helper.el")
(load-file "~/.emacs.d/markdown.el")
(load-file "~/.emacs.d/hippie.el")
(load-file "~/.emacs.d/rust.el")
