#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.bashcolours

EDITOR="emacsclient -c"
GIT_EDITOR="emacsclient -c"

alias ls='ls --color=auto'
alias sudo='sudo -E'
alias g++11='g++ -std=c++11'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias syu='sudo pacman -Syu'
alias make='make -j2'

export PATH=$PATH:/home/xeno/dev/:/usr/lib/go/site/bin
export PYTHONPATH=/home/xeno/dev/
export PYTHONSTARTUP=$HOME/.pythonstartup.py
export GOPATH=/home/xeno/dev/go/

function cwd2path {
	export PYTHONPATH=$PYTHONPATH:$(pwd)
	export PATH=$PATH:$(pwd)
	export GOPATH=$GOPATH:$(pwd)
}

__git_ps1 ()
{
	local b="$(git symbolic-ref HEAD 2>/dev/null)";
	if [ -n "$b" ]; then
		printf " (%s)" "${b##refs/heads/}";
	fi
}

export PS1=$IPurple[$IWhite$Time12h$IPurple]$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
	# @4 - Clean repository - nothing to commit
	echo "'$Green'" ✔$(__git_ps1 " (%s)"); \
  else \
	# @5 - Changes to working tree
	echo "'$IRed'" ✘$(__git_ps1 " {%s}"); \
  fi) '$BIYellow$PathShort$Color_Off'\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '$IWhite$PathShort$Color_Off'\$ "; \
fi)'

remove_orphans() {
    if [[ ! -n $(pacman -Qdt) ]]; then
        echo "No orphans to remove."
    else
        sudo pacman -Rs $(pacman -Qdtq)
    fi
}

function create_managepy_function() {
    FCN="function $1 { python2 manage.py $1; }"
    eval "$FCN"
}

function parse_managepy_commands() {
    NAMES=$(python2 manage.py | grep '^[[:space:]]\{4\}[A-Za-z]')
    for line in $NAMES; do create_managepy_function $line; done;
}

open_weechat() {
    ssh xeno@37.139.18.183 -t tmux attach -t weechat
}
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
