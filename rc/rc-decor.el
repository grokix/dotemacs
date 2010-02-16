
(display-time)
(blink-cursor-mode t)

;; use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; enable fullscreen
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;; set misc decoration variables
(custom-set-variables
 '(global-font-lock-mode t)
 '(scalable-fonts-allowed t)
 '(uniquify-buffer-name-style (quote forward))
 '(use-dialog-box nil)
 '(column-number-mode t)
 '(display-time-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(custom-buffer-done-kill t)
 '(initial-scratch-message nil)
 '(transient-mark-mode t))

;; Настройка скроллинга
(setq scroll-conservatively 50)
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 10)

(set-scroll-bar-mode (quote right))
;; (setq inhibit-startup-message t)

;; window frame title
(setq frame-title-format "emacs [%b %*%+ %f]")
(setq icon-title-format "emacs [%b]")

;; Не пора ли есть/домой/спать? :)
(setq display-time-string-forms
      '(24-hours ":" minutes))
(display-time)

;; Курсор в стандартном виде «палочки» а не прямоугольника (see emacs-goodies-el in Debian for this and others goodies)
;; В MD не пашет
;; (bar-cursor-mode t)

