;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

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
   dotspacemacs-enable-lazy-installation 'nil

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation nil

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(;; languages
     (clojure :variables
              ;; cider-enhanced-cljs-completion-p nil
              ;; cider-font-lock-dynamically '(macro core function var)
              clojure-enable-kaocha-runner t          ;; enable Kaocha test runner
              clojure-enable-clj-refactor t
              clojure-toplevel-inside-comment-form t  ;; evaluate expressions in comment as top level

              cider-overlays-use-font-lock t
              cider-repl-display-help-banner nil      ;; disable help banner
              cider-pprint-fn 'puget                  ;; 'fipp ;; pretty printing with sorted keys / set values
              ;; cider-prompt-for-symbol nil
              ;; cider-repl-display-in-current-window t
              cider-repl-use-pretty-printing t
              cider-repl-toggle-pretty-printing t
              cider-repl-buffer-size-limit 200        ;; limit lines shown in REPL buffer

              ;; cljr--debug-mode t
              ;; cljr-warn-on-eval nil

              nrepl-hide-special-buffers t
              nrepl-log-messages nil)
     emacs-lisp
     javascript
     typescript
     sql
     ;; Markup & Configs
     html
     markdown
     yaml
     ;; Orchestration
     docker
     ;; VCS
     git
     (lsp :variables
          ;; symbol highlighting - `lsp-toggle-symbol-highlight` toggles highlighting
          lsp-enable-symbol-highlighting t

          ;; Show lint error indicator in the mode line
          lsp-modeline-diagnostics-enable t
          ;; lsp-modeline-diagnostics-scope :workspace

          ;; popup documentation boxes
          ;; lsp-ui-doc-enable nil          ;; disable all doc popups
          lsp-ui-doc-show-with-cursor nil   ;; doc popup for cursor
          ;; lsp-ui-doc-show-with-mouse t   ;; doc popup for mouse
          ;; lsp-ui-doc-delay 2                ;; delay in seconds for popup to display
          lsp-ui-doc-include-signature t    ;; include function signature
          ;; lsp-ui-doc-position 'at-point  ;; top bottom at-point
          lsp-ui-doc-alignment 'window      ;; frame window

          ;; code actions and diagnostics text as right-hand side of buffer
          lsp-ui-sideline-enable nil
          lsp-ui-sideline-show-code-actions nil
          ;; lsp-ui-sideline-delay 500

          lsp-enable-indentation nil

          ;; lsp-ui-sideline-show-diagnostics nil
          lsp-headerline-breadcrumb-icons-enable nil
          ;; reference count for functions (assume their maybe other lenses in future)
          lsp-lens-enable t
          ;; Optimization for large files
          lsp-file-watch-threshold 10000
          lsp-log-io nil)

     ;; Project Tree
     (treemacs :variables
               ;; Efficient use of space in treemacs-lsp display
               treemacs-space-between-root-nodes nil
               treemacs-use-scope-type 'Perspectives
               treemacs-use-git-mode 'deferred
               treemacs-no-png-images t
               treemacs-window-background-color (cons (face-attribute 'vertical-border :background)
                                                      (face-attribute 'default :background))
               left-fringe-width 9
               right-fringe-width 0
               cursor-type nil
               evil-treemacs-state-cursor nil
               treemacs-show-cursor nil)
     (nixos :variables
            nix-backend 'lsp
            nixos-format-on-save t)
     helm
     auto-completion
     syntax-checking
     evil-commentary)


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(dracula-theme
                                      rainbow-mode
                                      solaire-mode
                                      doom-themes
                                      lispyville
                                      magit-todos
                                      all-the-icons
                                      (hug-sql-mode :location (recipe
                                                               :fetcher github
                                                               :repo "not-in-stock/hug-sql-mode"))
                                      (zoom :location (recipe
                                                       :fetcher github
                                                       :repo "not-in-stock/zoom"))
                                      svg
                                      xml
                                      cl-lib
                                      color
                                      svg-lib
                                      svg-tag-mode
                                      dts-mode)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-nerd-commenter
                                    golden-ratio
                                    treemacs-icons-dired
                                    evil-lion)

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

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

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

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

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

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

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
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-dracula
                         dracula
                         doom-one
                         rebecca)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(doom)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("SauceCodePro Nerd Font"
                               :size 13.0
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

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

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

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

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative
                               nil
                               :disabled-for-modes
                               dired-mode
                               doc-view-mode
                               pdf-view-mode
                               org-mode
                               doc-view-mode
                               :size-limit-kb 1000)
   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
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
   dotspacemacs-search-tools '( "rg" "ag" "pt" "ack" "grep")

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
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

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
  (customize-set-variable
   'custom-file (file-truename (concat dotspacemacs-directory "~/workspace/dotfiles/custom.el")) "Separate custom file")
  (load custom-file))


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; ============ Emacs Macport trnaslucent background  ============
  ;; (set-face-background 'default "mac:windowBackgroundColor")
  ;; (set-face-stipple 'default "alpha:25%")

  ;; (set-frame-parameter nil 'alpha-background 80) ; For current frame
  ;; (add-to-list 'default-frame-alist '(alpha-background . 80)) ; For all new frames henceforth


  (set-face-background 'vertical-border (face-attribute 'hl-line :background))
  (set-face-foreground 'vertical-border (face-background 'vertical-border))
  (set-face-underline 'mode-line (face-attribute 'hl-line :background))
  (set-face-underline 'mode-line-inactive (face-attribute 'hl-line :background))

  (setq peach-color "#ff5555")
  (setq mint-green-color "#50fa7b")
  (setq brick-orange-color "#ffb86c")

  (custom-set-faces
   ;;;; Customize line numbers

   `(flyspell-incorrect ((t (:underline ,peach-color))))
   ;;;; Customize flycheck error undelines
   `(flycheck-error ((t (:underline ,peach-color))))
   `(flycheck-info ((t (:underline ,mint-green-color))))
   `(flycheck-warning ((t (:underline ,brick-orange-color))))
   `(flyspell-duplicate ((t (:underline ,brick-orange-color))))
   ;;; lsp headline
   `(lsp-headerline-breadcrumb-path-error-face ((t (:underline (:style line :color ,peach-color)
                                                               :inherit lsp-headerline-breadcrumb-path-face))))
   `(lsp-headerline-breadcrumb-path-hint-face ((t (:underline (:style line :color ,mint-green-color)
                                                              :inherit lsp-headerline-breadcrumb-path-face))))
   `(lsp-headerline-breadcrumb-path-info-face ((t (:underline (:style line :color ,mint-green-color)
                                                              :inherit lsp-headerline-breadcrumb-path-face))))
   `(lsp-headerline-breadcrumb-path-warning-face ((t (:underline (:style line :color ,brick-orange-color)
                                                                 :inherit lsp-headerline-breadcrumb-path-face))))
   `(lsp-headerline-breadcrumb-symbols-error-face ((t (:underline (:style line :color ,peach-color)
                                                                  :inherit lsp-headerline-breadcrumb-symbols-face))))
   `(lsp-headerline-breadcrumb-symbols-hint-face ((t (:underline (:style line :color ,mint-green-color)
                                                                 :inherit lsp-headerline-breadcrumb-symbols-face))))
   `(lsp-headerline-breadcrumb-symbols-info-face ((t (:underline (:style line :color ,mint-green-color)
                                                                 :inherit lsp-headerline-breadcrumb-symbols-face))))
   `(lsp-headerline-breadcrumb-symbols-warning-face ((t (:underline (:style line :color ,brick-orange-color)
                                                                    :inherit lsp-headerline-breadcrumb-symbols-face))))

   `(show-paren-match-expression ((t (:weight medium))))
   `(treemacs-directory-face ((t (:foreground ,(face-attribute 'font-lock-constant-face :foreground)))))
   `(treemacs-root-face ((t (:foreground "white" :height 1.15 :weight medium)))))


  (defun word-after (word)
    (concat word " \\(([[:graph:]]+\\)"))

  (defun next-word (word)
    (concat word " \\([[:graph:]]+\\)"))

  (defun word-after-before-slash (word)
    (concat word " \\(([[:graph:]]+\\/\\)"))

  (require 'hug-sql-mode)

  (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hooks)

  (spacemacs/set-leader-keys
    "ep" 'flycheck-previous-error
    "en" 'flycheck-next-error)


  ;; ============ Set Mac Modifiers ============

  (setq mac-command-modifier 'super
        ns-command-modifier 'super
        mac-option-modifier 'meta
        ns-option-modifier 'meta
        mac-right-option-modifier 'none
        ns-right-option-modifier 'none)

  ;; ============ Clojure ============

  ;; ------------ Clojure Specific faces ------------

  (defface re-frame-sub
    `((t (:foreground ,brick-orange-color))) "DrakulaOrange")

  (defface re-frame-evt
    `((t (:foreground ,peach-color))) "DrakulaRed")

  (defface re-frame-name
    '((t (:foreground "#4684f4"))) "GoogleBlue")

  (defface super-comment
    '((t (:background "#4684f4"))) "GoogleBlueBG")

  ;; ------------ Clojure Specific Fontlocks ------------

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

  ;; ------------ Cider additions ------------

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


  ;; ============ DTS mode ============
  ;; required for working with ZMK keymaps

  (add-to-list 'auto-mode-alist '("\\.keymap\\'" . dts-mode))

  ;; ============ Lispyville ============

  (spacemacs/add-all-to-hook 'emacs-lisp-mode-hook
                             'evil-cleverparens-mode
                             'lispyville-mode)

  (spacemacs/add-all-to-hook 'clojure-mode-hook
                             'zoom-mode
                             'evil-cleverparens-mode
                             'lispyville-mode)

  (add-hook 'clojure-mode-hook
            (lambda (&rest ignore)
              (when evil-mode
                (define-key clojure-mode-map [remap evil-commentary]
                            'lispyville-comment-or-uncomment))))

  ;; ============ Zoom ============

  (require 'zoom)

  (with-eval-after-load 'zoom
    (setq zoom-size '(0.6 . 0.6)
          zoom-ignored-major-modes '(treemacs-mode)
          zoom-ignored-buffer-name-regexps '("/Treemacs/")
          zoom-minibuffer-preserve-layout t)
    (spacemacs/set-leader-keys "tg" 'zoom-mode))

  ;; ============ Treemacs ============

  (require 'treemacs)
  (require 'treemacs-themes)

  (treemacs-modify-theme "Default"
    :icon-directory "/other/icons/dir"
    :config
    (progn
      (treemacs-create-icon :icon "▸ " :extensions (dir-closed) :fallback "▸ ")
      (treemacs-create-icon :icon "▾ " :extensions (dir-open) :fallback "▾ ")))

  (treemacs-hide-gitignored-files-mode t)

  ;; ============ Evil ============

  (setq-default evil-want-Y-yank-to-eol nil
                evil-cross-lines t
                show-paren-style 'expression)

  (define-key evil-motion-state-map "gl" 'evil-end-of-line)
  (define-key evil-motion-state-map "gh" 'evil-first-non-blank)

  ;; ============ Helm ============

  (setq-default helm-ag-use-agignore t)

  ;; ============ Magit ============

  (setq-default magit-branch-read-upstream-first t
                magit-diff-refine-hunk 'all
                magit-log-section-commit-count 0)


  (with-eval-after-load 'clojure-mode
    (define-clojure-indent
     (facts 1))))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization.")
