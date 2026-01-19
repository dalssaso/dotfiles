# Doom Emacs Navigation Improvements

## Overview

Productivity improvements focused on navigation, context-switching, and search/discovery in Doom Emacs. Approach A (quick wins) is implemented first, with B/C ideas documented for future enhancement.

## Pain Points Addressed

- **Navigation** - finding files, jumping between buffers, switching projects
- **Context switching** - moving between coding and notes disrupts flow
- **Search/discovery** - finding things in code or notes takes too long

## Implementation: Quick Wins (Approach A)

### 1. Buffer & Symbol Navigation

```elisp
;; Buffer preview in vertico
(after! vertico
  (setq vertico-preselect 'prompt))

(use-package! consult
  :config
  (consult-customize
   consult-buffer :preview-key "M-."))

;; Improve imenu for code files
(after! imenu
  (setq imenu-max-item-length 100)
  (setq imenu-auto-rescan t))

;; Project-wide symbol jump
(map! :leader
      :desc "Imenu (all buffers)" "s I" #'consult-imenu-multi)
```

### 2. Project & Workspace Navigation

```elisp
(after! persp-mode
  ;; Name workspaces after project
  (setq +workspaces-on-switch-project-behavior t)

  ;; Start with org workspace on launch
  (add-hook 'doom-init-ui-hook
            (lambda ()
              (+workspace-switch "org" t)
              (org-roam-dailies-goto-today))))

;; Toggle between org workspace and previous buffer
(defvar hd/last-non-org-buffer nil
  "Buffer to return to from org workspace.")

(defun hd/toggle-org-workspace ()
  "Toggle between org workspace and previous buffer."
  (interactive)
  (if (string= (+workspace-current-name) "org")
      (when hd/last-non-org-buffer
        (switch-to-buffer hd/last-non-org-buffer))
    (setq hd/last-non-org-buffer (current-buffer))
    (+workspace-switch "org" t)
    (org-roam-dailies-goto-today)))

(map! :leader
      :desc "Toggle org workspace" "TAB o" #'hd/toggle-org-workspace)

;; Recent project shortcut
(map! :leader
      :desc "Recent projects" "p r" #'projectile-switch-open-project)
```

### 3. Search & Discovery

```elisp
;; Consult ripgrep with live preview
(after! consult
  (consult-customize
   consult-ripgrep :preview-key "M-."
   consult-grep :preview-key "M-."))

;; Search org-roam notes
(defun hd/search-org-roam ()
  "Search org-roam directory with ripgrep."
  (interactive)
  (consult-ripgrep org-roam-directory))

(defun hd/search-org-personal ()
  "Search entire org-personal directory."
  (interactive)
  (consult-ripgrep hd/org-personal-dir))

(map! :leader
      (:prefix ("r" . "roam")
       :desc "Search roam" "s" #'hd/search-org-roam
       :desc "Search all org" "S" #'hd/search-org-personal))

;; Jump to heading in any org file
(defun hd/org-heading-search ()
  "Search headings across all org-roam files."
  (interactive)
  (let ((org-agenda-files (directory-files-recursively
                           org-roam-directory "\\.org$")))
    (consult-org-heading)))

(map! :leader
      :desc "Search org headings" "r h" #'hd/org-heading-search)
```

### 4. Within-File Navigation

```elisp
;; Better imenu for org-mode
(after! org
  (setq org-imenu-depth 6))

;; Outline navigation for code
(map! :leader
      :desc "Jump to outline" "s o" #'consult-outline)

;; Org-specific folding
(map! :after org
      :map org-mode-map
      :n "zo" #'org-show-subtree
      :n "zc" #'org-hide-subtree
      :n "zO" #'org-show-all
      :n "zC" #'org-hide-body)

;; Goto line with preview
(map! :leader
      :desc "Goto line" "g l" #'consult-goto-line)
```

## Future Enhancements

### Approach B: Workflow Overhaul

1. **avy** - Visual jumping anywhere with 2-3 keystrokes
2. **ace-window** - Number-based window switching (3+ splits)
3. **persistent-scratch** - Per-project notes that persist
4. **org-project linking** - Bidirectional links between org tasks and code

### Approach C: Heavy Tooling

1. **consult-lsp** - Jump to LSP symbols project-wide
2. **embark** - Learn `SPC a` actions on anything at point
3. **org-ql** - Structured queries for org files
4. **dumb-jump** - Fallback jump-to-definition when LSP fails
5. **dogears** - Automatic bookmark trail for navigation history
6. **consult-dir** - Quick directory switching in find-file prompts

## Key Bindings Summary

| Binding | Action |
|---------|--------|
| `SPC TAB o` | Toggle org workspace |
| `SPC s I` | Imenu (all buffers) |
| `SPC s o` | Jump to outline |
| `SPC g l` | Goto line with preview |
| `SPC p r` | Recent/open projects |
| `SPC r s` | Search roam |
| `SPC r S` | Search all org |
| `SPC r h` | Search org headings |
| `M-.` | Preview in consult searches |
