(push "/usr/share/emacs/site-lisp" load-path)
(autoload 'merlin-mode "merlin" "Merlin mode" t)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(load-file "~/.emacs.d/ocp-indent.el")
