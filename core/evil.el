(use-package evil
  :ensure t
  :config
  (evil-mode 1))
(use-package evil-leader
  :ensure t
  :after
  (evil)
  :config
  (global-evil-leader-mode)
  (setq evil-leader/leader "<SPC>"))
(use-package evil-commentary
  :ensure t
  :after
  (evil)
  :config
  (evil-commentary-mode))
(use-package evil-surround
  :ensure t
  :after
  (evil)
  :config
  (global-evil-surround-mode))
(use-package evil-indent-textobject
  :after
  (evil)
  :ensure t)
(use-package iedit
  :after (evil-leader)
  :ensure t)
(use-package evil-iedit-state
  :after (iedit evil)
  :ensure t)

(use-package evil-anzu
  :after(evil)
  :ensure t)

(use-package evil-lion
  :ensure t
  :config
  (evil-lion-mode))

(define-key evil-visual-state-map "e" 'evil-iedit-state/iedit-mode)
(evil-leader/set-key "se" 'evil-iedit-state/iedit-mode)
(evil-leader/set-key ":" 'counsel-M-x)
(evil-leader/set-key "hv" 'counsel-describe-variable)
(evil-leader/set-key "hf" 'counsel-describe-function)
(evil-leader/set-key "hm" 'describe-mode)
(global-set-key (kbd "C-x C-m") 'counsel-M-x)
