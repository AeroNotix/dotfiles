(defun aero-ts-enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a
cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
          (funcall (cdr my-pair)))))

(add-hook 'typescript-mode-hook #'(lambda ()
                            (aero-ts-enable-minor-mode
                             '("\\.ts?\\'" . prettier-js-mode))))

(add-hook 'typescript-mode-hook
          (lambda ()
            (make-local-variable 'tab-width)
            (setq-local tab-width 2)))
(add-hook 'typescript-mode-hook #'lsp-deferred)
