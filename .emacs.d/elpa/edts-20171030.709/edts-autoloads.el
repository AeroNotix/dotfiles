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
\\[edts-byte-compile]               - Byte compile all EDTS elisp files.
\\[edts-project-start-node]         - Start current buffers project-node
                                      if not already running.
\\[edts-refactor-extract-function]  - Extract code in current region
                                      into a separate function.
\\[edts-init-node]                  - Register the project-node of
                                      current buffer with the central
                                      EDTS server.
\\[edts-shell]                      - Start an interactive Erlang shell.
\\[edts-start-server]               - Start the central EDTS server.
\\[edts-man-setup]                  - Install the OTP documentation

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "edts-mode" '("edts-")))

;;;***

;;;### (autoloads nil "edts-start" "edts-start.el" (0 0 0 0))
;;; Generated autoloads from edts-start.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "edts-start" '("edts-")))

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
