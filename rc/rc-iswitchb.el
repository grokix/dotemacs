
;; Удобная переключалка буферов, исключения из списка и кэширование
(require 'iswitchb)
(iswitchb-mode 1)
;; (add-to-list 'iswitchb-buffer-ignore "*Messages*")
;; (add-to-list 'iswitchb-buffer-ignore "*Backtrace")
;; (add-to-list 'iswitchb-buffer-ignore "*Quail Com")
;; (add-to-list 'iswitchb-buffer-ignore "*Buffer")
;; (add-to-list 'iswitchb-buffer-ignore "*fsm-debug")
;; (add-to-list 'iswitchb-buffer-ignore "*Completions")
;; (add-to-list 'iswitchb-buffer-ignore "^[tT][aA][gG][sS]$")
;; (require 'filecache)
;; (load "iswitchb-fc")
;; и ещё более удобная:
(global-set-key "\C-x\C-b" 'ibuffer)