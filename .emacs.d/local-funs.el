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
   aero-kill-ring
   aero-clojure
   aero-magit
   aero-git
   aero-common-lisp
   refacterl))

(add-to-list 'load-path "~/.emacs.d/aero/")
(dolist (file aero-pkgs)
  (require file))

(defun count-chars-region (start end)
  (interactive "r")
  (save-excursion
    (let ((n 0))
      (goto-char start)
      (while (< (point) end)
        (progn
          (forward-char)
          (setq n (1+ n))))
      (message "Region has %d chars" n)
      n)))

(defun jq-on-buffer ()
  (interactive)
  (shell-command-on-region (point-min) (point-max) "jq ." t t))

(defun toggle-comment-region (start end)
  (interactive "r")
  (save-excursion
    (deactivate-mark)
    (goto-char start)
    (while (< (point) end)
      (comment-line 1))))
