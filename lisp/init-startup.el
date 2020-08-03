;;; init-startup.el --- myinitstartup
;;; Commentary:
;;; Code:
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t)

(setq gc-cons-threshold most-positive-fixnum)

(setq ring-bell-function 'ignore)

(setq make-backup-files nil)

(provide 'init-startup)
;;; init-startup.el ends here
