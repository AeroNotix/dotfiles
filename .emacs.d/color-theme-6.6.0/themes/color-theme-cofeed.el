(defun color-theme-coffeed ()
  (interactive)
  (color-theme-install
   '(color-theme-coffeed
      ((background-color . "#0f0505")
      (background-mode . light)
      (border-color . "#53330e")
      (cursor-color . "#403f3f")
      (foreground-color . "#c7c5a8")
      (mouse-color . "black"))
     (fringe ((t (:background "#53330e"))))
     (mode-line ((t (:foreground "#ffffff" :background "#552b2b"))))
     (region ((t (:background "#383838"))))
     (font-lock-builtin-face ((t (:foreground "#c7c5a8"))))
     (font-lock-comment-face ((t (:foreground "#43573d"))))
     (font-lock-function-name-face ((t (:foreground "#a0373d"))))
     (font-lock-keyword-face ((t (:foreground "#cf7017"))))
     (font-lock-string-face ((t (:foreground "#2c3c68"))))
     (font-lock-type-face ((t (:foreground"#707070"))))
     (font-lock-variable-name-face ((t (:foreground "#e31f1c"))))
     (minibuffer-prompt ((t (:foreground "#729cff" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'color-theme-coffeed)