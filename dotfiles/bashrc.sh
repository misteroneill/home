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
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
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

COLOR_BLACK="\[\033[0;30m\]"
COLOR_BOLD_BLACK="\[\033[1;30m\]"
COLOR_WHITE="\[\033[0;37m\]"
COLOR_BOLD_WHITE="\[\033[1;37m\]"
COLOR_BLUE="\[\033[0;34m\]"
COLOR_BOLD_BLUE="\[\033[1;34m\]"
COLOR_GREEN="\[\033[0;32m\]"
COLOR_BOLD_GREEN="\[\033[1;32m\]"
COLOR_CYAN="\[\033[0;36m\]"
COLOR_BOLD_CYAN="\[\033[1;36m\]"
COLOR_RED="\[\033[0;31m\]"
COLOR_BOLD_RED="\[\033[1;31m\]"
COLOR_PURPLE="\[\033[0;35m\]"
COLOR_BOLD_PURPLE="\[\033[1;35m\]"
COLOR_BROWN="\[\033[0;33m\]"
COLOR_BOLD_BROWN="\[\033[1;33m\]"
COLOR_DEFAULT="\[\033[00m\]"

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
