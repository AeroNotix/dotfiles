;;; pkgbuild-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "pkgbuild-mode" "pkgbuild-mode.el" (22112 18888
;;;;;;  272482 737000))
;;; Generated autoloads from pkgbuild-mode.el

(autoload 'pkgbuild-mode "pkgbuild-mode" "\
Major mode for editing PKGBUILD files. This is much like shell-script-mode mode.
 Turning on pkgbuild mode calls the value of the variable `pkgbuild-mode-hook'
with no args, if that value is non-nil.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("/PKGBUILD\\'" . pkgbuild-mode))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; pkgbuild-mode-autoloads.el ends here
