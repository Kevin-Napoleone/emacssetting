(setq ring-bell-function 'ignore)

;;maximized window
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;unuse backup file
(setq make-backup-files nil)

;;open recent file
(recentf-mode 1)
(setq recentf-max-menu-items 15)

;;removing pairs
;;(sp-pair "'" nil :actions :rem)

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




;;hippie
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

;;
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'init-better-defaults)
