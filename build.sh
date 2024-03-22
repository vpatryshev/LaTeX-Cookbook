#!/bin/sh

# Use this script to build a pdf from a tex file.

[   -z $1 ] && echo "need file path" && exit 1
[ ! -r $1 ] && echo "Cant read $1"   && exit 1
filename=`basename $1`
name="${filename%.*}"
echo ^Z | pdflatex $1 >/dev/null && open $name.pdf || echo "Failed!\npdflatex $1" && cat $name.log && exit 1
rm -f $name.aux; rm -f $name.log
