(global-whitespace-mode)

(defun disable-tabs ()
  (interactive)
  (setq indent-tabs-mode nil))

(defun enable-tabs  ()
  (interactive)
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width 2))

(setq whitespace-style '(face tabs tab-mark trailing))
(custom-set-faces
 '(whitespace-tab ((t (:foreground "#3f396b")))))

(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9])))

(setq backward-delete-char-untabify-method 'hungry)
