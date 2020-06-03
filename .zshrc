autoload -Uz compinit promptinit zmv
export LANG=en_GB.UTF-8

export EDITOR='emacsclient -c'

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history
HIST_IGNORE_ALL_DUPS=true
HIST_FIND_NO_DUPS=true
export CROSS_COMPILE=$HOME/Downloads/gcc-linaro-7.3.1-2018.05-i686_aarch64-linux-gnu/bin/aarch64-linux-gnu-

source ~/dotfiles/.functions
export SCREENSHOT_DIRECTORY=$HOME
export PATH=$PATH:$HOME/.bin:$HOME/dotfiles/.bin/
export PATH=$PATH:$HOME/.krew/bin
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
export GOROOT=$(go env GOROOT)

compinit
promptinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

bindkey "^[3;5~" delete-char
bindkey "^[Oc" forward-word
bindkey "^[Od" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
bindkey '^R' history-incremental-search-backward
# But still use emacs-style zsh bindings
bindkey -e

bindkey "^Xc" copy-region

#alias sudo='sudo -E'
alias syu='sudo pacman -Syu'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# If we need to have anything private in our shell.
if [ -d ~/.private_shell_scripts ]; then
    source ~/.private_shell_scripts/*.sh
    source ~/.private_shell_scripts/*.inc
fi

PROMPT="%# "


load-tfswitch() {
  local tfswitchrc_path=".terraform-version"

  if [ -f "$tfswitchrc_path" ]; then
    sudo tfswitch
  fi
}

add-zsh-hook chpwd load-tfswitch
load-tfswitch
