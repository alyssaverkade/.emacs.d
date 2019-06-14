(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (evil-leader/set-key "p" 'projectile-command-map)
  )
