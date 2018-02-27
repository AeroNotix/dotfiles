(require 'clj-refactor)
(require 'clojure-mode-extra-font-locking)
(add-hook 'clojure-mode-hook (lambda ()
                               (hl-sexp-mode 1)
                               (yas/minor-mode 1)
                               (flymake-mode-on)
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-x C-a")))
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))
;(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq clojure-defun-style-default-indent t)
(setq nrepl-hide-special-buffers t)
(setq cider-auto-select-error-buffer nil)
(setq cider-repl-result-prefix ";; => ")
(setq cider-repl-history-size 100000000)
(setq cider-repl-history-file "~/.cider-repl-history")
(add-to-list 'cljr-magic-require-namespaces
             '("json" . "clojure.data.json"))
(add-to-list 'cljr-magic-require-namespaces
             '("component" . "com.stuartsierra.component"))
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook
          (lambda () (setq show-trailing-whitespace nil)))
(eval-after-load 'cider
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))
(add-to-list 'auto-mode-alist
             '("\\.clj\\'" . clojure-mode))
