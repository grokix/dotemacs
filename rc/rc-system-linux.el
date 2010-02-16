(prefer-coding-system 'utf-8)
(message "Linux section run")
(when (equal (getenv "TERM") "xterm")
  (message "TERM xterm section run")
  ;; Настройка подсветки текущей строки
  (global-hl-line-mode 1)
  (set-face-background 'hl-line "grey20")
  (custom-set-variables
   '(x-select-enable-clipboard t)
   '(interprogram-paste-function (quote x-cut-buffer-or-selection-value))
   )
  )
(when (equal (getenv "TERM") "linux")
  (message "TERM linux section run")
  ;; Настройка подсветки текущей строки
  (global-hl-line-mode 1)
  (set-face-background 'hl-line "yellow")
  )