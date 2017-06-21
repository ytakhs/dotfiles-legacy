(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)
(defvar my/favorite-packages
  '(
    afternoon-theme
    ))
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))
(load-theme 'afternoon t)

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
; 分割ウィンドウ
(global-set-key (kbd "C-c C-b") 'windmove-left)
(global-set-key (kbd "C-c b") 'windmove-left)
(global-set-key (kbd "C-c C-f") 'windmove-right)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c C-p") 'windmove-up)
(global-set-key (kbd "C-c C-n") 'windmove-down)
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
