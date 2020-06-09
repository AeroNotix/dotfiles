(defun base64-encode-region-one-line ()
  (interactive)
  (base64-encode-region (region-beginning) (region-end) t))
