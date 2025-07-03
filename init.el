;;; package --- Summary
;;; Commentary:
;;; Codes:
(require 'package)
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize) ;; You might already have this line
(setq confirm-kill-emacs #'yes-or-no-p)      ; 在关闭 Emacs 前询问是否确认关闭，防止误触
(electric-pair-mode t)                       ; 自动补全括号
(add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号
(column-number-mode t)                       ; 在 Mode line 上显示列号
(global-auto-revert-mode t)                  ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(delete-selection-mode t)                    ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
(setq inhibit-startup-message t)             ; 关闭启动 Emacs 时的欢迎界面
(setq make-backup-files nil)                 ; 关闭文件自动备份
(add-hook 'prog-mode-hook #'hs-minor-mode)   ; 编程模式下，可以折叠代码块
(global-display-line-numbers-mode 1)         ; 在 Window 显示行号
(tool-bar-mode -1)                           ; （熟练后可选）关闭 Tool bar
(menu-bar-mode -1)
(when (display-graphic-p) (toggle-scroll-bar -1)) ; 图形界面时关闭滚动条

(savehist-mode 1)                            ; （可选）打开 Buffer 历史记录保存
(setq display-line-numbers-type 'relative)   ; （可选）显示相对行号
(add-to-list 'default-frame-alist '(width . 90))  ; （可选）设定启动图形界面时的初始 Frame 宽度（字符数）
(add-to-list 'default-frame-alist '(height . 55)) ; （可选）设定启动图形界面时的初始 Frame 高度（字符数

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" "f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" "f079ef5189f9738cf5a2b4507bcaf83138ad22d9c9e32a537d61c9aae25502ef" default))
 '(package-selected-packages
   '(pydebug dracula-theme all-the-icons mu4e copilot elpy lsp-mode-20240523.840 lsp-mode gnuplot-mode key-chord auctex biblio ebib magit flycheck company-box company rainbow-delimiters highlight-symbol dashboard avy which-key amx counsel swiper)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans Mono" :foundry "GOOG" :slant normal :weight regular :height 100 :width normal)))))

(use-package counsel
  :ensure t)

(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . 'swiper)
   ("C-x b" . 'ivy-switch-buffer)
   ("C-c v" . 'ivy-push-view)
   ("C-c s" . 'ivy-switch-view)
   ("C-c V" . 'ivy-pop-view)
   ("C-x C-@" . 'counsel-mark-ring); 在某些终端上 C-x C-SPC 会被映射为 C-x C-@，比如在 macOS 上，所以要手动设置
   ("C-x C-SPC" . 'counsel-mark-ring)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))

(use-package amx
  :ensure t
  :init (amx-mode))

(use-package which-key
  :ensure t
  :init (which-key-mode))

 (use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Welcome to Emacs!") ;; 个性签名，随读者喜好设置
  ;; (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
  (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
  (setq dashboard-items '((recents  . 5)   ;; 显示多少个最近文件
			  (bookmarks . 5)  ;; 显示多少个最近书签
			  (projects . 10))) ;; 显示多少个最近项目
  (dashboard-setup-startup-hook))

(use-package highlight-symbol
  :ensure t
  :init (highlight-symbol-mode)
  :bind ("<f3>" . highlight-symbol)) ;; 按下 F3 键就可高亮当前符号

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package evil
  :ensure t
  :init (evil-mode))

(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 1) ; 只需敲 1 个字母就开始进行自动补全
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-quick-access t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence))) ; 根据选择的频率进行排序，读者如果不喜欢可以去

(use-package company-box
  :ensure t
  :if window-system
  :hook (company-mode . company-box-mode))

(use-package flycheck
  :ensure t
  :config
  (setq truncate-lines nil) ; 如果单行信息很长会自动换行
  :hook
  (prog-mode . flycheck-mode))

(use-package magit
  :ensure t)

(use-package zenburn-theme
  :ensure t)
(load-theme 'zenburn)

(use-package auctex
  :ensure t)
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2023/bin/x86_64-linux")) ;; path may be changed
(setq exec-path (append exec-path '("/usr/local/texlive/2023/bin/x86_64-linux"))) ;; path may be changed
(setq font-latex-fontify-script nil) ;; no small font size of subscript and superscript

(use-package ebib
  :ensure t)

(setq ebib-preload-bib-files '("~/my_bibtex.bib"))

(use-package biblio
  :ensure t)

(use-package gnuplot-mode
  :ensure t)

(use-package lsp-mode
  :ensure t)

(use-package elpy
  :ensure t)
(elpy-enable)

(setq load-path (cons "/home/lin/.emacs.d/elpa/lean4-mode" load-path))
(require 'lean4-mode)

(use-package key-chord
  :ensure t)
(key-chord-mode 1)

(use-package markdown-mode
  :ensure t)

(use-package all-the-icons
  :ensure t)

;; key-binding
(global-set-key (kbd "C-c e") 'ebib)
(global-set-key (kbd "C-c i") 'ebib-import-entries)
(global-set-key (kbd "C-c l") 'biblio-lookup)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "fe") 'evil-end-of-visual-line)
(define-key evil-normal-state-map (kbd "fs") 'evil-beginning-of-visual-line)
(define-key evil-normal-state-map (kbd "ff") 'evil-scroll-page-down)
(define-key evil-normal-state-map (kbd "bb") 'evil-scroll-page-up)
(define-key evil-visual-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-visual-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-visual-state-map (kbd "fe") 'evil-end-of-visual-line)
(define-key evil-visual-state-map (kbd "fs") 'evil-beginning-of-visual-line)
(define-key evil-visual-state-map (kbd "ff") 'evil-scroll-page-down)
(define-key evil-visual-state-map (kbd "bb") 'evil-scroll-page-up)
(setq key-chord-two-keys-delay 0.1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-visual-state-map "jk" 'evil-normal-state)
(global-set-key (kbd "C-c p") (lambda () (interactive) (kill-new (buffer-file-name))))

(setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))

;; (add-hook 'LaTeX-mode-hook
;; (lambda()
;; (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
;; ;; (setq TeX-command-default "XeLaTeX")
;; ))

(provide 'init)
;;; init.el ends here
