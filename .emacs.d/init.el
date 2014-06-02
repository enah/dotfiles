;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------------
(add-to-list 'load-path "~/.emacs.d")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
;;(require 'smooth-scrolling)
(require 'whitespace)
(require 'dired-x)
(require 'compile)
(require 'saveplace)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;;(add-hook 'web-mode-hook (lambda () (setq comment-start "<%#" comment-end "%>")))

(require 'auto-complete-config)
(ac-config-default)

;; Essay mode
;; (add-hook 'text-mode-hook (lambda () (flyspell-mode 1)))
;; (global-set-key (kbd "<f8>") 'ispell-word)
;; (global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
;; (global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
;; (global-set-key (kbd "C-<") 'flyspell-check-previous-highlighted-word)
;; (defun flyspell-check-next-highlighted-word ()
;;   "Custom function to spell check next highlighted word"
;;   (interactive)
;;   (flyspell-goto-next-error)
;;   (ispell-word)
;;   )
;; (global-set-key (kbd "C-<f8>") 'flyspell-check-next-highlighted-word)
;; (add-hook 'text-mode-hook 'longlines-mode)

(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'LaTeX-mode-hook 'turn-on-visual-line-mode)
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(ido-mode t)
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(normal-erase-is-backspace-mode 0)
(show-paren-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq show-paren-delay 0)
(setq ido-enable-flex-matching t)
(setq uniquify-buffer-name-style 'forward)
(setq-default save-place t)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      save-place-file (concat user-emacs-directory "places")
      backup-directory-alist `(("." . "~/.saves")))
(normal-erase-is-backspace-mode 1)

;(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

;; For essays
;; (set-face-attribute 'default nil
;; 		    :family "Times New Roman"
;; 		    :height 200)

(set-face-attribute 'default nil
		    :family "Liberation Mono"
		    :height 150)


;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(default ((t (:inherit autoface-default :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "monaco"))))
; '(column-marker-1 ((t (:background "red"))))
; '(diff-added ((t (:foreground "cyan"))))
; '(flymake-errline ((((class color) (background light)) (:background "Red"))))
; '(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "red"))))
; '(fundamental-mode-default ((t (:inherit default))))
; '(highlight ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
; '(isearch ((((class color) (min-colors 8)) (:background "yellow" :foreground "black"))))
; '(linum ((t (:foreground "black" :weight bold))))
; '(region ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
; '(secondary-selection ((((class color) (min-colors 8)) (:background "gray" :foreground "cyan"))))
; '(show-paren-match ((((class color) (background light)) (:background "black"))))
; '(vertical-border ((t nil))))

;; ------------
;; -- Macros --
;; ------------
(load "defuns-config.el")
(fset 'align-equals "\C-[xalign-regex\C-m=\C-m")
(global-set-key "\M-=" 'align-equals)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c;" 'comment-or-uncomment-region)
(global-set-key "\M-n" 'next5)
(global-set-key "\M-p" 'prev5)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-i" 'back-window)
(global-set-key "\C-z" 'zap-to-char)
;;(global-set-key "\C-m" 'backward-delete-char)
(global-set-key "\M-d" 'delete-word)
(global-set-key "\M-m" 'backward-delete-word)
(global-set-key "\M-u" 'zap-to-char)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; (global-set-key (kbd "C-c C-c") 'comment-region)
;; (global-set-key (kbd "C-c C-u") 'uncomment-region)

;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
(load "js-config.el")
(add-to-list 'load-path "~/.emacs.d/jade-mode") ;; github.com/brianc/jade-mode
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
