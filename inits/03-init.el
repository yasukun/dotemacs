;; shell の存在を確認
(defun skt:shell ()
  (or (executable-find "zsh")
      (executable-find "bash")
      ;; (executable-find "f_zsh") ;; Emacs + Cygwin を利用する人は Zsh の代りにこれにしてください
      ;; (executable-find "f_bash") ;; Emacs + Cygwin を利用する人は Bash の代りにこれにしてください
      (executable-find "cmdproxy")
      (error "can't find 'shell' command in PATH!!")))

;; Shell 名の設定
(setq shell-file-name (skt:shell))
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name)

(prefer-coding-system 'utf-8)                                                                
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(global-set-key "\C-h" 'delete-backward-char)

(use-package mozc
  :config
  (set-language-environment "Japanese")
  (setq default-input-method "japanese-mozc")
  )

(defun split-window-vertically-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-vertically)
    (progn
      (split-window-vertically
       (- (window-height) (/ (window-height) num_wins)))
      (split-window-vertically-n (- num_wins 1)))))

(defun split-window-horizontally-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-horizontally)
    (progn
      (split-window-horizontally
       (- (window-width) (/ (window-width) num_wins)))
      (split-window-horizontally-n (- num_wins 1)))))

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (if (>= (window-body-width) 270)
        (split-window-vertically-n 3)
      (split-window-vertically)))
  (other-window 1))

(global-unset-key "\C-t")
(global-unset-key "\C-z")
(global-set-key (kbd "C-t") 'other-window-or-split)
(global-set-key (kbd "C-z") 'transpose-chars)

(defun my-move-beginning-of-line ()
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))
(global-set-key "\C-a" 'my-move-beginning-of-line)

(menu-bar-mode 0)

(setq inhibit-splash-screen t)

(scroll-bar-mode -1)

(setq completion-ignore-case t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq ring-bell-function 'ignore)

(setq hl-line-face 'underline)
(global-hl-line-mode 1)

(show-paren-mode t)

(setq show-paren-style 'mixed)
