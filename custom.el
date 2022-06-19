(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "xelatex -shell-escape")
 '(org-agenda-start-day "+0d" t)
 '(org-agenda-start-on-weekday nil)
 '(org-export-headline-levels 4)
 '(org-export-preserve-breaks nil)
 '(org-export-with-author nil)
 '(org-format-latex-options
   '(:foreground "Black" :background "White" :scale 2.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
     ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-latex-compiler "xelatex -shell-escape")
 '(org-latex-listings 'minted)
 '(org-latex-prefer-user-labels t)
 '(pdf-latex-command "xelatex")
 '(sage-shell:use-prompt-toolkit nil)
 '(sage-shell:use-simple-prompt t)
 '(shell-escape-mode "-shell-escape")
 '(warning-suppress-types
   '((c++-mode-local-vars-hook)
     (c++-mode-local-vars-hook)
     (c-mode-local-vars-hook)
     (hack-local-variables-hook)
     (hack-local-variables-hook)
     (c-mode-local-vars-hook))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#000000"))))
 '(hl-line ((t (:background "#333333"))))
 '(mode-line ((t (:family "Monaco" :height 0.9))))
 '(mode-line-inactive ((t (:family "Monaco" :height 0.95))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.4))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.3))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))
