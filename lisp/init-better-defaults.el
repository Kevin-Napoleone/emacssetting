(setq ring-bell-function 'ignore)

;;maximized window
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;unuse backup file
(setq make-backup-files nil)

;;open recent file
(recentf-mode 1)
(setq recentf-max-menu-items 15)

;;removing pairs
(sp-pair "'" nil :actions :rem)

;;adding pairs
;;(sp-pair "'" "'" )

;;show parens match
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

;;indentation
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))


(provide 'init-better-defaults)
