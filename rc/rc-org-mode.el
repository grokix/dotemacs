
;; Если мы будем хранить все расширения в домашней директории
;; (add-to-list 'load-path "~/emacs/org-mode")
;; (add-to-list 'load-path "~/emacs/org-mode/contrib")

;; Установка различных переменных
(custom-set-variables
 '(org-hide-leading-stars t)
)

(require 'org-install)
(require 'org)

;; Включение автоматического переключения в Org Mode при открытии файла с расширением .org:
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Установка горячих клавиш
;; (define-key global-map "\C-cr" 'org-remember) - чем так лучше?
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

(defun grokix/org-mode-hook ()
  (auto-fill-mode 1)
  (imenu-add-to-menubar "Imenu")
  )
(add-hook 'org-mode-hook 'grokix/org-mode-hook)
(add-hook 'org-mode-hook 'turn-on-font-lock)

;; (custom-set-variables
;; Настройка переменных Org Mode - списка файлов для Agenda Views, директории по умолчанию для Org Mode и файла заметок по умолчанию:
;; '(org-agenda-files (quote ("p:/documents/org/fto.org")))
;; '(org-default-notes-file "p:/documents/notes")
;; '(org-directory "p:/documents/org")
;; )

;;Несколько удобных shortcuts для сохранения ссылки на текущий заголовок и запуска org-agenda:
;;(global-set-key "\C-cl" 'org-store-link)
;;(global-set-key "\C-ca" 'org-agenda)

;; Задание цепочек ключевых слов (переключение между словами клавишами Shift + Right или + Left с курсором на заголовке). "|" отмечает границу, если заголовок в статусе после этого разделителя, то он "выполнен", это влияет на планирование и отображение в Agenda Views:
;; (setq org-todo-keywords
;; '((sequence "TODO" "WAIT" "|" "DONE")
;; Здесь - анализ, первичная разработка, тестирование консультантом, доработка, польз. тестирование, отказ от разработки и перенос на боевое окружение :) :
;; (sequence "ANLZ" "FDEV" "CTST" "RDEV" "UTST" "|" "CNCL" "TRNS")
;; )

;; Задание произвольного начертания ключевым словам:
;; (setq org-todo-keyword-faces
;; '(("TODO" . (:foreground "red" :weight bold))
;; ("WAIT" . (:foreground "orange" :weight bold))
;; ("DONE" . (:foreground "green" :weight bold)))
;; )
