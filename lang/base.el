(use-package format-all
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'format-all-mode))

(use-package helm-dash
  :ensure t
  :config
  (setq helm-dash-browser-func 'eww))

(use-package rmsbolt
  :ensure t
  :config
  (add-hook 'rust-mode-hook #'rmsbolt-mode))

(evil-leader/set-key-for-mode 'rust-mode "mds" 'rmsbolt-compile)
(evil-leader/set-key "hd" 'helm-dash-at-point)
