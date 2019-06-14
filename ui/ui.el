(global-display-line-numbers-mode)
(electric-indent-mode +1)
(setq scroll-step 1)

(use-package darkokai-theme
  :ensure t)

(use-package doom-themes
  :ensure t
  :config
  (doom-themes-org-config))

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode)
  (sp-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-pair "(" nil :post-handlers '(("||\n[i]" "RET"))))

(use-package evil-smartparens
  :ensure t
  :after smartparens
  :config
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))

(use-package all-the-icons
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 10)
						  (projects . 5)
						  (registers . 5)))
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (setq dashboard-startup-banner 'logo))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (rainbow-delimiters-mode 1))

(use-package amx
  :ensure t)

;; (use-package all-the-icons-dired
;;   :after
;;   (all-the-icons)
;;   :config
;;   (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package all-the-icons-ivy
  :ensure t
  :config
  (all-the-icons-ivy-setup))

										; (use-package solaire-mode
										;   :hook ((change-major-mode after-revert ediff-prepare-buffer) . turn-on-solaire-mode)
										;   :config
										;   (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)
										;   (solaire-mode-swap-bg))

(load-theme 'doom-one t)
