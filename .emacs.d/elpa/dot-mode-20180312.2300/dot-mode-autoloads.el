;;; dot-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "dot-mode" "dot-mode.el" (0 0 0 0))
;;; Generated autoloads from dot-mode.el

(autoload 'dot-mode-copy-to-last-kbd-macro "dot-mode" "\
Copy the current `dot-mode' command buffer to the `last-kbd-macro' variable.
Then it can be called with `call-last-kbd-macro', named with
`name-last-kbd-macro', or even saved for later use with
`name-last-kbd-macro'

\(fn)" t nil)

(autoload 'dot-mode-execute "dot-mode" "\
Execute stored commands.

\(fn)" t nil)

(autoload 'dot-mode-override "dot-mode" "\
Unconditionally store next keystroke.

\(fn)" t nil)

(autoload 'dot-mode "dot-mode" "\
Dot mode mimics the `.' function in vi, repeating sequences of
commands and/or typing delimited by motion events.  Use `C-.'
rather than just `.'.

\(fn &optional ARG)" t nil)

(autoload 'dot-mode-on "dot-mode" "\
Turn on dot-mode.

\(fn)" t nil)

(defalias 'turn-on-dot-mode 'dot-mode-on)

(defvar global-dot-mode nil "\
Non-nil if Global Dot mode is enabled.
See the `global-dot-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-dot-mode'.")

(custom-autoload 'global-dot-mode "dot-mode" nil)

(autoload 'global-dot-mode "dot-mode" "\
Toggle Dot mode in all buffers.
With prefix ARG, enable Global Dot mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Dot mode is enabled in all buffers where
`dot-mode-on' would do it.
See `dot-mode' for more information on Dot mode.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "dot-mode" '("dot-mode-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; dot-mode-autoloads.el ends here
