;;; py-yapf-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "py-yapf" "py-yapf.el" (0 0 0 0))
;;; Generated autoloads from py-yapf.el

(autoload 'py-yapf-buffer "py-yapf" "\
Uses the \"yapf\" tool to reformat the current buffer.

\(fn)" t nil)

(autoload 'py-yapf-enable-on-save "py-yapf" "\
Pre-save hooked to be used before running py-yapf.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "py-yapf" '("py-yapf-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; py-yapf-autoloads.el ends here
