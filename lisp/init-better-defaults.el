(setq ring-bell-function 'ignore)

;;unuse backup file
(setq make-backup-files nil)

;;open recent file
(recentf-mode 1)
(setq recentf-max-menu-items 15)

;;show parens match
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)


(provide 'init-better-defaults)
