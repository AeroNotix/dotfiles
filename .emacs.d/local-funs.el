(defun grab-sexp ()
  (interactive)
  (backward-up-list)
  (mark-sexp)
  (kill-ring-save))


(defun jump-to-config-file ()
  (interactive)
  (find-file (expand-file-name "~/.emacs")))

(defun trim-string (string)
  (replace-regexp-in-string
   "\\`[ \t\n]*" ""
   (replace-regexp-in-string "[ \t\n]*\\'" "" string)))

(defun move-to-export ()
  (search-backward "-export"))

(defun go-to-export-end ()
  (search-forward "])."))

(defun split-erlang-exports ()
  (interactive)
  (save-excursion
    (if (not (looking-at "-export"))
        (move-to-export))
    (forward-char (length "-export(["))
    (push-mark)
    (if (not (looking-at "])"))
        (progn
          (go-to-export-end)
          (backward-char 3)))
    (let* ((selection
            (buffer-substring-no-properties (region-beginning) (region-end)))
           (exports (mapcar 'trim-string (split-string selection ","))))
      (move-to-export)
      (push-mark)
      (go-to-export-end)
      (kill-region (region-beginning) (region-end))
      (dolist (e (sort exports 'string<))
        (let ((s (format "-export([%s]).\n" e)))
          (insert s))))))

(global-set-key (kbd "C-x C-a s e") 'split-erlang-exports)
