#!/usr/bin/sh
# Use this script to install packages

# Input packagelist is a text file that contains the packages or colors
packagelist=`cat $1`

# Prepare vim runtime directory -- $HOME/.vim
if [ ! -d $HOME/.vim ]; then
  mkdir -p $HOME/.vim/pack/dist/start/
fi

if [ $option -eq 0 ];
then
  for url in $packagelist
  do
    packagename=`basename $url`
    git clone $url $HOME/.vim/pack/dist/start/$packagename
  done
fi
