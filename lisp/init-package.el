;;; init-package.el --- my package setting
;;; Commentary:
;;; Code:

(use-package restart-emacs)

;; 查看启动速度
(use-package benchmark-init
  :init(benchmark-init/activate)
  :hook(after-init . benchmark-init/deactivate))

;; 删除当前行
(use-package crux
  :bind(("C-c k" . crux-smart-kill-line)
	("C-a" . crux-move-beginning-of-line)
	("C-x ," . crux-find-user-init-file)))

;; 向后/前面删除连续空白
(use-package hungry-delete
  :bind(("C-c DEL" . hungry-delete-backward))
  :bind(("C-c d" . hungry-delete-forward)))

;; 行/区域上下移动
(use-package drag-stuff
  :bind(("<M-up>" . drag-stuff-up)
	("<M-down>" . drag-stuff-down)))

;; 强化搜索
(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-count-format "%d%d "
	enable-recursive-minibuffers t
	ivy-rebuilders-alist '((t . ivy--regex-ignore-order))))

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
		swiper-include-line-number-in-search t))

;; company补全
(use-package company
  :config
  (setq company-dabbrev-code-everywhere t
	company-dabbrev-code-modes t
	company-dabbrev-code-other-buffers 'all
	company-dabbrev-downcase nil
	company-dabbrev-ignore-case t
	company-dabbrev-other-buffers 'all
	company-require-match nil
	company-minimum-prefix-length 2
	company-show-numbers t
	company-tooltip-limit 15
	company-idle-delay 0
	company-echo-delay 0
	company-tooltip-offset-display 'scrollbar
	company-begin-commands '(self-insert-command))
  (push '(company-semantic :with company-yasnippet) company-backends)
  :hook ((after-init . global-company-mode)))

;; 语法检查
;; 全局检查 :hook (after-init . global-flycheck-mode)
;; 只在编程语言模式下 :hook (prog-mode . flycheck-mode)
(use-package flycheck
  :hook (after-init . global-flycheck-mode))

(use-package which-key
  :defer nil
  :config (which-key-mode))

(provide 'init-package)
;;; init-package.el ends here
