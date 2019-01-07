(require 'flymake-rust)
(add-hook 'rust-mode-hook 'flymake-rust-load)
(add-to-list 'load-path "/home/xeno/dev/racer/editors")
