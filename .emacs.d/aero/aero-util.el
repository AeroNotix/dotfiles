;;; aero-util.el

(defun buffer-empty? ()
  (string= "" (buffer-substring-no-properties (point-max) 1)))

(defun current-line ()
  (count-lines 1 (point)))

(defun get-module-name ()
  (car (split-string (buffer-name) "\\.")))

(defun copy-line-above ()
  (interactive)
  (insert-char
   (save-excursion
    (let ((col (current-column)))
      (goto-line (- (current-line) 1))
      (forward-char (+ col 1))
      (char-before)))))

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

(defun get-region-as-string ()
  (buffer-substring-no-properties (region-beginning) (region-end)))

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

(defun trim-string (string)
  (replace-regexp-in-string
   "\\`[ \t\n]*" ""
   (replace-regexp-in-string "[ \t\n]*\\'" "" string)))

(defmacro destructuring-regexp-bind (bindings regexp string &rest body)
  `(when (string-match ,regexp ,string)
     (progv ',bindings
         (mapcar (lambda (i) (match-string i ,string))
                 (number-sequence 1 (length ',bindings)))
       ,@body)))

(defmacro cons-assoc (k v l)
  `(setf ,l (cl-acons ,k ,v ,l)))

(global-set-key (kbd "C-x C-a s c") 'strip-comments)
(global-set-key (kbd "M-n")         'copy-line-above)

(provide 'aero-util)
