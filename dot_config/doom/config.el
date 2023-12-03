;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Henrique Dalssaso"
      user-mail-address "henrique@dalssaso.com.br")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "Iosevka Term" :size 17 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Iosevka" :size 17 :weight 'regular)
      doom-symbol-font (font-spec :family "MesloLGS Nerd Font Mono" :size 17 :weight 'regular)
      doom-big-font (font-spec :family "Iosevka Term" :size 22 :weight 'regular))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord-aurora)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")


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
;; Forge stuff
;;
(setq forge-alist
      '(("git.ifoodcorp.com.br" "code.ifoodcorp.com.br/api/v4" "code.ifoodcorp.com.br" forge-gitlab-repository)
        ("github.com" "api.github.com" "github.com" forge-github-repository)
        ("gitlab.com" "gitlab.com/api/v4" "gitlab.com" forge-gitlab-repository))
      )

(setq auth-sources '(macos-keychain-generic macos-keychain-internet "/Users/dalssaso/.config/emacs/.local/state/authinfo.gpg" "~/.authinfo.gpg" "~/.authinfo-work.gpg"))



(setq projectile-project-search-path '("~/src/work/" "~/src/personal/" "~/.local/share/chezmoi"))
(setq lsp-yaml-format-enable 'nil)

;; Modes and start stuff
(global-wakatime-mode)

(setq nyan-animate-nyancat t)
(setq nyan-wavy-trail t)
(nyan-mode)
;;
(setq ob-mermaid-cli-path "/Users/dalssaso/.asdf/shims/mmdc")
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(require 'org-crypt)
(require 'epa-file)
(custom-set-variables
 '(epg-gpg-program "/opt/homebrew/opt/gnupg@2.2/bin/gpg")
 )
(epa-file-enable)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key nil)

;; (dolist (mode '(org-mode-hook
;;                 term-mode-hook
;;                 shell-mode-hook
;;                 treemacs-mode-hook
;;                 eshell-mode-hook))
;;   (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; (defun cfg/org-font-setup ()
;;   ;; Set faces for heading levels
;;   (dolist (face '((org-level-1 . 1.15)
;;                   (org-level-2 . 1.1)
;;                   (org-level-3 . 1.05)
;;                   (org-level-4 . 1.0)
;;                   (org-level-5 . 1.0)
;;                   (org-level-6 . 1.0)
;;                   (org-level-7 . 1.0)
;;                   (org-level-8 . 1.0)))
;;     ;; (set-face-attribute (car face) nil doom-variable-pitch-font))
;;     (set-face-attribute (car face) nil :font "Overpass" :weight 'regular :height (cdr face)))

;;   ;; Ensure that anything that should be fixed-pitch in Org files appears that way
;;   (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
;;   (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
;;   (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
;;   (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
;;   (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
;;   (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
;;   (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
;;   (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
;;   (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
;;   (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
;;   (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))

;; (defun cfg/org-mode-setup ()
;;   (org-indent-mode)
;;   (variable-pitch-mode 1)
;;   (visual-line-mode 1))

;; (use-package! org
;;   :hook (org-mode . cfg/org-mode-setup)
;;   :config
;;   (setq org-ellipsis " ▾")
;;   (cfg/org-font-setup))

;; (setq rfc-mode-directory (expand-file-name "~/.local/share/rfcs/"))

;; Fix bash configuration
(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell (executable-find "fish"))
(setq-default explicit-shell-file-name (executable-find "fish"))

;; configuring flyspell
(after! flyspell
  (setq flyspell-lazy-idle-seconds 2))

(defun +markdown-flyspell-word-p ()
  "Return t if point is on a word that should be spell checked.
Return nil if on a link url, markup, html, or references."
  (let ((faces (ensure-list (get-text-property (point) 'face))))
    (or (and (memq 'font-lock-comment-face faces)
             (memq 'markdown-code-face faces))
        (not (cl-loop with unsafe-faces = '(markdown-reference-face
                                            markdown-url-face
                                            markdown-markup-face
                                            markdown-comment-face
                                            markdown-html-attr-name-face
                                            markdown-html-attr-value-face
                                            markdown-html-tag-name-face
                                            markdown-code-face)
                      for face in faces
                      if (memq face unsafe-faces)
                      return t)))))

(let ((langs '("en_GB" "pt_BR")))
  (setq lang-ring (make-ring (length langs)))
  (dolist (elem langs) (ring-insert lang-ring elem)))

(defun cycle-ispell-languages ()
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)))

(map! :leader :desc "Change spell language" :n "t d" #'cycle-ispell-languages)

(use-package! org-ai
  :commands (org-ai-mode
             org-ai-global-mode)
  :init
  (add-hook 'org-mode-hook #'org-ai-mode) ; enable org-ai in org-mode
  (org-ai-global-mode) ; installs global keybindings on C-c M-a
  :config
  (setq org-ai-default-chat-model "gpt-3.5-turbo") ; if you are on the gpt-4 beta:
  (org-ai-install-yasnippets)) ; if you are using yasnippet and want `ai` snippets

(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

(use-package! lsp-ltex
  :commands (+lsp-ltex-toggle
             +lsp-ltex-enable
             +lsp-ltex-disable
             +lsp-ltex-setup)
  :hook ((latex-mode LaTeX-mode org-mode markdown-mode) . #'+lsp-ltex-setup)
  :init
  ;; There is some problematic modes when it comes to enabling LSP
  (defvar +lsp-ltex-disabled-modes '(org-msg-edit-mode))
  :config
  ;; Add doom-docs-mode to LSP language IDs
  (add-to-list 'lsp-language-id-configuration '(doom-docs-org-mode . "org"))
  :init
  (setq lsp-ltex-check-frequency "edit"
        lsp-ltex-log-level "warning" ;; No need to log everything
        lsp-ltex-diagnostic-severity "warning"
        ;; Path in which, interactively added words and rules will be stored.
        lsp-ltex-user-rules-path (expand-file-name "lsp-ltex" doom-data-dir))

  ;; When n-gram data sets are available, use them to detect errors with words
  ;; that are often confused (like their and there).
  (when (file-directory-p "/usr/share/ngrams")
    (setq lsp-ltex-additional-rules-language-model "/usr/share/ngrams"))

  (defun +lsp-ltex-setup ()
    "Load LTeX LSP server."
    (interactive)
    (require 'lsp-ltex)
    (when (and (+lsp-ltex--enabled-p)
               (not (memq major-mode +lsp-ltex-disabled-modes)))
      (lsp-deferred)))

  (defun +lsp-ltex--enabled-p ()
    (not (memq 'ltex-ls lsp-disabled-clients)))

  (defun +lsp-ltex-enable ()
    "Enable LTeX LSP for the current buffer."
    (interactive)
    (unless (+lsp-ltex--enabled-p)
      (setq-local lsp-disabled-clients (delq 'ltex-ls lsp-disabled-clients))
      (message "Enabled ltex-ls"))
    (+lsp-ltex-setup))

  (defun +lsp-ltex-disable ()
    "Disable LTeX LSP for the current buffer."
    (interactive)
    (when (+lsp-ltex--enabled-p)
      (setq-local lsp-disabled-clients (cons 'ltex-ls lsp-disabled-clients))
      (lsp-disconnect)
      (message "Disabled ltex-ls")))

  (defun +lsp-ltex-toggle ()
    "Toggle LTeX LSP for the current buffer."
    (interactive)
    (if (+lsp-ltex--enabled-p)
        (+lsp-ltex-disable)
      (+lsp-ltex-enable)))

  (map! :localleader
        :map (text-mode-map latex-mode-map LaTeX-mode-map org-mode-map markdown-mode-map)
        :desc "Toggle grammar check" "G" #'+lsp-ltex-toggle))

(setq lsp-ltex-language "en" ;; Set your default (most used) language
      lsp-ltex-mother-tongue "pt-BR"
      lsp-ltex-dictionary '(":~/.config/doom/ltex-dictionary.txt"))
