#!/usr/bin/env sh

PROJECT=`ls | grep \.sublime-project$`

if [ `which subl` ]; then
  if [ "$PROJECT" ]; then
    subl --project $PROJECT
  else
    subl .
  fi
fi
