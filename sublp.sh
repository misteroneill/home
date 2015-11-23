#!/usr/bin/env sh

PROJECT=`ls | grep \.sublime-project$`

if [ `which subl` ]; then
  subl --project $PROJECT
fi
