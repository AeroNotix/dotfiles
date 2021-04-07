;;; edts-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "edts-mode" "edts-mode.el" (0 0 0 0))
;;; Generated autoloads from edts-mode.el

(eval-and-compile (add-to-list 'load-path (file-name-as-directory (expand-file-name "elisp/edts" (file-name-directory (or load-file-name byte-compile-current-file))))))

(autoload 'edts-mode "edts-mode" "\
An easy to set up Development-environment for Erlang. See README for
details about EDTS.

If called interactively, enable Edts mode if ARG is positive, and
disable it if ARG is zero or negative.  If called from Lisp, also
enable the mode if ARG is omitted or nil, and toggle it if ARG is
`toggle'; disable the mode otherwise.

The mode's hook is called both when the mode is enabled and when
it is disabled.

EDTS also incorporates a couple of other
minor-modes, currently auto-highlight-mode and auto-complete-mode.
They are configured to work together with EDTS but see their respective
documentation for information on how to configure their behaviour
further.

\\{edts-mode-map}Other useful commands:
\\[edts-buffer-node-name]           - Display the project node-name of
                                      current-buffer.
\\[edts-code-compile-and-display]   - Compile current buffer and display
                                      issues.
\\[edts-code-xref-analyze]          - Run xref analysis on current
                                      buffer.
\\[edts-code-xref-analyze-related]  - Runs xref-checks for all
                                      live buffers related to
                                      current buffer either by
                                      belonging to the same
                                      project or, if current
                                      buffer does not belong to
                                      any project, being in the
                                      same directory as the
                                      current buffer's file.
\\[edts-dialyzer-analyze]           - Same as the xref-check
                                      above, but for dialyzer.
\\[edts-shell]                      - Start an interactive Erlang shell.
\\[edts-api-start-server]           - Start the central EDTS server.
\\[edts-man-setup]                  - Install the OTP documentation

\(fn &optional ARG)" t nil)

(register-definition-prefixes "edts-mode" '("edts-"))

;;;***

;;;### (autoloads nil "edts-start" "edts-start.el" (0 0 0 0))
;;; Generated autoloads from edts-start.el

(register-definition-prefixes "edts-start" '("edts-"))

;;;***

;;;### (autoloads nil nil ("edts-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; edts-autoloads.el ends here
