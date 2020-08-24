(defun base64p (maybe-b64-string)
  (condition-case nil
      (progn
        (base64-decode-string maybe-b64-string)
        t)
    (error nil)))

(defun base64-encode-region-one-line ()
  (interactive)
  (base64-encode-region (region-beginning) (region-end) t))
