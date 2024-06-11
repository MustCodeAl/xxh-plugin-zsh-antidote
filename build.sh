#!/usr/bin/env bash

CDIR="$(cd "$(dirname "$0")" && pwd)"
build_dir=$CDIR/build

while getopts A:K:q option
do
  case "${option}"
  in
    q) QUIET=1;;
    A) ARCH=${OPTARG};;
    K) KERNEL=${OPTARG};;
  esac
done

rm -rf $build_dir
mkdir -p $build_dir


#---

cp ~/.zsh_plugins.txt $build_dir/pluginrc.zsh

#---






for f in pluginrc.zsh
do
    cp $CDIR/$f $build_dir/
done


cd $build_dir

[ $QUIET ] && arg_q='-q' || arg_q=''
[ $QUIET ] && arg_s='-s' || arg_s=''
[ $QUIET ] && arg_progress='' || arg_progress='--show-progress'
#


antidote_home=$build_dir/.antidote




if [ -x "$(command -v git)" ]; then
  git clone $arg_q --depth 1 $arg_progress https://github.com/mattmc3/antidote.git $antidote_home
else
  echo You should install git: https://duckduckgo.com/?q=install+git+on+linux
  exit 1
fi
