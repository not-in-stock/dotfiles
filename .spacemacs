;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun cider-repl-prompt-show-a (namespace)
  (concat (format-time-string "%d-%m-%y %H:%M:%S") " " namespace " >"))

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '((auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip t)
     (clojure :variables
              cider-enhanced-cljs-completion-p nil
              cider-font-lock-dynamically '(macro core function var)
              cider-overlays-use-font-lock t
              cider-pprint-fn 'fipp
              cider-prompt-for-symbol nil
              cider-repl-display-help-banner nil
              cider-repl-display-in-current-window t
              cider-repl-prompt-function 'cider-repl-prompt-show-a
              cider-repl-toggle-pretty-printing t
              cider-repl-use-pretty-printing t
              cljr--debug-mode t
              cljr-warn-on-eval nil
              clojure-enable-clj-refactor t
              clojure-enable-linters 'clj-kondo
              clojure-toplevel-inside-comment-form t
              nrepl-hide-special-buffers t
              nrepl-log-messages nil)
     (copy-as-format :variables copy-as-format-default "slack")
     evil-commentary
     docker
     emacs-lisp
     kotlin
     git
     helm
     html
     javascript
     markdown
     neotree
     org
     react
     restclient
     shell-scripts
     syntax-checking
     sql
     yaml)

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages
   '(dracula-theme
     flycheck-clj-kondo
     flycheck-joker
     lispyville
     kaocha-runner
     magit-todos
     doom-themes)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-nerd-commenter)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemac(custom-set-variables
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes
   '(dracula
     doom-dracula
     doom-one
     spacemacs
     spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator utf-8 :separator-scale 1)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro for Powerline"
                               :size 13
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative nil
                                         :disabled-for-modes dired-mode
                                         doc-view-mode
                                         markdown-mode
                                         org-mode
                                         pdf-view-mode
                                         text-mode
                                         :size-limit-kb 1000)

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   package-check-signature nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun notify-ast-cache-warm-up ()
  (shell-command "joker ~/workspace/notifications/event_notification.joke ast-cache"))

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; Fixing configuration issues
  ;;;; Make hook variable always safe; fixes risky local variable dialog
  (defvar cljr-after-warming-ast-cache-hook nil)
  (put 'cljr-after-warming-ast-cache-hook 'safe-local-variable
       (lambda (x) t))

  ;; Editor coloring
  (custom-set-faces
   ;;;; Customize line numbers
   '(linum ((t (:background "#282a36" :foreground "#565761" :slant normal))))
   '(flyspell-incorrect ((t (:underline "#ff5555"))))
   ;;;; Customize flycheck error undelines
   '(linum ((t (:background "#282a36" :foreground "#565761" :slant normal))))
   '(flycheck-error ((t (:underline "#ff5555"))))
   '(flycheck-info ((t (:underline "#50fa7b"))))
   '(flycheck-warning ((t (:underline "#ffb86c"))))
   '(flyspell-duplicate ((t (:underline "#ffb86c")))))

  ;;;; Project specific editor coloring

  (defface re-frame-sub
    '((t (:foreground "#ffb86c"))) "DrakulaOrange")

  (defface re-frame-evt
    '((t (:foreground "#ff5555"))) "DrakulaRed")

  (defface re-frame-name
    '((t (:foreground "#4684f4"))) "GoogleBlue")

  ;;;; Project specific parsing functions

  (defun word-after (word)
    (concat word " \\(([[:graph:]]+\\)"))

  (defun next-word (word)
    (concat word " \\([[:graph:]]+\\)"))

  (defun word-after-before-slash (word)
    (concat word " \\(([[:graph:]]+\\/\\)"))

  ;;;; Project specific font cusomizations

  (font-lock-add-keywords
   'clojurescript-mode `((,(next-word "defevent-fx") 1 're-frame-name t)
                         (,(next-word "defevent-db") 1 're-frame-name t)
                         (,(next-word "defsub") 1 're-frame-name t)
                         (,(next-word "defsub-raw") 1 're-frame-name t)
                         (,(word-after "<sub") 1 're-frame-name t)
                         (,(word-after-before-slash "<sub") 1 'font-lock-type-face t)
                         (,(word-after ">evt") 1 're-frame-name t)
                         (,(word-after-before-slash ">evt") 1 'font-lock-type-face t)
                         ("defsub" 0 're-frame-sub t)
                         ("defsub-raw" 0 're-frame-sub t)
                         ("<sub" 0 're-frame-sub t)
                         ("defevent-fx" 0 're-frame-evt t)
                         ("defevent-db" 0 're-frame-evt t)
                         (">evt" 0 're-frame-evt t)))

  ;; VSC cusomizations

  (require 'magit-todos nil t)

  (defun magit-todos-setup-jump-key ()
    "Add key binding to jump to todos section."
    (define-key magit-status-mode-map "gT" 'magit-todos-jump-to-todos))

  (defun magit-todos-disable-j ()
    "Disable 'jT' binding."
    (define-key magit-todos-section-map "j" nil))

  (defun magit-todos-setup ()
    (interactive)
    (add-hook 'magit-todos-mode-hook 'magit-todos-setup-jump-key)
    (add-hook 'magit-todos-mode-hook 'magit-todos-disable-j))

  (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hooks)

  (setq helm-split-window-inside-p t)


  ;; Fixing "C-k" not working with company-completion tooltips
  (add-hook
   'company-completion-started-hook
   (lambda (&rest ignore)
     (when evil-mode
       (when (evil-insert-state-p)
         (define-key evil-insert-state-map (kbd "C-k") nil)))))


  (spacemacs/toggle-mode-line-minor-modes-off)

  (spacemacs/set-leader-keys
    "ep" 'flycheck-previous-error
    "en" 'flycheck-next-error)

  (add-hook 'emacs-lisp-mode-hook #'lispyville-mode)

  (spacemacs/add-all-to-hook 'clojure-mode-hook
                             'turn-on-fci-mode
                             'golden-ratio-mode
                             'evil-cleverparens-mode
                             'flycheck-mode
                             'lispyville-mode)

  ;; Add lispyville remap for comments aware editing
  (add-hook 'clojure-mode-hook
            (lambda (&rest ignore)
              (when evil-mode
                (define-key clojure-mode-map [remap evil-commentary] 'lispyville-comment-or-uncomment))))

  ;; Project specific development setup functions
  (defun cider-project-reset ()
    (interactive)
    (cider-interactive-eval "(user/clj-reset!)"))

  (defun cider-default-connect ()
    (interactive)
    (let* ((host "localhost")
           (port (string-to-number (car (cdr (car (cider--infer-ports host nil)))))))
      (thread-first ()
        (plist-put :host host)
        (plist-put :port port)
        (cider-connect))))

  (defun cider-connect-remote ()
    (interactive)
    (let* ((host "localhost")
           (port "5555"))
      (thread-first ()
        (plist-put :host host)
        (plist-put :port port)
        (cider-connect))))

  (dolist (m '(clojure-mode))
    (spacemacs/set-leader-keys-for-major-mode m
      "j" 'cider-project-reset
      "el" 'cider-inspect-last-result
      "sj" 'cider-connect-sibling-cljs
      "sa" 'cider-default-connect
      "sA" 'cider-connect-remote
      "sC" 'cider-replicate-connection
      "kt" 'kaocha-runner-run-test-at-point
      "kr" 'kaocha-runner-run-tests
      "ka" 'kaocha-runner-run-all-tests
      "kw" 'kaocha-runner-show-warnings
      "kh" 'kaocha-runner-hide-windows))

  (dolist (m '(clojure-mode clojurescript-mode))
    (spacemacs/set-leader-keys-for-major-mode m
      "gk" 'cider-find-keyword
      "rsn" 'clojure-sort-ns))

  (setq-default
   clojure-indent-style :always-align
   evil-want-Y-yank-to-eol nil
   evil-cross-lines t
   fringe-mode nil
   magit-branch-read-upstream-first t
   magit-diff-refine-hunk (quote all)
   magit-log-section-commit-count 0
   neo-vc-integration (quote (face))
   neo-confirm-create-directory (quote off-p)
   neo-confirm-create-file (quote off-p)
   neo-theme (quote nerd)
   show-paren-style (quote expression))

  (with-eval-after-load 'clojure-mode
    (define-clojure-indent
      (facts 1))))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(package-selected-packages
     (quote
      (web-mode evil-nerd-commenter doom-modeline apropospriate-theme flycheck magit zenburn-theme zen-and-art-theme yasnippet-snippets yaml-mode ws-butler writeroom-mode winum white-sand-theme which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection sql-indent spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shrink-path seti-theme scss-mode sass-mode rjsx-mode reverse-theme restclient-helm restart-emacs rebecca-theme rainbow-delimiters railscasts-theme purple-haze-theme pug-mode professional-theme prettier-js popwin planet-theme phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el password-generator paradox overseer orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-restclient ob-http noctilux-theme neotree naquadah-theme nameless mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-svn magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode linum-relative link-hint light-soap-theme less-css-mode kaolin-themes json-navigator js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme insert-shebang inkpot-theme indent-guide impatient-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org-rifle helm-mode-manager helm-make helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-commit ghub gh-md gandalf-theme fuzzy font-lock+ flycheck-pos-tip flycheck-joker flycheck-bashate flx-ido flatui-theme flatland-theme fish-mode fill-column-indicator farmhouse-theme fancy-battery eziam-theme eyebrowse expand-region exotica-theme evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu espresso-theme emmet-mode elisp-slime-nav eldoc-eval editorconfig dumb-jump drupal-mode dracula-theme dotenv-mode doom-themes dockerfile-mode docker django-theme diminish define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme counsel-projectile copy-as-format company-web company-tern company-statistics company-shell company-restclient company-quickhelp company-php column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clojure-snippets clojure-cheatsheet clj-refactor clean-aindent-mode cider-eval-sexp-fu cherry-blossom-theme centered-cursor-mode busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-window ace-link ace-jump-helm-line ac-ispell)))
   '(safe-local-variable-values
     (quote
      ((cider-shadow-cljs-default-options . "app")
       (cljr-libspec-whitelist "^day8.re-frame.async-flow-fx" "^day8.re-frame.http-fx" "^honeysql-postgres.format")
       (cljr-libspec-whitelist "^cljs.core.specs.alpha" "^cljs-time.extend" "^cljs-time.instant" "^googlecloud.cloudstorage.storage" "^day8.re-frame.async-flow-fx" "^day8.re-frame.http-fx" "^transportal.events" "^transportal.interval" "^transportal.intro")
       (cider-shadow-default-options . ":app")
       (cider-default-cljs-repl . shadow)
       (helm-ag-use-agignore t)
       (cljr-after-warming-ast-cache-hook lambda
                                          (&rest ignore)
                                          (notify-ast-cache-warm-up)
                                          (interactive)
                                          (cider-interactive-eval "(cljs-server-start!)")
                                          (cider-interactive-eval "(clj-reset!)"))))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(flycheck-error ((t (:underline "#ff5555"))))
   '(flycheck-info ((t (:underline "#50fa7b"))))
   '(flycheck-warning ((t (:underline "#ffb86c"))))
   '(flyspell-duplicate ((t (:underline "#ffb86c"))))
   '(flyspell-incorrect ((t (:underline "#ff5555"))))
   '(linum ((t (:background "#282a36" :foreground "#565761" :slant normal)))))
  )
