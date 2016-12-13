;;For test
;;;----------------------------------------------------------------------------------------------------
;;;--- Package System
;;;----------------------------------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" ."http://melpa.org/packages/"))
(package-initialize)

(global-set-key (kbd "M-w") 'execute-extended-command) ; replace "m-x" with "m-w"

;; Evil Surround
(require 'evil-surround)
(global-evil-surround-mode)
;; Evil nerd commenter
(evilnc-default-hotkeys)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)


;;;----------------------------------------------------------------------------------------------------
;;;--- evil mode
;;;----------------------------------------------------------------------------------------------------
(require 'evil)
(evil-mode 1)

(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

(define-key evil-normal-state-map "a" 'evil-append-line)
(define-key evil-normal-state-map "A" 'evil-append-word)
(define-key evil-normal-state-map "g" 'evil-goto-line)
(key-chord-define evil-normal-state-map "gg" 'evil-goto-first-line)

;;; maximize window when startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))


;;;----------------------------------------------------------------------------------------------------
;;;--- Color mode
;;;----------------------------------------------------------------------------------------------------
;;;(load-theme 'monokai t)
;;;(set-face-attribute 'default nil :family "lucidia console" :height 180)
;; Highlight current line
;;(global-hl-line-mode 1)
;;(set-face-background 'hl-line "#999")
;;; e-ink mode
;;;----------------------------------------------------------------------------------------------------
;;;--- font
;;;----------------------------------------------------------------------------------------------------
(set-face-attribute 'font-lock-comment-face nil :weight 'bold)
(set-face-attribute 'region nil :background "#999")
(set-face-attribute 'default nil :family "lucidia console" :height 180 :foreground "#000000")


;;;----------------------------------------------------------------------------------------------------
;;; slime
;;;----------------------------------------------------------------------------------------------------
(load (expand-file-name "~/quicklisp/slime-helper.el")) ; load slime using quicklisp library manager
;; you could replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

;;; line number


;;; disable startup screen & menubar & scrollbar & toolbar
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)


;;;****************************************************************************************************
;;; i-search shorcuts
;;;****************************************************************************************************
(define-key isearch-mode-map "\C-b" 'isearch-repeat-backward)

;;;****************************************************************************************************
;;; Change default chinese font (becasue it's slow)
;;;****************************************************************************************************
(dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
		    (font-spec :family "Microsoft YaHei" :size 18)))

;;;****************************************************************************************************
;;; ZiLongShanRen
;;;****************************************************************************************************
;;;快速打开配置文件
(defun open-dot-emacs-file ()
  (interactive)
  (find-file "~/.emacs"))
;;;
(global-set-key (kbd "<f2>") 'open-dot-emacs-file)

;; Company mode
(global-company-mode 1)

;; Disable backup files
(setq make-backup-files nil)
;; Default Directory
(setq default-directory "c:/home/")

(global-auto-revert-mode 1)
;; Disable auto-save
(setq auto-save-default nil)

;; Disable beep warning sound
(setq ring-bell-function 'ignore)

(global-flycheck-mode)

;; Which key
(require 'which-key)
(which-key-mode)
