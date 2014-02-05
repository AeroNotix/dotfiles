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
(global-set-key (kbd "<f7>")            'previous-buffer)
(global-set-key (kbd "<f8>")            'next-buffer)


;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)


;; Clojure

(define-key clj-refactor-map (kbd "C-c s") 'cljr-sort-ns)

;; Y-or-N everywhere.
(defalias 'yes-or-no-p 'y-or-n-p)