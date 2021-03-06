
;;; emacs-pass-simple.el --- Interface with pass 

;; Copyright (C) 2018 Justin Taft

;; Author: Justin Taft <justin@justin-taft.com>
;; Maintainer: Justin Taft <justin@justin-taft.com>
;; Created: 28 July 2018 
;; Keywords: comm, tools
;; Version: 0.0.1
;; Homepage: https://github.com/justintaft/emacs-pass-simple

;; This file is NOT part of GNU Emacs.

(provide 'emacs-pass-simple)

(defvar emacs-pass-simple-mode-hook nil)

(define-derived-mode emacs-pass-simple-mode fundamental-mode "emacs-pass-simple"
  "major mode for managing pass keys, and copying to clipboard.
   Pressing \"enter\" on a line will copy the key under the cursor to the clipboard.")

(defun jt-emacs-pass-simple-copy-pass-to-clipboard ()
  (interactive)
  (let* ((pass-name (string-trim (thing-at-point 'line t)))
        (base-location (file-name-directory (find-library-name "emacs-pass-simple")))
        (pass-applescript (concat base-location "Emacs Pass Simple.app")))
    (call-process "open" nil "emacs-simple-pass" t pass-applescript "--args" "-stringArg" pass-name)
    (kill-buffer-and-window)))

(defun jt-emacs-pass-simple-list-passwords ()
  (interactive)
  (pop-to-buffer (get-buffer-create "emacs-pass-simple"))
  (emacs-pass-simple-mode)
  (setq buffer-read-only nil)
  (erase-buffer)
  (insert "Found passwords (move cursor to line and press enter to copy the password to system clipboard): \n\n")
  (call-process "sh" nil "emacs-pass-simple" t "-c" "find ~/.password-store -name '*.gpg' | sed 's/.*password-store\\///g' | sed 's/\.gpg$//g'")
  (setq buffer-read-only t)
  (swiper))

(define-key emacs-pass-simple-mode-map (kbd "<RET>") 'jt-emacs-pass-simple-copy-pass-to-clipboard)
(define-key emacs-pass-simple-mode-map (kbd "q") 'kill-buffer-and-window)
;(evil-define-key 'normal emacs-pass-simple-mode-map (kbd "q") 'kill-buffer-and-window)
       

;;; emacs-pass-simple.el ends here
