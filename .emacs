(cd (getenv "HOME"))

;; Change customize configuration location
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load "~/.emacs.d/util.el")

(with-directory "~/.emacs.d/"
  (load-file "bash.el")
  (load-file "c++.el")
  (load-file "erlang.el")
  (load-file "elisp.el")
  (load-file "flymake.el")
  (load-file "go.el")
  (load-file "haskell.el")
  (load-file "hippie.el")
  (load-file "javascript.el")
  (load-file "keybinds.el")
  (load-file "local-funs.el")
  (load-file "markdown.el")
  (load-file "ocaml.el")
  (load-file "opinions.el")
  (load-file "package.el")
  (load-file "python.el")
  (load-file "rust.el")
  (load-file "save-hist.el")
  (load-file "slime.el")
  (load-file "tabs-and-spaces.el")
  (load-file "typescript.el")
  (load-file "terraform.el")
  (load-file "tsx.el")
  (load-file "json.el")
  (load-file "lsp-options.el")
  (load-file "base64.el")
  (load-file "yaml.el")
  (load-file "kubernetes.el")
  (load-file "yasnippet.el")
  (load-file "performance.el"))


(add-hook 'prog-mode-hook 'lsp-deferred)

(add-hook 'prog-mode-hook #'yas-minor-mode)

(add-to-list 'term-file-aliases
             '("alacritty" . "xterm-256-color"))
