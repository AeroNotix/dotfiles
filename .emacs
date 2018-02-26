(setq debug-on-error t)

;; Disable menu bar
(menu-bar-mode -1)

;; SCP is faster.
(setq tramp-default-method "scp")

;; autoload vkill
(autoload 'vkill "vkill" nil t)

;; {Down,Up}case region is pretty useful
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;;; it's easier this way
(setq user-mail-address "aaron.l.france@gmail.com")

;; *Messages* buffer, literally who uses it?
;(setq-default message-log-max nil)
;(kill-buffer "*Messages*")

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

(require 'flymake)

;;;------------------Package-------------------------------

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")
             '("marmalade" . "http://marmalade-repo.org/packages/"))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(appmenu-mode t)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("30a8a5a9099e000f5d4dbfb2d6706e0a94d56620320ce1071eede5481f77d312" default)))
 '(edts-erl-command "/home/xeno/.kerl/installations/bin/erl")
 '(edts-man-root "/home/xeno/.emacs.d/edts/doc/R16B03")
 '(emacsw32-max-frames t)
 '(emacsw32-style-frame-title t)
 '(git-messenger:show-detail t)
 '(global-hl-sexp-mode nil)
 '(grep-files-aliases
   (quote
    (("erl" . "*.[eh]rl")
     ("all" . "* .*")
     ("el" . "*.el")
     ("ch" . "*.[ch]")
     ("c" . "*.c")
     ("cc" . "*.cc *.cxx *.cpp *.C *.CC *.c++")
     ("cchh" . "*.cc *.[ch]xx *.[ch]pp *.[CHh] *.CC *.HH *.[ch]++")
     ("hh" . "*.hxx *.hpp *.[Hh] *.HH *.h++")
     ("h" . "*.h")
     ("l" . "[Cc]hange[Ll]og*")
     ("m" . "[Mm]akefile*")
     ("tex" . "*.tex")
     ("texi" . "*.texi")
     ("asm" . "*.[sS]"))))
 '(grep-find-ignored-directories
   (quote
    ("_rel" "SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}")))
 '(grep-find-ignored-files
   (quote
    (".#*" "*.jar" "*.vee" "*.jam" "*.beam" "*.cmti" "*.cmt" "*.annot" "*.cmi" "*.cmxa" "*.cma" "*.cmx" "*.cmo" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo")))
 '(hfyview-quick-print-in-files-menu t)
 '(inhibit-startup-screen t)
 '(jdee-server-dir "~/.emacs.d/")
 '(menuacc-mode t)
 '(noprint-hide-print-in-menus t)
 '(noprint-hide-ps-print-in-menus t)
 '(ourcomments-ido-ctrl-tab t)
 '(package-selected-packages
   (quote
    (arduino-mode elixir-mode exwm jdee csv-mode py-yapf racer yaml-mode weechat websocket vkill twittering-mode tuareg toml-mode terraform-mode sql-indent solarized-theme smex smartparens smart-operator slamhound shorten scala-mode rust-mode refacterl redshank rainbow-mode rainbow-delimiters protobuf-mode pkgbuild-mode notmuch muttrc-mode markdown-mode magit-gh-pulls lua-mode lfe-mode kibit-mode keyfreq json-mode jedi idomenu idle-highlight-mode htmlize hl-sexp hippie-namespace hippie-exp-ext highlight-unique-symbol highlight-symbol haskell-mode groovy-mode gotham-theme go-eldoc go-autocomplete github-browse-file git-messenger git-gutter-fringe gist gccsense flymake-rust flymake-go flymake feature-mode edts edit-server dot-mode dockerfile-mode docker d-mode css-mode crontab-mode conkeror-minor-mode company color-theme cmake-mode clojure-mode-extra-font-locking ansible align-cljlet ac-slime ac-cider)))
 '(py-pychecker-command-args (quote ("")))
 '(py-shell-name "python2")
 '(rebind-keys-mode t)
 '(recentf-mode t)
 '(rust-rustfmt-bin "/home/xeno/.cargo/bin/rustfmt")
 '(safe-local-variable-values (quote ((c-file-offsets (case-label . +)))))
 '(scroll-bar-mode nil)
 '(sex-mode t)
 '(show-paren-mode t)
 '(tabkey2-mode t)
 '(terraform-indent-level 4)
 '(tool-bar-mode nil nil (tool-bar))
 '(tooltip-mode nil)
 '(w32-meta-style (quote emacs))
 '(w32shell-shell (quote cmd)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "mononoki" :foundry "UKWN" :slant normal :weight normal :height 203 :width normal))))
 '(error ((t (:foreground "orange red" :underline (:color "red" :style wave) :weight bold))))
 '(magit-diff-add ((t (:inherit diff-added :foreground "green"))))
 '(magit-diff-del ((t (:background "firebrick" :foreground "gray100"))))
 '(magit-item-highlight ((t (:inherit default :background "DeepSkyBlue4"))))
 '(rst-level-1-face ((t (:background "slate blue"))) t)
 '(rst-level-2-face ((t (:background "midnight blue"))) t)
 '(trailing-whitespace ((t (:background "red")))))

(setq default-frame-alist '((font . "Monaco-18")))

;-----------------AUTOCOMPLETE-----------------------------------

;; (add-to-list 'load-path "~/.emacs.d/autocomplete") ;
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/autocomplete/ac-dict")
;; (ac-config-default)
;; (global-auto-complete-mode t)

;;;---------------------flymake--------------------------------

(global-set-key (kbd "C-{") 'flymake-display-err-menu-for-current-line)

 ;;; Set column width to 78 maximum in RST files
(add-hook 'rst-mode-hook
          '(lambda ()
             (setq-deqfault fill-column 78)))

;;; ----------------Go-Modes---------------------------------

(add-to-list 'load-path "~/dev/go-mode.el/" t)
(autoload 'gofmt-before-save "go-mode" t nil)
(add-hook 'before-save-hook #'gofmt-before-save)
(require 'go-mode)
;; (add-to-list 'load-path "/home/xeno/dev/go/src/github.com/dougm/goflymake")

(add-hook 'go-mode-hook
          '(lambda ()
             (global-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook
          '(lambda ()
             (global-set-key (kbd "C-c C-a") 'go-import-add)))

(require 'go-autocomplete)
;; (require 'go-flymake)

;;;-----------------Erlang Mode------------------------------

(add-to-list 'load-path "~/.emacs.d/erlang/")
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq inferior-erlang-machine-options '("-sname" "emacs"))

(require 'erlang-start)

(setq auto-mode-alist
      (reverse
       (append auto-mode-alist
               '(("\\.rel$"       . erlang-mode)
                 ("\\.app$"       . erlang-mode)
                 ("\\.appSrc$"    . erlang-mode)
                 ("\\.app.src$"   . erlang-mode)
                 ("\\.hrl$"       . erlang-mode)
                 ("\\.erl$"       . erlang-mode)
                 ("\\.yrl$"       . erlang-mode)
                 ("rebar.config$" . erlang-mode)
                 ("relx.config$"  . erlang-mode)
                 ("sys.config$"   . erlang-mode)))))

(defun erlang-enable-edts ()
  (edts-mode))

(add-hook 'erlang-mode-hook 'erlang-enable-edts)

(setq edts-project-overrides
      '(("/home/xeno/dev/ubic" . ((:otp-path . "/home/xeno/.kerl/installations")))))

;;;---------------------C++----------------------------------

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

(set-variable 'python-indent-offset 4)
(add-hook 'python-mode-hook (lambda ()
                              (flymake-mode-on)))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)

(font-lock-add-keywords 'python-mode
                        (list
                         `(,(regexp-opt (list "async " "await ")) . font-lock-keyword-face)))

;;;-------------------clojure-------------------------------

;; (require 'clj-refactor)
;; (require 'clojure-mode-extra-font-locking)
;; (add-hook 'clojure-mode-hook (lambda ()
;;                                (hl-sexp-mode 1)
;;                                (yas/minor-mode 1)
;;                                (flymake-mode-on)
;;                                (clj-refactor-mode 1)
;;                                (cljr-add-keybindings-with-prefix "C-x C-a")))
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'cider-repl-mode))

;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'cider-mode))
;; ;(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;; (setq clojure-defun-style-default-indent t)
;; (setq nrepl-hide-special-buffers t)
;; (setq cider-auto-select-error-buffer nil)
;; (setq cider-repl-result-prefix ";; => ")
;; (setq cider-repl-history-size 100000000)
;; (setq cider-repl-history-file "~/.cider-repl-history")
;; (add-to-list 'cljr-magic-require-namespaces
;;              '("json" . "clojure.data.json"))
;; (add-to-list 'cljr-magic-require-namespaces
;;              '("component" . "com.stuartsierra.component"))
;; (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
;; (add-hook 'cider-repl-mode-hook
;;           (lambda () (setq show-trailing-whitespace nil)))
;; (eval-after-load 'cider
;;   '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))
;; (add-to-list 'auto-mode-alist
;;              '("\\.clj\\'" . clojure-mode))

;;;------------------save history---------------------------

(setq savehist-additional-variables
      ;; search entries
      '(search ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file "~/.emacs.d/save/savehist")
(savehist-mode t)

;;;-------------- OCaml -------------------------------------

(push "/usr/share/emacs/site-lisp" load-path)
(autoload 'merlin-mode "merlin" "Merlin mode" t)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(load-file "~/.emacs.d/ocp-indent.el")

;;;------------- Haskell ------------------------------------

(add-hook 'haskell-mode-hook
          (lambda ()
            (turn-on-haskell-indentation)))

;;; Local
(load-file "~/.emacs.d/local-funs.el")
(load-file "~/.emacs.d/keybinds.el")

(global-set-key (kbd "C-x y") 'insert-from-kill-ring)

;(load (expand-file-name "~/.quicklisp/slime-helper.el"))

;;;----------- Markdown --------------------------------------

(defun insert-date-and-time ()
  (insert (format-time-string "%Y-%m-%d %H:%M:%S" (current-time))))

(defun insert-post-header ()
  (interactive)
  (insert ";;;;;\n")
  (insert "title:\n")
  (insert "tags:\n")
  (insert "date: ")
  (insert-date-and-time)
  (insert "\nformat: md\n")
  (insert ";;;;;\n\n"))

(add-hook 'markdown-mode '(lambda ()
                            (auto-fill-mode t)))
(append auto-mode-alist '(("\\.post$" . markdown-mode)))

;; hippie
(require 'hippie-exp-ext)
(require 'hippie-namespace)
(global-hippie-namespace-mode 1)

(define-generic-mode 'upstart-mode
  '("#")  ; comments
  '(;; Event definition
    "start on" "stop on" "and" "or"
    ;; Job environment
    "env" "export"
    ;; Services tasks and respawning
    "task" "respawn" "respawn limit" "normal exit"
    ;; Instances
    "instance"
    ;; Process environment
    "console output" "console owner" "umask" "nice" "oom" "chroot"
    "chdir" "limit"
    ;; Documentation
    "description" "author" "version" "emits"
    ;; Miscellaneous
    "kill timeout" "expect stop" "expect daemon" "expect fork"
    ;; Process definitions
    "exec" "script" "end script"
    "pre-start exec" "pre-start script"
    "post-start exec" "post-start script"
    "pre-stop exec" "pre-stop script"
    "post-stop exec" "post-stop script")
  nil
  '("\\.upstart$")
  nil
  "A mode for upstart files")

(add-hook 'before-save-hook 'whitespace-cleanup)

;; Rust

(require 'flymake-rust)
(add-hook 'rust-mode-hook 'flymake-rust-load)

;; TODO: Don't use hardcoded paths
(setq racer-rust-src-path "/home/xeno/dev/rust/src/")
(setq racer-cmd "/home/xeno/dev/racer/target/release/racer")
(add-to-list 'load-path "/home/xeno/dev/racer/editors")

(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(defun count-chars-region (start end)
  (interactive "r")
  (save-excursion
    (let ((n 0))
      (goto-char start)
      (while (< (point) end)
        (progn
          (forward-char)
          (setq n (1+ n))))
      (message "Region has %d chars" n)
      n)))

(defun jq-on-buffer ()
  (interactive)
  (shell-command-on-region (point-min) (point-max) "jq ." t t))

(defun toggle-comment-region (start end)
  (interactive "r")
  (save-excursion
    (deactivate-mark)
    (goto-char start)
    (while (< (point) end)
      (comment-line 1))))
