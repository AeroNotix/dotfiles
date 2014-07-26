;;; aero-erlang.el
(require 'aero-util)


(defun move-to-export ()
  (search-backward "-export"))

(defun go-to-export-end ()
  (search-forward "])."))

(defun erlang--split-exports ()
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
            (get-region-as-string))
           (exports (mapcar 'trim-string (split-string selection ","))))
      (move-to-export)
      (push-mark)
      (go-to-export-end)
      (kill-region (region-beginning) (region-end))
      (dolist (e (sort exports 'string<))
        (let ((s (format "-export([%s]).\n" e)))
          (insert s))))))

(defun erlang-file? ()
  (interactive)
  (string= "erl" (file-name-extension (buffer-file-name))))

(defun erlang--insert-module ()
  (interactive)
  (if (and (buffer-empty?) (erlang-file?))
      (insert (format "-module(%s)." (get-module-name)))
    (message "Refusing to insert module attribute.")))

(defun define->string (define)
  (format "-define(%s, %s).\n" (substring (cdr define) 1) (car define)))

(defun insert-defines (defines)
  (mapcar (lambda (define)
            (insert (define->string define)))
          defines))

(defun insert-defines-at-previous-defines (defines)
  (goto-char 0)
  (search-forward "-define")
  (backward-char (length "-define"))
  (newline)
  (insert-defines defines))

(defun insert-defines-after-exports (defines)
  (move-to-export)
  (go-to-export-end)
  (newline 2)
  (insert-defines defines))

(defun write-defines-to-file (defines)
  (let ((fname (read-file-name "New file for defines output:")))
    (when (file-exists-p fname)
      (error "File already exists"))
    (find-file fname)
    (when (erlang-file?)
      (newline 2))
    (insert-defines defines)))

(defun defines-exist? ()
  (interactive)
  (save-excursion
    (let ((buffer-text (buffer-substring-no-properties (point-min) (point-max))))
      (when (search "-define(" buffer-text)
        t))))

(defun replace-all (from to &optional after)
  (while (search-forward-regexp from nil t)
    (replace-match to nil nil))
  (when after
    (goto-char after)))

(defun erlang--binaries-to-defines ()
  ;;; Interactively replaces all binaries in a file to a define.
  ;;;
  ;;; TODO:
  ;;;
  ;;; * Replace a whole application's binaries.
  (interactive)
  (let ((bin-regex "\\(<<\"\\([a-zA-Z_]+\\)\">>\\)")
        (replacements nil)
        (just-replace-it (y-or-n-p "Replace all, no prompts? ")))
    (while (search-forward-regexp bin-regex nil t)
      (when (or just-replace-it (y-or-n-p "Replace? "))
        (let ((orig-posish (goto-char (match-beginning 1))))
          (let ((define-replace (format "?%s" (upcase (match-string-no-properties 2))))
                (full-bin       (match-string-no-properties 1)))
            (cons-assoc full-bin define-replace replacements)
            (if (or just-replace-it (y-or-n-p "Replace all? "))
                (replace-all full-bin define-replace orig-posish)
              (replace-match define-replace t nil))))))
    (if (y-or-n-p "Write to file? ")
        (write-defines-to-file replacements)
      (if (defines-exist?)
          (insert-defines-at-previous-defines replacements)
        (insert-defines-after-exports replacements)))))

(defun erlang--cycle-string-like ()
  ;;; Cycles a "string-like" (i.e. a binary string or a regular string)
  ;;; between each other.
  ;;;
  ;;; <<"something">> -> "something"
  ;;; "something      -> <<"something">>.
  (interactive)
  (skip-syntax-backward "_w")
  (cond
   ((eq ?\< (char-before (- (point) 2)))
    (progn
      (backward-char 3)
      (delete-forward-char 2)
      (end-of-sexp)
      (delete-forward-char 2)))
    (t
     (progn
       (backward-char)
       (insert "<<")
       (end-of-sexp)
       (insert ">>")))))


(eval-after-load+ 'erlang-mode
  '(add-hook   'erlang-mode-hook 'erlang--insert-module)
  '(define-key 'erlang-mode-map "C-x C-a d b" 'erlang--binaries-to-defines)
  '(define-key 'erlang-mode-map (kbd "C-x C-a c s") 'erlang--cycle-string-like)
  '(define-key 'erlang-mode-map (kbd "C-x C-a s e") 'erlang--split-exports))

(provide 'aero-erlang)
