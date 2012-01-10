parse_git_branch(){
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /';
}

parse_svn_rev(){
    svn info 2> /dev/null | grep "Revision" | sed 's/Revision: \(.*\)/[r\1] /';
}

svn-diff(){
    svn diff "${@}" | colordiff
}

subl-proj(){
    subl --project ~/Documents/"${@}".sublime-project
}