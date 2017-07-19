(add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))

(use-package rust-mode
  :defer t
  :config
  (setq-default rust-format-on-save t)
  (use-package racer
    :config
    (add-hook 'rust-mode-hook 'racer-mode)
    (use-package company
      :config
      (add-hook 'racer-mode-hook (lambda ()
				   (company-mode)
				   (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
				   (define-key rust-mode-map (kbd "C-c C-c") 'rust-playground)
				   (set (make-variable-buffer-local 'company-idle-delay) 1.5)
				   (setq company-tooltip-align-annotations t)
				   (set (make-variable-buffer-local 'company-minimum-prefix-length) 0)))
      (use-package eldoc
	:config
	(add-hook 'racer-mode-hook #'eldoc-mode))))
  (use-package key-combo
    :config
    (setq key-combo-rust-mode-hooks
      '(rust-mode-hook
        racer-mode-hook))
    (setq key-combo-rust-default
      '(
        (";" . (";" "::" ": " ":"))
        (":" . (": " ":"))
        ("," . (", " ","))
        (">" . (">" "=> " "-> " ">>"))
        ("=" . ("= " "=" "== "))
        ("!" . ("!" "!= "))
        ("<" . ("<" "<>" "<<"))
        ("(" . ("(" "()"))
        ("{" . ("{" "{}"))))
    (key-combo-define-hook key-combo-rust-mode-hooks
                       'key-combo-rust-load-default
                       key-combo-rust-default)
    (add-hook 'rust-mode-hook (lambda ()
				(key-combo-mode 1)))))

(use-package rust-playground-mode
  :bind
  (("C-c C-g" . rust-playground-exec)))
