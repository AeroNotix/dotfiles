(require 'go-mode)
(require 'go-autocomplete)
(require 'company)
(require 'company-go)

(defun go-packages-find ()
  (sort
   (delete-dups
    (cl-mapcan (lambda (topdir)
                 (let ((pkgdir (concat topdir "/pkg")))
                   (mapcar (lambda (file)
                             (let ((sub (substring file 0 -2)))
                               (mapconcat #'identity (cdr (split-string sub "/")) "/")))
                           (split-string (shell-command-to-string
                                          (format "find \"%s\" -not -path \"%s/tool*\" -not -path \"%s/obj/*\" -name \"*.a\"  -printf \"%%P\\n\""
                                                  pkgdir pkgdir pkgdir))))))
               (go-root-and-paths)))
   #'string<))

(setq go-packages-function 'go-packages-find)

(add-hook 'go-mode-hook
          '(lambda ()
             (global-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook
          '(lambda ()
             (global-set-key (kbd "C-c C-a") 'go-import-add)))
(add-hook 'before-save-hook #'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (flycheck-mode)
                          (company-mode)))
