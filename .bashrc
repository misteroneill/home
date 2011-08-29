. ~/.bash/variables.sh
. ~/.bash/aliases.sh
. ~/.bash/functions.sh
. ~/.bash/prompt.sh
if [ -f ~/.bash/local.sh ]; then
    . ~/.bash/local.sh
fi
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    . /usr/local/bin/virtualenvwrapper.sh
fi
