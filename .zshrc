ZSH=$HOME/.oh-my-zsh

alias erl='rlwrap erl'
alias yaks='cd ~/dev/ubic/'
alias k='kubectl'

ignored_configs=(grep)
source $ZSH/oh-my-zsh.sh
plugins=(aws nosetests)


autoload -U compinit
compinit

autoload -U bashcompinit
bashcompinit

_nosetests()
{
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=(`nosecomplete ${cur} 2>/dev/null`)
}
complete -o nospace -F _nosetests nosetests

export CAML_LD_LIBRARY_PATH="/home/xeno/.opam/system/lib/stublibs:/usr/lib/ocaml/stublibs"
export EDITOR="emacsclient -c"
export GOPATH=/home/xeno/dev/go
export LEIN_SNAPSHOTS_IN_RELEASE=1
export MANPATH="/home/xeno/.opam/system/man:"
export OCAML_TOPLEVEL_PATH="/home/xeno/.opam/system/lib/toplevel"
export PATH=$PATH:"/home/xeno/.opam/system/bin"
export PATH=$PATH:$HOME/.bin/
export PATH=$PATH:/home/xeno/dev/go/bin
export PATH=$PATH:/opt/android-sdk/tools/:/opt/android-sdk/platform-tools/
export PATH=$PATH:/usr/lib/erlang/lib/lfe-0.8/bin
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/home/xeno/dev/go/bin:/usr/share/riemann/bin
export PATH=$PATH:/home/xeno/.gem/ruby/2.1.0/bin
export PATH=$PATH:$CLOJURESCRIPT_HOME/bin
export PATH=$PATH:/home/xeno/.cargo/bin
export PATH=~/.local/bin:$PATH
export PATH=$PATH:/home/xeno/.gem/ruby/2.2.0/bin
export PERL5LIB="/home/xeno/.opam/system/lib/perl5"
export PYTHONSTARTUP=~/.pystartup
export VISUAL=$EDITOR

export PYTHONPATH=$PYTHONPATH:/home/xeno/dev/

HISTSIZE=100000000
SAVEHIST=100000000
HISTFILE=~/.zsh_history

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt nohashdirs

unsetopt hist_verify
unsetopt correctall
unsetopt auto_menu

[ $TERM = 'dumb' ] && PS1='$ '

source ~/.dotfiles/functions

# OPAM configuration
. /home/xeno/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# ps1
setopt prompt_subst
PROMPT='$(collapse_pwd) '
function precmd() {
    echo "-------------"
}

bindkey -e
bindkey '^H' backward-delete-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

if [ -f ~/.dircolors ]; then
    eval `dircolors ~/.dircolors`
fi
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2

# added by travis gem
[ -f /home/xeno/.travis/travis.sh ] && source /home/xeno/.travis/travis.sh
