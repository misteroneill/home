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

if [ $HOST_TYPE = "mac" ]; then
    PATH=/usr/local/mysql/bin:$PATH
    PATH=/usr/local/node/bin:$PATH
    export PATH
    export NODE_PATH=/usr/local/node:/usr/local/node/lib/node_modules:/opt/node:/opt/node/lib/node_modules
else
    export PATH=/var/lib/gems/1.8/bin:$PATH
fi

# Editors
export EDITOR='vim'
export SVN_EDITOR='vim'
export GIT_EDITOR='vim'

# Highlight search term, ignore binaries.
export GREP_OPTIONS="--color=auto -I"

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
