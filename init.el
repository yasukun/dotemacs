(require 'cl)
(load-theme 'tango)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar installing-package-list
  '(
    ;; packages
    ac-cider
    ac-racer
    company-go
    dash
    flycheck-rust
    flycheck-yamllint
    helm
    helm-ag
    helm-descbinds
    helm-flycheck
    hl-line+
    init-loader
    multiple-cursors
    open-junk-file
    paredit
    popwin
    racer
    rust-playground
    web-mode
    yaml-mode
    yasnippet
    async
    auto-complete
    cider
    clojure-mode
    company
    epl
    f
    flycheck
    go-mode
    helm-core
    pkg-info
    popup
    queue
    rust-mode
    s
    seq
    spinner
    use-package
    navi2ch
    key-combo
    toml-mode
    smartparens
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

;; ~/.emacs.d/site-lisp 以下全部読み込み
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
