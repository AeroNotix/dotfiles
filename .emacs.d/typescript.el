(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

;; typescript-mode enables tide-mode
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; override the default M-. function, in favour of the tide version
(add-hook 'tide-mode-hook
          (lambda ()
            (local-set-key (kbd "M-.") 'tide-jump-to-definition)))
