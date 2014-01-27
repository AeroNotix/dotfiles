; EMACS CONFIGURATION FILE

(add-to-list 'load-path "~/.emacs.d/")
(let ((default-directory "~/.emacs.d/color-theme-6.6.0/"))
(normal-top-level-add-to-load-path '("."))
(normal-top-level-add-subdirs-to-load-path))

(setq tramp-default-method "scp")

;;; Get rid of that nasty bell noise
(setq visible-bell t)
;;; 10pt text
(set-face-attribute 'default nil :height 100)

;;; theming
(require 'color-theme)
(color-theme-initialize)
(color-theme-deep-blue)

;;; IDO
(require 'ido)
(ido-mode t)

;;;------------------Marmalade-------------------------------

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))


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

;;; Tab width to eight
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(global-unset-key (kbd "<menu>"))
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-w"))
(setq-default column-number-mode t)

 ;;; Show trailing whitespace
(setq-default show-trailing-whitespace t)

(defun jump-to-config-file ()
  (interactive)
  (find-file (expand-file-name "~/.emacs")))

;;; Custom kb shortcuts
(global-set-key (kbd "RET")             'newline-and-indent)
(global-set-key (kbd "<XF86Forward>")   'next-buffer)
(global-set-key (kbd "<XF86Back>")      'previous-buffer)
(global-set-key (kbd "C-x g")           'magit-status)
(global-set-key (kbd "C-x q")           'jump-to-config-file)
(global-set-key (kbd "C-h C-r")         'query-replace)
(global-set-key (kbd "C-<space>")       'set-mark-command)
(global-set-key (kbd "C-x C-c")         'elscreen-create)
(global-set-key (kbd "C-x c")           'elscreen-kill)
(global-set-key (kbd "<menu>")          'idomenu)
(global-set-key (kbd "C-x C-w")         'cider-eval-last-sexp-and-replace)
;;; Show matching paren highlighting
(show-paren-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(appmenu-mode t)
 '(column-number-mode t)
 '(emacsw32-max-frames t)
 '(emacsw32-style-frame-title t)
 '(hfyview-quick-print-in-files-menu t)
 '(inhibit-startup-screen t)
 '(menuacc-mode t)
 '(noprint-hide-print-in-menus t)
 '(noprint-hide-ps-print-in-menus t)
 '(ourcomments-ido-ctrl-tab t)
 '(py-pychecker-command-args (quote ("")))
 '(py-shell-name "python2")
 '(rebind-keys-mode t)
 '(recentf-mode t)
 '(scroll-bar-mode nil)
 '(sex-mode t)
 '(show-paren-mode t)
 '(tabkey2-mode t)
 '(tool-bar-mode nil nil (tool-bar))
 '(tooltip-mode nil)
 '(transient-mark-mode nil)
 '(w32-meta-style (quote emacs))
 '(w32shell-shell (quote cmd)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 98 :width normal))))
 '(error ((t (:foreground "orange red" :underline (:color "red" :style wave) :weight bold))))
 '(rst-level-1-face ((t (:background "slate blue"))) t)
 '(rst-level-2-face ((t (:background "midnight blue"))) t)
 '(trailing-whitespace ((t (:background "red")))))


;-----------------AUTOCOMPLETE-----------------------------------

(add-to-list 'load-path "~/.emacs.d/autocomplete") ;
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/autocomplete/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)

;;;---------------------flymake--------------------------------

(global-set-key (kbd "C-{") 'flymake-display-err-menu-for-current-line)

;;;---------------project modes--------------------------------

(add-to-list 'load-path "~/.emacs.d/eproject") ;
(require 'eproject)

 ;;; Set column width to 78 maximum in RST files
(add-hook 'rst-mode-hook
     '(lambda ()
	(setq-default fill-column 78)))

;;; ----------------Go-Modes---------------------------------

(add-to-list 'load-path "~/dev/go-mode.el/" t)
(autoload 'gofmt-before-save "go-mode" t nil)
(add-hook 'before-save-hook #'gofmt-before-save)
(require 'go-mode)
(add-to-list 'load-path "/home/xeno/dev/go/src/github.com/dougm/goflymake")

(add-hook 'go-mode-hook
	  '(lambda ()
	     (global-set-key (kbd "C-{") 'flymake-display-err-menu-for-current-line)))
(add-hook 'go-mode-hook
	  '(lambda ()
	     (global-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook
	  '(lambda ()
	     (global-set-key (kbd "C-c C-a") 'go-import-add)))
(require 'go-autocomplete)
(require 'go-flymake)

;;;-----------------Erlang Mode------------------------------

(add-to-list 'load-path "~/.emacs.d/erlang/")
(setq erlang-root-dir "/usr/local/lib/erlang")
(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))
(setq inferior-erlang-machine-options '("-sname" "emacs"))
(require 'erlang-start)
(setq auto-mode-alist (append auto-mode-alist
                              '(("\\.rel$"     . erlang-mode)
                                ("\\.app$"     . erlang-mode)
                                ("\\.appSrc$"  . erlang-mode)
                                ("\\.app.src$" . erlang-mode)
                                ("\\.hrl$"     . erlang-mode)
                                ("\\.erl$"     . erlang-mode)
                                ("\\.yrl$"     . erlang-mode)
                                ("rebar.confg" . erlang-mode)
                                ("relx.confg"  . erlang-mode))))

(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name temp-file
		(file-name-directory buffer-file-name))))
    (list "/usr/bin/syntaxerl" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-erlang-init))

;;;---------------------C++----------------------------------

(c-add-style "my-style"
	     '("stroustrup"
	       (c-basic-offset . 4)))

(defun my-c++-mode-hook ()
  (c-set-style "my-style"))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c++-mode-hook)

;; Slime
(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime)
(slime-setup '(slime-fancy))

(require 'git-gutter-fringe)
(setq git-gutter-fr:side 'right-fringe)
(setq-default left-fringe-width  0)
(setq-default right-fringe-width 15)
(define-globalized-minor-mode global-git-gutter-mode git-gutter-mode
  (lambda () (git-gutter-mode 1)))

(require 'fill-column-indicator)
(fci-mode)
(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda () (fci-mode 1)))

(global-fci-mode 1)

(powerline-default-theme)

;;;---------------------python------------------------------

(defun flymake-pylint-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "~/.emacs.d/epylint" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pylint-init))


;;;-------------------clojure-------------------------------

(add-hook 'clojure-mode-hook 'flymake-mode-on)
(require 'ac-nrepl)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
'(add-to-list 'ac-modes 'cider-repl-mode))

(load-file "~/.emacs.d/local-funs.el")
