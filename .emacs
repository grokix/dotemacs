
(push "~/emacs/misc" load-path)

;; Customizations (M-x customize) in a separate file
(setq custom-file "~/emacs/custom.el")
;; The 'noerror argument passed to load prevents errors if the file doesn’t exist
(load custom-file 'noerror)

(set-language-environment "Russian")

(when (equal system-type 'gnu/linux)
  (load "~/emacs/rc/rc-system-linux.el")
  )
(when (equal system-type 'windows-nt)
  (load "~/emacs/rc/rc-system-windows.el")
  )

;; Loading all rc files
(load "~/emacs/rc/rc-org-mode.el")
(load "~/emacs/rc/rc-color-theme.el")
(load "~/emacs/rc/rc-misc.el")
(load "~/emacs/rc/rc-delphi.el")
(load "~/emacs/rc/rc-common-hooks.el")
(load "~/emacs/rc/rc-ccmode.el")
(load "~/emacs/rc/rc-decor.el")
(load "~/emacs/rc/rc-desktop.el")
(load "~/emacs/rc/rc-iswitchb.el")

(load "~/emacs/macroses.el")
