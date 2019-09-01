autoload -Uz compinit promptinit

export EDITOR='emacsclient -c'

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history

source ~/dotfiles/.functions
export SCREENSHOT_DIRECTORY=$HOME/.screenshots
PATH=$PATH:$HOME/.bin:$HOME/dotfiles/.bin/

compinit
promptinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey -v
bindkey '^R' history-incremental-search-backward
# But still use emacs-style zsh bindings
bindkey -e

#alias sudo='sudo -E'
alias syu='sudo pacman -Syu'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
source ~/.private_shell_scripts/*.sh
