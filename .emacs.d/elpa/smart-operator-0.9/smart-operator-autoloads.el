;;; smart-operator-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (smart-insert-c-style-< smart-insert-operator-hook
;;;;;;  smart-beautify-operator smart-insert-operator) "smart-operator"
;;;;;;  "smart-operator.el" (20261 25109))
;;; Generated autoloads from smart-operator.el

(autoload 'smart-insert-operator "smart-operator" "\
Automatically insert whitespaces before and after '=', '>=', etc.
Make it look nicer: ' = ', ' >= '.

OP is the operator. If optional ONLY-BACK is t, only insert one
whitespace at back. When confused, try C-q.

\(fn OP &optional ONLY-BACK)" t nil)

(autoload 'smart-beautify-operator "smart-operator" "\
Beautify the codes to my style, such as add whitespaces before
and after operators. Three steps:

    1.\" =\", \"= \" --> \" = \"
    2.\"  \" --> \" \"
    3.\"> =\" --> \">=\"

Note: As replace method has been called two times, so you have to undo
TWO times to get back to the original state! And be careful to mark whole
buffer, as there are some unresolved issues, such as \"#include <stdio.h>\"
would become \" #include < stdio.h > \" incorrectly!

\(fn BEG END)" t nil)

(autoload 'smart-insert-operator-hook "smart-operator" "\
Set all the operators smart at one time, then you can ajust some by hand,
e.g.

\(defun my-c-mode-common-hook()
  (smart-insert-operator-hook)

  (local-unset-key (kbd \".\"))
  (local-unset-key (kbd \":\"))
  (local-set-key (kbd \"*\") 'c-electric-star))

\(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

\(fn)" nil nil)

(autoload 'smart-insert-c-style-< "smart-operator" "\
Insert `<>' or ` < ' smartly.
If there are some keywords(like #include, vector) ahead on the same
line, possibly we have to insert a `<>' instead of ` < '.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("smart-operator-pkg.el") (20261 25109
;;;;;;  29228))

;;;***

(provide 'smart-operator-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; smart-operator-autoloads.el ends here
