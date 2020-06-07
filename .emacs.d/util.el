(defun load-if-exists-p (path)
  (let ((e-path (expand-file-name path)))
    (when (file-exists-p e-path)
      (load e-path))))

(defmacro with-directory (where &rest body)
  (let ((sym (make-symbol "dd")))
    `(let ((,sym default-directory))
       (unwind-protect
           (progn
             (cd ,where)
             ,@body)
         (cd ,sym)))))