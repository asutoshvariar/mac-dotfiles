
# Export color variables (both old and new LSCOLORS)
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxgedabagacad
export LS_COLORS=ExFxBxDxCxgedabagacad
export EXA_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# Custom prompt (Output)
PS1=" %B%(?.%F{156}.%F{160})%~%f%b %B%F{122}%(!.#.%%)%f%b "

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Colored tab completion
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

# Options for history-based completion
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

# History-based completion arrow keys
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Aliases
alias ls="exa --icons --git"
alias la="exa --icons --git -a"
alias vim="nvim"
alias cat="bat"
alias top="btm"
alias htop="btm"
alias neofetch="macchina -t Theme"
# Fast syntax highlighting for ZSH
source ~/.fsh/fast-syntax-highlighting.plugin.zsh

# Random variables
export CHROME_EXECUTABLE=/Applications/Chromium.app/Contents/MacOS/Chromium
export HOMEBREW_NO_AUTO_UPDATE=1
