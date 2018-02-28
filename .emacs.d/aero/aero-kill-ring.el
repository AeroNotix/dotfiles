(require 'subr-x)

(defcustom aero-kill-ring-max-display-length 40
  "When displaying a popup, the length of the string won't exceed
  this length"
  :type 'integer)

(defcustom aero-kill-ring-shortened-string-placeholder "[...]"
  "When shortening a string, use this string to show the string
has been shortened"
  :type 'string)

(defun akr-depropertize-string (str)
  "Return a copy of STR with text properties removed."
  (let ((str (copy-sequence str)))
    (set-text-properties 0 (length str) nil str)
    str))

(defun akr-shorten-string (str)
  (replace-in-string
   (string-trim-left
    (if (<= (length str) aero-kill-ring-max-display-length)
        str
      (concat (substring str 0 aero-kill-ring-max-display-length)
              aero-kill-ring-shortened-string-placeholder)))
   "\n" ""))

(defun akr-filtermap (function sequence)
  (let ((exclude (make-symbol "exclude")))
    (delq exclude (seq-map (lambda (elt)
                             (let ((elt (funcall function elt)))
                               (if elt
                                   elt
                                 exclude)))
                           sequence))))

(defun akr-usable-entries (str)
  (let* ((str (akr-depropertize-string str)))
    (if (or (string= str "") (string= str "\n"))
        nil
      (cons (akr-shorten-string str) str))))

(defun insert-from-kill-ring ()
  (interactive)
  (let* ((filtered-kill-ring (akr-filtermap #'akr-usable-entries kill-ring))
         (choice (popup-menu* (seq-map #'car filtered-kill-ring))))
    (insert (cdr (assoc choice filtered-kill-ring)))))

(global-set-key (kbd "C-x y") 'insert-from-kill-ring)

(provide 'aero-kill-ring)
