# OS/Apps
# =======
alias ..='cd ..'     # Go up one directory
alias ...='cd ../..' # Go up two directories

alias l='ls -lah'    # Long view, show hidden
alias la='ls -AF'    # Compact view, show hidden
alias ll='ls -lFh'   # Long view, no hidden

alias ping='ping -c 5'
alias grepgit='grep -r --exclude-dir="\.git"'
alias grepsvn='grep -r --exclude-dir="\.svn"'

alias sgi='sudo gem install'
alias aps='aptitude search'
alias api='sudo aptitude install'

# Python/Django
alias pypath='python -c "import sys; print sys.path" | tr "," "\n" | grep -v "egg"'

# Mac OS X
alias hiddenshow='defaults write com.apple.finder AppleShowAllFiles -bool true; KillAll Finder;'
alias hiddenhide='defaults write com.apple.finder AppleShowAllFiles -bool false; KillAll Finder;'
alias changes='rm ~/Library/Application\ Support/Changes/.cacheSettings2'
