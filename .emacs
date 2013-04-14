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

 ;;; Vertical EOL indicator
(require 'fill-column-indicator)
(fci-mode)

;;; Tab width to four
(setq-default tab-width 4)

;;; Return will indent as well as give a new line.
(global-set-key (kbd "RET") 'newline-and-indent)
;;; Git overlay
(require 'git-overlay)

(setq-default column-number-mode t)

(define-globalized-minor-mode global-fci-mode fci-mode 
  (lambda () (fci-mode 1)))

(global-fci-mode 1)

 ;;; Show trailing whitespace
(setq-default show-trailing-whitespace t)

 ;;; Set mouse scrollers to change buffers
(global-set-key (kbd "<XF86Forward>") 'next-buffer)
(global-set-key (kbd "<XF86Back>") 'previous-buffer)

;;; Show matching paren highlighting
(show-paren-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(appmenu-mode t)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
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
 '(rst-level-2-face ((t (:background "midnight blue"))) t))


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
(load-file "~/.emacs.d/tree-mode.el")
(load-file "~/.emacs.d/winmode.el")
(load-file "~/.emacs.d/dirtree.el")


 ;;; Set column width to 78 maximum in RST files
(add-hook 'rst-mode-hook
     '(lambda ()
        (setq-default fill-column 78)))

;;; ----------------Go-Modes---------------------------------

(add-to-list 'load-path "~/dev/go-mode.el/" t)
(autoload 'gofmt-before-save "go-mode" t nil)
(add-hook 'before-save-hook #'gofmt-before-save)
(require 'go-mode)
(add-to-list 'load-path "/usr/lib/go/site/src/github.com/dougm/goflymake")

(add-hook 'go-mode-hook
          '(lambda ()
             (global-set-key (kbd "C-{") 'flymake-display-err-menu-for-current-line)))
(add-hook 'go-mode-hook
          '(lambda ()
             (global-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-flymake) 
;;;-----------------Erlang Mode------------------------------

(load-file "~/.emacs.d/erlang.el")
(defun erlang-init ()
  (tempo-template-erlang-normal-header))
(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))

;;;------------------Haskell---------------------------------
(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")

;;;---------------------C++----------------------------------

(c-add-style "my-style" 
	     '("stroustrup"
	       (c-basic-offset . 4)))

(defun my-c++-mode-hook ()
  (c-set-style "my-style"))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c++-mode-hook)
;;;------------------Marmalade-------------------------------

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'gist)


;;; Elisp
(defun fc-eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))
(global-set-key (kbd "C-c e") 'fc-eval-and-replace)
