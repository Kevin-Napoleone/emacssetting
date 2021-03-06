;;; init.el --- myinit
;;; Commentary:
;;; Code:
(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(add-to-list 'default-frame-alist '(font . "Fira Code Medium" ))
(set-face-attribute 'default t :font "Fira Code Medium" )

(set-face-attribute 'default nil :font "Fira Code Medium" )
(set-frame-font "Fira Code Medium" nil t)

              

(add-to-list 'default-frame-alist '(height . 32))
(add-to-list 'default-frame-alist '(width . 100))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


(require 'init-startup)
(require 'init-elpa)
(require 'init-ui)
(require 'init-package)
(require 'init-const)
(require 'init-lsp)

(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) . "clangd"))

(when (file-exists-p custom-file)
  (load-file custom-file))
;;; init.el ends here
