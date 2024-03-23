#!/bin/sh

# Use this script to build a pdf from a tex file.

[   -z "$1" ] && echo "need file path" && exit 1
[ ! -r "$1" ] && echo "Cant read $1"   && exit 1
filename=$(basename "$1")
name="${filename%.*}"
log="$name.log"

if ! echo ^Z | pdflatex "$1" >/dev/null; then
  printf 'Failed! See the log %s' "$log"
  exit 1
fi

rm -f "$name.aux"
rm -f "$log"
open "$name.pdf"

