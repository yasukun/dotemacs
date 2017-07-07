(setq load-path (cons (expand-file-name "/usr/local/share/emacs/site-lisp") load-path))
(use-package navi2ch
  :defer t
  :config
  (setq navi2ch-net-http-proxy "127.0.0.1:8080"))
