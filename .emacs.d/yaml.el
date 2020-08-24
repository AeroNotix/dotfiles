(load-file "~/.emacs.d/libyaml-core.so")
(load-file "~/.emacs.d/libyaml.el")
(add-hook 'yaml-mode-hook #'lsp-deferred)
