parse_svn_rev(){
    svn info 2> /dev/null | grep "Revision" | sed 's/Revision: \(.*\)/[r\1] /';
}

svndiff(){
    svn diff "${@}" | colordiff
}
