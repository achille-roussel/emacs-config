(setq-default indent-tabs-mode nil)

;; autocomplete
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; highlight current line
(require 'highlight-current-line)
(highlight-current-line-on t)
 
;; To customize the background color
(set-face-background 'highlight-current-line-face "black")

;; extern "C"
(add-hook 'c-mode-common-hook
	    (lambda()
	          (c-set-offset 'inextern-lang 0)))

;; C++ namespace indentation
(defconst my-cc-style
  '("gnu"
    (c-offsets-alist . ((innamespace . [2])))))

(c-add-style "my-cc-style" my-cc-style)
(setq c-default-style
       '((c++-mode . "my-cc-style")))

;; .h in C++ mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; line number
(global-linum-mode 1)
(setq linum-format "%d ")
(set-face-foreground 'linum "yellow")
