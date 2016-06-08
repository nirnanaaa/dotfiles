(deftheme solarized
  "solarized for emacs.")

(defvar solarized-colors
  ;; name     sRGB      Gen RGB   256       16              8
  '((base03  "#002b36" "#042028" "#1c1c1c" "brightblack"   "black")
    (base02  "#073642" "#0a2832" "#262626" "black"         "black")
    (base01  "#586e75" "#465a61" "#585858" "brightgreen"   "green")
    (base00  "#657b83" "#52676f" "#626262" "brightyellow"  "yellow")
    (base0   "#839496" "#708183" "#808080" "brightblue"    "blue")
    (base1   "#93a1a1" "#81908f" "#8a8a8a" "brightcyan"    "cyan")
    (base2   "#eee8d5" "#e9e2cb" "#e4e4e4" "white"         "white")
    (base3   "#fdf6e3" "#fcf4dc" "#ffffd7" "brightwhite"   "white")
    (yellow  "#b58900" "#a57705" "#af8700" "yellow"        "yellow")
    (orange  "#cb4b16" "#bd3612" "#d75f00" "brightred"     "red")
    (red     "#dc322f" "#c60007" "#d70000" "red"           "red")
    (magenta "#d33682" "#c61b6e" "#af005f" "magenta"       "magenta")
    (violet  "#6c71c4" "#5859b7" "#5f5faf" "brightmagenta" "magenta")
    (blue    "#268bd2" "#2075c7" "#0087ff" "blue"          "blue")
    (cyan    "#2aa198" "#259185" "#00afaf" "cyan"          "cyan")
    (green   "#859900" "#728a05" "#5f8700" "green"         "green")))

