;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Bo-Wei Chen"
      user-mail-address "tim.chenbw@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Monaco" :size 20 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Monaco" :size 18))

(custom-set-faces!
  '(mode-line :family "Monaco" :height 0.9)
  '(mode-line-inactive :family "Monaco" :height 0.95))
(custom-set-faces
  '(default ((t (:background "#000000"))))
  '(hl-line ((t (:background "#333333"))))
 )

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-monokai-octagon)
(setq doom-theme 'doom-xcode)
(setq fancy-splash-image "~/.doom.d/favicon_io/android-chrome-192x192.png")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;(map! :map 'local "t t" #'imenu-anywhere)

;;Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(key-chord-mode 1)


; autosave
(setq +format-on-save-enabled-modes
      '(not c-mode))
(setq +format-on-save-enabled-modes
      '(not cpp-mode))
(add-hook 'before-save-hook #'+format/buffer nil t)

; file setting
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

(setq-default fill-column 80)
(global-display-fill-column-indicator-mode)


; wakatime
(global-wakatime-mode)

; treemacs
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

; clang cc mode setting
; NOTE: set query-driver when we don't use clang for compiling, just for lsp.
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--query-driver=/etc/profiles/per-user/bwbwchen/bin/g++"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))
