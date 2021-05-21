# antigen file OSX or Ubuntu package; Ubutu distriubtion updated with `curl`
source /usr/share/zsh-antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load the theme
antigen theme romkatv/powerlevel10k
## Customize theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# OSX
antigen bundle osx

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle compleat
antigen bundle zsh-users/zsh-history-substring-search

# Developer tools
## VCS
antigen bundle git
## Build tools
antigen bundle lein
antigen bundle npm
## Deployment
antigen bundle heroku
antigen bundle kubectl

# NVM bundle
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm
antigen bundle Sparragus/zsh-auto-nvm-use

# Syntax highlighting bundle.
antigen bundle zdharma/fast-syntax-highlighting

# Setup zsh-autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

# Tell Antigen that you're done.
antigen apply
