(add-to-list 'load-path "~/dev/go-mode.el/" t)
(autoload 'gofmt-before-save "go-mode" t nil)
(add-hook 'before-save-hook #'gofmt-before-save)
(require 'go-mode)

(add-hook 'go-mode-hook
          '(lambda ()
             (global-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-hook 'go-mode-hook
          '(lambda ()
             (global-set-key (kbd "C-c C-a") 'go-import-add)))

(require 'go-autocomplete)
