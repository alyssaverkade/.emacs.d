(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc emacs-lisp ruby-reek))
