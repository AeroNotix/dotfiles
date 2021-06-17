(when-file-exists "~/.emacs.d/libyaml-core.so"
                  (ignore-errors
                    (progn
                      (load-file "~/.emacs.d/libyaml-core.so")
                      (load-file "~/.emacs.d/libyaml.el")
                      (add-hook 'yaml-mode-hook #'lsp-deferred))))
