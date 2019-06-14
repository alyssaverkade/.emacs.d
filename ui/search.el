(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (define-key evil-motion-state-map "/" 'swiper))

(use-package counsel
  :ensure t
  :diminish counsel-mode
  :config
  (counsel-mode 1)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (evil-leader/set-key "/" 'counsel-rg)
  )
