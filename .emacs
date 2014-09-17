;; .emacs

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#cccccc" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#2d2d2d"))
 '(custom-safe-themes (quote ("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(diff-switches "-u")
 '(fci-rule-color "#515151")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#f2777a") (40 . "#f99157") (60 . "#ffcc66") (80 . "#99cc99") (100 . "#66cccc") (120 . "#6699cc") (140 . "#cc99cc") (160 . "#f2777a") (180 . "#f99157") (200 . "#ffcc66") (220 . "#99cc99") (240 . "#66cccc") (260 . "#6699cc") (280 . "#cc99cc") (300 . "#f2777a") (320 . "#f99157") (340 . "#ffcc66") (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

(define-key key-translation-map "\M-[1;2A" (kbd "S-<up>"))
(define-key key-translation-map "\M-[1;2B" (kbd "S-<down>"))
(define-key key-translation-map "\M-[1;2C" (kbd "S-<right>"))
(define-key key-translation-map "\M-[1;2D" (kbd "S-<left>"))
(define-key key-translation-map "\M-[1;2F" (kbd "S-<end>"))
(define-key key-translation-map "\M-[1;2H" (kbd "S-<home>"))

(define-key key-translation-map "\M-[1;3A" (kbd "M-<up>"))
(define-key key-translation-map "\M-[1;3B" (kbd "M-<down>"))
(define-key key-translation-map "\M-[1;3C" (kbd "M-<right>"))
(define-key key-translation-map "\M-[1;3D" (kbd "M-<left>"))
(define-key key-translation-map "\M-[1;3F" (kbd "M-<end>"))
(define-key key-translation-map "\M-[1;3H" (kbd "M-<home>"))

(define-key key-translation-map "\M-[5;3~" (kbd "M-<prior>"))
(define-key key-translation-map "\M-[6;3~" (kbd "M-<next>"))

(define-key key-translation-map "\M-[1;4A" (kbd "M-S-<up>"))
(define-key key-translation-map "\M-[1;4B" (kbd "M-S-<down>"))
(define-key key-translation-map "\M-[1;4C" (kbd "M-S-<right>"))
(define-key key-translation-map "\M-[1;4D" (kbd "M-S-<left>"))
(define-key key-translation-map "\M-[1;4F" (kbd "M-S-<end>"))
(define-key key-translation-map "\M-[1;4H" (kbd "M-S-<home>"))

(define-key key-translation-map "\M-[1;5A" (kbd "C-<up>"))
(define-key key-translation-map "\M-[1;5B" (kbd "C-<down>"))
(define-key key-translation-map "\M-[1;5C" (kbd "C-<right>"))
(define-key key-translation-map "\M-[1;5D" (kbd "C-<left>"))
(define-key key-translation-map "\M-[1;5F" (kbd "C-<end>"))
(define-key key-translation-map "\M-[1;5H" (kbd "C-<home>"))

(define-key key-translation-map "\M-[1;6A" (kbd "C-S-<up>"))
(define-key key-translation-map "\M-[1;6B" (kbd "C-S-<down>"))
(define-key key-translation-map "\M-[1;6C" (kbd "C-S-<right>"))
(define-key key-translation-map "\M-[1;6D" (kbd "C-S-<left>"))
(define-key key-translation-map "\M-[1;6F" (kbd "C-S-<end>"))
(define-key key-translation-map "\M-[1;6H" (kbd "C-S-<home>"))

(global-set-key (kbd "M-S-<left>") 'previous-buffer)
(global-set-key (kbd "M-S-<right>") 'next-buffer)

(setq column-number-mode t)

;; haskell ->
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; <- haskell

;; ocaml ->
;;(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq opam-share (substring (shell-command-to-string "opam config var share") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(require 'ocp-indent)
(autoload 'merlin-mode "merlin" "Merlin mode" t)
(setq auto-mode-alist
  (append '(("\\.ml[ily]?$" . tuareg-mode)
            ("\\.topml$" . tuareg-mode))
          auto-mode-alist)) 
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'tuareg-mode-hook 'auto-complete-mode)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)
;; <- ocaml

;; markdown ->
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; <- markdown

(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(transient-mark-mode 1)
(setq cua-keep-region-after-copy t)

(windmove-default-keybindings 'meta)

(show-paren-mode 1)

;; 80 lines limit ->
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)
;; <-- 80 lines limit
