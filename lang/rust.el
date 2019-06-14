(use-package rust-mode
  :ensure t
  :config
  (setq rust-format-on-save t))

(use-package flycheck-rust
  :ensure t
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(evil-leader/set-key-for-mode 'rust-mode "msr" 'lsp-restart-workspace)
