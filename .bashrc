. ~/.bash/variables.sh
if [ -f ~/.bash/variables_local.sh ]; then
    . ~/.bash/variables_local.sh
fi

. ~/.bash/aliases.sh
if [ -f ~/.bash/aliases_local.sh ]; then
    . ~/.bash/aliases_local.sh
fi

. ~/.bash/functions.sh
if [ -f ~/.bash/functions_local.sh ]; then
    . ~/.bash/functions_local.sh
fi

. ~/.bash/prompt.sh
if [ -f ~/.bash/prompt_local.sh ]; then
    . ~/.bash/prompt_local.sh
fi

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    . /usr/local/bin/virtualenvwrapper.sh
fi
