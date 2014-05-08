ZSH=$HOME/.oh-my-zsh

CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=13
DISABLE_CORRECTION="true"

source $ZSH/oh-my-zsh.sh
#source /usr/share/zsh/site-contrib/powerline.zsh

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/home/xeno/dev/go/bin
export PATH=$PATH:/home/xeno/.go/bin
export GOPATH=$GOROOT:/home/xeno/dev/go
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

# OPAM configuration
. /home/xeno/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

CAML_LD_LIBRARY_PATH="/home/xeno/.opam/system/lib/stublibs:/usr/lib/ocaml/stublibs"; export CAML_LD_LIBRARY_PATH;
PERL5LIB="/home/xeno/.opam/system/lib/perl5"; export PERL5LIB;
OCAML_TOPLEVEL_PATH="/home/xeno/.opam/system/lib/toplevel"; export OCAML_TOPLEVEL_PATH;
MANPATH="/home/xeno/.opam/system/man:"; export MANPATH;
PATH=$PATH:"/home/xeno/.opam/system/bin:/home/xeno/.gem/ruby/2.1.0/bin:/home/xeno/.gem/ruby/2.1.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/build-tools/19.0.3/:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/usr/share/java/gradle/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/home/xeno/dev/go/bin:/home/xeno/.go/bin:/opt/android-sdk/tools/:/opt/android-sdk/platform-tools/:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/home/xeno/dev/go/bin:/home/xeno/.go/bin:/opt/android-sdk/tools/:/opt/android-sdk/platform-tools/"; export PATH;
source ~/dev/golang-crosscompile/crosscompile.bash
