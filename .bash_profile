PATH=/opt/local/sbin:$PATH
PATH=/opt/local/bin:$PATH
PATH=/opt/local/lib/mysql5/bin:$PATH
PATH=/opt/local/apache2/bin:$PATH
PATH=$HOME/local/bin:$PATH
PATH=$HOME/local/node/bin:$PATH
export PATH

export MANPATH=/opt/local/share/man:$MANPATH

export EDITOR='mate -w'
export SVN_EDITOR='mate -w'
export GIT_EDITOR='mate -wl1'

export ANT_LIB='/opt/local/share/java/apache-ant/lib/'

# OS/Apps
# =======
alias ..='cd ..'     # Go up one directory
alias ...='cd ../..' # Go up two directories

alias l='ls -lah'    # Long view, show hidden
alias la='ls -AF'    # Compact view, show hidden
alias ll='ls -lFh'   # Long view, no hidden

alias ping='ping -c 5'
alias grep='grep --colour=auto'

# Show/hide hidden files in Finder
alias hiddenshow='defaults write com.apple.finder AppleShowAllFiles -bool true; KillAll Finder;'
alias hiddenhide='defaults write com.apple.finder AppleShowAllFiles -bool false; KillAll Finder;'

alias chchchchanges='rm ~/Library/Application\ Support/Changes/.cacheSettings2'

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Prompt and Colors
# =================

BLACK="\[\033[0;30m\]"
BOLD_BLACK="\[\033[1;30m\]"
WHITE="\[\033[0;37m\]"
BOLD_WHITE="\[\033[1;37m\]"
BLUE="\[\033[0;34m\]"
BOLD_BLUE="\[\033[1;34m\]"
GREEN="\[\033[0;32m\]"
BOLD_GREEN="\[\033[1;32m\]"
CYAN="\[\033[0;36m\]"
BOLD_CYAN="\[\033[1;36m\]"
RED="\[\033[0;31m\]"
BOLD_RED="\[\033[1;31m\]"
PURPLE="\[\033[0;35m\]"
BOLD_PURPLE="\[\033[1;35m\]"
BROWN="\[\033[0;33m\]"
BOLD_BROWN="\[\033[1;33m\]"
DEFAULT_COLOR="\[\033[00m\]"

# Prompt format and colors.
export PS1="$BROWN\t $GREEN\u@\h $PURPLE\w $CYAN\$(parse_git_branch) $DEFAULT_COLOR$ "

# File and directory highlighting.
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
