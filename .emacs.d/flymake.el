(require 'flymake)
(global-set-key (kbd "C-{") 'flymake-display-err-menu-for-current-line)

 ;;; Set column width to 78 maximum in RST files
(add-hook 'rst-mode-hook
          '(lambda ()
             (setq-deqfault fill-column 78)))
