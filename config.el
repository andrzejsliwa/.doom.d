;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Andrzej Śliwa"
      user-mail-address "andrzej.sliwa@gmail.com")

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
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!


(setq doom-font (font-spec :family "JetBrains Mono" :size 16)
      doom-big-font (font-spec :family "JetBrains Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 16)
      doom-serif-font (font-spec :family "JetBrains Mono" :weight 'light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-vibrant)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq doom-modeline-height 1
      doom-modeline-bar-width 0
      doom-modeline-icon t)

;; Reverse colors for the border to have nicer line
;;(set-face-inverse-video-p 'vertical-border nil)
;;(set-face-background 'vertical-border (face-background 'default))

;; Reverse colors for the border to have nicer line
;;(set-face-inverse-video-p 'vertical-border nil)
(set-face-background 'vertical-border (face-background 'default))
(set-face-foreground 'vertical-border (face-foreground 'default))

;; Set symbol for the border
(set-display-table-slot standard-display-table
                        'vertical-border
                        (make-glyph-code ?|))

(custom-set-faces
 '(default ((t (:background "#1A1B26"))))
 '(hl-line ((t (:background "#1E202E"))))
 '(line-number ((t (:foreground "#363B54"))))
 '(font-lock-string-face ((t (:foreground "#9ECE6A")))))

;;(setq doom-modeline-height 16) ; optional
(if (facep 'mode-line-active)
    (set-face-attribute 'mode-line-active nil :family "JetBrains Mono" :height 100) ; For 29+
  (set-face-attribute 'mode-line nil :family "JetBrains Mono" :height 100))
(set-face-attribute 'mode-line-inactive nil :family "JetBrains Mono" :height 100)

;; (setq doom-modeline-icon nil)
;; Set symbol for the border
;;(set-display-table-slot standard-display-table
;;                      'vertical-border
;;                       (make-glyph-code ?|))
;;(set-face-foreground 'vertical-border (face-background 'default))

(custom-set-faces
      '(font-lock-string-face ((t (:foreground "#9ECE6A")))))

(define-key evil-normal-state-map (kbd "g j") 'avy-goto-word-0)
(define-key evil-normal-state-map (kbd "g g") 'avy-goto-symbol-1)
(define-key evil-normal-state-map (kbd "SPC §") '+popup/toggle)
(define-key evil-normal-state-map (kbd "SPC h p") 'html-to-hiccup-convert-region)


(use-package! jinja2-mode
  :mode (("\\.html\\'" . jinja2-mode)))

(setq lsp-lens-enable nil)
(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-sideline-show-hover nil)
(setq lsp-ui-sideline-enable nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; (after! cider
;;   (set-popup-rules!
;;    '(("^\\*cider-repl"
;;       :side right
;;       :width 100
;;       :quit nil
;;       :ttl nil))))

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
