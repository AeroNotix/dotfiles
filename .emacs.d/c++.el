(c-add-style "my-style"
             '("stroustrup"
               (c-basic-offset . 4)))

(defun my-c++-mode-hook ()
  (c-set-style "my-style"))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c++-mode-hook)

;; Slime
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq slime-lisp-implementations
      '((sbcl ("sbcl"))))

(require 'slime)
(slime-setup '(slime-fancy ac-slime))
