(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "xelatex -shell-escape")
 '(org-agenda-start-day "+0d" t)
 '(org-agenda-start-on-weekday nil)
 '(org-format-latex-options
   '(:foreground "Black" :background "White" :scale 2.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
     ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-latex-compiler "xelatex -shell-escape")
 '(org-latex-listings t t)
 '(org-export-preserve-breaks nil)
 '(org-latex-prefer-user-labels t t)
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
 '(mode-line-inactive ((t (:family "Monaco" :height 0.95)))))
