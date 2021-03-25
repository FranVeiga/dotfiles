;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Francisco Veiga"
      user-mail-address "francisco2.veiga@gmail.com")

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
(setq doom-font (font-spec :family "UbuntuMono Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "UbuntuMono Nerd Font" :size 16))
(after! doom-themes
        (setq doom-themes-enable-bold t
              doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))



;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(setq doom-theme 'doom-challenger-deep)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/docs/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; For normal line numbers, set this to 't'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(setq-default tab-width 4)

(map! :i "M-RET" 'evil-force-normal-state)

;; org-mode settings
(after! org
  (setq org-agenda-files (directory-files-recursively "~/org-wiki/" "\\.org$"))
  (setq org-directory "~/org-wiki/notes")
  (setq org-hide-emphasis-markers t)
  (map! :leader
        :desc "Open org index file"
        "o o" #'(lambda() (interactive) (find-file "~/org-wiki/index.org")))
  (custom-set-faces
        '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
        '(org-level-2 ((t (:inherit outline-2 :height 1.3))))
        '(org-level-3 ((t (:inherit outline-3 :height 1.15))))
        '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
)
  )
