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

(defun apply-function-to-region-lines (fn)
  (interactive "aFunction to apply to lines in region: ")
  (save-excursion
    (goto-char (region-end))
    (let ((end-marker (copy-marker (point-marker)))
          next-line-marker)
      (goto-char (region-beginning))
      (if (not (bolp))
          (forward-line 1))
      (setq next-line-marker (point-marker))
      (while (< next-line-marker end-marker)
        (let ((start nil)
              (end nil))
          (goto-char next-line-marker)
          (save-excursion
            (setq start (point))
            (forward-line 1)
            (set-marker next-line-marker (point))
            (setq end (point)))
          (save-excursion
            (let ((mark-active nil))
              (narrow-to-region start end)
              (funcall fn)
              (widen)))))
      (set-marker end-marker nil)
      (set-marker next-line-marker nil))))

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

(defun more-lines ()
  (= 0 (forward-line 1)))

(defun max-line ()
  (interactive)
  (save-excursion
    (goto-char (point-max))
    (line-number-at-pos)))

(defun strip-comments ()
  (interactive)
  (save-excursion
    (let ((comment-regexp-whole-line (format "^%s.+\n" comment-start))
          (trailing-comment          (format "%s.+"    comment-start)))
      (goto-char 0)
      (replace-regexp comment-regexp-whole-line "")
      (goto-char 0)
      (replace-regexp trailing-comment ""))))

(defun current-line ()
  (count-lines 1 (point)))

(defun copy-line-above ()
  (interactive)
  (insert-char
   (save-excursion
    (let ((col (current-column)))
      (goto-line (- (current-line) 1))
      (forward-char (+ col 1))
      (char-before)))))

(global-set-key (kbd "C-x C-a s c") 'strip-comments)
(global-set-key (kbd "M-n")         'copy-line-above)
(global-set-key (kbd "C-x C-a s e") 'split-erlang-exports)
