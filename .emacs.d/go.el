(add-hook 'go-mode-hook
          #'(lambda ()
              (setq gofmt-command "goimports")))
(add-hook 'go-mode-hook #'lsp-deferred)
