(use-package cmake-ide
  :ensure t
  :after rtags
  :config
  (cmake-ide-setup))

(use-package clang-format
  :load-path "/usr/local/opt/llvm/share/clang"
  :config
  (defun c++-mode-before-save-hook ()
    (when (eq major-mode 'c++-mode)
      (clang-format-buffer)))
  (add-hook 'before-save-hook #'c++-mode-before-save-hook)
  )

(use-package cquery
  :ensure t
  :init
  (add-hook 'c++-mode-hook #'cquery//enable)
  :config
  (with-eval-after-load 'projectile
    (setq projectile-project-root-files-top-down-recurring
      (append '("compile_commands.json"
          ".cquery")
          projectile-project-root-files-top-down-recurring)))
  (defun cquery//enable ()
    (setq-local company-transformers nil)
    (condition-case nil
    (lsp-cquery-enable)
      (user-error nil)))
  (setq cquery-sem-highlight-method 'overlay)
  (setq company-lsp-async t company-lsp-cache-candidates nil)
  (evil-leader/set-key-for-mode 'c++-mode "mr" 'lsp-ui-peek-find-references)
  (evil-leader/set-key-for-mode 'c++-mode "md" 'lsp-ui-peek-find-definitions)
  (evil-leader/set-key-for-mode 'c++-mode "ml" 'lsp-ui-peek-find-definitions)
  (evil-leader/set-key-for-mode 'c++-mode "ml" 'lsp-ui-imenu)

  )

(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++17")))
