if [ $HOST_TYPE = "linux" ]; then
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi
fi

alias ..='cd ..'         # Go up 1 directory
alias ...='cd ../..'     # Go up 2 directories
alias ....='cd ../../..' # Go up 3 directories

alias l='ls -lah'        # Long view, show hidden
alias la='ls -AF'        # Compact view, show hidden
alias ll='ls -lFh'       # Long view, no hidden

alias ping='ping -c 5'
alias greprg='grep -r --exclude="\.git"'
alias pypath='python -c "import sys; print sys.path" | tr "," "\n" | grep -v "egg"'

if [ $HOST_TYPE = "mac" ]; then
    alias hiddenshow='defaults write com.apple.finder AppleShowAllFiles -bool true; KillAll Finder;'
    alias hiddenhide='defaults write com.apple.finder AppleShowAllFiles -bool false; KillAll Finder;'
fi

