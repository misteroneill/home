case `uname` in
    Darwin)
        export HOST_TYPE='mac'
		;;
    *)
        export HOST_TYPE='linux'
		;;
esac

# Editors
export EDITOR='vim'
export GIT_EDITOR='vim'

# Highlight search term, ignore binaries.
export GREP_OPTIONS="--color=auto -I"

# For Python virtualenv/virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"
export PIP_VIRTUALENV_BASE="$WORKON_HOME"

# List colors
if [ $HOST_TYPE = "mac" ]; then
    export LSCOLORS='Gxfxcxdxdxegedabagacad'
    export CLICOLOR=1
else
    export LS_COLORS="di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=32;38:tw=0;42:ow=0;43:"
fi

# Colors
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
