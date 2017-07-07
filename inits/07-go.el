;; Goのパスを通す
(add-to-list 'exec-path (expand-file-name "/usr/local/go/bin/"))
;; go get で入れたツールのパスを通す
(add-to-list 'exec-path (expand-file-name "~/go/bin"))
(add-to-list 'load-path "~/go/src/github.com/dougm/goflymake")
(add-to-list 'load-path "~/.emacs.d/gore-mode")

(use-package gore-mode
  :defer t
  :mode (("\\.go\\'" . gore-mode))
  :init
  (bind-keys :map mode-specific-map
	     ("C-c" . gofmt))
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (use-package company-go
    :config
    (set (make-local-variable 'company-backends) '(company-go))
    (add-hook 'gore-mode-hook 'company-mode)
    (company-mode))
  (use-package go-flycheck
    :config
    (add-hook 'gore-mode-hook 'flycheck-mode))
  (add-hook 'gore-mode-hook (lambda ()
			      (local-set-key (kbd "M-.") 'godef-jump)
			      (set (make-local-variable 'company-backends) '(company-go))
			      (company-mode)
			      (setq indent-tabs-mode nil)
			      (setq c-basic-offset 2)
			      (setq tab-width 2)))
  )
