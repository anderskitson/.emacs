(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f305da85d28f1608950a3a5d332e9dfcc59641a8f66614978d10b045441ba8f8" "bc4989c4c5f19ec3999e783f3734a001de0cef65b1da1fa8610e36e437521233" default))
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages
   '(drag-stuff ace-jump-mode cider autothemer company-emoji farmhouse-theme ivy projectile use-package frontside-javascript typescript-mode parinfer-rust-mode cyberpunk-theme spacegray-theme smartparens company ace-window paredit rainbow-delimiters clojure-mode-extra-font-locking))
 '(projectile-mode t nil (projectile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(add-hook 'cider-repl-mode-hook #'enable-paredit-mode)
(add-hook 'cider-mode-hook #'enable-paredit-mode)
(add-hook 'clojure-mode-hook #'enable-paredit-mode)

;(add-hook 'clojure-mode-hook #'parinfer-rust-mode)

(global-set-key (kbd "C-x o") 'ace-window)

(add-hook 'after-init-hook 'global-company-mode)

;;(Require 'smartparens-config)

;;(add-hook 'clojure-mode-hook #'smartparens-strict-mode)

;;(add-hook 'clojure-mode-hook #'enable-paredit-mode)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(set-face-attribute 'default nil
                    :family "IBM Plex Mono" :height 175 :weight 'normal)


;;(load-theme 'spacegray t)
;;(load-theme 'cyberpunk t)
;;(load-theme 'farmhouse-light t)

(require 'use-package)

(use-package frontside-javascript
  :init (frontside-javascript))



;;(projectile-mode +1)
;;(define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)

(projectile-mode +1)
;; Recommended keymap prefix on macOS;;
;;(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(ivy-mode)

(setq projectile-project-search-path '("~/sites/" "~/clj/" "~/acorn/"))

(require 'company-emoji)
(add-to-list 'company-backends 'company-emoji)

(use-package autothemer
  :ensure t)

(show-paren-mode 1)

(load-theme 'jazzy t)

;; Toggle window split

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(define-key ctl-x-4-map "T" 'toggle-window-split)

;; toggle window split ends

(setq cider-enhanced-cljs-completion-p nil)



;;
;; ace jump mode major function
;; 
;;(add-to-list 'load-path "/Users/anderskitson/.emacs.d/ace-jump-mode.el")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-M-S-f") 'ace-jump-mode)

(drag-stuff-global-mode 1)

(drag-stuff-define-keys)

(global-set-key (kbd "C-M-S-d") "\C-a\C- \C-n\M-w\C-y")

