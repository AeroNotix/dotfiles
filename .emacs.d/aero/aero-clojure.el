;;; aero-clojure.el

(defun clojure--sort-project-dependencies ()
  (interactive)
  (save-excursion
    (goto-char 0)
    (search-forward-regexp ":dependencies\s+")
    (mark-sexp)
    (forward-char)
    (exchange-point-and-mark)
    (backward-char)
    (let* ((deps (get-region-as-string))
           (deps (split-string deps "\n")))
      (kill-region (region-beginning) (region-end))
      (mapcar (lambda (d)
                (insert d)
                (newline-and-indent))
              (sort (mapcar 'trim-string deps) 'string<)))))

(defun clojure--arg-vec-to-destructure ()
  (interactive)
  (if (not (looking-at (regexp-quote "[")))
      (search-backward "["))
  (insert "[{:keys ")
  (forward-sexp)
  (insert "}]"))

(global-set-key (kbd "C-x C-a s d") 'clojure--sort-project-dependencies)
(global-set-key (kbd "C-x C-a a v") 'clojure--arg-vec-to-destructure)

(provide 'aero-clojure)
