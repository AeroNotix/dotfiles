;;; conkeror-minor-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "conkeror-minor-mode" "conkeror-minor-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from conkeror-minor-mode.el

(autoload 'conkeror-minor-mode "conkeror-minor-mode" "\
Toggle Conkeror minor mode on or off.
With a prefix argument ARG, enable Conkeror minor mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.
\\{conkeror-minor-mode-map}

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "conkeror-minor-mode" '("conkeror-" "js--current-statement" "eval-in-conkeror")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; conkeror-minor-mode-autoloads.el ends here
