(setq-default
 hscroll-margin 2
 hscroll-step 1
 scroll-conservatively 1001
 scroll-margin 0
 scroll-preserve-screen-position nil
 require-final-newline t
 tab-always-indent t
 prettify-symbols-unprettify-at-point 'right-edge
 tab-width 4
 ansi-color-for-comint-mode t
 bidi-display-reordering nil
 blink-matching-paren nil
 compilation-always-kill t
 compilation-ask-about-save nil
 compilation-scroll-output 'first-error
 confirm-nonexistent-file-or-buffer t
 cursor-in-non-selected-windows nil
 display-line-numbers-width 3
 frame-inhibit-implied-resize t
 fringe-indicator-alist
 (delq (assq 'continuation fringe-indicator-alist) fringe-indicator-alist)
 highlight-nonselected-windows  nil
 image-animate-loop t
 indicate-buffer-boundaries nil
 indicate-empty-lines nil
 inhibit-compacting-font-caches t
 mode-line-default-help-echo nil
 show-help-function nil
 uniquify-buffer-name-style 'forward
 use-dialog-box nil
 visible-cursor nil
 x-stretch-cursor nil
 pos-tip-internal-border-width 6
 pos-tip-border-width 1
 window-resize-pixelwise t
 frame-resize-pixelwise t)
(setq delete-old-versions t
      version-control t
      gc-cons-threshold 402653184
      gc-cons-percentage 0.6
      vc-make-backup-files t
      vc-follow-symlinks t
      inhibit-startup-screen t
      ring-bell-function 'ignore
      coding-system-for-read 'utf-8
      coding-system-for-write 'utf-8
      sentence-end-double-space nil
      default-fill-column 120
      backup-directory-alist '(("." . "~/.emacs.d/backups"))
      custom-file "~/.emacs.d/custom.el"
      auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))
(setq mac-command-modifier 'super
      mac-option-modifier 'meta
      mac-redisplay-dont-reset-vscroll t
      mac-mouse-wheel-smooth-scroll nil
      mouse-wheel-scroll-amount '(5 ((shift) . 2))
      mouse-wheel-progressive-speed nil
      ns-use-native-fullscreen nil
      ns-pop-up-frames nil
      frame-title-format nil ;;'("%b")
      )
(fset #'yes-or-no-p #'y-or-n-p)
(fset #'display-startup-echo-area-message #'ignore)
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(load custom-file)
;; (use-package ns-auto-titlebar
;;   :defer t
;;   :ensure t)

(use-package dtrt-indent
  :defer t
  :ensure t
  :config
  (dtrt-indent-mode +1)
  (push '(t tabwidth) dtrt-indent-hook-generic-mapping-list))
;; (require 'ns-auto-titlebar nil t)
