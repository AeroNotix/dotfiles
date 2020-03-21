(add-hook 'go-mode-hook
          #'(lambda ()
              (setq gofmt-command "goimports")))

(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook #'lsp-deferred)
