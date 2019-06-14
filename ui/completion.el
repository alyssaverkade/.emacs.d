(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  )
(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.1
	company-tooltip-limit 14
	company-dabbrev-downcase nil
	company-dabbrev-ignore-case nil
	company-dabbrev-code-other-buffers t
	company-tooltip-align-annotations t
	company-minimum-prefix-length 2
	company-require-match 'never
	company-global-modes
	'(not comint-mode erc-mode message-mode help-mode gud-mode eshell-mode)
	company-frontends
	'(company-pseudo-tooltip-frontend
	  company-pseudo-tooltip-unless-just-one-frontend
	  company-preview-if-just-one-frontend
	  company-echo-metadata-frontend)
	)
  (add-to-list 'company-backends 'company-yasnippet t)
  (global-company-mode)
  )
(use-package company-dict
  :ensure t
  :config
  (defun +company|enable-project-dicts (mode &rest _)
    "Enable per-project dictionaries."
    (if (symbol-value mode)
	(add-to-list 'company-dict-minor-mode-list mode nil #'eq)
      (setq company-dict-minor-mode-list (delq mode company-dict-minor-mode-list))))
  (add-hook 'projectile-project-hook #'+company|enable-project-dicts)
  )

(use-package company-prescient
  :ensure t
  :hook (company-mode . company-prescient-mode)
  :config
  (setq prescient-save-file (concat cache-dir "prescient-save.el"))
  (prescient-persist-mode +1)
  )

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode)
  :after (all-the-icons)
  :config
  (setq company-box-backends-colors nil
	company-box-max-candidates 50
	company-box-icons-yasnippet (all-the-icons-material "short_text" :height 0.8 :face 'all-the-icons-green)
	company-box-icons-unknown (all-the-icons-material "find_in_page" :height 0.8 :face 'all-the-icons-purple)
	company-box-icons-elisp
	(list (all-the-icons-material "functions"                  :height 0.8 :face 'all-the-icons-red)
	      (all-the-icons-material "check_circle"               :height 0.8 :face 'all-the-icons-blue)
	      (all-the-icons-material "stars"                      :height 0.8 :face 'all-the-icons-orange)
	      (all-the-icons-material "format_paint"               :height 0.8 :face 'all-the-icons-pink))
	company-box-icons-lsp
	`((1  . ,(all-the-icons-material "text_fields"              :height 0.8 :face 'all-the-icons-green)) ; text
	  (2  . ,(all-the-icons-material "functions"                :height 0.8 :face 'all-the-icons-red))   ; method
	  (3  . ,(all-the-icons-material "functions"                :height 0.8 :face 'all-the-icons-red))   ; function
	  (4  . ,(all-the-icons-material "functions"                :height 0.8 :face 'all-the-icons-red))   ; constructor
	  (5  . ,(all-the-icons-material "functions"                :height 0.8 :face 'all-the-icons-red))   ; field
	  (6  . ,(all-the-icons-material "adjust"                   :height 0.8 :face 'all-the-icons-blue))  ; variable
	  (7  . ,(all-the-icons-material "class"                    :height 0.8 :face 'all-the-icons-red))   ; class
	  (8  . ,(all-the-icons-material "settings_input_component" :height 0.8 :face 'all-the-icons-red))   ; interface
	  (9  . ,(all-the-icons-material "view_module"              :height 0.8 :face 'all-the-icons-red))   ; module
	  (10 . ,(all-the-icons-material "settings"                 :height 0.8 :face 'all-the-icons-red))   ; property
	  (11 . ,(all-the-icons-material "straighten"               :height 0.8 :face 'all-the-icons-red))   ; unit
	  (12 . ,(all-the-icons-material "filter_1"                 :height 0.8 :face 'all-the-icons-red))   ; value
	  (13 . ,(all-the-icons-material "plus_one"                 :height 0.8 :face 'all-the-icons-red))   ; enum
	  (14 . ,(all-the-icons-material "filter_center_focus"      :height 0.8 :face 'all-the-icons-red))   ; keyword
	  (15 . ,(all-the-icons-material "short_text"               :height 0.8 :face 'all-the-icons-red))   ; snippet
	  (16 . ,(all-the-icons-material "color_lens"               :height 0.8 :face 'all-the-icons-red))   ; color
	  (17 . ,(all-the-icons-material "insert_drive_file"        :height 0.8 :face 'all-the-icons-red))   ; file
	  (18 . ,(all-the-icons-material "collections_bookmark"     :height 0.8 :face 'all-the-icons-red))   ; reference
	  (19 . ,(all-the-icons-material "folder"                   :height 0.8 :face 'all-the-icons-red))   ; folder
	  (20 . ,(all-the-icons-material "people"                   :height 0.8 :face 'all-the-icons-red))   ; enumMember
	  (21 . ,(all-the-icons-material "pause_circle_filled"      :height 0.8 :face 'all-the-icons-red))   ; constant
	  (22 . ,(all-the-icons-material "streetview"               :height 0.8 :face 'all-the-icons-red))   ; struct
	  (23 . ,(all-the-icons-material "event"                    :height 0.8 :face 'all-the-icons-red))   ; event
	  (24 . ,(all-the-icons-material "control_point"            :height 0.8 :face 'all-the-icons-red))   ; operator
	  (25 . ,(all-the-icons-material "class"                    :height 0.8 :face 'all-the-icons-red))))

  )
