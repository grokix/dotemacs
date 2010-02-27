
(add-to-list 'load-path "~/emacs/packages/color-theme/")

;;(define-coding-system-alias 'windows-1251 'cp1251)
;;(set-buffer-file-coding-system 'cp1251-dos)
(message "Windows-nt section run")
(set-default-coding-systems 'cp1251-dos)
(set-terminal-coding-system 'cp1251-dos)
;;Кодировка имен файлов
(set-file-name-coding-system 'cp1251-dos)
;;Кодировка в буфере обмена
(set-selection-coding-system 'utf-16le-dos)
(set-w32-system-coding-system 'cp1251-dos)
(prefer-coding-system 'cp1251-dos)
(prefer-coding-system 'utf-8)
(setq ispell-local-dictionary "russianw")

;; Настройка подсветки текущей строки
(global-hl-line-mode 1)
(set-face-background 'hl-line "grey20")
;;(emacsw32-maximize-frame)