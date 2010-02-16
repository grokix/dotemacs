
;; common settings for different text & programming modes
(defun grokix/common-hook ()
  ;; (local-set-key "\C-c:" 'uncomment-region)
  ;; (local-set-key "\C-c;" 'comment-region)
  )

;; show FIXME/TODO/BUG keywords
(defun grokix/show-prog-keywords ()
  ;; highlight additional keywords
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  (font-lock-add-keywords nil '(("\\<\\(DONE\\):" 1 font-lock-doc-face t)))
  ;; highlight too long lines
  (font-lock-add-keywords nil '(("^[^\n]\\{120\\}\\(.*\\)$" 1 font-lock-warning-face t))))


;; clean trailing whitespaces automatically
(setq grokix/trailing-whitespace-modes '(c++-mode c-mode emacs-lisp-mode
                                                   lisp-mode))

(defun grokix/trailing-whitespace-hook ()
  (when (member major-mode grokix/trailing-whitespace-modes)
    (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'grokix/trailing-whitespace-hook)

;; untabify some modes
(setq grokix/untabify-modes '(haskell-mode emacs-lisp-mode lisp-mode scheme-mode
                                            erlang-mode clojure-mode))
(defun grokix/untabify-hook ()
  (when (member major-mode grokix/untabify-modes)
    (untabify (point-min) (point-max))))
(add-hook 'before-save-hook 'grokix/untabify-hook)









