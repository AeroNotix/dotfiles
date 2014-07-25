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

(defun erlang--insert-module ()
  (interactive)
  (if (buffer-empty?)
      (insert (format "-module(%s)." (get-module-name)))
    (message "Buffer not empty, refusing to insert module attribute.")))

(defun define->string (define)
  (format "-define(%s, %s).\n" (substring (cdr define) 1) (car define)))

(defun insert-defines-at-previous-defines (defines)
  (goto-char 0)
  (search-forward "-define")
  (backward-char (length "-define"))
  (newline)
  (mapcar (lambda (define)
            (insert (define->string define)))
          defines))

(defun defines-exist? ()
  (interactive)
  (save-excursion
    (let ((buffer-text (buffer-substring-no-properties (point-min) (point-max))))
      (when (search "-define(" buffer-text)
        t))))

(defun erlang--binaries-to-defines ()
  (interactive)
  (let ((bin-regex "\\(<<\"\\([a-zA-Z_]+\\)\">>\\)")
        (replacements nil))
    (while (search-forward-regexp bin-regex nil t)
      (when (y-or-n-p "Replace? ")
        (let ((define-replace (format "?%s" (upcase (match-string-no-properties 2))))
              (full-bin       (match-string-no-properties 1)))
          (cons-assoc full-bin define-replace replacements)
          (replace-match define-replace t nil))))
    (when (defines-exist?)
      (insert-defines-at-previous-defines replacements))))

(add-hook 'erlang-mode-hook 'erlang--insert-module)
(global-set-key (kbd "C-x C-a s e") 'erlang--split-exports)

(provide 'aero-erlang)