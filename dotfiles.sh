#!/usr/bin/env zsh

SRC_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

link_unless_exists(){
  if [ ! -e ${HOME}/${2} ]; then
    echo "Linking $2..."
    ln -sf ${SRC_DIR}/dotfiles/${1} ${HOME}/${2}
  else
    echo "NOT linking $2 because it exists."
  fi
}

git_global_config(){
  git config --global "${1}" "${2}"
}

# Set up git configurations. This is done thru commands because the
# ~/.gitconfig file changes occasionally with third-party tools.
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

# link user directory configuration (dotfiles)
link_unless_exists "global.gitignore" ".gitignore"
link_unless_exists "vimrc.vim"        ".vimrc"
