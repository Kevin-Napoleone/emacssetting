
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  )

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar taohuadaozhu/packages '(
		      company
		      monokai-theme
		      hungry-delete
		      swiper
		      ivy
		      counsel
		      smartparens
		      js2-mode
		      nodejs-repl
		      popwin
		      ) "Default packages")


(setq package-selected-packages taohuadaozhu/packages)

;; cl - Common Lisp Extension
(require 'cl)


(defun taohuadaozhu/packages-installed-p ()
     (loop for pkg in taohuadaozhu/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

(unless (taohuadaozhu/packages-installed-p)
  (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg taohuadaozhu/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;smartparens config
(smartparens-global-mode t)


;;swiper consel ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;;js config
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


;;open global company completion
(global-company-mode t)

;;popwin config
(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
