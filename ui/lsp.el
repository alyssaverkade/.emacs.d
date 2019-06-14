(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :ensure t
  :after (lsp-mode)
  :config
  (add-hook! lsp-mode 'lsp-ui-mode)
  (add-hook! ruby-mode 'lsp)
  (add-hook! rust-mode 'lsp)
  )

(use-package company-lsp
  :ensure t
  :after (company lsp-mode)
  :config
  (push 'company-lsp company-backends))

(setq lsp-ui-doc-max-width 75)
(setq lsp-ui-doc-max-height 30)
(setq lsp-ui-doc-position 'bottom)
