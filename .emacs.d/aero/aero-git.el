;;; aero-git.el

(defun get-gitignores (&rest languages)
  (let ((langs (mapconcat 'identity languages ",")))
    (shell-command-to-string
     (format "curl http://www.gitignore.io/api/%s 2>/dev/null" langs))))

(defun insert-gitignores (&rest languages)
  (insert (apply #'get-gitignores languages)))

(provide 'aero-git)
