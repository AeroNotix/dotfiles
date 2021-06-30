(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aero-kill-ring-max-display-length 40)
 '(appmenu-mode t)
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   '("30a8a5a9099e000f5d4dbfb2d6706e0a94d56620320ce1071eede5481f77d312" default))
 '(emacsw32-max-frames t)
 '(emacsw32-style-frame-title t)
 '(git-messenger:show-detail t)
 '(global-hl-sexp-mode nil)
 '(grep-files-aliases
   '(("erl" . "*.[eh]rl")
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
     ("asm" . "*.[sS]")))
 '(grep-find-ignored-directories
   '("_rel" "SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}"))
 '(grep-find-ignored-files
   '(".#*" "*.jar" "*.vee" "*.jam" "*.beam" "*.cmti" "*.cmt" "*.annot" "*.cmi" "*.cmxa" "*.cma" "*.cmx" "*.cmo" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo"))
 '(hfyview-quick-print-in-files-menu t)
 '(inhibit-startup-screen t)
 '(jdee-server-dir "~/.emacs.d/")
 '(lsp-enable-file-watchers nil)
 '(lsp-groovy-server-file "/home/xeno/.local/lib/java/groovy-language-server-all.jar")
 '(lsp-terraform-server "foobar")
 '(menuacc-mode t)
 '(noprint-hide-print-in-menus t)
 '(noprint-hide-ps-print-in-menus t)
 '(ourcomments-ido-ctrl-tab t)
 '(package-selected-packages
   '(editorconfig rustic sml-mode edit-indirect ssass-mode mmm-mode prettier yasnippet lsp-ui use-package yaml-mode gdscript-mode rego-mode web-mode floobits multiple-cursors graphql-mode dts-mode go-imports go-rename golint ag kubernetes flycheck company-go go-complete tide typescript-mode nginx-mode auto-complete elisp-def browse-kill-ring arduino-mode elixir-mode exwm jdee csv-mode py-yapf racer weechat vkill twittering-mode tuareg toml-mode terraform-mode sql-indent solarized-theme smex smartparens smart-operator slamhound shorten scala-mode rust-mode refacterl redshank rainbow-mode rainbow-delimiters protobuf-mode pkgbuild-mode notmuch muttrc-mode markdown-mode magit-gh-pulls lua-mode lfe-mode kibit-mode keyfreq json-mode jedi idomenu idle-highlight-mode htmlize hl-sexp hippie-namespace hippie-exp-ext highlight-unique-symbol highlight-symbol haskell-mode groovy-mode gotham-theme go-eldoc go-autocomplete github-browse-file git-messenger git-gutter-fringe gist gccsense flymake-rust flymake-go flymake feature-mode edts edit-server dot-mode dockerfile-mode docker d-mode css-mode crontab-mode conkeror-minor-mode company color-theme cmake-mode clojure-mode-extra-font-locking ansible align-cljlet ac-slime ac-cider))
 '(py-pychecker-command-args '(""))
 '(py-shell-name "python2")
 '(rebind-keys-mode t)
 '(recentf-mode t)
 '(rust-rustfmt-bin "/home/xeno/.cargo/bin/rustfmt")
 '(safe-local-variable-values '((c-file-offsets (case-label . +))))
 '(scroll-bar-mode nil)
 '(sex-mode t)
 '(show-paren-mode t)
 '(tabkey2-mode t)
 '(terraform-indent-level 2)
 '(tool-bar-mode nil nil (tool-bar))
 '(tooltip-mode nil)
 '(typescript-indent-level 2)
 '(w32-meta-style 'emacs)
 '(w32shell-shell 'cmd)
 '(warning-suppress-types '((lsp-mode) (lsp-mode))))
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
 '(markdown-code-face ((t (:inherit nil))))
 '(rst-level-1-face ((t (:background "slate blue"))) t)
 '(rst-level-2-face ((t (:background "midnight blue"))) t)
 '(trailing-whitespace ((t (:background "red"))))
 '(whitespace-tab ((t (:foreground "#3f396b")))))

(setq default-frame-alist '((font . "Monaco-9")))
