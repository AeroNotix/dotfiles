autoload -Uz compinit promptinit zmv

compinit
promptinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

setopt hist_ignore_all_dups
setopt hist_find_no_dups

export LANG=en_GB.UTF-8
export EDITOR='emacsclient -c'
export SCREENSHOT_DIRECTORY=$HOME
export PATH=$PATH:$HOME/.bin:$HOME/dotfiles/.bin/
export PATH=$PATH:$HOME/.krew/bin
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
export CROSS_COMPILE=$HOME/dev/gcc-linaro-7.3.1-2018.05-i686_aarch64-linux-gnu/bin/aarch64-linux-gnu-

alias syu='sudo pacman -Syu'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

PROMPT="%# "
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history

if [ -f ~/dotfiles/.functions ]; then
    source ~/dotfiles/.functions
fi

if command -v go > /dev/null 2>&1 ; then
    export GOROOT=$(go env GOROOT)
fi

# If we need to have anything private in our shell.
if [ -d ~/.private_shell_scripts ]; then
    source ~/.private_shell_scripts/*.sh
    source ~/.private_shell_scripts/*.inc
fi

bindkey "^Xc" copy-region
bindkey "^[3;5~" delete-char
bindkey "^[Oc" forward-word
bindkey "^[Od" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
bindkey '^R' history-incremental-search-backward
bindkey -e

load-tfswitch() {
  local tfswitchrc_path=".terraform-version"

  if [ -f "$tfswitchrc_path" ]; then
    sudo tfswitch
  fi
}

add-zsh-hook chpwd load-tfswitch
