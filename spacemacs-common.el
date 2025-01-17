;;; spacemacs-common.el --- Color theme with a dark and light versions.

;; Copyright (C) 2014 , Nasser Alshammari

;; Author: Nasser Alshammari
;; URL: <https://github.com/nashamri/spacemacs-theme>
;;
;; Version: 0.1
;; Keywords: color, theme
;; Package-Requires: ((emacs "24"))
;; Initially created with the help of emacs-theme-generator, <https://github.com/mswift42/theme-creator>.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:
;;
;; This is a color theme for spacemacs <https://github.com/syl20bnr/spacemacs>.
;; It comes with two versions, dark and light and should work well in
;; a 256 color terminal.

;;; Code:

(defgroup spacemacs-theme nil
  "Spacemacs-theme options."
  :group 'faces)

(defcustom spacemacs-theme-comment-bg t
  "Use a background for comment lines."
  :type 'boolean
  :group 'spacemacs-theme)

(defcustom spacemacs-theme-org-height t
  "Use varying text heights for org headings."
  :type 'boolean
  :group 'spacemacs-theme)

(defun create-spacemacs-theme (variant theme-name)
  (let ((class '((class color) (min-colors 89))) ;;                    ~~ Dark ~~                                   ~~ Light ~~
        ;;                                                            GUI       TER                                GUI       TER
        (base       (if (eq variant 'dark) (if (display-graphic-p) "#b2b2b2" "#b2b2b2") (if (display-graphic-p) "#655370" "#5f5f87")))
        (cursor     (if (eq variant 'dark) (if (display-graphic-p) "#e3dedd" "#d0d0d0") (if (display-graphic-p) "#100a14" "#121212")))
        (bg1        (if (eq variant 'dark) (if (display-graphic-p) "#292b2e" "#262626") (if (display-graphic-p) "#fbf8ef" "#ffffff")))
        (bg2        (if (eq variant 'dark) (if (display-graphic-p) "#212026" "#1c1c1c") (if (display-graphic-p) "#efeae9" "#e4e4e4")))
        (bg3        (if (eq variant 'dark) (if (display-graphic-p) "#100a14" "#121212") (if (display-graphic-p) "#e3dedd" "#d0d0d0")))
        (bg4        (if (eq variant 'dark) (if (display-graphic-p) "#0a0814" "#080808") (if (display-graphic-p) "#d2ceda" "#bcbcbc")))
        (key1       (if (eq variant 'dark) (if (display-graphic-p) "#4f97d7" "#4f97d7") (if (display-graphic-p) "#4f97d7" "#4f97d7")))
        (key2       (if (eq variant 'dark) (if (display-graphic-p) "#277bb8" "#277bb8") (if (display-graphic-p) "#277bb8" "#277bb8")))
        (builtin    (if (eq variant 'dark) (if (display-graphic-p) "#1f71ab" "#268bd2") (if (display-graphic-p) "#1f71ab" "#268bd2")))
        (keyword    (if (eq variant 'dark) (if (display-graphic-p) "#237fbf" "#268bd2") (if (display-graphic-p) "#237fbf" "#268bd2")))
        (const      (if (eq variant 'dark) (if (display-graphic-p) "#a45bad" "#d75fd7") (if (display-graphic-p) "#4e3163" "#8700af")))
        (comment    (if (eq variant 'dark) (if (display-graphic-p) "#2aa198" "#2aa198") (if (display-graphic-p) "#2aa198" "#2aa198")))
        (comment-bg (if (eq variant 'dark) (if (display-graphic-p) "#293234" "#262626") (if (display-graphic-p) "#eff3ea" "#ffffff")))
        (func       (if (eq variant 'dark) (if (display-graphic-p) "#bc6ec5" "#d75fd7") (if (display-graphic-p) "#6c3163" "#8700af")))
        (str        (if (eq variant 'dark) (if (display-graphic-p) "#2aa198" "#2aa198") (if (display-graphic-p) "#2aa198" "#2aa198")))
        (type       (if (eq variant 'dark) (if (display-graphic-p) "#c56ec3" "#d75fd7") (if (display-graphic-p) "#6c4173" "#8700af")))
        (var        (if (eq variant 'dark) (if (display-graphic-p) "#adaab3" "#adaab3") (if (display-graphic-p) "#656370" "#767676")))
        (err        (if (eq variant 'dark) (if (display-graphic-p) "#e0211d" "#e0211d") (if (display-graphic-p) "#e0211d" "#e0211d")))
        (war        (if (eq variant 'dark) (if (display-graphic-p) "#dc752f" "#dc752f") (if (display-graphic-p) "#dc752f" "#dc752f")))
        (inf        (if (eq variant 'dark) (if (display-graphic-p) "#2f96dc" "#2f96dc") (if (display-graphic-p) "#2f96dc" "#2f96dc")))
        (suc        (if (eq variant 'dark) (if (display-graphic-p) "#86dc2f" "#86dc2f") (if (display-graphic-p) "#86dc2f" "#87ff00")))
        (green      (if (eq variant 'dark) (if (display-graphic-p) "#67b11d" "#67b11d") (if (display-graphic-p) "#67b11d" "#5faf00")))
        (yellow     (if (eq variant 'dark) (if (display-graphic-p) "#b1951d" "#875f00") (if (display-graphic-p) "#b1951d" "#875f00")))
        (cyan       (if (eq variant 'dark) (if (display-graphic-p) "#28def0" "#00ffff") (if (display-graphic-p) "#21b8c7" "#008080")))
        (violet     (if (eq variant 'dark) (if (display-graphic-p) "#a31db1" "#af00df") (if (display-graphic-p) "#a31db1" "#800080")))
        (red        (if (eq variant 'dark) (if (display-graphic-p) "#f2241f" "#d70000") (if (display-graphic-p) "#f2241f" "#d70008")))
        (active1    (if (eq variant 'dark) (if (display-graphic-p) "#222226" "#121212") (if (display-graphic-p) "#e7e5eb" "#d7dfff")))
        (active2    (if (eq variant 'dark) (if (display-graphic-p) "#5d4d7a" "#444444") (if (display-graphic-p) "#d3d3e7" "#afafd7")))
        (inactive   (if (eq variant 'dark) (if (display-graphic-p) "#5d4d7a" "#111111") (if (display-graphic-p) "#9f8fbd" "#af87d7")))
        (org-h1-bg  (if (eq variant 'dark) (if (display-graphic-p) "#293239" "#262626") (if (display-graphic-p) "#edf1ed" "#ffffff")))
        (org-h2-bg  (if (eq variant 'dark) (if (display-graphic-p) "#293235" "#262626") (if (display-graphic-p) "#edf2e9" "#ffffff")))
        (org-h3-bg  (if (eq variant 'dark) (if (display-graphic-p) "#2d332c" "#262626") (if (display-graphic-p) "#f1f3e1" "#ffffff")))
        (org-h4-bg  (if (eq variant 'dark) (if (display-graphic-p) "#32322c" "#262626") (if (display-graphic-p) "#f6f1e1" "#ffffff")))
        (highlight  (if (eq variant 'dark) (if (display-graphic-p) "#333c45" "#444444") (if (display-graphic-p) "#d3d3e7" "#d7d7ff"))))

    (custom-theme-set-faces
     theme-name

;;;;; basics
     `(default ((,class (:background ,bg1 :foreground ,base))))
     `(vertical-border ((,class (:foreground ,bg4))))
     `(eval-sexp-fu-flash ((,class (:background ,suc :foreground ,bg1))))
     `(eval-sexp-fu-flash-error ((,class (:background ,err :foreground ,bg1))))
     `(minibuffer-prompt ((,class (:bold t :foreground ,keyword))))
     `(match ((,class (:background ,bg1 :foreground ,inf :weight bold))))
     `(default-italic ((,class (:italic t))))
     `(link ((,class (:foreground ,comment :underline t))))
     `(link-visited ((,class (:foreground ,type :underline t))))
     `(font-lock-builtin-face ((,class (:foreground ,builtin))))
     `(font-lock-comment-face ((,class (:foreground ,comment :background ,(when spacemacs-theme-comment-bg comment-bg)))))
     `(font-lock-negation-char-face ((,class (:foreground ,const))))
     `(font-lock-reference-face ((,class (:foreground ,const))))
     `(font-lock-constant-face ((,class (:foreground ,const))))
     `(font-lock-doc-face ((,class (:foreground ,comment))))
     `(font-lock-function-name-face ((,class (:foreground ,func :bold t))))
     `(font-lock-keyword-face ((,class (:bold ,class :foreground ,keyword))))
     `(font-lock-string-face ((,class (:foreground ,str))))
     `(font-lock-type-face ((,class (:foreground ,type :bold t))))
     `(font-lock-variable-name-face ((,class (:foreground ,var))))
     `(font-lock-preprocessor-face ((,class (:foreground ,func))))
     `(font-lock-warning-face ((,class (:foreground ,war :background ,bg1))))
     `(region ((,class (:background ,highlight))))
     `(italic ((,class (:underline nil))))
     `(highlight ((,class (:foreground ,base :background ,bg3))))
     `(hl-line ((,class (:background ,bg2))))
     `(fringe ((,class (:background ,bg1 :foreground ,base))))
     `(cursor ((,class (:background ,cursor))))
     `(show-paren-match-face ((,class (:background ,suc))))
     `(secondary-selection ((,class (:background ,bg3))))
     `(isearch ((,class (:bold t :foreground ,bg1 :background ,inf))))
     `(success ((,class (:foreground ,suc))))
     `(warning ((,class (:foreground ,war ))))
     `(error ((,class (:foreground ,err))))
     `(lazy-highlight ((,class (:foreground ,bg1 :background ,inf :weight normal))))
     `(page-break-lines ((,class (:foreground ,active2))))

;;;;; anzu-mode
     `(anzu-mode-line ((,class (:foreground ,yellow :weight bold))))

;;;;; company
     `(company-echo-common ((,class (:background ,base :foreground ,bg1))))
     `(company-preview ((,class (:background ,bg1 :foreground ,key1))))
     `(company-preview-common ((,class (:background ,bg2 :foreground ,keyword))))
     `(company-preview-search ((,class (:background ,bg2 :foreground ,green))))
     `(company-scrollbar-bg ((,class (:background ,bg2))))
     `(company-scrollbar-fg ((,class (:background ,type))))
     `(company-template-field ((,class (:inherit region))))
     `(company-tooltip ((,class (:background ,active2 :foreground ,(if (eq variant 'dark) active1 str)))))
     `(company-tooltip-annotation ((,class (:background ,active2 :foreground ,inf))))
     `(company-tooltip-common ((,class (:background ,active2 :foreground ,base))))
     `(company-tooltip-common-selection ((,class (:foreground ,(if (eq variant 'dark) suc war)))))
     `(company-tooltip-mouse ((,class (:inherit highlight))))
     `(company-tooltip-search ((,class (:inherit match))))
     `(company-tooltip-selection ((,class (:background ,(if (eq variant 'dark) "#6b5d85" "#c8c6dd") :bold t))))

;;;;; diff
     `(diff-added             ((,class :background nil :foreground ,green)))
     `(diff-changed           ((,class :background nil :foreground ,inf)))
     `(diff-indicator-added   ((,class :background nil :foreground ,green)))
     `(diff-indicator-changed ((,class :background nil :foreground ,inf)))
     `(diff-indicator-removed ((,class :background nil :foreground ,red)))
     `(diff-refine-added      ((,class :background ,green :foreground ,bg4)))
     `(diff-refine-changed    ((,class :background ,inf :foreground ,bg4)))
     `(diff-refine-removed    ((,class :background ,red :foreground ,bg4)))
     `(diff-removed           ((,class :background nil :foreground ,red)))

;;;;; dired
     `(dired-directory ((,class (:foreground ,key1 :background ,bg1 :weight bold))))
     `(dired-flagged ((,class (:foreground ,red))))
     `(dired-header ((,class (:foreground ,type :weight bold))))
     `(dired-ignored ((,class (:inherit shadow))))
     `(dired-mark ((,class (:foreground ,type :weight bold))))
     `(dired-marked ((,class (:foreground ,violet :weight bold))))
     `(dired-perm-write ((,class (:foreground ,base :underline t))))
     `(dired-symlink ((,class (:foreground ,cyan :background ,bg1 :weight bold))))
     `(dired-warning ((,class (:foreground ,war))))

;;;;; ein
     `(ein:cell-input-area((,class (:background ,bg2))))
     `(ein:cell-input-prompt ((,class (:foreground ,(if (eq variant 'dark) suc green)))))
     `(ein:cell-output-prompt ((,class (:foreground ,err))))
     `(ein:notification-tab-normal ((,class (:foreground ,builtin))))
     `(ein:notification-tab-selected ((,class (:foreground ,(if (eq variant 'dark) suc green) :bold t))))

;;;;; eldoc
     `(eldoc-highlight-function-argument ((,class (:foreground ,(if (eq variant 'dark) suc red) :bold t))))

;;;;; erc
     `(erc-input-face ((,class (:foreground ,func))))
     `(erc-my-nick-face ((,class (:foreground ,key1))))
     `(erc-nick-default-face ((,class (:foreground ,inf))))
     `(erc-nick-prefix-face ((,class (:foreground ,yellow))))
     `(erc-notice-face ((,class (:foreground ,str))))
     `(erc-prompt-face ((,class (:foreground ,(if (eq variant 'dark) suc green) :bold t))))
     `(erc-timestamp-face ((,class (:foreground ,builtin))))

;;;;; eshell
     `(eshell-ls-archive ((,class (:foreground ,red :weight bold))))
     `(eshell-ls-backup ((,class (:inherit font-lock-comment-face))))
     `(eshell-ls-clutter ((,class (:inherit font-lock-comment-face))))
     `(eshell-ls-directory ((,class (:foreground ,inf :weight bold))))
     `(eshell-ls-executable ((,class (:foreground ,suc :weight bold))))
     `(eshell-ls-missing ((,class (:inherit font-lock-warning-face))))
     `(eshell-ls-product ((,class (:inherit font-lock-doc-face))))
     `(eshell-ls-special ((,class (:foreground ,yellow :weight bold))))
     `(eshell-ls-symlink ((,class (:foreground ,cyan :weight bold))))
     `(eshell-ls-unreadable ((,class (:foreground ,base))))
     `(eshell-prompt ((,class (:foreground ,keyword :weight bold))))

;;;;; flycheck
     `(flycheck-error
       ((,(append '((supports :underline (:style line))) class)
         (:underline (:style line :color ,err)))
        (,class (:foreground ,base :background ,err :weight bold :underline t))))
     `(flycheck-error-list-checker-name ((,class (:foreground ,keyword))))
     `(flycheck-fringe-error ((,class (:foreground ,err :weight bold))))
     `(flycheck-fringe-info ((,class (:foreground ,inf :weight bold))))
     `(flycheck-fringe-warning ((,class (:foreground ,war :weight bold))))
     `(flycheck-info
       ((,(append '((supports :underline (:style line))) class)
         (:underline (:style line :color ,inf)))
        (,class (:foreground ,base :background ,inf :weight bold :underline t))))
     `(flycheck-warning
       ((,(append '((supports :underline (:style line))) class)
         (:underline (:style line :color ,war)))
        (,class (:foreground ,base :background ,war :weight bold :underline t))))

;;;;; git-gutter-fr
     `(git-gutter-fr:added ((,class (:foreground ,green :weight bold))))
     `(git-gutter-fr:deleted ((,class (:foreground ,war :weight bold))))
     `(git-gutter-fr:modified ((,class (:foreground ,inf :weight bold))))

;;;;; gnus
     `(gnus-emphasis-highlight-words ((,class (:background (if (eq variant 'dark) err suc) :foreground (when (eq variant 'light) bg1)))))
     `(gnus-header-content ((,class (:foreground ,keyword))))
     `(gnus-header-from ((,class (:foreground ,var))))
     `(gnus-header-name ((,class (:foreground ,type))))
     `(gnus-header-subject ((,class (:foreground ,func :bold t))))
     `(gnus-summary-cancelled ((,class (:background ,(if (eq variant 'dark) err suc) :foreground ,bg1))))

;;;;; guide-key
     `(guide-key/highlight-command-face ((,class (:foreground ,base))))
     `(guide-key/key-face ((,class (:foreground ,key1))))
     `(guide-key/prefix-command-face ((,class (:foreground ,key2 :weight bold))))

;;;;; helm
     `(helm-bookmark-directory ((,class (:inherit helm-ff-directory))))
     `(helm-bookmark-file ((,class (:foreground ,base))))
     `(helm-bookmark-gnus ((,class (:foreground ,type))))
     `(helm-bookmark-info ((,class (:foreground ,type))))
     `(helm-bookmark-man ((,class (:foreground ,type))))
     `(helm-bookmark-w3m ((,class (:foreground ,type))))
     `(helm-buffer-directory ((,class (:foreground ,base :background ,bg1))))
     `(helm-buffer-file ((,class (:foreground ,base :background ,bg1))))
     `(helm-buffer-not-saved ((,class (:foreground ,type :background ,bg1))))
     `(helm-buffer-process ((,class (:foreground ,builtin :background ,bg1))))
     `(helm-buffer-saved-out ((,class (:foreground ,base :background ,bg1))))
     `(helm-buffer-size ((,class (:foreground ,base :background ,bg1))))
     `(helm-candidate-number ((,class (:background ,bg1 :foreground ,inf :bold t))))
     `(helm-ff-directory ((,class (:foreground ,key1 :background ,bg1 :weight bold))))
     `(helm-ff-dotted-directory ((,class (:foreground ,key1 :background ,bg1 :weight bold))))
     `(helm-ff-executable ((,class (:foreground ,suc :background ,bg1 :weight normal))))
     `(helm-ff-file ((,class (:foreground ,base :background ,bg1 :weight normal))))
     `(helm-ff-invalid-symlink ((,class (:foreground ,red :background ,bg1 :weight bold))))
     `(helm-ff-prefix ((,class (:foreground ,bg1 :background ,keyword :weight normal))))
     `(helm-ff-symlink ((,class (:foreground ,cyan :background ,bg1 :weight bold))))
     `(helm-grep-cmd-line ((,class (:foreground ,base :background ,bg1))))
     `(helm-grep-file ((,class (:foreground ,base :background ,bg1))))
     `(helm-grep-finish ((,class (:foreground ,base :background ,bg1))))
     `(helm-grep-lineno ((,class (:foreground ,base :background ,bg1))))
     `(helm-grep-match ((,class (:foreground nil :background nil :inherit helm-match))))
     `(helm-grep-running ((,class (:foreground ,func :background ,bg1))))
     `(helm-header ((,class (:foreground ,base :background ,bg1 :underline nil :box nil))))
     `(helm-match ((,class (:inherit match))))
     `(helm-match-item ((,class (:inherit match))))
     `(helm-moccur-buffer ((,class (:foreground ,func :background ,bg1))))
     `(helm-selection ((,class (:background ,highlight))))
     `(helm-selection-line ((,class (:background ,bg2))))
     `(helm-separator ((,class (:foreground ,type :background ,bg1))))
     `(helm-source-header ((,class (:background ,type :foreground ,bg1 :bold t))))
     `(helm-time-zone-current ((,class (:foreground ,builtin :background ,bg1))))
     `(helm-time-zone-home ((,class (:foreground ,type :background ,bg1))))
     `(helm-visible-mark ((,class (:foreground ,bg1 :background ,bg3))))

;;;;; helm-swoop
     `(helm-swoop-target-line-block-face ((,class (:foreground ,base :background ,highlight))))
     `(helm-swoop-target-line-face ((,class (:foreground ,base :background ,highlight))))
     `(helm-swoop-target-word-face ((,class (:foreground ,bg1 :background ,suc))))

;;;;; ido
     `(ido-first-match ((,class (:foreground ,type :bold t))))
     `(ido-only-match ((,class (:foreground ,(if (eq variant 'dark) suc red) :bold t))))
     `(ido-subdir ((,class (:foreground ,key1))))
     `(ido-vertical-match-face ((,class (:foreground ,type :underline nil))))

;;;;; info
     `(info-header-xref ((,class (:foreground ,func :underline t))))
     `(info-menu ((,class (:foreground ,suc))))
     `(info-node ((,class (:foreground ,func :bold t))))
     `(info-quoted-name ((,class (:foreground ,builtin))))
     `(info-reference-item ((,class (:background nil :underline t :bold t))))
     `(info-string ((,class (:foreground ,str))))
     `(info-title-1 ((,class (:height 1.4 :bold t))))
     `(info-title-2 ((,class (:height 1.3 :bold t))))
     `(info-title-3 ((,class (:height 1.3))))
     `(info-title-4 ((,class (:height 1.2))))

;;;;; linum-mode
     `(linum ((,class (:foreground ,str :background ,bg2))))

;;;;; magit
     `(magit-blame-culprit ((,class :background ,bg3 :foreground ,str)))
     `(magit-blame-header ((,class :background ,bg3 :foreground ,key1)))
     `(magit-blame-sha1 ((,class :background ,bg3 :foreground ,func)))
     `(magit-blame-subject ((,class :background ,bg3 :foreground ,base)))
     `(magit-blame-time ((,class :background ,bg3 :foreground ,key1)))
     `(magit-branch ((,class (:foreground ,const :weight bold))))
     `(magit-diff-context-highlight ((,class (:background ,bg3 :foreground ,base))))
     `(magit-diff-file-header ((,class (:background nil :foreground ,str))))
     `(magit-diff-hunk-header ((,class (:background nil :foreground ,builtin))))
     `(magit-hash ((,class (:foreground ,base))))
     `(magit-hunk-heading           ((,class (:background ,bg3))))
     `(magit-hunk-heading-highlight ((,class (:background ,bg3))))
     `(magit-item-highlight ((,class :background ,bg2)))
     `(magit-log-author ((,class (:foreground ,base))))
     `(magit-log-head-label-head ((,class (:background ,yellow :foreground ,bg1 :bold t))))
     `(magit-log-head-label-local ((,class (:background ,inf :foreground ,bg1 :bold t))))
     `(magit-log-head-label-remote ((,class (:background ,suc :foreground ,bg1 :bold t))))
     `(magit-log-head-label-tags ((,class (:background ,violet :foreground ,bg1 :bold t))))
     `(magit-log-head-label-wip ((,class (:background ,cyan :foreground ,bg1 :bold t))))
     `(magit-log-sha1 ((,class (:foreground ,str))))
     `(magit-process-ng ((,class (:foreground ,war :weight bold))))
     `(magit-process-ok ((,class (:foreground ,func :weight bold))))
     `(magit-section-heading        ((,class (:foreground ,keyword :weight bold))))
     `(magit-section-highlight      ((,class (:background ,bg2))))
     `(magit-section-title ((,class (:background ,bg1 :foreground ,builtin :weight bold))))

;;;;; mode-line
     `(mode-line ((,class (:foreground ,base :background ,active1))))
     `(mode-line-buffer-id ((,class (:bold t :foreground ,func))))
     `(mode-line-inactive ((,class (:foreground ,base :background ,bg1 :box (:color ,inactive :line-width 1)))))

;;;;; neotree
     `(neo-dir-link-face ((,class (:foreground ,inf :weight bold))))
     `(neo-expand-btn-face ((,class (:foreground ,base))))
     `(neo-file-link-face ((,class (:foreground ,base))))
     `(neo-root-dir-face ((,class (:foreground ,func :weight bold))))

;;;;; org
     `(org-agenda-clocking ((,class (:foreground ,type))))
     `(org-agenda-date ((,class (:foreground ,var :height 1.1))))
     `(org-agenda-date-today ((,class (:weight bold :foreground ,keyword :height 1.3))))
     `(org-agenda-date-weekend ((,class (:weight normal :foreground ,base))))
     `(org-agenda-done ((,class (:foreground ,(if (eq variant 'dark) suc green) :bold t))))
     `(org-agenda-structure ((,class (:weight bold :foreground ,type))))
     `(org-block ((,class (:foreground ,base))))
     `(org-clock-overlay ((,class (:foreground ,type))))
     `(org-code ((,class (:foreground ,cyan))))
     `(org-column ((,class (:background ,highlight))))
     `(org-column-title ((,class (:background ,highlight))))
     `(org-date ((,class (:underline t :foreground ,var) )))
     `(org-date-selected ((,class (:background ,func :foreground ,bg1) )))
     `(org-document-info-keyword ((,class (:foreground ,str))))
     `(org-document-title ((,class (:foreground ,func :weight bold :height ,(if spacemacs-theme-org-height 1.4 1.0) :underline t))))
     `(org-done ((,class (:foreground ,(if (eq variant 'dark) suc green) :bold t :underline t))))
     `(org-ellipsis ((,class (:foreground ,builtin))))
     `(org-footnote  ((,class (:underline t :foreground ,base))))
     `(org-hide ((,class (:foreground ,base))))
     `(org-level-1 ((,class (:bold t :foreground ,inf :height ,(if spacemacs-theme-org-height 1.3 1.0) :background ,org-h1-bg :overline t))))
     `(org-level-2 ((,class (:bold t :foreground ,str :height ,(if spacemacs-theme-org-height 1.2 1.0) :background ,org-h2-bg))))
     `(org-level-3 ((,class (:bold nil :foreground ,green :height ,(if spacemacs-theme-org-height 1.1 1.0) :background ,org-h3-bg))))
     `(org-level-4 ((,class (:bold nil :foreground ,yellow :background ,org-h4-bg))))
     `(org-level-5 ((,class (:bold nil :foreground ,inf))))
     `(org-level-6 ((,class (:bold nil :foreground ,str))))
     `(org-level-7 ((,class (:bold nil :foreground ,green))))
     `(org-level-8 ((,class (:bold nil :foreground ,yellow))))
     `(org-link ((,class (:underline t :foreground ,comment))))
     `(org-mode-line-clock-overrun ((,class (:foreground ,err))))
     `(org-priority ((,class (:foreground ,war :bold t))))
     `(org-quote ((,class (:inherit org-block :slant italic))))
     `(org-scheduled ((,class (:foreground ,type))))
     `(org-scheduled-today ((,class (:foreground ,func :weight bold :height 1.2))))
     `(org-sexp-date ((,class (:foreground ,base))))
     `(org-special-keyword ((,class (:foreground ,func))))
     `(org-table ((,class (:foreground ,base))))
     `(org-todo ((,class (:foreground ,war :bold t :underline t))))
     `(org-verbatim ((,class (:foreground ,base))))
     `(org-verse ((,class (:inherit org-block :slant italic))))
     `(org-warning ((,class (:foreground ,err))))

;;;;; powerline
     `(powerline-active1 ((,class (:background ,active2 :foreground ,base))))
     `(powerline-active2 ((,class (:background ,active2 :foreground ,base))))
     `(powerline-inactive1 ((,class (:background ,bg2 :foreground ,base))))
     `(powerline-inactive2 ((,class (:background ,bg2 :foreground ,base))))

;;;;; rainbow-delimiters
     `(rainbow-delimiters-depth-1-face ((,class :foreground ,inf)))
     `(rainbow-delimiters-depth-2-face ((,class :foreground ,func)))
     `(rainbow-delimiters-depth-3-face ((,class :foreground ,str)))
     `(rainbow-delimiters-depth-4-face ((,class :foreground ,green)))
     `(rainbow-delimiters-depth-5-face ((,class :foreground ,yellow)))
     `(rainbow-delimiters-depth-6-face ((,class :foreground ,inf)))
     `(rainbow-delimiters-depth-7-face ((,class :foreground ,func)))
     `(rainbow-delimiters-depth-8-face ((,class :foreground ,str)))
     `(rainbow-delimiters-unmatched-face ((,class :foreground ,war)))

;;;;; smartparens
     `(sp-pair-overlay-face ((,class (:background ,highlight :foreground nil))))
     `(sp-show-pair-match-face ((,class (:foreground ,(if (eq variant 'dark) suc red) :weight bold :underline t))))

;;;;; term
     `(term ((,class (:foreground ,base :background ,bg1))))
     `(term-color-black ((,class (:foreground ,bg4))))
     `(term-color-blue ((,class (:foreground ,inf))))
     `(term-color-cyan ((,class (:foreground ,cyan))))
     `(term-color-green ((,class (:foreground ,green))))
     `(term-color-magenta ((,class (:foreground ,builtin))))
     `(term-color-red ((,class (:foreground ,red))))
     `(term-color-white ((,class (:foreground ,base))))
     `(term-color-yellow ((,class (:foreground ,yellow))))

;;;;; other, need more work
     `(ac-completion-face ((,class (:underline t :foreground ,keyword))))
     `(ffap ((,class (:foreground ,base))))
     `(flx-highlight-face ((,class (:foreground ,type :underline nil))))
     `(font-latex-bold-face ((,class (:foreground ,type))))
     `(font-latex-italic-face ((,class (:foreground ,key2 :italic t))))
     `(font-latex-match-reference-keywords ((,class (:foreground ,const))))
     `(font-latex-match-variable-keywords ((,class (:foreground ,var))))
     `(font-latex-string-face ((,class (:foreground ,str))))
     `(icompletep-determined ((,class :foreground ,builtin)))
     `(js2-external-variable ((,class (:foreground ,type  ))))
     `(js2-function-param ((,class (:foreground ,const))))
     `(js2-jsdoc-html-tag-delimiter ((,class (:foreground ,str))))
     `(js2-jsdoc-html-tag-name ((,class (:foreground ,key1))))
     `(js2-jsdoc-value ((,class (:foreground ,str))))
     `(js2-private-function-call ((,class (:foreground ,const))))
     `(js2-private-member ((,class (:foreground ,base))))
     `(js3-error-face ((,class (:underline ,war))))
     `(js3-external-variable-face ((,class (:foreground ,var))))
     `(js3-function-param-face ((,class (:foreground ,key2))))
     `(js3-instance-member-face ((,class (:foreground ,const))))
     `(js3-jsdoc-tag-face ((,class (:foreground ,keyword))))
     `(js3-warning-face ((,class (:underline ,keyword))))
     `(mu4e-cited-1-face ((,class (:foreground ,base))))
     `(mu4e-cited-7-face ((,class (:foreground ,base))))
     `(mu4e-header-marks-face ((,class (:foreground ,type))))
     `(mu4e-view-url-number-face ((,class (:foreground ,type))))
     `(slime-repl-inputed-output-face ((,class (:foreground ,type))))
     `(trailing-whitespace ((,class :foreground nil :background ,err)))
     `(undo-tree-visualizer-current-face ((,class :foreground ,builtin)))
     `(undo-tree-visualizer-default-face ((,class :foreground ,base)))
     `(undo-tree-visualizer-register-face ((,class :foreground ,type)))
     `(undo-tree-visualizer-unmodified-face ((,class :foreground ,var)))
     `(web-mode-builtin-face ((,class (:inherit ,font-lock-builtin-face))))
     `(web-mode-comment-face ((,class (:inherit ,font-lock-comment-face))))
     `(web-mode-constant-face ((,class (:inherit ,font-lock-constant-face))))
     `(web-mode-doctype-face ((,class (:inherit ,font-lock-comment-face))))
     `(web-mode-function-name-face ((,class (:inherit ,font-lock-function-name-face))))
     `(web-mode-html-attr-name-face ((,class (:foreground ,func))))
     `(web-mode-html-attr-value-face ((,class (:foreground ,keyword))))
     `(web-mode-html-tag-face ((,class (:foreground ,builtin))))
     `(web-mode-keyword-face ((,class (:foreground ,keyword))))
     `(web-mode-string-face ((,class (:foreground ,str))))
     `(web-mode-type-face ((,class (:inherit ,font-lock-type-face))))
     `(web-mode-warning-face ((,class (:inherit ,font-lock-warning-face)))))))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'spacemacs-common)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; spacemacs-common.el ends here
