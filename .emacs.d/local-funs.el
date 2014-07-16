(defun grab-sexp ()
  (interactive)
  (backward-up-list)
  (mark-sexp)
  (kill-ring-save))

(defun jump-to-config-file ()
  (interactive)
  (find-file (expand-file-name "~/.emacs")))

(setq
 aero-pkgs
 '(aero-util
   aero-clojure
   aero-erlang
   aero-magit
   aero-region))


(add-to-list 'load-path "~/.emacs.d/aero/")
(dolist (file aero-pkgs)
  (require file))
