;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
                                        ;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
                                        ;(package! another-package
                                        ;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
                                        ;(package! this-package
                                        ;  :recipe (:host github :repo "username/repo"
                                        ;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
                                        ;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
                                        ;(package! builtin-package :recipe (:nonrecursive t))
                                        ;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
                                        ;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
                                        ;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
                                        ;(unpin! pinned-package)
;; ...or multiple packages
                                        ;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
                                        ;(unpin! t)

(package! homebrew-mode)
(package! wakatime-mode)
(package! nyan-mode)
(package! ob-mermaid
  :recipe (:host github :repo "arnm/ob-mermaid"))
(package! code-review :recipe (:files ("graphql" "code-review*.el"))
  :pin "26f426e99221a1f9356aabf874513e9105b68140")
                                        ; HACK closql c3b34a6 breaks code-review wandersoncferreira/code-review#245,
                                        ; and the current forge commit (but forge does have an upstream fix),
                                        ; pinned as a temporary measure to prevent user breakages
(package! closql :pin "0a7226331ff1f96142199915c0ac7940bac4afdd")
(package! org-ai)
(package! org-modern)
(package! copilot
  :recipe (:host github :repo "zerolfx/copilot.el" :files ("*.el" "dist")))
(package! todoist)

(package! lsp-ltex :pin "18b0e8608408f9e913d89075e78c2b4e3f69cf1c")
;; Optional dependency of lsp-ltex, needed for installing/updating ltex-ls LSP server
(package! github-tags
  :recipe (:host github
           :repo "jcs-elpa/github-tags")
  :pin "7b02d6e883ac3d766106de30c60b22609c4515f9")

(package! catppuccin-theme)
