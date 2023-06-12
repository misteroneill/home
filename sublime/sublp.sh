#!/usr/bin/env zsh

PROJECT=`ls | grep \.sublime-project$`

if [ `which subl` ]; then
  if [ "$PROJECT" ]; then
    subl --project $PROJECT
  else
    subl .
  fi
else
  echo "no subl command!"
  exit 1
fi
