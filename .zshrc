autoload -Uz compinit promptinit zmv edit-command-line

compinit
promptinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_ignore_space

export LANG=en_GB.UTF-8
export EDITOR='emacsclient -c'
export SCREENSHOT_DIRECTORY=$HOME
export PATH=$PATH:$HOME/.bin:$HOME/dotfiles/.bin/
export PATH=$PATH:$HOME/.krew/bin
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.config/tfswitch
export PATH=$PATH:$HOME/.cache/rebar3/bin/
export PATH=$PATH:$HOME/.cargo/bin/
export CLOUDSDK_PYTHON=python

alias syu='sudo pacman -Syu'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tfswitch="tfswitch -b $HOME/.config/tfswitch/terraform"
alias 'terraform init'='rm -rf .terraform && terraform init'

PROMPT='%(?.%(!.#.;).%F{6}%B;%b%f) '
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history
DEFAULT_ERLANG_VERSION=23.2

if [ -f ~/.dotfiles/.functions ]; then
    source ~/.dotfiles/.functions
fi

if command -v go > /dev/null 2>&1 ; then
    export GOROOT=$(go env GOROOT)
fi

# If we need to have anything private in our shell.
if [ -d ~/.private_shell_scripts ]; then
    source ~/.private_shell_scripts/*.sh
    source ~/.private_shell_scripts/*.inc
fi

EXPECTED_TF_PLUGIN_CACHE="$HOME/storage/terraform-plugin-cache"
if [ -d "${EXPECTED_TF_PLUGIN_CACHE}" ]; then
    export TF_PLUGIN_CACHE_DIR="${EXPECTED_TF_PLUGIN_CACHE}"
else
    export TF_PLUGIN_CACHE_DIR="$HOME/.terraform./plugin-cache"
fi

zle -N edit-command-line
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
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
bindkey -e

setup-env-from-directory() {
    local tfswitchrc_path=".terraform-version"
    local nodejs_version_path=".node-version"
    local erlang_version_path=".erlang-version"

    if [ -f "$nodejs_version_path" ]; then
      echo "Switched nodejs to version: \"$(cat .node-version)\""
    fi

    if [ -f "$tfswitchrc_path" ]; then
      tfswitch
    fi

    if [ -f "$erlang_version_path" ]; then
      echo "Activating Erlang: $(cat "$erlang_version_path")"
      . "${HOME}/.kerl/installs/$(cat "$erlang_version_path")/activate"
    fi
}

add-zsh-hook chpwd setup-env-from-directory

# opam configuration
test -r /home/xeno/.opam/opam-init/init.zsh && \
    . /home/xeno/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

. "${HOME}/.kerl/installs/${DEFAULT_ERLANG_VERSION}/activate"
