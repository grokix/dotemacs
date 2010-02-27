
;;;     (defvar fume-function-name-regexp-delphi
;;;       "^[ \t]*\\(function\\|procedure\\|constructor\\|destructor\\)[ \t]+\\([_a-zA-Z][_a-zA-Z0-9]*\\.\\)?\\([_a-zA-Z][_a-zA-Z0-9]*\\)"
;;;       "Expression to get function/procedure names in Delphi.")
;;;     (add-to-list 'fume-function-name-regexp-alist
;;;                  '(delphi-mode . fume-function-name-regexp-delphi))

;;;     (defun fume-find-next-delphi-function-name (buffer)
;;;       "Search for the next Delphi procedure in BUFFER."
;;;       (set-buffer buffer)
;;;       (if (re-search-forward fume-function-name-regexp nil t)
;;;           (let ((beg (match-beginning 3))
;;;                 (end (match-end 3)))
;;;             (cons (buffer-substring beg end) beg))))
;;;     (add-to-list 'fume-find-function-name-method-alist
;;;                  '(delphi-mode . fume-find-next-delphi-function-name))

(modify-coding-system-alist 'file "\\.pas\\'" 'cp866-dos)
(modify-coding-system-alist 'file "\\.PAS\\'" 'cp866-dos)

(add-to-list 'auto-mode-alist '("\\.pas$" . delphi-mode))
(add-to-list 'auto-mode-alist '("\\.PAS$" . delphi-mode))
(add-to-list 'auto-mode-alist '("\\.dpr$" . delphi-mode))

(add-hook 'delphi-mode-hook
          #'(lambda ()
              (setq ispell-local-dictionary "russianw")
              (flyspell-mode)

              (setq comment-start "{")
              (setq comment-end "}")
              (setq comment-start-skip "(\\*+ *\\|{ *")


              ;; (loop for c from ?! to ?' do (modify-syntax-entry  c "."))
              ;; (loop for c from ?* to ?/ do (modify-syntax-entry  c "."))
              ;; (loop for c from ?: to ?@ do (modify-syntax-entry  c "."))

              (modify-syntax-entry  ?\ ".")
              (modify-syntax-entry  ?^ ".")
              (modify-syntax-entry  ?` ".")
              (modify-syntax-entry  ?~ ".")
              (modify-syntax-entry  ?| ".")

              (local-set-key (kbd "<RET>")
                             #'(lambda ()
                                 (interactive)
                                 (indent-according-to-mode)
                                 (newline-and-indent)))
              ;; (turn-on-lazy-lock)
              (setq delphi-indent-level 2)
              (setq delphi-case-indent 2)
              (add-hook 'compilation-mode-hook
                        #'(lambda ()
                            (add-to-list 'compilation-error-regexp-alist
                                         '("^\\([^(]+\\)(\\([0-9]+\\)" 1 2))))
              (add-hook 'speedbar-mode-hook
                        #'(lambda ()
                            (setq speedbar-file-unshown-regexp
                                  (concat
                                   speedbar-file-unshown-regexp
                                   "\\|\\.dfm\\|\\.ddp\\|\\.dcu\\|\\.dof"))
                            (speedbar-add-supported-extension ".pas")))

              (abbrev-mode 1)
              (define-abbrev local-abbrev-table
                "beg" t #'(lambda ()
                            (skeleton-insert '(nil "in" > \n
                                                   _ \n
                                                   "end;" > \n))
                            (setq skeleton-abbrev-cleanup (point))
                            (add-hook 'post-command-hook
                                      'skeleton-abbrev-cleanup
                                      nil t)))
              (define-abbrev local-abbrev-table
                "bege" t #'(lambda ()
                             (skeleton-insert '(nil -1 "in" > \n
                                                    _ \n
                                                    "end" > \n
                                                    "else" > \n
                                                    "begin" > \n \n
                                                    "end;" > \n))
                             (setq skeleton-abbrev-cleanup (point))
                             (add-hook 'post-command-hook
                                       'skeleton-abbrev-cleanup
                                       nil t)))
              (define-abbrev local-abbrev-table
                "if" t #'(lambda ()
                           (skeleton-insert '(nil _ " then" > \n))))
              (define-abbrev local-abbrev-table
                "ife" t #'(lambda ()
                            (skeleton-insert '(nil -1 _ " then" > \n \n
                                                   "else" > \n))))
              (define-abbrev local-abbrev-table
                "ifb" t #'(lambda ()
                            (skeleton-insert '(nil -1 _ " then" > \n
                                                   "begin" > \n \n
                                                   "end;" > \n))))
              (define-abbrev local-abbrev-table
                "ifbe" t #'(lambda ()
                             (backward-delete-char 1)
                             (skeleton-insert '(nil -1 _ " then" > \n
                                                    "begin" > \n \n
                                                    "end" > \n
                                                    "else" > \n
                                                    "begin" > \n \n
                                                    "end;" > \n))))
              (define-abbrev local-abbrev-table
                "proc" t #'(lambda ()
                             (skeleton-insert '(nil "edure" _ ";" > \n
                                                    "var" > \n \n
                                                    "begin" > \n \n
                                                    "end;" > \n))))
              (define-abbrev local-abbrev-table
                "func" t #'(lambda ()
                             (skeleton-insert '(nil "tion" _ " : ;" > \n
                                                    "var" > \n \n
                                                    "begin" > \n \n
                                                    "end;" > \n))))
              (define-abbrev local-abbrev-table
                "for" t #'(lambda ()
                            (skeleton-insert '(nil _ " to do" > \n))))
              (define-abbrev local-abbrev-table
                "forb" t #'(lambda ()
                             (skeleton-insert '(nil -1 _ " to do" > \n
                                                    "begin" > \n \n
                                                    "end;" > \n))))

              ))

(defvar imenu--function-name-regexp-delphi
  (concat
   "^[ \t]*\\(function\\|procedure\\|constructor\\|destructor\\)[ \t]+"
   "\\([_a-zA-Z][_a-zA-Z0-9]*\\.\\)?"   ; class?
   "\\([_a-zA-Z][_a-zA-Z0-9]*\\)")
  "Re to get function/procedure names in Delphi.")

(defun imenu--create-delphi-index (&optional regexp)
  (let ((index-alist '())
        (progress-prev-pos 0)
        (case-fold-search t))
    (goto-char (point-min))
    (imenu-progress-message progress-prev-pos 0)
    (save-match-data
      (while (re-search-forward
              (or regexp imenu--function-name-regexp-delphi)
              nil t)
        (imenu-progress-message progress-prev-pos)
        (let ((pos (save-excursion
                     (beginning-of-line)
                     (if imenu-use-markers (point-marker) (point))))
              (function-name (match-string-no-properties 3)))
          (push (cons function-name pos)
                index-alist))))
    (imenu-progress-message progress-prev-pos 100)
    (nreverse index-alist)))

(add-hook 'delphi-mode-hook
          #'(lambda ()
              (require 'imenu)
              (setq imenu-create-index-function
                    #'imenu--create-delphi-index)
              (imenu-add-menubar-index)))


;; (autoload 'delphi-mode "delphi")
;; (setq auto-mode-alist
;;       (cons '("\\.\\(pas\\|dpr\\|dpk\\)$" . delphi-mode) auto-mode-alist))

;; (defun my-delphi-mode-hook ()
;;   (setq delphi-indent-level       2
;;      delphi-case-indent        2
;;      delphi-auto-newline       nil
;;      delphi-tab-always-indent  t
;;      delphi-auto-endcomments   t
;;      delphi-auto-lineup        nil
;;      auto-revert-mode 1
;;      indent-tabs-mode nil
;;      fill-column 80
;;      )
;;   (setq ispell-local-dictionary "russianw")
;;   (flyspell-mode)
;;   )

;; (add-hook 'delphi-mode-hook 'my-delphi-mode-hook)


;; (defun my-pascal-mode-hook ()
;;   (setq pascal-indent-level       2
;;      pascal-case-indent        2
;;      pascal-auto-newline       nil
;;      pascal-tab-always-indent  t
;;      pascal-auto-endcomments   t
;;      pascal-auto-lineup        nil
;;      pascal-toggle-completions nil
;;      pascal-type-keywords      '("array" "file" "packed" "char"
;;                                  "integer" "real" "string" "record")
;;      pascal-start-keywords     '("begin" "end" "function" "procedure"
;;                                  "repeat" "until" "while" "read" "readln"
;;                                  "reset" "rewrite" "write" "writeln"
;;                                  "constructor" "destructor" "object")
;;      pascal-separator-keywords '("downto" "else" "mod" "div" "then")
;;      auto-revert-mode 1
;;      indent-tabs-mode nil
;;      fill-column 80
;;      )
;;   (setq ispell-local-dictionary "russianw")
;;   (flyspell-mode)
;;   )

;; (add-hook 'pascal-mode-hook 'my-pascal-mode-hook)
