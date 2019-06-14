(use-package fstar-mode
  :defer t
  :ensure t
  :config
  (setq-default fstar-executable "/usr/local/bin/fstar.exe")
  (setq-default fstar-smt-executable "/usr/local/bin/z3"))
