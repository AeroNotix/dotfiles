(cd (getenv "HOME"))

;; Change customize configuration location
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load "~/.emacs.d/util.el")

(require 'xcscope)

(push "/usr/share/emacs/site-lisp" load-path)

(with-directory "~/.emacs.d/"
  (load-if-exists "bash.el")
  (load-if-exists "c++.el")
  (load-if-exists "erlang.el")
  (load-if-exists "elisp.el")
  (load-if-exists "flymake.el")
  (load-if-exists "go.el")
  (load-if-exists "haskell.el")
  (load-if-exists "hippie.el")
  (load-if-exists "javascript.el")
  (load-if-exists "keybinds.el")
  (load-if-exists "local-funs.el")
  (load-if-exists "markdown.el")
  (load-if-exists "ocaml.el")
  (load-if-exists "opinions.el")
  (load-if-exists "package.el")
  (load-if-exists "python.el")
  (load-if-exists "rust.el")
  (load-if-exists "save-hist.el")
  (load-if-exists "slime.el")
  (load-if-exists "tabs-and-spaces.el")
  (load-if-exists "typescript.el")
  (load-if-exists "terraform.el")
  (load-if-exists "tsx.el")
  (load-if-exists "json.el")
  (load-if-exists "lsp-options.el")
  (load-if-exists "base64.el")
  (load-if-exists "yaml.el")
  (load-if-exists "kubernetes.el")
  (load-if-exists "yasnippet.el")
  (load-if-exists "performance.el"))


(add-hook 'prog-mode-hook 'lsp-deferred)

(add-hook 'prog-mode-hook #'yas-minor-mode)

(add-to-list 'term-file-aliases
             '("alacritty" . "xterm-256-color"))
