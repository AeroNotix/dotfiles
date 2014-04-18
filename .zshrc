ZSH=$HOME/.oh-my-zsh

CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=13
DISABLE_CORRECTION="true"

source $ZSH/oh-my-zsh.sh
#source /usr/share/zsh/site-contrib/powerline.zsh

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/home/xeno/dev/go/bin
export PATH=$PATH:/home/xeno/.go/bin
export GOPATH=/home/xeno/dev/go
export GOROOT=/home/xeno/.go
export PATH=/home/xeno/.gem/ruby/2.1.0/bin:$PATH
export LEIN_SNAPSHOTS_IN_RELEASE=1
export PATH=$PATH:/opt/android-sdk/tools/:/opt/android-sdk/platform-tools/

plugins=(git github gnu-utils python ssh-agent rebar virtualenv lein systemd)

HISTSIZE=1000000
SAVEHIST=1000000

unsetopt hist_verify
unsetopt correctall
unsetopt auto_menu

WORDCHARS='-'
alias erl='rlwrap erl'
function syu {
    sudo pacman -Syu --ignore erlang
}

function rekon {
   curl -s -L rekon.basho.com | sh
}

function cwd2paths {
    export PYTHONPATH=$PYTHONPATH:$(pwd)
}
EDITOR="emacsclient -c"
VISUAL="emacsclient -c"
[ $TERM = 'dumb' ] && PS1='$ '

export PYTHONSTARTUP=~/.pystartup
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
