(mac-auto-operator-composition-mode)
(when (display-graphic-p)
  (setq
   ns-use-proxy-icon nil
   initial-frame-alist
   '((tool-bar-lines . 0)
	 (ns-transparent-titlebar t)
	 (ns-apperance . dark)
     (width . 200)
     (height . 40))
   default-frame-alist
   '((tool-bar-lines . 0)
	 (ns-transparent-titlebar t)
	 (ns-apperance . dark)
	 (width . 200)
	 (height . 40))))

(defun load-directory (dir)
  (let ((load-it
		 (lambda (f)
		   (load-file (concat "/Users/alyssa/.emacs.d/" dir "/" f)))
		 ))
    (mapc load-it (directory-files (concat (expand-file-name dir "~/.emacs.d")) nil "\\.el$"))))
(defun byte-compile-init-dir ()
  (interactive)
  (byte-recompile-directory user-emacs-directory 0))

(defvar emacs-dir
  (eval-when-compile (file-truename user-emacs-directory)))

(defvar cache-dir (concat emacs-dir ".cache"))


(set-face-attribute 'default t
					:family "Hasklig"
					:height 140
					:weight 'normal
					:width 'normal)
(require 'package)
(setq package-enable-at-startup nil
      package--init-file-ensured t)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
						 ("gnu"       . "http://elpa.gnu.org/packages/")
						 ("melpa"     . "https://melpa.org/packages/")
						 ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(load-directory "core")
(load-directory "lib")
(load-directory "ui")
(load-directory "lang")
;; THIS MUST BE THE LAST THING IN THE FILE!
(add-hook 'emacs-startup-hook
		  (lambda ()
			(setq gc-cons-threshold 16777216
				  gc-cons-percentage 0.1)))
