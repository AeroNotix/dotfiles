;;; ASM mode has an incredibly stupid set of ideas arround indention,
;;; lets just deal with indentation ourselves?


(add-hook 'asm-mode-hook
          (lambda ()
            (electric-indent-local-mode -1)))
(define-key asm-mode-map (kbd "RET") 'newline)
