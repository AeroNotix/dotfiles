(defmacro with-directory (where &rest body)
  (let ((sym (make-symbol "dd")))
    `(let ((,sym default-directory))
       (unwind-protect
           (progn
             (cd ,where)
             ,@body)
         (cd ,sym)))))
