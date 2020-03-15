(setq debug-on-error nil)

;; Disable menu bar
(menu-bar-mode -1)
;; Disbale scroll bar
(scroll-bar-mode -1)

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
(load (expand-file-name "~/.emacs.d/themes.el"))
;;; IDO
(load (expand-file-name "~/.emacs.d/ido.el"))
;;; Hurr durr I can spelz
(setq-default flyspell-prog-mode t)

(eval-after-load 'rainbow-delimeters
  '(global-rainbow-delimiters-mode))

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

(add-hook 'before-save-hook 'whitespace-cleanup)

;; Memory
(setq gc-cons-threshold 200000000)
