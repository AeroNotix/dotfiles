;;; docker-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "docker" "docker.el" (22339 20664 220809 959000))
;;; Generated autoloads from docker.el

(autoload 'docker-mode "docker" "\
Minor mode to manage docker.

\(fn &optional ARG)" t nil)

(defvar docker-global-mode nil "\
Non-nil if Docker-Global mode is enabled.
See the `docker-global-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `docker-global-mode'.")

(custom-autoload 'docker-global-mode "docker" nil)

(autoload 'docker-global-mode "docker" "\
Toggle Docker mode in all buffers.
With prefix ARG, enable Docker-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Docker mode is enabled in all buffers where
`docker-mode' would do it.
See `docker-mode' for more information on Docker mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "docker-containers" "docker-containers.el"
;;;;;;  (22339 20664 200810 27000))
;;; Generated autoloads from docker-containers.el

(autoload 'docker-containers "docker-containers" "\
List docker containers.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "docker-images" "docker-images.el" (22339 20664
;;;;;;  204143 349000))
;;; Generated autoloads from docker-images.el

(autoload 'docker-images "docker-images" "\
List docker images.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "docker-machine" "docker-machine.el" (22339
;;;;;;  20664 197476 705000))
;;; Generated autoloads from docker-machine.el

(autoload 'docker-machines "docker-machine" "\
List docker machines.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "docker-networks" "docker-networks.el" (22339
;;;;;;  20664 217476 637000))
;;; Generated autoloads from docker-networks.el

(autoload 'docker-networks "docker-networks" "\
List docker networks.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "docker-volumes" "docker-volumes.el" (22339
;;;;;;  20664 214143 315000))
;;; Generated autoloads from docker-volumes.el

(autoload 'docker-volumes "docker-volumes" "\
List docker volumes.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("docker-pkg.el" "docker-process.el" "docker-utils.el")
;;;;;;  (22339 20664 210809 993000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; docker-autoloads.el ends here
