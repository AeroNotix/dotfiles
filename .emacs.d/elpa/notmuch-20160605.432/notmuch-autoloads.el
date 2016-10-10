;;; notmuch-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "notmuch" "notmuch.el" (22357 18038 780461
;;;;;;  279000))
;;; Generated autoloads from notmuch.el

(put 'notmuch-search 'notmuch-doc "Search for messages.")

(autoload 'notmuch "notmuch" "\
Run notmuch and display saved searches, known tags, etc.

\(fn)" t nil)

(autoload 'notmuch-cycle-notmuch-buffers "notmuch" "\
Cycle through any existing notmuch buffers (search, show or hello).

If the current buffer is the only notmuch buffer, bury it. If no
notmuch buffers exist, run `notmuch'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "notmuch-company" "notmuch-company.el" (22357
;;;;;;  18038 797127 939000))
;;; Generated autoloads from notmuch-company.el

(autoload 'notmuch-company-setup "notmuch-company" "\


\(fn)" nil nil)

(autoload 'notmuch-company "notmuch-company" "\
`company-mode' completion back-end for `notmuch'.

\(fn COMMAND &optional ARG &rest IGNORE)" t nil)

;;;***

;;;### (autoloads nil "notmuch-hello" "notmuch-hello.el" (22357 18038
;;;;;;  793794 606000))
;;; Generated autoloads from notmuch-hello.el

(autoload 'notmuch-hello "notmuch-hello" "\
Run notmuch and display saved searches, known tags, etc.

\(fn &optional NO-DISPLAY)" t nil)

;;;***

;;;### (autoloads nil "notmuch-jump" "notmuch-jump.el" (22357 18038
;;;;;;  767127 951000))
;;; Generated autoloads from notmuch-jump.el

(autoload 'notmuch-jump-search "notmuch-jump" "\
Jump to a saved search by shortcut key.

This prompts for and performs a saved search using the shortcut
keys configured in the :key property of `notmuch-saved-searches'.
Typically these shortcuts are a single key long, so this is a
fast way to jump to a saved search from anywhere in Notmuch.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "notmuch-show" "notmuch-show.el" (22357 18038
;;;;;;  800461 270000))
;;; Generated autoloads from notmuch-show.el

(autoload 'notmuch-show "notmuch-show" "\
Run \"notmuch show\" with the given thread ID and display results.

ELIDE-TOGGLE, if non-nil, inverts the default elide behavior.

The optional PARENT-BUFFER is the notmuch-search buffer from
which this notmuch-show command was executed, (so that the
next thread from that buffer can be show when done with this
one).

The optional QUERY-CONTEXT is a notmuch search term. Only
messages from the thread matching this search term are shown if
non-nil.

The optional BUFFER-NAME provides the name of the buffer in
which the message thread is shown. If it is nil (which occurs
when the command is called interactively) the argument to the
function is used.

Returns the buffer containing the messages, or NIL if no messages
matched.

\(fn THREAD-ID &optional ELIDE-TOGGLE PARENT-BUFFER QUERY-CONTEXT BUFFER-NAME)" t nil)

;;;***

;;;### (autoloads nil nil ("coolj.el" "make-deps.el" "notmuch-address.el"
;;;;;;  "notmuch-crypto.el" "notmuch-lib.el" "notmuch-maildir-fcc.el"
;;;;;;  "notmuch-message.el" "notmuch-mua.el" "notmuch-parser.el"
;;;;;;  "notmuch-pkg.el" "notmuch-print.el" "notmuch-query.el" "notmuch-tag.el"
;;;;;;  "notmuch-tree.el" "notmuch-wash.el") (22357 18038 810461
;;;;;;  266000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; notmuch-autoloads.el ends here
