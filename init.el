(load-theme 'wombat t)

; localeに合わせた環境設定
(set-locale-environment nil)
; メニューバー削除
(menu-bar-mode -1)
; ツールバー削除
(tool-bar-mode -1)
; 対応する括弧を光らせる
(show-paren-mode 1)
; ウィンドウに収まらない時だけカッコ内も光らせる
(setq show-paren-style 'mixed)
; 現在行を目立たせる
(global-hl-line-mode)
; ; カーソル位置の行数を表示
(column-number-mode t)
; 行数を表示
;(global-linum-mode 1)
; スタートアップメッセージ削除
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(line-number-mode t)

; カーソルの点滅を止める
(blink-cursor-mode 0)

(if window-system (progn
   (set-background-color "Black")
   (set-foreground-color "LightGray")
   (set-cursor-color "Gray")
   (set-frame-parameter nil 'alpha 90) ;透明度
   ))

(global-set-key "\M-g" 'goto-line)
