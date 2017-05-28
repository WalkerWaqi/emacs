(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)

(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)

(blink-cursor-mode t)
(setq-default cursor-type 'bar)

(require 'hl-line)
(global-hl-line-mode t)

(setq require-final-newline t)

(add-hook 'after-init-hook (lambda () (load-theme 'manoj-dark)))

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(unless (package-installed-p 'window-numbering)
  (package-install 'window-numbering))
(require 'window-numbering)
(window-numbering-mode t)

(unless (package-installed-p 'cmake-project)
  (package-install 'cmake-project))
(require 'cmake-project)
(defun maybe-cmake-project-hook ()
  (if (file-exists-p "CMakeLists.txt") (cmake-project-mode)))
(add-hook 'c-mode-hook 'maybe-cmake-project-hook)
(add-hook 'c++-mode-hook 'maybe-cmake-project-hook)

(unless (package-installed-p 'srefactor)
  (package-install 'srefactor))
(require 'srefactor)
(require 'srefactor-lisp)
(semantic-mode 1)
;; (define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
;; (define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
;; (global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
;; (global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
;; (global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
;; (global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)

(unless (package-installed-p 'emr)
  (package-install 'emr))
(require 'emr)
(define-key c-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
(add-hook 'c-mode-hook 'emr-initialize)
(define-key c++-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
(add-hook 'c++-mode-hook 'emr-initialize)

(unless (package-installed-p 'protobuf-mode)
  (package-install 'protobuf-mode))
(require 'protobuf-mode)

(unless (package-installed-p 'multiple-cursors)
  (package-install 'multiple-cursors))
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(unless (package-installed-p 'autopair)
  (package-install 'autopair))
(require 'autopair)
(autopair-global-mode)

(unless (package-installed-p 'function-args)
  (package-install 'function-args))
(require 'function-args)
(fa-config-default)
