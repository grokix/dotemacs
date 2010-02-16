
;;Toggle between saved positions as in MIM editor
(defun save-point-and-switch ()
  "Save current point to register 0 and go
to the previously saved position"
  (interactive)
  (let (temp)
    (setq temp (point-marker))
    (when (not (equal (get-register 0) nil))
      (jump-to-register 0))
    (set-register 0 temp)))

;;Save current position to register 0
(defun save-point-only ()
  "Save current point to register 0"
  (interactive)
  (set-register 0 (point-marker)))

(global-set-key "\C-ct" 'save-point-and-switch)
(global-set-key "\C-cs" 'save-point-only)

(provide 'togglebm)