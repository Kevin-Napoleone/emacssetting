;;; package --- myinitui
;;; Commentary:
;;; Code:

;;(use-package gruvbox-theme
;;  :init (load-theme 'gruvbox-dark-soft t))

(use-package smart-mode-line
  :init (setq sml/no-confirm-load-theme t
	      sml/theme 'respectful)
  (sml/setup))

(global-display-line-numbers-mode t)

(provide 'init-ui)
;;; init-ui.el ends here
