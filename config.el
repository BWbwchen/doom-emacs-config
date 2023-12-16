(setq user-full-name "Bo-Wei Chen"
      user-mail-address "tim.chenbw@gmail.com")

(setq doom-font (font-spec :family "Monaco" :size 20 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Monaco" :size 18))

(custom-set-faces!
  '(mode-line :family "Monaco" :height 0.9)
  '(mode-line-inactive :family "Monaco" :height 0.95))
(custom-set-faces
  '(default ((t (:background "#000000"))))
  '(hl-line ((t (:background "#333333"))))
 )

;;(setq doom-theme 'doom-monokai-octagon)
(setq doom-theme 'doom-xcode)
(setq fancy-splash-image "~/.doom.d/favicon_io/android-chrome-192x192.png")

(setq display-line-numbers-type t)

(setq-default fill-column 80)
(global-display-fill-column-indicator-mode)

(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(key-chord-mode 1)

(setq +format-on-save-enabled-modes
      '(not c-mode))
(setq +format-on-save-enabled-modes
      '(not cpp-mode))
(add-hook 'before-save-hook #'+format/buffer nil t)

(display-time-mode 1)
(column-number-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-set-style "k&r")
(setq c-basic-offset 4)
(setq crkate-lockfiles nil)

(require 'cc-mode)
(add-to-list 'c-default-style '(c++-mode . "k&r"))
(add-to-list 'c-default-style '(c-mode . "k&r"))

(global-wakatime-mode)

(after! treemacs
  :config
        (setq treemacs-width 20)
        (setq doom-themes-treemacs-theme 'doom-colors)
        (doom-themes-treemacs-config)
        ;; (treemacs-display-current-project-exclusively t)
        (treemacs-project-follow-mode t)
        (treemacs-fringe-indicator-mode t)
;        (treemacs-tag-follow-mode)
        (treemacs-follow-mode)
)
(defface custom-line-highlight '((t (:background "#5B5B5B" :extend t))) "")
(add-hook
 'treemacs-mode-hook
 (defun channge-hl-line-mode ()
   (setq-local hl-line-face 'custom-line-highlight)
   (overlay-put hl-line-overlay 'face hl-line-face)
   (treemacs--setup-icon-background-colors)))
(map! :leader
        :desc "treemacs"
        "e" #'+treemacs/toggle)
(map! :leader
        :desc "comment"
        "/" #'comment-line)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--query-driver=/etc/profiles/per-user/bwbwchen/bin/g++"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

(use-package! lsp
    :ensure
    :custom
    (lsp-rust-analyzer-server-display-inlay-hints t)
)

(setq org-directory "~/logseq/pages")
(setq org-startup-with-inline-images t)
(defun bw/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1)
  (doom-disable-line-numbers-h)
  )
(setq org-image-actual-width nil)
(use-package! visual-fill-column
  :hook (org-mode . bw/org-mode-visual-fill))

(setq rmh-elfeed-org-files '("~/.doom.d/rss.org"))

(after! elfeed
  (setq elfeed-search-filter "@2-weeks-ago"))

(add-hook! 'elfeed-search-mode-hook #'elfeed-update)
