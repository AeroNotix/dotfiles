(defvar old-file-name-handler file-name-handler-alist)
(setq file-name-handler-alist nil
      gc-cons-threshold most-positive-fixnum)

(add-hook 'after-init-hook (lambda nil
                             (setq file-name-handler-alist old-file-name-handler)))
