(defun depropertize-string (str)
  "Return a copy of STR with text properties removed."
  (let ((str (copy-sequence str)))
    (set-text-properties 0 (length str) nil str)
    str))

(defun insert-from-kill-ring ()
  (interactive)
  (insert (popup-menu* (mapcar #'depropertize-string kill-ring))))

(global-set-key (kbd "C-x y") 'insert-from-kill-ring)

(provide 'aero-kill-ring)
