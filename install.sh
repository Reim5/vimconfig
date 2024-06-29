#!/usr/bin/sh

giturl=$1
packagename=`echo $giturl | awk ++NF FS='.+/' OFS=`

if [ ! -d $HOME/.vim ]; then
  mkdir -p $HOME/.vim/pack/dist/start/
fi

git clone $giturl $HOME/.vim/pack/dist/start/$packagename
