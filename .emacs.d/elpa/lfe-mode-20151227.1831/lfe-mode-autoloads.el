;;; lfe-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "inferior-lfe" "inferior-lfe.el" (22148 65057
;;;;;;  87594 169000))
;;; Generated autoloads from inferior-lfe.el

(autoload 'inferior-lfe-mode "inferior-lfe" "\
Major mode for interacting with an inferior LFE process.

\\{inferior-lfe-mode-map}

Customization: Entry to this mode runs the hooks on `comint-mode-hook' and
`inferior-lfe-mode-hook' (in that order).

\(fn)" t nil)

(autoload 'inferior-lfe "inferior-lfe" "\
Run an inferior LFE process, input and output via a buffer `*inferior-lfe*'.
If `CMD' is given, use it to start the shell, otherwise:
`inferior-lfe-program' `inferior-lfe-program-options' -env TERM vt100.

\(fn CMD)" t nil)

(defalias 'run-lfe 'inferior-lfe)

;;;***

;;;### (autoloads nil "lfe-mode" "lfe-mode.el" (22148 65057 90927
;;;;;;  515000))
;;; Generated autoloads from lfe-mode.el

(autoload 'lfe-mode "lfe-mode" "\
Major mode for editing Lisp Flavoured Erlang.  It's just like `lisp-mode'.

Other commands:
\\{lfe-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.lfe\\(?:s\\|sh\\)\\'" . lfe-mode) t)

(dolist (lfe-ext '(".beam" ".jam" ".vee")) (add-to-list 'completion-ignored-extensions lfe-ext))

;;;***

;;;### (autoloads nil nil ("lfe-mode-pkg.el") (22148 65057 101061
;;;;;;  452000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; lfe-mode-autoloads.el ends here
