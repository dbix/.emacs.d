;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load paths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/elisp/color-theme-6.6.0/")
(add-to-list 'load-path "~/.emacs.d/cl-lib/")
(add-to-list 'load-path "~/.emacs.d/elpa/")
(require 'cl-lib)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Terminal Preferences
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq ring-bell-fucntion 'ignore)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load libraries
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-library "indent-file") ;; Automatically indent file on save
(load-library "efuncs")      ;; I forget now

(require 'package) ;; Load package manager and source list
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")

                  ;; TODO: Maybe, use this after emacs24 is released
                  ;; (development versions of packages)
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))
(package-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set color scheme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-library "color-theme-marlboro") ;; Load my custom theme
(require 'color-theme)
(autoload 'color-theme-initialize "color-theme-marlboro" t nil)
(color-theme-marlboro)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mouse settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))

(setq mouse-sel-mode t)

(defun gcm-scroll-down ()
  (interactive)
  (scroll-up 1))

(defun gcm-scroll-up ()
  (interactive)
  (scroll-down 1))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C/C++ settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cc-mode)
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;; Projects require a Makefile for flymake to work. Use the following with a
;; tab, not spaces.
;; check-syntax:
;;     gcc -o nul -S ${CHK_SOURCES}
(require 'flymake)
;; Automatically initialize flymake instead of using M-x flymake every time
(add-hook 'find-file-hook 'flymake-find-file-hook)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ido settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'dired-mode-hook
          '(lambda () (setq ido-enable-replace-completing-read nil)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; For command line
(global-set-key (kbd "<mouse-4>") 'gcm-scroll-up)
(global-set-key (kbd "<mouse-5>") 'gcm-scroll-down)
;;(global-set-key (kbd "<C-x n>") 'next-buffer)
;;(global-set-key (kbd "C-x p>") 'previous-buffer)
;;(global-set-key (kbd "C-x DEL>") 'dired-do-delete)
(global-set-key [f12] 'compile)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous, non-functioning, and too scared to remove
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq initial-scratch-message ";; Scratch and Lisp evaluation buffer")
(require 'multi-term)
(setq multi-term-program "/bin/sh")
(require 'indent-file)
(add-hook 'emacs-lisp-mode-hook 'indent-file-when-save)
(add-hook 'emacs-lisp-mode-hook 'indent-file-when-visit)
