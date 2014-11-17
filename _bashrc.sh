# Sources a file if it exists.
source_if_exists() {
  if [ -f $1 ]
  then
    source $1
  fi
}

# Loads a partial component of the bash configuration.
load_partial() {
  source_if_exists ~/.bash/${1}.sh
  source_if_exists ~/.bash/${1}_local.sh
}

load_partial 'variables'
load_partial 'aliases'

# Source bash/git completion.
if [ -f /etc/bash_completion ]
then
  source /etc/bash_completion
else
  source_if_exists /usr/local/etc/bash_completion.d/git-completion.bash
  source_if_exists /usr/local/etc/bash_completion.d/git-prompt.sh
  source_if_exists /usr/local/etc/bash_completion.d/git-flow-completion.bash
fi

load_partial 'prompt'
source_if_exists /usr/local/bin/virtualenvwrapper.sh