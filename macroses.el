
;; Copy current line
(fset 'copy-current-line
   [home ?\C-  end ?\M-w return home ?\C-y home])
(global-set-key "\C-cc" 'copy-current-line)

;; Сохранить текущее слово в буфер
(fset 'word-kill-save
   [C-M-right ?\C-  C-M-left ?\M-w])
(global-set-key "\C-cw" 'word-kill-save)

;; toggle point in buffer
(require 'togglebm)

;; Переход между окнами Alt+стрелки. Ниже есть код для ресайза.
(windmove-default-keybindings 'meta)

;; fixup-whitespace puts the "right" amount of whitespace at the point
(global-set-key "\C-co" 'fixup-whitespace)

;; Чтобы не подтверждать закрытие буфера:
(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)
