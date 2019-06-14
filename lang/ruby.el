(use-package robe
  :ensure t
  :hook
  (add-hook 'ruby-mode-hook 'robe-mode))

(defun custom-ruby-hook ()
  (interactive)
  (setq-local helm-dash-docsets '("Ruby" "Ruby on Rails"))
  (require 'smartparens-ruby)
  )

(use-package yard-mode
  :ensure t
  :config
  (add-hook 'ruby-mode-hook #'yard-mode))

(add-hook 'ruby-mode-hook #'custom-ruby-hook)
(add-hook 'ruby-mode-hook #'lsp)

(evil-leader/set-key-for-mode 'ruby-mode "hd" 'robe-doc)
(evil-leader/set-key-for-mode 'ruby-mode "gf" 'robe-ask)
(evil-leader/set-key-for-mode 'ruby-mode "msi" 'robe-start)
