;;; ASM mode has an incredibly stupid set of ideas arround indention,
;;; lets just deal with indentation ourselves?
(define-key asm-mode-map (kbd "<return>") 'newline)
