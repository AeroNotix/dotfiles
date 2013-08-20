
(require 'cl)

(defun git-overlay-dirname (path)
  (apply #'concat (reverse (mapcar (lambda (s)
                                     (concat s "/"))
                                   (cdr (reverse (split-string path "/")))))))

(defun git-overlay-filename (path)
  (car (reverse (split-string path "/"))))

(defmacro git-overlay-with-directory (path &rest body)
  `(let ((currentdir default-directory))
     (cd ,path)
     ,@body
     (cd currentdir)))

(defmacro walk-head (&rest body)
  `(when (looking-at "^diff")
       (progn
         ,@body
         (forward-line) ;; skip over "diff" line
         (while (and (not (eobp)) (not (looking-at "^diff\\|^@@")))
           ,@body
           (forward-line))
         (if (not (eobp))
             (goto-char (match-beginning 0))
           (goto-char (point-max))))))

(defmacro walk-hunk (&rest body)
  `(when (looking-at "^@@\s-\\([0-9]+\\)\,[0-9]+\s\\+\\([0-9]+\\)\,[0-9]+\s@@.*")
       (cond ,@body)
       (forward-line)
       (while (and (not (looking-at "^@@.*")) (not (eobp)))
         (cond ,@body)
         (forward-line))
       (looking-at "^@@.*")))

(defun git-overlay ()
  (interactive)
  (save-excursion
    (let* ((path (git-overlay-dirname (buffer-file-name)))
           (file (git-overlay-filename (buffer-file-name)))
           (buffer (current-buffer))
           (lines-skip '((0 0))))
      (with-current-buffer buffer
        (remove-overlays))
      (git-overlay-with-directory path
                      (progn
                        (with-temp-buffer
                          (call-process "git" nil t t "--no-pager" "diff" file)
                          (goto-char (point-min))
                          (walk-head
                           nil)
                          (while (let* ((hunk-line nil)
                                        (hunk-old-line nil))
                                   (walk-hunk ((looking-at "^@@\s-\\([0-9]+\\)\,\\([0-9]+\\)\s\\+\\([0-9]+\\)\,\\([0-9]+\\)\s@@.*")
                                               (progn
                                                 (message (substring (thing-at-point 'line) 0 -1))
                                                 (setq hunk-line (string-to-number (match-string 3))
                                                       hunk-old-line (string-to-number (match-string 1))
                                                       skip (string-to-number (match-string 4))
                                                       old-skip (string-to-number (match-string 2))
                                                       lines-skip (cons (list hunk-old-line (+ (cadar lines-skip) (- skip old-skip))) lines-skip))
                                                 (print lines-skip)))
                                              ((looking-at "^\\+.*")
                                               (with-current-buffer buffer
                                                 (goto-line hunk-line)
                                                 (overlay-put (make-overlay (line-beginning-position)
                                                                            (save-excursion
                                                                              (progn
                                                                                (forward-line 1)
                                                                                (point)))) 'face '((:background "#354f35")))
                                                 (setq hunk-line (+ hunk-line 1))))
                                              ((looking-at "^-.*")
                                               nil)
                                              (t
                                               (with-current-buffer buffer
                                                 (goto-line hunk-line)
                                                 (overlay-put (make-overlay (line-beginning-position)
                                                                            (save-excursion
                                                                              (progn
                                                                                (forward-line 1)
                                                                                (point)))) 'face '((:background "#36364f")))
                                                 (setq hunk-line (+ hunk-line 1))))))))
                        (with-temp-buffer
                          (call-process "git" nil t t "--no-pager" "diff" "--cached" file)
                          (goto-char (point-min))
                          (walk-head
                           nil)
                          (while (let* ((hunk-line nil)
                                        (hunk-old-line nil))
                                   (walk-hunk ((looking-at "^@@\s-\\([0-9]+\\)\,\\([0-9]+\\)\s\\+\\([0-9]+\\)\,\\([0-9]+\\)\s@@.*")
                                               (progn
                                                 (message (substring (thing-at-point 'line) 0 -1))
                                                 (print lines-skip)
                                                 (setq hunk-old-line (string-to-number (match-string 3))
                                                       hunk-line (let ((cs '()))
                                                                   (loop for l in lines-skip
                                                                         collect l into cs
                                                                         until (< (car l) hunk-old-line)
                                                                         finally return (+ hunk-old-line (cadar (reverse cs))))))
                                                 ))
                                              ((looking-at "^\\+.*")
                                               (with-current-buffer buffer
                                                 (goto-line hunk-line)
                                                 (overlay-put (make-overlay (line-beginning-position)
                                                                            (save-excursion
                                                                              (progn
                                                                                (forward-line 1)
                                                                                (point)))) 'face '((:background "#4f3535")))
                                                 (setq hunk-line (+ hunk-line 1))))
                                              ((looking-at "^-.*")
                                               nil)
                                              (t
                                               (with-current-buffer buffer
                                                 (print hunk-line)

                                                 (goto-line hunk-line)

                                                 (overlay-put (make-overlay (line-beginning-position)
                                                                            (save-excursion
                                                                              (progn
                                                                                (forward-line 1)
                                                                                (point)))) 'face '((:background "#4f354f")))
                                                 (setq hunk-line (+ hunk-line 1)))))))))))))





(setq git-parsed-commits (make-hash-table :test 'equal))

(defun git-get-line-commit-info ()
  (interactive)
  (save-excursion
    (save-window-excursion
      (let ((line (buffer-substring-no-properties (point-at-bol) (point-at-eol)))
            (buf (current-buffer))
            (line-number (line-number-at-pos (point))))
        (with-temp-buffer
          (when (buffer-file-name buf)
            (= (apply 'call-process "git" nil (current-buffer) nil (list "blame" "--porcelain" "--" (buffer-file-name buf))) 0)
            (goto-char (point-min))
            (while (re-search-forward "^\\([0-9a-f]\\{40\\}\\) \\([0-9]+\\) \\([0-9]+\\)\\(?: \\([0-9]+\\)\\)?$" nil t)
              (let ((commit-line-number (read (match-string 3)))
                    (commit-number-of-lines (read (or (match-string 4) "nil")))
                    (commit-revision (match-string 1)))
                (when commit-number-of-lines
                  (parse-commit-info commit-revision))
                (when (eq line-number commit-line-number)
                  (print (gethash commit-revision git-parsed-commits))))
              )))))))

(defun parse-commit-info (revision &optional commit-alist)
  (setq commit-alist (gethash revision git-parsed-commits nil))
  (unless commit-alist
    (add-to-list 'commit-alist `(revision . ,revision))
    (while (and (not (looking-at "^\\([0-9a-f]\\{40\\}\\) \\([0-9]+\\) \\([0-9]+\\)\\(?: \\([0-9]+\\)\\)?$"))
                (not (eobp)))
      (cond ((looking-at "author \\(.*\\)$")
             (add-to-list 'commit-alist `(author . ,(match-string 1))))
            ((looking-at "author-mail \\(.*\\)$")
             (add-to-list 'commit-alist `(author-mail . ,(match-string 1))))
            ((looking-at "author-time \\(.*\\)$")
             (add-to-list 'commit-alist `(author-time . ,(match-string 1))))
            ((looking-at "author-tz \\(.*\\)$")
             (add-to-list 'commit-alist `(author-tz . ,(match-string 1))))
            ((looking-at "commiter \\(.*\\)$")
             (add-to-list 'commit-alist `(commiter . ,(match-string 1))))
            ((looking-at "commiter-mail \\(.*\\)$")
             (add-to-list 'commit-alist `(commiter-mail . ,(match-string 1))))
            ((looking-at "commiter-time \\(.*\\)$")
             (add-to-list 'commit-alist `(commiter-time . ,(match-string 1))))
            ((looking-at "commiter-tz \\(.*\\)$")
             (add-to-list 'commit-alist `(commiter-tz . ,(match-string 1))))
            ((looking-at "summary \\(.*\\)$")
             (add-to-list 'commit-alist `(summary . ,(match-string 1))))
            ((looking-at "previous \\(.*\\)$")
             (add-to-list 'commit-alist `(previous . ,(match-string 1))))
            ((looking-at "filename \\(.*\\)$")
             (add-to-list 'commit-alist `(filename . ,(match-string 1))))
            )
      (next-line)
      (goto-char (point-at-bol)))
    (puthash revision commit-alist git-parsed-commits))
  commit-alist)

(provide 'git-overlay)
