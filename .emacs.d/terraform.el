(custom-set-variables
 '(terraform-indent-level 2))

(add-hook 'terraform-mode-hook #'lsp-deferred)

(defun insert-version-label ()
  (interactive)
  (insert (format "version = \"${local.%s_version}\"" (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))))

(defun insert-squad-owner ()
  (interactive)
  (end-of-buffer)
  (previous-line)
  (newline-and-indent)
  (previous-line)
  (insert "squad_owner = \"customer\"")
  (terraform-format-buffer)
  (save-buffer))
