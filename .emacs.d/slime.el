(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;; Slime
(load-if-exists "~/.quicklisp/slime-helper.el")
(load-if-exists "~/.quicklisp/log4slime-setup.el")

;; (setq slime-lisp-implementations
;;       '((sbcl ("sbcl"))))

;; (require 'slime)
;; (slime-setup '(slime-fancy ac-slime))
