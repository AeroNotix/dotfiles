
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
(setq merlin-command "ocamlmerlin")  ; needed only if ocamlmerlin not already in your PATH
(add-hook 'caml-mode-hook #'merlin-mode)
(add-hook 'tuareg-mode-hook #'merlin-mode)
(autoload 'merlin-mode "merlin" "Merlin mode" t)
(load-file "~/.emacs.d/ocp-indent.el")
