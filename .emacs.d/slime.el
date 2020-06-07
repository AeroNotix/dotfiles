;; (add-hook 'slime-mode-hook 'set-up-slime-ac)
;; (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'slime-repl-mode))

;; (defun load-if-exists-p (path)
;;   (let ((e-path (expand-file-name path)))
;;     (when (file-exists-p e-path)
;;       (load e-path))))

;; ;; Slime
;; (load-if-exists-p "~/.quicklisp/slime-helper.el")
;; (load-if-exists-p "~/.quicklisp/log4slime-setup.el")

;; (setq slime-lisp-implementations
;;       '((sbcl ("sbcl"))))

;; (require 'slime)
;; (slime-setup '(slime-fancy ac-slime))
