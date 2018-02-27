(add-to-list 'load-path "~/.emacs.d/erlang/")
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq inferior-erlang-machine-options '("-sname" "emacs"))

(require 'erlang-start)

(setq auto-mode-alist
      (reverse
       (append auto-mode-alist
               '(("\\.rel$"       . erlang-mode)
                 ("\\.app$"       . erlang-mode)
                 ("\\.appSrc$"    . erlang-mode)
                 ("\\.app.src$"   . erlang-mode)
                 ("\\.hrl$"       . erlang-mode)
                 ("\\.erl$"       . erlang-mode)
                 ("\\.yrl$"       . erlang-mode)
                 ("rebar.config$" . erlang-mode)
                 ("relx.config$"  . erlang-mode)
                 ("sys.config$"   . erlang-mode)))))

(defun erlang-enable-edts ()
  (edts-mode))

(add-hook 'erlang-mode-hook 'erlang-enable-edts)

(setq edts-project-overrides
      '(("/home/xeno/dev/ubic" . ((:otp-path . "/home/xeno/.kerl/installations")))))
