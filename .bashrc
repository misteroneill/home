source ~/.bash/variables.sh
if [ -f ~/.bash/variables_local.sh ]; then
    source ~/.bash/variables_local.sh
fi

source ~/.bash/aliases.sh
if [ -f ~/.bash/aliases_local.sh ]; then
    source ~/.bash/aliases_local.sh
fi

source ~/.bash/functions.sh
if [ -f ~/.bash/functions_local.sh ]; then
    source ~/.bash/functions_local.sh
fi

source ~/.bash/prompt.sh
if [ -f ~/.bash/prompt_local.sh ]; then
    source ~/.bash/prompt_local.sh
fi

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi
