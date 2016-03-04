(require 'package)
; package------------------------------
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(package-refresh-contents)
(defvar my/favorite-packages
  '(
    auto-complete
    fuzzy
    popup
    pos-tip
    dired-toggle
    popwin
    elscreen
    yascroll
    buffer-move
    flycheck
    flymake-jslint
    go-mode
    jedi
    helm
    helm-swoop
    magit
    git-gutter
    auto-save-buffers-enhanced
    web-mode
    git-gutter-fringe
    migemo
    imenus
    ;ruby
    ruby-block
    ruby-electric
    enh-ruby-mode
    ;rails
    dash
    projectile-rails
    ;scala
    ensime
    ;nginx
    nginx-mode
    ;lisp
    slime
    geiser
    ))
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))
; c
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-default-style "k&r")
            (setq c-basic-offset 2)
            ))
; c++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

; auto-save-buffers-enhanced--------

(auto-save-buffers-enhanced t)

; web-mode
;; 拡張子の設定
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
;; インデント関係
(defun web-mode-hook ()
  "Hooks for Web mode."
 (setq web-mode-markup-indent-offset   2)
 (setq web-mode-css-indent-offset    2)
	(setq web-mode-code-indent-offset 2)
 (setq indent-tabs-mode t)
 (setq tab-width 1))
(add-hook 'web-mode-hook 'web-mode-hook)

; ruby--------------------------------

(autoload 'enh-ruby-mode "enh-ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" .enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-hook 'enh-ruby-mode-hook
          '(lambda ()
             (setq tab-width 2)
             (setq ruby-indent-level tab-width)
             (setq ruby-deep-indent-paren-style nil)
             (ruby-electric-mode t)
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode -1)
             ))
; magic-commentのinsertをオフ
(defadvice enh-ruby-mode-set-encoding (around stop-enh-ruby-mode-set-encoding)
  "If enh-ruby-not-insert-magic-comment is true, stops enh-ruby-mode-set-encoding."
  (if (and (boundp 'enh-ruby-not-insert-magic-comment)
           (not enh-ruby-not-insert-magic-comment))
      ad-do-it))
(ad-activate 'enh-ruby-mode-set-encoding)
(setq-default enh-ruby-not-insert-magic-comment t)

; rails---------------------------------
(projectile-global-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

; scala----------------------------------
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)         
(setq ensime-completion-style 'auto-complete)

; nginx-----------------------------------
(add-to-list 'auto-mode-alist '("nginx\\(.*\\).conf[^/]*$" . nginx-mode))

; git-gutter-fringe
(global-git-gutter-mode t)

; ファイラ"dired"-------------
;; diredを2つのウィンドウで開いている時に、デフォルトの移動orコピー先をもう一方のdiredで開いているディレクトリにする
(setq dired-dwim-target t)
;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)
;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)
;C-hにbackspaceを割当
(global-set-key "\C-h" 'delete-backward-char)
(setq tab-width 1)
(setq-default indent-tabs-mode nil)
;オートセーブをオフ
(setq auto-save-default nil)
; スワップファイルを作成しない
(setq make-backup-files nil)
; 自動インデントオフ
;(electric-indent-mode -1)
; 分割ウィンドウをShift-←↑→↓
(setq windmove-wrap-around t)
(windmove-default-keybindings)
; beepをオフ
(setq ring-bell-function 'ignore)
; localeに合わせた環境設定
(set-locale-environment nil)
; メニューバー削除
(menu-bar-mode -1)
; ツールバー削除
(tool-bar-mode -1)
; 対応する括弧を光らせる
(show-paren-mode 1)
; 自動で括弧を閉じる
;(electric-pair-mode 1)
; ウィンドウに収まらない時だけカッコ内も光らせる
(setq show-paren-style 'mixed)
; 現在行を目立たせる(灰色)
(global-hl-line-mode)
(custom-set-faces
'(hl-line ((t (:background "#474747"))))
 )
(setq-default c-basic-offset 2     ;;基本インデント量4
              tab-width 1          ;;タブ幅4
)
; カーソル位置の行数を表示
(column-number-mode t)
; 行数を表示
(global-linum-mode 1)
; スタートアップメッセージ削除
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
;行番号を表示
(line-number-mode t)
; カーソルの点滅を止める
(blink-cursor-mode 0)
; 背景
(if window-system (progn
   (set-background-color "Black")
   (set-foreground-color "LightGray")
   (set-cursor-color "Gray")
   (set-frame-parameter nil 'alpha 90) ;透明度
   ))

(global-set-key "\M-g" 'goto-line)
; 起動時の画面サイズ
( if(boundp 'window-system)
    (setq default-frame-alist
          (append (list
                   '(width . 100)
                   '(height . 60)
                   )
                  default-frame-alist)
          ))


; setting helm
(helm-mode +1)
(define-key global-map (kbd "C-x C-b") 'helm-buffers-list)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)

(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-c C-o") 'helm-swoop)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "TAB") 'helm-execuate-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

; imenus
(define-key global-map (kbd "C-c <RET>") 'imenus)


