uname_str=`uname`
case $uname_str in 
    Darwin)
        export HOST_TYPE='mac'
        ;;
    *)
        # Just assume Linux if not Mac...
        export HOST_TYPE='linux'
        ;;
esac

# Path/manpath
if [ $HOST_TYPE = "mac" ]; then
    PATH=/opt/local/sbin:$PATH
    PATH=/opt/local/bin:$PATH
    PATH=/opt/local/lib/mysql5/bin:$PATH
    PATH=/opt/local/apache2/bin:$PATH
    export PATH
    export MANPATH=/opt/local/share/man:$MANPATH
else
    export PATH=/var/lib/gems/1.8/bin:$PATH
fi

# Editors
export EDITOR='vim'
export SVN_EDITOR='vim'
export GIT_EDITOR='vim'

# Highlight search term, show line numbers, ignore binaries.
export GREP_OPTIONS="--color=auto -nI"

# For Python virtualenv/virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME

# List colors
if [ $HOST_TYPE = "mac" ]; then
    export LSCOLORS='Gxfxcxdxdxegedabagacad'
    export CLICOLOR=1
else
    export LS_COLORS="di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=32;38:tw=0;42:ow=0;43:"
fi
