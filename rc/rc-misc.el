
;; (defun my-text-mode-hook ()
;;   (setq fill-column 80
;;      )
;;   (flyspell-mode)
;;   )
;; (add-hook 'text-mode-hook 'my-text-mode-hook)

(setq text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
(custom-set-variables
 '(delete-selection-mode t)
 '(fill-column 80)
 '(kill-whole-line t)
 ;; '(tab-always-indent t)
 ;; '(indent-tabs-mode nil)
 ;; '(tab-width 8)
 ;; '(next-line-add-newlines t)
 )

(put 'downcase-region 'disabled nil)