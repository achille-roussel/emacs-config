;; use spaces to indent code
(setq-default indent-tabs-mode nil)

;; display column numbers
(setq column-number-mode t)

;; autocomplete
(add-to-list 'load-path "~/.emacs.d/libs")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/libs/ac-dict")
(ac-config-default)

;; highlight current line
(require 'highlight-current-line)
(highlight-current-line-on t)

;; markdown
(require 'markdown-mode)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)
(set-face-attribute 'web-mode-html-tag-face nil :foreground "blue" :weight 'bold)
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "yellow")
(set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "white")

;; css-mode
(setq css-indent-offset 2)

;; Golang
(add-to-list 'load-path "~/.emacs.d/libs/go-mode.el/")
(require 'go-mode-autoloads)
;(require 'go-autocomplete)
;(require 'auto-complete-config)

; setup M-x godoc
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

; let godoc find downloaded packages
(setenv "GOPATH" "/Users/achille/go")

; automagic go fmt on save
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "/Users/achille/go/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

; automagic go imports
(defun my-go-mode-hook ()
  (setq gofmt-command "goimports")
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; golint
(add-to-list 'load-path "~/go/src/github.com/golang/lint/misc/emacs")
(require 'golint)

;; php-mode
(require 'php-mode)

;; To customize the background color
(set-face-background 'highlight-current-line-face "black")

;; extern "C"
(add-hook 'c-mode-common-hook
	    (lambda()
	          (c-set-offset 'inextern-lang 2)))

;; C++ namespace indentation
(defconst my-cc-style
  '("gnu"
    (c-offsets-alist . ((innamespace . [2])))))

(c-add-style "my-cc-style" my-cc-style)
(setq c-default-style
       '((c++-mode . "my-cc-style")))

;; .h in C++ mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; yaml-mode
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; line number
(global-linum-mode 1)
(setq linum-format "%4d  ")
(set-face-foreground 'linum "black")
; (set-face-background 'linum "black")

;; js
(setq js-indent-level 2)

;; tab width
(setq default-tab-width 4)

;; rust mode
(add-to-list 'load-path "~/.emacs.d/libs/rust-mode/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; trailing whitespaces
(setq-default show-trailing-whitespace t)

;; CMake
(require 'cmake-mode)

;; Docker
(add-to-list 'load-path "~/.emacs.d/libs/dockerfile-mode/")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; nginx
(require 'nginx-mode)
