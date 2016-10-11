#!/usr/bin/env bash

SRC_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd ${SRC_DIR}

link_unless_exists(){
  if [ ! -e ${HOME}/${2} ]; then
    echo "Linking $2..."
    ln -sf ${SRC_DIR}/dotfiles/${1} ${HOME}/${2}
  fi
}

git_global_config(){
  git config --global "${1}" "${2}"
}

git_global_config "branch.autosetuprebase" "always"
git_global_config "branch.autosetupmerge"  "false"
git_global_config "color.diff"             "auto"
git_global_config "color.status"           "auto"
git_global_config "color.branch"           "auto"
git_global_config "color.interactive"      "auto"
git_global_config "color.ui"               "true"
git_global_config "color.pager"            "true"
git_global_config "core.excludesfile"      "~/.gitignore"
git_global_config "core.whitespace"        "trailing-space,space-before-tab"
git_global_config "credential.helper"      "osxkeychain"
git_global_config "fetch.prune"            "true"
git_global_config "push.default"           "upstream"
git_global_config "user.name"              "Pat O'Neill"
git_global_config "user.email"             "pgoneill@gmail.com"

link_unless_exists "bash_profile.sh"  ".bash_profile"
link_unless_exists "bashrc.sh"        ".bashrc"
link_unless_exists "global.gitignore" ".gitignore"
link_unless_exists "vimrc.vim"        ".vimrc"
