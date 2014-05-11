alias erl='rlwrap erl'
alias ls='ls --color=auto'

export EDITOR="emacsclient -c"
export VISUAL="emacsclient -c"
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/home/xeno/dev/go/bin
export PATH=$PATH:/home/xeno/dev/go/bin
export GOPATH=/home/xeno/dev/go
export PATH=/home/xeno/.gem/ruby/2.1.0/bin:$PATH
export LEIN_SNAPSHOTS_IN_RELEASE=1
export PATH=$PATH:/opt/android-sdk/tools/:/opt/android-sdk/platform-tools/
export CAML_LD_LIBRARY_PATH="/home/xeno/.opam/system/lib/stublibs:/usr/lib/ocaml/stublibs"
export PERL5LIB="/home/xeno/.opam/system/lib/perl5"
export OCAML_TOPLEVEL_PATH="/home/xeno/.opam/system/lib/toplevel"
export MANPATH="/home/xeno/.opam/system/man:"
export PATH=$PATH:"/home/xeno/.opam/system/bin"
export PYTHONSTARTUP=~/.pystartup

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

unsetopt hist_verify
unsetopt correctall
unsetopt auto_menu

[ $TERM = 'dumb' ] && PS1='$ '

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dev/golang-crosscompile/crosscompile.bash
source ~/.dotfiles/functions

# OPAM configuration
. /home/xeno/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
PROMPT='$ '
