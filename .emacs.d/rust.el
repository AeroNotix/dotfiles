(require 'flymake-rust)
(add-hook 'rust-mode-hook 'flymake-rust-load)

;; TODO: Don't use hardcoded paths
(setq racer-rust-src-path "/home/xeno/dev/rust/src/")
(setq racer-cmd "/home/xeno/dev/racer/target/release/racer")
(add-to-list 'load-path "/home/xeno/dev/racer/editors")
