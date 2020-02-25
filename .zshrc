autoload -Uz compinit promptinit
export LANG=en_GB.UTF-8

export EDITOR='emacsclient -c'

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history
export CROSS_COMPILE=$HOME/Downloads/gcc-linaro-7.3.1-2018.05-i686_aarch64-linux-gnu/bin/aarch64-linux-gnu-

source ~/dotfiles/.functions
export SCREENSHOT_DIRECTORY=$HOME
export PATH=$PATH:$HOME/.bin:$HOME/dotfiles/.bin/
export PATH=$PATH:$HOME/.krew/bin
export GOROOT=$(go env GOROOT)

compinit
promptinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "^[Oc" forward-word
bindkey "^[Od" backward-word
bindkey '^R' history-incremental-search-backward
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
# But still use emacs-style zsh bindings
bindkey -e

bindkey "^Xc" copy-region

#alias sudo='sudo -E'
alias syu='sudo pacman -Syu'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
source ~/.private_shell_scripts/*.sh
source ~/.private_shell_scripts/*.inc

PROMPT="%# "
