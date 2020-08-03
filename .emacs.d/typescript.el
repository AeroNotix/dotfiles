(defun aero-ts-enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a
cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
          (funcall (cdr my-pair)))))

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-hook 'typescript-mode-hook
          (lambda ()
            (make-local-variable 'tab-width)
            (setq-local tab-width 2)))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically
        '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(setq company-tooltip-align-annotations t)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(add-hook 'tide-mode-hook
          (lambda ()
            (local-set-key (kbd "M-.") 'tide-jump-to-definition)))

(global-prettier-mode)
