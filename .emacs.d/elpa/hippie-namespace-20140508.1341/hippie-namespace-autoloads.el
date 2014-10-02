;;; hippie-namespace-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (hippie-namespace-add hippie-namespace-reload global-hippie-namespace-mode
;;;;;;  hippie-namespace-mode hippie-namespace-mark-symbol-portion
;;;;;;  hippie-namespace-populate-list hippie-namespace-global hippie-namespace)
;;;;;;  "hippie-namespace" "hippie-namespace.el" (21549 43305 56010
;;;;;;  372000))
;;; Generated autoloads from hippie-namespace.el

(let ((loads (get 'hippie-namespace 'custom-loads))) (if (member '"hippie-namespace" loads) nil (put 'hippie-namespace 'custom-loads (cons '"hippie-namespace" loads))))

(let ((loads (get 'hippie-namespace-global 'custom-loads))) (if (member '"hippie-namespace" loads) nil (put 'hippie-namespace-global 'custom-loads (cons '"hippie-namespace" loads))))

(put 'hippie-namespace-local-list 'safe-local-variable 'listp)

(autoload 'hippie-namespace-populate-list "hippie-namespace" "\
Populate `hippie-namespace-computed-list' from buffer contents.

When optional FORCE is set, repopulate even if
`hippie-namespace-computed-list' is already set.

\(fn &optional FORCE)" nil nil)

(autoload 'hippie-namespace-mark-symbol-portion "hippie-namespace" "\
Mark the namespace or non-namespace portion of a symbol under the point.

Intended for use with `expand-region' as an element of
`er/try-expand-list'.

If the point is in the namespace or non-namespace portion of
a symbol, mark only that portion of the symbol.

If the point is in a symbol which does not match a namespace,
there is no effect.

\(fn)" t nil)

(autoload 'hippie-namespace-mode "hippie-namespace" "\
Turn on hippie-namespace-mode.

When called interactively with no prefix argument this command
toggles the mode.  With a prefix argument, it enables the mode
if the argument is positive and otherwise disables the mode.

When called from Lisp, this command enables the mode if the
argument is omitted or nil, and toggles the mode if the argument
is 'toggle.

\(fn &optional ARG)" t nil)

(defvar global-hippie-namespace-mode nil "\
Non-nil if Global-Hippie-Namespace mode is enabled.
See the command `global-hippie-namespace-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-hippie-namespace-mode'.")

(custom-autoload 'global-hippie-namespace-mode "hippie-namespace" nil)

(autoload 'global-hippie-namespace-mode "hippie-namespace" "\
Toggle Hippie-Namespace mode in all buffers.
With prefix ARG, enable Global-Hippie-Namespace mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Hippie-Namespace mode is enabled in all buffers where
`hippie-namespace-maybe-turn-on' would do it.
See `hippie-namespace-mode' for more information on Hippie-Namespace mode.

\(fn &optional ARG)" t nil)

(autoload 'hippie-namespace-reload "hippie-namespace" "\
Force a refresh of `hippie-namespace-computed-list'.

`hippie-namespace-computed-list' is used by `try-expand-namespace'.

With prefix ARG, also wipe `hippie-namespace-manual-list'.

\(fn ARG)" t nil)

(autoload 'hippie-namespace-add "hippie-namespace" "\
Manually add NAMESPACE to the list available to `try-expand-namespace'.

Modifies `hippie-namespace-manual-list', and refreshes by running
`hippie-namespace-populate-list'.

\(fn NAMESPACE)" t nil)

;;;***

;;;### (autoloads nil nil ("hippie-namespace-pkg.el") (21549 43305
;;;;;;  99469 874000))

;;;***

(provide 'hippie-namespace-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; hippie-namespace-autoloads.el ends here
