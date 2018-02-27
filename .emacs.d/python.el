(defun flymake-pylint-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "~/.emacs.d/epylint" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pylint-init))

(set-variable 'python-indent-offset 4)
(add-hook 'python-mode-hook (lambda ()
                              (flymake-mode-on)))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)

(font-lock-add-keywords 'python-mode
                        (list
                         `(,(regexp-opt (list "async " "await ")) . font-lock-keyword-face)))
