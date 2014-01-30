(global-unset-key (kbd "<menu>"))
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-w"))

(global-set-key (kbd "RET")             'newline-and-indent)
(global-set-key (kbd "C-x g")           'magit-status)
(global-set-key (kbd "C-x q")           'jump-to-config-file)
(global-set-key (kbd "C-<space>")       'set-mark-command)
(global-set-key (kbd "C-c C-x")         'query-replace)
(global-set-key (kbd "<menu>")          'idomenu)
(global-set-key (kbd "C-x C-w")         'cider-eval-last-sexp-and-replace)
(global-set-key (kbd "C-{")             'flymake-display-err-menu-for-current-line)
(global-set-key (kbd "M-x")             'smex)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)
