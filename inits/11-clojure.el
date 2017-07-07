(use-package clojure-mode
  :defer t
  :config
  (define-clojure-indent
    (defroutes 'defun)
    (GET 2)
    (POST 2)
    (PUT 2)
    (DELETE 2)
    (HEAD 2)
    (ANY 2)
    (context 2))
  (use-package cider
    :config
    (add-hook 'clojure-mode-hook 'cider-mode)
    ;; clojure
    (setq cider-repl-tab-command 'indent-for-tab-command)
    (setq cider-popup-stacktraces nil)
    (setq cider-repl-display-in-current-window t)
    (setq cider-repl-print-length 30)
    (setq cider-repl-wrap-history t)
    (setq cider-repl-history-size 1000)
    ;; (setq cider-refresh-show-log-buffer t)
    (setq nrepl-hide-special-buffers t)
    (setq cider-repl-tab-command #'indent-for-tab-command)
    (setq cider-show-error-buffer nil)
    (setq cider-repl-history-file "~/.junk/cider-repl.hist")
    (add-to-list 'exec-path (expand-file-name ".lein" "~/"))
    (use-package auto-complete)
    (use-package ac-cider
      :config
      (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
      (add-hook 'cider-mode-hook 'ac-cider-setup)
      (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
      (eval-after-load "auto-complete"
	'(add-to-list 'ac-modes 'cider-mode))))
  (use-package smartparens-config
    :config
    (add-hook 'clojure-mode-hook #'smartparens-mode)))
