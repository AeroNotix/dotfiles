;;; eproject-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "eproject" "eproject.el" (0 0 0 0))
;;; Generated autoloads from eproject.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject" '("eproject-" "define-" "dot-eproject-mode" "generic")))

;;;***

;;;### (autoloads nil "eproject-android" "eproject-android.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from eproject-android.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-android" '("android")))

;;;***

;;;### (autoloads nil "eproject-anything" "eproject-anything.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from eproject-anything.el

(defvar anything-c-source-eproject-files '((name . "Files in eProject") (init lambda nil (if (buffer-file-name) (setq anything-eproject-root-dir (eproject-maybe-turn-on)) (setq anything-eproject-root-dir 'nil))) (candidates lambda nil (if anything-eproject-root-dir (eproject-list-project-files anything-eproject-root-dir))) (type . file)) "\
Search for files in the current eProject.")

(defvar anything-c-source-eproject-buffers '((name . "Buffers in this eProject") (init lambda nil (if (buffer-file-name) (setq anything-eproject-root-dir (eproject-maybe-turn-on)) (setq anything-eproject-root-dir 'nil))) (candidates lambda nil (if anything-eproject-root-dir (mapcar 'buffer-name (cdr (assoc anything-eproject-root-dir (eproject--project-buffers)))))) (volatile) (type . buffer)) "\
Search for buffers in this project.")

(autoload 'anything-eproject-files "eproject-anything" "\
Preconfigured `anything' for searching files inside current eproject.

\(fn)" t nil)

(autoload 'anything-eproject-buffers "eproject-anything" "\
Preconfigured `anything' for opening buffers. Searches for
buffers in the current project, then other buffers, also gives
option of recentf. Replaces switch-to-buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "eproject-arduino" "eproject-arduino.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from eproject-arduino.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-arduino" '("arduino")))

;;;***

;;;### (autoloads nil "eproject-clojure-leiningen" "eproject-clojure-leiningen.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from eproject-clojure-leiningen.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-clojure-leiningen" '("clojure-leiningen")))

;;;***

;;;### (autoloads nil "eproject-compile" "eproject-compile.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from eproject-compile.el

(autoload 'eproject-compile "eproject-compile" "\
Run `compile' in the project root.

This uses a computed history based on project attributes, the
existing `compile-history', and `compile-command' which may have
been locally set by a mode.

To provide defaults for a project or project type, set the
`:common-compiles' attribute to a list of strings representing
the command to invoke.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-compile" '("eproject-")))

;;;***

;;;### (autoloads nil "eproject-extras" "eproject-extras.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from eproject-extras.el

(autoload 'eproject-find-file "eproject-extras" "\
Present the user with a list of files in the current project.
to select from, open file when selected.

\(fn)" t nil)

(autoload 'eproject--project-buffers "eproject-extras" "\
Return an alist mapping each project root to its open buffers.

Does not list the project if it doesn't have any buffers.

\(fn)" nil nil)

(autoload 'eproject-switch-to-buffer "eproject-extras" "\
Interactively switch to a buffer belonging to the same project.

With prefix argument 4, first ask which project.

\(fn &optional PREFIX)" t nil)

(autoload 'eproject-switch-to-buffer-other-window "eproject-extras" "\
Interactively switch the other window to a buffer belonging to the same project.

With prefix argument 4, first ask which project.

\(fn &optional PREFIX)" t nil)

(autoload 'eproject-switch-to-buffer-other-frame "eproject-extras" "\
Interactively switch the other frame to a buffer belonging to the same project.

With prefix argument 4, first ask which project.

\(fn &optional PREFIX)" t nil)

(autoload 'eproject-ibuffer "eproject-extras" "\
Open an IBuffer window showing all buffers in the current project, or named project if PREFIX arg is supplied.

\(fn PREFIX)" t nil)

(autoload 'eproject-kill-project-buffers "eproject-extras" "\
Kill every buffer in the current project, including the current buffer.

If PREFIX is specified, prompt for a project name and kill those
buffers instead.

\(fn PREFIX)" t nil)

(autoload 'eproject-revisit-project "eproject-extras" "\
Given a project name, visit the root directory.

If PREFIX arg is supplied, run `eproject-find-file'.

\(fn PREFIX)" t nil)

(autoload 'eproject-grep "eproject-extras" "\
Search all files in the current project for REGEXP.

\(fn REGEXP)" t nil)

(autoload 'eproject-todo "eproject-extras" "\
Display a project TODO list.

Customize `eproject-todo-expressions' to control what this function looks for.

\(fn)" t nil)

(autoload 'eproject-multi-isearch-buffers "eproject-extras" "\
Do a `multi-isearch' on opened buffers in the current project.

Run `eproject-open-all-project-files' first or just
`eproject-grep' if you want to search all project files.

\(fn)" t nil)

(autoload 'eproject-eshell-cd-here "eproject-extras" "\
If there is an EShell buffer, cd to the project root in that buffer.

With the prefix arg LOOK-IN-INVISIBLE-BUFFERS looks in buffers that are not currently displayed.

\(fn &optional LOOK-IN-INVISIBLE-BUFFERS)" t nil)

(autoload 'eproject-current-working-directory "eproject-extras" "\
Return the project root directory for most recently visited
buffer.  Fallback to the directory of the buffer when it is
not in a project.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-extras" '("eproject" "with-each-buffer-in-project")))

;;;***

;;;### (autoloads nil "eproject-javascript-bower" "eproject-javascript-bower.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from eproject-javascript-bower.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-javascript-bower" '("javascript-bower")))

;;;***

;;;### (autoloads nil "eproject-javascript-grunt" "eproject-javascript-grunt.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from eproject-javascript-grunt.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-javascript-grunt" '("javascript-grunt")))

;;;***

;;;### (autoloads nil "eproject-javascript-npm" "eproject-javascript-npm.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from eproject-javascript-npm.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-javascript-npm" '("javascript-npm")))

;;;***

;;;### (autoloads nil "eproject-perl" "eproject-perl.el" (0 0 0 0))
;;; Generated autoloads from eproject-perl.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-perl" '("perl" "cperl-")))

;;;***

;;;### (autoloads nil "eproject-php-composer" "eproject-php-composer.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from eproject-php-composer.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-php-composer" '("php-composer")))

;;;***

;;;### (autoloads nil "eproject-python" "eproject-python.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from eproject-python.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-python" '("eproject-python-" "python")))

;;;***

;;;### (autoloads nil "eproject-ruby" "eproject-ruby.el" (0 0 0 0))
;;; Generated autoloads from eproject-ruby.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-ruby" '("ruby")))

;;;***

;;;### (autoloads nil "eproject-ruby-on-rails" "eproject-ruby-on-rails.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from eproject-ruby-on-rails.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-ruby-on-rails" '("ruby-on-rails")))

;;;***

;;;### (autoloads nil "eproject-tags" "eproject-tags.el" (0 0 0 0))
;;; Generated autoloads from eproject-tags.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-tags" '("eproject-tags")))

;;;***

;;;### (autoloads nil "eproject-tasks" "eproject-tasks.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from eproject-tasks.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eproject-tasks" '("anything-eproject-tasks" "helm-eproject-tasks" "eproject-tasks-")))

;;;***

;;;### (autoloads nil "helm-eproject" "helm-eproject.el" (0 0 0 0))
;;; Generated autoloads from helm-eproject.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "helm-eproject" '("eproject-helm-configure" "helm-eproject")))

;;;***

;;;### (autoloads nil nil ("eproject-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; eproject-autoloads.el ends here
