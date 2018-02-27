(setq debug-on-error t)

;; Change customize configuration location
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Disable menu bar
(menu-bar-mode -1)

;; SCP is faster.
(setq tramp-default-method "scp")

;; {Down,Up}case region is pretty useful
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;;; it's easier this way
(setq user-mail-address "aaron.l.france@gmail.com")

;; Disabled *Completions*
(add-hook 'minibuffer-exit-hook
          '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
                    (kill-buffer buffer)))))

;; Whitespace killah
(setq-default indicate-empty-lines t)
(setq-default indicate-unused-lines t)
(setq whitespace-style '(face tabs empty trailing lines-tail))
(setq x-stretch-cursor t)

;; I like this scroll-left
(put 'scroll-left 'disabled nil)

(setq explicit-shell-file-name "/usr/bin/zsh")

;; Always follow vc links
(setq-default vc-follow-symlinks t)

;;; Get rid of that nasty bell noise
(setq visible-bell t)

;;; Scratch buffer STAFFU
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;;; theming
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-deep-blue)

;;; IDO
(require 'ido)
(ido-mode t)

;;; Hurr durr I can spelz
(setq-default flyspell-prog-mode t)

(eval-after-load 'rainbow-delimeters
  '(global-rainbow-delimiters-mode))



;;;------------------Package-------------------------------



;;; Set browser to Chrome
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")

 ;;; Line numbers on all the files!
(global-linum-mode t)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil) ;; for vertical windows

;;; Auto-Save mode, off.
(setq auto-save-mode nil)
(setq make-backup-files nil)

;;; Tab width to four.
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(setq-default column-number-mode t)

 ;;; Show trailing whitespace.
(setq-default show-trailing-whitespace t)

;;; Show matching paren highlighting
(show-paren-mode 1)
(setq show-paren-delay 0)

(setq default-frame-alist '((font . "Monaco-18")))

(load (expand-file-name "~/.emacs.d/package.el"))
;-----------------AUTOCOMPLETE-----------------------------------
;(load (expand-file-name "~/.emacs.d/autocomplete.el"))
;;;---------------------flymake--------------------------------
(load (expand-file-name "~/.emacs.d/flymake.el"))
;;; ----------------Go-Modes---------------------------------
(load (expand-file-name "~/.emacs.d/go.el"))
;;;-----------------Erlang Mode------------------------------
(load (expand-file-name "~/.emacs.d/erlang.el"))
;;;---------------------C++----------------------------------

(load (expand-file-name "~/.emacs.d/c++.el"))
;;;---------------------python------------------------------

(load (expand-file-name "~/.emacs.d/python.el"))
;;;-------------------clojure-------------------------------

;;(load (expand-file-name "~/.emacs.d/clojure.el"))
;;;------------------save history---------------------------

(load (expand-file-name "~/.emacs.d/save-hist.el"))

;;;-------------- OCaml -------------------------------------

(load (expand-file-name "~/.emacs.d/ocaml.el"))
;;;------------- Haskell ------------------------------------
(load (expand-file-name "~/.emacs.d/haskell.el"))
;;; Local
(load-file "~/.emacs.d/local-funs.el")
(load-file "~/.emacs.d/keybinds.el")

(load (expand-file-name "~/.quicklisp/slime-helper.el"))

;;;----------- Markdown --------------------------------------
(load (expand-file-name "~/.emacs.d/markdown.el"))
;; hippie

(load (expand-file-name "~/.emacs.d/hippie.el"))

(add-hook 'before-save-hook 'whitespace-cleanup)

;; Rust

(load (expand-file-name "~/.emacs.d/rust.el"))
