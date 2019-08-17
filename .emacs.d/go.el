(require 'go-mode)
(require 'go-autocomplete)

(add-hook 'go-mode-hook
          '(lambda ()
             (global-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook
          '(lambda ()
             (global-set-key (kbd "C-c C-a") 'go-import-add)))
(add-hook 'completion-at-point-functions 'go-complete-at-point)
(add-hook 'before-save-hook #'gofmt-before-save)
