;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
)

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      company
		      monokai-theme
		      hungry-delete
		      swiper
		      ivy
		      counsel
		      smartparens
		      js2-mode
		      nodejs-repl
		      ) "Default packages")


(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))



;;config for smartparens
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;;js config
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


;;swiper consel ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)


;;kuai jie jian
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)



;;turn off the toolbar
(tool-bar-mode -1)

;;display line number
(global-linum-mode t)

;;turn off file slide control
(scroll-bar-mode -1)

;;turn off the startup help screen
(setq inhibit-splash-screen 1)

;;open global company completion
(global-company-mode t)

;;unuse backup file
(setq make-backup-files nil)

;;hightlight in org file
(require 'org)
(setq org-src-fontify-natively t)

;;set default dir Agenda
(setq org-agenda-files '("~/org"))
;;set shortcuts
(global-set-key (kbd "C-c a") 'org-agenda)

;;open recent file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 15)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;add delete selection mode
(delete-selection-mode t)

;;show parens match
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;show current line
(global-hl-line-mode t)

;;hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;set window position and size
;;(set-frame-position (selected-frame) 0 0)
;;(set-frame-width (selected-frame) 90)
;;(set-frame-height (selected-frame) 30)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 1)
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes
   (quote
    ("f3ab34b145c3b2a0f3a570ddff8fabb92dafc7679ac19444c31058ac305275e1" default)))
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(magit-diff-use-overlays nil)
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "CTDB" :slant normal :weight semi-bold :height 120 :width normal)))))
