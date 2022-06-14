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

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/logseq/pages")
;; (setq org-agenda-files (list (format-time-string "~/logseq/journals/%Y_%m_%d.org")))
(setq org-agenda-files '("~/logseq/journals"))
;; (setq org-agenda-files '("~/logseq/agenda.org"
;;                          "~/logseq/gcal.org"))
;; (setq org-agenda-span 5)
(setq org-agenda-overriding-header "Bo-Wei's schedule")
;; (setq org-agenda-start-on-weekday nil)




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
(after! imenu
  :config
(map! :leader
      :desc "Tagbar" "t t" #'imenu-list-smart-toggle)
)
  (set-popup-rule! "^\\*Ilist"
    :side 'right :size 15 :quit nil :select nil :ttl 0)

;;Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(key-chord-mode 1)

(map! (:after evil
       :m "L" nil
       :m "H" nil))

(map! (:after c++
       :m "C-h" nil
       :m "C-j" nil
       :m "C-k" nil
       :m "C-l" nil))

(map! (:after c
       :m "C-h" nil
       :m "C-j" nil
       :m "C-k" nil
       :m "C-l" nil))

(map! (:after cpp
       :m "C-h" nil
       :m "C-j" nil
       :m "C-k" nil
       :m "C-l" nil))

;; for centuar tabs
(use-package! centaur-tabs
  :config
(setq centaur-tabs-style "bar"
  centaur-tabs-height 20
	  centaur-tabs-set-icons t
	  centaur-tabs-set-modified-marker t
	  centaur-tabs-show-navigation-buttons t
	  centaur-tabs-set-bar 'under
	  x-underline-at-descent-line t)
   (setq centaur-tabs-cycle-scope 'tabs)
   (centaur-tabs-group-by-projectile-project)
   (centaur-tabs-headline-match)
   (centaur-tabs-mode t)
)
;; (map!
;;       :desc "evil-tabs-left"
;;       "L" #'centaur-tabs-forward)
;; (map!
;;       :desc "evil-tabs-right"
;;       "H" #'centaur-tabs-backward)


(map! :after smartparens
      :map smartparens-mode-map
      [C-h] nil
      [C-j] nil
      [C-k] nil
      [C-l] nil)

(map! :after cc-mode
      :map c-mode-map
      :nv "C-h" #'centaur-tabs-backward
      :nv "C-l" #'centaur-tabs-forward)
(map! :after cc-mode
      :map c++-mode-map
      :nv "C-h" #'centaur-tabs-backward
      :nv "C-l" #'centaur-tabs-forward)
(map! :after cc-mode
      :map cpp-mode-map
      :nv "C-h" #'centaur-tabs-backward
      :nv "C-l" #'centaur-tabs-forward)
(map! :after lsp-mode
      :map lsp-mode-map
      :nvm "C-h" #'centaur-tabs-backward
      :nvm "C-l" #'centaur-tabs-forward)
; for window movement
(map! :g
      :desc "evil-window-left"
      ;; "C-h" #'evil-window-left)
      "C-h" #'centaur-tabs-backward)
(map! :m
      :desc "evil-window-down"
      "C-j" #'evil-window-down)
(map! :m
      :desc "evil-window-up"
      "C-k" #'evil-window-up)
(map! :g
      :desc "evil-window-right"
      ;; "C-l" #'evil-window-right)
      "C-l" #'centaur-tabs-forward)

; autosave
(setq +format-on-save-enabled-modes
      '(not c-mode))
;; (setq +format-on-save-enabled-modes
;;       '(not cpp-mode))

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
        (treemacs-display-current-project-exclusively)
        (treemacs-project-follow-mode)
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


;leetcode
(after! leetcode
  (setq leetcode-prefer-language "cpp"
        leetcode-prefer-sql "mysql"
        leetcode-save-solutions t
        leetcode-directory "~/Coding_Practice/leetcode"))

(defun my-markdown-mode-hook ()
       (auto-fill-mode t)
       (set-fill-column 80))

(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)

(global-visual-line-mode t)
(add-hook 'text-mode-hook #'visual-line-mode)

; org-mode to logseq

(setq deft-directory "~/logseq"
      deft-extensionis '("org" "md")
      deft-recursive t)

(setq org-journal-date-prefix "#+title: "
      org-journal-time-prefix "* "
      org-journal-time-format ""
      org-journal-date-format "%Y-%m-%d"
      org-journal-file-format "%Y_%m_%d.org"
      org-journal-dir "~/logseq/journals")


(after! org-roam
  (add-hook 'after-init-hook 'org-roam-mode)
  (setq org-roam-directory "~/logseq/pages"
        org-roam-dailies-directory "~/logseq/journals"
        org-roam-dailies-capture-templates
                '(("d" "default" entry
                   "* %?"
                   :target (file+head "%<%Y_%m_%d>.org"
                                      "#+title: %<%Y-%m-%d>\n")))

        org-roam-capture-templates
                '(("d" "default" plain
                   "* %?"
                   :target (file+head "${title}.org"
                                      "#+title: ${title}\n")))
        )

)
(setq org-startup-with-inline-images t)


; org mermaid
(setq ob-mermaid-cli-path "/home/bwbwchen/.yarn/bin/mmdc")
(org-babel-do-load-languages 'org-babel-load-languages
                             (append org-babel-load-languages
                              '((mermaid     . t)
                                (scheme       . t))))

(setq org-logseq-dir "~/logseq/pages")
(setq org-latex-image-default-width "")

; org mode export to pdf
(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
             '("org-plain-latex"
               "\\documentclass{article}
           [NO-DEFAULT-PACKAGES]
           [PACKAGES]
           [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
               '("elsarticle"
                 "\\documentclass{elsarticle}
 [NO-DEFAULT-PACKAGES]
 [PACKAGES]
 [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
               '("bw"
                 "\\documentclass[a4paper, 12pt]{article}
\\usepackage{fullpage,mathpazo,amsfonts,nicefrac}
\\usepackage{enumitem}
\\usepackage{mdframed}

\\usepackage{minted}
\\usepackage{listings}

\\usepackage{fontspec}
\\usepackage{xeCJK}
\\usepackage{amsmath}
\\usepackage{amssymb}
\\usepackage{indentfirst}

\\usepackage{subcaption}
\\usepackage{graphicx}

\\usepackage{pgfplots}
\\usepackage{filecontents}
\\usepackage{adjustbox}
\\usepackage{longtable}
\\usepackage{algorithm2e}

\\usepgfplotslibrary{external}
\\tikzexternalize


\\setmainfont[Mapping=tex-text]{Times New Roman}

\\setCJKmainfont{cwTeXKai}

\\XeTeXlinebreaklocale \"zh\"
\\XeTeXlinebreakskip = 0pt plus 1pt

\\usepackage[colorlinks,citecolor=red,urlcolor=blue,bookmarks=false,hypertexnames=true,bookmarks=true]{hyperref}

\\lstdefinestyle{mystyle}{
   backgroundcolor=\\color{backcolour},
   commentstyle=\\color{codegreen},
   keywordstyle=\\color{magenta},
   numberstyle=\\tiny\\color{codegray},
   stringstyle=\\color{codepurple},
   basicstyle=\\ttfamily\\footnotesize,
   breakatwhitespace=false,
   breaklines=true,
   captionpos=b,
   keepspaces=true,
   numbers=left,
   numbersep=5pt,
   showspaces=false,
   showstringspaces=false,
   showtabs=false,
   tabsize=4
 }
\\lstset{style=mystyle}
\\author{Bo-Wei Chen 陳博暐 \\\\ tim.chenbw@gmail.com}

[NO-DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

)


;; (setq org-latex-preview 't)
(setq org-latex-listings 't)
(setq org-export-latex-listings 'minted)
(setq org-latex-default-class "bw")
(setq doc-view-continuous 't)
(setq org-return-follows-link 't)
(setq org-latex-compiler "xelatex")
(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
    "bibtex %b"
    "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
    "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(add-hook 'org-mode-hook 'org-fragtog-mode)

;; (add-hook 'org-mode-hook
;;       (lambda ()
;;          (add-hook 'after-save-hook 'org-latex-preview nil 'make-it-local)))
;; (with-eval-after-load 'tex
;;     (add-to-list 'TeX-view-program-selection
;;                  '(output-pdf "zathura")))

(setq TeX-view-program-selection '((output-pdf "Zathura")))


(setq org-image-actual-width nil)

(use-package! xenops
  :config
  (setq xenops-reveal-on-entry t)
  (setq xenops-math-latex-max-tasks-in-flight 6)
  (add-hook 'LaTeX-mode-hook #'xenops-mode)
  (add-hook 'org-mode-hook #'xenops-mode)
  (add-hook 'xenops-mode-hook 'xenops-render)
  (add-hook 'org-babel-after-execute-hook (lambda ()
                                            (interactive)
                                            (ignore-errors (xenops-render))))
  (setq xenops-math-image-scale-factor 1.5)
  (setcar (cdr (car xenops-elements))
          '(:delimiters
            ("^[ 	]*\\\\begin{\\(align\\|equation\\|gather\\)\\*?}" "^[ 	]*\\\\end{\\(align\\|equation\\|gather\\)\\*?}")
            ("^[ 	]*\\\\\\[" "^[ 	]*\\\\\\]"))))


(use-package! ob-sagemath
  :config
  ;; Ob-sagemath supports only evaluating with a session.
  (setq org-babel-default-header-args:sage '((:session . t)
                                             (:results . "drawer")))
  (setq sage-shell:input-history-cache-file "~/data/sage_history")
  (add-hook 'sage-shell-after-prompt-hook #'sage-shell-view-mode))



(defun current-filename ()
  (file-name-sans-extension
   (file-name-nondirectory (buffer-file-name))))
(defun get-latex-cache-dir-path ()
  "return the path for the directory that contains the compiled pdf latex documents"
  (interactive)
  (setq dir-path (concat (expand-file-name user-emacs-directory) "latex/"))
  (ignore-errors (make-directory dir-path))
  dir-path)
(defun compile-sagetex-command ()
  "return the command needed to compile sagetex"
  (interactive)
  (setq first-pdflatex-command (concat "(" (concat (concat (concat "pdflatex --synctex=1 -output-directory=" (concat (get-latex-cache-dir-path) " ")) (buffer-file-name)) ";")))
  (setq last-pdflatex-command (concat (concat (concat "pdflatex --synctex=1 -output-directory=" (concat (get-latex-cache-dir-path) " ")) (buffer-file-name)) ")"))
  (concat first-pdflatex-command (concat (concat "(cd " (concat (get-latex-cache-dir-path) (concat "; sage " (concat (current-filename) ".sagetex.sage);")))) last-pdflatex-command)))
(defun compile-sagetex ()
  "compile the current latex document with support for sagetex"
  (interactive)
  (start-process-shell-command "latex" "latex" (compile-sagetex-command)))

;; change latex images cache location
(setq org-preview-latex-image-directory (get-latex-cache-dir-path))
;; make latex preview bigger
(plist-put org-format-latex-options :scale 1.5)
;; allow usage of #+BIND in latex exports
(setq org-export-allow-bind-keywords t)
;; make images default to their original size in latex exports
(setq org-latex-image-default-scale "1")
;; enable latex snippets in org mode
;; (defun my-org-latex-yas ()
;;   "Activate org and LaTeX yas expansion in org-mode buffers."
;;   (yas-minor-mode)
;;   (yas-activate-extra-mode 'latex-mode))
;; (add-hook 'org-mode-hook #'my-org-latex-yas)
;; preserve all line breaks when exporting
(setq org-export-preserve-breaks t)
;; indent headings properly
(add-hook 'org-mode-hook 'org-indent-mode)

(defun bw/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package! visual-fill-column
  :hook (org-mode . bw/org-mode-visual-fill))

(add-hook 'org-mode-hook #'doom-disable-line-numbers-h)

;; (setq org-latex-listings t ;; use listings package for latex code blocks
;;       org-time-stamp-formats '("<%Y-%m-%d %a>" . "<%Y-%m-%d %a %H:%M:%S>")) ;; timestamp with seconds
;; some extra libraries to use with latex
(add-to-list 'org-latex-default-packages-alist '("" "tkz-euclide" t))
(add-to-list 'org-latex-default-packages-alist '("" "tikz" t))
(add-to-list 'org-latex-default-packages-alist '("" "pgfplots" t))
(add-to-list 'org-latex-default-packages-alist '("" "cancel" t))
(add-to-list 'org-latex-default-packages-alist '("" "mathtools" t))
;; better than the default, works for tikzpicture
;; (setq org-preview-latex-default-process 'dvipng)
(setq org-preview-latex-default-process 'imagemagick)
;; syntax highlighting for latex fragments in org mode
(setq org-highlight-latex-and-related '(native latex script entities))
(require 'org-src)
(add-to-list 'org-src-block-faces '("latex" (:inherit default :extend t)))

(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t)
  )

(defun org--create-inline-image-advice (img)
  (nconc img (list :background "#ffffff")))
(advice-add 'org--create-inline-image
            :filter-return #'org--create-inline-image-advice)

