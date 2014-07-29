;;; refacterl.el --- Erlang development tools for emacs
;; Copyright (C) 2014 Aaron France

;; Author: Aaron France <aaron.l.france@gmail.com>
;; URL: https://github.com/erlang-emacs/refacterl.el
;; Created: 2014-07-29
;; Version: 0.0.1
;; Keywords: erlang, tools

;;; Code:

(defun buffer-empty? ()
  (string= "" (buffer-substring-no-properties (point-max) 1)))

(defun trim-string (string)
  (replace-regexp-in-string
   "\\`[ \t\n]*" ""
   (replace-regexp-in-string "[ \t\n]*\\'" "" string)))

(defun move-to-export ()
  (search-backward "-export" nil t))

(defun move-to-module ()
  (search-backward "-module" nil t))

(defun move-to-exports-or-module ()
  (interactive)
  (when (or (move-to-export) (move-to-module))
    (when (looking-at "-module")
      (progn
        (end-of-line)
        (newline 2)))
    (when (looking-at "-export")
      (previous-line)
      (newline))))

(defun erlang--get-function-name-and-arity ()
  (interactive)
  (let* ((fn-and-arity (erlang-get-function-name-and-arity))
         (fn-and-arity-split (when fn-and-arity
                               (split-string fn-and-arity "/"))))
    (when fn-and-arity-split
      (list
       (first fn-and-arity-split)
       (string-to-number
        (second fn-and-arity-split))))))

(defun erlang--fun-at-point-exported-p ()
  (apply #'erlang-function-exported-p (erlang--get-function-name-and-arity)))

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
      (insert (format "-module(%s)." (erlang-get-module-from-file-name)))
    (message "Refusing to insert module attribute.")))

(defun define->string (define)
  (format "-define(%s, %s).\n" (substring (cdr define) 1) (car define)))

(defun insert-defines (defines)
  (mapcar (lambda (define)
            (insert (define->string define)))
          defines))

(defun insert-defines-at-previous-defines (defines)
  (goto-char (point-min))
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
  "Cycles a \"string-like\" (i.e. a binary string or a regular string)
  between each other.

  <<\"something\">> -> \"something\"
  \"something\"      -> <<\"something\">>."
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

(defun erlang--export-fun-at-point ()
  (interactive)
  (beginning-of-line)
  (save-excursion
    (let ((fn-and-arity (erlang-get-function-name-and-arity)))
      (when (and fn-and-arity (not (erlang--fun-at-point-exported-p)))
        (move-to-exports-or-module)
        (insert (format "-export([%s])." fn-and-arity))))))

(defun erlang--unexport-fun-at-point ()
  (interactive)
  (let ((fn-and-arity (erlang-get-function-name-and-arity)))
    (print fn-and-arity)
    (when fn-and-arity
      (progn
        (goto-char 0)
        (delete-matching-lines
         (regexp-quote (format "-export([%s]).\n" fn-and-arity)))))))

(defun erlang--toggle-export-fun-at-point ()
  (interactive)
  (if (erlang--fun-at-point-exported-p)
      (erlang--unexport-fun-at-point)
    (erlang--export-fun-at-point)))

(add-hook 'erlang-mode-hook 'erlang--insert-module)

;; TODO: make the keybindings more customizable. Perhaps make a
;; minor-mode?
(eval-after-load 'erlang
  '(progn
    (define-key erlang-mode-map (kbd "C-x C-a d b") 'erlang--binaries-to-defines)
    (define-key erlang-mode-map (kbd "C-x C-a c s") 'erlang--cycle-string-like)
    (define-key erlang-mode-map (kbd "C-x C-a s e") 'erlang--split-exports)
    (define-key erlang-mode-map (kbd "C-x C-a e f") 'erlang--export-fun-at-point)))

(provide 'refacterl)
;;; refacterl.el ends here
