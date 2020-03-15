(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'indent-tabs-mode)
            (make-local-variable 'js-indent-level)
            (setq indent-tabs-mode t)))
