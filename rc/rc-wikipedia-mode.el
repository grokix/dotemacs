
;; (add-to-list 'load-path "~/emacs/packages/wikipedia-mode")

;; (autoload 'wikipedia-mode "wikipedia-mode.el"
;;  "Major mode for editing documents in Wikipedia markup." t)

;; (add-to-list 'auto-mode-alist
;;    '("\\.wiki\\'" . wikipedia-mode))

;; ;; Для того чтобы автоматически использовать этот mode с расширением ViewSource для Firefox, добавте:
;; (add-to-list 'auto-mode-alist
;;   '("en\\.wikipedia\\.org" . wikipedia-mode))

;; ;; Для проверки орфографии в файлах, открытых в wikipedia-mode
;;  (setq text-mode-hook (quote (#[nil "\300\301!\207" [flyspell-mode 1] 2] flyspell-buffer text-mode-hook-identify)))

;; (add-to-list 'auto-mode-alist '("mozex.\\.*" . wikipedia-mode))

(add-to-list 'load-path "~/emacs/packages/wikipedia-mode")

(require 'mediawiki)
;; (require 'wikipedia)

(add-to-list 'auto-mode-alist
   '("\\.wiki\\'" . mediawiki-mode))

(add-to-list 'auto-mode-alist
'("orion.*\\.txt$" . mediawiki-mode))
