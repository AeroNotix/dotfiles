;;; ansible-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ansible::dict-initialize ansible::snippets-initialize
;;;;;;  ansible) "ansible" "ansible.el" (21459 50015 558774 625000))
;;; Generated autoloads from ansible.el

(defvar ansible::key-map (make-sparse-keymap) "\
Keymap for Ansible.")

(autoload 'ansible "ansible" "\
Ansible minor mode.

\(fn &optional ARG)" t nil)

(autoload 'ansible::snippets-initialize "ansible" "\


\(fn)" nil nil)

(eval-after-load 'yasnippet '(ansible::snippets-initialize))

(autoload 'ansible::dict-initialize "ansible" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("ansible-pkg.el") (21459 50015 584279
;;;;;;  989000))

;;;***

(provide 'ansible-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ansible-autoloads.el ends here
