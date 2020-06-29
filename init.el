(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)
(require 'init-ul)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybinding)
(setq ring-bell-function 'ignore)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
