parse_git_branch(){
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /';
}

parse_svn_rev(){
    svn info 2> /dev/null | grep "Revision" | sed 's/Revision: \(.*\)/[r\1] /';
}

svndiff(){
    svn diff "${@}" | colordiff
}

sublproj(){
    subl --project ~/Dropbox/Sublime\ Projects/"${@}".sublime-project
}
