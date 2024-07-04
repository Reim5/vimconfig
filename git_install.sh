#!/usr/bin/sh

giturl=$1

if [ ! -d $HOME/.vim ]; then
  mkdir -p $HOME/.vim/pack/dist/start/
fi

packagename=`basename $giturl`
git clone $giturl $HOME/.vim/pack/dist/start/$packagename
