#!/usr/bin/env bash
echo $* >> /tmp/thingie
if [ "$1" != "./prep_plan/app.py" ]; then
  exit 0
fi

grep elided $1
exit $?
