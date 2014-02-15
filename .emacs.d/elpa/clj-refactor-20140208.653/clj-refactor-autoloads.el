;;; clj-refactor-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (clj-refactor-mode cljr-cycle-coll cljr-cycle-stringlike
;;;;;;  cljr-cycle-privacy cljr-destructure-keys cljr-move-to-let
;;;;;;  cljr-expand-let cljr-introduce-let cljr-thread-last-all cljr-thread-first-all
;;;;;;  cljr-thread cljr-unwind-all cljr-unwind cljr-add-declaration
;;;;;;  cljr-move-form cljr-stop-referring cljr-replace-use cljr-add-import-to-ns
;;;;;;  cljr-add-use-to-ns cljr-add-require-to-ns cljr-sort-ns cljr-rename-file
;;;;;;  cljr-add-keybindings-with-modifier cljr-add-keybindings-with-prefix)
;;;;;;  "clj-refactor" "clj-refactor.el" (21245 16948 374335 214000))
;;; Generated autoloads from clj-refactor.el

(autoload 'cljr-add-keybindings-with-prefix "clj-refactor" "\


\(fn PREFIX)" nil nil)

(autoload 'cljr-add-keybindings-with-modifier "clj-refactor" "\


\(fn MODIFIER)" nil nil)

(autoload 'cljr-rename-file "clj-refactor" "\
Renames current buffer and file it is visiting.

\(fn)" t nil)

(autoload 'cljr-sort-ns "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-add-require-to-ns "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-add-use-to-ns "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-add-import-to-ns "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-replace-use "clj-refactor" "\
Replace any :use clause with the equivalent :require clause.

Presently, there's no support for :use clauses containing :exclude.

\(fn)" t nil)

(autoload 'cljr-stop-referring "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-move-form "clj-refactor" "\
Move the form containing POINT to a new namespace.

If REGION is active, move all forms contained by region. 

\(fn)" t nil)

(autoload 'cljr-add-declaration "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-unwind "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-unwind-all "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-thread "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-thread-first-all "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-thread-last-all "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-introduce-let "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-expand-let "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-move-to-let "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-destructure-keys "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-cycle-privacy "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-cycle-stringlike "clj-refactor" "\
convert the string or keyword at (point) from string -> keyword or keyword -> string.

\(fn)" t nil)

(autoload 'cljr-cycle-coll "clj-refactor" "\
convert the coll at (point) from (x) -> {x} -> [x] -> -> #{x} -> (x) recur

\(fn)" t nil)

(autoload 'clj-refactor-mode "clj-refactor" "\
A mode to keep the clj-refactor keybindings.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("clj-refactor-pkg.el") (21245 16948 408833
;;;;;;  835000))

;;;***

(provide 'clj-refactor-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; clj-refactor-autoloads.el ends here