(defun solarized-faces (variant)
  (defun lookup (color)
    (nth 4 (assoc color solarized-colors))) ; 256. need this for osx.

  (let* (
    (base03  (lookup 'base03))
    (base02  (lookup 'base02))
    (base01  (lookup 'base01))
    (base00  (lookup 'base00))
    (base0   (lookup 'base0))
    (base1   (lookup 'base1))
    (base2   (lookup 'base2))
    (base3   (lookup 'base3))
    (yellow  (lookup 'yellow))
    (orange  (lookup 'orange))
    (red     (lookup 'red))
    (magenta (lookup 'magenta))
    (violet  (lookup 'violet))
    (blue    (lookup 'blue))
    (cyan    (lookup 'cyan))
    (green   (lookup 'green))
    (silent     (if (eq variant 'dark) base03 base3))
    (silent-em  (if (eq variant 'dark) base02 base2))
    (content    (if (eq variant 'dark) base01 base1))
    (content-em (if (eq variant 'dark) base00 base0))
    (fmt-revbb `(:weight bold :slant normal :underline nil :inverse-video t)))

    ;; faces
    `(
      ;; basic
      (default ((,t (:foreground ,content-em :background ,silent))))
      (cursor  ((,t (:foreground ,content-em :background ,content :inverse-video t))))
      (linum   ((,t (:foreground ,content    :background ,silent-em))))

      ;; correctness
      (warning ((,t (:foreground ,yellow))))
      (error   ((,t (:foreground ,orange))))
      (success ((,t (:foreground ,green))))

      ;; mode line
      (mode-line ((,t (:foreground ,silent-em :background ,silent ,@fmt-revbb :box nil))))
      (mode-line-inactive ((,t (:foreground ,silent-em :background ,silent ,@fmt-revbb :box nil))))

      ;; font lock
      (font-lock-builtin-face ((,t (:foreground ,blue :slant italic))))
      (font-lock-comment-delimiter-face ((,t (:foreground ,content-em))))
      (font-lock-comment-face ((,t (:foreground ,content-em))))
      (font-lock-constant-face ((,t (:foreground ,blue))))
      (font-lock-doc-face ((,t (:foreground ,cyan :slant italic))))
      (font-lock-doc-string-face ((,t (:foreground ,blue))))
      (font-lock-function-name-face ((,t (:foreground ,blue))))
      (font-lock-keyword-face ((,t (:foreground ,green))))
      (font-lock-negation-char-face ((,t (:foreground ,content-em))))
      (font-lock-preprocessor-face ((,t (:foreground ,blue))))
      (font-lock-string-face ((,t (:foreground ,cyan))))
      (font-lock-type-face ((,t (:foreground ,yellow))))
      (font-lock-variable-name-face ((,t (:foreground ,yellow))))
      (font-lock-warning-face ((,t (:foreground ,orange :weight bold :underline t))))

      ;; org mode
      (org-agenda-structure ((,t (:inherit font-lock-comment-face :foreground ,magenta))))
      (org-agenda-date ((,t (:foreground ,content :background ,silent :weight bold :box (:line-width 4 :color ,silent-em) ))) t)
      (org-agenda-date-weekend ((,t (:inherit org-agenda-date :slant italic))) t)
      (org-agenda-date-today ((,t (:inherit org-agenda-date :slant italic underline: t))) t)
      (org-agenda-done ((,t (:foreground ,green))) t)
      (org-archived ((,t (:foreground ,content :weight normal))))
      (org-block ((,t (:foreground ,content))))
      (org-block-begin-line ((,t (:foreground ,content :slant italic))))
      (org-checkbox ((,t (:background ,silent-em :foreground ,content-em :box (:line-width 1 :style released-button)))))
      (org-code ((,t (:foreground ,content))))
      (org-date ((,t (:foreground ,blue :underline t))))
      (org-done ((,t (:weight bold :foreground ,green :weight normal))))
      (org-ellipsis ((,t (:foreground ,content))))
      (org-formula ((,t (:foreground ,yellow))))
      (org-headline-done ((,t (:foreground ,green))))
      (org-hide ((,t (:foreground ,silent))))
      (org-level-1 ((,t (:foreground ,blue, :weight normal)))) ; TODO colors broken on osx
      (org-level-2 ((,t (:foreground ,yellow, :weight normal))))
      (org-level-3 ((,t (:foreground ,cyan, :weight normal))))
      (org-level-4 ((,t (:foreground ,green :weight normal))))
      (org-level-5 ((,t (:foreground ,cyan :weight normal))))
      (org-level-6 ((,t (:foreground ,green :weight normal))))
      (org-level-7 ((,t (:foreground ,red :weight normal))))
      (org-level-8 ((,t (:foreground ,blue :weight normal))))
      (org-link ((,t (:foreground ,yellow :underline t))))
      (org-sexp-date ((,t (:foreground ,violet))))
      (org-scheduled ((,t (:foreground ,magenta :weight normal))))
      (org-scheduled-previously ((,t (:foreground ,magenta :weight normal))))
      (org-scheduled-today ((,t (:foreground ,blue :weight normal))))
      (org-special-keyword ((,t (:foreground ,content :weight bold))))
      (org-table ((,t (:foreground ,green))))
      (org-tag ((,t (:foreground ,content-em :background ,silent-em :weight bold))))
      (org-time-grid ((,t (:foreground ,cyan))))
      (org-todo ((,t (:foreground ,red :weight normal))))
      (org-upcoming-deadline ((,t (:foreground ,yellow ))))
      (org-warning ((,t (:foreground ,orange :weight bold :underline t))))
      (org-habit-clear-face ((,t (:background ,blue :foreground ,blue))))
      (org-habit-clear-future-face ((,t (:background ,blue))))
      (org-habit-ready-face ((,t (:background ,green :foreground ,green))))
      (org-habit-ready-future-face ((,t (:background ,green))))
      (org-habit-alert-face ((,t (:background ,yellow :foreground ,yellow))))
      (org-habit-alert-future-face ((,t (:background ,yellow))))
      (org-habit-overdue-face ((,t (:background ,yellow :foreground ,red))))
      (org-habit-overdue-future-face ((,t (:background ,red))))
      (org-agenda-dimmed-todo-face ((,t (:foreground ,content))))
      (org-agenda-restriction-lock ((,t (:background ,yellow))))
      (org-clock-overlay ((,t (:background ,yellow))))
      (org-column ((,t (:background ,silent-em :strike-through nil :underline nil :slant normal :weight normal))))
      (org-column-title ((,t (:background ,silent-em :underline t :weight bold))))
      (org-date-selected ((,t (:foreground ,red :inverse-video t))))
      (org-document-info ((,t (:foreground ,content-em))))
      (org-document-title ((,t (:foreground ,content-em  :weight bold :height 1.44))))
      (org-drawer ((,t (:foreground ,cyan))))
      (org-footnote ((,t (:foreground ,magenta :underline t))))
      (org-latex-and-export-specials ((,t (:foreground ,orange))))
      (org-eode-line-clock-overrun ((,t (:inherit modeline :background ,red))))

      ;; undo-tree
      (undo-tree-visualizer-default-face ((,t (:foreground ,content :background ,silent))))
      (undo-tree-visualizer-unmodified-face ((,t (:foreground ,green))))
      (undo-tree-visualizer-current-face ((,t (:foreground ,blue :inverse-video t))))
      (undo-tree-visualizer-active-branch-face ((,t (:foreground ,content-em :background ,silent :weight bold))))
      (undo-tree-visualizer-register-face ((,t (:foreground ,yellow))))

      ;; calfw
      (cfw:face-day-title ((,t (:background ,silent-em))))
      (cfw:face-annotation ((,t (:inherit cfw:face-day-title :foreground ,yellow))))
      (cfw:face-default-content ((,t (:foreground ,green))))
      (cfw:face-default-day ((,t (:inherit cfw:face-day-title))))
      (cfw:face-disable ((,t (:inherit cfw:face-day-title :foreground ,content))))
      (cfw:face-grid ((,t (:foreground ,silent-em))))
      (cfw:face-header ((,t (:foreground ,violet :background nil))))
      (cfw:face-holiday ((,t (:foreground ,cyan :background ,silent-em :weight normal))))
      (cfw:face-periods ((,t (:foreground ,magenta))))
      (cfw:face-select ((,t (:background nil :foreground nil))))
      (cfw:face-saturday ((,t (:foreground ,cyan :weight normal :background nil))))
      (cfw:face-sunday ((,t (:foreground ,cyan :weight normal :background nil))))
      (cfw:face-title ((,t (:inherit variable-pitch :foreground ,yellow :height 2.0))))
      (cfw:face-today ((,t (:background ,silent-em :foreground nil))))
      (cfw:face-today-title ((,t (:foreground ,content-em :background ,silent-em))))
      (cfw:face-toolbar ((,t (:background ,silent-em :foreground ,content-em))))
      (cfw:face-toolbar-button-off ((,t (:foreground ,content))))
      (cfw:face-toolbar-button-on ((,t (:foreground ,yellow))))

      ;; helm
      (helm-apt-deinstalled ((,t (:foreground ,content))))
      (helm-apt-installed ((,t (:foreground ,green))))
      (helm-bookmark-directory ((,t (:inherit helm-ff-directory))))
      (helm-bookmark-file ((,t (:foreground ,content-em))))
      (helm-bookmark-gnus ((,t (:foreground ,cyan))))
      (helm-bookmark-info ((,t (:foreground ,green))))
      (helm-bookmark-man ((,t (:foreground ,violet))))
      (helm-bookmark-w3m ((,t (:foreground ,yellow))))
      (helm-bookmarks-su ((,t (:foreground ,orange))))
      (helm-buffer-not-saved ((,t (:foreground ,orange))))
      (helm-buffer-saved-out ((,t (:foreground ,red :background ,silent :inverse-video t))))
      (helm-buffer-size ((,t (:foreground ,content))))
      (helm-candidate-number ((,t (:background ,silent-em :foreground ,content-em :bold t))))
      (helm-ff-directory ((,t (:background ,silent  :foreground ,blue))))
      (helm-ff-executable ((,t (:foreground ,green))))
      (helm-ff-file ((,t (:background ,silent :foreground ,content-em))))
      (helm-ff-invalid-symlink ((,t (:background ,silent :foreground ,orange :slant italic))))
      (helm-ff-prefix ((,t (:background ,yellow :foreground ,silent))))
      (helm-ff-symlink ((,t (:foreground ,cyan))))
      (helm-grep-file ((,t (:foreground ,cyan :underline t))))
      (helm-grep-finish ((,t (:foreground ,green))))
      (helm-grep-lineno ((,t (:foreground ,orange))))
      (helm-grep-match ((,t (:inherit match))))
      (helm-grep-running ((,t (:foreground ,red))))
      (helm-header ((,t (:inherit header-line))))
      (helm-lisp-completion-info ((,t (:foreground ,content-em))))
      (helm-lisp-show-completion ((,t (:foreground ,yellow  :background ,silent-em :bold t))))
      (helm-M-x-key ((,t (:foreground ,orange :underline t))))
      (helm-moccur-buffer ((,t (:foreground ,cyan :underline t))))
      (helm-match ((,t (:inherit match))))
      (helm-selection ((,t (:background ,silent-em :underline t))))
      (helm-selection-line ((,t (:background ,silent-em :foreground ,content-em :underline nil))))
      (helm-separator ((,t (:foreground ,red))))
      (helm-source-header ((,t (:background ,silent :foreground ,orange :underline nil))))
      (helm-time-zone-current ((,t (:foreground ,green))))
      (helm-time-zone-home ((,t (:foreground ,red))))
      (helm-visible-mark ((,t (:background ,silent :foreground ,magenta :bold t))))

      ;; autocompletion
      (ac-candidate-face ((,t (:background ,silent-em :foreground ,content-em))))
      (ac-selection-face ((,t (:background ,blue :foreground ,silent))))
      (ac-candidate-mouse-face ((,t (:background ,content-em :foreground ,content-em))))
      (ac-completion-face ((,t (:foreground ,content-em :underline t))))
      (ac-gtags-candidate-face ((,t (:background ,silent-em :foreground ,content-em))))
      (ac-gtags-selection-face ((,t (:background ,content-em :foreground ,content-em))))
      (ac-yasnippet-candidate-face ((,t (:background ,silent-em :foreground ,yellow))))
      (ac-yasnippet-selection-face ((,t (:background ,yellow :foreground ,yellow))))

      ;; popup
      (popup-face ((,t (:background ,silent-em :foreground ,content-em))))
      (popup-isearch-match ((,t (:background ,yellow :foreground ,silent))))
      (popup-menu-face ((,t (:background ,silent-em :foreground ,content-em))))
      (popup-menu-mouse-face ((,t (:background ,blue :foreground ,content-em))))
      (popup-menu-selection-face ((,t (:background ,magenta :foreground ,silent))))
      (popup-scroll-bar-background-face ((,t (:background ,silent-em))))
      (popup-scroll-bar-foreground-face ((,t (:background ,violet))))
      (popup-tip-face ((,t (:background ,silent :foreground ,content-em))))
      )))

(apply #'custom-theme-set-faces 'solarized (solarized-faces solarized-mode))

(provide-theme 'solarized)

