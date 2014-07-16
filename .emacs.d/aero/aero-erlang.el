;;; aero-erlang.el
(require 'aero-util)

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

(add-hook 'erlang-mode-hook 'erlang--insert-module)
(global-set-key (kbd "C-x C-a s e") 'split-erlang-exports)

(provide 'aero-erlang)
