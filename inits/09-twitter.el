(add-to-list 'load-path "~/.emacs.d/twittering-mode")
(use-package twittering-mode
  :config
  (setq twittering-timer-interval 300)
  (setq twittering-initial-timeline-spec-string
	'(":home"
	  "sukezo/bookmark"
	  ":search/go言語 OR golang -go__info lang:ja/"
	  ":search/kaggle lang:ja/"
	  ":search/clojure lang:ja/"
	  ":search/rust lang:ja/"
	  ))
  (setq browse-url-browser-function 'eww-browse-url)
  (setq eww-search-prefix "http://www.google.co.jp/search?q=")
  (when (fboundp 'eww)
  (progn
    (defun xah-rename-eww-hook ()
      "Rename eww browser's buffer so sites open in new page."
      (rename-buffer "eww" t))
    (add-hook 'eww-mode-hook 'xah-rename-eww-hook)))
  )
