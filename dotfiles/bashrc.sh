source_if_exists() {
  if [ -e $1 ]; then
    source $1
  fi
}

if [ $(uname) = "Darwin" ]; then
  IS_MAC=true
fi

# Editors
export EDITOR="vim"
export GIT_EDITOR="vim"

# On a Mac, we want Homebrew to be the boss.
if [ $IS_MAC ]; then
  export PATH="/usr/local/bin:$PATH"
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
  export MANPATH="/usr/local/opt/grep/libexec/gnuman:$MANPATH"
fi

# Include Yarn.
export PATH="$HOME/.yarn/bin:$PATH"

# List colors
export LS_COLORS="di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=32;38:tw=0;42:ow=0;43:"

# Highlight search term, ignore binaries and .git directories.
alias grep="grep --color=auto -I --exclude='\.git'"
alias fgrep="fgrep --color=auto -I --exclude='\.git'"
alias egrep="egrep --color=auto -I --exclude='\.git'"

alias ls="ls --color=auto"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

alias ping="ping -c 5"

# Bash Completion
# ===============

source_if_exists "/etc/bash_completion"
source_if_exists "/usr/share/bash-completion/bash_completion"
source_if_exists "/usr/local/etc/bash_completion.d/git-completion.bash"
source_if_exists "/usr/local/etc/bash_completion.d/git-prompt.sh"

# Node
# ====

export NVM_DIR="$HOME/.nvm"
source_if_exists "$NVM_DIR/nvm.sh"

find-up(){
    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done
    echo "$path"
}

cdnvm(){
    cd "$@";
    nvm_path=$(find-up .nvmrc | tr -d '[:space:]')

    # If there are no .nvmrc file, use the default nvm version
    if [[ ! $nvm_path = *[^[:space:]]* ]]; then

        declare default_version;
        default_version=$(nvm version default);

        # If there is no default version, set it to `node`
        # This will use the latest version on your machine
        if [[ $default_version == "N/A" ]]; then
            nvm alias default node;
            default_version=$(nvm version default);
        fi

        # If the current version is not the default version, set it to use the default version
        if [[ $(nvm current) != "$default_version" ]]; then
            nvm use default;
        fi

        elif [[ -s $nvm_path/.nvmrc && -r $nvm_path/.nvmrc ]]; then
        declare nvm_version
        nvm_version=$(<"$nvm_path"/.nvmrc)

        declare locally_resolved_nvm_version
        # `nvm ls` will check all locally-available versions
        # If there are multiple matching versions, take the latest one
        # Remove the `->` and `*` characters and spaces
        # `locally_resolved_nvm_version` will be `N/A` if no local versions are found
        locally_resolved_nvm_version=$(nvm ls --no-colors "$nvm_version" | tail -1 | tr -d '\->*' | tr -d '[:space:]')

        # If it is not already installed, install it
        # `nvm install` will implicitly use the newly-installed version
        if [[ "$locally_resolved_nvm_version" == "N/A" ]]; then
            nvm install "$nvm_version";
        elif [[ $(nvm current) != "$locally_resolved_nvm_version" ]]; then
            nvm use "$nvm_version";
        fi
    fi
}

alias cd='cdnvm'

# Python
# ======

export WORKON_HOME="$HOME/.virtualenvs"
export PIP_VIRTUALENV_BASE="$WORKON_HOME"

pip_completion() {
  COMPREPLY=($(COMP_WORDS="${COMP_WORDS[*]}" \
               COMP_CWORD=$COMP_CWORD \
               PIP_AUTO_COMPLETE=1 $1))
}

complete -o default -F pip_completion pip

source_if_exists "/usr/local/bin/virtualenvwrapper.sh"

alias pypath="python -c 'import sys; print sys.path' | tr ',' '\n' | grep -v 'egg'"

# Prompt
# ======

export COLOR_BLACK="\[\033[0;30m\]"
export COLOR_BOLD_BLACK="\[\033[1;30m\]"
export COLOR_WHITE="\[\033[0;37m\]"
export COLOR_BOLD_WHITE="\[\033[1;37m\]"
export COLOR_BLUE="\[\033[0;34m\]"
export COLOR_BOLD_BLUE="\[\033[1;34m\]"
export COLOR_GREEN="\[\033[0;32m\]"
export COLOR_BOLD_GREEN="\[\033[1;32m\]"
export COLOR_CYAN="\[\033[0;36m\]"
export COLOR_BOLD_CYAN="\[\033[1;36m\]"
export COLOR_RED="\[\033[0;31m\]"
export COLOR_BOLD_RED="\[\033[1;31m\]"
export COLOR_PURPLE="\[\033[0;35m\]"
export COLOR_BOLD_PURPLE="\[\033[1;35m\]"
export COLOR_BROWN="\[\033[0;33m\]"
export COLOR_BOLD_BROWN="\[\033[1;33m\]"
export COLOR_DEFAULT="\[\033[00m\]"

GIT_PS1_SHOWDIRTYSTATE=true

if [ "`type -t __git_ps1`" != 'function' ]; then
  PS1="$COLOR_PURPLE\W $COLOR_DEFAULT\n$ "
else
  PS1="$COLOR_PURPLE\W$COLOR_CYAN\$(__git_ps1) $COLOR_DEFAULT\n$ "
fi

export PS1

# Local Customization
# ===================

source_if_exists "${HOME}/.bashrc-local"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
