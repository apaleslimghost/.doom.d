;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Kara Brightwell"
      user-mail-address "kara@153.io")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Iosevka" :size 13 :weight 'light)
      doom-variable-pitch-font (font-spec :family "Galaxie Polaris" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-classic)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq mac-mouse-wheel-smooth-scroll t)

(setq lsp-auto-guess-root t)

(setq-default indent-tabs-mode t)
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys

;; vim-vinegar-like dired ui and - to open
(setq dired-hide-details-hide-symlink-targets nil)
(add-hook 'dired-mode-hook #'dired-hide-details-mode)
(map! :n "-" #'dired-jump)

(add-hook 'prog-mode-hook #'whitespace-mode)
(add-hook 'prog-mode-hook #'visual-line-mode)

(setq whitespace-line-column nil
      whitespace-style
      '(face indentation tabs tab-mark spaces space-mark newline newline-mark
        trailing)
      whitespace-display-mappings
      '((tab-mark ?\t [?› ?\t])
        (newline-mark ?\n [?⁋ ?\n])
        (space-mark ?\  [?·] [?.])))

(map! :map (evil-mc-key-map) "<mouse-1>" #'evil-mc-undo-all-cursors)

(map! :map vterm-mode-map :after vterm
      "<M-left>" #'vterm-send-M-b)

(after! popup
  (set-popup-rules!
    '(("^magit" :side left :width 0.2 :quit t :select t :modeline t)
      ("^magit-diff" :side left :width 0.25 :height 0.7 :slot 1 :quit t :select nil :modeline t)
      ("COMMIT_EDITMSG" :side left :width 0.25 :height 0.3 :slot 2 :quit nil :select t :modeline t))))

(setq evil-vsplit-window-right t)
(setq evil-split-window-below t)
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
