(use-package typescript-mode
  :ensure t)

(use-package tide
  :ensure t
  :after (typescript-mode)
  :config
  (add-hook 'typescript-mode-hook (lambda ()
				    (interactive)
				    (tide-setup)
				    (flycheck-mode +1)
				    (setq flycheck-check-syntax-automatically '(save mode-enabled))
				    (eldoc-mode +1)
				    (tide-hl-identifier-mode +1)))
  (with-eval-after-load "tide"
    (add-hook 'before-save-hook 'tide-format-before-save))
  )
