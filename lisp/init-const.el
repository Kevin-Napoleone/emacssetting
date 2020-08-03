;;; init-const.el --- myconst
;;; Commentary:
;;; Code:
(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux)
  "判断操作系统是否是linux")
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

(provide 'init-const)
;;; init-const.el ends here
