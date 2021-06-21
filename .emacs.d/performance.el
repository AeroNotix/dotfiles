;; Memory
(setq gc-cons-threshold most-positive-fixnum)
(setq read-process-output-max (* 1024 10240)) ;; 10mb
(setq lsp-completion-provider :capf)
(setq lsp-idle-delay 0.500)
