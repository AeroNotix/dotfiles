(add-to-list 'load-path "~/.emacs.d/autocomplete") ;
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/autocomplete/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)
